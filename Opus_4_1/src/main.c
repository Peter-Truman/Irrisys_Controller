/**
 * IRRISYS - Menu System with EEPROM Integration
 * Working stable version with 32MHz operation
 */
// Moved to new chat 1430

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
#include "../include/eeprom.h"
#include <stdio.h>

// External variables from encoder
extern volatile uint16_t button_hold_ms;
extern volatile uint8_t button_event;
// Function declarations for numeric editing
extern void handle_numeric_rotation(int8_t direction);
extern void menu_update_numeric_value(void);

uint8_t save_pending = 0; // Flag for deferred EEPROM saves
// Debug flag from ISR extern volatile uint8_t timeout_debug_flag;
extern volatile uint8_t timeout_debug_flag;
extern uint8_t current_input; // From menu.c

// External function declarations for numeric editing
extern void handle_numeric_rotation(int8_t direction);
extern void menu_update_numeric_value(void);

extern volatile uint8_t long_press_beep_flag; // From encoder ISR

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
    INTCON2bits.RBPU = 0; // Enable PORTB pull-ups
}

// LCD functions
void lcd_write_nibble(uint8_t nibble)
{
    if (nibble & 0x01)
        LCD_D4 = 1;
    else
        LCD_D4 = 0;
    if (nibble & 0x02)
        LCD_D5 = 1;
    else
        LCD_D5 = 0;
    if (nibble & 0x04)
        LCD_D6 = 1;
    else
        LCD_D6 = 0;
    if (nibble & 0x08)
        LCD_D7 = 1;
    else
        LCD_D7 = 0;

    LCD_EN = 1;
    __delay_us(1);
    LCD_EN = 0;
    __delay_us(50);
}

void lcd_cmd(uint8_t cmd)
{
    LCD_RS = 0;
    lcd_write_nibble(cmd >> 4);
    lcd_write_nibble(cmd & 0x0F);

    if (cmd == 0x01 || cmd == 0x02)
    {
        __delay_ms(2);
    }
    else
    {
        __delay_us(50);
    }
}

void lcd_data(uint8_t data)
{
    LCD_RS = 1;
    lcd_write_nibble(data >> 4);
    lcd_write_nibble(data & 0x0F);
    __delay_us(50);
}

void lcd_print(const char *str)
{
    while (*str)
    {
        lcd_data(*str++);
    }
}

void lcd_clear(void)
{
    lcd_cmd(0x01);
    __delay_ms(2);
}

void lcd_set_cursor(uint8_t row, uint8_t col)
{
    uint8_t address;
    switch (row)
    {
    case 0:
        address = 0x80;
        break;
    case 1:
        address = 0xC0;
        break;
    case 2:
        address = 0x94;
        break;
    case 3:
        address = 0xD4;
        break;
    default:
        address = 0x80;
        break;
    }
    lcd_cmd(address + col);
}

void lcd_init(void)
{
    // Set TRIS exactly as Positron does
    TRISA = 0x10; // %00010000
    TRISB = 0x46; // %01000110
    TRISC = 0x00; // %00000000

    // Clear all ports
    PORTA = 0;
    PORTB = 0;
    PORTC = 0;

    __delay_ms(50);

    LCD_RS = 0;

    // Force 8-bit mode three times
    lcd_write_nibble(0x03);
    __delay_ms(5);
    lcd_write_nibble(0x03);
    __delay_us(150);
    lcd_write_nibble(0x03);
    __delay_us(150);

    // Switch to 4-bit
    lcd_write_nibble(0x02);
    __delay_us(150);

    // Function set: 4-bit, 2 lines, 5x8
    lcd_cmd(0x28);
    lcd_cmd(0x08); // Display OFF - THIS IS KEY
    lcd_cmd(0x01); // Clear
    __delay_ms(2);
    lcd_cmd(0x06); // Entry mode
    lcd_cmd(0x0C); // Display ON, cursor off
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

    // For now, use a fixed 30-second timeout
    // We'll fix the EEPROM linkage later
    menu_timeout_reload = 15000; // 30 seconds * 500 = 15000

    // Don't try to access menu_timeout_seconds - it causes crashes

    uart_init();
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

    __delay_ms(1000);

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

    while (1)
    {
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
            encoder_activity_timer = 500; // Stay active for 500ms after last movement

            // Force blink state ON during encoder movement for better visibility
            if (menu.in_edit_mode)
            {
                menu.blink_state = 1;
            }

            // Check if we're editing a numeric field
            if (menu.in_edit_mode && current_menu == 1 &&
                (menu.current_line == 2 || menu.current_line == 3))
            {
                // Handle numeric rotation for Scale 4mA or Scale 20mA
                handle_numeric_rotation(delta);
            }
            else
            {
                // Use existing encoder handler for everything else
                menu_handle_encoder(delta);
            }

            if (menu.in_edit_mode && current_menu == 1)
            {
                // Check what type of field we're editing
                if (menu.current_line == 2 || menu.current_line == 3)
                {
                    // Fast update for numeric value
                    menu_update_numeric_value();
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
        }
        last_menu_state = current_menu;

        // Decrement encoder activity timer
        if (encoder_activity_timer > 0)
        {
            encoder_activity_timer--;
        }

        // Handle blinking in edit mode
        blink_timer++;
        if (blink_timer >= 10000)
        { // Slow 2Hz blinking
            blink_timer = 0;
            if (menu.in_edit_mode)
            {
                // Only blink if encoder is not active
                if (encoder_activity_timer == 0)
                {
                    menu.blink_state = !menu.blink_state;

                    // Update display for blink
                    // Update display for blink
                    if (current_menu == 1)
                    {
                        // Check what type of field we're editing
                        if (menu.current_line == 2 || menu.current_line == 3)
                        {
                            // Fast update for numeric value
                            menu_update_numeric_value();
                        }
                        else
                        {
                            // Fast update for option value
                            menu_update_edit_value();
                        }
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

        // Handle pending EEPROM saves when not in edit mode (MOVED OUTSIDE)
        // if (save_pending && !menu.in_edit_mode)
        //{
        // save_current_config();
        // save_pending = 0;
        //}

        // Prevent LCD corruption at high speed
        __delay_us(50);
    }
}