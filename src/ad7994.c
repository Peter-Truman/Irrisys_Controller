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
    uart_println("ADC Init: Starting...");

    TRISCbits.TRISC5 = 0;
    ADC_CONVST = 0;
    __delay_ms(10);
    uart_println("ADC Init: CONVST configured");

    uart_println("ADC Init: Writing config register...");

    if (i2c_start())
    {
        uart_println("ADC Init: ERROR - Start failed");
        return 1;
    }

    if (i2c_write((AD7994_ADDR << 1) | 0))
    {
        uart_println("ADC Init: ERROR - Address write failed");
        i2c_stop();
        return 2;
    }
    uart_println("ADC Init: Address ACK received");

    if (i2c_write(AD7994_REG_CONFIG))
    {
        uart_println("ADC Init: ERROR - Config register address failed");
        i2c_stop();
        return 3;
    }
    uart_println("ADC Init: Config register address ACK");

    if (i2c_write(AD7994_CONFIG_DEFAULT))
    {
        uart_println("ADC Init: ERROR - Config data write failed");
        i2c_stop();
        return 4;
    }
    uart_println("ADC Init: Config written successfully");

    i2c_stop();
    uart_println("ADC Init: Complete - SUCCESS");
    return 0;
}

uint16_t ad7994_read_channel(uint8_t channel)
{
    uint8_t config_byte;
    uint8_t msb, lsb;
    uint16_t result;
    char buf[40];

    sprintf(buf, "ADC Read CH%u: Start", channel);
    uart_println(buf);

    switch (channel)
    {
    case 1:
        config_byte = AD7994_CONFIG_DEFAULT | AD7994_CH1;
        break;
    case 2:
        config_byte = AD7994_CONFIG_DEFAULT | AD7994_CH2;
        break;
    case 3:
        config_byte = AD7994_CONFIG_DEFAULT | AD7994_CH3;
        break;
    case 4:
        config_byte = AD7994_CONFIG_DEFAULT | AD7994_CH4;
        break;
    default:
        uart_println("ADC Read: ERROR - Invalid channel");
        return 0xFFFF;
    }

    i2c_start();
    i2c_write((AD7994_ADDR << 1) | 0);
    i2c_write(AD7994_REG_CONFIG);
    i2c_write(config_byte);
    i2c_stop();

    ADC_CONVST = 1;
    __delay_us(1);
    ADC_CONVST = 0;
    __delay_us(2);

    i2c_start();
    i2c_write((AD7994_ADDR << 1) | 0);
    i2c_write(AD7994_REG_CONVERSION);
    i2c_stop();

    i2c_start();
    i2c_write((AD7994_ADDR << 1) | 1);
    msb = i2c_read(1);
    lsb = i2c_read(0);
    i2c_stop();

    result = ((uint16_t)msb << 8) | lsb;

    sprintf(buf, "ADC Read: MSB=0x%02X LSB=0x%02X Raw=0x%04X", msb, lsb, result);
    uart_println(buf);

    result &= 0x0FFF;

    sprintf(buf, "ADC Read: Final=%u", result);
    uart_println(buf);

    return result;
}