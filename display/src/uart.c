/**
 * IrrisysPG Display Board - UART Driver
 * Serial receive from main board (RB5 @ 19200 baud)
 * Interrupt-driven with circular buffer
 */

#include "../include/config.h"
#include "../include/uart.h"

// Circular receive buffer
static volatile uint8_t rx_buffer[UART_RX_BUF_SIZE];
static volatile uint8_t rx_head = 0;  // Write position (ISR)
static volatile uint8_t rx_tail = 0;  // Read position (main)

/**
 * Initialize UART for 19200 baud receive on RB5
 * PIC18F14K22 EUSART with BRG16=1, BRGH=1
 */
void uart_init(void)
{
    // Configure RX pin as input (RB5)
    TRISBbits.TRISB5 = 1;

    // EUSART configuration for receive
    // SPBRG calculation: SPBRG = (FOSC / (4 * BAUD)) - 1
    // At 8MHz: SPBRG = (8000000 / (4 * 19200)) - 1 = 103.17 ≈ 103
    // Actual baud = 8000000 / (4 * 104) = 19230.77 (0.16% error - acceptable)

    SPBRG = 103;        // Low byte for 19200 baud @ 8MHz
    SPBRGH = 0;         // High byte (not needed for this baud rate)

    // TXSTA register - transmit disabled, high speed mode
    TXSTAbits.SYNC = 0;     // Asynchronous mode
    TXSTAbits.BRGH = 1;     // High baud rate mode
    TXSTAbits.TXEN = 0;     // Transmit disabled (RX only)

    // BAUDCON register - 16-bit baud rate generator
    BAUDCONbits.BRG16 = 1;  // 16-bit baud rate generator
    BAUDCONbits.ABDEN = 0;  // Auto-baud disabled

    // RCSTA register - enable serial port and receiver
    RCSTAbits.CREN = 1;     // Continuous receive enable
    RCSTAbits.SPEN = 1;     // Serial port enabled

    // Clear any pending data
    if (RCSTAbits.OERR)
    {
        RCSTAbits.CREN = 0;
        RCSTAbits.CREN = 1;
    }
    (void)RCREG;  // Read to clear buffer

    // Initialize buffer indices
    rx_head = 0;
    rx_tail = 0;

    // Enable receive interrupt
    PIE1bits.RCIE = 1;
    PIR1bits.RCIF = 0;
}

/**
 * Check if data is available in receive buffer
 */
uint8_t uart_available(void)
{
    return (rx_head - rx_tail) & UART_RX_BUF_MASK;
}

/**
 * Read a byte from receive buffer
 */
uint8_t uart_read(void)
{
    if (rx_head == rx_tail)
    {
        return 0;  // Buffer empty
    }

    uint8_t data = rx_buffer[rx_tail];
    rx_tail = (rx_tail + 1) & UART_RX_BUF_MASK;
    return data;
}

/**
 * Peek at next byte without removing from buffer
 */
uint8_t uart_peek(void)
{
    if (rx_head == rx_tail)
    {
        return 0;  // Buffer empty
    }
    return rx_buffer[rx_tail];
}

// Debug: count received bytes
volatile uint16_t uart_rx_count = 0;
volatile uint8_t uart_last_byte = 0;

/**
 * UART RX interrupt handler
 * Call from main ISR when RCIF is set
 */
void uart_rx_isr(void)
{
    // Check for framing error
    if (RCSTAbits.FERR)
    {
        (void)RCREG;  // Read and discard
        return;
    }

    // Check for overrun error
    if (RCSTAbits.OERR)
    {
        RCSTAbits.CREN = 0;  // Clear overrun by toggling CREN
        RCSTAbits.CREN = 1;
        return;
    }

    // Read received byte
    uint8_t data = RCREG;

    // Debug: track received bytes
    uart_rx_count++;
    uart_last_byte = data;

    // Calculate next write position
    uint8_t next_head = (rx_head + 1) & UART_RX_BUF_MASK;

    // Store if buffer not full
    if (next_head != rx_tail)
    {
        rx_buffer[rx_head] = data;
        rx_head = next_head;
    }
    // If buffer full, data is dropped
}
