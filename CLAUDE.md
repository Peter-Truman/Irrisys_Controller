# Irrisys Controller - Development Instructions

## Project Overview

**Product:** IRRISYS Irrigation Pump Protection System
**Hardware Version:** Ver_B Rev_1
**Repository:** Firmware only (GitHub) - Two-board system

---

## System Architecture

The system consists of two boards communicating via serial:

| Board | MCU | Function |
|-------|-----|----------|
| **Main Board** | PIC18F26K22 @ 32MHz | Control logic, ADC, RTC, relay, encoder, EEPROM |
| **Display Board** | PIC18F14K22 @ 8MHz | LCD display, LEDs, brightness/contrast PWM |

Communication: Main → Display via serial (19200 baud, 8N1)

---

## Changelog

| Date       | Board | FW Ver | Description |
|------------|-------|--------|-------------|
| 2026-01-19 | Main  | 3      | Baseline - Knight Rider LED, full menu, AD7994, RTC, EEPROM |
| 2026-01-19 | Display | 1    | Initial - LCD driver, LED control, PWM, test harness |
| 2026-02-01 | Main  | 61     | Unified input menu, tag-based fields, 6 sensor types, sensor-specific units, digital inputs, save-on-exit, 4Hz edit flash |

---

## Version Control Strategy

### What Goes Where

| Asset Type | Storage | Versioning |
|------------|---------|------------|
| Firmware (C source, headers) | GitHub | Git commits + BUILD_VERSION |
| Hardware (schematics, PCB, gerbers, BOM) | OneDrive | Folder structure (Ver_X/Rev_Y) |
| Datasheets, reference docs | Either | N/A |

### Rationale
- **Git/GitHub** is optimized for text-based source code with line-by-line diff tracking
- **OneDrive** handles large binary files (DipTrace, STEP, Excel) with built-in versioning and sync
- Mixing binary hardware files in Git causes repository bloat and poor diff support

---

## Firmware Version Control

### BUILD_VERSION Increment Policy

Each board has its own BUILD_VERSION in its `main.c`:
- Main board: `mainboard/src/main.c`
- Display board: `display/src/main.c`

```c
#define BUILD_VERSION X
```

**MUST increment for:**
- New features or functionality
- Bug fixes that change behavior
- Peripheral driver changes
- Protocol changes (affects both boards)
- Menu structure changes

**Do NOT increment for:**
- Code comments or documentation
- Formatting/whitespace only
- Debug code added temporarily

### Git Commit Policy

1. **Commit regularly** after completing each logical unit of work
2. **Push to remote** after each working session (never leave unpushed commits overnight)
3. **Commit message format:**
   - Include which board: `[Main] Add feature X (v4)` or `[Display] Fix PWM (v2)`
   - Detailed: Use body for explanation if needed
4. **Always verify** both boards compile before committing

### Branch Strategy
- `main` or `irrisys-working` - stable, tested code
- Feature branches for experimental work if needed

---

## Project Structure (Firmware)

```
Irrisys_Controller/
├── mainboard/                  # Main board PIC18F26K22
│   ├── src/
│   │   ├── main.c             # Entry point, BUILD_VERSION
│   │   ├── menu.c             # Menu system logic
│   │   ├── eeprom.c           # Configuration storage
│   │   ├── encoder.c          # Rotary encoder driver
│   │   ├── i2c.c              # I2C bus driver
│   │   ├── rtc.c              # DS3231 RTC driver
│   │   ├── ad7994.c           # AD7994 ADC driver
│   │   └── pca9535.c          # PCA9535 I/O expander (old LED control)
│   └── include/
│       ├── config.h           # Pin definitions, system config
│       └── [peripheral].h     # Driver headers
│
├── display/                    # Display board PIC18F14K22
│   ├── src/
│   │   ├── main.c             # Entry point, BUILD_VERSION
│   │   ├── lcd.c              # HD44780 4x20 LCD driver
│   │   ├── pwm.c              # Brightness/contrast PWM
│   │   ├── uart.c             # Serial receive (Phase 2)
│   │   └── protocol.c         # Frame parsing, CRC (Phase 2)
│   ├── include/
│   │   ├── config.h           # Pin definitions, oscillator
│   │   └── [module].h         # Headers
│   └── CLAUDE.md              # Display-specific protocol spec
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
- **Version (Ver_X):** Major hardware redesign
- **Revision (Rev_Y):** Minor changes (routing, component swaps)
- Each revision folder contains ALL related files (schematic, PCB, BOM, gerbers, P&P)

---

## Serial Protocol (Main → Display)

See `display/CLAUDE.md` for full protocol specification.

### Frame Structure
```
[STX] [CMD] [LEN] [DATA...] [CRC16-LO] [CRC16-HI] [ETX]
 0x02  1 byte 1 byte 0-24 bytes  Fletcher-16       0x03
