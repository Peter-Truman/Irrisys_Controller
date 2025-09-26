// lcd.c - LCD implementation for IRRISYS Controller
#include <xc.h>
#include <stdint.h>
#include <stdarg.h>
#include <stdio.h>
#include "lcd.h"
#include "config.h"

// Define _XTAL_FREQ if not already defined
#ifndef _XTAL_FREQ
#define _XTAL_FREQ  8000000     // 8MHz crystal
#endif

// Send command to LCD (4-bit mode)
void lcd_command(uint8_t cmd) {
    // Upper nibble
    PORTB = (PORTB & 0x0F) | (cmd & 0xF0);  // Keep lower bits, set upper nibble
    PORTBbits.RB0 = 0;  // RS=0 for command
    PORTBbits.RB1 = 0;  // RW=0 for write
    PORTBbits.RB2 = 1;  // EN high
    __delay_us(1);
    PORTBbits.RB2 = 0;  // EN low
    __delay_us(50);
    
    // Lower nibble
    PORTB = (PORTB & 0x0F) | ((cmd << 4) & 0xF0);
    PORTBbits.RB0 = 0;  // RS=0
    PORTBbits.RB1 = 0;  // RW=0
    PORTBbits.RB2 = 1;  // EN high
    __delay_us(1);
    PORTBbits.RB2 = 0;  // EN low
    
    // Longer delay for clear and home commands
    if (cmd == 0x01 || cmd == 0x02) {
        __delay_ms(2);
    } else {
        __delay_us(50);
    }
}

// Send data to LCD (4-bit mode)
void lcd_data(uint8_t data) {
    // Upper nibble
    PORTB = (PORTB & 0x0F) | (data & 0xF0);
    PORTBbits.RB0 = 1;  // RS=1 for data
    PORTBbits.RB1 = 0;  // RW=0 for write
    PORTBbits.RB2 = 1;  // EN high
    __delay_us(1);
    PORTBbits.RB2 = 0;  // EN low
    __delay_us(50);
    
    // Lower nibble
    PORTB = (PORTB & 0x0F) | ((data << 4) & 0xF0);
    PORTBbits.RB0 = 1;  // RS=1
    PORTBbits.RB1 = 0;  // RW=0
    PORTBbits.RB2 = 1;  // EN high
    __delay_us(1);
    PORTBbits.RB2 = 0;  // EN low
    __delay_us(50);
}

// Initialize LCD in 4-bit mode
void lcd_init(void) {
    // Configure LCD pins as outputs
    TRISB &= 0x00;  // RB0-RB7 as outputs
    PORTB = 0x00;   // Clear all pins
    
    // Wait for LCD power-up
    __delay_ms(50);
    
    // Initialize sequence for 4-bit mode
    // Send 0x30 three times
    PORTB = 0x30;
    PORTBbits.RB2 = 1;  // EN high
    __delay_us(1);
    PORTBbits.RB2 = 0;  // EN low
    __delay_ms(5);
    
    PORTB = 0x30;
    PORTBbits.RB2 = 1;
    __delay_us(1);
    PORTBbits.RB2 = 0;
    __delay_ms(1);
    
    PORTB = 0x30;
    PORTBbits.RB2 = 1;
    __delay_us(1);
    PORTBbits.RB2 = 0;
    __delay_ms(1);
    
    // Set to 4-bit mode
    PORTB = 0x20;
    PORTBbits.RB2 = 1;
    __delay_us(1);
    PORTBbits.RB2 = 0;
    __delay_ms(1);
    
    // Now we can use the command function
    // Function set: 4-bit, 2 lines, 5x8 font
    lcd_command(0x28);
    
    // Display on, cursor off, blink off
    lcd_command(0x0C);
    
    // Clear display
    lcd_command(0x01);
    
    // Entry mode: increment, no shift
    lcd_command(0x06);
}

// Set cursor position
void lcd_goto(uint8_t x, uint8_t y) {
    uint8_t addr;
    
    // Calculate DDRAM address based on line
    switch(y) {
        case 0: addr = 0x00 + x; break;  // Line 1
        case 1: addr = 0x40 + x; break;  // Line 2
        case 2: addr = 0x14 + x; break;  // Line 3 (20x4 LCD)
        case 3: addr = 0x54 + x; break;  // Line 4 (20x4 LCD)
        default: addr = 0x00; break;
    }
    
    lcd_command(0x80 | addr);
}

// Write a character to LCD
void lcd_putc(char c) {
    lcd_data(c);
}

// Write a string to LCD
void lcd_puts(const char* s) {
    while (*s) {
        lcd_putc(*s++);
    }
}

// Clear LCD screen
void lcd_clear(void) {
    lcd_command(0x01);
    __delay_ms(2);  // Clear command needs extra time
}

// Simple printf for LCD (limited implementation)
void lcd_printf(const char* format, ...) {
    char buffer[21];  // Max LCD width + 1
    va_list args;
    
    va_start(args, format);
    vsprintf(buffer, format, args);
    va_end(args);
    
    lcd_puts(buffer);
}
