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
    { i2c_stop(); return 1; }
    if (i2c_write(reg))
    { i2c_stop(); return 1; }
    if (i2c_write(value))
    { i2c_stop(); return 1; }
    i2c_stop();
    return 0;
}

// Read from RTC register

// Initialize RTC for 1Hz square wave output
uint8_t rtc_init(void)
{
    // RTC oscillator stabilization after power-up.
    // DS3231M datasheet specifies 250-300ms minimum; 500ms gives ~2x margin
    // (was 1000ms, which just slowed boot with no benefit).
    // [R5] Feed the watchdog every 1ms so this can't trip a tight WDT timeout.
    for (uint16_t i = 0; i < 500; i++)
    {
        CLRWDT();
        __delay_ms(1);
    }

    // Configure Control Register for 1Hz square wave ONLY
    // Control Register (0x0E) = 0x00
    if (rtc_write_register(RTC_REG_CONTROL, 0x00))
    {
        return 1;
    }

    return 0;
}

// Convert BCD to decimal

// Convert decimal to BCD

// Set RTC time

// Read current time from RTC
