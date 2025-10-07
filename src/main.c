/**
 * IRRISYS - Menu System with EEPROM Integration
 * Working stable version with 32MHz operation
 */
// Moved to new chat 1430

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
#include "../include/eeprom.h"
#include "../include/i2c.h"
#include "../include/rtc.h"
#include "ad7994.h"
#include <stdio.h>

// External variables from encoder
extern volatile uint16_t button_hold_ms;
extern volatile uint8_t button_event;

// External function declarations for menu editing
extern void handle_numeric_rotation(int8_t direction);
extern void menu_update_numeric_value(void);
extern void handle_time_rotation(int8_t direction);
extern void menu_update_time_value(void);

uint8_t save_pending = 0;
// Relay pulse control
volatile uint8_t relay_state = 0;    // 0=idle, 1=pulsing
volatile uint16_t relay_counter = 0; // Countdown in 10ms ticks
extern volatile uint8_t timeout_debug_flag;
extern uint8_t current_input;
extern volatile uint8_t long_press_beep_flag;

volatile uint8_t relay_latch_mode = 0; // 0=pulse, 1=latch

// Function prototypes
void uart_init(void);
void uart_write(char c);
void uart_print(const char *str);
void uart_println(const char *str);
void system_init(void);
void lcd_init(void);
void lcd_cmd(uint8_t cmd);
void lcd_data(uint8_t data);
void lcd_write_nibble(uint8_t nibble);
void lcd_print(const char *str);
void lcd_clear(void);
void lcd_set_cursor(uint8_t row, uint8_t col);
void beep(uint16_t duration_ms);

// UART functions
void uart_init(void)
{
    TRISCbits.TRISC6 = 0; // TX pin as output
    TRISCbits.TRISC7 = 1; // RX pin as input

    TXSTA = 0b00100100;   // TX enabled, high speed
    RCSTA = 0b10010000;   // Serial port enabled, RX enabled
    BAUDCON = 0b00001000; // 16-bit baud rate generator

    SPBRG = 68; // For 115200 baud @ 32MHz
    SPBRGH = 0;
}

void uart_write(char c)
{
    while (!TXSTAbits.TRMT)
        ;
    TXREG = c;
}

void uart_print(const char *str)
{
    while (*str)
    {
        uart_write(*str++);
    }
}

void uart_println(const char *str)
{
    uart_print(str);
    uart_write('\r');
    uart_write('\n');
}

// System initialization
void system_init(void)
{
    OSCCON = 0x70;  // 8MHz internal oscillator
    OSCTUNE = 0x40; // Enable 4x PLL (bit 6 = 1)

    while (!OSCCONbits.IOFS)
        ;

    ADCON1 = 0x0F; // All pins digital

    LATA = 0;
    LATB = 0;
    LATC = 0;

    BUZZER_TRIS = 0;
    BUZZER = 0;

    TRISBbits.TRISB1 = 1; // ENC_A input
    TRISBbits.TRISB2 = 1; // ENC_B input
    TRISBbits.TRISB6 = 1; // ENC_SW input
    TRISBbits.TRISB0 = 1; // RTC 1Hz square wave input (INT0)
    INTCON2bits.RBPU = 0; // Enable PORTB pull-ups

    TRISBbits.TRISB6 = 1; // ENC_SW input
    INTCON2bits.RBPU = 0; // Enable PORTB pull-ups

    // Configure relay output
    RELAY_TRIS = 0; // Output
    RELAY_PIN = 1;  // Start with relay off
}

void trigger_relay_pulse(uint8_t latch_mode)
{
    extern system_config_t system_config;

    char buf[60];
    sprintf(buf, "!!! trigger_relay_pulse() CALLED (latch=%d) !!!", latch_mode);
    uart_println(buf);

    if (relay_state == 0) // Only trigger if not already active
    {
        relay_state = 1;

        if (latch_mode)
        {
            // Latch mode - open and stay open (counter = 0 means infinite)
            relay_counter = 0;
            uart_println("Relay OPEN - LATCHED (waiting for button)");
        }
        else
        {
            // Pulse mode - open for specified time
            relay_counter = system_config.relay_pulse_time * 100; // Convert seconds to 10ms ticks
            sprintf(buf, "Relay OPEN - PULSE: %d sec", system_config.relay_pulse_time);
            uart_println(buf);
        }

        RELAY_PIN = 0; // OPEN relay (de-energize)
    }
}

// Function to manually close relay (clear fault/latch)
void relay_close(void)
{
    if (relay_state == 1)
    {
        relay_state = 0;
        relay_counter = 0;
        RELAY_PIN = 1; // CLOSE relay (energize)
        uart_println("Relay CLOSED - fault cleared");
    }
}

