# IrrisysPG Display Board - Development Instructions

## Project Overview

**Product:** IRRISYS Irrigation Pump Protection System - Display Controller
**Hardware:** Display Board Ver_1 Rev_1
**MCU:** PIC18F14K22-I/SS @ 8MHz internal oscillator
**Repository:** Firmware only (GitHub)
**Companion:** IrrisysPG_MainBrd_Ver_B_Rev_1 (main controller)

---

## Changelog

| Date       | FW Ver | Description |
|------------|--------|-------------|
| 2026-01-19 | 1      | Initial project setup - LCD, LED, PWM test harness |

---

## Pin Assignments

| Pin | Function | Direction | Notes |
|-----|----------|-----------|-------|
| RA0 | PGD | - | Programming |
| RA1 | PGC | - | Programming |
| RA2 | PWR LED | Output | Active LOW |
| RA3 | Vpp | - | Programming |
| RA4 | Signal LED | Output | Active LOW |
| RA5 | Fault LED | Output | Active LOW |
| RB4 | Debug TX | Output | TTL serial for debug |
| RB5 | Serial Data In | Input | From main board via level translator |
| RB6 | Spare | - | Not used |
| RB7 | Serial Data Out | Output | To main board (if needed) |
| RC0 | LCD DB4 | Output | HD44780 4-bit mode |
| RC1 | LCD DB5 | Output | |
| RC2 | LCD DB6 | Output | |
| RC3 | LCD DB7 | Output | |
| RC4 | Brightness | Output | PWM |
| RC5 | Contrast | Output | PWM |
| RC6 | LCD E | Output | Enable strobe |
| RC7 | LCD RS | Output | Register Select |

---

## Serial Protocol Specification

### Frame Structure
```
[STX] [CMD] [LEN] [DATA...] [CRC16-LO] [CRC16-HI] [ETX]
 0x02  1 byte 1 byte 0-24 bytes  2 bytes              0x03
```

### Baud Rate
19200 baud, 8N1

### CRC
Fletcher-16 calculated over CMD + LEN + DATA bytes

### Commands

| CMD | Description | Data |
|-----|-------------|------|
| `1` (0x31) | Text line 1 | Up to 20 chars + control codes |
| `2` (0x32) | Text line 2 | Up to 20 chars + control codes |
| `3` (0x33) | Text line 3 | Up to 20 chars + control codes |
| `4` (0x34) | Text line 4 | Up to 20 chars + control codes |
| `C` (0x43) | Clear display | None |
| `B` (0x42) | LCD Brightness | 1 byte (0-100) |
| `K` (0x4B) | LCD Contrast | 1 byte (0-100) |
| `L` (0x4C) | LED state | 1 byte (bit 0=PWR, bit 1=Signal, bit 2=Fault) |

### Embedded Control Codes (in text data)

| Code | Effect |
|------|--------|
| `\x10` | Blink ON |
| `\x11` | Blink OFF |
| `\x12` | Underline ON |
| `\x13` | Underline OFF |
| `\x14` | Cursor visible |
| `\x15` | Cursor hide |
| `\x16` | Cursor back (left 1) |
| `\x17` | Cursor forward (right 1) |
| `\x18` | Cursor to column (next byte = col 1-20) |
| `\x19` | Scroll left (entire display) |
| `\x1A` | Scroll right (entire display) |
| `\x1B` | Scroll up (lines shift up, line 4 cleared) |
| `\x1C` | Scroll down (lines shift down, line 1 cleared) |

---

## Version Control

### BUILD_VERSION Increment Policy

Location: `src/main.c`
```c
#define BUILD_VERSION X
```

**MUST increment for:**
- New features or functionality
- Bug fixes that change behavior
- Protocol changes
- PWM/timing changes

**Do NOT increment for:**
- Comments or documentation only
- Formatting/whitespace

### Git Commit Policy

1. **Commit regularly** after completing each logical unit of work
2. **Push to remote** after each working session
3. **Commit message format:** `Add feature X (v2)`
4. **Always verify** build compiles before committing

---

## Hardware Files

**Location (OneDrive):**
```
C:\Users\PeeWee\OneDrive\Documents\DipTrace\PCT_HEADER\ALL_Files\Control_Point_Pump_Guard\IRRISYS_PG_Ver_B\Irrisys_PG_Ver_B_Rev_1\
├── IrrisysPG_Ver_B_Display_Rev_1.dch    # Schematic
├── IrrisysPG_Ver_B_Display_Rev_1.dip    # PCB layout
├── IrrisysPG_Ver_B_Display_Rev_1.xlsx   # BOM
└── IrrisysPG_Ver_B_Display_Rev_1_PP.csv # Pick & Place
```

---

## Project Structure

```
IrrisysPG_Display_Ver_1_Rev_1/
├── src/
│   ├── main.c          # Entry point, BUILD_VERSION
│   ├── lcd.c           # HD44780 4-line driver
│   ├── pwm.c           # Brightness/contrast PWM
│   ├── uart.c          # UART + circular buffer (Phase 2)
│   └── protocol.c      # Frame parsing, CRC (Phase 2)
├── include/
│   ├── config.h        # Pin definitions, oscillator config
│   ├── lcd.h
│   ├── pwm.h
│   ├── uart.h
│   └── protocol.h
├── CLAUDE.md           # This file
└── README.md
```

---

## Development Phases

### Phase 1 - Hardware Test (Current)
- [ ] LCD init and text display
- [ ] LED control (all 3)
- [ ] PWM brightness/contrast
- [ ] Debug UART output

### Phase 2 - Protocol Integration
- [ ] UART receive with circular buffer
- [ ] Frame parsing
- [ ] Fletcher-16 CRC validation
- [ ] Command dispatch

---

## LCD Reference

**Display:** NHD-0420AZ-FL-YBW-33V3
- 4 lines x 20 characters
- HD44780 compatible
- 3.3V operation

**Line DDRAM Addresses:**
| Line | Address |
|------|---------|
| 1 | 0x00 - 0x13 |
| 2 | 0x40 - 0x53 |
| 3 | 0x14 - 0x27 |
| 4 | 0x54 - 0x67 |

---

## Session Checklist

### Starting a Session
1. Pull latest: `git pull`
2. Note current BUILD_VERSION
3. Review recent commits

### Ending a Session
1. Verify code compiles
2. Increment BUILD_VERSION if significant changes
3. Update changelog in this file
4. Commit with descriptive message
5. Push to remote: `git push`
