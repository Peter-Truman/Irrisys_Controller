#ifndef ENCODER_H
#define ENCODER_H

#include <stdint.h>

// Encoder count (positive = CW, negative = CCW)
extern volatile int16_t encoder_count;

// Button state
extern volatile uint8_t button_pressed;      // Flag: event ready for main loop
extern volatile uint16_t button_hold_ms;     // Live hold counter (use for status display)
extern volatile uint16_t button_hold_captured; // Hold time at event (use for action)
extern volatile uint8_t button_event;        // 0=none, 1=short, 2=long
extern volatile uint8_t button_state;        // State machine state

// Beep request flags (set by ISR, cleared by main after beeping)
extern volatile uint8_t short_beep_flag;  // Request 50ms beep
extern volatile uint8_t long_beep_flag;   // Request 300ms beep

// Free-running ms counter for encoder acceleration
extern volatile uint16_t encoder_ms_timer;

// RTC 1Hz tick COUNT (incremented per INT0, drained by main loop so no second
// is ever lost) and 50ms sub-tick flag (set in ISR, cleared in main loop).
extern volatile uint8_t rtc_tick_count;
extern volatile uint8_t subtick_flag;

// [R3] Non-blocking buzzer sequencer state (1ms, Timer0 ISR driven).
// Loaded by beep() / beep_double() in main.c, which return immediately.
extern volatile uint16_t buzzer_ms;
extern volatile uint16_t buzzer_on_ms;
extern volatile uint16_t buzzer_off_ms;
extern volatile uint8_t buzzer_repeats;
extern volatile uint8_t buzzer_phase;

void encoder_init(void);

#endif