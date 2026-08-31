/**
 * IRRISYS - Full System with Buffered LCD
 * PIC18F26K22 @ 32MHz
 *
 * Version: Ver 3 Rev 47
 *   - Ver 3 = Product/firmware version
 *   - Rev 47 = Incremented on every change; reset to 0 prior to release
 *
 * Button behavior:
 *   - Press -> immediate short beep (50ms)
 *   - Release before 1000ms -> short press event
 *   - Hold >= 1000ms -> long beep (300ms), long press event, non-blocking
 */

#define FW_VERSION  3     // Product/firmware version
#define FW_REVISION 47     // Incremented every change; reset to 0 before release

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
#include "../include/eeprom.h"
#include "../include/i2c.h"
#include "../include/rtc.h"
#include "../include/pca9535.h"
#include "../include/lcd.h"
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

    // FVR at 4.096V - the ADC reference.
    //
    // With the 180R burden (Ver B Rev 2) a 20mA loop develops 3.60V, which
    // clears the 4.096V FVR with room to spare - full scale is 22.8mA, so
    // NAMUR over-range detection stays possible. 180R is chosen for exactly
    // this: the largest burden that keeps 20mA under the FVR is ~204R, so
    // 180R clears it with margin while a 220R burden (4.40V) would not.
    //
    // A fixed reference also decouples every reading from the 5V rail, so
    // relay pull-in, buzzer and backlight load steps cannot shift readings -
    // which averaging would NOT have caught, since a rail shift biases every
    // sample the same way.
    //
    // Needs VDD comfortably above 4.096V for the reference to hold; the
    // bench rail measures 5.041V.
    //
    // VREFCON0: bit7=FVREN, bit6=FVRST(RO), bit5:4=FVRS<1:0>, bits3:0=unused
    // FVRS: 00=reserved, 01=1.024V, 10=2.048V, 11=4.096V
    VREFCON0 = 0b10110000;  // FVREN=1, FVRS=11 (4.096V)
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
static void check_factory_reset_gesture(void);  // defined below main()'s helpers

// ---------------------------------------------------------------------------
// Debug heartbeat  [TEMPORARY - brown-out diagnosis, 2026-08-30]
//
// A constant stream on the debug UART so a failure can be placed in time:
// when the line stops, that is when the PIC stopped. Runs from the first
// moment the UART is up - including through the blocking boot delays, which
// would otherwise be several silent seconds.
//
// Carries VDD so the rail can be correlated with the moment it dies, the
// relay pin so it is visible whether the coil is still held, and the raw ADC
// counts so a collapsing reference shows up before scaling hides it.
//
//     #00042 V=5041 R=1 A=0838,0102,0095
//
// Set DEBUG_STREAM to 0 to silence it. ~34 chars at 4Hz is about 15% of
// 9600 baud, so it does not crowd the ordinary messages.
// ---------------------------------------------------------------------------
static uint16_t read_vdd_mv(void);   // defined with the ADC driver below

#define DEBUG_STREAM     1
#define DEBUG_STREAM_MS  250

#if DEBUG_STREAM
static uint16_t dbg_seq = 0;
static uint16_t dbg_adc[3] = {0, 0, 0};   // snapshot of the main loop locals
static uint8_t  dbg_ready = 0;            // set once the UART is initialised

static void debug_heartbeat(void)
{
    char b[48];
    if (!dbg_ready) return;
    sprintf(b, "#%05u V=%u R=%u A=%04u,%04u,%04u",
            dbg_seq++, read_vdd_mv(), (unsigned)(RELAY1_PIN ? 1 : 0),
            dbg_adc[0], dbg_adc[1], dbg_adc[2]);
    uart_println(b);
}
#endif

static void delay_ms_wdt(uint16_t ms)
{
#if DEBUG_STREAM
    static uint16_t since = 0;
#endif
    while (ms--)
    {
        CLRWDT();
        __delay_ms(1);
#if DEBUG_STREAM
        // Keep the stream alive through the boot waits - the 1s display
        // wait and the 5s splash hold are otherwise dead air, and a failure
        // in that window would be invisible.
        if (++since >= DEBUG_STREAM_MS)
        {
            since = 0;
            debug_heartbeat();
        }
#endif
    }
}

// Write `s` horizontally centred on a 20-column row, space-padded.
// Centring is computed at run time because the revision number changes
// width (Rev 9 vs Rev 17), so a hard-coded indent drifts off-centre.
static void lcd_print_centered(uint8_t row, const char *s)
{
    char line[21];
    uint8_t len = (uint8_t)strlen(s);

    if (len > 20) len = 20;
    memset(line, ' ', 20);
    line[20] = '\0';
    memcpy(line + (20 - len) / 2, s, len);

    lcd_set_cursor(row, 0);
    lcd_print(line);
}

// Draw the splash into the LCD buffer and send it.
// Layout is SPECIFIED - see CLAUDE.md "Splash Screen". Shown at boot and
// again from UTILITY > About.
static void draw_splash(void)
{
    char sbuf[24];

    lcd_clear();
    lcd_set_cursor(0, 0);
    lcd_print("====================");
    lcd_print_centered(1, "Irrisys PumpGuard");
    sprintf(sbuf, "F/W Ver %d, Rev %d", FW_VERSION, FW_REVISION);
    lcd_print_centered(2, sbuf);
    lcd_set_cursor(3, 0);
    lcd_print("====================");
    lcd_flush();
}

// ---------------------------------------------------------------------------
// About screen (UTILITY > About) - the splash, held for a few seconds.
//
// Deliberately NOT a busy-wait. This menu is reachable while the pump is
// running, and blocking here would stall the 1-second tick that drives the
// bypass timers - delaying a trip by the length of the hold. The main loop
// counts it down instead and restores the menu when it expires.
// ---------------------------------------------------------------------------
#define ABOUT_HOLD_SECS 5
static uint8_t about_hold_secs = 0;

void show_about_splash(void)
{
    draw_splash();
    about_hold_secs = ABOUT_HOLD_SECS;
}

static uint8_t about_splash_active(void)
{
    return about_hold_secs != 0;
}

