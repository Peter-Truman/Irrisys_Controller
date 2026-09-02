# RV-3028-C7 — 1 Hz CLKOUT Configuration

**Purpose:** Close the `rtc.c` gap marked `WARNING - CLKOUT config not implemented; needs App Manual`. Everything here was derived from the manual and proven on hardware, so `rtc_init()` can be written for the RV-3028 without re-deriving it.

**Source:** RV-3028-C7 Application Manual, Micro Crystal, **Rev. 1.4, November 2021**. Every offset, bit position, command byte and timing below is cited to a section and page in that document. The short-form datasheet does not contain this detail.

**Bench rig:** spare ESP32-C3-MINI-1-N4 board carrying an RV-3028-C7 on the same I2C bus, SCL = IO7, SDA = IO8, 100 kHz, 4k7 pull-ups. Two separate parts tested. Dated 2026-09-02.

---

## 0. Read this first — the failure mode in OPEN_ITEMS is wrong

`OPEN_ITEMS.md` currently states that a replacement RTC with factory-default CLKOUT *"would not produce 1Hz, and the failure would present as a firmware fault — no clock, no bypass countdowns."*

**Measured behaviour contradicts this.** The RV-3028-C7 ships with `CLKOE = 1` and `FD = 000`, and both untouched parts tested drove **32.768 kHz out of CLKOUT immediately on power-up**, with no I2C access of any kind. Confirmed on a logic analyser at pin 1, and matching the manual: *"At POR … the 32.768 kHz frequency is output to CLKOUT pin since the bit CLKOE is set to 1 (default) and FD field is set to 000 (default)"* (§4.4, p.48).

So a fresh part on a Rev 2 board does **not** give silence on RB0/INT0. It gives 32.768 kHz.

| | DS3231 (Rev 1) | RV-3028-C7 (Rev 2) |
|---|---|---|
| Power-on default | SQW in alarm mode — **no square wave** | CLKOUT enabled — **32.768 kHz** |
| Unconfigured failure | No tick. Clock stops. | Tick 32768× too fast. |
| How it presents | Dead runtime clock, dead bypass timers | INT0 saturation; runtime clock races |

The two parts fail in *opposite* directions, and the RV-3028 direction is the more dangerous one:

- `rtc_tick_flag` would be set **32768 times a second**. Every 1-second consumer advances 32768× too fast: a 5:00 secondary bypass would expire in about **9 ms**, and the runtime clock — a *billable quantity on an irrigation job* (`rtc.h`) — becomes meaningless.
- INT0 shares the **single non-prioritised ISR** with the 1 ms Timer0 encoder poll (CLAUDE.md, *ISR Structure*). At 8 MIPS that is roughly 33 INT0 entries per Timer0 tick, one interrupt every **~244 instruction cycles**.
- Anyone debugging it will be hunting a *missing* tick, because that is what the docs currently predict. They will find the opposite.

*(The frequency is measured; the INT0 consequences above are reasoned from it and have not been observed on a PIC.)*

**Action:** correct the OPEN_ITEMS entry, and treat CLKOUT configuration as mandatory on RV-3028 detection rather than a nice-to-have.

---

## 0a. What this says about the part currently fitted — bears on OPEN_ITEMS M3

`DEVELOPMENT_PATH.md` M3 carries three conflicting claims about which RTC is on the board: the BOM says **DS3231MZ+**, `CLAUDE.md` says **RV-3028-C7 at 0x52**, and the July design review raises **RV-8803 at 0x32**. The bench result narrows this without opening the enclosure.

The controller currently keeps correct time from a 1 Hz tick on RB0, and `rtc_init()` only ever writes DS3231 control registers — which an RV-3028 cannot ACK. Combine that with the measurement above:

> **A factory-default RV-3028-C7 cannot produce a 1 Hz tick.** It produces 32.768 kHz. So a board that keeps correct time, with firmware that cannot configure an RV-3028, is **not** running an out-of-the-box RV-3028-C7.

Which leaves two possibilities:

1. **The fitted part is a DS3231MZ+** at 0x68 — matching the BOM — and `rtc_init()` is *not* inert at all; it is doing exactly its job. This is the simplest explanation and makes the working clock evidence rather than coincidence.
2. The fitted part is an RV-3028-C7 whose CLKOUT EEPROM was configured to 1 Hz at some earlier point. Possible, but nothing in the repo records it having been done.

