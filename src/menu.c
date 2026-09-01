/**
 * IRRISYS - Unified Menu System
 * Single input template for all sensor types, save-on-field-exit
 * Version: 2.0.0 - Unified Input Restructure
 */

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
#include "../include/eeprom.h"
#include "../include/rtc.h"
#include "../include/lcd.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Menu state
menu_state_t menu;
static char original_value[10];

// Log viewer state
static uint16_t log_view_top = 0;  // Top visible entry (display index, 0=newest)

// Option field edit flags
uint8_t enable_edit_flag = 1;
uint8_t sensor_edit_flag = 0;
uint8_t flow_type_edit_flag = 0;
uint8_t no_flow_edit_flag = 0;
uint8_t flow_units_edit_flag = 0;
uint8_t relay_high_edit_flag = 0;
uint8_t relay_low_edit_flag = 0;
uint8_t relay_sec_high_edit_flag = 0;
uint8_t relay_sec_low_edit_flag = 0;
uint8_t fault_polarity_edit_flag = 0;

// Legacy digital input edit flags (kept for compatibility)
uint8_t dig_enable_edit_flag = 0;
uint8_t dig_polarity_edit_flag = 0;
uint8_t dig_relay_edit_flag = 0;

// Clock menu edit flags
uint8_t clock_enable_edit_flag = 0;
uint8_t end_runtime_edit_flag = 0;

uint8_t current_menu = 0;
uint8_t current_input = 0;
uint8_t current_digital_input = 0; // legacy

// Deferred EEPROM save flags (set here, saved in main.c after 1-second tick)
uint8_t input_config_dirty[3] = {0, 0, 0};
uint8_t system_config_dirty = 0;

// Field tag system — each line in input_menu has a tag identifying what it represents
#define FT_ENABLE       0
#define FT_SENSOR       1
#define FT_UNITS        2
#define FT_SCALE_4MA    3
#define FT_SCALE_20MA   4
#define FT_HI_LIMIT     5
#define FT_PRI_HI_BP    6
#define FT_SEC_HI_BP    7
#define FT_LO_LIMIT     8
#define FT_PRI_LO_BP    9
#define FT_SEC_LO_BP    10
#define FT_RLY_PRI_HI   11
#define FT_RLY_SEC_HI   12
#define FT_RLY_PRI_LO   13
#define FT_RLY_SEC_LO   14
#define FT_FAULT_POL     15
#define FT_PRI_BP        16  // Digital: primary fault bypass
#define FT_SEC_BP        17  // Digital: secondary fault bypass
#define FT_RLY_PRI_FAULT 18  // Digital: primary fault relay
#define FT_RLY_SEC_FAULT 19  // Digital: secondary fault relay
#define FT_NAME          20  // Custom name field (Other 4-20, Other Switch)
#define FT_CUSTOM_UNITS  21  // Custom units field (Other 4-20 only)
#define FT_BACK          98
#define FT_EXIT          99

// Character set for name editor: ASCII 32 (space) to 126 (~), then Back, then Done
#define CHARSET_START   32
#define CHARSET_END     126
#define CHARSET_SIZE    (CHARSET_END - CHARSET_START + 1)  // 95 printable chars
#define BACK_INDEX      CHARSET_SIZE       // 95 = "Back" option
#define DONE_INDEX      (CHARSET_SIZE + 1) // 96 = "Done" option
#define TOTAL_CHAR_OPTIONS (CHARSET_SIZE + 2)  // 97 total options

static uint8_t input_field_tags[20]; // Tag for each line in input_menu

// Option type definitions
typedef struct
{
    uint8_t option_id;
    uint8_t option_count;
    const char *options[7];
} item_options_t;

#define OPT_ENABLE 0
#define OPT_SENSOR 1
#define OPT_FLOW_TYPE 2
#define OPT_NO_FLOW 3
#define OPT_FLOW_UNITS 4
#define OPT_RELAY_MODE 5
#define OPT_DIG_POLARITY 6
#define OPT_CLOCK_ENABLE 7
#define OPT_END_RUNTIME 8
#define OPT_FAULT_POL 9
#define OPT_UNITS_PRESS 10
#define OPT_UNITS_TEMP  11
#define OPT_UNITS_FLOW  12
#define OPT_UNITS_OTHER 13
#define OPT_WDT_TRIG    14   // Watch Dog trigger edge

const item_options_t menu_item_options[] = {
    {OPT_ENABLE, 2, {"Disabled", "Enabled", "", "", "", ""}},
    // "Oth Sw" (type 5) is retired from the selector. The type is still
    // handled everywhere so an existing config carrying it keeps working;
    // it simply cannot be chosen any more. sensor_type_for_option[] maps
    // menu position to stored type.
    {OPT_SENSOR, 6, {"Pressure", "Temp", "Flow Meter", "Flow Sw", "Oth 4-20",
                     "WDT", ""}},
    {OPT_FLOW_TYPE, 2, {"Analog", "Digital", "", "", "", ""}},
    {OPT_NO_FLOW, 2, {"Low", "High", "", "", "", ""}},
    {OPT_FLOW_UNITS, 2, {"%", "LpS", "", "", "", ""}},
    {OPT_RELAY_MODE, 2, {"Latch", "Pulse", "", "", "", ""}},
    {OPT_DIG_POLARITY, 2, {"Fault Lo", "Fault Hi", "", "", "", ""}},
    {OPT_CLOCK_ENABLE, 2, {"Disabled", "Enabled", "", "", "", ""}},
    {OPT_END_RUNTIME, 2, {"Latch", "Pulse", "", "", "", ""}},
    {OPT_FAULT_POL, 2, {"Low", "High", "", "", "", ""}},
    {OPT_UNITS_PRESS, 3, {"psi", "bar", "kPa", "", "", ""}},
    {OPT_UNITS_TEMP, 2, {"\xDF""C", "\xDF""F", "", "", "", ""}},
    {OPT_UNITS_FLOW, 3, {"%", "LpM", "LpS", "", "", ""}},
    {OPT_UNITS_OTHER, 1, {"Value", "", "", "", "", ""}},
    {OPT_WDT_TRIG, 3, {"Hi to Lo", "Lo to Hi", "Edge", "", "", ""}},
};

#define NUM_OPTION_TYPES 15

// Options menu - built dynamically based on clock_enabled
static const char *options_menu[5];
static uint8_t options_menu_count = 0;
// Action IDs for options menu items
#define OPT_ACT_CLOCK    0
#define OPT_ACT_SETUP    1
#define OPT_ACT_UTILITY  2
#define OPT_ACT_ABOUT    3
#define OPT_ACT_EXIT     4
static uint8_t options_action[5]; // Maps menu line → action ID

static void rebuild_options_menu(void)
{
    uint8_t n = 0;
    if (system_config.clock_enabled)
    {
        options_menu[n] = "Clock";
        options_action[n] = OPT_ACT_CLOCK;
        n++;
    }
    options_menu[n] = "Setup Menu";
    options_action[n] = OPT_ACT_SETUP;
    n++;
    options_menu[n] = "Utility Menu";
    options_action[n] = OPT_ACT_UTILITY;
    n++;
    options_menu[n] = "EXIT";
    options_action[n] = OPT_ACT_EXIT;
    n++;
    options_menu_count = n;
}

// Value buffers
static char value_enable[10] = "Enabled";
static char value_sensor[12] = "Pressure";
static char value_scale4[10] = "000";
static char value_scale20[10] = "100";
static char value_high_sp[10] = "200";
static char value_pri_high_bp[10] = "00:00";
static char value_sec_high_bp[10] = "00:00";
static char value_low_sp[10] = "030";
static char value_pri_low_bp[10] = "00:00";
static char value_sec_low_bp[10] = "00:00";
static char value_rly_pri_hi[10] = "Latch";
static char value_rly_sec_hi[10] = "Latch";
static char value_rly_pri_lo[10] = "Latch";
static char value_rly_sec_lo[10] = "Latch";
static char value_units[10] = "psi";
static char value_fault_pol[10] = "Fault Lo";
static char value_back[5] = "Back";
static char value_custom_name[12] = "";      // For "Other" sensor types
static char value_custom_units[5] = "";      // For "Other 4-20" type

// Saved state for name editor cancel/restore.
// A sensor-type change now resets every sensor-dependent field, so cancelling
// has to restore the whole config - saving name/units/type alone would leave
// the input carrying the new type's scales, setpoints and bypass timers.
static input_config_t saved_input_cfg;       // Full config before sensor change
static uint8_t name_editor_auto_opened = 0;  // Flag: 1 if auto-opened after sensor change

// Undo an auto-opened sensor change by restoring the pre-change config.
static void restore_saved_input_cfg(void)
{
    memcpy(&input_config[current_input], &saved_input_cfg, sizeof(input_config_t));
    input_config_dirty[current_input] = 1;  // Defer EEPROM write
    name_editor_auto_opened = 0;
}

// Dynamic bypass labels for custom names (types 4 and 5)
static char custom_bp_phi[8] = "";   // Primary high bypass label
static char custom_bp_shi[8] = "";   // Secondary high bypass label
static char custom_bp_plo[8] = "";   // Primary low bypass label
static char custom_bp_slo[8] = "";   // Secondary low bypass label
static char custom_rly_phi[12] = ""; // Relay primary high label
static char custom_rly_shi[12] = ""; // Relay secondary high label
static char custom_rly_plo[12] = ""; // Relay primary low label
static char custom_rly_slo[12] = ""; // Relay secondary low label

// Clock menu value buffers
static char value_clock_enable[10] = "Enabled";
static char value_end_runtime[10] = "Pulse";

// Main menu value buffer
static char value_runtime[6] = "00:00";

// Utility menu value buffers
static char value_menu_timeout[6] = "00:30";
static char value_brightness[4] = "50";
static char value_pwr_fail[6] = "00:05";
static char value_relay_pulse[10] = "00:02";

// Digital input menu value buffers
static char value_dig_enable[10] = "Disabled";
static char value_dig_polarity[10] = "Fault Lo";
static char value_dig_relay[10] = "Latch";

//=============================================================================
// DYNAMIC INPUT MENU (built by rebuild_input_menu based on sensor type)
//=============================================================================

// Helper: is sensor type analog?
static uint8_t is_analog_type(uint8_t st)
{
    return (st == 0 || st == 1 || st == 2 || st == 4); // Pressure, Temp, FlowMeter, Oth4-20
}

menu_item_t input_menu[20]; // Max items (analog=16, digital=8)

// Clock menu template (4 items - no Save, no Display)
const menu_item_t clock_menu_template[] = {
    {"Enable", NULL, 1},       // 0  - Option: Disabled/Enabled
    {"Rly Endrun", NULL, 1},   // 1  - Option: Latch/Pulse
    {"Back", NULL, 0},         // 2
    {"EXIT", NULL, 0}          // 3
};

menu_item_t clock_menu[4];

// Main menu template (3 items - no Save)
const menu_item_t main_menu_template[] = {
    {"Run Time", NULL, 1},     // 0  - Time edit HH:MM
    {"Back", NULL, 0},         // 1
    {"EXIT", NULL, 0}          // 2
};

menu_item_t main_menu_items[3];

// Utility menu template (10 items - no Save)
const menu_item_t utility_menu_template[] = {
    {"Menu T/O", NULL, 1},     // 0 - Whole seconds
    {"Pwr Detect", NULL, 1},   // 1 - Whole seconds
    {"Brightness", NULL, 1},   // 2 - Numeric
    {"Rly Dwell", NULL, 1},    // 3 - Time MM:SS
    {"About", NULL, 0},        // 4 - Action: re-show the splash
    {"Back", NULL, 0},         // 5
    {"EXIT", NULL, 0}          // 6
};

#define UTILITY_ITEMS 7
menu_item_t utility_menu[UTILITY_ITEMS];

// Digital input menu template (5 items)
const menu_item_t digital_menu_template[] = {
    {"Enable", NULL, 1},         // 0
    {"Polarity", NULL, 1},       // 1
    {"Relay", NULL, 1},          // 2
    {"Back", NULL, 0},           // 3
    {"EXIT", NULL, 0}            // 4
};

menu_item_t digital_menu[5];

