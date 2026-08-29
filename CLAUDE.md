# Irrisys Controller - Development Instructions

## Project Overview

**Product:** IRRISYS Irrigation Pump Protection System
**Current Firmware:** Ver 3 Rev 36

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

**⚠️ Hardware/firmware compatibility.** The burden cannot be detected in
firmware and the version string carries no hardware letter. Ver 3 Rev 9 on a
100R or 220R board mis-scales every analog reading, with no warning. **Match
firmware to board by hand.**

Migration checklist: [docs/DEVELOPMENT_PATH.md](docs/DEVELOPMENT_PATH.md) §2.

---

## Versioning Scheme

### Firmware Version Format

```c
#define FW_VERSION  3     // Product/firmware version
#define FW_REVISION 2     // Incremented every change; reset to 0 before release
```

Displayed as: `Ver 3  Rev 2` (splash screen line 3, and the debug UART banner).

- **FW_VERSION** (numeric): The product/firmware version. Currently 3.
- **FW_REVISION** (numeric): Incremented on **every** change during development,
  so a flashed board can always be matched to a specific build. **Reset to 0
  immediately prior to a release.**

> Note: this replaces the earlier `Ver_B_Rev_0` scheme, where the leading field
> was an alphabetic *hardware* version. Hardware revision is no longer encoded
> in the firmware version string - see Hardware Revision Policy below.

### Increment Policy

**Increment FW_REVISION for every change**, including:
- New features or functionality
- Bug fixes that change behavior
- Peripheral driver changes
- Protocol changes (affects both boards)
- Menu structure changes
- Default value changes

**Reset FW_REVISION to 0** immediately prior to a release build.

**FW_VERSION** changes only on a deliberate product version step.

---

## Version Control Strategy

### What Goes Where

| Asset Type                               | Storage  | Versioning                     |
| ---------------------------------------- | -------- | ------------------------------ |
| Firmware (C source, headers)             | GitHub   | Git commits + FW_VERSION/FW_REVISION |
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
│   ├── main.c                 # Entry point, FW_VERSION/FW_REVISION, main loop
│   ├── menu.c                 # Menu system logic, field editing, deferred saves
│   ├── eeprom.c               # Internal EEPROM configuration storage
│   ├── eventlog.c             # Event log (DISABLED — log concept abandoned, dropped from build)
│   ├── encoder.c              # Rotary encoder driver + ISR (Timer0 + INT0)
│   ├── lcd.c                  # Buffered LCD via serial to display board
│   ├── i2c.c                  # I2C bus driver
│   ├── rtc.c                  # DS3231 RTC driver
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
| RTC           | DS3231          | I2C (0x68)       | 1Hz square wave on RB0/INT0                                                                                                           |
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

**`FW_REVISION` MUST be incremented for every change** — it is now the only
build identifier on the display. The build date/time stamp that used to occupy
line 4 appears on the debug UART banner only. Reset `FW_REVISION` to 0
immediately prior to a release build.

### Timing System

The main loop is non-blocking and driven by two interrupt-sourced flags:

| Flag             | Source              | Rate   | Purpose                                        |
| ---------------- | ------------------- | ------ | ---------------------------------------------- |
| `subtick_flag`   | Timer0 ISR (1ms)    | 50ms   | Fine-grained timing, buzzer, LED flash, render |
| `rtc_tick_flag`  | DS3231 INT0/RB0     | 1000ms | Runtime clock, bypass timers, relay pulse      |

### ISR Structure (encoder.c)

Single ISR (`__interrupt()`) with no priority levels (no IPEN). Handles:
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
| BP_INACTIVE  | 0     | Direction not monitored (timer = 0)                 |
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

- If both primary and secondary bypass timers are 0 for a direction, that direction is NOT monitored (BP_INACTIVE).
- If primary > 0, starts in BP_PRIMARY on RUN. The primary window is **abandoned the moment the threshold is reached** (value goes good) -> BP_NORMAL, and any further excursion is handled by the secondary timer. If the value is still in fault when the primary countdown reaches 0 -> BP_ALARM (relay trip attributed to the primary timer). Primary and secondary are never summed.
- If primary = 0 but secondary > 0, starts directly in BP_NORMAL on RUN.
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

