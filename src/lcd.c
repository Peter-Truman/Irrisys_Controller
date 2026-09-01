/**
 * lcd.c - Buffered LCD implementation for IRRISYS Controller
 *
 * Ver_B_Rev_1: LCD is on display board, connected via serial
 * This file maintains a local buffer and sends to display PIC via EUSART1
 *
 * Serial Protocol: [STX] [CMD] [LEN] [DATA...] [CRC16-LO] [CRC16-HI] [ETX]
 */

#include "../include/config.h"
#include <xc.h>
#include <stdint.h>
#include <string.h>

// =============================================================================
// LCD Buffer (4 lines x 20 characters)
// =============================================================================
#define LCD_ROWS 4
#define LCD_COLS 20

static char lcd_buffer[LCD_ROWS][LCD_COLS + 1];  // +1 for null terminator
static char lcd_prev_buffer[LCD_ROWS][LCD_COLS + 1];  // Previous state for change detection
static uint8_t lcd_cursor_row = 0;
static uint8_t lcd_cursor_col = 0;
static uint8_t lcd_dirty[LCD_ROWS] = {0, 0, 0, 0};  // Dirty flags per line

// =============================================================================
// Display Serial Protocol Definitions
// =============================================================================
#define DISP_STX 0x02
#define DISP_ETX 0x03

// Display commands
#define DISP_CMD_LINE1    '1'  // 0x31 - Text for line 1
#define DISP_CMD_LINE2    '2'  // 0x32 - Text for line 2
#define DISP_CMD_LINE3    '3'  // 0x33 - Text for line 3
#define DISP_CMD_LINE4    '4'  // 0x34 - Text for line 4
#define DISP_CMD_CLEAR    'C'  // 0x43 - Clear display
#define DISP_CMD_BRIGHT   'B'  // 0x42 - LCD Brightness (0-100)
#define DISP_CMD_CONTRAST 'K'  // 0x4B - LCD Contrast (0-100)
#define DISP_CMD_LED      'L'  // 0x4C - LED state bitmask

// =============================================================================
// Display Serial Functions (EUSART1 - RC6 @ 19200 baud)
// =============================================================================

// Send a byte to display board via EUSART1
static void disp_write(uint8_t c)
{
    while (!TXSTA1bits.TRMT)
        ;
    TXREG1 = c;
}

// Calculate Fletcher-16 checksum
static uint16_t fletcher16(const uint8_t *data, uint8_t len)
{
    uint16_t sum1 = 0;
    uint16_t sum2 = 0;

    for (uint8_t i = 0; i < len; i++)
    {
        sum1 = (sum1 + data[i]) % 255;
        sum2 = (sum2 + sum1) % 255;
    }

    return (sum2 << 8) | sum1;
}

// Send a complete frame to display board
static void disp_send_frame(uint8_t cmd, const uint8_t *data, uint8_t len)
{
    // Build frame buffer for CRC calculation (cmd + len + data)
    uint8_t frame[26];  // Max: 1 cmd + 1 len + 24 data
    frame[0] = cmd;
    frame[1] = len;
    for (uint8_t i = 0; i < len; i++)
    {
        frame[2 + i] = data[i];
    }

    // Calculate CRC over cmd + len + data
    uint16_t crc = fletcher16(frame, 2 + len);

    // Send frame
    disp_write(DISP_STX);
    disp_write(cmd);
    disp_write(len);
    for (uint8_t i = 0; i < len; i++)
    {
        disp_write(data[i]);
    }
    disp_write(crc & 0xFF);        // CRC low byte
    disp_write((crc >> 8) & 0xFF); // CRC high byte
    disp_write(DISP_ETX);
}

// Send text to a specific line (1-4)
static void disp_send_line(uint8_t line, const char *text)
{
    if (line < 1 || line > 4) return;

    uint8_t cmd = '0' + line;  // '1', '2', '3', or '4'
    uint8_t len = 0;

    // Count length (max 20 chars)
    while (text[len] && len < 20)
    {
        len++;
    }

    disp_send_frame(cmd, (const uint8_t *)text, len);
}

// =============================================================================
// Public LCD Functions (Buffer-based)
// =============================================================================

