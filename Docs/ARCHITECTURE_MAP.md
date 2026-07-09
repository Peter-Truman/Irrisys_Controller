# Irrisys Controller — Architecture & Behavior Map (Phase 1)

**Purpose:** Full-codebase map produced before the control-core refactor, so the target design is grounded in what the code *actually does* (not what the docs say). Read this before any Phase 2 code moves.

**Scope:** Main board (`src/`, `include/`, ~6.5k lines) + Display board (`display/`, ~1.7k lines). No automated tests exist; behavior is verifiable only on hardware. Branch `refactor/control-core`; restore point tag `pre-refactor-restore`.

---

## 1. System Overview

Two PICs over a one-way 19200-8N1 serial link (main → display).

- **Main board** PIC18F26K22 @32MHz: control logic, ADC, RTC tick, relay, encoder/button, internal EEPROM config, menu system.
- **Display board** PIC18F14K22 @8MHz: HD44780 4×20 LCD, 3 LEDs, backlight PWM. Pure slave — renders frames, no logic.

### Timing backbone (the two clean signals to build on)
| Signal | Source | Rate | Consumer |
|---|---|---|---|
| `subtick_flag` | Timer0 ISR (1ms → ÷50) | 50ms | main-loop fine timing, render, LED/alarm flash |
| `rtc_tick_flag` | DS3231 1Hz → INT0 | 1000ms | runtime clock, relay pulse, power-detect, **bypass timers** |

Both are set in the `encoder.c` ISR and cleared in the main loop. **Both are boolean flags, not counters** — see Critical Finding C1.

---

## 1a. Design Requirements (AUTHORITATIVE — user, 2026-07-09)

These govern the Phase 2 refactor and override any conflicting current behavior.

- **R1 — First bypass timer to reach 0 triggers the stop.** All active bypass timers (every parameter, every direction) count down **independently and simultaneously** while the pump runs. Whichever reaches **0 seconds first** triggers its associated stop, de-energizes the relay, and cancels all other timers (the pump can only stop once). No priority comparison or timer-duration sorting is needed — the shortest *remaining* countdown wins by construction. *Example: if over-pressure (1 s bypass) and over-temperature (5 min bypass) are both out of bounds simultaneously, pressure always trips first.* Aim: tightest applicable timeout always governs → best pump protection. (Edge case: if two timers hit 0 on the same 1 s tick, break the tie deterministically, e.g. lowest input index, then high-before-low direction.) *This is essentially the current behavior (first-to-ALARM cancels others); the refactor must preserve it — the key invariant is that all timers run concurrently, not one-at-a-time.*
- **R2 — Relay modes:** **Latch** (stays de-energized/open until a button press clears it) OR **Pulse** (auto-resets, ready for the next run). Per-trip-source configurable (matches existing `relay_*_mode` fields).
- **R3 — No/minimal blocking code.** Where blocking is unavoidable, run it as a **state machine**, never a busy-wait. (Addresses C1/C2 — beeps, LCD flush, EEPROM writes, I2C all become non-blocking or state-machined.)
- **R4 — RTC tick is a PRIORITY interrupt.** Enable interrupt priorities (IPEN) and put INT0 (DS3231 1Hz) on **high priority** so the safety-critical 1Hz tick can never be delayed or dropped by other ISR work. Combine with C1 (tick as counter, not boolean) so no second is ever lost.
- **R5 — Watchdog ON** to mitigate F/W hang risk (C4). Recommended config below.

### WDT recommendation (PIC18F26K22)

WDT base period ≈ 4 ms × `WDTPS`. Current config is `WDTEN=OFF`, `WDTPS=32768`.

- **Interim (before de-blocking):** `WDTEN=ON`, **`WDTPS=1024` → ~4.1 s** timeout. Must exceed the current worst-case blocking op: a full `save_current_config()` ≈ ~2 s of internal-EEPROM writes. Add `CLRWDT()` in the main loop **and inside the EEPROM block-write loop** (`eeprom_write_block`) so long saves don't false-trip.
- **Target (after R3 de-blocking, step 5):** once no single operation blocks >~50 ms, tighten to **`WDTPS=64`–`256` → ~256 ms–1 s** for fast hang detection. Keep a single `CLRWDT()` at the top of the main loop only; a hang anywhere else then trips within ~1 s.
- Use config-bit `WDTEN=ON` (always-on) rather than `SWON` so the watchdog cannot be left disabled by a code path. Keep `WDTPS` in the config bits.
- Pair with a **reset-cause check at boot** (`RCON` STKFUL/STKUNF/`/TO`/`/PD`): on a WDT-reset, log/flag it and boot into a SAFE state (relay de-energized / pump stopped) rather than assuming RUN.

---

## 2. Main Loop Execution Order (`src/main.c`, loop at :871)

