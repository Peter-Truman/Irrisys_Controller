/**
 * IRRISYS - Menu System with EEPROM Integration
 * Working stable version with 32MHz operation
 */
// This commit is - just starting on menu timeout

#define BUILD_VERSION 6  // Fix timing - wait for display board init

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
#include "../include/eeprom.h"
#include "../include/i2c.h"
#include "../include/rtc.h"
#include "../include/pca9535.h"
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
extern void menu_draw_utility(void);

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

// =============================================================================
// UART Functions
// Ver_B_Rev_1: EUSART2 (RB6/RB7) for debug, EUSART1 (RC6) for display
// =============================================================================

void uart_init(void)
{
    // =============================================================================
    // EUSART2 - Debug Serial (RB6=TX, RB7=RX) @ 9600 baud
    // =============================================================================
    TRISBbits.TRISB6 = 0; // TX2 pin as output
    TRISBbits.TRISB7 = 1; // RX2 pin as input

    TXSTA2 = 0b00100100;   // TX enabled, BRGH=1 (high speed)
    RCSTA2 = 0b10010000;   // Serial port enabled, RX enabled
    BAUDCON2 = 0b00001000; // BRG16=1 (16-bit baud rate generator)

    // 9600 baud @ 32MHz: SPBRG = (32000000 / (4 * 9600)) - 1 = 832
    SPBRG2 = 0x40;   // Low byte of 832 (0x340)
    SPBRGH2 = 0x03;  // High byte of 832

    // =============================================================================
    // EUSART1 - Display Serial (RC6=TX) @ 19200 baud
    // =============================================================================
    TRISCbits.TRISC6 = 0; // TX1 pin as output
    TRISCbits.TRISC7 = 1; // RX1 pin as input (not currently used)

    TXSTA1 = 0b00100100;   // TX enabled, high speed
    RCSTA1 = 0b10010000;   // Serial port enabled, RX enabled
    BAUDCON1 = 0b00001000; // 16-bit baud rate generator

    // 19200 baud @ 32MHz: SPBRG = (32000000 / (4 * 19200)) - 1 = 416
    SPBRG1 = 0xA0;  // Low byte of 416
    SPBRGH1 = 0x01; // High byte of 416
}

