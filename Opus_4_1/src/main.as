subtitle "Microchip MPLAB XC8 C Compiler v2.46 (Free license) build 20240104201356 Og9 "

pagewidth 120

	opt flic

	processor	18F2525
include "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\18f2525.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,f
	movf indf1,w
endm
popf macro arg1
	movf postdec1,f
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
	global	__ramtop
	global	__accesstop
# 54 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTA equ 0F80h ;# 
# 191 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTB equ 0F81h ;# 
# 362 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTC equ 0F82h ;# 
# 537 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTE equ 0F84h ;# 
# 612 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LATA equ 0F89h ;# 
# 724 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LATB equ 0F8Ah ;# 
# 836 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LATC equ 0F8Bh ;# 
# 948 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TRISA equ 0F92h ;# 
# 953 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
DDRA equ 0F92h ;# 
# 1170 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TRISB equ 0F93h ;# 
# 1175 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
DDRB equ 0F93h ;# 
# 1392 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TRISC equ 0F94h ;# 
# 1397 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
DDRC equ 0F94h ;# 
# 1614 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
OSCTUNE equ 0F9Bh ;# 
# 1679 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIE1 equ 0F9Dh ;# 
# 1750 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIR1 equ 0F9Eh ;# 
# 1821 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
IPR1 equ 0F9Fh ;# 
# 1892 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIE2 equ 0FA0h ;# 
# 1958 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIR2 equ 0FA1h ;# 
# 2024 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
IPR2 equ 0FA2h ;# 
# 2090 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EECON1 equ 0FA6h ;# 
# 2156 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EECON2 equ 0FA7h ;# 
# 2163 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EEDATA equ 0FA8h ;# 
# 2170 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EEADR equ 0FA9h ;# 
# 2177 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EEADRH equ 0FAAh ;# 
# 2184 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCSTA equ 0FABh ;# 
# 2189 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCSTA1 equ 0FABh ;# 
# 2394 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXSTA equ 0FACh ;# 
# 2399 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXSTA1 equ 0FACh ;# 
# 2650 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXREG equ 0FADh ;# 
# 2655 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXREG1 equ 0FADh ;# 
# 2662 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCREG equ 0FAEh ;# 
# 2667 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCREG1 equ 0FAEh ;# 
# 2674 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SPBRG equ 0FAFh ;# 
# 2679 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SPBRG1 equ 0FAFh ;# 
# 2686 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SPBRGH equ 0FB0h ;# 
# 2693 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T3CON equ 0FB1h ;# 
# 2805 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR3 equ 0FB2h ;# 
# 2812 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR3L equ 0FB2h ;# 
# 2819 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR3H equ 0FB3h ;# 
# 2826 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CMCON equ 0FB4h ;# 
# 2916 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CVRCON equ 0FB5h ;# 
# 2995 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ECCP1AS equ 0FB6h ;# 
# 3000 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ECCPAS equ 0FB6h ;# 
# 3125 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PWM1CON equ 0FB7h ;# 
# 3130 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ECCP1DEL equ 0FB7h ;# 
# 3165 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
BAUDCON equ 0FB8h ;# 
# 3170 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
BAUDCTL equ 0FB8h ;# 
# 3337 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCP2CON equ 0FBAh ;# 
# 3416 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR2 equ 0FBBh ;# 
# 3423 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR2L equ 0FBBh ;# 
# 3430 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR2H equ 0FBCh ;# 
# 3437 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCP1CON equ 0FBDh ;# 
# 3516 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR1 equ 0FBEh ;# 
# 3523 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR1L equ 0FBEh ;# 
# 3530 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR1H equ 0FBFh ;# 
# 3537 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADCON2 equ 0FC0h ;# 
# 3608 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADCON1 equ 0FC1h ;# 
# 3693 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADCON0 equ 0FC2h ;# 
# 3812 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADRES equ 0FC3h ;# 
# 3819 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADRESL equ 0FC3h ;# 
# 3826 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADRESH equ 0FC4h ;# 
# 3833 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPCON2 equ 0FC5h ;# 
# 3895 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPCON1 equ 0FC6h ;# 
# 3965 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPSTAT equ 0FC7h ;# 
# 4186 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPADD equ 0FC8h ;# 
# 4193 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPBUF equ 0FC9h ;# 
# 4200 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T2CON equ 0FCAh ;# 
# 4298 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PR2 equ 0FCBh ;# 
# 4303 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
MEMCON equ 0FCBh ;# 
# 4408 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR2 equ 0FCCh ;# 
# 4415 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T1CON equ 0FCDh ;# 
# 4518 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR1 equ 0FCEh ;# 
# 4525 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR1L equ 0FCEh ;# 
# 4532 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR1H equ 0FCFh ;# 
# 4539 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCON equ 0FD0h ;# 
# 4672 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
WDTCON equ 0FD1h ;# 
# 4700 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
HLVDCON equ 0FD2h ;# 
# 4705 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LVDCON equ 0FD2h ;# 
# 4970 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
OSCCON equ 0FD3h ;# 
# 5053 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T0CON equ 0FD5h ;# 
# 5130 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR0 equ 0FD6h ;# 
# 5137 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR0L equ 0FD6h ;# 
# 5144 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR0H equ 0FD7h ;# 
# 5151 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
STATUS equ 0FD8h ;# 
# 5222 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR2 equ 0FD9h ;# 
# 5229 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR2L equ 0FD9h ;# 
# 5236 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR2H equ 0FDAh ;# 
# 5243 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PLUSW2 equ 0FDBh ;# 
# 5250 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PREINC2 equ 0FDCh ;# 
# 5257 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTDEC2 equ 0FDDh ;# 
# 5264 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTINC2 equ 0FDEh ;# 
# 5271 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INDF2 equ 0FDFh ;# 
# 5278 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
BSR equ 0FE0h ;# 
# 5285 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR1 equ 0FE1h ;# 
# 5292 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR1L equ 0FE1h ;# 
# 5299 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR1H equ 0FE2h ;# 
# 5306 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PLUSW1 equ 0FE3h ;# 
# 5313 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PREINC1 equ 0FE4h ;# 
# 5320 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTDEC1 equ 0FE5h ;# 
# 5327 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTINC1 equ 0FE6h ;# 
# 5334 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INDF1 equ 0FE7h ;# 
# 5341 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
WREG equ 0FE8h ;# 
# 5353 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR0 equ 0FE9h ;# 
# 5360 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR0L equ 0FE9h ;# 
# 5367 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR0H equ 0FEAh ;# 
# 5374 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PLUSW0 equ 0FEBh ;# 
# 5381 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PREINC0 equ 0FECh ;# 
# 5388 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTDEC0 equ 0FEDh ;# 
# 5395 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTINC0 equ 0FEEh ;# 
# 5402 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INDF0 equ 0FEFh ;# 
# 5409 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INTCON3 equ 0FF0h ;# 
# 5501 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INTCON2 equ 0FF1h ;# 
# 5571 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INTCON equ 0FF2h ;# 
# 5688 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PROD equ 0FF3h ;# 
# 5695 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PRODL equ 0FF3h ;# 
# 5702 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PRODH equ 0FF4h ;# 
# 5709 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TABLAT equ 0FF5h ;# 
# 5718 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTR equ 0FF6h ;# 
# 5725 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTRL equ 0FF6h ;# 
# 5732 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTRH equ 0FF7h ;# 
# 5739 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTRU equ 0FF8h ;# 
# 5748 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCLAT equ 0FF9h ;# 
# 5755 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PC equ 0FF9h ;# 
# 5762 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCL equ 0FF9h ;# 
# 5769 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCLATH equ 0FFAh ;# 
# 5776 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCLATU equ 0FFBh ;# 
# 5783 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
STKPTR equ 0FFCh ;# 
# 5889 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOS equ 0FFDh ;# 
# 5896 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOSL equ 0FFDh ;# 
# 5903 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOSH equ 0FFEh ;# 
# 5910 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOSU equ 0FFFh ;# 
# 54 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTA equ 0F80h ;# 
# 191 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTB equ 0F81h ;# 
# 362 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTC equ 0F82h ;# 
# 537 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTE equ 0F84h ;# 
# 612 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LATA equ 0F89h ;# 
# 724 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LATB equ 0F8Ah ;# 
# 836 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LATC equ 0F8Bh ;# 
# 948 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TRISA equ 0F92h ;# 
# 953 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
DDRA equ 0F92h ;# 
# 1170 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TRISB equ 0F93h ;# 
# 1175 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
DDRB equ 0F93h ;# 
# 1392 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TRISC equ 0F94h ;# 
# 1397 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
DDRC equ 0F94h ;# 
# 1614 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
OSCTUNE equ 0F9Bh ;# 
# 1679 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIE1 equ 0F9Dh ;# 
# 1750 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIR1 equ 0F9Eh ;# 
# 1821 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
IPR1 equ 0F9Fh ;# 
# 1892 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIE2 equ 0FA0h ;# 
# 1958 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIR2 equ 0FA1h ;# 
# 2024 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
IPR2 equ 0FA2h ;# 
# 2090 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EECON1 equ 0FA6h ;# 
# 2156 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EECON2 equ 0FA7h ;# 
# 2163 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EEDATA equ 0FA8h ;# 
# 2170 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EEADR equ 0FA9h ;# 
# 2177 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EEADRH equ 0FAAh ;# 
# 2184 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCSTA equ 0FABh ;# 
# 2189 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCSTA1 equ 0FABh ;# 
# 2394 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXSTA equ 0FACh ;# 
# 2399 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXSTA1 equ 0FACh ;# 
# 2650 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXREG equ 0FADh ;# 
# 2655 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXREG1 equ 0FADh ;# 
# 2662 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCREG equ 0FAEh ;# 
# 2667 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCREG1 equ 0FAEh ;# 
# 2674 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SPBRG equ 0FAFh ;# 
# 2679 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SPBRG1 equ 0FAFh ;# 
# 2686 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SPBRGH equ 0FB0h ;# 
# 2693 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T3CON equ 0FB1h ;# 
# 2805 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR3 equ 0FB2h ;# 
# 2812 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR3L equ 0FB2h ;# 
# 2819 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR3H equ 0FB3h ;# 
# 2826 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CMCON equ 0FB4h ;# 
# 2916 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CVRCON equ 0FB5h ;# 
# 2995 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ECCP1AS equ 0FB6h ;# 
# 3000 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ECCPAS equ 0FB6h ;# 
# 3125 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PWM1CON equ 0FB7h ;# 
# 3130 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ECCP1DEL equ 0FB7h ;# 
# 3165 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
BAUDCON equ 0FB8h ;# 
# 3170 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
BAUDCTL equ 0FB8h ;# 
# 3337 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCP2CON equ 0FBAh ;# 
# 3416 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR2 equ 0FBBh ;# 
# 3423 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR2L equ 0FBBh ;# 
# 3430 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR2H equ 0FBCh ;# 
# 3437 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCP1CON equ 0FBDh ;# 
# 3516 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR1 equ 0FBEh ;# 
# 3523 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR1L equ 0FBEh ;# 
# 3530 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR1H equ 0FBFh ;# 
# 3537 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADCON2 equ 0FC0h ;# 
# 3608 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADCON1 equ 0FC1h ;# 
# 3693 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADCON0 equ 0FC2h ;# 
# 3812 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADRES equ 0FC3h ;# 
# 3819 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADRESL equ 0FC3h ;# 
# 3826 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADRESH equ 0FC4h ;# 
# 3833 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPCON2 equ 0FC5h ;# 
# 3895 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPCON1 equ 0FC6h ;# 
# 3965 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPSTAT equ 0FC7h ;# 
# 4186 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPADD equ 0FC8h ;# 
# 4193 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPBUF equ 0FC9h ;# 
# 4200 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T2CON equ 0FCAh ;# 
# 4298 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PR2 equ 0FCBh ;# 
# 4303 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
MEMCON equ 0FCBh ;# 
# 4408 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR2 equ 0FCCh ;# 
# 4415 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T1CON equ 0FCDh ;# 
# 4518 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR1 equ 0FCEh ;# 
# 4525 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR1L equ 0FCEh ;# 
# 4532 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR1H equ 0FCFh ;# 
# 4539 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCON equ 0FD0h ;# 
# 4672 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
WDTCON equ 0FD1h ;# 
# 4700 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
HLVDCON equ 0FD2h ;# 
# 4705 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LVDCON equ 0FD2h ;# 
# 4970 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
OSCCON equ 0FD3h ;# 
# 5053 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T0CON equ 0FD5h ;# 
# 5130 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR0 equ 0FD6h ;# 
# 5137 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR0L equ 0FD6h ;# 
# 5144 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR0H equ 0FD7h ;# 
# 5151 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
STATUS equ 0FD8h ;# 
# 5222 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR2 equ 0FD9h ;# 
# 5229 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR2L equ 0FD9h ;# 
# 5236 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR2H equ 0FDAh ;# 
# 5243 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PLUSW2 equ 0FDBh ;# 
# 5250 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PREINC2 equ 0FDCh ;# 
# 5257 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTDEC2 equ 0FDDh ;# 
# 5264 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTINC2 equ 0FDEh ;# 
# 5271 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INDF2 equ 0FDFh ;# 
# 5278 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
BSR equ 0FE0h ;# 
# 5285 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR1 equ 0FE1h ;# 
# 5292 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR1L equ 0FE1h ;# 
# 5299 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR1H equ 0FE2h ;# 
# 5306 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PLUSW1 equ 0FE3h ;# 
# 5313 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PREINC1 equ 0FE4h ;# 
# 5320 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTDEC1 equ 0FE5h ;# 
# 5327 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTINC1 equ 0FE6h ;# 
# 5334 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INDF1 equ 0FE7h ;# 
# 5341 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
WREG equ 0FE8h ;# 
# 5353 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR0 equ 0FE9h ;# 
# 5360 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR0L equ 0FE9h ;# 
# 5367 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR0H equ 0FEAh ;# 
# 5374 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PLUSW0 equ 0FEBh ;# 
# 5381 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PREINC0 equ 0FECh ;# 
# 5388 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTDEC0 equ 0FEDh ;# 
# 5395 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTINC0 equ 0FEEh ;# 
# 5402 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INDF0 equ 0FEFh ;# 
# 5409 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INTCON3 equ 0FF0h ;# 
# 5501 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INTCON2 equ 0FF1h ;# 
# 5571 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INTCON equ 0FF2h ;# 
# 5688 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PROD equ 0FF3h ;# 
# 5695 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PRODL equ 0FF3h ;# 
# 5702 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PRODH equ 0FF4h ;# 
# 5709 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TABLAT equ 0FF5h ;# 
# 5718 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTR equ 0FF6h ;# 
# 5725 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTRL equ 0FF6h ;# 
# 5732 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTRH equ 0FF7h ;# 
# 5739 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTRU equ 0FF8h ;# 
# 5748 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCLAT equ 0FF9h ;# 
# 5755 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PC equ 0FF9h ;# 
# 5762 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCL equ 0FF9h ;# 
# 5769 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCLATH equ 0FFAh ;# 
# 5776 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCLATU equ 0FFBh ;# 
# 5783 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
STKPTR equ 0FFCh ;# 
# 5889 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOS equ 0FFDh ;# 
# 5896 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOSL equ 0FFDh ;# 
# 5903 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOSH equ 0FFEh ;# 
# 5910 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOSU equ 0FFFh ;# 
# 54 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTA equ 0F80h ;# 
# 191 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTB equ 0F81h ;# 
# 362 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTC equ 0F82h ;# 
# 537 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTE equ 0F84h ;# 
# 612 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LATA equ 0F89h ;# 
# 724 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LATB equ 0F8Ah ;# 
# 836 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LATC equ 0F8Bh ;# 
# 948 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TRISA equ 0F92h ;# 
# 953 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
DDRA equ 0F92h ;# 
# 1170 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TRISB equ 0F93h ;# 
# 1175 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
DDRB equ 0F93h ;# 
# 1392 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TRISC equ 0F94h ;# 
# 1397 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
DDRC equ 0F94h ;# 
# 1614 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
OSCTUNE equ 0F9Bh ;# 
# 1679 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIE1 equ 0F9Dh ;# 
# 1750 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIR1 equ 0F9Eh ;# 
# 1821 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
IPR1 equ 0F9Fh ;# 
# 1892 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIE2 equ 0FA0h ;# 
# 1958 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIR2 equ 0FA1h ;# 
# 2024 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
IPR2 equ 0FA2h ;# 
# 2090 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EECON1 equ 0FA6h ;# 
# 2156 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EECON2 equ 0FA7h ;# 
# 2163 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EEDATA equ 0FA8h ;# 
# 2170 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EEADR equ 0FA9h ;# 
# 2177 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EEADRH equ 0FAAh ;# 
# 2184 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCSTA equ 0FABh ;# 
# 2189 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCSTA1 equ 0FABh ;# 
# 2394 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXSTA equ 0FACh ;# 
# 2399 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXSTA1 equ 0FACh ;# 
# 2650 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXREG equ 0FADh ;# 
# 2655 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXREG1 equ 0FADh ;# 
# 2662 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCREG equ 0FAEh ;# 
# 2667 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCREG1 equ 0FAEh ;# 
# 2674 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SPBRG equ 0FAFh ;# 
# 2679 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SPBRG1 equ 0FAFh ;# 
# 2686 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SPBRGH equ 0FB0h ;# 
# 2693 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T3CON equ 0FB1h ;# 
# 2805 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR3 equ 0FB2h ;# 
# 2812 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR3L equ 0FB2h ;# 
# 2819 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR3H equ 0FB3h ;# 
# 2826 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CMCON equ 0FB4h ;# 
# 2916 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CVRCON equ 0FB5h ;# 
# 2995 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ECCP1AS equ 0FB6h ;# 
# 3000 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ECCPAS equ 0FB6h ;# 
# 3125 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PWM1CON equ 0FB7h ;# 
# 3130 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ECCP1DEL equ 0FB7h ;# 
# 3165 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
BAUDCON equ 0FB8h ;# 
# 3170 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
BAUDCTL equ 0FB8h ;# 
# 3337 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCP2CON equ 0FBAh ;# 
# 3416 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR2 equ 0FBBh ;# 
# 3423 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR2L equ 0FBBh ;# 
# 3430 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR2H equ 0FBCh ;# 
# 3437 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCP1CON equ 0FBDh ;# 
# 3516 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR1 equ 0FBEh ;# 
# 3523 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR1L equ 0FBEh ;# 
# 3530 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR1H equ 0FBFh ;# 
# 3537 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADCON2 equ 0FC0h ;# 
# 3608 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADCON1 equ 0FC1h ;# 
# 3693 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADCON0 equ 0FC2h ;# 
# 3812 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADRES equ 0FC3h ;# 
# 3819 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADRESL equ 0FC3h ;# 
# 3826 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADRESH equ 0FC4h ;# 
# 3833 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPCON2 equ 0FC5h ;# 
# 3895 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPCON1 equ 0FC6h ;# 
# 3965 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPSTAT equ 0FC7h ;# 
# 4186 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPADD equ 0FC8h ;# 
# 4193 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPBUF equ 0FC9h ;# 
# 4200 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T2CON equ 0FCAh ;# 
# 4298 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PR2 equ 0FCBh ;# 
# 4303 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
MEMCON equ 0FCBh ;# 
# 4408 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR2 equ 0FCCh ;# 
# 4415 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T1CON equ 0FCDh ;# 
# 4518 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR1 equ 0FCEh ;# 
# 4525 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR1L equ 0FCEh ;# 
# 4532 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR1H equ 0FCFh ;# 
# 4539 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCON equ 0FD0h ;# 
# 4672 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
WDTCON equ 0FD1h ;# 
# 4700 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
HLVDCON equ 0FD2h ;# 
# 4705 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LVDCON equ 0FD2h ;# 
# 4970 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
OSCCON equ 0FD3h ;# 
# 5053 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T0CON equ 0FD5h ;# 
# 5130 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR0 equ 0FD6h ;# 
# 5137 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR0L equ 0FD6h ;# 
# 5144 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR0H equ 0FD7h ;# 
# 5151 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
STATUS equ 0FD8h ;# 
# 5222 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR2 equ 0FD9h ;# 
# 5229 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR2L equ 0FD9h ;# 
# 5236 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR2H equ 0FDAh ;# 
# 5243 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PLUSW2 equ 0FDBh ;# 
# 5250 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PREINC2 equ 0FDCh ;# 
# 5257 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTDEC2 equ 0FDDh ;# 
# 5264 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTINC2 equ 0FDEh ;# 
# 5271 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INDF2 equ 0FDFh ;# 
# 5278 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
BSR equ 0FE0h ;# 
# 5285 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR1 equ 0FE1h ;# 
# 5292 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR1L equ 0FE1h ;# 
# 5299 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR1H equ 0FE2h ;# 
# 5306 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PLUSW1 equ 0FE3h ;# 
# 5313 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PREINC1 equ 0FE4h ;# 
# 5320 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTDEC1 equ 0FE5h ;# 
# 5327 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTINC1 equ 0FE6h ;# 
# 5334 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INDF1 equ 0FE7h ;# 
# 5341 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
WREG equ 0FE8h ;# 
# 5353 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR0 equ 0FE9h ;# 
# 5360 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR0L equ 0FE9h ;# 
# 5367 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR0H equ 0FEAh ;# 
# 5374 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PLUSW0 equ 0FEBh ;# 
# 5381 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PREINC0 equ 0FECh ;# 
# 5388 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTDEC0 equ 0FEDh ;# 
# 5395 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTINC0 equ 0FEEh ;# 
# 5402 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INDF0 equ 0FEFh ;# 
# 5409 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INTCON3 equ 0FF0h ;# 
# 5501 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INTCON2 equ 0FF1h ;# 
# 5571 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INTCON equ 0FF2h ;# 
# 5688 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PROD equ 0FF3h ;# 
# 5695 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PRODL equ 0FF3h ;# 
# 5702 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PRODH equ 0FF4h ;# 
# 5709 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TABLAT equ 0FF5h ;# 
# 5718 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTR equ 0FF6h ;# 
# 5725 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTRL equ 0FF6h ;# 
# 5732 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTRH equ 0FF7h ;# 
# 5739 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTRU equ 0FF8h ;# 
# 5748 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCLAT equ 0FF9h ;# 
# 5755 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PC equ 0FF9h ;# 
# 5762 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCL equ 0FF9h ;# 
# 5769 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCLATH equ 0FFAh ;# 
# 5776 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCLATU equ 0FFBh ;# 
# 5783 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
STKPTR equ 0FFCh ;# 
# 5889 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOS equ 0FFDh ;# 
# 5896 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOSL equ 0FFDh ;# 
# 5903 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOSH equ 0FFEh ;# 
# 5910 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOSU equ 0FFFh ;# 
# 54 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTA equ 0F80h ;# 
# 191 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTB equ 0F81h ;# 
# 362 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTC equ 0F82h ;# 
# 537 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PORTE equ 0F84h ;# 
# 612 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LATA equ 0F89h ;# 
# 724 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LATB equ 0F8Ah ;# 
# 836 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LATC equ 0F8Bh ;# 
# 948 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TRISA equ 0F92h ;# 
# 953 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
DDRA equ 0F92h ;# 
# 1170 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TRISB equ 0F93h ;# 
# 1175 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
DDRB equ 0F93h ;# 
# 1392 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TRISC equ 0F94h ;# 
# 1397 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
DDRC equ 0F94h ;# 
# 1614 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
OSCTUNE equ 0F9Bh ;# 
# 1679 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIE1 equ 0F9Dh ;# 
# 1750 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIR1 equ 0F9Eh ;# 
# 1821 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
IPR1 equ 0F9Fh ;# 
# 1892 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIE2 equ 0FA0h ;# 
# 1958 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PIR2 equ 0FA1h ;# 
# 2024 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
IPR2 equ 0FA2h ;# 
# 2090 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EECON1 equ 0FA6h ;# 
# 2156 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EECON2 equ 0FA7h ;# 
# 2163 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EEDATA equ 0FA8h ;# 
# 2170 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EEADR equ 0FA9h ;# 
# 2177 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
EEADRH equ 0FAAh ;# 
# 2184 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCSTA equ 0FABh ;# 
# 2189 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCSTA1 equ 0FABh ;# 
# 2394 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXSTA equ 0FACh ;# 
# 2399 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXSTA1 equ 0FACh ;# 
# 2650 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXREG equ 0FADh ;# 
# 2655 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TXREG1 equ 0FADh ;# 
# 2662 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCREG equ 0FAEh ;# 
# 2667 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCREG1 equ 0FAEh ;# 
# 2674 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SPBRG equ 0FAFh ;# 
# 2679 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SPBRG1 equ 0FAFh ;# 
# 2686 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SPBRGH equ 0FB0h ;# 
# 2693 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T3CON equ 0FB1h ;# 
# 2805 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR3 equ 0FB2h ;# 
# 2812 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR3L equ 0FB2h ;# 
# 2819 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR3H equ 0FB3h ;# 
# 2826 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CMCON equ 0FB4h ;# 
# 2916 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CVRCON equ 0FB5h ;# 
# 2995 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ECCP1AS equ 0FB6h ;# 
# 3000 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ECCPAS equ 0FB6h ;# 
# 3125 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PWM1CON equ 0FB7h ;# 
# 3130 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ECCP1DEL equ 0FB7h ;# 
# 3165 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
BAUDCON equ 0FB8h ;# 
# 3170 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
BAUDCTL equ 0FB8h ;# 
# 3337 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCP2CON equ 0FBAh ;# 
# 3416 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR2 equ 0FBBh ;# 
# 3423 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR2L equ 0FBBh ;# 
# 3430 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR2H equ 0FBCh ;# 
# 3437 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCP1CON equ 0FBDh ;# 
# 3516 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR1 equ 0FBEh ;# 
# 3523 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR1L equ 0FBEh ;# 
# 3530 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
CCPR1H equ 0FBFh ;# 
# 3537 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADCON2 equ 0FC0h ;# 
# 3608 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADCON1 equ 0FC1h ;# 
# 3693 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADCON0 equ 0FC2h ;# 
# 3812 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADRES equ 0FC3h ;# 
# 3819 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADRESL equ 0FC3h ;# 
# 3826 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
ADRESH equ 0FC4h ;# 
# 3833 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPCON2 equ 0FC5h ;# 
# 3895 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPCON1 equ 0FC6h ;# 
# 3965 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPSTAT equ 0FC7h ;# 
# 4186 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPADD equ 0FC8h ;# 
# 4193 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
SSPBUF equ 0FC9h ;# 
# 4200 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T2CON equ 0FCAh ;# 
# 4298 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PR2 equ 0FCBh ;# 
# 4303 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
MEMCON equ 0FCBh ;# 
# 4408 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR2 equ 0FCCh ;# 
# 4415 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T1CON equ 0FCDh ;# 
# 4518 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR1 equ 0FCEh ;# 
# 4525 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR1L equ 0FCEh ;# 
# 4532 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR1H equ 0FCFh ;# 
# 4539 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
RCON equ 0FD0h ;# 
# 4672 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
WDTCON equ 0FD1h ;# 
# 4700 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
HLVDCON equ 0FD2h ;# 
# 4705 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
LVDCON equ 0FD2h ;# 
# 4970 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
OSCCON equ 0FD3h ;# 
# 5053 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
T0CON equ 0FD5h ;# 
# 5130 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR0 equ 0FD6h ;# 
# 5137 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR0L equ 0FD6h ;# 
# 5144 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TMR0H equ 0FD7h ;# 
# 5151 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
STATUS equ 0FD8h ;# 
# 5222 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR2 equ 0FD9h ;# 
# 5229 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR2L equ 0FD9h ;# 
# 5236 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR2H equ 0FDAh ;# 
# 5243 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PLUSW2 equ 0FDBh ;# 
# 5250 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PREINC2 equ 0FDCh ;# 
# 5257 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTDEC2 equ 0FDDh ;# 
# 5264 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTINC2 equ 0FDEh ;# 
# 5271 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INDF2 equ 0FDFh ;# 
# 5278 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
BSR equ 0FE0h ;# 
# 5285 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR1 equ 0FE1h ;# 
# 5292 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR1L equ 0FE1h ;# 
# 5299 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR1H equ 0FE2h ;# 
# 5306 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PLUSW1 equ 0FE3h ;# 
# 5313 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PREINC1 equ 0FE4h ;# 
# 5320 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTDEC1 equ 0FE5h ;# 
# 5327 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTINC1 equ 0FE6h ;# 
# 5334 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INDF1 equ 0FE7h ;# 
# 5341 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
WREG equ 0FE8h ;# 
# 5353 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR0 equ 0FE9h ;# 
# 5360 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR0L equ 0FE9h ;# 
# 5367 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
FSR0H equ 0FEAh ;# 
# 5374 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PLUSW0 equ 0FEBh ;# 
# 5381 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PREINC0 equ 0FECh ;# 
# 5388 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTDEC0 equ 0FEDh ;# 
# 5395 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
POSTINC0 equ 0FEEh ;# 
# 5402 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INDF0 equ 0FEFh ;# 
# 5409 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INTCON3 equ 0FF0h ;# 
# 5501 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INTCON2 equ 0FF1h ;# 
# 5571 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
INTCON equ 0FF2h ;# 
# 5688 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PROD equ 0FF3h ;# 
# 5695 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PRODL equ 0FF3h ;# 
# 5702 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PRODH equ 0FF4h ;# 
# 5709 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TABLAT equ 0FF5h ;# 
# 5718 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTR equ 0FF6h ;# 
# 5725 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTRL equ 0FF6h ;# 
# 5732 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTRH equ 0FF7h ;# 
# 5739 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TBLPTRU equ 0FF8h ;# 
# 5748 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCLAT equ 0FF9h ;# 
# 5755 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PC equ 0FF9h ;# 
# 5762 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCL equ 0FF9h ;# 
# 5769 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCLATH equ 0FFAh ;# 
# 5776 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
PCLATU equ 0FFBh ;# 
# 5783 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
STKPTR equ 0FFCh ;# 
# 5889 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOS equ 0FFDh ;# 
# 5896 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOSL equ 0FFDh ;# 
# 5903 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOSH equ 0FFEh ;# 
# 5910 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f2525.h"
TOSU equ 0FFFh ;# 
	debug_source C
	FNCALL	_main,_beep
	FNCALL	_main,_eeprom_init
	FNCALL	_main,_encoder_init
	FNCALL	_main,_lcd_clear
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_print
	FNCALL	_main,_lcd_set_cursor
	FNCALL	_main,_menu_draw_input
	FNCALL	_main,_menu_draw_options
	FNCALL	_main,_menu_draw_setup
	FNCALL	_main,_menu_handle_button
	FNCALL	_main,_menu_handle_encoder
	FNCALL	_main,_menu_init
	FNCALL	_main,_menu_update_edit_value
	FNCALL	_main,_sprintf
	FNCALL	_main,_system_init
	FNCALL	_main,_uart_init
	FNCALL	_main,_uart_println
	FNCALL	_uart_println,_uart_print
	FNCALL	_uart_println,_uart_write
	FNCALL	_uart_print,_uart_write
	FNCALL	_menu_update_edit_value,_get_item_options
	FNCALL	_menu_update_edit_value,_lcd_print
	FNCALL	_menu_update_edit_value,_lcd_set_cursor
	FNCALL	_menu_update_edit_value,_strcpy
	FNCALL	_menu_update_edit_value,_strlen
	FNCALL	_menu_handle_encoder,_get_item_options
	FNCALL	_menu_handle_button,_beep
	FNCALL	_menu_handle_button,_get_item_options
	FNCALL	_menu_handle_button,_menu_draw_input
	FNCALL	_menu_handle_button,_menu_draw_options
	FNCALL	_menu_handle_button,_menu_draw_setup
	FNCALL	_menu_handle_button,_rebuild_input_menu
	FNCALL	_menu_handle_button,_save_current_config
	FNCALL	_menu_handle_button,_strcmp
	FNCALL	_menu_handle_button,_strcpy
	FNCALL	_rebuild_input_menu,___lwdiv
	FNCALL	_rebuild_input_menu,___lwmod
	FNCALL	_rebuild_input_menu,_memcpy
	FNCALL	_rebuild_input_menu,_sprintf
	FNCALL	_rebuild_input_menu,_strcpy
	FNCALL	_menu_draw_setup,_lcd_clear_line
	FNCALL	_menu_draw_setup,_lcd_print
	FNCALL	_menu_draw_setup,_lcd_print_at
	FNCALL	_menu_draw_setup,_strlen
	FNCALL	_menu_draw_options,_lcd_clear_line
	FNCALL	_menu_draw_options,_lcd_print
	FNCALL	_menu_draw_options,_lcd_print_at
	FNCALL	_menu_draw_input,_get_item_options
	FNCALL	_menu_draw_input,_lcd_clear_line
	FNCALL	_menu_draw_input,_lcd_print
	FNCALL	_menu_draw_input,_lcd_print_at
	FNCALL	_menu_draw_input,_lcd_set_cursor
	FNCALL	_menu_draw_input,_sprintf
	FNCALL	_menu_draw_input,_strcmp
	FNCALL	_menu_draw_input,_strcpy
	FNCALL	_menu_draw_input,_strlen
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_sprintf,___wmul
	FNCALL	_sprintf,_isdigit
	FNCALL	_lcd_print_at,_lcd_print
	FNCALL	_lcd_print_at,_lcd_set_cursor
	FNCALL	_lcd_clear_line,_lcd_print
	FNCALL	_lcd_clear_line,_lcd_set_cursor
	FNCALL	_lcd_set_cursor,_lcd_cmd
	FNCALL	_lcd_print,_lcd_data
	FNCALL	_lcd_data,_lcd_write_nibble
	FNCALL	_lcd_init,_lcd_cmd
	FNCALL	_lcd_init,_lcd_write_nibble
	FNCALL	_lcd_clear,_lcd_cmd
	FNCALL	_lcd_cmd,_lcd_write_nibble
	FNCALL	_eeprom_init,_calculate_config_checksum
	FNCALL	_eeprom_init,_eeprom_read_block
	FNCALL	_eeprom_init,_eeprom_read_word
	FNCALL	_eeprom_init,_load_factory_defaults
	FNCALL	_eeprom_init,_save_current_config
	FNCALL	_eeprom_init,_sync_menu_variables
	FNCALL	_save_current_config,_calculate_config_checksum
	FNCALL	_save_current_config,_eeprom_write_block
	FNCALL	_save_current_config,_eeprom_write_word
	FNCALL	_eeprom_write_word,_eeprom_write_byte
	FNCALL	_eeprom_write_block,_eeprom_write_byte
	FNCALL	_load_factory_defaults,_memcpy
	FNCALL	_eeprom_read_word,_eeprom_read_byte
	FNCALL	_eeprom_read_block,_eeprom_read_byte
	FNROOT	_main
	FNCALL	intlevel2,_isr
	global	intlevel2
	FNROOT	intlevel2
	global	_last_btn
	global	_enable_edit_flag
	global	_options_menu
	global	menu_draw_setup@F2446
	global	_value_scale4
	global	_value_back
	global	menu_draw_setup@F2444
	global	_value_sensor
	global	_value_high_tbp
	global	_value_high_temp
	global	_value_low_pressure
	global	_value_hi_pressure
	global	_value_display
	global	_value_rlyslp
	global	_value_rlyplp
	global	_value_rlyhigh
	global	_value_slpbp
	global	_value_plpbp
	global	_value_highbp
	global	_value_scale20
	global	_value_enable
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"src\encoder.c"
	line	19

