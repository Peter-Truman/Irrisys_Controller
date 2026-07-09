#ifndef EVENTLOG_H
#define EVENTLOG_H

#include <stdint.h>

// Event codes
#define EVT_START           1   // System started (RUN)
#define EVT_END_RUNTIME     2   // Runtime clock expired
#define EVT_EXT_STOP        3   // External stop (DIG_IN1 went low)
#define EVT_PWR_FAIL        4   // Power failure detected
#define EVT_PWR_RESTORED    5   // Power restored (normal stop)
#define EVT_POWER_ON        6   // Normal power up (no fault)

// Bypass timer alarm codes (per input, per direction)
// Input 1: codes 10-13
#define EVT_IN1_PRI_HI      10  // Input 1 primary high bypass expired
#define EVT_IN1_SEC_HI      11  // Input 1 secondary high bypass expired
#define EVT_IN1_PRI_LO      12  // Input 1 primary low bypass expired
#define EVT_IN1_SEC_LO      13  // Input 1 secondary low bypass expired

// Input 2: codes 20-23
#define EVT_IN2_PRI_HI      20  // Input 2 primary high bypass expired
#define EVT_IN2_SEC_HI      21  // Input 2 secondary high bypass expired
#define EVT_IN2_PRI_LO      22  // Input 2 primary low bypass expired
#define EVT_IN2_SEC_LO      23  // Input 2 secondary low bypass expired

// Input 3: codes 30-33
#define EVT_IN3_PRI_HI      30  // Input 3 primary high bypass expired
#define EVT_IN3_SEC_HI      31  // Input 3 secondary high bypass expired
#define EVT_IN3_PRI_LO      32  // Input 3 primary low bypass expired
#define EVT_IN3_SEC_LO      33  // Input 3 secondary low bypass expired

// Digital input fault codes
#define EVT_DIG2_FAULT      40  // DIG2 fault
#define EVT_DIG3_FAULT      41  // DIG3 fault
#define EVT_DIG4_FAULT      42  // DIG4 fault

// Public API
void eventlog_init(void);
void eventlog_write(uint8_t event_code);
uint8_t eventlog_read(uint16_t display_idx);  // 0 = newest
uint16_t eventlog_count(void);
void eventlog_clear(void);

// Event display string (for menu)
const char *eventlog_reason_str(uint8_t event_code);

#endif
