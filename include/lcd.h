/**
 * lcd.h - Buffered LCD interface for IRRISYS Controller
 *
 * Ver_B_Rev_1: LCD is on display board, connected via serial
 */

#ifndef LCD_H
#define LCD_H

#include <stdint.h>

// LCD Buffer Functions
void lcd_init(void);
void lcd_clear(void);
void lcd_set_cursor(uint8_t row, uint8_t col);
void lcd_print(const char *str);
void lcd_flush(void);
void lcd_force_flush(void);  // Send all 4 lines unconditionally (ignores change detection)
void lcd_invalidate(void);   // Drop change-detection cache -> next flush re-sends all lines

// Display Board Control Functions
void disp_clear(void);
void disp_set_brightness(uint8_t percent);
void disp_set_contrast(uint8_t percent);
void disp_set_leds(uint8_t led_mask);

#endif