```

### Commands Summary

| CMD | Description |
|-----|-------------|
| `1`-`4` | Text for lines 1-4 (with embedded control codes) |
| `C` | Clear display |
| `B` | LCD Brightness (0-100) |
| `K` | LCD Contrast (0-100) |
| `L` | LED state (bit mask) |

### Embedded Control Codes
`\x10`-`\x11` Blink on/off, `\x12`-`\x13` Underline on/off, `\x14`-`\x15` Cursor show/hide, `\x16`-`\x17` Cursor left/right, `\x18` Cursor to column, `\x19`-`\x1C` Scroll

---

## Hardware Specifications

### Main Board (PIC18F26K22)

| Component | Part | Interface | Notes |
|-----------|------|-----------|-------|
| MCU | PIC18F26K22 | - | 32MHz (8MHz + 4x PLL) |
| Encoder | Rotary + switch | GPIO + interrupt | Short/long press |
| RTC | DS3231 | I2C (0x68) | 1Hz square wave |
| ADC | AD7994 | I2C (0x22) | 3 channels |
| Digital Input | MAX22193 | GPIO | 4 channels |
| Relay | - | GPIO | Normally energized (closed=pump runs). De-energize to stop pump. Fail-safe: power loss drops relay and stops pump. Pulse/latch modes. |
| Buzzer | - | GPIO | User feedback |
| Serial TX | - | UART | To display board |

### Display Board (PIC18F14K22)

| Pin | Function | Notes |
|-----|----------|-------|
| RA2 | PWR LED | Active LOW |
| RA4 | Signal LED | Active LOW |
| RA5 | Fault LED | Active LOW |
| RB5 | Serial RX | From main board |
| RC0-3 | LCD DB4-7 | 4-bit mode |
| RC4 | Brightness | PWM |
| RC5 | Contrast | PWM (CCP1) |
| RC6 | LCD E | Enable |
| RC7 | LCD RS | Register Select |

---

## EEPROM Configuration Structures

### Memory Layout
| Region | Address | Size | Description |
|--------|---------|------|-------------|
| Input 1 config | 0x000 | 128 bytes | `input_config_t` |
| Input 2 config | 0x080 | 128 bytes | `input_config_t` |
| Input 3 config | 0x100 | 128 bytes | `input_config_t` |
| System config | 0x180 | 128 bytes | `system_config_t` |
| Checksum | 0x200 | 2 bytes | Fletcher-16 over all config |

### input_config_t (128 bytes per input)

| Offset | Type | Field | Description |
|--------|------|-------|-------------|
| 0 | uint8 | enable | 0=Disabled, 1=Enabled |
| 1 | uint8 | sensor_type | 0=Pressure, 1=Temp, 2=FlowMeter, 3=FlowSw, 4=Oth4-20, 5=OthSw |
| 2 | uint8 | fault_polarity | Digital types: 0=Fault Low, 1=Fault High |
| 3 | uint8 | config_flags | Bit flags for per-input options |
| 4-7 | uint8[4] | reserved1 | Future expansion |
| 8-9 | int16 | scale_4ma | 4mA scaling value (-999 to +999) |
| 10-11 | int16 | scale_20ma | 20mA scaling value (-999 to +999) |
| 12-13 | int16 | high_setpoint | High setpoint (signed) |
| 14-15 | int16 | low_setpoint | Low setpoint (signed) |
| 16-23 | int16[4] | reserved_signed | Future signed values |
| 24-25 | uint16 | primary_high_bypass | Pri high BP (seconds) / Digital: pri fault BP |
| 26-27 | uint16 | secondary_high_bypass | Sec high BP (seconds) / Digital: sec fault BP |
| 28-29 | uint16 | primary_low_bypass | Pri low BP (seconds) |
| 30-31 | uint16 | secondary_low_bypass | Sec low BP (seconds) |
| 32-55 | uint16[12] | reserved_uint16 | Future 16-bit values |
| 56 | uint8 | relay_pri_high_mode | 0=Latch, 1=Pulse |
| 57 | uint8 | relay_sec_high_mode | 0=Latch, 1=Pulse |
| 58 | uint8 | relay_pri_low_mode | 0=Latch, 1=Pulse |
| 59 | uint8 | relay_sec_low_mode | 0=Latch, 1=Pulse |
| 60-63 | uint8[4] | reserved_relay | Future relay config |
| 64-79 | uint32[4] | reserved_uint32 | Future large values |
| 80-95 | char[16] | name | Sensor name (null-terminated, max 15 chars) |
| 96-103 | char[8] | units | Units string (null-terminated, e.g. "psi", "°C", "L/M") |
| 104-127 | uint8[24] | padding | Expansion space |

### Sensor Types

| Value | Type | Analog/Digital | Labels (High/Low) | Bypass Prefixes |
|-------|------|----------------|--------------------|--------------------|
| 0 | Pressure | Analog | High Press / Low Press | PHP, SHP, PLP, SLP |
| 1 | Temperature | Analog | High Temp / Low Temp | PHT, SHT, PLT, SLT |
| 2 | Flow Meter | Analog | High Flow / Low Flow | PHF, SHF, PLF, SLF |
| 3 | Flow Switch | Digital | Flow (high only) | PF, SF, PNF, SNF |
| 4 | Other 4-20 | Analog | High Value / Low Value | PHV, SHV, PLV, SLV |
| 5 | Other Switch | Digital | Aux (high only) | PA, SA, PNA, SNA |

Analog types (0,1,2,4) have 16 menu items: Enable, Sensor, Units, Scale 4mA, Scale 20mA, High Setpoint, 4 bypass timers, Low Setpoint, 4 bypass timers, 4 relay modes, Back.

Digital types (3,5) have 12 menu items: Enable, Sensor, Fault Polarity, High Setpoint, 4 bypass timers, 4 relay modes, Back.

### Sensor-Specific Units

| Sensor Type | Available Units |
|-------------|----------------|
| Pressure | psi, bar, kPa |
| Temperature | °C, °F |
| Flow Meter | L/M, %, LpS |
| Flow Switch | (none) |
| Other 4-20 | Value |
| Other Switch | (none) |

Units are stored in `input_config.units` and displayed on the main screen alongside the sensor value.

**Units design:** All values (scale, setpoints, display) operate in the user's chosen unit — there is no internal "standard unit" or display-time conversion. When a user selects kPa, they enter scale values in kPa (read from the sensor label, which lists multiple units), setpoints in kPa, and the main screen shows kPa. The `adc_to_eng()` function performs unit-agnostic linear interpolation between `scale_4ma` and `scale_20ma`, so the unit choice is implicit in those values.

### system_config_t (128 bytes)

| Offset | Type | Field | Description |
|--------|------|-------|-------------|
| 0 | uint8 | clock_enabled | 0=Disabled (count up), 1=Enabled (countdown) |
| 1 | uint8 | menu_timeout | Menu timeout (seconds) |
| 2-3 | uint16 | runtime_hours | Runtime hours |
| 4-5 | uint16 | runtime_minutes | Runtime minutes |
| 6 | uint8 | end_runtime_mode | Relay mode for end of runtime |
| 7 | uint8 | relay_pulse_time | Relay pulse duration (1-120 seconds) |
| 8 | uint8 | config_flags | Bit flags for system options |
| 9-15 | uint8[7] | reserved_time | Future timing config |
| 16 | uint8 | contrast | LCD contrast (3-10) |
| 17 | uint8 | brightness | LCD brightness (3-10) |
| 18-19 | uint16 | power_fail_delay | Power fail delay (seconds) |
| 20 | uint8 | power_failure_flag | 1=power failure occurred |
| 21 | uint8 | active_stop_code | Latched stop code (persists across power cycles) |
| 22-31 | uint8[10] | reserved_display | Future display config |
| 32 | uint8 | dig2_enable | DIG2: 0=Disabled, 1=Enabled |
| 33 | uint8 | dig2_fault_polarity | DIG2: 0=Fault Low, 1=Fault High |
| 34 | uint8 | dig2_relay_mode | DIG2: 0=Latch, 1=Pulse |
| 35 | uint8 | dig3_enable | DIG3: 0=Disabled, 1=Enabled |
| 36 | uint8 | dig3_fault_polarity | DIG3: 0=Fault Low, 1=Fault High |
| 37 | uint8 | dig3_relay_mode | DIG3: 0=Latch, 1=Pulse |
| 38 | uint8 | dig4_enable | DIG4: 0=Disabled, 1=Enabled |
| 39 | uint8 | dig4_fault_polarity | DIG4: 0=Fault Low, 1=Fault High |
| 40 | uint8 | dig4_relay_mode | DIG4: 0=Latch, 1=Pulse |
| 41-47 | uint8[7] | reserved_digital | Future digital config |
| 48-49 | uint16 | log_entries | Number of log entries |
| 50-63 | uint8[14] | reserved_log | Future logging config |
| 64-127 | uint8[64] | padding | Expansion space |

### Factory Defaults

**Input 1 - Pressure:**
| Parameter | Default |
|-----------|---------|
| Enable | Yes |
| Sensor Type | Pressure |
| Units | psi |
| 4mA Scale | 0 |
| 20mA Scale | 360 |
| High Setpoint | 200 |
| Low Setpoint | 30 |
| Pri Low BP | 300s (5:00) |
| Sec Low BP | 30s (0:30) |
| All Relay Modes | Latch |

**Input 2 - Temperature:**
| Parameter | Default |
|-----------|---------|
| Enable | Yes |
| Sensor Type | Temperature |
| Units | °C |
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
| Sec Low BP | 30s (0:30) |
| All Relay Modes | Latch |

---

## Menu System

### Menu Structure

```
Menu 0: MAIN SCREEN
  Line 1: STOP HH:MM  or  RUN HH:MM
  Line 2: val units    (Input 1, left-justified)
  Line 3: val units    (Input 2, left-justified)
  Line 4: val units    (Input 3, left-justified)

