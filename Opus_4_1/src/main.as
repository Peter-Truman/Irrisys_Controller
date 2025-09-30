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
	FNCALL	_main,_handle_numeric_rotation
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
	FNCALL	_main,_menu_update_numeric_value
	FNCALL	_main,_sprintf
	FNCALL	_main,_system_init
	FNCALL	_main,_uart_init
	FNCALL	_main,_uart_println
	FNCALL	_menu_update_numeric_value,_lcd_print
	FNCALL	_menu_update_numeric_value,_lcd_set_cursor
	FNCALL	_menu_update_numeric_value,_uart_println
	FNCALL	_menu_update_edit_value,_get_item_options
	FNCALL	_menu_update_edit_value,_lcd_print
	FNCALL	_menu_update_edit_value,_lcd_set_cursor
	FNCALL	_menu_update_edit_value,_strcpy
	FNCALL	_menu_update_edit_value,_strlen
	FNCALL	_menu_handle_encoder,_get_item_options
	FNCALL	_menu_handle_encoder,_sprintf
	FNCALL	_menu_handle_encoder,_uart_println
	FNCALL	_menu_handle_button,_beep
	FNCALL	_menu_handle_button,_get_current_numeric_value
	FNCALL	_menu_handle_button,_get_item_options
	FNCALL	_menu_handle_button,_init_numeric_editor
	FNCALL	_menu_handle_button,_menu_draw_input
	FNCALL	_menu_handle_button,_menu_draw_options
	FNCALL	_menu_handle_button,_menu_draw_setup
	FNCALL	_menu_handle_button,_rebuild_input_menu
	FNCALL	_menu_handle_button,_save_current_config
	FNCALL	_menu_handle_button,_sprintf
	FNCALL	_menu_handle_button,_strcmp
	FNCALL	_menu_handle_button,_strcpy
	FNCALL	_rebuild_input_menu,___lwdiv
	FNCALL	_rebuild_input_menu,___lwmod
	FNCALL	_rebuild_input_menu,_memcpy
	FNCALL	_rebuild_input_menu,_sprintf
	FNCALL	_rebuild_input_menu,_strcpy
	FNCALL	_rebuild_input_menu,_uart_println
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
	FNCALL	_menu_draw_input,_uart_println
	FNCALL	_uart_println,_uart_print
	FNCALL	_uart_println,_uart_write
	FNCALL	_uart_print,_uart_write
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
	FNCALL	_init_numeric_editor,___lwdiv
	FNCALL	_init_numeric_editor,___lwmod
	FNCALL	_init_numeric_editor,_abs
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
	FNCALL	_isr,i2___lwmod
	FNCALL	intlevel2,_isr
	global	intlevel2
	FNROOT	intlevel2
	global	_options_menu
	global	menu_draw_setup@F2591
	global	_menu_timeout_seconds
	global	_last_btn
	global	_value_scale20
	global	_value_scale4
	global	_value_back
	global	_enable_edit_flag
	global	_menu_timeout_flag
	global	_value_sensor
	global	_value_display
	global	_value_rlyhigh
	global	_value_slpbp
	global	_value_plpbp
	global	_value_highbp
	global	_value_enable
	global	menu_draw_setup@F2589
	global	_value_high_tbp
	global	_value_high_temp
	global	_value_low_pressure
	global	_value_hi_pressure
	global	_value_rlyslp
	global	_value_rlyplp
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"src\menu.c"
	line	38

;initializer for _options_menu
		db	low(STR_26)
	db	high(STR_26)

		db	low(STR_27)
	db	high(STR_27)

		db	low(STR_28)
	db	high(STR_28)

		db	low(STR_29)
	db	high(STR_29)

		db	low(STR_30)
	db	high(STR_30)

	line	968

;initializer for menu_draw_setup@F2591
		db	low(STR_135)
	db	high(STR_135)

		db	low(STR_136)
	db	high(STR_136)

		db	low(STR_137)
	db	high(STR_137)

	file	"src\eeprom.c"
	line	11

;initializer for _menu_timeout_seconds
	dw	(01Eh)&0ffffh
	file	"src\encoder.c"
	line	25

;initializer for _last_btn
	db	low(01h)
	file	"src\menu.c"
	line	49

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
psect	idataBANK0,class=CODE,space=0,delta=1,noexec
global __pidataBANK0
__pidataBANK0:
	line	48

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
	line	57

;initializer for _value_back
	db	low(042h)
	db	low(061h)
	db	low(063h)
	db	low(06Bh)
	db	low(0)
	line	17

;initializer for _enable_edit_flag
	db	low(01h)
psect	idataBANK1,class=CODE,space=0,delta=1,noexec
global __pidataBANK1
__pidataBANK1:
	file	"src\encoder.c"
	line	16

;initializer for _menu_timeout_flag
	db	low(01h)
	file	"src\menu.c"
	line	47

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
	line	56

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
	line	53

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
	line	52

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
	line	51

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
	line	50

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
	line	46

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
	line	960

;initializer for menu_draw_setup@F2589
		db	low(STR_130)
	db	high(STR_130)

		db	low(STR_131)
	db	high(STR_131)

		db	low(STR_132)
	db	high(STR_132)

		db	low(STR_133)
	db	high(STR_133)

		db	low(STR_134)
	db	high(STR_134)

	line	68

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
	line	67

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
	line	66

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
	line	65

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
	line	64

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
	line	63

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
	line	69

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
	line	62

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
	line	61

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
	line	60

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
	line	54

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
psect	mediumconst,class=MEDIUMCONST,space=0,reloc=2,noexec
global __pmediumconst
__pmediumconst:
	db	0
	file	"src\menu.c"
	line	116
	global	_flow_analog_template
_flow_analog_template:
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

	db	low(01h)
		db	low(STR_70)
	db	high(STR_70)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_71)
	db	high(STR_71)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_72)
	db	high(STR_72)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_flow_analog_template
__end_of_flow_analog_template:
psect	mediumconst
	file	"src\menu.c"
	line	105
	global	_flow_digital_template
_flow_digital_template:
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

	db	low(01h)
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

	db	low(0)
	global __end_of_flow_digital_template
__end_of_flow_digital_template:
	global	_enc_table
psect	mediumconst
	file	"src\encoder.c"
	line	28
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
	line	14
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
	line	80
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
	line	76
_pressure_menu_template:
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

	db	low(01h)
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

	db	low(0)
	global __end_of_pressure_menu_template
__end_of_pressure_menu_template:
	global	_temp_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	93
_temp_menu_template:
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

	db	low(01h)
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

	db	low(0)
	global __end_of_temp_menu_template
__end_of_temp_menu_template:
	global	_menu_item_options
psect	mediumconst
	file	"src\menu.c"
	line	29
_menu_item_options:
	db	low(0)
	db	low(02h)
		db	low(STR_16)
	db	high(STR_16)

		db	low(STR_17)
	db	high(STR_17)

		db	low(STR_18)
	db	high(STR_18)

		db	low(STR_19)
	db	high(STR_19)

		db	low(STR_20)
	db	high(STR_20)

	db	low(01h)
	db	low(03h)
		db	low(STR_21)
	db	high(STR_21)

		db	low(STR_22)
	db	high(STR_22)

		db	low(STR_23)
	db	high(STR_23)

		db	low(STR_24)
	db	high(STR_24)

		db	low(STR_25)
	db	high(STR_25)

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
	global	_menu_timeout_timer
	global	_menu_timeout_reload
	global	_btn_debounce
	global	_enc_accumulator
	global	_enc_state
	global	_ms_counter
	global	_button_pressed
	global	_save_pending
	global	_input_config
	global	_current_input
	global	_sensor_edit_flag
	global	_menu
	global	main@blink_timer
	global	main@encoder_activity_timer
	global	_encoder_count
	global	_current_menu
	global	_timeout_debug_flag
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
	global	_PORTBbits
_PORTBbits	set	0xF81
	global	_TRISC
_TRISC	set	0xF94
	global	_TRISB
_TRISB	set	0xF93
	global	_LATAbits
_LATAbits	set	0xF89
	global	_LATCbits
_LATCbits	set	0xF8B
	global	_OSCCONbits
_OSCCONbits	set	0xFD3
	global	_TXSTAbits
_TXSTAbits	set	0xFAC
	global	_PORTC
_PORTC	set	0xF82
	global	_PORTB
_PORTB	set	0xF81
	global	_PORTA
_PORTA	set	0xF80
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
	
STR_116:
	db	83	;'S'
	db	107	;'k'
	db	105	;'i'
	db	112	;'p'
	db	112	;'p'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	110	;'n'
	db	117	;'u'
	db	109	;'m'
	db	101	;'e'
	db	114	;'r'
	db	105	;'i'
	db	99	;'c'
	db	32
	db	100	;'d'
	db	114	;'r'
	db	97	;'a'
	db	119	;'w'
	db	32
	db	105	;'i'
	db	110	;'n'
	db	32
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	95	;'_'
	db	100	;'d'
	db	114	;'r'
	db	97	;'a'
	db	119	;'w'
	db	95	;'_'
	db	105	;'i'
	db	110	;'n'
	db	112	;'p'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_104:
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	95	;'_'
	db	117	;'u'
	db	112	;'p'
	db	100	;'d'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
	db	95	;'_'
	db	110	;'n'
	db	117	;'u'
	db	109	;'m'
	db	101	;'e'
	db	114	;'r'
	db	105	;'i'
	db	99	;'c'
	db	95	;'_'
	db	118	;'v'
	db	97	;'a'
	db	108	;'l'
	db	117	;'u'
	db	101	;'e'
	db	32
	db	99	;'c'
	db	97	;'a'
	db	108	;'l'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_13:
	db	84	;'T'
	db	73	;'I'
	db	77	;'M'
	db	69	;'E'
	db	79	;'O'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	45
	db	32
	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	32
	db	109	;'m'
	db	97	;'a'
	db	105	;'i'
	db	110	;'n'
	db	32
	db	115	;'s'
	db	99	;'c'
	db	114	;'r'
	db	101	;'e'
	db	101	;'e'
	db	110	;'n'
	db	0
	
STR_126:
	db	65	;'A'
	db	116	;'t'
	db	32
	db	108	;'l'
	db	105	;'i'
	db	109	;'m'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	108	;'l'
	db	105	;'i'
	db	110	;'n'
	db	101	;'e'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	116	;'t'
	db	111	;'o'
	db	116	;'t'
	db	97	;'a'
	db	108	;'l'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
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
	
STR_97:
	db	77	;'M'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	32
	db	105	;'i'
	db	116	;'t'
	db	101	;'e'
	db	109	;'m'
	db	115	;'s'
	db	32
	db	97	;'a'
	db	102	;'f'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	32
	db	114	;'r'
	db	101	;'e'
	db	98	;'b'
	db	117	;'u'
	db	105	;'i'
	db	108	;'l'
	db	100	;'d'
	db	58	;':'
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
	
STR_96:
	db	84	;'T'
	db	111	;'o'
	db	116	;'t'
	db	97	;'a'
	db	108	;'l'
	db	32
	db	105	;'i'
	db	116	;'t'
	db	101	;'e'
	db	109	;'m'
	db	115	;'s'
	db	32
	db	115	;'s'
	db	101	;'e'
	db	116	;'t'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	58	;':'
	db	32
	db	37
	db	100	;'d'
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
	
STR_73:
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
	
STR_112:
	db	68	;'D'
	db	114	;'r'
	db	97	;'a'
	db	119	;'w'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	105	;'i'
	db	100	;'d'
	db	120	;'x'
	db	32
	db	37
	db	100	;'d'
	db	58	;':'
	db	32
	db	37
	db	115	;'s'
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
	
STR_37:
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
	
STR_28:
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
	
STR_69:
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
	
STR_35:
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
	
STR_98:
	db	73	;'I'
	db	116	;'t'
	db	101	;'e'
	db	109	;'m'
	db	32
	db	37
	db	100	;'d'
	db	58	;':'
	db	32
	db	37
	db	115	;'s'
	db	0
	
STR_14:
	db	77	;'M'
	db	65	;'A'
	db	73	;'I'
	db	78	;'N'
	db	32
	db	83	;'S'
	db	67	;'C'
	db	82	;'R'
	db	69	;'E'
	db	69	;'E'
	db	78	;'N'
	db	0
	
STR_34:
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
	
STR_58:
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
	
STR_27:
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
	
STR_33:
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
	
STR_81:
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
	
STR_49:
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
	
STR_26:
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
	
STR_36:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_50:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	84	;'T'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_111:
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_16:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_87:
	db	78	;'N'
	db	111	;'o'
	db	116	;'t'
	db	32
	db	85	;'U'
	db	115	;'s'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_40:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	0
	
STR_68:
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_130:
	db	73	;'I'
	db	110	;'n'
	db	112	;'p'
	db	117	;'u'
	db	116	;'t'
	db	32
	db	49	;'1'
	db	0
	
STR_131:
	db	73	;'I'
	db	110	;'n'
	db	112	;'p'
	db	117	;'u'
	db	116	;'t'
	db	32
	db	50	;'2'
	db	0
	
STR_132:
	db	73	;'I'
	db	110	;'n'
	db	112	;'p'
	db	117	;'u'
	db	116	;'t'
	db	32
	db	51	;'3'
	db	0
	
STR_42:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_108:
	db	79	;'O'
	db	80	;'P'
	db	84	;'T'
	db	73	;'I'
	db	79	;'O'
	db	78	;'N'
	db	83	;'S'
	db	0
	
STR_17:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_41:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_57:
	db	78	;'N'
	db	111	;'o'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_43:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	0
	
STR_15:
	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_140:
	db	40
	db	110	;'n'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	41
	db	0
	
STR_31:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	0
	
STR_32:
	db	83	;'S'
	db	101	;'e'
	db	110	;'n'
	db	115	;'s'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_38:
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_39:
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_129:
	db	83	;'S'
	db	69	;'E'
	db	84	;'T'
	db	85	;'U'
	db	80	;'P'
	db	0
	
STR_78:
	db	37
	db	43
	db	48	;'0'
	db	52	;'4'
	db	100	;'d'
	db	0
	
STR_86:
	db	80	;'P'
	db	117	;'u'
	db	108	;'l'
	db	115	;'s'
	db	101	;'e'
	db	0
	
STR_85:
	db	76	;'L'
	db	97	;'a'
	db	116	;'t'
	db	99	;'c'
	db	104	;'h'
	db	0
	
STR_133:
	db	67	;'C'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_113:
	db	69	;'E'
	db	114	;'r'
	db	114	;'r'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_65:
	db	85	;'U'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	115	;'s'
	db	0
	
STR_29:
	db	65	;'A'
	db	98	;'b'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_95:
	db	72	;'H'
	db	105	;'i'
	db	100	;'d'
	db	101	;'e'
	db	0
	
STR_56:
	db	84	;'T'
	db	121	;'y'
	db	112	;'p'
	db	101	;'e'
	db	0
	
STR_44:
	db	66	;'B'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_30:
	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	0
	
STR_94:
	db	83	;'S'
	db	104	;'h'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_106:
	db	40
	db	0
	
STR_109:
	db	91	;'['
	db	0
	
STR_110:
	db	93	;']'
	db	0
STR_52	equ	STR_43+0
STR_60	equ	STR_43+0
STR_71	equ	STR_43+0
STR_23	equ	STR_57+3
STR_137	equ	STR_57+3
STR_59	equ	STR_41+0
STR_70	equ	STR_41+0
STR_74	equ	STR_98+9
STR_46	equ	STR_32+0
STR_55	equ	STR_32+0
STR_63	equ	STR_32+0
STR_121	equ	STR_113+0
STR_22	equ	STR_49+5
STR_99	equ	STR_49+5
STR_136	equ	STR_49+5
STR_53	equ	STR_44+0
STR_61	equ	STR_44+0
STR_72	equ	STR_44+0
STR_134	equ	STR_44+0
STR_51	equ	STR_40+0
STR_88	equ	STR_85+0
STR_91	equ	STR_85+0
STR_89	equ	STR_86+0
STR_92	equ	STR_86+0
STR_21	equ	STR_35+3
STR_77	equ	STR_35+3
STR_135	equ	STR_35+3
STR_64	equ	STR_56+0
STR_45	equ	STR_31+0
STR_54	equ	STR_31+0
STR_62	equ	STR_31+0
STR_90	equ	STR_87+0
STR_93	equ	STR_87+0
STR_76	equ	STR_16+0
STR_75	equ	STR_17+0
STR_79	equ	STR_78+0
STR_100	equ	STR_78+0
STR_101	equ	STR_78+0
STR_127	equ	STR_78+0
STR_128	equ	STR_78+0
STR_83	equ	STR_81+0
STR_84	equ	STR_81+0
STR_103	equ	STR_81+0
STR_80	equ	STR_11+20
STR_82	equ	STR_11+20
STR_102	equ	STR_11+20
STR_119	equ	STR_110+0
STR_139	equ	STR_110+0
STR_117	equ	STR_109+0
STR_138	equ	STR_109+0
STR_47	equ	STR_33+0
STR_66	equ	STR_33+0
STR_48	equ	STR_34+0
STR_67	equ	STR_34+0
STR_107	equ	STR_140+5
STR_120	equ	STR_140+5
STR_125	equ	STR_140+5
STR_118	equ	STR_106+0
STR_124	equ	STR_106+0
STR_123	equ	STR_73+10
STR_105	equ	STR_73+14
STR_114	equ	STR_73+15
STR_122	equ	STR_73+15
STR_18	equ	STR_73+20
STR_19	equ	STR_73+20
STR_20	equ	STR_73+20
STR_24	equ	STR_73+20
STR_25	equ	STR_73+20
STR_115	equ	STR_73+20
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
menu_update_numeric_value@F2524:
       ds      5
	global	_button_hold_ms
_button_hold_ms:
       ds      2
	global	_menu_timeout_timer
_menu_timeout_timer:
       ds      2
	global	_menu_timeout_reload
_menu_timeout_reload:
       ds      2
_btn_debounce:
       ds      1
_enc_accumulator:
       ds      1
_enc_state:
       ds      1
	global	_ms_counter
_ms_counter:
       ds      1
	global	_button_pressed
_button_pressed:
       ds      1
	global	_save_pending
_save_pending:
       ds      1
psect	dataCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pdataCOMRAM
__pdataCOMRAM:
	file	"src\menu.c"
	line	38
	global	_options_menu
_options_menu:
       ds      10
psect	dataCOMRAM
	file	"src\menu.c"
	line	968
menu_draw_setup@F2591:
       ds      6
psect	dataCOMRAM
	file	"src\eeprom.c"
	line	11
	global	_menu_timeout_seconds
_menu_timeout_seconds:
       ds      2
psect	dataCOMRAM
	file	"src\encoder.c"
	line	25
_last_btn:
       ds      1
psect	dataCOMRAM
	file	"src\menu.c"
	line	49
_value_scale20:
       ds      10
psect	bssBANK0,class=BANK0,space=1,noexec,lowdata
global __pbssBANK0
__pbssBANK0:
	global	_current_input
_current_input:
       ds      1
	global	_sensor_edit_flag
_sensor_edit_flag:
       ds      1
psect	dataBANK0,class=BANK0,space=1,noexec,lowdata
global __pdataBANK0
__pdataBANK0:
	file	"src\menu.c"
	line	48
_value_scale4:
       ds      10
psect	dataBANK0
	file	"src\menu.c"
	line	57
_value_back:
       ds      5
psect	dataBANK0
	file	"src\menu.c"
	line	17
	global	_enable_edit_flag
_enable_edit_flag:
       ds      1
psect	bssBANK1,class=BANK1,space=1,noexec,lowdata
global __pbssBANK1
__pbssBANK1:
	global	_menu
_menu:
       ds      15
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
	global	_timeout_debug_flag
_timeout_debug_flag:
       ds      1
	global	_button_event
_button_event:
       ds      1
	global	_input_menu
_input_menu:
       ds      75
psect	dataBANK1,class=BANK1,space=1,noexec,lowdata
global __pdataBANK1
__pdataBANK1:
	file	"src\encoder.c"
	line	16
	global	_menu_timeout_flag
_menu_timeout_flag:
       ds      1
psect	dataBANK1
	file	"src\menu.c"
	line	47
_value_sensor:
       ds      12
psect	dataBANK1
	file	"src\menu.c"
	line	56
_value_display:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	53
_value_rlyhigh:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	52
_value_slpbp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	51
_value_plpbp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	50
_value_highbp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	46
_value_enable:
       ds      10
psect	bssBANK2,class=BANK2,space=1,noexec,lowdata
global __pbssBANK2
__pbssBANK2:
_original_value:
       ds      10
psect	dataBANK2,class=BANK2,space=1,noexec,lowdata
global __pdataBANK2
__pdataBANK2:
	file	"src\menu.c"
	line	960
menu_draw_setup@F2589:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	68
_value_low_flow_bp:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	67
_value_no_flow_bp:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	66
_value_low_flow:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	65
_value_no_flow:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	64
_value_flow_units:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	63
_value_flow_type:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	69
_value_high_tbp:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	62
_value_high_temp:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	61
_value_low_pressure:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	60
_value_hi_pressure:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	55
_value_rlyslp:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	54
_value_rlyplp:
       ds      10
psect	bssBANK3,class=BANK3,space=1,noexec,lowdata
global __pbssBANK3
__pbssBANK3:
	global	_system_config
_system_config:
       ds      128
psect	bssBIGRAM,class=BIGRAM,space=1,noexec
global __pbssBIGRAM
__pbssBIGRAM:
	global	_input_config
_input_config:
       ds      384
	file	"src\main.as"
	line	#
psect	cinit
; Initialize objects allocated to BANK2 (130 bytes)
	global __pidataBANK2
	; load TBLPTR registers with __pidataBANK2
	movlw	low (__pidataBANK2)
	movwf	tblptrl
	movlw	high(__pidataBANK2)
	movwf	tblptrh
	movlw	low highword(__pidataBANK2)
	movwf	tblptru
	lfsr	0,__pdataBANK2
	lfsr	1,130
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK1 (73 bytes)
	global __pidataBANK1
	; load TBLPTR registers with __pidataBANK1
	movlw	low (__pidataBANK1)
	movwf	tblptrl
	movlw	high(__pidataBANK1)
	movwf	tblptrh
	movlw	low highword(__pidataBANK1)
	movwf	tblptru
	lfsr	0,__pdataBANK1
	lfsr	1,73
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
; Initialize objects allocated to BANK0 (16 bytes)
	global __pidataBANK0
	; load TBLPTR registers with __pidataBANK0
	movlw	low (__pidataBANK0)
	movwf	tblptrl
	movlw	high(__pidataBANK0)
	movwf	tblptrh
	movlw	low highword(__pidataBANK0)
	movwf	tblptru
	lfsr	0,__pdataBANK0
	lfsr	1,16
	copy_data2:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data2
