#ifndef EEPROM_H
#define EEPROM_H

#include <stdint.h>

// Per-input configuration — unified for all sensor types (128 bytes)
typedef struct
{
    // Basic config (8 bytes)
    uint8_t enable;               // 0=Disabled, 1=Enabled
    uint8_t sensor_type;          // 0=Pressure 1=Temp 2=FlowMeter 3=FlowSw
                                  // 4=Oth4-20 5=OthSw 6=WatchDog
    uint8_t fault_polarity;       // Switch types: level at which the condition is
                                  //   PRESENT (0=Low, 1=High)
                                  // Watch Dog: trigger edge
                                  //   0=Hi to Lo, 1=Lo to Hi, 2=either edge
    uint8_t config_flags;         // Bit flags for per-input options
    uint8_t reserved1[4];         // Future expansion

    // Signed values (16 bytes)
    int16_t scale_4ma;            // 4mA scaling (-999 to +999)
    int16_t scale_20ma;           // 20mA scaling (-999 to +999)
    int16_t high_setpoint;        // High setpoint (signed)
    int16_t low_setpoint;         // Low setpoint (signed)
    int16_t reserved_signed[4];   // Future signed values

    // Unsigned 16-bit bypass times in seconds (32 bytes)
    uint16_t primary_high_bypass;     // Analog: pri high BP / Digital: pri fault BP
    uint16_t secondary_high_bypass;   // Analog: sec high BP / Digital: sec fault BP
    uint16_t primary_low_bypass;      // Analog: pri low BP
    uint16_t secondary_low_bypass;    // Analog: sec low BP
    uint16_t reserved_uint16[12];     // Future 16-bit values

    // Relay modes (8 bytes) — 0=Latch, 1=Pulse
    uint8_t relay_pri_high_mode;      // Analog: pri high relay / Digital: pri fault relay
    uint8_t relay_sec_high_mode;      // Analog: sec high relay / Digital: sec fault relay
    uint8_t relay_pri_low_mode;       // Analog: pri low relay
    uint8_t relay_sec_low_mode;       // Analog: sec low relay
    uint8_t reserved_relay[4];

    // Space reserved for future 32-bit values
    uint32_t reserved_uint32[4];  // 16 bytes

    // Custom name (16 bytes)
    char name[16];              // Null-terminated, max 15 chars

    // Units string (8 bytes)
    char units[8];              // Null-terminated, max 7 chars (e.g. "psi", "°C", "L/m")

    // Padding to 128 bytes
    uint8_t padding[24];
} input_config_t;

