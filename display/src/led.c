/**
 * IrrisysPG Display Board - LED Driver
 * Software PWM for dimming, timer-based flashing
 *
 * LEDs are active LOW:
 *   RA2 = PWR LED
 *   RA4 = Signal LED
 *   RA5 = Fault LED
 *
 * PWM Strategy:
 *   - 100-step PWM (0-100 brightness maps directly)
 *   - Timer0 interrupt at 10kHz (100 steps * 100Hz PWM = flicker-free)
 *   - Flash timing derived from PWM cycles
 */

#include "../include/config.h"
#include "../include/led.h"

// PWM resolution (steps per cycle)
#define PWM_STEPS 100

// LED state storage
static struct {
    uint8_t brightness;     // 0-100 percent (also PWM duty)
    uint8_t flash_period;   // Flash period in 10ms ticks (0 = no flash)
    uint8_t flash_counter;  // Current position in flash cycle
    uint8_t enabled;        // 1 = on (subject to flash), 0 = off
    uint8_t flash_on;       // 1 = in ON phase of flash, 0 = in OFF phase
} led_state[LED_COUNT];

// Software PWM counter (0-99)
static volatile uint8_t pwm_counter = 0;

// Flash tick divider (counts PWM cycles, 100 cycles = 1 second at 100Hz PWM)
static volatile uint8_t tick_divider = 0;

/**
 * Initialize LED driver
 */
void led_init(void)
{
    // Configure LED pins as outputs
    TRISAbits.TRISA2 = 0;   // PWR LED
    TRISAbits.TRISA4 = 0;   // Signal LED
    TRISAbits.TRISA5 = 0;   // Fault LED

    // Start with LEDs off (active low, so set high)
    LATAbits.LATA2 = 1;
    LATAbits.LATA4 = 1;
    LATAbits.LATA5 = 1;

    // Initialize state - all off, 100% brightness default
    for (uint8_t i = 0; i < LED_COUNT; i++)
    {
        led_state[i].brightness = 100;
        led_state[i].flash_period = 0;
        led_state[i].flash_counter = 0;
        led_state[i].enabled = 0;
        led_state[i].flash_on = 1;
    }

    // Configure Timer0 for 10kHz interrupt rate
    // 8MHz / 4 = 2MHz instruction clock
    // 2MHz / 1 (no prescaler) / 200 = 10kHz
    // Reload value: 256 - 200 = 56
    T0CON = 0x00;           // Stop Timer0
    TMR0H = 0;
    TMR0L = 56;             // Preload for 200 count overflow

    T0CONbits.T08BIT = 1;   // 8-bit mode
    T0CONbits.T0CS = 0;     // Internal clock (Fosc/4)
    T0CONbits.PSA = 1;      // Prescaler NOT assigned (1:1)
    T0CONbits.TMR0ON = 1;   // Enable Timer0

    // Enable Timer0 interrupt
    INTCONbits.TMR0IE = 1;
    INTCONbits.TMR0IF = 0;
}

/**
 * Set LED brightness (0-100%)
 */
void led_set_brightness(uint8_t led, uint8_t brightness)
{
    if (led >= LED_COUNT) return;
    if (brightness > 100) brightness = 100;

    led_state[led].brightness = brightness;
}

/**
 * Set LED flash rate
 */
void led_set_flash(uint8_t led, uint8_t period)
{
    if (led >= LED_COUNT) return;

    led_state[led].flash_period = period;
    led_state[led].flash_counter = 0;
}

/**
 * Turn LED on
 */
void led_on(uint8_t led)
{
    if (led >= LED_COUNT) return;
    led_state[led].enabled = 1;
}

/**
 * Turn LED off
 */
void led_off(uint8_t led)
{
    if (led >= LED_COUNT) return;
    led_state[led].enabled = 0;

    // Immediately turn off the physical LED
    switch (led)
    {
        case LED_ID_PWR:    LATAbits.LATA2 = 1; break;
        case LED_ID_SIGNAL: LATAbits.LATA4 = 1; break;
        case LED_ID_FAULT:  LATAbits.LATA5 = 1; break;
    }
}

/**
 * Get LED brightness
 */
uint8_t led_get_brightness(uint8_t led)
{
    if (led >= LED_COUNT) return 0;
    return led_state[led].brightness;
}

/**
 * Timer ISR - call from main interrupt handler
 * Runs at 10kHz for 100-step PWM at 100Hz (flicker-free)
 */
void led_timer_isr(void)
{
    // Reload timer for next interrupt (256 - 200 = 56)
    TMR0L = 56;

    // Increment PWM counter (0-99)
    pwm_counter++;
    if (pwm_counter >= PWM_STEPS)
    {
        pwm_counter = 0;

        // One complete PWM cycle = 10ms at 100Hz
        // Update flash timing every PWM cycle
        tick_divider++;
        if (tick_divider >= 10)  // 100ms tick for flash timing
        {
            tick_divider = 0;

            // Update flash state for each LED
            for (uint8_t i = 0; i < LED_COUNT; i++)
            {
                if (led_state[i].flash_period > 0)
                {
                    led_state[i].flash_counter++;
                    uint8_t half_period = led_state[i].flash_period / 2;
                    if (led_state[i].flash_counter >= led_state[i].flash_period)
                    {
                        led_state[i].flash_counter = 0;
                        led_state[i].flash_on = 1;
                    }
                    else if (led_state[i].flash_counter >= half_period)
                    {
                        led_state[i].flash_on = 0;
                    }
                }
            }
        }
    }

    // Calculate and output LED states
    // PWR LED (RA2)
    if (led_state[LED_ID_PWR].enabled &&
        (led_state[LED_ID_PWR].flash_period == 0 || led_state[LED_ID_PWR].flash_on))
    {
        LATAbits.LATA2 = (pwm_counter < led_state[LED_ID_PWR].brightness) ? 0 : 1;
    }
    else
    {
        LATAbits.LATA2 = 1;  // OFF
    }

    // Signal LED (RA4)
    if (led_state[LED_ID_SIGNAL].enabled &&
        (led_state[LED_ID_SIGNAL].flash_period == 0 || led_state[LED_ID_SIGNAL].flash_on))
    {
        LATAbits.LATA4 = (pwm_counter < led_state[LED_ID_SIGNAL].brightness) ? 0 : 1;
    }
    else
    {
        LATAbits.LATA4 = 1;  // OFF
    }

    // Fault LED (RA5)
    if (led_state[LED_ID_FAULT].enabled &&
        (led_state[LED_ID_FAULT].flash_period == 0 || led_state[LED_ID_FAULT].flash_on))
    {
        LATAbits.LATA5 = (pwm_counter < led_state[LED_ID_FAULT].brightness) ? 0 : 1;
    }
    else
    {
        LATAbits.LATA5 = 1;  // OFF
    }
}
