/**
 * DS3231M RTC Driver
 * I2C Real-Time Clock with 1Hz Square Wave Output
 *
 * Hardware Connection:
 * - RTC INT/SQW (pin 3) -> PIC RB0 (with 4.7k pullup)
 * - RTC SCL -> PIC RC3
 * - RTC SDA -> PIC RC4
 */

#ifndef RTC_H
#define RTC_H

#include <xc.h>
#include <stdint.h>

// DS3231M I2C Address
#define RTC_I2C_ADDR_WRITE 0xD0 // 1101 000 0
#define RTC_I2C_ADDR_READ 0xD1  // 1101 000 1
#define RTC_I2C_ADDR 0x68       // 7-bit address (ADD THIS LINE)

// DS3231M Register Addresses
#define RTC_REG_SECONDS 0x00
#define RTC_REG_MINUTES 0x01
#define RTC_REG_HOURS 0x02
#define RTC_REG_CONTROL 0x0E // Control register
#define RTC_REG_STATUS 0x0F  // Status register

// Control Register Bit Definitions
#define RTC_CTRL_EOSC 0x80  // Enable Oscillator (0=enabled, 1=disabled)
#define RTC_CTRL_BBSQW 0x40 // Battery-Backed Square Wave
#define RTC_CTRL_CONV 0x20  // Convert Temperature
#define RTC_CTRL_INTCN 0x04 // Interrupt Control (0=SQW, 1=Interrupt)
#define RTC_CTRL_A2IE 0x02  // Alarm 2 Interrupt Enable
#define RTC_CTRL_A1IE 0x01  // Alarm 1 Interrupt Enable

// Function prototypes
uint8_t rtc_init(void);
uint8_t rtc_write_register(uint8_t reg, uint8_t value);
uint8_t rtc_read_register(uint8_t reg, uint8_t *value);

typedef struct
{
    uint8_t seconds;
    uint8_t minutes;
    uint8_t hours;
    uint8_t day;
    uint8_t date;
    uint8_t month;
    uint8_t year;
} rtc_time_t;

uint8_t rtc_read_time(rtc_time_t *time);
uint8_t bcd_to_dec(uint8_t bcd);

#endif // RTC_H