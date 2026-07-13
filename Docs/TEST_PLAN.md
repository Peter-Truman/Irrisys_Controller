# IRRISYS — Acceptance Test Plan (Baseline before Step 6)

**Firmware under test:** branch `refactor/control-core`, HEAD `47195f8` (Steps 2.1 → 5, with 5b reverted)
**Purpose:** Establish a *verified baseline* before the control-core (`control.c`) extraction rewrites the safety path. Every test below maps to a specific change, so a failure points at a commit.

**Scope note — what is NOT yet implemented (do not test, not bugs):**
- Standalone DIG2/DIG3/DIG4 fault channels (config exists, no runtime logic)
- ADC rescale for Ver_B_Rev_2 220R burden (still 100R / 2.048V FVR)
- Display contrast control (`'K'` command is a no-op on the display board)
- Event log (deliberately removed)
- **C7 known bug:** a setpoint of exactly **0** silently disables monitoring for that direction. Avoid 0 setpoints in tests; it is a known defect scheduled for Step 6.

---

## 0. Equipment

| Item | Purpose |
|---|---|
| 4-20 mA source / loop calibrator | Drive analog inputs 1-3 |
| Switches / links | DIG_IN1 (Run/Stop), DIG_IN2-4 |
| Multimeter or lamp on relay contacts | Observe relay energize/de-energize |
| Serial terminal @ **9600 8N1** on **RB6** (UART2) | Debug output — highly recommended, prints boot/state/alarm messages |
| Stopwatch | Timing tests |

**Relay convention:** energized = closed = **pump runs**. De-energized = open = **pump stopped**.

---

## 1. Boot & Watchdog  *(covers 4e-1, 5c — WDT now ON @ ~2.05 s)*

| # | Test | Steps | Expected | P/F |
|---|---|---|---|---|
| 1.1 | **Boots and stays booted** | Power on. Watch for 60 s. | Splash → main screen. **No reset loop**, no spontaneous reboot. *(A repeating splash = a boot path starving CLRWDT.)* | ☐ |
| 1.2 | Boot sequence completes | Observe splash | IRRISYS / Pump Protection / version shown, 3 startup beeps, then main screen | ☐ |
| 1.3 | Debug UART alive | Terminal on RB6 @9600 | Boot banner + "Ver_B_Rev_0", relay state message | ☐ |
| 1.4 | **No spontaneous resets under load** | Spin encoder fast, mash button, enter/exit menus for 2 min | No reboot. *(WDT is 2.05 s — a stall >2 s would reset.)* | ☐ |

---

## 2. Display & Rendering  *(regression check — 5b was REVERTED here)*

