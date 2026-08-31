/**
 * IRRISYS - Interrupt-driven encoder and button handling
 *
 * Button behavior:
 *   - Press detected -> short beep (50ms)
 *   - Debounce 20ms
 *   - Timer starts counting hold duration
 *   - Release before 500ms -> short press (button_event = 1)
 *   - Hold >= 500ms -> long press beep (300ms), button_event = 2
 *   - Non-blocking: after long press fires, ignore button until released
 */

#include "../include/config.h"
#include "../include/encoder.h"

// Global variables for encoder
volatile int16_t encoder_count = 0;
volatile uint8_t button_pressed = 0;      // Flag: button event ready for main loop
volatile uint16_t button_hold_ms = 0;     // Current hold duration (live counter)
volatile uint16_t button_hold_captured = 0; // Hold time at moment of event (for main to read)
volatile uint8_t button_event = 0;        // 0=none, 1=short, 2=long

// Button state machine
#define BTN_IDLE        0
#define BTN_DEBOUNCING  1
#define BTN_HELD        2
#define BTN_LONG_FIRED  3  // Long press already handled, waiting for release
#define BTN_RELEASE_DEBOUNCE 4  // Debouncing release to prevent false re-trigger

volatile uint8_t button_state = BTN_IDLE;
volatile uint8_t short_beep_flag = 0;     // Signal main to do short beep (50ms)
volatile uint8_t long_beep_flag = 0;      // Signal main to do long beep (300ms)

// Long press threshold
#define LONG_PRESS_MS 1000  // 1 second

// Menu timeout management
volatile uint16_t menu_timeout_timer = 0;  // Countdown timer (in 2ms units)
volatile uint8_t menu_timeout_flag = 1;    // 1=OK, 0=timeout occurred
volatile uint8_t ms_counter = 0;           // Count milliseconds for 2ms timing
volatile uint16_t menu_timeout_reload = 0; // Store the reload value (set from main)
// Debug flag for timeout (defined here, used in main)
volatile uint8_t timeout_debug_flag = 0;
volatile uint8_t long_press_beep_flag = 0; // Legacy - keeping for compatibility
volatile uint16_t encoder_ms_timer = 0;   // Free-running ms counter for acceleration

// Relay pulse countdown (defined in main.c)
extern volatile uint8_t relay_state;
extern volatile uint16_t relay_counter;
static uint8_t relay_ms_counter = 0;

// ISR state variables
static uint8_t enc_state = 0;
static int8_t enc_accumulator = 0;
static uint8_t btn_debounce = 0;
static uint8_t last_btn = 1;

extern volatile uint8_t relay_latch_mode;

// RTC 1Hz tick COUNT and 50ms sub-tick flag (set in ISR, consumed in main loop)
volatile uint8_t rtc_tick_count = 0;

// Watch Dog edge capture - see encoder.h for why this lives in the ISR.
volatile uint8_t dig_edge_rise[3] = {0, 0, 0};
volatile uint8_t dig_edge_fall[3] = {0, 0, 0};
volatile uint8_t subtick_flag = 0;
static uint8_t subtick_counter = 0;

// [R3] Non-blocking buzzer sequencer state (1ms resolution, driven by Timer0
// ISR). beep()/beep_double() in main.c load these and return immediately.
volatile uint16_t buzzer_ms = 0;       // remaining ms in the current phase
volatile uint16_t buzzer_on_ms = 0;    // ON duration (reused for the repeat)
volatile uint16_t buzzer_off_ms = 0;   // gap duration between beeps
volatile uint8_t buzzer_repeats = 0;   // additional beeps still queued
volatile uint8_t buzzer_phase = 0;     // 0=idle, 1=ON, 2=gap
extern volatile uint8_t alarm_buzz_phase;  // alarm pattern OWNS BUZZER when > 0

// Quadrature state machine lookup table
static const int8_t enc_table[16] = {
    0, -1, 1, 0,
    1, 0, 0, -1,
    -1, 0, 0, 1,
    0, 1, -1, 0};

// [R4] High-priority ISR — RTC 1Hz tick (INT0). Kept minimal so the
// safety-critical 1Hz tick is serviced immediately and can preempt the longer
// Timer0 (low-priority) ISR. This is the tick that drives bypass countdowns.
void __interrupt(high_priority) isr_high(void)
{
    if (INTCONbits.INT0IF)
    {
        INTCONbits.INT0IF = 0;
        // [C1] Count ticks (saturating); the main loop drains them so no
        // elapsed second is ever lost.
        if (rtc_tick_count < 255) rtc_tick_count++;
    }
}

