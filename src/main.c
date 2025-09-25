/**
 * IRRISYS - Menu System with EEPROM Integration
 * Working stable version with 32MHz operation
 */

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
#include "../include/eeprom.h"
#include <stdio.h>

// External variables from encoder
extern volatile uint16_t button_hold_ms;
extern volatile uint8_t button_event;

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
    TRISA &= 0x30;
    LATA = 0;

    __delay_ms(50);

    LCD_RS = 0;

    lcd_write_nibble(0x03);
    __delay_ms(5);
    lcd_write_nibble(0x03);
    __delay_us(150);
    lcd_write_nibble(0x03);
    __delay_us(150);

    lcd_write_nibble(0x02);
    __delay_us(150);

    lcd_cmd(0x28);
    lcd_cmd(0x0C);
    lcd_cmd(0x01);
    __delay_ms(2);
    lcd_cmd(0x06);
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

    // Set menu to INPUT mode and total items for INPUT menu
    extern uint8_t current_menu;
    current_menu = 1;      // 1 = INPUT menu
    menu.total_items = 12; // INPUT menu has 12 items

    menu_draw_input();
    uart_println("Entering main loop");

    // Main loop variables
    int16_t last_encoder = 0;
    uint8_t last_button = 0;
    static uint32_t blink_timer = 0;

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

            menu_handle_encoder(delta);

            // Redraw current menu
            if (current_menu == 0)
            {
                menu_draw_options();
            }
            else
            {
                menu_draw_input();
            }
        }

        // Check button events
        if (button_event != last_button)
        {
            if (button_event > 0)
            {
                char buf[30];
                sprintf(buf, "Button event: %d", button_event);
                uart_println(buf);

                menu_handle_button(button_event);

                // Redraw after button action
                if (current_menu == 0)
                {
                    menu_draw_options();
                }
                else
                {
                    menu_draw_input();
                }
            }
            last_button = button_event;
            button_event = 0;
        }

        // Handle blinking in edit mode
        blink_timer++;
        if (blink_timer >= 50000)
        { // Slow 2Hz blinking
            blink_timer = 0;
            if (menu.in_edit_mode)
            {
                menu.blink_state = !menu.blink_state;

                // Only redraw in edit mode
                if (current_menu == 0)
                {
                    menu_draw_options();
                }
                else
                {
                    menu_draw_input();
                }
            }
            else
            {
                menu.blink_state = 1; // Always on when not editing
            }
        }

        // Prevent LCD corruption at high speed
        __delay_us(200);
    }
}