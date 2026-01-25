// lcd.h - LCD interface declarations for IRRISYS Controller
// =============================================================================
// Ver_B_Rev_1: LCD is on the display board
// These functions buffer text and send complete lines via serial protocol
// =============================================================================
#ifndef LCD_H
#define LCD_H

#include <stdint.h>

// LCD dimensions for 20x4 display
#define LCD_WIDTH     20
#define LCD_HEIGHT    4

// =============================================================================
// LCD Functions - implemented in lcd.c, send to display board via serial
// =============================================================================

/**
 * Initialize LCD buffers
 */
void lcd_init(void);

/**
 * Clear display and reset cursor to 0,0
 */
void lcd_clear(void);

/**
 * Set cursor position (also flushes previous line)
 * @param row Line number (0-3)
 * @param col Column number (0-19)
 */
void lcd_set_cursor(uint8_t row, uint8_t col);

/**
 * Print string at current cursor position
 * Automatically sends the line when complete
 * @param str String to print
 */
void lcd_print(const char *str);

/**
 * Print string at specific position (convenience function)
 * @param row Line number (0-3)
 * @param col Column number (0-19)
 * @param str String to print
 */
void lcd_print_at(uint8_t row, uint8_t col, const char *str);

/**
 * Flush dirty lines to display board
 * Use after building a complete screen
 */
void lcd_flush(void);

/**
 * Refresh all 4 lines to display board unconditionally
 * Use when display may be out of sync
 */
void lcd_refresh(void);

// Legacy compatibility functions
void lcd_cmd(uint8_t cmd);
void lcd_data(uint8_t data);

#endif // LCD_H
