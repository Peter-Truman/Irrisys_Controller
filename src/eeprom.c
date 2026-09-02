#include "../include/eeprom.h"
#include "../include/config.h"
#include <string.h>
#include "../include/menu.h"

// Global variables
input_config_t input_config[3];
system_config_t system_config;

// [map §6] Compile-time guard: both config structs MUST be exactly 128 bytes.
// The EEPROM layout addresses inputs by (i * sizeof) and the system config /
// checksum live at fixed literal addresses (0x180 / 0x200). Any accidental
// layout drift (added field, alignment change) silently mis-maps every saved
// config. These typedefs fail to compile (negative array size) if the size is
// ever wrong.
typedef char assert_input_config_is_128[(sizeof(input_config_t) == 128) ? 1 : -1];
typedef char assert_system_config_is_128[(sizeof(system_config_t) == 128) ? 1 : -1];

// Menu timeout in seconds (will be loaded from EEPROM)
uint16_t menu_timeout_seconds = 30; // Default value if EEPROM invalid

// Sensor type assigned to each input slot on a factory reset. The actual
// field values come from sensor_type_defaults[] below, so the startup defaults
// and the defaults applied on a sensor-type change are the same single table -
// they cannot drift apart.
static const uint8_t factory_sensor_type[3] = {
    0,  // Input 1 - Pressure
    1,  // Input 2 - Temperature
    2   // Input 3 - Flow Meter
};

// Per-sensor-type defaults, indexed by sensor_type. Applied whenever the
// operator changes an input's sensor type, so a re-typed input can never keep
// trip settings that belonged to the previous sensor.
//
// Types 3/4/5 (Flow Switch, Other 4-20, Other Switch) default to all bypass
// timers 0, which means "direction not monitored" — a freshly re-typed input
// cannot trip the pump until the operator deliberately sets its timers.
const sensor_defaults_t sensor_type_defaults[7] = {
    // scale_4ma, scale_20ma, high_sp, low_sp,
    // pri_hi_bp, sec_hi_bp, pri_lo_bp, sec_lo_bp,
    // rly pri_hi, sec_hi, pri_lo, sec_lo, fault_pol, name, units

    // 0 - Pressure: 0-362 psi, high trip 200 (0s pri / 1s sec),
    //     low trip 30 with 5:00 start grace + 0:30 delay, sec low relay pulses
    //     BOTH high bypasses are 0 = trip immediately, at start or while
    //     running. Safe to say so now: since Rev 91 a 0 timer is a DELAY of
    //     zero, never a hidden "off" - the direction is monitored either
    //     way. Over-pressure has no reason to be tolerated for a window.
    {0, 362, 200, 30,  0, 0, 300, 30,  0, 0, 0, 1, 0, "Pressure",    "psi"},

    // 1 - Temperature: transmitter scales -50 to 150 C, trip high at 65
    //     after a 1:00 grace. Setpoints are adjustable -10..150 only - a
    //     pump at -10 is frozen, so a lower trip is unreachable. The LOW
    //     direction is deliberately not monitored (both low BPs are 0).
    //     SHTBP was 0 (instant) on the reasoning that a pump losing prime
    //     churns and heats fast. Set to 0:30 deliberately in Rev 90 - if
    //     nuisance trips appear, the answer is threshold hysteresis, NOT a
    //     longer window.
    {-50, 150, 65, -5,  60, 30, 0, 0,  0, 0, 0, 0, 0, "Temperature", "\xDF""C"},

    // 2 - Flow Meter: 0-100% of PUMP capability (set Scale 20mA so the
    //     meter full scale reads as its percentage of pump rating).
    //     PLFBP 15:00 startup window - an irrigator takes a while to
    //     pressurise - then SLFBP 0:30 running. High direction is OFF
    //     (both high BPs 0): a pump cannot exceed 100% of its own
    //     capability, and with high_setpoint 0 any non-zero high BP
    //     would make val >= 0 true and stop the pump on every start.
    //     HIGH SETPOINT 85 IS A FORCING FUNCTION, not a trip point. We
    //     cannot know what meter will be fitted, so a default that provokes
    //     a stop makes the installer confront the setting rather than leave
    //     an input silently unmonitored. Same reasoning as Other 4-20.
    {0, 100, 85, 0,  10, 2, 900, 30,  0, 0, 0, 0, 0, "Flow Meter",  "%"},

    // 3 - Flow Switch (digital): 0:30 startup window for no flow.
    //     Switch types use the LOW direction only - PNFBP / SNFBP.
    //     Polarity HIGH: irrigation flow switches are usually a 2-wire dry
    //     contact that closes on flow, putting 24V on the input.
    //     Secondary was 0 - the first tick of no-flow stopped the pump with
    //     no ride-through, and nothing in the path debounces a chattering
    //     paddle at marginal flow. 0:05 covers that.
    {0, 0, 0, 0,  0, 0, 10, 5,  0, 0, 0, 0, 1, "Flow Switch", ""},

    // 4 - Other 4-20 (analog): neutral 0-100 span, unmonitored, user names it
    //     Every bypass 1s and high setpoint 85 for the same reason as Flow
    //     Meter: on a protection device an unconfigured input must not sit
    //     silently unmonitored. It stops the pump until real values are
    //     entered, which is the intended prompt.
    {0, 100, 85, 0,  1, 1, 1, 1,  0, 0, 0, 0, 0, "Other 4-20",  ""},

    // 5 - Other Switch (digital): unmonitored until timers are configured
    {0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0, 0, "Other Sw",    ""},
    // 6 Watch Dog: an external "still moving" signal, e.g. a reed switch on a
    //   traveling irrigator wheel, radio-linked back to the pumpshed. Uses the
    //   LOW-direction fields: PWDBP 30:00 startup grace (an irrigator takes a
    //   while to pressurise and start moving), SWDBP 5:00 thereafter, reloaded
    //   by every pulse. fault_polarity carries the trigger edge, default 2 =
    //   either edge, which works with any receiver output.
    //   Rly SWDBP defaults to PULSE: a running irrigator that stops signalling
    //   has usually just stalled or lost the radio link for a moment, so drop
    //   the pump and let it be restarted. PWDBP is left LATCHED - never having
    //   started moving at all points at a setup or plumbing problem that wants
    //   someone to look at it.
    {0, 0, 0, 0,  0, 0, 1800, 300,  0, 0, 0, 1, 2, "WDT",         ""}
};

