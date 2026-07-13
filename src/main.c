/**
 * IRRISYS - Full System with Buffered LCD
 * PIC18F26K22 @ 32MHz
 *
 * Version: Ver_B_Rev_0
 *   - Ver_B = Hardware version (alphabetic, increments on pin/peripheral changes)
 *   - Rev_0 = Firmware revision for this hardware version
 *
 * Button behavior:
 *   - Press -> immediate short beep (50ms)
 *   - Release before 1000ms -> short press event
 *   - Hold >= 1000ms -> long beep (300ms), long press event, non-blocking
 */

#define HW_VERSION  'B'   // Hardware version (A, B, C, ...)
#define FW_REVISION 0     // Firmware revision for this hardware

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
#include "../include/eeprom.h"
#include "../include/i2c.h"
#include "../include/rtc.h"
#include "../include/pca9535.h"
#include "../include/lcd.h"
#include "../include/eventlog.h"
#include <stdio.h>
#include <string.h>

// External variables from encoder
extern volatile uint8_t button_event;
extern volatile uint16_t button_hold_captured;

// External function declarations for menu editing
extern void menu_update_edit_value(void);
extern void handle_time_rotation(int8_t direction);
extern void menu_update_time_value(void);
extern void menu_draw_utility(void);
extern void menu_draw_main_menu(void);
extern void menu_draw_digital(void);

// Relay pulse control
volatile uint8_t relay_state = 0;
volatile uint16_t relay_counter = 0;
volatile uint8_t relay_latch_mode = 0;

extern volatile uint8_t timeout_debug_flag;
extern uint8_t current_input;

// Function prototypes
void uart_init(void);
void uart_write(char c);
void uart_print(const char *str);
void uart_println(const char *str);
void system_init(void);
void beep(uint16_t duration_ms);
void beep_double(uint16_t on_ms, uint16_t gap_ms);

// =============================================================================
// UART Functions (EUSART2 on RB6/RB7 @ 9600 baud for debug)
// =============================================================================

void uart_init(void)
{
    // EUSART2 - Debug Serial (RB6=TX, RB7=RX) @ 9600 baud
    TRISBbits.TRISB6 = 0;
    TRISBbits.TRISB7 = 1;

    TXSTA2 = 0b00100100;
    RCSTA2 = 0b10010000;
    BAUDCON2 = 0b00001000;

    SPBRG2 = 0x40;
    SPBRGH2 = 0x03;

    // EUSART1 - Display Serial (RC6=TX) @ 19200 baud
    TRISCbits.TRISC6 = 0;
    TRISCbits.TRISC7 = 1;

    TXSTA1 = 0b00100100;
    RCSTA1 = 0b10010000;
    BAUDCON1 = 0b00001000;

    SPBRG1 = 0xA0;
    SPBRGH1 = 0x01;
}

void uart_write(char c)
{
    while (!TXSTA2bits.TRMT)
        ;
    TXREG2 = c;
}

void uart_print(const char *str)
{
    while (*str)
    {
        uart_write(*str++);
    }
}

void uart_println(const char *str)
{
    uart_print(str);
    uart_write('\r');
    uart_write('\n');
}

// =============================================================================
// System Initialization
// =============================================================================

void system_init(void)
{
    // Configure oscillator for 32MHz
    OSCCONbits.IRCF = 0b110;
    OSCCONbits.SCS = 0b00;
    OSCTUNEbits.PLLEN = 1;

    while (!OSCCONbits.HFIOFS)
        ;

    // ADC: RA0-RA2 analog, rest digital
    ANSELA = 0x07;
    ANSELB = 0x00;
    ANSELC = 0x00;

    LATA = 0;
    LATB = 0;
    LATC = 0;

    // Buzzer (RC0)
    BUZZER_TRIS = 0;
    BUZZER = 0;

    // Encoder (RB1=A, RB2=B, RB3=SW)
    ENC_A_TRIS = 1;
    ENC_B_TRIS = 1;
    ENC_SW_TRIS = 1;

    // RTC interrupt (RB0)
    RTC_INT_TRIS = 1;

    // PORTB pull-ups
    INTCON2bits.RBPU = 0;
    WPUB = 0b00001111;

    // Digital inputs (RA4-RA7)
    DIG_IN1_TRIS = 1;
    DIG_IN2_TRIS = 1;
    DIG_IN3_TRIS = 1;
    DIG_IN4_TRIS = 1;

    // Relay outputs (RB5, RB4) - start de-energized (open/safe)
    RELAY1_TRIS = 0;
    RELAY1_PIN = 0;  // De-energized = open = pump stopped (safe boot)
    RELAY2_TRIS = 0;
    RELAY2_PIN = 0;

    // EEPROM write protect (RC2)
    EEPROM_WP_TRIS = 0;
    EEPROM_WP = 0;

    // RC5 - unused (AD7994 removed), set as output low
    TRISCbits.TRISC5 = 0;
    LATCbits.LATC5 = 0;

    // Enable FVR at 2.048V for ADC reference
    // VREFCON0: bit7=FVREN, bit6=FVRST(RO), bit5:4=FVRS<1:0>, bits3:0=unused
    // FVRS: 00=reserved, 01=1.024V, 10=2.048V, 11=4.096V
    VREFCON0 = 0b10100000;  // FVREN=1, FVRS=10 (2.048V)
    while (!VREFCON0bits.FVRST)
        ;  // Wait for FVR to stabilize
}

void trigger_relay_pulse(uint8_t latch_mode)
{
    extern system_config_t system_config;

    if (relay_state == 0)
    {
        relay_state = 1;
        relay_latch_mode = latch_mode;

        if (latch_mode)
        {
            relay_counter = 0;
            uart_println("Relay OPEN - LATCHED");
        }
        else
        {
            // Pulse mode: counter starts when DIG_IN1 goes low, not now
            relay_counter = 0;
            char buf[40];
            sprintf(buf, "Relay OPEN - PULSE: %d sec delay", system_config.relay_pulse_time);
            uart_println(buf);
        }

        RELAY1_PIN = 0;  // De-energize = open = pump stopped
    }
}

void relay_close(void)
{
    if (relay_state == 1)
    {
        relay_state = 0;
        relay_counter = 0;
        RELAY1_PIN = 1;  // Energize = closed = pump can run
        uart_println("Relay CLOSED");
    }
}

// Alarm buzzer pattern state. Defined here (before beep()) because both beep()
// and the Timer0 ISR must see it: while an alarm pattern is running it OWNS the
// BUZZER pin, and the beep sequencer must not drive the pin out from under it.
volatile uint8_t alarm_buzz_phase = 0;  // 0=idle, 1-12=on/off cycles (odd=on, even=off)

// [R3] Non-blocking beep. Sets up the buzzer and returns IMMEDIATELY; the 1ms
// Timer0 ISR sequences the pin and turns it off when the time expires.
// Previously this busy-waited with __delay_ms, stalling the whole main loop —
// including the 1Hz safety tick that follows it — for up to 300ms on a long
// press, and 1ms on every single encoder detent.
void beep(uint16_t duration_ms)
{
    INTCONbits.GIE = 0;          // atomic update of the buzzer state group
    buzzer_on_ms   = duration_ms;
    buzzer_off_ms  = 0;
    buzzer_repeats = 0;
    buzzer_phase   = 1;          // 1 = ON phase
    buzzer_ms      = duration_ms;
    if (alarm_buzz_phase == 0) BUZZER = 1;
    INTCONbits.GIE = 1;
}

