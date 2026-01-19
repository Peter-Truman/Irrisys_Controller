#ifndef AD7994_H
#define AD7994_H

#include <stdint.h>

// AD7994 I2C Address - CONFIRMED via logic analyzer
// AD7994BRUZ-0REEL actual address: 0x21 (7-bit)
// 8-bit write: 0x42, 8-bit read: 0x43
#define AD7994_ADDR 0x21

// AD7994 Register Addresses
#define AD7994_REG_CONVERSION 0x00
#define AD7994_REG_ALERT_STATUS 0x01
#define AD7994_REG_CONFIG 0x02
#define AD7994_REG_CYCLE 0x03

// Channel selection bits for configuration register
#define AD7994_CH1 0x10 // Bit 4
#define AD7994_CH2 0x20 // Bit 5
#define AD7994_CH3 0x40 // Bit 6
#define AD7994_CH4 0x80 // Bit 7

// Configuration register default (filtering enabled)
#define AD7994_CONFIG_DEFAULT 0x08 // FLTR=1, others=0

// Function prototypes
uint8_t ad7994_init(void);
uint16_t ad7994_read_channel(uint8_t channel);
void ad7994_read_all(uint16_t *ch1, uint16_t *ch2, uint16_t *ch3);

#endif // AD7994_H