void apply_sensor_type_defaults(uint8_t idx, uint8_t st)
{
    if (idx >= 3 || st > 6)
        return;

    const sensor_defaults_t *d = &sensor_type_defaults[st];
    input_config_t *c = &input_config[idx];

    c->sensor_type = st;
    c->fault_polarity = d->fault_polarity;

    c->scale_4ma = d->scale_4ma;
    c->scale_20ma = d->scale_20ma;
    c->high_setpoint = d->high_setpoint;
    c->low_setpoint = d->low_setpoint;

    c->primary_high_bypass = d->primary_high_bypass;
    c->secondary_high_bypass = d->secondary_high_bypass;
    c->primary_low_bypass = d->primary_low_bypass;
    c->secondary_low_bypass = d->secondary_low_bypass;

    c->relay_pri_high_mode = d->relay_pri_high_mode;
    c->relay_sec_high_mode = d->relay_sec_high_mode;
    c->relay_pri_low_mode = d->relay_pri_low_mode;
    c->relay_sec_low_mode = d->relay_sec_low_mode;

    strncpy(c->name, d->name, 15);
    c->name[15] = '\0';
    strncpy(c->units, d->units, 7);
    c->units[7] = '\0';
}

// System defaults
const system_config_t system_defaults = {
    // Clock/timing: clock on, menu timeout 30s, runtime 0:00,
    // end-runtime pulse, relay pulse 2s
    1, 30, 0, 0, 1, 2, 0, {0, 0, 0, 0, 0, 0, 0},
    // Display: contrast 5, brightness 5, power-detect delay 3s
    5, 5, 3, 0, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    // Digital inputs (all disabled)
    0, 0, 0,  // DIG2: disabled, fault_low, latch
    0, 0, 0,  // DIG3: disabled, fault_low, latch
    0, 0, 0,  // DIG4: disabled, fault_low, latch
    {0, 0, 0, 0, 0, 0, 0},
    // reserved_log (was log_entries) - log concept dropped
    0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    // Padding
    {0}
};

// Forward declaration: primitive is defined below, used by the checksum.
uint8_t eeprom_read_byte(uint16_t address);

// Calculate checksum for data integrity.
// [C3] Sums the persisted config image directly from EEPROM (addresses
// 0x000..CHECKSUM_ADDR-1), NOT the RAM globals. The RAM copy may hold menu
// edits whose deferred EEPROM write has not yet run; checksumming RAM would
// store a value that disagrees with the actual EEPROM body, and if power is
// lost before the deferred flush, the next boot sees a mismatch and wipes ALL
// config to factory defaults. Checksumming EEPROM keeps the stored checksum
// always consistent with what is actually persisted (an unflushed edit is
// simply not yet reflected — correct — rather than corrupting everything).
// Additive sum over the same bytes is identical to the old RAM-based value
// when RAM==EEPROM, so existing units still validate (no forced reset).
uint16_t calculate_config_checksum(void)
{
    uint16_t checksum = 0;
    for (uint16_t addr = 0; addr < EEPROM_CHECKSUM_ADDR; addr++)
    {
        checksum += eeprom_read_byte(addr);
    }
    return checksum;
}

