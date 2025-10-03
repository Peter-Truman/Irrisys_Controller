/**
 * IRRISYS - Menu System with Flexible Option System and Fixed Back Functionality
 * Optimized for 32MHz operation with EEPROM integration
 */

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
#include "../include/eeprom.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h> // ADD THIS LINE - needed for abs() function

// Menu state - make it accessible
menu_state_t menu;
static char original_value[10]; // Store original value for cancellation
uint8_t enable_edit_flag = 1;   // 1=Enabled, 0=Disabled
uint8_t sensor_edit_flag = 0;   // 0=Pressure, 1=Temp, 2=Flow
uint8_t current_menu = 0;       // 0=OPTIONS, 1=INPUT, 2=SETUP

// Define options for each editable item
typedef struct
{
    uint8_t item_index;     // Which menu item (0=Enable, 1=Sensor, etc.)
    uint8_t option_count;   // How many options this item has
    const char *options[5]; // Array of option strings (max 5 options)
} item_options_t;

const item_options_t menu_item_options[] = {
    {0, 2, {"Disabled", "Enabled", "", "", ""}},  // Enable: 2 options
    {1, 3, {"Pressure", "Temp", "Flow", "", ""}}, // Sensor: 3 options
    // Add more items here as needed
};

#define NUM_EDITABLE_ITEMS 2 // Currently Enable and Sensor

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
static char value_display[10] = "Show";
static char value_back[5] = "Back"; // Back option with proper text

// Additional value buffers for dynamic menu items
static char value_hi_pressure[10] = "150";   // PSI value
static char value_low_pressure[10] = "50";   // PSI value
static char value_high_temp[10] = "85";      // Temperature in C
static char value_flow_type[10] = "Digital"; // Analog/Digital
static char value_flow_units[10] = "%";      // % or LpS
static char value_no_flow[10] = "Low";       // Low/High
static char value_low_flow[10] = "30";       // Low flow threshold
static char value_no_flow_bp[10] = "00:30";  // No flow bypass time
static char value_low_flow_bp[10] = "00:30"; // Low flow bypass time
static char value_high_tbp[10] = "01:00";    // High temp bypass

// Dynamic input menu - will be populated based on sensor type
menu_item_t input_menu[15]; // Max 15 items to cover all cases
uint8_t current_input = 0;  // Which input (0-2) is being configured

// Menu template for PRESSURE sensor
const menu_item_t pressure_menu_template[] = {
    {"Enable", NULL, 1},
    {"Sensor", NULL, 1},
    {"Scale 4mA", NULL, 1},
    {"Scale 20mA", NULL, 1},
    {"Hi Pressure", NULL, 1},
    {"High PBP", NULL, 1},
    {"Low Pressure", NULL, 1},
    {"PLPBP", NULL, 1},
    {"SLPBP", NULL, 1},
    {"Rly High", NULL, 1},
    {"Rly Low", NULL, 1},
    {"Rly SLP", NULL, 1},
    {"Display", NULL, 1}, // Index 12 - THIS SHOULD BE "Display"
    {"Back", NULL, 0}     // Index 13 - THIS SHOULD BE "Back"
};
// Menu template for TEMPERATURE sensor
const menu_item_t temp_menu_template[] = {
    {"Enable", NULL, 1},
    {"Sensor", NULL, 1},
    {"Scale 4mA", NULL, 1},
    {"Scale 20mA", NULL, 1},
    {"High Temp", NULL, 1},
    {"High TBP", NULL, 1},
    {"Rly High", NULL, 1},
    {"Display", NULL, 1},
    {"Back", NULL, 0}};

// Menu template for FLOW sensor - Digital
const menu_item_t flow_digital_template[] = {
    {"Enable", NULL, 1},
    {"Sensor", NULL, 1},
    {"Type", NULL, 1},
    {"No Flow", NULL, 1},
    {"No Flow BP", NULL, 1},
    {"Rly Low", NULL, 1},
    {"Display", NULL, 1},
    {"Back", NULL, 0}};

