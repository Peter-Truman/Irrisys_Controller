/**
 * IRRISYS - Full System with Buffered LCD
 * PIC18F26K22 @ 32MHz (Ver_B_Rev_1)
 *
 * Button behavior:
 *   - Press -> immediate short beep (50ms)
 *   - Release before 1000ms -> short press event
 *   - Hold >= 1000ms -> long beep (300ms), long press event, non-blocking
 */

#define BUILD_VERSION 45  // Disable press beep (menu.c handles beeps)

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
#include "../include/eeprom.h"
#include "../include/i2c.h"
#include "../include/rtc.h"
#include "../include/pca9535.h"
#include "../include/lcd.h"
#include "ad7994.h"
#include <stdio.h>

// External variables from encoder
extern volatile uint8_t button_event;
extern volatile uint16_t button_hold_captured;

// External function declarations for menu editing
extern void handle_numeric_rotation(int8_t direction);
extern void menu_update_numeric_value(void);
extern void handle_time_rotation(int8_t direction);
extern void menu_update_time_value(void);
extern void menu_draw_utility(void);

uint8_t save_pending = 0;

// Relay pulse control
volatile uint8_t relay_state = 0;
volatile uint16_t relay_counter = 0;
volatile uint8_t relay_latch_mode = 0;

extern volatile uint8_t timeout_debug_flag;
extern uint8_t current_input;

// Function prototypes
void uart_init(void);
void uart_write(char c);
void uart_print(const char *str);
void uart_println(const char *str);
void system_init(void);
void beep(uint16_t duration_ms);

// =============================================================================
// UART Functions (EUSART2 on RB6/RB7 @ 9600 baud for debug)
// =============================================================================

void uart_init(void)
{
    // EUSART2 - Debug Serial (RB6=TX, RB7=RX) @ 9600 baud
    TRISBbits.TRISB6 = 0;
    TRISBbits.TRISB7 = 1;

    TXSTA2 = 0b00100100;
    RCSTA2 = 0b10010000;
    BAUDCON2 = 0b00001000;

    SPBRG2 = 0x40;
    SPBRGH2 = 0x03;

    // EUSART1 - Display Serial (RC6=TX) @ 19200 baud
    TRISCbits.TRISC6 = 0;
    TRISCbits.TRISC7 = 1;

    TXSTA1 = 0b00100100;
    RCSTA1 = 0b10010000;
    BAUDCON1 = 0b00001000;

    SPBRG1 = 0xA0;
    SPBRGH1 = 0x01;
}

