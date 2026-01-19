/**
 * IrrisysPG Display Board - LCD Driver
 * NHD-0420AZ-FL-YBW-33V3 (4x20 HD44780 compatible)
 * 4-bit parallel interface
 */

#include "../include/config.h"
#include "../include/lcd.h"

// Line address lookup table
static const uint8_t line_addr[LCD_ROWS] = {
    LCD_LINE1_ADDR,
    LCD_LINE2_ADDR,
    LCD_LINE3_ADDR,
    LCD_LINE4_ADDR
};

// Current cursor state tracking
static uint8_t cursor_visible = 0;
static uint8_t cursor_blink = 0;

/**
 * Write 4-bit nibble to LCD
 */
static void lcd_write_nibble(uint8_t nibble)
{
    // Clear data bits, preserve other bits
    LCD_DATA_PORT = (LCD_DATA_PORT & ~LCD_DATA_MASK) | (nibble & LCD_DATA_MASK);

    // Strobe Enable
    LCD_E = 1;
    __delay_us(1);
    LCD_E = 0;
    __delay_us(1);
}

/**
 * Write byte to LCD (as two nibbles)
 */
static void lcd_write_byte(uint8_t byte, uint8_t is_data)
{
    LCD_RS = is_data ? 1 : 0;

    // Send high nibble first
    lcd_write_nibble(byte >> 4);

    // Send low nibble
    lcd_write_nibble(byte & 0x0F);

    // Wait for command to complete
    __delay_us(LCD_CMD_DELAY_US);
}

/**
 * Send command to LCD
 */
void lcd_cmd(uint8_t cmd)
{
    lcd_write_byte(cmd, 0);

    // Clear and Home commands need extra delay
    if (cmd == LCD_CMD_CLEAR || cmd == LCD_CMD_HOME)
    {
        __delay_ms(LCD_CLEAR_DELAY_MS);
    }
}

/**
 * Send data (character) to LCD
 */
void lcd_data(uint8_t data)
{
    lcd_write_byte(data, 1);
}

/**
 * Initialize LCD in 4-bit mode
 */
void lcd_init(void)
{
    // Configure pins as outputs
    LCD_DB4_TRIS = 0;
    LCD_DB5_TRIS = 0;
    LCD_DB6_TRIS = 0;
    LCD_DB7_TRIS = 0;
    LCD_E_TRIS = 0;
    LCD_RS_TRIS = 0;

    // Initialize pins low
    LCD_DB4 = 0;
    LCD_DB5 = 0;
    LCD_DB6 = 0;
    LCD_DB7 = 0;
    LCD_E = 0;
    LCD_RS = 0;

    // Wait for LCD power-up (>40ms after Vcc rises to 2.7V)
    __delay_ms(LCD_INIT_DELAY_MS);

    // HD44780 4-bit initialization sequence
    // Must send 0x03 three times, then 0x02 to enter 4-bit mode

    LCD_RS = 0;  // Command mode

    // First: send 0x3 (8-bit mode attempt)
    lcd_write_nibble(0x03);
    __delay_ms(5);  // Wait >4.1ms

    // Second: send 0x3 again
    lcd_write_nibble(0x03);
    __delay_us(150);  // Wait >100us

    // Third: send 0x3 again
    lcd_write_nibble(0x03);
    __delay_us(150);

    // Now send 0x2 to switch to 4-bit mode
    lcd_write_nibble(0x02);
    __delay_us(150);

    // Now in 4-bit mode - configure display
    lcd_cmd(LCD_CMD_FUNCTION_SET);  // 4-bit, 2+ lines, 5x8 font
    lcd_cmd(LCD_CMD_DISPLAY_OFF);   // Display off
    lcd_cmd(LCD_CMD_CLEAR);         // Clear display
    lcd_cmd(LCD_CMD_ENTRY_MODE);    // Entry mode: increment, no shift
    lcd_cmd(LCD_CMD_DISPLAY_ON);    // Display on, cursor off, blink off

    cursor_visible = 0;
    cursor_blink = 0;
}

/**
 * Clear display and return cursor to home
 */
void lcd_clear(void)
{
    lcd_cmd(LCD_CMD_CLEAR);
}

/**
 * Return cursor to home position (0,0)
 */
void lcd_home(void)
{
    lcd_cmd(LCD_CMD_HOME);
}

/**
 * Set cursor position
 * @param row 0-3
 * @param col 0-19
 */
void lcd_set_cursor(uint8_t row, uint8_t col)
{
    if (row >= LCD_ROWS) row = LCD_ROWS - 1;
    if (col >= LCD_COLS) col = LCD_COLS - 1;

    lcd_cmd(LCD_CMD_SET_DDRAM | (line_addr[row] + col));
}

/**
 * Write single character at current cursor position
 */
void lcd_putc(char c)
{
    lcd_data((uint8_t)c);
}

/**
 * Print string at current cursor position
 */
void lcd_print(const char *str)
{
    while (*str)
    {
        lcd_data((uint8_t)*str++);
    }
}

/**
 * Print string at specified position
 */
void lcd_print_at(uint8_t row, uint8_t col, const char *str)
{
    lcd_set_cursor(row, col);
    lcd_print(str);
}

/**
 * Update display control register based on current state
 */
static void lcd_update_display_ctrl(void)
{
    uint8_t cmd = 0x08 | 0x04;  // Display ON

    if (cursor_visible)
        cmd |= 0x02;  // Cursor ON

    if (cursor_blink)
        cmd |= 0x01;  // Blink ON

    lcd_cmd(cmd);
}

/**
 * Turn display on
 */
void lcd_display_on(void)
{
    lcd_update_display_ctrl();
}

/**
 * Turn display off
 */
void lcd_display_off(void)
{
    lcd_cmd(LCD_CMD_DISPLAY_OFF);
}

/**
 * Show cursor (underline)
 */
void lcd_cursor_on(void)
{
    cursor_visible = 1;
    lcd_update_display_ctrl();
}

/**
 * Hide cursor
 */
void lcd_cursor_off(void)
{
    cursor_visible = 0;
    lcd_update_display_ctrl();
}

/**
 * Enable cursor blinking
 */
void lcd_cursor_blink_on(void)
{
    cursor_blink = 1;
    lcd_update_display_ctrl();
}

/**
 * Disable cursor blinking
 */
void lcd_cursor_blink_off(void)
{
    cursor_blink = 0;
    lcd_update_display_ctrl();
}

/**
 * Scroll entire display left
 */
void lcd_scroll_left(void)
{
    lcd_cmd(LCD_CMD_SHIFT_LEFT);
}

/**
 * Scroll entire display right
 */
void lcd_scroll_right(void)
{
    lcd_cmd(LCD_CMD_SHIFT_RIGHT);
}

/**
 * Move cursor left one position
 */
void lcd_cursor_left(void)
{
    lcd_cmd(0x10);  // Cursor move left
}

/**
 * Move cursor right one position
 */
void lcd_cursor_right(void)
{
    lcd_cmd(0x14);  // Cursor move right
}
