# Irrisys PumpGuard — Open Items

Running list of things to fix or validate before release. Worked through one at
a time; move an item to **Done** with the revision it landed in, or to
**Decided** if the answer was "leave it".

Last updated: 2026-09-01 · firmware Ver 3 Rev 73

---

## Needs hardware validation

These are written and building, but unproven on a board. Highest risk first.

- [ ] **Watch Dog against a real receiver.** Confirm the pulse width the radio
      receiver actually produces is caught reliably by the 1 ms ISR sampling.
- [ ] **`ADC_VREF_MV` on the replacement PIC.** 4119 was calibrated against the
      *old* chip's FVR. Part-to-part tolerance shifts both the pressure readings
      and the supply trip point together. Re-check 20.00 mA against the loop
      tester — one measurement confirms both.
---

## Decisions needed

- [ ] **The RTC driver targets the wrong part.** The fitted device is an
      **RV-3028-C7** (Micro Crystal, 1ppm TCXO) at I2C **0x52**; `rtc.h` still
      defines `RTC_I2C_ADDR 0x68` and `rtc_init()` writes DS3231 control
      register `0x0E = 0x00` to enable the 1Hz SQW. That write cannot be ACKed
      by an RV-3028, so **`rtc_init()` is inert** and the 1Hz reaching RB0 must
      be coming from the RTC's own non-volatile CLKOUT configuration, not from
      anything the firmware does.
      **Why it matters:** a replacement RTC fitted with factory-default CLKOUT
      would not produce 1Hz, and the failure would present as a firmware fault
      - no clock, no bypass countdowns. Confirm by reading the boot line on the
      debug UART: `RTC OK` or `RTC FAIL`. Fix is to rewrite `rtc.c` for the
      RV-3028 so a fresh part configures itself.

- [ ] **Is the PCA9535 still fitted?** If not, `pca9535.c` goes entirely — only
      `init`, `led_init` and `led_test` are called, and CLAUDE.md already calls
      the part legacy.
- [ ] **Sensor-type defaults for types 2–5 are placeholders.** (0 Pressure and
      1 Temperature are confirmed - Temperature fine-tuned in Rev 73.) Flow Meter, Flow
      Switch, Other 4-20, Other Switch. Types 3–5 currently have **all bypass
      timers 0**, which means "not monitored" — such an input cannot trip the
      pump at all until timers are set deliberately.

---

## Decided

- [x] **Run clock does not resume the remaining time after a power cycle.**
      Confirmed by inspection 2026-09-01: `run_timer_secs` is RAM-only and is
      reloaded from `system_config.runtime_hours/minutes` on the STOP -> RUN
      edge, so a restart always runs the **full set time**. The stale countdown
      visible between boot and restart is display only.
      **Accepted as-is for this release.** It is a genuine over-application risk
      for `Rly Endrun = Pulse` sites, where the farmer can restart remotely by
      phone or radio and therefore never sees the display and cannot edit the
      time before starting. With `Latch` the operator must attend the pumpshed,
      sees the run time and can adjust it, so the behaviour is correct there.
      Post-release fix if wanted: persist the remaining minutes at 10-minute
      granularity (~6 writes/hour, roughly 10 years of EEPROM life) and resume
      it **only** when `power_failure_flag` shows the last stop was an outage
      rather than a normal end of runtime. Do not offer it as a menu setting.

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

- [ ] **`init_numeric_editor` is now dead** (compiler-confirmed). The three-digit
      editor has no remaining callers — every field moved to whole-number or
      two-pair editing.
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
- [x] **`Rly Pulse` truncated silently** — Rev 64. Moving it onto the two-pair
      MM:SS editor in Rev 59 let it dial up to 99:59, but
      `system_config.relay_pulse_time` is a **uint8_t** limited to 1-120 s, so
      anything above 02:00 wrapped: 05:00 saved as **44 seconds** while the menu
      still read 05:00. Now clamped in the editor (so it stops at 02:00 under
      the operator's hand) and again on save. Found by inspection, not testing.
- [x] **DIG2-DIG4 dead feature removed** — Rev 71. Not a choice in the end:
      the pins already belong to the sensor inputs via `read_digital_input()`,
      so wiring up the second design would have double-booked them - two fault
      paths on one contact with different polarity and relay settings. Menu,
      draw/save functions, edit flags and all branches deleted; the nine EEPROM
      bytes kept as `reserved_dig_cfg[9]` so stored configs still load.
      `OPT_DIG_POLARITY` KEPT - `menu_item_options[]` is indexed positionally.
      Program 91.1% -> 88.8%.
- [x] **Setpoint range** — Rev 72. Was hard-coded 0..999, so any NEGATIVE
      setpoint snapped to zero on the first detent (Temperature -10 became
      000). Now derived from the input's own Scale 4mA/20mA, and the stored
      value is clamped into range on entry.
- [x] **Number formatting** — Rev 73. The row printed `%03d` and the editor
      `-%03d`, so a value changed width when you pressed the button (-10 vs
      -010). Both use `%d` now: sign only when negative, no zero padding.
      Temperature setpoints floored at -10 regardless of scale, defaults
      high 85 -> 65 and low -10 -> -5.
- [x] **Flow Meter units** — Rev 70. Settled as `%` (code was right, the docs
      were wrong), list is now `%` / `LpM` / `LpS`. Found while settling it: the
      units row was tagged `FT_CUSTOM_UNITS` for **every** analog type, so all
      three fixed unit lists were unreachable and Pressure could be labelled
      any three letters. Option list for types 0/1/2 now, free text only for
      Oth 4-20.
- [x] **Range-limit beep** — Rev 67-69. 300ms single tone when a detent is
      refused, latched to once per rail. Rev 69 stopped the 1ms menu tick
      truncating it on the following detent, which had made it sound
      shorter the faster you spun.
- [x] **Bypass timers save** — Rev 59 two-pair editor. Verified on hardware
      2026-09-01: PLPBP set to 99:00, power cycled, read back correctly. That
      exercises the whole chain — editor, `time_xx * 60 + time_yy`, dirty flag,
      deferred EEPROM write and reload.
- [x] **`Rly Dwell` editor** — Rev 66. The two-pair editor left the row showing a
      mix of the old 3-digit format and MM:SS. Its minutes pair could only ever
      read 00-02, so the button step between pairs bought nothing. Now one whole
      value clamped 1-120, displayed MM:SS, like Menu T/O.
- [x] **Brightness control** — Rev 63. Verified 1-10 with live backlight,
      2026-09-01.
- [x] **Run Time / clock editing** — Rev 59 two-pair editor verified.
- [x] **UTILITY menu, sensor-type mapping, reordered input menu** — all
      verified on hardware 2026-08-31/09-01.
- [x] **Watch Dog trigger modes** — Rev 55. All three (`Edge`, `Hi to Lo`,
      `Lo to Hi`) verified on all three digital inputs, 2026-08-31.
- [x] **Watch Dog PWDBP** — Rev 56. Was clobbered at every pump start: the
      reload block intended for `resume_bp_timers()` had been patched onto the
      tail of `init_bp_timers()` instead (the anchor text appears in both), so
      init set PRIMARY/1800 and then immediately overwrote it with
      SECONDARY/300. Retriggering on every pulse verified at the same time.
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
