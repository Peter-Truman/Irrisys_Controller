# IRRISYS Irrigation Pump Protection System
## Project Documentation - v3 (December 2024)
## CRITICAL: Working State Checkpoint

### ⚠️ IMPORTANT INSTRUCTIONS FOR NEXT SESSION ⚠️

**WORKING METHODOLOGY - MANDATORY:**
1. **ONE CHANGE AT A TIME** - Never make multiple changes simultaneously
2. **WAIT FOR CONFIRMATION** - Always wait for user to confirm each step works before proceeding
3. **TEST AFTER EACH CHANGE** - User will test and report back
4. **NEVER BREAK WORKING CODE** - If something works, don't modify it without explicit request
5. **COMMIT FREQUENTLY** - After each working feature is confirmed

**User Preference:** Patient, methodical approach. User is learning C while developing. Prefers clear explanations of what each change does and why.

---

## CURRENT SYSTEM STATE (WORKING)

### ✅ FULLY WORKING FEATURES
1. **Menu System Navigation**
   - OPTIONS menu (5 items)
   - SETUP menu (5 items) 
   - INPUT menus (14 items for pressure, 9 for temperature)
   - All "Back" buttons functional
   - Menu scrolling works correctly

2. **Signed Variable Editing (-500 to +500)**
   - Sign position toggles with encoder
   - Digit-by-digit editing (only current digit blinks)
   - Rollover/rollunder on all digits
   - Bounds checking (±500 max)
   - Short press advances to next digit
   - Save on completion
   - Values properly formatted as +000

3. **LCD Display**
   - 20x4 character Newhaven display
   - Reliable initialization using Positron sequence
   - Column 20 reserved for closing bracket
   - Values right-justified to column 19
   - List mode uses [] brackets
   - Edit mode uses () parentheses

4. **EEPROM Integration**
   - Configuration loads on startup
   - Saves after editing
   - Input configurations for 3 channels
   - System configuration structure defined

5. **Menu Timeout (Partially Working)**
   - ISR countdown timer working perfectly
   - 30-second fixed timeout functional
   - Returns to main screen with double beep
   - Resets on any encoder/button activity
   - Issue: Cannot access EEPROM timeout value from main.c (crashes)

6. **Button Press Detection**
   - Short press (50-899ms) - works
   - Long press (900-1799ms) - detected but not used
   - Very long press (≥1800ms) - detected but not used

---

## CRITICAL CODE SECTIONS - DO NOT MODIFY

### LCD Initialization (menu.c) - WORKING PERFECTLY
```c
void lcd_init(void)
{
    // Set TRIS exactly as Positron does
    TRISA = 0x10;  // %00010000
    TRISB = 0x46;  // %01000110  
    TRISC = 0x00;  // %00000000
    
    PORTA = 0;
    PORTB = 0;
    PORTC = 0;
    
    __delay_ms(50);
    LCD_RS = 0;
    
    lcd_write_nibble(0x03);
    __delay_ms(5);
    lcd_write_nibble(0x03);
    __delay_us(150);
    lcd_write_nibble(0x03);
    __delay_us(150);
    
    lcd_write_nibble(0x02);
    __delay_us(150);
    
    lcd_cmd(0x28);
    lcd_cmd(0x08);  // Display OFF first
    lcd_cmd(0x01);  // Clear
    __delay_ms(2);
    lcd_cmd(0x06);  // Entry mode
    lcd_cmd(0x0C);  // Display ON
}
```

### Menu Timeout in ISR (encoder.c) - WORKING
```c
// Counts every 2ms via ms_counter
// Decrements menu_timeout_timer
// Sets menu_timeout_flag = 0 when expired
// Resets on encoder movement or button press
```

---

## KNOWN ISSUES

### 1. EEPROM Timeout Value Access
**Problem:** Accessing `menu_timeout_seconds` from main.c causes system crash
**Current Workaround:** Using fixed 30-second timeout (menu_timeout_reload = 15000)
**Location:** main.c after eeprom_init()
```c
// This crashes:
// menu_timeout_reload = menu_timeout_seconds * 500;

// Using this instead:
menu_timeout_reload = 15000;  // Fixed 30 seconds
```

