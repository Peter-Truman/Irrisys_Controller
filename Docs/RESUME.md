# RESUME HERE — Irrisys Firmware Refactor

**Suspended:** 2026-07-14
**Branch:** `refactor/control-core` — fully pushed, working tree clean
**HEAD:** `f0afe02` (local == remote)
**Hard restore point:** tag `pre-refactor-restore` (pushed to GitHub)

---

## ⏭️ PICK UP HERE

**Continue [TEST_PLAN.md](TEST_PLAN.md) at §6 (Timing).** Sections 1-5 PASS.

The chip currently has the build from `f0afe02` flashed (includes the boot EEPROM
config dump on the debug UART, RB6 @ 9600).

**§6.2 is the key test:** set runtime 00:05:00, start RUN, then *continuously spin
the encoder and navigate menus* while it counts down. It must **not lose time**.
That single test validates the whole tick-counter + interrupt-priority effort
(previously a long loop pass silently dropped whole seconds → bypass timers ran
slow → trips fired late).

Then **§7 (bypass → relay trip)** and **§9 (shortest-timer-wins)** — these are the
actual pump protection and are **still completely unverified**.

---

## State of play

### Test plan progress (on Rev 1 hardware)
| § | Status |
|---|---|
| 1. Boot & Watchdog | ✅ PASS (boot trimmed 8.3s → 3.3s) |
| 2. Display | ✅ PASS (found + fixed a real bug) |
| 3. Encoder & Button | ✅ PASS |
| 4. Menus & Editing | ✅ PASS (found + fixed C8) |
| 5. Config Persistence | ✅ PASS (C3 fix holding) |
| **6. Timing** | ⬅️ **NEXT** |
| 7-12 | pending (7 and 9 are the product) |

### Refactor progress
- **Done:** Steps 1-5 — dead code removed, persistence hardened (C3/C5), i2c timeout (C4),
  RTC tick counter (C1), IPEN interrupt priorities (R4), atomic encoder read (C6),
  watchdog ON @ 2.05s (R5) + WatchDog reset safe-state, non-blocking buzzer (R3).
- **NOT done:** **Step 6 — `control.c` extraction** (the original goal), including
  **C7 fix** (zero setpoint silently disables monitoring — live safety bug) and
  explicit **R1** (first-timer-to-zero wins).
- **Reverted:** 5b LCD interrupt-driven TX (broke the display). Needs a careful redo.

---

## Bugs found by testing (both fixed)
1. **Display self-heal** (`f692b60`) — the display link is one-way with no ACK, and the
   change-detection cache suppressed a missed frame **forever**. Main screen never
   appeared after boot. Fixed with a periodic full-screen re-assert. *This would have
   bitten in the field on line noise, not just at boot.*
2. **C8** (`44fdb47`) — UTILITY menu edit indices off-by-one; editing Pwr Detect visibly
   corrupted the Menu T/O row above it. Display-only (saved values were always correct).

---

## Open items (do not lose these)

### Firmware
- **C7 — live safety bug.** A setpoint of exactly **0** silently disables monitoring for
  that direction (magic-zero guard in `main.c`). Fix during the control.c extraction.
- **Per-block EEPROM checksums — recommended.** A power cut *during* the ~512ms config
  write still wipes the ENTIRE config to factory defaults. Per-block checksums (8 spare
  bytes; ~510 free) would contain the damage to one input instead of everything.
  Losing a commissioned pump's whole config to a power blip is a real field risk.
- **Redo the LCD de-block (R3)** — 5b was reverted. The self-heal refresh now in place
  makes a retry safer.
- `DEBUG_EEPROM_DUMP` is currently **1** — set to 0 for production (costs ~1.3s of boot).

### Hardware / next prototype — see [DEVELOPMENT_PATH.md](DEVELOPMENT_PATH.md)
- **We develop on Ver_B_Rev_1 (100R burden). The current firmware scaling is CORRECT for
  Rev 1.** Rev 2 (220R) is still in design, NOT ordered.
- **M2 — biggest unknown:** is the **MAX22193 (U5)** on Rev 2 parallel or **SPI**? Decides
  whether Rev 2 digital inputs are an afternoon or a fortnight. **Answer before the Rev 2
  design freezes.**
- **M1** — 220R burden puts 20mA at 4.40V, above the 2.048V FVR → ADC saturates at ~9.3mA.
  Must move VREF to VDD and rescale. Safety-critical, Rev 2 only.
- **M3** — confirm RTC part actually fitted (BOM says DS3231MZ+ = matches driver; the July
  design review queries RV-8803).
- **Rev 2 BOM is stale** — still lists the removed U7 EEPROM and the 100R burden. Fix
  before sending to PCBCart.

### Spec gaps (S1-S8 in DEVELOPMENT_PATH.md)
Notion specifies things the firmware doesn't do — relay "Not Used" mode, Display Show/Hide,
`WAIT` pulse display, **bypass countdown on the input line** (recommended), stop timer,
stop-code re-arm semantics. Each needs a build-it-or-change-the-spec decision.

---

## Key reference docs
- [TEST_PLAN.md](TEST_PLAN.md) — the acceptance routine, with results so far
- [DEVELOPMENT_PATH.md](DEVELOPMENT_PATH.md) — Rev 1 vs Rev 2, migration checklist, spec gaps
- [ARCHITECTURE_MAP.md](ARCHITECTURE_MAP.md) — full codebase map + design requirements R1-R5
  and the ranked findings C1-C11
