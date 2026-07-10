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

// Factory defaults constant
const input_config_t factory_defaults[3] = {
    // Input 1 - Default to Pressure (analog)
    {
        1, 0, 0, 0, {0, 0, 0, 0},           // enable, pressure, fault_pol=0, flags, reserved
        0, 360, 200, 30, {0, 0, 0, 0},      // scale_4ma=0, scale_20ma=360, high=200, low=30
        0, 0, 300, 30, {0,0,0,0,0,0,0,0,0,0,0,0}, // pri_hi=0, sec_hi=0, pri_lo=300, sec_lo=30
        0, 0, 0, 0, {0, 0, 0, 0},           // relay: pri_hi, sec_hi, pri_lo, sec_lo = all latch
        {0, 0, 0, 0},                        // reserved uint32
        "Pressure",                           // name
        "psi",                                // units
        {0}                                   // padding
    },

    // Input 2 - Default to Temperature (analog)
    {
        1, 1, 0, 0, {0, 0, 0, 0},           // enable, temp, fault_pol=0, flags, reserved
        -50, 150, 85, -10, {0, 0, 0, 0},    // scale_4ma=-50, scale_20ma=150, high=85, low=-10
        60, 0, 0, 0, {0,0,0,0,0,0,0,0,0,0,0,0}, // pri_hi=60s, others=0
        0, 0, 0, 0, {0, 0, 0, 0},           // relay modes all latch
        {0, 0, 0, 0},                        // reserved uint32
        "Temperature",                        // name
        "\xDF""C",                            // units (degree symbol + C)
        {0}                                   // padding
    },

    // Input 3 - Default to Flow Meter (analog)
    {
        1, 2, 0, 0, {0, 0, 0, 0},           // enable, flow_meter, fault_pol=0, flags, reserved
        0, 100, 0, 0, {0, 0, 0, 0},         // scale_4ma=0, scale_20ma=100, high=0, low=0
        0, 0, 0, 30, {0,0,0,0,0,0,0,0,0,0,0,0}, // sec_lo=30s
        0, 0, 0, 0, {0, 0, 0, 0},           // relay modes all latch
        {0, 0, 0, 0},                        // reserved uint32
        "Flow Meter",                         // name
        "%",                                  // units
        {0}                                   // padding
    }
};

// System defaults
const system_config_t system_defaults = {
    // Clock/timing
    1, 120, 0, 0, 1, 2, 0, {0, 0, 0, 0, 0, 0, 0},
    // Display
    5, 5, 5, 0, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    // Digital inputs (all disabled)
    0, 0, 0,  // DIG2: disabled, fault_low, latch
    0, 0, 0,  // DIG3: disabled, fault_low, latch
    0, 0, 0,  // DIG4: disabled, fault_low, latch
    {0, 0, 0, 0, 0, 0, 0},
    // Logging
    20, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
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
    menu_timeout_seconds = system_config.menu_timeout * 2; // Convert from 2-second increments

    // Validate the timeout value (10-510 seconds range)
    if (menu_timeout_seconds < 10 || menu_timeout_seconds > 510)
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
    memcpy(input_config, factory_defaults, sizeof(input_config));
    memcpy(&system_config, &system_defaults, sizeof(system_config));
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
    // Return timeout value, with bounds checking
    if (system_config.menu_timeout < 5)
    {
        return 30; // Default 30 seconds if value too low
    }
    if (system_config.menu_timeout > 120)
    {
        return 30; // Default 30 seconds if value too high
    }
    return system_config.menu_timeout;
}
