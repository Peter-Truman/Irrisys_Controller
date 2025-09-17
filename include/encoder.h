#ifndef ENCODER_H
#define ENCODER_H

#include <stdint.h>

extern volatile int16_t encoder_count;
extern volatile uint8_t button_pressed;
extern volatile uint16_t button_hold_ms;
extern volatile uint8_t button_event;

void encoder_init(void);

#endif