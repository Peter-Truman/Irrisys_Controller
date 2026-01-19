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
| Relay | - | GPIO | Pulse/latch modes |
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

## Reference

- Hardware files: OneDrive (see path above)
- Datasheets: AD7994, PCA9535, DS3231, MAX22193, PIC18F26K22, PIC18F14K22
- LCD: NHD-0420AZ-FL-YBW-33V3 (4x20 HD44780)