// Function declarations
extern void lcd_set_cursor(uint8_t row, uint8_t col);
extern void lcd_print(const char *str);
extern void beep(uint16_t duration_ms);
extern void beep_double(uint16_t on_ms, uint16_t gap_ms);

// Sounded once when a rotation is refused because the value is already at
// the end of its range. Long enough not to be mistaken for the 50ms button
// click, and a single tone so it cannot be confused with the double-beep
// that means "fault cleared" or "menu timed out".
#define LIMIT_BEEP_MS 300

// Latched so a continued spin at the rail gives ONE beep, not a beep per
// detent. Cleared as soon as the value moves, and on entry to any editor.
static uint8_t limit_beeped = 0;
extern void uart_println(const char *str);
extern void lcd_clear(void);
// extern int16_t convert_for_display(int16_t val, const char *units);  // SUSPENDED
// extern int16_t convert_to_standard(int16_t val, const char *units);  // SUSPENDED
void handle_time_rotation(int8_t direction);
void menu_draw_utility(void);
void menu_draw_main_menu(void);
void menu_draw_digital(void);
void rebuild_main_menu(void);
static void draw_name_editor(void);


//=============================================================================
// CONTEXT-AWARE FIELD DETECTION (unified - no sensor_type branching)
//=============================================================================

uint8_t is_numeric_field(uint8_t line, uint8_t sensor_type, uint8_t flow_type)
{
    (void)sensor_type;
    (void)flow_type;

    if (current_menu == 1) // INPUT menu — use field tags
    {
        uint8_t tag = input_field_tags[line];
        // Bypass timers moved to the two-field MM:SS editor - see
        // is_time_field(). Scales and setpoints stay whole-number.
        return (tag == FT_SCALE_4MA || tag == FT_SCALE_20MA ||
                tag == FT_HI_LIMIT || tag == FT_LO_LIMIT);
    }
    else if (current_menu == 4) // UTILITY menu
    {
        // All four editable UTILITY fields are whole numbers (see the
        // button handler). Menu T/O, Pwr Detect and Rly Dwell are seconds
        // shown as MM:SS; Brightness is a plain 1-10.
        return (line <= 3);
    }
    return 0;
}

uint8_t is_time_field(uint8_t line, uint8_t sensor_type, uint8_t flow_type)
{
    (void)sensor_type;
    (void)flow_type;

    if (current_menu == 1) // INPUT menu — bypass timers edit as MM:SS
    {
        // Bypass timers edit as MM:SS in two fields, the same editor the
        // clock and Rly Dwell use. As a single whole number they ran 0..5999
        // seconds: taking a WDT startup window from its 30:00 default down to
        // 2:00 meant ~84 detents even at the accelerated step. Minutes and
        // seconds separately makes it a handful.
        uint8_t tag = input_field_tags[line];
        return (tag == FT_PRI_HI_BP || tag == FT_SEC_HI_BP ||
                tag == FT_PRI_LO_BP || tag == FT_SEC_LO_BP);
    }
    else if (current_menu == 4) // UTILITY menu
    {
        // Rly Dwell is 1-120 s, so its minutes pair only ever reads 00, 01
        // or 02. A button press between pairs bought nothing and left the
        // row looking like a mix of the old 3-digit format and MM:SS.
        // It edits as one whole value now, displayed MM:SS.
        return 0;
    }
    else if (current_menu == 5) // MAIN menu
    {
        return (line == 0); // Run Time
    }
    return 0;
}

uint8_t is_option_field(uint8_t line, uint8_t sensor_type, uint8_t flow_type)
{
    (void)sensor_type;
    (void)flow_type;

    if (current_menu == 1) // INPUT menu — use field tags
    {
        uint8_t tag = input_field_tags[line];
        return (tag == FT_ENABLE || tag == FT_SENSOR || tag == FT_UNITS ||
                tag == FT_RLY_PRI_HI || tag == FT_RLY_SEC_HI ||
                tag == FT_RLY_PRI_LO || tag == FT_RLY_SEC_LO ||
                tag == FT_FAULT_POL);
    }
    else if (current_menu == 3) // CLOCK menu
    {
        return (line == 0 || line == 1); // Enable, Rly Endrun
    }
    else if (current_menu == 6) // DIGITAL menu
    {
        return (line <= 2); // Enable, Polarity, Relay
    }
    return 0;
}

//=============================================================================
// GET OPTION EDIT FLAG POINTER
//=============================================================================

uint8_t *get_option_edit_flag(uint8_t line, uint8_t sensor_type, uint8_t flow_type)
{
    (void)sensor_type;
    (void)flow_type;

    if (current_menu == 1) // INPUT menu — use field tags
    {
        uint8_t tag = input_field_tags[line];
        switch (tag)
        {
        case FT_ENABLE:        return &enable_edit_flag;
        case FT_SENSOR:        return &sensor_edit_flag;
        case FT_UNITS:         return &flow_units_edit_flag; // reuse for units index
        case FT_RLY_PRI_HI:   return &relay_high_edit_flag;
        case FT_RLY_SEC_HI:   return &relay_sec_high_edit_flag;
        case FT_RLY_PRI_LO:   return &relay_low_edit_flag;
        case FT_RLY_SEC_LO:   return &relay_sec_low_edit_flag;
        case FT_FAULT_POL:     return &fault_polarity_edit_flag;
        default: return NULL;
        }
    }
    else if (current_menu == 3) // CLOCK menu
    {
        switch (line)
        {
        case 0: return &clock_enable_edit_flag;
        case 1: return &end_runtime_edit_flag;
        default: return NULL;
        }
    }
    else if (current_menu == 6) // DIGITAL menu
    {
        uint8_t field_in_group = line % 3;
        switch (field_in_group)
        {
        case 0: return &dig_enable_edit_flag;
        case 1: return &dig_polarity_edit_flag;
        case 2: return &dig_relay_edit_flag;
        default: return NULL;
        }
    }
    return NULL;
}

//=============================================================================
// GET OPTION TYPE FOR FIELD
//=============================================================================

static const item_options_t *get_item_options_for_field(uint8_t line)
{
    if (current_menu == 1) // INPUT menu — use field tags
    {
        uint8_t tag = input_field_tags[line];
        switch (tag)
        {
        case FT_ENABLE:        return &menu_item_options[OPT_ENABLE];
        case FT_SENSOR:        return &menu_item_options[OPT_SENSOR];
        case FT_UNITS:
        {
            uint8_t st = input_config[current_input].sensor_type;
            switch (st)
            {
            case 0: return &menu_item_options[OPT_UNITS_PRESS];
            case 1: return &menu_item_options[OPT_UNITS_TEMP];
            case 2: return &menu_item_options[OPT_UNITS_FLOW];
            case 4: return &menu_item_options[OPT_UNITS_OTHER];
            default: return &menu_item_options[OPT_UNITS_OTHER];
            }
        }
        case FT_RLY_PRI_HI:
        case FT_RLY_SEC_HI:
        case FT_RLY_PRI_LO:
        case FT_RLY_SEC_LO:   return &menu_item_options[OPT_RELAY_MODE];
        case FT_FAULT_POL:
            // Same tag, different meaning by sensor type: a switch picks the
            // level at which its condition is PRESENT; a Watch Dog picks which
            // edge counts as a "still alive" pulse.
            return (input_config[current_input].sensor_type == 6)
                 ? &menu_item_options[OPT_WDT_TRIG]
                 : &menu_item_options[OPT_FAULT_POL];
        default: return NULL;
        }
    }
    else if (current_menu == 3) // CLOCK menu
    {
        switch (line)
        {
        case 0: return &menu_item_options[OPT_CLOCK_ENABLE];
        case 1: return &menu_item_options[OPT_END_RUNTIME];
        default: return NULL;
        }
    }
    else if (current_menu == 6) // DIGITAL menu
    {
        uint8_t field_in_group = line % 3;
        switch (field_in_group)
        {
        case 0: return &menu_item_options[OPT_ENABLE];
        case 1: return &menu_item_options[OPT_DIG_POLARITY];
        case 2: return &menu_item_options[OPT_RELAY_MODE];
        default: return NULL;
        }
    }
    return NULL;
}

//=============================================================================
// MENU INITIALIZATION
//=============================================================================

void menu_init(void)
{
    menu.current_line = 0;
    menu.top_line = 0;
    menu_cancel_edit();  // belt and braces: no sub-mode survives a re-entry
    current_menu = 0;
    rebuild_options_menu();
    menu.total_items = options_menu_count;

    // Initialize digital menu from template
    for (uint8_t i = 0; i < 5; i++)
    {
        digital_menu[i].label = digital_menu_template[i].label;
        digital_menu[i].editable = digital_menu_template[i].editable;
        digital_menu[i].value = NULL;
    }
}

//=============================================================================
// REBUILD FUNCTIONS
//=============================================================================

// Helper to add a menu line
static uint8_t add_menu_item(uint8_t n, const char *label, char *value, uint8_t editable, uint8_t tag)
{
    input_menu[n].label = label;
    input_menu[n].value = value;
    input_menu[n].editable = editable;
    input_field_tags[n] = tag;
    return n + 1;
}

// Sensor-specific label arrays (indexed by sensor_type 0-5)
//                                  Pressure      Temp          FlowMeter     FlowSwitch    Oth4-20       OthSwitch
static const char *lbl_high[7]    = {"High Press",  "High Temp",  "High Flow",  "Flow",       "High Value", "Aux",   "Trigger"};
static const char *lbl_low[7]     = {"Low Press",   "Low Temp",   "Low Flow",   "",           "Low Value",  "",      ""};
static const char *lbl_phi_bp[7]  = {"PHPBP",       "PHTBP",      "PHFBP",      "PFBP",       "PHVBP",      "PABP",  ""};
static const char *lbl_shi_bp[7]  = {"SHPBP",       "SHTBP",      "SHFBP",      "SFBP",       "SHVBP",      "SABP",  ""};
static const char *lbl_plo_bp[7]  = {"PLPBP",       "PLTBP",      "PLFBP",      "PNFBP",      "PLVBP",      "PNABP", "PWDBP"};
static const char *lbl_slo_bp[7]  = {"SLPBP",       "SLTBP",      "SLFBP",      "SNFBP",      "SLVBP",      "SNABP", "SWDBP"};
static const char *lbl_rly_phi[7] = {"Rly PHPBP",   "Rly PHTBP",  "Rly PHFBP",  "Rly PFBP",   "Rly PHVBP",  "Rly PABP",  ""};
static const char *lbl_rly_shi[7] = {"Rly SHPBP",   "Rly SHTBP",  "Rly SHFBP",  "Rly SFBP",   "Rly SHVBP",  "Rly SABP",  ""};
static const char *lbl_rly_plo[7] = {"Rly PLPBP",   "Rly PLTBP",  "Rly PLFBP",  "Rly PNFBP",  "Rly PLVBP",  "Rly PNABP", "Rly PWDBP"};
static const char *lbl_rly_slo[7] = {"Rly SLPBP",   "Rly SLTBP",  "Rly SLFBP",  "Rly SNFBP",  "Rly SLVBP",  "Rly SNABP", "Rly SWDBP"};

// Generate custom bypass labels from name (first 2 uppercase chars)
// Format: P/S + XX + H/L + BP (e.g., "TANK" -> PTAHBP, STAHBP, PTALBP, STALBP)
static void generate_custom_bp_labels(const char *name)
{
    char c1 = 'X', c2 = 'X';

    // Get first 2 uppercase alpha chars from name
    uint8_t found = 0;
    for (uint8_t i = 0; name[i] && found < 2; i++)
    {
        char c = name[i];
        // Convert to uppercase
        if (c >= 'a' && c <= 'z') c -= 32;
        // Only use alpha characters
        if (c >= 'A' && c <= 'Z')
        {
            if (found == 0) c1 = c;
            else c2 = c;
            found++;
        }
    }

    // Generate bypass labels: P/S + XX + H/L + BP
    sprintf(custom_bp_phi, "P%c%cHBP", c1, c2);
    sprintf(custom_bp_shi, "S%c%cHBP", c1, c2);
    sprintf(custom_bp_plo, "P%c%cLBP", c1, c2);
    sprintf(custom_bp_slo, "S%c%cLBP", c1, c2);

    // Generate relay labels
    sprintf(custom_rly_phi, "Rly P%c%cHBP", c1, c2);
    sprintf(custom_rly_shi, "Rly S%c%cHBP", c1, c2);
    sprintf(custom_rly_plo, "Rly P%c%cLBP", c1, c2);
    sprintf(custom_rly_slo, "Rly S%c%cLBP", c1, c2);
}