;initializer for _last_btn
	db	low(01h)
	file	"src\menu.c"
	line	16

;initializer for _enable_edit_flag
	db	low(01h)
psect	idataBANK0,class=CODE,space=0,delta=1,noexec
global __pidataBANK0
__pidataBANK0:
	line	37

;initializer for _options_menu
		db	low(STR_23)
	db	high(STR_23)

		db	low(STR_24)
	db	high(STR_24)

		db	low(STR_25)
	db	high(STR_25)

		db	low(STR_26)
	db	high(STR_26)

		db	low(STR_27)
	db	high(STR_27)

	line	747

;initializer for menu_draw_setup@F2446
		db	low(STR_120)
	db	high(STR_120)

		db	low(STR_121)
	db	high(STR_121)

		db	low(STR_122)
	db	high(STR_122)

	line	47

;initializer for _value_scale4
	db	low(030h)
	db	low(030h)
	db	low(030h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	line	56

;initializer for _value_back
	db	low(042h)
	db	low(061h)
	db	low(063h)
	db	low(06Bh)
	db	low(0)
psect	idataBANK1,class=CODE,space=0,delta=1,noexec
global __pidataBANK1
__pidataBANK1:
	line	739

;initializer for menu_draw_setup@F2444
		db	low(STR_115)
	db	high(STR_115)

		db	low(STR_116)
	db	high(STR_116)

		db	low(STR_117)
	db	high(STR_117)

		db	low(STR_118)
	db	high(STR_118)

		db	low(STR_119)
	db	high(STR_119)

	line	62

;initializer for _value_flow_type
	db	low(044h)
	db	low(069h)
	db	low(067h)
	db	low(069h)
	db	low(074h)
	db	low(061h)
	db	low(06Ch)
	db	low(0)
	db   0
	db   0
	line	46

;initializer for _value_sensor
	db	low(050h)
	db	low(072h)
	db	low(065h)
	db	low(073h)
	db	low(073h)
	db	low(075h)
	db	low(072h)
	db	low(065h)
	db	low(0)
	db   0
	db   0
	db   0
	line	68

;initializer for _value_high_tbp
	db	low(030h)
	db	low(031h)
	db	low(03Ah)
	db	low(030h)
	db	low(030h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	line	61

;initializer for _value_high_temp
	db	low(038h)
	db	low(035h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	line	60

;initializer for _value_low_pressure
	db	low(035h)
	db	low(030h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	line	59

;initializer for _value_hi_pressure
	db	low(031h)
	db	low(035h)
	db	low(030h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	line	55

;initializer for _value_display
	db	low(053h)
	db	low(068h)
	db	low(06Fh)
	db	low(077h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	db   0
	line	54

;initializer for _value_rlyslp
	db	low(050h)
	db	low(075h)
	db	low(06Ch)
	db	low(073h)
	db	low(065h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	line	53

;initializer for _value_rlyplp
	db	low(04Ch)
	db	low(061h)
	db	low(074h)
	db	low(063h)
	db	low(068h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	line	52

;initializer for _value_rlyhigh
	db	low(04Ch)
	db	low(061h)
	db	low(074h)
	db	low(063h)
	db	low(068h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	line	51

;initializer for _value_slpbp
	db	low(030h)
	db	low(030h)
	db	low(03Ah)
	db	low(030h)
	db	low(035h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	line	50

;initializer for _value_plpbp
	db	low(030h)
	db	low(030h)
	db	low(03Ah)
	db	low(033h)
	db	low(030h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	line	49

;initializer for _value_highbp
	db	low(030h)
	db	low(035h)
	db	low(03Ah)
	db	low(030h)
	db	low(030h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	line	48

;initializer for _value_scale20
	db	low(031h)
	db	low(030h)
	db	low(030h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	line	45

;initializer for _value_enable
	db	low(045h)
	db	low(06Eh)
	db	low(061h)
	db	low(062h)
	db	low(06Ch)
	db	low(065h)
	db	low(064h)
	db	low(0)
	db   0
	db   0
psect	idataBANK2,class=CODE,space=0,delta=1,noexec
global __pidataBANK2
__pidataBANK2:
	line	67

;initializer for _value_low_flow_bp
	db	low(030h)
	db	low(030h)
	db	low(03Ah)
	db	low(033h)
	db	low(030h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	line	66

;initializer for _value_no_flow_bp
	db	low(030h)
	db	low(030h)
	db	low(03Ah)
	db	low(033h)
	db	low(030h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	line	65

;initializer for _value_low_flow
	db	low(033h)
	db	low(030h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	line	64

;initializer for _value_no_flow
	db	low(04Ch)
	db	low(06Fh)
	db	low(077h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	line	63

;initializer for _value_flow_units
	db	low(025h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
psect	mediumconst,class=MEDIUMCONST,space=0,reloc=2,noexec
global __pmediumconst
__pmediumconst:
	db	0
	file	"src\menu.c"
	line	115
	global	_flow_analog_template
_flow_analog_template:
		db	low(STR_59)
	db	high(STR_59)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_60)
	db	high(STR_60)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_61)
	db	high(STR_61)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_62)
	db	high(STR_62)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_63)
	db	high(STR_63)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_64)
	db	high(STR_64)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_65)
	db	high(STR_65)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_66)
	db	high(STR_66)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_67)
	db	high(STR_67)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_68)
	db	high(STR_68)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_69)
	db	high(STR_69)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_flow_analog_template
__end_of_flow_analog_template:
psect	mediumconst
	file	"src\menu.c"
	line	104
	global	_flow_digital_template
_flow_digital_template:
		db	low(STR_51)
	db	high(STR_51)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_52)
	db	high(STR_52)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_53)
	db	high(STR_53)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_54)
	db	high(STR_54)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_55)
	db	high(STR_55)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_56)
	db	high(STR_56)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_57)
	db	high(STR_57)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_58)
	db	high(STR_58)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_flow_digital_template
__end_of_flow_digital_template:
	global	_enc_table
psect	mediumconst
	file	"src\encoder.c"
	line	22
_enc_table:
	db	low(0)
	db	low(-1)
	db	low(01h)
	db	low(0)
	db	low(01h)
	db	low(0)
	db	low(0)
	db	low(-1)
	db	low(-1)
	db	low(0)
	db	low(0)
	db	low(01h)
	db	low(0)
	db	low(01h)
	db	low(-1)
	db	low(0)
	global __end_of_enc_table
__end_of_enc_table:
	global	_dpowers
psect	mediumconst
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	358
_dpowers:
	dw	(01h)&0ffffh
	dw	(0Ah)&0ffffh
	dw	(064h)&0ffffh
	dw	(03E8h)&0ffffh
	dw	(02710h)&0ffffh
	global __end_of_dpowers
__end_of_dpowers:
	global	_factory_defaults
psect	mediumconst
	file	"src\eeprom.c"
	line	11
_factory_defaults:
	db	low(01h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(01h)
	db	low(0)
	db	low(0)
	db	low(0)
	dw	(04h)&0ffffh
	dw	(014h)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(096h)&0ffffh
	dw	(012Ch)&0ffffh
	dw	(01Eh)&0ffffh
	dw	(05h)&0ffffh
	dw	(0)&0ffffh
	dw	(01Eh)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	db	low(0)
	db	low(0)
	db	low(01h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	dw	(0) & 0xffff
	dw	highword(0)
	dw	(0) & 0xffff
	dw	highword(0)
	dw	(0) & 0xffff
	dw	highword(0)
	dw	(0) & 0xffff
	dw	highword(0)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db	low(01h)
	db	low(01h)
	db	low(0)
	db	low(0)
	db	low(01h)
	db	low(0)
	db	low(0)
	db	low(0)
	dw	(0)&0ffffh
	dw	(064h)&0ffffh
	dw	(-10)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(055h)&0ffffh
	dw	(03Ch)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	dw	(0) & 0xffff
	dw	highword(0)
	dw	(0) & 0xffff
	dw	highword(0)
	dw	(0) & 0xffff
	dw	highword(0)
	dw	(0) & 0xffff
	dw	highword(0)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db	low(01h)
	db	low(02h)
	db	low(01h)
	db	low(0)
	db	low(01h)
	db	low(0)
	db	low(0)
	db	low(0)
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(032h)&0ffffh
	dw	(01Eh)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	dw	(0) & 0xffff
	dw	highword(0)
	dw	(0) & 0xffff
	dw	highword(0)
	dw	(0) & 0xffff
	dw	highword(0)
	dw	(0) & 0xffff
	dw	highword(0)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	global __end_of_factory_defaults
__end_of_factory_defaults:
	global	_system_defaults
psect	mediumconst
	file	"src\eeprom.c"
	line	77
_system_defaults:
	db	low(01h)
	db	low(01Eh)
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	db	low(01h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(05h)
	db	low(05h)
	dw	(03Ch)&0ffffh
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	dw	(064h)&0ffffh
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	global __end_of_system_defaults
__end_of_system_defaults:
	global	_pressure_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	75
_pressure_menu_template:
		db	low(STR_28)
	db	high(STR_28)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_29)
	db	high(STR_29)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_30)
	db	high(STR_30)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_31)
	db	high(STR_31)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_32)
	db	high(STR_32)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_33)
	db	high(STR_33)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_34)
	db	high(STR_34)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_35)
	db	high(STR_35)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_36)
	db	high(STR_36)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_37)
	db	high(STR_37)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_38)
	db	high(STR_38)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_39)
	db	high(STR_39)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_40)
	db	high(STR_40)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_41)
	db	high(STR_41)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_pressure_menu_template
__end_of_pressure_menu_template:
	global	_temp_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	92
_temp_menu_template:
		db	low(STR_42)
	db	high(STR_42)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_43)
	db	high(STR_43)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_44)
	db	high(STR_44)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_45)
	db	high(STR_45)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_46)
	db	high(STR_46)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_47)
	db	high(STR_47)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_48)
	db	high(STR_48)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_49)
	db	high(STR_49)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_50)
	db	high(STR_50)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_temp_menu_template
__end_of_temp_menu_template:
	global	_menu_item_options
psect	mediumconst
	file	"src\menu.c"
	line	28
_menu_item_options:
	db	low(0)
	db	low(02h)
		db	low(STR_13)
	db	high(STR_13)

		db	low(STR_14)
	db	high(STR_14)

		db	low(STR_15)
	db	high(STR_15)

		db	low(STR_16)
	db	high(STR_16)

		db	low(STR_17)
	db	high(STR_17)

	db	low(01h)
	db	low(03h)
		db	low(STR_18)
	db	high(STR_18)

		db	low(STR_19)
	db	high(STR_19)

		db	low(STR_20)
	db	high(STR_20)

		db	low(STR_21)
	db	high(STR_21)

		db	low(STR_22)
	db	high(STR_22)

	global __end_of_menu_item_options
__end_of_menu_item_options:
	global	_enc_table
	global	_dpowers
	global	_factory_defaults
	global	_system_defaults
	global	_pressure_menu_template
	global	_temp_menu_template
	global	_menu_item_options
	global	_button_hold_ms
	global	_current_input
	global	_btn_debounce
	global	_enc_accumulator
	global	_enc_state
	global	_button_pressed
	global	_save_pending
	global	_sensor_edit_flag
	global	_input_config
	global	_menu
	global	main@blink_timer
	global	main@encoder_activity_timer
	global	_encoder_count
	global	_current_menu
	global	_button_event
	global	_input_menu
	global	_original_value
	global	_system_config
	global	_EECON2
_EECON2	set	0xFA7
	global	_EEDATA
_EEDATA	set	0xFA8
	global	_EEADRH
_EEADRH	set	0xFAA
	global	_LATAbits
_LATAbits	set	0xF89
	global	_LATCbits
_LATCbits	set	0xF8B
	global	_OSCCONbits
_OSCCONbits	set	0xFD3
	global	_TXSTAbits
_TXSTAbits	set	0xFAC
	global	_PORTBbits
_PORTBbits	set	0xF81
	global	_LATA
_LATA	set	0xF89
	global	_TRISCbits
_TRISCbits	set	0xF94
	global	_OSCTUNE
_OSCTUNE	set	0xF9B
	global	_RCSTA
_RCSTA	set	0xFAB
	global	_TXSTA
_TXSTA	set	0xFAC
	global	_TXREG
_TXREG	set	0xFAD
	global	_SPBRG
_SPBRG	set	0xFAF
	global	_BAUDCON
_BAUDCON	set	0xFB8
	global	_ADCON1
_ADCON1	set	0xFC1
	global	_OSCCON
_OSCCON	set	0xFD3
	global	_SPBRGH
_SPBRGH	set	0xFB0
	global	_T0CON
_T0CON	set	0xFD5
	global	_TMR0L
_TMR0L	set	0xFD6
	global	_INTCON2bits
_INTCON2bits	set	0xFF1
	global	_EECON1bits
_EECON1bits	set	0xFA6
	global	_EEADR
_EEADR	set	0xFA9
	global	_TRISA
_TRISA	set	0xF92
	global	_TRISBbits
_TRISBbits	set	0xF93
	global	_LATC
_LATC	set	0xF8B
	global	_LATB
_LATB	set	0xF8A
	global	_INTCONbits
_INTCONbits	set	0xFF2
	
STR_1:
	db	61	;'='
	db	61	;'='
	db	61	;'='
	db	32
	db	73	;'I'
	db	82	;'R'
	db	82	;'R'
	db	73	;'I'
	db	83	;'S'
	db	89	;'Y'
	db	83	;'S'
	db	32
	db	77	;'M'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	32
	db	83	;'S'
	db	121	;'y'
	db	115	;'s'
	db	116	;'t'
	db	101	;'e'
	db	109	;'m'
	db	32
	db	61	;'='
	db	61	;'='
	db	61	;'='
	db	0
	
STR_7:
	db	87	;'W'
	db	114	;'r'
	db	105	;'i'
	db	116	;'t'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	119	;'w'
	db	101	;'e'
	db	108	;'l'
	db	99	;'c'
	db	111	;'o'
	db	109	;'m'
	db	101	;'e'
	db	32
	db	109	;'m'
	db	101	;'e'
	db	115	;'s'
	db	115	;'s'
	db	97	;'a'
	db	103	;'g'
	db	101	;'e'
	db	0
	
STR_2:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	32
	db	84	;'T'
	db	101	;'e'
	db	115	;'s'
	db	116	;'t'
	db	58	;':'
	db	32
	db	87	;'W'
	db	114	;'r'
	db	105	;'i'
	db	116	;'t'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	84	;'T'
	db	69	;'E'
	db	83	;'S'
	db	84	;'T'
	db	0
	
STR_11:
	db	69	;'E'
	db	110	;'n'
	db	99	;'c'
	db	111	;'o'
	db	100	;'d'
	db	101	;'e'
	db	114	;'r'
	db	58	;':'
	db	32
	db	37
	db	100	;'d'
	db	44
	db	32
	db	68	;'D'
	db	101	;'e'
	db	108	;'l'
	db	116	;'t'
	db	97	;'a'
	db	58	;':'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_5:
	db	69	;'E'
	db	110	;'n'
	db	99	;'c'
	db	111	;'o'
	db	100	;'d'
	db	101	;'e'
	db	114	;'r'
	db	32
	db	105	;'i'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	32
	db	99	;'c'
	db	111	;'o'
	db	109	;'m'
	db	112	;'p'
	db	108	;'l'
	db	101	;'e'
	db	116	;'t'
	db	101	;'e'
	db	0
	
STR_8:
	db	80	;'P'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	115	;'s'
	db	116	;'t'
	db	97	;'a'
	db	114	;'r'
	db	116	;'t'
	db	117	;'u'
	db	112	;'p'
	db	32
	db	98	;'b'
	db	101	;'e'
	db	101	;'e'
	db	112	;'p'
	db	115	;'s'
	db	0
	
STR_9:
	db	83	;'S'
	db	116	;'t'
	db	97	;'a'
	db	114	;'r'
	db	116	;'t'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	79	;'O'
	db	80	;'P'
	db	84	;'T'
	db	73	;'I'
	db	79	;'O'
	db	78	;'N'
	db	83	;'S'
	db	32
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	0
	
STR_70:
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	32
	db	0
	
STR_6:
	db	77	;'M'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	32
	db	105	;'i'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	32
	db	99	;'c'
	db	111	;'o'
	db	109	;'m'
	db	112	;'p'
	db	108	;'l'
	db	101	;'e'
	db	116	;'t'
	db	101	;'e'
	db	0
	
STR_10:
	db	69	;'E'
	db	110	;'n'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	109	;'m'
	db	97	;'a'
	db	105	;'i'
	db	110	;'n'
	db	32
	db	108	;'l'
	db	111	;'o'
	db	111	;'o'
	db	112	;'p'
	db	0
	
STR_12:
	db	66	;'B'
	db	117	;'u'
	db	116	;'t'
	db	116	;'t'
	db	111	;'o'
	db	110	;'n'
	db	32
	db	101	;'e'
	db	118	;'v'
	db	101	;'e'
	db	110	;'n'
	db	116	;'t'
	db	58	;':'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_4:
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	105	;'i'
	db	97	;'a'
	db	108	;'l'
	db	105	;'i'
	db	122	;'z'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	46
	db	46
	db	46
	db	0
	
STR_34:
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	32
	db	80	;'P'
	db	114	;'r'
	db	101	;'e'
	db	115	;'s'
	db	115	;'s'
	db	117	;'u'
	db	114	;'r'
	db	101	;'e'
	db	0
	
STR_25:
	db	85	;'U'
	db	116	;'t'
	db	105	;'i'
	db	108	;'l'
	db	105	;'i'
	db	116	;'t'
	db	121	;'y'
	db	32
	db	77	;'M'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	0
	
STR_3:
	db	73	;'I'
	db	82	;'R'
	db	82	;'R'
	db	73	;'I'
	db	83	;'S'
	db	89	;'Y'
	db	83	;'S'
	db	32
	db	118	;'v'
	db	49	;'1'
	db	46
	db	48	;'0'
	db	0
	
STR_66:
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	32
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_32:
	db	72	;'H'
	db	105	;'i'
	db	32
	db	80	;'P'
	db	114	;'r'
	db	101	;'e'
	db	115	;'s'
	db	115	;'s'
	db	117	;'u'
	db	114	;'r'
	db	101	;'e'
	db	0
	
STR_31:
	db	83	;'S'
	db	99	;'c'
	db	97	;'a'
	db	108	;'l'
	db	101	;'e'
	db	32
	db	50	;'2'
	db	48	;'0'
	db	109	;'m'
	db	65	;'A'
	db	0
	
STR_55:
	db	78	;'N'
	db	111	;'o'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	32
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_24:
	db	83	;'S'
	db	101	;'e'
	db	116	;'t'
	db	117	;'u'
	db	112	;'p'
	db	32
	db	77	;'M'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	0
	
STR_30:
	db	83	;'S'
	db	99	;'c'
	db	97	;'a'
	db	108	;'l'
	db	101	;'e'
	db	32
	db	52	;'4'
	db	109	;'m'
	db	65	;'A'
	db	0
	
STR_78:
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	58	;':'
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	0
	
STR_46:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	84	;'T'
	db	101	;'e'
	db	109	;'m'
	db	112	;'p'
	db	0
	
STR_23:
	db	77	;'M'
	db	97	;'a'
	db	105	;'i'
	db	110	;'n'
	db	32
	db	77	;'M'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	0
	
STR_33:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_47:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	84	;'T'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_101:
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_13:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_84:
	db	78	;'N'
	db	111	;'o'
	db	116	;'t'
	db	32
	db	85	;'U'
	db	115	;'s'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_37:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	0
	
STR_65:
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_115:
	db	73	;'I'
	db	110	;'n'
	db	112	;'p'
	db	117	;'u'
	db	116	;'t'
	db	32
	db	49	;'1'
	db	0
	
STR_116:
	db	73	;'I'
	db	110	;'n'
	db	112	;'p'
	db	117	;'u'
	db	116	;'t'
	db	32
	db	50	;'2'
	db	0
	
STR_117:
	db	73	;'I'
	db	110	;'n'
	db	112	;'p'
	db	117	;'u'
	db	116	;'t'
	db	32
	db	51	;'3'
	db	0
	
STR_39:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_98:
	db	79	;'O'
	db	80	;'P'
	db	84	;'T'
	db	73	;'I'
	db	79	;'O'
	db	78	;'N'
	db	83	;'S'
	db	0
	
STR_14:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_38:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_54:
	db	78	;'N'
	db	111	;'o'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_40:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	0
	
STR_125:
	db	40
	db	110	;'n'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	41
	db	0
	
STR_28:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	0
	
STR_29:
	db	83	;'S'
	db	101	;'e'
	db	110	;'n'
	db	115	;'s'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_35:
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_36:
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_114:
	db	83	;'S'
	db	69	;'E'
	db	84	;'T'
	db	85	;'U'
	db	80	;'P'
	db	0
	
STR_83:
	db	80	;'P'
	db	117	;'u'
	db	108	;'l'
	db	115	;'s'
	db	101	;'e'
	db	0
	
STR_82:
	db	76	;'L'
	db	97	;'a'
	db	116	;'t'
	db	99	;'c'
	db	104	;'h'
	db	0
	
STR_118:
	db	67	;'C'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_102:
	db	69	;'E'
	db	114	;'r'
	db	114	;'r'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_62:
	db	85	;'U'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	115	;'s'
	db	0
	
STR_26:
	db	65	;'A'
	db	98	;'b'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_92:
	db	72	;'H'
	db	105	;'i'
	db	100	;'d'
	db	101	;'e'
	db	0
	
STR_53:
	db	84	;'T'
	db	121	;'y'
	db	112	;'p'
	db	101	;'e'
	db	0
	
STR_41:
	db	66	;'B'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_27:
	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	0
	
STR_91:
	db	83	;'S'
	db	104	;'h'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_71:
	db	37
	db	115	;'s'
	db	0
	
STR_106:
	db	40
	db	0
	
STR_99:
	db	91	;'['
	db	0
	
STR_100:
	db	93	;']'
	db	0
STR_49	equ	STR_40+0
STR_57	equ	STR_40+0
STR_68	equ	STR_40+0
STR_20	equ	STR_54+3
STR_122	equ	STR_54+3
STR_56	equ	STR_38+0
STR_67	equ	STR_38+0
STR_43	equ	STR_29+0
STR_52	equ	STR_29+0
STR_60	equ	STR_29+0
STR_109	equ	STR_102+0
STR_19	equ	STR_46+5
STR_93	equ	STR_46+5
STR_121	equ	STR_46+5
STR_50	equ	STR_41+0
STR_58	equ	STR_41+0
STR_69	equ	STR_41+0
STR_119	equ	STR_41+0
STR_48	equ	STR_37+0
STR_85	equ	STR_82+0
STR_88	equ	STR_82+0
STR_86	equ	STR_83+0
STR_89	equ	STR_83+0
STR_18	equ	STR_32+3
STR_74	equ	STR_32+3
STR_120	equ	STR_32+3
STR_61	equ	STR_53+0
STR_42	equ	STR_28+0
STR_51	equ	STR_28+0
STR_59	equ	STR_28+0
STR_87	equ	STR_84+0
STR_90	equ	STR_84+0
STR_73	equ	STR_13+0
STR_72	equ	STR_14+0
STR_80	equ	STR_78+0
STR_81	equ	STR_78+0
STR_97	equ	STR_78+0
STR_75	equ	STR_11+20
STR_76	equ	STR_11+20
STR_77	equ	STR_11+20
STR_79	equ	STR_11+20
STR_94	equ	STR_11+20
STR_95	equ	STR_11+20
STR_96	equ	STR_11+20
STR_107	equ	STR_100+0
STR_124	equ	STR_100+0
STR_105	equ	STR_99+0
STR_123	equ	STR_99+0
STR_44	equ	STR_30+0
STR_63	equ	STR_30+0
STR_45	equ	STR_31+0
STR_64	equ	STR_31+0
STR_108	equ	STR_125+5
STR_113	equ	STR_125+5
STR_112	equ	STR_106+0
STR_111	equ	STR_70+10
STR_103	equ	STR_70+15
STR_110	equ	STR_70+15
STR_15	equ	STR_70+20
STR_16	equ	STR_70+20
STR_17	equ	STR_70+20
STR_21	equ	STR_70+20
STR_22	equ	STR_70+20
STR_104	equ	STR_70+20
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = off
	config default_idlocs  = off
	config OSC = "INTIO67"
	config FCMEN = "OFF"
	config IESO = "OFF"
	config PWRT = "ON"
	config BOREN = "ON"
	config WDT = "OFF"
	config PBADEN = "OFF"
	config LPT1OSC = "OFF"
	config MCLRE = "ON"
	config LVP = "OFF"
	config XINST = "OFF"
	config DEBUG = "OFF"
	file	"src\main.as"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pbssCOMRAM
__pbssCOMRAM:
	global	_button_hold_ms
_button_hold_ms:
       ds      2
	global	_current_input
_current_input:
       ds      1
_btn_debounce:
       ds      1
_enc_accumulator:
       ds      1
_enc_state:
       ds      1
	global	_button_pressed
_button_pressed:
       ds      1
	global	_save_pending
_save_pending:
       ds      1
	global	_sensor_edit_flag
_sensor_edit_flag:
       ds      1
psect	dataCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pdataCOMRAM
__pdataCOMRAM:
	file	"src\encoder.c"
	line	19
_last_btn:
       ds      1
psect	dataCOMRAM
	file	"src\menu.c"
	line	16
	global	_enable_edit_flag
_enable_edit_flag:
       ds      1
psect	bssBANK0,class=BANK0,space=1,noexec,lowdata
global __pbssBANK0
__pbssBANK0:
	global	_menu
_menu:
       ds      8
main@blink_timer:
       ds      4
main@encoder_activity_timer:
       ds      2
	global	_encoder_count
_encoder_count:
       ds      2
	global	_current_menu
_current_menu:
       ds      1
	global	_button_event
_button_event:
       ds      1
psect	dataBANK0,class=BANK0,space=1,noexec,lowdata
global __pdataBANK0
__pdataBANK0:
	file	"src\menu.c"
	line	37
	global	_options_menu
_options_menu:
       ds      10
psect	dataBANK0
	file	"src\menu.c"
	line	747
menu_draw_setup@F2446:
       ds      6
psect	dataBANK0
	file	"src\menu.c"
	line	47
_value_scale4:
       ds      10
psect	dataBANK0
	file	"src\menu.c"
	line	56
_value_back:
       ds      5
psect	bssBANK1,class=BANK1,space=1,noexec,lowdata
global __pbssBANK1
__pbssBANK1:
	global	_input_menu
_input_menu:
       ds      75
_original_value:
       ds      10
psect	dataBANK1,class=BANK1,space=1,noexec,lowdata
global __pdataBANK1
__pdataBANK1:
	file	"src\menu.c"
	line	739
menu_draw_setup@F2444:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	62
_value_flow_type:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	46
_value_sensor:
       ds      12
psect	dataBANK1
	file	"src\menu.c"
	line	68
_value_high_tbp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	61
_value_high_temp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	60
_value_low_pressure:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	59
_value_hi_pressure:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	55
_value_display:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	54
_value_rlyslp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	53
_value_rlyplp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	52
_value_rlyhigh:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	51
_value_slpbp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	50
_value_plpbp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	49
_value_highbp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	48
_value_scale20:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	45
_value_enable:
       ds      10
psect	bssBANK2,class=BANK2,space=1,noexec,lowdata
global __pbssBANK2
__pbssBANK2:
	global	_system_config
_system_config:
       ds      128
psect	dataBANK2,class=BANK2,space=1,noexec,lowdata
global __pdataBANK2
__pdataBANK2:
	file	"src\menu.c"
	line	67
_value_low_flow_bp:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	66
_value_no_flow_bp:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	65
_value_low_flow:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	64
_value_no_flow:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	63
_value_flow_units:
       ds      10
psect	bssBIGRAM,class=BIGRAM,space=1,noexec
global __pbssBIGRAM
__pbssBIGRAM:
	global	_input_config
_input_config:
       ds      384
	file	"src\main.as"
	line	#
psect	cinit
; Initialize objects allocated to BANK2 (50 bytes)
	global __pidataBANK2
	; load TBLPTR registers with __pidataBANK2
	movlw	low (__pidataBANK2)
	movwf	tblptrl
	movlw	high(__pidataBANK2)
	movwf	tblptrh
	movlw	low highword(__pidataBANK2)
	movwf	tblptru
	lfsr	0,__pdataBANK2
	lfsr	1,50
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK1 (162 bytes)
	global __pidataBANK1
	; load TBLPTR registers with __pidataBANK1
	movlw	low (__pidataBANK1)
	movwf	tblptrl
	movlw	high(__pidataBANK1)
	movwf	tblptrh
	movlw	low highword(__pidataBANK1)
	movwf	tblptru
	lfsr	0,__pdataBANK1
	lfsr	1,162
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
; Initialize objects allocated to BANK0 (31 bytes)
	global __pidataBANK0
	; load TBLPTR registers with __pidataBANK0
	movlw	low (__pidataBANK0)
	movwf	tblptrl
	movlw	high(__pidataBANK0)
	movwf	tblptrh
	movlw	low highword(__pidataBANK0)
	movwf	tblptru
	lfsr	0,__pdataBANK0
	lfsr	1,31
	copy_data2:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data2
