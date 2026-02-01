#include "../include/eeprom.h"
#include "../include/config.h"
#include <string.h>
#include "../include/menu.h"

// Global variables
input_config_t input_config[3];
system_config_t system_config;

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
    100, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    // Padding
    {0}
};

// Calculate checksum for data integrity
uint16_t calculate_config_checksum(void)
{
    uint16_t checksum = 0;
    uint8_t *data;

    // Checksum all input configs
    for (uint8_t i = 0; i < 3; i++)
    {
        data = (uint8_t *)&input_config[i];
        for (uint16_t j = 0; j < sizeof(input_config_t); j++)
        {
            checksum += data[j];
        }
    }

    // Checksum system config
    data = (uint8_t *)&system_config;
    for (uint16_t j = 0; j < sizeof(system_config_t); j++)
    {
        checksum += data[j];
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

    // Required write sequence
    EECON2 = 0x55;
    EECON2 = 0xAA;
    EECON1bits.WR = 1; // Start write

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