void rebuild_input_menu(void)
{
    uint8_t idx = current_input;
    uint8_t st = input_config[idx].sensor_type;
    if (st > 6) st = 0;
    uint8_t n = 0;

    static const char *sensor_names[] = {"Pressure", "Temp", "Flow Mtr", "Flow Sw",
                                        "Oth 4-20", "Oth Sw", "WDT"};

    // Menu position -> stored sensor_type. Type 5 is skipped: retired from
    // the selector but still honoured if a stored config carries it.
    static const uint8_t sensor_type_for_option[6] = {0, 1, 2, 3, 4, 6};

    // --- Common fields ---
    enable_edit_flag = input_config[idx].enable;
    sensor_edit_flag = 0;
    for (uint8_t k = 0; k < 6; k++)
        if (sensor_type_for_option[k] == st) { sensor_edit_flag = k; break; }
    strcpy(value_enable, enable_edit_flag ? "Enabled" : "Disabled");

    // For "Other" types with custom name, show the name; otherwise show sensor type
    if ((st == 4 || st == 5) && input_config[idx].name[0] != '\0')
    {
        strncpy(value_sensor, input_config[idx].name, 11);
        value_sensor[11] = '\0';
    }
    else
    {
        strcpy(value_sensor, sensor_names[st]);
    }

    n = add_menu_item(n, "Enable", value_enable, 1, FT_ENABLE);

    // Generate custom bypass labels from name
    generate_custom_bp_labels(input_config[idx].name);

    if (is_analog_type(st))
    {
        // --- ANALOG menu ---
        // Order (team review, 2026-08-30): Enable, BOTH setpoints (low first),
        // then the low bypasses, then the high bypasses, then Sensor, Units,
        // scales, relay modes (low first), Back, EXIT.
        //
        // Low before high throughout: loss of prime is the everyday protection
        // case on an irrigation pump, over-pressure the rare one, so the fields
        // touched most often sit nearest the top.

        // Use custom labels for type 4 (Other 4-20), or default labels for others
        const char *bp_phi = (st == 4) ? custom_bp_phi : lbl_phi_bp[st];
        const char *bp_shi = (st == 4) ? custom_bp_shi : lbl_shi_bp[st];
        const char *bp_plo = (st == 4) ? custom_bp_plo : lbl_plo_bp[st];
        const char *bp_slo = (st == 4) ? custom_bp_slo : lbl_slo_bp[st];
        const char *rly_phi = (st == 4) ? custom_rly_phi : lbl_rly_phi[st];
        const char *rly_shi = (st == 4) ? custom_rly_shi : lbl_rly_shi[st];
        const char *rly_plo = (st == 4) ? custom_rly_plo : lbl_rly_plo[st];
        const char *rly_slo = (st == 4) ? custom_rly_slo : lbl_rly_slo[st];

        // 2. Low setpoint
        sprintf(value_low_sp, "%03d", input_config[idx].low_setpoint);
        n = add_menu_item(n, lbl_low[st], value_low_sp, 1, FT_LO_LIMIT);

        // 3. High setpoint - the two setpoints sit together so the trip
        //    window can be read and set as one thing.
        sprintf(value_high_sp, "%03d", input_config[idx].high_setpoint);
        n = add_menu_item(n, lbl_high[st], value_high_sp, 1, FT_HI_LIMIT);

        // 4. Primary low bypass
        sprintf(value_pri_low_bp, "%02u:%02u",
                input_config[idx].primary_low_bypass / 60,
                input_config[idx].primary_low_bypass % 60);
        n = add_menu_item(n, bp_plo, value_pri_low_bp, 1, FT_PRI_LO_BP);

        // 5. Secondary low bypass
        sprintf(value_sec_low_bp, "%02u:%02u",
                input_config[idx].secondary_low_bypass / 60,
                input_config[idx].secondary_low_bypass % 60);
        n = add_menu_item(n, bp_slo, value_sec_low_bp, 1, FT_SEC_LO_BP);

        // 6. Primary high bypass
        sprintf(value_pri_high_bp, "%02u:%02u",
                input_config[idx].primary_high_bypass / 60,
                input_config[idx].primary_high_bypass % 60);
        n = add_menu_item(n, bp_phi, value_pri_high_bp, 1, FT_PRI_HI_BP);

        // 7. Secondary high bypass
        sprintf(value_sec_high_bp, "%02u:%02u",
                input_config[idx].secondary_high_bypass / 60,
                input_config[idx].secondary_high_bypass % 60);
        n = add_menu_item(n, bp_shi, value_sec_high_bp, 1, FT_SEC_HI_BP);

        // Sensor type
        n = add_menu_item(n, "Sensor", value_sensor, 1, FT_SENSOR);

        // Units: a fixed list for the known sensor types, free text only for
        // Oth 4-20. EVERY analog type used to get the 3-character editor, so
        // the psi/C/% lists were unreachable and a Pressure input could be
        // given any three letters at all. Units are a label - the number
        // comes from Scale 4mA/20mA - so a free-text unit bought nothing
        // except a way to mislabel a reading.
        if (st == 4)
        {
            strncpy(value_custom_units, input_config[idx].units, 3);
            value_custom_units[3] = '\0';
            n = add_menu_item(n, "Units", value_custom_units, 1, FT_CUSTOM_UNITS);
        }
        else
        {
            const item_options_t *uo =
                (st == 0) ? &menu_item_options[OPT_UNITS_PRESS] :
                (st == 1) ? &menu_item_options[OPT_UNITS_TEMP]  :
                            &menu_item_options[OPT_UNITS_FLOW];

            // Recover the stored unit as an index into the list. Anything
            // unrecognised (an older config, or one left by the free-text
            // editor) falls back to the first option rather than showing a
            // unit the operator can no longer select.
            flow_units_edit_flag = 0;
            for (uint8_t u = 0; u < uo->option_count; u++)
            {
                if (strcmp(input_config[idx].units, uo->options[u]) == 0)
                {
                    flow_units_edit_flag = u;
                    break;
                }
            }
            strcpy(value_units, uo->options[flow_units_edit_flag]);
            n = add_menu_item(n, "Units", value_units, 1, FT_UNITS);
        }

        // Scale 4mA
        {
            int16_t v = input_config[idx].scale_4ma;
            if (v < 0) sprintf(value_scale4, "-%03d", -v);
            else sprintf(value_scale4, "+%03d", v);
        }
        n = add_menu_item(n, "Scale 4mA", value_scale4, 1, FT_SCALE_4MA);

        // Scale 20mA
        {
            int16_t v = input_config[idx].scale_20ma;
            if (v < 0) sprintf(value_scale20, "-%03d", -v);
            else sprintf(value_scale20, "+%03d", v);
        }
        n = add_menu_item(n, "Scale 20mA", value_scale20, 1, FT_SCALE_20MA);

        // Relay modes (4 relays for analog)
        relay_high_edit_flag = input_config[idx].relay_pri_high_mode;
        relay_sec_high_edit_flag = input_config[idx].relay_sec_high_mode;
        relay_low_edit_flag = input_config[idx].relay_pri_low_mode;
        relay_sec_low_edit_flag = input_config[idx].relay_sec_low_mode;

        strcpy(value_rly_pri_hi, relay_high_edit_flag ? "Pulse" : "Latch");
        strcpy(value_rly_sec_hi, relay_sec_high_edit_flag ? "Pulse" : "Latch");
        strcpy(value_rly_pri_lo, relay_low_edit_flag ? "Pulse" : "Latch");
        strcpy(value_rly_sec_lo, relay_sec_low_edit_flag ? "Pulse" : "Latch");

        // 12-15. Relay modes, in the same low-before-high order as the
        //        bypasses above so the two blocks read the same way.
        n = add_menu_item(n, rly_plo, value_rly_pri_lo, 1, FT_RLY_PRI_LO);
        n = add_menu_item(n, rly_slo, value_rly_sec_lo, 1, FT_RLY_SEC_LO);
        n = add_menu_item(n, rly_phi, value_rly_pri_hi, 1, FT_RLY_PRI_HI);
        n = add_menu_item(n, rly_shi, value_rly_sec_hi, 1, FT_RLY_SEC_HI);
    }
    else
    {
        // --- DIGITAL/SWITCH menu ---
        // A switch has exactly ONE fault condition (no flow / aux not
        // asserted), so it gets one pair of bypass timers and one pair of
        // relay modes - not the four of each an analog input needs.
        //
        // They live in the LOW direction, because "no flow" is a low
        // condition and that is where the fault is evaluated. Before Ver 3
        // Rev 16 the menu offered all four: the fault ran in the HIGH
        // direction under the labels PFBP/SFBP, while the meaningfully named
        // PNFBP/SNFBP sat on the low direction and were never read at all -
        // settable, saved to EEPROM, and completely inert.

        // Use custom labels for type 5 (Other Switch), defaults for Flow Switch
        const char *bp_plo = (st == 5) ? custom_bp_plo : lbl_plo_bp[st];
        const char *bp_slo = (st == 5) ? custom_bp_slo : lbl_slo_bp[st];
        const char *rly_plo = (st == 5) ? custom_rly_plo : lbl_rly_plo[st];
        const char *rly_slo = (st == 5) ? custom_rly_slo : lbl_rly_slo[st];

        // Switch types: the input level at which flow / aux is PRESENT.
        // Watch Dog: which edge counts as a "still alive" pulse. Same field
        // and same tag; the option table is chosen by sensor type.
        fault_polarity_edit_flag = input_config[idx].fault_polarity;
        if (st == 6)
        {
            static const char *wdt_trig[3] = {"Hi to Lo", "Lo to Hi", "Edge"};
            if (fault_polarity_edit_flag > 2) fault_polarity_edit_flag = 2;
            strcpy(value_fault_pol, wdt_trig[fault_polarity_edit_flag]);
        }
        else
        {
            strcpy(value_fault_pol, fault_polarity_edit_flag ? "High" : "Low");
        }
        n = add_menu_item(n, lbl_high[st], value_fault_pol, 1, FT_FAULT_POL);

        // Primary bypass - startup window
        sprintf(value_pri_low_bp, "%02u:%02u",
                input_config[idx].primary_low_bypass / 60,
                input_config[idx].primary_low_bypass % 60);
        n = add_menu_item(n, bp_plo, value_pri_low_bp, 1, FT_PRI_LO_BP);

        // Secondary bypass - running delay
        sprintf(value_sec_low_bp, "%02u:%02u",
                input_config[idx].secondary_low_bypass / 60,
                input_config[idx].secondary_low_bypass % 60);
        n = add_menu_item(n, bp_slo, value_sec_low_bp, 1, FT_SEC_LO_BP);

        // Sensor type
        n = add_menu_item(n, "Sensor", value_sensor, 1, FT_SENSOR);

        // Relay mode for each of the two timers
        relay_low_edit_flag = input_config[idx].relay_pri_low_mode;
        relay_sec_low_edit_flag = input_config[idx].relay_sec_low_mode;

        strcpy(value_rly_pri_lo, relay_low_edit_flag ? "Pulse" : "Latch");
        strcpy(value_rly_sec_lo, relay_sec_low_edit_flag ? "Pulse" : "Latch");

        n = add_menu_item(n, rly_plo, value_rly_pri_lo, 1, FT_RLY_PRI_LO);
        n = add_menu_item(n, rly_slo, value_rly_sec_lo, 1, FT_RLY_SEC_LO);
    }

    // Back / EXIT
    n = add_menu_item(n, "Back", NULL, 0, FT_BACK);
    n = add_menu_item(n, "EXIT", NULL, 0, FT_EXIT);

    menu.total_items = n;
    menu.current_line = 0;
    menu.top_line = 0;
}