; Initialize objects allocated to COMRAM (2 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	tblrd*+ ;fetch initializer
	movff	tablat, __pdataCOMRAM+0		
	tblrd*+ ;fetch initializer
	movff	tablat, __pdataCOMRAM+1		
	line	#
; Clear objects allocated to BIGRAM (384 bytes)
	global __pbssBIGRAM
lfsr	0,__pbssBIGRAM
lfsr	1,384
clear_0:
clrf	postinc0,c
movf	postdec1,w
movf	fsr1l,w
bnz	clear_0
movf	fsr1h,w
bnz	clear_0
; Clear objects allocated to BANK2 (128 bytes)
	global __pbssBANK2
lfsr	0,__pbssBANK2
movlw	128
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
; Clear objects allocated to BANK1 (85 bytes)
	global __pbssBANK1
lfsr	0,__pbssBANK1
movlw	85
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
; Clear objects allocated to BANK0 (18 bytes)
	global __pbssBANK0
lfsr	0,__pbssBANK0
movlw	18
clear_3:
clrf	postinc0,c
decf	wreg
bnz	clear_3
; Clear objects allocated to COMRAM (9 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	9
clear_4:
clrf	postinc0,c
decf	wreg
bnz	clear_4
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
	bcf int$flags,0,c ;clear compiler interrupt flag (level 1)
	bcf int$flags,1,c ;clear compiler interrupt flag (level 2)
	GLOBAL	__Lmediumconst
	movlw	low highword(__Lmediumconst)
	movwf	tblptru
movlb 0
goto _main	;jump to C main() function
psect	cstackBANK2,class=BANK2,space=1,noexec,lowdata
global __pcstackBANK2
__pcstackBANK2:
	global	main@buf
main@buf:	; 40 bytes @ 0x0
	ds   40
	global	main@buf_494
main@buf_494:	; 30 bytes @ 0x28
	ds   30
	global	main@last_button
main@last_button:	; 1 bytes @ 0x46
	ds   1
	global	main@delta
main@delta:	; 2 bytes @ 0x47
	ds   2
	global	main@current_event
main@current_event:	; 1 bytes @ 0x49
	ds   1
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0x4A
	ds   2
psect	cstackBANK0,class=BANK0,space=1,noexec,lowdata
global __pcstackBANK0
__pcstackBANK0:
	global	menu_handle_button@edit_flag
menu_handle_button@edit_flag:	; 1 bytes @ 0x0
	ds   1
	global	menu_handle_button@edit_flag_1012
menu_handle_button@edit_flag_1012:	; 1 bytes @ 0x1
	ds   1
	global	menu_handle_button@edit_flag_1019
menu_handle_button@edit_flag_1019:	; 1 bytes @ 0x2
	ds   1
	global	menu_handle_button@opts
menu_handle_button@opts:	; 2 bytes @ 0x3
	ds   2
	global	menu_handle_button@opts_1008
menu_handle_button@opts_1008:	; 2 bytes @ 0x5
	ds   2
	global	menu_handle_button@opts_1015
menu_handle_button@opts_1015:	; 2 bytes @ 0x7
	ds   2
	global	menu_handle_button@i
menu_handle_button@i:	; 1 bytes @ 0x9
	ds   1
	global	menu_handle_button@i_1021
menu_handle_button@i_1021:	; 1 bytes @ 0xA
	ds   1
	global	menu_handle_button@press_type
menu_handle_button@press_type:	; 1 bytes @ 0xB
	ds   1
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_isdigit:	; 1 bit 
?_eeprom_init:	; 1 bytes @ 0x0
?_encoder_init:	; 1 bytes @ 0x0
?_menu_init:	; 1 bytes @ 0x0
?_menu_draw_options:	; 1 bytes @ 0x0
?_menu_update_edit_value:	; 1 bytes @ 0x0
?_menu_draw_input:	; 1 bytes @ 0x0
?_menu_draw_setup:	; 1 bytes @ 0x0
?_menu_handle_button:	; 1 bytes @ 0x0
?_save_current_config:	; 1 bytes @ 0x0
?_load_factory_defaults:	; 1 bytes @ 0x0
?_sync_menu_variables:	; 1 bytes @ 0x0
?_uart_init:	; 1 bytes @ 0x0
?_uart_write:	; 1 bytes @ 0x0
?_system_init:	; 1 bytes @ 0x0
?_lcd_write_nibble:	; 1 bytes @ 0x0
?_lcd_cmd:	; 1 bytes @ 0x0
?_lcd_data:	; 1 bytes @ 0x0
?_lcd_clear:	; 1 bytes @ 0x0
?_lcd_init:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_isr:	; 1 bytes @ 0x0
??_isr:	; 1 bytes @ 0x0
?_lcd_clear_line:	; 1 bytes @ 0x0
?_rebuild_input_menu:	; 1 bytes @ 0x0
	ds   6
	global	isr@combined
isr@combined:	; 1 bytes @ 0x6
	ds   1
	global	isr@new_state
isr@new_state:	; 1 bytes @ 0x7
	ds   1
	global	isr@btn
isr@btn:	; 1 bytes @ 0x8
	ds   1
??_encoder_init:	; 1 bytes @ 0x9
??_menu_init:	; 1 bytes @ 0x9
??_sync_menu_variables:	; 1 bytes @ 0x9
??_isdigit:	; 1 bytes @ 0x9
??_uart_init:	; 1 bytes @ 0x9
??_uart_write:	; 1 bytes @ 0x9
??_system_init:	; 1 bytes @ 0x9
??_lcd_write_nibble:	; 1 bytes @ 0x9
?_beep:	; 1 bytes @ 0x9
?_eeprom_read_byte:	; 1 bytes @ 0x9
?_eeprom_write_byte:	; 1 bytes @ 0x9
?_strcpy:	; 2 bytes @ 0x9
?_memcpy:	; 2 bytes @ 0x9
	global	?_strlen
?_strlen:	; 2 bytes @ 0x9
	global	?_strcmp
?_strcmp:	; 2 bytes @ 0x9
	global	?_get_item_options
?_get_item_options:	; 2 bytes @ 0x9
	global	?_calculate_config_checksum
?_calculate_config_checksum:	; 2 bytes @ 0x9
	global	?___wmul
?___wmul:	; 2 bytes @ 0x9
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x9
	global	uart_write@c
uart_write@c:	; 1 bytes @ 0x9
	global	lcd_write_nibble@nibble
lcd_write_nibble@nibble:	; 1 bytes @ 0x9
	global	beep@duration_ms
beep@duration_ms:	; 2 bytes @ 0x9
	global	eeprom_read_byte@address
eeprom_read_byte@address:	; 2 bytes @ 0x9
	global	eeprom_write_byte@address
eeprom_write_byte@address:	; 2 bytes @ 0x9
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x9
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x9
	global	memcpy@d1
memcpy@d1:	; 2 bytes @ 0x9
	global	strcmp@s1
strcmp@s1:	; 2 bytes @ 0x9
	global	strcpy@to
strcpy@to:	; 2 bytes @ 0x9
	global	strlen@s
strlen@s:	; 2 bytes @ 0x9
	ds   1
?_uart_print:	; 1 bytes @ 0xA
??_lcd_cmd:	; 1 bytes @ 0xA
??_lcd_data:	; 1 bytes @ 0xA
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0xA
	global	_isdigit$1721
_isdigit$1721:	; 1 bytes @ 0xA
	global	uart_print@str
uart_print@str:	; 2 bytes @ 0xA
	ds   1
??_strlen:	; 1 bytes @ 0xB
??_get_item_options:	; 1 bytes @ 0xB
?_lcd_print:	; 1 bytes @ 0xB
??_beep:	; 1 bytes @ 0xB
??_calculate_config_checksum:	; 1 bytes @ 0xB
??_eeprom_read_byte:	; 1 bytes @ 0xB
?_eeprom_read_block:	; 1 bytes @ 0xB
	global	?_eeprom_read_word
?_eeprom_read_word:	; 2 bytes @ 0xB
	global	lcd_cmd@cmd
lcd_cmd@cmd:	; 1 bytes @ 0xB
	global	get_item_options@item_index
get_item_options@item_index:	; 1 bytes @ 0xB
	global	eeprom_write_byte@data
eeprom_write_byte@data:	; 1 bytes @ 0xB
	global	isdigit@c
isdigit@c:	; 1 bytes @ 0xB
	global	lcd_print@str
lcd_print@str:	; 2 bytes @ 0xB
	global	eeprom_read_word@address
eeprom_read_word@address:	; 2 bytes @ 0xB
	global	eeprom_read_block@data
eeprom_read_block@data:	; 2 bytes @ 0xB
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0xB
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0xB
	global	memcpy@s1
memcpy@s1:	; 2 bytes @ 0xB
	global	strcmp@s2
strcmp@s2:	; 2 bytes @ 0xB
	global	strcpy@from
strcpy@from:	; 2 bytes @ 0xB
	global	strlen@cp
strlen@cp:	; 2 bytes @ 0xB
	ds   1
??_uart_print:	; 1 bytes @ 0xC
?_uart_println:	; 1 bytes @ 0xC
??_lcd_clear:	; 1 bytes @ 0xC
?_lcd_set_cursor:	; 1 bytes @ 0xC
??_lcd_init:	; 1 bytes @ 0xC
??_eeprom_write_byte:	; 1 bytes @ 0xC
?_eeprom_write_word:	; 1 bytes @ 0xC
?_eeprom_write_block:	; 1 bytes @ 0xC
	global	lcd_set_cursor@col
lcd_set_cursor@col:	; 1 bytes @ 0xC
	global	get_item_options@i
get_item_options@i:	; 1 bytes @ 0xC
	global	uart_println@str
uart_println@str:	; 2 bytes @ 0xC
	global	beep@i
beep@i:	; 2 bytes @ 0xC
	global	calculate_config_checksum@checksum
calculate_config_checksum@checksum:	; 2 bytes @ 0xC
	global	eeprom_write_word@address
eeprom_write_word@address:	; 2 bytes @ 0xC
	global	eeprom_write_block@data
eeprom_write_block@data:	; 2 bytes @ 0xC
	ds   1
?_menu_handle_encoder:	; 1 bytes @ 0xD
??_strcpy:	; 1 bytes @ 0xD
??_strcmp:	; 1 bytes @ 0xD
??_lcd_print:	; 1 bytes @ 0xD
??_lcd_set_cursor:	; 1 bytes @ 0xD
??_eeprom_read_word:	; 1 bytes @ 0xD
??___wmul:	; 1 bytes @ 0xD
??___lwdiv:	; 1 bytes @ 0xD
	global	lcd_set_cursor@row
lcd_set_cursor@row:	; 1 bytes @ 0xD
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0xD
	global	menu_handle_encoder@delta
menu_handle_encoder@delta:	; 2 bytes @ 0xD
	global	eeprom_read_block@address
eeprom_read_block@address:	; 2 bytes @ 0xD
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0xD
	global	memcpy@n
memcpy@n:	; 2 bytes @ 0xD
	global	strcpy@cp
strcpy@cp:	; 2 bytes @ 0xD
	ds   1
??_uart_println:	; 1 bytes @ 0xE
	global	lcd_set_cursor@address
lcd_set_cursor@address:	; 1 bytes @ 0xE
	global	calculate_config_checksum@data
calculate_config_checksum@data:	; 2 bytes @ 0xE
	global	eeprom_write_word@data
eeprom_write_word@data:	; 2 bytes @ 0xE
	global	eeprom_write_block@address
eeprom_write_block@address:	; 2 bytes @ 0xE
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0xE
	ds   1
??_menu_handle_encoder:	; 1 bytes @ 0xF
??_menu_update_edit_value:	; 1 bytes @ 0xF
??_memcpy:	; 1 bytes @ 0xF
?_lcd_print_at:	; 1 bytes @ 0xF
??_lcd_clear_line:	; 1 bytes @ 0xF
	global	lcd_print_at@col
lcd_print_at@col:	; 1 bytes @ 0xF
	global	lcd_clear_line@row
lcd_clear_line@row:	; 1 bytes @ 0xF
	global	memcpy@tmp
memcpy@tmp:	; 1 bytes @ 0xF
	global	strcmp@r
strcmp@r:	; 1 bytes @ 0xF
	global	eeprom_read_block@length
eeprom_read_block@length:	; 2 bytes @ 0xF
	ds   1
??_eeprom_write_word:	; 1 bytes @ 0x10
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x10
	global	lcd_print_at@str
lcd_print_at@str:	; 2 bytes @ 0x10
	global	calculate_config_checksum@j
calculate_config_checksum@j:	; 2 bytes @ 0x10
	global	eeprom_read_word@result
eeprom_read_word@result:	; 2 bytes @ 0x10
	global	eeprom_write_block@length
eeprom_write_block@length:	; 2 bytes @ 0x10
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x10
	global	memcpy@d
memcpy@d:	; 2 bytes @ 0x10
	ds   1
??_eeprom_read_block:	; 1 bytes @ 0x11
	global	eeprom_read_block@ptr
eeprom_read_block@ptr:	; 2 bytes @ 0x11
	ds   1
??_lcd_print_at:	; 1 bytes @ 0x12
??_eeprom_write_block:	; 1 bytes @ 0x12
	global	lcd_print_at@row
lcd_print_at@row:	; 1 bytes @ 0x12
	global	calculate_config_checksum@j_1198
calculate_config_checksum@j_1198:	; 2 bytes @ 0x12
	global	eeprom_write_block@ptr
eeprom_write_block@ptr:	; 2 bytes @ 0x12
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x12
	global	memcpy@s
memcpy@s:	; 2 bytes @ 0x12
	ds   1
??_menu_draw_options:	; 1 bytes @ 0x13
??_menu_draw_setup:	; 1 bytes @ 0x13
	global	eeprom_read_block@i
eeprom_read_block@i:	; 2 bytes @ 0x13
	global	menu_update_edit_value@value_buf
menu_update_edit_value@value_buf:	; 15 bytes @ 0x13
	ds   1
??_load_factory_defaults:	; 1 bytes @ 0x14
??___lwmod:	; 1 bytes @ 0x14
	global	calculate_config_checksum@i
calculate_config_checksum@i:	; 1 bytes @ 0x14
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x14
	global	menu_handle_encoder@opts
menu_handle_encoder@opts:	; 2 bytes @ 0x14
	global	eeprom_write_block@i
eeprom_write_block@i:	; 2 bytes @ 0x14
	ds   1
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x15
	global	sprintf@sp
sprintf@sp:	; 2 bytes @ 0x15
	ds   1
??_save_current_config:	; 1 bytes @ 0x16
	global	menu_handle_encoder@edit_flag
menu_handle_encoder@edit_flag:	; 1 bytes @ 0x16
	global	save_current_config@checksum
save_current_config@checksum:	; 2 bytes @ 0x16
	ds   1
	global	sprintf@f
sprintf@f:	; 2 bytes @ 0x17
	ds   1
	global	menu_draw_options@i
menu_draw_options@i:	; 1 bytes @ 0x18
	global	save_current_config@i
save_current_config@i:	; 1 bytes @ 0x18
	global	menu_draw_setup@sensor_type_names
menu_draw_setup@sensor_type_names:	; 6 bytes @ 0x18
	ds   1
??_eeprom_init:	; 1 bytes @ 0x19
	global	eeprom_init@stored_checksum
eeprom_init@stored_checksum:	; 2 bytes @ 0x19
	ds   2
	global	eeprom_init@calculated_checksum
eeprom_init@calculated_checksum:	; 2 bytes @ 0x1B
	ds   2
??_sprintf:	; 1 bytes @ 0x1D
	global	eeprom_init@i
eeprom_init@i:	; 1 bytes @ 0x1D
	ds   1
	global	menu_draw_setup@setup_items
menu_draw_setup@setup_items:	; 10 bytes @ 0x1E
	ds   2
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x20
	ds   1
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x21
	ds   1
	global	menu_update_edit_value@start_pos
menu_update_edit_value@start_pos:	; 1 bytes @ 0x22
	global	sprintf@cp
sprintf@cp:	; 2 bytes @ 0x22
	ds   1
	global	_menu_update_edit_value$979
_menu_update_edit_value$979:	; 2 bytes @ 0x23
	ds   1
	global	sprintf@val
sprintf@val:	; 2 bytes @ 0x24
	ds   1
	global	menu_update_edit_value@val_len
menu_update_edit_value@val_len:	; 1 bytes @ 0x25
	ds   1
	global	menu_update_edit_value@val_len_984
menu_update_edit_value@val_len_984:	; 1 bytes @ 0x26
	global	sprintf@len
sprintf@len:	; 2 bytes @ 0x26
	ds   1
	global	menu_update_edit_value@val_len_987
menu_update_edit_value@val_len_987:	; 1 bytes @ 0x27
	ds   1
	global	menu_update_edit_value@j
menu_update_edit_value@j:	; 1 bytes @ 0x28
	global	menu_draw_setup@type_len
menu_draw_setup@type_len:	; 1 bytes @ 0x28
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x28
	ds   1
	global	menu_update_edit_value@j_985
menu_update_edit_value@j_985:	; 1 bytes @ 0x29
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x29
	global	menu_draw_setup@type_text
menu_draw_setup@type_text:	; 2 bytes @ 0x29
	ds   1
	global	menu_update_edit_value@screen_line
menu_update_edit_value@screen_line:	; 1 bytes @ 0x2A
	global	sprintf@width
sprintf@width:	; 2 bytes @ 0x2A
	ds   1
	global	menu_update_edit_value@flag_value
menu_update_edit_value@flag_value:	; 1 bytes @ 0x2B
	global	menu_draw_setup@sensor_type
menu_draw_setup@sensor_type:	; 1 bytes @ 0x2B
	ds   1
??_menu_draw_input:	; 1 bytes @ 0x2C
??_rebuild_input_menu:	; 1 bytes @ 0x2C
	global	menu_draw_setup@item_idx
menu_draw_setup@item_idx:	; 1 bytes @ 0x2C
	global	menu_update_edit_value@opts
menu_update_edit_value@opts:	; 2 bytes @ 0x2C
	ds   1
	global	menu_draw_setup@i
menu_draw_setup@i:	; 1 bytes @ 0x2D
	global	_rebuild_input_menu$885
_rebuild_input_menu$885:	; 2 bytes @ 0x2D
	ds   1
	global	menu_update_edit_value@item_idx
menu_update_edit_value@item_idx:	; 1 bytes @ 0x2E
	ds   1
	global	_rebuild_input_menu$899
_rebuild_input_menu$899:	; 2 bytes @ 0x2F
	ds   1
	global	menu_draw_input@title
menu_draw_input@title:	; 10 bytes @ 0x30
	ds   1
	global	_rebuild_input_menu$900
_rebuild_input_menu$900:	; 2 bytes @ 0x31
	ds   2
	global	_rebuild_input_menu$906
_rebuild_input_menu$906:	; 2 bytes @ 0x33
	ds   2
	global	_rebuild_input_menu$907
_rebuild_input_menu$907:	; 2 bytes @ 0x35
	ds   2
	global	_rebuild_input_menu$913
_rebuild_input_menu$913:	; 2 bytes @ 0x37
	ds   2
	global	_rebuild_input_menu$914
_rebuild_input_menu$914:	; 2 bytes @ 0x39
	ds   1
	global	menu_draw_input@value_buf
menu_draw_input@value_buf:	; 15 bytes @ 0x3A
	ds   1
	global	_rebuild_input_menu$918
_rebuild_input_menu$918:	; 2 bytes @ 0x3B
	ds   2
	global	rebuild_input_menu@sensor
rebuild_input_menu@sensor:	; 1 bytes @ 0x3D
	ds   1
	global	_rebuild_input_menu$1961
_rebuild_input_menu$1961:	; 2 bytes @ 0x3E
	ds   2
	global	_rebuild_input_menu$1962
_rebuild_input_menu$1962:	; 2 bytes @ 0x40
	ds   2
	global	rebuild_input_menu@input_num
rebuild_input_menu@input_num:	; 1 bytes @ 0x42
	ds   7
	global	menu_draw_input@start_pos
menu_draw_input@start_pos:	; 1 bytes @ 0x49
	ds   1
	global	_menu_draw_input$946
_menu_draw_input$946:	; 2 bytes @ 0x4A
	ds   2
	global	_menu_draw_input$953
_menu_draw_input$953:	; 2 bytes @ 0x4C
	ds   2
	global	_menu_draw_input$965
_menu_draw_input$965:	; 2 bytes @ 0x4E
	ds   2
	global	_menu_draw_input$969
_menu_draw_input$969:	; 2 bytes @ 0x50
	ds   2
	global	menu_draw_input@flag_value
menu_draw_input@flag_value:	; 1 bytes @ 0x52
	ds   1
	global	menu_draw_input@flag_value_952
menu_draw_input@flag_value_952:	; 1 bytes @ 0x53
	ds   1
	global	menu_draw_input@val_len
menu_draw_input@val_len:	; 1 bytes @ 0x54
	ds   1
	global	menu_draw_input@val_len_957
menu_draw_input@val_len_957:	; 1 bytes @ 0x55
	ds   1
	global	menu_draw_input@j
menu_draw_input@j:	; 1 bytes @ 0x56
	ds   1
	global	menu_draw_input@j_958
menu_draw_input@j_958:	; 1 bytes @ 0x57
	ds   1
	global	menu_draw_input@opts
menu_draw_input@opts:	; 2 bytes @ 0x58
	ds   2
	global	menu_draw_input@opts_948
menu_draw_input@opts_948:	; 2 bytes @ 0x5A
	ds   2
	global	menu_draw_input@val_len_959
menu_draw_input@val_len_959:	; 1 bytes @ 0x5C
	ds   1
	global	menu_draw_input@show_brackets
menu_draw_input@show_brackets:	; 1 bytes @ 0x5D
	ds   1
	global	menu_draw_input@i
menu_draw_input@i:	; 1 bytes @ 0x5E
	ds   1
	global	menu_draw_input@item_idx
menu_draw_input@item_idx:	; 1 bytes @ 0x5F
	ds   1
??_menu_handle_button:	; 1 bytes @ 0x60
	ds   5
??_main:	; 1 bytes @ 0x65
	ds   2
;!
;!Data Sizes:
;!    Strings     636
;!    Constant    772
;!    Data        245
;!    BSS         624
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126    103     114
;!    BANK0           128     12      61
;!    BANK1           256      0     247
;!    BANK2           256     76     254
;!    BANK3           256      0       0
;!    BANK4           256      0       0
;!    BANK5           256      0       0
;!    BANK6           256      0       0
;!    BANK7           256      0       0
;!    BANK8           256      0       0
;!    BANK9           256      0       0
;!    BANK10          256      0       0
;!    BANK11          256      0       0
;!    BANK12          256      0       0
;!    BANK13          256      0       0
;!    BANK14          256      0       0
;!    BANK15          128      0       0

;!
;!Pointer List with Targets:
;!
;!    calculate_config_checksum@data	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK2[128]), 
;!
;!    eeprom_read_block@data	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK2[128]), 
;!
;!    eeprom_read_block@ptr	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK2[128]), 
;!
;!    eeprom_write_block@data	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK2[128]), 
;!
;!    eeprom_write_block@ptr	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK2[128]), 
;!
;!    flow_analog_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_28(CODE[7]), STR_29(CODE[7]), STR_30(CODE[10]), STR_31(CODE[11]), 
;!		 -> STR_32(CODE[12]), STR_33(CODE[9]), STR_34(CODE[13]), STR_35(CODE[6]), 
;!		 -> STR_36(CODE[6]), STR_37(CODE[9]), STR_38(CODE[8]), STR_39(CODE[8]), 
;!		 -> STR_40(CODE[8]), STR_41(CODE[5]), STR_42(CODE[7]), STR_43(CODE[7]), 
;!		 -> STR_44(CODE[10]), STR_45(CODE[11]), STR_46(CODE[10]), STR_47(CODE[9]), 
;!		 -> STR_48(CODE[9]), STR_49(CODE[8]), STR_50(CODE[5]), STR_51(CODE[7]), 
;!		 -> STR_52(CODE[7]), STR_53(CODE[5]), STR_54(CODE[8]), STR_55(CODE[11]), 
;!		 -> STR_56(CODE[8]), STR_57(CODE[8]), STR_58(CODE[5]), STR_59(CODE[7]), 
;!		 -> STR_60(CODE[7]), STR_61(CODE[5]), STR_62(CODE[6]), STR_63(CODE[10]), 
;!		 -> STR_64(CODE[11]), STR_65(CODE[9]), STR_66(CODE[12]), STR_67(CODE[8]), 
;!		 -> STR_68(CODE[8]), STR_69(CODE[5]), 
;!
;!    flow_analog_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK1[10]), 
;!		 -> value_high_tbp(BANK1[10]), value_high_temp(BANK1[10]), value_highbp(BANK1[10]), value_low_pressure(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK1[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    flow_digital_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_28(CODE[7]), STR_29(CODE[7]), STR_30(CODE[10]), STR_31(CODE[11]), 
;!		 -> STR_32(CODE[12]), STR_33(CODE[9]), STR_34(CODE[13]), STR_35(CODE[6]), 
;!		 -> STR_36(CODE[6]), STR_37(CODE[9]), STR_38(CODE[8]), STR_39(CODE[8]), 
;!		 -> STR_40(CODE[8]), STR_41(CODE[5]), STR_42(CODE[7]), STR_43(CODE[7]), 
;!		 -> STR_44(CODE[10]), STR_45(CODE[11]), STR_46(CODE[10]), STR_47(CODE[9]), 
;!		 -> STR_48(CODE[9]), STR_49(CODE[8]), STR_50(CODE[5]), STR_51(CODE[7]), 
;!		 -> STR_52(CODE[7]), STR_53(CODE[5]), STR_54(CODE[8]), STR_55(CODE[11]), 
;!		 -> STR_56(CODE[8]), STR_57(CODE[8]), STR_58(CODE[5]), STR_59(CODE[7]), 
;!		 -> STR_60(CODE[7]), STR_61(CODE[5]), STR_62(CODE[6]), STR_63(CODE[10]), 
;!		 -> STR_64(CODE[11]), STR_65(CODE[9]), STR_66(CODE[12]), STR_67(CODE[8]), 
;!		 -> STR_68(CODE[8]), STR_69(CODE[5]), 
;!
;!    flow_digital_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK1[10]), 
;!		 -> value_high_tbp(BANK1[10]), value_high_temp(BANK1[10]), value_highbp(BANK1[10]), value_low_pressure(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK1[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    input_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_28(CODE[7]), STR_29(CODE[7]), STR_30(CODE[10]), STR_31(CODE[11]), 
;!		 -> STR_32(CODE[12]), STR_33(CODE[9]), STR_34(CODE[13]), STR_35(CODE[6]), 
;!		 -> STR_36(CODE[6]), STR_37(CODE[9]), STR_38(CODE[8]), STR_39(CODE[8]), 
;!		 -> STR_40(CODE[8]), STR_41(CODE[5]), STR_42(CODE[7]), STR_43(CODE[7]), 
;!		 -> STR_44(CODE[10]), STR_45(CODE[11]), STR_46(CODE[10]), STR_47(CODE[9]), 
;!		 -> STR_48(CODE[9]), STR_49(CODE[8]), STR_50(CODE[5]), STR_51(CODE[7]), 
;!		 -> STR_52(CODE[7]), STR_53(CODE[5]), STR_54(CODE[8]), STR_55(CODE[11]), 
;!		 -> STR_56(CODE[8]), STR_57(CODE[8]), STR_58(CODE[5]), STR_59(CODE[7]), 
;!		 -> STR_60(CODE[7]), STR_61(CODE[5]), STR_62(CODE[6]), STR_63(CODE[10]), 
;!		 -> STR_64(CODE[11]), STR_65(CODE[9]), STR_66(CODE[12]), STR_67(CODE[8]), 
;!		 -> STR_68(CODE[8]), STR_69(CODE[5]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK1[10]), 
;!		 -> value_high_tbp(BANK1[10]), value_high_temp(BANK1[10]), value_highbp(BANK1[10]), value_low_pressure(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK1[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    lcd_print@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> menu_draw_input@title(COMRAM[10]), menu_draw_input@value_buf(COMRAM[15]), menu_update_edit_value@value_buf(COMRAM[15]), STR_100(CODE[2]), 
;!		 -> STR_105(CODE[2]), STR_106(CODE[2]), STR_107(CODE[2]), STR_108(CODE[2]), 
;!		 -> STR_111(CODE[11]), STR_112(CODE[2]), STR_113(CODE[2]), STR_114(CODE[6]), 
;!		 -> STR_115(CODE[8]), STR_116(CODE[8]), STR_117(CODE[8]), STR_118(CODE[6]), 
;!		 -> STR_119(CODE[5]), STR_120(CODE[9]), STR_121(CODE[5]), STR_122(CODE[5]), 
;!		 -> STR_123(CODE[2]), STR_124(CODE[2]), STR_23(CODE[10]), STR_24(CODE[11]), 
;!		 -> STR_25(CODE[13]), STR_26(CODE[6]), STR_27(CODE[5]), STR_28(CODE[7]), 
;!		 -> STR_29(CODE[7]), STR_3(CODE[13]), STR_30(CODE[10]), STR_31(CODE[11]), 
;!		 -> STR_32(CODE[12]), STR_33(CODE[9]), STR_34(CODE[13]), STR_35(CODE[6]), 
;!		 -> STR_36(CODE[6]), STR_37(CODE[9]), STR_38(CODE[8]), STR_39(CODE[8]), 
;!		 -> STR_4(CODE[16]), STR_40(CODE[8]), STR_41(CODE[5]), STR_42(CODE[7]), 
;!		 -> STR_43(CODE[7]), STR_44(CODE[10]), STR_45(CODE[11]), STR_46(CODE[10]), 
;!		 -> STR_47(CODE[9]), STR_48(CODE[9]), STR_49(CODE[8]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[7]), STR_52(CODE[7]), STR_53(CODE[5]), STR_54(CODE[8]), 
;!		 -> STR_55(CODE[11]), STR_56(CODE[8]), STR_57(CODE[8]), STR_58(CODE[5]), 
;!		 -> STR_59(CODE[7]), STR_60(CODE[7]), STR_61(CODE[5]), STR_62(CODE[6]), 
;!		 -> STR_63(CODE[10]), STR_64(CODE[11]), STR_65(CODE[9]), STR_66(CODE[12]), 
;!		 -> STR_67(CODE[8]), STR_68(CODE[8]), STR_69(CODE[5]), STR_70(CODE[21]), 
;!		 -> STR_98(CODE[8]), STR_99(CODE[2]), 
;!
;!    lcd_print_at@str	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@title(COMRAM[10]), menu_draw_input@value_buf(COMRAM[15]), STR_114(CODE[6]), STR_115(CODE[8]), 
;!		 -> STR_116(CODE[8]), STR_117(CODE[8]), STR_118(CODE[6]), STR_119(CODE[5]), 
;!		 -> STR_120(CODE[9]), STR_121(CODE[5]), STR_122(CODE[5]), STR_123(CODE[2]), 
;!		 -> STR_23(CODE[10]), STR_24(CODE[11]), STR_25(CODE[13]), STR_26(CODE[6]), 
;!		 -> STR_27(CODE[5]), STR_28(CODE[7]), STR_29(CODE[7]), STR_30(CODE[10]), 
;!		 -> STR_31(CODE[11]), STR_32(CODE[12]), STR_33(CODE[9]), STR_34(CODE[13]), 
;!		 -> STR_35(CODE[6]), STR_36(CODE[6]), STR_37(CODE[9]), STR_38(CODE[8]), 
;!		 -> STR_39(CODE[8]), STR_40(CODE[8]), STR_41(CODE[5]), STR_42(CODE[7]), 
;!		 -> STR_43(CODE[7]), STR_44(CODE[10]), STR_45(CODE[11]), STR_46(CODE[10]), 
;!		 -> STR_47(CODE[9]), STR_48(CODE[9]), STR_49(CODE[8]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[7]), STR_52(CODE[7]), STR_53(CODE[5]), STR_54(CODE[8]), 
;!		 -> STR_55(CODE[11]), STR_56(CODE[8]), STR_57(CODE[8]), STR_58(CODE[5]), 
;!		 -> STR_59(CODE[7]), STR_60(CODE[7]), STR_61(CODE[5]), STR_62(CODE[6]), 
;!		 -> STR_63(CODE[10]), STR_64(CODE[11]), STR_65(CODE[9]), STR_66(CODE[12]), 
;!		 -> STR_67(CODE[8]), STR_68(CODE[8]), STR_69(CODE[5]), STR_98(CODE[8]), 
;!		 -> STR_99(CODE[2]), 
;!
;!    memcpy@d	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), input_menu(BANK1[75]), system_config(BANK2[128]), 
;!
;!    memcpy@d1	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), input_menu(BANK1[75]), system_config(BANK2[128]), 
;!
;!    memcpy@s	PTR const unsigned char  size(2) Largest target is 384
;!		 -> factory_defaults(CODE[384]), pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    memcpy@s1	PTR const void  size(2) Largest target is 384
;!		 -> factory_defaults(CODE[384]), pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    menu_draw_input$965	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_105(CODE[2]), STR_106(CODE[2]), 
;!
;!    menu_draw_input$969	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_107(CODE[2]), STR_108(CODE[2]), 
;!
;!    menu_draw_input@opts	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), STR_16(CODE[1]), 
;!		 -> STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), STR_20(CODE[5]), 
;!		 -> STR_21(CODE[1]), STR_22(CODE[1]), 
;!
;!    menu_draw_input@opts_948	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts_948$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), STR_16(CODE[1]), 
;!		 -> STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), STR_20(CODE[5]), 
;!		 -> STR_21(CODE[1]), STR_22(CODE[1]), 
;!
;!    menu_draw_setup@F2444	PTR const unsigned char [5] size(2) Largest target is 8
;!		 -> STR_115(CODE[8]), STR_116(CODE[8]), STR_117(CODE[8]), STR_118(CODE[6]), 
;!		 -> STR_119(CODE[5]), 
;!
;!    menu_draw_setup@F2446	PTR const unsigned char [3] size(2) Largest target is 9
;!		 -> STR_120(CODE[9]), STR_121(CODE[5]), STR_122(CODE[5]), 
;!
;!    menu_draw_setup@sensor_type_names	PTR const unsigned char [3] size(2) Largest target is 9
;!		 -> STR_120(CODE[9]), STR_121(CODE[5]), STR_122(CODE[5]), 
;!
;!    menu_draw_setup@setup_items	PTR const unsigned char [5] size(2) Largest target is 8
;!		 -> STR_115(CODE[8]), STR_116(CODE[8]), STR_117(CODE[8]), STR_118(CODE[6]), 
;!		 -> STR_119(CODE[5]), 
;!
;!    menu_draw_setup@type_text	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_120(CODE[9]), STR_121(CODE[5]), STR_122(CODE[5]), 
;!
;!    menu_handle_button@edit_flag	PTR unsigned char  size(1) Largest target is 1
;!		 -> enable_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), 
;!
;!    menu_handle_button@edit_flag_1012	PTR unsigned char  size(1) Largest target is 1
;!		 -> enable_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), 
;!
;!    menu_handle_button@edit_flag_1019	PTR unsigned char  size(1) Largest target is 1
;!		 -> enable_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), 
;!
;!    menu_handle_button@opts	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), STR_16(CODE[1]), 
;!		 -> STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), STR_20(CODE[5]), 
;!		 -> STR_21(CODE[1]), STR_22(CODE[1]), 
;!
;!    menu_handle_button@opts_1008	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1008$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), STR_16(CODE[1]), 
;!		 -> STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), STR_20(CODE[5]), 
;!		 -> STR_21(CODE[1]), STR_22(CODE[1]), 
;!
;!    menu_handle_button@opts_1015	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1015$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), STR_16(CODE[1]), 
;!		 -> STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), STR_20(CODE[5]), 
;!		 -> STR_21(CODE[1]), STR_22(CODE[1]), 
;!
;!    menu_handle_encoder@edit_flag	PTR unsigned char  size(1) Largest target is 1
;!		 -> enable_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), 
;!
;!    menu_handle_encoder@opts	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), STR_16(CODE[1]), 
;!		 -> STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), STR_20(CODE[5]), 
;!		 -> STR_21(CODE[1]), STR_22(CODE[1]), 
;!
;!    menu_item_options$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), STR_16(CODE[1]), 
;!		 -> STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), STR_20(CODE[5]), 
;!		 -> STR_21(CODE[1]), STR_22(CODE[1]), 
;!
;!    menu_update_edit_value@opts	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_update_edit_value@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), STR_16(CODE[1]), 
;!		 -> STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), STR_20(CODE[5]), 
;!		 -> STR_21(CODE[1]), STR_22(CODE[1]), 
;!
;!    options_menu	PTR const unsigned char [5] size(2) Largest target is 13
;!		 -> STR_23(CODE[10]), STR_24(CODE[11]), STR_25(CODE[13]), STR_26(CODE[6]), 
;!		 -> STR_27(CODE[5]), 
;!
;!    pressure_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_28(CODE[7]), STR_29(CODE[7]), STR_30(CODE[10]), STR_31(CODE[11]), 
;!		 -> STR_32(CODE[12]), STR_33(CODE[9]), STR_34(CODE[13]), STR_35(CODE[6]), 
;!		 -> STR_36(CODE[6]), STR_37(CODE[9]), STR_38(CODE[8]), STR_39(CODE[8]), 
;!		 -> STR_40(CODE[8]), STR_41(CODE[5]), STR_42(CODE[7]), STR_43(CODE[7]), 
;!		 -> STR_44(CODE[10]), STR_45(CODE[11]), STR_46(CODE[10]), STR_47(CODE[9]), 
;!		 -> STR_48(CODE[9]), STR_49(CODE[8]), STR_50(CODE[5]), STR_51(CODE[7]), 
;!		 -> STR_52(CODE[7]), STR_53(CODE[5]), STR_54(CODE[8]), STR_55(CODE[11]), 
;!		 -> STR_56(CODE[8]), STR_57(CODE[8]), STR_58(CODE[5]), STR_59(CODE[7]), 
;!		 -> STR_60(CODE[7]), STR_61(CODE[5]), STR_62(CODE[6]), STR_63(CODE[10]), 
;!		 -> STR_64(CODE[11]), STR_65(CODE[9]), STR_66(CODE[12]), STR_67(CODE[8]), 
;!		 -> STR_68(CODE[8]), STR_69(CODE[5]), 
;!
;!    pressure_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK1[10]), 
;!		 -> value_high_tbp(BANK1[10]), value_high_temp(BANK1[10]), value_highbp(BANK1[10]), value_low_pressure(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK1[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    rebuild_input_menu$885	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_72(CODE[8]), STR_73(CODE[9]), 
;!
;!    rebuild_input_menu$899	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_82(CODE[6]), STR_83(CODE[6]), STR_84(CODE[9]), 
;!
;!    rebuild_input_menu$900	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_83(CODE[6]), STR_84(CODE[9]), 
;!
;!    rebuild_input_menu$906	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_85(CODE[6]), STR_86(CODE[6]), STR_87(CODE[9]), 
;!
;!    rebuild_input_menu$907	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_86(CODE[6]), STR_87(CODE[9]), 
;!
;!    rebuild_input_menu$913	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_88(CODE[6]), STR_89(CODE[6]), STR_90(CODE[9]), 
;!
;!    rebuild_input_menu$914	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_89(CODE[6]), STR_90(CODE[9]), 
;!
;!    rebuild_input_menu$918	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_91(CODE[5]), STR_92(CODE[5]), 
;!
;!    S663$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), STR_16(CODE[1]), 
;!		 -> STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), STR_20(CODE[5]), 
;!		 -> STR_21(CODE[1]), STR_22(CODE[1]), 
;!
;!    S667$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_28(CODE[7]), STR_29(CODE[7]), STR_30(CODE[10]), STR_31(CODE[11]), 
;!		 -> STR_32(CODE[12]), STR_33(CODE[9]), STR_34(CODE[13]), STR_35(CODE[6]), 
;!		 -> STR_36(CODE[6]), STR_37(CODE[9]), STR_38(CODE[8]), STR_39(CODE[8]), 
;!		 -> STR_40(CODE[8]), STR_41(CODE[5]), STR_42(CODE[7]), STR_43(CODE[7]), 
;!		 -> STR_44(CODE[10]), STR_45(CODE[11]), STR_46(CODE[10]), STR_47(CODE[9]), 
;!		 -> STR_48(CODE[9]), STR_49(CODE[8]), STR_50(CODE[5]), STR_51(CODE[7]), 
;!		 -> STR_52(CODE[7]), STR_53(CODE[5]), STR_54(CODE[8]), STR_55(CODE[11]), 
;!		 -> STR_56(CODE[8]), STR_57(CODE[8]), STR_58(CODE[5]), STR_59(CODE[7]), 
;!		 -> STR_60(CODE[7]), STR_61(CODE[5]), STR_62(CODE[6]), STR_63(CODE[10]), 
;!		 -> STR_64(CODE[11]), STR_65(CODE[9]), STR_66(CODE[12]), STR_67(CODE[8]), 
;!		 -> STR_68(CODE[8]), STR_69(CODE[5]), 
;!
;!    S667$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK1[10]), 
;!		 -> value_high_tbp(BANK1[10]), value_high_temp(BANK1[10]), value_highbp(BANK1[10]), value_low_pressure(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK1[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    sp__get_item_options	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    sp__memcpy	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), input_menu(BANK1[75]), system_config(BANK2[128]), 
;!
;!    sp__strcpy	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(COMRAM[15]), menu_update_edit_value@value_buf(COMRAM[15]), original_value(BANK1[10]), value_back(BANK0[5]), 
;!		 -> value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK1[10]), value_high_tbp(BANK1[10]), 
;!		 -> value_high_temp(BANK1[10]), value_highbp(BANK1[10]), value_low_pressure(BANK1[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), value_scale20(BANK1[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), NULL(NULL[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 9
;!		 -> ?_sprintf(COMRAM[2]), STR_125(CODE[7]), STR_72(CODE[8]), STR_73(CODE[9]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 23
;!		 -> STR_101(CODE[9]), STR_11(CODE[23]), STR_12(CODE[17]), STR_71(CODE[3]), 
;!		 -> STR_75(CODE[3]), STR_76(CODE[3]), STR_77(CODE[3]), STR_78(CODE[10]), 
;!		 -> STR_79(CODE[3]), STR_80(CODE[10]), STR_81(CODE[10]), STR_94(CODE[3]), 
;!		 -> STR_95(CODE[3]), STR_96(CODE[3]), STR_97(CODE[10]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 40
;!		 -> main@buf(BANK2[40]), main@buf_494(BANK2[30]), menu_draw_input@title(COMRAM[10]), value_enable(BANK1[10]), 
;!		 -> value_hi_pressure(BANK1[10]), value_high_tbp(BANK1[10]), value_high_temp(BANK1[10]), value_highbp(BANK1[10]), 
;!		 -> value_low_pressure(BANK1[10]), value_plpbp(BANK1[10]), value_scale20(BANK1[10]), value_scale4(BANK0[10]), 
;!		 -> value_slpbp(BANK1[10]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> original_value(BANK1[10]), value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), 
;!		 -> value_hi_pressure(BANK1[10]), value_high_tbp(BANK1[10]), value_high_temp(BANK1[10]), value_highbp(BANK1[10]), 
;!		 -> value_low_pressure(BANK1[10]), value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), 
;!		 -> value_rlyslp(BANK1[10]), value_scale20(BANK1[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), 
;!		 -> value_slpbp(BANK1[10]), NULL(NULL[0]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_104(CODE[1]), STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), 
;!		 -> STR_16(CODE[1]), STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), 
;!		 -> STR_20(CODE[5]), STR_21(CODE[1]), STR_22(CODE[1]), 
;!
;!    strcpy@cp	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(COMRAM[15]), menu_update_edit_value@value_buf(COMRAM[15]), original_value(BANK1[10]), value_back(BANK0[5]), 
;!		 -> value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK1[10]), value_high_tbp(BANK1[10]), 
;!		 -> value_high_temp(BANK1[10]), value_highbp(BANK1[10]), value_low_pressure(BANK1[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), value_scale20(BANK1[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), NULL(NULL[0]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 12
;!		 -> original_value(BANK1[10]), STR_102(CODE[6]), STR_103(CODE[6]), STR_109(CODE[6]), 
;!		 -> STR_110(CODE[6]), STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), 
;!		 -> STR_16(CODE[1]), STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), 
;!		 -> STR_20(CODE[5]), STR_21(CODE[1]), STR_22(CODE[1]), STR_74(CODE[9]), 
;!		 -> STR_82(CODE[6]), STR_83(CODE[6]), STR_84(CODE[9]), STR_85(CODE[6]), 
;!		 -> STR_86(CODE[6]), STR_87(CODE[9]), STR_88(CODE[6]), STR_89(CODE[6]), 
;!		 -> STR_90(CODE[9]), STR_91(CODE[5]), STR_92(CODE[5]), STR_93(CODE[5]), 
;!		 -> value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK1[10]), 
;!		 -> value_high_tbp(BANK1[10]), value_high_temp(BANK1[10]), value_highbp(BANK1[10]), value_low_pressure(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK1[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcpy@to	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(COMRAM[15]), menu_update_edit_value@value_buf(COMRAM[15]), original_value(BANK1[10]), value_back(BANK0[5]), 
;!		 -> value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK1[10]), value_high_tbp(BANK1[10]), 
;!		 -> value_high_temp(BANK1[10]), value_highbp(BANK1[10]), value_low_pressure(BANK1[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), value_scale20(BANK1[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), NULL(NULL[0]), 
;!
;!    strlen@cp	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(COMRAM[15]), menu_update_edit_value@value_buf(COMRAM[15]), STR_120(CODE[9]), STR_121(CODE[5]), 
;!		 -> STR_122(CODE[5]), STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), 
;!		 -> STR_16(CODE[1]), STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), 
;!		 -> STR_20(CODE[5]), STR_21(CODE[1]), STR_22(CODE[1]), value_back(BANK0[5]), 
;!		 -> value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK1[10]), value_high_tbp(BANK1[10]), 
;!		 -> value_high_temp(BANK1[10]), value_highbp(BANK1[10]), value_low_pressure(BANK1[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), value_scale20(BANK1[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), NULL(NULL[0]), 
;!
;!    strlen@s	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(COMRAM[15]), menu_update_edit_value@value_buf(COMRAM[15]), STR_120(CODE[9]), STR_121(CODE[5]), 
;!		 -> STR_122(CODE[5]), STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), 
;!		 -> STR_16(CODE[1]), STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), 
;!		 -> STR_20(CODE[5]), STR_21(CODE[1]), STR_22(CODE[1]), value_back(BANK0[5]), 
;!		 -> value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK1[10]), value_high_tbp(BANK1[10]), 
;!		 -> value_high_temp(BANK1[10]), value_highbp(BANK1[10]), value_low_pressure(BANK1[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), value_scale20(BANK1[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), NULL(NULL[0]), 
;!
;!    temp_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_28(CODE[7]), STR_29(CODE[7]), STR_30(CODE[10]), STR_31(CODE[11]), 
;!		 -> STR_32(CODE[12]), STR_33(CODE[9]), STR_34(CODE[13]), STR_35(CODE[6]), 
;!		 -> STR_36(CODE[6]), STR_37(CODE[9]), STR_38(CODE[8]), STR_39(CODE[8]), 
;!		 -> STR_40(CODE[8]), STR_41(CODE[5]), STR_42(CODE[7]), STR_43(CODE[7]), 
;!		 -> STR_44(CODE[10]), STR_45(CODE[11]), STR_46(CODE[10]), STR_47(CODE[9]), 
;!		 -> STR_48(CODE[9]), STR_49(CODE[8]), STR_50(CODE[5]), STR_51(CODE[7]), 
;!		 -> STR_52(CODE[7]), STR_53(CODE[5]), STR_54(CODE[8]), STR_55(CODE[11]), 
;!		 -> STR_56(CODE[8]), STR_57(CODE[8]), STR_58(CODE[5]), STR_59(CODE[7]), 
;!		 -> STR_60(CODE[7]), STR_61(CODE[5]), STR_62(CODE[6]), STR_63(CODE[10]), 
;!		 -> STR_64(CODE[11]), STR_65(CODE[9]), STR_66(CODE[12]), STR_67(CODE[8]), 
;!		 -> STR_68(CODE[8]), STR_69(CODE[5]), 
;!
;!    temp_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK1[10]), 
;!		 -> value_high_tbp(BANK1[10]), value_high_temp(BANK1[10]), value_highbp(BANK1[10]), value_low_pressure(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK1[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 40
;!		 -> main@buf(BANK2[40]), main@buf_494(BANK2[30]), STR_1(CODE[28]), STR_10(CODE[19]), 
;!		 -> STR_2(CODE[23]), STR_5(CODE[22]), STR_6(CODE[19]), STR_7(CODE[24]), 
;!		 -> STR_8(CODE[22]), STR_9(CODE[22]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 40
;!		 -> main@buf(BANK2[40]), main@buf_494(BANK2[30]), STR_1(CODE[28]), STR_10(CODE[19]), 
;!		 -> STR_2(CODE[23]), STR_5(CODE[22]), STR_6(CODE[19]), STR_7(CODE[24]), 
;!		 -> STR_8(CODE[22]), STR_9(CODE[22]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_menu_handle_button
;!    _uart_println->_uart_print
;!    _uart_print->_uart_write
;!    _menu_update_edit_value->_lcd_set_cursor
;!    _menu_update_edit_value->_strcpy
;!    _menu_handle_encoder->_get_item_options
;!    _menu_handle_button->_menu_draw_input
;!    _rebuild_input_menu->_sprintf
;!    _menu_draw_setup->_lcd_print_at
;!    _menu_draw_options->_lcd_print_at
;!    _menu_draw_input->_sprintf
;!    _sprintf->___lwmod
;!    ___lwmod->___lwdiv
;!    _lcd_print_at->_lcd_set_cursor
;!    _lcd_clear_line->_lcd_set_cursor
;!    _lcd_set_cursor->_lcd_cmd
;!    _lcd_print->_lcd_data
;!    _lcd_data->_lcd_write_nibble
;!    _lcd_init->_lcd_cmd
;!    _lcd_clear->_lcd_cmd
;!    _lcd_cmd->_lcd_write_nibble
;!    _eeprom_init->_save_current_config
;!    _save_current_config->_eeprom_write_block
;!    _eeprom_write_word->_eeprom_write_byte
;!    _eeprom_write_block->_eeprom_write_byte
;!    _load_factory_defaults->_memcpy
;!    _eeprom_read_word->_eeprom_read_byte
;!    _eeprom_read_block->_eeprom_read_byte
;!
;!Critical Paths under _isr in COMRAM
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->_menu_handle_button
;!
;!Critical Paths under _isr in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _isr in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _isr in BANK2
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _isr in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK4
;!
;!    None.
;!
;!Critical Paths under _isr in BANK4
;!
;!    None.
;!
;!Critical Paths under _main in BANK5
;!
;!    None.
;!
;!Critical Paths under _isr in BANK5
;!
;!    None.
;!
;!Critical Paths under _main in BANK6
;!
;!    None.
;!
;!Critical Paths under _isr in BANK6
;!
;!    None.
;!
;!Critical Paths under _main in BANK7
;!
;!    None.
;!
;!Critical Paths under _isr in BANK7
;!
;!    None.
;!
;!Critical Paths under _main in BANK8
;!
;!    None.
;!
;!Critical Paths under _isr in BANK8
;!
;!    None.
;!
;!Critical Paths under _main in BANK9
;!
;!    None.
;!
;!Critical Paths under _isr in BANK9
;!
;!    None.
;!
;!Critical Paths under _main in BANK10
;!
;!    None.
;!
;!Critical Paths under _isr in BANK10
;!
;!    None.
;!
;!Critical Paths under _main in BANK11
;!
;!    None.
;!
;!Critical Paths under _isr in BANK11
;!
;!    None.
;!
;!Critical Paths under _main in BANK12
;!
;!    None.
;!
;!Critical Paths under _isr in BANK12
;!
;!    None.
;!
;!Critical Paths under _main in BANK13
;!
;!    None.
;!
;!Critical Paths under _isr in BANK13
;!
;!    None.
;!
;!Critical Paths under _main in BANK14
;!
;!    None.
;!
;!Critical Paths under _isr in BANK14
;!
;!    None.
;!
;!Critical Paths under _main in BANK15
;!
;!    None.
;!
;!Critical Paths under _isr in BANK15
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                78    78      0  145687
;!                                            101 COMRAM     2     2      0
;!                                              0 BANK2     76    76      0
;!                               _beep
;!                        _eeprom_init
;!                       _encoder_init
;!                          _lcd_clear
;!                           _lcd_init
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                    _menu_draw_input
;!                  _menu_draw_options
;!                    _menu_draw_setup
;!                 _menu_handle_button
;!                _menu_handle_encoder
;!                          _menu_init
;!             _menu_update_edit_value
;!                            _sprintf
;!                        _system_init
;!                          _uart_init
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    1148
;!                                             12 COMRAM     2     0      2
;!                         _uart_print
;!                         _uart_write
;! ---------------------------------------------------------------------------------
;! (2) _uart_print                                           2     0      2     186
;!                                             10 COMRAM     2     0      2
;!                         _uart_write
;! ---------------------------------------------------------------------------------
;! (2) _uart_write                                           1     1      0      31
;!                                              9 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _uart_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _system_init                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_edit_value                              32    32      0    8234
;!                                             15 COMRAM    32    32      0
;!                   _get_item_options
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (1) _menu_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_encoder                                 10     8      2     787
;!                                             13 COMRAM    10     8      2
;!                   _get_item_options
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                  17    17      0   70949
;!                                             96 COMRAM     5     5      0
;!                                              0 BANK0     12    12      0
;!                               _beep
;!                   _get_item_options
;!                    _menu_draw_input
;!                  _menu_draw_options
;!                    _menu_draw_setup
;!                 _rebuild_input_menu
;!                _save_current_config
;!                             _strcmp
;!                             _strcpy
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_input_menu                                  23    23      0   17028
;!                                             44 COMRAM    23    23      0
;!                            ___lwdiv
;!                            ___lwmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_setup                                     27    27      0   10112
;!                                             19 COMRAM    27    27      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_options                                    6     6      0    8953
;!                                             19 COMRAM     6     6      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_input                                     52    52      0   25440
;!                                             44 COMRAM    52    52      0
;!                   _get_item_options
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;!                            _sprintf
;!                             _strcmp
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (2) _strlen                                               4     2      2     760
;!                                              9 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (2) _strcpy                                               6     2      4    3529
;!                                              9 COMRAM     6     2      4
;! ---------------------------------------------------------------------------------
;! (2) _strcmp                                               7     3      4     673
;!                                              9 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (1) _sprintf                                             27    19      8    8530
;!                                             21 COMRAM    23    15      8
;!                            ___lwdiv
;!                            ___lwmod
;!                             ___wmul
;!                            _isdigit
;! ---------------------------------------------------------------------------------
;! (2) _isdigit                                              3     3      0      99
;!                                              9 COMRAM     3     3      0
;! ---------------------------------------------------------------------------------
;! (2) ___wmul                                               6     2      4    1732
;!                                              9 COMRAM     6     2      4
;! ---------------------------------------------------------------------------------
;! (2) ___lwmod                                              5     1      4    1132
;!                                             16 COMRAM     5     1      4
;!                            ___lwdiv (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4    1141
;!                                              9 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (3) _lcd_print_at                                         4     1      3    4480
;!                                             15 COMRAM     4     1      3
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_clear_line                                       1     1      0    2618
;!                                             15 COMRAM     1     1      0
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _lcd_set_cursor                                       3     2      1     986
;!                                             12 COMRAM     3     2      1
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (2) _lcd_print                                            2     0      2    1601
;!                                             11 COMRAM     2     0      2
;!                           _lcd_data
;! ---------------------------------------------------------------------------------
;! (3) _lcd_data                                             1     1      0     186
;!                                             10 COMRAM     1     1      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (2) _get_item_options                                     4     2      2     161
;!                                              9 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (2) _beep                                                 5     3      2    1418
;!                                              9 COMRAM     5     3      2
;! ---------------------------------------------------------------------------------
;! (1) _lcd_init                                             2     2      0     372
;!                                             12 COMRAM     2     2      0
;!                            _lcd_cmd
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (1) _lcd_clear                                            1     1      0     248
;!                                             12 COMRAM     1     1      0
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (3) _lcd_cmd                                              2     2      0     248
;!                                             10 COMRAM     2     2      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (4) _lcd_write_nibble                                     1     1      0     124
;!                                              9 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _encoder_init                                         2     2      0       0
;!                                              9 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _eeprom_init                                          5     5      0    6430
;!                                             25 COMRAM     5     5      0
;!          _calculate_config_checksum
;!                  _eeprom_read_block
;!                   _eeprom_read_word
;!              _load_factory_defaults
;!                _save_current_config
;!                _sync_menu_variables
;! ---------------------------------------------------------------------------------
;! (2) _sync_menu_variables                                  0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _save_current_config                                  3     3      0    2914
;!                                             22 COMRAM     3     3      0
;!          _calculate_config_checksum
;!                 _eeprom_write_block
;!                  _eeprom_write_word
;! ---------------------------------------------------------------------------------
;! (3) _eeprom_write_word                                    4     0      4     943
;!                                             12 COMRAM     4     0      4
;!                  _eeprom_write_byte
;! ---------------------------------------------------------------------------------
;! (3) _eeprom_write_block                                  10     4      6    1402
;!                                             12 COMRAM    10     4      6
;!                  _eeprom_write_byte
;! ---------------------------------------------------------------------------------
;! (4) _eeprom_write_byte                                    3     0      3     636
;!                                              9 COMRAM     3     0      3
;! ---------------------------------------------------------------------------------
;! (3) _calculate_config_checksum                           12    10      2     405
;!                                              9 COMRAM    12    10      2
;! ---------------------------------------------------------------------------------
;! (2) _load_factory_defaults                                0     0      0    1288
;!                             _memcpy
;! ---------------------------------------------------------------------------------
;! (3) _memcpy                                              11     5      6    1288
;!                                              9 COMRAM    11     5      6
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_read_word                                     7     5      2     524
;!                                             11 COMRAM     7     5      2
;!                   _eeprom_read_byte
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_read_block                                   10     4      6    1101
;!                                             11 COMRAM    10     4      6
;!                   _eeprom_read_byte
;! ---------------------------------------------------------------------------------
;! (3) _eeprom_read_byte                                     2     0      2     335
;!                                              9 COMRAM     2     0      2
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (7) _isr                                                  9     9      0     179
;!                                              0 COMRAM     9     9      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 7
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _beep
;!   _eeprom_init
;!     _calculate_config_checksum
;!     _eeprom_read_block
;!       _eeprom_read_byte
;!     _eeprom_read_word
;!       _eeprom_read_byte
;!     _load_factory_defaults
;!       _memcpy
;!     _save_current_config
;!       _calculate_config_checksum
;!       _eeprom_write_block
;!         _eeprom_write_byte
;!       _eeprom_write_word
;!         _eeprom_write_byte
;!     _sync_menu_variables
;!   _encoder_init
;!   _lcd_clear
;!     _lcd_cmd
;!       _lcd_write_nibble
;!   _lcd_init
;!     _lcd_cmd
;!     _lcd_write_nibble
;!   _lcd_print
;!     _lcd_data
;!       _lcd_write_nibble
;!   _lcd_set_cursor
;!     _lcd_cmd
;!   _menu_draw_input
;!     _get_item_options
;!     _lcd_clear_line
;!       _lcd_print
;!       _lcd_set_cursor
;!     _lcd_print
;!     _lcd_print_at
;!       _lcd_print
;!       _lcd_set_cursor
;!     _lcd_set_cursor
;!     _sprintf
;!       ___lwdiv
;!       ___lwmod
;!         ___lwdiv (ARG)
;!       ___wmul
;!       _isdigit
;!     _strcmp
;!     _strcpy
;!     _strlen
;!   _menu_draw_options
;!     _lcd_clear_line
;!     _lcd_print
;!     _lcd_print_at
;!   _menu_draw_setup
;!     _lcd_clear_line
;!     _lcd_print
;!     _lcd_print_at
;!     _strlen
;!   _menu_handle_button
;!     _beep
;!     _get_item_options
;!     _menu_draw_input
;!     _menu_draw_options
;!     _menu_draw_setup
;!     _rebuild_input_menu
;!       ___lwdiv
;!       ___lwmod
;!       _memcpy
;!       _sprintf
;!       _strcpy
;!     _save_current_config
;!     _strcmp
;!     _strcpy
;!   _menu_handle_encoder
;!     _get_item_options
;!   _menu_init
;!   _menu_update_edit_value
;!     _get_item_options
;!     _lcd_print
;!     _lcd_set_cursor
;!     _strcpy
;!     _strlen
;!   _sprintf
;!   _system_init
;!   _uart_init
;!   _uart_println
;!     _uart_print
;!       _uart_write
;!     _uart_write
;!
;! _isr (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BIGRAM             F7F      0     180      49        9.7%
;!EEDATA             400      0       0       0        0.0%
;!BITBANK14          100      0       0      33        0.0%
;!BANK14             100      0       0      34        0.0%
;!BITBANK13          100      0       0      31        0.0%
;!BANK13             100      0       0      32        0.0%
;!BITBANK12          100      0       0      29        0.0%
;!BANK12             100      0       0      30        0.0%
;!BITBANK11          100      0       0      27        0.0%
;!BANK11             100      0       0      28        0.0%
;!BITBANK10          100      0       0      25        0.0%
;!BANK10             100      0       0      26        0.0%
;!BITBANK9           100      0       0      23        0.0%
;!BANK9              100      0       0      24        0.0%
;!BITBANK8           100      0       0      21        0.0%
;!BANK8              100      0       0      22        0.0%
;!BITBANK7           100      0       0      19        0.0%
;!BANK7              100      0       0      20        0.0%
;!BITBANK6           100      0       0      17        0.0%
;!BANK6              100      0       0      18        0.0%
;!BITBANK5           100      0       0      15        0.0%
;!BANK5              100      0       0      16        0.0%
;!BITBANK4           100      0       0      13        0.0%
;!BANK4              100      0       0      14        0.0%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100      0       0      11        0.0%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100     4C      FE       9       99.2%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100      0      F7       7       96.5%
;!BITBANK15           80      0       0      35        0.0%
;!BANK15              80      0       0      36        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80      C      3D       5       47.7%
;!BITCOMRAM           7E      0       0       0        0.0%
;!COMRAM              7E     67      72       1       90.5%
;!BITBIGSFRhhhhlh     1A      0       0      38        0.0%
;!BITBIGSFRhhhlh      11      0       0      40        0.0%
;!BITBIGSFRhhhhh       D      0       0      37        0.0%
;!BITBIGSFRhlhll       A      0       0      44        0.0%
;!BITBIGSFRhhhll       8      0       0      41        0.0%
;!BITBIGSFRllh         7      0       0      47        0.0%
;!BITBIGSFRhhlh        7      0       0      42        0.0%
;!BITBIGSFRlh          6      0       0      46        0.0%
;!BITBIGSFRhll         6      0       0      45        0.0%
;!BITBIGSFRhhhhll      1      0       0      39        0.0%
;!BITBIGSFRhhll        1      0       0      43        0.0%
;!BITBIGSFRlll         1      0       0      48        0.0%
;!BIGSFR               0      0       0     200        0.0%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0     2A4      12        0.0%
;!DATA                 0      0     424       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 218 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            30   40[BANK2 ] unsigned char [30]
;;  current_even    1   73[BANK2 ] unsigned char 
;;  buf            40    0[BANK2 ] unsigned char [40]
;;  delta           2   71[BANK2 ] int 
;;  last_encoder    2   74[BANK2 ] int 
;;  last_button     1   70[BANK2 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0      76       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0      76       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       78 bytes
;; Hardware stack levels required when called: 7
;; This function calls:
;;		_beep
;;		_eeprom_init
;;		_encoder_init
;;		_lcd_clear
;;		_lcd_init
;;		_lcd_print
;;		_lcd_set_cursor
;;		_menu_draw_input
;;		_menu_draw_options
;;		_menu_draw_setup
;;		_menu_handle_button
;;		_menu_handle_encoder
;;		_menu_init
;;		_menu_update_edit_value
;;		_sprintf
;;		_system_init
;;		_uart_init
;;		_uart_println
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	218
global __ptext0
__ptext0:
psect	text0
	file	"src\main.c"
	line	218
	
_main:
;incstack = 0
	callstack 24
	line	221
	
l5452:
	call	_system_init	;wreg free
	line	222
	
l5454:
	call	_eeprom_init	;wreg free
	line	223
	
l5456:
	call	_uart_init	;wreg free
	line	224
	
l5458:
	call	_encoder_init	;wreg free
	line	225
	
l5460:
	call	_menu_init	;wreg free
	line	226
	
l5462:; BSR set to: 0

	call	_lcd_init	;wreg free
	line	228
	
l5464:
		movlw	low(STR_1)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_1)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	229
	
l5466:
		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	231
	
l5468:
	call	_lcd_clear	;wreg free
	line	232
	
l5470:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	233
	
l5472:
		movlw	low(STR_3)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_3)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	234
	
l5474:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	235
	
l5476:
		movlw	low(STR_4)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_4)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	237
	
l5478:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	238
	
l5480:
		movlw	low(STR_6)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_6)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	239
	
l5482:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	241
	
l5484:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	242
	
l5486:
	asmopt push
asmopt off
movlw  5
movwf	(??_main+0+0+1)^00h,c
movlw	15
movwf	(??_main+0+0)^00h,c
	movlw	241
u5577:
decfsz	wreg,f
	bra	u5577
	decfsz	(??_main+0+0)^00h,c,f
	bra	u5577
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u5577
	nop
asmopt pop

	line	243
	
l5488:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	245
	
l5490:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	246
	
l5492:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	248
	
l5494:
	asmopt push
asmopt off
movlw  41
movwf	(??_main+0+0+1)^00h,c
movlw	150
movwf	(??_main+0+0)^00h,c
	movlw	127
u5587:
decfsz	wreg,f
	bra	u5587
	decfsz	(??_main+0+0)^00h,c,f
	bra	u5587
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u5587
	nop
asmopt pop

	line	252
	
l5496:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_current_menu))&0ffh
	line	253
	
l5498:; BSR set to: 0

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	255
	
l5500:; BSR set to: 0

	call	_menu_draw_options	;wreg free
	line	256
	
l5502:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	259
	
l5504:
	movlw	high(0)
	movlb	2	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	260
	
l5506:; BSR set to: 2

	movlw	low(0)
	movwf	((main@last_button))&0ffh
	line	267
	
l5508:
	movlb	2	; () banked
	movf	((main@last_encoder))&0ffh,w
	movlb	0	; () banked
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u5380
	movlb	2	; () banked
movf	((main@last_encoder+1))&0ffh,w
	movlb	0	; () banked
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u5381
	goto	u5380

u5381:
	goto	l5546
u5380:
	line	269
	
l5510:; BSR set to: 0

	movlb	2	; () banked
	movf	((main@last_encoder))&0ffh,w
	movlb	0	; () banked
	subwf	((_encoder_count))&0ffh,w	;volatile
	movlb	2	; () banked
	movwf	((main@delta))&0ffh
	movf	((main@last_encoder+1))&0ffh,w
	movlb	0	; () banked
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movlb	2	; () banked
	movwf	1+((main@delta))&0ffh
	line	272
	
l5512:; BSR set to: 2

	movlw	high(01h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	275
	
l5514:
		movlw	low(main@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_11)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_11)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_encoder_count),0+((c:?_sprintf)+04h)	;volatile
	movff	(_encoder_count+1),1+((c:?_sprintf)+04h)	;volatile
	movff	(main@delta),0+((c:?_sprintf)+06h)
	movff	(main@delta+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	276
	
l5516:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	278
	
l5518:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	281
	
l5520:
	movlw	high(01F4h)
	movlb	0	; () banked
	movwf	((main@encoder_activity_timer+1))&0ffh
	movlw	low(01F4h)
	movwf	((main@encoder_activity_timer))&0ffh
	line	284
	
l5522:; BSR set to: 0

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u5391
	goto	u5390
u5391:
	goto	l5526
u5390:
	line	286
	
l5524:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	289
	
l5526:; BSR set to: 0

	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	line	292
	
l5528:
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u5401
	goto	u5400
u5401:
	goto	l5534
u5400:
	
l5530:; BSR set to: 0

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u5411
	goto	u5410

u5411:
	goto	l5534
u5410:
	line	295
	
l5532:; BSR set to: 0

	call	_menu_update_edit_value	;wreg free
	line	296
	goto	l5546
	line	300
	
l5534:; BSR set to: 0

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u5421
	goto	u5420
u5421:
	goto	l5538
u5420:
	line	302
	
l5536:; BSR set to: 0

	call	_menu_draw_options	;wreg free
	line	303
	goto	l5546
	line	304
	
l5538:; BSR set to: 0

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u5431
	goto	u5430

u5431:
	goto	l5542
u5430:
	line	306
	
l5540:; BSR set to: 0

	call	_menu_draw_input	;wreg free
	line	307
	goto	l5546
	line	308
	
l5542:; BSR set to: 0

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u5441
	goto	u5440

u5441:
	goto	l158
u5440:
	line	310
	
l5544:; BSR set to: 0

	call	_menu_draw_setup	;wreg free
	goto	l5546
	line	312
	
l158:; BSR set to: 0

	line	316
	
l5546:
	movlb	2	; () banked
	movf	((main@last_button))&0ffh,w
	movlb	0	; () banked
xorwf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u5451
	goto	u5450

u5451:
	goto	l5576
u5450:
	line	319
	
l5548:; BSR set to: 0

	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u5461
	goto	u5460
u5461:
	goto	l5572
u5460:
	line	321
	
l5550:; BSR set to: 0

	movff	(_button_event),(main@current_event)	;volatile
	line	322
	
l5552:; BSR set to: 0

	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	325
	
l5554:; BSR set to: 0

		movlw	low(main@buf_494)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_494)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_12)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_12)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@current_event),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	326
	
l5556:
		movlw	low(main@buf_494)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_494)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	328
	
