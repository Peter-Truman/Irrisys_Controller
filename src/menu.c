/**
 * IRRISYS - Menu System with Context-Aware Field Detection
 * Refactored for flexible option field handling across all sensor types
 * Version: 1.0.0 - Sonnet 4.5 Refactor
 */

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
#include "../include/eeprom.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Menu state - make it accessible
menu_state_t menu;
static char original_value[10]; // Store original value for cancellation

// ALL option field edit flags
uint8_t enable_edit_flag = 1;     // 1=Enabled, 0=Disabled
uint8_t sensor_edit_flag = 0;     // 0=Pressure, 1=Temp, 2=Flow
uint8_t flow_type_edit_flag = 1;  // 0=Analog, 1=Digital
uint8_t no_flow_edit_flag = 0;    // 0=Low, 1=High
uint8_t flow_units_edit_flag = 0; // 0=%, 1=LpS
uint8_t display_edit_flag = 1;    // 0=Hide, 1=Show
uint8_t relay_high_edit_flag = 0; // 0=Latch, 1=Pulse, 2=Not Used
uint8_t relay_plp_edit_flag = 0;  // 0=Latch, 1=Pulse, 2=Not Used
uint8_t relay_slp_edit_flag = 1;  // 0=Latch, 1=Pulse, 2=Not Used
uint8_t relay_low_edit_flag = 0;  // 0=Latch, 1=Pulse, 2=Not Used

uint8_t current_menu = 0;  // 0=OPTIONS, 1=INPUT, 2=SETUP
uint8_t current_input = 0; // Which input (0-2) is being configured

// Define options for each editable item type
typedef struct
{
    uint8_t option_id;      // Unique ID for this option type
    uint8_t option_count;   // How many options this item has
    const char *options[5]; // Array of option strings (max 5 options)
} item_options_t;

// Option type IDs
#define OPT_ENABLE 0
#define OPT_SENSOR 1
#define OPT_FLOW_TYPE 2
#define OPT_NO_FLOW 3
#define OPT_FLOW_UNITS 4
#define OPT_DISPLAY 5
#define OPT_RELAY_MODE 6 // Used for all relay fields

// Expanded option definitions
const item_options_t menu_item_options[] = {
    {OPT_ENABLE, 2, {"Disabled", "Enabled", "", "", ""}},
    {OPT_SENSOR, 3, {"Pressure", "Temp", "Flow", "", ""}},
    {OPT_FLOW_TYPE, 2, {"Analog", "Digital", "", "", ""}},
    {OPT_NO_FLOW, 2, {"Low", "High", "", "", ""}},
    {OPT_FLOW_UNITS, 2, {"%", "LpS", "", "", ""}},
    {OPT_DISPLAY, 2, {"Hide", "Show", "", "", ""}},
    {OPT_RELAY_MODE, 3, {"Latch", "Pulse", "Not Used", "", ""}},
};

#define NUM_OPTION_TYPES 7

// Test menu items for OPTIONS menu
const char *options_menu[] = {
    "Main Menu",
    "Setup Menu",
    "Utility Menu",
    "About",
    "Exit"};

// Buffers for editable values - must be modifiable
static char value_enable[10] = "Enabled";
static char value_sensor[12] = "Pressure";
static char value_scale4[10] = "000";
static char value_scale20[10] = "100";
static char value_highbp[10] = "05:00";
static char value_plpbp[10] = "00:30";
static char value_slpbp[10] = "00:05";
static char value_rlyhigh[10] = "Latch";
static char value_rlyplp[10] = "Latch";
static char value_rlyslp[10] = "Pulse";
static char value_rlylow[10] = "Latch";
static char value_display[10] = "Show";
static char value_back[5] = "Back";

// Additional value buffers for dynamic menu items
static char value_hi_pressure[10] = "150";
static char value_low_pressure[10] = "50";
static char value_high_temp[10] = "85";
static char value_flow_type[10] = "Digital";
static char value_flow_units[10] = "%";
static char value_no_flow[10] = "Low";
static char value_low_flow[10] = "30";
static char value_no_flow_bp[10] = "00:30";
static char value_low_flow_bp[10] = "00:30";
static char value_high_tbp[10] = "01:00";

// Dynamic input menu - will be populated based on sensor type
menu_item_t input_menu[15]; // Max 15 items to cover all cases

// Menu template for PRESSURE sensor
const menu_item_t pressure_menu_template[] = {
    {"Enable", NULL, 1},       // 0
    {"Sensor", NULL, 1},       // 1
    {"Scale 4mA", NULL, 1},    // 2
    {"Scale 20mA", NULL, 1},   // 3
    {"Hi Pressure", NULL, 1},  // 4
    {"High PBP", NULL, 1},     // 5
    {"Low Pressure", NULL, 1}, // 6
    {"PLPBP", NULL, 1},        // 7
    {"SLPBP", NULL, 1},        // 8
    {"Rly High", NULL, 1},     // 9
    {"Rly PLP", NULL, 1},      // 10
    {"Rly SLP", NULL, 1},      // 11
    {"Display", NULL, 1},      // 12
    {"Back", NULL, 0}          // 13
};

// Menu template for TEMPERATURE sensor
const menu_item_t temp_menu_template[] = {
    {"Enable", NULL, 1},     // 0
    {"Sensor", NULL, 1},     // 1
    {"Scale 4mA", NULL, 1},  // 2
    {"Scale 20mA", NULL, 1}, // 3
    {"High Temp", NULL, 1},  // 4
    {"High TBP", NULL, 1},   // 5
    {"Rly High", NULL, 1},   // 6
    {"Display", NULL, 1},    // 7
    {"Back", NULL, 0}        // 8
};

// Menu template for FLOW sensor - Digital
const menu_item_t flow_digital_template[] = {
    {"Enable", NULL, 1},     // 0
    {"Sensor", NULL, 1},     // 1
    {"Type", NULL, 1},       // 2
    {"No Flow", NULL, 1},    // 3
    {"No Flow BP", NULL, 1}, // 4
    {"Rly Low", NULL, 1},    // 5
    {"Display", NULL, 1},    // 6
    {"Back", NULL, 0}        // 7
};

// Menu template for FLOW sensor - Analog
const menu_item_t flow_analog_template[] = {
    {"Enable", NULL, 1},      // 0
    {"Sensor", NULL, 1},      // 1
    {"Type", NULL, 1},        // 2
    {"Units", NULL, 1},       // 3
    {"Scale 4mA", NULL, 1},   // 4
    {"Scale 20mA", NULL, 1},  // 5
    {"Low Flow", NULL, 1},    // 6
    {"Low Flow BP", NULL, 1}, // 7
    {"Rly Low", NULL, 1},     // 8
    {"Display", NULL, 1},     // 9
    {"Back", NULL, 0}         // 10
};

// Function declarations from header
extern void lcd_set_cursor(uint8_t row, uint8_t col);
extern void lcd_print(const char *str);
extern void beep(uint16_t duration_ms);
extern void save_current_config(void);
extern void uart_println(const char *str);
extern void lcd_clear(void);
void handle_time_rotation(int8_t direction);

