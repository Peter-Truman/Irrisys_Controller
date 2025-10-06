/**
 * I2C Master Mode Driver for PIC18F2525
 * Using MSSP module
 */

#ifndef I2C_H
#define I2C_H

#include <xc.h>
#include <stdint.h>

// I2C Configuration
#define I2C_SPEED_100KHZ 79 // SSPADD value for 100kHz @ 32MHz
#define I2C_SPEED_400KHZ 19 // SSPADD value for 400kHz @ 32MHz

// Function prototypes
void i2c_init(void);
void i2c_start(void);
void i2c_restart(void);
void i2c_stop(void);
void i2c_write(uint8_t data);
uint8_t i2c_read(uint8_t ack);
void i2c_wait(void);

#endif // I2C_H