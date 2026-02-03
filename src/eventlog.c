/**
 * Event Log - M24M01E External I2C EEPROM Driver
 *
 * Circular buffer of stop-reason codes stored on external 1Mbit EEPROM.
 * Newest event at display index 0, oldest at count-1.
 *
 * EEPROM Layout:
 *   0x0000-0x0001: write_index (next write position, 0 to max-1)
 *   0x0002-0x0003: entry_count (total stored, capped at max)
 *   0x0004+:       log entries (1 byte each)
 */

#include "../include/config.h"
#include "../include/eventlog.h"
#include "../include/eeprom.h"
#include "../include/i2c.h"
#include <xc.h>

// M24M01 I2C address (A1=A2=0, lower 64KB block)
#define M24M01_ADDR_W   0xA0
#define M24M01_ADDR_R   0xA1

// EEPROM layout addresses
#define LOG_ADDR_WRITE_IDX  0x0000
#define LOG_ADDR_ENTRY_CNT  0x0002
#define LOG_ADDR_ENTRIES    0x0004

// Cached header values (avoid repeated I2C reads)
static uint16_t write_index;
static uint16_t entry_count;

// Forward declarations
static uint8_t m24m01_read_byte(uint16_t addr);
static void m24m01_write_byte(uint16_t addr, uint8_t data);
static uint16_t m24m01_read_word(uint16_t addr);
static void m24m01_write_word(uint16_t addr, uint16_t data);

// Stop reason strings (indexed by stop code)
static const char *stop_reasons[] = {
    "Unknown",       // 0
    "End RunTime",   // 1
    "In1 Hi BP",     // 2
    "In1 Lo BP",     // 3
    "In2 Hi BP",     // 4
    "In2 Lo BP",     // 5
    "In3 Hi BP",     // 6
    "In3 Lo BP",     // 7
    "Pwr Fail",      // 8
    "Ext Stop",      // 9
    "DIG2 Fault",    // 10
    "DIG3 Fault",    // 11
    "DIG4 Fault"     // 12
};

// =============================================================================
// M24M01 LOW-LEVEL I2C ACCESS
// =============================================================================

static uint8_t m24m01_read_byte(uint16_t addr)
{
    uint8_t data = 0xFF;

    i2c_start();
    if (i2c_write(M24M01_ADDR_W)) { i2c_stop(); return 0xFF; }
    if (i2c_write((uint8_t)(addr >> 8))) { i2c_stop(); return 0xFF; }
    if (i2c_write((uint8_t)(addr & 0xFF))) { i2c_stop(); return 0xFF; }

    i2c_restart();
    if (i2c_write(M24M01_ADDR_R)) { i2c_stop(); return 0xFF; }
    data = i2c_read(0);  // NACK (single byte read)
    i2c_stop();

    return data;
}

static void m24m01_write_byte(uint16_t addr, uint8_t data)
{
    EEPROM_WP = 1;  // Disable write protect

    i2c_start();
    i2c_write(M24M01_ADDR_W);
    i2c_write((uint8_t)(addr >> 8));
    i2c_write((uint8_t)(addr & 0xFF));
    i2c_write(data);
    i2c_stop();

    __delay_ms(5);  // M24M01 write cycle time

    EEPROM_WP = 0;  // Re-enable write protect
}

static uint16_t m24m01_read_word(uint16_t addr)
{
    uint8_t lo = m24m01_read_byte(addr);
    uint8_t hi = m24m01_read_byte(addr + 1);
    return ((uint16_t)hi << 8) | lo;
}

static void m24m01_write_word(uint16_t addr, uint16_t data)
{
    m24m01_write_byte(addr, (uint8_t)(data & 0xFF));
    m24m01_write_byte(addr + 1, (uint8_t)(data >> 8));
}

// =============================================================================
// PUBLIC API
// =============================================================================

void eventlog_init(void)
{
    // Read cached header from external EEPROM
    write_index = m24m01_read_word(LOG_ADDR_WRITE_IDX);
    entry_count = m24m01_read_word(LOG_ADDR_ENTRY_CNT);

    // Sanity check — if EEPROM is blank (0xFFFF) or corrupt, reset
    extern system_config_t system_config;
    uint16_t max = system_config.log_entries;
    if (max == 0) max = 100;

    if (write_index >= max || entry_count > max)
    {
        write_index = 0;
        entry_count = 0;
        m24m01_write_word(LOG_ADDR_WRITE_IDX, 0);
        m24m01_write_word(LOG_ADDR_ENTRY_CNT, 0);
    }
}

void eventlog_write(uint8_t stop_code)
{
    extern system_config_t system_config;
    uint16_t max = system_config.log_entries;
    if (max == 0) return;

    // Write event at current position
    m24m01_write_byte(LOG_ADDR_ENTRIES + write_index, stop_code);

    // Advance write index (circular)
    write_index++;
    if (write_index >= max)
        write_index = 0;

    // Update entry count (cap at max)
    if (entry_count < max)
        entry_count++;

    // Persist header
    m24m01_write_word(LOG_ADDR_WRITE_IDX, write_index);
    m24m01_write_word(LOG_ADDR_ENTRY_CNT, entry_count);
}

uint8_t eventlog_read(uint16_t display_idx)
{
    extern system_config_t system_config;
    uint16_t max = system_config.log_entries;
    if (max == 0 || display_idx >= entry_count) return 0;

    // Map display index (0=newest) to physical index
    uint16_t phys = (write_index + max - 1 - display_idx) % max;
    return m24m01_read_byte(LOG_ADDR_ENTRIES + phys);
}

uint16_t eventlog_count(void)
{
    return entry_count;
}

void eventlog_clear(void)
{
    write_index = 0;
    entry_count = 0;
    m24m01_write_word(LOG_ADDR_WRITE_IDX, 0);
    m24m01_write_word(LOG_ADDR_ENTRY_CNT, 0);
}

const char *eventlog_reason_str(uint8_t stop_code)
{
    if (stop_code > STOP_CODE_MAX)
        return stop_reasons[0];
    return stop_reasons[stop_code];
}