//=============================================================================
// CONTEXT-AWARE FIELD DETECTION FUNCTIONS
//=============================================================================

/**
 * Determine if a field is numeric based on context
 * @param line Menu line index
 * @param sensor_type 0=Pressure, 1=Temp, 2=Flow
 * @param flow_type 0=Analog, 1=Digital (only relevant if sensor_type==2)
 */
uint8_t is_numeric_field(uint8_t line, uint8_t sensor_type, uint8_t flow_type)
{
    if (sensor_type == 0) // Pressure
    {
        // Scale 4mA, Scale 20mA, Hi Pressure, Low Pressure
        return (line == 2 || line == 3 || line == 4 || line == 6);
    }
    else if (sensor_type == 1) // Temperature
    {
        // Scale 4mA, Scale 20mA, High Temp
        return (line == 2 || line == 3 || line == 4);
    }
    else if (sensor_type == 2) // Flow
    {
        if (flow_type == 0) // Analog Flow
        {
            // Scale 4mA, Scale 20mA, Low Flow
            return (line == 4 || line == 5 || line == 6);
        }
        else // Digital Flow
        {
            // No numeric fields in digital flow
            return 0;
        }
    }

    return 0; // Default: not numeric
}

/**
 * Determine if a field is a time field based on context
 */
uint8_t is_time_field(uint8_t line, uint8_t sensor_type, uint8_t flow_type)
{
    if (sensor_type == 0) // Pressure
    {
        // High PBP, PLPBP, SLPBP
        return (line == 5 || line == 7 || line == 8);
    }
    else if (sensor_type == 1) // Temperature
    {
        // High TBP
        return (line == 5);
    }
    else if (sensor_type == 2) // Flow
    {
        if (flow_type == 0) // Analog Flow
        {
            // Low Flow BP
            return (line == 7);
        }
        else // Digital Flow
        {
            // No Flow BP
            return (line == 4);
        }
    }

    return 0; // Default: not a time field
}

/**
 * Determine if a field is an option field based on context
 */
uint8_t is_option_field(uint8_t line, uint8_t sensor_type, uint8_t flow_type)
{
    // Enable and Sensor are ALWAYS option fields at positions 0 and 1
    if (line == 0 || line == 1)
        return 1;

    if (sensor_type == 0) // Pressure
    {
        // Rly High, Rly PLP, Rly SLP, Display
        return (line == 9 || line == 10 || line == 11 || line == 12);
    }
    else if (sensor_type == 1) // Temperature
    {
        // Rly High, Display
        return (line == 6 || line == 7);
    }
    else if (sensor_type == 2) // Flow
    {
        if (flow_type == 0) // Analog Flow
        {
            // Type, Units, Rly Low, Display
            return (line == 2 || line == 3 || line == 8 || line == 9);
        }
        else // Digital Flow
        {
            // Type, No Flow, Rly Low, Display
            return (line == 2 || line == 3 || line == 5 || line == 6);
        }
    }

    return 0; // Default: not an option field
}

/**
 * Get the appropriate edit flag pointer for a given field
 * Returns NULL if the field is not an option field
 */
uint8_t *get_option_edit_flag(uint8_t line, uint8_t sensor_type, uint8_t flow_type)
{
    // Universal fields
    if (line == 0)
        return &enable_edit_flag;
    if (line == 1)
        return &sensor_edit_flag;

    // Pressure-specific
    if (sensor_type == 0)
    {
        if (line == 9)
            return &relay_high_edit_flag;
        if (line == 10)
            return &relay_plp_edit_flag;
        if (line == 11)
            return &relay_slp_edit_flag;
        if (line == 12)
            return &display_edit_flag;
    }
    // Temperature-specific
    else if (sensor_type == 1)
    {
        if (line == 6)
            return &relay_high_edit_flag;
        if (line == 7)
            return &display_edit_flag;
    }
    // Flow-specific
    else if (sensor_type == 2)
    {
        if (line == 2)
            return &flow_type_edit_flag;

        if (flow_type == 0) // Analog
        {
            if (line == 3)
                return &flow_units_edit_flag;
            if (line == 8)
                return &relay_low_edit_flag;
            if (line == 9)
                return &display_edit_flag;
        }
        else // Digital
        {
            if (line == 3)
                return &no_flow_edit_flag;
            if (line == 5)
                return &relay_low_edit_flag;
            if (line == 6)
                return &display_edit_flag;
        }
    }

    return NULL; // Not an option field
}

/**
 * Get the option definition for a given field
 * Returns NULL if not found
 */
const item_options_t *get_item_options_for_field(uint8_t line, uint8_t sensor_type, uint8_t flow_type)
{
    // Universal fields
    if (line == 0)
        return &menu_item_options[OPT_ENABLE];
    if (line == 1)
        return &menu_item_options[OPT_SENSOR];

    // Pressure-specific
    if (sensor_type == 0)
    {
        if (line == 9 || line == 10 || line == 11)
            return &menu_item_options[OPT_RELAY_MODE];
        if (line == 12)
            return &menu_item_options[OPT_DISPLAY];
    }
    // Temperature-specific
    else if (sensor_type == 1)
    {
        if (line == 6)
            return &menu_item_options[OPT_RELAY_MODE];
        if (line == 7)
            return &menu_item_options[OPT_DISPLAY];
    }
    // Flow-specific
    else if (sensor_type == 2)
    {
        if (line == 2)
            return &menu_item_options[OPT_FLOW_TYPE];

        if (flow_type == 0) // Analog
        {
            if (line == 3)
                return &menu_item_options[OPT_FLOW_UNITS];
            if (line == 8)
                return &menu_item_options[OPT_RELAY_MODE];
            if (line == 9)
                return &menu_item_options[OPT_DISPLAY];
        }
        else // Digital
        {
            if (line == 3)
                return &menu_item_options[OPT_NO_FLOW];
            if (line == 5)
                return &menu_item_options[OPT_RELAY_MODE];
            if (line == 6)
                return &menu_item_options[OPT_DISPLAY];
        }
    }

    return NULL;
}

//=============================================================================
// TIME EDITING FUNCTIONS
//=============================================================================

/**
 * Initialize time editor for HH:MM or MM:SS editing
 */
void init_time_editor(uint16_t value_seconds, uint8_t mode)
{
    // Mode: 0=MM:SS, 1=HH:MM, 2=HH:MM with 24hr limit
    menu.edit_time_mode = mode;
    menu.time_original = value_seconds;

    // Convert seconds to XX:YY based on mode
    if (mode == 0) // MM:SS
    {
        menu.time_xx = value_seconds / 60; // Minutes (0-99)
        menu.time_yy = value_seconds % 60; // Seconds (0-59)
    }
    else // HH:MM
    {
        menu.time_xx = value_seconds / 3600;        // Hours (0-99 or 0-23)
        menu.time_yy = (value_seconds % 3600) / 60; // Minutes (0-59)
    }

    // Start editing at first digit (tens of XX)
    menu.time_edit_digit = 0;

    // DEBUG: Print conversion results
    char buf[60];
    sprintf(buf, "Time init: secs=%d -> XX=%d, YY=%d",
            value_seconds, menu.time_xx, menu.time_yy);
    uart_println(buf);
}

