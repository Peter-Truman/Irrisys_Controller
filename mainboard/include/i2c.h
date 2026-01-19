/**
 * I2C Driver for DS3231M RTC
 * PIC18F2525 @ 32MHz
 * I2C Clock: 100kHz
 */

#ifndef I2C_H
#define I2C_H

#include <xc.h>
#include <stdint.h>

// I2C Configuration
#define I2C_CLOCK_FREQ 100000UL // 100kHz I2C bus speed
#define I2C_TIMEOUT 1000        // Timeout counter limit

// Function prototypes
void i2c_init(void);
uint8_t i2c_start(void);
uint8_t i2c_restart(void);
void i2c_stop(void);
uint8_t i2c_write(uint8_t data);
uint8_t i2c_read(uint8_t ack);
uint8_t i2c_wait_idle(void);

#endif // I2C_H