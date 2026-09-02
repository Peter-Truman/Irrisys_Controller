// rtc.c - 1Hz timebase driver, supports BOTH board revisions
//
// See rtc.h for the Rev 1 / Rev 2 hardware difference and why this detects the
// part at runtime instead of being compiled per board.

#include "../include/rtc.h"
#include "../include/i2c.h"
#include "../include/config.h"
#include <stdio.h>
#include <xc.h>

extern void uart_println(const char *str);

// Which RTC answered. Set by rtc_init(), reported on the debug UART.
uint8_t rtc_part = RTC_PART_NONE;

// ---------------------------------------------------------------------------
// Low level
// ---------------------------------------------------------------------------

// Does a device ACK at this 7-bit address? Address byte only, nothing written.
static uint8_t i2c_ack_at(uint8_t addr)
{
    if (i2c_start())
        return 0;
    uint8_t nak = i2c_write((uint8_t)((addr << 1) | 0));
    i2c_stop();
    return nak ? 0 : 1;
}

uint8_t rtc_write_register(uint8_t addr, uint8_t reg, uint8_t value)
{
    if (i2c_start())
        return 1;
    if (i2c_write((uint8_t)((addr << 1) | 0)))
    { i2c_stop(); return 1; }
    if (i2c_write(reg))
    { i2c_stop(); return 1; }
    if (i2c_write(value))
    { i2c_stop(); return 1; }
    i2c_stop();
    return 0;
}

uint8_t rtc_read_reg(uint8_t addr, uint8_t reg, uint8_t *value)
{
    if (i2c_start())
        return 1;
    if (i2c_write((uint8_t)((addr << 1) | 0)))
    { i2c_stop(); return 1; }
    if (i2c_write(reg))
    { i2c_stop(); return 1; }
    if (i2c_restart())
    { i2c_stop(); return 1; }
    if (i2c_write((uint8_t)((addr << 1) | 1)))
    { i2c_stop(); return 1; }

    *value = i2c_read(0);   // 0 = NAK, this is the last byte
    i2c_stop();
    return 0;
}

// ---------------------------------------------------------------------------
// Scan: report every device on the bus.
//
// An earlier version returned the first hit and stopped, which found the
// M24M01 at 0x50 and never reached the RTC at all. Read-only.
// ---------------------------------------------------------------------------
void rtc_scan(void)
{
    char b[44];
    uint8_t found = 0;

    for (uint8_t a = 0x08; a <= 0x77; a++)
    {
        CLRWDT();
        if (!i2c_ack_at(a))
            continue;

        const char *who = "?";
        if (a == RTC_ADDR_DS3231)         who = "DS3231 RTC (Rev 1)";
        else if (a == RTC_ADDR_RV3028)    who = "RV-3028 RTC (Rev 2)";
        else if (a >= 0x50 && a <= 0x53)  who = "M24M01 memory (Rev 1, unused)";
        else if (a >= 0x58 && a <= 0x5B)  who = "M24M01 ID page (Rev 1)";

        sprintf(b, "I2C 0x%02X  %s", a, who);
        uart_println(b);
        found++;
    }

    if (!found)
        uart_println("I2C: no devices responded");
}

// ---------------------------------------------------------------------------
// DS3231 (Rev 1): the control register IS the timebase.
//
// Power-on default is 0x1C - INTCN=1, so the SQW pin is in alarm-interrupt
// mode and there is no square wave at all. Writing 0x00 clears INTCN and sets
// RS1:RS0 = 00, selecting 1Hz. This write is not housekeeping; without it the
// controller has no tick.
//
// Read back, because a NAKed write is otherwise indistinguishable from a good
// one and the failure would surface later as a dead runtime clock and dead
// bypass countdowns - i.e. as a firmware fault.
// ---------------------------------------------------------------------------
static uint8_t ds3231_start_1hz(void)
{
    char b[48];
    uint8_t ctrl = 0xFF, status = 0xFF;

    if (rtc_write_register(RTC_ADDR_DS3231, DS3231_REG_CONTROL, 0x00))
    {
        uart_println("RTC: DS3231 control write FAILED - no 1Hz tick");
        return 1;
    }

    if (rtc_read_reg(RTC_ADDR_DS3231, DS3231_REG_CONTROL, &ctrl))
    {
        uart_println("RTC: DS3231 control read-back FAILED");
        return 1;
    }

    (void)rtc_read_reg(RTC_ADDR_DS3231, DS3231_REG_STATUS, &status);

    // OSF (status bit 7) latches if the oscillator has stopped since it was
    // last cleared - i.e. backup power was lost, so the tick may have been
    // missing for a while.
    sprintf(b, "RTC: DS3231 ctrl=0x%02X status=0x%02X%s", ctrl, status,
            (status & 0x80) ? "  OSC-STOPPED" : "");
    uart_println(b);

    if (ctrl != 0x00)
    {
        uart_println("RTC: 1Hz NOT enabled - control did not take");
        return 1;
    }

    uart_println("RTC: DS3231 1Hz enabled (Rev 1 board)");
    return 0;
}