Menu 5: MAIN MENU (long press from main screen)
  ├─ Run Time → numeric edit
  └─ Back

Menu 2: SETUP (short press from main screen)
  ├─ Input 1 → Menu 1 (unified input menu)
  ├─ Input 2 → Menu 1
  ├─ Input 3 → Menu 1
  ├─ Digital  → Menu 6
  ├─ Clock    → Menu 3
  └─ Back

Menu 1: INPUT (unified, dynamic based on sensor type)
  Analog (16 items):        Digital (12 items):
  ├─ Enable                 ├─ Enable
  ├─ Sensor                 ├─ Sensor
  ├─ Units                  ├─ Fault Pol
  ├─ Scale 4mA              ├─ High Setpoint
  ├─ Scale 20mA             ├─ Pri High BP
  ├─ High Setpoint          ├─ Sec High BP
  ├─ Pri High BP            ├─ Pri Low BP
  ├─ Sec High BP            ├─ Sec Low BP
  ├─ Low Setpoint           ├─ Rly Pri High
  ├─ Pri Low BP             ├─ Rly Sec High
  ├─ Sec Low BP             ├─ Rly Pri Low
  ├─ Rly Pri High           ├─ Rly Sec Low
  ├─ Rly Sec High           └─ Back
  ├─ Rly Pri Low
  ├─ Rly Sec Low
  └─ Back

