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
	FNCALL	_main,___wmul
	FNCALL	_main,_beep
	FNCALL	_main,_eeprom_init
	FNCALL	_main,_encoder_init
	FNCALL	_main,_get_menu_timeout_seconds
	FNCALL	_main,_handle_numeric_rotation
	FNCALL	_main,_handle_time_rotation
	FNCALL	_main,_is_numeric_field
	FNCALL	_main,_is_time_field
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
	FNCALL	_main,_menu_update_time_value
	FNCALL	_main,_save_current_config
	FNCALL	_main,_sprintf
	FNCALL	_main,_system_init
	FNCALL	_main,_uart_init
	FNCALL	_main,_uart_println
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
	FNCALL	_menu_handle_encoder,_menu_draw_input
	FNCALL	_menu_handle_encoder,_strcpy
	FNCALL	_handle_time_rotation,_sprintf
	FNCALL	_handle_time_rotation,_uart_println
	FNCALL	_handle_numeric_rotation,_sprintf
	FNCALL	_handle_numeric_rotation,_uart_println
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
	FNCALL	_menu_handle_button,_menu_draw_input
	FNCALL	_menu_handle_button,_menu_draw_options
	FNCALL	_menu_handle_button,_menu_draw_setup
	FNCALL	_menu_handle_button,_menu_update_time_value
	FNCALL	_menu_handle_button,_rebuild_input_menu
	FNCALL	_menu_handle_button,_save_current_config
	FNCALL	_menu_handle_button,_sprintf
	FNCALL	_menu_handle_button,_strcmp
	FNCALL	_menu_handle_button,_strcpy
	FNCALL	_menu_handle_button,_uart_println
	FNCALL	_rebuild_input_menu,___lwdiv
	FNCALL	_rebuild_input_menu,___lwmod
	FNCALL	_rebuild_input_menu,_memcpy
	FNCALL	_rebuild_input_menu,_sprintf
	FNCALL	_rebuild_input_menu,_strcpy
	FNCALL	_rebuild_input_menu,_uart_println
	FNCALL	_menu_update_time_value,___lbdiv
	FNCALL	_menu_update_time_value,___lbmod
	FNCALL	_menu_update_time_value,_is_time_field
	FNCALL	_menu_update_time_value,_lcd_print
	FNCALL	_menu_update_time_value,_lcd_set_cursor
	FNCALL	_menu_update_time_value,_sprintf
	FNCALL	_menu_update_time_value,_uart_println
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
	FNCALL	_uart_println,_uart_print
	FNCALL	_uart_println,_uart_write
	FNCALL	_uart_print,_uart_write
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
	global	_value_display
	global	_value_back
	global	_menu_timeout_flag
	global	_value_scale4
	global	_options_menu
	global	_value_sensor
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
	global	_value_scale20
	global	_value_enable
	global	menu_draw_setup@F2636
	global	_value_high_tbp
	global	_value_low_flow_bp
	global	_value_no_flow_bp
	global	_value_low_flow
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"src\eeprom.c"
	line	11

;initializer for _menu_timeout_seconds
	dw	(01Eh)&0ffffh
	file	"src\encoder.c"
	line	28

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
psect	idataBANK0,class=CODE,space=0,delta=1,noexec
global __pidataBANK0
__pidataBANK0:
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
	line	85

;initializer for _value_back
	db	low(042h)
	db	low(061h)
	db	low(063h)
	db	low(06Bh)
	db	low(0)
psect	idataBANK1,class=CODE,space=0,delta=1,noexec
global __pidataBANK1
__pidataBANK1:
	file	"src\encoder.c"
	line	16

;initializer for _menu_timeout_flag
	db	low(01h)
	file	"src\menu.c"
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
psect	idataBANK2,class=CODE,space=0,delta=1,noexec
global __pidataBANK2
__pidataBANK2:
	line	65

;initializer for _options_menu
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
psect	idataBANK3,class=CODE,space=0,delta=1,noexec
global __pidataBANK3
__pidataBANK3:
	line	1186

;initializer for menu_draw_setup@F2636
		db	low(STR_187)
	db	high(STR_187)

		db	low(STR_188)
	db	high(STR_188)

		db	low(STR_189)
	db	high(STR_189)

		db	low(STR_190)
	db	high(STR_190)

		db	low(STR_191)
	db	high(STR_191)

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
	global	_enc_table
psect	mediumconst,class=MEDIUMCONST,space=0,reloc=2,noexec
global __pmediumconst
__pmediumconst:
	db	0
	file	"src\encoder.c"
	line	31
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
	global	_menu_item_options
psect	mediumconst
	file	"src\menu.c"
	line	52
_menu_item_options:
	db	low(0)
	db	low(02h)
		db	low(STR_25)
	db	high(STR_25)

		db	low(STR_26)
	db	high(STR_26)

		db	low(STR_27)
	db	high(STR_27)

		db	low(STR_28)
	db	high(STR_28)

		db	low(STR_29)
	db	high(STR_29)

	db	low(01h)
	db	low(03h)
		db	low(STR_30)
	db	high(STR_30)

		db	low(STR_31)
	db	high(STR_31)

		db	low(STR_32)
	db	high(STR_32)

		db	low(STR_33)
	db	high(STR_33)

		db	low(STR_34)
	db	high(STR_34)

	db	low(02h)
	db	low(02h)
		db	low(STR_35)
	db	high(STR_35)

		db	low(STR_36)
	db	high(STR_36)

		db	low(STR_37)
	db	high(STR_37)

		db	low(STR_38)
	db	high(STR_38)

		db	low(STR_39)
	db	high(STR_39)

	db	low(03h)
	db	low(02h)
		db	low(STR_40)
	db	high(STR_40)

		db	low(STR_41)
	db	high(STR_41)

		db	low(STR_42)
	db	high(STR_42)

		db	low(STR_43)
	db	high(STR_43)

		db	low(STR_44)
	db	high(STR_44)

	db	low(04h)
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

	db	low(05h)
	db	low(02h)
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

	db	low(06h)
	db	low(03h)
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

	global __end_of_menu_item_options
__end_of_menu_item_options:
	global	_pressure_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	103
_pressure_menu_template:
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

	db	low(01h)
		db	low(STR_73)
	db	high(STR_73)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_74)
	db	high(STR_74)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_75)
	db	high(STR_75)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_76)
	db	high(STR_76)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_77)
	db	high(STR_77)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_78)
	db	high(STR_78)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_pressure_menu_template
__end_of_pressure_menu_template:
	global	_flow_analog_template
psect	mediumconst
	file	"src\menu.c"
	line	146
_flow_analog_template:
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

	db	low(01h)
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

	db	low(0)
	global __end_of_flow_analog_template
__end_of_flow_analog_template:
	global	_temp_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	121
_temp_menu_template:
		db	low(STR_79)
	db	high(STR_79)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_80)
	db	high(STR_80)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_81)
	db	high(STR_81)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_82)
	db	high(STR_82)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_83)
	db	high(STR_83)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_84)
	db	high(STR_84)

		db	low(0)
	db	high(0)

	db	low(01h)
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

	db	low(0)
	global __end_of_temp_menu_template
__end_of_temp_menu_template:
	global	_flow_digital_template
psect	mediumconst
	file	"src\menu.c"
	line	134
_flow_digital_template:
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

	db	low(0)
	global __end_of_flow_digital_template
__end_of_flow_digital_template:
	global	_enc_table
	global	_dpowers
	global	_factory_defaults
	global	_system_defaults
	global	_menu_item_options
	global	_pressure_menu_template
	global	_flow_analog_template
	global	_temp_menu_template
	global	_flow_digital_template
	global	_button_hold_ms
	global	_menu_timeout_timer
	global	_menu_timeout_reload
	global	_btn_debounce
	global	_enc_accumulator
	global	_enc_state
	global	_ms_counter
	global	_button_pressed
	global	_relay_low_edit_flag
	global	_relay_plp_edit_flag
	global	_relay_high_edit_flag
	global	_flow_units_edit_flag
	global	_no_flow_edit_flag
	global	_sensor_edit_flag
	global	_input_config
	global	_menu
	global	main@blink_timer
	global	main@encoder_activity_timer
	global	_encoder_count
	global	main@last_menu_state
	global	_current_menu
	global	_save_pending
	global	_long_press_beep_flag
	global	_timeout_debug_flag
	global	_button_event
	global	_current_input
	global	_input_menu
	global	_system_config
	global	_original_value
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
	
STR_111:
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
	
STR_165:
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
	
STR_109:
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
	
STR_214:
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
	
STR_24:
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
	
STR_107:
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
	
STR_21:
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
	
STR_166:
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
	
STR_108:
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
	
STR_167:
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
	
STR_112:
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
	
STR_203:
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
	
STR_201:
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
	
STR_15:
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
	
STR_110:
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
	
STR_18:
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
	
STR_116:
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
	
STR_186:
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
	
STR_176:
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
	
STR_20:
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
	
STR_19:
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
	
STR_14:
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
	
STR_71:
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
	
STR_62:
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
	
STR_103:
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
	
STR_69:
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
	
STR_16:
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
	
STR_68:
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
	
STR_92:
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
	
STR_61:
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
	
STR_67:
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
	
STR_124:
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
	
STR_83:
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
	
STR_60:
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
	
STR_70:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_84:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	84	;'T'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_179:
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_169:
	db	37
	db	99	;'c'
	db	37
	db	100	;'d'
	db	37
	db	100	;'d'
	db	37
	db	100	;'d'
	db	0
	
STR_25:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_57:
	db	78	;'N'
	db	111	;'o'
	db	116	;'t'
	db	32
	db	85	;'U'
	db	115	;'s'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_74:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	0
	
STR_102:
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_75:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_76:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_26:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_36:
	db	68	;'D'
	db	105	;'i'
	db	103	;'g'
	db	105	;'i'
	db	116	;'t'
	db	97	;'a'
	db	108	;'l'
	db	0
	
STR_93:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_91:
	db	78	;'N'
	db	111	;'o'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_77:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	0
	
STR_23:
	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_215:
	db	40
	db	110	;'n'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	41
	db	0
	
STR_65:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	0
	
STR_35:
	db	65	;'A'
	db	110	;'n'
	db	97	;'a'
	db	108	;'l'
	db	111	;'o'
	db	103	;'g'
	db	0
	
STR_66:
	db	83	;'S'
	db	101	;'e'
	db	110	;'n'
	db	115	;'s'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_72:
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_73:
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_121:
	db	37
	db	43
	db	48	;'0'
	db	52	;'4'
	db	100	;'d'
	db	0
	
STR_56:
	db	80	;'P'
	db	117	;'u'
	db	108	;'l'
	db	115	;'s'
	db	101	;'e'
	db	0
	
STR_55:
	db	76	;'L'
	db	97	;'a'
	db	116	;'t'
	db	99	;'c'
	db	104	;'h'
	db	0
	
STR_190:
	db	67	;'C'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_99:
	db	85	;'U'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	115	;'s'
	db	0
	
STR_63:
	db	65	;'A'
	db	98	;'b'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_17:
	db	82	;'R'
	db	101	;'e'
	db	97	;'a'
	db	100	;'d'
	db	121	;'y'
	db	0
	
STR_123:
	db	37
	db	48	;'0'
	db	51	;'3'
	db	100	;'d'
	db	0
	
STR_50:
	db	72	;'H'
	db	105	;'i'
	db	100	;'d'
	db	101	;'e'
	db	0
	
STR_90:
	db	84	;'T'
	db	121	;'y'
	db	112	;'p'
	db	101	;'e'
	db	0
	
STR_78:
	db	66	;'B'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_64:
	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	0
	
STR_51:
	db	83	;'S'
	db	104	;'h'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_46:
	db	76	;'L'
	db	112	;'p'
	db	83	;'S'
	db	0
	
STR_117:
	db	37
	db	115	;'s'
	db	0
	
STR_45:
	db	37
	db	0
	
STR_114:
	db	40
	db	0
	
STR_197:
	db	42
	db	0
	
STR_177:
	db	91	;'['
	db	0
	
STR_178:
	db	93	;']'
	db	0
STR_86	equ	STR_77+0
STR_94	equ	STR_77+0
STR_105	equ	STR_77+0
STR_32	equ	STR_91+3
STR_149	equ	STR_91+3
STR_194	equ	STR_91+3
STR_137	equ	STR_51+0
STR_147	equ	STR_51+0
STR_152	equ	STR_51+0
STR_104	equ	STR_93+0
STR_40	equ	STR_93+4
STR_163	equ	STR_93+4
STR_80	equ	STR_66+0
STR_89	equ	STR_66+0
STR_97	equ	STR_66+0
STR_31	equ	STR_83+5
STR_139	equ	STR_83+5
STR_193	equ	STR_83+5
STR_151	equ	STR_36+0
STR_87	equ	STR_78+0
STR_95	equ	STR_78+0
STR_106	equ	STR_78+0
STR_191	equ	STR_78+0
STR_85	equ	STR_74+0
STR_41	equ	STR_74+4
STR_128	equ	STR_55+0
STR_131	equ	STR_55+0
STR_134	equ	STR_55+0
STR_144	equ	STR_55+0
STR_154	equ	STR_55+0
STR_150	equ	STR_35+0
STR_129	equ	STR_56+0
STR_132	equ	STR_56+0
STR_135	equ	STR_56+0
STR_145	equ	STR_56+0
STR_155	equ	STR_56+0
STR_30	equ	STR_69+3
STR_120	equ	STR_69+3
STR_192	equ	STR_69+3
STR_98	equ	STR_90+0
STR_79	equ	STR_65+0
STR_88	equ	STR_65+0
STR_96	equ	STR_65+0
STR_138	equ	STR_50+0
STR_148	equ	STR_50+0
STR_153	equ	STR_50+0
STR_130	equ	STR_57+0
STR_133	equ	STR_57+0
STR_136	equ	STR_57+0
STR_146	equ	STR_57+0
STR_156	equ	STR_57+0
STR_119	equ	STR_25+0
STR_118	equ	STR_26+0
STR_122	equ	STR_121+0
STR_140	equ	STR_121+0
STR_141	equ	STR_121+0
STR_159	equ	STR_121+0
STR_160	equ	STR_121+0
STR_204	equ	STR_121+0
STR_205	equ	STR_121+0
STR_208	equ	STR_121+0
STR_209	equ	STR_121+0
STR_211	equ	STR_121+0
STR_212	equ	STR_121+0
STR_125	equ	STR_123+0
STR_161	equ	STR_123+0
STR_206	equ	STR_123+0
STR_207	equ	STR_123+0
STR_210	equ	STR_123+0
STR_213	equ	STR_123+0
STR_126	equ	STR_124+0
STR_127	equ	STR_124+0
STR_143	equ	STR_124+0
STR_162	equ	STR_124+0
STR_164	equ	STR_124+0
STR_202	equ	STR_124+0
STR_168	equ	STR_169+2
STR_142	equ	STR_11+20
STR_184	equ	STR_178+0
STR_196	equ	STR_178+0
STR_200	equ	STR_178+0
STR_182	equ	STR_177+0
STR_195	equ	STR_177+0
STR_199	equ	STR_177+0
STR_158	equ	STR_46+0
STR_22	equ	STR_16+0
STR_81	equ	STR_67+0
STR_100	equ	STR_67+0
STR_82	equ	STR_68+0
STR_101	equ	STR_68+0
STR_115	equ	STR_215+5
STR_172	equ	STR_215+5
STR_175	equ	STR_215+5
STR_185	equ	STR_215+5
STR_171	equ	STR_114+0
STR_174	equ	STR_114+0
STR_183	equ	STR_114+0
STR_157	equ	STR_45+0
STR_113	equ	STR_116+13
STR_170	equ	STR_116+14
STR_173	equ	STR_116+15
STR_180	equ	STR_116+15
STR_198	equ	STR_116+19
STR_27	equ	STR_116+20
STR_28	equ	STR_116+20
STR_29	equ	STR_116+20
STR_33	equ	STR_116+20
STR_34	equ	STR_116+20
STR_37	equ	STR_116+20
STR_38	equ	STR_116+20
STR_39	equ	STR_116+20
STR_42	equ	STR_116+20
STR_43	equ	STR_116+20
STR_44	equ	STR_116+20
STR_47	equ	STR_116+20
STR_48	equ	STR_116+20
STR_49	equ	STR_116+20
STR_52	equ	STR_116+20
STR_53	equ	STR_116+20
STR_54	equ	STR_116+20
STR_58	equ	STR_116+20
STR_59	equ	STR_116+20
STR_181	equ	STR_116+20
STR_187	equ	STR_116+20
STR_188	equ	STR_116+20
STR_189	equ	STR_116+20
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
menu_update_numeric_value@F2607:
       ds      6
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
	line	28
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
psect	dataBANK0,class=BANK0,space=1,noexec,lowdata
global __pdataBANK0
__pdataBANK0:
	file	"src\menu.c"
	line	84
_value_display:
       ds      10
psect	dataBANK0
	file	"src\menu.c"
	line	85
_value_back:
       ds      5
psect	bssBANK1,class=BANK1,space=1,noexec,lowdata
global __pbssBANK1
__pbssBANK1:
	global	_menu
_menu:
       ds      22
main@blink_timer:
       ds      4
main@encoder_activity_timer:
       ds      2
	global	_encoder_count
_encoder_count:
       ds      2
main@last_menu_state:
       ds      1
	global	_current_menu
_current_menu:
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
	global	_current_input
_current_input:
       ds      1
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
	line	75
_value_scale4:
       ds      10
psect	bssBANK2,class=BANK2,space=1,noexec,lowdata
global __pbssBANK2
__pbssBANK2:
	global	_input_menu
_input_menu:
       ds      75
psect	dataBANK2,class=BANK2,space=1,noexec,lowdata
global __pdataBANK2
__pdataBANK2:
	file	"src\menu.c"
	line	65
	global	_options_menu
_options_menu:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	74
_value_sensor:
       ds      12
psect	dataBANK2
	file	"src\menu.c"
	line	93
_value_no_flow:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	92
_value_flow_units:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	91
_value_flow_type:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	90
_value_high_temp:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	89
_value_low_pressure:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	88
_value_hi_pressure:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	83
_value_rlylow:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	82
_value_rlyslp:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	81
_value_rlyplp:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	80
_value_rlyhigh:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	79
_value_slpbp:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	78
_value_plpbp:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	77
_value_highbp:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	76
_value_scale20:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	73
_value_enable:
       ds      10
psect	bssBANK3,class=BANK3,space=1,noexec,lowdata
global __pbssBANK3
__pbssBANK3:
	global	_system_config
_system_config:
       ds      128
_original_value:
       ds      10
psect	dataBANK3,class=BANK3,space=1,noexec,lowdata
global __pdataBANK3
__pdataBANK3:
	file	"src\menu.c"
	line	1186
menu_draw_setup@F2636:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	97
_value_high_tbp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	96
_value_low_flow_bp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	95
_value_no_flow_bp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	94
_value_low_flow:
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
; Initialize objects allocated to BANK3 (50 bytes)
	global __pidataBANK3
	; load TBLPTR registers with __pidataBANK3
	movlw	low (__pidataBANK3)
	movwf	tblptrl
	movlw	high(__pidataBANK3)
	movwf	tblptrh
	movlw	low highword(__pidataBANK3)
	movwf	tblptru
	lfsr	0,__pdataBANK3
	lfsr	1,50
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK2 (172 bytes)
	global __pidataBANK2
	; load TBLPTR registers with __pidataBANK2
	movlw	low (__pidataBANK2)
	movwf	tblptrl
	movlw	high(__pidataBANK2)
	movwf	tblptrh
	movlw	low highword(__pidataBANK2)
	movwf	tblptru
	lfsr	0,__pdataBANK2
	lfsr	1,172
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
; Initialize objects allocated to BANK1 (11 bytes)
	global __pidataBANK1
	; load TBLPTR registers with __pidataBANK1
	movlw	low (__pidataBANK1)
	movwf	tblptrl
	movlw	high(__pidataBANK1)
	movwf	tblptrh
	movlw	low highword(__pidataBANK1)
	movwf	tblptru
	lfsr	0,__pdataBANK1
	lfsr	1,11
	copy_data2:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data2
; Initialize objects allocated to BANK0 (15 bytes)
	global __pidataBANK0
	; load TBLPTR registers with __pidataBANK0
	movlw	low (__pidataBANK0)
	movwf	tblptrl
	movlw	high(__pidataBANK0)
	movwf	tblptrh
	movlw	low highword(__pidataBANK0)
	movwf	tblptru
	lfsr	0,__pdataBANK0
	lfsr	1,15
	copy_data3:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data3
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
	copy_data4:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data4
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
; Clear objects allocated to BANK3 (138 bytes)
	global __pbssBANK3
lfsr	0,__pbssBANK3
movlw	138
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
; Clear objects allocated to BANK2 (75 bytes)
	global __pbssBANK2
lfsr	0,__pbssBANK2
movlw	75
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
; Clear objects allocated to BANK1 (37 bytes)
	global __pbssBANK1
