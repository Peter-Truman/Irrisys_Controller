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

// =============================================================================
// [R3] Interrupt-driven TX ring buffer (EUSART1 -> display board)
//
// disp_write() used to busy-wait on TRMT for EVERY byte (~520us each at 19200),
// so a 26-byte line frame stalled the main loop ~13.5ms and a full 4-line flush
// ~74ms. Now frames are queued here and the TX ISR drains them at baud rate, so
// lcd_flush() returns immediately (well under the 10ms blocking budget).
//
// Single producer (main context) / single consumer (ISR). Indices are uint8_t,
// so reads/writes are atomic on this 8-bit core.
// =============================================================================
#define TX_BUF_SIZE 128            // holds a full 4-line refresh (4 x 26 = 104B)
#define TX_MASK (TX_BUF_SIZE - 1)  // power of two

static volatile uint8_t tx_buf[TX_BUF_SIZE];
static volatile uint8_t tx_head = 0;  // producer (main)
static volatile uint8_t tx_tail = 0;  // consumer (ISR)

// Bytes free in the ring (keeps one slot empty to distinguish full from empty)
static uint8_t tx_space(void)
{
    uint8_t h = tx_head;
    uint8_t t = tx_tail;
    return (uint8_t)(TX_MASK - ((h - t) & TX_MASK));
}

// Queue one byte. Caller must have checked tx_space() first.
static void tx_push(uint8_t c)
{
    uint8_t next = (uint8_t)((tx_head + 1) & TX_MASK);
    if (next == tx_tail) return;  // full — drop (shouldn't happen; pre-checked)
    tx_buf[tx_head] = c;
    tx_head = next;
}

// TX interrupt handler — called from the low-priority ISR.
// TX1IF is set whenever TXREG1 is empty and can only be cleared by writing
// TXREG1, so we disable TX1IE when the ring drains.
void lcd_tx_isr(void)
{
    if (PIE1bits.TX1IE && PIR1bits.TX1IF)
    {
        if (tx_tail != tx_head)
        {
            TXREG1 = tx_buf[tx_tail];
            tx_tail = (uint8_t)((tx_tail + 1) & TX_MASK);
        }
        else
        {
            PIE1bits.TX1IE = 0;  // ring empty — stop TX interrupts
        }
    }
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

// Queue a complete frame to the display board.
// Returns 1 if queued, 0 if the ring hasn't room (caller should retry later).
// The frame is queued atomically: we check space for the WHOLE frame first, so
// a partial/corrupt frame can never reach the display board.
static uint8_t disp_send_frame(uint8_t cmd, const uint8_t *data, uint8_t len)
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

    // STX + cmd + len + data + CRC(2) + ETX
    uint8_t total = (uint8_t)(6 + len);
    if (tx_space() < total) return 0;  // no room — don't queue a partial frame

    tx_push(DISP_STX);
    tx_push(cmd);
    tx_push(len);
    for (uint8_t i = 0; i < len; i++)
    {
        tx_push(data[i]);
    }
    tx_push(crc & 0xFF);        // CRC low byte
    tx_push((crc >> 8) & 0xFF); // CRC high byte
    tx_push(DISP_ETX);

    PIE1bits.TX1IE = 1;  // kick the TX ISR to start draining
    return 1;
}

// Send text to a specific line (1-4). Returns 1 if queued, 0 if ring full.
static uint8_t disp_send_line(uint8_t line, const char *text)
{
    if (line < 1 || line > 4) return 0;

    uint8_t cmd = '0' + line;  // '1', '2', '3', or '4'
    uint8_t len = 0;

    // Count length (max 20 chars)
    while (text[len] && len < 20)
    {
        len++;
    }

    return disp_send_frame(cmd, (const uint8_t *)text, len);
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

    // [R3] TX ring buffer + interrupt setup. TX1IE is enabled only while there
    // is data queued (TX1IF is always set when TXREG1 is empty). Low priority so
    // the RTC 1Hz tick (INT0, high) always preempts display traffic.
    tx_head = 0;
    tx_tail = 0;
    IPR1bits.TX1IP = 0;   // EUSART1 TX = low priority
    PIE1bits.TX1IE = 0;   // enabled on demand by disp_send_frame()
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

// Flush buffer to display board (queue changed lines; TX ISR sends them).
// [R3] Non-blocking: no __delay_ms, no busy-wait. The wire paces itself at
// 19200 baud, which is a far more generous inter-frame gap than the old 5ms.
// If the ring is momentarily full, the line is left DIRTY and retried on the
// next flush — so an update is deferred, never lost.
void lcd_flush(void)
{
    for (uint8_t row = 0; row < LCD_ROWS; row++)
    {
        if (lcd_dirty[row])
        {
            // Check if line actually changed
            if (memcmp(lcd_buffer[row], lcd_prev_buffer[row], LCD_COLS) != 0)
            {
                if (!disp_send_line(row + 1, lcd_buffer[row]))
                    continue;  // ring full — stay dirty, retry next flush

                // Only mark sent once it's actually queued
                memcpy(lcd_prev_buffer[row], lcd_buffer[row], LCD_COLS + 1);
            }
            lcd_dirty[row] = 0;
        }
    }
}

// Force-flush all 4 lines unconditionally (no change detection).
// Boot-time only: waits for ring space so all 4 lines are guaranteed queued.
// This can block until the ring drains, which is acceptable outside the main
// loop (and the watchdog is fed while waiting).
void lcd_force_flush(void)
{
    for (uint8_t row = 0; row < LCD_ROWS; row++)
    {
        while (tx_space() < 26)
        {
            CLRWDT();  // wait for the TX ISR to drain enough room for one frame
        }
        disp_send_line(row + 1, lcd_buffer[row]);
        memcpy(lcd_prev_buffer[row], lcd_buffer[row], LCD_COLS + 1);
        lcd_dirty[row] = 0;
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
void disp_set_contrast(uint8_t percent)
{
    if (percent > 100) percent = 100;
    disp_send_frame(DISP_CMD_CONTRAST, &percent, 1);
}

// Set LED state (bit 0=PWR, bit 1=Signal, bit 2=Fault)
void disp_set_leds(uint8_t led_mask)
{
    disp_send_frame(DISP_CMD_LED, &led_mask, 1);
}