**Decisive test, no disassembly:** `rtc.c` already detects the part by which address ACKs and prints it (`"RV-3028 RTC (Rev 2)"` for 0x52). Read the boot banner on the debug UART — whichever address answers names the fitted part and closes M3 either way. Scoping RB0 for 1 Hz vs 32.768 kHz is the confirming second check.

Worth settling before Rev 2 is ordered, because the two parts need different init paths and fail in opposite directions.

---

## 1. What has to happen at init

The RV-3028 is already detected at runtime by which address ACKs (`rtc.c`, `RTC_ADDR_RV3028 0x52`). On that branch:

1. Read the CLKOUT config register `35h`.
2. If it is already `C5`, **do nothing** — the part is configured.
3. If not, write `C5` and commit it to the configuration EEPROM.
4. Read back after forcing a refresh, to prove it reached EEPROM and not just RAM.

Step 2 is not optional. The configuration EEPROM has **finite write endurance**, so a unit must never be written on every boot.

---

## 2. The register

**`35h` — EEPROM Clkout** (§3.15.4, p.37)

| Bit | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
|---|---|---|---|---|---|---|---|---|
| Name | CLKOE | CLKSY | — | — | PORIE | FD2 | FD1 | FD0 |
| `C0` factory default | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 |
| `C5` for 1 Hz | 1 | 1 | 0 | 0 | 0 | **1** | **0** | **1** |

Only the FD field changes. CLKOE stays 1 (output enabled), CLKSY stays 1 (synchronised enable), PORIE stays 0.

**FD encoding** (§3.15.4 p.37, §4.4.1 p.49)

| FD | Frequency | Path |
|---|---|---|
| `000` | 32.768 kHz — **default on delivery** | Direct from oscillator, **not** offset compensated |
| `001` | 8192 Hz | Divided, offset compensated |
| `010` | 1024 Hz | Divided, offset compensated |
| `011` | 64 Hz | Divided, offset compensated |
| `100` | 32 Hz | Divided, offset compensated |
| **`101`** | **1 Hz** | Divided, offset compensated |
| `110` | Countdown timer interrupt | CLKSY has no effect |
| `111` | CLKOUT held LOW | — |

Note the compensation split (§4.4, p.48): only the **divided** rates get the factory offset correction. Choosing 1 Hz therefore also buys the 1 ppm accuracy the part was specified for; the 32.768 kHz default does not have it.

### The rest of the 0x30–0x37 block — handle with care

The configuration EEPROM is `2Bh` and `30h`–`37h`. Values below are as found on an untouched part.

| Addr | Register | As found | Note |
|---|---|---|---|
| `30h` | **EEPROM Password Enable** | `00` | Password active only when set to 255. `00` = write protection **off**. |
| `31h`–`34h` | **EEPROM Password 0–3** | `00 00 00 00` | 32-bit password. A wrong write here can lock the part permanently. |
| `35h` | EEPROM Clkout | `C0` | The target. Matched the documented default bit-for-bit. |
| `36h` | EEPROM Offset [8:1] | `01` | Factory calibrated. With `37h` bit 7 → EEOffset = 2 steps ≈ +1.9 ppm. |
| `37h` | EEPROM Backup | `10` | FEDE=1, BSM=00 (switchover off), TCE=0. The documented default. |

§3.15.2 p.35 · §3.15.3 p.36 · §3.15.5 p.38 · §3.15.6 p.39

---

## 3. The I2C sequence

Address `0x52`. Write byte `A4`, read byte `A5`. `S` = start, `Sr` = repeated start, `P` = stop.

```
; ---- 0. Compare first. Never write unconditionally on boot.
S A4 35 Sr A5 <rd> NACK P     ; read 35h; if already C5, we are done
S A4 0E Sr A5 <rd> NACK P     ; Status 0Eh: require bit7 EEbusy = 0

; ---- 1. Disable automatic refresh (Control 1 0Fh, bit 3 EERD)
S A4 0F 08 P

; ---- 2. Name the target byte and stage its data
S A4 25 35 P                  ; EEADDR = 35h
S A4 26 C5 P                  ; EEDATA = C5h

; ---- 3. Commit. 00h first is mandatory, then 21h.
S A4 27 00 P
S A4 27 21 P                  ; WRITE ONE EEPROM BYTE, tWRITE ~16 ms

; ---- 4. Poll until idle
S A4 0E Sr A5 <rd> NACK P     ; repeat until bit7 EEbusy = 0

; ---- 5. Restore auto-refresh
S A4 0F 00 P

; ---- 6. Activate. An EEPROM write alone does NOT take effect.
S A4 35 C5 P                  ; RAM mirror is the active zone
```

