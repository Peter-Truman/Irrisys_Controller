# Irrisys Controller - Development Instructions

## Project Overview

**Product:** IRRISYS Irrigation Pump Protection System
**Hardware Version:** Ver_B
**Repository:** Firmware only (GitHub)

---

## Changelog

| Date       | FW Ver | Description |
|------------|--------|-------------|
| 2026-01-19 | 3      | Baseline - Knight Rider LED sequence, full menu system, AD7994 ADC, RTC, EEPROM config |

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

Location: `src/main.c` line 7
```c
#define BUILD_VERSION X
```

**MUST increment for:**
- New features or functionality
- Bug fixes that change behavior
- Peripheral driver changes
- Menu structure changes
- EEPROM format changes

**Do NOT increment for:**
- Code comments or documentation
- Formatting/whitespace only
- Debug code added temporarily

### Git Commit Policy

1. **Commit regularly** after completing each logical unit of work
2. **Push to remote** after each working session (never leave unpushed commits overnight)
3. **Commit message format:**
   - Short: `Add menu timeout feature (v4)`
   - Detailed: Use body for explanation if needed
4. **Always verify** build compiles before committing

### Branch Strategy
- `main` or `irrisys-working` - stable, tested code
- Feature branches for experimental work if needed

---

## Hardware File Management

### Location
```
OneDrive: C:\Users\PeeWee\OneDrive\Documents\DipTrace\PCT_HEADER\ALL_Files\Control_Point_Pump_Guard\IRRISYS_PG_Ver_B\
```

### Folder Structure
```
IRRISYS_PG_Ver_B/
├── Irrisys_PG_Ver_B_Rev_0.*      # Mainboard Rev 0
├── Irrisys_PG_Ver_B_Rev_1/       # Mainboard Rev 1 (current)
│   ├── IrrisysPG_MainBrd_Ver_B_Rev_1.dch    # Schematic
│   ├── IrrisysPG_MainBrd_Ver_B.Rev_1.dip    # PCB layout
│   ├── IrrisysPG_MainBrd_Ver_B_Rev_1.xlsx   # BOM
│   ├── IrrisysPG_MainBrd_Ver_B_Rev_1_PP.csv # Pick & Place
│   ├── *_gerberx3.zip                        # Manufacturing files
│   ├── IrrisysPG_Ver_B_Display_Rev_1.*      # Display board Rev 1
│   └── IrrisysPG_Ver_B_Display_Rev_2.dip    # Display board Rev 2 (WIP)
├── Archive/                       # Older versions, experiments
└── Menu_Layout.txt               # Documentation
```

### Hardware Revision Policy
- **Version (Ver_X):** Major hardware redesign (new board shape, major component changes)
- **Revision (Rev_Y):** Minor changes (routing fixes, component swaps, silkscreen updates)
- Each revision folder contains ALL related files (schematic, PCB, BOM, gerbers, P&P)

---

## Project Structure (Firmware)

```
Irrisys_Controller/
├── src/                    # C source files
│   ├── main.c             # Entry point, main loop, BUILD_VERSION
│   ├── menu.c             # Menu system logic
│   ├── eeprom.c           # Configuration storage
│   ├── encoder.c          # Rotary encoder driver
│   ├── i2c.c              # I2C bus driver
│   ├── rtc.c              # DS3231 RTC driver
│   ├── ad7994.c           # AD7994 ADC driver
│   ├── pca9535.c          # PCA9535 I/O expander driver
│   └── lcd.c              # LCD display driver
├── include/               # Header files
│   ├── config.h           # Pin definitions, system config
│   ├── menu.h             # Menu structures
│   └── [peripheral].h     # Driver headers
├── CLAUDE.md              # This file
└── README.md              # Project overview
```

---

## Hardware Specifications

| Component | Part | Interface | Notes |
|-----------|------|-----------|-------|
| MCU | PIC18F26K22 | - | 32MHz (8MHz + 4x PLL) |
| LCD | 16x2 character | 4-bit parallel | |
| Encoder | Rotary + switch | GPIO + interrupt | Short/long press detection |
| RTC | DS3231 | I2C (0x68) | 1Hz square wave output |
| ADC | AD7994 | I2C (0x22) | 3 channels used |
| I/O Expander | PCA9535 | I2C (0x20) | LED control |
| Digital Input | MAX22193 | GPIO | 4 channels |
| Relay | - | GPIO | Pulse/latch modes |
| Buzzer | - | GPIO | User feedback |

---

## Menu Structure Reference

```
MAIN SCREEN (255)
└── OPTIONS (0)
    ├── Main Menu → SETUP (2)
    │   ├── Input 1 → INPUT (1)
    │   ├── Input 2 → INPUT (1)
    │   ├── Input 3 → INPUT (1)
    │   └── Clock → CLOCK (3)
    ├── Setup Menu → INPUT (1)
    ├── Utility Menu → UTILITY (4)
    ├── About
    └── Exit → MAIN SCREEN

INPUT menu adapts based on sensor type:
- Pressure: 15 items (scale, thresholds, bypass times, relay modes)
- Temperature: 10 items
- Flow Digital: 9 items
- Flow Analog: 12 items
```

---

## Session Checklist

### Starting a Session
1. Pull latest from remote: `git pull`
2. Note current BUILD_VERSION
3. Review recent commits for context

### Ending a Session
1. Verify code compiles
2. Increment BUILD_VERSION if changes were significant
3. Update changelog in this file
4. Commit all changes with descriptive message
5. Push to remote: `git push`
6. Verify push succeeded

---

## Contact / Reference

- Hardware files: OneDrive (see path above)
- Datasheets: AD7994, PCA9535, DS3231, MAX22193, PIC18F26K22
