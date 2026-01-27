/**
 * lcd.h - Buffered LCD interface for IRRISYS Controller
 *
 * Ver_B_Rev_1: LCD is on display board, connected via serial
 */

#ifndef LCD_H
#define LCD_H

#include <stdint.h>

// LCD dimensions for 20x4 display
#define LCD_WIDTH     20
#define LCD_HEIGHT    4

// LCD Buffer Functions
void lcd_init(void);
void lcd_clear(void);
void lcd_set_cursor(uint8_t row, uint8_t col);
void lcd_print(const char *str);
void lcd_data(uint8_t data);
void lcd_cmd(uint8_t cmd);
void lcd_flush(void);

// Legacy compatibility
void lcd_write_nibble(uint8_t nibble);

// Display Board Control Functions
void disp_clear(void);
void disp_set_brightness(uint8_t percent);
void disp_set_contrast(uint8_t percent);
void disp_set_leds(uint8_t led_mask);

#endif