// [R5] Watchdog-fed blocking delay — BOOT-TIME ONLY, never used in the main
// loop. Feeds CLRWDT every 1ms so long boot waits can't trip the watchdog,
// which is what lets us run a much tighter WDT timeout.
static void delay_ms_wdt(uint16_t ms)
{
    while (ms--)
    {
        CLRWDT();
        __delay_ms(1);
    }
}

// [R3] Two beeps separated by a gap, fully non-blocking. Replaces the
// beep(); __delay_ms(gap); beep(); pattern used for fault-ack and menu timeout.
void beep_double(uint16_t on_ms, uint16_t gap_ms)
{
    if (gap_ms == 0) gap_ms = 1;  // a zero gap would stall the sequencer
    INTCONbits.GIE = 0;
    buzzer_on_ms   = on_ms;
    buzzer_off_ms  = gap_ms;
    buzzer_repeats = 1;           // one additional beep after the gap
    buzzer_phase   = 1;
    buzzer_ms      = on_ms;
    if (alarm_buzz_phase == 0) BUZZER = 1;
    INTCONbits.GIE = 1;
}

// =============================================================================
// ADC averaging (8-sample rolling average per channel)
// =============================================================================
#define ADC_AVG_SIZE 4
#define ADC_AVG_SHIFT 2  // log2(4)
static uint16_t adc_buf[3][ADC_AVG_SIZE];
static uint8_t adc_buf_idx = 0;
static uint8_t adc_buf_full = 0;

// =============================================================================
// System state machine
// =============================================================================
#define SYS_STOP  0
#define SYS_RUN   1

// Bypass timer phases
#define BP_INACTIVE  0  // Direction not monitored
#define BP_PRIMARY   1  // Startup grace period (counts down regardless)
#define BP_NORMAL    2  // Normal monitoring (no timer running)
#define BP_SECONDARY 3  // Fault detected, secondary countdown
#define BP_ALARM     4  // Timer expired while fault active

// Bypass timer state per direction
typedef struct {
    uint16_t countdown;  // Seconds remaining, 0=inactive
    uint8_t phase;       // BP_INACTIVE/PRIMARY/NORMAL/SECONDARY/ALARM
} bp_dir_t;

// Bypass timer state per input (high + low directions)
typedef struct {
    bp_dir_t high;
    bp_dir_t low;
} bp_input_t;

static uint8_t sys_state = SYS_STOP;
static uint32_t run_timer_secs = 0;
static uint8_t flash_toggle = 0;
// tick_counter removed — 1-second tick now driven by RTC 1Hz interrupt (rtc_tick_count)
static uint8_t render_counter = 0;     // Display update throttle
static uint8_t refresh_counter = 0;    // Periodic full-screen re-assert (display self-heal)
static uint16_t pwr_detect_countdown = 0;  // Non-blocking power detect delay (seconds)
static uint8_t boot_pwr_fail = 0;             // Set once at boot if power_failure_flag was set in EEPROM
static uint8_t ext_stop_flag = 0;             // 1=stopped by external run input going low
static uint8_t wdt_reset_flag = 0;            // [4e-2] 1=booted from a watchdog reset (safe-latch until acknowledged)
static uint8_t led_flash_counter = 0;         // 50ms tick counter for 2Hz LED flash
static uint8_t led_flash_state = 0;           // Toggles at 2Hz for LED flashing

// Bypass timer state
static bp_input_t bp_state[3];
static uint8_t alarm_active[3] = {0, 0, 0};  // Per-input alarm flag
static uint8_t alarm_flash = 0;               // Toggles at ~4Hz for alarm line flash
static uint8_t alarm_flash_counter = 0;

// Alarm buzzer state (6 cycles of 500ms on / 250ms off)
// alarm_buzz_phase is defined above beep() (shared with the Timer0 ISR)
static uint8_t alarm_buzz_tick = 0;   // Counts 50ms ticks within current phase

// Alarm display: which bypass abbreviation to show on the fault line
static char alarm_code_text[7] = "";  // e.g. "PLPBP", "PHTBP"
static uint8_t alarm_input_idx = 0;   // Which input (0-2) triggered the alarm

// =============================================================================
// ADC to engineering units conversion
// =============================================================================
// 4mA = 205 counts, 20mA = 1000 counts (100 ohm sense, 2.048V ref, 10-bit)
#define ADC_4MA   205
#define ADC_20MA  1000

int16_t adc_to_eng(uint16_t counts, int16_t scale_4ma, int16_t scale_20ma)
{
    int32_t num;
    if (counts <= ADC_4MA) return scale_4ma;
    if (counts >= ADC_20MA) return scale_20ma;
    num = (int32_t)(counts - ADC_4MA) * (scale_20ma - scale_4ma);
    return scale_4ma + (int16_t)(num / (ADC_20MA - ADC_4MA));
}


// =============================================================================
// Unit conversion: SUSPENDED — may reinstate later
// All values currently entered/displayed in standard units (psi, °C, %)
// =============================================================================
#if 0
int16_t convert_for_display(int16_t val, const char *units)
{
    if (units[0] == 'b' && units[1] == 'a' && units[2] == 'r')
    { int32_t tmp = (int32_t)val * 689 / 10000; return (int16_t)tmp; }
    if (units[0] == 'k' && units[1] == 'P' && units[2] == 'a')
    { int32_t tmp = (int32_t)val * 6895 / 1000; return (int16_t)tmp; }
    if (units[0] == '\xDF' && units[1] == 'F')
    { int32_t tmp = (int32_t)val * 9 / 5 + 32; return (int16_t)tmp; }
    return val;
}

int16_t convert_to_standard(int16_t val, const char *units)
{
    if (units[0] == 'b' && units[1] == 'a' && units[2] == 'r')
    { int32_t tmp = (int32_t)val * 10000 / 689; return (int16_t)tmp; }
    if (units[0] == 'k' && units[1] == 'P' && units[2] == 'a')
    { int32_t tmp = (int32_t)val * 1000 / 6895; return (int16_t)tmp; }
    if (units[0] == '\xDF' && units[1] == 'F')
    { int32_t tmp = ((int32_t)val - 32) * 5 / 9; return (int16_t)tmp; }
    return val;
}
#endif

// Forward declarations for bypass timer helpers
static uint8_t read_digital_input(uint8_t input_idx);

// Bypass abbreviation lookup [sensor_type 0-5] for alarm display
static const char *bp_lbl_phi[6] = {"PHPBP", "PHTBP", "PHFBP", "PFBP",  "PHVBP", "PABP"};
static const char *bp_lbl_shi[6] = {"SHPBP", "SHTBP", "SHFBP", "SFBP",  "SHVBP", "SABP"};
static const char *bp_lbl_plo[6] = {"PLPBP", "PLTBP", "PLFBP", "PNFBP", "PLVBP", "PNABP"};
static const char *bp_lbl_slo[6] = {"SLPBP", "SLTBP", "SLFBP", "SNFBP", "SLVBP", "SNABP"};

