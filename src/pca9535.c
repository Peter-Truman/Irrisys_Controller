/**
 * PCA9535DWR - 16-bit I2C I/O Expander Driver
 * I2C Address: 0x21
 */

#define _XTAL_FREQ 32000000UL  // 32MHz (8MHz internal + 4x PLL)

#include "../include/pca9535.h"
#include "../include/i2c.h"
#include "../include/eeprom.h"
#include <xc.h>
#include <stdio.h>

// External UART function declaration (defined in main.c)
extern void uart_println(const char *str);

// Internal state variable to track Port 0 output state
static uint8_t port0_output_state = 0x00;

/**
 * Write a single byte to a PCA9535 register
 * @param reg_addr Register address (0x00-0x07)
 * @param value Value to write
 * @return 0 on success, 1 on failure
 */
uint8_t pca9535_write_register(uint8_t reg_addr, uint8_t value)
{
    char buf[60];
    sprintf(buf, "PCA9535: Write reg 0x%02X = 0x%02X", reg_addr, value);
    uart_println(buf);

    // Start condition
    if (i2c_start())
    {
        uart_println("PCA9535: I2C start failed");
        i2c_stop();
        return 1;
    }

    // Send device address with write bit (0)
    uint8_t addr_byte = (PCA9535_I2C_ADDR << 1) | 0;
    sprintf(buf, "PCA9535: Sending address 0x%02X", addr_byte);
    uart_println(buf);

    if (i2c_write(addr_byte))
    {
        uart_println("PCA9535: Address NACK");
        i2c_stop();
        return 1;
    }
    uart_println("PCA9535: Address ACK");

    // Send register address
    sprintf(buf, "PCA9535: Sending register 0x%02X", reg_addr);
    uart_println(buf);

    if (i2c_write(reg_addr))
    {
        uart_println("PCA9535: Register NACK");
        i2c_stop();
        return 1;
    }
    uart_println("PCA9535: Register ACK");

    // Send data byte
    sprintf(buf, "PCA9535: Sending data 0x%02X", value);
    uart_println(buf);

    if (i2c_write(value))
    {
        uart_println("PCA9535: Data NACK");
        i2c_stop();
        return 1;
    }
    uart_println("PCA9535: Data ACK");

    // Stop condition
    i2c_stop();

    return 0; // Success
}

/**
 * Read a single byte from a PCA9535 register
 * @param reg_addr Register address (0x00-0x07)
 * @param value Pointer to store the read value
 * @return 0 on success, 1 on failure
 */
uint8_t pca9535_read_register(uint8_t reg_addr, uint8_t *value)
{
    // Start condition
    if (i2c_start())
    {
        i2c_stop();
        return 1;
    }

    // Send device address with write bit to set register pointer
    if (i2c_write((PCA9535_I2C_ADDR << 1) | 0))
    {
        i2c_stop();
        return 1;
    }

    // Send register address
    if (i2c_write(reg_addr))
    {
        i2c_stop();
        return 1;
    }

    // Repeated start
    if (i2c_restart())
    {
        i2c_stop();
        return 1;
    }

    // Send device address with read bit (1)
    if (i2c_write((PCA9535_I2C_ADDR << 1) | 1))
    {
        i2c_stop();
        return 1;
    }

    // Read data byte (NACK to end read)
    *value = i2c_read(0);

    // Stop condition
    i2c_stop();

    return 0; // Success
}

/**
 * Initialize PCA9535 I/O expander
 * Sets up Port 0 and Port 1 configurations
 */
void pca9535_init(void)
{
    uart_println("PCA9535: Initializing I/O expander...");

    // Configure Port 0: P00-P02 as outputs (0), rest as inputs (1)
    // Config register: 1 = input, 0 = output
    uint8_t port0_config = 0xFF & ~LED_ALL_MASK; // 11111000 = 0xF8
    if (pca9535_write_register(PCA9535_CONFIG_PORT0, port0_config))
    {
        uart_println("PCA9535: Port 0 config failed");
        return;
    }

    // Configure Port 1: All as inputs (default)
    if (pca9535_write_register(PCA9535_CONFIG_PORT1, 0xFF))
    {
        uart_println("PCA9535: Port 1 config failed");
        return;
    }

    // Set initial output state: All LEDs off (active low - set bits to 1)
    port0_output_state = LED_ALL_MASK; // 0x07 = 0b00000111 (P00, P01, P02 HIGH = LEDs OFF)
    if (pca9535_write_register(PCA9535_OUTPUT_PORT0, port0_output_state))
    {
        uart_println("PCA9535: Port 0 output init failed");
        return;
    }

    // Set Port 1 outputs to 0 (even though they're inputs)
    if (pca9535_write_register(PCA9535_OUTPUT_PORT1, 0x00))
    {
        uart_println("PCA9535: Port 1 output init failed");
        return;
    }

    // Disable polarity inversion on both ports
    if (pca9535_write_register(PCA9535_POL_INV_PORT0, 0x00))
    {
        uart_println("PCA9535: Port 0 polarity config failed");
        return;
    }

    if (pca9535_write_register(PCA9535_POL_INV_PORT1, 0x00))
    {
        uart_println("PCA9535: Port 1 polarity config failed");
        return;
    }

    uart_println("PCA9535: Initialization complete");
}

