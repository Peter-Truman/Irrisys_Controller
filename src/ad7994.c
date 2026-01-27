// ad7994.c - 12-bit 4-channel ADC driver with debug output
#include "../include/ad7994.h"
#include "../include/i2c.h"
#include "../include/config.h"
#include <xc.h>
#include <stdio.h>

// External UART function
extern void uart_println(const char *str);

// CONVST pin on RC5
#define ADC_CONVST LATCbits.LATC5

uint8_t ad7994_init(void)
{
    uint8_t i2c_error;

    // 100ms power-on delay for device initialization
    uart_println("ADC Init: Waiting 100ms for power-on");
    __delay_ms(100);

    // MODE 1: Auto-incrementing address pointer

    // Step 1: Enable CH1 only (testing if 0x78 NAKs but 0x18 works)
    uart_println("ADC Init: Writing config 0x18 (CH1 only + Filter)");
    i2c_error = i2c_start();
    if (i2c_error) { uart_println("Init: START fail"); return 1; }

    i2c_error = i2c_write(0x42);  // Write address (0x21 << 1)
    if (i2c_error) { uart_println("Init: Addr fail"); i2c_stop(); return 2; }

    i2c_error = i2c_write(0x02);  // Config register
    if (i2c_error) { uart_println("Init: Reg fail"); i2c_stop(); return 3; }

    i2c_error = i2c_write(0x18);  // CH1 only + Filter
    if (i2c_error) { uart_println("Init: Config 0x18 FAIL"); i2c_stop(); return 4; }

    i2c_stop();
    uart_println("ADC Init: Config OK");

    // 100ms delay after config write for device to process
    __delay_ms(100);

    // Step 2: Point to conversion result register (0x00) - ONCE!
    uart_println("ADC Init: Setting address pointer to 0x00");
    i2c_error = i2c_start();
    if (i2c_error) { uart_println("Init: START2 fail"); return 5; }

    i2c_error = i2c_write(0x42);  // Write address (0x21 << 1)
    if (i2c_error) { uart_println("Init: Addr2 fail"); i2c_stop(); return 6; }

    i2c_error = i2c_write(0x00);  // Conversion result register
    if (i2c_error) { uart_println("Init: Pointer fail"); i2c_stop(); return 7; }

    i2c_stop();
    uart_println("ADC Init: Pointer set - ready for auto-increment reads");

    // 100ms delay after pointer write for device to process
    __delay_ms(100);

    return 0;
}

uint16_t ad7994_read_channel(uint8_t channel)
{
    uint8_t msb, lsb;
    uint16_t result;
    uint8_t i2c_error;
    uint8_t detected_channel;
    char debug_buf[64];

    // ABSOLUTE MINIMUM: Just read in power-on default state
    i2c_error = i2c_start();
    if (i2c_error)
        return 0xFFFF;

    i2c_error = i2c_write(0x43);  // Read address (0x21 << 1 | 1)
    if (i2c_error)
    {
        i2c_stop();
        return 0xFFFF;
    }

    msb = i2c_read(1);  // ACK
    lsb = i2c_read(0);  // NACK
    i2c_stop();

    // Extract channel ID from upper 4 bits
    detected_channel = (msb >> 4) & 0x0F;

    // Extract 12-bit value from lower 12 bits
    result = ((uint16_t)(msb & 0x0F) << 8) | lsb;

    // Debug output
    sprintf(debug_buf, "Chan=%u Value=%u", detected_channel, result);
    uart_println(debug_buf);

    return result;
}

void ad7994_read_all(uint16_t *ch1, uint16_t *ch2, uint16_t *ch3)
{
    uint8_t msb, lsb;
    uint8_t i2c_error;
    char debug_buf[64];

    // TEST: CH1 only with 0x18 config
    // If this works, we know config writes succeed with single channel

    // Pulse CONVST to trigger conversion (increased timing for reliability)
    uart_println("Pulsing CONVST");
    ADC_CONVST = 1;
    __delay_us(10);  // 10µs high pulse
    ADC_CONVST = 0;
    __delay_us(10);  // 10µs settling time after pulse

    // ===== Read CH1 only =====
    uart_println("Reading CH1");
    i2c_error = i2c_start();
    if (i2c_error) { uart_println("CH1: START fail"); *ch1 = 0xFFFF; *ch2 = 0xFFFF; *ch3 = 0xFFFF; return; }

    i2c_error = i2c_write(0x43);  // Read address (0x21 << 1 | 1)
    if (i2c_error) { uart_println("CH1: Addr fail"); i2c_stop(); *ch1 = 0xFFFF; *ch2 = 0xFFFF; *ch3 = 0xFFFF; return; }

    msb = i2c_read(1);  // ACK
    lsb = i2c_read(0);  // NACK
    i2c_stop();

    *ch1 = ((uint16_t)(msb & 0x0F) << 8) | lsb;
    sprintf(debug_buf, "CH1: Value=%u (MSB=0x%02X LSB=0x%02X)", *ch1, msb, lsb);
    uart_println(debug_buf);

    // Set CH2 and CH3 to zero for now (not configured)
    *ch2 = 0;
    *ch3 = 0;
    uart_println("CH2/CH3: Not configured (testing CH1 only)");
}