void uart_write(char c)
{
    // Use EUSART2 for debug output (RB6)
    while (!TXSTA2bits.TRMT)
        ;
    TXREG2 = c;
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

// =============================================================================
// Display Serial Functions (EUSART1 - RC6 @ 19200 baud)
// Protocol: [STX] [CMD] [LEN] [DATA...] [CRC16-LO] [CRC16-HI] [ETX]
// =============================================================================

#define DISP_STX 0x02
#define DISP_ETX 0x03

// Display commands
#define DISP_CMD_LINE1    '1'  // 0x31 - Text for line 1
#define DISP_CMD_LINE2    '2'  // 0x32 - Text for line 2
#define DISP_CMD_LINE3    '3'  // 0x33 - Text for line 3
#define DISP_CMD_LINE4    '4'  // 0x34 - Text for line 4
#define DISP_CMD_CLEAR    'C'  // 0x43 - Clear display
#define DISP_CMD_BRIGHT   'B'  // 0x42 - LCD Brightness (0-100)
#define DISP_CMD_CONTRAST 'K'  // 0x4B - LCD Contrast (0-100)
#define DISP_CMD_LED      'L'  // 0x4C - LED state bitmask

// Send a byte to display board via EUSART1
void disp_write(uint8_t c)
{
    while (!TXSTA1bits.TRMT)
        ;
    TXREG1 = c;
}

// Calculate Fletcher-16 checksum
uint16_t fletcher16(const uint8_t *data, uint8_t len)
{
    uint16_t sum1 = 0;
    uint16_t sum2 = 0;

    for (uint8_t i = 0; i < len; i++)
    {
        sum1 = (sum1 + data[i]) % 255;
        sum2 = (sum2 + sum1) % 255;
    }

    return (sum2 << 8) | sum1;
}

// Send a complete frame to display board
void disp_send_frame(uint8_t cmd, const uint8_t *data, uint8_t len)
{
    // Build frame buffer for CRC calculation (cmd + len + data)
    uint8_t frame[26];  // Max: 1 cmd + 1 len + 24 data
    frame[0] = cmd;
    frame[1] = len;
    for (uint8_t i = 0; i < len; i++)
    {
        frame[2 + i] = data[i];
    }

    // Calculate CRC over cmd + len + data
    uint16_t crc = fletcher16(frame, 2 + len);

    // Send frame
    disp_write(DISP_STX);
    disp_write(cmd);
    disp_write(len);
    for (uint8_t i = 0; i < len; i++)
    {
        disp_write(data[i]);
    }
    disp_write(crc & 0xFF);        // CRC low byte
    disp_write((crc >> 8) & 0xFF); // CRC high byte
    disp_write(DISP_ETX);
}

// Send text to a specific line (1-4)
void disp_print_line(uint8_t line, const char *text)
{
    if (line < 1 || line > 4) return;

    uint8_t cmd = '0' + line;  // '1', '2', '3', or '4'
    uint8_t len = 0;

    // Count length (max 20 chars)
    while (text[len] && len < 20)
    {
        len++;
    }

    disp_send_frame(cmd, (const uint8_t *)text, len);
}

// Clear display
void disp_clear(void)
{
    disp_send_frame(DISP_CMD_CLEAR, NULL, 0);
}

// Set brightness (0-100%)
void disp_set_brightness(uint8_t percent)
{
    if (percent > 100) percent = 100;
    disp_send_frame(DISP_CMD_BRIGHT, &percent, 1);
}

// Set contrast (0-100%)
void disp_set_contrast(uint8_t percent)
{
    if (percent > 100) percent = 100;
    disp_send_frame(DISP_CMD_CONTRAST, &percent, 1);
}

// Set LED state (bit 0=PWR, bit 1=Signal, bit 2=Fault)
void disp_set_leds(uint8_t led_mask)
{
    disp_send_frame(DISP_CMD_LED, &led_mask, 1);
}

// System initialization
void system_init(void)
{
    // Configure oscillator for 32MHz (8MHz HFINTOSC * 4x PLL)
    OSCCONbits.IRCF = 0b110;   // 8MHz HFINTOSC
    OSCCONbits.SCS = 0b00;     // Primary clock from config bits

    // Enable PLL (PLLEN bit in OSCTUNE)
    OSCTUNEbits.PLLEN = 1;     // Enable 4x PLL

    // Wait for oscillator stable
    while (!OSCCONbits.HFIOFS)
        ;

    // =============================================================================
    // Ver_B_Rev_1 ADC Configuration
    // =============================================================================
    // Configure ADC: RA0, RA1, RA2 as analog inputs, rest digital
    ANSELA = 0x07;  // RA0, RA1, RA2 as analog (AN0, AN1, AN2)
    ANSELB = 0x00;  // All PORTB digital
    ANSELC = 0x00;  // All PORTC digital

    LATA = 0;
    LATB = 0;
    LATC = 0;

    // =============================================================================
    // Buzzer Configuration (RC0 - Active High)
    // =============================================================================
    BUZZER_TRIS = 0;
    BUZZER = 0;

    // =============================================================================
    // Encoder Configuration (RB1=A, RB2=B, RB3=SW)
    // =============================================================================
    ENC_A_TRIS = 1;   // ENC_A input
    ENC_B_TRIS = 1;   // ENC_B input
    ENC_SW_TRIS = 1;  // ENC_SW input (RB3)

    // =============================================================================
    // RTC Interrupt (RB0)
    // =============================================================================
    RTC_INT_TRIS = 1; // RTC 1Hz square wave input

    INTCON2bits.RBPU = 0; // Enable PORTB pull-ups

    // =============================================================================
    // Digital Inputs (RA4-RA7 - Active High)
    // =============================================================================
    DIG_IN1_TRIS = 1; // RA4 - Running/Stopped
    DIG_IN2_TRIS = 1; // RA5 - PNP1
    DIG_IN3_TRIS = 1; // RA6 - PNP2
    DIG_IN4_TRIS = 1; // RA7 - PNP3

    // =============================================================================
    // Relay Outputs (RB5 primary, RB4 secondary - Active High)
    // =============================================================================
    RELAY1_TRIS = 0;  // RB5 output - primary relay
    RELAY1_PIN = 0;   // Start with relay OFF (active high, 0 = off)
    RELAY2_TRIS = 0;  // RB4 output - secondary relay (not used)
    RELAY2_PIN = 0;   // Start off

    // =============================================================================
    // EEPROM Write Protect (RC2 - Active Low)
    // =============================================================================
    EEPROM_WP_TRIS = 0;
    EEPROM_WP = 0;    // Write protect enabled (low)
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

        RELAY1_PIN = 1; // ENERGIZE relay (active high, 1 = ON)
    }
}

