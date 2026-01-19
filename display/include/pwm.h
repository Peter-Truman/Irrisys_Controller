/**
 * IrrisysPG Display Board - PWM Driver Header
 * Controls LCD brightness and contrast via PWM
 */

#ifndef PWM_H
#define PWM_H

#include <stdint.h>

/**
 * Initialize PWM module for brightness and contrast control
 * Uses Timer2 as timebase
 * RC4 = Brightness (CCP1)
 * RC5 = Contrast (software PWM or second CCP if available)
 */
void pwm_init(void);

/**
 * Set LCD backlight brightness
 * @param percent 0-100 (0=off, 100=full brightness)
 */
void pwm_set_brightness(uint8_t percent);

/**
 * Set LCD contrast
 * @param percent 0-100 (adjust for best viewing angle)
 */
void pwm_set_contrast(uint8_t percent);

/**
 * Get current brightness setting
 * @return Current brightness 0-100
 */
uint8_t pwm_get_brightness(void);

/**
 * Get current contrast setting
 * @return Current contrast 0-100
 */
uint8_t pwm_get_contrast(void);

#endif // PWM_H