// Buzzer function
void beep(uint16_t duration_ms)
{
    BUZZER = 1;
    for (uint16_t i = 0; i < duration_ms; i++)
    {
        __delay_ms(1);
    }
    BUZZER = 0;
}

// Main function
void main(void)
{
    // Initialize hardware
    system_init();

    eeprom_init(); // Load config from EEPROM

    // Set the menu timeout reload value
    extern volatile uint16_t menu_timeout_reload;

    // Get timeout from EEPROM via getter function
    extern uint8_t get_menu_timeout_seconds(void);
    menu_timeout_reload = (uint16_t)get_menu_timeout_seconds() * 500;

    uart_init();

    uart_println("=== SYSTEM STARTUP ===");
    char buf[50];
    sprintf(buf, "After init: relay_state=%d, counter=%d", relay_state, relay_counter);
    uart_println(buf);

    // Initialize I2C bus
    uart_println("Initializing I2C...");
    i2c_init();
    uart_println("I2C initialized");

    // Initialize RTC (includes 2-second power-up delay)
    uart_println("Initializing RTC (2-second delay)...");
    if (rtc_init() == 0)
    {
        uart_println("RTC initialized - 1Hz square wave enabled");
    }
    else
    {
        uart_println("ERROR: RTC initialization failed!");
    }

    // Set RTC to a known time (ONE TIME ONLY)
    rtc_time_t set_time;
    set_time.seconds = 0;
    set_time.minutes = 0;
    set_time.hours = 12; // 12:00:00
    set_time.day = 1;    // Monday
    set_time.date = 7;   // 7th
    set_time.month = 10; // October
    set_time.year = 25;  // 2025

    if (rtc_set_time(&set_time) == 0)
    {
        uart_println("RTC time set to 2025-10-07 12:00:00");
    }
    else
    {
        uart_println("RTC time set FAILED");
    }

    uint8_t adc_error = ad7994_init();
    if (adc_error)
    {
        char buf[30];
        sprintf(buf, "ADC Init returned error: %u", adc_error);
        uart_println(buf);
    }

    encoder_init();
    menu_init();
    lcd_init();

    uart_println("=== IRRISYS Menu System ===");
    uart_println("LCD Test: Writing TEST");

    lcd_clear();
    lcd_set_cursor(0, 0);
    lcd_print("IRRISYS v1.0");
    lcd_set_cursor(1, 0);
    lcd_print("Initializing...");

    uart_println("Encoder init complete");
    uart_println("Menu init complete");
    uart_println("Writing welcome message");

    beep(100);
    __delay_ms(100);
    beep(100);

    uart_println("Playing startup beeps");
    uart_println("Starting OPTIONS menu");

    //__delay_ms(2000);

    // Start with OPTIONS menu (default behavior)
    extern uint8_t current_menu;
    current_menu = 0;     // 0 = OPTIONS menu
    menu.total_items = 5; // OPTIONS menu has 5 items

    menu_draw_options(); // Draw OPTIONS menu instead
    uart_println("Entering main loop");

    // Main loop variables
    int16_t last_encoder = 0;
    uint8_t last_button = 0;
    static uint32_t blink_timer = 0;
    static uint16_t encoder_activity_timer = 0; // Track encoder activity

    static uint32_t last_second_update = 0;
    uint16_t adc_ch1, adc_ch2, adc_ch3;
    rtc_time_t current_time;

    // Main loop starts here
    while (1)
    {

        // Sample ADC/RTC only every 10th loop iteration (not every loop)
        static uint8_t sample_counter = 0;
        sample_counter++;

        if (sample_counter >= 10)
        {
            sample_counter = 0;

            // Read RTC time
            if (rtc_read_time(&current_time) == 0)
            {
                char time_buf[60];
                sprintf(time_buf, "RTC: 20%02u-%02u-%02u %02u:%02u:%02u",
                        current_time.year, current_time.month, current_time.date,
                        current_time.hours, current_time.minutes, current_time.seconds);
                uart_println(time_buf);
            }
            else
            {
                uart_println("RTC: Read error");
            }

            // Read ADC channels (no debug output)
            adc_ch1 = ad7994_read_channel(1);
            adc_ch2 = ad7994_read_channel(2);
            adc_ch3 = ad7994_read_channel(3);

            // Print to terminal (brief format)
            char buf[50];
            sprintf(buf, "ADC: %4u %4u %4u", adc_ch1, adc_ch2, adc_ch3);
            uart_println(buf);
        }

        // ... rest of loop

        __delay_ms(50); // Update once per second

        // Display CH1 on LCD top line
        char lcd_buf[17];
        // sprintf(lcd_buf, "CH1:%4u CH2:%4u", adc_ch1, adc_ch2);
        lcd_set_cursor(0, 0);
        // lcd_print(lcd_buf);

        // sprintf(lcd_buf, "CH3:%4u %02u:%02u:%02u", adc_ch3,
        // current_time.hours, current_time.minutes, current_time.seconds);
        // lcd_set_cursor(1, 0);
        // lcd_print(lcd_buf);

        // DEBUG: Check if relay variables change
        static uint8_t last_relay_state = 0;
        static uint16_t last_relay_counter = 0;

        if (relay_state != last_relay_state || relay_counter != last_relay_counter)
        {
            char buf[60];
            sprintf(buf, "RELAY CHANGE: state=%d, counter=%d", relay_state, relay_counter);
            uart_println(buf);
            last_relay_state = relay_state;
            last_relay_counter = relay_counter;
        }

        //__delay_ms(500); // Update every 500ms
        // Check encoder rotation
        if (encoder_count != last_encoder)
        {
            int16_t delta = encoder_count - last_encoder;

            // Add encoder tick sound for all movements
            beep(1);

            char buf[40];
            sprintf(buf, "Encoder: %d, Delta: %d", encoder_count, delta);
            uart_println(buf);

            last_encoder = encoder_count;

            // Track encoder activity - reset timer on movement
            encoder_activity_timer = 10; // 10 iterations × 50ms = 500ms

            // Force blink state ON during encoder movement for better visibility
            if (menu.in_edit_mode)
            {
                menu.blink_state = 1;
            }

            // Check if we're editing a field
            if (menu.in_edit_mode && current_menu == 1)
            {
                if (is_numeric_field(menu.current_line, input_config[current_input].sensor_type, input_config[current_input].flow_type))
                {
                    // Handle numeric rotation
                    handle_numeric_rotation(delta);
                }
                else if (is_time_field(menu.current_line, input_config[current_input].sensor_type, input_config[current_input].flow_type))
                {
                    // Handle time rotation
                    handle_time_rotation(delta);
                    menu_update_time_value(); // ADD THIS - force immediate update
                }
                else
                {
                    // Handle other editable fields (Enable, Sensor, etc)
                    menu_handle_encoder(delta);
                }
            }
            else
            {
                // Use existing encoder handler for menu navigation
                menu_handle_encoder(delta);
            }

            // Redraw current menu - optimized for edit mode
            if (menu.in_edit_mode && current_menu == 1)
            {
                // Check what type of field we're editing
                if (is_numeric_field(menu.current_line, input_config[current_input].sensor_type, input_config[current_input].flow_type))
                {
                    // Fast update for numeric value
                    menu_update_numeric_value();
                }
                else if (is_time_field(menu.current_line, input_config[current_input].sensor_type, input_config[current_input].flow_type))
                {
                    // Fast update for time value
                    menu_update_time_value();
                }
                else
                {
                    // Fast update for option value (existing)
                    menu_update_edit_value();
                }
            }
            else
            {
                // Full redraw for normal navigation
                if (current_menu == 0)
                {
                    menu_draw_options();
                }
                else if (current_menu == 1)
                {
                    menu_draw_input();
                }
                else if (current_menu == 2)
                {
                    menu_draw_setup();
                }
            }
        }

        /// Check button events
        if (button_event != last_button)
        {
            if (button_event > 0)
            {
                uint8_t current_event = button_event;
                button_event = 0;

                char buf[30];
                sprintf(buf, "Button event: %d", current_event);
                uart_println(buf);

                // ADD: Handle long press FIRST
                if (current_event == 2) // Long press
                {
                    uart_println("Long press detected");

                    // Check if in edit mode
                    if (menu.in_edit_mode)
                    {
                        // Cancel edit without saving
                        menu.in_edit_mode = 0;
                        menu.blink_state = 1;
                        menu.edit_digit = 0;

                        // Reset flags
                        extern input_config_t input_config[3];
                        enable_edit_flag = input_config[current_input].enable;
                        sensor_edit_flag = input_config[current_input].sensor_type;

                        uart_println("Edit cancelled");

                        // Redraw
                        if (current_menu == 1)
                            menu_draw_input();
                    }
                    else
                    {
                        // Not in edit - navigate back
                        // Not in edit - navigate back
                        if (current_menu == 0) // OPTIONS -> Main
                        {
                            current_menu = 255; // Just set the menu state
                            uart_println("Long press - exit to main");
                        }
                        else if (current_menu == 1) // INPUT -> SETUP
                        {
                            current_menu = 2;
                            menu.current_line = 0;
                            menu.top_line = 0;
                            menu.total_items = 5;
                            menu_draw_setup();
                        }
                        else if (current_menu == 2) // SETUP -> OPTIONS
                        {
                            current_menu = 0;
                            menu.current_line = 0;
                            menu.top_line = 0;
                            menu.total_items = 5;
                            menu_draw_options();
                        }
                    }
                }
                // Check if we're on main screen (for short press)
                else if (current_menu == 255)
                {
                    if (current_event == 1) // Short press
                    {
                        current_menu = 0; // Enter OPTIONS menu
                        menu.current_line = 0;
                        menu.top_line = 0;
                        menu.total_items = 5;
                        menu_draw_options();
                        beep(50);
                    }
                }
                else
                {
                    // In a menu - pass to menu handler
                    menu_handle_button(current_event);

                    // Redraw after button action
                    if (current_menu == 0)
                        menu_draw_options();
                    else if (current_menu == 1)
                        menu_draw_input();
                    else if (current_menu == 2)
                        menu_draw_setup();
                }
            }
            last_button = button_event;
            button_event = 0;
        }

        // Check if we just returned to main screen
        static uint8_t last_menu_state = 0;
        if (current_menu == 255 && last_menu_state != 255)
        {
            // Just entered main screen - redraw it
            lcd_clear();
            lcd_set_cursor(0, 0);
            lcd_print("MAIN SCREEN");
            lcd_set_cursor(1, 0);
            lcd_print("Ready");
            uart_println("Main screen displayed");

            uart_println("Saving to EEPROM...");
            save_current_config();
            save_pending = 0;
            uart_println("EEPROM save complete");
        }
        last_menu_state = current_menu;

        // Decrement encoder activity timer
        if (encoder_activity_timer > 0)
        {
            encoder_activity_timer--;
        }

        // Handle blinking in edit mode
        blink_timer++;
        if (blink_timer >= 10)
        { // Slow 2Hz blinking
            blink_timer = 0;
            if (menu.in_edit_mode)
            {
                // Only blink if encoder is not active
                if (encoder_activity_timer == 0)
                {
                    menu.blink_state = !menu.blink_state;

                    // Update display for blink - redraw current menu
                    // Update display for blink - redraw current menu
                    switch (current_menu)
                    {
                    case 0: // OPTIONS menu
                        menu_draw_options();
                        break;
                    case 1: // INPUT menu
                    {
                        // Check what type of field we're editing
                        if (is_numeric_field(menu.current_line, input_config[current_input].sensor_type, input_config[current_input].flow_type))
                        {
                            menu_update_numeric_value();
                        }
                        else if (is_time_field(menu.current_line, input_config[current_input].sensor_type, input_config[current_input].flow_type))
                        {
                            menu_update_time_value();
                        }
                        else
                        {
                            // Option field - redraw entire menu for blinking
                            menu_draw_input();
                        }
                    }
                    break;
                    case 2: // SETUP menu
                        menu_draw_setup();
                        break;
                    case 3:                         // CLOCK menu
                        if (menu.current_line == 2) // Rly Pulse - time field
                        {
                            menu_update_time_value();
                        }
                        else
                        {
                            menu_draw_clock();
                        }
                        break;
                    }
                }
            }
            else
            {
                menu.blink_state = 1; // Always on when not editing
            }
        }

        // Check timeout debug flag from ISR
        if (timeout_debug_flag)
        {
            // ... your existing debug code ...
        }

        // ADD THIS: Actually handle the timeout!
        extern volatile uint8_t menu_timeout_flag;
        extern volatile uint16_t menu_timeout_timer;

        if (current_menu < 3) // In a menu (0=OPTIONS, 1=INPUT, 2=SETUP)
        {
            if (menu_timeout_flag == 0) // Timeout occurred
            {
                uart_println("TIMEOUT - Exiting to main screen");

                // Double beep
                beep(100);
                __delay_ms(50);
                beep(100);

                // Exit to main screen
                current_menu = 255;
                menu.in_edit_mode = 0;
                menu.current_line = 0;
                menu.top_line = 0;

                // Clear display
                lcd_clear();
                lcd_set_cursor(0, 0);
                lcd_print("MAIN SCREEN");
                lcd_set_cursor(1, 0);
                lcd_print("Timeout");

                // Reset the flag and timer
                menu_timeout_flag = 1;
                menu_timeout_timer = 0;
            }
        }

        // Check for long press beep
        if (long_press_beep_flag)
        {
            long_press_beep_flag = 0;
            beep(500); // Half second beep as feedback
            uart_println("Long press threshold reached - beep");
        }
        // Handle pending EEPROM saves...

        // // Handle pending EEPROM saves when not in edit mode (MOVED OUTSIDE)
        if (save_pending && !menu.in_edit_mode)
        {
            uart_println("Saving to EEPROM...");
            save_current_config();
            save_pending = 0;
            uart_println("EEPROM save complete");
        }

        // Prevent LCD corruption at high speed

        __delay_us(50);
    }
}