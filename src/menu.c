/**
 * IRRISYS - Menu System with Stable Edit Mode
 * Optimized for 32MHz operation - Enable + Sensor
 */

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
#include <stdio.h>
#include <string.h>

// Menu state - make it accessible
menu_state_t menu;
static char original_value[10];      // Store original value for cancellation
static uint8_t enable_edit_flag = 1; // 1=Enabled, 0=Disabled
static uint8_t sensor_edit_flag = 0; // 0=Pressure, 1=Temperature, 2=Flow

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
        char value_buf[20];                      // Larger buffer
        memset(value_buf, 0, sizeof(value_buf)); // Clear it completely

        if (item_idx == menu.current_line)
        {
            if (menu.in_edit_mode)
            {
                // Edit mode - parentheses stay solid, only value blinks
                if (menu.blink_state)
                {
                    // Show text with solid parentheses
                    if (item_idx == 0) // Enable item
                    {
                        sprintf(value_buf, "(%s)", enable_edit_flag ? "Enabled" : "Disabled");
                    }
                    else if (item_idx == 1) // Sensor item
                    {
                        const char *sensor_options[] = {"Pressure", "Temp", "Flow"};
                        sprintf(value_buf, "(%s)", sensor_options[sensor_edit_flag]);
                    }
                    else
                    {
                        sprintf(value_buf, "(%s)", input_menu[item_idx].value);
                    }
                }
                else
                {
                    // Show just parentheses with spaces inside (text disappears)
                    if (item_idx == 0) // Enable item
                    {
                        uint8_t val_len = strlen(enable_edit_flag ? "Enabled" : "Disabled");
                        sprintf(value_buf, "(");
                        for (uint8_t j = 0; j < val_len; j++)
                            strcat(value_buf, " ");
                        strcat(value_buf, ")");
                    }
                    else if (item_idx == 1) // Sensor item
                    {
                        const char *sensor_options[] = {"Pressure", "Temp", "Flow"};
                        uint8_t val_len = strlen(sensor_options[sensor_edit_flag]);
                        sprintf(value_buf, "(");
                        for (uint8_t j = 0; j < val_len; j++)
                            strcat(value_buf, " ");
                        strcat(value_buf, ")");
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

        // Right justify at column 19 - clear line first
        uint8_t val_len = strlen(value_buf);
        if (val_len > 0 && strcmp(input_menu[item_idx].value, "") != 0)
        {
            // Clear the right side of the line first (columns 8-19)
            lcd_set_cursor(i + 1, 8);
            lcd_print("            "); // 12 spaces to clear columns 8-19

            // Now print the value at the correct position
            lcd_print_at(i + 1, 20 - val_len, value_buf);
        }
    }
}

// Handle encoder rotation - ENABLE AND SENSOR SUPPORT
void menu_handle_encoder(int16_t delta)
{
    // Edit mode - handle Enable and Sensor items
    if (menu.in_edit_mode)
    {
        if (delta != 0)
        {
            if (menu.current_line == 0) // Enable item
            {
                // Toggle between Enabled/Disabled
                enable_edit_flag = !enable_edit_flag;
            }
            else if (menu.current_line == 1) // Sensor item
            {
                // Cycle through 3 options: 0=Pressure, 1=Temperature, 2=Flow
                if (delta > 0)
                {
                    sensor_edit_flag++;
                    if (sensor_edit_flag > 2)
                        sensor_edit_flag = 0; // Wrap around
                }
                else
                {
                    if (sensor_edit_flag == 0)
                        sensor_edit_flag = 2; // Wrap around
                    else
                        sensor_edit_flag--;
                }
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

// Handle button press - ENABLE AND SENSOR SUPPORT
void menu_handle_button(uint8_t press_type)
{
    if (menu.in_edit_mode)
    {
        if (press_type == 1)
        {
            // Short press - save and exit edit mode
            if (menu.current_line == 0) // Enable item
            {
                strcpy(value_enable, enable_edit_flag ? "Enabled" : "Disabled");
            }
            else if (menu.current_line == 1) // Sensor item
            {
                const char *sensor_options[] = {"Pressure", "Temperature", "Flow"};
                strcpy(value_sensor, sensor_options[sensor_edit_flag]);
            }

            menu.in_edit_mode = 0;
            menu.blink_state = 1;
            beep(50);
        }
        else if (press_type == 2)
        {
            // Long press - cancel edit mode and restore original
            if (menu.current_line == 0) // Enable item
            {
                // Restore flag to match original value
                enable_edit_flag = (original_value[0] == 'E') ? 1 : 0;
            }
            else if (menu.current_line == 1) // Sensor item
            {
                // Restore sensor flag to match original value
                if (strcmp(original_value, "Pressure") == 0)
                    sensor_edit_flag = 0;
                else if (strcmp(original_value, "Temperature") == 0)
                    sensor_edit_flag = 1;
                else
                    sensor_edit_flag = 2; // Flow
            }
            menu.in_edit_mode = 0;
            menu.blink_state = 1;
            beep(100);
        }
    }
    else
    {
        if (press_type == 1)
        {
            // Short press - enter edit mode (Enable and Sensor items)
            if (input_menu[menu.current_line].editable && (menu.current_line == 0 || menu.current_line == 1))
            {
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
                    else if (strcmp(value_sensor, "Temperature") == 0)
                        sensor_edit_flag = 1;
                    else
                        sensor_edit_flag = 2; // Flow
                }

                menu.in_edit_mode = 1;
                menu.blink_timer = 0;
                menu.blink_state = 1;
                beep(50);
            }
            else
            {
                beep(50); // Just beep for non-editable items
            }
        }
        else if (press_type == 3)
        {
            // Very long press - exit to main screen
            beep(200);
        }
    }
}