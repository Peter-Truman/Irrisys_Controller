/**
 * I2C Driver Implementation for DS3231M RTC
 * PIC18F2525 @ 32MHz (Fcy = 8MHz)
 * I2C Clock: 100kHz
 *
 * Conservative blocking implementation with timeout protection
 */

#include "../include/config.h"
#include "../include/i2c.h"

/**
 * Initialize I2C in Master Mode
 * SCL = RC3, SDA = RC4
 */
void i2c_init(void)
{
    // Configure I2C pins
    TRISCbits.TRISC3 = 1; // SCL as input (becomes output when driven by MSSP)
    TRISCbits.TRISC4 = 1; // SDA as input (becomes output when driven by MSSP)

    // Configure MSSP for I2C Master Mode
    SSPSTAT = 0x80; // Slew rate control disabled for 100kHz
    SSPCON1 = 0x28; // I2C Master mode, SSPEN enabled
    SSPCON2 = 0x00; // Clear control bits

    // Set I2C clock frequency: 100kHz
    // SSPADD = (Fcy / (4 * I2C_freq)) - 1
    // SSPADD = (8MHz / (4 * 100kHz)) - 1 = 19
    SSPADD = 19;

    // Small delay for bus to settle
    __delay_us(10);
}

/**
 * Wait for I2C bus to become idle with timeout
 * Returns: 0 = success, 1 = timeout
 */
uint8_t i2c_wait_idle(void)
{
    uint16_t timeout = I2C_TIMEOUT;

    // Wait for idle condition (all control bits clear)
    while ((SSPCON2 & 0x1F) || (SSPSTATbits.R_nW))
    {
        if (--timeout == 0)
            return 1; // Timeout error
    }
    return 0; // Success
}

/**
 * Generate I2C START condition
 * Returns: 0 = success, 1 = error
 */
uint8_t i2c_start(void)
{
    if (i2c_wait_idle())
        return 1;

    SSPCON2bits.SEN = 1; // Initiate START condition

    // Wait for START to complete
    uint16_t timeout = I2C_TIMEOUT;
    while (SSPCON2bits.SEN)
    {
        if (--timeout == 0)
            return 1; // Timeout
    }

    return 0;
}

/**
 * Generate I2C Repeated START condition
 * Returns: 0 = success, 1 = error
 */
uint8_t i2c_restart(void)
{
    if (i2c_wait_idle())
        return 1;

    SSPCON2bits.RSEN = 1; // Initiate Repeated START

    uint16_t timeout = I2C_TIMEOUT;
    while (SSPCON2bits.RSEN)
    {
        if (--timeout == 0)
            return 1;
    }

    return 0;
}

/**
 * Generate I2C STOP condition
 */
void i2c_stop(void)
{
    if (i2c_wait_idle())
        return; // Can't stop if bus is stuck

    SSPCON2bits.PEN = 1; // Initiate STOP condition

    // Wait for STOP to complete
    uint16_t timeout = I2C_TIMEOUT;
    while (SSPCON2bits.PEN)
    {
        if (--timeout == 0)
            break;
    }
}

/**
 * Write a byte to I2C bus
 * Returns: 0 = ACK received, 1 = NACK or error
 */
uint8_t i2c_write(uint8_t data)
{
    if (i2c_wait_idle())
        return 1;

    SSPBUF = data; // Write data to buffer

    // Wait for transmission to complete
    uint16_t timeout = I2C_TIMEOUT;
    while (SSPSTATbits.BF)
    {
        if (--timeout == 0)
            return 1;
    }

    // Wait for ACK/NACK
    if (i2c_wait_idle())
        return 1;

    // Check for ACK (0 = ACK, 1 = NACK)
    return SSPCON2bits.ACKSTAT;
}

/**
 * Read a byte from I2C bus
 * ack: 1 = send ACK (continue reading), 0 = send NACK (stop reading)
 * Returns: received byte
 */
uint8_t i2c_read(uint8_t ack)
{
    uint8_t data;

    if (i2c_wait_idle())
        return 0xFF; // Return dummy data on error

    SSPCON2bits.RCEN = 1; // Enable receive mode

    // Wait for byte to be received
    uint16_t timeout = I2C_TIMEOUT;
    while (!SSPSTATbits.BF)
    {
        if (--timeout == 0)
            return 0xFF;
    }

    data = SSPBUF; // Read received data

    if (i2c_wait_idle())
        return data;

    // Send ACK or NACK
    SSPCON2bits.ACKDT = ack ? 0 : 1; // 0 = ACK, 1 = NACK
    SSPCON2bits.ACKEN = 1;           // Send ACK/NACK

    // Wait for ACK/NACK to complete
    timeout = I2C_TIMEOUT;
    while (SSPCON2bits.ACKEN)
    {
        if (--timeout == 0)
            break;
    }

    return data;
}