// Menu template for FLOW sensor - Analog
const menu_item_t flow_analog_template[] = {
    {"Enable", NULL, 1},
    {"Sensor", NULL, 1},
    {"Type", NULL, 1},
    {"Units", NULL, 1},
    {"Scale 4mA", NULL, 1},
    {"Scale 20mA", NULL, 1},
    {"Low Flow", NULL, 1},
    {"Low Flow BP", NULL, 1},
    {"Rly Low", NULL, 1},
    {"Display", NULL, 1},
    {"Back", NULL, 0}};

// Function declarations from header
extern void lcd_set_cursor(uint8_t row, uint8_t col);
extern void lcd_print(const char *str);
extern void beep(uint16_t duration_ms);
extern void save_current_config(void);
extern void uart_println(const char *str);
extern void lcd_clear(void);
// extern uint8_t strlen(const char *str); // If not already declared
void handle_time_rotation(int8_t direction);

// Helper function to identify numeric fields
uint8_t is_numeric_field(uint8_t line)
{
    return (line == 2 || line == 3 || line == 4 || line == 6);
}

// Helper function to identify time fields
uint8_t is_time_field(uint8_t line)
{
    // High BP, PLPBP, SLPBP (lines 5, 7, 8 in pressure menu)
    // High TBP (line 5 in temp menu)
    return (line == 5 || line == 7 || line == 8);
}

// Initialize time editor for HH:MM or MM:SS editing
// Initialize time editor for HH:MM or MM:SS editing
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
        menu.time_yy = (value_seconds % 3600) / 60; // Minutes (0-59) - FIX THIS LINE
    }

    // Start editing at first digit (tens of XX)
    menu.time_edit_digit = 0;

    // DEBUG: Print conversion results
    char buf[60];
    sprintf(buf, "Time init: secs=%d -> XX=%d, YY=%d",
            value_seconds, menu.time_xx, menu.time_yy);
    uart_println(buf);
}

// Handle rotation for time editing - correct version
void handle_time_rotation(int8_t direction)
{
    uart_println("handle_time_rotation called!"); // ADD THIS

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

    sprintf(buf, "Rotate end: XX=%d, YY=%d", menu.time_xx, menu.time_yy); // ADD THIS
    uart_println(buf);
}

// Update time value display during editing
void menu_update_time_value(void)
{
    // Only update if in INPUT menu and edit mode
    if (current_menu != 1 || !menu.in_edit_mode)
        return;

    // Find which line on screen
    uint8_t screen_line = menu.current_line - menu.top_line;
    if (screen_line >= 3)
        return; // Not visible

    // Get the item being edited
    uint8_t item_idx = menu.current_line;

    // Only handle time fields
    if (!is_time_field(item_idx))
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

    // DEBUG: Show what we're displaying
    char debug[50];
    if (!menu.blink_state && menu.time_edit_digit == 0)
    {
        sprintf(debug, "LCD: (  :%02d) [XX blanked]", menu.time_yy);
    }
    else if (!menu.blink_state && menu.time_edit_digit == 1)
    {
        sprintf(debug, "LCD: (%02d:  ) [YY blanked]", menu.time_xx);
    }
    else
    {
        sprintf(debug, "LCD: (%02d:%02d) [solid]", menu.time_xx, menu.time_yy);
    }
    uart_println(debug);

    // Display at correct position
    uint8_t start_col = 13; // Adjust as needed for your display

    lcd_set_cursor(screen_line + 1, start_col);
    lcd_print("       "); // Clear area

    lcd_set_cursor(screen_line + 1, start_col);
    lcd_print("(");
    lcd_print(value_buf);
    lcd_print(")");
}

// LCD helper - print at specific position
void lcd_print_at(uint8_t row, uint8_t col, const char *str)
{
    lcd_set_cursor(row, col);
    lcd_print(str);
}

// Clear a single line
void lcd_clear_line(uint8_t row)
{
    lcd_set_cursor(row, 0);
    lcd_print("                    "); // 20 spaces
}