/**
 * Handle rotation for time editing
 */
void handle_time_rotation(int8_t direction)
{
    uart_println("handle_time_rotation called!");

    char buf[50];
    sprintf(buf, "Rotate start: XX=%d, YY=%d, dir=%d, digit=%d",
            menu.time_xx, menu.time_yy, direction, menu.time_edit_digit);
    uart_println(buf);

    if (menu.time_edit_digit == 0) // Editing XX field
    {
        if (direction > 0)
        {
            menu.time_xx++;
            if (menu.edit_time_mode == 2 && menu.time_xx > 23) // 24hr limit
                menu.time_xx = 0;
            else if (menu.time_xx > 99)
                menu.time_xx = 0;
        }
        else
        {
            if (menu.time_xx == 0)
            {
                menu.time_xx = (menu.edit_time_mode == 2) ? 23 : 99;
            }
            else
            {
                menu.time_xx--;
            }
        }
    }
    else if (menu.time_edit_digit == 1) // Editing YY field
    {
        if (direction > 0)
        {
            menu.time_yy++;
            if (menu.time_yy > 59)
                menu.time_yy = 0;
        }
        else
        {
            if (menu.time_yy == 0)
                menu.time_yy = 59;
            else
                menu.time_yy--;
        }
    }

    sprintf(buf, "Rotate end: XX=%d, YY=%d", menu.time_xx, menu.time_yy);
    uart_println(buf);
}

/**
 * Update time value display during editing
 */
void menu_update_time_value(void)
{
    // Only update if in INPUT menu and edit mode
    if (current_menu != 1 || !menu.in_edit_mode)
        return;

    // Find which line on screen
    uint8_t screen_line = menu.current_line - menu.top_line;
    if (screen_line >= 3)
        return; // Not visible

    uint8_t item_idx = menu.current_line;

    // Get current sensor type and flow type
    extern input_config_t input_config[3];
    uint8_t sensor_type = input_config[current_input].sensor_type;
    uint8_t flow_type = input_config[current_input].flow_type;

    // Only handle time fields
    if (!is_time_field(item_idx, sensor_type, flow_type))
        return;

    // Build display string XX:YY with field flashing
    char value_buf[6];

    // DEBUG: Show what we're building
    char debug_before[50];
    sprintf(debug_before, "Building display: digit=%d, blink=%d, XX=%d, YY=%d",
            menu.time_edit_digit, menu.blink_state, menu.time_xx, menu.time_yy);
    uart_println(debug_before);

    // Edit position 0: flash both XX digits together
    if (menu.time_edit_digit == 0 && !menu.blink_state)
    {
        value_buf[0] = ' ';
        value_buf[1] = ' ';
    }
    else
    {
        value_buf[0] = '0' + menu.time_xx / 10;
        value_buf[1] = '0' + menu.time_xx % 10;
    }

    // Colon always visible
    value_buf[2] = ':';

    // Edit position 1: flash both YY digits together
    if (menu.time_edit_digit == 1 && !menu.blink_state)
    {
        value_buf[3] = ' ';
        value_buf[4] = ' ';
    }
    else
    {
        value_buf[3] = '0' + menu.time_yy / 10;
        value_buf[4] = '0' + menu.time_yy % 10;
    }

    value_buf[5] = '\0';

    // DEBUG: Show final string
    char debug_after[50];
    sprintf(debug_after, "Final display string: (%s)", value_buf);
    uart_println(debug_after);

    // Display at correct position
    uint8_t start_col = 13;

    lcd_set_cursor(screen_line + 1, start_col);
    lcd_print("       "); // Clear area

    lcd_set_cursor(screen_line + 1, start_col);
    lcd_print("(");
    lcd_print(value_buf);
    lcd_print(")");
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
    lcd_set_cursor(row, 0);
    lcd_print("                    "); // 20 spaces
}

//=============================================================================
// MENU INITIALIZATION AND REBUILDING
//=============================================================================

void menu_init(void)
{
    menu.current_line = 0;
    menu.top_line = 0;
    menu.total_items = 5; // OPTIONS menu items
    menu.in_edit_mode = 0;
    menu.blink_state = 0;
    menu.blink_timer = 0;
}

/**
 * Rebuild input menu based on sensor type - COMPLETE IMPLEMENTATION
 */