// Rebuild the input menu but leave the cursor on the field carrying `tag`
// rather than jumping back to the top. Matched by tag, not line number, so the
// cursor follows the field even when the analog/digital layout changes.
// If the tag is absent from the new layout the cursor stays at the top.
static void rebuild_input_menu_keep_field(uint8_t tag)
{
    rebuild_input_menu();

    for (uint8_t i = 0; i < menu.total_items; i++)
    {
        if (input_field_tags[i] == tag)
        {
            menu.current_line = i;
            menu.top_line = (i > 2) ? (uint8_t)(i - 2) : 0;
            return;
        }
    }
}

void rebuild_clock_menu(void)
{
    for (uint8_t i = 0; i < 4; i++)
    {
        clock_menu[i].label = clock_menu_template[i].label;
        clock_menu[i].editable = clock_menu_template[i].editable;
        clock_menu[i].value = NULL;
    }

    clock_enable_edit_flag = system_config.clock_enabled;
    strcpy(value_clock_enable, clock_enable_edit_flag ? "Enabled" : "Disabled");
    clock_menu[0].value = value_clock_enable;

    end_runtime_edit_flag = system_config.end_runtime_mode;
    strcpy(value_end_runtime, end_runtime_edit_flag ? "Pulse" : "Latch");
    clock_menu[1].value = value_end_runtime;

    menu.total_items = 4;
    menu.current_line = 0;
    menu.top_line = 0;
}

void rebuild_main_menu(void)
{
    for (uint8_t i = 0; i < 3; i++)
    {
        main_menu_items[i].label = main_menu_template[i].label;
        main_menu_items[i].editable = main_menu_template[i].editable;
        main_menu_items[i].value = NULL;
    }

    uint16_t total_minutes = system_config.runtime_hours * 60 + system_config.runtime_minutes;
    sprintf(value_runtime, "%02u:%02u",
            (uint16_t)(total_minutes / 60),
            (uint16_t)(total_minutes % 60));
    main_menu_items[0].value = value_runtime;

    menu.total_items = 3;
    menu.current_line = 0;
    menu.top_line = 0;
}

void rebuild_utility_menu(void)
{
    for (uint8_t i = 0; i < UTILITY_ITEMS; i++)
    {
        utility_menu[i].label = utility_menu_template[i].label;
        utility_menu[i].editable = utility_menu_template[i].editable;
        utility_menu[i].value = NULL;
    }

    // Menu T/O: the stored byte is SECONDS.
    // It used to be written as secs/2 here and read back as *2, while
    // get_menu_timeout_seconds() - the value actually used - read it raw.
    // The menu therefore displayed double the real timeout, and anything
    // above 120 stored was silently clamped to 30s by the getter while the
    // menu kept showing what was set.
    uint16_t timeout_secs = system_config.menu_timeout;
    sprintf(value_menu_timeout, "%02u:%02u", timeout_secs / 60, timeout_secs % 60);
    utility_menu[0].value = value_menu_timeout;

    // Pwr Detect: stored as seconds
    sprintf(value_pwr_fail, "%02u:%02u",
            system_config.power_fail_delay / 60,
            system_config.power_fail_delay % 60);
    utility_menu[1].value = value_pwr_fail;

    sprintf(value_brightness, "%u", system_config.brightness);
    utility_menu[2].value = value_brightness;

    sprintf(value_relay_pulse, "%02u:%02u",
            system_config.relay_pulse_time / 60,
            system_config.relay_pulse_time % 60);
    utility_menu[3].value = value_relay_pulse;

    menu.total_items = UTILITY_ITEMS;
    menu.current_line = 0;
    menu.top_line = 0;
}


//=============================================================================
// DRAW HELPER
//=============================================================================

static void draw_menu_line(uint8_t screen_row, uint8_t menu_line, uint8_t is_selected,
                           const menu_item_t *items, uint8_t total_items)
{
    char line_buf[21];

    if (menu_line >= total_items)
    {
        lcd_print_at(screen_row, 0, "                    ");
        return;
    }

    memset(line_buf, ' ', 20);
    line_buf[20] = '\0';

    // Cursor indicator
    line_buf[0] = (is_selected && !menu.in_edit_mode) ? '>' : ' ';

    // Label (up to 11 chars)
    const char *label = items[menu_line].label;
    uint8_t llen = strlen(label);
    if (llen > 11) llen = 11;
    memcpy(&line_buf[1], label, llen);

    // Value (right-aligned, up to 8 chars starting at col 12)
    // Flash value when editing this field (blank on blink_state=0)
    const char *val = items[menu_line].value;
    if (val)
    {
        if (is_selected && menu.in_edit_mode && !menu.blink_state)
        {
            // Time fields flash ONLY the pair being edited, so it is obvious
            // which half the encoder is moving. The value is "MM:SS" laid out
            // from col 12, so minutes are 12-13 and seconds 15-16 with the
            // colon between. time_edit_digit is 0 for the left pair and 1
            // for the right: the button steps from one to the other, then
            // confirms. Whichever pair is live flashes; the other stays put.
            if (menu.edit_time_mode > 0)
            {
                uint8_t vlen = strlen(val);
                if (vlen > 8) vlen = 8;
                memcpy(&line_buf[12], val, vlen);
                if (menu.time_edit_digit == 0)
                {
                    line_buf[12] = ' ';
                    line_buf[13] = ' ';
                }
                else
                {
                    line_buf[15] = ' ';
                    line_buf[16] = ' ';
                }
            }
            // Everything else blanks entirely for the flash.
        }
        else
        {
            uint8_t vlen = strlen(val);
            if (vlen > 8) vlen = 8;
            memcpy(&line_buf[12], val, vlen);
        }
    }

    lcd_print_at(screen_row, 0, line_buf);
}

//=============================================================================
// DRAW FUNCTIONS
//=============================================================================

void menu_draw_options(void)
{
    lcd_print_at(0, 0, "===== OPTIONS ======");
    for (uint8_t row = 0; row < 3; row++)
    {
        uint8_t idx = menu.top_line + row;
        char line_buf[21];
        memset(line_buf, ' ', 20);
        line_buf[20] = '\0';
        line_buf[0] = (idx == menu.current_line) ? '>' : ' ';
        if (idx < options_menu_count)
        {
            uint8_t len = strlen(options_menu[idx]);
            if (len > 19) len = 19;
            memcpy(&line_buf[1], options_menu[idx], len);
        }
        lcd_print_at(row + 1, 0, line_buf);
    }
}

void menu_draw_input(void)
{
    // If in name editor mode, draw the editor instead
    if (menu.name_edit_mode > 0)
    {
        draw_name_editor();
        return;
    }

    // Title shows sensor name for this input
    char title[21];
    char upper_name[16];
    upper_name[0] = '\0';  // Initialize in case name is empty
    // Convert name to uppercase for title
    const char *src = input_config[current_input].name;
    for (uint8_t i = 0; i < 15 && src[i]; i++)
    {
        upper_name[i] = (src[i] >= 'a' && src[i] <= 'z') ? src[i] - 32 : src[i];
        upper_name[i + 1] = '\0';
    }
    // If name is empty, use sensor type name instead
    if (upper_name[0] == '\0')
    {
        static const char *type_names[] = {"PRESSURE", "TEMPERATURE", "FLOW METER",
                                           "FLOW SWITCH", "OTHER 4-20", "OTHER SWITCH",
                                           "WATCH DOG"};
        uint8_t st = input_config[current_input].sensor_type;
        if (st > 6) st = 0;
        strncpy(upper_name, type_names[st], 12);
        upper_name[12] = '\0';
    }
    sprintf(title, "===== %-12s==", upper_name);
    lcd_print_at(0, 0, title);

    for (uint8_t row = 0; row < 3; row++)
    {
        uint8_t line = menu.top_line + row;
        draw_menu_line(row + 1, line, (line == menu.current_line), input_menu, menu.total_items);
    }
}

void menu_draw_setup(void)
{
    lcd_print_at(0, 0, "====== SETUP =======");
    const char *setup_items[6];
    for (uint8_t i = 0; i < 3; i++)
    {
        setup_items[i] = input_config[i].name;
    }
    setup_items[3] = "Clock";
    setup_items[4] = "Back";
    setup_items[5] = "EXIT";

    for (uint8_t row = 0; row < 3; row++)
    {
        uint8_t idx = menu.top_line + row;
        char line_buf[21];
        memset(line_buf, ' ', 20);
        line_buf[20] = '\0';
        line_buf[0] = (idx == menu.current_line) ? '>' : ' ';
        if (idx < 6)
        {
            uint8_t len = strlen(setup_items[idx]);
            if (len > 19) len = 19;
            memcpy(&line_buf[1], setup_items[idx], len);
        }
        lcd_print_at(row + 1, 0, line_buf);
    }
}

void menu_draw_clock(void)
{
    lcd_print_at(0, 0, "====== CLOCK =======");
    for (uint8_t row = 0; row < 3; row++)
    {
        uint8_t line = menu.top_line + row;
        draw_menu_line(row + 1, line, (line == menu.current_line), clock_menu, 4);
    }
}

void menu_draw_main_menu(void)
{
    lcd_print_at(0, 0, "====== CLOCK =======");

    if (menu.in_edit_mode && menu.edit_time_mode == 4 && menu.current_line == 0)
    {
        // Custom draw for whole-number HH:MM editing
        char line_buf[21];
        memset(line_buf, ' ', 20);
        line_buf[20] = '\0';

        // No cursor '>' during edit - label starts at col 1
        memcpy(&line_buf[1], "Run Time", 8);

        // Show HH:MM at value position (col 12), flash the active part
        if (menu.time_edit_digit == 0) // Editing HH
        {
            if (menu.blink_state)
                sprintf(&line_buf[12], "%02u:%02u", menu.time_xx, menu.time_yy);
            else
                sprintf(&line_buf[12], "  :%02u", menu.time_yy);
        }
        else // Editing MM
        {
            if (menu.blink_state)
                sprintf(&line_buf[12], "%02u:%02u", menu.time_xx, menu.time_yy);
            else
                sprintf(&line_buf[12], "%02u:  ", menu.time_xx);
        }
        line_buf[17] = ' '; // Ensure no null from sprintf cuts the line
        lcd_print_at(1, 0, line_buf);

        // Draw remaining rows normally
        for (uint8_t row = 1; row < 3; row++)
        {
            uint8_t line = menu.top_line + row;
            draw_menu_line(row + 1, line, (line == menu.current_line), main_menu_items, 3);
        }
    }
    else
    {
        for (uint8_t row = 0; row < 3; row++)
        {
            uint8_t line = menu.top_line + row;
            draw_menu_line(row + 1, line, (line == menu.current_line), main_menu_items, 3);
        }
    }
}

void menu_draw_utility(void)
{
    lcd_print_at(0, 0, "===== UTILITY ======");
    for (uint8_t row = 0; row < 3; row++)
    {
        uint8_t line = menu.top_line + row;
        draw_menu_line(row + 1, line, (line == menu.current_line), utility_menu, UTILITY_ITEMS);
    }
}

void menu_draw_digital(void)
{
    char title[21];
    sprintf(title, "==== DIGITAL %d =====", current_digital_input + 1);
    lcd_print_at(0, 0, title);

    // Set value pointers based on current_digital_input
    for (uint8_t f = 0; f < 3; f++)
    {
        uint8_t val = 0;
        switch (current_digital_input)
        {
        case 0:
            if (f == 0) val = system_config.dig2_enable;
            else if (f == 1) val = system_config.dig2_fault_polarity;
            else val = system_config.dig2_relay_mode;
            break;
        case 1:
            if (f == 0) val = system_config.dig3_enable;
            else if (f == 1) val = system_config.dig3_fault_polarity;
            else val = system_config.dig3_relay_mode;
            break;
        case 2:
            if (f == 0) val = system_config.dig4_enable;
            else if (f == 1) val = system_config.dig4_fault_polarity;
            else val = system_config.dig4_relay_mode;
            break;
        }

        const item_options_t *opts = get_item_options_for_field(f);
        if (opts && val < opts->option_count)
            digital_menu[f].value = (char *)opts->options[val];
        else
            digital_menu[f].value = "?";
    }

    for (uint8_t row = 0; row < 3; row++)
    {
        uint8_t line = menu.top_line + row;
        draw_menu_line(row + 1, line, (line == menu.current_line), digital_menu, 5);
    }
}