// Low-priority ISR — Timer0 1ms: encoder decode, button FSM, 50ms subtick,
// menu-timeout countdown.
void __interrupt(low_priority) isr_low(void)
{
    if (INTCONbits.TMR0IF)
    {
        // Reload timer for 1ms @ 32MHz
        TMR0L = 6;
        INTCONbits.TMR0IF = 0;

        relay_ms_counter++;
        if (relay_ms_counter >= 10)
        {
            relay_ms_counter = 0;

            // Relay pulse logic handled in main loop 1-second tick
        }

        // Free-running ms counter for encoder acceleration
        if (encoder_ms_timer < 65535) encoder_ms_timer++;

        // --- Watch Dog edge capture -------------------------------
        // Latch both directions for all three digital inputs. No
        // debounce: a bouncing reed switch just produces extra kicks,
        // and an extra kick on a retriggerable timer is harmless.
        {
            static uint8_t dig_prev[3] = {0, 0, 0};
            uint8_t now[3];
            now[0] = DIG_IN2_PORT ? 1 : 0;
            now[1] = DIG_IN3_PORT ? 1 : 0;
            now[2] = DIG_IN4_PORT ? 1 : 0;
            for (uint8_t i = 0; i < 3; i++)
            {
                if (now[i] != dig_prev[i])
                {
                    if (now[i]) dig_edge_rise[i] = 1;
                    else        dig_edge_fall[i] = 1;
                    dig_prev[i] = now[i];
                }
            }
        }

        // [R3] Non-blocking buzzer sequencer (1ms resolution). While an alarm
        // pattern is running (alarm_buzz_phase > 0) it owns the BUZZER pin, so
        // never drive the pin here — just run the timing down.
        if (buzzer_phase && buzzer_ms > 0)
        {
            buzzer_ms--;
            if (buzzer_ms == 0)
            {
                if (buzzer_phase == 1)              // end of an ON phase
                {
                    if (alarm_buzz_phase == 0) BUZZER = 0;
                    if (buzzer_repeats > 0)
                    {
                        buzzer_phase = 2;           // -> gap
                        buzzer_ms = buzzer_off_ms;
                    }
                    else
                    {
                        buzzer_phase = 0;           // done
                    }
                }
                else                                // end of gap -> next beep
                {
                    buzzer_repeats--;
                    if (alarm_buzz_phase == 0) BUZZER = 1;
                    buzzer_phase = 1;
                    buzzer_ms = buzzer_on_ms;
                }
            }
        }

        // Menu timeout countdown (every 2ms)
        ms_counter++;
        if (ms_counter >= 2)
        {
            ms_counter = 0;
            if (menu_timeout_timer > 0)
            {
                menu_timeout_timer--;

                // DEBUG: Show timeout countdown every second (500 * 2ms = 1 second)
                if (menu_timeout_timer % 500 == 0)
                {
                    // Set a debug flag to print in main (can't print from ISR)
                    timeout_debug_flag = 1;
                }

                if (menu_timeout_timer == 0)
                {
                    menu_timeout_flag = 0; // Signal timeout occurred
                }
            }
        }

        // Read encoder state
        uint8_t new_state = ((ENC_A << 1) | ENC_B) & 0x03;
        uint8_t combined = (enc_state << 2) | new_state;

        // Accumulate transitions
        enc_accumulator += enc_table[combined];

        // On detent position (state 00), update count
        if (new_state == 0x00)
        {
            if (enc_accumulator >= 4)
            {
                encoder_count++;
                enc_accumulator = 0;

                // Reset timeout on encoder movement
                if (menu_timeout_reload > 0)
                {
                    menu_timeout_timer = menu_timeout_reload;
                    menu_timeout_flag = 1;
                }
            }
            else if (enc_accumulator <= -4)
            {
                encoder_count--;
                enc_accumulator = 0;

                // Reset timeout on encoder movement
                if (menu_timeout_reload > 0)
                {
                    menu_timeout_timer = menu_timeout_reload;
                    menu_timeout_flag = 1;
                }
            }
        }

        enc_state = new_state;

        // =============================================================
        // Button State Machine (active low: 0=pressed, 1=released)
        // =============================================================
        uint8_t btn = ENC_SW;

        switch (button_state)
        {
        case BTN_IDLE:
            // Waiting for button press
            if (btn == 0)
            {
                // Button just pressed - start debounce
                btn_debounce = 0;
                button_state = BTN_DEBOUNCING;
            }
            break;

        case BTN_DEBOUNCING:
            // Debouncing press - wait for stable LOW
            if (btn == 0)
            {
                btn_debounce++;
                if (btn_debounce >= 20)
                {
                    // Debounce complete - button confirmed pressed
                    button_state = BTN_HELD;
                    button_hold_ms = 0;
                    button_event = 0;
                    short_beep_flag = 1;  // Immediate short beep on press

                    // Reset menu timeout on button press
                    if (menu_timeout_reload > 0)
                    {
                        menu_timeout_timer = menu_timeout_reload;
                        menu_timeout_flag = 1;
                    }
                }
            }
            else
            {
                // Button released during debounce - false trigger
                button_state = BTN_IDLE;
            }
            break;

        case BTN_HELD:
            // Button is held - count duration
            if (btn == 0)
            {
                // Still held - increment timer
                if (button_hold_ms < 65535)
                {
                    button_hold_ms++;
                }

                // Check for long press threshold
                if (button_hold_ms >= LONG_PRESS_MS)
                {
                    // Long press detected!
                    button_hold_captured = button_hold_ms;  // Save for main
                    button_event = 2;
                    button_pressed = 1;
                    long_beep_flag = 1;   // 300ms beep
                    button_state = BTN_LONG_FIRED;  // Don't fire again
                }
            }
            else
            {
                // Button released before long press threshold = SHORT press
                button_hold_captured = button_hold_ms;  // Save for main
                if (button_hold_ms >= 20)  // Ignore very short bounces
                {
                    button_event = 1;
                    button_pressed = 1;
                }
                // Go to release debounce to prevent false re-trigger
                btn_debounce = 0;
                button_state = BTN_RELEASE_DEBOUNCE;
            }
            break;

        case BTN_LONG_FIRED:
            // Long press already handled - wait for release
            if (btn == 1)
            {
                // Button released - debounce the release
                btn_debounce = 0;
                button_state = BTN_RELEASE_DEBOUNCE;
            }
            // While still held, do nothing (non-blocking)
            break;

        case BTN_RELEASE_DEBOUNCE:
            // Debouncing release - wait for stable HIGH
            if (btn == 1)
            {
                btn_debounce++;
                if (btn_debounce >= 30)  // 30ms release debounce
                {
                    // Release confirmed - back to idle
                    button_hold_ms = 0;
                    button_state = BTN_IDLE;
                }
            }
            else
            {
                // Button pressed again during release debounce - restart debounce
                btn_debounce = 0;
            }
            break;
        }

        // 50ms sub-tick counter (inside Timer0 1ms ISR)
        subtick_counter++;
        if (subtick_counter >= 50)
        {
            subtick_counter = 0;
            subtick_flag = 1;
        }
    }
}