// System configuration structure (128 bytes)
typedef struct
{
    // Clock/timing (16 bytes)
    uint8_t clock_enabled;
    uint8_t menu_timeout;       // Menu timeout in seconds
    uint16_t runtime_hours;     // Set runtime hh:mm
    uint16_t runtime_minutes;
    uint8_t end_runtime_mode;   // Relay mode for end runtime
    uint8_t relay_pulse_time;   // Relay pulse duration (1-120 seconds)
    uint8_t config_flags;       // Bit flags for system options (future use)
    uint8_t reserved_time[7];

    // Display settings (16 bytes)
    uint8_t contrast;               // LCD contrast (3-10)
    uint8_t brightness;             // LCD brightness, 1-10 -> 10-100%
    uint16_t power_fail_delay;      // Power fail delay (seconds)
    uint8_t power_failure_flag;     // 1=power failure occurred, 0=normal
    uint8_t active_stop_code;       // Latched stop code (persists across power cycles)
    uint8_t reserved_display[10];

    // Digital input config (16 bytes)
    // DIG2-4 carried a second, unreachable fault-monitoring feature here
    // (enable / polarity / relay mode each, menu 6, stop codes 10-12).
    // The pins already belong to the sensor inputs - see
    // read_digital_input() in main.c - so wiring it up would have
    // double-booked them. Removed Ver 3 Rev 71; the bytes stay reserved
    // so system_config_t remains 128 and stored configs still load.
    uint8_t reserved_dig_cfg[9];
    uint8_t reserved_digital[7];

    // Logging (16 bytes)
    // was log_entries - the log concept was dropped. The bytes are kept so
    // system_config_t stays exactly 128: removing them shifts every field
    // after this point and trips the size assert in eeprom.c.
    uint16_t reserved_log_entries;
    uint8_t reserved_log[14];

    // Padding to 128 bytes
    // ---- Failure log, offsets 64-81 ---------------------------------
    // Read over the debug connector on a unit returned for repair. Units are
    // sealed, so this is the ONLY diagnostic path once a display has failed -
    // and a display failure is undetectable from this end, because the link to
    // the display board is one-way with no ACK.
    //
    // Counters and a short ring, NOT a journal. The event log removed in Rev 36
    // was abandoned for the weight of its on-screen VIEWER - menu items, index
    // renumbering, an external EEPROM - not for the value of the record. This
    // keeps the record and none of the viewer.
    uint16_t boot_count;         // 64-65  power-ups, saturating
    uint8_t  cnt_brownout;       // 66     RCON said brown-out
    uint8_t  cnt_int_error;      // 67     RCON said watchdog / internal error
    uint8_t  cnt_rtc_fault;      // 68     timebase judged implausible
    uint8_t  cnt_low_volts;      // 69     supply guard tripped
    uint8_t  cnt_loop_fault[3];  // 70-72  NAMUR open/short, per input
    uint8_t  stop_ring[8];       // 73-80  last 8 stop codes, oldest overwritten
    uint8_t  stop_ring_pos;      // 81     next write position, 0-7
    uint8_t  padding[46];        // 82-127
} system_config_t;

// EEPROM addresses
#define EEPROM_INPUT_BASE 0x00
#define EEPROM_SYSTEM_BASE 0x180   // After 3 × 128 = 384 bytes
#define EEPROM_CHECKSUM_ADDR 0x200 // After system config

// Raw EEPROM access - used by the event log, which owns 0x202-0x3FF
uint8_t eeprom_read_byte(uint16_t address);
void eeprom_write_byte(uint16_t address, uint8_t data);
uint16_t eeprom_read_word(uint16_t address);
void eeprom_write_word(uint16_t address, uint16_t data);

// Function prototypes
void eeprom_init(void);
void save_current_config(void);
void save_input_config(uint8_t input_num);
void save_system_config(void);
void save_power_flags(void);
void factory_reset(void);
void load_factory_defaults(void);

// Per-sensor-type defaults. Indexed by sensor_type (0-5). Holds only the
// fields that are meaningful to a sensor type — the values that would be
// nonsense if carried over from a different sensor (a pressure span on a
// temperature input, a low-pressure trip timer on a flow switch, etc).
typedef struct
{
    int16_t scale_4ma;
    int16_t scale_20ma;
    int16_t high_setpoint;
    int16_t low_setpoint;
    uint16_t primary_high_bypass;
    uint16_t secondary_high_bypass;
    uint16_t primary_low_bypass;
    uint16_t secondary_low_bypass;
    uint8_t relay_pri_high_mode;
    uint8_t relay_sec_high_mode;
    uint8_t relay_pri_low_mode;
    uint8_t relay_sec_low_mode;
    uint8_t fault_polarity;
    const char *name;
    const char *units;
} sensor_defaults_t;

extern const sensor_defaults_t sensor_type_defaults[7];

// Reset every sensor-dependent field of input `idx` to the defaults for
// sensor type `st`. `enable` is deliberately left untouched.
void apply_sensor_type_defaults(uint8_t idx, uint8_t st);
void sync_menu_variables(void);

uint8_t get_menu_timeout_seconds(void);

// External variables that other files can access
extern input_config_t input_config[3];
extern system_config_t system_config;

#endif
