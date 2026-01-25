/**
 * PCA9535DWR - 16-bit I2C I/O Expander
 * I2C Address: 0x21 (base 0x20 + A0=0, A1=0, A2=1)
 *
 * Port 0: P00-P07
 * Port 1: P10-P17
 *
 * LED Connections:
 * - P00: Power LED
 * - P01: Signal LED
 * - P02: Fault LED
 *
 * =============================================================================
 * Ver_B_Rev_1: PCA9535 I/O expander is DEPRECATED
 * LEDs are now controlled by the display board
 * =============================================================================
 */

#ifndef PCA9535_H
#define PCA9535_H

#include <xc.h>
#include <stdint.h>

// =============================================================================
// OLD PCA9535 IMPLEMENTATION - COMMENTED OUT (LEDs now on display board)
// =============================================================================
#if 0  // Disabled - PCA9535 removed, LEDs on display board

// I2C Address (7-bit): 0100001 = 0x21
#define PCA9535_I2C_ADDR    0x21

// PCA9535 Register Addresses
#define PCA9535_INPUT_PORT0     0x00  // Input port 0 register
#define PCA9535_INPUT_PORT1     0x01  // Input port 1 register
#define PCA9535_OUTPUT_PORT0    0x02  // Output port 0 register
#define PCA9535_OUTPUT_PORT1    0x03  // Output port 1 register
#define PCA9535_POL_INV_PORT0   0x04  // Polarity inversion port 0
#define PCA9535_POL_INV_PORT1   0x05  // Polarity inversion port 1
#define PCA9535_CONFIG_PORT0    0x06  // Configuration port 0 (1=input, 0=output)
#define PCA9535_CONFIG_PORT1    0x07  // Configuration port 1 (1=input, 0=output)

// LED Pin Definitions (Port 0)
#define LED_PWR_PIN     0  // P00
#define LED_SIGNAL_PIN  1  // P01
#define LED_FAULT_PIN   2  // P02

// LED Bit Masks
#define LED_PWR_MASK    (1 << LED_PWR_PIN)
#define LED_SIGNAL_MASK (1 << LED_SIGNAL_PIN)
#define LED_FAULT_MASK  (1 << LED_FAULT_PIN)
#define LED_ALL_MASK    (LED_PWR_MASK | LED_SIGNAL_MASK | LED_FAULT_MASK)

// Function Prototypes
void pca9535_init(void);
uint8_t pca9535_write_register(uint8_t reg_addr, uint8_t value);
uint8_t pca9535_read_register(uint8_t reg_addr, uint8_t *value);

// LED Control Functions
void pca9535_led_init(void);
void pca9535_led_set(uint8_t led_mask, uint8_t state);
void pca9535_led_on(uint8_t led_mask);
void pca9535_led_off(uint8_t led_mask);
void pca9535_led_toggle(uint8_t led_mask);

// Test Function
void pca9535_led_test(void);

// Power LED Management (called from main loop)
void pca9535_update_power_led(void);

#endif // End of disabled PCA9535 code

// =============================================================================
// STUB FUNCTIONS - Allow code to compile during transition
// LEDs are now controlled via serial commands to display board
// =============================================================================

// Stub macros - do nothing
#define pca9535_init()              ((void)0)
#define pca9535_led_init()          ((void)0)
#define pca9535_led_test()          ((void)0)
#define pca9535_update_power_led()  ((void)0)
#define pca9535_led_on(mask)        ((void)0)
#define pca9535_led_off(mask)       ((void)0)
#define pca9535_led_toggle(mask)    ((void)0)
#define pca9535_led_set(mask, st)   ((void)0)

// LED masks still needed for compatibility (used by other code)
#define LED_PWR_MASK    0x01
#define LED_SIGNAL_MASK 0x02
#define LED_FAULT_MASK  0x04
#define LED_ALL_MASK    0x07

#endif // PCA9535_H
