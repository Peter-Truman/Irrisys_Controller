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
	FNCALL	_menu_handle_encoder,_menu_draw_utility
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
	FNCALL	_menu_handle_button,_menu_draw_utility
	FNCALL	_menu_handle_button,_menu_update_time_value
	FNCALL	_menu_handle_button,_rebuild_clock_menu
	FNCALL	_menu_handle_button,_rebuild_input_menu
	FNCALL	_menu_handle_button,_rebuild_utility_menu
	FNCALL	_menu_handle_button,_save_current_config
	FNCALL	_menu_handle_button,_sprintf
	FNCALL	_menu_handle_button,_strcmp
	FNCALL	_menu_handle_button,_strcpy
	FNCALL	_menu_handle_button,_trigger_relay_pulse
	FNCALL	_menu_handle_button,_uart_println
	FNCALL	_trigger_relay_pulse,_sprintf
	FNCALL	_trigger_relay_pulse,_uart_println
	FNCALL	_rebuild_utility_menu,___lbdiv
	FNCALL	_rebuild_utility_menu,___lbmod
	FNCALL	_rebuild_utility_menu,___lwdiv
	FNCALL	_rebuild_utility_menu,___lwmod
	FNCALL	_rebuild_utility_menu,_sprintf
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
	FNCALL	_menu_draw_utility,_lcd_clear_line
	FNCALL	_menu_draw_utility,_lcd_print
	FNCALL	_menu_draw_utility,_lcd_print_at
	FNCALL	_menu_draw_utility,_lcd_set_cursor
	FNCALL	_menu_draw_utility,_menu_update_datetime_display
	FNCALL	_menu_draw_utility,_strcpy
	FNCALL	_menu_draw_utility,_strlen
	FNCALL	_menu_update_datetime_display,_lcd_clear_line
	FNCALL	_menu_update_datetime_display,_lcd_print_at
	FNCALL	_menu_update_datetime_display,_sprintf
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
	global	_last_btn
	global	_relay_slp_edit_flag
	global	_display_edit_flag
	global	_flow_type_edit_flag
	global	_enable_edit_flag
	global	_menu_timeout_seconds
	global	_menu_timeout_flag
	global	_value_relay_pulse
	global	_value_display
	global	_value_scale20
	global	_value_scale4
	global	_value_pwr_fail
	global	_value_menu_timeout
	global	_value_log_entries
	global	_value_back
	global	_value_brightness
	global	_value_contrast
	global	_options_menu
	global	_value_sensor
	global	_value_end_runtime
	global	_value_clock_enable
	global	_value_flow_type
	global	_value_rlylow
	global	_value_rlyhigh
	global	_value_slpbp
	global	_value_plpbp
	global	_value_highbp
	global	_value_enable
	global	menu_draw_setup@F2710
	global	_value_clock_display
	global	_value_high_tbp
	global	_value_low_flow_bp
	global	_value_no_flow_bp
	global	_value_low_flow
	global	_value_no_flow
	global	_value_flow_units
	global	_value_high_temp
	global	_value_low_pressure
	global	_value_hi_pressure
	global	_value_rlyslp
	global	_value_rlyplp
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"src\encoder.c"
	line	32

;initializer for _last_btn
	db	low(01h)
	file	"src\menu.c"
	line	29

;initializer for _relay_slp_edit_flag
	db	low(01h)
	line	26

;initializer for _display_edit_flag
	db	low(01h)
	line	23

;initializer for _flow_type_edit_flag
	db	low(01h)
	line	21

;initializer for _enable_edit_flag
	db	low(01h)
psect	idataBANK3,class=CODE,space=0,delta=1,noexec
global __pidataBANK3
__pidataBANK3:
	file	"src\eeprom.c"
	line	11

;initializer for _menu_timeout_seconds
	dw	(01Eh)&0ffffh
	file	"src\encoder.c"
	line	16

;initializer for _menu_timeout_flag
	db	low(01h)
	file	"src\menu.c"
	line	103

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
	line	85

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
	line	77

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
	line	76

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
	line	200

;initializer for _value_pwr_fail
	db	low(030h)
	db	low(030h)
	db	low(03Ah)
	db	low(030h)
	db	low(035h)
	db	low(0)
	line	197

;initializer for _value_menu_timeout
	db	low(030h)
	db	low(030h)
	db	low(03Ah)
	db	low(033h)
	db	low(030h)
	db	low(0)
	line	196

;initializer for _value_log_entries
	db	low(031h)
	db	low(030h)
	db	low(0)
	db   0
	db   0
	db   0
	line	86

;initializer for _value_back
	db	low(042h)
	db	low(061h)
	db	low(063h)
	db	low(06Bh)
	db	low(0)
	line	199

;initializer for _value_brightness
	db	low(035h)
	db	low(030h)
	db	low(0)
	db   0
	line	198

;initializer for _value_contrast
	db	low(035h)
	db	low(030h)
	db	low(0)
	db   0
psect	idataBANK4,class=CODE,space=0,delta=1,noexec
global __pidataBANK4
__pidataBANK4:
	line	66

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

	line	75

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
	line	102

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
	line	101

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
	line	92

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
	line	84

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
	line	81

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
	line	80

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
	line	79

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
	line	78

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
	line	74

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
psect	idataBANK5,class=CODE,space=0,delta=1,noexec
global __pidataBANK5
__pidataBANK5:
	line	1495

;initializer for menu_draw_setup@F2710
		db	low(STR_244)
	db	high(STR_244)

		db	low(STR_245)
	db	high(STR_245)

		db	low(STR_246)
	db	high(STR_246)

		db	low(STR_247)
	db	high(STR_247)

		db	low(STR_248)
	db	high(STR_248)

	line	104

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
	line	98

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
	line	97

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
	line	96

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
	line	95

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
	line	94

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
	line	93

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
	line	90

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
	line	89

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
	line	82

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
	global	_utility_menu_template
psect	mediumconst,class=MEDIUMCONST,space=0,reloc=2,noexec
global __pmediumconst
__pmediumconst:
	db	0
	file	"src\menu.c"
	line	180
_utility_menu_template:
		db	low(STR_132)
	db	high(STR_132)

		db	low(0)
	db	high(0)

	db	low(0)
		db	low(STR_133)
	db	high(STR_133)

		db	low(0)
	db	high(0)

	db	low(0)
		db	low(STR_134)
	db	high(STR_134)

		db	low(0)
	db	high(0)

	db	low(0)
		db	low(STR_135)
	db	high(STR_135)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_136)
	db	high(STR_136)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_137)
	db	high(STR_137)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_138)
	db	high(STR_138)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_139)
	db	high(STR_139)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_140)
	db	high(STR_140)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_utility_menu_template
__end_of_utility_menu_template:
	global	_enc_table
psect	mediumconst
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
	line	53
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
	line	113
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
	line	156
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
	line	131
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
	line	144
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
	line	171
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
	global	_utility_menu_template
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
	global	_relay_latch_mode
	global	_relay_low_edit_flag
	global	_relay_plp_edit_flag
	global	_relay_high_edit_flag
	global	_flow_units_edit_flag
	global	_no_flow_edit_flag
	global	_sensor_edit_flag
	global	_input_config
	global	_relay_state
	global	_current_menu
	global	_current_input
	global	_menu
	global	main@blink_timer
	global	main@last_relay_counter
	global	main@encoder_activity_timer
	global	_relay_counter
	global	_encoder_count
	global	_button_pressed
	global	main@last_menu_state
	global	main@last_relay_state
	global	main@sample_counter
	global	_save_pending
	global	_long_press_beep_flag
	global	_timeout_debug_flag
	global	_button_event
	global	_clock_menu
	global	_utility_menu
	global	_input_menu
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
	
STR_146:
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
	
STR_349:
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
	
STR_222:
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
	
STR_151:
	db	68	;'D'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	32
	db	108	;'l'
	db	111	;'o'
	db	97	;'a'
	db	100	;'d'
	db	101	;'e'
	db	100	;'d'
	db	58	;':'
	db	32
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	47
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	47
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	32
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	58	;':'
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
	
STR_269:
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
	
STR_143:
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
	
STR_351:
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
	
STR_319:
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
	
STR_342:
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
	
STR_347:
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
	
STR_350:
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
	
STR_352:
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
	
STR_333:
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
	
STR_345:
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
	
STR_305:
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
	
STR_308:
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
	
STR_141:
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
	
STR_260:
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
	
STR_310:
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
	
STR_318:
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
	
STR_334:
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
	
STR_307:
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
	
STR_346:
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
	
STR_348:
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
	
STR_223:
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
	
STR_353:
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
	
STR_142:
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
	
STR_224:
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
	
STR_270:
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
	
STR_344:
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
	
STR_314:
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
	
STR_309:
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
	
STR_341:
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
	db	58	;':'
	db	32
	db	99	;'c'
	db	117	;'u'
	db	114	;'r'
	db	114	;'r'
	db	101	;'e'
	db	110	;'n'
	db	116	;'t'
	db	95	;'_'
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
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
	
STR_147:
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
	
STR_322:
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
	
STR_152:
	db	69	;'E'
	db	82	;'R'
	db	82	;'R'
	db	79	;'O'
	db	82	;'R'
	db	58	;':'
	db	32
	db	70	;'F'
	db	97	;'a'
	db	105	;'i'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	32
	db	114	;'r'
	db	101	;'e'
	db	97	;'a'
	db	100	;'d'
	db	32
	db	82	;'R'
	db	84	;'T'
	db	67	;'C'
	db	0
	
STR_311:
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
	
STR_315:
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
	
STR_313:
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
	
STR_144:
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
	
STR_335:
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
	
STR_306:
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
	
STR_343:
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
	
STR_173:
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
	
STR_243:
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
	
STR_233:
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
	
STR_340:
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
	
STR_312:
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
	
STR_355:
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
	
STR_156:
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	47
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	47
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
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
	
STR_292:
	db	68	;'D'
	db	65	;'A'
	db	84	;'T'
	db	69	;'E'
	db	32
	db	97	;'a'
	db	110	;'n'
	db	100	;'d'
	db	32
	db	84	;'T'
	db	73	;'I'
	db	77	;'M'
	db	69	;'E'
	db	0
	
STR_155:
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	47
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	47
	db	32
	db	32
	db	0
	
STR_160:
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	58	;':'
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	58	;':'
	db	32
	db	32
	db	0
	
STR_154:
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	47
	db	32
	db	32
	db	47
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	0
	
STR_153:
	db	32
	db	32
	db	47
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	47
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	0
	
STR_159:
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	58	;':'
	db	32
	db	32
	db	58	;':'
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	0
	
STR_158:
	db	32
	db	32
	db	58	;':'
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
	
STR_295:
	db	91	;'['
	db	83	;'S'
	db	101	;'e'
	db	116	;'t'
	db	32
	db	67	;'C'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
	db	93	;']'
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
	
STR_135:
	db	76	;'L'
	db	111	;'o'
	db	103	;'g'
	db	32
	db	69	;'E'
	db	110	;'n'
	db	116	;'t'
	db	114	;'r'
	db	105	;'i'
	db	101	;'e'
	db	115	;'s'
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
	
STR_288:
	db	91	;'['
	db	83	;'S'
	db	101	;'e'
	db	116	;'t'
	db	32
	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	93	;']'
	db	0
	
STR_286:
	db	91	;'['
	db	83	;'S'
	db	101	;'e'
	db	116	;'t'
	db	32
	db	68	;'D'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
	db	93	;']'
	db	0
	
STR_138:
	db	66	;'B'
	db	114	;'r'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	116	;'t'
	db	110	;'n'
	db	101	;'e'
	db	115	;'s'
	db	115	;'s'
	db	0
	
STR_139:
	db	80	;'P'
	db	119	;'w'
	db	114	;'r'
	db	32
	db	68	;'D'
	db	101	;'e'
	db	116	;'t'
	db	101	;'e'
	db	99	;'c'
	db	116	;'t'
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
	
STR_285:
	db	83	;'S'
	db	69	;'E'
	db	84	;'T'
	db	32
	db	67	;'C'
	db	76	;'L'
	db	79	;'O'
	db	67	;'C'
	db	75	;'K'
	db	0
	
STR_289:
	db	32
	db	83	;'S'
	db	101	;'e'
	db	116	;'t'
	db	32
	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
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
	
STR_287:
	db	32
	db	83	;'S'
	db	101	;'e'
	db	116	;'t'
	db	32
	db	68	;'D'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
	db	0
	
STR_134:
	db	67	;'C'
	db	108	;'l'
	db	101	;'e'
	db	97	;'a'
	db	114	;'r'
	db	32
	db	76	;'L'
	db	111	;'o'
	db	103	;'g'
	db	0
	
STR_132:
	db	83	;'S'
	db	101	;'e'
	db	116	;'t'
	db	32
	db	67	;'C'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
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
	
STR_136:
	db	77	;'M'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	32
	db	84	;'T'
	db	47
	db	79	;'O'
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
	
STR_236:
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_226:
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
	
STR_133:
	db	86	;'V'
	db	105	;'i'
	db	101	;'e'
	db	119	;'w'
	db	32
	db	76	;'L'
	db	111	;'o'
	db	103	;'g'
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
	
STR_137:
	db	67	;'C'
	db	111	;'o'
	db	110	;'n'
	db	116	;'t'
	db	114	;'r'
	db	97	;'a'
	db	115	;'s'
	db	116	;'t'
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
	
STR_294:
	db	85	;'U'
	db	84	;'T'
	db	73	;'I'
	db	76	;'L'
	db	73	;'I'
	db	84	;'T'
	db	89	;'Y'
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
	
STR_354:
	db	40
	db	110	;'n'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	41
	db	0
	
STR_290:
	db	91	;'['
	db	66	;'B'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	93	;']'
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
	
STR_168:
	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	32
	db	0
	
STR_163:
	db	68	;'D'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
	db	32
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
	
STR_178:
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
	
STR_291:
	db	32
	db	66	;'B'
	db	97	;'a'
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
	
STR_180:
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
	
STR_149:
	db	40
	db	0
	
STR_254:
	db	42
	db	0
	
STR_166:
	db	91	;'['
	db	0
STR_106	equ	STR_97+0
STR_114	equ	STR_97+0
STR_125	equ	STR_97+0
STR_130	equ	STR_97+0
STR_52	equ	STR_111+3
STR_206	equ	STR_111+3
STR_251	equ	STR_111+3
STR_194	equ	STR_71+0
STR_204	equ	STR_71+0
STR_209	equ	STR_71+0
STR_268	equ	STR_71+0
STR_339	equ	STR_71+0
STR_124	equ	STR_113+0
STR_60	equ	STR_113+4
STR_220	equ	STR_113+4
STR_145	equ	STR_307+29
STR_174	equ	STR_307+29
STR_261	equ	STR_307+29
STR_100	equ	STR_86+0
STR_109	equ	STR_86+0
STR_117	equ	STR_86+0
STR_51	equ	STR_103+5
STR_196	equ	STR_103+5
STR_250	equ	STR_103+5
STR_208	equ	STR_56+0
STR_296	equ	STR_132+0
STR_247	equ	STR_132+4
STR_98	equ	STR_291+1
STR_107	equ	STR_291+1
STR_115	equ	STR_291+1
STR_126	equ	STR_291+1
STR_131	equ	STR_291+1
STR_140	equ	STR_291+1
STR_248	equ	STR_291+1
STR_293	equ	STR_291+1
STR_298	equ	STR_291+1
STR_105	equ	STR_94+0
STR_61	equ	STR_94+4
STR_185	equ	STR_75+0
STR_188	equ	STR_75+0
STR_191	equ	STR_75+0
STR_201	equ	STR_75+0
STR_211	equ	STR_75+0
STR_264	equ	STR_75+0
STR_337	equ	STR_75+0
STR_207	equ	STR_55+0
STR_44	equ	STR_38+0
STR_76	equ	STR_129+4
STR_186	equ	STR_129+4
STR_189	equ	STR_129+4
STR_192	equ	STR_129+4
STR_202	equ	STR_129+4
STR_212	equ	STR_129+4
STR_265	equ	STR_129+4
STR_338	equ	STR_129+4
STR_50	equ	STR_89+3
STR_177	equ	STR_89+3
STR_249	equ	STR_89+3
STR_118	equ	STR_110+0
STR_99	equ	STR_85+0
STR_108	equ	STR_85+0
STR_116	equ	STR_85+0
STR_127	equ	STR_85+0
STR_195	equ	STR_70+0
STR_205	equ	STR_70+0
STR_210	equ	STR_70+0
STR_187	equ	STR_77+0
STR_190	equ	STR_77+0
STR_193	equ	STR_77+0
STR_203	equ	STR_77+0
STR_213	equ	STR_77+0
STR_266	equ	STR_77+0
STR_176	equ	STR_45+0
STR_263	equ	STR_45+0
STR_175	equ	STR_46+0
STR_262	equ	STR_46+0
STR_336	equ	STR_46+0
STR_179	equ	STR_178+0
STR_197	equ	STR_178+0
STR_198	equ	STR_178+0
STR_216	equ	STR_178+0
STR_217	equ	STR_178+0
STR_323	equ	STR_178+0
STR_324	equ	STR_178+0
STR_327	equ	STR_178+0
STR_328	equ	STR_178+0
STR_330	equ	STR_178+0
STR_331	equ	STR_178+0
STR_182	equ	STR_180+0
STR_218	equ	STR_180+0
STR_325	equ	STR_180+0
STR_326	equ	STR_180+0
STR_329	equ	STR_180+0
STR_332	equ	STR_180+0
STR_161	equ	STR_151+32
STR_162	equ	STR_151+32
STR_181	equ	STR_158+3
STR_183	equ	STR_158+3
STR_184	equ	STR_158+3
STR_200	equ	STR_158+3
STR_219	equ	STR_158+3
STR_221	equ	STR_158+3
STR_267	equ	STR_158+3
STR_276	equ	STR_158+3
STR_279	equ	STR_158+3
STR_316	equ	STR_158+3
STR_317	equ	STR_158+3
STR_321	equ	STR_158+3
STR_157	equ	STR_156+0
STR_225	equ	STR_226+2
STR_320	equ	STR_315+0
STR_199	equ	STR_29+20
STR_275	equ	STR_29+20
STR_277	equ	STR_29+20
STR_278	equ	STR_29+20
STR_297	equ	STR_290+0
STR_167	equ	STR_288+9
STR_172	equ	STR_288+9
STR_235	equ	STR_288+9
STR_241	equ	STR_288+9
STR_253	equ	STR_288+9
STR_257	equ	STR_288+9
STR_283	equ	STR_288+9
STR_300	equ	STR_288+9
STR_303	equ	STR_288+9
STR_171	equ	STR_166+0
STR_234	equ	STR_166+0
STR_239	equ	STR_166+0
STR_252	equ	STR_166+0
STR_256	equ	STR_166+0
STR_281	equ	STR_166+0
STR_299	equ	STR_166+0
STR_301	equ	STR_166+0
STR_215	equ	STR_66+0
STR_40	equ	STR_34+0
STR_280	equ	STR_285+4
STR_101	equ	STR_87+0
STR_120	equ	STR_87+0
STR_102	equ	STR_88+0
STR_121	equ	STR_88+0
STR_43	equ	STR_37+0
STR_258	equ	STR_254+0
STR_150	equ	STR_354+5
STR_165	equ	STR_354+5
STR_170	equ	STR_354+5
STR_229	equ	STR_354+5
STR_232	equ	STR_354+5
STR_242	equ	STR_354+5
STR_284	equ	STR_354+5
STR_304	equ	STR_354+5
STR_164	equ	STR_149+0
STR_169	equ	STR_149+0
STR_228	equ	STR_149+0
STR_231	equ	STR_149+0
STR_240	equ	STR_149+0
STR_282	equ	STR_149+0
STR_302	equ	STR_149+0
STR_214	equ	STR_65+0
STR_148	equ	STR_173+13
STR_227	equ	STR_173+14
STR_230	equ	STR_173+15
STR_237	equ	STR_173+15
STR_255	equ	STR_173+19
STR_259	equ	STR_173+19
STR_47	equ	STR_173+20
STR_48	equ	STR_173+20
STR_49	equ	STR_173+20
STR_53	equ	STR_173+20
STR_54	equ	STR_173+20
STR_57	equ	STR_173+20
STR_58	equ	STR_173+20
STR_59	equ	STR_173+20
STR_62	equ	STR_173+20
STR_63	equ	STR_173+20
STR_64	equ	STR_173+20
STR_67	equ	STR_173+20
STR_68	equ	STR_173+20
STR_69	equ	STR_173+20
STR_72	equ	STR_173+20
STR_73	equ	STR_173+20
STR_74	equ	STR_173+20
STR_78	equ	STR_173+20
STR_79	equ	STR_173+20
STR_238	equ	STR_173+20
STR_244	equ	STR_173+20
STR_245	equ	STR_173+20
STR_246	equ	STR_173+20
STR_271	equ	STR_173+20
STR_272	equ	STR_173+20
STR_273	equ	STR_173+20
STR_274	equ	STR_173+20
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
	file	"src\encoder.c"
	line	32
_last_btn:
       ds      1
psect	dataCOMRAM
	file	"src\menu.c"
	line	29
	global	_relay_slp_edit_flag
_relay_slp_edit_flag:
       ds      1
psect	dataCOMRAM
	file	"src\menu.c"
	line	26
	global	_display_edit_flag
_display_edit_flag:
       ds      1
psect	dataCOMRAM
	file	"src\menu.c"
	line	23
	global	_flow_type_edit_flag
_flow_type_edit_flag:
       ds      1
psect	dataCOMRAM
	file	"src\menu.c"
	line	21
	global	_enable_edit_flag
_enable_edit_flag:
       ds      1
psect	bssBANK0,class=BANK0,space=1,noexec,lowdata
global __pbssBANK0
__pbssBANK0:
	global	_relay_state
_relay_state:
       ds      1
psect	bssBANK2,class=BANK2,space=1,noexec,lowdata
global __pbssBANK2
__pbssBANK2:
	global	_current_menu
_current_menu:
       ds      1
	global	_current_input
_current_input:
       ds      1
psect	bssBANK3,class=BANK3,space=1,noexec,lowdata
global __pbssBANK3
__pbssBANK3:
	global	_menu
_menu:
       ds      31
main@last_second_update:
       ds      4
main@blink_timer:
       ds      4
main@last_relay_counter:
       ds      2
main@encoder_activity_timer:
       ds      2
	global	_relay_counter
_relay_counter:
       ds      2
	global	_encoder_count
_encoder_count:
       ds      2
	global	_button_pressed
_button_pressed:
       ds      1
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
	global	_timeout_debug_flag
_timeout_debug_flag:
       ds      1
	global	_button_event
_button_event:
       ds      1
	global	_clock_menu
_clock_menu:
       ds      25
psect	dataBANK3,class=BANK3,space=1,noexec,lowdata
global __pdataBANK3
__pdataBANK3:
	file	"src\eeprom.c"
	line	11
	global	_menu_timeout_seconds
_menu_timeout_seconds:
       ds      2
psect	dataBANK3
	file	"src\encoder.c"
	line	16
	global	_menu_timeout_flag
_menu_timeout_flag:
       ds      1
psect	dataBANK3
	file	"src\menu.c"
	line	103
_value_relay_pulse:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	85
_value_display:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	77
_value_scale20:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	76
_value_scale4:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	200
_value_pwr_fail:
       ds      6
psect	dataBANK3
	file	"src\menu.c"
	line	197
_value_menu_timeout:
       ds      6
psect	dataBANK3
	file	"src\menu.c"
	line	196
_value_log_entries:
       ds      6
psect	dataBANK3
	file	"src\menu.c"
	line	86
_value_back:
       ds      5
psect	dataBANK3
	file	"src\menu.c"
	line	199
_value_brightness:
       ds      4
psect	dataBANK3
	file	"src\menu.c"
	line	198
_value_contrast:
       ds      4
psect	bssBANK4,class=BANK4,space=1,noexec,lowdata
global __pbssBANK4
__pbssBANK4:
	global	_utility_menu
_utility_menu:
       ds      45
menu_update_numeric_value@F2681:
       ds      6
	global	_input_menu
_input_menu:
       ds      75
_original_value:
       ds      10
psect	dataBANK4,class=BANK4,space=1,noexec,lowdata
global __pdataBANK4
__pdataBANK4:
	file	"src\menu.c"
	line	66
	global	_options_menu
_options_menu:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	75
_value_sensor:
       ds      12
psect	dataBANK4
	file	"src\menu.c"
	line	102
_value_end_runtime:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	101
_value_clock_enable:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	92
_value_flow_type:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	84
_value_rlylow:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	81
_value_rlyhigh:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	80
_value_slpbp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	79
_value_plpbp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	78
_value_highbp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	74
_value_enable:
       ds      10
psect	dataBANK5,class=BANK5,space=1,noexec,lowdata
global __pdataBANK5
__pdataBANK5:
	file	"src\menu.c"
	line	1495
menu_draw_setup@F2710:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	104
_value_clock_display:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	98
_value_high_tbp:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	97
_value_low_flow_bp:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	96
_value_no_flow_bp:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	95
_value_low_flow:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	94
_value_no_flow:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	93
_value_flow_units:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	91
_value_high_temp:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	90
_value_low_pressure:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	89
_value_hi_pressure:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	83
_value_rlyslp:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	82
_value_rlyplp:
       ds      10
psect	bssBANK6,class=BANK6,space=1,noexec,lowdata
global __pbssBANK6
__pbssBANK6:
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
; Initialize objects allocated to BANK5 (130 bytes)
	global __pidataBANK5
	; load TBLPTR registers with __pidataBANK5
	movlw	low (__pidataBANK5)
	movwf	tblptrl
	movlw	high(__pidataBANK5)
	movwf	tblptrh
	movlw	low highword(__pidataBANK5)
	movwf	tblptru
	lfsr	0,__pdataBANK5
	lfsr	1,130
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK4 (112 bytes)
	global __pidataBANK4
	; load TBLPTR registers with __pidataBANK4
	movlw	low (__pidataBANK4)
	movwf	tblptrl
	movlw	high(__pidataBANK4)
	movwf	tblptrh
	movlw	low highword(__pidataBANK4)
	movwf	tblptru
	lfsr	0,__pdataBANK4
	lfsr	1,112
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
; Initialize objects allocated to BANK3 (74 bytes)
	global __pidataBANK3
	; load TBLPTR registers with __pidataBANK3
	movlw	low (__pidataBANK3)
	movwf	tblptrl
	movlw	high(__pidataBANK3)
	movwf	tblptrh
	movlw	low highword(__pidataBANK3)
	movwf	tblptru
	lfsr	0,__pdataBANK3
	lfsr	1,74
	copy_data2:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data2
; Initialize objects allocated to COMRAM (5 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	lfsr	0,__pdataCOMRAM
	lfsr	1,5
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
; Clear objects allocated to BANK6 (128 bytes)
	global __pbssBANK6
lfsr	0,__pbssBANK6
movlw	128
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
; Clear objects allocated to BANK4 (136 bytes)
	global __pbssBANK4
lfsr	0,__pbssBANK4
movlw	136
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
; Clear objects allocated to BANK3 (80 bytes)
	global __pbssBANK3
lfsr	0,__pbssBANK3
movlw	80
clear_3:
clrf	postinc0,c
decf	wreg
bnz	clear_3
; Clear objects allocated to BANK2 (2 bytes)
	global __pbssBANK2
movlb	2
clrf	(__pbssBANK2+1)&0xffh,b
clrf	(__pbssBANK2+0)&0xffh,b
; Clear objects allocated to BANK0 (1 bytes)
	global __pbssBANK0
movlb	0
clrf	(__pbssBANK0+0)&0xffh,b
; Clear objects allocated to COMRAM (18 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	18
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
psect	cstackBANK4,class=BANK4,space=1,noexec,lowdata
global __pcstackBANK4
__pcstackBANK4:
	global	main@set_time
main@set_time:	; 7 bytes @ 0x0
	ds   7
psect	cstackBANK3,class=BANK3,space=1,noexec,lowdata
global __pcstackBANK3
__pcstackBANK3:
	global	main@buf_678
main@buf_678:	; 40 bytes @ 0x0
	ds   40
	global	main@buf_636
main@buf_636:	; 30 bytes @ 0x28
	ds   30
	global	main@buf_705
main@buf_705:	; 30 bytes @ 0x46
	ds   30
psect	cstackBANK2,class=BANK2,space=1,noexec,lowdata
global __pcstackBANK2
__pcstackBANK2:
	global	menu_handle_button@opts
menu_handle_button@opts:	; 2 bytes @ 0x0
	ds   2
	global	menu_handle_button@edit_flag
menu_handle_button@edit_flag:	; 2 bytes @ 0x2
	ds   2
	global	menu_handle_button@new_seconds
menu_handle_button@new_seconds:	; 2 bytes @ 0x4
	ds   2
	global	menu_handle_button@flow_type_1724
menu_handle_button@flow_type_1724:	; 1 bytes @ 0x6
	ds   1
	global	menu_handle_button@flow_type
menu_handle_button@flow_type:	; 1 bytes @ 0x7
	ds   1
	global	menu_handle_button@sensor_type_1723
menu_handle_button@sensor_type_1723:	; 1 bytes @ 0x8
	ds   1
	global	menu_handle_button@sensor_type
menu_handle_button@sensor_type:	; 1 bytes @ 0x9
	ds   1
	global	menu_handle_button@new_value_1708
menu_handle_button@new_value_1708:	; 2 bytes @ 0xA
	ds   2
??_main:	; 1 bytes @ 0xC
	ds   2
	global	main@time_buf
main@time_buf:	; 60 bytes @ 0xE
	ds   60
	global	main@buf_675
main@buf_675:	; 60 bytes @ 0x4A
	ds   60
	global	main@buf
main@buf:	; 50 bytes @ 0x86
	ds   50
	global	main@buf_670
main@buf_670:	; 50 bytes @ 0xB8
	ds   50
	global	main@adc_ch1
main@adc_ch1:	; 2 bytes @ 0xEA
	ds   2
	global	main@adc_ch2
main@adc_ch2:	; 2 bytes @ 0xEC
	ds   2
	global	main@adc_ch3
main@adc_ch3:	; 2 bytes @ 0xEE
	ds   2
	global	main@last_button
main@last_button:	; 1 bytes @ 0xF0
	ds   1
	global	main@adc_error
main@adc_error:	; 1 bytes @ 0xF1
	ds   1
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0xF2
	ds   2
	global	main@current_event
main@current_event:	; 1 bytes @ 0xF4
	ds   1
	global	main@delta
main@delta:	; 2 bytes @ 0xF5
	ds   2
	global	main@current_time
main@current_time:	; 7 bytes @ 0xF7
	ds   7
psect	cstackBANK1,class=BANK1,space=1,noexec,lowdata
global __pcstackBANK1
__pcstackBANK1:
	global	menu_handle_encoder@buf_1667
menu_handle_encoder@buf_1667:	; 50 bytes @ 0x0
	global	menu_handle_button@buf_1703
menu_handle_button@buf_1703:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_encoder@buf_1670
menu_handle_encoder@buf_1670:	; 50 bytes @ 0x32
	global	menu_handle_button@buf_1728
menu_handle_button@buf_1728:	; 50 bytes @ 0x32
	ds   50
	global	menu_handle_encoder@buf
menu_handle_encoder@buf:	; 50 bytes @ 0x64
	global	menu_handle_button@buf_1738
menu_handle_button@buf_1738:	; 50 bytes @ 0x64
	ds   50
	global	_menu_handle_encoder$1664
_menu_handle_encoder$1664:	; 2 bytes @ 0x96
	global	menu_handle_button@buf_1747
menu_handle_button@buf_1747:	; 50 bytes @ 0x96
	ds   2
	global	_menu_handle_encoder$1665
_menu_handle_encoder$1665:	; 2 bytes @ 0x98
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
	global	menu_handle_button@buf
menu_handle_button@buf:	; 50 bytes @ 0xC8
	ds   50
	global	menu_handle_button@opts_1732
menu_handle_button@opts_1732:	; 2 bytes @ 0xFA
	ds   2
	global	menu_handle_button@i
menu_handle_button@i:	; 1 bytes @ 0xFC
	ds   1
	global	menu_handle_button@new_value
menu_handle_button@new_value:	; 2 bytes @ 0xFD
	ds   2
	global	menu_handle_button@press_type
menu_handle_button@press_type:	; 1 bytes @ 0xFF
	ds   1
psect	cstackBANK0,class=BANK0,space=1,noexec,lowdata
global __pcstackBANK0
__pcstackBANK0:
	global	menu_update_edit_value@display_buf
menu_update_edit_value@display_buf:	; 10 bytes @ 0x0
	global	menu_draw_input@value_buf
menu_draw_input@value_buf:	; 15 bytes @ 0x0
	global	menu_draw_utility@value_buf
menu_draw_utility@value_buf:	; 15 bytes @ 0x0
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
	global	menu_draw_utility@start_pos
menu_draw_utility@start_pos:	; 1 bytes @ 0xF
	global	menu_draw_input@title
menu_draw_input@title:	; 10 bytes @ 0xF
	ds   1
	global	_menu_draw_utility$1632
_menu_draw_utility$1632:	; 2 bytes @ 0x10
	ds   2
	global	_menu_draw_utility$1640
_menu_draw_utility$1640:	; 2 bytes @ 0x12
	ds   2
	global	menu_update_edit_value@sensor_type
menu_update_edit_value@sensor_type:	; 1 bytes @ 0x14
	global	_menu_draw_utility$1644
_menu_draw_utility$1644:	; 2 bytes @ 0x14
	ds   1
	global	menu_update_edit_value@flow_type
menu_update_edit_value@flow_type:	; 1 bytes @ 0x15
	ds   1
	global	menu_draw_utility@len
menu_draw_utility@len:	; 1 bytes @ 0x16
	global	_menu_update_edit_value$1449
_menu_update_edit_value$1449:	; 2 bytes @ 0x16
	ds   1
	global	menu_draw_utility@val_len
menu_draw_utility@val_len:	; 1 bytes @ 0x17
	ds   1
	global	menu_draw_utility@j
menu_draw_utility@j:	; 1 bytes @ 0x18
	global	_menu_update_edit_value$1453
_menu_update_edit_value$1453:	; 2 bytes @ 0x18
	ds   1
	global	menu_draw_input@start_pos
menu_draw_input@start_pos:	; 1 bytes @ 0x19
	global	menu_draw_utility@show_brackets
menu_draw_utility@show_brackets:	; 1 bytes @ 0x19
	ds   1
	global	menu_update_edit_value@start_col
menu_update_edit_value@start_col:	; 1 bytes @ 0x1A
	global	menu_draw_utility@is_selected
menu_draw_utility@is_selected:	; 1 bytes @ 0x1A
	global	_menu_draw_input$1513
_menu_draw_input$1513:	; 2 bytes @ 0x1A
	ds   1
	global	menu_update_edit_value@blink_pos
menu_update_edit_value@blink_pos:	; 1 bytes @ 0x1B
	global	menu_draw_utility@item_idx
menu_draw_utility@item_idx:	; 1 bytes @ 0x1B
	ds   1
	global	menu_update_edit_value@screen_line
menu_update_edit_value@screen_line:	; 1 bytes @ 0x1C
	global	menu_draw_utility@i
menu_draw_utility@i:	; 1 bytes @ 0x1C
	global	_menu_draw_input$1517
_menu_draw_input$1517:	; 2 bytes @ 0x1C
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
	global	menu_draw_input@opts_1499
menu_draw_input@opts_1499:	; 2 bytes @ 0x24
	ds   2
	global	menu_draw_input@flag_1503
menu_draw_input@flag_1503:	; 2 bytes @ 0x26
	ds   2
	global	menu_draw_input@val_len_1507
menu_draw_input@val_len_1507:	; 1 bytes @ 0x28
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
	global	_handle_time_rotation$1270
_handle_time_rotation$1270:	; 2 bytes @ 0x32
	global	_rebuild_input_menu$1342
_rebuild_input_menu$1342:	; 2 bytes @ 0x32
	global	_handle_numeric_rotation$1438
_handle_numeric_rotation$1438:	; 2 bytes @ 0x32
	global	_rebuild_clock_menu$1560
_rebuild_clock_menu$1560:	; 2 bytes @ 0x32
	global	menu_update_time_value@debug_after
menu_update_time_value@debug_after:	; 50 bytes @ 0x32
	ds   2
	global	handle_time_rotation@direction
handle_time_rotation@direction:	; 1 bytes @ 0x34
	global	_rebuild_input_menu$1356
_rebuild_input_menu$1356:	; 2 bytes @ 0x34
	global	_handle_numeric_rotation$1440
_handle_numeric_rotation$1440:	; 2 bytes @ 0x34
	global	_rebuild_clock_menu$1566
_rebuild_clock_menu$1566:	; 2 bytes @ 0x34
	ds   2
	global	handle_numeric_rotation@max_tens
handle_numeric_rotation@max_tens:	; 1 bytes @ 0x36
	global	_rebuild_input_menu$1357
_rebuild_input_menu$1357:	; 2 bytes @ 0x36
	global	_rebuild_clock_menu$1567
_rebuild_clock_menu$1567:	; 2 bytes @ 0x36
	ds   1
	global	handle_numeric_rotation@max_units
handle_numeric_rotation@max_units:	; 1 bytes @ 0x37
	ds   1
	global	handle_numeric_rotation@direction
handle_numeric_rotation@direction:	; 1 bytes @ 0x38
	global	_rebuild_input_menu$1363
_rebuild_input_menu$1363:	; 2 bytes @ 0x38
	ds   2
	global	_rebuild_input_menu$1364
_rebuild_input_menu$1364:	; 2 bytes @ 0x3A
	ds   2
	global	trigger_relay_pulse@latch_mode
trigger_relay_pulse@latch_mode:	; 1 bytes @ 0x3C
	global	_rebuild_input_menu$1370
_rebuild_input_menu$1370:	; 2 bytes @ 0x3C
	ds   2
	global	_rebuild_input_menu$1371
_rebuild_input_menu$1371:	; 2 bytes @ 0x3E
	ds   2
	global	_rebuild_input_menu$1375
_rebuild_input_menu$1375:	; 2 bytes @ 0x40
	ds   2
	global	_rebuild_input_menu$1389
_rebuild_input_menu$1389:	; 2 bytes @ 0x42
	ds   2
	global	_rebuild_input_menu$1390
_rebuild_input_menu$1390:	; 2 bytes @ 0x44
	ds   2
	global	_rebuild_input_menu$1394
_rebuild_input_menu$1394:	; 2 bytes @ 0x46
	ds   2
	global	_rebuild_input_menu$1399
_rebuild_input_menu$1399:	; 2 bytes @ 0x48
	ds   2
	global	_rebuild_input_menu$1403
_rebuild_input_menu$1403:	; 2 bytes @ 0x4A
	ds   2
	global	_rebuild_input_menu$1409
_rebuild_input_menu$1409:	; 2 bytes @ 0x4C
	ds   2
	global	_rebuild_input_menu$1410
_rebuild_input_menu$1410:	; 2 bytes @ 0x4E
	ds   2
	global	_rebuild_input_menu$1414
_rebuild_input_menu$1414:	; 2 bytes @ 0x50
	global	rtc_read_time@data
rtc_read_time@data:	; 7 bytes @ 0x50
	ds   2
	global	rebuild_input_menu@flow_type_val
rebuild_input_menu@flow_type_val:	; 1 bytes @ 0x52
	ds   1
	global	rebuild_input_menu@sensor
rebuild_input_menu@sensor:	; 1 bytes @ 0x53
	ds   1
	global	_rebuild_input_menu$3195
_rebuild_input_menu$3195:	; 2 bytes @ 0x54
	ds   2
	global	_rebuild_input_menu$3196
_rebuild_input_menu$3196:	; 2 bytes @ 0x56
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
??_menu_handle_encoder:	; 1 bytes @ 0x6E
??_menu_handle_button:	; 1 bytes @ 0x6E
	ds   5
	global	_menu_handle_button$1740
_menu_handle_button$1740:	; 2 bytes @ 0x73
	ds   2
	global	menu_handle_button@edit_flag_1697
menu_handle_button@edit_flag_1697:	; 2 bytes @ 0x75
	ds   2
	global	menu_handle_button@opts_1698
menu_handle_button@opts_1698:	; 2 bytes @ 0x77
	ds   2
	global	menu_handle_button@edit_flag_1731
menu_handle_button@edit_flag_1731:	; 2 bytes @ 0x79
	ds   2
	global	menu_handle_button@current_val_1727
menu_handle_button@current_val_1727:	; 2 bytes @ 0x7B
	ds   2
	global	menu_handle_button@current_val
menu_handle_button@current_val:	; 2 bytes @ 0x7D
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
?_lcd_clear_line:	; 1 bytes @ 0x0
?_load_factory_defaults:	; 1 bytes @ 0x0
?_sync_menu_variables:	; 1 bytes @ 0x0
?_uart_init:	; 1 bytes @ 0x0
?_uart_write:	; 1 bytes @ 0x0
?_system_init:	; 1 bytes @ 0x0
?_trigger_relay_pulse:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_isr:	; 1 bytes @ 0x0
?_menu_update_datetime_display:	; 1 bytes @ 0x0
?_rebuild_input_menu:	; 1 bytes @ 0x0
?_rebuild_clock_menu:	; 1 bytes @ 0x0
?_rebuild_utility_menu:	; 1 bytes @ 0x0
?_menu_draw_utility:	; 1 bytes @ 0x0
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
	global	_isdigit$2913
_isdigit$2913:	; 1 bytes @ 0xF
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
	global	_is_numeric_field$1230
_is_numeric_field$1230:	; 1 bytes @ 0x10
	global	_is_time_field$1237
_is_time_field$1237:	; 1 bytes @ 0x10
	global	_is_option_field$1242
_is_option_field$1242:	; 1 bytes @ 0x10
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
	global	_is_numeric_field$1231
_is_numeric_field$1231:	; 1 bytes @ 0x11
	global	is_time_field@line
is_time_field@line:	; 1 bytes @ 0x11
	global	_is_option_field$1243
_is_option_field$1243:	; 1 bytes @ 0x11
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
	global	_is_numeric_field$1232
_is_numeric_field$1232:	; 1 bytes @ 0x12
	global	_is_option_field$1244
_is_option_field$1244:	; 1 bytes @ 0x12
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
	global	_is_option_field$1245
_is_option_field$1245:	; 1 bytes @ 0x13
	global	lcd_set_cursor@row
lcd_set_cursor@row:	; 1 bytes @ 0x13
	global	i2c_read@data
i2c_read@data:	; 1 bytes @ 0x13
	global	rtc_write_register@value
rtc_write_register@value:	; 1 bytes @ 0x13
	global	calculate_config_checksum@data
calculate_config_checksum@data:	; 2 bytes @ 0x13
	global	eeprom_write_word@data
eeprom_write_word@data:	; 2 bytes @ 0x13
	global	eeprom_write_block@address
eeprom_write_block@address:	; 2 bytes @ 0x13
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x13
	global	strcpy@cp
strcpy@cp:	; 2 bytes @ 0x13
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
	global	memcpy@tmp
memcpy@tmp:	; 1 bytes @ 0x14
	global	strcmp@r
strcmp@r:	; 1 bytes @ 0x14
	global	eeprom_read_block@length
eeprom_read_block@length:	; 2 bytes @ 0x14
	global	i2c_read@timeout
i2c_read@timeout:	; 2 bytes @ 0x14
	ds   1
??_rtc_init:	; 1 bytes @ 0x15
?_rtc_set_time:	; 1 bytes @ 0x15
??_menu_update_numeric_value:	; 1 bytes @ 0x15
??_lcd_clear_line:	; 1 bytes @ 0x15
?_lcd_print_at:	; 1 bytes @ 0x15
??_eeprom_write_word:	; 1 bytes @ 0x15
	global	lcd_print_at@col
lcd_print_at@col:	; 1 bytes @ 0x15
	global	lcd_clear_line@row
lcd_clear_line@row:	; 1 bytes @ 0x15
	global	menu_update_numeric_value@sensor_type
menu_update_numeric_value@sensor_type:	; 1 bytes @ 0x15
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
	global	memcpy@d
memcpy@d:	; 2 bytes @ 0x15
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
	ds   1
??_rtc_set_time:	; 1 bytes @ 0x17
??_eeprom_write_block:	; 1 bytes @ 0x17
??___lwdiv:	; 1 bytes @ 0x17
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x17
	global	_menu_update_numeric_value$1464
_menu_update_numeric_value$1464:	; 2 bytes @ 0x17
	global	calculate_config_checksum@j_1893
calculate_config_checksum@j_1893:	; 2 bytes @ 0x17
	global	eeprom_write_block@ptr
eeprom_write_block@ptr:	; 2 bytes @ 0x17
	global	memcpy@s
memcpy@s:	; 2 bytes @ 0x17
	global	rtc_set_time@data
rtc_set_time@data:	; 7 bytes @ 0x17
	ds   1
??_ad7994_read_channel:	; 1 bytes @ 0x18
??_lcd_print_at:	; 1 bytes @ 0x18
	global	lcd_print_at@row
lcd_print_at@row:	; 1 bytes @ 0x18
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
	global	_menu_update_numeric_value$1465
_menu_update_numeric_value$1465:	; 2 bytes @ 0x19
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
	global	ad7994_read_channel@msb
ad7994_read_channel@msb:	; 1 bytes @ 0x1B
	global	_menu_update_numeric_value$1466
_menu_update_numeric_value$1466:	; 2 bytes @ 0x1B
	global	save_current_config@checksum
save_current_config@checksum:	; 2 bytes @ 0x1B
	ds   1
??_init_numeric_editor:	; 1 bytes @ 0x1C
	global	ad7994_read_channel@lsb
ad7994_read_channel@lsb:	; 1 bytes @ 0x1C
	global	sprintf@f
sprintf@f:	; 2 bytes @ 0x1C
	ds   1
	global	save_current_config@i
save_current_config@i:	; 1 bytes @ 0x1D
	global	_menu_update_numeric_value$1467
_menu_update_numeric_value$1467:	; 2 bytes @ 0x1D
	global	ad7994_read_channel@result
ad7994_read_channel@result:	; 2 bytes @ 0x1D
	ds   1
??_eeprom_init:	; 1 bytes @ 0x1E
	global	init_numeric_editor@flow_type
init_numeric_editor@flow_type:	; 1 bytes @ 0x1E
	global	rtc_set_time@i
rtc_set_time@i:	; 1 bytes @ 0x1E
	global	eeprom_init@stored_checksum
eeprom_init@stored_checksum:	; 2 bytes @ 0x1E
	global	menu_draw_clock@value_buf
menu_draw_clock@value_buf:	; 15 bytes @ 0x1E
	ds   1
	global	ad7994_read_channel@config_byte
ad7994_read_channel@config_byte:	; 1 bytes @ 0x1F
	global	_init_numeric_editor$1428
_init_numeric_editor$1428:	; 2 bytes @ 0x1F
	global	_menu_update_numeric_value$1468
_menu_update_numeric_value$1468:	; 2 bytes @ 0x1F
	ds   1
	global	eeprom_init@calculated_checksum
eeprom_init@calculated_checksum:	; 2 bytes @ 0x20
	ds   1
	global	init_numeric_editor@sensor_type
init_numeric_editor@sensor_type:	; 1 bytes @ 0x21
	global	_menu_update_numeric_value$1469
_menu_update_numeric_value$1469:	; 2 bytes @ 0x21
	ds   1
	global	eeprom_init@i
eeprom_init@i:	; 1 bytes @ 0x22
	global	init_numeric_editor@abs_val
init_numeric_editor@abs_val:	; 2 bytes @ 0x22
	ds   1
	global	_menu_update_numeric_value$1470
_menu_update_numeric_value$1470:	; 2 bytes @ 0x23
	global	_menu_draw_setup$1537
_menu_draw_setup$1537:	; 2 bytes @ 0x23
	ds   2
	global	_menu_update_numeric_value$1471
_menu_update_numeric_value$1471:	; 2 bytes @ 0x25
	global	_menu_draw_setup$1543
_menu_draw_setup$1543:	; 2 bytes @ 0x25
	ds   2
	global	_menu_update_numeric_value$1473
_menu_update_numeric_value$1473:	; 2 bytes @ 0x27
	global	_menu_draw_setup$1551
_menu_draw_setup$1551:	; 2 bytes @ 0x27
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
	global	_menu_draw_clock$1604
_menu_draw_clock$1604:	; 2 bytes @ 0x2F
	ds   1
	global	menu_update_numeric_value@screen_line
menu_update_numeric_value@screen_line:	; 1 bytes @ 0x30
	global	_sprintf$2470
_sprintf$2470:	; 2 bytes @ 0x30
	ds   1
	global	_menu_draw_clock$1608
_menu_draw_clock$1608:	; 2 bytes @ 0x31
	ds   1
	global	_sprintf$2471
_sprintf$2471:	; 2 bytes @ 0x32
	ds   1
	global	menu_draw_clock@val_len
menu_draw_clock@val_len:	; 1 bytes @ 0x33
	ds   1
	global	menu_draw_clock@val_len_1598
menu_draw_clock@val_len_1598:	; 1 bytes @ 0x34
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
??_menu_update_datetime_display:	; 1 bytes @ 0x40
??_rebuild_input_menu:	; 1 bytes @ 0x40
??_rebuild_clock_menu:	; 1 bytes @ 0x40
??_rebuild_utility_menu:	; 1 bytes @ 0x40
	global	init_time_editor@value_seconds
init_time_editor@value_seconds:	; 2 bytes @ 0x40
	global	rtc_read_time@time
rtc_read_time@time:	; 2 bytes @ 0x40
	global	menu_update_datetime_display@date_buf
menu_update_datetime_display@date_buf:	; 9 bytes @ 0x40
	ds   2
??_rtc_read_time:	; 1 bytes @ 0x42
	global	init_time_editor@mode
init_time_editor@mode:	; 1 bytes @ 0x42
	global	_rebuild_utility_menu$3197
_rebuild_utility_menu$3197:	; 2 bytes @ 0x42
	ds   1
??_init_time_editor:	; 1 bytes @ 0x43
	ds   1
	global	_rebuild_utility_menu$3198
_rebuild_utility_menu$3198:	; 2 bytes @ 0x44
	ds   2
	global	rebuild_utility_menu@i
rebuild_utility_menu@i:	; 1 bytes @ 0x46
	ds   3
	global	menu_update_datetime_display@time_buf
menu_update_datetime_display@time_buf:	; 9 bytes @ 0x49
	ds   9
??_menu_draw_utility:	; 1 bytes @ 0x52
	ds   5
?_menu_handle_encoder:	; 1 bytes @ 0x57
	global	menu_handle_encoder@delta
menu_handle_encoder@delta:	; 2 bytes @ 0x57
	ds   2
;!
;!Data Sizes:
;!    Strings     3227
;!    Constant    910
;!    Data        321
;!    BSS         749
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126     89     112
;!    BANK0           128    127     128
;!    BANK1           256    256     256
;!    BANK2           256    254     256
;!    BANK3           256    100     254
;!    BANK4           256      7     255
;!    BANK5           256      0     130
;!    BANK6           256      0     128
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
;!		 -> input_config(BIGRAM[384]), system_config(BANK6[128]), 
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
;!		 -> STR_132(CODE[10]), STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), 
;!		 -> STR_136(CODE[9]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[11]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    clock_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), 
;!		 -> value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
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
;!		 -> STR_132(CODE[10]), STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), 
;!		 -> STR_136(CODE[9]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[11]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    clock_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), 
;!		 -> value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    eeprom_read_block@data	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK6[128]), 
;!
;!    eeprom_read_block@ptr	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK6[128]), 
;!
;!    eeprom_write_block@data	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK6[128]), 
;!
;!    eeprom_write_block@ptr	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK6[128]), 
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
;!		 -> STR_132(CODE[10]), STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), 
;!		 -> STR_136(CODE[9]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[11]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    flow_analog_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), 
;!		 -> value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
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
;!		 -> STR_132(CODE[10]), STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), 
;!		 -> STR_136(CODE[9]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[11]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    flow_digital_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), 
;!		 -> value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
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
;!		 -> STR_132(CODE[10]), STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), 
;!		 -> STR_136(CODE[9]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[11]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), 
;!		 -> value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    lcd_print@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> Fake(UNKNOWN), menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), 
;!		 -> menu_draw_utility@value_buf(BANK0[15]), menu_update_datetime_display@date_buf(COMRAM[9]), menu_update_datetime_display@time_buf(COMRAM[9]), menu_update_edit_value@display_buf(BANK0[10]), 
;!		 -> menu_update_numeric_value@value_buf(COMRAM[6]), menu_update_time_value@value_buf(BANK0[6]), STR_100(CODE[7]), STR_101(CODE[10]), 
;!		 -> STR_102(CODE[11]), STR_103(CODE[10]), STR_104(CODE[9]), STR_105(CODE[9]), 
;!		 -> STR_106(CODE[8]), STR_107(CODE[5]), STR_108(CODE[7]), STR_109(CODE[7]), 
;!		 -> STR_110(CODE[5]), STR_111(CODE[8]), STR_112(CODE[11]), STR_113(CODE[8]), 
;!		 -> STR_114(CODE[8]), STR_115(CODE[5]), STR_116(CODE[7]), STR_117(CODE[7]), 
;!		 -> STR_118(CODE[5]), STR_119(CODE[6]), STR_120(CODE[10]), STR_121(CODE[11]), 
;!		 -> STR_122(CODE[9]), STR_123(CODE[12]), STR_124(CODE[8]), STR_125(CODE[8]), 
;!		 -> STR_126(CODE[5]), STR_127(CODE[7]), STR_128(CODE[8]), STR_129(CODE[10]), 
;!		 -> STR_130(CODE[8]), STR_131(CODE[5]), STR_132(CODE[10]), STR_133(CODE[9]), 
;!		 -> STR_134(CODE[10]), STR_135(CODE[12]), STR_136(CODE[9]), STR_137(CODE[9]), 
;!		 -> STR_138(CODE[11]), STR_139(CODE[11]), STR_140(CODE[5]), STR_148(CODE[8]), 
;!		 -> STR_149(CODE[2]), STR_150(CODE[2]), STR_163(CODE[6]), STR_164(CODE[2]), 
;!		 -> STR_165(CODE[2]), STR_166(CODE[2]), STR_167(CODE[2]), STR_168(CODE[6]), 
;!		 -> STR_169(CODE[2]), STR_17(CODE[13]), STR_170(CODE[2]), STR_171(CODE[2]), 
;!		 -> STR_172(CODE[2]), STR_173(CODE[21]), STR_18(CODE[16]), STR_227(CODE[7]), 
;!		 -> STR_228(CODE[2]), STR_229(CODE[2]), STR_230(CODE[6]), STR_231(CODE[2]), 
;!		 -> STR_232(CODE[2]), STR_233(CODE[21]), STR_234(CODE[2]), STR_235(CODE[2]), 
;!		 -> STR_239(CODE[2]), STR_240(CODE[2]), STR_241(CODE[2]), STR_242(CODE[2]), 
;!		 -> STR_243(CODE[21]), STR_244(CODE[1]), STR_245(CODE[1]), STR_246(CODE[1]), 
;!		 -> STR_247(CODE[6]), STR_248(CODE[5]), STR_249(CODE[9]), STR_250(CODE[5]), 
;!		 -> STR_251(CODE[5]), STR_252(CODE[2]), STR_253(CODE[2]), STR_254(CODE[2]), 
;!		 -> STR_255(CODE[2]), STR_256(CODE[2]), STR_257(CODE[2]), STR_258(CODE[2]), 
;!		 -> STR_259(CODE[2]), STR_280(CODE[6]), STR_281(CODE[2]), STR_282(CODE[2]), 
;!		 -> STR_283(CODE[2]), STR_284(CODE[2]), STR_285(CODE[10]), STR_286(CODE[11]), 
;!		 -> STR_287(CODE[10]), STR_288(CODE[11]), STR_289(CODE[10]), STR_290(CODE[7]), 
;!		 -> STR_291(CODE[6]), STR_292(CODE[14]), STR_293(CODE[5]), STR_294(CODE[8]), 
;!		 -> STR_295(CODE[12]), STR_296(CODE[10]), STR_297(CODE[7]), STR_298(CODE[5]), 
;!		 -> STR_299(CODE[2]), STR_300(CODE[2]), STR_301(CODE[2]), STR_302(CODE[2]), 
;!		 -> STR_303(CODE[2]), STR_304(CODE[2]), STR_34(CODE[12]), STR_35(CODE[6]), 
;!		 -> STR_40(CODE[12]), STR_41(CODE[8]), STR_80(CODE[10]), STR_81(CODE[11]), 
;!		 -> STR_82(CODE[13]), STR_83(CODE[6]), STR_84(CODE[5]), STR_85(CODE[7]), 
;!		 -> STR_86(CODE[7]), STR_87(CODE[10]), STR_88(CODE[11]), STR_89(CODE[12]), 
;!		 -> STR_90(CODE[9]), STR_91(CODE[13]), STR_92(CODE[6]), STR_93(CODE[6]), 
;!		 -> STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[8]), STR_97(CODE[8]), 
;!		 -> STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    lcd_print_at@str	PTR const unsigned char  size(2) Largest target is 15
;!		 -> Fake(UNKNOWN), menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), 
;!		 -> menu_draw_utility@value_buf(BANK0[15]), menu_update_datetime_display@date_buf(COMRAM[9]), menu_update_datetime_display@time_buf(COMRAM[9]), STR_100(CODE[7]), 
;!		 -> STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), STR_104(CODE[9]), 
;!		 -> STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), STR_108(CODE[7]), 
;!		 -> STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), STR_112(CODE[11]), 
;!		 -> STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), STR_116(CODE[7]), 
;!		 -> STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), STR_120(CODE[10]), 
;!		 -> STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), STR_124(CODE[8]), 
;!		 -> STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), STR_128(CODE[8]), 
;!		 -> STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), STR_132(CODE[10]), 
;!		 -> STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), STR_136(CODE[9]), 
;!		 -> STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[11]), STR_140(CODE[5]), 
;!		 -> STR_163(CODE[6]), STR_164(CODE[2]), STR_165(CODE[2]), STR_166(CODE[2]), 
;!		 -> STR_167(CODE[2]), STR_168(CODE[6]), STR_169(CODE[2]), STR_170(CODE[2]), 
;!		 -> STR_171(CODE[2]), STR_172(CODE[2]), STR_244(CODE[1]), STR_245(CODE[1]), 
;!		 -> STR_246(CODE[1]), STR_247(CODE[6]), STR_248(CODE[5]), STR_249(CODE[9]), 
;!		 -> STR_250(CODE[5]), STR_251(CODE[5]), STR_280(CODE[6]), STR_285(CODE[10]), 
;!		 -> STR_286(CODE[11]), STR_287(CODE[10]), STR_288(CODE[11]), STR_289(CODE[10]), 
;!		 -> STR_290(CODE[7]), STR_291(CODE[6]), STR_292(CODE[14]), STR_293(CODE[5]), 
;!		 -> STR_294(CODE[8]), STR_295(CODE[12]), STR_296(CODE[10]), STR_297(CODE[7]), 
;!		 -> STR_298(CODE[5]), STR_299(CODE[2]), STR_300(CODE[2]), STR_80(CODE[10]), 
;!		 -> STR_81(CODE[11]), STR_82(CODE[13]), STR_83(CODE[6]), STR_84(CODE[5]), 
;!		 -> STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), STR_88(CODE[11]), 
;!		 -> STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), STR_92(CODE[6]), 
;!		 -> STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    memcpy@d	PTR unsigned char  size(2) Largest target is 384
;!		 -> clock_menu(BANK3[25]), input_config(BIGRAM[384]), input_menu(BANK4[75]), system_config(BANK6[128]), 
;!
;!    memcpy@d1	PTR void  size(2) Largest target is 384
;!		 -> clock_menu(BANK3[25]), input_config(BIGRAM[384]), input_menu(BANK4[75]), system_config(BANK6[128]), 
;!
;!    memcpy@s	PTR const unsigned char  size(2) Largest target is 384
;!		 -> clock_menu_template(CODE[25]), factory_defaults(CODE[384]), flow_analog_template(CODE[55]), flow_digital_template(CODE[40]), 
;!		 -> pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    memcpy@s1	PTR const void  size(2) Largest target is 384
;!		 -> clock_menu_template(CODE[25]), factory_defaults(CODE[384]), flow_analog_template(CODE[55]), flow_digital_template(CODE[40]), 
;!		 -> pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    menu_draw_clock$1604	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_281(CODE[2]), STR_282(CODE[2]), 
;!
;!    menu_draw_clock$1608	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_283(CODE[2]), STR_284(CODE[2]), 
;!
;!    menu_draw_input$1513	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_239(CODE[2]), STR_240(CODE[2]), 
;!
;!    menu_draw_input$1517	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_241(CODE[2]), STR_242(CODE[2]), 
;!
;!    menu_draw_input@flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@flag_1503	PTR unsigned char  size(2) Largest target is 1
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
;!    menu_draw_input@opts_1499	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts_1499$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    menu_draw_setup$1537	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_250(CODE[5]), STR_251(CODE[5]), 
;!
;!    menu_draw_setup$1543	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_254(CODE[2]), STR_255(CODE[2]), 
;!
;!    menu_draw_setup$1551	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_258(CODE[2]), STR_259(CODE[2]), 
;!
;!    menu_draw_setup@F2710	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_244(CODE[1]), STR_245(CODE[1]), STR_246(CODE[1]), STR_247(CODE[6]), 
;!		 -> STR_248(CODE[5]), 
;!
;!    menu_draw_setup@label	PTR const unsigned char  size(2) Largest target is 6
;!		 -> STR_244(CODE[1]), STR_245(CODE[1]), STR_246(CODE[1]), STR_247(CODE[6]), 
;!		 -> STR_248(CODE[5]), 
;!
;!    menu_draw_setup@sensor_name	PTR const unsigned char  size(2) Largest target is 9
;!		 -> Fake(UNKNOWN), STR_249(CODE[9]), STR_250(CODE[5]), STR_251(CODE[5]), 
;!
;!    menu_draw_setup@setup_labels	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_244(CODE[1]), STR_245(CODE[1]), STR_246(CODE[1]), STR_247(CODE[6]), 
;!		 -> STR_248(CODE[5]), 
;!
;!    menu_draw_utility$1640	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_301(CODE[2]), STR_302(CODE[2]), 
;!
;!    menu_draw_utility$1644	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_303(CODE[2]), STR_304(CODE[2]), 
;!
;!    menu_handle_button@edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1697	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1731	PTR unsigned char  size(2) Largest target is 1
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
;!    menu_handle_button@opts_1698	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1698$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    menu_handle_button@opts_1732	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1732$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    menu_handle_encoder$3199	const PTR const unsigned char  size(2) Largest target is 9
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
;!		 -> STR_132(CODE[10]), STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), 
;!		 -> STR_136(CODE[9]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[11]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    pressure_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), 
;!		 -> value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    rebuild_clock_menu$1560	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_262(CODE[8]), STR_263(CODE[9]), 
;!
;!    rebuild_clock_menu$1566	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_264(CODE[6]), STR_265(CODE[6]), STR_266(CODE[9]), 
;!
;!    rebuild_clock_menu$1567	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_265(CODE[6]), STR_266(CODE[9]), 
;!
;!    rebuild_input_menu$1342	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_175(CODE[8]), STR_176(CODE[9]), 
;!
;!    rebuild_input_menu$1356	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_185(CODE[6]), STR_186(CODE[6]), STR_187(CODE[9]), 
;!
;!    rebuild_input_menu$1357	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_186(CODE[6]), STR_187(CODE[9]), 
;!
;!    rebuild_input_menu$1363	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_188(CODE[6]), STR_189(CODE[6]), STR_190(CODE[9]), 
;!
;!    rebuild_input_menu$1364	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_189(CODE[6]), STR_190(CODE[9]), 
;!
;!    rebuild_input_menu$1370	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_191(CODE[6]), STR_192(CODE[6]), STR_193(CODE[9]), 
;!
;!    rebuild_input_menu$1371	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_192(CODE[6]), STR_193(CODE[9]), 
;!
;!    rebuild_input_menu$1375	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_194(CODE[5]), STR_195(CODE[5]), 
;!
;!    rebuild_input_menu$1389	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_201(CODE[6]), STR_202(CODE[6]), STR_203(CODE[9]), 
;!
;!    rebuild_input_menu$1390	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_202(CODE[6]), STR_203(CODE[9]), 
;!
;!    rebuild_input_menu$1394	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_204(CODE[5]), STR_205(CODE[5]), 
;!
;!    rebuild_input_menu$1399	PTR const unsigned char  size(2) Largest target is 8
;!		 -> STR_207(CODE[7]), STR_208(CODE[8]), 
;!
;!    rebuild_input_menu$1403	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_209(CODE[5]), STR_210(CODE[5]), 
;!
;!    rebuild_input_menu$1409	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_211(CODE[6]), STR_212(CODE[6]), STR_213(CODE[9]), 
;!
;!    rebuild_input_menu$1410	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_212(CODE[6]), STR_213(CODE[9]), 
;!
;!    rebuild_input_menu$1414	PTR const unsigned char  size(2) Largest target is 4
;!		 -> STR_214(CODE[2]), STR_215(CODE[4]), 
;!
;!    rtc_read_time@time	PTR struct . size(2) Largest target is 7
;!		 -> init_datetime_editor@current_time(COMRAM[7]), main@current_time(BANK2[7]), 
;!
;!    rtc_set_time@time	PTR struct . size(2) Largest target is 7
;!		 -> main@set_time(BANK4[7]), 
;!
;!    S947$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    S951$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[7]), STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[7]), STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[11]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), 
;!		 -> STR_120(CODE[10]), STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), 
;!		 -> STR_124(CODE[8]), STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), 
;!		 -> STR_132(CODE[10]), STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), 
;!		 -> STR_136(CODE[9]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[11]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    S951$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), 
;!		 -> value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
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
;!		 -> clock_menu(BANK3[25]), input_config(BIGRAM[384]), input_menu(BANK4[75]), system_config(BANK6[128]), 
;!
;!    sp__strcpy	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_draw_utility@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), 
;!		 -> original_value(BANK4[10]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> STR_274(CODE[1]), value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), 
;!		 -> value_clock_enable(BANK4[10]), value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), 
;!		 -> value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), 
;!		 -> value_high_tbp(BANK5[10]), value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), 
;!		 -> value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), 
;!		 -> value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), 
;!		 -> value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), 
;!		 -> value_rlyslp(BANK5[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), 
;!		 -> value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 12
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), menu_item_options$option_count(CODE[1]), menu_update_time_value@value_buf(BANK0[6]), 
;!		 -> relay_high_edit_flag(COMRAM[1]), ?_sprintf(COMRAM[2]), sprintf@c(COMRAM[1]), STR_175(CODE[8]), 
;!		 -> STR_176(CODE[9]), STR_262(CODE[8]), STR_263(CODE[9]), STR_271(CODE[1]), 
;!		 -> STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), STR_354(CODE[7]), 
;!		 -> STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), 
;!		 -> STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), 
;!		 -> STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), value_back(BANK3[5]), 
;!		 -> value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), value_contrast(BANK3[4]), 
;!		 -> value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), 
;!		 -> value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), value_high_temp(BANK5[10]), 
;!		 -> value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), 
;!		 -> value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), 
;!		 -> value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), 
;!		 -> value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 51
;!		 -> STR_1(CODE[48]), STR_14(CODE[28]), STR_141(CODE[35]), STR_143(CODE[45]), 
;!		 -> STR_144(CODE[25]), STR_145(CODE[3]), STR_146(CODE[51]), STR_147(CODE[27]), 
;!		 -> STR_151(CODE[47]), STR_153(CODE[13]), STR_154(CODE[13]), STR_155(CODE[13]), 
;!		 -> STR_156(CODE[15]), STR_157(CODE[15]), STR_158(CODE[13]), STR_159(CODE[13]), 
;!		 -> STR_160(CODE[13]), STR_161(CODE[15]), STR_162(CODE[15]), STR_174(CODE[3]), 
;!		 -> STR_178(CODE[6]), STR_179(CODE[6]), STR_180(CODE[5]), STR_181(CODE[10]), 
;!		 -> STR_182(CODE[5]), STR_183(CODE[10]), STR_184(CODE[10]), STR_197(CODE[6]), 
;!		 -> STR_198(CODE[6]), STR_199(CODE[3]), STR_200(CODE[10]), STR_216(CODE[6]), 
;!		 -> STR_217(CODE[6]), STR_218(CODE[5]), STR_219(CODE[10]), STR_221(CODE[10]), 
;!		 -> STR_222(CODE[48]), STR_224(CODE[29]), STR_225(CODE[7]), STR_226(CODE[9]), 
;!		 -> STR_236(CODE[9]), STR_25(CODE[37]), STR_260(CODE[35]), STR_261(CODE[3]), 
;!		 -> STR_267(CODE[10]), STR_269(CODE[46]), STR_27(CODE[17]), STR_270(CODE[29]), 
;!		 -> STR_275(CODE[3]), STR_276(CODE[10]), STR_277(CODE[3]), STR_278(CODE[3]), 
;!		 -> STR_279(CODE[10]), STR_28(CODE[35]), STR_29(CODE[23]), STR_3(CODE[27]), 
;!		 -> STR_30(CODE[17]), STR_305(CODE[37]), STR_306(CODE[23]), STR_307(CODE[32]), 
;!		 -> STR_308(CODE[37]), STR_309(CODE[28]), STR_310(CODE[35]), STR_311(CODE[26]), 
;!		 -> STR_312(CODE[20]), STR_313(CODE[25]), STR_314(CODE[28]), STR_315(CODE[26]), 
;!		 -> STR_316(CODE[10]), STR_317(CODE[10]), STR_318(CODE[32]), STR_319(CODE[42]), 
;!		 -> STR_320(CODE[26]), STR_321(CODE[10]), STR_323(CODE[6]), STR_324(CODE[6]), 
;!		 -> STR_325(CODE[5]), STR_326(CODE[5]), STR_327(CODE[6]), STR_328(CODE[6]), 
;!		 -> STR_329(CODE[5]), STR_330(CODE[6]), STR_331(CODE[6]), STR_332(CODE[5]), 
;!		 -> STR_333(CODE[38]), STR_334(CODE[32]), STR_341(CODE[28]), STR_342(CODE[40]), 
;!		 -> STR_6(CODE[39]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(COMRAM[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK2[50]), main@buf_636(BANK3[30]), main@buf_670(BANK2[50]), main@buf_675(BANK2[60]), 
;!		 -> main@buf_678(BANK3[40]), main@buf_705(BANK3[30]), main@time_buf(BANK2[60]), menu_draw_input@title(BANK0[10]), 
;!		 -> menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1703(BANK1[50]), menu_handle_button@buf_1728(BANK1[50]), menu_handle_button@buf_1738(BANK1[50]), 
;!		 -> menu_handle_button@buf_1747(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1667(BANK1[50]), menu_handle_encoder@buf_1670(BANK1[50]), 
;!		 -> menu_update_datetime_display@date_buf(COMRAM[9]), menu_update_datetime_display@time_buf(COMRAM[9]), menu_update_edit_value@value_buf(BANK0[10]), menu_update_time_value@debug_after(BANK0[50]), 
;!		 -> menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), 
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), 
;!		 -> trigger_relay_pulse@buf(BANK0[60]), value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), 
;!		 -> value_clock_enable(BANK4[10]), value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), 
;!		 -> value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), 
;!		 -> value_high_tbp(BANK5[10]), value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), 
;!		 -> value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), 
;!		 -> value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), 
;!		 -> value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), 
;!		 -> value_rlyslp(BANK5[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), 
;!		 -> value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), 
;!		 -> value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_238(CODE[1]), STR_336(CODE[8]), STR_337(CODE[6]), STR_338(CODE[6]), 
;!		 -> STR_339(CODE[5]), STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), 
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
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_draw_utility@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), 
;!		 -> original_value(BANK4[10]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> STR_274(CODE[1]), value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), 
;!		 -> value_clock_enable(BANK4[10]), value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), 
;!		 -> value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), 
;!		 -> value_high_tbp(BANK5[10]), value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), 
;!		 -> value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), 
;!		 -> value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), 
;!		 -> value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), 
;!		 -> value_rlyslp(BANK5[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), 
;!		 -> value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 12
;!		 -> menu_update_edit_value@value_buf(BANK0[10]), STR_177(CODE[9]), STR_185(CODE[6]), STR_186(CODE[6]), 
;!		 -> STR_187(CODE[9]), STR_188(CODE[6]), STR_189(CODE[6]), STR_190(CODE[9]), 
;!		 -> STR_191(CODE[6]), STR_192(CODE[6]), STR_193(CODE[9]), STR_194(CODE[5]), 
;!		 -> STR_195(CODE[5]), STR_196(CODE[5]), STR_201(CODE[6]), STR_202(CODE[6]), 
;!		 -> STR_203(CODE[9]), STR_204(CODE[5]), STR_205(CODE[5]), STR_206(CODE[5]), 
;!		 -> STR_207(CODE[7]), STR_208(CODE[8]), STR_209(CODE[5]), STR_210(CODE[5]), 
;!		 -> STR_211(CODE[6]), STR_212(CODE[6]), STR_213(CODE[9]), STR_214(CODE[2]), 
;!		 -> STR_215(CODE[4]), STR_220(CODE[4]), STR_237(CODE[6]), STR_264(CODE[6]), 
;!		 -> STR_265(CODE[6]), STR_266(CODE[9]), STR_268(CODE[5]), STR_271(CODE[1]), 
;!		 -> STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), STR_45(CODE[9]), 
;!		 -> STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[1]), 
;!		 -> STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), STR_61(CODE[5]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), STR_65(CODE[2]), 
;!		 -> STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), STR_73(CODE[1]), 
;!		 -> STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), STR_77(CODE[9]), 
;!		 -> STR_78(CODE[1]), STR_79(CODE[1]), value_back(BANK3[5]), value_brightness(BANK3[4]), 
;!		 -> value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), value_contrast(BANK3[4]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK4[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), 
;!		 -> value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), value_high_temp(BANK5[10]), value_highbp(BANK4[10]), 
;!		 -> value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), 
;!		 -> value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), 
;!		 -> value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), 
;!		 -> value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), 
;!		 -> value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strcpy@to	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_draw_utility@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), 
;!		 -> original_value(BANK4[10]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> STR_274(CODE[1]), value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), 
;!		 -> value_clock_enable(BANK4[10]), value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), 
;!		 -> value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), 
;!		 -> value_high_tbp(BANK5[10]), value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), 
;!		 -> value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), 
;!		 -> value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), 
;!		 -> value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), 
;!		 -> value_rlyslp(BANK5[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), 
;!		 -> value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strlen@cp	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_100(CODE[7]), 
;!		 -> STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), STR_104(CODE[9]), 
;!		 -> STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), STR_108(CODE[7]), 
;!		 -> STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), STR_112(CODE[11]), 
;!		 -> STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), STR_116(CODE[7]), 
;!		 -> STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), STR_120(CODE[10]), 
;!		 -> STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), STR_124(CODE[8]), 
;!		 -> STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), STR_128(CODE[8]), 
;!		 -> STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), STR_132(CODE[10]), 
;!		 -> STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), STR_136(CODE[9]), 
;!		 -> STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[11]), STR_140(CODE[5]), 
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), 
;!		 -> STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), 
;!		 -> STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), 
;!		 -> STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), STR_85(CODE[7]), 
;!		 -> STR_86(CODE[7]), STR_87(CODE[10]), STR_88(CODE[11]), STR_89(CODE[12]), 
;!		 -> STR_90(CODE[9]), STR_91(CODE[13]), STR_92(CODE[6]), STR_93(CODE[6]), 
;!		 -> STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[8]), STR_97(CODE[8]), 
;!		 -> STR_98(CODE[5]), STR_99(CODE[7]), value_back(BANK3[5]), value_brightness(BANK3[4]), 
;!		 -> value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), value_contrast(BANK3[4]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK4[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), 
;!		 -> value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), value_high_temp(BANK5[10]), value_highbp(BANK4[10]), 
;!		 -> value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), 
;!		 -> value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), 
;!		 -> value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), 
;!		 -> value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), 
;!		 -> value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strlen@s	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_100(CODE[7]), 
;!		 -> STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), STR_104(CODE[9]), 
;!		 -> STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), STR_108(CODE[7]), 
;!		 -> STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), STR_112(CODE[11]), 
;!		 -> STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), STR_116(CODE[7]), 
;!		 -> STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), STR_120(CODE[10]), 
;!		 -> STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), STR_124(CODE[8]), 
;!		 -> STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), STR_128(CODE[8]), 
;!		 -> STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), STR_132(CODE[10]), 
;!		 -> STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), STR_136(CODE[9]), 
;!		 -> STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[11]), STR_140(CODE[5]), 
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), 
;!		 -> STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[9]), STR_51(CODE[5]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[7]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[1]), STR_60(CODE[4]), 
;!		 -> STR_61(CODE[5]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[2]), STR_66(CODE[4]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[5]), STR_71(CODE[5]), STR_72(CODE[1]), 
;!		 -> STR_73(CODE[1]), STR_74(CODE[1]), STR_75(CODE[6]), STR_76(CODE[6]), 
;!		 -> STR_77(CODE[9]), STR_78(CODE[1]), STR_79(CODE[1]), STR_85(CODE[7]), 
;!		 -> STR_86(CODE[7]), STR_87(CODE[10]), STR_88(CODE[11]), STR_89(CODE[12]), 
;!		 -> STR_90(CODE[9]), STR_91(CODE[13]), STR_92(CODE[6]), STR_93(CODE[6]), 
;!		 -> STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[8]), STR_97(CODE[8]), 
;!		 -> STR_98(CODE[5]), STR_99(CODE[7]), value_back(BANK3[5]), value_brightness(BANK3[4]), 
;!		 -> value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), value_contrast(BANK3[4]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK4[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), 
;!		 -> value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), value_high_temp(BANK5[10]), value_highbp(BANK4[10]), 
;!		 -> value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), 
;!		 -> value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), 
;!		 -> value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), 
;!		 -> value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), 
;!		 -> value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
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
;!		 -> STR_132(CODE[10]), STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), 
;!		 -> STR_136(CODE[9]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[11]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    temp_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), 
;!		 -> value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(COMRAM[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK2[50]), main@buf_636(BANK3[30]), main@buf_670(BANK2[50]), main@buf_675(BANK2[60]), 
;!		 -> main@buf_678(BANK3[40]), main@buf_705(BANK3[30]), main@time_buf(BANK2[60]), menu_handle_button@buf(BANK1[50]), 
;!		 -> menu_handle_button@buf_1703(BANK1[50]), menu_handle_button@buf_1728(BANK1[50]), menu_handle_button@buf_1738(BANK1[50]), menu_handle_button@buf_1747(BANK1[50]), 
;!		 -> menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1667(BANK1[50]), menu_handle_encoder@buf_1670(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), 
;!		 -> menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), 
;!		 -> STR_10(CODE[42]), STR_11(CODE[34]), STR_12(CODE[36]), STR_13(CODE[20]), 
;!		 -> STR_142(CODE[29]), STR_15(CODE[28]), STR_152(CODE[26]), STR_16(CODE[23]), 
;!		 -> STR_19(CODE[22]), STR_2(CODE[42]), STR_20(CODE[19]), STR_21(CODE[24]), 
;!		 -> STR_22(CODE[22]), STR_223(CODE[31]), STR_23(CODE[22]), STR_24(CODE[19]), 
;!		 -> STR_26(CODE[16]), STR_31(CODE[20]), STR_32(CODE[15]), STR_322(CODE[27]), 
;!		 -> STR_33(CODE[26]), STR_335(CODE[25]), STR_340(CODE[20]), STR_343(CODE[22]), 
;!		 -> STR_344(CODE[28]), STR_345(CODE[37]), STR_346(CODE[31]), STR_347(CODE[39]), 
;!		 -> STR_348(CODE[31]), STR_349(CODE[49]), STR_350(CODE[38]), STR_351(CODE[43]), 
;!		 -> STR_352(CODE[38]), STR_353(CODE[29]), STR_36(CODE[22]), STR_37(CODE[20]), 
;!		 -> STR_38(CODE[21]), STR_39(CODE[33]), STR_4(CODE[29]), STR_42(CODE[36]), 
;!		 -> STR_43(CODE[20]), STR_44(CODE[21]), STR_5(CODE[23]), STR_7(CODE[20]), 
;!		 -> STR_8(CODE[16]), STR_9(CODE[37]), trigger_relay_pulse@buf(BANK0[60]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(COMRAM[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK2[50]), main@buf_636(BANK3[30]), main@buf_670(BANK2[50]), main@buf_675(BANK2[60]), 
;!		 -> main@buf_678(BANK3[40]), main@buf_705(BANK3[30]), main@time_buf(BANK2[60]), menu_handle_button@buf(BANK1[50]), 
;!		 -> menu_handle_button@buf_1703(BANK1[50]), menu_handle_button@buf_1728(BANK1[50]), menu_handle_button@buf_1738(BANK1[50]), menu_handle_button@buf_1747(BANK1[50]), 
;!		 -> menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1667(BANK1[50]), menu_handle_encoder@buf_1670(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), 
;!		 -> menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), 
;!		 -> STR_10(CODE[42]), STR_11(CODE[34]), STR_12(CODE[36]), STR_13(CODE[20]), 
;!		 -> STR_142(CODE[29]), STR_15(CODE[28]), STR_152(CODE[26]), STR_16(CODE[23]), 
;!		 -> STR_19(CODE[22]), STR_2(CODE[42]), STR_20(CODE[19]), STR_21(CODE[24]), 
;!		 -> STR_22(CODE[22]), STR_223(CODE[31]), STR_23(CODE[22]), STR_24(CODE[19]), 
;!		 -> STR_26(CODE[16]), STR_31(CODE[20]), STR_32(CODE[15]), STR_322(CODE[27]), 
;!		 -> STR_33(CODE[26]), STR_335(CODE[25]), STR_340(CODE[20]), STR_343(CODE[22]), 
;!		 -> STR_344(CODE[28]), STR_345(CODE[37]), STR_346(CODE[31]), STR_347(CODE[39]), 
;!		 -> STR_348(CODE[31]), STR_349(CODE[49]), STR_350(CODE[38]), STR_351(CODE[43]), 
;!		 -> STR_352(CODE[38]), STR_353(CODE[29]), STR_36(CODE[22]), STR_37(CODE[20]), 
;!		 -> STR_38(CODE[21]), STR_39(CODE[33]), STR_4(CODE[29]), STR_42(CODE[36]), 
;!		 -> STR_43(CODE[20]), STR_44(CODE[21]), STR_5(CODE[23]), STR_7(CODE[20]), 
;!		 -> STR_8(CODE[16]), STR_9(CODE[37]), trigger_relay_pulse@buf(BANK0[60]), 
;!
;!    utility_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[7]), STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[7]), STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[11]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), 
;!		 -> STR_120(CODE[10]), STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), 
;!		 -> STR_124(CODE[8]), STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), 
;!		 -> STR_132(CODE[10]), STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), 
;!		 -> STR_136(CODE[9]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[11]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    utility_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), 
;!		 -> value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    utility_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[7]), STR_101(CODE[10]), STR_102(CODE[11]), STR_103(CODE[10]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[9]), STR_106(CODE[8]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[7]), STR_109(CODE[7]), STR_110(CODE[5]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[11]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[7]), STR_118(CODE[5]), STR_119(CODE[6]), 
;!		 -> STR_120(CODE[10]), STR_121(CODE[11]), STR_122(CODE[9]), STR_123(CODE[12]), 
;!		 -> STR_124(CODE[8]), STR_125(CODE[8]), STR_126(CODE[5]), STR_127(CODE[7]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[10]), STR_130(CODE[8]), STR_131(CODE[5]), 
;!		 -> STR_132(CODE[10]), STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), 
;!		 -> STR_136(CODE[9]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[11]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    utility_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK5[10]), value_hi_pressure(BANK5[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK5[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK5[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK5[10]), value_rlyslp(BANK5[10]), 
;!		 -> value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
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
;!    _menu_handle_encoder->_menu_draw_utility
;!    _handle_time_rotation->_sprintf
;!    _handle_numeric_rotation->_sprintf
;!    _menu_handle_button->_menu_draw_utility
;!    _trigger_relay_pulse->_sprintf
;!    _rebuild_utility_menu->_sprintf
;!    _rebuild_input_menu->_sprintf
;!    _rebuild_clock_menu->_sprintf
;!    _menu_update_time_value->_sprintf
;!    _menu_draw_clock->_lcd_print_at
;!    _menu_draw_utility->_menu_update_datetime_display
;!    _menu_update_datetime_display->_sprintf
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
;!    _main->_menu_handle_button
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
;!    _main->_menu_handle_button
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
;! (0) _main                                               366   366      0 1559711
;!                                             12 BANK2    242   242      0
;!                                              0 BANK3    100   100      0
;!                                              0 BANK4      7     7      0
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
;! (1) _rtc_set_time                                        10     8      2    2447
;!                                             21 COMRAM    10     8      2
;!                         _dec_to_bcd
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;! ---------------------------------------------------------------------------------
;! (2) _dec_to_bcd                                           3     3      0    1615
;!                                             18 COMRAM     3     3      0
;!                            ___lbdiv
;!                            ___lbmod
;! ---------------------------------------------------------------------------------
;! (1) _rtc_read_time                                       90    88      2   35316
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
;! (2) _bcd_to_dec                                           2     2      0      62
;!                                             14 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _rtc_init                                             2     2      0     319
;!                                             21 COMRAM     2     2      0
;!                 _rtc_write_register
;! ---------------------------------------------------------------------------------
;! (2) _rtc_write_register                                   2     1      1     319
;!                                             19 COMRAM     2     1      1
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_numeric_value                           28    28      0    9942
;!                                             21 COMRAM    28    28      0
;!                   _is_numeric_field
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_edit_value                              31    31      0   43359
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
;! (1) _menu_handle_encoder                                172   170      2  461846
;!                                             87 COMRAM     2     0      2
;!                                            110 BANK0      6     6      0
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
;!                  _menu_draw_utility
;!             _menu_update_time_value
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _handle_time_rotation                                53    53      0   34061
;!                                              0 BANK0     53    53      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _handle_numeric_rotation                             57    57      0   34414
;!                                              0 BANK0     57    57      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                 285   285      0  612902
;!                                            110 BANK0     17    17      0
;!                                              0 BANK1    256   256      0
;!                                              0 BANK2     12    12      0
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
;!                  _menu_draw_utility
;!             _menu_update_time_value
;!                 _rebuild_clock_menu
;!                 _rebuild_input_menu
;!               _rebuild_utility_menu
;!                _save_current_config
;!                            _sprintf
;!                             _strcmp
;!                             _strcpy
;!                _trigger_relay_pulse
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _trigger_relay_pulse                                 61    61      0   33993
;!                                              0 BANK0     61    61      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_utility_menu                                 7     7      0   33243
;!                                             64 COMRAM     7     7      0
;!                            ___lbdiv
;!                            ___lbmod
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_input_menu                                  90    90      0   50431
;!                                             64 COMRAM     1     1      0
;!                                              0 BANK0     89    89      0
;!                            ___lwdiv
;!                            ___lwmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_clock_menu                                  58    58      0   44344
;!                                             64 COMRAM     2     2      0
;!                                              0 BANK0     56    56      0
;!                            ___lbdiv
;!                            ___lbmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_time_value                             111   111      0   82783
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
;! (2) _menu_draw_clock                                     32    32      0   37860
;!                                             25 COMRAM    32    32      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (3) ___lbmod                                              4     3      1     772
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (3) ___lbdiv                                              4     3      1     781
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_utility                                   34    34      0   86993
;!                                             82 COMRAM     5     5      0
;!                                              0 BANK0     29    29      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;!       _menu_update_datetime_display
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (3) _menu_update_datetime_display                        18    18      0   48671
;!                                             64 COMRAM    18    18      0
;!                     _lcd_clear_line
;!                       _lcd_print_at
;!                            _sprintf
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_setup                                     23    23      0   30115
;!                                             25 COMRAM    23    23      0
;!                          _lcd_clear
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_options                                    2     2      0   29521
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
;! (2) _menu_draw_input                                     51    51      0   74650
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
;! (3) _strlen                                               4     2      2    1030
;!                                             14 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (3) _strcpy                                               7     3      4    6589
;!                                             14 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (3) _strcmp                                               7     3      4    1213
;!                                             14 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (3) _lcd_print_at                                         4     1      3   15103
;!                                             21 COMRAM     4     1      3
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                             _strlen (ARG)
;! ---------------------------------------------------------------------------------
;! (3) _lcd_clear_line                                       1     1      0    6941
;!                                             21 COMRAM     1     1      0
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_set_cursor                                       3     2      1    2879
;!                                             18 COMRAM     3     2      1
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (4) _lcd_print                                            2     0      2    4031
;!                                             17 COMRAM     2     0      2
;!                           _lcd_data
;! ---------------------------------------------------------------------------------
;! (5) _lcd_data                                             1     1      0     186
;!                                             16 COMRAM     1     1      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (2) _is_time_field                                        4     2      2    1787
;!                                             14 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (3) _is_option_field                                      7     5      2    1488
;!                                             14 COMRAM     7     5      2
;! ---------------------------------------------------------------------------------
;! (2) _is_numeric_field                                     6     4      2    2165
;!                                             14 COMRAM     6     4      2
;! ---------------------------------------------------------------------------------
;! (3) _get_option_edit_flag                                 3     1      2    1489
;!                                             14 COMRAM     3     1      2
;! ---------------------------------------------------------------------------------
;! (3) _get_item_options_for_field                           3     1      2    1489
;!                                             14 COMRAM     3     1      2
;! ---------------------------------------------------------------------------------
;! (2) _init_time_editor                                    63    60      3   39920
;!                                             64 COMRAM     3     0      3
;!                                              0 BANK0     60    60      0
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _sprintf                                             42    24     18   25987
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
;! (2) _init_numeric_editor                                 10     8      2    5988
;!                                             26 COMRAM    10     8      2
;!                            ___lwdiv
;!                            ___lwmod
;! ---------------------------------------------------------------------------------
;! (2) ___lwmod                                              5     1      4    2682
;!                                             14 COMRAM     5     1      4
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4    2761
;!                                             19 COMRAM     7     3      4
;!                            ___lwmod (ARG)
;! ---------------------------------------------------------------------------------
;! (2) _get_current_numeric_value                           10     8      2      68
;!                                             14 COMRAM    10     8      2
;! ---------------------------------------------------------------------------------
;! (2) _beep                                                 5     3      2    2318
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
;! (1) _eeprom_init                                          5     5      0    7240
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
;! (1) _save_current_config                                  3     3      0    2914
;!                                             27 COMRAM     3     3      0
;!          _calculate_config_checksum
;!                 _eeprom_write_block
;!                  _eeprom_write_word
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_write_word                                    4     0      4     943
;!                                             17 COMRAM     4     0      4
;!                  _eeprom_write_byte
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_write_block                                  10     4      6    1402
;!                                             17 COMRAM    10     4      6
;!                  _eeprom_write_byte
;! ---------------------------------------------------------------------------------
;! (3) _eeprom_write_byte                                    3     0      3     636
;!                                             14 COMRAM     3     0      3
;! ---------------------------------------------------------------------------------
;! (2) _calculate_config_checksum                           12    10      2     405
;!                                             14 COMRAM    12    10      2
;! ---------------------------------------------------------------------------------
;! (2) _load_factory_defaults                                0     0      0    2098
;!                             _memcpy
;! ---------------------------------------------------------------------------------
;! (3) _memcpy                                              11     5      6    2098
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
;! (1) _ad7994_read_channel                                 50    48      2     544
;!                                             22 COMRAM    10     8      2
;!                           _i2c_read
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;! ---------------------------------------------------------------------------------
;! (2) _i2c_read                                             5     5      0     198
;!                                             17 COMRAM     5     5      0
;!                      _i2c_wait_idle
;! ---------------------------------------------------------------------------------
;! (1) _ad7994_init                                          1     1      0    7915
;!                                             19 COMRAM     1     1      0
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    7748
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
;! (2) _i2c_write                                            1     1      0      31
;!                                             14 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (2) _i2c_stop                                             2     2      0      68
;!                                             17 COMRAM     2     2      0
;!                      _i2c_wait_idle
;! ---------------------------------------------------------------------------------
;! (2) _i2c_start                                            2     2      0      68
;!                                             17 COMRAM     2     2      0
;!                      _i2c_wait_idle
;! ---------------------------------------------------------------------------------
;! (3) _i2c_wait_idle                                        3     3      0      34
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
;!       _strlen (ARG)
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
;!     _menu_draw_utility
;!       _lcd_clear_line
;!       _lcd_print
;!       _lcd_print_at
;!       _lcd_set_cursor
;!       _menu_update_datetime_display
;!         _lcd_clear_line
;!         _lcd_print_at
;!         _sprintf
;!       _strcpy
;!       _strlen
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
;!     _rebuild_utility_menu
;!       ___lbdiv
;!       ___lbmod
;!       ___lwdiv
;!       ___lwmod
;!       _sprintf
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
;!     _menu_draw_utility
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
;!BANK6              100      0      80      17       50.0%
;!BITBANK5           100      0       0      14        0.0%
;!BANK5              100      0      82      15       50.8%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100      7      FF      13       99.6%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100     64      FE      11       99.2%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100     FE     100       9      100.0%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100    100     100       7      100.0%
;!BITBANK15           80      0       0      34        0.0%
;!BANK15              80      0       0      35        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80     7F      80       5      100.0%
;!BITCOMRAM           7E      0       0       0        0.0%
;!COMRAM              7E     59      70       1       88.9%
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
;!ABS                  0      0     5EF      50        0.0%
;!DATA                 0      0     76F       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 173 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            30   70[BANK3 ] unsigned char [30]
;;  current_even    1  244[BANK2 ] unsigned char 
;;  time_buf       60   14[BANK2 ] unsigned char [60]
;;  buf            40    0[BANK3 ] unsigned char [40]
;;  delta           2  245[BANK2 ] int 
;;  buf            60   74[BANK2 ] unsigned char [60]
;;  buf            50  184[BANK2 ] unsigned char [50]
;;  lcd_buf        17    0        unsigned char [17]
;;  buf            30   40[BANK3 ] unsigned char [30]
;;  buf            50  134[BANK2 ] unsigned char [50]
;;  set_time        7    0[BANK4 ] struct .
;;  current_time    7  247[BANK2 ] struct .
;;  last_encoder    2  242[BANK2 ] int 
;;  adc_ch3         2  238[BANK2 ] unsigned int 
;;  adc_ch2         2  236[BANK2 ] unsigned int 
;;  adc_ch1         2  234[BANK2 ] unsigned int 
;;  adc_error       1  241[BANK2 ] unsigned char 
;;  last_button     1  240[BANK2 ] unsigned char 
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
;;      Locals:         0       0       0     240     100       7       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       2       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0     242     100       7       0       0       0       0       0       0       0       0       0       0       0
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
	
l15087:
	call	_system_init	;wreg free
	line	178
	
l15089:
	call	_eeprom_init	;wreg free
	line	185
	
l15091:; BSR set to: 3

	call	_get_menu_timeout_seconds	;wreg free
	movlb	2	; () banked
	movwf	(??_main+0+0)&0ffh
	movf	((??_main+0+0))&0ffh,w
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
	
l15093:
	call	_uart_init	;wreg free
	line	189
	
l15095:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	191
	
l15097:
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
	
l15099:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	195
	
l15101:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	196
	
l15103:
	call	_i2c_init	;wreg free
	line	197
	
l15105:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	200
	
l15107:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	201
	
l15109:
	call	_rtc_init	;wreg free
	iorlw	0
	btfss	status,2
	goto	u20451
	goto	u20450
u20451:
	goto	l15113
u20450:
	line	203
	
l15111:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	204
	goto	l15115
	line	207
	
l15113:
		movlw	low(STR_11)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_11)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	212
	
l15115:
	movlw	low(0)
	movlb	4	; () banked
	movwf	((main@set_time))&0ffh
	line	213
	
l15117:; BSR set to: 4

	movlw	low(0)
	movwf	(0+(main@set_time+01h))&0ffh
	line	214
	
l15119:; BSR set to: 4

	movlw	low(0Ch)
	movwf	(0+(main@set_time+02h))&0ffh
	line	215
	
l15121:; BSR set to: 4

	movlw	low(01h)
	movwf	(0+(main@set_time+03h))&0ffh
	line	216
	
l15123:; BSR set to: 4

	movlw	low(07h)
	movwf	(0+(main@set_time+04h))&0ffh
	line	217
	
l15125:; BSR set to: 4

	movlw	low(0Ah)
	movwf	(0+(main@set_time+05h))&0ffh
	line	218
	
l15127:; BSR set to: 4

	movlw	low(019h)
	movwf	(0+(main@set_time+06h))&0ffh
	line	220
	
l15129:; BSR set to: 4

		movlw	low(main@set_time)
	movwf	((c:rtc_set_time@time))^00h,c
	movlw	high(main@set_time)
	movwf	((c:rtc_set_time@time+1))^00h,c

	call	_rtc_set_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u20461
	goto	u20460
u20461:
	goto	l15133
u20460:
	line	222
	
l15131:
		movlw	low(STR_12)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_12)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	223
	goto	l174
	line	226
	
l15133:
		movlw	low(STR_13)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_13)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	227
	
l174:
	line	229
	call	_ad7994_init	;wreg free
	movlb	2	; () banked
	movwf	((main@adc_error))&0ffh
	line	230
	
l15135:; BSR set to: 2

	movf	((main@adc_error))&0ffh,w
	btfsc	status,2
	goto	u20471
	goto	u20470
u20471:
	goto	l15141
u20470:
	line	233
	
l15137:; BSR set to: 2

		movlw	low(main@buf_636)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_636)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_14)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_14)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@adc_error),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	234
	
l15139:
		movlw	low(main@buf_636)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_636)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	237
	
l15141:
	call	_encoder_init	;wreg free
	line	238
	
l15143:
	call	_menu_init	;wreg free
	line	239
	
l15145:; BSR set to: 3

	call	_lcd_init	;wreg free
	line	241
	
l15147:
		movlw	low(STR_15)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	242
	
l15149:
		movlw	low(STR_16)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_16)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	244
	
l15151:
	call	_lcd_clear	;wreg free
	line	245
	
l15153:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	246
	
l15155:
		movlw	low(STR_17)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_17)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	247
	
l15157:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	248
	
l15159:
		movlw	low(STR_18)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_18)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	250
	
l15161:
		movlw	low(STR_19)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_19)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	251
	
l15163:
		movlw	low(STR_20)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_20)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	252
	
l15165:
		movlw	low(STR_21)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_21)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	254
	
l15167:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	255
	
l15169:
	asmopt push
asmopt off
movlw  5
	movlb	2	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	15
movwf	(??_main+0+0)&0ffh
	movlw	241
u20947:
decfsz	wreg,f
	bra	u20947
	decfsz	(??_main+0+0)&0ffh,f
	bra	u20947
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u20947
asmopt pop

	line	256
	
l15171:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	258
	
l15173:
		movlw	low(STR_22)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_22)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	259
	
l15175:
		movlw	low(STR_23)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_23)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	265
	
l15177:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	266
	
l15179:; BSR set to: 2

	movlw	low(05h)
	movlb	3	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	268
	
l15181:; BSR set to: 3

	call	_menu_draw_options	;wreg free
	line	269
	
l15183:
		movlw	low(STR_24)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_24)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	272
	
l15185:
	movlw	high(0)
	movlb	2	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	273
	
l15187:; BSR set to: 2

	movlw	low(0)
	movwf	((main@last_button))&0ffh
	line	287
	
l15189:
	movlb	3	; () banked
	incf	((main@sample_counter))&0ffh
	line	289
	
l15191:; BSR set to: 3

		movlw	0Ah-1
	cpfsgt	((main@sample_counter))&0ffh
	goto	u20481
	goto	u20480

u20481:
	goto	l15213
u20480:
	line	291
	
l15193:; BSR set to: 3

	movlw	low(0)
	movwf	((main@sample_counter))&0ffh
	line	294
	
l15195:; BSR set to: 3

		movlw	low(main@current_time)
	movwf	((c:rtc_read_time@time))^00h,c
	movlw	high(main@current_time)
	movwf	((c:rtc_read_time@time+1))^00h,c

	call	_rtc_read_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u20491
	goto	u20490
u20491:
	goto	l15201
u20490:
	line	299
	
l15197:
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
	
l15199:
		movlw	low(main@time_buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@time_buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	301
	goto	l15203
	line	304
	
l15201:
		movlw	low(STR_26)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_26)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	308
	
l15203:
	movlw	(01h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch1)
	movff	1+?_ad7994_read_channel,(main@adc_ch1+1)
	line	309
	
l15205:
	movlw	(02h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch2)
	movff	1+?_ad7994_read_channel,(main@adc_ch2+1)
	line	310
	
l15207:
	movlw	(03h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch3)
	movff	1+?_ad7994_read_channel,(main@adc_ch3+1)
	line	314
	
l15209:
		movlw	low(main@buf_670)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_670)
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
	
l15211:
		movlw	low(main@buf_670)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_670)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	320
	
l15213:
	asmopt push
asmopt off
movlw  3
	movlb	2	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	8
movwf	(??_main+0+0)&0ffh
	movlw	119
u20957:
decfsz	wreg,f
	bra	u20957
	decfsz	(??_main+0+0)&0ffh,f
	bra	u20957
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u20957
asmopt pop

	line	325
	
l15215:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	337
	
l15217:
	movlb	3	; () banked
	movf	((main@last_relay_state))&0ffh,w
	movlb	0	; () banked
xorwf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u20501
	goto	u20500

u20501:
	goto	l15221
u20500:
	
l15219:; BSR set to: 0

	movlb	3	; () banked
	movf	((main@last_relay_counter))&0ffh,w
xorwf	((_relay_counter))&0ffh,w	;volatile
	bnz	u20510
movf	((main@last_relay_counter+1))&0ffh,w
xorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u20511
	goto	u20510

u20511:
	goto	l15229
u20510:
	line	340
	
l15221:
		movlw	low(main@buf_675)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_675)
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
	
l15223:
		movlw	low(main@buf_675)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_675)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	342
	
l15225:
	movff	(_relay_state),(main@last_relay_state)	;volatile
	line	343
	
l15227:
	movff	(_relay_counter),(main@last_relay_counter)	;volatile
	movff	(_relay_counter+1),(main@last_relay_counter+1)	;volatile
	line	348
	
l15229:
	movlb	2	; () banked
	movf	((main@last_encoder))&0ffh,w
	movlb	3	; () banked
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u20520
	movlb	2	; () banked
movf	((main@last_encoder+1))&0ffh,w
	movlb	3	; () banked
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u20521
	goto	u20520

u20521:
	goto	l15287
u20520:
	line	350
	
l15231:; BSR set to: 3

	movlb	2	; () banked
	movf	((main@last_encoder))&0ffh,w
	movlb	3	; () banked
	subwf	((_encoder_count))&0ffh,w	;volatile
	movlb	2	; () banked
	movwf	((main@delta))&0ffh
	movf	((main@last_encoder+1))&0ffh,w
	movlb	3	; () banked
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movlb	2	; () banked
	movwf	1+((main@delta))&0ffh
	line	353
	
l15233:; BSR set to: 2

	movlw	high(01h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	356
	
l15235:
		movlw	low(main@buf_678)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_678)
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
	
l15237:
		movlw	low(main@buf_678)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_678)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	359
	
l15239:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	362
	
l15241:
	movlw	high(0Ah)
	movlb	3	; () banked
	movwf	((main@encoder_activity_timer+1))&0ffh
	movlw	low(0Ah)
	movwf	((main@encoder_activity_timer))&0ffh
	line	365
	
l15243:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u20531
	goto	u20530
u20531:
	goto	l198
u20530:
	line	367
	
l15245:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	368
	
l198:; BSR set to: 3

	line	371
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u20541
	goto	u20540
u20541:
	goto	l15257
u20540:
	
l15247:; BSR set to: 3

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20551
	goto	u20550

u20551:
	goto	l15257
u20550:
	line	373
	
l15249:; BSR set to: 2

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
	goto	u20561
	goto	u20560
u20561:
	goto	l15253
u20560:
	line	376
	
l15251:
	movlb	2	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_numeric_rotation
	line	377
	goto	l15261
	line	378
	
l15253:
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
	goto	u20571
	goto	u20570
u20571:
	goto	l15257
u20570:
	line	381
	
l15255:
	movlb	2	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_time_rotation
	line	382
	call	_menu_update_time_value	;wreg free
	line	383
	goto	l15261
	line	387
	
l15257:
	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	line	397
	
l15261:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u20581
	goto	u20580
u20581:
	goto	l15275
u20580:
	
l15263:; BSR set to: 3

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20591
	goto	u20590

u20591:
	goto	l15275
u20590:
	line	400
	
l15265:; BSR set to: 2

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
	goto	u20601
	goto	u20600
u20601:
	goto	l15269
u20600:
	line	403
	
l15267:
	call	_menu_update_numeric_value	;wreg free
	line	404
	goto	l15287
	line	405
	
l15269:
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
	goto	u20611
	goto	u20610
u20611:
	goto	l15273
u20610:
	line	408
	
l15271:
	call	_menu_update_time_value	;wreg free
	line	409
	goto	l15287
	line	413
	
l15273:
	call	_menu_update_edit_value	;wreg free
	goto	l15287
	line	419
	
l15275:
	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20621
	goto	u20620
u20621:
	goto	l15279
u20620:
	line	421
	
l15277:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	422
	goto	l15287
	line	423
	
l15279:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20631
	goto	u20630

u20631:
	goto	l15283
u20630:
	line	425
	
l15281:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	line	426
	goto	l15287
	line	427
	
l15283:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20641
	goto	u20640

u20641:
	goto	l15287
u20640:
	line	429
	
l15285:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	435
	
l15287:
	movlb	2	; () banked
	movf	((main@last_button))&0ffh,w
	movlb	3	; () banked
xorwf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u20651
	goto	u20650

u20651:
	goto	l15363
u20650:
	line	437
	
l15289:; BSR set to: 3

	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u20661
	goto	u20660
u20661:
	goto	l15359
u20660:
	line	439
	
l15291:; BSR set to: 3

	movff	(_button_event),(main@current_event)	;volatile
	line	440
	
l15293:; BSR set to: 3

	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	443
	
l15295:; BSR set to: 3

		movlw	low(main@buf_705)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_705)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_30)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_30)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@current_event),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	444
	
l15297:
		movlw	low(main@buf_705)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_705)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	447
	
l15299:
		movlw	2
	movlb	2	; () banked
	xorwf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u20671
	goto	u20670

u20671:
	goto	l15335
u20670:
	line	449
	
l15301:; BSR set to: 2

		movlw	low(STR_31)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_31)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	452
	
l15303:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u20681
	goto	u20680
u20681:
	goto	l15317
u20680:
	line	455
	
l15305:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	456
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	457
	movlw	low(0)
	movwf	(0+(_menu+08h))&0ffh
	line	461
	
l15307:; BSR set to: 3

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
	
l15309:; BSR set to: 2

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
	
l15311:; BSR set to: 2

		movlw	low(STR_32)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_32)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	467
	
l15313:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20691
	goto	u20690

u20691:
	goto	l15359
u20690:
	line	468
	
l15315:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	goto	l15359
	line	474
	
l15317:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20701
	goto	u20700
u20701:
	goto	l15323
u20700:
	line	476
	
l15319:; BSR set to: 2

	setf	((_current_menu))&0ffh
	line	477
	
l15321:; BSR set to: 2

		movlw	low(STR_33)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_33)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	478
	goto	l15359
	line	479
	
l15323:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20711
	goto	u20710

u20711:
	goto	l15329
u20710:
	line	481
	
l15325:; BSR set to: 2

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
	
l15327:
	call	_menu_draw_setup	;wreg free
	line	486
	goto	l15359
	line	487
	
l15329:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20721
	goto	u20720

u20721:
	goto	l229
u20720:
	line	489
	
l15331:; BSR set to: 2

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
	
l15333:
	call	_menu_draw_options	;wreg free
	goto	l15359
	line	498
	
l15335:; BSR set to: 2

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20731
	goto	u20730

u20731:
	goto	l15345
u20730:
	line	500
	
l15337:; BSR set to: 2

		decf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u20741
	goto	u20740

u20741:
	goto	l15359
u20740:
	line	502
	
l15339:; BSR set to: 2

	movlw	low(0)
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
	
l15341:; BSR set to: 3

	call	_menu_draw_options	;wreg free
	line	507
	
l15343:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l15359
	line	513
	
l15345:; BSR set to: 2

	movf	((main@current_event))&0ffh,w
	
	call	_menu_handle_button
	line	516
	
l15347:
	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20751
	goto	u20750
u20751:
	goto	l15351
u20750:
	goto	l15333
	line	518
	
l15351:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20761
	goto	u20760

u20761:
	goto	l15355
u20760:
	goto	l15315
	line	520
	
l15355:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20771
	goto	u20770

u20771:
	goto	l229
u20770:
	goto	l15327
	line	522
	
l229:; BSR set to: 2

	line	524
	
l15359:
	movff	(_button_event),(main@last_button)	;volatile
	line	525
	
l15361:
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	530
	
l15363:; BSR set to: 3

	movlb	2	; () banked
		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20781
	goto	u20780

u20781:
	goto	l15379
u20780:
	
l15365:; BSR set to: 2

	movlb	3	; () banked
		incf	((main@last_menu_state))&0ffh,w
	btfsc	status,2
	goto	u20791
	goto	u20790

u20791:
	goto	l15379
u20790:
	line	533
	
l15367:; BSR set to: 3

	call	_lcd_clear	;wreg free
	line	534
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	535
	
l15369:
		movlw	low(STR_34)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_34)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	536
	
l15371:
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
	
l15373:
	call	_save_current_config	;wreg free
	line	542
	
l15375:
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_save_pending))&0ffh
	line	543
	
l15377:; BSR set to: 3

		movlw	low(STR_38)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_38)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	545
	
l15379:
	movff	(_current_menu),(main@last_menu_state)
	line	548
	
l15381:
	movlb	3	; () banked
	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfsc	status,2
	goto	u20801
	goto	u20800

u20801:
	goto	l15385
u20800:
	line	550
	
l15383:; BSR set to: 3

	decf	((main@encoder_activity_timer))&0ffh
	btfss	status,0
	decf	((main@encoder_activity_timer+1))&0ffh
	line	554
	
l15385:; BSR set to: 3

	movlw	low(01h)
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	555
	
l15387:; BSR set to: 3

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	iorwf	((main@blink_timer+1))&0ffh,w
	bnz	u20810
	movlw	10
	subwf	 ((main@blink_timer))&0ffh,w
	btfss	status,0
	goto	u20811
	goto	u20810

u20811:
	goto	l15421
u20810:
	line	557
	
l15389:; BSR set to: 3

	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	558
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u20821
	goto	u20820
u20821:
	goto	l15419
u20820:
	line	561
	
l15391:; BSR set to: 3

	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfss	status,2
	goto	u20831
	goto	u20830

u20831:
	goto	l15421
u20830:
	line	563
	
l15393:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20841
	goto	u20840
u20841:
	movlw	1
	goto	u20850
u20840:
	movlw	0
u20850:
	movwf	(0+(_menu+05h))&0ffh
	line	567
	goto	l15417
	line	570
	
l15395:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	571
	goto	l15421
	line	575
	
l15397:; BSR set to: 2

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
	goto	u20861
	goto	u20860
u20861:
	goto	l15401
u20860:
	line	577
	
l15399:
	call	_menu_update_numeric_value	;wreg free
	line	578
	goto	l15421
	line	579
	
l15401:
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
	goto	u20871
	goto	u20870
u20871:
	goto	l15405
u20870:
	line	581
	
l15403:
	call	_menu_update_time_value	;wreg free
	line	582
	goto	l15421
	line	586
	
l15405:
	call	_menu_draw_input	;wreg free
	goto	l15421
	line	591
	
l15407:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	592
	goto	l15421
	line	594
	
l15409:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20881
	goto	u20880

u20881:
	goto	l15413
u20880:
	goto	l15403
	line	600
	
l15413:; BSR set to: 3

	call	_menu_draw_clock	;wreg free
	goto	l15421
	line	567
	
l15417:; BSR set to: 3

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
	goto	l15395
	xorlw	1^0	; case 1
	skipnz
	goto	l15397
	xorlw	2^1	; case 2
	skipnz
	goto	l15407
	xorlw	3^2	; case 3
	skipnz
	goto	l15409
	goto	l15421

	line	608
	
l15419:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	622
	
l15421:
		movlw	05h-0
	movlb	2	; () banked
	cpfslt	((_current_menu))&0ffh
	goto	u20891
	goto	u20890

u20891:
	goto	l15455
u20890:
	line	624
	
l15423:; BSR set to: 2

	movlb	3	; () banked
	movf	((_menu_timeout_flag))&0ffh,w	;volatile
	btfss	status,2
	goto	u20901
	goto	u20900
u20901:
	goto	l15455
u20900:
	line	626
	
l15425:; BSR set to: 3

		movlw	low(STR_39)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_39)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	629
	
l15427:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	630
	
l15429:
	asmopt push
asmopt off
movlw  3
	movlb	2	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	8
movwf	(??_main+0+0)&0ffh
	movlw	119
u20967:
decfsz	wreg,f
	bra	u20967
	decfsz	(??_main+0+0)&0ffh,f
	bra	u20967
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u20967
asmopt pop

	line	631
	
l15431:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	634
	
l15433:
	movlb	2	; () banked
	setf	((_current_menu))&0ffh
	line	635
	
l15435:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	636
	
l15437:; BSR set to: 3

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	637
	
l15439:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	640
	
l15441:; BSR set to: 3

	call	_lcd_clear	;wreg free
	line	641
	
l15443:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	642
	
l15445:
		movlw	low(STR_40)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_40)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	643
	
l15447:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	644
	
l15449:
		movlw	low(STR_41)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_41)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	647
	
l15451:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	648
	
l15453:; BSR set to: 3

	movlw	high(0)
	movwf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_menu_timeout_timer))^00h,c	;volatile
	line	653
	
l15455:
	movlb	3	; () banked
	movf	((_long_press_beep_flag))&0ffh,w	;volatile
	btfsc	status,2
	goto	u20911
	goto	u20910
u20911:
	goto	l15463
u20910:
	line	655
	
l15457:; BSR set to: 3

	movlw	low(0)
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	line	656
	
l15459:; BSR set to: 3

	movlw	high(01F4h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01F4h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	657
	
l15461:
		movlw	low(STR_42)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_42)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	662
	
l15463:
	movlb	3	; () banked
	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u20921
	goto	u20920
u20921:
	goto	l15475
u20920:
	
l15465:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u20931
	goto	u20930
u20931:
	goto	l15475
u20930:
	line	664
	
l15467:; BSR set to: 3

		movlw	low(STR_43)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_43)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	665
	
l15469:
	call	_save_current_config	;wreg free
	line	666
	
l15471:
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_save_pending))&0ffh
	line	667
	
l15473:; BSR set to: 3

		movlw	low(STR_44)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_44)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	672
	
l15475:
	asmopt push
asmopt off
	movlw	133
u20977:
decfsz	wreg,f
	bra	u20977
	nop
asmopt pop

	goto	l15189
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
;;		On entry : 0/3
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
	
l13615:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	55
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	57
	
l13617:
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
	
l13619:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	91
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	94
	
l141:
	line	93
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u18071
	goto	u18070
u18071:
	goto	l141
u18070:
	line	96
	
l13621:
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
	
l13623:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	103
	
l13625:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	105
	
l13627:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	106
	
l13629:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	107
	
l13631:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	108
	
l13633:
	bsf	((c:3987))^0f00h,c,0	;volatile
	line	109
	
l13635:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	111
	
l13637:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	112
	
l13639:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	115
	
l13641:
	bcf	((c:3988))^0f00h,c,1	;volatile
	line	116
	
l13643:
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
;;		On entry : 3F/4
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
	
l13713:; BSR set to: 4

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
	
l13715:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u18151
	goto	u18150
u18151:
	goto	l13721
u18150:
	line	90
	
l13717:
	movlw	(01h)&0ffh
	goto	l1695
	line	91
	
l13721:
	asmopt push
asmopt off
	movlw	133
u20987:
decfsz	wreg,f
	bra	u20987
	nop
asmopt pop

	line	93
	
l13723:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u18161
	goto	u18160
u18161:
	goto	l13729
u18160:
	goto	l13717
	line	95
	
l13729:
	asmopt push
asmopt off
	movlw	133
u20997:
decfsz	wreg,f
	bra	u20997
	nop
asmopt pop

	line	97
	
l13731:
	movlw	(0)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u18171
	goto	u18170
u18171:
	goto	l13737
u18170:
	goto	l13717
	line	99
	
l13737:
	asmopt push
asmopt off
	movlw	133
u21007:
decfsz	wreg,f
	bra	u21007
	nop
asmopt pop

	line	101
	
l13739:
	movlw	low(0)
	movwf	((c:rtc_set_time@i))^00h,c
	line	103
	
l13745:
	movf	((c:rtc_set_time@i))^00h,c,w
	addlw	low(rtc_set_time@data)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u18181
	goto	u18180
u18181:
	goto	l13751
u18180:
	goto	l13717
	line	105
	
l13751:
	asmopt push
asmopt off
	movlw	133
u21017:
decfsz	wreg,f
	bra	u21017
	nop
asmopt pop

	line	101
	
l13753:
	incf	((c:rtc_set_time@i))^00h,c
		movlw	07h-1
	cpfsgt	((c:rtc_set_time@i))^00h,c
	goto	u18191
	goto	u18190

u18191:
	goto	l13745
u18190:
	line	108
	
l13755:
	call	_i2c_stop	;wreg free
	line	109
	
l13757:
	asmopt push
asmopt off
	movlw	228
u21027:
	nop2
	nop2
decfsz	wreg,f
	bra	u21027
	nop2
	nop2
asmopt pop

	line	110
	
l13759:
	movlw	(0)&0ffh
	line	111
	
l1695:
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
;;		On entry : 0/4
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
	
l13611:
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
	
l1691:
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
;;		 -> init_datetime_editor@current_time(7), main@current_time(7), 
;; Auto vars:     Size  Location     Type
;;  i               1   87[BANK0 ] unsigned char 
;;  debug_buf      80    0[BANK0 ] unsigned char [80]
;;  data            7   80[BANK0 ] unsigned char [7]
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/3
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
	
l13909:; BSR set to: 3

	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u18261
	goto	u18260
u18261:
	goto	l13915
u18260:
	line	120
	
l13911:
	movlw	(01h)&0ffh
	goto	l1704
	line	121
	
l13915:
	asmopt push
asmopt off
	movlw	133
u21037:
decfsz	wreg,f
	bra	u21037
	nop
asmopt pop

	line	123
	
l13917:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u18271
	goto	u18270
u18271:
	goto	l13923
u18270:
	goto	l13911
	line	125
	
l13923:
	asmopt push
asmopt off
	movlw	133
u21047:
decfsz	wreg,f
	bra	u21047
	nop
asmopt pop

	line	127
	
l13925:
	movlw	(0)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u18281
	goto	u18280
u18281:
	goto	l13931
u18280:
	goto	l13911
	line	129
	
l13931:
	asmopt push
asmopt off
	movlw	133
u21057:
decfsz	wreg,f
	bra	u21057
	nop
asmopt pop

	line	131
	
l13933:
	call	_i2c_stop	;wreg free
	line	132
	
l13935:
	asmopt push
asmopt off
	movlw	228
u21067:
	nop2
	nop2
decfsz	wreg,f
	bra	u21067
	nop2
	nop2
asmopt pop

	line	135
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u18291
	goto	u18290
u18291:
	goto	l13941
u18290:
	goto	l13911
	line	137
	
l13941:
	asmopt push
asmopt off
	movlw	133
u21077:
decfsz	wreg,f
	bra	u21077
	nop
asmopt pop

	line	139
	
l13943:
	movlw	(0D1h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u18301
	goto	u18300
u18301:
	goto	l13949
u18300:
	goto	l13911
	line	141
	
l13949:
	asmopt push
asmopt off
	movlw	133
u21087:
decfsz	wreg,f
	bra	u21087
	nop
asmopt pop

	line	143
	
l13951:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((rtc_read_time@i))&0ffh
	line	145
	
l13957:; BSR set to: 0

	movf	((rtc_read_time@i))&0ffh,w
	addlw	low(rtc_read_time@data)
	movwf	fsr2l
	clrf	fsr2h
	movlw	(01h)&0ffh
	
	call	_i2c_read
	movwf	indf2,c

	line	143
	
l13959:
	movlb	0	; () banked
	incf	((rtc_read_time@i))&0ffh
	
l13961:; BSR set to: 0

		movlw	06h-1
	cpfsgt	((rtc_read_time@i))&0ffh
	goto	u18311
	goto	u18310

u18311:
	goto	l13957
u18310:
	line	147
	
l13963:; BSR set to: 0

	movlw	(0)&0ffh
	
	call	_i2c_read
	movlb	0	; () banked
	movwf	(0+(rtc_read_time@data+06h))&0ffh
	line	148
	call	_i2c_stop	;wreg free
	line	153
	
l13965:
		movlw	low(rtc_read_time@debug_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_342)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_342)
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
	
l13967:
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
	
l13969:
	movlw	(0)&0ffh
	line	166
	
l1704:
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
	
l13607:
	movff	(c:bcd_to_dec@bcd),??_bcd_to_dec+0+0
	movlw	0Fh
	andwf	(??_bcd_to_dec+0+0)^00h,c
	swapf	((c:bcd_to_dec@bcd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	mullw	0Ah
	movf	(prodl)^0f00h,c,w
	addwf	(??_bcd_to_dec+0+0)^00h,c,w
	line	66
	
l1688:
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
;;		On entry : 0/3
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
	
l13701:
	asmopt push
asmopt off
movlw  21
movwf	(??_rtc_init+0+0+1)^00h,c
movlw	75
movwf	(??_rtc_init+0+0)^00h,c
	movlw	190
u21097:
decfsz	wreg,f
	bra	u21097
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u21097
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u21097
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
u21107:
decfsz	wreg,f
	bra	u21107
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u21107
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u21107
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
u21117:
decfsz	wreg,f
	bra	u21117
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u21117
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u21117
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
u21127:
decfsz	wreg,f
	bra	u21127
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u21127
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u21127
	nop2
asmopt pop

	line	54
	
l13703:
	movlw	low(0)
	movwf	((c:rtc_write_register@value))^00h,c
	movlw	(0Eh)&0ffh
	
	call	_rtc_write_register
	iorlw	0
	btfsc	status,2
	goto	u18141
	goto	u18140
u18141:
	goto	l13709
u18140:
	line	56
	
l13705:
	movlw	(01h)&0ffh
	goto	l1685
	line	59
	
l13709:
	movlw	(0)&0ffh
	line	60
	
l1685:
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
;;		On entry : 0/3
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
	
l13577:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u18031
	goto	u18030
u18031:
	goto	l13583
u18030:
	line	12
	
l13579:
	movlw	(01h)&0ffh
	goto	l1670
	line	13
	
l13583:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u18041
	goto	u18040
u18041:
	goto	l13589
u18040:
	goto	l13579
	line	15
	
l13589:
	movf	((c:rtc_write_register@reg))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u18051
	goto	u18050
u18051:
	goto	l13595
u18050:
	goto	l13579
	line	17
	
l13595:
	movf	((c:rtc_write_register@value))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u18061
	goto	u18060
u18061:
	goto	l13601
u18060:
	goto	l13579
	line	19
	
l13601:
	call	_i2c_stop	;wreg free
	line	20
	
l13603:
	movlw	(0)&0ffh
	line	21
	
l1670:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rtc_write_register
	__end_of_rtc_write_register:
	signat	_rtc_write_register,8313
	global	_menu_update_numeric_value

;; *************** function _menu_update_numeric_value *****************
;; Defined at:
;;		line 1272 in file "src\menu.c"
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
	line	1272
global __ptext9
__ptext9:
psect	text9
	file	"src\menu.c"
	line	1272
	
_menu_update_numeric_value:
;incstack = 0
	callstack 25
	line	1275
	
l14235:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18781
	goto	u18780

u18781:
	goto	l912
u18780:
	
l14237:; BSR set to: 2

	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u18791
	goto	u18790
u18791:
	goto	l14239
u18790:
	goto	l912
	line	1279
	
l14239:; BSR set to: 3

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((c:menu_update_numeric_value@screen_line))^00h,c
	line	1280
		movlw	03h-1
	cpfsgt	((c:menu_update_numeric_value@screen_line))^00h,c
	goto	u18801
	goto	u18800

u18801:
	goto	l14243
u18800:
	goto	l912
	line	1285
	
l14243:; BSR set to: 3

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
	line	1286
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
	line	1289
	
l14245:; BSR set to: 2

	movff	(c:menu_update_numeric_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(c:menu_update_numeric_value@flow_type),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u18811
	goto	u18810
u18811:
	goto	l14249
u18810:
	goto	l912
	line	1293
	
l14249:
	lfsr	2,(menu_update_numeric_value@value_buf)
	movlw	6-1
u18821:
	clrf	postinc2
	decf	wreg
	bc	u18821
	line	1295
	
l14251:
	movlb	3	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u18831
	goto	u18830
u18831:
	goto	l14283
u18830:
	line	1298
	
l14253:; BSR set to: 3

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18841
	goto	u18840

u18841:
	goto	l14257
u18840:
	
l14255:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18851
	goto	u18850
u18851:
	goto	l14259
u18850:
	
l14257:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1464))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1464))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1464))^00h,c
	goto	l14261
	
l14259:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1464+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1464))^00h,c
	
l14261:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1464),(c:menu_update_numeric_value@value_buf)
	line	1299
	
l14263:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18861
	goto	u18860

u18861:
	goto	l14267
u18860:
	
l14265:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18871
	goto	u18870
u18871:
	goto	l14269
u18870:
	
l14267:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1465))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1465))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1465))^00h,c
	goto	l14271
	
l14269:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1465+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1465))^00h,c
	
l14271:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1465),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1300
	
l14273:; BSR set to: 3

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18881
	goto	u18880

u18881:
	goto	l14277
u18880:
	
l14275:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18891
	goto	u18890
u18891:
	goto	l14279
u18890:
	
l14277:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1466))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1466))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1466))^00h,c
	goto	l14281
	
l14279:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1466+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1466))^00h,c
	
l14281:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1466),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1301
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+03h))^00h,c
	line	1302
	goto	l938
	line	1306
	
l14283:; BSR set to: 3

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18901
	goto	u18900
u18901:
	goto	l14287
u18900:
	
l14285:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18911
	goto	u18910
u18911:
	goto	l14295
u18910:
	
l14287:; BSR set to: 3

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u18921
	goto	u18920
u18921:
	goto	l14291
u18920:
	
l14289:; BSR set to: 3

	movlw	high(02Bh)
	movwf	((c:_menu_update_numeric_value$1468+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_menu_update_numeric_value$1468))^00h,c
	goto	l14293
	
l14291:; BSR set to: 3

	movlw	high(02Dh)
	movwf	((c:_menu_update_numeric_value$1468+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_menu_update_numeric_value$1468))^00h,c
	
l14293:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1468),(c:_menu_update_numeric_value$1467)
	movff	(c:_menu_update_numeric_value$1468+1),(c:_menu_update_numeric_value$1467+1)
	goto	l14297
	
l14295:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1467+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1467))^00h,c
	
l14297:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1467),(c:menu_update_numeric_value@value_buf)
	line	1307
	
l14299:; BSR set to: 3

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18931
	goto	u18930

u18931:
	goto	l14303
u18930:
	
l14301:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18941
	goto	u18940
u18941:
	goto	l14305
u18940:
	
l14303:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1469))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1469))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1469))^00h,c
	goto	l14307
	
l14305:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1469+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1469))^00h,c
	
l14307:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1469),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1308
	
l14309:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18951
	goto	u18950

u18951:
	goto	l14313
u18950:
	
l14311:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18961
	goto	u18960
u18961:
	goto	l14315
u18960:
	
l14313:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1470))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1470))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1470))^00h,c
	goto	l14317
	
l14315:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1470+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1470))^00h,c
	
l14317:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1470),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1309
	
l14319:; BSR set to: 3

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18971
	goto	u18970

u18971:
	goto	l14323
u18970:
	
l14321:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18981
	goto	u18980
u18981:
	goto	l14325
u18980:
	
l14323:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1471))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1471))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1471))^00h,c
	goto	l14327
	
l14325:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1471+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1471))^00h,c
	
l14327:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1471),0+((c:menu_update_numeric_value@value_buf)+03h)
	line	1310
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+04h))^00h,c
	line	1311
	
l938:; BSR set to: 3

	line	1314
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u18991
	goto	u18990
u18991:
	goto	l14331
u18990:
	
l14329:; BSR set to: 3

	movlw	high(0Eh)
	movwf	((c:_menu_update_numeric_value$1473+1))^00h,c
	movlw	low(0Eh)
	movwf	((c:_menu_update_numeric_value$1473))^00h,c
	goto	l14333
	
l14331:; BSR set to: 3

	movlw	high(0Fh)
	movwf	((c:_menu_update_numeric_value$1473+1))^00h,c
	movlw	low(0Fh)
	movwf	((c:_menu_update_numeric_value$1473))^00h,c
	
l14333:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1473),(c:menu_update_numeric_value@start_col)
	line	1316
	
l14335:; BSR set to: 3

	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1317
	
l14337:
		movlw	low(STR_230)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_230)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1319
	
l14339:
	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1320
	
l14341:
		movlw	low(STR_231)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_231)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1321
	
l14343:
		movlw	low(menu_update_numeric_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1322
	
l14345:
		movlw	low(STR_232)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_232)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1323
	
l912:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_numeric_value
	__end_of_menu_update_numeric_value:
	signat	_menu_update_numeric_value,89
	global	_menu_update_edit_value

;; *************** function _menu_update_edit_value *****************
;; Defined at:
;;		line 1208 in file "src\menu.c"
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
	line	1208
global __ptext10
__ptext10:
psect	text10
	file	"src\menu.c"
	line	1208
	
_menu_update_edit_value:
;incstack = 0
	callstack 25
	line	1212
	
l14347:
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
	line	1213
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
	line	1216
	
l14349:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u19001
	goto	u19000
u19001:
	goto	l890
u19000:
	
l14351:; BSR set to: 3

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u19011
	goto	u19010

u19011:
	goto	l14353
u19010:
	goto	l890
	line	1220
	
l14353:; BSR set to: 2

	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@screen_line))&0ffh
	line	1221
		movlw	03h-1
	cpfsgt	((menu_update_edit_value@screen_line))&0ffh
	goto	u19021
	goto	u19020

u19021:
	goto	l14357
u19020:
	goto	l890
	line	1225
	
l14357:; BSR set to: 0

	movff	(menu_update_edit_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_update_edit_value@flow_type),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u19031
	goto	u19030
u19031:
	goto	l14361
u19030:
	goto	l890
	line	1230
	
l14361:
	movlb	3	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u19041
	goto	u19040
u19041:
	goto	l14365
u19040:
	line	1232
	
l14363:; BSR set to: 3

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_225)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_225)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+0Ah),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1233
	goto	l14373
	line	1238
	
l14365:; BSR set to: 3

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u19051
	goto	u19050
u19051:
	goto	l14369
u19050:
	
l14367:; BSR set to: 3

	movlw	high(02Bh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1449+1))&0ffh
	movlw	low(02Bh)
	movwf	((_menu_update_edit_value$1449))&0ffh
	goto	l14371
	
l14369:; BSR set to: 3

	movlw	high(02Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1449+1))&0ffh
	movlw	low(02Dh)
	movwf	((_menu_update_edit_value$1449))&0ffh
	
l14371:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_226)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_226)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu_update_edit_value$1449),0+((c:?_sprintf)+04h)
	movff	(_menu_update_edit_value$1449+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+0Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	call	_sprintf	;wreg free
	line	1243
	
l14373:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@from))^00h,c
	clrf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1245
	
l14375:
	movlb	3	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u19061
	goto	u19060
u19061:
	goto	l14385
u19060:
	line	1248
	
l14377:; BSR set to: 3

	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u19071
	goto	u19070
u19071:
	goto	l900
u19070:
	line	1249
	
l14379:; BSR set to: 3

	decf	(0+(_menu+08h))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@blink_pos))&0ffh
	goto	l14381
	line	1250
	
l900:; BSR set to: 3

	line	1251
	movff	0+(_menu+08h),(menu_update_edit_value@blink_pos)
	line	1253
	
l14381:
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
	goto	u19081
	goto	u19080

u19081:
	goto	l14385
u19080:
	line	1254
	
l14383:; BSR set to: 0

	movf	((menu_update_edit_value@blink_pos))&0ffh,w
	addlw	low(menu_update_edit_value@display_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1258
	
l14385:
	movlb	3	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u19091
	goto	u19090
u19091:
	goto	l14389
u19090:
	
l14387:; BSR set to: 3

	movlw	high(0Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1453+1))&0ffh
	movlw	low(0Dh)
	movwf	((_menu_update_edit_value$1453))&0ffh
	goto	l14391
	
l14389:; BSR set to: 3

	movlw	high(0Eh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1453+1))&0ffh
	movlw	low(0Eh)
	movwf	((_menu_update_edit_value$1453))&0ffh
	
l14391:; BSR set to: 0

	movff	(_menu_update_edit_value$1453),(menu_update_edit_value@start_col)
	line	1259
	
l14393:; BSR set to: 0

	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	1260
	
l14395:
		movlw	low(STR_227)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_227)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1262
	
l14397:
	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	movlb	0	; () banked
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	1263
	
l14399:
		movlw	low(STR_228)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_228)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1264
	
l14401:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1265
	
l14403:
		movlw	low(STR_229)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_229)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1266
	
l890:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_edit_value
	__end_of_menu_update_edit_value:
	signat	_menu_update_edit_value,89
	global	_menu_init

;; *************** function _menu_init *****************
;; Defined at:
;;		line 893 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/2
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
	line	893
global __ptext11
__ptext11:
psect	text11
	file	"src\menu.c"
	line	893
	
_menu_init:
;incstack = 0
	callstack 28
	line	895
	
l13837:
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	896
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	897
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	898
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	899
	movlw	low(0)
	movwf	(0+(_menu+05h))&0ffh
	line	900
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	901
	
l737:; BSR set to: 3

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_init
	__end_of_menu_init:
	signat	_menu_init,89
	global	_menu_handle_encoder

;; *************** function _menu_handle_encoder *****************
;; Defined at:
;;		line 1895 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  delta           2   87[COMRAM] int 
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
;;      Temps:          0       6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       6     164       0       0       0       0       0       0       0       0       0       0       0       0       0       0
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
;;		_menu_draw_utility
;;		_menu_update_time_value
;;		_sprintf
;;		_strcpy
;;		_uart_println
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2,group=0
	line	1895
global __ptext12
__ptext12:
psect	text12
	file	"src\menu.c"
	line	1895
	
_menu_handle_encoder:; BSR set to: 3

;incstack = 0
	callstack 22
	line	1900
	
l14029:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u18321
	goto	u18320
u18321:
	goto	l14151
u18320:
	line	1902
	
l14031:; BSR set to: 3

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u18331
	goto	u18330

u18331:
	goto	l1169
u18330:
	line	1905
	
l14033:; BSR set to: 3

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18341
	goto	u18340

u18341:
	goto	l14095
u18340:
	line	1908
	
l14035:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_305)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_305)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(c:menu_handle_encoder@delta),0+((c:?_sprintf)+06h)
	movff	(c:menu_handle_encoder@delta+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1909
	
l14037:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1912
	
l14039:
		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18351
	goto	u18350

u18351:
	goto	l14045
u18350:
	line	1915
	
l14041:; BSR set to: 3

	movf	((c:menu_handle_encoder@delta))^00h,c,w
	
	call	_handle_time_rotation
	line	1916
	call	_menu_update_time_value	;wreg free
	goto	l1169
	line	1917
	
l14043:
	goto	l1169
	line	1920
	
l14045:; BSR set to: 3

		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1921
		movlw	low(0)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1923
	
l14047:; BSR set to: 1

	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18361
	goto	u18360
u18361:
	goto	l14051
u18360:
	line	1925
	
l14049:; BSR set to: 3

		movlw	low(_menu_item_options)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1926
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1927
	goto	l1171
	line	1928
	
l14051:; BSR set to: 3

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18371
	goto	u18370

u18371:
	goto	l14055
u18370:
	line	1930
	
l14053:; BSR set to: 3

		movlw	low(_menu_item_options+048h)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1931
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1932
	goto	l1171
	line	1933
	
l14055:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18381
	goto	u18380

u18381:
	goto	l1171
u18380:
	line	1935
	
l14057:; BSR set to: 3

		movlw	low(_menu_item_options+03Ch)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1936
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1939
	
l1171:
	movlb	1	; () banked
	movf	((menu_handle_encoder@clock_opts))&0ffh,w
iorwf	((menu_handle_encoder@clock_opts+1))&0ffh,w
	btfsc	status,2
	goto	u18391
	goto	u18390

u18391:
	goto	l1169
u18390:
	
l14059:; BSR set to: 1

	movf	((menu_handle_encoder@clock_flag))&0ffh,w
iorwf	((menu_handle_encoder@clock_flag+1))&0ffh,w
	btfsc	status,2
	goto	u18401
	goto	u18400

u18401:
	goto	l1169
u18400:
	line	1941
	
l14061:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_306)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_306)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	movf	((??_menu_handle_encoder+0+0))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1942
	
l14063:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1944
	
l14065:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18411
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u18410
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u18411
	goto	u18410

u18411:
	goto	l14073
u18410:
	line	1946
	
l14067:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	incf	indf2

	line	1947
	
l14069:
	movlw	01h
	movlb	1	; () banked
	addwf	((menu_handle_encoder@clock_opts))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	movlw	0
	movlb	1	; () banked
	addwfc	((menu_handle_encoder@clock_opts+1))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0+1)&0ffh
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
	goto	u18421
	goto	u18420

u18421:
	goto	l14081
u18420:
	line	1948
	
l14071:; BSR set to: 0

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	goto	l14081
	line	1950
	
l14073:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18430
	goto	u18431

u18431:
	goto	l14081
u18430:
	line	1952
	
l14075:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u18441
	goto	u18440
u18441:
	goto	l14079
u18440:
	line	1953
	
l14077:
	movlw	01h
	movlb	1	; () banked
	addwf	((menu_handle_encoder@clock_opts))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	movlw	0
	movlb	1	; () banked
	addwfc	((menu_handle_encoder@clock_opts+1))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0+1)&0ffh
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
	decf	(??_menu_handle_encoder+2+0)&0ffh,w
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movwf	indf2,c

	goto	l14081
	line	1955
	
l14079:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	decf	indf2

	line	1959
	
l14081:
	movlw	01h
	movlb	1	; () banked
	addwf	((menu_handle_encoder@clock_opts))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	movlw	0
	movlb	1	; () banked
	addwfc	((menu_handle_encoder@clock_opts+1))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0+1)&0ffh
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
	goto	u18451
	goto	u18450

u18451:
	goto	l14085
u18450:
	line	1960
	
l14083:; BSR set to: 0

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	line	1962
	
l14085:; BSR set to: 0

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_307)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_307)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	movf	((??_menu_handle_encoder+0+0))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_encoder+1+0)&0ffh
	movf	((??_menu_handle_encoder+1+0))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_encoder+2+0
	movff	prodh,??_menu_handle_encoder+2+0+1
	movf	(??_menu_handle_encoder+2+0)&0ffh,w
	movlb	1	; () banked
	addwf	((menu_handle_encoder@clock_opts))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+4+0)&0ffh
	movf	(??_menu_handle_encoder+2+1)&0ffh,w
	movlb	1	; () banked
	addwfc	((menu_handle_encoder@clock_opts+1))&0ffh,w
	movlb	0	; () banked
	movwf	1+(??_menu_handle_encoder+4+0)&0ffh
	movlw	02h
	addwf	(??_menu_handle_encoder+4+0)&0ffh
	movlw	0
	addwfc	(??_menu_handle_encoder+4+1)&0ffh
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
	line	1963
	
l14087:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1966
	
l14089:
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
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	movf	((??_menu_handle_encoder+0+0))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_encoder+1+0
	movff	prodh,??_menu_handle_encoder+1+0+1
	movf	(??_menu_handle_encoder+1+0)&0ffh,w
	movlb	1	; () banked
	addwf	((menu_handle_encoder@clock_opts))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+3+0)&0ffh
	movf	(??_menu_handle_encoder+1+1)&0ffh,w
	movlb	1	; () banked
	addwfc	((menu_handle_encoder@clock_opts+1))&0ffh,w
	movlb	0	; () banked
	movwf	1+(??_menu_handle_encoder+3+0)&0ffh
	movlw	02h
	addwf	(??_menu_handle_encoder+3+0)&0ffh
	movlw	0
	addwfc	(??_menu_handle_encoder+3+1)&0ffh
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
	line	1967
	
l14091:
	call	_menu_draw_clock	;wreg free
	goto	l1169
	line	1974
	
l14095:; BSR set to: 2

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
	line	1975
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
	line	1978
	
l14097:; BSR set to: 1

	movff	(menu_handle_encoder@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_option_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u18461
	goto	u18460
u18461:
	goto	l14129
u18460:
	line	1980
	
l14099:
	movff	(menu_handle_encoder@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_encoder@edit_flag)
	movff	1+?_get_option_edit_flag,(menu_handle_encoder@edit_flag+1)
	line	1981
	movff	(menu_handle_encoder@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_encoder@opts)
	movff	1+?_get_item_options_for_field,(menu_handle_encoder@opts+1)
	line	1983
	
l14101:
	movlb	1	; () banked
	movf	((menu_handle_encoder@edit_flag))&0ffh,w
iorwf	((menu_handle_encoder@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u18471
	goto	u18470

u18471:
	goto	l1169
u18470:
	
l14103:; BSR set to: 1

	movf	((menu_handle_encoder@opts))&0ffh,w
iorwf	((menu_handle_encoder@opts+1))&0ffh,w
	btfsc	status,2
	goto	u18481
	goto	u18480

u18481:
	goto	l1169
u18480:
	line	1985
	
l14105:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18491
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u18490
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u18491
	goto	u18490

u18491:
	goto	l14113
u18490:
	line	1987
	
l14107:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	incf	indf2

	line	1988
	
l14109:; BSR set to: 1

	movlw	01h
	addwf	((menu_handle_encoder@opts))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	movlw	0
	movlb	1	; () banked
	addwfc	((menu_handle_encoder@opts+1))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0+1)&0ffh
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
	goto	u18501
	goto	u18500

u18501:
	goto	l14121
u18500:
	line	1989
	
l14111:; BSR set to: 0

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	goto	l14121
	line	1991
	
l14113:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18510
	goto	u18511

u18511:
	goto	l14121
u18510:
	line	1993
	
l14115:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u18521
	goto	u18520
u18521:
	goto	l14119
u18520:
	line	1994
	
l14117:; BSR set to: 1

	movlw	01h
	addwf	((menu_handle_encoder@opts))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	movlw	0
	movlb	1	; () banked
	addwfc	((menu_handle_encoder@opts+1))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0+1)&0ffh
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
	decf	(??_menu_handle_encoder+2+0)&0ffh,w
	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	movwf	indf2,c

	goto	l14121
	line	1996
	
l14119:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	decf	indf2

	line	2000
	
l14121:
	movlw	01h
	movlb	1	; () banked
	addwf	((menu_handle_encoder@opts))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	movlw	0
	movlb	1	; () banked
	addwfc	((menu_handle_encoder@opts+1))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0+1)&0ffh
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
	goto	u18531
	goto	u18530

u18531:
	goto	l14125
u18530:
	line	2001
	
l14123:; BSR set to: 0

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	line	2004
	
l14125:; BSR set to: 0

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18541
	goto	u18540

u18541:
	goto	l14043
u18540:
	line	2006
	
l14127:; BSR set to: 2

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
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	movf	((??_menu_handle_encoder+0+0))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_encoder+1+0
	movff	prodh,??_menu_handle_encoder+1+0+1
	movf	(??_menu_handle_encoder+1+0)&0ffh,w
	movlb	1	; () banked
	addwf	((menu_handle_encoder@opts))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+3+0)&0ffh
	movf	(??_menu_handle_encoder+1+1)&0ffh,w
	movlb	1	; () banked
	addwfc	((menu_handle_encoder@opts+1))&0ffh,w
	movlb	0	; () banked
	movwf	1+(??_menu_handle_encoder+3+0)&0ffh
	movlw	02h
	addwf	(??_menu_handle_encoder+3+0)&0ffh
	movlw	0
	addwfc	(??_menu_handle_encoder+3+1)&0ffh
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
	line	2007
	call	_menu_draw_input	;wreg free
	goto	l1169
	line	2011
	
l14129:
	movff	(menu_handle_encoder@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u18551
	goto	u18550
u18551:
	goto	l14139
u18550:
	line	2013
	
l14131:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18560
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u18561
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u18561
	goto	u18560

u18561:
	goto	l14135
u18560:
	
l14133:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1664))&0ffh
	setf	((_menu_handle_encoder$1664+1))&0ffh
	goto	l14137
	
l14135:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1664+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1664))&0ffh
	
l14137:; BSR set to: 1

	movf	((_menu_handle_encoder$1664))&0ffh,w
	
	call	_handle_numeric_rotation
	line	2014
	goto	l1169
	line	2015
	
l14139:
	movff	(menu_handle_encoder@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_time_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u18571
	goto	u18570
u18571:
	goto	l14043
u18570:
	line	2017
	
l14141:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18580
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u18581
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u18581
	goto	u18580

u18581:
	goto	l14145
u18580:
	
l14143:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1665))&0ffh
	setf	((_menu_handle_encoder$1665+1))&0ffh
	goto	l14147
	
l14145:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1665+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1665))&0ffh
	
l14147:; BSR set to: 1

	movf	((_menu_handle_encoder$1665))&0ffh,w
	
	call	_handle_time_rotation
	goto	l1169
	line	2024
	
l14151:; BSR set to: 3

		movlw	4
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18591
	goto	u18590

u18591:
	goto	l14177
u18590:
	
l14153:; BSR set to: 2

	movlb	3	; () banked
	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u18601
	goto	u18600
u18601:
	goto	l14177
u18600:
	
l14155:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u18611
	goto	u18610
u18611:
	goto	l14177
u18610:
	
l14157:; BSR set to: 3

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u18621
	goto	u18620

u18621:
	goto	l14177
u18620:
	line	2026
	
l14159:; BSR set to: 3

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18631
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u18630
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u18631
	goto	u18630

u18631:
	goto	l14167
u18630:
	line	2028
	
l14161:; BSR set to: 3

	incf	(0+(_menu+01Ch))&0ffh
	line	2029
	
l14163:; BSR set to: 3

		movlw	03h-1
	cpfsgt	(0+(_menu+01Ch))&0ffh
	goto	u18641
	goto	u18640

u18641:
	goto	l14173
u18640:
	line	2030
	
l14165:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01Ch))&0ffh
	goto	l14173
	line	2034
	
l14167:; BSR set to: 3

	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u18651
	goto	u18650
u18651:
	goto	l14171
u18650:
	line	2035
	
l14169:; BSR set to: 3

	movlw	low(02h)
	movwf	(0+(_menu+01Ch))&0ffh
	goto	l14173
	line	2037
	
l14171:; BSR set to: 3

	decf	(0+(_menu+01Ch))&0ffh
	line	2039
	
l14173:
	call	_menu_draw_utility	;wreg free
	goto	l1169
	line	2044
	
l14177:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18661
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u18660
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u18661
	goto	u18660

u18661:
	goto	l14195
u18660:
	line	2048
	
l14179:
		movlw	low(menu_handle_encoder@buf_1667)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1667)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_308)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_308)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	2049
	
l14181:
		movlw	low(menu_handle_encoder@buf_1667)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1667)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2052
	
l14183:
	movlw	low(-1)
	movlb	3	; () banked
	addwf	(0+(_menu+02h))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	clrf	1+(??_menu_handle_encoder+0+0)&0ffh
	movlw	high(-1)
	addwfc	1+(??_menu_handle_encoder+0+0)&0ffh
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+2+0)&0ffh
	clrf	(??_menu_handle_encoder+2+0+1)&0ffh

		movf	(??_menu_handle_encoder+0+0)&0ffh,w
	subwf	(??_menu_handle_encoder+2+0)&0ffh,w
	movf	(??_menu_handle_encoder+2+1)&0ffh,w
	xorlw	80h
	movwf	(??_menu_handle_encoder+4+0)&0ffh
	movf	(??_menu_handle_encoder+0+1)&0ffh,w
	xorlw	80h
	subwfb	(??_menu_handle_encoder+4+0)&0ffh,w
	btfsc	status,0
	goto	u18671
	goto	u18670

u18671:
	goto	l14191
u18670:
	line	2054
	
l14185:; BSR set to: 0

	movlb	3	; () banked
	incf	((_menu))&0ffh
	line	2057
	
l14187:; BSR set to: 3

	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	clrf	(??_menu_handle_encoder+0+0+1)&0ffh

	movlw	03h
	addwf	(??_menu_handle_encoder+0+0)&0ffh
	movlw	0
	addwfc	(??_menu_handle_encoder+0+1)&0ffh
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+2+0)&0ffh
	clrf	(??_menu_handle_encoder+2+0+1)&0ffh

		movf	(??_menu_handle_encoder+0+0)&0ffh,w
	subwf	(??_menu_handle_encoder+2+0)&0ffh,w
	movf	(??_menu_handle_encoder+2+1)&0ffh,w
	xorlw	80h
	movwf	(??_menu_handle_encoder+4+0)&0ffh
	movf	(??_menu_handle_encoder+0+1)&0ffh,w
	xorlw	80h
	subwfb	(??_menu_handle_encoder+4+0)&0ffh,w
	btfss	status,0
	goto	u18681
	goto	u18680

u18681:
	goto	l14191
u18680:
	line	2059
	
l14189:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+01h))&0ffh
	line	2063
	
l14191:
		movlw	low(menu_handle_encoder@buf_1667)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1667)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_309)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_309)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2064
	
l14193:
		movlw	low(menu_handle_encoder@buf_1667)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1667)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2065
	goto	l14213
	line	2066
	
l14195:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18690
	goto	u18691

u18691:
	goto	l14213
u18690:
	line	2070
	
l14197:
		movlw	low(menu_handle_encoder@buf_1670)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1670)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_310)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_310)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	2071
	
l14199:
		movlw	low(menu_handle_encoder@buf_1670)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1670)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2074
	
l14201:
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u18701
	goto	u18700
u18701:
	goto	l14209
u18700:
	line	2076
	
l14203:; BSR set to: 3

	decf	((_menu))&0ffh
	line	2079
	
l14205:; BSR set to: 3

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u18711
	goto	u18710

u18711:
	goto	l14209
u18710:
	line	2081
	
l14207:; BSR set to: 3

	decf	(0+(_menu+01h))&0ffh
	line	2085
	
l14209:; BSR set to: 3

		movlw	low(menu_handle_encoder@buf_1670)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1670)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_311)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_311)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2086
	
l14211:
		movlw	low(menu_handle_encoder@buf_1670)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1670)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2090
	
l14213:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u18721
	goto	u18720
u18721:
	goto	l1169
u18720:
	line	2092
	
l14215:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18731
	goto	u18730
u18731:
	goto	l14219
u18730:
	line	2093
	
l14217:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	goto	l1169
	line	2094
	
l14219:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18741
	goto	u18740

u18741:
	goto	l14223
u18740:
	line	2095
	
l14221:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	goto	l1169
	line	2096
	
l14223:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18751
	goto	u18750

u18751:
	goto	l14227
u18750:
	line	2097
	
l14225:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	goto	l1169
	line	2098
	
l14227:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18761
	goto	u18760

u18761:
	goto	l14231
u18760:
	goto	l14091
	line	2100
	
l14231:; BSR set to: 2

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18771
	goto	u18770

u18771:
	goto	l14043
u18770:
	goto	l14173
	line	2103
	
l1169:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_encoder
	__end_of_menu_handle_encoder:
	signat	_menu_handle_encoder,4217
	global	_handle_time_rotation

;; *************** function _handle_time_rotation *****************
;; Defined at:
;;		line 474 in file "src\menu.c"
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
;;		On entry : 3C/2
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
	line	474
global __ptext13
__ptext13:
psect	text13
	file	"src\menu.c"
	line	474
	
_handle_time_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_time_rotation@direction))&0ffh
	line	476
	
l12573:
		movlw	low(STR_142)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_142)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	480
	
l12575:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_143)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_143)
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
	line	481
	
l12577:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	483
	
l12579:
	movlb	3	; () banked
	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u16621
	goto	u16620
u16621:
	goto	l12621
u16620:
	line	485
	
l12581:; BSR set to: 3

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u16631
	goto	u16630

u16631:
	goto	l12603
u16630:
	line	487
	
l12583:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+012h))&0ffh
	line	489
	
l12585:; BSR set to: 3

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16641
	goto	u16640

u16641:
	goto	l12593
u16640:
	
l12587:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16651
	goto	u16650

u16651:
	goto	l12593
u16650:
	
l12589:; BSR set to: 3

		movlw	03h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u16661
	goto	u16660

u16661:
	goto	l12593
u16660:
	line	490
	
l12591:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+012h))&0ffh
	goto	l12647
	line	491
	
l12593:
		movlw	2
	movlb	3	; () banked
	xorwf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u16671
	goto	u16670

u16671:
	goto	l12599
u16670:
	
l12595:; BSR set to: 3

		movlw	018h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u16681
	goto	u16680

u16681:
	goto	l12599
u16680:
	goto	l12591
	line	493
	
l12599:; BSR set to: 3

		movlw	064h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u16691
	goto	u16690

u16691:
	goto	l620
u16690:
	goto	l12591
	line	498
	
l12603:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u16701
	goto	u16700
u16701:
	goto	l12619
u16700:
	line	501
	
l12605:; BSR set to: 3

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16711
	goto	u16710

u16711:
	goto	l12611
u16710:
	
l12607:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16721
	goto	u16720

u16721:
	goto	l12611
u16720:
	line	502
	
l12609:; BSR set to: 3

	movlw	low(02h)
	movwf	(0+(_menu+012h))&0ffh
	goto	l12647
	line	504
	
l12611:
		movlw	2
	movlb	3	; () banked
	xorwf	(0+(_menu+010h))&0ffh,w
	btfsc	status,2
	goto	u16731
	goto	u16730

u16731:
	goto	l12615
u16730:
	
l12613:; BSR set to: 3

	movlw	high(063h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1270+1))&0ffh
	movlw	low(063h)
	movwf	((_handle_time_rotation$1270))&0ffh
	goto	l12617
	
l12615:; BSR set to: 3

	movlw	high(017h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1270+1))&0ffh
	movlw	low(017h)
	movwf	((_handle_time_rotation$1270))&0ffh
	
l12617:; BSR set to: 0

	movff	(_handle_time_rotation$1270),0+(_menu+012h)
	goto	l12647
	line	508
	
l12619:; BSR set to: 3

	decf	(0+(_menu+012h))&0ffh
	goto	l12647
	line	510
	
l620:; BSR set to: 3

	line	511
	goto	l12647
	line	512
	
l12621:; BSR set to: 3

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u16741
	goto	u16740

u16741:
	goto	l12647
u16740:
	line	515
	
l12623:; BSR set to: 3

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16751
	goto	u16750

u16751:
	goto	l12633
u16750:
	
l12625:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16761
	goto	u16760

u16761:
	goto	l12633
u16760:
	
l12627:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u16771
	goto	u16770

u16771:
	goto	l12633
u16770:
	line	518
	
l12629:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l632
	line	522
	
l12633:
	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u16781
	goto	u16780

u16781:
	goto	l12641
u16780:
	line	524
	
l12635:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+013h))&0ffh
	line	525
	
l12637:; BSR set to: 3

		movlw	03Ch-1
	cpfsgt	(0+(_menu+013h))&0ffh
	goto	u16791
	goto	u16790

u16791:
	goto	l12647
u16790:
	line	526
	
l12639:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l12647
	line	530
	
l12641:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	btfss	status,2
	goto	u16801
	goto	u16800
u16801:
	goto	l12645
u16800:
	line	531
	
l12643:; BSR set to: 3

	movlw	low(03Bh)
	movwf	(0+(_menu+013h))&0ffh
	goto	l12647
	line	533
	
l12645:; BSR set to: 3

	decf	(0+(_menu+013h))&0ffh
	line	537
	
l12647:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_144)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_144)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	538
	
l12649:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	539
	
l632:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_time_rotation
	__end_of_handle_time_rotation:
	signat	_handle_time_rotation,4217
	global	_handle_numeric_rotation

;; *************** function _handle_numeric_rotation *****************
;; Defined at:
;;		line 1121 in file "src\menu.c"
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
;;		On entry : 3C/2
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
	line	1121
global __ptext14
__ptext14:
psect	text14
	file	"src\menu.c"
	line	1121
	
_handle_numeric_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_numeric_rotation@direction))&0ffh
	line	1123
	
l12471:
		movlw	low(STR_223)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_223)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1126
	
l12473:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_224)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_224)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+08h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Fh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1127
	
l12475:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1130
	
l12477:
	movlb	3	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u16381
	goto	u16380
u16381:
	goto	l12571
u16380:
	
l12479:; BSR set to: 3

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u16391
	goto	u16390
u16391:
	goto	l12571
u16390:
	line	1132
	
l12481:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+08h))&0ffh
	goto	l12571
	line	1138
	
l12483:; BSR set to: 3

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u16401
	goto	u16400
u16401:
	goto	l882
u16400:
	
l12485:; BSR set to: 3

	movlb	0	; () banked
	movf	((handle_numeric_rotation@direction))&0ffh,w
	btfsc	status,2
	goto	u16411
	goto	u16410
u16411:
	goto	l882
u16410:
	line	1140
	
l12487:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u16421
	goto	u16420
u16421:
	movlw	1
	goto	u16430
u16420:
	movlw	0
u16430:
	movwf	(0+(_menu+09h))&0ffh
	goto	l882
	line	1145
	
l12489:; BSR set to: 3

	movlb	0	; () banked
		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u16441
	goto	u16440

u16441:
	goto	l12497
u16440:
	line	1147
	
l12491:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+0Ah))&0ffh
	line	1148
	
l12493:; BSR set to: 3

		movlw	06h-1
	cpfsgt	(0+(_menu+0Ah))&0ffh
	goto	u16451
	goto	u16450

u16451:
	goto	l882
u16450:
	line	1149
	
l12495:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l882
	line	1151
	
l12497:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u16460
	goto	u16461

u16461:
	goto	l882
u16460:
	line	1153
	
l12499:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u16471
	goto	u16470
u16471:
	goto	l12503
u16470:
	line	1154
	
l12501:; BSR set to: 3

	movlw	low(05h)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l882
	line	1156
	
l12503:; BSR set to: 3

	decf	(0+(_menu+0Ah))&0ffh
	goto	l882
	line	1162
	
l12505:; BSR set to: 3

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u16481
	goto	u16480

u16481:
	goto	l12509
u16480:
	
l12507:; BSR set to: 3

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1438+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1438))&0ffh
	goto	l12511
	
l12509:; BSR set to: 3

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1438+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1438))&0ffh
	
l12511:; BSR set to: 0

	movff	(_handle_numeric_rotation$1438),(handle_numeric_rotation@max_tens)
	line	1163
	
l12513:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u16491
	goto	u16490

u16491:
	goto	l12525
u16490:
	line	1165
	
l12515:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u16501
	goto	u16500
u16501:
	goto	l12519
u16500:
	goto	l882
	line	1167
	
l12519:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+0Bh))&0ffh
	line	1168
	
l12521:; BSR set to: 3

		movf	(0+(_menu+0Bh))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfsc	status,0
	goto	u16511
	goto	u16510

u16511:
	goto	l882
u16510:
	line	1169
	
l12523:; BSR set to: 0

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	goto	l882
	line	1171
	
l12525:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u16520
	goto	u16521

u16521:
	goto	l882
u16520:
	line	1173
	
l12527:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u16531
	goto	u16530
u16531:
	goto	l12531
u16530:
	goto	l882
	line	1175
	
l12531:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+0Bh))&0ffh,w
	btfss	status,2
	goto	u16541
	goto	u16540
u16541:
	goto	l12535
u16540:
	line	1176
	
l12533:; BSR set to: 3

	movff	(handle_numeric_rotation@max_tens),0+(_menu+0Bh)
	goto	l882
	line	1178
	
l12535:; BSR set to: 3

	decf	(0+(_menu+0Bh))&0ffh
	goto	l882
	line	1185
	
l12537:; BSR set to: 3

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u16551
	goto	u16550

u16551:
	goto	l12541
u16550:
	
l12539:; BSR set to: 3

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1440+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1440))&0ffh
	goto	l12543
	
l12541:; BSR set to: 3

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1440+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1440))&0ffh
	
l12543:; BSR set to: 0

	movff	(_handle_numeric_rotation$1440),(handle_numeric_rotation@max_units)
	line	1186
	
l12545:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u16561
	goto	u16560

u16561:
	goto	l12557
u16560:
	line	1188
	
l12547:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u16571
	goto	u16570
u16571:
	goto	l12551
u16570:
	goto	l882
	line	1190
	
l12551:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+0Ch))&0ffh
	line	1191
	
l12553:; BSR set to: 3

		movf	(0+(_menu+0Ch))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_units))&0ffh,w
	btfsc	status,0
	goto	u16581
	goto	u16580

u16581:
	goto	l882
u16580:
	line	1192
	
l12555:; BSR set to: 0

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	goto	l882
	line	1194
	
l12557:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u16590
	goto	u16591

u16591:
	goto	l882
u16590:
	line	1196
	
l12559:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u16601
	goto	u16600
u16601:
	goto	l12563
u16600:
	goto	l882
	line	1198
	
l12563:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+0Ch))&0ffh,w
	btfss	status,2
	goto	u16611
	goto	u16610
u16611:
	goto	l12567
u16610:
	line	1199
	
l12565:; BSR set to: 3

	movff	(handle_numeric_rotation@max_units),0+(_menu+0Ch)
	goto	l882
	line	1201
	
l12567:; BSR set to: 3

	decf	(0+(_menu+0Ch))&0ffh
	goto	l882
	line	1135
	
l12571:; BSR set to: 3

	movf	(0+(_menu+08h))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l12483
	xorlw	1^0	; case 1
	skipnz
	goto	l12489
	xorlw	2^1	; case 2
	skipnz
	goto	l12505
	xorlw	3^2	; case 3
	skipnz
	goto	l12537
	goto	l882

	line	1206
	
l882:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_numeric_rotation
	__end_of_handle_numeric_rotation:
	signat	_handle_numeric_rotation,4217
	global	_menu_handle_button

;; *************** function _menu_handle_button *****************
;; Defined at:
;;		line 2109 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  press_type      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  press_type      1  255[BANK1 ] unsigned char 
;;  i               1  252[BANK1 ] unsigned char 
;;  opts            2  250[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  edit_flag       2  121[BANK0 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> NULL(0), sensor_edit_flag(1), enable_edit_flag(1), 
;;  buf            50   50[BANK1 ] unsigned char [50]
;;  current_val     2  123[BANK0 ] unsigned int 
;;  current_val     2  125[BANK0 ] int 
;;  new_value       2  253[BANK1 ] unsigned int 
;;  sensor_type     1    8[BANK2 ] unsigned char 
;;  flow_type       1    6[BANK2 ] unsigned char 
;;  new_value       2   10[BANK2 ] int 
;;  new_seconds     2    4[BANK2 ] unsigned int 
;;  buf            50  100[BANK1 ] unsigned char [50]
;;  buf            50    0[BANK1 ] unsigned char [50]
;;  opts            2  119[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  edit_flag       2  117[BANK0 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> NULL(0), sensor_edit_flag(1), enable_edit_flag(1), 
;;  buf            50  200[BANK1 ] unsigned char [50]
;;  edit_flag       2    2[BANK2 ] PTR unsigned char 
;;		 -> display_edit_flag(1), relay_high_edit_flag(1), NULL(0), enable_edit_flag(1), 
;;  opts            2    0[BANK2 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  buf            50  150[BANK1 ] unsigned char [50]
;;  sensor_type     1    9[BANK2 ] unsigned char 
;;  flow_type       1    7[BANK2 ] unsigned char 
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
;;      Locals:         0      12     256      12       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0      17     256      12       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      285 bytes
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
;;		_menu_draw_utility
;;		_menu_update_time_value
;;		_rebuild_clock_menu
;;		_rebuild_input_menu
;;		_rebuild_utility_menu
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
	line	2109
global __ptext15
__ptext15:
psect	text15
	file	"src\menu.c"
	line	2109
	
_menu_handle_button:
;incstack = 0
	callstack 22
	movlb	1	; () banked
	movwf	((menu_handle_button@press_type))&0ffh
	line	2114
	
l14405:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u19101
	goto	u19100
u19101:
	goto	l14777
u19100:
	line	2116
	
l14407:; BSR set to: 3

	movlb	1	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u19111
	goto	u19110

u19111:
	goto	l14767
u19110:
	line	2119
	
l14409:; BSR set to: 1

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19121
	goto	u19120

u19121:
	goto	l14511
u19120:
	line	2124
	
l14411:; BSR set to: 2

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_312)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_312)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2125
	
l14413:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2128
	
l14415:
		movlw	low(0)
	movlb	2	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2129
	
l14417:; BSR set to: 2

		movlw	low(0)
	movwf	((menu_handle_button@edit_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@edit_flag+1))&0ffh

	line	2131
	
l14419:; BSR set to: 2

	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19131
	goto	u19130
u19131:
	goto	l14429
u19130:
	line	2133
	
l14421:; BSR set to: 3

		movlw	low(_menu_item_options)
	movlb	2	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2134
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2135
	
l14423:; BSR set to: 2

	movff	(c:_enable_edit_flag),(_system_config)
	line	2136
	
l14425:; BSR set to: 2

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_313)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_313)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2137
	
l14427:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2138
	goto	l1240
	line	2139
	
l14429:; BSR set to: 3

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19141
	goto	u19140

u19141:
	goto	l14439
u19140:
	line	2141
	
l14431:; BSR set to: 3

		movlw	low(_menu_item_options+048h)
	movlb	2	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2142
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2143
	
l14433:; BSR set to: 2

	movff	(c:_relay_high_edit_flag),0+(_system_config+06h)
	line	2144
	
l14435:; BSR set to: 2

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_314)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_314)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+06h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	goto	l14427
	line	2147
	
l14439:; BSR set to: 3

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19151
	goto	u19150

u19151:
	goto	l14489
u19150:
	line	2150
	
l14441:; BSR set to: 3

	incf	(0+(_menu+011h))&0ffh
	line	2151
	
l14443:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2154
	
l14445:; BSR set to: 3

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u19161
	goto	u19160

u19161:
	goto	l14451
u19160:
	
l14447:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u19171
	goto	u19170

u19171:
	goto	l14451
u19170:
	line	2156
	
l14449:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	line	2159
	
l14451:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2161
	
l14453:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_315)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_315)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2162
	
l14455:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2165
	
l14457:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_316)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_316)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2166
	
l14459:
	call	_menu_draw_clock	;wreg free
	line	2168
	
l14461:
		movlw	02h-1
	movlb	3	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u19181
	goto	u19180

u19181:
	goto	l1251
u19180:
	line	2171
	
l14463:; BSR set to: 3

	movf	(0+(_menu+012h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+(_menu+013h))&0ffh,w
	movlb	0	; () banked
	addwf	(??_menu_handle_button+0+0)&0ffh,w
	movlb	1	; () banked
	movwf	((menu_handle_button@new_value))&0ffh
	movlb	3	; () banked
	movlw	0
	movlb	0	; () banked
	addwfc	(??_menu_handle_button+0+1)&0ffh,w
	movlb	1	; () banked
	movwf	1+((menu_handle_button@new_value))&0ffh
	line	2174
	
l14465:; BSR set to: 1

	movf	((menu_handle_button@new_value))&0ffh,w
iorwf	((menu_handle_button@new_value+1))&0ffh,w
	btfss	status,2
	goto	u19191
	goto	u19190

u19191:
	goto	l14469
u19190:
	line	2175
	
l14467:; BSR set to: 1

	movlw	high(01h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(01h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	2176
	
l14469:; BSR set to: 1

		movf	((menu_handle_button@new_value+1))&0ffh,w
	bnz	u19200
	movlw	121
	subwf	 ((menu_handle_button@new_value))&0ffh,w
	btfss	status,0
	goto	u19201
	goto	u19200

u19201:
	goto	l14473
u19200:
	line	2177
	
l14471:; BSR set to: 1

	movlw	high(078h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(078h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	2179
	
l14473:; BSR set to: 1

	movff	(menu_handle_button@new_value),0+(_system_config+07h)
	line	2182
	
l14475:; BSR set to: 1

		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_317)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_317)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(03Ch)
	movwf	((c:___lbdiv@divisor))^00h,c
	movlb	6	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbdiv
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movf	((??_menu_handle_button+0+0))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	6	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbmod
	movlb	0	; () banked
	movwf	(??_menu_handle_button+1+0)&0ffh
	movf	((??_menu_handle_button+1+0))&0ffh,w
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2183
	
l14477:
		movff	0+(_clock_menu+0Ch),(c:strcpy@to)
	movff	1+(_clock_menu+0Ch),(c:strcpy@to+1)

		movlw	low(_value_relay_pulse)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	2185
	
l14479:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_318)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_318)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+07h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2186
	
l14481:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2187
	movlw	low(01h)
	movlb	3	; () banked
	movwf	((_save_pending))&0ffh
	line	2188
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	2189
	
l14483:; BSR set to: 3

	call	_menu_draw_clock	;wreg free
	line	2193
	
l14485:
	movlw	(0)&0ffh
	
	call	_trigger_relay_pulse
	line	2194
	goto	l1251
	line	2195
	
l1245:
	line	2197
	goto	l1251
	line	2202
	
l14489:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19211
	goto	u19210

u19211:
	goto	l1240
u19210:
	line	2204
	
l14491:; BSR set to: 3

		movlw	low(_menu_item_options+03Ch)
	movlb	2	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2205
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2209
	
l1240:
	movlb	2	; () banked
	movf	((menu_handle_button@opts))&0ffh,w
iorwf	((menu_handle_button@opts+1))&0ffh,w
	btfsc	status,2
	goto	u19221
	goto	u19220

u19221:
	goto	l14505
u19220:
	
l14493:; BSR set to: 2

	movf	((menu_handle_button@edit_flag))&0ffh,w
iorwf	((menu_handle_button@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u19231
	goto	u19230

u19231:
	goto	l14505
u19230:
	
l14495:; BSR set to: 2

	movff	(menu_handle_button@edit_flag),fsr2l
	movff	(menu_handle_button@edit_flag+1),fsr2h
	movf	indf2,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	01h
	movlb	2	; () banked
	addwf	((menu_handle_button@opts))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+1+0)&0ffh
	movlw	0
	movlb	2	; () banked
	addwfc	((menu_handle_button@opts+1))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+1+0+1)&0ffh
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
	subwf	((??_menu_handle_button+0+0))&0ffh,w
	btfsc	status,0
	goto	u19241
	goto	u19240
u19241:
	goto	l14505
u19240:
	line	2211
	
l14497:; BSR set to: 0

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
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movf	((??_menu_handle_button+0+0))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_button+1+0
	movff	prodh,??_menu_handle_button+1+0+1
	movf	(??_menu_handle_button+1+0)&0ffh,w
	movlb	2	; () banked
	addwf	((menu_handle_button@opts))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+3+0)&0ffh
	movf	(??_menu_handle_button+1+1)&0ffh,w
	movlb	2	; () banked
	addwfc	((menu_handle_button@opts+1))&0ffh,w
	movlb	0	; () banked
	movwf	1+(??_menu_handle_button+3+0)&0ffh
	movlw	02h
	addwf	(??_menu_handle_button+3+0)&0ffh
	movlw	0
	addwfc	(??_menu_handle_button+3+1)&0ffh
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
	line	2212
	
l14499:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	((_save_pending))&0ffh
	line	2213
	
l14501:; BSR set to: 3

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_319)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_319)
	movwf	((c:sprintf@f+1))^00h,c

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
	line	2214
	
l14503:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2217
	
l14505:
	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2218
	
l14507:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1251
	line	2223
	
l14511:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((menu_handle_button@sensor_type))&0ffh
	line	2224
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((menu_handle_button@flow_type))&0ffh
	line	2227
	
l14513:; BSR set to: 2

	movff	(menu_handle_button@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_option_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u19251
	goto	u19250
u19251:
	goto	l14617
u19250:
	line	2229
	
l14515:
	movff	(menu_handle_button@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1697)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1697+1)
	line	2230
	movff	(menu_handle_button@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1698)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1698+1)
	line	2232
	
l14517:
	movlb	0	; () banked
	movf	((menu_handle_button@edit_flag_1697))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1697+1))&0ffh,w
	btfsc	status,2
	goto	u19261
	goto	u19260

u19261:
	goto	l14505
u19260:
	
l14519:; BSR set to: 0

	movf	((menu_handle_button@opts_1698))&0ffh,w
iorwf	((menu_handle_button@opts_1698+1))&0ffh,w
	btfsc	status,2
	goto	u19271
	goto	u19270

u19271:
	goto	l14505
u19270:
	line	2235
	
l14521:; BSR set to: 0

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
	movff	(menu_handle_button@edit_flag_1697),fsr2l
	movff	(menu_handle_button@edit_flag_1697+1),fsr2h
	movf	indf2,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movf	((??_menu_handle_button+0+0))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_button+1+0
	movff	prodh,??_menu_handle_button+1+0+1
	movf	(??_menu_handle_button+1+0)&0ffh,w
	addwf	((menu_handle_button@opts_1698))&0ffh,w
	movwf	(??_menu_handle_button+3+0)&0ffh
	movf	(??_menu_handle_button+1+1)&0ffh,w
	addwfc	((menu_handle_button@opts_1698+1))&0ffh,w
	movwf	1+(??_menu_handle_button+3+0)&0ffh
	movlw	02h
	addwf	(??_menu_handle_button+3+0)&0ffh
	movlw	0
	addwfc	(??_menu_handle_button+3+1)&0ffh
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
	line	2238
	
l14523:
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19281
	goto	u19280
u19281:
	goto	l14527
u19280:
	line	2240
	
l14525:; BSR set to: 3

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

	line	2241
	goto	l14611
	line	2242
	
l14527:; BSR set to: 3

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19291
	goto	u19290

u19291:
	goto	l14539
u19290:
	line	2244
	
l14529:; BSR set to: 3

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

	line	2247
	
l14531:; BSR set to: 2

		movlw	2
	xorwf	((c:_sensor_edit_flag))^00h,c,w
	btfss	status,2
	goto	u19301
	goto	u19300

u19301:
	goto	l14537
u19300:
	
l14533:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfsc	status,2
	goto	u19311
	goto	u19310

u19311:
	goto	l14537
u19310:
	line	2249
	
l14535:; BSR set to: 2

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
	line	2253
	
l14537:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	2254
	goto	l14611
	line	2255
	
l14539:; BSR set to: 3

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19321
	goto	u19320

u19321:
	goto	l14547
u19320:
	
l14541:; BSR set to: 3

		movlw	2
	movlb	2	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19331
	goto	u19330

u19331:
	goto	l14547
u19330:
	line	2257
	
l14543:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_flow_type_edit_flag),indf2

	line	2260
	
l14545:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	2261
	goto	l14611
	line	2262
	
l14547:
		movlw	3
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19341
	goto	u19340

u19341:
	goto	l14555
u19340:
	
l14549:; BSR set to: 3

		movlw	2
	movlb	2	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19351
	goto	u19350

u19351:
	goto	l14555
u19350:
	
l14551:; BSR set to: 2

		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u19361
	goto	u19360

u19361:
	goto	l14555
u19360:
	goto	l14611
	line	2265
	
l14553:
	goto	l14611
	line	2266
	
l14555:
		movlw	3
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19371
	goto	u19370

u19371:
	goto	l14563
u19370:
	
l14557:; BSR set to: 3

		movlw	2
	movlb	2	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19381
	goto	u19380

u19381:
	goto	l14563
u19380:
	
l14559:; BSR set to: 2

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u19391
	goto	u19390
u19391:
	goto	l14563
u19390:
	line	2268
	
l14561:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_flow_units_edit_flag),indf2

	line	2269
	goto	l14611
	line	2270
	
l14563:
	movlb	2	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19401
	goto	u19400
u19401:
	goto	l14581
u19400:
	line	2272
	
l14565:; BSR set to: 2

		movlw	9
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19411
	goto	u19410

u19411:
	goto	l14569
u19410:
	line	2273
	
l14567:; BSR set to: 3

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

	goto	l14611
	line	2274
	
l14569:; BSR set to: 3

		movlw	10
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19421
	goto	u19420

u19421:
	goto	l14573
u19420:
	line	2275
	
l14571:; BSR set to: 3

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

	goto	l14611
	line	2276
	
l14573:; BSR set to: 3

		movlw	11
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19431
	goto	u19430

u19431:
	goto	l14577
u19430:
	line	2277
	
l14575:; BSR set to: 3

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

	goto	l14611
	line	2278
	
l14577:; BSR set to: 3

		movlw	12
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19441
	goto	u19440

u19441:
	goto	l14553
u19440:
	line	2279
	
l14579:; BSR set to: 3

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

	goto	l14611
	line	2281
	
l14581:; BSR set to: 2

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19451
	goto	u19450

u19451:
	goto	l14591
u19450:
	line	2283
	
l14583:; BSR set to: 2

		movlw	6
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19461
	goto	u19460

u19461:
	goto	l14587
u19460:
	goto	l14567
	line	2285
	
l14587:; BSR set to: 3

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19471
	goto	u19470

u19471:
	goto	l14553
u19470:
	goto	l14579
	line	2288
	
l14591:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19481
	goto	u19480

u19481:
	goto	l14553
u19480:
	line	2290
	
l14593:; BSR set to: 2

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u19491
	goto	u19490
u19491:
	goto	l14603
u19490:
	line	2292
	
l14595:; BSR set to: 2

		movlw	8
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19501
	goto	u19500

u19501:
	goto	l14599
u19500:
	line	2293
	
l14597:; BSR set to: 3

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

	goto	l14611
	line	2294
	
l14599:; BSR set to: 3

		movlw	9
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19511
	goto	u19510

u19511:
	goto	l14553
u19510:
	goto	l14579
	line	2299
	
l14603:; BSR set to: 2

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19521
	goto	u19520

u19521:
	goto	l14607
u19520:
	goto	l14597
	line	2301
	
l14607:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19531
	goto	u19530

u19531:
	goto	l14553
u19530:
	goto	l14579
	line	2306
	
l14611:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	((_save_pending))&0ffh
	goto	l14505
	line	2313
	
l14617:
	movff	(menu_handle_button@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_time_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u19541
	goto	u19540
u19541:
	goto	l14681
u19540:
	line	2315
	
l14619:
	movlb	3	; () banked
	incf	(0+(_menu+011h))&0ffh
	line	2316
	
l14621:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2317
	
l14623:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2320
	
l14625:
		movlw	low(menu_handle_button@buf_1703)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1703)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_320)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_320)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2321
	
l14627:
		movlw	low(menu_handle_button@buf_1703)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1703)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2323
	
l14629:
	call	_menu_update_time_value	;wreg free
	line	2325
	
l14631:
		movlw	02h-1
	movlb	3	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u19551
	goto	u19550

u19551:
	goto	l1251
u19550:
	line	2329
	
l14633:; BSR set to: 3

	movf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u19561
	goto	u19560
u19561:
	goto	l14637
u19560:
	line	2330
	
l14635:; BSR set to: 3

	movf	(0+(_menu+012h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+(_menu+013h))&0ffh,w
	movlb	0	; () banked
	addwf	(??_menu_handle_button+0+0)&0ffh,w
	movlb	2	; () banked
	movwf	((menu_handle_button@new_seconds))&0ffh
	movlb	3	; () banked
	movlw	0
	movlb	0	; () banked
	addwfc	(??_menu_handle_button+0+1)&0ffh,w
	movlb	2	; () banked
	movwf	1+((menu_handle_button@new_seconds))&0ffh
	goto	l14639
	line	2332
	
l14637:; BSR set to: 3

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
	movlb	0	; () banked
	addwf	(??_menu_handle_button+0+0)&0ffh,w
	movlb	2	; () banked
	movwf	((menu_handle_button@new_seconds))&0ffh
	movf	(1+?___wmul)^00h,c,w
	movlb	0	; () banked
	addwfc	(??_menu_handle_button+0+1)&0ffh,w
	movlb	2	; () banked
	movwf	1+((menu_handle_button@new_seconds))&0ffh
	line	2335
	
l14639:; BSR set to: 2

	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19571
	goto	u19570
u19571:
	goto	l14653
u19570:
	line	2337
	
l14641:; BSR set to: 2

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19581
	goto	u19580

u19581:
	goto	l14645
u19580:
	line	2338
	
l14643:; BSR set to: 3

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
	goto	l14673
	line	2339
	
l14645:; BSR set to: 3

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19591
	goto	u19590

u19591:
	goto	l14649
u19590:
	line	2340
	
l14647:; BSR set to: 3

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
	goto	l14673
	line	2341
	
l14649:; BSR set to: 3

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19601
	goto	u19600

u19601:
	goto	l1298
u19600:
	line	2342
	
l14651:; BSR set to: 3

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
	goto	l14673
	line	2343
	
l1298:; BSR set to: 3

	goto	l14673
	line	2344
	
l14653:; BSR set to: 2

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19611
	goto	u19610

u19611:
	goto	l14659
u19610:
	line	2346
	
l14655:; BSR set to: 2

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19621
	goto	u19620

u19621:
	goto	l14673
u19620:
	goto	l14643
	line	2349
	
l14659:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19631
	goto	u19630

u19631:
	goto	l14673
u19630:
	line	2351
	
l14661:; BSR set to: 2

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u19641
	goto	u19640
u19641:
	goto	l14667
u19640:
	
l14663:; BSR set to: 2

		movlw	7
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19651
	goto	u19650

u19651:
	goto	l14667
u19650:
	line	2352
	
l14665:; BSR set to: 3

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
	goto	l14673
	line	2353
	
l14667:
	movlb	2	; () banked
		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u19661
	goto	u19660

u19661:
	goto	l14673
u19660:
	
l14669:; BSR set to: 2

		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19671
	goto	u19670

u19671:
	goto	l14673
u19670:
	goto	l14665
	line	2359
	
l14673:
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
		movlw	low(STR_321)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_321)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2361
	
l14675:
	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2362
	
l14677:; BSR set to: 3

	movlw	low(01h)
	movwf	((_save_pending))&0ffh
	line	2363
	
l14679:; BSR set to: 3

		movlw	low(STR_322)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_322)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1251
	line	2367
	
l14681:
	movff	(menu_handle_button@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u19681
	goto	u19680
u19681:
	goto	l1245
u19680:
	line	2369
	
l14683:
	movlb	3	; () banked
	incf	(0+(_menu+08h))&0ffh
	line	2370
	
l14685:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2372
	
l14687:
		movlw	2
	movlb	3	; () banked
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u19691
	goto	u19690

u19691:
	goto	l14693
u19690:
	
l14689:; BSR set to: 3

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u19701
	goto	u19700

u19701:
	goto	l14693
u19700:
	line	2374
	
l14691:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+0Bh))&0ffh
	line	2375
	movlw	low(0)
	movwf	(0+(_menu+0Ch))&0ffh
	line	2378
	
l14693:; BSR set to: 3

		movlw	04h-1
	cpfsgt	(0+(_menu+08h))&0ffh
	goto	u19711
	goto	u19710

u19711:
	goto	l1245
u19710:
	line	2380
	
l14695:; BSR set to: 3

	call	_get_current_numeric_value	;wreg free
	movff	0+?_get_current_numeric_value,(menu_handle_button@new_value_1708)
	movff	1+?_get_current_numeric_value,(menu_handle_button@new_value_1708+1)
	line	2383
	
l14697:; BSR set to: 3

	movlb	2	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19721
	goto	u19720
u19721:
	goto	l14721
u19720:
	line	2385
	
l14699:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19731
	goto	u19730

u19731:
	goto	l14705
u19730:
	line	2387
	
l14701:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1708),postinc2
	movff	(menu_handle_button@new_value_1708+1),postdec2
	line	2388
	
l14703:; BSR set to: 2

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_323)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_323)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1708),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1708+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2389
	goto	l14763
	line	2390
	
l14705:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19741
	goto	u19740

u19741:
	goto	l14711
u19740:
	line	2392
	
l14707:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1708),postinc2
	movff	(menu_handle_button@new_value_1708+1),postdec2
	line	2393
	
l14709:; BSR set to: 2

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_324)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_324)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1708),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1708+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2394
	goto	l14763
	line	2395
	
l14711:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19751
	goto	u19750

u19751:
	goto	l14717
u19750:
	line	2397
	
l14713:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1708),postinc2
	movff	(menu_handle_button@new_value_1708+1),postdec2
	line	2398
	
l14715:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_325)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_325)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1708),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1708+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2399
	goto	l14763
	line	2400
	
l14717:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19761
	goto	u19760

u19761:
	goto	l1318
u19760:
	line	2403
	
l14719:; BSR set to: 3

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_326)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_326)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1708),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1708+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l14763
	line	2405
	
l1318:; BSR set to: 3

	goto	l14763
	line	2406
	
l14721:; BSR set to: 2

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19771
	goto	u19770

u19771:
	goto	l14741
u19770:
	line	2408
	
l14723:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19781
	goto	u19780

u19781:
	goto	l14729
u19780:
	line	2410
	
l14725:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1708),postinc2
	movff	(menu_handle_button@new_value_1708+1),postdec2
	line	2411
	
l14727:; BSR set to: 2

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_327)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_327)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1708),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1708+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2412
	goto	l14763
	line	2413
	
l14729:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19791
	goto	u19790

u19791:
	goto	l14735
u19790:
	line	2415
	
l14731:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1708),postinc2
	movff	(menu_handle_button@new_value_1708+1),postdec2
	line	2416
	
l14733:; BSR set to: 2

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_328)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_328)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1708),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1708+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2417
	goto	l14763
	line	2418
	
l14735:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19801
	goto	u19800

u19801:
	goto	l1318
u19800:
	line	2420
	
l14737:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1708),postinc2
	movff	(menu_handle_button@new_value_1708+1),postdec2
	line	2421
	
l14739:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_329)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_329)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1708),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1708+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l14763
	line	2424
	
l14741:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19811
	goto	u19810

u19811:
	goto	l14763
u19810:
	
l14743:; BSR set to: 2

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u19821
	goto	u19820
u19821:
	goto	l14763
u19820:
	line	2426
	
l14745:; BSR set to: 2

		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19831
	goto	u19830

u19831:
	goto	l14751
u19830:
	line	2428
	
l14747:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1708),postinc2
	movff	(menu_handle_button@new_value_1708+1),postdec2
	line	2429
	
l14749:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_330)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_330)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1708),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1708+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2430
	goto	l14763
	line	2431
	
l14751:; BSR set to: 3

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19841
	goto	u19840

u19841:
	goto	l14757
u19840:
	line	2433
	
l14753:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1708),postinc2
	movff	(menu_handle_button@new_value_1708+1),postdec2
	line	2434
	
l14755:; BSR set to: 2

		movff	0+(_input_menu+01Bh),(c:sprintf@sp)
	movff	1+(_input_menu+01Bh),(c:sprintf@sp+1)

		movlw	low(STR_331)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_331)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1708),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1708+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2435
	goto	l14763
	line	2436
	
l14757:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19851
	goto	u19850

u19851:
	goto	l1318
u19850:
	line	2438
	
l14759:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+020h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+020h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1708),postinc2
	movff	(menu_handle_button@new_value_1708+1),postdec2
	line	2439
	
l14761:; BSR set to: 2

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_332)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_332)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1708),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1708+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2443
	
l14763:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	((_save_pending))&0ffh
	line	2444
	
l14765:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	goto	l1251
	line	2448
	
l14767:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u19861
	goto	u19860

u19861:
	goto	l1251
u19860:
	line	2450
	
l14769:; BSR set to: 1

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2451
	
l14771:; BSR set to: 3

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2452
	
l14773:
	asmopt push
asmopt off
movlw  3
	movlb	0	; () banked
movwf	(??_menu_handle_button+0+0+1)&0ffh
movlw	8
movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	119
u21137:
decfsz	wreg,f
	bra	u21137
	decfsz	(??_menu_handle_button+0+0)&0ffh,f
	bra	u21137
	decfsz	(??_menu_handle_button+0+0+1)&0ffh,f
	bra	u21137
asmopt pop

	line	2453
	
l14775:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1251
	line	2458
	
l14777:; BSR set to: 3

	movlb	1	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u19871
	goto	u19870

u19871:
	goto	l15061
u19870:
	line	2460
	
l14779:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19881
	goto	u19880
u19881:
	goto	l14811
u19880:
	line	2462
	
l14781:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2464
	goto	l14809
	line	2470
	
l14783:; BSR set to: 3

	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2471
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2472
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2473
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2474
	
l14785:; BSR set to: 3

	call	_menu_draw_setup	;wreg free
	line	2475
	goto	l1251
	line	2478
	
l14787:; BSR set to: 3

	call	_rebuild_utility_menu	;wreg free
	line	2479
	
l14789:; BSR set to: 3

	movlw	low(04h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2480
	
l14791:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2481
	
l14793:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2485
	
l14795:; BSR set to: 3

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	2486
	
l14797:; BSR set to: 3

	call	_menu_draw_utility	;wreg free
	line	2487
	goto	l1251
	line	2493
	
l14799:; BSR set to: 3

	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u19891
	goto	u19890
u19891:
	goto	l14805
u19890:
	line	2495
	
l14801:; BSR set to: 3

	call	_save_current_config	;wreg free
	line	2496
	
l14803:
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_save_pending))&0ffh
	line	2498
	
l14805:; BSR set to: 3

	movlb	2	; () banked
	setf	((_current_menu))&0ffh
	line	2499
	goto	l1251
	line	2464
	
l14809:
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
	goto	l1245
	xorlw	1^0	; case 1
	skipnz
	goto	l14783
	xorlw	2^1	; case 2
	skipnz
	goto	l14787
	xorlw	3^2	; case 3
	skipnz
	goto	l1245
	xorlw	4^3	; case 4
	skipnz
	goto	l14799
	goto	l1251

	line	2502
	
l14811:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19901
	goto	u19900

u19901:
	goto	l14961
u19900:
	line	2504
	
l14813:; BSR set to: 2

	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	clrf	(??_menu_handle_button+0+0+1)&0ffh

	movlw	low(-1)
	movlb	3	; () banked
	addwf	(0+(_menu+02h))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+2+0)&0ffh
	clrf	1+(??_menu_handle_button+2+0)&0ffh
	movlw	high(-1)
	addwfc	1+(??_menu_handle_button+2+0)&0ffh
	movf	(??_menu_handle_button+0+0)&0ffh,w
xorwf	(??_menu_handle_button+2+0)&0ffh,w
	bnz	u19911
movf	(??_menu_handle_button+0+1)&0ffh,w
xorwf	(??_menu_handle_button+2+1)&0ffh,w
	btfss	status,2
	goto	u19911
	goto	u19910

u19911:
	goto	l14827
u19910:
	line	2506
	
l14815:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2507
	
l14817:
	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2508
	
l14819:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2509
	
l14821:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2510
	
l14823:; BSR set to: 3

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l14785
	line	2513
	
l14827:; BSR set to: 0

	movlb	3	; () banked
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
	goto	u19921
	goto	u19920
u19921:
	goto	l1251
u19920:
	line	2515
	
l14829:; BSR set to: 3

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
	movwf	((menu_handle_button@sensor_type_1723))&0ffh
	line	2516
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((menu_handle_button@flow_type_1724))&0ffh
	line	2519
	
l14831:; BSR set to: 2

	movff	(menu_handle_button@sensor_type_1723),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type_1724),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u19931
	goto	u19930
u19931:
	goto	l14889
u19930:
	line	2521
	
l14833:
	movlw	high(0)
	movlb	0	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val))&0ffh
	line	2524
	movlb	2	; () banked
	movf	((menu_handle_button@sensor_type_1723))&0ffh,w
	btfss	status,2
	goto	u19941
	goto	u19940
u19941:
	goto	l14851
u19940:
	line	2526
	
l14835:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19951
	goto	u19950

u19951:
	goto	l14839
u19950:
	line	2527
	
l14837:; BSR set to: 3

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
	goto	l14881
	line	2528
	
l14839:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19961
	goto	u19960

u19961:
	goto	l14843
u19960:
	line	2529
	
l14841:; BSR set to: 3

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
	goto	l14881
	line	2530
	
l14843:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19971
	goto	u19970

u19971:
	goto	l14847
u19970:
	line	2531
	
l14845:; BSR set to: 3

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
	goto	l14881
	line	2532
	
l14847:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19981
	goto	u19980

u19981:
	goto	l1363
u19980:
	line	2533
	
l14849:; BSR set to: 3

	movlw	high(032h)
	movlb	0	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(032h)
	movwf	((menu_handle_button@current_val))&0ffh
	goto	l14881
	line	2534
	
l1363:; BSR set to: 3

	goto	l14881
	line	2535
	
l14851:; BSR set to: 2

		decf	((menu_handle_button@sensor_type_1723))&0ffh,w
	btfss	status,2
	goto	u19991
	goto	u19990

u19991:
	goto	l14865
u19990:
	line	2537
	
l14853:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20001
	goto	u20000

u20001:
	goto	l14857
u20000:
	goto	l14837
	line	2539
	
l14857:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20011
	goto	u20010

u20011:
	goto	l14861
u20010:
	goto	l14841
	line	2541
	
l14861:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20021
	goto	u20020

u20021:
	goto	l1363
u20020:
	goto	l14845
	line	2544
	
l14865:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1723))&0ffh,w
	btfss	status,2
	goto	u20031
	goto	u20030

u20031:
	goto	l14881
u20030:
	
l14867:; BSR set to: 2

	movf	((menu_handle_button@flow_type_1724))&0ffh,w
	btfss	status,2
	goto	u20041
	goto	u20040
u20041:
	goto	l14881
u20040:
	line	2546
	
l14869:; BSR set to: 2

		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20051
	goto	u20050

u20051:
	goto	l14873
u20050:
	goto	l14837
	line	2548
	
l14873:; BSR set to: 3

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20061
	goto	u20060

u20061:
	goto	l14877
u20060:
	goto	l14841
	line	2550
	
l14877:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20071
	goto	u20070

u20071:
	goto	l1363
u20070:
	line	2551
	
l14879:; BSR set to: 3

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
	line	2554
	
l14881:
	movff	(menu_handle_button@current_val),(c:init_numeric_editor@value)
	movff	(menu_handle_button@current_val+1),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	2555
	
l14883:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2556
	
l14885:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l14507
	line	2560
	
l14889:
	movff	(menu_handle_button@sensor_type_1723),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type_1724),(c:is_time_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u20081
	goto	u20080
u20081:
	goto	l14935
u20080:
	line	2562
	
l14891:
	movlw	high(0)
	movlb	0	; () banked
	movwf	((menu_handle_button@current_val_1727+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val_1727))&0ffh
	line	2565
	movlb	2	; () banked
	movf	((menu_handle_button@sensor_type_1723))&0ffh,w
	btfss	status,2
	goto	u20091
	goto	u20090
u20091:
	goto	l14905
u20090:
	line	2567
	
l14893:; BSR set to: 2

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20101
	goto	u20100

u20101:
	goto	l14897
u20100:
	line	2568
	
l14895:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1727)
	movff	postdec2,(menu_handle_button@current_val_1727+1)
	goto	l14923
	line	2569
	
l14897:; BSR set to: 3

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20111
	goto	u20110

u20111:
	goto	l14901
u20110:
	line	2570
	
l14899:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1727)
	movff	postdec2,(menu_handle_button@current_val_1727+1)
	goto	l14923
	line	2571
	
l14901:; BSR set to: 3

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20121
	goto	u20120

u20121:
	goto	l1385
u20120:
	line	2572
	
l14903:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1727)
	movff	postdec2,(menu_handle_button@current_val_1727+1)
	goto	l14923
	line	2573
	
l1385:; BSR set to: 3

	goto	l14923
	line	2574
	
l14905:; BSR set to: 2

		decf	((menu_handle_button@sensor_type_1723))&0ffh,w
	btfss	status,2
	goto	u20131
	goto	u20130

u20131:
	goto	l14911
u20130:
	line	2576
	
l14907:; BSR set to: 2

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20141
	goto	u20140

u20141:
	goto	l14923
u20140:
	goto	l14895
	line	2579
	
l14911:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1723))&0ffh,w
	btfss	status,2
	goto	u20151
	goto	u20150

u20151:
	goto	l14923
u20150:
	line	2582
	
l14913:; BSR set to: 2

	movf	((menu_handle_button@flow_type_1724))&0ffh,w
	btfss	status,2
	goto	u20161
	goto	u20160
u20161:
	goto	l14917
u20160:
	
l14915:; BSR set to: 2

		movlw	7
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u20171
	goto	u20170

u20171:
	goto	l14921
u20170:
	
l14917:
	movlb	2	; () banked
		decf	((menu_handle_button@flow_type_1724))&0ffh,w
	btfss	status,2
	goto	u20181
	goto	u20180

u20181:
	goto	l14923
u20180:
	
l14919:; BSR set to: 2

		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20191
	goto	u20190

u20191:
	goto	l14923
u20190:
	line	2583
	
l14921:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1727)
	movff	postdec2,(menu_handle_button@current_val_1727+1)
	line	2587
	
l14923:
		movlw	low(menu_handle_button@buf_1728)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1728)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_333)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_333)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@current_val_1727),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@current_val_1727+1),1+((c:?_sprintf)+04h)
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2588
	
l14925:
		movlw	low(menu_handle_button@buf_1728)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1728)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2590
	
l14927:
	movff	(menu_handle_button@current_val_1727),(c:init_time_editor@value_seconds)
	movff	(menu_handle_button@current_val_1727+1),(c:init_time_editor@value_seconds+1)
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	goto	l14883
	line	2596
	
l14935:
	movff	(menu_handle_button@sensor_type_1723),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type_1724),(c:is_option_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u20201
	goto	u20200
u20201:
	goto	l1245
u20200:
	line	2598
	
l14937:
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
	line	2600
	
l14939:
	movff	(menu_handle_button@sensor_type_1723),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type_1724),(c:get_option_edit_flag@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1731)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1731+1)
	line	2601
	
l14941:
	movff	(menu_handle_button@sensor_type_1723),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type_1724),(c:get_item_options_for_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1732)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1732+1)
	line	2603
	
l14943:
	movlb	0	; () banked
	movf	((menu_handle_button@edit_flag_1731))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1731+1))&0ffh,w
	btfsc	status,2
	goto	u20211
	goto	u20210

u20211:
	goto	l14957
u20210:
	
l14945:; BSR set to: 0

	movlb	1	; () banked
	movf	((menu_handle_button@opts_1732))&0ffh,w
iorwf	((menu_handle_button@opts_1732+1))&0ffh,w
	btfsc	status,2
	goto	u20221
	goto	u20220

u20221:
	goto	l14957
u20220:
	line	2606
	
l14947:; BSR set to: 1

	movlw	low(0)
	movwf	((menu_handle_button@i))&0ffh
	goto	l14955
	line	2608
	
l14949:; BSR set to: 1

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
	movlb	0	; () banked
	movf	(??_menu_handle_button+0+0)&0ffh,w
	movlb	1	; () banked
	addwf	((menu_handle_button@opts_1732))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+2+0)&0ffh
	movf	(??_menu_handle_button+0+1)&0ffh,w
	movlb	1	; () banked
	addwfc	((menu_handle_button@opts_1732+1))&0ffh,w
	movlb	0	; () banked
	movwf	1+(??_menu_handle_button+2+0)&0ffh
	movlw	02h
	addwf	(??_menu_handle_button+2+0)&0ffh
	movlw	0
	addwfc	(??_menu_handle_button+2+1)&0ffh
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
	goto	u20231
	goto	u20230

u20231:
	goto	l14953
u20230:
	line	2610
	
l14951:
	movff	(menu_handle_button@edit_flag_1731),fsr2l
	movff	(menu_handle_button@edit_flag_1731+1),fsr2h
	movff	(menu_handle_button@i),indf2

	line	2611
	goto	l14957
	line	2606
	
l14953:
	movlb	1	; () banked
	incf	((menu_handle_button@i))&0ffh
	
l14955:; BSR set to: 1

	movlw	01h
	addwf	((menu_handle_button@opts_1732))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	0
	movlb	1	; () banked
	addwfc	((menu_handle_button@opts_1732+1))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0+1)&0ffh
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
	movlb	1	; () banked
	subwf	((menu_handle_button@i))&0ffh,w
	btfss	status,0
	goto	u20241
	goto	u20240

u20241:
	goto	l14949
u20240:
	line	2616
	
l14957:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2617
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l14507
	line	2622
	
l14961:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20251
	goto	u20250

u20251:
	goto	l14995
u20250:
	line	2624
	
l14963:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2626
	
l14965:
		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20261
	goto	u20260

u20261:
	goto	l14971
u20260:
	line	2628
	
l14967:; BSR set to: 3

	movlw	low(0)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2629
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2630
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2631
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2632
	
l14969:; BSR set to: 3

	call	_menu_draw_options	;wreg free
	line	2633
	goto	l1251
	line	2634
	
l14971:; BSR set to: 3

		movlw	03h-0
	cpfslt	((_menu))&0ffh
	goto	u20271
	goto	u20270

u20271:
	goto	l14983
u20270:
	line	2636
	
l14973:; BSR set to: 3

	movf	((_menu))&0ffh,w
	
	call	_rebuild_input_menu
	line	2637
	
l14975:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2638
	
l14977:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2639
	
l14979:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2640
	
l14981:; BSR set to: 3

	call	_menu_draw_input	;wreg free
	line	2641
	goto	l1251
	line	2642
	
l14983:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20281
	goto	u20280

u20281:
	goto	l1245
u20280:
	line	2644
	
l14985:; BSR set to: 3

	call	_rebuild_clock_menu	;wreg free
	line	2645
	
l14987:
	movlw	low(03h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2646
	
l14989:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2647
	
l14991:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2648
	
l14993:
	call	_menu_draw_clock	;wreg free
	goto	l1251
	line	2651
	
l14995:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20291
	goto	u20290

u20291:
	goto	l1251
u20290:
	line	2655
	
l14997:; BSR set to: 2

		movlw	05h-1
	movlb	3	; () banked
	cpfsgt	((_menu))&0ffh
	goto	u20301
	goto	u20300

u20301:
	goto	l15001
u20300:
	
l14999:; BSR set to: 3

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_menu_handle_button$1740+1))&0ffh
	movlw	low(0)
	movwf	((_menu_handle_button$1740))&0ffh
	goto	l15003
	
l15001:; BSR set to: 3

	movf	((_menu))&0ffh,w
	mullw	05h
	movlw	low(_clock_menu+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_clock_menu+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movf	((??_menu_handle_button+0+0))&0ffh,w
	movwf	((_menu_handle_button$1740))&0ffh
	clrf	((_menu_handle_button$1740+1))&0ffh
	
l15003:; BSR set to: 0

		movlw	low(menu_handle_button@buf_1738)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1738)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_334)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_334)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu_handle_button$1740),0+((c:?_sprintf)+06h)
	movff	(_menu_handle_button$1740+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	2656
	
l15005:
		movlw	low(menu_handle_button@buf_1738)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1738)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2658
		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20311
	goto	u20310

u20311:
	goto	l15019
u20310:
	goto	l14815
	line	2668
	
l15019:; BSR set to: 3

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
	goto	u20321
	goto	u20320
u20321:
	goto	l15059
u20320:
	line	2670
	
l15021:; BSR set to: 3

		movlw	low(STR_335)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_335)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2673
	
l15023:
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
	line	2676
	
l15025:
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20331
	goto	u20330
u20331:
	goto	l15029
u20330:
	line	2678
	
l15027:; BSR set to: 3

		movff	0+(_clock_menu+02h),(c:strcmp@s1)
	movff	1+(_clock_menu+02h),(c:strcmp@s1+1)

		movlw	low(STR_336)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_336)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u20341
	goto	u20340

u20341:
	movlw	1
	goto	u20350
u20340:
	movlw	0
u20350:
	movwf	((c:_enable_edit_flag))^00h,c
	line	2679
	goto	l15051
	line	2680
	
l15029:; BSR set to: 3

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20361
	goto	u20360

u20361:
	goto	l15041
u20360:
	line	2682
	
l15031:; BSR set to: 3

		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_337)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_337)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u20371
	goto	u20370

u20371:
	goto	l15035
u20370:
	line	2683
	
l15033:
	movlw	low(0)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l15051
	line	2684
	
l15035:
		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_338)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_338)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u20381
	goto	u20380

u20381:
	goto	l15039
u20380:
	line	2685
	
l15037:
	movlw	low(01h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l15051
	line	2687
	
l15039:
	movlw	low(02h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l15051
	line	2689
	
l15041:; BSR set to: 3

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20391
	goto	u20390

u20391:
	goto	l15047
u20390:
	line	2692
	
l15043:; BSR set to: 3

	movff	0+(_system_config+07h),0+(_menu+0Dh)
	clrf	(1+(_menu+0Dh))&0ffh
	line	2693
	
l15045:; BSR set to: 3

	movff	0+(_system_config+07h),(c:init_time_editor@value_seconds)
	clrf	((c:init_time_editor@value_seconds+1))^00h,c
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	line	2694
	goto	l15051
	line	2695
	
l15047:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20401
	goto	u20400

u20401:
	goto	l1429
u20400:
	line	2697
	
l15049:; BSR set to: 3

		movff	0+(_clock_menu+011h),(c:strcmp@s1)
	movff	1+(_clock_menu+011h),(c:strcmp@s1+1)

		movlw	low(STR_339)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_339)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u20411
	goto	u20410

u20411:
	movlw	1
	goto	u20420
u20410:
	movlw	0
u20420:
	movwf	((c:_display_edit_flag))^00h,c
	goto	l15051
	line	2700
	
l1429:; BSR set to: 3

	
l15051:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2701
	
l15053:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2702
	
l15055:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l14993
	line	2709
	
l15059:; BSR set to: 3

		movlw	low(STR_340)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_340)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1251
	line	2713
	
l15061:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u20431
	goto	u20430

u20431:
	goto	l1251
u20430:
	line	2716
	
l15063:; BSR set to: 1

		movlw	low(menu_handle_button@buf_1747)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1747)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_341)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_341)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2717
	
l15065:
		movlw	low(menu_handle_button@buf_1747)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1747)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2719
	
l15067:
		movlw	4
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20441
	goto	u20440

u20441:
	goto	l14775
u20440:
	line	2721
	
l15069:; BSR set to: 2

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2722
	
l15071:
	asmopt push
asmopt off
movlw  3
	movlb	0	; () banked
movwf	(??_menu_handle_button+0+0+1)&0ffh
movlw	8
movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	119
u21147:
decfsz	wreg,f
	bra	u21147
	decfsz	(??_menu_handle_button+0+0)&0ffh,f
	bra	u21147
	decfsz	(??_menu_handle_button+0+0+1)&0ffh,f
	bra	u21147
asmopt pop

	line	2723
	
l15073:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2726
	
l15075:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2727
	
l15077:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2728
	
l15079:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2729
	
l15081:; BSR set to: 3

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l14969
	line	2739
	
l1251:
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
	
l12411:
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
	
l12413:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	127
	
l12415:
	movlb	0	; () banked
	movf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u16321
	goto	u16320
u16321:
	goto	l152
u16320:
	line	129
	
l12417:; BSR set to: 0

	movlw	low(01h)
	movwf	((_relay_state))&0ffh	;volatile
	line	131
	movf	((trigger_relay_pulse@latch_mode))&0ffh,w
	btfsc	status,2
	goto	u16331
	goto	u16330
u16331:
	goto	l12423
u16330:
	line	134
	
l12419:; BSR set to: 0

	movlw	high(0)
	movlb	3	; () banked
	movwf	((_relay_counter+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_relay_counter))&0ffh	;volatile
	line	135
	
l12421:; BSR set to: 3

		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	136
	goto	l12429
	line	140
	
l12423:; BSR set to: 0

	movlb	6	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	mullw	064h
	movff	prodl,(_relay_counter)	;volatile
	movff	prodh,(_relay_counter+1)	;volatile
	line	141
	
l12425:; BSR set to: 6

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
	
l12427:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	145
	
l12429:
	bcf	((c:3979))^0f00h,c,1	;volatile
	line	147
	
l152:
	return	;funcret
	callstack 0
GLOBAL	__end_of_trigger_relay_pulse
	__end_of_trigger_relay_pulse:
	signat	_trigger_relay_pulse,4217
	global	_rebuild_utility_menu

;; *************** function _rebuild_utility_menu *****************
;; Defined at:
;;		line 1611 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   70[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/3
;;		On exit  : 3F/3
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		___lbdiv
;;		___lbmod
;;		___lwdiv
;;		___lwmod
;;		_sprintf
;; This function is called by:
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text17,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1611
global __ptext17
__ptext17:
psect	text17
	file	"src\menu.c"
	line	1611
	
_rebuild_utility_menu:
;incstack = 0
	callstack 25
	line	1616
	
l13345:
	movlw	low(0)
	movwf	((c:rebuild_utility_menu@i))^00h,c
	line	1618
	
l13351:
	movf	((c:rebuild_utility_menu@i))^00h,c,w
	mullw	05h
	movlw	low((_utility_menu_template))
	addwf	(prodl)^0f00h,c,w
	movwf	tblptrl
	movlw	high((_utility_menu_template))
	addwfc	(prodh)^0f00h,c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	movf	((c:rebuild_utility_menu@i))^00h,c,w
	mullw	05h
	movlw	low(_utility_menu)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_utility_menu)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	tblrd	*+
	
	movff	tablat,postinc2
	tblrd	*
	
	movff	tablat,postdec2
	line	1619
	movf	((c:rebuild_utility_menu@i))^00h,c,w
	mullw	05h
	movlw	04h
	addwf	(prodl)^0f00h,c
	movlw	0
	addwfc	(prodh)^0f00h,c
	movlw	low((_utility_menu_template))
	addwf	(prodl)^0f00h,c,w
	movwf	tblptrl
	movlw	high((_utility_menu_template))
	addwfc	(prodh)^0f00h,c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	movf	((c:rebuild_utility_menu@i))^00h,c,w
	mullw	05h
	movlw	low(_utility_menu+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_utility_menu+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	tblrd	*
	
	movff	tablat,indf2
	line	1616
	
l13353:
	incf	((c:rebuild_utility_menu@i))^00h,c
	
l13355:
		movlw	09h-1
	cpfsgt	((c:rebuild_utility_menu@i))^00h,c
	goto	u17661
	goto	u17660

u17661:
	goto	l13351
u17660:
	line	1623
	
l13357:
		movlw	low(STR_271)
	movlb	4	; () banked
	movwf	(0+(_utility_menu+02h))&0ffh
	movlw	high(STR_271)
	movwf	(1+(_utility_menu+02h))&0ffh

	line	1624
		movlw	low(STR_272)
	movwf	(0+(_utility_menu+07h))&0ffh
	movlw	high(STR_272)
	movwf	(1+(_utility_menu+07h))&0ffh

	line	1625
		movlw	low(STR_273)
	movwf	(0+(_utility_menu+0Ch))&0ffh
	movlw	high(STR_273)
	movwf	(1+(_utility_menu+0Ch))&0ffh

	line	1626
		movlw	low(_value_log_entries)
	movwf	(0+(_utility_menu+011h))&0ffh
	movlw	high(_value_log_entries)
	movwf	(1+(_utility_menu+011h))&0ffh

	line	1627
		movlw	low(_value_menu_timeout)
	movwf	(0+(_utility_menu+016h))&0ffh
	movlw	high(_value_menu_timeout)
	movwf	(1+(_utility_menu+016h))&0ffh

	line	1628
		movlw	low(_value_contrast)
	movwf	(0+(_utility_menu+01Bh))&0ffh
	movlw	high(_value_contrast)
	movwf	(1+(_utility_menu+01Bh))&0ffh

	line	1629
		movlw	low(_value_brightness)
	movwf	(0+(_utility_menu+020h))&0ffh
	movlw	high(_value_brightness)
	movwf	(1+(_utility_menu+020h))&0ffh

	line	1630
		movlw	low(_value_pwr_fail)
	movwf	(0+(_utility_menu+025h))&0ffh
	movlw	high(_value_pwr_fail)
	movwf	(1+(_utility_menu+025h))&0ffh

	line	1631
		movlw	low(STR_274)
	movwf	(0+(_utility_menu+02Ah))&0ffh
	movlw	high(STR_274)
	movwf	(1+(_utility_menu+02Ah))&0ffh

	line	1634
	
l13359:; BSR set to: 4

		movlw	low(_value_log_entries)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_log_entries)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_275)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_275)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+020h),0+((c:?_sprintf)+04h)
	movff	1+(_system_config+020h),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1637
	
l13361:
		movlw	low(_value_menu_timeout)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_menu_timeout)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_276)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_276)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(03Ch)
	movwf	((c:___lbdiv@divisor))^00h,c
	movlb	6	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	
	call	___lbdiv
	movwf	(??_rebuild_utility_menu+0+0)^00h,c
	movf	((??_rebuild_utility_menu+0+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	6	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	
	call	___lbmod
	movwf	(??_rebuild_utility_menu+1+0)^00h,c
	movf	((??_rebuild_utility_menu+1+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1638
	
l13363:
		movlw	low(_value_contrast)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_contrast)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_277)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_277)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+010h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1639
	
l13365:
		movlw	low(_value_brightness)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_brightness)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_278)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_278)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1642
	
l13367:
	movff	0+(_system_config+012h),(c:___lwdiv@dividend)
	movff	1+(_system_config+012h),(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:_rebuild_utility_menu$3197)
	movff	1+?___lwdiv,(c:_rebuild_utility_menu$3197+1)
	
l13369:
	movff	0+(_system_config+012h),(c:___lwmod@dividend)
	movff	1+(_system_config+012h),(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movff	0+?___lwmod,(c:_rebuild_utility_menu$3198)
	movff	1+?___lwmod,(c:_rebuild_utility_menu$3198+1)
	
l13371:
		movlw	low(_value_pwr_fail)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_pwr_fail)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_279)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_279)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:_rebuild_utility_menu$3197),0+((c:?_sprintf)+04h)
	movff	(c:_rebuild_utility_menu$3197+1),1+((c:?_sprintf)+04h)
	movff	(c:_rebuild_utility_menu$3198),0+((c:?_sprintf)+06h)
	movff	(c:_rebuild_utility_menu$3198+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1644
	
l13373:
	movlw	low(09h)
	movlb	3	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	1645
	
l1078:; BSR set to: 3

	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_utility_menu
	__end_of_rebuild_utility_menu:
	signat	_rebuild_utility_menu,89
	global	_rebuild_input_menu

;; *************** function _rebuild_input_menu *****************
;; Defined at:
;;		line 906 in file "src\menu.c"
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
psect	text18,class=CODE,space=0,reloc=2,group=0
	line	906
global __ptext18
__ptext18:
psect	text18
	file	"src\menu.c"
	line	906
	
_rebuild_input_menu:; BSR set to: 3

;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((rebuild_input_menu@input_num))&0ffh
	line	909
	
l12949:
	movff	(rebuild_input_menu@input_num),(_current_input)
	line	912
	
l12951:
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
	line	913
	
l12953:; BSR set to: 0

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
	line	916
	
l12955:; BSR set to: 0

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
	goto	u17261
	goto	u17260
u17261:
	goto	l12959
u17260:
	
l12957:; BSR set to: 0

		movlw	low(STR_176)
	movwf	((_rebuild_input_menu$1342))&0ffh
	movlw	high(STR_176)
	movwf	((_rebuild_input_menu$1342+1))&0ffh

	goto	l12961
	
l12959:; BSR set to: 0

		movlw	low(STR_175)
	movwf	((_rebuild_input_menu$1342))&0ffh
	movlw	high(STR_175)
	movwf	((_rebuild_input_menu$1342+1))&0ffh

	
l12961:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_174)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_174)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_input_menu$1342),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$1342+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	918
	
l12963:
	movlb	0	; () banked
	movf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u17271
	goto	u17270
u17271:
	goto	l13069
u17270:
	line	920
	
l12965:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_177)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_177)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	921
	
l12967:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_178)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_178)
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
	line	922
	
l12969:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_179)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_179)
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
	line	923
	
l12971:
		movlw	low(_value_hi_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_hi_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_180)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_180)
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
	line	926
	
l12973:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3195)
	movff	1+?___lwdiv,(_rebuild_input_menu$3195+1)
	
l12975:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3196)
	movff	1+?___lwmod,(_rebuild_input_menu$3196+1)
	
l12977:
		movlw	low(_value_highbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_highbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_181)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_181)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3195),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3195+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3196),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3196+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	927
	
l12979:
		movlw	low(_value_low_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_182)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_182)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	high(032h)
	movwf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(032h)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	930
	
l12981:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3195)
	movff	1+?___lwdiv,(_rebuild_input_menu$3195+1)
	
l12983:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3196)
	movff	1+?___lwmod,(_rebuild_input_menu$3196+1)
	
l12985:
		movlw	low(_value_plpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_plpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_183)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_183)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3195),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3195+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3196),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3196+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	933
	
l12987:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3195)
	movff	1+?___lwdiv,(_rebuild_input_menu$3195+1)
	
l12989:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3196)
	movff	1+?___lwmod,(_rebuild_input_menu$3196+1)
	
l12991:
		movlw	low(_value_slpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_slpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_184)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_184)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3195),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3195+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3196),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3196+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	936
	
l12993:
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
	goto	u17281
	goto	u17280
u17281:
	goto	l13001
u17280:
	
l12995:; BSR set to: 0

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
	goto	u17291
	goto	u17290

u17291:
	goto	l12999
u17290:
	
l12997:; BSR set to: 0

		movlw	low(STR_187)
	movwf	((_rebuild_input_menu$1357))&0ffh
	movlw	high(STR_187)
	movwf	((_rebuild_input_menu$1357+1))&0ffh

	goto	l754
	
l12999:; BSR set to: 0

		movlw	low(STR_186)
	movwf	((_rebuild_input_menu$1357))&0ffh
	movlw	high(STR_186)
	movwf	((_rebuild_input_menu$1357+1))&0ffh

	
l754:; BSR set to: 0

		movff	(_rebuild_input_menu$1357),(_rebuild_input_menu$1356)
	movff	(_rebuild_input_menu$1357+1),(_rebuild_input_menu$1356+1)

	goto	l13003
	
l13001:; BSR set to: 0

		movlw	low(STR_185)
	movwf	((_rebuild_input_menu$1356))&0ffh
	movlw	high(STR_185)
	movwf	((_rebuild_input_menu$1356+1))&0ffh

	
l13003:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1356),(c:strcpy@from)
	movff	(_rebuild_input_menu$1356+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	938
	
l13005:
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
	goto	u17301
	goto	u17300
u17301:
	goto	l13013
u17300:
	
l13007:; BSR set to: 0

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
	goto	u17311
	goto	u17310

u17311:
	goto	l13011
u17310:
	
l13009:; BSR set to: 0

		movlw	low(STR_190)
	movwf	((_rebuild_input_menu$1364))&0ffh
	movlw	high(STR_190)
	movwf	((_rebuild_input_menu$1364+1))&0ffh

	goto	l762
	
l13011:; BSR set to: 0

		movlw	low(STR_189)
	movwf	((_rebuild_input_menu$1364))&0ffh
	movlw	high(STR_189)
	movwf	((_rebuild_input_menu$1364+1))&0ffh

	
l762:; BSR set to: 0

		movff	(_rebuild_input_menu$1364),(_rebuild_input_menu$1363)
	movff	(_rebuild_input_menu$1364+1),(_rebuild_input_menu$1363+1)

	goto	l13015
	
l13013:; BSR set to: 0

		movlw	low(STR_188)
	movwf	((_rebuild_input_menu$1363))&0ffh
	movlw	high(STR_188)
	movwf	((_rebuild_input_menu$1363+1))&0ffh

	
l13015:; BSR set to: 0

		movlw	low(_value_rlyplp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyplp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1363),(c:strcpy@from)
	movff	(_rebuild_input_menu$1363+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	940
	
l13017:
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
	goto	u17321
	goto	u17320
u17321:
	goto	l13025
u17320:
	
l13019:; BSR set to: 0

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
	goto	u17331
	goto	u17330

u17331:
	goto	l13023
u17330:
	
l13021:; BSR set to: 0

		movlw	low(STR_193)
	movwf	((_rebuild_input_menu$1371))&0ffh
	movlw	high(STR_193)
	movwf	((_rebuild_input_menu$1371+1))&0ffh

	goto	l770
	
l13023:; BSR set to: 0

		movlw	low(STR_192)
	movwf	((_rebuild_input_menu$1371))&0ffh
	movlw	high(STR_192)
	movwf	((_rebuild_input_menu$1371+1))&0ffh

	
l770:; BSR set to: 0

		movff	(_rebuild_input_menu$1371),(_rebuild_input_menu$1370)
	movff	(_rebuild_input_menu$1371+1),(_rebuild_input_menu$1370+1)

	goto	l13027
	
l13025:; BSR set to: 0

		movlw	low(STR_191)
	movwf	((_rebuild_input_menu$1370))&0ffh
	movlw	high(STR_191)
	movwf	((_rebuild_input_menu$1370+1))&0ffh

	
l13027:; BSR set to: 0

		movlw	low(_value_rlyslp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyslp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1370),(c:strcpy@from)
	movff	(_rebuild_input_menu$1370+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	941
	
l13029:
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
	goto	u17341
	goto	u17340
u17341:
	goto	l13033
u17340:
	
l13031:; BSR set to: 0

		movlw	low(STR_195)
	movwf	((_rebuild_input_menu$1375))&0ffh
	movlw	high(STR_195)
	movwf	((_rebuild_input_menu$1375+1))&0ffh

	goto	l13035
	
l13033:; BSR set to: 0

		movlw	low(STR_194)
	movwf	((_rebuild_input_menu$1375))&0ffh
	movlw	high(STR_194)
	movwf	((_rebuild_input_menu$1375+1))&0ffh

	
l13035:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1375),(c:strcpy@from)
	movff	(_rebuild_input_menu$1375+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	944
	
l13037:
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
	line	947
	
l13039:
		movlw	low(_value_enable)
	movlb	4	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	948
	
l13041:; BSR set to: 4

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	949
	
l13043:; BSR set to: 4

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	950
	
l13045:; BSR set to: 4

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	951
	
l13047:; BSR set to: 4

		movlw	low(_value_hi_pressure)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_hi_pressure)
	movwf	(1+(_input_menu+016h))&0ffh

	line	952
	
l13049:; BSR set to: 4

		movlw	low(_value_highbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_highbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	953
	
l13051:; BSR set to: 4

		movlw	low(_value_low_pressure)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_pressure)
	movwf	(1+(_input_menu+020h))&0ffh

	line	954
	
l13053:; BSR set to: 4

		movlw	low(_value_plpbp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_plpbp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	955
	
l13055:; BSR set to: 4

		movlw	low(_value_slpbp)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_slpbp)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	956
	
l13057:; BSR set to: 4

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	957
	
l13059:; BSR set to: 4

		movlw	low(_value_rlyplp)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_rlyplp)
	movwf	(1+(_input_menu+034h))&0ffh

	line	958
	
l13061:; BSR set to: 4

		movlw	low(_value_rlyslp)
	movwf	(0+(_input_menu+039h))&0ffh
	movlw	high(_value_rlyslp)
	movwf	(1+(_input_menu+039h))&0ffh

	line	959
	
l13063:; BSR set to: 4

		movlw	low(_value_display)
	movwf	(0+(_input_menu+03Eh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+03Eh))&0ffh

	line	960
	
l13065:; BSR set to: 4

		movlw	low(_value_back)
	movwf	(0+(_input_menu+043h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+043h))&0ffh

	line	962
	
l13067:; BSR set to: 4

	movlw	low(0Eh)
	movlb	3	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	963
	goto	l13235
	line	964
	
l13069:; BSR set to: 0

		decf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u17351
	goto	u17350

u17351:
	goto	l13127
u17350:
	line	966
	
l13071:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_196)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_196)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	967
	
l13073:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_197)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_197)
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
	line	968
	
l13075:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_198)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_198)
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
	line	969
	
l13077:
		movlw	low(_value_high_temp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_temp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_199)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_199)
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
	line	972
	
l13079:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3195)
	movff	1+?___lwdiv,(_rebuild_input_menu$3195+1)
	
l13081:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3196)
	movff	1+?___lwmod,(_rebuild_input_menu$3196+1)
	
l13083:
		movlw	low(_value_high_tbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_tbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_200)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_200)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3195),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3195+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3196),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3196+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	974
	
l13085:
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
	goto	u17361
	goto	u17360
u17361:
	goto	l13093
u17360:
	
l13087:; BSR set to: 0

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
	goto	u17371
	goto	u17370

u17371:
	goto	l13091
u17370:
	
l13089:; BSR set to: 0

		movlw	low(STR_203)
	movwf	((_rebuild_input_menu$1390))&0ffh
	movlw	high(STR_203)
	movwf	((_rebuild_input_menu$1390+1))&0ffh

	goto	l784
	
l13091:; BSR set to: 0

		movlw	low(STR_202)
	movwf	((_rebuild_input_menu$1390))&0ffh
	movlw	high(STR_202)
	movwf	((_rebuild_input_menu$1390+1))&0ffh

	
l784:; BSR set to: 0

		movff	(_rebuild_input_menu$1390),(_rebuild_input_menu$1389)
	movff	(_rebuild_input_menu$1390+1),(_rebuild_input_menu$1389+1)

	goto	l13095
	
l13093:; BSR set to: 0

		movlw	low(STR_201)
	movwf	((_rebuild_input_menu$1389))&0ffh
	movlw	high(STR_201)
	movwf	((_rebuild_input_menu$1389+1))&0ffh

	
l13095:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1389),(c:strcpy@from)
	movff	(_rebuild_input_menu$1389+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	975
	
l13097:
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
	goto	u17381
	goto	u17380
u17381:
	goto	l13101
u17380:
	
l13099:; BSR set to: 0

		movlw	low(STR_205)
	movwf	((_rebuild_input_menu$1394))&0ffh
	movlw	high(STR_205)
	movwf	((_rebuild_input_menu$1394+1))&0ffh

	goto	l13103
	
l13101:; BSR set to: 0

		movlw	low(STR_204)
	movwf	((_rebuild_input_menu$1394))&0ffh
	movlw	high(STR_204)
	movwf	((_rebuild_input_menu$1394+1))&0ffh

	
l13103:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1394),(c:strcpy@from)
	movff	(_rebuild_input_menu$1394+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	978
	
l13105:
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
	line	981
	
l13107:
		movlw	low(_value_enable)
	movlb	4	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	982
	
l13109:; BSR set to: 4

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	983
	
l13111:; BSR set to: 4

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	984
	
l13113:; BSR set to: 4

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	985
	
l13115:; BSR set to: 4

		movlw	low(_value_high_temp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_high_temp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	986
	
l13117:; BSR set to: 4

		movlw	low(_value_high_tbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_high_tbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	987
	
l13119:; BSR set to: 4

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+020h))&0ffh

	line	988
	
l13121:; BSR set to: 4

		movlw	low(_value_display)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+025h))&0ffh

	line	989
	
l13123:; BSR set to: 4

		movlw	low(_value_back)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	991
	
l13125:; BSR set to: 4

	movlw	low(09h)
	movlb	3	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	992
	goto	l13235
	line	993
	
l13127:; BSR set to: 0

		movlw	2
	xorwf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u17391
	goto	u17390

u17391:
	goto	l13235
u17390:
	line	995
	
l13129:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_206)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_206)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	996
	
l13131:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfsc	status,2
	goto	u17401
	goto	u17400
u17401:
	goto	l13135
u17400:
	
l13133:; BSR set to: 0

		movlw	low(STR_208)
	movwf	((_rebuild_input_menu$1399))&0ffh
	movlw	high(STR_208)
	movwf	((_rebuild_input_menu$1399+1))&0ffh

	goto	l13137
	
l13135:; BSR set to: 0

		movlw	low(STR_207)
	movwf	((_rebuild_input_menu$1399))&0ffh
	movlw	high(STR_207)
	movwf	((_rebuild_input_menu$1399+1))&0ffh

	
l13137:; BSR set to: 0

		movlw	low(_value_flow_type)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_type)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1399),(c:strcpy@from)
	movff	(_rebuild_input_menu$1399+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	997
	
l13139:
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
	goto	u17411
	goto	u17410
u17411:
	goto	l13143
u17410:
	
l13141:; BSR set to: 0

		movlw	low(STR_210)
	movwf	((_rebuild_input_menu$1403))&0ffh
	movlw	high(STR_210)
	movwf	((_rebuild_input_menu$1403+1))&0ffh

	goto	l13145
	
l13143:; BSR set to: 0

		movlw	low(STR_209)
	movwf	((_rebuild_input_menu$1403))&0ffh
	movlw	high(STR_209)
	movwf	((_rebuild_input_menu$1403+1))&0ffh

	
l13145:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1403),(c:strcpy@from)
	movff	(_rebuild_input_menu$1403+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	999
	
l13147:
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
	goto	u17421
	goto	u17420
u17421:
	goto	l13155
u17420:
	
l13149:; BSR set to: 0

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
	goto	u17431
	goto	u17430

u17431:
	goto	l13153
u17430:
	
l13151:; BSR set to: 0

		movlw	low(STR_213)
	movwf	((_rebuild_input_menu$1410))&0ffh
	movlw	high(STR_213)
	movwf	((_rebuild_input_menu$1410+1))&0ffh

	goto	l806
	
l13153:; BSR set to: 0

		movlw	low(STR_212)
	movwf	((_rebuild_input_menu$1410))&0ffh
	movlw	high(STR_212)
	movwf	((_rebuild_input_menu$1410+1))&0ffh

	
l806:; BSR set to: 0

		movff	(_rebuild_input_menu$1410),(_rebuild_input_menu$1409)
	movff	(_rebuild_input_menu$1410+1),(_rebuild_input_menu$1409+1)

	goto	l13157
	
l13155:; BSR set to: 0

		movlw	low(STR_211)
	movwf	((_rebuild_input_menu$1409))&0ffh
	movlw	high(STR_211)
	movwf	((_rebuild_input_menu$1409+1))&0ffh

	
l13157:; BSR set to: 0

		movlw	low(_value_rlylow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlylow)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1409),(c:strcpy@from)
	movff	(_rebuild_input_menu$1409+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1001
	
l13159:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfss	status,2
	goto	u17441
	goto	u17440
u17441:
	goto	l13207
u17440:
	line	1003
	
l13161:; BSR set to: 0

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
	goto	u17451
	goto	u17450
u17451:
	goto	l13165
u17450:
	
l13163:; BSR set to: 0

		movlw	low(STR_215)
	movwf	((_rebuild_input_menu$1414))&0ffh
	movlw	high(STR_215)
	movwf	((_rebuild_input_menu$1414+1))&0ffh

	goto	l13167
	
l13165:; BSR set to: 0

		movlw	low(STR_214)
	movwf	((_rebuild_input_menu$1414))&0ffh
	movlw	high(STR_214)
	movwf	((_rebuild_input_menu$1414+1))&0ffh

	
l13167:; BSR set to: 0

		movlw	low(_value_flow_units)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_units)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1414),(c:strcpy@from)
	movff	(_rebuild_input_menu$1414+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1004
	
l13169:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_216)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_216)
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
	line	1005
	
l13171:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_217)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_217)
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
	line	1006
	
l13173:
		movlw	low(_value_low_flow)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_218)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_218)
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
	line	1009
	
l13175:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3195)
	movff	1+?___lwdiv,(_rebuild_input_menu$3195+1)
	
l13177:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3196)
	movff	1+?___lwmod,(_rebuild_input_menu$3196+1)
	
l13179:
		movlw	low(_value_low_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_219)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_219)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3195),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3195+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3196),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3196+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1012
	
l13181:
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
	line	1015
	
l13183:
		movlw	low(_value_enable)
	movlb	4	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	1016
	
l13185:; BSR set to: 4

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	1017
	
l13187:; BSR set to: 4

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	1018
	
l13189:; BSR set to: 4

		movlw	low(_value_flow_units)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_flow_units)
	movwf	(1+(_input_menu+011h))&0ffh

	line	1019
	
l13191:; BSR set to: 4

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+016h))&0ffh

	line	1020
	
l13193:; BSR set to: 4

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	1021
	
l13195:; BSR set to: 4

		movlw	low(_value_low_flow)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_flow)
	movwf	(1+(_input_menu+020h))&0ffh

	line	1022
	
l13197:; BSR set to: 4

		movlw	low(_value_low_flow_bp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_low_flow_bp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	1023
	
l13199:; BSR set to: 4

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	1024
	
l13201:; BSR set to: 4

		movlw	low(_value_display)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	1025
	
l13203:; BSR set to: 4

		movlw	low(_value_back)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+034h))&0ffh

	line	1027
	
l13205:; BSR set to: 4

	movlw	low(0Bh)
	movlb	3	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	1028
	goto	l13235
	line	1031
	
l13207:; BSR set to: 0

		movlw	low(_value_no_flow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_no_flow)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_220)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_220)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1034
	
l13209:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3195)
	movff	1+?___lwdiv,(_rebuild_input_menu$3195+1)
	
l13211:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3196)
	movff	1+?___lwmod,(_rebuild_input_menu$3196+1)
	
l13213:
		movlw	low(_value_no_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_no_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_221)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_221)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3195),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3195+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3196),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3196+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1037
	
l13215:
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
	line	1040
	
l13217:
		movlw	low(_value_enable)
	movlb	4	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	1041
	
l13219:; BSR set to: 4

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	1042
	
l13221:; BSR set to: 4

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	1043
	
l13223:; BSR set to: 4

		movlw	low(_value_no_flow)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_no_flow)
	movwf	(1+(_input_menu+011h))&0ffh

	line	1044
	
l13225:; BSR set to: 4

		movlw	low(_value_no_flow_bp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_no_flow_bp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	1045
	
l13227:; BSR set to: 4

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	1046
	
l13229:; BSR set to: 4

		movlw	low(_value_display)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+020h))&0ffh

	line	1047
	
l13231:; BSR set to: 4

		movlw	low(_value_back)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+025h))&0ffh

	line	1049
	
l13233:; BSR set to: 4

	movlw	low(08h)
	movlb	3	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	1056
	
l13235:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_222)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_222)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(rebuild_input_menu@sensor),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(rebuild_input_menu@flow_type_val),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1057
	
l13237:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1058
	
l813:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_input_menu
	__end_of_rebuild_input_menu:
	signat	_rebuild_input_menu,4217
	global	_rebuild_clock_menu

;; *************** function _rebuild_clock_menu *****************
;; Defined at:
;;		line 1568 in file "src\menu.c"
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
psect	text19,class=CODE,space=0,reloc=2,group=0
	line	1568
global __ptext19
__ptext19:
psect	text19
	file	"src\menu.c"
	line	1568
	
_rebuild_clock_menu:
;incstack = 0
	callstack 24
	line	1574
	
l13295:; BSR set to: 3

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_260)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_260)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_system_config+06h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1575
	
l13297:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1578
	
l13299:
	movlb	6	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u17631
	goto	u17630
u17631:
	goto	l13303
u17630:
	
l13301:; BSR set to: 6

		movlw	low(STR_263)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1560))&0ffh
	movlw	high(STR_263)
	movwf	((_rebuild_clock_menu$1560+1))&0ffh

	goto	l13305
	
l13303:; BSR set to: 6

		movlw	low(STR_262)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1560))&0ffh
	movlw	high(STR_262)
	movwf	((_rebuild_clock_menu$1560+1))&0ffh

	
l13305:; BSR set to: 0

		movlw	low(_value_clock_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_clock_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_261)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_261)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_clock_menu$1560),0+((c:?_sprintf)+04h)
	movff	(_rebuild_clock_menu$1560+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	1580
	
l13307:
	movlb	6	; () banked
	movf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u17641
	goto	u17640
u17641:
	goto	l13315
u17640:
	
l13309:; BSR set to: 6

		decf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u17651
	goto	u17650

u17651:
	goto	l13313
u17650:
	
l13311:; BSR set to: 6

		movlw	low(STR_266)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1567))&0ffh
	movlw	high(STR_266)
	movwf	((_rebuild_clock_menu$1567+1))&0ffh

	goto	l1070
	
l13313:; BSR set to: 6

		movlw	low(STR_265)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1567))&0ffh
	movlw	high(STR_265)
	movwf	((_rebuild_clock_menu$1567+1))&0ffh

	
l1070:; BSR set to: 0

		movff	(_rebuild_clock_menu$1567),(_rebuild_clock_menu$1566)
	movff	(_rebuild_clock_menu$1567+1),(_rebuild_clock_menu$1566+1)

	goto	l13317
	
l13315:; BSR set to: 6

		movlw	low(STR_264)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1566))&0ffh
	movlw	high(STR_264)
	movwf	((_rebuild_clock_menu$1566+1))&0ffh

	
l13317:; BSR set to: 0

		movlw	low(_value_end_runtime)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_end_runtime)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_clock_menu$1566),(c:strcpy@from)
	movff	(_rebuild_clock_menu$1566+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1585
	
l13319:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_267)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_267)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(03Ch)
	movwf	((c:___lbdiv@divisor))^00h,c
	movlb	6	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbdiv
	movwf	(??_rebuild_clock_menu+0+0)^00h,c
	movf	((??_rebuild_clock_menu+0+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	6	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbmod
	movwf	(??_rebuild_clock_menu+1+0)^00h,c
	movf	((??_rebuild_clock_menu+1+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1587
	
l13321:
		movlw	low(_value_clock_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_clock_display)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_268)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_268)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1589
	
l13323:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_269)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_269)
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
	line	1590
	
l13325:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1593
	
l13327:
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
	line	1596
	
l13329:
		movlw	low(_value_clock_enable)
	movlb	3	; () banked
	movwf	(0+(_clock_menu+02h))&0ffh
	movlw	high(_value_clock_enable)
	movwf	(1+(_clock_menu+02h))&0ffh

	line	1597
	
l13331:; BSR set to: 3

		movlw	low(_value_end_runtime)
	movwf	(0+(_clock_menu+07h))&0ffh
	movlw	high(_value_end_runtime)
	movwf	(1+(_clock_menu+07h))&0ffh

	line	1598
	
l13333:; BSR set to: 3

		movlw	low(_value_relay_pulse)
	movwf	(0+(_clock_menu+0Ch))&0ffh
	movlw	high(_value_relay_pulse)
	movwf	(1+(_clock_menu+0Ch))&0ffh

	line	1599
	
l13335:; BSR set to: 3

		movlw	low(_value_clock_display)
	movwf	(0+(_clock_menu+011h))&0ffh
	movlw	high(_value_clock_display)
	movwf	(1+(_clock_menu+011h))&0ffh

	line	1600
	
l13337:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_clock_menu+016h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_clock_menu+016h))&0ffh

	line	1602
	
l13339:; BSR set to: 3

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	1604
	
l13341:; BSR set to: 3

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_270)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_270)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+02h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1605
	
l13343:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1606
	
l1071:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_clock_menu
	__end_of_rebuild_clock_menu:
	signat	_rebuild_clock_menu,89
	global	_menu_update_time_value

;; *************** function _menu_update_time_value *****************
;; Defined at:
;;		line 544 in file "src\menu.c"
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
;;		On entry : 0/2
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
psect	text20,class=CODE,space=0,reloc=2,group=0
	line	544
global __ptext20
__ptext20:
psect	text20
	file	"src\menu.c"
	line	544
	
_menu_update_time_value:
;incstack = 0
	callstack 23
	line	546
	
l12651:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u16811
	goto	u16810
u16811:
	goto	l12655
u16810:
	goto	l641
	line	553
	
l12655:; BSR set to: 3

	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u16821
	goto	u16820
u16821:
	goto	l12661
u16820:
	
l12657:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u16831
	goto	u16830
u16831:
	goto	l12661
u16830:
	line	555
	
l12659:; BSR set to: 3

	movlw	low(020h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	556
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	557
	goto	l12663
	line	560
	
l12661:; BSR set to: 3

	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	(0+(_menu+012h))&0ffh,w
	
	call	___lbdiv
	addlw	low(030h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	561
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	3	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	565
	
l12663:; BSR set to: 0

	movlw	low(03Ah)
	movwf	(0+(menu_update_time_value@value_buf+02h))&0ffh
	line	568
	
l12665:; BSR set to: 0

	movlb	3	; () banked
		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u16841
	goto	u16840

u16841:
	goto	l12671
u16840:
	
l12667:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u16851
	goto	u16850
u16851:
	goto	l12671
u16850:
	line	570
	
l12669:; BSR set to: 3

	movlw	low(020h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	571
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	572
	goto	l12673
	line	575
	
l12671:; BSR set to: 3

	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	(0+(_menu+013h))&0ffh,w
	
	call	___lbdiv
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	576
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	3	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	579
	
l12673:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(menu_update_time_value@value_buf+05h))&0ffh
	line	582
	
l12675:; BSR set to: 0

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16861
	goto	u16860

u16861:
	goto	l12683
u16860:
	
l12677:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16871
	goto	u16870

u16871:
	goto	l12683
u16870:
	line	584
	
l12679:; BSR set to: 3

		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_145)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_145)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(menu_update_time_value@value_buf)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c

	call	_sprintf	;wreg free
	line	585
	call	_menu_draw_clock	;wreg free
	goto	l641
	line	590
	
l12683:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u16881
	goto	u16880

u16881:
	goto	l12687
u16880:
	goto	l641
	line	594
	
l12687:; BSR set to: 2

	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_time_value@screen_line))&0ffh
	line	595
		movlw	03h-1
	cpfsgt	((menu_update_time_value@screen_line))&0ffh
	goto	u16891
	goto	u16890

u16891:
	goto	l648
u16890:
	goto	l641
	line	596
	
l648:; BSR set to: 0

	line	598
	movff	(_menu),(menu_update_time_value@item_idx)
	line	602
	
l12691:; BSR set to: 0

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
	line	603
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
	line	606
	
l12693:; BSR set to: 0

	movff	(menu_update_time_value@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_update_time_value@flow_type),(c:is_time_field@flow_type)
	movf	((menu_update_time_value@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfss	status,2
	goto	u16901
	goto	u16900
u16901:
	goto	l12697
u16900:
	goto	l641
	line	612
	
l12697:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_146)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_146)
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
	line	613
	
l12699:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	617
	
l12701:
		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_147)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_147)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(menu_update_time_value@value_buf)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c

	call	_sprintf	;wreg free
	line	618
		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	621
	
l12703:
	line	623
	
l12705:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	624
	
l12707:
		movlw	low(STR_148)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_148)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	626
	
l12709:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	627
	
l12711:
		movlw	low(STR_149)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_149)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	628
	
l12713:
		movlw	low(menu_update_time_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	629
	
l12715:
		movlw	low(STR_150)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_150)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	630
	
l641:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_time_value
	__end_of_menu_update_time_value:
	signat	_menu_update_time_value,89
	global	_menu_draw_clock

;; *************** function _menu_draw_clock *****************
;; Defined at:
;;		line 1650 in file "src\menu.c"
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
psect	text21,class=CODE,space=0,reloc=2,group=0
	line	1650
global __ptext21
__ptext21:
psect	text21
	file	"src\menu.c"
	line	1650
	
_menu_draw_clock:
;incstack = 0
	callstack 23
	line	1653
	
l11813:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1654
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_280)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_280)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1657
	
l11815:
	movlw	low(0)
	movwf	((c:menu_draw_clock@i))^00h,c
	goto	l11895
	line	1659
	
l11817:; BSR set to: 3

	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_clock@i))^00h,c,w
	movwf	((c:menu_draw_clock@item_idx))^00h,c
	line	1660
	
l11819:; BSR set to: 3

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1663
	
l11821:
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
	line	1667
	
l11823:
	line	1669
	
l11825:
	movf	((c:menu_draw_clock@item_idx))^00h,c,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15221
	goto	u15220

u15221:
	goto	l11855
u15220:
	line	1671
	
l11827:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15231
	goto	u15230
u15231:
	goto	l11851
u15230:
	line	1673
	
l11829:; BSR set to: 3

	movlw	low(02h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	line	1676
	
l11831:; BSR set to: 3

		movlw	2
	xorwf	((c:menu_draw_clock@item_idx))^00h,c,w
	btfsc	status,2
	goto	u15241
	goto	u15240

u15241:
	goto	l11835
u15240:
	line	1678
	
l11833:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u15251
	goto	u15250
u15251:
	goto	l11837
u15250:
	line	1681
	
l11835:; BSR set to: 3

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
	line	1682
	goto	l11859
	line	1686
	
l11837:; BSR set to: 3

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
	line	1687
	
l11839:
	movlw	low(0)
	movwf	((c:menu_draw_clock@j))^00h,c
	goto	l11845
	line	1688
	
l11841:
	movf	((c:menu_draw_clock@j))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1687
	
l11843:
	incf	((c:menu_draw_clock@j))^00h,c
	
l11845:
		movf	((c:menu_draw_clock@val_len))^00h,c,w
	subwf	((c:menu_draw_clock@j))^00h,c,w
	btfss	status,0
	goto	u15261
	goto	u15260

u15261:
	goto	l11841
u15260:
	line	1689
	
l11847:
	movf	((c:menu_draw_clock@val_len))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l11859
	line	1701
	
l11851:; BSR set to: 3

	movlw	low(01h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l11835
	line	1708
	
l11855:; BSR set to: 3

	movlw	low(0)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l11835
	line	1713
	
l11859:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_clock@val_len_1598))^00h,c
	line	1715
	
l11861:
	movf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfss	status,2
	goto	u15271
	goto	u15270
u15271:
	goto	l11867
u15270:
	line	1718
	
l11863:
	movf	((c:menu_draw_clock@val_len_1598))^00h,c,w
	btfsc	status,2
	goto	u15281
	goto	u15280
u15281:
	goto	l11893
u15280:
	line	1719
	
l11865:
	movf	((c:menu_draw_clock@val_len_1598))^00h,c,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_print_at
	goto	l11893
	line	1724
	
l11867:
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
	line	1725
	
l11869:
	movf	((c:menu_draw_clock@actual_len))^00h,c,w
	sublw	low(012h)
	movwf	((c:menu_draw_clock@start_pos))^00h,c
	line	1727
	
l11871:
	movff	(c:menu_draw_clock@start_pos),(c:lcd_set_cursor@col)
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1728
	
l11873:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u15291
	goto	u15290

u15291:
	goto	l11877
u15290:
	
l11875:
		movlw	low(STR_282)
	movwf	((c:_menu_draw_clock$1604))^00h,c
	movlw	high(STR_282)
	movwf	((c:_menu_draw_clock$1604+1))^00h,c

	goto	l11879
	
l11877:
		movlw	low(STR_281)
	movwf	((c:_menu_draw_clock$1604))^00h,c
	movlw	high(STR_281)
	movwf	((c:_menu_draw_clock$1604+1))^00h,c

	
l11879:
		movff	(c:_menu_draw_clock$1604),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1604+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1731
	
l11881:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1733
	
l11883:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1734
	
l11885:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u15301
	goto	u15300

u15301:
	goto	l11889
u15300:
	
l11887:
		movlw	low(STR_284)
	movwf	((c:_menu_draw_clock$1608))^00h,c
	movlw	high(STR_284)
	movwf	((c:_menu_draw_clock$1608+1))^00h,c

	goto	l11891
	
l11889:
		movlw	low(STR_283)
	movwf	((c:_menu_draw_clock$1608))^00h,c
	movlw	high(STR_283)
	movwf	((c:_menu_draw_clock$1608+1))^00h,c

	
l11891:
		movff	(c:_menu_draw_clock$1608),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1608+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1657
	
l11893:
	incf	((c:menu_draw_clock@i))^00h,c
	
l11895:
		movlw	03h-0
	cpfslt	((c:menu_draw_clock@i))^00h,c
	goto	u15311
	goto	u15310

u15311:
	goto	l1108
u15310:
	
l11897:
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
	goto	u15321
	goto	u15320

u15321:
	goto	l11817
u15320:
	line	1737
	
l1108:
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
;;		On entry : 0/4
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
;;		_rebuild_utility_menu
;;		_menu_handle_button
;;		_dec_to_bcd
;; This function uses a non-reentrant model
;;
psect	text22,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
global __ptext22
__ptext22:
psect	text22
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
	
___lbmod:
;incstack = 0
	callstack 26
	movwf	((c:___lbmod@dividend))^00h,c
	line	9
	
l12395:
	movlw	low(08h)
	movwf	((c:___lbmod@counter))^00h,c
	line	10
	movlw	low(0)
	movwf	((c:___lbmod@rem))^00h,c
	line	12
	
l12397:
	bcf	status,0
	rlcf	((c:___lbmod@dividend))^00h,c,w
	rlcf	((c:___lbmod@rem))^00h,c,w
	movwf	((c:___lbmod@rem))^00h,c
	line	13
	
l12399:
	bcf status,0
	rlcf	((c:___lbmod@dividend))^00h,c

	line	14
	
l12401:
		movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c,w
	btfss	status,0
	goto	u16311
	goto	u16310

u16311:
	goto	l12405
u16310:
	line	15
	
l12403:
	movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c
	line	16
	
l12405:
	decfsz	((c:___lbmod@counter))^00h,c
	
	goto	l12397
	line	17
	
l12407:
	movf	((c:___lbmod@rem))^00h,c,w
	line	18
	
l2247:
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
;;		On entry : 0/4
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
;;		_rebuild_utility_menu
;;		_menu_handle_button
;;		_dec_to_bcd
;; This function uses a non-reentrant model
;;
psect	text23,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
global __ptext23
__ptext23:
psect	text23
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
	
___lbdiv:
;incstack = 0
	callstack 26
	movwf	((c:___lbdiv@dividend))^00h,c
	line	9
	
l12369:
	movlw	low(0)
	movwf	((c:___lbdiv@quotient))^00h,c
	line	10
	
l12371:
	movf	((c:___lbdiv@divisor))^00h,c,w
	btfsc	status,2
	goto	u16281
	goto	u16280
u16281:
	goto	l12391
u16280:
	line	11
	
l12373:
	movlw	low(01h)
	movwf	((c:___lbdiv@counter))^00h,c
	line	12
	goto	l12379
	line	13
	
l12375:
	bcf status,0
	rlcf	((c:___lbdiv@divisor))^00h,c

	line	14
	
l12377:
	incf	((c:___lbdiv@counter))^00h,c
	line	12
	
l12379:
	
	btfss	((c:___lbdiv@divisor))^00h,c,(7)&7
	goto	u16291
	goto	u16290
u16291:
	goto	l12375
u16290:
	line	17
	
l12381:
	bcf status,0
	rlcf	((c:___lbdiv@quotient))^00h,c

	line	18
		movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c,w
	btfss	status,0
	goto	u16301
	goto	u16300

u16301:
	goto	l12387
u16300:
	line	19
	
l12383:
	movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c
	line	20
	
l12385:
	bsf	(0+(0/8)+(c:___lbdiv@quotient))^00h,c,(0)&7
	line	22
	
l12387:
	bcf status,0
	rrcf	((c:___lbdiv@divisor))^00h,c

	line	23
	
l12389:
	decfsz	((c:___lbdiv@counter))^00h,c
	
	goto	l12381
	line	25
	
l12391:
	movf	((c:___lbdiv@quotient))^00h,c,w
	line	26
	
l2241:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
	signat	___lbdiv,8313
	global	_menu_draw_utility

;; *************** function _menu_draw_utility *****************
;; Defined at:
;;		line 1742 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1   24[BANK0 ] unsigned char 
;;  len             1   22[BANK0 ] unsigned char 
;;  start_pos       1   15[BANK0 ] unsigned char 
;;  value_buf      15    0[BANK0 ] unsigned char [15]
;;  show_bracket    1   25[BANK0 ] unsigned char 
;;  val_len         1   23[BANK0 ] unsigned char 
;;  item_idx        1   27[BANK0 ] unsigned char 
;;  is_selected     1   26[BANK0 ] unsigned char 
;;  i               1   28[BANK0 ] unsigned char 
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
;;      Locals:         0      29       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5      29       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       34 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 7
;; This function calls:
;;		_lcd_clear_line
;;		_lcd_print
;;		_lcd_print_at
;;		_lcd_set_cursor
;;		_menu_update_datetime_display
;;		_strcpy
;;		_strlen
;; This function is called by:
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text24,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1742
global __ptext24
__ptext24:
psect	text24
	file	"src\menu.c"
	line	1742
	
_menu_draw_utility:
;incstack = 0
	callstack 22
	line	1745
	
l13375:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1748
	
l13377:
	movlb	3	; () banked
	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u17671
	goto	u17670
u17671:
	goto	l13401
u17670:
	line	1750
	
l13379:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_285)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_285)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1753
	movlw	(01h)&0ffh
	
	call	_lcd_clear_line
	line	1754
	
l13381:
	movlb	3	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17681
	goto	u17680
u17681:
	goto	l13385
u17680:
	line	1755
	
l13383:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_286)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_286)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	goto	l1113
	line	1757
	
l13385:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_287)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_287)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	
l1113:
	line	1760
	movlw	(02h)&0ffh
	
	call	_lcd_clear_line
	line	1761
	
l13387:
	movlb	3	; () banked
		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17691
	goto	u17690

u17691:
	goto	l13391
u17690:
	line	1762
	
l13389:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_288)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_288)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	goto	l1115
	line	1764
	
l13391:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_289)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_289)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	
l1115:
	line	1767
	movlw	(03h)&0ffh
	
	call	_lcd_clear_line
	line	1768
	
l13393:
		movlw	2
	movlb	3	; () banked
	xorwf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17701
	goto	u17700

u17701:
	goto	l13397
u17700:
	line	1769
	
l13395:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_290)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_290)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	goto	l1118
	line	1771
	
l13397:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_291)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_291)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	goto	l1118
	line	1777
	
l13401:; BSR set to: 3

	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17711
	goto	u17710
u17711:
	goto	l13415
u17710:
	
l13403:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17721
	goto	u17720
u17721:
	goto	l13415
u17720:
	line	1780
	
l13405:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_292)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_292)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1782
	
l13407:
	call	_menu_update_datetime_display	;wreg free
	line	1785
	
l13409:
	movlw	(03h)&0ffh
	
	call	_lcd_clear_line
	line	1786
	
l13411:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_293)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_293)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	goto	l1118
	line	1792
	
l13415:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_294)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_294)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1794
	
l13417:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_utility@i))&0ffh
	goto	l13519
	line	1796
	
l13419:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_utility@i))&0ffh,w
	movwf	((menu_draw_utility@item_idx))&0ffh
	line	1797
	
l13421:; BSR set to: 0

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1800
	
l13423:
	movlb	0	; () banked
	movf	((menu_draw_utility@item_idx))&0ffh,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u17731
	goto	u17730

u17731:
	movlw	1
	goto	u17740
u17730:
	movlw	0
u17740:
	movlb	0	; () banked
	movwf	((menu_draw_utility@is_selected))&0ffh
	line	1803
	
l13425:; BSR set to: 0

	movf	((menu_draw_utility@item_idx))&0ffh,w
	btfss	status,2
	goto	u17751
	goto	u17750
u17751:
	goto	l13433
u17750:
	line	1805
	
l13427:; BSR set to: 0

	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u17761
	goto	u17760
u17761:
	goto	l13431
u17760:
	line	1807
	
l13429:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_295)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_295)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1808
	goto	l13517
	line	1811
	
l13431:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_296)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_296)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	goto	l13517
	line	1814
	
l13433:; BSR set to: 0

		movlw	8
	xorwf	((menu_draw_utility@item_idx))&0ffh,w
	btfss	status,2
	goto	u17771
	goto	u17770

u17771:
	goto	l13441
u17770:
	line	1816
	
l13435:; BSR set to: 0

	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u17781
	goto	u17780
u17781:
	goto	l13439
u17780:
	line	1818
	
l13437:; BSR set to: 0

	movlw	low(0Eh)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_297)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_297)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1819
	goto	l13517
	line	1822
	
l13439:; BSR set to: 0

	movlw	low(0Fh)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_298)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_298)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	goto	l13517
	line	1825
	
l13441:; BSR set to: 0

		decf	((menu_draw_utility@item_idx))&0ffh,w
	btfsc	status,2
	goto	u17791
	goto	u17790

u17791:
	goto	l13445
u17790:
	
l13443:; BSR set to: 0

		movlw	2
	xorwf	((menu_draw_utility@item_idx))&0ffh,w
	btfss	status,2
	goto	u17801
	goto	u17800

u17801:
	goto	l13455
u17800:
	line	1827
	
l13445:; BSR set to: 0

	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u17811
	goto	u17810
u17811:
	goto	l13453
u17810:
	line	1829
	
l13447:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_299)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_299)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1830
	
l13449:
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
	movlb	0	; () banked
	movf	((menu_draw_utility@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_utility_menu)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_utility_menu)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:lcd_print_at@str)
	movff	postdec2,(c:lcd_print_at@str+1)
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1831
	
l13451:
	movlb	0	; () banked
	movf	((menu_draw_utility@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_utility_menu)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_utility_menu)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strlen@s)
	movff	postdec2,(c:strlen@s+1)
	call	_strlen	;wreg free
	incf	(0+?_strlen)^00h,c,w
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_300)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_300)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1832
	goto	l13517
	line	1835
	
l13453:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
	movf	((menu_draw_utility@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_utility_menu)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_utility_menu)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:lcd_print_at@str)
	movff	postdec2,(c:lcd_print_at@str+1)
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	goto	l13517
	line	1841
	
l13455:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
	movf	((menu_draw_utility@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_utility_menu)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_utility_menu)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:lcd_print_at@str)
	movff	postdec2,(c:lcd_print_at@str+1)
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1844
	
l13457:
	movlb	0	; () banked
	movf	((menu_draw_utility@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_utility_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_utility_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	postinc2,w
iorwf	postinc2,w
	btfsc	status,2
	goto	u17821
	goto	u17820

u17821:
	goto	l13517
u17820:
	
l13459:; BSR set to: 0

	movf	((menu_draw_utility@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_utility_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_utility_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strlen@s)
	movff	postdec2,(c:strlen@s+1)
	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
iorwf	(1+?_strlen)^00h,c,w
	btfsc	status,2
	goto	u17831
	goto	u17830

u17831:
	goto	l13517
u17830:
	line	1847
	
l13461:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_utility@show_brackets))&0ffh
	line	1849
	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u17841
	goto	u17840
u17841:
	goto	l13485
u17840:
	line	1851
	
l13463:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u17851
	goto	u17850
u17851:
	goto	l13467
u17850:
	
l13465:; BSR set to: 3

	movlw	high(01h)
	movlb	0	; () banked
	movwf	((_menu_draw_utility$1632+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_draw_utility$1632))&0ffh
	goto	l13469
	
l13467:; BSR set to: 3

	movlw	high(02h)
	movlb	0	; () banked
	movwf	((_menu_draw_utility$1632+1))&0ffh
	movlw	low(02h)
	movwf	((_menu_draw_utility$1632))&0ffh
	
l13469:; BSR set to: 0

	movff	(_menu_draw_utility$1632),(menu_draw_utility@show_brackets)
	line	1853
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17861
	goto	u17860
u17861:
	goto	l13485
u17860:
	
l13471:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17871
	goto	u17870
u17871:
	goto	l13485
u17870:
	line	1855
	
l13473:; BSR set to: 3

	movlb	0	; () banked
	movf	((menu_draw_utility@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_utility_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_utility_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strlen@s)
	movff	postdec2,(c:strlen@s+1)
	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_utility@len))&0ffh
	line	1856
	
l13475:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_utility@j))&0ffh
	goto	l13481
	line	1857
	
l13477:; BSR set to: 0

	movf	((menu_draw_utility@j))&0ffh,w
	addlw	low(menu_draw_utility@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1856
	
l13479:; BSR set to: 0

	incf	((menu_draw_utility@j))&0ffh
	
l13481:; BSR set to: 0

		movf	((menu_draw_utility@len))&0ffh,w
	subwf	((menu_draw_utility@j))&0ffh,w
	btfss	status,0
	goto	u17881
	goto	u17880

u17881:
	goto	l13477
u17880:
	line	1858
	
l13483:; BSR set to: 0

	movf	((menu_draw_utility@len))&0ffh,w
	addlw	low(menu_draw_utility@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1859
	goto	l1147
	line	1862
	
l13485:
		movlw	low(menu_draw_utility@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

	movlb	0	; () banked
	movf	((menu_draw_utility@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_utility_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_utility_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strcpy@from)
	movff	postdec2,(c:strcpy@from+1)
	call	_strcpy	;wreg free
	line	1868
	
l1147:
	line	1870
	movlb	0	; () banked
	movf	((menu_draw_utility@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_utility_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_utility_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strlen@s)
	movff	postdec2,(c:strlen@s+1)
	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_utility@val_len))&0ffh
	line	1872
	
l13489:; BSR set to: 0

	movf	((menu_draw_utility@show_brackets))&0ffh,w
	btfss	status,2
	goto	u17891
	goto	u17890
u17891:
	goto	l13493
u17890:
	line	1875
	
l13491:; BSR set to: 0

	movf	((menu_draw_utility@val_len))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_utility@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1876
	goto	l13517
	line	1880
	
l13493:; BSR set to: 0

	movf	((menu_draw_utility@val_len))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_utility@start_pos))&0ffh
	line	1881
	
l13495:; BSR set to: 0

	movff	(menu_draw_utility@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1882
	
l13497:
	movlb	0	; () banked
		decf	((menu_draw_utility@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u17901
	goto	u17900

u17901:
	goto	l13501
u17900:
	
l13499:; BSR set to: 0

		movlw	low(STR_302)
	movwf	((_menu_draw_utility$1640))&0ffh
	movlw	high(STR_302)
	movwf	((_menu_draw_utility$1640+1))&0ffh

	goto	l13503
	
l13501:; BSR set to: 0

		movlw	low(STR_301)
	movwf	((_menu_draw_utility$1640))&0ffh
	movlw	high(STR_301)
	movwf	((_menu_draw_utility$1640+1))&0ffh

	
l13503:; BSR set to: 0

		movff	(_menu_draw_utility$1640),(c:lcd_print@str)
	movff	(_menu_draw_utility$1640+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1883
	
l13505:
		movlw	low(menu_draw_utility@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1884
	
l13507:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1885
	
l13509:
	movlb	0	; () banked
		decf	((menu_draw_utility@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u17911
	goto	u17910

u17911:
	goto	l13513
u17910:
	
l13511:; BSR set to: 0

		movlw	low(STR_304)
	movwf	((_menu_draw_utility$1644))&0ffh
	movlw	high(STR_304)
	movwf	((_menu_draw_utility$1644+1))&0ffh

	goto	l13515
	
l13513:; BSR set to: 0

		movlw	low(STR_303)
	movwf	((_menu_draw_utility$1644))&0ffh
	movlw	high(STR_303)
	movwf	((_menu_draw_utility$1644+1))&0ffh

	
l13515:; BSR set to: 0

		movff	(_menu_draw_utility$1644),(c:lcd_print@str)
	movff	(_menu_draw_utility$1644+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1794
	
l13517:
	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh
	
l13519:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_utility@i))&0ffh
	goto	u17921
	goto	u17920

u17921:
	goto	l1118
u17920:
	
l13521:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+02h))&0ffh,w
	movwf	(??_menu_draw_utility+0+0)^00h,c
	clrf	(??_menu_draw_utility+0+0+1)^00h,c

	movlb	0	; () banked
	movf	((menu_draw_utility@i))&0ffh,w
	movff	0+(_menu+01h),??_menu_draw_utility+2+0
	clrf	(??_menu_draw_utility+2+0+1)^00h,c
	addwf	(??_menu_draw_utility+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_utility+2+1)^00h,c
		movf	(??_menu_draw_utility+0+0)^00h,c,w
	subwf	(??_menu_draw_utility+2+0)^00h,c,w
	movf	(??_menu_draw_utility+2+1)^00h,c,w
	xorlw	80h
	movwf	(??_menu_draw_utility+4+0)^00h,c
	movf	(??_menu_draw_utility+0+1)^00h,c,w
	xorlw	80h
	subwfb	(??_menu_draw_utility+4+0)^00h,c,w
	btfss	status,0
	goto	u17931
	goto	u17930

u17931:
	goto	l13419
u17930:
	line	1890
	
l1118:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_utility
	__end_of_menu_draw_utility:
	signat	_menu_draw_utility,89
	global	_menu_update_datetime_display

;; *************** function _menu_update_datetime_display *****************
;; Defined at:
;;		line 787 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  time_buf        9   73[COMRAM] unsigned char [9]
;;  date_buf        9   64[COMRAM] unsigned char [9]
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
;;      Locals:        18       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        18       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       18 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_lcd_clear_line
;;		_lcd_print_at
;;		_sprintf
;; This function is called by:
;;		_menu_draw_utility
;; This function uses a non-reentrant model
;;
psect	text25,class=CODE,space=0,reloc=2,group=0
	line	787
global __ptext25
__ptext25:
psect	text25
	file	"src\menu.c"
	line	787
	
_menu_update_datetime_display:
;incstack = 0
	callstack 22
	line	793
	
l12173:
	movlb	3	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u15911
	goto	u15910
u15911:
	goto	l12197
u15910:
	
l12175:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15921
	goto	u15920
u15921:
	goto	l12197
u15920:
	line	795
	
l12177:; BSR set to: 3

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u15931
	goto	u15930
u15931:
	goto	l12183
u15930:
	
l12179:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u15941
	goto	u15940
u15941:
	goto	l12183
u15940:
	line	796
	
l12181:; BSR set to: 3

		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_153)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_153)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+017h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+018h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l12199
	line	797
	
l12183:; BSR set to: 3

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u15951
	goto	u15950

u15951:
	goto	l12189
u15950:
	
l12185:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u15961
	goto	u15960
u15961:
	goto	l12189
u15960:
	line	798
	
l12187:; BSR set to: 3

		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_154)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_154)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+016h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+018h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l12199
	line	799
	
l12189:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u15971
	goto	u15970

u15971:
	goto	l12195
u15970:
	
l12191:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u15981
	goto	u15980
u15981:
	goto	l12195
u15980:
	line	800
	
l12193:; BSR set to: 3

		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_155)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_155)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+016h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+017h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l12199
	line	802
	
l12195:; BSR set to: 3

		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_156)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_156)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+016h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+017h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+018h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	goto	l12199
	line	806
	
l12197:; BSR set to: 3

		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_157)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_157)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+016h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+017h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+018h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	810
	
l12199:
	movlb	3	; () banked
		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u15991
	goto	u15990

u15991:
	goto	l12223
u15990:
	
l12201:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u16001
	goto	u16000
u16001:
	goto	l12223
u16000:
	line	812
	
l12203:; BSR set to: 3

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u16011
	goto	u16010
u16011:
	goto	l12209
u16010:
	
l12205:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u16021
	goto	u16020
u16021:
	goto	l12209
u16020:
	line	813
	
l12207:; BSR set to: 3

		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_158)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_158)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+01Ah),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l12225
	line	814
	
l12209:; BSR set to: 3

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u16031
	goto	u16030

u16031:
	goto	l12215
u16030:
	
l12211:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u16041
	goto	u16040
u16041:
	goto	l12215
u16040:
	line	815
	
l12213:; BSR set to: 3

		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_159)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_159)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+019h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l12225
	line	816
	
l12215:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u16051
	goto	u16050

u16051:
	goto	l12221
u16050:
	
l12217:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u16061
	goto	u16060
u16061:
	goto	l12221
u16060:
	line	817
	
l12219:; BSR set to: 3

		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_160)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_160)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+019h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l12225
	line	819
	
l12221:; BSR set to: 3

		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_161)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_161)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+019h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+01Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	goto	l12225
	line	823
	
l12223:; BSR set to: 3

		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_162)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_162)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+019h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+01Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	827
	
l12225:
	movlw	(01h)&0ffh
	
	call	_lcd_clear_line
	line	828
	
l12227:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_163)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_163)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	829
	
l12229:
	movlb	3	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u16071
	goto	u16070
u16071:
	goto	l12237
u16070:
	line	831
	
l12231:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u16081
	goto	u16080
u16081:
	goto	l12235
u16080:
	line	833
	
l12233:; BSR set to: 3

	movlw	low(06h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_164)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_164)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	834
	movlw	low(07h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	835
	movlw	low(0Fh)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_165)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_165)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	836
	goto	l723
	line	839
	
l12235:; BSR set to: 3

	movlw	low(06h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_166)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_166)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	840
	movlw	low(07h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	841
	movlw	low(0Fh)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_167)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_167)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	goto	l723
	line	846
	
l12237:; BSR set to: 3

	movlw	low(07h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	847
	
l723:
	line	850
	movlw	(02h)&0ffh
	
	call	_lcd_clear_line
	line	851
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_168)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_168)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	852
	
l12239:
	movlb	3	; () banked
		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u16091
	goto	u16090

u16091:
	goto	l12247
u16090:
	line	854
	
l12241:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u16101
	goto	u16100
u16101:
	goto	l12245
u16100:
	line	856
	
l12243:; BSR set to: 3

	movlw	low(06h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_169)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_169)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	857
	movlw	low(07h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	858
	movlw	low(0Fh)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_170)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_170)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	859
	goto	l728
	line	862
	
l12245:; BSR set to: 3

	movlw	low(06h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_171)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_171)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	863
	movlw	low(07h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	864
	movlw	low(0Fh)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_172)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_172)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	goto	l728
	line	869
	
l12247:; BSR set to: 3

	movlw	low(07h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	871
	
l728:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_datetime_display
	__end_of_menu_update_datetime_display:
	signat	_menu_update_datetime_display,89
	global	_menu_draw_setup

;; *************** function _menu_draw_setup *****************
;; Defined at:
;;		line 1488 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  label           2   41[COMRAM] PTR const unsigned char 
;;		 -> STR_248(5), STR_247(6), STR_246(1), STR_245(1), 
;;		 -> STR_244(1), 
;;  sensor_name     2   44[COMRAM] PTR const unsigned char 
;;		 -> Fake(1), STR_251(5), STR_250(5), STR_249(9), 
;;  sensor          1   43[COMRAM] unsigned char 
;;  item_idx        1   46[COMRAM] unsigned char 
;;  i               1   47[COMRAM] unsigned char 
;;  setup_labels   10   25[COMRAM] PTR const unsigned char 
;;		 -> STR_248(5), STR_247(6), STR_246(1), STR_245(1), 
;;		 -> STR_244(1), 
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
psect	text26,class=CODE,space=0,reloc=2,group=0
	line	1488
global __ptext26
__ptext26:
psect	text26
	file	"src\menu.c"
	line	1488
	
_menu_draw_setup:
;incstack = 0
	callstack 23
	line	1493
	
l12835:
	call	_lcd_clear	;wreg free
	line	1494
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1495
	
l12837:
		movlw	low(STR_243)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_243)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1498
	
l12839:
	lfsr	2,(menu_draw_setup@F2710)
	lfsr	1,(menu_draw_setup@setup_labels)
	movlw	10-1
u17131:
	movff	plusw2,plusw1
	decf	wreg
	bc	u17131

	line	1501
	
l12841:
	movlw	low(0)
	movwf	((c:menu_draw_setup@i))^00h,c
	line	1503
	
l12847:
	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_setup@i))^00h,c,w
	movwf	((c:menu_draw_setup@item_idx))^00h,c
	line	1504
		movlw	05h-1
	cpfsgt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u17141
	goto	u17140

u17141:
	goto	l12851
u17140:
	goto	l1054
	line	1507
	
l12851:; BSR set to: 3

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1510
	
l12853:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u17151
	goto	u17150

u17151:
	goto	l12887
u17150:
	line	1512
	
l12855:
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
	line	1514
	
l12857:
	movf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u17161
	goto	u17160
u17161:
	goto	l12865
u17160:
	
l12859:
		decf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u17171
	goto	u17170

u17171:
	goto	l12863
u17170:
	
l12861:
		movlw	low(STR_251)
	movwf	((c:_menu_draw_setup$1537))^00h,c
	movlw	high(STR_251)
	movwf	((c:_menu_draw_setup$1537+1))^00h,c

	goto	l1037
	
l12863:
		movlw	low(STR_250)
	movwf	((c:_menu_draw_setup$1537))^00h,c
	movlw	high(STR_250)
	movwf	((c:_menu_draw_setup$1537+1))^00h,c

	
l1037:
		movff	(c:_menu_draw_setup$1537),(c:menu_draw_setup@sensor_name)
	movff	(c:_menu_draw_setup$1537+1),(c:menu_draw_setup@sensor_name+1)

	goto	l1033
	
l12865:
		movlw	low(STR_249)
	movwf	((c:menu_draw_setup@sensor_name))^00h,c
	movlw	high(STR_249)
	movwf	((c:menu_draw_setup@sensor_name+1))^00h,c

	
l1033:
	line	1517
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17181
	goto	u17180

u17181:
	goto	l12875
u17180:
	line	1520
	
l12867:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1521
	
l12869:
		movlw	low(STR_252)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_252)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1522
	
l12871:
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1523
	
l12873:
		movlw	low(STR_253)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_253)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1524
	goto	l12877
	line	1528
	
l12875:; BSR set to: 3

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1532
	
l12877:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1533
	
l12879:
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
	goto	u17191
	goto	u17190
u17191:
	goto	l12883
u17190:
	
l12881:
		movlw	low(STR_255)
	movwf	((c:_menu_draw_setup$1543))^00h,c
	movlw	high(STR_255)
	movwf	((c:_menu_draw_setup$1543+1))^00h,c

	goto	l12885
	
l12883:
		movlw	low(STR_254)
	movwf	((c:_menu_draw_setup$1543))^00h,c
	movlw	high(STR_254)
	movwf	((c:_menu_draw_setup$1543+1))^00h,c

	
l12885:
		movff	(c:_menu_draw_setup$1543),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1543+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1534
	goto	l12913
	line	1538
	
l12887:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_labels)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:menu_draw_setup@label)
	movff	postdec2,(c:menu_draw_setup@label+1)
	line	1540
	
l12889:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17201
	goto	u17200

u17201:
	goto	l12899
u17200:
	line	1543
	
l12891:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1544
	
l12893:
		movlw	low(STR_256)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_256)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1545
	
l12895:
		movff	(c:menu_draw_setup@label),(c:lcd_print@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1546
	
l12897:
		movlw	low(STR_257)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_257)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1547
	goto	l12901
	line	1551
	
l12899:; BSR set to: 3

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@label),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1555
	
l12901:
		movlw	3
	xorwf	((c:menu_draw_setup@item_idx))^00h,c,w
	btfss	status,2
	goto	u17211
	goto	u17210

u17211:
	goto	l12913
u17210:
	line	1558
	
l12903:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1559
	
l12905:
	movlb	6	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u17221
	goto	u17220
u17221:
	goto	l12909
u17220:
	
l12907:; BSR set to: 6

		movlw	low(STR_259)
	movwf	((c:_menu_draw_setup$1551))^00h,c
	movlw	high(STR_259)
	movwf	((c:_menu_draw_setup$1551+1))^00h,c

	goto	l12911
	
l12909:; BSR set to: 6

		movlw	low(STR_258)
	movwf	((c:_menu_draw_setup$1551))^00h,c
	movlw	high(STR_258)
	movwf	((c:_menu_draw_setup$1551+1))^00h,c

	
l12911:; BSR set to: 6

		movff	(c:_menu_draw_setup$1551),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1551+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1501
	
l12913:
	incf	((c:menu_draw_setup@i))^00h,c
	
l12915:
		movlw	03h-1
	cpfsgt	((c:menu_draw_setup@i))^00h,c
	goto	u17231
	goto	u17230

u17231:
	goto	l12847
u17230:
	line	1563
	
l1054:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_setup
	__end_of_menu_draw_setup:
	signat	_menu_draw_setup,89
	global	_menu_draw_options

;; *************** function _menu_draw_options *****************
;; Defined at:
;;		line 1329 in file "src\menu.c"
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
psect	text27,class=CODE,space=0,reloc=2,group=0
	line	1329
global __ptext27
__ptext27:
psect	text27
	file	"src\menu.c"
	line	1329
	
_menu_draw_options:
;incstack = 0
	callstack 23
	line	1332
	
l12439:
	call	_lcd_clear	;wreg free
	line	1333
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1334
	
l12441:
		movlw	low(STR_233)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_233)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1337
	
l12443:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	line	1339
	
l12449:
	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_options@i))^00h,c,w
	movwf	((c:menu_draw_options@item_index))^00h,c
	line	1340
		movlw	05h-1
	cpfsgt	((c:menu_draw_options@item_index))^00h,c
	goto	u16351
	goto	u16350

u16351:
	goto	l12453
u16350:
	goto	l978
	line	1343
	
l12453:; BSR set to: 3

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1346
	
l12455:
	movf	((c:menu_draw_options@item_index))^00h,c,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16361
	goto	u16360

u16361:
	goto	l12465
u16360:
	line	1348
	
l12457:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1349
	
l12459:
		movlw	low(STR_234)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_234)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1350
	
l12461:
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
	line	1351
	
l12463:
		movlw	low(STR_235)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_235)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1352
	goto	l12467
	line	1356
	
l12465:; BSR set to: 3

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
	line	1337
	
l12467:
	incf	((c:menu_draw_options@i))^00h,c
	
l12469:
		movlw	03h-1
	cpfsgt	((c:menu_draw_options@i))^00h,c
	goto	u16371
	goto	u16370

u16371:
	goto	l12449
u16370:
	line	1359
	
l978:
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
psect	text28,class=CODE,space=0,reloc=2,group=0
	file	"src\lcd.c"
	line	165
global __ptext28
__ptext28:
psect	text28
	file	"src\lcd.c"
	line	165
	
_lcd_clear:
;incstack = 0
	callstack 24
	line	167
	
l11707:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	168
	
l11709:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u21157:
decfsz	wreg,f
	bra	u21157
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u21157
	nop2
asmopt pop

	line	169
	
l1576:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
	signat	_lcd_clear,89
	global	_menu_draw_input

;; *************** function _menu_draw_input *****************
;; Defined at:
;;		line 1361 in file "src\menu.c"
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
psect	text29,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1361
global __ptext29
__ptext29:
psect	text29
	file	"src\menu.c"
	line	1361
	
_menu_draw_input:
;incstack = 0
	callstack 23
	line	1366
	
l12717:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1368
	
l12719:
		movlw	low(menu_draw_input@title)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_236)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_236)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(01h)
	movlb	2	; () banked
	addwf	((_current_input))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	1+(0+((c:?_sprintf)+04h))^00h,c
	movlw	high(01h)
	addwfc	1+(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1369
	
l12721:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@title)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1372
	
l12723:
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
	line	1373
	
l12725:; BSR set to: 0

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
	line	1376
	
l12727:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@i))&0ffh
	goto	l12831
	line	1378
	
l12729:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_input@i))&0ffh,w
	movwf	((menu_draw_input@item_idx))&0ffh
	line	1379
	
l12731:; BSR set to: 0

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1382
	
l12733:
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
	line	1386
	
l12735:
	line	1388
	
l12737:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16911
	goto	u16910

u16911:
	goto	l12787
u16910:
	line	1390
	
l12739:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u16921
	goto	u16920
u16921:
	goto	l12783
u16920:
	line	1392
	
l12741:; BSR set to: 3

	movlw	low(02h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	line	1395
	
l12743:; BSR set to: 0

	movff	(menu_draw_input@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_option_field@flow_type)
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u16931
	goto	u16930
u16931:
	goto	l12757
u16930:
	line	1397
	
l12745:
	movlb	3	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u16941
	goto	u16940
u16941:
	goto	l12759
u16940:
	line	1400
	
l12747:; BSR set to: 3

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts+1)
	line	1401
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag+1)
	line	1403
	
l12749:
	movlb	0	; () banked
	movf	((menu_draw_input@opts))&0ffh,w
iorwf	((menu_draw_input@opts+1))&0ffh,w
	btfsc	status,2
	goto	u16951
	goto	u16950

u16951:
	goto	l12757
u16950:
	
l12751:; BSR set to: 0

	movf	((menu_draw_input@flag))&0ffh,w
iorwf	((menu_draw_input@flag+1))&0ffh,w
	btfsc	status,2
	goto	u16961
	goto	u16960

u16961:
	goto	l12757
u16960:
	
l12753:; BSR set to: 0

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
	goto	u16971
	goto	u16970
u16971:
	goto	l12757
u16970:
	line	1405
	
l12755:; BSR set to: 0

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
	line	1406
	goto	l12791
	line	1409
	
l12757:
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
	goto	l12791
	line	1415
	
l12759:; BSR set to: 3

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts_1499)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts_1499+1)
	line	1416
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag_1503)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag_1503+1)
	line	1418
	
l12761:
	movlb	0	; () banked
	movf	((menu_draw_input@opts_1499))&0ffh,w
iorwf	((menu_draw_input@opts_1499+1))&0ffh,w
	btfsc	status,2
	goto	u16981
	goto	u16980

u16981:
	goto	l12779
u16980:
	
l12763:; BSR set to: 0

	movf	((menu_draw_input@flag_1503))&0ffh,w
iorwf	((menu_draw_input@flag_1503+1))&0ffh,w
	btfsc	status,2
	goto	u16991
	goto	u16990

u16991:
	goto	l12779
u16990:
	
l12765:; BSR set to: 0

	movff	(menu_draw_input@flag_1503),fsr2l
	movff	(menu_draw_input@flag_1503+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	01h
	addwf	((menu_draw_input@opts_1499))&0ffh,w
	movwf	(??_menu_draw_input+1+0)^00h,c
	movlw	0
	addwfc	((menu_draw_input@opts_1499+1))&0ffh,w
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
	goto	u17001
	goto	u17000
u17001:
	goto	l12779
u17000:
	line	1420
	
l12767:; BSR set to: 0

	movff	(menu_draw_input@flag_1503),fsr2l
	movff	(menu_draw_input@flag_1503+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movf	((??_menu_draw_input+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_input+1+0
	movff	prodh,??_menu_draw_input+1+0+1
	movf	(??_menu_draw_input+1+0)^00h,c,w
	addwf	((menu_draw_input@opts_1499))&0ffh,w
	movwf	(??_menu_draw_input+3+0)^00h,c
	movf	(??_menu_draw_input+1+1)^00h,c,w
	addwfc	((menu_draw_input@opts_1499+1))&0ffh,w
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
	line	1421
	
l12769:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j))&0ffh
	goto	l12775
	line	1422
	
l12771:; BSR set to: 0

	movf	((menu_draw_input@j))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1421
	
l12773:; BSR set to: 0

	incf	((menu_draw_input@j))&0ffh
	
l12775:; BSR set to: 0

		movf	((menu_draw_input@val_len))&0ffh,w
	subwf	((menu_draw_input@j))&0ffh,w
	btfss	status,0
	goto	u17011
	goto	u17010

u17011:
	goto	l12771
u17010:
	line	1423
	
l12777:; BSR set to: 0

	movf	((menu_draw_input@val_len))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1424
	goto	l12791
	line	1427
	
l12779:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_237)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_237)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l12791
	line	1440
	
l12783:; BSR set to: 3

	movlw	low(01h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l12757
	line	1447
	
l12787:; BSR set to: 3

	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l12757
	line	1452
	
l12791:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_1507))&0ffh
	line	1453
	
l12793:; BSR set to: 0

	movf	((menu_draw_input@val_len_1507))&0ffh,w
	btfsc	status,2
	goto	u17021
	goto	u17020
u17021:
	goto	l12829
u17020:
	
l12795:; BSR set to: 0

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
		movlw	low(STR_238)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_238)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u17031
	goto	u17030

u17031:
	goto	l12829
u17030:
	line	1456
	
l12797:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17041
	goto	u17040
u17041:
	goto	l12805
u17040:
	
l12799:; BSR set to: 3

	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17051
	goto	u17050

u17051:
	goto	l12805
u17050:
	line	1459
	
l12801:; BSR set to: 3

	movff	(menu_draw_input@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_numeric_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u17061
	goto	u17060
u17061:
	goto	l12829
u17060:
	
l12803:
	movff	(menu_draw_input@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_time_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u17071
	goto	u17070
u17071:
	goto	l12805
u17070:
	goto	l12829
	line	1466
	
l12805:
	movlb	0	; () banked
	movf	((menu_draw_input@show_brackets))&0ffh,w
	btfss	status,2
	goto	u17081
	goto	u17080
u17081:
	goto	l12809
u17080:
	line	1469
	
l12807:; BSR set to: 0

	movf	((menu_draw_input@val_len_1507))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	1470
	goto	l12829
	line	1474
	
l12809:; BSR set to: 0

	movf	((menu_draw_input@val_len_1507))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_input@start_pos))&0ffh
	line	1475
	
l12811:; BSR set to: 0

	movff	(menu_draw_input@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1478
	
l12813:
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u17091
	goto	u17090

u17091:
	goto	l12817
u17090:
	
l12815:; BSR set to: 0

		movlw	low(STR_240)
	movwf	((_menu_draw_input$1513))&0ffh
	movlw	high(STR_240)
	movwf	((_menu_draw_input$1513+1))&0ffh

	goto	l12819
	
l12817:; BSR set to: 0

		movlw	low(STR_239)
	movwf	((_menu_draw_input$1513))&0ffh
	movlw	high(STR_239)
	movwf	((_menu_draw_input$1513+1))&0ffh

	
l12819:; BSR set to: 0

		movff	(_menu_draw_input$1513),(c:lcd_print@str)
	movff	(_menu_draw_input$1513+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1480
	
l12821:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1482
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u17101
	goto	u17100

u17101:
	goto	l12825
u17100:
	
l12823:; BSR set to: 0

		movlw	low(STR_242)
	movwf	((_menu_draw_input$1517))&0ffh
	movlw	high(STR_242)
	movwf	((_menu_draw_input$1517+1))&0ffh

	goto	l12827
	
l12825:; BSR set to: 0

		movlw	low(STR_241)
	movwf	((_menu_draw_input$1517))&0ffh
	movlw	high(STR_241)
	movwf	((_menu_draw_input$1517+1))&0ffh

	
l12827:; BSR set to: 0

		movff	(_menu_draw_input$1517),(c:lcd_print@str)
	movff	(_menu_draw_input$1517+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1376
	
l12829:
	movlb	0	; () banked
	incf	((menu_draw_input@i))&0ffh
	
l12831:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_input@i))&0ffh
	goto	u17111
	goto	u17110

u17111:
	goto	l1019
u17110:
	
l12833:; BSR set to: 0

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
	goto	u17121
	goto	u17120

u17121:
	goto	l12729
u17120:
	line	1486
	
l1019:; BSR set to: 0

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
;;		 -> menu_draw_clock@value_buf(15), STR_274(1), value_pwr_fail(6), value_brightness(4), 
;;		 -> value_contrast(4), value_menu_timeout(6), value_log_entries(6), STR_273(1), 
;;		 -> STR_272(1), STR_271(1), value_clock_display(10), value_end_runtime(10), 
;;		 -> value_clock_enable(10), menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), value_relay_pulse(10), STR_140(5), 
;;		 -> STR_139(11), STR_138(11), STR_137(9), STR_136(9), 
;;		 -> STR_135(12), STR_134(10), STR_133(9), STR_132(10), 
;;		 -> STR_131(5), STR_130(8), STR_129(10), STR_128(8), 
;;		 -> STR_127(7), STR_126(5), STR_125(8), STR_124(8), 
;;		 -> STR_123(12), STR_122(9), STR_121(11), STR_120(10), 
;;		 -> STR_119(6), STR_118(5), STR_117(7), STR_116(7), 
;;		 -> STR_115(5), STR_114(8), STR_113(8), STR_112(11), 
;;		 -> STR_111(8), STR_110(5), STR_109(7), STR_108(7), 
;;		 -> STR_107(5), STR_106(8), STR_105(9), STR_104(9), 
;;		 -> STR_103(10), STR_102(11), STR_101(10), STR_100(7), 
;;		 -> STR_99(7), STR_98(5), STR_97(8), STR_96(8), 
;;		 -> STR_95(8), STR_94(9), STR_93(6), STR_92(6), 
;;		 -> STR_91(13), STR_90(9), STR_89(12), STR_88(11), 
;;		 -> STR_87(10), STR_86(7), NULL(0), STR_85(7), 
;;		 -> STR_79(1), STR_78(1), STR_77(9), STR_76(6), 
;;		 -> STR_75(6), STR_74(1), STR_73(1), STR_72(1), 
;;		 -> STR_71(5), STR_70(5), STR_69(1), STR_68(1), 
;;		 -> STR_67(1), STR_66(4), STR_65(2), STR_64(1), 
;;		 -> STR_63(1), STR_62(1), STR_61(5), STR_60(4), 
;;		 -> STR_59(1), STR_58(1), STR_57(1), STR_56(8), 
;;		 -> STR_55(7), STR_54(1), STR_53(1), STR_52(5), 
;;		 -> STR_51(5), STR_50(9), STR_49(1), STR_48(1), 
;;		 -> STR_47(1), STR_46(8), STR_45(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   16[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_clock@value_buf(15), STR_274(1), value_pwr_fail(6), value_brightness(4), 
;;		 -> value_contrast(4), value_menu_timeout(6), value_log_entries(6), STR_273(1), 
;;		 -> STR_272(1), STR_271(1), value_clock_display(10), value_end_runtime(10), 
;;		 -> value_clock_enable(10), menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), value_relay_pulse(10), STR_140(5), 
;;		 -> STR_139(11), STR_138(11), STR_137(9), STR_136(9), 
;;		 -> STR_135(12), STR_134(10), STR_133(9), STR_132(10), 
;;		 -> STR_131(5), STR_130(8), STR_129(10), STR_128(8), 
;;		 -> STR_127(7), STR_126(5), STR_125(8), STR_124(8), 
;;		 -> STR_123(12), STR_122(9), STR_121(11), STR_120(10), 
;;		 -> STR_119(6), STR_118(5), STR_117(7), STR_116(7), 
;;		 -> STR_115(5), STR_114(8), STR_113(8), STR_112(11), 
;;		 -> STR_111(8), STR_110(5), STR_109(7), STR_108(7), 
;;		 -> STR_107(5), STR_106(8), STR_105(9), STR_104(9), 
;;		 -> STR_103(10), STR_102(11), STR_101(10), STR_100(7), 
;;		 -> STR_99(7), STR_98(5), STR_97(8), STR_96(8), 
;;		 -> STR_95(8), STR_94(9), STR_93(6), STR_92(6), 
;;		 -> STR_91(13), STR_90(9), STR_89(12), STR_88(11), 
;;		 -> STR_87(10), STR_86(7), NULL(0), STR_85(7), 
;;		 -> STR_79(1), STR_78(1), STR_77(9), STR_76(6), 
;;		 -> STR_75(6), STR_74(1), STR_73(1), STR_72(1), 
;;		 -> STR_71(5), STR_70(5), STR_69(1), STR_68(1), 
;;		 -> STR_67(1), STR_66(4), STR_65(2), STR_64(1), 
;;		 -> STR_63(1), STR_62(1), STR_61(5), STR_60(4), 
;;		 -> STR_59(1), STR_58(1), STR_57(1), STR_56(8), 
;;		 -> STR_55(7), STR_54(1), STR_53(1), STR_52(5), 
;;		 -> STR_51(5), STR_50(9), STR_49(1), STR_48(1), 
;;		 -> STR_47(1), STR_46(8), STR_45(9), 
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
;;		_menu_draw_utility
;; This function uses a non-reentrant model
;;
psect	text30,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
global __ptext30
__ptext30:
psect	text30
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
	
_strlen:; BSR set to: 0

;incstack = 0
	callstack 26
	line	8
	
l11669:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l11673
	line	10
	
l11671:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l11673:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14897
	tblrd	*
	
	movf	tablat,w
	bra	u14890
u14897:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u14890:
	iorlw	0
	btfss	status,2
	goto	u14901
	goto	u14900
u14901:
	goto	l11671
u14900:
	line	12
	
l11675:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l2537:
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
;;		 -> original_value(10), menu_draw_utility@value_buf(15), menu_draw_clock@value_buf(15), STR_274(1), 
;;		 -> value_pwr_fail(6), value_brightness(4), value_contrast(4), value_menu_timeout(6), 
;;		 -> value_log_entries(6), STR_273(1), STR_272(1), STR_271(1), 
;;		 -> value_clock_display(10), value_end_runtime(10), value_clock_enable(10), menu_draw_input@value_buf(15), 
;;		 -> menu_update_edit_value@display_buf(10), value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), 
;;		 -> value_low_flow(10), value_flow_units(10), value_rlylow(10), value_flow_type(10), 
;;		 -> value_high_tbp(10), value_high_temp(10), value_back(5), value_display(10), 
;;		 -> value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), value_sensor(12), value_enable(10), 
;;		 -> value_relay_pulse(10), NULL(0), 
;;  from            2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_274(1), value_pwr_fail(6), value_brightness(4), value_contrast(4), 
;;		 -> value_menu_timeout(6), value_log_entries(6), STR_273(1), STR_272(1), 
;;		 -> STR_271(1), STR_268(5), value_clock_display(10), STR_266(9), 
;;		 -> STR_265(6), STR_264(6), value_end_runtime(10), value_clock_enable(10), 
;;		 -> STR_237(6), menu_update_edit_value@value_buf(10), value_no_flow_bp(10), STR_220(4), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), STR_215(4), 
;;		 -> STR_214(2), value_flow_units(10), STR_213(9), STR_212(6), 
;;		 -> STR_211(6), value_rlylow(10), STR_210(5), STR_209(5), 
;;		 -> STR_208(8), STR_207(7), value_flow_type(10), STR_206(5), 
;;		 -> STR_205(5), STR_204(5), STR_203(9), STR_202(6), 
;;		 -> STR_201(6), value_high_tbp(10), value_high_temp(10), STR_196(5), 
;;		 -> value_back(5), STR_195(5), STR_194(5), value_display(10), 
;;		 -> STR_193(9), STR_192(6), STR_191(6), value_rlyslp(10), 
;;		 -> STR_190(9), STR_189(6), STR_188(6), value_rlyplp(10), 
;;		 -> STR_187(9), STR_186(6), STR_185(6), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), STR_177(9), 
;;		 -> value_sensor(12), value_enable(10), value_relay_pulse(10), NULL(0), 
;;		 -> STR_79(1), STR_78(1), STR_77(9), STR_76(6), 
;;		 -> STR_75(6), STR_74(1), STR_73(1), STR_72(1), 
;;		 -> STR_71(5), STR_70(5), STR_69(1), STR_68(1), 
;;		 -> STR_67(1), STR_66(4), STR_65(2), STR_64(1), 
;;		 -> STR_63(1), STR_62(1), STR_61(5), STR_60(4), 
;;		 -> STR_59(1), STR_58(1), STR_57(1), STR_56(8), 
;;		 -> STR_55(7), STR_54(1), STR_53(1), STR_52(5), 
;;		 -> STR_51(5), STR_50(9), STR_49(1), STR_48(1), 
;;		 -> STR_47(1), STR_46(8), STR_45(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   19[COMRAM] PTR unsigned char 
;;		 -> original_value(10), menu_draw_utility@value_buf(15), menu_draw_clock@value_buf(15), STR_274(1), 
;;		 -> value_pwr_fail(6), value_brightness(4), value_contrast(4), value_menu_timeout(6), 
;;		 -> value_log_entries(6), STR_273(1), STR_272(1), STR_271(1), 
;;		 -> value_clock_display(10), value_end_runtime(10), value_clock_enable(10), menu_draw_input@value_buf(15), 
;;		 -> menu_update_edit_value@display_buf(10), value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), 
;;		 -> value_low_flow(10), value_flow_units(10), value_rlylow(10), value_flow_type(10), 
;;		 -> value_high_tbp(10), value_high_temp(10), value_back(5), value_display(10), 
;;		 -> value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), value_sensor(12), value_enable(10), 
;;		 -> value_relay_pulse(10), NULL(0), 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] PTR unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 0/3
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        7 bytes
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
;;		_menu_draw_utility
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text31,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
global __ptext31
__ptext31:
psect	text31
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
	
_strcpy:
;incstack = 0
	callstack 26
	line	18
	
l11663:
		movff	(c:strcpy@to),(c:strcpy@cp)
	movff	(c:strcpy@to+1),(c:strcpy@cp+1)

	line	19
	goto	l11667
	line	20
	
l11665:
	infsnz	((c:strcpy@cp))^00h,c
	incf	((c:strcpy@cp+1))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l11667:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14867
	tblrd	*
	
	movf	tablat,w
	bra	u14860
u14867:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u14860:
	movff	(c:strcpy@cp),tblptrl
	movff	(c:strcpy@cp+1),tblptrh
	clrf	tblptru
	
	movwf	(??_strcpy+0+0)^00h,c
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14877
	movff	??_strcpy+0+0,tablat
	tblwt*
	bra	u14870
u14877:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	??_strcpy+0+0,indf0
u14870:
	
	movf	(??_strcpy+0+0)^00h,c,w
	btfss	status,2
	goto	u14881
	goto	u14880
u14881:
	goto	l11665
u14880:
	line	24
	
l2531:
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
;;		 -> STR_274(1), value_pwr_fail(6), value_brightness(4), value_contrast(4), 
;;		 -> value_menu_timeout(6), value_log_entries(6), STR_273(1), STR_272(1), 
;;		 -> STR_271(1), value_clock_display(10), value_end_runtime(10), value_clock_enable(10), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), value_relay_pulse(10), 
;;		 -> NULL(0), 
;;  s2              2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_339(5), STR_338(6), STR_337(6), STR_336(8), 
;;		 -> STR_238(1), STR_79(1), STR_78(1), STR_77(9), 
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
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_draw_input
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text32,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
global __ptext32
__ptext32:
psect	text32
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
	
_strcmp:
;incstack = 0
	callstack 26
	line	37
	
l12261:
	goto	l12265
	line	38
	
l12263:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l12265:
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
	movff	(c:strcmp@s1),tblptrl
	movff	(c:strcmp@s1+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16127
	tblrd	*
	
	movf	tablat,w
	bra	u16120
u16127:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u16120:
	movwf	(??_strcmp+1+0)^00h,c
	movf	(??_strcmp+0+0)^00h,c,w
	subwf	((??_strcmp+1+0))^00h,c,w
	movwf	((c:strcmp@r))^00h,c
	movf	((c:strcmp@r))^00h,c,w
	btfss	status,2
	goto	u16131
	goto	u16130
u16131:
	goto	l12269
u16130:
	
l12267:
	movff	(c:strcmp@s1),tblptrl
	movff	(c:strcmp@s1+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16147
	tblrd	*
	
	movf	tablat,w
	bra	u16140
u16147:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u16140:
	iorlw	0
	btfss	status,2
	goto	u16151
	goto	u16150
u16151:
	goto	l12263
u16150:
	line	41
	
l12269:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l2525:
	return	;funcret
	callstack 0
GLOBAL	__end_of_strcmp
	__end_of_strcmp:
	signat	_strcmp,8314
	global	_lcd_print_at

;; *************** function _lcd_print_at *****************
;; Defined at:
;;		line 877 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   21[COMRAM] unsigned char 
;;  str             2   22[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_utility@value_buf(15), STR_300(2), STR_299(2), STR_298(5), 
;;		 -> STR_297(7), STR_296(10), STR_295(12), STR_294(8), 
;;		 -> STR_293(5), STR_292(14), STR_291(6), STR_290(7), 
;;		 -> STR_289(10), STR_288(11), STR_287(10), STR_286(11), 
;;		 -> STR_285(10), menu_draw_clock@value_buf(15), STR_280(6), Fake(1), 
;;		 -> STR_251(5), STR_250(5), STR_249(9), STR_248(5), 
;;		 -> STR_247(6), STR_246(1), STR_245(1), STR_244(1), 
;;		 -> menu_draw_input@value_buf(15), menu_draw_input@title(10), STR_172(2), STR_171(2), 
;;		 -> STR_170(2), STR_169(2), STR_168(6), STR_167(2), 
;;		 -> STR_166(2), STR_165(2), STR_164(2), STR_163(6), 
;;		 -> menu_update_datetime_display@time_buf(9), menu_update_datetime_display@date_buf(9), STR_140(5), STR_139(11), 
;;		 -> STR_138(11), STR_137(9), STR_136(9), STR_135(12), 
;;		 -> STR_134(10), STR_133(9), STR_132(10), STR_131(5), 
;;		 -> STR_130(8), STR_129(10), STR_128(8), STR_127(7), 
;;		 -> STR_126(5), STR_125(8), STR_124(8), STR_123(12), 
;;		 -> STR_122(9), STR_121(11), STR_120(10), STR_119(6), 
;;		 -> STR_118(5), STR_117(7), STR_116(7), STR_115(5), 
;;		 -> STR_114(8), STR_113(8), STR_112(11), STR_111(8), 
;;		 -> STR_110(5), STR_109(7), STR_108(7), STR_107(5), 
;;		 -> STR_106(8), STR_105(9), STR_104(9), STR_103(10), 
;;		 -> STR_102(11), STR_101(10), STR_100(7), STR_99(7), 
;;		 -> STR_98(5), STR_97(8), STR_96(8), STR_95(8), 
;;		 -> STR_94(9), STR_93(6), STR_92(6), STR_91(13), 
;;		 -> STR_90(9), STR_89(12), STR_88(11), STR_87(10), 
;;		 -> STR_86(7), STR_85(7), STR_84(5), STR_83(6), 
;;		 -> STR_82(13), STR_81(11), STR_80(10), 
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
;;		_menu_update_datetime_display
;;		_menu_draw_options
;;		_menu_draw_input
;;		_menu_draw_setup
;;		_menu_draw_clock
;;		_menu_draw_utility
;; This function uses a non-reentrant model
;;
psect	text33,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	877
global __ptext33
__ptext33:
psect	text33
	file	"src\menu.c"
	line	877
	
_lcd_print_at:
;incstack = 0
	callstack 23
	movwf	((c:lcd_print_at@row))^00h,c
	line	879
	
l11659:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	880
	
l11661:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	881
	
l731:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print_at
	__end_of_lcd_print_at:
	signat	_lcd_print_at,12409
	global	_lcd_clear_line

;; *************** function _lcd_clear_line *****************
;; Defined at:
;;		line 883 in file "src\menu.c"
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
;;		_menu_update_datetime_display
;;		_menu_draw_options
;;		_menu_draw_input
;;		_menu_draw_setup
;;		_menu_draw_clock
;;		_menu_draw_utility
;; This function uses a non-reentrant model
;;
psect	text34,class=CODE,space=0,reloc=2,group=0
	line	883
global __ptext34
__ptext34:
psect	text34
	file	"src\menu.c"
	line	883
	
_lcd_clear_line:
;incstack = 0
	callstack 23
	movwf	((c:lcd_clear_line@row))^00h,c
	line	885
	
l11655:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	886
	
l11657:
		movlw	low(STR_173)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_173)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	887
	
l734:
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
;;		_menu_draw_utility
;; This function uses a non-reentrant model
;;
psect	text35,class=CODE,space=0,reloc=2,group=0
	file	"src\lcd.c"
	line	129
global __ptext35
__ptext35:
psect	text35
	file	"src\lcd.c"
	line	129
	
_lcd_set_cursor:
;incstack = 0
	callstack 24
	movwf	((c:lcd_set_cursor@row))^00h,c
	line	133
	
l11351:
	goto	l11363
	line	135
	
l1561:
	line	136
	movff	(c:lcd_set_cursor@col),(c:lcd_set_cursor@addr)
	line	137
	goto	l11365
	line	139
	
l11353:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(040h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	140
	goto	l11365
	line	142
	
l11355:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(094h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	143
	goto	l11365
	line	145
	
l11357:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(0D4h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	146
	goto	l11365
	line	148
	
l11359:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	149
	goto	l11365
	line	133
	
l11363:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l1561
	xorlw	1^0	; case 1
	skipnz
	goto	l11353
	xorlw	2^1	; case 2
	skipnz
	goto	l11355
	xorlw	3^2	; case 3
	skipnz
	goto	l11357
	goto	l11359

	line	152
	
l11365:
	movf	((c:lcd_set_cursor@addr))^00h,c,w
	iorlw	low(080h)
	
	call	_lcd_cmd
	line	153
	
l1567:
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
;;		 -> STR_304(2), STR_303(2), STR_302(2), STR_301(2), 
;;		 -> menu_draw_utility@value_buf(15), STR_300(2), STR_299(2), STR_298(5), 
;;		 -> STR_297(7), STR_296(10), STR_295(12), STR_294(8), 
;;		 -> STR_293(5), STR_292(14), STR_291(6), STR_290(7), 
;;		 -> STR_289(10), STR_288(11), STR_287(10), STR_286(11), 
;;		 -> STR_285(10), STR_284(2), STR_283(2), STR_282(2), 
;;		 -> STR_281(2), menu_draw_clock@value_buf(15), STR_280(6), STR_259(2), 
;;		 -> STR_258(2), STR_257(2), STR_256(2), STR_255(2), 
;;		 -> STR_254(2), STR_253(2), STR_252(2), Fake(1), 
;;		 -> STR_251(5), STR_250(5), STR_249(9), STR_248(5), 
;;		 -> STR_247(6), STR_246(1), STR_245(1), STR_244(1), 
;;		 -> STR_243(21), STR_242(2), STR_241(2), STR_240(2), 
;;		 -> STR_239(2), menu_draw_input@value_buf(15), menu_draw_input@title(10), STR_235(2), 
;;		 -> STR_234(2), STR_233(21), STR_232(2), STR_231(2), 
;;		 -> STR_230(6), menu_update_numeric_value@value_buf(6), STR_229(2), STR_228(2), 
;;		 -> STR_227(7), menu_update_edit_value@display_buf(10), STR_173(21), STR_172(2), 
;;		 -> STR_171(2), STR_170(2), STR_169(2), STR_168(6), 
;;		 -> STR_167(2), STR_166(2), STR_165(2), STR_164(2), 
;;		 -> STR_163(6), menu_update_datetime_display@time_buf(9), menu_update_datetime_display@date_buf(9), STR_150(2), 
;;		 -> STR_149(2), STR_148(8), menu_update_time_value@value_buf(6), STR_140(5), 
;;		 -> STR_139(11), STR_138(11), STR_137(9), STR_136(9), 
;;		 -> STR_135(12), STR_134(10), STR_133(9), STR_132(10), 
;;		 -> STR_131(5), STR_130(8), STR_129(10), STR_128(8), 
;;		 -> STR_127(7), STR_126(5), STR_125(8), STR_124(8), 
;;		 -> STR_123(12), STR_122(9), STR_121(11), STR_120(10), 
;;		 -> STR_119(6), STR_118(5), STR_117(7), STR_116(7), 
;;		 -> STR_115(5), STR_114(8), STR_113(8), STR_112(11), 
;;		 -> STR_111(8), STR_110(5), STR_109(7), STR_108(7), 
;;		 -> STR_107(5), STR_106(8), STR_105(9), STR_104(9), 
;;		 -> STR_103(10), STR_102(11), STR_101(10), STR_100(7), 
;;		 -> STR_99(7), STR_98(5), STR_97(8), STR_96(8), 
;;		 -> STR_95(8), STR_94(9), STR_93(6), STR_92(6), 
;;		 -> STR_91(13), STR_90(9), STR_89(12), STR_88(11), 
;;		 -> STR_87(10), STR_86(7), STR_85(7), STR_84(5), 
;;		 -> STR_83(6), STR_82(13), STR_81(11), STR_80(10), 
;;		 -> STR_41(8), STR_40(12), STR_35(6), STR_34(12), 
;;		 -> STR_18(16), STR_17(13), 
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
;;		_menu_draw_utility
;; This function uses a non-reentrant model
;;
psect	text36,class=CODE,space=0,reloc=2,group=0
	line	156
global __ptext36
__ptext36:
psect	text36
	file	"src\lcd.c"
	line	156
	
_lcd_print:
;incstack = 0
	callstack 23
	line	158
	
l11367:
	goto	l11373
	line	160
	
l11369:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14287
	tblrd	*
	
	movf	tablat,w
	bra	u14280
u14287:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u14280:
	
	call	_lcd_data
	
l11371:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	158
	
l11373:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14297
	tblrd	*
	
	movf	tablat,w
	bra	u14290
u14297:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u14290:
	iorlw	0
	btfss	status,2
	goto	u14301
	goto	u14300
u14301:
	goto	l11369
u14300:
	line	162
	
l1573:
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
psect	text37,class=CODE,space=0,reloc=2,group=0
	line	48
global __ptext37
__ptext37:
psect	text37
	file	"src\lcd.c"
	line	48
	
_lcd_data:
;incstack = 0
	callstack 23
	movwf	((c:lcd_data@data))^00h,c
	line	51
	
l11321:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	52
	
l11323:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	53
	
l11325:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	54
	
l11327:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	55
	
l11329:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	56
	
l11331:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	57
	
l11333:
	asmopt push
asmopt off
	movlw	133
u21167:
decfsz	wreg,f
	bra	u21167
	nop
asmopt pop

	line	60
	
l11335:
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	61
	
l11337:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	62
	
l11339:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	63
	
l11341:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	64
	
l11343:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	65
	
l11345:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	66
	asmopt push
asmopt off
	movlw	133
u21177:
decfsz	wreg,f
	bra	u21177
	nop
asmopt pop

	line	67
	
l1554:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
	signat	_lcd_data,4217
	global	_is_time_field

;; *************** function _is_time_field *****************
;; Defined at:
;;		line 253 in file "src\menu.c"
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
psect	text38,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	253
global __ptext38
__ptext38:
psect	text38
	file	"src\menu.c"
	line	253
	
_is_time_field:
;incstack = 0
	callstack 27
	movwf	((c:is_time_field@line))^00h,c
	line	255
	
l11771:
	movf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15091
	goto	u15090
u15091:
	goto	l11787
u15090:
	line	258
	
l11773:
	movlw	low(01h)
	movwf	((c:_is_time_field$1237))^00h,c
	
l11775:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u15101
	goto	u15100

u15101:
	goto	l527
u15100:
	
l11777:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u15111
	goto	u15110

u15111:
	goto	l527
u15110:
	
l11779:
		movlw	8
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u15121
	goto	u15120

u15121:
	goto	l527
u15120:
	
l11781:
	movlw	low(0)
	movwf	((c:_is_time_field$1237))^00h,c
	
l527:
	movf	((c:_is_time_field$1237))^00h,c,w
	goto	l528
	line	260
	
l11787:
		decf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15131
	goto	u15130

u15131:
	goto	l11795
u15130:
	line	263
	
l11789:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u15141
	goto	u15140

u15141:
	movlw	1
	goto	u15150
u15140:
	movlw	0
u15150:
	goto	l528
	line	265
	
l11795:
		movlw	2
	xorwf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15161
	goto	u15160

u15161:
	goto	l11809
u15160:
	line	267
	
l11797:
	movf	((c:is_time_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u15171
	goto	u15170
u15171:
	goto	l11805
u15170:
	line	270
	
l11799:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u15181
	goto	u15180

u15181:
	movlw	1
	goto	u15190
u15180:
	movlw	0
u15190:
	goto	l528
	line	275
	
l11805:
		movlw	4
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u15201
	goto	u15200

u15201:
	movlw	1
	goto	u15210
u15200:
	movlw	0
u15210:
	goto	l528
	line	279
	
l11809:
	movlw	(0)&0ffh
	line	280
	
l528:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_time_field
	__end_of_is_time_field:
	signat	_is_time_field,12409
	global	_is_option_field

;; *************** function _is_option_field *****************
;; Defined at:
;;		line 285 in file "src\menu.c"
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
psect	text39,class=CODE,space=0,reloc=2,group=0
	line	285
global __ptext39
__ptext39:
psect	text39
	file	"src\menu.c"
	line	285
	
_is_option_field:
;incstack = 0
	callstack 26
	movwf	((c:is_option_field@line))^00h,c
	line	288
	
l11899:
	movf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15331
	goto	u15330
u15331:
	goto	l11903
u15330:
	
l11901:
		decf	((c:is_option_field@line))^00h,c,w
	btfss	status,2
	goto	u15341
	goto	u15340

u15341:
	goto	l11907
u15340:
	line	289
	
l11903:
	movlw	(01h)&0ffh
	goto	l540
	line	291
	
l11907:
	movf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15351
	goto	u15350
u15351:
	goto	l11925
u15350:
	line	294
	
l11909:
	movlw	low(01h)
	movwf	((c:_is_option_field$1242))^00h,c
	
l11911:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15361
	goto	u15360

u15361:
	goto	l543
u15360:
	
l11913:
		movlw	10
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15371
	goto	u15370

u15371:
	goto	l543
u15370:
	
l11915:
		movlw	11
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15381
	goto	u15380

u15381:
	goto	l543
u15380:
	
l11917:
		movlw	12
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15391
	goto	u15390

u15391:
	goto	l543
u15390:
	
l11919:
	movlw	low(0)
	movwf	((c:_is_option_field$1242))^00h,c
	
l543:
	movf	((c:_is_option_field$1242))^00h,c,w
	goto	l540
	line	296
	
l11925:
		decf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15401
	goto	u15400

u15401:
	goto	l11939
u15400:
	line	299
	
l11927:
	movlw	low(01h)
	movwf	((c:_is_option_field$1243))^00h,c
	
l11929:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15411
	goto	u15410

u15411:
	goto	l547
u15410:
	
l11931:
		movlw	7
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15421
	goto	u15420

u15421:
	goto	l547
u15420:
	
l11933:
	movlw	low(0)
	movwf	((c:_is_option_field$1243))^00h,c
	
l547:
	movf	((c:_is_option_field$1243))^00h,c,w
	goto	l540
	line	301
	
l11939:
		movlw	2
	xorwf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15431
	goto	u15430

u15431:
	goto	l11973
u15430:
	line	303
	
l11941:
	movf	((c:is_option_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u15441
	goto	u15440
u15441:
	goto	l11959
u15440:
	line	306
	
l11943:
	movlw	low(01h)
	movwf	((c:_is_option_field$1244))^00h,c
	
l11945:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15451
	goto	u15450

u15451:
	goto	l552
u15450:
	
l11947:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15461
	goto	u15460

u15461:
	goto	l552
u15460:
	
l11949:
		movlw	8
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15471
	goto	u15470

u15471:
	goto	l552
u15470:
	
l11951:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15481
	goto	u15480

u15481:
	goto	l552
u15480:
	
l11953:
	movlw	low(0)
	movwf	((c:_is_option_field$1244))^00h,c
	
l552:
	movf	((c:_is_option_field$1244))^00h,c,w
	goto	l540
	line	311
	
l11959:
	movlw	low(01h)
	movwf	((c:_is_option_field$1245))^00h,c
	
l11961:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15491
	goto	u15490

u15491:
	goto	l555
u15490:
	
l11963:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15501
	goto	u15500

u15501:
	goto	l555
u15500:
	
l11965:
		movlw	5
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15511
	goto	u15510

u15511:
	goto	l555
u15510:
	
l11967:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15521
	goto	u15520

u15521:
	goto	l555
u15520:
	
l11969:
	movlw	low(0)
	movwf	((c:_is_option_field$1245))^00h,c
	
l555:
	movf	((c:_is_option_field$1245))^00h,c,w
	goto	l540
	line	315
	
l11973:
	movlw	(0)&0ffh
	line	316
	
l540:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_option_field
	__end_of_is_option_field:
	signat	_is_option_field,12409
	global	_is_numeric_field

;; *************** function _is_numeric_field *****************
;; Defined at:
;;		line 221 in file "src\menu.c"
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
psect	text40,class=CODE,space=0,reloc=2,group=0
	line	221
global __ptext40
__ptext40:
psect	text40
	file	"src\menu.c"
	line	221
	
_is_numeric_field:
;incstack = 0
	callstack 27
	movwf	((c:is_numeric_field@line))^00h,c
	line	223
	
l11711:
	movf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u14951
	goto	u14950
u14951:
	goto	l11729
u14950:
	line	226
	
l11713:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1230))^00h,c
	
l11715:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u14961
	goto	u14960

u14961:
	goto	l511
u14960:
	
l11717:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u14971
	goto	u14970

u14971:
	goto	l511
u14970:
	
l11719:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u14981
	goto	u14980

u14981:
	goto	l511
u14980:
	
l11721:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u14991
	goto	u14990

u14991:
	goto	l511
u14990:
	
l11723:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1230))^00h,c
	
l511:
	movf	((c:_is_numeric_field$1230))^00h,c,w
	goto	l512
	line	228
	
l11729:
		decf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15001
	goto	u15000

u15001:
	goto	l11745
u15000:
	line	231
	
l11731:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1231))^00h,c
	
l11733:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u15011
	goto	u15010

u15011:
	goto	l516
u15010:
	
l11735:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u15021
	goto	u15020

u15021:
	goto	l516
u15020:
	
l11737:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u15031
	goto	u15030

u15031:
	goto	l516
u15030:
	
l11739:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1231))^00h,c
	
l516:
	movf	((c:_is_numeric_field$1231))^00h,c,w
	goto	l512
	line	233
	
l11745:
		movlw	2
	xorwf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15041
	goto	u15040

u15041:
	goto	l11763
u15040:
	line	235
	
l11747:
	movf	((c:is_numeric_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u15051
	goto	u15050
u15051:
	goto	l11763
u15050:
	line	238
	
l11749:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1232))^00h,c
	
l11751:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u15061
	goto	u15060

u15061:
	goto	l521
u15060:
	
l11753:
		movlw	5
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u15071
	goto	u15070

u15071:
	goto	l521
u15070:
	
l11755:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u15081
	goto	u15080

u15081:
	goto	l521
u15080:
	
l11757:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1232))^00h,c
	
l521:
	movf	((c:_is_numeric_field$1232))^00h,c,w
	goto	l512
	line	243
	
l11763:
	movlw	(0)&0ffh
	line	248
	
l512:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_numeric_field
	__end_of_is_numeric_field:
	signat	_is_numeric_field,12409
	global	_get_option_edit_flag

;; *************** function _get_option_edit_flag *****************
;; Defined at:
;;		line 322 in file "src\menu.c"
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
psect	text41,class=CODE,space=0,reloc=2,group=0
	line	322
global __ptext41
__ptext41:
psect	text41
	file	"src\menu.c"
	line	322
	
_get_option_edit_flag:
;incstack = 0
	callstack 26
	movwf	((c:get_option_edit_flag@line))^00h,c
	line	325
	
l11977:
	movf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15531
	goto	u15530
u15531:
	goto	l11983
u15530:
	line	326
	
l11979:
		movlw	low(_enable_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	327
	
l11983:
		decf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15541
	goto	u15540

u15541:
	goto	l11989
u15540:
	line	328
	
l11985:
		movlw	low(_sensor_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	331
	
l11989:
	movf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15551
	goto	u15550
u15551:
	goto	l12015
u15550:
	line	333
	
l11991:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15561
	goto	u15560

u15561:
	goto	l11997
u15560:
	line	334
	
l11993:
		movlw	low(_relay_high_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	335
	
l11997:
		movlw	10
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15571
	goto	u15570

u15571:
	goto	l12003
u15570:
	line	336
	
l11999:
		movlw	low(_relay_plp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	337
	
l12003:
		movlw	11
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15581
	goto	u15580

u15581:
	goto	l12009
u15580:
	line	338
	
l12005:
		movlw	low(_relay_slp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	339
	
l12009:
		movlw	12
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15591
	goto	u15590

u15591:
	goto	l12075
u15590:
	line	340
	
l12011:
		movlw	low(_display_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	343
	
l12015:
		decf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15601
	goto	u15600

u15601:
	goto	l12029
u15600:
	line	345
	
l12017:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15611
	goto	u15610

u15611:
	goto	l12023
u15610:
	goto	l11993
	line	347
	
l12023:
		movlw	7
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15621
	goto	u15620

u15621:
	goto	l12075
u15620:
	goto	l12011
	line	351
	
l12029:
		movlw	2
	xorwf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15631
	goto	u15630

u15631:
	goto	l12075
u15630:
	line	353
	
l12031:
		movlw	2
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15641
	goto	u15640

u15641:
	goto	l12037
u15640:
	line	354
	
l12033:
		movlw	low(_flow_type_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	356
	
l12037:
	movf	((c:get_option_edit_flag@flow_type))^00h,c,w
	btfss	status,2
	goto	u15651
	goto	u15650
u15651:
	goto	l12057
u15650:
	line	358
	
l12039:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15661
	goto	u15660

u15661:
	goto	l12045
u15660:
	line	359
	
l12041:
		movlw	low(_flow_units_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	360
	
l12045:
		movlw	8
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15671
	goto	u15670

u15671:
	goto	l12051
u15670:
	line	361
	
l12047:
		movlw	low(_relay_low_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	362
	
l12051:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15681
	goto	u15680

u15681:
	goto	l12075
u15680:
	goto	l12011
	line	367
	
l12057:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15691
	goto	u15690

u15691:
	goto	l12063
u15690:
	line	368
	
l12059:
		movlw	low(_no_flow_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	369
	
l12063:
		movlw	5
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15701
	goto	u15700

u15701:
	goto	l12069
u15700:
	goto	l12047
	line	371
	
l12069:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15711
	goto	u15710

u15711:
	goto	l12075
u15710:
	goto	l12011
	line	376
	
l12075:
		movlw	low(0)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(0)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	line	377
	
l559:
	return	;funcret
	callstack 0
GLOBAL	__end_of_get_option_edit_flag
	__end_of_get_option_edit_flag:
	signat	_get_option_edit_flag,12410
	global	_get_item_options_for_field

;; *************** function _get_item_options_for_field *****************
;; Defined at:
;;		line 383 in file "src\menu.c"
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
psect	text42,class=CODE,space=0,reloc=2,group=0
	line	383
global __ptext42
__ptext42:
psect	text42
	file	"src\menu.c"
	line	383
	
_get_item_options_for_field:
;incstack = 0
	callstack 26
	movwf	((c:get_item_options_for_field@line))^00h,c
	line	386
	
l12079:
	movf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15721
	goto	u15720
u15721:
	goto	l12085
u15720:
	line	387
	
l12081:
		movlw	low(_menu_item_options)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l584
	line	388
	
l12085:
		decf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15731
	goto	u15730

u15731:
	goto	l12091
u15730:
	line	389
	
l12087:
		movlw	low(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l584
	line	392
	
l12091:
	movf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15741
	goto	u15740
u15741:
	goto	l12109
u15740:
	line	394
	
l12093:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u15751
	goto	u15750

u15751:
	goto	l12099
u15750:
	
l12095:
		movlw	10
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u15761
	goto	u15760

u15761:
	goto	l12099
u15760:
	
l12097:
		movlw	11
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15771
	goto	u15770

u15771:
	goto	l12103
u15770:
	line	395
	
l12099:
		movlw	low(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l584
	line	396
	
l12103:
		movlw	12
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15781
	goto	u15780

u15781:
	goto	l12169
u15780:
	line	397
	
l12105:
		movlw	low(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l584
	line	400
	
l12109:
		decf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15791
	goto	u15790

u15791:
	goto	l12123
u15790:
	line	402
	
l12111:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15801
	goto	u15800

u15801:
	goto	l12117
u15800:
	goto	l12099
	line	404
	
l12117:
		movlw	7
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15811
	goto	u15810

u15811:
	goto	l12169
u15810:
	goto	l12105
	line	408
	
l12123:
		movlw	2
	xorwf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15821
	goto	u15820

u15821:
	goto	l12169
u15820:
	line	410
	
l12125:
		movlw	2
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15831
	goto	u15830

u15831:
	goto	l12131
u15830:
	line	411
	
l12127:
		movlw	low(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l584
	line	413
	
l12131:
	movf	((c:get_item_options_for_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u15841
	goto	u15840
u15841:
	goto	l12151
u15840:
	line	415
	
l12133:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15851
	goto	u15850

u15851:
	goto	l12139
u15850:
	line	416
	
l12135:
		movlw	low(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l584
	line	417
	
l12139:
		movlw	8
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15861
	goto	u15860

u15861:
	goto	l12145
u15860:
	goto	l12099
	line	419
	
l12145:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15871
	goto	u15870

u15871:
	goto	l12169
u15870:
	goto	l12105
	line	424
	
l12151:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15881
	goto	u15880

u15881:
	goto	l12157
u15880:
	line	425
	
l12153:
		movlw	low(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l584
	line	426
	
l12157:
		movlw	5
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15891
	goto	u15890

u15891:
	goto	l12163
u15890:
	goto	l12099
	line	428
	
l12163:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15901
	goto	u15900

u15901:
	goto	l12169
u15900:
	goto	l12105
	line	433
	
l12169:
		movlw	low(0)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(0)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	line	434
	
l584:
	return	;funcret
	callstack 0
GLOBAL	__end_of_get_item_options_for_field
	__end_of_get_item_options_for_field:
	signat	_get_item_options_for_field,12410
	global	_init_time_editor

;; *************** function _init_time_editor *****************
;; Defined at:
;;		line 443 in file "src\menu.c"
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
psect	text43,class=CODE,space=0,reloc=2,group=0
	line	443
global __ptext43
__ptext43:
psect	text43
	file	"src\menu.c"
	line	443
	
_init_time_editor:
;incstack = 0
	callstack 24
	line	446
	
l12935:
	movff	(c:init_time_editor@mode),0+(_menu+010h)
	line	447
	movff	(c:init_time_editor@value_seconds),0+(_menu+014h)
	movff	(c:init_time_editor@value_seconds+1),1+(_menu+014h)
	line	450
	
l12937:
	movf	((c:init_time_editor@mode))^00h,c,w
	btfss	status,2
	goto	u17251
	goto	u17250
u17251:
	goto	l12941
u17250:
	line	452
	
l12939:
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
	line	453
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
	line	454
	goto	l12943
	line	457
	
l12941:
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
	line	458
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
	line	462
	
l12943:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+011h))&0ffh
	line	467
	
l12945:; BSR set to: 3

		movlw	low(init_time_editor@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_141)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_141)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:init_time_editor@value_seconds),0+((c:?_sprintf)+04h)
	movff	(c:init_time_editor@value_seconds+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+012h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	468
	
l12947:
		movlw	low(init_time_editor@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	469
	
l610:
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
;;		 -> rtc_read_time@debug_buf(80), menu_handle_button@buf_1747(50), menu_handle_button@buf_1738(50), menu_handle_button@buf_1728(50), 
;;		 -> menu_handle_button@buf_1703(50), menu_handle_button@buf(50), menu_handle_encoder@buf_1670(50), menu_handle_encoder@buf_1667(50), 
;;		 -> menu_handle_encoder@buf(50), STR_274(1), value_pwr_fail(6), value_brightness(4), 
;;		 -> value_contrast(4), value_menu_timeout(6), value_log_entries(6), STR_273(1), 
;;		 -> STR_272(1), STR_271(1), value_clock_display(10), value_end_runtime(10), 
;;		 -> value_clock_enable(10), rebuild_clock_menu@buf(50), menu_draw_input@title(10), menu_update_edit_value@value_buf(10), 
;;		 -> handle_numeric_rotation@buf(50), rebuild_input_menu@buf(50), value_no_flow_bp(10), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), value_rlylow(10), 
;;		 -> value_flow_type(10), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), menu_update_datetime_display@time_buf(9), menu_update_datetime_display@date_buf(9), init_datetime_editor@buf(80), 
;;		 -> menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), value_relay_pulse(10), handle_time_rotation@buf(50), 
;;		 -> init_time_editor@buf(60), NULL(0), main@buf_705(30), main@buf_678(40), 
;;		 -> main@buf_675(60), main@buf_670(50), main@time_buf(60), main@buf_636(30), 
;;		 -> main@buf(50), trigger_relay_pulse@buf(60), 
;;  f               2   28[COMRAM] PTR const unsigned char 
;;		 -> STR_342(40), STR_341(28), STR_334(32), STR_333(38), 
;;		 -> STR_332(5), STR_331(6), STR_330(6), STR_329(5), 
;;		 -> STR_328(6), STR_327(6), STR_326(5), STR_325(5), 
;;		 -> STR_324(6), STR_323(6), STR_321(10), STR_320(26), 
;;		 -> STR_319(42), STR_318(32), STR_317(10), STR_316(10), 
;;		 -> STR_315(26), STR_314(28), STR_313(25), STR_312(20), 
;;		 -> STR_311(26), STR_310(35), STR_309(28), STR_308(37), 
;;		 -> STR_307(32), STR_306(23), STR_305(37), STR_279(10), 
;;		 -> STR_278(3), STR_277(3), STR_276(10), STR_275(3), 
;;		 -> STR_270(29), STR_269(46), STR_267(10), STR_261(3), 
;;		 -> STR_260(35), STR_236(9), STR_226(9), STR_225(7), 
;;		 -> STR_224(29), STR_222(48), STR_221(10), STR_219(10), 
;;		 -> STR_218(5), STR_217(6), STR_216(6), STR_200(10), 
;;		 -> STR_199(3), STR_198(6), STR_197(6), STR_184(10), 
;;		 -> STR_183(10), STR_182(5), STR_181(10), STR_180(5), 
;;		 -> STR_179(6), STR_178(6), STR_174(3), STR_162(15), 
;;		 -> STR_161(15), STR_160(13), STR_159(13), STR_158(13), 
;;		 -> STR_157(15), STR_156(15), STR_155(13), STR_154(13), 
;;		 -> STR_153(13), STR_151(47), STR_147(27), STR_146(51), 
;;		 -> STR_145(3), STR_144(25), STR_143(45), STR_141(35), 
;;		 -> STR_30(17), STR_29(23), STR_28(35), STR_27(17), 
;;		 -> STR_25(37), STR_14(28), STR_6(39), STR_3(27), 
;;		 -> STR_1(48), 
;; Auto vars:     Size  Location     Type
;;  idx             1   47[COMRAM] unsigned char 
;;  tmpval          4    0        struct .
;;  width           2   60[COMRAM] int 
;;  val             2   58[COMRAM] unsigned int 
;;  len             2   55[COMRAM] unsigned int 
;;  cp              2   53[COMRAM] PTR const unsigned char 
;;		 -> STR_354(7), sprintf@c(1), ?_sprintf(2), STR_274(1), 
;;		 -> value_pwr_fail(6), value_brightness(4), value_contrast(4), value_menu_timeout(6), 
;;		 -> value_log_entries(6), STR_273(1), STR_272(1), STR_271(1), 
;;		 -> value_clock_display(10), value_end_runtime(10), STR_263(9), STR_262(8), 
;;		 -> value_clock_enable(10), value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), 
;;		 -> value_low_flow(10), value_flow_units(10), value_rlylow(10), value_flow_type(10), 
;;		 -> value_high_tbp(10), value_high_temp(10), value_back(5), value_display(10), 
;;		 -> value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), value_sensor(12), STR_176(9), 
;;		 -> STR_175(8), value_enable(10), value_relay_pulse(10), menu_update_time_value@value_buf(6), 
;;		 -> display_edit_flag(1), relay_high_edit_flag(1), NULL(0), menu_item_options$option_count(1), 
;;		 -> STR_79(1), STR_78(1), STR_77(9), STR_76(6), 
;;		 -> STR_75(6), STR_74(1), STR_73(1), STR_72(1), 
;;		 -> STR_71(5), STR_70(5), STR_69(1), STR_68(1), 
;;		 -> STR_67(1), STR_66(4), STR_65(2), STR_64(1), 
;;		 -> STR_63(1), STR_62(1), STR_61(5), STR_60(4), 
;;		 -> STR_59(1), STR_58(1), STR_57(1), STR_56(8), 
;;		 -> STR_55(7), STR_54(1), STR_53(1), STR_52(5), 
;;		 -> STR_51(5), STR_50(9), STR_49(1), STR_48(1), 
;;		 -> STR_47(1), STR_46(8), STR_45(9), enable_edit_flag(1), 
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
;;		On entry : 0/3
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
;;		_menu_update_datetime_display
;;		_rebuild_input_menu
;;		_handle_numeric_rotation
;;		_menu_update_edit_value
;;		_menu_draw_input
;;		_rebuild_clock_menu
;;		_rebuild_utility_menu
;;		_menu_handle_encoder
;;		_menu_handle_button
;;		_rtc_read_time
;; This function uses a non-reentrant model
;;
psect	text44,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
global __ptext44
__ptext44:
psect	text44
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
	
_sprintf:
;incstack = 0
	callstack 27
	line	550
	
l11439:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l11649
	line	555
	
l11441:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u14421
	goto	u14420

u14421:
	goto	l11447
u14420:
	line	558
	
l11443:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14437
	movff	(c:sprintf@c),tablat
	tblwt*
	bra	u14430
u14437:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:sprintf@c),indf0
u14430:
	
	
l11445:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l11649
	line	563
	
l11447:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	565
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	goto	l11457
	line	578
	
l11449:
	bsf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	579
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	580
	goto	l11457
	line	585
	
l11451:
	bsf	(0+(1/8)+(c:sprintf@flag))^00h,c,(1)&7
	line	586
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	587
	goto	l11457
	line	597
	
l11453:
	bsf	(0+(2/8)+(c:sprintf@flag))^00h,c,(2)&7
	line	598
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	568
	
l11457:
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
	goto	l11449
	xorlw	43^32	; case 43
	skipnz
	goto	l11451
	xorlw	48^43	; case 48
	skipnz
	goto	l11453
	goto	l1766

	line	603
	
l1766:
	line	606
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u14441
	goto	u14440
u14441:
	goto	l11461
u14440:
	line	607
	
l11459:
	bcf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	614
	
l11461:
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
	goto	u14451
	goto	u14450
u14451:
	goto	l11521
u14450:
	line	615
	
l11463:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	617
	
l11465:
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
	
l11467:
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

	
l11469:
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	619
	
l11471:
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
	goto	u14461
	goto	u14460
u14461:
	goto	l11465
u14460:
	goto	l11521
	line	747
	
l11473:
	bsf	(0+(7/8)+(c:sprintf@flag))^00h,c,(7)&7
	line	749
	goto	l11523
	line	760
	
l11475:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l11477:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l11479:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u14471
	goto	u14470

u14471:
	goto	l11483
u14470:
	line	767
	
l11481:
		movlw	low(STR_354)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_354)
	movwf	((c:sprintf@cp+1))^00h,c

	line	771
	
l11483:
	movlw	high(0)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@len))^00h,c
	line	772
	goto	l11487
	line	773
	
l11485:
	infsnz	((c:sprintf@len))^00h,c
	incf	((c:sprintf@len+1))^00h,c
	line	772
	
l11487:
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
	bra	u14487
	tblrd	*
	
	movf	tablat,w
	bra	u14480
u14487:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u14480:
	iorlw	0
	btfss	status,2
	goto	u14491
	goto	u14490
u14491:
	goto	l11485
u14490:
	line	783
	
l11489:
		movf	((c:sprintf@width))^00h,c,w
	subwf	((c:sprintf@len))^00h,c,w
	movf	((c:sprintf@width+1))^00h,c,w
	subwfb	((c:sprintf@len+1))^00h,c,w
	btfsc	status,0
	goto	u14501
	goto	u14500

u14501:
	goto	l11493
u14500:
	line	784
	
l11491:
	movf	((c:sprintf@len))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	subwfb	((c:sprintf@width+1))^00h,c

	goto	l11499
	line	786
	
l11493:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	goto	l11499
	line	791
	
l11495:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14517
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u14510
u14517:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u14510:
	
	
l11497:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	790
	
l11499:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
		incf	((c:sprintf@width))^00h,c,w
	bnz	u14521
	incf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u14521
	goto	u14520

u14521:
	goto	l11495
u14520:
	goto	l11507
	line	794
	
l11501:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14537
	tblrd	*
	
	movf	tablat,w
	bra	u14530
u14537:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u14530:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movwf	(??_sprintf+0+0)^00h,c
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14547
	movff	??_sprintf+0+0,tablat
	tblwt*
	bra	u14540
u14547:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	??_sprintf+0+0,indf0
u14540:
	
	
l11503:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l11505:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	793
	
l11507:
	decf	((c:sprintf@len))^00h,c
	btfss	status,0
	decf	((c:sprintf@len+1))^00h,c
		incf	((c:sprintf@len))^00h,c,w
	bnz	u14551
	incf	((c:sprintf@len+1))^00h,c,w
	btfss	status,2
	goto	u14551
	goto	u14550

u14551:
	goto	l11501
u14550:
	goto	l11649
	line	825
	
l11509:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:sprintf@c))^00h,c
	
l11511:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	831
	
l11513:
		movlw	low(sprintf@c)
	movwf	((c:sprintf@cp))^00h,c
	clrf	((c:sprintf@cp+1))^00h,c

	line	832
	
l11515:
	movlw	high(01h)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(01h)
	movwf	((c:sprintf@len))^00h,c
	line	833
	goto	l11489
	line	844
	
l11517:
	movlw	(0C0h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	845
	goto	l11523
	line	661
	
l11521:
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
	goto	l11651
	xorlw	88^0	; case 88
	skipnz
	goto	l11473
	xorlw	99^88	; case 99
	skipnz
	goto	l11509
	xorlw	100^99	; case 100
	skipnz
	goto	l11523
	xorlw	105^100	; case 105
	skipnz
	goto	l11523
	xorlw	115^105	; case 115
	skipnz
	goto	l11475
	xorlw	117^115	; case 117
	skipnz
	goto	l11517
	xorlw	120^117	; case 120
	skipnz
	goto	l11473
	goto	l11513

	line	1277
	
l11523:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	0C0h
	andwf	(??_sprintf+0+0)^00h,c
	btfss	status,2
	goto	u14561
	goto	u14560
u14561:
	goto	l11535
u14560:
	line	1285
	
l11525:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l11527:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l11529:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u14570
	goto	u14571

u14571:
	goto	l11569
u14570:
	line	1288
	
l11531:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l11533:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	goto	l11569
	line	1312
	
l11535:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l11537:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	goto	l11569
	line	1331
	
l11539:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l11541:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u14581
	goto	u14580

u14581:
	goto	l11545
u14580:
	goto	l11571
	line	1332
	
l11545:
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
	goto	u14591
	goto	u14590

u14591:
	goto	l11549
u14590:
	goto	l11571
	line	1331
	
l11549:
	incf	((c:sprintf@c))^00h,c
	goto	l11541
	line	1342
	
l11553:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l11555:
		movlw	4
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u14601
	goto	u14600

u14601:
	goto	l11559
u14600:
	goto	l11571
	line	1343
	
l11559:
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
	goto	u14611
	goto	u14610

u14611:
	goto	l11563
u14610:
	goto	l11571
	line	1342
	
l11563:
	incf	((c:sprintf@c))^00h,c
	goto	l11555
	line	1320
	
l11569:
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
	goto	l11539
	xorlw	128^0	; case 128
	skipnz
	goto	l11553
	xorlw	192^128	; case 192
	skipnz
	goto	l11539
	goto	l11571

	line	1371
	
l11571:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u14621
	goto	u14620

u14621:
	goto	l11577
u14620:
	
l11573:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u14631
	goto	u14630
u14631:
	goto	l11577
u14630:
	line	1372
	
l11575:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	line	1407
	
l11577:
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
	goto	u14641
	goto	u14640

u14641:
	goto	l11581
u14640:
	line	1408
	
l11579:
	movf	((c:sprintf@c))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movlw	0
	subwfb	((c:sprintf@width+1))^00h,c
	goto	l11583
	line	1410
	
l11581:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	1413
	
l11583:
	
	btfss	((c:sprintf@flag))^00h,c,(2)&7
	goto	u14651
	goto	u14650
u14651:
	goto	l11609
u14650:
	line	1415
	
l11585:
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u14661
	goto	u14660
u14661:
	goto	l1814
u14660:
	line	1416
	
l11587:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u14671
	goto	u14670
u14671:
	goto	l11591
u14670:
	
l11589:
	movlw	high(02Bh)
	movwf	((c:_sprintf$2470+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$2470))^00h,c
	goto	l11593
	
l11591:
	movlw	high(02Dh)
	movwf	((c:_sprintf$2470+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$2470))^00h,c
	
l11593:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14687
	movff	(c:_sprintf$2470),tablat
	tblwt*
	bra	u14680
u14687:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:_sprintf$2470),indf0
u14680:
	
	
l11595:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l11601
	line	1422
	
l1814:
	line	1425
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u14691
	goto	u14690
u14691:
	goto	l11601
u14690:
	line	1426
	
l11597:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14707
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u14700
u14707:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u14700:
	
	goto	l11595
	line	1441
	
l11601:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u14711
	goto	u14710

u14711:
	goto	l11631
u14710:
	line	1443
	
l11603:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14727
	movlw	030h
	movwf	tablat
	tblwt*
	bra	u14720
u14727:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	030h
	movwf	indf0
u14720:
	
	
l11605:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1444
	
l11607:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u14731
	goto	u14730

u14731:
	goto	l11603
u14730:
	goto	l11631
	line	1454
	
l11609:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u14741
	goto	u14740

u14741:
	goto	l1825
u14740:
	line	1456
	
l11611:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14757
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u14750
u14757:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u14750:
	
	
l11613:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1457
	
l11615:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u14761
	goto	u14760

u14761:
	goto	l11611
u14760:
	
l1825:
	line	1460
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u14771
	goto	u14770
u14771:
	goto	l1828
u14770:
	line	1461
	
l11617:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u14781
	goto	u14780
u14781:
	goto	l11621
u14780:
	
l11619:
	movlw	high(02Bh)
	movwf	((c:_sprintf$2471+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$2471))^00h,c
	goto	l11623
	
l11621:
	movlw	high(02Dh)
	movwf	((c:_sprintf$2471+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$2471))^00h,c
	
l11623:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14797
	movff	(c:_sprintf$2471),tablat
	tblwt*
	bra	u14790
u14797:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:_sprintf$2471),indf0
u14790:
	
	
l11625:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l11631
	line	1469
	
l1828:
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u14801
	goto	u14800
u14801:
	goto	l11631
u14800:
	line	1470
	
l11627:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14817
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u14810
u14817:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u14810:
	
	goto	l11625
	line	1498
	
l11631:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l11647
	line	1515
	
l11633:
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
	goto	l11643
	line	1526
	
l11635:
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
	
l11637:
	movlw	low((STR_355))
	addwf	((c:sprintf@idx))^00h,c,w
	movwf	tblptrl
	clrf	tblptrh
	movlw	high((STR_355))
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
	goto	l11643
	line	1502
	
l11641:
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
	goto	l11633
	xorlw	128^0	; case 128
	skipnz
	goto	l11635
	xorlw	192^128	; case 192
	skipnz
	goto	l11633
	goto	l11643

	line	1550
	
l11643:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14827
	movff	(c:sprintf@c),tablat
	tblwt*
	bra	u14820
u14827:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:sprintf@c),indf0
u14820:
	
	
l11645:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l11647:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u14831
	goto	u14830

u14831:
	goto	l11641
u14830:
	line	553
	
l11649:
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
	goto	u14841
	goto	u14840
u14841:
	goto	l11441
u14840:
	line	1564
	
l11651:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14857
	movlw	0
	movwf	tablat
	tblwt*
	bra	u14850
u14857:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	0
	movwf	indf0
u14850:
	
	line	1567
	
l1844:
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
;;		On entry : 0/3
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
psect	text45,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
global __ptext45
__ptext45:
psect	text45
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
	
_isdigit:
;incstack = 0
	callstack 27
	movwf	((c:isdigit@c))^00h,c
	line	14
	
l11375:
	movlw	low(0)
	movwf	((c:_isdigit$2913))^00h,c
	
l11377:
		movlw	03Ah-0
	cpfslt	((c:isdigit@c))^00h,c
	goto	u14311
	goto	u14310

u14311:
	goto	l11383
u14310:
	
l11379:
		movlw	030h-1
	cpfsgt	((c:isdigit@c))^00h,c
	goto	u14321
	goto	u14320

u14321:
	goto	l11383
u14320:
	
l11381:
	movlw	low(01h)
	movwf	((c:_isdigit$2913))^00h,c
	
l11383:
	movff	(c:_isdigit$2913),??_isdigit+0+0
	rrcf	(??_isdigit+0+0)^00h,c,w
	line	15
	
l2511:
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
;;		_main
;;		_menu_handle_button
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text46,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
global __ptext46
__ptext46:
psect	text46
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
	
___wmul:
;incstack = 0
	callstack 27
	line	37
	
l11387:
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
	
l11389:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	line	53
	
l1847:
	return	;funcret
	callstack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	_init_numeric_editor

;; *************** function _init_numeric_editor *****************
;; Defined at:
;;		line 1064 in file "src\menu.c"
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
psect	text47,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1064
global __ptext47
__ptext47:
psect	text47
	file	"src\menu.c"
	line	1064
	
_init_numeric_editor:
;incstack = 0
	callstack 26
	line	1068
	
l13239:
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
	line	1069
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
	line	1072
	
l13241:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+0Fh))&0ffh
	line	1074
	
l13243:; BSR set to: 3

	movf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17461
	goto	u17460
u17461:
	goto	l13251
u17460:
	line	1077
	
l13245:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u17471
	goto	u17470

u17471:
	goto	l13249
u17470:
	
l13247:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17481
	goto	u17480

u17481:
	goto	l13265
u17480:
	line	1078
	
l13249:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+0Fh))&0ffh
	goto	l13265
	line	1080
	
l13251:; BSR set to: 3

		decf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17491
	goto	u17490

u17491:
	goto	l13257
u17490:
	line	1083
	
l13253:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17501
	goto	u17500

u17501:
	goto	l13265
u17500:
	goto	l13249
	line	1086
	
l13257:; BSR set to: 3

		movlw	2
	xorwf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17511
	goto	u17510

u17511:
	goto	l13265
u17510:
	
l13259:; BSR set to: 3

	movf	((c:init_numeric_editor@flow_type))^00h,c,w
	btfss	status,2
	goto	u17521
	goto	u17520
u17521:
	goto	l13265
u17520:
	line	1089
	
l13261:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17531
	goto	u17530

u17531:
	goto	l13265
u17530:
	goto	l13249
	line	1094
	
l13265:; BSR set to: 3

	movff	(c:init_numeric_editor@value),0+(_menu+0Dh)
	movff	(c:init_numeric_editor@value+1),1+(_menu+0Dh)
	line	1097
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u17541
	goto	u17540
u17541:
	goto	l828
u17540:
	
l13267:; BSR set to: 3

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u17550
	goto	u17551

u17551:
	goto	l828
u17550:
	line	1098
	
l13269:; BSR set to: 3

	movlw	high(0)
	movwf	((c:init_numeric_editor@value+1))^00h,c
	movlw	low(0)
	movwf	((c:init_numeric_editor@value))^00h,c
	
l828:; BSR set to: 3

	line	1101
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u17561
	goto	u17560
u17561:
	goto	l13273
u17560:
	
l13271:; BSR set to: 3

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u17571
	goto	u17570

u17571:
	movlw	1
	goto	u17580
u17570:
	movlw	0
u17580:
	movwf	((c:_init_numeric_editor$1428))^00h,c
	clrf	((c:_init_numeric_editor$1428+1))^00h,c
	goto	l13275
	
l13273:; BSR set to: 3

	movlw	high(0)
	movwf	((c:_init_numeric_editor$1428+1))^00h,c
	movlw	low(0)
	movwf	((c:_init_numeric_editor$1428))^00h,c
	
l13275:; BSR set to: 3

	movff	(c:_init_numeric_editor$1428),0+(_menu+09h)
	line	1104
	
l13277:; BSR set to: 3

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u17591
	goto	u17590

u17591:
	goto	l834
u17590:
	
l13279:; BSR set to: 3

	movff	(c:init_numeric_editor@value),(c:init_numeric_editor@abs_val)
	movff	(c:init_numeric_editor@value+1),(c:init_numeric_editor@abs_val+1)
	goto	l13281
	
l834:; BSR set to: 3

	movff	(c:init_numeric_editor@value),??_init_numeric_editor+0+0
	movff	(c:init_numeric_editor@value+1),??_init_numeric_editor+0+0+1
	comf	(??_init_numeric_editor+0+0)^00h,c
	comf	(??_init_numeric_editor+0+1)^00h,c
	infsnz	(??_init_numeric_editor+0+0)^00h,c
	incf	(??_init_numeric_editor+0+1)^00h,c
	movff	??_init_numeric_editor+0+0,(c:init_numeric_editor@abs_val)
	movff	??_init_numeric_editor+0+1,(c:init_numeric_editor@abs_val+1)
	line	1105
	
l13281:; BSR set to: 3

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
	line	1106
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
	line	1107
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
	line	1110
	
l13283:; BSR set to: 3

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u17601
	goto	u17600
u17601:
	movlw	1
	goto	u17610
u17600:
	movlw	0
u17610:
	movwf	(0+(_menu+08h))&0ffh
	line	1111
	
l837:; BSR set to: 3

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
;;		On entry : 0/4
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
;;		_rebuild_utility_menu
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text48,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext48
__ptext48:
psect	text48
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
___lwmod:; BSR set to: 3

;incstack = 0
	callstack 27
	line	12
	
l11415:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u14361
	goto	u14360

u14361:
	goto	l2336
u14360:
	line	13
	
l11417:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l11421
	line	15
	
l11419:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l11421:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u14371
	goto	u14370
u14371:
	goto	l11419
u14370:
	line	19
	
l11423:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u14381
	goto	u14380

u14381:
	goto	l11427
u14380:
	line	20
	
l11425:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l11427:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l11429:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l11423
	line	23
	
l2336:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l2343:
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
;;		On entry : 0/4
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
;;		_rebuild_utility_menu
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text49,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
global __ptext49
__ptext49:
psect	text49
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
	
___lwdiv:
;incstack = 0
	callstack 27
	line	13
	
l11393:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l11395:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u14331
	goto	u14330

u14331:
	goto	l2326
u14330:
	line	15
	
l11397:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l11401
	line	17
	
l11399:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l11401:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u14341
	goto	u14340
u14341:
	goto	l11399
u14340:
	line	21
	
l11403:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l11405:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u14351
	goto	u14350

u14351:
	goto	l11411
u14350:
	line	23
	
l11407:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l11409:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l11411:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l11413:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l11403
	line	28
	
l2326:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l2333:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_get_current_numeric_value

;; *************** function _get_current_numeric_value *****************
;; Defined at:
;;		line 1113 in file "src\menu.c"
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
psect	text50,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1113
global __ptext50
__ptext50:
psect	text50
	file	"src\menu.c"
	line	1113
	
_get_current_numeric_value:
;incstack = 0
	callstack 27
	line	1115
	
l13285:; BSR set to: 3

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
	line	1116
	
l13287:; BSR set to: 3

	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u17621
	goto	u17620
u17621:
	goto	l13291
u17620:
	line	1117
	
l13289:; BSR set to: 3

	negf	((c:get_current_numeric_value@value))^00h,c
	comf	((c:get_current_numeric_value@value+1))^00h,c
	btfsc	status,0
	incf	((c:get_current_numeric_value@value+1))^00h,c
	line	1118
	
l13291:; BSR set to: 3

	movff	(c:get_current_numeric_value@value),(c:?_get_current_numeric_value)
	movff	(c:get_current_numeric_value@value+1),(c:?_get_current_numeric_value+1)
	line	1119
	
l841:; BSR set to: 3

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
psect	text51,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	162
global __ptext51
__ptext51:
psect	text51
	file	"src\main.c"
	line	162
	
_beep:; BSR set to: 3

;incstack = 0
	callstack 27
	line	164
	
l12431:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	165
	
l12433:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l159
	line	167
	
l12435:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u21187:
decfsz	wreg,f
	bra	u21187
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u21187
	nop2
asmopt pop

	line	165
	
l12437:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l159:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u16341
	goto	u16340

u16341:
	goto	l12435
u16340:
	
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
psect	text52,class=CODE,space=0,reloc=2,group=0
	file	"src\lcd.c"
	line	70
global __ptext52
__ptext52:
psect	text52
	file	"src\lcd.c"
	line	70
	
_lcd_init:
;incstack = 0
	callstack 26
	line	73
	
l13839:; BSR set to: 3

	movlw	(0F0h)&0ffh
	andwf	((c:3986))^0f00h,c	;volatile
	line	74
	
l13841:; BSR set to: 3

	bcf	((c:3986))^0f00h,c,5	;volatile
	line	75
	
l13843:; BSR set to: 3

	bcf	((c:3986))^0f00h,c,6	;volatile
	line	76
	
l13845:; BSR set to: 3

	bcf	((c:3986))^0f00h,c,7	;volatile
	line	79
	
l13847:; BSR set to: 3

	bcf	((c:3977))^0f00h,c,6	;volatile
	line	80
	
l13849:; BSR set to: 3

	bcf	((c:3977))^0f00h,c,5	;volatile
	line	81
	
l13851:; BSR set to: 3

	bcf	((c:3977))^0f00h,c,7	;volatile
	line	82
	
l13853:; BSR set to: 3

	movlw	(0)&0ffh
	
	call	_lcd_write_nibble
	line	85
	
l13855:
	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u21197:
decfsz	wreg,f
	bra	u21197
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u21197
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u21197
	nop
asmopt pop

	line	88
	
l13857:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	89
	
l13859:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	90
	
l13861:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	91
	
l13863:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	92
	
l13865:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	93
	
l13867:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	94
	
l13869:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u21207:
decfsz	wreg,f
	bra	u21207
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u21207
asmopt pop

	line	96
	
l13871:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	97
	
l13873:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	98
	
l13875:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	99
	
l13877:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	100
	
l13879:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u21217:
decfsz	wreg,f
	bra	u21217
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u21217
	nop2
asmopt pop

	line	102
	
l13881:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	103
	
l13883:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	104
	
l13885:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	105
	
l13887:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	106
	
l13889:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u21227:
decfsz	wreg,f
	bra	u21227
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u21227
	nop2
asmopt pop

	line	109
	
l13891:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	110
	
l13893:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	111
	
l13895:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	112
	
l13897:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	113
	
l13899:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u21237:
decfsz	wreg,f
	bra	u21237
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u21237
	nop2
asmopt pop

	line	116
	
l13901:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	119
	
l13903:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	122
	
l13905:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	125
	
l13907:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	126
	
l1557:
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
psect	text53,class=CODE,space=0,reloc=2,group=0
	line	17
global __ptext53
__ptext53:
psect	text53
	file	"src\lcd.c"
	line	17
	
_lcd_cmd:
;incstack = 0
	callstack 24
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	20
	
l11287:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	21
	
l11289:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	22
	
l11291:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	23
	
l11293:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	24
	
l11295:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	25
	
l11297:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	26
	
l11299:
	asmopt push
asmopt off
	movlw	133
u21247:
decfsz	wreg,f
	bra	u21247
	nop
asmopt pop

	line	29
	
l11301:
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	30
	
l11303:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	31
	
l11305:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	32
	
l11307:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	33
	
l11309:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	34
	
l11311:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	37
	
l11313:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u14251
	goto	u14250

u14251:
	goto	l11317
u14250:
	
l11315:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u14261
	goto	u14260

u14261:
	goto	l11319
u14260:
	line	39
	
l11317:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u21257:
decfsz	wreg,f
	bra	u21257
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u21257
	nop2
asmopt pop

	line	40
	goto	l1551
	line	43
	
l11319:
	asmopt push
asmopt off
	movlw	133
u21267:
decfsz	wreg,f
	bra	u21267
	nop
asmopt pop

	line	45
	
l1551:
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
psect	text54,class=CODE,space=0,reloc=2,group=0
	line	8
global __ptext54
__ptext54:
psect	text54
	file	"src\lcd.c"
	line	8
	
_lcd_write_nibble:
;incstack = 0
	callstack 24
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	10
	
l11285:
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u14171
	goto	u14170
u14171:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u14188
u14170:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u14188:
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not ((1<<1)-1)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	11
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u14191
	goto	u14190
u14191:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u14208
u14190:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u14208:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<1)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	12
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u14211
	goto	u14210
u14211:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u14228
u14210:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u14228:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<2)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	13
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u14231
	goto	u14230
u14231:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u14248
u14230:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u14248:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<3)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	14
	
l1544:
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
;;		On entry : 0/3
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
psect	text55,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	16
global __ptext55
__ptext55:
psect	text55
	file	"src\i2c.c"
	line	16
	
_i2c_init:
;incstack = 0
	callstack 28
	line	19
	
l13695:
	bsf	((c:3988))^0f00h,c,3	;volatile
	line	20
	bsf	((c:3988))^0f00h,c,4	;volatile
	line	23
	
l13697:
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
	
l13699:
	asmopt push
asmopt off
	movlw	26
u21277:
decfsz	wreg,f
	bra	u21277
	nop2
asmopt pop

	line	34
	
l1599:
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
;;		On entry : 3F/3
;;		On exit  : 3F/6
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
psect	text56,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	260
global __ptext56
__ptext56:
psect	text56
	file	"src\eeprom.c"
	line	260
	
_get_menu_timeout_seconds:
;incstack = 0
	callstack 28
	line	263
	
l13679:; BSR set to: 3

		movlw	05h-0
	movlb	6	; () banked
	cpfslt	(0+(_system_config+01h))&0ffh
	goto	u18121
	goto	u18120

u18121:
	goto	l13685
u18120:
	line	265
	
l13681:; BSR set to: 6

	movlw	(01Eh)&0ffh
	goto	l1532
	line	267
	
l13685:; BSR set to: 6

		movlw	079h-1
	cpfsgt	(0+(_system_config+01h))&0ffh
	goto	u18131
	goto	u18130

u18131:
	goto	l13691
u18130:
	goto	l13681
	line	271
	
l13691:; BSR set to: 6

	movf	(0+(_system_config+01h))&0ffh,w
	line	272
	
l1532:; BSR set to: 6

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
;;		On entry : 0/2
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
psect	text57,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	205
global __ptext57
__ptext57:
psect	text57
	file	"src\encoder.c"
	line	205
	
_encoder_init:; BSR set to: 6

;incstack = 0
	callstack 28
	line	208
	
l13827:
	movlw	low(0C4h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	209
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	212
	movlw	high(0)
	movlb	3	; () banked
	movwf	((_encoder_count+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_encoder_count))&0ffh	;volatile
	line	213
	movlw	low(0)
	movwf	((_button_pressed))&0ffh	;volatile
	line	214
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	215
	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	216
	movlw	low(0)
	movwf	((c:_relay_ms_counter))^00h,c
	line	219
	
l13829:; BSR set to: 3

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	220
	
l13831:; BSR set to: 3

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	221
	
l13833:; BSR set to: 3

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	224
	
l13835:; BSR set to: 3

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u18241
	goto	u18240
u18241:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u18248
u18240:
	clrf	(??_encoder_init+0+0)^00h,c
u18248:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u18251
	goto	u18250
u18251:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u18258
u18250:
	clrf	(??_encoder_init+1+0)^00h,c
u18258:
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
psect	text58,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	180
global __ptext58
__ptext58:
psect	text58
	file	"src\eeprom.c"
	line	180
	
_eeprom_init:
;incstack = 0
	callstack 25
	line	182
	
l13645:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	185
	
l13647:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	189
	
l13653:
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
	
l13655:
	incf	((c:eeprom_init@i))^00h,c
	
l13657:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u18081
	goto	u18080

u18081:
	goto	l13653
u18080:
	line	191
	
l13659:
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
	
l13661:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	195
	
l13663:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u18090
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u18091
	goto	u18090

u18091:
	goto	l13669
u18090:
	line	198
	
l13665:
	call	_load_factory_defaults	;wreg free
	line	199
	
l13667:
	call	_save_current_config	;wreg free
	line	203
	
l13669:
	call	_sync_menu_variables	;wreg free
	line	207
	
l13671:
	movlb	6	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	mullw	02h
	movff	prodl,(_menu_timeout_seconds)
	movff	prodh,(_menu_timeout_seconds+1)
	line	210
	
l13673:; BSR set to: 6

	movlb	3	; () banked
		movf	((_menu_timeout_seconds+1))&0ffh,w
	bnz	u18100
	movlw	10
	subwf	 ((_menu_timeout_seconds))&0ffh,w
	btfss	status,0
	goto	u18101
	goto	u18100

u18101:
	goto	l13677
u18100:
	
l13675:; BSR set to: 3

		incf	((_menu_timeout_seconds))&0ffh,w
	movlw	1
	subwfb	((_menu_timeout_seconds+1))&0ffh,w
	btfss	status,0
	goto	u18111
	goto	u18110

u18111:
	goto	l1510
u18110:
	line	212
	
l13677:; BSR set to: 3

	movlw	high(01Eh)
	movwf	((_menu_timeout_seconds+1))&0ffh
	movlw	low(01Eh)
	movwf	((_menu_timeout_seconds))&0ffh
	line	214
	
l1510:; BSR set to: 3

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
psect	text59,class=CODE,space=0,reloc=2,group=0
	line	247
global __ptext59
__ptext59:
psect	text59
	file	"src\eeprom.c"
	line	247
	
_sync_menu_variables:; BSR set to: 3

;incstack = 0
	callstack 27
	line	256
	
l13541:
	movff	_input_config,(c:_enable_edit_flag)
	line	257
	movff	0+(_input_config+01h),(c:_sensor_edit_flag)
	line	258
	
l1528:
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
;;		On entry : 0/3
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
psect	text60,class=CODE,space=0,reloc=2,group=0
	line	216
global __ptext60
__ptext60:
psect	text60
	file	"src\eeprom.c"
	line	216
	
_save_current_config:
;incstack = 0
	callstack 26
	line	219
	
l12917:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	223
	
l12923:
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
	
l12925:
	incf	((c:save_current_config@i))^00h,c
	
l12927:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u17241
	goto	u17240

u17241:
	goto	l12923
u17240:
	line	227
	
l12929:
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
	
l12931:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	231
	
l12933:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	232
	
l1515:
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
;;		On entry : 0/3
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
psect	text61,class=CODE,space=0,reloc=2,group=0
	line	155
global __ptext61
__ptext61:
psect	text61
	file	"src\eeprom.c"
	line	155
	
_eeprom_write_word:
;incstack = 0
	callstack 26
	line	157
	
l12317:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	158
	
l12319:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	159
	
l1489:
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
;;		On entry : 0/3
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
psect	text62,class=CODE,space=0,reloc=2,group=0
	line	161
global __ptext62
__ptext62:
psect	text62
	file	"src\eeprom.c"
	line	161
	
_eeprom_write_block:
;incstack = 0
	callstack 26
	line	163
	
l12321:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	164
	
l12323:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l12329
	line	166
	
l12325:
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
	
l12327:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l12329:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u16191
	goto	u16190

u16191:
	goto	l12325
u16190:
	line	168
	
l1495:
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
;;		On entry : 0/3
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
psect	text63,class=CODE,space=0,reloc=2,group=0
	line	128
global __ptext63
__ptext63:
psect	text63
	file	"src\eeprom.c"
	line	128
	
_eeprom_write_byte:
;incstack = 0
	callstack 26
	line	130
	
l11679:
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
	
l11681:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	139
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	140
	
l11683:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	143
	
l1480:
	line	142
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u14911
	goto	u14910
u14911:
	goto	l1480
u14910:
	
l1482:
	line	144
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	145
	
l1483:
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
psect	text64,class=CODE,space=0,reloc=2,group=0
	line	92
global __ptext64
__ptext64:
psect	text64
	file	"src\eeprom.c"
	line	92
	
_calculate_config_checksum:
;incstack = 0
	callstack 27
	line	94
	
l12273:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	98
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	100
	
l12279:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	101
	
l12281:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	103
	
l12287:
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
	
l12289:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l12291:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u16160
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u16161
	goto	u16160

u16161:
	goto	l12287
u16160:
	line	98
	
l12293:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l12295:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u16171
	goto	u16170

u16171:
	goto	l12279
u16170:
	line	108
	
l12297:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	109
	
l12299:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1893+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1893))^00h,c
	line	111
	
l12305:
	movf	((c:calculate_config_checksum@j_1893))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j_1893+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	109
	
l12307:
	infsnz	((c:calculate_config_checksum@j_1893))^00h,c
	incf	((c:calculate_config_checksum@j_1893+1))^00h,c
	
l12309:
		movf	((c:calculate_config_checksum@j_1893+1))^00h,c,w
	bnz	u16180
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1893))^00h,c,w
	btfss	status,0
	goto	u16181
	goto	u16180

u16181:
	goto	l12305
u16180:
	
l1473:
	line	114
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	115
	
l1474:
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
psect	text65,class=CODE,space=0,reloc=2,group=0
	line	241
global __ptext65
__ptext65:
psect	text65
	file	"src\eeprom.c"
	line	241
	
_load_factory_defaults:
;incstack = 0
	callstack 26
	line	243
	
l13539:
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
	
l1521:
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
;;  s               2   23[COMRAM] PTR const unsigned char 
;;		 -> system_defaults(128), factory_defaults(384), clock_menu_template(25), flow_analog_template(55), 
;;		 -> flow_digital_template(40), temp_menu_template(45), pressure_menu_template(70), 
;;  d               2   21[COMRAM] PTR unsigned char 
;;		 -> clock_menu(25), input_menu(75), input_config(384), system_config(128), 
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
;;		_rebuild_clock_menu
;;		_load_factory_defaults
;; This function uses a non-reentrant model
;;
psect	text66,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
global __ptext66
__ptext66:
psect	text66
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
	
_memcpy:
;incstack = 0
	callstack 26
	line	34
	
l12249:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l12259
	line	37
	
l12251:
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
	
l12253:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l12255:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l12257:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l12259:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u16111
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u16111
	goto	u16110

u16111:
	goto	l12251
u16110:
	line	41
	
l2517:
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
psect	text67,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	147
global __ptext67
__ptext67:
psect	text67
	file	"src\eeprom.c"
	line	147
	
_eeprom_read_word:
;incstack = 0
	callstack 26
	line	150
	
l13523:
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
	
l13525:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	153
	
l1486:
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
psect	text68,class=CODE,space=0,reloc=2,group=0
	line	170
global __ptext68
__ptext68:
psect	text68
	file	"src\eeprom.c"
	line	170
	
_eeprom_read_block:
;incstack = 0
	callstack 26
	line	172
	
l13529:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	173
	
l13531:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l13537
	line	175
	
l13533:
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
	
l13535:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l13537:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u17941
	goto	u17940

u17941:
	goto	l13533
u17940:
	line	177
	
l1501:
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
psect	text69,class=CODE,space=0,reloc=2,group=0
	line	118
global __ptext69
__ptext69:
psect	text69
	file	"src\eeprom.c"
	line	118
	
_eeprom_read_byte:
;incstack = 0
	callstack 26
	line	120
	
l12311:
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
	
l12313:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	126
	
l1477:
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
;;  result          2   29[COMRAM] unsigned int 
;;  config_byte     1   31[COMRAM] unsigned char 
;;  lsb             1   28[COMRAM] unsigned char 
;;  msb             1   27[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   22[COMRAM] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/3
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
psect	text70,class=CODE,space=0,reloc=2,group=0
	file	"src\ad7994.c"
	line	60
global __ptext70
__ptext70:
psect	text70
	file	"src\ad7994.c"
	line	60
	
_ad7994_read_channel:
;incstack = 0
	callstack 26
	movwf	((c:ad7994_read_channel@channel))^00h,c
	line	70
	
l13973:
	goto	l13985
	line	73
	
l13975:
	movlw	low(018h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	74
	goto	l13987
	line	76
	
l13977:
	movlw	low(028h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	77
	goto	l13987
	line	79
	
l13979:
	movlw	low(048h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	80
	goto	l13987
	line	82
	
l13981:
	movlw	low(088h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	83
	goto	l13987
	line	84
	
l1742:
	line	86
	setf	((c:?_ad7994_read_channel))^00h,c
	setf	((c:?_ad7994_read_channel+1))^00h,c
	goto	l1743
	line	70
	
l13985:
	movf	((c:ad7994_read_channel@channel))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 1 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l13975
	xorlw	2^1	; case 2
	skipnz
	goto	l13977
	xorlw	3^2	; case 3
	skipnz
	goto	l13979
	xorlw	4^3	; case 4
	skipnz
	goto	l13981
	goto	l1742

	line	89
	
l13987:
	call	_i2c_start	;wreg free
	line	90
	
l13989:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	line	91
	
l13991:
	movlw	(02h)&0ffh
	
	call	_i2c_write
	line	92
	
l13993:
	movf	((c:ad7994_read_channel@config_byte))^00h,c,w
	
	call	_i2c_write
	line	93
	
l13995:
	call	_i2c_stop	;wreg free
	line	95
	
l13997:
	bsf	((c:3979))^0f00h,c,5	;volatile
	line	96
	
l13999:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	97
	
l14001:
	bcf	((c:3979))^0f00h,c,5	;volatile
	line	98
	
l14003:
	asmopt push
asmopt off
	movlw	5
u21287:
decfsz	wreg,f
	bra	u21287
	nop
asmopt pop

	line	100
	
l14005:
	call	_i2c_start	;wreg free
	line	101
	
l14007:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	line	102
	
l14009:
	movlw	(0)&0ffh
	
	call	_i2c_write
	line	103
	
l14011:
	call	_i2c_stop	;wreg free
	line	105
	
l14013:
	call	_i2c_start	;wreg free
	line	106
	
l14015:
	movlw	(045h)&0ffh
	
	call	_i2c_write
	line	107
	
l14017:
	movlw	(01h)&0ffh
	
	call	_i2c_read
	movwf	((c:ad7994_read_channel@msb))^00h,c
	line	108
	
l14019:
	movlw	(0)&0ffh
	
	call	_i2c_read
	movwf	((c:ad7994_read_channel@lsb))^00h,c
	line	109
	
l14021:
	call	_i2c_stop	;wreg free
	line	111
	movf	((c:ad7994_read_channel@msb))^00h,c,w
	movwf	(??_ad7994_read_channel+0+0)^00h,c
	movf	((c:ad7994_read_channel@lsb))^00h,c,w
	movwf	((c:ad7994_read_channel@result))^00h,c
	movff	??_ad7994_read_channel+0+0,((c:ad7994_read_channel@result+1))
	line	116
	
l14023:
	movlw	low(0FFFh)
	andwf	((c:ad7994_read_channel@result))^00h,c
	movlw	high(0FFFh)
	andwf	((c:ad7994_read_channel@result+1))^00h,c
	line	121
	
l14025:
	movff	(c:ad7994_read_channel@result),(c:?_ad7994_read_channel)
	movff	(c:ad7994_read_channel@result+1),(c:?_ad7994_read_channel+1)
	line	122
	
l1743:
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
;;  timeout         2   20[COMRAM] unsigned int 
;;  data            1   19[COMRAM] unsigned char 
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
psect	text71,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	142
global __ptext71
__ptext71:
psect	text71
	file	"src\i2c.c"
	line	142
	
_i2c_read:
;incstack = 0
	callstack 26
	movwf	((c:i2c_read@ack))^00h,c
	line	146
	
l13543:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u17951
	goto	u17950
u17951:
	goto	l1640
u17950:
	line	147
	
l13545:
	movlw	(0FFh)&0ffh
	goto	l1641
	
l1640:
	line	149
	bsf	((c:4037))^0f00h,c,3	;volatile
	line	152
	
l13549:
	movlw	high(03E8h)
	movwf	((c:i2c_read@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_read@timeout))^00h,c
	line	153
	goto	l1642
	line	155
	
l13551:
	decf	((c:i2c_read@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_read@timeout+1))^00h,c
	movf	((c:i2c_read@timeout))^00h,c,w
iorwf	((c:i2c_read@timeout+1))^00h,c,w
	btfss	status,2
	goto	u17961
	goto	u17960

u17961:
	goto	l1642
u17960:
	goto	l13545
	line	157
	
l1642:
	line	153
	btfss	((c:4039))^0f00h,c,0	;volatile
	goto	u17971
	goto	u17970
u17971:
	goto	l13551
u17970:
	
l1645:
	line	159
	movff	(c:4041),(c:i2c_read@data)	;volatile
	line	161
	
l13557:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u17981
	goto	u17980
u17981:
	goto	l13563
u17980:
	line	162
	
l13559:
	movf	((c:i2c_read@data))^00h,c,w
	goto	l1641
	line	165
	
l13563:
	movf	((c:i2c_read@ack))^00h,c,w
	btfsc	status,2
	goto	u17991
	goto	u17990
u17991:
	clrf	(??_i2c_read+0+0)^00h,c
	incf	(??_i2c_read+0+0)^00h,c
	goto	u18008
u17990:
	clrf	(??_i2c_read+0+0)^00h,c
u18008:
	swapf	(??_i2c_read+0+0)^00h,c
	rlncf	(??_i2c_read+0+0)^00h,c
	movf	((c:4037))^0f00h,c,w	;volatile
	xorwf	(??_i2c_read+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<5)
	xorwf	(??_i2c_read+0+0)^00h,c,w
	movwf	((c:4037))^0f00h,c	;volatile
	line	166
	
l13565:
	bsf	((c:4037))^0f00h,c,4	;volatile
	line	169
	
l13567:
	movlw	high(03E8h)
	movwf	((c:i2c_read@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_read@timeout))^00h,c
	line	170
	goto	l1647
	line	172
	
l13569:
	decf	((c:i2c_read@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_read@timeout+1))^00h,c
	movf	((c:i2c_read@timeout))^00h,c,w
iorwf	((c:i2c_read@timeout+1))^00h,c,w
	btfss	status,2
	goto	u18011
	goto	u18010

u18011:
	goto	l1647
u18010:
	goto	l13559
	line	174
	
l1647:
	line	170
	btfsc	((c:4037))^0f00h,c,4	;volatile
	goto	u18021
	goto	u18020
u18021:
	goto	l13569
u18020:
	goto	l13559
	line	177
	
l1641:
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
;;		On entry : 0/4
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
psect	text72,class=CODE,space=0,reloc=2,group=0
	file	"src\ad7994.c"
	line	14
global __ptext72
__ptext72:
psect	text72
	file	"src\ad7994.c"
	line	14
	
_ad7994_init:
;incstack = 0
	callstack 25
	line	16
	
l13763:
		movlw	low(STR_343)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_343)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	18
	
l13765:
	bcf	((c:3988))^0f00h,c,5	;volatile
	line	19
	
l13767:
	bcf	((c:3979))^0f00h,c,5	;volatile
	line	20
	
l13769:
	asmopt push
asmopt off
movlw	104
movwf	(??_ad7994_init+0+0)^00h,c
	movlw	228
u21297:
decfsz	wreg,f
	bra	u21297
	decfsz	(??_ad7994_init+0+0)^00h,c,f
	bra	u21297
	nop2
asmopt pop

	line	21
	
l13771:
		movlw	low(STR_344)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_344)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	23
	
l13773:
		movlw	low(STR_345)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_345)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	25
	
l13775:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u18201
	goto	u18200
u18201:
	goto	l13783
u18200:
	line	27
	
l13777:
		movlw	low(STR_346)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_346)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	28
	
l13779:
	movlw	(01h)&0ffh
	goto	l1730
	line	31
	
l13783:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u18211
	goto	u18210
u18211:
	goto	l13793
u18210:
	line	33
	
l13785:
		movlw	low(STR_347)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_347)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	34
	
l13787:
	call	_i2c_stop	;wreg free
	line	35
	
l13789:
	movlw	(02h)&0ffh
	goto	l1730
	line	37
	
l13793:
		movlw	low(STR_348)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_348)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	39
	
l13795:
	movlw	(02h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u18221
	goto	u18220
u18221:
	goto	l13805
u18220:
	line	41
	
l13797:
		movlw	low(STR_349)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_349)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	42
	
l13799:
	call	_i2c_stop	;wreg free
	line	43
	
l13801:
	movlw	(03h)&0ffh
	goto	l1730
	line	45
	
l13805:
		movlw	low(STR_350)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_350)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	47
	
l13807:
	movlw	(08h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u18231
	goto	u18230
u18231:
	goto	l13817
u18230:
	line	49
	
l13809:
		movlw	low(STR_351)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_351)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	50
	
l13811:
	call	_i2c_stop	;wreg free
	line	51
	
l13813:
	movlw	(04h)&0ffh
	goto	l1730
	line	53
	
l13817:
		movlw	low(STR_352)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_352)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	55
	
l13819:
	call	_i2c_stop	;wreg free
	line	56
	
l13821:
		movlw	low(STR_353)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_353)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	57
	
l13823:
	movlw	(0)&0ffh
	line	58
	
l1730:
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
;;		 -> STR_353(29), STR_352(38), STR_351(43), STR_350(38), 
;;		 -> STR_349(49), STR_348(31), STR_347(39), STR_346(31), 
;;		 -> STR_345(37), STR_344(28), STR_343(22), rtc_read_time@debug_buf(80), 
;;		 -> menu_handle_button@buf_1747(50), STR_340(20), STR_335(25), menu_handle_button@buf_1738(50), 
;;		 -> menu_handle_button@buf_1728(50), STR_322(27), menu_handle_button@buf_1703(50), menu_handle_button@buf(50), 
;;		 -> menu_handle_encoder@buf_1670(50), menu_handle_encoder@buf_1667(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), 
;;		 -> handle_numeric_rotation@buf(50), STR_223(31), rebuild_input_menu@buf(50), STR_152(26), 
;;		 -> init_datetime_editor@buf(80), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), handle_time_rotation@buf(50), 
;;		 -> STR_142(29), init_time_editor@buf(60), STR_44(21), STR_43(20), 
;;		 -> STR_42(36), STR_39(33), STR_38(21), STR_37(20), 
;;		 -> STR_36(22), STR_33(26), STR_32(15), STR_31(20), 
;;		 -> main@buf_705(30), main@buf_678(40), main@buf_675(60), main@buf_670(50), 
;;		 -> STR_26(16), main@time_buf(60), STR_24(19), STR_23(22), 
;;		 -> STR_22(22), STR_21(24), STR_20(19), STR_19(22), 
;;		 -> STR_16(23), STR_15(28), main@buf_636(30), STR_13(20), 
;;		 -> STR_12(36), STR_11(34), STR_10(42), STR_9(37), 
;;		 -> STR_8(16), STR_7(20), main@buf(50), STR_5(23), 
;;		 -> STR_4(29), STR_2(42), trigger_relay_pulse@buf(60), 
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
psect	text73,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	80
global __ptext73
__ptext73:
psect	text73
	file	"src\main.c"
	line	80
	
_uart_println:
;incstack = 0
	callstack 26
	line	82
	
l11701:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	83
	
l11703:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	84
	
l11705:
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
;;		 -> STR_353(29), STR_352(38), STR_351(43), STR_350(38), 
;;		 -> STR_349(49), STR_348(31), STR_347(39), STR_346(31), 
;;		 -> STR_345(37), STR_344(28), STR_343(22), rtc_read_time@debug_buf(80), 
;;		 -> menu_handle_button@buf_1747(50), STR_340(20), STR_335(25), menu_handle_button@buf_1738(50), 
;;		 -> menu_handle_button@buf_1728(50), STR_322(27), menu_handle_button@buf_1703(50), menu_handle_button@buf(50), 
;;		 -> menu_handle_encoder@buf_1670(50), menu_handle_encoder@buf_1667(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), 
;;		 -> handle_numeric_rotation@buf(50), STR_223(31), rebuild_input_menu@buf(50), STR_152(26), 
;;		 -> init_datetime_editor@buf(80), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), handle_time_rotation@buf(50), 
;;		 -> STR_142(29), init_time_editor@buf(60), STR_44(21), STR_43(20), 
;;		 -> STR_42(36), STR_39(33), STR_38(21), STR_37(20), 
;;		 -> STR_36(22), STR_33(26), STR_32(15), STR_31(20), 
;;		 -> main@buf_705(30), main@buf_678(40), main@buf_675(60), main@buf_670(50), 
;;		 -> STR_26(16), main@time_buf(60), STR_24(19), STR_23(22), 
;;		 -> STR_22(22), STR_21(24), STR_20(19), STR_19(22), 
;;		 -> STR_16(23), STR_15(28), main@buf_636(30), STR_13(20), 
;;		 -> STR_12(36), STR_11(34), STR_10(42), STR_9(37), 
;;		 -> STR_8(16), STR_7(20), main@buf(50), STR_5(23), 
;;		 -> STR_4(29), STR_2(42), trigger_relay_pulse@buf(60), 
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
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_uart_write
;; This function is called by:
;;		_uart_println
;; This function uses a non-reentrant model
;;
psect	text74,class=CODE,space=0,reloc=2,group=0
	line	72
global __ptext74
__ptext74:
psect	text74
	file	"src\main.c"
	line	72
	
_uart_print:
;incstack = 0
	callstack 26
	line	74
	
l11431:
	goto	l11437
	line	76
	
l11433:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14397
	tblrd	*
	
	movf	tablat,w
	bra	u14390
u14397:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u14390:
	
	call	_uart_write
	
l11435:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	74
	
l11437:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14407
	tblrd	*
	
	movf	tablat,w
	bra	u14400
u14407:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u14400:
	iorlw	0
	btfss	status,2
	goto	u14411
	goto	u14410
u14411:
	goto	l11433
u14410:
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_print
;;		_uart_println
;; This function uses a non-reentrant model
;;
psect	text75,class=CODE,space=0,reloc=2,group=0
	line	65
global __ptext75
__ptext75:
psect	text75
	file	"src\main.c"
	line	65
	
_uart_write:
;incstack = 0
	callstack 27
	movwf	((c:uart_write@c))^00h,c
	line	67
	
l11347:
	line	68
	
l126:
	line	67
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u14271
	goto	u14270
u14271:
	goto	l126
u14270:
	line	69
	
l11349:
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
;;		On entry : 0/4
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
psect	text76,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	119
global __ptext76
__ptext76:
psect	text76
	file	"src\i2c.c"
	line	119
	
_i2c_write:
;incstack = 0
	callstack 27
	movwf	((c:i2c_write@data))^00h,c
	line	121
	
l12359:
	movff	(c:i2c_write@data),(c:4041)	;volatile
	line	125
	
l1633:
	line	124
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u16261
	goto	u16260
u16261:
	goto	l1633
u16260:
	
l1635:
	line	126
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	129
	btfss	((c:4037))^0f00h,c,6	;volatile
	goto	u16271
	goto	u16270
u16271:
	goto	l12365
u16270:
	line	131
	
l12361:
	movlw	(01h)&0ffh
	goto	l1637
	line	134
	
l12365:
	movlw	(0)&0ffh
	line	135
	
l1637:
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
;;		On entry : 0/4
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
psect	text77,class=CODE,space=0,reloc=2,group=0
	line	99
global __ptext77
__ptext77:
psect	text77
	file	"src\i2c.c"
	line	99
	
_i2c_stop:
;incstack = 0
	callstack 26
	line	101
	
l12349:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16231
	goto	u16230
u16231:
	goto	l1625
u16230:
	goto	l1626
	line	102
	
l1625:
	line	104
	bsf	((c:4037))^0f00h,c,2	;volatile
	line	107
	
l12353:
	movlw	high(03E8h)
	movwf	((c:i2c_stop@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_stop@timeout))^00h,c
	line	108
	goto	l1627
	line	110
	
l12355:
	decf	((c:i2c_stop@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_stop@timeout+1))^00h,c
	movf	((c:i2c_stop@timeout))^00h,c,w
iorwf	((c:i2c_stop@timeout+1))^00h,c,w
	btfss	status,2
	goto	u16241
	goto	u16240

u16241:
	goto	l1627
u16240:
	goto	l1626
	line	112
	
l1627:
	line	108
	btfsc	((c:4037))^0f00h,c,2	;volatile
	goto	u16251
	goto	u16250
u16251:
	goto	l12355
u16250:
	line	113
	
l1626:
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
;;		On entry : 0/4
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
psect	text78,class=CODE,space=0,reloc=2,group=0
	line	57
global __ptext78
__ptext78:
psect	text78
	file	"src\i2c.c"
	line	57
	
_i2c_start:
;incstack = 0
	callstack 26
	line	59
	
l12331:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16201
	goto	u16200
u16201:
	goto	l1609
u16200:
	line	60
	
l12333:
	movlw	(01h)&0ffh
	goto	l1610
	
l1609:
	line	62
	bsf	((c:4037))^0f00h,c,0	;volatile
	line	65
	
l12337:
	movlw	high(03E8h)
	movwf	((c:i2c_start@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_start@timeout))^00h,c
	line	66
	goto	l1611
	line	68
	
l12339:
	decf	((c:i2c_start@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_start@timeout+1))^00h,c
	movf	((c:i2c_start@timeout))^00h,c,w
iorwf	((c:i2c_start@timeout+1))^00h,c,w
	btfss	status,2
	goto	u16211
	goto	u16210

u16211:
	goto	l1611
u16210:
	goto	l12333
	line	70
	
l1611:
	line	66
	btfsc	((c:4037))^0f00h,c,0	;volatile
	goto	u16221
	goto	u16220
u16221:
	goto	l12339
u16220:
	line	72
	
l12345:
	movlw	(0)&0ffh
	line	73
	
l1610:
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
psect	text79,class=CODE,space=0,reloc=2,group=0
	line	40
global __ptext79
__ptext79:
psect	text79
	file	"src\i2c.c"
	line	40
	
_i2c_wait_idle:
;incstack = 0
	callstack 26
	line	42
	
l11685:
	movlw	high(03E8h)
	movwf	((c:i2c_wait_idle@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_wait_idle@timeout))^00h,c
	line	45
	goto	l11693
	line	47
	
l11687:
	decf	((c:i2c_wait_idle@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_wait_idle@timeout+1))^00h,c
	movf	((c:i2c_wait_idle@timeout))^00h,c,w
iorwf	((c:i2c_wait_idle@timeout+1))^00h,c,w
	btfss	status,2
	goto	u14921
	goto	u14920

u14921:
	goto	l11693
u14920:
	line	48
	
l11689:
	movlw	(01h)&0ffh
	goto	l1605
	line	45
	
l11693:
	movff	(c:4037),??_i2c_wait_idle+0+0	;volatile
	movlw	01Fh
	andwf	(??_i2c_wait_idle+0+0)^00h,c
	btfss	status,2
	goto	u14931
	goto	u14930
u14931:
	goto	l11687
u14930:
	
l11695:
	btfsc	((c:4039))^0f00h,c,2	;volatile
	goto	u14941
	goto	u14940
u14941:
	goto	l11687
u14940:
	line	50
	
l11697:
	movlw	(0)&0ffh
	line	51
	
l1605:
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
	
i2l11163:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u1389_41
	goto	i2u1389_40
i2u1389_41:
	goto	i2l349
i2u1389_40:
	line	49
	
i2l11165:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	50
	
i2l11167:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	52
	
i2l11169:
	incf	((c:_relay_ms_counter))^00h,c
	line	53
	
i2l11171:
		movlw	0Ah-1
	cpfsgt	((c:_relay_ms_counter))^00h,c
	goto	i2u1390_41
	goto	i2u1390_40

i2u1390_41:
	goto	i2l11193
i2u1390_40:
	line	55
	
i2l11173:
	movlw	low(0)
	movwf	((c:_relay_ms_counter))^00h,c
	line	57
	
i2l11175:
	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1391_41
	goto	i2u1391_40

i2u1391_41:
	goto	i2l11183
i2u1391_40:
	
i2l11177:; BSR set to: 0

	movf	((c:_relay_latch_mode))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1392_41
	goto	i2u1392_40
i2u1392_41:
	goto	i2l11183
i2u1392_40:
	
i2l11179:; BSR set to: 0

	movlb	3	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	i2u1393_41
	goto	i2u1393_40

i2u1393_41:
	goto	i2l11183
i2u1393_40:
	line	59
	
i2l11181:; BSR set to: 3

	decf	((_relay_counter))&0ffh	;volatile
	btfss	status,0
	decf	((_relay_counter+1))&0ffh	;volatile
	line	60
	goto	i2l11193
	line	61
	
i2l11183:
	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1394_41
	goto	i2u1394_40

i2u1394_41:
	goto	i2l11193
i2u1394_40:
	
i2l11185:; BSR set to: 0

	movf	((c:_relay_latch_mode))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1395_41
	goto	i2u1395_40
i2u1395_41:
	goto	i2l11193
i2u1395_40:
	
i2l11187:; BSR set to: 0

	movlb	3	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1396_41
	goto	i2u1396_40

i2u1396_41:
	goto	i2l11193
i2u1396_40:
	line	64
	
i2l11189:; BSR set to: 3

	bsf	((c:3979))^0f00h,c,1	;volatile
	line	65
	
i2l11191:; BSR set to: 3

	movlw	low(0)
	movlb	0	; () banked
	movwf	((_relay_state))&0ffh	;volatile
	line	71
	
i2l11193:
	incf	((c:_ms_counter))^00h,c	;volatile
	line	72
	
i2l11195:
		movlw	02h-1
	cpfsgt	((c:_ms_counter))^00h,c	;volatile
	goto	i2u1397_41
	goto	i2u1397_40

i2u1397_41:
	goto	i2l11211
i2u1397_40:
	line	74
	
i2l11197:
	movlw	low(0)
	movwf	((c:_ms_counter))^00h,c	;volatile
	line	75
	
i2l11199:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1398_41
	goto	i2u1398_40

i2u1398_41:
	goto	i2l11211
i2u1398_40:
	line	77
	
i2l11201:
	decf	((c:_menu_timeout_timer))^00h,c	;volatile
	btfss	status,0
	decf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	line	80
	
i2l11203:
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
	goto	i2u1399_41
	goto	i2u1399_40

i2u1399_41:
	goto	i2l11207
i2u1399_40:
	line	83
	
i2l11205:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	((_timeout_debug_flag))&0ffh	;volatile
	line	86
	
i2l11207:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1400_41
	goto	i2u1400_40

i2u1400_41:
	goto	i2l11211
i2u1400_40:
	line	88
	
i2l11209:
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	94
	
i2l11211:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u1401_41
	goto	i2u1401_40
i2u1401_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u1401_48
i2u1401_40:
	clrf	(??_isr+0+0)^00h,c
i2u1401_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u1402_41
	goto	i2u1402_40
i2u1402_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u1402_48
i2u1402_40:
	clrf	(??_isr+1+0)^00h,c
i2u1402_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	95
	
i2l11213:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	98
	
i2l11215:
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
	
i2l11217:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u1403_41
	goto	i2u1403_40
i2u1403_41:
	goto	i2l11243
i2u1403_40:
	line	103
	
i2l11219:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u1404_41
	goto	i2u1404_40

i2u1404_41:
	goto	i2l11231
i2u1404_40:
	line	105
	
i2l11221:
	movlb	3	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	106
	
i2l11223:; BSR set to: 3

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	109
	
i2l11225:; BSR set to: 3

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1405_41
	goto	i2u1405_40

i2u1405_41:
	goto	i2l11243
i2u1405_40:
	line	111
	
i2l11227:; BSR set to: 3

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	112
	
i2l11229:; BSR set to: 3

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l11243
	line	115
	
i2l11231:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u1406_41
	goto	i2u1406_40

i2u1406_41:
	goto	i2l11243
i2u1406_40:
	line	117
	
i2l11233:
	movlb	3	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	line	118
	
i2l11235:; BSR set to: 3

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	121
	
i2l11237:; BSR set to: 3

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1407_41
	goto	i2u1407_40

i2u1407_41:
	goto	i2l334
i2u1407_40:
	goto	i2l11227
	line	127
	
i2l334:; BSR set to: 3

	line	129
	
i2l11243:
	movff	(c:isr@new_state),(c:_enc_state)
	line	132
	
i2l11245:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	133
	
i2l11247:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u1408_41
	goto	i2u1408_40

i2u1408_41:
	goto	i2l11275
i2u1408_40:
	line	135
	
i2l11249:
	incf	((c:_btn_debounce))^00h,c
	line	136
	
i2l11251:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u1409_41
	goto	i2u1409_40

i2u1409_41:
	goto	i2l349
i2u1409_40:
	line	138
	
i2l11253:
	movff	(c:isr@btn),(c:_last_btn)
	line	139
	
i2l11255:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	141
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1410_41
	goto	i2u1410_40
i2u1410_41:
	goto	i2l11265
i2u1410_40:
	line	144
	
i2l11257:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	145
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	148
	
i2l11259:; BSR set to: 3

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1411_41
	goto	i2u1411_40

i2u1411_41:
	goto	i2l346
i2u1411_40:
	line	150
	
i2l11261:; BSR set to: 3

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	151
	
i2l11263:; BSR set to: 3

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l349
	line	157
	
i2l11265:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1412_41
	goto	i2u1412_40

i2u1412_41:
	goto	i2l11269
i2u1412_40:
	line	159
	
i2l11267:
	movlw	low(02h)
	movlb	3	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	160
	goto	i2l343
	line	161
	
i2l11269:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u1413_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1413_41
	goto	i2u1413_40

i2u1413_41:
	goto	i2l11273
i2u1413_40:
	line	163
	
i2l11271:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	164
	goto	i2l343
	line	167
	
i2l11273:
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	168
	
i2l343:; BSR set to: 3

	line	170
	movlw	low(01h)
	movwf	((_button_pressed))&0ffh	;volatile
	line	171
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	goto	i2l349
	line	177
	
i2l11275:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	179
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1414_41
	goto	i2u1414_40
i2u1414_41:
	goto	i2l349
i2u1414_40:
	
i2l11277:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1415_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1415_41
	goto	i2u1415_40

i2u1415_41:
	goto	i2l349
i2u1415_40:
	line	181
	
i2l11279:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	184
	
i2l11281:
		movlw	8
	xorwf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1416_41
	movlw	7
	xorwf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1416_41
	goto	i2u1416_40

i2u1416_41:
	goto	i2l346
i2u1416_40:
	line	186
	
i2l11283:
	movlw	low(01h)
	movlb	3	; () banked
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
psect	text81,class=CODE,space=0,reloc=2,group=0
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext81
__ptext81:
psect	text81
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
i2___lwmod:
;incstack = 0
	callstack 22
	line	12
	
i2l10757:
	movf	((c:i2___lwmod@divisor))^00h,c,w
iorwf	((c:i2___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	i2u1337_41
	goto	i2u1337_40

i2u1337_41:
	goto	i2l2336
i2u1337_40:
	line	13
	
i2l10759:
	movlw	low(01h)
	movwf	((c:i2___lwmod@counter))^00h,c
	line	14
	goto	i2l10763
	line	15
	
i2l10761:
	bcf	status,0
	rlcf	((c:i2___lwmod@divisor))^00h,c
	rlcf	((c:i2___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:i2___lwmod@counter))^00h,c
	line	14
	
i2l10763:
	
	btfss	((c:i2___lwmod@divisor+1))^00h,c,(15)&7
	goto	i2u1338_41
	goto	i2u1338_40
i2u1338_41:
	goto	i2l10761
i2u1338_40:
	line	19
	
i2l10765:
		movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c,w
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	i2u1339_41
	goto	i2u1339_40

i2u1339_41:
	goto	i2l10769
i2u1339_40:
	line	20
	
i2l10767:
	movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c

	line	21
	
i2l10769:
	bcf	status,0
	rrcf	((c:i2___lwmod@divisor+1))^00h,c
	rrcf	((c:i2___lwmod@divisor))^00h,c
	line	22
	
i2l10771:
	decfsz	((c:i2___lwmod@counter))^00h,c
	
	goto	i2l10765
	line	23
	
i2l2336:
	line	24
	movff	(c:i2___lwmod@dividend),(c:?i2___lwmod)
	movff	(c:i2___lwmod@dividend+1),(c:?i2___lwmod+1)
	line	25
	
i2l2343:
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
