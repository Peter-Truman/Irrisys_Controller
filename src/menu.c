/**
 * IRRISYS - Menu System Test Framework
 * Tests: Navigation, scrolling, inline editing
 */

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
#include <stdio.h>
#include <string.h>

// Menu state - make it accessible
menu_state_t menu;
static char original_value[10]; // Store original value for cancellation

// Options for each editable field
const char *enable_options[] = {"Enabled", "Disabled"};
const char *sensor_options[] = {"Pressure", "Float", "External"};
const char *relay_options[] = {"Latch", "Pulse", "Auto"};
const char *display_options[] = {"Show", "Hide"};

// Test menu items for OPTIONS menu
const char *options_menu[] = {
    "Main Menu",
    "Setup Menu",
    "Utility Menu",
    "About",
    "Exit"};

// Buffers for editable values - must be modifiable
static char value_enable[10] = "Enabled";
static char value_sensor[10] = "Pressure";
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

// Test values for INPUT menu (to demonstrate inline editing)
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

// Draw OPTIONS menu with scrolling - USING SQUARE BRACKETS
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
        char value_buf[12];

        if (item_idx == menu.current_line)
        {
            if (menu.in_edit_mode)
            {
                // Edit mode - parentheses stay solid, only value blinks
                if (menu.blink_state)
                {
                    sprintf(value_buf, "(%s)", input_menu[item_idx].value);
                }
                else
                {
                    // Keep parentheses visible, blank the value inside
                    uint8_t val_len = strlen(input_menu[item_idx].value);
                    char blank[10] = "(";
                    for (uint8_t j = 0; j < val_len; j++)
                        strcat(blank, " ");
                    strcat(blank, ")");
                    strcpy(value_buf, blank);
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

// Handle encoder rotation
void menu_handle_encoder(int16_t delta)
{
    // If in edit mode, cycle through available options
    if (menu.in_edit_mode)
    {
        if (delta != 0)
        {
            uint8_t item_idx = menu.current_line;

            // Only handle items that have options defined
            if (item_idx == 0) // Enable item
            {
                // Simple toggle for Enable/Disable
                if (input_menu[0].value[0] == 'E') // Currently "Enabled"
                {
                    strcpy(input_menu[0].value, "Disabled");
                }
                else // Currently "Disabled" or anything else
                {
                    strcpy(input_menu[0].value, "Enabled");
                }
                beep(5);
            }
            else if (item_idx == 1) // Sensor item
            {
                // Cycle through Pressure -> Float -> External
                if (input_menu[1].value[0] == 'P') // "Pressure"
                {
                    strcpy(input_menu[1].value, delta > 0 ? "Float" : "External");
                }
                else if (input_menu[1].value[0] == 'F') // "Float"
                {
                    strcpy(input_menu[1].value, delta > 0 ? "External" : "Pressure");
                }
                else // "External" or anything else
                {
                    strcpy(input_menu[1].value, delta > 0 ? "Pressure" : "Float");
                }
                beep(5);
            }
            else if (item_idx >= 7 && item_idx <= 9) // Relay items
            {
                // Cycle through Latch -> Pulse -> Auto
                if (input_menu[item_idx].value[0] == 'L') // "Latch"
                {
                    strcpy(input_menu[item_idx].value, delta > 0 ? "Pulse" : "Auto");
                }
                else if (input_menu[item_idx].value[0] == 'P') // "Pulse"
                {
                    strcpy(input_menu[item_idx].value, delta > 0 ? "Auto" : "Latch");
                }
                else // "Auto" or anything else
                {
                    strcpy(input_menu[item_idx].value, delta > 0 ? "Latch" : "Pulse");
                }
                beep(5);
            }
            else if (item_idx == 10) // Display item
            {
                // Simple toggle for Show/Hide
                if (input_menu[10].value[0] == 'S') // Currently "Show"
                {
                    strcpy(input_menu[10].value, "Hide");
                }
                else // Currently "Hide" or anything else
                {
                    strcpy(input_menu[10].value, "Show");
                }
                beep(5);
            }
            else
            {
                // For other items, just beep
                beep(5);
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

// Handle button press
void menu_handle_button(uint8_t press_type)
{
    // press_type: 1=short, 2=long, 3=very long

    if (menu.in_edit_mode)
    {
        if (press_type == 1)
        {
            // Short press - save and exit edit mode
            menu.in_edit_mode = 0;
            menu.blink_state = 1; // Reset blink state
            beep(50);
            // TODO: Save to EEPROM here
        }
        else if (press_type == 2)
        {
            // Long press - cancel edit mode and restore original value
            strcpy(input_menu[menu.current_line].value, original_value);
            menu.in_edit_mode = 0;
            menu.blink_state = 1; // Reset blink state
            beep(100);
        }
    }
    else
    {
        if (press_type == 1)
        {
            // Short press - enter edit mode or select item
            if (input_menu[menu.current_line].editable)
            {
                // Save original value before entering edit mode
                strcpy(original_value, input_menu[menu.current_line].value);
                menu.in_edit_mode = 1;
                menu.blink_timer = 0;
                menu.blink_state = 1;
                beep(50);
            }
        }
        else if (press_type == 3)
        {
            // Very long press - exit to main screen
            beep(200);
            // Would exit menu here
        }
    }
}