**Every iteration (~20Hz, ungated):**
1. Blocking beep if `short_beep_flag`/`long_beep_flag` (:876) — *blocking, see C2*
2. Read 4 digital inputs + debug edge print (:891)
3. RUN/STOP state machine on DIG_IN1 (:924)
4. ADC sample 3 ch → 4-sample rolling avg (:1033) *(comment says 8-sample — wrong)*
5. Gate `if(!subtick_flag) continue;` (:1068)

**Every 50ms subtick:**
6. Buzzer countdown (:1072) · 7. Alarm buzzer pattern (:1080) · 8. Alarm flash ~3.3Hz (:1103)
9. **`if(rtc_tick_flag)` → 1-second block** (:1118): runtime clock, relay-pulse countdown, power-detect countdown, **bypass timer processing (RUN only, :1190)**
10. Deferred EEPROM saves (:1292) · 11. Render main screen ~4Hz (:1309) · 12. Encoder (:1319) · 13. Button (:1351) · 14. Return-to-main (:1416) · 15. Edit blink (:1427) · 16. Menu timeout (:1483) · 17-18. LED flash + mask to display (:1503)

**Safety note:** state transitions (step 3) run every ~20Hz but bypass action (step 9) only at 1Hz. Relay trips occur *before* EEPROM/log writes — correct ordering.

---

## 3. The Control (Safety) Path — end to end

**State:** `sys_state` (STOP/RUN, from DIG_IN1). `bp_state[3]` each `{high,low}` of `{uint16 countdown; uint8 phase}`. Phases INACTIVE/PRIMARY/NORMAL/SECONDARY/ALARM.

**Per enabled input, each 1Hz tick (`main.c:1190-1285`):**
1. **Digital** (type 3/5): `high_fault = (read_digital_input(i) == fault_polarity)`. Low direction never evaluated.
2. **Analog** (type 0/1/2/4): `val = adc_to_eng(avg, scale_4ma, scale_20ma)`; `high_fault = val >= high_setpoint` (guarded), `low_fault = val <= low_setpoint` (guarded). **Guard uses `high_setpoint != 0` — a genuinely-zero setpoint disables monitoring (magic-zero, C7).**
3. `process_bp()` steps the state machine (:568). PRIMARY = startup grace expecting fault to clear; NORMAL→SECONDARY on fault (if sec>0) else immediate ALARM; SECONDARY expiry → ALARM.
4. On ALARM: pick relay mode → `trigger_relay_pulse()`, set `active_stop_code` (encoding 1=EndRun; hi=2+2i→2/4/6; lo=3+2i→3/5/7), `save_power_flags()`, set `alarm_code_text`, **cancel ALL other bypass timers**, `start_alarm_buzzer()`.

**Relay:** `trigger_relay_pulse(latch)` de-energizes (opens = pump stop); latch stays open until cleared, pulse re-closes after `relay_pulse_time` via 1Hz countdown. Trip sites: boot latched-fault (:800), runtime expiry (:1139), bypass hi (:1227), bypass lo (:1258).

**Key gap:** `init_bp_timers` monitors *every* enabled input in *both* directions regardless of configured setpoints/bypasses, while the per-tick guard uses different criteria (`setpoint != 0 || bypass > 0`). The "is this direction monitored" decision is **split across two functions with different logic** — fragile.

---

## 4. Module Map (responsibilities · key state · dependencies)

| Module | Lines | Responsibility | Owns (globals) | Notes |
|---|---|---|---|---|
| `main.c` | 1533 | Init, main loop, ADC, bypass SM, relay, run/stop, alarms, render | `sys_state`, `bp_state[3]`, `alarm_*`, `relay_*`, ADC buffers | Control core lives inline here — extraction target |
| `menu.c` | 2518 | Menu system, field editing, deferred-save dirty flags | `menu`, `current_menu`, `input_menu[]`+tags, `*_dirty` | Tag-driven INPUT menu (robust); hardcoded-index UTILITY (buggy) |
| `encoder.c` | 309 | **The ISR** (Timer0 1ms + INT0 1Hz), encoder decode, button FSM | all tick/flag/button/timeout volatiles | Sole writer of ISR/main shared state |
| `eeprom.c` | 281 | Internal EEPROM config load/save, checksum, defaults, deferred saves | `input_config[3]`, `system_config` | Raw struct-image persistence — offset-fragile |
| `lcd.c` | 241 | Buffered 4-line LCD, serial frames to display, Fletcher-16 | static line buffers | Blocking flush (`__delay_ms` per line) |
| `i2c.c` | 183 | MSSP master (RTC + M24M01) | — | **~10kHz bus** (not 100k); `i2c_write` no timeout |
| `rtc.c` | 161 | DS3231 init → 1Hz SQW on INT0 | — | Time-of-day API present but **dead**; only SQW used |
| `ad7994.c` | 119 | External ADC | — | **FULLY DEAD** (internal ADC used) |
| `pca9535.c` | 299 | I/O expander LEDs | `port0_output_state` | **Boot self-test only**; runtime LEDs via serial |
| `eventlog.c` | 221 | Event log (M24M01) | — | **DISABLED** (Phase 0.5), dropped from build |