; Initialize objects allocated to COMRAM (29 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	lfsr	0,__pdataCOMRAM
	lfsr	1,29
	copy_data3:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data3
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
; Clear objects allocated to BANK3 (128 bytes)
	global __pbssBANK3
lfsr	0,__pbssBANK3
movlw	128
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
; Clear objects allocated to BANK2 (10 bytes)
	global __pbssBANK2
lfsr	0,__pbssBANK2
movlw	10
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
; Clear objects allocated to BANK1 (101 bytes)
	global __pbssBANK1
lfsr	0,__pbssBANK1
movlw	101
clear_3:
clrf	postinc0,c
decf	wreg
bnz	clear_3
; Clear objects allocated to BANK0 (2 bytes)
	global __pbssBANK0
movlb	0
clrf	(__pbssBANK0+1)&0xffh,b
clrf	(__pbssBANK0+0)&0xffh,b
; Clear objects allocated to COMRAM (17 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	17
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
	global	main@buf_522
main@buf_522:	; 30 bytes @ 0x28
	ds   30
	global	main@last_button
main@last_button:	; 1 bytes @ 0x46
	ds   1
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0x47
	ds   2
	global	main@delta
main@delta:	; 2 bytes @ 0x49
	ds   2
	global	main@current_event
main@current_event:	; 1 bytes @ 0x4B
	ds   1
psect	cstackBANK1,class=BANK1,space=1,noexec,lowdata
global __pcstackBANK1
__pcstackBANK1:
	global	menu_handle_button@current_val
menu_handle_button@current_val:	; 2 bytes @ 0x0
	ds   2
	global	menu_handle_button@edit_flag
menu_handle_button@edit_flag:	; 1 bytes @ 0x2
	ds   1
	global	menu_handle_button@edit_flag_1106
menu_handle_button@edit_flag_1106:	; 1 bytes @ 0x3
	ds   1
	global	menu_handle_button@opts
menu_handle_button@opts:	; 2 bytes @ 0x4
	ds   2
	global	menu_handle_button@opts_1102
menu_handle_button@opts_1102:	; 2 bytes @ 0x6
	ds   2
	global	menu_handle_button@i
menu_handle_button@i:	; 1 bytes @ 0x8
	ds   1
	global	menu_handle_button@press_type
menu_handle_button@press_type:	; 1 bytes @ 0x9
	ds   1
	global	menu_handle_button@new_value
menu_handle_button@new_value:	; 2 bytes @ 0xA
	ds   2
psect	cstackBANK0,class=BANK0,space=1,noexec,lowdata
global __pcstackBANK0
__pcstackBANK0:
	global	rebuild_input_menu@buf_977
rebuild_input_menu@buf_977:	; 50 bytes @ 0x0
	global	menu_draw_input@buf
menu_draw_input@buf:	; 50 bytes @ 0x0
	global	menu_handle_encoder@buf
menu_handle_encoder@buf:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_encoder@opts
menu_handle_encoder@opts:	; 2 bytes @ 0x32
	global	menu_draw_input@title
menu_draw_input@title:	; 10 bytes @ 0x32
	global	rebuild_input_menu@buf
rebuild_input_menu@buf:	; 30 bytes @ 0x32
	ds   2
	global	menu_handle_encoder@edit_flag
menu_handle_encoder@edit_flag:	; 1 bytes @ 0x34
	ds   8
	global	menu_draw_input@value_buf
menu_draw_input@value_buf:	; 15 bytes @ 0x3C
	ds   15
	global	menu_draw_input@start_pos
menu_draw_input@start_pos:	; 1 bytes @ 0x4B
	ds   1
	global	_menu_draw_input$1029
_menu_draw_input$1029:	; 2 bytes @ 0x4C
	ds   2
	global	_menu_draw_input$1036
_menu_draw_input$1036:	; 2 bytes @ 0x4E
	ds   2
	global	_rebuild_input_menu$936
_rebuild_input_menu$936:	; 2 bytes @ 0x50
	global	_menu_draw_input$1049
_menu_draw_input$1049:	; 2 bytes @ 0x50
	ds   2
	global	_rebuild_input_menu$950
_rebuild_input_menu$950:	; 2 bytes @ 0x52
	global	_menu_draw_input$1053
_menu_draw_input$1053:	; 2 bytes @ 0x52
	ds   2
	global	menu_draw_input@flag_value
menu_draw_input@flag_value:	; 1 bytes @ 0x54
	global	_rebuild_input_menu$951
_rebuild_input_menu$951:	; 2 bytes @ 0x54
	ds   1
	global	menu_draw_input@flag_value_1035
menu_draw_input@flag_value_1035:	; 1 bytes @ 0x55
	ds   1
	global	menu_draw_input@val_len
menu_draw_input@val_len:	; 1 bytes @ 0x56
	global	_rebuild_input_menu$957
_rebuild_input_menu$957:	; 2 bytes @ 0x56
	ds   1
	global	menu_draw_input@val_len_1040
menu_draw_input@val_len_1040:	; 1 bytes @ 0x57
	ds   1
	global	menu_draw_input@j
menu_draw_input@j:	; 1 bytes @ 0x58
	global	_rebuild_input_menu$958
_rebuild_input_menu$958:	; 2 bytes @ 0x58
	ds   1
	global	menu_draw_input@j_1041
menu_draw_input@j_1041:	; 1 bytes @ 0x59
	ds   1
	global	_rebuild_input_menu$964
_rebuild_input_menu$964:	; 2 bytes @ 0x5A
	global	menu_draw_input@opts
menu_draw_input@opts:	; 2 bytes @ 0x5A
	ds   2
	global	_rebuild_input_menu$965
_rebuild_input_menu$965:	; 2 bytes @ 0x5C
	global	menu_draw_input@opts_1031
menu_draw_input@opts_1031:	; 2 bytes @ 0x5C
	ds   2
	global	menu_draw_input@val_len_1042
menu_draw_input@val_len_1042:	; 1 bytes @ 0x5E
	global	_rebuild_input_menu$969
_rebuild_input_menu$969:	; 2 bytes @ 0x5E
	ds   1
	global	menu_draw_input@show_brackets
menu_draw_input@show_brackets:	; 1 bytes @ 0x5F
	ds   1
	global	rebuild_input_menu@sensor
rebuild_input_menu@sensor:	; 1 bytes @ 0x60
	global	menu_draw_input@i
menu_draw_input@i:	; 1 bytes @ 0x60
	ds   1
	global	rebuild_input_menu@i
rebuild_input_menu@i:	; 1 bytes @ 0x61
	global	menu_draw_input@item_idx
menu_draw_input@item_idx:	; 1 bytes @ 0x61
	ds   1
	global	_rebuild_input_menu$2060
_rebuild_input_menu$2060:	; 2 bytes @ 0x62
	ds   2
	global	_rebuild_input_menu$2061
_rebuild_input_menu$2061:	; 2 bytes @ 0x64
	ds   2
	global	rebuild_input_menu@input_num
rebuild_input_menu@input_num:	; 1 bytes @ 0x66
	ds   1
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_isdigit:	; 1 bit 
?_eeprom_init:	; 1 bytes @ 0x0
?_encoder_init:	; 1 bytes @ 0x0
?_menu_init:	; 1 bytes @ 0x0
?_menu_draw_options:	; 1 bytes @ 0x0
?_handle_numeric_rotation:	; 1 bytes @ 0x0
?_menu_update_numeric_value:	; 1 bytes @ 0x0
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
?_lcd_clear_line:	; 1 bytes @ 0x0
?_rebuild_input_menu:	; 1 bytes @ 0x0
	global	?i2___lwmod
?i2___lwmod:	; 2 bytes @ 0x0
	global	i2___lwmod@dividend
i2___lwmod@dividend:	; 2 bytes @ 0x0
	ds   2
	global	i2___lwmod@divisor
i2___lwmod@divisor:	; 2 bytes @ 0x2
	ds   2
??i2___lwmod:	; 1 bytes @ 0x4
	global	i2___lwmod@counter
i2___lwmod@counter:	; 1 bytes @ 0x4
	ds   1
??_isr:	; 1 bytes @ 0x5
	ds   6
	global	isr@combined
isr@combined:	; 1 bytes @ 0xB
	ds   1
	global	isr@new_state
isr@new_state:	; 1 bytes @ 0xC
	ds   1
	global	isr@btn
isr@btn:	; 1 bytes @ 0xD
	ds   1
??_encoder_init:	; 1 bytes @ 0xE
??_menu_init:	; 1 bytes @ 0xE
??_handle_numeric_rotation:	; 1 bytes @ 0xE
??_sync_menu_variables:	; 1 bytes @ 0xE
??_isdigit:	; 1 bytes @ 0xE
??_uart_init:	; 1 bytes @ 0xE
??_uart_write:	; 1 bytes @ 0xE
??_system_init:	; 1 bytes @ 0xE
??_lcd_write_nibble:	; 1 bytes @ 0xE
?_beep:	; 1 bytes @ 0xE
?_eeprom_read_byte:	; 1 bytes @ 0xE
?_eeprom_write_byte:	; 1 bytes @ 0xE
?_strcpy:	; 2 bytes @ 0xE
?_memcpy:	; 2 bytes @ 0xE
	global	?_abs
?_abs:	; 2 bytes @ 0xE
	global	?_strlen
?_strlen:	; 2 bytes @ 0xE
	global	?_strcmp
?_strcmp:	; 2 bytes @ 0xE
	global	?_get_item_options
?_get_item_options:	; 2 bytes @ 0xE
	global	?_get_current_numeric_value
?_get_current_numeric_value:	; 2 bytes @ 0xE
	global	?_calculate_config_checksum
?_calculate_config_checksum:	; 2 bytes @ 0xE
	global	?___wmul
?___wmul:	; 2 bytes @ 0xE
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0xE
	global	uart_write@c
uart_write@c:	; 1 bytes @ 0xE
	global	lcd_write_nibble@nibble
lcd_write_nibble@nibble:	; 1 bytes @ 0xE
	global	beep@duration_ms
beep@duration_ms:	; 2 bytes @ 0xE
	global	_handle_numeric_rotation$992
_handle_numeric_rotation$992:	; 2 bytes @ 0xE
	global	eeprom_read_byte@address
eeprom_read_byte@address:	; 2 bytes @ 0xE
	global	eeprom_write_byte@address
eeprom_write_byte@address:	; 2 bytes @ 0xE
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0xE
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0xE
	global	abs@a
abs@a:	; 2 bytes @ 0xE
	global	memcpy@d1
memcpy@d1:	; 2 bytes @ 0xE
	global	strcmp@s1
strcmp@s1:	; 2 bytes @ 0xE
	global	strcpy@to
strcpy@to:	; 2 bytes @ 0xE
	global	strlen@s
strlen@s:	; 2 bytes @ 0xE
	ds   1
?_uart_print:	; 1 bytes @ 0xF
??_lcd_cmd:	; 1 bytes @ 0xF
??_lcd_data:	; 1 bytes @ 0xF
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0xF
	global	_isdigit$1813
_isdigit$1813:	; 1 bytes @ 0xF
	global	uart_print@str
uart_print@str:	; 2 bytes @ 0xF
	ds   1
??_abs:	; 1 bytes @ 0x10
??_strlen:	; 1 bytes @ 0x10
??_get_item_options:	; 1 bytes @ 0x10
?_lcd_print:	; 1 bytes @ 0x10
??_beep:	; 1 bytes @ 0x10
??_get_current_numeric_value:	; 1 bytes @ 0x10
??_calculate_config_checksum:	; 1 bytes @ 0x10
??_eeprom_read_byte:	; 1 bytes @ 0x10
?_eeprom_read_block:	; 1 bytes @ 0x10
	global	?_eeprom_read_word
?_eeprom_read_word:	; 2 bytes @ 0x10
	global	lcd_cmd@cmd
lcd_cmd@cmd:	; 1 bytes @ 0x10
	global	get_item_options@item_index
get_item_options@item_index:	; 1 bytes @ 0x10
	global	handle_numeric_rotation@max_tens
handle_numeric_rotation@max_tens:	; 1 bytes @ 0x10
	global	eeprom_write_byte@data
eeprom_write_byte@data:	; 1 bytes @ 0x10
	global	isdigit@c
isdigit@c:	; 1 bytes @ 0x10
	global	lcd_print@str
lcd_print@str:	; 2 bytes @ 0x10
	global	eeprom_read_word@address
eeprom_read_word@address:	; 2 bytes @ 0x10
	global	eeprom_read_block@data
eeprom_read_block@data:	; 2 bytes @ 0x10
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x10
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x10
	global	memcpy@s1
memcpy@s1:	; 2 bytes @ 0x10
	global	strcmp@s2
strcmp@s2:	; 2 bytes @ 0x10
	global	strcpy@from
strcpy@from:	; 2 bytes @ 0x10
	global	strlen@cp
strlen@cp:	; 2 bytes @ 0x10
	ds   1
??_uart_print:	; 1 bytes @ 0x11
?_uart_println:	; 1 bytes @ 0x11
??_lcd_clear:	; 1 bytes @ 0x11
?_lcd_set_cursor:	; 1 bytes @ 0x11
??_lcd_init:	; 1 bytes @ 0x11
??_eeprom_write_byte:	; 1 bytes @ 0x11
?_eeprom_write_word:	; 1 bytes @ 0x11
?_eeprom_write_block:	; 1 bytes @ 0x11
	global	lcd_set_cursor@col
lcd_set_cursor@col:	; 1 bytes @ 0x11
	global	get_item_options@i
get_item_options@i:	; 1 bytes @ 0x11
	global	handle_numeric_rotation@direction
handle_numeric_rotation@direction:	; 1 bytes @ 0x11
	global	uart_println@str
uart_println@str:	; 2 bytes @ 0x11
	global	beep@i
beep@i:	; 2 bytes @ 0x11
	global	calculate_config_checksum@checksum
calculate_config_checksum@checksum:	; 2 bytes @ 0x11
	global	eeprom_write_word@address
eeprom_write_word@address:	; 2 bytes @ 0x11
	global	eeprom_write_block@data
eeprom_write_block@data:	; 2 bytes @ 0x11
	ds   1
??_strcpy:	; 1 bytes @ 0x12
??_strcmp:	; 1 bytes @ 0x12
??_lcd_print:	; 1 bytes @ 0x12
??_lcd_set_cursor:	; 1 bytes @ 0x12
??_eeprom_read_word:	; 1 bytes @ 0x12
??___wmul:	; 1 bytes @ 0x12
??___lwdiv:	; 1 bytes @ 0x12
	global	lcd_set_cursor@row
lcd_set_cursor@row:	; 1 bytes @ 0x12
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x12
	global	eeprom_read_block@address
eeprom_read_block@address:	; 2 bytes @ 0x12
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x12
	global	memcpy@n
memcpy@n:	; 2 bytes @ 0x12
	global	strcpy@cp
strcpy@cp:	; 2 bytes @ 0x12
	ds   1
??_uart_println:	; 1 bytes @ 0x13
	global	lcd_set_cursor@address
lcd_set_cursor@address:	; 1 bytes @ 0x13
	global	calculate_config_checksum@data
calculate_config_checksum@data:	; 2 bytes @ 0x13
	global	eeprom_write_word@data
eeprom_write_word@data:	; 2 bytes @ 0x13
	global	eeprom_write_block@address
eeprom_write_block@address:	; 2 bytes @ 0x13
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x13
	ds   1
??_menu_update_numeric_value:	; 1 bytes @ 0x14
??_menu_update_edit_value:	; 1 bytes @ 0x14
??_memcpy:	; 1 bytes @ 0x14
?_lcd_print_at:	; 1 bytes @ 0x14
??_lcd_clear_line:	; 1 bytes @ 0x14
	global	lcd_print_at@col
lcd_print_at@col:	; 1 bytes @ 0x14
	global	lcd_clear_line@row
lcd_clear_line@row:	; 1 bytes @ 0x14
	global	memcpy@tmp
memcpy@tmp:	; 1 bytes @ 0x14
	global	strcmp@r
strcmp@r:	; 1 bytes @ 0x14
	global	eeprom_read_block@length
eeprom_read_block@length:	; 2 bytes @ 0x14
	global	menu_update_numeric_value@value_buf
menu_update_numeric_value@value_buf:	; 5 bytes @ 0x14
	ds   1
??_eeprom_write_word:	; 1 bytes @ 0x15
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x15
	global	lcd_print_at@str
lcd_print_at@str:	; 2 bytes @ 0x15
	global	calculate_config_checksum@j
calculate_config_checksum@j:	; 2 bytes @ 0x15
	global	eeprom_read_word@result
eeprom_read_word@result:	; 2 bytes @ 0x15
	global	eeprom_write_block@length
eeprom_write_block@length:	; 2 bytes @ 0x15
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x15
	global	memcpy@d
memcpy@d:	; 2 bytes @ 0x15
	ds   1
??_eeprom_read_block:	; 1 bytes @ 0x16
	global	get_current_numeric_value@value
get_current_numeric_value@value:	; 2 bytes @ 0x16
	global	eeprom_read_block@ptr
eeprom_read_block@ptr:	; 2 bytes @ 0x16
	ds   1
??_lcd_print_at:	; 1 bytes @ 0x17
??_eeprom_write_block:	; 1 bytes @ 0x17
	global	lcd_print_at@row
lcd_print_at@row:	; 1 bytes @ 0x17
	global	calculate_config_checksum@j_1286
calculate_config_checksum@j_1286:	; 2 bytes @ 0x17
	global	eeprom_write_block@ptr
eeprom_write_block@ptr:	; 2 bytes @ 0x17
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x17
	global	memcpy@s
memcpy@s:	; 2 bytes @ 0x17
	ds   1
??_menu_draw_options:	; 1 bytes @ 0x18
??_menu_draw_setup:	; 1 bytes @ 0x18
	global	eeprom_read_block@i
eeprom_read_block@i:	; 2 bytes @ 0x18
	global	menu_update_edit_value@value_buf
menu_update_edit_value@value_buf:	; 15 bytes @ 0x18
	ds   1
??_load_factory_defaults:	; 1 bytes @ 0x19
??___lwmod:	; 1 bytes @ 0x19
	global	calculate_config_checksum@i
calculate_config_checksum@i:	; 1 bytes @ 0x19
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x19
	global	_menu_update_numeric_value$1000
_menu_update_numeric_value$1000:	; 2 bytes @ 0x19
	global	eeprom_write_block@i
eeprom_write_block@i:	; 2 bytes @ 0x19
	ds   1
?_init_numeric_editor:	; 1 bytes @ 0x1A
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x1A
	global	init_numeric_editor@value
init_numeric_editor@value:	; 2 bytes @ 0x1A
	global	sprintf@sp
sprintf@sp:	; 2 bytes @ 0x1A
	ds   1
??_save_current_config:	; 1 bytes @ 0x1B
	global	_menu_update_numeric_value$1001
_menu_update_numeric_value$1001:	; 2 bytes @ 0x1B
	global	save_current_config@checksum
save_current_config@checksum:	; 2 bytes @ 0x1B
	ds   1
??_init_numeric_editor:	; 1 bytes @ 0x1C
	global	init_numeric_editor@abs_value
init_numeric_editor@abs_value:	; 2 bytes @ 0x1C
	global	sprintf@f
sprintf@f:	; 2 bytes @ 0x1C
	ds   1
	global	menu_draw_options@i
menu_draw_options@i:	; 1 bytes @ 0x1D
	global	save_current_config@i
save_current_config@i:	; 1 bytes @ 0x1D
	global	_menu_update_numeric_value$1002
_menu_update_numeric_value$1002:	; 2 bytes @ 0x1D
	global	menu_draw_setup@sensor_type_names
menu_draw_setup@sensor_type_names:	; 6 bytes @ 0x1D
	ds   1
??_eeprom_init:	; 1 bytes @ 0x1E
	global	eeprom_init@stored_checksum
eeprom_init@stored_checksum:	; 2 bytes @ 0x1E
	ds   1
	global	_menu_update_numeric_value$1003
_menu_update_numeric_value$1003:	; 2 bytes @ 0x1F
	ds   1
	global	eeprom_init@calculated_checksum
eeprom_init@calculated_checksum:	; 2 bytes @ 0x20
	ds   1
	global	_menu_update_numeric_value$1004
_menu_update_numeric_value$1004:	; 2 bytes @ 0x21
	ds   1
??_sprintf:	; 1 bytes @ 0x22
	global	eeprom_init@i
eeprom_init@i:	; 1 bytes @ 0x22
	ds   1
	global	menu_update_numeric_value@item_idx
menu_update_numeric_value@item_idx:	; 1 bytes @ 0x23
	global	menu_draw_setup@setup_items
menu_draw_setup@setup_items:	; 10 bytes @ 0x23
	ds   1
	global	menu_update_numeric_value@screen_line
menu_update_numeric_value@screen_line:	; 1 bytes @ 0x24
	ds   1
	global	_sprintf$1370
_sprintf$1370:	; 2 bytes @ 0x25
	ds   2
	global	menu_update_edit_value@start_pos
menu_update_edit_value@start_pos:	; 1 bytes @ 0x27
	global	_sprintf$1371
_sprintf$1371:	; 2 bytes @ 0x27
	ds   1
	global	_menu_update_edit_value$1063
_menu_update_edit_value$1063:	; 2 bytes @ 0x28
	ds   1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x29
	ds   1
	global	menu_update_edit_value@val_len
menu_update_edit_value@val_len:	; 1 bytes @ 0x2A
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x2A
	ds   1
	global	menu_update_edit_value@val_len_1068
menu_update_edit_value@val_len_1068:	; 1 bytes @ 0x2B
	global	sprintf@cp
sprintf@cp:	; 2 bytes @ 0x2B
	ds   1
	global	menu_update_edit_value@val_len_1071
menu_update_edit_value@val_len_1071:	; 1 bytes @ 0x2C
	ds   1
	global	menu_update_edit_value@j
menu_update_edit_value@j:	; 1 bytes @ 0x2D
	global	menu_draw_setup@type_len
menu_draw_setup@type_len:	; 1 bytes @ 0x2D
	global	sprintf@val
sprintf@val:	; 2 bytes @ 0x2D
	ds   1
	global	menu_update_edit_value@j_1069
menu_update_edit_value@j_1069:	; 1 bytes @ 0x2E
	global	menu_draw_setup@type_text
menu_draw_setup@type_text:	; 2 bytes @ 0x2E
	ds   1
	global	menu_update_edit_value@screen_line
menu_update_edit_value@screen_line:	; 1 bytes @ 0x2F
	global	sprintf@len
sprintf@len:	; 2 bytes @ 0x2F
	ds   1
	global	menu_update_edit_value@flag_value
menu_update_edit_value@flag_value:	; 1 bytes @ 0x30
	global	menu_draw_setup@sensor_type
menu_draw_setup@sensor_type:	; 1 bytes @ 0x30
	ds   1
	global	menu_draw_setup@item_idx
menu_draw_setup@item_idx:	; 1 bytes @ 0x31
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x31
	global	menu_update_edit_value@opts
menu_update_edit_value@opts:	; 2 bytes @ 0x31
	ds   1
	global	menu_draw_setup@i
menu_draw_setup@i:	; 1 bytes @ 0x32
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x32
	ds   1
	global	menu_update_edit_value@item_idx
menu_update_edit_value@item_idx:	; 1 bytes @ 0x33
	global	sprintf@width
sprintf@width:	; 2 bytes @ 0x33
	ds   2
?_menu_handle_encoder:	; 1 bytes @ 0x35
??_menu_draw_input:	; 1 bytes @ 0x35
??_rebuild_input_menu:	; 1 bytes @ 0x35
	global	menu_handle_encoder@delta
menu_handle_encoder@delta:	; 2 bytes @ 0x35
	ds   2
??_menu_handle_encoder:	; 1 bytes @ 0x37
	ds   3
??_menu_handle_button:	; 1 bytes @ 0x3A
	ds   5
??_main:	; 1 bytes @ 0x3F
	ds   2
;!
;!Data Sizes:
;!    Strings     874
;!    Constant    772
;!    Data        248
;!    BSS         642
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126     65     111
;!    BANK0           128    103     121
;!    BANK1           256     12     186
;!    BANK2           256     76     216
;!    BANK3           256      0     128
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
;!		 -> input_config(BIGRAM[384]), system_config(BANK3[128]), 
;!
;!    eeprom_read_block@data	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK3[128]), 
;!
;!    eeprom_read_block@ptr	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK3[128]), 
;!
;!    eeprom_write_block@data	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK3[128]), 
;!
;!    eeprom_write_block@ptr	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK3[128]), 
;!
;!    flow_analog_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_31(CODE[7]), STR_32(CODE[7]), STR_33(CODE[10]), STR_34(CODE[11]), 
;!		 -> STR_35(CODE[12]), STR_36(CODE[9]), STR_37(CODE[13]), STR_38(CODE[6]), 
;!		 -> STR_39(CODE[6]), STR_40(CODE[9]), STR_41(CODE[8]), STR_42(CODE[8]), 
;!		 -> STR_43(CODE[8]), STR_44(CODE[5]), STR_45(CODE[7]), STR_46(CODE[7]), 
;!		 -> STR_47(CODE[10]), STR_48(CODE[11]), STR_49(CODE[10]), STR_50(CODE[9]), 
;!		 -> STR_51(CODE[9]), STR_52(CODE[8]), STR_53(CODE[5]), STR_54(CODE[7]), 
;!		 -> STR_55(CODE[7]), STR_56(CODE[5]), STR_57(CODE[8]), STR_58(CODE[11]), 
;!		 -> STR_59(CODE[8]), STR_60(CODE[8]), STR_61(CODE[5]), STR_62(CODE[7]), 
;!		 -> STR_63(CODE[7]), STR_64(CODE[5]), STR_65(CODE[6]), STR_66(CODE[10]), 
;!		 -> STR_67(CODE[11]), STR_68(CODE[9]), STR_69(CODE[12]), STR_70(CODE[8]), 
;!		 -> STR_71(CODE[8]), STR_72(CODE[5]), 
;!
;!    flow_analog_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK2[10]), 
;!		 -> value_high_tbp(BANK2[10]), value_high_temp(BANK2[10]), value_highbp(BANK1[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), 
;!		 -> value_scale20(COMRAM[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    flow_digital_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_31(CODE[7]), STR_32(CODE[7]), STR_33(CODE[10]), STR_34(CODE[11]), 
;!		 -> STR_35(CODE[12]), STR_36(CODE[9]), STR_37(CODE[13]), STR_38(CODE[6]), 
;!		 -> STR_39(CODE[6]), STR_40(CODE[9]), STR_41(CODE[8]), STR_42(CODE[8]), 
;!		 -> STR_43(CODE[8]), STR_44(CODE[5]), STR_45(CODE[7]), STR_46(CODE[7]), 
;!		 -> STR_47(CODE[10]), STR_48(CODE[11]), STR_49(CODE[10]), STR_50(CODE[9]), 
;!		 -> STR_51(CODE[9]), STR_52(CODE[8]), STR_53(CODE[5]), STR_54(CODE[7]), 
;!		 -> STR_55(CODE[7]), STR_56(CODE[5]), STR_57(CODE[8]), STR_58(CODE[11]), 
;!		 -> STR_59(CODE[8]), STR_60(CODE[8]), STR_61(CODE[5]), STR_62(CODE[7]), 
;!		 -> STR_63(CODE[7]), STR_64(CODE[5]), STR_65(CODE[6]), STR_66(CODE[10]), 
;!		 -> STR_67(CODE[11]), STR_68(CODE[9]), STR_69(CODE[12]), STR_70(CODE[8]), 
;!		 -> STR_71(CODE[8]), STR_72(CODE[5]), 
;!
;!    flow_digital_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK2[10]), 
;!		 -> value_high_tbp(BANK2[10]), value_high_temp(BANK2[10]), value_highbp(BANK1[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), 
;!		 -> value_scale20(COMRAM[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    input_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_31(CODE[7]), STR_32(CODE[7]), STR_33(CODE[10]), STR_34(CODE[11]), 
;!		 -> STR_35(CODE[12]), STR_36(CODE[9]), STR_37(CODE[13]), STR_38(CODE[6]), 
;!		 -> STR_39(CODE[6]), STR_40(CODE[9]), STR_41(CODE[8]), STR_42(CODE[8]), 
;!		 -> STR_43(CODE[8]), STR_44(CODE[5]), STR_45(CODE[7]), STR_46(CODE[7]), 
;!		 -> STR_47(CODE[10]), STR_48(CODE[11]), STR_49(CODE[10]), STR_50(CODE[9]), 
;!		 -> STR_51(CODE[9]), STR_52(CODE[8]), STR_53(CODE[5]), STR_54(CODE[7]), 
;!		 -> STR_55(CODE[7]), STR_56(CODE[5]), STR_57(CODE[8]), STR_58(CODE[11]), 
;!		 -> STR_59(CODE[8]), STR_60(CODE[8]), STR_61(CODE[5]), STR_62(CODE[7]), 
;!		 -> STR_63(CODE[7]), STR_64(CODE[5]), STR_65(CODE[6]), STR_66(CODE[10]), 
;!		 -> STR_67(CODE[11]), STR_68(CODE[9]), STR_69(CODE[12]), STR_70(CODE[8]), 
;!		 -> STR_71(CODE[8]), STR_72(CODE[5]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK2[10]), 
;!		 -> value_high_tbp(BANK2[10]), value_high_temp(BANK2[10]), value_highbp(BANK1[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), 
;!		 -> value_scale20(COMRAM[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    lcd_print@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@value_buf(COMRAM[15]), menu_update_numeric_value@value_buf(COMRAM[5]), 
;!		 -> STR_105(CODE[7]), STR_106(CODE[2]), STR_107(CODE[2]), STR_108(CODE[8]), 
;!		 -> STR_109(CODE[2]), STR_110(CODE[2]), STR_117(CODE[2]), STR_118(CODE[2]), 
;!		 -> STR_119(CODE[2]), STR_120(CODE[2]), STR_123(CODE[11]), STR_124(CODE[2]), 
;!		 -> STR_125(CODE[2]), STR_129(CODE[6]), STR_130(CODE[8]), STR_131(CODE[8]), 
;!		 -> STR_132(CODE[8]), STR_133(CODE[6]), STR_134(CODE[5]), STR_135(CODE[9]), 
;!		 -> STR_136(CODE[5]), STR_137(CODE[5]), STR_138(CODE[2]), STR_139(CODE[2]), 
;!		 -> STR_14(CODE[12]), STR_15(CODE[8]), STR_26(CODE[10]), STR_27(CODE[11]), 
;!		 -> STR_28(CODE[13]), STR_29(CODE[6]), STR_3(CODE[13]), STR_30(CODE[5]), 
;!		 -> STR_31(CODE[7]), STR_32(CODE[7]), STR_33(CODE[10]), STR_34(CODE[11]), 
;!		 -> STR_35(CODE[12]), STR_36(CODE[9]), STR_37(CODE[13]), STR_38(CODE[6]), 
;!		 -> STR_39(CODE[6]), STR_4(CODE[16]), STR_40(CODE[9]), STR_41(CODE[8]), 
;!		 -> STR_42(CODE[8]), STR_43(CODE[8]), STR_44(CODE[5]), STR_45(CODE[7]), 
;!		 -> STR_46(CODE[7]), STR_47(CODE[10]), STR_48(CODE[11]), STR_49(CODE[10]), 
;!		 -> STR_50(CODE[9]), STR_51(CODE[9]), STR_52(CODE[8]), STR_53(CODE[5]), 
;!		 -> STR_54(CODE[7]), STR_55(CODE[7]), STR_56(CODE[5]), STR_57(CODE[8]), 
;!		 -> STR_58(CODE[11]), STR_59(CODE[8]), STR_60(CODE[8]), STR_61(CODE[5]), 
;!		 -> STR_62(CODE[7]), STR_63(CODE[7]), STR_64(CODE[5]), STR_65(CODE[6]), 
;!		 -> STR_66(CODE[10]), STR_67(CODE[11]), STR_68(CODE[9]), STR_69(CODE[12]), 
;!		 -> STR_70(CODE[8]), STR_71(CODE[8]), STR_72(CODE[5]), STR_73(CODE[21]), 
;!
;!    lcd_print_at@str	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), STR_108(CODE[8]), STR_109(CODE[2]), 
;!		 -> STR_129(CODE[6]), STR_130(CODE[8]), STR_131(CODE[8]), STR_132(CODE[8]), 
;!		 -> STR_133(CODE[6]), STR_134(CODE[5]), STR_135(CODE[9]), STR_136(CODE[5]), 
;!		 -> STR_137(CODE[5]), STR_138(CODE[2]), STR_26(CODE[10]), STR_27(CODE[11]), 
;!		 -> STR_28(CODE[13]), STR_29(CODE[6]), STR_30(CODE[5]), STR_31(CODE[7]), 
;!		 -> STR_32(CODE[7]), STR_33(CODE[10]), STR_34(CODE[11]), STR_35(CODE[12]), 
;!		 -> STR_36(CODE[9]), STR_37(CODE[13]), STR_38(CODE[6]), STR_39(CODE[6]), 
;!		 -> STR_40(CODE[9]), STR_41(CODE[8]), STR_42(CODE[8]), STR_43(CODE[8]), 
;!		 -> STR_44(CODE[5]), STR_45(CODE[7]), STR_46(CODE[7]), STR_47(CODE[10]), 
;!		 -> STR_48(CODE[11]), STR_49(CODE[10]), STR_50(CODE[9]), STR_51(CODE[9]), 
;!		 -> STR_52(CODE[8]), STR_53(CODE[5]), STR_54(CODE[7]), STR_55(CODE[7]), 
;!		 -> STR_56(CODE[5]), STR_57(CODE[8]), STR_58(CODE[11]), STR_59(CODE[8]), 
;!		 -> STR_60(CODE[8]), STR_61(CODE[5]), STR_62(CODE[7]), STR_63(CODE[7]), 
;!		 -> STR_64(CODE[5]), STR_65(CODE[6]), STR_66(CODE[10]), STR_67(CODE[11]), 
;!		 -> STR_68(CODE[9]), STR_69(CODE[12]), STR_70(CODE[8]), STR_71(CODE[8]), 
;!		 -> STR_72(CODE[5]), 
;!
;!    memcpy@d	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), input_menu(BANK1[75]), system_config(BANK3[128]), 
;!
;!    memcpy@d1	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), input_menu(BANK1[75]), system_config(BANK3[128]), 
;!
;!    memcpy@s	PTR const unsigned char  size(2) Largest target is 384
;!		 -> factory_defaults(CODE[384]), pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    memcpy@s1	PTR const void  size(2) Largest target is 384
;!		 -> factory_defaults(CODE[384]), pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    menu_draw_input$1049	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_117(CODE[2]), STR_118(CODE[2]), 
;!
;!    menu_draw_input$1053	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_119(CODE[2]), STR_120(CODE[2]), 
;!
;!    menu_draw_input@opts	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_16(CODE[9]), STR_17(CODE[8]), STR_18(CODE[1]), STR_19(CODE[1]), 
;!		 -> STR_20(CODE[1]), STR_21(CODE[9]), STR_22(CODE[5]), STR_23(CODE[5]), 
;!		 -> STR_24(CODE[1]), STR_25(CODE[1]), 
;!
;!    menu_draw_input@opts_1031	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts_1031$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_16(CODE[9]), STR_17(CODE[8]), STR_18(CODE[1]), STR_19(CODE[1]), 
;!		 -> STR_20(CODE[1]), STR_21(CODE[9]), STR_22(CODE[5]), STR_23(CODE[5]), 
;!		 -> STR_24(CODE[1]), STR_25(CODE[1]), 
;!
;!    menu_draw_setup@F2589	PTR const unsigned char [5] size(2) Largest target is 8
;!		 -> STR_130(CODE[8]), STR_131(CODE[8]), STR_132(CODE[8]), STR_133(CODE[6]), 
;!		 -> STR_134(CODE[5]), 
;!
;!    menu_draw_setup@F2591	PTR const unsigned char [3] size(2) Largest target is 9
;!		 -> STR_135(CODE[9]), STR_136(CODE[5]), STR_137(CODE[5]), 
;!
;!    menu_draw_setup@sensor_type_names	PTR const unsigned char [3] size(2) Largest target is 9
;!		 -> STR_135(CODE[9]), STR_136(CODE[5]), STR_137(CODE[5]), 
;!
;!    menu_draw_setup@setup_items	PTR const unsigned char [5] size(2) Largest target is 8
;!		 -> STR_130(CODE[8]), STR_131(CODE[8]), STR_132(CODE[8]), STR_133(CODE[6]), 
;!		 -> STR_134(CODE[5]), 
;!
;!    menu_draw_setup@type_text	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_135(CODE[9]), STR_136(CODE[5]), STR_137(CODE[5]), 
;!
;!    menu_handle_button@edit_flag	PTR unsigned char  size(1) Largest target is 1
;!		 -> enable_edit_flag(BANK0[1]), sensor_edit_flag(BANK0[1]), 
;!
;!    menu_handle_button@edit_flag_1106	PTR unsigned char  size(1) Largest target is 1
;!		 -> enable_edit_flag(BANK0[1]), sensor_edit_flag(BANK0[1]), 
;!
;!    menu_handle_button@opts	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_16(CODE[9]), STR_17(CODE[8]), STR_18(CODE[1]), STR_19(CODE[1]), 
;!		 -> STR_20(CODE[1]), STR_21(CODE[9]), STR_22(CODE[5]), STR_23(CODE[5]), 
;!		 -> STR_24(CODE[1]), STR_25(CODE[1]), 
;!
;!    menu_handle_button@opts_1102	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1102$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_16(CODE[9]), STR_17(CODE[8]), STR_18(CODE[1]), STR_19(CODE[1]), 
;!		 -> STR_20(CODE[1]), STR_21(CODE[9]), STR_22(CODE[5]), STR_23(CODE[5]), 
;!		 -> STR_24(CODE[1]), STR_25(CODE[1]), 
;!
;!    menu_handle_encoder@edit_flag	PTR unsigned char  size(1) Largest target is 1
;!		 -> enable_edit_flag(BANK0[1]), sensor_edit_flag(BANK0[1]), 
;!
;!    menu_handle_encoder@opts	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_16(CODE[9]), STR_17(CODE[8]), STR_18(CODE[1]), STR_19(CODE[1]), 
;!		 -> STR_20(CODE[1]), STR_21(CODE[9]), STR_22(CODE[5]), STR_23(CODE[5]), 
;!		 -> STR_24(CODE[1]), STR_25(CODE[1]), 
;!
;!    menu_item_options$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_16(CODE[9]), STR_17(CODE[8]), STR_18(CODE[1]), STR_19(CODE[1]), 
;!		 -> STR_20(CODE[1]), STR_21(CODE[9]), STR_22(CODE[5]), STR_23(CODE[5]), 
;!		 -> STR_24(CODE[1]), STR_25(CODE[1]), 
;!
;!    menu_update_edit_value@opts	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_update_edit_value@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_16(CODE[9]), STR_17(CODE[8]), STR_18(CODE[1]), STR_19(CODE[1]), 
;!		 -> STR_20(CODE[1]), STR_21(CODE[9]), STR_22(CODE[5]), STR_23(CODE[5]), 
;!		 -> STR_24(CODE[1]), STR_25(CODE[1]), 
;!
;!    options_menu	PTR const unsigned char [5] size(2) Largest target is 13
;!		 -> STR_26(CODE[10]), STR_27(CODE[11]), STR_28(CODE[13]), STR_29(CODE[6]), 
;!		 -> STR_30(CODE[5]), 
;!
;!    pressure_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_31(CODE[7]), STR_32(CODE[7]), STR_33(CODE[10]), STR_34(CODE[11]), 
;!		 -> STR_35(CODE[12]), STR_36(CODE[9]), STR_37(CODE[13]), STR_38(CODE[6]), 
;!		 -> STR_39(CODE[6]), STR_40(CODE[9]), STR_41(CODE[8]), STR_42(CODE[8]), 
;!		 -> STR_43(CODE[8]), STR_44(CODE[5]), STR_45(CODE[7]), STR_46(CODE[7]), 
;!		 -> STR_47(CODE[10]), STR_48(CODE[11]), STR_49(CODE[10]), STR_50(CODE[9]), 
;!		 -> STR_51(CODE[9]), STR_52(CODE[8]), STR_53(CODE[5]), STR_54(CODE[7]), 
;!		 -> STR_55(CODE[7]), STR_56(CODE[5]), STR_57(CODE[8]), STR_58(CODE[11]), 
;!		 -> STR_59(CODE[8]), STR_60(CODE[8]), STR_61(CODE[5]), STR_62(CODE[7]), 
;!		 -> STR_63(CODE[7]), STR_64(CODE[5]), STR_65(CODE[6]), STR_66(CODE[10]), 
;!		 -> STR_67(CODE[11]), STR_68(CODE[9]), STR_69(CODE[12]), STR_70(CODE[8]), 
;!		 -> STR_71(CODE[8]), STR_72(CODE[5]), 
;!
;!    pressure_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK2[10]), 
;!		 -> value_high_tbp(BANK2[10]), value_high_temp(BANK2[10]), value_highbp(BANK1[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), 
;!		 -> value_scale20(COMRAM[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    rebuild_input_menu$936	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_75(CODE[8]), STR_76(CODE[9]), 
;!
;!    rebuild_input_menu$950	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_85(CODE[6]), STR_86(CODE[6]), STR_87(CODE[9]), 
;!
;!    rebuild_input_menu$951	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_86(CODE[6]), STR_87(CODE[9]), 
;!
;!    rebuild_input_menu$957	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_88(CODE[6]), STR_89(CODE[6]), STR_90(CODE[9]), 
;!
;!    rebuild_input_menu$958	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_89(CODE[6]), STR_90(CODE[9]), 
;!
;!    rebuild_input_menu$964	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_91(CODE[6]), STR_92(CODE[6]), STR_93(CODE[9]), 
;!
;!    rebuild_input_menu$965	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_92(CODE[6]), STR_93(CODE[9]), 
;!
;!    rebuild_input_menu$969	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_94(CODE[5]), STR_95(CODE[5]), 
;!
;!    S708$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_16(CODE[9]), STR_17(CODE[8]), STR_18(CODE[1]), STR_19(CODE[1]), 
;!		 -> STR_20(CODE[1]), STR_21(CODE[9]), STR_22(CODE[5]), STR_23(CODE[5]), 
;!		 -> STR_24(CODE[1]), STR_25(CODE[1]), 
;!
;!    S712$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_31(CODE[7]), STR_32(CODE[7]), STR_33(CODE[10]), STR_34(CODE[11]), 
;!		 -> STR_35(CODE[12]), STR_36(CODE[9]), STR_37(CODE[13]), STR_38(CODE[6]), 
;!		 -> STR_39(CODE[6]), STR_40(CODE[9]), STR_41(CODE[8]), STR_42(CODE[8]), 
;!		 -> STR_43(CODE[8]), STR_44(CODE[5]), STR_45(CODE[7]), STR_46(CODE[7]), 
;!		 -> STR_47(CODE[10]), STR_48(CODE[11]), STR_49(CODE[10]), STR_50(CODE[9]), 
;!		 -> STR_51(CODE[9]), STR_52(CODE[8]), STR_53(CODE[5]), STR_54(CODE[7]), 
;!		 -> STR_55(CODE[7]), STR_56(CODE[5]), STR_57(CODE[8]), STR_58(CODE[11]), 
;!		 -> STR_59(CODE[8]), STR_60(CODE[8]), STR_61(CODE[5]), STR_62(CODE[7]), 
;!		 -> STR_63(CODE[7]), STR_64(CODE[5]), STR_65(CODE[6]), STR_66(CODE[10]), 
;!		 -> STR_67(CODE[11]), STR_68(CODE[9]), STR_69(CODE[12]), STR_70(CODE[8]), 
;!		 -> STR_71(CODE[8]), STR_72(CODE[5]), 
;!
;!    S712$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK2[10]), 
;!		 -> value_high_tbp(BANK2[10]), value_high_temp(BANK2[10]), value_highbp(BANK1[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), 
;!		 -> value_scale20(COMRAM[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    sp__get_item_options	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    sp__memcpy	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), input_menu(BANK1[75]), system_config(BANK3[128]), 
;!
;!    sp__strcpy	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@value_buf(COMRAM[15]), original_value(BANK2[10]), value_back(BANK0[5]), 
;!		 -> value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK2[10]), 
;!		 -> value_high_temp(BANK2[10]), value_highbp(BANK1[10]), value_low_pressure(BANK2[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(COMRAM[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), NULL(NULL[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 13
;!		 -> ?_sprintf(COMRAM[2]), STR_140(CODE[7]), STR_31(CODE[7]), STR_32(CODE[7]), 
;!		 -> STR_33(CODE[10]), STR_34(CODE[11]), STR_35(CODE[12]), STR_36(CODE[9]), 
;!		 -> STR_37(CODE[13]), STR_38(CODE[6]), STR_39(CODE[6]), STR_40(CODE[9]), 
;!		 -> STR_41(CODE[8]), STR_42(CODE[8]), STR_43(CODE[8]), STR_44(CODE[5]), 
;!		 -> STR_45(CODE[7]), STR_46(CODE[7]), STR_47(CODE[10]), STR_48(CODE[11]), 
;!		 -> STR_49(CODE[10]), STR_50(CODE[9]), STR_51(CODE[9]), STR_52(CODE[8]), 
;!		 -> STR_53(CODE[5]), STR_54(CODE[7]), STR_55(CODE[7]), STR_56(CODE[5]), 
;!		 -> STR_57(CODE[8]), STR_58(CODE[11]), STR_59(CODE[8]), STR_60(CODE[8]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[7]), STR_63(CODE[7]), STR_64(CODE[5]), 
;!		 -> STR_65(CODE[6]), STR_66(CODE[10]), STR_67(CODE[11]), STR_68(CODE[9]), 
;!		 -> STR_69(CODE[12]), STR_70(CODE[8]), STR_71(CODE[8]), STR_72(CODE[5]), 
;!		 -> STR_75(CODE[8]), STR_76(CODE[9]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 28
;!		 -> STR_100(CODE[6]), STR_101(CODE[6]), STR_102(CODE[3]), STR_103(CODE[10]), 
;!		 -> STR_11(CODE[23]), STR_111(CODE[9]), STR_112(CODE[19]), STR_12(CODE[17]), 
;!		 -> STR_126(CODE[28]), STR_127(CODE[6]), STR_128(CODE[6]), STR_74(CODE[3]), 
;!		 -> STR_78(CODE[6]), STR_79(CODE[6]), STR_80(CODE[3]), STR_81(CODE[10]), 
;!		 -> STR_82(CODE[3]), STR_83(CODE[10]), STR_84(CODE[10]), STR_96(CODE[23]), 
;!		 -> STR_98(CODE[12]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 50
;!		 -> main@buf(BANK2[40]), main@buf_522(BANK2[30]), menu_draw_input@buf(BANK0[50]), menu_draw_input@title(BANK0[10]), 
;!		 -> menu_handle_encoder@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[30]), rebuild_input_menu@buf_977(BANK0[50]), value_back(BANK0[5]), 
;!		 -> value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK2[10]), 
;!		 -> value_high_temp(BANK2[10]), value_highbp(BANK1[10]), value_low_pressure(BANK2[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(COMRAM[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), NULL(NULL[0]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK2[10]), 
;!		 -> value_high_tbp(BANK2[10]), value_high_temp(BANK2[10]), value_highbp(BANK1[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), 
;!		 -> value_scale20(COMRAM[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_115(CODE[1]), STR_16(CODE[9]), STR_17(CODE[8]), STR_18(CODE[1]), 
;!		 -> STR_19(CODE[1]), STR_20(CODE[1]), STR_21(CODE[9]), STR_22(CODE[5]), 
;!		 -> STR_23(CODE[5]), STR_24(CODE[1]), STR_25(CODE[1]), 
;!
;!    strcpy@cp	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@value_buf(COMRAM[15]), original_value(BANK2[10]), value_back(BANK0[5]), 
;!		 -> value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK2[10]), 
;!		 -> value_high_temp(BANK2[10]), value_highbp(BANK1[10]), value_low_pressure(BANK2[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(COMRAM[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), NULL(NULL[0]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 12
;!		 -> STR_113(CODE[6]), STR_114(CODE[6]), STR_121(CODE[6]), STR_122(CODE[6]), 
;!		 -> STR_16(CODE[9]), STR_17(CODE[8]), STR_18(CODE[1]), STR_19(CODE[1]), 
;!		 -> STR_20(CODE[1]), STR_21(CODE[9]), STR_22(CODE[5]), STR_23(CODE[5]), 
;!		 -> STR_24(CODE[1]), STR_25(CODE[1]), STR_77(CODE[9]), STR_85(CODE[6]), 
;!		 -> STR_86(CODE[6]), STR_87(CODE[9]), STR_88(CODE[6]), STR_89(CODE[6]), 
;!		 -> STR_90(CODE[9]), STR_91(CODE[6]), STR_92(CODE[6]), STR_93(CODE[9]), 
;!		 -> STR_94(CODE[5]), STR_95(CODE[5]), STR_99(CODE[5]), value_back(BANK0[5]), 
;!		 -> value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK2[10]), 
;!		 -> value_high_temp(BANK2[10]), value_highbp(BANK1[10]), value_low_pressure(BANK2[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(COMRAM[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), NULL(NULL[0]), 
;!
;!    strcpy@to	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@value_buf(COMRAM[15]), original_value(BANK2[10]), value_back(BANK0[5]), 
;!		 -> value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK2[10]), 
;!		 -> value_high_temp(BANK2[10]), value_highbp(BANK1[10]), value_low_pressure(BANK2[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(COMRAM[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), NULL(NULL[0]), 
;!
;!    strlen@cp	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@value_buf(COMRAM[15]), STR_135(CODE[9]), STR_136(CODE[5]), 
;!		 -> STR_137(CODE[5]), STR_16(CODE[9]), STR_17(CODE[8]), STR_18(CODE[1]), 
;!		 -> STR_19(CODE[1]), STR_20(CODE[1]), STR_21(CODE[9]), STR_22(CODE[5]), 
;!		 -> STR_23(CODE[5]), STR_24(CODE[1]), STR_25(CODE[1]), value_back(BANK0[5]), 
;!		 -> value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK2[10]), 
;!		 -> value_high_temp(BANK2[10]), value_highbp(BANK1[10]), value_low_pressure(BANK2[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(COMRAM[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), NULL(NULL[0]), 
;!
;!    strlen@s	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@value_buf(COMRAM[15]), STR_135(CODE[9]), STR_136(CODE[5]), 
;!		 -> STR_137(CODE[5]), STR_16(CODE[9]), STR_17(CODE[8]), STR_18(CODE[1]), 
;!		 -> STR_19(CODE[1]), STR_20(CODE[1]), STR_21(CODE[9]), STR_22(CODE[5]), 
;!		 -> STR_23(CODE[5]), STR_24(CODE[1]), STR_25(CODE[1]), value_back(BANK0[5]), 
;!		 -> value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK2[10]), 
;!		 -> value_high_temp(BANK2[10]), value_highbp(BANK1[10]), value_low_pressure(BANK2[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(COMRAM[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), NULL(NULL[0]), 
;!
;!    temp_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_31(CODE[7]), STR_32(CODE[7]), STR_33(CODE[10]), STR_34(CODE[11]), 
;!		 -> STR_35(CODE[12]), STR_36(CODE[9]), STR_37(CODE[13]), STR_38(CODE[6]), 
;!		 -> STR_39(CODE[6]), STR_40(CODE[9]), STR_41(CODE[8]), STR_42(CODE[8]), 
;!		 -> STR_43(CODE[8]), STR_44(CODE[5]), STR_45(CODE[7]), STR_46(CODE[7]), 
;!		 -> STR_47(CODE[10]), STR_48(CODE[11]), STR_49(CODE[10]), STR_50(CODE[9]), 
;!		 -> STR_51(CODE[9]), STR_52(CODE[8]), STR_53(CODE[5]), STR_54(CODE[7]), 
;!		 -> STR_55(CODE[7]), STR_56(CODE[5]), STR_57(CODE[8]), STR_58(CODE[11]), 
;!		 -> STR_59(CODE[8]), STR_60(CODE[8]), STR_61(CODE[5]), STR_62(CODE[7]), 
;!		 -> STR_63(CODE[7]), STR_64(CODE[5]), STR_65(CODE[6]), STR_66(CODE[10]), 
;!		 -> STR_67(CODE[11]), STR_68(CODE[9]), STR_69(CODE[12]), STR_70(CODE[8]), 
;!		 -> STR_71(CODE[8]), STR_72(CODE[5]), 
;!
;!    temp_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK1[10]), value_enable(BANK1[10]), value_hi_pressure(BANK2[10]), 
;!		 -> value_high_tbp(BANK2[10]), value_high_temp(BANK2[10]), value_highbp(BANK1[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), 
;!		 -> value_scale20(COMRAM[10]), value_scale4(BANK0[10]), value_sensor(BANK1[12]), value_slpbp(BANK1[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 50
;!		 -> main@buf(BANK2[40]), main@buf_522(BANK2[30]), menu_draw_input@buf(BANK0[50]), menu_handle_encoder@buf(BANK0[50]), 
;!		 -> rebuild_input_menu@buf(BANK0[30]), rebuild_input_menu@buf_977(BANK0[50]), STR_1(CODE[28]), STR_10(CODE[19]), 
;!		 -> STR_104(CODE[33]), STR_116(CODE[41]), STR_13(CODE[33]), STR_2(CODE[23]), 
;!		 -> STR_5(CODE[22]), STR_6(CODE[19]), STR_7(CODE[24]), STR_8(CODE[22]), 
;!		 -> STR_9(CODE[22]), STR_97(CODE[26]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 50
;!		 -> main@buf(BANK2[40]), main@buf_522(BANK2[30]), menu_draw_input@buf(BANK0[50]), menu_handle_encoder@buf(BANK0[50]), 
;!		 -> rebuild_input_menu@buf(BANK0[30]), rebuild_input_menu@buf_977(BANK0[50]), STR_1(CODE[28]), STR_10(CODE[19]), 
;!		 -> STR_104(CODE[33]), STR_116(CODE[41]), STR_13(CODE[33]), STR_2(CODE[23]), 
;!		 -> STR_5(CODE[22]), STR_6(CODE[19]), STR_7(CODE[24]), STR_8(CODE[22]), 
;!		 -> STR_9(CODE[22]), STR_97(CODE[26]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_menu_handle_button
;!    _menu_update_numeric_value->_lcd_set_cursor
;!    _menu_update_edit_value->_lcd_set_cursor
;!    _menu_update_edit_value->_strcpy
;!    _menu_handle_encoder->_sprintf
;!    _menu_handle_button->_menu_draw_input
;!    _rebuild_input_menu->_sprintf
;!    _menu_draw_setup->_lcd_print_at
;!    _menu_draw_options->_lcd_print_at
;!    _menu_draw_input->_sprintf
;!    _uart_println->_uart_print
;!    _uart_print->_uart_write
;!    _sprintf->___lwmod
;!    _lcd_print_at->_lcd_set_cursor
;!    _lcd_clear_line->_lcd_set_cursor
;!    _lcd_set_cursor->_lcd_cmd
;!    _lcd_print->_lcd_data
;!    _lcd_data->_lcd_write_nibble
;!    _init_numeric_editor->___lwmod
;!    ___lwmod->___lwdiv
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
;!    _isr->i2___lwmod
;!
;!Critical Paths under _main in BANK0
;!
;!    _menu_handle_button->_rebuild_input_menu
;!
;!Critical Paths under _isr in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    _main->_menu_handle_button
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
;! (0) _main                                                78    78      0  211010
;!                                             63 COMRAM     2     2      0
;!                                              0 BANK2     76    76      0
;!                               _beep
;!                        _eeprom_init
;!                       _encoder_init
;!            _handle_numeric_rotation
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
;!          _menu_update_numeric_value
;!                            _sprintf
;!                        _system_init
;!                          _uart_init
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _system_init                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_numeric_value                           17    17      0    5892
;!                                             20 COMRAM    17    17      0
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_edit_value                              32    32      0    8954
;!                                             20 COMRAM    32    32      0
;!                   _get_item_options
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (1) _menu_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_encoder                                 60    58      2   13431
;!                                             53 COMRAM     7     5      2
;!                                              0 BANK0     53    53      0
;!                   _get_item_options
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                  17    17      0  101305
;!                                             58 COMRAM     5     5      0
;!                                              0 BANK1     12    12      0
;!                               _beep
;!          _get_current_numeric_value
;!                   _get_item_options
;!                _init_numeric_editor
;!                    _menu_draw_input
;!                  _menu_draw_options
;!                    _menu_draw_setup
;!                 _rebuild_input_menu
;!                _save_current_config
;!                            _sprintf
;!                             _strcmp
;!                             _strcpy
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_input_menu                                 104   104      0   22056
;!                                             53 COMRAM     1     1      0
;!                                              0 BANK0    103   103      0
;!                            ___lwdiv
;!                            ___lwmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_setup                                     27    27      0   12452
;!                                             24 COMRAM    27    27      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_options                                    6     6      0   11293
;!                                             24 COMRAM     6     6      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_input                                    103   103      0   32092
;!                                             53 COMRAM     5     5      0
;!                                              0 BANK0     98    98      0
;!                   _get_item_options
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;!                            _sprintf
;!                             _strcmp
;!                             _strcpy
;!                             _strlen
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    1868
;!                                             17 COMRAM     2     0      2
;!                         _uart_print
;!                         _uart_write
;! ---------------------------------------------------------------------------------
;! (2) _uart_print                                           2     0      2     186
;!                                             15 COMRAM     2     0      2
;!                         _uart_write
;! ---------------------------------------------------------------------------------
;! (2) _uart_write                                           1     1      0      31
;!                                             14 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (2) _strlen                                               4     2      2     760
;!                                             14 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (2) _strcpy                                               6     2      4    3349
;!                                             14 COMRAM     6     2      4
;! ---------------------------------------------------------------------------------
;! (2) _strcmp                                               7     3      4     493
;!                                             14 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (1) _sprintf                                             31    23      8   10642
;!                                             26 COMRAM    27    19      8
;!                            ___lwdiv
;!                            ___lwmod
;!                             ___wmul
;!                            _isdigit
;! ---------------------------------------------------------------------------------
;! (2) _isdigit                                              3     3      0      99
;!                                             14 COMRAM     3     3      0
;! ---------------------------------------------------------------------------------
;! (2) ___wmul                                               6     2      4    1622
;!                                             14 COMRAM     6     2      4
;! ---------------------------------------------------------------------------------
;! (3) _lcd_print_at                                         4     1      3    5380
;!                                             20 COMRAM     4     1      3
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_clear_line                                       1     1      0    3518
;!                                             20 COMRAM     1     1      0
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _lcd_set_cursor                                       3     2      1    1346
;!                                             17 COMRAM     3     2      1
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (2) _lcd_print                                            2     0      2    2141
;!                                             16 COMRAM     2     0      2
;!                           _lcd_data
;! ---------------------------------------------------------------------------------
;! (3) _lcd_data                                             1     1      0     186
;!                                             15 COMRAM     1     1      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (2) _get_item_options                                     4     2      2     161
;!                                             14 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (2) _init_numeric_editor                                  4     2      2    3565
;!                                             26 COMRAM     4     2      2
;!                            ___lwdiv
;!                            ___lwmod
;!                                _abs
;! ---------------------------------------------------------------------------------
;! (3) _abs                                                  4     2      2     183
;!                                             14 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (2) ___lwmod                                              5     1      4    1602
;!                                             21 COMRAM     5     1      4
;!                            ___lwdiv (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4    1501
;!                                             14 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (2) _get_current_numeric_value                           10     8      2      68
;!                                             14 COMRAM    10     8      2
;! ---------------------------------------------------------------------------------
;! (2) _beep                                                 5     3      2    1598
;!                                             14 COMRAM     5     3      2
;! ---------------------------------------------------------------------------------
;! (1) _lcd_init                                             2     2      0     372
;!                                             17 COMRAM     2     2      0
;!                            _lcd_cmd
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (1) _lcd_clear                                            1     1      0     248
;!                                             17 COMRAM     1     1      0
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (3) _lcd_cmd                                              2     2      0     248
;!                                             15 COMRAM     2     2      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (4) _lcd_write_nibble                                     1     1      0     124
;!                                             14 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _handle_numeric_rotation                              4     4      0     381
;!                                             14 COMRAM     4     4      0
;! ---------------------------------------------------------------------------------
;! (1) _encoder_init                                         2     2      0       0
;!                                             14 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _eeprom_init                                          5     5      0    6430
;!                                             30 COMRAM     5     5      0
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
;!                                             27 COMRAM     3     3      0
;!          _calculate_config_checksum
;!                 _eeprom_write_block
;!                  _eeprom_write_word
;! ---------------------------------------------------------------------------------
;! (3) _eeprom_write_word                                    4     0      4     943
;!                                             17 COMRAM     4     0      4
;!                  _eeprom_write_byte
;! ---------------------------------------------------------------------------------
;! (3) _eeprom_write_block                                  10     4      6    1402
;!                                             17 COMRAM    10     4      6
;!                  _eeprom_write_byte
;! ---------------------------------------------------------------------------------
;! (4) _eeprom_write_byte                                    3     0      3     636
;!                                             14 COMRAM     3     0      3
;! ---------------------------------------------------------------------------------
;! (3) _calculate_config_checksum                           12    10      2     405
;!                                             14 COMRAM    12    10      2
;! ---------------------------------------------------------------------------------
;! (2) _load_factory_defaults                                0     0      0    1288
;!                             _memcpy
;! ---------------------------------------------------------------------------------
;! (3) _memcpy                                              11     5      6    1288
;!                                             14 COMRAM    11     5      6
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_read_word                                     7     5      2     524
;!                                             16 COMRAM     7     5      2
;!                   _eeprom_read_byte
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_read_block                                   10     4      6    1101
;!                                             16 COMRAM    10     4      6
;!                   _eeprom_read_byte
;! ---------------------------------------------------------------------------------
;! (3) _eeprom_read_byte                                     2     0      2     335
;!                                             14 COMRAM     2     0      2
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (7) _isr                                                  9     9      0     390
;!                                              5 COMRAM     9     9      0
;!                          i2___lwmod
;! ---------------------------------------------------------------------------------
;! (8) i2___lwmod                                            5     1      4     211
;!                                              0 COMRAM     5     1      4
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 8
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
;!   _handle_numeric_rotation
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
;!     _uart_println
;!       _uart_print
;!         _uart_write
;!       _uart_write
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
;!     _get_current_numeric_value
;!     _get_item_options
;!     _init_numeric_editor
;!       ___lwdiv
;!       ___lwmod
;!       _abs
;!     _menu_draw_input
;!     _menu_draw_options
;!     _menu_draw_setup
;!     _rebuild_input_menu
;!       ___lwdiv
;!       ___lwmod
;!       _memcpy
;!       _sprintf
;!       _strcpy
;!       _uart_println
;!     _save_current_config
;!     _sprintf
;!     _strcmp
;!     _strcpy
;!   _menu_handle_encoder
;!     _get_item_options
;!     _sprintf
;!     _uart_println
;!   _menu_init
;!   _menu_update_edit_value
;!     _get_item_options
;!     _lcd_print
;!     _lcd_set_cursor
;!     _strcpy
;!     _strlen
;!   _menu_update_numeric_value
;!     _lcd_print
;!     _lcd_set_cursor
;!     _uart_println
;!   _sprintf
;!   _system_init
;!   _uart_init
;!   _uart_println
;!
;! _isr (ROOT)
;!   i2___lwmod
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BIGRAM             F7F      0     180      48        9.7%
;!EEDATA             400      0       0       0        0.0%
;!BITBANK14          100      0       0      32        0.0%
;!BANK14             100      0       0      33        0.0%
;!BITBANK13          100      0       0      30        0.0%
;!BANK13             100      0       0      31        0.0%
;!BITBANK12          100      0       0      28        0.0%
;!BANK12             100      0       0      29        0.0%
;!BITBANK11          100      0       0      26        0.0%
;!BANK11             100      0       0      27        0.0%
;!BITBANK10          100      0       0      24        0.0%
;!BANK10             100      0       0      25        0.0%
;!BITBANK9           100      0       0      22        0.0%
;!BANK9              100      0       0      23        0.0%
;!BITBANK8           100      0       0      20        0.0%
;!BANK8              100      0       0      21        0.0%
;!BITBANK7           100      0       0      18        0.0%
;!BANK7              100      0       0      19        0.0%
;!BITBANK6           100      0       0      16        0.0%
;!BANK6              100      0       0      17        0.0%
;!BITBANK5           100      0       0      14        0.0%
;!BANK5              100      0       0      15        0.0%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100      0       0      13        0.0%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100      0      80      11       50.0%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100     4C      D8       9       84.4%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100      C      BA       7       72.7%
;!BITBANK15           80      0       0      34        0.0%
;!BANK15              80      0       0      35        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80     67      79       5       94.5%
;!BITCOMRAM           7E      0       0       0        0.0%
;!COMRAM              7E     41      6F       1       88.1%
;!BITBIGSFRhhhhlh     1A      0       0      37        0.0%
;!BITBIGSFRhhhlh      11      0       0      39        0.0%
;!BITBIGSFRhhhhh       D      0       0      36        0.0%
;!BITBIGSFRhlhll       A      0       0      43        0.0%
;!BITBIGSFRhhhll       8      0       0      40        0.0%
;!BITBIGSFRhhlh        7      0       0      41        0.0%
;!BITBIGSFRlh          6      0       0      45        0.0%
;!BITBIGSFRhll         6      0       0      44        0.0%
;!BITBIGSFRll          6      0       0      46        0.0%
;!BITBIGSFRhhhhll      1      0       0      38        0.0%
;!BITBIGSFRhhll        1      0       0      42        0.0%
;!BIGSFR               0      0       0     200        0.0%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0     2FA      47        0.0%
;!DATA                 0      0     47A       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 235 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            30   40[BANK2 ] unsigned char [30]
;;  current_even    1   75[BANK2 ] unsigned char 
;;  buf            40    0[BANK2 ] unsigned char [40]
;;  delta           2   73[BANK2 ] int 
;;  last_encoder    2   71[BANK2 ] int 
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
;; Hardware stack levels required when called: 8
;; This function calls:
;;		_beep
;;		_eeprom_init
;;		_encoder_init
;;		_handle_numeric_rotation
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
;;		_menu_update_numeric_value
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
	line	235
global __ptext0
__ptext0:
psect	text0
	file	"src\main.c"
	line	235
	
_main:
;incstack = 0
	callstack 23
	line	238
	
l6700:
	call	_system_init	;wreg free
	line	239
	
l6702:
	call	_eeprom_init	;wreg free
	line	246
	
l6704:; BSR set to: 3

	movlw	high(03A98h)
	movwf	((c:_menu_timeout_reload+1))^00h,c	;volatile
	movlw	low(03A98h)
	movwf	((c:_menu_timeout_reload))^00h,c	;volatile
	line	250
	
l6706:; BSR set to: 3

	call	_uart_init	;wreg free
	line	251
	
l6708:; BSR set to: 3

	call	_encoder_init	;wreg free
	line	252
	
l6710:
	call	_menu_init	;wreg free
	line	253
	
l6712:; BSR set to: 1

	call	_lcd_init	;wreg free
	line	255
	
l6714:
		movlw	low(STR_1)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_1)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	256
	
l6716:
		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	258
	
l6718:
	call	_lcd_clear	;wreg free
	line	259
	
l6720:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	260
	
l6722:
		movlw	low(STR_3)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_3)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	261
	
l6724:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	262
	
l6726:
		movlw	low(STR_4)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_4)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	264
	
l6728:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	265
	
l6730:
		movlw	low(STR_6)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_6)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	266
	
l6732:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	268
	
l6734:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	269
	
l6736:
	asmopt push
asmopt off
movlw  5
movwf	(??_main+0+0+1)^00h,c
movlw	15
movwf	(??_main+0+0)^00h,c
	movlw	241
u7877:
decfsz	wreg,f
	bra	u7877
	decfsz	(??_main+0+0)^00h,c,f
	bra	u7877
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u7877
	nop
asmopt pop

	line	270
	
l6738:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	272
	
l6740:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	273
	
l6742:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	275
	
l6744:
	asmopt push
asmopt off
movlw  41
movwf	(??_main+0+0+1)^00h,c
movlw	150
movwf	(??_main+0+0)^00h,c
	movlw	127
u7887:
decfsz	wreg,f
	bra	u7887
	decfsz	(??_main+0+0)^00h,c,f
	bra	u7887
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u7887
	nop
asmopt pop

	line	279
	
l6746:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_current_menu))&0ffh
	line	280
	
l6748:; BSR set to: 1

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	282
	
l6750:; BSR set to: 1

	call	_menu_draw_options	;wreg free
	line	283
	
l6752:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	286
	
l6754:
	movlw	high(0)
	movlb	2	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	287
	
l6756:; BSR set to: 2

	movlw	low(0)
	movwf	((main@last_button))&0ffh
	line	294
	
l6758:
	movlb	2	; () banked
	movf	((main@last_encoder))&0ffh,w
	movlb	1	; () banked
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u7560
	movlb	2	; () banked
movf	((main@last_encoder+1))&0ffh,w
	movlb	1	; () banked
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u7561
	goto	u7560

u7561:
	goto	l6810
u7560:
	line	296
	
l6760:; BSR set to: 1

	movlb	2	; () banked
	movf	((main@last_encoder))&0ffh,w
	movlb	1	; () banked
	subwf	((_encoder_count))&0ffh,w	;volatile
	movlb	2	; () banked
	movwf	((main@delta))&0ffh
	movf	((main@last_encoder+1))&0ffh,w
	movlb	1	; () banked
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movlb	2	; () banked
	movwf	1+((main@delta))&0ffh
	line	299
	
l6762:; BSR set to: 2

	movlw	high(01h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	302
	
l6764:
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
	line	303
	
l6766:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	305
	
l6768:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	308
	
l6770:
	movlw	high(01F4h)
	movlb	1	; () banked
	movwf	((main@encoder_activity_timer+1))&0ffh
	movlw	low(01F4h)
	movwf	((main@encoder_activity_timer))&0ffh
	line	311
	
l6772:; BSR set to: 1

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u7571
	goto	u7570
u7571:
	goto	l174
u7570:
	line	313
	
l6774:; BSR set to: 1

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	314
	
l174:; BSR set to: 1

	line	318
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u7581
	goto	u7580
u7581:
	goto	l6784
u7580:
	
l6776:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7591
	goto	u7590

u7591:
	goto	l6784
u7590:
	
l6778:; BSR set to: 1

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u7601
	goto	u7600

u7601:
	goto	l6782
u7600:
	
l6780:; BSR set to: 1

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7611
	goto	u7610

u7611:
	goto	l6784
u7610:
	line	321
	
l6782:; BSR set to: 1

	movlb	2	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_numeric_rotation
	line	322
	goto	l6786
	line	326
	
l6784:; BSR set to: 1

	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	line	329
	
l6786:
	movlb	1	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u7621
	goto	u7620
u7621:
	goto	l6798
u7620:
	
l6788:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7631
	goto	u7630

u7631:
	goto	l6798
u7630:
	line	332
	
l6790:; BSR set to: 1

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u7641
	goto	u7640

u7641:
	goto	l6794
u7640:
	
l6792:; BSR set to: 1

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7651
	goto	u7650

u7651:
	goto	l6796
u7650:
	line	335
	
l6794:; BSR set to: 1

	call	_menu_update_numeric_value	;wreg free
	line	336
	goto	l6810
	line	340
	
l6796:; BSR set to: 1

	call	_menu_update_edit_value	;wreg free
	goto	l6810
	line	346
	
l6798:; BSR set to: 1

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7661
	goto	u7660
u7661:
	goto	l6802
u7660:
	line	348
	
l6800:; BSR set to: 1

	call	_menu_draw_options	;wreg free
	line	349
	goto	l6810
	line	350
	
l6802:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7671
	goto	u7670

u7671:
	goto	l6806
u7670:
	line	352
	
l6804:; BSR set to: 1

	call	_menu_draw_input	;wreg free
	line	353
	goto	l6810
	line	354
	
l6806:; BSR set to: 1

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7681
	goto	u7680

u7681:
	goto	l6810
u7680:
	line	356
	
l6808:; BSR set to: 1

	call	_menu_draw_setup	;wreg free
	line	362
	
l6810:
	movlb	2	; () banked
	movf	((main@last_button))&0ffh,w
	movlb	1	; () banked
xorwf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u7691
	goto	u7690

u7691:
	goto	l6846
u7690:
	line	365
	
l6812:; BSR set to: 1

	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u7701
	goto	u7700
u7701:
	goto	l6842
u7700:
	line	367
	
l6814:; BSR set to: 1

	movff	(_button_event),(main@current_event)	;volatile
	line	368
	
l6816:; BSR set to: 1

	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	371
	
l6818:; BSR set to: 1

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7711
	goto	u7710

u7711:
	goto	l6824
u7710:
	line	374
	
l6820:; BSR set to: 1

	movlb	2	; () banked
		decf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u7721
	goto	u7720

u7721:
	goto	l6824
u7720:
	line	376
	
l6822:; BSR set to: 2

	movlw	low(0)
	movlb	1	; () banked
	movwf	((_current_menu))&0ffh
	line	377
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	378
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	379
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	385
	
l6824:
		movlw	low(main@buf_522)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_522)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_12)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_12)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@current_event),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	386
	
l6826:
		movlw	low(main@buf_522)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_522)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	388
	
l6828:
	movlb	2	; () banked
	movf	((main@current_event))&0ffh,w
	
	call	_menu_handle_button
	line	391
	
l6830:
	movlb	1	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7731
	goto	u7730
u7731:
	goto	l6834
u7730:
	line	393
	
l6832:; BSR set to: 1

	call	_menu_draw_options	;wreg free
	line	394
	goto	l6842
	line	395
	
l6834:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7741
	goto	u7740

u7741:
	goto	l6838
u7740:
	line	397
	
l6836:; BSR set to: 1

	call	_menu_draw_input	;wreg free
	line	398
	goto	l6842
	line	399
	
l6838:; BSR set to: 1

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7751
	goto	u7750

u7751:
	goto	l195
u7750:
	line	401
	
l6840:; BSR set to: 1

	call	_menu_draw_setup	;wreg free
	goto	l6842
	line	403
	
l195:; BSR set to: 1

	line	404
	
l6842:
	movff	(_button_event),(main@last_button)	;volatile
	line	405
	
l6844:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	409
	
l6846:; BSR set to: 1

	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfsc	status,2
	goto	u7761
	goto	u7760

u7761:
	goto	l6850
u7760:
	line	411
	
l6848:; BSR set to: 1

	decf	((main@encoder_activity_timer))&0ffh
	btfss	status,0
	decf	((main@encoder_activity_timer+1))&0ffh
	line	415
	
l6850:; BSR set to: 1

	movlw	low(01h)
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	416
	
l6852:; BSR set to: 1

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	bnz	u7770
	movlw	16
	subwf	 ((main@blink_timer))&0ffh,w
	movlw	39
	subwfb	((main@blink_timer+1))&0ffh,w
	btfss	status,0
	goto	u7771
	goto	u7770

u7771:
	goto	l6872
u7770:
	line	418
	
l6854:; BSR set to: 1

	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	419
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u7781
	goto	u7780
u7781:
	goto	l6870
u7780:
	line	422
	
l6856:; BSR set to: 1

	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfss	status,2
	goto	u7791
	goto	u7790

u7791:
	goto	l6872
u7790:
	line	424
	
l6858:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u7801
	goto	u7800
u7801:
	movlw	1
	goto	u7810
u7800:
	movlw	0
u7810:
	movwf	(0+(_menu+05h))&0ffh
	line	428
	
l6860:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7821
	goto	u7820

u7821:
	goto	l6872
u7820:
	line	431
	
l6862:; BSR set to: 1

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u7831
	goto	u7830

u7831:
	goto	l6866
u7830:
	
l6864:; BSR set to: 1

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7841
	goto	u7840

u7841:
	goto	l6868
u7840:
	line	434
	
l6866:; BSR set to: 1

	call	_menu_update_numeric_value	;wreg free
	line	435
	goto	l6872
	line	439
	
l6868:; BSR set to: 1

	call	_menu_update_edit_value	;wreg free
	goto	l6872
	line	446
	
l6870:; BSR set to: 1

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	460
	
l6872:
		movlw	03h-0
	movlb	1	; () banked
	cpfslt	((_current_menu))&0ffh
	goto	u7851
	goto	u7850

u7851:
	goto	l6906
u7850:
	line	462
	
l6874:; BSR set to: 1

	movf	((_menu_timeout_flag))&0ffh,w	;volatile
	btfss	status,2
	goto	u7861
	goto	u7860
u7861:
	goto	l6906
u7860:
	line	464
	
l6876:; BSR set to: 1

		movlw	low(STR_13)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_13)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	467
	
l6878:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	468
	
l6880:
	asmopt push
asmopt off
movlw  3
movwf	(??_main+0+0+1)^00h,c
movlw	8
movwf	(??_main+0+0)^00h,c
	movlw	119
u7897:
decfsz	wreg,f
	bra	u7897
	decfsz	(??_main+0+0)^00h,c,f
	bra	u7897
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u7897
	nop
asmopt pop

	line	469
	
l6882:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	472
	
l6884:
	movlb	1	; () banked
	setf	((_current_menu))&0ffh
	line	473
	
l6886:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	474
	
l6888:; BSR set to: 1

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	475
	
l6890:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	478
	
l6892:; BSR set to: 1

	call	_lcd_clear	;wreg free
	line	479
	
l6894:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	480
	
l6896:
		movlw	low(STR_14)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_14)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	481
	
l6898:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	482
	
l6900:
		movlw	low(STR_15)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	485
	
l6902:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	486
	
l6904:; BSR set to: 1

	movlw	high(0)
	movwf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_menu_timeout_timer))^00h,c	;volatile
	line	500
	
l6906:; BSR set to: 1

	asmopt push
asmopt off
	movlw	133
u7907:
decfsz	wreg,f
	bra	u7907
	nop
asmopt pop

	goto	l6758
	global	start
	goto	start
	callstack 0
	line	502
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_uart_init

;; *************** function _uart_init *****************
;; Defined at:
;;		line 39 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 3F/3
;;		On exit  : 3F/3
;;		Unchanged: 3E/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	line	39
global __ptext1
__ptext1:
psect	text1
	file	"src\main.c"
	line	39
	
_uart_init:
;incstack = 0
	callstack 28
	line	41
	
l6126:; BSR set to: 3

	bcf	((c:3988))^0f00h,c,6	;volatile
	line	42
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	44
	
l6128:; BSR set to: 3

	movlw	low(024h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	45
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	46
	movlw	low(08h)
	movwf	((c:4024))^0f00h,c	;volatile
	line	48
	movlw	low(044h)
	movwf	((c:4015))^0f00h,c	;volatile
	line	49
	movlw	low(0)
	movwf	((c:4016))^0f00h,c	;volatile
	line	50
	
l89:; BSR set to: 3

	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
	signat	_uart_init,89
	global	_system_init

;; *************** function _system_init *****************
;; Defined at:
;;		line 75 in file "src\main.c"
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2,group=0
	line	75
global __ptext2
__ptext2:
psect	text2
	file	"src\main.c"
	line	75
	
_system_init:; BSR set to: 3

;incstack = 0
	callstack 28
	line	77
	
l6130:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	78
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	81
	
l107:
	line	80
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u6571
	goto	u6570
u6571:
	goto	l107
u6570:
	line	83
	
l6132:
	movlw	low(0Fh)
	movwf	((c:4033))^0f00h,c	;volatile
	line	85
	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	86
	movlw	low(0)
	movwf	((c:3978))^0f00h,c	;volatile
	line	87
	movlw	low(0)
	movwf	((c:3979))^0f00h,c	;volatile
	line	89
	
l6134:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	90
	
l6136:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	92
	
l6138:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	93
	
l6140:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	94
	
l6142:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	95
	
l6144:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	96
	
l110:
	return	;funcret
	callstack 0
GLOBAL	__end_of_system_init
	__end_of_system_init:
	signat	_system_init,89
	global	_menu_update_numeric_value

;; *************** function _menu_update_numeric_value *****************
;; Defined at:
;;		line 376 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  value_buf       5   20[COMRAM] unsigned char [5]
;;  screen_line     1   36[COMRAM] unsigned char 
;;  item_idx        1   35[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        17       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        17       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       17 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_lcd_print
;;		_lcd_set_cursor
;;		_uart_println
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	376
global __ptext3
__ptext3:
psect	text3
	file	"src\menu.c"
	line	376
	
_menu_update_numeric_value:
;incstack = 0
	callstack 25
	line	381
	
l6368:; BSR set to: 1

		movlw	low(STR_104)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_104)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	384
	
l6370:
	movlb	1	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u6991
	goto	u6990

u6991:
	goto	l492
u6990:
	
l6372:; BSR set to: 1

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u7001
	goto	u7000
u7001:
	goto	l6374
u7000:
	goto	l492
	line	388
	
l6374:; BSR set to: 1

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((c:menu_update_numeric_value@screen_line))^00h,c
	line	389
		movlw	03h-1
	cpfsgt	((c:menu_update_numeric_value@screen_line))^00h,c
	goto	u7011
	goto	u7010

u7011:
	goto	l493
u7010:
	goto	l492
	line	390
	
l493:; BSR set to: 1

	line	393
	movff	(_menu),(c:menu_update_numeric_value@item_idx)
	line	396
	
l6378:; BSR set to: 1

		movlw	2
	xorwf	((c:menu_update_numeric_value@item_idx))^00h,c,w
	btfsc	status,2
	goto	u7021
	goto	u7020

u7021:
	goto	l6384
u7020:
	
l6380:; BSR set to: 1

		movlw	3
	xorwf	((c:menu_update_numeric_value@item_idx))^00h,c,w
	btfsc	status,2
	goto	u7031
	goto	u7030

u7031:
	goto	l6384
u7030:
	goto	l492
	line	400
	
l6384:; BSR set to: 1

	lfsr	2,(menu_update_numeric_value@value_buf)
	movlw	5-1
u7041:
	clrf	postinc2
	decf	wreg
	bc	u7041
	line	403
	
l6386:; BSR set to: 1

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u7051
	goto	u7050
u7051:
	goto	l6390
u7050:
	
l6388:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u7061
	goto	u7060
u7061:
	goto	l6398
u7060:
	
l6390:; BSR set to: 1

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u7071
	goto	u7070
u7071:
	goto	l6394
u7070:
	
l6392:; BSR set to: 1

	movlw	high(02Bh)
	movwf	((c:_menu_update_numeric_value$1001+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_menu_update_numeric_value$1001))^00h,c
	goto	l6396
	
l6394:; BSR set to: 1

	movlw	high(02Dh)
	movwf	((c:_menu_update_numeric_value$1001+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_menu_update_numeric_value$1001))^00h,c
	
l6396:; BSR set to: 1

	movff	(c:_menu_update_numeric_value$1001),(c:_menu_update_numeric_value$1000)
	movff	(c:_menu_update_numeric_value$1001+1),(c:_menu_update_numeric_value$1000+1)
	goto	l6400
	
l6398:; BSR set to: 1

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1000+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1000))^00h,c
	
l6400:; BSR set to: 1

	movff	(c:_menu_update_numeric_value$1000),(c:menu_update_numeric_value@value_buf)
	line	404
	
l6402:; BSR set to: 1

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u7081
	goto	u7080

u7081:
	goto	l6406
u7080:
	
l6404:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u7091
	goto	u7090
u7091:
	goto	l6408
u7090:
	
l6406:; BSR set to: 1

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1002))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1002))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1002))^00h,c
	goto	l6410
	
l6408:; BSR set to: 1

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1002+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1002))^00h,c
	
l6410:; BSR set to: 1

	movff	(c:_menu_update_numeric_value$1002),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	405
	
l6412:; BSR set to: 1

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u7101
	goto	u7100

u7101:
	goto	l6416
u7100:
	
l6414:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u7111
	goto	u7110
u7111:
	goto	l6418
u7110:
	
l6416:; BSR set to: 1

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1003))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1003))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1003))^00h,c
	goto	l6420
	
l6418:; BSR set to: 1

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1003+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1003))^00h,c
	
l6420:; BSR set to: 1

	movff	(c:_menu_update_numeric_value$1003),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	406
	
l6422:; BSR set to: 1

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u7121
	goto	u7120

u7121:
	goto	l6426
u7120:
	
l6424:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u7131
	goto	u7130
u7131:
	goto	l6428
u7130:
	
l6426:; BSR set to: 1

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1004))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1004))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1004))^00h,c
	goto	l6430
	