void rebuild_input_menu(uint8_t input_num)
{
    extern input_config_t input_config[3];
    current_input = input_num;

    // Get sensor type and flow type from EEPROM config
    uint8_t sensor = input_config[input_num].sensor_type;
    uint8_t flow_type_val = input_config[input_num].flow_type;

    // Convert EEPROM values to strings for display
    sprintf(value_enable, "%s", input_config[input_num].enable ? "Enabled" : "Disabled");

    if (sensor == 0) // Pressure
    {
        strcpy(value_sensor, "Pressure");
        sprintf(value_scale4, "%+04d", input_config[input_num].scale_4ma);
        sprintf(value_scale20, "%+04d", input_config[input_num].scale_20ma);
        sprintf(value_hi_pressure, "%03d", input_config[input_num].high_setpoint);
        sprintf(value_highbp, "%02d:%02d",
                input_config[input_num].high_bypass_time / 60,
                input_config[input_num].high_bypass_time % 60);
        sprintf(value_low_pressure, "%03d", 50); // TODO: Add to EEPROM structure
        sprintf(value_plpbp, "%02d:%02d",
                input_config[input_num].plp_bypass_time / 60,
                input_config[input_num].plp_bypass_time % 60);
        sprintf(value_slpbp, "%02d:%02d",
                input_config[input_num].slp_bypass_time / 60,
                input_config[input_num].slp_bypass_time % 60);

        strcpy(value_rlyhigh, input_config[input_num].relay_high_mode == 0 ? "Latch" : input_config[input_num].relay_high_mode == 1 ? "Pulse"
                                                                                                                                    : "Not Used");
        strcpy(value_rlyplp, input_config[input_num].relay_plp_mode == 0 ? "Latch" : input_config[input_num].relay_plp_mode == 1 ? "Pulse"
                                                                                                                                 : "Not Used");
        strcpy(value_rlyslp, input_config[input_num].relay_slp_mode == 0 ? "Latch" : input_config[input_num].relay_slp_mode == 1 ? "Pulse"
                                                                                                                                 : "Not Used");
        strcpy(value_display, input_config[input_num].display_enabled ? "Show" : "Hide");

        // Copy template
        memcpy(input_menu, pressure_menu_template, sizeof(pressure_menu_template));

        // Assign value pointers for pressure
        input_menu[0].value = value_enable;
        input_menu[1].value = value_sensor;
        input_menu[2].value = value_scale4;
        input_menu[3].value = value_scale20;
        input_menu[4].value = value_hi_pressure;
        input_menu[5].value = value_highbp;
        input_menu[6].value = value_low_pressure;
        input_menu[7].value = value_plpbp;
        input_menu[8].value = value_slpbp;
        input_menu[9].value = value_rlyhigh;
        input_menu[10].value = value_rlyplp;
        input_menu[11].value = value_rlyslp;
        input_menu[12].value = value_display;
        input_menu[13].value = value_back;

        menu.total_items = 14;
    }
    else if (sensor == 1) // Temperature
    {
        strcpy(value_sensor, "Temp");
        sprintf(value_scale4, "%+04d", input_config[input_num].scale_4ma);
        sprintf(value_scale20, "%+04d", input_config[input_num].scale_20ma);
        sprintf(value_high_temp, "%d", input_config[input_num].high_setpoint);
        sprintf(value_high_tbp, "%02d:%02d",
                input_config[input_num].high_bypass_time / 60,
                input_config[input_num].high_bypass_time % 60);
        strcpy(value_rlyhigh, input_config[input_num].relay_high_mode == 0 ? "Latch" : input_config[input_num].relay_high_mode == 1 ? "Pulse"
                                                                                                                                    : "Not Used");
        strcpy(value_display, input_config[input_num].display_enabled ? "Show" : "Hide");

        // Copy template
        memcpy(input_menu, temp_menu_template, sizeof(temp_menu_template));

        // Assign value pointers for temperature
        input_menu[0].value = value_enable;
        input_menu[1].value = value_sensor;
        input_menu[2].value = value_scale4;
        input_menu[3].value = value_scale20;
        input_menu[4].value = value_high_temp;
        input_menu[5].value = value_high_tbp;
        input_menu[6].value = value_rlyhigh;
        input_menu[7].value = value_display;
        input_menu[8].value = value_back;

        menu.total_items = 9;
    }
    else if (sensor == 2) // Flow - NOW IMPLEMENTED!
    {
        strcpy(value_sensor, "Flow");
        strcpy(value_flow_type, flow_type_val == 0 ? "Analog" : "Digital");
        strcpy(value_display, input_config[input_num].display_enabled ? "Show" : "Hide");
        strcpy(value_rlylow, input_config[input_num].relay_low_mode == 0 ? "Latch" : input_config[input_num].relay_low_mode == 1 ? "Pulse"
                                                                                                                                 : "Not Used");

        if (flow_type_val == 0) // Analog Flow
        {
            strcpy(value_flow_units, input_config[input_num].flow_units == 0 ? "%" : "LpS");
            sprintf(value_scale4, "%+04d", input_config[input_num].scale_4ma);
            sprintf(value_scale20, "%+04d", input_config[input_num].scale_20ma);
            sprintf(value_low_flow, "%03d", input_config[input_num].low_flow_setpoint);
            sprintf(value_low_flow_bp, "%02d:%02d",
                    input_config[input_num].low_flow_bypass / 60,
                    input_config[input_num].low_flow_bypass % 60);

            // Copy template
            memcpy(input_menu, flow_analog_template, sizeof(flow_analog_template));

            // Assign value pointers
            input_menu[0].value = value_enable;
            input_menu[1].value = value_sensor;
            input_menu[2].value = value_flow_type;
            input_menu[3].value = value_flow_units;
            input_menu[4].value = value_scale4;
            input_menu[5].value = value_scale20;
            input_menu[6].value = value_low_flow;
            input_menu[7].value = value_low_flow_bp;
            input_menu[8].value = value_rlylow;
            input_menu[9].value = value_display;
            input_menu[10].value = value_back;

            menu.total_items = 11;
        }
        else // Digital Flow
        {
            strcpy(value_no_flow, "Low"); // TODO: Load from EEPROM when field added
            sprintf(value_no_flow_bp, "%02d:%02d",
                    input_config[input_num].low_flow_bypass / 60,
                    input_config[input_num].low_flow_bypass % 60);

            // Copy template
            memcpy(input_menu, flow_digital_template, sizeof(flow_digital_template));

            // Assign value pointers
            input_menu[0].value = value_enable;
            input_menu[1].value = value_sensor;
            input_menu[2].value = value_flow_type;
            input_menu[3].value = value_no_flow;
            input_menu[4].value = value_no_flow_bp;
            input_menu[5].value = value_rlylow;
            input_menu[6].value = value_display;
            input_menu[7].value = value_back;

            menu.total_items = 8;
        }
    }

    // DEBUG: Verify total items
    char buf[50];
    sprintf(buf, "Menu rebuilt: sensor=%d, flow_type=%d, items=%d",
            sensor, flow_type_val, menu.total_items);
    uart_println(buf);
}

//=============================================================================
// NUMERIC EDITING FUNCTIONS
//=============================================================================

void init_numeric_editor(int16_t value)
{
    // Get current context
    extern input_config_t input_config[3];
    uint8_t sensor_type = input_config[current_input].sensor_type;
    uint8_t flow_type = input_config[current_input].flow_type;

    // Determine if field is unsigned
    menu.edit_unsigned = 0; // Default to signed

    if (sensor_type == 0) // Pressure
    {
        // Hi Pressure and Low Pressure are unsigned
        if (menu.current_line == 4 || menu.current_line == 6)
            menu.edit_unsigned = 1;
    }
    else if (sensor_type == 1) // Temperature
    {
        // High Temp is unsigned
        if (menu.current_line == 4)
            menu.edit_unsigned = 1;
    }
    else if (sensor_type == 2 && flow_type == 0) // Analog Flow
    {
        // Low Flow is unsigned
        if (menu.current_line == 6)
            menu.edit_unsigned = 1;
    }

    // Store original value
    menu.original_value = value;

    // For unsigned, ensure positive
    if (menu.edit_unsigned && value < 0)
        value = 0;

    // Extract sign (always + for unsigned)
    menu.sign_negative = (menu.edit_unsigned) ? 0 : (value < 0 ? 1 : 0);

    // Extract digits from absolute value
    uint16_t abs_val = (value < 0) ? -value : value;
    menu.digit_100 = (abs_val / 100) % 10;
    menu.digit_10 = (abs_val / 10) % 10;
    menu.digit_1 = abs_val % 10;

    // Start position
    menu.edit_digit = menu.edit_unsigned ? 1 : 0; // Skip sign for unsigned
}

int16_t get_current_numeric_value(void)
{
    int16_t value = menu.digit_100 * 100 + menu.digit_10 * 10 + menu.digit_1;
    if (menu.sign_negative)
        value = -value;
    return value;
}

