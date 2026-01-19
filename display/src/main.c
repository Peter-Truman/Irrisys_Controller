/**
 * IrrisysPG Display Board - Main Firmware
 * PIC18F14K22-I/SS @ 8MHz
 *
 * Phase 1: Minimal test - LCD + LEDs only
 */

#define BUILD_VERSION 24

#include "../include/config.h"
#include "../include/lcd.h"
#include "../include/led.h"

// External ISR handler from led.c
extern void led_timer_isr(void);

/**
 * High-priority interrupt service routine
 */
void __interrupt(high_priority) isr_high(void)
{
    // Timer0 interrupt - LED PWM and flash timing
    if (INTCONbits.TMR0IE && INTCONbits.TMR0IF)
    {
        INTCONbits.TMR0IF = 0;
        led_timer_isr();
    }
}

/**
 * Low-priority interrupt service routine
 */
void __interrupt(low_priority) isr_low(void)
{
    // Unused
}

/**
 * Initialize system oscillator and basic I/O
 */
void system_init(void)
{
    // Configure oscillator for 8MHz internal
    OSCCONbits.IRCF = 0b110;   // 8MHz
    OSCCONbits.SCS = 0b00;     // Primary clock determined by config bits

    // Wait for oscillator stable
    while (!OSCCONbits.HFIOFS)
        ;

    // Disable analog functions - all digital I/O
    ANSEL = 0x00;
    ANSELH = 0x00;

    // Initialize all ports to known state
    LATA = 0xFF;   // LEDs off (active low)
    LATB = 0x00;
    LATC = 0x00;

    TRISA = 0b00001011;  // RA0,1,3 inputs, RA2,4,5 outputs (LEDs)
    TRISB = 0b00100000;  // RB5 input (serial), others output
    TRISC = 0x00;        // All outputs (LCD + brightness PWM)
}

/**
 * Main entry point
 */
void main(void)
{
    // Initialize hardware
    system_init();

    // Turn on backlight immediately
    LATCbits.LATC4 = 1;  // Backlight ON

    // Initialize LED driver (sets up Timer0 interrupt)
    led_init();

    // Enable interrupts
    INTCONbits.GIE = 1;
    INTCONbits.PEIE = 1;

    // Long delay for power stabilization
    __delay_ms(500);

    // Initialize LCD
    lcd_init();

    // Display ready message
    lcd_clear();
    lcd_print_at(0, 0, "====================");
    lcd_print_at(1, 0, "  IrrisysPG Display ");
    lcd_print_at(2, 0, "   Build: 24        ");
    lcd_print_at(3, 0, "====================");

    // LED test sequence
    __delay_ms(2000);

    // Test 1: Power LED on at full brightness
    lcd_clear();
    lcd_print_at(0, 0, "LED Test 1:");
    lcd_print_at(1, 0, "PWR LED 100%");
    led_set_brightness(LED_ID_PWR, 100);
    led_on(LED_ID_PWR);
    __delay_ms(2000);

    // Test 2: Dim power LED to 15%
    lcd_print_at(1, 0, "PWR LED 15% ");
    led_set_brightness(LED_ID_PWR, 15);
    __delay_ms(2000);

    // Test 3: Signal LED flashing fast at 15%
    lcd_print_at(1, 0, "Signal FLASH");
    led_set_brightness(LED_ID_SIGNAL, 15);
    led_set_flash(LED_ID_SIGNAL, FLASH_FAST);
    led_on(LED_ID_SIGNAL);
    __delay_ms(3000);

    // Test 4: Fault LED slow flash at 15%
    lcd_print_at(1, 0, "Fault SLOW  ");
    led_set_brightness(LED_ID_FAULT, 15);
    led_set_flash(LED_ID_FAULT, FLASH_SLOW);
    led_on(LED_ID_FAULT);
    __delay_ms(3000);

    // Test 5: All LEDs at 15% different flash rates
    lcd_clear();
    lcd_print_at(0, 0, "All LEDs 15%:");
    lcd_print_at(1, 0, "PWR=steady");
    lcd_print_at(2, 0, "Sig=fast, Flt=slow");
    led_set_brightness(LED_ID_PWR, 15);
    led_set_flash(LED_ID_PWR, 0);  // Steady
    led_on(LED_ID_PWR);
    __delay_ms(5000);

    // Final state: Power on steady at 15%, others off
    lcd_clear();
    lcd_print_at(0, 0, "====================");
    lcd_print_at(1, 0, "  LED Test Complete ");
    lcd_print_at(2, 0, "   Build: 24        ");
    lcd_print_at(3, 0, "====================");

    led_off(LED_ID_SIGNAL);
    led_off(LED_ID_FAULT);
    led_set_brightness(LED_ID_PWR, 15);
    led_set_flash(LED_ID_PWR, 0);
    led_on(LED_ID_PWR);

    // Main loop - nothing to do, LEDs run via interrupt
    while (1)
    {
        __delay_ms(1000);
    }
}