// EEPROM read/write functions (PIC18F specific)
uint8_t eeprom_read_byte(uint16_t address)
{
    EEADR = address & 0xFF;
    EEADRH = (address >> 8) & 0xFF;
    EECON1bits.EEPGD = 0; // Point to DATA memory
    EECON1bits.CFGS = 0;  // Access EEPROM
    EECON1bits.RD = 1;    // Initiate read
    return EEDATA;
}

void eeprom_write_byte(uint16_t address, uint8_t data)
{
    EEADR = address & 0xFF;
    EEADRH = (address >> 8) & 0xFF;
    EEDATA = data;
    EECON1bits.EEPGD = 0; // Point to DATA memory
    EECON1bits.CFGS = 0;  // Access EEPROM
    EECON1bits.WREN = 1;  // Enable writes

    // [C5] The 0x55/0xAA unlock -> WR=1 sequence must be atomic. An interrupt
    // (1ms Timer0 or 1Hz INT0) landing between the unlock and WR=1 aborts the
    // write, so config/power-flag saves can silently fail. Guard with GIE,
    // restoring its prior state (this may be called before GIE is enabled).
    // NOTE (Step 4/IPEN): when interrupt priorities are enabled, clearing GIE
    // (GIEH) still blocks high-priority interrupts; revisit if GIEL work is
    // added on the write path.
    uint8_t gie_save = INTCONbits.GIE;
    INTCONbits.GIE = 0;

    // Required write sequence
    EECON2 = 0x55;
    EECON2 = 0xAA;
    EECON1bits.WR = 1; // Start write

    INTCONbits.GIE = gie_save; // Restore interrupt enable

    while (EECON1bits.WR)
        ;                // Wait for write to complete
    EECON1bits.WREN = 0; // Disable writes
}

uint16_t eeprom_read_word(uint16_t address)
{
    uint16_t result;
    result = eeprom_read_byte(address);
    result |= ((uint16_t)eeprom_read_byte(address + 1)) << 8;
    return result;
}

void eeprom_write_word(uint16_t address, uint16_t data)
{
    eeprom_write_byte(address, data & 0xFF);
    eeprom_write_byte(address + 1, (data >> 8) & 0xFF);
}

void eeprom_write_block(void *data, uint16_t address, uint16_t length)
{
    uint8_t *ptr = (uint8_t *)data;
    for (uint16_t i = 0; i < length; i++)
    {
        CLRWDT();  // [R5] each byte write blocks ~4ms; feed WDT so a long block
                   // save (~512ms) can't trip it (esp. once timeout is tightened)
        eeprom_write_byte(address + i, ptr[i]);
    }
}

void eeprom_read_block(void *data, uint16_t address, uint16_t length)
{
    uint8_t *ptr = (uint8_t *)data;
    for (uint16_t i = 0; i < length; i++)
    {
        ptr[i] = eeprom_read_byte(address + i);
    }
}

// EEPROM Management Functions
void eeprom_init(void)
{
    uint16_t stored_checksum = eeprom_read_word(EEPROM_CHECKSUM_ADDR);

    // Load current config from EEPROM
    for (uint8_t i = 0; i < 3; i++)
    {
        eeprom_read_block(&input_config[i],
                          EEPROM_INPUT_BASE + (i * sizeof(input_config_t)),
                          sizeof(input_config_t));
    }
    eeprom_read_block(&system_config, EEPROM_SYSTEM_BASE, sizeof(system_config_t));

    uint16_t calculated_checksum = calculate_config_checksum();

    if (stored_checksum != calculated_checksum)
    {
        // Corrupt or first boot - load factory defaults
        load_factory_defaults();
        save_current_config();
    }

    // Sync menu variables with loaded config
    sync_menu_variables();

    // Load menu timeout value
    menu_timeout_seconds = system_config.menu_timeout;  // stored value IS seconds

    // Validate against the range the menu offers (10s - 4:00)
    if (menu_timeout_seconds < 10 || menu_timeout_seconds > 240)
    {
        menu_timeout_seconds = 30; // Use default if out of range
    }
}

