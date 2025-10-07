// rtc.c - DS3231M RTC Driver
#include "../include/rtc.h"
#include "../include/i2c.h"
#include "../include/config.h"
#include <stdio.h>
#include <xc.h>

// Write to RTC register
uint8_t rtc_write_register(uint8_t reg, uint8_t value)
{
    if (i2c_start())
        return 1;
    if (i2c_write((RTC_I2C_ADDR << 1) | 0))
        return 1;
    if (i2c_write(reg))
        return 1;
    if (i2c_write(value))
        return 1;
    i2c_stop();
    return 0;
}

// Read from RTC register
uint8_t rtc_read_register(uint8_t reg, uint8_t *value)
{
    if (i2c_start())
        return 1;
    if (i2c_write((RTC_I2C_ADDR << 1) | 0))
        return 1;
    if (i2c_write(reg))
        return 1;

    if (i2c_restart())
        return 1;
    if (i2c_write((RTC_I2C_ADDR << 1) | 1))
        return 1;
    *value = i2c_read(0);
    i2c_stop();
    return 0;
}

// Initialize RTC for 1Hz square wave output
uint8_t rtc_init(void)
{
    // CRITICAL: 2-second delay for RTC oscillator to stabilize after power-up
    // DS3231M datasheet specifies 250-300ms minimum, we use 2000ms for safety
    __delay_ms(500);
    __delay_ms(500);
    __delay_ms(500);
    __delay_ms(500);

    // Configure Control Register for 1Hz square wave ONLY
    // Control Register (0x0E) = 0x00
    if (rtc_write_register(RTC_REG_CONTROL, 0x00))
    {
        return 1;
    }

    return 0;
}

// Convert BCD to decimal
uint8_t bcd_to_dec(uint8_t bcd)
{
    return ((bcd >> 4) * 10) + (bcd & 0x0F);
}

// Convert decimal to BCD
uint8_t dec_to_bcd(uint8_t dec)
{
    return ((dec / 10) << 4) | (dec % 10);
}

// Set RTC time
uint8_t rtc_set_time(rtc_time_t *time)
{
    uint8_t data[7];

    // Convert to BCD
    data[0] = dec_to_bcd(time->seconds);
    data[1] = dec_to_bcd(time->minutes);
    data[2] = dec_to_bcd(time->hours);
    data[3] = dec_to_bcd(time->day);
    data[4] = dec_to_bcd(time->date);
    data[5] = dec_to_bcd(time->month);
    data[6] = dec_to_bcd(time->year);

    // Write all 7 bytes starting at register 0x00
    if (i2c_start())
        return 1;
    __delay_us(50); // <-- ADD: After START

    if (i2c_write((RTC_I2C_ADDR << 1) | 0))
        return 1;
    __delay_us(50); // <-- ADD: After address

    if (i2c_write(0x00))
        return 1;
    __delay_us(50); // <-- ADD: After register address

    for (uint8_t i = 0; i < 7; i++)
    {
        if (i2c_write(data[i]))
            return 1;
        __delay_us(50); // <-- ADD: After each data byte (CRITICAL!)
    }

    i2c_stop();
    __delay_us(200); // <-- ADD: After STOP
    return 0;
}

// Read current time from RTC
uint8_t rtc_read_time(rtc_time_t *time)
{
    uint8_t data[7];

    // Write register address with delays between operations
    if (i2c_start())
        return 1;
    __delay_us(50); // Small delay after start

    if (i2c_write((RTC_I2C_ADDR << 1) | 0))
        return 1;
    __delay_us(50); // Small delay after address write

    if (i2c_write(0x00))
        return 1;
    __delay_us(50); // Small delay after register write

    i2c_stop();
    __delay_us(200); // Longer delay after stop

    // Start new transaction to read
    if (i2c_start())
        return 1;
    __delay_us(50);

    if (i2c_write((RTC_I2C_ADDR << 1) | 1))
        return 1;
    __delay_us(50);

    for (uint8_t i = 0; i < 6; i++)
    {
        data[i] = i2c_read(1);
    }
    data[6] = i2c_read(0);
    i2c_stop();

    // Keep RAW output for now
    char debug_buf[80];
    sprintf(debug_buf, "RAW: %02X %02X %02X %02X %02X %02X %02X",
            data[0], data[1], data[2], data[3], data[4], data[5], data[6]);
    uart_println(debug_buf);

    // Convert BCD to decimal
    time->seconds = bcd_to_dec(data[0] & 0x7F);
    time->minutes = bcd_to_dec(data[1] & 0x7F);
    time->hours = bcd_to_dec(data[2] & 0x3F);
    time->day = bcd_to_dec(data[3] & 0x07);
    time->date = bcd_to_dec(data[4] & 0x3F);
    time->month = bcd_to_dec(data[5] & 0x1F);
    time->year = bcd_to_dec(data[6]);

    return 0;
}