lfsr	0,__pbssBANK1
movlw	37
clear_3:
clrf	postinc0,c
decf	wreg
bnz	clear_3
; Clear objects allocated to COMRAM (23 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	23
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
psect	cstackBANK1,class=BANK1,space=1,noexec,lowdata
global __pcstackBANK1
__pcstackBANK1:
	global	menu_handle_button@buf
menu_handle_button@buf:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_button@buf_1368
menu_handle_button@buf_1368:	; 50 bytes @ 0x32
	ds   50
	global	menu_handle_button@edit_flag
menu_handle_button@edit_flag:	; 2 bytes @ 0x64
	ds   2
	global	menu_handle_button@opts
menu_handle_button@opts:	; 2 bytes @ 0x66
	ds   2
	global	menu_handle_button@edit_flag_1371
menu_handle_button@edit_flag_1371:	; 2 bytes @ 0x68
	ds   2
	global	menu_handle_button@opts_1372
menu_handle_button@opts_1372:	; 2 bytes @ 0x6A
	ds   2
	global	menu_handle_button@current_val_1367
menu_handle_button@current_val_1367:	; 2 bytes @ 0x6C
	ds   2
	global	menu_handle_button@i
menu_handle_button@i:	; 1 bytes @ 0x6E
	ds   1
	global	menu_handle_button@press_type
menu_handle_button@press_type:	; 1 bytes @ 0x6F
	ds   1
	global	menu_handle_button@current_val
menu_handle_button@current_val:	; 2 bytes @ 0x70
	ds   2
	global	menu_handle_button@new_seconds
menu_handle_button@new_seconds:	; 2 bytes @ 0x72
	ds   2
	global	menu_handle_button@flow_type_1364
menu_handle_button@flow_type_1364:	; 1 bytes @ 0x74
	ds   1
	global	menu_handle_button@flow_type
menu_handle_button@flow_type:	; 1 bytes @ 0x75
	ds   1
	global	menu_handle_button@sensor_type_1363
menu_handle_button@sensor_type_1363:	; 1 bytes @ 0x76
	ds   1
	global	menu_handle_button@sensor_type
menu_handle_button@sensor_type:	; 1 bytes @ 0x77
	ds   1
	global	menu_handle_button@new_value
menu_handle_button@new_value:	; 2 bytes @ 0x78
	ds   2
	global	main@buf
main@buf:	; 40 bytes @ 0x7A
	ds   40
	global	main@buf_623
main@buf_623:	; 30 bytes @ 0xA2
	ds   30
	global	main@last_button
main@last_button:	; 1 bytes @ 0xC0
	ds   1
	global	main@sensor_type
main@sensor_type:	; 1 bytes @ 0xC1
	ds   1
	global	main@flow_type
main@flow_type:	; 1 bytes @ 0xC2
	ds   1
	global	main@sensor_type_620
main@sensor_type_620:	; 1 bytes @ 0xC3
	ds   1
	global	main@flow_type_621
main@flow_type_621:	; 1 bytes @ 0xC4
	ds   1
	global	main@sensor_type_635
main@sensor_type_635:	; 1 bytes @ 0xC5
	ds   1
	global	main@flow_type_636
main@flow_type_636:	; 1 bytes @ 0xC6
	ds   1
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0xC7
	ds   2
	global	main@current_event
main@current_event:	; 1 bytes @ 0xC9
	ds   1
	global	main@delta
main@delta:	; 2 bytes @ 0xCA
	ds   2
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
	global	init_time_editor@buf
init_time_editor@buf:	; 60 bytes @ 0x0
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
	global	_menu_update_edit_value$1222
_menu_update_edit_value$1222:	; 2 bytes @ 0x16
	ds   2
	global	_menu_update_edit_value$1226
_menu_update_edit_value$1226:	; 2 bytes @ 0x18
	ds   1
	global	menu_draw_input@start_pos
menu_draw_input@start_pos:	; 1 bytes @ 0x19
	ds   1
	global	menu_update_edit_value@start_col
menu_update_edit_value@start_col:	; 1 bytes @ 0x1A
	global	_menu_draw_input$1288
_menu_draw_input$1288:	; 2 bytes @ 0x1A
	ds   1
	global	menu_update_edit_value@blink_pos
menu_update_edit_value@blink_pos:	; 1 bytes @ 0x1B
	ds   1
	global	menu_update_edit_value@screen_line
menu_update_edit_value@screen_line:	; 1 bytes @ 0x1C
	global	_menu_draw_input$1292
_menu_draw_input$1292:	; 2 bytes @ 0x1C
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
	global	menu_draw_input@opts_1274
menu_draw_input@opts_1274:	; 2 bytes @ 0x24
	ds   2
	global	menu_draw_input@flag_1278
menu_draw_input@flag_1278:	; 2 bytes @ 0x26
	ds   2
	global	menu_draw_input@val_len_1282
menu_draw_input@val_len_1282:	; 1 bytes @ 0x28
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
	global	_handle_time_rotation$1081
_handle_time_rotation$1081:	; 2 bytes @ 0x32
	global	_rebuild_input_menu$1115
_rebuild_input_menu$1115:	; 2 bytes @ 0x32
	global	_handle_numeric_rotation$1211
_handle_numeric_rotation$1211:	; 2 bytes @ 0x32
	global	menu_update_time_value@debug_after
menu_update_time_value@debug_after:	; 50 bytes @ 0x32
	ds   2
	global	handle_time_rotation@direction
handle_time_rotation@direction:	; 1 bytes @ 0x34
	global	_rebuild_input_menu$1129
_rebuild_input_menu$1129:	; 2 bytes @ 0x34
	global	_handle_numeric_rotation$1213
_handle_numeric_rotation$1213:	; 2 bytes @ 0x34
	ds   2
	global	handle_numeric_rotation@max_tens
handle_numeric_rotation@max_tens:	; 1 bytes @ 0x36
	global	_rebuild_input_menu$1130
_rebuild_input_menu$1130:	; 2 bytes @ 0x36
	ds   1
	global	handle_numeric_rotation@max_units
handle_numeric_rotation@max_units:	; 1 bytes @ 0x37
	ds   1
	global	handle_numeric_rotation@direction
handle_numeric_rotation@direction:	; 1 bytes @ 0x38
	global	_rebuild_input_menu$1136
_rebuild_input_menu$1136:	; 2 bytes @ 0x38
	ds   2
	global	_rebuild_input_menu$1137
_rebuild_input_menu$1137:	; 2 bytes @ 0x3A
	ds   2
	global	_rebuild_input_menu$1143
_rebuild_input_menu$1143:	; 2 bytes @ 0x3C
	ds   2
	global	_rebuild_input_menu$1144
_rebuild_input_menu$1144:	; 2 bytes @ 0x3E
	ds   2
	global	_rebuild_input_menu$1148
_rebuild_input_menu$1148:	; 2 bytes @ 0x40
	ds   2
	global	_rebuild_input_menu$1162
_rebuild_input_menu$1162:	; 2 bytes @ 0x42
	ds   2
	global	_rebuild_input_menu$1163
_rebuild_input_menu$1163:	; 2 bytes @ 0x44
	ds   2
	global	_rebuild_input_menu$1167
_rebuild_input_menu$1167:	; 2 bytes @ 0x46
	ds   2
	global	_rebuild_input_menu$1172
_rebuild_input_menu$1172:	; 2 bytes @ 0x48
	ds   2
	global	_rebuild_input_menu$1176
_rebuild_input_menu$1176:	; 2 bytes @ 0x4A
	ds   2
	global	_rebuild_input_menu$1182
_rebuild_input_menu$1182:	; 2 bytes @ 0x4C
	ds   2
	global	_rebuild_input_menu$1183
_rebuild_input_menu$1183:	; 2 bytes @ 0x4E
	ds   2
	global	_rebuild_input_menu$1187
_rebuild_input_menu$1187:	; 2 bytes @ 0x50
	ds   2
	global	rebuild_input_menu@flow_type_val
rebuild_input_menu@flow_type_val:	; 1 bytes @ 0x52
	ds   1
	global	rebuild_input_menu@sensor
rebuild_input_menu@sensor:	; 1 bytes @ 0x53
	ds   1
	global	_rebuild_input_menu$2308
_rebuild_input_menu$2308:	; 2 bytes @ 0x54
	ds   2
	global	_rebuild_input_menu$2309
_rebuild_input_menu$2309:	; 2 bytes @ 0x56
	ds   2
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
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_isdigit:	; 1 bit 
?_eeprom_init:	; 1 bytes @ 0x0
?_encoder_init:	; 1 bytes @ 0x0
?_menu_init:	; 1 bytes @ 0x0
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
?_get_menu_timeout_seconds:	; 1 bytes @ 0x0
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
?_is_numeric_field:	; 1 bytes @ 0xE
?_is_time_field:	; 1 bytes @ 0xE
??_get_menu_timeout_seconds:	; 1 bytes @ 0xE
??_sync_menu_variables:	; 1 bytes @ 0xE
??_isdigit:	; 1 bytes @ 0xE
??_uart_init:	; 1 bytes @ 0xE
??_uart_write:	; 1 bytes @ 0xE
??_system_init:	; 1 bytes @ 0xE
??_lcd_write_nibble:	; 1 bytes @ 0xE
?_beep:	; 1 bytes @ 0xE
?_is_option_field:	; 1 bytes @ 0xE
?_eeprom_read_byte:	; 1 bytes @ 0xE
?_eeprom_write_byte:	; 1 bytes @ 0xE
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
	global	lcd_write_nibble@nibble
lcd_write_nibble@nibble:	; 1 bytes @ 0xE
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
??_lcd_cmd:	; 1 bytes @ 0xF
??_lcd_data:	; 1 bytes @ 0xF
??___lbdiv:	; 1 bytes @ 0xF
??___lbmod:	; 1 bytes @ 0xF
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0xF
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
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0xF
	global	___lbmod@dividend
___lbmod@dividend:	; 1 bytes @ 0xF
	global	_isdigit$2057
_isdigit$2057:	; 1 bytes @ 0xF
	global	uart_print@str
uart_print@str:	; 2 bytes @ 0xF
	ds   1
??_is_numeric_field:	; 1 bytes @ 0x10
??_is_time_field:	; 1 bytes @ 0x10
??_strlen:	; 1 bytes @ 0x10
??_get_option_edit_flag:	; 1 bytes @ 0x10
??_get_item_options_for_field:	; 1 bytes @ 0x10
?_lcd_print:	; 1 bytes @ 0x10
??_beep:	; 1 bytes @ 0x10
??_is_option_field:	; 1 bytes @ 0x10
??_get_current_numeric_value:	; 1 bytes @ 0x10
??_calculate_config_checksum:	; 1 bytes @ 0x10
??_eeprom_read_byte:	; 1 bytes @ 0x10
?_eeprom_read_block:	; 1 bytes @ 0x10
	global	?_eeprom_read_word
?_eeprom_read_word:	; 2 bytes @ 0x10
	global	lcd_cmd@cmd
lcd_cmd@cmd:	; 1 bytes @ 0x10
	global	_is_numeric_field$1041
_is_numeric_field$1041:	; 1 bytes @ 0x10
	global	_is_time_field$1048
_is_time_field$1048:	; 1 bytes @ 0x10
	global	_is_option_field$1053
_is_option_field$1053:	; 1 bytes @ 0x10
	global	get_option_edit_flag@line
get_option_edit_flag@line:	; 1 bytes @ 0x10
	global	get_item_options_for_field@line
get_item_options_for_field@line:	; 1 bytes @ 0x10
	global	eeprom_write_byte@data
eeprom_write_byte@data:	; 1 bytes @ 0x10
	global	___lbdiv@counter
___lbdiv@counter:	; 1 bytes @ 0x10
	global	___lbmod@counter
___lbmod@counter:	; 1 bytes @ 0x10
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
	global	_is_numeric_field$1042
_is_numeric_field$1042:	; 1 bytes @ 0x11
	global	is_time_field@line
is_time_field@line:	; 1 bytes @ 0x11
	global	_is_option_field$1054
_is_option_field$1054:	; 1 bytes @ 0x11
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
	ds   1
??_strcpy:	; 1 bytes @ 0x12
??_strcmp:	; 1 bytes @ 0x12
??_lcd_print:	; 1 bytes @ 0x12
??_lcd_set_cursor:	; 1 bytes @ 0x12
??_eeprom_read_word:	; 1 bytes @ 0x12
??___wmul:	; 1 bytes @ 0x12
??___lwmod:	; 1 bytes @ 0x12
	global	lcd_set_cursor@row
lcd_set_cursor@row:	; 1 bytes @ 0x12
	global	_is_numeric_field$1043
_is_numeric_field$1043:	; 1 bytes @ 0x12
	global	_is_option_field$1055
_is_option_field$1055:	; 1 bytes @ 0x12
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
??_uart_println:	; 1 bytes @ 0x13
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x13
	global	lcd_set_cursor@address
lcd_set_cursor@address:	; 1 bytes @ 0x13
	global	is_numeric_field@line
is_numeric_field@line:	; 1 bytes @ 0x13
	global	_is_option_field$1056
_is_option_field$1056:	; 1 bytes @ 0x13
	global	calculate_config_checksum@data
calculate_config_checksum@data:	; 2 bytes @ 0x13
	global	eeprom_write_word@data
eeprom_write_word@data:	; 2 bytes @ 0x13
	global	eeprom_write_block@address
eeprom_write_block@address:	; 2 bytes @ 0x13
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x13
	ds   1
??_menu_update_numeric_value:	; 1 bytes @ 0x14
??_memcpy:	; 1 bytes @ 0x14
?_lcd_print_at:	; 1 bytes @ 0x14
??_lcd_clear_line:	; 1 bytes @ 0x14
	global	is_option_field@line
is_option_field@line:	; 1 bytes @ 0x14
	global	lcd_print_at@col
lcd_print_at@col:	; 1 bytes @ 0x14
	global	lcd_clear_line@row
lcd_clear_line@row:	; 1 bytes @ 0x14
	global	menu_update_numeric_value@sensor_type
menu_update_numeric_value@sensor_type:	; 1 bytes @ 0x14
	global	strcmp@r
strcmp@r:	; 1 bytes @ 0x14
	global	eeprom_read_block@length
eeprom_read_block@length:	; 2 bytes @ 0x14
	global	memcpy@d
memcpy@d:	; 2 bytes @ 0x14
	ds   1
??_eeprom_write_word:	; 1 bytes @ 0x15
	global	menu_update_numeric_value@flow_type
menu_update_numeric_value@flow_type:	; 1 bytes @ 0x15
	global	lcd_print_at@str
lcd_print_at@str:	; 2 bytes @ 0x15
	global	calculate_config_checksum@j
calculate_config_checksum@j:	; 2 bytes @ 0x15
	global	eeprom_read_word@result
eeprom_read_word@result:	; 2 bytes @ 0x15
	global	eeprom_write_block@length
eeprom_write_block@length:	; 2 bytes @ 0x15
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x15
	ds   1
??_eeprom_read_block:	; 1 bytes @ 0x16
	global	get_current_numeric_value@value
get_current_numeric_value@value:	; 2 bytes @ 0x16
	global	_menu_update_numeric_value$1237
_menu_update_numeric_value$1237:	; 2 bytes @ 0x16
	global	eeprom_read_block@ptr
eeprom_read_block@ptr:	; 2 bytes @ 0x16
	global	memcpy@s
memcpy@s:	; 2 bytes @ 0x16
	ds   1
??_lcd_print_at:	; 1 bytes @ 0x17
??_eeprom_write_block:	; 1 bytes @ 0x17
??___lwdiv:	; 1 bytes @ 0x17
	global	lcd_print_at@row
lcd_print_at@row:	; 1 bytes @ 0x17
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x17
	global	calculate_config_checksum@j_1531
calculate_config_checksum@j_1531:	; 2 bytes @ 0x17
	global	eeprom_write_block@ptr
eeprom_write_block@ptr:	; 2 bytes @ 0x17
	ds   1
??_menu_draw_options:	; 1 bytes @ 0x18
??_menu_draw_setup:	; 1 bytes @ 0x18
	global	menu_draw_options@item_index
menu_draw_options@item_index:	; 1 bytes @ 0x18
	global	memcpy@tmp
memcpy@tmp:	; 1 bytes @ 0x18
	global	_menu_update_numeric_value$1238
_menu_update_numeric_value$1238:	; 2 bytes @ 0x18
	global	eeprom_read_block@i
eeprom_read_block@i:	; 2 bytes @ 0x18
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x18
	global	menu_draw_setup@setup_labels
menu_draw_setup@setup_labels:	; 10 bytes @ 0x18
	ds   1
??_load_factory_defaults:	; 1 bytes @ 0x19
	global	menu_draw_options@i
menu_draw_options@i:	; 1 bytes @ 0x19
	global	calculate_config_checksum@i
calculate_config_checksum@i:	; 1 bytes @ 0x19
	global	eeprom_write_block@i
eeprom_write_block@i:	; 2 bytes @ 0x19
	ds   1
?_init_numeric_editor:	; 1 bytes @ 0x1A
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x1A
	global	init_numeric_editor@value
init_numeric_editor@value:	; 2 bytes @ 0x1A
	global	_menu_update_numeric_value$1239
_menu_update_numeric_value$1239:	; 2 bytes @ 0x1A
	global	sprintf@sp
sprintf@sp:	; 2 bytes @ 0x1A
	ds   1
??_save_current_config:	; 1 bytes @ 0x1B
	global	save_current_config@checksum
save_current_config@checksum:	; 2 bytes @ 0x1B
	ds   1
??_init_numeric_editor:	; 1 bytes @ 0x1C
	global	_menu_update_numeric_value$1240
_menu_update_numeric_value$1240:	; 2 bytes @ 0x1C
	global	sprintf@f
sprintf@f:	; 2 bytes @ 0x1C
	ds   1
	global	save_current_config@i
save_current_config@i:	; 1 bytes @ 0x1D
	ds   1
??_eeprom_init:	; 1 bytes @ 0x1E
	global	init_numeric_editor@flow_type
init_numeric_editor@flow_type:	; 1 bytes @ 0x1E
	global	_menu_update_numeric_value$1241
_menu_update_numeric_value$1241:	; 2 bytes @ 0x1E
	global	eeprom_init@stored_checksum
eeprom_init@stored_checksum:	; 2 bytes @ 0x1E
	ds   1
	global	_init_numeric_editor$1201
_init_numeric_editor$1201:	; 2 bytes @ 0x1F
	ds   1
	global	_menu_update_numeric_value$1242
_menu_update_numeric_value$1242:	; 2 bytes @ 0x20
	global	eeprom_init@calculated_checksum
eeprom_init@calculated_checksum:	; 2 bytes @ 0x20
	ds   1
	global	init_numeric_editor@sensor_type
init_numeric_editor@sensor_type:	; 1 bytes @ 0x21
	ds   1
	global	eeprom_init@i
eeprom_init@i:	; 1 bytes @ 0x22
	global	init_numeric_editor@abs_val
init_numeric_editor@abs_val:	; 2 bytes @ 0x22
	global	_menu_update_numeric_value$1243
_menu_update_numeric_value$1243:	; 2 bytes @ 0x22
	global	_menu_draw_setup$1312
_menu_draw_setup$1312:	; 2 bytes @ 0x22
	ds   2
	global	_menu_update_numeric_value$1244
_menu_update_numeric_value$1244:	; 2 bytes @ 0x24
	global	_menu_draw_setup$1318
_menu_draw_setup$1318:	; 2 bytes @ 0x24
	ds   2
??_sprintf:	; 1 bytes @ 0x26
	global	_menu_update_numeric_value$1246
_menu_update_numeric_value$1246:	; 2 bytes @ 0x26
	global	menu_draw_setup@label
menu_draw_setup@label:	; 2 bytes @ 0x26
	ds   2
	global	menu_draw_setup@sensor
menu_draw_setup@sensor:	; 1 bytes @ 0x28
	global	menu_update_numeric_value@value_buf
menu_update_numeric_value@value_buf:	; 6 bytes @ 0x28
	ds   1
	global	menu_draw_setup@sensor_name
menu_draw_setup@sensor_name:	; 2 bytes @ 0x29
	global	_sprintf$1616
_sprintf$1616:	; 2 bytes @ 0x29
	ds   2
	global	menu_draw_setup@item_idx
menu_draw_setup@item_idx:	; 1 bytes @ 0x2B
	global	_sprintf$1617
_sprintf$1617:	; 2 bytes @ 0x2B
	ds   1
	global	menu_draw_setup@i
menu_draw_setup@i:	; 1 bytes @ 0x2C
	ds   1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x2D
	ds   1
	global	menu_update_numeric_value@start_col
menu_update_numeric_value@start_col:	; 1 bytes @ 0x2E
	global	sprintf@cp
sprintf@cp:	; 2 bytes @ 0x2E
	ds   1
	global	menu_update_numeric_value@screen_line
menu_update_numeric_value@screen_line:	; 1 bytes @ 0x2F
	ds   1
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x30
	ds   1
	global	sprintf@val
sprintf@val:	; 2 bytes @ 0x31
	ds   2
	global	sprintf@len
sprintf@len:	; 2 bytes @ 0x33
	ds   2
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x35
	ds   1
	global	sprintf@width
sprintf@width:	; 2 bytes @ 0x36
	ds   2
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x38
	ds   1
??_handle_numeric_rotation:	; 1 bytes @ 0x39
??_handle_time_rotation:	; 1 bytes @ 0x39
??_menu_update_time_value:	; 1 bytes @ 0x39
??_menu_update_edit_value:	; 1 bytes @ 0x39
??_menu_draw_input:	; 1 bytes @ 0x39
?_init_time_editor:	; 1 bytes @ 0x39
??_rebuild_input_menu:	; 1 bytes @ 0x39
	global	init_time_editor@value_seconds
init_time_editor@value_seconds:	; 2 bytes @ 0x39
	ds   2
	global	init_time_editor@mode
init_time_editor@mode:	; 1 bytes @ 0x3B
	ds   1
??_init_time_editor:	; 1 bytes @ 0x3C
	ds   2
?_menu_handle_encoder:	; 1 bytes @ 0x3E
??_menu_handle_button:	; 1 bytes @ 0x3E
	global	menu_handle_encoder@delta
menu_handle_encoder@delta:	; 2 bytes @ 0x3E
	ds   2
??_menu_handle_encoder:	; 1 bytes @ 0x40
	ds   5
	global	_menu_handle_encoder$1332
_menu_handle_encoder$1332:	; 2 bytes @ 0x45
	ds   2
	global	_menu_handle_encoder$1333
_menu_handle_encoder$1333:	; 2 bytes @ 0x47
	ds   2
	global	menu_handle_encoder@opts
menu_handle_encoder@opts:	; 2 bytes @ 0x49
	ds   2
	global	menu_handle_encoder@sensor_type
menu_handle_encoder@sensor_type:	; 1 bytes @ 0x4B
	ds   1
	global	menu_handle_encoder@flow_type
menu_handle_encoder@flow_type:	; 1 bytes @ 0x4C
	ds   1
	global	menu_handle_encoder@edit_flag
menu_handle_encoder@edit_flag:	; 2 bytes @ 0x4D
	ds   2
??_main:	; 1 bytes @ 0x4F
	ds   2
;!
;!Data Sizes:
;!    Strings     1315
;!    Constant    832
;!    Data        255
;!    BSS         657
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126     81     111
;!    BANK0           128    110     125
;!    BANK1           256    204     252
;!    BANK2           256      0     247
;!    BANK3           256      0     188
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
;!		 -> STR_100(CODE[10]), STR_101(CODE[11]), STR_102(CODE[9]), STR_103(CODE[12]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[8]), STR_106(CODE[5]), STR_65(CODE[7]), 
;!		 -> STR_66(CODE[7]), STR_67(CODE[10]), STR_68(CODE[11]), STR_69(CODE[12]), 
;!		 -> STR_70(CODE[9]), STR_71(CODE[13]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[8]), STR_76(CODE[8]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[5]), STR_79(CODE[7]), STR_80(CODE[7]), STR_81(CODE[10]), 
;!		 -> STR_82(CODE[11]), STR_83(CODE[10]), STR_84(CODE[9]), STR_85(CODE[9]), 
;!		 -> STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), STR_89(CODE[7]), 
;!		 -> STR_90(CODE[5]), STR_91(CODE[8]), STR_92(CODE[11]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[8]), STR_95(CODE[5]), STR_96(CODE[7]), STR_97(CODE[7]), 
;!		 -> STR_98(CODE[5]), STR_99(CODE[6]), 
;!
;!    flow_analog_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK0[10]), value_enable(BANK2[10]), value_flow_type(BANK2[10]), 
;!		 -> value_flow_units(BANK2[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK2[10]), 
;!		 -> value_highbp(BANK2[10]), value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_no_flow(BANK2[10]), value_no_flow_bp(BANK3[10]), value_plpbp(BANK2[10]), value_rlyhigh(BANK2[10]), 
;!		 -> value_rlylow(BANK2[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK1[10]), value_sensor(BANK2[12]), value_slpbp(BANK2[10]), NULL(NULL[0]), 
;!
;!    flow_digital_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[11]), STR_102(CODE[9]), STR_103(CODE[12]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[8]), STR_106(CODE[5]), STR_65(CODE[7]), 
;!		 -> STR_66(CODE[7]), STR_67(CODE[10]), STR_68(CODE[11]), STR_69(CODE[12]), 
;!		 -> STR_70(CODE[9]), STR_71(CODE[13]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[8]), STR_76(CODE[8]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[5]), STR_79(CODE[7]), STR_80(CODE[7]), STR_81(CODE[10]), 
;!		 -> STR_82(CODE[11]), STR_83(CODE[10]), STR_84(CODE[9]), STR_85(CODE[9]), 
;!		 -> STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), STR_89(CODE[7]), 
;!		 -> STR_90(CODE[5]), STR_91(CODE[8]), STR_92(CODE[11]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[8]), STR_95(CODE[5]), STR_96(CODE[7]), STR_97(CODE[7]), 
;!		 -> STR_98(CODE[5]), STR_99(CODE[6]), 
;!
;!    flow_digital_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK0[10]), value_enable(BANK2[10]), value_flow_type(BANK2[10]), 
;!		 -> value_flow_units(BANK2[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK2[10]), 
;!		 -> value_highbp(BANK2[10]), value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_no_flow(BANK2[10]), value_no_flow_bp(BANK3[10]), value_plpbp(BANK2[10]), value_rlyhigh(BANK2[10]), 
;!		 -> value_rlylow(BANK2[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK1[10]), value_sensor(BANK2[12]), value_slpbp(BANK2[10]), NULL(NULL[0]), 
;!
;!    input_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[11]), STR_102(CODE[9]), STR_103(CODE[12]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[8]), STR_106(CODE[5]), STR_65(CODE[7]), 
;!		 -> STR_66(CODE[7]), STR_67(CODE[10]), STR_68(CODE[11]), STR_69(CODE[12]), 
;!		 -> STR_70(CODE[9]), STR_71(CODE[13]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[8]), STR_76(CODE[8]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[5]), STR_79(CODE[7]), STR_80(CODE[7]), STR_81(CODE[10]), 
;!		 -> STR_82(CODE[11]), STR_83(CODE[10]), STR_84(CODE[9]), STR_85(CODE[9]), 
;!		 -> STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), STR_89(CODE[7]), 
;!		 -> STR_90(CODE[5]), STR_91(CODE[8]), STR_92(CODE[11]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[8]), STR_95(CODE[5]), STR_96(CODE[7]), STR_97(CODE[7]), 
;!		 -> STR_98(CODE[5]), STR_99(CODE[6]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK0[10]), value_enable(BANK2[10]), value_flow_type(BANK2[10]), 
;!		 -> value_flow_units(BANK2[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK2[10]), 
;!		 -> value_highbp(BANK2[10]), value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_no_flow(BANK2[10]), value_no_flow_bp(BANK3[10]), value_plpbp(BANK2[10]), value_rlyhigh(BANK2[10]), 
;!		 -> value_rlylow(BANK2[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK1[10]), value_sensor(BANK2[12]), value_slpbp(BANK2[10]), NULL(NULL[0]), 
;!
;!    lcd_print@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> Fake(UNKNOWN), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), 
;!		 -> menu_update_numeric_value@value_buf(COMRAM[6]), menu_update_time_value@value_buf(BANK0[6]), STR_100(CODE[10]), STR_101(CODE[11]), 
;!		 -> STR_102(CODE[9]), STR_103(CODE[12]), STR_104(CODE[8]), STR_105(CODE[8]), 
;!		 -> STR_106(CODE[5]), STR_113(CODE[8]), STR_114(CODE[2]), STR_115(CODE[2]), 
;!		 -> STR_116(CODE[21]), STR_16(CODE[12]), STR_17(CODE[6]), STR_170(CODE[7]), 
;!		 -> STR_171(CODE[2]), STR_172(CODE[2]), STR_173(CODE[6]), STR_174(CODE[2]), 
;!		 -> STR_175(CODE[2]), STR_176(CODE[21]), STR_177(CODE[2]), STR_178(CODE[2]), 
;!		 -> STR_182(CODE[2]), STR_183(CODE[2]), STR_184(CODE[2]), STR_185(CODE[2]), 
;!		 -> STR_186(CODE[21]), STR_187(CODE[1]), STR_188(CODE[1]), STR_189(CODE[1]), 
;!		 -> STR_190(CODE[6]), STR_191(CODE[5]), STR_192(CODE[9]), STR_193(CODE[5]), 
;!		 -> STR_194(CODE[5]), STR_195(CODE[2]), STR_196(CODE[2]), STR_197(CODE[2]), 
;!		 -> STR_198(CODE[2]), STR_199(CODE[2]), STR_200(CODE[2]), STR_22(CODE[12]), 
;!		 -> STR_23(CODE[8]), STR_3(CODE[13]), STR_4(CODE[16]), STR_60(CODE[10]), 
;!		 -> STR_61(CODE[11]), STR_62(CODE[13]), STR_63(CODE[6]), STR_64(CODE[5]), 
;!		 -> STR_65(CODE[7]), STR_66(CODE[7]), STR_67(CODE[10]), STR_68(CODE[11]), 
;!		 -> STR_69(CODE[12]), STR_70(CODE[9]), STR_71(CODE[13]), STR_72(CODE[6]), 
;!		 -> STR_73(CODE[6]), STR_74(CODE[9]), STR_75(CODE[8]), STR_76(CODE[8]), 
;!		 -> STR_77(CODE[8]), STR_78(CODE[5]), STR_79(CODE[7]), STR_80(CODE[7]), 
;!		 -> STR_81(CODE[10]), STR_82(CODE[11]), STR_83(CODE[10]), STR_84(CODE[9]), 
;!		 -> STR_85(CODE[9]), STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), 
;!		 -> STR_89(CODE[7]), STR_90(CODE[5]), STR_91(CODE[8]), STR_92(CODE[11]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[5]), STR_96(CODE[7]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[5]), STR_99(CODE[6]), 
;!
;!    lcd_print_at@str	PTR const unsigned char  size(2) Largest target is 15
;!		 -> Fake(UNKNOWN), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), STR_100(CODE[10]), 
;!		 -> STR_101(CODE[11]), STR_102(CODE[9]), STR_103(CODE[12]), STR_104(CODE[8]), 
;!		 -> STR_105(CODE[8]), STR_106(CODE[5]), STR_187(CODE[1]), STR_188(CODE[1]), 
;!		 -> STR_189(CODE[1]), STR_190(CODE[6]), STR_191(CODE[5]), STR_192(CODE[9]), 
;!		 -> STR_193(CODE[5]), STR_194(CODE[5]), STR_60(CODE[10]), STR_61(CODE[11]), 
;!		 -> STR_62(CODE[13]), STR_63(CODE[6]), STR_64(CODE[5]), STR_65(CODE[7]), 
;!		 -> STR_66(CODE[7]), STR_67(CODE[10]), STR_68(CODE[11]), STR_69(CODE[12]), 
;!		 -> STR_70(CODE[9]), STR_71(CODE[13]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[8]), STR_76(CODE[8]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[5]), STR_79(CODE[7]), STR_80(CODE[7]), STR_81(CODE[10]), 
;!		 -> STR_82(CODE[11]), STR_83(CODE[10]), STR_84(CODE[9]), STR_85(CODE[9]), 
;!		 -> STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), STR_89(CODE[7]), 
;!		 -> STR_90(CODE[5]), STR_91(CODE[8]), STR_92(CODE[11]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[8]), STR_95(CODE[5]), STR_96(CODE[7]), STR_97(CODE[7]), 
;!		 -> STR_98(CODE[5]), STR_99(CODE[6]), 
;!
;!    memcpy@d	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), input_menu(BANK2[75]), system_config(BANK3[128]), 
;!
;!    memcpy@d1	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), input_menu(BANK2[75]), system_config(BANK3[128]), 
;!
;!    memcpy@s	PTR const unsigned char  size(2) Largest target is 384
;!		 -> factory_defaults(CODE[384]), flow_analog_template(CODE[55]), flow_digital_template(CODE[40]), pressure_menu_template(CODE[70]), 
;!		 -> system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    memcpy@s1	PTR const void  size(2) Largest target is 384
;!		 -> factory_defaults(CODE[384]), flow_analog_template(CODE[55]), flow_digital_template(CODE[40]), pressure_menu_template(CODE[70]), 
;!		 -> system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    menu_draw_input$1288	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_182(CODE[2]), STR_183(CODE[2]), 
;!
;!    menu_draw_input$1292	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_184(CODE[2]), STR_185(CODE[2]), 
;!
;!    menu_draw_input@flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@flag_1278	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_25(CODE[9]), STR_26(CODE[8]), STR_27(CODE[1]), STR_28(CODE[1]), 
;!		 -> STR_29(CODE[1]), STR_30(CODE[9]), STR_31(CODE[5]), STR_32(CODE[5]), 
;!		 -> STR_33(CODE[1]), STR_34(CODE[1]), STR_35(CODE[7]), STR_36(CODE[8]), 
;!		 -> STR_37(CODE[1]), STR_38(CODE[1]), STR_39(CODE[1]), STR_40(CODE[4]), 
;!		 -> STR_41(CODE[5]), STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[1]), 
;!		 -> STR_45(CODE[2]), STR_46(CODE[4]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[5]), STR_51(CODE[5]), STR_52(CODE[1]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[6]), STR_56(CODE[6]), 
;!		 -> STR_57(CODE[9]), STR_58(CODE[1]), STR_59(CODE[1]), 
;!
;!    menu_draw_input@opts_1274	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts_1274$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_25(CODE[9]), STR_26(CODE[8]), STR_27(CODE[1]), STR_28(CODE[1]), 
;!		 -> STR_29(CODE[1]), STR_30(CODE[9]), STR_31(CODE[5]), STR_32(CODE[5]), 
;!		 -> STR_33(CODE[1]), STR_34(CODE[1]), STR_35(CODE[7]), STR_36(CODE[8]), 
;!		 -> STR_37(CODE[1]), STR_38(CODE[1]), STR_39(CODE[1]), STR_40(CODE[4]), 
;!		 -> STR_41(CODE[5]), STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[1]), 
;!		 -> STR_45(CODE[2]), STR_46(CODE[4]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[5]), STR_51(CODE[5]), STR_52(CODE[1]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[6]), STR_56(CODE[6]), 
;!		 -> STR_57(CODE[9]), STR_58(CODE[1]), STR_59(CODE[1]), 
;!
;!    menu_draw_setup$1312	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_193(CODE[5]), STR_194(CODE[5]), 
;!
;!    menu_draw_setup$1318	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_197(CODE[2]), STR_198(CODE[2]), 
;!
;!    menu_draw_setup@F2636	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_187(CODE[1]), STR_188(CODE[1]), STR_189(CODE[1]), STR_190(CODE[6]), 
;!		 -> STR_191(CODE[5]), 
;!
;!    menu_draw_setup@label	PTR const unsigned char  size(2) Largest target is 6
;!		 -> STR_187(CODE[1]), STR_188(CODE[1]), STR_189(CODE[1]), STR_190(CODE[6]), 
;!		 -> STR_191(CODE[5]), 
;!
;!    menu_draw_setup@sensor_name	PTR const unsigned char  size(2) Largest target is 9
;!		 -> Fake(UNKNOWN), STR_192(CODE[9]), STR_193(CODE[5]), STR_194(CODE[5]), 
;!
;!    menu_draw_setup@setup_labels	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_187(CODE[1]), STR_188(CODE[1]), STR_189(CODE[1]), STR_190(CODE[6]), 
;!		 -> STR_191(CODE[5]), 
;!
;!    menu_handle_button@edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1371	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_25(CODE[9]), STR_26(CODE[8]), STR_27(CODE[1]), STR_28(CODE[1]), 
;!		 -> STR_29(CODE[1]), STR_30(CODE[9]), STR_31(CODE[5]), STR_32(CODE[5]), 
;!		 -> STR_33(CODE[1]), STR_34(CODE[1]), STR_35(CODE[7]), STR_36(CODE[8]), 
;!		 -> STR_37(CODE[1]), STR_38(CODE[1]), STR_39(CODE[1]), STR_40(CODE[4]), 
;!		 -> STR_41(CODE[5]), STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[1]), 
;!		 -> STR_45(CODE[2]), STR_46(CODE[4]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[5]), STR_51(CODE[5]), STR_52(CODE[1]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[6]), STR_56(CODE[6]), 
;!		 -> STR_57(CODE[9]), STR_58(CODE[1]), STR_59(CODE[1]), 
;!
;!    menu_handle_button@opts_1372	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1372$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_25(CODE[9]), STR_26(CODE[8]), STR_27(CODE[1]), STR_28(CODE[1]), 
;!		 -> STR_29(CODE[1]), STR_30(CODE[9]), STR_31(CODE[5]), STR_32(CODE[5]), 
;!		 -> STR_33(CODE[1]), STR_34(CODE[1]), STR_35(CODE[7]), STR_36(CODE[8]), 
;!		 -> STR_37(CODE[1]), STR_38(CODE[1]), STR_39(CODE[1]), STR_40(CODE[4]), 
;!		 -> STR_41(CODE[5]), STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[1]), 
;!		 -> STR_45(CODE[2]), STR_46(CODE[4]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[5]), STR_51(CODE[5]), STR_52(CODE[1]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[6]), STR_56(CODE[6]), 
;!		 -> STR_57(CODE[9]), STR_58(CODE[1]), STR_59(CODE[1]), 
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
;!		 -> STR_25(CODE[9]), STR_26(CODE[8]), STR_27(CODE[1]), STR_28(CODE[1]), 
;!		 -> STR_29(CODE[1]), STR_30(CODE[9]), STR_31(CODE[5]), STR_32(CODE[5]), 
;!		 -> STR_33(CODE[1]), STR_34(CODE[1]), STR_35(CODE[7]), STR_36(CODE[8]), 
;!		 -> STR_37(CODE[1]), STR_38(CODE[1]), STR_39(CODE[1]), STR_40(CODE[4]), 
;!		 -> STR_41(CODE[5]), STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[1]), 
;!		 -> STR_45(CODE[2]), STR_46(CODE[4]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[5]), STR_51(CODE[5]), STR_52(CODE[1]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[6]), STR_56(CODE[6]), 
;!		 -> STR_57(CODE[9]), STR_58(CODE[1]), STR_59(CODE[1]), 
;!
;!    menu_item_options$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_25(CODE[9]), STR_26(CODE[8]), STR_27(CODE[1]), STR_28(CODE[1]), 
;!		 -> STR_29(CODE[1]), STR_30(CODE[9]), STR_31(CODE[5]), STR_32(CODE[5]), 
;!		 -> STR_33(CODE[1]), STR_34(CODE[1]), STR_35(CODE[7]), STR_36(CODE[8]), 
;!		 -> STR_37(CODE[1]), STR_38(CODE[1]), STR_39(CODE[1]), STR_40(CODE[4]), 
;!		 -> STR_41(CODE[5]), STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[1]), 
;!		 -> STR_45(CODE[2]), STR_46(CODE[4]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[5]), STR_51(CODE[5]), STR_52(CODE[1]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[6]), STR_56(CODE[6]), 
;!		 -> STR_57(CODE[9]), STR_58(CODE[1]), STR_59(CODE[1]), 
;!
;!    options_menu	PTR const unsigned char [5] size(2) Largest target is 13
;!		 -> STR_60(CODE[10]), STR_61(CODE[11]), STR_62(CODE[13]), STR_63(CODE[6]), 
;!		 -> STR_64(CODE[5]), 
;!
;!    pressure_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[11]), STR_102(CODE[9]), STR_103(CODE[12]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[8]), STR_106(CODE[5]), STR_65(CODE[7]), 
;!		 -> STR_66(CODE[7]), STR_67(CODE[10]), STR_68(CODE[11]), STR_69(CODE[12]), 
;!		 -> STR_70(CODE[9]), STR_71(CODE[13]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[8]), STR_76(CODE[8]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[5]), STR_79(CODE[7]), STR_80(CODE[7]), STR_81(CODE[10]), 
;!		 -> STR_82(CODE[11]), STR_83(CODE[10]), STR_84(CODE[9]), STR_85(CODE[9]), 
;!		 -> STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), STR_89(CODE[7]), 
;!		 -> STR_90(CODE[5]), STR_91(CODE[8]), STR_92(CODE[11]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[8]), STR_95(CODE[5]), STR_96(CODE[7]), STR_97(CODE[7]), 
;!		 -> STR_98(CODE[5]), STR_99(CODE[6]), 
;!
;!    pressure_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK0[10]), value_enable(BANK2[10]), value_flow_type(BANK2[10]), 
;!		 -> value_flow_units(BANK2[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK2[10]), 
;!		 -> value_highbp(BANK2[10]), value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_no_flow(BANK2[10]), value_no_flow_bp(BANK3[10]), value_plpbp(BANK2[10]), value_rlyhigh(BANK2[10]), 
;!		 -> value_rlylow(BANK2[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK1[10]), value_sensor(BANK2[12]), value_slpbp(BANK2[10]), NULL(NULL[0]), 
;!
;!    rebuild_input_menu$1115	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_118(CODE[8]), STR_119(CODE[9]), 
;!
;!    rebuild_input_menu$1129	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_128(CODE[6]), STR_129(CODE[6]), STR_130(CODE[9]), 
;!
;!    rebuild_input_menu$1130	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_129(CODE[6]), STR_130(CODE[9]), 
;!
;!    rebuild_input_menu$1136	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_131(CODE[6]), STR_132(CODE[6]), STR_133(CODE[9]), 
;!
;!    rebuild_input_menu$1137	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_132(CODE[6]), STR_133(CODE[9]), 
;!
;!    rebuild_input_menu$1143	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_134(CODE[6]), STR_135(CODE[6]), STR_136(CODE[9]), 
;!
;!    rebuild_input_menu$1144	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_135(CODE[6]), STR_136(CODE[9]), 
;!
;!    rebuild_input_menu$1148	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_137(CODE[5]), STR_138(CODE[5]), 
;!
;!    rebuild_input_menu$1162	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_144(CODE[6]), STR_145(CODE[6]), STR_146(CODE[9]), 
;!
;!    rebuild_input_menu$1163	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_145(CODE[6]), STR_146(CODE[9]), 
;!
;!    rebuild_input_menu$1167	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_147(CODE[5]), STR_148(CODE[5]), 
;!
;!    rebuild_input_menu$1172	PTR const unsigned char  size(2) Largest target is 8
;!		 -> STR_150(CODE[7]), STR_151(CODE[8]), 
;!
;!    rebuild_input_menu$1176	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_152(CODE[5]), STR_153(CODE[5]), 
;!
;!    rebuild_input_menu$1182	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_154(CODE[6]), STR_155(CODE[6]), STR_156(CODE[9]), 
;!
;!    rebuild_input_menu$1183	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_155(CODE[6]), STR_156(CODE[9]), 
;!
;!    rebuild_input_menu$1187	PTR const unsigned char  size(2) Largest target is 4
;!		 -> STR_157(CODE[2]), STR_158(CODE[4]), 
;!
;!    S829$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_25(CODE[9]), STR_26(CODE[8]), STR_27(CODE[1]), STR_28(CODE[1]), 
;!		 -> STR_29(CODE[1]), STR_30(CODE[9]), STR_31(CODE[5]), STR_32(CODE[5]), 
;!		 -> STR_33(CODE[1]), STR_34(CODE[1]), STR_35(CODE[7]), STR_36(CODE[8]), 
;!		 -> STR_37(CODE[1]), STR_38(CODE[1]), STR_39(CODE[1]), STR_40(CODE[4]), 
;!		 -> STR_41(CODE[5]), STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[1]), 
;!		 -> STR_45(CODE[2]), STR_46(CODE[4]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[5]), STR_51(CODE[5]), STR_52(CODE[1]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[6]), STR_56(CODE[6]), 
;!		 -> STR_57(CODE[9]), STR_58(CODE[1]), STR_59(CODE[1]), 
;!
;!    S833$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[11]), STR_102(CODE[9]), STR_103(CODE[12]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[8]), STR_106(CODE[5]), STR_65(CODE[7]), 
;!		 -> STR_66(CODE[7]), STR_67(CODE[10]), STR_68(CODE[11]), STR_69(CODE[12]), 
;!		 -> STR_70(CODE[9]), STR_71(CODE[13]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[8]), STR_76(CODE[8]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[5]), STR_79(CODE[7]), STR_80(CODE[7]), STR_81(CODE[10]), 
;!		 -> STR_82(CODE[11]), STR_83(CODE[10]), STR_84(CODE[9]), STR_85(CODE[9]), 
;!		 -> STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), STR_89(CODE[7]), 
;!		 -> STR_90(CODE[5]), STR_91(CODE[8]), STR_92(CODE[11]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[8]), STR_95(CODE[5]), STR_96(CODE[7]), STR_97(CODE[7]), 
;!		 -> STR_98(CODE[5]), STR_99(CODE[6]), 
;!
;!    S833$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK0[10]), value_enable(BANK2[10]), value_flow_type(BANK2[10]), 
;!		 -> value_flow_units(BANK2[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK2[10]), 
;!		 -> value_highbp(BANK2[10]), value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_no_flow(BANK2[10]), value_no_flow_bp(BANK3[10]), value_plpbp(BANK2[10]), value_rlyhigh(BANK2[10]), 
;!		 -> value_rlylow(BANK2[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK1[10]), value_sensor(BANK2[12]), value_slpbp(BANK2[10]), NULL(NULL[0]), 
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
;!		 -> input_config(BIGRAM[384]), input_menu(BANK2[75]), system_config(BANK3[128]), 
;!
;!    sp__strcpy	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK3[10]), value_back(BANK0[5]), 
;!		 -> value_display(BANK0[10]), value_enable(BANK2[10]), value_flow_type(BANK2[10]), value_flow_units(BANK2[10]), 
;!		 -> value_hi_pressure(BANK2[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK2[10]), value_highbp(BANK2[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK2[10]), value_no_flow(BANK2[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK2[10]), value_rlyhigh(BANK2[10]), value_rlylow(BANK2[10]), 
;!		 -> value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(BANK2[10]), value_scale4(BANK1[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK2[10]), NULL(NULL[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 9
;!		 -> menu_update_time_value@value_buf(BANK0[6]), ?_sprintf(COMRAM[2]), sprintf@c(COMRAM[1]), STR_118(CODE[8]), 
;!		 -> STR_119(CODE[9]), STR_215(CODE[7]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 51
;!		 -> STR_107(CODE[35]), STR_109(CODE[45]), STR_11(CODE[23]), STR_110(CODE[25]), 
;!		 -> STR_111(CODE[51]), STR_112(CODE[27]), STR_117(CODE[3]), STR_12(CODE[17]), 
;!		 -> STR_121(CODE[6]), STR_122(CODE[6]), STR_123(CODE[5]), STR_124(CODE[10]), 
;!		 -> STR_125(CODE[5]), STR_126(CODE[10]), STR_127(CODE[10]), STR_140(CODE[6]), 
;!		 -> STR_141(CODE[6]), STR_142(CODE[3]), STR_143(CODE[10]), STR_159(CODE[6]), 
;!		 -> STR_160(CODE[6]), STR_161(CODE[5]), STR_162(CODE[10]), STR_164(CODE[10]), 
;!		 -> STR_165(CODE[48]), STR_167(CODE[29]), STR_168(CODE[7]), STR_169(CODE[9]), 
;!		 -> STR_179(CODE[9]), STR_201(CODE[26]), STR_202(CODE[10]), STR_204(CODE[6]), 
;!		 -> STR_205(CODE[6]), STR_206(CODE[5]), STR_207(CODE[5]), STR_208(CODE[6]), 
;!		 -> STR_209(CODE[6]), STR_210(CODE[5]), STR_211(CODE[6]), STR_212(CODE[6]), 
;!		 -> STR_213(CODE[5]), STR_214(CODE[38]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK1[40]), 
;!		 -> main@buf_623(BANK1[30]), menu_draw_input@title(BANK0[10]), menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1368(BANK1[50]), 
;!		 -> menu_update_edit_value@value_buf(BANK0[10]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), 
;!		 -> value_back(BANK0[5]), value_display(BANK0[10]), value_enable(BANK2[10]), value_flow_type(BANK2[10]), 
;!		 -> value_flow_units(BANK2[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK2[10]), 
;!		 -> value_highbp(BANK2[10]), value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_no_flow(BANK2[10]), value_no_flow_bp(BANK3[10]), value_plpbp(BANK2[10]), value_rlyhigh(BANK2[10]), 
;!		 -> value_rlylow(BANK2[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK1[10]), value_sensor(BANK2[12]), value_slpbp(BANK2[10]), NULL(NULL[0]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK0[10]), value_enable(BANK2[10]), value_flow_type(BANK2[10]), 
;!		 -> value_flow_units(BANK2[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK2[10]), 
;!		 -> value_highbp(BANK2[10]), value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_no_flow(BANK2[10]), value_no_flow_bp(BANK3[10]), value_plpbp(BANK2[10]), value_rlyhigh(BANK2[10]), 
;!		 -> value_rlylow(BANK2[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK1[10]), value_sensor(BANK2[12]), value_slpbp(BANK2[10]), NULL(NULL[0]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_181(CODE[1]), STR_25(CODE[9]), STR_26(CODE[8]), STR_27(CODE[1]), 
;!		 -> STR_28(CODE[1]), STR_29(CODE[1]), STR_30(CODE[9]), STR_31(CODE[5]), 
;!		 -> STR_32(CODE[5]), STR_33(CODE[1]), STR_34(CODE[1]), STR_35(CODE[7]), 
;!		 -> STR_36(CODE[8]), STR_37(CODE[1]), STR_38(CODE[1]), STR_39(CODE[1]), 
;!		 -> STR_40(CODE[4]), STR_41(CODE[5]), STR_42(CODE[1]), STR_43(CODE[1]), 
;!		 -> STR_44(CODE[1]), STR_45(CODE[2]), STR_46(CODE[4]), STR_47(CODE[1]), 
;!		 -> STR_48(CODE[1]), STR_49(CODE[1]), STR_50(CODE[5]), STR_51(CODE[5]), 
;!		 -> STR_52(CODE[1]), STR_53(CODE[1]), STR_54(CODE[1]), STR_55(CODE[6]), 
;!		 -> STR_56(CODE[6]), STR_57(CODE[9]), STR_58(CODE[1]), STR_59(CODE[1]), 
;!
;!    strcpy@cp	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK3[10]), value_back(BANK0[5]), 
;!		 -> value_display(BANK0[10]), value_enable(BANK2[10]), value_flow_type(BANK2[10]), value_flow_units(BANK2[10]), 
;!		 -> value_hi_pressure(BANK2[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK2[10]), value_highbp(BANK2[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK2[10]), value_no_flow(BANK2[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK2[10]), value_rlyhigh(BANK2[10]), value_rlylow(BANK2[10]), 
;!		 -> value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(BANK2[10]), value_scale4(BANK1[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK2[10]), NULL(NULL[0]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 12
;!		 -> menu_update_edit_value@value_buf(BANK0[10]), STR_120(CODE[9]), STR_128(CODE[6]), STR_129(CODE[6]), 
;!		 -> STR_130(CODE[9]), STR_131(CODE[6]), STR_132(CODE[6]), STR_133(CODE[9]), 
;!		 -> STR_134(CODE[6]), STR_135(CODE[6]), STR_136(CODE[9]), STR_137(CODE[5]), 
;!		 -> STR_138(CODE[5]), STR_139(CODE[5]), STR_144(CODE[6]), STR_145(CODE[6]), 
;!		 -> STR_146(CODE[9]), STR_147(CODE[5]), STR_148(CODE[5]), STR_149(CODE[5]), 
;!		 -> STR_150(CODE[7]), STR_151(CODE[8]), STR_152(CODE[5]), STR_153(CODE[5]), 
;!		 -> STR_154(CODE[6]), STR_155(CODE[6]), STR_156(CODE[9]), STR_157(CODE[2]), 
;!		 -> STR_158(CODE[4]), STR_163(CODE[4]), STR_180(CODE[6]), STR_25(CODE[9]), 
;!		 -> STR_26(CODE[8]), STR_27(CODE[1]), STR_28(CODE[1]), STR_29(CODE[1]), 
;!		 -> STR_30(CODE[9]), STR_31(CODE[5]), STR_32(CODE[5]), STR_33(CODE[1]), 
;!		 -> STR_34(CODE[1]), STR_35(CODE[7]), STR_36(CODE[8]), STR_37(CODE[1]), 
;!		 -> STR_38(CODE[1]), STR_39(CODE[1]), STR_40(CODE[4]), STR_41(CODE[5]), 
;!		 -> STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[1]), STR_45(CODE[2]), 
;!		 -> STR_46(CODE[4]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[1]), 
;!		 -> STR_50(CODE[5]), STR_51(CODE[5]), STR_52(CODE[1]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[6]), STR_56(CODE[6]), STR_57(CODE[9]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[1]), value_back(BANK0[5]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_flow_type(BANK2[10]), value_flow_units(BANK2[10]), value_hi_pressure(BANK2[10]), 
;!		 -> value_high_tbp(BANK3[10]), value_high_temp(BANK2[10]), value_highbp(BANK2[10]), value_low_flow(BANK3[10]), 
;!		 -> value_low_flow_bp(BANK3[10]), value_low_pressure(BANK2[10]), value_no_flow(BANK2[10]), value_no_flow_bp(BANK3[10]), 
;!		 -> value_plpbp(BANK2[10]), value_rlyhigh(BANK2[10]), value_rlylow(BANK2[10]), value_rlyplp(BANK2[10]), 
;!		 -> value_rlyslp(BANK2[10]), value_scale20(BANK2[10]), value_scale4(BANK1[10]), value_sensor(BANK2[12]), 
;!		 -> value_slpbp(BANK2[10]), NULL(NULL[0]), 
;!
;!    strcpy@to	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK3[10]), value_back(BANK0[5]), 
;!		 -> value_display(BANK0[10]), value_enable(BANK2[10]), value_flow_type(BANK2[10]), value_flow_units(BANK2[10]), 
;!		 -> value_hi_pressure(BANK2[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK2[10]), value_highbp(BANK2[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK2[10]), value_no_flow(BANK2[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK2[10]), value_rlyhigh(BANK2[10]), value_rlylow(BANK2[10]), 
;!		 -> value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(BANK2[10]), value_scale4(BANK1[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK2[10]), NULL(NULL[0]), 
;!
;!    strlen@cp	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_25(CODE[9]), STR_26(CODE[8]), 
;!		 -> STR_27(CODE[1]), STR_28(CODE[1]), STR_29(CODE[1]), STR_30(CODE[9]), 
;!		 -> STR_31(CODE[5]), STR_32(CODE[5]), STR_33(CODE[1]), STR_34(CODE[1]), 
;!		 -> STR_35(CODE[7]), STR_36(CODE[8]), STR_37(CODE[1]), STR_38(CODE[1]), 
;!		 -> STR_39(CODE[1]), STR_40(CODE[4]), STR_41(CODE[5]), STR_42(CODE[1]), 
;!		 -> STR_43(CODE[1]), STR_44(CODE[1]), STR_45(CODE[2]), STR_46(CODE[4]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[1]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[5]), STR_52(CODE[1]), STR_53(CODE[1]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[6]), STR_56(CODE[6]), STR_57(CODE[9]), STR_58(CODE[1]), 
;!		 -> STR_59(CODE[1]), 
;!
;!    strlen@s	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_25(CODE[9]), STR_26(CODE[8]), 
;!		 -> STR_27(CODE[1]), STR_28(CODE[1]), STR_29(CODE[1]), STR_30(CODE[9]), 
;!		 -> STR_31(CODE[5]), STR_32(CODE[5]), STR_33(CODE[1]), STR_34(CODE[1]), 
;!		 -> STR_35(CODE[7]), STR_36(CODE[8]), STR_37(CODE[1]), STR_38(CODE[1]), 
;!		 -> STR_39(CODE[1]), STR_40(CODE[4]), STR_41(CODE[5]), STR_42(CODE[1]), 
;!		 -> STR_43(CODE[1]), STR_44(CODE[1]), STR_45(CODE[2]), STR_46(CODE[4]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[1]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[5]), STR_52(CODE[1]), STR_53(CODE[1]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[6]), STR_56(CODE[6]), STR_57(CODE[9]), STR_58(CODE[1]), 
;!		 -> STR_59(CODE[1]), 
;!
;!    temp_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[11]), STR_102(CODE[9]), STR_103(CODE[12]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[8]), STR_106(CODE[5]), STR_65(CODE[7]), 
;!		 -> STR_66(CODE[7]), STR_67(CODE[10]), STR_68(CODE[11]), STR_69(CODE[12]), 
;!		 -> STR_70(CODE[9]), STR_71(CODE[13]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[8]), STR_76(CODE[8]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[5]), STR_79(CODE[7]), STR_80(CODE[7]), STR_81(CODE[10]), 
;!		 -> STR_82(CODE[11]), STR_83(CODE[10]), STR_84(CODE[9]), STR_85(CODE[9]), 
;!		 -> STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), STR_89(CODE[7]), 
;!		 -> STR_90(CODE[5]), STR_91(CODE[8]), STR_92(CODE[11]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[8]), STR_95(CODE[5]), STR_96(CODE[7]), STR_97(CODE[7]), 
;!		 -> STR_98(CODE[5]), STR_99(CODE[6]), 
;!
;!    temp_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_display(BANK0[10]), value_enable(BANK2[10]), value_flow_type(BANK2[10]), 
;!		 -> value_flow_units(BANK2[10]), value_hi_pressure(BANK2[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK2[10]), 
;!		 -> value_highbp(BANK2[10]), value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK2[10]), 
;!		 -> value_no_flow(BANK2[10]), value_no_flow_bp(BANK3[10]), value_plpbp(BANK2[10]), value_rlyhigh(BANK2[10]), 
;!		 -> value_rlylow(BANK2[10]), value_rlyplp(BANK2[10]), value_rlyslp(BANK2[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK1[10]), value_sensor(BANK2[12]), value_slpbp(BANK2[10]), NULL(NULL[0]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK1[40]), 
;!		 -> main@buf_623(BANK1[30]), menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1368(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), 
;!		 -> menu_update_time_value@debug_before(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), STR_1(CODE[28]), STR_10(CODE[19]), 
;!		 -> STR_108(CODE[29]), STR_13(CODE[20]), STR_14(CODE[15]), STR_15(CODE[26]), 
;!		 -> STR_166(CODE[31]), STR_18(CODE[22]), STR_19(CODE[20]), STR_2(CODE[23]), 
;!		 -> STR_20(CODE[21]), STR_203(CODE[27]), STR_21(CODE[33]), STR_24(CODE[36]), 
;!		 -> STR_5(CODE[22]), STR_6(CODE[19]), STR_7(CODE[24]), STR_8(CODE[22]), 
;!		 -> STR_9(CODE[22]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK1[40]), 
;!		 -> main@buf_623(BANK1[30]), menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1368(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), 
;!		 -> menu_update_time_value@debug_before(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), STR_1(CODE[28]), STR_10(CODE[19]), 
;!		 -> STR_108(CODE[29]), STR_13(CODE[20]), STR_14(CODE[15]), STR_15(CODE[26]), 
;!		 -> STR_166(CODE[31]), STR_18(CODE[22]), STR_19(CODE[20]), STR_2(CODE[23]), 
;!		 -> STR_20(CODE[21]), STR_203(CODE[27]), STR_21(CODE[33]), STR_24(CODE[36]), 
;!		 -> STR_5(CODE[22]), STR_6(CODE[19]), STR_7(CODE[24]), STR_8(CODE[22]), 
;!		 -> STR_9(CODE[22]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_menu_handle_encoder
;!    _menu_update_numeric_value->_is_numeric_field
;!    _menu_update_numeric_value->_lcd_set_cursor
;!    _menu_update_edit_value->_sprintf
;!    _menu_handle_encoder->_menu_draw_input
;!    _handle_time_rotation->_sprintf
;!    _handle_numeric_rotation->_sprintf
;!    _menu_handle_button->_menu_draw_input
;!    _rebuild_input_menu->_sprintf
;!    _menu_update_time_value->_sprintf
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
;!    _uart_println->_uart_print
;!    _uart_print->_uart_write
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
;!
;!Critical Paths under _isr in COMRAM
;!
;!    _isr->i2___lwmod
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->_menu_update_time_value
;!    _menu_handle_encoder->_handle_numeric_rotation
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
;! (0) _main                                                84    84      0  549105
;!                                             79 COMRAM     2     2      0
;!                                            122 BANK1     82    82      0
;!                             ___wmul
;!                               _beep
;!                        _eeprom_init
;!                       _encoder_init
;!           _get_menu_timeout_seconds
;!            _handle_numeric_rotation
;!               _handle_time_rotation
;!                   _is_numeric_field
;!                      _is_time_field
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
;!             _menu_update_time_value
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
;! (1) _menu_update_numeric_value                           28    28      0    8679
;!                                             20 COMRAM    28    28      0
;!                   _is_numeric_field
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_edit_value                              31    31      0   29651
;!                                             57 COMRAM     2     2      0
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
;! (1) _menu_handle_encoder                                 17    15      2  100700
;!                                             62 COMRAM    17    15      2
;!         _get_item_options_for_field
;!               _get_option_edit_flag
;!            _handle_numeric_rotation
;!               _handle_time_rotation
;!                   _is_numeric_field
;!                    _is_option_field
;!                      _is_time_field
;!                    _menu_draw_input
;!                             _strcpy
;! ---------------------------------------------------------------------------------
;! (2) _handle_time_rotation                                53    53      0   19125
;!                                              0 BANK0     53    53      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _handle_numeric_rotation                             57    57      0   19478
;!                                              0 BANK0     57    57      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                 127   127      0  216072
;!                                             62 COMRAM     5     5      0
;!                                              0 BANK1    122   122      0
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
;!                    _menu_draw_input
;!                  _menu_draw_options
;!                    _menu_draw_setup
;!             _menu_update_time_value
;!                 _rebuild_input_menu
;!                _save_current_config
;!                            _sprintf
;!                             _strcmp
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_input_menu                                  90    90      0   32208
;!                                             57 COMRAM     1     1      0
;!                                              0 BANK0     89    89      0
;!                            ___lwdiv
;!                            ___lwmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_time_value                             111   111      0   27438
;!                                              0 BANK0    110   110      0
;!                            ___lbdiv
;!                            ___lbmod
;!                      _is_time_field
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) ___lbmod                                              4     3      1     311
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) ___lbdiv                                              4     3      1     314
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_setup                                     21    21      0   19207
;!                                             24 COMRAM    21    21      0
;!                          _lcd_clear
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_options                                    2     2      0   18712
;!                                             24 COMRAM     2     2      0
;!                          _lcd_clear
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_clear                                            1     1      0     248
;!                                             17 COMRAM     1     1      0
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_input                                     51    51      0   49285
;!                                             57 COMRAM     5     5      0
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
;! (2) _strlen                                               4     2      2     400
;!                                             14 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (2) _strcpy                                               6     2      4    4429
;!                                             14 COMRAM     6     2      4
;! ---------------------------------------------------------------------------------
;! (3) _strcmp                                               7     3      4     395
;!                                             14 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (3) _lcd_print_at                                         4     1      3    6820
;!                                             20 COMRAM     4     1      3
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_clear_line                                       1     1      0    5678
;!                                             20 COMRAM     1     1      0
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _lcd_set_cursor                                       3     2      1    2246
;!                                             17 COMRAM     3     2      1
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (2) _lcd_print                                            2     0      2    3401
;!                                             16 COMRAM     2     0      2
;!                           _lcd_data
;! ---------------------------------------------------------------------------------
;! (3) _lcd_data                                             1     1      0     186
;!                                             15 COMRAM     1     1      0
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
;! (2) _init_time_editor                                    63    60      3   24264
;!                                             57 COMRAM     3     0      3
;!                                              0 BANK0     60    60      0
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    2467
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
;! (1) _sprintf                                             35    23     12   16332
;!                                             26 COMRAM    31    19     12
;!                            ___lwdiv
;!                            ___lwmod
;!                             ___wmul
;!                            _isdigit
;! ---------------------------------------------------------------------------------
;! (2) _isdigit                                              3     3      0      99
;!                                             14 COMRAM     3     3      0
;! ---------------------------------------------------------------------------------
;! (2) ___wmul                                               6     2      4    1652
;!                                             14 COMRAM     6     2      4
;!           _get_menu_timeout_seconds (ARG)
;! ---------------------------------------------------------------------------------
;! (2) _init_numeric_editor                                 10     8      2    5448
;!                                             26 COMRAM    10     8      2
;!                            ___lwdiv
;!                            ___lwmod
;! ---------------------------------------------------------------------------------
;! (2) ___lwmod                                              5     1      4    2502
;!                                             14 COMRAM     5     1      4
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4    2401
;!                                             19 COMRAM     7     3      4
;!                            ___lwmod (ARG)
;! ---------------------------------------------------------------------------------
;! (2) _get_current_numeric_value                           10     8      2      46
;!                                             14 COMRAM    10     8      2
;! ---------------------------------------------------------------------------------
;! (2) _beep                                                 5     3      2    1566
;!                                             14 COMRAM     5     3      2
;! ---------------------------------------------------------------------------------
;! (1) _lcd_init                                             2     2      0     372
;!                                             17 COMRAM     2     2      0
;!                            _lcd_cmd
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (3) _lcd_cmd                                              2     2      0     248
;!                                             15 COMRAM     2     2      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (4) _lcd_write_nibble                                     1     1      0     124
;!                                             14 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _get_menu_timeout_seconds                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _encoder_init                                         2     2      0       0
;!                                             14 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _eeprom_init                                          5     5      0    5513
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
;! (2) _load_factory_defaults                                0     0      0    1511
;!                             _memcpy
;! ---------------------------------------------------------------------------------
;! (3) _memcpy                                              11     5      6    1511
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
;!   ___wmul
;!     _get_menu_timeout_seconds (ARG)
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
;!       ___lwdiv
;!         ___lwmod (ARG)
;!       ___lwmod
;!       ___wmul
;!       _isdigit
;!     _uart_println
;!       _uart_print
;!         _uart_write
;!       _uart_write
;!   _handle_time_rotation
;!     _sprintf
;!     _uart_println
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
;!   _menu_draw_input
;!     _get_item_options_for_field
;!     _get_option_edit_flag
;!     _is_numeric_field
;!     _is_option_field
;!     _is_time_field
;!     _lcd_clear_line
;!       _lcd_print
;!       _lcd_set_cursor
;!     _lcd_print
;!     _lcd_print_at
;!       _lcd_print
;!       _lcd_set_cursor
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
;!     _menu_draw_input
;!     _menu_draw_options
;!     _menu_draw_setup
;!     _menu_update_time_value
;!       ___lbdiv
;!       ___lbmod
;!       _is_time_field
;!       _lcd_print
;!       _lcd_set_cursor
;!       _sprintf
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
;!     _uart_println
;!   _menu_handle_encoder
;!     _get_item_options_for_field
;!     _get_option_edit_flag
;!     _handle_numeric_rotation
;!     _handle_time_rotation
;!     _is_numeric_field
;!     _is_option_field
;!     _is_time_field
;!     _menu_draw_input
;!     _strcpy
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
;!BANK3              100      0      BC      11       73.4%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100      0      F7       9       96.5%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100     CC      FC       7       98.4%
;!BITBANK15           80      0       0      34        0.0%
;!BANK15              80      0       0      35        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80     6E      7D       5       97.7%
;!BITCOMRAM           7E      0       0       0        0.0%
;!COMRAM              7E     51      6F       1       88.1%
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
;!ABS                  0      0     39B      47        0.0%
;!DATA                 0      0     51B       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 247 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  flow_type       1  198[BANK1 ] unsigned char 
;;  sensor_type     1  197[BANK1 ] unsigned char 
;;  buf            30  162[BANK1 ] unsigned char [30]
;;  current_even    1  201[BANK1 ] unsigned char 
;;  flow_type       1  196[BANK1 ] unsigned char 
;;  sensor_type     1  195[BANK1 ] unsigned char 
;;  flow_type       1  194[BANK1 ] unsigned char 
;;  sensor_type     1  193[BANK1 ] unsigned char 
;;  buf            40  122[BANK1 ] unsigned char [40]
;;  delta           2  202[BANK1 ] int 
;;  last_encoder    2  199[BANK1 ] int 
;;  last_button     1  192[BANK1 ] unsigned char 
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
;;      Locals:         0       0      82       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0      82       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       84 bytes
;; Hardware stack levels required when called: 8
;; This function calls:
;;		___wmul
;;		_beep
;;		_eeprom_init
;;		_encoder_init
;;		_get_menu_timeout_seconds
;;		_handle_numeric_rotation
;;		_handle_time_rotation
;;		_is_numeric_field
;;		_is_time_field
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
;;		_menu_update_time_value
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
	line	247
global __ptext0
__ptext0:
psect	text0
	file	"src\main.c"
	line	247
	
_main:
;incstack = 0
	callstack 23
	line	250
	
l9843:
	call	_system_init	;wreg free
	line	251
	
l9845:
	call	_eeprom_init	;wreg free
	line	258
	
l9847:; BSR set to: 3

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
	line	260
	
l9849:
	call	_uart_init	;wreg free
	line	261
	
l9851:
	call	_encoder_init	;wreg free
	line	262
	
l9853:
	call	_menu_init	;wreg free
	line	263
	
l9855:; BSR set to: 1

	call	_lcd_init	;wreg free
	line	265
	
l9857:
		movlw	low(STR_1)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_1)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	266
	
l9859:
		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	268
	
l9861:
	call	_lcd_clear	;wreg free
	line	269
	
l9863:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	270
	
l9865:
		movlw	low(STR_3)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_3)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	271
	
l9867:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	272
	
l9869:
		movlw	low(STR_4)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_4)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	274
	
l9871:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	275
	
l9873:
		movlw	low(STR_6)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_6)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	276
	
l9875:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	278
	
l9877:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	279
	
l9879:
	asmopt push
asmopt off
movlw  5
movwf	(??_main+0+0+1)^00h,c
movlw	15
movwf	(??_main+0+0)^00h,c
	movlw	241
u13837:
decfsz	wreg,f
	bra	u13837
	decfsz	(??_main+0+0)^00h,c,f
	bra	u13837
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u13837
	nop
asmopt pop

	line	280
	
l9881:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	282
	
l9883:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	283
	
l9885:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	285
	
l9887:
	asmopt push
asmopt off
movlw  41
movwf	(??_main+0+0+1)^00h,c
movlw	150
movwf	(??_main+0+0)^00h,c
	movlw	127
u13847:
decfsz	wreg,f
	bra	u13847
	decfsz	(??_main+0+0)^00h,c,f
	bra	u13847
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u13847
	nop
asmopt pop

	line	289
	
l9889:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_current_menu))&0ffh
	line	290
	
l9891:; BSR set to: 1

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	292
	
l9893:; BSR set to: 1

	call	_menu_draw_options	;wreg free
	line	293
	
l9895:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	296
	
l9897:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	297
	
l9899:; BSR set to: 1

	movlw	low(0)
	movwf	((main@last_button))&0ffh
	line	304
	
l9901:
	movlb	1	; () banked
	movf	((main@last_encoder))&0ffh,w
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u13430
movf	((main@last_encoder+1))&0ffh,w
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u13431
	goto	u13430

u13431:
	goto	l9963
u13430:
	line	306
	
l9903:; BSR set to: 1

	movf	((main@last_encoder))&0ffh,w
	subwf	((_encoder_count))&0ffh,w	;volatile
	movwf	((main@delta))&0ffh
	movf	((main@last_encoder+1))&0ffh,w
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movwf	1+((main@delta))&0ffh
	line	309
	
l9905:; BSR set to: 1

	movlw	high(01h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	312
	
l9907:
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
	line	313
	
l9909:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	315
	
l9911:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	318
	
l9913:
	movlw	high(01F4h)
	movlb	1	; () banked
	movwf	((main@encoder_activity_timer+1))&0ffh
	movlw	low(01F4h)
	movwf	((main@encoder_activity_timer))&0ffh
	line	321
	
l9915:; BSR set to: 1

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u13441
	goto	u13440
u13441:
	goto	l196
u13440:
	line	323
	
l9917:; BSR set to: 1

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	324
	
l196:; BSR set to: 1

	line	327
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u13451
	goto	u13450
u13451:
	goto	l9931
u13450:
	
l9919:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13461
	goto	u13460

u13461:
	goto	l9931
u13460:
	line	330
	
l9921:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((main@sensor_type))&0ffh
	line	331
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((main@flow_type))&0ffh
	line	333
	
l9923:; BSR set to: 1

	movff	(main@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(main@flow_type),(c:is_numeric_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u13471
	goto	u13470
u13471:
	goto	l9927
u13470:
	line	336
	
l9925:
	movlb	1	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_numeric_rotation
	line	337
	goto	l9935
	line	338
	
l9927:
	movff	(main@sensor_type),(c:is_time_field@sensor_type)
	movff	(main@flow_type),(c:is_time_field@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u13481
	goto	u13480
u13481:
	goto	l9931
u13480:
	line	341
	
l9929:
	movlb	1	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_time_rotation
	line	342
	call	_menu_update_time_value	;wreg free
	line	343
	goto	l9935
	line	347
	
l9931:
	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	line	357
	
l9935:
	movlb	1	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u13491
	goto	u13490
u13491:
	goto	l9951
u13490:
	
l9937:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13501
	goto	u13500

u13501:
	goto	l9951
u13500:
	line	360
	
l9939:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((main@sensor_type_620))&0ffh
	line	361
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((main@flow_type_621))&0ffh
	line	364
	
l9941:; BSR set to: 1

	movff	(main@sensor_type_620),(c:is_numeric_field@sensor_type)
	movff	(main@flow_type_621),(c:is_numeric_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u13511
	goto	u13510
u13511:
	goto	l9945
u13510:
	line	367
	
l9943:
	call	_menu_update_numeric_value	;wreg free
	line	368
	goto	l9963
	line	369
	
l9945:
	movff	(main@sensor_type_620),(c:is_time_field@sensor_type)
	movff	(main@flow_type_621),(c:is_time_field@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u13521
	goto	u13520
u13521:
	goto	l9949
u13520:
	line	372
	
l9947:
	call	_menu_update_time_value	;wreg free
	line	373
	goto	l9963
	line	377
	
l9949:
	call	_menu_update_edit_value	;wreg free
	goto	l9963
	line	383
	
l9951:; BSR set to: 1

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13531
	goto	u13530
u13531:
	goto	l9955
u13530:
	line	385
	
l9953:; BSR set to: 1

	call	_menu_draw_options	;wreg free
	line	386
	goto	l9963
	line	387
	
l9955:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13541
	goto	u13540

u13541:
	goto	l9959
u13540:
	line	389
	
l9957:; BSR set to: 1

	call	_menu_draw_input	;wreg free
	line	390
	goto	l9963
	line	391
	
l9959:; BSR set to: 1

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13551
	goto	u13550

u13551:
	goto	l9963
u13550:
	line	393
	
l9961:; BSR set to: 1

	call	_menu_draw_setup	;wreg free
	line	399
	
l9963:
	movlb	1	; () banked
	movf	((main@last_button))&0ffh,w
xorwf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u13561
	goto	u13560

u13561:
	goto	l10039
u13560:
	line	401
	
l9965:; BSR set to: 1

	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u13571
	goto	u13570
u13571:
	goto	l10035
u13570:
	line	403
	
l9967:; BSR set to: 1

	movff	(_button_event),(main@current_event)	;volatile
	line	404
	
l9969:; BSR set to: 1

	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	407
	
l9971:; BSR set to: 1

		movlw	low(main@buf_623)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_623)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_12)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_12)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@current_event),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	408
	
l9973:
		movlw	low(main@buf_623)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_623)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	411
	
l9975:
		movlw	2
	movlb	1	; () banked
	xorwf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u13581
	goto	u13580

u13581:
	goto	l10011
u13580:
	line	413
	
l9977:; BSR set to: 1

		movlw	low(STR_13)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_13)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	416
	
l9979:
	movlb	1	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u13591
	goto	u13590
u13591:
	goto	l9993
u13590:
	line	419
	
l9981:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	420
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	421
	movlw	low(0)
	movwf	(0+(_menu+08h))&0ffh
	line	425
	
l9983:; BSR set to: 1

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
	line	426
	
l9985:; BSR set to: 1

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
	line	428
	
l9987:; BSR set to: 1

		movlw	low(STR_14)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_14)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	431
	
l9989:
	movlb	1	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13601
	goto	u13600

u13601:
	goto	l10035
u13600:
	line	432
	
l9991:; BSR set to: 1

	call	_menu_draw_input	;wreg free
	goto	l10035
	line	438
	
l9993:; BSR set to: 1

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13611
	goto	u13610
u13611:
	goto	l9999
u13610:
	line	440
	
l9995:; BSR set to: 1

	setf	((_current_menu))&0ffh
	line	441
	
l9997:; BSR set to: 1

		movlw	low(STR_15)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	442
	goto	l10035
	line	443
	
l9999:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13621
	goto	u13620

u13621:
	goto	l10005
u13620:
	line	445
	
l10001:; BSR set to: 1

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	446
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	447
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	448
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	449
	
l10003:; BSR set to: 1

	call	_menu_draw_setup	;wreg free
	line	450
	goto	l10035
	line	451
	
l10005:; BSR set to: 1

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13631
	goto	u13630

u13631:
	goto	l227
u13630:
	line	453
	
l10007:; BSR set to: 1

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	454
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	455
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	456
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	457
	
l10009:; BSR set to: 1

	call	_menu_draw_options	;wreg free
	goto	l10035
	line	462
	
l10011:; BSR set to: 1

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13641
	goto	u13640

u13641:
	goto	l10021
u13640:
	line	464
	
l10013:; BSR set to: 1

		decf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u13651
	goto	u13650

u13651:
	goto	l10035
u13650:
	line	466
	
l10015:; BSR set to: 1

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	467
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	468
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	469
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	470
	
l10017:; BSR set to: 1

	call	_menu_draw_options	;wreg free
	line	471
	
l10019:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l10035
	line	477
	
l10021:; BSR set to: 1

	movf	((main@current_event))&0ffh,w
	
	call	_menu_handle_button
	line	480
	
l10023:
	movlb	1	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13661
	goto	u13660
u13661:
	goto	l10027
u13660:
	goto	l10009
	line	482
	
l10027:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13671
	goto	u13670

u13671:
	goto	l10031
u13670:
	goto	l9991
	line	484
	
l10031:; BSR set to: 1

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13681
	goto	u13680

u13681:
	goto	l227
u13680:
	goto	l10003
	line	486
	
l227:; BSR set to: 1

	line	488
	
l10035:
	movff	(_button_event),(main@last_button)	;volatile
	line	489
	
l10037:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	494
	
l10039:; BSR set to: 1

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13691
	goto	u13690

u13691:
	goto	l10055
u13690:
	
l10041:; BSR set to: 1

		incf	((main@last_menu_state))&0ffh,w
	btfsc	status,2
	goto	u13701
	goto	u13700

u13701:
	goto	l10055
u13700:
	line	497
	
l10043:; BSR set to: 1

	call	_lcd_clear	;wreg free
	line	498
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	499
	
l10045:
		movlw	low(STR_16)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_16)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	500
	
l10047:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	501
		movlw	low(STR_17)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_17)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	502
		movlw	low(STR_18)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_18)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	504
		movlw	low(STR_19)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_19)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	505
	
l10049:
	call	_save_current_config	;wreg free
	line	506
	
l10051:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	507
	
l10053:; BSR set to: 1

		movlw	low(STR_20)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_20)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	509
	
l10055:
	movff	(_current_menu),(main@last_menu_state)
	line	512
	
l10057:
	movlb	1	; () banked
	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfsc	status,2
	goto	u13711
	goto	u13710

u13711:
	goto	l10061
u13710:
	line	514
	
l10059:; BSR set to: 1

	decf	((main@encoder_activity_timer))&0ffh
	btfss	status,0
	decf	((main@encoder_activity_timer+1))&0ffh
	line	518
	
l10061:; BSR set to: 1

	movlw	low(01h)
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	519
	
l10063:; BSR set to: 1

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	bnz	u13720
	movlw	16
	subwf	 ((main@blink_timer))&0ffh,w
	movlw	39
	subwfb	((main@blink_timer+1))&0ffh,w
	btfss	status,0
	goto	u13721
	goto	u13720

u13721:
	goto	l10087
u13720:
	line	521
	
l10065:; BSR set to: 1

	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	522
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u13731
	goto	u13730
u13731:
	goto	l10085
u13730:
	line	525
	
l10067:; BSR set to: 1

	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfss	status,2
	goto	u13741
	goto	u13740

u13741:
	goto	l10087
u13740:
	line	527
	
l10069:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u13751
	goto	u13750
u13751:
	movlw	1
	goto	u13760
u13750:
	movlw	0
u13760:
	movwf	(0+(_menu+05h))&0ffh
	line	531
	
l10071:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13771
	goto	u13770

u13771:
	goto	l10087
u13770:
	line	534
	
l10073:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((main@sensor_type_635))&0ffh
	line	535
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((main@flow_type_636))&0ffh
	line	538
	
l10075:; BSR set to: 1

	movff	(main@sensor_type_635),(c:is_numeric_field@sensor_type)
	movff	(main@flow_type_636),(c:is_numeric_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u13781
	goto	u13780
u13781:
	goto	l10079
u13780:
	line	541
	
l10077:
	call	_menu_update_numeric_value	;wreg free
	line	542
	goto	l10087
	line	543
	
l10079:
	movff	(main@sensor_type_635),(c:is_time_field@sensor_type)
	movff	(main@flow_type_636),(c:is_time_field@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u13791
	goto	u13790
u13791:
	goto	l10083
u13790:
	line	546
	
l10081:
	call	_menu_update_time_value	;wreg free
	line	547
	goto	l10087
	line	551
	
l10083:
	call	_menu_update_edit_value	;wreg free
	goto	l10087
	line	558
	
l10085:; BSR set to: 1

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	572
	
l10087:
		movlw	03h-0
	movlb	1	; () banked
	cpfslt	((_current_menu))&0ffh
	goto	u13801
	goto	u13800

u13801:
	goto	l10121
u13800:
	line	574
	
l10089:; BSR set to: 1

	movf	((_menu_timeout_flag))&0ffh,w	;volatile
	btfss	status,2
	goto	u13811
	goto	u13810
u13811:
	goto	l10121
u13810:
	line	576
	
l10091:; BSR set to: 1

		movlw	low(STR_21)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_21)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	579
	
l10093:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	580
	
l10095:
	asmopt push
asmopt off
movlw  3
movwf	(??_main+0+0+1)^00h,c
movlw	8
movwf	(??_main+0+0)^00h,c
	movlw	119
u13857:
decfsz	wreg,f
	bra	u13857
	decfsz	(??_main+0+0)^00h,c,f
	bra	u13857
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u13857
	nop
asmopt pop

	line	581
	
l10097:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	584
	
l10099:
	movlb	1	; () banked
	setf	((_current_menu))&0ffh
	line	585
	
l10101:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	586
	
l10103:; BSR set to: 1

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	587
	
l10105:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	590
	
l10107:; BSR set to: 1

	call	_lcd_clear	;wreg free
	line	591
	
l10109:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	592
	
l10111:
		movlw	low(STR_22)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_22)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	593
	
l10113:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	594
	
l10115:
		movlw	low(STR_23)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_23)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	597
	
l10117:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	598
	
l10119:; BSR set to: 1

	movlw	high(0)
	movwf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_menu_timeout_timer))^00h,c	;volatile
	line	603
	
l10121:; BSR set to: 1

	movf	((_long_press_beep_flag))&0ffh,w	;volatile
	btfsc	status,2
	goto	u13821
	goto	u13820
u13821:
	goto	l10129
u13820:
	line	605
	
l10123:; BSR set to: 1

	movlw	low(0)
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	line	606
	
l10125:; BSR set to: 1

	movlw	high(01F4h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01F4h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	607
	
l10127:
		movlw	low(STR_24)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_24)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	621
	
l10129:
	asmopt push
asmopt off
	movlw	133
u13867:
decfsz	wreg,f
	bra	u13867
	nop
asmopt pop

	goto	l9901
	global	start
	goto	start
	callstack 0
	line	623
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_uart_init

;; *************** function _uart_init *****************
;; Defined at:
;;		line 51 in file "src\main.c"
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
	line	51
global __ptext1
__ptext1:
psect	text1
	file	"src\main.c"
	line	51
	
_uart_init:
;incstack = 0
	callstack 28
	line	53
	
l6675:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	54
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	56
	
l6677:
	movlw	low(024h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	57
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	58
	movlw	low(08h)
	movwf	((c:4024))^0f00h,c	;volatile
	line	60
	movlw	low(044h)
	movwf	((c:4015))^0f00h,c	;volatile
	line	61
	movlw	low(0)
	movwf	((c:4016))^0f00h,c	;volatile
	line	62
	
l109:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
	signat	_uart_init,89
	global	_system_init

;; *************** function _system_init *****************
;; Defined at:
;;		line 87 in file "src\main.c"
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
	line	87
global __ptext2
__ptext2:
psect	text2
	file	"src\main.c"
	line	87
	
_system_init:
;incstack = 0
	callstack 28
	line	89
	
l6679:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	90
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	93
	
l127:
	line	92
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u7731
	goto	u7730
u7731:
	goto	l127
u7730:
	line	95
	
l6681:
	movlw	low(0Fh)
	movwf	((c:4033))^0f00h,c	;volatile
	line	97
	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	98
	movlw	low(0)
	movwf	((c:3978))^0f00h,c	;volatile
	line	99
	movlw	low(0)
	movwf	((c:3979))^0f00h,c	;volatile
	line	101
	
l6683:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	102
	
l6685:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	104
	
l6687:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	105
	
l6689:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	106
	
l6691:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	107
	
l6693:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	108
	
l130:
	return	;funcret
	callstack 0
GLOBAL	__end_of_system_init
	__end_of_system_init:
	signat	_system_init,89
	global	_menu_update_numeric_value

;; *************** function _menu_update_numeric_value *****************
;; Defined at:
;;		line 963 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  value_buf       6   40[COMRAM] unsigned char [6]
;;  screen_line     1   47[COMRAM] unsigned char 
;;  start_col       1   46[COMRAM] unsigned char 
;;  flow_type       1   21[COMRAM] unsigned char 
;;  sensor_type     1   20[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/1
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
psect	text3,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	963
global __ptext3
__ptext3:
psect	text3
	file	"src\menu.c"
	line	963
	
_menu_update_numeric_value:
;incstack = 0
	callstack 25
	line	966
	
l9199:
	movlb	1	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u12051
	goto	u12050

u12051:
	goto	l767
u12050:
	
l9201:; BSR set to: 1

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u12061
	goto	u12060
u12061:
	goto	l9203
u12060:
	goto	l767
	line	970
	
l9203:; BSR set to: 1

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((c:menu_update_numeric_value@screen_line))^00h,c
	line	971
		movlw	03h-1
	cpfsgt	((c:menu_update_numeric_value@screen_line))^00h,c
	goto	u12071
	goto	u12070

u12071:
	goto	l9207
u12070:
	goto	l767
	line	976
	
l9207:; BSR set to: 1

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
	line	977
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
	line	980
	
l9209:; BSR set to: 1

	movff	(c:menu_update_numeric_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(c:menu_update_numeric_value@flow_type),(c:is_numeric_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u12081
	goto	u12080
u12081:
	goto	l9213
u12080:
	goto	l767
	line	984
	
l9213:
	lfsr	2,(menu_update_numeric_value@value_buf)
	movlw	6-1
u12091:
	clrf	postinc2
	decf	wreg
	bc	u12091
	line	986
	
l9215:
	movlb	1	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u12101
	goto	u12100
u12101:
	goto	l9247
u12100:
	line	989
	
l9217:; BSR set to: 1

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u12111
	goto	u12110

u12111:
	goto	l9221
u12110:
	
l9219:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u12121
	goto	u12120
u12121:
	goto	l9223
u12120:
	
l9221:; BSR set to: 1

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1237))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1237))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1237))^00h,c
	goto	l9225
	
l9223:; BSR set to: 1

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1237+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1237))^00h,c
	