**Display board:** `main.c` (init+loop), `protocol.c` (frame FSM, Fletcher-16, cmd dispatch), `uart.c` (IRQ RX, 64B ring), `lcd.c` (HD44780 4-bit), `led.c` (**owns Timer0 @10kHz**, LED PWM + backlight soft-PWM + EEPROM persist), `pwm.c` (**dead, not built**).

---

## 5. ISR ↔ Main Shared-State Boundary (`encoder.c`)

The ISR is the **only** writer of: `encoder_count`(i16), `button_pressed`/`button_event`/`button_state`(u8), `button_hold_ms`/`button_hold_captured`(u16), `short_beep_flag`/`long_beep_flag`, `menu_timeout_timer`/`_flag`(reload written by main), `encoder_ms_timer`(u16), `rtc_tick_flag`, `subtick_flag`. All are `volatile`.

**Menu-timeout runs in 2ms units** (`ms_counter` ÷2 in ISR) — reconciles the `main.c:701 reload = seconds*500` puzzle (500 × 2ms = 1s per unit... verify during refactor).

**Button FSM:** 20ms debounce → short beep immediately; `LONG_PRESS_MS = 1000` (comment says 500); long press fires non-blocking at 1s; release debounce 30ms.

---

## 6. EEPROM Layout (offset-load-bearing — do not shift)

3× `input_config_t` (128B each @ 0x000/0x080/0x100) + `system_config_t` (128B @ 0x180) + 2B checksum @ 0x200. Total 514B of 1024B (~510B headroom). Persisted as **raw struct image** — no versioning, no packing pragma. **Only safe evolution: consume a `reserved_*` field in place.** `save_power_flags()` hard-codes offsets +20/+21 decoupled from the struct. `log_entries` @48-49 must stay (offset stability).

---

## 7. CRITICAL FINDINGS (ranked — these shape Phase 2)

### C1 — Dropped RTC ticks make bypass timers run slow *(safety)*
`rtc_tick_flag` is a boolean, not a count (`encoder.c:277`). Any main-loop iteration that blocks >1s (or spans two 1Hz ticks) **loses a second** on `run_timer_secs`, `relay_counter`, `pwr_detect_countdown`, and **all bypass countdowns**. Effect: under load, bypass trips fire *late*. Blocking sources that can cause this: beep (C2), LCD flush (~40ms), EEPROM writes (~512ms/block), I2C stalls (C4). **Fix direction:** make the tick a counter; drain N ticks per pass.

### C2 — Blocking `beep()` in the loop *(safety-adjacent)*
`beep()` busy-waits with `__delay_ms` (`main.c:214`), called on every menu step (:1323), button clear (~180ms), timeout (~250ms). Stalls the whole loop including the bypass tick that follows. **Fix:** route all beeps through the existing non-blocking buzzer countdown.

### C3 — `save_power_flags()` can trigger a full factory-reset wipe *(data integrity)*
It writes 2 bytes but recomputes the checksum over **all of RAM** (`eeprom.c:233`). If a menu edit has been applied to RAM but its deferred EEPROM flush hasn't run yet, the stored checksum matches RAM, not the EEPROM body → next boot sees a mismatch → **overwrites all config with factory defaults.** Latent race between deferred saves and power-flag saves. **Fix:** checksum over the EEPROM image, or flush pending dirty configs first, or scope the checksum.

### C4 — `i2c_write` has no timeout *(hang risk, WDT is OFF)*
`while(!PIR1bits.SSPIF);` (`i2c.c:131`) hangs forever on a non-responding slave. Every other wait is timeout-guarded. With `WDTEN=OFF` there's no recovery. **Fix:** add timeout; consider enabling WDT.

### C5 — No GIE disable around EEPROM unlock *(silent write failure)*
`EECON2=0x55;0xAA;WR=1` (`eeprom.c:113`) runs with interrupts enabled; a 1ms Timer0 or 1Hz INT0 mid-sequence aborts the write. **Fix:** clear GIE across the unlock.

### C6 — Torn 16-bit reads of ISR state *(race)*
`encoder_count`, `button_hold_*`, `menu_timeout_timer` are multi-byte, read by main with GIE on → Timer0 can update mid-read → torn value / lost `encoder_count` consume. **Fix:** atomic accessor (brief GIE/Timer0 mask).