l5558:
	movlb	2	; () banked
	movf	((main@current_event))&0ffh,w
	
	call	_menu_handle_button
	line	331
	
l5560:
	movlb	0	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u5471
	goto	u5470
u5471:
	goto	l5564
u5470:
	line	333
	
l5562:; BSR set to: 0

	call	_menu_draw_options	;wreg free
	line	334
	goto	l5572
	line	335
	
l5564:; BSR set to: 0

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u5481
	goto	u5480

u5481:
	goto	l5568
u5480:
	line	337
	
l5566:; BSR set to: 0

	call	_menu_draw_input	;wreg free
	line	338
	goto	l5572
	line	339
	
l5568:; BSR set to: 0

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u5491
	goto	u5490

u5491:
	goto	l167
u5490:
	line	341
	
l5570:; BSR set to: 0

	call	_menu_draw_setup	;wreg free
	goto	l5572
	line	343
	
l167:; BSR set to: 0

	line	344
	
l5572:
	movff	(_button_event),(main@last_button)	;volatile
	line	345
	
l5574:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	349
	
l5576:; BSR set to: 0

	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfsc	status,2
	goto	u5501
	goto	u5500

u5501:
	goto	l5580
u5500:
	line	351
	
l5578:; BSR set to: 0

	decf	((main@encoder_activity_timer))&0ffh
	btfss	status,0
	decf	((main@encoder_activity_timer+1))&0ffh
	line	355
	
l5580:; BSR set to: 0

	movlw	low(01h)
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	356
	
l5582:; BSR set to: 0

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	bnz	u5510
	movlw	16
	subwf	 ((main@blink_timer))&0ffh,w
	movlw	39
	subwfb	((main@blink_timer+1))&0ffh,w
	btfss	status,0
	goto	u5511
	goto	u5510

u5511:
	goto	l5596
u5510:
	line	358
	
l5584:; BSR set to: 0

	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	359
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u5521
	goto	u5520
u5521:
	goto	l5594
u5520:
	line	362
	
l5586:; BSR set to: 0

	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfss	status,2
	goto	u5531
	goto	u5530

u5531:
	goto	l5596
u5530:
	line	364
	
l5588:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u5541
	goto	u5540
u5541:
	movlw	1
	goto	u5550
u5540:
	movlw	0
u5550:
	movwf	(0+(_menu+05h))&0ffh
	line	367
	
l5590:; BSR set to: 0

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u5561
	goto	u5560

u5561:
	goto	l176
u5560:
	line	369
	
l5592:; BSR set to: 0

	call	_menu_update_edit_value	;wreg free
	goto	l5596
	line	375
	
l5594:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l5596
	line	376
	
l176:; BSR set to: 0

	line	387
	
l5596:
	asmopt push
asmopt off
	movlw	133
u5597:
decfsz	wreg,f
	bra	u5597
	nop
asmopt pop

	goto	l5508
	global	start
	goto	start
	callstack 0
	line	389
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_uart_println

;; *************** function _uart_println *****************
;; Defined at:
;;		line 61 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   12[COMRAM] PTR const unsigned char 
;;		 -> main@buf_494(30), main@buf(40), STR_10(19), STR_9(22), 
;;		 -> STR_8(22), STR_7(24), STR_6(19), STR_5(22), 
;;		 -> STR_2(23), STR_1(28), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_uart_print
;;		_uart_write
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	line	61
global __ptext1
__ptext1:
psect	text1
	file	"src\main.c"
	line	61
	
_uart_println:
;incstack = 0
	callstack 27
	line	63
	
l5066:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	64
	
l5068:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	65
	
l5070:
	movlw	(0Ah)&0ffh
	
	call	_uart_write
	line	66
	
l88:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_println
	__end_of_uart_println:
	signat	_uart_println,4217
	global	_uart_print