// Function to manually close relay (clear fault/latch)
void relay_close(void)
{
    if (relay_state == 1)
    {
        relay_state = 0;
        relay_counter = 0;
        RELAY1_PIN = 0; // DE-ENERGIZE relay (active high, 0 = OFF)
        uart_println("Relay DE-ENERGIZED - fault cleared");
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

    // Debug: 1Hz tick-tock with buzzer to verify MCU is running
    // Buzzer will beep even if serial isn't working
    for (uint8_t i = 0; i < 5; i++)
    {
        BUZZER = 1;
        __delay_ms(50);
        BUZZER = 0;

        // Try sending a simple character directly
        while (!TXSTA2bits.TRMT);  // Wait for transmit buffer empty
        TXREG2 = (i % 2) ? 'T' : 't';
        while (!TXSTA2bits.TRMT);
        TXREG2 = '\r';
        while (!TXSTA2bits.TRMT);
        TXREG2 = '\n';

        __delay_ms(950);
    }

    uart_println("Serial OK!");

    // =============================================================================
    // Test display serial communication
    // =============================================================================
    uart_println("Testing display serial (EUSART1)...");

    // Wait for display board to complete initialization
    // Display board has: 500ms power delay + LCD init + LED test + 1000ms ready delay
    // Total ~3 seconds - wait 4 seconds to be safe
    uart_println("Waiting 4 seconds for display board...");
    __delay_ms(4000);

    // Send test messages to display board
    disp_clear();
    __delay_ms(50);

    disp_print_line(1, "====================");
    __delay_ms(20);
    disp_print_line(2, " Mainboard Control  ");
    __delay_ms(20);
    disp_print_line(3, "   Serial Test OK   ");
    __delay_ms(20);
    disp_print_line(4, "====================");

    uart_println("Display test frames sent");

    // Test LED control
    __delay_ms(500);
    disp_set_leds(0x01);  // PWR LED on
    uart_println("LED: PWR on");
    __delay_ms(500);
    disp_set_leds(0x03);  // PWR + Signal on
    uart_println("LED: PWR + Signal on");
    __delay_ms(500);
    disp_set_leds(0x07);  // All on
    uart_println("LED: All on");
    __delay_ms(500);
    disp_set_leds(0x01);  // Back to PWR only
    uart_println("LED: PWR only");

    uart_println("Display serial test complete");

    uart_println("=== SYSTEM STARTUP ===");
    char buf[50];
    sprintf(buf, "Build: %d", BUILD_VERSION);
    uart_println(buf);
    sprintf(buf, "After init: relay_state=%d, counter=%d", relay_state, relay_counter);
    uart_println(buf);

    // Initialize I2C bus
    uart_println("Initializing I2C...");
    i2c_init();
    uart_println("I2C initialized");

    // Initialize PCA9535 I/O Expander (LEDs) - run Knight Rider ASAP for visual feedback
    pca9535_init();
    pca9535_led_init();
    pca9535_led_test(); // Knight Rider sequence (~4 seconds)

    // Initialize RTC (includes 2-second power-up delay)
    uart_println("Initializing RTC (2-second delay)...");
    if (rtc_init() == 0)
    {
        uart_println("RTC initialized - 1Hz square wave enabled");

        // Check OSF (Oscillator Stop Flag) in status register
        uint8_t status;
        if (rtc_read_register(0x0F, &status) == 0)
        {
            char buf[50];
            sprintf(buf, "RTC Status Register: 0x%02X", status);
            uart_println(buf);

            if (status & 0x80)
            {
                uart_println("WARNING: Oscillator Stop Flag is SET!");
            }
        }
    }
    else
    {
        uart_println("ERROR: RTC initialization failed!");
    }

    /*
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
     */

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

    lcd_clear();
    lcd_set_cursor(0, 0);
    lcd_print("IRRISYS v1.0");
    lcd_set_cursor(1, 0);
    lcd_print("Initializing...");

    beep(100);
    __delay_ms(100);
    beep(100);

    //__delay_ms(2000);

    // Start with OPTIONS menu (default behavior)
    extern uint8_t current_menu;
    current_menu = 255;   // 255 = Main screen (not in menus
    menu.total_items = 5; // OPTIONS menu has 5 items

    menu_draw_options(); // Draw OPTIONS menu instead

    // Main loop variables
    int16_t last_encoder = 0;
    uint8_t last_button = 0;
    static uint32_t blink_timer = 0;
    static uint16_t encoder_activity_timer = 0; // Track encoder activity

    static uint32_t last_second_update = 0;
    uint16_t adc_ch1, adc_ch2, adc_ch3;
    uint8_t dig_in1, dig_in2, dig_in3, dig_in4;
    rtc_time_t current_time;

    // Main loop starts here
    while (1)
    {

        // Sample ADC and Digital Inputs every 10th loop iteration (~500ms)
        static uint8_t sample_counter = 0;
        static uint8_t second_counter = 0;
        sample_counter++;

        if (sample_counter >= 10)
        {
            sample_counter = 0;

            // Read all 3 ADC channels in synchronized set (~3ms total)
            ad7994_read_all(&adc_ch1, &adc_ch2, &adc_ch3);

            // Read digital inputs (RA4-RA7 - Active High)
            dig_in1 = DIG_IN1_PORT;  // RA4 - Running/Stopped
            dig_in2 = DIG_IN2_PORT;  // RA5 - PNP1
            dig_in3 = DIG_IN3_PORT;  // RA6 - PNP2
            dig_in4 = DIG_IN4_PORT;  // RA7 - PNP3

            // Clean status line once per second (every 2nd sample)
            second_counter++;
            if (second_counter >= 2)
            {
                second_counter = 0;

                // Read RTC for timestamp
                if (rtc_read_time(&current_time) == 0)
                {
                    char status_buf[100];
                    sprintf(status_buf, "Time: %02u:%02u:%02u | ADC: Ch1=%4u Ch2=%4u Ch3=%4u | DIG: D1=%u D2=%u D3=%u D4=%u",
                            current_time.hours, current_time.minutes, current_time.seconds,
                            adc_ch1, adc_ch2, adc_ch3,
                            dig_in1, dig_in2, dig_in3, dig_in4);
                    uart_println(status_buf);
                }
            }
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

            last_encoder = encoder_count;

            // Track encoder activity - reset timer on movement
            encoder_activity_timer = 10; // 10 iterations × 50ms = 500ms

            // Force blink state ON during encoder movement for better visibility
            if (menu.in_edit_mode)
            {
                menu.blink_state = 1;
            }

            // Check if we're editing a field
            if (menu.in_edit_mode && current_menu == 4 && !menu.in_datetime_submenu && (menu.current_line == 4 || menu.current_line == 5 || menu.current_line == 8)) // UTILITY time fields
            {
                handle_time_rotation(delta > 0 ? 1 : -1);
                menu_update_time_value();
            }
            else if (menu.in_edit_mode && current_menu == 4 && !menu.in_datetime_submenu) // UTILITY numeric fields (Log Entries, etc)
            {
                extern void handle_utility_numeric_rotation(int8_t direction);
                handle_utility_numeric_rotation(delta);
                extern void menu_draw_utility(void);
                menu_draw_utility();
            }
            else if (menu.in_edit_mode && current_menu == 4 && menu.in_datetime_submenu) // Date/Time editing
            {
                extern void handle_datetime_rotation(int8_t direction);
                handle_datetime_rotation(delta);
                menu_draw_utility();
            }
            else if (menu.in_edit_mode && current_menu == 1)
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
            else if (menu.in_edit_mode && current_menu == 4) // Date/Time editing
            {
                extern void handle_datetime_rotation(int8_t direction);
                handle_datetime_rotation(delta);
                menu_draw_utility(); // Immediate update
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

                // Check if we're on main screen (for short press)
                if (current_menu == 255)
                {
                    if (current_event == 1) // Short press
                    {
                        // Check if power failure flag is set
                        extern system_config_t system_config;
                        extern void save_current_config(void);

                        if (system_config.power_failure_flag == 1)
                        {
                            // Clear power failure flag and save to EEPROM
                            system_config.power_failure_flag = 0;
                            save_current_config();
                            uart_println("Power failure flag cleared and saved");
                            beep(50);
                            __delay_ms(50);
                            beep(50); // Double beep to confirm
                        }
                        else
                        {
                            // Normal operation - enter OPTIONS menu
                            current_menu = 0; // Enter OPTIONS menu
                            menu.current_line = 0;
                            menu.top_line = 0;
                            menu.total_items = 5;
                            menu_draw_options();
                            beep(50);
                        }
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

            // Auto-save removed - user must explicitly select "Save" in menus
            if (save_pending)
            {
                uart_println("WARNING: Exited to main screen with unsaved changes");
                save_pending = 0; // Clear the flag
            }
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
                    case 4: // UTILITY menu
                        if (!menu.in_datetime_submenu && (menu.current_line == 4 || menu.current_line == 5 || menu.current_line == 8)) // Menu T/O, Pwr Detect, and Rly Pulse - time fields
                        {
                            menu_update_time_value();
                        }
                        else
                        {
                            menu_draw_utility();
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

        if (current_menu < 5) // Include UTILITY menu (4)
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

                // Discard any unsaved changes
                if (save_pending)
                {
                    uart_println("Timeout - discarding unsaved changes");
                    save_pending = 0;
                }

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

        // Update power LED status (solid ON or flashing at 1Hz based on power_failure_flag)
        pca9535_update_power_led();

        // Auto-save removed - user must explicitly select "Save" menu item
        // save_pending flag is only cleared when:
        // 1. User selects "Save" in menu (saves to EEPROM)
        // 2. User exits to main screen (discards changes)
        // 3. Menu timeout occurs (discards changes)

        // Prevent LCD corruption at high speed

        __delay_us(50);
    }
}