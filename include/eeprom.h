#ifndef EEPROM_H
#define EEPROM_H

#include <stdint.h>

// Per-input configuration (expandable structure)
typedef struct
{
    // Basic config (8 bytes)
    uint8_t enable;          // 0=Disabled, 1=Enabled
    uint8_t sensor_type;     // 0=Pressure, 1=Temp, 2=Flow
    uint8_t flow_type;       // 0=Analog, 1=Digital (Flow only)
    uint8_t flow_units;      // 0=%, 1=LpS (Analog Flow only)
    uint8_t display_enabled; // 0=Hide, 1=Show
    uint8_t reserved1[3];    // Future expansion

    // Signed values (16 bytes) - for values that can be negative
    int16_t scale_4ma;          // SIGNED 4mA scaling (-999 to +999)
    int16_t scale_20ma;         // SIGNED 20mA scaling (-999 to +999)
    int16_t temp_low;           // SIGNED temp low setpoint
    int16_t reserved_signed[5]; // Future signed values

    // Unsigned 16-bit values (32 bytes) - for 0-1000 range values
    uint16_t high_setpoint;       // High pressure/temp limit
    uint16_t high_bypass_time;    // High bypass time (seconds)
    uint16_t plp_bypass_time;     // Primary low pressure bypass
    uint16_t slp_bypass_time;     // Secondary low pressure bypass
    uint16_t low_flow_setpoint;   // Low flow limit
    uint16_t low_flow_bypass;     // Low flow bypass time
    uint16_t reserved_uint16[10]; // Future 16-bit values

    // Relay modes (8 bytes)
    uint8_t relay_high_mode; // 0=Latch, 1=Pulse, 2=No Action
    uint8_t relay_plp_mode;
    uint8_t relay_slp_mode;
    uint8_t relay_low_mode;
    uint8_t reserved_relay[4];

    // Space reserved for future 32-bit values (0-22000000 range)
    uint32_t reserved_uint32[4]; // 16 bytes for future large values

    // Padding to 128 bytes per input for maximum expansion
    uint8_t padding[48];
} input_config_t;

// ADD THESE MISSING PARTS:

// System configuration structure
typedef struct
{
    // Clock/timing (16 bytes)
    uint8_t clock_enabled;
    uint8_t menu_timeout;   // Menu timeout in seconds
    uint16_t runtime_hours; // Set runtime hh:mm
    uint16_t runtime_minutes;
    uint8_t end_runtime_mode; // Relay mode for end runtime
    uint8_t relay_pulse_time; // Relay pulse duration (1-120 seconds)
    uint8_t reserved_time[8];

    // Display settings (16 bytes)
    uint8_t contrast;          // LCD contrast (3-10)
    uint8_t brightness;        // LCD brightness (3-10)
    uint16_t power_fail_delay; // Power fail delay (seconds)
    uint8_t reserved_display[12];

    // Logging (16 bytes)
    uint16_t log_entries; // Number of log entries to store
    uint8_t reserved_log[14];

    // Padding to 128 bytes for future system config
    uint8_t padding[80];
} system_config_t;

// EEPROM addresses
#define EEPROM_INPUT_BASE 0x00
#define EEPROM_SYSTEM_BASE 0x180   // After 3 × 128 = 384 bytes
#define EEPROM_CHECKSUM_ADDR 0x200 // After system config

// Function prototypes
void eeprom_init(void);
void save_current_config(void);
void factory_reset(void);
void load_factory_defaults(void);
void sync_menu_variables(void);

uint8_t get_menu_timeout_seconds(void);

// External variables that other files can access
extern input_config_t input_config[3];
extern system_config_t system_config;

#endif