l6428:; BSR set to: 1

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1004+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1004))^00h,c
	
l6430:; BSR set to: 1

	movff	(c:_menu_update_numeric_value$1004),0+((c:menu_update_numeric_value@value_buf)+03h)
	line	407
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+04h))^00h,c
	line	410
	
l6432:; BSR set to: 1

	movlw	low(0Eh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	411
	
l6434:
		movlw	low(STR_105)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_105)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	414
	
l6436:
	movlw	low(0Eh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	415
	
l6438:
		movlw	low(STR_106)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_106)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	416
	
l6440:
		movlw	low(menu_update_numeric_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	417
	
l6442:
		movlw	low(STR_107)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_107)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	418
	
l492:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_numeric_value
	__end_of_menu_update_numeric_value:
	signat	_menu_update_numeric_value,89
	global	_menu_update_edit_value

;; *************** function _menu_update_edit_value *****************
;; Defined at:
;;		line 582 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1   45[COMRAM] unsigned char 
;;  j               1   46[COMRAM] unsigned char 
;;  val_len         1   42[COMRAM] unsigned char 
;;  val_len         1   43[COMRAM] unsigned char 
;;  start_pos       1   39[COMRAM] unsigned char 
;;  flag_value      1   48[COMRAM] unsigned char 
;;  value_buf      15   24[COMRAM] unsigned char [15]
;;  opts            2   49[COMRAM] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  item_idx        1   51[COMRAM] unsigned char 
;;  screen_line     1   47[COMRAM] unsigned char 
;;  val_len         1   44[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        28       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        32       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       32 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
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
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	582
global __ptext4
__ptext4:
psect	text4
	file	"src\menu.c"
	line	582
	
_menu_update_edit_value:
;incstack = 0
	callstack 25
	line	585
	
l6444:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7141
	goto	u7140

u7141:
	goto	l592
u7140:
	
l6446:; BSR set to: 1

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u7151
	goto	u7150
u7151:
	goto	l6448
u7150:
	goto	l592
	line	589
	
l6448:; BSR set to: 1

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((c:menu_update_edit_value@screen_line))^00h,c
	line	590
		movlw	03h-1
	cpfsgt	((c:menu_update_edit_value@screen_line))^00h,c
	goto	u7161
	goto	u7160

u7161:
	goto	l593
u7160:
	goto	l592
	line	591
	
l593:; BSR set to: 1

	line	594
	movff	(_menu),(c:menu_update_edit_value@item_idx)
	line	598
	
l6452:; BSR set to: 1

	movf	((c:menu_update_edit_value@item_idx))^00h,c,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(c:menu_update_edit_value@opts)
	movff	1+?_get_item_options,(c:menu_update_edit_value@opts+1)
	line	600
	
l6454:
	movf	((c:menu_update_edit_value@opts))^00h,c,w
iorwf	((c:menu_update_edit_value@opts+1))^00h,c,w
	btfsc	status,2
	goto	u7171
	goto	u7170

u7171:
	goto	l6484
u7170:
	line	602
	
l6456:
	movf	((c:menu_update_edit_value@item_idx))^00h,c,w
	btfsc	status,2
	goto	u7181
	goto	u7180
u7181:
	goto	l596
u7180:
	
l6458:
	movff	(_sensor_edit_flag),(c:_menu_update_edit_value$1063)
	clrf	((c:_menu_update_edit_value$1063+1))^00h,c
	goto	l598
	
l596:
	movff	(_enable_edit_flag),(c:_menu_update_edit_value$1063)
	clrf	((c:_menu_update_edit_value$1063+1))^00h,c
	
l598:
	movff	(c:_menu_update_edit_value$1063),(c:menu_update_edit_value@flag_value)
	line	603
	
l6460:
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
	goto	u7191
	goto	u7190
u7191:
	goto	l6478
u7190:
	line	605
	
l6462:
	movlb	1	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u7201
	goto	u7200
u7201:
	goto	l6466
u7200:
	line	608
	
l6464:; BSR set to: 1

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
	line	609
	goto	l6500
	line	613
	
l6466:; BSR set to: 1

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
	line	614
	
l6468:
	movlw	low(0)
	movwf	((c:menu_update_edit_value@j))^00h,c
	goto	l6474
	line	615
	
l6470:
	movf	((c:menu_update_edit_value@j))^00h,c,w
	addlw	low(menu_update_edit_value@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	614
	
l6472:
	incf	((c:menu_update_edit_value@j))^00h,c
	
l6474:
		movf	((c:menu_update_edit_value@val_len))^00h,c,w
	subwf	((c:menu_update_edit_value@j))^00h,c,w
	btfss	status,0
	goto	u7211
	goto	u7210

u7211:
	goto	l6470
u7210:
	line	616
	
l6476:
	movf	((c:menu_update_edit_value@val_len))^00h,c,w
	addlw	low(menu_update_edit_value@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l6500
	line	621
	
l6478:
	movlb	1	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u7221
	goto	u7220
u7221:
	goto	l6482
u7220:
	line	622
	
l6480:; BSR set to: 1

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_121)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_121)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l6500
	line	624
	
l6482:; BSR set to: 1

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_122)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_122)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l6500
	line	629
	
