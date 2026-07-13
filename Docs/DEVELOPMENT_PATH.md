# Irrisys Pumpguard Ver B — Firmware Development Path

**Sources:** Notion "Pumpguard Ver B" (Rev 2 Design Review, 2026-07-02) + Rev 2 mainboard BOM, cross-checked against the firmware on `refactor/control-core`.

---

## 0. Which board are we on? (read this first)

**We develop and validate on Ver_B_Rev_1 hardware. Ver_B_Rev_2 is still in design — not ordered.**

| | **Rev 1 — ACTIVE TARGET** | **Rev 2 — future, in design** |
|---|---|---|
| 4-20 mA chain | loop → MAX14626 → **100 R burden** → 1 k series → PIC ADC | loop → TVS → MAX14626 → **220 R burden** → 1 µF → 1 k → PIC ADC |
| 20 mA gives | **2.00 V** | **4.40 V** |
| ADC reference | **2.048 V FVR** ✅ fits | 2.048 V FVR ❌ **saturates at ~9.3 mA** |
| Firmware scaling | **`ADC_4MA=205`, `ADC_20MA=1000` — CORRECT** | must be rescaled + new VREF |
| Digital inputs | direct GPIO RA4-RA7 (working) | routed via **MAX22193 (U5)** — interface TBC |
| External EEPROM | M24M01 (log removed, unused) | **U7 removed**, RC2 freed |

> ✅ **The firmware as it stands today is correct for Rev 1.** No ADC work is needed to keep developing.
> ⚠️ The 1 k series resistor does **not** affect scaling (no DC current into a high-Z ADC pin, so no voltage division) — only the **burden** and **VREF** set the scale.

---

## 1. Work to do NOW — on Rev 1 (no hardware dependency)

### 1a. Finish validation *(highest priority — the safety path is still unverified)*
Complete **[TEST_PLAN.md](TEST_PLAN.md)**. §1 and §2 pass. Still outstanding:
- §3 Encoder & Button, §4 Menus, §5 Config persistence, §6 Timing
- **§7 Bypass timers → relay trip** ← *this is the product*
- **§9 Simultaneous faults / shortest-timer-wins (R1)** ← *this is the product*
- §8 Relay modes, §10 Digital inputs, §11 Stop conditions, §12 Watchdog reset

### 1b. Control-core extraction (Step 6)
- Extract **`control.c` / `control.h`** — bypass state machine, fault evaluation, unified trip pipeline.
- **Fix C7** — a setpoint of exactly **0** currently disables monitoring for that direction (magic-zero guard). Replace with an explicit per-direction "monitored" flag. **Live safety bug.**
- **Implement R1 explicitly** — all bypass timers run concurrently; **first to reach zero trips** and cancels the rest. *(Closes the Notion open item "define which bypass timers can run concurrently vs exclusively".)*

### 1c. Menu / cleanup (Step 7)
- **Fix C8** — UTILITY menu edit-display off-by-one (`menu_update_edit_value` / `menu_update_time_value`).
- Remove the dead View Log / Clear Log / Log Entries items and the unreachable DIGITAL menu (menu 6).

### 1d. Re-do the LCD de-block (R3)
Reverted earlier (it broke the display). Redo the interrupt-driven TX properly — the periodic self-heal refresh is now in place, which makes this safer to retry.

---

## 2. 📌 Rev 2 MIGRATION CHECKLIST — track, do NOT implement yet

Apply only when Rev 2 hardware exists. Nothing here blocks Rev 1 work.