// =============================================================================
// Main screen rendering
// =============================================================================
void render_main_screen(uint16_t ch1, uint16_t ch2, uint16_t ch3)
{
    char line[21];
    uint16_t adc_vals[3];

    adc_vals[0] = ch1;
    adc_vals[1] = ch2;
    adc_vals[2] = ch3;

    // --- Line 1: Status + stop code + time ---
    lcd_clear();
    lcd_set_cursor(0, 0);
    // Use %-15s to left-pad status, then right-justify time at col 15
    {
        const char *state = "Standby";
        const char *msg = "";

        if (wdt_reset_flag)
            msg = "WatchDog";                 // [4e-2] distinct watchdog-reset indication
        else if (boot_pwr_fail)
            msg = "Pwr Fail";
        else if (system_config.active_stop_code)
        {
            if (system_config.active_stop_code == 1)
                msg = "End RunTime";
        }
        else if (sys_state == SYS_RUN)
            state = "Running";
        else if (ext_stop_flag)
            msg = "Ext Stop";

        // Show countdown HH:MM:SS when running with clock enabled and runtime > 0
        // (but not after runtime expired — show "STOP End RunTime" instead)
        if (sys_state == SYS_RUN && system_config.clock_enabled &&
            (system_config.runtime_hours > 0 || system_config.runtime_minutes > 0) &&
            system_config.active_stop_code != 1)
        {
            uint32_t t = run_timer_secs;
            uint8_t hh = t / 3600;
            uint8_t mm = (t % 3600) / 60;
            uint8_t ss = t % 60;
            sprintf(line, "Running     %02u:%02u:%02u",
                    hh, mm, ss);
        }
        else
        {
            // State left-justified, message right-justified
            sprintf(line, "%-20s", state);
            if (msg[0])
            {
                uint8_t mlen = strlen(msg);
                memcpy(line + 20 - mlen, msg, mlen);
            }
        }
    }
    // Flash "End RunTime" only (keep "STOP" visible)
    if (system_config.active_stop_code == 1 && !alarm_flash)
    {
        memcpy(line + 9, "           ", 11);  // Blank columns 9-19 ("End RunTime")
    }
    lcd_print(line);

    // --- Lines 2-4: Input values with bypass timer display ---
    for (uint8_t i = 0; i < 3; i++)
    {
        lcd_set_cursor(i + 1, 0);

        if (!input_config[i].enable)
        {
            lcd_print("                    ");
            continue;
        }

        // Alarm flash: blank the line during flash-off phase
        if (alarm_active[i] && !alarm_flash)
        {
            lcd_print("                    ");
            continue;
        }

        // Build value and units separately
        char vbuf[8];   // Value string (max 5 chars: sign + 4 digits)
        char ubuf[4];   // Units string (max 3 chars)
        uint8_t st = input_config[i].sensor_type;
        uint8_t is_digital = (st == 3 || st == 5);

        ubuf[0] = '\0';

        if (is_digital)
        {
            uint8_t sw_on = read_digital_input(i);
            if (input_config[i].fault_polarity)
                sw_on = !sw_on;
            sprintf(vbuf, "%s", sw_on ? "High" : "Low");
        }
        else
        {
            int16_t eng = adc_to_eng(adc_vals[i],
                                      input_config[i].scale_4ma,
                                      input_config[i].scale_20ma);
            int16_t val = eng;
            if (val < -9999) val = -9999;
            if (val > 9999) val = 9999;

            sprintf(vbuf, "%5d", val);

            // Copy units (max 3 chars)
            strncpy(ubuf, input_config[i].units, 3);
            ubuf[3] = '\0';
        }

        // Find most urgent active timer and its label
        uint16_t display_timer = 0;
        const char *bp_label = "";
        if (bp_state[i].high.countdown > 0)
        {
            display_timer = bp_state[i].high.countdown;
            if (bp_state[i].high.phase == BP_PRIMARY)
                bp_label = bp_lbl_phi[st];
            else
                bp_label = bp_lbl_shi[st];
        }
        if (bp_state[i].low.countdown > 0 &&
            (display_timer == 0 || bp_state[i].low.countdown < display_timer))
        {
            display_timer = bp_state[i].low.countdown;
            if (bp_state[i].low.phase == BP_PRIMARY)
                bp_label = bp_lbl_plo[st];
            else
                bp_label = bp_lbl_slo[st];
        }

        // Build the line based on whether bypass is active
        memset(line, ' ', 20);
        line[20] = '\0';

        uint8_t vlen = (uint8_t)strlen(vbuf);

        // Alarm active: show name + alarm code only (no value)
        if (alarm_active[i] && i == alarm_input_idx && alarm_code_text[0] != '\0')
        {
            uint8_t nlen = (uint8_t)strlen(input_config[i].name);
            if (nlen > 11) nlen = 11;
            memcpy(line, input_config[i].name, nlen);

            uint8_t clen = (uint8_t)strlen(alarm_code_text);
            if (clen > 0 && clen <= 6)
                memcpy(line + 20 - clen, alarm_code_text, clen);
        }
        else if (display_timer > 0)
        {
            // Bypass active: code left (0-6), timer at col 7 (7-11), value right (15-19)
            uint8_t blen = (uint8_t)strlen(bp_label);
            if (blen > 7) blen = 7;
            memcpy(line, bp_label, blen);

            uint8_t mm = (uint8_t)(display_timer / 60);
            uint8_t ss = (uint8_t)(display_timer % 60);
            char tbuf[6];
            sprintf(tbuf, "%02u:%02u", mm, ss);
            memcpy(line + 7, tbuf, 5);

            // Value right-justified ending at col 19
            if (vlen > 5) vlen = 5;
            memcpy(line + 20 - vlen, vbuf, vlen);
        }
        else
        {
            // Normal: name left (0-10), units right@13 (11-13), value right@19 (15-19)
            uint8_t nlen = (uint8_t)strlen(input_config[i].name);
            if (nlen > 11) nlen = 11;
            memcpy(line, input_config[i].name, nlen);

            // Units right-justified ending at col 13
            uint8_t ulen = (uint8_t)strlen(ubuf);
            if (ulen > 3) ulen = 3;
            if (ulen > 0)
                memcpy(line + 14 - ulen, ubuf, ulen);

            // Value right-justified ending at col 19
            if (vlen > 5) vlen = 5;
            memcpy(line + 20 - vlen, vbuf, vlen);
        }

        lcd_print(line);
    }

    lcd_flush();
}

// =============================================================================
// Internal ADC (PIC18F26K22 10-bit ADC) - Read AN0, AN1, AN2
// =============================================================================
uint16_t adc_read(uint8_t channel)
{
    // Select channel (AN0-AN2)
    ADCON0 = (uint8_t)((channel << 2) | 0x01);  // Channel select + ADC ON

    // Configure ADC: right justified, Fosc/32, Vref+=FVR (2.048V), Vref-=VSS
    ADCON1 = 0b00001000;  // PVCFG<3:2>=10 (FVR), NVCFG<1:0>=00 (VSS)
    ADCON2 = 0b10100010;  // Right justified, 8 TAD acq time, Fosc/32

    __delay_us(10);  // Acquisition time

    ADCON0bits.GO = 1;  // Start conversion
    while (ADCON0bits.GO)
        ;  // Wait for completion

    return (uint16_t)((ADRESH << 8) | ADRESL);
}