l6484:
	movlb	1	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u7231
	goto	u7230
u7231:
	goto	l6488
u7230:
	line	631
	
l6486:; BSR set to: 1

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
	line	632
	goto	l6500
	line	635
	
l6488:; BSR set to: 1

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
	movwf	((c:menu_update_edit_value@val_len_1068))^00h,c
	line	636
	
l6490:
	movlw	low(0)
	movwf	((c:menu_update_edit_value@j_1069))^00h,c
	goto	l6496
	line	637
	
l6492:
	movf	((c:menu_update_edit_value@j_1069))^00h,c,w
	addlw	low(menu_update_edit_value@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	636
	
l6494:
	incf	((c:menu_update_edit_value@j_1069))^00h,c
	
l6496:
		movf	((c:menu_update_edit_value@val_len_1068))^00h,c,w
	subwf	((c:menu_update_edit_value@j_1069))^00h,c,w
	btfss	status,0
	goto	u7241
	goto	u7240

u7241:
	goto	l6492
u7240:
	line	638
	
l6498:
	movf	((c:menu_update_edit_value@val_len_1068))^00h,c,w
	addlw	low(menu_update_edit_value@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	643
	
l6500:
	movlw	low(0Ah)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_update_edit_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	644
	
l6502:
		movlw	low(STR_123)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_123)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	647
	
l6504:
		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_update_edit_value@val_len_1071))^00h,c
	line	648
	
l6506:
	movf	((c:menu_update_edit_value@val_len_1071))^00h,c,w
	btfsc	status,2
	goto	u7251
	goto	u7250
u7251:
	goto	l592
u7250:
	line	651
	
l6508:
	movf	((c:menu_update_edit_value@val_len_1071))^00h,c,w
	sublw	low(012h)
	movwf	((c:menu_update_edit_value@start_pos))^00h,c
	line	652
	
l6510:
	movff	(c:menu_update_edit_value@start_pos),(c:lcd_set_cursor@col)
	incf	((c:menu_update_edit_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	655
	
l6512:
		movlw	low(STR_124)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_124)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	657
	
l6514:
		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	659
	
l6516:
		movlw	low(STR_125)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_125)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	661
	
l592:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_edit_value
	__end_of_menu_update_edit_value:
	signat	_menu_update_edit_value,89
	global	_menu_init

;; *************** function _menu_init *****************
;; Defined at:
;;		line 164 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/3
;;		On exit  : 3F/1
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
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	164
global __ptext5
__ptext5:
psect	text5
	file	"src\menu.c"
	line	164
	
_menu_init:
;incstack = 0
	callstack 28
	line	166
	
l6228:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_menu))&0ffh
	line	167
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	168
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	169
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	170
	movlw	low(0)
	movwf	(0+(_menu+05h))&0ffh
	line	171
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	172
	
l400:; BSR set to: 1

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_init
	__end_of_menu_init:
	signat	_menu_init,89
	global	_menu_handle_encoder

;; *************** function _menu_handle_encoder *****************
;; Defined at:
;;		line 664 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  delta           2   53[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;  edit_flag       1   52[BANK0 ] PTR unsigned char 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), 
;;  buf            50    0[BANK0 ] unsigned char [50]
;;  opts            2   50[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 3E/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      53       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         7      53       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       60 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_get_item_options
;;		_sprintf
;;		_uart_println
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	664
global __ptext6
__ptext6:
psect	text6
	file	"src\menu.c"
	line	664
	
_menu_handle_encoder:; BSR set to: 1

;incstack = 0
	callstack 25
	line	667
	
l6310:; BSR set to: 1

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u6841
	goto	u6840
u6841:
	goto	l6344
u6840:
	line	669
	
l6312:; BSR set to: 1

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u6851
	goto	u6850

u6851:
	goto	l631
u6850:
	line	672
	
l6314:; BSR set to: 1

	movf	((_menu))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(menu_handle_encoder@opts)
	movff	1+?_get_item_options,(menu_handle_encoder@opts+1)
	line	673
	
l6316:
	movlb	0	; () banked
	movf	((menu_handle_encoder@opts))&0ffh,w
iorwf	((menu_handle_encoder@opts+1))&0ffh,w
	btfsc	status,2
	goto	u6861
	goto	u6860

u6861:
	goto	l631
u6860:
	line	676
	
l6318:; BSR set to: 0

	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u6871
	goto	u6870
u6871:
	goto	l6322
u6870:
	
l6320:; BSR set to: 1

		movlw	low(_sensor_edit_flag)
	movlb	0	; () banked
	movwf	((menu_handle_encoder@edit_flag))&0ffh

	goto	l623
	
l6322:; BSR set to: 1

		movlw	low(_enable_edit_flag)
	movlb	0	; () banked
	movwf	((menu_handle_encoder@edit_flag))&0ffh

	
l623:; BSR set to: 0

	line	678
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u6881
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u6880
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u6881
	goto	u6880

u6881:
	goto	l6330
u6880:
	line	680
	
l6324:; BSR set to: 0

	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	incf	indf2

	line	681
	
l6326:; BSR set to: 0

	movlw	01h
	addwf	((menu_handle_encoder@opts))&0ffh,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movlw	0
	addwfc	((menu_handle_encoder@opts+1))&0ffh,w
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
	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
		tblrd	*+
	movf	tablat,w
	subwf	postinc2,w
	btfss	status,0
	goto	u6891
	goto	u6890

u6891:
	goto	l6338
u6890:
	line	682
	
l6328:; BSR set to: 0

	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l6338
	line	684
	
l6330:; BSR set to: 0

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u6900
	goto	u6901

u6901:
	goto	l6338
u6900:
	line	686
	
l6332:; BSR set to: 0

	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u6911
	goto	u6910
u6911:
	goto	l6336
u6910:
	line	687
	
l6334:; BSR set to: 0

	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	movlw	01h
	addwf	((menu_handle_encoder@opts))&0ffh,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movlw	0
	addwfc	((menu_handle_encoder@opts+1))&0ffh,w
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

	goto	l6338
	line	689
	
l6336:; BSR set to: 0

	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	decf	indf2

	line	693
	
l6338:; BSR set to: 0

	movlw	01h
	addwf	((menu_handle_encoder@opts))&0ffh,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movlw	0
	addwfc	((menu_handle_encoder@opts+1))&0ffh,w
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
	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
		tblrd	*+
	movf	tablat,w
	subwf	postinc2,w
	btfss	status,0
	goto	u6921
	goto	u6920

u6921:
	goto	l618
u6920:
	line	694
	
l6340:; BSR set to: 0

	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l631
	line	696
	
l618:; BSR set to: 0

	goto	l631
	line	701
	
l6344:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u6931
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u6930
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u6931
	goto	u6930

u6931:
	goto	l6354
u6930:
	line	704
	
l6346:; BSR set to: 1

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
	goto	u6941
	goto	u6940

u6941:
	goto	l631
u6940:
	line	706
	
l6348:; BSR set to: 1

	incf	((_menu))&0ffh
	line	709
	
l6350:; BSR set to: 1

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
	goto	u6951
	goto	u6950

u6951:
	goto	l631
u6950:
	line	711
	
l6352:; BSR set to: 1

	incf	(0+(_menu+01h))&0ffh
	goto	l631
	line	715
	
l6354:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u6960
	goto	u6961

u6961:
	goto	l631
u6960:
	line	718
	
l6356:; BSR set to: 1

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u6971
	goto	u6970
u6971:
	goto	l631
u6970:
	line	723
	
l6358:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_126)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_126)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	724
	
l6360:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	726
	
l6362:
	movlb	1	; () banked
	decf	((_menu))&0ffh
	line	729
	
l6364:; BSR set to: 1

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u6981
	goto	u6980

u6981:
	goto	l631
u6980:
	line	731
	
l6366:; BSR set to: 1

	decf	(0+(_menu+01h))&0ffh
	line	735
	
l631:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_encoder
	__end_of_menu_handle_encoder:
	signat	_menu_handle_encoder,4217
	global	_menu_handle_button

;; *************** function _menu_handle_button *****************
;; Defined at:
;;		line 738 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  press_type      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  press_type      1    9[BANK1 ] unsigned char 
;;  i               1    8[BANK1 ] unsigned char 
;;  edit_flag       1    3[BANK1 ] PTR unsigned char 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), 
;;  opts            2    6[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  current_val     2    0[BANK1 ] int 
;;  new_value       2   10[BANK1 ] int 
;;  edit_flag       1    2[BANK1 ] PTR unsigned char 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), 
;;  opts            2    4[BANK1 ] PTR const struct .
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
;;      Locals:         0       0      12       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5       0      12       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       17 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 7
;; This function calls:
;;		_beep
;;		_get_current_numeric_value
;;		_get_item_options
;;		_init_numeric_editor
;;		_menu_draw_input
;;		_menu_draw_options
;;		_menu_draw_setup
;;		_rebuild_input_menu
;;		_save_current_config
;;		_sprintf
;;		_strcmp
;;		_strcpy
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	738
global __ptext7
__ptext7:
psect	text7
	file	"src\menu.c"
	line	738
	
