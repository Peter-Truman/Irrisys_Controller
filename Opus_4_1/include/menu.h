#ifndef MENU_H
#define MENU_H
#include <stdint.h>

// Menu state structure - MUST be defined before using it
typedef struct
{
    uint8_t current_line; // Current cursor position (0-based)
    uint8_t top_line;     // First visible item (for scrolling)
    uint8_t total_items;  // Total menu items
    uint8_t in_edit_mode; // 0=list mode, 1=edit mode
    uint8_t edit_value;   // Current value being edited
    uint8_t blink_state;  // For cursor blinking
    uint16_t blink_timer; // Millisecond counter for blink
} menu_state_t;

// Menu item structure
typedef struct
{
    const char *label;
    char *value;      // Changed from const char* to char* for modifiable values
    uint8_t editable; // 1=editable, 0=navigation only
} menu_item_t;

// External menu state - NOW it can reference menu_state_t
extern menu_state_t menu;
extern menu_item_t input_menu[];

// External variables that other files can access
extern uint8_t enable_edit_flag;
extern uint8_t sensor_edit_flag;
extern uint8_t current_menu;

// Function prototypes
void menu_init(void);
void menu_draw_options(void);
void menu_draw_input(void);
void menu_draw_setup(void);
void menu_update_edit_value(void);
void menu_handle_encoder(int16_t delta);
void menu_handle_button(uint8_t press_type);
void lcd_print_at(uint8_t row, uint8_t col, const char *str);
void lcd_clear_line(uint8_t row);

#endif