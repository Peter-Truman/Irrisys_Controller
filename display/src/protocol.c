/**
 * IrrisysPG Display Board - Serial Protocol Handler
 * Frame parsing, CRC validation, command dispatch
 *
 * Frame format: [STX] [CMD] [LEN] [DATA...] [CRC16-LO] [CRC16-HI] [ETX]
 */

#include "../include/config.h"
#include "../include/protocol.h"
#include "../include/uart.h"
#include "../include/lcd.h"
#include "../include/led.h"

// Parser state machine
static proto_state_t state = PROTO_STATE_IDLE;
static uint8_t cmd = 0;
static uint8_t len = 0;
static uint8_t data_count = 0;
static uint8_t data_buf[PROTO_MAX_DATA + 1];  // +1 for null terminator
static uint16_t crc_received = 0;

// Statistics (for debugging) - made volatile and non-static for external access
volatile uint16_t frames_received = 0;
volatile uint16_t frames_error = 0;

/**
 * Calculate Fletcher-16 checksum
 */
uint16_t protocol_fletcher16(const uint8_t *data, uint8_t len)
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

/**
 * Execute a received command
 */
static void protocol_execute(void)
{
    // Null-terminate data for string commands
    data_buf[len] = '\0';

    switch (cmd)
    {
        case PROTO_CMD_LINE1:
        case PROTO_CMD_LINE2:
        case PROTO_CMD_LINE3:
        case PROTO_CMD_LINE4:
        {
            // Text for line 1-4
            uint8_t line = cmd - '1';  // Convert '1'-'4' to 0-3
            lcd_print_at(line, 0, (const char *)data_buf);
            break;
        }

        case PROTO_CMD_CLEAR:
            lcd_clear();
            break;

        case PROTO_CMD_BRIGHT:
            if (len >= 1)
            {
                // Brightness control via software PWM (0-100%)
                led_set_backlight(data_buf[0]);
            }
            break;

        case PROTO_CMD_CONTRAST:
            if (len >= 1)
            {
                // Contrast control - data[0] is 0-100
                // TODO: Implement contrast PWM on RC5
                (void)data_buf[0];  // Suppress warning for now
            }
            break;

        case PROTO_CMD_LED:
            if (len >= 1)
            {
                // LED state bitmask: bit0=PWR, bit1=Signal, bit2=Fault
                uint8_t led_mask = data_buf[0];

                // Power LED
                if (led_mask & 0x01)
                {
                    led_set_brightness(LED_ID_PWR, 15);  // Dim level
                    led_set_flash(LED_ID_PWR, 0);        // Steady
                    led_on(LED_ID_PWR);
                }
                else
                {
                    led_off(LED_ID_PWR);
                }

                // Signal LED
                if (led_mask & 0x02)
                {
                    led_set_brightness(LED_ID_SIGNAL, 15);
                    led_set_flash(LED_ID_SIGNAL, 0);
                    led_on(LED_ID_SIGNAL);
                }
                else
                {
                    led_off(LED_ID_SIGNAL);
                }

                // Fault LED
                if (led_mask & 0x04)
                {
                    led_set_brightness(LED_ID_FAULT, 15);
                    led_set_flash(LED_ID_FAULT, 0);
                    led_on(LED_ID_FAULT);
                }
                else
                {
                    led_off(LED_ID_FAULT);
                }
            }
            break;

        default:
            // Unknown command - ignore
            break;
    }
}

/**
 * Initialize protocol handler
 */
void protocol_init(void)
{
    state = PROTO_STATE_IDLE;
    cmd = 0;
    len = 0;
    data_count = 0;
    crc_received = 0;
    frames_received = 0;
    frames_error = 0;
}

/**
 * Process incoming data from UART
 * State machine parser
 */
void protocol_process(void)
{
    // Process all available bytes
    while (uart_available())
    {
        uint8_t byte = uart_read();

        switch (state)
        {
            case PROTO_STATE_IDLE:
                // Waiting for STX
                if (byte == PROTO_STX)
                {
                    state = PROTO_STATE_CMD;
                    cmd = 0;
                    len = 0;
                    data_count = 0;
                    crc_received = 0;
                }
                // Ignore any other bytes while idle
                break;

            case PROTO_STATE_CMD:
                cmd = byte;
                state = PROTO_STATE_LEN;
                break;

            case PROTO_STATE_LEN:
                len = byte;
                if (len > PROTO_MAX_DATA)
                {
                    // Invalid length - reset
                    frames_error++;
                    state = PROTO_STATE_IDLE;
                }
                else if (len == 0)
                {
                    // No data - go directly to CRC
                    state = PROTO_STATE_CRC_LO;
                }
                else
                {
                    state = PROTO_STATE_DATA;
                    data_count = 0;
                }
                break;

            case PROTO_STATE_DATA:
                data_buf[data_count++] = byte;
                if (data_count >= len)
                {
                    state = PROTO_STATE_CRC_LO;
                }
                break;

            case PROTO_STATE_CRC_LO:
                crc_received = byte;  // Low byte
                state = PROTO_STATE_CRC_HI;
                break;

            case PROTO_STATE_CRC_HI:
                crc_received |= ((uint16_t)byte << 8);  // High byte
                state = PROTO_STATE_ETX;
                break;

            case PROTO_STATE_ETX:
                if (byte == PROTO_ETX)
                {
                    // Complete frame received - validate CRC
                    // Build frame buffer for CRC calculation (cmd + len + data)
                    uint8_t crc_buf[PROTO_MAX_DATA + 2];
                    crc_buf[0] = cmd;
                    crc_buf[1] = len;
                    for (uint8_t i = 0; i < len; i++)
                    {
                        crc_buf[2 + i] = data_buf[i];
                    }

                    uint16_t crc_calc = protocol_fletcher16(crc_buf, 2 + len);

                    if (crc_calc == crc_received)
                    {
                        // Valid frame - execute command
                        frames_received++;
                        protocol_execute();
                    }
                    else
                    {
                        // CRC error
                        frames_error++;
                    }
                }
                else
                {
                    // Missing ETX
                    frames_error++;
                }
                // Always return to idle after ETX position
                state = PROTO_STATE_IDLE;
                break;

            default:
                // Invalid state - reset
                state = PROTO_STATE_IDLE;
                break;
        }
    }
}
