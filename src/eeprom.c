#include "../include/eeprom.h"
#include "../include/config.h"
#include <string.h>
#include "../include/menu.h" // Add this line

// Global variables
input_config_t input_config[3];
system_config_t system_config;

// Menu timeout in seconds (will be loaded from EEPROM)
uint16_t menu_timeout_seconds = 30; // Default value if EEPROM invalid

// Factory defaults constant
const input_config_t factory_defaults[3] = {
    // Input 1 - Default to Pressure
    {1, 0, 0, 0, 1, 0, {0, 0}, // enable=YES, pressure, analog, %, show, flags=0
     0,
     360,
     0,
     {0, 0, 0, 0, 0}, // 4mA=0 psi, 20mA=360 psi (signed)
     200,
     0,
     300,
     30,
     0,
     0,
     30,
     {0, 0, 0, 0, 0, 0, 0, 0, 0}, // high=200, PLPBP=300s, SLPBP=30s, low_press=30
     0,
     0,
     1,
     0,
     {0, 0, 0, 0}, // relay: high=latch, plp=latch, slp=pulse, low=none
     {0, 0, 0, 0}, // reserved uint32
     {0}},         // padding

    // Input 2 - Default to Temperature
    {1, 1, 0, 0, 1, 0, {0, 0}, // enable, temp, analog, %, show, flags=0
     -50,
     150,
     -10,
     {0, 0, 0, 0, 0}, // 4mA=-50°C, 20mA=150°C, low=-10°C (signed)
     85,
     60,
     0,
     0,
     0,
     0,
     0,
     {0, 0, 0, 0, 0, 0, 0, 0, 0}, // high temp=85°C, bypass=60s, low_press=0(N/A)
     0,
     0,
     0,
     0,
     {0, 0, 0, 0}, // relay modes
     {0, 0, 0, 0}, // reserved uint32
     {0}},         // padding

    // Input 3 - Default to Flow (Digital)
    {1, 2, 1, 0, 1, 0, {0, 0}, // enable, flow, digital, %, show, flags=0
     0,
     0,
     0,
     {0, 0, 0, 0, 0}, // no scaling for digital
     0,
     0,
     0,
     0,
     50,
     30,
     0,
     {0, 0, 0, 0, 0, 0, 0, 0, 0}, // low flow=50%, bypass=30s, low_press=0(N/A)
     0,
     0,
     0,
     0,
     {0, 0, 0, 0}, // relay modes
     {0, 0, 0, 0}, // reserved uint32
     {0}}          // padding
};

// System defaults
const system_config_t system_defaults = {
    1, 120, 0, 0, 1, 2, 0, {0, 0, 0, 0, 0, 0, 0}, // clock enabled, timeout=120s, pulse mode, relay_pulse=2s, flags=0
    5,
    5,
    5,
    0,                                            // power_failure_flag = 0 (armed on RUN entry)
    0,                                            // active_stop_code = 0 (no latched fault)
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},              // contrast=5, brightness=5, power fail=5s
    100,
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, // 100 log entries
    {0}                                          // padding
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
    // ... existing EEPROM loading code ...

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
    // This function will sync the menu display variables with the EEPROM config
    // We'll implement this after we integrate with the menu system

    // For now, just update the basic flags for Input 1
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