//=============================================================================
// ENCODER HANDLING
//=============================================================================

void menu_handle_encoder(int16_t delta)
{
    // Name editor mode
    if (menu.name_edit_mode > 0)
    {
        handle_name_rotation((int8_t)delta);
        return;
    }

    if (menu.in_edit_mode)
    {
        // In edit mode, handle value changes
        if (menu.edit_time_mode > 0)
        {
            handle_time_rotation((int8_t)delta);
            return;
        }

        // Whole-number signed edit mode (acceleration)
        if (menu.edit_whole_mode)
        {
            // Acceleration: fast spin (<112ms between detents) = step by 20.
            // Pointless on a short range - brightness is ten steps, where a
            // single quick turn would slam straight to the rail.
            int16_t span = menu.whole_edit_max - menu.whole_edit_min;
            int16_t step = (span > 20 && encoder_ms_timer < 112) ? 20 : 1;
            encoder_ms_timer = 0; // Reset for next detent timing

            int16_t before = menu.whole_edit_value;

            if (delta > 0)
                menu.whole_edit_value += step;
            else if (delta < 0)
                menu.whole_edit_value -= step;

            // Clamp
            if (menu.whole_edit_value > menu.whole_edit_max)
                menu.whole_edit_value = menu.whole_edit_max;
            if (menu.whole_edit_value < menu.whole_edit_min)
                menu.whole_edit_value = menu.whole_edit_min;

            // A detent that changes nothing means the range is exhausted.
            // Without this the encoder just feels dead and the operator has
            // no way to tell a limit from a fault. Note the test is on the
            // value, not on the clamp: an accelerated step that only partly
            // fits still moves the value, so it is not a refusal.
            if (menu.whole_edit_value == before)
            {
                if (!limit_beeped)
                {
                    beep(LIMIT_BEEP_MS);
                    limit_beeped = 1;
                }
            }
            else
            {
                limit_beeped = 0;
            }

            menu_update_edit_value();
            return;
        }

        // Check if it's an option field
        uint8_t sensor = input_config[current_input].sensor_type;
        uint8_t flow = 0;

        if (is_option_field(menu.current_line, sensor, flow))
        {
            uint8_t *flag = get_option_edit_flag(menu.current_line, sensor, flow);
            const item_options_t *opts = get_item_options_for_field(menu.current_line);
            if (flag && opts)
            {
                if (delta > 0)
                {
                    *flag = (*flag + 1) % opts->option_count;
                }
                else if (delta < 0)
                {
                    if (*flag == 0)
                        *flag = opts->option_count - 1;
                    else
                        (*flag)--;
                }
                // Update the display value in the menu item
                menu_update_edit_value();
            }
            return;
        }

        // Numeric field - digit editing
        if (menu.edit_digit == 0 && !menu.edit_unsigned)
        {
            // Sign digit
            if (delta != 0)
                menu.sign_negative = !menu.sign_negative;
        }
        else
        {
            // Numeric digits
            uint8_t *digit;
            if (menu.edit_digit == 1 || (menu.edit_digit == 0 && menu.edit_unsigned))
                digit = &menu.digit_100;
            else if (menu.edit_digit == 2 || (menu.edit_digit == 1 && menu.edit_unsigned))
                digit = &menu.digit_10;
            else
                digit = &menu.digit_1;

            if (delta > 0)
            {
                if (menu.edit_digit == 1 || (menu.edit_digit == 0 && menu.edit_unsigned))
                {
                    // Hundreds: 0-5 (changed from 0-9 for ±999 range with sign)
                    *digit = (*digit + 1) % 10;
                }
                else
                {
                    *digit = (*digit + 1) % 10;
                }
            }
            else if (delta < 0)
            {
                if (*digit == 0)
                    *digit = 9;
                else
                    (*digit)--;
            }
        }
        menu_update_edit_value();
    }
    else
    {
        // Navigation mode - scroll through menu
        int16_t new_line = menu.current_line + delta;
        if (new_line < 0) new_line = 0;
        if (new_line >= menu.total_items) new_line = menu.total_items - 1;
        menu.current_line = (uint8_t)new_line;

        // Scroll window
        if (menu.current_line < menu.top_line)
            menu.top_line = menu.current_line;
        if (menu.current_line >= menu.top_line + 3)
            menu.top_line = menu.current_line - 2;
    }
}

//=============================================================================
// TIME EDITOR
//=============================================================================

// Leave edit mode cleanly.
//
// Every edit sub-mode has to be cleared together, because
// menu_handle_encoder() tests them in sequence and returns on the first
// match - so a stale sub-mode silently swallows rotation meant for a
// different field type. Aborting a numeric edit (long press or menu
// timeout) used to leave edit_whole_mode set, and the next option field
// entered would then flash but refuse to change. It looked intermittent
// because the whole-number confirm path is the only place that cleared
// the flag, so any later button press quietly repaired it.
void menu_cancel_edit(void)
{
    menu.in_edit_mode = 0;
    menu.edit_whole_mode = 0;
    menu.edit_time_mode = 0;
    menu.name_edit_mode = 0;
}

void init_time_editor(uint16_t value_seconds, uint8_t mode)
{
    menu.edit_whole_mode = 0;  // mutually exclusive with time editing
    menu.edit_time_mode = mode + 1; // 1=MM:SS, 2=HH:MM
    menu.time_edit_digit = 0;

    if (mode == 0) // MM:SS
    {
        menu.time_xx = value_seconds / 60;
        menu.time_yy = value_seconds % 60;
    }
    else // HH:MM
    {
        menu.time_xx = value_seconds / 60;
        menu.time_yy = value_seconds % 60;
    }
    menu.time_original = value_seconds;
}

void handle_time_rotation(int8_t direction)
{
    uint8_t *target;
    uint8_t max_val;

    // Whole-number HH:MM mode (mode 4) - increment/decrement as whole value with wrapping
    if (menu.edit_time_mode == 4)
    {
        if (menu.time_edit_digit == 0) // Editing HH (0-99, wrapping)
        {
            if (direction > 0)
                menu.time_xx = (menu.time_xx >= 99) ? 0 : menu.time_xx + 1;
            else
                menu.time_xx = (menu.time_xx == 0) ? 99 : menu.time_xx - 1;
        }
        else // Editing MM (0-59, wrapping)
        {
            if (direction > 0)
                menu.time_yy = (menu.time_yy >= 59) ? 0 : menu.time_yy + 1;
            else
                menu.time_yy = (menu.time_yy == 0) ? 59 : menu.time_yy - 1;
        }

        menu_update_time_value();
        return;
    }

    switch (menu.time_edit_digit)
    {
    case 0: // Tens of XX
        target = &menu.time_xx;
        max_val = (menu.edit_time_mode == 3) ? 23 : 99; // HH:MM with 24hr limit
        if (direction > 0)
        {
            if (*target / 10 < max_val / 10)
            {
                *target += 10;
            }
        }
        else
        {
            if (*target >= 10) *target -= 10;
        }
        break;
    case 1: // Units of XX
        target = &menu.time_xx;
        max_val = (menu.edit_time_mode == 3) ? 23 : 99;
        if (direction > 0)
        {
            uint8_t units = *target % 10;
            if (units < 9 && *target < max_val)
                *target = (*target / 10) * 10 + units + 1;
        }
        else
        {
            uint8_t units = *target % 10;
            if (units > 0)
                *target = (*target / 10) * 10 + units - 1;
        }
        break;
    case 2: // Tens of YY
        target = &menu.time_yy;
        if (direction > 0)
        {
            if (*target + 10 <= 59) *target += 10;
        }
        else
        {
            if (*target >= 10) *target -= 10;
        }
        break;
    case 3: // Units of YY
        target = &menu.time_yy;
        if (direction > 0)
        {
            if (*target < 59) (*target)++;
        }
        else
        {
            if (*target > 0) (*target)--;
        }
        break;
    }

    menu_update_time_value();
}

//=============================================================================
// NAME EDITOR
//=============================================================================

// Get display character at charset index
static char get_char_at_index(uint8_t index)
{
    if (index < CHARSET_SIZE)
        return (char)(CHARSET_START + index);
    return ' ';  // Back/Done are not single chars
}

// Check if index is a special option
static uint8_t is_special_index(uint8_t index)
{
    if (index == BACK_INDEX) return 1;  // Back
    if (index == DONE_INDEX) return 2;  // Done
    return 0;  // Regular character
}

// Find charset index for a character
static uint8_t char_to_index(char c)
{
    if (c >= CHARSET_START && c <= CHARSET_END)
        return (uint8_t)(c - CHARSET_START);
    return 33;  // Default to 'A' (index 33 = ASCII 65)
}

void init_name_editor(uint8_t mode, const char *initial)
{
    menu.name_edit_mode = mode;
    menu.name_edit_pos = 0;
    menu.name_char_index = 33;  // Start at 'A'

    if (mode == 1)  // Name editing (10 chars max)
    {
        memset(menu.name_buffer, 0, 11);
        if (initial && initial[0])
        {
            strncpy(menu.name_buffer, initial, 10);
            menu.name_buffer[10] = '\0';
            // Position cursor at end of existing text
            uint8_t len = strlen(menu.name_buffer);
            if (len > 0 && len < 10)
            {
                menu.name_edit_pos = len;
                menu.name_char_index = 33;  // Start at 'A' for new char
            }
            else if (len > 0)
            {
                // Buffer full, position at last char
                menu.name_edit_pos = len - 1;
                menu.name_char_index = char_to_index(menu.name_buffer[menu.name_edit_pos]);
            }
        }
    }
    else if (mode == 2)  // Units editing (3 chars max)
    {
        memset(menu.units_buffer, 0, 4);
        if (initial && initial[0])
        {
            strncpy(menu.units_buffer, initial, 3);
            menu.units_buffer[3] = '\0';
            uint8_t len = strlen(menu.units_buffer);
            if (len > 0 && len < 3)
            {
                menu.name_edit_pos = len;
                menu.name_char_index = 33;
            }
            else if (len > 0)
            {
                menu.name_edit_pos = len - 1;
                menu.name_char_index = char_to_index(menu.units_buffer[menu.name_edit_pos]);
            }
        }
    }

    menu.in_edit_mode = 1;
}

void handle_name_rotation(int8_t delta)
{
    // If currently on Done or Back, rotating resets to 'A'
    if (menu.name_char_index >= BACK_INDEX)
    {
        menu.name_char_index = 33;  // 'A'
        return;
    }

    // Cycle through charset with wrapping
    int16_t new_index = (int16_t)menu.name_char_index + delta;

    if (new_index < 0)
        new_index = TOTAL_CHAR_OPTIONS - 1;
    else if (new_index >= TOTAL_CHAR_OPTIONS)
        new_index = 0;

    menu.name_char_index = (uint8_t)new_index;
}

// Handle button press in name editor
// Returns: 0=still editing, 1=done, 2=cancelled (Back at pos 0)
uint8_t handle_name_button(void)
{
    uint8_t special = is_special_index(menu.name_char_index);
    uint8_t max_pos = (menu.name_edit_mode == 1) ? 10 : 2;  // 11 chars or 3 chars
    char *buffer = (menu.name_edit_mode == 1) ? menu.name_buffer : menu.units_buffer;

    if (special == 2)  // Done
    {
        // Null-terminate at current position
        buffer[menu.name_edit_pos] = '\0';
        return 1;  // Done
    }

    if (special == 1)  // Back
    {
        if (menu.name_edit_pos == 0)
        {
            // Back at position 0 = cancel
            return 2;  // Cancelled
        }
        // Erase last char and move back
        menu.name_edit_pos--;
        buffer[menu.name_edit_pos] = '\0';
        // Set char index to the previous char if any, otherwise 'A'
        if (menu.name_edit_pos > 0)
            menu.name_char_index = char_to_index(buffer[menu.name_edit_pos - 1]);
        else
            menu.name_char_index = 33;  // 'A'
        return 0;  // Still editing
    }

    // Regular character - insert at current position
    buffer[menu.name_edit_pos] = get_char_at_index(menu.name_char_index);
    buffer[menu.name_edit_pos + 1] = '\0';

    if (menu.name_edit_pos >= max_pos)
    {
        // Buffer full - auto-complete
        return 1;  // Done
    }

    // Advance to next position
    menu.name_edit_pos++;
    menu.name_char_index = DONE_INDEX;  // Jump to Done for quick access

    return 0;  // Still editing
}

