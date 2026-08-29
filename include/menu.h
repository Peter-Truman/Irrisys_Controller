#ifndef MENU_H
#define MENU_H
#include <stdint.h>

// Menu state structure
typedef struct
{
    uint8_t current_line;
    uint8_t top_line;
    uint8_t total_items;
    uint8_t in_edit_mode;
    uint8_t edit_value;
    uint8_t blink_state;
    uint16_t blink_timer;
    uint8_t edit_digit;
    uint8_t sign_negative;
    uint8_t digit_100;
    uint8_t digit_10;
    uint8_t digit_1;
    int16_t original_value;
    uint8_t edit_unsigned;
    uint8_t edit_time_mode;       // 0=none, 1=MM:SS, 2=HH:MM, 3=HH:MM 24hr, 4=whole HH:MM
    uint8_t time_edit_digit;
    uint8_t time_xx;
    uint8_t time_yy;
    uint16_t time_original;
    uint8_t date_dd;
    uint8_t date_mm;
    uint8_t date_yy;
    uint8_t time_hh;
    uint8_t time_min;
    uint8_t time_ss;
    uint8_t datetime_field;
    uint8_t datetime_edit_digit;
    uint8_t in_datetime_submenu;
    uint8_t edit_whole_mode;      // 0=off, 1=signed whole number (-999..+999)
    int16_t whole_edit_value;     // Current value being edited
    int16_t whole_edit_min;       // Min clamp
    int16_t whole_edit_max;       // Max clamp
    // Name editor state
    uint8_t name_edit_mode;       // 0=off, 1=editing name, 2=editing units
    uint8_t name_edit_pos;        // Current cursor position (0-10 for name, 0-2 for units)
    uint8_t name_char_index;      // Current char in charset (0-96: ASCII 32-126 + Back + Done)
    char name_buffer[12];         // Working buffer (11 chars + null)
    char units_buffer[4];         // Working buffer (3 chars + null)
} menu_state_t;

// Field detection functions
uint8_t is_numeric_field(uint8_t line, uint8_t sensor_type, uint8_t flow_type);
uint8_t is_time_field(uint8_t line, uint8_t sensor_type, uint8_t flow_type);
uint8_t is_option_field(uint8_t line, uint8_t sensor_type, uint8_t flow_type);

// Menu item structure
typedef struct
{
    const char *label;
    char *value;
    uint8_t editable;
} menu_item_t;

// External menu state
extern menu_state_t menu;
extern menu_item_t input_menu[];

// Edit flags for option fields
extern uint8_t enable_edit_flag;
extern uint8_t sensor_edit_flag;
extern uint8_t flow_type_edit_flag;
extern uint8_t no_flow_edit_flag;
extern uint8_t flow_units_edit_flag;
extern uint8_t relay_high_edit_flag;
extern uint8_t relay_low_edit_flag;
extern uint8_t relay_sec_high_edit_flag;
extern uint8_t relay_sec_low_edit_flag;
extern uint8_t fault_polarity_edit_flag;

// Digital input edit flags
extern uint8_t dig_enable_edit_flag;
extern uint8_t dig_polarity_edit_flag;
extern uint8_t dig_relay_edit_flag;

// Clock edit flags
extern uint8_t clock_enable_edit_flag;
extern uint8_t end_runtime_edit_flag;

extern uint8_t current_menu;
extern uint8_t current_input;

// Deferred EEPROM save flags (set in menu, saved after 1-second tick)
extern uint8_t input_config_dirty[3];  // Per-input dirty flags
extern uint8_t system_config_dirty;    // System config dirty flag

// Function prototypes
void menu_init(void);
void menu_draw_options(void);
void menu_draw_input(void);
void menu_draw_setup(void);
void menu_draw_clock(void);
void menu_draw_main_menu(void);
void menu_draw_utility(void);
void menu_draw_digital(void);
void menu_update_edit_value(void);
void menu_handle_encoder(int16_t delta);
void menu_handle_button(uint8_t press_type);
void lcd_print_at(uint8_t row, uint8_t col, const char *str);
void lcd_clear_line(uint8_t row);
void init_time_editor(uint16_t value_seconds, uint8_t mode);
void menu_update_time_value(void);
void menu_cancel_edit(void);

// Name editor functions
void init_name_editor(uint8_t mode, const char *initial);  // mode: 1=name, 2=units
void handle_name_rotation(int8_t delta);
uint8_t handle_name_button(void);  // Returns: 0=still editing, 1=done, 2=cancelled

// Helper function to get the edit flag pointer for current field
uint8_t *get_option_edit_flag(uint8_t line, uint8_t sensor_type, uint8_t flow_type);

#endif
