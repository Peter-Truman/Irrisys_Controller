/**
 * IRRISYS - Irrigation Pump Protection Controller
 * Main test file for menu system
 */

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
#include <xc.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#define _XTAL_FREQ 32000000 // 32MHz with PLL

// Configuration bits for PIC18F2525
#pragma config OSC = INTIO67  // Internal oscillator, port function on RA6 and RA7
#pragma config FCMEN = OFF    // Fail-Safe Clock Monitor disabled
#pragma config IESO = OFF     // Oscillator Switchover mode disabled
#pragma config PWRT = ON      // Power-up Timer enabled
#pragma config BOREN = ON     // Brown-out Reset enabled
#pragma config BORV = 3       // Brown-out voltage 2.05V
#pragma config WDT = OFF      // Watchdog Timer disabled
#pragma config WDTPS = 32768  // Watchdog Timer Postscale 1:32768
#pragma config MCLRE = ON     // MCLR pin enabled
#pragma config LPT1OSC = OFF  // Timer1 configured for higher power operation
#pragma config PBADEN = OFF   // PORTB pins configured as digital I/O on reset
#pragma config CCP2MX = PORTC // CCP2 input/output is multiplexed with RC1
#pragma config STVREN = ON    // Stack overflow reset enabled
#pragma config LVP = OFF      // Low voltage programming disabled
#pragma config XINST = OFF    // Extended instruction set disabled
#pragma config DEBUG = OFF    // Background debugger disabled
#pragma config CP0 = OFF      // Code protection off
#pragma config CP1 = OFF
#pragma config CP2 = OFF
#pragma config CPB = OFF  // Boot block code protection off
#pragma config CPD = OFF  // Data EEPROM code protection off
#pragma config WRT0 = OFF // Write protection off
#pragma config WRT1 = OFF
#pragma config WRT2 = OFF
#pragma config WRTB = OFF  // Boot block write protection off
#pragma config WRTC = OFF  // Configuration register write protection off
#pragma config WRTD = OFF  // Data EEPROM write protection off
#pragma config EBTR0 = OFF // Table read protection off
#pragma config EBTR1 = OFF
#pragma config EBTR2 = OFF
#pragma config EBTRB = OFF // Boot block table read protection off

void uart_init(void)
{
    // Configure TX (RC6) as output, RX (RC7) as input
    TRISCbits.TRISC6 = 0;
    TRISCbits.TRISC7 = 1;

    // 115200 baud at 32MHz
    TXSTA = 0x24;   // TX enabled, BRGH=1 (high speed)
    RCSTA = 0x90;   // Serial port enabled, continuous receive
    BAUDCON = 0x08; // BRG16=1 (16-bit baud rate generator)
    SPBRGH = 0;
    SPBRG = 68; // For 115200 baud at 32MHz
}

void uart_write(char c)
{
    while (!PIR1bits.TXIF)
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
    // Use the EXACT sequence that worked before
    OSCCON = 0x70;  // 8MHz internal oscillator FIRST
    OSCTUNE = 0x40; // THEN enable 4x PLL

    // Wait for oscillator to stabilize
    while (!OSCCONbits.IOFS)
        ;

    // Configure all pins as digital
    ADCON1 = 0x0F;

    // Initialize port directions
    TRISA = 0x00;
    TRISB = 0xFF;
    TRISC = 0x00;
    TRISCbits.TRISC7 = 1;

    // Enable weak pull-ups on PORTB
    INTCON2bits.RBPU = 0;

    // Clear all outputs
    LATA = 0x00;
    LATB = 0x00;
    LATC = 0x00;
}

// LCD Control Functions
void lcd_pulse_enable(void)
{
    LCD_EN = 1;
    __delay_us(1);
    LCD_EN = 0;
    __delay_us(100);
}

void lcd_write_nibble(uint8_t nibble)
{
    // Clear data bits
    LATA &= 0xF0;
    // Set new data (lower 4 bits)
    LATA |= (nibble & 0x0F);
    lcd_pulse_enable();
}

void lcd_cmd(uint8_t cmd)
{
    LCD_RS = 0; // Command mode
    lcd_write_nibble(cmd >> 4);
    lcd_write_nibble(cmd);
    __delay_ms(2);
}

void lcd_data(uint8_t data)
{
    LCD_RS = 1; // Data mode
    lcd_write_nibble(data >> 4);
    lcd_write_nibble(data);
    __delay_us(50);
}

void lcd_init(void)
{
    // LCD power-on delay
    __delay_ms(50);

    // Initialize in 4-bit mode
    LCD_RS = 0;
    LCD_EN = 0;

    // Send 0x03 three times
    lcd_write_nibble(0x03);
    __delay_ms(5);
    lcd_write_nibble(0x03);
    __delay_ms(1);
    lcd_write_nibble(0x03);
    __delay_ms(1);

    // Switch to 4-bit mode
    lcd_write_nibble(0x02);
    __delay_ms(1);

    // Function set: 4-bit, 2 lines, 5x8 font
    lcd_cmd(0x28);

    // Display on, cursor off, blink off
    lcd_cmd(0x0C);

    // Clear display
    lcd_cmd(0x01);
    __delay_ms(2);

    // Entry mode: increment, no shift
    lcd_cmd(0x06);

    // Return home
    lcd_cmd(0x02);
    __delay_ms(2);
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
    uint16_t blink_timer = 0;
    uint8_t was_editing = 0;

    uart_println("Entering main loop");

    while (1)
    {
        /*// Debug counter to help identify correct COM port
        static uint16_t loop_counter = 0;
        loop_counter++;
        if (loop_counter >= 10000) // Print every 10000 loops
        {
            loop_counter = 0;
            uart_println("Main loop running...");
        }*/

        // Check encoder rotation
        if (encoder_count != last_encoder)
        {
            int16_t delta = encoder_count - last_encoder;

            // Add encoder tick sound - commented out for better performance
            // beep(1);
            beep(1);
            char buf[40];
            sprintf(buf, "Encoder: %d, Delta: %d", encoder_count, delta);
            uart_println(buf);

            // Add debug for edit mode
            if (menu.in_edit_mode)
            {
                sprintf(buf, "Edit mode, item %d, value: %s", menu.current_line, input_menu[menu.current_line].value);
                uart_println(buf);
            }

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

        // Handle blinking for edit mode - only when in edit mode
        if (menu.in_edit_mode)
        {
            blink_timer++;
            if (blink_timer >= 50000) // Fast blinking
            {
                blink_timer = 0;
                menu.blink_state = !menu.blink_state;
                if (current_menu == 1)
                {
                    menu_draw_input();
                }
            }
        }
        else
        {
            blink_timer = 0; // Reset when not in edit mode
        }
    }
    __delay_us(200);
}