// Draw the name editor screen
static void draw_name_editor(void)
{
    char line_buf[21];
    char *buffer = (menu.name_edit_mode == 1) ? menu.name_buffer : menu.units_buffer;
    uint8_t max_len = (menu.name_edit_mode == 1) ? 11 : 3;
    const char *title = (menu.name_edit_mode == 1) ? "===== NAME =========" : "===== UNITS ========";

    lcd_print_at(0, 0, title);

    uint8_t special = is_special_index(menu.name_char_index);

    if (special == 0)
    {
        // Editing a character - show buffer with current char (no cursor)
        memset(line_buf, ' ', 20);
        line_buf[20] = '\0';

        // Copy existing chars
        for (uint8_t i = 0; i < menu.name_edit_pos && i < max_len; i++)
        {
            line_buf[i] = buffer[i];
        }

        // Show current char at edit position
        line_buf[menu.name_edit_pos] = get_char_at_index(menu.name_char_index);

        lcd_print_at(1, 0, line_buf);
        lcd_print_at(2, 0, "< Short=OK Long=X   ");
        lcd_print_at(3, 0, "                    ");
    }
    else
    {
        // On Back or Done - show complete buffer and flashing option
        memset(line_buf, ' ', 20);
        line_buf[20] = '\0';

        // Show buffer content
        uint8_t len = strlen(buffer);
        for (uint8_t i = 0; i < len && i < max_len; i++)
        {
            line_buf[i] = buffer[i];
        }

        lcd_print_at(1, 0, line_buf);

        // Show Back/Done on line 2 (flashing)
        memset(line_buf, ' ', 20);
        line_buf[20] = '\0';

        if (menu.blink_state)
        {
            if (special == 1)
                memcpy(&line_buf[7], "[Back]", 6);
            else
                memcpy(&line_buf[7], "[Done]", 6);
        }

        lcd_print_at(2, 0, line_buf);
        lcd_print_at(3, 0, "                    ");
    }
}

void menu_update_time_value(void)
{
    char buf[6];
    sprintf(buf, "%02u:%02u", menu.time_xx, menu.time_yy);

    // Update the appropriate value buffer based on current menu
    if (current_menu == 1) // INPUT — use tags
    {
        uint8_t tag = input_field_tags[menu.current_line];
        switch (tag)
        {
        case FT_PRI_HI_BP:  strcpy(value_pri_high_bp, buf); break;
        case FT_SEC_HI_BP:  strcpy(value_sec_high_bp, buf); break;
        case FT_PRI_LO_BP:  strcpy(value_pri_low_bp, buf); break;
        case FT_SEC_LO_BP:  strcpy(value_sec_low_bp, buf); break;
        }
    }
    else if (current_menu == 4) // UTILITY
    {
        // [C8] Indices MUST match utility_menu_template:
        //   0 Menu T/O | 1 Pwr Detect | 2 Brightness | 3 Rly Dwell |
        //   4 About | 5 Back | 6 EXIT
        // These were 4/5/7 (each +1), so the live value never updated while
        // editing, and editing Pwr Detect wrote into the Menu T/O buffer —
        // visibly corrupting the row above it.
        switch (menu.current_line)
        {
        case 0: strcpy(value_menu_timeout, buf); break;  // Menu T/O
        case 1: strcpy(value_pwr_fail, buf); break;      // Pwr Detect
        }
    }
    else if (current_menu == 5) // MAIN
    {
        if (menu.current_line == 0)
            strcpy(value_runtime, buf);
    }
}

//=============================================================================
// UPDATE EDIT VALUE (for numeric and option fields)
//=============================================================================

void menu_update_edit_value(void)
{
    uint8_t sensor = input_config[current_input].sensor_type;
    uint8_t flow = 0;

    if (is_option_field(menu.current_line, sensor, flow))
    {
        uint8_t *flag = get_option_edit_flag(menu.current_line, sensor, flow);
        const item_options_t *opts = get_item_options_for_field(menu.current_line);
        if (flag && opts && *flag < opts->option_count)
        {
            if (current_menu == 1) // INPUT — use tags
            {
                uint8_t tag = input_field_tags[menu.current_line];
                switch (tag)
                {
                case FT_ENABLE:        strcpy(value_enable, opts->options[*flag]); break;
                case FT_SENSOR:        strcpy(value_sensor, opts->options[*flag]); break;
                case FT_UNITS:         strcpy(value_units, opts->options[*flag]); break;
                case FT_RLY_PRI_HI:    strcpy(value_rly_pri_hi, opts->options[*flag]); break;
                case FT_RLY_SEC_HI:    strcpy(value_rly_sec_hi, opts->options[*flag]); break;
                case FT_RLY_PRI_LO:    strcpy(value_rly_pri_lo, opts->options[*flag]); break;
                case FT_RLY_SEC_LO:    strcpy(value_rly_sec_lo, opts->options[*flag]); break;
                case FT_FAULT_POL:     strcpy(value_fault_pol, opts->options[*flag]); break;
                }
            }
            else if (current_menu == 3) // CLOCK
            {
                switch (menu.current_line)
                {
                case 0: strcpy(value_clock_enable, opts->options[*flag]); break;
                case 1: strcpy(value_end_runtime, opts->options[*flag]); break;
                }
            }
        }
        return;
    }

    // Whole-number edit mode - format value directly
    if (menu.edit_whole_mode)
    {
        char buf[10];
        int16_t v = menu.whole_edit_value;
        if (current_menu == 1)
        {
            uint8_t tag = input_field_tags[menu.current_line];
            // BP fields: display as MM:SS
            if (tag == FT_PRI_HI_BP || tag == FT_SEC_HI_BP ||
                tag == FT_PRI_LO_BP || tag == FT_SEC_LO_BP)
            {
                uint16_t secs = (uint16_t)v;
                sprintf(buf, "%02u:%02u", secs / 60, secs % 60);
                switch (tag)
                {
                case FT_PRI_HI_BP:  strcpy(value_pri_high_bp, buf); break;
                case FT_SEC_HI_BP:  strcpy(value_sec_high_bp, buf); break;
                case FT_PRI_LO_BP:  strcpy(value_pri_low_bp, buf); break;
                case FT_SEC_LO_BP:  strcpy(value_sec_low_bp, buf); break;
                }
                return;
            }
            // Other numeric fields: signed/unsigned format
            if (menu.whole_edit_min >= 0)
                sprintf(buf, "%03d", v);
            else if (v < 0)
                sprintf(buf, "-%03d", -v);
            else
                sprintf(buf, "+%03d", v);
            switch (tag)
            {
            case FT_SCALE_4MA:  strcpy(value_scale4, buf); break;
            case FT_SCALE_20MA: strcpy(value_scale20, buf); break;
            case FT_HI_LIMIT:   strcpy(value_high_sp, buf); break;
            case FT_LO_LIMIT:   strcpy(value_low_sp, buf); break;
            }
        }
        else if (current_menu == 4) // UTILITY
        {
            if (menu.current_line == 2) // Brightness
            {
                // A plain 0-9 step, not a duration - MM:SS would be nonsense.
                // With no case here at all the row simply never updated while
                // the encoder turned: the value was changing underneath, so it
                // looked like the control was dead.
                sprintf(buf, "%u", (unsigned)v);
                strcpy(value_brightness, buf);

                // Apply on every detent so the operator sees what they are
                // choosing. The display board persists it (two EEPROM bytes,
                // ~8ms deaf) but ten steps means at most ten writes for a full
                // sweep - cheap next to guessing and confirming blind.
                disp_set_brightness((uint8_t)(v * 10));  // 1-10 -> 10-100%
            }
            else
            {
                uint16_t secs = (uint16_t)v;
                sprintf(buf, "%02u:%02u", secs / 60, secs % 60);
                switch (menu.current_line)
                {
                case 0: strcpy(value_menu_timeout, buf); break;  // Menu T/O
                case 1: strcpy(value_pwr_fail, buf); break;      // Pwr Detect
                case 3: strcpy(value_relay_pulse, buf); break;   // Rly Dwell
                }
            }
        }
        return;
    }

    // Numeric field - compose value from digits (utility menu only now)
    if (is_numeric_field(menu.current_line, sensor, flow))
    {
        char buf[10];
        int16_t val = menu.digit_100 * 100 + menu.digit_10 * 10 + menu.digit_1;
        if (menu.sign_negative) val = -val;

        sprintf(buf, "%d", val);

        if (current_menu == 4) // UTILITY
        {
            // [C8] Indices MUST match utility_menu_template (see above).
            // These were 3/6 (each +1), so neither case ever matched and the
            // digits stayed frozen on screen while the encoder was turned.
            switch (menu.current_line)
            {
            case 2: strcpy(value_brightness, buf); break;   // Brightness
            }
        }
    }
}

//=============================================================================
// SAVE FIELD TO CONFIG (called on edit exit)
//=============================================================================

static void save_input_field(uint8_t line, uint8_t idx)
{
    uint8_t tag = input_field_tags[line];

    switch (tag)
    {
    case FT_ENABLE:
        input_config[idx].enable = enable_edit_flag;
        break;
    case FT_SENSOR:
    {
        // Save original state before changing (for cancel/restore)
        memcpy(&saved_input_cfg, &input_config[idx], sizeof(input_config_t));

        // Reset every sensor-dependent field - scales, setpoints, bypass
        // timers, relay modes, fault polarity, name and units - to the new
        // type's defaults. Carrying the previous sensor's trip settings over
        // would leave the input protecting the pump against the wrong thing.
        {
            static const uint8_t opt_to_type[6] = {0, 1, 2, 3, 4, 6};
            uint8_t new_st = (sensor_edit_flag < 6) ? opt_to_type[sensor_edit_flag] : 0;
            apply_sensor_type_defaults(idx, new_st);
        }
        // Rebuild menu since analog/digital layout may change
        input_config_dirty[idx] = 1;  // Defer EEPROM write to after 1-second tick
        rebuild_input_menu_keep_field(FT_SENSOR);

        // For "Other" types, automatically open name editor with empty string
        // Menu position 4 is "Oth 4-20" - a generic analog input that needs a
        // name of the operator's choosing, since nothing else identifies what
        // it is measuring. WDT is not offered the editor: a watchdog is always
        // a watchdog, and its bypass labels are fixed at PWDBP/SWDBP anyway.
        if (sensor_edit_flag == 4)
        {
            // Mark as auto-opened so cancel can restore previous state
            name_editor_auto_opened = 1;
            // Open name editor with empty string
            init_name_editor(1, "");
        }
        return;
    }
    case FT_UNITS:
        // Units stored as option index — copy option text to config
    {
        const item_options_t *opts = get_item_options_for_field(line);
        if (opts && flow_units_edit_flag < opts->option_count)
        {
            strncpy(input_config[idx].units, opts->options[flow_units_edit_flag], 7);
            input_config[idx].units[7] = '\0';
        }
        break;
    }
    case FT_SCALE_4MA:
        input_config[idx].scale_4ma = menu.whole_edit_value;
        break;
    case FT_SCALE_20MA:
        input_config[idx].scale_20ma = menu.whole_edit_value;
        break;
    case FT_HI_LIMIT:
        input_config[idx].high_setpoint = menu.whole_edit_value;
        break;
    case FT_PRI_HI_BP:
        input_config[idx].primary_high_bypass = (uint16_t)(menu.time_xx * 60 + menu.time_yy);
        break;
    case FT_SEC_HI_BP:
        input_config[idx].secondary_high_bypass = (uint16_t)(menu.time_xx * 60 + menu.time_yy);
        break;
    case FT_LO_LIMIT:
        input_config[idx].low_setpoint = menu.whole_edit_value;
        break;
    case FT_PRI_LO_BP:
        input_config[idx].primary_low_bypass = (uint16_t)(menu.time_xx * 60 + menu.time_yy);
        break;
    case FT_SEC_LO_BP:
        input_config[idx].secondary_low_bypass = (uint16_t)(menu.time_xx * 60 + menu.time_yy);
        break;
    case FT_RLY_PRI_HI:
        input_config[idx].relay_pri_high_mode = relay_high_edit_flag;
        break;
    case FT_RLY_SEC_HI:
        input_config[idx].relay_sec_high_mode = relay_sec_high_edit_flag;
        break;
    case FT_RLY_PRI_LO:
        input_config[idx].relay_pri_low_mode = relay_low_edit_flag;
        break;
    case FT_RLY_SEC_LO:
        input_config[idx].relay_sec_low_mode = relay_sec_low_edit_flag;
        break;
    case FT_FAULT_POL:
        input_config[idx].fault_polarity = fault_polarity_edit_flag;
        break;
    case FT_NAME:
        // Copy name from edit buffer to config
        strncpy(input_config[idx].name, menu.name_buffer, 15);
        input_config[idx].name[15] = '\0';
        // Update display buffer
        strncpy(value_custom_name, menu.name_buffer, 11);
        value_custom_name[11] = '\0';
        break;
    case FT_CUSTOM_UNITS:
        // Copy units from edit buffer to config
        strncpy(input_config[idx].units, menu.units_buffer, 7);
        input_config[idx].units[7] = '\0';
        // Update display buffer
        strncpy(value_custom_units, menu.units_buffer, 3);
        value_custom_units[3] = '\0';
        break;
    }

    // Write to EEPROM immediately
    input_config_dirty[idx] = 1;  // Defer EEPROM write to after 1-second tick
}

