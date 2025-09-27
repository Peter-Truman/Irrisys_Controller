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
    {"High PBP", NULL, 1}, // Changed from "High BP" to "High PBP"
    {"Low Pressure", NULL, 1},
    {"PLPBP", NULL, 1},
    {"SLPBP", NULL, 1},
    {"Rly High", NULL, 1},
    {"Rly Low", NULL, 1},
    {"Rly SLP", NULL, 1},
    {"Display", NULL, 1},
    {"Back", NULL, 0}};

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
        sprintf(value_scale4, "%d", input_config[input_num].scale_4ma);
        sprintf(value_scale20, "%d", input_config[input_num].scale_20ma);
        sprintf(value_hi_pressure, "%d", input_config[input_num].high_setpoint);
        sprintf(value_highbp, "%02d:%02d", input_config[input_num].high_bypass_time / 60,
                input_config[input_num].high_bypass_time % 60);
        sprintf(value_low_pressure, "%d", input_config[input_num].temp_low); // Using temp_low for low pressure
        sprintf(value_plpbp, "%02d:%02d", input_config[input_num].plp_bypass_time / 60,
                input_config[input_num].plp_bypass_time % 60);
        sprintf(value_slpbp, "%02d:%02d", input_config[input_num].slp_bypass_time / 60,
                input_config[input_num].slp_bypass_time % 60);
        // Set relay mode strings
        strcpy(value_rlyhigh, input_config[input_num].relay_high_mode == 0 ? "Latch" : input_config[input_num].relay_high_mode == 1 ? "Pulse"
                                                                                                                                    : "Not Used");
        strcpy(value_rlyplp, input_config[input_num].relay_plp_mode == 0 ? "Latch" : input_config[input_num].relay_plp_mode == 1 ? "Pulse"
                                                                                                                                 : "Not Used");
        strcpy(value_rlyslp, input_config[input_num].relay_slp_mode == 0 ? "Latch" : input_config[input_num].relay_slp_mode == 1 ? "Pulse"
                                                                                                                                 : "Not Used");
        strcpy(value_display, input_config[input_num].display_enabled ? "Show" : "Hide");

        // Copy template
        memcpy(input_menu, pressure_menu_template, sizeof(pressure_menu_template));

        // Assign value pointers
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
        sprintf(value_scale4, "%d", input_config[input_num].scale_4ma);
        sprintf(value_scale20, "%d", input_config[input_num].scale_20ma);
        sprintf(value_high_temp, "%d", input_config[input_num].high_setpoint);
        sprintf(value_high_tbp, "%02d:%02d", input_config[input_num].high_bypass_time / 60,
                input_config[input_num].high_bypass_time % 60);

        // Copy template
        memcpy(input_menu, temp_menu_template, sizeof(temp_menu_template));

        // Assign value pointers
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
    for (uint8_t i = 0; i < 3 && (menu.top_line + i) < 12; i++)
    {
        uint8_t item_idx = menu.top_line + i;
        lcd_clear_line(i + 1);

        // Left side - label (no brackets)
        lcd_print_at(i + 1, 0, input_menu[item_idx].label);

        // Build and display the value (right-justified)
        char value_buf[15];
        // Build the value string (WITHOUT brackets/parentheses)
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
            // Apply the value based on which item we're editing
            const item_options_t *opts = get_item_options(menu.current_line);
            if (opts != NULL)
            {
                uint8_t *edit_flag = (menu.current_line == 0) ? &enable_edit_flag : &sensor_edit_flag;

                // Update the menu item value
                strcpy(input_menu[menu.current_line].value, opts->options[*edit_flag]);

                // Mark for EEPROM save (deferred)
                save_pending = 1;
            }

            menu.in_edit_mode = 0;
            beep(50); // Confirmation beep
        }
        else if (press_type == 2) // Long press - cancel edit
        {
            // Restore original value
            strcpy(input_menu[menu.current_line].value, original_value);

            // Restore the flag to match the original value
            const item_options_t *opts = get_item_options(menu.current_line);
            if (opts != NULL)
            {
                uint8_t *edit_flag = (menu.current_line == 0) ? &enable_edit_flag : &sensor_edit_flag;

                // Find which option matches the original value
                for (uint8_t i = 0; i < opts->option_count; i++)
                {
                    if (strcmp(original_value, opts->options[i]) == 0)
                    {
                        *edit_flag = i;
                        break;
                    }
                }
            }

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
                    // TODO: Return to main screen
                    break;
                }
            }
            else if (current_menu == 1) // INPUT menu
            {
                if (menu.current_line == 11) // Back option
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

    // Fixed title
    lcd_clear_line(0);
    lcd_print_at(0, 0, "SETUP");

    // SETUP menu items
    const char *setup_items[] = {
        "Input 1",
        "Input 2",
        "Input 3",
        "Clock",
        "Back"};

    // Sensor type names
    const char *sensor_type_names[] = {"Pressure", "Temp", "Flow"};

    // Draw 3 visible items (lines 1-3)
    for (uint8_t i = 0; i < 3 && (menu.top_line + i) < menu.total_items; i++)
    {
        uint8_t item_idx = menu.top_line + i;
        lcd_clear_line(i + 1);

        // Add cursor brackets if this is selected line
        if (item_idx == menu.current_line)
        {
            lcd_print_at(i + 1, 0, "[");
            lcd_print(setup_items[item_idx]);
            lcd_print("]");
        }
        else
        {
            lcd_print_at(i + 1, 1, setup_items[item_idx]);
        }

        // Show sensor type right-justified for Input items only
        if (item_idx <= 2) // Only for Input 1-3
        {
            uint8_t sensor_type = input_config[item_idx].sensor_type;
            if (sensor_type <= 2) // Valid sensor type (0=Pressure, 1=Temp, 2=Flow)
            {
                const char *type_text = sensor_type_names[sensor_type];
                uint8_t type_len = strlen(type_text);
                // Position so text ends at column 19, column 20 reserved
                lcd_print_at(i + 1, 20 - type_len, type_text);
            }
        }
    }
}