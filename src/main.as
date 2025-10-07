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
	FNCALL	_main,___wmul
	FNCALL	_main,_ad7994_init
	FNCALL	_main,_ad7994_read_channel
	FNCALL	_main,_beep
	FNCALL	_main,_eeprom_init
	FNCALL	_main,_encoder_init
	FNCALL	_main,_get_menu_timeout_seconds
	FNCALL	_main,_handle_numeric_rotation
	FNCALL	_main,_handle_time_rotation
	FNCALL	_main,_i2c_init
	FNCALL	_main,_is_numeric_field
	FNCALL	_main,_is_time_field
	FNCALL	_main,_lcd_clear
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_print
	FNCALL	_main,_lcd_set_cursor
	FNCALL	_main,_menu_draw_clock
	FNCALL	_main,_menu_draw_input
	FNCALL	_main,_menu_draw_options
	FNCALL	_main,_menu_draw_setup
	FNCALL	_main,_menu_handle_button
	FNCALL	_main,_menu_handle_encoder
	FNCALL	_main,_menu_init
	FNCALL	_main,_menu_update_edit_value
	FNCALL	_main,_menu_update_numeric_value
	FNCALL	_main,_menu_update_time_value
	FNCALL	_main,_rtc_init
	FNCALL	_main,_rtc_read_time
	FNCALL	_main,_rtc_set_time
	FNCALL	_main,_save_current_config
	FNCALL	_main,_sprintf
	FNCALL	_main,_system_init
	FNCALL	_main,_uart_init
	FNCALL	_main,_uart_println
	FNCALL	_rtc_set_time,_dec_to_bcd
	FNCALL	_rtc_set_time,_i2c_start
	FNCALL	_rtc_set_time,_i2c_stop
	FNCALL	_rtc_set_time,_i2c_write
	FNCALL	_dec_to_bcd,___lbdiv
	FNCALL	_dec_to_bcd,___lbmod
	FNCALL	_rtc_read_time,_bcd_to_dec
	FNCALL	_rtc_read_time,_i2c_read
	FNCALL	_rtc_read_time,_i2c_start
	FNCALL	_rtc_read_time,_i2c_stop
	FNCALL	_rtc_read_time,_i2c_write
	FNCALL	_rtc_read_time,_sprintf
	FNCALL	_rtc_read_time,_uart_println
	FNCALL	_rtc_init,_rtc_write_register
	FNCALL	_rtc_write_register,_i2c_start
	FNCALL	_rtc_write_register,_i2c_stop
	FNCALL	_rtc_write_register,_i2c_write
	FNCALL	_menu_update_numeric_value,_is_numeric_field
	FNCALL	_menu_update_numeric_value,_lcd_print
	FNCALL	_menu_update_numeric_value,_lcd_set_cursor
	FNCALL	_menu_update_edit_value,_is_numeric_field
	FNCALL	_menu_update_edit_value,_lcd_print
	FNCALL	_menu_update_edit_value,_lcd_set_cursor
	FNCALL	_menu_update_edit_value,_sprintf
	FNCALL	_menu_update_edit_value,_strcpy
	FNCALL	_menu_update_edit_value,_strlen
	FNCALL	_menu_handle_encoder,_get_item_options_for_field
	FNCALL	_menu_handle_encoder,_get_option_edit_flag
	FNCALL	_menu_handle_encoder,_handle_numeric_rotation
	FNCALL	_menu_handle_encoder,_handle_time_rotation
	FNCALL	_menu_handle_encoder,_is_numeric_field
	FNCALL	_menu_handle_encoder,_is_option_field
	FNCALL	_menu_handle_encoder,_is_time_field
	FNCALL	_menu_handle_encoder,_menu_draw_clock
	FNCALL	_menu_handle_encoder,_menu_draw_input
	FNCALL	_menu_handle_encoder,_menu_draw_options
	FNCALL	_menu_handle_encoder,_menu_draw_setup
	FNCALL	_menu_handle_encoder,_menu_update_time_value
	FNCALL	_menu_handle_encoder,_sprintf
	FNCALL	_menu_handle_encoder,_strcpy
	FNCALL	_menu_handle_encoder,_uart_println
	FNCALL	_handle_time_rotation,_sprintf
	FNCALL	_handle_time_rotation,_uart_println
	FNCALL	_handle_numeric_rotation,_sprintf
	FNCALL	_handle_numeric_rotation,_uart_println
	FNCALL	_menu_handle_button,___lbdiv
	FNCALL	_menu_handle_button,___lbmod
	FNCALL	_menu_handle_button,___wmul
	FNCALL	_menu_handle_button,_beep
	FNCALL	_menu_handle_button,_get_current_numeric_value
	FNCALL	_menu_handle_button,_get_item_options_for_field
	FNCALL	_menu_handle_button,_get_option_edit_flag
	FNCALL	_menu_handle_button,_init_numeric_editor
	FNCALL	_menu_handle_button,_init_time_editor
	FNCALL	_menu_handle_button,_is_numeric_field
	FNCALL	_menu_handle_button,_is_option_field
	FNCALL	_menu_handle_button,_is_time_field
	FNCALL	_menu_handle_button,_menu_draw_clock
	FNCALL	_menu_handle_button,_menu_draw_input
	FNCALL	_menu_handle_button,_menu_draw_options
	FNCALL	_menu_handle_button,_menu_draw_setup
	FNCALL	_menu_handle_button,_menu_update_time_value
	FNCALL	_menu_handle_button,_rebuild_clock_menu
	FNCALL	_menu_handle_button,_rebuild_input_menu
	FNCALL	_menu_handle_button,_save_current_config
	FNCALL	_menu_handle_button,_sprintf
	FNCALL	_menu_handle_button,_strcmp
	FNCALL	_menu_handle_button,_strcpy
	FNCALL	_menu_handle_button,_trigger_relay_pulse
	FNCALL	_menu_handle_button,_uart_println
	FNCALL	_trigger_relay_pulse,_sprintf
	FNCALL	_trigger_relay_pulse,_uart_println
	FNCALL	_rebuild_input_menu,___lwdiv
	FNCALL	_rebuild_input_menu,___lwmod
	FNCALL	_rebuild_input_menu,_memcpy
	FNCALL	_rebuild_input_menu,_sprintf
	FNCALL	_rebuild_input_menu,_strcpy
	FNCALL	_rebuild_input_menu,_uart_println
	FNCALL	_rebuild_clock_menu,___lbdiv
	FNCALL	_rebuild_clock_menu,___lbmod
	FNCALL	_rebuild_clock_menu,_memcpy
	FNCALL	_rebuild_clock_menu,_sprintf
	FNCALL	_rebuild_clock_menu,_strcpy
	FNCALL	_rebuild_clock_menu,_uart_println
	FNCALL	_menu_update_time_value,___lbdiv
	FNCALL	_menu_update_time_value,___lbmod
	FNCALL	_menu_update_time_value,_is_time_field
	FNCALL	_menu_update_time_value,_lcd_print
	FNCALL	_menu_update_time_value,_lcd_set_cursor
	FNCALL	_menu_update_time_value,_menu_draw_clock
	FNCALL	_menu_update_time_value,_sprintf
	FNCALL	_menu_update_time_value,_uart_println
	FNCALL	_menu_draw_clock,_lcd_clear_line
	FNCALL	_menu_draw_clock,_lcd_print
	FNCALL	_menu_draw_clock,_lcd_print_at
	FNCALL	_menu_draw_clock,_lcd_set_cursor
	FNCALL	_menu_draw_clock,_strcpy
	FNCALL	_menu_draw_clock,_strlen
	FNCALL	_menu_draw_setup,_lcd_clear
	FNCALL	_menu_draw_setup,_lcd_clear_line
	FNCALL	_menu_draw_setup,_lcd_print
	FNCALL	_menu_draw_setup,_lcd_print_at
	FNCALL	_menu_draw_setup,_lcd_set_cursor
	FNCALL	_menu_draw_options,_lcd_clear
	FNCALL	_menu_draw_options,_lcd_clear_line
	FNCALL	_menu_draw_options,_lcd_print
	FNCALL	_menu_draw_options,_lcd_print_at
	FNCALL	_menu_draw_options,_lcd_set_cursor
	FNCALL	_lcd_clear,_lcd_cmd
	FNCALL	_menu_draw_input,_get_item_options_for_field
	FNCALL	_menu_draw_input,_get_option_edit_flag
	FNCALL	_menu_draw_input,_is_numeric_field
	FNCALL	_menu_draw_input,_is_option_field
	FNCALL	_menu_draw_input,_is_time_field
	FNCALL	_menu_draw_input,_lcd_clear_line
	FNCALL	_menu_draw_input,_lcd_print
	FNCALL	_menu_draw_input,_lcd_print_at
	FNCALL	_menu_draw_input,_lcd_set_cursor
	FNCALL	_menu_draw_input,_sprintf
	FNCALL	_menu_draw_input,_strcmp
	FNCALL	_menu_draw_input,_strcpy
	FNCALL	_menu_draw_input,_strlen
	FNCALL	_lcd_print_at,_lcd_print
	FNCALL	_lcd_print_at,_lcd_set_cursor
	FNCALL	_lcd_clear_line,_lcd_print
	FNCALL	_lcd_clear_line,_lcd_set_cursor
	FNCALL	_lcd_set_cursor,_lcd_cmd
	FNCALL	_lcd_print,_lcd_data
	FNCALL	_lcd_data,_lcd_write_nibble
	FNCALL	_init_time_editor,___lwdiv
	FNCALL	_init_time_editor,___lwmod
	FNCALL	_init_time_editor,_sprintf
	FNCALL	_init_time_editor,_uart_println
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_sprintf,___wmul
	FNCALL	_sprintf,_isdigit
	FNCALL	_init_numeric_editor,___lwdiv
	FNCALL	_init_numeric_editor,___lwmod
	FNCALL	_lcd_init,_lcd_cmd
	FNCALL	_lcd_init,_lcd_write_nibble
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
	FNCALL	_ad7994_read_channel,_i2c_read
	FNCALL	_ad7994_read_channel,_i2c_start
	FNCALL	_ad7994_read_channel,_i2c_stop
	FNCALL	_ad7994_read_channel,_i2c_write
	FNCALL	_i2c_read,_i2c_wait_idle
	FNCALL	_ad7994_init,_i2c_start
	FNCALL	_ad7994_init,_i2c_stop
	FNCALL	_ad7994_init,_i2c_write
	FNCALL	_ad7994_init,_uart_println
	FNCALL	_uart_println,_uart_print
	FNCALL	_uart_println,_uart_write
	FNCALL	_uart_print,_uart_write
	FNCALL	_i2c_stop,_i2c_wait_idle
	FNCALL	_i2c_start,_i2c_wait_idle
	FNROOT	_main
	FNCALL	_isr,i2___lwmod
	FNCALL	intlevel2,_isr
	global	intlevel2
	FNROOT	intlevel2
	global	_menu_timeout_seconds
	global	_last_btn
	global	_relay_slp_edit_flag
	global	_display_edit_flag
	global	_flow_type_edit_flag
	global	_enable_edit_flag
	global	_menu_timeout_flag
	global	_value_relay_pulse
	global	_value_display
	global	_value_scale20
	global	_value_scale4
	global	_value_enable
	global	_value_back
	global	menu_draw_setup@F2659
	global	_options_menu
	global	_value_sensor
	global	_value_clock_display
	global	_value_end_runtime
	global	_value_clock_enable
	global	_value_high_tbp
	global	_value_low_flow_bp
	global	_value_no_flow_bp
	global	_value_low_flow
	global	_value_no_flow
	global	_value_flow_units
	global	_value_flow_type
	global	_value_high_temp
	global	_value_low_pressure
	global	_value_hi_pressure
	global	_value_rlylow
	global	_value_rlyslp
	global	_value_rlyplp
	global	_value_rlyhigh
	global	_value_slpbp
	global	_value_plpbp
	global	_value_highbp
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"src\eeprom.c"
	line	11

;initializer for _menu_timeout_seconds
	dw	(01Eh)&0ffffh
	file	"src\encoder.c"
	line	32

;initializer for _last_btn
	db	low(01h)
	file	"src\menu.c"
	line	28

;initializer for _relay_slp_edit_flag
	db	low(01h)
	line	25

;initializer for _display_edit_flag
	db	low(01h)
	line	22

;initializer for _flow_type_edit_flag
	db	low(01h)
	line	20

;initializer for _enable_edit_flag
	db	low(01h)
psect	idataBANK1,class=CODE,space=0,delta=1,noexec
global __pidataBANK1
__pidataBANK1:
	file	"src\encoder.c"
	line	16

;initializer for _menu_timeout_flag
	db	low(01h)
psect	idataBANK3,class=CODE,space=0,delta=1,noexec
global __pidataBANK3
__pidataBANK3:
	file	"src\menu.c"
	line	102

;initializer for _value_relay_pulse
	db	low(030h)
	db	low(030h)
	db	low(03Ah)
	db	low(030h)
	db	low(032h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	line	84

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
	line	76

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
	line	75

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
	line	73

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
	line	85

;initializer for _value_back
	db	low(042h)
	db	low(061h)
	db	low(063h)
	db	low(06Bh)
	db	low(0)
psect	idataBANK4,class=CODE,space=0,delta=1,noexec
global __pidataBANK4
__pidataBANK4:
	line	1230

;initializer for menu_draw_setup@F2659
		db	low(STR_213)
	db	high(STR_213)

		db	low(STR_214)
	db	high(STR_214)

		db	low(STR_215)
	db	high(STR_215)

		db	low(STR_216)
	db	high(STR_216)

		db	low(STR_217)
	db	high(STR_217)

	line	65

;initializer for _options_menu
		db	low(STR_80)
	db	high(STR_80)

		db	low(STR_81)
	db	high(STR_81)

		db	low(STR_82)
	db	high(STR_82)

		db	low(STR_83)
	db	high(STR_83)

		db	low(STR_84)
	db	high(STR_84)

	line	74

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
	line	103

;initializer for _value_clock_display
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
	line	101

;initializer for _value_end_runtime
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
	line	100

;initializer for _value_clock_enable
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
	line	97

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
	line	96

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
	line	95

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
	line	94

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
	line	93

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
	line	92

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
	line	91

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
	line	90

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
	line	89

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
	line	88

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
	line	83

;initializer for _value_rlylow
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
	line	82

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
	line	81

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
	line	80

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
	line	79

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
	line	78

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
	line	77

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
	global	_enc_table
psect	mediumconst,class=MEDIUMCONST,space=0,reloc=2,noexec
global __pmediumconst
__pmediumconst:
	db	0
	file	"src\encoder.c"
	line	37
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
	global	_hexpowers
psect	mediumconst
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	366
_hexpowers:
	dw	(01h)&0ffffh
	dw	(010h)&0ffffh
	dw	(0100h)&0ffffh
	dw	(01000h)&0ffffh
	global __end_of_hexpowers
__end_of_hexpowers:
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
	dw	(02h)&0ffffh
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
	db	low(078h)
	dw	(0)&0ffffh
	dw	(0)&0ffffh
	db	low(01h)
	db	low(02h)
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
	global	_menu_item_options
psect	mediumconst
	file	"src\menu.c"
	line	52
_menu_item_options:
	db	low(0)
	db	low(02h)
		db	low(STR_45)
	db	high(STR_45)

		db	low(STR_46)
	db	high(STR_46)

		db	low(STR_47)
	db	high(STR_47)

		db	low(STR_48)
	db	high(STR_48)

		db	low(STR_49)
	db	high(STR_49)

	db	low(01h)
	db	low(03h)
		db	low(STR_50)
	db	high(STR_50)

		db	low(STR_51)
	db	high(STR_51)

		db	low(STR_52)
	db	high(STR_52)

		db	low(STR_53)
	db	high(STR_53)

		db	low(STR_54)
	db	high(STR_54)

	db	low(02h)
	db	low(02h)
		db	low(STR_55)
	db	high(STR_55)

		db	low(STR_56)
	db	high(STR_56)

		db	low(STR_57)
	db	high(STR_57)

		db	low(STR_58)
	db	high(STR_58)

		db	low(STR_59)
	db	high(STR_59)

	db	low(03h)
	db	low(02h)
		db	low(STR_60)
	db	high(STR_60)

		db	low(STR_61)
	db	high(STR_61)

		db	low(STR_62)
	db	high(STR_62)

		db	low(STR_63)
	db	high(STR_63)

		db	low(STR_64)
	db	high(STR_64)

	db	low(04h)
	db	low(02h)
		db	low(STR_65)
	db	high(STR_65)

		db	low(STR_66)
	db	high(STR_66)

		db	low(STR_67)
	db	high(STR_67)

		db	low(STR_68)
	db	high(STR_68)

		db	low(STR_69)
	db	high(STR_69)

	db	low(05h)
	db	low(02h)
		db	low(STR_70)
	db	high(STR_70)

		db	low(STR_71)
	db	high(STR_71)

		db	low(STR_72)
	db	high(STR_72)

		db	low(STR_73)
	db	high(STR_73)

		db	low(STR_74)
	db	high(STR_74)

	db	low(06h)
	db	low(03h)
		db	low(STR_75)
	db	high(STR_75)

		db	low(STR_76)
	db	high(STR_76)

		db	low(STR_77)
	db	high(STR_77)

		db	low(STR_78)
	db	high(STR_78)

		db	low(STR_79)
	db	high(STR_79)

	global __end_of_menu_item_options
__end_of_menu_item_options:
	global	_pressure_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	112
_pressure_menu_template:
		db	low(STR_85)
	db	high(STR_85)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_86)
	db	high(STR_86)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_87)
	db	high(STR_87)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_88)
	db	high(STR_88)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_89)
	db	high(STR_89)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_90)
	db	high(STR_90)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_91)
	db	high(STR_91)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_92)
	db	high(STR_92)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_93)
	db	high(STR_93)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_94)
	db	high(STR_94)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_95)
	db	high(STR_95)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_96)
	db	high(STR_96)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_97)
	db	high(STR_97)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_98)
	db	high(STR_98)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_pressure_menu_template
__end_of_pressure_menu_template:
	global	_flow_analog_template
psect	mediumconst
	file	"src\menu.c"
	line	155
_flow_analog_template:
		db	low(STR_116)
	db	high(STR_116)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_117)
	db	high(STR_117)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_118)
	db	high(STR_118)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_119)
	db	high(STR_119)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_120)
	db	high(STR_120)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_121)
	db	high(STR_121)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_122)
	db	high(STR_122)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_123)
	db	high(STR_123)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_124)
	db	high(STR_124)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_125)
	db	high(STR_125)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_126)
	db	high(STR_126)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_flow_analog_template
__end_of_flow_analog_template:
	global	_temp_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	130
_temp_menu_template:
		db	low(STR_99)
	db	high(STR_99)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_100)
	db	high(STR_100)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_101)
	db	high(STR_101)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_102)
	db	high(STR_102)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_103)
	db	high(STR_103)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_104)
	db	high(STR_104)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_105)
	db	high(STR_105)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_106)
	db	high(STR_106)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_107)
	db	high(STR_107)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_temp_menu_template
__end_of_temp_menu_template:
	global	_flow_digital_template
psect	mediumconst
	file	"src\menu.c"
	line	143
_flow_digital_template:
		db	low(STR_108)
	db	high(STR_108)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_109)
	db	high(STR_109)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_110)
	db	high(STR_110)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_111)
	db	high(STR_111)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_112)
	db	high(STR_112)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_113)
	db	high(STR_113)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_114)
	db	high(STR_114)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_115)
	db	high(STR_115)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_flow_digital_template
__end_of_flow_digital_template:
	global	_clock_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	170
_clock_menu_template:
		db	low(STR_127)
	db	high(STR_127)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_128)
	db	high(STR_128)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_129)
	db	high(STR_129)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_130)
	db	high(STR_130)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_131)
	db	high(STR_131)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_clock_menu_template
__end_of_clock_menu_template:
	global	_enc_table
	global	_dpowers
	global	_hexpowers
	global	_factory_defaults
	global	_system_defaults
	global	_menu_item_options
	global	_pressure_menu_template
	global	_flow_analog_template
	global	_temp_menu_template
	global	_flow_digital_template
	global	_clock_menu_template
	global	_button_hold_ms
	global	_menu_timeout_timer
	global	_menu_timeout_reload
	global	_btn_debounce
	global	_enc_accumulator
	global	_enc_state
	global	_relay_ms_counter
	global	_ms_counter
	global	_button_pressed
	global	_relay_latch_mode
	global	_relay_low_edit_flag
	global	_relay_plp_edit_flag
	global	_relay_high_edit_flag
	global	_flow_units_edit_flag
	global	_no_flow_edit_flag
	global	_sensor_edit_flag
	global	_input_config
	global	main@blink_timer
	global	_relay_state
	global	main@last_relay_counter
	global	main@encoder_activity_timer
	global	_encoder_count
	global	main@last_menu_state
	global	main@last_relay_state
	global	main@sample_counter
	global	_save_pending
	global	_long_press_beep_flag
	global	_relay_counter
	global	_current_menu
	global	_timeout_debug_flag
	global	_button_event
	global	_current_input
	global	_menu
	global	_input_menu
	global	_clock_menu
	global	_original_value
	global	_system_config
	global	_EECON2
_EECON2	set	0xFA7
	global	_EEDATA
_EEDATA	set	0xFA8
	global	_EEADRH
_EEADRH	set	0xFAA
	global	_SSPCON2bits
_SSPCON2bits	set	0xFC5
	global	_SSPSTATbits
_SSPSTATbits	set	0xFC7
	global	_TRISAbits
_TRISAbits	set	0xF92
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
	global	_PIR1bits
_PIR1bits	set	0xF9E
	global	_EECON1bits
_EECON1bits	set	0xFA6
	global	_EEADR
_EEADR	set	0xFA9
	global	_SSPCON2
_SSPCON2	set	0xFC5
	global	_SSPCON1
_SSPCON1	set	0xFC6
	global	_SSPSTAT
_SSPSTAT	set	0xFC7
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
	global	_SSPBUF
_SSPBUF	set	0xFC9
	global	_SSPADD
_SSPADD	set	0xFC8
	
STR_137:
	db	66	;'B'
	db	117	;'u'
	db	105	;'i'
	db	108	;'l'
	db	100	;'d'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	100	;'d'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	58	;':'
	db	32
	db	100	;'d'
	db	105	;'i'
	db	103	;'g'
	db	105	;'i'
	db	116	;'t'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	98	;'b'
	db	108	;'l'
	db	105	;'i'
	db	110	;'n'
	db	107	;'k'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	88	;'X'
	db	88	;'X'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	89	;'Y'
	db	89	;'Y'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_288:
	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	69	;'E'
	db	82	;'R'
	db	82	;'R'
	db	79	;'O'
	db	82	;'R'
	db	32
	db	45
	db	32
	db	67	;'C'
	db	111	;'o'
	db	110	;'n'
	db	102	;'f'
	db	105	;'i'
	db	103	;'g'
	db	32
	db	114	;'r'
	db	101	;'e'
	db	103	;'g'
	db	105	;'i'
	db	115	;'s'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	32
	db	97	;'a'
	db	100	;'d'
	db	100	;'d'
	db	114	;'r'
	db	101	;'e'
	db	115	;'s'
	db	115	;'s'
	db	32
	db	102	;'f'
	db	97	;'a'
	db	105	;'i'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_191:
	db	77	;'M'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	32
	db	114	;'r'
	db	101	;'e'
	db	98	;'b'
	db	117	;'u'
	db	105	;'i'
	db	108	;'l'
	db	116	;'t'
	db	58	;':'
	db	32
	db	115	;'s'
	db	101	;'e'
	db	110	;'n'
	db	115	;'s'
	db	111	;'o'
	db	114	;'r'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	102	;'f'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	95	;'_'
	db	116	;'t'
	db	121	;'y'
	db	112	;'p'
	db	101	;'e'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	105	;'i'
	db	116	;'t'
	db	101	;'e'
	db	109	;'m'
	db	115	;'s'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_1:
	db	33
	db	33
	db	33
	db	32
	db	116	;'t'
	db	114	;'r'
	db	105	;'i'
	db	103	;'g'
	db	103	;'g'
	db	101	;'e'
	db	114	;'r'
	db	95	;'_'
	db	114	;'r'
	db	101	;'e'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	95	;'_'
	db	112	;'p'
	db	117	;'u'
	db	108	;'l'
	db	115	;'s'
	db	101	;'e'
	db	40
	db	41
	db	32
	db	67	;'C'
	db	65	;'A'
	db	76	;'L'
	db	76	;'L'
	db	69	;'E'
	db	68	;'D'
	db	32
	db	40
	db	108	;'l'
	db	97	;'a'
	db	116	;'t'
	db	99	;'c'
	db	104	;'h'
	db	61	;'='
	db	37
	db	100	;'d'
	db	41
	db	32
	db	33
	db	33
	db	33
	db	0
	
STR_238:
	db	86	;'V'
	db	97	;'a'
	db	108	;'l'
	db	117	;'u'
	db	101	;'e'
	db	115	;'s'
	db	58	;':'
	db	32
	db	101	;'e'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	61	;'='
	db	39
	db	37
	db	115	;'s'
	db	39
	db	44
	db	32
	db	114	;'r'
	db	117	;'u'
	db	110	;'n'
	db	116	;'t'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	61	;'='
	db	39
	db	37
	db	115	;'s'
	db	39
	db	44
	db	32
	db	112	;'p'
	db	117	;'u'
	db	108	;'l'
	db	115	;'s'
	db	101	;'e'
	db	61	;'='
	db	39
	db	37
	db	115	;'s'
	db	39
	db	0
	
STR_134:
	db	82	;'R'
	db	111	;'o'
	db	116	;'t'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
	db	32
	db	115	;'s'
	db	116	;'t'
	db	97	;'a'
	db	114	;'r'
	db	116	;'t'
	db	58	;':'
	db	32
	db	88	;'X'
	db	88	;'X'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	89	;'Y'
	db	89	;'Y'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	100	;'d'
	db	105	;'i'
	db	114	;'r'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	100	;'d'
	db	105	;'i'
	db	103	;'g'
	db	105	;'i'
	db	116	;'t'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_290:
	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	69	;'E'
	db	82	;'R'
	db	82	;'R'
	db	79	;'O'
	db	82	;'R'
	db	32
	db	45
	db	32
	db	67	;'C'
	db	111	;'o'
	db	110	;'n'
	db	102	;'f'
	db	105	;'i'
	db	103	;'g'
	db	32
	db	100	;'d'
	db	97	;'a'
	db	116	;'t'
	db	97	;'a'
	db	32
	db	119	;'w'
	db	114	;'r'
	db	105	;'i'
	db	116	;'t'
	db	101	;'e'
	db	32
	db	102	;'f'
	db	97	;'a'
	db	105	;'i'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_259:
	db	85	;'U'
	db	112	;'p'
	db	100	;'d'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	32
	db	118	;'v'
	db	97	;'a'
	db	108	;'l'
	db	117	;'u'
	db	101	;'e'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	58	;':'
	db	32
	db	37
	db	115	;'s'
	db	44
	db	32
	db	115	;'s'
	db	97	;'a'
	db	118	;'v'
	db	101	;'e'
	db	95	;'_'
	db	112	;'p'
	db	101	;'e'
	db	110	;'n'
	db	100	;'d'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	61	;'='
	db	49	;'1'
	db	0
	
STR_2:
	db	82	;'R'
	db	101	;'e'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	32
	db	79	;'O'
	db	80	;'P'
	db	69	;'E'
	db	78	;'N'
	db	32
	db	45
	db	32
	db	76	;'L'
	db	65	;'A'
	db	84	;'T'
	db	67	;'C'
	db	72	;'H'
	db	69	;'E'
	db	68	;'D'
	db	32
	db	40
	db	119	;'w'
	db	97	;'a'
	db	105	;'i'
	db	116	;'t'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	102	;'f'
	db	111	;'o'
	db	114	;'r'
	db	32
	db	98	;'b'
	db	117	;'u'
	db	116	;'t'
	db	116	;'t'
	db	111	;'o'
	db	110	;'n'
	db	41
	db	0
	
STR_10:
	db	82	;'R'
	db	84	;'T'
	db	67	;'C'
	db	32
	db	105	;'i'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	105	;'i'
	db	97	;'a'
	db	108	;'l'
	db	105	;'i'
	db	122	;'z'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	45
	db	32
	db	49	;'1'
	db	72	;'H'
	db	122	;'z'
	db	32
	db	115	;'s'
	db	113	;'q'
	db	117	;'u'
	db	97	;'a'
	db	114	;'r'
	db	101	;'e'
	db	32
	db	119	;'w'
	db	97	;'a'
	db	118	;'v'
	db	101	;'e'
	db	32
	db	101	;'e'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_281:
	db	82	;'R'
	db	65	;'A'
	db	87	;'W'
	db	58	;':'
	db	32
	db	37
	db	48	;'0'
	db	50	;'2'
	db	88	;'X'
	db	32
	db	37
	db	48	;'0'
	db	50	;'2'
	db	88	;'X'
	db	32
	db	37
	db	48	;'0'
	db	50	;'2'
	db	88	;'X'
	db	32
	db	37
	db	48	;'0'
	db	50	;'2'
	db	88	;'X'
	db	32
	db	37
	db	48	;'0'
	db	50	;'2'
	db	88	;'X'
	db	32
	db	37
	db	48	;'0'
	db	50	;'2'
	db	88	;'X'
	db	32
	db	37
	db	48	;'0'
	db	50	;'2'
	db	88	;'X'
	db	0
	
STR_286:
	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	69	;'E'
	db	82	;'R'
	db	82	;'R'
	db	79	;'O'
	db	82	;'R'
	db	32
	db	45
	db	32
	db	65	;'A'
	db	100	;'d'
	db	100	;'d'
	db	114	;'r'
	db	101	;'e'
	db	115	;'s'
	db	115	;'s'
	db	32
	db	119	;'w'
	db	114	;'r'
	db	105	;'i'
	db	116	;'t'
	db	101	;'e'
	db	32
	db	102	;'f'
	db	97	;'a'
	db	105	;'i'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_6:
	db	65	;'A'
	db	102	;'f'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	32
	db	105	;'i'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	114	;'r'
	db	101	;'e'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	95	;'_'
	db	115	;'s'
	db	116	;'t'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	99	;'c'
	db	111	;'o'
	db	117	;'u'
	db	110	;'n'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_289:
	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	67	;'C'
	db	111	;'o'
	db	110	;'n'
	db	102	;'f'
	db	105	;'i'
	db	103	;'g'
	db	32
	db	114	;'r'
	db	101	;'e'
	db	103	;'g'
	db	105	;'i'
	db	115	;'s'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	32
	db	97	;'a'
	db	100	;'d'
	db	100	;'d'
	db	114	;'r'
	db	101	;'e'
	db	115	;'s'
	db	115	;'s'
	db	32
	db	65	;'A'
	db	67	;'C'
	db	75	;'K'
	db	0
	
STR_291:
	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	67	;'C'
	db	111	;'o'
	db	110	;'n'
	db	102	;'f'
	db	105	;'i'
	db	103	;'g'
	db	32
	db	119	;'w'
	db	114	;'r'
	db	105	;'i'
	db	116	;'t'
	db	116	;'t'
	db	101	;'e'
	db	110	;'n'
	db	32
	db	115	;'s'
	db	117	;'u'
	db	99	;'c'
	db	99	;'c'
	db	101	;'e'
	db	115	;'s'
	db	115	;'s'
	db	102	;'f'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	121	;'y'
	db	0
	
STR_273:
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	32
	db	116	;'t'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	32
	db	101	;'e'
	db	100	;'d'
	db	105	;'i'
	db	116	;'t'
	db	111	;'o'
	db	114	;'r'
	db	58	;':'
	db	32
	db	115	;'s'
	db	101	;'e'
	db	99	;'c'
	db	111	;'o'
	db	110	;'n'
	db	100	;'d'
	db	115	;'s'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	108	;'l'
	db	105	;'i'
	db	110	;'n'
	db	101	;'e'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_284:
	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
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
	db	99	;'c'
	db	111	;'o'
	db	110	;'n'
	db	102	;'f'
	db	105	;'i'
	db	103	;'g'
	db	32
	db	114	;'r'
	db	101	;'e'
	db	103	;'g'
	db	105	;'i'
	db	115	;'s'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	46
	db	46
	db	46
	db	0
	
STR_245:
	db	67	;'C'
	db	76	;'L'
	db	79	;'O'
	db	67	;'C'
	db	75	;'K'
	db	32
	db	101	;'e'
	db	100	;'d'
	db	105	;'i'
	db	116	;'t'
	db	32
	db	114	;'r'
	db	111	;'o'
	db	116	;'t'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
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
	db	100	;'d'
	db	101	;'e'
	db	108	;'l'
	db	116	;'t'
	db	97	;'a'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_248:
	db	78	;'N'
	db	97	;'a'
	db	118	;'v'
	db	32
	db	68	;'D'
	db	79	;'O'
	db	87	;'W'
	db	78	;'N'
	db	58	;':'
	db	32
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
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
	
STR_9:
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
	db	32
	db	82	;'R'
	db	84	;'T'
	db	67	;'C'
	db	32
	db	40
	db	50	;'2'
	db	45
	db	115	;'s'
	db	101	;'e'
	db	99	;'c'
	db	111	;'o'
	db	110	;'n'
	db	100	;'d'
	db	32
	db	100	;'d'
	db	101	;'e'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	41
	db	46
	db	46
	db	46
	db	0
	
STR_25:
	db	82	;'R'
	db	84	;'T'
	db	67	;'C'
	db	58	;':'
	db	32
	db	50	;'2'
	db	48	;'0'
	db	37
	db	48	;'0'
	db	50	;'2'
	db	117	;'u'
	db	45
	db	37
	db	48	;'0'
	db	50	;'2'
	db	117	;'u'
	db	45
	db	37
	db	48	;'0'
	db	50	;'2'
	db	117	;'u'
	db	32
	db	37
	db	48	;'0'
	db	50	;'2'
	db	117	;'u'
	db	58	;':'
	db	37
	db	48	;'0'
	db	50	;'2'
	db	117	;'u'
	db	58	;':'
	db	37
	db	48	;'0'
	db	50	;'2'
	db	117	;'u'
	db	0
	
STR_12:
	db	82	;'R'
	db	84	;'T'
	db	67	;'C'
	db	32
	db	116	;'t'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	32
	db	115	;'s'
	db	101	;'e'
	db	116	;'t'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	32
	db	50	;'2'
	db	48	;'0'
	db	50	;'2'
	db	53	;'5'
	db	45
	db	49	;'1'
	db	48	;'0'
	db	45
	db	48	;'0'
	db	55	;'7'
	db	32
	db	49	;'1'
	db	50	;'2'
	db	58	;':'
	db	48	;'0'
	db	48	;'0'
	db	58	;':'
	db	48	;'0'
	db	48	;'0'
	db	0
	
STR_42:
	db	76	;'L'
	db	111	;'o'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	112	;'p'
	db	114	;'r'
	db	101	;'e'
	db	115	;'s'
	db	115	;'s'
	db	32
	db	116	;'t'
	db	104	;'h'
	db	114	;'r'
	db	101	;'e'
	db	115	;'s'
	db	104	;'h'
	db	111	;'o'
	db	108	;'l'
	db	100	;'d'
	db	32
	db	114	;'r'
	db	101	;'e'
	db	97	;'a'
	db	99	;'c'
	db	104	;'h'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	45
	db	32
	db	98	;'b'
	db	101	;'e'
	db	101	;'e'
	db	112	;'p'
	db	0
	
STR_132:
	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	32
	db	105	;'i'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	115	;'s'
	db	101	;'e'
	db	99	;'c'
	db	115	;'s'
	db	61	;'='
	db	37
	db	100	;'d'
	db	32
	db	45
	db	62	;'>'
	db	32
	db	88	;'X'
	db	88	;'X'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	89	;'Y'
	db	89	;'Y'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_229:
	db	82	;'R'
	db	101	;'e'
	db	98	;'b'
	db	117	;'u'
	db	105	;'i'
	db	108	;'l'
	db	100	;'d'
	db	32
	db	99	;'c'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
	db	58	;':'
	db	32
	db	101	;'e'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	109	;'m'
	db	111	;'o'
	db	100	;'d'
	db	101	;'e'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_250:
	db	78	;'N'
	db	97	;'a'
	db	118	;'v'
	db	32
	db	85	;'U'
	db	80	;'P'
	db	58	;':'
	db	32
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
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
	
STR_28:
	db	82	;'R'
	db	69	;'E'
	db	76	;'L'
	db	65	;'A'
	db	89	;'Y'
	db	32
	db	67	;'C'
	db	72	;'H'
	db	65	;'A'
	db	78	;'N'
	db	71	;'G'
	db	69	;'E'
	db	58	;':'
	db	32
	db	115	;'s'
	db	116	;'t'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	99	;'c'
	db	111	;'o'
	db	117	;'u'
	db	110	;'n'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_11:
	db	69	;'E'
	db	82	;'R'
	db	82	;'R'
	db	79	;'O'
	db	82	;'R'
	db	58	;':'
	db	32
	db	82	;'R'
	db	84	;'T'
	db	67	;'C'
	db	32
	db	105	;'i'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	105	;'i'
	db	97	;'a'
	db	108	;'l'
	db	105	;'i'
	db	122	;'z'
	db	97	;'a'
	db	116	;'t'
	db	105	;'i'
	db	111	;'o'
	db	110	;'n'
	db	32
	db	102	;'f'
	db	97	;'a'
	db	105	;'i'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	33
	db	0
	
STR_39:
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
	
STR_258:
	db	83	;'S'
	db	97	;'a'
	db	118	;'v'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	114	;'r'
	db	101	;'e'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	95	;'_'
	db	112	;'p'
	db	117	;'u'
	db	108	;'l'
	db	115	;'s'
	db	101	;'e'
	db	95	;'_'
	db	116	;'t'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	32
	db	61	;'='
	db	32
	db	37
	db	100	;'d'
	db	32
	db	115	;'s'
	db	101	;'e'
	db	99	;'c'
	db	0
	
STR_274:
	db	67	;'C'
	db	76	;'L'
	db	79	;'O'
	db	67	;'C'
	db	75	;'K'
	db	32
	db	98	;'b'
	db	116	;'t'
	db	110	;'n'
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
	db	101	;'e'
	db	100	;'d'
	db	105	;'i'
	db	116	;'t'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_247:
	db	65	;'A'
	db	102	;'f'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	32
	db	114	;'r'
	db	111	;'o'
	db	116	;'t'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
	db	58	;':'
	db	32
	db	102	;'f'
	db	108	;'l'
	db	97	;'a'
	db	103	;'g'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	118	;'v'
	db	97	;'a'
	db	108	;'l'
	db	117	;'u'
	db	101	;'e'
	db	61	;'='
	db	37
	db	115	;'s'
	db	0
	
STR_285:
	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	69	;'E'
	db	82	;'R'
	db	82	;'R'
	db	79	;'O'
	db	82	;'R'
	db	32
	db	45
	db	32
	db	83	;'S'
	db	116	;'t'
	db	97	;'a'
	db	114	;'r'
	db	116	;'t'
	db	32
	db	102	;'f'
	db	97	;'a'
	db	105	;'i'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_287:
	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	65	;'A'
	db	100	;'d'
	db	100	;'d'
	db	114	;'r'
	db	101	;'e'
	db	115	;'s'
	db	115	;'s'
	db	32
	db	65	;'A'
	db	67	;'C'
	db	75	;'K'
	db	32
	db	114	;'r'
	db	101	;'e'
	db	99	;'c'
	db	101	;'e'
	db	105	;'i'
	db	118	;'v'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_192:
	db	104	;'h'
	db	97	;'a'
	db	110	;'n'
	db	100	;'d'
	db	108	;'l'
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
	db	114	;'r'
	db	111	;'o'
	db	116	;'t'
	db	97	;'a'
	db	116	;'t'
	db	105	;'i'
	db	111	;'o'
	db	110	;'n'
	db	32
	db	99	;'c'
	db	97	;'a'
	db	108	;'l'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_292:
	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	67	;'C'
	db	111	;'o'
	db	109	;'m'
	db	112	;'p'
	db	108	;'l'
	db	101	;'e'
	db	116	;'t'
	db	101	;'e'
	db	32
	db	45
	db	32
	db	83	;'S'
	db	85	;'U'
	db	67	;'C'
	db	67	;'C'
	db	69	;'E'
	db	83	;'S'
	db	83	;'S'
	db	0
	
STR_133:
	db	104	;'h'
	db	97	;'a'
	db	110	;'n'
	db	100	;'d'
	db	108	;'l'
	db	101	;'e'
	db	95	;'_'
	db	116	;'t'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	95	;'_'
	db	114	;'r'
	db	111	;'o'
	db	116	;'t'
	db	97	;'a'
	db	116	;'t'
	db	105	;'i'
	db	111	;'o'
	db	110	;'n'
	db	32
	db	99	;'c'
	db	97	;'a'
	db	108	;'l'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	33
	db	0
	
STR_193:
	db	101	;'e'
	db	100	;'d'
	db	105	;'i'
	db	116	;'t'
	db	95	;'_'
	db	100	;'d'
	db	105	;'i'
	db	103	;'g'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	37
	db	100	;'d'
	db	44
	db	32
	db	117	;'u'
	db	110	;'n'
	db	115	;'s'
	db	105	;'i'
	db	103	;'g'
	db	110	;'n'
	db	101	;'e'
	db	100	;'d'
	db	58	;':'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_239:
	db	67	;'C'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
	db	32
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	32
	db	114	;'r'
	db	101	;'e'
	db	98	;'b'
	db	117	;'u'
	db	105	;'i'
	db	108	;'l'
	db	116	;'t'
	db	58	;':'
	db	32
	db	37
	db	100	;'d'
	db	32
	db	105	;'i'
	db	116	;'t'
	db	101	;'e'
	db	109	;'m'
	db	115	;'s'
	db	0
	
STR_4:
	db	82	;'R'
	db	101	;'e'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	32
	db	67	;'C'
	db	76	;'L'
	db	79	;'O'
	db	83	;'S'
	db	69	;'E'
	db	68	;'D'
	db	32
	db	45
	db	32
	db	102	;'f'
	db	97	;'a'
	db	117	;'u'
	db	108	;'l'
	db	116	;'t'
	db	32
	db	99	;'c'
	db	108	;'l'
	db	101	;'e'
	db	97	;'a'
	db	114	;'r'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_283:
	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	67	;'C'
	db	79	;'O'
	db	78	;'N'
	db	86	;'V'
	db	83	;'S'
	db	84	;'T'
	db	32
	db	99	;'c'
	db	111	;'o'
	db	110	;'n'
	db	102	;'f'
	db	105	;'i'
	db	103	;'g'
	db	117	;'u'
	db	114	;'r'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_254:
	db	83	;'S'
	db	97	;'a'
	db	118	;'v'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	101	;'e'
	db	110	;'n'
	db	100	;'d'
	db	95	;'_'
	db	114	;'r'
	db	117	;'u'
	db	110	;'n'
	db	116	;'t'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	95	;'_'
	db	109	;'m'
	db	111	;'o'
	db	100	;'d'
	db	101	;'e'
	db	32
	db	61	;'='
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_249:
	db	65	;'A'
	db	102	;'f'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	32
	db	68	;'D'
	db	79	;'O'
	db	87	;'W'
	db	78	;'N'
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
	db	112	;'p'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_15:
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
	
STR_14:
	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	32
	db	114	;'r'
	db	101	;'e'
	db	116	;'t'
	db	117	;'u'
	db	114	;'r'
	db	110	;'n'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	101	;'e'
	db	114	;'r'
	db	114	;'r'
	db	111	;'o'
	db	114	;'r'
	db	58	;':'
	db	32
	db	37
	db	117	;'u'
	db	0
	
STR_138:
	db	70	;'F'
	db	105	;'i'
	db	110	;'n'
	db	97	;'a'
	db	108	;'l'
	db	32
	db	100	;'d'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	32
	db	115	;'s'
	db	116	;'t'
	db	114	;'r'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	58	;':'
	db	32
	db	40
	db	37
	db	115	;'s'
	db	41
	db	0
	
STR_262:
	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	32
	db	101	;'e'
	db	100	;'d'
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
	db	32
	db	45
	db	32
	db	115	;'s'
	db	97	;'a'
	db	118	;'v'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_3:
	db	82	;'R'
	db	101	;'e'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	32
	db	79	;'O'
	db	80	;'P'
	db	69	;'E'
	db	78	;'N'
	db	32
	db	45
	db	32
	db	80	;'P'
	db	85	;'U'
	db	76	;'L'
	db	83	;'S'
	db	69	;'E'
	db	58	;':'
	db	32
	db	37
	db	100	;'d'
	db	32
	db	115	;'s'
	db	101	;'e'
	db	99	;'c'
	db	0
	
STR_251:
	db	65	;'A'
	db	102	;'f'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	32
	db	85	;'U'
	db	80	;'P'
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
	db	112	;'p'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_255:
	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	32
	db	98	;'b'
	db	117	;'u'
	db	116	;'t'
	db	116	;'t'
	db	111	;'o'
	db	110	;'n'
	db	58	;':'
	db	32
	db	100	;'d'
	db	105	;'i'
	db	103	;'g'
	db	105	;'i'
	db	116	;'t'
	db	32
	db	110	;'n'
	db	111	;'o'
	db	119	;'w'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_33:
	db	76	;'L'
	db	111	;'o'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	112	;'p'
	db	114	;'r'
	db	101	;'e'
	db	115	;'s'
	db	115	;'s'
	db	32
	db	45
	db	32
	db	101	;'e'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	32
	db	109	;'m'
	db	97	;'a'
	db	105	;'i'
	db	110	;'n'
	db	0
	
STR_253:
	db	83	;'S'
	db	97	;'a'
	db	118	;'v'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	99	;'c'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
	db	95	;'_'
	db	101	;'e'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	61	;'='
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_135:
	db	82	;'R'
	db	111	;'o'
	db	116	;'t'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
	db	32
	db	101	;'e'
	db	110	;'n'
	db	100	;'d'
	db	58	;':'
	db	32
	db	88	;'X'
	db	88	;'X'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	89	;'Y'
	db	89	;'Y'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_275:
	db	69	;'E'
	db	110	;'n'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	67	;'C'
	db	76	;'L'
	db	79	;'O'
	db	67	;'C'
	db	75	;'K'
	db	32
	db	101	;'e'
	db	100	;'d'
	db	105	;'i'
	db	116	;'t'
	db	32
	db	109	;'m'
	db	111	;'o'
	db	100	;'d'
	db	101	;'e'
	db	0
	
STR_21:
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
	
STR_246:
	db	66	;'B'
	db	101	;'e'
	db	102	;'f'
	db	111	;'o'
	db	114	;'r'
	db	101	;'e'
	db	32
	db	114	;'r'
	db	111	;'o'
	db	116	;'t'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
	db	58	;':'
	db	32
	db	102	;'f'
	db	108	;'l'
	db	97	;'a'
	db	103	;'g'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_5:
	db	61	;'='
	db	61	;'='
	db	61	;'='
	db	32
	db	83	;'S'
	db	89	;'Y'
	db	83	;'S'
	db	84	;'T'
	db	69	;'E'
	db	77	;'M'
	db	32
	db	83	;'S'
	db	84	;'T'
	db	65	;'A'
	db	82	;'R'
	db	84	;'T'
	db	85	;'U'
	db	80	;'P'
	db	32
	db	61	;'='
	db	61	;'='
	db	61	;'='
	db	0
	
STR_16:
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
	
STR_29:
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
	
STR_282:
	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	83	;'S'
	db	116	;'t'
	db	97	;'a'
	db	114	;'r'
	db	116	;'t'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	46
	db	46
	db	46
	db	0
	
STR_36:
	db	77	;'M'
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
	db	32
	db	100	;'d'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_19:
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
	
STR_22:
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
	
STR_23:
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
	
STR_142:
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
	
STR_212:
	db	83	;'S'
	db	69	;'E'
	db	84	;'T'
	db	85	;'U'
	db	80	;'P'
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
	
STR_202:
	db	79	;'O'
	db	80	;'P'
	db	84	;'T'
	db	73	;'I'
	db	79	;'O'
	db	78	;'N'
	db	83	;'S'
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
	
STR_38:
	db	69	;'E'
	db	69	;'E'
	db	80	;'P'
	db	82	;'R'
	db	79	;'O'
	db	77	;'M'
	db	32
	db	115	;'s'
	db	97	;'a'
	db	118	;'v'
	db	101	;'e'
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
	
STR_280:
	db	70	;'F'
	db	105	;'i'
	db	101	;'e'
	db	108	;'l'
	db	100	;'d'
	db	32
	db	110	;'n'
	db	111	;'o'
	db	116	;'t'
	db	32
	db	101	;'e'
	db	100	;'d'
	db	105	;'i'
	db	116	;'t'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	33
	db	0
	
STR_252:
	db	67	;'C'
	db	76	;'L'
	db	79	;'O'
	db	67	;'C'
	db	75	;'K'
	db	32
	db	115	;'s'
	db	97	;'a'
	db	118	;'v'
	db	101	;'e'
	db	58	;':'
	db	32
	db	108	;'l'
	db	105	;'i'
	db	110	;'n'
	db	101	;'e'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_7:
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
	db	32
	db	73	;'I'
	db	50	;'2'
	db	67	;'C'
	db	46
	db	46
	db	46
	db	0
	
STR_37:
	db	83	;'S'
	db	97	;'a'
	db	118	;'v'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	32
	db	69	;'E'
	db	69	;'E'
	db	80	;'P'
	db	82	;'R'
	db	79	;'O'
	db	77	;'M'
	db	46
	db	46
	db	46
	db	0
	
STR_13:
	db	82	;'R'
	db	84	;'T'
	db	67	;'C'
	db	32
	db	116	;'t'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	32
	db	115	;'s'
	db	101	;'e'
	db	116	;'t'
	db	32
	db	70	;'F'
	db	65	;'A'
	db	73	;'I'
	db	76	;'L'
	db	69	;'E'
	db	68	;'D'
	db	0
	
STR_31:
	db	76	;'L'
	db	111	;'o'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	112	;'p'
	db	114	;'r'
	db	101	;'e'
	db	115	;'s'
	db	115	;'s'
	db	32
	db	100	;'d'
	db	101	;'e'
	db	116	;'t'
	db	101	;'e'
	db	99	;'c'
	db	116	;'t'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_20:
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
	
STR_24:
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
	
STR_294:
	db	48	;'0'
	db	49	;'1'
	db	50	;'2'
	db	51	;'3'
	db	52	;'4'
	db	53	;'5'
	db	54	;'6'
	db	55	;'7'
	db	56	;'8'
	db	57	;'9'
	db	65	;'A'
	db	66	;'B'
	db	67	;'C'
	db	68	;'D'
	db	69	;'E'
	db	70	;'F'
	db	0
	
STR_30:
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
	
STR_27:
	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	58	;':'
	db	32
	db	37
	db	52	;'4'
	db	117	;'u'
	db	32
	db	37
	db	52	;'4'
	db	117	;'u'
	db	32
	db	37
	db	52	;'4'
	db	117	;'u'
	db	0
	
STR_18:
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
	
STR_8:
	db	73	;'I'
	db	50	;'2'
	db	67	;'C'
	db	32
	db	105	;'i'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	105	;'i'
	db	97	;'a'
	db	108	;'l'
	db	105	;'i'
	db	122	;'z'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_26:
	db	82	;'R'
	db	84	;'T'
	db	67	;'C'
	db	58	;':'
	db	32
	db	82	;'R'
	db	101	;'e'
	db	97	;'a'
	db	100	;'d'
	db	32
	db	101	;'e'
	db	114	;'r'
	db	114	;'r'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_32:
	db	69	;'E'
	db	100	;'d'
	db	105	;'i'
	db	116	;'t'
	db	32
	db	99	;'c'
	db	97	;'a'
	db	110	;'n'
	db	99	;'c'
	db	101	;'e'
	db	108	;'l'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_91:
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
	
STR_82:
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
	
STR_17:
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
	
STR_123:
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
	
STR_89:
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
	
STR_34:
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
	
STR_88:
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
	
STR_112:
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
	
STR_81:
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
	
STR_87:
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
	
STR_150:
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
	
STR_129:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	80	;'P'
	db	117	;'u'
	db	108	;'l'
	db	115	;'s'
	db	101	;'e'
	db	0
	
STR_103:
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
	
STR_80:
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
	
STR_90:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_104:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	84	;'T'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_205:
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_195:
	db	37
	db	99	;'c'
	db	37
	db	100	;'d'
	db	37
	db	100	;'d'
	db	37
	db	100	;'d'
	db	0
	
STR_45:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_77:
	db	78	;'N'
	db	111	;'o'
	db	116	;'t'
	db	32
	db	85	;'U'
	db	115	;'s'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_94:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	0
	
STR_122:
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_95:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_96:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_46:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_56:
	db	68	;'D'
	db	105	;'i'
	db	103	;'g'
	db	105	;'i'
	db	116	;'t'
	db	97	;'a'
	db	108	;'l'
	db	0
	
STR_128:
	db	69	;'E'
	db	110	;'n'
	db	100	;'d'
	db	32
	db	82	;'R'
	db	117	;'u'
	db	110	;'n'
	db	0
	
STR_113:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_111:
	db	78	;'N'
	db	111	;'o'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_97:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	0
	
STR_41:
	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_293:
	db	40
	db	110	;'n'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	41
	db	0
	
STR_85:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	0
	
STR_55:
	db	65	;'A'
	db	110	;'n'
	db	97	;'a'
	db	108	;'l'
	db	111	;'o'
	db	103	;'g'
	db	0
	
STR_86:
	db	83	;'S'
	db	101	;'e'
	db	110	;'n'
	db	115	;'s'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_240:
	db	67	;'C'
	db	76	;'L'
	db	79	;'O'
	db	67	;'C'
	db	75	;'K'
	db	0
	
STR_92:
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_93:
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_147:
	db	37
	db	43
	db	48	;'0'
	db	52	;'4'
	db	100	;'d'
	db	0
	
STR_75:
	db	76	;'L'
	db	97	;'a'
	db	116	;'t'
	db	99	;'c'
	db	104	;'h'
	db	0
	
STR_216:
	db	67	;'C'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_119:
	db	85	;'U'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	115	;'s'
	db	0
	
STR_83:
	db	65	;'A'
	db	98	;'b'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_35:
	db	82	;'R'
	db	101	;'e'
	db	97	;'a'
	db	100	;'d'
	db	121	;'y'
	db	0
	
STR_149:
	db	37
	db	48	;'0'
	db	51	;'3'
	db	100	;'d'
	db	0
	
STR_70:
	db	72	;'H'
	db	105	;'i'
	db	100	;'d'
	db	101	;'e'
	db	0
	
STR_110:
	db	84	;'T'
	db	121	;'y'
	db	112	;'p'
	db	101	;'e'
	db	0
	
STR_98:
	db	66	;'B'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_84:
	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	0
	
STR_71:
	db	83	;'S'
	db	104	;'h'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_66:
	db	76	;'L'
	db	112	;'p'
	db	83	;'S'
	db	0
	
STR_65:
	db	37
	db	0
	
STR_140:
	db	40
	db	0
	
STR_223:
	db	42
	db	0
	
STR_203:
	db	91	;'['
	db	0
	
STR_204:
	db	93	;']'
	db	0
STR_106	equ	STR_97+0
STR_114	equ	STR_97+0
STR_125	equ	STR_97+0
STR_130	equ	STR_97+0
STR_52	equ	STR_111+3
STR_175	equ	STR_111+3
STR_220	equ	STR_111+3
STR_163	equ	STR_71+0
STR_173	equ	STR_71+0
STR_178	equ	STR_71+0
STR_237	equ	STR_71+0
STR_279	equ	STR_71+0
STR_124	equ	STR_113+0
STR_60	equ	STR_113+4
STR_189	equ	STR_113+4
STR_136	equ	STR_247+29
STR_143	equ	STR_247+29
STR_230	equ	STR_247+29
STR_100	equ	STR_86+0
STR_109	equ	STR_86+0
STR_117	equ	STR_86+0
STR_51	equ	STR_103+5
STR_165	equ	STR_103+5
STR_219	equ	STR_103+5
STR_177	equ	STR_56+0
STR_107	equ	STR_98+0
STR_115	equ	STR_98+0
STR_126	equ	STR_98+0
STR_131	equ	STR_98+0
STR_217	equ	STR_98+0
STR_105	equ	STR_94+0
STR_61	equ	STR_94+4
STR_154	equ	STR_75+0
STR_157	equ	STR_75+0
STR_160	equ	STR_75+0
STR_170	equ	STR_75+0
STR_180	equ	STR_75+0
STR_233	equ	STR_75+0
STR_277	equ	STR_75+0
STR_176	equ	STR_55+0
STR_44	equ	STR_38+0
STR_76	equ	STR_129+4
STR_155	equ	STR_129+4
STR_158	equ	STR_129+4
STR_161	equ	STR_129+4
STR_171	equ	STR_129+4
STR_181	equ	STR_129+4
STR_234	equ	STR_129+4
STR_278	equ	STR_129+4
STR_50	equ	STR_89+3
STR_146	equ	STR_89+3
STR_218	equ	STR_89+3
STR_118	equ	STR_110+0
STR_99	equ	STR_85+0
STR_108	equ	STR_85+0
STR_116	equ	STR_85+0
STR_127	equ	STR_85+0
STR_164	equ	STR_70+0
STR_174	equ	STR_70+0
STR_179	equ	STR_70+0
STR_156	equ	STR_77+0
STR_159	equ	STR_77+0
STR_162	equ	STR_77+0
STR_172	equ	STR_77+0
STR_182	equ	STR_77+0
STR_235	equ	STR_77+0
STR_145	equ	STR_45+0
STR_232	equ	STR_45+0
STR_144	equ	STR_46+0
STR_231	equ	STR_46+0
STR_276	equ	STR_46+0
STR_148	equ	STR_147+0
STR_166	equ	STR_147+0
STR_167	equ	STR_147+0
STR_185	equ	STR_147+0
STR_186	equ	STR_147+0
STR_263	equ	STR_147+0
STR_264	equ	STR_147+0
STR_267	equ	STR_147+0
STR_268	equ	STR_147+0
STR_270	equ	STR_147+0
STR_271	equ	STR_147+0
STR_151	equ	STR_149+0
STR_187	equ	STR_149+0
STR_265	equ	STR_149+0
STR_266	equ	STR_149+0
STR_269	equ	STR_149+0
STR_272	equ	STR_149+0
STR_152	equ	STR_150+0
STR_153	equ	STR_150+0
STR_169	equ	STR_150+0
STR_188	equ	STR_150+0
STR_190	equ	STR_150+0
STR_236	equ	STR_150+0
STR_256	equ	STR_150+0
STR_257	equ	STR_150+0
STR_261	equ	STR_150+0
STR_194	equ	STR_195+2
STR_260	equ	STR_255+0
STR_168	equ	STR_29+20
STR_210	equ	STR_204+0
STR_222	equ	STR_204+0
STR_226	equ	STR_204+0
STR_243	equ	STR_204+0
STR_208	equ	STR_203+0
STR_221	equ	STR_203+0
STR_225	equ	STR_203+0
STR_241	equ	STR_203+0
STR_184	equ	STR_66+0
STR_40	equ	STR_34+0
STR_101	equ	STR_87+0
STR_120	equ	STR_87+0
STR_102	equ	STR_88+0
STR_121	equ	STR_88+0
STR_43	equ	STR_37+0
STR_227	equ	STR_223+0
STR_141	equ	STR_293+5
STR_198	equ	STR_293+5
STR_201	equ	STR_293+5
STR_211	equ	STR_293+5
STR_244	equ	STR_293+5
STR_197	equ	STR_140+0
STR_200	equ	STR_140+0
STR_209	equ	STR_140+0
STR_242	equ	STR_140+0
STR_183	equ	STR_65+0
STR_139	equ	STR_142+13
STR_196	equ	STR_142+14
STR_199	equ	STR_142+15
STR_206	equ	STR_142+15
STR_224	equ	STR_142+19
STR_228	equ	STR_142+19
STR_47	equ	STR_142+20
STR_48	equ	STR_142+20
STR_49	equ	STR_142+20
STR_53	equ	STR_142+20
STR_54	equ	STR_142+20
STR_57	equ	STR_142+20
STR_58	equ	STR_142+20
STR_59	equ	STR_142+20
STR_62	equ	STR_142+20
STR_63	equ	STR_142+20
STR_64	equ	STR_142+20
STR_67	equ	STR_142+20
STR_68	equ	STR_142+20
STR_69	equ	STR_142+20
STR_72	equ	STR_142+20
STR_73	equ	STR_142+20
STR_74	equ	STR_142+20
STR_78	equ	STR_142+20
STR_79	equ	STR_142+20
STR_207	equ	STR_142+20
STR_213	equ	STR_142+20
STR_214	equ	STR_142+20
STR_215	equ	STR_142+20
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
_relay_ms_counter:
       ds      1
	global	_ms_counter
_ms_counter:
       ds      1
	global	_button_pressed
_button_pressed:
       ds      1
	global	_relay_latch_mode
_relay_latch_mode:
       ds      1
	global	_relay_low_edit_flag
_relay_low_edit_flag:
       ds      1
	global	_relay_plp_edit_flag
_relay_plp_edit_flag:
       ds      1
	global	_relay_high_edit_flag
_relay_high_edit_flag:
       ds      1
	global	_flow_units_edit_flag
_flow_units_edit_flag:
       ds      1
	global	_no_flow_edit_flag
_no_flow_edit_flag:
       ds      1
	global	_sensor_edit_flag
_sensor_edit_flag:
       ds      1
psect	dataCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pdataCOMRAM
__pdataCOMRAM:
	file	"src\eeprom.c"
	line	11
	global	_menu_timeout_seconds
_menu_timeout_seconds:
       ds      2
psect	dataCOMRAM
	file	"src\encoder.c"
	line	32
_last_btn:
       ds      1
psect	dataCOMRAM
	file	"src\menu.c"
	line	28
	global	_relay_slp_edit_flag
_relay_slp_edit_flag:
       ds      1
psect	dataCOMRAM
	file	"src\menu.c"
	line	25
	global	_display_edit_flag
_display_edit_flag:
       ds      1
psect	dataCOMRAM
	file	"src\menu.c"
	line	22
	global	_flow_type_edit_flag
_flow_type_edit_flag:
       ds      1
psect	dataCOMRAM
	file	"src\menu.c"
	line	20
	global	_enable_edit_flag
_enable_edit_flag:
       ds      1
psect	bssBANK0,class=BANK0,space=1,noexec,lowdata
global __pbssBANK0
__pbssBANK0:
main@blink_timer:
       ds      4
	global	_relay_state
_relay_state:
       ds      1
psect	bssBANK1,class=BANK1,space=1,noexec,lowdata
global __pbssBANK1
__pbssBANK1:
main@last_relay_counter:
       ds      2
main@encoder_activity_timer:
       ds      2
	global	_encoder_count
_encoder_count:
       ds      2
main@last_menu_state:
       ds      1
main@last_relay_state:
       ds      1
main@sample_counter:
       ds      1
	global	_save_pending
_save_pending:
       ds      1
	global	_long_press_beep_flag
_long_press_beep_flag:
       ds      1
psect	dataBANK1,class=BANK1,space=1,noexec,lowdata
global __pdataBANK1
__pdataBANK1:
	file	"src\encoder.c"
	line	16
	global	_menu_timeout_flag
_menu_timeout_flag:
       ds      1
psect	bssBANK2,class=BANK2,space=1,noexec,lowdata
global __pbssBANK2
__pbssBANK2:
	global	_relay_counter
_relay_counter:
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
	global	_current_input
_current_input:
       ds      1
psect	bssBANK3,class=BANK3,space=1,noexec,lowdata
global __pbssBANK3
__pbssBANK3:
	global	_menu
_menu:
       ds      22
main@last_second_update:
       ds      4
	global	_input_menu
_input_menu:
       ds      75
	global	_clock_menu
_clock_menu:
       ds      25
psect	dataBANK3,class=BANK3,space=1,noexec,lowdata
global __pdataBANK3
__pdataBANK3:
	file	"src\menu.c"
	line	102
_value_relay_pulse:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	84
_value_display:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	76
_value_scale20:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	75
_value_scale4:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	73
_value_enable:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	85
_value_back:
       ds      5
psect	bssBANK4,class=BANK4,space=1,noexec,lowdata
global __pbssBANK4
__pbssBANK4:
menu_update_numeric_value@F2630:
       ds      6
_original_value:
       ds      10
psect	dataBANK4,class=BANK4,space=1,noexec,lowdata
global __pdataBANK4
__pdataBANK4:
	file	"src\menu.c"
	line	1230
menu_draw_setup@F2659:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	65
	global	_options_menu
_options_menu:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	74
_value_sensor:
       ds      12
psect	dataBANK4
	file	"src\menu.c"
	line	103
_value_clock_display:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	101
_value_end_runtime:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	100
_value_clock_enable:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	97
_value_high_tbp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	96
_value_low_flow_bp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	95
_value_no_flow_bp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	94
_value_low_flow:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	93
_value_no_flow:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	92
_value_flow_units:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	91
_value_flow_type:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	90
_value_high_temp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	89
_value_low_pressure:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	88
_value_hi_pressure:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	83
_value_rlylow:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	82
_value_rlyslp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	81
_value_rlyplp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	80
_value_rlyhigh:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	79
_value_slpbp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	78
_value_plpbp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	77
_value_highbp:
       ds      10
psect	bssBANK5,class=BANK5,space=1,noexec,lowdata
global __pbssBANK5
__pbssBANK5:
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
; Initialize objects allocated to BANK4 (232 bytes)
	global __pidataBANK4
	; load TBLPTR registers with __pidataBANK4
	movlw	low (__pidataBANK4)
	movwf	tblptrl
	movlw	high(__pidataBANK4)
	movwf	tblptrh
	movlw	low highword(__pidataBANK4)
	movwf	tblptru
	lfsr	0,__pdataBANK4
	lfsr	1,232
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK3 (55 bytes)
	global __pidataBANK3
	; load TBLPTR registers with __pidataBANK3
	movlw	low (__pidataBANK3)
	movwf	tblptrl
	movlw	high(__pidataBANK3)
	movwf	tblptrh
	movlw	low highword(__pidataBANK3)
	movwf	tblptru
	lfsr	0,__pdataBANK3
	lfsr	1,55
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
; Initialize objects allocated to BANK1 (1 bytes)
	global __pidataBANK1
	; load TBLPTR registers with __pidataBANK1
	movlw	low (__pidataBANK1)
	movwf	tblptrl
	movlw	high(__pidataBANK1)
	movwf	tblptrh
	movlw	low highword(__pidataBANK1)
	movwf	tblptru
	tblrd*+ ;fetch initializer
	movff	tablat, __pdataBANK1+0		
; Initialize objects allocated to COMRAM (7 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	lfsr	0,__pdataCOMRAM
	lfsr	1,7
	copy_data2:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data2
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
; Clear objects allocated to BANK5 (128 bytes)
	global __pbssBANK5
lfsr	0,__pbssBANK5
movlw	128
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
; Clear objects allocated to BANK4 (16 bytes)
	global __pbssBANK4
lfsr	0,__pbssBANK4
movlw	16
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
; Clear objects allocated to BANK3 (126 bytes)
	global __pbssBANK3
lfsr	0,__pbssBANK3
movlw	126
clear_3:
clrf	postinc0,c
decf	wreg
bnz	clear_3
; Clear objects allocated to BANK2 (6 bytes)
	global __pbssBANK2
movlb	2
clrf	(__pbssBANK2+5)&0xffh,b
clrf	(__pbssBANK2+4)&0xffh,b
clrf	(__pbssBANK2+3)&0xffh,b
clrf	(__pbssBANK2+2)&0xffh,b
clrf	(__pbssBANK2+1)&0xffh,b
clrf	(__pbssBANK2+0)&0xffh,b
; Clear objects allocated to BANK1 (11 bytes)
	global __pbssBANK1
lfsr	0,__pbssBANK1
movlw	11
clear_4:
clrf	postinc0,c
decf	wreg
bnz	clear_4
; Clear objects allocated to BANK0 (5 bytes)
	global __pbssBANK0
movlb	0
clrf	(__pbssBANK0+4)&0xffh,b
clrf	(__pbssBANK0+3)&0xffh,b
clrf	(__pbssBANK0+2)&0xffh,b
clrf	(__pbssBANK0+1)&0xffh,b
clrf	(__pbssBANK0+0)&0xffh,b
; Clear objects allocated to COMRAM (19 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	19
clear_5:
clrf	postinc0,c
decf	wreg
bnz	clear_5
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
psect	cstackBANK3,class=BANK3,space=1,noexec,lowdata
global __pcstackBANK3
__pcstackBANK3:
	global	main@buf_660
main@buf_660:	; 40 bytes @ 0x0
	ds   40
	global	main@buf_687
main@buf_687:	; 30 bytes @ 0x28
	ds   30
psect	cstackBANK2,class=BANK2,space=1,noexec,lowdata
global __pcstackBANK2
__pcstackBANK2:
	global	main@time_buf
main@time_buf:	; 60 bytes @ 0x0
	ds   60
	global	main@buf_657
main@buf_657:	; 60 bytes @ 0x3C
	ds   60
	global	main@buf
main@buf:	; 50 bytes @ 0x78
	ds   50
	global	main@buf_652
main@buf_652:	; 50 bytes @ 0xAA
	ds   50
	global	main@buf_618
main@buf_618:	; 30 bytes @ 0xDC
	ds   30
psect	cstackBANK1,class=BANK1,space=1,noexec,lowdata
global __pcstackBANK1
__pcstackBANK1:
	global	menu_handle_encoder@buf_1513
menu_handle_encoder@buf_1513:	; 50 bytes @ 0x0
	global	menu_handle_button@buf_1549
menu_handle_button@buf_1549:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_encoder@buf_1516
menu_handle_encoder@buf_1516:	; 50 bytes @ 0x32
	global	menu_handle_button@buf_1571
menu_handle_button@buf_1571:	; 50 bytes @ 0x32
	ds   50
	global	menu_handle_encoder@buf
menu_handle_encoder@buf:	; 50 bytes @ 0x64
	global	menu_handle_button@buf_1581
menu_handle_button@buf_1581:	; 50 bytes @ 0x64
	ds   50
	global	_menu_handle_encoder$1511
_menu_handle_encoder$1511:	; 2 bytes @ 0x96
	global	menu_handle_button@buf
menu_handle_button@buf:	; 50 bytes @ 0x96
	ds   2
	global	_menu_handle_encoder$1512
_menu_handle_encoder$1512:	; 2 bytes @ 0x98
	ds   2
	global	menu_handle_encoder@opts
menu_handle_encoder@opts:	; 2 bytes @ 0x9A
	ds   2
	global	menu_handle_encoder@sensor_type
menu_handle_encoder@sensor_type:	; 1 bytes @ 0x9C
	ds   1
	global	menu_handle_encoder@flow_type
menu_handle_encoder@flow_type:	; 1 bytes @ 0x9D
	ds   1
	global	menu_handle_encoder@clock_opts
menu_handle_encoder@clock_opts:	; 2 bytes @ 0x9E
	ds   2
	global	menu_handle_encoder@edit_flag
menu_handle_encoder@edit_flag:	; 2 bytes @ 0xA0
	ds   2
	global	menu_handle_encoder@clock_flag
menu_handle_encoder@clock_flag:	; 2 bytes @ 0xA2
	ds   38
	global	_menu_handle_button$1583
_menu_handle_button$1583:	; 2 bytes @ 0xC8
	ds   2
	global	menu_handle_button@edit_flag_1543
menu_handle_button@edit_flag_1543:	; 2 bytes @ 0xCA
	ds   2
	global	menu_handle_button@opts_1544
menu_handle_button@opts_1544:	; 2 bytes @ 0xCC
	ds   2
	global	menu_handle_button@edit_flag_1574
menu_handle_button@edit_flag_1574:	; 2 bytes @ 0xCE
	ds   2
	global	menu_handle_button@opts_1575
menu_handle_button@opts_1575:	; 2 bytes @ 0xD0
	ds   2
	global	menu_handle_button@current_val_1570
menu_handle_button@current_val_1570:	; 2 bytes @ 0xD2
	ds   2
	global	menu_handle_button@i
menu_handle_button@i:	; 1 bytes @ 0xD4
	ds   1
	global	menu_handle_button@new_value
menu_handle_button@new_value:	; 2 bytes @ 0xD5
	ds   2
	global	menu_handle_button@opts
menu_handle_button@opts:	; 2 bytes @ 0xD7
	ds   2
	global	menu_handle_button@edit_flag
menu_handle_button@edit_flag:	; 2 bytes @ 0xD9
	ds   2
	global	menu_handle_button@press_type
menu_handle_button@press_type:	; 1 bytes @ 0xDB
	ds   1
	global	menu_handle_button@current_val
menu_handle_button@current_val:	; 2 bytes @ 0xDC
	ds   2
	global	menu_handle_button@new_seconds
menu_handle_button@new_seconds:	; 2 bytes @ 0xDE
	ds   2
	global	menu_handle_button@flow_type_1567
menu_handle_button@flow_type_1567:	; 1 bytes @ 0xE0
	ds   1
	global	menu_handle_button@flow_type
menu_handle_button@flow_type:	; 1 bytes @ 0xE1
	ds   1
	global	menu_handle_button@sensor_type_1566
menu_handle_button@sensor_type_1566:	; 1 bytes @ 0xE2
	ds   1
	global	menu_handle_button@sensor_type
menu_handle_button@sensor_type:	; 1 bytes @ 0xE3
	ds   1
	global	menu_handle_button@new_value_1554
menu_handle_button@new_value_1554:	; 2 bytes @ 0xE4
	ds   2
	global	main@set_time
main@set_time:	; 7 bytes @ 0xE6
	ds   7
	global	main@current_time
main@current_time:	; 7 bytes @ 0xED
	ds   7
psect	cstackBANK0,class=BANK0,space=1,noexec,lowdata
global __pcstackBANK0
__pcstackBANK0:
	global	menu_update_edit_value@display_buf
menu_update_edit_value@display_buf:	; 10 bytes @ 0x0
	global	menu_draw_input@value_buf
menu_draw_input@value_buf:	; 15 bytes @ 0x0
	global	handle_time_rotation@buf
handle_time_rotation@buf:	; 50 bytes @ 0x0
	global	menu_update_time_value@debug_before
menu_update_time_value@debug_before:	; 50 bytes @ 0x0
	global	rebuild_input_menu@buf
rebuild_input_menu@buf:	; 50 bytes @ 0x0
	global	handle_numeric_rotation@buf
handle_numeric_rotation@buf:	; 50 bytes @ 0x0
	global	rebuild_clock_menu@buf
rebuild_clock_menu@buf:	; 50 bytes @ 0x0
	global	trigger_relay_pulse@buf
trigger_relay_pulse@buf:	; 60 bytes @ 0x0
	global	init_time_editor@buf
init_time_editor@buf:	; 60 bytes @ 0x0
	global	rtc_read_time@debug_buf
rtc_read_time@debug_buf:	; 80 bytes @ 0x0
	ds   10
	global	menu_update_edit_value@value_buf
menu_update_edit_value@value_buf:	; 10 bytes @ 0xA
	ds   5
	global	menu_draw_input@title
menu_draw_input@title:	; 10 bytes @ 0xF
	ds   5
	global	menu_update_edit_value@sensor_type
menu_update_edit_value@sensor_type:	; 1 bytes @ 0x14
	ds   1
	global	menu_update_edit_value@flow_type
menu_update_edit_value@flow_type:	; 1 bytes @ 0x15
	ds   1
	global	_menu_update_edit_value$1345
_menu_update_edit_value$1345:	; 2 bytes @ 0x16
	ds   2
	global	_menu_update_edit_value$1349
_menu_update_edit_value$1349:	; 2 bytes @ 0x18
	ds   1
	global	menu_draw_input@start_pos
menu_draw_input@start_pos:	; 1 bytes @ 0x19
	ds   1
	global	menu_update_edit_value@start_col
menu_update_edit_value@start_col:	; 1 bytes @ 0x1A
	global	_menu_draw_input$1411
_menu_draw_input$1411:	; 2 bytes @ 0x1A
	ds   1
	global	menu_update_edit_value@blink_pos
menu_update_edit_value@blink_pos:	; 1 bytes @ 0x1B
	ds   1
	global	menu_update_edit_value@screen_line
menu_update_edit_value@screen_line:	; 1 bytes @ 0x1C
	global	_menu_draw_input$1415
_menu_draw_input$1415:	; 2 bytes @ 0x1C
	ds   2
	global	menu_draw_input@val_len
menu_draw_input@val_len:	; 1 bytes @ 0x1E
	ds   1
	global	menu_draw_input@j
menu_draw_input@j:	; 1 bytes @ 0x1F
	ds   1
	global	menu_draw_input@opts
menu_draw_input@opts:	; 2 bytes @ 0x20
	ds   2
	global	menu_draw_input@flag
menu_draw_input@flag:	; 2 bytes @ 0x22
	ds   2
	global	menu_draw_input@opts_1397
menu_draw_input@opts_1397:	; 2 bytes @ 0x24
	ds   2
	global	menu_draw_input@flag_1401
menu_draw_input@flag_1401:	; 2 bytes @ 0x26
	ds   2
	global	menu_draw_input@val_len_1405
menu_draw_input@val_len_1405:	; 1 bytes @ 0x28
	ds   1
	global	menu_draw_input@show_brackets
menu_draw_input@show_brackets:	; 1 bytes @ 0x29
	ds   1
	global	menu_draw_input@sensor_type
menu_draw_input@sensor_type:	; 1 bytes @ 0x2A
	ds   1
	global	menu_draw_input@flow_type
menu_draw_input@flow_type:	; 1 bytes @ 0x2B
	ds   1
	global	menu_draw_input@i
menu_draw_input@i:	; 1 bytes @ 0x2C
	ds   1
	global	menu_draw_input@item_idx
menu_draw_input@item_idx:	; 1 bytes @ 0x2D
	ds   5
	global	_handle_time_rotation$1203
_handle_time_rotation$1203:	; 2 bytes @ 0x32
	global	_rebuild_input_menu$1238
_rebuild_input_menu$1238:	; 2 bytes @ 0x32
	global	_handle_numeric_rotation$1334
_handle_numeric_rotation$1334:	; 2 bytes @ 0x32
	global	_rebuild_clock_menu$1458
_rebuild_clock_menu$1458:	; 2 bytes @ 0x32
	global	menu_update_time_value@debug_after
menu_update_time_value@debug_after:	; 50 bytes @ 0x32
	ds   2
	global	handle_time_rotation@direction
handle_time_rotation@direction:	; 1 bytes @ 0x34
	global	_rebuild_input_menu$1252
_rebuild_input_menu$1252:	; 2 bytes @ 0x34
	global	_handle_numeric_rotation$1336
_handle_numeric_rotation$1336:	; 2 bytes @ 0x34
	global	_rebuild_clock_menu$1464
_rebuild_clock_menu$1464:	; 2 bytes @ 0x34
	ds   2
	global	handle_numeric_rotation@max_tens
handle_numeric_rotation@max_tens:	; 1 bytes @ 0x36
	global	_rebuild_input_menu$1253
_rebuild_input_menu$1253:	; 2 bytes @ 0x36
	global	_rebuild_clock_menu$1465
_rebuild_clock_menu$1465:	; 2 bytes @ 0x36
	ds   1
	global	handle_numeric_rotation@max_units
handle_numeric_rotation@max_units:	; 1 bytes @ 0x37
	ds   1
	global	handle_numeric_rotation@direction
handle_numeric_rotation@direction:	; 1 bytes @ 0x38
	global	_rebuild_input_menu$1259
_rebuild_input_menu$1259:	; 2 bytes @ 0x38
	ds   2
	global	_rebuild_input_menu$1260
_rebuild_input_menu$1260:	; 2 bytes @ 0x3A
	ds   2
	global	trigger_relay_pulse@latch_mode
trigger_relay_pulse@latch_mode:	; 1 bytes @ 0x3C
	global	_rebuild_input_menu$1266
_rebuild_input_menu$1266:	; 2 bytes @ 0x3C
	ds   2
	global	_rebuild_input_menu$1267
_rebuild_input_menu$1267:	; 2 bytes @ 0x3E
	ds   2
	global	_rebuild_input_menu$1271
_rebuild_input_menu$1271:	; 2 bytes @ 0x40
	ds   2
	global	_rebuild_input_menu$1285
_rebuild_input_menu$1285:	; 2 bytes @ 0x42
	ds   2
	global	_rebuild_input_menu$1286
_rebuild_input_menu$1286:	; 2 bytes @ 0x44
	ds   2
	global	_rebuild_input_menu$1290
_rebuild_input_menu$1290:	; 2 bytes @ 0x46
	ds   2
	global	_rebuild_input_menu$1295
_rebuild_input_menu$1295:	; 2 bytes @ 0x48
	ds   2
	global	_rebuild_input_menu$1299
_rebuild_input_menu$1299:	; 2 bytes @ 0x4A
	ds   2
	global	_rebuild_input_menu$1305
_rebuild_input_menu$1305:	; 2 bytes @ 0x4C
	ds   2
	global	_rebuild_input_menu$1306
_rebuild_input_menu$1306:	; 2 bytes @ 0x4E
	ds   2
	global	_rebuild_input_menu$1310
_rebuild_input_menu$1310:	; 2 bytes @ 0x50
	global	rtc_read_time@data
rtc_read_time@data:	; 7 bytes @ 0x50
	ds   2
	global	rebuild_input_menu@flow_type_val
rebuild_input_menu@flow_type_val:	; 1 bytes @ 0x52
	ds   1
	global	rebuild_input_menu@sensor
rebuild_input_menu@sensor:	; 1 bytes @ 0x53
	ds   1
	global	_rebuild_input_menu$3028
_rebuild_input_menu$3028:	; 2 bytes @ 0x54
	ds   2
	global	_rebuild_input_menu$3029
_rebuild_input_menu$3029:	; 2 bytes @ 0x56
	ds   1
	global	rtc_read_time@i
rtc_read_time@i:	; 1 bytes @ 0x57
	ds   1
	global	rebuild_input_menu@input_num
rebuild_input_menu@input_num:	; 1 bytes @ 0x58
	ds   12
	global	menu_update_time_value@item_idx
menu_update_time_value@item_idx:	; 1 bytes @ 0x64
	ds   1
	global	menu_update_time_value@sensor_type
menu_update_time_value@sensor_type:	; 1 bytes @ 0x65
	ds   1
	global	menu_update_time_value@flow_type
menu_update_time_value@flow_type:	; 1 bytes @ 0x66
	ds   1
	global	menu_update_time_value@value_buf
menu_update_time_value@value_buf:	; 6 bytes @ 0x67
	ds   6
	global	menu_update_time_value@screen_line
menu_update_time_value@screen_line:	; 1 bytes @ 0x6D
	ds   1
	global	main@adc_ch1
main@adc_ch1:	; 2 bytes @ 0x6E
	ds   2
	global	main@adc_ch2
main@adc_ch2:	; 2 bytes @ 0x70
	ds   2
	global	main@adc_ch3
main@adc_ch3:	; 2 bytes @ 0x72
	ds   2
	global	main@last_button
main@last_button:	; 1 bytes @ 0x74
	ds   1
	global	main@adc_error
main@adc_error:	; 1 bytes @ 0x75
	ds   1
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0x76
	ds   2
	global	main@current_event
main@current_event:	; 1 bytes @ 0x78
	ds   1
	global	main@delta
main@delta:	; 2 bytes @ 0x79
	ds   2
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_isdigit:	; 1 bit 
?_eeprom_init:	; 1 bytes @ 0x0
?_i2c_init:	; 1 bytes @ 0x0
?_rtc_init:	; 1 bytes @ 0x0
?_ad7994_init:	; 1 bytes @ 0x0
?_encoder_init:	; 1 bytes @ 0x0
?_menu_init:	; 1 bytes @ 0x0
?_lcd_init:	; 1 bytes @ 0x0
?_lcd_clear:	; 1 bytes @ 0x0
?_menu_draw_options:	; 1 bytes @ 0x0
?_handle_numeric_rotation:	; 1 bytes @ 0x0
?_handle_time_rotation:	; 1 bytes @ 0x0
?_menu_update_time_value:	; 1 bytes @ 0x0
?_menu_update_numeric_value:	; 1 bytes @ 0x0
?_menu_update_edit_value:	; 1 bytes @ 0x0
?_menu_draw_input:	; 1 bytes @ 0x0
?_menu_draw_setup:	; 1 bytes @ 0x0
?_menu_handle_button:	; 1 bytes @ 0x0
?_save_current_config:	; 1 bytes @ 0x0
?_menu_draw_clock:	; 1 bytes @ 0x0
?_get_menu_timeout_seconds:	; 1 bytes @ 0x0
?_load_factory_defaults:	; 1 bytes @ 0x0
?_sync_menu_variables:	; 1 bytes @ 0x0
?_uart_init:	; 1 bytes @ 0x0
?_uart_write:	; 1 bytes @ 0x0
?_system_init:	; 1 bytes @ 0x0
?_trigger_relay_pulse:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_isr:	; 1 bytes @ 0x0
?_lcd_clear_line:	; 1 bytes @ 0x0
?_rebuild_input_menu:	; 1 bytes @ 0x0
?_rebuild_clock_menu:	; 1 bytes @ 0x0
?_lcd_write_nibble:	; 1 bytes @ 0x0
?_lcd_cmd:	; 1 bytes @ 0x0
?_lcd_data:	; 1 bytes @ 0x0
?_i2c_wait_idle:	; 1 bytes @ 0x0
?_i2c_start:	; 1 bytes @ 0x0
?_i2c_stop:	; 1 bytes @ 0x0
?_i2c_write:	; 1 bytes @ 0x0
?_i2c_read:	; 1 bytes @ 0x0
?_bcd_to_dec:	; 1 bytes @ 0x0
?_dec_to_bcd:	; 1 bytes @ 0x0
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
??_i2c_init:	; 1 bytes @ 0xE
??_encoder_init:	; 1 bytes @ 0xE
??_menu_init:	; 1 bytes @ 0xE
?_is_numeric_field:	; 1 bytes @ 0xE
?_is_time_field:	; 1 bytes @ 0xE
??_get_menu_timeout_seconds:	; 1 bytes @ 0xE
??_sync_menu_variables:	; 1 bytes @ 0xE
??_isdigit:	; 1 bytes @ 0xE
??_uart_init:	; 1 bytes @ 0xE
??_uart_write:	; 1 bytes @ 0xE
??_system_init:	; 1 bytes @ 0xE
?_beep:	; 1 bytes @ 0xE
?_is_option_field:	; 1 bytes @ 0xE
?_eeprom_read_byte:	; 1 bytes @ 0xE
?_eeprom_write_byte:	; 1 bytes @ 0xE
??_lcd_write_nibble:	; 1 bytes @ 0xE
??_i2c_wait_idle:	; 1 bytes @ 0xE
??_i2c_write:	; 1 bytes @ 0xE
??_bcd_to_dec:	; 1 bytes @ 0xE
?___lbdiv:	; 1 bytes @ 0xE
?___lbmod:	; 1 bytes @ 0xE
?_strcpy:	; 2 bytes @ 0xE
?_memcpy:	; 2 bytes @ 0xE
	global	?_strlen
?_strlen:	; 2 bytes @ 0xE
	global	?_strcmp
?_strcmp:	; 2 bytes @ 0xE
	global	?_get_option_edit_flag
?_get_option_edit_flag:	; 2 bytes @ 0xE
	global	?_get_item_options_for_field
?_get_item_options_for_field:	; 2 bytes @ 0xE
	global	?_get_current_numeric_value
?_get_current_numeric_value:	; 2 bytes @ 0xE
	global	?_calculate_config_checksum
?_calculate_config_checksum:	; 2 bytes @ 0xE
	global	?___wmul
?___wmul:	; 2 bytes @ 0xE
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0xE
	global	uart_write@c
uart_write@c:	; 1 bytes @ 0xE
	global	is_numeric_field@sensor_type
is_numeric_field@sensor_type:	; 1 bytes @ 0xE
	global	is_time_field@sensor_type
is_time_field@sensor_type:	; 1 bytes @ 0xE
	global	is_option_field@sensor_type
is_option_field@sensor_type:	; 1 bytes @ 0xE
	global	get_option_edit_flag@sensor_type
get_option_edit_flag@sensor_type:	; 1 bytes @ 0xE
	global	get_item_options_for_field@sensor_type
get_item_options_for_field@sensor_type:	; 1 bytes @ 0xE
	global	i2c_write@data
i2c_write@data:	; 1 bytes @ 0xE
	global	___lbdiv@divisor
___lbdiv@divisor:	; 1 bytes @ 0xE
	global	___lbmod@divisor
___lbmod@divisor:	; 1 bytes @ 0xE
	global	beep@duration_ms
beep@duration_ms:	; 2 bytes @ 0xE
	global	eeprom_read_byte@address
eeprom_read_byte@address:	; 2 bytes @ 0xE
	global	eeprom_write_byte@address
eeprom_write_byte@address:	; 2 bytes @ 0xE
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0xE
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0xE
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
??___lbdiv:	; 1 bytes @ 0xF
??___lbmod:	; 1 bytes @ 0xF
	global	is_numeric_field@flow_type
is_numeric_field@flow_type:	; 1 bytes @ 0xF
	global	is_time_field@flow_type
is_time_field@flow_type:	; 1 bytes @ 0xF
	global	is_option_field@flow_type
is_option_field@flow_type:	; 1 bytes @ 0xF
	global	get_option_edit_flag@flow_type
get_option_edit_flag@flow_type:	; 1 bytes @ 0xF
	global	get_item_options_for_field@flow_type
get_item_options_for_field@flow_type:	; 1 bytes @ 0xF
	global	lcd_write_nibble@nibble
lcd_write_nibble@nibble:	; 1 bytes @ 0xF
	global	bcd_to_dec@bcd
bcd_to_dec@bcd:	; 1 bytes @ 0xF
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0xF
	global	___lbmod@dividend
___lbmod@dividend:	; 1 bytes @ 0xF
	global	_isdigit$2754
_isdigit$2754:	; 1 bytes @ 0xF
	global	uart_print@str
uart_print@str:	; 2 bytes @ 0xF
	global	i2c_wait_idle@timeout
i2c_wait_idle@timeout:	; 2 bytes @ 0xF
	ds   1
??_is_numeric_field:	; 1 bytes @ 0x10
??_is_time_field:	; 1 bytes @ 0x10
??_strlen:	; 1 bytes @ 0x10
??_get_option_edit_flag:	; 1 bytes @ 0x10
??_get_item_options_for_field:	; 1 bytes @ 0x10
??_beep:	; 1 bytes @ 0x10
??_is_option_field:	; 1 bytes @ 0x10
??_get_current_numeric_value:	; 1 bytes @ 0x10
??_calculate_config_checksum:	; 1 bytes @ 0x10
??_eeprom_read_byte:	; 1 bytes @ 0x10
?_eeprom_read_block:	; 1 bytes @ 0x10
??_lcd_cmd:	; 1 bytes @ 0x10
??_lcd_data:	; 1 bytes @ 0x10
	global	?_eeprom_read_word
?_eeprom_read_word:	; 2 bytes @ 0x10
	global	_is_numeric_field$1163
_is_numeric_field$1163:	; 1 bytes @ 0x10
	global	_is_time_field$1170
_is_time_field$1170:	; 1 bytes @ 0x10
	global	_is_option_field$1175
_is_option_field$1175:	; 1 bytes @ 0x10
	global	get_option_edit_flag@line
get_option_edit_flag@line:	; 1 bytes @ 0x10
	global	get_item_options_for_field@line
get_item_options_for_field@line:	; 1 bytes @ 0x10
	global	eeprom_write_byte@data
eeprom_write_byte@data:	; 1 bytes @ 0x10
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x10
	global	___lbdiv@counter
___lbdiv@counter:	; 1 bytes @ 0x10
	global	___lbmod@counter
___lbmod@counter:	; 1 bytes @ 0x10
	global	isdigit@c
isdigit@c:	; 1 bytes @ 0x10
	global	eeprom_read_word@address
eeprom_read_word@address:	; 2 bytes @ 0x10
	global	eeprom_read_block@data
eeprom_read_block@data:	; 2 bytes @ 0x10
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x10
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x10
	global	memcpy@s1
memcpy@s1:	; 2 bytes @ 0x10
	global	strcmp@s2
strcmp@s2:	; 2 bytes @ 0x10
	global	strcpy@from
strcpy@from:	; 2 bytes @ 0x10
	global	strlen@cp
strlen@cp:	; 2 bytes @ 0x10
	ds   1
?_lcd_print:	; 1 bytes @ 0x11
??_uart_print:	; 1 bytes @ 0x11
?_uart_println:	; 1 bytes @ 0x11
??_eeprom_write_byte:	; 1 bytes @ 0x11
?_eeprom_write_word:	; 1 bytes @ 0x11
?_eeprom_write_block:	; 1 bytes @ 0x11
??_i2c_start:	; 1 bytes @ 0x11
??_i2c_stop:	; 1 bytes @ 0x11
??_i2c_read:	; 1 bytes @ 0x11
	global	_is_numeric_field$1164
_is_numeric_field$1164:	; 1 bytes @ 0x11
	global	is_time_field@line
is_time_field@line:	; 1 bytes @ 0x11
	global	_is_option_field$1176
_is_option_field$1176:	; 1 bytes @ 0x11
	global	lcd_cmd@cmd
lcd_cmd@cmd:	; 1 bytes @ 0x11
	global	___lbdiv@quotient
___lbdiv@quotient:	; 1 bytes @ 0x11
	global	___lbmod@rem
___lbmod@rem:	; 1 bytes @ 0x11
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
	global	lcd_print@str
lcd_print@str:	; 2 bytes @ 0x11
	global	i2c_start@timeout
i2c_start@timeout:	; 2 bytes @ 0x11
	global	i2c_stop@timeout
i2c_stop@timeout:	; 2 bytes @ 0x11
	ds   1
??_lcd_init:	; 1 bytes @ 0x12
??_lcd_clear:	; 1 bytes @ 0x12
?_lcd_set_cursor:	; 1 bytes @ 0x12
??_strcpy:	; 1 bytes @ 0x12
??_strcmp:	; 1 bytes @ 0x12
??_eeprom_read_word:	; 1 bytes @ 0x12
??_dec_to_bcd:	; 1 bytes @ 0x12
??___wmul:	; 1 bytes @ 0x12
??___lwmod:	; 1 bytes @ 0x12
	global	_is_numeric_field$1165
_is_numeric_field$1165:	; 1 bytes @ 0x12
	global	_is_option_field$1177
_is_option_field$1177:	; 1 bytes @ 0x12
	global	lcd_set_cursor@col
lcd_set_cursor@col:	; 1 bytes @ 0x12
	global	i2c_read@ack
i2c_read@ack:	; 1 bytes @ 0x12
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x12
	global	eeprom_read_block@address
eeprom_read_block@address:	; 2 bytes @ 0x12
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x12
	global	memcpy@n
memcpy@n:	; 2 bytes @ 0x12
	global	strcpy@cp
strcpy@cp:	; 2 bytes @ 0x12
	ds   1
??_ad7994_init:	; 1 bytes @ 0x13
??_lcd_set_cursor:	; 1 bytes @ 0x13
??_lcd_print:	; 1 bytes @ 0x13
??_uart_println:	; 1 bytes @ 0x13
?_rtc_write_register:	; 1 bytes @ 0x13
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x13
	global	is_numeric_field@line
is_numeric_field@line:	; 1 bytes @ 0x13
	global	_is_option_field$1178
_is_option_field$1178:	; 1 bytes @ 0x13
	global	lcd_set_cursor@row
lcd_set_cursor@row:	; 1 bytes @ 0x13
	global	rtc_write_register@value
rtc_write_register@value:	; 1 bytes @ 0x13
	global	calculate_config_checksum@data
calculate_config_checksum@data:	; 2 bytes @ 0x13
	global	eeprom_write_word@data
eeprom_write_word@data:	; 2 bytes @ 0x13
	global	eeprom_write_block@address
eeprom_write_block@address:	; 2 bytes @ 0x13
	global	i2c_read@timeout
i2c_read@timeout:	; 2 bytes @ 0x13
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x13
	ds   1
??_memcpy:	; 1 bytes @ 0x14
??_rtc_write_register:	; 1 bytes @ 0x14
	global	is_option_field@line
is_option_field@line:	; 1 bytes @ 0x14
	global	lcd_set_cursor@addr
lcd_set_cursor@addr:	; 1 bytes @ 0x14
	global	rtc_write_register@reg
rtc_write_register@reg:	; 1 bytes @ 0x14
	global	dec_to_bcd@dec
dec_to_bcd@dec:	; 1 bytes @ 0x14
	global	strcmp@r
strcmp@r:	; 1 bytes @ 0x14
	global	eeprom_read_block@length
eeprom_read_block@length:	; 2 bytes @ 0x14
	global	memcpy@d
memcpy@d:	; 2 bytes @ 0x14
	ds   1
??_rtc_init:	; 1 bytes @ 0x15
?_rtc_set_time:	; 1 bytes @ 0x15
??_menu_update_numeric_value:	; 1 bytes @ 0x15
?_lcd_print_at:	; 1 bytes @ 0x15
??_lcd_clear_line:	; 1 bytes @ 0x15
??_eeprom_write_word:	; 1 bytes @ 0x15
	global	lcd_print_at@col
lcd_print_at@col:	; 1 bytes @ 0x15
	global	lcd_clear_line@row
lcd_clear_line@row:	; 1 bytes @ 0x15
	global	menu_update_numeric_value@sensor_type
menu_update_numeric_value@sensor_type:	; 1 bytes @ 0x15
	global	i2c_read@data
i2c_read@data:	; 1 bytes @ 0x15
	global	calculate_config_checksum@j
calculate_config_checksum@j:	; 2 bytes @ 0x15
	global	eeprom_read_word@result
eeprom_read_word@result:	; 2 bytes @ 0x15
	global	eeprom_write_block@length
eeprom_write_block@length:	; 2 bytes @ 0x15
	global	rtc_set_time@time
rtc_set_time@time:	; 2 bytes @ 0x15
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x15
	ds   1
??_eeprom_read_block:	; 1 bytes @ 0x16
	global	?_ad7994_read_channel
?_ad7994_read_channel:	; 2 bytes @ 0x16
	global	menu_update_numeric_value@flow_type
menu_update_numeric_value@flow_type:	; 1 bytes @ 0x16
	global	lcd_print_at@str
lcd_print_at@str:	; 2 bytes @ 0x16
	global	get_current_numeric_value@value
get_current_numeric_value@value:	; 2 bytes @ 0x16
	global	eeprom_read_block@ptr
eeprom_read_block@ptr:	; 2 bytes @ 0x16
	global	memcpy@s
memcpy@s:	; 2 bytes @ 0x16
	ds   1
??_rtc_set_time:	; 1 bytes @ 0x17
??_eeprom_write_block:	; 1 bytes @ 0x17
??___lwdiv:	; 1 bytes @ 0x17
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x17
	global	_menu_update_numeric_value$1360
_menu_update_numeric_value$1360:	; 2 bytes @ 0x17
	global	calculate_config_checksum@j_1734
calculate_config_checksum@j_1734:	; 2 bytes @ 0x17
	global	eeprom_write_block@ptr
eeprom_write_block@ptr:	; 2 bytes @ 0x17
	global	rtc_set_time@data
rtc_set_time@data:	; 7 bytes @ 0x17
	ds   1
??_ad7994_read_channel:	; 1 bytes @ 0x18
??_lcd_print_at:	; 1 bytes @ 0x18
	global	lcd_print_at@row
lcd_print_at@row:	; 1 bytes @ 0x18
	global	memcpy@tmp
memcpy@tmp:	; 1 bytes @ 0x18
	global	eeprom_read_block@i
eeprom_read_block@i:	; 2 bytes @ 0x18
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x18
	ds   1
??_menu_draw_options:	; 1 bytes @ 0x19
??_menu_draw_setup:	; 1 bytes @ 0x19
??_menu_draw_clock:	; 1 bytes @ 0x19
??_load_factory_defaults:	; 1 bytes @ 0x19
	global	menu_draw_options@item_index
menu_draw_options@item_index:	; 1 bytes @ 0x19
	global	calculate_config_checksum@i
calculate_config_checksum@i:	; 1 bytes @ 0x19
	global	_menu_update_numeric_value$1361
_menu_update_numeric_value$1361:	; 2 bytes @ 0x19
	global	eeprom_write_block@i
eeprom_write_block@i:	; 2 bytes @ 0x19
	global	menu_draw_setup@setup_labels
menu_draw_setup@setup_labels:	; 10 bytes @ 0x19
	ds   1
?_init_numeric_editor:	; 1 bytes @ 0x1A
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x1A
	global	menu_draw_options@i
menu_draw_options@i:	; 1 bytes @ 0x1A
	global	ad7994_read_channel@channel
ad7994_read_channel@channel:	; 1 bytes @ 0x1A
	global	init_numeric_editor@value
init_numeric_editor@value:	; 2 bytes @ 0x1A
	global	sprintf@sp
sprintf@sp:	; 2 bytes @ 0x1A
	ds   1
??_save_current_config:	; 1 bytes @ 0x1B
	global	_menu_update_numeric_value$1362
_menu_update_numeric_value$1362:	; 2 bytes @ 0x1B
	global	save_current_config@checksum
save_current_config@checksum:	; 2 bytes @ 0x1B
	global	ad7994_read_channel@result
ad7994_read_channel@result:	; 2 bytes @ 0x1B
	ds   1
??_init_numeric_editor:	; 1 bytes @ 0x1C
	global	sprintf@f
sprintf@f:	; 2 bytes @ 0x1C
	ds   1
	global	save_current_config@i
save_current_config@i:	; 1 bytes @ 0x1D
	global	ad7994_read_channel@msb
ad7994_read_channel@msb:	; 1 bytes @ 0x1D
	global	_menu_update_numeric_value$1363
_menu_update_numeric_value$1363:	; 2 bytes @ 0x1D
	ds   1
??_eeprom_init:	; 1 bytes @ 0x1E
	global	init_numeric_editor@flow_type
init_numeric_editor@flow_type:	; 1 bytes @ 0x1E
	global	rtc_set_time@i
rtc_set_time@i:	; 1 bytes @ 0x1E
	global	ad7994_read_channel@lsb
ad7994_read_channel@lsb:	; 1 bytes @ 0x1E
	global	eeprom_init@stored_checksum
eeprom_init@stored_checksum:	; 2 bytes @ 0x1E
	global	menu_draw_clock@value_buf
menu_draw_clock@value_buf:	; 15 bytes @ 0x1E
	ds   1
	global	ad7994_read_channel@config_byte
ad7994_read_channel@config_byte:	; 1 bytes @ 0x1F
	global	_init_numeric_editor$1324
_init_numeric_editor$1324:	; 2 bytes @ 0x1F
	global	_menu_update_numeric_value$1364
_menu_update_numeric_value$1364:	; 2 bytes @ 0x1F
	ds   1
	global	eeprom_init@calculated_checksum
eeprom_init@calculated_checksum:	; 2 bytes @ 0x20
	ds   1
	global	init_numeric_editor@sensor_type
init_numeric_editor@sensor_type:	; 1 bytes @ 0x21
	global	_menu_update_numeric_value$1365
_menu_update_numeric_value$1365:	; 2 bytes @ 0x21
	ds   1
	global	eeprom_init@i
eeprom_init@i:	; 1 bytes @ 0x22
	global	init_numeric_editor@abs_val
init_numeric_editor@abs_val:	; 2 bytes @ 0x22
	ds   1
	global	_menu_update_numeric_value$1366
_menu_update_numeric_value$1366:	; 2 bytes @ 0x23
	global	_menu_draw_setup$1435
_menu_draw_setup$1435:	; 2 bytes @ 0x23
	ds   2
	global	_menu_update_numeric_value$1367
_menu_update_numeric_value$1367:	; 2 bytes @ 0x25
	global	_menu_draw_setup$1441
_menu_draw_setup$1441:	; 2 bytes @ 0x25
	ds   2
	global	_menu_update_numeric_value$1369
_menu_update_numeric_value$1369:	; 2 bytes @ 0x27
	global	_menu_draw_setup$1449
_menu_draw_setup$1449:	; 2 bytes @ 0x27
	ds   2
	global	menu_draw_setup@label
menu_draw_setup@label:	; 2 bytes @ 0x29
	global	menu_update_numeric_value@value_buf
menu_update_numeric_value@value_buf:	; 6 bytes @ 0x29
	ds   2
	global	menu_draw_setup@sensor
menu_draw_setup@sensor:	; 1 bytes @ 0x2B
	ds   1
??_sprintf:	; 1 bytes @ 0x2C
	global	menu_draw_setup@sensor_name
menu_draw_setup@sensor_name:	; 2 bytes @ 0x2C
	ds   1
	global	menu_draw_clock@actual_len
menu_draw_clock@actual_len:	; 1 bytes @ 0x2D
	ds   1
	global	menu_draw_setup@item_idx
menu_draw_setup@item_idx:	; 1 bytes @ 0x2E
	global	menu_draw_clock@start_pos
menu_draw_clock@start_pos:	; 1 bytes @ 0x2E
	ds   1
	global	menu_update_numeric_value@start_col
menu_update_numeric_value@start_col:	; 1 bytes @ 0x2F
	global	menu_draw_setup@i
menu_draw_setup@i:	; 1 bytes @ 0x2F
	global	sprintf@idx
sprintf@idx:	; 1 bytes @ 0x2F
	global	_menu_draw_clock$1487
_menu_draw_clock$1487:	; 2 bytes @ 0x2F
	ds   1
	global	menu_update_numeric_value@screen_line
menu_update_numeric_value@screen_line:	; 1 bytes @ 0x30
	global	_sprintf$2311
_sprintf$2311:	; 2 bytes @ 0x30
	ds   1
	global	_menu_draw_clock$1491
_menu_draw_clock$1491:	; 2 bytes @ 0x31
	ds   1
	global	_sprintf$2312
_sprintf$2312:	; 2 bytes @ 0x32
	ds   1
	global	menu_draw_clock@val_len
menu_draw_clock@val_len:	; 1 bytes @ 0x33
	ds   1
	global	menu_draw_clock@val_len_1481
menu_draw_clock@val_len_1481:	; 1 bytes @ 0x34
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x34
	ds   1
	global	menu_draw_clock@j
menu_draw_clock@j:	; 1 bytes @ 0x35
	global	sprintf@cp
sprintf@cp:	; 2 bytes @ 0x35
	ds   1
	global	menu_draw_clock@show_brackets
menu_draw_clock@show_brackets:	; 1 bytes @ 0x36
	ds   1
	global	menu_draw_clock@i
menu_draw_clock@i:	; 1 bytes @ 0x37
	global	sprintf@len
sprintf@len:	; 2 bytes @ 0x37
	ds   1
	global	menu_draw_clock@item_idx
menu_draw_clock@item_idx:	; 1 bytes @ 0x38
	ds   1
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x39
	ds   1
	global	sprintf@val
sprintf@val:	; 2 bytes @ 0x3A
	ds   2
	global	sprintf@width
sprintf@width:	; 2 bytes @ 0x3C
	ds   2
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x3E
	ds   1
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x3F
	ds   1
?_rtc_read_time:	; 1 bytes @ 0x40
??_handle_numeric_rotation:	; 1 bytes @ 0x40
??_handle_time_rotation:	; 1 bytes @ 0x40
??_menu_update_time_value:	; 1 bytes @ 0x40
??_menu_update_edit_value:	; 1 bytes @ 0x40
??_menu_draw_input:	; 1 bytes @ 0x40
??_trigger_relay_pulse:	; 1 bytes @ 0x40
?_init_time_editor:	; 1 bytes @ 0x40
??_rebuild_input_menu:	; 1 bytes @ 0x40
??_rebuild_clock_menu:	; 1 bytes @ 0x40
	global	init_time_editor@value_seconds
init_time_editor@value_seconds:	; 2 bytes @ 0x40
	global	rtc_read_time@time
rtc_read_time@time:	; 2 bytes @ 0x40
	ds   2
??_rtc_read_time:	; 1 bytes @ 0x42
	global	init_time_editor@mode
init_time_editor@mode:	; 1 bytes @ 0x42
	ds   1
??_init_time_editor:	; 1 bytes @ 0x43
	ds   2
?_menu_handle_encoder:	; 1 bytes @ 0x45
??_menu_handle_button:	; 1 bytes @ 0x45
	global	menu_handle_encoder@delta
menu_handle_encoder@delta:	; 2 bytes @ 0x45
	ds   2
??_menu_handle_encoder:	; 1 bytes @ 0x47
	ds   6
??_main:	; 1 bytes @ 0x4D
	ds   2
;!
;!Data Sizes:
;!    Strings     2870
;!    Constant    865
;!    Data        295
;!    BSS         695
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126     79     105
;!    BANK0           128    123     128
;!    BANK1           256    244     256
;!    BANK2           256    250     256
;!    BANK3           256     70     251
;!    BANK4           256      0     248
;!    BANK5           256      0     128
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
;!		 -> input_config(BIGRAM[384]), system_config(BANK5[128]), 
;!
;!    clock_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[7]), STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[7]), STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[11]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), 
;!		 -> STR_120(CODE[10]), STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), 
;!		 -> STR_124(CODE[8]), STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), 
;!		 -> STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), STR_88(CODE[11]), 
;!		 -> STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), STR_92(CODE[6]), 
;!		 -> STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    clock_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), 
;!		 -> value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    clock_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[7]), STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[7]), STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[11]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), 
;!		 -> STR_120(CODE[10]), STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), 
;!		 -> STR_124(CODE[8]), STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), 
;!		 -> STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), STR_88(CODE[11]), 
;!		 -> STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), STR_92(CODE[6]), 
;!		 -> STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    clock_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), 
;!		 -> value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    eeprom_read_block@data	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK5[128]), 
;!
;!    eeprom_read_block@ptr	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK5[128]), 
;!
;!    eeprom_write_block@data	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK5[128]), 
;!
;!    eeprom_write_block@ptr	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK5[128]), 
;!
;!    flow_analog_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[7]), STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[7]), STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[11]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), 
;!		 -> STR_120(CODE[10]), STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), 
;!		 -> STR_124(CODE[8]), STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), 
;!		 -> STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), STR_88(CODE[11]), 
;!		 -> STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), STR_92(CODE[6]), 
;!		 -> STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    flow_analog_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), 
;!		 -> value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    flow_digital_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[7]), STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[7]), STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[11]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), 
;!		 -> STR_120(CODE[10]), STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), 
;!		 -> STR_124(CODE[8]), STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), 
;!		 -> STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), STR_88(CODE[11]), 
;!		 -> STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), STR_92(CODE[6]), 
;!		 -> STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    flow_digital_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), 
;!		 -> value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    input_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[7]), STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[7]), STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[11]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), 
;!		 -> STR_120(CODE[10]), STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), 
;!		 -> STR_124(CODE[8]), STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), 
;!		 -> STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), STR_88(CODE[11]), 
;!		 -> STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), STR_92(CODE[6]), 
;!		 -> STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), 
;!		 -> value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    lcd_print@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> Fake(UNKNOWN), menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), 
;!		 -> menu_update_edit_value@display_buf(BANK0[10]), menu_update_numeric_value@value_buf(COMRAM[6]), menu_update_time_value@value_buf(BANK0[6]), STR_100(CODE[7]), 
;!		 -> STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), STR_104(CODE[9]), 
;!		 -> STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), STR_108(CODE[7]), 
;!		 -> STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), STR_112(CODE[11]), 
;!		 -> STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), STR_116(CODE[7]), 
;!		 -> STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), STR_120(CODE[10]), 
;!		 -> STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), STR_124(CODE[8]), 
;!		 -> STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), STR_128(CODE[8]), 
;!		 -> STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), STR_139(CODE[8]), 
;!		 -> STR_140(CODE[2]), STR_141(CODE[2]), STR_142(CODE[21]), STR_17(CODE[13]), 
;!		 -> STR_18(CODE[16]), STR_196(CODE[7]), STR_197(CODE[2]), STR_198(CODE[2]), 
;!		 -> STR_199(CODE[6]), STR_200(CODE[2]), STR_201(CODE[2]), STR_202(CODE[21]), 
;!		 -> STR_203(CODE[2]), STR_204(CODE[2]), STR_208(CODE[2]), STR_209(CODE[2]), 
;!		 -> STR_210(CODE[2]), STR_211(CODE[2]), STR_212(CODE[21]), STR_213(CODE[1]), 
;!		 -> STR_214(CODE[1]), STR_215(CODE[1]), STR_216(CODE[6]), STR_217(CODE[5]), 
;!		 -> STR_218(CODE[9]), STR_219(CODE[5]), STR_220(CODE[5]), STR_221(CODE[2]), 
;!		 -> STR_222(CODE[2]), STR_223(CODE[2]), STR_224(CODE[2]), STR_225(CODE[2]), 
;!		 -> STR_226(CODE[2]), STR_227(CODE[2]), STR_228(CODE[2]), STR_240(CODE[6]), 
;!		 -> STR_241(CODE[2]), STR_242(CODE[2]), STR_243(CODE[2]), STR_244(CODE[2]), 
;!		 -> STR_34(CODE[12]), STR_35(CODE[6]), STR_40(CODE[12]), STR_41(CODE[8]), 
;!		 -> STR_80(CODE[10]), STR_81(CODE[11]), STR_82(CODE[13]), STR_83(CODE[6]), 
;!		 -> STR_84(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    lcd_print_at@str	PTR const unsigned char  size(2) Largest target is 15
;!		 -> Fake(UNKNOWN), menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), 
;!		 -> STR_100(CODE[7]), STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[7]), STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[11]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), 
;!		 -> STR_120(CODE[10]), STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), 
;!		 -> STR_124(CODE[8]), STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), 
;!		 -> STR_213(CODE[1]), STR_214(CODE[1]), STR_215(CODE[1]), STR_216(CODE[6]), 
;!		 -> STR_217(CODE[5]), STR_218(CODE[9]), STR_219(CODE[5]), STR_220(CODE[5]), 
;!		 -> STR_240(CODE[6]), STR_80(CODE[10]), STR_81(CODE[11]), STR_82(CODE[13]), 
;!		 -> STR_83(CODE[6]), STR_84(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), 
;!		 -> STR_87(CODE[10]), STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), 
;!		 -> STR_91(CODE[13]), STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), 
;!		 -> STR_95(CODE[8]), STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), 
;!		 -> STR_99(CODE[7]), 
;!
;!    memcpy@d	PTR unsigned char  size(2) Largest target is 384
;!		 -> clock_menu(BANK3[25]), input_config(BIGRAM[384]), input_menu(BANK3[75]), system_config(BANK5[128]), 
;!
;!    memcpy@d1	PTR void  size(2) Largest target is 384
;!		 -> clock_menu(BANK3[25]), input_config(BIGRAM[384]), input_menu(BANK3[75]), system_config(BANK5[128]), 
;!
;!    memcpy@s	PTR const unsigned char  size(2) Largest target is 384
;!		 -> clock_menu_template(CODE[25]), factory_defaults(CODE[384]), flow_analog_template(CODE[55]), flow_digital_template(CODE[40]), 
;!		 -> pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    memcpy@s1	PTR const void  size(2) Largest target is 384
;!		 -> clock_menu_template(CODE[25]), factory_defaults(CODE[384]), flow_analog_template(CODE[55]), flow_digital_template(CODE[40]), 
;!		 -> pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    menu_draw_clock$1487	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_241(CODE[2]), STR_242(CODE[2]), 
;!
;!    menu_draw_clock$1491	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_243(CODE[2]), STR_244(CODE[2]), 
;!
;!    menu_draw_input$1411	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_208(CODE[2]), STR_209(CODE[2]), 
;!
;!    menu_draw_input$1415	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_210(CODE[2]), STR_211(CODE[2]), 
;!
;!    menu_draw_input@flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@flag_1401	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), 
;!		 -> STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), 
;!		 -> STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), 
;!
;!    menu_draw_input@opts_1397	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts_1397$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), 
;!		 -> STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), 
;!		 -> STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), 
;!
;!    menu_draw_setup$1435	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_219(CODE[5]), STR_220(CODE[5]), 
;!
;!    menu_draw_setup$1441	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_223(CODE[2]), STR_224(CODE[2]), 
;!
;!    menu_draw_setup$1449	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_227(CODE[2]), STR_228(CODE[2]), 
;!
;!    menu_draw_setup@F2659	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_213(CODE[1]), STR_214(CODE[1]), STR_215(CODE[1]), STR_216(CODE[6]), 
;!		 -> STR_217(CODE[5]), 
;!
;!    menu_draw_setup@label	PTR const unsigned char  size(2) Largest target is 6
;!		 -> STR_213(CODE[1]), STR_214(CODE[1]), STR_215(CODE[1]), STR_216(CODE[6]), 
;!		 -> STR_217(CODE[5]), 
;!
;!    menu_draw_setup@sensor_name	PTR const unsigned char  size(2) Largest target is 9
;!		 -> Fake(UNKNOWN), STR_218(CODE[9]), STR_219(CODE[5]), STR_220(CODE[5]), 
;!
;!    menu_draw_setup@setup_labels	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_213(CODE[1]), STR_214(CODE[1]), STR_215(CODE[1]), STR_216(CODE[6]), 
;!		 -> STR_217(CODE[5]), 
;!
;!    menu_handle_button@edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1543	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1574	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), 
;!		 -> STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), 
;!		 -> STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), 
;!
;!    menu_handle_button@opts_1544	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1544$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), 
;!		 -> STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), 
;!		 -> STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), 
;!
;!    menu_handle_button@opts_1575	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1575$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), 
;!		 -> STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), 
;!		 -> STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), 
;!
;!    menu_handle_encoder$3030	const PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), 
;!		 -> STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), 
;!		 -> STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), 
;!
;!    menu_handle_encoder@clock_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@clock_opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@clock_opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), 
;!		 -> STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), 
;!		 -> STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), 
;!
;!    menu_handle_encoder@edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), 
;!		 -> STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), 
;!		 -> STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), 
;!
;!    menu_item_options$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), 
;!		 -> STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), 
;!		 -> STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), 
;!
;!    options_menu	PTR const unsigned char [5] size(2) Largest target is 13
;!		 -> STR_80(CODE[10]), STR_81(CODE[11]), STR_82(CODE[13]), STR_83(CODE[6]), 
;!		 -> STR_84(CODE[5]), 
;!
;!    pressure_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[7]), STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[7]), STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[11]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), 
;!		 -> STR_120(CODE[10]), STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), 
;!		 -> STR_124(CODE[8]), STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), 
;!		 -> STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), STR_88(CODE[11]), 
;!		 -> STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), STR_92(CODE[6]), 
;!		 -> STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    pressure_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), 
;!		 -> value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    rebuild_clock_menu$1458	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_231(CODE[8]), STR_232(CODE[9]), 
;!
;!    rebuild_clock_menu$1464	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_233(CODE[6]), STR_234(CODE[6]), STR_235(CODE[9]), 
;!
;!    rebuild_clock_menu$1465	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_234(CODE[6]), STR_235(CODE[9]), 
;!
;!    rebuild_input_menu$1238	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_144(CODE[8]), STR_145(CODE[9]), 
;!
;!    rebuild_input_menu$1252	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_154(CODE[6]), STR_155(CODE[6]), STR_156(CODE[9]), 
;!
;!    rebuild_input_menu$1253	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_155(CODE[6]), STR_156(CODE[9]), 
;!
;!    rebuild_input_menu$1259	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_157(CODE[6]), STR_158(CODE[6]), STR_159(CODE[9]), 
;!
;!    rebuild_input_menu$1260	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_158(CODE[6]), STR_159(CODE[9]), 
;!
;!    rebuild_input_menu$1266	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_160(CODE[6]), STR_161(CODE[6]), STR_162(CODE[9]), 
;!
;!    rebuild_input_menu$1267	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_161(CODE[6]), STR_162(CODE[9]), 
;!
;!    rebuild_input_menu$1271	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_163(CODE[5]), STR_164(CODE[5]), 
;!
;!    rebuild_input_menu$1285	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_170(CODE[6]), STR_171(CODE[6]), STR_172(CODE[9]), 
;!
;!    rebuild_input_menu$1286	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_171(CODE[6]), STR_172(CODE[9]), 
;!
;!    rebuild_input_menu$1290	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_173(CODE[5]), STR_174(CODE[5]), 
;!
;!    rebuild_input_menu$1295	PTR const unsigned char  size(2) Largest target is 8
;!		 -> STR_176(CODE[7]), STR_177(CODE[8]), 
;!
;!    rebuild_input_menu$1299	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_178(CODE[5]), STR_179(CODE[5]), 
;!
;!    rebuild_input_menu$1305	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_180(CODE[6]), STR_181(CODE[6]), STR_182(CODE[9]), 
;!
;!    rebuild_input_menu$1306	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_181(CODE[6]), STR_182(CODE[9]), 
;!
;!    rebuild_input_menu$1310	PTR const unsigned char  size(2) Largest target is 4
;!		 -> STR_183(CODE[2]), STR_184(CODE[4]), 
;!
;!    rtc_read_time@time	PTR struct . size(2) Largest target is 7
;!		 -> main@current_time(BANK1[7]), 
;!
;!    rtc_set_time@time	PTR struct . size(2) Largest target is 7
;!		 -> main@set_time(BANK1[7]), 
;!
;!    S920$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), 
;!		 -> STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), 
;!		 -> STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), 
;!
;!    S924$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[7]), STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[7]), STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[11]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), 
;!		 -> STR_120(CODE[10]), STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), 
;!		 -> STR_124(CODE[8]), STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), 
;!		 -> STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), STR_88(CODE[11]), 
;!		 -> STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), STR_92(CODE[6]), 
;!		 -> STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    S924$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), 
;!		 -> value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    sp__get_item_options_for_field	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    sp__get_option_edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    sp__memcpy	PTR void  size(2) Largest target is 384
;!		 -> clock_menu(BANK3[25]), input_config(BIGRAM[384]), input_menu(BANK3[75]), system_config(BANK5[128]), 
;!
;!    sp__strcpy	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK4[10]), 
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), 
;!		 -> value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 12
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), menu_item_options$option_count(CODE[1]), menu_update_time_value@value_buf(BANK0[6]), 
;!		 -> relay_high_edit_flag(COMRAM[1]), ?_sprintf(COMRAM[2]), sprintf@c(COMRAM[1]), STR_144(CODE[8]), 
;!		 -> STR_145(CODE[9]), STR_231(CODE[8]), STR_232(CODE[9]), STR_293(CODE[7]), 
;!		 -> STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), 
;!		 -> STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), 
;!		 -> STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), value_back(BANK3[5]), 
;!		 -> value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), value_enable(BANK3[10]), 
;!		 -> value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), 
;!		 -> value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_low_flow(BANK4[10]), 
;!		 -> value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), 
;!		 -> value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), 
;!		 -> value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), 
;!		 -> value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 51
;!		 -> STR_1(CODE[48]), STR_132(CODE[35]), STR_134(CODE[45]), STR_135(CODE[25]), 
;!		 -> STR_136(CODE[3]), STR_137(CODE[51]), STR_138(CODE[27]), STR_14(CODE[28]), 
;!		 -> STR_143(CODE[3]), STR_147(CODE[6]), STR_148(CODE[6]), STR_149(CODE[5]), 
;!		 -> STR_150(CODE[10]), STR_151(CODE[5]), STR_152(CODE[10]), STR_153(CODE[10]), 
;!		 -> STR_166(CODE[6]), STR_167(CODE[6]), STR_168(CODE[3]), STR_169(CODE[10]), 
;!		 -> STR_185(CODE[6]), STR_186(CODE[6]), STR_187(CODE[5]), STR_188(CODE[10]), 
;!		 -> STR_190(CODE[10]), STR_191(CODE[48]), STR_193(CODE[29]), STR_194(CODE[7]), 
;!		 -> STR_195(CODE[9]), STR_205(CODE[9]), STR_229(CODE[35]), STR_230(CODE[3]), 
;!		 -> STR_236(CODE[10]), STR_238(CODE[46]), STR_239(CODE[29]), STR_245(CODE[37]), 
;!		 -> STR_246(CODE[23]), STR_247(CODE[32]), STR_248(CODE[37]), STR_249(CODE[28]), 
;!		 -> STR_25(CODE[37]), STR_250(CODE[35]), STR_251(CODE[26]), STR_252(CODE[20]), 
;!		 -> STR_253(CODE[25]), STR_254(CODE[28]), STR_255(CODE[26]), STR_256(CODE[10]), 
;!		 -> STR_257(CODE[10]), STR_258(CODE[32]), STR_259(CODE[42]), STR_260(CODE[26]), 
;!		 -> STR_261(CODE[10]), STR_263(CODE[6]), STR_264(CODE[6]), STR_265(CODE[5]), 
;!		 -> STR_266(CODE[5]), STR_267(CODE[6]), STR_268(CODE[6]), STR_269(CODE[5]), 
;!		 -> STR_27(CODE[17]), STR_270(CODE[6]), STR_271(CODE[6]), STR_272(CODE[5]), 
;!		 -> STR_273(CODE[38]), STR_274(CODE[32]), STR_28(CODE[35]), STR_281(CODE[40]), 
;!		 -> STR_29(CODE[23]), STR_3(CODE[27]), STR_30(CODE[17]), STR_6(CODE[39]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK2[50]), 
;!		 -> main@buf_618(BANK2[30]), main@buf_652(BANK2[50]), main@buf_657(BANK2[60]), main@buf_660(BANK3[40]), 
;!		 -> main@buf_687(BANK3[30]), main@time_buf(BANK2[60]), menu_draw_input@title(BANK0[10]), menu_handle_button@buf(BANK1[50]), 
;!		 -> menu_handle_button@buf_1549(BANK1[50]), menu_handle_button@buf_1571(BANK1[50]), menu_handle_button@buf_1581(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1513(BANK1[50]), menu_handle_encoder@buf_1516(BANK1[50]), menu_update_edit_value@value_buf(BANK0[10]), menu_update_time_value@debug_after(BANK0[50]), 
;!		 -> menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), 
;!		 -> trigger_relay_pulse@buf(BANK0[60]), value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_display(BANK3[10]), value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), 
;!		 -> value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), 
;!		 -> value_highbp(BANK4[10]), value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), 
;!		 -> value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), 
;!		 -> value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), 
;!		 -> value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_207(CODE[1]), STR_276(CODE[8]), STR_277(CODE[6]), STR_278(CODE[6]), 
;!		 -> STR_279(CODE[5]), STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), 
;!		 -> STR_48(CODE[1]), STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), 
;!		 -> STR_52(CODE[5]), STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), 
;!		 -> STR_56(CODE[8]), STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), 
;!		 -> STR_60(CODE[4]), STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), 
;!		 -> STR_64(CODE[1]), STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), 
;!		 -> STR_68(CODE[1]), STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), 
;!		 -> STR_72(CODE[1]), STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), 
;!		 -> STR_76(CODE[6]), STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), 
;!
;!    strcpy@cp	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK4[10]), 
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), 
;!		 -> value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 12
;!		 -> menu_update_edit_value@value_buf(BANK0[10]), STR_146(CODE[9]), STR_154(CODE[6]), STR_155(CODE[6]), 
;!		 -> STR_156(CODE[9]), STR_157(CODE[6]), STR_158(CODE[6]), STR_159(CODE[9]), 
;!		 -> STR_160(CODE[6]), STR_161(CODE[6]), STR_162(CODE[9]), STR_163(CODE[5]), 
;!		 -> STR_164(CODE[5]), STR_165(CODE[5]), STR_170(CODE[6]), STR_171(CODE[6]), 
;!		 -> STR_172(CODE[9]), STR_173(CODE[5]), STR_174(CODE[5]), STR_175(CODE[5]), 
;!		 -> STR_176(CODE[7]), STR_177(CODE[8]), STR_178(CODE[5]), STR_179(CODE[5]), 
;!		 -> STR_180(CODE[6]), STR_181(CODE[6]), STR_182(CODE[9]), STR_183(CODE[2]), 
;!		 -> STR_184(CODE[4]), STR_189(CODE[4]), STR_206(CODE[6]), STR_233(CODE[6]), 
;!		 -> STR_234(CODE[6]), STR_235(CODE[9]), STR_237(CODE[5]), STR_45(CODE[9]), 
;!		 -> STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[1]), 
;!		 -> STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), STR_61(CODE[5]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), STR_65(CODE[2]), 
;!		 -> STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), STR_73(CODE[1]), 
;!		 -> STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), STR_77(CODE[9]), 
;!		 -> STR_78(CODE[1]), STR_79(CODE[1]), value_back(BANK3[5]), value_clock_display(BANK4[10]), 
;!		 -> value_clock_enable(BANK4[10]), value_display(BANK3[10]), value_enable(BANK3[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), 
;!		 -> value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), 
;!		 -> value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), 
;!		 -> value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), 
;!		 -> value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strcpy@to	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK4[10]), 
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), 
;!		 -> value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strlen@cp	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_45(CODE[9]), 
;!		 -> STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[1]), 
;!		 -> STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), STR_61(CODE[5]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), STR_65(CODE[2]), 
;!		 -> STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), STR_73(CODE[1]), 
;!		 -> STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), STR_77(CODE[9]), 
;!		 -> STR_78(CODE[1]), STR_79(CODE[1]), value_back(BANK3[5]), value_clock_display(BANK4[10]), 
;!		 -> value_clock_enable(BANK4[10]), value_display(BANK3[10]), value_enable(BANK3[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), 
;!		 -> value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), 
;!		 -> value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), 
;!		 -> value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), 
;!		 -> value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strlen@s	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_45(CODE[9]), 
;!		 -> STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[1]), 
;!		 -> STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), STR_61(CODE[5]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), STR_65(CODE[2]), 
;!		 -> STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), STR_73(CODE[1]), 
;!		 -> STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), STR_77(CODE[9]), 
;!		 -> STR_78(CODE[1]), STR_79(CODE[1]), value_back(BANK3[5]), value_clock_display(BANK4[10]), 
;!		 -> value_clock_enable(BANK4[10]), value_display(BANK3[10]), value_enable(BANK3[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), 
;!		 -> value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), 
;!		 -> value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), 
;!		 -> value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), 
;!		 -> value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    temp_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[7]), STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[7]), STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[11]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), 
;!		 -> STR_120(CODE[10]), STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), 
;!		 -> STR_124(CODE[8]), STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), 
;!		 -> STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), STR_88(CODE[11]), 
;!		 -> STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), STR_92(CODE[6]), 
;!		 -> STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    temp_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), 
;!		 -> value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK2[50]), 
;!		 -> main@buf_618(BANK2[30]), main@buf_652(BANK2[50]), main@buf_657(BANK2[60]), main@buf_660(BANK3[40]), 
;!		 -> main@buf_687(BANK3[30]), main@time_buf(BANK2[60]), menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1549(BANK1[50]), 
;!		 -> menu_handle_button@buf_1571(BANK1[50]), menu_handle_button@buf_1581(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1513(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1516(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), 
;!		 -> rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), STR_10(CODE[42]), STR_11(CODE[34]), 
;!		 -> STR_12(CODE[36]), STR_13(CODE[20]), STR_133(CODE[29]), STR_15(CODE[28]), 
;!		 -> STR_16(CODE[23]), STR_19(CODE[22]), STR_192(CODE[31]), STR_2(CODE[42]), 
;!		 -> STR_20(CODE[19]), STR_21(CODE[24]), STR_22(CODE[22]), STR_23(CODE[22]), 
;!		 -> STR_24(CODE[19]), STR_26(CODE[16]), STR_262(CODE[27]), STR_275(CODE[25]), 
;!		 -> STR_280(CODE[20]), STR_282(CODE[22]), STR_283(CODE[28]), STR_284(CODE[37]), 
;!		 -> STR_285(CODE[31]), STR_286(CODE[39]), STR_287(CODE[31]), STR_288(CODE[49]), 
;!		 -> STR_289(CODE[38]), STR_290(CODE[43]), STR_291(CODE[38]), STR_292(CODE[29]), 
;!		 -> STR_31(CODE[20]), STR_32(CODE[15]), STR_33(CODE[26]), STR_36(CODE[22]), 
;!		 -> STR_37(CODE[20]), STR_38(CODE[21]), STR_39(CODE[33]), STR_4(CODE[29]), 
;!		 -> STR_42(CODE[36]), STR_43(CODE[20]), STR_44(CODE[21]), STR_5(CODE[23]), 
;!		 -> STR_7(CODE[20]), STR_8(CODE[16]), STR_9(CODE[37]), trigger_relay_pulse@buf(BANK0[60]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK2[50]), 
;!		 -> main@buf_618(BANK2[30]), main@buf_652(BANK2[50]), main@buf_657(BANK2[60]), main@buf_660(BANK3[40]), 
;!		 -> main@buf_687(BANK3[30]), main@time_buf(BANK2[60]), menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1549(BANK1[50]), 
;!		 -> menu_handle_button@buf_1571(BANK1[50]), menu_handle_button@buf_1581(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1513(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1516(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), 
;!		 -> rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), STR_10(CODE[42]), STR_11(CODE[34]), 
;!		 -> STR_12(CODE[36]), STR_13(CODE[20]), STR_133(CODE[29]), STR_15(CODE[28]), 
;!		 -> STR_16(CODE[23]), STR_19(CODE[22]), STR_192(CODE[31]), STR_2(CODE[42]), 
;!		 -> STR_20(CODE[19]), STR_21(CODE[24]), STR_22(CODE[22]), STR_23(CODE[22]), 
;!		 -> STR_24(CODE[19]), STR_26(CODE[16]), STR_262(CODE[27]), STR_275(CODE[25]), 
;!		 -> STR_280(CODE[20]), STR_282(CODE[22]), STR_283(CODE[28]), STR_284(CODE[37]), 
;!		 -> STR_285(CODE[31]), STR_286(CODE[39]), STR_287(CODE[31]), STR_288(CODE[49]), 
;!		 -> STR_289(CODE[38]), STR_290(CODE[43]), STR_291(CODE[38]), STR_292(CODE[29]), 
;!		 -> STR_31(CODE[20]), STR_32(CODE[15]), STR_33(CODE[26]), STR_36(CODE[22]), 
;!		 -> STR_37(CODE[20]), STR_38(CODE[21]), STR_39(CODE[33]), STR_4(CODE[29]), 
;!		 -> STR_42(CODE[36]), STR_43(CODE[20]), STR_44(CODE[21]), STR_5(CODE[23]), 
;!		 -> STR_7(CODE[20]), STR_8(CODE[16]), STR_9(CODE[37]), trigger_relay_pulse@buf(BANK0[60]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_menu_handle_encoder
;!    _rtc_set_time->_dec_to_bcd
;!    _dec_to_bcd->___lbdiv
;!    _dec_to_bcd->___lbmod
;!    _rtc_read_time->_sprintf
;!    _rtc_init->_rtc_write_register
;!    _rtc_write_register->_i2c_start
;!    _rtc_write_register->_i2c_stop
;!    _menu_update_numeric_value->_lcd_set_cursor
;!    _menu_update_edit_value->_sprintf
;!    _menu_handle_encoder->_menu_draw_input
;!    _handle_time_rotation->_sprintf
;!    _handle_numeric_rotation->_sprintf
;!    _menu_handle_button->_menu_draw_input
;!    _trigger_relay_pulse->_sprintf
;!    _rebuild_input_menu->_sprintf
;!    _rebuild_clock_menu->_sprintf
;!    _menu_update_time_value->_sprintf
;!    _menu_draw_clock->_lcd_print_at
;!    _menu_draw_setup->_lcd_print_at
;!    _menu_draw_options->_lcd_print_at
;!    _lcd_clear->_lcd_cmd
;!    _menu_draw_input->_sprintf
;!    _lcd_print_at->_lcd_set_cursor
;!    _lcd_clear_line->_lcd_set_cursor
;!    _lcd_set_cursor->_lcd_cmd
;!    _lcd_print->_lcd_data
;!    _lcd_data->_lcd_write_nibble
;!    _init_time_editor->_sprintf
;!    _sprintf->___lwdiv
;!    _init_numeric_editor->___lwdiv
;!    ___lwdiv->___lwmod
;!    _lcd_init->_lcd_cmd
;!    _lcd_cmd->_lcd_write_nibble
;!    _eeprom_init->_save_current_config
;!    _save_current_config->_eeprom_write_block
;!    _eeprom_write_word->_eeprom_write_byte
;!    _eeprom_write_block->_eeprom_write_byte
;!    _load_factory_defaults->_memcpy
;!    _eeprom_read_word->_eeprom_read_byte
;!    _eeprom_read_block->_eeprom_read_byte
;!    _ad7994_read_channel->_i2c_read
;!    _i2c_read->_i2c_wait_idle
;!    _ad7994_init->_i2c_start
;!    _ad7994_init->_i2c_stop
;!    _ad7994_init->_uart_println
;!    _uart_println->_uart_print
;!    _uart_print->_uart_write
;!    _i2c_stop->_i2c_wait_idle
;!    _i2c_start->_i2c_wait_idle
;!
;!Critical Paths under _isr in COMRAM
;!
;!    _isr->i2___lwmod
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->_menu_update_time_value
;!    _menu_handle_encoder->_menu_update_time_value
;!    _menu_handle_button->_menu_update_time_value
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
;! (0) _main                                               366   366      0 1118889
;!                                             77 COMRAM     2     2      0
;!                                            110 BANK0     13    13      0
;!                                            230 BANK1     14    14      0
;!                                              0 BANK2    250   250      0
;!                                              0 BANK3     70    70      0
;!                             ___wmul
;!                        _ad7994_init
;!                _ad7994_read_channel
;!                               _beep
;!                        _eeprom_init
;!                       _encoder_init
;!           _get_menu_timeout_seconds
;!            _handle_numeric_rotation
;!               _handle_time_rotation
;!                           _i2c_init
;!                   _is_numeric_field
;!                      _is_time_field
;!                          _lcd_clear
;!                           _lcd_init
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                    _menu_draw_clock
;!                    _menu_draw_input
;!                  _menu_draw_options
;!                    _menu_draw_setup
;!                 _menu_handle_button
;!                _menu_handle_encoder
;!                          _menu_init
;!             _menu_update_edit_value
;!          _menu_update_numeric_value
;!             _menu_update_time_value
;!                           _rtc_init
;!                      _rtc_read_time
;!                       _rtc_set_time
;!                _save_current_config
;!                            _sprintf
;!                        _system_init
;!                          _uart_init
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _system_init                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _rtc_set_time                                        10     8      2    1705
;!                                             21 COMRAM    10     8      2
;!                         _dec_to_bcd
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;! ---------------------------------------------------------------------------------
;! (2) _dec_to_bcd                                           3     3      0    1125
;!                                             18 COMRAM     3     3      0
;!                            ___lbdiv
;!                            ___lbmod
;! ---------------------------------------------------------------------------------
;! (1) _rtc_read_time                                       90    88      2   30315
;!                                             64 COMRAM     2     0      2
;!                                              0 BANK0     88    88      0
;!                         _bcd_to_dec
;!                           _i2c_read
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _bcd_to_dec                                           2     2      0      44
;!                                             14 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _rtc_init                                             2     2      0     234
;!                                             21 COMRAM     2     2      0
;!                 _rtc_write_register
;! ---------------------------------------------------------------------------------
;! (2) _rtc_write_register                                   2     1      1     234
;!                                             19 COMRAM     2     1      1
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_numeric_value                           28    28      0    9492
;!                                             21 COMRAM    28    28      0
;!                   _is_numeric_field
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_edit_value                              31    31      0   38809
;!                                             64 COMRAM     2     2      0
;!                                              0 BANK0     29    29      0
;!                   _is_numeric_field
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                            _sprintf
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (1) _menu_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_encoder                                172   170      2  306504
;!                                             69 COMRAM     8     6      2
;!                                              0 BANK1    164   164      0
;!         _get_item_options_for_field
;!               _get_option_edit_flag
;!            _handle_numeric_rotation
;!               _handle_time_rotation
;!                   _is_numeric_field
;!                    _is_option_field
;!                      _is_time_field
;!                    _menu_draw_clock
;!                    _menu_draw_input
;!                  _menu_draw_options
;!                    _menu_draw_setup
;!             _menu_update_time_value
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _handle_time_rotation                                53    53      0   29263
;!                                              0 BANK0     53    53      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _handle_numeric_rotation                             57    57      0   29616
;!                                              0 BANK0     57    57      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                 235   235      0  409881
;!                                             69 COMRAM     5     5      0
;!                                              0 BANK1    230   230      0
;!                            ___lbdiv
;!                            ___lbmod
;!                             ___wmul
;!                               _beep
;!          _get_current_numeric_value
;!         _get_item_options_for_field
;!               _get_option_edit_flag
;!                _init_numeric_editor
;!                   _init_time_editor
;!                   _is_numeric_field
;!                    _is_option_field
;!                      _is_time_field
;!                    _menu_draw_clock
;!                    _menu_draw_input
;!                  _menu_draw_options
;!                    _menu_draw_setup
;!             _menu_update_time_value
;!                 _rebuild_clock_menu
;!                 _rebuild_input_menu
;!                _save_current_config
;!                            _sprintf
;!                             _strcmp
;!                             _strcpy
;!                _trigger_relay_pulse
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _trigger_relay_pulse                                 61    61      0   29195
;!                                              0 BANK0     61    61      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_input_menu                                  90    90      0   44554
;!                                             64 COMRAM     1     1      0
;!                                              0 BANK0     89    89      0
;!                            ___lwdiv
;!                            ___lwmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_clock_menu                                  58    58      0   38355
;!                                             64 COMRAM     2     2      0
;!                                              0 BANK0     56    56      0
;!                            ___lbdiv
;!                            ___lbmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_time_value                             111   111      0   68186
;!                                              0 BANK0    110   110      0
;!                            ___lbdiv
;!                            ___lbmod
;!                      _is_time_field
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                    _menu_draw_clock
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_clock                                     32    32      0   29310
;!                                             25 COMRAM    32    32      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (3) ___lbmod                                              4     3      1     539
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (3) ___lbdiv                                              4     3      1     542
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_setup                                     23    23      0   22285
;!                                             25 COMRAM    23    23      0
;!                          _lcd_clear
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_options                                    2     2      0   21691
;!                                             25 COMRAM     2     2      0
;!                          _lcd_clear
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_clear                                            1     1      0     248
;!                                             18 COMRAM     1     1      0
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_input                                     51    51      0   61217
;!                                             64 COMRAM     5     5      0
;!                                              0 BANK0     46    46      0
;!         _get_item_options_for_field
;!               _get_option_edit_flag
;!                   _is_numeric_field
;!                    _is_option_field
;!                      _is_time_field
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;!                            _sprintf
;!                             _strcmp
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (3) _strlen                                               4     2      2     670
;!                                             14 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (3) _strcpy                                               6     2      4    6229
;!                                             14 COMRAM     6     2      4
;! ---------------------------------------------------------------------------------
;! (3) _strcmp                                               7     3      4    1003
;!                                             14 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (3) _lcd_print_at                                         4     1      3    8173
;!                                             21 COMRAM     4     1      3
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_clear_line                                       1     1      0    6491
;!                                             21 COMRAM     1     1      0
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_set_cursor                                       3     2      1    2699
;!                                             18 COMRAM     3     2      1
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (4) _lcd_print                                            2     0      2    3761
;!                                             17 COMRAM     2     0      2
;!                           _lcd_data
;! ---------------------------------------------------------------------------------
;! (5) _lcd_data                                             1     1      0     186
;!                                             16 COMRAM     1     1      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (2) _is_time_field                                        4     2      2    1460
;!                                             14 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (3) _is_option_field                                      7     5      2    1144
;!                                             14 COMRAM     7     5      2
;! ---------------------------------------------------------------------------------
;! (2) _is_numeric_field                                     6     4      2    2165
;!                                             14 COMRAM     6     4      2
;! ---------------------------------------------------------------------------------
;! (3) _get_option_edit_flag                                 3     1      2    1178
;!                                             14 COMRAM     3     1      2
;! ---------------------------------------------------------------------------------
;! (3) _get_item_options_for_field                           3     1      2    1178
;!                                             14 COMRAM     3     1      2
;! ---------------------------------------------------------------------------------
;! (2) _init_time_editor                                    63    60      3   34762
;!                                             64 COMRAM     3     0      3
;!                                              0 BANK0     60    60      0
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _sprintf                                             42    24     18   22607
;!                                             26 COMRAM    38    20     18
;!                            ___lbdiv (ARG)
;!                            ___lbmod (ARG)
;!                            ___lwdiv
;!                            ___lwmod
;!                             ___wmul
;!                            _isdigit
;! ---------------------------------------------------------------------------------
;! (2) _isdigit                                              3     3      0      99
;!                                             14 COMRAM     3     3      0
;! ---------------------------------------------------------------------------------
;! (2) ___wmul                                               6     2      4    1982
;!                                             14 COMRAM     6     2      4
;!           _get_menu_timeout_seconds (ARG)
;! ---------------------------------------------------------------------------------
;! (2) _init_numeric_editor                                 10     8      2    5628
;!                                             26 COMRAM    10     8      2
;!                            ___lwdiv
;!                            ___lwmod
;! ---------------------------------------------------------------------------------
;! (2) ___lwmod                                              5     1      4    2502
;!                                             14 COMRAM     5     1      4
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4    2581
;!                                             19 COMRAM     7     3      4
;!                            ___lwmod (ARG)
;! ---------------------------------------------------------------------------------
;! (2) _get_current_numeric_value                           10     8      2      46
;!                                             14 COMRAM    10     8      2
;! ---------------------------------------------------------------------------------
;! (2) _beep                                                 5     3      2    1870
;!                                             14 COMRAM     5     3      2
;! ---------------------------------------------------------------------------------
;! (1) _lcd_init                                             2     2      0     372
;!                                             18 COMRAM     2     2      0
;!                            _lcd_cmd
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (4) _lcd_cmd                                              2     2      0     248
;!                                             16 COMRAM     2     2      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (5) _lcd_write_nibble                                     2     2      0     124
;!                                             14 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _i2c_init                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _get_menu_timeout_seconds                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _encoder_init                                         2     2      0       0
;!                                             14 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _eeprom_init                                          5     5      0    5741
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
;! (1) _save_current_config                                  3     3      0    2288
;!                                             27 COMRAM     3     3      0
;!          _calculate_config_checksum
;!                 _eeprom_write_block
;!                  _eeprom_write_word
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_write_word                                    4     0      4     764
;!                                             17 COMRAM     4     0      4
;!                  _eeprom_write_byte
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_write_block                                  10     4      6    1136
;!                                             17 COMRAM    10     4      6
;!                  _eeprom_write_byte
;! ---------------------------------------------------------------------------------
;! (3) _eeprom_write_byte                                    3     0      3     523
;!                                             14 COMRAM     3     0      3
;! ---------------------------------------------------------------------------------
;! (2) _calculate_config_checksum                           12    10      2     275
;!                                             14 COMRAM    12    10      2
;! ---------------------------------------------------------------------------------
;! (2) _load_factory_defaults                                0     0      0    1739
;!                             _memcpy
;! ---------------------------------------------------------------------------------
;! (3) _memcpy                                              11     5      6    1739
;!                                             14 COMRAM    11     5      6
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_read_word                                     7     5      2     417
;!                                             16 COMRAM     7     5      2
;!                   _eeprom_read_byte
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_read_block                                   10     4      6     886
;!                                             16 COMRAM    10     4      6
;!                   _eeprom_read_byte
;! ---------------------------------------------------------------------------------
;! (3) _eeprom_read_byte                                     2     0      2     273
;!                                             14 COMRAM     2     0      2
;! ---------------------------------------------------------------------------------
;! (1) _ad7994_read_channel                                 50    48      2     368
;!                                             22 COMRAM    10     8      2
;!                           _i2c_read
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;! ---------------------------------------------------------------------------------
;! (2) _i2c_read                                             5     5      0     136
;!                                             17 COMRAM     5     5      0
;!                      _i2c_wait_idle
;! ---------------------------------------------------------------------------------
;! (1) _ad7994_init                                          1     1      0    6444
;!                                             19 COMRAM     1     1      0
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    6330
;!                                             17 COMRAM     2     0      2
;!                         _uart_print
;!                         _uart_write
;! ---------------------------------------------------------------------------------
;! (2) _uart_print                                           2     0      2     143
;!                                             15 COMRAM     2     0      2
;!                         _uart_write
;! ---------------------------------------------------------------------------------
;! (2) _uart_write                                           1     1      0      22
;!                                             14 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (2) _i2c_write                                            1     1      0      22
;!                                             14 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (2) _i2c_stop                                             2     2      0      46
;!                                             17 COMRAM     2     2      0
;!                      _i2c_wait_idle
;! ---------------------------------------------------------------------------------
;! (2) _i2c_start                                            2     2      0      46
;!                                             17 COMRAM     2     2      0
;!                      _i2c_wait_idle
;! ---------------------------------------------------------------------------------
;! (3) _i2c_wait_idle                                        3     3      0      23
;!                                             14 COMRAM     3     3      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 5
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (8) _isr                                                  9     9      0     390
;!                                              5 COMRAM     9     9      0
;!                          i2___lwmod
;! ---------------------------------------------------------------------------------
;! (9) i2___lwmod                                            5     1      4     211
;!                                              0 COMRAM     5     1      4
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 9
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   ___wmul
;!     _get_menu_timeout_seconds (ARG)
;!   _ad7994_init
;!     _i2c_start
;!       _i2c_wait_idle
;!     _i2c_stop
;!       _i2c_wait_idle
;!     _i2c_write
;!     _uart_println
;!       _uart_print
;!         _uart_write
;!       _uart_write
;!   _ad7994_read_channel
;!     _i2c_read
;!       _i2c_wait_idle
;!     _i2c_start
;!     _i2c_stop
;!     _i2c_write
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
;!   _get_menu_timeout_seconds
;!   _handle_numeric_rotation
;!     _sprintf
;!       ___lbdiv (ARG)
;!       ___lbmod (ARG)
;!       ___lwdiv (ARG)
;!         ___lwmod (ARG)
;!       ___lwmod (ARG)
;!       ___wmul (ARG)
;!       _isdigit (ARG)
;!     _uart_println
;!   _handle_time_rotation
;!     _sprintf
;!     _uart_println
;!   _i2c_init
;!   _is_numeric_field
;!   _is_time_field
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
;!   _menu_draw_clock
;!     _lcd_clear_line
;!       _lcd_print
;!       _lcd_set_cursor
;!     _lcd_print
;!     _lcd_print_at
;!       _lcd_print
;!       _lcd_set_cursor
;!     _lcd_set_cursor
;!     _strcpy
;!     _strlen
;!   _menu_draw_input
;!     _get_item_options_for_field
;!     _get_option_edit_flag
;!     _is_numeric_field
;!     _is_option_field
;!     _is_time_field
;!     _lcd_clear_line
;!     _lcd_print
;!     _lcd_print_at
;!     _lcd_set_cursor
;!     _sprintf
;!     _strcmp
;!     _strcpy
;!     _strlen
;!   _menu_draw_options
;!     _lcd_clear
;!     _lcd_clear_line
;!     _lcd_print
;!     _lcd_print_at
;!     _lcd_set_cursor
;!   _menu_draw_setup
;!     _lcd_clear
;!     _lcd_clear_line
;!     _lcd_print
;!     _lcd_print_at
;!     _lcd_set_cursor
;!   _menu_handle_button
;!     ___lbdiv
;!     ___lbmod
;!     ___wmul
;!     _beep
;!     _get_current_numeric_value
;!     _get_item_options_for_field
;!     _get_option_edit_flag
;!     _init_numeric_editor
;!       ___lwdiv
;!       ___lwmod
;!     _init_time_editor
;!       ___lwdiv
;!       ___lwmod
;!       _sprintf
;!       _uart_println
;!     _is_numeric_field
;!     _is_option_field
;!     _is_time_field
;!     _menu_draw_clock
;!     _menu_draw_input
;!     _menu_draw_options
;!     _menu_draw_setup
;!     _menu_update_time_value
;!       ___lbdiv
;!       ___lbmod
;!       _is_time_field
;!       _lcd_print
;!       _lcd_set_cursor
;!       _menu_draw_clock
;!       _sprintf
;!       _uart_println
;!     _rebuild_clock_menu
;!       ___lbdiv
;!       ___lbmod
;!       _memcpy
;!       _sprintf
;!       _strcpy
;!       _uart_println
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
;!     _trigger_relay_pulse
;!       _sprintf
;!       _uart_println
;!     _uart_println
;!   _menu_handle_encoder
;!     _get_item_options_for_field
;!     _get_option_edit_flag
;!     _handle_numeric_rotation
;!     _handle_time_rotation
;!     _is_numeric_field
;!     _is_option_field
;!     _is_time_field
;!     _menu_draw_clock
;!     _menu_draw_input
;!     _menu_draw_options
;!     _menu_draw_setup
;!     _menu_update_time_value
;!     _sprintf
;!     _strcpy
;!     _uart_println
;!   _menu_init
;!   _menu_update_edit_value
;!     _is_numeric_field
;!     _lcd_print
;!     _lcd_set_cursor
;!     _sprintf
;!     _strcpy
;!     _strlen
;!   _menu_update_numeric_value
;!     _is_numeric_field
;!     _lcd_print
;!     _lcd_set_cursor
;!   _menu_update_time_value
;!   _rtc_init
;!     _rtc_write_register
;!       _i2c_start
;!       _i2c_stop
;!       _i2c_write
;!   _rtc_read_time
;!     _bcd_to_dec
;!     _i2c_read
;!     _i2c_start
;!     _i2c_stop
;!     _i2c_write
;!     _sprintf
;!     _uart_println
;!   _rtc_set_time
;!     _dec_to_bcd
;!       ___lbdiv
;!       ___lbmod
;!     _i2c_start
;!     _i2c_stop
;!     _i2c_write
;!   _save_current_config
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
;!BIGRAM             F7F      0     180      51        9.7%
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
;!BANK5              100      0      80      15       50.0%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100      0      F8      13       96.9%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100     46      FB      11       98.0%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100     FA     100       9      100.0%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100     F4     100       7      100.0%
;!BITBANK15           80      0       0      34        0.0%
;!BANK15              80      0       0      35        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80     7B      80       5      100.0%
;!BITCOMRAM           7E      0       0       0        0.0%
;!COMRAM              7E     4F      69       1       83.3%
;!BITBIGSFRhhhhlh     1A      0       0      37        0.0%
;!BITBIGSFRhhhhh       D      0       0      36        0.0%
;!BITBIGSFRhhhlhh      9      0       0      39        0.0%
;!BITBIGSFRhhhll       8      0       0      41        0.0%
;!BITBIGSFRhlhllh      7      0       0      44        0.0%
;!BITBIGSFRllh         7      0       0      48        0.0%
;!BITBIGSFRhhlh        7      0       0      42        0.0%
;!BITBIGSFRlh          6      0       0      47        0.0%
;!BITBIGSFRhll         6      0       0      46        0.0%
;!BITBIGSFRhhhlhl      3      0       0      40        0.0%
;!BITBIGSFRhlhlll      2      0       0      45        0.0%
;!BITBIGSFRhhhhll      1      0       0      38        0.0%
;!BITBIGSFRhhll        1      0       0      43        0.0%
;!BITBIGSFRlll         1      0       0      49        0.0%
;!BIGSFR               0      0       0     200        0.0%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0     55C      50        0.0%
;!DATA                 0      0     6DC       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 173 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            30   40[BANK3 ] unsigned char [30]
;;  current_even    1  120[BANK0 ] unsigned char 
;;  time_buf       60    0[BANK2 ] unsigned char [60]
;;  buf            40    0[BANK3 ] unsigned char [40]
;;  delta           2  121[BANK0 ] int 
;;  buf            60   60[BANK2 ] unsigned char [60]
;;  buf            50  170[BANK2 ] unsigned char [50]
;;  lcd_buf        17    0        unsigned char [17]
;;  buf            30  220[BANK2 ] unsigned char [30]
;;  buf            50  120[BANK2 ] unsigned char [50]
;;  current_time    7  237[BANK1 ] struct .
;;  set_time        7  230[BANK1 ] struct .
;;  last_encoder    2  118[BANK0 ] int 
;;  adc_ch3         2  114[BANK0 ] unsigned int 
;;  adc_ch2         2  112[BANK0 ] unsigned int 
;;  adc_ch1         2  110[BANK0 ] unsigned int 
;;  adc_error       1  117[BANK0 ] unsigned char 
;;  last_button     1  116[BANK0 ] unsigned char 
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
;;      Locals:         0      13      14     250      70       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2      13      14     250      70       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      349 bytes
;; Hardware stack levels required when called: 9
;; This function calls:
;;		___wmul
;;		_ad7994_init
;;		_ad7994_read_channel
;;		_beep
;;		_eeprom_init
;;		_encoder_init
;;		_get_menu_timeout_seconds
;;		_handle_numeric_rotation
;;		_handle_time_rotation
;;		_i2c_init
;;		_is_numeric_field
;;		_is_time_field
;;		_lcd_clear
;;		_lcd_init
;;		_lcd_print
;;		_lcd_set_cursor
;;		_menu_draw_clock
;;		_menu_draw_input
;;		_menu_draw_options
;;		_menu_draw_setup
;;		_menu_handle_button
;;		_menu_handle_encoder
;;		_menu_init
;;		_menu_update_edit_value
;;		_menu_update_numeric_value
;;		_menu_update_time_value
;;		_rtc_init
;;		_rtc_read_time
;;		_rtc_set_time
;;		_save_current_config
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
	line	173
global __ptext0
__ptext0:
psect	text0
	file	"src\main.c"
	line	173
	
_main:
;incstack = 0
	callstack 22
	line	176
	
l13055:
	call	_system_init	;wreg free
	line	178
	
l13057:
	call	_eeprom_init	;wreg free
	line	185
	
l13059:; BSR set to: 5

	call	_get_menu_timeout_seconds	;wreg free
	movwf	(??_main+0+0)^00h,c
	movf	((??_main+0+0))^00h,c,w
	movwf	((c:___wmul@multiplier))^00h,c
	clrf	((c:___wmul@multiplier+1))^00h,c
	movlw	high(01F4h)
	movwf	((c:___wmul@multiplicand+1))^00h,c
	movlw	low(01F4h)
	movwf	((c:___wmul@multiplicand))^00h,c
	call	___wmul	;wreg free
	movff	0+?___wmul,(c:_menu_timeout_reload)	;volatile
	movff	1+?___wmul,(c:_menu_timeout_reload+1)	;volatile
	line	187
	
l13061:
	call	_uart_init	;wreg free
	line	189
	
l13063:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	191
	
l13065:
		movlw	low(main@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_6)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_6)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_relay_state),0+((c:?_sprintf)+04h)	;volatile
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_relay_counter),0+((c:?_sprintf)+06h)	;volatile
	movff	(_relay_counter+1),1+((c:?_sprintf)+06h)	;volatile
	call	_sprintf	;wreg free
	line	192
	
l13067:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	195
	
l13069:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	196
	
l13071:
	call	_i2c_init	;wreg free
	line	197
	
l13073:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	200
	
l13075:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	201
	
l13077:
	call	_rtc_init	;wreg free
	iorlw	0
	btfss	status,2
	goto	u16991
	goto	u16990
u16991:
	goto	l13081
u16990:
	line	203
	
l13079:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	204
	goto	l13083
	line	207
	
l13081:
		movlw	low(STR_11)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_11)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	212
	
l13083:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((main@set_time))&0ffh
	line	213
	
l13085:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(main@set_time+01h))&0ffh
	line	214
	
l13087:; BSR set to: 1

	movlw	low(0Ch)
	movwf	(0+(main@set_time+02h))&0ffh
	line	215
	
l13089:; BSR set to: 1

	movlw	low(01h)
	movwf	(0+(main@set_time+03h))&0ffh
	line	216
	
l13091:; BSR set to: 1

	movlw	low(07h)
	movwf	(0+(main@set_time+04h))&0ffh
	line	217
	
l13093:; BSR set to: 1

	movlw	low(0Ah)
	movwf	(0+(main@set_time+05h))&0ffh
	line	218
	
l13095:; BSR set to: 1

	movlw	low(019h)
	movwf	(0+(main@set_time+06h))&0ffh
	line	220
	
l13097:; BSR set to: 1

		movlw	low(main@set_time)
	movwf	((c:rtc_set_time@time))^00h,c
	movlw	high(main@set_time)
	movwf	((c:rtc_set_time@time+1))^00h,c

	call	_rtc_set_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u17001
	goto	u17000
u17001:
	goto	l13101
u17000:
	line	222
	
l13099:
		movlw	low(STR_12)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_12)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	223
	goto	l174
	line	226
	
l13101:
		movlw	low(STR_13)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_13)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	227
	
l174:
	line	229
	call	_ad7994_init	;wreg free
	movlb	0	; () banked
	movwf	((main@adc_error))&0ffh
	line	230
	
l13103:; BSR set to: 0

	movf	((main@adc_error))&0ffh,w
	btfsc	status,2
	goto	u17011
	goto	u17010
u17011:
	goto	l13109
u17010:
	line	233
	
l13105:; BSR set to: 0

		movlw	low(main@buf_618)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_618)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_14)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_14)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@adc_error),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	234
	
l13107:
		movlw	low(main@buf_618)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_618)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	237
	
l13109:
	call	_encoder_init	;wreg free
	line	238
	
l13111:
	call	_menu_init	;wreg free
	line	239
	
l13113:; BSR set to: 3

	call	_lcd_init	;wreg free
	line	241
	
l13115:
		movlw	low(STR_15)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	242
	
l13117:
		movlw	low(STR_16)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_16)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	244
	
l13119:
	call	_lcd_clear	;wreg free
	line	245
	
l13121:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	246
	
l13123:
		movlw	low(STR_17)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_17)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	247
	
l13125:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	248
	
l13127:
		movlw	low(STR_18)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_18)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	250
	
l13129:
		movlw	low(STR_19)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_19)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	251
	
l13131:
		movlw	low(STR_20)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_20)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	252
	
l13133:
		movlw	low(STR_21)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_21)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	254
	
l13135:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	255
	
l13137:
	asmopt push
asmopt off
movlw  5
movwf	(??_main+0+0+1)^00h,c
movlw	15
movwf	(??_main+0+0)^00h,c
	movlw	241
u17487:
decfsz	wreg,f
	bra	u17487
	decfsz	(??_main+0+0)^00h,c,f
	bra	u17487
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u17487
	nop
asmopt pop

	line	256
	
l13139:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	258
	
l13141:
		movlw	low(STR_22)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_22)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	259
	
l13143:
		movlw	low(STR_23)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_23)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	265
	
l13145:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	266
	
l13147:; BSR set to: 2

	movlw	low(05h)
	movlb	3	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	268
	
l13149:; BSR set to: 3

	call	_menu_draw_options	;wreg free
	line	269
	
l13151:
		movlw	low(STR_24)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_24)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	272
	
l13153:
	movlw	high(0)
	movlb	0	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	273
	
l13155:; BSR set to: 0

	movlw	low(0)
	movwf	((main@last_button))&0ffh
	line	287
	
l13157:
	movlb	1	; () banked
	incf	((main@sample_counter))&0ffh
	line	289
	
l13159:; BSR set to: 1

		movlw	0Ah-1
	cpfsgt	((main@sample_counter))&0ffh
	goto	u17021
	goto	u17020

u17021:
	goto	l13181
u17020:
	line	291
	
l13161:; BSR set to: 1

	movlw	low(0)
	movwf	((main@sample_counter))&0ffh
	line	294
	
l13163:; BSR set to: 1

		movlw	low(main@current_time)
	movwf	((c:rtc_read_time@time))^00h,c
	movlw	high(main@current_time)
	movwf	((c:rtc_read_time@time+1))^00h,c

	call	_rtc_read_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u17031
	goto	u17030
u17031:
	goto	l13169
u17030:
	line	299
	
l13165:
		movlw	low(main@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@time_buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_25)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_25)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(main@current_time+06h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(main@current_time+05h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(main@current_time+04h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(main@current_time+02h),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	movff	0+(main@current_time+01h),0+((c:?_sprintf)+0Ch)
	clrf	(1+((c:?_sprintf)+0Ch))^00h,c
	movff	(main@current_time),0+((c:?_sprintf)+0Eh)
	clrf	(1+((c:?_sprintf)+0Eh))^00h,c
	call	_sprintf	;wreg free
	line	300
	
l13167:
		movlw	low(main@time_buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@time_buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	301
	goto	l13171
	line	304
	
l13169:
		movlw	low(STR_26)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_26)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	308
	
l13171:
	movlw	(01h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch1)
	movff	1+?_ad7994_read_channel,(main@adc_ch1+1)
	line	309
	
l13173:
	movlw	(02h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch2)
	movff	1+?_ad7994_read_channel,(main@adc_ch2+1)
	line	310
	
l13175:
	movlw	(03h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch3)
	movff	1+?_ad7994_read_channel,(main@adc_ch3+1)
	line	314
	
l13177:
		movlw	low(main@buf_652)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_652)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_27)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_27)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@adc_ch1),0+((c:?_sprintf)+04h)
	movff	(main@adc_ch1+1),1+((c:?_sprintf)+04h)
	movff	(main@adc_ch2),0+((c:?_sprintf)+06h)
	movff	(main@adc_ch2+1),1+((c:?_sprintf)+06h)
	movff	(main@adc_ch3),0+((c:?_sprintf)+08h)
	movff	(main@adc_ch3+1),1+((c:?_sprintf)+08h)
	call	_sprintf	;wreg free
	line	315
	
l13179:
		movlw	low(main@buf_652)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_652)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	320
	
l13181:
	asmopt push
asmopt off
movlw  3
movwf	(??_main+0+0+1)^00h,c
movlw	8
movwf	(??_main+0+0)^00h,c
	movlw	119
u17497:
decfsz	wreg,f
	bra	u17497
	decfsz	(??_main+0+0)^00h,c,f
	bra	u17497
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u17497
	nop
asmopt pop

	line	325
	
l13183:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	337
	
l13185:
	movlb	1	; () banked
	movf	((main@last_relay_state))&0ffh,w
	movlb	0	; () banked
xorwf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u17041
	goto	u17040

u17041:
	goto	l13189
u17040:
	
l13187:; BSR set to: 0

	movlb	1	; () banked
	movf	((main@last_relay_counter))&0ffh,w
	movlb	2	; () banked
xorwf	((_relay_counter))&0ffh,w	;volatile
	bnz	u17050
	movlb	1	; () banked
movf	((main@last_relay_counter+1))&0ffh,w
	movlb	2	; () banked
xorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u17051
	goto	u17050

u17051:
	goto	l13197
u17050:
	line	340
	
l13189:
		movlw	low(main@buf_657)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_657)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_28)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_28)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_relay_state),0+((c:?_sprintf)+04h)	;volatile
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_relay_counter),0+((c:?_sprintf)+06h)	;volatile
	movff	(_relay_counter+1),1+((c:?_sprintf)+06h)	;volatile
	call	_sprintf	;wreg free
	line	341
	
l13191:
		movlw	low(main@buf_657)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_657)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	342
	
l13193:
	movff	(_relay_state),(main@last_relay_state)	;volatile
	line	343
	
l13195:
	movff	(_relay_counter),(main@last_relay_counter)	;volatile
	movff	(_relay_counter+1),(main@last_relay_counter+1)	;volatile
	line	348
	
l13197:
	movlb	0	; () banked
	movf	((main@last_encoder))&0ffh,w
	movlb	1	; () banked
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u17060
	movlb	0	; () banked
movf	((main@last_encoder+1))&0ffh,w
	movlb	1	; () banked
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u17061
	goto	u17060

u17061:
	goto	l13255
u17060:
	line	350
	
l13199:; BSR set to: 1

	movlb	0	; () banked
	movf	((main@last_encoder))&0ffh,w
	movlb	1	; () banked
	subwf	((_encoder_count))&0ffh,w	;volatile
	movlb	0	; () banked
	movwf	((main@delta))&0ffh
	movf	((main@last_encoder+1))&0ffh,w
	movlb	1	; () banked
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movlb	0	; () banked
	movwf	1+((main@delta))&0ffh
	line	353
	
l13201:; BSR set to: 0

	movlw	high(01h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	356
	
l13203:
		movlw	low(main@buf_660)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_660)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_29)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_29)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_encoder_count),0+((c:?_sprintf)+04h)	;volatile
	movff	(_encoder_count+1),1+((c:?_sprintf)+04h)	;volatile
	movff	(main@delta),0+((c:?_sprintf)+06h)
	movff	(main@delta+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	357
	
l13205:
		movlw	low(main@buf_660)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_660)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	359
	
l13207:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	362
	
l13209:
	movlw	high(0Ah)
	movlb	1	; () banked
	movwf	((main@encoder_activity_timer+1))&0ffh
	movlw	low(0Ah)
	movwf	((main@encoder_activity_timer))&0ffh
	line	365
	
l13211:; BSR set to: 1

	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17071
	goto	u17070
u17071:
	goto	l198
u17070:
	line	367
	
l13213:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	368
	
l198:; BSR set to: 3

	line	371
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17081
	goto	u17080
u17081:
	goto	l13225
u17080:
	
l13215:; BSR set to: 3

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17091
	goto	u17090

u17091:
	goto	l13225
u17090:
	line	373
	
l13217:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:is_numeric_field@sensor_type))^00h,c
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:is_numeric_field@flow_type))^00h,c
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u17101
	goto	u17100
u17101:
	goto	l13221
u17100:
	line	376
	
l13219:
	movlb	0	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_numeric_rotation
	line	377
	goto	l13229
	line	378
	
l13221:
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:is_time_field@sensor_type))^00h,c
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:is_time_field@flow_type))^00h,c
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u17111
	goto	u17110
u17111:
	goto	l13225
u17110:
	line	381
	
l13223:
	movlb	0	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_time_rotation
	line	382
	call	_menu_update_time_value	;wreg free
	line	383
	goto	l13229
	line	387
	
l13225:
	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	line	397
	
l13229:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17121
	goto	u17120
u17121:
	goto	l13243
u17120:
	
l13231:; BSR set to: 3

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17131
	goto	u17130

u17131:
	goto	l13243
u17130:
	line	400
	
l13233:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:is_numeric_field@sensor_type))^00h,c
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:is_numeric_field@flow_type))^00h,c
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u17141
	goto	u17140
u17141:
	goto	l13237
u17140:
	line	403
	
l13235:
	call	_menu_update_numeric_value	;wreg free
	line	404
	goto	l13255
	line	405
	
l13237:
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:is_time_field@sensor_type))^00h,c
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:is_time_field@flow_type))^00h,c
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u17151
	goto	u17150
u17151:
	goto	l13241
u17150:
	line	408
	
l13239:
	call	_menu_update_time_value	;wreg free
	line	409
	goto	l13255
	line	413
	
l13241:
	call	_menu_update_edit_value	;wreg free
	goto	l13255
	line	419
	
l13243:
	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17161
	goto	u17160
u17161:
	goto	l13247
u17160:
	line	421
	
l13245:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	422
	goto	l13255
	line	423
	
l13247:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17171
	goto	u17170

u17171:
	goto	l13251
u17170:
	line	425
	
l13249:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	line	426
	goto	l13255
	line	427
	
l13251:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17181
	goto	u17180

u17181:
	goto	l13255
u17180:
	line	429
	
l13253:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	435
	
l13255:
	movlb	0	; () banked
	movf	((main@last_button))&0ffh,w
	movlb	2	; () banked
xorwf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u17191
	goto	u17190

u17191:
	goto	l13331
u17190:
	line	437
	
l13257:; BSR set to: 2

	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u17201
	goto	u17200
u17201:
	goto	l13327
u17200:
	line	439
	
l13259:; BSR set to: 2

	movff	(_button_event),(main@current_event)	;volatile
	line	440
	
l13261:; BSR set to: 2

	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	443
	
l13263:; BSR set to: 2

		movlw	low(main@buf_687)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_687)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_30)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_30)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@current_event),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	444
	
l13265:
		movlw	low(main@buf_687)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_687)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	447
	
l13267:
		movlw	2
	movlb	0	; () banked
	xorwf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u17211
	goto	u17210

u17211:
	goto	l13303
u17210:
	line	449
	
l13269:; BSR set to: 0

		movlw	low(STR_31)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_31)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	452
	
l13271:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17221
	goto	u17220
u17221:
	goto	l13285
u17220:
	line	455
	
l13273:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	456
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	457
	movlw	low(0)
	movwf	(0+(_menu+08h))&0ffh
	line	461
	
l13275:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:_enable_edit_flag))^00h,c
	line	462
	
l13277:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:_sensor_edit_flag))^00h,c
	line	464
	
l13279:; BSR set to: 2

		movlw	low(STR_32)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_32)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	467
	
l13281:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17231
	goto	u17230

u17231:
	goto	l13327
u17230:
	line	468
	
l13283:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	goto	l13327
	line	474
	
l13285:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17241
	goto	u17240
u17241:
	goto	l13291
u17240:
	line	476
	
l13287:; BSR set to: 2

	setf	((_current_menu))&0ffh
	line	477
	
l13289:; BSR set to: 2

		movlw	low(STR_33)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_33)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	478
	goto	l13327
	line	479
	
l13291:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17251
	goto	u17250

u17251:
	goto	l13297
u17250:
	line	481
	
l13293:; BSR set to: 2

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	482
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	483
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	484
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	485
	
l13295:
	call	_menu_draw_setup	;wreg free
	line	486
	goto	l13327
	line	487
	
l13297:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17261
	goto	u17260

u17261:
	goto	l229
u17260:
	line	489
	
l13299:; BSR set to: 2

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	490
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	491
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	492
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	493
	
l13301:
	call	_menu_draw_options	;wreg free
	goto	l13327
	line	498
	
l13303:; BSR set to: 0

	movlb	2	; () banked
		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17271
	goto	u17270

u17271:
	goto	l13313
u17270:
	line	500
	
l13305:; BSR set to: 2

	movlb	0	; () banked
		decf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u17281
	goto	u17280

u17281:
	goto	l13327
u17280:
	line	502
	
l13307:; BSR set to: 0

	movlw	low(0)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	503
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	504
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	505
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	506
	
l13309:; BSR set to: 3

	call	_menu_draw_options	;wreg free
	line	507
	
l13311:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l13327
	line	513
	
l13313:; BSR set to: 2

	movlb	0	; () banked
	movf	((main@current_event))&0ffh,w
	
	call	_menu_handle_button
	line	516
	
l13315:
	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17291
	goto	u17290
u17291:
	goto	l13319
u17290:
	goto	l13301
	line	518
	
l13319:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17301
	goto	u17300

u17301:
	goto	l13323
u17300:
	goto	l13283
	line	520
	
l13323:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17311
	goto	u17310

u17311:
	goto	l229
u17310:
	goto	l13295
	line	522
	
l229:; BSR set to: 2

	line	524
	
l13327:
	movff	(_button_event),(main@last_button)	;volatile
	line	525
	
l13329:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	530
	
l13331:; BSR set to: 2

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17321
	goto	u17320

u17321:
	goto	l13347
u17320:
	
l13333:; BSR set to: 2

	movlb	1	; () banked
		incf	((main@last_menu_state))&0ffh,w
	btfsc	status,2
	goto	u17331
	goto	u17330

u17331:
	goto	l13347
u17330:
	line	533
	
l13335:; BSR set to: 1

	call	_lcd_clear	;wreg free
	line	534
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	535
	
l13337:
		movlw	low(STR_34)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_34)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	536
	
l13339:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	537
		movlw	low(STR_35)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_35)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	538
		movlw	low(STR_36)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_36)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	540
		movlw	low(STR_37)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_37)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	541
	
l13341:
	call	_save_current_config	;wreg free
	line	542
	
l13343:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	543
	
l13345:; BSR set to: 1

		movlw	low(STR_38)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_38)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	545
	
l13347:
	movff	(_current_menu),(main@last_menu_state)
	line	548
	
l13349:
	movlb	1	; () banked
	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfsc	status,2
	goto	u17341
	goto	u17340

u17341:
	goto	l13353
u17340:
	line	550
	
l13351:; BSR set to: 1

	decf	((main@encoder_activity_timer))&0ffh
	btfss	status,0
	decf	((main@encoder_activity_timer+1))&0ffh
	line	554
	
l13353:; BSR set to: 1

	movlw	low(01h)
	movlb	0	; () banked
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	555
	
l13355:; BSR set to: 0

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	iorwf	((main@blink_timer+1))&0ffh,w
	bnz	u17350
	movlw	10
	subwf	 ((main@blink_timer))&0ffh,w
	btfss	status,0
	goto	u17351
	goto	u17350

u17351:
	goto	l13389
u17350:
	line	557
	
l13357:; BSR set to: 0

	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	558
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17361
	goto	u17360
u17361:
	goto	l13387
u17360:
	line	561
	
l13359:; BSR set to: 3

	movlb	1	; () banked
	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfss	status,2
	goto	u17371
	goto	u17370

u17371:
	goto	l13389
u17370:
	line	563
	
l13361:; BSR set to: 1

	movlb	3	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u17381
	goto	u17380
u17381:
	movlw	1
	goto	u17390
u17380:
	movlw	0
u17390:
	movwf	(0+(_menu+05h))&0ffh
	line	567
	goto	l13385
	line	570
	
l13363:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	571
	goto	l13389
	line	575
	
l13365:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:is_numeric_field@sensor_type))^00h,c
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:is_numeric_field@flow_type))^00h,c
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u17401
	goto	u17400
u17401:
	goto	l13369
u17400:
	line	577
	
l13367:
	call	_menu_update_numeric_value	;wreg free
	line	578
	goto	l13389
	line	579
	
l13369:
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:is_time_field@sensor_type))^00h,c
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:is_time_field@flow_type))^00h,c
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u17411
	goto	u17410
u17411:
	goto	l13373
u17410:
	line	581
	
l13371:
	call	_menu_update_time_value	;wreg free
	line	582
	goto	l13389
	line	586
	
l13373:
	call	_menu_draw_input	;wreg free
	goto	l13389
	line	591
	
l13375:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	592
	goto	l13389
	line	594
	
l13377:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17421
	goto	u17420

u17421:
	goto	l13381
u17420:
	goto	l13371
	line	600
	
l13381:; BSR set to: 3

	call	_menu_draw_clock	;wreg free
	goto	l13389
	line	567
	
l13385:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l13363
	xorlw	1^0	; case 1
	skipnz
	goto	l13365
	xorlw	2^1	; case 2
	skipnz
	goto	l13375
	xorlw	3^2	; case 3
	skipnz
	goto	l13377
	goto	l13389

	line	608
	
l13387:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	622
	
l13389:
		movlw	03h-0
	movlb	2	; () banked
	cpfslt	((_current_menu))&0ffh
	goto	u17431
	goto	u17430

u17431:
	goto	l13423
u17430:
	line	624
	
l13391:; BSR set to: 2

	movlb	1	; () banked
	movf	((_menu_timeout_flag))&0ffh,w	;volatile
	btfss	status,2
	goto	u17441
	goto	u17440
u17441:
	goto	l13423
u17440:
	line	626
	
l13393:; BSR set to: 1

		movlw	low(STR_39)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_39)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	629
	
l13395:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	630
	
l13397:
	asmopt push
asmopt off
movlw  3
movwf	(??_main+0+0+1)^00h,c
movlw	8
movwf	(??_main+0+0)^00h,c
	movlw	119
u17507:
decfsz	wreg,f
	bra	u17507
	decfsz	(??_main+0+0)^00h,c,f
	bra	u17507
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u17507
	nop
asmopt pop

	line	631
	
l13399:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	634
	
l13401:
	movlb	2	; () banked
	setf	((_current_menu))&0ffh
	line	635
	
l13403:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	636
	
l13405:; BSR set to: 3

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	637
	
l13407:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	640
	
l13409:; BSR set to: 3

	call	_lcd_clear	;wreg free
	line	641
	
l13411:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	642
	
l13413:
		movlw	low(STR_40)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_40)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	643
	
l13415:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	644
	
l13417:
		movlw	low(STR_41)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_41)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	647
	
l13419:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	648
	
l13421:; BSR set to: 1

	movlw	high(0)
	movwf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_menu_timeout_timer))^00h,c	;volatile
	line	653
	
l13423:
	movlb	1	; () banked
	movf	((_long_press_beep_flag))&0ffh,w	;volatile
	btfsc	status,2
	goto	u17451
	goto	u17450
u17451:
	goto	l13431
u17450:
	line	655
	
l13425:; BSR set to: 1

	movlw	low(0)
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	line	656
	
l13427:; BSR set to: 1

	movlw	high(01F4h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01F4h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	657
	
l13429:
		movlw	low(STR_42)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_42)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	662
	
l13431:
	movlb	1	; () banked
	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u17461
	goto	u17460
u17461:
	goto	l13443
u17460:
	
l13433:; BSR set to: 1

	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u17471
	goto	u17470
u17471:
	goto	l13443
u17470:
	line	664
	
l13435:; BSR set to: 3

		movlw	low(STR_43)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_43)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	665
	
l13437:
	call	_save_current_config	;wreg free
	line	666
	
l13439:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	667
	
l13441:; BSR set to: 1

		movlw	low(STR_44)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_44)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	672
	
l13443:
	asmopt push
asmopt off
	movlw	133
u17517:
decfsz	wreg,f
	bra	u17517
	nop
asmopt pop

	goto	l13157
	global	start
	goto	start
	callstack 0
	line	674
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_uart_init

;; *************** function _uart_init *****************
;; Defined at:
;;		line 52 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/5
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
psect	text1,class=CODE,space=0,reloc=2,group=0
	line	52
global __ptext1
__ptext1:
psect	text1
	file	"src\main.c"
	line	52
	
_uart_init:
;incstack = 0
	callstack 28
	line	54
	
l8545:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	55
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	57
	
l8547:
	movlw	low(024h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	58
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	59
	movlw	low(08h)
	movwf	((c:4024))^0f00h,c	;volatile
	line	61
	movlw	low(044h)
	movwf	((c:4015))^0f00h,c	;volatile
	line	62
	movlw	low(0)
	movwf	((c:4016))^0f00h,c	;volatile
	line	63
	
l123:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
	signat	_uart_init,89
	global	_system_init

;; *************** function _system_init *****************
;; Defined at:
;;		line 88 in file "src\main.c"
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
	line	88
global __ptext2
__ptext2:
psect	text2
	file	"src\main.c"
	line	88
	
_system_init:
;incstack = 0
	callstack 28
	line	90
	
l8549:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	91
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	94
	
l141:
	line	93
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u9661
	goto	u9660
u9661:
	goto	l141
u9660:
	line	96
	
l8551:
	movlw	low(0Fh)
	movwf	((c:4033))^0f00h,c	;volatile
	line	98
	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	99
	movlw	low(0)
	movwf	((c:3978))^0f00h,c	;volatile
	line	100
	movlw	low(0)
	movwf	((c:3979))^0f00h,c	;volatile
	line	102
	
l8553:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	103
	
l8555:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	105
	
l8557:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	106
	
l8559:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	107
	
l8561:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	108
	
l8563:
	bsf	((c:3987))^0f00h,c,0	;volatile
	line	109
	
l8565:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	111
	
l8567:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	112
	
l8569:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	115
	
l8571:
	bcf	((c:3988))^0f00h,c,1	;volatile
	line	116
	
l8573:
	bsf	((c:3979))^0f00h,c,1	;volatile
	line	117
	
l144:
	return	;funcret
	callstack 0
GLOBAL	__end_of_system_init
	__end_of_system_init:
	signat	_system_init,89
	global	_rtc_set_time

;; *************** function _rtc_set_time *****************
;; Defined at:
;;		line 75 in file "src\rtc.c"
;; Parameters:    Size  Location     Type
;;  time            2   21[COMRAM] PTR struct .
;;		 -> main@set_time(7), 
;; Auto vars:     Size  Location     Type
;;  i               1   30[COMRAM] unsigned char 
;;  data            7   23[COMRAM] unsigned char [7]
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         8       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        10       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_dec_to_bcd
;;		_i2c_start
;;		_i2c_stop
;;		_i2c_write
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=0
	file	"src\rtc.c"
	line	75
global __ptext3
__ptext3:
psect	text3
	file	"src\rtc.c"
	line	75
	
_rtc_set_time:
;incstack = 0
	callstack 26
	line	80
	
l8643:; BSR set to: 1

	movff	(c:rtc_set_time@time),fsr2l
	movff	(c:rtc_set_time@time+1),fsr2h
	movf	indf2,w
	
	call	_dec_to_bcd
	movwf	((c:rtc_set_time@data))^00h,c
	line	81
	lfsr	2,01h
	movf	((c:rtc_set_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_set_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	indf2,w
	
	call	_dec_to_bcd
	movwf	(0+((c:rtc_set_time@data)+01h))^00h,c
	line	82
	lfsr	2,02h
	movf	((c:rtc_set_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_set_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	indf2,w
	
	call	_dec_to_bcd
	movwf	(0+((c:rtc_set_time@data)+02h))^00h,c
	line	83
	lfsr	2,03h
	movf	((c:rtc_set_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_set_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	indf2,w
	
	call	_dec_to_bcd
	movwf	(0+((c:rtc_set_time@data)+03h))^00h,c
	line	84
	lfsr	2,04h
	movf	((c:rtc_set_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_set_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	indf2,w
	
	call	_dec_to_bcd
	movwf	(0+((c:rtc_set_time@data)+04h))^00h,c
	line	85
	lfsr	2,05h
	movf	((c:rtc_set_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_set_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	indf2,w
	
	call	_dec_to_bcd
	movwf	(0+((c:rtc_set_time@data)+05h))^00h,c
	line	86
	lfsr	2,06h
	movf	((c:rtc_set_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_set_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	indf2,w
	
	call	_dec_to_bcd
	movwf	(0+((c:rtc_set_time@data)+06h))^00h,c
	line	89
	
l8645:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u9741
	goto	u9740
u9741:
	goto	l8651
u9740:
	line	90
	
l8647:
	movlw	(01h)&0ffh
	goto	l1525
	line	91
	
l8651:
	asmopt push
asmopt off
	movlw	133
u17527:
decfsz	wreg,f
	bra	u17527
	nop
asmopt pop

	line	93
	
l8653:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9751
	goto	u9750
u9751:
	goto	l8659
u9750:
	goto	l8647
	line	95
	
l8659:
	asmopt push
asmopt off
	movlw	133
u17537:
decfsz	wreg,f
	bra	u17537
	nop
asmopt pop

	line	97
	
l8661:
	movlw	(0)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9761
	goto	u9760
u9761:
	goto	l8667
u9760:
	goto	l8647
	line	99
	
l8667:
	asmopt push
asmopt off
	movlw	133
u17547:
decfsz	wreg,f
	bra	u17547
	nop
asmopt pop

	line	101
	
l8669:
	movlw	low(0)
	movwf	((c:rtc_set_time@i))^00h,c
	line	103
	
l8675:
	movf	((c:rtc_set_time@i))^00h,c,w
	addlw	low(rtc_set_time@data)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9771
	goto	u9770
u9771:
	goto	l8681
u9770:
	goto	l8647
	line	105
	
l8681:
	asmopt push
asmopt off
	movlw	133
u17557:
decfsz	wreg,f
	bra	u17557
	nop
asmopt pop

	line	101
	
l8683:
	incf	((c:rtc_set_time@i))^00h,c
		movlw	07h-1
	cpfsgt	((c:rtc_set_time@i))^00h,c
	goto	u9781
	goto	u9780

u9781:
	goto	l8675
u9780:
	line	108
	
l8685:
	call	_i2c_stop	;wreg free
	line	109
	
l8687:
	asmopt push
asmopt off
	movlw	228
u17567:
	nop2
	nop2
decfsz	wreg,f
	bra	u17567
	nop2
	nop2
asmopt pop

	line	110
	
l8689:
	movlw	(0)&0ffh
	line	111
	
l1525:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rtc_set_time
	__end_of_rtc_set_time:
	signat	_rtc_set_time,4217
	global	_dec_to_bcd

;; *************** function _dec_to_bcd *****************
;; Defined at:
;;		line 69 in file "src\rtc.c"
;; Parameters:    Size  Location     Type
;;  dec             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  dec             1   20[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		___lbdiv
;;		___lbmod
;; This function is called by:
;;		_rtc_set_time
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	69
global __ptext4
__ptext4:
psect	text4
	file	"src\rtc.c"
	line	69
	
_dec_to_bcd:
;incstack = 0
	callstack 26
	movwf	((c:dec_to_bcd@dec))^00h,c
	line	71
	
l8541:
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movf	((c:dec_to_bcd@dec))^00h,c,w
	
	call	___lbmod
	movwf	(??_dec_to_bcd+0+0)^00h,c
	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	((c:dec_to_bcd@dec))^00h,c,w
	
	call	___lbdiv
	movwf	(??_dec_to_bcd+1+0)^00h,c
	swapf	((??_dec_to_bcd+1+0))^00h,c,w
	andlw	(0ffh shl 4) & 0ffh
	iorwf	((??_dec_to_bcd+0+0))^00h,c,w
	line	72
	
l1521:
	return	;funcret
	callstack 0
GLOBAL	__end_of_dec_to_bcd
	__end_of_dec_to_bcd:
	signat	_dec_to_bcd,4217
	global	_rtc_read_time

;; *************** function _rtc_read_time *****************
;; Defined at:
;;		line 114 in file "src\rtc.c"
;; Parameters:    Size  Location     Type
;;  time            2   64[COMRAM] PTR struct .
;;		 -> main@current_time(7), 
;; Auto vars:     Size  Location     Type
;;  i               1   87[BANK0 ] unsigned char 
;;  debug_buf      80    0[BANK0 ] unsigned char [80]
;;  data            7   80[BANK0 ] unsigned char [7]
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      88       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2      88       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       90 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_bcd_to_dec
;;		_i2c_read
;;		_i2c_start
;;		_i2c_stop
;;		_i2c_write
;;		_sprintf
;;		_uart_println
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	114
global __ptext5
__ptext5:
psect	text5
	file	"src\rtc.c"
	line	114
	
_rtc_read_time:
;incstack = 0
	callstack 25
	line	119
	
l11989:; BSR set to: 1

	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u14891
	goto	u14890
u14891:
	goto	l11995
u14890:
	line	120
	
l11991:
	movlw	(01h)&0ffh
	goto	l1534
	line	121
	
l11995:
	asmopt push
asmopt off
	movlw	133
u17577:
decfsz	wreg,f
	bra	u17577
	nop
asmopt pop

	line	123
	
l11997:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u14901
	goto	u14900
u14901:
	goto	l12003
u14900:
	goto	l11991
	line	125
	
l12003:
	asmopt push
asmopt off
	movlw	133
u17587:
decfsz	wreg,f
	bra	u17587
	nop
asmopt pop

	line	127
	
l12005:
	movlw	(0)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u14911
	goto	u14910
u14911:
	goto	l12011
u14910:
	goto	l11991
	line	129
	
l12011:
	asmopt push
asmopt off
	movlw	133
u17597:
decfsz	wreg,f
	bra	u17597
	nop
asmopt pop

	line	131
	
l12013:
	call	_i2c_stop	;wreg free
	line	132
	
l12015:
	asmopt push
asmopt off
	movlw	228
u17607:
	nop2
	nop2
decfsz	wreg,f
	bra	u17607
	nop2
	nop2
asmopt pop

	line	135
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u14921
	goto	u14920
u14921:
	goto	l12021
u14920:
	goto	l11991
	line	137
	
l12021:
	asmopt push
asmopt off
	movlw	133
u17617:
decfsz	wreg,f
	bra	u17617
	nop
asmopt pop

	line	139
	
l12023:
	movlw	(0D1h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u14931
	goto	u14930
u14931:
	goto	l12029
u14930:
	goto	l11991
	line	141
	
l12029:
	asmopt push
asmopt off
	movlw	133
u17627:
decfsz	wreg,f
	bra	u17627
	nop
asmopt pop

	line	143
	
l12031:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((rtc_read_time@i))&0ffh
	line	145
	
l12037:; BSR set to: 0

	movf	((rtc_read_time@i))&0ffh,w
	addlw	low(rtc_read_time@data)
	movwf	fsr2l
	clrf	fsr2h
	movlw	(01h)&0ffh
	
	call	_i2c_read
	movwf	indf2,c

	line	143
	
l12039:
	movlb	0	; () banked
	incf	((rtc_read_time@i))&0ffh
	
l12041:; BSR set to: 0

		movlw	06h-1
	cpfsgt	((rtc_read_time@i))&0ffh
	goto	u14941
	goto	u14940

u14941:
	goto	l12037
u14940:
	line	147
	
l12043:; BSR set to: 0

	movlw	(0)&0ffh
	
	call	_i2c_read
	movlb	0	; () banked
	movwf	(0+(rtc_read_time@data+06h))&0ffh
	line	148
	call	_i2c_stop	;wreg free
	line	153
	
l12045:
		movlw	low(rtc_read_time@debug_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_281)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_281)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(rtc_read_time@data),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(rtc_read_time@data+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(rtc_read_time@data+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(rtc_read_time@data+03h),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	movff	0+(rtc_read_time@data+04h),0+((c:?_sprintf)+0Ch)
	clrf	(1+((c:?_sprintf)+0Ch))^00h,c
	movff	0+(rtc_read_time@data+05h),0+((c:?_sprintf)+0Eh)
	clrf	(1+((c:?_sprintf)+0Eh))^00h,c
	movff	0+(rtc_read_time@data+06h),0+((c:?_sprintf)+010h)
	clrf	(1+((c:?_sprintf)+010h))^00h,c
	call	_sprintf	;wreg free
	line	154
	
l12047:
		movlw	low(rtc_read_time@debug_buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	157
	movlb	0	; () banked
	movf	((rtc_read_time@data))&0ffh,w
	andlw	low(07Fh)
	
	call	_bcd_to_dec
	movff	(c:rtc_read_time@time),fsr2l
	movff	(c:rtc_read_time@time+1),fsr2h
	movwf	indf2,c

	line	158
	lfsr	2,01h
	movf	((c:rtc_read_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_read_time@time+1))^00h,c,w
	addwfc	fsr2h
	movlb	0	; () banked
	movf	(0+(rtc_read_time@data+01h))&0ffh,w
	andlw	low(07Fh)
	
	call	_bcd_to_dec
	movwf	indf2,c

	line	159
	lfsr	2,02h
	movf	((c:rtc_read_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_read_time@time+1))^00h,c,w
	addwfc	fsr2h
	movlb	0	; () banked
	movf	(0+(rtc_read_time@data+02h))&0ffh,w
	andlw	low(03Fh)
	
	call	_bcd_to_dec
	movwf	indf2,c

	line	160
	lfsr	2,03h
	movf	((c:rtc_read_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_read_time@time+1))^00h,c,w
	addwfc	fsr2h
	movlb	0	; () banked
	movf	(0+(rtc_read_time@data+03h))&0ffh,w
	andlw	low(07h)
	
	call	_bcd_to_dec
	movwf	indf2,c

	line	161
	lfsr	2,04h
	movf	((c:rtc_read_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_read_time@time+1))^00h,c,w
	addwfc	fsr2h
	movlb	0	; () banked
	movf	(0+(rtc_read_time@data+04h))&0ffh,w
	andlw	low(03Fh)
	
	call	_bcd_to_dec
	movwf	indf2,c

	line	162
	lfsr	2,05h
	movf	((c:rtc_read_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_read_time@time+1))^00h,c,w
	addwfc	fsr2h
	movlb	0	; () banked
	movf	(0+(rtc_read_time@data+05h))&0ffh,w
	andlw	low(01Fh)
	
	call	_bcd_to_dec
	movwf	indf2,c

	line	163
	lfsr	2,06h
	movf	((c:rtc_read_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_read_time@time+1))^00h,c,w
	addwfc	fsr2h
	movlb	0	; () banked
	movf	(0+(rtc_read_time@data+06h))&0ffh,w
	
	call	_bcd_to_dec
	movwf	indf2,c

	line	165
	
l12049:
	movlw	(0)&0ffh
	line	166
	
l1534:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rtc_read_time
	__end_of_rtc_read_time:
	signat	_rtc_read_time,4217
	global	_bcd_to_dec

;; *************** function _bcd_to_dec *****************
;; Defined at:
;;		line 63 in file "src\rtc.c"
;; Parameters:    Size  Location     Type
;;  bcd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bcd             1   15[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : 3F/0
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
;;		Nothing
;; This function is called by:
;;		_rtc_read_time
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	63
global __ptext6
__ptext6:
psect	text6
	file	"src\rtc.c"
	line	63
	
_bcd_to_dec:
;incstack = 0
	callstack 27
	movwf	((c:bcd_to_dec@bcd))^00h,c
	line	65
	
l8537:
	movff	(c:bcd_to_dec@bcd),??_bcd_to_dec+0+0
	movlw	0Fh
	andwf	(??_bcd_to_dec+0+0)^00h,c
	swapf	((c:bcd_to_dec@bcd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	mullw	0Ah
	movf	(prodl)^0f00h,c,w
	addwf	(??_bcd_to_dec+0+0)^00h,c,w
	line	66
	
l1518:
	return	;funcret
	callstack 0
GLOBAL	__end_of_bcd_to_dec
	__end_of_bcd_to_dec:
	signat	_bcd_to_dec,4217
	global	_rtc_init

;; *************** function _rtc_init *****************
;; Defined at:
;;		line 43 in file "src\rtc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/5
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_rtc_write_register
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	43
global __ptext7
__ptext7:
psect	text7
	file	"src\rtc.c"
	line	43
	
_rtc_init:
;incstack = 0
	callstack 25
	line	47
	
l8631:
	asmopt push
asmopt off
movlw  21
movwf	(??_rtc_init+0+0+1)^00h,c
movlw	75
movwf	(??_rtc_init+0+0)^00h,c
	movlw	190
u17637:
decfsz	wreg,f
	bra	u17637
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u17637
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u17637
	nop2
asmopt pop

	line	48
	asmopt push
asmopt off
movlw  21
movwf	(??_rtc_init+0+0+1)^00h,c
movlw	75
movwf	(??_rtc_init+0+0)^00h,c
	movlw	190
u17647:
decfsz	wreg,f
	bra	u17647
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u17647
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u17647
	nop2
asmopt pop

	line	49
	asmopt push
asmopt off
movlw  21
movwf	(??_rtc_init+0+0+1)^00h,c
movlw	75
movwf	(??_rtc_init+0+0)^00h,c
	movlw	190
u17657:
decfsz	wreg,f
	bra	u17657
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u17657
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u17657
	nop2
asmopt pop

	line	50
	asmopt push
asmopt off
movlw  21
movwf	(??_rtc_init+0+0+1)^00h,c
movlw	75
movwf	(??_rtc_init+0+0)^00h,c
	movlw	190
u17667:
decfsz	wreg,f
	bra	u17667
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u17667
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u17667
	nop2
asmopt pop

	line	54
	
l8633:
	movlw	low(0)
	movwf	((c:rtc_write_register@value))^00h,c
	movlw	(0Eh)&0ffh
	
	call	_rtc_write_register
	iorlw	0
	btfsc	status,2
	goto	u9731
	goto	u9730
u9731:
	goto	l8639
u9730:
	line	56
	
l8635:
	movlw	(01h)&0ffh
	goto	l1515
	line	59
	
l8639:
	movlw	(0)&0ffh
	line	60
	
l1515:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rtc_init
	__end_of_rtc_init:
	signat	_rtc_init,89
	global	_rtc_write_register

;; *************** function _rtc_write_register *****************
;; Defined at:
;;		line 9 in file "src\rtc.c"
;; Parameters:    Size  Location     Type
;;  reg             1    wreg     unsigned char 
;;  value           1   19[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg             1   20[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/5
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_i2c_start
;;		_i2c_stop
;;		_i2c_write
;; This function is called by:
;;		_rtc_init
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2,group=0
	line	9
global __ptext8
__ptext8:
psect	text8
	file	"src\rtc.c"
	line	9
	
_rtc_write_register:
;incstack = 0
	callstack 25
	movwf	((c:rtc_write_register@reg))^00h,c
	line	11
	
l8507:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u9621
	goto	u9620
u9621:
	goto	l8513
u9620:
	line	12
	
l8509:
	movlw	(01h)&0ffh
	goto	l1500
	line	13
	
l8513:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9631
	goto	u9630
u9631:
	goto	l8519
u9630:
	goto	l8509
	line	15
	
l8519:
	movf	((c:rtc_write_register@reg))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9641
	goto	u9640
u9641:
	goto	l8525
u9640:
	goto	l8509
	line	17
	
l8525:
	movf	((c:rtc_write_register@value))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9651
	goto	u9650
u9651:
	goto	l8531
u9650:
	goto	l8509
	line	19
	
l8531:
	call	_i2c_stop	;wreg free
	line	20
	
l8533:
	movlw	(0)&0ffh
	line	21
	
l1500:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rtc_write_register
	__end_of_rtc_write_register:
	signat	_rtc_write_register,8313
	global	_menu_update_numeric_value

;; *************** function _menu_update_numeric_value *****************
;; Defined at:
;;		line 1007 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  value_buf       6   41[COMRAM] unsigned char [6]
;;  screen_line     1   48[COMRAM] unsigned char 
;;  start_col       1   47[COMRAM] unsigned char 
;;  flow_type       1   22[COMRAM] unsigned char 
;;  sensor_type     1   21[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        28       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        28       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       28 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_is_numeric_field
;;		_lcd_print
;;		_lcd_set_cursor
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text9,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1007
global __ptext9
__ptext9:
psect	text9
	file	"src\menu.c"
	line	1007
	
_menu_update_numeric_value:
;incstack = 0
	callstack 25
	line	1010
	
l12229:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15331
	goto	u15330

u15331:
	goto	l815
u15330:
	
l12231:; BSR set to: 2

	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u15341
	goto	u15340
u15341:
	goto	l12233
u15340:
	goto	l815
	line	1014
	
l12233:; BSR set to: 3

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((c:menu_update_numeric_value@screen_line))^00h,c
	line	1015
		movlw	03h-1
	cpfsgt	((c:menu_update_numeric_value@screen_line))^00h,c
	goto	u15351
	goto	u15350

u15351:
	goto	l12237
u15350:
	goto	l815
	line	1020
	
l12237:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:menu_update_numeric_value@sensor_type))^00h,c
	line	1021
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:menu_update_numeric_value@flow_type))^00h,c
	line	1024
	
l12239:; BSR set to: 2

	movff	(c:menu_update_numeric_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(c:menu_update_numeric_value@flow_type),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u15361
	goto	u15360
u15361:
	goto	l12243
u15360:
	goto	l815
	line	1028
	
l12243:
	lfsr	2,(menu_update_numeric_value@value_buf)
	movlw	6-1
u15371:
	clrf	postinc2
	decf	wreg
	bc	u15371
	line	1030
	
l12245:
	movlb	3	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u15381
	goto	u15380
u15381:
	goto	l12277
u15380:
	line	1033
	
l12247:; BSR set to: 3

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u15391
	goto	u15390

u15391:
	goto	l12251
u15390:
	
l12249:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u15401
	goto	u15400
u15401:
	goto	l12253
u15400:
	
l12251:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1360))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1360))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1360))^00h,c
	goto	l12255
	
l12253:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1360+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1360))^00h,c
	
l12255:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1360),(c:menu_update_numeric_value@value_buf)
	line	1034
	
l12257:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u15411
	goto	u15410

u15411:
	goto	l12261
u15410:
	
l12259:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u15421
	goto	u15420
u15421:
	goto	l12263
u15420:
	
l12261:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1361))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1361))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1361))^00h,c
	goto	l12265
	
l12263:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1361+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1361))^00h,c
	
l12265:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1361),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1035
	
l12267:; BSR set to: 3

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u15431
	goto	u15430

u15431:
	goto	l12271
u15430:
	
l12269:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u15441
	goto	u15440
u15441:
	goto	l12273
u15440:
	
l12271:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1362))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1362))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1362))^00h,c
	goto	l12275
	
l12273:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1362+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1362))^00h,c
	
l12275:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1362),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1036
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+03h))^00h,c
	line	1037
	goto	l841
	line	1041
	
l12277:; BSR set to: 3

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u15451
	goto	u15450
u15451:
	goto	l12281
u15450:
	
l12279:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u15461
	goto	u15460
u15461:
	goto	l12289
u15460:
	
l12281:; BSR set to: 3

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u15471
	goto	u15470
u15471:
	goto	l12285
u15470:
	
l12283:; BSR set to: 3

	movlw	high(02Bh)
	movwf	((c:_menu_update_numeric_value$1364+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_menu_update_numeric_value$1364))^00h,c
	goto	l12287
	
l12285:; BSR set to: 3

	movlw	high(02Dh)
	movwf	((c:_menu_update_numeric_value$1364+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_menu_update_numeric_value$1364))^00h,c
	
l12287:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1364),(c:_menu_update_numeric_value$1363)
	movff	(c:_menu_update_numeric_value$1364+1),(c:_menu_update_numeric_value$1363+1)
	goto	l12291
	
l12289:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1363+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1363))^00h,c
	
l12291:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1363),(c:menu_update_numeric_value@value_buf)
	line	1042
	
l12293:; BSR set to: 3

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u15481
	goto	u15480

u15481:
	goto	l12297
u15480:
	
l12295:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u15491
	goto	u15490
u15491:
	goto	l12299
u15490:
	
l12297:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1365))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1365))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1365))^00h,c
	goto	l12301
	
l12299:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1365+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1365))^00h,c
	
l12301:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1365),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1043
	
l12303:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u15501
	goto	u15500

u15501:
	goto	l12307
u15500:
	
l12305:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u15511
	goto	u15510
u15511:
	goto	l12309
u15510:
	
l12307:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1366))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1366))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1366))^00h,c
	goto	l12311
	
l12309:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1366+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1366))^00h,c
	
l12311:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1366),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1044
	
l12313:; BSR set to: 3

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u15521
	goto	u15520

u15521:
	goto	l12317
u15520:
	
l12315:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u15531
	goto	u15530
u15531:
	goto	l12319
u15530:
	
l12317:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1367))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1367))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1367))^00h,c
	goto	l12321
	
l12319:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1367+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1367))^00h,c
	
l12321:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1367),0+((c:menu_update_numeric_value@value_buf)+03h)
	line	1045
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+04h))^00h,c
	line	1046
	
l841:; BSR set to: 3

	line	1049
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u15541
	goto	u15540
u15541:
	goto	l12325
u15540:
	
l12323:; BSR set to: 3

	movlw	high(0Eh)
	movwf	((c:_menu_update_numeric_value$1369+1))^00h,c
	movlw	low(0Eh)
	movwf	((c:_menu_update_numeric_value$1369))^00h,c
	goto	l12327
	
l12325:; BSR set to: 3

	movlw	high(0Fh)
	movwf	((c:_menu_update_numeric_value$1369+1))^00h,c
	movlw	low(0Fh)
	movwf	((c:_menu_update_numeric_value$1369))^00h,c
	
l12327:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1369),(c:menu_update_numeric_value@start_col)
	line	1051
	
l12329:; BSR set to: 3

	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1052
	
l12331:
		movlw	low(STR_199)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_199)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1054
	
l12333:
	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1055
	
l12335:
		movlw	low(STR_200)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_200)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1056
	
l12337:
		movlw	low(menu_update_numeric_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1057
	
l12339:
		movlw	low(STR_201)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_201)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1058
	
l815:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_numeric_value
	__end_of_menu_update_numeric_value:
	signat	_menu_update_numeric_value,89
	global	_menu_update_edit_value

;; *************** function _menu_update_edit_value *****************
;; Defined at:
;;		line 943 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  blink_pos       1   27[BANK0 ] unsigned char 
;;  value_buf      10   10[BANK0 ] unsigned char [10]
;;  display_buf    10    0[BANK0 ] unsigned char [10]
;;  screen_line     1   28[BANK0 ] unsigned char 
;;  start_col       1   26[BANK0 ] unsigned char 
;;  flow_type       1   21[BANK0 ] unsigned char 
;;  sensor_type     1   20[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      29       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2      29       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       31 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_is_numeric_field
;;		_lcd_print
;;		_lcd_set_cursor
;;		_sprintf
;;		_strcpy
;;		_strlen
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2,group=0
	line	943
global __ptext10
__ptext10:
psect	text10
	file	"src\menu.c"
	line	943
	
_menu_update_edit_value:
;incstack = 0
	callstack 25
	line	947
	
l12341:
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@sensor_type))&0ffh
	line	948
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@flow_type))&0ffh
	line	951
	
l12343:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15551
	goto	u15550
u15551:
	goto	l793
u15550:
	
l12345:; BSR set to: 3

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u15561
	goto	u15560

u15561:
	goto	l12347
u15560:
	goto	l793
	line	955
	
l12347:; BSR set to: 2

	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@screen_line))&0ffh
	line	956
		movlw	03h-1
	cpfsgt	((menu_update_edit_value@screen_line))&0ffh
	goto	u15571
	goto	u15570

u15571:
	goto	l12351
u15570:
	goto	l793
	line	960
	
l12351:; BSR set to: 0

	movff	(menu_update_edit_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_update_edit_value@flow_type),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u15581
	goto	u15580
u15581:
	goto	l12355
u15580:
	goto	l793
	line	965
	
l12355:
	movlb	3	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u15591
	goto	u15590
u15591:
	goto	l12359
u15590:
	line	967
	
l12357:; BSR set to: 3

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_194)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_194)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+0Ah),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	968
	goto	l12367
	line	973
	
l12359:; BSR set to: 3

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u15601
	goto	u15600
u15601:
	goto	l12363
u15600:
	
l12361:; BSR set to: 3

	movlw	high(02Bh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1345+1))&0ffh
	movlw	low(02Bh)
	movwf	((_menu_update_edit_value$1345))&0ffh
	goto	l12365
	
l12363:; BSR set to: 3

	movlw	high(02Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1345+1))&0ffh
	movlw	low(02Dh)
	movwf	((_menu_update_edit_value$1345))&0ffh
	
l12365:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_195)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_195)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu_update_edit_value$1345),0+((c:?_sprintf)+04h)
	movff	(_menu_update_edit_value$1345+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+0Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	call	_sprintf	;wreg free
	line	978
	
l12367:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@from))^00h,c
	clrf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	980
	
l12369:
	movlb	3	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u15611
	goto	u15610
u15611:
	goto	l12379
u15610:
	line	983
	
l12371:; BSR set to: 3

	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u15621
	goto	u15620
u15621:
	goto	l803
u15620:
	line	984
	
l12373:; BSR set to: 3

	decf	(0+(_menu+08h))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@blink_pos))&0ffh
	goto	l12375
	line	985
	
l803:; BSR set to: 3

	line	986
	movff	0+(_menu+08h),(menu_update_edit_value@blink_pos)
	line	988
	
l12375:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movlb	0	; () banked
	movf	((menu_update_edit_value@blink_pos))&0ffh,w
	movwf	(??_menu_update_edit_value+0+0)^00h,c
	clrf	(??_menu_update_edit_value+0+0+1)^00h,c

		movf	(0+?_strlen)^00h,c,w
	subwf	(??_menu_update_edit_value+0+0)^00h,c,w
	movf	(1+?_strlen)^00h,c,w
	subwfb	(??_menu_update_edit_value+0+1)^00h,c,w
	btfsc	status,0
	goto	u15631
	goto	u15630

u15631:
	goto	l12379
u15630:
	line	989
	
l12377:; BSR set to: 0

	movf	((menu_update_edit_value@blink_pos))&0ffh,w
	addlw	low(menu_update_edit_value@display_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	993
	
l12379:
	movlb	3	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u15641
	goto	u15640
u15641:
	goto	l12383
u15640:
	
l12381:; BSR set to: 3

	movlw	high(0Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1349+1))&0ffh
	movlw	low(0Dh)
	movwf	((_menu_update_edit_value$1349))&0ffh
	goto	l12385
	
l12383:; BSR set to: 3

	movlw	high(0Eh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1349+1))&0ffh
	movlw	low(0Eh)
	movwf	((_menu_update_edit_value$1349))&0ffh
	
l12385:; BSR set to: 0

	movff	(_menu_update_edit_value$1349),(menu_update_edit_value@start_col)
	line	994
	
l12387:; BSR set to: 0

	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	995
	
l12389:
		movlw	low(STR_196)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_196)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	997
	
l12391:
	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	movlb	0	; () banked
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	998
	
l12393:
		movlw	low(STR_197)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_197)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	999
	
l12395:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1000
	
l12397:
		movlw	low(STR_198)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_198)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1001
	
l793:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_edit_value
	__end_of_menu_update_edit_value:
	signat	_menu_update_edit_value,89
	global	_menu_init

;; *************** function _menu_init *****************
;; Defined at:
;;		line 628 in file "src\menu.c"
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
;;		On exit  : 3F/3
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
psect	text11,class=CODE,space=0,reloc=2,group=0
	line	628
global __ptext11
__ptext11:
psect	text11
	file	"src\menu.c"
	line	628
	
_menu_init:
;incstack = 0
	callstack 28
	line	630
	
l8767:
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	631
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	632
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	633
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	634
	movlw	low(0)
	movwf	(0+(_menu+05h))&0ffh
	line	635
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	636
	
l640:; BSR set to: 3

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_init
	__end_of_menu_init:
	signat	_menu_init,89
	global	_menu_handle_encoder

;; *************** function _menu_handle_encoder *****************
;; Defined at:
;;		line 1439 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  delta           2   69[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;  edit_flag       2  160[BANK1 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> NULL(0), sensor_edit_flag(1), enable_edit_flag(1), 
;;  opts            2  154[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  buf            50  100[BANK1 ] unsigned char [50]
;;  clock_flag      2  162[BANK1 ] PTR unsigned char 
;;		 -> display_edit_flag(1), relay_high_edit_flag(1), NULL(0), enable_edit_flag(1), 
;;  clock_opts      2  158[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  flow_type       1  157[BANK1 ] unsigned char 
;;  sensor_type     1  156[BANK1 ] unsigned char 
;;  buf            50   50[BANK1 ] unsigned char [50]
;;  buf            50    0[BANK1 ] unsigned char [50]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/3
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0     164       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         8       0     164       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      172 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 8
;; This function calls:
;;		_get_item_options_for_field
;;		_get_option_edit_flag
;;		_handle_numeric_rotation
;;		_handle_time_rotation
;;		_is_numeric_field
;;		_is_option_field
;;		_is_time_field
;;		_menu_draw_clock
;;		_menu_draw_input
;;		_menu_draw_options
;;		_menu_draw_setup
;;		_menu_update_time_value
;;		_sprintf
;;		_strcpy
;;		_uart_println
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2,group=0
	line	1439
global __ptext12
__ptext12:
psect	text12
	file	"src\menu.c"
	line	1439
	
_menu_handle_encoder:; BSR set to: 3

;incstack = 0
	callstack 22
	line	1444
	
l12053:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u14951
	goto	u14950
u14951:
	goto	l12175
u14950:
	line	1446
	
l12055:; BSR set to: 3

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u14961
	goto	u14960

u14961:
	goto	l1013
u14960:
	line	1449
	
l12057:; BSR set to: 3

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14971
	goto	u14970

u14971:
	goto	l12119
u14970:
	line	1452
	
l12059:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_245)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_245)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(c:menu_handle_encoder@delta),0+((c:?_sprintf)+06h)
	movff	(c:menu_handle_encoder@delta+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1453
	
l12061:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1456
	
l12063:
		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14981
	goto	u14980

u14981:
	goto	l12069
u14980:
	line	1459
	
l12065:; BSR set to: 3

	movf	((c:menu_handle_encoder@delta))^00h,c,w
	
	call	_handle_time_rotation
	line	1460
	call	_menu_update_time_value	;wreg free
	goto	l1013
	line	1461
	
l12067:
	goto	l1013
	line	1464
	
l12069:; BSR set to: 3

		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1465
		movlw	low(0)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1467
	
l12071:; BSR set to: 1

	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14991
	goto	u14990
u14991:
	goto	l12075
u14990:
	line	1469
	
l12073:; BSR set to: 3

		movlw	low(_menu_item_options)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1470
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1471
	goto	l1015
	line	1472
	
l12075:; BSR set to: 3

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15001
	goto	u15000

u15001:
	goto	l12079
u15000:
	line	1474
	
l12077:; BSR set to: 3

		movlw	low(_menu_item_options+048h)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1475
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1476
	goto	l1015
	line	1477
	
l12079:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15011
	goto	u15010

u15011:
	goto	l1015
u15010:
	line	1479
	
l12081:; BSR set to: 3

		movlw	low(_menu_item_options+03Ch)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1480
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1483
	
l1015:
	movlb	1	; () banked
	movf	((menu_handle_encoder@clock_opts))&0ffh,w
iorwf	((menu_handle_encoder@clock_opts+1))&0ffh,w
	btfsc	status,2
	goto	u15021
	goto	u15020

u15021:
	goto	l1013
u15020:
	
l12083:; BSR set to: 1

	movf	((menu_handle_encoder@clock_flag))&0ffh,w
iorwf	((menu_handle_encoder@clock_flag+1))&0ffh,w
	btfsc	status,2
	goto	u15031
	goto	u15030

u15031:
	goto	l1013
u15030:
	line	1485
	
l12085:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_246)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_246)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movf	((??_menu_handle_encoder+0+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1486
	
l12087:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1488
	
l12089:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u15041
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u15040
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u15041
	goto	u15040

u15041:
	goto	l12097
u15040:
	line	1490
	
l12091:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	incf	indf2

	line	1491
	
l12093:
	movlw	01h
	movlb	1	; () banked
	addwf	((menu_handle_encoder@clock_opts))&0ffh,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movlw	0
	addwfc	((menu_handle_encoder@clock_opts+1))&0ffh,w
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
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
		tblrd	*+
	movf	tablat,w
	subwf	postinc2,w
	btfss	status,0
	goto	u15051
	goto	u15050

u15051:
	goto	l12105
u15050:
	line	1492
	
l12095:; BSR set to: 1

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	goto	l12105
	line	1494
	
l12097:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u15060
	goto	u15061

u15061:
	goto	l12105
u15060:
	line	1496
	
l12099:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u15071
	goto	u15070
u15071:
	goto	l12103
u15070:
	line	1497
	
l12101:
	movlw	01h
	movlb	1	; () banked
	addwf	((menu_handle_encoder@clock_opts))&0ffh,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movlw	0
	addwfc	((menu_handle_encoder@clock_opts+1))&0ffh,w
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
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movwf	indf2,c

	goto	l12105
	line	1499
	
l12103:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	decf	indf2

	line	1503
	
l12105:
	movlw	01h
	movlb	1	; () banked
	addwf	((menu_handle_encoder@clock_opts))&0ffh,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movlw	0
	addwfc	((menu_handle_encoder@clock_opts+1))&0ffh,w
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
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
		tblrd	*+
	movf	tablat,w
	subwf	postinc2,w
	btfss	status,0
	goto	u15081
	goto	u15080

u15081:
	goto	l12109
u15080:
	line	1504
	
l12107:; BSR set to: 1

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	line	1506
	
l12109:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_247)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_247)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movf	((??_menu_handle_encoder+0+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_encoder+1+0)^00h,c
	movf	((??_menu_handle_encoder+1+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_handle_encoder+2+0
	movff	prodh,??_menu_handle_encoder+2+0+1
	movf	(??_menu_handle_encoder+2+0)^00h,c,w
	addwf	((menu_handle_encoder@clock_opts))&0ffh,w
	movwf	(??_menu_handle_encoder+4+0)^00h,c
	movf	(??_menu_handle_encoder+2+1)^00h,c,w
	addwfc	((menu_handle_encoder@clock_opts+1))&0ffh,w
	movwf	1+(??_menu_handle_encoder+4+0)^00h,c
	movlw	02h
	addwf	(??_menu_handle_encoder+4+0)^00h,c
	movlw	0
	addwfc	(??_menu_handle_encoder+4+1)^00h,c
	movff	??_menu_handle_encoder+4+0,tblptrl
	movff	??_menu_handle_encoder+4+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd*+
	
	movff	tablat,0+((c:?_sprintf)+06h)
	tblrd*-
	
	movff	tablat,1+((c:?_sprintf)+06h)

	call	_sprintf	;wreg free
	line	1507
	
l12111:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1510
	
l12113:
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	mullw	05h
	movlw	low(_clock_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_clock_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strcpy@to)
	movff	postdec2,(c:strcpy@to+1)
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movf	((??_menu_handle_encoder+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_handle_encoder+1+0
	movff	prodh,??_menu_handle_encoder+1+0+1
	movf	(??_menu_handle_encoder+1+0)^00h,c,w
	movlb	1	; () banked
	addwf	((menu_handle_encoder@clock_opts))&0ffh,w
	movwf	(??_menu_handle_encoder+3+0)^00h,c
	movf	(??_menu_handle_encoder+1+1)^00h,c,w
	addwfc	((menu_handle_encoder@clock_opts+1))&0ffh,w
	movwf	1+(??_menu_handle_encoder+3+0)^00h,c
	movlw	02h
	addwf	(??_menu_handle_encoder+3+0)^00h,c
	movlw	0
	addwfc	(??_menu_handle_encoder+3+1)^00h,c
	movff	??_menu_handle_encoder+3+0,tblptrl
	movff	??_menu_handle_encoder+3+1,tblptrh
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
	line	1511
	
l12115:
	call	_menu_draw_clock	;wreg free
	goto	l1013
	line	1518
	
l12119:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	1	; () banked
	movwf	((menu_handle_encoder@sensor_type))&0ffh
	line	1519
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	1	; () banked
	movwf	((menu_handle_encoder@flow_type))&0ffh
	line	1522
	
l12121:; BSR set to: 1

	movff	(menu_handle_encoder@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_option_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u15091
	goto	u15090
u15091:
	goto	l12153
u15090:
	line	1524
	
l12123:
	movff	(menu_handle_encoder@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_encoder@edit_flag)
	movff	1+?_get_option_edit_flag,(menu_handle_encoder@edit_flag+1)
	line	1525
	movff	(menu_handle_encoder@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_encoder@opts)
	movff	1+?_get_item_options_for_field,(menu_handle_encoder@opts+1)
	line	1527
	
l12125:
	movlb	1	; () banked
	movf	((menu_handle_encoder@edit_flag))&0ffh,w
iorwf	((menu_handle_encoder@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u15101
	goto	u15100

u15101:
	goto	l1013
u15100:
	
l12127:; BSR set to: 1

	movf	((menu_handle_encoder@opts))&0ffh,w
iorwf	((menu_handle_encoder@opts+1))&0ffh,w
	btfsc	status,2
	goto	u15111
	goto	u15110

u15111:
	goto	l1013
u15110:
	line	1529
	
l12129:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u15121
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u15120
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u15121
	goto	u15120

u15121:
	goto	l12137
u15120:
	line	1531
	
l12131:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	incf	indf2

	line	1532
	
l12133:; BSR set to: 1

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
	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
		tblrd	*+
	movf	tablat,w
	subwf	postinc2,w
	btfss	status,0
	goto	u15131
	goto	u15130

u15131:
	goto	l12145
u15130:
	line	1533
	
l12135:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	goto	l12145
	line	1535
	
l12137:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u15140
	goto	u15141

u15141:
	goto	l12145
u15140:
	line	1537
	
l12139:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u15151
	goto	u15150
u15151:
	goto	l12143
u15150:
	line	1538
	
l12141:; BSR set to: 1

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
	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	movwf	indf2,c

	goto	l12145
	line	1540
	
l12143:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	decf	indf2

	line	1544
	
l12145:; BSR set to: 1

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
	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
		tblrd	*+
	movf	tablat,w
	subwf	postinc2,w
	btfss	status,0
	goto	u15161
	goto	u15160

u15161:
	goto	l12149
u15160:
	line	1545
	
l12147:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	line	1548
	
l12149:; BSR set to: 1

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15171
	goto	u15170

u15171:
	goto	l12067
u15170:
	line	1550
	
l12151:; BSR set to: 2

	movlb	3	; () banked
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
	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movf	((??_menu_handle_encoder+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_handle_encoder+1+0
	movff	prodh,??_menu_handle_encoder+1+0+1
	movf	(??_menu_handle_encoder+1+0)^00h,c,w
	movlb	1	; () banked
	addwf	((menu_handle_encoder@opts))&0ffh,w
	movwf	(??_menu_handle_encoder+3+0)^00h,c
	movf	(??_menu_handle_encoder+1+1)^00h,c,w
	addwfc	((menu_handle_encoder@opts+1))&0ffh,w
	movwf	1+(??_menu_handle_encoder+3+0)^00h,c
	movlw	02h
	addwf	(??_menu_handle_encoder+3+0)^00h,c
	movlw	0
	addwfc	(??_menu_handle_encoder+3+1)^00h,c
	movff	??_menu_handle_encoder+3+0,tblptrl
	movff	??_menu_handle_encoder+3+1,tblptrh
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
	line	1551
	call	_menu_draw_input	;wreg free
	goto	l1013
	line	1555
	
l12153:
	movff	(menu_handle_encoder@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u15181
	goto	u15180
u15181:
	goto	l12163
u15180:
	line	1557
	
l12155:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u15190
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u15191
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u15191
	goto	u15190

u15191:
	goto	l12159
u15190:
	
l12157:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1511))&0ffh
	setf	((_menu_handle_encoder$1511+1))&0ffh
	goto	l12161
	
l12159:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1511+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1511))&0ffh
	
l12161:; BSR set to: 1

	movf	((_menu_handle_encoder$1511))&0ffh,w
	
	call	_handle_numeric_rotation
	line	1558
	goto	l1013
	line	1559
	
l12163:
	movff	(menu_handle_encoder@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_time_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u15201
	goto	u15200
u15201:
	goto	l12067
u15200:
	line	1561
	
l12165:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u15210
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u15211
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u15211
	goto	u15210

u15211:
	goto	l12169
u15210:
	
l12167:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1512))&0ffh
	setf	((_menu_handle_encoder$1512+1))&0ffh
	goto	l12171
	
l12169:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1512+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1512))&0ffh
	
l12171:; BSR set to: 1

	movf	((_menu_handle_encoder$1512))&0ffh,w
	
	call	_handle_time_rotation
	goto	l1013
	line	1568
	
l12175:; BSR set to: 3

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u15221
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u15220
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u15221
	goto	u15220

u15221:
	goto	l12193
u15220:
	line	1572
	
l12177:; BSR set to: 3

		movlw	low(menu_handle_encoder@buf_1513)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1513)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_248)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_248)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1573
	
l12179:
		movlw	low(menu_handle_encoder@buf_1513)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1513)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1576
	
l12181:
	movlw	low(-1)
	movlb	3	; () banked
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
	goto	u15231
	goto	u15230

u15231:
	goto	l12189
u15230:
	line	1578
	
l12183:; BSR set to: 3

	incf	((_menu))&0ffh
	line	1581
	
l12185:; BSR set to: 3

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
	goto	u15241
	goto	u15240

u15241:
	goto	l12189
u15240:
	line	1583
	
l12187:; BSR set to: 3

	incf	(0+(_menu+01h))&0ffh
	line	1587
	
l12189:; BSR set to: 3

		movlw	low(menu_handle_encoder@buf_1513)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1513)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_249)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_249)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1588
	
l12191:
		movlw	low(menu_handle_encoder@buf_1513)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1513)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1589
	goto	l12211
	line	1590
	
l12193:; BSR set to: 3

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u15250
	goto	u15251

u15251:
	goto	l12211
u15250:
	line	1594
	
l12195:; BSR set to: 3

		movlw	low(menu_handle_encoder@buf_1516)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1516)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_250)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_250)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1595
	
l12197:
		movlw	low(menu_handle_encoder@buf_1516)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1516)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1598
	
l12199:
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u15261
	goto	u15260
u15261:
	goto	l12207
u15260:
	line	1600
	
l12201:; BSR set to: 3

	decf	((_menu))&0ffh
	line	1603
	
l12203:; BSR set to: 3

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u15271
	goto	u15270

u15271:
	goto	l12207
u15270:
	line	1605
	
l12205:; BSR set to: 3

	decf	(0+(_menu+01h))&0ffh
	line	1609
	
l12207:; BSR set to: 3

		movlw	low(menu_handle_encoder@buf_1516)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1516)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_251)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_251)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1610
	
l12209:
		movlw	low(menu_handle_encoder@buf_1516)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1516)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1614
	
l12211:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u15281
	goto	u15280
u15281:
	goto	l1013
u15280:
	line	1616
	
l12213:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15291
	goto	u15290
u15291:
	goto	l12217
u15290:
	line	1617
	
l12215:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	goto	l1013
	line	1618
	
l12217:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15301
	goto	u15300

u15301:
	goto	l12221
u15300:
	line	1619
	
l12219:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	goto	l1013
	line	1620
	
l12221:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15311
	goto	u15310

u15311:
	goto	l12225
u15310:
	line	1621
	
l12223:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	goto	l1013
	line	1622
	
l12225:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15321
	goto	u15320

u15321:
	goto	l12067
u15320:
	goto	l12115
	line	1625
	
l1013:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_encoder
	__end_of_menu_handle_encoder:
	signat	_menu_handle_encoder,4217
	global	_handle_time_rotation

;; *************** function _handle_time_rotation *****************
;; Defined at:
;;		line 450 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  direction       1    wreg     char 
;; Auto vars:     Size  Location     Type
;;  direction       1   52[BANK0 ] char 
;;  buf            50    0[BANK0 ] unsigned char [50]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3C/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      53       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0      53       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       53 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_sprintf
;;		_uart_println
;; This function is called by:
;;		_main
;;		_menu_handle_encoder
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2,group=0
	line	450
global __ptext13
__ptext13:
psect	text13
	file	"src\menu.c"
	line	450
	
_handle_time_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_time_rotation@direction))&0ffh
	line	452
	
l11175:
		movlw	low(STR_133)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_133)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	456
	
l11177:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_134)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_134)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movlb	0	; () banked
	movf	((handle_time_rotation@direction))&0ffh,w
	movwf	(0+((c:?_sprintf)+08h))^00h,c
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	btfsc	(0+((c:?_sprintf)+08h))^00h,c,7
	decf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(_menu+011h),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	call	_sprintf	;wreg free
	line	457
	
l11179:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	459
	
l11181:
	movlb	3	; () banked
	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u13871
	goto	u13870
u13871:
	goto	l11223
u13870:
	line	461
	
l11183:; BSR set to: 3

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u13881
	goto	u13880

u13881:
	goto	l11205
u13880:
	line	463
	
l11185:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+012h))&0ffh
	line	465
	
l11187:; BSR set to: 3

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13891
	goto	u13890

u13891:
	goto	l11195
u13890:
	
l11189:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13901
	goto	u13900

u13901:
	goto	l11195
u13900:
	
l11191:; BSR set to: 3

		movlw	03h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u13911
	goto	u13910

u13911:
	goto	l11195
u13910:
	line	466
	
l11193:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+012h))&0ffh
	goto	l11249
	line	467
	
l11195:
		movlw	2
	movlb	3	; () banked
	xorwf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u13921
	goto	u13920

u13921:
	goto	l11201
u13920:
	
l11197:; BSR set to: 3

		movlw	018h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u13931
	goto	u13930

u13931:
	goto	l11201
u13930:
	goto	l11193
	line	469
	
l11201:; BSR set to: 3

		movlw	064h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u13941
	goto	u13940

u13941:
	goto	l600
u13940:
	goto	l11193
	line	474
	
l11205:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u13951
	goto	u13950
u13951:
	goto	l11221
u13950:
	line	477
	
l11207:; BSR set to: 3

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13961
	goto	u13960

u13961:
	goto	l11213
u13960:
	
l11209:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13971
	goto	u13970

u13971:
	goto	l11213
u13970:
	line	478
	
l11211:; BSR set to: 3

	movlw	low(02h)
	movwf	(0+(_menu+012h))&0ffh
	goto	l11249
	line	480
	
l11213:
		movlw	2
	movlb	3	; () banked
	xorwf	(0+(_menu+010h))&0ffh,w
	btfsc	status,2
	goto	u13981
	goto	u13980

u13981:
	goto	l11217
u13980:
	
l11215:; BSR set to: 3

	movlw	high(063h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1203+1))&0ffh
	movlw	low(063h)
	movwf	((_handle_time_rotation$1203))&0ffh
	goto	l11219
	
l11217:; BSR set to: 3

	movlw	high(017h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1203+1))&0ffh
	movlw	low(017h)
	movwf	((_handle_time_rotation$1203))&0ffh
	
l11219:; BSR set to: 0

	movff	(_handle_time_rotation$1203),0+(_menu+012h)
	goto	l11249
	line	484
	
l11221:; BSR set to: 3

	decf	(0+(_menu+012h))&0ffh
	goto	l11249
	line	486
	
l600:; BSR set to: 3

	line	487
	goto	l11249
	line	488
	
l11223:; BSR set to: 3

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u13991
	goto	u13990

u13991:
	goto	l11249
u13990:
	line	491
	
l11225:; BSR set to: 3

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14001
	goto	u14000

u14001:
	goto	l11235
u14000:
	
l11227:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14011
	goto	u14010

u14011:
	goto	l11235
u14010:
	
l11229:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u14021
	goto	u14020

u14021:
	goto	l11235
u14020:
	line	494
	
l11231:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l612
	line	498
	
l11235:
	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u14031
	goto	u14030

u14031:
	goto	l11243
u14030:
	line	500
	
l11237:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+013h))&0ffh
	line	501
	
l11239:; BSR set to: 3

		movlw	03Ch-1
	cpfsgt	(0+(_menu+013h))&0ffh
	goto	u14041
	goto	u14040

u14041:
	goto	l11249
u14040:
	line	502
	
l11241:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l11249
	line	506
	
l11243:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	btfss	status,2
	goto	u14051
	goto	u14050
u14051:
	goto	l11247
u14050:
	line	507
	
l11245:; BSR set to: 3

	movlw	low(03Bh)
	movwf	(0+(_menu+013h))&0ffh
	goto	l11249
	line	509
	
l11247:; BSR set to: 3

	decf	(0+(_menu+013h))&0ffh
	line	513
	
l11249:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_135)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_135)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	514
	
l11251:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	515
	
l612:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_time_rotation
	__end_of_handle_time_rotation:
	signat	_handle_time_rotation,4217
	global	_handle_numeric_rotation

;; *************** function _handle_numeric_rotation *****************
;; Defined at:
;;		line 856 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  direction       1    wreg     char 
;; Auto vars:     Size  Location     Type
;;  direction       1   56[BANK0 ] char 
;;  max_units       1   55[BANK0 ] unsigned char 
;;  max_tens        1   54[BANK0 ] unsigned char 
;;  buf            50    0[BANK0 ] unsigned char [50]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3E/0
;;		On exit  : 3C/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      57       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0      57       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       57 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_sprintf
;;		_uart_println
;; This function is called by:
;;		_main
;;		_menu_handle_encoder
;; This function uses a non-reentrant model
;;
psect	text14,class=CODE,space=0,reloc=2,group=0
	line	856
global __ptext14
__ptext14:
psect	text14
	file	"src\menu.c"
	line	856
	
_handle_numeric_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_numeric_rotation@direction))&0ffh
	line	858
	
l11073:
		movlw	low(STR_192)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_192)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	861
	
l11075:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_193)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_193)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+08h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Fh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	862
	
l11077:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	865
	
l11079:
	movlb	3	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u13631
	goto	u13630
u13631:
	goto	l11173
u13630:
	
l11081:; BSR set to: 3

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u13641
	goto	u13640
u13641:
	goto	l11173
u13640:
	line	867
	
l11083:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+08h))&0ffh
	goto	l11173
	line	873
	
l11085:; BSR set to: 3

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u13651
	goto	u13650
u13651:
	goto	l785
u13650:
	
l11087:; BSR set to: 3

	movlb	0	; () banked
	movf	((handle_numeric_rotation@direction))&0ffh,w
	btfsc	status,2
	goto	u13661
	goto	u13660
u13661:
	goto	l785
u13660:
	line	875
	
l11089:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u13671
	goto	u13670
u13671:
	movlw	1
	goto	u13680
u13670:
	movlw	0
u13680:
	movwf	(0+(_menu+09h))&0ffh
	goto	l785
	line	880
	
l11091:; BSR set to: 3

	movlb	0	; () banked
		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u13691
	goto	u13690

u13691:
	goto	l11099
u13690:
	line	882
	
l11093:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+0Ah))&0ffh
	line	883
	
l11095:; BSR set to: 3

		movlw	06h-1
	cpfsgt	(0+(_menu+0Ah))&0ffh
	goto	u13701
	goto	u13700

u13701:
	goto	l785
u13700:
	line	884
	
l11097:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l785
	line	886
	
l11099:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u13710
	goto	u13711

u13711:
	goto	l785
u13710:
	line	888
	
l11101:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u13721
	goto	u13720
u13721:
	goto	l11105
u13720:
	line	889
	
l11103:; BSR set to: 3

	movlw	low(05h)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l785
	line	891
	
l11105:; BSR set to: 3

	decf	(0+(_menu+0Ah))&0ffh
	goto	l785
	line	897
	
l11107:; BSR set to: 3

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u13731
	goto	u13730

u13731:
	goto	l11111
u13730:
	
l11109:; BSR set to: 3

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1334+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1334))&0ffh
	goto	l11113
	
l11111:; BSR set to: 3

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1334+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1334))&0ffh
	
l11113:; BSR set to: 0

	movff	(_handle_numeric_rotation$1334),(handle_numeric_rotation@max_tens)
	line	898
	
l11115:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u13741
	goto	u13740

u13741:
	goto	l11127
u13740:
	line	900
	
l11117:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u13751
	goto	u13750
u13751:
	goto	l11121
u13750:
	goto	l785
	line	902
	
l11121:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+0Bh))&0ffh
	line	903
	
l11123:; BSR set to: 3

		movf	(0+(_menu+0Bh))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfsc	status,0
	goto	u13761
	goto	u13760

u13761:
	goto	l785
u13760:
	line	904
	
l11125:; BSR set to: 0

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	goto	l785
	line	906
	
l11127:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u13770
	goto	u13771

u13771:
	goto	l785
u13770:
	line	908
	
l11129:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u13781
	goto	u13780
u13781:
	goto	l11133
u13780:
	goto	l785
	line	910
	
l11133:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+0Bh))&0ffh,w
	btfss	status,2
	goto	u13791
	goto	u13790
u13791:
	goto	l11137
u13790:
	line	911
	
l11135:; BSR set to: 3

	movff	(handle_numeric_rotation@max_tens),0+(_menu+0Bh)
	goto	l785
	line	913
	
l11137:; BSR set to: 3

	decf	(0+(_menu+0Bh))&0ffh
	goto	l785
	line	920
	
l11139:; BSR set to: 3

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u13801
	goto	u13800

u13801:
	goto	l11143
u13800:
	
l11141:; BSR set to: 3

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1336+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1336))&0ffh
	goto	l11145
	
l11143:; BSR set to: 3

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1336+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1336))&0ffh
	
l11145:; BSR set to: 0

	movff	(_handle_numeric_rotation$1336),(handle_numeric_rotation@max_units)
	line	921
	
l11147:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u13811
	goto	u13810

u13811:
	goto	l11159
u13810:
	line	923
	
l11149:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u13821
	goto	u13820
u13821:
	goto	l11153
u13820:
	goto	l785
	line	925
	
l11153:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+0Ch))&0ffh
	line	926
	
l11155:; BSR set to: 3

		movf	(0+(_menu+0Ch))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_units))&0ffh,w
	btfsc	status,0
	goto	u13831
	goto	u13830

u13831:
	goto	l785
u13830:
	line	927
	
l11157:; BSR set to: 0

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	goto	l785
	line	929
	
l11159:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u13840
	goto	u13841

u13841:
	goto	l785
u13840:
	line	931
	
l11161:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u13851
	goto	u13850
u13851:
	goto	l11165
u13850:
	goto	l785
	line	933
	
l11165:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+0Ch))&0ffh,w
	btfss	status,2
	goto	u13861
	goto	u13860
u13861:
	goto	l11169
u13860:
	line	934
	
l11167:; BSR set to: 3

	movff	(handle_numeric_rotation@max_units),0+(_menu+0Ch)
	goto	l785
	line	936
	
l11169:; BSR set to: 3

	decf	(0+(_menu+0Ch))&0ffh
	goto	l785
	line	870
	
l11173:; BSR set to: 3

	movf	(0+(_menu+08h))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l11085
	xorlw	1^0	; case 1
	skipnz
	goto	l11091
	xorlw	2^1	; case 2
	skipnz
	goto	l11107
	xorlw	3^2	; case 3
	skipnz
	goto	l11139
	goto	l785

	line	941
	
l785:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_numeric_rotation
	__end_of_handle_numeric_rotation:
	signat	_handle_numeric_rotation,4217
	global	_menu_handle_button

;; *************** function _menu_handle_button *****************
;; Defined at:
;;		line 1631 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  press_type      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  press_type      1  219[BANK1 ] unsigned char 
;;  i               1  212[BANK1 ] unsigned char 
;;  opts            2  208[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  edit_flag       2  206[BANK1 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> NULL(0), sensor_edit_flag(1), enable_edit_flag(1), 
;;  buf            50   50[BANK1 ] unsigned char [50]
;;  current_val     2  210[BANK1 ] unsigned int 
;;  current_val     2  220[BANK1 ] int 
;;  new_value       2  213[BANK1 ] unsigned int 
;;  sensor_type     1  226[BANK1 ] unsigned char 
;;  flow_type       1  224[BANK1 ] unsigned char 
;;  new_value       2  228[BANK1 ] int 
;;  new_seconds     2  222[BANK1 ] unsigned int 
;;  buf            50  100[BANK1 ] unsigned char [50]
;;  buf            50    0[BANK1 ] unsigned char [50]
;;  opts            2  204[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  edit_flag       2  202[BANK1 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> NULL(0), sensor_edit_flag(1), enable_edit_flag(1), 
;;  buf            50  150[BANK1 ] unsigned char [50]
;;  edit_flag       2  217[BANK1 ] PTR unsigned char 
;;		 -> display_edit_flag(1), relay_high_edit_flag(1), NULL(0), enable_edit_flag(1), 
;;  opts            2  215[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  sensor_type     1  227[BANK1 ] unsigned char 
;;  flow_type       1  225[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0     230       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5       0     230       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      235 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 8
;; This function calls:
;;		___lbdiv
;;		___lbmod
;;		___wmul
;;		_beep
;;		_get_current_numeric_value
;;		_get_item_options_for_field
;;		_get_option_edit_flag
;;		_init_numeric_editor
;;		_init_time_editor
;;		_is_numeric_field
;;		_is_option_field
;;		_is_time_field
;;		_menu_draw_clock
;;		_menu_draw_input
;;		_menu_draw_options
;;		_menu_draw_setup
;;		_menu_update_time_value
;;		_rebuild_clock_menu
;;		_rebuild_input_menu
;;		_save_current_config
;;		_sprintf
;;		_strcmp
;;		_strcpy
;;		_trigger_relay_pulse
;;		_uart_println
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2,group=0
	line	1631
global __ptext15
__ptext15:
psect	text15
	file	"src\menu.c"
	line	1631
	
_menu_handle_button:
;incstack = 0
	callstack 22
	movlb	1	; () banked
	movwf	((menu_handle_button@press_type))&0ffh
	line	1636
	
l12399:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15651
	goto	u15650
u15651:
	goto	l12775
u15650:
	line	1638
	
l12401:; BSR set to: 3

	movlb	1	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u15661
	goto	u15660

u15661:
	goto	l12765
u15660:
	line	1641
	
l12403:; BSR set to: 1

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15671
	goto	u15670

u15671:
	goto	l12509
u15670:
	line	1646
	
l12405:; BSR set to: 2

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_252)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_252)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1647
	
l12407:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1650
	
l12409:
		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1651
	
l12411:; BSR set to: 1

		movlw	low(0)
	movwf	((menu_handle_button@edit_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@edit_flag+1))&0ffh

	line	1653
	
l12413:; BSR set to: 1

	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15681
	goto	u15680
u15681:
	goto	l12423
u15680:
	line	1655
	
l12415:; BSR set to: 3

		movlw	low(_menu_item_options)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1656
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	1657
	
l12417:; BSR set to: 1

	movff	(c:_enable_edit_flag),(_system_config)
	line	1658
	
l12419:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_253)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_253)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1659
	
l12421:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1660
	goto	l1076
	line	1661
	
l12423:; BSR set to: 3

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15691
	goto	u15690

u15691:
	goto	l12433
u15690:
	line	1663
	
l12425:; BSR set to: 3

		movlw	low(_menu_item_options+048h)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1664
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	1665
	
l12427:; BSR set to: 1

	movff	(c:_relay_high_edit_flag),0+(_system_config+06h)
	line	1666
	
l12429:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_254)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_254)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+06h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	goto	l12421
	line	1669
	
l12433:; BSR set to: 3

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15701
	goto	u15700

u15701:
	goto	l12487
u15700:
	line	1672
	
l12435:; BSR set to: 3

	incf	(0+(_menu+011h))&0ffh
	line	1673
	
l12437:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	1676
	
l12439:; BSR set to: 3

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u15711
	goto	u15710

u15711:
	goto	l12445
u15710:
	
l12441:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u15721
	goto	u15720

u15721:
	goto	l12445
u15720:
	line	1678
	
l12443:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	line	1681
	
l12445:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1683
	
l12447:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_255)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_255)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1684
	
l12449:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1687
	
l12451:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_256)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_256)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1688
	
l12453:
	call	_menu_draw_clock	;wreg free
	line	1690
	
l12455:
		movlw	02h-1
	movlb	3	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u15731
	goto	u15730

u15731:
	goto	l1087
u15730:
	line	1693
	
l12457:; BSR set to: 3

	movf	(0+(_menu+012h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+(_menu+013h))&0ffh,w
	addwf	(??_menu_handle_button+0+0)^00h,c,w
	movlb	1	; () banked
	movwf	((menu_handle_button@new_value))&0ffh
	movlb	3	; () banked
	movlw	0
	addwfc	(??_menu_handle_button+0+1)^00h,c,w
	movlb	1	; () banked
	movwf	1+((menu_handle_button@new_value))&0ffh
	line	1696
	
l12459:; BSR set to: 1

	movf	((menu_handle_button@new_value))&0ffh,w
iorwf	((menu_handle_button@new_value+1))&0ffh,w
	btfss	status,2
	goto	u15741
	goto	u15740

u15741:
	goto	l12463
u15740:
	line	1697
	
l12461:; BSR set to: 1

	movlw	high(01h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(01h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	1698
	
l12463:; BSR set to: 1

		movf	((menu_handle_button@new_value+1))&0ffh,w
	bnz	u15750
	movlw	121
	subwf	 ((menu_handle_button@new_value))&0ffh,w
	btfss	status,0
	goto	u15751
	goto	u15750

u15751:
	goto	l12467
u15750:
	line	1699
	
l12465:; BSR set to: 1

	movlw	high(078h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(078h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	1701
	
l12467:; BSR set to: 1

	movff	(menu_handle_button@new_value),0+(_system_config+07h)
	line	1704
	
l12469:; BSR set to: 1

		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_257)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_257)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(03Ch)
	movwf	((c:___lbdiv@divisor))^00h,c
	movlb	5	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbdiv
	movwf	(??_menu_handle_button+0+0)^00h,c
	movf	((??_menu_handle_button+0+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	5	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbmod
	movwf	(??_menu_handle_button+1+0)^00h,c
	movf	((??_menu_handle_button+1+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1705
	
l12471:
		movff	0+(_clock_menu+0Ch),(c:strcpy@to)
	movff	1+(_clock_menu+0Ch),(c:strcpy@to+1)

		movlw	low(_value_relay_pulse)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1707
	
l12473:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_258)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_258)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+07h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1708
	
l12475:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1709
	
l12477:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	1710
	
l12479:; BSR set to: 1

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1711
	
l12481:; BSR set to: 3

	call	_menu_draw_clock	;wreg free
	line	1715
	
l12483:
	movlw	(0)&0ffh
	
	call	_trigger_relay_pulse
	line	1716
	goto	l1087
	line	1717
	
l1081:
	line	1719
	goto	l1087
	line	1724
	
l12487:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15761
	goto	u15760

u15761:
	goto	l1076
u15760:
	line	1726
	
l12489:; BSR set to: 3

		movlw	low(_menu_item_options+03Ch)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1727
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	1731
	
l1076:
	movlb	1	; () banked
	movf	((menu_handle_button@opts))&0ffh,w
iorwf	((menu_handle_button@opts+1))&0ffh,w
	btfsc	status,2
	goto	u15771
	goto	u15770

u15771:
	goto	l12503
u15770:
	
l12491:; BSR set to: 1

	movf	((menu_handle_button@edit_flag))&0ffh,w
iorwf	((menu_handle_button@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u15781
	goto	u15780

u15781:
	goto	l12503
u15780:
	
l12493:; BSR set to: 1

	movff	(menu_handle_button@edit_flag),fsr2l
	movff	(menu_handle_button@edit_flag+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	01h
	addwf	((menu_handle_button@opts))&0ffh,w
	movwf	(??_menu_handle_button+1+0)^00h,c
	movlw	0
	addwfc	((menu_handle_button@opts+1))&0ffh,w
	movwf	(??_menu_handle_button+1+0+1)^00h,c
	movff	??_menu_handle_button+1+0,tblptrl
	movff	??_menu_handle_button+1+1,tblptrh
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
	subwf	((??_menu_handle_button+0+0))^00h,c,w
	btfsc	status,0
	goto	u15791
	goto	u15790
u15791:
	goto	l12503
u15790:
	line	1733
	
l12495:; BSR set to: 1

	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	mullw	05h
	movlw	low(_clock_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_clock_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strcpy@to)
	movff	postdec2,(c:strcpy@to+1)
	movff	(menu_handle_button@edit_flag),fsr2l
	movff	(menu_handle_button@edit_flag+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movf	((??_menu_handle_button+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_handle_button+1+0
	movff	prodh,??_menu_handle_button+1+0+1
	movf	(??_menu_handle_button+1+0)^00h,c,w
	movlb	1	; () banked
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
	line	1734
	
l12497:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	1735
	
l12499:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_259)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_259)
	movwf	((c:sprintf@f+1))^00h,c

	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	mullw	05h
	movlw	low(_clock_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_clock_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+04h)
	movff	postdec2,1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1736
	
l12501:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1739
	
l12503:
	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1740
	
l12505:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1087
	line	1745
	
l12509:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	1	; () banked
	movwf	((menu_handle_button@sensor_type))&0ffh
	line	1746
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	1	; () banked
	movwf	((menu_handle_button@flow_type))&0ffh
	line	1749
	
l12511:; BSR set to: 1

	movff	(menu_handle_button@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_option_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u15801
	goto	u15800
u15801:
	goto	l12615
u15800:
	line	1751
	
l12513:
	movff	(menu_handle_button@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1543)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1543+1)
	line	1752
	movff	(menu_handle_button@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1544)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1544+1)
	line	1754
	
l12515:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag_1543))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1543+1))&0ffh,w
	btfsc	status,2
	goto	u15811
	goto	u15810

u15811:
	goto	l12503
u15810:
	
l12517:; BSR set to: 1

	movf	((menu_handle_button@opts_1544))&0ffh,w
iorwf	((menu_handle_button@opts_1544+1))&0ffh,w
	btfsc	status,2
	goto	u15821
	goto	u15820

u15821:
	goto	l12503
u15820:
	line	1757
	
l12519:; BSR set to: 1

	movlb	3	; () banked
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
	movff	(menu_handle_button@edit_flag_1543),fsr2l
	movff	(menu_handle_button@edit_flag_1543+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movf	((??_menu_handle_button+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_handle_button+1+0
	movff	prodh,??_menu_handle_button+1+0+1
	movf	(??_menu_handle_button+1+0)^00h,c,w
	movlb	1	; () banked
	addwf	((menu_handle_button@opts_1544))&0ffh,w
	movwf	(??_menu_handle_button+3+0)^00h,c
	movf	(??_menu_handle_button+1+1)^00h,c,w
	addwfc	((menu_handle_button@opts_1544+1))&0ffh,w
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
	line	1760
	
l12521:
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15831
	goto	u15830
u15831:
	goto	l12525
u15830:
	line	1762
	
l12523:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_enable_edit_flag),indf2

	line	1763
	goto	l12609
	line	1764
	
l12525:; BSR set to: 3

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15841
	goto	u15840

u15841:
	goto	l12537
u15840:
	line	1766
	
l12527:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_sensor_edit_flag),indf2

	line	1769
	
l12529:; BSR set to: 2

		movlw	2
	xorwf	((c:_sensor_edit_flag))^00h,c,w
	btfss	status,2
	goto	u15851
	goto	u15850

u15851:
	goto	l12535
u15850:
	
l12531:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfsc	status,2
	goto	u15861
	goto	u15860

u15861:
	goto	l12535
u15860:
	line	1771
	
l12533:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(01h)
	movwf	indf2
	line	1775
	
l12535:
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	1776
	goto	l12609
	line	1777
	
l12537:; BSR set to: 3

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15871
	goto	u15870

u15871:
	goto	l12545
u15870:
	
l12539:; BSR set to: 3

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15881
	goto	u15880

u15881:
	goto	l12545
u15880:
	line	1779
	
l12541:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_flow_type_edit_flag),indf2

	line	1782
	
l12543:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	1783
	goto	l12609
	line	1784
	
l12545:
		movlw	3
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15891
	goto	u15890

u15891:
	goto	l12553
u15890:
	
l12547:; BSR set to: 3

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15901
	goto	u15900

u15901:
	goto	l12553
u15900:
	
l12549:; BSR set to: 1

		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u15911
	goto	u15910

u15911:
	goto	l12553
u15910:
	goto	l12609
	line	1787
	
l12551:
	goto	l12609
	line	1788
	
l12553:
		movlw	3
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15921
	goto	u15920

u15921:
	goto	l12561
u15920:
	
l12555:; BSR set to: 3

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15931
	goto	u15930

u15931:
	goto	l12561
u15930:
	
l12557:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u15941
	goto	u15940
u15941:
	goto	l12561
u15940:
	line	1790
	
l12559:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_flow_units_edit_flag),indf2

	line	1791
	goto	l12609
	line	1792
	
l12561:
	movlb	1	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15951
	goto	u15950
u15951:
	goto	l12579
u15950:
	line	1794
	
l12563:; BSR set to: 1

		movlw	9
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15961
	goto	u15960

u15961:
	goto	l12567
u15960:
	line	1795
	
l12565:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+038h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+038h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_high_edit_flag),indf2

	goto	l12609
	line	1796
	
l12567:; BSR set to: 3

		movlw	10
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15971
	goto	u15970

u15971:
	goto	l12571
u15970:
	line	1797
	
l12569:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+039h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+039h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_plp_edit_flag),indf2

	goto	l12609
	line	1798
	
l12571:; BSR set to: 3

		movlw	11
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15981
	goto	u15980

u15981:
	goto	l12575
u15980:
	line	1799
	
l12573:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_slp_edit_flag),indf2

	goto	l12609
	line	1800
	
l12575:; BSR set to: 3

		movlw	12
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15991
	goto	u15990

u15991:
	goto	l12551
u15990:
	line	1801
	
l12577:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_display_edit_flag),indf2

	goto	l12609
	line	1803
	
l12579:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u16001
	goto	u16000

u16001:
	goto	l12589
u16000:
	line	1805
	
l12581:; BSR set to: 1

		movlw	6
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16011
	goto	u16010

u16011:
	goto	l12585
u16010:
	goto	l12565
	line	1807
	
l12585:; BSR set to: 3

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16021
	goto	u16020

u16021:
	goto	l12551
u16020:
	goto	l12577
	line	1810
	
l12589:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u16031
	goto	u16030

u16031:
	goto	l12551
u16030:
	line	1812
	
l12591:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u16041
	goto	u16040
u16041:
	goto	l12601
u16040:
	line	1814
	
l12593:; BSR set to: 1

		movlw	8
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16051
	goto	u16050

u16051:
	goto	l12597
u16050:
	line	1815
	
l12595:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Bh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Bh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_low_edit_flag),indf2

	goto	l12609
	line	1816
	
l12597:; BSR set to: 3

		movlw	9
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16061
	goto	u16060

u16061:
	goto	l12551
u16060:
	goto	l12577
	line	1821
	
l12601:; BSR set to: 1

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16071
	goto	u16070

u16071:
	goto	l12605
u16070:
	goto	l12595
	line	1823
	
l12605:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16081
	goto	u16080

u16081:
	goto	l12551
u16080:
	goto	l12577
	line	1828
	
l12609:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	goto	l12503
	line	1835
	
l12615:
	movff	(menu_handle_button@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_time_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u16091
	goto	u16090
u16091:
	goto	l12679
u16090:
	line	1837
	
l12617:
	movlb	3	; () banked
	incf	(0+(_menu+011h))&0ffh
	line	1838
	
l12619:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	1839
	
l12621:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1842
	
l12623:
		movlw	low(menu_handle_button@buf_1549)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1549)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_260)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_260)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1843
	
l12625:
		movlw	low(menu_handle_button@buf_1549)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1549)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1845
	
l12627:
	call	_menu_update_time_value	;wreg free
	line	1847
	
l12629:
		movlw	02h-1
	movlb	3	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u16101
	goto	u16100

u16101:
	goto	l1087
u16100:
	line	1851
	
l12631:; BSR set to: 3

	movf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u16111
	goto	u16110
u16111:
	goto	l12635
u16110:
	line	1852
	
l12633:; BSR set to: 3

	movf	(0+(_menu+012h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+(_menu+013h))&0ffh,w
	addwf	(??_menu_handle_button+0+0)^00h,c,w
	movlb	1	; () banked
	movwf	((menu_handle_button@new_seconds))&0ffh
	movlb	3	; () banked
	movlw	0
	addwfc	(??_menu_handle_button+0+1)^00h,c,w
	movlb	1	; () banked
	movwf	1+((menu_handle_button@new_seconds))&0ffh
	goto	l12637
	line	1854
	
l12635:; BSR set to: 3

	movff	0+(_menu+012h),(c:___wmul@multiplier)
	clrf	((c:___wmul@multiplier+1))^00h,c
	movlw	high(0E10h)
	movwf	((c:___wmul@multiplicand+1))^00h,c
	movlw	low(0E10h)
	movwf	((c:___wmul@multiplicand))^00h,c
	call	___wmul	;wreg free
	movlb	3	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+?___wmul)^00h,c,w
	addwf	(??_menu_handle_button+0+0)^00h,c,w
	movlb	1	; () banked
	movwf	((menu_handle_button@new_seconds))&0ffh
	movf	(1+?___wmul)^00h,c,w
	addwfc	(??_menu_handle_button+0+1)^00h,c,w
	movwf	1+((menu_handle_button@new_seconds))&0ffh
	line	1857
	
l12637:; BSR set to: 1

	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u16121
	goto	u16120
u16121:
	goto	l12651
u16120:
	line	1859
	
l12639:; BSR set to: 1

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16131
	goto	u16130

u16131:
	goto	l12643
u16130:
	line	1860
	
l12641:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_seconds),postinc2
	movff	(menu_handle_button@new_seconds+1),postdec2
	goto	l12671
	line	1861
	
l12643:; BSR set to: 3

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16141
	goto	u16140

u16141:
	goto	l12647
u16140:
	line	1862
	
l12645:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_seconds),postinc2
	movff	(menu_handle_button@new_seconds+1),postdec2
	goto	l12671
	line	1863
	
l12647:; BSR set to: 3

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16151
	goto	u16150

u16151:
	goto	l1134
u16150:
	line	1864
	
l12649:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_seconds),postinc2
	movff	(menu_handle_button@new_seconds+1),postdec2
	goto	l12671
	line	1865
	
l1134:; BSR set to: 3

	goto	l12671
	line	1866
	
l12651:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u16161
	goto	u16160

u16161:
	goto	l12657
u16160:
	line	1868
	
l12653:; BSR set to: 1

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16171
	goto	u16170

u16171:
	goto	l12671
u16170:
	goto	l12641
	line	1871
	
l12657:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u16181
	goto	u16180

u16181:
	goto	l12671
u16180:
	line	1873
	
l12659:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u16191
	goto	u16190
u16191:
	goto	l12665
u16190:
	
l12661:; BSR set to: 1

		movlw	7
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16201
	goto	u16200

u16201:
	goto	l12665
u16200:
	line	1874
	
l12663:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_seconds),postinc2
	movff	(menu_handle_button@new_seconds+1),postdec2
	goto	l12671
	line	1875
	
l12665:
	movlb	1	; () banked
		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u16211
	goto	u16210

u16211:
	goto	l12671
u16210:
	
l12667:; BSR set to: 1

		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16221
	goto	u16220

u16221:
	goto	l12671
u16220:
	goto	l12663
	line	1881
	
l12671:
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:sprintf@sp)
	movff	postdec2,(c:sprintf@sp+1)
		movlw	low(STR_261)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_261)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1883
	
l12673:
	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1884
	
l12675:; BSR set to: 3

	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	1885
	
l12677:; BSR set to: 1

		movlw	low(STR_262)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_262)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1087
	line	1889
	
l12679:
	movff	(menu_handle_button@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u16231
	goto	u16230
u16231:
	goto	l1081
u16230:
	line	1891
	
l12681:
	movlb	3	; () banked
	incf	(0+(_menu+08h))&0ffh
	line	1892
	
l12683:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1894
	
l12685:
		movlw	2
	movlb	3	; () banked
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u16241
	goto	u16240

u16241:
	goto	l12691
u16240:
	
l12687:; BSR set to: 3

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u16251
	goto	u16250

u16251:
	goto	l12691
u16250:
	line	1896
	
l12689:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+0Bh))&0ffh
	line	1897
	movlw	low(0)
	movwf	(0+(_menu+0Ch))&0ffh
	line	1900
	
l12691:; BSR set to: 3

		movlw	04h-1
	cpfsgt	(0+(_menu+08h))&0ffh
	goto	u16261
	goto	u16260

u16261:
	goto	l1081
u16260:
	line	1902
	
l12693:; BSR set to: 3

	call	_get_current_numeric_value	;wreg free
	movff	0+?_get_current_numeric_value,(menu_handle_button@new_value_1554)
	movff	1+?_get_current_numeric_value,(menu_handle_button@new_value_1554+1)
	line	1905
	
l12695:; BSR set to: 3

	movlb	1	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u16271
	goto	u16270
u16271:
	goto	l12719
u16270:
	line	1907
	
l12697:; BSR set to: 1

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16281
	goto	u16280

u16281:
	goto	l12703
u16280:
	line	1909
	
l12699:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1554),postinc2
	movff	(menu_handle_button@new_value_1554+1),postdec2
	line	1910
	
l12701:; BSR set to: 2

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_263)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_263)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1554),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1554+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1911
	goto	l12761
	line	1912
	
l12703:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16291
	goto	u16290

u16291:
	goto	l12709
u16290:
	line	1914
	
l12705:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1554),postinc2
	movff	(menu_handle_button@new_value_1554+1),postdec2
	line	1915
	
l12707:; BSR set to: 2

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_264)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_264)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1554),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1554+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1916
	goto	l12761
	line	1917
	
l12709:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16301
	goto	u16300

u16301:
	goto	l12715
u16300:
	line	1919
	
l12711:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1554),postinc2
	movff	(menu_handle_button@new_value_1554+1),postdec2
	line	1920
	
l12713:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_265)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_265)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1554),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1554+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1921
	goto	l12761
	line	1922
	
l12715:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16311
	goto	u16310

u16311:
	goto	l1154
u16310:
	line	1925
	
l12717:; BSR set to: 3

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_266)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_266)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1554),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1554+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l12761
	line	1927
	
l1154:; BSR set to: 3

	goto	l12761
	line	1928
	
l12719:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u16321
	goto	u16320

u16321:
	goto	l12739
u16320:
	line	1930
	
l12721:; BSR set to: 1

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16331
	goto	u16330

u16331:
	goto	l12727
u16330:
	line	1932
	
l12723:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1554),postinc2
	movff	(menu_handle_button@new_value_1554+1),postdec2
	line	1933
	
l12725:; BSR set to: 2

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_267)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_267)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1554),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1554+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1934
	goto	l12761
	line	1935
	
l12727:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16341
	goto	u16340

u16341:
	goto	l12733
u16340:
	line	1937
	
l12729:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1554),postinc2
	movff	(menu_handle_button@new_value_1554+1),postdec2
	line	1938
	
l12731:; BSR set to: 2

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_268)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_268)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1554),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1554+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1939
	goto	l12761
	line	1940
	
l12733:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16351
	goto	u16350

u16351:
	goto	l1154
u16350:
	line	1942
	
l12735:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1554),postinc2
	movff	(menu_handle_button@new_value_1554+1),postdec2
	line	1943
	
l12737:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_269)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_269)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1554),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1554+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l12761
	line	1946
	
l12739:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u16361
	goto	u16360

u16361:
	goto	l12761
u16360:
	
l12741:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u16371
	goto	u16370
u16371:
	goto	l12761
u16370:
	line	1948
	
l12743:; BSR set to: 1

		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16381
	goto	u16380

u16381:
	goto	l12749
u16380:
	line	1950
	
l12745:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1554),postinc2
	movff	(menu_handle_button@new_value_1554+1),postdec2
	line	1951
	
l12747:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_270)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_270)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1554),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1554+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1952
	goto	l12761
	line	1953
	
l12749:; BSR set to: 3

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16391
	goto	u16390

u16391:
	goto	l12755
u16390:
	line	1955
	
l12751:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1554),postinc2
	movff	(menu_handle_button@new_value_1554+1),postdec2
	line	1956
	
l12753:; BSR set to: 2

		movff	0+(_input_menu+01Bh),(c:sprintf@sp)
	movff	1+(_input_menu+01Bh),(c:sprintf@sp+1)

		movlw	low(STR_271)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_271)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1554),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1554+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1957
	goto	l12761
	line	1958
	
l12755:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16401
	goto	u16400

u16401:
	goto	l1154
u16400:
	line	1960
	
l12757:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+020h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+020h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1554),postinc2
	movff	(menu_handle_button@new_value_1554+1),postdec2
	line	1961
	
l12759:; BSR set to: 2

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_272)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_272)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1554),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1554+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1965
	
l12761:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	1966
	
l12763:; BSR set to: 1

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	goto	l1087
	line	1970
	
l12765:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u16411
	goto	u16410

u16411:
	goto	l1087
u16410:
	line	1972
	
l12767:; BSR set to: 1

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1973
	
l12769:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1974
	
l12771:
	asmopt push
asmopt off
movlw  3
movwf	(??_menu_handle_button+0+0+1)^00h,c
movlw	8
movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	119
u17677:
decfsz	wreg,f
	bra	u17677
	decfsz	(??_menu_handle_button+0+0)^00h,c,f
	bra	u17677
	decfsz	(??_menu_handle_button+0+0+1)^00h,c,f
	bra	u17677
	nop
asmopt pop

	line	1975
	
l12773:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1087
	line	1980
	
l12775:; BSR set to: 3

	movlb	1	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u16421
	goto	u16420

u16421:
	goto	l13047
u16420:
	line	1982
	
l12777:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16431
	goto	u16430
u16431:
	goto	l12797
u16430:
	line	1984
	
l12779:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1986
	goto	l12795
	line	1992
	
l12781:; BSR set to: 3

	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	1993
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	1994
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	1995
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	1996
	
l12783:; BSR set to: 3

	call	_menu_draw_setup	;wreg free
	line	1997
	goto	l1087
	line	2006
	
l12785:; BSR set to: 3

	movlb	1	; () banked
	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u16441
	goto	u16440
u16441:
	goto	l12791
u16440:
	line	2008
	
l12787:; BSR set to: 1

	call	_save_current_config	;wreg free
	line	2009
	
l12789:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	2011
	
l12791:; BSR set to: 1

	movlb	2	; () banked
	setf	((_current_menu))&0ffh
	line	2012
	goto	l1087
	line	1986
	
l12795:
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l1081
	xorlw	1^0	; case 1
	skipnz
	goto	l12781
	xorlw	2^1	; case 2
	skipnz
	goto	l1081
	xorlw	3^2	; case 3
	skipnz
	goto	l1081
	xorlw	4^3	; case 4
	skipnz
	goto	l12785
	goto	l1087

	line	2015
	
l12797:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16451
	goto	u16450

u16451:
	goto	l12947
u16450:
	line	2017
	
l12799:; BSR set to: 2

	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	clrf	(??_menu_handle_button+0+0+1)^00h,c

	movlw	low(-1)
	addwf	(0+(_menu+02h))&0ffh,w
	movwf	(??_menu_handle_button+2+0)^00h,c
	clrf	1+(??_menu_handle_button+2+0)^00h,c
	movlw	high(-1)
	addwfc	1+(??_menu_handle_button+2+0)^00h,c
	movf	(??_menu_handle_button+0+0)^00h,c,w
xorwf	(??_menu_handle_button+2+0)^00h,c,w
	bnz	u16461
movf	(??_menu_handle_button+0+1)^00h,c,w
xorwf	(??_menu_handle_button+2+1)^00h,c,w
	btfss	status,2
	goto	u16461
	goto	u16460

u16461:
	goto	l12813
u16460:
	line	2019
	
l12801:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2020
	
l12803:
	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2021
	
l12805:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2022
	
l12807:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2023
	
l12809:; BSR set to: 3

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l12783
	line	2026
	
l12813:; BSR set to: 3

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
	goto	u16471
	goto	u16470
u16471:
	goto	l1087
u16470:
	line	2028
	
l12815:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	1	; () banked
	movwf	((menu_handle_button@sensor_type_1566))&0ffh
	line	2029
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	1	; () banked
	movwf	((menu_handle_button@flow_type_1567))&0ffh
	line	2032
	
l12817:; BSR set to: 1

	movff	(menu_handle_button@sensor_type_1566),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type_1567),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u16481
	goto	u16480
u16481:
	goto	l12875
u16480:
	line	2034
	
l12819:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val))&0ffh
	line	2037
	movf	((menu_handle_button@sensor_type_1566))&0ffh,w
	btfss	status,2
	goto	u16491
	goto	u16490
u16491:
	goto	l12837
u16490:
	line	2039
	
l12821:; BSR set to: 1

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16501
	goto	u16500

u16501:
	goto	l12825
u16500:
	line	2040
	
l12823:; BSR set to: 3

	movlb	2	; () banked
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
	goto	l12867
	line	2041
	
l12825:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16511
	goto	u16510

u16511:
	goto	l12829
u16510:
	line	2042
	
l12827:; BSR set to: 3

	movlb	2	; () banked
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
	goto	l12867
	line	2043
	
l12829:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16521
	goto	u16520

u16521:
	goto	l12833
u16520:
	line	2044
	
l12831:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val)
	movff	postdec2,(menu_handle_button@current_val+1)
	goto	l12867
	line	2045
	
l12833:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16531
	goto	u16530

u16531:
	goto	l1195
u16530:
	line	2046
	
l12835:; BSR set to: 3

	movlw	high(032h)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(032h)
	movwf	((menu_handle_button@current_val))&0ffh
	goto	l12867
	line	2047
	
l1195:; BSR set to: 3

	goto	l12867
	line	2048
	
l12837:; BSR set to: 1

		decf	((menu_handle_button@sensor_type_1566))&0ffh,w
	btfss	status,2
	goto	u16541
	goto	u16540

u16541:
	goto	l12851
u16540:
	line	2050
	
l12839:; BSR set to: 1

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16551
	goto	u16550

u16551:
	goto	l12843
u16550:
	goto	l12823
	line	2052
	
l12843:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16561
	goto	u16560

u16561:
	goto	l12847
u16560:
	goto	l12827
	line	2054
	
l12847:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16571
	goto	u16570

u16571:
	goto	l1195
u16570:
	goto	l12831
	line	2057
	
l12851:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1566))&0ffh,w
	btfss	status,2
	goto	u16581
	goto	u16580

u16581:
	goto	l12867
u16580:
	
l12853:; BSR set to: 1

	movf	((menu_handle_button@flow_type_1567))&0ffh,w
	btfss	status,2
	goto	u16591
	goto	u16590
u16591:
	goto	l12867
u16590:
	line	2059
	
l12855:; BSR set to: 1

		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16601
	goto	u16600

u16601:
	goto	l12859
u16600:
	goto	l12823
	line	2061
	
l12859:; BSR set to: 3

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16611
	goto	u16610

u16611:
	goto	l12863
u16610:
	goto	l12827
	line	2063
	
l12863:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16621
	goto	u16620

u16621:
	goto	l1195
u16620:
	line	2064
	
l12865:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+020h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+020h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val)
	movff	postdec2,(menu_handle_button@current_val+1)
	line	2067
	
l12867:
	movff	(menu_handle_button@current_val),(c:init_numeric_editor@value)
	movff	(menu_handle_button@current_val+1),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	2068
	
l12869:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2069
	
l12871:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l12505
	line	2073
	
l12875:
	movff	(menu_handle_button@sensor_type_1566),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type_1567),(c:is_time_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u16631
	goto	u16630
u16631:
	goto	l12921
u16630:
	line	2075
	
l12877:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val_1570+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val_1570))&0ffh
	line	2078
	movf	((menu_handle_button@sensor_type_1566))&0ffh,w
	btfss	status,2
	goto	u16641
	goto	u16640
u16641:
	goto	l12891
u16640:
	line	2080
	
l12879:; BSR set to: 1

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16651
	goto	u16650

u16651:
	goto	l12883
u16650:
	line	2081
	
l12881:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1570)
	movff	postdec2,(menu_handle_button@current_val_1570+1)
	goto	l12909
	line	2082
	
l12883:; BSR set to: 3

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16661
	goto	u16660

u16661:
	goto	l12887
u16660:
	line	2083
	
l12885:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1570)
	movff	postdec2,(menu_handle_button@current_val_1570+1)
	goto	l12909
	line	2084
	
l12887:; BSR set to: 3

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16671
	goto	u16670

u16671:
	goto	l1217
u16670:
	line	2085
	
l12889:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1570)
	movff	postdec2,(menu_handle_button@current_val_1570+1)
	goto	l12909
	line	2086
	
l1217:; BSR set to: 3

	goto	l12909
	line	2087
	
l12891:; BSR set to: 1

		decf	((menu_handle_button@sensor_type_1566))&0ffh,w
	btfss	status,2
	goto	u16681
	goto	u16680

u16681:
	goto	l12897
u16680:
	line	2089
	
l12893:; BSR set to: 1

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16691
	goto	u16690

u16691:
	goto	l12909
u16690:
	goto	l12881
	line	2092
	
l12897:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1566))&0ffh,w
	btfss	status,2
	goto	u16701
	goto	u16700

u16701:
	goto	l12909
u16700:
	line	2095
	
l12899:; BSR set to: 1

	movf	((menu_handle_button@flow_type_1567))&0ffh,w
	btfss	status,2
	goto	u16711
	goto	u16710
u16711:
	goto	l12903
u16710:
	
l12901:; BSR set to: 1

		movlw	7
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u16721
	goto	u16720

u16721:
	goto	l12907
u16720:
	
l12903:
	movlb	1	; () banked
		decf	((menu_handle_button@flow_type_1567))&0ffh,w
	btfss	status,2
	goto	u16731
	goto	u16730

u16731:
	goto	l12909
u16730:
	
l12905:; BSR set to: 1

		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16741
	goto	u16740

u16741:
	goto	l12909
u16740:
	line	2096
	
l12907:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1570)
	movff	postdec2,(menu_handle_button@current_val_1570+1)
	line	2100
	
l12909:
		movlw	low(menu_handle_button@buf_1571)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1571)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_273)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_273)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@current_val_1570),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@current_val_1570+1),1+((c:?_sprintf)+04h)
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2101
	
l12911:
		movlw	low(menu_handle_button@buf_1571)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1571)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2103
	
l12913:
	movff	(menu_handle_button@current_val_1570),(c:init_time_editor@value_seconds)
	movff	(menu_handle_button@current_val_1570+1),(c:init_time_editor@value_seconds+1)
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	goto	l12869
	line	2109
	
l12921:
	movff	(menu_handle_button@sensor_type_1566),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type_1567),(c:is_option_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u16751
	goto	u16750
u16751:
	goto	l1081
u16750:
	line	2111
	
l12923:
		movlw	low(_original_value)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_original_value)
	movwf	((c:strcpy@to+1))^00h,c

	movlb	3	; () banked
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
	line	2113
	
l12925:
	movff	(menu_handle_button@sensor_type_1566),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type_1567),(c:get_option_edit_flag@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1574)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1574+1)
	line	2114
	
l12927:
	movff	(menu_handle_button@sensor_type_1566),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type_1567),(c:get_item_options_for_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1575)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1575+1)
	line	2116
	
l12929:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag_1574))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1574+1))&0ffh,w
	btfsc	status,2
	goto	u16761
	goto	u16760

u16761:
	goto	l12943
u16760:
	
l12931:; BSR set to: 1

	movf	((menu_handle_button@opts_1575))&0ffh,w
iorwf	((menu_handle_button@opts_1575+1))&0ffh,w
	btfsc	status,2
	goto	u16771
	goto	u16770

u16771:
	goto	l12943
u16770:
	line	2119
	
l12933:; BSR set to: 1

	movlw	low(0)
	movwf	((menu_handle_button@i))&0ffh
	goto	l12941
	line	2121
	
l12935:; BSR set to: 1

	movlb	3	; () banked
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
	movlb	1	; () banked
	movf	((menu_handle_button@i))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(??_menu_handle_button+0+0)^00h,c,w
	addwf	((menu_handle_button@opts_1575))&0ffh,w
	movwf	(??_menu_handle_button+2+0)^00h,c
	movf	(??_menu_handle_button+0+1)^00h,c,w
	addwfc	((menu_handle_button@opts_1575+1))&0ffh,w
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
	goto	u16781
	goto	u16780

u16781:
	goto	l12939
u16780:
	line	2123
	
l12937:
	movff	(menu_handle_button@edit_flag_1574),fsr2l
	movff	(menu_handle_button@edit_flag_1574+1),fsr2h
	movff	(menu_handle_button@i),indf2

	line	2124
	goto	l12943
	line	2119
	
l12939:
	movlb	1	; () banked
	incf	((menu_handle_button@i))&0ffh
	
l12941:; BSR set to: 1

	movlw	01h
	addwf	((menu_handle_button@opts_1575))&0ffh,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	0
	addwfc	((menu_handle_button@opts_1575+1))&0ffh,w
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
	goto	u16791
	goto	u16790

u16791:
	goto	l12935
u16790:
	line	2129
	
l12943:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2130
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l12505
	line	2135
	
l12947:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16801
	goto	u16800

u16801:
	goto	l12981
u16800:
	line	2137
	
l12949:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2139
	
l12951:
		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16811
	goto	u16810

u16811:
	goto	l12957
u16810:
	line	2141
	
l12953:; BSR set to: 3

	movlw	low(0)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2142
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2143
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2144
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2145
	
l12955:; BSR set to: 3

	call	_menu_draw_options	;wreg free
	line	2146
	goto	l1087
	line	2147
	
l12957:; BSR set to: 3

		movlw	03h-0
	cpfslt	((_menu))&0ffh
	goto	u16821
	goto	u16820

u16821:
	goto	l12969
u16820:
	line	2149
	
l12959:; BSR set to: 3

	movf	((_menu))&0ffh,w
	
	call	_rebuild_input_menu
	line	2150
	
l12961:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2151
	
l12963:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2152
	
l12965:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2153
	
l12967:; BSR set to: 3

	call	_menu_draw_input	;wreg free
	line	2154
	goto	l1087
	line	2155
	
l12969:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16831
	goto	u16830

u16831:
	goto	l1081
u16830:
	line	2157
	
l12971:; BSR set to: 3

	call	_rebuild_clock_menu	;wreg free
	line	2158
	
l12973:
	movlw	low(03h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2159
	
l12975:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2160
	
l12977:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2161
	
l12979:
	call	_menu_draw_clock	;wreg free
	goto	l1087
	line	2164
	
l12981:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16841
	goto	u16840

u16841:
	goto	l1087
u16840:
	line	2168
	
l12983:; BSR set to: 2

		movlw	05h-1
	movlb	3	; () banked
	cpfsgt	((_menu))&0ffh
	goto	u16851
	goto	u16850

u16851:
	goto	l12987
u16850:
	
l12985:; BSR set to: 3

	movlw	high(0)
	movlb	1	; () banked
	movwf	((_menu_handle_button$1583+1))&0ffh
	movlw	low(0)
	movwf	((_menu_handle_button$1583))&0ffh
	goto	l12989
	
l12987:; BSR set to: 3

	movf	((_menu))&0ffh,w
	mullw	05h
	movlw	low(_clock_menu+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_clock_menu+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movf	((??_menu_handle_button+0+0))^00h,c,w
	movlb	1	; () banked
	movwf	((_menu_handle_button$1583))&0ffh
	clrf	((_menu_handle_button$1583+1))&0ffh
	
l12989:; BSR set to: 1

		movlw	low(menu_handle_button@buf_1581)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1581)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_274)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_274)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu_handle_button$1583),0+((c:?_sprintf)+06h)
	movff	(_menu_handle_button$1583+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	2169
	
l12991:
		movlw	low(menu_handle_button@buf_1581)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1581)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2171
		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16861
	goto	u16860

u16861:
	goto	l13005
u16860:
	goto	l12801
	line	2181
	
l13005:; BSR set to: 3

	movf	((_menu))&0ffh,w
	mullw	05h
	movlw	low(_clock_menu+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_clock_menu+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfsc	status,2
	goto	u16871
	goto	u16870
u16871:
	goto	l13045
u16870:
	line	2183
	
l13007:; BSR set to: 3

		movlw	low(STR_275)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_275)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2186
	
l13009:
		movlw	low(_original_value)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_original_value)
	movwf	((c:strcpy@to+1))^00h,c

	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	mullw	05h
	movlw	low(_clock_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_clock_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strcpy@from)
	movff	postdec2,(c:strcpy@from+1)
	call	_strcpy	;wreg free
	line	2189
	
l13011:
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16881
	goto	u16880
u16881:
	goto	l13015
u16880:
	line	2191
	
l13013:; BSR set to: 3

		movff	0+(_clock_menu+02h),(c:strcmp@s1)
	movff	1+(_clock_menu+02h),(c:strcmp@s1+1)

		movlw	low(STR_276)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_276)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u16891
	goto	u16890

u16891:
	movlw	1
	goto	u16900
u16890:
	movlw	0
u16900:
	movwf	((c:_enable_edit_flag))^00h,c
	line	2192
	goto	l13037
	line	2193
	
l13015:; BSR set to: 3

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16911
	goto	u16910

u16911:
	goto	l13027
u16910:
	line	2195
	
l13017:; BSR set to: 3

		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_277)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_277)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u16921
	goto	u16920

u16921:
	goto	l13021
u16920:
	line	2196
	
l13019:
	movlw	low(0)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l13037
	line	2197
	
l13021:
		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_278)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_278)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u16931
	goto	u16930

u16931:
	goto	l13025
u16930:
	line	2198
	
l13023:
	movlw	low(01h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l13037
	line	2200
	
l13025:
	movlw	low(02h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l13037
	line	2202
	
l13027:; BSR set to: 3

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16941
	goto	u16940

u16941:
	goto	l13033
u16940:
	line	2205
	
l13029:; BSR set to: 3

	movff	0+(_system_config+07h),0+(_menu+0Dh)
	clrf	(1+(_menu+0Dh))&0ffh
	line	2206
	
l13031:; BSR set to: 3

	movff	0+(_system_config+07h),(c:init_time_editor@value_seconds)
	clrf	((c:init_time_editor@value_seconds+1))^00h,c
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	line	2207
	goto	l13037
	line	2208
	
l13033:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16951
	goto	u16950

u16951:
	goto	l1261
u16950:
	line	2210
	
l13035:; BSR set to: 3

		movff	0+(_clock_menu+011h),(c:strcmp@s1)
	movff	1+(_clock_menu+011h),(c:strcmp@s1+1)

		movlw	low(STR_279)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_279)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u16961
	goto	u16960

u16961:
	movlw	1
	goto	u16970
u16960:
	movlw	0
u16970:
	movwf	((c:_display_edit_flag))^00h,c
	goto	l13037
	line	2213
	
l1261:; BSR set to: 3

	
l13037:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2214
	
l13039:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2215
	
l13041:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l12979
	line	2222
	
l13045:; BSR set to: 3

		movlw	low(STR_280)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_280)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1087
	line	2226
	
l13047:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u16981
	goto	u16980

u16981:
	goto	l1087
u16980:
	goto	l12769
	line	2233
	
l1087:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_button
	__end_of_menu_handle_button:
	signat	_menu_handle_button,4217
	global	_trigger_relay_pulse

;; *************** function _trigger_relay_pulse *****************
;; Defined at:
;;		line 119 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  latch_mode      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  latch_mode      1   60[BANK0 ] unsigned char 
;;  buf            60    0[BANK0 ] unsigned char [60]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/3
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      61       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0      61       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       61 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_sprintf
;;		_uart_println
;; This function is called by:
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text16,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	119
global __ptext16
__ptext16:
psect	text16
	file	"src\main.c"
	line	119
	
_trigger_relay_pulse:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((trigger_relay_pulse@latch_mode))&0ffh
	line	124
	
l11021:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_1)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_1)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(trigger_relay_pulse@latch_mode),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	125
	
l11023:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	127
	
l11025:
	movlb	0	; () banked
	movf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u13581
	goto	u13580
u13581:
	goto	l152
u13580:
	line	129
	
l11027:; BSR set to: 0

	movlw	low(01h)
	movwf	((_relay_state))&0ffh	;volatile
	line	131
	movf	((trigger_relay_pulse@latch_mode))&0ffh,w
	btfsc	status,2
	goto	u13591
	goto	u13590
u13591:
	goto	l11033
u13590:
	line	134
	
l11029:; BSR set to: 0

	movlw	high(0)
	movlb	2	; () banked
	movwf	((_relay_counter+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_relay_counter))&0ffh	;volatile
	line	135
	
l11031:; BSR set to: 2

		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	136
	goto	l11039
	line	140
	
l11033:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	mullw	064h
	movff	prodl,(_relay_counter)	;volatile
	movff	prodh,(_relay_counter+1)	;volatile
	line	141
	
l11035:; BSR set to: 5

		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_3)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_3)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+07h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	142
	
l11037:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	145
	
l11039:
	bcf	((c:3979))^0f00h,c,1	;volatile
	line	147
	
l152:
	return	;funcret
	callstack 0
GLOBAL	__end_of_trigger_relay_pulse
	__end_of_trigger_relay_pulse:
	signat	_trigger_relay_pulse,4217
	global	_rebuild_input_menu

;; *************** function _rebuild_input_menu *****************
;; Defined at:
;;		line 641 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  input_num       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  input_num       1   88[BANK0 ] unsigned char 
;;  buf            50    0[BANK0 ] unsigned char [50]
;;  sensor          1   83[BANK0 ] unsigned char 
;;  flow_type_va    1   82[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3E/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      89       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1      89       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       90 bytes
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
psect	text17,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	641
global __ptext17
__ptext17:
psect	text17
	file	"src\menu.c"
	line	641
	
_rebuild_input_menu:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((rebuild_input_menu@input_num))&0ffh
	line	644
	
l11533:
	movff	(rebuild_input_menu@input_num),(_current_input)
	line	647
	
l11535:
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
	line	648
	
l11537:; BSR set to: 0

	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((rebuild_input_menu@flow_type_val))&0ffh
	line	651
	
l11539:; BSR set to: 0

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
	goto	u14501
	goto	u14500
u14501:
	goto	l11543
u14500:
	
l11541:; BSR set to: 0

		movlw	low(STR_145)
	movwf	((_rebuild_input_menu$1238))&0ffh
	movlw	high(STR_145)
	movwf	((_rebuild_input_menu$1238+1))&0ffh

	goto	l11545
	
l11543:; BSR set to: 0

		movlw	low(STR_144)
	movwf	((_rebuild_input_menu$1238))&0ffh
	movlw	high(STR_144)
	movwf	((_rebuild_input_menu$1238+1))&0ffh

	
l11545:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_143)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_143)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_input_menu$1238),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$1238+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	653
	
l11547:
	movlb	0	; () banked
	movf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u14511
	goto	u14510
u14511:
	goto	l11653
u14510:
	line	655
	
l11549:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_146)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_146)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	656
	
l11551:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_147)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_147)
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
	line	657
	
l11553:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_148)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_148)
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
	line	658
	
l11555:
		movlw	low(_value_hi_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_hi_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_149)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_149)
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
	line	661
	
l11557:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3028)
	movff	1+?___lwdiv,(_rebuild_input_menu$3028+1)
	
l11559:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3029)
	movff	1+?___lwmod,(_rebuild_input_menu$3029+1)
	
l11561:
		movlw	low(_value_highbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_highbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_150)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_150)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3028),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3028+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3029),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3029+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	662
	
l11563:
		movlw	low(_value_low_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_151)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_151)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	high(032h)
	movwf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(032h)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	665
	
l11565:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3028)
	movff	1+?___lwdiv,(_rebuild_input_menu$3028+1)
	
l11567:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3029)
	movff	1+?___lwmod,(_rebuild_input_menu$3029+1)
	
l11569:
		movlw	low(_value_plpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_plpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_152)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_152)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3028),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3028+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3029),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3029+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	668
	
l11571:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3028)
	movff	1+?___lwdiv,(_rebuild_input_menu$3028+1)
	
l11573:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3029)
	movff	1+?___lwmod,(_rebuild_input_menu$3029+1)
	
l11575:
		movlw	low(_value_slpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_slpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_153)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_153)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3028),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3028+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3029),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3029+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	671
	
l11577:
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
	goto	u14521
	goto	u14520
u14521:
	goto	l11585
u14520:
	
l11579:; BSR set to: 0

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
	goto	u14531
	goto	u14530

u14531:
	goto	l11583
u14530:
	
l11581:; BSR set to: 0

		movlw	low(STR_156)
	movwf	((_rebuild_input_menu$1253))&0ffh
	movlw	high(STR_156)
	movwf	((_rebuild_input_menu$1253+1))&0ffh

	goto	l657
	
l11583:; BSR set to: 0

		movlw	low(STR_155)
	movwf	((_rebuild_input_menu$1253))&0ffh
	movlw	high(STR_155)
	movwf	((_rebuild_input_menu$1253+1))&0ffh

	
l657:; BSR set to: 0

		movff	(_rebuild_input_menu$1253),(_rebuild_input_menu$1252)
	movff	(_rebuild_input_menu$1253+1),(_rebuild_input_menu$1252+1)

	goto	l11587
	
l11585:; BSR set to: 0

		movlw	low(STR_154)
	movwf	((_rebuild_input_menu$1252))&0ffh
	movlw	high(STR_154)
	movwf	((_rebuild_input_menu$1252+1))&0ffh

	
l11587:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1252),(c:strcpy@from)
	movff	(_rebuild_input_menu$1252+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	673
	
l11589:
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
	goto	u14541
	goto	u14540
u14541:
	goto	l11597
u14540:
	
l11591:; BSR set to: 0

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
	goto	u14551
	goto	u14550

u14551:
	goto	l11595
u14550:
	
l11593:; BSR set to: 0

		movlw	low(STR_159)
	movwf	((_rebuild_input_menu$1260))&0ffh
	movlw	high(STR_159)
	movwf	((_rebuild_input_menu$1260+1))&0ffh

	goto	l665
	
l11595:; BSR set to: 0

		movlw	low(STR_158)
	movwf	((_rebuild_input_menu$1260))&0ffh
	movlw	high(STR_158)
	movwf	((_rebuild_input_menu$1260+1))&0ffh

	
l665:; BSR set to: 0

		movff	(_rebuild_input_menu$1260),(_rebuild_input_menu$1259)
	movff	(_rebuild_input_menu$1260+1),(_rebuild_input_menu$1259+1)

	goto	l11599
	
l11597:; BSR set to: 0

		movlw	low(STR_157)
	movwf	((_rebuild_input_menu$1259))&0ffh
	movlw	high(STR_157)
	movwf	((_rebuild_input_menu$1259+1))&0ffh

	
l11599:; BSR set to: 0

		movlw	low(_value_rlyplp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyplp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1259),(c:strcpy@from)
	movff	(_rebuild_input_menu$1259+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	675
	
l11601:
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
	goto	u14561
	goto	u14560
u14561:
	goto	l11609
u14560:
	
l11603:; BSR set to: 0

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
	goto	u14571
	goto	u14570

u14571:
	goto	l11607
u14570:
	
l11605:; BSR set to: 0

		movlw	low(STR_162)
	movwf	((_rebuild_input_menu$1267))&0ffh
	movlw	high(STR_162)
	movwf	((_rebuild_input_menu$1267+1))&0ffh

	goto	l673
	
l11607:; BSR set to: 0

		movlw	low(STR_161)
	movwf	((_rebuild_input_menu$1267))&0ffh
	movlw	high(STR_161)
	movwf	((_rebuild_input_menu$1267+1))&0ffh

	
l673:; BSR set to: 0

		movff	(_rebuild_input_menu$1267),(_rebuild_input_menu$1266)
	movff	(_rebuild_input_menu$1267+1),(_rebuild_input_menu$1266+1)

	goto	l11611
	
l11609:; BSR set to: 0

		movlw	low(STR_160)
	movwf	((_rebuild_input_menu$1266))&0ffh
	movlw	high(STR_160)
	movwf	((_rebuild_input_menu$1266+1))&0ffh

	
l11611:; BSR set to: 0

		movlw	low(_value_rlyslp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyslp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1266),(c:strcpy@from)
	movff	(_rebuild_input_menu$1266+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	676
	
l11613:
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
	goto	u14581
	goto	u14580
u14581:
	goto	l11617
u14580:
	
l11615:; BSR set to: 0

		movlw	low(STR_164)
	movwf	((_rebuild_input_menu$1271))&0ffh
	movlw	high(STR_164)
	movwf	((_rebuild_input_menu$1271+1))&0ffh

	goto	l11619
	
l11617:; BSR set to: 0

		movlw	low(STR_163)
	movwf	((_rebuild_input_menu$1271))&0ffh
	movlw	high(STR_163)
	movwf	((_rebuild_input_menu$1271+1))&0ffh

	
l11619:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1271),(c:strcpy@from)
	movff	(_rebuild_input_menu$1271+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	679
	
l11621:
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
	line	682
	
l11623:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	683
	
l11625:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	684
	
l11627:; BSR set to: 3

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	685
	
l11629:; BSR set to: 3

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	686
	
l11631:; BSR set to: 3

		movlw	low(_value_hi_pressure)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_hi_pressure)
	movwf	(1+(_input_menu+016h))&0ffh

	line	687
	
l11633:; BSR set to: 3

		movlw	low(_value_highbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_highbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	688
	
l11635:; BSR set to: 3

		movlw	low(_value_low_pressure)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_pressure)
	movwf	(1+(_input_menu+020h))&0ffh

	line	689
	
l11637:; BSR set to: 3

		movlw	low(_value_plpbp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_plpbp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	690
	
l11639:; BSR set to: 3

		movlw	low(_value_slpbp)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_slpbp)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	691
	
l11641:; BSR set to: 3

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	692
	
l11643:; BSR set to: 3

		movlw	low(_value_rlyplp)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_rlyplp)
	movwf	(1+(_input_menu+034h))&0ffh

	line	693
	
l11645:; BSR set to: 3

		movlw	low(_value_rlyslp)
	movwf	(0+(_input_menu+039h))&0ffh
	movlw	high(_value_rlyslp)
	movwf	(1+(_input_menu+039h))&0ffh

	line	694
	
l11647:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+03Eh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+03Eh))&0ffh

	line	695
	
l11649:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+043h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+043h))&0ffh

	line	697
	
l11651:; BSR set to: 3

	movlw	low(0Eh)
	movwf	(0+(_menu+02h))&0ffh
	line	698
	goto	l11819
	line	699
	
l11653:; BSR set to: 0

		decf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u14591
	goto	u14590

u14591:
	goto	l11711
u14590:
	line	701
	
l11655:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_165)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_165)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	702
	
l11657:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_166)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_166)
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
	line	703
	
l11659:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_167)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_167)
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
	line	704
	
l11661:
		movlw	low(_value_high_temp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_temp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_168)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_168)
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
	line	707
	
l11663:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3028)
	movff	1+?___lwdiv,(_rebuild_input_menu$3028+1)
	
l11665:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3029)
	movff	1+?___lwmod,(_rebuild_input_menu$3029+1)
	
l11667:
		movlw	low(_value_high_tbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_tbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_169)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_169)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3028),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3028+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3029),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3029+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	709
	
l11669:
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
	goto	u14601
	goto	u14600
u14601:
	goto	l11677
u14600:
	
l11671:; BSR set to: 0

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
	goto	u14611
	goto	u14610

u14611:
	goto	l11675
u14610:
	
l11673:; BSR set to: 0

		movlw	low(STR_172)
	movwf	((_rebuild_input_menu$1286))&0ffh
	movlw	high(STR_172)
	movwf	((_rebuild_input_menu$1286+1))&0ffh

	goto	l687
	
l11675:; BSR set to: 0

		movlw	low(STR_171)
	movwf	((_rebuild_input_menu$1286))&0ffh
	movlw	high(STR_171)
	movwf	((_rebuild_input_menu$1286+1))&0ffh

	
l687:; BSR set to: 0

		movff	(_rebuild_input_menu$1286),(_rebuild_input_menu$1285)
	movff	(_rebuild_input_menu$1286+1),(_rebuild_input_menu$1285+1)

	goto	l11679
	
l11677:; BSR set to: 0

		movlw	low(STR_170)
	movwf	((_rebuild_input_menu$1285))&0ffh
	movlw	high(STR_170)
	movwf	((_rebuild_input_menu$1285+1))&0ffh

	
l11679:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1285),(c:strcpy@from)
	movff	(_rebuild_input_menu$1285+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	710
	
l11681:
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
	goto	u14621
	goto	u14620
u14621:
	goto	l11685
u14620:
	
l11683:; BSR set to: 0

		movlw	low(STR_174)
	movwf	((_rebuild_input_menu$1290))&0ffh
	movlw	high(STR_174)
	movwf	((_rebuild_input_menu$1290+1))&0ffh

	goto	l11687
	
l11685:; BSR set to: 0

		movlw	low(STR_173)
	movwf	((_rebuild_input_menu$1290))&0ffh
	movlw	high(STR_173)
	movwf	((_rebuild_input_menu$1290+1))&0ffh

	
l11687:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1290),(c:strcpy@from)
	movff	(_rebuild_input_menu$1290+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	713
	
l11689:
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
	line	716
	
l11691:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	717
	
l11693:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	718
	
l11695:; BSR set to: 3

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	719
	
l11697:; BSR set to: 3

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	720
	
l11699:; BSR set to: 3

		movlw	low(_value_high_temp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_high_temp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	721
	
l11701:; BSR set to: 3

		movlw	low(_value_high_tbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_high_tbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	722
	
l11703:; BSR set to: 3

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+020h))&0ffh

	line	723
	
l11705:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+025h))&0ffh

	line	724
	
l11707:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	726
	
l11709:; BSR set to: 3

	movlw	low(09h)
	movwf	(0+(_menu+02h))&0ffh
	line	727
	goto	l11819
	line	728
	
l11711:; BSR set to: 0

		movlw	2
	xorwf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u14631
	goto	u14630

u14631:
	goto	l11819
u14630:
	line	730
	
l11713:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_175)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_175)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	731
	
l11715:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfsc	status,2
	goto	u14641
	goto	u14640
u14641:
	goto	l11719
u14640:
	
l11717:; BSR set to: 0

		movlw	low(STR_177)
	movwf	((_rebuild_input_menu$1295))&0ffh
	movlw	high(STR_177)
	movwf	((_rebuild_input_menu$1295+1))&0ffh

	goto	l11721
	
l11719:; BSR set to: 0

		movlw	low(STR_176)
	movwf	((_rebuild_input_menu$1295))&0ffh
	movlw	high(STR_176)
	movwf	((_rebuild_input_menu$1295+1))&0ffh

	
l11721:; BSR set to: 0

		movlw	low(_value_flow_type)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_type)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1295),(c:strcpy@from)
	movff	(_rebuild_input_menu$1295+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	732
	
l11723:
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
	goto	u14651
	goto	u14650
u14651:
	goto	l11727
u14650:
	
l11725:; BSR set to: 0

		movlw	low(STR_179)
	movwf	((_rebuild_input_menu$1299))&0ffh
	movlw	high(STR_179)
	movwf	((_rebuild_input_menu$1299+1))&0ffh

	goto	l11729
	
l11727:; BSR set to: 0

		movlw	low(STR_178)
	movwf	((_rebuild_input_menu$1299))&0ffh
	movlw	high(STR_178)
	movwf	((_rebuild_input_menu$1299+1))&0ffh

	
l11729:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1299),(c:strcpy@from)
	movff	(_rebuild_input_menu$1299+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	734
	
l11731:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Bh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Bh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfsc	status,2
	goto	u14661
	goto	u14660
u14661:
	goto	l11739
u14660:
	
l11733:; BSR set to: 0

	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Bh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Bh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	decf	postinc2,w
	btfsc	status,2
	goto	u14671
	goto	u14670

u14671:
	goto	l11737
u14670:
	
l11735:; BSR set to: 0

		movlw	low(STR_182)
	movwf	((_rebuild_input_menu$1306))&0ffh
	movlw	high(STR_182)
	movwf	((_rebuild_input_menu$1306+1))&0ffh

	goto	l709
	
l11737:; BSR set to: 0

		movlw	low(STR_181)
	movwf	((_rebuild_input_menu$1306))&0ffh
	movlw	high(STR_181)
	movwf	((_rebuild_input_menu$1306+1))&0ffh

	
l709:; BSR set to: 0

		movff	(_rebuild_input_menu$1306),(_rebuild_input_menu$1305)
	movff	(_rebuild_input_menu$1306+1),(_rebuild_input_menu$1305+1)

	goto	l11741
	
l11739:; BSR set to: 0

		movlw	low(STR_180)
	movwf	((_rebuild_input_menu$1305))&0ffh
	movlw	high(STR_180)
	movwf	((_rebuild_input_menu$1305+1))&0ffh

	
l11741:; BSR set to: 0

		movlw	low(_value_rlylow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlylow)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1305),(c:strcpy@from)
	movff	(_rebuild_input_menu$1305+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	736
	
l11743:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfss	status,2
	goto	u14681
	goto	u14680
u14681:
	goto	l11791
u14680:
	line	738
	
l11745:; BSR set to: 0

	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfsc	status,2
	goto	u14691
	goto	u14690
u14691:
	goto	l11749
u14690:
	
l11747:; BSR set to: 0

		movlw	low(STR_184)
	movwf	((_rebuild_input_menu$1310))&0ffh
	movlw	high(STR_184)
	movwf	((_rebuild_input_menu$1310+1))&0ffh

	goto	l11751
	
l11749:; BSR set to: 0

		movlw	low(STR_183)
	movwf	((_rebuild_input_menu$1310))&0ffh
	movlw	high(STR_183)
	movwf	((_rebuild_input_menu$1310+1))&0ffh

	
l11751:; BSR set to: 0

		movlw	low(_value_flow_units)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_units)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1310),(c:strcpy@from)
	movff	(_rebuild_input_menu$1310+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	739
	
l11753:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_185)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_185)
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
	line	740
	
l11755:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_186)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_186)
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
	line	741
	
l11757:
		movlw	low(_value_low_flow)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_187)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_187)
	movwf	((c:sprintf@f+1))^00h,c

	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+020h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+020h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+04h)
	movff	postdec2,1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	744
	
l11759:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:___lwdiv@dividend)
	movff	postdec2,(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(_rebuild_input_menu$3028)
	movff	1+?___lwdiv,(_rebuild_input_menu$3028+1)
	
l11761:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:___lwmod@dividend)
	movff	postdec2,(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movff	0+?___lwmod,(_rebuild_input_menu$3029)
	movff	1+?___lwmod,(_rebuild_input_menu$3029+1)
	
l11763:
		movlw	low(_value_low_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_188)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_188)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3028),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3028+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3029),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3029+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	747
	
l11765:
		movlw	low(_input_menu)
	movwf	((c:memcpy@d1))^00h,c
	movlw	high(_input_menu)
	movwf	((c:memcpy@d1+1))^00h,c

		movlw	low(_flow_analog_template)
	movwf	((c:memcpy@s1))^00h,c
	movlw	high(_flow_analog_template)
	movwf	((c:memcpy@s1+1))^00h,c

	movlw	high(037h)
	movwf	((c:memcpy@n+1))^00h,c
	movlw	low(037h)
	movwf	((c:memcpy@n))^00h,c
	call	_memcpy	;wreg free
	line	750
	
l11767:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	751
	
l11769:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	752
	
l11771:; BSR set to: 3

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	753
	
l11773:; BSR set to: 3

		movlw	low(_value_flow_units)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_flow_units)
	movwf	(1+(_input_menu+011h))&0ffh

	line	754
	
l11775:; BSR set to: 3

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+016h))&0ffh

	line	755
	
l11777:; BSR set to: 3

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	756
	
l11779:; BSR set to: 3

		movlw	low(_value_low_flow)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_flow)
	movwf	(1+(_input_menu+020h))&0ffh

	line	757
	
l11781:; BSR set to: 3

		movlw	low(_value_low_flow_bp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_low_flow_bp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	758
	
l11783:; BSR set to: 3

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	759
	
l11785:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	760
	
l11787:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+034h))&0ffh

	line	762
	
l11789:; BSR set to: 3

	movlw	low(0Bh)
	movwf	(0+(_menu+02h))&0ffh
	line	763
	goto	l11819
	line	766
	
l11791:; BSR set to: 0

		movlw	low(_value_no_flow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_no_flow)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_189)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_189)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	769
	
l11793:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:___lwdiv@dividend)
	movff	postdec2,(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(_rebuild_input_menu$3028)
	movff	1+?___lwdiv,(_rebuild_input_menu$3028+1)
	
l11795:
	movlb	0	; () banked
	movf	((rebuild_input_menu@input_num))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:___lwmod@dividend)
	movff	postdec2,(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movff	0+?___lwmod,(_rebuild_input_menu$3029)
	movff	1+?___lwmod,(_rebuild_input_menu$3029+1)
	
l11797:
		movlw	low(_value_no_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_no_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_190)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_190)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3028),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3028+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3029),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3029+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	772
	
l11799:
		movlw	low(_input_menu)
	movwf	((c:memcpy@d1))^00h,c
	movlw	high(_input_menu)
	movwf	((c:memcpy@d1+1))^00h,c

		movlw	low(_flow_digital_template)
	movwf	((c:memcpy@s1))^00h,c
	movlw	high(_flow_digital_template)
	movwf	((c:memcpy@s1+1))^00h,c

	movlw	high(028h)
	movwf	((c:memcpy@n+1))^00h,c
	movlw	low(028h)
	movwf	((c:memcpy@n))^00h,c
	call	_memcpy	;wreg free
	line	775
	
l11801:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	776
	
l11803:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	777
	
l11805:; BSR set to: 3

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	778
	
l11807:; BSR set to: 3

		movlw	low(_value_no_flow)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_no_flow)
	movwf	(1+(_input_menu+011h))&0ffh

	line	779
	
l11809:; BSR set to: 3

		movlw	low(_value_no_flow_bp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_no_flow_bp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	780
	
l11811:; BSR set to: 3

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	781
	
l11813:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+020h))&0ffh

	line	782
	
l11815:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+025h))&0ffh

	line	784
	
l11817:; BSR set to: 3

	movlw	low(08h)
	movwf	(0+(_menu+02h))&0ffh
	line	791
	
l11819:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_191)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_191)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(rebuild_input_menu@sensor),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(rebuild_input_menu@flow_type_val),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	792
	
l11821:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	793
	
l716:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_input_menu
	__end_of_rebuild_input_menu:
	signat	_rebuild_input_menu,4217
	global	_rebuild_clock_menu

;; *************** function _rebuild_clock_menu *****************
;; Defined at:
;;		line 1303 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            50    0[BANK0 ] unsigned char [50]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/3
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      56       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2      56       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       58 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		___lbdiv
;;		___lbmod
;;		_memcpy
;;		_sprintf
;;		_strcpy
;;		_uart_println
;; This function is called by:
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text18,class=CODE,space=0,reloc=2,group=0
	line	1303
global __ptext18
__ptext18:
psect	text18
	file	"src\menu.c"
	line	1303
	
_rebuild_clock_menu:
;incstack = 0
	callstack 24
	line	1309
	
l11869:; BSR set to: 3

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_229)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_229)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_system_config+06h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1310
	
l11871:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1313
	
l11873:
	movlb	5	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u14861
	goto	u14860
u14861:
	goto	l11877
u14860:
	
l11875:; BSR set to: 5

		movlw	low(STR_232)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1458))&0ffh
	movlw	high(STR_232)
	movwf	((_rebuild_clock_menu$1458+1))&0ffh

	goto	l11879
	
l11877:; BSR set to: 5

		movlw	low(STR_231)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1458))&0ffh
	movlw	high(STR_231)
	movwf	((_rebuild_clock_menu$1458+1))&0ffh

	
l11879:; BSR set to: 0

		movlw	low(_value_clock_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_clock_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_230)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_230)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_clock_menu$1458),0+((c:?_sprintf)+04h)
	movff	(_rebuild_clock_menu$1458+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	1315
	
l11881:
	movlb	5	; () banked
	movf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u14871
	goto	u14870
u14871:
	goto	l11889
u14870:
	
l11883:; BSR set to: 5

		decf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u14881
	goto	u14880

u14881:
	goto	l11887
u14880:
	
l11885:; BSR set to: 5

		movlw	low(STR_235)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1465))&0ffh
	movlw	high(STR_235)
	movwf	((_rebuild_clock_menu$1465+1))&0ffh

	goto	l973
	
l11887:; BSR set to: 5

		movlw	low(STR_234)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1465))&0ffh
	movlw	high(STR_234)
	movwf	((_rebuild_clock_menu$1465+1))&0ffh

	
l973:; BSR set to: 0

		movff	(_rebuild_clock_menu$1465),(_rebuild_clock_menu$1464)
	movff	(_rebuild_clock_menu$1465+1),(_rebuild_clock_menu$1464+1)

	goto	l11891
	
l11889:; BSR set to: 5

		movlw	low(STR_233)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1464))&0ffh
	movlw	high(STR_233)
	movwf	((_rebuild_clock_menu$1464+1))&0ffh

	
l11891:; BSR set to: 0

		movlw	low(_value_end_runtime)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_end_runtime)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_clock_menu$1464),(c:strcpy@from)
	movff	(_rebuild_clock_menu$1464+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1320
	
l11893:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_236)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_236)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(03Ch)
	movwf	((c:___lbdiv@divisor))^00h,c
	movlb	5	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbdiv
	movwf	(??_rebuild_clock_menu+0+0)^00h,c
	movf	((??_rebuild_clock_menu+0+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	5	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbmod
	movwf	(??_rebuild_clock_menu+1+0)^00h,c
	movf	((??_rebuild_clock_menu+1+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1322
	
l11895:
		movlw	low(_value_clock_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_clock_display)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_237)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_237)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1324
	
l11897:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_238)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_238)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(_value_clock_enable)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	movlw	high(_value_clock_enable)
	movwf	(1+((c:?_sprintf)+04h))^00h,c

		movlw	low(_value_end_runtime)
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	movlw	high(_value_end_runtime)
	movwf	(1+((c:?_sprintf)+06h))^00h,c

		movlw	low(_value_relay_pulse)
	movwf	(0+((c:?_sprintf)+08h))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	(1+((c:?_sprintf)+08h))^00h,c

	call	_sprintf	;wreg free
	line	1325
	
l11899:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1328
	
l11901:
		movlw	low(_clock_menu)
	movwf	((c:memcpy@d1))^00h,c
	movlw	high(_clock_menu)
	movwf	((c:memcpy@d1+1))^00h,c

		movlw	low(_clock_menu_template)
	movwf	((c:memcpy@s1))^00h,c
	movlw	high(_clock_menu_template)
	movwf	((c:memcpy@s1+1))^00h,c

	movlw	high(019h)
	movwf	((c:memcpy@n+1))^00h,c
	movlw	low(019h)
	movwf	((c:memcpy@n))^00h,c
	call	_memcpy	;wreg free
	line	1331
	
l11903:
		movlw	low(_value_clock_enable)
	movlb	3	; () banked
	movwf	(0+(_clock_menu+02h))&0ffh
	movlw	high(_value_clock_enable)
	movwf	(1+(_clock_menu+02h))&0ffh

	line	1332
	
l11905:; BSR set to: 3

		movlw	low(_value_end_runtime)
	movwf	(0+(_clock_menu+07h))&0ffh
	movlw	high(_value_end_runtime)
	movwf	(1+(_clock_menu+07h))&0ffh

	line	1333
	
l11907:; BSR set to: 3

		movlw	low(_value_relay_pulse)
	movwf	(0+(_clock_menu+0Ch))&0ffh
	movlw	high(_value_relay_pulse)
	movwf	(1+(_clock_menu+0Ch))&0ffh

	line	1334
	
l11909:; BSR set to: 3

		movlw	low(_value_clock_display)
	movwf	(0+(_clock_menu+011h))&0ffh
	movlw	high(_value_clock_display)
	movwf	(1+(_clock_menu+011h))&0ffh

	line	1335
	
l11911:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_clock_menu+016h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_clock_menu+016h))&0ffh

	line	1337
	
l11913:; BSR set to: 3

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	1339
	
l11915:; BSR set to: 3

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_239)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_239)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+02h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1340
	
l11917:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1341
	
l974:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_clock_menu
	__end_of_rebuild_clock_menu:
	signat	_rebuild_clock_menu,89
	global	_menu_update_time_value

;; *************** function _menu_update_time_value *****************
;; Defined at:
;;		line 520 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  debug_after    50   50[BANK0 ] unsigned char [50]
;;  debug_before   50    0[BANK0 ] unsigned char [50]
;;  value_buf       6  103[BANK0 ] unsigned char [6]
;;  screen_line     1  109[BANK0 ] unsigned char 
;;  start_col       1    0        unsigned char 
;;  flow_type       1  102[BANK0 ] unsigned char 
;;  sensor_type     1  101[BANK0 ] unsigned char 
;;  item_idx        1  100[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0     110       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0     110       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      110 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 7
;; This function calls:
;;		___lbdiv
;;		___lbmod
;;		_is_time_field
;;		_lcd_print
;;		_lcd_set_cursor
;;		_menu_draw_clock
;;		_sprintf
;;		_uart_println
;; This function is called by:
;;		_main
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text19,class=CODE,space=0,reloc=2,group=0
	line	520
global __ptext19
__ptext19:
psect	text19
	file	"src\menu.c"
	line	520
	
_menu_update_time_value:
;incstack = 0
	callstack 23
	line	522
	
l11253:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u14061
	goto	u14060
u14061:
	goto	l11257
u14060:
	goto	l621
	line	529
	
l11257:; BSR set to: 3

	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u14071
	goto	u14070
u14071:
	goto	l11263
u14070:
	
l11259:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u14081
	goto	u14080
u14081:
	goto	l11263
u14080:
	line	531
	
l11261:; BSR set to: 3

	movlw	low(020h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	532
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	533
	goto	l11265
	line	536
	
l11263:; BSR set to: 3

	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	(0+(_menu+012h))&0ffh,w
	
	call	___lbdiv
	addlw	low(030h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	537
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	3	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	541
	
l11265:; BSR set to: 0

	movlw	low(03Ah)
	movwf	(0+(menu_update_time_value@value_buf+02h))&0ffh
	line	544
	
l11267:; BSR set to: 0

	movlb	3	; () banked
		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u14091
	goto	u14090

u14091:
	goto	l11273
u14090:
	
l11269:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u14101
	goto	u14100
u14101:
	goto	l11273
u14100:
	line	546
	
l11271:; BSR set to: 3

	movlw	low(020h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	547
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	548
	goto	l11275
	line	551
	
l11273:; BSR set to: 3

	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	(0+(_menu+013h))&0ffh,w
	
	call	___lbdiv
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	552
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	3	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	555
	
l11275:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(menu_update_time_value@value_buf+05h))&0ffh
	line	558
	
l11277:; BSR set to: 0

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14111
	goto	u14110

u14111:
	goto	l11285
u14110:
	
l11279:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14121
	goto	u14120

u14121:
	goto	l11285
u14120:
	line	560
	
l11281:; BSR set to: 3

		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_136)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_136)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(menu_update_time_value@value_buf)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c

	call	_sprintf	;wreg free
	line	561
	call	_menu_draw_clock	;wreg free
	goto	l621
	line	566
	
l11285:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u14131
	goto	u14130

u14131:
	goto	l11289
u14130:
	goto	l621
	line	570
	
l11289:; BSR set to: 2

	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_time_value@screen_line))&0ffh
	line	571
		movlw	03h-1
	cpfsgt	((menu_update_time_value@screen_line))&0ffh
	goto	u14141
	goto	u14140

u14141:
	goto	l628
u14140:
	goto	l621
	line	572
	
l628:; BSR set to: 0

	line	574
	movff	(_menu),(menu_update_time_value@item_idx)
	line	578
	
l11293:; BSR set to: 0

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	0	; () banked
	movwf	((menu_update_time_value@sensor_type))&0ffh
	line	579
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	0	; () banked
	movwf	((menu_update_time_value@flow_type))&0ffh
	line	582
	
l11295:; BSR set to: 0

	movff	(menu_update_time_value@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_update_time_value@flow_type),(c:is_time_field@flow_type)
	movf	((menu_update_time_value@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfss	status,2
	goto	u14151
	goto	u14150
u14151:
	goto	l11299
u14150:
	goto	l621
	line	588
	
l11299:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_137)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_137)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+05h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+012h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	call	_sprintf	;wreg free
	line	589
	
l11301:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	593
	
l11303:
		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_138)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_138)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(menu_update_time_value@value_buf)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c

	call	_sprintf	;wreg free
	line	594
		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	597
	
l11305:
	line	599
	
l11307:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	600
	
l11309:
		movlw	low(STR_139)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_139)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	602
	
l11311:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	603
	
l11313:
		movlw	low(STR_140)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_140)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	604
	
l11315:
		movlw	low(menu_update_time_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	605
	
l11317:
		movlw	low(STR_141)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_141)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	606
	
l621:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_time_value
	__end_of_menu_update_time_value:
	signat	_menu_update_time_value,89
	global	_menu_draw_clock

;; *************** function _menu_draw_clock *****************
;; Defined at:
;;		line 1346 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1   53[COMRAM] unsigned char 
;;  val_len         1   51[COMRAM] unsigned char 
;;  start_pos       1   46[COMRAM] unsigned char 
;;  actual_len      1   45[COMRAM] unsigned char 
;;  value_buf      15   30[COMRAM] unsigned char [15]
;;  item_idx        1   56[COMRAM] unsigned char 
;;  show_bracket    1   54[COMRAM] unsigned char 
;;  val_len         1   52[COMRAM] unsigned char 
;;  i               1   55[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/3
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        27       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        32       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       32 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_lcd_clear_line
;;		_lcd_print
;;		_lcd_print_at
;;		_lcd_set_cursor
;;		_strcpy
;;		_strlen
;; This function is called by:
;;		_main
;;		_menu_update_time_value
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text20,class=CODE,space=0,reloc=2,group=0
	line	1346
global __ptext20
__ptext20:
psect	text20
	file	"src\menu.c"
	line	1346
	
_menu_draw_clock:
;incstack = 0
	callstack 23
	line	1349
	
l10935:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1350
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_240)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_240)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1353
	
l10937:
	movlw	low(0)
	movwf	((c:menu_draw_clock@i))^00h,c
	goto	l11017
	line	1355
	
l10939:; BSR set to: 3

	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_clock@i))^00h,c,w
	movwf	((c:menu_draw_clock@item_idx))^00h,c
	line	1356
	
l10941:; BSR set to: 3

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1359
	
l10943:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
	movf	((c:menu_draw_clock@item_idx))^00h,c,w
	mullw	05h
	movlw	low(_clock_menu)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_clock_menu)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:lcd_print_at@str)
	movff	postdec2,(c:lcd_print_at@str+1)
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_print_at
	line	1363
	
l10945:
	line	1365
	
l10947:
	movf	((c:menu_draw_clock@item_idx))^00h,c,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13471
	goto	u13470

u13471:
	goto	l10977
u13470:
	line	1367
	
l10949:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u13481
	goto	u13480
u13481:
	goto	l10973
u13480:
	line	1369
	
l10951:; BSR set to: 3

	movlw	low(02h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	line	1372
	
l10953:; BSR set to: 3

		movlw	2
	xorwf	((c:menu_draw_clock@item_idx))^00h,c,w
	btfsc	status,2
	goto	u13491
	goto	u13490

u13491:
	goto	l10957
u13490:
	line	1374
	
l10955:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u13501
	goto	u13500
u13501:
	goto	l10959
u13500:
	line	1377
	
l10957:; BSR set to: 3

		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

	movf	((c:menu_draw_clock@item_idx))^00h,c,w
	mullw	05h
	movlw	low(_clock_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_clock_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strcpy@from)
	movff	postdec2,(c:strcpy@from+1)
	call	_strcpy	;wreg free
	line	1378
	goto	l10981
	line	1382
	
l10959:; BSR set to: 3

	movf	((c:menu_draw_clock@item_idx))^00h,c,w
	mullw	05h
	movlw	low(_clock_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_clock_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strlen@s)
	movff	postdec2,(c:strlen@s+1)
	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_clock@val_len))^00h,c
	line	1383
	
l10961:
	movlw	low(0)
	movwf	((c:menu_draw_clock@j))^00h,c
	goto	l10967
	line	1384
	
l10963:
	movf	((c:menu_draw_clock@j))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1383
	
l10965:
	incf	((c:menu_draw_clock@j))^00h,c
	
l10967:
		movf	((c:menu_draw_clock@val_len))^00h,c,w
	subwf	((c:menu_draw_clock@j))^00h,c,w
	btfss	status,0
	goto	u13511
	goto	u13510

u13511:
	goto	l10963
u13510:
	line	1385
	
l10969:
	movf	((c:menu_draw_clock@val_len))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l10981
	line	1397
	
l10973:; BSR set to: 3

	movlw	low(01h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l10957
	line	1404
	
l10977:; BSR set to: 3

	movlw	low(0)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l10957
	line	1409
	
l10981:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_clock@val_len_1481))^00h,c
	line	1411
	
l10983:
	movf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfss	status,2
	goto	u13521
	goto	u13520
u13521:
	goto	l10989
u13520:
	line	1414
	
l10985:
	movf	((c:menu_draw_clock@val_len_1481))^00h,c,w
	btfsc	status,2
	goto	u13531
	goto	u13530
u13531:
	goto	l11015
u13530:
	line	1415
	
l10987:
	movf	((c:menu_draw_clock@val_len_1481))^00h,c,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_print_at
	goto	l11015
	line	1420
	
l10989:
	movf	((c:menu_draw_clock@item_idx))^00h,c,w
	mullw	05h
	movlw	low(_clock_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_clock_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strlen@s)
	movff	postdec2,(c:strlen@s+1)
	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_clock@actual_len))^00h,c
	line	1421
	
l10991:
	movf	((c:menu_draw_clock@actual_len))^00h,c,w
	sublw	low(012h)
	movwf	((c:menu_draw_clock@start_pos))^00h,c
	line	1423
	
l10993:
	movff	(c:menu_draw_clock@start_pos),(c:lcd_set_cursor@col)
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1424
	
l10995:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u13541
	goto	u13540

u13541:
	goto	l10999
u13540:
	
l10997:
		movlw	low(STR_242)
	movwf	((c:_menu_draw_clock$1487))^00h,c
	movlw	high(STR_242)
	movwf	((c:_menu_draw_clock$1487+1))^00h,c

	goto	l11001
	
l10999:
		movlw	low(STR_241)
	movwf	((c:_menu_draw_clock$1487))^00h,c
	movlw	high(STR_241)
	movwf	((c:_menu_draw_clock$1487+1))^00h,c

	
l11001:
		movff	(c:_menu_draw_clock$1487),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1487+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1427
	
l11003:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1429
	
l11005:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1430
	
l11007:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u13551
	goto	u13550

u13551:
	goto	l11011
u13550:
	
l11009:
		movlw	low(STR_244)
	movwf	((c:_menu_draw_clock$1491))^00h,c
	movlw	high(STR_244)
	movwf	((c:_menu_draw_clock$1491+1))^00h,c

	goto	l11013
	
l11011:
		movlw	low(STR_243)
	movwf	((c:_menu_draw_clock$1491))^00h,c
	movlw	high(STR_243)
	movwf	((c:_menu_draw_clock$1491+1))^00h,c

	
l11013:
		movff	(c:_menu_draw_clock$1491),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1491+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1353
	
l11015:
	incf	((c:menu_draw_clock@i))^00h,c
	
l11017:
		movlw	03h-0
	cpfslt	((c:menu_draw_clock@i))^00h,c
	goto	u13561
	goto	u13560

u13561:
	goto	l1004
u13560:
	
l11019:
	movlb	3	; () banked
	movf	(0+(_menu+02h))&0ffh,w
	movwf	(??_menu_draw_clock+0+0)^00h,c
	clrf	(??_menu_draw_clock+0+0+1)^00h,c

	movf	((c:menu_draw_clock@i))^00h,c,w
	movff	0+(_menu+01h),??_menu_draw_clock+2+0
	clrf	(??_menu_draw_clock+2+0+1)^00h,c
	addwf	(??_menu_draw_clock+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_clock+2+1)^00h,c
		movf	(??_menu_draw_clock+0+0)^00h,c,w
	subwf	(??_menu_draw_clock+2+0)^00h,c,w
	movf	(??_menu_draw_clock+2+1)^00h,c,w
	xorlw	80h
	movwf	(??_menu_draw_clock+4+0)^00h,c
	movf	(??_menu_draw_clock+0+1)^00h,c,w
	xorlw	80h
	subwfb	(??_menu_draw_clock+4+0)^00h,c,w
	btfss	status,0
	goto	u13571
	goto	u13570

u13571:
	goto	l10939
u13570:
	line	1433
	
l1004:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_clock
	__end_of_menu_draw_clock:
	signat	_menu_draw_clock,89
	global	___lbmod

;; *************** function ___lbmod *****************
;; Defined at:
;;		line 4 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1   14[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1   15[COMRAM] unsigned char 
;;  rem             1   17[COMRAM] unsigned char 
;;  counter         1   16[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_update_time_value
;;		_rebuild_clock_menu
;;		_menu_handle_button
;;		_dec_to_bcd
;; This function uses a non-reentrant model
;;
psect	text21,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
global __ptext21
__ptext21:
psect	text21
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
	
___lbmod:
;incstack = 0
	callstack 26
	movwf	((c:___lbmod@dividend))^00h,c
	line	9
	
l7503:
	movlw	low(08h)
	movwf	((c:___lbmod@counter))^00h,c
	line	10
	movlw	low(0)
	movwf	((c:___lbmod@rem))^00h,c
	line	12
	
l7505:
	bcf	status,0
	rlcf	((c:___lbmod@dividend))^00h,c,w
	rlcf	((c:___lbmod@rem))^00h,c,w
	movwf	((c:___lbmod@rem))^00h,c
	line	13
	
l7507:
	bcf status,0
	rlcf	((c:___lbmod@dividend))^00h,c

	line	14
	
l7509:
		movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c,w
	btfss	status,0
	goto	u8181
	goto	u8180

u8181:
	goto	l7513
u8180:
	line	15
	
l7511:
	movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c
	line	16
	
l7513:
	decfsz	((c:___lbmod@counter))^00h,c
	
	goto	l7505
	line	17
	
l7515:
	movf	((c:___lbmod@rem))^00h,c,w
	line	18
	
l2077:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lbmod
	__end_of___lbmod:
	signat	___lbmod,8313
	global	___lbdiv

;; *************** function ___lbdiv *****************
;; Defined at:
;;		line 4 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1   14[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1   15[COMRAM] unsigned char 
;;  quotient        1   17[COMRAM] unsigned char 
;;  counter         1   16[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_update_time_value
;;		_rebuild_clock_menu
;;		_menu_handle_button
;;		_dec_to_bcd
;; This function uses a non-reentrant model
;;
psect	text22,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
global __ptext22
__ptext22:
psect	text22
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
	
___lbdiv:
;incstack = 0
	callstack 26
	movwf	((c:___lbdiv@dividend))^00h,c
	line	9
	
l7477:
	movlw	low(0)
	movwf	((c:___lbdiv@quotient))^00h,c
	line	10
	
l7479:
	movf	((c:___lbdiv@divisor))^00h,c,w
	btfsc	status,2
	goto	u8151
	goto	u8150
u8151:
	goto	l7499
u8150:
	line	11
	
l7481:
	movlw	low(01h)
	movwf	((c:___lbdiv@counter))^00h,c
	line	12
	goto	l7487
	line	13
	
l7483:
	bcf status,0
	rlcf	((c:___lbdiv@divisor))^00h,c

	line	14
	
l7485:
	incf	((c:___lbdiv@counter))^00h,c
	line	12
	
l7487:
	
	btfss	((c:___lbdiv@divisor))^00h,c,(7)&7
	goto	u8161
	goto	u8160
u8161:
	goto	l7483
u8160:
	line	17
	
l7489:
	bcf status,0
	rlcf	((c:___lbdiv@quotient))^00h,c

	line	18
		movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c,w
	btfss	status,0
	goto	u8171
	goto	u8170

u8171:
	goto	l7495
u8170:
	line	19
	
l7491:
	movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c
	line	20
	
l7493:
	bsf	(0+(0/8)+(c:___lbdiv@quotient))^00h,c,(0)&7
	line	22
	
l7495:
	bcf status,0
	rrcf	((c:___lbdiv@divisor))^00h,c

	line	23
	
l7497:
	decfsz	((c:___lbdiv@counter))^00h,c
	
	goto	l7489
	line	25
	
l7499:
	movf	((c:___lbdiv@quotient))^00h,c,w
	line	26
	
l2071:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
	signat	___lbdiv,8313
	global	_menu_draw_setup

;; *************** function _menu_draw_setup *****************
;; Defined at:
;;		line 1223 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  label           2   41[COMRAM] PTR const unsigned char 
;;		 -> STR_217(5), STR_216(6), STR_215(1), STR_214(1), 
;;		 -> STR_213(1), 
;;  sensor_name     2   44[COMRAM] PTR const unsigned char 
;;		 -> Fake(1), STR_220(5), STR_219(5), STR_218(9), 
;;  sensor          1   43[COMRAM] unsigned char 
;;  item_idx        1   46[COMRAM] unsigned char 
;;  i               1   47[COMRAM] unsigned char 
;;  setup_labels   10   25[COMRAM] PTR const unsigned char 
;;		 -> STR_217(5), STR_216(6), STR_215(1), STR_214(1), 
;;		 -> STR_213(1), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        23       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        23       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       23 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_lcd_clear
;;		_lcd_clear_line
;;		_lcd_print
;;		_lcd_print_at
;;		_lcd_set_cursor
;; This function is called by:
;;		_main
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text23,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1223
global __ptext23
__ptext23:
psect	text23
	file	"src\menu.c"
	line	1223
	
_menu_draw_setup:
;incstack = 0
	callstack 23
	line	1228
	
l11437:
	call	_lcd_clear	;wreg free
	line	1229
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1230
	
l11439:
		movlw	low(STR_212)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_212)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1233
	
l11441:
	lfsr	2,(menu_draw_setup@F2659)
	lfsr	1,(menu_draw_setup@setup_labels)
	movlw	10-1
u14381:
	movff	plusw2,plusw1
	decf	wreg
	bc	u14381

	line	1236
	
l11443:
	movlw	low(0)
	movwf	((c:menu_draw_setup@i))^00h,c
	line	1238
	
l11449:
	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_setup@i))^00h,c,w
	movwf	((c:menu_draw_setup@item_idx))^00h,c
	line	1239
		movlw	05h-1
	cpfsgt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u14391
	goto	u14390

u14391:
	goto	l11453
u14390:
	goto	l957
	line	1242
	
l11453:; BSR set to: 3

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1245
	
l11455:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u14401
	goto	u14400

u14401:
	goto	l11489
u14400:
	line	1247
	
l11457:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:menu_draw_setup@sensor))^00h,c
	line	1249
	
l11459:
	movf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u14411
	goto	u14410
u14411:
	goto	l11467
u14410:
	
l11461:
		decf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u14421
	goto	u14420

u14421:
	goto	l11465
u14420:
	
l11463:
		movlw	low(STR_220)
	movwf	((c:_menu_draw_setup$1435))^00h,c
	movlw	high(STR_220)
	movwf	((c:_menu_draw_setup$1435+1))^00h,c

	goto	l940
	
l11465:
		movlw	low(STR_219)
	movwf	((c:_menu_draw_setup$1435))^00h,c
	movlw	high(STR_219)
	movwf	((c:_menu_draw_setup$1435+1))^00h,c

	
l940:
		movff	(c:_menu_draw_setup$1435),(c:menu_draw_setup@sensor_name)
	movff	(c:_menu_draw_setup$1435+1),(c:menu_draw_setup@sensor_name+1)

	goto	l936
	
l11467:
		movlw	low(STR_218)
	movwf	((c:menu_draw_setup@sensor_name))^00h,c
	movlw	high(STR_218)
	movwf	((c:menu_draw_setup@sensor_name+1))^00h,c

	
l936:
	line	1252
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14431
	goto	u14430

u14431:
	goto	l11477
u14430:
	line	1255
	
l11469:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1256
	
l11471:
		movlw	low(STR_221)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_221)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1257
	
l11473:
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1258
	
l11475:
		movlw	low(STR_222)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_222)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1259
	goto	l11479
	line	1263
	
l11477:; BSR set to: 3

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1267
	
l11479:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1268
	
l11481:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfss	status,2
	goto	u14441
	goto	u14440
u14441:
	goto	l11485
u14440:
	
l11483:
		movlw	low(STR_224)
	movwf	((c:_menu_draw_setup$1441))^00h,c
	movlw	high(STR_224)
	movwf	((c:_menu_draw_setup$1441+1))^00h,c

	goto	l11487
	
l11485:
		movlw	low(STR_223)
	movwf	((c:_menu_draw_setup$1441))^00h,c
	movlw	high(STR_223)
	movwf	((c:_menu_draw_setup$1441+1))^00h,c

	
l11487:
		movff	(c:_menu_draw_setup$1441),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1441+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1269
	goto	l11515
	line	1273
	
l11489:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_labels)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:menu_draw_setup@label)
	movff	postdec2,(c:menu_draw_setup@label+1)
	line	1275
	
l11491:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14451
	goto	u14450

u14451:
	goto	l11501
u14450:
	line	1278
	
l11493:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1279
	
l11495:
		movlw	low(STR_225)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_225)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1280
	
l11497:
		movff	(c:menu_draw_setup@label),(c:lcd_print@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1281
	
l11499:
		movlw	low(STR_226)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_226)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1282
	goto	l11503
	line	1286
	
l11501:; BSR set to: 3

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@label),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1290
	
l11503:
		movlw	3
	xorwf	((c:menu_draw_setup@item_idx))^00h,c,w
	btfss	status,2
	goto	u14461
	goto	u14460

u14461:
	goto	l11515
u14460:
	line	1293
	
l11505:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1294
	
l11507:
	movlb	5	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u14471
	goto	u14470
u14471:
	goto	l11511
u14470:
	
l11509:; BSR set to: 5

		movlw	low(STR_228)
	movwf	((c:_menu_draw_setup$1449))^00h,c
	movlw	high(STR_228)
	movwf	((c:_menu_draw_setup$1449+1))^00h,c

	goto	l11513
	
l11511:; BSR set to: 5

		movlw	low(STR_227)
	movwf	((c:_menu_draw_setup$1449))^00h,c
	movlw	high(STR_227)
	movwf	((c:_menu_draw_setup$1449+1))^00h,c

	
l11513:; BSR set to: 5

		movff	(c:_menu_draw_setup$1449),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1449+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1236
	
l11515:
	incf	((c:menu_draw_setup@i))^00h,c
	
l11517:
		movlw	03h-1
	cpfsgt	((c:menu_draw_setup@i))^00h,c
	goto	u14481
	goto	u14480

u14481:
	goto	l11449
u14480:
	line	1298
	
l957:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_setup
	__end_of_menu_draw_setup:
	signat	_menu_draw_setup,89
	global	_menu_draw_options

;; *************** function _menu_draw_options *****************
;; Defined at:
;;		line 1064 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  item_index      1   25[COMRAM] unsigned char 
;;  i               1   26[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/3
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_lcd_clear
;;		_lcd_clear_line
;;		_lcd_print
;;		_lcd_print_at
;;		_lcd_set_cursor
;; This function is called by:
;;		_main
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text24,class=CODE,space=0,reloc=2,group=0
	line	1064
global __ptext24
__ptext24:
psect	text24
	file	"src\menu.c"
	line	1064
	
_menu_draw_options:
;incstack = 0
	callstack 23
	line	1067
	
l11041:
	call	_lcd_clear	;wreg free
	line	1068
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1069
	
l11043:
		movlw	low(STR_202)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_202)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1072
	
l11045:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	line	1074
	
l11051:
	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_options@i))^00h,c,w
	movwf	((c:menu_draw_options@item_index))^00h,c
	line	1075
		movlw	05h-1
	cpfsgt	((c:menu_draw_options@item_index))^00h,c
	goto	u13601
	goto	u13600

u13601:
	goto	l11055
u13600:
	goto	l881
	line	1078
	
l11055:; BSR set to: 3

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1081
	
l11057:
	movf	((c:menu_draw_options@item_index))^00h,c,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13611
	goto	u13610

u13611:
	goto	l11067
u13610:
	line	1083
	
l11059:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1084
	
l11061:
		movlw	low(STR_203)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_203)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1085
	
l11063:
	movf	((c:menu_draw_options@item_index))^00h,c,w
	mullw	02h
	movlw	low(_options_menu)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_options_menu)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:lcd_print@str)
	movff	postdec2,(c:lcd_print@str+1)
	call	_lcd_print	;wreg free
	line	1086
	
l11065:
		movlw	low(STR_204)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_204)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1087
	goto	l11069
	line	1091
	
l11067:; BSR set to: 3

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
	movf	((c:menu_draw_options@item_index))^00h,c,w
	mullw	02h
	movlw	low(_options_menu)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_options_menu)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:lcd_print_at@str)
	movff	postdec2,(c:lcd_print_at@str+1)
	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_print_at
	line	1072
	
l11069:
	incf	((c:menu_draw_options@i))^00h,c
	
l11071:
		movlw	03h-1
	cpfsgt	((c:menu_draw_options@i))^00h,c
	goto	u13621
	goto	u13620

u13621:
	goto	l11051
u13620:
	line	1094
	
l881:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_options
	__end_of_menu_draw_options:
	signat	_menu_draw_options,89
	global	_lcd_clear

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 165 in file "src\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/3
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
;;		_menu_draw_options
;;		_menu_draw_setup
;; This function uses a non-reentrant model
;;
psect	text25,class=CODE,space=0,reloc=2,group=0
	file	"src\lcd.c"
	line	165
global __ptext25
__ptext25:
psect	text25
	file	"src\lcd.c"
	line	165
	
_lcd_clear:
;incstack = 0
	callstack 24
	line	167
	
l10871:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	168
	
l10873:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u17687:
decfsz	wreg,f
	bra	u17687
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u17687
	nop2
asmopt pop

	line	169
	
l1406:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
	signat	_lcd_clear,89
	global	_menu_draw_input

;; *************** function _menu_draw_input *****************
;; Defined at:
;;		line 1096 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1   31[BANK0 ] unsigned char 
;;  val_len         1   30[BANK0 ] unsigned char 
;;  flag            2   38[BANK0 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> NULL(0), sensor_edit_flag(1), enable_edit_flag(1), 
;;  opts            2   36[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  flag            2   34[BANK0 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> NULL(0), sensor_edit_flag(1), enable_edit_flag(1), 
;;  opts            2   32[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  start_pos       1   25[BANK0 ] unsigned char 
;;  value_buf      15    0[BANK0 ] unsigned char [15]
;;  item_idx        1   45[BANK0 ] unsigned char 
;;  show_bracket    1   41[BANK0 ] unsigned char 
;;  val_len         1   40[BANK0 ] unsigned char 
;;  i               1   44[BANK0 ] unsigned char 
;;  title          10   15[BANK0 ] unsigned char [10]
;;  flow_type       1   43[BANK0 ] unsigned char 
;;  sensor_type     1   42[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 3F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      46       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5      46       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       51 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_get_item_options_for_field
;;		_get_option_edit_flag
;;		_is_numeric_field
;;		_is_option_field
;;		_is_time_field
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
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text26,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1096
global __ptext26
__ptext26:
psect	text26
	file	"src\menu.c"
	line	1096
	
_menu_draw_input:
;incstack = 0
	callstack 23
	line	1101
	
l11319:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1103
	
l11321:
		movlw	low(menu_draw_input@title)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_205)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_205)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(01h)
	movlb	2	; () banked
	addwf	((_current_input))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	1+(0+((c:?_sprintf)+04h))^00h,c
	movlw	high(01h)
	addwfc	1+(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1104
	
l11323:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@title)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1107
	
l11325:
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	0	; () banked
	movwf	((menu_draw_input@sensor_type))&0ffh
	line	1108
	
l11327:; BSR set to: 0

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	0	; () banked
	movwf	((menu_draw_input@flow_type))&0ffh
	line	1111
	
l11329:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@i))&0ffh
	goto	l11433
	line	1113
	
l11331:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_input@i))&0ffh,w
	movwf	((menu_draw_input@item_idx))&0ffh
	line	1114
	
l11333:; BSR set to: 0

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1117
	
l11335:
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
	line	1121
	
l11337:
	line	1123
	
l11339:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14161
	goto	u14160

u14161:
	goto	l11389
u14160:
	line	1125
	
l11341:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u14171
	goto	u14170
u14171:
	goto	l11385
u14170:
	line	1127
	
l11343:; BSR set to: 3

	movlw	low(02h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	line	1130
	
l11345:; BSR set to: 0

	movff	(menu_draw_input@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_option_field@flow_type)
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u14181
	goto	u14180
u14181:
	goto	l11359
u14180:
	line	1132
	
l11347:
	movlb	3	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14191
	goto	u14190
u14191:
	goto	l11361
u14190:
	line	1135
	
l11349:; BSR set to: 3

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts+1)
	line	1136
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag+1)
	line	1138
	
l11351:
	movlb	0	; () banked
	movf	((menu_draw_input@opts))&0ffh,w
iorwf	((menu_draw_input@opts+1))&0ffh,w
	btfsc	status,2
	goto	u14201
	goto	u14200

u14201:
	goto	l11359
u14200:
	
l11353:; BSR set to: 0

	movf	((menu_draw_input@flag))&0ffh,w
iorwf	((menu_draw_input@flag+1))&0ffh,w
	btfsc	status,2
	goto	u14211
	goto	u14210

u14211:
	goto	l11359
u14210:
	
l11355:; BSR set to: 0

	movff	(menu_draw_input@flag),fsr2l
	movff	(menu_draw_input@flag+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	01h
	addwf	((menu_draw_input@opts))&0ffh,w
	movwf	(??_menu_draw_input+1+0)^00h,c
	movlw	0
	addwfc	((menu_draw_input@opts+1))&0ffh,w
	movwf	(??_menu_draw_input+1+0+1)^00h,c
	movff	??_menu_draw_input+1+0,tblptrl
	movff	??_menu_draw_input+1+1,tblptrh
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
	subwf	((??_menu_draw_input+0+0))^00h,c,w
	btfsc	status,0
	goto	u14221
	goto	u14220
u14221:
	goto	l11359
u14220:
	line	1140
	
l11357:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

	movff	(menu_draw_input@flag),fsr2l
	movff	(menu_draw_input@flag+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movf	((??_menu_draw_input+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_input+1+0
	movff	prodh,??_menu_draw_input+1+0+1
	movf	(??_menu_draw_input+1+0)^00h,c,w
	addwf	((menu_draw_input@opts))&0ffh,w
	movwf	(??_menu_draw_input+3+0)^00h,c
	movf	(??_menu_draw_input+1+1)^00h,c,w
	addwfc	((menu_draw_input@opts+1))&0ffh,w
	movwf	1+(??_menu_draw_input+3+0)^00h,c
	movlw	02h
	addwf	(??_menu_draw_input+3+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_input+3+1)^00h,c
	movff	??_menu_draw_input+3+0,tblptrl
	movff	??_menu_draw_input+3+1,tblptrh
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
	line	1141
	goto	l11393
	line	1144
	
l11359:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

	movlb	0	; () banked
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
	goto	l11393
	line	1150
	
l11361:; BSR set to: 3

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts_1397)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts_1397+1)
	line	1151
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag_1401)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag_1401+1)
	line	1153
	
l11363:
	movlb	0	; () banked
	movf	((menu_draw_input@opts_1397))&0ffh,w
iorwf	((menu_draw_input@opts_1397+1))&0ffh,w
	btfsc	status,2
	goto	u14231
	goto	u14230

u14231:
	goto	l11381
u14230:
	
l11365:; BSR set to: 0

	movf	((menu_draw_input@flag_1401))&0ffh,w
iorwf	((menu_draw_input@flag_1401+1))&0ffh,w
	btfsc	status,2
	goto	u14241
	goto	u14240

u14241:
	goto	l11381
u14240:
	
l11367:; BSR set to: 0

	movff	(menu_draw_input@flag_1401),fsr2l
	movff	(menu_draw_input@flag_1401+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	01h
	addwf	((menu_draw_input@opts_1397))&0ffh,w
	movwf	(??_menu_draw_input+1+0)^00h,c
	movlw	0
	addwfc	((menu_draw_input@opts_1397+1))&0ffh,w
	movwf	(??_menu_draw_input+1+0+1)^00h,c
	movff	??_menu_draw_input+1+0,tblptrl
	movff	??_menu_draw_input+1+1,tblptrh
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
	subwf	((??_menu_draw_input+0+0))^00h,c,w
	btfsc	status,0
	goto	u14251
	goto	u14250
u14251:
	goto	l11381
u14250:
	line	1155
	
l11369:; BSR set to: 0

	movff	(menu_draw_input@flag_1401),fsr2l
	movff	(menu_draw_input@flag_1401+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movf	((??_menu_draw_input+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_input+1+0
	movff	prodh,??_menu_draw_input+1+0+1
	movf	(??_menu_draw_input+1+0)^00h,c,w
	addwf	((menu_draw_input@opts_1397))&0ffh,w
	movwf	(??_menu_draw_input+3+0)^00h,c
	movf	(??_menu_draw_input+1+1)^00h,c,w
	addwfc	((menu_draw_input@opts_1397+1))&0ffh,w
	movwf	1+(??_menu_draw_input+3+0)^00h,c
	movlw	02h
	addwf	(??_menu_draw_input+3+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_input+3+1)^00h,c
	movff	??_menu_draw_input+3+0,tblptrl
	movff	??_menu_draw_input+3+1,tblptrh
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
	line	1156
	
l11371:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j))&0ffh
	goto	l11377
	line	1157
	
l11373:; BSR set to: 0

	movf	((menu_draw_input@j))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1156
	
l11375:; BSR set to: 0

	incf	((menu_draw_input@j))&0ffh
	
l11377:; BSR set to: 0

		movf	((menu_draw_input@val_len))&0ffh,w
	subwf	((menu_draw_input@j))&0ffh,w
	btfss	status,0
	goto	u14261
	goto	u14260

u14261:
	goto	l11373
u14260:
	line	1158
	
l11379:; BSR set to: 0

	movf	((menu_draw_input@val_len))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1159
	goto	l11393
	line	1162
	
l11381:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_206)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_206)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l11393
	line	1175
	
l11385:; BSR set to: 3

	movlw	low(01h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l11359
	line	1182
	
l11389:; BSR set to: 3

	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l11359
	line	1187
	
l11393:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_1405))&0ffh
	line	1188
	
l11395:; BSR set to: 0

	movf	((menu_draw_input@val_len_1405))&0ffh,w
	btfsc	status,2
	goto	u14271
	goto	u14270
u14271:
	goto	l11431
u14270:
	
l11397:; BSR set to: 0

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
		movlw	low(STR_207)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_207)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u14281
	goto	u14280

u14281:
	goto	l11431
u14280:
	line	1191
	
l11399:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u14291
	goto	u14290
u14291:
	goto	l11407
u14290:
	
l11401:; BSR set to: 3

	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14301
	goto	u14300

u14301:
	goto	l11407
u14300:
	line	1194
	
l11403:; BSR set to: 3

	movff	(menu_draw_input@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_numeric_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u14311
	goto	u14310
u14311:
	goto	l11431
u14310:
	
l11405:
	movff	(menu_draw_input@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_time_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u14321
	goto	u14320
u14321:
	goto	l11407
u14320:
	goto	l11431
	line	1201
	
l11407:
	movlb	0	; () banked
	movf	((menu_draw_input@show_brackets))&0ffh,w
	btfss	status,2
	goto	u14331
	goto	u14330
u14331:
	goto	l11411
u14330:
	line	1204
	
l11409:; BSR set to: 0

	movf	((menu_draw_input@val_len_1405))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	1205
	goto	l11431
	line	1209
	
l11411:; BSR set to: 0

	movf	((menu_draw_input@val_len_1405))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_input@start_pos))&0ffh
	line	1210
	
l11413:; BSR set to: 0

	movff	(menu_draw_input@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1213
	
l11415:
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u14341
	goto	u14340

u14341:
	goto	l11419
u14340:
	
l11417:; BSR set to: 0

		movlw	low(STR_209)
	movwf	((_menu_draw_input$1411))&0ffh
	movlw	high(STR_209)
	movwf	((_menu_draw_input$1411+1))&0ffh

	goto	l11421
	
l11419:; BSR set to: 0

		movlw	low(STR_208)
	movwf	((_menu_draw_input$1411))&0ffh
	movlw	high(STR_208)
	movwf	((_menu_draw_input$1411+1))&0ffh

	
l11421:; BSR set to: 0

		movff	(_menu_draw_input$1411),(c:lcd_print@str)
	movff	(_menu_draw_input$1411+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1215
	
l11423:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1217
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u14351
	goto	u14350

u14351:
	goto	l11427
u14350:
	
l11425:; BSR set to: 0

		movlw	low(STR_211)
	movwf	((_menu_draw_input$1415))&0ffh
	movlw	high(STR_211)
	movwf	((_menu_draw_input$1415+1))&0ffh

	goto	l11429
	
l11427:; BSR set to: 0

		movlw	low(STR_210)
	movwf	((_menu_draw_input$1415))&0ffh
	movlw	high(STR_210)
	movwf	((_menu_draw_input$1415+1))&0ffh

	
l11429:; BSR set to: 0

		movff	(_menu_draw_input$1415),(c:lcd_print@str)
	movff	(_menu_draw_input$1415+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1111
	
l11431:
	movlb	0	; () banked
	incf	((menu_draw_input@i))&0ffh
	
l11433:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_input@i))&0ffh
	goto	u14361
	goto	u14360

u14361:
	goto	l922
u14360:
	
l11435:; BSR set to: 0

	movlb	3	; () banked
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
	goto	u14371
	goto	u14370

u14371:
	goto	l11331
u14370:
	line	1221
	
l922:; BSR set to: 0

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
;;  s               2   14[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_clock@value_buf(15), value_clock_display(10), value_end_runtime(10), value_clock_enable(10), 
;;		 -> menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), value_rlylow(10), 
;;		 -> value_flow_type(10), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), value_relay_pulse(10), NULL(0), STR_79(1), 
;;		 -> STR_78(1), STR_77(9), STR_76(6), STR_75(6), 
;;		 -> STR_74(1), STR_73(1), STR_72(1), STR_71(5), 
;;		 -> STR_70(5), STR_69(1), STR_68(1), STR_67(1), 
;;		 -> STR_66(4), STR_65(2), STR_64(1), STR_63(1), 
;;		 -> STR_62(1), STR_61(5), STR_60(4), STR_59(1), 
;;		 -> STR_58(1), STR_57(1), STR_56(8), STR_55(7), 
;;		 -> STR_54(1), STR_53(1), STR_52(5), STR_51(5), 
;;		 -> STR_50(9), STR_49(1), STR_48(1), STR_47(1), 
;;		 -> STR_46(8), STR_45(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   16[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_clock@value_buf(15), value_clock_display(10), value_end_runtime(10), value_clock_enable(10), 
;;		 -> menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), value_rlylow(10), 
;;		 -> value_flow_type(10), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), value_relay_pulse(10), NULL(0), STR_79(1), 
;;		 -> STR_78(1), STR_77(9), STR_76(6), STR_75(6), 
;;		 -> STR_74(1), STR_73(1), STR_72(1), STR_71(5), 
;;		 -> STR_70(5), STR_69(1), STR_68(1), STR_67(1), 
;;		 -> STR_66(4), STR_65(2), STR_64(1), STR_63(1), 
;;		 -> STR_62(1), STR_61(5), STR_60(4), STR_59(1), 
;;		 -> STR_58(1), STR_57(1), STR_56(8), STR_55(7), 
;;		 -> STR_54(1), STR_53(1), STR_52(5), STR_51(5), 
;;		 -> STR_50(9), STR_49(1), STR_48(1), STR_47(1), 
;;		 -> STR_46(8), STR_45(9), 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] unsigned int 
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_update_edit_value
;;		_menu_draw_input
;;		_menu_draw_clock
;; This function uses a non-reentrant model
;;
psect	text27,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
global __ptext27
__ptext27:
psect	text27
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
	
_strlen:; BSR set to: 0

;incstack = 0
	callstack 26
	line	8
	
l10589:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l10593
	line	10
	
l10591:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l10593:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u12907
	tblrd	*
	
	movf	tablat,w
	bra	u12900
u12907:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u12900:
	iorlw	0
	btfss	status,2
	goto	u12911
	goto	u12910
u12911:
	goto	l10591
u12910:
	line	12
	
l10595:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l2367:
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
;;		 -> original_value(10), menu_draw_clock@value_buf(15), value_clock_display(10), value_end_runtime(10), 
;;		 -> value_clock_enable(10), menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), value_relay_pulse(10), NULL(0), 
;;  from            2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_237(5), value_clock_display(10), STR_235(9), STR_234(6), 
;;		 -> STR_233(6), value_end_runtime(10), value_clock_enable(10), STR_206(6), 
;;		 -> menu_update_edit_value@value_buf(10), value_no_flow_bp(10), STR_189(4), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), STR_184(4), STR_183(2), 
;;		 -> value_flow_units(10), STR_182(9), STR_181(6), STR_180(6), 
;;		 -> value_rlylow(10), STR_179(5), STR_178(5), STR_177(8), 
;;		 -> STR_176(7), value_flow_type(10), STR_175(5), STR_174(5), 
;;		 -> STR_173(5), STR_172(9), STR_171(6), STR_170(6), 
;;		 -> value_high_tbp(10), value_high_temp(10), STR_165(5), value_back(5), 
;;		 -> STR_164(5), STR_163(5), value_display(10), STR_162(9), 
;;		 -> STR_161(6), STR_160(6), value_rlyslp(10), STR_159(9), 
;;		 -> STR_158(6), STR_157(6), value_rlyplp(10), STR_156(9), 
;;		 -> STR_155(6), STR_154(6), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), STR_146(9), value_sensor(12), 
;;		 -> value_enable(10), value_relay_pulse(10), NULL(0), STR_79(1), 
;;		 -> STR_78(1), STR_77(9), STR_76(6), STR_75(6), 
;;		 -> STR_74(1), STR_73(1), STR_72(1), STR_71(5), 
;;		 -> STR_70(5), STR_69(1), STR_68(1), STR_67(1), 
;;		 -> STR_66(4), STR_65(2), STR_64(1), STR_63(1), 
;;		 -> STR_62(1), STR_61(5), STR_60(4), STR_59(1), 
;;		 -> STR_58(1), STR_57(1), STR_56(8), STR_55(7), 
;;		 -> STR_54(1), STR_53(1), STR_52(5), STR_51(5), 
;;		 -> STR_50(9), STR_49(1), STR_48(1), STR_47(1), 
;;		 -> STR_46(8), STR_45(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   18[COMRAM] PTR unsigned char 
;;		 -> original_value(10), menu_draw_clock@value_buf(15), value_clock_display(10), value_end_runtime(10), 
;;		 -> value_clock_enable(10), menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), value_relay_pulse(10), NULL(0), 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] PTR unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 0/3
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
;;		_menu_update_edit_value
;;		_menu_draw_input
;;		_rebuild_clock_menu
;;		_menu_draw_clock
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text28,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
global __ptext28
__ptext28:
psect	text28
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
	
_strcpy:
;incstack = 0
	callstack 26
	line	18
	
l10583:
		movff	(c:strcpy@to),(c:strcpy@cp)
	movff	(c:strcpy@to+1),(c:strcpy@cp+1)

	line	19
	goto	l10587
	line	20
	
l10585:
	infsnz	((c:strcpy@cp))^00h,c
	incf	((c:strcpy@cp+1))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l10587:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movff	(c:strcpy@cp),fsr2l
	movff	(c:strcpy@cp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u12887
	tblrd	*
	
	movf	tablat,w
	bra	u12880
u12887:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u12880:
	movwf	indf2
	movf	indf2,w
	btfss	status,2
	goto	u12891
	goto	u12890
u12891:
	goto	l10585
u12890:
	line	24
	
l2361:
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
;;		 -> value_clock_display(10), value_end_runtime(10), value_clock_enable(10), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), value_relay_pulse(10), NULL(0), 
;;  s2              2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_279(5), STR_278(6), STR_277(6), STR_276(8), 
;;		 -> STR_207(1), STR_79(1), STR_78(1), STR_77(9), 
;;		 -> STR_76(6), STR_75(6), STR_74(1), STR_73(1), 
;;		 -> STR_72(1), STR_71(5), STR_70(5), STR_69(1), 
;;		 -> STR_68(1), STR_67(1), STR_66(4), STR_65(2), 
;;		 -> STR_64(1), STR_63(1), STR_62(1), STR_61(5), 
;;		 -> STR_60(4), STR_59(1), STR_58(1), STR_57(1), 
;;		 -> STR_56(8), STR_55(7), STR_54(1), STR_53(1), 
;;		 -> STR_52(5), STR_51(5), STR_50(9), STR_49(1), 
;;		 -> STR_48(1), STR_47(1), STR_46(8), STR_45(9), 
;; Auto vars:     Size  Location     Type
;;  r               1   20[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] int 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
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
psect	text29,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
global __ptext29
__ptext29:
psect	text29
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
	
_strcmp:
;incstack = 0
	callstack 26
	line	37
	
l7369:
	goto	l7373
	line	38
	
l7371:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l7373:
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
	goto	u8011
	goto	u8010
u8011:
	goto	l7377
u8010:
	
l7375:
	movff	(c:strcmp@s1),fsr2l
	movff	(c:strcmp@s1+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u8021
	goto	u8020
u8021:
	goto	l7371
u8020:
	line	41
	
l7377:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l2355:
	return	;funcret
	callstack 0
GLOBAL	__end_of_strcmp
	__end_of_strcmp:
	signat	_strcmp,8314
	global	_lcd_print_at

;; *************** function _lcd_print_at *****************
;; Defined at:
;;		line 612 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   21[COMRAM] unsigned char 
;;  str             2   22[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_clock@value_buf(15), STR_240(6), Fake(1), STR_220(5), 
;;		 -> STR_219(5), STR_218(9), STR_217(5), STR_216(6), 
;;		 -> STR_215(1), STR_214(1), STR_213(1), menu_draw_input@value_buf(15), 
;;		 -> menu_draw_input@title(10), STR_131(5), STR_130(8), STR_129(10), 
;;		 -> STR_128(8), STR_127(7), STR_126(5), STR_125(8), 
;;		 -> STR_124(8), STR_123(12), STR_122(9), STR_121(11), 
;;		 -> STR_120(10), STR_119(6), STR_118(5), STR_117(7), 
;;		 -> STR_116(7), STR_115(5), STR_114(8), STR_113(8), 
;;		 -> STR_112(11), STR_111(8), STR_110(5), STR_109(7), 
;;		 -> STR_108(7), STR_107(5), STR_106(8), STR_105(9), 
;;		 -> STR_104(9), STR_103(10), STR_102(11), STR_101(10), 
;;		 -> STR_100(7), STR_99(7), STR_98(5), STR_97(8), 
;;		 -> STR_96(8), STR_95(8), STR_94(9), STR_93(6), 
;;		 -> STR_92(6), STR_91(13), STR_90(9), STR_89(12), 
;;		 -> STR_88(11), STR_87(10), STR_86(7), STR_85(7), 
;;		 -> STR_84(5), STR_83(6), STR_82(13), STR_81(11), 
;;		 -> STR_80(10), 
;; Auto vars:     Size  Location     Type
;;  row             1   24[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/3
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
;;		_menu_draw_clock
;; This function uses a non-reentrant model
;;
psect	text30,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	612
global __ptext30
__ptext30:
psect	text30
	file	"src\menu.c"
	line	612
	
_lcd_print_at:
;incstack = 0
	callstack 23
	movwf	((c:lcd_print_at@row))^00h,c
	line	614
	
l10575:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	615
	
l10577:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	616
	
l634:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print_at
	__end_of_lcd_print_at:
	signat	_lcd_print_at,12409
	global	_lcd_clear_line

;; *************** function _lcd_clear_line *****************
;; Defined at:
;;		line 618 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  row             1   21[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/3
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
;;		_menu_draw_clock
;; This function uses a non-reentrant model
;;
psect	text31,class=CODE,space=0,reloc=2,group=0
	line	618
global __ptext31
__ptext31:
psect	text31
	file	"src\menu.c"
	line	618
	
_lcd_clear_line:
;incstack = 0
	callstack 23
	movwf	((c:lcd_clear_line@row))^00h,c
	line	620
	
l10579:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	621
	
l10581:
		movlw	low(STR_142)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_142)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	622
	
l637:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear_line
	__end_of_lcd_clear_line:
	signat	_lcd_clear_line,4217
	global	_lcd_set_cursor

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 129 in file "src\lcd.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   18[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  row             1   19[COMRAM] unsigned char 
;;  addr            1   20[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/3
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
;;		_menu_update_time_value
;;		_lcd_print_at
;;		_lcd_clear_line
;;		_menu_update_edit_value
;;		_menu_update_numeric_value
;;		_menu_draw_options
;;		_menu_draw_input
;;		_menu_draw_setup
;;		_menu_draw_clock
;; This function uses a non-reentrant model
;;
psect	text32,class=CODE,space=0,reloc=2,group=0
	file	"src\lcd.c"
	line	129
global __ptext32
__ptext32:
psect	text32
	file	"src\lcd.c"
	line	129
	
_lcd_set_cursor:
;incstack = 0
	callstack 24
	movwf	((c:lcd_set_cursor@row))^00h,c
	line	133
	
l10551:
	goto	l10563
	line	135
	
l1391:
	line	136
	movff	(c:lcd_set_cursor@col),(c:lcd_set_cursor@addr)
	line	137
	goto	l10565
	line	139
	
l10553:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(040h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	140
	goto	l10565
	line	142
	
l10555:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(094h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	143
	goto	l10565
	line	145
	
l10557:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(0D4h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	146
	goto	l10565
	line	148
	
l10559:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	149
	goto	l10565
	line	133
	
l10563:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l1391
	xorlw	1^0	; case 1
	skipnz
	goto	l10553
	xorlw	2^1	; case 2
	skipnz
	goto	l10555
	xorlw	3^2	; case 3
	skipnz
	goto	l10557
	goto	l10559

	line	152
	
l10565:
	movf	((c:lcd_set_cursor@addr))^00h,c,w
	iorlw	low(080h)
	
	call	_lcd_cmd
	line	153
	
l1397:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
	signat	_lcd_set_cursor,8313
	global	_lcd_print

;; *************** function _lcd_print *****************
;; Defined at:
;;		line 156 in file "src\lcd.c"
;; Parameters:    Size  Location     Type
;;  str             2   17[COMRAM] PTR const unsigned char 
;;		 -> STR_244(2), STR_243(2), STR_242(2), STR_241(2), 
;;		 -> menu_draw_clock@value_buf(15), STR_240(6), STR_228(2), STR_227(2), 
;;		 -> STR_226(2), STR_225(2), STR_224(2), STR_223(2), 
;;		 -> STR_222(2), STR_221(2), Fake(1), STR_220(5), 
;;		 -> STR_219(5), STR_218(9), STR_217(5), STR_216(6), 
;;		 -> STR_215(1), STR_214(1), STR_213(1), STR_212(21), 
;;		 -> STR_211(2), STR_210(2), STR_209(2), STR_208(2), 
;;		 -> menu_draw_input@value_buf(15), menu_draw_input@title(10), STR_204(2), STR_203(2), 
;;		 -> STR_202(21), STR_201(2), STR_200(2), STR_199(6), 
;;		 -> menu_update_numeric_value@value_buf(6), STR_198(2), STR_197(2), STR_196(7), 
;;		 -> menu_update_edit_value@display_buf(10), STR_142(21), STR_141(2), STR_140(2), 
;;		 -> STR_139(8), menu_update_time_value@value_buf(6), STR_131(5), STR_130(8), 
;;		 -> STR_129(10), STR_128(8), STR_127(7), STR_126(5), 
;;		 -> STR_125(8), STR_124(8), STR_123(12), STR_122(9), 
;;		 -> STR_121(11), STR_120(10), STR_119(6), STR_118(5), 
;;		 -> STR_117(7), STR_116(7), STR_115(5), STR_114(8), 
;;		 -> STR_113(8), STR_112(11), STR_111(8), STR_110(5), 
;;		 -> STR_109(7), STR_108(7), STR_107(5), STR_106(8), 
;;		 -> STR_105(9), STR_104(9), STR_103(10), STR_102(11), 
;;		 -> STR_101(10), STR_100(7), STR_99(7), STR_98(5), 
;;		 -> STR_97(8), STR_96(8), STR_95(8), STR_94(9), 
;;		 -> STR_93(6), STR_92(6), STR_91(13), STR_90(9), 
;;		 -> STR_89(12), STR_88(11), STR_87(10), STR_86(7), 
;;		 -> STR_85(7), STR_84(5), STR_83(6), STR_82(13), 
;;		 -> STR_81(11), STR_80(10), STR_41(8), STR_40(12), 
;;		 -> STR_35(6), STR_34(12), STR_18(16), STR_17(13), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/3
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
;;		_menu_update_time_value
;;		_lcd_print_at
;;		_lcd_clear_line
;;		_menu_update_edit_value
;;		_menu_update_numeric_value
;;		_menu_draw_options
;;		_menu_draw_input
;;		_menu_draw_setup
;;		_menu_draw_clock
;; This function uses a non-reentrant model
;;
psect	text33,class=CODE,space=0,reloc=2,group=0
	line	156
global __ptext33
__ptext33:
psect	text33
	file	"src\lcd.c"
	line	156
	
_lcd_print:
;incstack = 0
	callstack 23
	line	158
	
l10567:
	goto	l10573
	line	160
	
l10569:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u12857
	tblrd	*
	
	movf	tablat,w
	bra	u12850
u12857:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u12850:
	
	call	_lcd_data
	
l10571:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	158
	
l10573:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u12867
	tblrd	*
	
	movf	tablat,w
	bra	u12860
u12867:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u12860:
	iorlw	0
	btfss	status,2
	goto	u12871
	goto	u12870
u12871:
	goto	l10569
u12870:
	line	162
	
l1403:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print
	__end_of_lcd_print:
	signat	_lcd_print,4217
	global	_lcd_data

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 48 in file "src\lcd.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1   16[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/3
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
psect	text34,class=CODE,space=0,reloc=2,group=0
	line	48
global __ptext34
__ptext34:
psect	text34
	file	"src\lcd.c"
	line	48
	
_lcd_data:
;incstack = 0
	callstack 23
	movwf	((c:lcd_data@data))^00h,c
	line	51
	
l10525:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	52
	
l10527:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	53
	
l10529:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	54
	
l10531:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	55
	
l10533:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	56
	
l10535:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	57
	
l10537:
	asmopt push
asmopt off
	movlw	133
u17697:
decfsz	wreg,f
	bra	u17697
	nop
asmopt pop

	line	60
	
l10539:
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	61
	
l10541:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	62
	
l10543:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	63
	
l10545:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	64
	
l10547:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	65
	
l10549:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	66
	asmopt push
asmopt off
	movlw	133
u17707:
decfsz	wreg,f
	bra	u17707
	nop
asmopt pop

	line	67
	
l1384:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
	signat	_lcd_data,4217
	global	_is_time_field

;; *************** function _is_time_field *****************
;; Defined at:
;;		line 229 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  line            1    wreg     unsigned char 
;;  sensor_type     1   14[COMRAM] unsigned char 
;;  flow_type       1   15[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  line            1   17[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3C/3
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
;;		_main
;;		_menu_update_time_value
;;		_menu_draw_input
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text35,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	229
global __ptext35
__ptext35:
psect	text35
	file	"src\menu.c"
	line	229
	
_is_time_field:
;incstack = 0
	callstack 27
	movwf	((c:is_time_field@line))^00h,c
	line	231
	
l6955:
	movf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7181
	goto	u7180
u7181:
	goto	l6971
u7180:
	line	234
	
l6957:
	movlw	low(01h)
	movwf	((c:_is_time_field$1170))^00h,c
	
l6959:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u7191
	goto	u7190

u7191:
	goto	l507
u7190:
	
l6961:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u7201
	goto	u7200

u7201:
	goto	l507
u7200:
	
l6963:
		movlw	8
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u7211
	goto	u7210

u7211:
	goto	l507
u7210:
	
l6965:
	movlw	low(0)
	movwf	((c:_is_time_field$1170))^00h,c
	
l507:
	movf	((c:_is_time_field$1170))^00h,c,w
	goto	l508
	line	236
	
l6971:
		decf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7221
	goto	u7220

u7221:
	goto	l6979
u7220:
	line	239
	
l6973:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u7231
	goto	u7230

u7231:
	movlw	1
	goto	u7240
u7230:
	movlw	0
u7240:
	goto	l508
	line	241
	
l6979:
		movlw	2
	xorwf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7251
	goto	u7250

u7251:
	goto	l6993
u7250:
	line	243
	
l6981:
	movf	((c:is_time_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u7261
	goto	u7260
u7261:
	goto	l6989
u7260:
	line	246
	
l6983:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u7271
	goto	u7270

u7271:
	movlw	1
	goto	u7280
u7270:
	movlw	0
u7280:
	goto	l508
	line	251
	
l6989:
		movlw	4
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u7291
	goto	u7290

u7291:
	movlw	1
	goto	u7300
u7290:
	movlw	0
u7300:
	goto	l508
	line	255
	
l6993:
	movlw	(0)&0ffh
	line	256
	
l508:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_time_field
	__end_of_is_time_field:
	signat	_is_time_field,12409
	global	_is_option_field

;; *************** function _is_option_field *****************
;; Defined at:
;;		line 261 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  line            1    wreg     unsigned char 
;;  sensor_type     1   14[COMRAM] unsigned char 
;;  flow_type       1   15[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  line            1   20[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3C/3
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_draw_input
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text36,class=CODE,space=0,reloc=2,group=0
	line	261
global __ptext36
__ptext36:
psect	text36
	file	"src\menu.c"
	line	261
	
_is_option_field:
;incstack = 0
	callstack 26
	movwf	((c:is_option_field@line))^00h,c
	line	264
	
l7083:
	movf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7421
	goto	u7420
u7421:
	goto	l7087
u7420:
	
l7085:
		decf	((c:is_option_field@line))^00h,c,w
	btfss	status,2
	goto	u7431
	goto	u7430

u7431:
	goto	l7091
u7430:
	line	265
	
l7087:
	movlw	(01h)&0ffh
	goto	l520
	line	267
	
l7091:
	movf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7441
	goto	u7440
u7441:
	goto	l7109
u7440:
	line	270
	
l7093:
	movlw	low(01h)
	movwf	((c:_is_option_field$1175))^00h,c
	
l7095:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7451
	goto	u7450

u7451:
	goto	l523
u7450:
	
l7097:
		movlw	10
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7461
	goto	u7460

u7461:
	goto	l523
u7460:
	
l7099:
		movlw	11
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7471
	goto	u7470

u7471:
	goto	l523
u7470:
	
l7101:
		movlw	12
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7481
	goto	u7480

u7481:
	goto	l523
u7480:
	
l7103:
	movlw	low(0)
	movwf	((c:_is_option_field$1175))^00h,c
	
l523:
	movf	((c:_is_option_field$1175))^00h,c,w
	goto	l520
	line	272
	
l7109:
		decf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7491
	goto	u7490

u7491:
	goto	l7123
u7490:
	line	275
	
l7111:
	movlw	low(01h)
	movwf	((c:_is_option_field$1176))^00h,c
	
l7113:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7501
	goto	u7500

u7501:
	goto	l527
u7500:
	
l7115:
		movlw	7
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7511
	goto	u7510

u7511:
	goto	l527
u7510:
	
l7117:
	movlw	low(0)
	movwf	((c:_is_option_field$1176))^00h,c
	
l527:
	movf	((c:_is_option_field$1176))^00h,c,w
	goto	l520
	line	277
	
l7123:
		movlw	2
	xorwf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7521
	goto	u7520

u7521:
	goto	l7157
u7520:
	line	279
	
l7125:
	movf	((c:is_option_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u7531
	goto	u7530
u7531:
	goto	l7143
u7530:
	line	282
	
l7127:
	movlw	low(01h)
	movwf	((c:_is_option_field$1177))^00h,c
	
l7129:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7541
	goto	u7540

u7541:
	goto	l532
u7540:
	
l7131:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7551
	goto	u7550

u7551:
	goto	l532
u7550:
	
l7133:
		movlw	8
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7561
	goto	u7560

u7561:
	goto	l532
u7560:
	
l7135:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7571
	goto	u7570

u7571:
	goto	l532
u7570:
	
l7137:
	movlw	low(0)
	movwf	((c:_is_option_field$1177))^00h,c
	
l532:
	movf	((c:_is_option_field$1177))^00h,c,w
	goto	l520
	line	287
	
l7143:
	movlw	low(01h)
	movwf	((c:_is_option_field$1178))^00h,c
	
l7145:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7581
	goto	u7580

u7581:
	goto	l535
u7580:
	
l7147:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7591
	goto	u7590

u7591:
	goto	l535
u7590:
	
l7149:
		movlw	5
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7601
	goto	u7600

u7601:
	goto	l535
u7600:
	
l7151:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7611
	goto	u7610

u7611:
	goto	l535
u7610:
	
l7153:
	movlw	low(0)
	movwf	((c:_is_option_field$1178))^00h,c
	
l535:
	movf	((c:_is_option_field$1178))^00h,c,w
	goto	l520
	line	291
	
l7157:
	movlw	(0)&0ffh
	line	292
	
l520:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_option_field
	__end_of_is_option_field:
	signat	_is_option_field,12409
	global	_is_numeric_field

;; *************** function _is_numeric_field *****************
;; Defined at:
;;		line 197 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  line            1    wreg     unsigned char 
;;  sensor_type     1   14[COMRAM] unsigned char 
;;  flow_type       1   15[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  line            1   19[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3C/3
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_menu_update_edit_value
;;		_menu_update_numeric_value
;;		_menu_draw_input
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text37,class=CODE,space=0,reloc=2,group=0
	line	197
global __ptext37
__ptext37:
psect	text37
	file	"src\menu.c"
	line	197
	
_is_numeric_field:
;incstack = 0
	callstack 27
	movwf	((c:is_numeric_field@line))^00h,c
	line	199
	
l10875:
	movf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u13331
	goto	u13330
u13331:
	goto	l10893
u13330:
	line	202
	
l10877:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1163))^00h,c
	
l10879:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u13341
	goto	u13340

u13341:
	goto	l491
u13340:
	
l10881:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u13351
	goto	u13350

u13351:
	goto	l491
u13350:
	
l10883:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u13361
	goto	u13360

u13361:
	goto	l491
u13360:
	
l10885:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u13371
	goto	u13370

u13371:
	goto	l491
u13370:
	
l10887:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1163))^00h,c
	
l491:
	movf	((c:_is_numeric_field$1163))^00h,c,w
	goto	l492
	line	204
	
l10893:
		decf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u13381
	goto	u13380

u13381:
	goto	l10909
u13380:
	line	207
	
l10895:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1164))^00h,c
	
l10897:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u13391
	goto	u13390

u13391:
	goto	l496
u13390:
	
l10899:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u13401
	goto	u13400

u13401:
	goto	l496
u13400:
	
l10901:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u13411
	goto	u13410

u13411:
	goto	l496
u13410:
	
l10903:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1164))^00h,c
	
l496:
	movf	((c:_is_numeric_field$1164))^00h,c,w
	goto	l492
	line	209
	
l10909:
		movlw	2
	xorwf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u13421
	goto	u13420

u13421:
	goto	l10927
u13420:
	line	211
	
l10911:
	movf	((c:is_numeric_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u13431
	goto	u13430
u13431:
	goto	l10927
u13430:
	line	214
	
l10913:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1165))^00h,c
	
l10915:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u13441
	goto	u13440

u13441:
	goto	l501
u13440:
	
l10917:
		movlw	5
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u13451
	goto	u13450

u13451:
	goto	l501
u13450:
	
l10919:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u13461
	goto	u13460

u13461:
	goto	l501
u13460:
	
l10921:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1165))^00h,c
	
l501:
	movf	((c:_is_numeric_field$1165))^00h,c,w
	goto	l492
	line	219
	
l10927:
	movlw	(0)&0ffh
	line	224
	
l492:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_numeric_field
	__end_of_is_numeric_field:
	signat	_is_numeric_field,12409
	global	_get_option_edit_flag

;; *************** function _get_option_edit_flag *****************
;; Defined at:
;;		line 298 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  line            1    wreg     unsigned char 
;;  sensor_type     1   14[COMRAM] unsigned char 
;;  flow_type       1   15[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  line            1   16[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] PTR unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3C/3
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_draw_input
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text38,class=CODE,space=0,reloc=2,group=0
	line	298
global __ptext38
__ptext38:
psect	text38
	file	"src\menu.c"
	line	298
	
_get_option_edit_flag:
;incstack = 0
	callstack 26
	movwf	((c:get_option_edit_flag@line))^00h,c
	line	301
	
l7161:
	movf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7621
	goto	u7620
u7621:
	goto	l7167
u7620:
	line	302
	
l7163:
		movlw	low(_enable_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l539
	line	303
	
l7167:
		decf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7631
	goto	u7630

u7631:
	goto	l7173
u7630:
	line	304
	
l7169:
		movlw	low(_sensor_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l539
	line	307
	
l7173:
	movf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7641
	goto	u7640
u7641:
	goto	l7199
u7640:
	line	309
	
l7175:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7651
	goto	u7650

u7651:
	goto	l7181
u7650:
	line	310
	
l7177:
		movlw	low(_relay_high_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l539
	line	311
	
l7181:
		movlw	10
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7661
	goto	u7660

u7661:
	goto	l7187
u7660:
	line	312
	
l7183:
		movlw	low(_relay_plp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l539
	line	313
	
l7187:
		movlw	11
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7671
	goto	u7670

u7671:
	goto	l7193
u7670:
	line	314
	
l7189:
		movlw	low(_relay_slp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l539
	line	315
	
l7193:
		movlw	12
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7681
	goto	u7680

u7681:
	goto	l7259
u7680:
	line	316
	
l7195:
		movlw	low(_display_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l539
	line	319
	
l7199:
		decf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7691
	goto	u7690

u7691:
	goto	l7213
u7690:
	line	321
	
l7201:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7701
	goto	u7700

u7701:
	goto	l7207
u7700:
	goto	l7177
	line	323
	
l7207:
		movlw	7
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7711
	goto	u7710

u7711:
	goto	l7259
u7710:
	goto	l7195
	line	327
	
l7213:
		movlw	2
	xorwf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7721
	goto	u7720

u7721:
	goto	l7259
u7720:
	line	329
	
l7215:
		movlw	2
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7731
	goto	u7730

u7731:
	goto	l7221
u7730:
	line	330
	
l7217:
		movlw	low(_flow_type_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l539
	line	332
	
l7221:
	movf	((c:get_option_edit_flag@flow_type))^00h,c,w
	btfss	status,2
	goto	u7741
	goto	u7740
u7741:
	goto	l7241
u7740:
	line	334
	
l7223:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7751
	goto	u7750

u7751:
	goto	l7229
u7750:
	line	335
	
l7225:
		movlw	low(_flow_units_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l539
	line	336
	
l7229:
		movlw	8
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7761
	goto	u7760

u7761:
	goto	l7235
u7760:
	line	337
	
l7231:
		movlw	low(_relay_low_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l539
	line	338
	
l7235:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7771
	goto	u7770

u7771:
	goto	l7259
u7770:
	goto	l7195
	line	343
	
l7241:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7781
	goto	u7780

u7781:
	goto	l7247
u7780:
	line	344
	
l7243:
		movlw	low(_no_flow_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l539
	line	345
	
l7247:
		movlw	5
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7791
	goto	u7790

u7791:
	goto	l7253
u7790:
	goto	l7231
	line	347
	
l7253:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7801
	goto	u7800

u7801:
	goto	l7259
u7800:
	goto	l7195
	line	352
	
l7259:
		movlw	low(0)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(0)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	line	353
	
l539:
	return	;funcret
	callstack 0
GLOBAL	__end_of_get_option_edit_flag
	__end_of_get_option_edit_flag:
	signat	_get_option_edit_flag,12410
	global	_get_item_options_for_field

;; *************** function _get_item_options_for_field *****************
;; Defined at:
;;		line 359 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  line            1    wreg     unsigned char 
;;  sensor_type     1   14[COMRAM] unsigned char 
;;  flow_type       1   15[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  line            1   16[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] PTR const struct .
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3C/3
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_draw_input
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text39,class=CODE,space=0,reloc=2,group=0
	line	359
global __ptext39
__ptext39:
psect	text39
	file	"src\menu.c"
	line	359
	
_get_item_options_for_field:
;incstack = 0
	callstack 26
	movwf	((c:get_item_options_for_field@line))^00h,c
	line	362
	
l7263:
	movf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7811
	goto	u7810
u7811:
	goto	l7269
u7810:
	line	363
	
l7265:
		movlw	low(_menu_item_options)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l564
	line	364
	
l7269:
		decf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7821
	goto	u7820

u7821:
	goto	l7275
u7820:
	line	365
	
l7271:
		movlw	low(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l564
	line	368
	
l7275:
	movf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7831
	goto	u7830
u7831:
	goto	l7293
u7830:
	line	370
	
l7277:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u7841
	goto	u7840

u7841:
	goto	l7283
u7840:
	
l7279:
		movlw	10
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u7851
	goto	u7850

u7851:
	goto	l7283
u7850:
	
l7281:
		movlw	11
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7861
	goto	u7860

u7861:
	goto	l7287
u7860:
	line	371
	
l7283:
		movlw	low(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l564
	line	372
	
l7287:
		movlw	12
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7871
	goto	u7870

u7871:
	goto	l7353
u7870:
	line	373
	
l7289:
		movlw	low(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l564
	line	376
	
l7293:
		decf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7881
	goto	u7880

u7881:
	goto	l7307
u7880:
	line	378
	
l7295:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7891
	goto	u7890

u7891:
	goto	l7301
u7890:
	goto	l7283
	line	380
	
l7301:
		movlw	7
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7901
	goto	u7900

u7901:
	goto	l7353
u7900:
	goto	l7289
	line	384
	
l7307:
		movlw	2
	xorwf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7911
	goto	u7910

u7911:
	goto	l7353
u7910:
	line	386
	
l7309:
		movlw	2
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7921
	goto	u7920

u7921:
	goto	l7315
u7920:
	line	387
	
l7311:
		movlw	low(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l564
	line	389
	
l7315:
	movf	((c:get_item_options_for_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u7931
	goto	u7930
u7931:
	goto	l7335
u7930:
	line	391
	
l7317:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7941
	goto	u7940

u7941:
	goto	l7323
u7940:
	line	392
	
l7319:
		movlw	low(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l564
	line	393
	
l7323:
		movlw	8
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7951
	goto	u7950

u7951:
	goto	l7329
u7950:
	goto	l7283
	line	395
	
l7329:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7961
	goto	u7960

u7961:
	goto	l7353
u7960:
	goto	l7289
	line	400
	
l7335:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7971
	goto	u7970

u7971:
	goto	l7341
u7970:
	line	401
	
l7337:
		movlw	low(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l564
	line	402
	
l7341:
		movlw	5
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7981
	goto	u7980

u7981:
	goto	l7347
u7980:
	goto	l7283
	line	404
	
l7347:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7991
	goto	u7990

u7991:
	goto	l7353
u7990:
	goto	l7289
	line	409
	
l7353:
		movlw	low(0)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(0)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	line	410
	
l564:
	return	;funcret
	callstack 0
GLOBAL	__end_of_get_item_options_for_field
	__end_of_get_item_options_for_field:
	signat	_get_item_options_for_field,12410
	global	_init_time_editor

;; *************** function _init_time_editor *****************
;; Defined at:
;;		line 419 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  value_second    2   64[COMRAM] unsigned int 
;;  mode            1   66[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  buf            60    0[BANK0 ] unsigned char [60]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      60       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3      60       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       63 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		___lwdiv
;;		___lwmod
;;		_sprintf
;;		_uart_println
;; This function is called by:
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text40,class=CODE,space=0,reloc=2,group=0
	line	419
global __ptext40
__ptext40:
psect	text40
	file	"src\menu.c"
	line	419
	
_init_time_editor:
;incstack = 0
	callstack 24
	line	422
	
l11519:
	movff	(c:init_time_editor@mode),0+(_menu+010h)
	line	423
	movff	(c:init_time_editor@value_seconds),0+(_menu+014h)
	movff	(c:init_time_editor@value_seconds+1),1+(_menu+014h)
	line	426
	
l11521:
	movf	((c:init_time_editor@mode))^00h,c,w
	btfss	status,2
	goto	u14491
	goto	u14490
u14491:
	goto	l11525
u14490:
	line	428
	
l11523:
	movff	(c:init_time_editor@value_seconds),(c:___lwdiv@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	movlb	3	; () banked
	movwf	(0+(_menu+012h))&0ffh
	line	429
	movff	(c:init_time_editor@value_seconds),(c:___lwmod@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	movlb	3	; () banked
	movwf	(0+(_menu+013h))&0ffh
	line	430
	goto	l11527
	line	433
	
l11525:
	movff	(c:init_time_editor@value_seconds),(c:___lwdiv@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwdiv@dividend+1)
	movlw	high(0E10h)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(0E10h)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	movlb	3	; () banked
	movwf	(0+(_menu+012h))&0ffh
	line	434
	movlw	high(0E10h)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(0E10h)
	movwf	((c:___lwmod@divisor))^00h,c
	movff	(c:init_time_editor@value_seconds),(c:___lwmod@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwmod@dividend+1)
	call	___lwmod	;wreg free
	movff	0+?___lwmod,(c:___lwdiv@dividend)
	movff	1+?___lwmod,(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	movlb	3	; () banked
	movwf	(0+(_menu+013h))&0ffh
	line	438
	
l11527:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+011h))&0ffh
	line	443
	
l11529:; BSR set to: 3

		movlw	low(init_time_editor@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_132)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_132)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:init_time_editor@value_seconds),0+((c:?_sprintf)+04h)
	movff	(c:init_time_editor@value_seconds+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+012h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	444
	
l11531:
		movlw	low(init_time_editor@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	445
	
l590:
	return	;funcret
	callstack 0
GLOBAL	__end_of_init_time_editor
	__end_of_init_time_editor:
	signat	_init_time_editor,8313
	global	_sprintf

;; *************** function _sprintf *****************
;; Defined at:
;;		line 505 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              2   26[COMRAM] PTR unsigned char 
;;		 -> rtc_read_time@debug_buf(80), menu_handle_button@buf_1581(50), menu_handle_button@buf_1571(50), menu_handle_button@buf_1549(50), 
;;		 -> menu_handle_button@buf(50), menu_handle_encoder@buf_1516(50), menu_handle_encoder@buf_1513(50), menu_handle_encoder@buf(50), 
;;		 -> value_clock_display(10), value_end_runtime(10), value_clock_enable(10), rebuild_clock_menu@buf(50), 
;;		 -> menu_draw_input@title(10), menu_update_edit_value@value_buf(10), handle_numeric_rotation@buf(50), rebuild_input_menu@buf(50), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), menu_update_time_value@debug_after(50), 
;;		 -> menu_update_time_value@debug_before(50), value_relay_pulse(10), handle_time_rotation@buf(50), init_time_editor@buf(60), 
;;		 -> NULL(0), main@buf_687(30), main@buf_660(40), main@buf_657(60), 
;;		 -> main@buf_652(50), main@time_buf(60), main@buf_618(30), main@buf(50), 
;;		 -> trigger_relay_pulse@buf(60), 
;;  f               2   28[COMRAM] PTR const unsigned char 
;;		 -> STR_281(40), STR_274(32), STR_273(38), STR_272(5), 
;;		 -> STR_271(6), STR_270(6), STR_269(5), STR_268(6), 
;;		 -> STR_267(6), STR_266(5), STR_265(5), STR_264(6), 
;;		 -> STR_263(6), STR_261(10), STR_260(26), STR_259(42), 
;;		 -> STR_258(32), STR_257(10), STR_256(10), STR_255(26), 
;;		 -> STR_254(28), STR_253(25), STR_252(20), STR_251(26), 
;;		 -> STR_250(35), STR_249(28), STR_248(37), STR_247(32), 
;;		 -> STR_246(23), STR_245(37), STR_239(29), STR_238(46), 
;;		 -> STR_236(10), STR_230(3), STR_229(35), STR_205(9), 
;;		 -> STR_195(9), STR_194(7), STR_193(29), STR_191(48), 
;;		 -> STR_190(10), STR_188(10), STR_187(5), STR_186(6), 
;;		 -> STR_185(6), STR_169(10), STR_168(3), STR_167(6), 
;;		 -> STR_166(6), STR_153(10), STR_152(10), STR_151(5), 
;;		 -> STR_150(10), STR_149(5), STR_148(6), STR_147(6), 
;;		 -> STR_143(3), STR_138(27), STR_137(51), STR_136(3), 
;;		 -> STR_135(25), STR_134(45), STR_132(35), STR_30(17), 
;;		 -> STR_29(23), STR_28(35), STR_27(17), STR_25(37), 
;;		 -> STR_14(28), STR_6(39), STR_3(27), STR_1(48), 
;; Auto vars:     Size  Location     Type
;;  idx             1   47[COMRAM] unsigned char 
;;  tmpval          4    0        struct .
;;  width           2   60[COMRAM] int 
;;  val             2   58[COMRAM] unsigned int 
;;  len             2   55[COMRAM] unsigned int 
;;  cp              2   53[COMRAM] PTR const unsigned char 
;;		 -> STR_293(7), sprintf@c(1), ?_sprintf(2), value_clock_display(10), 
;;		 -> value_end_runtime(10), STR_232(9), STR_231(8), value_clock_enable(10), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), STR_145(9), STR_144(8), 
;;		 -> value_enable(10), value_relay_pulse(10), menu_update_time_value@value_buf(6), display_edit_flag(1), 
;;		 -> relay_high_edit_flag(1), NULL(0), menu_item_options$option_count(1), STR_79(1), 
;;		 -> STR_78(1), STR_77(9), STR_76(6), STR_75(6), 
;;		 -> STR_74(1), STR_73(1), STR_72(1), STR_71(5), 
;;		 -> STR_70(5), STR_69(1), STR_68(1), STR_67(1), 
;;		 -> STR_66(4), STR_65(2), STR_64(1), STR_63(1), 
;;		 -> STR_62(1), STR_61(5), STR_60(4), STR_59(1), 
;;		 -> STR_58(1), STR_57(1), STR_56(8), STR_55(7), 
;;		 -> STR_54(1), STR_53(1), STR_52(5), STR_51(5), 
;;		 -> STR_50(9), STR_49(1), STR_48(1), STR_47(1), 
;;		 -> STR_46(8), STR_45(9), enable_edit_flag(1), 
;;  c               1   63[COMRAM] unsigned char 
;;  flag            1   62[COMRAM] unsigned char 
;;  ap              1   57[COMRAM] PTR void [1]
;;		 -> ?_sprintf(2), 
;;  prec            1   52[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  2   26[COMRAM] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/5
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:        18       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        17       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        38       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       38 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		___lwdiv
;;		___lwmod
;;		___wmul
;;		_isdigit
;; This function is called by:
;;		_trigger_relay_pulse
;;		_main
;;		_init_time_editor
;;		_handle_time_rotation
;;		_menu_update_time_value
;;		_rebuild_input_menu
;;		_handle_numeric_rotation
;;		_menu_update_edit_value
;;		_menu_draw_input
;;		_rebuild_clock_menu
;;		_menu_handle_encoder
;;		_menu_handle_button
;;		_rtc_read_time
;; This function uses a non-reentrant model
;;
psect	text41,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
global __ptext41
__ptext41:
psect	text41
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
	
_sprintf:
;incstack = 0
	callstack 27
	line	550
	
l10655:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l10865
	line	555
	
l10657:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u13001
	goto	u13000

u13001:
	goto	l10663
u13000:
	line	558
	
l10659:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l10661:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l10865
	line	563
	
l10663:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	565
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	goto	l10673
	line	578
	
l10665:
	bsf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	579
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	580
	goto	l10673
	line	585
	
l10667:
	bsf	(0+(1/8)+(c:sprintf@flag))^00h,c,(1)&7
	line	586
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	587
	goto	l10673
	line	597
	
l10669:
	bsf	(0+(2/8)+(c:sprintf@flag))^00h,c,(2)&7
	line	598
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	568
	
l10673:
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
	goto	l10665
	xorlw	43^32	; case 43
	skipnz
	goto	l10667
	xorlw	48^43	; case 48
	skipnz
	goto	l10669
	goto	l1596

	line	603
	
l1596:
	line	606
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u13011
	goto	u13010
u13011:
	goto	l10677
u13010:
	line	607
	
l10675:
	bcf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	614
	
l10677:
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
	goto	u13021
	goto	u13020
u13021:
	goto	l10737
u13020:
	line	615
	
l10679:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	617
	
l10681:
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
	
l10683:
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

	
l10685:
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	619
	
l10687:
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
	goto	u13031
	goto	u13030
u13031:
	goto	l10681
u13030:
	goto	l10737
	line	747
	
l10689:
	bsf	(0+(7/8)+(c:sprintf@flag))^00h,c,(7)&7
	line	749
	goto	l10739
	line	760
	
l10691:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l10693:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l10695:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u13041
	goto	u13040

u13041:
	goto	l10699
u13040:
	line	767
	
l10697:
		movlw	low(STR_293)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_293)
	movwf	((c:sprintf@cp+1))^00h,c

	line	771
	
l10699:
	movlw	high(0)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@len))^00h,c
	line	772
	goto	l10703
	line	773
	
l10701:
	infsnz	((c:sprintf@len))^00h,c
	incf	((c:sprintf@len+1))^00h,c
	line	772
	
l10703:
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
	bra	u13057
	tblrd	*
	
	movf	tablat,w
	bra	u13050
u13057:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u13050:
	iorlw	0
	btfss	status,2
	goto	u13061
	goto	u13060
u13061:
	goto	l10701
u13060:
	line	783
	
l10705:
		movf	((c:sprintf@width))^00h,c,w
	subwf	((c:sprintf@len))^00h,c,w
	movf	((c:sprintf@width+1))^00h,c,w
	subwfb	((c:sprintf@len+1))^00h,c,w
	btfsc	status,0
	goto	u13071
	goto	u13070

u13071:
	goto	l10709
u13070:
	line	784
	
l10707:
	movf	((c:sprintf@len))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	subwfb	((c:sprintf@width+1))^00h,c

	goto	l10715
	line	786
	
l10709:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	goto	l10715
	line	791
	
l10711:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l10713:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	790
	
l10715:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
		incf	((c:sprintf@width))^00h,c,w
	bnz	u13081
	incf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u13081
	goto	u13080

u13081:
	goto	l10711
u13080:
	goto	l10723
	line	794
	
l10717:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u13097
	tblrd	*
	
	movf	tablat,w
	bra	u13090
u13097:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u13090:
	movwf	indf2
	
l10719:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l10721:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	793
	
l10723:
	decf	((c:sprintf@len))^00h,c
	btfss	status,0
	decf	((c:sprintf@len+1))^00h,c
		incf	((c:sprintf@len))^00h,c,w
	bnz	u13101
	incf	((c:sprintf@len+1))^00h,c,w
	btfss	status,2
	goto	u13101
	goto	u13100

u13101:
	goto	l10717
u13100:
	goto	l10865
	line	825
	
l10725:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:sprintf@c))^00h,c
	
l10727:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	831
	
l10729:
		movlw	low(sprintf@c)
	movwf	((c:sprintf@cp))^00h,c
	clrf	((c:sprintf@cp+1))^00h,c

	line	832
	
l10731:
	movlw	high(01h)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(01h)
	movwf	((c:sprintf@len))^00h,c
	line	833
	goto	l10705
	line	844
	
l10733:
	movlw	(0C0h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	845
	goto	l10739
	line	661
	
l10737:
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
; Number of cases is 8, Range of values is 0 to 120
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           25    13 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l10867
	xorlw	88^0	; case 88
	skipnz
	goto	l10689
	xorlw	99^88	; case 99
	skipnz
	goto	l10725
	xorlw	100^99	; case 100
	skipnz
	goto	l10739
	xorlw	105^100	; case 105
	skipnz
	goto	l10739
	xorlw	115^105	; case 115
	skipnz
	goto	l10691
	xorlw	117^115	; case 117
	skipnz
	goto	l10733
	xorlw	120^117	; case 120
	skipnz
	goto	l10689
	goto	l10729

	line	1277
	
l10739:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	0C0h
	andwf	(??_sprintf+0+0)^00h,c
	btfss	status,2
	goto	u13111
	goto	u13110
u13111:
	goto	l10751
u13110:
	line	1285
	
l10741:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l10743:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l10745:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u13120
	goto	u13121

u13121:
	goto	l10785
u13120:
	line	1288
	
l10747:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l10749:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	goto	l10785
	line	1312
	
l10751:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l10753:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	goto	l10785
	line	1331
	
l10755:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l10757:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u13131
	goto	u13130

u13131:
	goto	l10761
u13130:
	goto	l10787
	line	1332
	
l10761:
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
	goto	u13141
	goto	u13140

u13141:
	goto	l10765
u13140:
	goto	l10787
	line	1331
	
l10765:
	incf	((c:sprintf@c))^00h,c
	goto	l10757
	line	1342
	
l10769:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l10771:
		movlw	4
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u13151
	goto	u13150

u13151:
	goto	l10775
u13150:
	goto	l10787
	line	1343
	
l10775:
	movf	((c:sprintf@c))^00h,c,w
	mullw	02h
	movlw	low((_hexpowers))
	addwf	(prodl)^0f00h,c,w
	movwf	tblptrl
	movlw	high((_hexpowers))
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
	goto	u13161
	goto	u13160

u13161:
	goto	l10779
u13160:
	goto	l10787
	line	1342
	
l10779:
	incf	((c:sprintf@c))^00h,c
	goto	l10771
	line	1320
	
l10785:
	movf	((c:sprintf@flag))^00h,c,w
	andlw	low(0C0h)
	; Switch size 1, requested type "simple"
; Number of cases is 3, Range of values is 0 to 192
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l10755
	xorlw	128^0	; case 128
	skipnz
	goto	l10769
	xorlw	192^128	; case 192
	skipnz
	goto	l10755
	goto	l10787

	line	1371
	
l10787:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u13171
	goto	u13170

u13171:
	goto	l10793
u13170:
	
l10789:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u13181
	goto	u13180
u13181:
	goto	l10793
u13180:
	line	1372
	
l10791:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	line	1407
	
l10793:
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
	goto	u13191
	goto	u13190

u13191:
	goto	l10797
u13190:
	line	1408
	
l10795:
	movf	((c:sprintf@c))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movlw	0
	subwfb	((c:sprintf@width+1))^00h,c
	goto	l10799
	line	1410
	
l10797:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	1413
	
l10799:
	
	btfss	((c:sprintf@flag))^00h,c,(2)&7
	goto	u13201
	goto	u13200
u13201:
	goto	l10825
u13200:
	line	1415
	
l10801:
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u13211
	goto	u13210
u13211:
	goto	l1644
u13210:
	line	1416
	
l10803:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u13221
	goto	u13220
u13221:
	goto	l10807
u13220:
	
l10805:
	movlw	high(02Bh)
	movwf	((c:_sprintf$2311+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$2311))^00h,c
	goto	l10809
	
l10807:
	movlw	high(02Dh)
	movwf	((c:_sprintf$2311+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$2311))^00h,c
	
l10809:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$2311),indf2

	
l10811:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l10817
	line	1422
	
l1644:
	line	1425
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u13231
	goto	u13230
u13231:
	goto	l10817
u13230:
	line	1426
	
l10813:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l10811
	line	1441
	
l10817:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u13241
	goto	u13240

u13241:
	goto	l10847
u13240:
	line	1443
	
l10819:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(030h)
	movwf	indf2
	
l10821:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1444
	
l10823:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u13251
	goto	u13250

u13251:
	goto	l10819
u13250:
	goto	l10847
	line	1454
	
l10825:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u13261
	goto	u13260

u13261:
	goto	l1655
u13260:
	line	1456
	
l10827:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l10829:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1457
	
l10831:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u13271
	goto	u13270

u13271:
	goto	l10827
u13270:
	
l1655:
	line	1460
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u13281
	goto	u13280
u13281:
	goto	l1658
u13280:
	line	1461
	
l10833:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u13291
	goto	u13290
u13291:
	goto	l10837
u13290:
	
l10835:
	movlw	high(02Bh)
	movwf	((c:_sprintf$2312+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$2312))^00h,c
	goto	l10839
	
l10837:
	movlw	high(02Dh)
	movwf	((c:_sprintf$2312+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$2312))^00h,c
	
l10839:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$2312),indf2

	
l10841:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l10847
	line	1469
	
l1658:
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u13301
	goto	u13300
u13301:
	goto	l10847
u13300:
	line	1470
	
l10843:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l10841
	line	1498
	
l10847:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l10863
	line	1515
	
l10849:
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
	line	1517
	goto	l10859
	line	1526
	
l10851:
	movff	(c:sprintf@val),(c:___lwdiv@dividend)
	movff	(c:sprintf@val+1),(c:___lwdiv@dividend+1)
	movf	((c:sprintf@prec))^00h,c,w
	mullw	02h
	movlw	low((_hexpowers))
	addwf	(prodl)^0f00h,c,w
	movwf	tblptrl
	movlw	high((_hexpowers))
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

	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	andlw	low(0Fh)
	movwf	((c:sprintf@idx))^00h,c
	line	1530
	
l10853:
	movlw	low((STR_294))
	addwf	((c:sprintf@idx))^00h,c,w
	movwf	tblptrl
	clrf	tblptrh
	movlw	high((STR_294))
	addwfc	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd	*
	
	movff	tablat,(c:sprintf@c)
	line	1536
	goto	l10859
	line	1502
	
l10857:
	movf	((c:sprintf@flag))^00h,c,w
	andlw	low(0C0h)
	; Switch size 1, requested type "simple"
; Number of cases is 3, Range of values is 0 to 192
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l10849
	xorlw	128^0	; case 128
	skipnz
	goto	l10851
	xorlw	192^128	; case 192
	skipnz
	goto	l10849
	goto	l10859

	line	1550
	
l10859:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l10861:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l10863:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u13311
	goto	u13310

u13311:
	goto	l10857
u13310:
	line	553
	
l10865:
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
	goto	u13321
	goto	u13320
u13321:
	goto	l10657
u13320:
	line	1564
	
l10867:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	clrf	indf2
	line	1567
	
l1674:
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
;;		On entry : 0/5
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
psect	text42,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
global __ptext42
__ptext42:
psect	text42
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
	
_isdigit:
;incstack = 0
	callstack 27
	movwf	((c:isdigit@c))^00h,c
	line	14
	
l10599:
	movlw	low(0)
	movwf	((c:_isdigit$2754))^00h,c
	
l10601:
		movlw	03Ah-0
	cpfslt	((c:isdigit@c))^00h,c
	goto	u12921
	goto	u12920

u12921:
	goto	l10607
u12920:
	
l10603:
		movlw	030h-1
	cpfsgt	((c:isdigit@c))^00h,c
	goto	u12931
	goto	u12930

u12931:
	goto	l10607
u12930:
	
l10605:
	movlw	low(01h)
	movwf	((c:_isdigit$2754))^00h,c
	
l10607:
	movff	(c:_isdigit$2754),??_isdigit+0+0
	rrcf	(??_isdigit+0+0)^00h,c,w
	line	15
	
l2341:
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
;;		On entry : 0/5
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
;;		_main
;;		_menu_handle_button
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text43,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
global __ptext43
__ptext43:
psect	text43
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
	
___wmul:
;incstack = 0
	callstack 27
	line	37
	
l10611:
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
	
l10613:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	line	53
	
l1677:
	return	;funcret
	callstack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	_init_numeric_editor

;; *************** function _init_numeric_editor *****************
;; Defined at:
;;		line 799 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  value           2   26[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;  abs_val         2   34[COMRAM] unsigned int 
;;  sensor_type     1   33[COMRAM] unsigned char 
;;  flow_type       1   30[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/2
;;		On exit  : 3F/3
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        10       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text44,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	799
global __ptext44
__ptext44:
psect	text44
	file	"src\menu.c"
	line	799
	
_init_numeric_editor:
;incstack = 0
	callstack 26
	line	803
	
l11823:
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:init_numeric_editor@sensor_type))^00h,c
	line	804
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:init_numeric_editor@flow_type))^00h,c
	line	807
	
l11825:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+0Fh))&0ffh
	line	809
	
l11827:; BSR set to: 3

	movf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u14701
	goto	u14700
u14701:
	goto	l11835
u14700:
	line	812
	
l11829:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u14711
	goto	u14710

u14711:
	goto	l11833
u14710:
	
l11831:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14721
	goto	u14720

u14721:
	goto	l11849
u14720:
	line	813
	
l11833:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+0Fh))&0ffh
	goto	l11849
	line	815
	
l11835:; BSR set to: 3

		decf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u14731
	goto	u14730

u14731:
	goto	l11841
u14730:
	line	818
	
l11837:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14741
	goto	u14740

u14741:
	goto	l11849
u14740:
	goto	l11833
	line	821
	
l11841:; BSR set to: 3

		movlw	2
	xorwf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u14751
	goto	u14750

u14751:
	goto	l11849
u14750:
	
l11843:; BSR set to: 3

	movf	((c:init_numeric_editor@flow_type))^00h,c,w
	btfss	status,2
	goto	u14761
	goto	u14760
u14761:
	goto	l11849
u14760:
	line	824
	
l11845:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14771
	goto	u14770

u14771:
	goto	l11849
u14770:
	goto	l11833
	line	829
	
l11849:; BSR set to: 3

	movff	(c:init_numeric_editor@value),0+(_menu+0Dh)
	movff	(c:init_numeric_editor@value+1),1+(_menu+0Dh)
	line	832
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u14781
	goto	u14780
u14781:
	goto	l731
u14780:
	
l11851:; BSR set to: 3

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u14790
	goto	u14791

u14791:
	goto	l731
u14790:
	line	833
	
l11853:; BSR set to: 3

	movlw	high(0)
	movwf	((c:init_numeric_editor@value+1))^00h,c
	movlw	low(0)
	movwf	((c:init_numeric_editor@value))^00h,c
	
l731:; BSR set to: 3

	line	836
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u14801
	goto	u14800
u14801:
	goto	l11857
u14800:
	
l11855:; BSR set to: 3

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u14811
	goto	u14810

u14811:
	movlw	1
	goto	u14820
u14810:
	movlw	0
u14820:
	movwf	((c:_init_numeric_editor$1324))^00h,c
	clrf	((c:_init_numeric_editor$1324+1))^00h,c
	goto	l11859
	
l11857:; BSR set to: 3

	movlw	high(0)
	movwf	((c:_init_numeric_editor$1324+1))^00h,c
	movlw	low(0)
	movwf	((c:_init_numeric_editor$1324))^00h,c
	
l11859:; BSR set to: 3

	movff	(c:_init_numeric_editor$1324),0+(_menu+09h)
	line	839
	
l11861:; BSR set to: 3

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u14831
	goto	u14830

u14831:
	goto	l737
u14830:
	
l11863:; BSR set to: 3

	movff	(c:init_numeric_editor@value),(c:init_numeric_editor@abs_val)
	movff	(c:init_numeric_editor@value+1),(c:init_numeric_editor@abs_val+1)
	goto	l11865
	
l737:; BSR set to: 3

	movff	(c:init_numeric_editor@value),??_init_numeric_editor+0+0
	movff	(c:init_numeric_editor@value+1),??_init_numeric_editor+0+0+1
	comf	(??_init_numeric_editor+0+0)^00h,c
	comf	(??_init_numeric_editor+0+1)^00h,c
	infsnz	(??_init_numeric_editor+0+0)^00h,c
	incf	(??_init_numeric_editor+0+1)^00h,c
	movff	??_init_numeric_editor+0+0,(c:init_numeric_editor@abs_val)
	movff	??_init_numeric_editor+0+1,(c:init_numeric_editor@abs_val+1)
	line	840
	
l11865:; BSR set to: 3

	movlw	high(064h)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(064h)
	movwf	((c:___lwdiv@divisor))^00h,c
	movff	(c:init_numeric_editor@abs_val),(c:___lwdiv@dividend)
	movff	(c:init_numeric_editor@abs_val+1),(c:___lwdiv@dividend+1)
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:___lwmod@dividend)
	movff	1+?___lwdiv,(c:___lwmod@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	movlb	3	; () banked
	movwf	(0+(_menu+0Ah))&0ffh
	line	841
	movlw	high(0Ah)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwdiv@divisor))^00h,c
	movff	(c:init_numeric_editor@abs_val),(c:___lwdiv@dividend)
	movff	(c:init_numeric_editor@abs_val+1),(c:___lwdiv@dividend+1)
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:___lwmod@dividend)
	movff	1+?___lwdiv,(c:___lwmod@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	movlb	3	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	line	842
	movff	(c:init_numeric_editor@abs_val),(c:___lwmod@dividend)
	movff	(c:init_numeric_editor@abs_val+1),(c:___lwmod@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	movlb	3	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	line	845
	
l11867:; BSR set to: 3

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u14841
	goto	u14840
u14841:
	movlw	1
	goto	u14850
u14840:
	movlw	0
u14850:
	movwf	(0+(_menu+08h))&0ffh
	line	846
	
l740:; BSR set to: 3

	return	;funcret
	callstack 0
GLOBAL	__end_of_init_numeric_editor
	__end_of_init_numeric_editor:
	signat	_init_numeric_editor,4217
	global	___lwmod

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 7 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        2   14[COMRAM] unsigned int 
;;  divisor         2   16[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
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
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init_time_editor
;;		_rebuild_input_menu
;;		_init_numeric_editor
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text45,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext45
__ptext45:
psect	text45
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
___lwmod:; BSR set to: 3

;incstack = 0
	callstack 27
	line	12
	
l10639:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u12971
	goto	u12970

u12971:
	goto	l2166
u12970:
	line	13
	
l10641:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l10645
	line	15
	
l10643:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l10645:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u12981
	goto	u12980
u12981:
	goto	l10643
u12980:
	line	19
	
l10647:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u12991
	goto	u12990

u12991:
	goto	l10651
u12990:
	line	20
	
l10649:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l10651:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l10653:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l10647
	line	23
	
l2166:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l2173:
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
;;  dividend        2   19[COMRAM] unsigned int 
;;  divisor         2   21[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   24[COMRAM] unsigned int 
;;  counter         1   23[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   19[COMRAM] unsigned int 
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
;;		_init_time_editor
;;		_rebuild_input_menu
;;		_init_numeric_editor
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text46,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
global __ptext46
__ptext46:
psect	text46
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
	
___lwdiv:
;incstack = 0
	callstack 27
	line	13
	
l10617:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l10619:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u12941
	goto	u12940

u12941:
	goto	l2156
u12940:
	line	15
	
l10621:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l10625
	line	17
	
l10623:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l10625:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u12951
	goto	u12950
u12951:
	goto	l10623
u12950:
	line	21
	
l10627:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l10629:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u12961
	goto	u12960

u12961:
	goto	l10635
u12960:
	line	23
	
l10631:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l10633:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l10635:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l10637:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l10627
	line	28
	
l2156:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l2163:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_get_current_numeric_value

;; *************** function _get_current_numeric_value *****************
;; Defined at:
;;		line 848 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  value           2   22[COMRAM] int 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] int 
;; Registers used:
;;		wreg, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : 3F/3
;;		On exit  : 3F/3
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
psect	text47,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	848
global __ptext47
__ptext47:
psect	text47
	file	"src\menu.c"
	line	848
	
_get_current_numeric_value:
;incstack = 0
	callstack 27
	line	850
	
l8393:; BSR set to: 3

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
	line	851
	
l8395:; BSR set to: 3

	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u9491
	goto	u9490
u9491:
	goto	l8399
u9490:
	line	852
	
l8397:; BSR set to: 3

	negf	((c:get_current_numeric_value@value))^00h,c
	comf	((c:get_current_numeric_value@value+1))^00h,c
	btfsc	status,0
	incf	((c:get_current_numeric_value@value+1))^00h,c
	line	853
	
l8399:; BSR set to: 3

	movff	(c:get_current_numeric_value@value),(c:?_get_current_numeric_value)
	movff	(c:get_current_numeric_value@value+1),(c:?_get_current_numeric_value+1)
	line	854
	
l744:; BSR set to: 3

	return	;funcret
	callstack 0
GLOBAL	__end_of_get_current_numeric_value
	__end_of_get_current_numeric_value:
	signat	_get_current_numeric_value,90
	global	_beep

;; *************** function _beep *****************
;; Defined at:
;;		line 162 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  duration_ms     2   14[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2   17[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/3
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
psect	text48,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	162
global __ptext48
__ptext48:
psect	text48
	file	"src\main.c"
	line	162
	
_beep:; BSR set to: 3

;incstack = 0
	callstack 27
	line	164
	
l7539:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	165
	
l7541:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l159
	line	167
	
l7543:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u17717:
decfsz	wreg,f
	bra	u17717
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u17717
	nop2
asmopt pop

	line	165
	
l7545:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l159:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u8211
	goto	u8210

u8211:
	goto	l7543
u8210:
	
l161:
	line	169
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	170
	
l162:
	return	;funcret
	callstack 0
GLOBAL	__end_of_beep
	__end_of_beep:
	signat	_beep,4217
	global	_lcd_init

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 70 in file "src\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
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
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_lcd_cmd
;;		_lcd_write_nibble
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text49,class=CODE,space=0,reloc=2,group=0
	file	"src\lcd.c"
	line	70
global __ptext49
__ptext49:
psect	text49
	file	"src\lcd.c"
	line	70
	
_lcd_init:
;incstack = 0
	callstack 26
	line	73
	
l11919:; BSR set to: 3

	movlw	(0F0h)&0ffh
	andwf	((c:3986))^0f00h,c	;volatile
	line	74
	
l11921:; BSR set to: 3

	bcf	((c:3986))^0f00h,c,5	;volatile
	line	75
	
l11923:; BSR set to: 3

	bcf	((c:3986))^0f00h,c,6	;volatile
	line	76
	
l11925:; BSR set to: 3

	bcf	((c:3986))^0f00h,c,7	;volatile
	line	79
	
l11927:; BSR set to: 3

	bcf	((c:3977))^0f00h,c,6	;volatile
	line	80
	
l11929:; BSR set to: 3

	bcf	((c:3977))^0f00h,c,5	;volatile
	line	81
	
l11931:; BSR set to: 3

	bcf	((c:3977))^0f00h,c,7	;volatile
	line	82
	
l11933:; BSR set to: 3

	movlw	(0)&0ffh
	
	call	_lcd_write_nibble
	line	85
	
l11935:
	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u17727:
decfsz	wreg,f
	bra	u17727
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u17727
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u17727
	nop
asmopt pop

	line	88
	
l11937:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	89
	
l11939:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	90
	
l11941:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	91
	
l11943:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	92
	
l11945:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	93
	
l11947:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	94
	
l11949:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u17737:
decfsz	wreg,f
	bra	u17737
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u17737
asmopt pop

	line	96
	
l11951:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	97
	
l11953:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	98
	
l11955:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	99
	
l11957:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	100
	
l11959:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u17747:
decfsz	wreg,f
	bra	u17747
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u17747
	nop2
asmopt pop

	line	102
	
l11961:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	103
	
l11963:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	104
	
l11965:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	105
	
l11967:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	106
	
l11969:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u17757:
decfsz	wreg,f
	bra	u17757
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u17757
	nop2
asmopt pop

	line	109
	
l11971:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	110
	
l11973:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	111
	
l11975:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	112
	
l11977:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	113
	
l11979:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u17767:
decfsz	wreg,f
	bra	u17767
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u17767
	nop2
asmopt pop

	line	116
	
l11981:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	119
	
l11983:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	122
	
l11985:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	125
	
l11987:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	126
	
l1387:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
	signat	_lcd_init,89
	global	_lcd_cmd

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 17 in file "src\lcd.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1   17[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/3
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
;;		_lcd_init
;;		_lcd_set_cursor
;;		_lcd_clear
;; This function uses a non-reentrant model
;;
psect	text50,class=CODE,space=0,reloc=2,group=0
	line	17
global __ptext50
__ptext50:
psect	text50
	file	"src\lcd.c"
	line	17
	
_lcd_cmd:
;incstack = 0
	callstack 24
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	20
	
l10491:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	21
	
l10493:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	22
	
l10495:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	23
	
l10497:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	24
	
l10499:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	25
	
l10501:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	26
	
l10503:
	asmopt push
asmopt off
	movlw	133
u17777:
decfsz	wreg,f
	bra	u17777
	nop
asmopt pop

	line	29
	
l10505:
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	30
	
l10507:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	31
	
l10509:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	32
	
l10511:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	33
	
l10513:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	34
	
l10515:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	37
	
l10517:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u12831
	goto	u12830

u12831:
	goto	l10521
u12830:
	
l10519:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u12841
	goto	u12840

u12841:
	goto	l10523
u12840:
	line	39
	
l10521:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u17787:
decfsz	wreg,f
	bra	u17787
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u17787
	nop2
asmopt pop

	line	40
	goto	l1381
	line	43
	
l10523:
	asmopt push
asmopt off
	movlw	133
u17797:
decfsz	wreg,f
	bra	u17797
	nop
asmopt pop

	line	45
	
l1381:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
	signat	_lcd_cmd,4217
	global	_lcd_write_nibble

;; *************** function _lcd_write_nibble *****************
;; Defined at:
;;		line 8 in file "src\lcd.c"
;; Parameters:    Size  Location     Type
;;  nibble          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  nibble          1   15[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/3
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
;;		Nothing
;; This function is called by:
;;		_lcd_cmd
;;		_lcd_data
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text51,class=CODE,space=0,reloc=2,group=0
	line	8
global __ptext51
__ptext51:
psect	text51
	file	"src\lcd.c"
	line	8
	
_lcd_write_nibble:
;incstack = 0
	callstack 24
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	10
	
l10489:
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u12751
	goto	u12750
u12751:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u12768
u12750:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u12768:
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not ((1<<1)-1)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	11
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u12771
	goto	u12770
u12771:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u12788
u12770:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u12788:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<1)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	12
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u12791
	goto	u12790
u12791:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u12808
u12790:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u12808:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<2)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	13
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u12811
	goto	u12810
u12811:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u12828
u12810:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u12828:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<3)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	14
	
l1374:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_write_nibble
	__end_of_lcd_write_nibble:
	signat	_lcd_write_nibble,4217
	global	_i2c_init

;; *************** function _i2c_init *****************
;; Defined at:
;;		line 16 in file "src\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/5
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
psect	text52,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	16
global __ptext52
__ptext52:
psect	text52
	file	"src\i2c.c"
	line	16
	
_i2c_init:
;incstack = 0
	callstack 28
	line	19
	
l8625:
	bsf	((c:3988))^0f00h,c,3	;volatile
	line	20
	bsf	((c:3988))^0f00h,c,4	;volatile
	line	23
	
l8627:
	movlw	low(080h)
	movwf	((c:4039))^0f00h,c	;volatile
	line	24
	movlw	low(028h)
	movwf	((c:4038))^0f00h,c	;volatile
	line	25
	movlw	low(0)
	movwf	((c:4037))^0f00h,c	;volatile
	line	30
	movlw	low(013h)
	movwf	((c:4040))^0f00h,c	;volatile
	line	33
	
l8629:
	asmopt push
asmopt off
	movlw	26
u17807:
decfsz	wreg,f
	bra	u17807
	nop2
asmopt pop

	line	34
	
l1429:
	return	;funcret
	callstack 0
GLOBAL	__end_of_i2c_init
	__end_of_i2c_init:
	signat	_i2c_init,89
	global	_get_menu_timeout_seconds

;; *************** function _get_menu_timeout_seconds *****************
;; Defined at:
;;		line 260 in file "src\eeprom.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3F/5
;;		On exit  : 3F/5
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
psect	text53,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	260
global __ptext53
__ptext53:
psect	text53
	file	"src\eeprom.c"
	line	260
	
_get_menu_timeout_seconds:
;incstack = 0
	callstack 28
	line	263
	
l8609:; BSR set to: 5

		movlw	05h-0
	cpfslt	(0+(_system_config+01h))&0ffh
	goto	u9711
	goto	u9710

u9711:
	goto	l8615
u9710:
	line	265
	
l8611:; BSR set to: 5

	movlw	(01Eh)&0ffh
	goto	l1362
	line	267
	
l8615:; BSR set to: 5

		movlw	079h-1
	cpfsgt	(0+(_system_config+01h))&0ffh
	goto	u9721
	goto	u9720

u9721:
	goto	l8621
u9720:
	goto	l8611
	line	271
	
l8621:; BSR set to: 5

	movf	(0+(_system_config+01h))&0ffh,w
	line	272
	
l1362:; BSR set to: 5

	return	;funcret
	callstack 0
GLOBAL	__end_of_get_menu_timeout_seconds
	__end_of_get_menu_timeout_seconds:
	signat	_get_menu_timeout_seconds,89
	global	_encoder_init

;; *************** function _encoder_init *****************
;; Defined at:
;;		line 205 in file "src\encoder.c"
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text54,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	205
global __ptext54
__ptext54:
psect	text54
	file	"src\encoder.c"
	line	205
	
_encoder_init:; BSR set to: 5

;incstack = 0
	callstack 28
	line	208
	
l8757:
	movlw	low(0C4h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	209
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	212
	movlw	high(0)
	movlb	1	; () banked
	movwf	((_encoder_count+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_encoder_count))&0ffh	;volatile
	line	213
	movlw	low(0)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	214
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	215
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	216
	movlw	low(0)
	movwf	((c:_relay_ms_counter))^00h,c
	line	219
	
l8759:; BSR set to: 2

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	220
	
l8761:; BSR set to: 2

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	221
	
l8763:; BSR set to: 2

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	224
	
l8765:; BSR set to: 2

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u9831
	goto	u9830
u9831:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u9838
u9830:
	clrf	(??_encoder_init+0+0)^00h,c
u9838:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u9841
	goto	u9840
u9841:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u9848
u9840:
	clrf	(??_encoder_init+1+0)^00h,c
u9848:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:_enc_state))^00h,c
	line	225
	
l352:
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
;;		On exit  : 3F/5
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
psect	text55,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	180
global __ptext55
__ptext55:
psect	text55
	file	"src\eeprom.c"
	line	180
	
_eeprom_init:
;incstack = 0
	callstack 25
	line	182
	
l8575:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	185
	
l8577:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	189
	
l8583:
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
	
l8585:
	incf	((c:eeprom_init@i))^00h,c
	
l8587:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u9671
	goto	u9670

u9671:
	goto	l8583
u9670:
	line	191
	
l8589:
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
	
l8591:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	195
	
l8593:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u9680
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u9681
	goto	u9680

u9681:
	goto	l8599
u9680:
	line	198
	
l8595:
	call	_load_factory_defaults	;wreg free
	line	199
	
l8597:
	call	_save_current_config	;wreg free
	line	203
	
l8599:
	call	_sync_menu_variables	;wreg free
	line	207
	
l8601:
	movlb	5	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	mullw	02h
	movff	prodl,(c:_menu_timeout_seconds)
	movff	prodh,(c:_menu_timeout_seconds+1)
	line	210
	
l8603:; BSR set to: 5

		movf	((c:_menu_timeout_seconds+1))^00h,c,w
	bnz	u9690
	movlw	10
	subwf	 ((c:_menu_timeout_seconds))^00h,c,w
	btfss	status,0
	goto	u9691
	goto	u9690

u9691:
	goto	l8607
u9690:
	
l8605:; BSR set to: 5

		incf	((c:_menu_timeout_seconds))^00h,c,w
	movlw	1
	subwfb	((c:_menu_timeout_seconds+1))^00h,c,w
	btfss	status,0
	goto	u9701
	goto	u9700

u9701:
	goto	l1340
u9700:
	line	212
	
l8607:; BSR set to: 5

	movlw	high(01Eh)
	movwf	((c:_menu_timeout_seconds+1))^00h,c
	movlw	low(01Eh)
	movwf	((c:_menu_timeout_seconds))^00h,c
	line	214
	
l1340:; BSR set to: 5

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
psect	text56,class=CODE,space=0,reloc=2,group=0
	line	247
global __ptext56
__ptext56:
psect	text56
	file	"src\eeprom.c"
	line	247
	
_sync_menu_variables:; BSR set to: 5

;incstack = 0
	callstack 27
	line	256
	
l8471:
	movff	_input_config,(c:_enable_edit_flag)
	line	257
	movff	0+(_input_config+01h),(c:_sensor_edit_flag)
	line	258
	
l1358:
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
;;		_main
;;		_menu_handle_button
;;		_eeprom_init
;; This function uses a non-reentrant model
;;
psect	text57,class=CODE,space=0,reloc=2,group=0
	line	216
global __ptext57
__ptext57:
psect	text57
	file	"src\eeprom.c"
	line	216
	
_save_current_config:
;incstack = 0
	callstack 26
	line	219
	
l8025:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	223
	
l8031:
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
	
l8033:
	incf	((c:save_current_config@i))^00h,c
	
l8035:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u9111
	goto	u9110

u9111:
	goto	l8031
u9110:
	line	227
	
l8037:
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
	
l8039:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	231
	
l8041:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	232
	
l1345:
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
psect	text58,class=CODE,space=0,reloc=2,group=0
	line	155
global __ptext58
__ptext58:
psect	text58
	file	"src\eeprom.c"
	line	155
	
_eeprom_write_word:
;incstack = 0
	callstack 26
	line	157
	
l7425:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	158
	
l7427:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	159
	
l1319:
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
;;		 -> input_config(384), system_config(128), 
;;  address         2   19[COMRAM] unsigned int 
;;  length          2   21[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2   25[COMRAM] unsigned int 
;;  ptr             2   23[COMRAM] PTR unsigned char 
;;		 -> input_config(384), system_config(128), 
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
psect	text59,class=CODE,space=0,reloc=2,group=0
	line	161
global __ptext59
__ptext59:
psect	text59
	file	"src\eeprom.c"
	line	161
	
_eeprom_write_block:
;incstack = 0
	callstack 26
	line	163
	
l7429:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	164
	
l7431:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l7437
	line	166
	
l7433:
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
	
l7435:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l7437:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u8061
	goto	u8060

u8061:
	goto	l7433
u8060:
	line	168
	
l1325:
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
psect	text60,class=CODE,space=0,reloc=2,group=0
	line	128
global __ptext60
__ptext60:
psect	text60
	file	"src\eeprom.c"
	line	128
	
_eeprom_write_byte:
;incstack = 0
	callstack 26
	line	130
	
l6591:
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
	
l6593:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	139
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	140
	
l6595:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	143
	
l1310:
	line	142
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u6591
	goto	u6590
u6591:
	goto	l1310
u6590:
	
l1312:
	line	144
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	145
	
l1313:
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
;;		 -> input_config(384), system_config(128), 
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
psect	text61,class=CODE,space=0,reloc=2,group=0
	line	92
global __ptext61
__ptext61:
psect	text61
	file	"src\eeprom.c"
	line	92
	
_calculate_config_checksum:
;incstack = 0
	callstack 27
	line	94
	
l7381:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	98
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	100
	
l7387:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	101
	
l7389:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	103
	
l7395:
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
	
l7397:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l7399:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u8030
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u8031
	goto	u8030

u8031:
	goto	l7395
u8030:
	line	98
	
l7401:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l7403:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u8041
	goto	u8040

u8041:
	goto	l7387
u8040:
	line	108
	
l7405:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	109
	
l7407:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1734+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1734))^00h,c
	line	111
	
l7413:
	movf	((c:calculate_config_checksum@j_1734))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j_1734+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	109
	
l7415:
	infsnz	((c:calculate_config_checksum@j_1734))^00h,c
	incf	((c:calculate_config_checksum@j_1734+1))^00h,c
	
l7417:
		movf	((c:calculate_config_checksum@j_1734+1))^00h,c,w
	bnz	u8050
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1734))^00h,c,w
	btfss	status,0
	goto	u8051
	goto	u8050

u8051:
	goto	l7413
u8050:
	
l1303:
	line	114
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	115
	
l1304:
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
psect	text62,class=CODE,space=0,reloc=2,group=0
	line	241
global __ptext62
__ptext62:
psect	text62
	file	"src\eeprom.c"
	line	241
	
_load_factory_defaults:
;incstack = 0
	callstack 26
	line	243
	
l8469:
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
	
l1351:
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
;;		 -> clock_menu(25), input_menu(75), input_config(384), system_config(128), 
;;  s1              2   16[COMRAM] PTR const void 
;;		 -> system_defaults(128), factory_defaults(384), clock_menu_template(25), flow_analog_template(55), 
;;		 -> flow_digital_template(40), temp_menu_template(45), pressure_menu_template(70), 
;;  n               2   18[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  s               2   22[COMRAM] PTR const unsigned char 
;;		 -> system_defaults(128), factory_defaults(384), clock_menu_template(25), flow_analog_template(55), 
;;		 -> flow_digital_template(40), temp_menu_template(45), pressure_menu_template(70), 
;;  d               2   20[COMRAM] PTR unsigned char 
;;		 -> clock_menu(25), input_menu(75), input_config(384), system_config(128), 
;;  tmp             1   24[COMRAM] unsigned char 
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
;;		_rebuild_clock_menu
;;		_load_factory_defaults
;; This function uses a non-reentrant model
;;
psect	text63,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
global __ptext63
__ptext63:
psect	text63
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
	
_memcpy:
;incstack = 0
	callstack 26
	line	34
	
l7357:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l7367
	line	37
	
l7359:
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
	
l7361:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l7363:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l7365:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l7367:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u8001
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u8001
	goto	u8000

u8001:
	goto	l7359
u8000:
	line	41
	
l2347:
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
psect	text64,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	147
global __ptext64
__ptext64:
psect	text64
	file	"src\eeprom.c"
	line	147
	
_eeprom_read_word:
;incstack = 0
	callstack 26
	line	150
	
l8453:
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
	
l8455:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	153
	
l1316:
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
;;		 -> input_config(384), system_config(128), 
;;  address         2   18[COMRAM] unsigned int 
;;  length          2   20[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2   24[COMRAM] unsigned int 
;;  ptr             2   22[COMRAM] PTR unsigned char 
;;		 -> input_config(384), system_config(128), 
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
psect	text65,class=CODE,space=0,reloc=2,group=0
	line	170
global __ptext65
__ptext65:
psect	text65
	file	"src\eeprom.c"
	line	170
	
_eeprom_read_block:
;incstack = 0
	callstack 26
	line	172
	
l8459:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	173
	
l8461:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l8467
	line	175
	
l8463:
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
	
l8465:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l8467:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u9531
	goto	u9530

u9531:
	goto	l8463
u9530:
	line	177
	
l1331:
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
psect	text66,class=CODE,space=0,reloc=2,group=0
	line	118
global __ptext66
__ptext66:
psect	text66
	file	"src\eeprom.c"
	line	118
	
_eeprom_read_byte:
;incstack = 0
	callstack 26
	line	120
	
l7419:
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
	
l7421:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	126
	
l1307:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_read_byte
	__end_of_eeprom_read_byte:
	signat	_eeprom_read_byte,4217
	global	_ad7994_read_channel

;; *************** function _ad7994_read_channel *****************
;; Defined at:
;;		line 60 in file "src\ad7994.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1   26[COMRAM] unsigned char 
;;  buf            40    0        unsigned char [40]
;;  result          2   27[COMRAM] unsigned int 
;;  config_byte     1   31[COMRAM] unsigned char 
;;  lsb             1   30[COMRAM] unsigned char 
;;  msb             1   29[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   22[COMRAM] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        10       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_i2c_read
;;		_i2c_start
;;		_i2c_stop
;;		_i2c_write
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text67,class=CODE,space=0,reloc=2,group=0
	file	"src\ad7994.c"
	line	60
global __ptext67
__ptext67:
psect	text67
	file	"src\ad7994.c"
	line	60
	
_ad7994_read_channel:
;incstack = 0
	callstack 26
	movwf	((c:ad7994_read_channel@channel))^00h,c
	line	70
	
l8903:
	goto	l8915
	line	73
	
l8905:
	movlw	low(018h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	74
	goto	l8917
	line	76
	
l8907:
	movlw	low(028h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	77
	goto	l8917
	line	79
	
l8909:
	movlw	low(048h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	80
	goto	l8917
	line	82
	
l8911:
	movlw	low(088h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	83
	goto	l8917
	line	84
	
l1572:
	line	86
	setf	((c:?_ad7994_read_channel))^00h,c
	setf	((c:?_ad7994_read_channel+1))^00h,c
	goto	l1573
	line	70
	
l8915:
	movf	((c:ad7994_read_channel@channel))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 1 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l8905
	xorlw	2^1	; case 2
	skipnz
	goto	l8907
	xorlw	3^2	; case 3
	skipnz
	goto	l8909
	xorlw	4^3	; case 4
	skipnz
	goto	l8911
	goto	l1572

	line	89
	
l8917:
	call	_i2c_start	;wreg free
	line	90
	
l8919:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	line	91
	
l8921:
	movlw	(02h)&0ffh
	
	call	_i2c_write
	line	92
	
l8923:
	movf	((c:ad7994_read_channel@config_byte))^00h,c,w
	
	call	_i2c_write
	line	93
	
l8925:
	call	_i2c_stop	;wreg free
	line	95
	
l8927:
	bsf	((c:3979))^0f00h,c,5	;volatile
	line	96
	
l8929:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	97
	
l8931:
	bcf	((c:3979))^0f00h,c,5	;volatile
	line	98
	
l8933:
	asmopt push
asmopt off
	movlw	5
u17817:
decfsz	wreg,f
	bra	u17817
	nop
asmopt pop

	line	100
	
l8935:
	call	_i2c_start	;wreg free
	line	101
	
l8937:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	line	102
	
l8939:
	movlw	(0)&0ffh
	
	call	_i2c_write
	line	103
	
l8941:
	call	_i2c_stop	;wreg free
	line	105
	
l8943:
	call	_i2c_start	;wreg free
	line	106
	
l8945:
	movlw	(045h)&0ffh
	
	call	_i2c_write
	line	107
	
l8947:
	movlw	(01h)&0ffh
	
	call	_i2c_read
	movwf	((c:ad7994_read_channel@msb))^00h,c
	line	108
	
l8949:
	movlw	(0)&0ffh
	
	call	_i2c_read
	movwf	((c:ad7994_read_channel@lsb))^00h,c
	line	109
	
l8951:
	call	_i2c_stop	;wreg free
	line	111
	movf	((c:ad7994_read_channel@msb))^00h,c,w
	movwf	(??_ad7994_read_channel+0+0)^00h,c
	movf	((c:ad7994_read_channel@lsb))^00h,c,w
	movwf	((c:ad7994_read_channel@result))^00h,c
	movff	??_ad7994_read_channel+0+0,((c:ad7994_read_channel@result+1))
	line	116
	
l8953:
	movlw	low(0FFFh)
	andwf	((c:ad7994_read_channel@result))^00h,c
	movlw	high(0FFFh)
	andwf	((c:ad7994_read_channel@result+1))^00h,c
	line	121
	
l8955:
	movff	(c:ad7994_read_channel@result),(c:?_ad7994_read_channel)
	movff	(c:ad7994_read_channel@result+1),(c:?_ad7994_read_channel+1)
	line	122
	
l1573:
	return	;funcret
	callstack 0
GLOBAL	__end_of_ad7994_read_channel
	__end_of_ad7994_read_channel:
	signat	_ad7994_read_channel,4218
	global	_i2c_read

;; *************** function _i2c_read *****************
;; Defined at:
;;		line 142 in file "src\i2c.c"
;; Parameters:    Size  Location     Type
;;  ack             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ack             1   18[COMRAM] unsigned char 
;;  timeout         2   19[COMRAM] unsigned int 
;;  data            1   21[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_i2c_wait_idle
;; This function is called by:
;;		_rtc_read_time
;;		_ad7994_read_channel
;; This function uses a non-reentrant model
;;
psect	text68,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	142
global __ptext68
__ptext68:
psect	text68
	file	"src\i2c.c"
	line	142
	
_i2c_read:
;incstack = 0
	callstack 26
	movwf	((c:i2c_read@ack))^00h,c
	line	146
	
l8473:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u9541
	goto	u9540
u9541:
	goto	l1470
u9540:
	line	147
	
l8475:
	movlw	(0FFh)&0ffh
	goto	l1471
	
l1470:
	line	149
	bsf	((c:4037))^0f00h,c,3	;volatile
	line	152
	
l8479:
	movlw	high(03E8h)
	movwf	((c:i2c_read@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_read@timeout))^00h,c
	line	153
	goto	l1472
	line	155
	
l8481:
	decf	((c:i2c_read@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_read@timeout+1))^00h,c
	movf	((c:i2c_read@timeout))^00h,c,w
iorwf	((c:i2c_read@timeout+1))^00h,c,w
	btfss	status,2
	goto	u9551
	goto	u9550

u9551:
	goto	l1472
u9550:
	goto	l8475
	line	157
	
l1472:
	line	153
	btfss	((c:4039))^0f00h,c,0	;volatile
	goto	u9561
	goto	u9560
u9561:
	goto	l8481
u9560:
	
l1475:
	line	159
	movff	(c:4041),(c:i2c_read@data)	;volatile
	line	161
	
l8487:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u9571
	goto	u9570
u9571:
	goto	l8493
u9570:
	line	162
	
l8489:
	movf	((c:i2c_read@data))^00h,c,w
	goto	l1471
	line	165
	
l8493:
	movf	((c:i2c_read@ack))^00h,c,w
	btfsc	status,2
	goto	u9581
	goto	u9580
u9581:
	clrf	(??_i2c_read+0+0)^00h,c
	incf	(??_i2c_read+0+0)^00h,c
	goto	u9598
u9580:
	clrf	(??_i2c_read+0+0)^00h,c
u9598:
	swapf	(??_i2c_read+0+0)^00h,c
	rlncf	(??_i2c_read+0+0)^00h,c
	movf	((c:4037))^0f00h,c,w	;volatile
	xorwf	(??_i2c_read+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<5)
	xorwf	(??_i2c_read+0+0)^00h,c,w
	movwf	((c:4037))^0f00h,c	;volatile
	line	166
	
l8495:
	bsf	((c:4037))^0f00h,c,4	;volatile
	line	169
	
l8497:
	movlw	high(03E8h)
	movwf	((c:i2c_read@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_read@timeout))^00h,c
	line	170
	goto	l1477
	line	172
	
l8499:
	decf	((c:i2c_read@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_read@timeout+1))^00h,c
	movf	((c:i2c_read@timeout))^00h,c,w
iorwf	((c:i2c_read@timeout+1))^00h,c,w
	btfss	status,2
	goto	u9601
	goto	u9600

u9601:
	goto	l1477
u9600:
	goto	l8489
	line	174
	
l1477:
	line	170
	btfsc	((c:4037))^0f00h,c,4	;volatile
	goto	u9611
	goto	u9610
u9611:
	goto	l8499
u9610:
	goto	l8489
	line	177
	
l1471:
	return	;funcret
	callstack 0
GLOBAL	__end_of_i2c_read
	__end_of_i2c_read:
	signat	_i2c_read,4217
	global	_ad7994_init

;; *************** function _ad7994_init *****************
;; Defined at:
;;		line 14 in file "src\ad7994.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
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
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_i2c_start
;;		_i2c_stop
;;		_i2c_write
;;		_uart_println
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text69,class=CODE,space=0,reloc=2,group=0
	file	"src\ad7994.c"
	line	14
global __ptext69
__ptext69:
psect	text69
	file	"src\ad7994.c"
	line	14
	
_ad7994_init:
;incstack = 0
	callstack 25
	line	16
	
l8693:
		movlw	low(STR_282)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_282)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	18
	
l8695:
	bcf	((c:3988))^0f00h,c,5	;volatile
	line	19
	
l8697:
	bcf	((c:3979))^0f00h,c,5	;volatile
	line	20
	
l8699:
	asmopt push
asmopt off
movlw	104
movwf	(??_ad7994_init+0+0)^00h,c
	movlw	228
u17827:
decfsz	wreg,f
	bra	u17827
	decfsz	(??_ad7994_init+0+0)^00h,c,f
	bra	u17827
	nop2
asmopt pop

	line	21
	
l8701:
		movlw	low(STR_283)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_283)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	23
	
l8703:
		movlw	low(STR_284)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_284)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	25
	
l8705:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u9791
	goto	u9790
u9791:
	goto	l8713
u9790:
	line	27
	
l8707:
		movlw	low(STR_285)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_285)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	28
	
l8709:
	movlw	(01h)&0ffh
	goto	l1560
	line	31
	
l8713:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9801
	goto	u9800
u9801:
	goto	l8723
u9800:
	line	33
	
l8715:
		movlw	low(STR_286)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_286)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	34
	
l8717:
	call	_i2c_stop	;wreg free
	line	35
	
l8719:
	movlw	(02h)&0ffh
	goto	l1560
	line	37
	
l8723:
		movlw	low(STR_287)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_287)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	39
	
l8725:
	movlw	(02h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9811
	goto	u9810
u9811:
	goto	l8735
u9810:
	line	41
	
l8727:
		movlw	low(STR_288)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_288)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	42
	
l8729:
	call	_i2c_stop	;wreg free
	line	43
	
l8731:
	movlw	(03h)&0ffh
	goto	l1560
	line	45
	
l8735:
		movlw	low(STR_289)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_289)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	47
	
l8737:
	movlw	(08h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9821
	goto	u9820
u9821:
	goto	l8747
u9820:
	line	49
	
l8739:
		movlw	low(STR_290)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_290)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	50
	
l8741:
	call	_i2c_stop	;wreg free
	line	51
	
l8743:
	movlw	(04h)&0ffh
	goto	l1560
	line	53
	
l8747:
		movlw	low(STR_291)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_291)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	55
	
l8749:
	call	_i2c_stop	;wreg free
	line	56
	
l8751:
		movlw	low(STR_292)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_292)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	57
	
l8753:
	movlw	(0)&0ffh
	line	58
	
l1560:
	return	;funcret
	callstack 0
GLOBAL	__end_of_ad7994_init
	__end_of_ad7994_init:
	signat	_ad7994_init,89
	global	_uart_println

;; *************** function _uart_println *****************
;; Defined at:
;;		line 80 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   17[COMRAM] PTR const unsigned char 
;;		 -> STR_292(29), STR_291(38), STR_290(43), STR_289(38), 
;;		 -> STR_288(49), STR_287(31), STR_286(39), STR_285(31), 
;;		 -> STR_284(37), STR_283(28), STR_282(22), rtc_read_time@debug_buf(80), 
;;		 -> STR_280(20), STR_275(25), menu_handle_button@buf_1581(50), menu_handle_button@buf_1571(50), 
;;		 -> STR_262(27), menu_handle_button@buf_1549(50), menu_handle_button@buf(50), menu_handle_encoder@buf_1516(50), 
;;		 -> menu_handle_encoder@buf_1513(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), handle_numeric_rotation@buf(50), 
;;		 -> STR_192(31), rebuild_input_menu@buf(50), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), STR_133(29), init_time_editor@buf(60), STR_44(21), 
;;		 -> STR_43(20), STR_42(36), STR_39(33), STR_38(21), 
;;		 -> STR_37(20), STR_36(22), STR_33(26), STR_32(15), 
;;		 -> STR_31(20), main@buf_687(30), main@buf_660(40), main@buf_657(60), 
;;		 -> main@buf_652(50), STR_26(16), main@time_buf(60), STR_24(19), 
;;		 -> STR_23(22), STR_22(22), STR_21(24), STR_20(19), 
;;		 -> STR_19(22), STR_16(23), STR_15(28), main@buf_618(30), 
;;		 -> STR_13(20), STR_12(36), STR_11(34), STR_10(42), 
;;		 -> STR_9(37), STR_8(16), STR_7(20), main@buf(50), 
;;		 -> STR_5(23), STR_4(29), STR_2(42), trigger_relay_pulse@buf(60), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/5
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
;;		_trigger_relay_pulse
;;		_main
;;		_init_time_editor
;;		_handle_time_rotation
;;		_menu_update_time_value
;;		_rebuild_input_menu
;;		_handle_numeric_rotation
;;		_rebuild_clock_menu
;;		_menu_handle_encoder
;;		_menu_handle_button
;;		_rtc_read_time
;;		_ad7994_init
;; This function uses a non-reentrant model
;;
psect	text70,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	80
global __ptext70
__ptext70:
psect	text70
	file	"src\main.c"
	line	80
	
_uart_println:
;incstack = 0
	callstack 26
	line	82
	
l6669:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	83
	
l6671:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	84
	
l6673:
	movlw	(0Ah)&0ffh
	
	call	_uart_write
	line	85
	
l138:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_println
	__end_of_uart_println:
	signat	_uart_println,4217
	global	_uart_print

;; *************** function _uart_print *****************
;; Defined at:
;;		line 72 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   15[COMRAM] PTR const unsigned char 
;;		 -> STR_292(29), STR_291(38), STR_290(43), STR_289(38), 
;;		 -> STR_288(49), STR_287(31), STR_286(39), STR_285(31), 
;;		 -> STR_284(37), STR_283(28), STR_282(22), rtc_read_time@debug_buf(80), 
;;		 -> STR_280(20), STR_275(25), menu_handle_button@buf_1581(50), menu_handle_button@buf_1571(50), 
;;		 -> STR_262(27), menu_handle_button@buf_1549(50), menu_handle_button@buf(50), menu_handle_encoder@buf_1516(50), 
;;		 -> menu_handle_encoder@buf_1513(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), handle_numeric_rotation@buf(50), 
;;		 -> STR_192(31), rebuild_input_menu@buf(50), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), STR_133(29), init_time_editor@buf(60), STR_44(21), 
;;		 -> STR_43(20), STR_42(36), STR_39(33), STR_38(21), 
;;		 -> STR_37(20), STR_36(22), STR_33(26), STR_32(15), 
;;		 -> STR_31(20), main@buf_687(30), main@buf_660(40), main@buf_657(60), 
;;		 -> main@buf_652(50), STR_26(16), main@time_buf(60), STR_24(19), 
;;		 -> STR_23(22), STR_22(22), STR_21(24), STR_20(19), 
;;		 -> STR_19(22), STR_16(23), STR_15(28), main@buf_618(30), 
;;		 -> STR_13(20), STR_12(36), STR_11(34), STR_10(42), 
;;		 -> STR_9(37), STR_8(16), STR_7(20), main@buf(50), 
;;		 -> STR_5(23), STR_4(29), STR_2(42), trigger_relay_pulse@buf(60), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/5
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
psect	text71,class=CODE,space=0,reloc=2,group=0
	line	72
global __ptext71
__ptext71:
psect	text71
	file	"src\main.c"
	line	72
	
_uart_print:
;incstack = 0
	callstack 26
	line	74
	
l6559:
	goto	l6565
	line	76
	
l6561:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u6527
	tblrd	*
	
	movf	tablat,w
	bra	u6520
u6527:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u6520:
	
	call	_uart_write
	
l6563:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	74
	
l6565:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u6537
	tblrd	*
	
	movf	tablat,w
	bra	u6530
u6537:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u6530:
	iorlw	0
	btfss	status,2
	goto	u6541
	goto	u6540
u6541:
	goto	l6561
u6540:
	line	78
	
l135:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_print
	__end_of_uart_print:
	signat	_uart_print,4217
	global	_uart_write

;; *************** function _uart_write *****************
;; Defined at:
;;		line 65 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1   14[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/5
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
psect	text72,class=CODE,space=0,reloc=2,group=0
	line	65
global __ptext72
__ptext72:
psect	text72
	file	"src\main.c"
	line	65
	
_uart_write:
;incstack = 0
	callstack 27
	movwf	((c:uart_write@c))^00h,c
	line	67
	
l6531:
	line	68
	
l126:
	line	67
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u6481
	goto	u6480
u6481:
	goto	l126
u6480:
	line	69
	
l6533:
	movff	(c:uart_write@c),(c:4013)	;volatile
	line	70
	
l129:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_write
	__end_of_uart_write:
	signat	_uart_write,4217
	global	_i2c_write

;; *************** function _i2c_write *****************
;; Defined at:
;;		line 119 in file "src\i2c.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1   14[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
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
;;		_rtc_write_register
;;		_rtc_set_time
;;		_rtc_read_time
;;		_ad7994_init
;;		_ad7994_read_channel
;; This function uses a non-reentrant model
;;
psect	text73,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	119
global __ptext73
__ptext73:
psect	text73
	file	"src\i2c.c"
	line	119
	
_i2c_write:
;incstack = 0
	callstack 27
	movwf	((c:i2c_write@data))^00h,c
	line	121
	
l7467:
	movff	(c:i2c_write@data),(c:4041)	;volatile
	line	125
	
l1463:
	line	124
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u8131
	goto	u8130
u8131:
	goto	l1463
u8130:
	
l1465:
	line	126
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	129
	btfss	((c:4037))^0f00h,c,6	;volatile
	goto	u8141
	goto	u8140
u8141:
	goto	l7473
u8140:
	line	131
	
l7469:
	movlw	(01h)&0ffh
	goto	l1467
	line	134
	
l7473:
	movlw	(0)&0ffh
	line	135
	
l1467:
	return	;funcret
	callstack 0
GLOBAL	__end_of_i2c_write
	__end_of_i2c_write:
	signat	_i2c_write,4217
	global	_i2c_stop

;; *************** function _i2c_stop *****************
;; Defined at:
;;		line 99 in file "src\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  timeout         2   17[COMRAM] unsigned int 
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
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_i2c_wait_idle
;; This function is called by:
;;		_rtc_write_register
;;		_rtc_set_time
;;		_rtc_read_time
;;		_ad7994_init
;;		_ad7994_read_channel
;; This function uses a non-reentrant model
;;
psect	text74,class=CODE,space=0,reloc=2,group=0
	line	99
global __ptext74
__ptext74:
psect	text74
	file	"src\i2c.c"
	line	99
	
_i2c_stop:
;incstack = 0
	callstack 26
	line	101
	
l7457:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u8101
	goto	u8100
u8101:
	goto	l1455
u8100:
	goto	l1456
	line	102
	
l1455:
	line	104
	bsf	((c:4037))^0f00h,c,2	;volatile
	line	107
	
l7461:
	movlw	high(03E8h)
	movwf	((c:i2c_stop@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_stop@timeout))^00h,c
	line	108
	goto	l1457
	line	110
	
l7463:
	decf	((c:i2c_stop@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_stop@timeout+1))^00h,c
	movf	((c:i2c_stop@timeout))^00h,c,w
iorwf	((c:i2c_stop@timeout+1))^00h,c,w
	btfss	status,2
	goto	u8111
	goto	u8110

u8111:
	goto	l1457
u8110:
	goto	l1456
	line	112
	
l1457:
	line	108
	btfsc	((c:4037))^0f00h,c,2	;volatile
	goto	u8121
	goto	u8120
u8121:
	goto	l7463
u8120:
	line	113
	
l1456:
	return	;funcret
	callstack 0
GLOBAL	__end_of_i2c_stop
	__end_of_i2c_stop:
	signat	_i2c_stop,89
	global	_i2c_start

;; *************** function _i2c_start *****************
;; Defined at:
;;		line 57 in file "src\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  timeout         2   17[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_i2c_wait_idle
;; This function is called by:
;;		_rtc_write_register
;;		_rtc_set_time
;;		_rtc_read_time
;;		_ad7994_init
;;		_ad7994_read_channel
;; This function uses a non-reentrant model
;;
psect	text75,class=CODE,space=0,reloc=2,group=0
	line	57
global __ptext75
__ptext75:
psect	text75
	file	"src\i2c.c"
	line	57
	
_i2c_start:
;incstack = 0
	callstack 26
	line	59
	
l7439:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u8071
	goto	u8070
u8071:
	goto	l1439
u8070:
	line	60
	
l7441:
	movlw	(01h)&0ffh
	goto	l1440
	
l1439:
	line	62
	bsf	((c:4037))^0f00h,c,0	;volatile
	line	65
	
l7445:
	movlw	high(03E8h)
	movwf	((c:i2c_start@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_start@timeout))^00h,c
	line	66
	goto	l1441
	line	68
	
l7447:
	decf	((c:i2c_start@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_start@timeout+1))^00h,c
	movf	((c:i2c_start@timeout))^00h,c,w
iorwf	((c:i2c_start@timeout+1))^00h,c,w
	btfss	status,2
	goto	u8081
	goto	u8080

u8081:
	goto	l1441
u8080:
	goto	l7441
	line	70
	
l1441:
	line	66
	btfsc	((c:4037))^0f00h,c,0	;volatile
	goto	u8091
	goto	u8090
u8091:
	goto	l7447
u8090:
	line	72
	
l7453:
	movlw	(0)&0ffh
	line	73
	
l1440:
	return	;funcret
	callstack 0
GLOBAL	__end_of_i2c_start
	__end_of_i2c_start:
	signat	_i2c_start,89
	global	_i2c_wait_idle

;; *************** function _i2c_wait_idle *****************
;; Defined at:
;;		line 40 in file "src\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  timeout         2   15[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
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
;;		_i2c_start
;;		_i2c_stop
;;		_i2c_read
;; This function uses a non-reentrant model
;;
psect	text76,class=CODE,space=0,reloc=2,group=0
	line	40
global __ptext76
__ptext76:
psect	text76
	file	"src\i2c.c"
	line	40
	
_i2c_wait_idle:
;incstack = 0
	callstack 26
	line	42
	
l6597:
	movlw	high(03E8h)
	movwf	((c:i2c_wait_idle@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_wait_idle@timeout))^00h,c
	line	45
	goto	l6605
	line	47
	
l6599:
	decf	((c:i2c_wait_idle@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_wait_idle@timeout+1))^00h,c
	movf	((c:i2c_wait_idle@timeout))^00h,c,w
iorwf	((c:i2c_wait_idle@timeout+1))^00h,c,w
	btfss	status,2
	goto	u6601
	goto	u6600

u6601:
	goto	l6605
u6600:
	line	48
	
l6601:
	movlw	(01h)&0ffh
	goto	l1435
	line	45
	
l6605:
	movff	(c:4037),??_i2c_wait_idle+0+0	;volatile
	movlw	01Fh
	andwf	(??_i2c_wait_idle+0+0)^00h,c
	btfss	status,2
	goto	u6611
	goto	u6610
u6611:
	goto	l6599
u6610:
	
l6607:
	btfsc	((c:4039))^0f00h,c,2	;volatile
	goto	u6621
	goto	u6620
u6621:
	goto	l6599
u6620:
	line	50
	
l6609:
	movlw	(0)&0ffh
	line	51
	
l1435:
	return	;funcret
	callstack 0
GLOBAL	__end_of_i2c_wait_idle
	__end_of_i2c_wait_idle:
	signat	_i2c_wait_idle,89
	global	_isr

;; *************** function _isr *****************
;; Defined at:
;;		line 44 in file "src\encoder.c"
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
	line	44
	
_isr:
;incstack = 0
	callstack 22
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
	line	46
	
i2l10367:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u1247_41
	goto	i2u1247_40
i2u1247_41:
	goto	i2l349
i2u1247_40:
	line	49
	
i2l10369:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	50
	
i2l10371:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	52
	
i2l10373:
	incf	((c:_relay_ms_counter))^00h,c
	line	53
	
i2l10375:
		movlw	0Ah-1
	cpfsgt	((c:_relay_ms_counter))^00h,c
	goto	i2u1248_41
	goto	i2u1248_40

i2u1248_41:
	goto	i2l10397
i2u1248_40:
	line	55
	
i2l10377:
	movlw	low(0)
	movwf	((c:_relay_ms_counter))^00h,c
	line	57
	
i2l10379:
	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1249_41
	goto	i2u1249_40

i2u1249_41:
	goto	i2l10387
i2u1249_40:
	
i2l10381:; BSR set to: 0

	movf	((c:_relay_latch_mode))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1250_41
	goto	i2u1250_40
i2u1250_41:
	goto	i2l10387
i2u1250_40:
	
i2l10383:; BSR set to: 0

	movlb	2	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	i2u1251_41
	goto	i2u1251_40

i2u1251_41:
	goto	i2l10387
i2u1251_40:
	line	59
	
i2l10385:; BSR set to: 2

	decf	((_relay_counter))&0ffh	;volatile
	btfss	status,0
	decf	((_relay_counter+1))&0ffh	;volatile
	line	60
	goto	i2l10397
	line	61
	
i2l10387:
	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1252_41
	goto	i2u1252_40

i2u1252_41:
	goto	i2l10397
i2u1252_40:
	
i2l10389:; BSR set to: 0

	movf	((c:_relay_latch_mode))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1253_41
	goto	i2u1253_40
i2u1253_41:
	goto	i2l10397
i2u1253_40:
	
i2l10391:; BSR set to: 0

	movlb	2	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1254_41
	goto	i2u1254_40

i2u1254_41:
	goto	i2l10397
i2u1254_40:
	line	64
	
i2l10393:; BSR set to: 2

	bsf	((c:3979))^0f00h,c,1	;volatile
	line	65
	
i2l10395:; BSR set to: 2

	movlw	low(0)
	movlb	0	; () banked
	movwf	((_relay_state))&0ffh	;volatile
	line	71
	
i2l10397:
	incf	((c:_ms_counter))^00h,c	;volatile
	line	72
	
i2l10399:
		movlw	02h-1
	cpfsgt	((c:_ms_counter))^00h,c	;volatile
	goto	i2u1255_41
	goto	i2u1255_40

i2u1255_41:
	goto	i2l10415
i2u1255_40:
	line	74
	
i2l10401:
	movlw	low(0)
	movwf	((c:_ms_counter))^00h,c	;volatile
	line	75
	
i2l10403:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1256_41
	goto	i2u1256_40

i2u1256_41:
	goto	i2l10415
i2u1256_40:
	line	77
	
i2l10405:
	decf	((c:_menu_timeout_timer))^00h,c	;volatile
	btfss	status,0
	decf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	line	80
	
i2l10407:
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
	goto	i2u1257_41
	goto	i2u1257_40

i2u1257_41:
	goto	i2l10411
i2u1257_40:
	line	83
	
i2l10409:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_timeout_debug_flag))&0ffh	;volatile
	line	86
	
i2l10411:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1258_41
	goto	i2u1258_40

i2u1258_41:
	goto	i2l10415
i2u1258_40:
	line	88
	
i2l10413:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	94
	
i2l10415:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u1259_41
	goto	i2u1259_40
i2u1259_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u1259_48
i2u1259_40:
	clrf	(??_isr+0+0)^00h,c
i2u1259_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u1260_41
	goto	i2u1260_40
i2u1260_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u1260_48
i2u1260_40:
	clrf	(??_isr+1+0)^00h,c
i2u1260_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	95
	
i2l10417:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	98
	
i2l10419:
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
	line	101
	
i2l10421:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u1261_41
	goto	i2u1261_40
i2u1261_41:
	goto	i2l10447
i2u1261_40:
	line	103
	
i2l10423:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u1262_41
	goto	i2u1262_40

i2u1262_41:
	goto	i2l10435
i2u1262_40:
	line	105
	
i2l10425:
	movlb	1	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	106
	
i2l10427:; BSR set to: 1

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	109
	
i2l10429:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1263_41
	goto	i2u1263_40

i2u1263_41:
	goto	i2l10447
i2u1263_40:
	line	111
	
i2l10431:; BSR set to: 1

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	112
	
i2l10433:; BSR set to: 1

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l10447
	line	115
	
i2l10435:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u1264_41
	goto	i2u1264_40

i2u1264_41:
	goto	i2l10447
i2u1264_40:
	line	117
	
i2l10437:
	movlb	1	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	line	118
	
i2l10439:; BSR set to: 1

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	121
	
i2l10441:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1265_41
	goto	i2u1265_40

i2u1265_41:
	goto	i2l334
i2u1265_40:
	goto	i2l10431
	line	127
	
i2l334:; BSR set to: 1

	line	129
	
i2l10447:
	movff	(c:isr@new_state),(c:_enc_state)
	line	132
	
i2l10449:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	133
	
i2l10451:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u1266_41
	goto	i2u1266_40

i2u1266_41:
	goto	i2l10479
i2u1266_40:
	line	135
	
i2l10453:
	incf	((c:_btn_debounce))^00h,c
	line	136
	
i2l10455:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u1267_41
	goto	i2u1267_40

i2u1267_41:
	goto	i2l349
i2u1267_40:
	line	138
	
i2l10457:
	movff	(c:isr@btn),(c:_last_btn)
	line	139
	
i2l10459:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	141
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1268_41
	goto	i2u1268_40
i2u1268_41:
	goto	i2l10469
i2u1268_40:
	line	144
	
i2l10461:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	145
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	148
	
i2l10463:; BSR set to: 2

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1269_41
	goto	i2u1269_40

i2u1269_41:
	goto	i2l346
i2u1269_40:
	line	150
	
i2l10465:; BSR set to: 2

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	151
	
i2l10467:; BSR set to: 2

	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l349
	line	157
	
i2l10469:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1270_41
	goto	i2u1270_40

i2u1270_41:
	goto	i2l10473
i2u1270_40:
	line	159
	
i2l10471:
	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	160
	goto	i2l343
	line	161
	
i2l10473:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u1271_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1271_41
	goto	i2u1271_40

i2u1271_41:
	goto	i2l10477
i2u1271_40:
	line	163
	
i2l10475:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	164
	goto	i2l343
	line	167
	
i2l10477:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	168
	
i2l343:; BSR set to: 2

	line	170
	movlw	low(01h)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	171
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	goto	i2l349
	line	177
	
i2l10479:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	179
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1272_41
	goto	i2u1272_40
i2u1272_41:
	goto	i2l349
i2u1272_40:
	
i2l10481:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1273_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1273_41
	goto	i2u1273_40

i2u1273_41:
	goto	i2l349
i2u1273_40:
	line	181
	
i2l10483:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	184
	
i2l10485:
		movlw	8
	xorwf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1274_41
	movlw	7
	xorwf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1274_41
	goto	i2u1274_40

i2u1274_41:
	goto	i2l346
i2u1274_40:
	line	186
	
i2l10487:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	goto	i2l349
	line	189
	
i2l346:
	line	203
	
i2l349:
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
psect	text78,class=CODE,space=0,reloc=2,group=0
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext78
__ptext78:
psect	text78
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
i2___lwmod:
;incstack = 0
	callstack 22
	line	12
	
i2l9961:
	movf	((c:i2___lwmod@divisor))^00h,c,w
iorwf	((c:i2___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	i2u1195_41
	goto	i2u1195_40

i2u1195_41:
	goto	i2l2166
i2u1195_40:
	line	13
	
i2l9963:
	movlw	low(01h)
	movwf	((c:i2___lwmod@counter))^00h,c
	line	14
	goto	i2l9967
	line	15
	
i2l9965:
	bcf	status,0
	rlcf	((c:i2___lwmod@divisor))^00h,c
	rlcf	((c:i2___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:i2___lwmod@counter))^00h,c
	line	14
	
i2l9967:
	
	btfss	((c:i2___lwmod@divisor+1))^00h,c,(15)&7
	goto	i2u1196_41
	goto	i2u1196_40
i2u1196_41:
	goto	i2l9965
i2u1196_40:
	line	19
	
i2l9969:
		movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c,w
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	i2u1197_41
	goto	i2u1197_40

i2u1197_41:
	goto	i2l9973
i2u1197_40:
	line	20
	
i2l9971:
	movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c

	line	21
	
i2l9973:
	bcf	status,0
	rrcf	((c:i2___lwmod@divisor+1))^00h,c
	rrcf	((c:i2___lwmod@divisor))^00h,c
	line	22
	
i2l9975:
	decfsz	((c:i2___lwmod@counter))^00h,c
	
	goto	i2l9969
	line	23
	
i2l2166:
	line	24
	movff	(c:i2___lwmod@dividend),(c:?i2___lwmod)
	movff	(c:i2___lwmod@dividend+1),(c:?i2___lwmod+1)
	line	25
	
i2l2173:
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
