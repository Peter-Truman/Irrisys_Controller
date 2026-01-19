/**
 * IrrisysPG Display Board - Main Firmware
 * PIC18F14K22-I/SS @ 8MHz
 *
 * Phase 1: Hardware test harness
 * - LCD initialization and text display
 * - LED control (PWR, Signal, Fault)
 * - PWM brightness and contrast
 */

#define BUILD_VERSION 1

#include "../include/config.h"
#include "../include/lcd.h"
#include "../include/pwm.h"
#include <stdio.h>

// External ISR handler from pwm.c
extern void pwm_timer0_isr(void);

// Function prototypes
void system_init(void);
void led_init(void);
void led_test_sequence(void);
void lcd_test_sequence(void);
void pwm_test_sequence(void);

/**
 * High-priority interrupt service routine
 */
void __interrupt(high_priority) isr_high(void)
{
    // Timer0 interrupt - software PWM for brightness
    if (INTCONbits.TMR0IE && INTCONbits.TMR0IF)
    {
        INTCONbits.TMR0IF = 0;  // Clear flag
        pwm_timer0_isr();
    }
}

/**
 * Low-priority interrupt service routine
 */
void __interrupt(low_priority) isr_low(void)
{
    // Reserved for UART receive (Phase 2)
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
    while (!OSCCONbits.IOFS)
        ;

    // Disable analog functions - all digital I/O
    ANSEL = 0x00;
    ANSELH = 0x00;

    // Initialize all ports to known state
    LATA = 0xFF;   // LEDs off (active low)
    LATB = 0x00;
    LATC = 0x00;

    TRISA = 0b00001011;  // RA0,1,3 inputs (programming), RA2,4,5 outputs (LEDs)
    TRISB = 0b00100000;  // RB5 input (serial in), others output
    TRISC = 0x00;        // All outputs (LCD + PWM)
}

/**
 * Initialize LED pins
 */
void led_init(void)
{
    LED_PWR_TRIS = 0;
    LED_SIGNAL_TRIS = 0;
    LED_FAULT_TRIS = 0;

    // Start with all LEDs off
    LED_PWR_OFF();
    LED_SIGNAL_OFF();
    LED_FAULT_OFF();
}

/**
 * LED test sequence - cycle through each LED
 */
void led_test_sequence(void)
{
    // Power LED
    LED_PWR_ON();
    __delay_ms(300);
    LED_PWR_OFF();
    __delay_ms(100);

    // Signal LED
    LED_SIGNAL_ON();
    __delay_ms(300);
    LED_SIGNAL_OFF();
    __delay_ms(100);

    // Fault LED
    LED_FAULT_ON();
    __delay_ms(300);
    LED_FAULT_OFF();
    __delay_ms(100);

    // All on together
    LED_PWR_ON();
    LED_SIGNAL_ON();
    LED_FAULT_ON();
    __delay_ms(500);

    // All off
    LED_PWR_OFF();
    LED_SIGNAL_OFF();
    LED_FAULT_OFF();
    __delay_ms(200);

    // Power LED stays on (normal operation indicator)
    LED_PWR_ON();
}

/**
 * LCD test sequence - display test patterns on all 4 lines
 */
