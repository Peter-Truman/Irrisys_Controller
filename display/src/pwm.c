/**
 * IrrisysPG Display Board - PWM Driver
 * Controls LCD brightness (RC4) and contrast (RC5)
 *
 * PIC18F14K22 has one CCP module (CCP1 on RC5)
 * We'll use CCP1 for one output and software PWM for the other
 *
 * RC4 = Brightness (Software PWM via Timer interrupt)
 * RC5 = Contrast (CCP1 hardware PWM)
 */

#include "../include/config.h"
#include "../include/pwm.h"

// Current settings
static uint8_t current_brightness = 50;
static uint8_t current_contrast = 50;

// Software PWM variables for brightness (RC4)
static volatile uint8_t brightness_duty = 128;  // 0-255
static volatile uint8_t pwm_counter = 0;

/**
 * Initialize PWM for brightness and contrast
 *
 * Timer2 is used as the PWM timebase for CCP1
 * PWM frequency = Fosc / (4 * (PR2+1) * Timer2_Prescale)
 * With PR2=255, Prescale=1: 8MHz / (4 * 256 * 1) = ~7.8kHz
 */
void pwm_init(void)
{
    // Configure PWM output pins
    PWM_BRIGHTNESS_TRIS = 0;  // RC4 output (software PWM)
    PWM_CONTRAST_TRIS = 0;    // RC5 output (CCP1 hardware PWM)

    // Initialize outputs
    PWM_BRIGHTNESS = 0;
    PWM_CONTRAST = 0;

    // -------------------------------------------------------------------------
    // Configure Timer2 for PWM timebase
    // -------------------------------------------------------------------------
    T2CON = 0x00;           // Stop Timer2
    PR2 = 255;              // Period register (8-bit resolution)
    TMR2 = 0;               // Clear timer

    // Timer2 control: Prescaler 1:1, Timer2 ON
    T2CONbits.T2CKPS = 0b00;  // Prescaler 1:1
    T2CONbits.TMR2ON = 1;     // Enable Timer2

    // -------------------------------------------------------------------------
    // Configure CCP1 for hardware PWM on RC5 (Contrast)
    // -------------------------------------------------------------------------
    CCP1CON = 0x00;                 // Disable CCP1 first
    CCPR1L = 0;                     // Duty cycle low byte
    CCP1CONbits.DC1B = 0;           // Duty cycle low 2 bits
    CCP1CONbits.CCP1M = 0b1100;     // PWM mode

    // -------------------------------------------------------------------------
    // Configure Timer0 for software PWM interrupt (brightness)
    // Timer0 will generate interrupts for software PWM on RC4
    // -------------------------------------------------------------------------
    T0CON = 0x00;           // Stop Timer0
    TMR0H = 0;
    TMR0L = 0;

    // Timer0: 8-bit mode, internal clock, prescaler 1:4
    // Interrupt rate = 8MHz / 4 / 4 / 256 = ~1.95kHz (256 interrupts per PWM cycle)
    T0CONbits.T08BIT = 1;   // 8-bit mode
    T0CONbits.T0CS = 0;     // Internal clock (Fosc/4)
    T0CONbits.PSA = 0;      // Prescaler assigned
    T0CONbits.T0PS = 0b001; // Prescaler 1:4
    T0CONbits.TMR0ON = 1;   // Enable Timer0

    // Enable Timer0 interrupt for software PWM
    INTCONbits.TMR0IE = 1;  // Timer0 interrupt enable
    INTCONbits.TMR0IF = 0;  // Clear flag

    // Set default values
    pwm_set_brightness(current_brightness);
    pwm_set_contrast(current_contrast);
}

/**
 * Set LCD backlight brightness
 * @param percent 0-100
 */
void pwm_set_brightness(uint8_t percent)
{
    if (percent > 100) percent = 100;
    current_brightness = percent;

    // Convert percent to 0-255 duty cycle
    brightness_duty = (uint8_t)((uint16_t)percent * 255 / 100);
}

/**
 * Set LCD contrast via CCP1 hardware PWM
 * @param percent 0-100
 */
void pwm_set_contrast(uint8_t percent)
{
    if (percent > 100) percent = 100;
    current_contrast = percent;

    // Convert percent to 10-bit duty cycle value
    // For 8-bit PWM (PR2=255), we use the upper 8 bits in CCPR1L
    uint16_t duty = (uint16_t)percent * 255 / 100;

    CCPR1L = (uint8_t)duty;
    CCP1CONbits.DC1B = 0;  // Lower 2 bits = 0
}

/**
 * Get current brightness
 */
uint8_t pwm_get_brightness(void)
{
    return current_brightness;
}

/**
 * Get current contrast
 */
uint8_t pwm_get_contrast(void)
{
    return current_contrast;
}

/**
 * Software PWM interrupt handler for brightness
 * Call this from the main ISR when Timer0 overflows
 */
void pwm_timer0_isr(void)
{
    pwm_counter++;

    if (pwm_counter < brightness_duty)
    {
        PWM_BRIGHTNESS = 1;
    }
    else
    {
        PWM_BRIGHTNESS = 0;
    }

    // pwm_counter wraps at 255 automatically (8-bit)
}