// ---------------------------------------------------------------------------
// RV-3028 (Rev 2): CLKOUT is set by a NON-VOLATILE configuration register.
//
// Everything here comes from Docs/RV3028_CLKOUT.md, which cites the RV-3028-C7
// Application Manual Rev 1.4 section by section and was proven on a bench rig.
// Do not re-derive it from memory.
//
// WHY THIS IS MANDATORY, not a nice-to-have. A factory-default RV-3028 does NOT
// go silent - it drives 32.768kHz from CLKOUT the moment it powers up (CLKOE=1,
// FD=000, measured on two untouched parts). That is the opposite failure to the
// DS3231, whose default leaves SQW in alarm mode with no output at all:
//
//   DS3231 unconfigured  -> no tick. Clock stops dead.
//   RV-3028 unconfigured -> tick 32768x too fast. A 5:00 bypass expires in ~9ms
//                           and the runtime clock is meaningless.
//
// The second is far more dangerous, and it presents as the opposite of what a
// debugger would expect to find.
//
// FD=101 also matters beyond the frequency: only the DIVIDED outputs pass
// through the factory offset compensation, so 1Hz is where the part's 1ppm
// specification actually lives. The 32.768kHz default is the raw oscillator tap
// and is not compensated.
// ---------------------------------------------------------------------------

// Poll the EEbusy flag. Single-byte write is ~16ms, refresh ~3.5ms; the manual
// says poll rather than assume. Returns 0 when idle, 1 on timeout.
static uint8_t rv3028_wait_idle(void)
{
    uint8_t st = 0xFF;

    for (uint8_t i = 0; i < 100; i++)   // 100ms ceiling, ~6x the worst case
    {
        CLRWDT();
        if (rtc_read_reg(RTC_ADDR_RV3028, RV3028_REG_STATUS, &st))
            return 1;
        if ((st & 0x80) == 0)
            return 0;
        __delay_ms(1);
    }
    return 1;
}

