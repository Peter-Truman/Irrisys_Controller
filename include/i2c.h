/**
 * I2C Driver for DS3231M RTC + M24M01 EEPROM
 * PIC18F26K22 @ 32MHz
 * I2C Clock: ~10kHz (SSPADD=199)
 */

#ifndef I2C_H
#define I2C_H

#include <xc.h>
#include <stdint.h>

// I2C Configuration
#define I2C_CLOCK_FREQ 10000UL // ~10kHz actual bus speed (SSPADD=199); unused
#define I2C_TIMEOUT 1000       // Timeout counter limit (~1ms at Fcy=8MHz)

// Function prototypes
void i2c_init(void);
uint8_t i2c_start(void);
uint8_t i2c_restart(void);
void i2c_stop(void);
uint8_t i2c_write(uint8_t data);
uint8_t i2c_read(uint8_t ack);
uint8_t i2c_wait_idle(void);

#endif // I2C_H