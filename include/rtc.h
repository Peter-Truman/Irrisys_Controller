/**
 * RTC Driver - 1Hz timebase, both board revisions
 *
 * The RTC is used ONLY as a 1Hz timebase. Its output drives PIC RB0/INT0;
 * nothing ever reads a date or a time from it. See rtc_tick_count in encoder.c
 * and the 1-second tick in main.c.
 *
 * WHY an external RTC at all: the PIC runs from its internal oscillator at
 * roughly +/-1-2%, which over the 99:59 maximum runtime is up to an HOUR of
 * error. Both RTC parts are far better than that, and the runtime clock is a
 * billable quantity on an irrigation job.
 *
 * BOARD DIFFERENCE
 * ----------------
 *   Rev 1 (development hardware):  DS3231MZ+      at 0x68, SQW -> RB0
 *                                  M24M01E EEPROM at 0x50/0x51 (now unused -
 *                                  the event log that used it was removed)
 *                                  RC2 = EEPROM write protect
 *   Rev 2 (not yet built):         RV-3028-C7     at 0x52, CLKOUT (pin 1) -> RB0
 *                                  no EEPROM, RC2 not connected
 *
 * The part is detected AT RUNTIME by which address ACKs, so one hex file runs
 * on both boards. That matters: this project already carries a hazard that
 * cannot be detected in firmware - the 4-20mA burden resistor - where the only
 * defence is matching a build to a board by hand. Where detection IS possible,
 * use it rather than adding a second thing to get wrong.
 *
 * WARNING for the DS3231 path: the control-register write is not housekeeping.
 * The power-on default (0x1C) leaves SQW in alarm-interrupt mode with NO square
 * wave, so without that write the controller has no tick at all. It survives a
 * power cycle only because the register is held up by the backup cell - which
 * is why deleting it as "dead code" once looked harmless on a running board.
 */

#ifndef RTC_H
#define RTC_H

#include <xc.h>
#include <stdint.h>

// I2C addresses (7-bit)
#define RTC_ADDR_DS3231 0x68   // Rev 1
#define RTC_ADDR_RV3028 0x52   // Rev 2

// DS3231 registers
#define DS3231_REG_CONTROL 0x0E  // INTCN + RS1:RS0 - selects the SQW output
#define DS3231_REG_STATUS  0x0F  // bit 7 = OSF, oscillator stop flag

// RV-3028 registers (App Manual Rev 1.4 - see Docs/RV3028_CLKOUT.md)
#define RV3028_REG_STATUS   0x0E  // bit 7 = EEbusy
#define RV3028_REG_CONTROL1 0x0F  // bit 3 = EERD, disables auto-refresh
#define RV3028_REG_EEADDR   0x25
#define RV3028_REG_EEDATA   0x26
#define RV3028_REG_EECMD    0x27
#define RV3028_REG_EE_CLKOUT 0x35 // RAM mirror of the EEPROM Clkout byte

#define RV3028_EECMD_FIRST  0x00  // mandatory before every real command
#define RV3028_EECMD_WRITE1 0x21  // write ONE byte named by EEADDR
#define RV3028_EECMD_REFRESH 0x12 // reload EEPROM -> RAM mirror

// CLKOE=1, CLKSY=1, PORIE=0, FD=000 -> 32.768kHz. This is how parts ship.
#define RV3028_CLKOUT_DEFAULT 0xC0
// Same, but FD=101 -> 1Hz, and taken from the OFFSET-COMPENSATED divider,
// which is where the part's 1ppm specification actually lives.
#define RV3028_CLKOUT_1HZ     0xC5

// Which part was found
#define RTC_PART_NONE   0
#define RTC_PART_DS3231 1
#define RTC_PART_RV3028 2

extern uint8_t rtc_part;

// Detect the fitted RTC and start its 1Hz output. Returns 0 on success.
uint8_t rtc_init(void);

// Report every device on the I2C bus to the debug UART. Read-only.
void rtc_scan(void);

uint8_t rtc_write_register(uint8_t addr, uint8_t reg, uint8_t value);
uint8_t rtc_read_reg(uint8_t addr, uint8_t reg, uint8_t *value);

#endif // RTC_H