;; *************** function _uart_print *****************
;; Defined at:
;;		line 53 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   10[COMRAM] PTR const unsigned char 
;;		 -> main@buf_494(30), main@buf(40), STR_10(19), STR_9(22), 
;;		 -> STR_8(22), STR_7(24), STR_6(19), STR_5(22), 
;;		 -> STR_2(23), STR_1(28), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_uart_write
;; This function is called by:
;;		_uart_println
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2,group=0
	line	53
global __ptext2
__ptext2:
psect	text2
	file	"src\main.c"
	line	53
	
_uart_print:
;incstack = 0
	callstack 27
	line	55
	
l4672:
	goto	l4678
	line	57
	
l4674:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u4387
	tblrd	*
	
	movf	tablat,w
	bra	u4380
u4387:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u4380:
	
	call	_uart_write
	
l4676:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	55
	
l4678:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u4397
	tblrd	*
	
	movf	tablat,w
	bra	u4390
u4397:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u4390:
	iorlw	0
	btfss	status,2
	goto	u4401
	goto	u4400
u4401:
	goto	l4674
u4400:
	line	59
	
l85:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_print
	__end_of_uart_print:
	signat	_uart_print,4217
	global	_uart_write

;; *************** function _uart_write *****************
;; Defined at:
;;		line 46 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    9[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_print
;;		_uart_println
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=0
	line	46
global __ptext3
__ptext3:
psect	text3
	file	"src\main.c"
	line	46
	
_uart_write:
;incstack = 0
	callstack 28
	movwf	((c:uart_write@c))^00h,c
	line	48
	
l4394:
	line	49
	
l76:
	line	48
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u3991
	goto	u3990
u3991:
	goto	l76
u3990:
	line	50
	
l4396:
	movff	(c:uart_write@c),(c:4013)	;volatile
	line	51
	
l79:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_write
	__end_of_uart_write:
	signat	_uart_write,4217
	global	_uart_init

;; *************** function _uart_init *****************
;; Defined at:
;;		line 33 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	33
global __ptext4
__ptext4:
psect	text4
	file	"src\main.c"
	line	33
	
_uart_init:
;incstack = 0
	callstack 29
	line	35
	
l5062:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	36
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	38
	
l5064:
	movlw	low(024h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	39
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	40
	movlw	low(08h)
	movwf	((c:4024))^0f00h,c	;volatile
	line	42
	movlw	low(044h)
	movwf	((c:4015))^0f00h,c	;volatile
	line	43
	movlw	low(0)
	movwf	((c:4016))^0f00h,c	;volatile
	line	44
	
l73:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
	signat	_uart_init,89
	global	_system_init

;; *************** function _system_init *****************
;; Defined at:
;;		line 69 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	69
global __ptext5
__ptext5:
psect	text5
	file	"src\main.c"
	line	69
	
_system_init:
;incstack = 0
	callstack 29
	line	71
	
l5072:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	72
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	75
	
l91:
	line	74
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u4821
	goto	u4820
u4821:
	goto	l91
u4820:
	line	77
	
l5074:
	movlw	low(0Fh)
	movwf	((c:4033))^0f00h,c	;volatile
	line	79
	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	80
	movlw	low(0)
	movwf	((c:3978))^0f00h,c	;volatile
	line	81
	movlw	low(0)
	movwf	((c:3979))^0f00h,c	;volatile
	line	83
	
l5076:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	84
	
l5078:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	86
	
l5080:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	87
	
l5082:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	88
	
l5084:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	89
	
l5086:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	90
	
l94:
	return	;funcret
	callstack 0
GLOBAL	__end_of_system_init
	__end_of_system_init:
	signat	_system_init,89
	global	_menu_update_edit_value

;; *************** function _menu_update_edit_value *****************
;; Defined at:
;;		line 401 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1   40[COMRAM] unsigned char 
;;  j               1   41[COMRAM] unsigned char 
;;  val_len         1   37[COMRAM] unsigned char 
;;  val_len         1   38[COMRAM] unsigned char 
;;  start_pos       1   34[COMRAM] unsigned char 
;;  flag_value      1   43[COMRAM] unsigned char 
;;  value_buf      15   19[COMRAM] unsigned char [15]
;;  opts            2   44[COMRAM] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  item_idx        1   46[COMRAM] unsigned char 
;;  screen_line     1   42[COMRAM] unsigned char 
;;  val_len         1   39[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        28       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        32       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       32 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_get_item_options
;;		_lcd_print
;;		_lcd_set_cursor
;;		_strcpy
;;		_strlen
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	401
global __ptext6
__ptext6:
psect	text6
	file	"src\menu.c"
	line	401
	
_menu_update_edit_value:
;incstack = 0
	callstack 26
	line	404
	
l5218:; BSR set to: 0

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u5021
	goto	u5020

u5021:
	goto	l440
u5020:
	
l5220:; BSR set to: 0

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u5031
	goto	u5030
u5031:
	goto	l5222
u5030:
	goto	l440
	line	408
	
l5222:; BSR set to: 0

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((c:menu_update_edit_value@screen_line))^00h,c
	line	409
		movlw	03h-1
	cpfsgt	((c:menu_update_edit_value@screen_line))^00h,c
	goto	u5041
	goto	u5040

u5041:
	goto	l441
u5040:
	goto	l440
	line	410
	
l441:; BSR set to: 0

	line	413
	movff	(_menu),(c:menu_update_edit_value@item_idx)
	line	417
	
l5226:; BSR set to: 0

	movf	((c:menu_update_edit_value@item_idx))^00h,c,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(c:menu_update_edit_value@opts)
	movff	1+?_get_item_options,(c:menu_update_edit_value@opts+1)
	line	419
	
l5228:
	movf	((c:menu_update_edit_value@opts))^00h,c,w
iorwf	((c:menu_update_edit_value@opts+1))^00h,c,w
	btfsc	status,2
	goto	u5051
	goto	u5050

u5051:
	goto	l5258
u5050:
	line	421
	
l5230:
	movf	((c:menu_update_edit_value@item_idx))^00h,c,w
	btfsc	status,2
	goto	u5061
	goto	u5060
u5061:
	goto	l444
u5060:
	
l5232:
	movff	(c:_sensor_edit_flag),(c:_menu_update_edit_value$979)
	clrf	((c:_menu_update_edit_value$979+1))^00h,c
	goto	l446
	
l444:
	movff	(c:_enable_edit_flag),(c:_menu_update_edit_value$979)
	clrf	((c:_menu_update_edit_value$979+1))^00h,c
	
l446:
	movff	(c:_menu_update_edit_value$979),(c:menu_update_edit_value@flag_value)
	line	422
	
l5234:
	movlw	01h
	addwf	((c:menu_update_edit_value@opts))^00h,c,w
	movwf	(??_menu_update_edit_value+0+0)^00h,c
	movlw	0
	addwfc	((c:menu_update_edit_value@opts+1))^00h,c,w
	movwf	(??_menu_update_edit_value+0+0+1)^00h,c
	movff	??_menu_update_edit_value+0+0,tblptrl
	movff	??_menu_update_edit_value+0+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movf	tablat,w
	cpfslt	((c:menu_update_edit_value@flag_value))^00h,c
	goto	u5071
	goto	u5070
u5071:
	goto	l5252
u5070:
	line	424
	
l5236:
	movlb	0	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u5081
	goto	u5080
u5081:
	goto	l5240
u5080:
	line	427
	
l5238:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

	movf	((c:menu_update_edit_value@flag_value))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_update_edit_value+0+0
	movff	prodh,??_menu_update_edit_value+0+0+1
	movf	(??_menu_update_edit_value+0+0)^00h,c,w
	addwf	((c:menu_update_edit_value@opts))^00h,c,w
	movwf	(??_menu_update_edit_value+2+0)^00h,c
	movf	(??_menu_update_edit_value+0+1)^00h,c,w
	addwfc	((c:menu_update_edit_value@opts+1))^00h,c,w
	movwf	1+(??_menu_update_edit_value+2+0)^00h,c
	movlw	02h
	addwf	(??_menu_update_edit_value+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_update_edit_value+2+1)^00h,c
	movff	??_menu_update_edit_value+2+0,tblptrl
	movff	??_menu_update_edit_value+2+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd*+
	
	movff	tablat,(c:strcpy@from)
	tblrd*-
	
	movff	tablat,(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	428
	goto	l5274
	line	432
	
l5240:; BSR set to: 0

	movf	((c:menu_update_edit_value@flag_value))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_update_edit_value+0+0
	movff	prodh,??_menu_update_edit_value+0+0+1
	movf	(??_menu_update_edit_value+0+0)^00h,c,w
	addwf	((c:menu_update_edit_value@opts))^00h,c,w
	movwf	(??_menu_update_edit_value+2+0)^00h,c
	movf	(??_menu_update_edit_value+0+1)^00h,c,w
	addwfc	((c:menu_update_edit_value@opts+1))^00h,c,w
	movwf	1+(??_menu_update_edit_value+2+0)^00h,c
	movlw	02h
	addwf	(??_menu_update_edit_value+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_update_edit_value+2+1)^00h,c
	movff	??_menu_update_edit_value+2+0,tblptrl
	movff	??_menu_update_edit_value+2+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd*+
	
	movff	tablat,(c:strlen@s)
	tblrd*-
	
	movff	tablat,(c:strlen@s+1)

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_update_edit_value@val_len))^00h,c
	line	433
	
l5242:
	movlw	low(0)
	movwf	((c:menu_update_edit_value@j))^00h,c
	goto	l5248
	line	434
	
l5244:
	movf	((c:menu_update_edit_value@j))^00h,c,w
	addlw	low(menu_update_edit_value@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	433
	
l5246:
	incf	((c:menu_update_edit_value@j))^00h,c
	
l5248:
		movf	((c:menu_update_edit_value@val_len))^00h,c,w
	subwf	((c:menu_update_edit_value@j))^00h,c,w
	btfss	status,0
	goto	u5091
	goto	u5090

u5091:
	goto	l5244
u5090:
	line	435
	
l5250:
	movf	((c:menu_update_edit_value@val_len))^00h,c,w
	addlw	low(menu_update_edit_value@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l5274
	line	440
	
l5252:
	movlb	0	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u5101
	goto	u5100
u5101:
	goto	l5256
u5100:
	line	441
	
l5254:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_109)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_109)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l5274
	line	443
	
l5256:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_110)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_110)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l5274
	line	448
	
l5258:
	movlb	0	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u5111
	goto	u5110
u5111:
	goto	l5262
u5110:
	line	450
	
l5260:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

	movf	((c:menu_update_edit_value@item_idx))^00h,c,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strcpy@from)
	movff	postdec2,(c:strcpy@from+1)
	call	_strcpy	;wreg free
	line	451
	goto	l5274
	line	454
	
l5262:; BSR set to: 0

	movf	((c:menu_update_edit_value@item_idx))^00h,c,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strlen@s)
	movff	postdec2,(c:strlen@s+1)
	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_update_edit_value@val_len_984))^00h,c
	line	455
	
l5264:
	movlw	low(0)
	movwf	((c:menu_update_edit_value@j_985))^00h,c
	goto	l5270
	line	456
	
l5266:
	movf	((c:menu_update_edit_value@j_985))^00h,c,w
	addlw	low(menu_update_edit_value@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	455
	
l5268:
	incf	((c:menu_update_edit_value@j_985))^00h,c
	
l5270:
		movf	((c:menu_update_edit_value@val_len_984))^00h,c,w
	subwf	((c:menu_update_edit_value@j_985))^00h,c,w
	btfss	status,0
	goto	u5121
	goto	u5120

u5121:
	goto	l5266
u5120:
	line	457
	
l5272:
	movf	((c:menu_update_edit_value@val_len_984))^00h,c,w
	addlw	low(menu_update_edit_value@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	462
	
l5274:
	movlw	low(0Ah)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_update_edit_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	463
	
l5276:
		movlw	low(STR_111)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_111)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	466
	
l5278:
		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_update_edit_value@val_len_987))^00h,c
	line	467
	
l5280:
	movf	((c:menu_update_edit_value@val_len_987))^00h,c,w
	btfsc	status,2
	goto	u5131
	goto	u5130
u5131:
	goto	l440
u5130:
	line	470
	
l5282:
	movf	((c:menu_update_edit_value@val_len_987))^00h,c,w
	sublw	low(012h)
	movwf	((c:menu_update_edit_value@start_pos))^00h,c
	line	471
	
l5284:
	movff	(c:menu_update_edit_value@start_pos),(c:lcd_set_cursor@col)
	incf	((c:menu_update_edit_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	474
	
l5286:
		movlw	low(STR_112)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_112)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	476
	
l5288:
		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	478
	
l5290:
		movlw	low(STR_113)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_113)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	480
	
l440:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_edit_value
	__end_of_menu_update_edit_value:
	signat	_menu_update_edit_value,89
	global	_menu_init

;; *************** function _menu_init *****************
;; Defined at:
;;		line 163 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 3F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	163
global __ptext7
__ptext7:
psect	text7
	file	"src\menu.c"
	line	163
	
_menu_init:
;incstack = 0
	callstack 29
	line	165
	
l5162:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_menu))&0ffh
	line	166
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	167
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	168
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	169
	movlw	low(0)
	movwf	(0+(_menu+05h))&0ffh
	line	170
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	171
	
l337:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_init
	__end_of_menu_init:
	signat	_menu_init,89
	global	_menu_handle_encoder

;; *************** function _menu_handle_encoder *****************
;; Defined at:
;;		line 483 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  delta           2   13[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;  edit_flag       1   22[COMRAM] PTR unsigned char 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), 
;;  opts            2   20[COMRAM] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        10       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_get_item_options
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2,group=0
	line	483
global __ptext8
__ptext8:
psect	text8
	file	"src\menu.c"
	line	483
	
_menu_handle_encoder:; BSR set to: 0

;incstack = 0
	callstack 28
	line	486
	
l5164:; BSR set to: 0

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u4871
	goto	u4870
u4871:
	goto	l5198
u4870:
	line	488
	
l5166:; BSR set to: 0

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u4881
	goto	u4880

u4881:
	goto	l479
u4880:
	line	491
	
l5168:; BSR set to: 0

	movf	((_menu))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(c:menu_handle_encoder@opts)
	movff	1+?_get_item_options,(c:menu_handle_encoder@opts+1)
	line	492
	
l5170:
	movf	((c:menu_handle_encoder@opts))^00h,c,w
iorwf	((c:menu_handle_encoder@opts+1))^00h,c,w
	btfsc	status,2
	goto	u4891
	goto	u4890

u4891:
	goto	l479
u4890:
	line	495
	
l5172:
	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u4901
	goto	u4900
u4901:
	goto	l5176
u4900:
	
l5174:; BSR set to: 0

		movlw	low(_sensor_edit_flag)
	movwf	((c:menu_handle_encoder@edit_flag))^00h,c

	goto	l471
	
l5176:; BSR set to: 0

		movlw	low(_enable_edit_flag)
	movwf	((c:menu_handle_encoder@edit_flag))^00h,c

	
l471:; BSR set to: 0

	line	497
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u4911
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u4910
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u4911
	goto	u4910

u4911:
	goto	l5184
u4910:
	line	499
	
l5178:; BSR set to: 0

	movf	((c:menu_handle_encoder@edit_flag))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	incf	indf2

	line	500
	
l5180:; BSR set to: 0

	movlw	01h
	addwf	((c:menu_handle_encoder@opts))^00h,c,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movlw	0
	addwfc	((c:menu_handle_encoder@opts+1))^00h,c,w
	movwf	(??_menu_handle_encoder+0+0+1)^00h,c
	movff	??_menu_handle_encoder+0+0,tblptrl
	movff	??_menu_handle_encoder+0+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	movf	((c:menu_handle_encoder@edit_flag))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
		tblrd	*+
	movf	tablat,w
	subwf	postinc2,w
	btfss	status,0
	goto	u4921
	goto	u4920

u4921:
	goto	l5192
u4920:
	line	501
	
l5182:; BSR set to: 0

	movf	((c:menu_handle_encoder@edit_flag))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l5192
	line	503
	
l5184:; BSR set to: 0

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u4930
	goto	u4931

u4931:
	goto	l5192
u4930:
	line	505
	
l5186:; BSR set to: 0

	movf	((c:menu_handle_encoder@edit_flag))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u4941
	goto	u4940
u4941:
	goto	l5190
u4940:
	line	506
	
l5188:; BSR set to: 0

	movf	((c:menu_handle_encoder@edit_flag))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movlw	01h
	addwf	((c:menu_handle_encoder@opts))^00h,c,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movlw	0
	addwfc	((c:menu_handle_encoder@opts+1))^00h,c,w
	movwf	(??_menu_handle_encoder+0+0+1)^00h,c
	movff	??_menu_handle_encoder+0+0,tblptrl
	movff	??_menu_handle_encoder+0+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movff	tablat,??_menu_handle_encoder+2+0
	decf	(??_menu_handle_encoder+2+0)^00h,c,w
	movwf	indf2,c

	goto	l5192
	line	508
	
l5190:; BSR set to: 0

	movf	((c:menu_handle_encoder@edit_flag))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	decf	indf2

	line	512
	
l5192:; BSR set to: 0

	movlw	01h
	addwf	((c:menu_handle_encoder@opts))^00h,c,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movlw	0
	addwfc	((c:menu_handle_encoder@opts+1))^00h,c,w
	movwf	(??_menu_handle_encoder+0+0+1)^00h,c
	movff	??_menu_handle_encoder+0+0,tblptrl
	movff	??_menu_handle_encoder+0+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	movf	((c:menu_handle_encoder@edit_flag))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
		tblrd	*+
	movf	tablat,w
	subwf	postinc2,w
	btfss	status,0
	goto	u4951
	goto	u4950

u4951:
	goto	l466
u4950:
	line	513
	
l5194:; BSR set to: 0

	movf	((c:menu_handle_encoder@edit_flag))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l479
	line	515
	
l466:; BSR set to: 0

	goto	l479
	line	520
	
l5198:; BSR set to: 0

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u4961
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u4960
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u4961
	goto	u4960

u4961:
	goto	l5208
u4960:
	line	523
	
l5200:; BSR set to: 0

	movlw	low(-1)
	addwf	(0+(_menu+02h))&0ffh,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	clrf	1+(??_menu_handle_encoder+0+0)^00h,c
	movlw	high(-1)
	addwfc	1+(??_menu_handle_encoder+0+0)^00h,c
	movf	((_menu))&0ffh,w
	movwf	(??_menu_handle_encoder+2+0)^00h,c
	clrf	(??_menu_handle_encoder+2+0+1)^00h,c

		movf	(??_menu_handle_encoder+0+0)^00h,c,w
	subwf	(??_menu_handle_encoder+2+0)^00h,c,w
	movf	(??_menu_handle_encoder+2+1)^00h,c,w
	xorlw	80h
	movwf	(??_menu_handle_encoder+4+0)^00h,c
	movf	(??_menu_handle_encoder+0+1)^00h,c,w
	xorlw	80h
	subwfb	(??_menu_handle_encoder+4+0)^00h,c,w
	btfsc	status,0
	goto	u4971
	goto	u4970

u4971:
	goto	l479
u4970:
	line	525
	
l5202:; BSR set to: 0

	incf	((_menu))&0ffh
	line	528
	
l5204:; BSR set to: 0

	movf	(0+(_menu+01h))&0ffh,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	clrf	(??_menu_handle_encoder+0+0+1)^00h,c

	movlw	03h
	addwf	(??_menu_handle_encoder+0+0)^00h,c
	movlw	0
	addwfc	(??_menu_handle_encoder+0+1)^00h,c
	movf	((_menu))&0ffh,w
	movwf	(??_menu_handle_encoder+2+0)^00h,c
	clrf	(??_menu_handle_encoder+2+0+1)^00h,c

		movf	(??_menu_handle_encoder+0+0)^00h,c,w
	subwf	(??_menu_handle_encoder+2+0)^00h,c,w
	movf	(??_menu_handle_encoder+2+1)^00h,c,w
	xorlw	80h
	movwf	(??_menu_handle_encoder+4+0)^00h,c
	movf	(??_menu_handle_encoder+0+1)^00h,c,w
	xorlw	80h
	subwfb	(??_menu_handle_encoder+4+0)^00h,c,w
	btfss	status,0
	goto	u4981
	goto	u4980

u4981:
	goto	l479
u4980:
	line	530
	
l5206:; BSR set to: 0

	incf	(0+(_menu+01h))&0ffh
	goto	l479
	line	534
	
l5208:; BSR set to: 0

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u4990
	goto	u4991

u4991:
	goto	l479
u4990:
	line	537
	
l5210:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u5001
	goto	u5000
u5001:
	goto	l479
u5000:
	line	539
	
l5212:; BSR set to: 0

	decf	((_menu))&0ffh
	line	542
	
l5214:; BSR set to: 0

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u5011
	goto	u5010

u5011:
	goto	l479
u5010:
	line	544
	
l5216:; BSR set to: 0

	decf	(0+(_menu+01h))&0ffh
	line	548
	
l479:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_encoder
	__end_of_menu_handle_encoder:
	signat	_menu_handle_encoder,4217
	global	_menu_handle_button

;; *************** function _menu_handle_button *****************
;; Defined at:
;;		line 551 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  press_type      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  press_type      1   11[BANK0 ] unsigned char 
;;  i               1   10[BANK0 ] unsigned char 
;;  edit_flag       1    2[BANK0 ] PTR unsigned char 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), 
;;  opts            2    7[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  i               1    9[BANK0 ] unsigned char 
;;  edit_flag       1    1[BANK0 ] PTR unsigned char 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), 
;;  edit_flag       1    0[BANK0 ] PTR unsigned char 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), 
;;  opts            2    5[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  opts            2    3[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      12       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5      12       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       17 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_beep
;;		_get_item_options
;;		_menu_draw_input
;;		_menu_draw_options
;;		_menu_draw_setup
;;		_rebuild_input_menu
;;		_save_current_config
;;		_strcmp
;;		_strcpy
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text9,class=CODE,space=0,reloc=2,group=0
	line	551
global __ptext9
__ptext9:
psect	text9
	file	"src\menu.c"
	line	551
	
_menu_handle_button:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((menu_handle_button@press_type))&0ffh
	line	555
	
l5292:
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u5141
	goto	u5140
u5141:
	goto	l5346
u5140:
	line	557
	
l5294:; BSR set to: 0

		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u5151
	goto	u5150

u5151:
	goto	l5314
u5150:
	line	560
	
l5296:; BSR set to: 0

	movf	((_menu))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(menu_handle_button@opts)
	movff	1+?_get_item_options,(menu_handle_button@opts+1)
	line	561
	
l5298:
	movlb	0	; () banked
	movf	((menu_handle_button@opts))&0ffh,w
iorwf	((menu_handle_button@opts+1))&0ffh,w
	btfsc	status,2
	goto	u5161
	goto	u5160

u5161:
	goto	l5310
u5160:
	line	563
	
l5300:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u5171
	goto	u5170
u5171:
	goto	l5304
u5170:
	
l5302:; BSR set to: 0

		movlw	low(_sensor_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh

	goto	l5306
	
l5304:; BSR set to: 0

		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh

	line	566
	
l5306:; BSR set to: 0

	movf	((_menu))&0ffh,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strcpy@to)
	movff	postdec2,(c:strcpy@to+1)
	movf	((menu_handle_button@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movf	((??_menu_handle_button+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_handle_button+1+0
	movff	prodh,??_menu_handle_button+1+0+1
	movf	(??_menu_handle_button+1+0)^00h,c,w
	addwf	((menu_handle_button@opts))&0ffh,w
	movwf	(??_menu_handle_button+3+0)^00h,c
	movf	(??_menu_handle_button+1+1)^00h,c,w
	addwfc	((menu_handle_button@opts+1))&0ffh,w
	movwf	1+(??_menu_handle_button+3+0)^00h,c
	movlw	02h
	addwf	(??_menu_handle_button+3+0)^00h,c
	movlw	0
	addwfc	(??_menu_handle_button+3+1)^00h,c
	movff	??_menu_handle_button+3+0,tblptrl
	movff	??_menu_handle_button+3+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd*+
	
	movff	tablat,(c:strcpy@from)
	tblrd*-
	
	movff	tablat,(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	569
	
l5308:
	movlw	low(01h)
	movwf	((c:_save_pending))^00h,c
	line	572
	
l5310:
	movlw	low(0)
	movlb	0	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	573
	
l5312:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	574
	goto	l545
	line	575
	
l5314:; BSR set to: 0

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u5181
	goto	u5180

u5181:
	goto	l545
u5180:
	line	578
	
l5316:; BSR set to: 0

	movf	((_menu))&0ffh,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strcpy@to)
	movff	postdec2,(c:strcpy@to+1)
		movlw	low(_original_value)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(_original_value)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	581
	
l5318:
	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(menu_handle_button@opts_1008)
	movff	1+?_get_item_options,(menu_handle_button@opts_1008+1)
	line	582
	
l5320:
	movlb	0	; () banked
	movf	((menu_handle_button@opts_1008))&0ffh,w
iorwf	((menu_handle_button@opts_1008+1))&0ffh,w
	btfsc	status,2
	goto	u5191
	goto	u5190

u5191:
	goto	l5338
u5190:
	line	584
	
l5322:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u5201
	goto	u5200
u5201:
	goto	l5326
u5200:
	
l5324:; BSR set to: 0

		movlw	low(_sensor_edit_flag)
	movwf	((menu_handle_button@edit_flag_1012))&0ffh

	goto	l5328
	
l5326:; BSR set to: 0

		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_button@edit_flag_1012))&0ffh

	line	587
	
l5328:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_handle_button@i))&0ffh
	goto	l5336
	line	589
	
l5330:; BSR set to: 0

		movlw	low(_original_value)
	movwf	((c:strcmp@s1))^00h,c
	movlw	high(_original_value)
	movwf	((c:strcmp@s1+1))^00h,c

	movf	((menu_handle_button@i))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(??_menu_handle_button+0+0)^00h,c,w
	addwf	((menu_handle_button@opts_1008))&0ffh,w
	movwf	(??_menu_handle_button+2+0)^00h,c
	movf	(??_menu_handle_button+0+1)^00h,c,w
	addwfc	((menu_handle_button@opts_1008+1))&0ffh,w
	movwf	1+(??_menu_handle_button+2+0)^00h,c
	movlw	02h
	addwf	(??_menu_handle_button+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_handle_button+2+1)^00h,c
	movff	??_menu_handle_button+2+0,tblptrl
	movff	??_menu_handle_button+2+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd*+
	
	movff	tablat,(c:strcmp@s2)
	tblrd*-
	
	movff	tablat,(c:strcmp@s2+1)

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u5211
	goto	u5210

u5211:
	goto	l5334
u5210:
	line	591
	
l5332:
	movlb	0	; () banked
	movf	((menu_handle_button@edit_flag_1012))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	movff	(menu_handle_button@i),indf2

	line	592
	goto	l5338
	line	587
	
l5334:
	movlb	0	; () banked
	incf	((menu_handle_button@i))&0ffh
	
l5336:; BSR set to: 0

	movlw	01h
	addwf	((menu_handle_button@opts_1008))&0ffh,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	0
	addwfc	((menu_handle_button@opts_1008+1))&0ffh,w
	movwf	(??_menu_handle_button+0+0+1)^00h,c
	movff	??_menu_handle_button+0+0,tblptrl
	movff	??_menu_handle_button+0+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
		tblrd	*+
	movf	tablat,w
	subwf	((menu_handle_button@i))&0ffh,w
	btfss	status,0
	goto	u5221
	goto	u5220

u5221:
	goto	l5330
u5220:
	line	597
	
l5338:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	598
	
l5340:; BSR set to: 0

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	599
	
l5342:
	asmopt push
asmopt off
movlw  3
movwf	(??_menu_handle_button+0+0+1)^00h,c
movlw	8
movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	119
u5607:
decfsz	wreg,f
	bra	u5607
	decfsz	(??_menu_handle_button+0+0)^00h,c,f
	bra	u5607
	decfsz	(??_menu_handle_button+0+0+1)^00h,c,f
	bra	u5607
	nop
asmopt pop

	line	600
	
l5344:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l545
	line	602
	
l498:; BSR set to: 0

	goto	l545
	line	605
	
l5346:; BSR set to: 0

		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u5231
	goto	u5230

u5231:
	goto	l5434
u5230:
	line	607
	
l5348:; BSR set to: 0

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u5241
	goto	u5240
u5241:
	goto	l5366
u5240:
	line	609
	
l5350:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	611
	goto	l5364
	line	618
	
l5352:; BSR set to: 0

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	619
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	620
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	621
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	622
	
l5354:; BSR set to: 0

	call	_menu_draw_setup	;wreg free
	line	623
	goto	l545
	line	636
	
l5356:; BSR set to: 0

	movf	((c:_save_pending))^00h,c,w
	btfsc	status,2
	goto	u5251
	goto	u5250
u5251:
	goto	l498
u5250:
	line	638
	
l5358:; BSR set to: 0

	call	_save_current_config	;wreg free
	line	639
	
l5360:
	movlw	low(0)
	movwf	((c:_save_pending))^00h,c
	goto	l545
	line	611
	
l5364:
	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l498
	xorlw	1^0	; case 1
	skipnz
	goto	l5352
	xorlw	2^1	; case 2
	skipnz
	goto	l498
	xorlw	3^2	; case 3
	skipnz
	goto	l498
	xorlw	4^3	; case 4
	skipnz
	goto	l5356
	goto	l545

	line	645
	
l5366:; BSR set to: 0

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u5261
	goto	u5260

u5261:
	goto	l5410
u5260:
	line	647
	
l5368:; BSR set to: 0

		movlw	11
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u5271
	goto	u5270

u5271:
	goto	l5382
u5270:
	line	649
	
l5370:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	651
	
l5372:
	movlw	low(02h)
	movlb	0	; () banked
	movwf	((_current_menu))&0ffh
	line	652
	
l5374:; BSR set to: 0

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	653
	
l5376:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	654
	
l5378:; BSR set to: 0

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l5354
	line	657
	
l5382:; BSR set to: 0

	movf	((_menu))&0ffh,w
	mullw	05h
	movlw	low(_input_menu+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfsc	status,2
	goto	u5281
	goto	u5280
u5281:
	goto	l545
u5280:
	line	660
	
l5384:; BSR set to: 0

		movlw	low(_original_value)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_original_value)
	movwf	((c:strcpy@to+1))^00h,c

	movf	((_menu))&0ffh,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strcpy@from)
	movff	postdec2,(c:strcpy@from+1)
	call	_strcpy	;wreg free
	line	663
	
l5386:
	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(menu_handle_button@opts_1015)
	movff	1+?_get_item_options,(menu_handle_button@opts_1015+1)
	line	664
	
l5388:
	movlb	0	; () banked
	movf	((menu_handle_button@opts_1015))&0ffh,w
iorwf	((menu_handle_button@opts_1015+1))&0ffh,w
	btfsc	status,2
	goto	u5291
	goto	u5290

u5291:
	goto	l5406
u5290:
	line	666
	
l5390:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u5301
	goto	u5300
u5301:
	goto	l5394
u5300:
	
l5392:; BSR set to: 0

		movlw	low(_sensor_edit_flag)
	movwf	((menu_handle_button@edit_flag_1019))&0ffh

	goto	l5396
	
l5394:; BSR set to: 0

		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_button@edit_flag_1019))&0ffh

	line	669
	
l5396:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_handle_button@i_1021))&0ffh
	goto	l5404
	line	671
	
l5398:; BSR set to: 0

	movf	((_menu))&0ffh,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strcmp@s1)
	movff	postdec2,(c:strcmp@s1+1)
	movf	((menu_handle_button@i_1021))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(??_menu_handle_button+0+0)^00h,c,w
	addwf	((menu_handle_button@opts_1015))&0ffh,w
	movwf	(??_menu_handle_button+2+0)^00h,c
	movf	(??_menu_handle_button+0+1)^00h,c,w
	addwfc	((menu_handle_button@opts_1015+1))&0ffh,w
	movwf	1+(??_menu_handle_button+2+0)^00h,c
	movlw	02h
	addwf	(??_menu_handle_button+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_handle_button+2+1)^00h,c
	movff	??_menu_handle_button+2+0,tblptrl
	movff	??_menu_handle_button+2+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd*+
	
	movff	tablat,(c:strcmp@s2)
	tblrd*-
	
	movff	tablat,(c:strcmp@s2+1)

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u5311
	goto	u5310

u5311:
	goto	l5402
u5310:
	line	673
	
l5400:
	movlb	0	; () banked
	movf	((menu_handle_button@edit_flag_1019))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	movff	(menu_handle_button@i_1021),indf2

	line	674
	goto	l5406
	line	669
	
l5402:
	movlb	0	; () banked
	incf	((menu_handle_button@i_1021))&0ffh
	
l5404:; BSR set to: 0

	movlw	01h
	addwf	((menu_handle_button@opts_1015))&0ffh,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	0
	addwfc	((menu_handle_button@opts_1015+1))&0ffh,w
	movwf	(??_menu_handle_button+0+0+1)^00h,c
	movff	??_menu_handle_button+0+0,tblptrl
	movff	??_menu_handle_button+0+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
		tblrd	*+
	movf	tablat,w
	subwf	((menu_handle_button@i_1021))&0ffh,w
	btfss	status,0
	goto	u5321
	goto	u5320

u5321:
	goto	l5398
u5320:
	line	679
	
l5406:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_menu+03h))&0ffh
	line	680
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l5312
	line	684
	
l5410:; BSR set to: 0

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u5331
	goto	u5330

u5331:
	goto	l498
u5330:
	line	686
	
l5412:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	688
	
l5414:
		movlw	4
	movlb	0	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u5341
	goto	u5340

u5341:
	goto	l5420
u5340:
	line	691
	
l5416:; BSR set to: 0

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	692
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	693
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	694
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	695
	
l5418:; BSR set to: 0

	call	_menu_draw_options	;wreg free
	line	696
	goto	l545
	line	697
	
l5420:; BSR set to: 0

		movlw	03h-0
	cpfslt	((_menu))&0ffh
	goto	u5351
	goto	u5350

u5351:
	goto	l498
u5350:
	line	700
	
l5422:; BSR set to: 0

	movf	((_menu))&0ffh,w
	
	call	_rebuild_input_menu
	line	703
	
l5424:
	movlw	low(01h)
	movlb	0	; () banked
	movwf	((_current_menu))&0ffh
	line	704
	
l5426:; BSR set to: 0

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	705
	
l5428:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	707
	
l5430:; BSR set to: 0

	call	_menu_draw_input	;wreg free
	line	708
	goto	l545
	line	715
	
l5434:; BSR set to: 0

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u5361
	goto	u5360