l9225:; BSR set to: 1

	movff	(c:_menu_update_numeric_value$1237),(c:menu_update_numeric_value@value_buf)
	line	990
	
l9227:; BSR set to: 1

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u12131
	goto	u12130

u12131:
	goto	l9231
u12130:
	
l9229:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u12141
	goto	u12140
u12141:
	goto	l9233
u12140:
	
l9231:; BSR set to: 1

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1238))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1238))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1238))^00h,c
	goto	l9235
	
l9233:; BSR set to: 1

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1238+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1238))^00h,c
	
l9235:; BSR set to: 1

	movff	(c:_menu_update_numeric_value$1238),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	991
	
l9237:; BSR set to: 1

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u12151
	goto	u12150

u12151:
	goto	l9241
u12150:
	
l9239:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u12161
	goto	u12160
u12161:
	goto	l9243
u12160:
	
l9241:; BSR set to: 1

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1239))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1239))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1239))^00h,c
	goto	l9245
	
l9243:; BSR set to: 1

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1239+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1239))^00h,c
	
l9245:; BSR set to: 1

	movff	(c:_menu_update_numeric_value$1239),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	992
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+03h))^00h,c
	line	993
	goto	l793
	line	997
	
l9247:; BSR set to: 1

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u12171
	goto	u12170