_menu_handle_button:
;incstack = 0
	callstack 23
	movlb	1	; () banked
	movwf	((menu_handle_button@press_type))&0ffh
	line	742
	
l6518:
	movlb	1	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u7261
	goto	u7260
u7261:
	goto	l6576
u7260:
	line	744
	
l6520:; BSR set to: 1

		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u7271
	goto	u7270

u7271:
	goto	l709
u7270:
	line	747
	
l6522:; BSR set to: 1

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u7281
	goto	u7280
u7281:
	goto	l6526
u7280:
	
l6524:; BSR set to: 1

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7291
	goto	u7290

u7291:
	goto	l6544
u7290:
	line	750
	
l6526:; BSR set to: 1

	movf	((_menu))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(menu_handle_button@opts)
	movff	1+?_get_item_options,(menu_handle_button@opts+1)
	line	751
	
l6528:
	movlb	1	; () banked
	movf	((menu_handle_button@opts))&0ffh,w
iorwf	((menu_handle_button@opts+1))&0ffh,w
	btfsc	status,2
	goto	u7301
	goto	u7300

u7301:
	goto	l6540
u7300:
	line	753
	
l6530:; BSR set to: 1

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u7311
	goto	u7310
u7311:
	goto	l6534
u7310:
	
l6532:; BSR set to: 1

		movlw	low(_sensor_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh

	goto	l6536
	
l6534:; BSR set to: 1

		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh

	line	756
	
l6536:; BSR set to: 1

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
	line	759
	
l6538:
	movlw	low(01h)
	movwf	((c:_save_pending))^00h,c
	line	762
	
l6540:
	movlw	low(0)
	movlb	1	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	763
	
l6542:; BSR set to: 1

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	764
	goto	l709
	line	765
	
l6544:; BSR set to: 1

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u7321
	goto	u7320

u7321:
	goto	l6548
u7320:
	
l6546:; BSR set to: 1

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7331
	goto	u7330

u7331:
	goto	l709
u7330:
	line	768
	
l6548:; BSR set to: 1

	incf	(0+(_menu+08h))&0ffh
	line	769
	
l6550:; BSR set to: 1

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	772
	
l6552:
		movlw	2
	movlb	1	; () banked
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u7341
	goto	u7340

u7341:
	goto	l6558
u7340:
	
l6554:; BSR set to: 1

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u7351
	goto	u7350

u7351:
	goto	l6558
u7350:
	line	774
	
l6556:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+0Bh))&0ffh
	line	775
	movlw	low(0)
	movwf	(0+(_menu+0Ch))&0ffh
	line	778
	
l6558:; BSR set to: 1

		movlw	04h-1
	cpfsgt	(0+(_menu+08h))&0ffh
	goto	u7361
	goto	u7360

u7361:
	goto	l644
u7360:
	line	782
	
l6560:; BSR set to: 1

	call	_get_current_numeric_value	;wreg free
	movff	0+?_get_current_numeric_value,(menu_handle_button@new_value)
	movff	1+?_get_current_numeric_value,(menu_handle_button@new_value+1)
	line	785
	
l6562:; BSR set to: 1

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7371
	goto	u7370

u7371:
	goto	l6568
u7370:
	line	787
	
l6564:; BSR set to: 1

	movlb	0	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value),postinc2
	movff	(menu_handle_button@new_value+1),postdec2
	line	788
	
l6566:; BSR set to: 0

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_127)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_127)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	789
	goto	l6572
	line	792
	
l6568:; BSR set to: 1

	movlb	0	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value),postinc2
	movff	(menu_handle_button@new_value+1),postdec2
	line	793
	
l6570:; BSR set to: 0

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_128)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_128)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	797
	
l6572:
	movlw	low(01h)
	movwf	((c:_save_pending))^00h,c
	line	800
	
l6574:
	movlw	low(0)
	movlb	1	; () banked
	movwf	(0+(_menu+03h))&0ffh
	goto	l709
	line	807
	
l644:; BSR set to: 1

	line	808
	goto	l709
	line	811
	
l6576:; BSR set to: 1

		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u7381
	goto	u7380

u7381:
	goto	l6682
u7380:
	line	813
	
l6578:; BSR set to: 1

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7391
	goto	u7390
u7391:
	goto	l6596
u7390:
	line	815
	
l6580:; BSR set to: 1

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	817
	goto	l6594
	line	824
	
l6582:; BSR set to: 1

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	825
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	826
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	827
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	828
	
l6584:; BSR set to: 1

	call	_menu_draw_setup	;wreg free
	line	829
	goto	l709
	line	842
	
l6586:; BSR set to: 1

	movf	((c:_save_pending))^00h,c,w
	btfsc	status,2
	goto	u7401
	goto	u7400
u7401:
	goto	l644
u7400:
	line	844
	
l6588:; BSR set to: 1

	call	_save_current_config	;wreg free
	line	845
	
l6590:
	movlw	low(0)
	movwf	((c:_save_pending))^00h,c
	goto	l709
	line	817
	
l6594:
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l644
	xorlw	1^0	; case 1
	skipnz
	goto	l6582
	xorlw	2^1	; case 2
	skipnz
	goto	l644
	xorlw	3^2	; case 3
	skipnz
	goto	l644
	xorlw	4^3	; case 4
	skipnz
	goto	l6586
	goto	l709

	line	851
	
l6596:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7411
	goto	u7410

u7411:
	goto	l6658
u7410:
	line	853
	
l6598:; BSR set to: 1

		movlw	13
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7421
	goto	u7420

u7421:
	goto	l6612
u7420:
	line	855
	
l6600:; BSR set to: 1

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	857
	
l6602:
	movlw	low(02h)
	movlb	1	; () banked
	movwf	((_current_menu))&0ffh
	line	858
	
l6604:; BSR set to: 1

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	859
	
l6606:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	860
	
l6608:; BSR set to: 1

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l6584
	line	863
	
l6612:; BSR set to: 1

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
	goto	u7431
	goto	u7430
u7431:
	goto	l709
u7430:
	line	866
	
l6614:; BSR set to: 1

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u7441
	goto	u7440

u7441:
	goto	l6618
u7440:
	
l6616:; BSR set to: 1

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7451
	goto	u7450

u7451:
	goto	l6632
u7450:
	line	870
	
l6618:; BSR set to: 1

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u7461
	goto	u7460

u7461:
	goto	l6622
u7460:
	
l6620:; BSR set to: 1

	movlb	0	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val)
	movff	postdec2,(menu_handle_button@current_val+1)
	goto	l6624
	
l6622:; BSR set to: 1

	movlb	0	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val)
	movff	postdec2,(menu_handle_button@current_val+1)
	line	872
	
l6624:; BSR set to: 0

	movff	(menu_handle_button@current_val),(c:init_numeric_editor@value)
	movff	(menu_handle_button@current_val+1),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	873
	
l6626:; BSR set to: 1

	movlw	low(01h)
	movwf	(0+(_menu+03h))&0ffh
	line	874
	
l6628:; BSR set to: 1

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l6542
	line	880
	
l6632:; BSR set to: 1

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
	line	883
	
l6634:
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(menu_handle_button@opts_1102)
	movff	1+?_get_item_options,(menu_handle_button@opts_1102+1)
	line	884
	
l6636:
	movlb	1	; () banked
	movf	((menu_handle_button@opts_1102))&0ffh,w
iorwf	((menu_handle_button@opts_1102+1))&0ffh,w
	btfsc	status,2
	goto	u7471
	goto	u7470

u7471:
	goto	l6654
u7470:
	line	886
	
l6638:; BSR set to: 1

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u7481
	goto	u7480
u7481:
	goto	l6642
u7480:
	
l6640:; BSR set to: 1

		movlw	low(_sensor_edit_flag)
	movwf	((menu_handle_button@edit_flag_1106))&0ffh

	goto	l6644
	
l6642:; BSR set to: 1

		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_button@edit_flag_1106))&0ffh

	line	889
	
l6644:; BSR set to: 1

	movlw	low(0)
	movwf	((menu_handle_button@i))&0ffh
	goto	l6652
	line	891
	
l6646:; BSR set to: 1

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
	movf	((menu_handle_button@i))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(??_menu_handle_button+0+0)^00h,c,w
	addwf	((menu_handle_button@opts_1102))&0ffh,w
	movwf	(??_menu_handle_button+2+0)^00h,c
	movf	(??_menu_handle_button+0+1)^00h,c,w
	addwfc	((menu_handle_button@opts_1102+1))&0ffh,w
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
	goto	u7491
	goto	u7490

u7491:
	goto	l6650
u7490:
	line	893
	
l6648:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag_1106))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	movff	(menu_handle_button@i),indf2

	line	894
	goto	l6654
	line	889
	
l6650:
	movlb	1	; () banked
	incf	((menu_handle_button@i))&0ffh
	
l6652:; BSR set to: 1

	movlw	01h
	addwf	((menu_handle_button@opts_1102))&0ffh,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	0
	addwfc	((menu_handle_button@opts_1102+1))&0ffh,w
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
	goto	u7501
	goto	u7500

u7501:
	goto	l6646
u7500:
	line	899
	
l6654:; BSR set to: 1

	movlw	low(01h)
	movwf	(0+(_menu+03h))&0ffh
	line	900
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l6542
	line	905
	
l6658:; BSR set to: 1

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7511
	goto	u7510

u7511:
	goto	l644
u7510:
	line	907
	
l6660:; BSR set to: 1

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	909
	
l6662:
		movlw	4
	movlb	1	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7521
	goto	u7520

u7521:
	goto	l6668
u7520:
	line	912
	
l6664:; BSR set to: 1

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	913
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	914
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	915
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	916
	
l6666:; BSR set to: 1

	call	_menu_draw_options	;wreg free
	line	917
	goto	l709
	line	918
	
l6668:; BSR set to: 1

		movlw	03h-0
	cpfslt	((_menu))&0ffh
	goto	u7531
	goto	u7530

u7531:
	goto	l644
u7530:
	line	921
	
l6670:; BSR set to: 1

	movf	((_menu))&0ffh,w
	
	call	_rebuild_input_menu
	line	924
	
l6672:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_current_menu))&0ffh
	line	925
	
l6674:; BSR set to: 1

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	926
	
l6676:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	928
	
l6678:; BSR set to: 1

	call	_menu_draw_input	;wreg free
	line	929
	goto	l709
	line	936
	
l6682:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u7541
	goto	u7540

u7541:
	goto	l6690
u7540:
	line	938
	
l6684:; BSR set to: 1

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	939
	
l6686:
	asmopt push
asmopt off
movlw  3
movwf	(??_menu_handle_button+0+0+1)^00h,c
movlw	8
movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	119
u7917:
decfsz	wreg,f
	bra	u7917
	decfsz	(??_menu_handle_button+0+0)^00h,c,f
	bra	u7917
	decfsz	(??_menu_handle_button+0+0+1)^00h,c,f
	bra	u7917
	nop
asmopt pop

	line	940
	
l6688:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	941
	goto	l709
	line	942
	
l6690:; BSR set to: 1

		movlw	3
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u7551
	goto	u7550

u7551:
	goto	l709
u7550:
	line	944
	
l6692:; BSR set to: 1

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	945
	
l6694:
	asmopt push
asmopt off
movlw  3
movwf	(??_menu_handle_button+0+0+1)^00h,c
movlw	8
movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	119
u7927:
decfsz	wreg,f
	bra	u7927
	decfsz	(??_menu_handle_button+0+0)^00h,c,f
	bra	u7927
	decfsz	(??_menu_handle_button+0+0+1)^00h,c,f
	bra	u7927
	nop
asmopt pop

	line	946
	
l6696:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	947
	asmopt push
asmopt off
movlw  3
movwf	(??_menu_handle_button+0+0+1)^00h,c
movlw	8
movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	119
u7937:
decfsz	wreg,f
	bra	u7937
	decfsz	(??_menu_handle_button+0+0)^00h,c,f
	bra	u7937
	decfsz	(??_menu_handle_button+0+0+1)^00h,c,f
	bra	u7937
	nop
asmopt pop

	goto	l6688
	line	951
	
l709:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_button
	__end_of_menu_handle_button:
	signat	_menu_handle_button,4217
	global	_rebuild_input_menu

;; *************** function _rebuild_input_menu *****************
;; Defined at:
;;		line 175 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  input_num       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  input_num       1  102[BANK0 ] unsigned char 
;;  buf            50    0[BANK0 ] unsigned char [50]
;;  i               1   97[BANK0 ] unsigned char 
;;  buf            30   50[BANK0 ] unsigned char [30]
;;  sensor          1   96[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 3E/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0     103       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1     103       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      104 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		___lwdiv
;;		___lwmod
;;		_memcpy
;;		_sprintf
;;		_strcpy
;;		_uart_println
;; This function is called by:
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2,group=0
	line	175
global __ptext8
__ptext8:
psect	text8
	file	"src\menu.c"
	line	175
	
_rebuild_input_menu:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((rebuild_input_menu@input_num))&0ffh
	line	178
	
l5888:
	movff	(rebuild_input_menu@input_num),(_current_input)
	line	181
	
l5890:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((rebuild_input_menu@sensor))&0ffh
	line	184
	
l5892:; BSR set to: 0

	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfss	status,2
	goto	u6411
	goto	u6410
u6411:
	goto	l5896
u6410:
	
l5894:; BSR set to: 0

		movlw	low(STR_76)
	movwf	((_rebuild_input_menu$936))&0ffh
	movlw	high(STR_76)
	movwf	((_rebuild_input_menu$936+1))&0ffh

	goto	l5898
	
l5896:; BSR set to: 0

		movlw	low(STR_75)
	movwf	((_rebuild_input_menu$936))&0ffh
	movlw	high(STR_75)
	movwf	((_rebuild_input_menu$936+1))&0ffh

	
l5898:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_74)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_74)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_input_menu$936),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$936+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	186
	
l5900:
	movlb	0	; () banked
	movf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u6421
	goto	u6420
u6421:
	goto	l6026
u6420:
	line	188
	
l5902:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_77)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_77)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	189
	
l5904:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_78)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_78)
	movwf	((c:sprintf@f+1))^00h,c

	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	line	190
	
l5906:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_79)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_79)
	movwf	((c:sprintf@f+1))^00h,c

	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	line	191
	
l5908:
		movlw	low(_value_hi_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_hi_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_80)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_80)
	movwf	((c:sprintf@f+1))^00h,c

	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	line	193
	
l5910:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2060)
	movff	1+?___lwdiv,(_rebuild_input_menu$2060+1)
	
l5912:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	movff	0+?___lwmod,(_rebuild_input_menu$2061)
	movff	1+?___lwmod,(_rebuild_input_menu$2061+1)
	
l5914:
		movlw	low(_value_highbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_highbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_81)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_81)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2060),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2060+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2061),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2061+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	194
	
l5916:
		movlw	low(_value_low_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_82)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_82)
	movwf	((c:sprintf@f+1))^00h,c

	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	line	196
	
l5918:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2060)
	movff	1+?___lwdiv,(_rebuild_input_menu$2060+1)
	
l5920:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	movff	0+?___lwmod,(_rebuild_input_menu$2061)
	movff	1+?___lwmod,(_rebuild_input_menu$2061+1)
	
l5922:
		movlw	low(_value_plpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_plpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_83)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_83)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2060),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2060+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2061),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2061+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	198
	
l5924:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2060)
	movff	1+?___lwdiv,(_rebuild_input_menu$2060+1)
	
l5926:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	movff	0+?___lwmod,(_rebuild_input_menu$2061)
	movff	1+?___lwmod,(_rebuild_input_menu$2061+1)
	
l5928:
		movlw	low(_value_slpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_slpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_84)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_84)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2060),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2060+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2061),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2061+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	201
	
l5930:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+038h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+038h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfsc	status,2
	goto	u6431
	goto	u6430
u6431:
	goto	l5938
u6430:
	
l5932:; BSR set to: 0

	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+038h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+038h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	decf	postinc2,w
	btfsc	status,2
	goto	u6441
	goto	u6440

u6441:
	goto	l5936
u6440:
	
l5934:; BSR set to: 0

		movlw	low(STR_87)
	movwf	((_rebuild_input_menu$951))&0ffh
	movlw	high(STR_87)
	movwf	((_rebuild_input_menu$951+1))&0ffh

	goto	l417
	
l5936:; BSR set to: 0

		movlw	low(STR_86)
	movwf	((_rebuild_input_menu$951))&0ffh
	movlw	high(STR_86)
	movwf	((_rebuild_input_menu$951+1))&0ffh

	
l417:; BSR set to: 0

		movff	(_rebuild_input_menu$951),(_rebuild_input_menu$950)
	movff	(_rebuild_input_menu$951+1),(_rebuild_input_menu$950+1)

	goto	l5940
	
l5938:; BSR set to: 0

		movlw	low(STR_85)
	movwf	((_rebuild_input_menu$950))&0ffh
	movlw	high(STR_85)
	movwf	((_rebuild_input_menu$950+1))&0ffh

	
l5940:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$950),(c:strcpy@from)
	movff	(_rebuild_input_menu$950+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	203
	
l5942:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+039h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+039h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfsc	status,2
	goto	u6451
	goto	u6450
u6451:
	goto	l5950
u6450:
	
l5944:; BSR set to: 0

	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+039h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+039h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	decf	postinc2,w
	btfsc	status,2
	goto	u6461
	goto	u6460

u6461:
	goto	l5948
u6460:
	
l5946:; BSR set to: 0

		movlw	low(STR_90)
	movwf	((_rebuild_input_menu$958))&0ffh
	movlw	high(STR_90)
	movwf	((_rebuild_input_menu$958+1))&0ffh

	goto	l425
	
l5948:; BSR set to: 0

		movlw	low(STR_89)
	movwf	((_rebuild_input_menu$958))&0ffh
	movlw	high(STR_89)
	movwf	((_rebuild_input_menu$958+1))&0ffh

	
l425:; BSR set to: 0

		movff	(_rebuild_input_menu$958),(_rebuild_input_menu$957)
	movff	(_rebuild_input_menu$958+1),(_rebuild_input_menu$957+1)

	goto	l5952
	
l5950:; BSR set to: 0

		movlw	low(STR_88)
	movwf	((_rebuild_input_menu$957))&0ffh
	movlw	high(STR_88)
	movwf	((_rebuild_input_menu$957+1))&0ffh

	
l5952:; BSR set to: 0

		movlw	low(_value_rlyplp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyplp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$957),(c:strcpy@from)
	movff	(_rebuild_input_menu$957+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	205
	
l5954:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfsc	status,2
	goto	u6471
	goto	u6470
u6471:
	goto	l5962
u6470:
	
l5956:; BSR set to: 0

	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	decf	postinc2,w
	btfsc	status,2
	goto	u6481
	goto	u6480

u6481:
	goto	l5960
u6480:
	
l5958:; BSR set to: 0

		movlw	low(STR_93)
	movwf	((_rebuild_input_menu$965))&0ffh
	movlw	high(STR_93)
	movwf	((_rebuild_input_menu$965+1))&0ffh

	goto	l433
	
l5960:; BSR set to: 0

		movlw	low(STR_92)
	movwf	((_rebuild_input_menu$965))&0ffh
	movlw	high(STR_92)
	movwf	((_rebuild_input_menu$965+1))&0ffh

	
l433:; BSR set to: 0

		movff	(_rebuild_input_menu$965),(_rebuild_input_menu$964)
	movff	(_rebuild_input_menu$965+1),(_rebuild_input_menu$964+1)

	goto	l5964
	
l5962:; BSR set to: 0

		movlw	low(STR_91)
	movwf	((_rebuild_input_menu$964))&0ffh
	movlw	high(STR_91)
	movwf	((_rebuild_input_menu$964+1))&0ffh

	
l5964:; BSR set to: 0

		movlw	low(_value_rlyslp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyslp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$964),(c:strcpy@from)
	movff	(_rebuild_input_menu$964+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	206
	
l5966:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfss	status,2
	goto	u6491
	goto	u6490
u6491:
	goto	l5970
u6490:
	
l5968:; BSR set to: 0

		movlw	low(STR_95)
	movwf	((_rebuild_input_menu$969))&0ffh
	movlw	high(STR_95)
	movwf	((_rebuild_input_menu$969+1))&0ffh

	goto	l5972
	
l5970:; BSR set to: 0

		movlw	low(STR_94)
	movwf	((_rebuild_input_menu$969))&0ffh
	movlw	high(STR_94)
	movwf	((_rebuild_input_menu$969+1))&0ffh

	
l5972:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$969),(c:strcpy@from)
	movff	(_rebuild_input_menu$969+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	209
	
l5974:
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
	line	212
	
l5976:
		movlw	low(_value_enable)
	movlb	1	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	213
	
l5978:; BSR set to: 1

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	214
	
l5980:; BSR set to: 1

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	clrf	(1+(_input_menu+0Ch))&0ffh

	line	215
	
l5982:; BSR set to: 1

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	clrf	(1+(_input_menu+011h))&0ffh

	line	216
	
l5984:; BSR set to: 1

		movlw	low(_value_hi_pressure)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_hi_pressure)
	movwf	(1+(_input_menu+016h))&0ffh

	line	217
	
l5986:; BSR set to: 1

		movlw	low(_value_highbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_highbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	218
	
l5988:; BSR set to: 1

		movlw	low(_value_low_pressure)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_pressure)
	movwf	(1+(_input_menu+020h))&0ffh

	line	219
	
l5990:; BSR set to: 1

		movlw	low(_value_plpbp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_plpbp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	220
	
l5992:; BSR set to: 1

		movlw	low(_value_slpbp)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_slpbp)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	221
	
l5994:; BSR set to: 1

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	222
	
l5996:; BSR set to: 1

		movlw	low(_value_rlyplp)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_rlyplp)
	movwf	(1+(_input_menu+034h))&0ffh

	line	223
	
l5998:; BSR set to: 1

		movlw	low(_value_rlyslp)
	movwf	(0+(_input_menu+039h))&0ffh
	movlw	high(_value_rlyslp)
	movwf	(1+(_input_menu+039h))&0ffh

	line	224
	
l6000:; BSR set to: 1

		movlw	low(_value_display)
	movwf	(0+(_input_menu+03Eh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+03Eh))&0ffh

	line	225
	
l6002:; BSR set to: 1

		movlw	low(_value_back)
	movwf	(0+(_input_menu+043h))&0ffh
	clrf	(1+(_input_menu+043h))&0ffh

	line	227
	
l6004:; BSR set to: 1

	movlw	low(0Eh)
	movwf	(0+(_menu+02h))&0ffh
	line	231
	
l6006:; BSR set to: 1

		movlw	low(rebuild_input_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_96)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_96)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+02h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	232
	
l6008:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	235
	
l6010:
		movlw	low(STR_97)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_97)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	236
	
l6012:
	movlw	low(0Ch)
	movlb	0	; () banked
	movwf	((rebuild_input_menu@i))&0ffh
	
l6014:; BSR set to: 0

		movlw	0Eh-1
	cpfsgt	((rebuild_input_menu@i))&0ffh
	goto	u6501
	goto	u6500

u6501:
	goto	l6018
u6500:
	goto	l442
	line	239
	
l6018:; BSR set to: 0

		movlw	low(rebuild_input_menu@buf_977)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_98)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_98)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(rebuild_input_menu@i),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movf	((rebuild_input_menu@i))&0ffh,w
	mullw	05h
	movlw	low(_input_menu)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+06h)
	movff	postdec2,1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	240
	
l6020:
		movlw	low(rebuild_input_menu@buf_977)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	236
	
l6022:
	movlb	0	; () banked
	incf	((rebuild_input_menu@i))&0ffh
	goto	l6014
	line	243
	
l6026:; BSR set to: 0

		decf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u6511
	goto	u6510

u6511:
	goto	l442
u6510:
	line	245
	
l6028:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_99)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_99)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	246
	
l6030:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_100)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_100)
	movwf	((c:sprintf@f+1))^00h,c

	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	line	247
	
l6032:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_101)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_101)
	movwf	((c:sprintf@f+1))^00h,c

	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	line	248
	
l6034:
		movlw	low(_value_high_temp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_temp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_102)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_102)
	movwf	((c:sprintf@f+1))^00h,c

	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	line	250
	
l6036:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2060)
	movff	1+?___lwdiv,(_rebuild_input_menu$2060+1)
	
l6038:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
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
	movff	0+?___lwmod,(_rebuild_input_menu$2061)
	movff	1+?___lwmod,(_rebuild_input_menu$2061+1)
	
l6040:
		movlw	low(_value_high_tbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_tbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_103)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_103)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2060),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2060+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2061),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2061+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	253
	
l6042:
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
	line	256
	
l6044:
		movlw	low(_value_enable)
	movlb	1	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	257
	
l6046:; BSR set to: 1

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	258
	
l6048:; BSR set to: 1

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	clrf	(1+(_input_menu+0Ch))&0ffh

	line	259
	
l6050:; BSR set to: 1

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	clrf	(1+(_input_menu+011h))&0ffh

	line	260
	
l6052:; BSR set to: 1

		movlw	low(_value_high_temp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_high_temp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	261
	
l6054:; BSR set to: 1

		movlw	low(_value_high_tbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_high_tbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	262
	
l6056:; BSR set to: 1

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+020h))&0ffh

	line	263
	
l6058:; BSR set to: 1

		movlw	low(_value_display)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+025h))&0ffh

	line	264
	
l6060:; BSR set to: 1

		movlw	low(_value_back)
	movwf	(0+(_input_menu+02Ah))&0ffh
	clrf	(1+(_input_menu+02Ah))&0ffh

	line	266
	
l6062:; BSR set to: 1

	movlw	low(09h)
	movwf	(0+(_menu+02h))&0ffh
	line	269
	
l442:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_input_menu
	__end_of_rebuild_input_menu:
	signat	_rebuild_input_menu,4217
	global	_menu_draw_setup

;; *************** function _menu_draw_setup *****************
;; Defined at:
;;		line 954 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  type_text       2   46[COMRAM] PTR const unsigned char 
;;		 -> STR_137(5), STR_136(5), STR_135(9), 
;;  type_len        1   45[COMRAM] unsigned char 
;;  sensor_type     1   48[COMRAM] unsigned char 
;;  item_idx        1   49[COMRAM] unsigned char 
;;  i               1   50[COMRAM] unsigned char 
;;  setup_items    10   35[COMRAM] PTR const unsigned char 
;;		 -> STR_134(5), STR_133(6), STR_132(8), STR_131(8), 
;;		 -> STR_130(8), 
;;  sensor_type_    6   29[COMRAM] PTR const unsigned char 
;;		 -> STR_137(5), STR_136(5), STR_135(9), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        22       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        27       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       27 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
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
psect	text9,class=CODE,space=0,reloc=2,group=0
	line	954
global __ptext9
__ptext9:
psect	text9
	file	"src\menu.c"
	line	954
	
_menu_draw_setup:
;incstack = 0
	callstack 23
	line	959
	
l5848:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	960
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_129)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_129)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	968
	
l5850:
	lfsr	2,(menu_draw_setup@F2589)
	lfsr	1,(menu_draw_setup@setup_items)
	movlw	10-1
u6341:
	movff	plusw2,plusw1
	decf	wreg
	bc	u6341

	line	971
	
l5852:
	lfsr	2,(menu_draw_setup@F2591)
	lfsr	1,(menu_draw_setup@sensor_type_names)
	movlw	6-1
u6351:
	movff	plusw2,plusw1
	decf	wreg
	bc	u6351

	line	974
	
l5854:
	movlw	low(0)
	movwf	((c:menu_draw_setup@i))^00h,c
	goto	l5884
	line	976
	
l5856:; BSR set to: 1

	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_setup@i))^00h,c,w
	movwf	((c:menu_draw_setup@item_idx))^00h,c
	line	977
	
l5858:; BSR set to: 1

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_clear_line
	line	980
	
l5860:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	1	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u6361
	goto	u6360

u6361:
	goto	l5868
u6360:
	line	982
	
l5862:; BSR set to: 1

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_138)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_138)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	983
	
l5864:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_items)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:lcd_print@str)
	movff	postdec2,(c:lcd_print@str+1)
	call	_lcd_print	;wreg free
	line	984
	
l5866:
		movlw	low(STR_139)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_139)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	985
	goto	l5870
	line	988
	
l5868:; BSR set to: 1

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
	line	992
	
l5870:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u6371
	goto	u6370

u6371:
	goto	l5882
u6370:
	line	994
	
l5872:
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
	line	995
	
l5874:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@sensor_type))^00h,c
	goto	u6381
	goto	u6380

u6381:
	goto	l5882
u6380:
	line	997
	
l5876:
	movf	((c:menu_draw_setup@sensor_type))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@sensor_type_names)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:menu_draw_setup@type_text)
	movff	postdec2,(c:menu_draw_setup@type_text+1)
	line	998
	
l5878:
		movff	(c:menu_draw_setup@type_text),(c:strlen@s)
	movff	(c:menu_draw_setup@type_text+1),(c:strlen@s+1)

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_setup@type_len))^00h,c
	line	1000
	
l5880:
	movf	((c:menu_draw_setup@type_len))^00h,c,w
	sublw	low(014h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@type_text),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@type_text+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	974
	
l5882:
	incf	((c:menu_draw_setup@i))^00h,c
	
l5884:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@i))^00h,c
	goto	u6391
	goto	u6390

u6391:
	goto	l727
u6390:
	
l5886:
	movlb	1	; () banked
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
	goto	u6401
	goto	u6400

u6401:
	goto	l5856
u6400:
	line	1004
	
l727:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_setup
	__end_of_menu_draw_setup:
	signat	_menu_draw_setup,89
	global	_menu_draw_options

;; *************** function _menu_draw_options *****************
;; Defined at:
;;		line 421 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   29[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_lcd_clear_line
;;		_lcd_print
;;		_lcd_print_at
;; This function is called by:
;;		_main
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2,group=0
	line	421
global __ptext10
__ptext10:
psect	text10
	file	"src\menu.c"
	line	421
	
_menu_draw_options:
;incstack = 0
	callstack 23
	line	424
	
l5692:; BSR set to: 1

	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	425
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_108)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_108)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	428
	
