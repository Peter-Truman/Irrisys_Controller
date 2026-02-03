#ifndef EVENTLOG_H
#define EVENTLOG_H

#include <stdint.h>

// Stop reason codes
#define STOP_END_RUNTIME    1
#define STOP_IN1_HI_BP      2
#define STOP_IN1_LO_BP      3
#define STOP_IN2_HI_BP      4
#define STOP_IN2_LO_BP      5
#define STOP_IN3_HI_BP      6
#define STOP_IN3_LO_BP      7
#define STOP_PWR_FAIL       8
#define STOP_EXT_STOP       9
#define STOP_DIG2_FAULT     10
#define STOP_DIG3_FAULT     11
#define STOP_DIG4_FAULT     12
#define STOP_CODE_MAX       12

// Public API
void eventlog_init(void);
void eventlog_write(uint8_t stop_code);
uint8_t eventlog_read(uint16_t display_idx);  // 0 = newest
uint16_t eventlog_count(void);
void eventlog_clear(void);

// Stop reason display string (for menu)
const char *eventlog_reason_str(uint8_t stop_code);

#endif
