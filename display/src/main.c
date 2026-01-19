/**
 * IrrisysPG Display Board - Main Firmware
 * PIC18F14K22-I/SS @ 8MHz
 *
 * Phase 1: Minimal test - LCD + LEDs only
 */

#define BUILD_VERSION 11

#include "../include/config.h"
#include "../include/lcd.h"

/**
 * High-priority interrupt service routine
 */
void __interrupt(high_priority) isr_high(void)
{
    // Unused
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
    TRISB = 0b00100000;  // RB5 input, others output
    TRISC = 0b00100000;  // RC5 input (hi-Z, pot controls contrast), others output
}

/**
 * Main entry point
 */
void main(void)
{
    // Initialize hardware
    system_init();

    // Interrupts off
    INTCONbits.GIE = 0;
    INTCONbits.PEIE = 0;

    // Turn on backlight immediately and leave it on
    // RC4 = backlight control
    LATCbits.LATC4 = 1;  // Backlight ON

    // RC5 = contrast - hi-Z input, pot controls it directly

    // Turn on Power LED (active low on RA2)
    LATAbits.LATA2 = 0;

    // Long delay for power stabilization
    __delay_ms(500);

    // Initialize LCD
    lcd_init();

    // Display ready message
    lcd_clear();
    lcd_print_at(0, 0, "====================");
    lcd_print_at(1, 0, "  IrrisysPG Display ");
    lcd_print_at(2, 0, "   Build: 11        ");
    lcd_print_at(3, 0, "====================");

    // Main loop - blink Signal LED to show we're alive
    while (1)
    {
        LATAbits.LATA4 = 0;  // ON
        __delay_ms(100);
        LATAbits.LATA4 = 1;  // OFF
        __delay_ms(900);
    }
}