u12171:
	goto	l9251
u12170:
	
l9249:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u12181
	goto	u12180
u12181:
	goto	l9259
u12180:
	
l9251:; BSR set to: 1

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u12191
	goto	u12190
u12191:
	goto	l9255
u12190:
	
l9253:; BSR set to: 1

	movlw	high(02Bh)
	movwf	((c:_menu_update_numeric_value$1241+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_menu_update_numeric_value$1241))^00h,c
	goto	l9257
	
l9255:; BSR set to: 1

	movlw	high(02Dh)
	movwf	((c:_menu_update_numeric_value$1241+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_menu_update_numeric_value$1241))^00h,c
	
l9257:; BSR set to: 1

	movff	(c:_menu_update_numeric_value$1241),(c:_menu_update_numeric_value$1240)
	movff	(c:_menu_update_numeric_value$1241+1),(c:_menu_update_numeric_value$1240+1)
	goto	l9261
	
l9259:; BSR set to: 1

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1240+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1240))^00h,c
	
l9261:; BSR set to: 1

	movff	(c:_menu_update_numeric_value$1240),(c:menu_update_numeric_value@value_buf)
	line	998
	
l9263:; BSR set to: 1

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u12201
	goto	u12200

u12201:
	goto	l9267
u12200:
	
l9265:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u12211
	goto	u12210
u12211:
	goto	l9269
u12210:
	
l9267:; BSR set to: 1

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1242))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1242))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1242))^00h,c
	goto	l9271
	
l9269:; BSR set to: 1

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1242+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1242))^00h,c
	
l9271:; BSR set to: 1

	movff	(c:_menu_update_numeric_value$1242),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	999
	
l9273:; BSR set to: 1

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u12221
	goto	u12220

u12221:
	goto	l9277
u12220:
	
l9275:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u12231
	goto	u12230
u12231:
	goto	l9279
u12230:
	
l9277:; BSR set to: 1

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1243))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1243))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1243))^00h,c
	goto	l9281
	
l9279:; BSR set to: 1

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1243+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1243))^00h,c
	
l9281:; BSR set to: 1

	movff	(c:_menu_update_numeric_value$1243),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1000
	
l9283:; BSR set to: 1

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u12241
	goto	u12240

u12241:
	goto	l9287
u12240:
	
l9285:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u12251
	goto	u12250
u12251:
	goto	l9289
u12250:
	
l9287:; BSR set to: 1

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1244))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1244))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1244))^00h,c
	goto	l9291
	
l9289:; BSR set to: 1

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1244+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1244))^00h,c
	
l9291:; BSR set to: 1

	movff	(c:_menu_update_numeric_value$1244),0+((c:menu_update_numeric_value@value_buf)+03h)
	line	1001
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+04h))^00h,c
	line	1002
	
l793:; BSR set to: 1

	line	1005
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u12261
	goto	u12260
u12261:
	goto	l9295
u12260:
	
l9293:; BSR set to: 1

	movlw	high(0Eh)
	movwf	((c:_menu_update_numeric_value$1246+1))^00h,c
	movlw	low(0Eh)
	movwf	((c:_menu_update_numeric_value$1246))^00h,c
	goto	l9297
	
l9295:; BSR set to: 1

	movlw	high(0Fh)
	movwf	((c:_menu_update_numeric_value$1246+1))^00h,c
	movlw	low(0Fh)
	movwf	((c:_menu_update_numeric_value$1246))^00h,c
	
l9297:; BSR set to: 1

	movff	(c:_menu_update_numeric_value$1246),(c:menu_update_numeric_value@start_col)
	line	1007
	
l9299:; BSR set to: 1

	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1008
	
l9301:
		movlw	low(STR_173)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_173)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1010
	
l9303:
	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1011
	
l9305:
		movlw	low(STR_174)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_174)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1012
	
l9307:
		movlw	low(menu_update_numeric_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1013
	
l9309:
		movlw	low(STR_175)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_175)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1014
	
l767:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_numeric_value
	__end_of_menu_update_numeric_value:
	signat	_menu_update_numeric_value,89
	global	_menu_update_edit_value

;; *************** function _menu_update_edit_value *****************
;; Defined at:
;;		line 899 in file "src\menu.c"
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
;;		On entry : 0/1
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
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	899
global __ptext4
__ptext4:
psect	text4
	file	"src\menu.c"
	line	899
	
_menu_update_edit_value:
;incstack = 0
	callstack 25
	line	903
	
l9311:
	movlb	1	; () banked
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
	line	904
	movlb	1	; () banked
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
	line	907
	
l9313:; BSR set to: 0

	movlb	1	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u12271
	goto	u12270
u12271:
	goto	l745
u12270:
	
l9315:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u12281
	goto	u12280

u12281:
	goto	l9317
u12280:
	goto	l745
	line	911
	
l9317:; BSR set to: 1

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@screen_line))&0ffh
	line	912
		movlw	03h-1
	cpfsgt	((menu_update_edit_value@screen_line))&0ffh
	goto	u12291
	goto	u12290

u12291:
	goto	l9321
u12290:
	goto	l745
	line	916
	
l9321:; BSR set to: 0

	movff	(menu_update_edit_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_update_edit_value@flow_type),(c:is_numeric_field@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u12301
	goto	u12300
u12301:
	goto	l9325
u12300:
	goto	l745
	line	921
	
l9325:
	movlb	1	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u12311
	goto	u12310
u12311:
	goto	l9329
u12310:
	line	923
	
l9327:; BSR set to: 1

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_168)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_168)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+0Ah),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	924
	goto	l9337
	line	929
	
l9329:; BSR set to: 1

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u12321
	goto	u12320
u12321:
	goto	l9333
u12320:
	
l9331:; BSR set to: 1

	movlw	high(02Bh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1222+1))&0ffh
	movlw	low(02Bh)
	movwf	((_menu_update_edit_value$1222))&0ffh
	goto	l9335
	
l9333:; BSR set to: 1

	movlw	high(02Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1222+1))&0ffh
	movlw	low(02Dh)
	movwf	((_menu_update_edit_value$1222))&0ffh
	
l9335:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_169)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_169)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu_update_edit_value$1222),0+((c:?_sprintf)+04h)
	movff	(_menu_update_edit_value$1222+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+0Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	call	_sprintf	;wreg free
	line	934
	
l9337:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@from))^00h,c
	clrf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	936
	
l9339:
	movlb	1	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u12331
	goto	u12330
u12331:
	goto	l9349
u12330:
	line	939
	
l9341:; BSR set to: 1

	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u12341
	goto	u12340
u12341:
	goto	l755
u12340:
	line	940
	
l9343:; BSR set to: 1

	decf	(0+(_menu+08h))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@blink_pos))&0ffh
	goto	l9345
	line	941
	
l755:; BSR set to: 1

	line	942
	movff	0+(_menu+08h),(menu_update_edit_value@blink_pos)
	line	944
	
l9345:
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
	goto	u12351
	goto	u12350

u12351:
	goto	l9349
u12350:
	line	945
	
l9347:; BSR set to: 0

	movf	((menu_update_edit_value@blink_pos))&0ffh,w
	addlw	low(menu_update_edit_value@display_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	949
	
l9349:
	movlb	1	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u12361
	goto	u12360
u12361:
	goto	l9353
u12360:
	
l9351:; BSR set to: 1

	movlw	high(0Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1226+1))&0ffh
	movlw	low(0Dh)
	movwf	((_menu_update_edit_value$1226))&0ffh
	goto	l9355
	
l9353:; BSR set to: 1

	movlw	high(0Eh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1226+1))&0ffh
	movlw	low(0Eh)
	movwf	((_menu_update_edit_value$1226))&0ffh
	
l9355:; BSR set to: 0

	movff	(_menu_update_edit_value$1226),(menu_update_edit_value@start_col)
	line	950
	
l9357:; BSR set to: 0

	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	951
	
l9359:
		movlw	low(STR_170)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_170)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	953
	
l9361:
	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	movlb	0	; () banked
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	954
	
l9363:
		movlw	low(STR_171)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_171)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	955
	
l9365:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	956
	
l9367:
		movlw	low(STR_172)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_172)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	957
	
l745:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_edit_value
	__end_of_menu_update_edit_value:
	signat	_menu_update_edit_value,89
	global	_menu_init

;; *************** function _menu_init *****************
;; Defined at:
;;		line 584 in file "src\menu.c"
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
	line	584
global __ptext5
__ptext5:
psect	text5
	file	"src\menu.c"
	line	584
	
_menu_init:
;incstack = 0
	callstack 28
	line	586
	
l6789:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_menu))&0ffh
	line	587
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	588
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	589
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	590
	movlw	low(0)
	movwf	(0+(_menu+05h))&0ffh
	line	591
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	592
	
l592:; BSR set to: 1

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_init
	__end_of_menu_init:
	signat	_menu_init,89
	global	_menu_handle_encoder

;; *************** function _menu_handle_encoder *****************
;; Defined at:
;;		line 1252 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  delta           2   62[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;  edit_flag       2   77[COMRAM] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> NULL(0), sensor_edit_flag(1), enable_edit_flag(1), 
;;  opts            2   73[COMRAM] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  flow_type       1   76[COMRAM] unsigned char 
;;  sensor_type     1   75[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        10       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        17       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       17 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 7
;; This function calls:
;;		_get_item_options_for_field
;;		_get_option_edit_flag
;;		_handle_numeric_rotation
;;		_handle_time_rotation
;;		_is_numeric_field
;;		_is_option_field
;;		_is_time_field
;;		_menu_draw_input
;;		_strcpy
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	1252
global __ptext6
__ptext6:
psect	text6
	file	"src\menu.c"
	line	1252
	
_menu_handle_encoder:; BSR set to: 1

;incstack = 0
	callstack 23
	line	1257
	
l9119:
	movlb	1	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u11841
	goto	u11840
u11841:
	goto	l9179
u11840:
	line	1259
	
l9121:; BSR set to: 1

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u11851
	goto	u11850

u11851:
	goto	l931
u11850:
	line	1261
	
l9123:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:menu_handle_encoder@sensor_type))^00h,c
	line	1262
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:menu_handle_encoder@flow_type))^00h,c
	line	1265
	
l9125:; BSR set to: 1

	movff	(c:menu_handle_encoder@sensor_type),(c:is_option_field@sensor_type)
	movff	(c:menu_handle_encoder@flow_type),(c:is_option_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u11861
	goto	u11860
u11861:
	goto	l9157
u11860:
	line	1267
	
l9127:
	movff	(c:menu_handle_encoder@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(c:menu_handle_encoder@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(c:menu_handle_encoder@edit_flag)
	movff	1+?_get_option_edit_flag,(c:menu_handle_encoder@edit_flag+1)
	line	1268
	movff	(c:menu_handle_encoder@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(c:menu_handle_encoder@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(c:menu_handle_encoder@opts)
	movff	1+?_get_item_options_for_field,(c:menu_handle_encoder@opts+1)
	line	1270
	
l9129:
	movf	((c:menu_handle_encoder@edit_flag))^00h,c,w
iorwf	((c:menu_handle_encoder@edit_flag+1))^00h,c,w
	btfsc	status,2
	goto	u11871
	goto	u11870

u11871:
	goto	l931
u11870:
	
l9131:
	movf	((c:menu_handle_encoder@opts))^00h,c,w
iorwf	((c:menu_handle_encoder@opts+1))^00h,c,w
	btfsc	status,2
	goto	u11881
	goto	u11880

u11881:
	goto	l931
u11880:
	line	1272
	
l9133:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u11891
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u11890
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u11891
	goto	u11890

u11891:
	goto	l9141
u11890:
	line	1274
	
l9135:
	movff	(c:menu_handle_encoder@edit_flag),fsr2l
	movff	(c:menu_handle_encoder@edit_flag+1),fsr2h
	incf	indf2

	line	1275
	
l9137:
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
	movff	(c:menu_handle_encoder@edit_flag),fsr2l
	movff	(c:menu_handle_encoder@edit_flag+1),fsr2h
		tblrd	*+
	movf	tablat,w
	subwf	postinc2,w
	btfss	status,0
	goto	u11901
	goto	u11900

u11901:
	goto	l9149
u11900:
	line	1276
	
l9139:
	movff	(c:menu_handle_encoder@edit_flag),fsr2l
	movff	(c:menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	goto	l9149
	line	1278
	
l9141:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u11910
	goto	u11911

u11911:
	goto	l9149
u11910:
	line	1280
	
l9143:
	movff	(c:menu_handle_encoder@edit_flag),fsr2l
	movff	(c:menu_handle_encoder@edit_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u11921
	goto	u11920
u11921:
	goto	l9147
u11920:
	line	1281
	
l9145:
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
	movff	(c:menu_handle_encoder@edit_flag),fsr2l
	movff	(c:menu_handle_encoder@edit_flag+1),fsr2h
	movwf	indf2,c

	goto	l9149
	line	1283
	
l9147:
	movff	(c:menu_handle_encoder@edit_flag),fsr2l
	movff	(c:menu_handle_encoder@edit_flag+1),fsr2h
	decf	indf2

	line	1287
	
l9149:
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
	movff	(c:menu_handle_encoder@edit_flag),fsr2l
	movff	(c:menu_handle_encoder@edit_flag+1),fsr2h
		tblrd	*+
	movf	tablat,w
	subwf	postinc2,w
	btfss	status,0
	goto	u11931
	goto	u11930

u11931:
	goto	l9153
u11930:
	line	1288
	
l9151:
	movff	(c:menu_handle_encoder@edit_flag),fsr2l
	movff	(c:menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	line	1291
	
l9153:
	movlb	1	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u11941
	goto	u11940

u11941:
	goto	l908
u11940:
	line	1293
	
l9155:; BSR set to: 1

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
	movff	(c:menu_handle_encoder@edit_flag),fsr2l
	movff	(c:menu_handle_encoder@edit_flag+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movf	((??_menu_handle_encoder+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_handle_encoder+1+0
	movff	prodh,??_menu_handle_encoder+1+0+1
	movf	(??_menu_handle_encoder+1+0)^00h,c,w
	addwf	((c:menu_handle_encoder@opts))^00h,c,w
	movwf	(??_menu_handle_encoder+3+0)^00h,c
	movf	(??_menu_handle_encoder+1+1)^00h,c,w
	addwfc	((c:menu_handle_encoder@opts+1))^00h,c,w
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
	line	1294
	call	_menu_draw_input	;wreg free
	goto	l931
	line	1298
	
l9157:
	movff	(c:menu_handle_encoder@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(c:menu_handle_encoder@flow_type),(c:is_numeric_field@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u11951
	goto	u11950
u11951:
	goto	l9167
u11950:
	line	1300
	
l9159:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u11960
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u11961
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u11961
	goto	u11960

u11961:
	goto	l9163
u11960:
	
l9161:
	setf	((c:_menu_handle_encoder$1332))^00h,c
	setf	((c:_menu_handle_encoder$1332+1))^00h,c
	goto	l9165
	
l9163:
	movlw	high(01h)
	movwf	((c:_menu_handle_encoder$1332+1))^00h,c
	movlw	low(01h)
	movwf	((c:_menu_handle_encoder$1332))^00h,c
	
l9165:
	movf	((c:_menu_handle_encoder$1332))^00h,c,w
	
	call	_handle_numeric_rotation
	line	1301
	goto	l931
	line	1302
	
l9167:
	movff	(c:menu_handle_encoder@sensor_type),(c:is_time_field@sensor_type)
	movff	(c:menu_handle_encoder@flow_type),(c:is_time_field@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u11971
	goto	u11970
u11971:
	goto	l908
u11970:
	line	1304
	
l9169:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u11980
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u11981
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u11981
	goto	u11980

u11981:
	goto	l9173
u11980:
	
l9171:
	setf	((c:_menu_handle_encoder$1333))^00h,c
	setf	((c:_menu_handle_encoder$1333+1))^00h,c
	goto	l9175
	
l9173:
	movlw	high(01h)
	movwf	((c:_menu_handle_encoder$1333+1))^00h,c
	movlw	low(01h)
	movwf	((c:_menu_handle_encoder$1333))^00h,c
	
l9175:
	movf	((c:_menu_handle_encoder$1333))^00h,c,w
	
	call	_handle_time_rotation
	goto	l931
	line	1306
	
l908:
	goto	l931
	line	1311
	
l9179:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u11991
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u11990
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u11991
	goto	u11990

u11991:
	goto	l9189
u11990:
	line	1314
	
l9181:; BSR set to: 1

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
	goto	u12001
	goto	u12000

u12001:
	goto	l931
u12000:
	line	1316
	
l9183:; BSR set to: 1

	incf	((_menu))&0ffh
	line	1319
	
l9185:; BSR set to: 1

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
	goto	u12011
	goto	u12010

u12011:
	goto	l931
u12010:
	line	1321
	
l9187:; BSR set to: 1

	incf	(0+(_menu+01h))&0ffh
	goto	l931
	line	1325
	
l9189:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u12020
	goto	u12021

u12021:
	goto	l931
u12020:
	line	1328
	
l9191:; BSR set to: 1

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u12031
	goto	u12030
u12031:
	goto	l931
u12030:
	line	1330
	
l9193:; BSR set to: 1

	decf	((_menu))&0ffh
	line	1333
	
l9195:; BSR set to: 1

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u12041
	goto	u12040

u12041:
	goto	l931
u12040:
	line	1335
	
l9197:; BSR set to: 1

	decf	(0+(_menu+01h))&0ffh
	line	1339
	
l931:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_encoder
	__end_of_menu_handle_encoder:
	signat	_menu_handle_encoder,4217
	global	_handle_time_rotation

;; *************** function _handle_time_rotation *****************
;; Defined at:
;;		line 432 in file "src\menu.c"
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
;;		On entry : 0/1
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
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	432
global __ptext7
__ptext7:
psect	text7
	file	"src\menu.c"
	line	432
	
_handle_time_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_time_rotation@direction))&0ffh
	line	434
	
l8437:
		movlw	low(STR_108)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_108)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	438
	
l8439:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_109)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_109)
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
	line	439
	
l8441:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	441
	
l8443:
	movlb	1	; () banked
	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u10971
	goto	u10970
u10971:
	goto	l8471
u10970:
	line	443
	
l8445:; BSR set to: 1

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u10981
	goto	u10980

u10981:
	goto	l8459
u10980:
	line	445
	
l8447:; BSR set to: 0

	movlb	1	; () banked
	incf	(0+(_menu+012h))&0ffh
	line	446
	
l8449:; BSR set to: 1

		movlw	2
	xorwf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u10991
	goto	u10990

u10991:
	goto	l8455
u10990:
	
l8451:; BSR set to: 1

		movlw	018h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u11001
	goto	u11000

u11001:
	goto	l8455
u11000:
	line	447
	
l8453:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+012h))&0ffh
	goto	l8487
	line	448
	
l8455:; BSR set to: 1

		movlw	064h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u11011
	goto	u11010

u11011:
	goto	l555
u11010:
	goto	l8453
	line	453
	
l8459:; BSR set to: 0

	movlb	1	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u11021
	goto	u11020
u11021:
	goto	l8469
u11020:
	line	455
	
l8461:; BSR set to: 1

		movlw	2
	xorwf	(0+(_menu+010h))&0ffh,w
	btfsc	status,2
	goto	u11031
	goto	u11030

u11031:
	goto	l8465
u11030:
	
l8463:; BSR set to: 1

	movlw	high(063h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1081+1))&0ffh
	movlw	low(063h)
	movwf	((_handle_time_rotation$1081))&0ffh
	goto	l8467
	
l8465:; BSR set to: 1

	movlw	high(017h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1081+1))&0ffh
	movlw	low(017h)
	movwf	((_handle_time_rotation$1081))&0ffh
	
l8467:; BSR set to: 0

	movff	(_handle_time_rotation$1081),0+(_menu+012h)
	line	456
	goto	l8487
	line	459
	
l8469:; BSR set to: 1

	decf	(0+(_menu+012h))&0ffh
	goto	l8487
	line	461
	
l555:; BSR set to: 1

	line	462
	goto	l8487
	line	463
	
l8471:; BSR set to: 1

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u11041
	goto	u11040

u11041:
	goto	l8487
u11040:
	line	465
	
l8473:; BSR set to: 1

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u11051
	goto	u11050

u11051:
	goto	l8481
u11050:
	line	467
	
l8475:; BSR set to: 0

	movlb	1	; () banked
	incf	(0+(_menu+013h))&0ffh
	line	468
	
l8477:; BSR set to: 1

		movlw	03Ch-1
	cpfsgt	(0+(_menu+013h))&0ffh
	goto	u11061
	goto	u11060

u11061:
	goto	l8487
u11060:
	line	469
	
l8479:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l8487
	line	473
	
l8481:; BSR set to: 0

	movlb	1	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	btfss	status,2
	goto	u11071
	goto	u11070
u11071:
	goto	l8485
u11070:
	line	474
	
l8483:; BSR set to: 1

	movlw	low(03Bh)
	movwf	(0+(_menu+013h))&0ffh
	goto	l8487
	line	476
	
l8485:; BSR set to: 1

	decf	(0+(_menu+013h))&0ffh
	line	480
	
l8487:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_110)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_110)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	481
	
l8489:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	482
	
l569:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_time_rotation
	__end_of_handle_time_rotation:
	signat	_handle_time_rotation,4217
	global	_handle_numeric_rotation

;; *************** function _handle_numeric_rotation *****************
;; Defined at:
;;		line 812 in file "src\menu.c"
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
;;		On entry : 0/1
;;		On exit  : 3E/0
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
psect	text8,class=CODE,space=0,reloc=2,group=0
	line	812
global __ptext8
__ptext8:
psect	text8
	file	"src\menu.c"
	line	812
	
_handle_numeric_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_numeric_rotation@direction))&0ffh
	line	814
	
l8335:
		movlw	low(STR_166)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_166)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	817
	
l8337:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_167)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_167)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+08h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Fh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	818
	
l8339:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	821
	
l8341:
	movlb	1	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u10731
	goto	u10730
u10731:
	goto	l8435
u10730:
	
l8343:; BSR set to: 1

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u10741
	goto	u10740
u10741:
	goto	l8435
u10740:
	line	823
	
l8345:; BSR set to: 1

	movlw	low(01h)
	movwf	(0+(_menu+08h))&0ffh
	goto	l8435
	line	829
	
l8347:; BSR set to: 1

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u10751
	goto	u10750
u10751:
	goto	l737
u10750:
	
l8349:; BSR set to: 1

	movlb	0	; () banked
	movf	((handle_numeric_rotation@direction))&0ffh,w
	btfsc	status,2
	goto	u10761
	goto	u10760
u10761:
	goto	l737
u10760:
	line	831
	
l8351:; BSR set to: 0

	movlb	1	; () banked
	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u10771
	goto	u10770
u10771:
	movlw	1
	goto	u10780
u10770:
	movlw	0
u10780:
	movwf	(0+(_menu+09h))&0ffh
	goto	l737
	line	836
	
l8353:; BSR set to: 1

	movlb	0	; () banked
		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u10791
	goto	u10790

u10791:
	goto	l8361
u10790:
	line	838
	
l8355:; BSR set to: 0

	movlb	1	; () banked
	incf	(0+(_menu+0Ah))&0ffh
	line	839
	
l8357:; BSR set to: 1

		movlw	06h-1
	cpfsgt	(0+(_menu+0Ah))&0ffh
	goto	u10801
	goto	u10800

u10801:
	goto	l737
u10800:
	line	840
	
l8359:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l737
	line	842
	
l8361:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u10810
	goto	u10811

u10811:
	goto	l737
u10810:
	line	844
	
l8363:; BSR set to: 0

	movlb	1	; () banked
	movf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u10821
	goto	u10820
u10821:
	goto	l8367
u10820:
	line	845
	
l8365:; BSR set to: 1

	movlw	low(05h)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l737
	line	847
	
l8367:; BSR set to: 1

	decf	(0+(_menu+0Ah))&0ffh
	goto	l737
	line	853
	
l8369:; BSR set to: 1

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u10831
	goto	u10830

u10831:
	goto	l8373
u10830:
	
l8371:; BSR set to: 1

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1211+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1211))&0ffh
	goto	l8375
	
l8373:; BSR set to: 1

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1211+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1211))&0ffh
	
l8375:; BSR set to: 0

	movff	(_handle_numeric_rotation$1211),(handle_numeric_rotation@max_tens)
	line	854
	
l8377:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u10841
	goto	u10840

u10841:
	goto	l8389
u10840:
	line	856
	
l8379:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u10851
	goto	u10850
u10851:
	goto	l8383
u10850:
	goto	l737
	line	858
	
l8383:; BSR set to: 0

	movlb	1	; () banked
	incf	(0+(_menu+0Bh))&0ffh
	line	859
	
l8385:; BSR set to: 1

		movf	(0+(_menu+0Bh))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfsc	status,0
	goto	u10861
	goto	u10860

u10861:
	goto	l737
u10860:
	line	860
	
l8387:; BSR set to: 0

	movlw	low(0)
	movlb	1	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	goto	l737
	line	862
	
l8389:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u10870
	goto	u10871

u10871:
	goto	l737
u10870:
	line	864
	
l8391:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u10881
	goto	u10880
u10881:
	goto	l8395
u10880:
	goto	l737
	line	866
	
l8395:; BSR set to: 0

	movlb	1	; () banked
	movf	(0+(_menu+0Bh))&0ffh,w
	btfss	status,2
	goto	u10891
	goto	u10890
u10891:
	goto	l8399
u10890:
	line	867
	
l8397:; BSR set to: 1

	movff	(handle_numeric_rotation@max_tens),0+(_menu+0Bh)
	goto	l737
	line	869
	
l8399:; BSR set to: 1

	decf	(0+(_menu+0Bh))&0ffh
	goto	l737
	line	876
	
l8401:; BSR set to: 1

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u10901
	goto	u10900

u10901:
	goto	l8405
u10900:
	
l8403:; BSR set to: 1

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1213+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1213))&0ffh
	goto	l8407
	
l8405:; BSR set to: 1

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1213+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1213))&0ffh
	
l8407:; BSR set to: 0

	movff	(_handle_numeric_rotation$1213),(handle_numeric_rotation@max_units)
	line	877
	
l8409:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u10911
	goto	u10910

u10911:
	goto	l8421
u10910:
	line	879
	
l8411:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u10921
	goto	u10920
u10921:
	goto	l8415
u10920:
	goto	l737
	line	881
	
l8415:; BSR set to: 0

	movlb	1	; () banked
	incf	(0+(_menu+0Ch))&0ffh
	line	882
	
l8417:; BSR set to: 1

		movf	(0+(_menu+0Ch))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_units))&0ffh,w
	btfsc	status,0
	goto	u10931
	goto	u10930

u10931:
	goto	l737
u10930:
	line	883
	
l8419:; BSR set to: 0

	movlw	low(0)
	movlb	1	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	goto	l737
	line	885
	
l8421:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u10940
	goto	u10941

u10941:
	goto	l737
u10940:
	line	887
	
l8423:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u10951
	goto	u10950
u10951:
	goto	l8427
u10950:
	goto	l737
	line	889
	
l8427:; BSR set to: 0

	movlb	1	; () banked
	movf	(0+(_menu+0Ch))&0ffh,w
	btfss	status,2
	goto	u10961
	goto	u10960
u10961:
	goto	l8431
u10960:
	line	890
	
l8429:; BSR set to: 1

	movff	(handle_numeric_rotation@max_units),0+(_menu+0Ch)
	goto	l737
	line	892
	
l8431:; BSR set to: 1

	decf	(0+(_menu+0Ch))&0ffh
	goto	l737
	line	826
	
l8435:; BSR set to: 1

	movf	(0+(_menu+08h))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l8347
	xorlw	1^0	; case 1
	skipnz
	goto	l8353
	xorlw	2^1	; case 2
	skipnz
	goto	l8369
	xorlw	3^2	; case 3
	skipnz
	goto	l8401
	goto	l737

	line	897
	
l737:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_numeric_rotation
	__end_of_handle_numeric_rotation:
	signat	_handle_numeric_rotation,4217
	global	_menu_handle_button

;; *************** function _menu_handle_button *****************
;; Defined at:
;;		line 1345 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  press_type      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  press_type      1  111[BANK1 ] unsigned char 
;;  i               1  110[BANK1 ] unsigned char 
;;  opts            2  106[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  edit_flag       2  104[BANK1 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> NULL(0), sensor_edit_flag(1), enable_edit_flag(1), 
;;  buf            50   50[BANK1 ] unsigned char [50]
;;  current_val     2  108[BANK1 ] unsigned int 
;;  current_val     2  112[BANK1 ] int 
;;  sensor_type     1  118[BANK1 ] unsigned char 
;;  flow_type       1  116[BANK1 ] unsigned char 
;;  new_value       2  120[BANK1 ] int 
;;  new_seconds     2  114[BANK1 ] unsigned int 
;;  buf            50    0[BANK1 ] unsigned char [50]
;;  opts            2  102[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  edit_flag       2  100[BANK1 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> NULL(0), sensor_edit_flag(1), enable_edit_flag(1), 
;;  sensor_type     1  119[BANK1 ] unsigned char 
;;  flow_type       1  117[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0     122       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5       0     122       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      127 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 7
;; This function calls:
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
;;		_menu_draw_input
;;		_menu_draw_options
;;		_menu_draw_setup
;;		_menu_update_time_value
;;		_rebuild_input_menu
;;		_save_current_config
;;		_sprintf
;;		_strcmp
;;		_strcpy
;;		_uart_println
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text9,class=CODE,space=0,reloc=2,group=0
	line	1345
global __ptext9
__ptext9:
psect	text9
	file	"src\menu.c"
	line	1345
	
_menu_handle_button:
;incstack = 0
	callstack 23
	movwf	((menu_handle_button@press_type))&0ffh
	line	1350
	
l9369:
	movlb	1	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u12371
	goto	u12370
u12371:
	goto	l9639
u12370:
	line	1352
	
l9371:; BSR set to: 1

		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u12381
	goto	u12380

u12381:
	goto	l9629
u12380:
	line	1354
	
l9373:; BSR set to: 1

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
	line	1355
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
	line	1358
	
l9375:; BSR set to: 1

	movff	(menu_handle_button@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_option_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u12391
	goto	u12390
u12391:
	goto	l9479
u12390:
	line	1360
	
l9377:
	movff	(menu_handle_button@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag+1)
	line	1361
	movff	(menu_handle_button@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts+1)
	line	1363
	
l9379:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag))&0ffh,w
iorwf	((menu_handle_button@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u12401
	goto	u12400

u12401:
	goto	l9475
u12400:
	
l9381:; BSR set to: 1

	movf	((menu_handle_button@opts))&0ffh,w
iorwf	((menu_handle_button@opts+1))&0ffh,w
	btfsc	status,2
	goto	u12411
	goto	u12410

u12411:
	goto	l9475
u12410:
	line	1366
	
l9383:; BSR set to: 1

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
	movff	(menu_handle_button@edit_flag),fsr2l
	movff	(menu_handle_button@edit_flag+1),fsr2h
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
	line	1369
	
l9385:
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12421
	goto	u12420
u12421:
	goto	l9389
u12420:
	line	1371
	
l9387:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_enable_edit_flag),indf2

	line	1372
	goto	l9473
	line	1373
	
l9389:; BSR set to: 1

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12431
	goto	u12430

u12431:
	goto	l9401
u12430:
	line	1375
	
l9391:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_sensor_edit_flag),indf2

	line	1378
	
l9393:; BSR set to: 1

		movlw	2
	xorwf	((c:_sensor_edit_flag))^00h,c,w
	btfss	status,2
	goto	u12441
	goto	u12440

u12441:
	goto	l9399
u12440:
	
l9395:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfsc	status,2
	goto	u12451
	goto	u12450

u12451:
	goto	l9399
u12450:
	line	1380
	
l9397:; BSR set to: 1

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
	line	1384
	
l9399:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	1385
	goto	l9473
	line	1386
	
l9401:; BSR set to: 1

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12461
	goto	u12460

u12461:
	goto	l9409
u12460:
	
l9403:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u12471
	goto	u12470

u12471:
	goto	l9409
u12470:
	line	1388
	
l9405:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_flow_type_edit_flag),indf2

	line	1391
	
l9407:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	1392
	goto	l9473
	line	1393
	
l9409:; BSR set to: 1

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12481
	goto	u12480

u12481:
	goto	l9417
u12480:
	
l9411:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u12491
	goto	u12490

u12491:
	goto	l9417
u12490:
	
l9413:; BSR set to: 1

		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u12501
	goto	u12500

u12501:
	goto	l9417
u12500:
	goto	l9473
	line	1396
	
l9415:; BSR set to: 1

	goto	l9473
	line	1397
	
l9417:; BSR set to: 1

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12511
	goto	u12510

u12511:
	goto	l9425
u12510:
	
l9419:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u12521
	goto	u12520

u12521:
	goto	l9425
u12520:
	
l9421:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u12531
	goto	u12530
u12531:
	goto	l9425
u12530:
	line	1399
	
l9423:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_flow_units_edit_flag),indf2

	line	1400
	goto	l9473
	line	1401
	
l9425:; BSR set to: 1

	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u12541
	goto	u12540
u12541:
	goto	l9443
u12540:
	line	1403
	
l9427:; BSR set to: 1

		movlw	9
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12551
	goto	u12550

u12551:
	goto	l9431
u12550:
	line	1404
	
l9429:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+038h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+038h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_high_edit_flag),indf2

	goto	l9473
	line	1405
	
l9431:; BSR set to: 1

		movlw	10
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12561
	goto	u12560

u12561:
	goto	l9435
u12560:
	line	1406
	
l9433:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+039h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+039h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_plp_edit_flag),indf2

	goto	l9473
	line	1407
	
l9435:; BSR set to: 1

		movlw	11
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12571
	goto	u12570

u12571:
	goto	l9439
u12570:
	line	1408
	
l9437:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_slp_edit_flag),indf2

	goto	l9473
	line	1409
	
l9439:; BSR set to: 1

		movlw	12
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12581
	goto	u12580

u12581:
	goto	l9415
u12580:
	line	1410
	
l9441:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_display_edit_flag),indf2

	goto	l9473
	line	1412
	
l9443:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u12591
	goto	u12590

u12591:
	goto	l9453
u12590:
	line	1414
	
l9445:; BSR set to: 1

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12601
	goto	u12600

u12601:
	goto	l9449
u12600:
	goto	l9429
	line	1416
	
l9449:; BSR set to: 1

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12611
	goto	u12610

u12611:
	goto	l9415
u12610:
	goto	l9441
	line	1419
	
l9453:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u12621
	goto	u12620