l5694:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	goto	l5710
	line	430
	
l5696:; BSR set to: 1

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	433
	
l5698:
	movlb	1	; () banked
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
	bnz	u6081
movf	(??_menu_draw_options+0+1)^00h,c,w
xorwf	(??_menu_draw_options+2+1)^00h,c,w
	btfss	status,2
	goto	u6081
	goto	u6080

u6081:
	goto	l5706
u6080:
	line	435
	
l5700:; BSR set to: 1

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_109)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_109)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_print_at
	line	436
	
l5702:
	movf	((c:menu_draw_options@i))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_options+0+0
	movlb	1	; () banked
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
	line	437
	
l5704:
		movlw	low(STR_110)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_110)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	438
	goto	l5708
	line	441
	
l5706:; BSR set to: 1

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
	line	428
	
l5708:
	incf	((c:menu_draw_options@i))^00h,c
	
l5710:
		movlw	03h-0
	cpfslt	((c:menu_draw_options@i))^00h,c
	goto	u6091
	goto	u6090

u6091:
	goto	l534
u6090:
	
l5712:
	movlb	1	; () banked
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
	goto	u6101
	goto	u6100

u6101:
	goto	l5696
u6100:
	line	444
	
l534:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_options
	__end_of_menu_draw_options:
	signat	_menu_draw_options,89
	global	_menu_draw_input

;; *************** function _menu_draw_input *****************
;; Defined at:
;;		line 447 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1   88[BANK0 ] unsigned char 
;;  j               1   89[BANK0 ] unsigned char 
;;  val_len         1   86[BANK0 ] unsigned char 
;;  val_len         1   87[BANK0 ] unsigned char 
;;  flag_value      1   85[BANK0 ] unsigned char 
;;  flag_value      1   84[BANK0 ] unsigned char 
;;  start_pos       1   75[BANK0 ] unsigned char 
;;  opts            2   92[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  opts            2   90[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  buf            50    0[BANK0 ] unsigned char [50]
;;  value_buf      15   60[BANK0 ] unsigned char [15]
;;  item_idx        1   97[BANK0 ] unsigned char 
;;  show_bracket    1   95[BANK0 ] unsigned char 
;;  val_len         1   94[BANK0 ] unsigned char 
;;  i               1   96[BANK0 ] unsigned char 
;;  title          10   50[BANK0 ] unsigned char [10]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 3F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      98       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5      98       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      103 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
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
;;		_uart_println
;; This function is called by:
;;		_main
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2,group=0
	line	447
global __ptext11
__ptext11:
psect	text11
	file	"src\menu.c"
	line	447
	
_menu_draw_input:
;incstack = 0
	callstack 23
	line	450
	
l5714:; BSR set to: 1

	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	452
	
l5716:
		movlw	low(menu_draw_input@title)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_111)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_111)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(01h)
	movlb	0	; () banked
	addwf	((_current_input))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	1+(0+((c:?_sprintf)+04h))^00h,c
	movlw	high(01h)
	addwfc	1+(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	453
	
l5718:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@title)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	456
	
l5720:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@i))&0ffh
	goto	l5844
	line	458
	
l5722:; BSR set to: 0

	movlb	1	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_input@i))&0ffh,w
	movwf	((menu_draw_input@item_idx))&0ffh
	line	459
	
l5724:; BSR set to: 0

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_clear_line
	line	462
	
l5726:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_input_menu)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:lcd_print_at@str)
	movff	postdec2,(c:lcd_print_at@str+1)
	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	465
	
l5728:
		movlw	0Bh-1
	movlb	0	; () banked
	cpfsgt	((menu_draw_input@item_idx))&0ffh
	goto	u6111
	goto	u6110

u6111:
	goto	l5734
u6110:
	line	468
	
l5730:; BSR set to: 0

		movlw	low(menu_draw_input@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_112)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_112)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_draw_input@item_idx),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movf	((menu_draw_input@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_input_menu)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+06h)
	movff	postdec2,1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	469
	
l5732:
		movlw	low(menu_draw_input@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	474
	
l5734:
	line	476
	
l5736:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	1	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u6121
	goto	u6120

u6121:
	goto	l5798
u6120:
	line	478
	
l5738:; BSR set to: 1

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u6131
	goto	u6130
u6131:
	goto	l5794
u6130:
	line	480
	
l5740:; BSR set to: 1

	movlw	low(02h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	line	482
	movlb	1	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u6141
	goto	u6140
u6141:
	goto	l5758
u6140:
	line	485
	
l5742:; BSR set to: 1

	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(menu_draw_input@opts)
	movff	1+?_get_item_options,(menu_draw_input@opts+1)
	line	486
	
l5744:
	movlb	0	; () banked
	movf	((menu_draw_input@opts))&0ffh,w
iorwf	((menu_draw_input@opts+1))&0ffh,w
	btfsc	status,2
	goto	u6151
	goto	u6150

u6151:
	goto	l5756
u6150:
	line	488
	
l5746:; BSR set to: 0

	movf	((menu_draw_input@item_idx))&0ffh,w
	btfsc	status,2
	goto	u6161
	goto	u6160
u6161:
	goto	l545
u6160:
	
l5748:; BSR set to: 0

	movff	(_sensor_edit_flag),(_menu_draw_input$1029)
	clrf	((_menu_draw_input$1029+1))&0ffh
	goto	l547
	
l545:; BSR set to: 0

	movff	(_enable_edit_flag),(_menu_draw_input$1029)
	clrf	((_menu_draw_input$1029+1))&0ffh
	
l547:; BSR set to: 0

	movff	(_menu_draw_input$1029),(menu_draw_input@flag_value)
	line	489
	
l5750:; BSR set to: 0

	movlw	01h
	addwf	((menu_draw_input@opts))&0ffh,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	0
	addwfc	((menu_draw_input@opts+1))&0ffh,w
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
	cpfslt	((menu_draw_input@flag_value))&0ffh
	goto	u6171
	goto	u6170
u6171:
	goto	l5754
u6170:
	line	491
	
l5752:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

	movf	((menu_draw_input@flag_value))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_draw_input+0+0
	movff	prodh,??_menu_draw_input+0+0+1
	movf	(??_menu_draw_input+0+0)^00h,c,w
	addwf	((menu_draw_input@opts))&0ffh,w
	movwf	(??_menu_draw_input+2+0)^00h,c
	movf	(??_menu_draw_input+0+1)^00h,c,w
	addwfc	((menu_draw_input@opts+1))&0ffh,w
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
	line	492
	goto	l5802
	line	495
	
l5754:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_113)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_113)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l5802
	line	500
	
l5756:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

	movf	((menu_draw_input@item_idx))&0ffh,w
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
	goto	l5802
	line	506
	
l5758:; BSR set to: 1

	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(menu_draw_input@opts_1031)
	movff	1+?_get_item_options,(menu_draw_input@opts_1031+1)
	line	507
	
l5760:
	movlb	0	; () banked
	movf	((menu_draw_input@opts_1031))&0ffh,w
iorwf	((menu_draw_input@opts_1031+1))&0ffh,w
	btfsc	status,2
	goto	u6181
	goto	u6180

u6181:
	goto	l5782
u6180:
	line	509
	
l5762:; BSR set to: 0

	movf	((menu_draw_input@item_idx))&0ffh,w
	btfsc	status,2
	goto	u6191
	goto	u6190
u6191:
	goto	l554
u6190:
	
l5764:; BSR set to: 0

	movff	(_sensor_edit_flag),(_menu_draw_input$1036)
	clrf	((_menu_draw_input$1036+1))&0ffh
	goto	l556
	
l554:; BSR set to: 0

	movff	(_enable_edit_flag),(_menu_draw_input$1036)
	clrf	((_menu_draw_input$1036+1))&0ffh
	
l556:; BSR set to: 0

	movff	(_menu_draw_input$1036),(menu_draw_input@flag_value_1035)
	line	510
	
l5766:; BSR set to: 0

	movlw	01h
	addwf	((menu_draw_input@opts_1031))&0ffh,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	0
	addwfc	((menu_draw_input@opts_1031+1))&0ffh,w
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
	cpfslt	((menu_draw_input@flag_value_1035))&0ffh
	goto	u6201
	goto	u6200
u6201:
	goto	l5780
u6200:
	line	512
	
l5768:; BSR set to: 0

	movf	((menu_draw_input@flag_value_1035))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_draw_input+0+0
	movff	prodh,??_menu_draw_input+0+0+1
	movf	(??_menu_draw_input+0+0)^00h,c,w
	addwf	((menu_draw_input@opts_1031))&0ffh,w
	movwf	(??_menu_draw_input+2+0)^00h,c
	movf	(??_menu_draw_input+0+1)^00h,c,w
	addwfc	((menu_draw_input@opts_1031+1))&0ffh,w
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
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len))&0ffh
	line	513
	
l5770:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j))&0ffh
	goto	l5776
	line	514
	
l5772:; BSR set to: 0

	movf	((menu_draw_input@j))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	513
	
l5774:; BSR set to: 0

	incf	((menu_draw_input@j))&0ffh
	
l5776:; BSR set to: 0

		movf	((menu_draw_input@val_len))&0ffh,w
	subwf	((menu_draw_input@j))&0ffh,w
	btfss	status,0
	goto	u6211
	goto	u6210

u6211:
	goto	l5772
u6210:
	line	515
	
l5778:; BSR set to: 0

	movf	((menu_draw_input@val_len))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	516
	goto	l5802
	line	519
	
l5780:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_114)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_114)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l5802
	line	524
	
l5782:; BSR set to: 0

	movf	((menu_draw_input@item_idx))&0ffh,w
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
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_1040))&0ffh
	line	525
	
l5784:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j_1041))&0ffh
	goto	l5790
	line	526
	
l5786:; BSR set to: 0

	movf	((menu_draw_input@j_1041))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	525
	
l5788:; BSR set to: 0

	incf	((menu_draw_input@j_1041))&0ffh
	
l5790:; BSR set to: 0

		movf	((menu_draw_input@val_len_1040))&0ffh,w
	subwf	((menu_draw_input@j_1041))&0ffh,w
	btfss	status,0
	goto	u6221
	goto	u6220

u6221:
	goto	l5786
u6220:
	line	527
	
l5792:; BSR set to: 0

	movf	((menu_draw_input@val_len_1040))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l5802
	line	534
	
l5794:; BSR set to: 1

	movlw	low(01h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l5756
	line	541
	
l5798:; BSR set to: 1

	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l5756
	line	546
	
l5802:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_1042))&0ffh
	line	547
	
l5804:; BSR set to: 0

	movf	((menu_draw_input@val_len_1042))&0ffh,w
	btfsc	status,2
	goto	u6231
	goto	u6230
u6231:
	goto	l5842
u6230:
	
l5806:; BSR set to: 0

	movf	((menu_draw_input@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strcmp@s1)
	movff	postdec2,(c:strcmp@s1+1)
		movlw	low(STR_115)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_115)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u6241
	goto	u6240

u6241:
	goto	l5842
u6240:
	line	550
	
l5808:
	movlb	1	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u6251
	goto	u6250
u6251:
	goto	l5818
u6250:
	
l5810:; BSR set to: 1

		movlw	2
	movlb	0	; () banked
	xorwf	((menu_draw_input@item_idx))&0ffh,w
	btfsc	status,2
	goto	u6261
	goto	u6260

u6261:
	goto	l5814
u6260:
	
l5812:; BSR set to: 0

		movlw	3
	xorwf	((menu_draw_input@item_idx))&0ffh,w
	btfss	status,2
	goto	u6271
	goto	u6270

u6271:
	goto	l5818
u6270:
	
l5814:; BSR set to: 0

	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	1	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u6281
	goto	u6280

u6281:
	goto	l5818
u6280:
	line	553
	
l5816:; BSR set to: 1

		movlw	low(STR_116)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_116)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	556
	goto	l5842
	line	559
	
l5818:
	movlb	0	; () banked
	movf	((menu_draw_input@show_brackets))&0ffh,w
	btfss	status,2
	goto	u6291
	goto	u6290
u6291:
	goto	l5822
u6290:
	line	562
	
l5820:; BSR set to: 0

	movf	((menu_draw_input@val_len_1042))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	563
	goto	l5842
	line	567
	
l5822:; BSR set to: 0

	movf	((menu_draw_input@val_len_1042))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_input@start_pos))&0ffh
	line	568
	
l5824:; BSR set to: 0

	movff	(menu_draw_input@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	571
	
l5826:
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u6301
	goto	u6300

u6301:
	goto	l5830
u6300:
	
l5828:; BSR set to: 0

		movlw	low(STR_118)
	movwf	((_menu_draw_input$1049))&0ffh
	movlw	high(STR_118)
	movwf	((_menu_draw_input$1049+1))&0ffh

	goto	l5832
	
l5830:; BSR set to: 0

		movlw	low(STR_117)
	movwf	((_menu_draw_input$1049))&0ffh
	movlw	high(STR_117)
	movwf	((_menu_draw_input$1049+1))&0ffh

	
l5832:; BSR set to: 0

		movff	(_menu_draw_input$1049),(c:lcd_print@str)
	movff	(_menu_draw_input$1049+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	573
	
l5834:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	575
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u6311
	goto	u6310

u6311:
	goto	l5838
u6310:
	
l5836:; BSR set to: 0

		movlw	low(STR_120)
	movwf	((_menu_draw_input$1053))&0ffh
	movlw	high(STR_120)
	movwf	((_menu_draw_input$1053+1))&0ffh

	goto	l5840
	
l5838:; BSR set to: 0

		movlw	low(STR_119)
	movwf	((_menu_draw_input$1053))&0ffh
	movlw	high(STR_119)
	movwf	((_menu_draw_input$1053+1))&0ffh

	
l5840:; BSR set to: 0

		movff	(_menu_draw_input$1053),(c:lcd_print@str)
	movff	(_menu_draw_input$1053+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	456
	
l5842:
	movlb	0	; () banked
	incf	((menu_draw_input@i))&0ffh
	
l5844:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_input@i))&0ffh
	goto	u6321
	goto	u6320

u6321:
	goto	l586
u6320:
	
l5846:; BSR set to: 0

	movlb	1	; () banked
	movf	(0+(_menu+02h))&0ffh,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	clrf	(??_menu_draw_input+0+0+1)^00h,c

	movlb	0	; () banked
	movf	((menu_draw_input@i))&0ffh,w
	movff	0+(_menu+01h),??_menu_draw_input+2+0
	clrf	(??_menu_draw_input+2+0+1)^00h,c
	addwf	(??_menu_draw_input+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_input+2+1)^00h,c
		movf	(??_menu_draw_input+0+0)^00h,c,w
	subwf	(??_menu_draw_input+2+0)^00h,c,w
	movf	(??_menu_draw_input+2+1)^00h,c,w
	xorlw	80h
	movwf	(??_menu_draw_input+4+0)^00h,c
	movf	(??_menu_draw_input+0+1)^00h,c,w
	xorlw	80h
	subwfb	(??_menu_draw_input+4+0)^00h,c,w
	btfss	status,0
	goto	u6331
	goto	u6330

u6331:
	goto	l5722
u6330:
	line	580
	
l586:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_input
	__end_of_menu_draw_input:
	signat	_menu_draw_input,89
	global	_uart_println

;; *************** function _uart_println *****************
;; Defined at:
;;		line 67 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   17[COMRAM] PTR const unsigned char 
;;		 -> menu_handle_encoder@buf(50), STR_116(41), menu_draw_input@buf(50), STR_104(33), 
;;		 -> rebuild_input_menu@buf_977(50), STR_97(26), rebuild_input_menu@buf(30), STR_13(33), 
;;		 -> main@buf_522(30), main@buf(40), STR_10(19), STR_9(22), 
;;		 -> STR_8(22), STR_7(24), STR_6(19), STR_5(22), 
;;		 -> STR_2(23), STR_1(28), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_uart_print
;;		_uart_write
;; This function is called by:
;;		_main
;;		_rebuild_input_menu
;;		_menu_update_numeric_value
;;		_menu_draw_input
;;		_menu_handle_encoder
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	67
global __ptext12
__ptext12:
psect	text12
	file	"src\main.c"
	line	67
	
_uart_println:; BSR set to: 0

;incstack = 0
	callstack 26
	line	69
	
l5376:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	70
	
l5378:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	71
	
l5380:
	movlw	(0Ah)&0ffh
	
	call	_uart_write
	line	72
	
l104:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_println
	__end_of_uart_println:
	signat	_uart_println,4217
	global	_uart_print

;; *************** function _uart_print *****************
;; Defined at:
;;		line 59 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   15[COMRAM] PTR const unsigned char 
;;		 -> menu_handle_encoder@buf(50), STR_116(41), menu_draw_input@buf(50), STR_104(33), 
;;		 -> rebuild_input_menu@buf_977(50), STR_97(26), rebuild_input_menu@buf(30), STR_13(33), 
;;		 -> main@buf_522(30), main@buf(40), STR_10(19), STR_9(22), 
;;		 -> STR_8(22), STR_7(24), STR_6(19), STR_5(22), 
;;		 -> STR_2(23), STR_1(28), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/1
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
;;		_uart_write
;; This function is called by:
;;		_uart_println
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2,group=0
	line	59
global __ptext13
__ptext13:
psect	text13
	file	"src\main.c"
	line	59
	
_uart_print:
;incstack = 0
	callstack 26
	line	61
	
l5280:
	goto	l5286
	line	63
	
l5282:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5487
	tblrd	*
	
	movf	tablat,w
	bra	u5480
u5487:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5480:
	
	call	_uart_write
	
l5284:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	61
	
l5286:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5497
	tblrd	*
	
	movf	tablat,w
	bra	u5490
u5497:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5490:
	iorlw	0
	btfss	status,2
	goto	u5501
	goto	u5500
u5501:
	goto	l5282
u5500:
	line	65
	
l101:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_print
	__end_of_uart_print:
	signat	_uart_print,4217
	global	_uart_write

;; *************** function _uart_write *****************
;; Defined at:
;;		line 52 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1   14[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/1
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
;;		Nothing
;; This function is called by:
;;		_uart_print
;;		_uart_println
;; This function uses a non-reentrant model
;;
psect	text14,class=CODE,space=0,reloc=2,group=0
	line	52
global __ptext14
__ptext14:
psect	text14
	file	"src\main.c"
	line	52
	
_uart_write:
;incstack = 0
	callstack 27
	movwf	((c:uart_write@c))^00h,c
	line	54
	
l5258:
	line	55
	
l92:
	line	54
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u5451
	goto	u5450
u5451:
	goto	l92
u5450:
	line	56
	
l5260:
	movff	(c:uart_write@c),(c:4013)	;volatile
	line	57
	
l95:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_write
	__end_of_uart_write:
	signat	_uart_write,4217
	global	_strlen

;; *************** function _strlen *****************
;; Defined at:
;;		line 4 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
;; Parameters:    Size  Location     Type
;;  s               2   14[COMRAM] PTR const unsigned char 
;;		 -> STR_137(5), STR_136(5), STR_135(9), menu_update_edit_value@value_buf(15), 
;;		 -> menu_draw_input@value_buf(15), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), NULL(0), STR_25(1), STR_24(1), 
;;		 -> STR_23(5), STR_22(5), STR_21(9), STR_20(1), 
;;		 -> STR_19(1), STR_18(1), STR_17(8), STR_16(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_137(5), STR_136(5), STR_135(9), menu_update_edit_value@value_buf(15), 
;;		 -> menu_draw_input@value_buf(15), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), NULL(0), STR_25(1), STR_24(1), 
;;		 -> STR_23(5), STR_22(5), STR_21(9), STR_20(1), 
;;		 -> STR_19(1), STR_18(1), STR_17(8), STR_16(9), 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_draw_input
;;		_menu_update_edit_value
;;		_menu_draw_setup
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
global __ptext15
__ptext15:
psect	text15
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
	
_strlen:
;incstack = 0
	callstack 27
	line	8
	
l5604:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l5608
	line	10
	
l5606:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l5608:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5997
	tblrd	*
	
	movf	tablat,w
	bra	u5990
u5997:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5990:
	iorlw	0
	btfss	status,2
	goto	u6001
	goto	u6000
u6001:
	goto	l5606
u6000:
	line	12
	
l5610:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l1594:
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
;;  to              2   14[COMRAM] PTR unsigned char 
;;		 -> original_value(10), menu_update_edit_value@value_buf(15), menu_draw_input@value_buf(15), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), NULL(0), 
;;  from            2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_122(6), STR_121(6), STR_114(6), STR_113(6), 
;;		 -> value_high_tbp(10), value_high_temp(10), STR_99(5), value_back(5), 
;;		 -> STR_95(5), STR_94(5), value_display(10), STR_93(9), 
;;		 -> STR_92(6), STR_91(6), value_rlyslp(10), STR_90(9), 
;;		 -> STR_89(6), STR_88(6), value_rlyplp(10), STR_87(9), 
;;		 -> STR_86(6), STR_85(6), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), STR_77(9), value_sensor(12), 
;;		 -> value_enable(10), NULL(0), STR_25(1), STR_24(1), 
;;		 -> STR_23(5), STR_22(5), STR_21(9), STR_20(1), 
;;		 -> STR_19(1), STR_18(1), STR_17(8), STR_16(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   18[COMRAM] PTR unsigned char 
;;		 -> original_value(10), menu_update_edit_value@value_buf(15), menu_draw_input@value_buf(15), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), NULL(0), 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] PTR unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 3E/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rebuild_input_menu
;;		_menu_draw_input
;;		_menu_update_edit_value
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text16,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
global __ptext16
__ptext16:
psect	text16
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
	
_strcpy:
;incstack = 0
	callstack 27
	line	18
	
l5582:
		movff	(c:strcpy@to),(c:strcpy@cp)
	movff	(c:strcpy@to+1),(c:strcpy@cp+1)

	line	19
	goto	l5586
	line	20
	
l5584:
	infsnz	((c:strcpy@cp))^00h,c
	incf	((c:strcpy@cp+1))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l5586:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movff	(c:strcpy@cp),fsr2l
	movff	(c:strcpy@cp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5957
	tblrd	*
	
	movf	tablat,w
	bra	u5950
u5957:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5950:
	movwf	indf2
	movf	indf2,w
	btfss	status,2
	goto	u5961
	goto	u5960
u5961:
	goto	l5584
u5960:
	line	24
	
l1588:
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
;;  s1              2   14[COMRAM] PTR const unsigned char 
;;		 -> value_high_tbp(10), value_high_temp(10), value_back(5), value_display(10), 
;;		 -> value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), value_sensor(12), value_enable(10), 
;;		 -> NULL(0), 
;;  s2              2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_115(1), STR_25(1), STR_24(1), STR_23(5), 
;;		 -> STR_22(5), STR_21(9), STR_20(1), STR_19(1), 
;;		 -> STR_18(1), STR_17(8), STR_16(9), 
;; Auto vars:     Size  Location     Type
;;  r               1   20[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] int 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 3E/1
;;		On exit  : 3E/0
;;		Unchanged: 3E/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_draw_input
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text17,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
global __ptext17
__ptext17:
psect	text17
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
	
_strcmp:
;incstack = 0
	callstack 27
	line	37
	
l5614:
	goto	l5618
	line	38
	
l5616:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l5618:
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
	goto	u6011
	goto	u6010
u6011:
	goto	l5622
u6010:
	
l5620:
	movff	(c:strcmp@s1),fsr2l
	movff	(c:strcmp@s1+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u6021
	goto	u6020
u6021:
	goto	l5616
u6020:
	line	41
	
l5622:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l1582:
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
;;  sp              2   26[COMRAM] PTR unsigned char 
;;		 -> menu_handle_encoder@buf(50), menu_draw_input@buf(50), menu_draw_input@title(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), rebuild_input_menu@buf_977(50), rebuild_input_menu@buf(30), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), NULL(0), main@buf_522(30), main@buf(40), 
;;  f               2   28[COMRAM] PTR const unsigned char 
;;		 -> STR_128(6), STR_127(6), STR_126(28), STR_112(19), 
;;		 -> STR_111(9), STR_103(10), STR_102(3), STR_101(6), 
;;		 -> STR_100(6), STR_98(12), STR_96(23), STR_84(10), 
;;		 -> STR_83(10), STR_82(3), STR_81(10), STR_80(3), 
;;		 -> STR_79(6), STR_78(6), STR_74(3), STR_12(17), 
;;		 -> STR_11(23), 
;; Auto vars:     Size  Location     Type
;;  tmpval          4    0        struct .
;;  width           2   51[COMRAM] int 
;;  len             2   47[COMRAM] unsigned int 
;;  val             2   45[COMRAM] unsigned int 
;;  cp              2   43[COMRAM] PTR const unsigned char 
;;		 -> STR_140(7), ?_sprintf(2), STR_76(9), STR_75(8), 
;;		 -> STR_72(5), STR_71(8), STR_70(8), STR_69(12), 
;;		 -> STR_68(9), STR_67(11), STR_66(10), STR_65(6), 
;;		 -> STR_64(5), STR_63(7), STR_62(7), STR_61(5), 
;;		 -> STR_60(8), STR_59(8), STR_58(11), STR_57(8), 
;;		 -> STR_56(5), STR_55(7), STR_54(7), STR_53(5), 
;;		 -> STR_52(8), STR_51(9), STR_50(9), STR_49(10), 
;;		 -> STR_48(11), STR_47(10), STR_46(7), STR_45(7), 
;;		 -> STR_44(5), STR_43(8), STR_42(8), STR_41(8), 
;;		 -> STR_40(9), STR_39(6), STR_38(6), STR_37(13), 
;;		 -> STR_36(9), STR_35(12), STR_34(11), STR_33(10), 
;;		 -> STR_32(7), STR_31(7), 
;;  flag            1   50[COMRAM] unsigned char 
;;  c               1   49[COMRAM] unsigned char 
;;  ap              1   42[COMRAM] PTR void [1]
;;		 -> ?_sprintf(2), 
;;  prec            1   41[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  2   26[COMRAM] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         8       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        16       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        27       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       27 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		___lwdiv
;;		___lwmod
;;		___wmul
;;		_isdigit
;; This function is called by:
;;		_main
;;		_rebuild_input_menu
;;		_menu_draw_input
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text18,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
global __ptext18
__ptext18:
psect	text18
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
	
_sprintf:
;incstack = 0
	callstack 27
	line	550
	
l5382:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l5548
	line	555
	
l5384:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u5631
	goto	u5630

u5631:
	goto	l5390
u5630:
	line	558
	
l5386:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l5388:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l5548
	line	563
	
l5390:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	565
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	goto	l5400
	line	578
	
l5392:
	bsf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	579
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	580
	goto	l5400
	line	585
	
l5394:
	bsf	(0+(1/8)+(c:sprintf@flag))^00h,c,(1)&7
	line	586
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	587
	goto	l5400
	line	597
	
l5396:
	bsf	(0+(2/8)+(c:sprintf@flag))^00h,c,(2)&7
	line	598
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	568
	
l5400:
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
; Number of cases is 3, Range of values is 32 to 48
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
;	Chosen strategy is simple_byte

	xorlw	32^0	; case 32
	skipnz
	goto	l5392
	xorlw	43^32	; case 43
	skipnz
	goto	l5394
	xorlw	48^43	; case 48
	skipnz
	goto	l5396
	goto	l839

	line	603
	
l839:
	line	606
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u5641
	goto	u5640
u5641:
	goto	l5404
u5640:
	line	607
	
l5402:
	bcf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	614
	
l5404:
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
	goto	u5651
	goto	u5650
u5651:
	goto	l5452
u5650:
	line	615
	
l5406:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	617
	
l5408:
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
	
l5410:
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

	
l5412:
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	619
	
l5414:
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
	goto	u5661
	goto	u5660
u5661:
	goto	l5408
u5660:
	goto	l5452
	line	760
	
l5416:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l5418:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l5420:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u5671
	goto	u5670

u5671:
	goto	l5424
u5670:
	line	767
	
l5422:
		movlw	low(STR_140)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_140)
	movwf	((c:sprintf@cp+1))^00h,c

	line	771
	
l5424:
	movlw	high(0)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@len))^00h,c
	line	772
	goto	l5428
	line	773
	
l5426:
	infsnz	((c:sprintf@len))^00h,c
	incf	((c:sprintf@len+1))^00h,c
	line	772
	
l5428:
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
	bra	u5687
	tblrd	*
	
	movf	tablat,w
	bra	u5680
u5687:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5680:
	iorlw	0
	btfss	status,2
	goto	u5691
	goto	u5690
u5691:
	goto	l5426
u5690:
	line	783
	
l5430:
		movf	((c:sprintf@width))^00h,c,w
	subwf	((c:sprintf@len))^00h,c,w
	movf	((c:sprintf@width+1))^00h,c,w
	subwfb	((c:sprintf@len+1))^00h,c,w
	btfsc	status,0
	goto	u5701
	goto	u5700

u5701:
	goto	l5434
u5700:
	line	784
	
l5432:
	movf	((c:sprintf@len))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	subwfb	((c:sprintf@width+1))^00h,c

	goto	l5440
	line	786
	
l5434:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	goto	l5440
	line	791
	
l5436:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l5438:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	790
	
l5440:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
		incf	((c:sprintf@width))^00h,c,w
	bnz	u5711
	incf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u5711
	goto	u5710

u5711:
	goto	l5436
u5710:
	goto	l5448
	line	794
	
l5442:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5727
	tblrd	*
	
	movf	tablat,w
	bra	u5720
u5727:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5720:
	movwf	indf2
	
l5444:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l5446:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	793
	
l5448:
	decf	((c:sprintf@len))^00h,c
	btfss	status,0
	decf	((c:sprintf@len+1))^00h,c
		incf	((c:sprintf@len))^00h,c,w
	bnz	u5731
	incf	((c:sprintf@len+1))^00h,c,w
	btfss	status,2
	goto	u5731
	goto	u5730

u5731:
	goto	l5442
u5730:
	goto	l5548
	line	661
	
l5452:
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
	goto	l5550
	xorlw	100^0	; case 100
	skipnz
	goto	l5454
	xorlw	105^100	; case 105
	skipnz
	goto	l5454
	xorlw	115^105	; case 115
	skipnz
	goto	l5416
	goto	l5548

	line	1285
	