### 2. Long Press Not Implemented
**Status:** Detection works, handler incomplete
**Plan:** Add context-sensitive back navigation

---

## NEXT DEVELOPMENT TASKS

### Priority 1: Fix EEPROM Timeout Access
**Approach:**
1. Debug why extern linkage fails
2. Consider passing value through function instead
3. Or use global accessor function

### Priority 2: Implement Long Press Back Navigation
**Requirements:**
- In edit mode: Cancel and return to list
- In list mode: Go back one menu level  
- On main screen: No action
- Always provide double beep feedback

**Implementation Plan:**
1. First add debug to confirm long press detected
2. Add simple beep response
3. Test thoroughly
4. Then add menu navigation logic
5. Test each menu level
6. Commit when working

### Priority 3: Time Value Editing (mm:ss)
**Not started** - Similar to numeric but with colon separator

### Priority 4: Other Numeric Fields
- High/Low setpoints
- Bypass times
- Relay settings

---

## FILE STRUCTURE
```
Irrisys_Controller/
├── include/
│   ├── config.h      - Pin definitions, constants
│   ├── menu.h        - Menu structures, state machine
│   ├── encoder.h     - Encoder definitions
│   ├── lcd.h         - LCD definitions
│   └── eeprom.h      - EEPROM structures, addresses
├── src/
│   ├── main.c        - Main loop, LCD functions, initialization
│   ├── menu.c        - Menu drawing, navigation, editing
│   ├── encoder.c     - ISR, encoder reading, button detection
│   └── eeprom.c      - Configuration load/save
└── tools/
    └── build.bat     - Compilation script
```

---

## COMPILER SETTINGS
- **Compiler:** XC8 v2.46
- **Device:** PIC18F2525
- **Clock:** 32MHz (8MHz internal + 4x PLL)
- **Optimization:** Default

---

## CRITICAL REMINDERS

### Memory Management
- PIC18F2525: 48KB program, 3968 bytes RAM
- Close to RAM limit - adding features may cause LCD failure
- Always test LCD after adding code

### Variable Access Patterns
```c
// In source file (e.g., eeprom.c):
uint16_t menu_timeout_seconds = 30;  // Actual variable

// In other files (e.g., main.c):
extern uint16_t menu_timeout_seconds;  // Reference to variable
```

### ISR Constraints
- Cannot call functions like beep() or uart_println() from ISR
- Use volatile flags to communicate with main loop
- Keep ISR code minimal and fast

---

## GITHUB REPOSITORY
- **URL:** https://github.com/Peter-Truman/Irrisys_Controller
- **Branch:** working-version
- **Last Stable Commit:** "Menu timeout working with fixed 30 sec value"

---

## FOR NEXT CHAT SESSION

### Opening Prompt Template:
```
I'm continuing work on the IRRISYS irrigation controller project. 
Current state: Menu system working, signed variable editing complete, 
menu timeout working with fixed 30-second value. LCD initialization is 
stable using Positron sequence.

Next task: [Implement long press back navigation / Fix EEPROM timeout access]

IMPORTANT: I work ONE STEP at a time. Give me single, small changes and 
wait for me to confirm each works before proceeding. The LCD has been 
intermittent so we must be very careful not to break working code.

The system is currently at commit "Menu timeout working with fixed 30 sec value"
on the working-version branch.
```

### Session Rules:
1. Start by verifying current code compiles and LCD works
2. Make ONE small change
3. Wait for test confirmation
4. Only proceed if working
5. Commit after each working feature
6. If LCD fails, immediately revert

---

## LESSONS LEARNED
1. Never add multiple features at once
2. Test LCD after every change
3. Commit working code immediately
4. Use fixed test values before connecting to EEPROM
5. Keep initialization order: system_init() → lcd_init() → others
6. Don't modify working positioning/display code
7. Be careful with extern variable linkage between files

---

## END OF DOCUMENTATION v3
Build carefully on this stable foundation. Patient, methodical progress prevents cascading failures.
