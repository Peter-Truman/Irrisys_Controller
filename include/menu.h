#ifndef MENU_H
#define MENU_H
#include <stdint.h>

// Menu state structure - MUST be defined before using it
typedef struct
{
    uint8_t current_line;    // Current cursor position (0-based)
    uint8_t top_line;        // First visible item (for scrolling)
    uint8_t total_items;     // Total menu items
    uint8_t in_edit_mode;    // 0=list mode, 1=edit mode
    uint8_t edit_value;      // Current value being edited
    uint8_t blink_state;     // For cursor blinking
    uint16_t blink_timer;    // Millisecond counter for blink
    uint8_t edit_digit;      // 0=sign, 1=hundreds, 2=tens, 3=units
    uint8_t sign_negative;   // 0=positive, 1=negative
    uint8_t digit_100;       // Hundreds digit (0-5)
    uint8_t digit_10;        // Tens digit (0-9)
    uint8_t digit_1;         // Units digit (0-9)
    int16_t original_value;  // Store original value for cancel
    uint8_t edit_unsigned;   // 1=unsigned (no sign), 0=signed
    uint8_t edit_time_mode;  // 0=MM:SS, 1=HH:MM, 2=HH:MM with 24hr limit
    uint8_t time_edit_digit; // 0=tens XX, 1=units XX, 2=tens YY, 3=units YY
    uint8_t time_xx;         // First field (MM or HH)
    uint8_t time_yy;         // Second field (SS or MM)
    uint16_t time_original;  // Original value in seconds for cancel
} menu_state_t;

uint8_t is_numeric_field(uint8_t line);
uint8_t is_time_field(uint8_t line);

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
void init_time_editor(uint16_t value_seconds, uint8_t mode);
void menu_update_time_value(void);
#endif