void handle_numeric_rotation(int8_t direction)
{
    uart_println("handle_numeric_rotation called");

    char buf[50];
    sprintf(buf, "edit_digit: %d, unsigned: %d", menu.edit_digit, menu.edit_unsigned);
    uart_println(buf);

    // Skip sign position for unsigned fields
    if (menu.edit_unsigned && menu.edit_digit == 0)
    {
        menu.edit_digit = 1; // Jump to hundreds
    }

    switch (menu.edit_digit)
    {
    case 0: // Sign (only for signed fields)
        if (!menu.edit_unsigned && direction != 0)
        {
            menu.sign_negative = !menu.sign_negative;
        }
        break;

    case 1: // Hundreds (0-5) with rollover
        if (direction > 0)
        {
            menu.digit_100++;
            if (menu.digit_100 > 5)
                menu.digit_100 = 0;
        }
        else if (direction < 0)
        {
            if (menu.digit_100 == 0)
                menu.digit_100 = 5;
            else
                menu.digit_100--;
        }
        break;

    case 2: // Tens (0-9) with rollover, limited if hundreds = 5
    {
        uint8_t max_tens = (menu.digit_100 == 5) ? 0 : 9;
        if (direction > 0)
        {
            if (max_tens == 0)
                break;
            menu.digit_10++;
            if (menu.digit_10 > max_tens)
                menu.digit_10 = 0;
        }
        else if (direction < 0)
        {
            if (max_tens == 0)
                break;
            if (menu.digit_10 == 0)
                menu.digit_10 = max_tens;
            else
                menu.digit_10--;
        }
        break;
    }

    case 3: // Units (0-9) with rollover, limited if hundreds = 5
    {
        uint8_t max_units = (menu.digit_100 == 5) ? 0 : 9;
        if (direction > 0)
        {
            if (max_units == 0)
                break;
            menu.digit_1++;
            if (menu.digit_1 > max_units)
                menu.digit_1 = 0;
        }
        else if (direction < 0)
        {
            if (max_units == 0)
                break;
            if (menu.digit_1 == 0)
                menu.digit_1 = max_units;
            else
                menu.digit_1--;
        }
        break;
    }
    }
}

void menu_update_edit_value(void)
{
    // Get current context
    extern input_config_t input_config[3];
    uint8_t sensor_type = input_config[current_input].sensor_type;
    uint8_t flow_type = input_config[current_input].flow_type;

    // Only update if we're in edit mode and in INPUT menu
    if (!menu.in_edit_mode || current_menu != 1)
        return;

    // Find which line on screen (0, 1, or 2)
    uint8_t screen_line = menu.current_line - menu.top_line;
    if (screen_line >= 3)
        return; // Not visible

    // Check if this is a numeric field
    if (!is_numeric_field(menu.current_line, sensor_type, flow_type))
        return;

    // Build display string based on sign and digits
    char value_buf[10];
    if (menu.edit_unsigned)
    {
        sprintf(value_buf, "%d%d%d", menu.digit_100, menu.digit_10, menu.digit_1);
    }
    else
    {
        sprintf(value_buf, "%c%d%d%d",
                menu.sign_negative ? '-' : '+',
                menu.digit_100, menu.digit_10, menu.digit_1);
    }

    // Apply blinking to current digit
    char display_buf[10];
    strcpy(display_buf, value_buf);

    if (!menu.blink_state)
    {
        uint8_t blink_pos;
        if (menu.edit_unsigned)
            blink_pos = menu.edit_digit - 1;
        else
            blink_pos = menu.edit_digit;

        if (blink_pos < strlen(display_buf))
            display_buf[blink_pos] = ' ';
    }

    // Display at correct position
    uint8_t start_col = menu.edit_unsigned ? 14 : 13;
    lcd_set_cursor(screen_line + 1, start_col);
    lcd_print("      "); // Clear area

    lcd_set_cursor(screen_line + 1, start_col);
    lcd_print("(");
    lcd_print(display_buf);
    lcd_print(")");
}

/**
 * Update numeric value display during editing - specialized for numeric fields
 * Called from main.c during encoder rotation and blink updates
 */
void menu_update_numeric_value(void)
{
    // Only update if we're in INPUT menu and edit mode
    if (current_menu != 1 || !menu.in_edit_mode)
        return;

    // Find which line on screen
    uint8_t screen_line = menu.current_line - menu.top_line;
    if (screen_line >= 3)
        return; // Not visible

    // Get current context
    extern input_config_t input_config[3];
    uint8_t sensor_type = input_config[current_input].sensor_type;
    uint8_t flow_type = input_config[current_input].flow_type;

    // Only handle numeric fields
    if (!is_numeric_field(menu.current_line, sensor_type, flow_type))
        return;

    // Build the complete value string
    char value_buf[6] = {0};

    if (menu.edit_unsigned)
    {
        // Unsigned: just 3 digits, no sign
        value_buf[0] = (menu.edit_digit == 1 && !menu.blink_state) ? ' ' : ('0' + menu.digit_100);
        value_buf[1] = (menu.edit_digit == 2 && !menu.blink_state) ? ' ' : ('0' + menu.digit_10);
        value_buf[2] = (menu.edit_digit == 3 && !menu.blink_state) ? ' ' : ('0' + menu.digit_1);
        value_buf[3] = '\0';
    }
    else
    {
        // Signed: +/- then 3 digits
        value_buf[0] = (menu.edit_digit == 0 && !menu.blink_state) ? ' ' : (menu.sign_negative ? '-' : '+');
        value_buf[1] = (menu.edit_digit == 1 && !menu.blink_state) ? ' ' : ('0' + menu.digit_100);
        value_buf[2] = (menu.edit_digit == 2 && !menu.blink_state) ? ' ' : ('0' + menu.digit_10);
        value_buf[3] = (menu.edit_digit == 3 && !menu.blink_state) ? ' ' : ('0' + menu.digit_1);
        value_buf[4] = '\0';
    }

    // Clear value area and redraw
    uint8_t start_col = menu.edit_unsigned ? 15 : 14;

    lcd_set_cursor(screen_line + 1, start_col);
    lcd_print("     "); // Clear area

    lcd_set_cursor(screen_line + 1, start_col);
    lcd_print("(");
    lcd_print(value_buf);
    lcd_print(")");
}

//=============================================================================
// MENU DRAWING FUNCTIONS
//=============================================================================

void menu_draw_options(void)
{
    // Fixed title line
    lcd_clear();
    lcd_set_cursor(0, 0);
    lcd_print("OPTIONS             ");

    // Draw 3 visible menu items
    for (uint8_t i = 0; i < 3; i++)
    {
        uint8_t item_index = menu.top_line + i;
        if (item_index >= 5)
            break;

        lcd_clear_line(i + 1);

        // If this is the current line, show with bracket cursor
        if (item_index == menu.current_line)
        {
            lcd_set_cursor(i + 1, 0);
            lcd_print("[");
            lcd_print(options_menu[item_index]);
            lcd_print("]");
        }
        else
        {
            // Not selected - start at column 2 (leave column 1 for potential bracket)
            lcd_print_at(i + 1, 1, options_menu[item_index]);
        }
    }
}

