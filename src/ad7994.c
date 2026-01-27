// ad7994.c - 12-bit 4-channel ADC driver (CH1, CH2, CH3)
#include "../include/ad7994.h"
#include "../include/i2c.h"
#include "../include/config.h"
#include <xc.h>

// CONVST pin on RC5
#define ADC_CONVST LATCbits.LATC5

uint8_t ad7994_init(void)
{
    uint8_t i2c_error;

    // 100ms power-on delay for device initialization
    __delay_ms(100);

    // MODE 1: Auto-incrementing address pointer

    // Enable CH1+CH2+CH3 with filter: 0x10|0x20|0x40|0x08 = 0x78
    i2c_error = i2c_start();
    if (i2c_error) return 1;

    i2c_error = i2c_write(0x42);  // Write address (0x21 << 1)
    if (i2c_error) { i2c_stop(); return 2; }

    i2c_error = i2c_write(0x02);  // Config register
    if (i2c_error) { i2c_stop(); return 3; }

    i2c_error = i2c_write(0x78);  // CH1+CH2+CH3 + Filter
    if (i2c_error) { i2c_stop(); return 4; }

    i2c_stop();

    // 100ms delay after config write for device to process
    __delay_ms(100);

    // Step 2: Point to conversion result register (0x00)
    i2c_error = i2c_start();
    if (i2c_error) return 5;

    i2c_error = i2c_write(0x42);  // Write address (0x21 << 1)
    if (i2c_error) { i2c_stop(); return 6; }

    i2c_error = i2c_write(0x00);  // Conversion result register
    if (i2c_error) { i2c_stop(); return 7; }

    i2c_stop();

    // 100ms delay after pointer write for device to process
    __delay_ms(100);

    return 0;
}

uint16_t ad7994_read_channel(uint8_t channel)
{
    uint8_t msb, lsb;
    uint16_t result;
    uint8_t i2c_error;

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

    // Extract 12-bit value from lower 12 bits
    result = ((uint16_t)(msb & 0x0F) << 8) | lsb;

    return result;
}

void ad7994_read_all(uint16_t *ch1, uint16_t *ch2, uint16_t *ch3)
{
    uint8_t msb, lsb;
    uint8_t i2c_error;
    uint8_t detected_ch;
    uint16_t value;

    *ch1 = 0xFFFF;
    *ch2 = 0xFFFF;
    *ch3 = 0xFFFF;

    // Pulse CONVST to trigger conversion
    ADC_CONVST = 1;
    __delay_us(10);
    ADC_CONVST = 0;
    __delay_us(10);

    // Read 3 channels (6 bytes) in one I2C transaction
    i2c_error = i2c_start();
    if (i2c_error) return;

    i2c_error = i2c_write(0x43);  // Read address
    if (i2c_error) { i2c_stop(); return; }

    for (uint8_t i = 0; i < 3; i++)
    {
        msb = i2c_read(1);                    // ACK (more bytes follow)
        lsb = i2c_read(i < 2 ? 1 : 0);       // ACK for first 2, NACK for last

        detected_ch = (msb >> 4) & 0x03;      // Channel ID in bits [5:4]
        value = ((uint16_t)(msb & 0x0F) << 8) | lsb;

        if (detected_ch == 0) *ch1 = value;
        else if (detected_ch == 1) *ch2 = value;
        else if (detected_ch == 2) *ch3 = value;
    }

    i2c_stop();
}