// Put the UTILITY menu back on screen.
static void about_splash_dismiss(void)
{
    about_hold_secs = 0;
    menu_draw_utility();
    lcd_flush();
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

// Reload the runtime clock from config.
//
// run_timer_secs was previously loaded ONLY on the STOP->RUN edge, so a
// Run Time set while the pump was already running had no effect at all -
// the value stayed 0, which satisfies neither the countdown test
// (run_timer_secs > 0) nor the count-up test (!clock_enabled), leaving the
// display frozen at 00:00:00 for the rest of the run.
//
// Called from the menu whenever Run Time or the clock enable is confirmed.
// No effect while stopped - the STOP->RUN edge loads it as before.
void reload_run_timer(void)
{
    if (sys_state != SYS_RUN)
        return;

    if (system_config.clock_enabled)
    {
        run_timer_secs = (uint32_t)system_config.runtime_hours * 3600
                       + (uint32_t)system_config.runtime_minutes * 60;
    }
    else
    {
        run_timer_secs = 0;  // count-up mode restarts from zero
    }
}
static uint8_t flash_toggle = 0;
// tick_counter removed — 1-second tick now driven by RTC 1Hz interrupt (rtc_tick_count)
static uint8_t render_counter = 0;     // Display update throttle
static uint8_t refresh_counter = 0;    // Periodic full-screen re-assert (display self-heal)
static uint16_t pwr_detect_countdown = 0;  // Non-blocking power detect delay (seconds)

static uint8_t boot_pwr_fail = 0;             // Set once at boot if power_failure_flag was set in EEPROM
static uint8_t ext_stop_flag = 0;             // 1=stopped by external run input going low
static uint8_t wdt_reset_flag = 0;            // [4e-2] 1=booted from a watchdog reset (safe-latch until acknowledged)
static uint8_t bor_reset_flag = 0;            // 1=browned out while powered (safe-latch until acknowledged)
static uint8_t rcon_at_boot  = 0;             // raw RCON snapshot, for the debug UART
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
// Loop-current endpoints in ADC counts, derived from the hardware rather
// than hard-coded, so a burden or reference change is a one-line edit.
//
//   counts = 1023 * (mA * BURDEN_OHMS) / ADC_VREF_MV
//
// Ver B Rev 2: 180R burden, internal 4.096V FVR reference.
//   4mA  -> 0.72V -> 179 counts
//   20mA -> 3.60V -> 894 counts   (44.7 counts/mA)
//   full scale -> 22.8mA, leaving NAMUR over-range headroom
//
// CALIBRATED 2026-08-22 against a precision loop tester: at 20.00mA the
// display read 359 psi of an expected 362, which puts the true count at
// 894-895 rather than the nominal 899. That makes the effective reference
// ~4119mV, +0.6% on the 4096mV nominal - inside FVR part tolerance, so it
// is calibration rather than a fault. ADC_VREF_MV carries the correction.
//
// The FVR is a specified reference and, unlike VDD, does not move with
// relay/buzzer/backlight load steps on the 5V rail. Averaging would not
// have saved us from that: a rail shift biases every sample the same way,
// so it passes straight through the rolling average.
//
// ADC_VREF_MV remains the single calibration point for all three channels.
// The FVR has its own part-to-part tolerance, so if a loop calibrator shows
// a consistent scale error at 20mA, trim this rather than the endpoints.
//
// WARNING: these constants are specific to the 180R burden. On a 100R
// board (Ver B Rev 0/1) or a 220R board every analog reading is wrong.
#define ADC_VREF_MV   4119   // FVR effective mV - CALIBRATED, not nominal 4096
#define BURDEN_OHMS   180    // 4-20mA sense resistor (R8/R4/R5)
// Rounded, not truncated: plain integer division loses up to a full count
// at the 20mA endpoint, which is ~0.5 psi on a 362 psi range.
#define ADC_COUNTS_AT_MA(ma)                                     \
    ((uint16_t)((((uint32_t)1023 * (ma) * BURDEN_OHMS)           \
                 + (ADC_VREF_MV / 2)) / ADC_VREF_MV))
// ---------------------------------------------------------------------------
// Supply monitoring.
//
// The 4.096V FVR needs VDD >= ~4.75V to regulate. Below that it sags and
// EVERY analog reading is wrong - silently, with no flag. On a pump
// protection device that is the failure that matters: the display works,
// the menus work, and the pressure is a lie.
//
// Hardware BOR cannot cover this. The part tops out at 2.85V, so the whole
// band from ~4.75V down to 2.85V runs happily on a bad reference.
//
// So measure VDD directly: convert the FVR *using VDD as the reference*.
//     count = FVR / VDD * 1023   ->   VDD = ADC_VREF_MV * 1023 / count
// As VDD falls the count RISES toward 1023, and the reading stays
// meaningful right into dropout (where the FVR tracks just under VDD).
// 4750mV is the FVR's own requirement, not an arbitrary margin: below it the
// 4.096V reference stops regulating and the readings are wrong. Bench test
// 2026-08-30 showed the original 4600 was too low to be useful - there was a
// 150mV band where the pressure was already invalid and nothing complained.
// Clears at 4850, leaving ~190mV to the 5.041V nominal rail.
//
// The trip path was proven on hardware 2026-08-31 by temporarily raising
// this to 5200 (Rev 46): trip, latched relay, alarm, acknowledge and
// re-trip all confirmed. The threshold VALUE rests on read_vdd_mv()
// agreeing with a bench meter to within a few mV, which it does.
//
// The real 4750 crossing cannot be reached on this board: the 5V regulator
// holds regulation until the 24V is nearly gone, and DIG_IN1 drops out well
// before that, so the box is never in RUN when VDD genuinely sags. What the
// guard actually covers is 5V-side failure - a dying regulator or an
// overloaded rail - not a failing 24V supply, which stops the pump anyway.
#define VDD_MIN_MV  4750     // below this the FVR is not trustworthy
#define VDD_HYST_MV  100     // must recover this far above before clearing

#define ADC_4MA   ADC_COUNTS_AT_MA(4)
#define ADC_20MA  ADC_COUNTS_AT_MA(20)

// [guard] The 20mA endpoint must land inside the 10-bit ADC range. If the
// reference is ever set too low for the burden, the top of every sensor
// range would silently clip to full-scale - a safety-critical failure that
// reads as a perfectly healthy signal. Fail the build instead.
typedef char assert_20ma_within_adc_range[(ADC_20MA <= 1023) ? 1 : -1];
typedef char assert_4ma_below_20ma[(ADC_4MA < ADC_20MA) ? 1 : -1];

// ---------------------------------------------------------------------------
// Loop integrity - NAMUR NE43 out-of-range detection
// ---------------------------------------------------------------------------
// A healthy 4-20mA loop never sits outside 3.8-20.5mA. Outside NE43 limits
// the reading is not a measurement at all, it is a wiring or sensor failure:
//
//   <= 3.6mA  open circuit  - broken wire, disconnected or dead transmitter
//   >= 21.0mA short circuit - field wiring shorted past the transmitter, or
//                             a transmitter failed hard over
//
// Preserving headroom for these is why the burden is 180R: full scale is
// 22.8mA, so the over-range trip at 21.0mA is inside the measurable range.
// A 100R/2.048V or 250R/VDD front end could not see 21mA at all.
//
// Microamp form so the NE43 fractional limits stay exact in integer math.
// Peak intermediate is 21000 * 1023 * 180 / 1000 = 3.87e6, well inside u32.
#define ADC_COUNTS_AT_UA(ua)                                          \
    ((uint16_t)((((uint32_t)(ua) * 1023 / 1000 * BURDEN_OHMS)         \
                 + (ADC_VREF_MV / 2)) / ADC_VREF_MV))
#define ADC_UNDER_RANGE  ADC_COUNTS_AT_UA(3600)   // 3.6mA  -> open
#define ADC_OVER_RANGE   ADC_COUNTS_AT_UA(21000)  // 21.0mA -> short

// [guard] The over-range trip has to be inside what the ADC can actually
// read, or a short simply saturates at 1023 and is never detected.
typedef char assert_over_range_measurable[(ADC_OVER_RANGE < 1023) ? 1 : -1];
typedef char assert_under_range_below_4ma[(ADC_UNDER_RANGE < ADC_4MA) ? 1 : -1];

// Per-input loop state: 0 = OK, 1 = open (under-range), 2 = short (over-range)
#define SENSOR_OK     0
#define SENSOR_OPEN   1
#define SENSOR_SHORT  2
static uint8_t sensor_fault[3] = {0, 0, 0};

// Supply monitor: 1 = VDD too low for the FVR, so analog readings are
// not to be trusted. Latches an alarm in RUN, same as a broken loop.
static uint8_t vdd_low = 0;
static uint8_t vdd_alarm = 0;
static uint16_t vdd_mv = 0;      // last measurement, for the debug UART
static uint8_t sensor_alarm[3] = {0, 0, 0};  // latched: this fault stopped the pump

// A 2-wire transmitter draws no loop current until it has powered up, which
// is indistinguishable from a broken wire. Suppress detection briefly after
// boot and after each RUN so a slow sensor cannot trip the pump at start.
#define SENSOR_SETTLE_SECS 5
static uint8_t sensor_settle_countdown = SENSOR_SETTLE_SECS;

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

// Digital state text, shown in place of a numeric value [sensor_type 0-5].
// Only the switch types (3, 5) are used. The old "High"/"Low" read as pin
// levels but were actually normalised health - with Fault Polarity set to
// High the display was the inverse of the electrical level, which is
// exactly backwards when tracing wiring. Naming the sensed condition
// removes the ambiguity: these say what the switch means, not what the
// pin is doing.
static const char *dig_lbl_ok[6]    = {"", "", "", "Flow",    "", "Aux"};
static const char *dig_lbl_fault[6] = {"", "", "", "No Flow", "", "No Aux"};

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
        // The state word reports the STATE; the right-hand message reports the
        // REASON. Keeping them independent is what lets a reset cause stay
        // visible after the farmer restarts the pump - he walked in asking why
        // it stopped, and the answer should not vanish the moment he restarts.
        const char *state = (sys_state == SYS_RUN) ? "Running" : "Standby";
        const char *msg = "";

        // Reset cause: information only, never control. Shown in RUN and STOP
        // alike until acknowledged with a button press.
        const char *reset_msg = bor_reset_flag ? "BrownOut"
                              : wdt_reset_flag ? "Int Error"
                                               : "";

        if (vdd_alarm)
            msg = "Low Volts";                // live: supply too low RIGHT NOW
        else if (reset_msg[0])
            msg = reset_msg;                  // why we restarted - more specific
                                              // than "Pwr Fail", so it wins
        else if (boot_pwr_fail)
            msg = "Pwr Fail";
        else if (system_config.active_stop_code == 1)
            msg = "End RunTime";
        else if (sys_state != SYS_RUN && ext_stop_flag)
            msg = "Ext Stop";

        // Show countdown HH:MM:SS when running with clock enabled and runtime > 0
        // (but not after runtime expired — show "STOP End RunTime" instead)
        if (sys_state == SYS_RUN && system_config.clock_enabled &&
            (system_config.runtime_hours > 0 || system_config.runtime_minutes > 0) &&
            !msg[0])
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
            // Say so explicitly - a blank line reads as a dead display.
            // Left-justified, where an in-use line carries the sensor name.
            memcpy(line, "Not Used            ", 20);
            line[20] = '\0';
            lcd_print(line);
            continue;
        }

        uint8_t st = input_config[i].sensor_type;
        uint8_t is_digital = (st == 3 || st == 5);

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

        // Flash the line during an alarm, and while a bypass timer is
        // counting. A countdown only runs while the value is in fault - it is
        // abandoned the moment the value comes good - so the flash stops on
        // its own once the reading is OK.
        if ((alarm_active[i] || display_timer > 0) && !alarm_flash)
        {
            lcd_print("                    ");
            continue;
        }

        // Loop out of range: the reading is meaningless, so replace the
        // value with the reason rather than showing a plausible number.
        // Name stays at the left; "err open"/"err shrt" is right-justified.
        if (sensor_fault[i] != SENSOR_OK)
        {
            memset(line, ' ', 20);
            line[20] = '\0';
            uint8_t nlen = (uint8_t)strlen(input_config[i].name);
            if (nlen > 11) nlen = 11;
            memcpy(line, input_config[i].name, nlen);
            memcpy(line + 12,
                   (sensor_fault[i] == SENSOR_OPEN) ? "err open" : "err shrt", 8);
            lcd_print(line);
            continue;
        }

        // Build value and units separately
        char vbuf[10];  // Numeric: 5 chars. Digital state text: up to 8.
        char ubuf[4];   // Units string (max 3 chars)

        ubuf[0] = '\0';

        if (is_digital)
        {
            // The polarity setting names the input level at which the
            // condition is PRESENT, so "Flow: High" reads the way the menu
            // shows it - flow is indicated by a high input.
            uint8_t present =
                (read_digital_input(i) == input_config[i].fault_polarity);
            sprintf(vbuf, "%s", present ? dig_lbl_ok[st] : dig_lbl_fault[st]);
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

        // Build the line based on whether bypass is active
        memset(line, ' ', 20);
        line[20] = '\0';

        uint8_t vlen = (uint8_t)strlen(vbuf);

        // Switch types have no units string, so their state text can use
        // the columns a numeric value would have left for units.
        const uint8_t vmax = is_digital ? 8 : 5;

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
            if (vlen > vmax) vlen = vmax;
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
            if (vlen > vmax) vlen = vmax;
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

    // Configure ADC: right justified, Fosc/32, Vref+=FVR (4.096V), Vref-=VSS
    ADCON1 = 0b00001000;  // PVCFG<3:2>=10 (FVR), NVCFG<1:0>=00 (VSS)
    ADCON2 = 0b10100010;  // Right justified, 8 TAD acq time, Fosc/32

    __delay_us(10);  // Acquisition time

    ADCON0bits.GO = 1;  // Start conversion
    while (ADCON0bits.GO)
        ;  // Wait for completion

    return (uint16_t)((ADRESH << 8) | ADRESL);
}