// Initialize LCD buffer
void lcd_init(void)
{
    // Clear buffers
    for (uint8_t row = 0; row < LCD_ROWS; row++)
    {
        memset(lcd_buffer[row], ' ', LCD_COLS);
        lcd_buffer[row][LCD_COLS] = '\0';
        memset(lcd_prev_buffer[row], ' ', LCD_COLS);
        lcd_prev_buffer[row][LCD_COLS] = '\0';
        lcd_dirty[row] = 1;  // Mark all lines dirty initially
    }
    lcd_cursor_row = 0;
    lcd_cursor_col = 0;
}

// Set cursor position
void lcd_set_cursor(uint8_t row, uint8_t col)
{
    if (row < LCD_ROWS && col < LCD_COLS)
    {
        lcd_cursor_row = row;
        lcd_cursor_col = col;
    }
}

// Write a string at current cursor position
void lcd_print(const char *str)
{
    while (*str && lcd_cursor_col < LCD_COLS)
    {
        lcd_buffer[lcd_cursor_row][lcd_cursor_col] = *str++;
        lcd_cursor_col++;
    }
    lcd_dirty[lcd_cursor_row] = 1;
}

// Clear LCD buffer
void lcd_clear(void)
{
    for (uint8_t row = 0; row < LCD_ROWS; row++)
    {
        memset(lcd_buffer[row], ' ', LCD_COLS);
        lcd_buffer[row][LCD_COLS] = '\0';
        lcd_dirty[row] = 1;
    }
    lcd_cursor_row = 0;
    lcd_cursor_col = 0;
}

// Flush buffer to display board (send changed lines via serial)
void lcd_flush(void)
{
    for (uint8_t row = 0; row < LCD_ROWS; row++)
    {
        if (lcd_dirty[row])
        {
            // Check if line actually changed
            if (memcmp(lcd_buffer[row], lcd_prev_buffer[row], LCD_COLS) != 0)
            {
                // Send line to display board
                disp_send_line(row + 1, lcd_buffer[row]);

                // Update previous buffer
                memcpy(lcd_prev_buffer[row], lcd_buffer[row], LCD_COLS + 1);

                // Inter-frame delay: let display board process before next frame
                __delay_ms(5);
            }
            lcd_dirty[row] = 0;
        }
    }
}

// Invalidate the change-detection cache so the NEXT lcd_flush() re-sends every
// line unconditionally.
//
// Why this exists: lcd_flush() only sends a line if it differs from
// lcd_prev_buffer. If the display board ever MISSES a frame (e.g. its UART RX
// interrupt is disabled during its blocking backlight-EEPROM write), the main
// board still marks the line as "sent". Every later render then compares equal
// and is skipped, so the screen stays permanently stale/blank until the content
// happens to change. Calling this after boot gives the display a guaranteed
// second full refresh once it is definitely idle.
void lcd_invalidate(void)
{
    for (uint8_t row = 0; row < LCD_ROWS; row++)
    {
        memset(lcd_prev_buffer[row], '\0', LCD_COLS);
        lcd_prev_buffer[row][LCD_COLS] = '\0';
        lcd_dirty[row] = 1;
    }
}

// Force-flush all 4 lines unconditionally (no change detection)
void lcd_force_flush(void)
{
    for (uint8_t row = 0; row < LCD_ROWS; row++)
    {
        disp_send_line(row + 1, lcd_buffer[row]);
        memcpy(lcd_prev_buffer[row], lcd_buffer[row], LCD_COLS + 1);
        lcd_dirty[row] = 0;
        __delay_ms(10);  // Give display board time to process each line
    }
}

// =============================================================================
// Display Control Functions
// =============================================================================

// Clear display on display board
void disp_clear(void)
{
    disp_send_frame(DISP_CMD_CLEAR, NULL, 0);
    lcd_clear();  // Also clear local buffer
    // Reset prev_buffer so next flush sends all lines unconditionally
    for (uint8_t row = 0; row < LCD_ROWS; row++)
    {
        memset(lcd_prev_buffer[row], '\0', LCD_COLS);
        lcd_prev_buffer[row][LCD_COLS] = '\0';
    }
}

// Set brightness (0-100%)
void disp_set_brightness(uint8_t percent)
{
    if (percent > 100) percent = 100;
    disp_send_frame(DISP_CMD_BRIGHT, &percent, 1);
}

// Set contrast (0-100%)

// Set LED state (bit 0=PWR, bit 1=Signal, bit 2=Fault)
void disp_set_leds(uint8_t led_mask)
{
    disp_send_frame(DISP_CMD_LED, &led_mask, 1);
}

