/**
 * IrrisysPG Display Board - UART Driver Header
 * Serial receive from main board (RB5 @ 19200 baud)
 */

#ifndef UART_H
#define UART_H

#include <stdint.h>

// Circular buffer size (must be power of 2)
#define UART_RX_BUF_SIZE    64
#define UART_RX_BUF_MASK    (UART_RX_BUF_SIZE - 1)

/**
 * Initialize UART for 19200 baud receive
 */
void uart_init(void);

/**
 * Check if data is available in receive buffer
 * @return number of bytes available
 */
uint8_t uart_available(void);

/**
 * Read a byte from receive buffer
 * @return byte read, or 0 if buffer empty
 */
uint8_t uart_read(void);

/**
 * Peek at next byte without removing from buffer
 * @return byte at head, or 0 if empty
 */
uint8_t uart_peek(void);

/**
 * UART RX interrupt handler - call from main ISR
 */
void uart_rx_isr(void);

#endif // UART_H
