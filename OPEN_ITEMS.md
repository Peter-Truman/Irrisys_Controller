# Irrisys PumpGuard — Open Items

Running list of things to fix or validate before release. Worked through one at
a time; move an item to **Done** with the revision it landed in, or to
**Decided** if the answer was "leave it".

Last updated: 2026-08-31 · firmware Ver 3 Rev 46

---

## Needs hardware validation

These are written and building, but unproven on a board. Highest risk first.

- [ ] **`ADC_VREF_MV` on the replacement PIC.** 4119 was calibrated against the
      *old* chip's FVR. Part-to-part tolerance shifts both the pressure readings
      and the supply trip point together. Re-check 20.00 mA against the loop
      tester — one measurement confirms both.
- [ ] **Reordered input menu (Rev 38).** Confirm the new order on the display,
      and — more importantly — that editing each field still writes the field
      you edited. The menu is tag-based so a reorder *should* be safe, but this
      is the `[C8]` class of bug and worth ten minutes.
- [ ] **UTILITY menu after the log removal (Rev 36).** 7 items. Confirm
      `Menu T/O` and `Pwr Detect` each edit their own value.

---

## Decisions needed

- [ ] **DIG2–DIG4 are unreachable.** Config bytes (offsets 32–40), stop codes
      10/11/12 and `menu_draw_digital()` all exist, but nothing sets
      `current_menu = 6`, so an operator cannot configure them at all. Either
      wire it up or delete the dead half. Candidate uses, best first:
      motor-protection trip aux contact; VSD fault relay; tank/dam low level
      (dry-run interlock); phase-failure relay; remote start permissive;
      sanctioned maintenance bypass keyswitch.
- [ ] **Is the PCA9535 still fitted?** If not, `pca9535.c` goes entirely — only
      `init`, `led_init` and `led_test` are called, and CLAUDE.md already calls
      the part legacy.
- [ ] **Flow Meter units disagree.** Code uses `%`, CLAUDE.md's factory-defaults
      table says `L/M`.
- [ ] **Sensor-type defaults for types 2–5 are placeholders.** Flow Meter, Flow
      Switch, Other 4-20, Other Switch. Types 3–5 currently have **all bypass
      timers 0**, which means "not monitored" — such an input cannot trip the
      pump at all until timers are set deliberately.

---

## Dead code to remove

Compiler-confirmed unused. Cosmetic, but it is 12 functions of noise in a
codebase about to be handed over.

- [ ] `rtc.c` — `rtc_read_register`, `bcd_to_dec`, `dec_to_bcd`, `rtc_set_time`,
      `rtc_read_time`. **The entire RTC time API is unused**: the DS3231 is only
      a 1 Hz interrupt source. Worth asking whether a battery-backed RTC is
      still the right part for that job.
- [ ] `pca9535.c` — `read_register`, `write_register`, `led_on`, `led_off`,
      `led_set`, `led_toggle`, `update_power_led` (see decision above).
- [ ] `i2c.c` — `i2c_restart`, `i2c_read`.
- [ ] `lcd.c` — `disp_set_contrast`.
- [ ] `menu.c` — `lcd_clear_line`.

---

## Housekeeping

- [ ] **`Rly Pulse` still uses the digit editor** while its UTILITY neighbours
      edit in whole seconds. Inconsistent.
- [ ] **Reset `FW_REVISION` to 0** immediately before the release build.
- [ ] **`build.bat` (MELabs) should probably be deleted.** The U2's Vpp driver
      is dead (7 V against the 8–9 V required); leaving the script invites
      someone to use it and lose another half day.

---

## Done

- [x] **Supply guard trip path** — Rev 46/47. Proven on hardware 2026-08-31 by
      temporarily raising `VDD_MIN_MV` to 5200: trip, **latched** relay (not
      pulsed), alarm, `Low Volts`, acknowledge clearing it, and re-trip all
      confirmed. Threshold restored to 4750 in Rev 47.
      **Not testable at the real threshold on this board** — the 5 V regulator
      holds until the 24 V is nearly gone and DIG_IN1 drops out well before
      that, so the box is never in RUN when VDD genuinely sags. The guard
      therefore covers 5 V-side failure (dying regulator, overloaded rail),
      not a failing 24 V supply — which stops the pump on its own.
- [x] **Reset cause reporting** — Rev 42-45. `RCON` classified at boot into
      power-on / brown-out / internal error, shown top-right in RUN and STOP,
      **information only** — never used for control, since PumpGuard cannot
      start a pump. Observed `RCON=0x1C POWER-ON`: bench collapses go past the
      POR threshold rather than stopping in the BOR band.
- [x] **Analog input menu reorder** — Rev 38. Low-pressure items before high
      throughout: both setpoints together (low first), then low bypasses, then
      high bypasses, then relay modes in the same low-first order. From the team
      ballot, 2026-08-30.
- [x] **Factory reset confirmation** — Rev 39. Two stages: hold through
      power-up (`Keep holding: 5`), then an explicit `Erase ALL settings? /
      Hold to confirm: 3`. Release at any point cancels. **Verified on
      hardware 2026-08-30.**
- [x] **Hidden factory reset** — Rev 37. Hold the encoder button through
      power-up for 5 s, countdown shown, release cancels. `factory_reset()`
      existed but had no caller.
- [x] **Supply guard against FVR dropout** — Rev 37. `read_vdd_mv()` converts
      the FVR against VDD; below 4600 mV in RUN it takes an immediate latched
      stop, code 23, `Low Volts` on line 1. BOR also raised 1.9 V → 2.85 V.
- [x] **Event log removed** — Rev 36. Program space 92.3% → 81.5%.

---

## Checked, no action

- **Watchdog is cleared only in the main loop.** Verified: the ISR
  (`encoder.c`) calls `isr_high`/`isr_low` and neither contains `CLRWDT`. The
  other three sites are `delay_ms_wdt()` and `rtc_init()` — both boot-only — and
  `eeprom_write_block()`, which runs at runtime but is load-bearing (a
  four-block save is ~2 s against a 2.05 s window). `WDTEN = ON` in hardware, so
  firmware cannot switch it off. A watchdog reset latches the relay open and
  requires acknowledgement.
- **The 1 Hz tick does not lose seconds.** `rtc_tick_count` is a saturating
  counter incremented in the INT0 handler; the main loop snapshots-and-clears it
  with `GIE` disabled and runs one full cycle per pending tick. Bypass
  countdowns stay accurate across a slow pass. *(An earlier review of mine said
  otherwise — that was read from stale `src/*.pre` build artifacts, not the
  source.)*
