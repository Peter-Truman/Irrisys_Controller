/**
 * I2C Master Mode Implementation
 * Hardware: RC3 = SCL, RC4 = SDA
 */

#include "../include/i2c.h"

void i2c_init(void)
{
    // Configure I2C pins
    TRISCbits.TRISC3 = 1; // SCL as input (I2C will control)
    TRISCbits.TRISC4 = 1; // SDA as input (I2C will control)

    // Configure MSSP module for I2C Master mode
    SSPSTAT = 0b10000000;      // Slew rate control disabled for 100kHz
    SSPCON1 = 0b00101000;      // I2C Master mode, SSPEN enabled
    SSPCON2 = 0x00;            // Clear control bits
    SSPADD = I2C_SPEED_100KHZ; // Set baud rate to 100kHz

    // Clear any error conditions
    SSPCON1bits.WCOL = 0;
    SSPCON1bits.SSPOV = 0;
}

void i2c_wait(void)
{
    // Wait for I2C operation to complete
    while ((SSPCON2 & 0x1F) || (SSPSTATbits.R_nW))
        ;
}

void i2c_start(void)
{
    i2c_wait();
    SSPCON2bits.SEN = 1; // Initiate START condition
    while (SSPCON2bits.SEN)
        ; // Wait for START to complete
}

void i2c_restart(void)
{
    i2c_wait();
    SSPCON2bits.RSEN = 1; // Initiate Repeated START
    while (SSPCON2bits.RSEN)
        ; // Wait for restart to complete
}

void i2c_stop(void)
{
    i2c_wait();
    SSPCON2bits.PEN = 1; // Initiate STOP condition
    while (SSPCON2bits.PEN)
        ; // Wait for STOP to complete
}

void i2c_write(uint8_t data)
{
    i2c_wait();
    SSPBUF = data; // Write data to buffer
    while (SSPSTATbits.BF)
        ; // Wait until write completes
    i2c_wait();

    // Check for acknowledge
    // If ACKSTAT = 0, slave acknowledged
    // If ACKSTAT = 1, slave did not acknowledge (NACK)
}

uint8_t i2c_read(uint8_t ack)
{
    uint8_t data;

    i2c_wait();
    SSPCON2bits.RCEN = 1; // Enable receive mode
    while (!SSPSTATbits.BF)
        ;          // Wait for receive to complete
    data = SSPBUF; // Read data from buffer

    i2c_wait();

    // Send ACK or NACK
    if (ack)
    {
        SSPCON2bits.ACKDT = 0; // Send ACK
    }
    else
    {
        SSPCON2bits.ACKDT = 1; // Send NACK
    }
    SSPCON2bits.ACKEN = 1; // Initiate ACK/NACK
    while (SSPCON2bits.ACKEN)
        ; // Wait for ACK/NACK to complete

    return data;
}