### C7 — Magic-zero setpoint disables monitoring *(safety)*
`high_setpoint != 0` guard (`main.c:1214`) means a legitimate 0 psi/°C threshold silently won't fault. Plus the split monitor-decision logic (§3). **Fix:** explicit per-direction "monitored" flag.

### C8 — UTILITY menu off-by-one (confirmed) *(cosmetic-during-edit)*
`menu_update_edit_value` cases 3/6 should be 2/5 (`menu.c:1679`); `menu_update_time_value` cases 4/5/7 should be 3/4/6 (`menu.c:1571`). Editing shows frozen/wrong live values (Pwr Detect edit corrupts the Menu T/O row). Saved values are correct. **This is why we deferred the UTILITY renumbering in Phase 0.5.**

### C9 — Checksum mislabeled & weak
Docs say Fletcher-16; `eeprom.c:70` is a plain additive byte-sum (order-insensitive, misses transpositions). *(Note: the LCD/protocol Fletcher-16 IS real and matches between boards — different checksum.)*

### C10 — Duplicate `mainboard/src/` tree
Untracked stale fork of `main.c`/`menu.c`/`eeprom.c` with divergent behavior (different `log_entries` logic, `ad7994_init_old`). **Risk of editing the wrong tree.** Should be deleted/quarantined early in Phase 2.

---

## 8. Dead Code Inventory (safe-to-remove candidates)

| Item | Location | Verdict |
|---|---|---|
| `ad7994.c/.h` | whole module (in build) | Fully dead — remove + drop from build.bat |
| `pca9535.c/.h` | runtime API | Boot self-test only; `led_toggle`/`read_register`/`update_power_led` = 0 callers |
| DIGITAL menu (menu 6) | `menu.c` draw/save/flags | Unreachable — nothing sets `current_menu=6` |
| `stop_timer_secs` | `main.c:260` | Only ever set to 0 |
| `convert_for_display/to_standard` | `main.c:306` `#if 0` | Deliberate suspend (units) |
| Tags `FT_UNITS/PRI_BP/SEC_BP/RLY_*_FAULT/NAME` | `menu.c` | Defined, never assigned |
| `mainboard/src/*` | untracked | Stale duplicate tree |
| `pwm.c` (display) | not built | Dead; repurpose for C11 |
| RTC time-of-day API | `rtc.c:73-162` | Dead (only SQW used) |
| `relay_ms_counter`, `last_btn`, `long_press_beep_flag` | `encoder.c` | Dead |

### C11 — Display contrast (`'K'`) is a silent no-op
`protocol.c:80` TODO; main board sends contrast, display accepts+CRCs+discards it. RC5 held static LOW. Contrast uncontrollable in firmware. `pwm.c` (dead) was meant to drive it.

### Unimplemented feature — standalone DIG2/3/4 fault channels
`system_config.dig2/3/4_*` fields + stop codes 10/11/12 exist in EEPROM/docs but **no runtime code reads them**. RA5-7 currently serve only as the digital-sensor source for the 3 unified inputs. (This was the "DIG2-4 gap" from the control-section discussion.)

---

## 9. Proposed Phase 2 Sequencing (for review)

Ordered by risk-reduction per step, each independently compilable + hardware-verifiable + committed:

1. **Quarantine `mainboard/src/` + clean generated artifacts** (C10) — remove the wrong-tree hazard first. Zero behavior change.
2. **Remove fully-dead code** (ad7994, dead tags, DIGITAL menu, stop_timer_secs) — shrinks surface. Behavior-neutral.
3. **Harden persistence** (C3 checksum-over-image, C5 GIE guard, C9 real checksum, `_Static_assert(sizeof==128)`) — data-integrity, isolated to eeprom.c.
4. **Harden ISR boundary + timing + WDT** (R4 IPEN + INT0 high-priority, C1 tick counter, C6 atomic accessors, C4 i2c timeout, R5 WDT-on + boot reset-cause safe state) — the real-time foundation the control core sits on.
5. **De-block the loop** (R3, C2 non-blocking beep; state-machine LCD flush / EEPROM / I2C) — prerequisite for C1 and for tightening the WDT.
6. **Extract `control.c`/`control.h`** — move bypass SM + evaluation + trip into a module with a clean interface; implement **R1 (shortest-timer-wins priority)**, **R2 (latch/pulse)**; fix C7 (explicit monitored flag) and unify the split monitor logic. *The original "control section" goal.*
7. **Fix + restructure menu.c** (C8 off-by-one, then the deferred UTILITY log-item removal, then tackle the file's size/duplication).
8. **Wire standalone DIG2-4** (if still wanted) on the new control module.
9. **ADC reference / 220R scaling** (Rev 2 hardware) once the VREF decision is made.
10. **Display contrast fix** (C11) — repurpose `pwm.c`.

Steps 1-5 are pure hardening/cleanup (low risk, high value). Step 6 is the headline refactor. Everything after is feature/quality.
