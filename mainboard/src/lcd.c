// lcd.c - LCD wrapper that sends to display board via serial
// =============================================================================
// Ver_B_Rev_1: LCD is on the display board
// Buffer entire screen locally, send all 4 lines on lcd_flush()
// =============================================================================

#include "../include/config.h"
#include <xc.h>
#include <stdint.h>
#include <string.h>

// Line buffers (20 chars + null terminator)
static char line_buffer[4][21];
static uint8_t current_row = 0;
static uint8_t current_col = 0;
static uint8_t dirty_flags = 0;  // Bit flags for which lines changed

// External display serial functions (defined in main.c)
extern void disp_print_line(uint8_t line, const char *text);
extern void disp_clear(void);

// =============================================================================
// LCD Functions - Buffer locally, send on flush
// =============================================================================

void lcd_init(void)
{
    // Clear all line buffers
    for (uint8_t i = 0; i < 4; i++)
    {
        memset(line_buffer[i], ' ', 20);
        line_buffer[i][20] = '\0';
    }
    current_row = 0;
    current_col = 0;
    dirty_flags = 0;
}

void lcd_clear(void)
{
    // Clear all line buffers to spaces
    for (uint8_t i = 0; i < 4; i++)
    {
        memset(line_buffer[i], ' ', 20);
        line_buffer[i][20] = '\0';
    }
    current_row = 0;
    current_col = 0;
    dirty_flags = 0x0F;  // All lines dirty - will be sent on lcd_flush()

    // Note: Don't send disp_clear() here - lcd_flush() will send all 4 lines
    // which effectively clears the display by overwriting with spaces
}

void lcd_set_cursor(uint8_t row, uint8_t col)
{
    // Just update cursor position - don't send anything
    if (row < 4) current_row = row;
    if (col < 20) current_col = col;
}

void lcd_print(const char *str)
{
    // Write characters to line buffer starting at current position
    while (*str && current_col < 20)
    {
        line_buffer[current_row][current_col] = *str;
        current_col++;
        str++;
    }

    // Mark this line as dirty
    dirty_flags |= (1 << current_row);
}

// Print at specific position - combines set_cursor + print
void lcd_print_at(uint8_t row, uint8_t col, const char *str)
{
    if (row >= 4) return;

    current_row = row;
    current_col = col;

    // Write characters starting at specified column
    while (*str && current_col < 20)
    {
        line_buffer[current_row][current_col] = *str;
        current_col++;
        str++;
    }

    // Mark this line as dirty
    dirty_flags |= (1 << current_row);
}

// Send all dirty lines to display board
void lcd_flush(void)
{
    for (uint8_t i = 0; i < 4; i++)
    {
        if (dirty_flags & (1 << i))
        {
            disp_print_line(i + 1, line_buffer[i]);
        }
    }
    dirty_flags = 0;  // Clear all dirty flags
}

// Send all 4 lines unconditionally
void lcd_refresh(void)
{
    for (uint8_t i = 0; i < 4; i++)
    {
        disp_print_line(i + 1, line_buffer[i]);
    }
    dirty_flags = 0;
}

// Legacy stubs for compatibility
void lcd_cmd(uint8_t cmd)
{
    (void)cmd;  // Not used - display board handles commands
}

void lcd_data(uint8_t data)
{
    // Write single character at current position
    if (current_col < 20 && current_row < 4)
    {
        line_buffer[current_row][current_col] = (char)data;
        current_col++;
        dirty_flags |= (1 << current_row);
    }
}
