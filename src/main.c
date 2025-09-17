/**
 * IRRISYS Irrigation Controller - Main Program
 * Step 1: Hello World with LCD and beeps
 */

#include "../include/config.h"

// Function prototypes
void system_init(void);
void lcd_init(void);
void lcd_cmd(uint8_t cmd);
void lcd_data(uint8_t data);
void lcd_print(const char *str);
void lcd_clear(void);
void lcd_set_cursor(uint8_t row, uint8_t col);
void beep(uint16_t duration_ms);

// LCD helper function
void lcd_pulse_enable(void)
{
    LCD_EN = 1;
    __delay_us(1);
    LCD_EN = 0;
    __delay_us(100);
}

void lcd_write_nibble(uint8_t nibble)
{
    LCD_D4 = (nibble >> 0) & 0x01;
    LCD_D5 = (nibble >> 1) & 0x01;
    LCD_D6 = (nibble >> 2) & 0x01;
    LCD_D7 = (nibble >> 3) & 0x01;
    lcd_pulse_enable();
}

void lcd_cmd(uint8_t cmd)
{
    LCD_RS = 0; // Command mode
    lcd_write_nibble(cmd >> 4);
    lcd_write_nibble(cmd & 0x0F);
    __delay_ms(2);
}

void lcd_data(uint8_t data)
{
    LCD_RS = 1; // Data mode
    lcd_write_nibble(data >> 4);
    lcd_write_nibble(data & 0x0F);
    __delay_us(40);
}

void lcd_init(void)
{
    // Set LCD pins as outputs
    LCD_TRIS &= 0x0F; // RA0-RA3, RA6-RA7 as outputs

    __delay_ms(50); // LCD power-up time

    // Initialize in 4-bit mode
    LCD_RS = 0;
    lcd_write_nibble(0x03);
    __delay_ms(5);
    lcd_write_nibble(0x03);
    __delay_ms(1);
    lcd_write_nibble(0x03);
    __delay_ms(1);
    lcd_write_nibble(0x02); // 4-bit mode
    __delay_ms(1);

    // Function set: 4-bit, 2 lines, 5x8 font
    lcd_cmd(0x28);
    // Display on, cursor off, blink off
    lcd_cmd(0x0C);
    // Clear display
    lcd_cmd(0x01);
    __delay_ms(2);
    // Entry mode: increment, no shift
    lcd_cmd(0x06);
}

void lcd_clear(void)
{
    lcd_cmd(0x01);
    __delay_ms(2);
}

void lcd_set_cursor(uint8_t row, uint8_t col)
{
    uint8_t pos = col;
    if (row == 1)
        pos += 0x40;
    else if (row == 2)
        pos += 0x14;
    else if (row == 3)
        pos += 0x54;
    lcd_cmd(0x80 | pos);
}

void lcd_print(const char *str)
{
    while (*str)
    {
        lcd_data(*str++);
    }
}

void beep(uint16_t duration_ms)
{
    BUZZER = 1;
    for (uint16_t i = 0; i < duration_ms; i++)
    {
        __delay_ms(1);
    }
    BUZZER = 0;
}

void system_init(void)
{
    // Set internal oscillator to 8MHz with 4x PLL = 32MHz
    OSCCON = 0x72;  // 8MHz internal oscillator
    OSCTUNE = 0x40; // Enable 4x PLL

    // Wait for oscillator to stabilize
    while (!OSCCONbits.IOFS)
        ;

    // Configure I/O ports
    ADCON1 = 0x0F; // All pins digital

    // Buzzer pin as output
    BUZZER_TRIS = 0;
    BUZZER = 0;

    // Encoder pins as inputs with pull-ups
    TRISBbits.TRISB1 = 1; // ENC_A input
    TRISBbits.TRISB2 = 1; // ENC_B input
    TRISBbits.TRISB6 = 1; // ENC_SW input
    INTCON2bits.RBPU = 0; // Enable PORTB pull-ups
}

void main(void)
{
    system_init();
    lcd_init();

    // Welcome message
    lcd_clear();
    lcd_set_cursor(0, 3);
    lcd_print("IRRISYS v1.0");
    lcd_set_cursor(1, 2);
    lcd_print("Irrigation Ctrl");

    // Three beeps
    beep(100);
    __delay_ms(100);
    beep(100);
    __delay_ms(100);
    beep(200);

    __delay_ms(2000);

    // Show ready message
    lcd_clear();
    lcd_set_cursor(0, 0);
    lcd_print("System Ready");
    lcd_set_cursor(1, 0);
    lcd_print("Encoder: --");

    // Main loop
    while (1)
    {
        // Check pushbutton (active low)
        if (ENC_SW == 0)
        {
            beep(50);
            lcd_set_cursor(2, 0);
            lcd_print("Button Pressed!");
            __delay_ms(200);
            lcd_set_cursor(2, 0);
            lcd_print("               ");
        }
    }
}