static void save_clock_field(uint8_t line)
{
    switch (line)
    {
    case 0:
    {
        system_config.clock_enabled = clock_enable_edit_flag;
        // Switching between countdown and count-up mid-run needs the
        // timer reloaded, or it keeps the other mode's value
        extern void reload_run_timer(void);
        reload_run_timer();
        break;
    }
    case 1:
        system_config.end_runtime_mode = end_runtime_edit_flag;
        break;
    }
    system_config_dirty = 1;  // Defer EEPROM write
}

static void save_utility_field(uint8_t line)
{
    switch (line)
    {
    // Both edited as whole seconds; the editor has already clamped them
    // to whole_edit_min/max, so no second clamp is needed here.
    case 0: // Menu T/O
        system_config.menu_timeout = (uint8_t)menu.whole_edit_value;
        break;
    case 1: // Pwr Detect
        system_config.power_fail_delay = (uint16_t)menu.whole_edit_value;
        break;
    case 2: // Brightness
    {
        system_config.brightness = (uint8_t)menu.whole_edit_value;
        // Apply it now. Previously brightness was only pushed to the display
        // board at boot, so changing it appeared to do nothing until the next
        // power cycle. Sent on confirm rather than per detent: the display
        // board writes its backlight setting to EEPROM and is deaf while it
        // does, so one frame per edit, not one per click.
        disp_set_brightness((uint8_t)(system_config.brightness * 10));  // 1-10 -> 10-100%
        break;
    }
    // Rly Dwell: how long the relay is held open AFTER the run signal
    // drops, not the total open time. A pulsed stop keeps the relay open
    // until DIG_IN1 goes low and then for this long, so a VSD that holds
    // its run signal high while ramping down cannot get the pump back.
    case 3: // Rly Dwell
        // The editor clamps to 1-120, which is the whole range of the
        // uint8_t field, so nothing can arrive here out of range.
        system_config.relay_pulse_time = (uint8_t)menu.whole_edit_value;
        break;
    }
    system_config_dirty = 1;  // Defer EEPROM write
}

static void save_main_field(uint8_t line)
{
    if (line == 0) // Run Time (HH:MM)
    {
        system_config.runtime_hours = menu.time_xx;
        system_config.runtime_minutes = menu.time_yy;
        // Take effect immediately if the pump is already running
        extern void reload_run_timer(void);
        reload_run_timer();
    }
    system_config_dirty = 1;  // Defer EEPROM write
}

static void save_digital_field(uint8_t line)
{
    if (line >= 3) return;

    uint8_t *flag = get_option_edit_flag(line, 0, 0);
    if (!flag) return;

    switch (current_digital_input)
    {
    case 0: // DIG2
        if (line == 0) system_config.dig2_enable = *flag;
        else if (line == 1) system_config.dig2_fault_polarity = *flag;
        else system_config.dig2_relay_mode = *flag;
        break;
    case 1: // DIG3
        if (line == 0) system_config.dig3_enable = *flag;
        else if (line == 1) system_config.dig3_fault_polarity = *flag;
        else system_config.dig3_relay_mode = *flag;
        break;
    case 2: // DIG4
        if (line == 0) system_config.dig4_enable = *flag;
        else if (line == 1) system_config.dig4_fault_polarity = *flag;
        else system_config.dig4_relay_mode = *flag;
        break;
    }
    system_config_dirty = 1;  // Defer EEPROM write
}

//=============================================================================
// INIT NUMERIC EDITOR
//=============================================================================

// start_digit selects which digit the encoder acts on first.
// Unsigned: 0 = hundreds (100/click), 1 = tens (10/click), 2 = ones.
static void init_numeric_editor(int16_t value, uint8_t is_unsigned,
                                uint8_t start_digit)
{
    menu.in_edit_mode = 1;
    menu.edit_time_mode = 0;
    menu.edit_unsigned = is_unsigned;

    if (value < 0)
    {
        menu.sign_negative = 1;
        value = -value;
    }
    else
    {
        menu.sign_negative = 0;
    }

    menu.digit_100 = value / 100;
    menu.digit_10 = (value / 10) % 10;
    menu.digit_1 = value % 10;
    menu.edit_digit = start_digit;
    menu.original_value = (int16_t)(menu.sign_negative ? -value : value);
}

//=============================================================================
// BUTTON HANDLING
//=============================================================================