| # | Change | Firmware impact | Status |
|---|---|---|---|
| **M1** | **Burden 100 R → 220 R** | 20 mA = 4.40 V **exceeds the 2.048 V FVR** → ADC saturates at ~9.3 mA, top half of every range reads full-scale. **Safety-critical.** Must move VREF to **VDD (~5 V)** (`ADCON1` PVCFG=00) — the 4.096 V FVR is *also* insufficient (clips at ~18.6 mA). Then rescale `ADC_4MA`/`ADC_20MA` + any raw-count fault thresholds. Accuracy then tracks the 5 V rail. | 🔴 **Decide VREF source** |
| **M2** | **Digital inputs via MAX22193 (U5)** | Firmware reads RA4-RA7 as direct GPIO. If U5 presents parallel logic outputs → trivial. **If SPI → new driver + rewrite of every digital-input read** (run/stop signal, `read_digital_input()`, DIG2-4). | 🔴 **Need Rev 2 schematic — biggest unknown** |
| **M3** | **RTC part** | BOM says `DS3231MZ+` (matches our driver: I²C 0x68, 1 Hz SQW → INT0) ✅. But the July design review flags an open question: **RV-8803 @ 0x32 / CLKOUT**. This tick is the heartbeat of every bypass timer. | 🟡 **Confirm fitted part** |
| **M4** | **U7 (M24M01) removed, RC2 freed** | Already aligned — we removed the event log. Just tidy the now-unused `EEPROM_WP`/RC2 defines in `config.h`. | 🟢 Easy |
| **M5** | **MAX14626 fault output** | Check whether its overcurrent/reverse/open-loop flag is wired to the PIC — if so we get **free loop-fault detection** (broken sensor wire). Worth having. | 🟢 Opportunity |
| **M6** | **HW/FW compatibility guard** | Rev 1 firmware on Rev 2 hardware (or vice-versa) **mis-scales every analog reading with no warning**. Consider bumping `HW_VERSION` so the two can't be confused in the field. | 🟡 Recommend |

---

## 3. ⚠️ Doc conflicts found (worth fixing at source)

| Item | Issue |
|---|---|
| **Rev 2 BOM is stale** | Still lists **U7 (M24M01 EEPROM)**, which the July design review says was **removed**. It also still lists the **100 R** burden. Fix before sending to PCBCart. *(The U7 removal independently confirms our event-log removal was right.)* |
| **`stop_timer_secs`** | I deleted it as dead code — but Notion **specifies** it ("stop timer: count up from 00:00:00 when stopped"). Dead *code*, but a **live requirement**. Now tracked as spec gap S5 below. |

---

## 4. Spec gaps — Notion spec vs firmware (decisions needed)

Each needs a call: **build it**, or **update the spec**. Mostly hardware-independent, so they can be done on Rev 1.

| # | Notion spec | Firmware today | Decision |
|---|---|---|---|
| S1 | Relay mode = **Latch / Pulse / Not Used** | Latch / Pulse only | Add "Not Used"? |
| S2 | `relay_high_mode` / `relay_low_mode` (2 per input) | 4 modes (pri/sec × hi/lo) | Firmware is *finer-grained* than spec — which is wanted? |
| S3 | Menu item **Display (Show/Hide)**; Display=OFF forces Enable=OFF | Not present | Build or drop? |
| S4 | Pulse mode: on digital input LOW → show **`WAIT`** flashing 1 Hz for **5 s** → close | Closes after configurable `relay_pulse_time`; no WAIT display | Fixed 5 s or configurable? |
| S5 | Line 1: **stop code flashing** when stopped; **stop timer counts up** when stopped with no code | Status message only; stop timer removed | Implement |
| S6 | Input line cols 15-19: **bypass countdown mm:ss, flashing** | Shows alarm abbreviation, no countdown | **Recommend building** — operator sees time-to-trip |
| S7 | Stop-code re-arm: primary = *"once from startup only"*; secondary = *"multiple times, NOT sequentially — must recover above threshold between events"* | Primary = startup grace; secondary re-arms | Verify semantics match exactly |
| S8 | Splash screen should show F/W version | Line 4 prints `Ver_B_Rev_0` — confirm it renders (splash hold now 1.5 s) | Check |

---

## 5. Recommended sequence

```
NOW — all on Rev 1 hardware, no blockers
  1. Finish TEST_PLAN §3-§12          ← safety path still unverified
  2. control.c extraction + C7 + R1   ← Step 6, the original goal
  3. menu.c cleanup (C8) + LCD de-block retry
  4. Work through spec gaps S1-S8 with Peter

IN PARALLEL — resolve before Rev 2 is ordered
  M2  MAX22193 interface (schematic)  ← biggest effort risk
  M1  VREF source for the 220R burden ← safety-critical
  M3  RTC part actually fitted

WHEN REV 2 BOARDS ARRIVE
  5. Apply migration checklist M1-M6
  6. Re-run full TEST_PLAN on Rev 2 + ADC calibration at 4/8/12/16/20 mA
```

**Nothing blocks progress today.** The Rev 2 items are tracked, not urgent — but **M2 (MAX22193)** should be answered before the Rev 2 design is frozen, because it could turn a trivial change into a driver rewrite.
