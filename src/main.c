/**
 * IRRISYS - Menu System Test Framework with UART Debug
 */

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
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

void lcd_init(void)
{
    uart_println("LCD Init: Setting TRISA");
    TRISA = 0x10; // RA4 as input, all others as outputs
    PORTA = 0;
    LATA = 0;

    uart_println("LCD Init: Power-up delay");
    __delay_ms(50);

    LCD_RS = 0;
    LCD_EN = 0;

    uart_println("LCD Init: First 0x03");
    LATA = (LATA & 0xF0) | 0x03;
    LCD_EN = 1;
    __delay_us(1);
    LCD_EN = 0;
    __delay_ms(5);

    uart_println("LCD Init: Second 0x03");
    LATA = (LATA & 0xF0) | 0x03;
    LCD_EN = 1;
    __delay_us(1);
    LCD_EN = 0;
    __delay_us(150);

    uart_println("LCD Init: Third 0x03");
    LATA = (LATA & 0xF0) | 0x03;
    LCD_EN = 1;
    __delay_us(1);
    LCD_EN = 0;
    __delay_us(150);

    uart_println("LCD Init: Setting 4-bit mode 0x02");
    LATA = (LATA & 0xF0) | 0x02;
    LCD_EN = 1;
    __delay_us(1);
    LCD_EN = 0;
    __delay_us(150);

    uart_println("LCD Init: Function set 0x28");
    lcd_cmd(0x28);

    uart_println("LCD Init: Display OFF 0x08");
    lcd_cmd(0x08);

    uart_println("LCD Init: Clear display 0x01");
    lcd_cmd(0x01);
    __delay_ms(2);

    uart_println("LCD Init: Entry mode 0x06");
    lcd_cmd(0x06);

    uart_println("LCD Init: Display ON 0x0C");
    lcd_cmd(0x0C);

    uart_println("LCD Init: Complete");
}

void lcd_clear(void)
{
    lcd_cmd(0x01);
    __delay_ms(2);
}

void lcd_set_cursor(uint8_t row, uint8_t col)
{
    uint8_t pos = col;
    if (row == 1)
        pos += 0x40;
    else if (row == 2)
        pos += 0x14;
    else if (row == 3)
        pos += 0x54;
    lcd_cmd(0x80 | pos);
}

void lcd_print(const char *str)
{
    while (*str)
    {
        lcd_data(*str++);
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

// Main program
void main(void)
{
    system_init();
    uart_init();

    uart_println("\r\n=== IRRISYS Starting ===");
    uart_println("System init complete");

    lcd_init();

    uart_println("LCD Test: Writing TEST");
    lcd_cmd(0x80);
    lcd_data('T');
    lcd_data('E');
    lcd_data('S');
    lcd_data('T');

    encoder_init();
    uart_println("Encoder init complete");

    menu_init();
    uart_println("Menu init complete");

    uart_println("Writing welcome message");
    lcd_clear();
    lcd_set_cursor(0, 3);
    lcd_print("IRRISYS v1.0");
    lcd_set_cursor(1, 2);
    lcd_print("Menu Test Mode");

    uart_println("Playing startup beeps");
    beep(100);
    __delay_ms(100);
    beep(100);
    __delay_ms(100);
    beep(200);

    __delay_ms(2000);

    uart_println("Starting OPTIONS menu");
    lcd_clear();
    uint8_t current_menu = 0;
    menu_draw_options();

    int16_t last_encoder = encoder_count;
    uint32_t blink_timer = 0;
    uint8_t was_editing = 0;

    uart_println("Entering main loop");

    while (1)
    {
        // Check encoder rotation
        if (encoder_count != last_encoder)
        {
            int16_t delta = encoder_count - last_encoder;

            // Add encoder tick sound
            beep(10);

            char buf[40];
            sprintf(buf, "Encoder: %d, Delta: %d", encoder_count, delta);
            uart_println(buf);

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

            last_encoder = encoder_count;
        }

        // Check button press
        if (button_pressed)
        {
            button_pressed = 0;

            char buf[40];
            sprintf(buf, "Button event: %d", button_event);
            uart_println(buf);

            // Store edit mode state before handling button
            was_editing = menu.in_edit_mode;

            if (button_event > 0)
            {
                if (button_event == 1)
                {
                    beep(50);
                }
                else if (button_event == 2)
                {
                    beep(100);
                }
                else if (button_event == 3)
                {
                    beep(200);
                }

                menu_handle_button(button_event);

                // If we just exited edit mode, force a redraw
                if (was_editing && !menu.in_edit_mode)
                {
                    if (current_menu == 1)
                    {
                        menu_draw_input();
                    }
                }

                // Handle menu switching
                if (button_event == 1 && current_menu == 0)
                {
                    uart_println("Switching to INPUT menu");
                    current_menu = 1;
                    menu_init();
                    menu.total_items = 12;
                    lcd_clear();
                    menu_draw_input();
                }
                else if (button_event == 3)
                {
                    uart_println("Returning to OPTIONS menu");
                    current_menu = 0;
                    menu_init();
                    menu.total_items = 5;
                    lcd_clear();
                    menu_draw_options();
                }

                button_event = 0;
            }
        }

        // Handle blinking for edit mode (2Hz = slower blink)
        blink_timer++;
        if (blink_timer >= 50000)
        {
            blink_timer = 0;

            if (menu.in_edit_mode)
            {
                menu.blink_state = !menu.blink_state;
                if (current_menu == 1)
                {
                    menu_draw_input();
                }
            }
        }
    }
}