void encoder_init(void)
{
    // Configure Timer0 for 1ms interrupts
    T0CON = 0b11000100; // TMR0ON, 8-bit, prescaler 1:32
    TMR0L = 6;

    // Initialize variables
    encoder_count = 0;
    button_pressed = 0;
    button_hold_ms = 0;
    button_event = 0;
    relay_ms_counter = 0; // ADD THIS LINE

    // [R4] Enable interrupt priority levels. INT0 (RTC 1Hz) is always HIGH
    // priority on PIC18; make Timer0 LOW so the safety tick preempts the longer
    // Timer0 ISR and is never delayed.
    RCONbits.IPEN = 1;
    INTCON2bits.TMR0IP = 0;   // Timer0 = low priority

    // Enable Timer0 interrupt
    INTCONbits.TMR0IF = 0;
    INTCONbits.TMR0IE = 1;

    // Enable INT0 (RB0) for RTC 1Hz falling edge
    INTCON2bits.INTEDG0 = 0;  // Falling edge trigger
    INTCONbits.INT0IF = 0;
    INTCONbits.INT0IE = 1;

    // Master enables with IPEN=1: GIEH (high) + GIEL (low). Clearing GIEH
    // elsewhere (EEPROM unlock C5, tick snapshot C1) still disables ALL
    // interrupts, so those atomic guards remain valid.
    INTCONbits.GIEH = 1;
    INTCONbits.GIEL = 1;

    // Initialize encoder state
    enc_state = ((ENC_A << 1) | ENC_B) & 0x03;
}