u12621:
	goto	l9415
u12620:
	line	1421
	
l9455:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u12631
	goto	u12630
u12631:
	goto	l9465
u12630:
	line	1423
	
l9457:; BSR set to: 1

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12641
	goto	u12640

u12641:
	goto	l9461
u12640:
	line	1424
	
l9459:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Bh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Bh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_low_edit_flag),indf2

	goto	l9473
	line	1425
	
l9461:; BSR set to: 1

		movlw	9
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12651
	goto	u12650

u12651:
	goto	l9415
u12650:
	goto	l9441
	line	1430
	
l9465:; BSR set to: 1

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12661
	goto	u12660

u12661:
	goto	l9469
u12660:
	goto	l9459
	line	1432
	
l9469:; BSR set to: 1

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12671
	goto	u12670

u12671:
	goto	l9415
u12670:
	goto	l9441
	line	1437
	
l9473:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	1440
	
l9475:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	1441
	
l9477:; BSR set to: 1

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1442
	goto	l1103
	line	1444
	
l9479:
	movff	(menu_handle_button@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_time_field@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u12681
	goto	u12680
u12681:
	goto	l9543
u12680:
	line	1446
	
l9481:
	movlb	1	; () banked
	incf	(0+(_menu+011h))&0ffh
	line	1447
	
l9483:; BSR set to: 1

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	1448
	
l9485:; BSR set to: 1

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1451
	
l9487:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_201)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_201)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1452
	
l9489:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1454
	
l9491:
	call	_menu_update_time_value	;wreg free
	line	1456
	
l9493:
		movlw	02h-1
	movlb	1	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u12691
	goto	u12690

u12691:
	goto	l1103
u12690:
	line	1460
	
l9495:; BSR set to: 1

	movf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u12701
	goto	u12700
u12701:
	goto	l9499
u12700:
	line	1461
	
l9497:; BSR set to: 1

	movf	(0+(_menu+012h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+(_menu+013h))&0ffh,w
	addwf	(??_menu_handle_button+0+0)^00h,c,w
	movwf	((menu_handle_button@new_seconds))&0ffh
	movlw	0
	addwfc	(??_menu_handle_button+0+1)^00h,c,w
	movwf	1+((menu_handle_button@new_seconds))&0ffh
	goto	l9501
	line	1463
	
l9499:; BSR set to: 1

	movff	0+(_menu+012h),(c:___wmul@multiplier)
	clrf	((c:___wmul@multiplier+1))^00h,c
	movlw	high(0E10h)
	movwf	((c:___wmul@multiplicand+1))^00h,c
	movlw	low(0E10h)
	movwf	((c:___wmul@multiplicand))^00h,c
	call	___wmul	;wreg free
	movlb	1	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+?___wmul)^00h,c,w
	addwf	(??_menu_handle_button+0+0)^00h,c,w
	movwf	((menu_handle_button@new_seconds))&0ffh
	movf	(1+?___wmul)^00h,c,w
	addwfc	(??_menu_handle_button+0+1)^00h,c,w
	movwf	1+((menu_handle_button@new_seconds))&0ffh
	line	1466
	
l9501:; BSR set to: 1

	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u12711
	goto	u12710
u12711:
	goto	l9515
u12710:
	line	1468
	
l9503:; BSR set to: 1

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12721
	goto	u12720

u12721:
	goto	l9507
u12720:
	line	1469
	
l9505:; BSR set to: 1

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
	goto	l9535
	line	1470
	
l9507:; BSR set to: 1

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12731
	goto	u12730

u12731:
	goto	l9511
u12730:
	line	1471
	
l9509:; BSR set to: 1

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
	goto	l9535
	line	1472
	
l9511:; BSR set to: 1

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12741
	goto	u12740

u12741:
	goto	l990
u12740:
	line	1473
	
l9513:; BSR set to: 1

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
	goto	l9535
	line	1474
	
l990:; BSR set to: 1

	goto	l9535
	line	1475
	
l9515:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u12751
	goto	u12750

u12751:
	goto	l9521
u12750:
	line	1477
	
l9517:; BSR set to: 1

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12761
	goto	u12760

u12761:
	goto	l9535
u12760:
	goto	l9505
	line	1480
	
l9521:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u12771
	goto	u12770

u12771:
	goto	l9535
u12770:
	line	1482
	
l9523:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u12781
	goto	u12780
u12781:
	goto	l9529
u12780:
	
l9525:; BSR set to: 1

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12791
	goto	u12790

u12791:
	goto	l9529
u12790:
	line	1483
	
l9527:; BSR set to: 1

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
	goto	l9535
	line	1484
	
l9529:; BSR set to: 1

		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u12801
	goto	u12800

u12801:
	goto	l9535
u12800:
	
l9531:; BSR set to: 1

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12811
	goto	u12810

u12811:
	goto	l9535
u12810:
	goto	l9527
	line	1490
	
l9535:; BSR set to: 1

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
		movlw	low(STR_202)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_202)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1492
	
l9537:
	movlw	low(0)
	movlb	1	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1493
	
l9539:; BSR set to: 1

	movlw	low(01h)
	movwf	((_save_pending))&0ffh
	line	1494
	
l9541:; BSR set to: 1

		movlw	low(STR_203)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_203)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1103
	line	1498
	
l9543:
	movff	(menu_handle_button@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_numeric_field@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u12821
	goto	u12820
u12821:
	goto	l1002
u12820:
	line	1500
	
l9545:
	movlb	1	; () banked
	incf	(0+(_menu+08h))&0ffh
	line	1501
	
l9547:; BSR set to: 1

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1503
	
l9549:
		movlw	2
	movlb	1	; () banked
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u12831
	goto	u12830

u12831:
	goto	l9555
u12830:
	
l9551:; BSR set to: 1

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u12841
	goto	u12840

u12841:
	goto	l9555
u12840:
	line	1505
	
l9553:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+0Bh))&0ffh
	line	1506
	movlw	low(0)
	movwf	(0+(_menu+0Ch))&0ffh
	line	1509
	
l9555:; BSR set to: 1

		movlw	04h-1
	cpfsgt	(0+(_menu+08h))&0ffh
	goto	u12851
	goto	u12850

u12851:
	goto	l1002
u12850:
	line	1511
	
l9557:; BSR set to: 1

	call	_get_current_numeric_value	;wreg free
	movff	0+?_get_current_numeric_value,(menu_handle_button@new_value)
	movff	1+?_get_current_numeric_value,(menu_handle_button@new_value+1)
	line	1514
	
l9559:; BSR set to: 1

	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u12861
	goto	u12860
u12861:
	goto	l9583
u12860:
	line	1516
	
l9561:; BSR set to: 1

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12871
	goto	u12870

u12871:
	goto	l9567
u12870:
	line	1518
	
l9563:; BSR set to: 1

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
	line	1519
	
l9565:; BSR set to: 1

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_204)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_204)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1520
	goto	l9625
	line	1521
	
l9567:; BSR set to: 1

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12881
	goto	u12880

u12881:
	goto	l9573
u12880:
	line	1523
	
l9569:; BSR set to: 1

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
	line	1524
	
l9571:; BSR set to: 1

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_205)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_205)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1525
	goto	l9625
	line	1526
	
l9573:; BSR set to: 1

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12891
	goto	u12890

u12891:
	goto	l9579
u12890:
	line	1528
	
l9575:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value),postinc2
	movff	(menu_handle_button@new_value+1),postdec2
	line	1529
	
l9577:; BSR set to: 1

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_206)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_206)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1530
	goto	l9625
	line	1531
	
l9579:; BSR set to: 1

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12901
	goto	u12900

u12901:
	goto	l1010
u12900:
	line	1534
	
l9581:; BSR set to: 1

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_207)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_207)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l9625
	line	1536
	
l1010:; BSR set to: 1

	goto	l9625
	line	1537
	
l9583:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u12911
	goto	u12910

u12911:
	goto	l9603
u12910:
	line	1539
	
l9585:; BSR set to: 1

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12921
	goto	u12920

u12921:
	goto	l9591
u12920:
	line	1541
	
l9587:; BSR set to: 1

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
	line	1542
	
l9589:; BSR set to: 1

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_208)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_208)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1543
	goto	l9625
	line	1544
	
l9591:; BSR set to: 1

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12931
	goto	u12930

u12931:
	goto	l9597
u12930:
	line	1546
	
l9593:; BSR set to: 1

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
	line	1547
	
l9595:; BSR set to: 1

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_209)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_209)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1548
	goto	l9625
	line	1549
	
l9597:; BSR set to: 1

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12941
	goto	u12940

u12941:
	goto	l1010
u12940:
	line	1551
	
l9599:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value),postinc2
	movff	(menu_handle_button@new_value+1),postdec2
	line	1552
	
l9601:; BSR set to: 1

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_210)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_210)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l9625
	line	1555
	
l9603:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u12951
	goto	u12950

u12951:
	goto	l9625
u12950:
	
l9605:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u12961
	goto	u12960
u12961:
	goto	l9625
u12960:
	line	1557
	
l9607:; BSR set to: 1

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12971
	goto	u12970

u12971:
	goto	l9613
u12970:
	line	1559
	
l9609:; BSR set to: 1

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
	line	1560
	
l9611:; BSR set to: 1

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_211)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_211)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1561
	goto	l9625
	line	1562
	
l9613:; BSR set to: 1

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12981
	goto	u12980

u12981:
	goto	l9619
u12980:
	line	1564
	
l9615:; BSR set to: 1

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
	line	1565
	
l9617:; BSR set to: 1

		movff	0+(_input_menu+01Bh),(c:sprintf@sp)
	movff	1+(_input_menu+01Bh),(c:sprintf@sp+1)

		movlw	low(STR_212)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_212)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1566
	goto	l9625
	line	1567
	
l9619:; BSR set to: 1

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12991
	goto	u12990

u12991:
	goto	l1010
u12990:
	line	1569
	
l9621:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+020h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+020h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value),postinc2
	movff	(menu_handle_button@new_value+1),postdec2
	line	1570
	
l9623:; BSR set to: 1

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_213)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_213)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1574
	
l9625:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	1575
	
l9627:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	goto	l1103
	line	1578
	
l1002:
	goto	l1103
	line	1579
	
l9629:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u13001
	goto	u13000

u13001:
	goto	l1103
u13000:
	line	1581
	
l9631:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	1582
	
l9633:; BSR set to: 1

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1583
	
l9635:
	asmopt push
asmopt off
movlw  3
movwf	(??_menu_handle_button+0+0+1)^00h,c
movlw	8
movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	119
u13877:
decfsz	wreg,f
	bra	u13877
	decfsz	(??_menu_handle_button+0+0)^00h,c,f
	bra	u13877
	decfsz	(??_menu_handle_button+0+0+1)^00h,c,f
	bra	u13877
	nop
asmopt pop

	line	1584
	
l9637:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1103
	line	1589
	
l9639:; BSR set to: 1

		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u13011
	goto	u13010

u13011:
	goto	l9835
u13010:
	line	1591
	
l9641:; BSR set to: 1

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13021
	goto	u13020
u13021:
	goto	l9661
u13020:
	line	1593
	
l9643:; BSR set to: 1

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1595
	goto	l9659
	line	1601
	
l9645:; BSR set to: 1

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	1602
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	1603
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	1604
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	1605
	
l9647:; BSR set to: 1

	call	_menu_draw_setup	;wreg free
	line	1606
	goto	l1103
	line	1615
	
l9649:; BSR set to: 1

	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u13031
	goto	u13030
u13031:
	goto	l9655
u13030:
	line	1617
	
l9651:; BSR set to: 1

	call	_save_current_config	;wreg free
	line	1618
	
l9653:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	1620
	
l9655:; BSR set to: 1

	setf	((_current_menu))&0ffh
	line	1621
	goto	l1103
	line	1595
	
l9659:
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
	goto	l1002
	xorlw	1^0	; case 1
	skipnz
	goto	l9645
	xorlw	2^1	; case 2
	skipnz
	goto	l1002
	xorlw	3^2	; case 3
	skipnz
	goto	l1002
	xorlw	4^3	; case 4
	skipnz
	goto	l9649
	goto	l1103

	line	1624
	
l9661:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13041
	goto	u13040

u13041:
	goto	l9811
u13040:
	line	1626
	
l9663:; BSR set to: 1

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
	bnz	u13051
movf	(??_menu_handle_button+0+1)^00h,c,w
xorwf	(??_menu_handle_button+2+1)^00h,c,w
	btfss	status,2
	goto	u13051
	goto	u13050

u13051:
	goto	l9677
u13050:
	line	1628
	
l9665:; BSR set to: 1

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1629
	
l9667:
	movlw	low(02h)
	movlb	1	; () banked
	movwf	((_current_menu))&0ffh
	line	1630
	
l9669:; BSR set to: 1

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	1631
	
l9671:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	1632
	
l9673:; BSR set to: 1

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l9647
	line	1635
	
l9677:; BSR set to: 1

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
	goto	u13061
	goto	u13060
u13061:
	goto	l1103
u13060:
	line	1637
	
l9679:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((menu_handle_button@sensor_type_1363))&0ffh
	line	1638
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((menu_handle_button@flow_type_1364))&0ffh
	line	1641
	
l9681:; BSR set to: 1

	movff	(menu_handle_button@sensor_type_1363),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type_1364),(c:is_numeric_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u13071
	goto	u13070
u13071:
	goto	l9739
u13070:
	line	1643
	
l9683:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val))&0ffh
	line	1646
	movf	((menu_handle_button@sensor_type_1363))&0ffh,w
	btfss	status,2
	goto	u13081
	goto	u13080
u13081:
	goto	l9701
u13080:
	line	1648
	
l9685:; BSR set to: 1

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13091
	goto	u13090

u13091:
	goto	l9689
u13090:
	line	1649
	
l9687:; BSR set to: 1

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
	goto	l9731
	line	1650
	
l9689:; BSR set to: 1

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13101
	goto	u13100

u13101:
	goto	l9693
u13100:
	line	1651
	
l9691:; BSR set to: 1

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
	goto	l9731
	line	1652
	
l9693:; BSR set to: 1

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13111
	goto	u13110

u13111:
	goto	l9697
u13110:
	line	1653
	
l9695:; BSR set to: 1

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
	goto	l9731
	line	1654
	
l9697:; BSR set to: 1

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13121
	goto	u13120

u13121:
	goto	l1051
u13120:
	line	1655
	
l9699:; BSR set to: 1

	movlw	high(032h)
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(032h)
	movwf	((menu_handle_button@current_val))&0ffh
	goto	l9731
	line	1656
	
l1051:; BSR set to: 1

	goto	l9731
	line	1657
	
l9701:; BSR set to: 1

		decf	((menu_handle_button@sensor_type_1363))&0ffh,w
	btfss	status,2
	goto	u13131
	goto	u13130

u13131:
	goto	l9715
u13130:
	line	1659
	
l9703:; BSR set to: 1

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13141
	goto	u13140

u13141:
	goto	l9707
u13140:
	goto	l9687
	line	1661
	
l9707:; BSR set to: 1

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13151
	goto	u13150

u13151:
	goto	l9711
u13150:
	goto	l9691
	line	1663
	
l9711:; BSR set to: 1

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13161
	goto	u13160

u13161:
	goto	l1051
u13160:
	goto	l9695
	line	1666
	
l9715:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1363))&0ffh,w
	btfss	status,2
	goto	u13171
	goto	u13170

u13171:
	goto	l9731
u13170:
	
l9717:; BSR set to: 1

	movf	((menu_handle_button@flow_type_1364))&0ffh,w
	btfss	status,2
	goto	u13181
	goto	u13180
u13181:
	goto	l9731
u13180:
	line	1668
	
l9719:; BSR set to: 1

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13191
	goto	u13190

u13191:
	goto	l9723
u13190:
	goto	l9687
	line	1670
	
l9723:; BSR set to: 1

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13201
	goto	u13200

u13201:
	goto	l9727
u13200:
	goto	l9691
	line	1672
	
l9727:; BSR set to: 1

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13211
	goto	u13210

u13211:
	goto	l1051
u13210:
	line	1673
	
l9729:; BSR set to: 1

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
	line	1676
	
l9731:; BSR set to: 1

	movff	(menu_handle_button@current_val),(c:init_numeric_editor@value)
	movff	(menu_handle_button@current_val+1),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	1677
	
l9733:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1678
	
l9735:; BSR set to: 1

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l9477
	line	1682
	
l9739:
	movff	(menu_handle_button@sensor_type_1363),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type_1364),(c:is_time_field@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u13221
	goto	u13220
u13221:
	goto	l9785
u13220:
	line	1684
	
l9741:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val_1367+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val_1367))&0ffh
	line	1687
	movf	((menu_handle_button@sensor_type_1363))&0ffh,w
	btfss	status,2
	goto	u13231
	goto	u13230
u13231:
	goto	l9755
u13230:
	line	1689
	
l9743:; BSR set to: 1

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13241
	goto	u13240

u13241:
	goto	l9747
u13240:
	line	1690
	
l9745:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1367)
	movff	postdec2,(menu_handle_button@current_val_1367+1)
	goto	l9773
	line	1691
	
l9747:; BSR set to: 1

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13251
	goto	u13250

u13251:
	goto	l9751
u13250:
	line	1692
	
l9749:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1367)
	movff	postdec2,(menu_handle_button@current_val_1367+1)
	goto	l9773
	line	1693
	
l9751:; BSR set to: 1

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13261
	goto	u13260

u13261:
	goto	l1073
u13260:
	line	1694
	
l9753:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1367)
	movff	postdec2,(menu_handle_button@current_val_1367+1)
	goto	l9773
	line	1695
	
l1073:; BSR set to: 1

	goto	l9773
	line	1696
	
l9755:; BSR set to: 1

		decf	((menu_handle_button@sensor_type_1363))&0ffh,w
	btfss	status,2
	goto	u13271
	goto	u13270

u13271:
	goto	l9761
u13270:
	line	1698
	
l9757:; BSR set to: 1

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13281
	goto	u13280

u13281:
	goto	l9773
u13280:
	goto	l9745
	line	1701
	
l9761:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1363))&0ffh,w
	btfss	status,2
	goto	u13291
	goto	u13290

u13291:
	goto	l9773
u13290:
	line	1704
	
l9763:; BSR set to: 1

	movf	((menu_handle_button@flow_type_1364))&0ffh,w
	btfss	status,2
	goto	u13301
	goto	u13300
u13301:
	goto	l9767
u13300:
	
l9765:; BSR set to: 1

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u13311
	goto	u13310

u13311:
	goto	l9771
u13310:
	
l9767:; BSR set to: 1

		decf	((menu_handle_button@flow_type_1364))&0ffh,w
	btfss	status,2
	goto	u13321
	goto	u13320

u13321:
	goto	l9773
u13320:
	
l9769:; BSR set to: 1

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13331
	goto	u13330

u13331:
	goto	l9773
u13330:
	line	1705
	
l9771:; BSR set to: 1

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1367)
	movff	postdec2,(menu_handle_button@current_val_1367+1)
	line	1709
	
l9773:; BSR set to: 1

		movlw	low(menu_handle_button@buf_1368)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1368)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_214)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_214)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@current_val_1367),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@current_val_1367+1),1+((c:?_sprintf)+04h)
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1710
	
l9775:
		movlw	low(menu_handle_button@buf_1368)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1368)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1712
	
l9777:
	movff	(menu_handle_button@current_val_1367),(c:init_time_editor@value_seconds)
	movff	(menu_handle_button@current_val_1367+1),(c:init_time_editor@value_seconds+1)
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	goto	l9733
	line	1718
	
l9785:
	movff	(menu_handle_button@sensor_type_1363),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type_1364),(c:is_option_field@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u13341
	goto	u13340
u13341:
	goto	l1002
u13340:
	line	1720
	
l9787:
		movlw	low(_original_value)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_original_value)
	movwf	((c:strcpy@to+1))^00h,c

	movlb	1	; () banked
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
	line	1722
	
l9789:
	movff	(menu_handle_button@sensor_type_1363),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type_1364),(c:get_option_edit_flag@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1371)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1371+1)
	line	1723
	
l9791:
	movff	(menu_handle_button@sensor_type_1363),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type_1364),(c:get_item_options_for_field@flow_type)
	movlb	1	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1372)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1372+1)
	line	1725
	
l9793:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag_1371))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1371+1))&0ffh,w
	btfsc	status,2
	goto	u13351
	goto	u13350

u13351:
	goto	l9807
u13350:
	
l9795:; BSR set to: 1

	movf	((menu_handle_button@opts_1372))&0ffh,w
iorwf	((menu_handle_button@opts_1372+1))&0ffh,w
	btfsc	status,2
	goto	u13361
	goto	u13360

u13361:
	goto	l9807
u13360:
	line	1728
	
l9797:; BSR set to: 1

	movlw	low(0)
	movwf	((menu_handle_button@i))&0ffh
	goto	l9805
	line	1730
	
l9799:; BSR set to: 1

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
	addwf	((menu_handle_button@opts_1372))&0ffh,w
	movwf	(??_menu_handle_button+2+0)^00h,c
	movf	(??_menu_handle_button+0+1)^00h,c,w
	addwfc	((menu_handle_button@opts_1372+1))&0ffh,w
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
	goto	u13371
	goto	u13370

u13371:
	goto	l9803
u13370:
	line	1732
	
l9801:
	movff	(menu_handle_button@edit_flag_1371),fsr2l
	movff	(menu_handle_button@edit_flag_1371+1),fsr2h
	movff	(menu_handle_button@i),indf2

	line	1733
	goto	l9807
	line	1728
	
l9803:
	movlb	1	; () banked
	incf	((menu_handle_button@i))&0ffh
	
l9805:; BSR set to: 1

	movlw	01h
	addwf	((menu_handle_button@opts_1372))&0ffh,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	0
	addwfc	((menu_handle_button@opts_1372+1))&0ffh,w
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
	goto	u13381
	goto	u13380

u13381:
	goto	l9799
u13380:
	line	1738
	
l9807:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1739
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l9477
	line	1744
	
l9811:; BSR set to: 1

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13391
	goto	u13390

u13391:
	goto	l1002
u13390:
	line	1746
	
l9813:; BSR set to: 1

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1748
	
l9815:
		movlw	4
	movlb	1	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13401
	goto	u13400

u13401:
	goto	l9821
u13400:
	line	1750
	
l9817:; BSR set to: 1

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	1751
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	1752
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	1753
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	1754
	
l9819:; BSR set to: 1

	call	_menu_draw_options	;wreg free
	line	1755
	goto	l1103
	line	1756
	
l9821:; BSR set to: 1

		movlw	03h-0
	cpfslt	((_menu))&0ffh
	goto	u13411
	goto	u13410

u13411:
	goto	l1002
u13410:
	line	1758
	
l9823:; BSR set to: 1

	movf	((_menu))&0ffh,w
	
	call	_rebuild_input_menu
	line	1759
	
l9825:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_current_menu))&0ffh
	line	1760
	
l9827:; BSR set to: 1

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	1761
	
l9829:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	1762
	
l9831:; BSR set to: 1

	call	_menu_draw_input	;wreg free
	line	1763
	goto	l1103
	line	1770
	
l9835:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u13421
	goto	u13420

u13421:
	goto	l1103
u13420:
	goto	l9633
	line	1777
	
l1103:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_button
	__end_of_menu_handle_button:
	signat	_menu_handle_button,4217
	global	_rebuild_input_menu

;; *************** function _rebuild_input_menu *****************
;; Defined at:
;;		line 597 in file "src\menu.c"
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
;;		On entry : 3F/1
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
psect	text10,class=CODE,space=0,reloc=2,group=0
	line	597
global __ptext10
__ptext10:
psect	text10
	file	"src\menu.c"
	line	597
	
_rebuild_input_menu:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((rebuild_input_menu@input_num))&0ffh
	line	600
	
l8749:
	movff	(rebuild_input_menu@input_num),(_current_input)
	line	603
	
l8751:
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
	line	604
	
l8753:; BSR set to: 0

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
	line	607
	
l8755:; BSR set to: 0

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
	goto	u11481
	goto	u11480
u11481:
	goto	l8759
u11480:
	
l8757:; BSR set to: 0

		movlw	low(STR_119)
	movwf	((_rebuild_input_menu$1115))&0ffh
	movlw	high(STR_119)
	movwf	((_rebuild_input_menu$1115+1))&0ffh

	goto	l8761
	
l8759:; BSR set to: 0

		movlw	low(STR_118)
	movwf	((_rebuild_input_menu$1115))&0ffh
	movlw	high(STR_118)
	movwf	((_rebuild_input_menu$1115+1))&0ffh

	
l8761:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_117)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_117)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_input_menu$1115),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$1115+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	609
	
l8763:
	movlb	0	; () banked
	movf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u11491
	goto	u11490
u11491:
	goto	l8869
u11490:
	line	611
	
l8765:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_120)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_120)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	612
	
l8767:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_121)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_121)
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
	line	613
	
l8769:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_122)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_122)
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
	line	614
	
l8771:
		movlw	low(_value_hi_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_hi_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_123)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_123)
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
	line	617
	
l8773:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2308)
	movff	1+?___lwdiv,(_rebuild_input_menu$2308+1)
	
l8775:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2309)
	movff	1+?___lwmod,(_rebuild_input_menu$2309+1)
	
l8777:
		movlw	low(_value_highbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_highbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_124)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_124)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2308),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2308+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2309),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2309+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	618
	
l8779:
		movlw	low(_value_low_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_125)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_125)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	high(032h)
	movwf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(032h)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	621
	
l8781:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2308)
	movff	1+?___lwdiv,(_rebuild_input_menu$2308+1)
	
l8783:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2309)
	movff	1+?___lwmod,(_rebuild_input_menu$2309+1)
	
l8785:
		movlw	low(_value_plpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_plpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_126)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_126)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2308),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2308+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2309),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2309+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	624
	
l8787:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2308)
	movff	1+?___lwdiv,(_rebuild_input_menu$2308+1)
	
l8789:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2309)
	movff	1+?___lwmod,(_rebuild_input_menu$2309+1)
	
l8791:
		movlw	low(_value_slpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_slpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_127)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_127)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2308),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2308+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2309),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2309+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	627
	
l8793:
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
	goto	u11501
	goto	u11500
u11501:
	goto	l8801
u11500:
	
l8795:; BSR set to: 0

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
	goto	u11511
	goto	u11510

u11511:
	goto	l8799
u11510:
	
l8797:; BSR set to: 0

		movlw	low(STR_130)
	movwf	((_rebuild_input_menu$1130))&0ffh
	movlw	high(STR_130)
	movwf	((_rebuild_input_menu$1130+1))&0ffh

	goto	l609
	
l8799:; BSR set to: 0

		movlw	low(STR_129)
	movwf	((_rebuild_input_menu$1130))&0ffh
	movlw	high(STR_129)
	movwf	((_rebuild_input_menu$1130+1))&0ffh

	
l609:; BSR set to: 0

		movff	(_rebuild_input_menu$1130),(_rebuild_input_menu$1129)
	movff	(_rebuild_input_menu$1130+1),(_rebuild_input_menu$1129+1)

	goto	l8803
	
l8801:; BSR set to: 0

		movlw	low(STR_128)
	movwf	((_rebuild_input_menu$1129))&0ffh
	movlw	high(STR_128)
	movwf	((_rebuild_input_menu$1129+1))&0ffh

	
l8803:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1129),(c:strcpy@from)
	movff	(_rebuild_input_menu$1129+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	629
	
l8805:
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
	goto	u11521
	goto	u11520
u11521:
	goto	l8813
u11520:
	
l8807:; BSR set to: 0

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
	goto	u11531
	goto	u11530

u11531:
	goto	l8811
u11530:
	
l8809:; BSR set to: 0

		movlw	low(STR_133)
	movwf	((_rebuild_input_menu$1137))&0ffh
	movlw	high(STR_133)
	movwf	((_rebuild_input_menu$1137+1))&0ffh

	goto	l617
	
l8811:; BSR set to: 0

		movlw	low(STR_132)
	movwf	((_rebuild_input_menu$1137))&0ffh
	movlw	high(STR_132)
	movwf	((_rebuild_input_menu$1137+1))&0ffh

	
l617:; BSR set to: 0

		movff	(_rebuild_input_menu$1137),(_rebuild_input_menu$1136)
	movff	(_rebuild_input_menu$1137+1),(_rebuild_input_menu$1136+1)

	goto	l8815
	
l8813:; BSR set to: 0

		movlw	low(STR_131)
	movwf	((_rebuild_input_menu$1136))&0ffh
	movlw	high(STR_131)
	movwf	((_rebuild_input_menu$1136+1))&0ffh

	
l8815:; BSR set to: 0

		movlw	low(_value_rlyplp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyplp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1136),(c:strcpy@from)
	movff	(_rebuild_input_menu$1136+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	631
	
l8817:
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
	goto	u11541
	goto	u11540
u11541:
	goto	l8825
u11540:
	
l8819:; BSR set to: 0

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
	goto	u11551
	goto	u11550

u11551:
	goto	l8823
u11550:
	
l8821:; BSR set to: 0

		movlw	low(STR_136)
	movwf	((_rebuild_input_menu$1144))&0ffh
	movlw	high(STR_136)
	movwf	((_rebuild_input_menu$1144+1))&0ffh

	goto	l625
	
l8823:; BSR set to: 0

		movlw	low(STR_135)
	movwf	((_rebuild_input_menu$1144))&0ffh
	movlw	high(STR_135)
	movwf	((_rebuild_input_menu$1144+1))&0ffh

	
l625:; BSR set to: 0

		movff	(_rebuild_input_menu$1144),(_rebuild_input_menu$1143)
	movff	(_rebuild_input_menu$1144+1),(_rebuild_input_menu$1143+1)

	goto	l8827
	
l8825:; BSR set to: 0

		movlw	low(STR_134)
	movwf	((_rebuild_input_menu$1143))&0ffh
	movlw	high(STR_134)
	movwf	((_rebuild_input_menu$1143+1))&0ffh

	
l8827:; BSR set to: 0

		movlw	low(_value_rlyslp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyslp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1143),(c:strcpy@from)
	movff	(_rebuild_input_menu$1143+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	632
	
l8829:
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
	goto	u11561
	goto	u11560
u11561:
	goto	l8833
u11560:
	
l8831:; BSR set to: 0

		movlw	low(STR_138)
	movwf	((_rebuild_input_menu$1148))&0ffh
	movlw	high(STR_138)
	movwf	((_rebuild_input_menu$1148+1))&0ffh

	goto	l8835
	
l8833:; BSR set to: 0

		movlw	low(STR_137)
	movwf	((_rebuild_input_menu$1148))&0ffh
	movlw	high(STR_137)
	movwf	((_rebuild_input_menu$1148+1))&0ffh

	
l8835:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1148),(c:strcpy@from)
	movff	(_rebuild_input_menu$1148+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	635
	
l8837:
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
	line	638
	
l8839:
		movlw	low(_value_enable)
	movlb	2	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	639
	
l8841:; BSR set to: 2

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	640
	
l8843:; BSR set to: 2

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	641
	
l8845:; BSR set to: 2

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	642
	
l8847:; BSR set to: 2

		movlw	low(_value_hi_pressure)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_hi_pressure)
	movwf	(1+(_input_menu+016h))&0ffh

	line	643
	
l8849:; BSR set to: 2

		movlw	low(_value_highbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_highbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	644
	
l8851:; BSR set to: 2

		movlw	low(_value_low_pressure)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_pressure)
	movwf	(1+(_input_menu+020h))&0ffh

	line	645
	
l8853:; BSR set to: 2

		movlw	low(_value_plpbp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_plpbp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	646
	
l8855:; BSR set to: 2

		movlw	low(_value_slpbp)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_slpbp)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	647
	
l8857:; BSR set to: 2

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	648
	
l8859:; BSR set to: 2

		movlw	low(_value_rlyplp)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_rlyplp)
	movwf	(1+(_input_menu+034h))&0ffh

	line	649
	
l8861:; BSR set to: 2

		movlw	low(_value_rlyslp)
	movwf	(0+(_input_menu+039h))&0ffh
	movlw	high(_value_rlyslp)
	movwf	(1+(_input_menu+039h))&0ffh

	line	650
	
l8863:; BSR set to: 2

		movlw	low(_value_display)
	movwf	(0+(_input_menu+03Eh))&0ffh
	clrf	(1+(_input_menu+03Eh))&0ffh

	line	651
	
l8865:; BSR set to: 2

		movlw	low(_value_back)
	movwf	(0+(_input_menu+043h))&0ffh
	clrf	(1+(_input_menu+043h))&0ffh

	line	653
	
l8867:; BSR set to: 2

	movlw	low(0Eh)
	movlb	1	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	654
	goto	l9035
	line	655
	
l8869:; BSR set to: 0

		decf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u11571
	goto	u11570

u11571:
	goto	l8927
u11570:
	line	657
	
l8871:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_139)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_139)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	658
	
l8873:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_140)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_140)
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
	line	659
	
l8875:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_141)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_141)
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
	line	660
	
l8877:
		movlw	low(_value_high_temp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_temp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_142)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_142)
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
	line	663
	
l8879:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2308)
	movff	1+?___lwdiv,(_rebuild_input_menu$2308+1)
	
l8881:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2309)
	movff	1+?___lwmod,(_rebuild_input_menu$2309+1)
	
l8883:
		movlw	low(_value_high_tbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_tbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_143)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_143)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2308),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2308+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2309),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2309+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	665
	
l8885:
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
	goto	u11581
	goto	u11580
u11581:
	goto	l8893
u11580:
	
l8887:; BSR set to: 0

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
	goto	u11591
	goto	u11590

u11591:
	goto	l8891
u11590:
	
l8889:; BSR set to: 0

		movlw	low(STR_146)
	movwf	((_rebuild_input_menu$1163))&0ffh
	movlw	high(STR_146)
	movwf	((_rebuild_input_menu$1163+1))&0ffh

	goto	l639
	
l8891:; BSR set to: 0

		movlw	low(STR_145)
	movwf	((_rebuild_input_menu$1163))&0ffh
	movlw	high(STR_145)
	movwf	((_rebuild_input_menu$1163+1))&0ffh

	
l639:; BSR set to: 0

		movff	(_rebuild_input_menu$1163),(_rebuild_input_menu$1162)
	movff	(_rebuild_input_menu$1163+1),(_rebuild_input_menu$1162+1)

	goto	l8895
	
l8893:; BSR set to: 0

		movlw	low(STR_144)
	movwf	((_rebuild_input_menu$1162))&0ffh
	movlw	high(STR_144)
	movwf	((_rebuild_input_menu$1162+1))&0ffh

	
l8895:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1162),(c:strcpy@from)
	movff	(_rebuild_input_menu$1162+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	666
	
l8897:
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
	goto	u11601
	goto	u11600
u11601:
	goto	l8901
u11600:
	
l8899:; BSR set to: 0

		movlw	low(STR_148)
	movwf	((_rebuild_input_menu$1167))&0ffh
	movlw	high(STR_148)
	movwf	((_rebuild_input_menu$1167+1))&0ffh

	goto	l8903
	
l8901:; BSR set to: 0

		movlw	low(STR_147)
	movwf	((_rebuild_input_menu$1167))&0ffh
	movlw	high(STR_147)
	movwf	((_rebuild_input_menu$1167+1))&0ffh

	
l8903:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1167),(c:strcpy@from)
	movff	(_rebuild_input_menu$1167+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	669
	
l8905:
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
	line	672
	
l8907:
		movlw	low(_value_enable)
	movlb	2	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	673
	
l8909:; BSR set to: 2

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	674
	
l8911:; BSR set to: 2

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	675
	
l8913:; BSR set to: 2

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	676
	
l8915:; BSR set to: 2

		movlw	low(_value_high_temp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_high_temp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	677
	
l8917:; BSR set to: 2

		movlw	low(_value_high_tbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_high_tbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	678
	
l8919:; BSR set to: 2

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+020h))&0ffh

	line	679
	
l8921:; BSR set to: 2

		movlw	low(_value_display)
	movwf	(0+(_input_menu+025h))&0ffh
	clrf	(1+(_input_menu+025h))&0ffh

	line	680
	
l8923:; BSR set to: 2

		movlw	low(_value_back)
	movwf	(0+(_input_menu+02Ah))&0ffh
	clrf	(1+(_input_menu+02Ah))&0ffh

	line	682
	
l8925:; BSR set to: 2

	movlw	low(09h)
	movlb	1	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	683
	goto	l9035
	line	684
	
l8927:; BSR set to: 0

		movlw	2
	xorwf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u11611
	goto	u11610

u11611:
	goto	l9035
u11610:
	line	686
	
l8929:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_149)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_149)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	687
	