u5361:
	goto	l5442
u5360:
	goto	l5340
	line	721
	
l5442:; BSR set to: 0

		movlw	3
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u5371
	goto	u5370

u5371:
	goto	l545
u5370:
	line	723
	
l5444:; BSR set to: 0

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	724
	
l5446:
	asmopt push
asmopt off
movlw  3
movwf	(??_menu_handle_button+0+0+1)^00h,c
movlw	8
movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	119
u5617:
decfsz	wreg,f
	bra	u5617
	decfsz	(??_menu_handle_button+0+0)^00h,c,f
	bra	u5617
	decfsz	(??_menu_handle_button+0+0+1)^00h,c,f
	bra	u5617
	nop
asmopt pop

	line	725
	
l5448:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	726
	asmopt push
asmopt off
movlw  3
movwf	(??_menu_handle_button+0+0+1)^00h,c
movlw	8
movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	119
u5627:
decfsz	wreg,f
	bra	u5627
	decfsz	(??_menu_handle_button+0+0)^00h,c,f
	bra	u5627
	decfsz	(??_menu_handle_button+0+0+1)^00h,c,f
	bra	u5627
	nop
asmopt pop

	goto	l5344
	line	730
	
l545:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_button
	__end_of_menu_handle_button:
	signat	_menu_handle_button,4217
	global	_rebuild_input_menu

;; *************** function _rebuild_input_menu *****************
;; Defined at:
;;		line 174 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  input_num       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  input_num       1   66[COMRAM] unsigned char 
;;  sensor          1   61[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        22       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        23       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       23 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		___lwdiv
;;		___lwmod
;;		_memcpy
;;		_sprintf
;;		_strcpy
;; This function is called by:
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2,group=0
	line	174
global __ptext10
__ptext10:
psect	text10
	file	"src\menu.c"
	line	174
	
_rebuild_input_menu:
;incstack = 0
	callstack 26
	movwf	((c:rebuild_input_menu@input_num))^00h,c
	line	177
	
l4868:
	movff	(c:rebuild_input_menu@input_num),(c:_current_input)
	line	180
	
l4870:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:rebuild_input_menu@sensor))^00h,c
	line	183
	
l4872:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfss	status,2
	goto	u4701
	goto	u4700
u4701:
	goto	l4876
u4700:
	
l4874:
		movlw	low(STR_73)
	movwf	((c:_rebuild_input_menu$885))^00h,c
	movlw	high(STR_73)
	movwf	((c:_rebuild_input_menu$885+1))^00h,c

	goto	l4878
	
l4876:
		movlw	low(STR_72)
	movwf	((c:_rebuild_input_menu$885))^00h,c
	movlw	high(STR_72)
	movwf	((c:_rebuild_input_menu$885+1))^00h,c

	
l4878:
		movlw	low(_value_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_71)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_71)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(c:_rebuild_input_menu$885),0+((c:?_sprintf)+04h)
	movff	(c:_rebuild_input_menu$885+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	185
	
l4880:
	movf	((c:rebuild_input_menu@sensor))^00h,c,w
	btfss	status,2
	goto	u4711
	goto	u4710
u4711:
	goto	l4986
u4710:
	line	187
	
l4882:
		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_74)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_74)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	188
	
l4884:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_75)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_75)
	movwf	((c:sprintf@f+1))^00h,c

	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+04h)
	movff	postdec2,1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	189
	
l4886:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_76)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_76)
	movwf	((c:sprintf@f+1))^00h,c

	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+04h)
	movff	postdec2,1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	190
	
l4888:
		movlw	low(_value_hi_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_hi_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_77)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_77)
	movwf	((c:sprintf@f+1))^00h,c

	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+04h)
	movff	postdec2,1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	192
	
l4890:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:___lwdiv@dividend)
	movff	postdec2,(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:_rebuild_input_menu$1961)
	movff	1+?___lwdiv,(c:_rebuild_input_menu$1961+1)
	
l4892:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:___lwmod@dividend)
	movff	postdec2,(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movff	0+?___lwmod,(c:_rebuild_input_menu$1962)
	movff	1+?___lwmod,(c:_rebuild_input_menu$1962+1)
	
l4894:
		movlw	low(_value_highbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_highbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_78)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_78)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:_rebuild_input_menu$1961),0+((c:?_sprintf)+04h)
	movff	(c:_rebuild_input_menu$1961+1),1+((c:?_sprintf)+04h)
	movff	(c:_rebuild_input_menu$1962),0+((c:?_sprintf)+06h)
	movff	(c:_rebuild_input_menu$1962+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	193
	
l4896:
		movlw	low(_value_low_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_79)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_79)
	movwf	((c:sprintf@f+1))^00h,c

	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+0Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+04h)
	movff	postdec2,1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	195
	
l4898:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:___lwdiv@dividend)
	movff	postdec2,(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:_rebuild_input_menu$1961)
	movff	1+?___lwdiv,(c:_rebuild_input_menu$1961+1)
	
l4900:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:___lwmod@dividend)
	movff	postdec2,(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movff	0+?___lwmod,(c:_rebuild_input_menu$1962)
	movff	1+?___lwmod,(c:_rebuild_input_menu$1962+1)
	
l4902:
		movlw	low(_value_plpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_plpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_80)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_80)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:_rebuild_input_menu$1961),0+((c:?_sprintf)+04h)
	movff	(c:_rebuild_input_menu$1961+1),1+((c:?_sprintf)+04h)
	movff	(c:_rebuild_input_menu$1962),0+((c:?_sprintf)+06h)
	movff	(c:_rebuild_input_menu$1962+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	197
	
l4904:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:___lwdiv@dividend)
	movff	postdec2,(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:_rebuild_input_menu$1961)
	movff	1+?___lwdiv,(c:_rebuild_input_menu$1961+1)
	
l4906:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:___lwmod@dividend)
	movff	postdec2,(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movff	0+?___lwmod,(c:_rebuild_input_menu$1962)
	movff	1+?___lwmod,(c:_rebuild_input_menu$1962+1)
	
l4908:
		movlw	low(_value_slpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_slpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_81)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_81)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:_rebuild_input_menu$1961),0+((c:?_sprintf)+04h)
	movff	(c:_rebuild_input_menu$1961+1),1+((c:?_sprintf)+04h)
	movff	(c:_rebuild_input_menu$1962),0+((c:?_sprintf)+06h)
	movff	(c:_rebuild_input_menu$1962+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	200
	
l4910:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+038h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+038h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfsc	status,2
	goto	u4721
	goto	u4720
u4721:
	goto	l4918
u4720:
	
l4912:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+038h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+038h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	decf	postinc2,w
	btfsc	status,2
	goto	u4731
	goto	u4730

u4731:
	goto	l4916
u4730:
	
l4914:
		movlw	low(STR_84)
	movwf	((c:_rebuild_input_menu$900))^00h,c
	movlw	high(STR_84)
	movwf	((c:_rebuild_input_menu$900+1))^00h,c

	goto	l354
	
l4916:
		movlw	low(STR_83)
	movwf	((c:_rebuild_input_menu$900))^00h,c
	movlw	high(STR_83)
	movwf	((c:_rebuild_input_menu$900+1))^00h,c

	
l354:
		movff	(c:_rebuild_input_menu$900),(c:_rebuild_input_menu$899)
	movff	(c:_rebuild_input_menu$900+1),(c:_rebuild_input_menu$899+1)

	goto	l4920
	
l4918:
		movlw	low(STR_82)
	movwf	((c:_rebuild_input_menu$899))^00h,c
	movlw	high(STR_82)
	movwf	((c:_rebuild_input_menu$899+1))^00h,c

	
l4920:
		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(c:_rebuild_input_menu$899),(c:strcpy@from)
	movff	(c:_rebuild_input_menu$899+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	202
	
l4922:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+039h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+039h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfsc	status,2
	goto	u4741
	goto	u4740
u4741:
	goto	l4930
u4740:
	
l4924:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+039h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+039h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	decf	postinc2,w
	btfsc	status,2
	goto	u4751
	goto	u4750

u4751:
	goto	l4928
u4750:
	
l4926:
		movlw	low(STR_87)
	movwf	((c:_rebuild_input_menu$907))^00h,c
	movlw	high(STR_87)
	movwf	((c:_rebuild_input_menu$907+1))^00h,c

	goto	l362
	
l4928:
		movlw	low(STR_86)
	movwf	((c:_rebuild_input_menu$907))^00h,c
	movlw	high(STR_86)
	movwf	((c:_rebuild_input_menu$907+1))^00h,c

	
l362:
		movff	(c:_rebuild_input_menu$907),(c:_rebuild_input_menu$906)
	movff	(c:_rebuild_input_menu$907+1),(c:_rebuild_input_menu$906+1)

	goto	l4932
	
l4930:
		movlw	low(STR_85)
	movwf	((c:_rebuild_input_menu$906))^00h,c
	movlw	high(STR_85)
	movwf	((c:_rebuild_input_menu$906+1))^00h,c

	
l4932:
		movlw	low(_value_rlyplp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyplp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(c:_rebuild_input_menu$906),(c:strcpy@from)
	movff	(c:_rebuild_input_menu$906+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	204
	
l4934:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+03Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfsc	status,2
	goto	u4761
	goto	u4760
u4761:
	goto	l4942
u4760:
	
l4936:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+03Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	decf	postinc2,w
	btfsc	status,2
	goto	u4771
	goto	u4770

u4771:
	goto	l4940
u4770:
	
l4938:
		movlw	low(STR_90)
	movwf	((c:_rebuild_input_menu$914))^00h,c
	movlw	high(STR_90)
	movwf	((c:_rebuild_input_menu$914+1))^00h,c

	goto	l370
	
l4940:
		movlw	low(STR_89)
	movwf	((c:_rebuild_input_menu$914))^00h,c
	movlw	high(STR_89)
	movwf	((c:_rebuild_input_menu$914+1))^00h,c

	
l370:
		movff	(c:_rebuild_input_menu$914),(c:_rebuild_input_menu$913)
	movff	(c:_rebuild_input_menu$914+1),(c:_rebuild_input_menu$913+1)

	goto	l4944
	
l4942:
		movlw	low(STR_88)
	movwf	((c:_rebuild_input_menu$913))^00h,c
	movlw	high(STR_88)
	movwf	((c:_rebuild_input_menu$913+1))^00h,c

	
l4944:
		movlw	low(_value_rlyslp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyslp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(c:_rebuild_input_menu$913),(c:strcpy@from)
	movff	(c:_rebuild_input_menu$913+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	205
	
l4946:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfss	status,2
	goto	u4781
	goto	u4780
u4781:
	goto	l4950
u4780:
	
l4948:
		movlw	low(STR_92)
	movwf	((c:_rebuild_input_menu$918))^00h,c
	movlw	high(STR_92)
	movwf	((c:_rebuild_input_menu$918+1))^00h,c

	goto	l4952
	
l4950:
		movlw	low(STR_91)
	movwf	((c:_rebuild_input_menu$918))^00h,c
	movlw	high(STR_91)
	movwf	((c:_rebuild_input_menu$918+1))^00h,c

	
l4952:
		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(c:_rebuild_input_menu$918),(c:strcpy@from)
	movff	(c:_rebuild_input_menu$918+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	208
	
l4954:
		movlw	low(_input_menu)
	movwf	((c:memcpy@d1))^00h,c
	movlw	high(_input_menu)
	movwf	((c:memcpy@d1+1))^00h,c

		movlw	low(_pressure_menu_template)
	movwf	((c:memcpy@s1))^00h,c
	movlw	high(_pressure_menu_template)
	movwf	((c:memcpy@s1+1))^00h,c

	movlw	high(046h)
	movwf	((c:memcpy@n+1))^00h,c
	movlw	low(046h)
	movwf	((c:memcpy@n))^00h,c
	call	_memcpy	;wreg free
	line	211
	
l4956:
		movlw	low(_value_enable)
	movlb	1	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	212
	
l4958:; BSR set to: 1

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	213
	
l4960:; BSR set to: 1

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	clrf	(1+(_input_menu+0Ch))&0ffh

	line	214
	
l4962:; BSR set to: 1

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	215
	
l4964:; BSR set to: 1

		movlw	low(_value_hi_pressure)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_hi_pressure)
	movwf	(1+(_input_menu+016h))&0ffh

	line	216
	
l4966:; BSR set to: 1

		movlw	low(_value_highbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_highbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	217
	
l4968:; BSR set to: 1

		movlw	low(_value_low_pressure)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_pressure)
	movwf	(1+(_input_menu+020h))&0ffh

	line	218
	
l4970:; BSR set to: 1

		movlw	low(_value_plpbp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_plpbp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	219
	
l4972:; BSR set to: 1

		movlw	low(_value_slpbp)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_slpbp)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	220
	
l4974:; BSR set to: 1

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	221
	
l4976:; BSR set to: 1

		movlw	low(_value_rlyplp)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_rlyplp)
	movwf	(1+(_input_menu+034h))&0ffh

	line	222
	
l4978:; BSR set to: 1

		movlw	low(_value_rlyslp)
	movwf	(0+(_input_menu+039h))&0ffh
	movlw	high(_value_rlyslp)
	movwf	(1+(_input_menu+039h))&0ffh

	line	223
	
l4980:; BSR set to: 1

		movlw	low(_value_display)
	movwf	(0+(_input_menu+03Eh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+03Eh))&0ffh

	line	224
	
l4982:; BSR set to: 1

		movlw	low(_value_back)
	movwf	(0+(_input_menu+043h))&0ffh
	clrf	(1+(_input_menu+043h))&0ffh

	line	226
	
l4984:; BSR set to: 1

	movlw	low(0Eh)
	movlb	0	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	227
	goto	l377
	line	228
	
l4986:
		decf	((c:rebuild_input_menu@sensor))^00h,c,w
	btfss	status,2
	goto	u4791
	goto	u4790

u4791:
	goto	l377
u4790:
	line	230
	
l4988:
		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_93)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_93)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	231
	
l4990:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_94)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_94)
	movwf	((c:sprintf@f+1))^00h,c

	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+04h)
	movff	postdec2,1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	232
	
l4992:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_95)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_95)
	movwf	((c:sprintf@f+1))^00h,c

	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+04h)
	movff	postdec2,1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	233
	
l4994:
		movlw	low(_value_high_temp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_temp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_96)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_96)
	movwf	((c:sprintf@f+1))^00h,c

	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+04h)
	movff	postdec2,1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	235
	
l4996:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:___lwdiv@dividend)
	movff	postdec2,(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:_rebuild_input_menu$1961)
	movff	1+?___lwdiv,(c:_rebuild_input_menu$1961+1)
	
l4998:
	movf	((c:rebuild_input_menu@input_num))^00h,c,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:___lwmod@dividend)
	movff	postdec2,(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movff	0+?___lwmod,(c:_rebuild_input_menu$1962)
	movff	1+?___lwmod,(c:_rebuild_input_menu$1962+1)
	
l5000:
		movlw	low(_value_high_tbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_tbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_97)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_97)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:_rebuild_input_menu$1961),0+((c:?_sprintf)+04h)
	movff	(c:_rebuild_input_menu$1961+1),1+((c:?_sprintf)+04h)
	movff	(c:_rebuild_input_menu$1962),0+((c:?_sprintf)+06h)
	movff	(c:_rebuild_input_menu$1962+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	238
	
l5002:
		movlw	low(_input_menu)
	movwf	((c:memcpy@d1))^00h,c
	movlw	high(_input_menu)
	movwf	((c:memcpy@d1+1))^00h,c

		movlw	low(_temp_menu_template)
	movwf	((c:memcpy@s1))^00h,c
	movlw	high(_temp_menu_template)
	movwf	((c:memcpy@s1+1))^00h,c

	movlw	high(02Dh)
	movwf	((c:memcpy@n+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:memcpy@n))^00h,c
	call	_memcpy	;wreg free
	line	241
	
l5004:
		movlw	low(_value_enable)
	movlb	1	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	242
	
l5006:; BSR set to: 1

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	243
	
l5008:; BSR set to: 1

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	clrf	(1+(_input_menu+0Ch))&0ffh

	line	244
	
l5010:; BSR set to: 1

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	245
	
l5012:; BSR set to: 1

		movlw	low(_value_high_temp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_high_temp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	246
	
l5014:; BSR set to: 1

		movlw	low(_value_high_tbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_high_tbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	247
	
l5016:; BSR set to: 1

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+020h))&0ffh

	line	248
	
l5018:; BSR set to: 1

		movlw	low(_value_display)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+025h))&0ffh

	line	249
	
l5020:; BSR set to: 1

		movlw	low(_value_back)
	movwf	(0+(_input_menu+02Ah))&0ffh
	clrf	(1+(_input_menu+02Ah))&0ffh

	line	251
	
l5022:; BSR set to: 1

	movlw	low(09h)
	movlb	0	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	254
	
l377:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_input_menu
	__end_of_rebuild_input_menu:
	signat	_rebuild_input_menu,4217
	global	_menu_draw_setup

;; *************** function _menu_draw_setup *****************
;; Defined at:
;;		line 733 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  type_text       2   41[COMRAM] PTR const unsigned char 
;;		 -> STR_122(5), STR_121(5), STR_120(9), 
;;  type_len        1   40[COMRAM] unsigned char 
;;  sensor_type     1   43[COMRAM] unsigned char 
;;  item_idx        1   44[COMRAM] unsigned char 
;;  i               1   45[COMRAM] unsigned char 
;;  setup_items    10   30[COMRAM] PTR const unsigned char 
;;		 -> STR_119(5), STR_118(6), STR_117(8), STR_116(8), 
;;		 -> STR_115(8), 
;;  sensor_type_    6   24[COMRAM] PTR const unsigned char 
;;		 -> STR_122(5), STR_121(5), STR_120(9), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        22       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        27       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       27 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_lcd_clear_line
;;		_lcd_print
;;		_lcd_print_at
;;		_strlen
;; This function is called by:
;;		_main
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2,group=0
	line	733
global __ptext11
__ptext11:
psect	text11
	file	"src\menu.c"
	line	733
	
_menu_draw_setup:
;incstack = 0
	callstack 24
	line	738
	
l4828:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	739
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_114)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_114)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	747
	
l4830:
	lfsr	2,(menu_draw_setup@F2444)
	lfsr	1,(menu_draw_setup@setup_items)
	movlw	10-1
u4631:
	movff	plusw2,plusw1
	decf	wreg
	bc	u4631

	line	750
	
l4832:
	lfsr	2,(menu_draw_setup@F2446)
	lfsr	1,(menu_draw_setup@sensor_type_names)
	movlw	6-1
u4641:
	movff	plusw2,plusw1
	decf	wreg
	bc	u4641

	line	753
	
l4834:
	movlw	low(0)
	movwf	((c:menu_draw_setup@i))^00h,c
	goto	l4864
	line	755
	
l4836:; BSR set to: 0

	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_setup@i))^00h,c,w
	movwf	((c:menu_draw_setup@item_idx))^00h,c
	line	756
	
l4838:; BSR set to: 0

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_clear_line
	line	759
	
l4840:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	0	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u4651
	goto	u4650

u4651:
	goto	l4848
u4650:
	line	761
	
l4842:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_123)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_123)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	762
	
l4844:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_items)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:lcd_print@str)
	movff	postdec2,(c:lcd_print@str+1)
	call	_lcd_print	;wreg free
	line	763
	
l4846:
		movlw	low(STR_124)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_124)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	764
	goto	l4850
	line	767
	
l4848:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_items)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:lcd_print_at@str)
	movff	postdec2,(c:lcd_print_at@str+1)
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	771
	
l4850:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u4661
	goto	u4660

u4661:
	goto	l4862
u4660:
	line	773
	
l4852:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:menu_draw_setup@sensor_type))^00h,c
	line	774
	
l4854:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@sensor_type))^00h,c
	goto	u4671
	goto	u4670

u4671:
	goto	l4862
u4670:
	line	776
	
l4856:
	movf	((c:menu_draw_setup@sensor_type))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@sensor_type_names)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:menu_draw_setup@type_text)
	movff	postdec2,(c:menu_draw_setup@type_text+1)
	line	777
	
l4858:
		movff	(c:menu_draw_setup@type_text),(c:strlen@s)
	movff	(c:menu_draw_setup@type_text+1),(c:strlen@s+1)

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_setup@type_len))^00h,c
	line	779
	
l4860:
	movf	((c:menu_draw_setup@type_len))^00h,c,w
	sublw	low(014h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@type_text),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@type_text+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	753
	
l4862:
	incf	((c:menu_draw_setup@i))^00h,c
	
l4864:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@i))^00h,c
	goto	u4681
	goto	u4680

u4681:
	goto	l563
u4680:
	
l4866:
	movlb	0	; () banked
	movf	(0+(_menu+02h))&0ffh,w
	movwf	(??_menu_draw_setup+0+0)^00h,c
	clrf	(??_menu_draw_setup+0+0+1)^00h,c

	movf	((c:menu_draw_setup@i))^00h,c,w
	movff	0+(_menu+01h),??_menu_draw_setup+2+0
	clrf	(??_menu_draw_setup+2+0+1)^00h,c
	addwf	(??_menu_draw_setup+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_setup+2+1)^00h,c
		movf	(??_menu_draw_setup+0+0)^00h,c,w
	subwf	(??_menu_draw_setup+2+0)^00h,c,w
	movf	(??_menu_draw_setup+2+1)^00h,c,w
	xorlw	80h
	movwf	(??_menu_draw_setup+4+0)^00h,c
	movf	(??_menu_draw_setup+0+1)^00h,c,w
	xorlw	80h
	subwfb	(??_menu_draw_setup+4+0)^00h,c,w
	btfss	status,0
	goto	u4691
	goto	u4690

u4691:
	goto	l4836
u4690:
	line	783
	
l563:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_setup
	__end_of_menu_draw_setup:
	signat	_menu_draw_setup,89
	global	_menu_draw_options

;; *************** function _menu_draw_options *****************
;; Defined at:
;;		line 257 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   24[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_lcd_clear_line
;;		_lcd_print
;;		_lcd_print_at
;; This function is called by:
;;		_main
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2,group=0
	line	257
global __ptext12
__ptext12:
psect	text12
	file	"src\menu.c"
	line	257
	
_menu_draw_options:
;incstack = 0
	callstack 24
	line	260
	
l4688:; BSR set to: 0

	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	261
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_98)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_98)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	264
	
l4690:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	goto	l4706
	line	266
	
l4692:; BSR set to: 0

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	269
	
l4694:
	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	movwf	(??_menu_draw_options+0+0)^00h,c
	clrf	(??_menu_draw_options+0+0+1)^00h,c

	movf	((c:menu_draw_options@i))^00h,c,w
	movff	0+(_menu+01h),??_menu_draw_options+2+0
	clrf	(??_menu_draw_options+2+0+1)^00h,c
	addwf	(??_menu_draw_options+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_options+2+1)^00h,c
	movf	(??_menu_draw_options+0+0)^00h,c,w
xorwf	(??_menu_draw_options+2+0)^00h,c,w
	bnz	u4421
movf	(??_menu_draw_options+0+1)^00h,c,w
xorwf	(??_menu_draw_options+2+1)^00h,c,w
	btfss	status,2
	goto	u4421
	goto	u4420

u4421:
	goto	l4702
u4420:
	line	271
	
l4696:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_99)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_99)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_print_at
	line	272
	
l4698:
	movf	((c:menu_draw_options@i))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_options+0+0
	movlb	0	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(_options_menu)
	addwf	(??_menu_draw_options+0+0)^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:lcd_print@str)
	movff	postdec2,(c:lcd_print@str+1)
	call	_lcd_print	;wreg free
	line	273
	
l4700:
		movlw	low(STR_100)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_100)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	274
	goto	l4704
	line	277
	
l4702:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
	movf	((c:menu_draw_options@i))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_options+0+0
	movf	(0+(_menu+01h))&0ffh,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(_options_menu)
	addwf	(??_menu_draw_options+0+0)^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:lcd_print_at@str)
	movff	postdec2,(c:lcd_print_at@str+1)
	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_print_at
	line	264
	
l4704:
	incf	((c:menu_draw_options@i))^00h,c
	
l4706:
		movlw	03h-0
	cpfslt	((c:menu_draw_options@i))^00h,c
	goto	u4431
	goto	u4430

u4431:
	goto	l387
u4430:
	
l4708:
	movlb	0	; () banked
	movf	(0+(_menu+02h))&0ffh,w
	movwf	(??_menu_draw_options+0+0)^00h,c
	clrf	(??_menu_draw_options+0+0+1)^00h,c

	movf	((c:menu_draw_options@i))^00h,c,w
	movff	0+(_menu+01h),??_menu_draw_options+2+0
	clrf	(??_menu_draw_options+2+0+1)^00h,c
	addwf	(??_menu_draw_options+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_options+2+1)^00h,c
		movf	(??_menu_draw_options+0+0)^00h,c,w
	subwf	(??_menu_draw_options+2+0)^00h,c,w
	movf	(??_menu_draw_options+2+1)^00h,c,w
	xorlw	80h
	movwf	(??_menu_draw_options+4+0)^00h,c
	movf	(??_menu_draw_options+0+1)^00h,c,w
	xorlw	80h
	subwfb	(??_menu_draw_options+4+0)^00h,c,w
	btfss	status,0
	goto	u4441
	goto	u4440

u4441:
	goto	l4692
u4440:
	line	280
	
l387:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_options
	__end_of_menu_draw_options:
	signat	_menu_draw_options,89
	global	_menu_draw_input

;; *************** function _menu_draw_input *****************
;; Defined at:
;;		line 283 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1   86[COMRAM] unsigned char 
;;  j               1   87[COMRAM] unsigned char 
;;  val_len         1   84[COMRAM] unsigned char 
;;  val_len         1   85[COMRAM] unsigned char 
;;  flag_value      1   83[COMRAM] unsigned char 
;;  flag_value      1   82[COMRAM] unsigned char 
;;  opts            2   90[COMRAM] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  opts            2   88[COMRAM] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  start_pos       1   73[COMRAM] unsigned char 
;;  value_buf      15   58[COMRAM] unsigned char [15]
;;  item_idx        1   95[COMRAM] unsigned char 
;;  show_bracket    1   93[COMRAM] unsigned char 
;;  val_len         1   92[COMRAM] unsigned char 
;;  i               1   94[COMRAM] unsigned char 
;;  title          10   48[COMRAM] unsigned char [10]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        48       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        52       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       52 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_get_item_options
;;		_lcd_clear_line
;;		_lcd_print
;;		_lcd_print_at
;;		_lcd_set_cursor
;;		_sprintf
;;		_strcmp
;;		_strcpy
;;		_strlen
;; This function is called by:
;;		_main
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2,group=0
	line	283
global __ptext13
__ptext13:
psect	text13
	file	"src\menu.c"
	line	283
	
_menu_draw_input:
;incstack = 0
	callstack 24
	line	286
	
l4710:; BSR set to: 0

	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	288
	
l4712:
		movlw	low(menu_draw_input@title)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_101)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_101)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(01h)
	addwf	((c:_current_input))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	1+(0+((c:?_sprintf)+04h))^00h,c
	movlw	high(01h)
	addwfc	1+(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	289
	
l4714:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@title)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	292
	
l4716:
	movlw	low(0)
	movwf	((c:menu_draw_input@i))^00h,c
	goto	l4824
	line	294
	
l4718:
	movlb	0	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_input@i))^00h,c,w
	movwf	((c:menu_draw_input@item_idx))^00h,c
	line	295
	
l4720:; BSR set to: 0

	incf	((c:menu_draw_input@i))^00h,c,w
	
	call	_lcd_clear_line
	line	298
	
l4722:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
	movf	((c:menu_draw_input@item_idx))^00h,c,w
	mullw	05h
	movlw	low(_input_menu)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:lcd_print_at@str)
	movff	postdec2,(c:lcd_print_at@str+1)
	incf	((c:menu_draw_input@i))^00h,c,w
	
	call	_lcd_print_at
	line	304
	
l4724:
	line	306
	
l4726:
	movf	((c:menu_draw_input@item_idx))^00h,c,w
	movlb	0	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u4451
	goto	u4450

u4451:
	goto	l4788
u4450:
	line	308
	
l4728:; BSR set to: 0

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u4461
	goto	u4460
u4461:
	goto	l4784
u4460:
	line	310
	
l4730:; BSR set to: 0

	movlw	low(02h)
	movwf	((c:menu_draw_input@show_brackets))^00h,c
	line	312
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u4471
	goto	u4470
u4471:
	goto	l4748
u4470:
	line	315
	
l4732:; BSR set to: 0

	movf	((c:menu_draw_input@item_idx))^00h,c,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(c:menu_draw_input@opts)
	movff	1+?_get_item_options,(c:menu_draw_input@opts+1)
	line	316
	
l4734:
	movf	((c:menu_draw_input@opts))^00h,c,w
iorwf	((c:menu_draw_input@opts+1))^00h,c,w
	btfsc	status,2
	goto	u4481
	goto	u4480

u4481:
	goto	l4746
u4480:
	line	318
	
l4736:
	movf	((c:menu_draw_input@item_idx))^00h,c,w
	btfsc	status,2
	goto	u4491
	goto	u4490
u4491:
	goto	l397
u4490:
	
l4738:
	movff	(c:_sensor_edit_flag),(c:_menu_draw_input$946)
	clrf	((c:_menu_draw_input$946+1))^00h,c
	goto	l399
	
l397:
	movff	(c:_enable_edit_flag),(c:_menu_draw_input$946)
	clrf	((c:_menu_draw_input$946+1))^00h,c
	
l399:
	movff	(c:_menu_draw_input$946),(c:menu_draw_input@flag_value)
	line	319
	
l4740:
	movlw	01h
	addwf	((c:menu_draw_input@opts))^00h,c,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	0
	addwfc	((c:menu_draw_input@opts+1))^00h,c,w
	movwf	(??_menu_draw_input+0+0+1)^00h,c
	movff	??_menu_draw_input+0+0,tblptrl
	movff	??_menu_draw_input+0+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movf	tablat,w
	cpfslt	((c:menu_draw_input@flag_value))^00h,c
	goto	u4501
	goto	u4500
u4501:
	goto	l4744
u4500:
	line	321
	
l4742:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

	movf	((c:menu_draw_input@flag_value))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_input+0+0
	movff	prodh,??_menu_draw_input+0+0+1
	movf	(??_menu_draw_input+0+0)^00h,c,w
	addwf	((c:menu_draw_input@opts))^00h,c,w
	movwf	(??_menu_draw_input+2+0)^00h,c
	movf	(??_menu_draw_input+0+1)^00h,c,w
	addwfc	((c:menu_draw_input@opts+1))^00h,c,w
	movwf	1+(??_menu_draw_input+2+0)^00h,c
	movlw	02h
	addwf	(??_menu_draw_input+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_input+2+1)^00h,c
	movff	??_menu_draw_input+2+0,tblptrl
	movff	??_menu_draw_input+2+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd*+
	
	movff	tablat,(c:strcpy@from)
	tblrd*-
	
	movff	tablat,(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	322
	goto	l4792
	line	325
	
l4744:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_102)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_102)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l4792
	line	330
	
l4746:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

	movf	((c:menu_draw_input@item_idx))^00h,c,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strcpy@from)
	movff	postdec2,(c:strcpy@from+1)
	call	_strcpy	;wreg free
	goto	l4792
	line	336
	
l4748:; BSR set to: 0

	movf	((c:menu_draw_input@item_idx))^00h,c,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(c:menu_draw_input@opts_948)
	movff	1+?_get_item_options,(c:menu_draw_input@opts_948+1)
	line	337
	
l4750:
	movf	((c:menu_draw_input@opts_948))^00h,c,w
iorwf	((c:menu_draw_input@opts_948+1))^00h,c,w
	btfsc	status,2
	goto	u4511
	goto	u4510

u4511:
	goto	l4772
u4510:
	line	339
	
l4752:
	movf	((c:menu_draw_input@item_idx))^00h,c,w
	btfsc	status,2
	goto	u4521
	goto	u4520
u4521:
	goto	l406
u4520:
	
l4754:
	movff	(c:_sensor_edit_flag),(c:_menu_draw_input$953)
	clrf	((c:_menu_draw_input$953+1))^00h,c
	goto	l408
	
l406:
	movff	(c:_enable_edit_flag),(c:_menu_draw_input$953)
	clrf	((c:_menu_draw_input$953+1))^00h,c
	
l408:
	movff	(c:_menu_draw_input$953),(c:menu_draw_input@flag_value_952)
	line	340
	
l4756:
	movlw	01h
	addwf	((c:menu_draw_input@opts_948))^00h,c,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	0
	addwfc	((c:menu_draw_input@opts_948+1))^00h,c,w
	movwf	(??_menu_draw_input+0+0+1)^00h,c
	movff	??_menu_draw_input+0+0,tblptrl
	movff	??_menu_draw_input+0+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movf	tablat,w
	cpfslt	((c:menu_draw_input@flag_value_952))^00h,c
	goto	u4531
	goto	u4530
u4531:
	goto	l4770
u4530:
	line	342
	
l4758:
	movf	((c:menu_draw_input@flag_value_952))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_input+0+0
	movff	prodh,??_menu_draw_input+0+0+1
	movf	(??_menu_draw_input+0+0)^00h,c,w
	addwf	((c:menu_draw_input@opts_948))^00h,c,w
	movwf	(??_menu_draw_input+2+0)^00h,c
	movf	(??_menu_draw_input+0+1)^00h,c,w
	addwfc	((c:menu_draw_input@opts_948+1))^00h,c,w
	movwf	1+(??_menu_draw_input+2+0)^00h,c
	movlw	02h
	addwf	(??_menu_draw_input+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_input+2+1)^00h,c
	movff	??_menu_draw_input+2+0,tblptrl
	movff	??_menu_draw_input+2+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd*+
	
	movff	tablat,(c:strlen@s)
	tblrd*-
	
	movff	tablat,(c:strlen@s+1)

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_input@val_len))^00h,c
	line	343
	
l4760:
	movlw	low(0)
	movwf	((c:menu_draw_input@j))^00h,c
	goto	l4766
	line	344
	
l4762:
	movf	((c:menu_draw_input@j))^00h,c,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	343
	
l4764:
	incf	((c:menu_draw_input@j))^00h,c
	
l4766:
		movf	((c:menu_draw_input@val_len))^00h,c,w
	subwf	((c:menu_draw_input@j))^00h,c,w
	btfss	status,0
	goto	u4541
	goto	u4540

u4541:
	goto	l4762
u4540:
	line	345
	
l4768:
	movf	((c:menu_draw_input@val_len))^00h,c,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	346
	goto	l4792
	line	349
	
l4770:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_103)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_103)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l4792
	line	354
	