void lcd_test_sequence(void)
{
    char buf[21];

    // Clear and show startup message
    lcd_clear();
    lcd_print_at(0, 0, "IrrisysPG Display");
    lcd_print_at(1, 0, "Version 1.0");
    lcd_print_at(2, 0, "Initializing...");
    sprintf(buf, "Build: %d", BUILD_VERSION);
    lcd_print_at(3, 0, buf);

    __delay_ms(2000);

    // Test all 4 lines with full width
    lcd_clear();
    lcd_print_at(0, 0, "Line 1: 0123456789AB");
    lcd_print_at(1, 0, "Line 2: CDEFGHIJKLMN");
    lcd_print_at(2, 0, "Line 3: OPQRSTUVWXYZ");
    lcd_print_at(3, 0, "Line 4: !@#$%^&*()+-");

    __delay_ms(2000);

    // Test cursor positioning
    lcd_clear();
    lcd_print_at(0, 0, "Cursor Test:");

    for (uint8_t i = 0; i < 20; i++)
    {
        lcd_set_cursor(1, i);
        lcd_putc('*');
        __delay_ms(50);
    }

    __delay_ms(500);

    // Test cursor visibility
    lcd_clear();
    lcd_print_at(0, 0, "Cursor visible:");
    lcd_set_cursor(1, 0);
    lcd_cursor_on();
    __delay_ms(1500);

    lcd_print_at(2, 0, "Cursor blinking:");
    lcd_set_cursor(3, 0);
    lcd_cursor_blink_on();
    __delay_ms(1500);

    lcd_cursor_off();

    // Test scroll
    lcd_clear();
    lcd_print_at(0, 0, "Scroll Test >>>>");
    lcd_print_at(1, 0, "Watch this line");
    __delay_ms(1000);

    for (uint8_t i = 0; i < 8; i++)
    {
        lcd_scroll_left();
        __delay_ms(200);
    }

    __delay_ms(500);

    for (uint8_t i = 0; i < 8; i++)
    {
        lcd_scroll_right();
        __delay_ms(200);
    }

    __delay_ms(500);
}

/**
 * PWM test sequence - ramp brightness and contrast
 */
void pwm_test_sequence(void)
{
    lcd_clear();
    lcd_print_at(0, 0, "PWM Test");
    lcd_print_at(1, 0, "Brightness ramp...");

    // Ramp brightness up
    for (uint8_t i = 0; i <= 100; i += 5)
    {
        pwm_set_brightness(i);
        char buf[21];
        sprintf(buf, "Brightness: %3d%%", i);
        lcd_print_at(2, 0, buf);
        __delay_ms(100);
    }

    __delay_ms(500);

    // Ramp brightness down
    for (int8_t i = 100; i >= 0; i -= 5)
    {
        pwm_set_brightness((uint8_t)i);
        char buf[21];
        sprintf(buf, "Brightness: %3d%%", i);
        lcd_print_at(2, 0, buf);
        __delay_ms(100);
    }

    // Set to comfortable level
    pwm_set_brightness(70);

    __delay_ms(500);

    lcd_print_at(1, 0, "Contrast ramp...  ");

    // Ramp contrast
    for (uint8_t i = 0; i <= 100; i += 5)
    {
        pwm_set_contrast(i);
        char buf[21];
        sprintf(buf, "Contrast: %3d%%  ", i);
        lcd_print_at(2, 0, buf);
        __delay_ms(150);
    }

    // Set to comfortable level
    pwm_set_contrast(50);

    __delay_ms(500);
}

/**
 * Main entry point
 */
void main(void)
{
    // Initialize hardware
    system_init();
    led_init();

    // Enable interrupts for PWM
    INTCONbits.GIE = 1;     // Global interrupt enable
    INTCONbits.PEIE = 1;    // Peripheral interrupt enable

    // Initialize PWM (must be after interrupts enabled)
    pwm_init();
    pwm_set_brightness(70);  // Start with reasonable brightness
    pwm_set_contrast(50);    // Start with mid contrast

    // Small delay before LCD init
    __delay_ms(100);

    // Initialize LCD
    lcd_init();

    // Run test sequences
    led_test_sequence();
    lcd_test_sequence();
    pwm_test_sequence();

    // Final display - ready for serial commands
    lcd_clear();
    lcd_print_at(0, 0, "====================");
    lcd_print_at(1, 0, "  IrrisysPG Display ");
    lcd_print_at(2, 0, "   Ready (v1)       ");
    lcd_print_at(3, 0, "====================");

    // Main loop - will be replaced with serial protocol handler in Phase 2
    while (1)
    {
        // Blink signal LED to show we're alive
        LED_SIGNAL_ON();
        __delay_ms(100);
        LED_SIGNAL_OFF();
        __delay_ms(900);
    }
}
