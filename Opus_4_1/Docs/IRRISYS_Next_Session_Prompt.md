# IRRISYS Project - Session Start Document
## Updated: December 2024 - After Long Press Implementation

### ⚠️ CRITICAL INSTRUCTIONS FOR AI ⚠️

**MANDATORY WORKING METHOD:**
1. **ONE CHANGE AT A TIME** - Never make multiple changes simultaneously
2. **WAIT FOR CONFIRMATION** - Always wait for user to test and confirm before proceeding  
3. **PRESERVE WORKING CODE** - Never modify working features without explicit request
4. **TEST INCREMENTALLY** - User will test after each small change
5. **COMMIT FREQUENTLY** - After each confirmed working feature

**User Profile:** Learning C through this project. Prefers patient, step-by-step explanations. Has intermittent LCD issues requiring extreme caution with changes.

---

## CURRENT WORKING STATE ✅

### Completed Features (DO NOT MODIFY)

#### 1. Menu System
- **Navigation**: All menus fully operational
- **OPTIONS Menu**: 5 items (Main, Setup, Utility, About, Exit)
- **SETUP Menu**: 5 items (Input1-3, Clock, Back)
- **INPUT Menu**: 14 items for pressure, 9 for temperature
- **All Back/Exit options**: Fully functional

#### 2. Signed Variable Editing (-500 to +500)
- Sign position editing with encoder
- Digit-by-digit editing (blinking current digit only)
- Bounds checking enforced
- Short press advances digit
- Completion saves to config
- Format: +000 to +500

#### 3. Menu Timeout System
- **Working**: 30-second fixed timeout
- ISR-based countdown (2ms increments)
- Resets on any activity
- Double beep and return to main screen
- **Issue**: Cannot read EEPROM value (crashes) - using fixed 30s

#### 4. Long Press Navigation (COMPLETE)
- **Threshold**: 1800ms with immediate beep feedback
- **In Edit Mode**: Cancel without saving, return to list
- **In OPTIONS**: Exit to main screen
- **In SETUP**: Back to OPTIONS  
- **In INPUT**: Back to SETUP
- **From Main**: No action

#### 5. LCD System
- 20x4 Newhaven display
- Initialization using Positron sequence (reliable)
- Values right-justified to column 19
- Column 20 reserved for brackets

#### 6. EEPROM System
- Configuration loads at startup
- Saves after edits
- 3 input configurations
- System configuration defined

---

## KNOWN ISSUES

### 1. EEPROM Timeout Value
**Problem**: Accessing `menu_timeout_seconds` from main.c causes crash
**Current Workaround**: Fixed 30-second timeout
```c
menu_timeout_reload = 15000;  // Fixed 30s * 500 = 15000
```
**Attempted Solutions**: 
- extern declaration (crashes)
- getter function (compilation errors)

### 2. Unimplemented Features
- Time value editing (mm:ss format)
- Other numeric fields (setpoints, bypass times)
- Temperature/Flow sensor menus
- Clock configuration
- Output configuration

---

## CODE STRUCTURE

### Critical Functions (Working - Do Not Break)

#### LCD Initialization (main.c)
```c
void lcd_init(void)
{
    TRISA = 0x10;
    TRISB = 0x46;  
    TRISC = 0x00;
    // ... Positron sequence
}
```

#### ISR Timeout (encoder.c)
- Counts every 2ms via `ms_counter`
- Decrements `menu_timeout_timer`
- Sets `menu_timeout_flag = 0` on expiry
- Resets on any activity

#### Long Press Detection (encoder.c)
- Immediate beep flag at 1800ms
- Button event 2 on release
- Main loop handles navigation

---

## FILE LOCATIONS
```
/Opus_4_1/
├── include/
│   ├── config.h     - Pin definitions
│   ├── menu.h       - Menu structures  
│   ├── encoder.h    - Encoder definitions
│   └── eeprom.h     - EEPROM structures
├── src/
│   ├── main.c       - Main loop, LCD, startup
│   ├── menu.c       - Menu drawing/handling
│   ├── encoder.c    - ISR, button detection
│   └── eeprom.c     - Config load/save
└── tools/
    └── build.bat    - Compiler script
```

---

## NEXT TASKS PRIORITY

### 1. Fix EEPROM Timeout Access
Options to try:
- Global variable with initialization function
- Store value in menu.c instead of eeprom.c
- Pass through existing config structure

### 2. Time Value Editing
Format: MM:SS
- Similar to numeric but with colon
- Max values depend on field

### 3. Other Numeric Fields  
- High/Low pressure setpoints
- Temperature setpoints
- Bypass times

### 4. Complete Sensor Menus
- Temperature sensor options
- Flow sensor (digital input)

---

## SESSION START CHECKLIST

1. **Verify Current State**
```powershell
git status  # Should be clean
cmd /c tools\build.bat  # Should compile
```

2. **Test Working Features**
- Enter/exit menus
- Edit signed variable
- Long press navigation
- Menu timeout (30s)

3. **Current Branch**: working-version
4. **Last Commit**: "Long press navigation complete - all menus working"

---

## EXAMPLE OPENING MESSAGE

"Continuing IRRISYS project. Current state: Menu system complete, signed variable editing working, menu timeout (fixed 30s) and long press navigation fully functional.

Next task: [Fix EEPROM timeout access / Add time value editing / Other]

IMPORTANT: I need single, small changes with testing between each. The LCD has been intermittent so we must preserve all working code. Currently at commit 'Long press navigation complete' on working-version branch."

---

## CRITICAL REMINDERS

1. **Memory Limits**: PIC18F2525 near RAM limit - test LCD after any additions
2. **ISR Constraints**: Cannot call functions from ISR, use flags only
3. **Variable Scope**: main.c cannot easily access variables from other .c files
4. **Initialization Order**: system_init() → lcd_init() → others
5. **Testing Protocol**: Compile → Test LCD → Test feature → Commit if working

---

## SUCCESS CRITERIA

- Never break working features
- One change at a time
- Clear explanations of what and why
- Test after every change
- Commit working code immediately

The project is stable and functional. Build on this foundation carefully.
