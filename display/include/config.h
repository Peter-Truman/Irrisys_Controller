/**
 * IrrisysPG Display Board - Configuration Header
 * PIC18F14K22-I/SS @ 8MHz Internal Oscillator
 */

#ifndef CONFIG_H
#define CONFIG_H

#include <xc.h>
#include <stdint.h>

// Configuration bits
#pragma config FOSC = IRC       // Internal RC oscillator
#pragma config PLLEN = OFF      // PLL disabled (8MHz is sufficient)
#pragma config PCLKEN = ON      // Primary clock enabled
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor disabled
#pragma config IESO = OFF       // Internal/External Switchover disabled
#pragma config PWRTEN = ON      // Power-up Timer enabled
#pragma config BOREN = SBORDIS  // Brown-out Reset enabled in hardware
#pragma config BORV = 19        // Brown-out voltage = 1.9V
#pragma config WDTEN = OFF      // Watchdog Timer disabled
#pragma config WDTPS = 32768    // WDT Postscaler
#pragma config HFOFST = ON      // HFINTOSC fast start-up
#pragma config MCLRE = ON       // MCLR pin enabled
#pragma config STVREN = ON      // Stack overflow reset enabled
#pragma config LVP = OFF        // Low-voltage programming disabled
#pragma config BBSIZ = OFF      // Boot block size
#pragma config XINST = OFF      // Extended instruction set disabled
#pragma config CP0 = OFF        // Code protection off
#pragma config CP1 = OFF
#pragma config CPB = OFF
#pragma config CPD = OFF
#pragma config WRT0 = OFF       // Write protection off
#pragma config WRT1 = OFF
#pragma config WRTB = OFF
#pragma config WRTC = OFF
#pragma config WRTD = OFF
#pragma config EBTR0 = OFF      // Table read protection off
#pragma config EBTR1 = OFF
#pragma config EBTRB = OFF

// Oscillator frequency
#define _XTAL_FREQ 8000000UL    // 8MHz internal oscillator

// =============================================================================
// LED Pin Definitions (Active LOW)
// =============================================================================
#define LED_PWR_TRIS    TRISAbits.TRISA2
#define LED_PWR         LATAbits.LATA2
#define LED_PWR_ON()    (LED_PWR = 0)
#define LED_PWR_OFF()   (LED_PWR = 1)

#define LED_SIGNAL_TRIS TRISAbits.TRISA4
#define LED_SIGNAL      LATAbits.LATA4
#define LED_SIGNAL_ON() (LED_SIGNAL = 0)
#define LED_SIGNAL_OFF()(LED_SIGNAL = 1)

#define LED_FAULT_TRIS  TRISAbits.TRISA5
#define LED_FAULT       LATAbits.LATA5
#define LED_FAULT_ON()  (LED_FAULT = 0)
#define LED_FAULT_OFF() (LED_FAULT = 1)

// =============================================================================
// LCD Pin Definitions (4-bit mode)
// =============================================================================
#define LCD_DB4_TRIS    TRISCbits.TRISC0
#define LCD_DB4         LATCbits.LATC0
#define LCD_DB5_TRIS    TRISCbits.TRISC1
#define LCD_DB5         LATCbits.LATC1
#define LCD_DB6_TRIS    TRISCbits.TRISC2
#define LCD_DB6         LATCbits.LATC2
#define LCD_DB7_TRIS    TRISCbits.TRISC3
#define LCD_DB7         LATCbits.LATC3

#define LCD_E_TRIS      TRISCbits.TRISC6
#define LCD_E           LATCbits.LATC6

#define LCD_RS_TRIS     TRISCbits.TRISC7
#define LCD_RS          LATCbits.LATC7

// LCD data port mask (lower 4 bits of PORTC)
#define LCD_DATA_MASK   0x0F
#define LCD_DATA_PORT   LATC

// =============================================================================
// PWM Pin Definitions
// =============================================================================
#define PWM_BRIGHTNESS_TRIS TRISCbits.TRISC4
#define PWM_BRIGHTNESS      LATCbits.LATC4

#define PWM_CONTRAST_TRIS   TRISCbits.TRISC5
#define PWM_CONTRAST        LATCbits.LATC5

// =============================================================================
// UART Pin Definitions
// =============================================================================
#define UART_RX_TRIS    TRISBbits.TRISB5    // Serial data in from main board
#define UART_TX_TRIS    TRISBbits.TRISB7    // Serial data out (if needed)
#define DEBUG_TX_TRIS   TRISBbits.TRISB4    // Debug output (TTL)

// =============================================================================
// UART Configuration
// =============================================================================
#define UART_BAUD_RATE  19200
// SPBRG = (FOSC / (16 * BAUD)) - 1 = (8000000 / (16 * 19200)) - 1 = 25
#define UART_SPBRG_VAL  25

// =============================================================================
// Timing Constants
// =============================================================================
#define LCD_INIT_DELAY_MS   50
#define LCD_CMD_DELAY_US    40
#define LCD_CLEAR_DELAY_MS  2

#endif // CONFIG_H
