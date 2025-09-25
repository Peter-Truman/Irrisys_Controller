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
            }
            else if (enc_accumulator <= -4)
            {
                encoder_count--;
                enc_accumulator = 0;
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
                }
                else
                {
                    // Button released - determine press type
                    if (button_hold_ms >= 1800)
                    {
                        button_event = 3; // Very long
                    }
                    else if (button_hold_ms >= 900)
                    {
                        button_event = 2; // Long
                    }
                    else if (button_hold_ms >= 50)
                    {
                        button_event = 1; // Short
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
            }
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

    // Enable Timer0 interrupt
    INTCONbits.TMR0IF = 0;
    INTCONbits.TMR0IE = 1;
    INTCONbits.GIE = 1;

    // Initialize encoder state
    enc_state = ((ENC_A << 1) | ENC_B) & 0x03;
}