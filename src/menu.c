/**
 * IRRISYS - Menu System (Stable Version)
 * Simplified for 32MHz operation
 */

#include "../include/config.h"
#include "../include/encoder.h"
#include "../include/menu.h"
#include <stdio.h>
#include <string.h>

// Menu state - make it accessible
menu_state_t menu;

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

// Handle encoder rotation - SIMPLIFIED VERSION
void menu_handle_encoder(int16_t delta)
{
    // Skip edit mode entirely for now - just do navigation
    if (menu.in_edit_mode)
    {
        return; // Do nothing in edit mode until we debug
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

// Handle button press - SIMPLIFIED VERSION
void menu_handle_button(uint8_t press_type)
{
    // Temporarily disable edit mode
    if (menu.in_edit_mode)
    {
        // Just exit edit mode
        menu.in_edit_mode = 0;
        menu.blink_state = 1;
        beep(50);
        return;
    }
    else
    {
        if (press_type == 1)
        {
            // Don't enter edit mode yet - just beep for confirmation
            beep(50);
            // TODO: Re-enable edit mode once navigation is stable
        }
        else if (press_type == 3)
        {
            // Very long press - exit to main screen
            beep(200);
        }
    }
}