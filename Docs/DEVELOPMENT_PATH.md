# Irrisys Pumpguard Ver B — Firmware Development Path to Next Prototype (Rev 2)

**Sources:** Notion "Pumpguard Ver B" (Rev 2 Design Review, 2026-07-02) + "Irrisys_PG_MainBrd_Ver_B_Rev_2 — Production Files" (BOM, 2026-04-20), cross-checked against the firmware on `refactor/control-core`.

**Bottom line:** the current firmware **will not run correctly on Rev 2 hardware**. Three hardware changes break it, and one of them (the digital-input IC) may be a substantial driver rewrite. Those must be resolved before any Rev 2 firmware work is meaningful.

---

## 0. Where the firmware actually is today

Verified on hardware (test plan §1-§2 passed):
- Hardening complete: watchdog on (2.05 s), interrupt priorities (RTC 1 Hz = high), no dropped ticks, no blocking >10 ms in the loop, config-wipe bug fixed, display self-heal.
- **Not done:** control-core extraction (`control.c`), C7 (zero-setpoint disables monitoring), menu.c cleanup, DIG2-4 standalone channels.
- **Untested:** the entire safety path (test plan §7 bypass/relay, §9 simultaneous faults).

---

## 1. 🛑 BLOCKERS — answer these before writing Rev 2 firmware

### B1. ADC reference / 220R burden — **decision still pending**
Rev 2 changes the burden 100R → 220R. At 20 mA that is **4.40 V**, which **exceeds the 2.048 V FVR** the firmware currently uses as the ADC reference. The ADC saturates at ~9.3 mA — **the top half of every sensor range silently reads full-scale.** Safety-critical.

- The 4.096 V FVR is **also insufficient** (clips at ~18.6 mA).
- Only practical option: **VDD (~5.0 V)** as reference (`ADCON1` PVCFG=00), which then ties accuracy to the 5 V rail.
- **Needed:** confirm the VREF source. Then rescale `ADC_4MA`/`ADC_20MA` and any raw-count fault thresholds.

*(Also note: Rev 2 puts a **MAX14626** current-loop protector in each channel. Confirm whether it introduces a voltage drop or offset that affects scaling, and whether its fault output is wired to the PIC — it may give us free open-loop/overcurrent detection.)*

### B2. 🔴 MAX22193 (U5) digital-input IC — **biggest unknown**
Rev 2 routes all 4 digital inputs (Din_1_Run, PNP_1/2/3) through **U5 = MAX22193ATP+**. The current firmware reads them as **direct GPIO on RA4-RA7**.

- **If U5 presents parallel logic outputs to the PIC** → small change (possibly none, if it lands on the same pins).
- **If U5 is SPI/serial** (the MAX221xx family generally is) → **new driver + rework of every digital-input read**, including `read_digital_input()`, the run/stop signal, and the DIG2-4 work.
- **Needed:** the Rev 2 schematic — how is U5 connected to the PIC? This single answer decides whether digital inputs are a 1-hour job or a 1-week job.

### B3. RTC part — DS3231 vs RV-8803
- The **BOM (April)** lists `DS3231MZ+` — matches the current driver (I²C 0x68, 1 Hz SQW → INT0). ✅
- The **Design Review (July)** flags an open item: *"Confirm fitted RTC part vs firmware driver (RV-8803 @ 0x32 / CLKOUT vs DS3231 @ 0x68 / SQW)."* 🟡
- **Needed:** confirm which part is fitted. If RV-8803, the RTC driver **and the 1 Hz tick source** change — and that tick is the heartbeat of every bypass timer.

---

## 2. ⚠️ Conflicts / stale docs found

| Item | Conflict | Action |
|---|---|---|
| **U7 (M24M01 EEPROM)** | BOM (Apr) **lists it**; Design Review (Jul) says **removed** ("log dropped so redundant, parameters in PIC NVS, RC2 freed") | BOM is **stale**. Update it before quoting. *Firmware is already aligned — we removed the event log.* ✅ |
| **RC2 (EEPROM_WP)** | Freed by U7 removal | `config.h` still defines `EEPROM_WP` — harmless, but tidy up |
| **Stop timer** | I removed `stop_timer_secs` as dead code — but Notion **specifies** it ("count up from 00:00:00 when stopped") | It was dead *code*, but it's a **live requirement**. Must be implemented (see §4). |

---

## 3. Phase A — Rev 2 hardware compatibility *(blocking for the prototype)*

Cannot start until B1-B3 are answered.

