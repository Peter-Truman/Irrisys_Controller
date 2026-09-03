# Irrisys PumpGuard — Open Items

Running list of things to fix or validate before release. Worked through one at
a time; move an item to **Done** with the revision it landed in, or to
**Decided** if the answer was "leave it".

Last updated: 2026-09-01 · firmware PG-Ver_B-1.1.3

---

## Needs hardware validation

These are written and building, but unproven on a board. Highest risk first.

- [ ] **RV-3028 path has never run on a PIC.** Written in Rev 79 from the
      bench-proven sequence in Docs/RV3028_CLKOUT.md, but this board has a
      DS3231, so the branch is unreachable here and untested end to end.
      Test on Rev 2 bring-up, or by putting one RV-3028 on this bus.
      Also confirm the reasoned-but-unobserved claim in that document: an
      unconfigured RV-3028 feeds **32.768 kHz** into INT0, which shares the
      single non-prioritised ISR with the 1 ms Timer0 poll - about one
      interrupt every 244 instruction cycles. Whether the main loop still
      runs under that load determines what a field failure looks like.
      That document also records one **unexplained** bench result: a first
      board never showed 1 Hz despite correct registers. Probe contact is
      the likely cause but was not proven.
- [ ] **Watch Dog against a real receiver.** Confirm the pulse width the radio
      receiver actually produces is caught reliably by the 1 ms ISR sampling.
---

## Decisions needed

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

## Housekeeping

- [ ] **`main()` is 1288 lines** and `menu_handle_button()` 615. The single
      biggest barrier to another developer supporting this. Not a release
      blocker; a deliberate refactor, not something to attempt on the way out.
- [ ] **Per-menu capability lists must be updated by hand.** Adding an option
      field to a menu that never had one caused THREE separate faults in
      1.1.x - the option-confirm branch, the editor draw row, and the OPTIONS
      visibility rule. None mention a line number, so careful renumbering does
      not catch them. A tag-driven dispatch (as the INPUT menu already uses)
      would make the whole class impossible.
- [ ] **Delete stale build artifacts** for removed modules - `ad7994`,
      `eventlog`, `pca9535` `.pre`/`.p1`/`.d` still in `src/`. They mislead:
      reading one produced a wrong conclusion about the RTC tick earlier.
- [ ] **Check peak stack** in the map file before release. Data is at 74%.


- [ ] **Strip the event-time UART lines at the release build.** Units ship
      sealed, so anything printed when an event happens goes into a
      disconnected connector and is never read. Only the BOOT-time output
      (banner, RTC report, fault log) is ever seen, because that is when a
      returned unit is powered up on the bench. Worth ~1% of program space.
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
- [x] **4-20mA loops validated** — 2026-09-02. Checked against a proper loop
      tester on the replacement PIC: correct across the range and unaffected
      by supply voltage, which also confirms `ADC_VREF_MV` 4119 still holds
      for this part and that the FVR reference is doing its job (readings do
      not track the 5V rail).
- [x] **Clock Enable reachable by the operator** — 1.1.0-1.1.3. Was in SETUP
      only, two menus from Run Time. Now the first item of OPTIONS > Clock,
      and OPTIONS always lists Clock so the control cannot hide its own
      off-switch.
- [x] **Variable overrun scan** — two clamp-after-narrow bugs fixed (Run Time
      load, `init_time_editor`). Save-side casts, array indices from EEPROM
      and string buffers all verified bounded. No dynamic allocation anywhere,
      so memory leaks are impossible by construction.
- [x] **Versioning scheme replaced** — `PG-Ver_B-1.0.0`. `FW_VERSION` and
      `FW_REVISION` retired entirely; no build counter, so nothing to reset
      before a release. `Ver_B` is the hardware GENERATION and changes only
      if the board does - no PCB revision is named, because the 100R/220R
      burdens existed only on three bench prototypes that will never reach a
      customer. Issues and changes are tracked in the repo instead.
- [x] **Bypass timer semantics** — Rev 91-92. `0` is now a DELAY of zero and
      nothing else. It used to also mean "not monitored" when the setpoint was
      0 as well, so an operator setting both timers to 0 for a faster trip got
      no protection instead. Attribution fixed too: a fault present at pump
      start now reports the PRIMARY code, not the secondary. Both verified on
      hardware 2026-09-02.
- [x] **Sensor-type defaults settled** — Rev 90-93. Pressure high pair 0/0,
      Temperature 65/-5 with SHTBP 30, Flow Meter high 85 + 10/2, Flow Switch
      10/5, Other 4-20 high 85 with all timers 1. The 85s are forcing
      functions: an unconfigured input must not sit silently unmonitored.
- [x] **RTC plausibility + Timer0 fallback** — Rev 80-82. Timer0 bounds the RTC
      and vice versa; `RTC Fail` latches on no tick for 2s or a flood, and the
      1s tick then comes from Timer0 so bypass protection keeps running.
      Line 1 alternates `RTC Fail` / `PIC Clock`.
- [x] **Boot trimmed to a 5s budget** — Rev 83. The splash absorbs init cost
      rather than adding to it, so changes to init no longer lengthen the boot.
- [x] **Debug instrumentation removed** — Rev 84. `DEBUG_STREAM` heartbeat,
      EEPROM dump and six trace lines. Program 93.6% -> 89.7%.
- [x] **Failure log** — Rev 85-89. 18 bytes in existing padding; counters plus
      the last 8 stop codes, dumped at boot AND viewable in UTILITY > Fault
      Log. Survives a factory reset deliberately. Fixed the unwritten region
      reading 255 on units configured before Rev 85.
- [x] **RTC driver reworked for both boards** — Rev 77-79. A bus scan settled
      which part is fitted: **0x68 answers, nothing at 0x52**, so this Rev 1
      board carries the DS3231MZ+ the BOM says, and `rtc_init()` was never
      inert - its control write is what creates the timebase. (I had claimed
      the opposite and deleted it in Rev 75; it survived only because the
      register is held up by the backup cell. Restored.)
      The driver now **detects the part at runtime** - 0x68 DS3231 (Rev 1),
      0x52 RV-3028 (Rev 2) - so one hex file runs on both boards and nobody
      has to match a build to a board by hand, which is the one defence the
      4-20mA burden hazard has and is easy to get wrong twice.
      Both paths verify: DS3231 reads its control register back and reports
      OSF; RV-3028 reads CLKOUT, writes only if it differs (finite EEPROM
      endurance), then forces a refresh and re-reads to prove the value
      reached EEPROM rather than only the RAM mirror. Single-byte command
      `21h`, not the block update - it cannot reach the password registers.
      Sequence and citations: [Docs/RV3028_CLKOUT.md](Docs/RV3028_CLKOUT.md).
- [x] **PCA9535 removed** — Rev 74. Confirmed not fitted on Ver B Rev 2.
      `pca9535.c`/`.h` deleted, boot self-test removed, dropped from all
      three build scripts.
- [x] **Dead functions removed** — Rev 74. The whole RTC time API, plus
      `i2c_restart`, `i2c_read`, `disp_set_contrast`, `lcd_clear_line`,
      `init_numeric_editor` and every matching header declaration. No
      "never called" warnings remained. **`i2c_read` and `i2c_restart` were
      then restored in Rev 77** - reading an RTC register needs both. A fair
      argument for doing the dead-code sweep last, not mid-stream.
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