// =============================================================================
// Bypass timer helpers
// =============================================================================

static uint8_t read_digital_input(uint8_t input_idx)
{
    switch (input_idx)
    {
    case 0: return DIG_IN2_PORT;
    case 1: return DIG_IN3_PORT;
    case 2: return DIG_IN4_PORT;
    default: return 0;
    }
}

// Process one bypass direction per 1-second tick.
// Returns: 0=no alarm, 1=alarm from primary, 2=alarm from secondary
static uint8_t process_bp(bp_dir_t *dir, uint8_t fault, uint16_t sec_time)
{
    switch (dir->phase)
    {
    case BP_PRIMARY:
        if (!fault)
        {
            // Threshold reached — bypass no longer needed
            dir->phase = BP_NORMAL;
            dir->countdown = 0;
            break;
        }
        if (dir->countdown > 0) dir->countdown--;
        if (dir->countdown == 0)
        {
            dir->phase = BP_ALARM;
            return 1;
        }
        break;

    case BP_NORMAL:
        // Monitor for fault
        if (fault)
        {
            if (sec_time > 0)
            {
                dir->phase = BP_SECONDARY;
                dir->countdown = sec_time;
            }
            else
            {
                // No secondary grace — immediate alarm
                dir->phase = BP_ALARM;
                return 2;
            }
        }
        break;

    case BP_SECONDARY:
        // Countdown while fault persists
        if (!fault)
        {
            // Fault cleared — back to normal
            dir->phase = BP_NORMAL;
            dir->countdown = 0;
        }
        else
        {
            if (dir->countdown > 0) dir->countdown--;
            if (dir->countdown == 0) { dir->phase = BP_ALARM; return 2; }
        }
        break;

    case BP_ALARM:
        // Stay in alarm until cleared externally
        break;
    }
    return 0;
}

// Initialize bypass timers for one input on RUN start
static void init_bp_timers(uint8_t i)
{
    // High direction: always monitor if input is enabled
    // Primary bypass > 0: start in BP_PRIMARY with countdown
    // Primary bypass = 0: start in BP_NORMAL (immediate monitoring)
    if (input_config[i].primary_high_bypass > 0)
    {
        bp_state[i].high.phase = BP_PRIMARY;
        bp_state[i].high.countdown = input_config[i].primary_high_bypass;
    }
    else
    {
        bp_state[i].high.phase = BP_NORMAL;
        bp_state[i].high.countdown = 0;
    }

    // Low direction: always monitor if input is enabled
    if (input_config[i].primary_low_bypass > 0)
    {
        bp_state[i].low.phase = BP_PRIMARY;
        bp_state[i].low.countdown = input_config[i].primary_low_bypass;
    }
    else
    {
        bp_state[i].low.phase = BP_NORMAL;
        bp_state[i].low.countdown = 0;
    }

    alarm_active[i] = 0;
}

// Clear all bypass timers (on STOP or fault clear)
static void clear_bp_timers(void)
{
    for (uint8_t i = 0; i < 3; i++)
    {
        bp_state[i].high.phase = BP_INACTIVE;
        bp_state[i].high.countdown = 0;
        bp_state[i].low.phase = BP_INACTIVE;
        bp_state[i].low.countdown = 0;
        alarm_active[i] = 0;
    }
    alarm_buzz_phase = 0;
    alarm_buzz_tick = 0;
    alarm_code_text[0] = '\0';
    alarm_input_idx = 0;
}

// Start the alarm buzzer (5 cycles of 250ms on/off)
static void start_alarm_buzzer(void)
{
    alarm_buzz_phase = 1;  // Start with ON
    alarm_buzz_tick = 0;
    BUZZER = 1;
}

// =============================================================================
// Main Function
// =============================================================================

