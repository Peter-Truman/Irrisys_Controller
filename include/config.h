/**
 * IRRISYS Irrigation Controller - Hardware Configuration
 * Target: PIC18F2525 @ 32MHz (8MHz internal + 4x PLL)
 */

#ifndef CONFIG_H
#define CONFIG_H

#include <xc.h>
#include <stdint.h>
#include <stdbool.h>
// UART function prototypes
void uart_println(const char *str);

// Configuration bits
#pragma config OSC = INTIO67 // Internal oscillator, I/O on RA6 and RA7
#pragma config FCMEN = OFF   // Fail-Safe Clock Monitor disabled
#pragma config IESO = OFF    // Oscillator Switchover mode disabled
#pragma config PWRT = ON     // Power-up Timer enabled
#pragma config BOREN = ON    // Brown-out Reset enabled
#pragma config WDT = OFF     // Watchdog Timer disabled
#pragma config MCLRE = ON    // MCLR pin enabled
#pragma config LPT1OSC = OFF // Timer1 configured for higher power
#pragma config PBADEN = OFF  // PORTB<4:0> pins are digital I/O
#pragma config LVP = OFF     // Single-Supply ICSP disabled
#pragma config XINST = OFF   // Extended instructions disabled
#pragma config DEBUG = OFF   // Background debugger disabled

// Clock frequency for delays
#define _XTAL_FREQ 32000000

// LCD Pin Definitions (PORTA - 4-bit mode)
#define LCD_RS LATAbits.LATA6
#define LCD_EN LATAbits.LATA7
#define LCD_D4 LATAbits.LATA0
#define LCD_D5 LATAbits.LATA1
#define LCD_D6 LATAbits.LATA2
#define LCD_D7 LATAbits.LATA3
#define LCD_TRIS TRISA

// Rotary Encoder Pins (PORTB)
#define ENC_A PORTBbits.RB1
#define ENC_B PORTBbits.RB2
#define ENC_SW PORTBbits.RB6 // Pushbutton

// Buzzer Pin
#define BUZZER LATCbits.LATC2
#define BUZZER_TRIS TRISCbits.TRISC2

// Sensor Input Pins (for future use)
#define SENSOR1_PIN 0 // AN0
#define SENSOR2_PIN 1 // AN1
#define SENSOR3_PIN 2 // AN2

// Relay output
#define RELAY_PIN LATCbits.LATC2
#define RELAY_TRIS TRISCbits.TRISC2

#endif