void save_current_config(void)
{
    // Write all input configs
    for (uint8_t i = 0; i < 3; i++)
    {
        eeprom_write_block(&input_config[i],
                           EEPROM_INPUT_BASE + (i * sizeof(input_config_t)),
                           sizeof(input_config_t));
    }

    // Write system config
    eeprom_write_block(&system_config, EEPROM_SYSTEM_BASE, sizeof(system_config_t));

    // Write checksum last
    uint16_t checksum = calculate_config_checksum();
    eeprom_write_word(EEPROM_CHECKSUM_ADDR, checksum);
}

void save_input_config(uint8_t input_num)
{
    if (input_num >= 3) return;

    eeprom_write_block(&input_config[input_num],
                       EEPROM_INPUT_BASE + (input_num * sizeof(input_config_t)),
                       sizeof(input_config_t));

    // Recalculate and write checksum
    uint16_t checksum = calculate_config_checksum();
    eeprom_write_word(EEPROM_CHECKSUM_ADDR, checksum);
}

void save_system_config(void)
{
    eeprom_write_block(&system_config, EEPROM_SYSTEM_BASE, sizeof(system_config_t));

    // Recalculate and write checksum
    uint16_t checksum = calculate_config_checksum();
    eeprom_write_word(EEPROM_CHECKSUM_ADDR, checksum);
}

void save_power_flags(void)
{
    // Only write the 2 flag bytes + checksum (4 EEPROM writes vs ~514)
    uint16_t offset = EEPROM_SYSTEM_BASE + 20;  // power_failure_flag offset in system_config_t
    eeprom_write_byte(offset, system_config.power_failure_flag);
    eeprom_write_byte(offset + 1, system_config.active_stop_code);

    // Recalculate and write checksum
    uint16_t checksum = calculate_config_checksum();
    eeprom_write_word(EEPROM_CHECKSUM_ADDR, checksum);
}

void factory_reset(void)
{
    load_factory_defaults();
    save_current_config();
    sync_menu_variables();
}

void load_factory_defaults(void)
{
    memset(input_config, 0, sizeof(input_config));

    for (uint8_t i = 0; i < 3; i++)
    {
        input_config[i].enable = 1;
        apply_sensor_type_defaults(i, factory_sensor_type[i]);
    }

    // The failure log survives a factory reset ON PURPOSE.
    //
    // A user whose unit is misbehaving is quite likely to be TOLD to try a
    // factory reset before sending it back - which is exactly the moment the
    // fault history becomes valuable, and exactly when it would otherwise be
    // destroyed. These counters describe what the HARDWARE has been through,
    // not how it is configured, so a configuration reset has no business
    // clearing them. New faults carry on accumulating afterwards.
    uint16_t keep_boots    = system_config.boot_count;
    uint8_t  keep_bor      = system_config.cnt_brownout;
    uint8_t  keep_int      = system_config.cnt_int_error;
    uint8_t  keep_rtc      = system_config.cnt_rtc_fault;
    uint8_t  keep_lowv     = system_config.cnt_low_volts;
    uint8_t  keep_loop0    = system_config.cnt_loop_fault[0];
    uint8_t  keep_loop1    = system_config.cnt_loop_fault[1];
    uint8_t  keep_loop2    = system_config.cnt_loop_fault[2];
    uint8_t  keep_ring_pos = system_config.stop_ring_pos;
    uint8_t  keep_ring[8];
    memcpy(keep_ring, system_config.stop_ring, 8);

    memcpy(&system_config, &system_defaults, sizeof(system_config));

    system_config.boot_count        = keep_boots;
    system_config.cnt_brownout      = keep_bor;
    system_config.cnt_int_error     = keep_int;
    system_config.cnt_rtc_fault     = keep_rtc;
    system_config.cnt_low_volts     = keep_lowv;
    system_config.cnt_loop_fault[0] = keep_loop0;
    system_config.cnt_loop_fault[1] = keep_loop1;
    system_config.cnt_loop_fault[2] = keep_loop2;
    system_config.stop_ring_pos     = keep_ring_pos;
    memcpy(system_config.stop_ring, keep_ring, 8);
}

void sync_menu_variables(void)
{
    // Sync menu display variables with loaded config
    extern uint8_t enable_edit_flag;
    extern uint8_t sensor_edit_flag;

    enable_edit_flag = input_config[0].enable;
    sensor_edit_flag = input_config[0].sensor_type;
}

// Getter function for menu timeout - safe to call from anywhere
uint8_t get_menu_timeout_seconds(void)
{
    // Bounds MUST match the range the UTILITY menu offers (10s - 4:00),
    // otherwise the menu accepts values this function silently replaces.
    if (system_config.menu_timeout < 10)
    {
        return 30; // Default 30 seconds if value too low
    }
    if (system_config.menu_timeout > 240)
    {
        return 30; // Default 30 seconds if value too high
    }
    return system_config.menu_timeout;
}