// Measure VDD by converting the FVR against VDD itself.
//
// CHS<4:0> = 11111 selects the FVR buffer as the ADC input; PVCFG = 00
// selects VDD as the positive reference. Returns millivolts, or 0 if the
// conversion came back at zero (which would mean the FVR is not running).
//
// Leaves ADCON1 as it found it: every other caller sets the channel and
// reference itself on entry, but restoring keeps this side-effect free.
static uint16_t read_vdd_mv(void)
{
    uint8_t saved_adcon1 = ADCON1;

    ADCON0 = (uint8_t)((31 << 2) | 0x01);  // CHS = 11111 (FVR), ADC ON
    ADCON1 = 0b00000000;                   // PVCFG = 00 (VDD), NVCFG = 00 (VSS)
    ADCON2 = 0b10100010;                   // right justified, 8 TAD, Fosc/32

    __delay_us(25);   // FVR settling into the sample cap is slower than a
                      // plain analog channel; be generous, this runs at 1Hz

    ADCON0bits.GO = 1;
    while (ADCON0bits.GO)
        ;

    {
        uint16_t count = (uint16_t)((ADRESH << 8) | ADRESL);
        ADCON1 = saved_adcon1;
        if (count == 0) return 0;
        return (uint16_t)(((uint32_t)ADC_VREF_MV * 1023u) / count);
    }
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
// Returns: 0=nothing, 1=alarm from primary, 2=alarm from secondary,
//          3=secondary countdown just started (excursion, no alarm)
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
                return 3;  // excursion begun - not a trip
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
    // Switch types have no high fault. Park that direction explicitly:
    // left in BP_PRIMARY it would hold a countdown that never expires, and
    // the main screen would show and flash it indefinitely.
    uint8_t st_i = input_config[i].sensor_type;
    if (st_i == 3 || st_i == 5)
    {
        bp_state[i].high.phase = BP_INACTIVE;
        bp_state[i].high.countdown = 0;
    }
    // High direction: always monitor if input is enabled
    // Primary bypass > 0: start in BP_PRIMARY with countdown
    // Primary bypass = 0: start in BP_NORMAL (immediate monitoring)
    else if (input_config[i].primary_high_bypass > 0)
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
        sensor_alarm[i] = 0;
    }
    alarm_buzz_phase = 0;
    alarm_buzz_tick = 0;
    alarm_code_text[0] = '\0';
    alarm_input_idx = 0;
}