/**
 * Initialize LEDs on Port 0
 * This is called after pca9535_init() and is a convenience function
 */
void pca9535_led_init(void)
{
    uart_println("PCA9535: LED initialization");
    // Turn off all LEDs
    pca9535_led_off(LED_ALL_MASK);
}

/**
 * Set LED state (LEDs are ACTIVE LOW - 0=ON, 1=OFF)
 * @param led_mask Bitmask of LEDs to control (LED_PWR_MASK, LED_SIGNAL_MASK, LED_FAULT_MASK)
 * @param state 1 = on, 0 = off
 */
void pca9535_led_set(uint8_t led_mask, uint8_t state)
{
    if (state)
    {
        // Turn on: CLEAR bits to 0 (active low)
        port0_output_state &= ~led_mask;
    }
    else
    {
        // Turn off: SET bits to 1 (active low)
        port0_output_state |= led_mask;
    }

    pca9535_write_register(PCA9535_OUTPUT_PORT0, port0_output_state);
}

/**
 * Turn on LED(s)
 * @param led_mask Bitmask of LEDs to turn on
 */
void pca9535_led_on(uint8_t led_mask)
{
    pca9535_led_set(led_mask, 1);
}

/**
 * Turn off LED(s)
 * @param led_mask Bitmask of LEDs to turn off
 */
void pca9535_led_off(uint8_t led_mask)
{
    pca9535_led_set(led_mask, 0);
}

/**
 * Toggle LED(s)
 * @param led_mask Bitmask of LEDs to toggle
 */
void pca9535_led_toggle(uint8_t led_mask)
{
    port0_output_state ^= led_mask;
    pca9535_write_register(PCA9535_OUTPUT_PORT0, port0_output_state);
}

/**
 * Knight Rider LED sequence - smooth back-and-forth sweep
 * Duration: ~1.28 seconds (50% shorter)
 */
void pca9535_led_test(void)
{
    // One cycle = 5 steps x 64ms = 320ms
    // 50% shorter: 2.56s -> 1.28s = 4 cycles
    for (uint8_t cycle = 0; cycle < 4; cycle++)
    {
        // Forward: PWR -> SIGNAL -> FAULT
        pca9535_led_off(LED_ALL_MASK);
        pca9535_led_on(LED_PWR_MASK);
        __delay_ms(64);

        pca9535_led_off(LED_ALL_MASK);
        pca9535_led_on(LED_SIGNAL_MASK);
        __delay_ms(64);

        pca9535_led_off(LED_ALL_MASK);
        pca9535_led_on(LED_FAULT_MASK);
        __delay_ms(64);

        // Backward: FAULT -> SIGNAL -> PWR
        pca9535_led_off(LED_ALL_MASK);
        pca9535_led_on(LED_SIGNAL_MASK);
        __delay_ms(64);

        pca9535_led_off(LED_ALL_MASK);
        pca9535_led_on(LED_PWR_MASK);
        __delay_ms(64);

        // No pause - seamlessly loop to next cycle for continuous smooth sweep
    }

    // Turn off all LEDs at end
    pca9535_led_off(LED_ALL_MASK);
}

/**
 * Power LED Management - Flash at 1Hz if power_failure_flag is set
 * Called from main loop (~50ms intervals)
 */
void pca9535_update_power_led(void)
{
    // Import system config to check power_failure_flag
    extern system_config_t system_config;

    static uint16_t flash_timer = 0;  // Timer in main loop iterations (~50ms each)
    static uint8_t flash_state = 0;   // Current LED state (0=off, 1=on)

    if (system_config.power_failure_flag == 0)
    {
        // Normal operation - PWR LED solid ON
        pca9535_led_on(LED_PWR_MASK);
        flash_timer = 0;  // Reset timer
        flash_state = 1;  // Keep state synced
    }
    else
    {
        // Power failure mode - flash at 1Hz (500ms on, 500ms off)
        flash_timer++;

        // 1Hz = 500ms on + 500ms off
        // At 50ms per loop iteration: 500ms / 50ms = 10 iterations per half-cycle
        if (flash_timer >= 10)
        {
            flash_timer = 0;
            flash_state = !flash_state;

            if (flash_state)
            {
                pca9535_led_on(LED_PWR_MASK);
            }
            else
            {
                pca9535_led_off(LED_PWR_MASK);
            }
        }
    }
}