void menu_handle_button(uint8_t press_type)
{
    if (press_type == 2) // Long press = back to main screen
    {
        // If in name editor that was auto-opened, restore previous state
        if (menu.name_edit_mode > 0 && name_editor_auto_opened)
        {
            restore_saved_input_cfg();
        }
        menu_cancel_edit();
        current_menu = 255;
        lcd_clear();
        return;
    }

    // (log viewer removed)
    if (0)
    {
        current_menu = 4;
        rebuild_utility_menu();
        return;
    }

    // Name editor mode
    if (menu.name_edit_mode > 0)
    {
        uint8_t result = handle_name_button();
        if (result == 1)  // Done
        {
            uint8_t was_name_edit = (menu.name_edit_mode == 1);
            menu.name_edit_mode = 0;
            menu.in_edit_mode = 0;
            name_editor_auto_opened = 0;  // Clear auto-open flag on success

            // Save to config
            if (current_menu == 1)
            {
                // Field the editor was opened from - restored after the rebuild
                uint8_t edited_tag = input_field_tags[menu.current_line];

                if (was_name_edit)
                {
                    // Save name directly from buffer
                    strncpy(input_config[current_input].name, menu.name_buffer, 15);
                    input_config[current_input].name[15] = '\0';
                }
                else
                {
                    // Save units directly from buffer
                    strncpy(input_config[current_input].units, menu.units_buffer, 7);
                    input_config[current_input].units[7] = '\0';
                }
                input_config_dirty[current_input] = 1;  // Defer EEPROM write
                rebuild_input_menu_keep_field(edited_tag);  // Refresh, keep cursor
            }

            // Advance cursor to next item
            if (menu.current_line + 1 < menu.total_items)
            {
                menu.current_line++;
                if (menu.current_line >= menu.top_line + 3)
                    menu.top_line = menu.current_line - 2;
            }
        }
        else if (result == 2)  // Cancelled (Back at pos 0)
        {
            // Field the editor was opened from - restored after the rebuild
            uint8_t edited_tag = input_field_tags[menu.current_line];

            menu.name_edit_mode = 0;
            menu.in_edit_mode = 0;

            // If name editor was auto-opened after sensor change, restore previous state
            if (name_editor_auto_opened && current_menu == 1)
            {
                restore_saved_input_cfg();
            }

            // Rebuild menu with restored values
            if (current_menu == 1)
                rebuild_input_menu_keep_field(edited_tag);
        }
        // result == 0: still editing, do nothing
        return;
    }

    // Short press
    if (menu.in_edit_mode)
    {
        // Currently editing a field

        // Time field - advance digit or confirm
        if (menu.edit_time_mode == 4) // Whole-pair editing: HH:MM and MM:SS
        {
            if (menu.time_edit_digit == 0)
            {
                // First pair done - move to the second
                menu.time_edit_digit = 1;
            }
            else
            {
                // Second pair done - save and exit
                menu.in_edit_mode = 0;
                menu.edit_time_mode = 0;

                // Every menu with a time field saves here now, not just the
                // clock - the bypass timers and Rly Dwell use this editor too.
                if (current_menu == 1) save_input_field(menu.current_line, current_input);
                else if (current_menu == 4) save_utility_field(menu.current_line);
                else if (current_menu == 5) save_main_field(menu.current_line);

                // Update display value and return to menu
                menu_update_time_value();

                // Advance cursor to next item
                if (menu.current_line + 1 < menu.total_items)
                {
                    menu.current_line++;
                    if (menu.current_line >= menu.top_line + 3)
                        menu.top_line = menu.current_line - 2;
                }


            }
            return;
        }
        else if (menu.edit_time_mode > 0)
        {
            menu.time_edit_digit++;
            if (menu.time_edit_digit > 3)
            {
                // Confirmed - save and exit edit
                menu.in_edit_mode = 0;
                menu.edit_time_mode = 0;

                // Save to config and EEPROM
                if (current_menu == 1) save_input_field(menu.current_line, current_input);
                else if (current_menu == 4) save_utility_field(menu.current_line);
                else if (current_menu == 5) save_main_field(menu.current_line);

                // Advance cursor to next item
                if (menu.current_line + 1 < menu.total_items)
                {
                    menu.current_line++;
                    if (menu.current_line >= menu.top_line + 3)
                        menu.top_line = menu.current_line - 2;
                }


            }
            return;
        }

        // Whole-number edit - confirm
        if (menu.edit_whole_mode)
        {
            menu.in_edit_mode = 0;
            menu.edit_whole_mode = 0;

            // Save to config and EEPROM
            if (current_menu == 1) save_input_field(menu.current_line, current_input);
            else if (current_menu == 4) save_utility_field(menu.current_line);

            // Advance cursor to next item
            if (menu.current_line + 1 < menu.total_items)
            {
                menu.current_line++;
                if (menu.current_line >= menu.top_line + 3)
                    menu.top_line = menu.current_line - 2;
            }


            return;
        }

        // Option field - confirm
        uint8_t sensor = input_config[current_input].sensor_type;
        uint8_t flow = 0;

        if (is_option_field(menu.current_line, sensor, flow))
        {
            menu.in_edit_mode = 0;

            // Save to config and EEPROM
            if (current_menu == 1) save_input_field(menu.current_line, current_input);
            else if (current_menu == 3) save_clock_field(menu.current_line);
            else if (current_menu == 6) save_digital_field(menu.current_line);

            // Advance cursor to next item
            if (menu.current_line + 1 < menu.total_items)
            {
                menu.current_line++;
                // Scroll if needed (3 visible rows, line 1-3)
                if (menu.current_line >= menu.top_line + 3)
                    menu.top_line = menu.current_line - 2;
            }


            return;
        }

        // Numeric field - advance digit or confirm
        if (is_numeric_field(menu.current_line, sensor, flow))
        {
            uint8_t max_digit = menu.edit_unsigned ? 2 : 3;
            menu.edit_digit++;
            if (menu.edit_digit > max_digit)
            {
                // Confirmed - save and exit edit
                menu.in_edit_mode = 0;

                if (current_menu == 1) save_input_field(menu.current_line, current_input);
                else if (current_menu == 4) save_utility_field(menu.current_line);

                // Advance cursor to next item
                if (menu.current_line + 1 < menu.total_items)
                {
                    menu.current_line++;
                    if (menu.current_line >= menu.top_line + 3)
                        menu.top_line = menu.current_line - 2;
                }


            }
            return;
        }

        return;
    }

    // Not in edit mode - handle menu navigation
    switch (current_menu)
    {
    case 0: // OPTIONS menu
        switch (options_action[menu.current_line])
        {
        case OPT_ACT_CLOCK:
            current_menu = 5;
            rebuild_main_menu();
            break;
        case OPT_ACT_SETUP:
            current_menu = 2;
            menu.current_line = 0;
            menu.top_line = 0;
            menu.total_items = 6;
            break;
        case OPT_ACT_UTILITY:
            current_menu = 4;
            rebuild_utility_menu();
            break;
        case OPT_ACT_ABOUT:

            break;
        case OPT_ACT_EXIT:
            current_menu = 255;
            lcd_clear();
            break;
        }
        break;

    case 1: // INPUT menu — use field tags
    {
        uint8_t line = menu.current_line;
        uint8_t tag = input_field_tags[line];
        uint8_t sensor = input_config[current_input].sensor_type;
        uint8_t flow = 0;

        if (tag == FT_BACK)
        {
            current_menu = 2;
            menu.current_line = current_input;
            menu.top_line = current_input > 2 ? current_input - 2 : 0;
            menu.total_items = 6;
            break;
        }

        if (tag == FT_EXIT)
        {
            current_menu = 255;
            lcd_clear();
            break;
        }

        // Name field - enter name editor
        if (tag == FT_NAME)
        {
            init_name_editor(1, input_config[current_input].name);
            break;
        }

        // Custom units field - enter units editor
        if (tag == FT_CUSTOM_UNITS)
        {
            init_name_editor(2, input_config[current_input].units);
            break;
        }

        if (is_option_field(line, sensor, flow))
        {
            uint8_t *flag = get_option_edit_flag(line, sensor, flow);
            if (flag)
            {
                menu.in_edit_mode = 1;
                // Both must be cleared - a stale whole-number editor left
                // over from an aborted numeric edit would otherwise
                // intercept the encoder and freeze this field.
                menu.edit_time_mode = 0;
                menu.edit_whole_mode = 0;
            }
            break;
        }

        if (is_numeric_field(line, sensor, flow))
        {
            int16_t val = 0;
            switch (tag)
            {
            case FT_SCALE_4MA:  val = input_config[current_input].scale_4ma; break;
            case FT_SCALE_20MA: val = input_config[current_input].scale_20ma; break;
            case FT_HI_LIMIT:   val = input_config[current_input].high_setpoint; break;
            case FT_LO_LIMIT:   val = input_config[current_input].low_setpoint; break;
            case FT_PRI_HI_BP:  val = (int16_t)input_config[current_input].primary_high_bypass; break;
            case FT_SEC_HI_BP:  val = (int16_t)input_config[current_input].secondary_high_bypass; break;
            case FT_PRI_LO_BP:  val = (int16_t)input_config[current_input].primary_low_bypass; break;
            case FT_SEC_LO_BP:  val = (int16_t)input_config[current_input].secondary_low_bypass; break;
            }

            // All numeric fields use whole-number edit with acceleration
            menu.in_edit_mode = 1;
            menu.edit_time_mode = 0;
            menu.edit_whole_mode = 1;
            limit_beeped = 0;  // re-arm: entering a field already at
                               // its rail should still beep once
            menu.whole_edit_value = val;
            if (tag == FT_PRI_HI_BP || tag == FT_SEC_HI_BP ||
                tag == FT_PRI_LO_BP || tag == FT_SEC_LO_BP)
            {
                menu.whole_edit_min = 0;
                menu.whole_edit_max = 5999;  // 99:59
            }
            else if (tag == FT_HI_LIMIT || tag == FT_LO_LIMIT)
            {
                menu.whole_edit_min = 0;
                menu.whole_edit_max = 999;
            }
            else
            {
                menu.whole_edit_min = -999;
                menu.whole_edit_max = 999;
            }
            encoder_ms_timer = 65535; // Start slow

            break;
        }

        if (is_time_field(line, sensor, flow))
        {
            uint16_t secs = 0;
            switch (tag)
            {
            case FT_PRI_HI_BP:  secs = input_config[current_input].primary_high_bypass; break;
            case FT_SEC_HI_BP:  secs = input_config[current_input].secondary_high_bypass; break;
            case FT_PRI_LO_BP:  secs = input_config[current_input].primary_low_bypass; break;
            case FT_SEC_LO_BP:  secs = input_config[current_input].secondary_low_bypass; break;
            }
            // Mode 3 -> edit_time_mode 4: two FIELDS (minutes, then
            // seconds) rather than four digit positions. One button
            // press moves from the minutes pair to the seconds pair,
            // the next confirms.
            init_time_editor(secs, 3); // MM:SS, whole-pair editing
            menu.in_edit_mode = 1;

            break;
        }
        break;
    }

    case 2: // SETUP menu
        switch (menu.current_line)
        {
        case 0: case 1: case 2: // Input 1-3
            current_input = menu.current_line;
            current_menu = 1;
            rebuild_input_menu();
            break;
        case 3: // Clock
            current_menu = 3;
            rebuild_clock_menu();
            break;
        case 4: // Back
            current_menu = 0;
            menu.current_line = 0;
            menu.top_line = 0;
            rebuild_options_menu();
            menu.total_items = options_menu_count;
            break;
        case 5: // EXIT
            current_menu = 255;
            lcd_clear();
            break;
        }
        break;

    case 3: // CLOCK menu
    {
        uint8_t line = menu.current_line;
        if (line == 2) // Back
        {
            current_menu = 2;
            menu.current_line = 3; // Return to Clock position in setup
            menu.top_line = 1;
            menu.total_items = 6;
            break;
        }
        if (line == 3) // EXIT
        {
            current_menu = 255;
            lcd_clear();
            break;
        }
        if (is_option_field(line, 0, 0))
        {
            uint8_t *flag = get_option_edit_flag(line, 0, 0);
            if (flag)
            {
                menu.in_edit_mode = 1;
                menu.edit_time_mode = 0;

            }
        }
        break;
    }

    case 4: // UTILITY menu
    {
        uint8_t line = menu.current_line;
        if (line == 4) // About - re-show the splash for a few seconds
        {
            extern void show_about_splash(void);
            show_about_splash();
            break;
        }
        if (line == 5) // Back
        {
            current_menu = 0;
            menu.current_line = 2; // Return to Utility position
            menu.top_line = 0;
            rebuild_options_menu();
            menu.total_items = options_menu_count;
            break;
        }
        if (line == 6) // EXIT
        {
            current_menu = 255;
            lcd_clear();
            break;
        }

        uint8_t sensor = 0, flow = 0; // Dummy values for utility menu

        if (is_numeric_field(line, sensor, flow))
        {
            // Menu T/O and Pwr Detect are short durations with tight
            // ranges. Digit editing made them awkward - the first detent
            // moved the tens-of-minutes digit, so 02:00 jumped to 12:00.
            // Edit them as whole seconds instead, clamped to their range.
            if (line <= 3)
            {
                menu.in_edit_mode = 1;
                menu.edit_time_mode = 0;
                menu.edit_whole_mode = 1;
                limit_beeped = 0;  // re-arm: entering a field already at
                                   // its rail should still beep once
                if (line == 0)
                {
                    menu.whole_edit_value = (int16_t)system_config.menu_timeout;
                    menu.whole_edit_min = 10;   // 10 seconds
                    menu.whole_edit_max = 240;  // 4:00
                }
                else if (line == 1)
                {
                    menu.whole_edit_value = (int16_t)system_config.power_fail_delay;
                    menu.whole_edit_min = 2;
                    menu.whole_edit_max = 30;
                }
                else if (line == 2)
                {
                    // Brightness is TEN STEPS, 0-9, mapped to 10-100% by
                    // disp_set_brightness(). It was on the 3-digit editor,
                    // which let it reach 999 - a number that means nothing
                    // here and gets rejected by the display board.
                    menu.whole_edit_value = (int16_t)system_config.brightness;
                    menu.whole_edit_min = 1;   // shown as 1-10, not 0-9:
                    menu.whole_edit_max = 10;  // "1 of 10" reads better than
                                               // "0 of 9" to a non-technical
                                               // operator, and 0 reads as off
                }
                else
                {
                    // Rly Dwell: hold-open after the run signal drops.
                    menu.whole_edit_value = (int16_t)system_config.relay_pulse_time;
                    menu.whole_edit_min = 1;
                    menu.whole_edit_max = 120;  // 02:00
                }
                // Clamp the STORED value into range on entry. Without this a
                // value saved under an older range (or a corrupt one) is shown
                // as-is and can be confirmed straight back out of range - the
                // rotate clamps only apply once the encoder is turned.
                if (menu.whole_edit_value < menu.whole_edit_min)
                    menu.whole_edit_value = menu.whole_edit_min;
                if (menu.whole_edit_value > menu.whole_edit_max)
                    menu.whole_edit_value = menu.whole_edit_max;
                menu_update_edit_value();  // show the clamped value at once
                encoder_ms_timer = 65535;  // start un-accelerated
                break;
            }

            // No 3-digit numeric fields remain in UTILITY - all three edit
            // as clamped whole numbers above.
            break;
        }

        if (is_time_field(line, sensor, flow))
        {
            uint16_t secs = 0;
            switch (line)
            {
            case 3: secs = system_config.relay_pulse_time; break;
            }
            // Mode 3 -> edit_time_mode 4: two FIELDS (minutes, then
            // seconds) rather than four digit positions. One button
            // press moves from the minutes pair to the seconds pair,
            // the next confirms.
            init_time_editor(secs, 3); // MM:SS, whole-pair editing
            menu.in_edit_mode = 1;

            break;
        }
        break;
    }

    case 5: // MAIN menu
    {
        uint8_t line = menu.current_line;
        if (line == 1) // Back
        {
            current_menu = 0;
            menu.current_line = 0;
            menu.top_line = 0;
            rebuild_options_menu();
            menu.total_items = options_menu_count;
            break;
        }
        if (line == 2) // EXIT
        {
            current_menu = 255;
            lcd_clear();
            break;
        }
        if (line == 0) // Run Time (HH:MM) - whole number edit
        {
            menu.edit_time_mode = 4; // Whole-number HH:MM mode
            menu.time_edit_digit = 0; // 0=editing HH, 1=editing MM
            menu.time_xx = system_config.runtime_hours;
            menu.time_yy = system_config.runtime_minutes;
            if (menu.time_xx > 99) menu.time_xx = 99;
            if (menu.time_yy > 59) menu.time_yy = 59;
            menu.in_edit_mode = 1;

        }
        break;
    }

    case 6: // DIGITAL menu
    {
        uint8_t line = menu.current_line;
        if (line == 3) // Back
        {
            current_menu = 2;
            menu.current_line = current_digital_input + 3; // Return to this digital input in setup
            menu.top_line = menu.current_line > 2 ? menu.current_line - 2 : 0;
            menu.total_items = 6;
            break;
        }
        if (line == 4) // EXIT
        {
            current_menu = 255;
            lcd_clear();
            break;
        }
        if (is_option_field(line, 0, 0))
        {
            // Load current value into edit flag
            uint8_t val = 0;
            switch (current_digital_input)
            {
            case 0:
                if (line == 0) val = system_config.dig2_enable;
                else if (line == 1) val = system_config.dig2_fault_polarity;
                else val = system_config.dig2_relay_mode;
                break;
            case 1:
                if (line == 0) val = system_config.dig3_enable;
                else if (line == 1) val = system_config.dig3_fault_polarity;
                else val = system_config.dig3_relay_mode;
                break;
            case 2:
                if (line == 0) val = system_config.dig4_enable;
                else if (line == 1) val = system_config.dig4_fault_polarity;
                else val = system_config.dig4_relay_mode;
                break;
            }

            uint8_t *flag = get_option_edit_flag(line, 0, 0);
            if (flag)
            {
                *flag = val;
                menu.in_edit_mode = 1;
                menu.edit_time_mode = 0;

            }
        }
        break;
    }
    }
}

//=============================================================================
// LCD HELPER FUNCTIONS
//=============================================================================

void lcd_print_at(uint8_t row, uint8_t col, const char *str)
{
    lcd_set_cursor(row, col);
    lcd_print(str);
}

void lcd_clear_line(uint8_t row)
{
    lcd_print_at(row, 0, "                    ");
}