void menu_draw_input(void)
{
    extern input_config_t input_config[3];

    // Dynamic title showing which input
    lcd_clear_line(0);
    char title[10];
    sprintf(title, "INPUT %d", current_input + 1);
    lcd_print_at(0, 0, title);

    // Get sensor context for field detection
    uint8_t sensor_type = input_config[current_input].sensor_type;
    uint8_t flow_type = input_config[current_input].flow_type;

    // Draw 3 visible items
    for (uint8_t i = 0; i < 3 && (menu.top_line + i) < menu.total_items; i++)
    {
        uint8_t item_idx = menu.top_line + i;
        lcd_clear_line(i + 1);

        // Left side - label (no brackets)
        lcd_print_at(i + 1, 0, input_menu[item_idx].label);

        // Build and display the value (right-justified)
        char value_buf[15];
        uint8_t show_brackets = 0; // 0=none, 1=square brackets, 2=parentheses

        if (item_idx == menu.current_line)
        {
            if (menu.in_edit_mode)
            {
                show_brackets = 2; // Use parentheses in edit mode

                // For option fields - handle blinking
                if (is_option_field(item_idx, sensor_type, flow_type))
                {
                    if (menu.blink_state)
                    {
                        // Show text
                        const item_options_t *opts = get_item_options_for_field(item_idx, sensor_type, flow_type);
                        uint8_t *flag = get_option_edit_flag(item_idx, sensor_type, flow_type);

                        if (opts != NULL && flag != NULL && *flag < opts->option_count)
                        {
                            strcpy(value_buf, opts->options[*flag]);
                        }
                        else
                        {
                            strcpy(value_buf, input_menu[item_idx].value);
                        }
                    }
                    else
                    {
                        // Blink off - show spaces
                        const item_options_t *opts = get_item_options_for_field(item_idx, sensor_type, flow_type);
                        uint8_t *flag = get_option_edit_flag(item_idx, sensor_type, flow_type);

                        if (opts != NULL && flag != NULL && *flag < opts->option_count)
                        {
                            uint8_t val_len = strlen(opts->options[*flag]);
                            for (uint8_t j = 0; j < val_len; j++)
                                value_buf[j] = ' ';
                            value_buf[val_len] = '\0';
                        }
                        else
                        {
                            strcpy(value_buf, "     ");
                        }
                    }
                }
                else
                {
                    // For numeric/time fields, just get current value
                    strcpy(value_buf, input_menu[item_idx].value);
                }
            }
            else
            {
                // Selected but not editing - show with square brackets
                show_brackets = 1;
                strcpy(value_buf, input_menu[item_idx].value);
            }
        }
        else
        {
            // Not selected - just show value, no brackets
            show_brackets = 0;
            strcpy(value_buf, input_menu[item_idx].value);
        }

        // Display the value with proper positioning
        uint8_t val_len = strlen(value_buf);
        if (val_len > 0 && strcmp(input_menu[item_idx].value, "") != 0)
        {
            // Skip drawing if we're editing a numeric or time field
            if (menu.in_edit_mode && item_idx == menu.current_line)
            {
                if (is_numeric_field(item_idx, sensor_type, flow_type) ||
                    is_time_field(item_idx, sensor_type, flow_type))
                {
                    // Don't draw - specialized update functions handle it
                    continue;
                }
            }

            if (show_brackets == 0)
            {
                // No brackets - value ends at column 19
                lcd_print_at(i + 1, 19 - val_len, value_buf);
            }
            else
            {
                // With brackets - print everything in one sequence
                uint8_t start_pos = 19 - val_len - 1; // Where opening bracket goes
                lcd_set_cursor(i + 1, start_pos);

                // Print opening bracket
                lcd_print(show_brackets == 1 ? "[" : "(");
                // Print value immediately after
                lcd_print(value_buf);
                // Print closing bracket immediately after
                lcd_print(show_brackets == 1 ? "]" : ")");
            }
        }
    }
}

void menu_draw_setup(void)
{
    extern input_config_t input_config[3];

    // Fixed title line
    lcd_clear();
    lcd_set_cursor(0, 0);
    lcd_print("SETUP               ");

    // Menu items: Input 1, Input 2, Input 3, Clock, Back
    const char *setup_labels[] = {"", "", "", "Clock", "Back"};

    // Draw 3 visible menu items
    for (uint8_t i = 0; i < 3; i++)
    {
        uint8_t item_idx = menu.top_line + i;
        if (item_idx >= 5)
            break;

        lcd_clear_line(i + 1);

        // For Input 1-3, show sensor type
        if (item_idx < 3)
        {
            uint8_t sensor = input_config[item_idx].sensor_type;
            const char *sensor_name = (sensor == 0) ? "Pressure" : (sensor == 1) ? "Temp"
                                                                                 : "Flow";

            // Show label with or without brackets based on selection
            if (item_idx == menu.current_line)
            {
                // Selected - show with bracket cursor at column 1
                lcd_set_cursor(i + 1, 0);
                lcd_print("[");
                lcd_print(sensor_name);
                lcd_print("]");
            }
            else
            {
                // Not selected - start at column 2
                lcd_print_at(i + 1, 1, sensor_name);
            }

            // Enable indicator in column 20 (always shown, separate from brackets)
            lcd_set_cursor(i + 1, 19);
            lcd_print(input_config[item_idx].enable ? "*" : " ");
        }
        else
        {
            // Clock or Back
            const char *label = setup_labels[item_idx];

            if (item_idx == menu.current_line)
            {
                // Selected - show with bracket cursor at column 1
                lcd_set_cursor(i + 1, 0);
                lcd_print("[");
                lcd_print(label);
                lcd_print("]");
            }
            else
            {
                // Not selected - start at column 2
                lcd_print_at(i + 1, 1, label);
            }
        }
    }
}

//=============================================================================
// ENCODER HANDLING
//=============================================================================

void menu_handle_encoder(int16_t delta)
{
    extern input_config_t input_config[3];

    // Edit mode - handle based on field type
    if (menu.in_edit_mode)
    {
        if (delta != 0)
        {
            uint8_t sensor_type = input_config[current_input].sensor_type;
            uint8_t flow_type = input_config[current_input].flow_type;

            // Check if this is an option field
            if (is_option_field(menu.current_line, sensor_type, flow_type))
            {
                uint8_t *edit_flag = get_option_edit_flag(menu.current_line, sensor_type, flow_type);
                const item_options_t *opts = get_item_options_for_field(menu.current_line, sensor_type, flow_type);

                if (edit_flag != NULL && opts != NULL)
                {
                    if (delta > 0)
                    {
                        (*edit_flag)++;
                        if (*edit_flag >= opts->option_count)
                            *edit_flag = 0;
                    }
                    else if (delta < 0)
                    {
                        if (*edit_flag == 0)
                            *edit_flag = opts->option_count - 1;
                        else
                            (*edit_flag)--;
                    }

                    // Safety clamp
                    if (*edit_flag >= opts->option_count)
                        *edit_flag = 0;

                    // Update display immediately for option fields
                    if (current_menu == 1)
                    {
                        strcpy(input_menu[menu.current_line].value, opts->options[*edit_flag]);
                        menu_draw_input();
                    }
                }
            }
            else if (is_numeric_field(menu.current_line, sensor_type, flow_type))
            {
                handle_numeric_rotation(delta > 0 ? 1 : -1);
            }
            else if (is_time_field(menu.current_line, sensor_type, flow_type))
            {
                handle_time_rotation(delta > 0 ? 1 : -1);
            }
        }
        return;
    }

    // Normal navigation when not in edit mode
    if (delta > 0)
    {
        // Clockwise - move down
        if (menu.current_line < menu.total_items - 1)
        {
            menu.current_line++;

            // Adjust scroll if needed
            if (menu.current_line >= menu.top_line + 3)
            {
                menu.top_line++;
            }
        }
    }
    else if (delta < 0)
    {
        // Counter-clockwise - move up
        if (menu.current_line > 0)
        {
            menu.current_line--;

            // Adjust scroll if needed
            if (menu.current_line < menu.top_line)
            {
                menu.top_line--;
            }
        }
    }
}