void uart_write(char c)
{
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
// System Initialization
// =============================================================================

void system_init(void)
{
    // Configure oscillator for 32MHz
    OSCCONbits.IRCF = 0b110;
    OSCCONbits.SCS = 0b00;
    OSCTUNEbits.PLLEN = 1;

    while (!OSCCONbits.HFIOFS)
        ;

    // ADC: RA0-RA2 analog, rest digital
    ANSELA = 0x07;
    ANSELB = 0x00;
    ANSELC = 0x00;

    LATA = 0;
    LATB = 0;
    LATC = 0;

    // Buzzer (RC0)
    BUZZER_TRIS = 0;
    BUZZER = 0;

    // Encoder (RB1=A, RB2=B, RB3=SW)
    ENC_A_TRIS = 1;
    ENC_B_TRIS = 1;
    ENC_SW_TRIS = 1;

    // RTC interrupt (RB0)
    RTC_INT_TRIS = 1;

    // PORTB pull-ups
    INTCON2bits.RBPU = 0;
    WPUB = 0b00001111;

    // Digital inputs (RA4-RA7)
    DIG_IN1_TRIS = 1;
    DIG_IN2_TRIS = 1;
    DIG_IN3_TRIS = 1;
    DIG_IN4_TRIS = 1;

    // Relay outputs (RB5, RB4)
    RELAY1_TRIS = 0;
    RELAY1_PIN = 0;
    RELAY2_TRIS = 0;
    RELAY2_PIN = 0;

    // EEPROM write protect (RC2)
    EEPROM_WP_TRIS = 0;
    EEPROM_WP = 0;
}

void trigger_relay_pulse(uint8_t latch_mode)
{
    extern system_config_t system_config;

    if (relay_state == 0)
    {
        relay_state = 1;
        relay_latch_mode = latch_mode;

        if (latch_mode)
        {
            relay_counter = 0;
            uart_println("Relay OPEN - LATCHED");
        }
        else
        {
            relay_counter = system_config.relay_pulse_time * 100;
            char buf[40];
            sprintf(buf, "Relay OPEN - PULSE: %d sec", system_config.relay_pulse_time);
            uart_println(buf);
        }

        RELAY1_PIN = 1;
    }
}

void relay_close(void)
{
    if (relay_state == 1)
    {
        relay_state = 0;
        relay_counter = 0;
        RELAY1_PIN = 0;
        uart_println("Relay CLOSED");
    }
}

void beep(uint16_t duration_ms)
{
    BUZZER = 1;
    for (uint16_t i = 0; i < duration_ms; i++)
    {
        __delay_ms(1);
    }
    BUZZER = 0;
}

// =============================================================================
// Main Function
// =============================================================================

void main(void)
{
    system_init();
    uart_init();
    eeprom_init();

    // Set menu timeout
    extern volatile uint16_t menu_timeout_reload;
    extern uint8_t get_menu_timeout_seconds(void);
    menu_timeout_reload = (uint16_t)get_menu_timeout_seconds() * 500;

    uart_println("");
    uart_println("================================");
    uart_println("IRRISYS Full System");
    char buf[60];
    sprintf(buf, "Build: %d", BUILD_VERSION);
    uart_println(buf);
    uart_println("================================");

    // Initialize I2C bus
    i2c_init();

    // Initialize PCA9535 and run LED test
    pca9535_init();
    pca9535_led_init();
    pca9535_led_test();

    // Initialize RTC
    if (rtc_init() == 0)
    {
        uart_println("RTC OK");
    }
    else
    {
        uart_println("RTC FAIL");
    }

    // Initialize ADC
    uint8_t adc_error = ad7994_init();
    if (adc_error)
    {
        sprintf(buf, "ADC error: %u", adc_error);
        uart_println(buf);
    }

    // Initialize encoder and menu
    encoder_init();
    menu_init();
    lcd_init();

    uart_println("Peripherals initialized");

    // Wait for display board
    __delay_ms(2000);

    // Set power LED
    disp_set_leds(0x01);

    // Splash screen
    lcd_clear();
    lcd_set_cursor(0, 0);
    lcd_print("    IRRISYS v1.0    ");
    lcd_set_cursor(1, 0);
    sprintf(buf, "   Mainboard v%d    ", BUILD_VERSION);
    lcd_print(buf);
    lcd_set_cursor(2, 0);
    lcd_print("                    ");
    lcd_set_cursor(3, 0);
    lcd_print("  Pump Protection   ");
    lcd_flush();

    // Startup beeps
    for (uint8_t i = 0; i < 5; i++)
    {
        beep(50);
        __delay_ms(100);
    }

    __delay_ms(2000);
    beep(200);

    // Go to main screen
    extern uint8_t current_menu;
    current_menu = 255;
    lcd_clear();
    lcd_set_cursor(0, 0);
    lcd_print("MAIN SCREEN");
    lcd_set_cursor(1, 0);
    lcd_print("Ready");
    lcd_flush();

    uart_println("Ready");

    // Main loop variables
    int16_t last_encoder = 0;
    static uint32_t blink_timer = 0;
    static uint16_t encoder_activity_timer = 0;
    uint16_t adc_ch1, adc_ch2, adc_ch3;
    rtc_time_t current_time;

    while (1)
    {
        // =============================================================
        // Handle beep requests from ISR
        // =============================================================
        if (short_beep_flag)
        {
            short_beep_flag = 0;
            beep(50);
        }

        if (long_beep_flag)
        {
            long_beep_flag = 0;
            beep(300);
        }

        // =============================================================
        // Sample ADC and status (every ~500ms)
        // =============================================================
        static uint8_t sample_counter = 0;
        sample_counter++;

        if (sample_counter >= 10)
        {
            sample_counter = 0;
            ad7994_read_all(&adc_ch1, &adc_ch2, &adc_ch3);

            static uint8_t second_counter = 0;
            second_counter++;
            if (second_counter >= 2)
            {
                second_counter = 0;
                if (rtc_read_time(&current_time) == 0)
                {
                    // Periodic status can be logged here if needed
                }
            }
        }

        __delay_ms(50);

        // =============================================================
        // Handle encoder rotation
        // =============================================================
        if (encoder_count != last_encoder)
        {
            int16_t delta = encoder_count - last_encoder;
            beep(1);  // Tick sound
            last_encoder = encoder_count;
            encoder_activity_timer = 10;

            if (menu.in_edit_mode)
            {
                menu.blink_state = 1;
            }

            // Handle rotation based on current menu context
            if (menu.in_edit_mode && current_menu == 4 && !menu.in_datetime_submenu &&
                (menu.current_line == 4 || menu.current_line == 5 || menu.current_line == 8))
            {
                handle_time_rotation(delta > 0 ? 1 : -1);
                menu_update_time_value();
            }
            else if (menu.in_edit_mode && current_menu == 4 && !menu.in_datetime_submenu)
            {
                extern void handle_utility_numeric_rotation(int8_t direction);
                handle_utility_numeric_rotation(delta);
                menu_draw_utility();
            }
            else if (menu.in_edit_mode && current_menu == 4 && menu.in_datetime_submenu)
            {
                extern void handle_datetime_rotation(int8_t direction);
                handle_datetime_rotation(delta);
                menu_draw_utility();
            }
            else if (menu.in_edit_mode && current_menu == 1)
            {
                if (is_numeric_field(menu.current_line, input_config[current_input].sensor_type, input_config[current_input].flow_type))
                {
                    handle_numeric_rotation(delta);
                }
                else if (is_time_field(menu.current_line, input_config[current_input].sensor_type, input_config[current_input].flow_type))
                {
                    handle_time_rotation(delta > 0 ? 1 : -1);
                    menu_update_time_value();
                }
                else
                {
                    menu_handle_encoder(delta);
                }
            }
            else
            {
                menu_handle_encoder(delta);
            }

            // Redraw menu after rotation
            if (menu.in_edit_mode && current_menu == 1)
            {
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
                    menu_update_edit_value();
                }
            }
            else
            {
                if (current_menu == 0) menu_draw_options();
                else if (current_menu == 1) menu_draw_input();
                else if (current_menu == 2) menu_draw_setup();
            }
        }

        // =============================================================
        // Handle button events
        // =============================================================
        if (button_pressed)
        {
            button_pressed = 0;
            uint8_t evt = button_event;
            button_event = 0;

            if (current_menu == 255)
            {
                // Main screen
                if (evt == 1)
                {
                    extern system_config_t system_config;
                    extern void save_current_config(void);

                    if (system_config.power_failure_flag == 1)
                    {
                        system_config.power_failure_flag = 0;
                        save_current_config();
                        uart_println("Power failure cleared");
                        beep(50);
                        __delay_ms(50);
                        beep(50);
                    }
                    else
                    {
                        current_menu = 0;
                        menu.current_line = 0;
                        menu.top_line = 0;
                        menu.total_items = 5;
                        menu_draw_options();
                        lcd_flush();
                    }
                }
            }
            else
            {
                // In menu - pass to handler
                menu_handle_button(evt);

                // Redraw after button
                if (current_menu == 0) menu_draw_options();
                else if (current_menu == 1) menu_draw_input();
                else if (current_menu == 2) menu_draw_setup();

                lcd_flush();
            }
        }

        // =============================================================
        // Handle return to main screen
        // =============================================================
        static uint8_t last_menu_state = 0;
        if (current_menu == 255 && last_menu_state != 255)
        {
            lcd_clear();
            lcd_set_cursor(0, 0);
            lcd_print("MAIN SCREEN");
            lcd_set_cursor(1, 0);
            lcd_print("Ready");
            lcd_flush();

            if (save_pending)
            {
                uart_println("Exited without saving");
                save_pending = 0;
            }
        }
        last_menu_state = current_menu;

        // =============================================================
        // Handle blink in edit mode
        // =============================================================
        if (encoder_activity_timer > 0)
        {
            encoder_activity_timer--;
        }

        blink_timer++;
        if (blink_timer >= 10)
        {
            blink_timer = 0;
            if (menu.in_edit_mode && encoder_activity_timer == 0)
            {
                menu.blink_state = !menu.blink_state;

                switch (current_menu)
                {
                case 0:
                    menu_draw_options();
                    break;
                case 1:
                    if (is_numeric_field(menu.current_line, input_config[current_input].sensor_type, input_config[current_input].flow_type))
                        menu_update_numeric_value();
                    else if (is_time_field(menu.current_line, input_config[current_input].sensor_type, input_config[current_input].flow_type))
                        menu_update_time_value();
                    else
                        menu_draw_input();
                    break;
                case 2:
                    menu_draw_setup();
                    break;
                case 3:
                    if (menu.current_line == 2)
                        menu_update_time_value();
                    else
                        menu_draw_clock();
                    break;
                case 4:
                    if (!menu.in_datetime_submenu && (menu.current_line == 4 || menu.current_line == 5 || menu.current_line == 8))
                        menu_update_time_value();
                    else
                        menu_draw_utility();
                    break;
                }

                lcd_flush();
            }
            else
            {
                menu.blink_state = 1;
            }
        }

        // =============================================================
        // Handle menu timeout
        // =============================================================
        extern volatile uint8_t menu_timeout_flag;
        extern volatile uint16_t menu_timeout_timer;

        if (current_menu < 5 && menu_timeout_flag == 0)
        {
            uart_println("TIMEOUT - exit to main");
            beep(100);
            __delay_ms(50);
            beep(100);

            current_menu = 255;
            menu.in_edit_mode = 0;
            menu.current_line = 0;
            menu.top_line = 0;

            if (save_pending)
            {
                uart_println("Timeout - discarded");
                save_pending = 0;
            }

            lcd_clear();
            lcd_set_cursor(0, 0);
            lcd_print("MAIN SCREEN");
            lcd_set_cursor(1, 0);
            lcd_print("Timeout");
            lcd_flush();

            menu_timeout_flag = 1;
            menu_timeout_timer = 0;
        }

        // Update power LED status
        pca9535_update_power_led();

        __delay_us(50);
    }
}