l4772:
	movf	((c:menu_draw_input@item_idx))^00h,c,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strlen@s)
	movff	postdec2,(c:strlen@s+1)
	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_input@val_len_957))^00h,c
	line	355
	
l4774:
	movlw	low(0)
	movwf	((c:menu_draw_input@j_958))^00h,c
	goto	l4780
	line	356
	
l4776:
	movf	((c:menu_draw_input@j_958))^00h,c,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	355
	
l4778:
	incf	((c:menu_draw_input@j_958))^00h,c
	
l4780:
		movf	((c:menu_draw_input@val_len_957))^00h,c,w
	subwf	((c:menu_draw_input@j_958))^00h,c,w
	btfss	status,0
	goto	u4551
	goto	u4550

u4551:
	goto	l4776
u4550:
	line	357
	
l4782:
	movf	((c:menu_draw_input@val_len_957))^00h,c,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l4792
	line	364
	
l4784:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:menu_draw_input@show_brackets))^00h,c
	goto	l4746
	line	371
	
l4788:; BSR set to: 0

	movlw	low(0)
	movwf	((c:menu_draw_input@show_brackets))^00h,c
	goto	l4746
	line	376
	
l4792:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_input@val_len_959))^00h,c
	line	377
	
l4794:
	movf	((c:menu_draw_input@val_len_959))^00h,c,w
	btfsc	status,2
	goto	u4561
	goto	u4560
u4561:
	goto	l4822
u4560:
	
l4796:
	movf	((c:menu_draw_input@item_idx))^00h,c,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strcmp@s1)
	movff	postdec2,(c:strcmp@s1+1)
		movlw	low(STR_104)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_104)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u4571
	goto	u4570

u4571:
	goto	l4822
u4570:
	line	379
	
l4798:
	movf	((c:menu_draw_input@show_brackets))^00h,c,w
	btfss	status,2
	goto	u4581
	goto	u4580
u4581:
	goto	l4802
u4580:
	line	382
	
l4800:
	movf	((c:menu_draw_input@val_len_959))^00h,c,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_input@i))^00h,c,w
	
	call	_lcd_print_at
	line	383
	goto	l4822
	line	387
	
l4802:
	movf	((c:menu_draw_input@val_len_959))^00h,c,w
	sublw	low(012h)
	movwf	((c:menu_draw_input@start_pos))^00h,c
	line	388
	
