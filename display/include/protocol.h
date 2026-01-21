/**
 * IrrisysPG Display Board - Serial Protocol Handler
 * Frame parsing, CRC validation, command dispatch
 */

#ifndef PROTOCOL_H
#define PROTOCOL_H

#include <stdint.h>

// Frame delimiters
#define PROTO_STX   0x02
#define PROTO_ETX   0x03

// Maximum data payload size (20 chars + some control codes)
#define PROTO_MAX_DATA  24

// Frame structure offsets
#define PROTO_IDX_STX   0
#define PROTO_IDX_CMD   1
#define PROTO_IDX_LEN   2
#define PROTO_IDX_DATA  3

// Commands
#define PROTO_CMD_LINE1     '1'     // 0x31 - Text for line 1
#define PROTO_CMD_LINE2     '2'     // 0x32 - Text for line 2
#define PROTO_CMD_LINE3     '3'     // 0x33 - Text for line 3
#define PROTO_CMD_LINE4     '4'     // 0x34 - Text for line 4
#define PROTO_CMD_CLEAR     'C'     // 0x43 - Clear display
#define PROTO_CMD_BRIGHT    'B'     // 0x42 - LCD Brightness (0-100)
#define PROTO_CMD_CONTRAST  'K'     // 0x4B - LCD Contrast (0-100)
#define PROTO_CMD_LED       'L'     // 0x4C - LED state bitmask

// Parser states
typedef enum {
    PROTO_STATE_IDLE,       // Waiting for STX
    PROTO_STATE_CMD,        // Waiting for command byte
    PROTO_STATE_LEN,        // Waiting for length byte
    PROTO_STATE_DATA,       // Receiving data bytes
    PROTO_STATE_CRC_LO,     // Waiting for CRC low byte
    PROTO_STATE_CRC_HI,     // Waiting for CRC high byte
    PROTO_STATE_ETX         // Waiting for ETX
} proto_state_t;

/**
 * Initialize protocol handler
 */
void protocol_init(void);

/**
 * Process incoming data from UART
 * Call frequently from main loop
 * Handles parsing and dispatches complete frames
 */
void protocol_process(void);

/**
 * Calculate Fletcher-16 checksum
 * @param data Pointer to data buffer
 * @param len Length of data
 * @return 16-bit Fletcher checksum
 */
uint16_t protocol_fletcher16(const uint8_t *data, uint8_t len);

#endif // PROTOCOL_H