static uint8_t rv3028_start_1hz(void)
{
    char b[52];
    uint8_t clkout = 0xFF;

    if (rtc_read_reg(RTC_ADDR_RV3028, RV3028_REG_EE_CLKOUT, &clkout))
    {
        uart_println("RTC: RV-3028 CLKOUT read FAILED");
        return 1;
    }

    sprintf(b, "RTC: RV-3028 CLKOUT=0x%02X", clkout);
    uart_println(b);

    // Already configured. Do NOT write: the configuration EEPROM has finite
    // endurance, so a unit must never be rewritten on every boot.
    if (clkout == RV3028_CLKOUT_1HZ)
    {
        uart_println("RTC: RV-3028 1Hz already set (Rev 2 board)");
        return 0;
    }

    uart_println("RTC: configuring RV-3028 CLKOUT for 1Hz (one time)");

    if (rv3028_wait_idle())
    { uart_println("RTC: EEbusy stuck before write"); return 1; }

    // EERD=1 disables the internal 24-hour auto-refresh, which would otherwise
    // collide with the command sequence.
    if (rtc_write_register(RTC_ADDR_RV3028, RV3028_REG_CONTROL1, 0x08))
    { uart_println("RTC: EERD set FAILED"); return 1; }

    // Name the target byte and stage its data. Using the single-byte command
    // rather than the block update is deliberate: a block update commits all of
    // 0x30-0x37 from the RAM mirror, and one corrupt byte at 0x30 would
    // permanently write-protect the part. WRITE1 physically cannot reach the
    // password registers.
    if (rtc_write_register(RTC_ADDR_RV3028, RV3028_REG_EEADDR, RV3028_REG_EE_CLKOUT) ||
        rtc_write_register(RTC_ADDR_RV3028, RV3028_REG_EEDATA, RV3028_CLKOUT_1HZ))
    { uart_println("RTC: EEADDR/EEDATA FAILED"); return 1; }

    // The 0x00 is mandatory - the real command is ignored without it.
    if (rtc_write_register(RTC_ADDR_RV3028, RV3028_REG_EECMD, RV3028_EECMD_FIRST) ||
        rtc_write_register(RTC_ADDR_RV3028, RV3028_REG_EECMD, RV3028_EECMD_WRITE1))
    { uart_println("RTC: EECMD write FAILED"); return 1; }

    if (rv3028_wait_idle())
    { uart_println("RTC: EEPROM write timed out"); return 1; }

    (void)rtc_write_register(RTC_ADDR_RV3028, RV3028_REG_CONTROL1, 0x00);

    // The RAM mirror is the ACTIVE zone - an EEPROM write alone changes nothing
    // until a refresh, so set it explicitly as well.
    if (rtc_write_register(RTC_ADDR_RV3028, RV3028_REG_EE_CLKOUT, RV3028_CLKOUT_1HZ))
    { uart_println("RTC: CLKOUT mirror write FAILED"); return 1; }

    // Prove it reached EEPROM and not just RAM. Writing only the mirror reads
    // back identically but is lost at the next refresh, so force one and look
    // at what comes back.
    (void)rtc_write_register(RTC_ADDR_RV3028, RV3028_REG_CONTROL1, 0x08);
    (void)rtc_write_register(RTC_ADDR_RV3028, RV3028_REG_EECMD, RV3028_EECMD_FIRST);
    (void)rtc_write_register(RTC_ADDR_RV3028, RV3028_REG_EECMD, RV3028_EECMD_REFRESH);
    (void)rv3028_wait_idle();
    (void)rtc_write_register(RTC_ADDR_RV3028, RV3028_REG_CONTROL1, 0x00);

    if (rtc_read_reg(RTC_ADDR_RV3028, RV3028_REG_EE_CLKOUT, &clkout))
    { uart_println("RTC: CLKOUT verify read FAILED"); return 1; }

    if (clkout != RV3028_CLKOUT_1HZ)
    {
        sprintf(b, "RTC: CLKOUT DID NOT PERSIST (0x%02X) - tick may be 32kHz", clkout);
        uart_println(b);
        return 1;
    }

    uart_println("RTC: RV-3028 1Hz configured and verified (Rev 2 board)");
    return 0;
}

// ---------------------------------------------------------------------------
// Detect which board this is by which RTC answers, then start its timebase.
//
// This is the point of the rewrite: Rev 1 carries a DS3231MZ+ at 0x68, Rev 2 an
// RV-3028-C7 at 0x52. Detecting rather than #define-ing means ONE hex file runs
// on both boards and nobody has to match a build to a board by hand - the
// mistake the 180R burden change already showed is easy to make.
// ---------------------------------------------------------------------------
uint8_t rtc_init(void)
{
    // Oscillator settling after power-up, watchdog fed throughout.
    for (uint16_t i = 0; i < 250; i++)
    {
        CLRWDT();
        __delay_ms(1);
    }

    if (i2c_ack_at(RTC_ADDR_DS3231))
    {
        rtc_part = RTC_PART_DS3231;
        return ds3231_start_1hz();
    }

    if (i2c_ack_at(RTC_ADDR_RV3028))
    {
        rtc_part = RTC_PART_RV3028;
        return rv3028_start_1hz();
    }

    rtc_part = RTC_PART_NONE;
    uart_println("RTC: NO RTC FOUND - no 1Hz tick, clock and bypasses dead");
    return 1;
}
