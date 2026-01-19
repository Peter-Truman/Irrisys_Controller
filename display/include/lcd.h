/**
 * IrrisysPG Display Board - LCD Driver Header
 * NHD-0420AZ-FL-YBW-33V3 (4x20 HD44780 compatible)
 */

#ifndef LCD_H
#define LCD_H

#include <stdint.h>

// LCD dimensions
#define LCD_ROWS        4
#define LCD_COLS        20

// HD44780 Commands
#define LCD_CMD_CLEAR           0x01
#define LCD_CMD_HOME            0x02
#define LCD_CMD_ENTRY_MODE      0x06    // Increment cursor, no shift
#define LCD_CMD_DISPLAY_OFF     0x08
#define LCD_CMD_DISPLAY_ON      0x0C    // Display on, cursor off, blink off
#define LCD_CMD_CURSOR_ON       0x0E    // Display on, cursor on, blink off
#define LCD_CMD_CURSOR_BLINK    0x0F    // Display on, cursor on, blink on
#define LCD_CMD_SHIFT_LEFT      0x18    // Shift display left
#define LCD_CMD_SHIFT_RIGHT     0x1C    // Shift display right
#define LCD_CMD_FUNCTION_SET    0x28    // 4-bit mode, 2+ lines, 5x8 font
#define LCD_CMD_SET_CGRAM       0x40    // Set CGRAM address
#define LCD_CMD_SET_DDRAM       0x80    // Set DDRAM address

// DDRAM addresses for each line (4x20 display)
#define LCD_LINE1_ADDR  0x00
#define LCD_LINE2_ADDR  0x40
#define LCD_LINE3_ADDR  0x14
#define LCD_LINE4_ADDR  0x54

// Function prototypes
void lcd_init(void);
void lcd_clear(void);
void lcd_home(void);
void lcd_set_cursor(uint8_t row, uint8_t col);
void lcd_putc(char c);
void lcd_print(const char *str);
void lcd_print_at(uint8_t row, uint8_t col, const char *str);

// Display control
void lcd_display_on(void);
void lcd_display_off(void);
void lcd_cursor_on(void);
void lcd_cursor_off(void);
void lcd_cursor_blink_on(void);
void lcd_cursor_blink_off(void);

// Scrolling
void lcd_scroll_left(void);
void lcd_scroll_right(void);

// Cursor movement
void lcd_cursor_left(void);
void lcd_cursor_right(void);

// Low-level (for direct command access if needed)
void lcd_cmd(uint8_t cmd);
void lcd_data(uint8_t data);

#endif // LCD_H