void main(void)
{
    // [4e-2] Capture reset cause BEFORE the first CLRWDT (which sets /TO).
    // RCON /TO == 0 here means the watchdog timed out and reset the MCU
    // (only a WDT time-out clears /TO; power-on/BOR/MCLR leave it set).
    wdt_reset_flag = (RCONbits.NOT_TO == 0) ? 1 : 0;

    CLRWDT();  // [R5] Fresh watchdog window for the whole boot sequence
    system_init();
    uart_init();
    eeprom_init();

    // Capture boot-time power fail state (only show on first screen after power-up)
    boot_pwr_fail = system_config.power_failure_flag;

    // Set menu timeout
    extern volatile uint16_t menu_timeout_reload;
    extern uint8_t get_menu_timeout_seconds(void);
    menu_timeout_reload = (uint16_t)get_menu_timeout_seconds() * 500;

    uart_println("");
    uart_println("================================");
    uart_println("IRRISYS Pump Protection");
    char buf[60];
    sprintf(buf, "Ver_%c_Rev_%d", HW_VERSION, FW_REVISION);
    uart_println(buf);
    uart_println("================================");

    // Initialize I2C bus
    i2c_init();

    // LOG DISABLED: event-log concept abandoned (code preserved at tag pre-refactor-restore)
    // eventlog_init();
    // if (boot_pwr_fail)
    //     eventlog_write(EVT_PWR_FAIL);
    // else
    //     eventlog_write(EVT_POWER_ON);

    // Initialize PCA9535 and run LED test
    pca9535_init();
    pca9535_led_init();
    pca9535_led_test();

    // Initialize RTC
    if (rtc_init() == 0)
    {
        uart_println("RTC OK");
    }
    else
    {
        uart_println("RTC FAIL");
    }

    // Initialize encoder and menu
    encoder_init();
    menu_init();
    lcd_init();

    uart_println("Peripherals initialized");

    // Confirm relay initial state (energized = closed)
    uart_println("RELAY: Closed (energized)");

    // Wait for display board
    delay_ms_wdt(500);  // [R5] WDT-fed

    // Set power LED
    disp_set_leds(0x01);

    // Splash screen
    lcd_clear();
    lcd_set_cursor(0, 0);
    lcd_print("       IRRISYS      ");
    lcd_set_cursor(1, 0);
    lcd_print("  Pump Protection   ");
    lcd_set_cursor(2, 0);
    lcd_print("                    ");
    lcd_set_cursor(3, 0);
    sprintf(buf, "    Ver_%c_Rev_%d    ", HW_VERSION, FW_REVISION);
    lcd_print(buf);
    lcd_flush();

    // Startup beeps
    for (uint8_t i = 0; i < 3; i++)
    {
        beep(50);
        __delay_ms(100);
    }

    // Hold splash briefly. The display board is already ready by this point (it
    // boots in ~1s and we waited 500ms above), so this is purely how long the
    // logo is shown — trimmed from 5s to 1.5s to get to the main screen sooner.
    uart_println("Splash hold 1.5s...");
    delay_ms_wdt(1500);  // [R5] WDT-fed
    beep(200);

    // Go to main screen
    extern uint8_t current_menu;
    current_menu = 255;

    // Initialize system state from DIG_IN1
    sys_state = DIG_IN1_PORT ? SYS_RUN : SYS_STOP;
    // [4e-2] After a watchdog reset, never silently resume RUN — force STOP so
    // the state is coherent with the latched-open relay below; operator must
    // acknowledge (button) to clear the WatchDog latch.
    if (wdt_reset_flag)
        sys_state = SYS_STOP;
    run_timer_secs = 0;

    // After boot sequence: check for latched fault, or a watchdog reset
    // ([4e-2] latch the relay open so an unexpected WDT reset can't auto-run).
    if (system_config.active_stop_code || wdt_reset_flag)
    {
        relay_state = 1;
        relay_latch_mode = 1;  // Treat as latched until button pressed
        RELAY1_PIN = 0;        // Stay de-energized = pump stopped
        uart_println(wdt_reset_flag ? "Boot: WATCHDOG reset, relay latched open"
                                    : "Boot: active stop code, relay latched open");
    }
    else
    {
        RELAY1_PIN = 1;  // No fault — energize relay, ready to run
        uart_println("Boot: relay energized (no fault)");
    }

    // If booting into STOP with power fail flag set, start countdown to auto-clear
    if (sys_state == SYS_STOP && boot_pwr_fail)
    {
        pwr_detect_countdown = system_config.power_fail_delay;
        if (pwr_detect_countdown == 0) pwr_detect_countdown = 1;
        uart_println("Boot: pwr fail flag set, starting countdown");
    }

    // Main loop variables
    int16_t last_encoder = 0;
    static uint32_t blink_timer = 0;
    static uint16_t encoder_activity_timer = 0;
    uint16_t adc_ch1, adc_ch2, adc_ch3;
    // RTC used for 1Hz tick only (no date/time display)

    // Clear display board, wait 1 second, then render first main screen with debug
    uart_println("Sending CLS to display...");
    disp_clear();
    uart_println("CLS sent. Waiting 300ms...");
    delay_ms_wdt(300);   // [R5] WDT-fed. Was 1s — the display processes a CLEAR
                         // in ~2ms, so this was pure padding before first render.

    // Reset LCD buffers for clean render
    lcd_init();

    // Apply saved brightness setting.
    // NOTE: on the display board, led_set_backlight() performs a BLOCKING
    // internal-EEPROM write (~8ms) with interrupts DISABLED, so it is deaf to
    // incoming UART bytes while it runs. Sending line frames immediately after
    // this lands them in that deaf window and they are silently dropped. Give
    // the display time to finish before transmitting anything else.
    disp_set_brightness(system_config.brightness * 10 + 10); // Map 0-9 to 10-100%
    delay_ms_wdt(50);  // let the display board finish its backlight EEPROM write

    // Build first main screen manually with debug output
    uart_println("Building first main screen:");
    {
        uint16_t raw0 = adc_read(0);
        uint16_t raw1 = adc_read(1);
        uint16_t raw2 = adc_read(2);

        // Debug: show config state
        sprintf(buf, "  enable: %d %d %d",
                input_config[0].enable,
                input_config[1].enable,
                input_config[2].enable);
        uart_println(buf);
        sprintf(buf, "  sensor_type: %d %d %d",
                input_config[0].sensor_type,
                input_config[1].sensor_type,
                input_config[2].sensor_type);
        uart_println(buf);
        sprintf(buf, "  ADC raw: %u %u %u", raw0, raw1, raw2);
        uart_println(buf);

        render_main_screen(raw0, raw1, raw2);
    }
    uart_println("render_main_screen done, now force_flush:");
    lcd_force_flush();

    // Safety net: drop the change-detection cache so the main loop's first
    // render re-sends every line. If the display missed any of the frames above
    // (its RX is deaf during the backlight EEPROM write), lcd_flush() would
    // otherwise compare equal forever and the screen would stay blank until the
    // content happened to change — which is exactly why the main screen only
    // appeared after entering and exiting a menu.
    lcd_invalidate();
    uart_println("force_flush done.");
    render_counter = 0;  // Reset so main loop doesn't re-render immediately

    // Digital input edge detection (initialize to current state)
    uint8_t last_dig1 = DIG_IN1_PORT;
    uint8_t last_dig2 = DIG_IN2_PORT;
    uint8_t last_dig3 = DIG_IN3_PORT;
    uint8_t last_dig4 = DIG_IN4_PORT;

    while (1)
    {
        CLRWDT();  // [R5] Feed the watchdog once per loop pass

        // =============================================================
        // Handle beep requests from ISR
        // =============================================================
        if (short_beep_flag)
        {
            short_beep_flag = 0;
            beep(50);
        }

        if (long_beep_flag)
        {
            long_beep_flag = 0;
            beep(300);
        }

        // =============================================================
        // Digital input edge detection (output on state change only)
        // =============================================================
        uint8_t dig1 = DIG_IN1_PORT;
        uint8_t dig2 = DIG_IN2_PORT;
        uint8_t dig3 = DIG_IN3_PORT;
        uint8_t dig4 = DIG_IN4_PORT;

        if (dig1 != last_dig1)
        {
            last_dig1 = dig1;
            sprintf(buf, "DIG1: %s", dig1 ? "Closed" : "Open");
            uart_println(buf);
        }
        if (dig2 != last_dig2)
        {
            last_dig2 = dig2;
            sprintf(buf, "DIG2: %s", dig2 ? "Closed" : "Open");
            uart_println(buf);
        }
        if (dig3 != last_dig3)
        {
            last_dig3 = dig3;
            sprintf(buf, "DIG3: %s", dig3 ? "Closed" : "Open");
            uart_println(buf);
        }
        if (dig4 != last_dig4)
        {
            last_dig4 = dig4;
            sprintf(buf, "DIG4: %s", dig4 ? "Closed" : "Open");
            uart_println(buf);
        }

        // =============================================================
        // System state machine (RUN/STOP based on DIG_IN1)
        // =============================================================
        if (dig1 && sys_state == SYS_STOP)
        {
            // If relay is latched open, refuse to start — button must clear first
            if (relay_state == 1 && relay_latch_mode)
            {
                uart_println("RUN blocked - relay latched, press button to clear");
            }
            else
            {
                sys_state = SYS_RUN;
                run_timer_secs = 0;
                if (system_config.clock_enabled)
                {
                    // Load runtime countdown (hours:minutes -> seconds)
                    run_timer_secs = (uint32_t)system_config.runtime_hours * 3600
                                   + (uint32_t)system_config.runtime_minutes * 60;
                }

                RELAY1_PIN = 1;  // Energize = closed = pump can run
                boot_pwr_fail = 0;
                ext_stop_flag = 0;
                pwr_detect_countdown = 0;  // Cancel any pending countdown
                beep(500);  // [R3] non-blocking (ISR-sequenced)

                // Immediate screen update BEFORE slow EEPROM saves
                if (current_menu == 255)
                {
                    render_main_screen(adc_ch1, adc_ch2, adc_ch3);
                    render_counter = 0;
                }

                // Clear any stored fault then ARM power fail flag (EEPROM saves are slow)
                if (system_config.power_failure_flag || system_config.active_stop_code)
                {
                    system_config.power_failure_flag = 0;
                    system_config.active_stop_code = 0;
                    save_power_flags();
                    uart_println("Faults cleared (RUN)");
                }
                system_config.power_failure_flag = 1;
                save_power_flags();

                // Initialize bypass timers for all enabled inputs
                for (uint8_t i = 0; i < 3; i++)
                {
                    if (input_config[i].enable)
                        init_bp_timers(i);
                    else
                        { bp_state[i].high.phase = BP_INACTIVE; bp_state[i].low.phase = BP_INACTIVE; alarm_active[i] = 0; }
                }
                // eventlog_write(EVT_START);  // LOG DISABLED
                uart_println("STATE: RUN (pwr fail armed, timers init)");
            }
        }
        else if (!dig1 && sys_state == SYS_RUN)
        {
            sys_state = SYS_STOP;
            // Set ext_stop_flag if no alarm/stop code caused this (pure external stop)
            if (!system_config.active_stop_code)
            {
                ext_stop_flag = 1;
                // eventlog_write(EVT_EXT_STOP);  // LOG DISABLED
            }
            beep(500);  // [R3] non-blocking (ISR-sequenced)
            // Start non-blocking power detect delay before clearing flag
            pwr_detect_countdown = system_config.power_fail_delay;
            if (pwr_detect_countdown == 0) pwr_detect_countdown = 1;  // Min 1 second

            // If relay is open in pulse mode, start pulse countdown
            {
                char dbuf[50];
                sprintf(dbuf, "STOP: relay_state=%u latch=%u", relay_state, relay_latch_mode);
                uart_println(dbuf);
            }
            if (relay_state == 1 && !relay_latch_mode)
            {
                relay_counter = system_config.relay_pulse_time;
                if (relay_counter == 0) relay_counter = 1;  // Min 1 second
                char dbuf[40];
                sprintf(dbuf, "Pulse countdown: %us", relay_counter);
                uart_println(dbuf);
            }

            {
                char dbuf[40];
                sprintf(dbuf, "STATE: STOP (pwr detect %us)", pwr_detect_countdown);
                uart_println(dbuf);
            }

            // Keep alarm_active[] and alarm_code_text for STOP screen flashing.
            // Zero out all countdowns so stale timers don't display.
            for (uint8_t j = 0; j < 3; j++)
            {
                bp_state[j].high.countdown = 0;
                bp_state[j].low.countdown = 0;
            }

            // Immediate screen update on state change
            if (current_menu == 255)
            {
                render_main_screen(adc_ch1, adc_ch2, adc_ch3);
                render_counter = 0;
            }
        }

        // =============================================================
        // ADC read every loop (~20Hz) with 8-sample rolling average
        // =============================================================
        adc_buf[0][adc_buf_idx] = adc_read(0);
        adc_buf[1][adc_buf_idx] = adc_read(1);
        adc_buf[2][adc_buf_idx] = adc_read(2);
        adc_buf_idx++;
        if (adc_buf_idx >= ADC_AVG_SIZE)
        {
            adc_buf_idx = 0;
            adc_buf_full = 1;
        }

        // Compute averages
        if (adc_buf_full)
        {
            uint16_t sum0 = 0, sum1 = 0, sum2 = 0;
            for (uint8_t i = 0; i < ADC_AVG_SIZE; i++)
            {
                sum0 += adc_buf[0][i];
                sum1 += adc_buf[1][i];
                sum2 += adc_buf[2][i];
            }
            adc_ch1 = sum0 >> ADC_AVG_SHIFT;
            adc_ch2 = sum1 >> ADC_AVG_SHIFT;
            adc_ch3 = sum2 >> ADC_AVG_SHIFT;
        }
        else
        {
            // Before buffer is full, use latest raw reading
            adc_ch1 = adc_buf[0][adc_buf_idx ? adc_buf_idx - 1 : 0];
            adc_ch2 = adc_buf[1][adc_buf_idx ? adc_buf_idx - 1 : 0];
            adc_ch3 = adc_buf[2][adc_buf_idx ? adc_buf_idx - 1 : 0];
        }

        // =============================================================
        // 50ms sub-tick (driven by Timer0 ISR)
        // =============================================================
        if (!subtick_flag) continue;
        subtick_flag = 0;

        // [R3] Buzzer timing now lives in the 1ms Timer0 ISR (beep/beep_double),
        // so the old coarse 50ms buzzer_countdown here is gone.

        // Alarm buzzer: 6 cycles of 500ms on / 250ms off (non-blocking)
        if (alarm_buzz_phase > 0)
        {
            alarm_buzz_tick++;
            // Odd phases = ON (500ms = 10 ticks), even phases = OFF (250ms = 5 ticks)
            uint8_t phase_len = (alarm_buzz_phase & 1) ? 10 : 5;
            if (alarm_buzz_tick >= phase_len)
            {
                alarm_buzz_tick = 0;
                alarm_buzz_phase++;
                if (alarm_buzz_phase > 12)
                {
                    // Done: 6 on/off cycles complete, ends OFF
                    alarm_buzz_phase = 0;
                    BUZZER = 0;
                }
                else
                {
                    BUZZER = (alarm_buzz_phase & 1) ? 1 : 0;
                }
            }
        }

        // Alarm flash toggle (~4Hz for line blanking)
        alarm_flash_counter++;
        if (alarm_flash_counter >= 3)  // ~150ms toggle = ~3.3Hz
        {
            alarm_flash_counter = 0;
            uint8_t any_alarm = alarm_active[0] || alarm_active[1] || alarm_active[2]
                               || system_config.active_stop_code;
            if (any_alarm)
                alarm_flash = !alarm_flash;
            else
                alarm_flash = 1;  // Always visible when no alarm
        }

        // =============================================================
        // 1-second tick (RTC 1Hz interrupt on INT0/RB0)
        // [C1] Drain ALL pending 1Hz ticks so a slow loop pass never loses a
        // second — bypass countdowns, runtime clock and relay pulse stay
        // accurate even if a beep/LCD/EEPROM op delayed this pass past 1s.
        // Snapshot+clear the ISR counter atomically, then run one full
        // 1-second cycle per pending tick.
        // =============================================================
        uint8_t rtc_ticks_pending;
        INTCONbits.GIE = 0;
        rtc_ticks_pending = rtc_tick_count;
        rtc_tick_count = 0;
        INTCONbits.GIE = 1;
        while (rtc_ticks_pending-- > 0)
        {
            flash_toggle = !flash_toggle;

            // Periodic full-screen refresh — display self-heal.
            //
            // The display link is ONE-WAY (no ACK). lcd_flush() only sends a
            // line when it differs from lcd_prev_buffer, so if the display ever
            // misses a frame — its UART RX is deaf during its blocking backlight
            // EEPROM write, and the relay energising can glitch its supply — the
            // main board still marks that line "sent" and NEVER re-sends it. The
            // screen then stays stale/blank indefinitely, which is exactly the
            // boot failure seen here (splash frozen, main screen never appears
            // until a menu changed the content).
            //
            // Re-asserting the whole screen every few seconds makes the display
            // recover from any lost frame within a bounded time. Cost is trivial
            // (~104 bytes every 5s on a 19200 link).
            if (++refresh_counter >= 5)
            {
                refresh_counter = 0;
                lcd_invalidate();  // next flush re-sends every line
            }

            if (sys_state == SYS_RUN)
            {
                if (system_config.clock_enabled && run_timer_secs > 0)
                {
                    run_timer_secs--;  // Countdown
                    if (run_timer_secs == 0)
                    {
                        // Runtime expired — alarm first, then relay
                        system_config.active_stop_code = 1;  // Triggers "End RunTime" flash
                        save_power_flags();
                        // eventlog_write(EVT_END_RUNTIME);  // LOG DISABLED
                        start_alarm_buzzer();

                        // Relay action after alarm starts
                        uint8_t mode = system_config.end_runtime_mode;
                        if (mode == 0)
                            trigger_relay_pulse(1);  // Latch
                        else
                            trigger_relay_pulse(0);  // Pulse

                        uart_println("Runtime expired - End RunTime");
                    }
                }
                else if (!system_config.clock_enabled)
                    run_timer_secs++;  // Count up
            }

            // Relay pulse countdown (starts when DIG_IN1 goes low)
            if (relay_state == 1)
            {
                char rbuf[50];
                sprintf(rbuf, "RLY: state=%u latch=%u ctr=%u pin=%u",
                        relay_state, relay_latch_mode, relay_counter, (uint8_t)RELAY1_PIN);
                uart_println(rbuf);
            }
            if (relay_counter > 0)
            {
                relay_counter--;
                if (relay_counter == 0)
                {
                    relay_close();
                    uart_println("Relay closed (pulse expired)");
                }
            }

            // Non-blocking power detect delay countdown
            if (pwr_detect_countdown > 0)
            {
                pwr_detect_countdown--;
                if (pwr_detect_countdown == 0)
                {
                    // Delay expired — normal stop, clear power fail flag
                    system_config.power_failure_flag = 0;
                    boot_pwr_fail = 0;
                    save_power_flags();
                    // eventlog_write(EVT_PWR_RESTORED);  // LOG DISABLED
                    uart_println("Power fail flag cleared (normal stop)");
                }
            }

            // =============================================================
            // Bypass timer processing (1-second tick, RUN only)
            // =============================================================
            if (sys_state == SYS_RUN)
            {
                uint16_t adc_arr[3] = {adc_ch1, adc_ch2, adc_ch3};

                for (uint8_t i = 0; i < 3; i++)
                {
                    if (!input_config[i].enable) continue;

                    uint8_t st = input_config[i].sensor_type;
                    uint8_t is_digital = (st == 3 || st == 5);
                    uint8_t high_fault = 0, low_fault = 0;

                    if (is_digital)
                    {
                        uint8_t pin = read_digital_input(i);
                        // Fault when pin matches fault_polarity
                        high_fault = (pin == input_config[i].fault_polarity);
                        // Digital: low direction not used for fault detection
                    }
                    else
                    {
                        int16_t val = adc_to_eng(adc_arr[i],
                                                  input_config[i].scale_4ma,
                                                  input_config[i].scale_20ma);
                        if (input_config[i].high_setpoint != 0 || input_config[i].primary_high_bypass > 0 || input_config[i].secondary_high_bypass > 0)
                            high_fault = (val >= input_config[i].high_setpoint);
                        if (input_config[i].low_setpoint != 0 || input_config[i].primary_low_bypass > 0 || input_config[i].secondary_low_bypass > 0)
                            low_fault = (val <= input_config[i].low_setpoint);
                    }

                    // Process high direction
                    uint8_t hi_result = process_bp(&bp_state[i].high, high_fault,
                                                    input_config[i].secondary_high_bypass);
                    if (hi_result)
                    {
                        uint8_t rly = (hi_result == 1) ? input_config[i].relay_pri_high_mode
                                                       : input_config[i].relay_sec_high_mode;
                        trigger_relay_pulse(rly == 0 ? 1 : 0);
                        system_config.active_stop_code = (uint8_t)(2 + i * 2);  // 2,4,6
                        save_power_flags();
                        // LOG DISABLED: bypass event logging removed
                        // uint8_t evt_hi = (uint8_t)((i + 1) * 10 + (hi_result == 1 ? 0 : 1));
                        // eventlog_write(evt_hi);
                        // Store bypass abbreviation for display
                        const char *lbl = (hi_result == 1) ? bp_lbl_phi[st] : bp_lbl_shi[st];
                        strncpy(alarm_code_text, lbl, 6);
                        alarm_code_text[6] = '\0';
                        alarm_input_idx = i;
                        // Cancel ALL other bypass timers — can only stop once
                        for (uint8_t j = 0; j < 3; j++)
                        {
                            if (j == i) { bp_state[j].low.phase = BP_INACTIVE; bp_state[j].low.countdown = 0; continue; }
                            bp_state[j].high.phase = BP_INACTIVE; bp_state[j].high.countdown = 0;
                            bp_state[j].low.phase = BP_INACTIVE; bp_state[j].low.countdown = 0;
                        }
                        start_alarm_buzzer();
                        { char abuf[40]; sprintf(abuf, "ALARM: In%u HIGH %s", i + 1, alarm_code_text); uart_println(abuf); }
                    }

                    // Process low direction (analog only)
                    if (!is_digital)
                    {
                        uint8_t lo_result = process_bp(&bp_state[i].low, low_fault,
                                                        input_config[i].secondary_low_bypass);
                        if (lo_result)
                        {
                            uint8_t rly = (lo_result == 1) ? input_config[i].relay_pri_low_mode
                                                           : input_config[i].relay_sec_low_mode;
                            trigger_relay_pulse(rly == 0 ? 1 : 0);
                            system_config.active_stop_code = (uint8_t)(3 + i * 2);  // 3,5,7
                            save_power_flags();
                            // LOG DISABLED: bypass event logging removed
                            // uint8_t evt_lo = (uint8_t)((i + 1) * 10 + (lo_result == 1 ? 2 : 3));
                            // eventlog_write(evt_lo);
                            // Store bypass abbreviation for display
                            const char *lbl = (lo_result == 1) ? bp_lbl_plo[st] : bp_lbl_slo[st];
                            strncpy(alarm_code_text, lbl, 6);
                            alarm_code_text[6] = '\0';
                            alarm_input_idx = i;
                            // Cancel ALL other bypass timers — can only stop once
                            for (uint8_t j = 0; j < 3; j++)
                            {
                                if (j == i) { bp_state[j].high.phase = BP_INACTIVE; bp_state[j].high.countdown = 0; continue; }
                                bp_state[j].high.phase = BP_INACTIVE; bp_state[j].high.countdown = 0;
                                bp_state[j].low.phase = BP_INACTIVE; bp_state[j].low.countdown = 0;
                            }
                            start_alarm_buzzer();
                            { char abuf[40]; sprintf(abuf, "ALARM: In%u LOW %s", i + 1, alarm_code_text); uart_println(abuf); }
                        }
                    }

                    // Update alarm flag for this input
                    alarm_active[i] = (bp_state[i].high.phase == BP_ALARM ||
                                       bp_state[i].low.phase == BP_ALARM);
                }
            }
        }

        // =============================================================
        // Deferred EEPROM saves (after RTC tick processing completes)
        // This ensures bypass timer processing is never blocked by EEPROM writes
        // =============================================================
        for (uint8_t i = 0; i < 3; i++)
        {
            if (input_config_dirty[i])
            {
                save_input_config(i);
                input_config_dirty[i] = 0;
            }
        }
        if (system_config_dirty)
        {
            save_system_config();
            system_config_dirty = 0;
        }

        // =============================================================
        // Render main screen (~4Hz when on main screen)
        // =============================================================
        render_counter++;
        if (render_counter >= 5 && current_menu == 255)
        {
            render_counter = 0;
            render_main_screen(adc_ch1, adc_ch2, adc_ch3);
        }

        // =============================================================
        // Handle encoder rotation
        // =============================================================
        // [C6] Read the 16-bit encoder_count ONCE, atomically. On this 8-bit
        // core a 16-bit read is two instructions; an ISR update landing between
        // them tears the value and injects a spurious large delta (menu jumps).
        // Snapshot under GIE so all uses below see one consistent value.
        int16_t enc_now;
        INTCONbits.GIE = 0;
        enc_now = encoder_count;
        INTCONbits.GIE = 1;
        if (enc_now != last_encoder)
        {
            int16_t delta = enc_now - last_encoder;
            if (current_menu != 255)
                beep(1);  // Tick sound (only in menus, not on main screen)
            last_encoder = enc_now;
            encoder_activity_timer = 10;

            if (menu.in_edit_mode)
            {
                menu.blink_state = 1;
            }

            // Handle rotation - menu_handle_encoder handles all edit modes
            menu_handle_encoder(delta);

            // Redraw menu after rotation
            if (current_menu == 0) menu_draw_options();
            else if (current_menu == 1) menu_draw_input();
            else if (current_menu == 2) menu_draw_setup();
            else if (current_menu == 3) menu_draw_clock();
            else if (current_menu == 4) menu_draw_utility();
            else if (current_menu == 5) menu_draw_main_menu();
            else if (current_menu == 6) menu_draw_digital();
            else if (current_menu == 7) menu_draw_log_view();

            lcd_flush();
        }

        // =============================================================
        // Handle button events
        // =============================================================
        if (button_pressed)
        {
            button_pressed = 0;
            uint8_t evt = button_event;
            button_event = 0;

            if (current_menu == 255)
            {
                // Main screen
                if (evt == 1)  // Short press
                {
                    extern system_config_t system_config;
                    extern void save_power_flags(void);

                    if (boot_pwr_fail || system_config.active_stop_code || ext_stop_flag || wdt_reset_flag)
                    {
                        // First press: clear fault, close relay if latched, don't enter menu
                        boot_pwr_fail = 0;
                        system_config.power_failure_flag = 0;
                        system_config.active_stop_code = 0;
                        wdt_reset_flag = 0;  // [4e-2] acknowledge watchdog-reset latch
                        if (relay_state == 1)
                            relay_close();
                        clear_bp_timers();  // Clear all bypass alarms
                        ext_stop_flag = 0;
                        save_power_flags();
                        uart_println("Faults cleared (button)");
                        // Distinctive double-beep for fault acknowledgment
                        beep_double(50, 80);  // [R3] non-blocking (was ~180ms stall)
                        // Immediate screen update to clear fault message
                        render_main_screen(adc_ch1, adc_ch2, adc_ch3);
                        render_counter = 0;
                    }
                    else
                    {
                        // No fault: enter menu
                        menu_init();
                        menu_draw_options();
                        lcd_flush();
                    }
                }
            }
            else
            {
                // In menu - pass to handler
                menu_handle_button(evt);

                // Redraw after button
                if (current_menu == 0) menu_draw_options();
                else if (current_menu == 1) menu_draw_input();
                else if (current_menu == 2) menu_draw_setup();
                else if (current_menu == 3) menu_draw_clock();
                else if (current_menu == 4) menu_draw_utility();
                else if (current_menu == 5) menu_draw_main_menu();
                else if (current_menu == 6) menu_draw_digital();
            else if (current_menu == 7) menu_draw_log_view();

                lcd_flush();
            }
        }

        // =============================================================
        // Handle return to main screen
        // =============================================================
        static uint8_t last_menu_state = 0;
        if (current_menu == 255 && last_menu_state != 255)
        {
            // Returning to main screen — render will happen automatically
            render_counter = 5;  // Force immediate render
        }
        last_menu_state = current_menu;

        // =============================================================
        // Handle blink in edit mode
        // =============================================================
        if (encoder_activity_timer > 0)
        {
            encoder_activity_timer--;
        }

        blink_timer++;
        uint8_t blink_rate = menu.in_edit_mode ? 3 : 10; // ~4Hz in edit mode, ~1Hz otherwise
        if (blink_timer >= blink_rate)
        {
            blink_timer = 0;
            if (menu.in_edit_mode && encoder_activity_timer == 0)
            {
                menu.blink_state = !menu.blink_state;

                switch (current_menu)
                {
                case 0:
                    menu_draw_options();
                    break;
                case 1:
                    menu_draw_input();
                    break;
                case 2:
                    menu_draw_setup();
                    break;
                case 3:
                    menu_draw_clock();
                    break;
                case 4:
                    if (menu.current_line == 3 || menu.current_line == 4 || menu.current_line == 6)
                        menu_update_time_value();
                    else
                        menu_draw_utility();
                    break;
                case 5:
                    menu_draw_main_menu();
                    break;
                case 6:
                    menu_draw_digital();
                    break;
                case 7:
                    menu_draw_log_view();
                    break;
                }

                lcd_flush();
            }
            else
            {
                menu.blink_state = 1;
            }
        }

        // =============================================================
        // Handle menu timeout
        // =============================================================
        extern volatile uint8_t menu_timeout_flag;
        extern volatile uint16_t menu_timeout_timer;

        if (current_menu <= 6 && menu_timeout_flag == 0)
        {
            beep_double(100, 50);  // [R3] non-blocking (was ~250ms stall)

            current_menu = 255;
            menu.in_edit_mode = 0;
            menu.current_line = 0;
            menu.top_line = 0;
            render_counter = 5;  // Force immediate render

            menu_timeout_flag = 1;
            INTCONbits.GIE = 0;      // [C6] atomic 16-bit write vs Timer0 ISR
            menu_timeout_timer = 0;
            INTCONbits.GIE = 1;
        }

        // LED flash toggle (2Hz = 250ms half-period = 5 × 50ms ticks)
        led_flash_counter++;
        if (led_flash_counter >= 5)
        {
            led_flash_counter = 0;
            led_flash_state = !led_flash_state;
        }

        // Update LEDs via display board
        {
            uint8_t led_mask = 0;

            // Power LED: solid on, flash 2Hz during power fail display
            if (boot_pwr_fail)
                led_mask |= (led_flash_state ? 0x01 : 0x00);
            else
                led_mask |= 0x01;  // Solid on

            // Signal LED: on when run signal (DIG_IN1) is high, off when low
            if (DIG_IN1_PORT)
                led_mask |= 0x02;

            // Fault LED (RA5): flash 2Hz when relay de-energized, off when energized
            if (relay_state == 1)
                led_mask |= (led_flash_state ? 0x04 : 0x00);  // Flash

            disp_set_leds(led_mask);
        }

        __delay_us(50);
    }
}