l5454:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l5456:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l5458:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u5740
	goto	u5741

u5741:
	goto	l5464
u5740:
	line	1288
	
l5460:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l5462:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	line	1331
	
l5464:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	line	1332
	
l5470:
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
	goto	u5751
	goto	u5750

u5751:
	goto	l5474
u5750:
	goto	l5478
	line	1331
	
l5474:
	incf	((c:sprintf@c))^00h,c
	
l5476:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u5761
	goto	u5760

u5761:
	goto	l5470
u5760:
	line	1371
	
l5478:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u5771
	goto	u5770

u5771:
	goto	l5484
u5770:
	
l5480:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u5781
	goto	u5780
u5781:
	goto	l5484
u5780:
	line	1372
	
l5482:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	line	1407
	
l5484:
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
	goto	u5791
	goto	u5790

u5791:
	goto	l5488
u5790:
	line	1408
	
l5486:
	movf	((c:sprintf@c))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movlw	0
	subwfb	((c:sprintf@width+1))^00h,c
	goto	l5490
	line	1410
	
l5488:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	1413
	
l5490:
	
	btfss	((c:sprintf@flag))^00h,c,(2)&7
	goto	u5801
	goto	u5800
u5801:
	goto	l5516
u5800:
	line	1415
	
l5492:
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u5811
	goto	u5810
u5811:
	goto	l872
u5810:
	line	1416
	
l5494:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u5821
	goto	u5820
u5821:
	goto	l5498
u5820:
	
l5496:
	movlw	high(02Bh)
	movwf	((c:_sprintf$1370+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$1370))^00h,c
	goto	l5500
	
l5498:
	movlw	high(02Dh)
	movwf	((c:_sprintf$1370+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$1370))^00h,c
	
l5500:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$1370),indf2

	
l5502:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l5508
	line	1422
	
l872:
	line	1425
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u5831
	goto	u5830
u5831:
	goto	l5508
u5830:
	line	1426
	
l5504:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l5502
	line	1441
	
l5508:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u5841
	goto	u5840

u5841:
	goto	l5538
u5840:
	line	1443
	
l5510:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(030h)
	movwf	indf2
	
l5512:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1444
	
l5514:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u5851
	goto	u5850

u5851:
	goto	l5510
u5850:
	goto	l5538
	line	1454
	
l5516:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u5861
	goto	u5860

u5861:
	goto	l883
u5860:
	line	1456
	
l5518:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l5520:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1457
	
l5522:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u5871
	goto	u5870

u5871:
	goto	l5518
u5870:
	
l883:
	line	1460
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u5881
	goto	u5880
u5881:
	goto	l886
u5880:
	line	1461
	
l5524:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u5891
	goto	u5890
u5891:
	goto	l5528
u5890:
	
l5526:
	movlw	high(02Bh)
	movwf	((c:_sprintf$1371+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$1371))^00h,c
	goto	l5530
	
l5528:
	movlw	high(02Dh)
	movwf	((c:_sprintf$1371+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$1371))^00h,c
	
l5530:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$1371),indf2

	
l5532:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l5538
	line	1469
	
l886:
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u5901
	goto	u5900
u5901:
	goto	l5538
u5900:
	line	1470
	
l5534:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l5532
	line	1498
	
l5538:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l5546
	line	1515
	
l5540:
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
	
l5542:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l5544:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l5546:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u5911
	goto	u5910

u5911:
	goto	l5540
u5910:
	line	553
	
l5548:
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
	goto	u5921
	goto	u5920
u5921:
	goto	l5384
u5920:
	line	1564
	
l5550:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	clrf	indf2
	line	1567
	
l897:
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
;;  c               1   16[COMRAM] unsigned char 
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text19,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
global __ptext19
__ptext19:
psect	text19
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
	
_isdigit:
;incstack = 0
	callstack 27
	movwf	((c:isdigit@c))^00h,c
	line	14
	
l5320:
	movlw	low(0)
	movwf	((c:_isdigit$1813))^00h,c
	
l5322:
		movlw	03Ah-0
	cpfslt	((c:isdigit@c))^00h,c
	goto	u5551
	goto	u5550

u5551:
	goto	l5328
u5550:
	
l5324:
		movlw	030h-1
	cpfsgt	((c:isdigit@c))^00h,c
	goto	u5561
	goto	u5560

u5561:
	goto	l5328
u5560:
	
l5326:
	movlw	low(01h)
	movwf	((c:_isdigit$1813))^00h,c
	
l5328:
	movff	(c:_isdigit$1813),??_isdigit+0+0
	rrcf	(??_isdigit+0+0)^00h,c,w
	line	15
	
