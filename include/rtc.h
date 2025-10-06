/**
 * DS3231M RTC Driver
 * I2C Real-Time Clock with Temperature Compensation
 */

#ifndef RTC_H
#define RTC_H

#include <xc.h>
#include <stdint.h>

// DS3231M I2C Address
#define RTC_ADDR_WRITE 0xD0
#define RTC_ADDR_READ 0xD1

// DS3231M Register Addresses
#define RTC_REG_SECONDS 0x00
#define RTC_REG_MINUTES 0x01
#define RTC_REG_HOURS 0x02
#define RTC_REG_DAY 0x03
#define RTC_REG_DATE 0x04
#define RTC_REG_MONTH 0x05
#define RTC_REG_YEAR 0x06
#define RTC_REG_ALARM1_SEC 0x07
#define RTC_REG_ALARM1_MIN 0x08
#define RTC_REG_ALARM1_HOUR 0x09
#define RTC_REG_ALARM1_DAY 0x0A
#define RTC_REG_ALARM2_MIN 0x0B
#define RTC_REG_ALARM2_HOUR 0x0C
#define RTC_REG_ALARM2_DAY 0x0D
#define RTC_REG_CONTROL 0x0E
#define RTC_REG_STATUS 0x0F
#define RTC_REG_AGING 0x10
#define RTC_REG_TEMP_MSB 0x11
#define RTC_REG_TEMP_LSB 0x12

// Control Register Bits (0Eh)
#define RTC_CTRL_EOSC 0x80  // Enable Oscillator (0=enabled)
#define RTC_CTRL_BBSQW 0x40 // Battery-Backed Square Wave
#define RTC_CTRL_CONV 0x20  // Convert Temperature
#define RTC_CTRL_INTCN 0x04 // Interrupt Control (1=alarm interrupt)
#define RTC_CTRL_A2IE 0x02  // Alarm 2 Interrupt Enable
#define RTC_CTRL_A1IE 0x01  // Alarm 1 Interrupt Enable

// Status Register Bits (0Fh)
#define RTC_STAT_OSF 0x80     // Oscillator Stop Flag
#define RTC_STAT_EN32KHZ 0x08 // Enable 32kHz Output
#define RTC_STAT_BSY 0x04     // Busy (temperature conversion)
#define RTC_STAT_A2F 0x02     // Alarm 2 Flag
#define RTC_STAT_A1F 0x01     // Alarm 1 Flag

// BCD conversion macros
#define BCD2BIN(val) (((val) & 0x0F) + (((val) >> 4) * 10))
#define BIN2BCD(val) ((((val) / 10) << 4) + ((val) % 10))

// Function prototypes
void rtc_init(void);
uint8_t rtc_read_register(uint8_t reg);
void rtc_write_register(uint8_t reg, uint8_t data);
void rtc_read_time(uint8_t *hours, uint8_t *minutes, uint8_t *seconds);
void rtc_read_date(uint8_t *year, uint8_t *month, uint8_t *date, uint8_t *day);
void rtc_write_time(uint8_t hours, uint8_t minutes, uint8_t seconds);
void rtc_write_date(uint8_t year, uint8_t month, uint8_t date, uint8_t day);
uint8_t rtc_check_oscillator(void);
void rtc_clear_alarm_flags(void);

// Runtime counter (incremented every second by RTC 1Hz output)
extern volatile uint32_t rtc_second_counter;
extern uint8_t rtc_control_readback; // ADD THIS LINE
extern uint8_t rtc_status_readback;

// Function to reset counter
void rtc_reset_counter(void);

#endif // RTC_H