l4804:
	movff	(c:menu_draw_input@start_pos),(c:lcd_set_cursor@col)
	incf	((c:menu_draw_input@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	391
	
l4806:
		decf	((c:menu_draw_input@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u4591
	goto	u4590

u4591:
	goto	l4810
u4590:
	
l4808:
		movlw	low(STR_106)
	movwf	((c:_menu_draw_input$965))^00h,c
	movlw	high(STR_106)
	movwf	((c:_menu_draw_input$965+1))^00h,c

	goto	l4812
	
l4810:
		movlw	low(STR_105)
	movwf	((c:_menu_draw_input$965))^00h,c
	movlw	high(STR_105)
	movwf	((c:_menu_draw_input$965+1))^00h,c

	
l4812:
		movff	(c:_menu_draw_input$965),(c:lcd_print@str)
	movff	(c:_menu_draw_input$965+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	393
	
l4814:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	395
		decf	((c:menu_draw_input@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u4601
	goto	u4600

u4601:
	goto	l4818
u4600:
	
l4816:
		movlw	low(STR_108)
	movwf	((c:_menu_draw_input$969))^00h,c
	movlw	high(STR_108)
	movwf	((c:_menu_draw_input$969+1))^00h,c

	goto	l4820
	
l4818:
		movlw	low(STR_107)
	movwf	((c:_menu_draw_input$969))^00h,c
	movlw	high(STR_107)
	movwf	((c:_menu_draw_input$969+1))^00h,c

	
l4820:
		movff	(c:_menu_draw_input$969),(c:lcd_print@str)
	movff	(c:_menu_draw_input$969+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	292
	
l4822:
	incf	((c:menu_draw_input@i))^00h,c
	
l4824:
		movlw	03h-0
	cpfslt	((c:menu_draw_input@i))^00h,c
	goto	u4611
	goto	u4610

u4611:
	goto	l434
u4610:
	
l4826:
	movf	((c:menu_draw_input@i))^00h,c,w
	movff	0+(_menu+01h),??_menu_draw_input+0+0
	clrf	(??_menu_draw_input+0+0+1)^00h,c
	addwf	(??_menu_draw_input+0+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_input+0+1)^00h,c
	btfsc	(??_menu_draw_input+0+1)^00h,c,7
	goto	u4621
	movf	(??_menu_draw_input+0+1)^00h,c,w
	bnz	u4620
	movlw	12
	subwf	 (??_menu_draw_input+0+0)^00h,c,w
	btfss	status,0
	goto	u4621
	goto	u4620

u4621:
	goto	l4718
u4620:
	line	399
	
l434:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_input
	__end_of_menu_draw_input:
	signat	_menu_draw_input,89
	global	_strlen

;; *************** function _strlen *****************
;; Defined at:
;;		line 4 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
;; Parameters:    Size  Location     Type
;;  s               2    9[COMRAM] PTR const unsigned char 
;;		 -> STR_122(5), STR_121(5), STR_120(9), menu_update_edit_value@value_buf(15), 
;;		 -> menu_draw_input@value_buf(15), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), NULL(0), STR_22(1), STR_21(1), 
;;		 -> STR_20(5), STR_19(5), STR_18(9), STR_17(1), 
;;		 -> STR_16(1), STR_15(1), STR_14(8), STR_13(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   11[COMRAM] PTR const unsigned char 
;;		 -> STR_122(5), STR_121(5), STR_120(9), menu_update_edit_value@value_buf(15), 
;;		 -> menu_draw_input@value_buf(15), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), NULL(0), STR_22(1), STR_21(1), 
;;		 -> STR_20(5), STR_19(5), STR_18(9), STR_17(1), 
;;		 -> STR_16(1), STR_15(1), STR_14(8), STR_13(9), 
;; Return value:  Size  Location     Type
;;                  2    9[COMRAM] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_draw_input
;;		_menu_update_edit_value
;;		_menu_draw_setup
;; This function uses a non-reentrant model
;;
psect	text14,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
global __ptext14
__ptext14:
psect	text14
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
	
_strlen:
;incstack = 0
	callstack 28
	line	8
	
l4592:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l4596
	line	10
	
l4594:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l4596:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u4307
	tblrd	*
	
	movf	tablat,w
	bra	u4300
u4307:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u4300:
	iorlw	0
	btfss	status,2
	goto	u4311
	goto	u4310
u4311:
	goto	l4594
u4310:
	line	12
	
l4598:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l1406:
	return	;funcret
	callstack 0
GLOBAL	__end_of_strlen
	__end_of_strlen:
	signat	_strlen,4218
	global	_strcpy

;; *************** function _strcpy *****************
;; Defined at:
;;		line 8 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
;; Parameters:    Size  Location     Type
;;  to              2    9[COMRAM] PTR unsigned char 
;;		 -> original_value(10), menu_update_edit_value@value_buf(15), menu_draw_input@value_buf(15), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), NULL(0), 
;;  from            2   11[COMRAM] PTR const unsigned char 
;;		 -> original_value(10), STR_110(6), STR_109(6), STR_103(6), 
;;		 -> STR_102(6), value_high_tbp(10), value_high_temp(10), STR_93(5), 
;;		 -> value_back(5), STR_92(5), STR_91(5), value_display(10), 
;;		 -> STR_90(9), STR_89(6), STR_88(6), value_rlyslp(10), 
;;		 -> STR_87(9), STR_86(6), STR_85(6), value_rlyplp(10), 
;;		 -> STR_84(9), STR_83(6), STR_82(6), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), STR_74(9), 
;;		 -> value_sensor(12), value_enable(10), NULL(0), STR_22(1), 
;;		 -> STR_21(1), STR_20(5), STR_19(5), STR_18(9), 
;;		 -> STR_17(1), STR_16(1), STR_15(1), STR_14(8), 
;;		 -> STR_13(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   13[COMRAM] PTR unsigned char 
;;		 -> original_value(10), menu_update_edit_value@value_buf(15), menu_draw_input@value_buf(15), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), NULL(0), 
;; Return value:  Size  Location     Type
;;                  2    9[COMRAM] PTR unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rebuild_input_menu
;;		_menu_draw_input
;;		_menu_update_edit_value
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
global __ptext15
__ptext15:
psect	text15
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
	
_strcpy:
;incstack = 0
	callstack 28
	line	18
	
l4574:
		movff	(c:strcpy@to),(c:strcpy@cp)
	movff	(c:strcpy@to+1),(c:strcpy@cp+1)

	line	19
	goto	l4578
	line	20
	
l4576:
	infsnz	((c:strcpy@cp))^00h,c
	incf	((c:strcpy@cp+1))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l4578:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movff	(c:strcpy@cp),fsr2l
	movff	(c:strcpy@cp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u4277
	tblrd	*
	
	movf	tablat,w
	bra	u4270
u4277:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u4270:
	movwf	indf2
	movf	indf2,w
	btfss	status,2
	goto	u4281
	goto	u4280
u4281:
	goto	l4576
u4280:
	line	24
	
l1400:
	return	;funcret
	callstack 0
GLOBAL	__end_of_strcpy
	__end_of_strcpy:
	signat	_strcpy,8314
	global	_strcmp

;; *************** function _strcmp *****************
;; Defined at:
;;		line 33 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
;; Parameters:    Size  Location     Type
;;  s1              2    9[COMRAM] PTR const unsigned char 
;;		 -> original_value(10), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), NULL(0), 
;;  s2              2   11[COMRAM] PTR const unsigned char 
;;		 -> STR_104(1), STR_22(1), STR_21(1), STR_20(5), 
;;		 -> STR_19(5), STR_18(9), STR_17(1), STR_16(1), 
;;		 -> STR_15(1), STR_14(8), STR_13(9), 
;; Auto vars:     Size  Location     Type
;;  r               1   15[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  2    9[COMRAM] int 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_draw_input
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text16,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
global __ptext16
__ptext16:
psect	text16
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
	
_strcmp:
;incstack = 0
	callstack 28
	line	37
	
l4602:
	goto	l4606
	line	38
	
l4604:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l4606:
	movff	(c:strcmp@s2),tblptrl
	movff	(c:strcmp@s2+1),tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movff	tablat,??_strcmp+0+0
	movff	(c:strcmp@s1),fsr2l
	movff	(c:strcmp@s1+1),fsr2h
	movf	indf2,w
	movwf	(??_strcmp+1+0)^00h,c
	movf	(??_strcmp+0+0)^00h,c,w
	subwf	((??_strcmp+1+0))^00h,c,w
	movwf	((c:strcmp@r))^00h,c
	movf	((c:strcmp@r))^00h,c,w
	btfss	status,2
	goto	u4321
	goto	u4320
u4321:
	goto	l4610
u4320:
	
l4608:
	movff	(c:strcmp@s1),fsr2l
	movff	(c:strcmp@s1+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u4331
	goto	u4330
u4331:
	goto	l4604
u4330:
	line	41
	
l4610:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l1394:
	return	;funcret
	callstack 0
GLOBAL	__end_of_strcmp
	__end_of_strcmp:
	signat	_strcmp,8314
	global	_sprintf

;; *************** function _sprintf *****************
;; Defined at:
;;		line 505 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              2   21[COMRAM] PTR unsigned char 
;;		 -> menu_draw_input@title(10), value_high_tbp(10), value_high_temp(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), value_enable(10), main@buf_494(30), 
;;		 -> main@buf(40), 
;;  f               2   23[COMRAM] PTR const unsigned char 
;;		 -> STR_101(9), STR_97(10), STR_96(3), STR_95(3), 
;;		 -> STR_94(3), STR_81(10), STR_80(10), STR_79(3), 
;;		 -> STR_78(10), STR_77(3), STR_76(3), STR_75(3), 
;;		 -> STR_71(3), STR_12(17), STR_11(23), 
;; Auto vars:     Size  Location     Type
;;  tmpval          4    0        struct .
;;  width           2   42[COMRAM] int 
;;  len             2   38[COMRAM] unsigned int 
;;  val             2   36[COMRAM] unsigned int 
;;  cp              2   34[COMRAM] PTR const unsigned char 
;;		 -> STR_125(7), ?_sprintf(2), STR_73(9), STR_72(8), 
;;  c               1   41[COMRAM] unsigned char 
;;  flag            1   40[COMRAM] unsigned char 
;;  ap              1   33[COMRAM] PTR void [1]
;;		 -> ?_sprintf(2), 
;;  prec            1   32[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  2   21[COMRAM] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         8       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        12       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        23       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       23 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		___lwdiv
;;		___lwmod
;;		___wmul
;;		_isdigit
;; This function is called by:
;;		_main
;;		_rebuild_input_menu
;;		_menu_draw_input
;; This function uses a non-reentrant model
;;
psect	text17,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
global __ptext17
__ptext17:
psect	text17
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
	
_sprintf:
;incstack = 0
	callstack 28
	line	550
	
l4398:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l4540
	line	555
	
l4400:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u4001
	goto	u4000

u4001:
	goto	l4406
u4000:
	line	558
	
l4402:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l4404:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l4540
	line	563
	
l4406:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	565
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	goto	l4412
	line	597
	
l4408:
	bsf	(0+(2/8)+(c:sprintf@flag))^00h,c,(2)&7
	line	598
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	568
	
l4412:
	movff	(c:sprintf@f),tblptrl
	movff	(c:sprintf@f+1),tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movf	tablat,w
	; Switch size 1, requested type "simple"
; Number of cases is 1, Range of values is 48 to 48
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
;	Chosen strategy is simple_byte

	xorlw	48^0	; case 48
	skipnz
	goto	l4408
	goto	l4414

	line	614
	
l4414:
	movff	(c:sprintf@f),tblptrl
	movff	(c:sprintf@f+1),tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movf	tablat,w
	
	call	_isdigit
	btfss	status,0
	goto	u4011
	goto	u4010
u4011:
	goto	l4462
u4010:
	line	615
	
l4416:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	617
	
l4418:
	movff	(c:sprintf@width),(c:___wmul@multiplier)
	movff	(c:sprintf@width+1),(c:___wmul@multiplier+1)
	movlw	high(0Ah)
	movwf	((c:___wmul@multiplicand+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___wmul@multiplicand))^00h,c
	call	___wmul	;wreg free
	movff	0+?___wmul,(c:sprintf@width)
	movff	1+?___wmul,(c:sprintf@width+1)
	line	618
	
l4420:
	movff	(c:sprintf@f),tblptrl
	movff	(c:sprintf@f+1),tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movff	tablat,??_sprintf+0+0
	movlw	low(-48)
	addwf	(??_sprintf+0+0)^00h,c,w
	movwf	(??_sprintf+1+0)^00h,c
	clrf	1+(??_sprintf+1+0)^00h,c
	movlw	high(-48)
	addwfc	1+(??_sprintf+1+0)^00h,c
	movf	(??_sprintf+1+0)^00h,c,w
	addwf	((c:sprintf@width))^00h,c
	movf	(??_sprintf+1+1)^00h,c,w
	addwfc	((c:sprintf@width+1))^00h,c

	
l4422:
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	619
	
l4424:
	movff	(c:sprintf@f),tblptrl
	movff	(c:sprintf@f+1),tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movf	tablat,w
	
	call	_isdigit
	btfsc	status,0
	goto	u4021
	goto	u4020
u4021:
	goto	l4418
u4020:
	goto	l4462
	line	760
	
l4426:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l4428:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l4430:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u4031
	goto	u4030

u4031:
	goto	l4434
u4030:
	line	767
	
l4432:
		movlw	low(STR_125)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_125)
	movwf	((c:sprintf@cp+1))^00h,c

	line	771
	
l4434:
	movlw	high(0)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@len))^00h,c
	line	772
	goto	l4438
	line	773
	
l4436:
	infsnz	((c:sprintf@len))^00h,c
	incf	((c:sprintf@len+1))^00h,c
	line	772
	
l4438:
	movf	((c:sprintf@len))^00h,c,w
	addwf	((c:sprintf@cp))^00h,c,w
	movwf	(??_sprintf+0+0)^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	addwfc	((c:sprintf@cp+1))^00h,c,w
	movwf	(??_sprintf+0+0+1)^00h,c
	movff	??_sprintf+0+0,tblptrl
	movff	??_sprintf+0+1,tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u4047
	tblrd	*
	
	movf	tablat,w
	bra	u4040
u4047:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u4040:
	iorlw	0
	btfss	status,2
	goto	u4051
	goto	u4050
u4051:
	goto	l4436
u4050:
	line	783
	
l4440:
		movf	((c:sprintf@width))^00h,c,w
	subwf	((c:sprintf@len))^00h,c,w
	movf	((c:sprintf@width+1))^00h,c,w
	subwfb	((c:sprintf@len+1))^00h,c,w
	btfsc	status,0
	goto	u4061
	goto	u4060

u4061:
	goto	l4444
u4060:
	line	784
	
l4442:
	movf	((c:sprintf@len))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	subwfb	((c:sprintf@width+1))^00h,c

	goto	l4450
	line	786
	
l4444:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	goto	l4450
	line	791
	
l4446:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l4448:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	790
	
l4450:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
		incf	((c:sprintf@width))^00h,c,w
	bnz	u4071
	incf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u4071
	goto	u4070

u4071:
	goto	l4446
u4070:
	goto	l4458
	line	794
	
l4452:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u4087
	tblrd	*
	
	movf	tablat,w
	bra	u4080
u4087:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u4080:
	movwf	indf2
	
l4454:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l4456:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	793
	
l4458:
	decf	((c:sprintf@len))^00h,c
	btfss	status,0
	decf	((c:sprintf@len+1))^00h,c
		incf	((c:sprintf@len))^00h,c,w
	bnz	u4091
	incf	((c:sprintf@len+1))^00h,c,w
	btfss	status,2
	goto	u4091
	goto	u4090

u4091:
	goto	l4452
u4090:
	goto	l4540
	line	661
	
l4462:
	movff	(c:sprintf@f),tblptrl
	movff	(c:sprintf@f+1),tblptrh
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movff	tablat,(c:sprintf@c)
	movf	((c:sprintf@c))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 115
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l4542
	xorlw	100^0	; case 100
	skipnz
	goto	l4464
	xorlw	105^100	; case 105
	skipnz
	goto	l4464
	xorlw	115^105	; case 115
	skipnz
	goto	l4426
	goto	l4540

	line	1285
	
l4464:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l4466:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l4468:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u4100
	goto	u4101

u4101:
	goto	l4474
u4100:
	line	1288
	
l4470:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l4472:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	line	1331
	
l4474:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	line	1332
	
l4480:
	movf	((c:sprintf@c))^00h,c,w
	mullw	02h
	movlw	low((_dpowers))
	addwf	(prodl)^0f00h,c,w
	movwf	tblptrl
	movlw	high((_dpowers))
	addwfc	(prodh)^0f00h,c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
		tblrd	*+
	movf	tablat,w
	subwf	((c:sprintf@val))^00h,c,w
	tblrd	*+
	movf	tablat,w
	subwfb	((c:sprintf@val+1))^00h,c,w
	btfsc	status,0
	goto	u4111
	goto	u4110

u4111:
	goto	l4484
u4110:
	goto	l4488
	line	1331
	
l4484:
	incf	((c:sprintf@c))^00h,c
	
l4486:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u4121
	goto	u4120

u4121:
	goto	l4480
u4120:
	line	1371
	
l4488:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u4131
	goto	u4130

u4131:
	goto	l4494
u4130:
	
l4490:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u4141
	goto	u4140
u4141:
	goto	l4494
u4140:
	line	1372
	
l4492:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	line	1407
	
l4494:
	movf	((c:sprintf@c))^00h,c,w
	movwf	(??_sprintf+0+0)^00h,c
	clrf	(??_sprintf+0+0+1)^00h,c

		movf	((c:sprintf@width))^00h,c,w
	subwf	(??_sprintf+0+0)^00h,c,w
	movf	(??_sprintf+0+1)^00h,c,w
	xorlw	80h
	movwf	(??_sprintf+2+0)^00h,c
	movf	((c:sprintf@width+1))^00h,c,w
	xorlw	80h
	subwfb	(??_sprintf+2+0)^00h,c,w
	btfsc	status,0
	goto	u4151
	goto	u4150

u4151:
	goto	l4498
u4150:
	line	1408
	
l4496:
	movf	((c:sprintf@c))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movlw	0
	subwfb	((c:sprintf@width+1))^00h,c
	goto	l4500
	line	1410
	
l4498:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	1413
	
l4500:
	
	btfss	((c:sprintf@flag))^00h,c,(2)&7
	goto	u4161
	goto	u4160
u4161:
	goto	l4516
u4160:
	line	1418
	
l4502:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u4171
	goto	u4170
u4171:
	goto	l4508
u4170:
	line	1419
	
l4504:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(02Dh)
	movwf	indf2
	
l4506:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1441
	
l4508:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u4181
	goto	u4180

u4181:
	goto	l4530
u4180:
	line	1443
	
l4510:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(030h)
	movwf	indf2
	
l4512:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1444
	
l4514:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u4191
	goto	u4190

u4191:
	goto	l4510
u4190:
	goto	l4530
	line	1454
	
l4516:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u4201
	goto	u4200

u4201:
	goto	l4524
u4200:
	line	1456
	
l4518:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l4520:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1457
	
l4522:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u4211
	goto	u4210

u4211:
	goto	l4518
u4210:
	line	1464
	
l4524:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u4221
	goto	u4220
u4221:
	goto	l4530
u4220:
	line	1465
	
l4526:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(02Dh)
	movwf	indf2
	
l4528:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1498
	
l4530:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l4538
	line	1515
	
l4532:
	movf	((c:sprintf@prec))^00h,c,w
	mullw	02h
	movlw	low((_dpowers))
	addwf	(prodl)^0f00h,c,w
	movwf	tblptrl
	movlw	high((_dpowers))
	addwfc	(prodh)^0f00h,c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___lwdiv@divisor)
	tblrd*-
	
	movff	tablat,(c:___lwdiv@divisor+1)

	movff	(c:sprintf@val),(c:___lwdiv@dividend)
	movff	(c:sprintf@val+1),(c:___lwdiv@dividend+1)
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:___lwmod@dividend)
	movff	1+?___lwdiv,(c:___lwmod@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	addlw	low(030h)
	movwf	((c:sprintf@c))^00h,c
	line	1550
	
l4534:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l4536:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l4538:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u4231
	goto	u4230

u4231:
	goto	l4532
u4230:
	line	553
	
l4540:
	movff	(c:sprintf@f),tblptrl
	movff	(c:sprintf@f+1),tblptrh
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movff	tablat,(c:sprintf@c)
	movf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u4241
	goto	u4240
u4241:
	goto	l4400
u4240:
	line	1564
	
l4542:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	clrf	indf2
	line	1567
	
l713:
	return	;funcret
	callstack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
	signat	_sprintf,4698
	global	_isdigit

;; *************** function _isdigit *****************
;; Defined at:
;;		line 8 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1   11[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text18,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
global __ptext18
__ptext18:
psect	text18
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
	
_isdigit:
;incstack = 0
	callstack 28
	movwf	((c:isdigit@c))^00h,c
	line	14
	
l4338:
	movlw	low(0)
	movwf	((c:_isdigit$1721))^00h,c
	
l4340:
		movlw	03Ah-0
	cpfslt	((c:isdigit@c))^00h,c
	goto	u3911
	goto	u3910

u3911:
	goto	l4346
u3910:
	
l4342:
		movlw	030h-1
	cpfsgt	((c:isdigit@c))^00h,c
	goto	u3921
	goto	u3920

u3921:
	goto	l4346
u3920:
	
l4344:
	movlw	low(01h)
	movwf	((c:_isdigit$1721))^00h,c
	
l4346:
	movff	(c:_isdigit$1721),??_isdigit+0+0
	rrcf	(??_isdigit+0+0)^00h,c,w
	line	15
	
l1380:
	return	;funcret
	callstack 0
GLOBAL	__end_of_isdigit
	__end_of_isdigit:
	signat	_isdigit,4216
	global	___wmul

;; *************** function ___wmul *****************
;; Defined at:
;;		line 15 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    9[COMRAM] unsigned int 
;;  multiplicand    2   11[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2   13[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    9[COMRAM] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text19,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
global __ptext19
__ptext19:
psect	text19
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
	
___wmul:
;incstack = 0
	callstack 28
	line	37
	
l4350:
	movf	((c:___wmul@multiplier))^00h,c,w
	mulwf	((c:___wmul@multiplicand))^00h,c
	movff	prodl,(c:___wmul@product)
	movff	prodh,(c:___wmul@product+1)
	line	38
	movf	((c:___wmul@multiplier))^00h,c,w
	mulwf	(0+((c:___wmul@multiplicand)+01h))^00h,c
	movf	(prodl)^0f00h,c,w
	addwf	((c:___wmul@product+1))^00h,c

	line	39
	movf	(0+((c:___wmul@multiplier)+01h))^00h,c,w
	mulwf	((c:___wmul@multiplicand))^00h,c
	movf	(prodl)^0f00h,c,w
	addwf	((c:___wmul@product+1))^00h,c

	line	52
	
l4352:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	line	53
	
l716:
	return	;funcret
	callstack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	___lwmod

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 7 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        2   16[COMRAM] unsigned int 
;;  divisor         2   18[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   20[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   16[COMRAM] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rebuild_input_menu
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text20,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext20
__ptext20:
psect	text20
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
___lwmod:
;incstack = 0
	callstack 28
	line	12
	
l4378:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u3961
	goto	u3960

u3961:
	goto	l1205
u3960:
	line	13
	
l4380:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l4384
	line	15
	
l4382:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l4384:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u3971
	goto	u3970
u3971:
	goto	l4382
u3970:
	line	19
	
l4386:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u3981
	goto	u3980

u3981:
	goto	l4390
u3980:
	line	20
	
l4388:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l4390:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l4392:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l4386
	line	23
	
l1205:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l1212:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
	signat	___lwmod,8314
	global	___lwdiv

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 7 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        2    9[COMRAM] unsigned int 
;;  divisor         2   11[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   14[COMRAM] unsigned int 
;;  counter         1   13[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    9[COMRAM] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rebuild_input_menu
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text21,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
global __ptext21
__ptext21:
psect	text21
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
	
___lwdiv:
;incstack = 0
	callstack 28
	line	13
	
l4356:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l4358:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u3931
	goto	u3930

u3931:
	goto	l1195
u3930:
	line	15
	
l4360:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l4364
	line	17
	
l4362:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l4364:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u3941
	goto	u3940
u3941:
	goto	l4362
u3940:
	line	21
	
l4366:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l4368:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u3951
	goto	u3950

u3951:
	goto	l4374
u3950:
	line	23
	
l4370:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l4372:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l4374:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l4376:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l4366
	line	28
	
l1195:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l1202:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_lcd_print_at

;; *************** function _lcd_print_at *****************
;; Defined at:
;;		line 136 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   15[COMRAM] unsigned char 
;;  str             2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_123(2), STR_122(5), STR_121(5), STR_120(9), 
;;		 -> STR_119(5), STR_118(6), STR_117(8), STR_116(8), 
;;		 -> STR_115(8), STR_114(6), menu_draw_input@value_buf(15), menu_draw_input@title(10), 
;;		 -> STR_99(2), STR_98(8), STR_69(5), STR_68(8), 
;;		 -> STR_67(8), STR_66(12), STR_65(9), STR_64(11), 
;;		 -> STR_63(10), STR_62(6), STR_61(5), STR_60(7), 
;;		 -> STR_59(7), STR_58(5), STR_57(8), STR_56(8), 
;;		 -> STR_55(11), STR_54(8), STR_53(5), STR_52(7), 
;;		 -> STR_51(7), STR_50(5), STR_49(8), STR_48(9), 
;;		 -> STR_47(9), STR_46(10), STR_45(11), STR_44(10), 
;;		 -> STR_43(7), STR_42(7), STR_41(5), STR_40(8), 
;;		 -> STR_39(8), STR_38(8), STR_37(9), STR_36(6), 
;;		 -> STR_35(6), STR_34(13), STR_33(9), STR_32(12), 
;;		 -> STR_31(11), STR_30(10), STR_29(7), STR_28(7), 
;;		 -> STR_27(5), STR_26(6), STR_25(13), STR_24(11), 
;;		 -> STR_23(10), 
;; Auto vars:     Size  Location     Type
;;  row             1   18[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_lcd_print
;;		_lcd_set_cursor
;; This function is called by:
;;		_menu_draw_options
;;		_menu_draw_input
;;		_menu_draw_setup
;; This function uses a non-reentrant model
;;
psect	text22,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	136
global __ptext22
__ptext22:
psect	text22
	file	"src\menu.c"
	line	136
	
_lcd_print_at:
;incstack = 0
	callstack 24
	movwf	((c:lcd_print_at@row))^00h,c
	line	138
	
l4546:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	139
	
l4548:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	140
	
l325:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print_at
	__end_of_lcd_print_at:
	signat	_lcd_print_at,12409
	global	_lcd_clear_line

;; *************** function _lcd_clear_line *****************
;; Defined at:
;;		line 143 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  row             1   15[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_lcd_print
;;		_lcd_set_cursor
;; This function is called by:
;;		_menu_draw_options
;;		_menu_draw_input
;;		_menu_draw_setup
;; This function uses a non-reentrant model
;;
psect	text23,class=CODE,space=0,reloc=2,group=0
	line	143
global __ptext23
__ptext23:
psect	text23
	file	"src\menu.c"
	line	143
	
_lcd_clear_line:
;incstack = 0
	callstack 24
	movwf	((c:lcd_clear_line@row))^00h,c
	line	145
	
l4550:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	146
	
l4552:
		movlw	low(STR_70)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_70)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	147
	
l328:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear_line
	__end_of_lcd_clear_line:
	signat	_lcd_clear_line,4217
	global	_lcd_set_cursor

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 156 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   12[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  row             1   13[COMRAM] unsigned char 
;;  address         1   14[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_lcd_cmd
;; This function is called by:
;;		_main
;;		_lcd_print_at
;;		_lcd_clear_line
;;		_menu_draw_input
;;		_menu_update_edit_value
;; This function uses a non-reentrant model
;;
psect	text24,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	156
global __ptext24
__ptext24:
psect	text24
	file	"src\main.c"
	line	156
	
_lcd_set_cursor:
;incstack = 0
	callstack 26
	movwf	((c:lcd_set_cursor@row))^00h,c
	line	159
	
l4314:
	goto	l4328
	line	162
	
l4316:
	movlw	low(080h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	163
	goto	l4330
	line	165
	
l4318:
	movlw	low(0C0h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	166
	goto	l4330
	line	168
	
l4320:
	movlw	low(094h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	169
	goto	l4330
	line	171
	
l4322:
	movlw	low(0D4h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	172
	goto	l4330
	line	159
	
l4328:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l4316
	xorlw	1^0	; case 1
	skipnz
	goto	l4318
	xorlw	2^1	; case 2
	skipnz
	goto	l4320
	xorlw	3^2	; case 3
	skipnz
	goto	l4322
	goto	l4316

	line	177
	
l4330:
	movf	((c:lcd_set_cursor@address))^00h,c,w
	addwf	((c:lcd_set_cursor@col))^00h,c,w
	
	call	_lcd_cmd
	line	178
	
l134:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
	signat	_lcd_set_cursor,8313
	global	_lcd_print

;; *************** function _lcd_print *****************
;; Defined at:
;;		line 142 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   11[COMRAM] PTR const unsigned char 
;;		 -> STR_124(2), STR_123(2), STR_122(5), STR_121(5), 
;;		 -> STR_120(9), STR_119(5), STR_118(6), STR_117(8), 
;;		 -> STR_116(8), STR_115(8), STR_114(6), STR_113(2), 
;;		 -> STR_112(2), STR_111(11), menu_update_edit_value@value_buf(15), STR_108(2), 
;;		 -> STR_107(2), STR_106(2), STR_105(2), menu_draw_input@value_buf(15), 
;;		 -> menu_draw_input@title(10), STR_100(2), STR_99(2), STR_98(8), 
;;		 -> STR_70(21), STR_69(5), STR_68(8), STR_67(8), 
;;		 -> STR_66(12), STR_65(9), STR_64(11), STR_63(10), 
;;		 -> STR_62(6), STR_61(5), STR_60(7), STR_59(7), 
;;		 -> STR_58(5), STR_57(8), STR_56(8), STR_55(11), 
;;		 -> STR_54(8), STR_53(5), STR_52(7), STR_51(7), 
;;		 -> STR_50(5), STR_49(8), STR_48(9), STR_47(9), 
;;		 -> STR_46(10), STR_45(11), STR_44(10), STR_43(7), 
;;		 -> STR_42(7), STR_41(5), STR_40(8), STR_39(8), 
;;		 -> STR_38(8), STR_37(9), STR_36(6), STR_35(6), 
;;		 -> STR_34(13), STR_33(9), STR_32(12), STR_31(11), 
;;		 -> STR_30(10), STR_29(7), STR_28(7), STR_27(5), 
;;		 -> STR_26(6), STR_25(13), STR_24(11), STR_23(10), 
;;		 -> STR_4(16), STR_3(13), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;;		_lcd_print_at
;;		_lcd_clear_line
;;		_menu_draw_options
;;		_menu_draw_input
;;		_menu_update_edit_value
;;		_menu_draw_setup
;; This function uses a non-reentrant model
;;
psect	text25,class=CODE,space=0,reloc=2,group=0
	line	142
global __ptext25
__ptext25:
psect	text25
	file	"src\main.c"
	line	142
	
_lcd_print:
;incstack = 0
	callstack 26
	line	144
	
l4306:
	goto	l4312
	line	146
	
l4308:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u3877
	tblrd	*
	
	movf	tablat,w
	bra	u3870
u3877:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u3870:
	
	call	_lcd_data
	
l4310:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	144
	
l4312:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u3887
	tblrd	*
	
	movf	tablat,w
	bra	u3880
u3887:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u3880:
	iorlw	0
	btfss	status,2
	goto	u3891
	goto	u3890
u3891:
	goto	l4308
u3890:
	line	148
	
l121:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print
	__end_of_lcd_print:
	signat	_lcd_print,4217
	global	_lcd_data

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 134 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1   10[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_lcd_write_nibble
;; This function is called by:
;;		_lcd_print
;; This function uses a non-reentrant model
;;
psect	text26,class=CODE,space=0,reloc=2,group=0
	line	134
global __ptext26
__ptext26:
psect	text26
	file	"src\main.c"
	line	134
	
_lcd_data:
;incstack = 0
	callstack 26
	movwf	((c:lcd_data@data))^00h,c
	line	136
	
l4300:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	137
	
l4302:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	138
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	139
	
l4304:
	asmopt push
asmopt off
	movlw	133
u5637:
decfsz	wreg,f
	bra	u5637
	nop
asmopt pop

	line	140
	
l115:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
	signat	_lcd_data,4217
	global	_get_item_options

;; *************** function _get_item_options *****************
;; Defined at:
;;		line 150 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  item_index      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  item_index      1   11[COMRAM] unsigned char 
;;  i               1   12[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    9[COMRAM] PTR const struct .
;; Registers used:
;;		wreg, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh
;; Tracked objects:
;;		On entry : 3F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_draw_input
;;		_menu_update_edit_value
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text27,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	150
global __ptext27
__ptext27:
psect	text27
	file	"src\menu.c"
	line	150
	
_get_item_options:
;incstack = 0
	callstack 28
	movwf	((c:get_item_options@item_index))^00h,c
	line	152
	
l4554:
	movlw	low(0)
	movwf	((c:get_item_options@i))^00h,c
	line	154
	
l4560:
	movf	((c:get_item_options@i))^00h,c,w
	mullw	0Ch
	movlw	low((_menu_item_options))
	addwf	(prodl)^0f00h,c,w
	movwf	tblptrl
	movlw	high((_menu_item_options))
	addwfc	(prodh)^0f00h,c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd	*
	
	movf	tablat,w
	xorwf	((c:get_item_options@item_index))^00h,c,w
	btfss	status,2
	goto	u4251
	goto	u4250
u4251:
	goto	l4566
u4250:
	line	156
	
l4562:
	movf	((c:get_item_options@i))^00h,c,w
	mullw	0Ch
	movlw	low(_menu_item_options)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:?_get_item_options))^00h,c
	movlw	high(_menu_item_options)
	addwfc	prod+1,w
	movwf	1+((c:?_get_item_options))^00h,c
	goto	l334
	line	152
	
l4566:
	incf	((c:get_item_options@i))^00h,c
	
l4568:
		movlw	02h-1
	cpfsgt	((c:get_item_options@i))^00h,c
	goto	u4261
	goto	u4260

u4261:
	goto	l4560
u4260:
	line	159
	
l4570:
		movlw	low(0)
	movwf	((c:?_get_item_options))^00h,c
	movlw	high(0)
	movwf	((c:?_get_item_options+1))^00h,c

	line	160
	
l334:
	return	;funcret
	callstack 0
GLOBAL	__end_of_get_item_options
	__end_of_get_item_options:
	signat	_get_item_options,4218
	global	_beep

;; *************** function _beep *****************
;; Defined at:
;;		line 207 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  duration_ms     2    9[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2   12[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text28,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	207
global __ptext28
__ptext28:
psect	text28
	file	"src\main.c"
	line	207
	
_beep:
;incstack = 0
	callstack 28
	line	209
	
l4680:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	210
	
l4682:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l140
	line	212
	
l4684:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u5647:
decfsz	wreg,f
	bra	u5647
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u5647
	nop2
asmopt pop

	line	210
	
l4686:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l140:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u4411
	goto	u4410

u4411:
	goto	l4684
u4410:
	
l142:
	line	214
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	215
	
l143:
	return	;funcret
	callstack 0
GLOBAL	__end_of_beep
	__end_of_beep:
	signat	_beep,4217
	global	_lcd_init

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 180 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 3F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_lcd_cmd
;;		_lcd_write_nibble
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text29,class=CODE,space=0,reloc=2,group=0
	line	180
global __ptext29
__ptext29:
psect	text29
	file	"src\main.c"
	line	180
	
_lcd_init:
;incstack = 0
	callstack 27
	line	182
	
l5092:; BSR set to: 0

	movlw	(030h)&0ffh
	andwf	((c:3986))^0f00h,c	;volatile
	line	183
	
l5094:; BSR set to: 0

	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	185
	
l5096:; BSR set to: 0

	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u5657:
decfsz	wreg,f
	bra	u5657
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u5657
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u5657
	nop
asmopt pop

	line	187
	
l5098:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	189
	
l5100:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	190
	
l5102:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u5667:
decfsz	wreg,f
	bra	u5667
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u5667
asmopt pop

	line	191
	
l5104:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	192
	
l5106:
	asmopt push
asmopt off
	movlw	240
u5677:
	nop2
decfsz	wreg,f
	bra	u5677
asmopt pop

	line	193
	
l5108:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	194
	
l5110:
	asmopt push
asmopt off
	movlw	240
u5687:
	nop2
decfsz	wreg,f
	bra	u5687
asmopt pop

	line	196
	
l5112:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	197
	
l5114:
	asmopt push
asmopt off
	movlw	240
u5697:
	nop2
decfsz	wreg,f
	bra	u5697
asmopt pop

	line	199
	
l5116:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	200
	
l5118:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	201
	
l5120:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	202
	
l5122:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_init+0+0)^00h,c
	movlw	198
u5707:
decfsz	wreg,f
	bra	u5707
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u5707
	nop2
asmopt pop

	line	203
	
l5124:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	204
	
l137:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
	signat	_lcd_init,89
	global	_lcd_clear

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 150 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_lcd_cmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text30,class=CODE,space=0,reloc=2,group=0
	line	150
global __ptext30
__ptext30:
psect	text30
	file	"src\main.c"
	line	150
	
_lcd_clear:
;incstack = 0
	callstack 27
	line	152
	
l5088:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	153
	
l5090:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u5717:
decfsz	wreg,f
	bra	u5717
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u5717
	nop2
asmopt pop

	line	154
	
l124:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
	signat	_lcd_clear,89
	global	_lcd_cmd

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 118 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1   11[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_lcd_write_nibble
;; This function is called by:
;;		_lcd_clear
;;		_lcd_set_cursor
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text31,class=CODE,space=0,reloc=2,group=0
	line	118
global __ptext31
__ptext31:
psect	text31
	file	"src\main.c"
	line	118
	
_lcd_cmd:
;incstack = 0
	callstack 26
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	120
	
l4288:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	121
	
l4290:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	122
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	124
	
l4292:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u3851
	goto	u3850

u3851:
	goto	l4296
u3850:
	
l4294:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u3861
	goto	u3860

u3861:
	goto	l4298
u3860:
	line	126
	
l4296:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u5727:
decfsz	wreg,f
	bra	u5727
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u5727
	nop2
asmopt pop

	line	127
	goto	l112
	line	130
	
l4298:
	asmopt push
asmopt off
	movlw	133
u5737:
decfsz	wreg,f
	bra	u5737
	nop
asmopt pop

	line	132
	
l112:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
	signat	_lcd_cmd,4217
	global	_lcd_write_nibble

;; *************** function _lcd_write_nibble *****************
;; Defined at:
;;		line 93 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  nibble          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  nibble          1    9[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_cmd
;;		_lcd_data
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text32,class=CODE,space=0,reloc=2,group=0
	line	93
global __ptext32
__ptext32:
psect	text32
	file	"src\main.c"
	line	93
	
_lcd_write_nibble:
;incstack = 0
	callstack 26
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	95
	
l4270:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u3811
	goto	u3810
u3811:
	goto	l97
u3810:
	line	96
	
l4272:
	bsf	((c:3977))^0f00h,c,0	;volatile
	goto	l4274
	line	97
	
l97:
	line	98
	bcf	((c:3977))^0f00h,c,0	;volatile
	line	99
	
l4274:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u3821
	goto	u3820
u3821:
	goto	l99
u3820:
	line	100
	
l4276:
	bsf	((c:3977))^0f00h,c,1	;volatile
	goto	l4278
	line	101
	
l99:
	line	102
	bcf	((c:3977))^0f00h,c,1	;volatile
	line	103
	
l4278:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u3831
	goto	u3830
u3831:
	goto	l101
u3830:
	line	104
	
l4280:
	bsf	((c:3977))^0f00h,c,2	;volatile
	goto	l4282
	line	105
	
l101:
	line	106
	bcf	((c:3977))^0f00h,c,2	;volatile
	line	107
	
l4282:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u3841
	goto	u3840
u3841:
	goto	l103
u3840:
	line	108
	
l4284:
	bsf	((c:3977))^0f00h,c,3	;volatile
	goto	l104
	line	109
	
l103:
	line	110
	bcf	((c:3977))^0f00h,c,3	;volatile
	
l104:
	line	112
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	113
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	114
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	115
	
l4286:
	asmopt push
asmopt off
	movlw	133
u5747:
decfsz	wreg,f
	bra	u5747
	nop
asmopt pop

	line	116
	
l105:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_write_nibble
	__end_of_lcd_write_nibble:
	signat	_lcd_write_nibble,4217
	global	_encoder_init

;; *************** function _encoder_init *****************
;; Defined at:
;;		line 114 in file "src\encoder.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text33,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	114
global __ptext33
__ptext33:
psect	text33
	file	"src\encoder.c"
	line	114
	
_encoder_init:
;incstack = 0
	callstack 29
	line	117
	
l5152:
	movlw	low(0C4h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	118
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	121
	movlw	high(0)
	movlb	0	; () banked
	movwf	((_encoder_count+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_encoder_count))&0ffh	;volatile
	line	122
	movlw	low(0)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	123
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	124
	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	127
	
l5154:; BSR set to: 0

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	128
	
l5156:; BSR set to: 0

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	129
	
l5158:; BSR set to: 0

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	132
	
l5160:; BSR set to: 0

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u4851
	goto	u4850
u4851:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u4858
u4850:
	clrf	(??_encoder_init+0+0)^00h,c
u4858:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u4861
	goto	u4860
u4861:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u4868
u4860:
	clrf	(??_encoder_init+1+0)^00h,c
u4868:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:_enc_state))^00h,c
	line	133
	
l230:
	return	;funcret
	callstack 0
GLOBAL	__end_of_encoder_init
	__end_of_encoder_init:
	signat	_encoder_init,89
	global	_eeprom_init

;; *************** function _eeprom_init *****************
;; Defined at:
;;		line 177 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   29[COMRAM] unsigned char 
;;  calculated_c    2   27[COMRAM] unsigned int 
;;  stored_check    2   25[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_calculate_config_checksum
;;		_eeprom_read_block
;;		_eeprom_read_word
;;		_load_factory_defaults
;;		_save_current_config
;;		_sync_menu_variables
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text34,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	177
global __ptext34
__ptext34:
psect	text34
	file	"src\eeprom.c"
	line	177
	
_eeprom_init:
;incstack = 0
	callstack 26
	line	179
	
l5126:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	182
	
l5128:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	186
	
l5134:
	movf	((c:eeprom_init@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:eeprom_read_block@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:eeprom_read_block@data))^00h,c
	movf	((c:eeprom_init@i))^00h,c,w
	mullw	080h
	movff	prodl,(c:eeprom_read_block@address)
	movff	prodh,(c:eeprom_read_block@address+1)
	movlw	high(080h)
	movwf	((c:eeprom_read_block@length+1))^00h,c
	movlw	low(080h)
	movwf	((c:eeprom_read_block@length))^00h,c
	call	_eeprom_read_block	;wreg free
	line	182
	
l5136:
	incf	((c:eeprom_init@i))^00h,c
	
l5138:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u4831
	goto	u4830

u4831:
	goto	l5134
u4830:
	line	188
	
l5140:
		movlw	low(_system_config)
	movwf	((c:eeprom_read_block@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:eeprom_read_block@data+1))^00h,c

	movlw	high(0180h)
	movwf	((c:eeprom_read_block@address+1))^00h,c
	movlw	low(0180h)
	movwf	((c:eeprom_read_block@address))^00h,c
	movlw	high(080h)
	movwf	((c:eeprom_read_block@length+1))^00h,c
	movlw	low(080h)
	movwf	((c:eeprom_read_block@length))^00h,c
	call	_eeprom_read_block	;wreg free
	line	190
	
l5142:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	192
	
l5144:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u4840
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u4841
	goto	u4840

u4841:
	goto	l5150
u4840:
	line	195
	
l5146:
	call	_load_factory_defaults	;wreg free
	line	196
	
l5148:
	call	_save_current_config	;wreg free
	line	200
	
l5150:
	call	_sync_menu_variables	;wreg free
	line	201
	
l631:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_init
	__end_of_eeprom_init:
	signat	_eeprom_init,89
	global	_sync_menu_variables

;; *************** function _sync_menu_variables *****************
;; Defined at:
;;		line 234 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eeprom_init
;; This function uses a non-reentrant model
;;
psect	text35,class=CODE,space=0,reloc=2,group=0
	line	234
global __ptext35
__ptext35:
psect	text35
	file	"src\eeprom.c"
	line	234
	
_sync_menu_variables:
;incstack = 0
	callstack 28
	line	243
	
l5060:
	movff	_input_config,(c:_enable_edit_flag)
	line	244
	movff	0+(_input_config+01h),(c:_sensor_edit_flag)
	line	245
	
l649:
	return	;funcret
	callstack 0
GLOBAL	__end_of_sync_menu_variables
	__end_of_sync_menu_variables:
	signat	_sync_menu_variables,89
	global	_save_current_config

;; *************** function _save_current_config *****************
;; Defined at:
;;		line 203 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   24[COMRAM] unsigned char 
;;  checksum        2   22[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_calculate_config_checksum
;;		_eeprom_write_block
;;		_eeprom_write_word
;; This function is called by:
;;		_menu_handle_button
;;		_eeprom_init
;; This function uses a non-reentrant model
;;
psect	text36,class=CODE,space=0,reloc=2,group=0
	line	203
global __ptext36
__ptext36:
psect	text36
	file	"src\eeprom.c"
	line	203
	
_save_current_config:
;incstack = 0
	callstack 26
	line	206
	
l5024:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	210
	
l5030:
	movf	((c:save_current_config@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:eeprom_write_block@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:eeprom_write_block@data))^00h,c
	movf	((c:save_current_config@i))^00h,c,w
	mullw	080h
	movff	prodl,(c:eeprom_write_block@address)
	movff	prodh,(c:eeprom_write_block@address+1)
	movlw	high(080h)
	movwf	((c:eeprom_write_block@length+1))^00h,c
	movlw	low(080h)
	movwf	((c:eeprom_write_block@length))^00h,c
	call	_eeprom_write_block	;wreg free
	line	206
	
l5032:
	incf	((c:save_current_config@i))^00h,c
	
l5034:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u4801
	goto	u4800

u4801:
	goto	l5030
u4800:
	line	214
	
l5036:
		movlw	low(_system_config)
	movwf	((c:eeprom_write_block@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:eeprom_write_block@data+1))^00h,c

	movlw	high(0180h)
	movwf	((c:eeprom_write_block@address+1))^00h,c
	movlw	low(0180h)
	movwf	((c:eeprom_write_block@address))^00h,c
	movlw	high(080h)
	movwf	((c:eeprom_write_block@length+1))^00h,c
	movlw	low(080h)
	movwf	((c:eeprom_write_block@length))^00h,c
	call	_eeprom_write_block	;wreg free
	line	217
	
l5038:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	218
	
l5040:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	219
	
l636:
	return	;funcret
	callstack 0
GLOBAL	__end_of_save_current_config
	__end_of_save_current_config:
	signat	_save_current_config,89
	global	_eeprom_write_word

;; *************** function _eeprom_write_word *****************
;; Defined at:
;;		line 152 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;  address         2   12[COMRAM] unsigned int 
;;  data            2   14[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_eeprom_write_byte
;; This function is called by:
;;		_save_current_config
;; This function uses a non-reentrant model
;;
psect	text37,class=CODE,space=0,reloc=2,group=0
	line	152
global __ptext37
__ptext37:
psect	text37
	file	"src\eeprom.c"
	line	152
	
_eeprom_write_word:
;incstack = 0
	callstack 26
	line	154
	
l4658:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	155
	
l4660:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	156
	
l613:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_write_word
	__end_of_eeprom_write_word:
	signat	_eeprom_write_word,8313
	global	_eeprom_write_block

;; *************** function _eeprom_write_block *****************
;; Defined at:
;;		line 158 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;  data            2   12[COMRAM] PTR void 
;;		 -> system_config(128), input_config(384), 
;;  address         2   14[COMRAM] unsigned int 
;;  length          2   16[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2   20[COMRAM] unsigned int 
;;  ptr             2   18[COMRAM] PTR unsigned char 
;;		 -> system_config(128), input_config(384), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        10       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_eeprom_write_byte
;; This function is called by:
;;		_save_current_config
;; This function uses a non-reentrant model
;;
psect	text38,class=CODE,space=0,reloc=2,group=0
	line	158
global __ptext38
__ptext38:
psect	text38
	file	"src\eeprom.c"
	line	158
	
_eeprom_write_block:
;incstack = 0
	callstack 26
	line	160
	
l4662:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	161
	
l4664:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l4670
	line	163
	
l4666:
	movf	((c:eeprom_write_block@i))^00h,c,w
	addwf	((c:eeprom_write_block@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movf	((c:eeprom_write_block@i+1))^00h,c,w
	addwfc	((c:eeprom_write_block@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movf	((c:eeprom_write_block@i))^00h,c,w
	addwf	((c:eeprom_write_block@ptr))^00h,c,w
	movwf	c:fsr2l
	movf	((c:eeprom_write_block@i+1))^00h,c,w
	addwfc	((c:eeprom_write_block@ptr+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:eeprom_write_byte@data))^00h,c
	call	_eeprom_write_byte	;wreg free
	line	161
	
l4668:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l4670:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u4371
	goto	u4370

u4371:
	goto	l4666
u4370:
	line	165
	
l619:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_write_block
	__end_of_eeprom_write_block:
	signat	_eeprom_write_block,12409
	global	_eeprom_write_byte

;; *************** function _eeprom_write_byte *****************
;; Defined at:
;;		line 125 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;  address         2    9[COMRAM] unsigned int 
;;  data            1   11[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eeprom_write_word
;;		_eeprom_write_block
;; This function uses a non-reentrant model
;;
psect	text39,class=CODE,space=0,reloc=2,group=0
	line	125
global __ptext39
__ptext39:
psect	text39
	file	"src\eeprom.c"
	line	125
	
_eeprom_write_byte:
;incstack = 0
	callstack 26
	line	127
	
l4332:
	movff	(c:eeprom_write_byte@address),(c:4009)	;volatile
	line	128
	movff	0+((c:eeprom_write_byte@address)+01h),(c:4010)	;volatile
	line	129
	movff	(c:eeprom_write_byte@data),(c:4008)	;volatile
	line	130
	bcf	((c:4006))^0f00h,c,7	;volsfr
	line	131
	bcf	((c:4006))^0f00h,c,6	;volsfr
	line	132
	bsf	((c:4006))^0f00h,c,2	;volsfr
	line	135
	
l4334:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	136
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	137
	
l4336:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	140
	
l604:
	line	139
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u3901
	goto	u3900
u3901:
	goto	l604
u3900:
	
l606:
	line	141
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	142
	
l607:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_write_byte
	__end_of_eeprom_write_byte:
	signat	_eeprom_write_byte,8313
	global	_calculate_config_checksum

;; *************** function _calculate_config_checksum *****************
;; Defined at:
;;		line 89 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               2   16[COMRAM] unsigned int 
;;  j               2   18[COMRAM] unsigned int 
;;  i               1   20[COMRAM] unsigned char 
;;  data            2   14[COMRAM] PTR unsigned char 
;;		 -> system_config(128), input_config(384), 
;;  checksum        2   12[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    9[COMRAM] unsigned int 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         9       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        12       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eeprom_init
;;		_save_current_config
;; This function uses a non-reentrant model
;;
psect	text40,class=CODE,space=0,reloc=2,group=0
	line	89
global __ptext40
__ptext40:
psect	text40
	file	"src\eeprom.c"
	line	89
	
_calculate_config_checksum:
;incstack = 0
	callstack 27
	line	91
	
l4614:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	95
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	97
	
l4620:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	98
	
l4622:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	100
	
l4628:
	movf	((c:calculate_config_checksum@j))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	98
	
l4630:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l4632:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u4340
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u4341
	goto	u4340

u4341:
	goto	l4628
u4340:
	line	95
	
l4634:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l4636:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u4351
	goto	u4350

u4351:
	goto	l4620
u4350:
	line	105
	
l4638:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	106
	
l4640:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1198+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1198))^00h,c
	line	108
	
l4646:
	movf	((c:calculate_config_checksum@j_1198))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j_1198+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	106
	
l4648:
	infsnz	((c:calculate_config_checksum@j_1198))^00h,c
	incf	((c:calculate_config_checksum@j_1198+1))^00h,c
	
l4650:
		movf	((c:calculate_config_checksum@j_1198+1))^00h,c,w
	bnz	u4360
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1198))^00h,c,w
	btfss	status,0
	goto	u4361
	goto	u4360

u4361:
	goto	l4646
u4360:
	
l597:
	line	111
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	112
	
l598:
	return	;funcret
	callstack 0
GLOBAL	__end_of_calculate_config_checksum
	__end_of_calculate_config_checksum:
	signat	_calculate_config_checksum,90
	global	_load_factory_defaults

;; *************** function _load_factory_defaults *****************
;; Defined at:
;;		line 228 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_memcpy
;; This function is called by:
;;		_eeprom_init
;; This function uses a non-reentrant model
;;
psect	text41,class=CODE,space=0,reloc=2,group=0
	line	228
global __ptext41
__ptext41:
psect	text41
	file	"src\eeprom.c"
	line	228
	
_load_factory_defaults:
;incstack = 0
	callstack 27
	line	230
	
l5058:
		movlw	low(_input_config)
	movwf	((c:memcpy@d1))^00h,c
	movlw	high(_input_config)
	movwf	((c:memcpy@d1+1))^00h,c

		movlw	low(_factory_defaults)
	movwf	((c:memcpy@s1))^00h,c
	movlw	high(_factory_defaults)
	movwf	((c:memcpy@s1+1))^00h,c

	movlw	high(0180h)
	movwf	((c:memcpy@n+1))^00h,c
	movlw	low(0180h)
	movwf	((c:memcpy@n))^00h,c
	call	_memcpy	;wreg free
	line	231
		movlw	low(_system_config)
	movwf	((c:memcpy@d1))^00h,c
	movlw	high(_system_config)
	movwf	((c:memcpy@d1+1))^00h,c

		movlw	low(_system_defaults)
	movwf	((c:memcpy@s1))^00h,c
	movlw	high(_system_defaults)
	movwf	((c:memcpy@s1+1))^00h,c

	movlw	high(080h)
	movwf	((c:memcpy@n+1))^00h,c
	movlw	low(080h)
	movwf	((c:memcpy@n))^00h,c
	call	_memcpy	;wreg free
	line	232
	
l642:
	return	;funcret
	callstack 0
GLOBAL	__end_of_load_factory_defaults
	__end_of_load_factory_defaults:
	signat	_load_factory_defaults,89
	global	_memcpy

;; *************** function _memcpy *****************
;; Defined at:
;;		line 27 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
;; Parameters:    Size  Location     Type
;;  d1              2    9[COMRAM] PTR void 
;;		 -> system_config(128), input_menu(75), input_config(384), 
;;  s1              2   11[COMRAM] PTR const void 
;;		 -> system_defaults(128), factory_defaults(384), temp_menu_template(45), pressure_menu_template(70), 
;;  n               2   13[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  s               2   18[COMRAM] PTR const unsigned char 
;;		 -> system_defaults(128), factory_defaults(384), temp_menu_template(45), pressure_menu_template(70), 
;;  d               2   16[COMRAM] PTR unsigned char 
;;		 -> system_config(128), input_menu(75), input_config(384), 
;;  tmp             1   15[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    9[COMRAM] PTR void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        11       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rebuild_input_menu
;;		_load_factory_defaults
;; This function uses a non-reentrant model
;;
psect	text42,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
global __ptext42
__ptext42:
psect	text42
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
	
_memcpy:
;incstack = 0
	callstack 27
	line	34
	
l4580:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l4590
	line	37
	
l4582:
	movff	(c:memcpy@s),tblptrl
	movff	(c:memcpy@s+1),tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movff	tablat,(c:memcpy@tmp)
	
l4584:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l4586:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l4588:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l4590:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u4291
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u4291
	goto	u4290

u4291:
	goto	l4582
u4290:
	line	41
	
l1386:
	return	;funcret
	callstack 0
GLOBAL	__end_of_memcpy
	__end_of_memcpy:
	signat	_memcpy,12410
	global	_eeprom_read_word

;; *************** function _eeprom_read_word *****************
;; Defined at:
;;		line 144 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;  address         2   11[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  result          2   16[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   11[COMRAM] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_eeprom_read_byte
;; This function is called by:
;;		_eeprom_init
;; This function uses a non-reentrant model
;;
psect	text43,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	144
global __ptext43
__ptext43:
psect	text43
	file	"src\eeprom.c"
	line	144
	
_eeprom_read_word:
;incstack = 0
	callstack 27
	line	147
	
l5042:
	movff	(c:eeprom_read_word@address),(c:eeprom_read_byte@address)
	movff	(c:eeprom_read_word@address+1),(c:eeprom_read_byte@address+1)
	call	_eeprom_read_byte	;wreg free
	movwf	(??_eeprom_read_word+0+0)^00h,c
	movf	((??_eeprom_read_word+0+0))^00h,c,w
	movwf	((c:eeprom_read_word@result))^00h,c
	clrf	((c:eeprom_read_word@result+1))^00h,c
	line	148
	movlw	low(01h)
	addwf	((c:eeprom_read_word@address))^00h,c,w
	movwf	((c:eeprom_read_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_read_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_read_byte@address))^00h,c
	call	_eeprom_read_byte	;wreg free
	movwf	(??_eeprom_read_word+0+0)^00h,c
	movf	((??_eeprom_read_word+0+0))^00h,c,w
	movwf	(??_eeprom_read_word+1+0+1)^00h,c
	clrf	(??_eeprom_read_word+1+0)^00h,c
	movf	(??_eeprom_read_word+1+0)^00h,c,w
	iorwf	((c:eeprom_read_word@result))^00h,c
	movf	(??_eeprom_read_word+1+1)^00h,c,w
	iorwf	((c:eeprom_read_word@result+1))^00h,c

	line	149
	
l5044:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	150
	
l610:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_read_word
	__end_of_eeprom_read_word:
	signat	_eeprom_read_word,4218
	global	_eeprom_read_block

;; *************** function _eeprom_read_block *****************
;; Defined at:
;;		line 167 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;  data            2   11[COMRAM] PTR void 
;;		 -> system_config(128), input_config(384), 
;;  address         2   13[COMRAM] unsigned int 
;;  length          2   15[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2   19[COMRAM] unsigned int 
;;  ptr             2   17[COMRAM] PTR unsigned char 
;;		 -> system_config(128), input_config(384), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        10       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_eeprom_read_byte
;; This function is called by:
;;		_eeprom_init
;; This function uses a non-reentrant model
;;
psect	text44,class=CODE,space=0,reloc=2,group=0
	line	167
global __ptext44
__ptext44:
psect	text44
	file	"src\eeprom.c"
	line	167
	
_eeprom_read_block:
;incstack = 0
	callstack 27
	line	169
	
l5048:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	170
	
l5050:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l5056
	line	172
	
l5052:
	movf	((c:eeprom_read_block@i))^00h,c,w
	addwf	((c:eeprom_read_block@ptr))^00h,c,w
	movwf	c:fsr2l
	movf	((c:eeprom_read_block@i+1))^00h,c,w
	addwfc	((c:eeprom_read_block@ptr+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	((c:eeprom_read_block@i))^00h,c,w
	addwf	((c:eeprom_read_block@address))^00h,c,w
	movwf	((c:eeprom_read_byte@address))^00h,c
	movf	((c:eeprom_read_block@i+1))^00h,c,w
	addwfc	((c:eeprom_read_block@address+1))^00h,c,w
	movwf	1+((c:eeprom_read_byte@address))^00h,c
	call	_eeprom_read_byte	;wreg free
	movwf	indf2,c

	line	170
	
l5054:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l5056:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u4811
	goto	u4810

u4811:
	goto	l5052
u4810:
	line	174
	
l625:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_read_block
	__end_of_eeprom_read_block:
	signat	_eeprom_read_block,12409
	global	_eeprom_read_byte

;; *************** function _eeprom_read_byte *****************
;; Defined at:
;;		line 115 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;  address         2    9[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eeprom_read_word
;;		_eeprom_read_block
;; This function uses a non-reentrant model
;;
psect	text45,class=CODE,space=0,reloc=2,group=0
	line	115
global __ptext45
__ptext45:
psect	text45
	file	"src\eeprom.c"
	line	115
	
_eeprom_read_byte:
;incstack = 0
	callstack 27
	line	117
	
l4652:
	movff	(c:eeprom_read_byte@address),(c:4009)	;volatile
	line	118
	movff	0+((c:eeprom_read_byte@address)+01h),(c:4010)	;volatile
	line	119
	bcf	((c:4006))^0f00h,c,7	;volsfr
	line	120
	bcf	((c:4006))^0f00h,c,6	;volsfr
	line	121
	bsf	((c:4006))^0f00h,c,0	;volsfr
	line	122
	
l4654:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	123
	
l601:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_read_byte
	__end_of_eeprom_read_byte:
	signat	_eeprom_read_byte,4217
	global	_isr

;; *************** function _isr *****************
;; Defined at:
;;		line 29 in file "src\encoder.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  btn             1    8[COMRAM] unsigned char 
;;  new_state       1    7[COMRAM] unsigned char 
;;  combined        1    6[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         9       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 2
;; This function uses a non-reentrant model
;;
psect	intcode,class=CODE,space=0,reloc=2
	file	"src\main.as"
	line	#
global __pintcode
__pintcode:
psect	intcode
	file	"src\encoder.c"
	line	29
	
_isr:
;incstack = 0
	callstack 24
	bsf int$flags,1,c ;set compiler interrupt flag (level 2)
	global	int_func
	call	int_func,f	;refresh shadow registers
psect	intcode_body,class=CODE,space=0,reloc=2
global __pintcode_body
__pintcode_body:
int_func:

	pop	; remove dummy address from shadow register refresh
	movff	tblptrl+0,??_isr+2
	movff	tblptrh+0,??_isr+3
	movff	tblptru+0,??_isr+4
	movff	tablat+0,??_isr+5
	line	31
	
i2l4208:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u367_41
	goto	i2u367_40
i2u367_41:
	goto	i2l227
i2u367_40:
	line	34
	
i2l4210:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	35
	
i2l4212:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	38
	
i2l4214:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u368_41
	goto	i2u368_40
i2u368_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u368_48
i2u368_40:
	clrf	(??_isr+0+0)^00h,c
i2u368_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u369_41
	goto	i2u369_40
i2u369_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u369_48
i2u369_40:
	clrf	(??_isr+1+0)^00h,c
i2u369_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	39
	
i2l4216:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	42
	
i2l4218:
	movlw	low((_enc_table))
	addwf	((c:isr@combined))^00h,c,w
	movwf	tblptrl
	clrf	tblptrh
	movlw	high((_enc_table))
	addwfc	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd	*
	
	movf	tablat,w
	addwf	((c:_enc_accumulator))^00h,c
	line	45
	
i2l4220:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u370_41
	goto	i2u370_40
i2u370_41:
	goto	i2l4234
i2u370_40:
	line	47
	
i2l4222:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u371_41
	goto	i2u371_40

i2u371_41:
	goto	i2l4228
i2u371_40:
	line	49
	
i2l4224:
	movlb	0	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	50
	
i2l4226:; BSR set to: 0

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	51
	goto	i2l4234
	line	52
	
i2l4228:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u372_41
	goto	i2u372_40

i2u372_41:
	goto	i2l4234
i2u372_40:
	line	54
	
i2l4230:
	movlb	0	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	goto	i2l4226
	line	59
	
i2l4234:
	movff	(c:isr@new_state),(c:_enc_state)
	line	62
	
i2l4236:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	63
	
i2l4238:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u373_41
	goto	i2u373_40

i2u373_41:
	goto	i2l4264
i2u373_40:
	line	65
	
i2l4240:
	incf	((c:_btn_debounce))^00h,c
	line	66
	
i2l4242:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u374_41
	goto	i2u374_40

i2u374_41:
	goto	i2l227
i2u374_40:
	line	68
	
i2l4244:
	movff	(c:isr@btn),(c:_last_btn)
	line	69
	
i2l4246:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	71
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u375_41
	goto	i2u375_40
i2u375_41:
	goto	i2l4250
i2u375_40:
	line	74
	
i2l4248:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	75
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	76
	goto	i2l227
	line	80
	
i2l4250:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u376_41
	goto	i2u376_40

i2u376_41:
	goto	i2l4254
i2u376_40:
	line	82
	
i2l4252:
	movlw	low(03h)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	83
	goto	i2l220
	line	84
	
i2l4254:
		movlw	132
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	3
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u377_41
	goto	i2u377_40

i2u377_41:
	goto	i2l4258
i2u377_40:
	line	86
	
i2l4256:
	movlw	low(02h)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	87
	goto	i2l220
	line	88
	
i2l4258:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u378_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u378_41
	goto	i2u378_40

i2u378_41:
	goto	i2l4262
i2u378_40:
	line	90
	
i2l4260:
	movlw	low(01h)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	91
	goto	i2l220
	line	94
	
i2l4262:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	95
	
i2l220:; BSR set to: 0

	line	97
	movlw	low(01h)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	98
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	goto	i2l227
	line	104
	
i2l4264:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	106
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u379_41
	goto	i2u379_40
i2u379_41:
	goto	i2l227
i2u379_40:
	
i2l4266:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u380_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u380_41
	goto	i2u380_40

i2u380_41:
	goto	i2l227
i2u380_40:
	line	108
	
i2l4268:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	112
	
i2l227:
	movff	??_isr+5,tablat+0
	movff	??_isr+4,tblptru+0
	movff	??_isr+3,tblptrh+0
	movff	??_isr+2,tblptrl+0
	bcf int$flags,1,c ;clear compiler interrupt flag (level 2)
	retfie f
	callstack 0
GLOBAL	__end_of_isr
	__end_of_isr:
	signat	_isr,89
psect	mediumconst
	db 0	; dummy byte at the end
	global	__mediumconst
	GLOBAL	__activetblptr
__activetblptr	EQU	2
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
	GLOBAL	___rparam_used
	___rparam_used EQU 1
	GLOBAL	___param_bank
	___param_bank EQU 0
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
       psect   temp,common,ovrld,class=COMRAM,space=1,lowdata
	global	btemp
btemp:
	ds	1
	global	int$flags
	int$flags	set btemp
	global	wtemp8
	wtemp8 set btemp+1
	global	ttemp5
	ttemp5 set btemp+1
	global	ttemp6
	ttemp6 set btemp+4
	global	ttemp7
	ttemp7 set btemp+8
	end
