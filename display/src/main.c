/**
 * IrrisysPG Display Board - Main Firmware
 * PIC18F14K22-I/SS @ 8MHz
 *
 * Phase 2: Serial protocol integration
 */

#define BUILD_VERSION 34

#include "../include/config.h"
#include "../include/lcd.h"
#include "../include/led.h"
#include "../include/uart.h"
#include "../include/protocol.h"
#include <stdio.h>

// External ISR handlers
extern void led_timer_isr(void);
extern void uart_rx_isr(void);

// =============================================================================
// Debug Serial Output on RB4 (bit-banged @ 9600 baud) - NON-INVERTED TTL
// Note: RC5 is LCD contrast - cannot use for debug!
// =============================================================================
#define DEBUG_TX_PIN LATBbits.LATB4
#define DEBUG_TX_TRIS TRISBbits.TRISB4

void debug_init(void)
{
    DEBUG_TX_TRIS = 0;  // Output
    DEBUG_TX_PIN = 1;   // Idle HIGH (standard TTL UART)
}

// Bit-bang one character at 9600 baud
// At 8MHz, Fosc/4 = 2MHz, so 1 cycle = 0.5us
// 9600 baud = 104.17us per bit = ~208 instruction cycles
void debug_putc(char c)
{
    // Disable interrupts for accurate timing
    uint8_t gie_save = INTCONbits.GIE;
    INTCONbits.GIE = 0;

    // Start bit (LOW)
    DEBUG_TX_PIN = 0;
    __delay_us(104);

    // Data bits (LSB first)
    if (c & 0x01) DEBUG_TX_PIN = 1; else DEBUG_TX_PIN = 0; __delay_us(104);
    if (c & 0x02) DEBUG_TX_PIN = 1; else DEBUG_TX_PIN = 0; __delay_us(104);
    if (c & 0x04) DEBUG_TX_PIN = 1; else DEBUG_TX_PIN = 0; __delay_us(104);
    if (c & 0x08) DEBUG_TX_PIN = 1; else DEBUG_TX_PIN = 0; __delay_us(104);
    if (c & 0x10) DEBUG_TX_PIN = 1; else DEBUG_TX_PIN = 0; __delay_us(104);
    if (c & 0x20) DEBUG_TX_PIN = 1; else DEBUG_TX_PIN = 0; __delay_us(104);
    if (c & 0x40) DEBUG_TX_PIN = 1; else DEBUG_TX_PIN = 0; __delay_us(104);
    if (c & 0x80) DEBUG_TX_PIN = 1; else DEBUG_TX_PIN = 0; __delay_us(104);

    // Stop bit (HIGH)
    DEBUG_TX_PIN = 1;
    __delay_us(104);

    // Restore interrupts
    INTCONbits.GIE = gie_save;
}

void debug_print(const char *str)
{
    while (*str)
    {
        debug_putc(*str++);
    }
}

void debug_println(const char *str)
{
    debug_print(str);
    debug_putc('\r');
    debug_putc('\n');
}

void debug_hex(uint8_t val)
{
    const char hex[] = "0123456789ABCDEF";
    debug_putc(hex[(val >> 4) & 0x0F]);
    debug_putc(hex[val & 0x0F]);
}

/**
 * High-priority interrupt service routine
 */
void __interrupt(high_priority) isr_high(void)
{
    // UART receive interrupt
    if (PIE1bits.RCIE && PIR1bits.RCIF)
    {
        uart_rx_isr();
    }

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

    // Initialize debug serial first
    debug_init();
    debug_println("Display Board v34");
    debug_println("Debug on RB4 @ 9600");

    // Turn on backlight immediately
    LATCbits.LATC4 = 1;  // Backlight ON

    // Initialize LED driver (sets up Timer0 interrupt)
    led_init();
    debug_println("LED init OK");

    // Initialize UART for serial receive
    uart_init();
    debug_println("UART init OK");

    // Initialize protocol handler
    protocol_init();
    debug_println("Protocol init OK");

    // Enable interrupts
    INTCONbits.GIE = 1;
    INTCONbits.PEIE = 1;

    // Long delay for power stabilization
    __delay_ms(500);

    // Initialize LCD
    lcd_init();

    // Display startup message
    lcd_clear();
    lcd_print_at(0, 0, "====================");
    lcd_print_at(1, 0, "  IrrisysPG Display ");
    lcd_print_at(2, 0, "   Build: 34        ");
    lcd_print_at(3, 0, "====================");

    // Brief LED test - flash all LEDs once
    led_set_brightness(LED_ID_PWR, 100);
    led_set_brightness(LED_ID_SIGNAL, 100);
    led_set_brightness(LED_ID_FAULT, 100);
    led_on(LED_ID_PWR);
    led_on(LED_ID_SIGNAL);
    led_on(LED_ID_FAULT);
    __delay_ms(500);
    led_off(LED_ID_PWR);
    led_off(LED_ID_SIGNAL);
    led_off(LED_ID_FAULT);
    __delay_ms(200);

    // Set power LED to dim steady state
    led_set_brightness(LED_ID_PWR, 15);
    led_set_flash(LED_ID_PWR, 0);
    led_on(LED_ID_PWR);

    // Show ready message - will be overwritten by mainboard commands
    __delay_ms(1000);
    lcd_clear();
    lcd_print_at(0, 0, "Waiting for");
    lcd_print_at(1, 0, "mainboard...");
    lcd_print_at(2, 0, "");
    lcd_print_at(3, 0, "");

    debug_println("Ready");

    // Main loop - process serial protocol
    while (1)
    {
        // Process any incoming serial data
        protocol_process();

        // Small delay to prevent tight loop
        __delay_ms(5);
    }
}