| # | Test | Steps | Expected | P/F |
|---|---|---|---|---|
| 2.1 | **Main screen shows parameters** | Boot, view main screen | Line 1 = state ("Standby"/"Running") + status. **Lines 2-4 show Input 1/2/3 values + units** *(this is the regression we just reverted — confirm it's back)* | ☐ |
| 2.2 | **Menu exit does not blank the screen** | Enter a menu, EXIT | Main screen redraws fully within ~250 ms. **Not blank.** | ☐ |
| 2.3 | Values update live | Vary 4-20 mA on Input 1 | Line 2 value tracks the current | ☐ |
| 2.4 | No garbled/stale lines | Scroll through all menus | Text is clean, no partial/corrupt lines | ☐ |

---

## 3. Encoder & Button  *(covers 4d atomic read, 5a non-blocking beep)*

| # | Test | Steps | Expected | P/F |
|---|---|---|---|---|
| 3.1 | **No random menu jumps** | Spin encoder **fast** both ways in a menu | Selection moves smoothly, 1 step per detent. **No jumps/skips** *(4d torn-read fix)* | ☐ |
| 3.2 | Encoder acceleration | Spin fast on a numeric field | Steps by 20 when fast, 1 when slow | ☐ |
| 3.3 | Short press | Press & release quickly | Single beep; action taken | ☐ |
| 3.4 | Long press | Hold ≥1 s | Longer beep; exits to main screen from any menu | ☐ |
| 3.5 | **Beeps sound correct** | Various presses | Single beep on press; **distinct double-beep** on fault-ack and menu timeout *(5a)* | ☐ |
| 3.6 | Encoder feels responsive | Spin in menu | No sluggishness *(beep no longer stalls the loop)* | ☐ |

---

## 4. Menus & Editing

| # | Test | Steps | Expected | P/F |
|---|---|---|---|---|
| 4.1 | All menus reachable | OPTIONS → Setup → Input 1/2/3, Clock; Utility | Every menu opens, titles correct | ☐ |
| 4.2 | Back / EXIT | On each submenu | Back → parent; EXIT → main screen | ☐ |
| 4.3 | Edit numeric field | Change Input 1 High Setpoint | Value flashes ~4 Hz while editing; new value sticks | ☐ |
| 4.4 | Edit time field (bypass) | Change a bypass timer | MM:SS edits correctly | ☐ |
| 4.5 | Edit option field | Change Sensor type | Menu rebuilds (analog 17 items / digital 13 items) | ☐ |
| 4.6 | Sensor-type change | Input 1 → Flow Switch → back to Pressure | Labels/units change appropriately | ☐ |
| 4.7 | Menu timeout | Enter menu, wait for timeout | Double-beep, returns to main screen | ☐ |
| 4.8 | ⚠️ **UTILITY edit display** | Edit Menu T/O, Pwr Detect, Brightness, Rly Pulse | **KNOWN BUG (C8):** the live value may appear frozen/wrong *while editing*. The **saved** value must still be correct on redraw. Note behavior; do not fail the build on this. | ☐ |

---

## 5. Config Persistence  *(covers 2.3 — the C3 config-wipe fix. HIGH VALUE)*

| # | Test | Steps | Expected | P/F |
|---|---|---|---|---|
| 5.1 | Config survives power cycle | Change Input 1 High Setpoint to a distinctive value (e.g. 177). EXIT. Wait 5 s. Power off/on. | **Value is still 177.** Nothing reset to factory. | ☐ |
| 5.2 | **Config survives a power cut with a pending edit** *(the C3 bug)* | Change a setpoint, EXIT the menu, then **cut power within ~1 s**. Power on. | Config is intact — either the new value or the old one, but **NOT a full factory reset** of all inputs. *(Pre-fix, this could wipe everything.)* | ☐ |
| 5.3 | Multiple inputs persist | Change values on Inputs 1, 2 and 3. Power cycle. | All three retained | ☐ |
| 5.4 | Factory defaults on blank EEPROM | *(optional)* Erase EEPROM, boot | Inputs 1-3 enabled: Pressure/Temp/Flow with default scales | ☐ |

---

## 6. Timing  *(covers 4b tick counter, 4c high-priority INT0)*

| # | Test | Steps | Expected | P/F |
|---|---|---|---|---|
| 6.1 | **1 Hz clock is accurate** | Enable clock, set runtime 00:05:00, start RUN. Time it with a stopwatch. | Counts down **1 real second per second** — 5:00 takes 300 s ±1 s. *(Proves no dropped ticks.)* | ☐ |
| 6.2 | **Clock stays accurate under load** | While running, spin the encoder / navigate menus continuously | Countdown does **not** slow down or lose time *(4b drains ticks — this is the key fix)* | ☐ |
| 6.3 | End of runtime | Let runtime expire | Relay trips, "End RunTime" flashes, alarm buzzer | ☐ |

---

## 7. ⚠️ SAFETY — Bypass Timers & Relay Trip  *(THE CORE. Most important section.)*

Setup: Input 1 = Pressure, 4mA=0, 20mA=360. Use non-zero setpoints (see C7 note).

| # | Test | Steps | Expected | P/F |
|---|---|---|---|---|
| 7.1 | **Relay closes on RUN** | DIG_IN1 high, no faults | Relay energizes = pump runs. Screen "Running". | ☐ |
| 7.2 | **High fault trips relay** | Set High Setpoint 200, Sec High BP = 5 s. RUN. Drive pressure **above 200**. | After **5 s**, relay **de-energizes** (pump stops), alarm buzzer, fault shown | ☐ |
| 7.3 | **Low fault trips relay** | Set Low Setpoint 30, Sec Low BP = 5 s. RUN. Drive pressure **below 30**. | After 5 s, relay de-energizes | ☐ |
| 7.4 | **Fault clearing cancels the timer** | During the 5 s countdown, bring pressure back in range | Countdown **aborts**, relay stays closed, no trip | ☐ |
| 7.5 | **Primary bypass = startup grace** | Set Pri Low BP = 10 s. RUN with pressure already low. | Pump runs for 10 s (grace), then trips if still low | ☐ |
| 7.6 | Primary grace clears | Set Pri Low BP = 10 s. RUN low, bring pressure **into range within 10 s**. | Enters normal monitoring, no trip | ☐ |
| 7.7 | **Bypass timer is accurate** | Sec High BP = 30 s. Trigger fault, time it. | Trips at **30 s ±1 s** | ☐ |
| 7.8 | **Bypass timing accurate WHILE IN A MENU** | Trigger a fault, then immediately enter a menu and navigate | **Still trips on time.** Being in a menu must NOT delay protection. | ☐ |
| 7.9 | Fault while stopped | Drive pressure out of range with DIG_IN1 low | No trip (not monitored when stopped) | ☐ |

---

## 8. Relay Modes — Latch vs Pulse  *(R2)*

| # | Test | Steps | Expected | P/F |
|---|---|---|---|---|
| 8.1 | **Latch mode** | Set Rly Sec High = Latch. Trigger a high trip. | Relay stays **open** even after the fault clears. Requires **button press** to reset. | ☐ |
| 8.2 | Latch reset by button | After 8.1, press the button on the main screen | Distinctive double-beep; relay closes; fault cleared | ☐ |
| 8.3 | **Pulse mode** | Set Rly Sec High = Pulse, Rly Pulse = 5 s. Trigger a trip. | Relay opens, then **auto-closes after ~5 s**, ready for next run | ☐ |

---

## 9. ⚠️ Simultaneous Faults — Shortest Timer Wins  *(R1 — your rule)*

| # | Test | Steps | Expected | P/F |
|---|---|---|---|---|
| 9.1 | **Shortest bypass wins** | Input 1 (Pressure) Sec High BP = **2 s**. Input 2 (Temp) Sec High BP = **60 s**. RUN. Drive **both** out of range at the same time. | **Pressure trips at ~2 s** — the shorter timer wins. Temperature never gets to trip. | ☐ |
| 9.2 | Other timers cancelled | After 9.1 | Input 2's countdown is cancelled (pump can only stop once) | ☐ |
| 9.3 | Reverse the priority | Swap: Pressure BP = 60 s, Temp BP = 2 s. Both out of range. | **Temperature trips at ~2 s** | ☐ |
| 9.4 | Three-way | All 3 inputs faulted with BP = 30/10/5 s | The **5 s** one trips first | ☐ |

---

## 10. Digital Inputs

| # | Test | Steps | Expected | P/F |
|---|---|---|---|---|
| 10.1 | Digital sensor type | Set Input 1 = Flow Switch, Fault Polarity, Sec BP = 5 s | Menu shows 13 items (digital layout) | ☐ |
| 10.2 | Digital fault trips | RUN, assert the fault polarity on DIG_IN2 | Trips after the bypass time | ☐ |
| 10.3 | Signal LED | Toggle DIG_IN1 | Signal LED follows the run signal | ☐ |

---

## 11. Stop Conditions & Indications

| # | Test | Steps | Expected | P/F |
|---|---|---|---|---|
| 11.1 | External stop | RUN, then drop DIG_IN1 | Stops; "Ext Stop" shown | ☐ |
| 11.2 | Power fail flag | Power cycle while running | "Pwr Fail" shown on boot; relay stays open until acknowledged | ☐ |
| 11.3 | Fault LED | With relay de-energized | Fault LED flashes ~2 Hz | ☐ |
| 11.4 | Power LED | Normal operation | Solid on | ☐ |
| 11.5 | Alarm buzzer | On any trip | 6 cycles of ~500 ms on / 250 ms off | ☐ |

---

## 12. Watchdog Reset Behavior  *(covers 4e-2 — optional but valuable)*

| # | Test | Steps | Expected | P/F |
|---|---|---|---|---|
| 12.1 | **WDT reset → safe state** | Force a hang *(e.g. temporarily add a `while(1);` in a menu action, or hold MCLR logic aside)* — **or skip if impractical** | Unit reboots showing **"WatchDog"**, relay **de-energized**, pump does **not** auto-resume | ☐ |
| 12.2 | WatchDog latch clears | Press button on main screen | "WatchDog" clears, relay closes, normal operation | ☐ |

---

## Result Summary

| Section | Pass | Fail | Notes |
|---|---|---|---|
| 1. Boot & Watchdog | | | |
| 2. Display | | | |
| 3. Encoder & Button | | | |
| 4. Menus | | | |
| 5. Config Persistence | | | |
| 6. Timing | | | |
| **7. SAFETY — Bypass/Relay** | | | **must be 100%** |
| 8. Relay Modes | | | |
| **9. Simultaneous Faults** | | | **must be 100%** |
| 10. Digital Inputs | | | |
| 11. Stop Conditions | | | |
| 12. Watchdog Reset | | | |

**Sections 7 and 9 are the product.** Everything else is supporting. If any test in 7 or 9 fails, stop and report — do not proceed to Step 6.

**A failure maps to a commit:** §1 → 4e-1/5c · §2 → 5b(reverted) · §3 → 4d/5a · §5 → 2.3 · §6 → 4b/4c · §7-9 → pre-existing control core (not yet refactored) · §12 → 4e-2.
