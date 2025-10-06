/**
 * DS3231M RTC Driver Implementation
 *
 * Critical Requirements:
 * - 2 second delay after power-up before I2C communication
 * - Control register 0x0E = 0x00 enables 1Hz square wave on INT/SQW
 */

// #define _XTAL_FREQ 32000000 // 32MHz

#include "../include/config.h"
#include "../include/rtc.h"
#include "../include/i2c.h"

/**
 * Write to a single RTC register
 * Returns: 0 = success, 1 = error
 */
uint8_t rtc_write_register(uint8_t reg, uint8_t value)
{
    // START condition
    if (i2c_start())
        return 1;

    // Send device address + WRITE
    if (i2c_write(RTC_I2C_ADDR_WRITE))
    {
        i2c_stop();
        return 1;
    }

    // Send register address
    if (i2c_write(reg))
    {
        i2c_stop();
        return 1;
    }

    // Send data byte
    if (i2c_write(value))
    {
        i2c_stop();
        return 1;
    }

    // STOP condition
    i2c_stop();

    return 0; // Success
}

/**
 * Read from a single RTC register
 * Returns: 0 = success, 1 = error
 */
uint8_t rtc_read_register(uint8_t reg, uint8_t *value)
{
    // START condition
    if (i2c_start())
        return 1;

    // Send device address + WRITE
    if (i2c_write(RTC_I2C_ADDR_WRITE))
    {
        i2c_stop();
        return 1;
    }

    // Send register address
    if (i2c_write(reg))
    {
        i2c_stop();
        return 1;
    }

    // Repeated START
    if (i2c_restart())
    {
        i2c_stop();
        return 1;
    }

    // Send device address + READ
    if (i2c_write(RTC_I2C_ADDR_READ))
    {
        i2c_stop();
        return 1;
    }

    // Read data byte (send NACK to stop)
    *value = i2c_read(0);

    // STOP condition
    i2c_stop();

    return 0; // Success
}

/**
 * Initialize DS3231M RTC for 1Hz square wave output
 *
 * CRITICAL: This function includes a 2-second delay for RTC power-up
 *
 * Configuration:
 * - Control Register (0x0E) = 0x00
 *   - EOSC = 0   (oscillator enabled)
 *   - BBSQW = 0  (no battery-backed square wave)
 *   - CONV = 0   (no temperature conversion)
 *   - INTCN = 0  (SQUARE WAVE mode - this is critical!)
 *   - A2IE = 0   (alarm 2 interrupt disabled)
 *   - A1IE = 0   (alarm 1 interrupt disabled)
 *
 * This configuration enables 1Hz square wave output on INT/SQW pin (pin 3)
 *
 * Returns: 0 = success, 1 = error
 */
uint8_t rtc_init(void)
{
    // CRITICAL: 2-second delay for RTC oscillator to stabilize after power-up
    // DS3231M datasheet specifies 250-300ms minimum, we use 2000ms for safety
    __delay_ms(500);
    __delay_ms(500);
    __delay_ms(500);
    __delay_ms(500); // Total: 2000ms

    // Configure Control Register for 1Hz square wave ONLY
    // Control Register (0x0E) = 0x00
    // This enables 1Hz square wave on INT/SQW pin
    if (rtc_write_register(RTC_REG_CONTROL, 0x00))
    {
        return 1; // Initialization failed
    }

    // DO NOT write to Status Register
    // DO NOT read any registers
    // Just configure and leave it alone

    return 0; // Success
}