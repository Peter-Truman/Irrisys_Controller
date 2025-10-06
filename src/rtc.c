/**
 * DS3231M RTC Implementation
 */

#define _XTAL_FREQ 32000000 // 32MHz (8MHz * 4 PLL)

#include "../include/rtc.h"
#include "../include/i2c.h"

// Global second counter (max 604800 = 1 week)
volatile uint32_t rtc_second_counter = 0;

// Diagnostic readback values - ADD THESE TWO LINES
uint8_t rtc_control_readback = 0;
uint8_t rtc_status_readback = 0;

void rtc_reset_counter(void)
{
    rtc_second_counter = 0;
}

void rtc_init(void)
{
    // Single write to enable 1Hz square wave - nothing else
    rtc_write_register(RTC_REG_CONTROL, 0x00);
    __delay_ms(200);

    // Set dummy values for diagnostics
    rtc_control_readback = 0x00;
    rtc_status_readback = 0x00;
}
uint8_t rtc_read_register(uint8_t reg)
{
    uint8_t data;

    i2c_start();
    i2c_write(RTC_ADDR_WRITE); // Address RTC for write
    i2c_write(reg);            // Write register address
    i2c_restart();             // Repeated start
    i2c_write(RTC_ADDR_READ);  // Address RTC for read
    data = i2c_read(0);        // Read data with NACK
    i2c_stop();

    return data;
}

void rtc_write_register(uint8_t reg, uint8_t data)
{
    i2c_start();
    i2c_write(RTC_ADDR_WRITE); // Address RTC for write
    i2c_write(reg);            // Write register address
    i2c_write(data);           // Write data
    i2c_stop();
}

void rtc_read_time(uint8_t *hours, uint8_t *minutes, uint8_t *seconds)
{
    uint8_t data;

    i2c_start();
    i2c_write(RTC_ADDR_WRITE);
    i2c_write(RTC_REG_SECONDS); // Start at seconds register
    i2c_restart();
    i2c_write(RTC_ADDR_READ);

    // Read seconds (ignore bit 7)
    data = i2c_read(1); // ACK - more bytes to read
    *seconds = BCD2BIN(data & 0x7F);

    // Read minutes (ignore bit 7)
    data = i2c_read(1); // ACK - more bytes to read
    *minutes = BCD2BIN(data & 0x7F);

    // Read hours (24-hour format)
    data = i2c_read(0); // NACK - last byte
    *hours = BCD2BIN(data & 0x3F);

    i2c_stop();
}

void rtc_write_time(uint8_t hours, uint8_t minutes, uint8_t seconds)
{
    i2c_start();
    i2c_write(RTC_ADDR_WRITE);
    i2c_write(RTC_REG_SECONDS);
    i2c_write(BIN2BCD(seconds));
    i2c_write(BIN2BCD(minutes));
    i2c_write(BIN2BCD(hours)); // 24-hour format (bit 6 = 0)
    i2c_stop();
}

void rtc_read_date(uint8_t *year, uint8_t *month, uint8_t *date, uint8_t *day)
{
    uint8_t data;

    i2c_start();
    i2c_write(RTC_ADDR_WRITE);
    i2c_write(RTC_REG_DAY); // Start at day register
    i2c_restart();
    i2c_write(RTC_ADDR_READ);

    data = i2c_read(1); // Day of week (1-7)
    *day = BCD2BIN(data & 0x07);

    data = i2c_read(1); // Date (1-31)
    *date = BCD2BIN(data & 0x3F);

    data = i2c_read(1); // Month (ignore century bit 7)
    *month = BCD2BIN(data & 0x1F);

    data = i2c_read(0); // Year (00-99)
    *year = BCD2BIN(data);

    i2c_stop();
}

void rtc_write_date(uint8_t year, uint8_t month, uint8_t date, uint8_t day)
{
    i2c_start();
    i2c_write(RTC_ADDR_WRITE);
    i2c_write(RTC_REG_DAY);
    i2c_write(BIN2BCD(day));
    i2c_write(BIN2BCD(date));
    i2c_write(BIN2BCD(month));
    i2c_write(BIN2BCD(year));
    i2c_stop();
}

uint8_t rtc_check_oscillator(void)
{
    uint8_t status = rtc_read_register(RTC_REG_STATUS);
    return (status & RTC_STAT_OSF) ? 0 : 1; // Return 1 if running, 0 if stopped
}

void rtc_clear_alarm_flags(void)
{
    uint8_t status = rtc_read_register(RTC_REG_STATUS);
    status &= ~(RTC_STAT_A1F | RTC_STAT_A2F); // Clear both alarm flags
    rtc_write_register(RTC_REG_STATUS, status);
}