1. **ADC reference + rescale** (B1) — change VREF, rescale `ADC_4MA`/`ADC_20MA`, rescale fault thresholds, re-verify against a loop calibrator at 4/8/12/16/20 mA.
2. **Digital inputs via MAX22193** (B2) — new driver if SPI; rewire `read_digital_input()` and the run/stop path.
3. **RTC confirm/port** (B3) — keep DS3231 driver, or port to RV-8803 (register map + CLKOUT config + INT0 edge).
4. **Drop external EEPROM remnants** — remove `EEPROM_WP`/RC2, confirm I²C is now RTC-only.
5. **HW/FW compatibility guard** — Rev 0/1 firmware on Rev 2 hardware mis-scales every analog reading with no warning. Consider bumping `HW_VERSION` so the two can't be confused.

---

## 4. Phase B — Finish the control core *(can proceed NOW, in parallel with B1-B3)*

This is hardware-independent and is the work already scoped.

1. **Extract `control.c`/`control.h`** — bypass state machine, fault evaluation, trip pipeline.
2. **Fix C7** — a setpoint of exactly 0 currently disables monitoring for that direction (magic-zero). Replace with an explicit "monitored" flag.
3. **R1** — all bypass timers run concurrently; **first to reach zero trips** and cancels the rest. *(This also closes the Notion open item "Define which bypass timers can run concurrently vs exclusively.")*
4. **Wire DIG2-4** standalone fault channels (config exists, no runtime logic) — **depends on B2**.
5. **Fix C8** — UTILITY menu edit-display off-by-one, then remove the dead log menu items and the unreachable DIGITAL menu (menu 6).

---

## 5. Phase C — Close the spec gaps (Notion spec vs firmware)

These are **specified in Notion but not implemented**. Each needs a decision: build it, or update the spec.

| # | Notion spec | Firmware today | Gap |
|---|---|---|---|
| C1 | Relay mode = **Latch / Pulse / Not Used** | Latch / Pulse only | Add "Not Used" |
| C2 | `relay_high_mode`, `relay_low_mode` (2 per input) | 4 modes (pri/sec × hi/lo) | Firmware is *finer-grained* than spec — confirm which is wanted |
| C3 | Menu item **Display (Show/Hide)**; Display=OFF forces Enable=OFF | Not present | Add, or drop from spec |
| C4 | Pulse mode: on digital input LOW, show **`WAIT`** flashing 1 Hz for **5 s**, then close | Closes after configurable `relay_pulse_time`, no WAIT display | Reconcile (fixed 5 s vs configurable) |
| C5 | Line 1: **stop code flashing** when stopped; **stop timer counts up** when stopped with no code | Status message only; stop timer removed | Implement |
| C6 | Input line cols 15-19: **bypass countdown mm:ss, flashing** | Shows alarm abbreviation, no countdown | Implement — this is genuinely useful (operator sees time-to-trip) |
| C7 | Stop-code re-arm rules: primary = *"once from startup only"*; secondary = *"multiple times, NOT sequentially — must recover above threshold between events"* | Primary = startup grace; secondary re-arms | Verify exact semantics match |

---

## 6. Phase D — Validation

1. Complete the existing **[TEST_PLAN.md](TEST_PLAN.md)** on Rev 1 hardware — especially **§7 (bypass/relay trip)** and **§9 (simultaneous faults)**, which are still entirely unverified. *This gives a trusted baseline before Rev 2 changes anything.*
2. Re-run the full plan on **Rev 2** hardware, plus new ADC calibration tests at 4/8/12/16/20 mA.
3. Add Rev 2-specific tests: MAX22193 digital inputs, MAX14626 loop-fault detection (if wired), RTC tick accuracy.

---

## 7. Recommended sequence

```
NOW ─────────────────────────────────────────────────────────┐
 1. Finish TEST_PLAN §3-§12 on Rev 1  (trusted baseline)     │  no HW dependency
 2. Phase B: control.c extraction + C7 + R1                  │
                                                              │
IN PARALLEL — get answers ───────────────────────────────────┤
 B1  VREF source for 220R                                    │  ← you / hardware
 B2  MAX22193 interface (schematic)   ← BIGGEST RISK          │
 B3  RTC part actually fitted                                 │
                                                              │
THEN ────────────────────────────────────────────────────────┤
 3. Phase A: Rev 2 HW compatibility (ADC, digital, RTC)      │
 4. Phase C: spec-gap decisions                               │
 5. Phase D: full revalidation on Rev 2                       │
```

**The critical path runs through B2 (MAX22193).** Everything else is bounded work; that one could be a driver rewrite. Get the Rev 2 schematic answer first.