l8931:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfsc	status,2
	goto	u11621
	goto	u11620
u11621:
	goto	l8935
u11620:
	
l8933:; BSR set to: 0

		movlw	low(STR_151)
	movwf	((_rebuild_input_menu$1172))&0ffh
	movlw	high(STR_151)
	movwf	((_rebuild_input_menu$1172+1))&0ffh

	goto	l8937
	
l8935:; BSR set to: 0

		movlw	low(STR_150)
	movwf	((_rebuild_input_menu$1172))&0ffh
	movlw	high(STR_150)
	movwf	((_rebuild_input_menu$1172+1))&0ffh

	
l8937:; BSR set to: 0

		movlw	low(_value_flow_type)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_type)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1172),(c:strcpy@from)
	movff	(_rebuild_input_menu$1172+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	688
	
l8939:
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
	goto	u11631
	goto	u11630
u11631:
	goto	l8943
u11630:
	
l8941:; BSR set to: 0

		movlw	low(STR_153)
	movwf	((_rebuild_input_menu$1176))&0ffh
	movlw	high(STR_153)
	movwf	((_rebuild_input_menu$1176+1))&0ffh

	goto	l8945
	
l8943:; BSR set to: 0

		movlw	low(STR_152)
	movwf	((_rebuild_input_menu$1176))&0ffh
	movlw	high(STR_152)
	movwf	((_rebuild_input_menu$1176+1))&0ffh

	
l8945:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1176),(c:strcpy@from)
	movff	(_rebuild_input_menu$1176+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	690
	
l8947:
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
	goto	u11641
	goto	u11640
u11641:
	goto	l8955
u11640:
	
l8949:; BSR set to: 0

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
	goto	u11651
	goto	u11650

u11651:
	goto	l8953
u11650:
	
l8951:; BSR set to: 0

		movlw	low(STR_156)
	movwf	((_rebuild_input_menu$1183))&0ffh
	movlw	high(STR_156)
	movwf	((_rebuild_input_menu$1183+1))&0ffh

	goto	l661
	
l8953:; BSR set to: 0

		movlw	low(STR_155)
	movwf	((_rebuild_input_menu$1183))&0ffh
	movlw	high(STR_155)
	movwf	((_rebuild_input_menu$1183+1))&0ffh

	
l661:; BSR set to: 0

		movff	(_rebuild_input_menu$1183),(_rebuild_input_menu$1182)
	movff	(_rebuild_input_menu$1183+1),(_rebuild_input_menu$1182+1)

	goto	l8957
	
l8955:; BSR set to: 0

		movlw	low(STR_154)
	movwf	((_rebuild_input_menu$1182))&0ffh
	movlw	high(STR_154)
	movwf	((_rebuild_input_menu$1182+1))&0ffh

	
l8957:; BSR set to: 0

		movlw	low(_value_rlylow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlylow)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1182),(c:strcpy@from)
	movff	(_rebuild_input_menu$1182+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	692
	
l8959:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfss	status,2
	goto	u11661
	goto	u11660
u11661:
	goto	l9007
u11660:
	line	694
	
l8961:; BSR set to: 0

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
	goto	u11671
	goto	u11670
u11671:
	goto	l8965
u11670:
	
l8963:; BSR set to: 0

		movlw	low(STR_158)
	movwf	((_rebuild_input_menu$1187))&0ffh
	movlw	high(STR_158)
	movwf	((_rebuild_input_menu$1187+1))&0ffh

	goto	l8967
	
l8965:; BSR set to: 0

		movlw	low(STR_157)
	movwf	((_rebuild_input_menu$1187))&0ffh
	movlw	high(STR_157)
	movwf	((_rebuild_input_menu$1187+1))&0ffh

	
l8967:; BSR set to: 0

		movlw	low(_value_flow_units)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_units)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1187),(c:strcpy@from)
	movff	(_rebuild_input_menu$1187+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	695
	
l8969:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_159)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_159)
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
	line	696
	
l8971:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_160)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_160)
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
	line	697
	
l8973:
		movlw	low(_value_low_flow)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_161)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_161)
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
	line	700
	
l8975:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2308)
	movff	1+?___lwdiv,(_rebuild_input_menu$2308+1)
	
l8977:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2309)
	movff	1+?___lwmod,(_rebuild_input_menu$2309+1)
	
l8979:
		movlw	low(_value_low_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_162)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_162)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2308),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2308+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2309),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2309+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	703
	
l8981:
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
	line	706
	
l8983:
		movlw	low(_value_enable)
	movlb	2	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	707
	
l8985:; BSR set to: 2

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	708
	
l8987:; BSR set to: 2

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	709
	
l8989:; BSR set to: 2

		movlw	low(_value_flow_units)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_flow_units)
	movwf	(1+(_input_menu+011h))&0ffh

	line	710
	
l8991:; BSR set to: 2

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+016h))&0ffh

	line	711
	
l8993:; BSR set to: 2

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	712
	
l8995:; BSR set to: 2

		movlw	low(_value_low_flow)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_flow)
	movwf	(1+(_input_menu+020h))&0ffh

	line	713
	
l8997:; BSR set to: 2

		movlw	low(_value_low_flow_bp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_low_flow_bp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	714
	
l8999:; BSR set to: 2

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	715
	
l9001:; BSR set to: 2

		movlw	low(_value_display)
	movwf	(0+(_input_menu+02Fh))&0ffh
	clrf	(1+(_input_menu+02Fh))&0ffh

	line	716
	
l9003:; BSR set to: 2

		movlw	low(_value_back)
	movwf	(0+(_input_menu+034h))&0ffh
	clrf	(1+(_input_menu+034h))&0ffh

	line	718
	
l9005:; BSR set to: 2

	movlw	low(0Bh)
	movlb	1	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	719
	goto	l9035
	line	722
	
l9007:; BSR set to: 0

		movlw	low(_value_no_flow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_no_flow)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_163)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_163)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	725
	
l9009:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2308)
	movff	1+?___lwdiv,(_rebuild_input_menu$2308+1)
	
l9011:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2309)
	movff	1+?___lwmod,(_rebuild_input_menu$2309+1)
	
l9013:
		movlw	low(_value_no_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_no_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_164)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_164)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2308),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2308+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2309),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2309+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	728
	
l9015:
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
	line	731
	
l9017:
		movlw	low(_value_enable)
	movlb	2	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	732
	
l9019:; BSR set to: 2

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	733
	
l9021:; BSR set to: 2

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	734
	
l9023:; BSR set to: 2

		movlw	low(_value_no_flow)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_no_flow)
	movwf	(1+(_input_menu+011h))&0ffh

	line	735
	
l9025:; BSR set to: 2

		movlw	low(_value_no_flow_bp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_no_flow_bp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	736
	
l9027:; BSR set to: 2

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	737
	
l9029:; BSR set to: 2

		movlw	low(_value_display)
	movwf	(0+(_input_menu+020h))&0ffh
	clrf	(1+(_input_menu+020h))&0ffh

	line	738
	
l9031:; BSR set to: 2

		movlw	low(_value_back)
	movwf	(0+(_input_menu+025h))&0ffh
	clrf	(1+(_input_menu+025h))&0ffh

	line	740
	
l9033:; BSR set to: 2

	movlw	low(08h)
	movlb	1	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	747
	
l9035:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_165)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_165)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(rebuild_input_menu@sensor),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(rebuild_input_menu@flow_type_val),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	748
	
l9037:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	749
	
l668:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_input_menu
	__end_of_rebuild_input_menu:
	signat	_rebuild_input_menu,4217
	global	_menu_update_time_value

;; *************** function _menu_update_time_value *****************
;; Defined at:
;;		line 487 in file "src\menu.c"
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
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0     110       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0     110       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      110 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		___lbdiv
;;		___lbmod
;;		_is_time_field
;;		_lcd_print
;;		_lcd_set_cursor
;;		_sprintf
;;		_uart_println
;; This function is called by:
;;		_main
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2,group=0
	line	487
global __ptext11
__ptext11:
psect	text11
	file	"src\menu.c"
	line	487
	
_menu_update_time_value:
;incstack = 0
	callstack 25
	line	490
	
l8491:
	movlb	1	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u11081
	goto	u11080

u11081:
	goto	l575
u11080:
	
l8493:; BSR set to: 1

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u11091
	goto	u11090
u11091:
	goto	l8495
u11090:
	goto	l575
	line	494
	
l8495:; BSR set to: 1

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_time_value@screen_line))&0ffh
	line	495
		movlw	03h-1
	cpfsgt	((menu_update_time_value@screen_line))&0ffh
	goto	u11101
	goto	u11100

u11101:
	goto	l576
u11100:
	goto	l575
	line	496
	
l576:; BSR set to: 0

	line	498
	movff	(_menu),(menu_update_time_value@item_idx)
	line	502
	
l8499:; BSR set to: 0

	movlb	1	; () banked
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
	line	503
	movlb	1	; () banked
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
	line	506
	
l8501:; BSR set to: 0

	movff	(menu_update_time_value@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_update_time_value@flow_type),(c:is_time_field@flow_type)
	movf	((menu_update_time_value@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfss	status,2
	goto	u11111
	goto	u11110
u11111:
	goto	l8505
u11110:
	goto	l575
	line	515
	
l8505:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_111)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_111)
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
	line	516
	
l8507:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	519
	
l8509:
	movlb	1	; () banked
	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u11121
	goto	u11120
u11121:
	goto	l8515
u11120:
	
l8511:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u11131
	goto	u11130
u11131:
	goto	l8515
u11130:
	line	521
	
l8513:; BSR set to: 1

	movlw	low(020h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	522
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	523
	goto	l8517
	line	526
	
l8515:; BSR set to: 1

	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	(0+(_menu+012h))&0ffh,w
	
	call	___lbdiv
	addlw	low(030h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	527
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	1	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	531
	
l8517:; BSR set to: 0

	movlw	low(03Ah)
	movwf	(0+(menu_update_time_value@value_buf+02h))&0ffh
	line	534
	
l8519:; BSR set to: 0

	movlb	1	; () banked
		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u11141
	goto	u11140

u11141:
	goto	l8525
u11140:
	
l8521:; BSR set to: 1

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u11151
	goto	u11150
u11151:
	goto	l8525
u11150:
	line	536
	
l8523:; BSR set to: 1

	movlw	low(020h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	537
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	538
	goto	l8527
	line	541
	
l8525:; BSR set to: 1

	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	(0+(_menu+013h))&0ffh,w
	
	call	___lbdiv
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	542
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	1	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	545
	
l8527:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(menu_update_time_value@value_buf+05h))&0ffh
	line	549
	
l8529:; BSR set to: 0

		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_112)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_112)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(menu_update_time_value@value_buf)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c

	call	_sprintf	;wreg free
	line	550
	
l8531:
		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	553
	
l8533:
	line	555
	
l8535:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	556
	
l8537:
		movlw	low(STR_113)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_113)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	558
	
l8539:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	559
	
l8541:
		movlw	low(STR_114)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_114)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	560
	
l8543:
		movlw	low(menu_update_time_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	561
	
l8545:
		movlw	low(STR_115)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_115)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	562
	
l575:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_time_value
	__end_of_menu_update_time_value:
	signat	_menu_update_time_value,89
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
;;		On entry : 3F/1
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
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
global __ptext12
__ptext12:
psect	text12
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
	
___lbmod:
;incstack = 0
	callstack 27
	movwf	((c:___lbmod@dividend))^00h,c
	line	9
	
l5821:
	movlw	low(08h)
	movwf	((c:___lbmod@counter))^00h,c
	line	10
	movlw	low(0)
	movwf	((c:___lbmod@rem))^00h,c
	line	12
	
l5823:
	bcf	status,0
	rlcf	((c:___lbmod@dividend))^00h,c,w
	rlcf	((c:___lbmod@rem))^00h,c,w
	movwf	((c:___lbmod@rem))^00h,c
	line	13
	
l5825:
	bcf status,0
	rlcf	((c:___lbmod@dividend))^00h,c

	line	14
	
l5827:
		movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c,w
	btfss	status,0
	goto	u6541
	goto	u6540

u6541:
	goto	l5831
u6540:
	line	15
	
l5829:
	movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c
	line	16
	
l5831:
	decfsz	((c:___lbmod@counter))^00h,c
	
	goto	l5823
	line	17
	
l5833:
	movf	((c:___lbmod@rem))^00h,c,w
	line	18
	
l1683:
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
;;		On entry : 3F/1
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
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
global __ptext13
__ptext13:
psect	text13
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
	
___lbdiv:
;incstack = 0
	callstack 27
	movwf	((c:___lbdiv@dividend))^00h,c
	line	9
	
l5795:
	movlw	low(0)
	movwf	((c:___lbdiv@quotient))^00h,c
	line	10
	
l5797:
	movf	((c:___lbdiv@divisor))^00h,c,w
	btfsc	status,2
	goto	u6511
	goto	u6510
u6511:
	goto	l5817
u6510:
	line	11
	
l5799:
	movlw	low(01h)
	movwf	((c:___lbdiv@counter))^00h,c
	line	12
	goto	l5805
	line	13
	
l5801:
	bcf status,0
	rlcf	((c:___lbdiv@divisor))^00h,c

	line	14
	
l5803:
	incf	((c:___lbdiv@counter))^00h,c
	line	12
	
l5805:
	
	btfss	((c:___lbdiv@divisor))^00h,c,(7)&7
	goto	u6521
	goto	u6520
u6521:
	goto	l5801
u6520:
	line	17
	
l5807:
	bcf status,0
	rlcf	((c:___lbdiv@quotient))^00h,c

	line	18
		movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c,w
	btfss	status,0
	goto	u6531
	goto	u6530

u6531:
	goto	l5813
u6530:
	line	19
	
l5809:
	movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c
	line	20
	
l5811:
	bsf	(0+(0/8)+(c:___lbdiv@quotient))^00h,c,(0)&7
	line	22
	
l5813:
	bcf status,0
	rrcf	((c:___lbdiv@divisor))^00h,c

	line	23
	
l5815:
	decfsz	((c:___lbdiv@counter))^00h,c
	
	goto	l5807
	line	25
	
l5817:
	movf	((c:___lbdiv@quotient))^00h,c,w
	line	26
	
l1677:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
	signat	___lbdiv,8313
	global	_menu_draw_setup

;; *************** function _menu_draw_setup *****************
;; Defined at:
;;		line 1179 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  label           2   38[COMRAM] PTR const unsigned char 
;;		 -> STR_191(5), STR_190(6), STR_189(1), STR_188(1), 
;;		 -> STR_187(1), 
;;  sensor_name     2   41[COMRAM] PTR const unsigned char 
;;		 -> Fake(1), STR_194(5), STR_193(5), STR_192(9), 
;;  sensor          1   40[COMRAM] unsigned char 
;;  item_idx        1   43[COMRAM] unsigned char 
;;  i               1   44[COMRAM] unsigned char 
;;  setup_labels   10   24[COMRAM] PTR const unsigned char 
;;		 -> STR_191(5), STR_190(6), STR_189(1), STR_188(1), 
;;		 -> STR_187(1), 
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
;;      Locals:        21       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        21       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       21 bytes
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
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text14,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1179
global __ptext14
__ptext14:
psect	text14
	file	"src\menu.c"
	line	1179
	
_menu_draw_setup:
;incstack = 0
	callstack 23
	line	1184
	
l8665:
	call	_lcd_clear	;wreg free
	line	1185
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1186
	
l8667:
		movlw	low(STR_186)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_186)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1189
	
l8669:
	lfsr	2,(menu_draw_setup@F2636)
	lfsr	1,(menu_draw_setup@setup_labels)
	movlw	10-1
u11381:
	movff	plusw2,plusw1
	decf	wreg
	bc	u11381

	line	1192
	
l8671:
	movlw	low(0)
	movwf	((c:menu_draw_setup@i))^00h,c
	line	1194
	
l8677:
	movlb	1	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_setup@i))^00h,c,w
	movwf	((c:menu_draw_setup@item_idx))^00h,c
	line	1195
		movlw	05h-1
	cpfsgt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u11391
	goto	u11390

u11391:
	goto	l8681
u11390:
	goto	l902
	line	1198
	
l8681:; BSR set to: 1

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1201
	
l8683:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u11401
	goto	u11400

u11401:
	goto	l8717
u11400:
	line	1203
	
l8685:
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
	line	1205
	
l8687:
	movf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u11411
	goto	u11410
u11411:
	goto	l8695
u11410:
	
l8689:
		decf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u11421
	goto	u11420

u11421:
	goto	l8693
u11420:
	
l8691:
		movlw	low(STR_194)
	movwf	((c:_menu_draw_setup$1312))^00h,c
	movlw	high(STR_194)
	movwf	((c:_menu_draw_setup$1312+1))^00h,c

	goto	l892
	
l8693:
		movlw	low(STR_193)
	movwf	((c:_menu_draw_setup$1312))^00h,c
	movlw	high(STR_193)
	movwf	((c:_menu_draw_setup$1312+1))^00h,c

	
l892:
		movff	(c:_menu_draw_setup$1312),(c:menu_draw_setup@sensor_name)
	movff	(c:_menu_draw_setup$1312+1),(c:menu_draw_setup@sensor_name+1)

	goto	l888
	
l8695:
		movlw	low(STR_192)
	movwf	((c:menu_draw_setup@sensor_name))^00h,c
	movlw	high(STR_192)
	movwf	((c:menu_draw_setup@sensor_name+1))^00h,c

	
l888:
	line	1208
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	1	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u11431
	goto	u11430

u11431:
	goto	l8705
u11430:
	line	1211
	
l8697:; BSR set to: 1

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1212
	
l8699:
		movlw	low(STR_195)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_195)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1213
	
l8701:
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1214
	
l8703:
		movlw	low(STR_196)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_196)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1215
	goto	l8707
	line	1219
	
l8705:; BSR set to: 1

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1223
	
l8707:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1224
	
l8709:
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
	goto	u11441
	goto	u11440
u11441:
	goto	l8713
u11440:
	
l8711:
		movlw	low(STR_198)
	movwf	((c:_menu_draw_setup$1318))^00h,c
	movlw	high(STR_198)
	movwf	((c:_menu_draw_setup$1318+1))^00h,c

	goto	l8715
	
l8713:
		movlw	low(STR_197)
	movwf	((c:_menu_draw_setup$1318))^00h,c
	movlw	high(STR_197)
	movwf	((c:_menu_draw_setup$1318+1))^00h,c

	
l8715:
		movff	(c:_menu_draw_setup$1318),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1318+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1225
	goto	l8731
	line	1229
	
l8717:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_labels)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:menu_draw_setup@label)
	movff	postdec2,(c:menu_draw_setup@label+1)
	line	1231
	
l8719:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	1	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u11451
	goto	u11450

u11451:
	goto	l8729
u11450:
	line	1234
	
l8721:; BSR set to: 1

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1235
	
l8723:
		movlw	low(STR_199)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_199)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1236
	
l8725:
		movff	(c:menu_draw_setup@label),(c:lcd_print@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1237
	
l8727:
		movlw	low(STR_200)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_200)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1238
	goto	l8731
	line	1242
	
l8729:; BSR set to: 1

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@label),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1192
	
l8731:
	incf	((c:menu_draw_setup@i))^00h,c
	
l8733:
		movlw	03h-1
	cpfsgt	((c:menu_draw_setup@i))^00h,c
	goto	u11461
	goto	u11460

u11461:
	goto	l8677
u11460:
	line	1246
	
l902:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_setup
	__end_of_menu_draw_setup:
	signat	_menu_draw_setup,89
	global	_menu_draw_options

;; *************** function _menu_draw_options *****************
;; Defined at:
;;		line 1020 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  item_index      1   24[COMRAM] unsigned char 
;;  i               1   25[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
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
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_lcd_clear
;;		_lcd_clear_line
;;		_lcd_print
;;		_lcd_print_at
;;		_lcd_set_cursor
;; This function is called by:
;;		_main
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2,group=0
	line	1020
global __ptext15
__ptext15:
psect	text15
	file	"src\menu.c"
	line	1020
	
_menu_draw_options:
;incstack = 0
	callstack 23
	line	1023
	
l8303:
	call	_lcd_clear	;wreg free
	line	1024
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1025
	
l8305:
		movlw	low(STR_176)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_176)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1028
	
l8307:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	line	1030
	
l8313:
	movlb	1	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_options@i))^00h,c,w
	movwf	((c:menu_draw_options@item_index))^00h,c
	line	1031
		movlw	05h-1
	cpfsgt	((c:menu_draw_options@item_index))^00h,c
	goto	u10701
	goto	u10700

u10701:
	goto	l8317
u10700:
	goto	l833
	line	1034
	
l8317:; BSR set to: 1

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1037
	
l8319:
	movf	((c:menu_draw_options@item_index))^00h,c,w
	movlb	1	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u10711
	goto	u10710

u10711:
	goto	l8329
u10710:
	line	1039
	
l8321:; BSR set to: 1

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1040
	
l8323:
		movlw	low(STR_177)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_177)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1041
	
l8325:
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
	line	1042
	
l8327:
		movlw	low(STR_178)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_178)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1043
	goto	l8331
	line	1047
	
l8329:; BSR set to: 1

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
	line	1028
	
l8331:
	incf	((c:menu_draw_options@i))^00h,c
	
l8333:
		movlw	03h-1
	cpfsgt	((c:menu_draw_options@i))^00h,c
	goto	u10721
	goto	u10720

u10721:
	goto	l8313
u10720:
	line	1050
	
l833:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_options
	__end_of_menu_draw_options:
	signat	_menu_draw_options,89
	global	_lcd_clear

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 168 in file "src\main.c"
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
;;		_menu_draw_options
;;		_menu_draw_setup
;; This function uses a non-reentrant model
;;
psect	text16,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	168
global __ptext16
__ptext16:
psect	text16
	file	"src\main.c"
	line	168
	
_lcd_clear:
;incstack = 0
	callstack 24
	line	170
	
l8035:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	171
	
l8037:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u13887:
decfsz	wreg,f
	bra	u13887
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u13887
	nop2
asmopt pop

	line	172
	
l160:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
	signat	_lcd_clear,89
	global	_menu_draw_input

;; *************** function _menu_draw_input *****************
;; Defined at:
;;		line 1052 in file "src\menu.c"
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
;;		On entry : 0/1
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
psect	text17,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1052
global __ptext17
__ptext17:
psect	text17
	file	"src\menu.c"
	line	1052
	
_menu_draw_input:
;incstack = 0
	callstack 23
	line	1057
	
l8547:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1059
	
l8549:
		movlw	low(menu_draw_input@title)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_179)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_179)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(01h)
	movlb	1	; () banked
	addwf	((_current_input))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	1+(0+((c:?_sprintf)+04h))^00h,c
	movlw	high(01h)
	addwfc	1+(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1060
	
l8551:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@title)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1063
	
l8553:
	movlb	1	; () banked
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
	line	1064
	
l8555:; BSR set to: 0

	movlb	1	; () banked
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
	line	1067
	
l8557:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@i))&0ffh
	goto	l8661
	line	1069
	
l8559:; BSR set to: 0

	movlb	1	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_input@i))&0ffh,w
	movwf	((menu_draw_input@item_idx))&0ffh
	line	1070
	
l8561:; BSR set to: 0

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1073
	
l8563:
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
	line	1077
	
l8565:
	line	1079
	
l8567:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	1	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u11161
	goto	u11160

u11161:
	goto	l8617
u11160:
	line	1081
	
l8569:; BSR set to: 1

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u11171
	goto	u11170
u11171:
	goto	l8613
u11170:
	line	1083
	
l8571:; BSR set to: 1

	movlw	low(02h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	line	1086
	
l8573:; BSR set to: 0

	movff	(menu_draw_input@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_option_field@flow_type)
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u11181
	goto	u11180
u11181:
	goto	l8587
u11180:
	line	1088
	
l8575:
	movlb	1	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u11191
	goto	u11190
u11191:
	goto	l8589
u11190:
	line	1091
	
l8577:; BSR set to: 1

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts+1)
	line	1092
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag+1)
	line	1094
	
l8579:
	movlb	0	; () banked
	movf	((menu_draw_input@opts))&0ffh,w
iorwf	((menu_draw_input@opts+1))&0ffh,w
	btfsc	status,2
	goto	u11201
	goto	u11200

u11201:
	goto	l8587
u11200:
	
l8581:; BSR set to: 0

	movf	((menu_draw_input@flag))&0ffh,w
iorwf	((menu_draw_input@flag+1))&0ffh,w
	btfsc	status,2
	goto	u11211
	goto	u11210

u11211:
	goto	l8587
u11210:
	
l8583:; BSR set to: 0

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
	goto	u11221
	goto	u11220
u11221:
	goto	l8587
u11220:
	line	1096
	
l8585:; BSR set to: 0

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
	line	1097
	goto	l8621
	line	1100
	
l8587:
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
	goto	l8621
	line	1106
	
l8589:; BSR set to: 1

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts_1274)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts_1274+1)
	line	1107
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag_1278)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag_1278+1)
	line	1109
	
l8591:
	movlb	0	; () banked
	movf	((menu_draw_input@opts_1274))&0ffh,w
iorwf	((menu_draw_input@opts_1274+1))&0ffh,w
	btfsc	status,2
	goto	u11231
	goto	u11230

u11231:
	goto	l8609
u11230:
	
l8593:; BSR set to: 0

	movf	((menu_draw_input@flag_1278))&0ffh,w
iorwf	((menu_draw_input@flag_1278+1))&0ffh,w
	btfsc	status,2
	goto	u11241
	goto	u11240

u11241:
	goto	l8609
u11240:
	
l8595:; BSR set to: 0

	movff	(menu_draw_input@flag_1278),fsr2l
	movff	(menu_draw_input@flag_1278+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	01h
	addwf	((menu_draw_input@opts_1274))&0ffh,w
	movwf	(??_menu_draw_input+1+0)^00h,c
	movlw	0
	addwfc	((menu_draw_input@opts_1274+1))&0ffh,w
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
	goto	u11251
	goto	u11250
u11251:
	goto	l8609
u11250:
	line	1111
	
l8597:; BSR set to: 0

	movff	(menu_draw_input@flag_1278),fsr2l
	movff	(menu_draw_input@flag_1278+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movf	((??_menu_draw_input+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_input+1+0
	movff	prodh,??_menu_draw_input+1+0+1
	movf	(??_menu_draw_input+1+0)^00h,c,w
	addwf	((menu_draw_input@opts_1274))&0ffh,w
	movwf	(??_menu_draw_input+3+0)^00h,c
	movf	(??_menu_draw_input+1+1)^00h,c,w
	addwfc	((menu_draw_input@opts_1274+1))&0ffh,w
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
	line	1112
	
l8599:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j))&0ffh
	goto	l8605
	line	1113
	
l8601:; BSR set to: 0

	movf	((menu_draw_input@j))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1112
	
l8603:; BSR set to: 0

	incf	((menu_draw_input@j))&0ffh
	
l8605:; BSR set to: 0

		movf	((menu_draw_input@val_len))&0ffh,w
	subwf	((menu_draw_input@j))&0ffh,w
	btfss	status,0
	goto	u11261
	goto	u11260

u11261:
	goto	l8601
u11260:
	line	1114
	
l8607:; BSR set to: 0

	movf	((menu_draw_input@val_len))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1115
	goto	l8621
	line	1118
	
l8609:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_180)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_180)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l8621
	line	1131
	
l8613:; BSR set to: 1

	movlw	low(01h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l8587
	line	1138
	
l8617:; BSR set to: 1

	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l8587
	line	1143
	
l8621:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_1282))&0ffh
	line	1144
	
l8623:; BSR set to: 0

	movf	((menu_draw_input@val_len_1282))&0ffh,w
	btfsc	status,2
	goto	u11271
	goto	u11270
u11271:
	goto	l8659
u11270:
	
l8625:; BSR set to: 0

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
		movlw	low(STR_181)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_181)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u11281
	goto	u11280

u11281:
	goto	l8659
u11280:
	line	1147
	
l8627:
	movlb	1	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u11291
	goto	u11290
u11291:
	goto	l8635
u11290:
	
l8629:; BSR set to: 1

	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	1	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u11301
	goto	u11300

u11301:
	goto	l8635
u11300:
	line	1150
	
l8631:; BSR set to: 1

	movff	(menu_draw_input@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_numeric_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u11311
	goto	u11310
u11311:
	goto	l8659
u11310:
	
l8633:
	movff	(menu_draw_input@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_time_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u11321
	goto	u11320
u11321:
	goto	l8635
u11320:
	goto	l8659
	line	1157
	
l8635:
	movlb	0	; () banked
	movf	((menu_draw_input@show_brackets))&0ffh,w
	btfss	status,2
	goto	u11331
	goto	u11330
u11331:
	goto	l8639
u11330:
	line	1160
	
l8637:; BSR set to: 0

	movf	((menu_draw_input@val_len_1282))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	1161
	goto	l8659
	line	1165
	
l8639:; BSR set to: 0

	movf	((menu_draw_input@val_len_1282))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_input@start_pos))&0ffh
	line	1166
	
l8641:; BSR set to: 0

	movff	(menu_draw_input@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1169
	
l8643:
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u11341
	goto	u11340

u11341:
	goto	l8647
u11340:
	
l8645:; BSR set to: 0

		movlw	low(STR_183)
	movwf	((_menu_draw_input$1288))&0ffh
	movlw	high(STR_183)
	movwf	((_menu_draw_input$1288+1))&0ffh

	goto	l8649
	
l8647:; BSR set to: 0

		movlw	low(STR_182)
	movwf	((_menu_draw_input$1288))&0ffh
	movlw	high(STR_182)
	movwf	((_menu_draw_input$1288+1))&0ffh

	
l8649:; BSR set to: 0

		movff	(_menu_draw_input$1288),(c:lcd_print@str)
	movff	(_menu_draw_input$1288+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1171
	
l8651:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1173
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u11351
	goto	u11350

u11351:
	goto	l8655
u11350:
	
l8653:; BSR set to: 0

		movlw	low(STR_185)
	movwf	((_menu_draw_input$1292))&0ffh
	movlw	high(STR_185)
	movwf	((_menu_draw_input$1292+1))&0ffh

	goto	l8657
	
l8655:; BSR set to: 0

		movlw	low(STR_184)
	movwf	((_menu_draw_input$1292))&0ffh
	movlw	high(STR_184)
	movwf	((_menu_draw_input$1292+1))&0ffh

	
l8657:; BSR set to: 0

		movff	(_menu_draw_input$1292),(c:lcd_print@str)
	movff	(_menu_draw_input$1292+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1067
	
l8659:
	movlb	0	; () banked
	incf	((menu_draw_input@i))&0ffh
	
l8661:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_input@i))&0ffh
	goto	u11361
	goto	u11360

u11361:
	goto	l874
u11360:
	
l8663:; BSR set to: 0

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
	goto	u11371
	goto	u11370

u11371:
	goto	l8559
u11370:
	line	1177
	
l874:; BSR set to: 0

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
;;		 -> menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), STR_59(1), STR_58(1), 
;;		 -> STR_57(9), STR_56(6), STR_55(6), STR_54(1), 
;;		 -> STR_53(1), STR_52(1), STR_51(5), STR_50(5), 
;;		 -> STR_49(1), STR_48(1), STR_47(1), STR_46(4), 
;;		 -> STR_45(2), STR_44(1), STR_43(1), STR_42(1), 
;;		 -> STR_41(5), STR_40(4), STR_39(1), STR_38(1), 
;;		 -> STR_37(1), STR_36(8), STR_35(7), STR_34(1), 
;;		 -> STR_33(1), STR_32(5), STR_31(5), STR_30(9), 
;;		 -> STR_29(1), STR_28(1), STR_27(1), STR_26(8), 
;;		 -> STR_25(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   16[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), STR_59(1), STR_58(1), 
;;		 -> STR_57(9), STR_56(6), STR_55(6), STR_54(1), 
;;		 -> STR_53(1), STR_52(1), STR_51(5), STR_50(5), 
;;		 -> STR_49(1), STR_48(1), STR_47(1), STR_46(4), 
;;		 -> STR_45(2), STR_44(1), STR_43(1), STR_42(1), 
;;		 -> STR_41(5), STR_40(4), STR_39(1), STR_38(1), 
;;		 -> STR_37(1), STR_36(8), STR_35(7), STR_34(1), 
;;		 -> STR_33(1), STR_32(5), STR_31(5), STR_30(9), 
;;		 -> STR_29(1), STR_28(1), STR_27(1), STR_26(8), 
;;		 -> STR_25(9), 
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
;; This function uses a non-reentrant model
;;
psect	text18,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
global __ptext18
__ptext18:
psect	text18
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
	
_strlen:; BSR set to: 0

;incstack = 0
	callstack 27
	line	8
	
l8293:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l8297
	line	10
	
l8295:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l8297:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u10687
	tblrd	*
	
	movf	tablat,w
	bra	u10680
u10687:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u10680:
	iorlw	0
	btfss	status,2
	goto	u10691
	goto	u10690
u10691:
	goto	l8295
u10690:
	line	12
	
l8299:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l1973:
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
;;		 -> original_value(10), menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), NULL(0), 
;;  from            2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_180(6), menu_update_edit_value@value_buf(10), value_no_flow_bp(10), STR_163(4), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), STR_158(4), 
;;		 -> STR_157(2), value_flow_units(10), STR_156(9), STR_155(6), 
;;		 -> STR_154(6), value_rlylow(10), STR_153(5), STR_152(5), 
;;		 -> STR_151(8), STR_150(7), value_flow_type(10), STR_149(5), 
;;		 -> STR_148(5), STR_147(5), STR_146(9), STR_145(6), 
;;		 -> STR_144(6), value_high_tbp(10), value_high_temp(10), STR_139(5), 
;;		 -> value_back(5), STR_138(5), STR_137(5), value_display(10), 
;;		 -> STR_136(9), STR_135(6), STR_134(6), value_rlyslp(10), 
;;		 -> STR_133(9), STR_132(6), STR_131(6), value_rlyplp(10), 
;;		 -> STR_130(9), STR_129(6), STR_128(6), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), STR_120(9), 
;;		 -> value_sensor(12), value_enable(10), NULL(0), STR_59(1), 
;;		 -> STR_58(1), STR_57(9), STR_56(6), STR_55(6), 
;;		 -> STR_54(1), STR_53(1), STR_52(1), STR_51(5), 
;;		 -> STR_50(5), STR_49(1), STR_48(1), STR_47(1), 
;;		 -> STR_46(4), STR_45(2), STR_44(1), STR_43(1), 
;;		 -> STR_42(1), STR_41(5), STR_40(4), STR_39(1), 
;;		 -> STR_38(1), STR_37(1), STR_36(8), STR_35(7), 
;;		 -> STR_34(1), STR_33(1), STR_32(5), STR_31(5), 
;;		 -> STR_30(9), STR_29(1), STR_28(1), STR_27(1), 
;;		 -> STR_26(8), STR_25(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   18[COMRAM] PTR unsigned char 
;;		 -> original_value(10), menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), NULL(0), 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] PTR unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 0/1
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
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text19,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
global __ptext19
__ptext19:
psect	text19
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
	
_strcpy:
;incstack = 0
	callstack 27
	line	18
	
l8287:
		movff	(c:strcpy@to),(c:strcpy@cp)
	movff	(c:strcpy@to+1),(c:strcpy@cp+1)

	line	19
	goto	l8291
	line	20
	
l8289:
	infsnz	((c:strcpy@cp))^00h,c
	incf	((c:strcpy@cp+1))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l8291:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movff	(c:strcpy@cp),fsr2l
	movff	(c:strcpy@cp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u10667
	tblrd	*
	
	movf	tablat,w
	bra	u10660
u10667:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u10660:
	movwf	indf2
	movf	indf2,w
	btfss	status,2
	goto	u10671
	goto	u10670
u10671:
	goto	l8289
u10670:
	line	24
	
l1967:
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
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), NULL(0), 
;;  s2              2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_181(1), STR_59(1), STR_58(1), STR_57(9), 
;;		 -> STR_56(6), STR_55(6), STR_54(1), STR_53(1), 
;;		 -> STR_52(1), STR_51(5), STR_50(5), STR_49(1), 
;;		 -> STR_48(1), STR_47(1), STR_46(4), STR_45(2), 
;;		 -> STR_44(1), STR_43(1), STR_42(1), STR_41(5), 
;;		 -> STR_40(4), STR_39(1), STR_38(1), STR_37(1), 
;;		 -> STR_36(8), STR_35(7), STR_34(1), STR_33(1), 
;;		 -> STR_32(5), STR_31(5), STR_30(9), STR_29(1), 
;;		 -> STR_28(1), STR_27(1), STR_26(8), STR_25(9), 
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
psect	text20,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
global __ptext20
__ptext20:
psect	text20
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
	