l1568:
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
;;  multiplier      2   14[COMRAM] unsigned int 
;;  multiplicand    2   16[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2   18[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] unsigned int 
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text20,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
global __ptext20
__ptext20:
psect	text20
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
	
___wmul:
;incstack = 0
	callstack 27
	line	37
	
l5332:
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
	
l5334:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	line	53
	
l900:
	return	;funcret
	callstack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	_lcd_print_at

;; *************** function _lcd_print_at *****************
;; Defined at:
;;		line 137 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   20[COMRAM] unsigned char 
;;  str             2   21[COMRAM] PTR const unsigned char 
;;		 -> STR_138(2), STR_137(5), STR_136(5), STR_135(9), 
;;		 -> STR_134(5), STR_133(6), STR_132(8), STR_131(8), 
;;		 -> STR_130(8), STR_129(6), menu_draw_input@value_buf(15), menu_draw_input@title(10), 
;;		 -> STR_109(2), STR_108(8), STR_72(5), STR_71(8), 
;;		 -> STR_70(8), STR_69(12), STR_68(9), STR_67(11), 
;;		 -> STR_66(10), STR_65(6), STR_64(5), STR_63(7), 
;;		 -> STR_62(7), STR_61(5), STR_60(8), STR_59(8), 
;;		 -> STR_58(11), STR_57(8), STR_56(5), STR_55(7), 
;;		 -> STR_54(7), STR_53(5), STR_52(8), STR_51(9), 
;;		 -> STR_50(9), STR_49(10), STR_48(11), STR_47(10), 
;;		 -> STR_46(7), STR_45(7), STR_44(5), STR_43(8), 
;;		 -> STR_42(8), STR_41(8), STR_40(9), STR_39(6), 
;;		 -> STR_38(6), STR_37(13), STR_36(9), STR_35(12), 
;;		 -> STR_34(11), STR_33(10), STR_32(7), STR_31(7), 
;;		 -> STR_30(5), STR_29(6), STR_28(13), STR_27(11), 
;;		 -> STR_26(10), 
;; Auto vars:     Size  Location     Type
;;  row             1   23[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_lcd_print
;;		_lcd_set_cursor
;; This function is called by:
;;		_menu_draw_options
;;		_menu_draw_input
;;		_menu_draw_setup
;; This function uses a non-reentrant model
;;
psect	text21,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	137
global __ptext21
__ptext21:
psect	text21
	file	"src\menu.c"
	line	137
	
_lcd_print_at:
;incstack = 0
	callstack 23
	movwf	((c:lcd_print_at@row))^00h,c
	line	139
	
l5554:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	140
	
l5556:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	141
	
l388:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print_at
	__end_of_lcd_print_at:
	signat	_lcd_print_at,12409
	global	_lcd_clear_line

;; *************** function _lcd_clear_line *****************
;; Defined at:
;;		line 144 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  row             1   20[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
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
	line	144
global __ptext22
__ptext22:
psect	text22
	file	"src\menu.c"
	line	144
	
_lcd_clear_line:
;incstack = 0
	callstack 23
	movwf	((c:lcd_clear_line@row))^00h,c
	line	146
	
l5558:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	147
	
l5560:
		movlw	low(STR_73)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_73)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	148
	
l391:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear_line
	__end_of_lcd_clear_line:
	signat	_lcd_clear_line,4217
	global	_lcd_set_cursor

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 162 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   17[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  row             1   18[COMRAM] unsigned char 
;;  address         1   19[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_lcd_cmd
;; This function is called by:
;;		_main
;;		_lcd_print_at
;;		_lcd_clear_line
;;		_menu_update_numeric_value
;;		_menu_draw_input
;;		_menu_update_edit_value
;; This function uses a non-reentrant model
;;
psect	text23,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	162
global __ptext23
__ptext23:
psect	text23
	file	"src\main.c"
	line	162
	
_lcd_set_cursor:
;incstack = 0
	callstack 25
	movwf	((c:lcd_set_cursor@row))^00h,c
	line	165
	
l5296:
	goto	l5310
	line	168
	
l5298:
	movlw	low(080h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	169
	goto	l5312
	line	171
	
l5300:
	movlw	low(0C0h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	172
	goto	l5312
	line	174
	
l5302:
	movlw	low(094h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	175
	goto	l5312
	line	177
	
l5304:
	movlw	low(0D4h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	178
	goto	l5312
	line	165
	
l5310:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l5298
	xorlw	1^0	; case 1
	skipnz
	goto	l5300
	xorlw	2^1	; case 2
	skipnz
	goto	l5302
	xorlw	3^2	; case 3
	skipnz
	goto	l5304
	goto	l5298

	line	183
	
l5312:
	movf	((c:lcd_set_cursor@address))^00h,c,w
	addwf	((c:lcd_set_cursor@col))^00h,c,w
	
	call	_lcd_cmd
	line	184
	
l150:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
	signat	_lcd_set_cursor,8313
	global	_lcd_print

;; *************** function _lcd_print *****************
;; Defined at:
;;		line 148 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_139(2), STR_138(2), STR_137(5), STR_136(5), 
;;		 -> STR_135(9), STR_134(5), STR_133(6), STR_132(8), 
;;		 -> STR_131(8), STR_130(8), STR_129(6), STR_125(2), 
;;		 -> STR_124(2), STR_123(11), menu_update_edit_value@value_buf(15), STR_120(2), 
;;		 -> STR_119(2), STR_118(2), STR_117(2), menu_draw_input@value_buf(15), 
;;		 -> menu_draw_input@title(10), STR_110(2), STR_109(2), STR_108(8), 
;;		 -> STR_107(2), STR_106(2), STR_105(7), menu_update_numeric_value@value_buf(5), 
;;		 -> STR_73(21), STR_72(5), STR_71(8), STR_70(8), 
;;		 -> STR_69(12), STR_68(9), STR_67(11), STR_66(10), 
;;		 -> STR_65(6), STR_64(5), STR_63(7), STR_62(7), 
;;		 -> STR_61(5), STR_60(8), STR_59(8), STR_58(11), 
;;		 -> STR_57(8), STR_56(5), STR_55(7), STR_54(7), 
;;		 -> STR_53(5), STR_52(8), STR_51(9), STR_50(9), 
;;		 -> STR_49(10), STR_48(11), STR_47(10), STR_46(7), 
;;		 -> STR_45(7), STR_44(5), STR_43(8), STR_42(8), 
;;		 -> STR_41(8), STR_40(9), STR_39(6), STR_38(6), 
;;		 -> STR_37(13), STR_36(9), STR_35(12), STR_34(11), 
;;		 -> STR_33(10), STR_32(7), STR_31(7), STR_30(5), 
;;		 -> STR_29(6), STR_28(13), STR_27(11), STR_26(10), 
;;		 -> STR_15(8), STR_14(12), STR_4(16), STR_3(13), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;;		_lcd_print_at
;;		_lcd_clear_line
;;		_menu_update_numeric_value
;;		_menu_draw_options
;;		_menu_draw_input
;;		_menu_update_edit_value
;;		_menu_draw_setup
;; This function uses a non-reentrant model
;;
psect	text24,class=CODE,space=0,reloc=2,group=0
	line	148
global __ptext24
__ptext24:
psect	text24
	file	"src\main.c"
	line	148
	
_lcd_print:
;incstack = 0
	callstack 25
	line	150
	
l5288:
	goto	l5294
	line	152
	
l5290:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5517
	tblrd	*
	
	movf	tablat,w
	bra	u5510
u5517:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5510:
	
	call	_lcd_data
	
l5292:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	150
	
l5294:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5527
	tblrd	*
	
	movf	tablat,w
	bra	u5520
u5527:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5520:
	iorlw	0
	btfss	status,2
	goto	u5531
	goto	u5530
u5531:
	goto	l5290
u5530:
	line	154
	
l137:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print
	__end_of_lcd_print:
	signat	_lcd_print,4217
	global	_lcd_data

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 140 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1   15[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_lcd_write_nibble
;; This function is called by:
;;		_lcd_print
;; This function uses a non-reentrant model
;;
psect	text25,class=CODE,space=0,reloc=2,group=0
	line	140
global __ptext25
__ptext25:
psect	text25
	file	"src\main.c"
	line	140
	
_lcd_data:
;incstack = 0
	callstack 25
	movwf	((c:lcd_data@data))^00h,c
	line	142
	
l5274:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	143
	
l5276:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	144
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	145
	
l5278:
	asmopt push
asmopt off
	movlw	133
u7947:
decfsz	wreg,f
	bra	u7947
	nop
asmopt pop

	line	146
	
l131:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
	signat	_lcd_data,4217
	global	_get_item_options

;; *************** function _get_item_options *****************
;; Defined at:
;;		line 151 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  item_index      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  item_index      1   16[COMRAM] unsigned char 
;;  i               1   17[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] PTR const struct .
;; Registers used:
;;		wreg, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh
;; Tracked objects:
;;		On entry : 3E/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_draw_input
;;		_menu_update_edit_value
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text26,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	151
global __ptext26
__ptext26:
psect	text26
	file	"src\menu.c"
	line	151
	
_get_item_options:
;incstack = 0
	callstack 27
	movwf	((c:get_item_options@item_index))^00h,c
	line	153
	
l5562:
	movlw	low(0)
	movwf	((c:get_item_options@i))^00h,c
	line	155
	
l5568:
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
	goto	u5931
	goto	u5930
u5931:
	goto	l5574
u5930:
	line	157
	
l5570:
	movf	((c:get_item_options@i))^00h,c,w
	mullw	0Ch
	movlw	low(_menu_item_options)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:?_get_item_options))^00h,c
	movlw	high(_menu_item_options)
	addwfc	prod+1,w
	movwf	1+((c:?_get_item_options))^00h,c
	goto	l397
	line	153
	
l5574:
	incf	((c:get_item_options@i))^00h,c
	
l5576:
		movlw	02h-1
	cpfsgt	((c:get_item_options@i))^00h,c
	goto	u5941
	goto	u5940

u5941:
	goto	l5568
u5940:
	line	160
	
l5578:
		movlw	low(0)
	movwf	((c:?_get_item_options))^00h,c
	movlw	high(0)
	movwf	((c:?_get_item_options+1))^00h,c

	line	161
	
l397:
	return	;funcret
	callstack 0
GLOBAL	__end_of_get_item_options
	__end_of_get_item_options:
	signat	_get_item_options,4218
	global	_init_numeric_editor

;; *************** function _init_numeric_editor *****************
;; Defined at:
;;		line 272 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  value           2   26[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;  abs_value       2   28[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 3F/0
;;		On exit  : 3F/1
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		___lwdiv
;;		___lwmod
;;		_abs
;; This function is called by:
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text27,class=CODE,space=0,reloc=2,group=0
	line	272
global __ptext27
__ptext27:
psect	text27
	file	"src\menu.c"
	line	272
	
_init_numeric_editor:
;incstack = 0
	callstack 26
	line	275
	
l6064:; BSR set to: 0

	movff	(c:init_numeric_editor@value),0+(_menu+0Dh)
	movff	(c:init_numeric_editor@value+1),1+(_menu+0Dh)
	line	278
	
l6066:; BSR set to: 0

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u6521
	goto	u6520

u6521:
	movlw	1
	goto	u6530
u6520:
	movlw	0
u6530:
	movlb	1	; () banked
	movwf	(0+(_menu+09h))&0ffh
	line	279
	
l6068:; BSR set to: 1

	movff	(c:init_numeric_editor@value),(c:abs@a)
	movff	(c:init_numeric_editor@value+1),(c:abs@a+1)
	call	_abs	;wreg free
	movff	0+?_abs,(c:init_numeric_editor@abs_value)
	movff	1+?_abs,(c:init_numeric_editor@abs_value+1)
	line	280
	
l6070:; BSR set to: 1

	movff	(c:init_numeric_editor@abs_value),(c:___lwdiv@dividend)
	movff	(c:init_numeric_editor@abs_value+1),(c:___lwdiv@dividend+1)
	movlw	high(064h)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(064h)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	movlb	1	; () banked
	movwf	(0+(_menu+0Ah))&0ffh
	line	281
	
l6072:; BSR set to: 1

	movlw	high(0Ah)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwdiv@divisor))^00h,c
	movff	(c:init_numeric_editor@abs_value),(c:___lwdiv@dividend)
	movff	(c:init_numeric_editor@abs_value+1),(c:___lwdiv@dividend+1)
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:___lwmod@dividend)
	movff	1+?___lwdiv,(c:___lwmod@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	movlb	1	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	line	282
	
l6074:; BSR set to: 1

	movff	(c:init_numeric_editor@abs_value),(c:___lwmod@dividend)
	movff	(c:init_numeric_editor@abs_value+1),(c:___lwmod@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	movlb	1	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	line	285
	
l6076:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+08h))&0ffh
	line	286
	
l445:; BSR set to: 1

	return	;funcret
	callstack 0
GLOBAL	__end_of_init_numeric_editor
	__end_of_init_numeric_editor:
	signat	_init_numeric_editor,4217
	global	_abs

;; *************** function _abs *****************
;; Defined at:
;;		line 4 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\abs.c"
;; Parameters:    Size  Location     Type
;;  a               2   14[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 3F/1
;;		Unchanged: 3F/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init_numeric_editor
;; This function uses a non-reentrant model
;;
psect	text28,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\abs.c"
	line	4
global __ptext28
__ptext28:
psect	text28
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\abs.c"
	line	4
	
_abs:; BSR set to: 1

;incstack = 0
	callstack 26
	line	6
	
l5600:; BSR set to: 1

	btfsc	((c:abs@a+1))^00h,c,7
	goto	u5980
	goto	u5981

u5981:
	goto	l1562
u5980:
	line	7
	
l5602:; BSR set to: 1

	movff	(c:abs@a),??_abs+0+0
	movff	(c:abs@a+1),??_abs+0+0+1
	comf	(??_abs+0+0)^00h,c
	comf	(??_abs+0+1)^00h,c
	infsnz	(??_abs+0+0)^00h,c
	incf	(??_abs+0+1)^00h,c
	movff	??_abs+0+0,(c:?_abs)
	movff	??_abs+0+1,(c:?_abs+1)
	goto	l1563
	
l1562:; BSR set to: 1

	line	8
	movff	(c:abs@a),(c:?_abs)
	movff	(c:abs@a+1),(c:?_abs+1)
	line	9
	
l1563:; BSR set to: 1

	return	;funcret
	callstack 0
GLOBAL	__end_of_abs
	__end_of_abs:
	signat	_abs,4218
	global	___lwmod

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 7 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        2   21[COMRAM] unsigned int 
;;  divisor         2   23[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   25[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   21[COMRAM] unsigned int 
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rebuild_input_menu
;;		_init_numeric_editor
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text29,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext29
__ptext29:
psect	text29
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
___lwmod:; BSR set to: 1

;incstack = 0
	callstack 27
	line	12
	
l5360:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u5601
	goto	u5600

u5601:
	goto	l1389
u5600:
	line	13
	
l5362:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l5366
	line	15
	
l5364:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l5366:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u5611
	goto	u5610
u5611:
	goto	l5364
u5610:
	line	19
	
l5368:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u5621
	goto	u5620

u5621:
	goto	l5372
u5620:
	line	20
	
l5370:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l5372:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l5374:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l5368
	line	23
	
l1389:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l1396:
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
;;  dividend        2   14[COMRAM] unsigned int 
;;  divisor         2   16[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   19[COMRAM] unsigned int 
;;  counter         1   18[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] unsigned int 
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rebuild_input_menu
;;		_init_numeric_editor
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text30,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
global __ptext30
__ptext30:
psect	text30
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
	
___lwdiv:
;incstack = 0
	callstack 27
	line	13
	
l5338:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l5340:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u5571
	goto	u5570

u5571:
	goto	l1379
u5570:
	line	15
	
l5342:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l5346
	line	17
	
l5344:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l5346:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u5581
	goto	u5580
u5581:
	goto	l5344
u5580:
	line	21
	
l5348:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l5350:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u5591
	goto	u5590

u5591:
	goto	l5356
u5590:
	line	23
	
l5352:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l5354:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l5356:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l5358:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l5348
	line	28
	
l1379:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l1386:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_get_current_numeric_value

;; *************** function _get_current_numeric_value *****************
;; Defined at:
;;		line 289 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  value           2   22[COMRAM] int 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] int 
;; Registers used:
;;		wreg, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 3F/1
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        10       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text31,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	289
global __ptext31
__ptext31:
psect	text31
	file	"src\menu.c"
	line	289
	
_get_current_numeric_value:
;incstack = 0
	callstack 27
	line	291
	
l6078:; BSR set to: 1

	movf	(0+(_menu+0Bh))&0ffh,w
	mullw	0Ah
	movff	prodl,??_get_current_numeric_value+0+0
	movff	prodh,??_get_current_numeric_value+0+0+1
	movf	(0+(_menu+0Ah))&0ffh,w
	mullw	064h
	movff	prodl,??_get_current_numeric_value+2+0
	movff	prodh,??_get_current_numeric_value+2+0+1
	movf	(??_get_current_numeric_value+0+0)^00h,c,w
	addwf	(??_get_current_numeric_value+2+0)^00h,c,w
	movwf	(??_get_current_numeric_value+4+0)^00h,c
	movf	(??_get_current_numeric_value+0+1)^00h,c,w
	addwfc	(??_get_current_numeric_value+2+1)^00h,c,w
	movwf	1+(??_get_current_numeric_value+4+0)^00h,c
	movf	(0+(_menu+0Ch))&0ffh,w
	addwf	(??_get_current_numeric_value+4+0)^00h,c,w
	movwf	((c:get_current_numeric_value@value))^00h,c
	movlw	0
	addwfc	(??_get_current_numeric_value+4+1)^00h,c,w
	movwf	1+((c:get_current_numeric_value@value))^00h,c
	line	292
	
l6080:; BSR set to: 1

	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u6541
	goto	u6540
u6541:
	goto	l6084
u6540:
	line	293
	
l6082:; BSR set to: 1

	negf	((c:get_current_numeric_value@value))^00h,c
	comf	((c:get_current_numeric_value@value+1))^00h,c
	btfsc	status,0
	incf	((c:get_current_numeric_value@value+1))^00h,c
	line	294
	
l6084:; BSR set to: 1

	movff	(c:get_current_numeric_value@value),(c:?_get_current_numeric_value)
	movff	(c:get_current_numeric_value@value+1),(c:?_get_current_numeric_value+1)
	line	295
	
l449:; BSR set to: 1

	return	;funcret
	callstack 0
GLOBAL	__end_of_get_current_numeric_value
	__end_of_get_current_numeric_value:
	signat	_get_current_numeric_value,90
	global	_beep

;; *************** function _beep *****************
;; Defined at:
;;		line 224 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  duration_ms     2   14[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2   17[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text32,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	224
global __ptext32
__ptext32:
psect	text32
	file	"src\main.c"
	line	224
	
_beep:; BSR set to: 1

;incstack = 0
	callstack 27
	line	226
	
l5684:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	227
	
l5686:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l156
	line	229
	
l5688:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u7957:
decfsz	wreg,f
	bra	u7957
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u7957
	nop2
asmopt pop

	line	227
	
l5690:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l156:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u6071
	goto	u6070

u6071:
	goto	l5688
u6070:
	
l158:
	line	231
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	232
	
l159:
	return	;funcret
	callstack 0
GLOBAL	__end_of_beep
	__end_of_beep:
	signat	_beep,4217
	global	_lcd_init

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 186 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_lcd_cmd
;;		_lcd_write_nibble
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text33,class=CODE,space=0,reloc=2,group=0
	line	186
global __ptext33
__ptext33:
psect	text33
	file	"src\main.c"
	line	186
	
_lcd_init:
;incstack = 0
	callstack 26
	line	189
	
l6150:; BSR set to: 1

	movlw	low(010h)
	movwf	((c:3986))^0f00h,c	;volatile
	line	190
	movlw	low(046h)
	movwf	((c:3987))^0f00h,c	;volatile
	line	191
	movlw	low(0)
	movwf	((c:3988))^0f00h,c	;volatile
	line	194
	movlw	low(0)
	movwf	((c:3968))^0f00h,c	;volatile
	line	195
	movlw	low(0)
	movwf	((c:3969))^0f00h,c	;volatile
	line	196
	movlw	low(0)
	movwf	((c:3970))^0f00h,c	;volatile
	line	198
	
l6152:; BSR set to: 1

	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u7967:
decfsz	wreg,f
	bra	u7967
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u7967
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u7967
	nop
asmopt pop

	line	200
	
l6154:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	203
	
l6156:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	204
	
l6158:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u7977:
decfsz	wreg,f
	bra	u7977
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u7977
asmopt pop

	line	205
	
l6160:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	206
	
l6162:
	asmopt push
asmopt off
	movlw	240
u7987:
	nop2
decfsz	wreg,f
	bra	u7987
asmopt pop

	line	207
	
l6164:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	208
	
l6166:
	asmopt push
asmopt off
	movlw	240
u7997:
	nop2
decfsz	wreg,f
	bra	u7997
asmopt pop

	line	211
	
l6168:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	212
	
l6170:
	asmopt push
asmopt off
	movlw	240
u8007:
	nop2
decfsz	wreg,f
	bra	u8007
asmopt pop

	line	215
	
l6172:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	216
	
l6174:
	movlw	(08h)&0ffh
	
	call	_lcd_cmd
	line	217
	
l6176:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	218
	
l6178:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_init+0+0)^00h,c
	movlw	198
u8017:
decfsz	wreg,f
	bra	u8017
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u8017
	nop2
asmopt pop

	line	219
	
l6180:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	220
	
l6182:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	221
	
l153:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
	signat	_lcd_init,89
	global	_lcd_clear

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 156 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_lcd_cmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text34,class=CODE,space=0,reloc=2,group=0
	line	156
global __ptext34
__ptext34:
psect	text34
	file	"src\main.c"
	line	156
	
_lcd_clear:
;incstack = 0
	callstack 26
	line	158
	
l6146:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	159
	
l6148:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u8027:
decfsz	wreg,f
	bra	u8027
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u8027
	nop2
asmopt pop

	line	160
	
l140:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
	signat	_lcd_clear,89
	global	_lcd_cmd

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 124 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1   16[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_lcd_write_nibble
;; This function is called by:
;;		_lcd_clear
;;		_lcd_set_cursor
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text35,class=CODE,space=0,reloc=2,group=0
	line	124
global __ptext35
__ptext35:
psect	text35
	file	"src\main.c"
	line	124
	
_lcd_cmd:
;incstack = 0
	callstack 25
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	126
	
l5262:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	127
	
l5264:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	128
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	130
	
l5266:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u5461
	goto	u5460

u5461:
	goto	l5270
u5460:
	
l5268:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u5471
	goto	u5470

u5471:
	goto	l5272
u5470:
	line	132
	
l5270:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u8037:
decfsz	wreg,f
	bra	u8037
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u8037
	nop2
asmopt pop

	line	133
	goto	l128
	line	136
	
l5272:
	asmopt push
asmopt off
	movlw	133
u8047:
decfsz	wreg,f
	bra	u8047
	nop
asmopt pop

	line	138
	
l128:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
	signat	_lcd_cmd,4217
	global	_lcd_write_nibble

;; *************** function _lcd_write_nibble *****************
;; Defined at:
;;		line 99 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  nibble          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  nibble          1   14[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, cstack
;; Tracked objects:
;;		On entry : 0/1
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
;;		Nothing
;; This function is called by:
;;		_lcd_cmd
;;		_lcd_data
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text36,class=CODE,space=0,reloc=2,group=0
	line	99
global __ptext36
__ptext36:
psect	text36
	file	"src\main.c"
	line	99
	
_lcd_write_nibble:
;incstack = 0
	callstack 25
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	101
	
l5240:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u5411
	goto	u5410
u5411:
	goto	l113
u5410:
	line	102
	
l5242:
	bsf	((c:3977))^0f00h,c,0	;volatile
	goto	l5244
	line	103
	
l113:
	line	104
	bcf	((c:3977))^0f00h,c,0	;volatile
	line	105
	
l5244:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u5421
	goto	u5420
u5421:
	goto	l115
u5420:
	line	106
	
l5246:
	bsf	((c:3977))^0f00h,c,1	;volatile
	goto	l5248
	line	107
	
l115:
	line	108
	bcf	((c:3977))^0f00h,c,1	;volatile
	line	109
	
l5248:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u5431
	goto	u5430
u5431:
	goto	l117
u5430:
	line	110
	
l5250:
	bsf	((c:3977))^0f00h,c,2	;volatile
	goto	l5252
	line	111
	
l117:
	line	112
	bcf	((c:3977))^0f00h,c,2	;volatile
	line	113
	
l5252:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u5441
	goto	u5440
u5441:
	goto	l119
u5440:
	line	114
	
l5254:
	bsf	((c:3977))^0f00h,c,3	;volatile
	goto	l120
	line	115
	
l119:
	line	116
	bcf	((c:3977))^0f00h,c,3	;volatile
	
l120:
	line	118
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	119
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	120
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	121
	
l5256:
	asmopt push
asmopt off
	movlw	133
u8057:
decfsz	wreg,f
	bra	u8057
	nop
asmopt pop

	line	122
	
l121:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_write_nibble
	__end_of_lcd_write_nibble:
	signat	_lcd_write_nibble,4217
	global	_handle_numeric_rotation

;; *************** function _handle_numeric_rotation *****************
;; Defined at:
;;		line 298 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  direction       1    wreg     char 
;; Auto vars:     Size  Location     Type
;;  direction       1   17[COMRAM] char 
;;  max_tens        1   16[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3F/2
;;		On exit  : 3F/1
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text37,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	298
global __ptext37
__ptext37:
psect	text37
	file	"src\menu.c"
	line	298
	
_handle_numeric_rotation:
;incstack = 0
	callstack 28
	movwf	((c:handle_numeric_rotation@direction))^00h,c
	line	300
	
l6230:
	goto	l6308
	line	303
	
l6232:; BSR set to: 1

	movf	((c:handle_numeric_rotation@direction))^00h,c,w
	btfsc	status,2
	goto	u6641
	goto	u6640
u6641:
	goto	l484
u6640:
	line	304
	
l6234:; BSR set to: 1

	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u6651
	goto	u6650
u6651:
	movlw	1
	goto	u6660
u6650:
	movlw	0
u6660:
	movwf	(0+(_menu+09h))&0ffh
	goto	l484
	line	308
	
l6236:; BSR set to: 1

		movf	((c:handle_numeric_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u6671
	goto	u6670

u6671:
	goto	l6244
u6670:
	line	310
	
l6238:; BSR set to: 1

	incf	(0+(_menu+0Ah))&0ffh
	line	311
	
l6240:; BSR set to: 1

		movlw	06h-1
	cpfsgt	(0+(_menu+0Ah))&0ffh
	goto	u6681
	goto	u6680

u6681:
	goto	l484
u6680:
	line	312
	
l6242:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l484
	line	314
	
l6244:; BSR set to: 1

	btfsc	((c:handle_numeric_rotation@direction))^00h,c,7
	goto	u6690
	goto	u6691

u6691:
	goto	l484
u6690:
	line	316
	
l6246:; BSR set to: 1

	movf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u6701
	goto	u6700
u6701:
	goto	l6250
u6700:
	line	317
	
l6248:; BSR set to: 1

	movlw	low(05h)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l484
	line	319
	
l6250:; BSR set to: 1

	decf	(0+(_menu+0Ah))&0ffh
	goto	l484
	line	326
	
l6252:; BSR set to: 1

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u6711
	goto	u6710

u6711:
	goto	l6256
u6710:
	
l6254:; BSR set to: 1

	movlw	high(09h)
	movwf	((c:_handle_numeric_rotation$992+1))^00h,c
	movlw	low(09h)
	movwf	((c:_handle_numeric_rotation$992))^00h,c
	goto	l6258
	
l6256:; BSR set to: 1

	movlw	high(0)
	movwf	((c:_handle_numeric_rotation$992+1))^00h,c
	movlw	low(0)
	movwf	((c:_handle_numeric_rotation$992))^00h,c
	
l6258:; BSR set to: 1

	movff	(c:_handle_numeric_rotation$992),(c:handle_numeric_rotation@max_tens)
	line	327
	
l6260:; BSR set to: 1

		movf	((c:handle_numeric_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u6721
	goto	u6720

u6721:
	goto	l6272
u6720:
	line	329
	
l6262:; BSR set to: 1

	movf	((c:handle_numeric_rotation@max_tens))^00h,c,w
	btfss	status,2
	goto	u6731
	goto	u6730
u6731:
	goto	l6266
u6730:
	goto	l484
	line	331
	
l6266:; BSR set to: 1

	incf	(0+(_menu+0Bh))&0ffh
	line	332
	
l6268:; BSR set to: 1

		movf	(0+(_menu+0Bh))&0ffh,w
	subwf	((c:handle_numeric_rotation@max_tens))^00h,c,w
	btfsc	status,0
	goto	u6741
	goto	u6740

u6741:
	goto	l484
u6740:
	line	333
	
l6270:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+0Bh))&0ffh
	goto	l484
	line	335
	
l6272:; BSR set to: 1

	btfsc	((c:handle_numeric_rotation@direction))^00h,c,7
	goto	u6750
	goto	u6751

u6751:
	goto	l484
u6750:
	line	337
	
l6274:; BSR set to: 1

	movf	((c:handle_numeric_rotation@max_tens))^00h,c,w
	btfss	status,2
	goto	u6761
	goto	u6760
u6761:
	goto	l6278
u6760:
	goto	l484
	line	339
	
l6278:; BSR set to: 1

	movf	(0+(_menu+0Bh))&0ffh,w
	btfss	status,2
	goto	u6771
	goto	u6770
u6771:
	goto	l6282
u6770:
	line	340
	
l6280:; BSR set to: 1

	movff	(c:handle_numeric_rotation@max_tens),0+(_menu+0Bh)
	goto	l484
	line	342
	
l6282:; BSR set to: 1

	decf	(0+(_menu+0Bh))&0ffh
	goto	l484
	line	350
	
l6284:; BSR set to: 1

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u6781
	goto	u6780

u6781:
	goto	l6290
u6780:
	
l6286:; BSR set to: 1

	movf	(0+(_menu+0Bh))&0ffh,w
	btfss	status,2
	goto	u6791
	goto	u6790
u6791:
	goto	l6290
u6790:
	line	352
	
l6288:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+0Ch))&0ffh
	line	353
	goto	l484
	line	357
	
l6290:; BSR set to: 1

		movf	((c:handle_numeric_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u6801
	goto	u6800

u6801:
	goto	l6298
u6800:
	line	359
	
l6292:; BSR set to: 1

	incf	(0+(_menu+0Ch))&0ffh
	line	360
	
l6294:; BSR set to: 1

		movlw	0Ah-1
	cpfsgt	(0+(_menu+0Ch))&0ffh
	goto	u6811
	goto	u6810

u6811:
	goto	l484
u6810:
	goto	l6288
	line	363
	
l6298:; BSR set to: 1

	btfsc	((c:handle_numeric_rotation@direction))^00h,c,7
	goto	u6820
	goto	u6821

u6821:
	goto	l484
u6820:
	line	365
	
l6300:; BSR set to: 1

	movf	(0+(_menu+0Ch))&0ffh,w
	btfss	status,2
	goto	u6831
	goto	u6830
u6831:
	goto	l6304
u6830:
	line	366
	
l6302:; BSR set to: 1

	movlw	low(09h)
	movwf	(0+(_menu+0Ch))&0ffh
	goto	l484
	line	368
	
l6304:; BSR set to: 1

	decf	(0+(_menu+0Ch))&0ffh
	goto	l484
	line	300
	
l6308:
	movlb	1	; () banked
	movf	(0+(_menu+08h))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l6232
	xorlw	1^0	; case 1
	skipnz
	goto	l6236
	xorlw	2^1	; case 2
	skipnz
	goto	l6252
	xorlw	3^2	; case 3
	skipnz
	goto	l6284
	goto	l484

	line	373
	
l484:; BSR set to: 1

	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_numeric_rotation
	__end_of_handle_numeric_rotation:
	signat	_handle_numeric_rotation,4217
	global	_encoder_init

;; *************** function _encoder_init *****************
;; Defined at:
;;		line 164 in file "src\encoder.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3F/3
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text38,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	164
global __ptext38
__ptext38:
psect	text38
	file	"src\encoder.c"
	line	164
	
_encoder_init:; BSR set to: 1

;incstack = 0
	callstack 28
	line	167
	
l6218:; BSR set to: 3

	movlw	low(0C4h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	168
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	171
	movlw	high(0)
	movlb	1	; () banked
	movwf	((_encoder_count+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_encoder_count))&0ffh	;volatile
	line	172
	movlw	low(0)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	173
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	174
	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	177
	
l6220:; BSR set to: 1

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	178
	
l6222:; BSR set to: 1

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	179
	
l6224:; BSR set to: 1

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	182
	
l6226:; BSR set to: 1

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u6621
	goto	u6620
u6621:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u6628
u6620:
	clrf	(??_encoder_init+0+0)^00h,c
u6628:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u6631
	goto	u6630
u6631:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u6638
u6630:
	clrf	(??_encoder_init+1+0)^00h,c
u6638:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:_enc_state))^00h,c
	line	183
	
l286:
	return	;funcret
	callstack 0
GLOBAL	__end_of_encoder_init
	__end_of_encoder_init:
	signat	_encoder_init,89
	global	_eeprom_init

;; *************** function _eeprom_init *****************
;; Defined at:
;;		line 180 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   34[COMRAM] unsigned char 
;;  calculated_c    2   32[COMRAM] unsigned int 
;;  stored_check    2   30[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 3F/3
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
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
psect	text39,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	180
global __ptext39
__ptext39:
psect	text39
	file	"src\eeprom.c"
	line	180
	
_eeprom_init:
;incstack = 0
	callstack 25
	line	182
	
l6184:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	185
	
l6186:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	189
	
l6192:
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
	line	185
	
l6194:
	incf	((c:eeprom_init@i))^00h,c
	
l6196:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u6581
	goto	u6580

u6581:
	goto	l6192
u6580:
	line	191
	
l6198:
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
	line	193
	
l6200:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	195
	
l6202:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u6590
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u6591
	goto	u6590

u6591:
	goto	l6208
u6590:
	line	198
	
l6204:
	call	_load_factory_defaults	;wreg free
	line	199
	
l6206:
	call	_save_current_config	;wreg free
	line	203
	
l6208:
	call	_sync_menu_variables	;wreg free
	line	207
	
l6210:
	movlb	3	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	mullw	02h
	movff	prodl,(c:_menu_timeout_seconds)
	movff	prodh,(c:_menu_timeout_seconds+1)
	line	210
	
l6212:; BSR set to: 3

		movf	((c:_menu_timeout_seconds+1))^00h,c,w
	bnz	u6600
	movlw	10
	subwf	 ((c:_menu_timeout_seconds))^00h,c,w
	btfss	status,0
	goto	u6601
	goto	u6600

u6601:
	goto	l6216
u6600:
	
l6214:; BSR set to: 3

		incf	((c:_menu_timeout_seconds))^00h,c,w
	movlw	1
	subwfb	((c:_menu_timeout_seconds+1))^00h,c,w
	btfss	status,0
	goto	u6611
	goto	u6610

u6611:
	goto	l800
u6610:
	line	212
	
l6216:; BSR set to: 3

	movlw	high(01Eh)
	movwf	((c:_menu_timeout_seconds+1))^00h,c
	movlw	low(01Eh)
	movwf	((c:_menu_timeout_seconds))^00h,c
	line	214
	
l800:; BSR set to: 3

	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_init
	__end_of_eeprom_init:
	signat	_eeprom_init,89
	global	_sync_menu_variables

;; *************** function _sync_menu_variables *****************
;; Defined at:
;;		line 247 in file "src\eeprom.c"
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eeprom_init
;; This function uses a non-reentrant model
;;
psect	text40,class=CODE,space=0,reloc=2,group=0
	line	247
global __ptext40
__ptext40:
psect	text40
	file	"src\eeprom.c"
	line	247
	
_sync_menu_variables:; BSR set to: 3

;incstack = 0
	callstack 27
	line	256
	
l6124:
	movff	_input_config,(_enable_edit_flag)
	line	257
	movff	0+(_input_config+01h),(_sensor_edit_flag)
	line	258
	
l818:
	return	;funcret
	callstack 0
GLOBAL	__end_of_sync_menu_variables
	__end_of_sync_menu_variables:
	signat	_sync_menu_variables,89
	global	_save_current_config

;; *************** function _save_current_config *****************
;; Defined at:
;;		line 216 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   29[COMRAM] unsigned char 
;;  checksum        2   27[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_calculate_config_checksum
;;		_eeprom_write_block
;;		_eeprom_write_word
;; This function is called by:
;;		_menu_handle_button
;;		_eeprom_init
;; This function uses a non-reentrant model
;;
psect	text41,class=CODE,space=0,reloc=2,group=0
	line	216
global __ptext41
__ptext41:
psect	text41
	file	"src\eeprom.c"
	line	216
	
_save_current_config:
;incstack = 0
	callstack 25
	line	219
	
l6088:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	223
	
l6094:
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
	line	219
	
l6096:
	incf	((c:save_current_config@i))^00h,c
	
l6098:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u6551
	goto	u6550

u6551:
	goto	l6094
u6550:
	line	227
	
l6100:
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
	line	230
	
l6102:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	231
	
l6104:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	232
	
l805:
	return	;funcret
	callstack 0
GLOBAL	__end_of_save_current_config
	__end_of_save_current_config:
	signat	_save_current_config,89
	global	_eeprom_write_word

;; *************** function _eeprom_write_word *****************
;; Defined at:
;;		line 155 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;  address         2   17[COMRAM] unsigned int 
;;  data            2   19[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_eeprom_write_byte
;; This function is called by:
;;		_save_current_config
;; This function uses a non-reentrant model
;;
psect	text42,class=CODE,space=0,reloc=2,group=0
	line	155
global __ptext42
__ptext42:
psect	text42
	file	"src\eeprom.c"
	line	155
	
_eeprom_write_word:
;incstack = 0
	callstack 25
	line	157
	
l5670:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	158
	
l5672:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	159
	
l779:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_write_word
	__end_of_eeprom_write_word:
	signat	_eeprom_write_word,8313
	global	_eeprom_write_block

;; *************** function _eeprom_write_block *****************
;; Defined at:
;;		line 161 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;  data            2   17[COMRAM] PTR void 
;;		 -> system_config(128), input_config(384), 
;;  address         2   19[COMRAM] unsigned int 
;;  length          2   21[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2   25[COMRAM] unsigned int 
;;  ptr             2   23[COMRAM] PTR unsigned char 
;;		 -> system_config(128), input_config(384), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        10       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_eeprom_write_byte
;; This function is called by:
;;		_save_current_config
;; This function uses a non-reentrant model
;;
psect	text43,class=CODE,space=0,reloc=2,group=0
	line	161
global __ptext43
__ptext43:
psect	text43
	file	"src\eeprom.c"
	line	161
	
_eeprom_write_block:
;incstack = 0
	callstack 25
	line	163
	
l5674:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	164
	
l5676:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l5682
	line	166
	
l5678:
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
	line	164
	
l5680:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l5682:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u6061
	goto	u6060

u6061:
	goto	l5678
u6060:
	line	168
	
l785:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_write_block
	__end_of_eeprom_write_block:
	signat	_eeprom_write_block,12409
	global	_eeprom_write_byte

;; *************** function _eeprom_write_byte *****************
;; Defined at:
;;		line 128 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;  address         2   14[COMRAM] unsigned int 
;;  data            1   16[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eeprom_write_word
;;		_eeprom_write_block
;; This function uses a non-reentrant model
;;
psect	text44,class=CODE,space=0,reloc=2,group=0
	line	128
global __ptext44
__ptext44:
psect	text44
	file	"src\eeprom.c"
	line	128
	
_eeprom_write_byte:
;incstack = 0
	callstack 25
	line	130
	
l5314:
	movff	(c:eeprom_write_byte@address),(c:4009)	;volatile
	line	131
	movff	0+((c:eeprom_write_byte@address)+01h),(c:4010)	;volatile
	line	132
	movff	(c:eeprom_write_byte@data),(c:4008)	;volatile
	line	133
	bcf	((c:4006))^0f00h,c,7	;volsfr
	line	134
	bcf	((c:4006))^0f00h,c,6	;volsfr
	line	135
	bsf	((c:4006))^0f00h,c,2	;volsfr
	line	138
	
l5316:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	139
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	140
	
l5318:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	143
	
l770:
	line	142
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u5541
	goto	u5540
u5541:
	goto	l770
u5540:
	
l772:
	line	144
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	145
	
l773:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_write_byte
	__end_of_eeprom_write_byte:
	signat	_eeprom_write_byte,8313
	global	_calculate_config_checksum

;; *************** function _calculate_config_checksum *****************
;; Defined at:
;;		line 92 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               2   21[COMRAM] unsigned int 
;;  j               2   23[COMRAM] unsigned int 
;;  i               1   25[COMRAM] unsigned char 
;;  data            2   19[COMRAM] PTR unsigned char 
;;		 -> system_config(128), input_config(384), 
;;  checksum        2   17[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] unsigned int 
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eeprom_init
;;		_save_current_config
;; This function uses a non-reentrant model
;;
psect	text45,class=CODE,space=0,reloc=2,group=0
	line	92
global __ptext45
__ptext45:
psect	text45
	file	"src\eeprom.c"
	line	92
	
_calculate_config_checksum:
;incstack = 0
	callstack 26
	line	94
	
l5626:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	98
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	100
	
l5632:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	101
	
l5634:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	103
	
l5640:
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
	line	101
	
l5642:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l5644:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u6030
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u6031
	goto	u6030

u6031:
	goto	l5640
u6030:
	line	98
	
l5646:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l5648:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u6041
	goto	u6040

u6041:
	goto	l5632
u6040:
	line	108
	
l5650:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	109
	
l5652:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1286+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1286))^00h,c
	line	111
	
l5658:
	movf	((c:calculate_config_checksum@j_1286))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j_1286+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	109
	
l5660:
	infsnz	((c:calculate_config_checksum@j_1286))^00h,c
	incf	((c:calculate_config_checksum@j_1286+1))^00h,c
	
l5662:
		movf	((c:calculate_config_checksum@j_1286+1))^00h,c,w
	bnz	u6050
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1286))^00h,c,w
	btfss	status,0
	goto	u6051
	goto	u6050

u6051:
	goto	l5658
u6050:
	
l763:
	line	114
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	115
	
l764:
	return	;funcret
	callstack 0
GLOBAL	__end_of_calculate_config_checksum
	__end_of_calculate_config_checksum:
	signat	_calculate_config_checksum,90
	global	_load_factory_defaults

;; *************** function _load_factory_defaults *****************
;; Defined at:
;;		line 241 in file "src\eeprom.c"
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
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_memcpy
;; This function is called by:
;;		_eeprom_init
;; This function uses a non-reentrant model
;;
psect	text46,class=CODE,space=0,reloc=2,group=0
	line	241
global __ptext46
__ptext46:
psect	text46
	file	"src\eeprom.c"
	line	241
	
_load_factory_defaults:
;incstack = 0
	callstack 26
	line	243
	
l6122:
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
	line	244
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
	line	245
	
l811:
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
;;  d1              2   14[COMRAM] PTR void 
;;		 -> system_config(128), input_menu(75), input_config(384), 
;;  s1              2   16[COMRAM] PTR const void 
;;		 -> system_defaults(128), factory_defaults(384), temp_menu_template(45), pressure_menu_template(70), 
;;  n               2   18[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  s               2   23[COMRAM] PTR const unsigned char 
;;		 -> system_defaults(128), factory_defaults(384), temp_menu_template(45), pressure_menu_template(70), 
;;  d               2   21[COMRAM] PTR unsigned char 
;;		 -> system_config(128), input_menu(75), input_config(384), 
;;  tmp             1   20[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] PTR void 
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rebuild_input_menu
;;		_load_factory_defaults
;; This function uses a non-reentrant model
;;
psect	text47,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
global __ptext47
__ptext47:
psect	text47
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
	
_memcpy:
;incstack = 0
	callstack 26
	line	34
	
l5588:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l5598
	line	37
	
l5590:
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
	
l5592:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l5594:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l5596:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l5598:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u5971
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u5971
	goto	u5970

u5971:
	goto	l5590
u5970:
	line	41
	
l1574:
	return	;funcret
	callstack 0
GLOBAL	__end_of_memcpy
	__end_of_memcpy:
	signat	_memcpy,12410
	global	_eeprom_read_word

;; *************** function _eeprom_read_word *****************
;; Defined at:
;;		line 147 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;  address         2   16[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  result          2   21[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   16[COMRAM] unsigned int 
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
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_eeprom_read_byte
;; This function is called by:
;;		_eeprom_init
;; This function uses a non-reentrant model
;;
psect	text48,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	147
global __ptext48
__ptext48:
psect	text48
	file	"src\eeprom.c"
	line	147
	
_eeprom_read_word:
;incstack = 0
	callstack 26
	line	150
	
l6106:
	movff	(c:eeprom_read_word@address),(c:eeprom_read_byte@address)
	movff	(c:eeprom_read_word@address+1),(c:eeprom_read_byte@address+1)
	call	_eeprom_read_byte	;wreg free
	movwf	(??_eeprom_read_word+0+0)^00h,c
	movf	((??_eeprom_read_word+0+0))^00h,c,w
	movwf	((c:eeprom_read_word@result))^00h,c
	clrf	((c:eeprom_read_word@result+1))^00h,c
	line	151
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

	line	152
	
l6108:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	153
	
l776:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_read_word
	__end_of_eeprom_read_word:
	signat	_eeprom_read_word,4218
	global	_eeprom_read_block

;; *************** function _eeprom_read_block *****************
;; Defined at:
;;		line 170 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;  data            2   16[COMRAM] PTR void 
;;		 -> system_config(128), input_config(384), 
;;  address         2   18[COMRAM] unsigned int 
;;  length          2   20[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2   24[COMRAM] unsigned int 
;;  ptr             2   22[COMRAM] PTR unsigned char 
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
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_eeprom_read_byte
;; This function is called by:
;;		_eeprom_init
;; This function uses a non-reentrant model
;;
psect	text49,class=CODE,space=0,reloc=2,group=0
	line	170
global __ptext49
__ptext49:
psect	text49
	file	"src\eeprom.c"
	line	170
	
_eeprom_read_block:
;incstack = 0
	callstack 26
	line	172
	
l6112:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	173
	
l6114:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l6120
	line	175
	
l6116:
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

	line	173
	
l6118:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l6120:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u6561
	goto	u6560

u6561:
	goto	l6116
u6560:
	line	177
	
l791:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_read_block
	__end_of_eeprom_read_block:
	signat	_eeprom_read_block,12409
	global	_eeprom_read_byte

;; *************** function _eeprom_read_byte *****************
;; Defined at:
;;		line 118 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;  address         2   14[COMRAM] unsigned int 
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eeprom_read_word
;;		_eeprom_read_block
;; This function uses a non-reentrant model
;;
psect	text50,class=CODE,space=0,reloc=2,group=0
	line	118
global __ptext50
__ptext50:
psect	text50
	file	"src\eeprom.c"
	line	118
	
_eeprom_read_byte:
;incstack = 0
	callstack 26
	line	120
	
l5664:
	movff	(c:eeprom_read_byte@address),(c:4009)	;volatile
	line	121
	movff	0+((c:eeprom_read_byte@address)+01h),(c:4010)	;volatile
	line	122
	bcf	((c:4006))^0f00h,c,7	;volsfr
	line	123
	bcf	((c:4006))^0f00h,c,6	;volsfr
	line	124
	bsf	((c:4006))^0f00h,c,0	;volsfr
	line	125
	
l5666:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	126
	
l767:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_read_byte
	__end_of_eeprom_read_byte:
	signat	_eeprom_read_byte,4217
	global	_isr

;; *************** function _isr *****************
;; Defined at:
;;		line 35 in file "src\encoder.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  btn             1   13[COMRAM] unsigned char 
;;  new_state       1   12[COMRAM] unsigned char 
;;  combined        1   11[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
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
;; Hardware stack levels required when called: 1
;; This function calls:
;;		i2___lwmod
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
	line	35
	
_isr:
;incstack = 0
	callstack 23
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
	line	37
	
i2l5142:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u520_41
	goto	i2u520_40
i2u520_41:
	goto	i2l283
i2u520_40:
	line	40
	
i2l5144:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	41
	
i2l5146:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	44
	
i2l5148:
	incf	((c:_ms_counter))^00h,c	;volatile
	line	45
	
i2l5150:
		movlw	02h-1
	cpfsgt	((c:_ms_counter))^00h,c	;volatile
	goto	i2u521_41
	goto	i2u521_40

i2u521_41:
	goto	i2l5166
i2u521_40:
	line	47
	
i2l5152:
	movlw	low(0)
	movwf	((c:_ms_counter))^00h,c	;volatile
	line	48
	
i2l5154:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u522_41
	goto	i2u522_40

i2u522_41:
	goto	i2l5166
i2u522_40:
	line	50
	
i2l5156:
	decf	((c:_menu_timeout_timer))^00h,c	;volatile
	btfss	status,0
	decf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	line	53
	
i2l5158:
	movff	(c:_menu_timeout_timer),(c:i2___lwmod@dividend)	;volatile
	movff	(c:_menu_timeout_timer+1),(c:i2___lwmod@dividend+1)	;volatile
	movlw	high(01F4h)
	movwf	((c:i2___lwmod@divisor+1))^00h,c
	movlw	low(01F4h)
	movwf	((c:i2___lwmod@divisor))^00h,c
	call	i2___lwmod	;wreg free
	movf	(0+?i2___lwmod)^00h,c,w
iorwf	(1+?i2___lwmod)^00h,c,w
	btfss	status,2
	goto	i2u523_41
	goto	i2u523_40

i2u523_41:
	goto	i2l5162
i2u523_40:
	line	56
	
i2l5160:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_timeout_debug_flag))&0ffh	;volatile
	line	59
	
i2l5162:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u524_41
	goto	i2u524_40

i2u524_41:
	goto	i2l5166
i2u524_40:
	line	61
	
i2l5164:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	67
	
i2l5166:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u525_41
	goto	i2u525_40
i2u525_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u525_48
i2u525_40:
	clrf	(??_isr+0+0)^00h,c
i2u525_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u526_41
	goto	i2u526_40
i2u526_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u526_48
i2u526_40:
	clrf	(??_isr+1+0)^00h,c
i2u526_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	68
	
i2l5168:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	71
	
i2l5170:
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
	line	74
	
i2l5172:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u527_41
	goto	i2u527_40
i2u527_41:
	goto	i2l5198
i2u527_40:
	line	76
	
i2l5174:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u528_41
	goto	i2u528_40

i2u528_41:
	goto	i2l5186
i2u528_40:
	line	78
	
i2l5176:
	movlb	1	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	79
	
i2l5178:; BSR set to: 1

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	82
	
i2l5180:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u529_41
	goto	i2u529_40

i2u529_41:
	goto	i2l5198
i2u529_40:
	line	84
	
i2l5182:; BSR set to: 1

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	85
	
i2l5184:; BSR set to: 1

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l5198
	line	88
	
i2l5186:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u530_41
	goto	i2u530_40

i2u530_41:
	goto	i2l5198
i2u530_40:
	line	90
	
i2l5188:
	movlb	1	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	line	91
	
i2l5190:; BSR set to: 1

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	94
	
i2l5192:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u531_41
	goto	i2u531_40

i2u531_41:
	goto	i2l267
i2u531_40:
	goto	i2l5182
	line	100
	
i2l267:; BSR set to: 1

	line	102
	
i2l5198:
	movff	(c:isr@new_state),(c:_enc_state)
	line	105
	
i2l5200:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	106
	
i2l5202:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u532_41
	goto	i2u532_40

i2u532_41:
	goto	i2l5234
i2u532_40:
	line	108
	
i2l5204:
	incf	((c:_btn_debounce))^00h,c
	line	109
	
i2l5206:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u533_41
	goto	i2u533_40

i2u533_41:
	goto	i2l283
i2u533_40:
	line	111
	
i2l5208:
	movff	(c:isr@btn),(c:_last_btn)
	line	112
	
i2l5210:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	114
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u534_41
	goto	i2u534_40
i2u534_41:
	goto	i2l5220
i2u534_40:
	line	117
	
i2l5212:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	118
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	121
	
i2l5214:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u535_41
	goto	i2u535_40

i2u535_41:
	goto	i2l281
i2u535_40:
	line	123
	
i2l5216:; BSR set to: 1

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	124
	
i2l5218:; BSR set to: 1

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l283
	line	130
	
i2l5220:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u536_41
	goto	i2u536_40

i2u536_41:
	goto	i2l5224
i2u536_40:
	line	132
	
i2l5222:
	movlw	low(03h)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	133
	goto	i2l276
	line	134
	
i2l5224:
		movlw	132
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	3
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u537_41
	goto	i2u537_40

i2u537_41:
	goto	i2l5228
i2u537_40:
	line	136
	
i2l5226:
	movlw	low(02h)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	137
	goto	i2l276
	line	138
	
i2l5228:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u538_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u538_41
	goto	i2u538_40

i2u538_41:
	goto	i2l5232
i2u538_40:
	line	140
	
i2l5230:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	141
	goto	i2l276
	line	144
	
i2l5232:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	145
	
i2l276:; BSR set to: 1

	line	147
	movlw	low(01h)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	148
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	goto	i2l283
	line	154
	
i2l5234:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	156
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u539_41
	goto	i2u539_40
i2u539_41:
	goto	i2l283
i2u539_40:
	
i2l5236:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u540_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u540_41
	goto	i2u540_40

i2u540_41:
	goto	i2l283
i2u540_40:
	line	158
	
i2l5238:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	goto	i2l283
	line	160
	
i2l281:; BSR set to: 1

	line	162
	
i2l283:
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
	global	i2___lwmod

;; *************** function i2___lwmod *****************
;; Defined at:
;;		line 7 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        2    0[COMRAM] unsigned int 
;;  divisor         2    2[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    4[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMRAM] unsigned int 
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text52,class=CODE,space=0,reloc=2,group=0
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext52
__ptext52:
psect	text52
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
i2___lwmod:
;incstack = 0
	callstack 23
	line	12
	
i2l4918:
	movf	((c:i2___lwmod@divisor))^00h,c,w
iorwf	((c:i2___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	i2u486_41
	goto	i2u486_40

i2u486_41:
	goto	i2l1389
i2u486_40:
	line	13
	
i2l4920:
	movlw	low(01h)
	movwf	((c:i2___lwmod@counter))^00h,c
	line	14
	goto	i2l4924
	line	15
	
i2l4922:
	bcf	status,0
	rlcf	((c:i2___lwmod@divisor))^00h,c
	rlcf	((c:i2___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:i2___lwmod@counter))^00h,c
	line	14
	
i2l4924:
	
	btfss	((c:i2___lwmod@divisor+1))^00h,c,(15)&7
	goto	i2u487_41
	goto	i2u487_40
i2u487_41:
	goto	i2l4922
i2u487_40:
	line	19
	
i2l4926:
		movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c,w
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	i2u488_41
	goto	i2u488_40

i2u488_41:
	goto	i2l4930
i2u488_40:
	line	20
	
i2l4928:
	movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c

	line	21
	
i2l4930:
	bcf	status,0
	rrcf	((c:i2___lwmod@divisor+1))^00h,c
	rrcf	((c:i2___lwmod@divisor))^00h,c
	line	22
	
i2l4932:
	decfsz	((c:i2___lwmod@counter))^00h,c
	
	goto	i2l4926
	line	23
	
i2l1389:
	line	24
	movff	(c:i2___lwmod@dividend),(c:?i2___lwmod)
	movff	(c:i2___lwmod@dividend+1),(c:?i2___lwmod+1)
	line	25
	
i2l1396:
	return	;funcret
	callstack 0
GLOBAL	__end_ofi2___lwmod
	__end_ofi2___lwmod:
	signat	i2___lwmod,8282
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
