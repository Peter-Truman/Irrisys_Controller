/**
 * IRRISYS - Interrupt-driven encoder and button handling
 * Fixed version with proper button timing reset
 */

#include "../include/config.h"
#include "../include/encoder.h"

// Global variables for encoder
volatile int16_t encoder_count = 0;
volatile uint8_t button_pressed = 0;
volatile uint16_t button_hold_ms = 0;
volatile uint8_t button_event = 0;
// Menu timeout management
volatile uint16_t menu_timeout_timer = 0;  // Countdown timer (in 2ms units)
volatile uint8_t menu_timeout_flag = 1;    // 1=OK, 0=timeout occurred
volatile uint8_t ms_counter = 0;           // Count milliseconds for 2ms timing
volatile uint16_t menu_timeout_reload = 0; // Store the reload value (set from main)
// Debug flag for timeout (defined here, used in main)
volatile uint8_t timeout_debug_flag = 0;

volatile uint8_t long_press_beep_flag = 0; // Signal main loop to beep

// ISR state variables
static uint8_t enc_state = 0;
static int8_t enc_accumulator = 0;
static uint8_t btn_debounce = 0;
static uint8_t last_btn = 1;

// Quadrature state machine lookup table
static const int8_t enc_table[16] = {
    0, -1, 1, 0,
    1, 0, 0, -1,
    -1, 0, 0, 1,
    0, 1, -1, 0};

// Timer0 ISR - runs every 1ms
void __interrupt() isr(void)
{
    if (INTCONbits.TMR0IF)
    {
        // Reload timer for 1ms @ 32MHz
        TMR0L = 6;
        INTCONbits.TMR0IF = 0;

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

        // Debounce button (active low)
        uint8_t btn = ENC_SW;
        if (btn != last_btn)
        {
            btn_debounce++;
            if (btn_debounce >= 20)
            { // 20ms debounce
                last_btn = btn;
                btn_debounce = 0;

                if (btn == 0)
                {
                    // Button pressed - start timing
                    button_hold_ms = 0;
                    button_event = 0; // Clear any previous events

                    // Reset timeout on button press
                    if (menu_timeout_reload > 0)
                    {
                        menu_timeout_timer = menu_timeout_reload;
                        menu_timeout_flag = 1;
                    }
                }
                else
                {
                    // Button released - determine press type
                    if (button_hold_ms >= 1800)
                    {
                        button_event = 2; // Long press at 1800ms
                    }
                    else if (button_hold_ms >= 50)
                    {
                        button_event = 1; // Short press
                    }
                    else
                    {
                        button_event = 0; // Too short, ignore
                    }

                    button_pressed = 1;
                    button_hold_ms = 0; // Reset hold time immediately
                }
            }
        }
        else
        {
            btn_debounce = 0;
            // Count hold time while button is pressed
            if (btn == 0 && button_hold_ms < 65535)
            {
                button_hold_ms++;

                // Set flag for immediate beep at 1800ms
                if (button_hold_ms == 1800)
                {
                    long_press_beep_flag = 1; // Tell main to beep
                }
            }
        }
    }

    // Timer1 interrupt - 1 second tick for relay timer
    if (PIR1bits.TMR1IF)
    {
        PIR1bits.TMR1IF = 0; // Clear flag
        TMR1H = 0x0B;        // Reload for next second
        TMR1L = 0xDC;        // @ 32MHz with 1:8 prescaler

        // Call relay timer tick (declared extern)
        extern void relay_timer_tick(void);
        relay_timer_tick();
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

    // Enable Timer0 interrupt
    INTCONbits.TMR0IF = 0;
    INTCONbits.TMR0IE = 1;
    INTCONbits.GIE = 1;

    // Initialize encoder state
    enc_state = ((ENC_A << 1) | ENC_B) & 0x03;
}

// Function to reset timeout (callable from ISR)
void reset_menu_timeout(void)
{
    // Use a local constant or make timeout_seconds atomic
    menu_timeout_timer = 30 * 500; // Default 30 seconds * 500 = 2ms units
    menu_timeout_flag = 1;
}

// Stub function for relay timer - to be implemented in hardware phase
void relay_timer_tick(void)
{
    // TODO: Implement relay pulse timer countdown
    // This will decrement relay pulse timers when active
}