_strcmp:
;incstack = 0
	callstack 26
	line	37
	
l5725:
	goto	l5729
	line	38
	
l5727:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l5729:
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
	goto	u6451
	goto	u6450
u6451:
	goto	l5733
u6450:
	
l5731:
	movff	(c:strcmp@s1),fsr2l
	movff	(c:strcmp@s1+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u6461
	goto	u6460
u6461:
	goto	l5727
u6460:
	line	41
	
l5733:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l1961:
	return	;funcret
	callstack 0
GLOBAL	__end_of_strcmp
	__end_of_strcmp:
	signat	_strcmp,8314
	global	_lcd_print_at

;; *************** function _lcd_print_at *****************
;; Defined at:
;;		line 568 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   20[COMRAM] unsigned char 
;;  str             2   21[COMRAM] PTR const unsigned char 
;;		 -> Fake(1), STR_194(5), STR_193(5), STR_192(9), 
;;		 -> STR_191(5), STR_190(6), STR_189(1), STR_188(1), 
;;		 -> STR_187(1), menu_draw_input@value_buf(15), menu_draw_input@title(10), STR_106(5), 
;;		 -> STR_105(8), STR_104(8), STR_103(12), STR_102(9), 
;;		 -> STR_101(11), STR_100(10), STR_99(6), STR_98(5), 
;;		 -> STR_97(7), STR_96(7), STR_95(5), STR_94(8), 
;;		 -> STR_93(8), STR_92(11), STR_91(8), STR_90(5), 
;;		 -> STR_89(7), STR_88(7), STR_87(5), STR_86(8), 
;;		 -> STR_85(9), STR_84(9), STR_83(10), STR_82(11), 
;;		 -> STR_81(10), STR_80(7), STR_79(7), STR_78(5), 
;;		 -> STR_77(8), STR_76(8), STR_75(8), STR_74(9), 
;;		 -> STR_73(6), STR_72(6), STR_71(13), STR_70(9), 
;;		 -> STR_69(12), STR_68(11), STR_67(10), STR_66(7), 
;;		 -> STR_65(7), STR_64(5), STR_63(6), STR_62(13), 
;;		 -> STR_61(11), STR_60(10), 
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
	line	568
global __ptext21
__ptext21:
psect	text21
	file	"src\menu.c"
	line	568
	
_lcd_print_at:
;incstack = 0
	callstack 23
	movwf	((c:lcd_print_at@row))^00h,c
	line	570
	
l8279:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	571
	
l8281:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	572
	
l586:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print_at
	__end_of_lcd_print_at:
	signat	_lcd_print_at,12409
	global	_lcd_clear_line

;; *************** function _lcd_clear_line *****************
;; Defined at:
;;		line 574 in file "src\menu.c"
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
	line	574
global __ptext22
__ptext22:
psect	text22
	file	"src\menu.c"
	line	574
	
_lcd_clear_line:
;incstack = 0
	callstack 23
	movwf	((c:lcd_clear_line@row))^00h,c
	line	576
	
l8283:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	577
	
l8285:
		movlw	low(STR_116)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_116)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	578
	
l589:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear_line
	__end_of_lcd_clear_line:
	signat	_lcd_clear_line,4217
	global	_lcd_set_cursor

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 174 in file "src\main.c"
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
;;		_menu_update_time_value
;;		_lcd_print_at
;;		_lcd_clear_line
;;		_menu_update_edit_value
;;		_menu_update_numeric_value
;;		_menu_draw_options
;;		_menu_draw_input
;;		_menu_draw_setup
;; This function uses a non-reentrant model
;;
psect	text23,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	174
global __ptext23
__ptext23:
psect	text23
	file	"src\main.c"
	line	174
	
_lcd_set_cursor:
;incstack = 0
	callstack 25
	movwf	((c:lcd_set_cursor@row))^00h,c
	line	177
	
l7961:
	goto	l7975
	line	180
	
l7963:
	movlw	low(080h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	181
	goto	l7977
	line	183
	
l7965:
	movlw	low(0C0h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	184
	goto	l7977
	line	186
	
l7967:
	movlw	low(094h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	187
	goto	l7977
	line	189
	
l7969:
	movlw	low(0D4h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	190
	goto	l7977
	line	177
	
l7975:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l7963
	xorlw	1^0	; case 1
	skipnz
	goto	l7965
	xorlw	2^1	; case 2
	skipnz
	goto	l7967
	xorlw	3^2	; case 3
	skipnz
	goto	l7969
	goto	l7963

	line	195
	
l7977:
	movf	((c:lcd_set_cursor@address))^00h,c,w
	addwf	((c:lcd_set_cursor@col))^00h,c,w
	
	call	_lcd_cmd
	line	196
	
l170:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
	signat	_lcd_set_cursor,8313
	global	_lcd_print

;; *************** function _lcd_print *****************
;; Defined at:
;;		line 160 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_200(2), STR_199(2), STR_198(2), STR_197(2), 
;;		 -> STR_196(2), STR_195(2), Fake(1), STR_194(5), 
;;		 -> STR_193(5), STR_192(9), STR_191(5), STR_190(6), 
;;		 -> STR_189(1), STR_188(1), STR_187(1), STR_186(21), 
;;		 -> STR_185(2), STR_184(2), STR_183(2), STR_182(2), 
;;		 -> menu_draw_input@value_buf(15), menu_draw_input@title(10), STR_178(2), STR_177(2), 
;;		 -> STR_176(21), STR_175(2), STR_174(2), STR_173(6), 
;;		 -> menu_update_numeric_value@value_buf(6), STR_172(2), STR_171(2), STR_170(7), 
;;		 -> menu_update_edit_value@display_buf(10), STR_116(21), STR_115(2), STR_114(2), 
;;		 -> STR_113(8), menu_update_time_value@value_buf(6), STR_106(5), STR_105(8), 
;;		 -> STR_104(8), STR_103(12), STR_102(9), STR_101(11), 
;;		 -> STR_100(10), STR_99(6), STR_98(5), STR_97(7), 
;;		 -> STR_96(7), STR_95(5), STR_94(8), STR_93(8), 
;;		 -> STR_92(11), STR_91(8), STR_90(5), STR_89(7), 
;;		 -> STR_88(7), STR_87(5), STR_86(8), STR_85(9), 
;;		 -> STR_84(9), STR_83(10), STR_82(11), STR_81(10), 
;;		 -> STR_80(7), STR_79(7), STR_78(5), STR_77(8), 
;;		 -> STR_76(8), STR_75(8), STR_74(9), STR_73(6), 
;;		 -> STR_72(6), STR_71(13), STR_70(9), STR_69(12), 
;;		 -> STR_68(11), STR_67(10), STR_66(7), STR_65(7), 
;;		 -> STR_64(5), STR_63(6), STR_62(13), STR_61(11), 
;;		 -> STR_60(10), STR_23(8), STR_22(12), STR_17(6), 
;;		 -> STR_16(12), STR_4(16), STR_3(13), 
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
;;		_menu_update_time_value
;;		_lcd_print_at
;;		_lcd_clear_line
;;		_menu_update_edit_value
;;		_menu_update_numeric_value
;;		_menu_draw_options
;;		_menu_draw_input
;;		_menu_draw_setup
;; This function uses a non-reentrant model
;;
psect	text24,class=CODE,space=0,reloc=2,group=0
	line	160
global __ptext24
__ptext24:
psect	text24
	file	"src\main.c"
	line	160
	
_lcd_print:
;incstack = 0
	callstack 25
	line	162
	
l7953:
	goto	l7959
	line	164
	
l7955:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u10117
	tblrd	*
	
	movf	tablat,w
	bra	u10110
u10117:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u10110:
	
	call	_lcd_data
	
l7957:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	162
	
l7959:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u10127
	tblrd	*
	
	movf	tablat,w
	bra	u10120
u10127:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u10120:
	iorlw	0
	btfss	status,2
	goto	u10131
	goto	u10130
u10131:
	goto	l7955
u10130:
	line	166
	
l157:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print
	__end_of_lcd_print:
	signat	_lcd_print,4217
	global	_lcd_data

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 152 in file "src\main.c"
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
	line	152
global __ptext25
__ptext25:
psect	text25
	file	"src\main.c"
	line	152
	
_lcd_data:
;incstack = 0
	callstack 25
	movwf	((c:lcd_data@data))^00h,c
	line	154
	
l7947:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	155
	
l7949:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	156
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	157
	
l7951:
	asmopt push
asmopt off
	movlw	133
u13897:
decfsz	wreg,f
	bra	u13897
	nop
asmopt pop

	line	158
	
l151:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
	signat	_lcd_data,4217
	global	_is_time_field

;; *************** function _is_time_field *****************
;; Defined at:
;;		line 211 in file "src\menu.c"
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
;;		_main
;;		_menu_update_time_value
;;		_menu_draw_input
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text26,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	211
global __ptext26
__ptext26:
psect	text26
	file	"src\menu.c"
	line	211
	
_is_time_field:
;incstack = 0
	callstack 27
	movwf	((c:is_time_field@line))^00h,c
	line	213
	
l5373:
	movf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u5691
	goto	u5690
u5691:
	goto	l5389
u5690:
	line	216
	
l5375:
	movlw	low(01h)
	movwf	((c:_is_time_field$1048))^00h,c
	
l5377:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u5701
	goto	u5700

u5701:
	goto	l464
u5700:
	
l5379:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u5711
	goto	u5710

u5711:
	goto	l464
u5710:
	
l5381:
		movlw	8
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u5721
	goto	u5720

u5721:
	goto	l464
u5720:
	
l5383:
	movlw	low(0)
	movwf	((c:_is_time_field$1048))^00h,c
	
l464:
	movf	((c:_is_time_field$1048))^00h,c,w
	goto	l465
	line	218
	
l5389:
		decf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u5731
	goto	u5730

u5731:
	goto	l5397
u5730:
	line	221
	
l5391:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u5741
	goto	u5740

u5741:
	movlw	1
	goto	u5750
u5740:
	movlw	0
u5750:
	goto	l465
	line	223
	
l5397:
		movlw	2
	xorwf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u5761
	goto	u5760

u5761:
	goto	l5411
u5760:
	line	225
	
l5399:
	movf	((c:is_time_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u5771
	goto	u5770
u5771:
	goto	l5407
u5770:
	line	228
	
l5401:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u5781
	goto	u5780

u5781:
	movlw	1
	goto	u5790
u5780:
	movlw	0
u5790:
	goto	l465
	line	233
	
l5407:
		movlw	4
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u5801
	goto	u5800

u5801:
	movlw	1
	goto	u5810
u5800:
	movlw	0
u5810:
	goto	l465
	line	237
	
l5411:
	movlw	(0)&0ffh
	line	238
	
l465:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_time_field
	__end_of_is_time_field:
	signat	_is_time_field,12409
	global	_is_option_field

;; *************** function _is_option_field *****************
;; Defined at:
;;		line 243 in file "src\menu.c"
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
;;		On entry : 3E/1
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
psect	text27,class=CODE,space=0,reloc=2,group=0
	line	243
global __ptext27
__ptext27:
psect	text27
	file	"src\menu.c"
	line	243
	
_is_option_field:
;incstack = 0
	callstack 26
	movwf	((c:is_option_field@line))^00h,c
	line	246
	
l5415:
	movf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u5821
	goto	u5820
u5821:
	goto	l5419
u5820:
	
l5417:
		decf	((c:is_option_field@line))^00h,c,w
	btfss	status,2
	goto	u5831
	goto	u5830

u5831:
	goto	l5423
u5830:
	line	247
	
l5419:
	movlw	(01h)&0ffh
	goto	l477
	line	249
	
l5423:
	movf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u5841
	goto	u5840
u5841:
	goto	l5441
u5840:
	line	252
	
l5425:
	movlw	low(01h)
	movwf	((c:_is_option_field$1053))^00h,c
	
l5427:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u5851
	goto	u5850

u5851:
	goto	l480
u5850:
	
l5429:
		movlw	10
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u5861
	goto	u5860

u5861:
	goto	l480
u5860:
	
l5431:
		movlw	11
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u5871
	goto	u5870

u5871:
	goto	l480
u5870:
	
l5433:
		movlw	12
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u5881
	goto	u5880

u5881:
	goto	l480
u5880:
	
l5435:
	movlw	low(0)
	movwf	((c:_is_option_field$1053))^00h,c
	
l480:
	movf	((c:_is_option_field$1053))^00h,c,w
	goto	l477
	line	254
	
l5441:
		decf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u5891
	goto	u5890

u5891:
	goto	l5455
u5890:
	line	257
	
l5443:
	movlw	low(01h)
	movwf	((c:_is_option_field$1054))^00h,c
	
l5445:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u5901
	goto	u5900

u5901:
	goto	l484
u5900:
	
l5447:
		movlw	7
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u5911
	goto	u5910

u5911:
	goto	l484
u5910:
	
l5449:
	movlw	low(0)
	movwf	((c:_is_option_field$1054))^00h,c
	
l484:
	movf	((c:_is_option_field$1054))^00h,c,w
	goto	l477
	line	259
	
l5455:
		movlw	2
	xorwf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u5921
	goto	u5920

u5921:
	goto	l5489
u5920:
	line	261
	
l5457:
	movf	((c:is_option_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u5931
	goto	u5930
u5931:
	goto	l5475
u5930:
	line	264
	
l5459:
	movlw	low(01h)
	movwf	((c:_is_option_field$1055))^00h,c
	
l5461:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u5941
	goto	u5940

u5941:
	goto	l489
u5940:
	
l5463:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u5951
	goto	u5950

u5951:
	goto	l489
u5950:
	
l5465:
		movlw	8
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u5961
	goto	u5960

u5961:
	goto	l489
u5960:
	
l5467:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u5971
	goto	u5970

u5971:
	goto	l489
u5970:
	
l5469:
	movlw	low(0)
	movwf	((c:_is_option_field$1055))^00h,c
	
l489:
	movf	((c:_is_option_field$1055))^00h,c,w
	goto	l477
	line	269
	
l5475:
	movlw	low(01h)
	movwf	((c:_is_option_field$1056))^00h,c
	
l5477:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u5981
	goto	u5980

u5981:
	goto	l492
u5980:
	
l5479:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u5991
	goto	u5990

u5991:
	goto	l492
u5990:
	
l5481:
		movlw	5
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6001
	goto	u6000

u6001:
	goto	l492
u6000:
	
l5483:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6011
	goto	u6010

u6011:
	goto	l492
u6010:
	
l5485:
	movlw	low(0)
	movwf	((c:_is_option_field$1056))^00h,c
	
l492:
	movf	((c:_is_option_field$1056))^00h,c,w
	goto	l477
	line	273
	
l5489:
	movlw	(0)&0ffh
	line	274
	
l477:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_option_field
	__end_of_is_option_field:
	signat	_is_option_field,12409
	global	_is_numeric_field

;; *************** function _is_numeric_field *****************
;; Defined at:
;;		line 179 in file "src\menu.c"
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
;;		On entry : 3E/1
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
psect	text28,class=CODE,space=0,reloc=2,group=0
	line	179
global __ptext28
__ptext28:
psect	text28
	file	"src\menu.c"
	line	179
	
_is_numeric_field:
;incstack = 0
	callstack 27
	movwf	((c:is_numeric_field@line))^00h,c
	line	181
	
l8219:
	movf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u10521
	goto	u10520
u10521:
	goto	l8237
u10520:
	line	184
	
l8221:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1041))^00h,c
	
l8223:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u10531
	goto	u10530

u10531:
	goto	l448
u10530:
	
l8225:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u10541
	goto	u10540

u10541:
	goto	l448
u10540:
	
l8227:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u10551
	goto	u10550

u10551:
	goto	l448
u10550:
	
l8229:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u10561
	goto	u10560

u10561:
	goto	l448
u10560:
	
l8231:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1041))^00h,c
	
l448:
	movf	((c:_is_numeric_field$1041))^00h,c,w
	goto	l449
	line	186
	
l8237:
		decf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u10571
	goto	u10570

u10571:
	goto	l8253
u10570:
	line	189
	
l8239:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1042))^00h,c
	
l8241:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u10581
	goto	u10580

u10581:
	goto	l453
u10580:
	
l8243:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u10591
	goto	u10590

u10591:
	goto	l453
u10590:
	
l8245:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u10601
	goto	u10600

u10601:
	goto	l453
u10600:
	
l8247:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1042))^00h,c
	
l453:
	movf	((c:_is_numeric_field$1042))^00h,c,w
	goto	l449
	line	191
	
l8253:
		movlw	2
	xorwf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u10611
	goto	u10610

u10611:
	goto	l8271
u10610:
	line	193
	
l8255:
	movf	((c:is_numeric_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u10621
	goto	u10620
u10621:
	goto	l8271
u10620:
	line	196
	
l8257:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1043))^00h,c
	
l8259:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u10631
	goto	u10630

u10631:
	goto	l458
u10630:
	
l8261:
		movlw	5
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u10641
	goto	u10640

u10641:
	goto	l458
u10640:
	
l8263:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u10651
	goto	u10650

u10651:
	goto	l458
u10650:
	
l8265:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1043))^00h,c
	
l458:
	movf	((c:_is_numeric_field$1043))^00h,c,w
	goto	l449
	line	201
	
l8271:
	movlw	(0)&0ffh
	line	206
	
l449:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_numeric_field
	__end_of_is_numeric_field:
	signat	_is_numeric_field,12409
	global	_get_option_edit_flag

;; *************** function _get_option_edit_flag *****************
;; Defined at:
;;		line 280 in file "src\menu.c"
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
;;		On entry : 3E/1
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
psect	text29,class=CODE,space=0,reloc=2,group=0
	line	280
global __ptext29
__ptext29:
psect	text29
	file	"src\menu.c"
	line	280
	
_get_option_edit_flag:
;incstack = 0
	callstack 26
	movwf	((c:get_option_edit_flag@line))^00h,c
	line	283
	
l5493:
	movf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6021
	goto	u6020
u6021:
	goto	l5499
u6020:
	line	284
	
