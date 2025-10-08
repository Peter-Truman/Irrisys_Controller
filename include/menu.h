#ifndef MENU_H
#define MENU_H
#include <stdint.h>

// Menu state structure - MUST be defined before using it
typedef struct
{
    uint8_t current_line;        // Current cursor position (0-based)
    uint8_t top_line;            // First visible item (for scrolling)
    uint8_t total_items;         // Total menu items
    uint8_t in_edit_mode;        // 0=list mode, 1=edit mode
    uint8_t edit_value;          // Current value being edited
    uint8_t blink_state;         // For cursor blinking
    uint16_t blink_timer;        // Millisecond counter for blink
    uint8_t edit_digit;          // 0=sign, 1=hundreds, 2=tens, 3=units
    uint8_t sign_negative;       // 0=positive, 1=negative
    uint8_t digit_100;           // Hundreds digit (0-5)
    uint8_t digit_10;            // Tens digit (0-9)
    uint8_t digit_1;             // Units digit (0-9)
    int16_t original_value;      // Store original value for cancel
    uint8_t edit_unsigned;       // 1=unsigned (no sign), 0=signed
    uint8_t edit_time_mode;      // 0=MM:SS, 1=HH:MM, 2=HH:MM with 24hr limit
    uint8_t time_edit_digit;     // 0=tens XX, 1=units XX, 2=tens YY, 3=units YY
    uint8_t time_xx;             // First field (MM or HH)
    uint8_t time_yy;             // Second field (SS or MM)
    uint16_t time_original;      // Original value in seconds for cancel
                                 // Date/time editing fields (for Set Clock feature)
    uint8_t date_dd;             // Day (1-31)
    uint8_t date_mm;             // Month (1-12)
    uint8_t date_yy;             // Year (00-99)
    uint8_t time_hh;             // Hours (0-23)
    uint8_t time_min;            // Minutes (0-59)
    uint8_t time_ss;             // Seconds (0-59)
    uint8_t datetime_field;      // 0=date, 1=time, 2=back
    uint8_t datetime_edit_digit; // Which digit pair (0-2)
    uint8_t in_datetime_submenu; // 1 when in SET CLOCK submenu
} menu_state_t;

// Context-aware field detection functions - NEW SIGNATURES
uint8_t is_numeric_field(uint8_t line, uint8_t sensor_type, uint8_t flow_type);
uint8_t is_time_field(uint8_t line, uint8_t sensor_type, uint8_t flow_type);
uint8_t is_option_field(uint8_t line, uint8_t sensor_type, uint8_t flow_type);

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

// External edit flags for ALL option fields
extern uint8_t enable_edit_flag;     // 0=Disabled, 1=Enabled
extern uint8_t sensor_edit_flag;     // 0=Pressure, 1=Temp, 2=Flow
extern uint8_t flow_type_edit_flag;  // 0=Analog, 1=Digital
extern uint8_t no_flow_edit_flag;    // 0=Low, 1=High
extern uint8_t flow_units_edit_flag; // 0=%, 1=LpS
extern uint8_t display_edit_flag;    // 0=Hide, 1=Show
extern uint8_t relay_high_edit_flag; // 0=Latch, 1=Pulse, 2=Not Used
extern uint8_t relay_plp_edit_flag;  // 0=Latch, 1=Pulse, 2=Not Used
extern uint8_t relay_slp_edit_flag;  // 0=Latch, 1=Pulse, 2=Not Used
extern uint8_t relay_low_edit_flag;  // 0=Latch, 1=Pulse, 2=Not Used

extern uint8_t current_menu;
extern uint8_t current_input; // Which input (0-2) is being configured

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
// Function prototypes
void menu_init(void);
void menu_draw_options(void);
void menu_draw_input(void);
void menu_draw_setup(void);
void menu_draw_clock(void);
void menu_update_edit_value(void);
void menu_handle_encoder(int16_t delta);
void menu_handle_button(uint8_t press_type);
void lcd_print_at(uint8_t row, uint8_t col, const char *str);
void lcd_clear_line(uint8_t row);
void init_time_editor(uint16_t value_seconds, uint8_t mode);
void menu_update_time_value(void);

// NEW: Helper function to get the edit flag pointer for current field
uint8_t *get_option_edit_flag(uint8_t line, uint8_t sensor_type, uint8_t flow_type);

#endif