Menu 6: DIGITAL INPUTS
  ├─ DIG2 Enable / Polarity / Relay
  ├─ DIG3 Enable / Polarity / Relay
  ├─ DIG4 Enable / Polarity / Relay
  └─ Back

Menu 3: CLOCK
  ├─ Enable (Disabled/Enabled)
  ├─ Rly Endrun (Latch/Pulse)
  └─ Back

Menu 4: UTILITY
  ├─ Set Clock / View Log / Clear Log / Log Entries
  ├─ Menu T/O / Pwr Detect / Brightness / Rly Pulse
  └─ Back
```

### Menu Behavior
- **Tag-based field system:** Each menu line has a field tag (FT_ENABLE, FT_SENSOR, etc.) stored in `input_field_tags[]`. All field detection, save, and edit logic uses tags rather than hardcoded line numbers.
- **Dynamic rebuild:** `rebuild_input_menu()` reconstructs the input menu when sensor type changes, switching between analog (16 items) and digital (12 items) layouts with sensor-specific labels.
- **Save-on-exit:** Each field writes to EEPROM immediately when confirmed (no explicit Save menu item). Uses `save_input_config(n)` or `save_system_config()`.
- **4Hz flash:** All field types (numeric, time, option) flash at ~4Hz when being edited via `blink_state` toggling in `draw_menu_line()`.
- **Encoder acceleration:** Steps by 20 when encoder pulses are <150ms apart, otherwise steps by 1.

---

## Session Checklist

### Starting a Session
1. Pull latest from remote: `git pull`
2. Note current BUILD_VERSION for each board
3. Review recent commits for context

### Ending a Session
1. Verify both boards compile
2. Increment BUILD_VERSION if changes were significant
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

Do **not** use `cmd /c build.bat` or `cmd /c "..."` — output is silently lost.

---

## Reference

- Hardware files: OneDrive (see path above)
- Datasheets: AD7994, PCA9535, DS3231, MAX22193, PIC18F26K22, PIC18F14K22
- LCD: NHD-0420AZ-FL-YBW-33V3 (4x20 HD44780)