l5495:
		movlw	low(_enable_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l496
	line	285
	
l5499:
		decf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6031
	goto	u6030

u6031:
	goto	l5505
u6030:
	line	286
	
l5501:
		movlw	low(_sensor_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l496
	line	289
	
l5505:
	movf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6041
	goto	u6040
u6041:
	goto	l5531
u6040:
	line	291
	
l5507:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6051
	goto	u6050

u6051:
	goto	l5513
u6050:
	line	292
	
l5509:
		movlw	low(_relay_high_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l496
	line	293
	
l5513:
		movlw	10
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6061
	goto	u6060

u6061:
	goto	l5519
u6060:
	line	294
	
l5515:
		movlw	low(_relay_plp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l496
	line	295
	
l5519:
		movlw	11
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6071
	goto	u6070

u6071:
	goto	l5525
u6070:
	line	296
	
l5521:
		movlw	low(_relay_slp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l496
	line	297
	
l5525:
		movlw	12
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6081
	goto	u6080

u6081:
	goto	l5591
u6080:
	line	298
	
l5527:
		movlw	low(_display_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l496
	line	301
	
l5531:
		decf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6091
	goto	u6090

u6091:
	goto	l5545
u6090:
	line	303
	
l5533:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6101
	goto	u6100

u6101:
	goto	l5539
u6100:
	goto	l5509
	line	305
	
l5539:
		movlw	7
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6111
	goto	u6110

u6111:
	goto	l5591
u6110:
	goto	l5527
	line	309
	
l5545:
		movlw	2
	xorwf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6121
	goto	u6120

u6121:
	goto	l5591
u6120:
	line	311
	
l5547:
		movlw	2
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6131
	goto	u6130

u6131:
	goto	l5553
u6130:
	line	312
	
l5549:
		movlw	low(_flow_type_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l496
	line	314
	
l5553:
	movf	((c:get_option_edit_flag@flow_type))^00h,c,w
	btfss	status,2
	goto	u6141
	goto	u6140
u6141:
	goto	l5573
u6140:
	line	316
	
l5555:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6151
	goto	u6150

u6151:
	goto	l5561
u6150:
	line	317
	
l5557:
		movlw	low(_flow_units_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l496
	line	318
	
l5561:
		movlw	8
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6161
	goto	u6160

u6161:
	goto	l5567
u6160:
	line	319
	
l5563:
		movlw	low(_relay_low_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l496
	line	320
	
l5567:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6171
	goto	u6170

u6171:
	goto	l5591
u6170:
	goto	l5527
	line	325
	
l5573:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6181
	goto	u6180

u6181:
	goto	l5579
u6180:
	line	326
	
l5575:
		movlw	low(_no_flow_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l496
	line	327
	
l5579:
		movlw	5
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6191
	goto	u6190

u6191:
	goto	l5585
u6190:
	goto	l5563
	line	329
	
l5585:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6201
	goto	u6200

u6201:
	goto	l5591
u6200:
	goto	l5527
	line	334
	
l5591:
		movlw	low(0)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(0)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	line	335
	
l496:
	return	;funcret
	callstack 0
GLOBAL	__end_of_get_option_edit_flag
	__end_of_get_option_edit_flag:
	signat	_get_option_edit_flag,12410
	global	_get_item_options_for_field

;; *************** function _get_item_options_for_field *****************
;; Defined at:
;;		line 341 in file "src\menu.c"
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
;;		On entry : 3E/1
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
psect	text30,class=CODE,space=0,reloc=2,group=0
	line	341
global __ptext30
__ptext30:
psect	text30
	file	"src\menu.c"
	line	341
	
_get_item_options_for_field:
;incstack = 0
	callstack 26
	movwf	((c:get_item_options_for_field@line))^00h,c
	line	344
	
l5595:
	movf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6211
	goto	u6210
u6211:
	goto	l5601
u6210:
	line	345
	
l5597:
		movlw	low(_menu_item_options)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l521
	line	346
	
l5601:
		decf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6221
	goto	u6220

u6221:
	goto	l5607
u6220:
	line	347
	
l5603:
		movlw	low(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l521
	line	350
	
l5607:
	movf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6231
	goto	u6230
u6231:
	goto	l5625
u6230:
	line	352
	
l5609:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u6241
	goto	u6240

u6241:
	goto	l5615
u6240:
	
l5611:
		movlw	10
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u6251
	goto	u6250

u6251:
	goto	l5615
u6250:
	
l5613:
		movlw	11
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6261
	goto	u6260

u6261:
	goto	l5619
u6260:
	line	353
	
l5615:
		movlw	low(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l521
	line	354
	
l5619:
		movlw	12
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6271
	goto	u6270

u6271:
	goto	l5685
u6270:
	line	355
	
l5621:
		movlw	low(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l521
	line	358
	
l5625:
		decf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6281
	goto	u6280

u6281:
	goto	l5639
u6280:
	line	360
	
l5627:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6291
	goto	u6290

u6291:
	goto	l5633
u6290:
	goto	l5615
	line	362
	
l5633:
		movlw	7
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6301
	goto	u6300

u6301:
	goto	l5685
u6300:
	goto	l5621
	line	366
	
l5639:
		movlw	2
	xorwf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6311
	goto	u6310

u6311:
	goto	l5685
u6310:
	line	368
	
l5641:
		movlw	2
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6321
	goto	u6320

u6321:
	goto	l5647
u6320:
	line	369
	
l5643:
		movlw	low(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l521
	line	371
	
l5647:
	movf	((c:get_item_options_for_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u6331
	goto	u6330
u6331:
	goto	l5667
u6330:
	line	373
	
l5649:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6341
	goto	u6340

u6341:
	goto	l5655
u6340:
	line	374
	
l5651:
		movlw	low(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l521
	line	375
	
l5655:
		movlw	8
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6351
	goto	u6350

u6351:
	goto	l5661
u6350:
	goto	l5615
	line	377
	
l5661:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6361
	goto	u6360

u6361:
	goto	l5685
u6360:
	goto	l5621
	line	382
	
l5667:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6371
	goto	u6370

u6371:
	goto	l5673
u6370:
	line	383
	
l5669:
		movlw	low(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l521
	line	384
	
l5673:
		movlw	5
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6381
	goto	u6380

u6381:
	goto	l5679
u6380:
	goto	l5615
	line	386
	
l5679:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6391
	goto	u6390

u6391:
	goto	l5685
u6390:
	goto	l5621
	line	391
	
l5685:
		movlw	low(0)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(0)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	line	392
	
l521:
	return	;funcret
	callstack 0
GLOBAL	__end_of_get_item_options_for_field
	__end_of_get_item_options_for_field:
	signat	_get_item_options_for_field,12410
	global	_init_time_editor

;; *************** function _init_time_editor *****************
;; Defined at:
;;		line 401 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  value_second    2   57[COMRAM] unsigned int 
;;  mode            1   59[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  buf            60    0[BANK0 ] unsigned char [60]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/1
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
psect	text31,class=CODE,space=0,reloc=2,group=0
	line	401
global __ptext31
__ptext31:
psect	text31
	file	"src\menu.c"
	line	401
	
_init_time_editor:
;incstack = 0
	callstack 24
	line	404
	
l8735:
	movff	(c:init_time_editor@mode),0+(_menu+010h)
	line	405
	movff	(c:init_time_editor@value_seconds),0+(_menu+014h)
	movff	(c:init_time_editor@value_seconds+1),1+(_menu+014h)
	line	408
	
l8737:
	movf	((c:init_time_editor@mode))^00h,c,w
	btfss	status,2
	goto	u11471
	goto	u11470
u11471:
	goto	l8741
u11470:
	line	410
	
l8739:
	movff	(c:init_time_editor@value_seconds),(c:___lwdiv@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	movlb	1	; () banked
	movwf	(0+(_menu+012h))&0ffh
	line	411
	movff	(c:init_time_editor@value_seconds),(c:___lwmod@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	movlb	1	; () banked
	movwf	(0+(_menu+013h))&0ffh
	line	412
	goto	l8743
	line	415
	
l8741:
	movff	(c:init_time_editor@value_seconds),(c:___lwdiv@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwdiv@dividend+1)
	movlw	high(0E10h)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(0E10h)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	movlb	1	; () banked
	movwf	(0+(_menu+012h))&0ffh
	line	416
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
	movlb	1	; () banked
	movwf	(0+(_menu+013h))&0ffh
	line	420
	
l8743:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+011h))&0ffh
	line	425
	
l8745:; BSR set to: 1

		movlw	low(init_time_editor@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_107)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_107)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:init_time_editor@value_seconds),0+((c:?_sprintf)+04h)
	movff	(c:init_time_editor@value_seconds+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+012h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	426
	
l8747:
		movlw	low(init_time_editor@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	427
	
l547:
	return	;funcret
	callstack 0
GLOBAL	__end_of_init_time_editor
	__end_of_init_time_editor:
	signat	_init_time_editor,8313
	global	_uart_println

;; *************** function _uart_println *****************
;; Defined at:
;;		line 79 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   17[COMRAM] PTR const unsigned char 
;;		 -> menu_handle_button@buf_1368(50), STR_203(27), menu_handle_button@buf(50), handle_numeric_rotation@buf(50), 
;;		 -> STR_166(31), rebuild_input_menu@buf(50), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), STR_108(29), init_time_editor@buf(60), STR_24(36), 
;;		 -> STR_21(33), STR_20(21), STR_19(20), STR_18(22), 
;;		 -> STR_15(26), STR_14(15), STR_13(20), main@buf_623(30), 
;;		 -> main@buf(40), STR_10(19), STR_9(22), STR_8(22), 
;;		 -> STR_7(24), STR_6(19), STR_5(22), STR_2(23), 
;;		 -> STR_1(28), 
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
;;		_init_time_editor
;;		_handle_time_rotation
;;		_menu_update_time_value
;;		_rebuild_input_menu
;;		_handle_numeric_rotation
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text32,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	79
global __ptext32
__ptext32:
psect	text32
	file	"src\main.c"
	line	79
	
_uart_println:
;incstack = 0
	callstack 26
	line	81
	
l5123:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	82
	
l5125:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	83
	
l5127:
	movlw	(0Ah)&0ffh
	
	call	_uart_write
	line	84
	
l124:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_println
	__end_of_uart_println:
	signat	_uart_println,4217
	global	_uart_print

;; *************** function _uart_print *****************
;; Defined at:
;;		line 71 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   15[COMRAM] PTR const unsigned char 
;;		 -> menu_handle_button@buf_1368(50), STR_203(27), menu_handle_button@buf(50), handle_numeric_rotation@buf(50), 
;;		 -> STR_166(31), rebuild_input_menu@buf(50), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), STR_108(29), init_time_editor@buf(60), STR_24(36), 
;;		 -> STR_21(33), STR_20(21), STR_19(20), STR_18(22), 
;;		 -> STR_15(26), STR_14(15), STR_13(20), main@buf_623(30), 
;;		 -> main@buf(40), STR_10(19), STR_9(22), STR_8(22), 
;;		 -> STR_7(24), STR_6(19), STR_5(22), STR_2(23), 
;;		 -> STR_1(28), 
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
psect	text33,class=CODE,space=0,reloc=2,group=0
	line	71
global __ptext33
__ptext33:
psect	text33
	file	"src\main.c"
	line	71
	
_uart_print:
;incstack = 0
	callstack 26
	line	73
	
l5027:
	goto	l5033
	line	75
	
l5029:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5107
	tblrd	*
	
	movf	tablat,w
	bra	u5100
u5107:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5100:
	
	call	_uart_write
	
l5031:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	73
	
l5033:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5117
	tblrd	*
	
	movf	tablat,w
	bra	u5110
u5117:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5110:
	iorlw	0
	btfss	status,2
	goto	u5121
	goto	u5120
u5121:
	goto	l5029
u5120:
	line	77
	
l121:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_print
	__end_of_uart_print:
	signat	_uart_print,4217
	global	_uart_write

;; *************** function _uart_write *****************
;; Defined at:
;;		line 64 in file "src\main.c"
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
psect	text34,class=CODE,space=0,reloc=2,group=0
	line	64
global __ptext34
__ptext34:
psect	text34
	file	"src\main.c"
	line	64
	
_uart_write:
;incstack = 0
	callstack 27
	movwf	((c:uart_write@c))^00h,c
	line	66
	
l5005:
	line	67
	
l112:
	line	66
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u5071
	goto	u5070
u5071:
	goto	l112
u5070:
	line	68
	
l5007:
	movff	(c:uart_write@c),(c:4013)	;volatile
	line	69
	
l115:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_write
	__end_of_uart_write:
	signat	_uart_write,4217
	global	_sprintf

;; *************** function _sprintf *****************
;; Defined at:
;;		line 505 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              2   26[COMRAM] PTR unsigned char 
;;		 -> menu_handle_button@buf_1368(50), menu_handle_button@buf(50), menu_draw_input@title(10), menu_update_edit_value@value_buf(10), 
;;		 -> handle_numeric_rotation@buf(50), rebuild_input_menu@buf(50), value_no_flow_bp(10), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), value_rlylow(10), 
;;		 -> value_flow_type(10), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), handle_time_rotation@buf(50), 
;;		 -> init_time_editor@buf(60), NULL(0), main@buf_623(30), main@buf(40), 
;;  f               2   28[COMRAM] PTR const unsigned char 
;;		 -> STR_214(38), STR_213(5), STR_212(6), STR_211(6), 
;;		 -> STR_210(5), STR_209(6), STR_208(6), STR_207(5), 
;;		 -> STR_206(5), STR_205(6), STR_204(6), STR_202(10), 
;;		 -> STR_201(26), STR_179(9), STR_169(9), STR_168(7), 
;;		 -> STR_167(29), STR_165(48), STR_164(10), STR_162(10), 
;;		 -> STR_161(5), STR_160(6), STR_159(6), STR_143(10), 
;;		 -> STR_142(3), STR_141(6), STR_140(6), STR_127(10), 
;;		 -> STR_126(10), STR_125(5), STR_124(10), STR_123(5), 
;;		 -> STR_122(6), STR_121(6), STR_117(3), STR_112(27), 
;;		 -> STR_111(51), STR_110(25), STR_109(45), STR_107(35), 
;;		 -> STR_12(17), STR_11(23), 
;; Auto vars:     Size  Location     Type
;;  tmpval          4    0        struct .
;;  width           2   54[COMRAM] int 
;;  len             2   51[COMRAM] unsigned int 
;;  val             2   49[COMRAM] unsigned int 
;;  cp              2   46[COMRAM] PTR const unsigned char 
;;		 -> STR_215(7), sprintf@c(1), ?_sprintf(2), STR_119(9), 
;;		 -> STR_118(8), menu_update_time_value@value_buf(6), 
;;  c               1   56[COMRAM] unsigned char 
;;  flag            1   53[COMRAM] unsigned char 
;;  ap              1   48[COMRAM] PTR void [1]
;;		 -> ?_sprintf(2), 
;;  prec            1   45[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  2   26[COMRAM] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:        12       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        16       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        31       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       31 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		___lwdiv
;;		___lwmod
;;		___wmul
;;		_isdigit
;; This function is called by:
;;		_main
;;		_init_time_editor
;;		_handle_time_rotation
;;		_menu_update_time_value
;;		_rebuild_input_menu
;;		_handle_numeric_rotation
;;		_menu_update_edit_value
;;		_menu_draw_input
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text35,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
global __ptext35
__ptext35:
psect	text35
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
	
_sprintf:
;incstack = 0
	callstack 27
	line	550
	
l8039:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l8213
	line	555
	
l8041:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u10221
	goto	u10220

u10221:
	goto	l8047
u10220:
	line	558
	
l8043:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l8045:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l8213
	line	563
	
l8047:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	565
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	goto	l8057
	line	578
	
l8049:
	bsf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	579
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	580
	goto	l8057
	line	585
	
l8051:
	bsf	(0+(1/8)+(c:sprintf@flag))^00h,c,(1)&7
	line	586
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	587
	goto	l8057
	line	597
	
l8053:
	bsf	(0+(2/8)+(c:sprintf@flag))^00h,c,(2)&7
	line	598
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	568
	
l8057:
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
	goto	l8049
	xorlw	43^32	; case 43
	skipnz
	goto	l8051
	xorlw	48^43	; case 48
	skipnz
	goto	l8053
	goto	l1220

	line	603
	
l1220:
	line	606
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u10231
	goto	u10230
u10231:
	goto	l8061
u10230:
	line	607
	
l8059:
	bcf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	614
	
l8061:
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
	goto	u10241
	goto	u10240
u10241:
	goto	l8117
u10240:
	line	615
	
l8063:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	617
	
l8065:
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
	
l8067:
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

	
l8069:
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	619
	
l8071:
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
	goto	u10251
	goto	u10250
u10251:
	goto	l8065
u10250:
	goto	l8117
	line	760
	
l8073:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l8075:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l8077:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u10261
	goto	u10260

u10261:
	goto	l8081
u10260:
	line	767
	
l8079:
		movlw	low(STR_215)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_215)
	movwf	((c:sprintf@cp+1))^00h,c

	line	771
	
l8081:
	movlw	high(0)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@len))^00h,c
	line	772
	goto	l8085
	line	773
	
l8083:
	infsnz	((c:sprintf@len))^00h,c
	incf	((c:sprintf@len+1))^00h,c
	line	772
	
l8085:
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
	bra	u10277
	tblrd	*
	
	movf	tablat,w
	bra	u10270
u10277:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u10270:
	iorlw	0
	btfss	status,2
	goto	u10281
	goto	u10280
u10281:
	goto	l8083
u10280:
	line	783
	
l8087:
		movf	((c:sprintf@width))^00h,c,w
	subwf	((c:sprintf@len))^00h,c,w
	movf	((c:sprintf@width+1))^00h,c,w
	subwfb	((c:sprintf@len+1))^00h,c,w
	btfsc	status,0
	goto	u10291
	goto	u10290

u10291:
	goto	l8091
u10290:
	line	784
	
l8089:
	movf	((c:sprintf@len))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	subwfb	((c:sprintf@width+1))^00h,c

	goto	l8097
	line	786
	
l8091:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	goto	l8097
	line	791
	
l8093:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l8095:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	790
	
l8097:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
		incf	((c:sprintf@width))^00h,c,w
	bnz	u10301
	incf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u10301
	goto	u10300

u10301:
	goto	l8093
u10300:
	goto	l8105
	line	794
	
l8099:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u10317
	tblrd	*
	
	movf	tablat,w
	bra	u10310
u10317:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u10310:
	movwf	indf2
	
l8101:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l8103:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	793
	
l8105:
	decf	((c:sprintf@len))^00h,c
	btfss	status,0
	decf	((c:sprintf@len+1))^00h,c
		incf	((c:sprintf@len))^00h,c,w
	bnz	u10321
	incf	((c:sprintf@len+1))^00h,c,w
	btfss	status,2
	goto	u10321
	goto	u10320

u10321:
	goto	l8099
u10320:
	goto	l8213
	line	825
	
l8107:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:sprintf@c))^00h,c
	
l8109:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	831
	
l8111:
		movlw	low(sprintf@c)
	movwf	((c:sprintf@cp))^00h,c
	clrf	((c:sprintf@cp+1))^00h,c

	line	832
	
l8113:
	movlw	high(01h)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(01h)
	movwf	((c:sprintf@len))^00h,c
	line	833
	goto	l8087
	line	661
	
l8117:
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
; Number of cases is 5, Range of values is 0 to 115
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l8215
	xorlw	99^0	; case 99
	skipnz
	goto	l8107
	xorlw	100^99	; case 100
	skipnz
	goto	l8119
	xorlw	105^100	; case 105
	skipnz
	goto	l8119
	xorlw	115^105	; case 115
	skipnz
	goto	l8073
	goto	l8111

	line	1285
	
l8119:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l8121:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l8123:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u10330
	goto	u10331

u10331:
	goto	l8129
u10330:
	line	1288
	
l8125:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l8127:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	line	1331
	
l8129:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l8131:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u10341
	goto	u10340

u10341:
	goto	l8135
u10340:
	goto	l8143
	line	1332
	
l8135:
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
	goto	u10351
	goto	u10350

u10351:
	goto	l8139
u10350:
	goto	l8143
	line	1331
	
l8139:
	incf	((c:sprintf@c))^00h,c
	goto	l8131
	line	1371
	
l8143:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u10361
	goto	u10360

u10361:
	goto	l8149
u10360:
	
l8145:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u10371
	goto	u10370
u10371:
	goto	l8149
u10370:
	line	1372
	
l8147:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	line	1407
	
l8149:
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
	goto	u10381
	goto	u10380

u10381:
	goto	l8153
u10380:
	line	1408
	
l8151:
	movf	((c:sprintf@c))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movlw	0
	subwfb	((c:sprintf@width+1))^00h,c
	goto	l8155
	line	1410
	
l8153:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	1413
	
l8155:
	
	btfss	((c:sprintf@flag))^00h,c,(2)&7
	goto	u10391
	goto	u10390
u10391:
	goto	l8181
u10390:
	line	1415
	
l8157:
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u10401
	goto	u10400
u10401:
	goto	l1255
u10400:
	line	1416
	
l8159:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u10411
	goto	u10410
u10411:
	goto	l8163
u10410:
	
l8161:
	movlw	high(02Bh)
	movwf	((c:_sprintf$1616+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$1616))^00h,c
	goto	l8165
	
l8163:
	movlw	high(02Dh)
	movwf	((c:_sprintf$1616+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$1616))^00h,c
	
l8165:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$1616),indf2

	
l8167:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l8173
	line	1422
	
l1255:
	line	1425
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u10421
	goto	u10420
u10421:
	goto	l8173
u10420:
	line	1426
	
l8169:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l8167
	line	1441
	
l8173:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u10431
	goto	u10430

u10431:
	goto	l8203
u10430:
	line	1443
	
l8175:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(030h)
	movwf	indf2
	
l8177:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1444
	
l8179:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u10441
	goto	u10440

u10441:
	goto	l8175
u10440:
	goto	l8203
	line	1454
	
l8181:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u10451
	goto	u10450

u10451:
	goto	l1266
u10450:
	line	1456
	
l8183:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l8185:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1457
	
l8187:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u10461
	goto	u10460

u10461:
	goto	l8183
u10460:
	
l1266:
	line	1460
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u10471
	goto	u10470
u10471:
	goto	l1269
u10470:
	line	1461
	
l8189:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u10481
	goto	u10480
u10481:
	goto	l8193
u10480:
	
l8191:
	movlw	high(02Bh)
	movwf	((c:_sprintf$1617+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$1617))^00h,c
	goto	l8195
	
l8193:
	movlw	high(02Dh)
	movwf	((c:_sprintf$1617+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$1617))^00h,c
	
l8195:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$1617),indf2

	
l8197:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l8203
	line	1469
	
l1269:
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u10491
	goto	u10490
u10491:
	goto	l8203
u10490:
	line	1470
	
l8199:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l8197
	line	1498
	
l8203:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l8211
	line	1515
	
l8205:
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
	
l8207:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l8209:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l8211:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u10501
	goto	u10500

u10501:
	goto	l8205
u10500:
	line	553
	
l8213:
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
	goto	u10511
	goto	u10510
u10511:
	goto	l8041
u10510:
	line	1564
	
l8215:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	clrf	indf2
	line	1567
	
l1280:
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
;;		On entry : 0/1
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
psect	text36,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
global __ptext36
__ptext36:
psect	text36
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
	
_isdigit:
;incstack = 0
	callstack 27
	movwf	((c:isdigit@c))^00h,c
	line	14
	
l7979:
	movlw	low(0)
	movwf	((c:_isdigit$2057))^00h,c
	
l7981:
		movlw	03Ah-0
	cpfslt	((c:isdigit@c))^00h,c
	goto	u10141
	goto	u10140

u10141:
	goto	l7987
u10140:
	
l7983:
		movlw	030h-1
	cpfsgt	((c:isdigit@c))^00h,c
	goto	u10151
	goto	u10150

u10151:
	goto	l7987
u10150:
	
l7985:
	movlw	low(01h)
	movwf	((c:_isdigit$2057))^00h,c
	
l7987:
	movff	(c:_isdigit$2057),??_isdigit+0+0
	rrcf	(??_isdigit+0+0)^00h,c,w
	line	15
	
l1947:
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
;;		_main
;;		_menu_handle_button
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text37,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
global __ptext37
__ptext37:
psect	text37
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
	
___wmul:
;incstack = 0
	callstack 27
	line	37
	
l7991:
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
	
l7993:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	line	53
	
l1283:
	return	;funcret
	callstack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	_init_numeric_editor

;; *************** function _init_numeric_editor *****************
;; Defined at:
;;		line 755 in file "src\menu.c"
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
;;		On entry : 0/1
;;		On exit  : 3F/1
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
psect	text38,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	755
global __ptext38
__ptext38:
psect	text38
	file	"src\menu.c"
	line	755
	
_init_numeric_editor:
;incstack = 0
	callstack 26
	line	759
	
l9039:
	movlb	1	; () banked
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
	line	760
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
	line	763
	
l9041:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_menu+0Fh))&0ffh
	line	765
	
l9043:; BSR set to: 1

	movf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u11681
	goto	u11680
u11681:
	goto	l9051
u11680:
	line	768
	
l9045:; BSR set to: 1

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u11691
	goto	u11690

u11691:
	goto	l9049
u11690:
	
l9047:; BSR set to: 1

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u11701
	goto	u11700

u11701:
	goto	l9065
u11700:
	line	769
	
l9049:; BSR set to: 1

	movlw	low(01h)
	movwf	(0+(_menu+0Fh))&0ffh
	goto	l9065
	line	771
	
l9051:; BSR set to: 1

		decf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u11711
	goto	u11710

u11711:
	goto	l9057
u11710:
	line	774
	
l9053:; BSR set to: 1

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u11721
	goto	u11720

u11721:
	goto	l9065
u11720:
	goto	l9049
	line	777
	
l9057:; BSR set to: 1

		movlw	2
	xorwf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u11731
	goto	u11730

u11731:
	goto	l9065
u11730:
	
l9059:; BSR set to: 1

	movf	((c:init_numeric_editor@flow_type))^00h,c,w
	btfss	status,2
	goto	u11741
	goto	u11740
u11741:
	goto	l9065
u11740:
	line	780
	
l9061:; BSR set to: 1

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u11751
	goto	u11750

u11751:
	goto	l9065
u11750:
	goto	l9049
	line	785
	
l9065:; BSR set to: 1

	movff	(c:init_numeric_editor@value),0+(_menu+0Dh)
	movff	(c:init_numeric_editor@value+1),1+(_menu+0Dh)
	line	788
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u11761
	goto	u11760
u11761:
	goto	l683
u11760:
	
l9067:; BSR set to: 1

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u11770
	goto	u11771

u11771:
	goto	l683
u11770:
	line	789
	
l9069:; BSR set to: 1

	movlw	high(0)
	movwf	((c:init_numeric_editor@value+1))^00h,c
	movlw	low(0)
	movwf	((c:init_numeric_editor@value))^00h,c
	
l683:; BSR set to: 1

	line	792
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u11781
	goto	u11780
u11781:
	goto	l9073
u11780:
	
l9071:; BSR set to: 1

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u11791
	goto	u11790

u11791:
	movlw	1
	goto	u11800
u11790:
	movlw	0
u11800:
	movwf	((c:_init_numeric_editor$1201))^00h,c
	clrf	((c:_init_numeric_editor$1201+1))^00h,c
	goto	l9075
	
l9073:; BSR set to: 1

	movlw	high(0)
	movwf	((c:_init_numeric_editor$1201+1))^00h,c
	movlw	low(0)
	movwf	((c:_init_numeric_editor$1201))^00h,c
	
l9075:; BSR set to: 1

	movff	(c:_init_numeric_editor$1201),0+(_menu+09h)
	line	795
	
l9077:; BSR set to: 1

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u11811
	goto	u11810

u11811:
	goto	l689
u11810:
	
l9079:; BSR set to: 1

	movff	(c:init_numeric_editor@value),(c:init_numeric_editor@abs_val)
	movff	(c:init_numeric_editor@value+1),(c:init_numeric_editor@abs_val+1)
	goto	l9081
	
l689:; BSR set to: 1

	movff	(c:init_numeric_editor@value),??_init_numeric_editor+0+0
	movff	(c:init_numeric_editor@value+1),??_init_numeric_editor+0+0+1
	comf	(??_init_numeric_editor+0+0)^00h,c
	comf	(??_init_numeric_editor+0+1)^00h,c
	infsnz	(??_init_numeric_editor+0+0)^00h,c
	incf	(??_init_numeric_editor+0+1)^00h,c
	movff	??_init_numeric_editor+0+0,(c:init_numeric_editor@abs_val)
	movff	??_init_numeric_editor+0+1,(c:init_numeric_editor@abs_val+1)
	line	796
	
l9081:; BSR set to: 1

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
	movlb	1	; () banked
	movwf	(0+(_menu+0Ah))&0ffh
	line	797
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
	movlb	1	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	line	798
	movff	(c:init_numeric_editor@abs_val),(c:___lwmod@dividend)
	movff	(c:init_numeric_editor@abs_val+1),(c:___lwmod@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	movlb	1	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	line	801
	
l9083:; BSR set to: 1

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u11821
	goto	u11820
u11821:
	movlw	1
	goto	u11830
u11820:
	movlw	0
u11830:
	movwf	(0+(_menu+08h))&0ffh
	line	802
	
l692:; BSR set to: 1

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
psect	text39,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext39
__ptext39:
psect	text39
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
___lwmod:; BSR set to: 1

;incstack = 0
	callstack 27
	line	12
	
l8019:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u10191
	goto	u10190

u10191:
	goto	l1772
u10190:
	line	13
	
l8021:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l8025
	line	15
	
l8023:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l8025:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u10201
	goto	u10200
u10201:
	goto	l8023
u10200:
	line	19
	
l8027:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u10211
	goto	u10210

u10211:
	goto	l8031
u10210:
	line	20
	
l8029:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l8031:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l8033:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l8027
	line	23
	
l1772:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l1779:
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
psect	text40,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
global __ptext40
__ptext40:
psect	text40
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
	
___lwdiv:
;incstack = 0
	callstack 27
	line	13
	
l7997:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l7999:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u10161
	goto	u10160

u10161:
	goto	l1762
u10160:
	line	15
	
l8001:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l8005
	line	17
	
l8003:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l8005:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u10171
	goto	u10170
u10171:
	goto	l8003
u10170:
	line	21
	
l8007:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l8009:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u10181
	goto	u10180

u10181:
	goto	l8015
u10180:
	line	23
	
l8011:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l8013:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l8015:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l8017:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l8007
	line	28
	
l1762:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l1769:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_get_current_numeric_value

;; *************** function _get_current_numeric_value *****************
;; Defined at:
;;		line 804 in file "src\menu.c"
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
psect	text41,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	804
global __ptext41
__ptext41:
psect	text41
	file	"src\menu.c"
	line	804
	
_get_current_numeric_value:
;incstack = 0
	callstack 27
	line	806
	
l6645:; BSR set to: 1

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
	line	807
	
l6647:; BSR set to: 1

	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u7711
	goto	u7710
u7711:
	goto	l6651
u7710:
	line	808
	
l6649:; BSR set to: 1

	negf	((c:get_current_numeric_value@value))^00h,c
	comf	((c:get_current_numeric_value@value+1))^00h,c
	btfsc	status,0
	incf	((c:get_current_numeric_value@value+1))^00h,c
	line	809
	
l6651:; BSR set to: 1

	movff	(c:get_current_numeric_value@value),(c:?_get_current_numeric_value)
	movff	(c:get_current_numeric_value@value+1),(c:?_get_current_numeric_value+1)
	line	810
	
l696:; BSR set to: 1

	return	;funcret
	callstack 0
GLOBAL	__end_of_get_current_numeric_value
	__end_of_get_current_numeric_value:
	signat	_get_current_numeric_value,90
	global	_beep

;; *************** function _beep *****************
;; Defined at:
;;		line 236 in file "src\main.c"
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
psect	text42,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	236
global __ptext42
__ptext42:
psect	text42
	file	"src\main.c"
	line	236
	
_beep:; BSR set to: 1

;incstack = 0
	callstack 27
	line	238
	
l5837:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	239
	
l5839:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l176
	line	241
	
l5841:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u13907:
decfsz	wreg,f
	bra	u13907
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u13907
	nop2
asmopt pop

	line	239
	
l5843:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l176:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u6551
	goto	u6550

u6551:
	goto	l5841
u6550:
	
l178:
	line	243
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	244
	
l179:
	return	;funcret
	callstack 0
GLOBAL	__end_of_beep
	__end_of_beep:
	signat	_beep,4217
	global	_lcd_init

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 198 in file "src\main.c"
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
psect	text43,class=CODE,space=0,reloc=2,group=0
	line	198
global __ptext43
__ptext43:
psect	text43
	file	"src\main.c"
	line	198
	
_lcd_init:
;incstack = 0
	callstack 26
	line	201
	
l9085:; BSR set to: 1

	movlw	low(010h)
	movwf	((c:3986))^0f00h,c	;volatile
	line	202
	movlw	low(046h)
	movwf	((c:3987))^0f00h,c	;volatile
	line	203
	movlw	low(0)
	movwf	((c:3988))^0f00h,c	;volatile
	line	206
	movlw	low(0)
	movwf	((c:3968))^0f00h,c	;volatile
	line	207
	movlw	low(0)
	movwf	((c:3969))^0f00h,c	;volatile
	line	208
	movlw	low(0)
	movwf	((c:3970))^0f00h,c	;volatile
	line	210
	
l9087:; BSR set to: 1

	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u13917:
decfsz	wreg,f
	bra	u13917
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u13917
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u13917
	nop
asmopt pop

	line	212
	
l9089:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	215
	
l9091:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	216
	
l9093:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u13927:
decfsz	wreg,f
	bra	u13927
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u13927
asmopt pop

	line	217
	
l9095:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	218
	
l9097:
	asmopt push
asmopt off
	movlw	240
u13937:
	nop2
decfsz	wreg,f
	bra	u13937
asmopt pop

	line	219
	
l9099:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	220
	
l9101:
	asmopt push
asmopt off
	movlw	240
u13947:
	nop2
decfsz	wreg,f
	bra	u13947
asmopt pop

	line	223
	
l9103:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	224
	
l9105:
	asmopt push
asmopt off
	movlw	240
u13957:
	nop2
decfsz	wreg,f
	bra	u13957
asmopt pop

	line	227
	
l9107:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	228
	
l9109:
	movlw	(08h)&0ffh
	
	call	_lcd_cmd
	line	229
	
l9111:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	230
	
l9113:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_init+0+0)^00h,c
	movlw	198
u13967:
decfsz	wreg,f
	bra	u13967
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u13967
	nop2
asmopt pop

	line	231
	
l9115:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	232
	
l9117:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	233
	
l173:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
	signat	_lcd_init,89
	global	_lcd_cmd

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 136 in file "src\main.c"
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
psect	text44,class=CODE,space=0,reloc=2,group=0
	line	136
global __ptext44
__ptext44:
psect	text44
	file	"src\main.c"
	line	136
	
_lcd_cmd:
;incstack = 0
	callstack 25
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	138
	
l7935:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	139
	
l7937:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	140
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	142
	
l7939:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u10091
	goto	u10090

u10091:
	goto	l7943
u10090:
	
l7941:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u10101
	goto	u10100

u10101:
	goto	l7945
u10100:
	line	144
	
l7943:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u13977:
decfsz	wreg,f
	bra	u13977
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u13977
	nop2
asmopt pop

	line	145
	goto	l148
	line	148
	
l7945:
	asmopt push
asmopt off
	movlw	133
u13987:
decfsz	wreg,f
	bra	u13987
	nop
asmopt pop

	line	150
	
l148:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
	signat	_lcd_cmd,4217
	global	_lcd_write_nibble

;; *************** function _lcd_write_nibble *****************
;; Defined at:
;;		line 111 in file "src\main.c"
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
psect	text45,class=CODE,space=0,reloc=2,group=0
	line	111
global __ptext45
__ptext45:
psect	text45
	file	"src\main.c"
	line	111
	
_lcd_write_nibble:
;incstack = 0
	callstack 25
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	113
	
l7917:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u10051
	goto	u10050
u10051:
	goto	l133
u10050:
	line	114
	
l7919:
	bsf	((c:3977))^0f00h,c,0	;volatile
	goto	l7921
	line	115
	
l133:
	line	116
	bcf	((c:3977))^0f00h,c,0	;volatile
	line	117
	
l7921:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u10061
	goto	u10060
u10061:
	goto	l135
u10060:
	line	118
	
l7923:
	bsf	((c:3977))^0f00h,c,1	;volatile
	goto	l7925
	line	119
	
l135:
	line	120
	bcf	((c:3977))^0f00h,c,1	;volatile
	line	121
	
l7925:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u10071
	goto	u10070
u10071:
	goto	l137
u10070:
	line	122
	
l7927:
	bsf	((c:3977))^0f00h,c,2	;volatile
	goto	l7929
	line	123
	
l137:
	line	124
	bcf	((c:3977))^0f00h,c,2	;volatile
	line	125
	
l7929:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u10081
	goto	u10080
u10081:
	goto	l139
u10080:
	line	126
	
l7931:
	bsf	((c:3977))^0f00h,c,3	;volatile
	goto	l140
	line	127
	
l139:
	line	128
	bcf	((c:3977))^0f00h,c,3	;volatile
	
l140:
	line	130
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	131
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	132
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	133
	
l7933:
	asmopt push
asmopt off
	movlw	133
u13997:
decfsz	wreg,f
	bra	u13997
	nop
asmopt pop

	line	134
	
l141:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_write_nibble
	__end_of_lcd_write_nibble:
	signat	_lcd_write_nibble,4217
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
psect	text46,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	260
global __ptext46
__ptext46:
psect	text46
	file	"src\eeprom.c"
	line	260
	
_get_menu_timeout_seconds:
;incstack = 0
	callstack 28
	line	263
	
l6763:; BSR set to: 3

		movlw	05h-0
	cpfslt	(0+(_system_config+01h))&0ffh
	goto	u7781
	goto	u7780

u7781:
	goto	l6769
u7780:
	line	265
	
l6765:; BSR set to: 3

	movlw	(01Eh)&0ffh
	goto	l1198
	line	267
	
l6769:; BSR set to: 3

		movlw	079h-1
	cpfsgt	(0+(_system_config+01h))&0ffh
	goto	u7791
	goto	u7790

u7791:
	goto	l6775
u7790:
	goto	l6765
	line	271
	
l6775:; BSR set to: 3

	movf	(0+(_system_config+01h))&0ffh,w
	line	272
	
l1198:; BSR set to: 3

	return	;funcret
	callstack 0
GLOBAL	__end_of_get_menu_timeout_seconds
	__end_of_get_menu_timeout_seconds:
	signat	_get_menu_timeout_seconds,89
	global	_encoder_init

;; *************** function _encoder_init *****************
;; Defined at:
;;		line 169 in file "src\encoder.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
psect	text47,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	169
global __ptext47
__ptext47:
psect	text47
	file	"src\encoder.c"
	line	169
	
_encoder_init:; BSR set to: 3

;incstack = 0
	callstack 28
	line	172
	
l6779:
	movlw	low(0C4h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	173
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	176
	movlw	high(0)
	movlb	1	; () banked
	movwf	((_encoder_count+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_encoder_count))&0ffh	;volatile
	line	177
	movlw	low(0)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	178
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	179
	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	182
	
l6781:; BSR set to: 1

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	183
	
l6783:; BSR set to: 1

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	184
	
l6785:; BSR set to: 1

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	187
	
l6787:; BSR set to: 1

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u7801
	goto	u7800
u7801:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u7808
u7800:
	clrf	(??_encoder_init+0+0)^00h,c
u7808:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u7811
	goto	u7810
u7811:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u7818
u7810:
	clrf	(??_encoder_init+1+0)^00h,c
u7818:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:_enc_state))^00h,c
	line	188
	
l328:
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
psect	text48,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	180
global __ptext48
__ptext48:
psect	text48
	file	"src\eeprom.c"
	line	180
	
_eeprom_init:
;incstack = 0
	callstack 25
	line	182
	
l6729:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	185
	
l6731:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	189
	
l6737:
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
	
l6739:
	incf	((c:eeprom_init@i))^00h,c
	
l6741:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u7741
	goto	u7740

u7741:
	goto	l6737
u7740:
	line	191
	
l6743:
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
	
l6745:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	195
	
l6747:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u7750
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u7751
	goto	u7750

u7751:
	goto	l6753
u7750:
	line	198
	
l6749:
	call	_load_factory_defaults	;wreg free
	line	199
	
l6751:
	call	_save_current_config	;wreg free
	line	203
	
l6753:
	call	_sync_menu_variables	;wreg free
	line	207
	
l6755:
	movlb	3	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	mullw	02h
	movff	prodl,(c:_menu_timeout_seconds)
	movff	prodh,(c:_menu_timeout_seconds+1)
	line	210
	
l6757:; BSR set to: 3

		movf	((c:_menu_timeout_seconds+1))^00h,c,w
	bnz	u7760
	movlw	10
	subwf	 ((c:_menu_timeout_seconds))^00h,c,w
	btfss	status,0
	goto	u7761
	goto	u7760

u7761:
	goto	l6761
u7760:
	
l6759:; BSR set to: 3

		incf	((c:_menu_timeout_seconds))^00h,c,w
	movlw	1
	subwfb	((c:_menu_timeout_seconds+1))^00h,c,w
	btfss	status,0
	goto	u7771
	goto	u7770

u7771:
	goto	l1176
u7770:
	line	212
	
l6761:; BSR set to: 3

	movlw	high(01Eh)
	movwf	((c:_menu_timeout_seconds+1))^00h,c
	movlw	low(01Eh)
	movwf	((c:_menu_timeout_seconds))^00h,c
	line	214
	
l1176:; BSR set to: 3

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
psect	text49,class=CODE,space=0,reloc=2,group=0
	line	247
global __ptext49
__ptext49:
psect	text49
	file	"src\eeprom.c"
	line	247
	
_sync_menu_variables:; BSR set to: 3

;incstack = 0
	callstack 27
	line	256
	
l6673:
	movff	_input_config,(c:_enable_edit_flag)
	line	257
	movff	0+(_input_config+01h),(c:_sensor_edit_flag)
	line	258
	
l1194:
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
psect	text50,class=CODE,space=0,reloc=2,group=0
	line	216
global __ptext50
__ptext50:
psect	text50
	file	"src\eeprom.c"
	line	216
	
_save_current_config:
;incstack = 0
	callstack 26
	line	219
	
l6277:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	223
	
l6283:
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
	
l6285:
	incf	((c:save_current_config@i))^00h,c
	
l6287:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u7331
	goto	u7330

u7331:
	goto	l6283
u7330:
	line	227
	
l6289:
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
	
l6291:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	231
	
l6293:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	232
	
l1181:
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
psect	text51,class=CODE,space=0,reloc=2,group=0
	line	155
global __ptext51
__ptext51:
psect	text51
	file	"src\eeprom.c"
	line	155
	
_eeprom_write_word:
;incstack = 0
	callstack 26
	line	157
	
l5781:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	158
	
l5783:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	159
	
l1155:
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
psect	text52,class=CODE,space=0,reloc=2,group=0
	line	161
global __ptext52
__ptext52:
psect	text52
	file	"src\eeprom.c"
	line	161
	
_eeprom_write_block:
;incstack = 0
	callstack 26
	line	163
	
l5785:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	164
	
l5787:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l5793
	line	166
	
l5789:
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
	
l5791:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l5793:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u6501
	goto	u6500

u6501:
	goto	l5789
u6500:
	line	168
	
l1161:
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
psect	text53,class=CODE,space=0,reloc=2,group=0
	line	128
global __ptext53
__ptext53:
psect	text53
	file	"src\eeprom.c"
	line	128
	
_eeprom_write_byte:
;incstack = 0
	callstack 26
	line	130
	
l5061:
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
	
l5063:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	139
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	140
	
l5065:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	143
	
l1146:
	line	142
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u5161
	goto	u5160
u5161:
	goto	l1146
u5160:
	
l1148:
	line	144
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	145
	
l1149:
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
psect	text54,class=CODE,space=0,reloc=2,group=0
	line	92
global __ptext54
__ptext54:
psect	text54
	file	"src\eeprom.c"
	line	92
	
_calculate_config_checksum:
;incstack = 0
	callstack 27
	line	94
	
l5737:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	98
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	100
	
l5743:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	101
	
l5745:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	103
	
l5751:
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
	
l5753:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l5755:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u6470
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u6471
	goto	u6470

u6471:
	goto	l5751
u6470:
	line	98
	
l5757:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l5759:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u6481
	goto	u6480

u6481:
	goto	l5743
u6480:
	line	108
	
l5761:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	109
	
l5763:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1531+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1531))^00h,c
	line	111
	
l5769:
	movf	((c:calculate_config_checksum@j_1531))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j_1531+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	109
	
l5771:
	infsnz	((c:calculate_config_checksum@j_1531))^00h,c
	incf	((c:calculate_config_checksum@j_1531+1))^00h,c
	
l5773:
		movf	((c:calculate_config_checksum@j_1531+1))^00h,c,w
	bnz	u6490
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1531))^00h,c,w
	btfss	status,0
	goto	u6491
	goto	u6490

u6491:
	goto	l5769
u6490:
	
l1139:
	line	114
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	115
	
l1140:
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
psect	text55,class=CODE,space=0,reloc=2,group=0
	line	241
global __ptext55
__ptext55:
psect	text55
	file	"src\eeprom.c"
	line	241
	
_load_factory_defaults:
;incstack = 0
	callstack 26
	line	243
	
l6671:
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
	
l1187:
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
;;		 -> system_defaults(128), factory_defaults(384), flow_analog_template(55), flow_digital_template(40), 
;;		 -> temp_menu_template(45), pressure_menu_template(70), 
;;  n               2   18[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  s               2   22[COMRAM] PTR const unsigned char 
;;		 -> system_defaults(128), factory_defaults(384), flow_analog_template(55), flow_digital_template(40), 
;;		 -> temp_menu_template(45), pressure_menu_template(70), 
;;  d               2   20[COMRAM] PTR unsigned char 
;;		 -> system_config(128), input_menu(75), input_config(384), 
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
;;		_load_factory_defaults
;; This function uses a non-reentrant model
;;
psect	text56,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
global __ptext56
__ptext56:
psect	text56
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
	
_memcpy:
;incstack = 0
	callstack 26
	line	34
	
l5703:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l5713
	line	37
	
l5705:
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
	
l5707:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l5709:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l5711:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l5713:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u6421
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u6421
	goto	u6420

u6421:
	goto	l5705
u6420:
	line	41
	
l1953:
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
psect	text57,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	147
global __ptext57
__ptext57:
psect	text57
	file	"src\eeprom.c"
	line	147
	
_eeprom_read_word:
;incstack = 0
	callstack 26
	line	150
	
l6655:
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
	
l6657:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	153
	
l1152:
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
psect	text58,class=CODE,space=0,reloc=2,group=0
	line	170
global __ptext58
__ptext58:
psect	text58
	file	"src\eeprom.c"
	line	170
	
_eeprom_read_block:
;incstack = 0
	callstack 26
	line	172
	
l6661:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	173
	
l6663:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l6669
	line	175
	
l6665:
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
	
l6667:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l6669:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u7721
	goto	u7720

u7721:
	goto	l6665
u7720:
	line	177
	
l1167:
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
psect	text59,class=CODE,space=0,reloc=2,group=0
	line	118
global __ptext59
__ptext59:
psect	text59
	file	"src\eeprom.c"
	line	118
	
_eeprom_read_byte:
;incstack = 0
	callstack 26
	line	120
	
l5775:
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
	
l5777:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	126
	
l1143:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_read_byte
	__end_of_eeprom_read_byte:
	signat	_eeprom_read_byte,4217
	global	_isr

;; *************** function _isr *****************
;; Defined at:
;;		line 38 in file "src\encoder.c"
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
	line	38
	
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
	line	40
	
i2l7819:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u984_41
	goto	i2u984_40
i2u984_41:
	goto	i2l325
i2u984_40:
	line	43
	
i2l7821:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	44
	
i2l7823:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	47
	
i2l7825:
	incf	((c:_ms_counter))^00h,c	;volatile
	line	48
	
i2l7827:
		movlw	02h-1
	cpfsgt	((c:_ms_counter))^00h,c	;volatile
	goto	i2u985_41
	goto	i2u985_40

i2u985_41:
	goto	i2l7843
i2u985_40:
	line	50
	
i2l7829:
	movlw	low(0)
	movwf	((c:_ms_counter))^00h,c	;volatile
	line	51
	
i2l7831:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u986_41
	goto	i2u986_40

i2u986_41:
	goto	i2l7843
i2u986_40:
	line	53
	
i2l7833:
	decf	((c:_menu_timeout_timer))^00h,c	;volatile
	btfss	status,0
	decf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	line	56
	
i2l7835:
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
	goto	i2u987_41
	goto	i2u987_40

i2u987_41:
	goto	i2l7839
i2u987_40:
	line	59
	
i2l7837:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_timeout_debug_flag))&0ffh	;volatile
	line	62
	
i2l7839:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u988_41
	goto	i2u988_40

i2u988_41:
	goto	i2l7843
i2u988_40:
	line	64
	
i2l7841:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	70
	
i2l7843:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u989_41
	goto	i2u989_40
i2u989_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u989_48
i2u989_40:
	clrf	(??_isr+0+0)^00h,c
i2u989_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u990_41
	goto	i2u990_40
i2u990_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u990_48
i2u990_40:
	clrf	(??_isr+1+0)^00h,c
i2u990_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	71
	
i2l7845:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	74
	
i2l7847:
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
	line	77
	
i2l7849:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u991_41
	goto	i2u991_40
i2u991_41:
	goto	i2l7875
i2u991_40:
	line	79
	
i2l7851:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u992_41
	goto	i2u992_40

i2u992_41:
	goto	i2l7863
i2u992_40:
	line	81
	
i2l7853:
	movlb	1	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	82
	
i2l7855:; BSR set to: 1

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	85
	
i2l7857:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u993_41
	goto	i2u993_40

i2u993_41:
	goto	i2l7875
i2u993_40:
	line	87
	
i2l7859:; BSR set to: 1

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	88
	
i2l7861:; BSR set to: 1

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l7875
	line	91
	
i2l7863:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u994_41
	goto	i2u994_40

i2u994_41:
	goto	i2l7875
i2u994_40:
	line	93
	
i2l7865:
	movlb	1	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	line	94
	
i2l7867:; BSR set to: 1

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	97
	
i2l7869:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u995_41
	goto	i2u995_40

i2u995_41:
	goto	i2l310
i2u995_40:
	goto	i2l7859
	line	103
	
i2l310:; BSR set to: 1

	line	105
	
i2l7875:
	movff	(c:isr@new_state),(c:_enc_state)
	line	108
	
i2l7877:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	109
	
i2l7879:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u996_41
	goto	i2u996_40

i2u996_41:
	goto	i2l7907
i2u996_40:
	line	111
	
i2l7881:
	incf	((c:_btn_debounce))^00h,c
	line	112
	
i2l7883:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u997_41
	goto	i2u997_40

i2u997_41:
	goto	i2l325
i2u997_40:
	line	114
	
i2l7885:
	movff	(c:isr@btn),(c:_last_btn)
	line	115
	
i2l7887:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	117
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u998_41
	goto	i2u998_40
i2u998_41:
	goto	i2l7897
i2u998_40:
	line	120
	
i2l7889:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	121
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	124
	
i2l7891:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u999_41
	goto	i2u999_40

i2u999_41:
	goto	i2l322
i2u999_40:
	line	126
	
i2l7893:; BSR set to: 1

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	127
	
i2l7895:; BSR set to: 1

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l325
	line	133
	
i2l7897:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1000_41
	goto	i2u1000_40

i2u1000_41:
	goto	i2l7901
i2u1000_40:
	line	135
	
i2l7899:
	movlw	low(02h)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	136
	goto	i2l319
	line	137
	
i2l7901:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u1001_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1001_41
	goto	i2u1001_40

i2u1001_41:
	goto	i2l7905
i2u1001_40:
	line	139
	
i2l7903:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	140
	goto	i2l319
	line	143
	
i2l7905:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	144
	
i2l319:; BSR set to: 1

	line	146
	movlw	low(01h)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	147
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	goto	i2l325
	line	153
	
i2l7907:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	155
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1002_41
	goto	i2u1002_40
i2u1002_41:
	goto	i2l325
i2u1002_40:
	
i2l7909:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1003_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1003_41
	goto	i2u1003_40

i2u1003_41:
	goto	i2l325
i2u1003_40:
	line	157
	
i2l7911:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	160
	
i2l7913:
		movlw	8
	xorwf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1004_41
	movlw	7
	xorwf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1004_41
	goto	i2u1004_40

i2u1004_41:
	goto	i2l322
i2u1004_40:
	line	162
	
i2l7915:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	goto	i2l325
	line	165
	
i2l322:
	line	167
	
i2l325:
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
psect	text61,class=CODE,space=0,reloc=2,group=0
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext61
__ptext61:
psect	text61
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
i2___lwmod:
;incstack = 0
	callstack 23
	line	12
	
i2l7515:
	movf	((c:i2___lwmod@divisor))^00h,c,w
iorwf	((c:i2___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	i2u941_41
	goto	i2u941_40

i2u941_41:
	goto	i2l1772
i2u941_40:
	line	13
	
i2l7517:
	movlw	low(01h)
	movwf	((c:i2___lwmod@counter))^00h,c
	line	14
	goto	i2l7521
	line	15
	
i2l7519:
	bcf	status,0
	rlcf	((c:i2___lwmod@divisor))^00h,c
	rlcf	((c:i2___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:i2___lwmod@counter))^00h,c
	line	14
	
i2l7521:
	
	btfss	((c:i2___lwmod@divisor+1))^00h,c,(15)&7
	goto	i2u942_41
	goto	i2u942_40
i2u942_41:
	goto	i2l7519
i2u942_40:
	line	19
	
i2l7523:
		movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c,w
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	i2u943_41
	goto	i2u943_40

i2u943_41:
	goto	i2l7527
i2u943_40:
	line	20
	
i2l7525:
	movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c

	line	21
	
i2l7527:
	bcf	status,0
	rrcf	((c:i2___lwmod@divisor+1))^00h,c
	rrcf	((c:i2___lwmod@divisor))^00h,c
	line	22
	
i2l7529:
	decfsz	((c:i2___lwmod@counter))^00h,c
	
	goto	i2l7523
	line	23
	
i2l1772:
	line	24
	movff	(c:i2___lwmod@dividend),(c:?i2___lwmod)
	movff	(c:i2___lwmod@dividend+1),(c:?i2___lwmod+1)
	line	25
	
i2l1779:
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