// Resume bypass monitoring after a fault is cleared mid-run.
//
// clear_bp_timers() parks every direction in BP_INACTIVE, which
// process_bp() never leaves - so without this, acknowledging a trip while
// DIG_IN1 is still high (sys_state stays SYS_RUN, so no STOP->RUN edge ever
// re-runs init_bp_timers) killed all bypass protection for the rest of the run.
//
// The primary windows are a start-up grace that runs once per pump start, so
// they are deliberately NOT restarted here. Every monitored direction resumes
// at BP_NORMAL, where a fault arms its secondary timer - and re-arms it on
// every subsequent excursion.
static void resume_bp_timers(void)
{
    for (uint8_t i = 0; i < 3; i++)
    {
        uint8_t st_i = input_config[i].sensor_type;
        uint8_t sw = (st_i == 3 || st_i == 5);
        uint8_t phase = input_config[i].enable ? BP_NORMAL : BP_INACTIVE;
        // A switch has no high direction to resume
        bp_state[i].high.phase = sw ? BP_INACTIVE : phase;
        bp_state[i].high.countdown = 0;
        bp_state[i].low.phase = phase;
        bp_state[i].low.countdown = 0;
        alarm_active[i] = 0;
        sensor_alarm[i] = 0;
    }

    // Re-arm the settling window too: acknowledging a fault should not
    // instantly re-trip on a sensor that is still coming back up.
    sensor_settle_countdown = SENSOR_SETTLE_SECS;
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

// ============================================================================
// EEPROM config dump (debug UART, 9600 on RB6)
//
// Prints every persisted field at boot so a power-cycle can be verified field
// by field, not just by eyeballing one value on the LCD. Also verifies the
// stored checksum against a freshly computed one — a MISMATCH means the config
// was found corrupt and factory defaults were loaded.
//
// Costs ~1.3s of boot time at 9600 baud. Set to 0 to disable.
// ============================================================================
#define DEBUG_EEPROM_DUMP 1

#if DEBUG_EEPROM_DUMP
extern uint16_t calculate_config_checksum(void);
extern uint16_t eeprom_read_word(uint16_t address);

static void dump_eeprom_config(void)
{
    char b[64];

    uart_println("");
    uart_println("===== EEPROM CONFIG DUMP =====");

    uart_println("[SYSTEM]");
    sprintf(b, "  clock_en=%u  menu_timeout=%u  end_rt_mode=%u",
            system_config.clock_enabled, system_config.menu_timeout,
            system_config.end_runtime_mode);
    uart_println(b); CLRWDT();
    sprintf(b, "  runtime=%u:%02u  relay_pulse=%us",
            system_config.runtime_hours, system_config.runtime_minutes,
            system_config.relay_pulse_time);
    uart_println(b); CLRWDT();
    sprintf(b, "  contrast=%u  brightness=%u  pwr_fail_delay=%us",
            system_config.contrast, system_config.brightness,
            system_config.power_fail_delay);
    uart_println(b); CLRWDT();
    sprintf(b, "  pwr_fail_flag=%u  active_stop_code=%u",
            system_config.power_failure_flag, system_config.active_stop_code);
    uart_println(b); CLRWDT();
    sprintf(b, "  DIG2 en/pol/rly=%u/%u/%u  DIG3=%u/%u/%u  DIG4=%u/%u/%u",
            system_config.dig2_enable, system_config.dig2_fault_polarity, system_config.dig2_relay_mode,
            system_config.dig3_enable, system_config.dig3_fault_polarity, system_config.dig3_relay_mode,
            system_config.dig4_enable, system_config.dig4_fault_polarity, system_config.dig4_relay_mode);
    uart_println(b); CLRWDT();

    for (uint8_t i = 0; i < 3; i++)
    {
        sprintf(b, "[INPUT %u] name='%s' units='%s'",
                i + 1, input_config[i].name, input_config[i].units);
        uart_println(b); CLRWDT();
        sprintf(b, "  enable=%u  sensor=%u  fault_pol=%u",
                input_config[i].enable, input_config[i].sensor_type,
                input_config[i].fault_polarity);
        uart_println(b); CLRWDT();
        sprintf(b, "  scale 4mA=%d  20mA=%d",
                input_config[i].scale_4ma, input_config[i].scale_20ma);
        uart_println(b); CLRWDT();
        sprintf(b, "  setpoint HI=%d  LO=%d",
                input_config[i].high_setpoint, input_config[i].low_setpoint);
        uart_println(b); CLRWDT();
        sprintf(b, "  bypass PriHi=%u SecHi=%u PriLo=%u SecLo=%u",
                input_config[i].primary_high_bypass, input_config[i].secondary_high_bypass,
                input_config[i].primary_low_bypass, input_config[i].secondary_low_bypass);
        uart_println(b); CLRWDT();
        sprintf(b, "  relay PriHi=%u SecHi=%u PriLo=%u SecLo=%u  (0=Latch 1=Pulse)",
                input_config[i].relay_pri_high_mode, input_config[i].relay_sec_high_mode,
                input_config[i].relay_pri_low_mode, input_config[i].relay_sec_low_mode);
        uart_println(b); CLRWDT();
    }

    // Checksum health: stored (in EEPROM) vs freshly computed over the EEPROM
    // image. MISMATCH => config was corrupt at boot and factory defaults loaded.
    uint16_t stored = eeprom_read_word(EEPROM_CHECKSUM_ADDR);
    uint16_t calc   = calculate_config_checksum();
    sprintf(b, "  checksum stored=0x%04X calc=0x%04X  %s",
            stored, calc, (stored == calc) ? "MATCH" : "*** MISMATCH ***");
    uart_println(b); CLRWDT();
    uart_println("==============================");
    uart_println("");
}
#endif

// Hold the button this long at power-up to wipe to factory defaults.
// Long enough that nobody does it by accident while handling the unit.
#define FACTORY_HOLD_SECS 5

// Second hold, after the consequence is spelled out. Two deliberate
// stages rather than one long one: the first proves intent to do
// SOMETHING, the second proves intent to do THIS.
#define FACTORY_CONFIRM_SECS 3

static void check_factory_reset_gesture(void)
{
    // ENC_SW is active low with a pull-up: 0 means held.
    if (ENC_SW != 0) return;

    // Debounce the initial read - a floating pin at power-up would
    // otherwise start a countdown nobody asked for.
    delay_ms_wdt(50);
    if (ENC_SW != 0) return;

    for (uint8_t remaining = FACTORY_HOLD_SECS; remaining > 0; remaining--)
    {
        char buf[21];
        lcd_clear();
        lcd_print_at(0, 0, "== FACTORY RESET ==");
        sprintf(buf, "Keep holding: %u", remaining);
        lcd_print_at(1, 0, buf);
        lcd_print_at(2, 0, "Release to cancel");
        lcd_flush();

        // Poll every 10ms so a release is noticed promptly rather than
        // at the next whole second.
        for (uint8_t t = 0; t < 100; t++)
        {
            CLRWDT();
            __delay_ms(10);
            if (ENC_SW != 0)
            {
                lcd_clear();
                lcd_print_at(1, 0, "Cancelled");
                lcd_flush();
                delay_ms_wdt(1000);
                lcd_clear();
                lcd_flush();
                uart_println("Factory reset cancelled (button released)");
                return;
            }
        }
    }

    // Second stage. The countdown above only proves the button was held;
    // it does not prove the operator knew what it was counting down to.
    // State the consequence in plain words and make them hold through it.
    for (uint8_t remaining = FACTORY_CONFIRM_SECS; remaining > 0; remaining--)
    {
        char buf[21];
        lcd_clear();
        lcd_print_at(0, 0, "== FACTORY RESET ==");
        lcd_print_at(1, 0, "Erase ALL settings?");
        sprintf(buf, "Hold to confirm: %u", remaining);
        lcd_print_at(2, 0, buf);
        lcd_print_at(3, 0, "Release to cancel");
        lcd_flush();

        for (uint8_t t = 0; t < 100; t++)
        {
            CLRWDT();
            __delay_ms(10);
            if (ENC_SW != 0)
            {
                lcd_clear();
                lcd_print_at(1, 0, "Cancelled");
                lcd_print_at(2, 0, "Nothing erased");
                lcd_flush();
                delay_ms_wdt(1500);
                lcd_clear();
                lcd_flush();
                uart_println("Factory reset cancelled at confirm stage");
                return;
            }
        }
    }

    lcd_clear();
    lcd_print_at(1, 0, "Restoring defaults");
    lcd_flush();
    uart_println("FACTORY RESET: restoring defaults");

    factory_reset();

    // Clear the latched fault state too - a wiped unit should not boot
    // still complaining about the last stop it saw.
    system_config.power_failure_flag = 0;
    system_config.active_stop_code = 0;
    save_system_config();

    lcd_clear();
    lcd_print_at(1, 0, "Defaults restored");
    lcd_print_at(2, 0, "Release button");
    lcd_flush();

    // Wait for release so the gesture cannot immediately re-trigger, and
    // so the operator sees it happened.
    while (ENC_SW == 0)
        CLRWDT();

    delay_ms_wdt(1000);
    lcd_clear();
    lcd_flush();
}

void main(void)
{
    // Capture the reset cause BEFORE the first CLRWDT (which sets /TO).
    //
    //   /TO  == 0  watchdog timed out
    //   /POR == 0  cold power-up. Software sets it to 1 afterwards, so it
    //              stays 1 through every later reset until power is lost.
    //   /BOR == 0  brown-out reset - but a power-on clears this one too, so
    //              it only means "brown-out" when /POR says we were already up.
    //
    // That distinction is the whole point: it separates "someone switched it
    // on" from "the supply dipped while we were running", with no EEPROM flag
    // and no invented shutdown event - RCON survives a reset and is lost on a
    // true power-down, which is exactly the semantics wanted.
    rcon_at_boot   = RCON;
    wdt_reset_flag = (RCONbits.NOT_TO == 0) ? 1 : 0;

    if (RCONbits.NOT_POR == 0)
    {
        bor_reset_flag = 0;   // cold start; /BOR being 0 is just the POR side-effect
    }
    else if (RCONbits.NOT_BOR == 0)
    {
        bor_reset_flag = 1;   // we were already powered and the rail dipped
    }

    // Re-arm both for the next reset.
    RCONbits.NOT_POR = 1;
    RCONbits.NOT_BOR = 1;

    CLRWDT();  // [R5] Fresh watchdog window for the whole boot sequence
    system_init();
    uart_init();
#if DEBUG_STREAM
    dbg_ready = 1;      // stream from the earliest possible moment
    debug_heartbeat();
#endif

    // Clear the display as early as possible. EUSART1 is already configured by
    // system_init(), so the clear goes out ahead of EEPROM/I2C/RTC init rather
    // than leaving power-up garbage on the LCD for the whole boot sequence.
    lcd_init();
    disp_clear();

    eeprom_init();

    // -----------------------------------------------------------------
    // Hidden factory reset: hold the encoder button while powering up.
    //
    // Deliberately undocumented on the unit - there is no menu item for
    // it, because wiping a commissioned pump controller by accident is a
    // service call. Boot-time is the safe place for it: the pump cannot
    // be running, and the gesture is impossible to perform unknowingly.
    //
    // Held for FACTORY_HOLD_SECS with a visible countdown; releasing at
    // any point cancels and boots normally. Runs after eeprom_init() so
    // the defaults are written over a known-good structure, and before
    // anything reads config into working state.
    // -----------------------------------------------------------------
    check_factory_reset_gesture();

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
    sprintf(buf, "Ver %d  Rev %d", FW_VERSION, FW_REVISION);
    uart_println(buf);
    sprintf(buf, "Built %s %s", __DATE__, __TIME__);
    uart_println(buf);
    uart_println("================================");

    // Initialize I2C bus
    i2c_init();

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
    // lcd_init() already done at the top of main() for the early display clear

    {
        char rb[56];
        sprintf(rb, "RESET: RCON=0x%02X %s%s%s", rcon_at_boot,
                (rcon_at_boot & 0x02) ? "" : "POWER-ON ",
                wdt_reset_flag ? "INT-ERROR " : "",
                bor_reset_flag ? "BROWN-OUT " : "");
        uart_println(rb);
    }

    uart_println("Peripherals initialized");

#if DEBUG_EEPROM_DUMP
    dump_eeprom_config();  // full persisted-config dump for power-cycle verification
#endif

    // Confirm relay initial state (energized = closed)
    uart_println("RELAY: Closed (energized)");

    // Wait for the display board. It takes ~1s to boot, so the old 500ms
    // was not actually long enough - frames sent into a board that is
    // still initialising are simply lost.
    delay_ms_wdt(1000);  // [R5] WDT-fed

    // Set power LED
    disp_set_leds(0x01);

    // Splash screen - SPECIFIED LAYOUT, see CLAUDE.md "Splash Screen".
    //
    //   Line 1: ==================== (full width)
    //   Line 2: Irrisys PumpGuard     (centred)
    //   Line 3: F/W Ver N, Rev NN     (centred)
    //   Line 4: ==================== (full width)
    //
    // The build date/time that used to sit on line 4 has moved to the
    // debug UART banner only. FW_REVISION now identifies the build, which
    // depends on it being incremented for EVERY change.
    draw_splash();

    // Startup beeps
    for (uint8_t i = 0; i < 3; i++)
    {
        beep(50);
        __delay_ms(100);
    }

    // Hold the splash for 5s, re-asserting the whole screen once a second.
    //
    // The display link is one-way with no ACK, and lcd_flush() only sends
    // lines that CHANGED - so any splash line dropped while the display
    // board was still finishing its own boot would never be re-sent, and
    // the screen would sit half-drawn for the whole hold. Same failure the
    // main loop guards against with its periodic refresh; the splash had
    // no equivalent.
    uart_println("Splash hold 5s...");
    for (uint8_t i = 0; i < 5; i++)
    {
        delay_ms_wdt(1000);  // [R5] WDT-fed
        lcd_invalidate();    // drop the change-detection cache
        lcd_flush();         // re-send all four lines
    }
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

    // After boot sequence: check for a latched fault.
    //
    // The reset cause (brown-out / internal error) is deliberately NOT part of
    // this decision. It is INFORMATION ONLY - displayed so the operator can see
    // why the pump stopped, never used for control. PumpGuard cannot start a
    // pump: closing the relay only permits a start, and the starter still needs
    // the external button. So latching the relay open after a reset would not
    // make anything safer - it would just leave the farmer pressing start with
    // nothing happening and no clue why.
    if (system_config.active_stop_code)
    {
        relay_state = 1;
        relay_latch_mode = 1;  // Treat as latched until button pressed
        RELAY1_PIN = 0;        // Stay de-energized = pump stopped
        uart_println("Boot: active stop code, relay latched open");
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

                // A transmitter switched on with the pump needs time to
                // power up; until then it draws no loop current, which is
                // indistinguishable from a broken wire.
                sensor_settle_countdown = SENSOR_SETTLE_SECS;

                // Initialize bypass timers for all enabled inputs
                for (uint8_t i = 0; i < 3; i++)
                {
                    if (input_config[i].enable)
                        init_bp_timers(i);
                    else
                        { bp_state[i].high.phase = BP_INACTIVE; bp_state[i].low.phase = BP_INACTIVE; alarm_active[i] = 0; }
                }
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
        // ADC read every loop (~20Hz) with 4-sample rolling average
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
#if DEBUG_STREAM
            dbg_adc[0] = adc_ch1;
#endif
            adc_ch2 = sum1 >> ADC_AVG_SHIFT;
            adc_ch3 = sum2 >> ADC_AVG_SHIFT;
#if DEBUG_STREAM
            dbg_adc[1] = adc_ch2;
            dbg_adc[2] = adc_ch3;
#endif
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
#if DEBUG_STREAM
        // Heartbeat from the main loop. Driven off the 50ms subtick, so if
        // the stream stops the main loop stopped - which is the whole point.
        {
            static uint8_t dbg_sub = 0;
            if (++dbg_sub >= (DEBUG_STREAM_MS / 50))
            {
                dbg_sub = 0;
                debug_heartbeat();
            }
        }
#endif
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

            // A running bypass countdown flashes its line too, so the toggle
            // has to keep running while any timer is counting.
            uint8_t any_bypass = 0;
            for (uint8_t i = 0; i < 3; i++)
            {
                if (bp_state[i].high.countdown > 0 || bp_state[i].low.countdown > 0)
                {
                    any_bypass = 1;
                    break;
                }
            }

            if (any_alarm || any_bypass)
                alarm_flash = !alarm_flash;
            else
                alarm_flash = 1;  // Always visible when nothing is flashing
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

            // About screen (UTILITY > About): hold, re-asserting each
            // second so a dropped frame cannot leave it half-drawn, then
            // put the menu back.
            if (about_hold_secs > 0)
            {
                if (--about_hold_secs == 0)
                {
                    about_splash_dismiss();
                }
                else
                {
                    lcd_invalidate();
                    lcd_flush();
                }
            }

            // -------------------------------------------------------
            // Loop integrity (analog inputs only)
            //
            // Evaluated in RUN *and* STOP so a broken loop is visible on
            // the main screen before anyone tries to start the pump. The
            // trip is RUN-only - with the pump already stopped there is
            // nothing left to stop.
            // -------------------------------------------------------
            if (sensor_settle_countdown > 0)
                sensor_settle_countdown--;

            // ---------------------------------------------------------
            // Supply check. Runs before the loop-integrity test because a
            // sagging VDD makes those readings meaningless too - there is
            // no point reporting a loop fault derived from a bad reference.
            // Shares the sensor settling window so a slow rail at power-up
            // cannot trip it.
            // ---------------------------------------------------------
            vdd_mv = read_vdd_mv();

            // Report VDD on the debug UART: once at first reading, then only
            // when it moves more than 50mV. Quiet enough to leave in, and it
            // makes the supply visible during commissioning - otherwise the
            // guard is invisible right up until it trips the pump.
            {
                static uint16_t vdd_reported = 0;
                uint16_t delta = (vdd_mv > vdd_reported)
                               ? (uint16_t)(vdd_mv - vdd_reported)
                               : (uint16_t)(vdd_reported - vdd_mv);
                if (vdd_mv > 0 && (vdd_reported == 0 || delta > 50))
                {
                    char vb[24];
                    sprintf(vb, "VDD %umV", vdd_mv);
                    uart_println(vb);
                    vdd_reported = vdd_mv;
                }
            }
            if (sensor_settle_countdown == 0 && vdd_mv > 0)
            {
                if (!vdd_low && vdd_mv < VDD_MIN_MV)
                    vdd_low = 1;
                else if (vdd_low && vdd_mv > (VDD_MIN_MV + VDD_HYST_MV))
                    vdd_low = 0;   // recovered, with hysteresis so it cannot chatter
            }

            // A bad reference blinds every analog channel at once, so this
            // is an immediate stop - no bypass timer, and latched, because a
            // pulsed stop would restart the pump on the same bad supply.
            if (vdd_low && sys_state == SYS_RUN && !vdd_alarm)
            {
                vdd_alarm = 1;
                trigger_relay_pulse(1);
                system_config.active_stop_code = 23;
                save_power_flags();

                for (uint8_t j = 0; j < 3; j++)
                {
                    bp_state[j].high.phase = BP_INACTIVE;
                    bp_state[j].high.countdown = 0;
                    bp_state[j].low.phase = BP_INACTIVE;
                    bp_state[j].low.countdown = 0;
                }
                start_alarm_buzzer();
                {
                    char vbuf[40];
                    sprintf(vbuf, "ALARM: VDD %umV, ref invalid", vdd_mv);
                    uart_println(vbuf);
                }
            }

            {
                uint16_t adc_now[3] = {adc_ch1, adc_ch2, adc_ch3};

                for (uint8_t i = 0; i < 3; i++)
                {
                    uint8_t st = input_config[i].sensor_type;

                    // Switch types carry no loop current, and a disabled
                    // input is not ours to complain about.
                    if (!input_config[i].enable || st == 3 || st == 5 ||
                        sensor_settle_countdown > 0)
                    {
                        sensor_fault[i] = SENSOR_OK;
                        continue;
                    }

                    if (adc_now[i] <= ADC_UNDER_RANGE)
                        sensor_fault[i] = SENSOR_OPEN;
                    else if (adc_now[i] >= ADC_OVER_RANGE)
                        sensor_fault[i] = SENSOR_SHORT;
                    else
                        sensor_fault[i] = SENSOR_OK;

                    // An out-of-range loop means this channel is blind, so
                    // it can no longer protect the pump. Immediate stop -
                    // no bypass timer, no grace period.
                    if (sensor_fault[i] != SENSOR_OK &&
                        sys_state == SYS_RUN && !sensor_alarm[i])
                    {
                        sensor_alarm[i] = 1;
                        alarm_active[i] = 1;
                        alarm_input_idx = i;

                        // Latch, never pulse: a pulsed stop would let the
                        // pump restart with the sensor still broken.
                        trigger_relay_pulse(1);
                        system_config.active_stop_code = (uint8_t)(20 + i);
                        save_power_flags();

                        // Can only stop once - cancel every bypass countdown
                        for (uint8_t j = 0; j < 3; j++)
                        {
                            bp_state[j].high.phase = BP_INACTIVE;
                            bp_state[j].high.countdown = 0;
                            bp_state[j].low.phase = BP_INACTIVE;
                            bp_state[j].low.countdown = 0;
                        }
                        start_alarm_buzzer();
                        {
                            char abuf[40];
                            sprintf(abuf, "ALARM: In%u loop %s", i + 1,
                                    (sensor_fault[i] == SENSOR_OPEN)
                                        ? "OPEN" : "SHORT");
                            uart_println(abuf);
                        }
                    }
                }
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
                        // The setting names the level at which the condition
                        // is present (flow running), so the FAULT is the
                        // opposite level - no flow / aux not asserted.
                        //
                        // A switch has one fault and it is a LOW condition,
                        // so it runs in the low direction - the same one the
                        // menu's PNFBP/SNFBP timers and relay modes belong to.
                        low_fault = (pin != input_config[i].fault_polarity);
                        // Digital: high direction unused
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

                    // Process high direction (analog only - a switch has no
                    // high fault, so its high direction stays inactive)
                    uint8_t hi_result = is_digital ? 0
                        : process_bp(&bp_state[i].high, high_fault,
                                     input_config[i].secondary_high_bypass);
                    // 3 = secondary countdown started, which is not an alarm
                    if (hi_result == 1 || hi_result == 2)
                    {
                        uint8_t rly = (hi_result == 1) ? input_config[i].relay_pri_high_mode
                                                       : input_config[i].relay_sec_high_mode;
                        trigger_relay_pulse(rly == 0 ? 1 : 0);
                        system_config.active_stop_code = (uint8_t)(2 + i * 2);  // 2,4,6
                        save_power_flags();
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

                    // Process low direction - for a switch this is the only
                    // direction, and carries its single fault condition.
                    {
                        uint8_t lo_result = process_bp(&bp_state[i].low, low_fault,
                                                        input_config[i].secondary_low_bypass);
                        // 3 = secondary countdown started, which is not an alarm
                        if (lo_result == 1 || lo_result == 2)
                        {
                            uint8_t rly = (lo_result == 1) ? input_config[i].relay_pri_low_mode
                                                           : input_config[i].relay_sec_low_mode;
                            trigger_relay_pulse(rly == 0 ? 1 : 0);
                            system_config.active_stop_code = (uint8_t)(3 + i * 2);  // 3,5,7
                            save_power_flags();
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
                                       bp_state[i].low.phase == BP_ALARM ||
                                       sensor_alarm[i]);
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
            // The About screen owns the display while it is up
            if (!about_splash_active())
            {
            menu_handle_encoder(delta);

            // Redraw menu after rotation
            if (current_menu == 0) menu_draw_options();
            else if (current_menu == 1) menu_draw_input();
            else if (current_menu == 2) menu_draw_setup();
            else if (current_menu == 3) menu_draw_clock();
            else if (current_menu == 4) menu_draw_utility();
            else if (current_menu == 5) menu_draw_main_menu();
            else if (current_menu == 6) menu_draw_digital();

            lcd_flush();
            }
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

                    if (boot_pwr_fail || system_config.active_stop_code || ext_stop_flag ||
                        wdt_reset_flag || bor_reset_flag || vdd_alarm)
                    {
                        // First press: clear fault, close relay if latched, don't enter menu
                        boot_pwr_fail = 0;
                        system_config.power_failure_flag = 0;
                        system_config.active_stop_code = 0;
                        wdt_reset_flag = 0;  // [4e-2] acknowledge watchdog-reset latch
                        bor_reset_flag = 0;  // acknowledge brown-out latch
                        vdd_alarm = 0;       // acknowledge low-supply latch
                        if (relay_state == 1)
                            relay_close();
                        clear_bp_timers();  // Clear all bypass alarms
                        // Still running? Resume monitoring - otherwise every
                        // direction stays BP_INACTIVE for the rest of the run.
                        if (sys_state == SYS_RUN)
                            resume_bp_timers();
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
                if (about_splash_active())
                {
                    // Any press dismisses the About screen early
                    about_splash_dismiss();
                }
                else
                {
                menu_handle_button(evt);

                // Redraw after button - unless About has just taken the
                // display, in which case leave it alone
                if (!about_splash_active())
                {
                if (current_menu == 0) menu_draw_options();
                else if (current_menu == 1) menu_draw_input();
                else if (current_menu == 2) menu_draw_setup();
                else if (current_menu == 3) menu_draw_clock();
                else if (current_menu == 4) menu_draw_utility();
                else if (current_menu == 5) menu_draw_main_menu();
                else if (current_menu == 6) menu_draw_digital();

                lcd_flush();
                }
                }
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
            menu_cancel_edit();  // clears every sub-mode, not just the flag
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
