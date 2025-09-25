/**
 * IRRISYS - Menu System with Flexible Option System
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
uint8_t current_menu = 1;       // 0=OPTIONS, 1=INPUT
uint8_t save_pending = 0;       // Add this global flag

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
static char value_back[1] = ""; // Empty buffer for Back option

// Test values for INPUT menu
menu_item_t input_menu[] = {
    {"Enable", value_enable, 1},
    {"Sensor", value_sensor, 1},
    {"Scale 4mA", value_scale4, 1},
    {"Scale 20mA", value_scale20, 1},
    {"High BP", value_highbp, 1},
    {"PLPBP", value_plpbp, 1},
    {"SLPBP", value_slpbp, 1},
    {"Rly High", value_rlyhigh, 1},
    {"Rly PLP", value_rlyplp, 1},
    {"Rly SLP", value_rlyslp, 1},
    {"Display", value_display, 1},
    {"Back", value_back, 0}};

// Function declarations from header
extern void lcd_set_cursor(uint8_t row, uint8_t col);
extern void lcd_print(const char *str);
extern void beep(uint16_t duration_ms);
extern void save_current_config(void);

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
    // Fixed title
    lcd_clear_line(0);
    lcd_print_at(0, 0, "INPUT 1");

    // Draw 3 visible items
    for (uint8_t i = 0; i < 3 && (menu.top_line + i) < 12; i++)
    {
        uint8_t item_idx = menu.top_line + i;
        lcd_clear_line(i + 1);

        // Left side - label (no brackets)
        lcd_print_at(i + 1, 0, input_menu[item_idx].label);

        // Right side - value with brackets if this line is selected
        char value_buf[15];

        if (item_idx == menu.current_line)
        {
            if (menu.in_edit_mode)
            {
                // Edit mode - parentheses stay solid, only value blinks
                if (menu.blink_state)
                {
                    // Show text with solid parentheses
                    const item_options_t *opts = get_item_options(item_idx);
                    if (opts != NULL)
                    {
                        uint8_t flag_value = (item_idx == 0) ? enable_edit_flag : sensor_edit_flag;
                        if (flag_value < opts->option_count)
                        {
                            sprintf(value_buf, "(%s)", opts->options[flag_value]);
                        }
                        else
                        {
                            sprintf(value_buf, "(Error)");
                        }
                    }
                    else
                    {
                        sprintf(value_buf, "(%s)", input_menu[item_idx].value);
                    }
                }
                else
                {
                    // Show just parentheses with spaces inside (text disappears)
                    const item_options_t *opts = get_item_options(item_idx);
                    if (opts != NULL)
                    {
                        uint8_t flag_value = (item_idx == 0) ? enable_edit_flag : sensor_edit_flag;
                        if (flag_value < opts->option_count)
                        {
                            uint8_t val_len = strlen(opts->options[flag_value]);
                            sprintf(value_buf, "(");
                            for (uint8_t j = 0; j < val_len; j++)
                                strcat(value_buf, " ");
                            strcat(value_buf, ")");
                        }
                        else
                        {
                            sprintf(value_buf, "(     )");
                        }
                    }
                    else
                    {
                        uint8_t val_len = strlen(input_menu[item_idx].value);
                        char blank[10] = "(";
                        for (uint8_t j = 0; j < val_len; j++)
                            strcat(blank, " ");
                        strcat(blank, ")");
                        strcpy(value_buf, blank);
                    }
                }
            }
            else
            {
                // Selected but not editing - show brackets
                sprintf(value_buf, "[%s]", input_menu[item_idx].value);
            }
        }
        else
        {
            // Not selected - just show value
            strcpy(value_buf, input_menu[item_idx].value);
        }

        // Right justify at column 19
        uint8_t val_len = strlen(value_buf);
        if (val_len > 0 && strcmp(input_menu[item_idx].value, "") != 0)
        {
            lcd_print_at(i + 1, 20 - val_len, value_buf);
        }
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

// Handle button press - COMPLETE MENU SYSTEM WITH OPTIONS NAVIGATION
void menu_handle_button(uint8_t press_type)
{
    if (menu.in_edit_mode)
    {
        if (press_type == 1)
        {
            // Short press - save and exit edit mode
            // Beep first for immediate feedback
            beep(50);
            menu.in_edit_mode = 0;
            menu.blink_state = 1;

            // Update configuration after beep
            if (menu.current_line == 0) // Enable item
            {
                input_config[0].enable = enable_edit_flag;
                strcpy(value_enable, enable_edit_flag ? "Enabled" : "Disabled");
            }
            else if (menu.current_line == 1) // Sensor item
            {
                input_config[0].sensor_type = sensor_edit_flag;
                const item_options_t *opts = get_item_options(1);
                if (opts != NULL && sensor_edit_flag < opts->option_count)
                {
                    strcpy(value_sensor, opts->options[sensor_edit_flag]);
                }
            }

            // Mark save as pending (commented out to avoid delay)
            // save_pending = 1;
        }
        else if (press_type == 2)
        {
            // Long press - cancel edit mode and restore original
            // Beep first for immediate feedback
            beep(100);
            menu.in_edit_mode = 0;
            menu.blink_state = 1;

            // Restore original values after beep
            if (menu.current_line == 0) // Enable item
            {
                enable_edit_flag = (original_value[0] == 'E') ? 1 : 0;
            }
            else if (menu.current_line == 1) // Sensor item
            {
                // Restore sensor flag to match original value
                if (strcmp(original_value, "Pressure") == 0)
                    sensor_edit_flag = 0;
                else if (strcmp(original_value, "Temp") == 0)
                    sensor_edit_flag = 1;
                else
                    sensor_edit_flag = 2; // Flow
            }
        }
    }
    else
    {
        if (press_type == 1)
        {
            // Short press - handle different menu types
            if (current_menu == 0) // OPTIONS menu
            {
                // Handle OPTIONS menu selections
                beep(50); // Immediate feedback

                switch (menu.current_line)
                {
                case 0: // Main Menu
                    uart_println("Switching to MAIN menu");
                    // Stub for Main Menu - just beep and show message for now
                    // TODO: Implement Main Menu with Hi Pressure, Low Pressure, etc.
                    break;

                case 1: // Setup Menu
                    uart_println("Switching to INPUT menu");
                    current_menu = 1;
                    menu.total_items = 12; // INPUT menu has 12 items
                    menu.current_line = 0; // Reset cursor to top
                    menu.top_line = 0;     // Reset scroll position
                    break;

                case 2: // Utility Menu
                    uart_println("Switching to UTILITY menu");
                    // Stub for Utility Menu - just beep and show message for now
                    // TODO: Implement Utility Menu with Set Clock, View Log, etc.
                    break;

                case 3: // About
                    uart_println("About selected - not implemented");
                    // TODO: Show version info, etc.
                    break;

                case 4: // Exit
                    uart_println("Exit selected - returning to main screen");
                    // TODO: Could add main display screen logic here
                    break;

                default:
                    uart_println("Unknown OPTIONS selection");
                    break;
                }
            }
            else if (current_menu == 1) // INPUT menu
            {
                // Handle INPUT menu selections
                if (input_menu[menu.current_line].editable && (menu.current_line == 0 || menu.current_line == 1))
                {
                    // Beep first for immediate feedback
                    beep(50);

                    // Save original value and sync flags
                    strcpy(original_value, input_menu[menu.current_line].value);

                    if (menu.current_line == 0) // Enable item
                    {
                        enable_edit_flag = (value_enable[0] == 'E') ? 1 : 0;
                    }
                    else if (menu.current_line == 1) // Sensor item
                    {
                        // Sync sensor flag with current value
                        if (strcmp(value_sensor, "Pressure") == 0)
                            sensor_edit_flag = 0;
                        else if (strcmp(value_sensor, "Temp") == 0)
                            sensor_edit_flag = 1;
                        else
                            sensor_edit_flag = 2; // Flow
                    }

                    menu.in_edit_mode = 1;
                    menu.blink_timer = 0;
                    menu.blink_state = 1;
                }
                else if (menu.current_line == 11) // Back option
                {
                    // Back to OPTIONS menu
                    beep(50);
                    uart_println("Returning to OPTIONS menu");
                    current_menu = 0;
                    menu.total_items = 5;  // OPTIONS menu has 5 items
                    menu.current_line = 1; // Return to Setup Menu position
                    menu.top_line = 0;     // Reset scroll position
                }
                else
                {
                    beep(50); // Just beep for non-editable items
                }
            }
        }
        else if (press_type == 3)
        {
            // Very long press - always return to OPTIONS menu
            beep(200);
            uart_println("Very long press - returning to OPTIONS menu");
            current_menu = 0;
            menu.total_items = 5;
            menu.current_line = 0;
            menu.top_line = 0;
        }
    }
}