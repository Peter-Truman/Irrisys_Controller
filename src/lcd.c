// lcd.c - LCD implementation for IRRISYS Controller
// Uses PORTA: RA6=RS, RA5=RW, RA7=EN, RA0-3=D4-D7
#include "../include/config.h"
#include <xc.h>
#include <stdint.h>

// Helper function to write a nibble to LCD data pins
void lcd_write_nibble(uint8_t nibble)
{
    LCD_D4 = (nibble & 0x01) ? 1 : 0;
    LCD_D5 = (nibble & 0x02) ? 1 : 0;
    LCD_D6 = (nibble & 0x04) ? 1 : 0;
    LCD_D7 = (nibble & 0x08) ? 1 : 0;
}

// Send command to LCD (4-bit mode)
void lcd_cmd(uint8_t cmd)
{
    // Upper nibble
    lcd_write_nibble(cmd >> 4);
    LCD_RS = 0; // Command mode
    LCD_RW = 0; // Write mode
    LCD_EN = 1; // Enable high
    __delay_us(1);
    LCD_EN = 0; // Enable low
    __delay_us(50);

    // Lower nibble
    lcd_write_nibble(cmd & 0x0F);
    LCD_RS = 0; // Command mode
    LCD_RW = 0; // Write mode
    LCD_EN = 1; // Enable high
    __delay_us(1);
    LCD_EN = 0; // Enable low

    // Longer delay for clear and home commands
    if (cmd == 0x01 || cmd == 0x02)
    {
        __delay_ms(2);
    }
    else
    {
        __delay_us(50);
    }
}

// Send data to LCD (4-bit mode)
void lcd_data(uint8_t data)
{
    // Upper nibble
    lcd_write_nibble(data >> 4);
    LCD_RS = 1; // Data mode
    LCD_RW = 0; // Write mode
    LCD_EN = 1; // Enable high
    __delay_us(1);
    LCD_EN = 0; // Enable low
    __delay_us(50);

    // Lower nibble
    lcd_write_nibble(data & 0x0F);
    LCD_RS = 1; // Data mode
    LCD_RW = 0; // Write mode
    LCD_EN = 1; // Enable high
    __delay_us(1);
    LCD_EN = 0; // Enable low
    __delay_us(50);
}

// Initialize LCD in 4-bit mode
void lcd_init(void)
{
    // Configure LCD pins as outputs (PORTA only - don't touch TRISC!)
    TRISA &= 0xF0;        // RA0-RA3 as outputs (data)
    TRISAbits.TRISA5 = 0; // RA5 = RW output
    TRISAbits.TRISA6 = 0; // RA6 = RS output
    TRISAbits.TRISA7 = 0; // RA7 = EN output

    // Clear LCD control pins
    LCD_RS = 0;
    LCD_RW = 0;
    LCD_EN = 0;
    lcd_write_nibble(0);

    // Wait for LCD power-up
    __delay_ms(50);

    // Initialize sequence for 4-bit mode
    lcd_write_nibble(0x3);
    LCD_RS = 0;
    LCD_RW = 0;
    LCD_EN = 1;
    __delay_us(1);
    LCD_EN = 0;
    __delay_ms(5);

    lcd_write_nibble(0x3);
    LCD_EN = 1;
    __delay_us(1);
    LCD_EN = 0;
    __delay_ms(1);

    lcd_write_nibble(0x3);
    LCD_EN = 1;
    __delay_us(1);
    LCD_EN = 0;
    __delay_ms(1);

    // Set to 4-bit mode
    lcd_write_nibble(0x2);
    LCD_EN = 1;
    __delay_us(1);
    LCD_EN = 0;
    __delay_ms(1);

    // Function set: 4-bit, 2 lines, 5x8 font
    lcd_cmd(0x28);

    // Display on, cursor off, blink off
    lcd_cmd(0x0C);

    // Clear display
    lcd_cmd(0x01);

    // Entry mode: increment, no shift
    lcd_cmd(0x06);
}

// Set cursor position (matches main.c function name)
void lcd_set_cursor(uint8_t row, uint8_t col)
{
    uint8_t addr;

    switch (row)
    {
    case 0:
        addr = 0x00 + col;
        break;
    case 1:
        addr = 0x40 + col;
        break;
    case 2:
        addr = 0x94 + col;
        break;
    case 3:
        addr = 0xD4 + col;
        break;
    default:
        addr = 0x00;
        break;
    }

    lcd_cmd(0x80 | addr);
}

// Write a string to LCD (matches main.c function name)
void lcd_print(const char *str)
{
    while (*str)
    {
        lcd_data(*str++);
    }
}

// Clear LCD screen
void lcd_clear(void)
{
    lcd_cmd(0x01);
    __delay_ms(2);
}