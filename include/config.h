/**
 * IRRISYS Irrigation Controller - Hardware Configuration
 * Target: PIC18F26K22 @ 32MHz (8MHz internal + 4x PLL)
 *
 * Hardware Version: Ver_B Rev_1
 *
 * Pin Assignment:
 *   PORTA:
 *     RA0 = ADC1 (4-20mA loop 1)
 *     RA1 = ADC2 (4-20mA loop 2)
 *     RA2 = ADC3 (4-20mA loop 3)
 *     RA3 = NC
 *     RA4 = Digital Input 1 - Running/Stopped (Active High)
 *     RA5 = Digital Input 2 - PNP1 (Active High)
 *     RA6 = Digital Input 3 - PNP2 (Active High)
 *     RA7 = Digital Input 4 - PNP3 (Active High)
 *   PORTB:
 *     RB0 = RTC Interrupt (1Hz square wave)
 *     RB1 = Rotary Encoder Ch A
 *     RB2 = Rotary Encoder Ch B
 *     RB3 = Momentary Button (Active Low)
 *     RB4 = Relay Output 2 (Active High) - Not currently used
 *     RB5 = Relay Output 1 (Active High) - Primary relay
 *     RB6 = Serial Debug TX (UART2)
 *     RB7 = Serial Debug RX (UART2)
 *   PORTC:
 *     RC0 = Buzzer Drive (Active High)
 *     RC1 = NC
 *     RC2 = EEPROM Write Protect (Low = enabled)
 *     RC3 = I2C SCL
 *     RC4 = I2C SDA
 *     RC5 = NC
 *     RC6 = Serial TX to Display Board (UART1)
 *     RC7 = Serial RX from Display Board (UART1) - Not currently used
 */

#ifndef CONFIG_H
#define CONFIG_H

#include <xc.h>
#include <stdint.h>
#include <stdbool.h>

// UART function prototypes
void uart_println(const char *str);

// Configuration bits for PIC18F26K22
#pragma config FOSC = INTIO67  // Internal oscillator, I/O on RA6 and RA7
#pragma config PLLCFG = ON     // 4x PLL enabled
#pragma config PRICLKEN = ON   // Primary clock enabled
#pragma config FCMEN = OFF     // Fail-Safe Clock Monitor disabled
#pragma config IESO = OFF      // Oscillator Switchover mode disabled
#pragma config PWRTEN = ON     // Power-up Timer enabled
#pragma config BOREN = SBORDIS // Brown-out Reset enabled in hardware
#pragma config BORV = 190      // Brown-out voltage = 1.9V
#pragma config WDTEN = OFF     // Watchdog Timer disabled
#pragma config WDTPS = 32768   // WDT Postscaler
#pragma config PBADEN = OFF    // PORTB<5:0> pins are digital I/O
#pragma config HFOFST = ON     // HFINTOSC fast start-up
#pragma config MCLRE = EXTMCLR // MCLR pin enabled
#pragma config LVP = OFF       // Single-Supply ICSP disabled
#pragma config XINST = OFF     // Extended instructions disabled
#pragma config STVREN = ON     // Stack overflow reset enabled
#pragma config DEBUG = OFF     // Background debugger disabled

// Clock frequency for delays
#define _XTAL_FREQ 32000000

// =============================================================================
// ADC Pin Definitions (4-20mA inputs on internal ADC)
// =============================================================================
#define ADC_CH1_PIN     0       // AN0 = RA0
#define ADC_CH2_PIN     1       // AN1 = RA1
#define ADC_CH3_PIN     2       // AN2 = RA2

// =============================================================================
// Digital Input Definitions (Active High)
// =============================================================================
#define DIG_IN1_PORT    PORTAbits.RA4   // Running/Stopped
#define DIG_IN2_PORT    PORTAbits.RA5   // PNP1
#define DIG_IN3_PORT    PORTAbits.RA6   // PNP2
#define DIG_IN4_PORT    PORTAbits.RA7   // PNP3

#define DIG_IN1_TRIS    TRISAbits.TRISA4
#define DIG_IN2_TRIS    TRISAbits.TRISA5
#define DIG_IN3_TRIS    TRISAbits.TRISA6
#define DIG_IN4_TRIS    TRISAbits.TRISA7

// =============================================================================
// Rotary Encoder Pins (PORTB)
// =============================================================================
#define ENC_A           PORTBbits.RB1
#define ENC_B           PORTBbits.RB2
#define ENC_SW          PORTBbits.RB3   // Button on RB3 (Ver_B_Rev_1)

#define ENC_A_TRIS      TRISBbits.TRISB1
#define ENC_B_TRIS      TRISBbits.TRISB2
#define ENC_SW_TRIS     TRISBbits.TRISB3

// =============================================================================
// Relay Output Definitions (Active High)
// =============================================================================
#define RELAY1_PIN      LATBbits.LATB5  // Primary relay
#define RELAY2_PIN      LATBbits.LATB4  // Secondary relay (not currently used)
#define RELAY1_TRIS     TRISBbits.TRISB5
#define RELAY2_TRIS     TRISBbits.TRISB4

// Legacy alias for existing code
#define RELAY_PIN       RELAY1_PIN
#define RELAY_TRIS      RELAY1_TRIS

// =============================================================================
// Buzzer Pin (Active High)
// =============================================================================
#define BUZZER          LATCbits.LATC0  // Buzzer on RC0 (Ver_B_Rev_1)
#define BUZZER_TRIS     TRISCbits.TRISC0

// =============================================================================
// EEPROM Write Protect (Active Low = protected)
// =============================================================================
#define EEPROM_WP       LATCbits.LATC2
#define EEPROM_WP_TRIS  TRISCbits.TRISC2

// =============================================================================
// I2C Pins
// =============================================================================
#define I2C_SCL_TRIS    TRISCbits.TRISC3
#define I2C_SDA_TRIS    TRISCbits.TRISC4

// =============================================================================
// RTC Interrupt Pin
// =============================================================================
#define RTC_INT_PORT    PORTBbits.RB0
#define RTC_INT_TRIS    TRISBbits.TRISB0

#endif