// Get options for a specific menu item
const item_options_t *get_item_options(uint8_t item_index)
{
    for (uint8_t i = 0; i < NUM_EDITABLE_ITEMS; i++)
    {
        if (menu_item_options[i].item_index == item_index)
        {
            return &menu_item_options[i];
        }
    }
    return NULL; // Not found
}

// Initialize menu system
void menu_init(void)
{
    menu.current_line = 0;
    menu.top_line = 0;
    menu.total_items = 5; // OPTIONS menu items
    menu.in_edit_mode = 0;
    menu.blink_state = 0;
    menu.blink_timer = 0;
}

// Rebuild input menu based on sensor type
void rebuild_input_menu(uint8_t input_num)
{
    extern input_config_t input_config[3];
    current_input = input_num;

    // Get sensor type from EEPROM config
    uint8_t sensor = input_config[input_num].sensor_type;

    // Convert EEPROM values to strings for display
    sprintf(value_enable, "%s", input_config[input_num].enable ? "Enabled" : "Disabled");

    if (sensor == 0) // Pressure
    {
        strcpy(value_sensor, "Pressure");
        sprintf(value_scale4, "%+04d", input_config[input_num].scale_4ma);
        sprintf(value_scale20, "%+04d", input_config[input_num].scale_20ma);
        sprintf(value_hi_pressure, "%03d", input_config[input_num].high_setpoint);
        sprintf(value_highbp, "%02d:%02d", input_config[input_num].high_bypass_time / 60,
                input_config[input_num].high_bypass_time % 60);
        sprintf(value_low_pressure, "%03d", 50);
        sprintf(value_plpbp, "%02d:%02d", input_config[input_num].plp_bypass_time / 60,
                input_config[input_num].plp_bypass_time % 60);
        sprintf(value_slpbp, "%02d:%02d", input_config[input_num].slp_bypass_time / 60,
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
        sprintf(value_high_tbp, "%02d:%02d", input_config[input_num].high_bypass_time / 60,
                input_config[input_num].high_bypass_time % 60);

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
    // Flow sensor handling will be added later

    // DEBUG: Verify total items
    char buf[30];
    sprintf(buf, "Total items set to: %d", menu.total_items);
    uart_println(buf);

    // DEBUG: Check what's actually in the menu
    uart_println("Menu items after rebuild:");
    for (uint8_t i = 12; i < 14; i++)
    {
        char buf[50];
        sprintf(buf, "Item %d: %s", i, input_menu[i].label);
        uart_println(buf);
    }
} // End of rebuild_input_menu function
// Initialize numeric editor for Scale values
void init_numeric_editor(int16_t value)
{
    // Set flag for unsigned fields (Hi Pressure, Low Pressure)
    menu.edit_unsigned = (menu.current_line == 4 || menu.current_line == 6) ? 1 : 0;

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

// Get current numeric value being edited
int16_t get_current_numeric_value(void)
{
    int16_t value = menu.digit_100 * 100 + menu.digit_10 * 10 + menu.digit_1;
    if (menu.sign_negative)
        value = -value;
    return value;
}

// Handle rotation for numeric editing
void handle_numeric_rotation(int8_t direction)
{                                                   // <-- Opening brace must be HERE, right after the function signature
    uart_println("handle_numeric_rotation called"); // Debug line INSIDE the function

    // Add debug info
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
                menu.digit_100 = 0; // Roll over to 0
        }
        else if (direction < 0)
        {
            if (menu.digit_100 == 0)
                menu.digit_100 = 5; // Roll under to 5
            else
                menu.digit_100--;
        }
        // REMOVE THE AUTO-RESET - don't force tens/units to 0 here
        break;

    case 2: // Tens (0-9) with rollover, but limited if hundreds = 5
    {
        uint8_t max_tens = (menu.digit_100 == 5) ? 0 : 9;
        if (direction > 0)
        {
            if (max_tens == 0)
                break; // Can't change if at 500
            menu.digit_10++;
            if (menu.digit_10 > max_tens)
                menu.digit_10 = 0; // Roll over to 0
        }
        else if (direction < 0)
        {
            if (max_tens == 0)
                break; // Can't change if at 500
            if (menu.digit_10 == 0)
                menu.digit_10 = max_tens; // Roll under to max
            else
                menu.digit_10--;
        }
    }
    break;

    case 3: // Units (0-9) with rollover, but limited if at 50x
    {
        // If we're at 50x, units must be 0
        if (menu.digit_100 == 5 && menu.digit_10 == 0)
        {
            menu.digit_1 = 0; // Force to 0, no change allowed
            break;            // Don't allow any change
        }

        // Otherwise normal 0-9 with rollover
        if (direction > 0)
        {
            menu.digit_1++;
            if (menu.digit_1 > 9)
                menu.digit_1 = 0; // Roll over to 0
        }
        else if (direction < 0)
        {
            if (menu.digit_1 == 0)
                menu.digit_1 = 9; // Roll under to 9
            else
                menu.digit_1--;
        }
    }
    break;
    }
}

// Update only the numeric value during editing - FAST UPDATE
void menu_update_numeric_value(void)
{
    // DEBUG: Check if this function is being called
    extern void uart_println(const char *str);
    uart_println("menu_update_numeric_value called");

    // Only update if we're in INPUT menu and edit mode
    if (current_menu != 1 || !menu.in_edit_mode)
        return;

    // Find which line on screen has the edited item
    uint8_t screen_line = menu.current_line - menu.top_line;
    if (screen_line >= 3)
        return; // Not visible

    // Get the item being edited
    uint8_t item_idx = menu.current_line;

    // Handle Scale 4mA, Scale 20mA, Hi Pressure, Low Pressure
    if (!is_numeric_field(item_idx))
        return;

    // Build the complete value string
    char value_buf[6] = {0}; // Maximum size needed

    if (menu.edit_unsigned)
    {
        // Add debug
        char debug[50];
        sprintf(debug, "edit_digit=%d, blink=%d", menu.edit_digit, menu.blink_state);
        uart_println(debug);

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
    lcd_print("      "); // Clear 6 positions

    // Position and print with parentheses
    lcd_set_cursor(screen_line + 1, start_col);
    lcd_print("(");
    lcd_print(value_buf);
    lcd_print(")");
}

// Draw OPTIONS menu with scrolling
void menu_draw_options(void)
{
    // Fixed title
    lcd_clear_line(0);
    lcd_print_at(0, 0, "OPTIONS");

    // Draw 3 visible items (lines 1-3)
    for (uint8_t i = 0; i < 3 && (menu.top_line + i) < menu.total_items; i++)
    {
        lcd_clear_line(i + 1);

        // Add cursor brackets if this is selected line
        if (menu.top_line + i == menu.current_line)
        {
            lcd_print_at(i + 1, 0, "[");
            lcd_print(options_menu[menu.top_line + i]);
            lcd_print("]");
        }
        else
        {
            lcd_print_at(i + 1, 1, options_menu[menu.top_line + i]);
        }
    }
}

// Draw INPUT menu with values right-justified and brackets on VALUES
void menu_draw_input(void)
{
    // Dynamic title showing which input
    lcd_clear_line(0);
    char title[10];
    sprintf(title, "INPUT %d", current_input + 1);
    lcd_print_at(0, 0, title);

    // Draw 3 visible items
    for (uint8_t i = 0; i < 3 && (menu.top_line + i) < menu.total_items; i++)
    {
        uint8_t item_idx = menu.top_line + i;
        lcd_clear_line(i + 1);

        // Left side - label (no brackets)
        lcd_print_at(i + 1, 0, input_menu[item_idx].label);

        // DEBUG: See what's being drawn
        if (item_idx >= 11)
        {
            char buf[50];
            sprintf(buf, "Drawing idx %d: %s", item_idx, input_menu[item_idx].label);
            uart_println(buf);
        }

        // Build and display the value (right-justified)
        char value_buf[15];
        uint8_t show_brackets = 0; // 0=none, 1=square brackets, 2=parentheses

        if (item_idx == menu.current_line)
        {
            if (menu.in_edit_mode)
            {
                show_brackets = 2; // Use parentheses in edit mode
                // Edit mode - only value blinks
                if (menu.blink_state)
                {
                    // Show text (without parentheses)
                    const item_options_t *opts = get_item_options(item_idx);
                    if (opts != NULL)
                    {
                        uint8_t flag_value = (item_idx == 0) ? enable_edit_flag : sensor_edit_flag;
                        if (flag_value < opts->option_count)
                        {
                            strcpy(value_buf, opts->options[flag_value]);
                        }
                        else
                        {
                            strcpy(value_buf, "Error");
                        }
                    }
                    else
                    {
                        strcpy(value_buf, input_menu[item_idx].value);
                    }
                }
                else
                {
                    // Blink off - show spaces
                    const item_options_t *opts = get_item_options(item_idx);
                    if (opts != NULL)
                    {
                        uint8_t flag_value = (item_idx == 0) ? enable_edit_flag : sensor_edit_flag;
                        if (flag_value < opts->option_count)
                        {
                            uint8_t val_len = strlen(opts->options[flag_value]);
                            for (uint8_t j = 0; j < val_len; j++)
                                value_buf[j] = ' ';
                            value_buf[val_len] = '\0';
                        }
                        else
                        {
                            strcpy(value_buf, "     ");
                        }
                    }
                    else
                    {
                        uint8_t val_len = strlen(input_menu[item_idx].value);
                        for (uint8_t j = 0; j < val_len; j++)
                            value_buf[j] = ' ';
                        value_buf[val_len] = '\0';
                    }
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
            // Skip drawing if we're editing a numeric field - let menu_update_numeric_value handle it
            if (menu.in_edit_mode && is_numeric_field(item_idx) && (item_idx == menu.current_line))
            {
                // Don't draw anything here for numeric fields in edit mode
                uart_println("Skipping numeric draw in menu_draw_input");
                // Don't draw anything here for numeric fields in edit mode
                // menu_update_numeric_value() will handle the display
            }
            else
            {
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
}
// Update only the edited value - FAST UPDATE for edit mode
void menu_update_edit_value(void)
{
    // Only update if we're in INPUT menu and edit mode
    if (current_menu != 1 || !menu.in_edit_mode)
        return;

    // Find which line on screen has the edited item
    uint8_t screen_line = menu.current_line - menu.top_line;
    if (screen_line >= 3)
        return; // Not visible

    // Get the item being edited
    uint8_t item_idx = menu.current_line;

    // Build the value string (without parentheses)
    char value_buf[15];
    const item_options_t *opts = get_item_options(item_idx);

    if (opts != NULL)
    {
        uint8_t flag_value = (item_idx == 0) ? enable_edit_flag : sensor_edit_flag;
        if (flag_value < opts->option_count)
        {
            if (menu.blink_state)
            {
                // Show the value
                strcpy(value_buf, opts->options[flag_value]);
            }
            else
            {
                // Show spaces (blink off)
                uint8_t val_len = strlen(opts->options[flag_value]);
                for (uint8_t j = 0; j < val_len; j++)
                    value_buf[j] = ' ';
                value_buf[val_len] = '\0';
            }
        }
        else
        {
            if (menu.blink_state)
                strcpy(value_buf, "Error");
            else
                strcpy(value_buf, "     "); // 5 spaces
        }
    }
    else
    {
        if (menu.blink_state)
        {
            strcpy(value_buf, input_menu[item_idx].value);
        }
        else
        {
            uint8_t val_len = strlen(input_menu[item_idx].value);
            for (uint8_t j = 0; j < val_len; j++)
                value_buf[j] = ' ';
            value_buf[val_len] = '\0';
        }
    }

    // Clear the entire value area to handle different lengths
    lcd_set_cursor(screen_line + 1, 10); // Start clearing from column 10
    lcd_print("          ");             // 10 spaces to clear any remnants

    // Display with parentheses - move left by 1 to make room for closing paren
    uint8_t val_len = strlen(value_buf);
    if (val_len > 0)
    {
        // Move everything left by 1 more position
        uint8_t start_pos = 18 - val_len; // One position further left (was 19-val_len-1)
        lcd_set_cursor(screen_line + 1, start_pos);

        // Print opening parenthesis
        lcd_print("(");
        // Print value immediately after (will end at column 19)
        lcd_print(value_buf);
        // Print closing parenthesis immediately after (at column 20)
        lcd_print(")");
    }
}

// Handle encoder rotation - FLEXIBLE OPTION SYSTEM
void menu_handle_encoder(int16_t delta)
{
    // Edit mode - handle all editable items flexibly
    if (menu.in_edit_mode)
    {
        if (delta != 0)
        {
            // Get the options for this menu item
            const item_options_t *opts = get_item_options(menu.current_line);
            if (opts != NULL)
            {
                // Get pointer to the appropriate edit flag
                uint8_t *edit_flag = (menu.current_line == 0) ? &enable_edit_flag : &sensor_edit_flag;

                if (delta > 0)
                {
                    (*edit_flag)++;
                    if (*edit_flag >= opts->option_count)
                        *edit_flag = 0; // Wrap to 0
                }
                else if (delta < 0)
                {
                    if (*edit_flag == 0)
                        *edit_flag = opts->option_count - 1; // Wrap to last option
                    else
                        (*edit_flag)--;
                }

                // Safety clamp
                if (*edit_flag >= opts->option_count)
                    *edit_flag = 0;
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

            // DEBUG: Hit the limit
            char buf[50];
            sprintf(buf, "At limit: line=%d, total=%d", menu.current_line, menu.total_items);
            uart_println(buf);

            menu.current_line--;

            // Adjust scroll if needed
            if (menu.current_line < menu.top_line)
            {
                menu.top_line--;
            }
        }
    }
}

// Handle button press - FLEXIBLE OPTION SYSTEM WITH EEPROM SAVE
void menu_handle_button(uint8_t press_type)
{
    extern uint8_t save_pending;

    if (menu.in_edit_mode)
    {
        if (press_type == 1) // Short press - confirm edit
        {
            // Check if we're editing Enable or Sensor (option fields)
            if (menu.current_line == 0 || menu.current_line == 1)
            {
                // Apply the value based on which item we're editing
                const item_options_t *opts = get_item_options(menu.current_line);
                if (opts != NULL)
                {
                    uint8_t *edit_flag = (menu.current_line == 0) ? &enable_edit_flag : &sensor_edit_flag;

                    // Update the menu item value
                    strcpy(input_menu[menu.current_line].value, opts->options[*edit_flag]);

                    // UPDATE THE ACTUAL CONFIG - ADD THIS
                    if (menu.current_line == 0) // Enable field
                    {
                        input_config[current_input].enable = enable_edit_flag;
                    }
                    else if (menu.current_line == 1) // Sensor field
                    {
                        input_config[current_input].sensor_type = sensor_edit_flag;
                    }

                    // Mark for EEPROM save (deferred)
                    save_pending = 1;
                }

                menu.in_edit_mode = 0;
                beep(50); // Confirmation beep
            }
            else if (is_time_field(menu.current_line)) // Time fields
            {
                // Advance to next field or save
                menu.time_edit_digit++;
                menu.blink_state = 1; // ADD THIS - force solid display when switching fields
                beep(50);

                // Debug
                char buf[50];
                sprintf(buf, "Time button: digit now=%d", menu.time_edit_digit);
                uart_println(buf);

                // Force immediate display update
                menu_update_time_value(); // ADD THIS - update display right away

                if (menu.time_edit_digit > 1) // Done editing (only 0 and 1 positions)
                {
                    // Calculate total seconds
                    uint16_t new_seconds;
                    if (menu.edit_time_mode == 0) // MM:SS
                        new_seconds = menu.time_xx * 60 + menu.time_yy;
                    else // HH:MM
                        new_seconds = menu.time_xx * 3600 + menu.time_yy * 60;

                    // Save to appropriate field
                    if (menu.current_line == 5)
                        input_config[current_input].high_bypass_time = new_seconds;
                    else if (menu.current_line == 7)
                        input_config[current_input].plp_bypass_time = new_seconds;
                    else if (menu.current_line == 8)
                        input_config[current_input].slp_bypass_time = new_seconds;

                    // Update display string
                    sprintf(input_menu[menu.current_line].value, "%02d:%02d",
                            menu.time_xx, menu.time_yy);

                    // Exit edit mode
                    menu.in_edit_mode = 0;
                    save_pending = 1;

                    uart_println("Time edit complete - saved");
                }
            }
            else if (is_numeric_field(menu.current_line)) // Numeric fields
            {
                // Advance to next digit
                menu.edit_digit++;
                beep(50); // Confirmation beep

                // ADD THIS: If we just confirmed hundreds=5, reset tens and units
                if (menu.edit_digit == 2 && menu.digit_100 == 5) // Just moved to tens, hundreds is 5
                {
                    menu.digit_10 = 0;
                    menu.digit_1 = 0;
                }

                if (menu.edit_digit > 3) // Finished all digits
                {
                    // Save the new value
                    extern input_config_t input_config[3];
                    int16_t new_value = get_current_numeric_value();

                    // Update the configuration
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
                        // TODO: Save to low_pressure_setpoint when added to structure
                        sprintf(input_menu[6].value, "%03d", new_value);
                    }

                    // Mark for EEPROM save
                    save_pending = 1;

                    // Exit edit mode
                    menu.in_edit_mode = 0;
                }
            }
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
                    // Stub for Main Menu
                    break;

                case 1:               // Setup Menu - Go to SETUP menu
                    current_menu = 2; // 2 = SETUP menu
                    menu.current_line = 0;
                    menu.top_line = 0;
                    menu.total_items = 5; // 5 items in SETUP menu
                    menu_draw_setup();
                    break;

                case 2: // Utility Menu
                    // Stub for Utility Menu
                    break;

                case 3: // About
                    // Stub for About
                    break;

                case 4: // Exit
                    // Save any pending changes to EEPROM before exiting
                    if (save_pending)
                    {
                        save_current_config();
                        save_pending = 0;
                    }
                    current_menu = 255; // ADD THIS LINE - Return to main screen
                    break;
                }
            }
            else if (current_menu == 1) // INPUT menu
            {
                if (menu.current_line == menu.total_items - 1) // Back option (always last item)
                {
                    beep(50);
                    // Go back to SETUP menu
                    current_menu = 2; // Go to SETUP menu
                    menu.current_line = 0;
                    menu.top_line = 0;
                    menu.total_items = 5; // SETUP menu has 5 items
                    menu_draw_setup();
                }
                else if (input_menu[menu.current_line].editable)
                {
                    // Check if it's a numeric field
                    if (is_numeric_field(menu.current_line))
                    {
                        // Initialize numeric editor
                        extern input_config_t input_config[3];
                        int16_t current_val;

                        if (menu.current_line == 2)
                            current_val = input_config[current_input].scale_4ma;
                        else if (menu.current_line == 3)
                            current_val = input_config[current_input].scale_20ma;
                        else if (menu.current_line == 4)
                            current_val = (int16_t)input_config[current_input].high_setpoint;
                        else if (menu.current_line == 6)
                            current_val = 50; // TODO: Add low_pressure_setpoint to structure

                        init_numeric_editor(current_val);
                        menu.in_edit_mode = 1;
                        menu.blink_state = 1; // Start with value visible
                        beep(50);
                    }
                    else if (is_time_field(menu.current_line)) // Time field handling
                    {
                        // Initialize time editor
                        extern input_config_t input_config[3];
                        uint16_t current_val = 0;

                        // Get the current value in seconds based on which field
                        if (menu.current_line == 5) // High BP or High TBP
                            current_val = input_config[current_input].high_bypass_time;
                        else if (menu.current_line == 7) // PLPBP
                            current_val = input_config[current_input].plp_bypass_time;
                        else if (menu.current_line == 8) // SLPBP
                            current_val = input_config[current_input].slp_bypass_time;

                        // DEBUG: Print what we're sending to init
                        char buf[50];
                        sprintf(buf, "Init time editor: seconds=%d, line=%d", current_val, menu.current_line);
                        uart_println(buf);

                        init_time_editor(current_val, 0); // Mode 0 for MM:SS
                        menu.in_edit_mode = 1;
                        menu.blink_state = 1;
                        beep(50);
                    }
                    else // Enable or Sensor - option field handling
                    {
                        // Store original value for potential cancellation
                        strcpy(original_value, input_menu[menu.current_line].value);

                        // Get the correct flag value for this item
                        const item_options_t *opts = get_item_options(menu.current_line);
                        if (opts != NULL)
                        {
                            uint8_t *edit_flag = (menu.current_line == 0) ? &enable_edit_flag : &sensor_edit_flag;

                            // Find which option matches the current value
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
                        menu.blink_state = 1; // Start with value visible
                        beep(50);             // Immediate feedback
                    }
                }
            }
            else if (current_menu == 2) // SETUP menu
            {
                beep(50);

                if (menu.current_line == 4) // Back option
                {
                    // Go back to OPTIONS menu
                    current_menu = 0;
                    menu.current_line = 0;
                    menu.top_line = 0;
                    menu.total_items = 5; // OPTIONS menu has 5 items
                    menu_draw_options();
                }
                else if (menu.current_line <= 2) // Input 1-3
                {
                    // Rebuild menu for selected input
                    rebuild_input_menu(menu.current_line); // 0=Input1, 1=Input2, 2=Input3

                    // Go to INPUT menu
                    current_menu = 1;
                    menu.current_line = 0;
                    menu.top_line = 0;
                    // total_items already set by rebuild_input_menu
                    menu_draw_input();
                }
                else if (menu.current_line == 3) // Clock
                {
                    // Stub for Clock configuration
                }
            }
        }
        else if (press_type == 2) // Long press
        {
            beep(100);
            __delay_ms(50);
            beep(100); // Double beep
        }
        else if (press_type == 3) // Very long press
        {
            beep(100);
            __delay_ms(50);
            beep(100);
            __delay_ms(50);
            beep(100); // Triple beep
        }
    }
}

// Draw SETUP menu - NEW FUNCTION
void menu_draw_setup(void)
{
    extern input_config_t input_config[3];

    lcd_clear();
    lcd_print("SETUP");

    // Display 3 items based on current position
    for (uint8_t i = 0; i < 3 && (menu.top_line + i) < menu.total_items; i++)
    {
        uint8_t item_idx = menu.top_line + i;
        lcd_set_cursor(i + 1, 0);

        // Highlight current selection
        if (item_idx == menu.current_line)
            lcd_print("[");
        else
            lcd_print(" ");

        // Display item based on index
        if (item_idx < 3) // Input 1, 2, 3
        {
            // Get sensor type for this input
            uint8_t sensor = input_config[item_idx].sensor_type;
            const char *sensor_name = (sensor == 0) ? "Pressure" : (sensor == 1) ? "Temp"
                                                                                 : "Flow";
            lcd_print(sensor_name);

            // Add spacing to position enable indicator
            uint8_t name_len = strlen(sensor_name);
            for (uint8_t j = name_len; j < 14; j++)
                lcd_print(" ");

            // Show '*' if enabled
            if (input_config[item_idx].enable)
            {
                lcd_set_cursor(i + 1, 19);
                lcd_print("*");
            }
        }
        else if (item_idx == 3) // Clock
        {
            lcd_print("Clock");
            // TODO: Add clock enable check when available
        }
        else if (item_idx == 4) // Back
        {
            lcd_print("Back");
        }

        // Close bracket if selected
        if (item_idx == menu.current_line)
        {
            lcd_set_cursor(i + 1, 10);
            lcd_print("]");
        }
    }
}