# Irrisys Controller - Development Instructions

## Project Overview

**Product:** IRRISYS Irrigation Pump Protection System
**Current Firmware:** Ver 3 Rev 93

**Hardware:**
- Display board: IrrisysPG_Ver_B_Display_Rev_2
- Main board: IrrisysPG_MainBrd_Ver_B_Rev_2

**Repository:** Firmware only (GitHub) - Two-board system

---

## System Architecture

The system consists of two boards communicating via serial:

| Board             | MCU                 | Function                                        |
| ----------------- | ------------------- | ----------------------------------------------- |
| **Main Board**    | PIC18F26K22 @ 32MHz | Control logic, ADC, RTC, relay, encoder, EEPROM |
| **Display Board** | PIC18F14K22 @ 8MHz  | LCD display, LEDs, brightness/contrast PWM      |

Communication: Main -> Display via serial (19200 baud, 8N1)

---

## Changelog

| Date       | Board   | FW Ver      | Description                                                                                                                            |
| ---------- | ------- | ----------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| 2026-01-19 | Main    | 3           | Baseline - Knight Rider LED, full menu, AD7994, RTC, EEPROM                                                                            |
| 2026-01-19 | Display | 1           | Initial - LCD driver, LED control, PWM, test harness                                                                                   |
| 2026-02-01 | Main    | 61          | Unified input menu, tag-based fields, 6 sensor types, sensor-specific units, digital inputs, save-on-exit, 4Hz edit flash              |
| 2026-02-01 | Main    | 62          | Back+EXIT on all sub-menus, long press exits to main screen, consistent menu titles, remove duplicate menu beeps (ISR beep only)       |
| 2026-02-01 | Main    | 61          | Suspend unit conversion (preserved in #if 0), fixed display format (psi/C/%), bypass timer clears on threshold reached                 |
| 2026-02-01 | Main    | 61          | RTC 1Hz INT0 as primary clock, remove unused code, End Run flash, encoder accel tuning                                                 |
| 2026-02-02 | Main    | 63          | Remove date/time display, right-justify status msgs & runtime clock, fault LED 2Hz flash, signal LED follows DIG_IN1, remove Set Clock |
| 2026-02-04 | Main    | 64          | Event log on M24M01 external EEPROM, View Log menu                                                                                     |
| 2026-02-06 | Main    | 74          | Name generator for custom sensor names, 11-char limit                                                                                   |
| 2026-02-08 | Main    | 75          | Fix bypass monitoring when both primary/secondary timers are 0, clean alarm display                                                     |
| 2026-02-09 | Main    | Ver_B_Rev_0 | Deferred EEPROM saves (dirty flags), new versioning scheme (Ver_B_Rev_0)                                                               |
| 2026-07-02 | HW      | Ver_B_Rev_2 | **Hardware:** 4-20mA burden R8/R4/R5 100R->**180R** (all 3 ch; briefly 220R, changed 2026-08-22), TVS SMAJ24CA added at J2/J3/J4. Firmware support landed 2026-08-22 (Ver 3 Rev 9). |
| 2026-08-21 | Main    | Ver 3 Rev 1 | Reorder INPUT menu (Enable, setpoints+bypasses, Sensor, Units, Scales, relay modes, Back, EXIT); cursor stays on the edited field across menu rebuilds; sensor-type change now resets all sensor-dependent fields to per-type defaults |
| 2026-08-21 | Main    | Ver 3 Rev 2 | Versioning scheme -> `Ver N Rev N`; LCD cleared at top of `main()`; splash is "Irrisys PumpGuard" / version on lines 2-3; Pressure defaults corrected (20mA=362, SHPBP=1s, Rly SLPBP=Pulse); factory defaults now derived from `sensor_type_defaults[]` |
| 2026-08-21 | Main    | Ver 3 Rev 4 | Main screen: input line flashes while a bypass timer counts, stopping when the value is OK |
| 2026-08-21 | Main    | Ver 3 Rev 5 | Main screen: disabled inputs show "Not Used" |
| 2026-09-03 | Main    | **PG-Ver_B-1.1.3** | **Clock Enable moved to where it is used, plus the versioning scheme.** `clock_enabled` already existed but only in SETUP > Clock, two menus from where Run Time is entered - a farmer who set 1 hour had no way to turn the timer off from the menu he was in, and setting the time to 0 means something else. `Enable` is now the first item of OPTIONS > Clock. Three follow-on faults, all from menu 5 never having had an option field before: the HH:MM editor drew at a hardcoded LCD row (two flashing `Run Time` lines once Enable sat above it - the row now follows the cursor and the label comes from the template); the option-confirm branch listed menus 1 and 3 only, so Enable never wrote its byte; and OPTIONS hid the Clock item when disabled, making it a **one-way door**. Also: dead count-up branch removed (`run_timer_secs++` fed nothing - the display is gated on `clock_enabled`), and two **clamp-after-narrow** bugs fixed where a uint16 was assigned to a uint8 before its range check, so the clamp inspected the already-truncated value |
| 2026-09-02 | Main    | Ver 3 Rev 90-93 | **A bypass timer is a delay, never an off switch.** The fault test was gated on "setpoint non-zero OR either timer non-zero", giving `0` a second, hidden meaning: an operator setting both timers of a direction to 0 - reasonable if he wants an instant trip - silently DISABLED that direction wherever the setpoint was also 0. Both directions are now always evaluated (Rev 91). Also fixed the **attribution**: a zero primary skipped straight to BP_NORMAL, so a fault already present at pump start was reported as SECONDARY, i.e. as a running excursion. Every direction now starts in BP_PRIMARY - a zero primary is a zero-length window, not the absence of one - so a startup fault reports `PHPBP` (Rev 92). Verified on hardware both ways. Defaults revised: Pressure high pair **0/0** (over-pressure has no reason to be tolerated; a user who wants to ride out a spike changes it deliberately), Temperature SHTBP 30, Flow Meter high SP **85** with PHFBP 10 / SHFBP 2, Flow Switch 10/5, Other 4-20 high SP 85 with every timer 1. The 85s are **forcing functions**, not trip points: with no idea what meter is fitted, a default that provokes a stop makes the installer confront the setting rather than leave an input silently unmonitored |
| 2026-09-02 | Main    | Ver 3 Rev 88-89 | **Fault Log in UTILITY.** Same record as the boot dump, on the screen - which covers the common case that the display still works and someone on the phone needs to read out what the box has been through. One entry per line, scrolled with the encoder, clamped at both ends: `Boots`, `Brown Out`, `Int Error`, `RTC Fail`, `Low Volts`, `Loop In1/2/3`, then each recorded stop code oldest-first and numbered. **Viewer only - no clear function**, since a log the operator can clear is one that gets cleared before it is read. UTILITY 7 -> 8 items, so About/Back/EXIT shifted to 5/6/7 ([C8] renumbering). Fixed: the log bytes were padding until Rev 85, so on existing units they read erased EEPROM - every counter showed **255**; now zeroed once, detected via `boot_count == 0xFFFF` |
| 2026-09-02 | Main    | Ver 3 Rev 85-87 | **Failure log.** Units ship sealed, so the debug UART is a bench-only channel and a live stream is worthless - an event printed in January is long gone before the unit reaches the bench. 18 bytes inside the existing `system_config` padding hold counters plus a ring of the last 8 stop codes, dumped at boot. Written from **one** hook that watches state transitions, not from each of the five sites that set a stop code, so a sixth site cannot be missed. **Survives a factory reset on purpose**: a user is quite likely to be told to try a reset before returning a unit, which is exactly when the history matters. `System Started` added as the first line out of the port |
| 2026-09-02 | Main    | Ver 3 Rev 83-84 | **Boot trimmed to a 5s budget; debug instrumentation removed.** The splash now holds until `BOOT_SPLASH_MS` total from power-up rather than a flat 5s on top of ~1.6s of init, so it absorbs init cost instead of adding to it. The debug EEPROM dump moved out of the pre-splash path (~1.3s at 9600 baud) and was then deleted along with the 4Hz `DEBUG_STREAM` heartbeat and six bring-up trace lines. Program 93.6% -> **89.7%** |
| 2026-09-02 | Main    | Ver 3 Rev 80-82 | **RTC plausibility check + Timer0 fallback.** Timer0 and the RTC are independent clocks and neither checked the other. No tick for 2s, or more than 20 ticks in a 10s Timer0 window, latches `RTC Fail`. Both directions are silent and both matter: no tick freezes every bypass countdown, while an unconfigured RV-3028 at 32.768kHz makes a 5:00 bypass expire in ~9ms. Naming the fault is not enough on a protection device, so the 1s tick then falls back to **Timer0** - protection keeps running and it is the runtime figure that becomes approximate, which is the right way round. Line 1 alternates `RTC Fail` / `PIC Clock` so both facts reach the operator. Fixed a false positive: a 1s rate window mistook the drained boot backlog for a flood |
| 2026-09-02 | Main    | Ver 3 Rev 75-79 | **RTC driver reworked; part detected at runtime.** A bus scan settled which RTC is fitted: **0x68 answers, nothing at 0x52**, so the Rev 1 development board carries the DS3231MZ+ its BOM specifies. Its control write (`0x0E = 0x00`) is not housekeeping - the power-on default leaves SQW in alarm mode with **no square wave**, so that write IS the timebase. It was briefly deleted as dead code in Rev 75 and survived only because the register is held up by the backup cell; restored in Rev 77. `rtc_init()` now detects the part by address - **0x68 DS3231 (Rev 1), 0x52 RV-3028 (Rev 2)** - so one hex file serves both boards rather than adding a second thing to match by hand. Both paths verify rather than assume: DS3231 reads its control register back and reports the OSF oscillator-stop flag; RV-3028 reads CLKOUT `35h`, writes only if it differs (finite EEPROM endurance), then forces a refresh and re-reads to prove the value reached EEPROM and not just the RAM mirror. **A factory-default RV-3028 does not go silent - it drives 32.768kHz**, the opposite failure to the DS3231 and the more dangerous one. Sequence, bit layout and manual citations in [Docs/RV3028_CLKOUT.md](Docs/RV3028_CLKOUT.md) |
| 2026-09-01 | Main    | Ver 3 Rev 71 | **Dead DIG2-4 fault feature removed.** A second, unreachable design for the same three pins: per-input enable / polarity / relay mode (EEPROM 32-40), a `menu 6` screen and stop codes 10-12. Nothing ever set `current_menu = 6`, and no main-loop code read the config bytes. The pins already belong to the sensor inputs via `read_digital_input()`, so wiring it up would have double-booked them - two fault paths on one contact with different polarity and relay settings. Bytes kept as `reserved_dig_cfg[9]` so `system_config_t` stays 128 and stored configs still load. `OPT_DIG_POLARITY` deliberately KEPT in `menu_item_options[]`: that array is indexed positionally, so deleting a row would shift every list after it. Program 91.1% -> **88.8%**, data 73.8% -> **72.7%** |
| 2026-09-01 | Main    | Ver 3 Rev 70 | **Fix: Units opened the character editor on every analog type.** The units row was tagged `FT_CUSTOM_UNITS` for Pressure, Temperature and Flow Meter as well as Oth 4-20, so selecting Units gave the 3-character alphabet editor (`< Short=OK Long=X`) and the psi/bar/kPa, C/F and flow lists were **unreachable dead code**. A Pressure input could be labelled any three letters at all. Units are now an option list for types 0/1/2 and free text only for Oth 4-20; an unrecognised stored unit falls back to the first option. Flow list is now `%` / `LpM` / `LpS` |
| 2026-09-01 | Main    | Ver 3 Rev 69 | **Fix: short beeps truncated long ones.** The menu tick (`beep(1)`, fired on EVERY encoder detent) overwrote the buzzer sequencer, so the next detent after a range-limit beep reset `buzzer_ms` from 300 to 1 and cut it off. Turning slowly the beep completed; spinning fast enough to engage acceleration clipped it to a click, which read as the limit beep being inconsistent. `beep()` now ignores a request shorter than the time left on an in-progress beep - length stands in for priority (tick 1ms < button 50ms < limit 300ms < stop 500ms). `beep_double()` is unaffected and still preempts, which is correct: fault-ack and menu-timeout outrank a tick |
| 2026-09-01 | Main    | Ver 3 Rev 67-68 | **Range-limit beep.** A detent that does not move the value now sounds a **300ms** single tone - distinct from the 50ms button click and from the double-beep that means fault-cleared or menu-timeout. Latched, so a continued spin at the rail gives one beep rather than one per detent, and re-armed on entry so a field already at its limit still beeps. The test is on the **value**, not on the clamp: an accelerated 20-step jump that only partly fits still moves the value and stays silent. Applies to every clamped whole-number field; time pairs, option lists and the name editor all wrap, so nothing is ever refused there |
| 2026-09-01 | Main    | Ver 3 Rev 66 | **`Rly Dwell` edits as one whole value.** The two-pair MM:SS editor left the row showing a mix of the old 3-digit format and MM:SS, and its minutes pair could only ever read 00, 01 or 02 - the button step between pairs bought nothing. Now a whole number clamped 1-120 and displayed MM:SS, the same treatment as Menu T/O. UTILITY has no two-pair fields left |
| 2026-09-01 | Main    | Ver 3 Rev 64-65 | **`Rly Pulse` renamed `Rly Dwell`, and a truncation fixed.** Moving the field onto the two-pair MM:SS editor in Rev 59 let it dial 99:59 while `relay_pulse_time` is a `uint8_t` capped at 120s, so 05:00 silently stored as **44s** with the menu still reading 05:00 - now clamped in the editor and again on save. Renamed because the value is not the length of a pulse: a pulsed stop holds the relay open until **DIG_IN1 goes low** and only then for this long, so a VSD holding its run signal high through ramp-down cannot get the pump back. "Pulse" invited setting it long enough to cover the ramp, double-counting what the firmware already does |
| 2026-08-31 | Main    | Ver 3 Rev 61-63 | **Brightness fixed.** Was on the 3-digit numeric editor so it reached 999, the live-update path had no case for it (so the row never changed while the encoder turned, though the value did), and `disp_set_brightness()` was only ever called at boot so a change did nothing until the next power cycle. Now a clamped whole number **1-10 mapping to 10-100%**, applied on every detent. Encoder acceleration disabled on ranges under 20 steps - the 20-per-detent spin slammed short fields straight to the rail |
| 2026-08-31 | Main    | Ver 3 Rev 54-60 | **Watch Dog fixes + time editing.** Fixed **PWDBP never running**: the SWDBP reload meant for `resume_bp_timers()` had been patched onto the tail of `init_bp_timers()` (the anchor text appears in both), so every pump start set PRIMARY then immediately overwrote it. Added a 1s **start blanking** window. All time fields (4 bypass timers, Rly Pulse, Run Time) now edit as **two whole pairs** - minutes, button, seconds, button - with only the live pair flashing; previously bypass timers were a single 0-5999 counter, so 30:00 -> 2:00 took ~84 detents. Main screen shows `WDT PWDBP 29:45`; default name -> `WDT` |
| 2026-08-31 | Main    | Ver 3 Rev 48-53 | **Watch Dog sensor type (6).** External "still moving" signal, e.g. a reed switch on a traveling irrigator wheel radio-linked to the pumpshed. PWDBP startup grace (default 30:00, once per pump start, abandoned by the first pulse) then SWDBP (default 5:00, reloaded by every pulse). Trigger selectable Hi to Lo / Lo to Hi / Edge. Edges captured in the **1ms ISR**, not the main loop, which can block ~2s during an EEPROM save. Rly SWDBP defaults to **Pulse**, Rly PWDBP to Latch. Loop-integrity (`err open`/`err shrt`) now skipped for every digital type. **`Oth Sw` retired** from the selector (type still honoured if stored). Fixed: `BP_NORMAL` from `resume_bp_timers()` tripped a watchdog instantly |
| 2026-08-31 | Main    | Ver 3 Rev 42-47 | **Reset cause + supply guard.** `RCON` classified at boot (power-on / brown-out / internal error) and shown top-right in RUN and STOP as **information only** - never control, since PumpGuard cannot start a pump. "Watchdog" renamed **"Int Error"** in all operator-facing text. Fixed `vdd_alarm` never being cleared (one trip and the guard was spent, and it masked `BrownOut` beneath it). Supply trip path proven on hardware; `VDD_MIN_MV` 4600 -> **4750**, the FVR's own requirement |
| 2026-08-31 | Main    | Ver 3 Rev 39-41 | Factory reset gains a **second confirm stage** (`Erase ALL settings? / Hold to confirm: 3`); debug heartbeat at 4Hz on EUSART2 carrying sequence, VDD, relay pin and raw ADC counts, running through the blocking boot delays too |
| 2026-08-30 | Main    | Ver 3 Rev 38 | **Analog input menu reordered** from the team ballot: Enable, **both setpoints together (low first)**, low bypasses, high bypasses, Sensor, Units, scales, relay modes (low first), Back, EXIT. Low before high throughout - loss of prime is the everyday case on an irrigation pump, over-pressure the rare one. Pure reorder, no size change |
| 2026-08-30 | Main    | Ver 3 Rev 37 | **Supply guard + hidden factory reset.** BOR raised 1.9V -> 2.85V (part max). Firmware now measures VDD by converting the FVR against VDD (`read_vdd_mv()`); below **4600mV** the reference is untrustworthy, so RUN takes an immediate latched stop, code **23**, line 1 shows `Low Volts`. Factory reset restored via a boot gesture: **hold the encoder button through power-up for 5s** (countdown shown, release cancels). Program 81.5% -> 83.4% |
| 2026-08-27 | Main    | Ver 3 Rev 36 | **Event log removed entirely.** Concept abandoned after review. `View Log` / `Clear Log` gone from UTILITY (9 -> 7 items, all indices renumbered); `eventlog.c`/`.h` deleted and dropped from both build scripts; `log_entries` retired to `reserved_log_entries` (byte kept so `system_config_t` stays 128). Program space 92.3% -> **81.5%** |
| 2026-08-26 | Main    | Ver 3 Rev 28-35 | Event log development, **superseded by Rev 36**: 25-entry ring on internal EEPROM, one-entry-per-screen viewer, HH:MM:SS elapsed-time columns, live "time since" counter. Also in this span, and RETAINED: Menu T/O default 30s, range 10s-4min, whole-second editing; Pwr Detect range 2-30s, default 3s |
| 2026-08-26 | Main    | Ver 3 Rev 27 | Remove the **Log Entries** UTILITY item (10 -> 9 items, all later indices renumbered); `log_entries` default 20 -> **25**, no longer operator-adjustable |
| 2026-08-25 | Main    | Ver 3 Rev 26 | UTILITY numeric edit starts on the tens digit (was hundreds, stepping 100 per click) |
| 2026-08-25 | Main    | Ver 3 Rev 22 | Runtime clock takes effect when set mid-run (`reload_run_timer()`) |
| 2026-08-25 | Main    | Ver 3 Rev 21 | UTILITY > **About** re-shows the splash for 5s. Non-blocking (counted down on the 1s tick) so it cannot stall bypass processing; any button press dismisses it early |
| 2026-08-25 | Main    | Ver 3 Rev 20 | Fix: splash drew only its first two lines. Display-board wait 500ms -> 1000ms (it boots in ~1s), and the 5s hold now re-asserts the screen every second so a dropped frame recovers |
| 2026-08-25 | Main    | Ver 3 Rev 19 | Flow Switch default polarity -> **High** (dry contact closes on flow, delivering 24V to the input) |
| 2026-08-25 | Main    | Ver 3 Rev 18 | Splash screen to specified layout: `=` rules on lines 1 and 4, name and `F/W Ver N, Rev NN` centred on 2 and 3. Build date/time moves to the debug UART banner only |
| 2026-08-25 | Main    | Ver 3 Rev 17 | Flow Switch default PNFBP 0 -> 30s (startup no-flow window) |
| 2026-08-25 | Main    | Ver 3 Rev 16 | **Switch menu restructured 13 -> 9 items.** A switch has one fault condition, so it now has one pair of bypass timers (PNFBP/SNFBP) and one pair of relay modes. Previously the fault ran in the HIGH direction as PFBP/SFBP while PNFBP/SNFBP were settable but never read |
| 2026-08-25 | Main    | Ver 3 Rev 15 | Fix: switch polarity setting now names the level at which the condition is PRESENT (was the fault level, i.e. inverted vs the menu wording). Fix: stale edit sub-mode froze option fields intermittently |
| 2026-08-25 | Main    | Ver 3 Rev 14 | Switch inputs show the sensed condition (`Flow`/`No Flow`, `Aux`/`No Aux`) instead of `High`/`Low`, which read as pin levels but were normalised health |
| 2026-08-22 | Main    | Ver 3 Rev 13 | Flow Meter default PLFBP 0 -> 30s (startup low-flow window) |
| 2026-08-22 | Main    | Ver 3 Rev 12 | **Loop integrity (NAMUR NE43):** open/short detection on enabled analog inputs. Immediate stop in RUN; line shows `err open`/`err shrt` in both RUN and STOP |
| 2026-08-22 | Main    | Ver 3 Rev 11 | Calibrate `ADC_VREF_MV` 4096 -> 4119 against a precision loop tester (20mA read 359 of 362); endpoints 179/894 |
| 2026-08-22 | Main    | Ver 3 Rev 10 | Splash line 4 shows build date/time (`__DATE__`/`__TIME__`); same stamp on the debug UART banner |
| 2026-08-22 | Main    | Ver 3 Rev 9 | **Burden 220R -> 180R:** ADC reference back to the internal FVR at **4.096V** (VDD dependence removed), endpoints 180/899. Supersedes Rev 7/8. |
| 2026-08-22 | Main    | Ver 3 Rev 8 | Trim `ADC_VREF_MV` to measured 5.041V rail (endpoints 179/893); round rather than truncate the endpoint calculation |
| 2026-08-22 | Main    | Ver 3 Rev 7 | **220R burden support:** ADC reference FVR 2.048V -> VDD, endpoints 205/1000 -> 180/900, now derived from `ADC_VREF_MV`/`BURDEN_OHMS` with a compile-time range guard. **Incompatible with 100R boards.** |
| 2026-08-21 | Main    | Ver 3 Rev 6 | Fix: clearing a fault mid-run left every bypass direction BP_INACTIVE, disabling all protection for the rest of the run. Monitoring now resumes at BP_NORMAL (primary windows not restarted) |

---

## 4-20mA Front End — Ver_B_Rev_2 (180R burden)

> **Implemented in firmware 2026-08-22 (Ver 3 Rev 9).** This firmware is for
> **180R** boards only.

**Hardware:**
- 4-20mA burden resistors R8/R4/R5 are **180R** on all 3 channels
  (100R on Ver B Rev 0/1; briefly 220R during Rev 2 development).
- Bidirectional TVS (SMAJ24CA) at each loop terminal J2/J3/J4.

**Why 180R.** The burden has to satisfy two competing limits:

| Burden | 20mA develops | Usable reference | Full scale | Over-range headroom |
| ------ | ------------- | ---------------- | ---------- | ------------------- |
| 100R (Rev 0/1) | 2.00V | 2.048V FVR | 20.5mA | none — cannot see 21mA |
| **180R** | **3.60V** | **4.096V FVR** | **22.8mA** | **NAMUR 21mA OK** |
| 204R | 4.08V | 4.096V FVR (at the limit) | 20.1mA | none |
| 220R | 4.40V | **VDD only** — clears both FVRs | 22.7mA | NAMUR 21mA OK |
| 250R (industry std) | 5.00V | VDD, at the rail | 20.0mA | none |

The largest burden that keeps 20mA under the 4.096V FVR is ~204R. **180R clears
it with margin while preserving over-range headroom** — the only value that gets
both a fixed reference and NAMUR fault detection.

220R also works electrically but forces VDD as the reference, because every
reference low enough to sit safely below VDD clips before 20mA. That was the
configuration in Rev 7/8; 180R supersedes it.

**Firmware configuration:**

| Item | Setting | Location |
| ---- | ------- | -------- |
| FVR | **4.096V** (`VREFCON0 = 0b10110000`, FVRS=11) | [main.c](src/main.c) `system_init()` |
| ADC +ref | **FVR** (`ADCON1` PVCFG=10) | [main.c](src/main.c) `adc_read()` |
| Endpoints | `ADC_4MA` 179, `ADC_20MA` 894 (44.7 counts/mA) | [main.c](src/main.c) |

Endpoints are **derived, not hard-coded**:

```c
#define ADC_VREF_MV   4119   // FVR effective mV - CALIBRATED, not nominal 4096
#define BURDEN_OHMS   180    // 4-20mA sense resistor (R8/R4/R5)
#define ADC_COUNTS_AT_MA(ma)                                     \
    ((uint16_t)((((uint32_t)1023 * (ma) * BURDEN_OHMS)           \
                 + (ADC_VREF_MV / 2)) / ADC_VREF_MV))
```

Rounded rather than truncated — plain integer division loses nearly a full count
at the 20mA endpoint. Two compile-time guards (`ADC_20MA <= 1023`,
`ADC_4MA < ADC_20MA`) fail the build if a future burden/reference combination
would clip, so the silent top-of-range saturation failure cannot recur unnoticed.

**FVR requires VDD comfortably above 4.096V.** Bench rail measures 5.041V. If
VDD ever sags near the FVR output the reference stops regulating, so a brown-out
would degrade readings rather than fail cleanly — worth confirming BOR threshold
against the FVR dropout before release.

**Calibration.** `ADC_VREF_MV` is the single calibration point for all three
channels — trim it, never the endpoints.

Calibrated 2026-08-22 against a precision loop tester: at 20.00mA the display
read **359 psi of an expected 362**, placing the true count at 894–895 rather
than the nominal 899. Effective reference is therefore **~4119mV**, +0.6% on the
4096mV nominal, which is inside FVR part tolerance — calibration, not a fault.
`ADC_VREF_MV` is set to **4119** accordingly.

**VERIFIED 2026-08-22** against a precision loop tester, Input 1 (0–362 psi):

| Loop current | Reads | Ideal | Note |
| ------------ | ----- | ----- | ---- |
| 4.00 mA | 0 psi | 0.00 | at the clamp |
| 4.10 mA | 2 psi | 2.26 | just off the clamp — low end confirmed live |
| 12.00 mA | 181 psi | 181.00 | exact |
| 20.00 mA | 362 psi | 362.00 | exact |

The 4.10 mA point matters: `adc_to_eng()` clamps (`counts <= ADC_4MA` returns
`scale_4ma`), so 4.00 mA reads a perfect 0 whether the low end is right or not.
Stepping just above the clamp proves the bottom of the range genuinely tracks.

Cross-checking the pre-trim readings (12 mA → 179 psi, 20 mA → 359 psi) gave
44.67–44.75 and 44.70–44.75 counts/mA respectively. The overlap proves the error
was **purely multiplicative with no offset**, which is why a single
`ADC_VREF_MV` trim corrects the whole range.

Resolution floor is **0.51 psi/count** (715 counts over 362 psi), so ±1 psi at
midscale is quantisation, not error — no constant can improve on it.

> ⚠️ Per-part FVR tolerance means **4119 is board-specific.** A production build
> needs a per-unit trim or an acceptance test tight enough to make one value fit.

> Unlike the Rev 7/8 VDD arrangement, readings no longer track the 5V rail, so
> relay pull-in, buzzer and backlight load steps cannot shift them. Note that
> averaging never mitigated that — a rail shift biases every sample in the same
> direction and passes through the rolling average intact.

**Hardware/firmware compatibility — closed, not a live hazard.** The burden
cannot be detected in firmware, so a 100R or 220R board would mis-scale every
analog reading with no warning. That only ever applied to **three early
prototypes, none of which will reach a customer** — every production board is
180R, which is what `ADC_VREF_MV 4119` is calibrated against. This is why the
firmware identity is `PG_vB-Ver.x.y.z` with **no PCB revision**: naming one
would document a distinction that exists only on this bench, and would force a
pointless rename on every later PCB spin. See `FW_HW_TARGET` in
[main.c](src/main.c).

Migration checklist: [docs/DEVELOPMENT_PATH.md](docs/DEVELOPMENT_PATH.md) §2.

---

## Supply Monitoring (Ver 3 Rev 37)

**The problem BOR cannot solve.** The ADC runs from the 4.096V FVR, which needs
**VDD >= ~4.75V** to regulate. Below that it sags and every analog reading is
wrong — silently. The PIC18F26K22's brown-out threshold tops out at **2.85V**, so
the whole band from ~4.75V down to 2.85V runs happily on a bad reference: display
fine, menus fine, pressure a lie. On a pump protection device that is the failure
mode that matters.

**The fix.** Convert the FVR *using VDD as the ADC reference* (CHS = `11111`,
PVCFG = `00`):

```
count = FVR / VDD * 1023        ->    VDD = ADC_VREF_MV * 1023 / count
```

As VDD falls the count RISES toward 1023, and the reading stays meaningful right
into dropout, where the FVR tracks just below VDD.

| Item | Value |
| ---- | ----- |
| Threshold | `VDD_MIN_MV` **4600** |
| Hysteresis | `VDD_HYST_MV` **100** (must reach 4700mV to clear) |
| Rate | once per 1Hz tick, before the loop-integrity check |
| Settling | shares `sensor_settle_countdown`, so a slow rail at power-up cannot trip it |
| In RUN | immediate **latched** stop (never pulsed), all bypass countdowns cancelled, alarm buzzer |
| Stop code | **23** |
| Display | line 1 shows `Low Volts` |

Latched rather than pulsed for the same reason as a loop fault: a pulsed stop
would restart the pump on the same bad supply.

`BORV` is still set to its 2.85V maximum. It protects the **core**; the FVR guard
protects the **readings**. Neither replaces the other.

> Not yet verified on hardware — needs a bench supply wound down through 4.6V to
> confirm the trip point and that it does not chatter.

---

## Factory Reset (hidden)

There is deliberately **no menu item**. Wiping a commissioned controller by
accident is a service call, so the gesture is undocumented on the unit:

**Hold the encoder button while powering up.** A countdown appears
(`Erasing in 5 … 1`); releasing at any point cancels. At zero it calls
`factory_reset()`, clears the latched power-fail flag and stop code, then waits
for the button to be released before booting on.

Boot-time is the safe place for it: the pump cannot be running, and it cannot be
performed unknowingly.

---

## Versioning Scheme

### Format

```c
#define FW_PRODUCT "PG"
#define FW_HW      "Ver_B"
#define FW_MAJOR   1
#define FW_MINOR   0
#define FW_PATCH   0
```

Displayed as **`PG-Ver_B-1.0.0`** on splash screen line 3 and on the debug UART
banner. Nothing else appears there: no build counter, no suffix, no conditional
form. The string is 14 characters, comfortable on the 20-wide centred line.

| Field | Meaning |
| ----- | ------- |
| `PG` | Product - PumpGuard |
| `Ver_B` | **Hardware generation.** Changes only if the BOARD changes |
| `MAJOR` | Stored config or display protocol **incompatible** - settings will not survive the upgrade, or the display board must be reflashed too |
| `MINOR` | New feature or changed behaviour, config compatible |
| `PATCH` | Bug fix only |

### Why no PCB revision in the name

`Ver_B` names the hardware *generation*, not the board spin, and that is
deliberate. The 100R and 220R burden resistors existed only on **three early
prototypes that will never reach a customer** - every production board is 180R,
which is what `ADC_VREF_MV 4119` is calibrated against. Naming a revision would
document a distinction that exists only on this bench, and would force a
pointless firmware rename on every later PCB spin that changed nothing
electrical.

If a future board changes something firmware depends on - the burden, the
pinout, the display protocol - that is a new hardware generation and `FW_HW`
changes with it.

### Increment policy

Bump the digit that matches what actually changed:

- **PATCH** for a bug fix that changes nothing else.
- **MINOR** for a new feature or a deliberate behaviour change that existing
  configurations survive.
- **MAJOR** when a commissioned unit's stored settings will **not** survive the
  upgrade, or when the display board must be reflashed to match. This is the one
  that matters operationally - a technician needs to know before flashing, not
  after. `system_config_t` has been held at 128 bytes precisely to avoid it.

There is **no per-change build counter**. Issues, changes and history are
tracked in a document in the GitHub repo and in the commit log, which is where
that detail belongs - not in a number on a 20-character LCD line.

> **Consequence worth knowing:** nothing on screen distinguishes one bench build
> from the next. During development the programmer's `Programming/Verify
> complete` is the confirmation that a flash took, not the splash.

> The revision numbers in the Changelog above (`Ver 3 Rev NN`) are the previous
> scheme and remain valid as history. They stop at Rev 94, where this scheme
> takes over at `PG-Ver_B-1.0.0`.

---

## Version Control Strategy

### What Goes Where

| Asset Type                               | Storage  | Versioning                     |
| ---------------------------------------- | -------- | ------------------------------ |
| Firmware (C source, headers)             | GitHub   | Git commits + `PG-Ver_B-M.m.p`       |
| Hardware (schematics, PCB, gerbers, BOM) | OneDrive | Folder structure (Ver_X/Rev_Y) |
| Datasheets, reference docs               | Either   | N/A                            |

### Rationale

- **Git/GitHub** is optimized for text-based source code with line-by-line diff tracking
- **OneDrive** handles large binary files (DipTrace, STEP, Excel) with built-in versioning and sync
- Mixing binary hardware files in Git causes repository bloat and poor diff support

### Git Commit Policy

1. **Commit regularly** after completing each logical unit of work
2. **Push to remote** after each working session (never leave unpushed commits overnight)
3. **Commit message format:**
   - Include which board: `[Main] Add feature X (Ver_B_Rev_1)` or `[Display] Fix PWM (v2)`
   - Detailed: Use body for explanation if needed
4. **Always verify** both boards compile before committing

### Branch Strategy

- `master` - stable, tested code
- Feature branches for experimental work (e.g. `Standardise_Inputs`)

---

## Project Structure (Firmware)

```
Irrisys_Controller/
├── src/                        # Main board source (PIC18F26K22)
│   ├── main.c                 # Entry point, firmware identity, main loop
│   ├── menu.c                 # Menu system logic, field editing, deferred saves
│   ├── eeprom.c               # Internal EEPROM configuration storage
│   ├── eventlog.c             # Event log (DISABLED — log concept abandoned, dropped from build)
│   ├── encoder.c              # Rotary encoder driver + ISR (Timer0 + INT0)
│   ├── lcd.c                  # Buffered LCD via serial to display board
│   ├── i2c.c                  # I2C bus driver
│   ├── rtc.c                  # RTC driver (RV-3028-C7) - SEE OPEN_ITEMS: still DS3231 code
│   └── pca9535.c              # PCA9535 I/O expander (legacy)
│
├── include/                    # Main board headers
│   ├── config.h               # Pin definitions, system config, pragma config
│   ├── menu.h                 # Menu state, field tags, dirty flags
│   ├── eeprom.h               # EEPROM structures (input_config_t, system_config_t)
│   ├── eventlog.h             # Event log API and stop codes
│   ├── encoder.h              # Encoder driver interface
│   ├── lcd.h                  # LCD/display protocol interface
│   ├── i2c.h                  # I2C driver interface
│   ├── rtc.h                  # RTC driver interface
│   └── pca9535.h              # PCA9535 I/O expander interface (legacy)
│
├── display/                    # Display board (PIC18F14K22) - separate build
│   ├── src/
│   │   ├── main.c             # Entry point, display firmware
│   │   ├── lcd.c              # HD44780 4x20 LCD driver
│   │   ├── pwm.c              # Brightness/contrast PWM
│   │   ├── uart.c             # Serial receive
│   │   └── protocol.c         # Frame parsing, CRC
│   ├── include/
│   │   ├── config.h           # Pin definitions, oscillator
│   │   └── [module].h         # Headers
│   └── CLAUDE.md              # Display-specific protocol spec
│
├── tools/                      # Build scripts
│   └── build.bat              # Build script
│
├── CLAUDE.md                   # This file (system overview)
└── README.md
```

---

## Hardware File Management

### Location (OneDrive)

```
C:\Users\PeeWee\OneDrive\Documents\DipTrace\PCT_HEADER\ALL_Files\Control_Point_Pump_Guard\IRRISYS_PG_Ver_B\
```

### Folder Structure

```
IRRISYS_PG_Ver_B/
├── Irrisys_PG_Ver_B_Rev_1/                    # Current revision
│   ├── IrrisysPG_MainBrd_Ver_B_Rev_1.*        # Main board files
│   ├── IrrisysPG_Ver_B_Display_Rev_1.*        # Display board files
│   └── IrrisysPG_Ver_B_Display_Rev_2.dip      # Display Rev 2 (WIP)
├── Archive/                                    # Older versions
└── Menu_Layout.txt
```

### Hardware Revision Policy

- **Version (Ver_X):** Major hardware redesign (different MCU, different pin assignments)
- **Revision (Rev_Y):** Minor changes (routing, component swaps, same pinout)
- Each revision folder contains ALL related files (schematic, PCB, BOM, gerbers, P&P)

---

## Serial Protocol (Main -> Display)

See `display/CLAUDE.md` for full protocol specification.

### Frame Structure

```
[STX] [CMD] [LEN] [DATA...] [CRC16-LO] [CRC16-HI] [ETX]
 0x02  1 byte 1 byte 0-24 bytes  Fletcher-16       0x03
```

### No acknowledgement — deliberate

The link is **one-way**. Frames carry a Fletcher-16 CRC so the display can
detect corruption and discard a bad frame, but there is **no ACK/NAK**: the main
board never learns whether anything arrived, and cannot detect a dead or absent
display board at all.

Both ends actually name a return path (`UART_TX_TRIS` on the display,
`RC7 = Serial RX from Display Board` on the main board), so this looks like an
omission. It is not — the decision was reviewed and closed 2026-09-03:

- **The controller could not act on the information.** The display is its only
  channel to the operator, so a detected display fault could not be reported.
- **Protection is unaffected.** The relay, bypass timers and stop logic do not
  depend on the display; a blank screen loses visibility, not safety.
- **The unit is sealed**, main board and display in one enclosure. Nobody in the
  field swaps a board, so mismatched display firmware is not a scenario.
- **The user reports "the display isn't working" and the unit returns anyway** -
  at which point the failure log is readable over the debug serial, whether or
  not the display ever worked.

Corruption self-heals: `lcd_flush()` sends only CHANGED lines, so a dropped line
would otherwise stay stale forever - which is why the periodic full-screen
refresh and the splash re-assert exist. Those are the mitigation.

> If a return path is ever fitted, the useful signal is **presence** (a heartbeat
> from the display, flagged if it stops), not per-frame ACK - which would halve
> throughput and add latency to solve a problem the refresh already handles.

### Commands Summary

| CMD     | Description                                      |
| ------- | ------------------------------------------------ |
| `1`-`4` | Text for lines 1-4 (with embedded control codes) |
| `C`     | Clear display                                    |
| `B`     | LCD Brightness (0-100)                           |
| `K`     | LCD Contrast (0-100)                             |
| `L`     | LED state (bit mask)                             |

### Embedded Control Codes

`\x10`-`\x11` Blink on/off, `\x12`-`\x13` Underline on/off, `\x14`-`\x15` Cursor show/hide, `\x16`-`\x17` Cursor left/right, `\x18` Cursor to column, `\x19`-`\x1C` Scroll

---

## Hardware Specifications

### Main Board (PIC18F26K22)

| Component     | Part            | Interface        | Notes                                                                                                                                 |
| ------------- | --------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| MCU           | PIC18F26K22     | -                | 32MHz (8MHz + 4x PLL)                                                                                                                 |
| Encoder       | Rotary + switch | GPIO + interrupt | Short/long press                                                                                                                      |
| RTC           | **RV-3028-C7**  | I2C (**0x52**)   | 1Hz timebase on RB0/INT0. 1ppm TCXO: over the 99:59 max runtime the PIC INTOSC would drift up to ~1hr, this ~0.4s. Driver still targets a DS3231 at 0x68 - see OPEN_ITEMS |
| ADC           | Internal 10-bit | RA0-RA2          | 3 channels, **4.096V FVR reference**, 180R burden, 4-sample rolling average                                                            |
| Digital Input | Direct GPIO     | RA4-RA7          | 4 channels (DIG_IN1=Run/Stop, DIG_IN2-4=PNP)                                                                                          |
| EEPROM (cfg)  | Internal        | -                | 128B x 3 inputs + 128B system + checksum                                                                                               |
| EEPROM (log)  | M24M01          | I2C              | Event log storage                                                                                                                       |
| Relay         | -               | RB5 (Active High)| Normally energized (closed=pump runs). De-energize to stop. Pulse/latch modes.                                                         |
| Buzzer        | -               | RC0 (Active High)| User feedback                                                                                                                         |
| Serial TX     | EUSART1         | RC6 (19200 baud) | To display board                                                                                                                      |
| Debug TX      | EUSART2         | RB6 (9600 baud)  | Debug serial output                                                                                                                    |

### Pin Assignment (PIC18F26K22)

```
PORTA:
  RA0 = ADC1 (4-20mA loop 1, analog)
  RA1 = ADC2 (4-20mA loop 2, analog)
  RA2 = ADC3 (4-20mA loop 3, analog)
  RA3 = NC
  RA4 = Digital Input 1 - Running/Stopped (Active High)
  RA5 = Digital Input 2 - PNP1 (Active High)
  RA6 = Digital Input 3 - PNP2 (Active High)
  RA7 = Digital Input 4 - PNP3 (Active High)

PORTB:
  RB0 = RTC Interrupt (1Hz square wave, INT0)
  RB1 = Rotary Encoder Ch A
  RB2 = Rotary Encoder Ch B
  RB3 = Momentary Button (Active Low, pull-up)
  RB4 = Relay Output 2 (Active High) - Not currently used
  RB5 = Relay Output 1 (Active High) - Primary relay
  RB6 = Serial Debug TX (UART2, 9600 baud)
  RB7 = Serial Debug RX (UART2)

PORTC:
  RC0 = Buzzer Drive (Active High)
  RC1 = NC
  RC2 = EEPROM Write Protect (Low = enabled)
  RC3 = I2C SCL
  RC4 = I2C SDA
  RC5 = NC
  RC6 = Serial TX to Display Board (UART1, 19200 baud)
  RC7 = Serial RX from Display Board (UART1) - Not currently used
```

### Display Board (PIC18F14K22)

| Pin   | Function   | Notes           |
| ----- | ---------- | --------------- |
| RA2   | PWR LED    | Active LOW      |
| RA4   | Signal LED | Active LOW      |
| RA5   | Fault LED  | Active LOW      |
| RB5   | Serial RX  | From main board |
| RC0-3 | LCD DB4-7  | 4-bit mode      |
| RC4   | Brightness | PWM             |
| RC5   | Contrast   | PWM (CCP1)      |
| RC6   | LCD E      | Enable          |
| RC7   | LCD RS     | Register Select |

---

## Main Loop Architecture

### Startup Sequence

1. `system_init()` - oscillator, ports, both EUSARTs
2. `uart_init()` - debug serial
3. **`lcd_init()` + `disp_clear()`** - the display is cleared here, before any
   EEPROM/I2C/RTC work, so power-up garbage is not left on the LCD for the whole
   boot sequence
4. `eeprom_init()`, `i2c_init()`, `pca9535_init()`, `rtc_init()`, `encoder_init()`,
   `menu_init()`
5. 500ms wait for the display board to finish booting, then the splash
   (see **Splash Screen** below)
6. Three startup beeps, 5s splash hold, then the main screen

### Splash Screen

**This layout is specified — do not vary it.** Any change to the splash must
keep this structure.

```
Line 1: ====================     full width, 20 '=' characters
Line 2:  Irrisys PumpGuard       horizontally centred
Line 3:  F/W Ver 3, Rev 18       horizontally centred
Line 4: ====================     full width, 20 '=' characters
```

Centring is computed at run time by `lcd_print_centered()` ([main.c](src/main.c)),
not hard-coded, because the revision number changes width as it climbs.

The same splash is re-shown by **UTILITY > About**, held for 5 seconds. That
hold is counted down on the 1-second tick rather than busy-waiting: the menu is
reachable while the pump is running, and blocking would stall the tick that
drives the bypass timers. Any button press dismisses it early.

> **Dropped frames.** The display link is one-way with no ACK and `lcd_flush()`
> only sends lines that *changed*, so a frame lost while the display board is
> still booting would never be re-sent — the splash sat half-drawn. Both splash
> paths now re-assert the whole screen once a second, and the wait for the
> display board is 1000ms (it boots in ~1s; the old 500ms was not enough).

Line 3 carries the firmware identity `PG-Ver_B-M.m.p` — see **Versioning
Scheme**. The build date/time stamp that used to occupy line 4 appears on the
debug UART banner only.

> There is no build counter, so **the splash looks identical between bench
> builds**. Confirmation that a flash took is the programmer reporting
> `Programming/Verify complete`, not the screen.

### Timing System

The main loop is non-blocking and driven by two interrupt-sourced flags:

| Flag             | Source              | Rate   | Purpose                                        |
| ---------------- | ------------------- | ------ | ---------------------------------------------- |
| `subtick_flag`   | Timer0 ISR (1ms)    | 50ms   | Fine-grained timing, buzzer, LED flash, render |
| `rtc_tick_flag`  | RTC INT0/RB0        | 1000ms | Runtime clock, bypass timers, relay pulse      |

### ISR Structure (encoder.c)

**Two prioritised ISRs** (`encoder.c`), `IPEN = 1`:

| ISR | Source | Priority | Work |
| --- | ------ | -------- | ---- |
| `isr_high` | INT0 (RTC 1Hz on RB0) | **High** | Increment `rtc_tick_count` and return. |
| `isr_low` | Timer0 (1ms) | Low (`TMR0IP = 0`) | Encoder decode, button FSM, buzzer sequencer, 50ms subtick, menu timeout, watchdog edge capture. |

**INT0 has no priority bit on the PIC18** - it is fixed high priority whenever
`IPEN = 1`. That is the ordering we want: the safety-critical 1Hz tick that
drives every bypass countdown is serviced immediately and cannot be delayed by
the much longer encoder/button ISR. The cost is one preemption per second, of a
handler a few instructions long.

Handles:
- **Timer0** (1ms): Encoder polling, button debounce/hold detection, `subtick_flag` every 50ms, menu timeout
- **INT0** (RTC 1Hz): Sets `rtc_tick_flag`

### Main Loop Execution Order (every 50ms subtick)

```
1. ADC sampling (4-sample rolling average)
2. Buzzer countdown (non-blocking)
3. Alarm buzzer pattern (6 cycles 500ms on / 250ms off)
4. Alarm flash toggle (~4Hz)
5. [1-second tick only]:
   a. Runtime clock (countdown or count-up)
   b. Relay pulse countdown
   c. Power detect delay countdown
   d. Bypass timer processing (RUN state only) -- SAFETY CRITICAL
6. Deferred EEPROM saves (dirty flags from menu)
7. Render main screen (~4Hz, main screen only)
8. Handle encoder rotation
9. Handle button events
10. Handle menu timeout
11. LED state update via display board
```

### Safety-Critical Design

**PumpGuard can never START a pump — it can only stop one that is running.**

Closing the relay merely *permits* a start; energising the starter/VSD requires
an operator to press an external start button. Using a switch rather than a
momentary button there would be unsafe and probably illegal. The run signal on
DIG_IN1 is derived from the **actual state of the pump**, not inferred from the
relay output.

This changes how failures must be reasoned about. A chattering or repeatedly
re-energised relay cannot restart the pump — it can only drop it once, after
which it stays down until someone presses start. So a brown-out reset loop is
not a "repeated start/stop" hazard. Do not assume otherwise when analysing
fault behaviour.


- **Bypass timer processing** (step 5d) runs every 1-second tick when `sys_state == SYS_RUN`, regardless of menu state. Being in any menu does NOT block pump protection.
- **Relay trip** occurs immediately on alarm, BEFORE any EEPROM or logging operations.
- **Deferred EEPROM saves** (step 6) ensure menu config changes never block safety-critical bypass timer processing. Menu code sets dirty flags; main loop writes EEPROM after safety processing completes.
- **No blocking delays** in the safety path. All beeps and delays occur after safety processing.

### Deferred EEPROM Save Pattern

```c
// In menu.c: set dirty flag instead of writing EEPROM directly
input_config_dirty[current_input] = 1;  // or system_config_dirty = 1;

// In main.c: write EEPROM after safety processing
for (uint8_t i = 0; i < 3; i++) {
    if (input_config_dirty[i]) { save_input_config(i); input_config_dirty[i] = 0; }
}
if (system_config_dirty) { save_system_config(); system_config_dirty = 0; }
```

---

## Bypass Timer State Machine

### States

| State        | Value | Description                                         |
| ------------ | ----- | --------------------------------------------------- |
| BP_INACTIVE  | 0     | Direction parked (switch types, or after an alarm)  |
| BP_PRIMARY   | 1     | Startup grace period (runs only while faulted)      |
| BP_NORMAL    | 2     | Normal monitoring (no timer running)                |
| BP_SECONDARY | 3     | Fault detected, secondary countdown                 |
| BP_ALARM     | 4     | Timer expired while fault active -> relay trip      |

### Per-Input State

```c
typedef struct { uint16_t countdown; uint8_t phase; } bp_dir_t;
typedef struct { bp_dir_t high; bp_dir_t low; } bp_input_t;
static bp_input_t bp_state[3];
```

Each input has independent high and low direction bypass timers. When an alarm triggers, ALL other bypass timers are cancelled (can only stop once).

### Bypass Monitoring Rules

- **A bypass timer is a DELAY, never an on/off switch.** `0` means *no delay* -
  trip at once - and nothing else. It used to carry a second, hidden meaning:
  the fault test was gated on "setpoint non-zero OR either timer non-zero", so
  an operator who set both timers of a direction to 0 - entirely reasonable if
  he wants it to trip immediately - silently **disabled** that direction
  wherever the setpoint was also 0. Two innocuous edits combined into no
  protection, with nothing on screen to say so. Removed in Ver 3 Rev 91: both
  directions are always evaluated. Turning protection off is what the input
  **Enable** flag and the **setpoint** are for.
- Every direction starts in BP_PRIMARY on RUN, **including when the primary
  bypass is 0** - that is a zero-length startup window, not the absence of
  one. A fault already present at pump start therefore reports the **primary**
  code (`PHPBP`), which says the condition was there from the start: wrong
  setpoint, wrong sensor, valve shut. Before Ver 3 Rev 92 a zero primary
  skipped to BP_NORMAL and the same trip was reported as **secondary** - a
  running excursion - sending the diagnosis in the wrong direction.
- If primary > 0, starts in BP_PRIMARY on RUN. The primary window is **abandoned the moment the threshold is reached** (value goes good) -> BP_NORMAL, and any further excursion is handled by the secondary timer. If the value is still in fault when the primary countdown reaches 0 -> BP_ALARM (relay trip attributed to the primary timer). Primary and secondary are never summed.
- Fault during BP_NORMAL starts BP_SECONDARY countdown. If fault persists through secondary, triggers BP_ALARM.
- Fault clearing during BP_SECONDARY returns to BP_NORMAL. The secondary timer re-arms on **every** subsequent excursion -- it is not a one-shot.
- **Primary vs secondary lifetime:** a primary window runs once per pump start (STOP -> RUN). Secondary timers run as many times as the value crosses the threshold, for as long as the pump runs.
- Acknowledging a fault with the button calls `clear_bp_timers()` (all directions -> BP_INACTIVE) and then, if still in RUN, `resume_bp_timers()` to put every enabled direction back to BP_NORMAL. Without the resume, protection stayed dead for the rest of the run because `init_bp_timers()` only fires on a STOP -> RUN edge.

---

## EEPROM Configuration Structures

### Memory Layout

| Region         | Address | Size      | Description                 |
| -------------- | ------- | --------- | --------------------------- |
| Input 1 config | 0x000   | 128 bytes | `input_config_t`            |
| Input 2 config | 0x080   | 128 bytes | `input_config_t`            |
| Input 3 config | 0x100   | 128 bytes | `input_config_t`            |
| System config  | 0x180   | 128 bytes | `system_config_t`           |
| Checksum       | 0x200   | 2 bytes   | Fletcher-16 over all config |

### input_config_t (128 bytes per input)

| Offset  | Type       | Field                 | Description                                                   |
| ------- | ---------- | --------------------- | ------------------------------------------------------------- |
| 0       | uint8      | enable                | 0=Disabled, 1=Enabled                                         |
| 1       | uint8      | sensor_type           | 0=Pressure, 1=Temp, 2=FlowMeter, 3=FlowSw, 4=Oth4-20, 5=OthSw |
| 2       | uint8      | fault_polarity        | Digital: level at which condition is PRESENT (0=Low, 1=High)  |
| 3       | uint8      | config_flags          | Bit flags for per-input options                               |
| 4-7     | uint8[4]   | reserved1             | Future expansion                                              |
| 8-9     | int16      | scale_4ma             | 4mA scaling value (-999 to +999)                              |
| 10-11   | int16      | scale_20ma            | 20mA scaling value (-999 to +999)                             |
| 12-13   | int16      | high_setpoint         | High setpoint (signed)                                        |
| 14-15   | int16      | low_setpoint          | Low setpoint (signed)                                         |
| 16-23   | int16[4]   | reserved_signed       | Future signed values                                          |
| 24-25   | uint16     | primary_high_bypass   | Pri high BP (seconds) / Digital: pri fault BP                 |
| 26-27   | uint16     | secondary_high_bypass | Sec high BP (seconds) / Digital: sec fault BP                 |
| 28-29   | uint16     | primary_low_bypass    | Pri low BP (seconds)                                          |
| 30-31   | uint16     | secondary_low_bypass  | Sec low BP (seconds)                                          |
| 32-55   | uint16[12] | reserved_uint16       | Future 16-bit values                                          |
| 56      | uint8      | relay_pri_high_mode   | 0=Latch, 1=Pulse                                              |
| 57      | uint8      | relay_sec_high_mode   | 0=Latch, 1=Pulse                                              |
| 58      | uint8      | relay_pri_low_mode    | 0=Latch, 1=Pulse                                              |
| 59      | uint8      | relay_sec_low_mode    | 0=Latch, 1=Pulse                                              |
| 60-63   | uint8[4]   | reserved_relay        | Future relay config                                           |
| 64-79   | uint32[4]  | reserved_uint32       | Future large values                                           |
| 80-95   | char[16]   | name                  | Sensor name (null-terminated, max 11 chars displayed)         |
| 96-103  | char[8]    | units                 | Units string (null-terminated, e.g. "psi", "C", "L/M")       |
| 104-127 | uint8[24]  | padding               | Expansion space                                               |

## Watch Dog (sensor type 6)

An **external** watchdog: something out in the field has to keep saying "still
moving", and the pump stops if it goes quiet. Nothing to do with the PIC's own
WDT, which is reported as **Int Error** precisely to keep the two apart.

**The case it was built for.** A traveling irrigator with a magnetic reed switch
on one wheel and a radio transmitter. Every wheel revolution sends a pulse to a
receiver in the pumpshed, wired to a digital input. If the irrigator stalls,
bogs, or the link drops, the pulses stop and the pump is shut down before it
pumps into a machine that is not moving.

| Menu item | Meaning |
| --------- | ------- |
| Enable | Enabled / Disabled |
| Trigger | `Hi to Lo`, `Lo to Hi`, or `Edge` (either) |
| PWDBP | Startup grace, **default 30:00**. Once per pump start |
| SWDBP | Running timeout, **default 5:00**. Reloaded by every pulse |
| Sensor | Type selection |
| Rly PWDBP | Latch / Pulse — **default Latch** |
| Rly SWDBP | Latch / Pulse — **default Pulse** |

Range for both timers is 1 second to 60:00, entered as mm:ss. **0 disables that
stage**, consistent with every other bypass.

**Timing.** On pump start PWDBP runs — long by default, because an irrigator
takes a while to pressurise and start moving. The **first pulse abandons it
permanently** (exactly as an analog primary window is abandoned when the value
comes good) and switches to SWDBP, which reloads on every subsequent pulse. It
is a *retriggerable* timer: it counts while the signal is ABSENT, where a bypass
counts while a fault PERSISTS.

**Relay defaults are deliberately asymmetric.** SWDBP pulses — a running
irrigator that stops signalling has usually stalled or lost the link for a
moment, so drop the pump and let it restart. PWDBP latches — never having
started moving at all points at a setup or plumbing problem that wants someone
to look at it.

**Edges are captured in the 1ms ISR** ([encoder.c](src/encoder.c)), not the main
loop. A multi-block EEPROM save blocks the loop for up to ~2s, and a pulse
arriving in that window would simply be lost. The ISR latches rising and falling
separately and never reads config; the main loop applies whichever edge is
configured. No debounce — a bouncing reed switch just produces extra kicks, and
an extra kick on a retriggerable timer is harmless. Stale edges are discarded at
pump start, so a pulse that arrived while stopped cannot pre-satisfy PWDBP.

**Display.** Running, the line shows the time left, steady:

```
Watch Dog            04:32
```

It does **not** flash while counting. Every other sensor's running countdown
means something is currently wrong; a watchdog's timer is always running by
design, so a flash would be permanent and meaningless. It still flashes on a
real alarm, with `PWDBP` or `SWDBP` as the code.

Stopped, or with the stage disabled, it shows the live contact state instead —
`Open` or `Closed` (inputs are PNP: 24V present = closed) — so the wiring and
the radio link can be proved from the standby screen without starting the pump.

**No name editor.** A watchdog is always a watchdog, so it keeps the fixed name
and its labels are always PWDBP/SWDBP. Only `Oth 4-20` gets the name editor now.

**Loop integrity is skipped** for this and every other digital type — they carry
no loop current, so open/short detection would report `err open` on a perfectly
good switch. The test is re-evaluated every tick from `sensor_type`, so changing
an input back to a 4-20mA type restores it with no further action.

---

### Sensor Types

> **Switch polarity.** For types 3 and 5 the `fault_polarity` byte names the
> input level at which the condition is **present** — `Flow: High` means flow is
> indicated by a high input, matching how the menu reads. The fault is therefore
> the opposite level. (Before Ver 3 Rev 15 it named the *fault* level, so the
> menu wording and the behaviour were inverted.)

| Value | Type         | Analog/Digital | Labels (High/Low)      | Bypass Prefixes    |
| ----- | ------------ | -------------- | ---------------------- | ------------------ |
| 0     | Pressure     | Analog         | High Press / Low Press | PHP, SHP, PLP, SLP |
| 1     | Temperature  | Analog         | High Temp / Low Temp   | PHT, SHT, PLT, SLT |
| 2     | Flow Meter   | Analog         | High Flow / Low Flow   | PHF, SHF, PLF, SLF |
| 3     | Flow Switch  | Digital        | Flow (high only)       | PF, SF, PNF, SNF   |
| 4     | Other 4-20   | Analog         | High Value / Low Value | PHV, SHV, PLV, SLV |
| 5     | Other Switch | Digital        | Aux (high only)        | PA, SA, PNA, SNA   |
| 6     | **Watch Dog** | Digital       | Trigger (edge select)  | PWDBP, SWDBP       |

> **Type 5 (Other Switch) is retired from the selector** as of Ver 3 Rev 50. The type is
> still handled everywhere, so a stored config carrying it keeps working - it simply
> cannot be chosen any more. `sensor_type_for_option[]` in [menu.c](src/menu.c) maps menu
> position to stored type in both directions, which is what keeps Watch Dog at **6**
> rather than silently reinterpreting an existing Other Switch input as a watchdog.

Analog types (0,1,2,4) have 17 menu items: Enable, Low Setpoint, High Setpoint, 2 low bypass timers, 2 high bypass timers, Sensor, Units, Scale 4mA, Scale 20mA, 4 relay modes (low pair first), Back, EXIT.

> **Low before high** throughout, from the team ordering review (Ver 3 Rev 38). Loss of prime is the everyday protection case on an irrigation pump and over-pressure the rare one, so the fields touched most often sit nearest the top. The two setpoints sit together so the trip window reads as one thing.

Digital types (3, 5, 6) have 9 menu items: Enable, Polarity/Trigger, 2 bypass timers, Sensor,
2 relay modes, Back, EXIT.

> **A switch has one fault condition**, so it gets one pair of timers, not the
> four an analog input needs. They are the **low** direction fields
> (`primary_low_bypass` / `secondary_low_bypass` and the matching relay modes),
> because "no flow" is a low condition. Before Ver 3 Rev 16 the fault was
> evaluated in the HIGH direction under the labels PFBP/SFBP, while the
> meaningfully named PNFBP/SNFBP sat on the low direction and **were never read
> at all** — settable, stored to EEPROM, and completely inert.

### Sensor-Specific Units

| Sensor Type  | Available Units |
| ------------ | --------------- |
| Pressure     | psi, bar, kPa   |
| Temperature  | C, F            |
| Flow Meter   | %, LpM, LpS     |
| Flow Switch  | (none)          |
| Other 4-20   | Value           |
| Other Switch | (none)          |

**Units design (current):** All values are entered and displayed in fixed standard units -- psi for pressure, C for temperature, % for flow. Unit selection menu items exist but display-time conversion is **suspended** (code preserved in `#if 0` block in `main.c` for future reinstatement). Conversion functions `convert_for_display()` and `convert_to_standard()` are ready but inactive.

### ADC to Engineering Units

```
4mA = 179 counts, 20mA = 894 counts (180 ohm sense, FVR calibrated 4.119V, 10-bit)
44.7 counts/mA. Derived from ADC_VREF_MV / BURDEN_OHMS - see "4-20mA Front End" above.
Linear interpolation: adc_to_eng(counts, scale_4ma, scale_20ma)
```

**Main screen display formatting:**

| Sensor Type | Format | Example |
|-------------|--------|---------|
| Pressure | `%03d psi` | `030 psi` |
| Temperature | `+/-%03d C` | `+085 C` |
| Flow Meter | `%03d units` | `045 %` |
| Other 4-20 | `%03d units` | `050 Value` |

### system_config_t (128 bytes)

| Offset | Type      | Field               | Description                                      |
| ------ | --------- | ------------------- | ------------------------------------------------ |
| 0      | uint8     | clock_enabled       | 0=Disabled (count up), 1=Enabled (countdown)     |
| 1      | uint8     | menu_timeout        | Menu timeout (seconds)                           |
| 2-3    | uint16    | runtime_hours       | Runtime hours                                    |
| 4-5    | uint16    | runtime_minutes     | Runtime minutes                                  |
| 6      | uint8     | end_runtime_mode    | Relay mode for end of runtime                    |
| 7      | uint8     | relay_pulse_time    | Rly Dwell: hold-open after run signal drops (1-120s) |
| 8      | uint8     | config_flags        | Bit flags for system options                     |
| 9-15   | uint8[7]  | reserved_time       | Future timing config                             |
| 16     | uint8     | contrast            | LCD contrast (3-10)                              |
| 17     | uint8     | brightness          | LCD brightness (3-10)                            |
| 18-19  | uint16    | power_fail_delay    | Power fail delay (seconds)                       |
| 20     | uint8     | power_failure_flag  | 1=power failure occurred                         |
| 21     | uint8     | active_stop_code    | Latched stop code (persists across power cycles) |
| 22-31  | uint8[10] | reserved_display    | Future display config                            |
| 32     | uint8     | dig2_enable         | DIG2: 0=Disabled, 1=Enabled                      |
| 33     | uint8     | dig2_fault_polarity | DIG2: 0=Fault Low, 1=Fault High                  |
| 34     | uint8     | dig2_relay_mode     | DIG2: 0=Latch, 1=Pulse                           |
| 35     | uint8     | dig3_enable         | DIG3: 0=Disabled, 1=Enabled                      |
| 36     | uint8     | dig3_fault_polarity | DIG3: 0=Fault Low, 1=Fault High                  |
| 37     | uint8     | dig3_relay_mode     | DIG3: 0=Latch, 1=Pulse                           |
| 38     | uint8     | dig4_enable         | DIG4: 0=Disabled, 1=Enabled                      |
| 39     | uint8     | dig4_fault_polarity | DIG4: 0=Fault Low, 1=Fault High                  |
| 40     | uint8     | dig4_relay_mode     | DIG4: 0=Latch, 1=Pulse                           |
| 41-47  | uint8[7]  | reserved_digital    | Future digital config                            |
| 48-49  | uint16    | log_entries         | Retained log entries. Default 25, NOT menu-adjustable |
| 50-63  | uint8[14] | reserved_log        | Future logging config                            |
| 64-65  | uint16    | boot_count          | Power-ups (saturating). 0xFFFF = region never written |
| 66     | uint8     | cnt_brownout        | Brown-out resets                                 |
| 67     | uint8     | cnt_int_error       | Watchdog / internal-error resets                 |
| 68     | uint8     | cnt_rtc_fault       | Timebase judged implausible                      |
| 69     | uint8     | cnt_low_volts       | Supply guard trips                               |
| 70-72  | uint8[3]  | cnt_loop_fault      | NAMUR loop faults, per input                     |
| 73-80  | uint8[8]  | stop_ring           | Last 8 stop codes, oldest overwritten            |
| 81     | uint8     | stop_ring_pos       | Next write position (also the oldest entry)      |
| 82-127 | uint8[46] | padding             | Expansion space                                  |

### Event Log

Stored on external M24M01 I2C EEPROM. Each entry is a stop code (uint8_t). Newest-first display order. Stop codes defined in `eventlog.h`:

| Code | Reason       |
| ---- | ------------ |
| 1    | End Runtime  |
| 2    | In1 Hi BP    |
| 3    | In1 Lo BP    |
| 4    | In2 Hi BP    |
| 5    | In2 Lo BP    |
| 6    | In3 Hi BP    |
| 7    | In3 Lo BP    |
| 8    | Pwr Fail     |
| 9    | Ext Stop     |
| 10   | DIG2 Fault   |
| 11   | DIG3 Fault   |
| 12   | DIG4 Fault   |

### Factory Defaults

Factory (startup) defaults are **derived from `sensor_type_defaults[]`** - the
same table used when the operator changes an input's sensor type. There is one
source of truth; the two cannot drift apart. `load_factory_defaults()` assigns a
sensor type per input slot and applies that type's defaults:

| Input | Sensor type at factory reset |
| ----- | ---------------------------- |
| Input 1 | 0 - Pressure |
| Input 2 | 1 - Temperature |
| Input 3 | 2 - Flow Meter |

`enable` is set to 1 for all three inputs. All field values are in the
Sensor Type Change Defaults table below.

**Input 1 - Pressure:**

| Parameter | Default |
|-----------|---------|
| Enable | Yes |
| Sensor Type | Pressure |
| Units | psi |
| 4mA Scale | 0 |
| 20mA Scale | 362 |
| High Setpoint | 200 |
| Low Setpoint | 30 |
| Pri High BP | 0s |
| Sec High BP | 1s |
| Pri Low BP | 300s (5:00) |
| Sec Low BP | 30s (0:30) |
| Rly Pri High / Sec High / Pri Low | Latch |
| Rly Sec Low | **Pulse** |

**Input 2 - Temperature:**

| Parameter | Default |
|-----------|---------|
| Enable | Yes |
| Sensor Type | Temperature |
| Units | C |
| 4mA Scale | -50 |
| 20mA Scale | 150 |
| High Setpoint | 85 |
| Low Setpoint | -10 |
| Pri High BP | 60s (1:00) |
| All Relay Modes | Latch |

**Input 3 - Flow Meter:**

| Parameter | Default |
|-----------|---------|
| Enable | Yes |
| Sensor Type | Flow Meter |
| Units | % |
| 4mA Scale | 0 |
| 20mA Scale | 100 |
| Pri Low BP | 30s (0:30) |
| Sec Low BP | 30s (0:30) |
| All Relay Modes | Latch |

### Sensor Type Change Defaults

Changing an input's **Sensor** type resets every sensor-dependent field to that
type's defaults. Without this, a re-typed input keeps the previous sensor's trip
settings -- e.g. Pressure -> Temperature would leave a 0-360 span with setpoints
of 200/30 on a temperature input, which is meaningless and unsafe.

Defaults live in `sensor_type_defaults[6]` ([eeprom.c](src/eeprom.c)) and are
applied by `apply_sensor_type_defaults(idx, sensor_type)`, called from the
`FT_SENSOR` case of `save_input_field()` ([menu.c](src/menu.c)).

**Fields reset:** scale 4mA, scale 20mA, high setpoint, low setpoint, all 4
bypass timers, all 4 relay modes, fault polarity, name, units.
**Field preserved:** `enable` -- the operator has just chosen to configure this
input, so its enabled state is left alone.

Bypass timers in seconds. Relay columns are Pri Hi / Sec Hi / Pri Lo / Sec Lo,
L = Latch, P = Pulse.

| Type | Name | Units | 4mA | 20mA | High SP | Low SP | Pri Hi BP | Sec Hi BP | Pri Lo BP | Sec Lo BP | Relays |
| ---- | ---- | ----- | --- | ---- | ------- | ------ | --------- | --------- | --------- | --------- | ------ |
| 0 Pressure | Pressure | psi | 0 | 362 | 200 | 30 | **0** | **0** | 300 | 30 | L/L/L/**P** |
| 1 Temperature | Temperature | C | -50 | 150 | **65** | **-5** | 60 | **30** | 0 | 0 | L/L/L/L |
| 2 Flow Meter | Flow Meter | % | 0 | 100 | **85** | 0 | **10** | **2** | **900** | 30 | L/L/L/L |
| 3 Flow Switch | Flow Switch | (none) | - | - | - | - | - | - | **10** | **5** | L/L (polarity **High**) |
| 4 Other 4-20 | Other 4-20 | (user) | 0 | 100 | **85** | 0 | **1** | **1** | **1** | **1** | L/L/L/L |
| 5 Other Switch | Other Sw | (none) | - | - | 0 | - | 0 | 0 | 0 | 0 | L/L/L/L |
| 6 **Watch Dog** | Watch Dog | (none) | - | - | - | - | - | - | **1800** (30:00) | **300** (5:00) | L/L/L/**P** |

> **TODO - values not yet confirmed.** Types 2-5 (Flow Meter, Flow Switch,
> Other 4-20, Other Switch) are placeholders awaiting operator-supplied values.
> Types 3-5 currently have **all bypass timers 0**, which means "direction not
> monitored" (see Bypass Monitoring Rules) - such an input cannot trip the pump
> at all until timers are deliberately set. Confirm before release.

Types 0-1 are confirmed. These same values are the factory/startup defaults.

**Cancel/restore:** the full pre-change `input_config_t` is snapshotted before
the reset. Cancelling the auto-opened name editor for "Other" types (Back at
position 0, or long press) restores the entire previous config, not just the
sensor type and name.

---

## Menu System

### Menu Structure

```
MAIN SCREEN (current_menu = 255)
  Line 1: "STOP" left / msg right  or  "RUN" left / HH:MM:SS right
  Line 2: val units    (Input 1, left-justified)
  Line 3: val units    (Input 2, left-justified)
  Line 4: val units    (Input 3, left-justified)
    - Input disabled          -> "Not Used"
    - Bypass timer counting   -> BP code + MM:SS + value, line flashes
    - Alarm                   -> name + stop code, line flashes
  Short press with fault -> clear fault, close relay
  Short press no fault -> OPTIONS menu

OPTIONS (current_menu = 0, root menu)
  |- Clock       -> CLOCK menu (ALWAYS shown - see note below)
  |- Setup Menu  -> SETUP menu
  |- Utility Menu -> UTILITY menu
  +- EXIT        -> Main screen

CLOCK (current_menu = 5, from OPTIONS > Clock)
  |- Enable   -> Disabled/Enabled (same byte as SETUP > Clock)
  |- Run Time -> HH:MM edit
  |- Back     -> OPTIONS
  +- EXIT     -> Main screen

SETUP (current_menu = 2, from OPTIONS > Setup Menu)
  |- Input 1 -> INPUT menu
  |- Input 2 -> INPUT menu
  |- Input 3 -> INPUT menu
  |- Clock   -> CLOCK CONFIG menu
  |- Back    -> OPTIONS
  +- EXIT    -> Main screen

INPUT (current_menu = 1, unified, dynamic based on sensor type)
  Analog (17 items):        Digital (9 items):
  |- Enable                 |- Enable
  |- Low Setpoint           |- Polarity   (level = present)
  |- High Setpoint          |- Pri BP     (PNFBP - startup)
  |- Pri Low BP             |- Sec BP     (SNFBP - running)
  |- Sec Low BP             |- Sensor
  |- Pri High BP            |- Rly Pri BP
  |- Sec High BP            |- Rly Sec BP
  |- Sensor                 |- Back -> SETUP
  |- Units                  +- EXIT -> Main screen
  |- Scale 4mA
  |- Scale 20mA
  |- Rly Pri Low
  |- Rly Sec Low
  |- Rly Pri High
  |- Rly Sec High
  |- Back     -> SETUP
  +- EXIT     -> Main screen

CLOCK CONFIG (current_menu = 3, from SETUP > Clock)
  |- Enable (Disabled/Enabled)
  |- Rly Endrun (Latch/Pulse)
  |- Back    -> SETUP
  +- EXIT    -> Main screen

UTILITY (current_menu = 4, from OPTIONS > Utility Menu)
  |- View Log / Clear Log
  |- Menu T/O / Pwr Detect / Brightness / Rly Dwell
  |- Fault Log -> FAULT LOG viewer (menu 8)
  |- About   -> re-shows the splash for 5s
  |- Back    -> OPTIONS
  +- EXIT    -> Main screen

LOG VIEW (current_menu = 7, from UTILITY > View Log)
  Scrollable list of event log entries (newest first)
  |- Back -> UTILITY
```

> **Clock is always listed in OPTIONS, enabled or not.** It used to be hidden
> when `clock_enabled` was 0. That was harmless while the enable lived only in
> SETUP > Clock, but once `Enable` was added to the operator-facing Clock menu
> it became a one-way door: turning the clock off made the menu you had just
> used disappear, and the only way back was the setup tree. **A control that
> can turn something off must stay reachable to turn it back on.**
>
> `Enable` appears in both CLOCK (operator) and CLOCK CONFIG (setup). They edit
> the same `clock_enabled` byte and both read it live, so they cannot disagree.
> `Rly Endrun` stays in setup only.

### Menu Behavior

- **Navigation:** All sub-menus have "Back" (return to parent) and "EXIT" (return to main screen). Long press on encoder exits to main screen from any menu.
- **Button beep:** Single 50ms beep on every button press, handled by the encoder ISR. No additional beeps from menu code.
- **Menu titles:** Consistent `======` style format, 20 chars wide (e.g. `====== CLOCK =======`).
- **Tag-based field system:** Each menu line has a field tag (FT_ENABLE, FT_SENSOR, etc.) stored in `input_field_tags[]`. All field detection, save, and edit logic uses tags rather than hardcoded line numbers.
- **Dynamic rebuild:** `rebuild_input_menu()` reconstructs the input menu when sensor type changes, switching between analog (17 items) and digital (13 items) layouts with sensor-specific labels.
- **Cursor preservation:** `rebuild_input_menu_keep_field(tag)` rebuilds then restores the cursor to the field carrying that tag. Matched by tag rather than line number, so the cursor follows the field across an analog/digital layout change. Used after name/units edits (confirm and cancel) and after a sensor type change, which previously dumped the cursor back to the top of the menu.
- **Sensor type change:** resets all sensor-dependent fields to that type's defaults (see Sensor Type Change Defaults). `enable` is preserved.
- **Deferred saves:** Each field sets a dirty flag when confirmed. Main loop writes to EEPROM after safety processing completes. This prevents ~512ms EEPROM writes from blocking bypass timer countdown.
- **4Hz flash:** All field types (numeric, time, option) flash at ~4Hz when being edited via `blink_state` toggling in `draw_menu_line()`.
- **Encoder acceleration:** Steps by 20 when encoder pulses are <112ms apart, otherwise steps by 1.
- **Name editor:** Custom sensor names up to 11 characters. Character set includes A-Z, a-z, 0-9, space, and common symbols. Rotary encoder scrolls through characters; button confirms position and advances.
- **Main screen fault clearing:** First short press on main screen clears any active fault (power fail, stop code, ext stop), closes relay if latched, clears all bypass alarms. Distinctive double-beep confirms. Second press enters menu.
- **Menu timeout:** Configurable timeout (seconds). Double-beep on timeout, returns to main screen.

### Main Screen Line 1 Format

State word ("RUN"/"STOP") left-justified, status message right-justified:
- "End RunTime" (runtime expired, flashes ~4Hz)
- "Pwr Fail" (power failure detected)
- "Ext Stop" (external run input went low)
- Runtime countdown "HH:MM:SS" right-justified when clock enabled and running

### Input Line Behaviour (Lines 2-4)

| Input state | Line content | Flash |
| ----------- | ------------ | ----- |
| Disabled | `Not Used`, left-justified | No |
| Loop open (<=3.6mA) | name left, `err open` right-justified @12-19 | Yes, if it tripped |
| Loop short (>=21mA) | name left, `err shrt` right-justified @12-19 | Yes, if it tripped |
| Normal (analog) | name left, units @13, value @19 | No |
| Normal (switch) | name left, `Flow`/`No Flow` or `Aux`/`No Aux` right-justified @19 | No |
| Bypass timer counting | BP code @0, MM:SS @7, value @19 | **Yes** |
| Alarm | name left, stop code right | **Yes** |

The bypass flash is driven by `display_timer > 0`, i.e. a countdown is actually
running. Because a countdown only runs while the value is in fault (the primary
window is abandoned the moment the threshold is reached), the flash stops by
itself as soon as the reading is OK - no separate "value good" test is needed.

`alarm_flash` toggles at ~3.3Hz and is held at 1 (always visible) when neither
an alarm nor a bypass countdown is active.

### Loop Integrity (NAMUR NE43)

Enabled **analog** inputs are checked every 1-second tick for a loop current
outside the NE43 signal band. Switch types (3, 5) carry no loop current and are
skipped.

| Condition | Current | Counts | Meaning |
| --------- | ------- | ------ | ------- |
| Open | <= 3.6mA | <= 161 | broken wire, disconnected or dead transmitter |
| Normal | 3.8-20.5mA | 170-917 | valid measurement |
| Short | >= 21.0mA | >= 939 | field wiring shorted past the transmitter, or a transmitter failed hard over |

Full scale is 22.9mA, so the over-range trip at 21.0mA sits inside the
measurable range. **This is why the burden is 180R** — a 100R/2.048V or
250R/VDD front end cannot see 21mA at all. Two compile-time guards enforce it
(`ADC_OVER_RANGE < 1023`, `ADC_UNDER_RANGE < ADC_4MA`).

**Behaviour:**

| State | Action |
| ----- | ------ |
| RUN | **Immediate stop** — no bypass timer, no grace. Relay **latched** (never pulsed: a pulse would let the pump restart with the sensor still broken). All bypass countdowns cancelled ("can only stop once"). Alarm buzzer, line flashes. |
| STOP | Detected and displayed only — the relay is already open. Lets a cut cable be found before a start is attempted. |

Either way the input's line shows the reason in place of the value:

```
Pressure    err open
Temperature err shrt
```

**Settling window.** A 2-wire transmitter draws no loop current until it powers
up, which is indistinguishable from a broken wire. Detection is suppressed for
`SENSOR_SETTLE_SECS` (5s) after boot, after each STOP -> RUN transition, and
after a fault is acknowledged — so a slow sensor cannot trip the pump at start,
and acknowledging cannot instantly re-trip.

**Stop codes** `20 + input index` (20/21/22 for Inputs 1/2/3), clear of both the
bypass codes (2-7) and the event-log range.

### LED Behavior

- **Power LED:** Solid on normally. Flashes 2Hz during power fail display.
- **Signal LED:** On solid when DIG_IN1 (run signal) is high, off when low.
- **Fault LED:** Flashes 2Hz when relay de-energized (fault active), off when relay energized.

---

## Session Checklist

### Starting a Session

1. Pull latest from remote: `git pull`
2. Note the current version (`PG-Ver_B-M.m.p` in main.c)
3. Review recent commits for context

### Ending a Session

1. Verify main board compiles
2. Bump MAJOR / MINOR / PATCH only if this session changed what they mean —
   see **Versioning Scheme**. Most sessions change nothing.
3. Update changelog in this file
4. Commit with descriptive message (indicate which board)
5. Push to remote: `git push`
6. Verify push succeeded

---

## Build Notes

### XC8 Compiler Invocation

When running the XC8 compiler from Claude Code, **use PowerShell, not cmd.exe**. The `cmd /c` approach produces no stdout/stderr output, making it impossible to see compilation errors or warnings. Use:

```powershell
powershell.exe -Command "cd 'c:\Users\PeeWee\Documents\engineering_repo\Irrisys_Controller'; & 'C:\Program Files\Microchip\xc8\v3.00\bin\xc8-cc.exe' -mcpu=18F26K22 src\main.c src\encoder.c src\menu.c src\eeprom.c src\lcd.c src\i2c.c src\rtc.c src\pca9535.c -o src\main.hex -I include 2>&1; Write-Host EXIT_CODE:$LASTEXITCODE"
```

Do **not** use `cmd /c build.bat` or `cmd /c "..."` -- output is silently lost.

### Source Files Compiled

```
src\main.c src\encoder.c src\menu.c src\eeprom.c src\lcd.c
src\i2c.c src\rtc.c src\pca9535.c
```

### Programming the board

Use **`build_pk5.bat`** — it compiles and then flashes via the **PICkit 5**, and
reports success or failure with a real exit code, so a flash can be confirmed:

```
ipecmd.exe -P18F26K22 -TPPK5 -F"src\main.hex" -M -OL
```

at `C:\Program Files\Microchip\MPLABX\v6.30\mplab_platform\mplab_ipe\ipecmd.exe`.
`-M` program, `-OL` release from reset, no `-W` (the board is self-powered).
MPLAB IPE must be closed — it and `ipecmd` cannot both own the PICkit, so the
script closes it first.

> **The MELabs U2 (`build.bat`) is faulty — do not use it.** Diagnosed
> 2026-08-27: **Vpp collapses to 7V** against the 8-9V the K22 requires, with a
> verified-good 10k pull-up drawing only 0.4mA. It presented as garbage device-ID
> reads that differed on every attempt (PIC18F2525, then dsPIC33FJ32GP202),
> erase failures and config-write failures, while ordinary reads and
> program-memory writes still scraped through. Half a day was lost to it, and a
> perfectly good PIC was replaced on its false evidence.
>
> **If any programmer reports a wrong or varying device ID, measure Vpp on MCLR
> *during* an attempt before suspecting the chip or the board** — every static
> check passes with a dead Vpp driver.

The **PICkit 3 cannot be used here**: MPLAB X v6.30's device packs list only
ICD3/4/5 for PIC18F-K, v6.20 is a partial install with no IPE, and the
standalone `PK3CMD.exe` on this machine has no device file.

### Last Known Build Size (Ver 3 Rev 63)

- Program: 89.9%
- Data: 73.7%

> Includes the temporary 4Hz debug heartbeat (`DEBUG_STREAM`), which comes out
> before release along with the dead code listed in [OPEN_ITEMS.md](OPEN_ITEMS.md).

---

## Future Hardware Notes

### Moving MCU — the 46K22 does NOT buy code space

A natural assumption is that the next edition can move to the **PIC18F46K22**
for headroom. It cannot. From the family table, the two parts are identical in
memory:

| | 26K22 (current) | 46K22 |
| --- | --- | --- |
| Flash | 64K | 64K |
| Single-word instructions | 32768 | 32768 |
| SRAM | 3896 | 3896 |
| EEPROM | 1024 | 1024 |
| **I/O** | **25** | **36** |
| **10-bit A/D channels** | **19** | **30** |

The 46K22 buys **pins**, not program space — eleven more I/O and eleven more
analog channels.

So the decision splits by what the next edition actually needs:

- **More inputs** (a fourth sensor channel, more digital inputs) -> 46K22 is the
  right move. Same family, same core, same peripherals; the port is mostly pin
  definitions.
- **More code space** -> the K22 family is at its ceiling and this build already
  sits near it. That means a different family (the later PIC18 K42 / Q43 lines
  reach 128KB) - verify against the datasheet rather than assuming.

A second reason to look at those later families when the time comes: they have
**Peripheral Pin Select**, which would move the debug UART off PGC/PGD and
dissolve the ICSP conflict described below instead of working around it.

### Debug UART shares the ICSP pins

EUSART2 is fixed on **RB6/RB7** on the 26K22 - no remapping - and those are
**PGC/PGD**. A connected programmer and working debug serial are therefore
mutually exclusive: unplug the PICkit before expecting serial output.

**The MAX232 is DNP in production.** It stays in the design but is not placed,
since the debug serial is a development and servicing channel, not a field one.
Servicing a returned unit means a **TTL adaptor on the ICSP header** - which
matters because that is the **only** way to read the failure log off a unit
whose display has failed.

---

## Reference

- Hardware files: OneDrive (see path above)
- Datasheets: AD7994, RV-3028-C7, MAX22193, PIC18F26K22, PIC18F14K22
- LCD: NHD-0420AZ-FL-YBW-33V3 (4x20 HD44780)