Analog types (0,1,2,4) have 17 menu items: Enable, High Setpoint, 2 high bypass timers, Low Setpoint, 2 low bypass timers, Sensor, Units, Scale 4mA, Scale 20mA, 4 relay modes, Back, EXIT.

Digital types (3,5) have 9 menu items: Enable, Polarity, 2 bypass timers, Sensor,
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
| Flow Meter   | L/M, %, LpS     |
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
| 7      | uint8     | relay_pulse_time    | Relay pulse duration (1-120 seconds)             |
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
| 64-127 | uint8[64] | padding             | Expansion space                                  |

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
| Units | L/M |
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
| 0 Pressure | Pressure | psi | 0 | 362 | 200 | 30 | 0 | 1 | 300 | 30 | L/L/L/**P** |
| 1 Temperature | Temperature | C | -50 | 150 | 85 | -10 | 60 | 0 | 0 | 0 | L/L/L/L |
| 2 Flow Meter | Flow Meter | % | 0 | 100 | 0 | 0 | 0 | 0 | 30 | 30 | L/L/L/L |
| 3 Flow Switch | Flow Switch | (none) | - | - | - | - | - | - | **30** | 0 | L/L (polarity **High**) |
| 4 Other 4-20 | Other 4-20 | (user) | 0 | 100 | 0 | 0 | 0 | 0 | 0 | 0 | L/L/L/L |
| 5 Other Switch | Other Sw | (none) | - | - | 0 | - | 0 | 0 | 0 | 0 | L/L/L/L |

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
  |- Clock       -> CLOCK menu (only shown if clock enabled)
  |- Setup Menu  -> SETUP menu
  |- Utility Menu -> UTILITY menu
  +- EXIT        -> Main screen

CLOCK (current_menu = 5, from OPTIONS > Clock)
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
  |- High Setpoint          |- Polarity   (level = present)
  |- Pri High BP            |- Pri BP     (PNFBP - startup)
  |- Sec High BP            |- Sec BP     (SNFBP - running)
  |- Low Setpoint           |- Sensor
  |- Pri Low BP             |- Rly Pri BP
  |- Sec Low BP             |- Rly Sec BP
  |- Sensor                 |- Back -> SETUP
  |- Units                  +- EXIT -> Main screen
  |- Scale 4mA
  |- Scale 20mA
  |- Rly Pri High
  |- Rly Sec High
  |- Rly Pri Low
  |- Rly Sec Low
  |- Back     -> SETUP
  +- EXIT     -> Main screen

CLOCK CONFIG (current_menu = 3, from SETUP > Clock)
  |- Enable (Disabled/Enabled)
  |- Rly Endrun (Latch/Pulse)
  |- Back    -> SETUP
  +- EXIT    -> Main screen

UTILITY (current_menu = 4, from OPTIONS > Utility Menu)
  |- View Log / Clear Log
  |- Menu T/O / Pwr Detect / Brightness / Rly Pulse
  |- About   -> re-shows the splash for 5s
  |- Back    -> OPTIONS
  +- EXIT    -> Main screen

LOG VIEW (current_menu = 7, from UTILITY > View Log)
  Scrollable list of event log entries (newest first)
  |- Back -> UTILITY
```

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
2. Note current FW_VERSION and FW_REVISION
3. Review recent commits for context

### Ending a Session

1. Verify main board compiles
2. Increment FW_REVISION (every change)
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

### Last Known Build Size (Ver 3 Rev 36)

- Program: 81.5%
- Data: 66.9%

---

## Reference

- Hardware files: OneDrive (see path above)
- Datasheets: AD7994, PCA9535, DS3231, MAX22193, PIC18F26K22, PIC18F14K22
- LCD: NHD-0420AZ-FL-YBW-33V3 (4x20 HD44780)
