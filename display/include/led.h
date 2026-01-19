/**
 * IrrisysPG Display Board - LED Driver Header
 * Controls PWR, Signal, Fault LEDs with dimming and flashing
 */

#ifndef LED_H
#define LED_H

#include <stdint.h>

// LED identifiers (indices into state array)
#define LED_ID_PWR      0
#define LED_ID_SIGNAL   1
#define LED_ID_FAULT    2
#define LED_COUNT       3

// Flash patterns (periods in ~10ms ticks)
#define FLASH_OFF       0       // No flash - steady state
#define FLASH_SLOW      100     // 1 second period (500ms on, 500ms off)
#define FLASH_MEDIUM    50      // 500ms period
#define FLASH_FAST      20      // 200ms period
#define FLASH_RAPID     10      // 100ms period

/**
 * Initialize LED driver and start PWM timer
 */
void led_init(void);

/**
 * Set LED brightness
 * @param led LED_ID_PWR, LED_ID_SIGNAL, or LED_ID_FAULT
 * @param brightness 0-100 (percent)
 */
void led_set_brightness(uint8_t led, uint8_t brightness);

/**
 * Set LED flash rate
 * @param led LED_ID_PWR, LED_ID_SIGNAL, or LED_ID_FAULT
 * @param period Flash period in ~10ms ticks (0 = no flash, steady on)
 */
void led_set_flash(uint8_t led, uint8_t period);

/**
 * Turn LED on at current brightness (no flash)
 * @param led LED_ID_PWR, LED_ID_SIGNAL, or LED_ID_FAULT
 */
void led_on(uint8_t led);

/**
 * Turn LED off
 * @param led LED_ID_PWR, LED_ID_SIGNAL, or LED_ID_FAULT
 */
void led_off(uint8_t led);

/**
 * Get current LED brightness
 * @param led LED_ID_PWR, LED_ID_SIGNAL, or LED_ID_FAULT
 * @return brightness 0-100
 */
uint8_t led_get_brightness(uint8_t led);

/**
 * Timer ISR handler - call from main ISR
 * Handles software PWM and flash timing
 */
void led_timer_isr(void);

#endif // LED_H
