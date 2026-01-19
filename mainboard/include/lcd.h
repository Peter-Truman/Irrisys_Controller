// lcd.h - LCD interface declarations for IRRISYS Controller
#ifndef LCD_H
#define LCD_H

#include <stdint.h>

// LCD dimensions for your 20x4 display
#define LCD_WIDTH     20
#define LCD_HEIGHT    4

// LCD function prototypes
void lcd_init(void);
void lcd_command(uint8_t cmd);
void lcd_data(uint8_t data);
void lcd_goto(uint8_t x, uint8_t y);
void lcd_putc(char c);
void lcd_puts(const char* s);
void lcd_clear(void);
void lcd_printf(const char* format, ...);

#endif // LCD_H