§3.13 p.34 · §4.6.5 p.55

### Proving it reached EEPROM, not just RAM

Writing only the RAM mirror looks identical on a readback but is lost at the next refresh. Force a reload to tell them apart:

```
S A4 0F 08 P                  ; EERD = 1
S A4 27 00 P
S A4 27 12 P                  ; REFRESH, EEPROM -> RAM, ~3.5 ms
S A4 0E Sr A5 <rd> NACK P     ; wait EEbusy = 0
S A4 0F 00 P                  ; EERD = 0
S A4 35 Sr A5 <rd> NACK P     ; must read C5
```

§4.6.4 p.54

### Why byte-write (`21h`) and not block update (`11h`)

`11h` is the manual's canonical configuration flow (§4.6.3 p.54) and it works, but it commits **all** of `30h`–`37h` from the RAM mirror in one operation. A single corrupted mirror byte at `30h` would permanently write-protect the part, and it burns endurance on the factory-calibrated offset at `36h` for nothing. `21h` names its target byte in EEADDR and physically cannot reach the password registers. Use `21h`.

---

## 4. Gotchas for the driver

- **The RAM mirror is the active zone.** Writing only EEPROM changes nothing until a refresh; writing only RAM is lost at the next one. Do both. (§4.6.9 p.57)
- **EECMD needs `00h` before every real command** — `11h`, `12h`, `21h`, `22h` are ignored without it. (§3.13 p.34)
- **EERD must be 1 before any EEPROM access**, or the internal 24-hour auto-refresh can collide with the command. Clear it afterwards. (§4.6.2 p.54)
- **Changing FD on a running part needs CLKOE toggled 0→1** for a glitch-free transition; the enable is edge-synchronised while CLKSY = 1. Not needed after POR, where CLKOE and FD load together — so this does not affect the normal init path. (§4.4.4 p.50)
- **CLKOUT is tied to VSS in VBACKUP state** regardless of configuration. If the RTC ever runs from backup, the timebase stops dead. (§4.4 p.48)
- **Timings to budget:** POR refresh ~66 ms, single-byte write ~16 ms, block update ~63 ms, refresh ~3.5 ms. Poll EEbusy rather than assuming.
- **0x52 is fixed in silicon.** No address select pins.

### Bus address planning

Not a Rev 2 issue as currently specified — `rtc.h` records Rev 2 as having no EEPROM, and Rev 1's M24M01E sits at `0x50`/`0x51`, which does not collide. Recorded as a design rule for any future change:

The RV-3028's `0x52` sits inside the `1010xxx` block that serial EEPROMs and F-RAMs use. Larger parts consume the low address bits as page selects and swallow the whole range — the **FM24CL16B** on the bench board answers across `0x50`–`0x57`, including `0x52`. When that happens both devices ACK, both drive the bus on a read, and the result is a plausible page of `00` with no error reported. **Before adding any 1010xxx device to a bus with this RTC, check how many addresses it consumes.**

---

## 5. What was actually verified

| Claim | Evidence | Status |
|---|---|---|
| Factory default `35h` = `C0` | Manual default matched measured value bit-for-bit, two parts | Confirmed |
| Default CLKOUT = 32.768 kHz, enabled | Logic analyser on pin 1, two untouched parts, before any I2C write | **Measured** |
| `C5` selects 1 Hz | §3.15.4 p.37 | Cited |
| Write sequence works and persists | Executed; survived power-on refresh reading back `C5` | Confirmed |
| CLKOUT runs at 1 Hz | Logic analyser: **999.9992 ms period, 499.9996 ms high** = +0.8 ppm | **Measured** |

The +0.8 ppm sits inside the part's ±1 ppm specification and confirms the output came from the compensated divider chain rather than the raw oscillator tap.

**Not verified:** the 32.768 kHz-into-INT0 consequence is reasoned from the measured frequency, not observed on a PIC. Worth confirming on Rev 2 bring-up with a deliberately unconfigured part, because it determines what a field failure looks like.

**Unexplained:** on the first bench board, 1 Hz never appeared despite every register reading correct, while 32.768 kHz did. A second untouched board produced 1 Hz immediately on a proven probe placement. Probe contact on the first board was intermittent throughout that session and is the likely cause, but it was not proven. Recorded as open rather than resolved.