//=============================================================================
// BUTTON HANDLING
//=============================================================================

void menu_handle_button(uint8_t press_type)
{
    extern uint8_t save_pending;
    extern input_config_t input_config[3];

    if (menu.in_edit_mode)
    {
        if (press_type == 1) // Short press - confirm edit
        {
            uint8_t sensor_type = input_config[current_input].sensor_type;
            uint8_t flow_type = input_config[current_input].flow_type;

            // Handle option fields
            if (is_option_field(menu.current_line, sensor_type, flow_type))
            {
                uint8_t *edit_flag = get_option_edit_flag(menu.current_line, sensor_type, flow_type);
                const item_options_t *opts = get_item_options_for_field(menu.current_line, sensor_type, flow_type);

                if (edit_flag != NULL && opts != NULL)
                {
                    // Update the menu item value
                    strcpy(input_menu[menu.current_line].value, opts->options[*edit_flag]);

                    // UPDATE THE ACTUAL CONFIG based on which field
                    if (menu.current_line == 0) // Enable
                    {
                        input_config[current_input].enable = enable_edit_flag;
                    }
                    else if (menu.current_line == 1) // Sensor
                    {
                        input_config[current_input].sensor_type = sensor_edit_flag;

                        // If changing TO Flow, set default flow_type
                        if (sensor_edit_flag == 2 && sensor_type != 2)
                        {
                            input_config[current_input].flow_type = 1; // Default to Digital
                        }
                    }
                    else if (menu.current_line == 2 && sensor_type == 2) // Flow Type
                    {
                        input_config[current_input].flow_type = flow_type_edit_flag;

                        // IMPORTANT: Rebuild menu when flow type changes
                        rebuild_input_menu(current_input);
                    }
                    else if (menu.current_line == 3 && sensor_type == 2 && flow_type == 1) // No Flow
                    {
                        // TODO: Save to EEPROM when field added
                    }
                    else if (menu.current_line == 3 && sensor_type == 2 && flow_type == 0) // Units
                    {
                        input_config[current_input].flow_units = flow_units_edit_flag;
                    }
                    else if (sensor_type == 0) // Pressure relay/display fields
                    {
                        if (menu.current_line == 9)
                            input_config[current_input].relay_high_mode = relay_high_edit_flag;
                        else if (menu.current_line == 10)
                            input_config[current_input].relay_plp_mode = relay_plp_edit_flag;
                        else if (menu.current_line == 11)
                            input_config[current_input].relay_slp_mode = relay_slp_edit_flag;
                        else if (menu.current_line == 12)
                            input_config[current_input].display_enabled = display_edit_flag;
                    }
                    else if (sensor_type == 1) // Temp relay/display fields
                    {
                        if (menu.current_line == 6)
                            input_config[current_input].relay_high_mode = relay_high_edit_flag;
                        else if (menu.current_line == 7)
                            input_config[current_input].display_enabled = display_edit_flag;
                    }
                    else if (sensor_type == 2) // Flow relay/display fields
                    {
                        if (flow_type == 0) // Analog
                        {
                            if (menu.current_line == 8)
                                input_config[current_input].relay_low_mode = relay_low_edit_flag;
                            else if (menu.current_line == 9)
                                input_config[current_input].display_enabled = display_edit_flag;
                        }
                        else // Digital
                        {
                            if (menu.current_line == 5)
                                input_config[current_input].relay_low_mode = relay_low_edit_flag;
                            else if (menu.current_line == 6)
                                input_config[current_input].display_enabled = display_edit_flag;
                        }
                    }

                    save_pending = 1;
                }

                menu.in_edit_mode = 0;
                beep(50);
            }
            // Handle time fields
            else if (is_time_field(menu.current_line, sensor_type, flow_type))
            {
                menu.time_edit_digit++;
                menu.blink_state = 1;
                beep(50);

                char buf[50];
                sprintf(buf, "Time button: digit now=%d", menu.time_edit_digit);
                uart_println(buf);

                menu_update_time_value();

                if (menu.time_edit_digit > 1)
                {
                    // Calculate total seconds
                    uint16_t new_seconds;
                    if (menu.edit_time_mode == 0) // MM:SS
                        new_seconds = menu.time_xx * 60 + menu.time_yy;
                    else // HH:MM
                        new_seconds = menu.time_xx * 3600 + menu.time_yy * 60;

                    // Save to appropriate field based on sensor and line
                    if (sensor_type == 0) // Pressure
                    {
                        if (menu.current_line == 5)
                            input_config[current_input].high_bypass_time = new_seconds;
                        else if (menu.current_line == 7)
                            input_config[current_input].plp_bypass_time = new_seconds;
                        else if (menu.current_line == 8)
                            input_config[current_input].slp_bypass_time = new_seconds;
                    }
                    else if (sensor_type == 1) // Temperature
                    {
                        if (menu.current_line == 5)
                            input_config[current_input].high_bypass_time = new_seconds;
                    }
                    else if (sensor_type == 2) // Flow
                    {
                        if (flow_type == 0 && menu.current_line == 7) // Analog - Low Flow BP
                            input_config[current_input].low_flow_bypass = new_seconds;
                        else if (flow_type == 1 && menu.current_line == 4) // Digital - No Flow BP
                            input_config[current_input].low_flow_bypass = new_seconds;
                    }

                    // Update display string
                    sprintf(input_menu[menu.current_line].value, "%02d:%02d",
                            menu.time_xx, menu.time_yy);

                    menu.in_edit_mode = 0;
                    save_pending = 1;
                    uart_println("Time edit complete - saved");
                }
            }
            // Handle numeric fields
            else if (is_numeric_field(menu.current_line, sensor_type, flow_type))
            {
                menu.edit_digit++;
                beep(50);

                if (menu.edit_digit == 2 && menu.digit_100 == 5)
                {
                    menu.digit_10 = 0;
                    menu.digit_1 = 0;
                }

                if (menu.edit_digit > 3)
                {
                    int16_t new_value = get_current_numeric_value();

                    // Save based on sensor type and line
                    if (sensor_type == 0) // Pressure
                    {
                        if (menu.current_line == 2)
                        {
                            input_config[current_input].scale_4ma = new_value;
                            sprintf(input_menu[2].value, "%+04d", new_value);
                        }
                        else if (menu.current_line == 3)
                        {
                            input_config[current_input].scale_20ma = new_value;
                            sprintf(input_menu[3].value, "%+04d", new_value);
                        }
                        else if (menu.current_line == 4)
                        {
                            input_config[current_input].high_setpoint = (uint16_t)new_value;
                            sprintf(input_menu[4].value, "%03d", new_value);
                        }
                        else if (menu.current_line == 6)
                        {
                            // TODO: Save to low_pressure_setpoint when added
                            sprintf(input_menu[6].value, "%03d", new_value);
                        }
                    }
                    else if (sensor_type == 1) // Temperature
                    {
                        if (menu.current_line == 2)
                        {
                            input_config[current_input].scale_4ma = new_value;
                            sprintf(input_menu[2].value, "%+04d", new_value);
                        }
                        else if (menu.current_line == 3)
                        {
                            input_config[current_input].scale_20ma = new_value;
                            sprintf(input_menu[3].value, "%+04d", new_value);
                        }
                        else if (menu.current_line == 4)
                        {
                            input_config[current_input].high_setpoint = (uint16_t)new_value;
                            sprintf(input_menu[4].value, "%03d", new_value);
                        }
                    }
                    else if (sensor_type == 2 && flow_type == 0) // Analog Flow
                    {
                        if (menu.current_line == 4)
                        {
                            input_config[current_input].scale_4ma = new_value;
                            sprintf(input_menu[4].value, "%+04d", new_value);
                        }
                        else if (menu.current_line == 5)
                        {
                            input_config[current_input].scale_20ma = new_value;
                            sprintf(input_menu[5].value, "%+04d", new_value);
                        }
                        else if (menu.current_line == 6)
                        {
                            input_config[current_input].low_flow_setpoint = (uint16_t)new_value;
                            sprintf(input_menu[6].value, "%03d", new_value);
                        }
                    }

                    save_pending = 1;
                    menu.in_edit_mode = 0;
                }
            }
        }
        else if (press_type == 2) // Long press - cancel edit
        {
            menu.in_edit_mode = 0;
            beep(100);
            __delay_ms(50);
            beep(100); // Double beep for cancel
        }
    }
    else // Not in edit mode
    {
        if (press_type == 1) // Short press
        {
            if (current_menu == 0) // OPTIONS menu
            {
                beep(50);

                switch (menu.current_line)
                {
                case 0: // Main Menu
                    break;

                case 1: // Setup Menu
                    current_menu = 2;
                    menu.current_line = 0;
                    menu.top_line = 0;
                    menu.total_items = 5;
                    menu_draw_setup();
                    break;

                case 2: // Utility Menu
                    break;

                case 3: // About
                    break;

                case 4: // Exit
                    if (save_pending)
                    {
                        save_current_config();
                        save_pending = 0;
                    }
                    current_menu = 255;
                    break;
                }
            }
            else if (current_menu == 1) // INPUT menu
            {
                if (menu.current_line == menu.total_items - 1) // Back
                {
                    beep(50);
                    current_menu = 2;
                    menu.current_line = 0;
                    menu.top_line = 0;
                    menu.total_items = 5;
                    menu_draw_setup();
                }
                else if (input_menu[menu.current_line].editable)
                {
                    uint8_t sensor_type = input_config[current_input].sensor_type;
                    uint8_t flow_type = input_config[current_input].flow_type;

                    // Enter edit mode for numeric fields
                    if (is_numeric_field(menu.current_line, sensor_type, flow_type))
                    {
                        int16_t current_val = 0;

                        // Get current value based on sensor and line
                        if (sensor_type == 0) // Pressure
                        {
                            if (menu.current_line == 2)
                                current_val = input_config[current_input].scale_4ma;
                            else if (menu.current_line == 3)
                                current_val = input_config[current_input].scale_20ma;
                            else if (menu.current_line == 4)
                                current_val = (int16_t)input_config[current_input].high_setpoint;
                            else if (menu.current_line == 6)
                                current_val = 50; // TODO
                        }
                        else if (sensor_type == 1) // Temperature
                        {
                            if (menu.current_line == 2)
                                current_val = input_config[current_input].scale_4ma;
                            else if (menu.current_line == 3)
                                current_val = input_config[current_input].scale_20ma;
                            else if (menu.current_line == 4)
                                current_val = (int16_t)input_config[current_input].high_setpoint;
                        }
                        else if (sensor_type == 2 && flow_type == 0) // Analog Flow
                        {
                            if (menu.current_line == 4)
                                current_val = input_config[current_input].scale_4ma;
                            else if (menu.current_line == 5)
                                current_val = input_config[current_input].scale_20ma;
                            else if (menu.current_line == 6)
                                current_val = (int16_t)input_config[current_input].low_flow_setpoint;
                        }

                        init_numeric_editor(current_val);
                        menu.in_edit_mode = 1;
                        menu.blink_state = 1;
                        beep(50);
                    }
                    // Enter edit mode for time fields
                    else if (is_time_field(menu.current_line, sensor_type, flow_type))
                    {
                        uint16_t current_val = 0;

                        // Get current value based on sensor and line
                        if (sensor_type == 0) // Pressure
                        {
                            if (menu.current_line == 5)
                                current_val = input_config[current_input].high_bypass_time;
                            else if (menu.current_line == 7)
                                current_val = input_config[current_input].plp_bypass_time;
                            else if (menu.current_line == 8)
                                current_val = input_config[current_input].slp_bypass_time;
                        }
                        else if (sensor_type == 1) // Temperature
                        {
                            if (menu.current_line == 5)
                                current_val = input_config[current_input].high_bypass_time;
                        }
                        else if (sensor_type == 2) // Flow
                        {
                            if ((flow_type == 0 && menu.current_line == 7) ||
                                (flow_type == 1 && menu.current_line == 4))
                                current_val = input_config[current_input].low_flow_bypass;
                        }

                        char buf[50];
                        sprintf(buf, "Init time editor: seconds=%d, line=%d", current_val, menu.current_line);
                        uart_println(buf);

                        init_time_editor(current_val, 0);
                        menu.in_edit_mode = 1;
                        menu.blink_state = 1;
                        beep(50);
                    }
                    // Enter edit mode for option fields
                    else if (is_option_field(menu.current_line, sensor_type, flow_type))
                    {
                        strcpy(original_value, input_menu[menu.current_line].value);

                        uint8_t *edit_flag = get_option_edit_flag(menu.current_line, sensor_type, flow_type);
                        const item_options_t *opts = get_item_options_for_field(menu.current_line, sensor_type, flow_type);

                        if (edit_flag != NULL && opts != NULL)
                        {
                            // Find which option matches current value
                            for (uint8_t i = 0; i < opts->option_count; i++)
                            {
                                if (strcmp(input_menu[menu.current_line].value, opts->options[i]) == 0)
                                {
                                    *edit_flag = i;
                                    break;
                                }
                            }
                        }

                        menu.in_edit_mode = 1;
                        menu.blink_state = 1;
                        beep(50);
                    }
                }
            }
            else if (current_menu == 2) // SETUP menu
            {
                beep(50);

                if (menu.current_line == 4) // Back
                {
                    current_menu = 0;
                    menu.current_line = 0;
                    menu.top_line = 0;
                    menu.total_items = 5;
                    menu_draw_options();
                }
                else if (menu.current_line <= 2) // Input 1-3
                {
                    rebuild_input_menu(menu.current_line);
                    current_menu = 1;
                    menu.current_line = 0;
                    menu.top_line = 0;
                    menu_draw_input();
                }
                else if (menu.current_line == 3) // Clock
                {
                    // Stub
                }
            }
        }
        else if (press_type == 2) // Long press - factory reset
        {
            beep(100);
            __delay_ms(50);
            beep(100);
        }
    }
}
