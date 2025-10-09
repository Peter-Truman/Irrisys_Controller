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
	FNCALL	_main,_handle_datetime_rotation
	FNCALL	_main,_handle_numeric_rotation
	FNCALL	_main,_handle_time_rotation
	FNCALL	_main,_handle_utility_numeric_rotation
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
	FNCALL	_main,_menu_draw_utility
	FNCALL	_main,_menu_handle_button
	FNCALL	_main,_menu_handle_encoder
	FNCALL	_main,_menu_init
	FNCALL	_main,_menu_update_edit_value
	FNCALL	_main,_menu_update_numeric_value
	FNCALL	_main,_menu_update_time_value
	FNCALL	_main,_rtc_init
	FNCALL	_main,_rtc_read_register
	FNCALL	_main,_rtc_read_time
	FNCALL	_main,_save_current_config
	FNCALL	_main,_sprintf
	FNCALL	_main,_system_init
	FNCALL	_main,_uart_init
	FNCALL	_main,_uart_println
	FNCALL	_rtc_read_register,_i2c_read
	FNCALL	_rtc_read_register,_i2c_restart
	FNCALL	_rtc_read_register,_i2c_start
	FNCALL	_rtc_read_register,_i2c_stop
	FNCALL	_rtc_read_register,_i2c_write
	FNCALL	_i2c_restart,_i2c_wait_idle
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
	FNCALL	_menu_handle_button,_init_datetime_editor
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
	FNCALL	_menu_handle_button,_rtc_read_time
	FNCALL	_menu_handle_button,_rtc_set_time
	FNCALL	_menu_handle_button,_save_current_config
	FNCALL	_menu_handle_button,_sprintf
	FNCALL	_menu_handle_button,_strcmp
	FNCALL	_menu_handle_button,_strcpy
	FNCALL	_menu_handle_button,_trigger_relay_pulse
	FNCALL	_menu_handle_button,_uart_println
	FNCALL	_trigger_relay_pulse,_sprintf
	FNCALL	_trigger_relay_pulse,_uart_println
	FNCALL	_rtc_set_time,_dec_to_bcd
	FNCALL	_rtc_set_time,_i2c_start
	FNCALL	_rtc_set_time,_i2c_stop
	FNCALL	_rtc_set_time,_i2c_write
	FNCALL	_rtc_set_time,_sprintf
	FNCALL	_rtc_set_time,_uart_println
	FNCALL	_dec_to_bcd,___lbdiv
	FNCALL	_dec_to_bcd,___lbmod
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
	FNCALL	_init_numeric_editor,___lwdiv
	FNCALL	_init_numeric_editor,___lwmod
	FNCALL	_init_datetime_editor,_rtc_read_time
	FNCALL	_init_datetime_editor,_sprintf
	FNCALL	_init_datetime_editor,_uart_println
	FNCALL	_rtc_read_time,_bcd_to_dec
	FNCALL	_rtc_read_time,_i2c_read
	FNCALL	_rtc_read_time,_i2c_start
	FNCALL	_rtc_read_time,_i2c_stop
	FNCALL	_rtc_read_time,_i2c_write
	FNCALL	_rtc_read_time,_sprintf
	FNCALL	_rtc_read_time,_uart_println
	FNCALL	_lcd_init,_lcd_cmd
	FNCALL	_lcd_init,_lcd_write_nibble
	FNCALL	_lcd_cmd,_lcd_write_nibble
	FNCALL	_handle_utility_numeric_rotation,_rebuild_utility_menu
	FNCALL	_rebuild_utility_menu,___lbdiv
	FNCALL	_rebuild_utility_menu,___lbmod
	FNCALL	_rebuild_utility_menu,___lwdiv
	FNCALL	_rebuild_utility_menu,___lwmod
	FNCALL	_rebuild_utility_menu,_sprintf
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_sprintf,___wmul
	FNCALL	_sprintf,_isdigit
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
	global	_value_scale4
	global	_value_enable
	global	menu_draw_setup@F2715
	global	_value_clock_display
	global	_value_high_tbp
	global	_value_low_flow_bp
	global	_value_no_flow_bp
	global	_value_low_flow
	global	_value_no_flow
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
psect	idataBANK5,class=CODE,space=0,delta=1,noexec
global __pidataBANK5
__pidataBANK5:
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
psect	idataBANK6,class=CODE,space=0,delta=1,noexec
global __pidataBANK6
__pidataBANK6:
	line	66

;initializer for _options_menu
		db	low(STR_77)
	db	high(STR_77)

		db	low(STR_78)
	db	high(STR_78)

		db	low(STR_79)
	db	high(STR_79)

		db	low(STR_80)
	db	high(STR_80)

		db	low(STR_81)
	db	high(STR_81)

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
psect	idataBANK7,class=CODE,space=0,delta=1,noexec
global __pidataBANK7
__pidataBANK7:
	line	1536

;initializer for menu_draw_setup@F2715
		db	low(STR_243)
	db	high(STR_243)

		db	low(STR_244)
	db	high(STR_244)

		db	low(STR_245)
	db	high(STR_245)

		db	low(STR_246)
	db	high(STR_246)

		db	low(STR_247)
	db	high(STR_247)

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
	global	_utility_menu_template
psect	mediumconst,class=MEDIUMCONST,space=0,reloc=2,noexec
global __pmediumconst
__pmediumconst:
	db	0
	file	"src\menu.c"
	line	180
_utility_menu_template:
		db	low(STR_129)
	db	high(STR_129)

		db	low(0)
	db	high(0)

	db	low(0)
		db	low(STR_130)
	db	high(STR_130)

		db	low(0)
	db	high(0)

	db	low(0)
		db	low(STR_131)
	db	high(STR_131)

		db	low(0)
	db	high(0)

	db	low(0)
		db	low(STR_132)
	db	high(STR_132)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_133)
	db	high(STR_133)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_134)
	db	high(STR_134)

		db	low(0)
	db	high(0)

	db	low(01h)
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
		db	low(STR_42)
	db	high(STR_42)

		db	low(STR_43)
	db	high(STR_43)

		db	low(STR_44)
	db	high(STR_44)

		db	low(STR_45)
	db	high(STR_45)

		db	low(STR_46)
	db	high(STR_46)

	db	low(01h)
	db	low(03h)
		db	low(STR_47)
	db	high(STR_47)

		db	low(STR_48)
	db	high(STR_48)

		db	low(STR_49)
	db	high(STR_49)

		db	low(STR_50)
	db	high(STR_50)

		db	low(STR_51)
	db	high(STR_51)

	db	low(02h)
	db	low(02h)
		db	low(STR_52)
	db	high(STR_52)

		db	low(STR_53)
	db	high(STR_53)

		db	low(STR_54)
	db	high(STR_54)

		db	low(STR_55)
	db	high(STR_55)

		db	low(STR_56)
	db	high(STR_56)

	db	low(03h)
	db	low(02h)
		db	low(STR_57)
	db	high(STR_57)

		db	low(STR_58)
	db	high(STR_58)

		db	low(STR_59)
	db	high(STR_59)

		db	low(STR_60)
	db	high(STR_60)

		db	low(STR_61)
	db	high(STR_61)

	db	low(04h)
	db	low(02h)
		db	low(STR_62)
	db	high(STR_62)

		db	low(STR_63)
	db	high(STR_63)

		db	low(STR_64)
	db	high(STR_64)

		db	low(STR_65)
	db	high(STR_65)

		db	low(STR_66)
	db	high(STR_66)

	db	low(05h)
	db	low(02h)
		db	low(STR_67)
	db	high(STR_67)

		db	low(STR_68)
	db	high(STR_68)

		db	low(STR_69)
	db	high(STR_69)

		db	low(STR_70)
	db	high(STR_70)

		db	low(STR_71)
	db	high(STR_71)

	db	low(06h)
	db	low(03h)
		db	low(STR_72)
	db	high(STR_72)

		db	low(STR_73)
	db	high(STR_73)

		db	low(STR_74)
	db	high(STR_74)

		db	low(STR_75)
	db	high(STR_75)

		db	low(STR_76)
	db	high(STR_76)

	global __end_of_menu_item_options
__end_of_menu_item_options:
	global	_pressure_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	113
_pressure_menu_template:
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

	db	low(0)
	global __end_of_pressure_menu_template
__end_of_pressure_menu_template:
	global	_flow_analog_template
psect	mediumconst
	file	"src\menu.c"
	line	156
_flow_analog_template:
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

	db	low(01h)
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

	db	low(0)
	global __end_of_flow_analog_template
__end_of_flow_analog_template:
	global	_temp_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	131
_temp_menu_template:
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

	db	low(0)
	global __end_of_temp_menu_template
__end_of_temp_menu_template:
	global	_flow_digital_template
psect	mediumconst
	file	"src\menu.c"
	line	144
_flow_digital_template:
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

	db	low(01h)
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

	db	low(0)
	global __end_of_flow_digital_template
__end_of_flow_digital_template:
	global	_clock_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	171
_clock_menu_template:
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

	db	low(01h)
		db	low(STR_127)
	db	high(STR_127)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_128)
	db	high(STR_128)

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
	global	_current_menu
	global	_save_pending
	global	_long_press_beep_flag
	global	_timeout_debug_flag
	global	_button_event
	global	_current_input
	global	_input_menu
	global	_clock_menu
	global	_utility_menu
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
	
STR_332:
	db	68	;'D'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
	db	47
	db	116	;'t'
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
	db	97	;'a'
	db	110	;'n'
	db	99	;'c'
	db	101	;'e'
	db	108	;'l'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	45
	db	32
	db	114	;'r'
	db	101	;'e'
	db	115	;'s'
	db	116	;'t'
	db	111	;'o'
	db	114	;'r'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	111	;'o'
	db	114	;'r'
	db	105	;'i'
	db	103	;'g'
	db	105	;'i'
	db	110	;'n'
	db	97	;'a'
	db	108	;'l'
	db	32
	db	118	;'v'
	db	97	;'a'
	db	108	;'l'
	db	117	;'u'
	db	101	;'e'
	db	115	;'s'
	db	0
	
STR_143:
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
	
STR_353:
	db	82	;'R'
	db	84	;'T'
	db	67	;'C'
	db	32
	db	119	;'w'
	db	114	;'r'
	db	105	;'i'
	db	116	;'t'
	db	101	;'e'
	db	32
	db	66	;'B'
	db	67	;'C'
	db	68	;'D'
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
	
STR_361:
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
	
STR_221:
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
	
STR_148:
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
	
STR_268:
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
	
STR_341:
	db	85	;'U'
	db	84	;'T'
	db	73	;'I'
	db	76	;'L'
	db	73	;'I'
	db	84	;'T'
	db	89	;'Y'
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
	db	105	;'i'
	db	110	;'n'
	db	95	;'_'
	db	115	;'s'
	db	117	;'u'
	db	98	;'b'
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	61	;'='
	db	37
	db	100	;'d'
	db	44
	db	32
	db	102	;'f'
	db	105	;'i'
	db	101	;'e'
	db	108	;'l'
	db	100	;'d'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_140:
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
	
STR_313:
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
	db	82	;'R'
	db	84	;'T'
	db	67	;'C'
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
	
STR_315:
	db	82	;'R'
	db	84	;'T'
	db	67	;'C'
	db	32
	db	114	;'r'
	db	101	;'e'
	db	97	;'a'
	db	100	;'d'
	db	98	;'b'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
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
	
STR_363:
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
	
STR_310:
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
	
STR_354:
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
	
STR_359:
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
	
STR_362:
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
	
STR_364:
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
	
STR_12:
	db	87	;'W'
	db	65	;'A'
	db	82	;'R'
	db	78	;'N'
	db	73	;'I'
	db	78	;'N'
	db	71	;'G'
	db	58	;':'
	db	32
	db	79	;'O'
	db	115	;'s'
	db	99	;'c'
	db	105	;'i'
	db	108	;'l'
	db	108	;'l'
	db	97	;'a'
	db	116	;'t'
	db	111	;'o'
	db	114	;'r'
	db	32
	db	83	;'S'
	db	116	;'t'
	db	111	;'o'
	db	112	;'p'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	97	;'a'
	db	103	;'g'
	db	32
	db	105	;'i'
	db	115	;'s'
	db	32
	db	83	;'S'
	db	69	;'E'
	db	84	;'T'
	db	33
	db	0
	
STR_357:
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
	
STR_296:
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
	
STR_299:
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
	
STR_342:
	db	69	;'E'
	db	110	;'n'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	68	;'D'
	db	97	;'a'
	db	116	;'t'
	db	101	;'e'
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
	db	32
	db	45
	db	32
	db	68	;'D'
	db	68	;'D'
	db	32
	db	102	;'f'
	db	108	;'l'
	db	97	;'a'
	db	115	;'s'
	db	104	;'h'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	0
	
STR_343:
	db	69	;'E'
	db	110	;'n'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	101	;'e'
	db	100	;'d'
	db	32
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
	db	109	;'m'
	db	111	;'o'
	db	100	;'d'
	db	101	;'e'
	db	32
	db	45
	db	32
	db	72	;'H'
	db	72	;'H'
	db	32
	db	102	;'f'
	db	108	;'l'
	db	97	;'a'
	db	115	;'s'
	db	104	;'h'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
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
	
STR_314:
	db	82	;'R'
	db	84	;'T'
	db	67	;'C'
	db	32
	db	119	;'w'
	db	114	;'r'
	db	105	;'i'
	db	116	;'t'
	db	101	;'e'
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
	db	32
	db	45
	db	32
	db	118	;'v'
	db	101	;'e'
	db	114	;'r'
	db	105	;'i'
	db	102	;'f'
	db	121	;'y'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	46
	db	46
	db	46
	db	0
	
STR_39:
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
	
STR_138:
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
	
STR_259:
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
	
STR_301:
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
	
STR_312:
	db	68	;'D'
	db	105	;'i'
	db	103	;'g'
	db	105	;'i'
	db	116	;'t'
	db	32
	db	97	;'a'
	db	100	;'d'
	db	118	;'v'
	db	97	;'a'
	db	110	;'n'
	db	99	;'c'
	db	101	;'e'
	db	58	;':'
	db	32
	db	102	;'f'
	db	105	;'i'
	db	101	;'e'
	db	108	;'l'
	db	100	;'d'
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
	
STR_13:
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
	
STR_36:
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
	
STR_352:
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
	db	85	;'U'
	db	84	;'T'
	db	73	;'I'
	db	76	;'L'
	db	73	;'I'
	db	84	;'T'
	db	89	;'Y'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	32
	db	79	;'O'
	db	80	;'P'
	db	84	;'T'
	db	73	;'I'
	db	79	;'O'
	db	78	;'N'
	db	83	;'S'
	db	0
	
STR_309:
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
	
STR_311:
	db	85	;'U'
	db	84	;'T'
	db	73	;'I'
	db	76	;'L'
	db	73	;'I'
	db	84	;'T'
	db	89	;'Y'
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
	db	44
	db	32
	db	118	;'v'
	db	97	;'a'
	db	108	;'l'
	db	117	;'u'
	db	101	;'e'
	db	61	;'='
	db	37
	db	100	;'d'
	db	0
	
STR_298:
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
	
STR_358:
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
	
STR_360:
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
	
STR_222:
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
	
STR_350:
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
	db	83	;'S'
	db	69	;'E'
	db	84	;'T'
	db	85	;'U'
	db	80	;'P'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	32
	db	79	;'O'
	db	80	;'P'
	db	84	;'T'
	db	73	;'I'
	db	79	;'O'
	db	78	;'N'
	db	83	;'S'
	db	0
	
STR_365:
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
	
STR_139:
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
	
STR_223:
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
	
STR_348:
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
	db	79	;'O'
	db	80	;'P'
	db	84	;'T'
	db	73	;'I'
	db	79	;'O'
	db	78	;'N'
	db	83	;'S'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	32
	db	77	;'M'
	db	97	;'a'
	db	105	;'i'
	db	110	;'n'
	db	0
	
STR_269:
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
	
STR_356:
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
	
STR_351:
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
	db	67	;'C'
	db	76	;'L'
	db	79	;'O'
	db	67	;'C'
	db	75	;'K'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	32
	db	83	;'S'
	db	69	;'E'
	db	84	;'T'
	db	85	;'U'
	db	80	;'P'
	db	0
	
STR_349:
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
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	32
	db	83	;'S'
	db	69	;'E'
	db	84	;'T'
	db	85	;'U'
	db	80	;'P'
	db	0
	
STR_305:
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
	
STR_300:
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
	
STR_347:
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
	
STR_11:
	db	82	;'R'
	db	84	;'T'
	db	67	;'C'
	db	32
	db	83	;'S'
	db	116	;'t'
	db	97	;'a'
	db	116	;'t'
	db	117	;'u'
	db	115	;'s'
	db	32
	db	82	;'R'
	db	101	;'e'
	db	103	;'g'
	db	105	;'i'
	db	115	;'s'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	58	;':'
	db	32
	db	48	;'0'
	db	120	;'x'
	db	37
	db	48	;'0'
	db	50	;'2'
	db	88	;'X'
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
	
STR_144:
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
	
STR_317:
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
	db	114	;'r'
	db	101	;'e'
	db	97	;'a'
	db	100	;'d'
	db	98	;'b'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	32
	db	102	;'f'
	db	97	;'a'
	db	105	;'i'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_321:
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
	
STR_149:
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
	
STR_302:
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
	
STR_306:
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
	
STR_345:
	db	69	;'E'
	db	110	;'n'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	83	;'S'
	db	101	;'e'
	db	116	;'t'
	db	32
	db	67	;'C'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
	db	32
	db	115	;'s'
	db	117	;'u'
	db	98	;'b'
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	0
	
STR_304:
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
	
STR_141:
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
	
STR_344:
	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	83	;'S'
	db	101	;'e'
	db	116	;'t'
	db	32
	db	67	;'C'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
	db	32
	db	115	;'s'
	db	117	;'u'
	db	98	;'b'
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	0
	
STR_318:
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
	
STR_297:
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
	
STR_355:
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
	
STR_33:
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
	
STR_172:
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
	
STR_242:
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
	
STR_232:
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
	
STR_35:
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
	
STR_303:
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
	
STR_346:
	db	69	;'E'
	db	100	;'d'
	db	105	;'i'
	db	116	;'t'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
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
	
STR_34:
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
	
STR_367:
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
	
STR_316:
	db	82	;'R'
	db	84	;'T'
	db	67	;'C'
	db	32
	db	118	;'v'
	db	101	;'e'
	db	114	;'r'
	db	105	;'i'
	db	102	;'f'
	db	105	;'i'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	79	;'O'
	db	75	;'K'
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
	
STR_153:
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
	
STR_284:
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
	
STR_152:
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
	
STR_157:
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
	
STR_151:
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
	
STR_150:
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
	
STR_156:
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
	
STR_155:
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
	
STR_88:
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
	
STR_79:
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
	
STR_120:
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
	
STR_286:
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
	
STR_86:
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
	
STR_85:
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
	
STR_109:
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
	
STR_135:
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
	
STR_136:
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
	
STR_78:
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
	
STR_84:
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
	
STR_126:
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
	
STR_131:
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
	
STR_129:
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
	
STR_100:
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
	
STR_77:
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
	
STR_133:
	db	77	;'M'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	32
	db	84	;'T'
	db	47
	db	79	;'O'
	db	0
	
STR_87:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_101:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	84	;'T'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_235:
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_225:
	db	37
	db	99	;'c'
	db	37
	db	100	;'d'
	db	37
	db	100	;'d'
	db	37
	db	100	;'d'
	db	0
	
STR_42:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_74:
	db	78	;'N'
	db	111	;'o'
	db	116	;'t'
	db	32
	db	85	;'U'
	db	115	;'s'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_130:
	db	86	;'V'
	db	105	;'i'
	db	101	;'e'
	db	119	;'w'
	db	32
	db	76	;'L'
	db	111	;'o'
	db	103	;'g'
	db	0
	
STR_91:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	0
	
STR_134:
	db	67	;'C'
	db	111	;'o'
	db	110	;'n'
	db	116	;'t'
	db	114	;'r'
	db	97	;'a'
	db	115	;'s'
	db	116	;'t'
	db	0
	
STR_119:
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_92:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_93:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_285:
	db	85	;'U'
	db	84	;'T'
	db	73	;'I'
	db	76	;'L'
	db	73	;'I'
	db	84	;'T'
	db	89	;'Y'
	db	0
	
STR_43:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_53:
	db	68	;'D'
	db	105	;'i'
	db	103	;'g'
	db	105	;'i'
	db	116	;'t'
	db	97	;'a'
	db	108	;'l'
	db	0
	
STR_125:
	db	69	;'E'
	db	110	;'n'
	db	100	;'d'
	db	32
	db	82	;'R'
	db	117	;'u'
	db	110	;'n'
	db	0
	
STR_110:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_108:
	db	78	;'N'
	db	111	;'o'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_94:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	0
	
STR_38:
	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_366:
	db	40
	db	110	;'n'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	41
	db	0
	
STR_288:
	db	91	;'['
	db	66	;'B'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	93	;']'
	db	0
	
STR_82:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	0
	
STR_52:
	db	65	;'A'
	db	110	;'n'
	db	97	;'a'
	db	108	;'l'
	db	111	;'o'
	db	103	;'g'
	db	0
	
STR_83:
	db	83	;'S'
	db	101	;'e'
	db	110	;'n'
	db	115	;'s'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_279:
	db	67	;'C'
	db	76	;'L'
	db	79	;'O'
	db	67	;'C'
	db	75	;'K'
	db	0
	
STR_89:
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_90:
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_177:
	db	37
	db	43
	db	48	;'0'
	db	52	;'4'
	db	100	;'d'
	db	0
	
STR_72:
	db	76	;'L'
	db	97	;'a'
	db	116	;'t'
	db	99	;'c'
	db	104	;'h'
	db	0
	
STR_116:
	db	85	;'U'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	115	;'s'
	db	0
	
STR_80:
	db	65	;'A'
	db	98	;'b'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_32:
	db	82	;'R'
	db	101	;'e'
	db	97	;'a'
	db	100	;'d'
	db	121	;'y'
	db	0
	
STR_179:
	db	37
	db	48	;'0'
	db	51	;'3'
	db	100	;'d'
	db	0
	
STR_67:
	db	72	;'H'
	db	105	;'i'
	db	100	;'d'
	db	101	;'e'
	db	0
	
STR_107:
	db	84	;'T'
	db	121	;'y'
	db	112	;'p'
	db	101	;'e'
	db	0
	
STR_95:
	db	66	;'B'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_81:
	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	0
	
STR_68:
	db	83	;'S'
	db	104	;'h'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_63:
	db	76	;'L'
	db	112	;'p'
	db	83	;'S'
	db	0
	
STR_62:
	db	37
	db	0
	
STR_146:
	db	40
	db	0
	
STR_253:
	db	42
	db	0
	
STR_162:
	db	91	;'['
	db	0
STR_103	equ	STR_94+0
STR_111	equ	STR_94+0
STR_122	equ	STR_94+0
STR_127	equ	STR_94+0
STR_49	equ	STR_108+3
STR_205	equ	STR_108+3
STR_250	equ	STR_108+3
STR_193	equ	STR_68+0
STR_203	equ	STR_68+0
STR_208	equ	STR_68+0
STR_267	equ	STR_68+0
STR_339	equ	STR_68+0
STR_121	equ	STR_110+0
STR_57	equ	STR_110+4
STR_219	equ	STR_110+4
STR_132	equ	STR_346+8
STR_142	equ	STR_298+29
STR_173	equ	STR_298+29
STR_260	equ	STR_298+29
STR_97	equ	STR_83+0
STR_106	equ	STR_83+0
STR_114	equ	STR_83+0
STR_48	equ	STR_100+5
STR_195	equ	STR_100+5
STR_249	equ	STR_100+5
STR_207	equ	STR_53+0
STR_287	equ	STR_129+0
STR_246	equ	STR_129+4
STR_104	equ	STR_95+0
STR_112	equ	STR_95+0
STR_123	equ	STR_95+0
STR_128	equ	STR_95+0
STR_137	equ	STR_95+0
STR_169	equ	STR_95+0
STR_171	equ	STR_95+0
STR_247	equ	STR_95+0
STR_289	equ	STR_95+0
STR_102	equ	STR_91+0
STR_58	equ	STR_91+4
STR_184	equ	STR_72+0
STR_187	equ	STR_72+0
STR_190	equ	STR_72+0
STR_200	equ	STR_72+0
STR_210	equ	STR_72+0
STR_263	equ	STR_72+0
STR_337	equ	STR_72+0
STR_206	equ	STR_52+0
STR_41	equ	STR_35+0
STR_73	equ	STR_126+4
STR_185	equ	STR_126+4
STR_188	equ	STR_126+4
STR_191	equ	STR_126+4
STR_201	equ	STR_126+4
STR_211	equ	STR_126+4
STR_264	equ	STR_126+4
STR_338	equ	STR_126+4
STR_47	equ	STR_86+3
STR_176	equ	STR_86+3
STR_248	equ	STR_86+3
STR_115	equ	STR_107+0
STR_96	equ	STR_82+0
STR_105	equ	STR_82+0
STR_113	equ	STR_82+0
STR_124	equ	STR_82+0
STR_194	equ	STR_67+0
STR_204	equ	STR_67+0
STR_209	equ	STR_67+0
STR_186	equ	STR_74+0
STR_189	equ	STR_74+0
STR_192	equ	STR_74+0
STR_202	equ	STR_74+0
STR_212	equ	STR_74+0
STR_265	equ	STR_74+0
STR_175	equ	STR_42+0
STR_262	equ	STR_42+0
STR_174	equ	STR_43+0
STR_261	equ	STR_43+0
STR_336	equ	STR_43+0
STR_178	equ	STR_177+0
STR_196	equ	STR_177+0
STR_197	equ	STR_177+0
STR_215	equ	STR_177+0
STR_216	equ	STR_177+0
STR_322	equ	STR_177+0
STR_323	equ	STR_177+0
STR_326	equ	STR_177+0
STR_327	equ	STR_177+0
STR_329	equ	STR_177+0
STR_330	equ	STR_177+0
STR_181	equ	STR_179+0
STR_217	equ	STR_179+0
STR_324	equ	STR_179+0
STR_325	equ	STR_179+0
STR_328	equ	STR_179+0
STR_331	equ	STR_179+0
STR_158	equ	STR_313+30
STR_159	equ	STR_313+30
STR_180	equ	STR_155+3
STR_182	equ	STR_155+3
STR_183	equ	STR_155+3
STR_199	equ	STR_155+3
STR_218	equ	STR_155+3
STR_220	equ	STR_155+3
STR_266	equ	STR_155+3
STR_275	equ	STR_155+3
STR_278	equ	STR_155+3
STR_307	equ	STR_155+3
STR_308	equ	STR_155+3
STR_320	equ	STR_155+3
STR_154	equ	STR_153+0
STR_224	equ	STR_225+2
STR_319	equ	STR_306+0
STR_198	equ	STR_29+20
STR_274	equ	STR_29+20
STR_276	equ	STR_29+20
STR_277	equ	STR_29+20
STR_163	equ	STR_288+5
STR_167	equ	STR_288+5
STR_170	equ	STR_288+5
STR_234	equ	STR_288+5
STR_240	equ	STR_288+5
STR_252	equ	STR_288+5
STR_256	equ	STR_288+5
STR_282	equ	STR_288+5
STR_291	equ	STR_288+5
STR_294	equ	STR_288+5
STR_166	equ	STR_162+0
STR_168	equ	STR_162+0
STR_233	equ	STR_162+0
STR_238	equ	STR_162+0
STR_251	equ	STR_162+0
STR_255	equ	STR_162+0
STR_280	equ	STR_162+0
STR_290	equ	STR_162+0
STR_292	equ	STR_162+0
STR_214	equ	STR_63+0
STR_37	equ	STR_31+0
STR_98	equ	STR_84+0
STR_117	equ	STR_84+0
STR_99	equ	STR_85+0
STR_118	equ	STR_85+0
STR_40	equ	STR_34+0
STR_257	equ	STR_253+0
STR_147	equ	STR_366+5
STR_161	equ	STR_366+5
STR_165	equ	STR_366+5
STR_228	equ	STR_366+5
STR_231	equ	STR_366+5
STR_241	equ	STR_366+5
STR_283	equ	STR_366+5
STR_295	equ	STR_366+5
STR_160	equ	STR_146+0
STR_164	equ	STR_146+0
STR_227	equ	STR_146+0
STR_230	equ	STR_146+0
STR_239	equ	STR_146+0
STR_281	equ	STR_146+0
STR_293	equ	STR_146+0
STR_213	equ	STR_62+0
STR_145	equ	STR_172+13
STR_226	equ	STR_172+14
STR_229	equ	STR_172+15
STR_236	equ	STR_172+15
STR_254	equ	STR_172+19
STR_258	equ	STR_172+19
STR_44	equ	STR_172+20
STR_45	equ	STR_172+20
STR_46	equ	STR_172+20
STR_50	equ	STR_172+20
STR_51	equ	STR_172+20
STR_54	equ	STR_172+20
STR_55	equ	STR_172+20
STR_56	equ	STR_172+20
STR_59	equ	STR_172+20
STR_60	equ	STR_172+20
STR_61	equ	STR_172+20
STR_64	equ	STR_172+20
STR_65	equ	STR_172+20
STR_66	equ	STR_172+20
STR_69	equ	STR_172+20
STR_70	equ	STR_172+20
STR_71	equ	STR_172+20
STR_75	equ	STR_172+20
STR_76	equ	STR_172+20
STR_237	equ	STR_172+20
STR_243	equ	STR_172+20
STR_244	equ	STR_172+20
STR_245	equ	STR_172+20
STR_270	equ	STR_172+20
STR_271	equ	STR_172+20
STR_272	equ	STR_172+20
STR_273	equ	STR_172+20
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
psect	bssBANK5,class=BANK5,space=1,noexec,lowdata
global __pbssBANK5
__pbssBANK5:
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
	global	_input_menu
_input_menu:
       ds      75
	global	_clock_menu
_clock_menu:
       ds      25
psect	dataBANK5,class=BANK5,space=1,noexec,lowdata
global __pdataBANK5
__pdataBANK5:
	file	"src\eeprom.c"
	line	11
	global	_menu_timeout_seconds
_menu_timeout_seconds:
       ds      2
psect	dataBANK5
	file	"src\encoder.c"
	line	16
	global	_menu_timeout_flag
_menu_timeout_flag:
       ds      1
psect	dataBANK5
	file	"src\menu.c"
	line	103
_value_relay_pulse:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	85
_value_display:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	200
_value_pwr_fail:
       ds      6
psect	dataBANK5
	file	"src\menu.c"
	line	197
_value_menu_timeout:
       ds      6
psect	dataBANK5
	file	"src\menu.c"
	line	196
_value_log_entries:
       ds      6
psect	dataBANK5
	file	"src\menu.c"
	line	86
_value_back:
       ds      5
psect	dataBANK5
	file	"src\menu.c"
	line	199
_value_brightness:
       ds      4
psect	dataBANK5
	file	"src\menu.c"
	line	198
_value_contrast:
       ds      4
psect	bssBANK6,class=BANK6,space=1,noexec,lowdata
global __pbssBANK6
__pbssBANK6:
	global	_utility_menu
_utility_menu:
       ds      45
menu_update_numeric_value@F2686:
       ds      6
_original_value:
       ds      10
psect	dataBANK6,class=BANK6,space=1,noexec,lowdata
global __pdataBANK6
__pdataBANK6:
	file	"src\menu.c"
	line	66
	global	_options_menu
_options_menu:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	75
_value_sensor:
       ds      12
psect	dataBANK6
	file	"src\menu.c"
	line	102
_value_end_runtime:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	101
_value_clock_enable:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	93
_value_flow_units:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	92
_value_flow_type:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	91
_value_high_temp:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	90
_value_low_pressure:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	89
_value_hi_pressure:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	84
_value_rlylow:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	83
_value_rlyslp:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	82
_value_rlyplp:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	81
_value_rlyhigh:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	80
_value_slpbp:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	79
_value_plpbp:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	78
_value_highbp:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	77
_value_scale20:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	76
_value_scale4:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	74
_value_enable:
       ds      10
psect	bssBANK7,class=BANK7,space=1,noexec,lowdata
global __pbssBANK7
__pbssBANK7:
	global	_system_config
_system_config:
       ds      128
psect	dataBANK7,class=BANK7,space=1,noexec,lowdata
global __pdataBANK7
__pdataBANK7:
	file	"src\menu.c"
	line	1536
menu_draw_setup@F2715:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	104
_value_clock_display:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	98
_value_high_tbp:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	97
_value_low_flow_bp:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	96
_value_no_flow_bp:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	95
_value_low_flow:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	94
_value_no_flow:
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
; Initialize objects allocated to BANK7 (70 bytes)
	global __pidataBANK7
	; load TBLPTR registers with __pidataBANK7
	movlw	low (__pidataBANK7)
	movwf	tblptrl
	movlw	high(__pidataBANK7)
	movwf	tblptrh
	movlw	low highword(__pidataBANK7)
	movwf	tblptru
	lfsr	0,__pdataBANK7
	lfsr	1,70
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK6 (192 bytes)
	global __pidataBANK6
	; load TBLPTR registers with __pidataBANK6
	movlw	low (__pidataBANK6)
	movwf	tblptrl
	movlw	high(__pidataBANK6)
	movwf	tblptrh
	movlw	low highword(__pidataBANK6)
	movwf	tblptru
	lfsr	0,__pdataBANK6
	lfsr	1,192
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
; Initialize objects allocated to BANK5 (54 bytes)
	global __pidataBANK5
	; load TBLPTR registers with __pidataBANK5
	movlw	low (__pidataBANK5)
	movwf	tblptrl
	movlw	high(__pidataBANK5)
	movwf	tblptrh
	movlw	low highword(__pidataBANK5)
	movwf	tblptru
	lfsr	0,__pdataBANK5
	lfsr	1,54
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
; Clear objects allocated to BANK7 (128 bytes)
	global __pbssBANK7
lfsr	0,__pbssBANK7
movlw	128
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
; Clear objects allocated to BANK6 (61 bytes)
	global __pbssBANK6
lfsr	0,__pbssBANK6
movlw	61
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
; Clear objects allocated to BANK5 (157 bytes)
	global __pbssBANK5
lfsr	0,__pbssBANK5
movlw	157
clear_3:
clrf	postinc0,c
decf	wreg
bnz	clear_3
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
psect	cstackBANK7,class=BANK7,space=1,noexec,lowdata
global __pcstackBANK7
__pcstackBANK7:
	global	main@buf_714
main@buf_714:	; 30 bytes @ 0x0
	ds   30
psect	cstackBANK5,class=BANK5,space=1,noexec,lowdata
global __pcstackBANK5
__pcstackBANK5:
	global	main@buf_633
main@buf_633:	; 30 bytes @ 0x0
	ds   30
	global	main@current_event
main@current_event:	; 1 bytes @ 0x1E
	ds   1
	global	main@status
main@status:	; 1 bytes @ 0x1F
	ds   1
	global	main@delta
main@delta:	; 2 bytes @ 0x20
	ds   2
	global	main@current_time
main@current_time:	; 7 bytes @ 0x22
	ds   7
psect	cstackBANK4,class=BANK4,space=1,noexec,lowdata
global __pcstackBANK4
__pcstackBANK4:
	global	main@buf_672
main@buf_672:	; 60 bytes @ 0x0
	ds   60
	global	main@buf
main@buf:	; 50 bytes @ 0x3C
	ds   50
	global	main@buf_628
main@buf_628:	; 50 bytes @ 0x6E
	ds   50
	global	main@buf_667
main@buf_667:	; 50 bytes @ 0xA0
	ds   50
	global	main@buf_675
main@buf_675:	; 40 bytes @ 0xD2
	ds   40
	global	main@adc_ch3
main@adc_ch3:	; 2 bytes @ 0xFA
	ds   2
	global	main@last_button
main@last_button:	; 1 bytes @ 0xFC
	ds   1
	global	main@adc_error
main@adc_error:	; 1 bytes @ 0xFD
	ds   1
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0xFE
	ds   2
psect	cstackBANK3,class=BANK3,space=1,noexec,lowdata
global __pcstackBANK3
__pcstackBANK3:
	global	menu_handle_button@buf_1788
menu_handle_button@buf_1788:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_button@buf_1796
menu_handle_button@buf_1796:	; 50 bytes @ 0x32
	ds   50
	global	menu_handle_button@buf
menu_handle_button@buf:	; 50 bytes @ 0x64
	ds   50
	global	menu_handle_button@verify_time
menu_handle_button@verify_time:	; 7 bytes @ 0x96
	ds   7
	global	menu_handle_button@new_time
menu_handle_button@new_time:	; 7 bytes @ 0x9D
	ds   7
	global	menu_handle_button@sensor_type
menu_handle_button@sensor_type:	; 1 bytes @ 0xA4
	ds   1
	global	menu_handle_button@new_value_1748
menu_handle_button@new_value_1748:	; 2 bytes @ 0xA5
	ds   2
??_main:	; 1 bytes @ 0xA7
	ds   2
	global	main@time_buf
main@time_buf:	; 60 bytes @ 0xA9
	ds   60
	global	main@adc_ch1
main@adc_ch1:	; 2 bytes @ 0xE5
	ds   2
	global	main@adc_ch2
main@adc_ch2:	; 2 bytes @ 0xE7
	ds   2
psect	cstackBANK2,class=BANK2,space=1,noexec,lowdata
global __pcstackBANK2
__pcstackBANK2:
	global	menu_handle_button@buf_1707
menu_handle_button@buf_1707:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_button@buf_1709
menu_handle_button@buf_1709:	; 50 bytes @ 0x32
	ds   50
	global	menu_handle_button@buf_1743
menu_handle_button@buf_1743:	; 50 bytes @ 0x64
	ds   50
	global	menu_handle_button@buf_1769
menu_handle_button@buf_1769:	; 50 bytes @ 0x96
	ds   50
	global	menu_handle_button@buf_1779
menu_handle_button@buf_1779:	; 50 bytes @ 0xC8
	ds   50
	global	menu_handle_button@press_type
menu_handle_button@press_type:	; 1 bytes @ 0xFA
	ds   1
	global	menu_handle_button@new_seconds
menu_handle_button@new_seconds:	; 2 bytes @ 0xFB
	ds   2
	global	menu_handle_button@flow_type_1765
menu_handle_button@flow_type_1765:	; 1 bytes @ 0xFD
	ds   1
	global	menu_handle_button@flow_type
menu_handle_button@flow_type:	; 1 bytes @ 0xFE
	ds   1
	global	menu_handle_button@sensor_type_1764
menu_handle_button@sensor_type_1764:	; 1 bytes @ 0xFF
	ds   1
psect	cstackBANK1,class=BANK1,space=1,noexec,lowdata
global __pcstackBANK1
__pcstackBANK1:
	global	menu_handle_encoder@buf_1677
menu_handle_encoder@buf_1677:	; 50 bytes @ 0x0
	global	init_datetime_editor@buf
init_datetime_editor@buf:	; 80 bytes @ 0x0
	ds   50
	global	menu_handle_encoder@buf_1680
menu_handle_encoder@buf_1680:	; 50 bytes @ 0x32
	ds   30
	global	init_datetime_editor@current_time
init_datetime_editor@current_time:	; 7 bytes @ 0x50
	ds   7
	global	menu_handle_button@buf_1711
menu_handle_button@buf_1711:	; 80 bytes @ 0x57
	ds   13
	global	menu_handle_encoder@buf
menu_handle_encoder@buf:	; 50 bytes @ 0x64
	ds   50
	global	_menu_handle_encoder$1675
_menu_handle_encoder$1675:	; 2 bytes @ 0x96
	ds   2
	global	_menu_handle_encoder$1676
_menu_handle_encoder$1676:	; 2 bytes @ 0x98
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
	ds   5
	global	menu_handle_button@buf_1730
menu_handle_button@buf_1730:	; 80 bytes @ 0xA7
	ds   80
	global	menu_handle_button@opts_1773
menu_handle_button@opts_1773:	; 2 bytes @ 0xF7
	ds   2
	global	menu_handle_button@i
menu_handle_button@i:	; 1 bytes @ 0xF9
	ds   1
	global	menu_handle_button@new_value
menu_handle_button@new_value:	; 2 bytes @ 0xFA
	ds   2
	global	menu_handle_button@opts
menu_handle_button@opts:	; 2 bytes @ 0xFC
	ds   2
	global	menu_handle_button@edit_flag
menu_handle_button@edit_flag:	; 2 bytes @ 0xFE
	ds   2
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
	global	rtc_set_time@buf
rtc_set_time@buf:	; 80 bytes @ 0x0
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
	global	_menu_draw_utility$1643
_menu_draw_utility$1643:	; 2 bytes @ 0x10
	ds   2
	global	_menu_draw_utility$1651
_menu_draw_utility$1651:	; 2 bytes @ 0x12
	ds   2
	global	menu_update_edit_value@sensor_type
menu_update_edit_value@sensor_type:	; 1 bytes @ 0x14
	global	_menu_draw_utility$1655
_menu_draw_utility$1655:	; 2 bytes @ 0x14
	ds   1
	global	menu_update_edit_value@flow_type
menu_update_edit_value@flow_type:	; 1 bytes @ 0x15
	ds   1
	global	menu_draw_utility@len
menu_draw_utility@len:	; 1 bytes @ 0x16
	global	_menu_update_edit_value$1468
_menu_update_edit_value$1468:	; 2 bytes @ 0x16
	ds   1
	global	menu_draw_utility@val_len
menu_draw_utility@val_len:	; 1 bytes @ 0x17
	ds   1
	global	menu_draw_utility@j
menu_draw_utility@j:	; 1 bytes @ 0x18
	global	_menu_update_edit_value$1472
_menu_update_edit_value$1472:	; 2 bytes @ 0x18
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
	global	_menu_draw_input$1532
_menu_draw_input$1532:	; 2 bytes @ 0x1A
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
	global	_menu_draw_input$1536
_menu_draw_input$1536:	; 2 bytes @ 0x1C
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
	global	menu_draw_input@opts_1518
menu_draw_input@opts_1518:	; 2 bytes @ 0x24
	ds   2
	global	menu_draw_input@flag_1522
menu_draw_input@flag_1522:	; 2 bytes @ 0x26
	ds   2
	global	menu_draw_input@val_len_1526
menu_draw_input@val_len_1526:	; 1 bytes @ 0x28
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
	global	_handle_time_rotation$1284
_handle_time_rotation$1284:	; 2 bytes @ 0x32
	global	_rebuild_input_menu$1361
_rebuild_input_menu$1361:	; 2 bytes @ 0x32
	global	_handle_numeric_rotation$1457
_handle_numeric_rotation$1457:	; 2 bytes @ 0x32
	global	_rebuild_clock_menu$1579
_rebuild_clock_menu$1579:	; 2 bytes @ 0x32
	global	menu_update_time_value@debug_after
menu_update_time_value@debug_after:	; 50 bytes @ 0x32
	ds   2
	global	handle_time_rotation@direction
handle_time_rotation@direction:	; 1 bytes @ 0x34
	global	_rebuild_input_menu$1375
_rebuild_input_menu$1375:	; 2 bytes @ 0x34
	global	_handle_numeric_rotation$1459
_handle_numeric_rotation$1459:	; 2 bytes @ 0x34
	global	_rebuild_clock_menu$1585
_rebuild_clock_menu$1585:	; 2 bytes @ 0x34
	ds   2
	global	handle_numeric_rotation@max_tens
handle_numeric_rotation@max_tens:	; 1 bytes @ 0x36
	global	_rebuild_input_menu$1376
_rebuild_input_menu$1376:	; 2 bytes @ 0x36
	global	_rebuild_clock_menu$1586
_rebuild_clock_menu$1586:	; 2 bytes @ 0x36
	ds   1
	global	handle_numeric_rotation@max_units
handle_numeric_rotation@max_units:	; 1 bytes @ 0x37
	ds   1
	global	handle_numeric_rotation@direction
handle_numeric_rotation@direction:	; 1 bytes @ 0x38
	global	_rebuild_input_menu$1382
_rebuild_input_menu$1382:	; 2 bytes @ 0x38
	ds   2
	global	_rebuild_input_menu$1383
_rebuild_input_menu$1383:	; 2 bytes @ 0x3A
	ds   2
	global	trigger_relay_pulse@latch_mode
trigger_relay_pulse@latch_mode:	; 1 bytes @ 0x3C
	global	_rebuild_input_menu$1389
_rebuild_input_menu$1389:	; 2 bytes @ 0x3C
	ds   2
	global	_rebuild_input_menu$1390
_rebuild_input_menu$1390:	; 2 bytes @ 0x3E
	ds   2
	global	_rebuild_input_menu$1394
_rebuild_input_menu$1394:	; 2 bytes @ 0x40
	ds   2
	global	_rebuild_input_menu$1408
_rebuild_input_menu$1408:	; 2 bytes @ 0x42
	ds   2
	global	_rebuild_input_menu$1409
_rebuild_input_menu$1409:	; 2 bytes @ 0x44
	ds   2
	global	_rebuild_input_menu$1413
_rebuild_input_menu$1413:	; 2 bytes @ 0x46
	ds   2
	global	_rebuild_input_menu$1418
_rebuild_input_menu$1418:	; 2 bytes @ 0x48
	ds   2
	global	_rebuild_input_menu$1422
_rebuild_input_menu$1422:	; 2 bytes @ 0x4A
	ds   2
	global	_rebuild_input_menu$1428
_rebuild_input_menu$1428:	; 2 bytes @ 0x4C
	ds   2
	global	_rebuild_input_menu$1429
_rebuild_input_menu$1429:	; 2 bytes @ 0x4E
	ds   2
	global	_rebuild_input_menu$1433
_rebuild_input_menu$1433:	; 2 bytes @ 0x50
	global	rtc_set_time@data
rtc_set_time@data:	; 7 bytes @ 0x50
	global	rtc_read_time@data
rtc_read_time@data:	; 7 bytes @ 0x50
	ds   2
	global	rebuild_input_menu@flow_type_val
rebuild_input_menu@flow_type_val:	; 1 bytes @ 0x52
	ds   1
	global	rebuild_input_menu@sensor
rebuild_input_menu@sensor:	; 1 bytes @ 0x53
	ds   1
	global	_rebuild_input_menu$3241
_rebuild_input_menu$3241:	; 2 bytes @ 0x54
	ds   2
	global	_rebuild_input_menu$3242
_rebuild_input_menu$3242:	; 2 bytes @ 0x56
	ds   1
	global	rtc_set_time@i
rtc_set_time@i:	; 1 bytes @ 0x57
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
	global	_menu_handle_button$1781
_menu_handle_button$1781:	; 2 bytes @ 0x73
	ds   2
	global	menu_handle_button@edit_flag_1737
menu_handle_button@edit_flag_1737:	; 2 bytes @ 0x75
	ds   2
	global	menu_handle_button@opts_1738
menu_handle_button@opts_1738:	; 2 bytes @ 0x77
	ds   2
	global	menu_handle_button@edit_flag_1772
menu_handle_button@edit_flag_1772:	; 2 bytes @ 0x79
	ds   2
	global	menu_handle_button@current_val_1768
menu_handle_button@current_val_1768:	; 2 bytes @ 0x7B
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
?_menu_draw_utility:	; 1 bytes @ 0x0
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
?_handle_utility_numeric_rotation:	; 1 bytes @ 0x0
?_handle_datetime_rotation:	; 1 bytes @ 0x0
?_rebuild_utility_menu:	; 1 bytes @ 0x0
?_lcd_clear_line:	; 1 bytes @ 0x0
?_load_factory_defaults:	; 1 bytes @ 0x0
?_sync_menu_variables:	; 1 bytes @ 0x0
?_uart_init:	; 1 bytes @ 0x0
?_uart_write:	; 1 bytes @ 0x0
?_system_init:	; 1 bytes @ 0x0
?_trigger_relay_pulse:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_isr:	; 1 bytes @ 0x0
?_init_datetime_editor:	; 1 bytes @ 0x0
?_menu_update_datetime_display:	; 1 bytes @ 0x0
?_rebuild_input_menu:	; 1 bytes @ 0x0
?_rebuild_clock_menu:	; 1 bytes @ 0x0
?_lcd_write_nibble:	; 1 bytes @ 0x0
?_lcd_cmd:	; 1 bytes @ 0x0
?_lcd_data:	; 1 bytes @ 0x0
?_i2c_wait_idle:	; 1 bytes @ 0x0
?_i2c_start:	; 1 bytes @ 0x0
?_i2c_restart:	; 1 bytes @ 0x0
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
??_handle_datetime_rotation:	; 1 bytes @ 0xE
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
	global	handle_datetime_rotation@direction
handle_datetime_rotation@direction:	; 1 bytes @ 0xE
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
	global	_isdigit$2970
_isdigit$2970:	; 1 bytes @ 0xF
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
	global	_is_numeric_field$1244
_is_numeric_field$1244:	; 1 bytes @ 0x10
	global	_is_time_field$1251
_is_time_field$1251:	; 1 bytes @ 0x10
	global	_is_option_field$1256
_is_option_field$1256:	; 1 bytes @ 0x10
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
??_i2c_restart:	; 1 bytes @ 0x11
??_i2c_stop:	; 1 bytes @ 0x11
??_i2c_read:	; 1 bytes @ 0x11
	global	_is_numeric_field$1245
_is_numeric_field$1245:	; 1 bytes @ 0x11
	global	is_time_field@line
is_time_field@line:	; 1 bytes @ 0x11
	global	_is_option_field$1257
_is_option_field$1257:	; 1 bytes @ 0x11
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
	global	i2c_restart@timeout
i2c_restart@timeout:	; 2 bytes @ 0x11
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
	global	_is_numeric_field$1246
_is_numeric_field$1246:	; 1 bytes @ 0x12
	global	_is_option_field$1258
_is_option_field$1258:	; 1 bytes @ 0x12
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
	global	_is_option_field$1259
_is_option_field$1259:	; 1 bytes @ 0x13
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
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x15
	global	memcpy@d
memcpy@d:	; 2 bytes @ 0x15
	ds   1
?_rtc_read_register:	; 1 bytes @ 0x16
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
	global	rtc_read_register@value
rtc_read_register@value:	; 2 bytes @ 0x16
	ds   1
??_eeprom_write_block:	; 1 bytes @ 0x17
??___lwdiv:	; 1 bytes @ 0x17
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x17
	global	_menu_update_numeric_value$1483
_menu_update_numeric_value$1483:	; 2 bytes @ 0x17
	global	calculate_config_checksum@j_1947
calculate_config_checksum@j_1947:	; 2 bytes @ 0x17
	global	eeprom_write_block@ptr
eeprom_write_block@ptr:	; 2 bytes @ 0x17
	global	memcpy@s
memcpy@s:	; 2 bytes @ 0x17
	ds   1
??_rtc_read_register:	; 1 bytes @ 0x18
??_ad7994_read_channel:	; 1 bytes @ 0x18
??_lcd_print_at:	; 1 bytes @ 0x18
	global	lcd_print_at@row
lcd_print_at@row:	; 1 bytes @ 0x18
	global	rtc_read_register@reg
rtc_read_register@reg:	; 1 bytes @ 0x18
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
	global	_menu_update_numeric_value$1484
_menu_update_numeric_value$1484:	; 2 bytes @ 0x19
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
	global	_menu_update_numeric_value$1485
_menu_update_numeric_value$1485:	; 2 bytes @ 0x1B
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
	global	_menu_update_numeric_value$1486
_menu_update_numeric_value$1486:	; 2 bytes @ 0x1D
	global	ad7994_read_channel@result
ad7994_read_channel@result:	; 2 bytes @ 0x1D
	ds   1
??_eeprom_init:	; 1 bytes @ 0x1E
	global	init_numeric_editor@flow_type
init_numeric_editor@flow_type:	; 1 bytes @ 0x1E
	global	eeprom_init@stored_checksum
eeprom_init@stored_checksum:	; 2 bytes @ 0x1E
	global	menu_draw_clock@value_buf
menu_draw_clock@value_buf:	; 15 bytes @ 0x1E
	ds   1
	global	ad7994_read_channel@config_byte
ad7994_read_channel@config_byte:	; 1 bytes @ 0x1F
	global	_init_numeric_editor$1447
_init_numeric_editor$1447:	; 2 bytes @ 0x1F
	global	_menu_update_numeric_value$1487
_menu_update_numeric_value$1487:	; 2 bytes @ 0x1F
	ds   1
	global	eeprom_init@calculated_checksum
eeprom_init@calculated_checksum:	; 2 bytes @ 0x20
	ds   1
	global	init_numeric_editor@sensor_type
init_numeric_editor@sensor_type:	; 1 bytes @ 0x21
	global	_menu_update_numeric_value$1488
_menu_update_numeric_value$1488:	; 2 bytes @ 0x21
	ds   1
	global	eeprom_init@i
eeprom_init@i:	; 1 bytes @ 0x22
	global	init_numeric_editor@abs_val
init_numeric_editor@abs_val:	; 2 bytes @ 0x22
	ds   1
	global	_menu_update_numeric_value$1489
_menu_update_numeric_value$1489:	; 2 bytes @ 0x23
	global	_menu_draw_setup$1556
_menu_draw_setup$1556:	; 2 bytes @ 0x23
	ds   2
	global	_menu_update_numeric_value$1490
_menu_update_numeric_value$1490:	; 2 bytes @ 0x25
	global	_menu_draw_setup$1562
_menu_draw_setup$1562:	; 2 bytes @ 0x25
	ds   2
	global	_menu_update_numeric_value$1492
_menu_update_numeric_value$1492:	; 2 bytes @ 0x27
	global	_menu_draw_setup$1570
_menu_draw_setup$1570:	; 2 bytes @ 0x27
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
	global	_menu_draw_clock$1623
_menu_draw_clock$1623:	; 2 bytes @ 0x2F
	ds   1
	global	menu_update_numeric_value@screen_line
menu_update_numeric_value@screen_line:	; 1 bytes @ 0x30
	global	_sprintf$2527
_sprintf$2527:	; 2 bytes @ 0x30
	ds   1
	global	_menu_draw_clock$1627
_menu_draw_clock$1627:	; 2 bytes @ 0x31
	ds   1
	global	_sprintf$2528
_sprintf$2528:	; 2 bytes @ 0x32
	ds   1
	global	menu_draw_clock@val_len
menu_draw_clock@val_len:	; 1 bytes @ 0x33
	ds   1
	global	menu_draw_clock@val_len_1617
menu_draw_clock@val_len_1617:	; 1 bytes @ 0x34
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
??_rebuild_utility_menu:	; 1 bytes @ 0x40
?_rtc_set_time:	; 1 bytes @ 0x40
??_trigger_relay_pulse:	; 1 bytes @ 0x40
?_init_time_editor:	; 1 bytes @ 0x40
??_menu_update_datetime_display:	; 1 bytes @ 0x40
??_rebuild_input_menu:	; 1 bytes @ 0x40
??_rebuild_clock_menu:	; 1 bytes @ 0x40
	global	init_time_editor@value_seconds
init_time_editor@value_seconds:	; 2 bytes @ 0x40
	global	rtc_set_time@time
rtc_set_time@time:	; 2 bytes @ 0x40
	global	rtc_read_time@time
rtc_read_time@time:	; 2 bytes @ 0x40
	global	menu_update_datetime_display@date_buf
menu_update_datetime_display@date_buf:	; 9 bytes @ 0x40
	ds   2
??_rtc_read_time:	; 1 bytes @ 0x42
??_rtc_set_time:	; 1 bytes @ 0x42
??_init_datetime_editor:	; 1 bytes @ 0x42
	global	init_time_editor@mode
init_time_editor@mode:	; 1 bytes @ 0x42
	global	_rebuild_utility_menu$3243
_rebuild_utility_menu$3243:	; 2 bytes @ 0x42
	ds   1
??_init_time_editor:	; 1 bytes @ 0x43
	ds   1
	global	_rebuild_utility_menu$3244
_rebuild_utility_menu$3244:	; 2 bytes @ 0x44
	ds   2
	global	rebuild_utility_menu@i
rebuild_utility_menu@i:	; 1 bytes @ 0x46
	ds   1
??_handle_utility_numeric_rotation:	; 1 bytes @ 0x47
	global	handle_utility_numeric_rotation@direction
handle_utility_numeric_rotation@direction:	; 1 bytes @ 0x47
	ds   2
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
;!    Strings     3804
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
;!    BANK2           256    256     256
;!    BANK3           256    233     233
;!    BANK4           256    256     256
;!    BANK5           256     41     252
;!    BANK6           256      0     253
;!    BANK7           256     30     228
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
;!		 -> input_config(BIGRAM[384]), system_config(BANK7[128]), 
;!
;!    clock_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[9]), STR_102(CODE[9]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[8]), STR_109(CODE[11]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_113(CODE[7]), STR_114(CODE[7]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[6]), STR_117(CODE[10]), STR_118(CODE[11]), STR_119(CODE[9]), 
;!		 -> STR_120(CODE[12]), STR_121(CODE[8]), STR_122(CODE[8]), STR_123(CODE[5]), 
;!		 -> STR_124(CODE[7]), STR_125(CODE[8]), STR_126(CODE[10]), STR_127(CODE[8]), 
;!		 -> STR_128(CODE[5]), STR_129(CODE[10]), STR_130(CODE[9]), STR_131(CODE[10]), 
;!		 -> STR_132(CODE[12]), STR_133(CODE[9]), STR_134(CODE[9]), STR_135(CODE[11]), 
;!		 -> STR_136(CODE[11]), STR_137(CODE[5]), STR_82(CODE[7]), STR_83(CODE[7]), 
;!		 -> STR_84(CODE[10]), STR_85(CODE[11]), STR_86(CODE[12]), STR_87(CODE[9]), 
;!		 -> STR_88(CODE[13]), STR_89(CODE[6]), STR_90(CODE[6]), STR_91(CODE[9]), 
;!		 -> STR_92(CODE[8]), STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[5]), 
;!		 -> STR_96(CODE[7]), STR_97(CODE[7]), STR_98(CODE[10]), STR_99(CODE[11]), 
;!
;!    clock_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    clock_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[9]), STR_102(CODE[9]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[8]), STR_109(CODE[11]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_113(CODE[7]), STR_114(CODE[7]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[6]), STR_117(CODE[10]), STR_118(CODE[11]), STR_119(CODE[9]), 
;!		 -> STR_120(CODE[12]), STR_121(CODE[8]), STR_122(CODE[8]), STR_123(CODE[5]), 
;!		 -> STR_124(CODE[7]), STR_125(CODE[8]), STR_126(CODE[10]), STR_127(CODE[8]), 
;!		 -> STR_128(CODE[5]), STR_129(CODE[10]), STR_130(CODE[9]), STR_131(CODE[10]), 
;!		 -> STR_132(CODE[12]), STR_133(CODE[9]), STR_134(CODE[9]), STR_135(CODE[11]), 
;!		 -> STR_136(CODE[11]), STR_137(CODE[5]), STR_82(CODE[7]), STR_83(CODE[7]), 
;!		 -> STR_84(CODE[10]), STR_85(CODE[11]), STR_86(CODE[12]), STR_87(CODE[9]), 
;!		 -> STR_88(CODE[13]), STR_89(CODE[6]), STR_90(CODE[6]), STR_91(CODE[9]), 
;!		 -> STR_92(CODE[8]), STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[5]), 
;!		 -> STR_96(CODE[7]), STR_97(CODE[7]), STR_98(CODE[10]), STR_99(CODE[11]), 
;!
;!    clock_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    eeprom_read_block@data	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK7[128]), 
;!
;!    eeprom_read_block@ptr	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK7[128]), 
;!
;!    eeprom_write_block@data	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK7[128]), 
;!
;!    eeprom_write_block@ptr	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK7[128]), 
;!
;!    flow_analog_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[9]), STR_102(CODE[9]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[8]), STR_109(CODE[11]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_113(CODE[7]), STR_114(CODE[7]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[6]), STR_117(CODE[10]), STR_118(CODE[11]), STR_119(CODE[9]), 
;!		 -> STR_120(CODE[12]), STR_121(CODE[8]), STR_122(CODE[8]), STR_123(CODE[5]), 
;!		 -> STR_124(CODE[7]), STR_125(CODE[8]), STR_126(CODE[10]), STR_127(CODE[8]), 
;!		 -> STR_128(CODE[5]), STR_129(CODE[10]), STR_130(CODE[9]), STR_131(CODE[10]), 
;!		 -> STR_132(CODE[12]), STR_133(CODE[9]), STR_134(CODE[9]), STR_135(CODE[11]), 
;!		 -> STR_136(CODE[11]), STR_137(CODE[5]), STR_82(CODE[7]), STR_83(CODE[7]), 
;!		 -> STR_84(CODE[10]), STR_85(CODE[11]), STR_86(CODE[12]), STR_87(CODE[9]), 
;!		 -> STR_88(CODE[13]), STR_89(CODE[6]), STR_90(CODE[6]), STR_91(CODE[9]), 
;!		 -> STR_92(CODE[8]), STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[5]), 
;!		 -> STR_96(CODE[7]), STR_97(CODE[7]), STR_98(CODE[10]), STR_99(CODE[11]), 
;!
;!    flow_analog_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    flow_digital_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[9]), STR_102(CODE[9]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[8]), STR_109(CODE[11]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_113(CODE[7]), STR_114(CODE[7]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[6]), STR_117(CODE[10]), STR_118(CODE[11]), STR_119(CODE[9]), 
;!		 -> STR_120(CODE[12]), STR_121(CODE[8]), STR_122(CODE[8]), STR_123(CODE[5]), 
;!		 -> STR_124(CODE[7]), STR_125(CODE[8]), STR_126(CODE[10]), STR_127(CODE[8]), 
;!		 -> STR_128(CODE[5]), STR_129(CODE[10]), STR_130(CODE[9]), STR_131(CODE[10]), 
;!		 -> STR_132(CODE[12]), STR_133(CODE[9]), STR_134(CODE[9]), STR_135(CODE[11]), 
;!		 -> STR_136(CODE[11]), STR_137(CODE[5]), STR_82(CODE[7]), STR_83(CODE[7]), 
;!		 -> STR_84(CODE[10]), STR_85(CODE[11]), STR_86(CODE[12]), STR_87(CODE[9]), 
;!		 -> STR_88(CODE[13]), STR_89(CODE[6]), STR_90(CODE[6]), STR_91(CODE[9]), 
;!		 -> STR_92(CODE[8]), STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[5]), 
;!		 -> STR_96(CODE[7]), STR_97(CODE[7]), STR_98(CODE[10]), STR_99(CODE[11]), 
;!
;!    flow_digital_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    input_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[9]), STR_102(CODE[9]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[8]), STR_109(CODE[11]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_113(CODE[7]), STR_114(CODE[7]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[6]), STR_117(CODE[10]), STR_118(CODE[11]), STR_119(CODE[9]), 
;!		 -> STR_120(CODE[12]), STR_121(CODE[8]), STR_122(CODE[8]), STR_123(CODE[5]), 
;!		 -> STR_124(CODE[7]), STR_125(CODE[8]), STR_126(CODE[10]), STR_127(CODE[8]), 
;!		 -> STR_128(CODE[5]), STR_129(CODE[10]), STR_130(CODE[9]), STR_131(CODE[10]), 
;!		 -> STR_132(CODE[12]), STR_133(CODE[9]), STR_134(CODE[9]), STR_135(CODE[11]), 
;!		 -> STR_136(CODE[11]), STR_137(CODE[5]), STR_82(CODE[7]), STR_83(CODE[7]), 
;!		 -> STR_84(CODE[10]), STR_85(CODE[11]), STR_86(CODE[12]), STR_87(CODE[9]), 
;!		 -> STR_88(CODE[13]), STR_89(CODE[6]), STR_90(CODE[6]), STR_91(CODE[9]), 
;!		 -> STR_92(CODE[8]), STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[5]), 
;!		 -> STR_96(CODE[7]), STR_97(CODE[7]), STR_98(CODE[10]), STR_99(CODE[11]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    lcd_print@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> Fake(UNKNOWN), menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), 
;!		 -> menu_draw_utility@value_buf(BANK0[15]), menu_update_datetime_display@date_buf(COMRAM[9]), menu_update_datetime_display@time_buf(COMRAM[9]), menu_update_edit_value@display_buf(BANK0[10]), 
;!		 -> menu_update_numeric_value@value_buf(COMRAM[6]), menu_update_time_value@value_buf(BANK0[6]), STR_100(CODE[10]), STR_101(CODE[9]), 
;!		 -> STR_102(CODE[9]), STR_103(CODE[8]), STR_104(CODE[5]), STR_105(CODE[7]), 
;!		 -> STR_106(CODE[7]), STR_107(CODE[5]), STR_108(CODE[8]), STR_109(CODE[11]), 
;!		 -> STR_110(CODE[8]), STR_111(CODE[8]), STR_112(CODE[5]), STR_113(CODE[7]), 
;!		 -> STR_114(CODE[7]), STR_115(CODE[5]), STR_116(CODE[6]), STR_117(CODE[10]), 
;!		 -> STR_118(CODE[11]), STR_119(CODE[9]), STR_120(CODE[12]), STR_121(CODE[8]), 
;!		 -> STR_122(CODE[8]), STR_123(CODE[5]), STR_124(CODE[7]), STR_125(CODE[8]), 
;!		 -> STR_126(CODE[10]), STR_127(CODE[8]), STR_128(CODE[5]), STR_129(CODE[10]), 
;!		 -> STR_130(CODE[9]), STR_131(CODE[10]), STR_132(CODE[12]), STR_133(CODE[9]), 
;!		 -> STR_134(CODE[9]), STR_135(CODE[11]), STR_136(CODE[11]), STR_137(CODE[5]), 
;!		 -> STR_145(CODE[8]), STR_146(CODE[2]), STR_147(CODE[2]), STR_160(CODE[2]), 
;!		 -> STR_161(CODE[2]), STR_162(CODE[2]), STR_163(CODE[2]), STR_164(CODE[2]), 
;!		 -> STR_165(CODE[2]), STR_166(CODE[2]), STR_167(CODE[2]), STR_168(CODE[2]), 
;!		 -> STR_169(CODE[5]), STR_17(CODE[13]), STR_170(CODE[2]), STR_171(CODE[5]), 
;!		 -> STR_172(CODE[21]), STR_18(CODE[16]), STR_226(CODE[7]), STR_227(CODE[2]), 
;!		 -> STR_228(CODE[2]), STR_229(CODE[6]), STR_230(CODE[2]), STR_231(CODE[2]), 
;!		 -> STR_232(CODE[21]), STR_233(CODE[2]), STR_234(CODE[2]), STR_238(CODE[2]), 
;!		 -> STR_239(CODE[2]), STR_240(CODE[2]), STR_241(CODE[2]), STR_242(CODE[21]), 
;!		 -> STR_243(CODE[1]), STR_244(CODE[1]), STR_245(CODE[1]), STR_246(CODE[6]), 
;!		 -> STR_247(CODE[5]), STR_248(CODE[9]), STR_249(CODE[5]), STR_250(CODE[5]), 
;!		 -> STR_251(CODE[2]), STR_252(CODE[2]), STR_253(CODE[2]), STR_254(CODE[2]), 
;!		 -> STR_255(CODE[2]), STR_256(CODE[2]), STR_257(CODE[2]), STR_258(CODE[2]), 
;!		 -> STR_279(CODE[6]), STR_280(CODE[2]), STR_281(CODE[2]), STR_282(CODE[2]), 
;!		 -> STR_283(CODE[2]), STR_284(CODE[14]), STR_285(CODE[8]), STR_286(CODE[12]), 
;!		 -> STR_287(CODE[10]), STR_288(CODE[7]), STR_289(CODE[5]), STR_290(CODE[2]), 
;!		 -> STR_291(CODE[2]), STR_292(CODE[2]), STR_293(CODE[2]), STR_294(CODE[2]), 
;!		 -> STR_295(CODE[2]), STR_31(CODE[12]), STR_32(CODE[6]), STR_37(CODE[12]), 
;!		 -> STR_38(CODE[8]), STR_77(CODE[10]), STR_78(CODE[11]), STR_79(CODE[13]), 
;!		 -> STR_80(CODE[6]), STR_81(CODE[5]), STR_82(CODE[7]), STR_83(CODE[7]), 
;!		 -> STR_84(CODE[10]), STR_85(CODE[11]), STR_86(CODE[12]), STR_87(CODE[9]), 
;!		 -> STR_88(CODE[13]), STR_89(CODE[6]), STR_90(CODE[6]), STR_91(CODE[9]), 
;!		 -> STR_92(CODE[8]), STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[5]), 
;!		 -> STR_96(CODE[7]), STR_97(CODE[7]), STR_98(CODE[10]), STR_99(CODE[11]), 
;!
;!    lcd_print_at@str	PTR const unsigned char  size(2) Largest target is 15
;!		 -> Fake(UNKNOWN), menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), 
;!		 -> menu_draw_utility@value_buf(BANK0[15]), menu_update_datetime_display@date_buf(COMRAM[9]), menu_update_datetime_display@time_buf(COMRAM[9]), STR_100(CODE[10]), 
;!		 -> STR_101(CODE[9]), STR_102(CODE[9]), STR_103(CODE[8]), STR_104(CODE[5]), 
;!		 -> STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), STR_108(CODE[8]), 
;!		 -> STR_109(CODE[11]), STR_110(CODE[8]), STR_111(CODE[8]), STR_112(CODE[5]), 
;!		 -> STR_113(CODE[7]), STR_114(CODE[7]), STR_115(CODE[5]), STR_116(CODE[6]), 
;!		 -> STR_117(CODE[10]), STR_118(CODE[11]), STR_119(CODE[9]), STR_120(CODE[12]), 
;!		 -> STR_121(CODE[8]), STR_122(CODE[8]), STR_123(CODE[5]), STR_124(CODE[7]), 
;!		 -> STR_125(CODE[8]), STR_126(CODE[10]), STR_127(CODE[8]), STR_128(CODE[5]), 
;!		 -> STR_129(CODE[10]), STR_130(CODE[9]), STR_131(CODE[10]), STR_132(CODE[12]), 
;!		 -> STR_133(CODE[9]), STR_134(CODE[9]), STR_135(CODE[11]), STR_136(CODE[11]), 
;!		 -> STR_137(CODE[5]), STR_160(CODE[2]), STR_161(CODE[2]), STR_162(CODE[2]), 
;!		 -> STR_163(CODE[2]), STR_164(CODE[2]), STR_165(CODE[2]), STR_166(CODE[2]), 
;!		 -> STR_167(CODE[2]), STR_168(CODE[2]), STR_169(CODE[5]), STR_170(CODE[2]), 
;!		 -> STR_171(CODE[5]), STR_243(CODE[1]), STR_244(CODE[1]), STR_245(CODE[1]), 
;!		 -> STR_246(CODE[6]), STR_247(CODE[5]), STR_248(CODE[9]), STR_249(CODE[5]), 
;!		 -> STR_250(CODE[5]), STR_279(CODE[6]), STR_284(CODE[14]), STR_285(CODE[8]), 
;!		 -> STR_286(CODE[12]), STR_287(CODE[10]), STR_288(CODE[7]), STR_289(CODE[5]), 
;!		 -> STR_290(CODE[2]), STR_291(CODE[2]), STR_77(CODE[10]), STR_78(CODE[11]), 
;!		 -> STR_79(CODE[13]), STR_80(CODE[6]), STR_81(CODE[5]), STR_82(CODE[7]), 
;!		 -> STR_83(CODE[7]), STR_84(CODE[10]), STR_85(CODE[11]), STR_86(CODE[12]), 
;!		 -> STR_87(CODE[9]), STR_88(CODE[13]), STR_89(CODE[6]), STR_90(CODE[6]), 
;!		 -> STR_91(CODE[9]), STR_92(CODE[8]), STR_93(CODE[8]), STR_94(CODE[8]), 
;!		 -> STR_95(CODE[5]), STR_96(CODE[7]), STR_97(CODE[7]), STR_98(CODE[10]), 
;!		 -> STR_99(CODE[11]), 
;!
;!    memcpy@d	PTR unsigned char  size(2) Largest target is 384
;!		 -> clock_menu(BANK5[25]), input_config(BIGRAM[384]), input_menu(BANK5[75]), system_config(BANK7[128]), 
;!
;!    memcpy@d1	PTR void  size(2) Largest target is 384
;!		 -> clock_menu(BANK5[25]), input_config(BIGRAM[384]), input_menu(BANK5[75]), system_config(BANK7[128]), 
;!
;!    memcpy@s	PTR const unsigned char  size(2) Largest target is 384
;!		 -> clock_menu_template(CODE[25]), factory_defaults(CODE[384]), flow_analog_template(CODE[55]), flow_digital_template(CODE[40]), 
;!		 -> pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    memcpy@s1	PTR const void  size(2) Largest target is 384
;!		 -> clock_menu_template(CODE[25]), factory_defaults(CODE[384]), flow_analog_template(CODE[55]), flow_digital_template(CODE[40]), 
;!		 -> pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    menu_draw_clock$1623	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_280(CODE[2]), STR_281(CODE[2]), 
;!
;!    menu_draw_clock$1627	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_282(CODE[2]), STR_283(CODE[2]), 
;!
;!    menu_draw_input$1532	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_238(CODE[2]), STR_239(CODE[2]), 
;!
;!    menu_draw_input$1536	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_240(CODE[2]), STR_241(CODE[2]), 
;!
;!    menu_draw_input@flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@flag_1522	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), STR_45(CODE[1]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), STR_49(CODE[5]), 
;!		 -> STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), STR_53(CODE[8]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[4]), 
;!		 -> STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), STR_65(CODE[1]), 
;!		 -> STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), 
;!
;!    menu_draw_input@opts_1518	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts_1518$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), STR_45(CODE[1]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), STR_49(CODE[5]), 
;!		 -> STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), STR_53(CODE[8]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[4]), 
;!		 -> STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), STR_65(CODE[1]), 
;!		 -> STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), 
;!
;!    menu_draw_setup$1556	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_249(CODE[5]), STR_250(CODE[5]), 
;!
;!    menu_draw_setup$1562	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_253(CODE[2]), STR_254(CODE[2]), 
;!
;!    menu_draw_setup$1570	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_257(CODE[2]), STR_258(CODE[2]), 
;!
;!    menu_draw_setup@F2715	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_243(CODE[1]), STR_244(CODE[1]), STR_245(CODE[1]), STR_246(CODE[6]), 
;!		 -> STR_247(CODE[5]), 
;!
;!    menu_draw_setup@label	PTR const unsigned char  size(2) Largest target is 6
;!		 -> STR_243(CODE[1]), STR_244(CODE[1]), STR_245(CODE[1]), STR_246(CODE[6]), 
;!		 -> STR_247(CODE[5]), 
;!
;!    menu_draw_setup@sensor_name	PTR const unsigned char  size(2) Largest target is 9
;!		 -> Fake(UNKNOWN), STR_248(CODE[9]), STR_249(CODE[5]), STR_250(CODE[5]), 
;!
;!    menu_draw_setup@setup_labels	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_243(CODE[1]), STR_244(CODE[1]), STR_245(CODE[1]), STR_246(CODE[6]), 
;!		 -> STR_247(CODE[5]), 
;!
;!    menu_draw_utility$1651	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_292(CODE[2]), STR_293(CODE[2]), 
;!
;!    menu_draw_utility$1655	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_294(CODE[2]), STR_295(CODE[2]), 
;!
;!    menu_handle_button@edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1737	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1772	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), STR_45(CODE[1]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), STR_49(CODE[5]), 
;!		 -> STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), STR_53(CODE[8]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[4]), 
;!		 -> STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), STR_65(CODE[1]), 
;!		 -> STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), 
;!
;!    menu_handle_button@opts_1738	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1738$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), STR_45(CODE[1]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), STR_49(CODE[5]), 
;!		 -> STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), STR_53(CODE[8]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[4]), 
;!		 -> STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), STR_65(CODE[1]), 
;!		 -> STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), 
;!
;!    menu_handle_button@opts_1773	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1773$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), STR_45(CODE[1]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), STR_49(CODE[5]), 
;!		 -> STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), STR_53(CODE[8]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[4]), 
;!		 -> STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), STR_65(CODE[1]), 
;!		 -> STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), 
;!
;!    menu_handle_encoder$3245	const PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), STR_45(CODE[1]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), STR_49(CODE[5]), 
;!		 -> STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), STR_53(CODE[8]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[4]), 
;!		 -> STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), STR_65(CODE[1]), 
;!		 -> STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), 
;!
;!    menu_handle_encoder@clock_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@clock_opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@clock_opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), STR_45(CODE[1]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), STR_49(CODE[5]), 
;!		 -> STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), STR_53(CODE[8]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[4]), 
;!		 -> STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), STR_65(CODE[1]), 
;!		 -> STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), 
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
;!		 -> STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), STR_45(CODE[1]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), STR_49(CODE[5]), 
;!		 -> STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), STR_53(CODE[8]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[4]), 
;!		 -> STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), STR_65(CODE[1]), 
;!		 -> STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), 
;!
;!    menu_item_options$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), STR_45(CODE[1]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), STR_49(CODE[5]), 
;!		 -> STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), STR_53(CODE[8]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[4]), 
;!		 -> STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), STR_65(CODE[1]), 
;!		 -> STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), 
;!
;!    options_menu	PTR const unsigned char [5] size(2) Largest target is 13
;!		 -> STR_77(CODE[10]), STR_78(CODE[11]), STR_79(CODE[13]), STR_80(CODE[6]), 
;!		 -> STR_81(CODE[5]), 
;!
;!    pressure_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[9]), STR_102(CODE[9]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[8]), STR_109(CODE[11]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_113(CODE[7]), STR_114(CODE[7]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[6]), STR_117(CODE[10]), STR_118(CODE[11]), STR_119(CODE[9]), 
;!		 -> STR_120(CODE[12]), STR_121(CODE[8]), STR_122(CODE[8]), STR_123(CODE[5]), 
;!		 -> STR_124(CODE[7]), STR_125(CODE[8]), STR_126(CODE[10]), STR_127(CODE[8]), 
;!		 -> STR_128(CODE[5]), STR_129(CODE[10]), STR_130(CODE[9]), STR_131(CODE[10]), 
;!		 -> STR_132(CODE[12]), STR_133(CODE[9]), STR_134(CODE[9]), STR_135(CODE[11]), 
;!		 -> STR_136(CODE[11]), STR_137(CODE[5]), STR_82(CODE[7]), STR_83(CODE[7]), 
;!		 -> STR_84(CODE[10]), STR_85(CODE[11]), STR_86(CODE[12]), STR_87(CODE[9]), 
;!		 -> STR_88(CODE[13]), STR_89(CODE[6]), STR_90(CODE[6]), STR_91(CODE[9]), 
;!		 -> STR_92(CODE[8]), STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[5]), 
;!		 -> STR_96(CODE[7]), STR_97(CODE[7]), STR_98(CODE[10]), STR_99(CODE[11]), 
;!
;!    pressure_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    rebuild_clock_menu$1579	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_261(CODE[8]), STR_262(CODE[9]), 
;!
;!    rebuild_clock_menu$1585	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_263(CODE[6]), STR_264(CODE[6]), STR_265(CODE[9]), 
;!
;!    rebuild_clock_menu$1586	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_264(CODE[6]), STR_265(CODE[9]), 
;!
;!    rebuild_input_menu$1361	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_174(CODE[8]), STR_175(CODE[9]), 
;!
;!    rebuild_input_menu$1375	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_184(CODE[6]), STR_185(CODE[6]), STR_186(CODE[9]), 
;!
;!    rebuild_input_menu$1376	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_185(CODE[6]), STR_186(CODE[9]), 
;!
;!    rebuild_input_menu$1382	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_187(CODE[6]), STR_188(CODE[6]), STR_189(CODE[9]), 
;!
;!    rebuild_input_menu$1383	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_188(CODE[6]), STR_189(CODE[9]), 
;!
;!    rebuild_input_menu$1389	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_190(CODE[6]), STR_191(CODE[6]), STR_192(CODE[9]), 
;!
;!    rebuild_input_menu$1390	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_191(CODE[6]), STR_192(CODE[9]), 
;!
;!    rebuild_input_menu$1394	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_193(CODE[5]), STR_194(CODE[5]), 
;!
;!    rebuild_input_menu$1408	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_200(CODE[6]), STR_201(CODE[6]), STR_202(CODE[9]), 
;!
;!    rebuild_input_menu$1409	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_201(CODE[6]), STR_202(CODE[9]), 
;!
;!    rebuild_input_menu$1413	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_203(CODE[5]), STR_204(CODE[5]), 
;!
;!    rebuild_input_menu$1418	PTR const unsigned char  size(2) Largest target is 8
;!		 -> STR_206(CODE[7]), STR_207(CODE[8]), 
;!
;!    rebuild_input_menu$1422	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_208(CODE[5]), STR_209(CODE[5]), 
;!
;!    rebuild_input_menu$1428	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_210(CODE[6]), STR_211(CODE[6]), STR_212(CODE[9]), 
;!
;!    rebuild_input_menu$1429	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_211(CODE[6]), STR_212(CODE[9]), 
;!
;!    rebuild_input_menu$1433	PTR const unsigned char  size(2) Largest target is 4
;!		 -> STR_213(CODE[2]), STR_214(CODE[4]), 
;!
;!    rtc_read_register@value	PTR unsigned char  size(2) Largest target is 1
;!		 -> main@status(BANK5[1]), 
;!
;!    rtc_read_time@time	PTR struct . size(2) Largest target is 7
;!		 -> init_datetime_editor@current_time(BANK1[7]), main@current_time(BANK5[7]), menu_handle_button@verify_time(BANK3[7]), 
;!
;!    rtc_set_time@time	PTR struct . size(2) Largest target is 7
;!		 -> menu_handle_button@new_time(BANK3[7]), 
;!
;!    S952$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), STR_45(CODE[1]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), STR_49(CODE[5]), 
;!		 -> STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), STR_53(CODE[8]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[4]), 
;!		 -> STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), STR_65(CODE[1]), 
;!		 -> STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), 
;!
;!    S956$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[9]), STR_102(CODE[9]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[8]), STR_109(CODE[11]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_113(CODE[7]), STR_114(CODE[7]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[6]), STR_117(CODE[10]), STR_118(CODE[11]), STR_119(CODE[9]), 
;!		 -> STR_120(CODE[12]), STR_121(CODE[8]), STR_122(CODE[8]), STR_123(CODE[5]), 
;!		 -> STR_124(CODE[7]), STR_125(CODE[8]), STR_126(CODE[10]), STR_127(CODE[8]), 
;!		 -> STR_128(CODE[5]), STR_129(CODE[10]), STR_130(CODE[9]), STR_131(CODE[10]), 
;!		 -> STR_132(CODE[12]), STR_133(CODE[9]), STR_134(CODE[9]), STR_135(CODE[11]), 
;!		 -> STR_136(CODE[11]), STR_137(CODE[5]), STR_82(CODE[7]), STR_83(CODE[7]), 
;!		 -> STR_84(CODE[10]), STR_85(CODE[11]), STR_86(CODE[12]), STR_87(CODE[9]), 
;!		 -> STR_88(CODE[13]), STR_89(CODE[6]), STR_90(CODE[6]), STR_91(CODE[9]), 
;!		 -> STR_92(CODE[8]), STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[5]), 
;!		 -> STR_96(CODE[7]), STR_97(CODE[7]), STR_98(CODE[10]), STR_99(CODE[11]), 
;!
;!    S956$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
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
;!		 -> clock_menu(BANK5[25]), input_config(BIGRAM[384]), input_menu(BANK5[75]), system_config(BANK7[128]), 
;!
;!    sp__strcpy	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_draw_utility@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), 
;!		 -> original_value(BANK6[10]), STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), 
;!		 -> STR_273(CODE[1]), value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), 
;!		 -> value_clock_enable(BANK6[10]), value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), 
;!		 -> value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), 
;!		 -> value_high_tbp(BANK7[10]), value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), 
;!		 -> value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), 
;!		 -> value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), 
;!		 -> value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), 
;!		 -> value_rlyslp(BANK6[10]), value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), 
;!		 -> value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 12
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), menu_item_options$option_count(CODE[1]), menu_update_time_value@value_buf(BANK0[6]), 
;!		 -> relay_high_edit_flag(COMRAM[1]), ?_sprintf(COMRAM[2]), sprintf@c(COMRAM[1]), STR_174(CODE[8]), 
;!		 -> STR_175(CODE[9]), STR_261(CODE[8]), STR_262(CODE[9]), STR_270(CODE[1]), 
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_366(CODE[7]), 
;!		 -> STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), STR_45(CODE[1]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), STR_49(CODE[5]), 
;!		 -> STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), STR_53(CODE[8]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[4]), 
;!		 -> STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), STR_65(CODE[1]), 
;!		 -> STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), value_back(BANK5[5]), 
;!		 -> value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), value_contrast(BANK5[4]), 
;!		 -> value_display(BANK5[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), 
;!		 -> value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), value_high_temp(BANK6[10]), 
;!		 -> value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), 
;!		 -> value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), 
;!		 -> value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), 
;!		 -> value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), value_scale20(BANK6[10]), 
;!		 -> value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 51
;!		 -> STR_1(CODE[48]), STR_11(CODE[28]), STR_138(CODE[35]), STR_14(CODE[28]), 
;!		 -> STR_140(CODE[45]), STR_141(CODE[25]), STR_142(CODE[3]), STR_143(CODE[51]), 
;!		 -> STR_144(CODE[27]), STR_148(CODE[47]), STR_150(CODE[13]), STR_151(CODE[13]), 
;!		 -> STR_152(CODE[13]), STR_153(CODE[15]), STR_154(CODE[15]), STR_155(CODE[13]), 
;!		 -> STR_156(CODE[13]), STR_157(CODE[13]), STR_158(CODE[15]), STR_159(CODE[15]), 
;!		 -> STR_173(CODE[3]), STR_177(CODE[6]), STR_178(CODE[6]), STR_179(CODE[5]), 
;!		 -> STR_180(CODE[10]), STR_181(CODE[5]), STR_182(CODE[10]), STR_183(CODE[10]), 
;!		 -> STR_196(CODE[6]), STR_197(CODE[6]), STR_198(CODE[3]), STR_199(CODE[10]), 
;!		 -> STR_215(CODE[6]), STR_216(CODE[6]), STR_217(CODE[5]), STR_218(CODE[10]), 
;!		 -> STR_220(CODE[10]), STR_221(CODE[48]), STR_223(CODE[29]), STR_224(CODE[7]), 
;!		 -> STR_225(CODE[9]), STR_235(CODE[9]), STR_25(CODE[37]), STR_259(CODE[35]), 
;!		 -> STR_260(CODE[3]), STR_266(CODE[10]), STR_268(CODE[46]), STR_269(CODE[29]), 
;!		 -> STR_27(CODE[17]), STR_274(CODE[3]), STR_275(CODE[10]), STR_276(CODE[3]), 
;!		 -> STR_277(CODE[3]), STR_278(CODE[10]), STR_28(CODE[35]), STR_29(CODE[23]), 
;!		 -> STR_296(CODE[37]), STR_297(CODE[23]), STR_298(CODE[32]), STR_299(CODE[37]), 
;!		 -> STR_3(CODE[27]), STR_30(CODE[17]), STR_300(CODE[28]), STR_301(CODE[35]), 
;!		 -> STR_302(CODE[26]), STR_303(CODE[20]), STR_304(CODE[25]), STR_305(CODE[28]), 
;!		 -> STR_306(CODE[26]), STR_307(CODE[10]), STR_308(CODE[10]), STR_309(CODE[32]), 
;!		 -> STR_310(CODE[42]), STR_311(CODE[32]), STR_312(CODE[34]), STR_313(CODE[45]), 
;!		 -> STR_315(CODE[44]), STR_319(CODE[26]), STR_320(CODE[10]), STR_322(CODE[6]), 
;!		 -> STR_323(CODE[6]), STR_324(CODE[5]), STR_325(CODE[5]), STR_326(CODE[6]), 
;!		 -> STR_327(CODE[6]), STR_328(CODE[5]), STR_329(CODE[6]), STR_330(CODE[6]), 
;!		 -> STR_331(CODE[5]), STR_333(CODE[38]), STR_334(CODE[32]), STR_341(CODE[46]), 
;!		 -> STR_347(CODE[28]), STR_353(CODE[50]), STR_354(CODE[40]), STR_6(CODE[39]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(BANK1[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK4[50]), main@buf_628(BANK4[50]), main@buf_633(BANK5[30]), main@buf_667(BANK4[50]), 
;!		 -> main@buf_672(BANK4[60]), main@buf_675(BANK4[40]), main@buf_714(BANK7[30]), main@time_buf(BANK3[60]), 
;!		 -> menu_draw_input@title(BANK0[10]), menu_handle_button@buf(BANK3[50]), menu_handle_button@buf_1707(BANK2[50]), menu_handle_button@buf_1709(BANK2[50]), 
;!		 -> menu_handle_button@buf_1711(BANK1[80]), menu_handle_button@buf_1730(BANK1[80]), menu_handle_button@buf_1743(BANK2[50]), menu_handle_button@buf_1769(BANK2[50]), 
;!		 -> menu_handle_button@buf_1779(BANK2[50]), menu_handle_button@buf_1788(BANK3[50]), menu_handle_button@buf_1796(BANK3[50]), menu_handle_encoder@buf(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1677(BANK1[50]), menu_handle_encoder@buf_1680(BANK1[50]), menu_update_datetime_display@date_buf(COMRAM[9]), menu_update_datetime_display@time_buf(COMRAM[9]), 
;!		 -> menu_update_edit_value@value_buf(BANK0[10]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), 
;!		 -> rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), rtc_set_time@buf(BANK0[80]), STR_270(CODE[1]), 
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), trigger_relay_pulse@buf(BANK0[60]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_237(CODE[1]), STR_336(CODE[8]), STR_337(CODE[6]), STR_338(CODE[6]), 
;!		 -> STR_339(CODE[5]), STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), 
;!		 -> STR_45(CODE[1]), STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), 
;!		 -> STR_49(CODE[5]), STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), 
;!		 -> STR_53(CODE[8]), STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), 
;!		 -> STR_57(CODE[4]), STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), 
;!		 -> STR_61(CODE[1]), STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[1]), STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), 
;!		 -> STR_73(CODE[6]), STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), 
;!
;!    strcpy@cp	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_draw_utility@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), 
;!		 -> original_value(BANK6[10]), STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), 
;!		 -> STR_273(CODE[1]), value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), 
;!		 -> value_clock_enable(BANK6[10]), value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), 
;!		 -> value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), 
;!		 -> value_high_tbp(BANK7[10]), value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), 
;!		 -> value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), 
;!		 -> value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), 
;!		 -> value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), 
;!		 -> value_rlyslp(BANK6[10]), value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), 
;!		 -> value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 12
;!		 -> menu_update_edit_value@value_buf(BANK0[10]), STR_176(CODE[9]), STR_184(CODE[6]), STR_185(CODE[6]), 
;!		 -> STR_186(CODE[9]), STR_187(CODE[6]), STR_188(CODE[6]), STR_189(CODE[9]), 
;!		 -> STR_190(CODE[6]), STR_191(CODE[6]), STR_192(CODE[9]), STR_193(CODE[5]), 
;!		 -> STR_194(CODE[5]), STR_195(CODE[5]), STR_200(CODE[6]), STR_201(CODE[6]), 
;!		 -> STR_202(CODE[9]), STR_203(CODE[5]), STR_204(CODE[5]), STR_205(CODE[5]), 
;!		 -> STR_206(CODE[7]), STR_207(CODE[8]), STR_208(CODE[5]), STR_209(CODE[5]), 
;!		 -> STR_210(CODE[6]), STR_211(CODE[6]), STR_212(CODE[9]), STR_213(CODE[2]), 
;!		 -> STR_214(CODE[4]), STR_219(CODE[4]), STR_236(CODE[6]), STR_263(CODE[6]), 
;!		 -> STR_264(CODE[6]), STR_265(CODE[9]), STR_267(CODE[5]), STR_270(CODE[1]), 
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_42(CODE[9]), 
;!		 -> STR_43(CODE[8]), STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[9]), STR_48(CODE[5]), STR_49(CODE[5]), STR_50(CODE[1]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[7]), STR_53(CODE[8]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[4]), STR_58(CODE[5]), 
;!		 -> STR_59(CODE[1]), STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[2]), 
;!		 -> STR_63(CODE[4]), STR_64(CODE[1]), STR_65(CODE[1]), STR_66(CODE[1]), 
;!		 -> STR_67(CODE[5]), STR_68(CODE[5]), STR_69(CODE[1]), STR_70(CODE[1]), 
;!		 -> STR_71(CODE[1]), STR_72(CODE[6]), STR_73(CODE[6]), STR_74(CODE[9]), 
;!		 -> STR_75(CODE[1]), STR_76(CODE[1]), value_back(BANK5[5]), value_brightness(BANK5[4]), 
;!		 -> value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), value_contrast(BANK5[4]), value_display(BANK5[10]), 
;!		 -> value_enable(BANK6[10]), value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), 
;!		 -> value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), value_high_temp(BANK6[10]), value_highbp(BANK6[10]), 
;!		 -> value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), 
;!		 -> value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), 
;!		 -> value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), 
;!		 -> value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), value_scale20(BANK6[10]), value_scale4(BANK6[10]), 
;!		 -> value_sensor(BANK6[12]), value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    strcpy@to	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_draw_utility@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), 
;!		 -> original_value(BANK6[10]), STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), 
;!		 -> STR_273(CODE[1]), value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), 
;!		 -> value_clock_enable(BANK6[10]), value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), 
;!		 -> value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), 
;!		 -> value_high_tbp(BANK7[10]), value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), 
;!		 -> value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), 
;!		 -> value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), 
;!		 -> value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), 
;!		 -> value_rlyslp(BANK6[10]), value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), 
;!		 -> value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    strlen@cp	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_100(CODE[10]), 
;!		 -> STR_101(CODE[9]), STR_102(CODE[9]), STR_103(CODE[8]), STR_104(CODE[5]), 
;!		 -> STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), STR_108(CODE[8]), 
;!		 -> STR_109(CODE[11]), STR_110(CODE[8]), STR_111(CODE[8]), STR_112(CODE[5]), 
;!		 -> STR_113(CODE[7]), STR_114(CODE[7]), STR_115(CODE[5]), STR_116(CODE[6]), 
;!		 -> STR_117(CODE[10]), STR_118(CODE[11]), STR_119(CODE[9]), STR_120(CODE[12]), 
;!		 -> STR_121(CODE[8]), STR_122(CODE[8]), STR_123(CODE[5]), STR_124(CODE[7]), 
;!		 -> STR_125(CODE[8]), STR_126(CODE[10]), STR_127(CODE[8]), STR_128(CODE[5]), 
;!		 -> STR_129(CODE[10]), STR_130(CODE[9]), STR_131(CODE[10]), STR_132(CODE[12]), 
;!		 -> STR_133(CODE[9]), STR_134(CODE[9]), STR_135(CODE[11]), STR_136(CODE[11]), 
;!		 -> STR_137(CODE[5]), STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), 
;!		 -> STR_273(CODE[1]), STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), 
;!		 -> STR_45(CODE[1]), STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), 
;!		 -> STR_49(CODE[5]), STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), 
;!		 -> STR_53(CODE[8]), STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), 
;!		 -> STR_57(CODE[4]), STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), 
;!		 -> STR_61(CODE[1]), STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[1]), STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), 
;!		 -> STR_73(CODE[6]), STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), 
;!		 -> STR_82(CODE[7]), STR_83(CODE[7]), STR_84(CODE[10]), STR_85(CODE[11]), 
;!		 -> STR_86(CODE[12]), STR_87(CODE[9]), STR_88(CODE[13]), STR_89(CODE[6]), 
;!		 -> STR_90(CODE[6]), STR_91(CODE[9]), STR_92(CODE[8]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[8]), STR_95(CODE[5]), STR_96(CODE[7]), STR_97(CODE[7]), 
;!		 -> STR_98(CODE[10]), STR_99(CODE[11]), value_back(BANK5[5]), value_brightness(BANK5[4]), 
;!		 -> value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), value_contrast(BANK5[4]), value_display(BANK5[10]), 
;!		 -> value_enable(BANK6[10]), value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), 
;!		 -> value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), value_high_temp(BANK6[10]), value_highbp(BANK6[10]), 
;!		 -> value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), 
;!		 -> value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), 
;!		 -> value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), 
;!		 -> value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), value_scale20(BANK6[10]), value_scale4(BANK6[10]), 
;!		 -> value_sensor(BANK6[12]), value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    strlen@s	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_100(CODE[10]), 
;!		 -> STR_101(CODE[9]), STR_102(CODE[9]), STR_103(CODE[8]), STR_104(CODE[5]), 
;!		 -> STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), STR_108(CODE[8]), 
;!		 -> STR_109(CODE[11]), STR_110(CODE[8]), STR_111(CODE[8]), STR_112(CODE[5]), 
;!		 -> STR_113(CODE[7]), STR_114(CODE[7]), STR_115(CODE[5]), STR_116(CODE[6]), 
;!		 -> STR_117(CODE[10]), STR_118(CODE[11]), STR_119(CODE[9]), STR_120(CODE[12]), 
;!		 -> STR_121(CODE[8]), STR_122(CODE[8]), STR_123(CODE[5]), STR_124(CODE[7]), 
;!		 -> STR_125(CODE[8]), STR_126(CODE[10]), STR_127(CODE[8]), STR_128(CODE[5]), 
;!		 -> STR_129(CODE[10]), STR_130(CODE[9]), STR_131(CODE[10]), STR_132(CODE[12]), 
;!		 -> STR_133(CODE[9]), STR_134(CODE[9]), STR_135(CODE[11]), STR_136(CODE[11]), 
;!		 -> STR_137(CODE[5]), STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), 
;!		 -> STR_273(CODE[1]), STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), 
;!		 -> STR_45(CODE[1]), STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), 
;!		 -> STR_49(CODE[5]), STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), 
;!		 -> STR_53(CODE[8]), STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), 
;!		 -> STR_57(CODE[4]), STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), 
;!		 -> STR_61(CODE[1]), STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), 
;!		 -> STR_65(CODE[1]), STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), 
;!		 -> STR_69(CODE[1]), STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), 
;!		 -> STR_73(CODE[6]), STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), 
;!		 -> STR_82(CODE[7]), STR_83(CODE[7]), STR_84(CODE[10]), STR_85(CODE[11]), 
;!		 -> STR_86(CODE[12]), STR_87(CODE[9]), STR_88(CODE[13]), STR_89(CODE[6]), 
;!		 -> STR_90(CODE[6]), STR_91(CODE[9]), STR_92(CODE[8]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[8]), STR_95(CODE[5]), STR_96(CODE[7]), STR_97(CODE[7]), 
;!		 -> STR_98(CODE[10]), STR_99(CODE[11]), value_back(BANK5[5]), value_brightness(BANK5[4]), 
;!		 -> value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), value_contrast(BANK5[4]), value_display(BANK5[10]), 
;!		 -> value_enable(BANK6[10]), value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), 
;!		 -> value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), value_high_temp(BANK6[10]), value_highbp(BANK6[10]), 
;!		 -> value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), 
;!		 -> value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), 
;!		 -> value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), 
;!		 -> value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), value_scale20(BANK6[10]), value_scale4(BANK6[10]), 
;!		 -> value_sensor(BANK6[12]), value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    temp_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[9]), STR_102(CODE[9]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[8]), STR_109(CODE[11]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_113(CODE[7]), STR_114(CODE[7]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[6]), STR_117(CODE[10]), STR_118(CODE[11]), STR_119(CODE[9]), 
;!		 -> STR_120(CODE[12]), STR_121(CODE[8]), STR_122(CODE[8]), STR_123(CODE[5]), 
;!		 -> STR_124(CODE[7]), STR_125(CODE[8]), STR_126(CODE[10]), STR_127(CODE[8]), 
;!		 -> STR_128(CODE[5]), STR_129(CODE[10]), STR_130(CODE[9]), STR_131(CODE[10]), 
;!		 -> STR_132(CODE[12]), STR_133(CODE[9]), STR_134(CODE[9]), STR_135(CODE[11]), 
;!		 -> STR_136(CODE[11]), STR_137(CODE[5]), STR_82(CODE[7]), STR_83(CODE[7]), 
;!		 -> STR_84(CODE[10]), STR_85(CODE[11]), STR_86(CODE[12]), STR_87(CODE[9]), 
;!		 -> STR_88(CODE[13]), STR_89(CODE[6]), STR_90(CODE[6]), STR_91(CODE[9]), 
;!		 -> STR_92(CODE[8]), STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[5]), 
;!		 -> STR_96(CODE[7]), STR_97(CODE[7]), STR_98(CODE[10]), STR_99(CODE[11]), 
;!
;!    temp_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(BANK1[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK4[50]), main@buf_628(BANK4[50]), main@buf_633(BANK5[30]), main@buf_667(BANK4[50]), 
;!		 -> main@buf_672(BANK4[60]), main@buf_675(BANK4[40]), main@buf_714(BANK7[30]), main@time_buf(BANK3[60]), 
;!		 -> menu_handle_button@buf(BANK3[50]), menu_handle_button@buf_1707(BANK2[50]), menu_handle_button@buf_1709(BANK2[50]), menu_handle_button@buf_1711(BANK1[80]), 
;!		 -> menu_handle_button@buf_1730(BANK1[80]), menu_handle_button@buf_1743(BANK2[50]), menu_handle_button@buf_1769(BANK2[50]), menu_handle_button@buf_1779(BANK2[50]), 
;!		 -> menu_handle_button@buf_1788(BANK3[50]), menu_handle_button@buf_1796(BANK3[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1677(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1680(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), 
;!		 -> rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), rtc_set_time@buf(BANK0[80]), STR_10(CODE[42]), 
;!		 -> STR_12(CODE[38]), STR_13(CODE[34]), STR_139(CODE[29]), STR_149(CODE[26]), 
;!		 -> STR_15(CODE[28]), STR_16(CODE[23]), STR_19(CODE[22]), STR_2(CODE[42]), 
;!		 -> STR_20(CODE[19]), STR_21(CODE[24]), STR_22(CODE[22]), STR_222(CODE[31]), 
;!		 -> STR_23(CODE[22]), STR_24(CODE[19]), STR_26(CODE[16]), STR_314(CODE[36]), 
;!		 -> STR_316(CODE[16]), STR_317(CODE[27]), STR_318(CODE[24]), STR_321(CODE[27]), 
;!		 -> STR_33(CODE[22]), STR_332(CODE[53]), STR_335(CODE[25]), STR_34(CODE[20]), 
;!		 -> STR_340(CODE[20]), STR_342(CODE[37]), STR_343(CODE[37]), STR_344(CODE[25]), 
;!		 -> STR_345(CODE[26]), STR_346(CODE[20]), STR_348(CODE[29]), STR_349(CODE[28]), 
;!		 -> STR_35(CODE[21]), STR_350(CODE[30]), STR_351(CODE[28]), STR_352(CODE[32]), 
;!		 -> STR_355(CODE[22]), STR_356(CODE[28]), STR_357(CODE[37]), STR_358(CODE[31]), 
;!		 -> STR_359(CODE[39]), STR_36(CODE[33]), STR_360(CODE[31]), STR_361(CODE[49]), 
;!		 -> STR_362(CODE[38]), STR_363(CODE[43]), STR_364(CODE[38]), STR_365(CODE[29]), 
;!		 -> STR_39(CODE[36]), STR_4(CODE[29]), STR_40(CODE[20]), STR_41(CODE[21]), 
;!		 -> STR_5(CODE[23]), STR_7(CODE[20]), STR_8(CODE[16]), STR_9(CODE[37]), 
;!		 -> trigger_relay_pulse@buf(BANK0[60]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(BANK1[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK4[50]), main@buf_628(BANK4[50]), main@buf_633(BANK5[30]), main@buf_667(BANK4[50]), 
;!		 -> main@buf_672(BANK4[60]), main@buf_675(BANK4[40]), main@buf_714(BANK7[30]), main@time_buf(BANK3[60]), 
;!		 -> menu_handle_button@buf(BANK3[50]), menu_handle_button@buf_1707(BANK2[50]), menu_handle_button@buf_1709(BANK2[50]), menu_handle_button@buf_1711(BANK1[80]), 
;!		 -> menu_handle_button@buf_1730(BANK1[80]), menu_handle_button@buf_1743(BANK2[50]), menu_handle_button@buf_1769(BANK2[50]), menu_handle_button@buf_1779(BANK2[50]), 
;!		 -> menu_handle_button@buf_1788(BANK3[50]), menu_handle_button@buf_1796(BANK3[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1677(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1680(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), 
;!		 -> rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), rtc_set_time@buf(BANK0[80]), STR_10(CODE[42]), 
;!		 -> STR_12(CODE[38]), STR_13(CODE[34]), STR_139(CODE[29]), STR_149(CODE[26]), 
;!		 -> STR_15(CODE[28]), STR_16(CODE[23]), STR_19(CODE[22]), STR_2(CODE[42]), 
;!		 -> STR_20(CODE[19]), STR_21(CODE[24]), STR_22(CODE[22]), STR_222(CODE[31]), 
;!		 -> STR_23(CODE[22]), STR_24(CODE[19]), STR_26(CODE[16]), STR_314(CODE[36]), 
;!		 -> STR_316(CODE[16]), STR_317(CODE[27]), STR_318(CODE[24]), STR_321(CODE[27]), 
;!		 -> STR_33(CODE[22]), STR_332(CODE[53]), STR_335(CODE[25]), STR_34(CODE[20]), 
;!		 -> STR_340(CODE[20]), STR_342(CODE[37]), STR_343(CODE[37]), STR_344(CODE[25]), 
;!		 -> STR_345(CODE[26]), STR_346(CODE[20]), STR_348(CODE[29]), STR_349(CODE[28]), 
;!		 -> STR_35(CODE[21]), STR_350(CODE[30]), STR_351(CODE[28]), STR_352(CODE[32]), 
;!		 -> STR_355(CODE[22]), STR_356(CODE[28]), STR_357(CODE[37]), STR_358(CODE[31]), 
;!		 -> STR_359(CODE[39]), STR_36(CODE[33]), STR_360(CODE[31]), STR_361(CODE[49]), 
;!		 -> STR_362(CODE[38]), STR_363(CODE[43]), STR_364(CODE[38]), STR_365(CODE[29]), 
;!		 -> STR_39(CODE[36]), STR_4(CODE[29]), STR_40(CODE[20]), STR_41(CODE[21]), 
;!		 -> STR_5(CODE[23]), STR_7(CODE[20]), STR_8(CODE[16]), STR_9(CODE[37]), 
;!		 -> trigger_relay_pulse@buf(BANK0[60]), 
;!
;!    utility_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[9]), STR_102(CODE[9]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[8]), STR_109(CODE[11]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_113(CODE[7]), STR_114(CODE[7]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[6]), STR_117(CODE[10]), STR_118(CODE[11]), STR_119(CODE[9]), 
;!		 -> STR_120(CODE[12]), STR_121(CODE[8]), STR_122(CODE[8]), STR_123(CODE[5]), 
;!		 -> STR_124(CODE[7]), STR_125(CODE[8]), STR_126(CODE[10]), STR_127(CODE[8]), 
;!		 -> STR_128(CODE[5]), STR_129(CODE[10]), STR_130(CODE[9]), STR_131(CODE[10]), 
;!		 -> STR_132(CODE[12]), STR_133(CODE[9]), STR_134(CODE[9]), STR_135(CODE[11]), 
;!		 -> STR_136(CODE[11]), STR_137(CODE[5]), STR_82(CODE[7]), STR_83(CODE[7]), 
;!		 -> STR_84(CODE[10]), STR_85(CODE[11]), STR_86(CODE[12]), STR_87(CODE[9]), 
;!		 -> STR_88(CODE[13]), STR_89(CODE[6]), STR_90(CODE[6]), STR_91(CODE[9]), 
;!		 -> STR_92(CODE[8]), STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[5]), 
;!		 -> STR_96(CODE[7]), STR_97(CODE[7]), STR_98(CODE[10]), STR_99(CODE[11]), 
;!
;!    utility_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    utility_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[10]), STR_101(CODE[9]), STR_102(CODE[9]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[8]), STR_109(CODE[11]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_113(CODE[7]), STR_114(CODE[7]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[6]), STR_117(CODE[10]), STR_118(CODE[11]), STR_119(CODE[9]), 
;!		 -> STR_120(CODE[12]), STR_121(CODE[8]), STR_122(CODE[8]), STR_123(CODE[5]), 
;!		 -> STR_124(CODE[7]), STR_125(CODE[8]), STR_126(CODE[10]), STR_127(CODE[8]), 
;!		 -> STR_128(CODE[5]), STR_129(CODE[10]), STR_130(CODE[9]), STR_131(CODE[10]), 
;!		 -> STR_132(CODE[12]), STR_133(CODE[9]), STR_134(CODE[9]), STR_135(CODE[11]), 
;!		 -> STR_136(CODE[11]), STR_137(CODE[5]), STR_82(CODE[7]), STR_83(CODE[7]), 
;!		 -> STR_84(CODE[10]), STR_85(CODE[11]), STR_86(CODE[12]), STR_87(CODE[9]), 
;!		 -> STR_88(CODE[13]), STR_89(CODE[6]), STR_90(CODE[6]), STR_91(CODE[9]), 
;!		 -> STR_92(CODE[8]), STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[5]), 
;!		 -> STR_96(CODE[7]), STR_97(CODE[7]), STR_98(CODE[10]), STR_99(CODE[11]), 
;!
;!    utility_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_menu_handle_encoder
;!    _rtc_read_register->_i2c_read
;!    _i2c_restart->_i2c_wait_idle
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
;!    _rtc_set_time->_sprintf
;!    _dec_to_bcd->___lbdiv
;!    _dec_to_bcd->___lbmod
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
;!    _init_numeric_editor->___lwdiv
;!    _init_datetime_editor->_rtc_read_time
;!    _rtc_read_time->_sprintf
;!    _lcd_init->_lcd_cmd
;!    _lcd_cmd->_lcd_write_nibble
;!    _handle_utility_numeric_rotation->_rebuild_utility_menu
;!    _rebuild_utility_menu->_sprintf
;!    _sprintf->___lwdiv
;!    ___lwdiv->___lwmod
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
;!    _init_datetime_editor->_rtc_read_time
;!
;!Critical Paths under _isr in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    _main->_menu_handle_button
;!    _menu_handle_button->_init_datetime_editor
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
;!    _main->_menu_handle_button
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
;! (0) _main                                               410   410      0 1869107
;!                                            167 BANK3     66    66      0
;!                                              0 BANK4    256   256      0
;!                                              0 BANK5     41    41      0
;!                                              0 BANK7     30    30      0
;!                             ___wmul
;!                        _ad7994_init
;!                _ad7994_read_channel
;!                               _beep
;!                        _eeprom_init
;!                       _encoder_init
;!           _get_menu_timeout_seconds
;!           _handle_datetime_rotation
;!            _handle_numeric_rotation
;!               _handle_time_rotation
;!    _handle_utility_numeric_rotation
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
;!                  _menu_draw_utility
;!                 _menu_handle_button
;!                _menu_handle_encoder
;!                          _menu_init
;!             _menu_update_edit_value
;!          _menu_update_numeric_value
;!             _menu_update_time_value
;!                           _rtc_init
;!                  _rtc_read_register
;!                      _rtc_read_time
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
;! (1) _rtc_read_register                                    3     1      2     585
;!                                             22 COMRAM     3     1      2
;!                           _i2c_read
;!                        _i2c_restart
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;! ---------------------------------------------------------------------------------
;! (2) _i2c_restart                                          2     2      0      68
;!                                             17 COMRAM     2     2      0
;!                      _i2c_wait_idle
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
;! (1) _menu_update_edit_value                              31    31      0   44659
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
;! (1) _menu_handle_encoder                                172   170      2  468726
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
;! (2) _handle_time_rotation                                53    53      0   37021
;!                                              0 BANK0     53    53      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _handle_numeric_rotation                             57    57      0   37374
;!                                              0 BANK0     57    57      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                 609   609      0  782149
;!                                            110 BANK0     17    17      0
;!                                             87 BANK1    169   169      0
;!                                              0 BANK2    256   256      0
;!                                              0 BANK3    167   167      0
;!                            ___lbdiv
;!                            ___lbmod
;!                             ___wmul
;!                               _beep
;!          _get_current_numeric_value
;!         _get_item_options_for_field
;!               _get_option_edit_flag
;!               _init_datetime_editor
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
;!                      _rtc_read_time
;!                       _rtc_set_time
;!                _save_current_config
;!                            _sprintf
;!                             _strcmp
;!                             _strcpy
;!                _trigger_relay_pulse
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _trigger_relay_pulse                                 61    61      0   36953
;!                                              0 BANK0     61    61      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rtc_set_time                                        90    88      2   39511
;!                                             64 COMRAM     2     0      2
;!                                              0 BANK0     88    88      0
;!                         _dec_to_bcd
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (3) _dec_to_bcd                                           3     3      0    1615
;!                                             18 COMRAM     3     3      0
;!                            ___lbdiv
;!                            ___lbmod
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_input_menu                                  90    90      0   53391
;!                                             64 COMRAM     1     1      0
;!                                              0 BANK0     89    89      0
;!                            ___lwdiv
;!                            ___lwmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_clock_menu                                  58    58      0   47304
;!                                             64 COMRAM     2     2      0
;!                                              0 BANK0     56    56      0
;!                            ___lbdiv
;!                            ___lbmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_time_value                             111   111      0   84663
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
;! (2) _menu_draw_clock                                     32    32      0   36780
;!                                             25 COMRAM    32    32      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_utility                                   34    34      0   86133
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
;! (3) _menu_update_datetime_display                        18    18      0   48891
;!                                             64 COMRAM    18    18      0
;!                     _lcd_clear_line
;!                       _lcd_print_at
;!                            _sprintf
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_setup                                     23    23      0   29035
;!                                             25 COMRAM    23    23      0
;!                          _lcd_clear
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_options                                    2     2      0   28441
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
;! (2) _menu_draw_input                                     51    51      0   74870
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
;! (3) _lcd_print_at                                         4     1      3   14023
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
;! (2) _init_time_editor                                    63    60      3   42880
;!                                             64 COMRAM     3     0      3
;!                                              0 BANK0     60    60      0
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _init_numeric_editor                                 10     8      2    6078
;!                                             26 COMRAM    10     8      2
;!                            ___lwdiv
;!                            ___lwmod
;! ---------------------------------------------------------------------------------
;! (2) _init_datetime_editor                                87    87      0   75489
;!                                              0 BANK1     87    87      0
;!                      _rtc_read_time
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _rtc_read_time                                       90    88      2   38386
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
;! (2) _get_current_numeric_value                           10     8      2      68
;!                                             14 COMRAM    10     8      2
;! ---------------------------------------------------------------------------------
;! (2) _beep                                                 5     3      2    2768
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
;! (1) _handle_utility_numeric_rotation                      1     1      0   34574
;!                                             71 COMRAM     1     1      0
;!               _rebuild_utility_menu
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_utility_menu                                 7     7      0   34543
;!                                             64 COMRAM     7     7      0
;!                            ___lbdiv
;!                            ___lbmod
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;! ---------------------------------------------------------------------------------
;! (1) _sprintf                                             42    24     18   27287
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
;! (2) ___lwmod                                              5     1      4    2682
;!                                             14 COMRAM     5     1      4
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4    2761
;!                                             19 COMRAM     7     3      4
;!                            ___lwmod (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___lbmod                                              4     3      1     772
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) ___lbdiv                                              4     3      1     781
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (1) _handle_datetime_rotation                             1     1      0     186
;!                                             14 COMRAM     1     1      0
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
;! (1) _ad7994_init                                          1     1      0    9575
;!                                             19 COMRAM     1     1      0
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    9408
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
;!   _handle_datetime_rotation
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
;!   _handle_utility_numeric_rotation
;!     _rebuild_utility_menu
;!       ___lbdiv
;!       ___lbmod
;!       ___lwdiv
;!       ___lwmod
;!       _sprintf
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
;!   _menu_draw_utility
;!     _lcd_clear_line
;!     _lcd_print
;!     _lcd_print_at
;!     _lcd_set_cursor
;!     _menu_update_datetime_display
;!       _lcd_clear_line
;!       _lcd_print_at
;!       _sprintf
;!     _strcpy
;!     _strlen
;!   _menu_handle_button
;!     ___lbdiv
;!     ___lbmod
;!     ___wmul
;!     _beep
;!     _get_current_numeric_value
;!     _get_item_options_for_field
;!     _get_option_edit_flag
;!     _init_datetime_editor
;!       _rtc_read_time
;!         _bcd_to_dec
;!         _i2c_read
;!         _i2c_start
;!         _i2c_stop
;!         _i2c_write
;!         _sprintf
;!         _uart_println
;!       _sprintf
;!       _uart_println
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
;!     _rtc_read_time
;!     _rtc_set_time
;!       _dec_to_bcd
;!         ___lbdiv
;!         ___lbmod
;!       _i2c_start
;!       _i2c_stop
;!       _i2c_write
;!       _sprintf
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
;!   _rtc_read_register
;!     _i2c_read
;!     _i2c_restart
;!       _i2c_wait_idle
;!     _i2c_start
;!     _i2c_stop
;!     _i2c_write
;!   _rtc_read_time
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
;!BANK7              100     1E      E4      19       89.1%
;!BITBANK6           100      0       0      16        0.0%
;!BANK6              100      0      FD      17       98.8%
;!BITBANK5           100      0       0      14        0.0%
;!BANK5              100     29      FC      15       98.4%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100    100     100      13      100.0%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100     E9      E9      11       91.0%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100    100     100       9      100.0%
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
;!ABS                  0      0     7B6      50        0.0%
;!DATA                 0      0     936       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 174 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            30    0[BANK7 ] unsigned char [30]
;;  current_even    1   30[BANK5 ] unsigned char 
;;  time_buf       60  169[BANK3 ] unsigned char [60]
;;  buf            40  210[BANK4 ] unsigned char [40]
;;  delta           2   32[BANK5 ] int 
;;  buf            60    0[BANK4 ] unsigned char [60]
;;  buf            50  160[BANK4 ] unsigned char [50]
;;  buf            50  110[BANK4 ] unsigned char [50]
;;  lcd_buf        17    0        unsigned char [17]
;;  buf            30    0[BANK5 ] unsigned char [30]
;;  status          1   31[BANK5 ] unsigned char 
;;  buf            50   60[BANK4 ] unsigned char [50]
;;  current_time    7   34[BANK5 ] struct .
;;  last_encoder    2  254[BANK4 ] int 
;;  adc_ch3         2  250[BANK4 ] unsigned int 
;;  adc_ch2         2  231[BANK3 ] unsigned int 
;;  adc_ch1         2  229[BANK3 ] unsigned int 
;;  adc_error       1  253[BANK4 ] unsigned char 
;;  last_button     1  252[BANK4 ] unsigned char 
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
;;      Locals:         0       0       0       0      64     256      41       0      30       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       2       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0      66     256      41       0      30       0       0       0       0       0       0       0       0
;;Total ram usage:      393 bytes
;; Hardware stack levels required when called: 9
;; This function calls:
;;		___wmul
;;		_ad7994_init
;;		_ad7994_read_channel
;;		_beep
;;		_eeprom_init
;;		_encoder_init
;;		_get_menu_timeout_seconds
;;		_handle_datetime_rotation
;;		_handle_numeric_rotation
;;		_handle_time_rotation
;;		_handle_utility_numeric_rotation
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
;;		_menu_draw_utility
;;		_menu_handle_button
;;		_menu_handle_encoder
;;		_menu_init
;;		_menu_update_edit_value
;;		_menu_update_numeric_value
;;		_menu_update_time_value
;;		_rtc_init
;;		_rtc_read_register
;;		_rtc_read_time
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
	line	174
global __ptext0
__ptext0:
psect	text0
	file	"src\main.c"
	line	174
	
_main:
;incstack = 0
	callstack 22
	line	177
	
l16187:
	call	_system_init	;wreg free
	line	179
	
l16189:
	call	_eeprom_init	;wreg free
	line	186
	
l16191:; BSR set to: 5

	call	_get_menu_timeout_seconds	;wreg free
	movlb	3	; () banked
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
	line	188
	
l16193:
	call	_uart_init	;wreg free
	line	190
	
l16195:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	192
	
l16197:
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
	line	193
	
l16199:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	196
	
l16201:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	197
	
l16203:
	call	_i2c_init	;wreg free
	line	198
	
l16205:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	201
	
l16207:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	202
	
l16209:
	call	_rtc_init	;wreg free
	iorlw	0
	btfss	status,2
	goto	u22191
	goto	u22190
u22191:
	goto	l16223
u22190:
	line	204
	
l16211:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	208
	
l16213:
		movlw	low(main@status)
	movwf	((c:rtc_read_register@value))^00h,c
	movlw	high(main@status)
	movwf	((c:rtc_read_register@value+1))^00h,c

	movlw	(0Fh)&0ffh
	
	call	_rtc_read_register
	iorlw	0
	btfss	status,2
	goto	u22201
	goto	u22200
u22201:
	goto	l172
u22200:
	line	211
	
l16215:
		movlw	low(main@buf_628)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_628)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_11)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_11)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@status),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	212
	
l16217:
		movlw	low(main@buf_628)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_628)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	214
	
l16219:
	movlb	5	; () banked
	
	btfss	((main@status))&0ffh,(7)&7
	goto	u22211
	goto	u22210
u22211:
	goto	l172
u22210:
	line	216
	
l16221:; BSR set to: 5

		movlw	low(STR_12)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_12)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l172
	line	222
	
l16223:
		movlw	low(STR_13)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_13)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	223
	
l172:
	line	246
	call	_ad7994_init	;wreg free
	movlb	4	; () banked
	movwf	((main@adc_error))&0ffh
	line	247
	
l16225:; BSR set to: 4

	movf	((main@adc_error))&0ffh,w
	btfsc	status,2
	goto	u22221
	goto	u22220
u22221:
	goto	l16231
u22220:
	line	250
	
l16227:; BSR set to: 4

		movlw	low(main@buf_633)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_633)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_14)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_14)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@adc_error),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	251
	
l16229:
		movlw	low(main@buf_633)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_633)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	254
	
l16231:
	call	_encoder_init	;wreg free
	line	255
	
l16233:
	call	_menu_init	;wreg free
	line	256
	
l16235:; BSR set to: 5

	call	_lcd_init	;wreg free
	line	258
	
l16237:
		movlw	low(STR_15)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	259
	
l16239:
		movlw	low(STR_16)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_16)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	261
	
l16241:
	call	_lcd_clear	;wreg free
	line	262
	
l16243:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	263
	
l16245:
		movlw	low(STR_17)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_17)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	264
	
l16247:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	265
	
l16249:
		movlw	low(STR_18)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_18)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	267
	
l16251:
		movlw	low(STR_19)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_19)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	268
	
l16253:
		movlw	low(STR_20)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_20)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	269
	
l16255:
		movlw	low(STR_21)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_21)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	271
	
l16257:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	272
	
l16259:
	asmopt push
asmopt off
movlw  5
	movlb	3	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	15
movwf	(??_main+0+0)&0ffh
	movlw	241
u22717:
decfsz	wreg,f
	bra	u22717
	decfsz	(??_main+0+0)&0ffh,f
	bra	u22717
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u22717
asmopt pop

	line	273
	
l16261:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	275
	
l16263:
		movlw	low(STR_22)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_22)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	276
	
l16265:
		movlw	low(STR_23)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_23)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	282
	
l16267:
	movlb	5	; () banked
	setf	((_current_menu))&0ffh
	line	283
	
l16269:; BSR set to: 5

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	285
	
l16271:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	286
	
l16273:
		movlw	low(STR_24)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_24)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	289
	
l16275:
	movlw	high(0)
	movlb	4	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	290
	
l16277:; BSR set to: 4

	movlw	low(0)
	movwf	((main@last_button))&0ffh
	line	304
	
l16279:
	movlb	5	; () banked
	incf	((main@sample_counter))&0ffh
	line	306
	
l16281:; BSR set to: 5

		movlw	0Ah-1
	cpfsgt	((main@sample_counter))&0ffh
	goto	u22231
	goto	u22230

u22231:
	goto	l16303
u22230:
	line	308
	
l16283:; BSR set to: 5

	movlw	low(0)
	movwf	((main@sample_counter))&0ffh
	line	311
	
l16285:; BSR set to: 5

		movlw	low(main@current_time)
	movwf	((c:rtc_read_time@time))^00h,c
	movlw	high(main@current_time)
	movwf	((c:rtc_read_time@time+1))^00h,c

	call	_rtc_read_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u22241
	goto	u22240
u22241:
	goto	l16291
u22240:
	line	316
	
l16287:
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
	line	317
	
l16289:
		movlw	low(main@time_buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@time_buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	318
	goto	l16293
	line	321
	
l16291:
		movlw	low(STR_26)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_26)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	325
	
l16293:
	movlw	(01h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch1)
	movff	1+?_ad7994_read_channel,(main@adc_ch1+1)
	line	326
	
l16295:
	movlw	(02h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch2)
	movff	1+?_ad7994_read_channel,(main@adc_ch2+1)
	line	327
	
l16297:
	movlw	(03h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch3)
	movff	1+?_ad7994_read_channel,(main@adc_ch3+1)
	line	331
	
l16299:
		movlw	low(main@buf_667)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_667)
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
	line	332
	
l16301:
		movlw	low(main@buf_667)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_667)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	337
	
l16303:
	asmopt push
asmopt off
movlw  3
	movlb	3	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	8
movwf	(??_main+0+0)&0ffh
	movlw	119
u22727:
decfsz	wreg,f
	bra	u22727
	decfsz	(??_main+0+0)&0ffh,f
	bra	u22727
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u22727
asmopt pop

	line	342
	
l16305:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	354
	
l16307:
	movlb	5	; () banked
	movf	((main@last_relay_state))&0ffh,w
	movlb	0	; () banked
xorwf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u22251
	goto	u22250

u22251:
	goto	l16311
u22250:
	
l16309:; BSR set to: 0

	movlb	5	; () banked
	movf	((main@last_relay_counter))&0ffh,w
xorwf	((_relay_counter))&0ffh,w	;volatile
	bnz	u22260
movf	((main@last_relay_counter+1))&0ffh,w
xorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u22261
	goto	u22260

u22261:
	goto	l16319
u22260:
	line	357
	
l16311:
		movlw	low(main@buf_672)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_672)
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
	line	358
	
l16313:
		movlw	low(main@buf_672)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_672)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	359
	
l16315:
	movff	(_relay_state),(main@last_relay_state)	;volatile
	line	360
	
l16317:
	movff	(_relay_counter),(main@last_relay_counter)	;volatile
	movff	(_relay_counter+1),(main@last_relay_counter+1)	;volatile
	line	365
	
l16319:
	movlb	4	; () banked
	movf	((main@last_encoder))&0ffh,w
	movlb	5	; () banked
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u22270
	movlb	4	; () banked
movf	((main@last_encoder+1))&0ffh,w
	movlb	5	; () banked
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u22271
	goto	u22270

u22271:
	goto	l16403
u22270:
	line	367
	
l16321:; BSR set to: 5

	movlb	4	; () banked
	movf	((main@last_encoder))&0ffh,w
	movlb	5	; () banked
	subwf	((_encoder_count))&0ffh,w	;volatile
	movwf	((main@delta))&0ffh
	movlb	4	; () banked
	movf	((main@last_encoder+1))&0ffh,w
	movlb	5	; () banked
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movwf	1+((main@delta))&0ffh
	line	370
	
l16323:; BSR set to: 5

	movlw	high(01h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	373
	
l16325:
		movlw	low(main@buf_675)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_675)
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
	line	374
	
l16327:
		movlw	low(main@buf_675)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_675)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	376
	
l16329:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	379
	
l16331:
	movlw	high(0Ah)
	movlb	5	; () banked
	movwf	((main@encoder_activity_timer+1))&0ffh
	movlw	low(0Ah)
	movwf	((main@encoder_activity_timer))&0ffh
	line	382
	
l16333:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22281
	goto	u22280
u22281:
	goto	l196
u22280:
	line	384
	
l16335:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	385
	
l196:; BSR set to: 5

	line	389
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22291
	goto	u22290
u22291:
	goto	l16343
u22290:
	
l16337:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22301
	goto	u22300

u22301:
	goto	l16343
u22300:
	
l16339:; BSR set to: 5

	movf	(0+(_menu+01Eh))&0ffh,w
	btfss	status,2
	goto	u22311
	goto	u22310
u22311:
	goto	l16343
u22310:
	line	392
	
l16341:; BSR set to: 5

	movf	((main@delta))&0ffh,w
	
	call	_handle_utility_numeric_rotation
	line	394
	call	_menu_draw_utility	;wreg free
	line	395
	goto	l16377
	line	396
	
l16343:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22321
	goto	u22320
u22321:
	goto	l16353
u22320:
	
l16345:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22331
	goto	u22330

u22331:
	goto	l16353
u22330:
	
l16347:; BSR set to: 5

	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u22341
	goto	u22340
u22341:
	goto	l16353
u22340:
	line	399
	
l16349:; BSR set to: 5

	movf	((main@delta))&0ffh,w
	
	call	_handle_datetime_rotation
	line	400
	
l16351:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	401
	goto	l16377
	line	402
	
l16353:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22351
	goto	u22350
u22351:
	goto	l16367
u22350:
	
l16355:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22361
	goto	u22360

u22361:
	goto	l16367
u22360:
	line	404
	
l16357:; BSR set to: 5

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
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u22371
	goto	u22370
u22371:
	goto	l16361
u22370:
	line	407
	
l16359:
	movlb	5	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_numeric_rotation
	line	408
	goto	l16377
	line	409
	
l16361:
	movlb	5	; () banked
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
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u22381
	goto	u22380
u22381:
	goto	l16365
u22380:
	line	412
	
l16363:
	movlb	5	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_time_rotation
	line	413
	call	_menu_update_time_value	;wreg free
	line	414
	goto	l16377
	line	418
	
l16365:
	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	goto	l16377
	line	421
	
l16367:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22391
	goto	u22390
u22391:
	goto	l16365
u22390:
	
l16369:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22401
	goto	u22400

u22401:
	goto	l16365
u22400:
	line	424
	
l16371:; BSR set to: 5

	movf	((main@delta))&0ffh,w
	
	call	_handle_datetime_rotation
	goto	l16351
	line	434
	
l16377:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22411
	goto	u22410
u22411:
	goto	l16391
u22410:
	
l16379:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22421
	goto	u22420

u22421:
	goto	l16391
u22420:
	line	437
	
l16381:; BSR set to: 5

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
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u22431
	goto	u22430
u22431:
	goto	l16385
u22430:
	line	440
	
l16383:
	call	_menu_update_numeric_value	;wreg free
	line	441
	goto	l16403
	line	442
	
l16385:
	movlb	5	; () banked
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
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u22441
	goto	u22440
u22441:
	goto	l16389
u22440:
	line	445
	
l16387:
	call	_menu_update_time_value	;wreg free
	line	446
	goto	l16403
	line	450
	
l16389:
	call	_menu_update_edit_value	;wreg free
	goto	l16403
	line	456
	
l16391:; BSR set to: 5

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22451
	goto	u22450
u22451:
	goto	l16395
u22450:
	line	458
	
l16393:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	459
	goto	l16403
	line	460
	
l16395:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22461
	goto	u22460

u22461:
	goto	l16399
u22460:
	line	462
	
l16397:; BSR set to: 5

	call	_menu_draw_input	;wreg free
	line	463
	goto	l16403
	line	464
	
l16399:; BSR set to: 5

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22471
	goto	u22470

u22471:
	goto	l16403
u22470:
	line	466
	
l16401:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	472
	
l16403:
	movlb	4	; () banked
	movf	((main@last_button))&0ffh,w
	movlb	5	; () banked
xorwf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u22481
	goto	u22480

u22481:
	goto	l16443
u22480:
	line	474
	
l16405:; BSR set to: 5

	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u22491
	goto	u22490
u22491:
	goto	l16439
u22490:
	line	476
	
l16407:; BSR set to: 5

	movff	(_button_event),(main@current_event)	;volatile
	line	477
	
l16409:; BSR set to: 5

	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	480
	
l16411:; BSR set to: 5

		movlw	low(main@buf_714)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_714)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_30)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_30)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@current_event),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	481
	
l16413:
		movlw	low(main@buf_714)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_714)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	484
	
l16415:
	movlb	5	; () banked
		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22501
	goto	u22500

u22501:
	goto	l16425
u22500:
	line	486
	
l16417:; BSR set to: 5

		decf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u22511
	goto	u22510

u22511:
	goto	l16439
u22510:
	line	488
	
l16419:; BSR set to: 5

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	489
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	490
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	491
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	492
	
l16421:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	493
	
l16423:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l16439
	line	499
	
l16425:; BSR set to: 5

	movf	((main@current_event))&0ffh,w
	
	call	_menu_handle_button
	line	502
	
l16427:
	movlb	5	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22521
	goto	u22520
u22521:
	goto	l16431
u22520:
	line	503
	
l16429:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	goto	l16439
	line	504
	
l16431:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22531
	goto	u22530

u22531:
	goto	l16435
u22530:
	line	505
	
l16433:; BSR set to: 5

	call	_menu_draw_input	;wreg free
	goto	l16439
	line	506
	
l16435:; BSR set to: 5

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22541
	goto	u22540

u22541:
	goto	l16439
u22540:
	line	507
	
l16437:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	510
	
l16439:
	movff	(_button_event),(main@last_button)	;volatile
	line	511
	
l16441:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	516
	
l16443:; BSR set to: 5

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22551
	goto	u22550

u22551:
	goto	l16459
u22550:
	
l16445:; BSR set to: 5

		incf	((main@last_menu_state))&0ffh,w
	btfsc	status,2
	goto	u22561
	goto	u22560

u22561:
	goto	l16459
u22560:
	line	519
	
l16447:; BSR set to: 5

	call	_lcd_clear	;wreg free
	line	520
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	521
	
l16449:
		movlw	low(STR_31)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_31)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	522
	
l16451:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	523
		movlw	low(STR_32)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_32)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	524
		movlw	low(STR_33)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_33)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	526
		movlw	low(STR_34)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_34)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	527
	
l16453:
	call	_save_current_config	;wreg free
	line	528
	
l16455:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	line	529
	
l16457:; BSR set to: 5

		movlw	low(STR_35)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_35)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	531
	
l16459:
	movff	(_current_menu),(main@last_menu_state)
	line	534
	
l16461:
	movlb	5	; () banked
	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfsc	status,2
	goto	u22571
	goto	u22570

u22571:
	goto	l16465
u22570:
	line	536
	
l16463:; BSR set to: 5

	decf	((main@encoder_activity_timer))&0ffh
	btfss	status,0
	decf	((main@encoder_activity_timer+1))&0ffh
	line	540
	
l16465:; BSR set to: 5

	movlw	low(01h)
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	541
	
l16467:; BSR set to: 5

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	iorwf	((main@blink_timer+1))&0ffh,w
	bnz	u22580
	movlw	10
	subwf	 ((main@blink_timer))&0ffh,w
	btfss	status,0
	goto	u22581
	goto	u22580

u22581:
	goto	l16503
u22580:
	line	543
	
l16469:; BSR set to: 5

	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	544
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22591
	goto	u22590
u22591:
	goto	l16501
u22590:
	line	547
	
l16471:; BSR set to: 5

	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfss	status,2
	goto	u22601
	goto	u22600

u22601:
	goto	l16503
u22600:
	line	549
	
l16473:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u22611
	goto	u22610
u22611:
	movlw	1
	goto	u22620
u22610:
	movlw	0
u22620:
	movwf	(0+(_menu+05h))&0ffh
	line	553
	goto	l16499
	line	556
	
l16475:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	557
	goto	l16503
	line	561
	
l16477:; BSR set to: 5

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
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u22631
	goto	u22630
u22631:
	goto	l16481
u22630:
	line	563
	
l16479:
	call	_menu_update_numeric_value	;wreg free
	line	564
	goto	l16503
	line	565
	
l16481:
	movlb	5	; () banked
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
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u22641
	goto	u22640
u22641:
	goto	l16485
u22640:
	line	567
	
l16483:
	call	_menu_update_time_value	;wreg free
	line	568
	goto	l16503
	line	572
	
l16485:
	call	_menu_draw_input	;wreg free
	goto	l16503
	line	577
	
l16487:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	578
	goto	l16503
	line	580
	
l16489:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22651
	goto	u22650

u22651:
	goto	l16493
u22650:
	goto	l16483
	line	586
	
l16493:; BSR set to: 5

	call	_menu_draw_clock	;wreg free
	goto	l16503
	line	590
	
l16495:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	591
	goto	l16503
	line	553
	
l16499:; BSR set to: 5

	movf	((_current_menu))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l16475
	xorlw	1^0	; case 1
	skipnz
	goto	l16477
	xorlw	2^1	; case 2
	skipnz
	goto	l16487
	xorlw	3^2	; case 3
	skipnz
	goto	l16489
	xorlw	4^3	; case 4
	skipnz
	goto	l16495
	goto	l16503

	line	597
	
l16501:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	611
	
l16503:
		movlw	05h-0
	movlb	5	; () banked
	cpfslt	((_current_menu))&0ffh
	goto	u22661
	goto	u22660

u22661:
	goto	l16537
u22660:
	line	613
	
l16505:; BSR set to: 5

	movf	((_menu_timeout_flag))&0ffh,w	;volatile
	btfss	status,2
	goto	u22671
	goto	u22670
u22671:
	goto	l16537
u22670:
	line	615
	
l16507:; BSR set to: 5

		movlw	low(STR_36)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_36)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	618
	
l16509:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	619
	
l16511:
	asmopt push
asmopt off
movlw  3
	movlb	3	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	8
movwf	(??_main+0+0)&0ffh
	movlw	119
u22737:
decfsz	wreg,f
	bra	u22737
	decfsz	(??_main+0+0)&0ffh,f
	bra	u22737
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u22737
asmopt pop

	line	620
	
l16513:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	623
	
l16515:
	movlb	5	; () banked
	setf	((_current_menu))&0ffh
	line	624
	
l16517:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	625
	
l16519:; BSR set to: 5

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	626
	
l16521:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	629
	
l16523:; BSR set to: 5

	call	_lcd_clear	;wreg free
	line	630
	
l16525:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	631
	
l16527:
		movlw	low(STR_37)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_37)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	632
	
l16529:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	633
	
l16531:
		movlw	low(STR_38)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_38)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	636
	
l16533:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	637
	
l16535:; BSR set to: 5

	movlw	high(0)
	movwf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_menu_timeout_timer))^00h,c	;volatile
	line	642
	
l16537:; BSR set to: 5

	movf	((_long_press_beep_flag))&0ffh,w	;volatile
	btfsc	status,2
	goto	u22681
	goto	u22680
u22681:
	goto	l16545
u22680:
	line	644
	
l16539:; BSR set to: 5

	movlw	low(0)
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	line	645
	
l16541:; BSR set to: 5

	movlw	high(01F4h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01F4h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	646
	
l16543:
		movlw	low(STR_39)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_39)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	651
	
l16545:
	movlb	5	; () banked
	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u22691
	goto	u22690
u22691:
	goto	l16557
u22690:
	
l16547:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u22701
	goto	u22700
u22701:
	goto	l16557
u22700:
	line	653
	
l16549:; BSR set to: 5

		movlw	low(STR_40)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_40)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	654
	
l16551:
	call	_save_current_config	;wreg free
	line	655
	
l16553:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	line	656
	
l16555:; BSR set to: 5

		movlw	low(STR_41)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_41)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	661
	
l16557:
	asmopt push
asmopt off
	movlw	133
u22747:
decfsz	wreg,f
	bra	u22747
	nop
asmopt pop

	goto	l16279
	global	start
	goto	start
	callstack 0
	line	663
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_uart_init

;; *************** function _uart_init *****************
;; Defined at:
;;		line 53 in file "src\main.c"
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
	line	53
global __ptext1
__ptext1:
psect	text1
	file	"src\main.c"
	line	53
	
_uart_init:
;incstack = 0
	callstack 28
	line	55
	
l14491:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	56
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	58
	
l14493:
	movlw	low(024h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	59
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	60
	movlw	low(08h)
	movwf	((c:4024))^0f00h,c	;volatile
	line	62
	movlw	low(044h)
	movwf	((c:4015))^0f00h,c	;volatile
	line	63
	movlw	low(0)
	movwf	((c:4016))^0f00h,c	;volatile
	line	64
	
l121:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
	signat	_uart_init,89
	global	_system_init

;; *************** function _system_init *****************
;; Defined at:
;;		line 89 in file "src\main.c"
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
	line	89
global __ptext2
__ptext2:
psect	text2
	file	"src\main.c"
	line	89
	
_system_init:
;incstack = 0
	callstack 28
	line	91
	
l14495:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	92
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	95
	
l139:
	line	94
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u19361
	goto	u19360
u19361:
	goto	l139
u19360:
	line	97
	
l14497:
	movlw	low(0Fh)
	movwf	((c:4033))^0f00h,c	;volatile
	line	99
	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	100
	movlw	low(0)
	movwf	((c:3978))^0f00h,c	;volatile
	line	101
	movlw	low(0)
	movwf	((c:3979))^0f00h,c	;volatile
	line	103
	
l14499:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	104
	
l14501:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	106
	
l14503:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	107
	
l14505:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	108
	
l14507:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	109
	
l14509:
	bsf	((c:3987))^0f00h,c,0	;volatile
	line	110
	
l14511:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	112
	
l14513:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	113
	
l14515:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	116
	
l14517:
	bcf	((c:3988))^0f00h,c,1	;volatile
	line	117
	
l14519:
	bsf	((c:3979))^0f00h,c,1	;volatile
	line	118
	
l142:
	return	;funcret
	callstack 0
GLOBAL	__end_of_system_init
	__end_of_system_init:
	signat	_system_init,89
	global	_rtc_read_register

;; *************** function _rtc_read_register *****************
;; Defined at:
;;		line 24 in file "src\rtc.c"
;; Parameters:    Size  Location     Type
;;  reg             1    wreg     unsigned char 
;;  value           2   22[COMRAM] PTR unsigned char 
;;		 -> main@status(1), 
;; Auto vars:     Size  Location     Type
;;  reg             1   24[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/5
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_i2c_read
;;		_i2c_restart
;;		_i2c_start
;;		_i2c_stop
;;		_i2c_write
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=0
	file	"src\rtc.c"
	line	24
global __ptext3
__ptext3:
psect	text3
	file	"src\rtc.c"
	line	24
	
_rtc_read_register:
;incstack = 0
	callstack 26
	movwf	((c:rtc_read_register@reg))^00h,c
	line	26
	
l14589:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19441
	goto	u19440
u19441:
	goto	l14595
u19440:
	line	27
	
l14591:
	movlw	(01h)&0ffh
	goto	l1725
	line	28
	
l14595:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19451
	goto	u19450
u19451:
	goto	l14601
u19450:
	goto	l14591
	line	30
	
l14601:
	movf	((c:rtc_read_register@reg))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19461
	goto	u19460
u19461:
	goto	l14607
u19460:
	goto	l14591
	line	33
	
l14607:
	call	_i2c_restart	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19471
	goto	u19470
u19471:
	goto	l14613
u19470:
	goto	l14591
	line	35
	
l14613:
	movlw	(0D1h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19481
	goto	u19480
u19481:
	goto	l14619
u19480:
	goto	l14591
	line	37
	
l14619:
	movlw	(0)&0ffh
	
	call	_i2c_read
	movff	(c:rtc_read_register@value),fsr2l
	movff	(c:rtc_read_register@value+1),fsr2h
	movwf	indf2,c

	line	38
	
l14621:
	call	_i2c_stop	;wreg free
	line	39
	
l14623:
	movlw	(0)&0ffh
	line	40
	
l1725:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rtc_read_register
	__end_of_rtc_read_register:
	signat	_rtc_read_register,8313
	global	_i2c_restart

;; *************** function _i2c_restart *****************
;; Defined at:
;;		line 79 in file "src\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  timeout         2   17[COMRAM] unsigned int 
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
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_i2c_wait_idle
;; This function is called by:
;;		_rtc_read_register
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	79
global __ptext4
__ptext4:
psect	text4
	file	"src\i2c.c"
	line	79
	
_i2c_restart:
;incstack = 0
	callstack 26
	line	81
	
l14443:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19291
	goto	u19290
u19291:
	goto	l1665
u19290:
	line	82
	
l14445:
	movlw	(01h)&0ffh
	goto	l1666
	
l1665:
	line	84
	bsf	((c:4037))^0f00h,c,1	;volatile
	line	86
	
l14449:
	movlw	high(03E8h)
	movwf	((c:i2c_restart@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_restart@timeout))^00h,c
	line	87
	goto	l1667
	line	89
	
l14451:
	decf	((c:i2c_restart@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_restart@timeout+1))^00h,c
	movf	((c:i2c_restart@timeout))^00h,c,w
iorwf	((c:i2c_restart@timeout+1))^00h,c,w
	btfss	status,2
	goto	u19301
	goto	u19300

u19301:
	goto	l1667
u19300:
	goto	l14445
	line	91
	
l1667:
	line	87
	btfsc	((c:4037))^0f00h,c,1	;volatile
	goto	u19311
	goto	u19310
u19311:
	goto	l14451
u19310:
	line	93
	
l14457:
	movlw	(0)&0ffh
	line	94
	
l1666:
	return	;funcret
	callstack 0
GLOBAL	__end_of_i2c_restart
	__end_of_i2c_restart:
	signat	_i2c_restart,89
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
psect	text5,class=CODE,space=0,reloc=2,group=0
	file	"src\rtc.c"
	line	43
global __ptext5
__ptext5:
psect	text5
	file	"src\rtc.c"
	line	43
	
_rtc_init:
;incstack = 0
	callstack 25
	line	47
	
l14577:
	asmopt push
asmopt off
movlw  21
movwf	(??_rtc_init+0+0+1)^00h,c
movlw	75
movwf	(??_rtc_init+0+0)^00h,c
	movlw	190
u22757:
decfsz	wreg,f
	bra	u22757
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u22757
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u22757
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
u22767:
decfsz	wreg,f
	bra	u22767
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u22767
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u22767
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
u22777:
decfsz	wreg,f
	bra	u22777
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u22777
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u22777
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
u22787:
decfsz	wreg,f
	bra	u22787
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u22787
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u22787
	nop2
asmopt pop

	line	54
	
l14579:
	movlw	low(0)
	movwf	((c:rtc_write_register@value))^00h,c
	movlw	(0Eh)&0ffh
	
	call	_rtc_write_register
	iorlw	0
	btfsc	status,2
	goto	u19431
	goto	u19430
u19431:
	goto	l14585
u19430:
	line	56
	
l14581:
	movlw	(01h)&0ffh
	goto	l1733
	line	59
	
l14585:
	movlw	(0)&0ffh
	line	60
	
l1733:
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
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	9
global __ptext6
__ptext6:
psect	text6
	file	"src\rtc.c"
	line	9
	
_rtc_write_register:
;incstack = 0
	callstack 25
	movwf	((c:rtc_write_register@reg))^00h,c
	line	11
	
l14461:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19321
	goto	u19320
u19321:
	goto	l14467
u19320:
	line	12
	
l14463:
	movlw	(01h)&0ffh
	goto	l1718
	line	13
	
l14467:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19331
	goto	u19330
u19331:
	goto	l14473
u19330:
	goto	l14463
	line	15
	
l14473:
	movf	((c:rtc_write_register@reg))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19341
	goto	u19340
u19341:
	goto	l14479
u19340:
	goto	l14463
	line	17
	
l14479:
	movf	((c:rtc_write_register@value))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19351
	goto	u19350
u19351:
	goto	l14485
u19350:
	goto	l14463
	line	19
	
l14485:
	call	_i2c_stop	;wreg free
	line	20
	
l14487:
	movlw	(0)&0ffh
	line	21
	
l1718:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rtc_write_register
	__end_of_rtc_write_register:
	signat	_rtc_write_register,8313
	global	_menu_update_numeric_value

;; *************** function _menu_update_numeric_value *****************
;; Defined at:
;;		line 1313 in file "src\menu.c"
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
;;		On entry : 0/5
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
psect	text7,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1313
global __ptext7
__ptext7:
psect	text7
	file	"src\menu.c"
	line	1313
	
_menu_update_numeric_value:
;incstack = 0
	callstack 25
	line	1316
	
l15149:
	movlb	5	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20301
	goto	u20300

u20301:
	goto	l930
u20300:
	
l15151:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u20311
	goto	u20310
u20311:
	goto	l15153
u20310:
	goto	l930
	line	1320
	
l15153:; BSR set to: 5

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((c:menu_update_numeric_value@screen_line))^00h,c
	line	1321
		movlw	03h-1
	cpfsgt	((c:menu_update_numeric_value@screen_line))^00h,c
	goto	u20321
	goto	u20320

u20321:
	goto	l15157
u20320:
	goto	l930
	line	1326
	
l15157:; BSR set to: 5

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
	line	1327
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
	line	1330
	
l15159:; BSR set to: 5

	movff	(c:menu_update_numeric_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(c:menu_update_numeric_value@flow_type),(c:is_numeric_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u20331
	goto	u20330
u20331:
	goto	l15163
u20330:
	goto	l930
	line	1334
	
l15163:
	lfsr	2,(menu_update_numeric_value@value_buf)
	movlw	6-1
u20341:
	clrf	postinc2
	decf	wreg
	bc	u20341
	line	1336
	
l15165:
	movlb	5	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u20351
	goto	u20350
u20351:
	goto	l15197
u20350:
	line	1339
	
l15167:; BSR set to: 5

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20361
	goto	u20360

u20361:
	goto	l15171
u20360:
	
l15169:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20371
	goto	u20370
u20371:
	goto	l15173
u20370:
	
l15171:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1483))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1483))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1483))^00h,c
	goto	l15175
	
l15173:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1483+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1483))^00h,c
	
l15175:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1483),(c:menu_update_numeric_value@value_buf)
	line	1340
	
l15177:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20381
	goto	u20380

u20381:
	goto	l15181
u20380:
	
l15179:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20391
	goto	u20390
u20391:
	goto	l15183
u20390:
	
l15181:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1484))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1484))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1484))^00h,c
	goto	l15185
	
l15183:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1484+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1484))^00h,c
	
l15185:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1484),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1341
	
l15187:; BSR set to: 5

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20401
	goto	u20400

u20401:
	goto	l15191
u20400:
	
l15189:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20411
	goto	u20410
u20411:
	goto	l15193
u20410:
	
l15191:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1485))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1485))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1485))^00h,c
	goto	l15195
	
l15193:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1485+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1485))^00h,c
	
l15195:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1485),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1342
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+03h))^00h,c
	line	1343
	goto	l956
	line	1347
	
l15197:; BSR set to: 5

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20421
	goto	u20420
u20421:
	goto	l15201
u20420:
	
l15199:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20431
	goto	u20430
u20431:
	goto	l15209
u20430:
	
l15201:; BSR set to: 5

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u20441
	goto	u20440
u20441:
	goto	l15205
u20440:
	
l15203:; BSR set to: 5

	movlw	high(02Bh)
	movwf	((c:_menu_update_numeric_value$1487+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_menu_update_numeric_value$1487))^00h,c
	goto	l15207
	
l15205:; BSR set to: 5

	movlw	high(02Dh)
	movwf	((c:_menu_update_numeric_value$1487+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_menu_update_numeric_value$1487))^00h,c
	
l15207:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1487),(c:_menu_update_numeric_value$1486)
	movff	(c:_menu_update_numeric_value$1487+1),(c:_menu_update_numeric_value$1486+1)
	goto	l15211
	
l15209:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1486+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1486))^00h,c
	
l15211:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1486),(c:menu_update_numeric_value@value_buf)
	line	1348
	
l15213:; BSR set to: 5

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20451
	goto	u20450

u20451:
	goto	l15217
u20450:
	
l15215:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20461
	goto	u20460
u20461:
	goto	l15219
u20460:
	
l15217:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1488))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1488))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1488))^00h,c
	goto	l15221
	
l15219:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1488+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1488))^00h,c
	
l15221:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1488),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1349
	
l15223:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20471
	goto	u20470

u20471:
	goto	l15227
u20470:
	
l15225:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20481
	goto	u20480
u20481:
	goto	l15229
u20480:
	
l15227:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1489))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1489))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1489))^00h,c
	goto	l15231
	
l15229:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1489+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1489))^00h,c
	
l15231:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1489),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1350
	
l15233:; BSR set to: 5

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20491
	goto	u20490

u20491:
	goto	l15237
u20490:
	
l15235:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20501
	goto	u20500
u20501:
	goto	l15239
u20500:
	
l15237:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1490))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1490))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1490))^00h,c
	goto	l15241
	
l15239:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1490+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1490))^00h,c
	
l15241:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1490),0+((c:menu_update_numeric_value@value_buf)+03h)
	line	1351
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+04h))^00h,c
	line	1352
	
l956:; BSR set to: 5

	line	1355
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u20511
	goto	u20510
u20511:
	goto	l15245
u20510:
	
l15243:; BSR set to: 5

	movlw	high(0Eh)
	movwf	((c:_menu_update_numeric_value$1492+1))^00h,c
	movlw	low(0Eh)
	movwf	((c:_menu_update_numeric_value$1492))^00h,c
	goto	l15247
	
l15245:; BSR set to: 5

	movlw	high(0Fh)
	movwf	((c:_menu_update_numeric_value$1492+1))^00h,c
	movlw	low(0Fh)
	movwf	((c:_menu_update_numeric_value$1492))^00h,c
	
l15247:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1492),(c:menu_update_numeric_value@start_col)
	line	1357
	
l15249:; BSR set to: 5

	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1358
	
l15251:
		movlw	low(STR_229)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_229)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1360
	
l15253:
	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1361
	
l15255:
		movlw	low(STR_230)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_230)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1362
	
l15257:
		movlw	low(menu_update_numeric_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1363
	
l15259:
		movlw	low(STR_231)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_231)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1364
	
l930:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_numeric_value
	__end_of_menu_update_numeric_value:
	signat	_menu_update_numeric_value,89
	global	_menu_update_edit_value

;; *************** function _menu_update_edit_value *****************
;; Defined at:
;;		line 1249 in file "src\menu.c"
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
;;		On entry : 0/5
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
psect	text8,class=CODE,space=0,reloc=2,group=0
	line	1249
global __ptext8
__ptext8:
psect	text8
	file	"src\menu.c"
	line	1249
	
_menu_update_edit_value:
;incstack = 0
	callstack 25
	line	1253
	
l15261:
	movlb	5	; () banked
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
	line	1254
	movlb	5	; () banked
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
	line	1257
	
l15263:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u20521
	goto	u20520
u20521:
	goto	l908
u20520:
	
l15265:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u20531
	goto	u20530

u20531:
	goto	l15267
u20530:
	goto	l908
	line	1261
	
l15267:; BSR set to: 5

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@screen_line))&0ffh
	line	1262
		movlw	03h-1
	cpfsgt	((menu_update_edit_value@screen_line))&0ffh
	goto	u20541
	goto	u20540

u20541:
	goto	l15271
u20540:
	goto	l908
	line	1266
	
l15271:; BSR set to: 0

	movff	(menu_update_edit_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_update_edit_value@flow_type),(c:is_numeric_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u20551
	goto	u20550
u20551:
	goto	l15275
u20550:
	goto	l908
	line	1271
	
l15275:
	movlb	5	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u20561
	goto	u20560
u20561:
	goto	l15279
u20560:
	line	1273
	
l15277:; BSR set to: 5

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_224)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_224)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+0Ah),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1274
	goto	l15287
	line	1279
	
l15279:; BSR set to: 5

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u20571
	goto	u20570
u20571:
	goto	l15283
u20570:
	
l15281:; BSR set to: 5

	movlw	high(02Bh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1468+1))&0ffh
	movlw	low(02Bh)
	movwf	((_menu_update_edit_value$1468))&0ffh
	goto	l15285
	
l15283:; BSR set to: 5

	movlw	high(02Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1468+1))&0ffh
	movlw	low(02Dh)
	movwf	((_menu_update_edit_value$1468))&0ffh
	
l15285:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_225)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_225)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu_update_edit_value$1468),0+((c:?_sprintf)+04h)
	movff	(_menu_update_edit_value$1468+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+0Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	call	_sprintf	;wreg free
	line	1284
	
l15287:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@from))^00h,c
	clrf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1286
	
l15289:
	movlb	5	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u20581
	goto	u20580
u20581:
	goto	l15299
u20580:
	line	1289
	
l15291:; BSR set to: 5

	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u20591
	goto	u20590
u20591:
	goto	l918
u20590:
	line	1290
	
l15293:; BSR set to: 5

	decf	(0+(_menu+08h))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@blink_pos))&0ffh
	goto	l15295
	line	1291
	
l918:; BSR set to: 5

	line	1292
	movff	0+(_menu+08h),(menu_update_edit_value@blink_pos)
	line	1294
	
l15295:
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
	goto	u20601
	goto	u20600

u20601:
	goto	l15299
u20600:
	line	1295
	
l15297:; BSR set to: 0

	movf	((menu_update_edit_value@blink_pos))&0ffh,w
	addlw	low(menu_update_edit_value@display_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1299
	
l15299:
	movlb	5	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u20611
	goto	u20610
u20611:
	goto	l15303
u20610:
	
l15301:; BSR set to: 5

	movlw	high(0Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1472+1))&0ffh
	movlw	low(0Dh)
	movwf	((_menu_update_edit_value$1472))&0ffh
	goto	l15305
	
l15303:; BSR set to: 5

	movlw	high(0Eh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1472+1))&0ffh
	movlw	low(0Eh)
	movwf	((_menu_update_edit_value$1472))&0ffh
	
l15305:; BSR set to: 0

	movff	(_menu_update_edit_value$1472),(menu_update_edit_value@start_col)
	line	1300
	
l15307:; BSR set to: 0

	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	1301
	
l15309:
		movlw	low(STR_226)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_226)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1303
	
l15311:
	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	movlb	0	; () banked
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	1304
	
l15313:
		movlw	low(STR_227)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_227)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1305
	
l15315:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1306
	
l15317:
		movlw	low(STR_228)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_228)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1307
	
l908:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_edit_value
	__end_of_menu_update_edit_value:
	signat	_menu_update_edit_value,89
	global	_menu_init

;; *************** function _menu_init *****************
;; Defined at:
;;		line 934 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/4
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
psect	text9,class=CODE,space=0,reloc=2,group=0
	line	934
global __ptext9
__ptext9:
psect	text9
	file	"src\menu.c"
	line	934
	
_menu_init:
;incstack = 0
	callstack 28
	line	936
	
l14701:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu))&0ffh
	line	937
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	938
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	939
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	940
	movlw	low(0)
	movwf	(0+(_menu+05h))&0ffh
	line	941
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	942
	
l755:; BSR set to: 5

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_init
	__end_of_menu_init:
	signat	_menu_init,89
	global	_menu_handle_encoder

;; *************** function _menu_handle_encoder *****************
;; Defined at:
;;		line 1902 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  delta           2   87[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;  edit_flag       2  160[BANK1 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), NULL(0), 
;;  opts            2  154[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  buf            50  100[BANK1 ] unsigned char [50]
;;  clock_flag      2  162[BANK1 ] PTR unsigned char 
;;		 -> display_edit_flag(1), relay_high_edit_flag(1), enable_edit_flag(1), NULL(0), 
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
;;		On entry : 0/5
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
psect	text10,class=CODE,space=0,reloc=2,group=0
	line	1902
global __ptext10
__ptext10:
psect	text10
	file	"src\menu.c"
	line	1902
	
_menu_handle_encoder:; BSR set to: 5

;incstack = 0
	callstack 22
	line	1907
	
l14943:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u19841
	goto	u19840
u19841:
	goto	l15065
u19840:
	line	1909
	
l14945:; BSR set to: 5

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u19851
	goto	u19850

u19851:
	goto	l1180
u19850:
	line	1912
	
l14947:; BSR set to: 5

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19861
	goto	u19860

u19861:
	goto	l15009
u19860:
	line	1915
	
l14949:; BSR set to: 5

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_296)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_296)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(c:menu_handle_encoder@delta),0+((c:?_sprintf)+06h)
	movff	(c:menu_handle_encoder@delta+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1916
	
l14951:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1919
	
l14953:
		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19871
	goto	u19870

u19871:
	goto	l14959
u19870:
	line	1922
	
l14955:; BSR set to: 5

	movf	((c:menu_handle_encoder@delta))^00h,c,w
	
	call	_handle_time_rotation
	line	1923
	call	_menu_update_time_value	;wreg free
	goto	l1180
	line	1924
	
l14957:
	goto	l1180
	line	1927
	
l14959:; BSR set to: 5

		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1928
		movlw	low(0)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1930
	
l14961:; BSR set to: 1

	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19881
	goto	u19880
u19881:
	goto	l14965
u19880:
	line	1932
	
l14963:; BSR set to: 5

		movlw	low(_menu_item_options)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1933
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1934
	goto	l1182
	line	1935
	
l14965:; BSR set to: 5

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19891
	goto	u19890

u19891:
	goto	l14969
u19890:
	line	1937
	
l14967:; BSR set to: 5

		movlw	low(_menu_item_options+048h)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1938
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1939
	goto	l1182
	line	1940
	
l14969:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19901
	goto	u19900

u19901:
	goto	l1182
u19900:
	line	1942
	
l14971:; BSR set to: 5

		movlw	low(_menu_item_options+03Ch)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1943
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1946
	
l1182:
	movlb	1	; () banked
	movf	((menu_handle_encoder@clock_opts))&0ffh,w
iorwf	((menu_handle_encoder@clock_opts+1))&0ffh,w
	btfsc	status,2
	goto	u19911
	goto	u19910

u19911:
	goto	l1180
u19910:
	
l14973:; BSR set to: 1

	movf	((menu_handle_encoder@clock_flag))&0ffh,w
iorwf	((menu_handle_encoder@clock_flag+1))&0ffh,w
	btfsc	status,2
	goto	u19921
	goto	u19920

u19921:
	goto	l1180
u19920:
	line	1948
	
l14975:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_297)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_297)
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
	line	1949
	
l14977:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1951
	
l14979:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u19931
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u19930
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u19931
	goto	u19930

u19931:
	goto	l14987
u19930:
	line	1953
	
l14981:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	incf	indf2

	line	1954
	
l14983:
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
	goto	u19941
	goto	u19940

u19941:
	goto	l14995
u19940:
	line	1955
	
l14985:; BSR set to: 0

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	goto	l14995
	line	1957
	
l14987:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u19950
	goto	u19951

u19951:
	goto	l14995
u19950:
	line	1959
	
l14989:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u19961
	goto	u19960
u19961:
	goto	l14993
u19960:
	line	1960
	
l14991:
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

	goto	l14995
	line	1962
	
l14993:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	decf	indf2

	line	1966
	
l14995:
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
	goto	u19971
	goto	u19970

u19971:
	goto	l14999
u19970:
	line	1967
	
l14997:; BSR set to: 0

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	line	1969
	
l14999:; BSR set to: 0

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_298)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_298)
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
	line	1970
	
l15001:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1973
	
l15003:
	movlb	5	; () banked
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
	line	1974
	
l15005:
	call	_menu_draw_clock	;wreg free
	goto	l1180
	line	1981
	
l15009:; BSR set to: 5

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
	line	1982
	movlb	5	; () banked
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
	line	1985
	
l15011:; BSR set to: 1

	movff	(menu_handle_encoder@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_option_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u19981
	goto	u19980
u19981:
	goto	l15043
u19980:
	line	1987
	
l15013:
	movff	(menu_handle_encoder@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_encoder@edit_flag)
	movff	1+?_get_option_edit_flag,(menu_handle_encoder@edit_flag+1)
	line	1988
	movff	(menu_handle_encoder@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_encoder@opts)
	movff	1+?_get_item_options_for_field,(menu_handle_encoder@opts+1)
	line	1990
	
l15015:
	movlb	1	; () banked
	movf	((menu_handle_encoder@edit_flag))&0ffh,w
iorwf	((menu_handle_encoder@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u19991
	goto	u19990

u19991:
	goto	l1180
u19990:
	
l15017:; BSR set to: 1

	movf	((menu_handle_encoder@opts))&0ffh,w
iorwf	((menu_handle_encoder@opts+1))&0ffh,w
	btfsc	status,2
	goto	u20001
	goto	u20000

u20001:
	goto	l1180
u20000:
	line	1992
	
l15019:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20011
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u20010
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u20011
	goto	u20010

u20011:
	goto	l15027
u20010:
	line	1994
	
l15021:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	incf	indf2

	line	1995
	
l15023:; BSR set to: 1

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
	goto	u20021
	goto	u20020

u20021:
	goto	l15035
u20020:
	line	1996
	
l15025:; BSR set to: 0

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	goto	l15035
	line	1998
	
l15027:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20030
	goto	u20031

u20031:
	goto	l15035
u20030:
	line	2000
	
l15029:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u20041
	goto	u20040
u20041:
	goto	l15033
u20040:
	line	2001
	
l15031:; BSR set to: 1

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

	goto	l15035
	line	2003
	
l15033:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	decf	indf2

	line	2007
	
l15035:
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
	goto	u20051
	goto	u20050

u20051:
	goto	l15039
u20050:
	line	2008
	
l15037:; BSR set to: 0

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	line	2011
	
l15039:; BSR set to: 0

	movlb	5	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20061
	goto	u20060

u20061:
	goto	l14957
u20060:
	line	2013
	
l15041:; BSR set to: 5

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
	line	2014
	call	_menu_draw_input	;wreg free
	goto	l1180
	line	2018
	
l15043:
	movff	(menu_handle_encoder@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_numeric_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u20071
	goto	u20070
u20071:
	goto	l15053
u20070:
	line	2020
	
l15045:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20080
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u20081
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u20081
	goto	u20080

u20081:
	goto	l15049
u20080:
	
l15047:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1675))&0ffh
	setf	((_menu_handle_encoder$1675+1))&0ffh
	goto	l15051
	
l15049:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1675+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1675))&0ffh
	
l15051:; BSR set to: 1

	movf	((_menu_handle_encoder$1675))&0ffh,w
	
	call	_handle_numeric_rotation
	line	2021
	goto	l1180
	line	2022
	
l15053:
	movff	(menu_handle_encoder@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_time_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u20091
	goto	u20090
u20091:
	goto	l14957
u20090:
	line	2024
	
l15055:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20100
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u20101
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u20101
	goto	u20100

u20101:
	goto	l15059
u20100:
	
l15057:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1676))&0ffh
	setf	((_menu_handle_encoder$1676+1))&0ffh
	goto	l15061
	
l15059:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1676+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1676))&0ffh
	
l15061:; BSR set to: 1

	movf	((_menu_handle_encoder$1676))&0ffh,w
	
	call	_handle_time_rotation
	goto	l1180
	line	2031
	
l15065:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20111
	goto	u20110

u20111:
	goto	l15091
u20110:
	
l15067:; BSR set to: 5

	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u20121
	goto	u20120
u20121:
	goto	l15091
u20120:
	
l15069:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u20131
	goto	u20130
u20131:
	goto	l15091
u20130:
	
l15071:; BSR set to: 5

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u20141
	goto	u20140

u20141:
	goto	l15091
u20140:
	line	2033
	
l15073:; BSR set to: 5

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20151
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u20150
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u20151
	goto	u20150

u20151:
	goto	l15081
u20150:
	line	2035
	
l15075:; BSR set to: 5

	incf	(0+(_menu+01Ch))&0ffh
	line	2036
	
l15077:; BSR set to: 5

		movlw	03h-1
	cpfsgt	(0+(_menu+01Ch))&0ffh
	goto	u20161
	goto	u20160

u20161:
	goto	l15087
u20160:
	line	2037
	
l15079:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Ch))&0ffh
	goto	l15087
	line	2041
	
l15081:; BSR set to: 5

	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u20171
	goto	u20170
u20171:
	goto	l15085
u20170:
	line	2042
	
l15083:; BSR set to: 5

	movlw	low(02h)
	movwf	(0+(_menu+01Ch))&0ffh
	goto	l15087
	line	2044
	
l15085:; BSR set to: 5

	decf	(0+(_menu+01Ch))&0ffh
	line	2046
	
l15087:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	goto	l1180
	line	2051
	
l15091:; BSR set to: 5

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20181
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u20180
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u20181
	goto	u20180

u20181:
	goto	l15109
u20180:
	line	2055
	
l15093:; BSR set to: 5

		movlw	low(menu_handle_encoder@buf_1677)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1677)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_299)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_299)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	2056
	
l15095:
		movlw	low(menu_handle_encoder@buf_1677)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1677)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2059
	
l15097:
	movlw	low(-1)
	movlb	5	; () banked
	addwf	(0+(_menu+02h))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	clrf	1+(??_menu_handle_encoder+0+0)&0ffh
	movlw	high(-1)
	addwfc	1+(??_menu_handle_encoder+0+0)&0ffh
	movlb	5	; () banked
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
	goto	u20191
	goto	u20190

u20191:
	goto	l15105
u20190:
	line	2061
	
l15099:; BSR set to: 0

	movlb	5	; () banked
	incf	((_menu))&0ffh
	line	2064
	
l15101:; BSR set to: 5

	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	clrf	(??_menu_handle_encoder+0+0+1)&0ffh

	movlw	03h
	addwf	(??_menu_handle_encoder+0+0)&0ffh
	movlw	0
	addwfc	(??_menu_handle_encoder+0+1)&0ffh
	movlb	5	; () banked
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
	goto	u20201
	goto	u20200

u20201:
	goto	l15105
u20200:
	line	2066
	
l15103:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+01h))&0ffh
	line	2070
	
l15105:
		movlw	low(menu_handle_encoder@buf_1677)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1677)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_300)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_300)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2071
	
l15107:
		movlw	low(menu_handle_encoder@buf_1677)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1677)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2072
	goto	l15127
	line	2073
	
l15109:; BSR set to: 5

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20210
	goto	u20211

u20211:
	goto	l15127
u20210:
	line	2077
	
l15111:; BSR set to: 5

		movlw	low(menu_handle_encoder@buf_1680)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1680)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_301)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_301)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	2078
	
l15113:
		movlw	low(menu_handle_encoder@buf_1680)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1680)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2081
	
l15115:
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u20221
	goto	u20220
u20221:
	goto	l15123
u20220:
	line	2083
	
l15117:; BSR set to: 5

	decf	((_menu))&0ffh
	line	2086
	
l15119:; BSR set to: 5

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u20231
	goto	u20230

u20231:
	goto	l15123
u20230:
	line	2088
	
l15121:; BSR set to: 5

	decf	(0+(_menu+01h))&0ffh
	line	2092
	
l15123:; BSR set to: 5

		movlw	low(menu_handle_encoder@buf_1680)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1680)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_302)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_302)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2093
	
l15125:
		movlw	low(menu_handle_encoder@buf_1680)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1680)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2097
	
l15127:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u20241
	goto	u20240
u20241:
	goto	l1180
u20240:
	line	2099
	
l15129:; BSR set to: 5

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20251
	goto	u20250
u20251:
	goto	l15133
u20250:
	line	2100
	
l15131:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	goto	l1180
	line	2101
	
l15133:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20261
	goto	u20260

u20261:
	goto	l15137
u20260:
	line	2102
	
l15135:; BSR set to: 5

	call	_menu_draw_input	;wreg free
	goto	l1180
	line	2103
	
l15137:; BSR set to: 5

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20271
	goto	u20270

u20271:
	goto	l15141
u20270:
	line	2104
	
l15139:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	goto	l1180
	line	2105
	
l15141:; BSR set to: 5

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20281
	goto	u20280

u20281:
	goto	l15145
u20280:
	goto	l15005
	line	2107
	
l15145:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20291
	goto	u20290

u20291:
	goto	l14957
u20290:
	goto	l15087
	line	2110
	
l1180:
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
;;		On entry : 3B/5
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
psect	text11,class=CODE,space=0,reloc=2,group=0
	line	474
global __ptext11
__ptext11:
psect	text11
	file	"src\menu.c"
	line	474
	
_handle_time_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_time_rotation@direction))&0ffh
	line	476
	
l13539:
		movlw	low(STR_139)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_139)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	480
	
l13541:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_140)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_140)
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
	
l13543:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	483
	
l13545:
	movlb	5	; () banked
	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u18171
	goto	u18170
u18171:
	goto	l13587
u18170:
	line	485
	
l13547:; BSR set to: 5

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u18181
	goto	u18180

u18181:
	goto	l13569
u18180:
	line	487
	
l13549:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+012h))&0ffh
	line	489
	
l13551:; BSR set to: 5

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18191
	goto	u18190

u18191:
	goto	l13559
u18190:
	
l13553:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18201
	goto	u18200

u18201:
	goto	l13559
u18200:
	
l13555:; BSR set to: 5

		movlw	03h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u18211
	goto	u18210

u18211:
	goto	l13559
u18210:
	line	490
	
l13557:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+012h))&0ffh
	goto	l13613
	line	491
	
l13559:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u18221
	goto	u18220

u18221:
	goto	l13565
u18220:
	
l13561:; BSR set to: 5

		movlw	018h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u18231
	goto	u18230

u18231:
	goto	l13565
u18230:
	goto	l13557
	line	493
	
l13565:; BSR set to: 5

		movlw	064h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u18241
	goto	u18240

u18241:
	goto	l625
u18240:
	goto	l13557
	line	498
	
l13569:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u18251
	goto	u18250
u18251:
	goto	l13585
u18250:
	line	501
	
l13571:; BSR set to: 5

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18261
	goto	u18260

u18261:
	goto	l13577
u18260:
	
l13573:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18271
	goto	u18270

u18271:
	goto	l13577
u18270:
	line	502
	
l13575:; BSR set to: 5

	movlw	low(02h)
	movwf	(0+(_menu+012h))&0ffh
	goto	l13613
	line	504
	
l13577:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+010h))&0ffh,w
	btfsc	status,2
	goto	u18281
	goto	u18280

u18281:
	goto	l13581
u18280:
	
l13579:; BSR set to: 5

	movlw	high(063h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1284+1))&0ffh
	movlw	low(063h)
	movwf	((_handle_time_rotation$1284))&0ffh
	goto	l13583
	
l13581:; BSR set to: 5

	movlw	high(017h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1284+1))&0ffh
	movlw	low(017h)
	movwf	((_handle_time_rotation$1284))&0ffh
	
l13583:; BSR set to: 0

	movff	(_handle_time_rotation$1284),0+(_menu+012h)
	goto	l13613
	line	508
	
l13585:; BSR set to: 5

	decf	(0+(_menu+012h))&0ffh
	goto	l13613
	line	510
	
l625:; BSR set to: 5

	line	511
	goto	l13613
	line	512
	
l13587:; BSR set to: 5

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u18291
	goto	u18290

u18291:
	goto	l13613
u18290:
	line	515
	
l13589:; BSR set to: 5

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18301
	goto	u18300

u18301:
	goto	l13599
u18300:
	
l13591:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18311
	goto	u18310

u18311:
	goto	l13599
u18310:
	
l13593:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u18321
	goto	u18320

u18321:
	goto	l13599
u18320:
	line	518
	
l13595:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l637
	line	522
	
l13599:; BSR set to: 5

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u18331
	goto	u18330

u18331:
	goto	l13607
u18330:
	line	524
	
l13601:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+013h))&0ffh
	line	525
	
l13603:; BSR set to: 5

		movlw	03Ch-1
	cpfsgt	(0+(_menu+013h))&0ffh
	goto	u18341
	goto	u18340

u18341:
	goto	l13613
u18340:
	line	526
	
l13605:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l13613
	line	530
	
l13607:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	btfss	status,2
	goto	u18351
	goto	u18350
u18351:
	goto	l13611
u18350:
	line	531
	
l13609:; BSR set to: 5

	movlw	low(03Bh)
	movwf	(0+(_menu+013h))&0ffh
	goto	l13613
	line	533
	
l13611:; BSR set to: 5

	decf	(0+(_menu+013h))&0ffh
	line	537
	
l13613:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_141)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_141)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	538
	
l13615:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	539
	
l637:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_time_rotation
	__end_of_handle_time_rotation:
	signat	_handle_time_rotation,4217
	global	_handle_numeric_rotation

;; *************** function _handle_numeric_rotation *****************
;; Defined at:
;;		line 1162 in file "src\menu.c"
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
;;		On entry : 3B/5
;;		On exit  : 3A/0
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
psect	text12,class=CODE,space=0,reloc=2,group=0
	line	1162
global __ptext12
__ptext12:
psect	text12
	file	"src\menu.c"
	line	1162
	
_handle_numeric_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_numeric_rotation@direction))&0ffh
	line	1164
	
l13437:
		movlw	low(STR_222)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_222)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1167
	
l13439:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_223)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_223)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+08h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Fh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1168
	
l13441:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1171
	
l13443:
	movlb	5	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u17931
	goto	u17930
u17931:
	goto	l13537
u17930:
	
l13445:; BSR set to: 5

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u17941
	goto	u17940
u17941:
	goto	l13537
u17940:
	line	1173
	
l13447:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+08h))&0ffh
	goto	l13537
	line	1179
	
l13449:; BSR set to: 5

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u17951
	goto	u17950
u17951:
	goto	l900
u17950:
	
l13451:; BSR set to: 5

	movlb	0	; () banked
	movf	((handle_numeric_rotation@direction))&0ffh,w
	btfsc	status,2
	goto	u17961
	goto	u17960
u17961:
	goto	l900
u17960:
	line	1181
	
l13453:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u17971
	goto	u17970
u17971:
	movlw	1
	goto	u17980
u17970:
	movlw	0
u17980:
	movwf	(0+(_menu+09h))&0ffh
	goto	l900
	line	1186
	
l13455:; BSR set to: 5

	movlb	0	; () banked
		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u17991
	goto	u17990

u17991:
	goto	l13463
u17990:
	line	1188
	
l13457:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+0Ah))&0ffh
	line	1189
	
l13459:; BSR set to: 5

		movlw	06h-1
	cpfsgt	(0+(_menu+0Ah))&0ffh
	goto	u18001
	goto	u18000

u18001:
	goto	l900
u18000:
	line	1190
	
l13461:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l900
	line	1192
	
l13463:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u18010
	goto	u18011

u18011:
	goto	l900
u18010:
	line	1194
	
l13465:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u18021
	goto	u18020
u18021:
	goto	l13469
u18020:
	line	1195
	
l13467:; BSR set to: 5

	movlw	low(05h)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l900
	line	1197
	
l13469:; BSR set to: 5

	decf	(0+(_menu+0Ah))&0ffh
	goto	l900
	line	1203
	
l13471:; BSR set to: 5

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u18031
	goto	u18030

u18031:
	goto	l13475
u18030:
	
l13473:; BSR set to: 5

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1457+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1457))&0ffh
	goto	l13477
	
l13475:; BSR set to: 5

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1457+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1457))&0ffh
	
l13477:; BSR set to: 0

	movff	(_handle_numeric_rotation$1457),(handle_numeric_rotation@max_tens)
	line	1204
	
l13479:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u18041
	goto	u18040

u18041:
	goto	l13491
u18040:
	line	1206
	
l13481:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u18051
	goto	u18050
u18051:
	goto	l13485
u18050:
	goto	l900
	line	1208
	
l13485:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+0Bh))&0ffh
	line	1209
	
l13487:; BSR set to: 5

		movf	(0+(_menu+0Bh))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfsc	status,0
	goto	u18061
	goto	u18060

u18061:
	goto	l900
u18060:
	line	1210
	
l13489:; BSR set to: 0

	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	goto	l900
	line	1212
	
l13491:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u18070
	goto	u18071

u18071:
	goto	l900
u18070:
	line	1214
	
l13493:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u18081
	goto	u18080
u18081:
	goto	l13497
u18080:
	goto	l900
	line	1216
	
l13497:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+0Bh))&0ffh,w
	btfss	status,2
	goto	u18091
	goto	u18090
u18091:
	goto	l13501
u18090:
	line	1217
	
l13499:; BSR set to: 5

	movff	(handle_numeric_rotation@max_tens),0+(_menu+0Bh)
	goto	l900
	line	1219
	
l13501:; BSR set to: 5

	decf	(0+(_menu+0Bh))&0ffh
	goto	l900
	line	1226
	
l13503:; BSR set to: 5

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u18101
	goto	u18100

u18101:
	goto	l13507
u18100:
	
l13505:; BSR set to: 5

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1459+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1459))&0ffh
	goto	l13509
	
l13507:; BSR set to: 5

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1459+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1459))&0ffh
	
l13509:; BSR set to: 0

	movff	(_handle_numeric_rotation$1459),(handle_numeric_rotation@max_units)
	line	1227
	
l13511:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u18111
	goto	u18110

u18111:
	goto	l13523
u18110:
	line	1229
	
l13513:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u18121
	goto	u18120
u18121:
	goto	l13517
u18120:
	goto	l900
	line	1231
	
l13517:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+0Ch))&0ffh
	line	1232
	
l13519:; BSR set to: 5

		movf	(0+(_menu+0Ch))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_units))&0ffh,w
	btfsc	status,0
	goto	u18131
	goto	u18130

u18131:
	goto	l900
u18130:
	line	1233
	
l13521:; BSR set to: 0

	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	goto	l900
	line	1235
	
l13523:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u18140
	goto	u18141

u18141:
	goto	l900
u18140:
	line	1237
	
l13525:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u18151
	goto	u18150
u18151:
	goto	l13529
u18150:
	goto	l900
	line	1239
	
l13529:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+0Ch))&0ffh,w
	btfss	status,2
	goto	u18161
	goto	u18160
u18161:
	goto	l13533
u18160:
	line	1240
	
l13531:; BSR set to: 5

	movff	(handle_numeric_rotation@max_units),0+(_menu+0Ch)
	goto	l900
	line	1242
	
l13533:; BSR set to: 5

	decf	(0+(_menu+0Ch))&0ffh
	goto	l900
	line	1176
	
l13537:; BSR set to: 5

	movf	(0+(_menu+08h))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l13449
	xorlw	1^0	; case 1
	skipnz
	goto	l13455
	xorlw	2^1	; case 2
	skipnz
	goto	l13471
	xorlw	3^2	; case 3
	skipnz
	goto	l13503
	goto	l900

	line	1247
	
l900:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_numeric_rotation
	__end_of_handle_numeric_rotation:
	signat	_handle_numeric_rotation,4217
	global	_menu_handle_button

;; *************** function _menu_handle_button *****************
;; Defined at:
;;		line 2116 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  press_type      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  press_type      1  250[BANK2 ] unsigned char 
;;  i               1  249[BANK1 ] unsigned char 
;;  opts            2  247[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  edit_flag       2  121[BANK0 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), NULL(0), 
;;  buf            50  150[BANK2 ] unsigned char [50]
;;  current_val     2  123[BANK0 ] unsigned int 
;;  current_val     2  125[BANK0 ] int 
;;  buf            80  167[BANK1 ] unsigned char [80]
;;  sensor_type     1  255[BANK2 ] unsigned char 
;;  flow_type       1  253[BANK2 ] unsigned char 
;;  verify_time     7  150[BANK3 ] struct .
;;  new_value       2  250[BANK1 ] unsigned int 
;;  buf            50    0[BANK3 ] unsigned char [50]
;;  buf            50  200[BANK2 ] unsigned char [50]
;;  buf            80   87[BANK1 ] unsigned char [80]
;;  new_time        7  157[BANK3 ] struct .
;;  buf            50   50[BANK3 ] unsigned char [50]
;;  new_value       2  165[BANK3 ] int 
;;  new_seconds     2  251[BANK2 ] unsigned int 
;;  buf            50   50[BANK2 ] unsigned char [50]
;;  buf            50    0[BANK2 ] unsigned char [50]
;;  buf            50  100[BANK3 ] unsigned char [50]
;;  edit_flag       2  254[BANK1 ] PTR unsigned char 
;;		 -> display_edit_flag(1), relay_high_edit_flag(1), enable_edit_flag(1), NULL(0), 
;;  opts            2  252[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  buf            50  100[BANK2 ] unsigned char [50]
;;  opts            2  119[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  edit_flag       2  117[BANK0 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), NULL(0), 
;;  sensor_type     1  164[BANK3 ] unsigned char 
;;  flow_type       1  254[BANK2 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/5
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      12     169     256     167       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0      17     169     256     167       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      609 bytes
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
;;		_init_datetime_editor
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
;;		_rtc_read_time
;;		_rtc_set_time
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
psect	text13,class=CODE,space=0,reloc=2,group=0
	line	2116
global __ptext13
__ptext13:
psect	text13
	file	"src\menu.c"
	line	2116
	
_menu_handle_button:
;incstack = 0
	callstack 22
	movlb	2	; () banked
	movwf	((menu_handle_button@press_type))&0ffh
	line	2121
	
l15319:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u20621
	goto	u20620
u20621:
	goto	l15757
u20620:
	line	2123
	
l15321:; BSR set to: 5

	movlb	2	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u20631
	goto	u20630

u20631:
	goto	l15501
u20630:
	line	2126
	
l15323:; BSR set to: 2

		movlw	3
	movlb	5	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20641
	goto	u20640

u20641:
	goto	l15425
u20640:
	line	2131
	
l15325:; BSR set to: 5

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_303)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_303)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2132
	
l15327:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2135
	
l15329:
		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2136
	
l15331:; BSR set to: 1

		movlw	low(0)
	movwf	((menu_handle_button@edit_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@edit_flag+1))&0ffh

	line	2138
	
l15333:; BSR set to: 1

	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20651
	goto	u20650
u20651:
	goto	l15343
u20650:
	line	2140
	
l15335:; BSR set to: 5

		movlw	low(_menu_item_options)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2141
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2142
	
l15337:; BSR set to: 1

	movff	(c:_enable_edit_flag),(_system_config)
	line	2143
	
l15339:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_304)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_304)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2144
	
l15341:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2145
	goto	l1251
	line	2146
	
l15343:; BSR set to: 5

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20661
	goto	u20660

u20661:
	goto	l15353
u20660:
	line	2148
	
l15345:; BSR set to: 5

		movlw	low(_menu_item_options+048h)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2149
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2150
	
l15347:; BSR set to: 1

	movff	(c:_relay_high_edit_flag),0+(_system_config+06h)
	line	2151
	
l15349:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_305)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_305)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+06h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	goto	l15341
	line	2154
	
l15353:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20671
	goto	u20670

u20671:
	goto	l15403
u20670:
	line	2157
	
l15355:; BSR set to: 5

	incf	(0+(_menu+011h))&0ffh
	line	2158
	
l15357:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2161
	
l15359:; BSR set to: 5

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u20681
	goto	u20680

u20681:
	goto	l15365
u20680:
	
l15361:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u20691
	goto	u20690

u20691:
	goto	l15365
u20690:
	line	2163
	
l15363:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	line	2166
	
l15365:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2168
	
l15367:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_306)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_306)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2169
	
l15369:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2172
	
l15371:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_307)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_307)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2173
	
l15373:
	call	_menu_draw_clock	;wreg free
	line	2175
	
l15375:
		movlw	02h-1
	movlb	5	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u20701
	goto	u20700

u20701:
	goto	l1262
u20700:
	line	2178
	
l15377:; BSR set to: 5

	movf	(0+(_menu+012h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+(_menu+013h))&0ffh,w
	movlb	0	; () banked
	addwf	(??_menu_handle_button+0+0)&0ffh,w
	movlb	1	; () banked
	movwf	((menu_handle_button@new_value))&0ffh
	movlb	5	; () banked
	movlw	0
	movlb	0	; () banked
	addwfc	(??_menu_handle_button+0+1)&0ffh,w
	movlb	1	; () banked
	movwf	1+((menu_handle_button@new_value))&0ffh
	line	2181
	
l15379:; BSR set to: 1

	movf	((menu_handle_button@new_value))&0ffh,w
iorwf	((menu_handle_button@new_value+1))&0ffh,w
	btfss	status,2
	goto	u20711
	goto	u20710

u20711:
	goto	l15383
u20710:
	line	2182
	
l15381:; BSR set to: 1

	movlw	high(01h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(01h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	2183
	
l15383:; BSR set to: 1

		movf	((menu_handle_button@new_value+1))&0ffh,w
	bnz	u20720
	movlw	121
	subwf	 ((menu_handle_button@new_value))&0ffh,w
	btfss	status,0
	goto	u20721
	goto	u20720

u20721:
	goto	l15387
u20720:
	line	2184
	
l15385:; BSR set to: 1

	movlw	high(078h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(078h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	2186
	
l15387:; BSR set to: 1

	movff	(menu_handle_button@new_value),0+(_system_config+07h)
	line	2189
	
l15389:; BSR set to: 1

		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_308)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_308)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(03Ch)
	movwf	((c:___lbdiv@divisor))^00h,c
	movlb	7	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbdiv
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movf	((??_menu_handle_button+0+0))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	7	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbmod
	movlb	0	; () banked
	movwf	(??_menu_handle_button+1+0)&0ffh
	movf	((??_menu_handle_button+1+0))&0ffh,w
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2190
	
l15391:
		movff	0+(_clock_menu+0Ch),(c:strcpy@to)
	movff	1+(_clock_menu+0Ch),(c:strcpy@to+1)

		movlw	low(_value_relay_pulse)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	2192
	
l15393:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_309)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_309)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+07h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2193
	
l15395:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2194
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	line	2195
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	2196
	
l15397:; BSR set to: 5

	call	_menu_draw_clock	;wreg free
	line	2200
	
l15399:
	movlw	(0)&0ffh
	
	call	_trigger_relay_pulse
	line	2201
	goto	l1262
	line	2202
	
l1256:
	line	2204
	goto	l1262
	line	2209
	
l15403:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20731
	goto	u20730

u20731:
	goto	l1251
u20730:
	line	2211
	
l15405:; BSR set to: 5

		movlw	low(_menu_item_options+03Ch)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2212
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2216
	
l1251:
	movlb	1	; () banked
	movf	((menu_handle_button@opts))&0ffh,w
iorwf	((menu_handle_button@opts+1))&0ffh,w
	btfsc	status,2
	goto	u20741
	goto	u20740

u20741:
	goto	l15419
u20740:
	
l15407:; BSR set to: 1

	movf	((menu_handle_button@edit_flag))&0ffh,w
iorwf	((menu_handle_button@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u20751
	goto	u20750

u20751:
	goto	l15419
u20750:
	
l15409:; BSR set to: 1

	movff	(menu_handle_button@edit_flag),fsr2l
	movff	(menu_handle_button@edit_flag+1),fsr2h
	movf	indf2,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	01h
	movlb	1	; () banked
	addwf	((menu_handle_button@opts))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+1+0)&0ffh
	movlw	0
	movlb	1	; () banked
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
	goto	u20761
	goto	u20760
u20761:
	goto	l15419
u20760:
	line	2218
	
l15411:; BSR set to: 0

	movlb	5	; () banked
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
	movlb	1	; () banked
	addwf	((menu_handle_button@opts))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+3+0)&0ffh
	movf	(??_menu_handle_button+1+1)&0ffh,w
	movlb	1	; () banked
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
	line	2219
	
l15413:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	line	2220
	
l15415:; BSR set to: 5

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_310)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_310)
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
	line	2221
	
l15417:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2224
	
l15419:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2225
	
l15421:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1262
	line	2230
	
l15425:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20771
	goto	u20770

u20771:
	goto	l15443
u20770:
	
l15427:; BSR set to: 5

	movf	(0+(_menu+01Eh))&0ffh,w
	btfss	status,2
	goto	u20781
	goto	u20780
u20781:
	goto	l15443
u20780:
	line	2237
	
l15429:; BSR set to: 5

		movlw	low(menu_handle_button@buf_1707)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1707)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_311)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_311)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_system_config+020h),0+((c:?_sprintf)+06h)
	movff	1+(_system_config+020h),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	2238
	
l15431:
		movlw	low(menu_handle_button@buf_1707)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1707)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2240
	
l15433:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	line	2241
	
l15435:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	2242
	
l15437:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2243
	
l15439:
	call	_menu_draw_utility	;wreg free
	goto	l1262
	line	2248
	
l15443:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20791
	goto	u20790

u20791:
	goto	l15501
u20790:
	
l15445:; BSR set to: 5

	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u20801
	goto	u20800
u20801:
	goto	l15501
u20800:
	line	2250
	
l15447:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2251
	
l15449:
	movlb	5	; () banked
	incf	(0+(_menu+01Dh))&0ffh
	line	2255
	
l15451:; BSR set to: 5

		movlw	low(menu_handle_button@buf_1709)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1709)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_312)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_312)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+01Ch),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Dh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2256
	
l15453:
		movlw	low(menu_handle_button@buf_1709)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1709)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2259
	
l15455:
		movlw	03h-1
	movlb	5	; () banked
	cpfsgt	(0+(_menu+01Dh))&0ffh
	goto	u20811
	goto	u20810

u20811:
	goto	l15495
u20810:
	line	2265
	
l15457:; BSR set to: 5

		movlw	low(menu_handle_button@buf_1711)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1711)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_313)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_313)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+016h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+017h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+018h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(_menu+019h),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	movff	0+(_menu+01Ah),0+((c:?_sprintf)+0Ch)
	clrf	(1+((c:?_sprintf)+0Ch))^00h,c
	movff	0+(_menu+01Bh),0+((c:?_sprintf)+0Eh)
	clrf	(1+((c:?_sprintf)+0Eh))^00h,c
	call	_sprintf	;wreg free
	line	2266
	
l15459:
		movlw	low(menu_handle_button@buf_1711)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1711)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2269
	
l15461:
	movff	0+(_menu+016h),0+(menu_handle_button@new_time+04h)
	line	2270
	
l15463:
	movff	0+(_menu+017h),0+(menu_handle_button@new_time+05h)
	line	2271
	
l15465:
	movff	0+(_menu+018h),0+(menu_handle_button@new_time+06h)
	line	2272
	
l15467:
	movff	0+(_menu+019h),0+(menu_handle_button@new_time+02h)
	line	2273
	
l15469:
	movff	0+(_menu+01Ah),0+(menu_handle_button@new_time+01h)
	line	2274
	
l15471:
	movff	0+(_menu+01Bh),(menu_handle_button@new_time)
	line	2275
	
l15473:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	(0+(menu_handle_button@new_time+03h))&0ffh
	line	2277
	
l15475:; BSR set to: 3

		movlw	low(menu_handle_button@new_time)
	movwf	((c:rtc_set_time@time))^00h,c
	movlw	high(menu_handle_button@new_time)
	movwf	((c:rtc_set_time@time+1))^00h,c

	call	_rtc_set_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u20821
	goto	u20820
u20821:
	goto	l15489
u20820:
	line	2279
	
l15477:
		movlw	low(STR_314)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_314)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2283
	
l15479:
		movlw	low(menu_handle_button@verify_time)
	movwf	((c:rtc_read_time@time))^00h,c
	movlw	high(menu_handle_button@verify_time)
	movwf	((c:rtc_read_time@time+1))^00h,c

	call	_rtc_read_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u20831
	goto	u20830
u20831:
	goto	l15487
u20830:
	line	2288
	
l15481:
		movlw	low(menu_handle_button@buf_1730)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1730)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_315)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_315)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(menu_handle_button@verify_time+04h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(menu_handle_button@verify_time+05h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(menu_handle_button@verify_time+06h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(menu_handle_button@verify_time+02h),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	movff	0+(menu_handle_button@verify_time+01h),0+((c:?_sprintf)+0Ch)
	clrf	(1+((c:?_sprintf)+0Ch))^00h,c
	movff	(menu_handle_button@verify_time),0+((c:?_sprintf)+0Eh)
	clrf	(1+((c:?_sprintf)+0Eh))^00h,c
	call	_sprintf	;wreg free
	line	2289
	
l15483:
		movlw	low(menu_handle_button@buf_1730)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1730)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2290
	
l15485:
		movlw	low(STR_316)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_316)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2291
	goto	l15491
	line	2294
	
l15487:
		movlw	low(STR_317)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_317)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l15491
	line	2299
	
l15489:
		movlw	low(STR_318)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_318)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2302
	
l15491:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	goto	l15439
	line	2308
	
l15495:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l15439
	line	2317
	
l15501:
	movlb	5	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	3	; () banked
	movwf	((menu_handle_button@sensor_type))&0ffh
	line	2318
	movlb	5	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	2	; () banked
	movwf	((menu_handle_button@flow_type))&0ffh
	line	2321
	
l15503:; BSR set to: 2

	movff	(menu_handle_button@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_option_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u20841
	goto	u20840
u20841:
	goto	l15607
u20840:
	line	2323
	
l15505:
	movff	(menu_handle_button@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1737)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1737+1)
	line	2324
	movff	(menu_handle_button@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1738)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1738+1)
	line	2326
	
l15507:
	movlb	0	; () banked
	movf	((menu_handle_button@edit_flag_1737))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1737+1))&0ffh,w
	btfsc	status,2
	goto	u20851
	goto	u20850

u20851:
	goto	l15419
u20850:
	
l15509:; BSR set to: 0

	movf	((menu_handle_button@opts_1738))&0ffh,w
iorwf	((menu_handle_button@opts_1738+1))&0ffh,w
	btfsc	status,2
	goto	u20861
	goto	u20860

u20861:
	goto	l15419
u20860:
	line	2329
	
l15511:; BSR set to: 0

	movlb	5	; () banked
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
	movff	(menu_handle_button@edit_flag_1737),fsr2l
	movff	(menu_handle_button@edit_flag_1737+1),fsr2h
	movf	indf2,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movf	((??_menu_handle_button+0+0))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_button+1+0
	movff	prodh,??_menu_handle_button+1+0+1
	movf	(??_menu_handle_button+1+0)&0ffh,w
	addwf	((menu_handle_button@opts_1738))&0ffh,w
	movwf	(??_menu_handle_button+3+0)&0ffh
	movf	(??_menu_handle_button+1+1)&0ffh,w
	addwfc	((menu_handle_button@opts_1738+1))&0ffh,w
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
	line	2332
	
l15513:
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20871
	goto	u20870
u20871:
	goto	l15517
u20870:
	line	2334
	
l15515:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_enable_edit_flag),indf2

	line	2335
	goto	l15601
	line	2336
	
l15517:; BSR set to: 5

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20881
	goto	u20880

u20881:
	goto	l15529
u20880:
	line	2338
	
l15519:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_sensor_edit_flag),indf2

	line	2341
	
l15521:; BSR set to: 5

		movlw	2
	xorwf	((c:_sensor_edit_flag))^00h,c,w
	btfss	status,2
	goto	u20891
	goto	u20890

u20891:
	goto	l15527
u20890:
	
l15523:; BSR set to: 5

		movlw	2
	movlb	3	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfsc	status,2
	goto	u20901
	goto	u20900

u20901:
	goto	l15527
u20900:
	line	2343
	
l15525:; BSR set to: 3

	movlb	5	; () banked
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
	line	2347
	
l15527:
	movlb	5	; () banked
	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	2348
	goto	l15601
	line	2349
	
l15529:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20911
	goto	u20910

u20911:
	goto	l15537
u20910:
	
l15531:; BSR set to: 5

		movlw	2
	movlb	3	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u20921
	goto	u20920

u20921:
	goto	l15537
u20920:
	line	2351
	
l15533:; BSR set to: 3

	movlb	5	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_flow_type_edit_flag),indf2

	line	2354
	
l15535:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	2355
	goto	l15601
	line	2356
	
l15537:
		movlw	3
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20931
	goto	u20930

u20931:
	goto	l15545
u20930:
	
l15539:; BSR set to: 5

		movlw	2
	movlb	3	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u20941
	goto	u20940

u20941:
	goto	l15545
u20940:
	
l15541:; BSR set to: 3

	movlb	2	; () banked
		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u20951
	goto	u20950

u20951:
	goto	l15545
u20950:
	goto	l15601
	line	2359
	
l15543:
	goto	l15601
	line	2360
	
l15545:
		movlw	3
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20961
	goto	u20960

u20961:
	goto	l15553
u20960:
	
l15547:; BSR set to: 5

		movlw	2
	movlb	3	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u20971
	goto	u20970

u20971:
	goto	l15553
u20970:
	
l15549:; BSR set to: 3

	movlb	2	; () banked
	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u20981
	goto	u20980
u20981:
	goto	l15553
u20980:
	line	2362
	
l15551:; BSR set to: 2

	movlb	5	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_flow_units_edit_flag),indf2

	line	2363
	goto	l15601
	line	2364
	
l15553:
	movlb	3	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u20991
	goto	u20990
u20991:
	goto	l15571
u20990:
	line	2366
	
l15555:; BSR set to: 3

		movlw	9
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21001
	goto	u21000

u21001:
	goto	l15559
u21000:
	line	2367
	
l15557:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+038h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+038h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_high_edit_flag),indf2

	goto	l15601
	line	2368
	
l15559:; BSR set to: 5

		movlw	10
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21011
	goto	u21010

u21011:
	goto	l15563
u21010:
	line	2369
	
l15561:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+039h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+039h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_plp_edit_flag),indf2

	goto	l15601
	line	2370
	
l15563:; BSR set to: 5

		movlw	11
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21021
	goto	u21020

u21021:
	goto	l15567
u21020:
	line	2371
	
l15565:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_slp_edit_flag),indf2

	goto	l15601
	line	2372
	
l15567:; BSR set to: 5

		movlw	12
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21031
	goto	u21030

u21031:
	goto	l15543
u21030:
	line	2373
	
l15569:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_display_edit_flag),indf2

	goto	l15601
	line	2375
	
l15571:; BSR set to: 3

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21041
	goto	u21040

u21041:
	goto	l15581
u21040:
	line	2377
	
l15573:; BSR set to: 3

		movlw	6
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21051
	goto	u21050

u21051:
	goto	l15577
u21050:
	goto	l15557
	line	2379
	
l15577:; BSR set to: 5

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21061
	goto	u21060

u21061:
	goto	l15543
u21060:
	goto	l15569
	line	2382
	
l15581:; BSR set to: 3

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21071
	goto	u21070

u21071:
	goto	l15543
u21070:
	line	2384
	
l15583:; BSR set to: 3

	movlb	2	; () banked
	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u21081
	goto	u21080
u21081:
	goto	l15593
u21080:
	line	2386
	
l15585:; BSR set to: 2

		movlw	8
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21091
	goto	u21090

u21091:
	goto	l15589
u21090:
	line	2387
	
l15587:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Bh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Bh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_low_edit_flag),indf2

	goto	l15601
	line	2388
	
l15589:; BSR set to: 5

		movlw	9
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21101
	goto	u21100

u21101:
	goto	l15543
u21100:
	goto	l15569
	line	2393
	
l15593:; BSR set to: 2

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21111
	goto	u21110

u21111:
	goto	l15597
u21110:
	goto	l15587
	line	2395
	
l15597:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21121
	goto	u21120

u21121:
	goto	l15543
u21120:
	goto	l15569
	line	2400
	
l15601:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	goto	l15419
	line	2407
	
l15607:
	movff	(menu_handle_button@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_time_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u21131
	goto	u21130
u21131:
	goto	l15671
u21130:
	line	2409
	
l15609:
	movlb	5	; () banked
	incf	(0+(_menu+011h))&0ffh
	line	2410
	
l15611:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2411
	
l15613:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2414
	
l15615:
		movlw	low(menu_handle_button@buf_1743)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1743)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_319)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_319)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2415
	
l15617:
		movlw	low(menu_handle_button@buf_1743)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1743)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2417
	
l15619:
	call	_menu_update_time_value	;wreg free
	line	2419
	
l15621:
		movlw	02h-1
	movlb	5	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u21141
	goto	u21140

u21141:
	goto	l1262
u21140:
	line	2423
	
l15623:; BSR set to: 5

	movf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u21151
	goto	u21150
u21151:
	goto	l15627
u21150:
	line	2424
	
l15625:; BSR set to: 5

	movf	(0+(_menu+012h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+(_menu+013h))&0ffh,w
	movlb	0	; () banked
	addwf	(??_menu_handle_button+0+0)&0ffh,w
	movlb	2	; () banked
	movwf	((menu_handle_button@new_seconds))&0ffh
	movlb	5	; () banked
	movlw	0
	movlb	0	; () banked
	addwfc	(??_menu_handle_button+0+1)&0ffh,w
	movlb	2	; () banked
	movwf	1+((menu_handle_button@new_seconds))&0ffh
	goto	l15629
	line	2426
	
l15627:; BSR set to: 5

	movff	0+(_menu+012h),(c:___wmul@multiplier)
	clrf	((c:___wmul@multiplier+1))^00h,c
	movlw	high(0E10h)
	movwf	((c:___wmul@multiplicand+1))^00h,c
	movlw	low(0E10h)
	movwf	((c:___wmul@multiplicand))^00h,c
	call	___wmul	;wreg free
	movlb	5	; () banked
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
	line	2429
	
l15629:; BSR set to: 2

	movlb	3	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21161
	goto	u21160
u21161:
	goto	l15643
u21160:
	line	2431
	
l15631:; BSR set to: 3

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21171
	goto	u21170

u21171:
	goto	l15635
u21170:
	line	2432
	
l15633:; BSR set to: 5

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
	goto	l15663
	line	2433
	
l15635:; BSR set to: 5

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21181
	goto	u21180

u21181:
	goto	l15639
u21180:
	line	2434
	
l15637:; BSR set to: 5

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
	goto	l15663
	line	2435
	
l15639:; BSR set to: 5

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21191
	goto	u21190

u21191:
	goto	l1321
u21190:
	line	2436
	
l15641:; BSR set to: 5

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
	goto	l15663
	line	2437
	
l1321:; BSR set to: 5

	goto	l15663
	line	2438
	
l15643:; BSR set to: 3

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21201
	goto	u21200

u21201:
	goto	l15649
u21200:
	line	2440
	
l15645:; BSR set to: 3

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21211
	goto	u21210

u21211:
	goto	l15663
u21210:
	goto	l15633
	line	2443
	
l15649:; BSR set to: 3

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21221
	goto	u21220

u21221:
	goto	l15663
u21220:
	line	2445
	
l15651:; BSR set to: 3

	movlb	2	; () banked
	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u21231
	goto	u21230
u21231:
	goto	l15657
u21230:
	
l15653:; BSR set to: 2

		movlw	7
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21241
	goto	u21240

u21241:
	goto	l15657
u21240:
	line	2446
	
l15655:; BSR set to: 5

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
	goto	l15663
	line	2447
	
l15657:
	movlb	2	; () banked
		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u21251
	goto	u21250

u21251:
	goto	l15663
u21250:
	
l15659:; BSR set to: 2

		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21261
	goto	u21260

u21261:
	goto	l15663
u21260:
	goto	l15655
	line	2453
	
l15663:
	movlb	5	; () banked
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
		movlw	low(STR_320)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_320)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2455
	
l15665:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2456
	
l15667:; BSR set to: 5

	movlw	low(01h)
	movwf	((_save_pending))&0ffh
	line	2457
	
l15669:; BSR set to: 5

		movlw	low(STR_321)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_321)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1262
	line	2461
	
l15671:
	movff	(menu_handle_button@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_numeric_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u21271
	goto	u21270
u21271:
	goto	l1256
u21270:
	line	2463
	
l15673:
	movlb	5	; () banked
	incf	(0+(_menu+08h))&0ffh
	line	2464
	
l15675:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2466
	
l15677:
		movlw	2
	movlb	5	; () banked
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u21281
	goto	u21280

u21281:
	goto	l15683
u21280:
	
l15679:; BSR set to: 5

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u21291
	goto	u21290

u21291:
	goto	l15683
u21290:
	line	2468
	
l15681:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+0Bh))&0ffh
	line	2469
	movlw	low(0)
	movwf	(0+(_menu+0Ch))&0ffh
	line	2472
	
l15683:; BSR set to: 5

		movlw	04h-1
	cpfsgt	(0+(_menu+08h))&0ffh
	goto	u21301
	goto	u21300

u21301:
	goto	l1256
u21300:
	line	2474
	
l15685:; BSR set to: 5

	call	_get_current_numeric_value	;wreg free
	movff	0+?_get_current_numeric_value,(menu_handle_button@new_value_1748)
	movff	1+?_get_current_numeric_value,(menu_handle_button@new_value_1748+1)
	line	2477
	
l15687:; BSR set to: 5

	movlb	3	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21311
	goto	u21310
u21311:
	goto	l15711
u21310:
	line	2479
	
l15689:; BSR set to: 3

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21321
	goto	u21320

u21321:
	goto	l15695
u21320:
	line	2481
	
l15691:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1748),postinc2
	movff	(menu_handle_button@new_value_1748+1),postdec2
	line	2482
	
l15693:; BSR set to: 5

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_322)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_322)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1748),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1748+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2483
	goto	l15753
	line	2484
	
l15695:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21331
	goto	u21330

u21331:
	goto	l15701
u21330:
	line	2486
	
l15697:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1748),postinc2
	movff	(menu_handle_button@new_value_1748+1),postdec2
	line	2487
	
l15699:; BSR set to: 5

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_323)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_323)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1748),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1748+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2488
	goto	l15753
	line	2489
	
l15701:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21341
	goto	u21340

u21341:
	goto	l15707
u21340:
	line	2491
	
l15703:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1748),postinc2
	movff	(menu_handle_button@new_value_1748+1),postdec2
	line	2492
	
l15705:; BSR set to: 5

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_324)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_324)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1748),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1748+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2493
	goto	l15753
	line	2494
	
l15707:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21351
	goto	u21350

u21351:
	goto	l1341
u21350:
	line	2497
	
l15709:; BSR set to: 5

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_325)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_325)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1748),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1748+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l15753
	line	2499
	
l1341:; BSR set to: 5

	goto	l15753
	line	2500
	
l15711:; BSR set to: 3

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21361
	goto	u21360

u21361:
	goto	l15731
u21360:
	line	2502
	
l15713:; BSR set to: 3

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21371
	goto	u21370

u21371:
	goto	l15719
u21370:
	line	2504
	
l15715:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1748),postinc2
	movff	(menu_handle_button@new_value_1748+1),postdec2
	line	2505
	
l15717:; BSR set to: 5

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_326)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_326)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1748),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1748+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2506
	goto	l15753
	line	2507
	
l15719:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21381
	goto	u21380

u21381:
	goto	l15725
u21380:
	line	2509
	
l15721:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1748),postinc2
	movff	(menu_handle_button@new_value_1748+1),postdec2
	line	2510
	
l15723:; BSR set to: 5

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_327)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_327)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1748),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1748+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2511
	goto	l15753
	line	2512
	
l15725:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21391
	goto	u21390

u21391:
	goto	l1341
u21390:
	line	2514
	
l15727:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1748),postinc2
	movff	(menu_handle_button@new_value_1748+1),postdec2
	line	2515
	
l15729:; BSR set to: 5

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_328)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_328)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1748),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1748+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l15753
	line	2518
	
l15731:; BSR set to: 3

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21401
	goto	u21400

u21401:
	goto	l15753
u21400:
	
l15733:; BSR set to: 3

	movlb	2	; () banked
	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u21411
	goto	u21410
u21411:
	goto	l15753
u21410:
	line	2520
	
l15735:; BSR set to: 2

		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21421
	goto	u21420

u21421:
	goto	l15741
u21420:
	line	2522
	
l15737:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1748),postinc2
	movff	(menu_handle_button@new_value_1748+1),postdec2
	line	2523
	
l15739:; BSR set to: 5

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_329)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_329)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1748),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1748+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2524
	goto	l15753
	line	2525
	
l15741:; BSR set to: 5

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21431
	goto	u21430

u21431:
	goto	l15747
u21430:
	line	2527
	
l15743:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1748),postinc2
	movff	(menu_handle_button@new_value_1748+1),postdec2
	line	2528
	
l15745:; BSR set to: 5

		movff	0+(_input_menu+01Bh),(c:sprintf@sp)
	movff	1+(_input_menu+01Bh),(c:sprintf@sp+1)

		movlw	low(STR_330)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_330)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1748),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1748+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2529
	goto	l15753
	line	2530
	
l15747:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21441
	goto	u21440

u21441:
	goto	l1341
u21440:
	line	2532
	
l15749:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+020h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+020h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1748),postinc2
	movff	(menu_handle_button@new_value_1748+1),postdec2
	line	2533
	
l15751:; BSR set to: 5

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_331)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_331)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1748),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1748+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2537
	
l15753:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	line	2538
	
l15755:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	goto	l1262
	line	2542
	
l15757:; BSR set to: 5

		movlw	2
	movlb	2	; () banked
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u21451
	goto	u21450

u21451:
	goto	l15779
u21450:
	line	2545
	
l15759:; BSR set to: 2

		movlw	4
	movlb	5	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21461
	goto	u21460

u21461:
	goto	l15767
u21460:
	
l15761:; BSR set to: 5

	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u21471
	goto	u21470
u21471:
	goto	l15767
u21470:
	line	2547
	
l15763:; BSR set to: 5

		movlw	low(STR_332)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_332)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2548
	
l15765:
	call	_init_datetime_editor	;wreg free
	line	2551
	
l15767:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	2552
	
l15769:; BSR set to: 5

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2553
	
l15771:
	asmopt push
asmopt off
movlw  3
	movlb	0	; () banked
movwf	(??_menu_handle_button+0+0+1)&0ffh
movlw	8
movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	119
u22797:
decfsz	wreg,f
	bra	u22797
	decfsz	(??_menu_handle_button+0+0)&0ffh,f
	bra	u22797
	decfsz	(??_menu_handle_button+0+0+1)&0ffh,f
	bra	u22797
asmopt pop

	line	2554
	
l15773:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2557
	
l15775:
		movlw	4
	movlb	5	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21481
	goto	u21480

u21481:
	goto	l1262
u21480:
	goto	l15439
	line	2563
	
l15779:; BSR set to: 2

		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u21491
	goto	u21490

u21491:
	goto	l16137
u21490:
	line	2565
	
l15781:; BSR set to: 2

	movlb	5	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21501
	goto	u21500
u21501:
	goto	l15813
u21500:
	line	2567
	
l15783:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2569
	goto	l15811
	line	2575
	
l15785:; BSR set to: 5

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	2576
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2577
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2578
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2579
	
l15787:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	2580
	goto	l1262
	line	2583
	
l15789:; BSR set to: 5

	call	_rebuild_utility_menu	;wreg free
	line	2584
	
l15791:; BSR set to: 5

	movlw	low(04h)
	movwf	((_current_menu))&0ffh
	line	2585
	
l15793:; BSR set to: 5

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2586
	
l15795:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2590
	
l15797:; BSR set to: 5

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	goto	l15439
	line	2598
	
l15801:; BSR set to: 5

	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u21511
	goto	u21510
u21511:
	goto	l15807
u21510:
	line	2600
	
l15803:; BSR set to: 5

	call	_save_current_config	;wreg free
	line	2601
	
l15805:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	line	2603
	
l15807:; BSR set to: 5

	setf	((_current_menu))&0ffh
	line	2604
	goto	l1262
	line	2569
	
l15811:
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l1256
	xorlw	1^0	; case 1
	skipnz
	goto	l15785
	xorlw	2^1	; case 2
	skipnz
	goto	l15789
	xorlw	3^2	; case 3
	skipnz
	goto	l1256
	xorlw	4^3	; case 4
	skipnz
	goto	l15801
	goto	l1262

	line	2607
	
l15813:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21521
	goto	u21520

u21521:
	goto	l15963
u21520:
	line	2609
	
l15815:; BSR set to: 5

	movf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	clrf	(??_menu_handle_button+0+0+1)&0ffh

	movlw	low(-1)
	movlb	5	; () banked
	addwf	(0+(_menu+02h))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+2+0)&0ffh
	clrf	1+(??_menu_handle_button+2+0)&0ffh
	movlw	high(-1)
	addwfc	1+(??_menu_handle_button+2+0)&0ffh
	movf	(??_menu_handle_button+0+0)&0ffh,w
xorwf	(??_menu_handle_button+2+0)&0ffh,w
	bnz	u21531
movf	(??_menu_handle_button+0+1)&0ffh,w
xorwf	(??_menu_handle_button+2+1)&0ffh,w
	btfss	status,2
	goto	u21531
	goto	u21530

u21531:
	goto	l15829
u21530:
	line	2611
	
l15817:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2612
	
l15819:
	movlw	low(02h)
	movlb	5	; () banked
	movwf	((_current_menu))&0ffh
	line	2613
	
l15821:; BSR set to: 5

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2614
	
l15823:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2615
	
l15825:; BSR set to: 5

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l15787
	line	2618
	
l15829:; BSR set to: 0

	movlb	5	; () banked
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
	goto	u21541
	goto	u21540
u21541:
	goto	l1262
u21540:
	line	2620
	
l15831:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	2	; () banked
	movwf	((menu_handle_button@sensor_type_1764))&0ffh
	line	2621
	movlb	5	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	2	; () banked
	movwf	((menu_handle_button@flow_type_1765))&0ffh
	line	2624
	
l15833:; BSR set to: 2

	movff	(menu_handle_button@sensor_type_1764),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type_1765),(c:is_numeric_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u21551
	goto	u21550
u21551:
	goto	l15891
u21550:
	line	2626
	
l15835:
	movlw	high(0)
	movlb	0	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val))&0ffh
	line	2629
	movlb	2	; () banked
	movf	((menu_handle_button@sensor_type_1764))&0ffh,w
	btfss	status,2
	goto	u21561
	goto	u21560
u21561:
	goto	l15853
u21560:
	line	2631
	
l15837:; BSR set to: 2

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21571
	goto	u21570

u21571:
	goto	l15841
u21570:
	line	2632
	
l15839:; BSR set to: 5

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
	goto	l15883
	line	2633
	
l15841:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21581
	goto	u21580

u21581:
	goto	l15845
u21580:
	line	2634
	
l15843:; BSR set to: 5

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
	goto	l15883
	line	2635
	
l15845:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21591
	goto	u21590

u21591:
	goto	l15849
u21590:
	line	2636
	
l15847:; BSR set to: 5

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
	goto	l15883
	line	2637
	
l15849:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21601
	goto	u21600

u21601:
	goto	l1388
u21600:
	line	2638
	
l15851:; BSR set to: 5

	movlw	high(032h)
	movlb	0	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(032h)
	movwf	((menu_handle_button@current_val))&0ffh
	goto	l15883
	line	2639
	
l1388:; BSR set to: 5

	goto	l15883
	line	2640
	
l15853:; BSR set to: 2

		decf	((menu_handle_button@sensor_type_1764))&0ffh,w
	btfss	status,2
	goto	u21611
	goto	u21610

u21611:
	goto	l15867
u21610:
	line	2642
	
l15855:; BSR set to: 2

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21621
	goto	u21620

u21621:
	goto	l15859
u21620:
	goto	l15839
	line	2644
	
l15859:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21631
	goto	u21630

u21631:
	goto	l15863
u21630:
	goto	l15843
	line	2646
	
l15863:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21641
	goto	u21640

u21641:
	goto	l1388
u21640:
	goto	l15847
	line	2649
	
l15867:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1764))&0ffh,w
	btfss	status,2
	goto	u21651
	goto	u21650

u21651:
	goto	l15883
u21650:
	
l15869:; BSR set to: 2

	movf	((menu_handle_button@flow_type_1765))&0ffh,w
	btfss	status,2
	goto	u21661
	goto	u21660
u21661:
	goto	l15883
u21660:
	line	2651
	
l15871:; BSR set to: 2

		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21671
	goto	u21670

u21671:
	goto	l15875
u21670:
	goto	l15839
	line	2653
	
l15875:; BSR set to: 5

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21681
	goto	u21680

u21681:
	goto	l15879
u21680:
	goto	l15843
	line	2655
	
l15879:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21691
	goto	u21690

u21691:
	goto	l1388
u21690:
	line	2656
	
l15881:; BSR set to: 5

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
	line	2659
	
l15883:
	movff	(menu_handle_button@current_val),(c:init_numeric_editor@value)
	movff	(menu_handle_button@current_val+1),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	2660
	
l15885:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2661
	
l15887:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l15421
	line	2665
	
l15891:
	movff	(menu_handle_button@sensor_type_1764),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type_1765),(c:is_time_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u21701
	goto	u21700
u21701:
	goto	l15937
u21700:
	line	2667
	
l15893:
	movlw	high(0)
	movlb	0	; () banked
	movwf	((menu_handle_button@current_val_1768+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val_1768))&0ffh
	line	2670
	movlb	2	; () banked
	movf	((menu_handle_button@sensor_type_1764))&0ffh,w
	btfss	status,2
	goto	u21711
	goto	u21710
u21711:
	goto	l15907
u21710:
	line	2672
	
l15895:; BSR set to: 2

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21721
	goto	u21720

u21721:
	goto	l15899
u21720:
	line	2673
	
l15897:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1768)
	movff	postdec2,(menu_handle_button@current_val_1768+1)
	goto	l15925
	line	2674
	
l15899:; BSR set to: 5

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21731
	goto	u21730

u21731:
	goto	l15903
u21730:
	line	2675
	
l15901:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1768)
	movff	postdec2,(menu_handle_button@current_val_1768+1)
	goto	l15925
	line	2676
	
l15903:; BSR set to: 5

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21741
	goto	u21740

u21741:
	goto	l1410
u21740:
	line	2677
	
l15905:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1768)
	movff	postdec2,(menu_handle_button@current_val_1768+1)
	goto	l15925
	line	2678
	
l1410:; BSR set to: 5

	goto	l15925
	line	2679
	
l15907:; BSR set to: 2

		decf	((menu_handle_button@sensor_type_1764))&0ffh,w
	btfss	status,2
	goto	u21751
	goto	u21750

u21751:
	goto	l15913
u21750:
	line	2681
	
l15909:; BSR set to: 2

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21761
	goto	u21760

u21761:
	goto	l15925
u21760:
	goto	l15897
	line	2684
	
l15913:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1764))&0ffh,w
	btfss	status,2
	goto	u21771
	goto	u21770

u21771:
	goto	l15925
u21770:
	line	2687
	
l15915:; BSR set to: 2

	movf	((menu_handle_button@flow_type_1765))&0ffh,w
	btfss	status,2
	goto	u21781
	goto	u21780
u21781:
	goto	l15919
u21780:
	
l15917:; BSR set to: 2

		movlw	7
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u21791
	goto	u21790

u21791:
	goto	l15923
u21790:
	
l15919:
	movlb	2	; () banked
		decf	((menu_handle_button@flow_type_1765))&0ffh,w
	btfss	status,2
	goto	u21801
	goto	u21800

u21801:
	goto	l15925
u21800:
	
l15921:; BSR set to: 2

		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21811
	goto	u21810

u21811:
	goto	l15925
u21810:
	line	2688
	
l15923:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1768)
	movff	postdec2,(menu_handle_button@current_val_1768+1)
	line	2692
	
l15925:
		movlw	low(menu_handle_button@buf_1769)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1769)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_333)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_333)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@current_val_1768),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@current_val_1768+1),1+((c:?_sprintf)+04h)
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2693
	
l15927:
		movlw	low(menu_handle_button@buf_1769)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1769)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2695
	
l15929:
	movff	(menu_handle_button@current_val_1768),(c:init_time_editor@value_seconds)
	movff	(menu_handle_button@current_val_1768+1),(c:init_time_editor@value_seconds+1)
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	goto	l15885
	line	2701
	
l15937:
	movff	(menu_handle_button@sensor_type_1764),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type_1765),(c:is_option_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u21821
	goto	u21820
u21821:
	goto	l1256
u21820:
	line	2703
	
l15939:
		movlw	low(_original_value)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_original_value)
	movwf	((c:strcpy@to+1))^00h,c

	movlb	5	; () banked
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
	line	2705
	
l15941:
	movff	(menu_handle_button@sensor_type_1764),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type_1765),(c:get_option_edit_flag@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1772)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1772+1)
	line	2706
	
l15943:
	movff	(menu_handle_button@sensor_type_1764),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type_1765),(c:get_item_options_for_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1773)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1773+1)
	line	2708
	
l15945:
	movlb	0	; () banked
	movf	((menu_handle_button@edit_flag_1772))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1772+1))&0ffh,w
	btfsc	status,2
	goto	u21831
	goto	u21830

u21831:
	goto	l15959
u21830:
	
l15947:; BSR set to: 0

	movlb	1	; () banked
	movf	((menu_handle_button@opts_1773))&0ffh,w
iorwf	((menu_handle_button@opts_1773+1))&0ffh,w
	btfsc	status,2
	goto	u21841
	goto	u21840

u21841:
	goto	l15959
u21840:
	line	2711
	
l15949:; BSR set to: 1

	movlw	low(0)
	movwf	((menu_handle_button@i))&0ffh
	goto	l15957
	line	2713
	
l15951:; BSR set to: 1

	movlb	5	; () banked
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
	addwf	((menu_handle_button@opts_1773))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+2+0)&0ffh
	movf	(??_menu_handle_button+0+1)&0ffh,w
	movlb	1	; () banked
	addwfc	((menu_handle_button@opts_1773+1))&0ffh,w
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
	goto	u21851
	goto	u21850

u21851:
	goto	l15955
u21850:
	line	2715
	
l15953:
	movff	(menu_handle_button@edit_flag_1772),fsr2l
	movff	(menu_handle_button@edit_flag_1772+1),fsr2h
	movff	(menu_handle_button@i),indf2

	line	2716
	goto	l15959
	line	2711
	
l15955:
	movlb	1	; () banked
	incf	((menu_handle_button@i))&0ffh
	
l15957:; BSR set to: 1

	movlw	01h
	addwf	((menu_handle_button@opts_1773))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	0
	movlb	1	; () banked
	addwfc	((menu_handle_button@opts_1773+1))&0ffh,w
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
	goto	u21861
	goto	u21860

u21861:
	goto	l15951
u21860:
	line	2721
	
l15959:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2722
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l15421
	line	2727
	
l15963:; BSR set to: 5

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21871
	goto	u21870

u21871:
	goto	l15997
u21870:
	line	2729
	
l15965:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2731
	
l15967:
		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21881
	goto	u21880

u21881:
	goto	l15973
u21880:
	line	2733
	
l15969:; BSR set to: 5

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	2734
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2735
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2736
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2737
	
l15971:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	2738
	goto	l1262
	line	2739
	
l15973:; BSR set to: 5

		movlw	03h-0
	cpfslt	((_menu))&0ffh
	goto	u21891
	goto	u21890

u21891:
	goto	l15985
u21890:
	line	2741
	
l15975:; BSR set to: 5

	movf	((_menu))&0ffh,w
	
	call	_rebuild_input_menu
	line	2742
	
l15977:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_current_menu))&0ffh
	line	2743
	
l15979:; BSR set to: 5

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2744
	
l15981:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2745
	
l15983:; BSR set to: 5

	call	_menu_draw_input	;wreg free
	line	2746
	goto	l1262
	line	2747
	
l15985:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21901
	goto	u21900

u21901:
	goto	l1256
u21900:
	line	2749
	
l15987:; BSR set to: 5

	call	_rebuild_clock_menu	;wreg free
	line	2750
	
l15989:
	movlw	low(03h)
	movlb	5	; () banked
	movwf	((_current_menu))&0ffh
	line	2751
	
l15991:; BSR set to: 5

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2752
	
l15993:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2753
	
l15995:
	call	_menu_draw_clock	;wreg free
	goto	l1262
	line	2756
	
l15997:; BSR set to: 5

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21911
	goto	u21910

u21911:
	goto	l16063
u21910:
	line	2760
	
l15999:; BSR set to: 5

		movlw	05h-1
	cpfsgt	((_menu))&0ffh
	goto	u21921
	goto	u21920

u21921:
	goto	l16003
u21920:
	
l16001:; BSR set to: 5

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_menu_handle_button$1781+1))&0ffh
	movlw	low(0)
	movwf	((_menu_handle_button$1781))&0ffh
	goto	l16005
	
l16003:; BSR set to: 5

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
	movwf	((_menu_handle_button$1781))&0ffh
	clrf	((_menu_handle_button$1781+1))&0ffh
	
l16005:; BSR set to: 0

		movlw	low(menu_handle_button@buf_1779)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1779)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_334)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_334)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu_handle_button$1781),0+((c:?_sprintf)+06h)
	movff	(_menu_handle_button$1781+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	2761
	
l16007:
		movlw	low(menu_handle_button@buf_1779)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1779)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2763
		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21931
	goto	u21930

u21931:
	goto	l16021
u21930:
	goto	l15817
	line	2773
	
l16021:; BSR set to: 5

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
	goto	u21941
	goto	u21940
u21941:
	goto	l16061
u21940:
	line	2775
	
l16023:; BSR set to: 5

		movlw	low(STR_335)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_335)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2778
	
l16025:
		movlw	low(_original_value)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_original_value)
	movwf	((c:strcpy@to+1))^00h,c

	movlb	5	; () banked
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
	line	2781
	
l16027:
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21951
	goto	u21950
u21951:
	goto	l16031
u21950:
	line	2783
	
l16029:; BSR set to: 5

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
	goto	u21961
	goto	u21960

u21961:
	movlw	1
	goto	u21970
u21960:
	movlw	0
u21970:
	movwf	((c:_enable_edit_flag))^00h,c
	line	2784
	goto	l16053
	line	2785
	
l16031:; BSR set to: 5

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21981
	goto	u21980

u21981:
	goto	l16043
u21980:
	line	2787
	
l16033:; BSR set to: 5

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
	goto	u21991
	goto	u21990

u21991:
	goto	l16037
u21990:
	line	2788
	
l16035:
	movlw	low(0)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l16053
	line	2789
	
l16037:
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
	goto	u22001
	goto	u22000

u22001:
	goto	l16041
u22000:
	line	2790
	
l16039:
	movlw	low(01h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l16053
	line	2792
	
l16041:
	movlw	low(02h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l16053
	line	2794
	
l16043:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22011
	goto	u22010

u22011:
	goto	l16049
u22010:
	line	2797
	
l16045:; BSR set to: 5

	movff	0+(_system_config+07h),0+(_menu+0Dh)
	clrf	(1+(_menu+0Dh))&0ffh
	line	2798
	
l16047:; BSR set to: 5

	movff	0+(_system_config+07h),(c:init_time_editor@value_seconds)
	clrf	((c:init_time_editor@value_seconds+1))^00h,c
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	line	2799
	goto	l16053
	line	2800
	
l16049:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22021
	goto	u22020

u22021:
	goto	l1454
u22020:
	line	2802
	
l16051:; BSR set to: 5

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
	goto	u22031
	goto	u22030

u22031:
	movlw	1
	goto	u22040
u22030:
	movlw	0
u22040:
	movwf	((c:_display_edit_flag))^00h,c
	goto	l16053
	line	2805
	
l1454:; BSR set to: 5

	
l16053:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2806
	
l16055:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2807
	
l16057:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l15995
	line	2814
	
l16061:; BSR set to: 5

		movlw	low(STR_340)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_340)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1262
	line	2817
	
l16063:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22051
	goto	u22050

u22051:
	goto	l1256
u22050:
	line	2819
	
l16065:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2822
	
l16067:
		movlw	low(menu_handle_button@buf_1788)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1788)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_341)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_341)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Eh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+01Ch),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	2823
	
l16069:
		movlw	low(menu_handle_button@buf_1788)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1788)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2826
	
l16071:
	movlb	5	; () banked
	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u22061
	goto	u22060
u22061:
	goto	l16097
u22060:
	line	2828
	
l16073:; BSR set to: 5

	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u22071
	goto	u22070
u22071:
	goto	l16081
u22070:
	line	2831
	
l16075:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+03h))&0ffh
	line	2832
	movlw	low(0)
	movwf	(0+(_menu+01Dh))&0ffh
	line	2833
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2834
	
l16077:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2835
	
l16079:
		movlw	low(STR_342)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_342)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2836
	goto	l1262
	line	2837
	
l16081:; BSR set to: 5

		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u22081
	goto	u22080

u22081:
	goto	l16089
u22080:
	line	2840
	
l16083:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+03h))&0ffh
	line	2841
	movlw	low(0)
	movwf	(0+(_menu+01Dh))&0ffh
	line	2842
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2843
	
l16085:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2844
	
l16087:
		movlw	low(STR_343)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_343)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2845
	goto	l1262
	line	2846
	
l16089:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u22091
	goto	u22090

u22091:
	goto	l1256
u22090:
	line	2848
	
l16091:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Eh))&0ffh
	line	2849
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2850
	
l16093:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2851
	
l16095:
		movlw	low(STR_344)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_344)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1262
	line	2854
	
l16097:; BSR set to: 5

	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22101
	goto	u22100
u22101:
	goto	l16111
u22100:
	line	2856
	
l16099:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2857
	
l16101:
	call	_init_datetime_editor	;wreg free
	line	2858
	
l16103:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+01Eh))&0ffh
	line	2859
	
l16105:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Ch))&0ffh
	line	2860
	
l16107:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2861
	
l16109:
		movlw	low(STR_345)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_345)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2862
	goto	l1262
	line	2863
	
l16111:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22111
	goto	u22110

u22111:
	goto	l16123
u22110:
	line	2865
	
l16113:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2867
	
l16115:
	movff	0+(_system_config+020h),(c:init_numeric_editor@value)
	movff	1+(_system_config+020h),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	2868
	
l16117:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+03h))&0ffh
	line	2869
	
l16119:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2870
	
l16121:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2871
		movlw	low(STR_346)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_346)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2872
	goto	l1262
	line	2873
	
l16123:; BSR set to: 5

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22121
	goto	u22120

u22121:
	goto	l1256
u22120:
	line	2875
	
l16125:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2877
	
l16127:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_current_menu))&0ffh
	line	2878
	
l16129:; BSR set to: 5

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2879
	
l16131:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2880
	
l16133:; BSR set to: 5

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l15971
	line	2886
	
l16137:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u22131
	goto	u22130

u22131:
	goto	l1262
u22130:
	line	2889
	
l16139:; BSR set to: 2

		movlw	low(menu_handle_button@buf_1796)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1796)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_347)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_347)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2890
	
l16141:
		movlw	low(menu_handle_button@buf_1796)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1796)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2892
	
l16143:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2893
	
l16145:
	asmopt push
asmopt off
movlw  3
	movlb	0	; () banked
movwf	(??_menu_handle_button+0+0+1)&0ffh
movlw	8
movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	119
u22807:
decfsz	wreg,f
	bra	u22807
	decfsz	(??_menu_handle_button+0+0)&0ffh,f
	bra	u22807
	decfsz	(??_menu_handle_button+0+0+1)&0ffh,f
	bra	u22807
asmopt pop

	line	2894
	
l16147:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2896
	
l16149:
	movlb	5	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22141
	goto	u22140
u22141:
	goto	l16155
u22140:
	line	2898
	
l16151:; BSR set to: 5

	setf	((_current_menu))&0ffh
	line	2899
	
l16153:; BSR set to: 5

		movlw	low(STR_348)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_348)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2900
	goto	l1262
	line	2901
	
l16155:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22151
	goto	u22150

u22151:
	goto	l16163
u22150:
	line	2903
	
l16157:; BSR set to: 5

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	2904
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2905
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2906
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2907
	
l16159:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	2908
	
l16161:
		movlw	low(STR_349)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_349)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2909
	goto	l1262
	line	2910
	
l16163:; BSR set to: 5

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22161
	goto	u22160

u22161:
	goto	l16171
u22160:
	line	2912
	
l16165:; BSR set to: 5

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	2913
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2914
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2915
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2916
	
l16167:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	2917
	
l16169:
		movlw	low(STR_350)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_350)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2918
	goto	l1262
	line	2919
	
l16171:; BSR set to: 5

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22171
	goto	u22170

u22171:
	goto	l16179
u22170:
	line	2921
	
l16173:; BSR set to: 5

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	2922
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2923
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2924
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2925
	
l16175:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	2926
	
l16177:
		movlw	low(STR_351)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_351)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2927
	goto	l1262
	line	2928
	
l16179:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22181
	goto	u22180

u22181:
	goto	l1256
u22180:
	line	2930
	
l16181:; BSR set to: 5

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	2931
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2932
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2933
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2934
	
l16183:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	2935
	
l16185:
		movlw	low(STR_352)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_352)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2940
	
l1262:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_button
	__end_of_menu_handle_button:
	signat	_menu_handle_button,4217
	global	_trigger_relay_pulse

;; *************** function _trigger_relay_pulse *****************
;; Defined at:
;;		line 120 in file "src\main.c"
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
;;		On entry : 0/5
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
psect	text14,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	120
global __ptext14
__ptext14:
psect	text14
	file	"src\main.c"
	line	120
	
_trigger_relay_pulse:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((trigger_relay_pulse@latch_mode))&0ffh
	line	125
	
l13259:
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
	line	126
	
l13261:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	128
	
l13263:
	movlb	0	; () banked
	movf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u17651
	goto	u17650
u17651:
	goto	l150
u17650:
	line	130
	
l13265:; BSR set to: 0

	movlw	low(01h)
	movwf	((_relay_state))&0ffh	;volatile
	line	132
	movf	((trigger_relay_pulse@latch_mode))&0ffh,w
	btfsc	status,2
	goto	u17661
	goto	u17660
u17661:
	goto	l13271
u17660:
	line	135
	
l13267:; BSR set to: 0

	movlw	high(0)
	movlb	5	; () banked
	movwf	((_relay_counter+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_relay_counter))&0ffh	;volatile
	line	136
	
l13269:; BSR set to: 5

		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	137
	goto	l13277
	line	141
	
l13271:; BSR set to: 0

	movlb	7	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	mullw	064h
	movff	prodl,(_relay_counter)	;volatile
	movff	prodh,(_relay_counter+1)	;volatile
	line	142
	
l13273:; BSR set to: 7

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
	line	143
	
l13275:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	146
	
l13277:
	bcf	((c:3979))^0f00h,c,1	;volatile
	line	148
	
l150:
	return	;funcret
	callstack 0
GLOBAL	__end_of_trigger_relay_pulse
	__end_of_trigger_relay_pulse:
	signat	_trigger_relay_pulse,4217
	global	_rtc_set_time

;; *************** function _rtc_set_time *****************
;; Defined at:
;;		line 75 in file "src\rtc.c"
;; Parameters:    Size  Location     Type
;;  time            2   64[COMRAM] PTR struct .
;;		 -> menu_handle_button@new_time(7), 
;; Auto vars:     Size  Location     Type
;;  i               1   87[BANK0 ] unsigned char 
;;  buf            80    0[BANK0 ] unsigned char [80]
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
;;		_dec_to_bcd
;;		_i2c_start
;;		_i2c_stop
;;		_i2c_write
;;		_sprintf
;;		_uart_println
;; This function is called by:
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2,group=0
	file	"src\rtc.c"
	line	75
global __ptext15
__ptext15:
psect	text15
	file	"src\rtc.c"
	line	75
	
_rtc_set_time:
;incstack = 0
	callstack 24
	line	80
	
l14369:; BSR set to: 3

	movff	(c:rtc_set_time@time),fsr2l
	movff	(c:rtc_set_time@time+1),fsr2h
	movf	indf2,w
	
	call	_dec_to_bcd
	movlb	0	; () banked
	movwf	((rtc_set_time@data))&0ffh
	line	81
	lfsr	2,01h
	movf	((c:rtc_set_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_set_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	indf2,w
	
	call	_dec_to_bcd
	movlb	0	; () banked
	movwf	(0+(rtc_set_time@data+01h))&0ffh
	line	82
	lfsr	2,02h
	movf	((c:rtc_set_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_set_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	indf2,w
	
	call	_dec_to_bcd
	movlb	0	; () banked
	movwf	(0+(rtc_set_time@data+02h))&0ffh
	line	83
	lfsr	2,03h
	movf	((c:rtc_set_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_set_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	indf2,w
	
	call	_dec_to_bcd
	movlb	0	; () banked
	movwf	(0+(rtc_set_time@data+03h))&0ffh
	line	84
	lfsr	2,04h
	movf	((c:rtc_set_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_set_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	indf2,w
	
	call	_dec_to_bcd
	movlb	0	; () banked
	movwf	(0+(rtc_set_time@data+04h))&0ffh
	line	85
	lfsr	2,05h
	movf	((c:rtc_set_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_set_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	indf2,w
	
	call	_dec_to_bcd
	movlb	0	; () banked
	movwf	(0+(rtc_set_time@data+05h))&0ffh
	line	86
	lfsr	2,06h
	movf	((c:rtc_set_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_set_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	indf2,w
	
	call	_dec_to_bcd
	movlb	0	; () banked
	movwf	(0+(rtc_set_time@data+06h))&0ffh
	line	91
	
l14371:; BSR set to: 0

		movlw	low(rtc_set_time@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_353)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_353)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(rtc_set_time@data),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(rtc_set_time@data+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(rtc_set_time@data+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(rtc_set_time@data+03h),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	movff	0+(rtc_set_time@data+04h),0+((c:?_sprintf)+0Ch)
	clrf	(1+((c:?_sprintf)+0Ch))^00h,c
	movff	0+(rtc_set_time@data+05h),0+((c:?_sprintf)+0Eh)
	clrf	(1+((c:?_sprintf)+0Eh))^00h,c
	movff	0+(rtc_set_time@data+06h),0+((c:?_sprintf)+010h)
	clrf	(1+((c:?_sprintf)+010h))^00h,c
	call	_sprintf	;wreg free
	line	93
	
l14373:
		movlw	low(rtc_set_time@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	96
	
l14375:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19231
	goto	u19230
u19231:
	goto	l14381
u19230:
	line	97
	
l14377:
	movlw	(01h)&0ffh
	goto	l1745
	line	98
	
l14381:
	asmopt push
asmopt off
	movlw	133
u22817:
decfsz	wreg,f
	bra	u22817
	nop
asmopt pop

	line	100
	
l14383:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19241
	goto	u19240
u19241:
	goto	l14389
u19240:
	goto	l14377
	line	102
	
l14389:
	asmopt push
asmopt off
	movlw	133
u22827:
decfsz	wreg,f
	bra	u22827
	nop
asmopt pop

	line	104
	
l14391:
	movlw	(0)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19251
	goto	u19250
u19251:
	goto	l14397
u19250:
	goto	l14377
	line	106
	
l14397:
	asmopt push
asmopt off
	movlw	133
u22837:
decfsz	wreg,f
	bra	u22837
	nop
asmopt pop

	line	108
	
l14399:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((rtc_set_time@i))&0ffh
	line	110
	
l14405:; BSR set to: 0

	movf	((rtc_set_time@i))&0ffh,w
	addlw	low(rtc_set_time@data)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19261
	goto	u19260
u19261:
	goto	l14411
u19260:
	goto	l14377
	line	112
	
l14411:
	asmopt push
asmopt off
	movlw	133
u22847:
decfsz	wreg,f
	bra	u22847
	nop
asmopt pop

	line	108
	
l14413:
	movlb	0	; () banked
	incf	((rtc_set_time@i))&0ffh
		movlw	07h-1
	cpfsgt	((rtc_set_time@i))&0ffh
	goto	u19271
	goto	u19270

u19271:
	goto	l14405
u19270:
	line	115
	
l14415:; BSR set to: 0

	call	_i2c_stop	;wreg free
	line	116
	
l14417:
	asmopt push
asmopt off
	movlw	228
u22857:
	nop2
	nop2
decfsz	wreg,f
	bra	u22857
	nop2
	nop2
asmopt pop

	line	117
	
l14419:
	movlw	(0)&0ffh
	line	118
	
l1745:
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
;;		On entry : 3C/3
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
psect	text16,class=CODE,space=0,reloc=2,group=0
	line	69
global __ptext16
__ptext16:
psect	text16
	file	"src\rtc.c"
	line	69
	
_dec_to_bcd:
;incstack = 0
	callstack 25
	movwf	((c:dec_to_bcd@dec))^00h,c
	line	71
	
l13255:
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
	
l1739:
	return	;funcret
	callstack 0
GLOBAL	__end_of_dec_to_bcd
	__end_of_dec_to_bcd:
	signat	_dec_to_bcd,4217
	global	_rebuild_input_menu

;; *************** function _rebuild_input_menu *****************
;; Defined at:
;;		line 947 in file "src\menu.c"
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
;;		On entry : 3F/5
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
	line	947
global __ptext17
__ptext17:
psect	text17
	file	"src\menu.c"
	line	947
	
_rebuild_input_menu:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((rebuild_input_menu@input_num))&0ffh
	line	950
	
l13973:
	movff	(rebuild_input_menu@input_num),(_current_input)
	line	953
	
l13975:
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
	line	954
	
l13977:; BSR set to: 0

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
	line	957
	
l13979:; BSR set to: 0

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
	goto	u18831
	goto	u18830
u18831:
	goto	l13983
u18830:
	
l13981:; BSR set to: 0

		movlw	low(STR_175)
	movwf	((_rebuild_input_menu$1361))&0ffh
	movlw	high(STR_175)
	movwf	((_rebuild_input_menu$1361+1))&0ffh

	goto	l13985
	
l13983:; BSR set to: 0

		movlw	low(STR_174)
	movwf	((_rebuild_input_menu$1361))&0ffh
	movlw	high(STR_174)
	movwf	((_rebuild_input_menu$1361+1))&0ffh

	
l13985:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_173)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_173)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_input_menu$1361),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$1361+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	959
	
l13987:
	movlb	0	; () banked
	movf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u18841
	goto	u18840
u18841:
	goto	l14093
u18840:
	line	961
	
l13989:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_176)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_176)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	962
	
l13991:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_177)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_177)
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
	line	963
	
l13993:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_178)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_178)
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
	line	964
	
l13995:
		movlw	low(_value_hi_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_hi_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_179)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_179)
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
	line	967
	
l13997:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3241)
	movff	1+?___lwdiv,(_rebuild_input_menu$3241+1)
	
l13999:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3242)
	movff	1+?___lwmod,(_rebuild_input_menu$3242+1)
	
l14001:
		movlw	low(_value_highbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_highbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_180)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_180)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3241),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3241+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3242),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3242+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	968
	
l14003:
		movlw	low(_value_low_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_181)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_181)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	high(032h)
	movwf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(032h)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	971
	
l14005:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3241)
	movff	1+?___lwdiv,(_rebuild_input_menu$3241+1)
	
l14007:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3242)
	movff	1+?___lwmod,(_rebuild_input_menu$3242+1)
	
l14009:
		movlw	low(_value_plpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_plpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_182)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_182)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3241),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3241+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3242),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3242+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	974
	
l14011:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3241)
	movff	1+?___lwdiv,(_rebuild_input_menu$3241+1)
	
l14013:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3242)
	movff	1+?___lwmod,(_rebuild_input_menu$3242+1)
	
l14015:
		movlw	low(_value_slpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_slpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_183)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_183)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3241),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3241+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3242),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3242+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	977
	
l14017:
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
	goto	u18851
	goto	u18850
u18851:
	goto	l14025
u18850:
	
l14019:; BSR set to: 0

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
	goto	u18861
	goto	u18860

u18861:
	goto	l14023
u18860:
	
l14021:; BSR set to: 0

		movlw	low(STR_186)
	movwf	((_rebuild_input_menu$1376))&0ffh
	movlw	high(STR_186)
	movwf	((_rebuild_input_menu$1376+1))&0ffh

	goto	l772
	
l14023:; BSR set to: 0

		movlw	low(STR_185)
	movwf	((_rebuild_input_menu$1376))&0ffh
	movlw	high(STR_185)
	movwf	((_rebuild_input_menu$1376+1))&0ffh

	
l772:; BSR set to: 0

		movff	(_rebuild_input_menu$1376),(_rebuild_input_menu$1375)
	movff	(_rebuild_input_menu$1376+1),(_rebuild_input_menu$1375+1)

	goto	l14027
	
l14025:; BSR set to: 0

		movlw	low(STR_184)
	movwf	((_rebuild_input_menu$1375))&0ffh
	movlw	high(STR_184)
	movwf	((_rebuild_input_menu$1375+1))&0ffh

	
l14027:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1375),(c:strcpy@from)
	movff	(_rebuild_input_menu$1375+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	979
	
l14029:
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
	goto	u18871
	goto	u18870
u18871:
	goto	l14037
u18870:
	
l14031:; BSR set to: 0

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
	goto	u18881
	goto	u18880

u18881:
	goto	l14035
u18880:
	
l14033:; BSR set to: 0

		movlw	low(STR_189)
	movwf	((_rebuild_input_menu$1383))&0ffh
	movlw	high(STR_189)
	movwf	((_rebuild_input_menu$1383+1))&0ffh

	goto	l780
	
l14035:; BSR set to: 0

		movlw	low(STR_188)
	movwf	((_rebuild_input_menu$1383))&0ffh
	movlw	high(STR_188)
	movwf	((_rebuild_input_menu$1383+1))&0ffh

	
l780:; BSR set to: 0

		movff	(_rebuild_input_menu$1383),(_rebuild_input_menu$1382)
	movff	(_rebuild_input_menu$1383+1),(_rebuild_input_menu$1382+1)

	goto	l14039
	
l14037:; BSR set to: 0

		movlw	low(STR_187)
	movwf	((_rebuild_input_menu$1382))&0ffh
	movlw	high(STR_187)
	movwf	((_rebuild_input_menu$1382+1))&0ffh

	
l14039:; BSR set to: 0

		movlw	low(_value_rlyplp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyplp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1382),(c:strcpy@from)
	movff	(_rebuild_input_menu$1382+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	981
	
l14041:
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
	goto	u18891
	goto	u18890
u18891:
	goto	l14049
u18890:
	
l14043:; BSR set to: 0

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
	goto	u18901
	goto	u18900

u18901:
	goto	l14047
u18900:
	
l14045:; BSR set to: 0

		movlw	low(STR_192)
	movwf	((_rebuild_input_menu$1390))&0ffh
	movlw	high(STR_192)
	movwf	((_rebuild_input_menu$1390+1))&0ffh

	goto	l788
	
l14047:; BSR set to: 0

		movlw	low(STR_191)
	movwf	((_rebuild_input_menu$1390))&0ffh
	movlw	high(STR_191)
	movwf	((_rebuild_input_menu$1390+1))&0ffh

	
l788:; BSR set to: 0

		movff	(_rebuild_input_menu$1390),(_rebuild_input_menu$1389)
	movff	(_rebuild_input_menu$1390+1),(_rebuild_input_menu$1389+1)

	goto	l14051
	
l14049:; BSR set to: 0

		movlw	low(STR_190)
	movwf	((_rebuild_input_menu$1389))&0ffh
	movlw	high(STR_190)
	movwf	((_rebuild_input_menu$1389+1))&0ffh

	
l14051:; BSR set to: 0

		movlw	low(_value_rlyslp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyslp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1389),(c:strcpy@from)
	movff	(_rebuild_input_menu$1389+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	982
	
l14053:
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
	goto	u18911
	goto	u18910
u18911:
	goto	l14057
u18910:
	
l14055:; BSR set to: 0

		movlw	low(STR_194)
	movwf	((_rebuild_input_menu$1394))&0ffh
	movlw	high(STR_194)
	movwf	((_rebuild_input_menu$1394+1))&0ffh

	goto	l14059
	
l14057:; BSR set to: 0

		movlw	low(STR_193)
	movwf	((_rebuild_input_menu$1394))&0ffh
	movlw	high(STR_193)
	movwf	((_rebuild_input_menu$1394+1))&0ffh

	
l14059:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1394),(c:strcpy@from)
	movff	(_rebuild_input_menu$1394+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	985
	
l14061:
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
	line	988
	
l14063:
		movlw	low(_value_enable)
	movlb	5	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	989
	
l14065:; BSR set to: 5

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	990
	
l14067:; BSR set to: 5

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	991
	
l14069:; BSR set to: 5

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	992
	
l14071:; BSR set to: 5

		movlw	low(_value_hi_pressure)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_hi_pressure)
	movwf	(1+(_input_menu+016h))&0ffh

	line	993
	
l14073:; BSR set to: 5

		movlw	low(_value_highbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_highbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	994
	
l14075:; BSR set to: 5

		movlw	low(_value_low_pressure)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_pressure)
	movwf	(1+(_input_menu+020h))&0ffh

	line	995
	
l14077:; BSR set to: 5

		movlw	low(_value_plpbp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_plpbp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	996
	
l14079:; BSR set to: 5

		movlw	low(_value_slpbp)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_slpbp)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	997
	
l14081:; BSR set to: 5

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	998
	
l14083:; BSR set to: 5

		movlw	low(_value_rlyplp)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_rlyplp)
	movwf	(1+(_input_menu+034h))&0ffh

	line	999
	
l14085:; BSR set to: 5

		movlw	low(_value_rlyslp)
	movwf	(0+(_input_menu+039h))&0ffh
	movlw	high(_value_rlyslp)
	movwf	(1+(_input_menu+039h))&0ffh

	line	1000
	
l14087:; BSR set to: 5

		movlw	low(_value_display)
	movwf	(0+(_input_menu+03Eh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+03Eh))&0ffh

	line	1001
	
l14089:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_input_menu+043h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+043h))&0ffh

	line	1003
	
l14091:; BSR set to: 5

	movlw	low(0Eh)
	movwf	(0+(_menu+02h))&0ffh
	line	1004
	goto	l14259
	line	1005
	
l14093:; BSR set to: 0

		decf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u18921
	goto	u18920

u18921:
	goto	l14151
u18920:
	line	1007
	
l14095:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_195)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_195)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1008
	
l14097:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_196)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_196)
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
	line	1009
	
l14099:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_197)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_197)
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
	line	1010
	
l14101:
		movlw	low(_value_high_temp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_temp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_198)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_198)
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
	line	1013
	
l14103:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3241)
	movff	1+?___lwdiv,(_rebuild_input_menu$3241+1)
	
l14105:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3242)
	movff	1+?___lwmod,(_rebuild_input_menu$3242+1)
	
l14107:
		movlw	low(_value_high_tbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_tbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_199)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_199)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3241),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3241+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3242),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3242+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1015
	
l14109:
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
	goto	u18931
	goto	u18930
u18931:
	goto	l14117
u18930:
	
l14111:; BSR set to: 0

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
	goto	u18941
	goto	u18940

u18941:
	goto	l14115
u18940:
	
l14113:; BSR set to: 0

		movlw	low(STR_202)
	movwf	((_rebuild_input_menu$1409))&0ffh
	movlw	high(STR_202)
	movwf	((_rebuild_input_menu$1409+1))&0ffh

	goto	l802
	
l14115:; BSR set to: 0

		movlw	low(STR_201)
	movwf	((_rebuild_input_menu$1409))&0ffh
	movlw	high(STR_201)
	movwf	((_rebuild_input_menu$1409+1))&0ffh

	
l802:; BSR set to: 0

		movff	(_rebuild_input_menu$1409),(_rebuild_input_menu$1408)
	movff	(_rebuild_input_menu$1409+1),(_rebuild_input_menu$1408+1)

	goto	l14119
	
l14117:; BSR set to: 0

		movlw	low(STR_200)
	movwf	((_rebuild_input_menu$1408))&0ffh
	movlw	high(STR_200)
	movwf	((_rebuild_input_menu$1408+1))&0ffh

	
l14119:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1408),(c:strcpy@from)
	movff	(_rebuild_input_menu$1408+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1016
	
l14121:
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
	goto	u18951
	goto	u18950
u18951:
	goto	l14125
u18950:
	
l14123:; BSR set to: 0

		movlw	low(STR_204)
	movwf	((_rebuild_input_menu$1413))&0ffh
	movlw	high(STR_204)
	movwf	((_rebuild_input_menu$1413+1))&0ffh

	goto	l14127
	
l14125:; BSR set to: 0

		movlw	low(STR_203)
	movwf	((_rebuild_input_menu$1413))&0ffh
	movlw	high(STR_203)
	movwf	((_rebuild_input_menu$1413+1))&0ffh

	
l14127:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1413),(c:strcpy@from)
	movff	(_rebuild_input_menu$1413+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1019
	
l14129:
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
	line	1022
	
l14131:
		movlw	low(_value_enable)
	movlb	5	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	1023
	
l14133:; BSR set to: 5

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	1024
	
l14135:; BSR set to: 5

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	1025
	
l14137:; BSR set to: 5

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	1026
	
l14139:; BSR set to: 5

		movlw	low(_value_high_temp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_high_temp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	1027
	
l14141:; BSR set to: 5

		movlw	low(_value_high_tbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_high_tbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	1028
	
l14143:; BSR set to: 5

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+020h))&0ffh

	line	1029
	
l14145:; BSR set to: 5

		movlw	low(_value_display)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+025h))&0ffh

	line	1030
	
l14147:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	1032
	
l14149:; BSR set to: 5

	movlw	low(09h)
	movwf	(0+(_menu+02h))&0ffh
	line	1033
	goto	l14259
	line	1034
	
l14151:; BSR set to: 0

		movlw	2
	xorwf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u18961
	goto	u18960

u18961:
	goto	l14259
u18960:
	line	1036
	
l14153:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_205)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_205)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1037
	
l14155:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfsc	status,2
	goto	u18971
	goto	u18970
u18971:
	goto	l14159
u18970:
	
l14157:; BSR set to: 0

		movlw	low(STR_207)
	movwf	((_rebuild_input_menu$1418))&0ffh
	movlw	high(STR_207)
	movwf	((_rebuild_input_menu$1418+1))&0ffh

	goto	l14161
	
l14159:; BSR set to: 0

		movlw	low(STR_206)
	movwf	((_rebuild_input_menu$1418))&0ffh
	movlw	high(STR_206)
	movwf	((_rebuild_input_menu$1418+1))&0ffh

	
l14161:; BSR set to: 0

		movlw	low(_value_flow_type)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_type)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1418),(c:strcpy@from)
	movff	(_rebuild_input_menu$1418+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1038
	
l14163:
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
	goto	u18981
	goto	u18980
u18981:
	goto	l14167
u18980:
	
l14165:; BSR set to: 0

		movlw	low(STR_209)
	movwf	((_rebuild_input_menu$1422))&0ffh
	movlw	high(STR_209)
	movwf	((_rebuild_input_menu$1422+1))&0ffh

	goto	l14169
	
l14167:; BSR set to: 0

		movlw	low(STR_208)
	movwf	((_rebuild_input_menu$1422))&0ffh
	movlw	high(STR_208)
	movwf	((_rebuild_input_menu$1422+1))&0ffh

	
l14169:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1422),(c:strcpy@from)
	movff	(_rebuild_input_menu$1422+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1040
	
l14171:
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
	goto	u18991
	goto	u18990
u18991:
	goto	l14179
u18990:
	
l14173:; BSR set to: 0

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
	goto	u19001
	goto	u19000

u19001:
	goto	l14177
u19000:
	
l14175:; BSR set to: 0

		movlw	low(STR_212)
	movwf	((_rebuild_input_menu$1429))&0ffh
	movlw	high(STR_212)
	movwf	((_rebuild_input_menu$1429+1))&0ffh

	goto	l824
	
l14177:; BSR set to: 0

		movlw	low(STR_211)
	movwf	((_rebuild_input_menu$1429))&0ffh
	movlw	high(STR_211)
	movwf	((_rebuild_input_menu$1429+1))&0ffh

	
l824:; BSR set to: 0

		movff	(_rebuild_input_menu$1429),(_rebuild_input_menu$1428)
	movff	(_rebuild_input_menu$1429+1),(_rebuild_input_menu$1428+1)

	goto	l14181
	
l14179:; BSR set to: 0

		movlw	low(STR_210)
	movwf	((_rebuild_input_menu$1428))&0ffh
	movlw	high(STR_210)
	movwf	((_rebuild_input_menu$1428+1))&0ffh

	
l14181:; BSR set to: 0

		movlw	low(_value_rlylow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlylow)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1428),(c:strcpy@from)
	movff	(_rebuild_input_menu$1428+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1042
	
l14183:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfss	status,2
	goto	u19011
	goto	u19010
u19011:
	goto	l14231
u19010:
	line	1044
	
l14185:; BSR set to: 0

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
	goto	u19021
	goto	u19020
u19021:
	goto	l14189
u19020:
	
l14187:; BSR set to: 0

		movlw	low(STR_214)
	movwf	((_rebuild_input_menu$1433))&0ffh
	movlw	high(STR_214)
	movwf	((_rebuild_input_menu$1433+1))&0ffh

	goto	l14191
	
l14189:; BSR set to: 0

		movlw	low(STR_213)
	movwf	((_rebuild_input_menu$1433))&0ffh
	movlw	high(STR_213)
	movwf	((_rebuild_input_menu$1433+1))&0ffh

	
l14191:; BSR set to: 0

		movlw	low(_value_flow_units)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_units)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1433),(c:strcpy@from)
	movff	(_rebuild_input_menu$1433+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1045
	
l14193:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_215)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_215)
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
	line	1046
	
l14195:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_216)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_216)
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
	line	1047
	
l14197:
		movlw	low(_value_low_flow)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_217)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_217)
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
	line	1050
	
l14199:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3241)
	movff	1+?___lwdiv,(_rebuild_input_menu$3241+1)
	
l14201:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3242)
	movff	1+?___lwmod,(_rebuild_input_menu$3242+1)
	
l14203:
		movlw	low(_value_low_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_218)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_218)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3241),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3241+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3242),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3242+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1053
	
l14205:
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
	line	1056
	
l14207:
		movlw	low(_value_enable)
	movlb	5	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	1057
	
l14209:; BSR set to: 5

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	1058
	
l14211:; BSR set to: 5

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	1059
	
l14213:; BSR set to: 5

		movlw	low(_value_flow_units)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_flow_units)
	movwf	(1+(_input_menu+011h))&0ffh

	line	1060
	
l14215:; BSR set to: 5

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+016h))&0ffh

	line	1061
	
l14217:; BSR set to: 5

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	1062
	
l14219:; BSR set to: 5

		movlw	low(_value_low_flow)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_flow)
	movwf	(1+(_input_menu+020h))&0ffh

	line	1063
	
l14221:; BSR set to: 5

		movlw	low(_value_low_flow_bp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_low_flow_bp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	1064
	
l14223:; BSR set to: 5

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	1065
	
l14225:; BSR set to: 5

		movlw	low(_value_display)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	1066
	
l14227:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+034h))&0ffh

	line	1068
	
l14229:; BSR set to: 5

	movlw	low(0Bh)
	movwf	(0+(_menu+02h))&0ffh
	line	1069
	goto	l14259
	line	1072
	
l14231:; BSR set to: 0

		movlw	low(_value_no_flow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_no_flow)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_219)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_219)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1075
	
l14233:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3241)
	movff	1+?___lwdiv,(_rebuild_input_menu$3241+1)
	
l14235:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3242)
	movff	1+?___lwmod,(_rebuild_input_menu$3242+1)
	
l14237:
		movlw	low(_value_no_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_no_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_220)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_220)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3241),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3241+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3242),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3242+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1078
	
l14239:
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
	line	1081
	
l14241:
		movlw	low(_value_enable)
	movlb	5	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	1082
	
l14243:; BSR set to: 5

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	1083
	
l14245:; BSR set to: 5

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	1084
	
l14247:; BSR set to: 5

		movlw	low(_value_no_flow)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_no_flow)
	movwf	(1+(_input_menu+011h))&0ffh

	line	1085
	
l14249:; BSR set to: 5

		movlw	low(_value_no_flow_bp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_no_flow_bp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	1086
	
l14251:; BSR set to: 5

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	1087
	
l14253:; BSR set to: 5

		movlw	low(_value_display)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+020h))&0ffh

	line	1088
	
l14255:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+025h))&0ffh

	line	1090
	
l14257:; BSR set to: 5

	movlw	low(08h)
	movwf	(0+(_menu+02h))&0ffh
	line	1097
	
l14259:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_221)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_221)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(rebuild_input_menu@sensor),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(rebuild_input_menu@flow_type_val),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1098
	
l14261:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1099
	
l831:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_input_menu
	__end_of_rebuild_input_menu:
	signat	_rebuild_input_menu,4217
	global	_rebuild_clock_menu

;; *************** function _rebuild_clock_menu *****************
;; Defined at:
;;		line 1609 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            50    0[BANK0 ] unsigned char [50]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/5
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
	line	1609
global __ptext18
__ptext18:
psect	text18
	file	"src\menu.c"
	line	1609
	
_rebuild_clock_menu:
;incstack = 0
	callstack 24
	line	1615
	
l14319:; BSR set to: 5

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_259)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_259)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_system_config+06h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1616
	
l14321:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1619
	
l14323:
	movlb	7	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u19201
	goto	u19200
u19201:
	goto	l14327
u19200:
	
l14325:; BSR set to: 7

		movlw	low(STR_262)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1579))&0ffh
	movlw	high(STR_262)
	movwf	((_rebuild_clock_menu$1579+1))&0ffh

	goto	l14329
	
l14327:; BSR set to: 7

		movlw	low(STR_261)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1579))&0ffh
	movlw	high(STR_261)
	movwf	((_rebuild_clock_menu$1579+1))&0ffh

	
l14329:; BSR set to: 0

		movlw	low(_value_clock_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_clock_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_260)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_260)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_clock_menu$1579),0+((c:?_sprintf)+04h)
	movff	(_rebuild_clock_menu$1579+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	1621
	
l14331:
	movlb	7	; () banked
	movf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u19211
	goto	u19210
u19211:
	goto	l14339
u19210:
	
l14333:; BSR set to: 7

		decf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u19221
	goto	u19220

u19221:
	goto	l14337
u19220:
	
l14335:; BSR set to: 7

		movlw	low(STR_265)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1586))&0ffh
	movlw	high(STR_265)
	movwf	((_rebuild_clock_menu$1586+1))&0ffh

	goto	l1088
	
l14337:; BSR set to: 7

		movlw	low(STR_264)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1586))&0ffh
	movlw	high(STR_264)
	movwf	((_rebuild_clock_menu$1586+1))&0ffh

	
l1088:; BSR set to: 0

		movff	(_rebuild_clock_menu$1586),(_rebuild_clock_menu$1585)
	movff	(_rebuild_clock_menu$1586+1),(_rebuild_clock_menu$1585+1)

	goto	l14341
	
l14339:; BSR set to: 7

		movlw	low(STR_263)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1585))&0ffh
	movlw	high(STR_263)
	movwf	((_rebuild_clock_menu$1585+1))&0ffh

	
l14341:; BSR set to: 0

		movlw	low(_value_end_runtime)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_end_runtime)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_clock_menu$1585),(c:strcpy@from)
	movff	(_rebuild_clock_menu$1585+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1626
	
l14343:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_266)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_266)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(03Ch)
	movwf	((c:___lbdiv@divisor))^00h,c
	movlb	7	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbdiv
	movwf	(??_rebuild_clock_menu+0+0)^00h,c
	movf	((??_rebuild_clock_menu+0+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	7	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbmod
	movwf	(??_rebuild_clock_menu+1+0)^00h,c
	movf	((??_rebuild_clock_menu+1+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1628
	
l14345:
		movlw	low(_value_clock_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_clock_display)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_267)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_267)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1630
	
l14347:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_268)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_268)
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
	line	1631
	
l14349:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1634
	
l14351:
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
	line	1637
	
l14353:
		movlw	low(_value_clock_enable)
	movlb	5	; () banked
	movwf	(0+(_clock_menu+02h))&0ffh
	movlw	high(_value_clock_enable)
	movwf	(1+(_clock_menu+02h))&0ffh

	line	1638
	
l14355:; BSR set to: 5

		movlw	low(_value_end_runtime)
	movwf	(0+(_clock_menu+07h))&0ffh
	movlw	high(_value_end_runtime)
	movwf	(1+(_clock_menu+07h))&0ffh

	line	1639
	
l14357:; BSR set to: 5

		movlw	low(_value_relay_pulse)
	movwf	(0+(_clock_menu+0Ch))&0ffh
	movlw	high(_value_relay_pulse)
	movwf	(1+(_clock_menu+0Ch))&0ffh

	line	1640
	
l14359:; BSR set to: 5

		movlw	low(_value_clock_display)
	movwf	(0+(_clock_menu+011h))&0ffh
	movlw	high(_value_clock_display)
	movwf	(1+(_clock_menu+011h))&0ffh

	line	1641
	
l14361:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_clock_menu+016h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_clock_menu+016h))&0ffh

	line	1643
	
l14363:; BSR set to: 5

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	1645
	
l14365:; BSR set to: 5

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_269)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_269)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+02h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1646
	
l14367:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1647
	
l1089:
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
;;		On entry : 0/5
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
	line	544
global __ptext19
__ptext19:
psect	text19
	file	"src\menu.c"
	line	544
	
_menu_update_time_value:
;incstack = 0
	callstack 23
	line	546
	
l13617:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u18361
	goto	u18360
u18361:
	goto	l13621
u18360:
	goto	l646
	line	553
	
l13621:; BSR set to: 5

	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u18371
	goto	u18370
u18371:
	goto	l13627
u18370:
	
l13623:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u18381
	goto	u18380
u18381:
	goto	l13627
u18380:
	line	555
	
l13625:; BSR set to: 5

	movlw	low(020h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	556
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	557
	goto	l13629
	line	560
	
l13627:; BSR set to: 5

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
	movlb	5	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	565
	
l13629:; BSR set to: 0

	movlw	low(03Ah)
	movwf	(0+(menu_update_time_value@value_buf+02h))&0ffh
	line	568
	
l13631:; BSR set to: 0

	movlb	5	; () banked
		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u18391
	goto	u18390

u18391:
	goto	l13637
u18390:
	
l13633:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u18401
	goto	u18400
u18401:
	goto	l13637
u18400:
	line	570
	
l13635:; BSR set to: 5

	movlw	low(020h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	571
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	572
	goto	l13639
	line	575
	
l13637:; BSR set to: 5

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
	movlb	5	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	579
	
l13639:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(menu_update_time_value@value_buf+05h))&0ffh
	line	582
	
l13641:; BSR set to: 0

		movlw	3
	movlb	5	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18411
	goto	u18410

u18411:
	goto	l13649
u18410:
	
l13643:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18421
	goto	u18420

u18421:
	goto	l13649
u18420:
	line	584
	
l13645:; BSR set to: 5

		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_142)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_142)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(menu_update_time_value@value_buf)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c

	call	_sprintf	;wreg free
	line	585
	call	_menu_draw_clock	;wreg free
	goto	l646
	line	590
	
l13649:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u18431
	goto	u18430

u18431:
	goto	l13653
u18430:
	goto	l646
	line	594
	
l13653:; BSR set to: 5

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_time_value@screen_line))&0ffh
	line	595
		movlw	03h-1
	cpfsgt	((menu_update_time_value@screen_line))&0ffh
	goto	u18441
	goto	u18440

u18441:
	goto	l653
u18440:
	goto	l646
	line	596
	
l653:; BSR set to: 0

	line	598
	movff	(_menu),(menu_update_time_value@item_idx)
	line	602
	
l13657:; BSR set to: 0

	movlb	5	; () banked
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
	movlb	5	; () banked
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
	
l13659:; BSR set to: 0

	movff	(menu_update_time_value@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_update_time_value@flow_type),(c:is_time_field@flow_type)
	movf	((menu_update_time_value@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfss	status,2
	goto	u18451
	goto	u18450
u18451:
	goto	l13663
u18450:
	goto	l646
	line	612
	
l13663:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_143)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_143)
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
	
l13665:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	617
	
l13667:
		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_144)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_144)
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
	
l13669:
	line	623
	
l13671:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	624
	
l13673:
		movlw	low(STR_145)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_145)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	626
	
l13675:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	627
	
l13677:
		movlw	low(STR_146)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_146)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	628
	
l13679:
		movlw	low(menu_update_time_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	629
	
l13681:
		movlw	low(STR_147)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_147)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	630
	
l646:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_time_value
	__end_of_menu_update_time_value:
	signat	_menu_update_time_value,89
	global	_menu_draw_clock

;; *************** function _menu_draw_clock *****************
;; Defined at:
;;		line 1691 in file "src\menu.c"
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
;;		On entry : 0/5
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
	line	1691
global __ptext20
__ptext20:
psect	text20
	file	"src\menu.c"
	line	1691
	
_menu_draw_clock:
;incstack = 0
	callstack 23
	line	1694
	
l12733:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1695
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_279)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_279)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1698
	
l12735:
	movlw	low(0)
	movwf	((c:menu_draw_clock@i))^00h,c
	goto	l12815
	line	1700
	
l12737:; BSR set to: 5

	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_clock@i))^00h,c,w
	movwf	((c:menu_draw_clock@item_idx))^00h,c
	line	1701
	
l12739:; BSR set to: 5

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1704
	
l12741:
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
	line	1708
	
l12743:
	line	1710
	
l12745:
	movf	((c:menu_draw_clock@item_idx))^00h,c,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16661
	goto	u16660

u16661:
	goto	l12775
u16660:
	line	1712
	
l12747:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u16671
	goto	u16670
u16671:
	goto	l12771
u16670:
	line	1714
	
l12749:; BSR set to: 5

	movlw	low(02h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	line	1717
	
l12751:; BSR set to: 5

		movlw	2
	xorwf	((c:menu_draw_clock@item_idx))^00h,c,w
	btfsc	status,2
	goto	u16681
	goto	u16680

u16681:
	goto	l12755
u16680:
	line	1719
	
l12753:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u16691
	goto	u16690
u16691:
	goto	l12757
u16690:
	line	1722
	
l12755:; BSR set to: 5

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
	line	1723
	goto	l12779
	line	1727
	
l12757:; BSR set to: 5

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
	line	1728
	
l12759:
	movlw	low(0)
	movwf	((c:menu_draw_clock@j))^00h,c
	goto	l12765
	line	1729
	
l12761:
	movf	((c:menu_draw_clock@j))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1728
	
l12763:
	incf	((c:menu_draw_clock@j))^00h,c
	
l12765:
		movf	((c:menu_draw_clock@val_len))^00h,c,w
	subwf	((c:menu_draw_clock@j))^00h,c,w
	btfss	status,0
	goto	u16701
	goto	u16700

u16701:
	goto	l12761
u16700:
	line	1730
	
l12767:
	movf	((c:menu_draw_clock@val_len))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l12779
	line	1742
	
l12771:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l12755
	line	1749
	
l12775:; BSR set to: 5

	movlw	low(0)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l12755
	line	1754
	
l12779:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_clock@val_len_1617))^00h,c
	line	1756
	
l12781:
	movf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfss	status,2
	goto	u16711
	goto	u16710
u16711:
	goto	l12787
u16710:
	line	1759
	
l12783:
	movf	((c:menu_draw_clock@val_len_1617))^00h,c,w
	btfsc	status,2
	goto	u16721
	goto	u16720
u16721:
	goto	l12813
u16720:
	line	1760
	
l12785:
	movf	((c:menu_draw_clock@val_len_1617))^00h,c,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_print_at
	goto	l12813
	line	1765
	
l12787:
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
	line	1766
	
l12789:
	movf	((c:menu_draw_clock@actual_len))^00h,c,w
	sublw	low(012h)
	movwf	((c:menu_draw_clock@start_pos))^00h,c
	line	1768
	
l12791:
	movff	(c:menu_draw_clock@start_pos),(c:lcd_set_cursor@col)
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1769
	
l12793:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u16731
	goto	u16730

u16731:
	goto	l12797
u16730:
	
l12795:
		movlw	low(STR_281)
	movwf	((c:_menu_draw_clock$1623))^00h,c
	movlw	high(STR_281)
	movwf	((c:_menu_draw_clock$1623+1))^00h,c

	goto	l12799
	
l12797:
		movlw	low(STR_280)
	movwf	((c:_menu_draw_clock$1623))^00h,c
	movlw	high(STR_280)
	movwf	((c:_menu_draw_clock$1623+1))^00h,c

	
l12799:
		movff	(c:_menu_draw_clock$1623),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1623+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1772
	
l12801:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1774
	
l12803:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1775
	
l12805:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u16741
	goto	u16740

u16741:
	goto	l12809
u16740:
	
l12807:
		movlw	low(STR_283)
	movwf	((c:_menu_draw_clock$1627))^00h,c
	movlw	high(STR_283)
	movwf	((c:_menu_draw_clock$1627+1))^00h,c

	goto	l12811
	
l12809:
		movlw	low(STR_282)
	movwf	((c:_menu_draw_clock$1627))^00h,c
	movlw	high(STR_282)
	movwf	((c:_menu_draw_clock$1627+1))^00h,c

	
l12811:
		movff	(c:_menu_draw_clock$1627),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1627+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1698
	
l12813:
	incf	((c:menu_draw_clock@i))^00h,c
	
l12815:
		movlw	03h-0
	cpfslt	((c:menu_draw_clock@i))^00h,c
	goto	u16751
	goto	u16750

u16751:
	goto	l1126
u16750:
	
l12817:
	movlb	5	; () banked
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
	goto	u16761
	goto	u16760

u16761:
	goto	l12737
u16760:
	line	1778
	
l1126:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_clock
	__end_of_menu_draw_clock:
	signat	_menu_draw_clock,89
	global	_menu_draw_utility

;; *************** function _menu_draw_utility *****************
;; Defined at:
;;		line 1783 in file "src\menu.c"
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
;;		On entry : 0/5
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
;;		_main
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text21,class=CODE,space=0,reloc=2,group=0
	line	1783
global __ptext21
__ptext21:
psect	text21
	file	"src\menu.c"
	line	1783
	
_menu_draw_utility:
;incstack = 0
	callstack 22
	line	1786
	
l13319:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1789
	
l13321:
	movlb	5	; () banked
	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u17711
	goto	u17710
u17711:
	goto	l13329
u17710:
	line	1791
	
l13323:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_284)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_284)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1793
	
l13325:
	call	_menu_update_datetime_display	;wreg free
	goto	l1130
	line	1799
	
l13329:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_285)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_285)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1801
	
l13331:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_utility@i))&0ffh
	goto	l13433
	line	1803
	
l13333:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_utility@i))&0ffh,w
	movwf	((menu_draw_utility@item_idx))&0ffh
	line	1804
	
l13335:; BSR set to: 0

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1807
	
l13337:
	movlb	0	; () banked
	movf	((menu_draw_utility@item_idx))&0ffh,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u17721
	goto	u17720

u17721:
	movlw	1
	goto	u17730
u17720:
	movlw	0
u17730:
	movlb	0	; () banked
	movwf	((menu_draw_utility@is_selected))&0ffh
	line	1810
	
l13339:; BSR set to: 0

	movf	((menu_draw_utility@item_idx))&0ffh,w
	btfss	status,2
	goto	u17741
	goto	u17740
u17741:
	goto	l13347
u17740:
	line	1812
	
l13341:; BSR set to: 0

	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u17751
	goto	u17750
u17751:
	goto	l13345
u17750:
	line	1814
	
l13343:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_286)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_286)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1815
	goto	l13431
	line	1818
	
l13345:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_287)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_287)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	goto	l13431
	line	1821
	
l13347:; BSR set to: 0

		movlw	8
	xorwf	((menu_draw_utility@item_idx))&0ffh,w
	btfss	status,2
	goto	u17761
	goto	u17760

u17761:
	goto	l13355
u17760:
	line	1823
	
l13349:; BSR set to: 0

	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u17771
	goto	u17770
u17771:
	goto	l13353
u17770:
	line	1825
	
l13351:; BSR set to: 0

	movlw	low(0Eh)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_288)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_288)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1826
	goto	l13431
	line	1829
	
l13353:; BSR set to: 0

	movlw	low(0Fh)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_289)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_289)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	goto	l13431
	line	1832
	
l13355:; BSR set to: 0

		decf	((menu_draw_utility@item_idx))&0ffh,w
	btfsc	status,2
	goto	u17781
	goto	u17780

u17781:
	goto	l13359
u17780:
	
l13357:; BSR set to: 0

		movlw	2
	xorwf	((menu_draw_utility@item_idx))&0ffh,w
	btfss	status,2
	goto	u17791
	goto	u17790

u17791:
	goto	l13369
u17790:
	line	1834
	
l13359:; BSR set to: 0

	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u17801
	goto	u17800
u17801:
	goto	l13367
u17800:
	line	1836
	
l13361:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_290)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_290)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1837
	
l13363:
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
	line	1838
	
l13365:
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
		movlw	low(STR_291)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_291)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1839
	goto	l13431
	line	1842
	
l13367:; BSR set to: 0

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
	goto	l13431
	line	1848
	
l13369:; BSR set to: 0

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
	line	1851
	
l13371:
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
	goto	u17811
	goto	u17810

u17811:
	goto	l13431
u17810:
	
l13373:; BSR set to: 0

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
	goto	u17821
	goto	u17820

u17821:
	goto	l13431
u17820:
	line	1854
	
l13375:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_utility@show_brackets))&0ffh
	line	1856
	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u17831
	goto	u17830
u17831:
	goto	l13399
u17830:
	line	1858
	
l13377:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u17841
	goto	u17840
u17841:
	goto	l13381
u17840:
	
l13379:; BSR set to: 5

	movlw	high(01h)
	movlb	0	; () banked
	movwf	((_menu_draw_utility$1643+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_draw_utility$1643))&0ffh
	goto	l13383
	
l13381:; BSR set to: 5

	movlw	high(02h)
	movlb	0	; () banked
	movwf	((_menu_draw_utility$1643+1))&0ffh
	movlw	low(02h)
	movwf	((_menu_draw_utility$1643))&0ffh
	
l13383:; BSR set to: 0

	movff	(_menu_draw_utility$1643),(menu_draw_utility@show_brackets)
	line	1860
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17851
	goto	u17850
u17851:
	goto	l13399
u17850:
	
l13385:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17861
	goto	u17860
u17861:
	goto	l13399
u17860:
	line	1862
	
l13387:; BSR set to: 5

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
	line	1863
	
l13389:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_utility@j))&0ffh
	goto	l13395
	line	1864
	
l13391:; BSR set to: 0

	movf	((menu_draw_utility@j))&0ffh,w
	addlw	low(menu_draw_utility@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1863
	
l13393:; BSR set to: 0

	incf	((menu_draw_utility@j))&0ffh
	
l13395:; BSR set to: 0

		movf	((menu_draw_utility@len))&0ffh,w
	subwf	((menu_draw_utility@j))&0ffh,w
	btfss	status,0
	goto	u17871
	goto	u17870

u17871:
	goto	l13391
u17870:
	line	1865
	
l13397:; BSR set to: 0

	movf	((menu_draw_utility@len))&0ffh,w
	addlw	low(menu_draw_utility@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1866
	goto	l1158
	line	1869
	
l13399:
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
	line	1875
	
l1158:
	line	1877
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
	line	1879
	
l13403:; BSR set to: 0

	movf	((menu_draw_utility@show_brackets))&0ffh,w
	btfss	status,2
	goto	u17881
	goto	u17880
u17881:
	goto	l13407
u17880:
	line	1882
	
l13405:; BSR set to: 0

	movf	((menu_draw_utility@val_len))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_utility@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1883
	goto	l13431
	line	1887
	
l13407:; BSR set to: 0

	movf	((menu_draw_utility@val_len))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_utility@start_pos))&0ffh
	line	1888
	
l13409:; BSR set to: 0

	movff	(menu_draw_utility@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1889
	
l13411:
	movlb	0	; () banked
		decf	((menu_draw_utility@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u17891
	goto	u17890

u17891:
	goto	l13415
u17890:
	
l13413:; BSR set to: 0

		movlw	low(STR_293)
	movwf	((_menu_draw_utility$1651))&0ffh
	movlw	high(STR_293)
	movwf	((_menu_draw_utility$1651+1))&0ffh

	goto	l13417
	
l13415:; BSR set to: 0

		movlw	low(STR_292)
	movwf	((_menu_draw_utility$1651))&0ffh
	movlw	high(STR_292)
	movwf	((_menu_draw_utility$1651+1))&0ffh

	
l13417:; BSR set to: 0

		movff	(_menu_draw_utility$1651),(c:lcd_print@str)
	movff	(_menu_draw_utility$1651+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1890
	
l13419:
		movlw	low(menu_draw_utility@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1891
	
l13421:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1892
	
l13423:
	movlb	0	; () banked
		decf	((menu_draw_utility@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u17901
	goto	u17900

u17901:
	goto	l13427
u17900:
	
l13425:; BSR set to: 0

		movlw	low(STR_295)
	movwf	((_menu_draw_utility$1655))&0ffh
	movlw	high(STR_295)
	movwf	((_menu_draw_utility$1655+1))&0ffh

	goto	l13429
	
l13427:; BSR set to: 0

		movlw	low(STR_294)
	movwf	((_menu_draw_utility$1655))&0ffh
	movlw	high(STR_294)
	movwf	((_menu_draw_utility$1655+1))&0ffh

	
l13429:; BSR set to: 0

		movff	(_menu_draw_utility$1655),(c:lcd_print@str)
	movff	(_menu_draw_utility$1655+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1801
	
l13431:
	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh
	
l13433:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_utility@i))&0ffh
	goto	u17911
	goto	u17910

u17911:
	goto	l1130
u17910:
	
l13435:; BSR set to: 0

	movlb	5	; () banked
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
	goto	u17921
	goto	u17920

u17921:
	goto	l13333
u17920:
	line	1897
	
l1130:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_utility
	__end_of_menu_draw_utility:
	signat	_menu_draw_utility,89
	global	_menu_update_datetime_display

;; *************** function _menu_update_datetime_display *****************
;; Defined at:
;;		line 819 in file "src\menu.c"
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
;;		On entry : 0/5
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
psect	text22,class=CODE,space=0,reloc=2,group=0
	line	819
global __ptext22
__ptext22:
psect	text22
	file	"src\menu.c"
	line	819
	
_menu_update_datetime_display:
;incstack = 0
	callstack 22
	line	825
	
l13093:
	movlb	5	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17351
	goto	u17350
u17351:
	goto	l13117
u17350:
	
l13095:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17361
	goto	u17360
u17361:
	goto	l13117
u17360:
	line	827
	
l13097:; BSR set to: 5

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17371
	goto	u17370
u17371:
	goto	l13103
u17370:
	
l13099:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17381
	goto	u17380
u17381:
	goto	l13103
u17380:
	line	828
	
l13101:; BSR set to: 5

		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_150)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_150)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+017h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+018h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l13119
	line	829
	
l13103:; BSR set to: 5

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17391
	goto	u17390

u17391:
	goto	l13109
u17390:
	
l13105:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17401
	goto	u17400
u17401:
	goto	l13109
u17400:
	line	830
	
l13107:; BSR set to: 5

		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_151)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_151)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+016h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+018h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l13119
	line	831
	
l13109:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17411
	goto	u17410

u17411:
	goto	l13115
u17410:
	
l13111:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17421
	goto	u17420
u17421:
	goto	l13115
u17420:
	line	832
	
l13113:; BSR set to: 5

		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_152)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_152)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+016h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+017h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l13119
	line	834
	
l13115:; BSR set to: 5

		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_153)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_153)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+016h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+017h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+018h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	goto	l13119
	line	838
	
l13117:; BSR set to: 5

		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_154)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_154)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+016h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+017h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+018h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	842
	
l13119:
	movlb	5	; () banked
		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17431
	goto	u17430

u17431:
	goto	l13143
u17430:
	
l13121:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17441
	goto	u17440
u17441:
	goto	l13143
u17440:
	line	844
	
l13123:; BSR set to: 5

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17451
	goto	u17450
u17451:
	goto	l13129
u17450:
	
l13125:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17461
	goto	u17460
u17461:
	goto	l13129
u17460:
	line	845
	
l13127:; BSR set to: 5

		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_155)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_155)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+01Ah),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l13145
	line	846
	
l13129:; BSR set to: 5

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17471
	goto	u17470

u17471:
	goto	l13135
u17470:
	
l13131:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17481
	goto	u17480
u17481:
	goto	l13135
u17480:
	line	847
	
l13133:; BSR set to: 5

		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_156)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_156)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+019h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l13145
	line	848
	
l13135:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17491
	goto	u17490

u17491:
	goto	l13141
u17490:
	
l13137:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17501
	goto	u17500
u17501:
	goto	l13141
u17500:
	line	849
	
l13139:; BSR set to: 5

		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_157)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_157)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+019h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l13145
	line	851
	
l13141:; BSR set to: 5

		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_158)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_158)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+019h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+01Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	goto	l13145
	line	855
	
l13143:; BSR set to: 5

		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_159)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_159)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+019h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+01Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	859
	
l13145:
	movlw	(01h)&0ffh
	
	call	_lcd_clear_line
	line	860
	
l13147:
	movlb	5	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17511
	goto	u17510
u17511:
	goto	l13155
u17510:
	line	862
	
l13149:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17521
	goto	u17520
u17521:
	goto	l13153
u17520:
	line	864
	
l13151:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_160)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_160)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	865
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	866
	movlw	low(09h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_161)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_161)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	867
	goto	l739
	line	870
	
l13153:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_162)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_162)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	871
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	872
	movlw	low(09h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_163)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_163)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	goto	l739
	line	877
	
l13155:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	878
	
l739:
	line	881
	movlw	(02h)&0ffh
	
	call	_lcd_clear_line
	line	882
	
l13157:
	movlb	5	; () banked
		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17531
	goto	u17530

u17531:
	goto	l13165
u17530:
	line	884
	
l13159:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17541
	goto	u17540
u17541:
	goto	l13163
u17540:
	line	886
	
l13161:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_164)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_164)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	887
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	888
	movlw	low(09h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_165)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_165)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	889
	goto	l743
	line	892
	
l13163:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_166)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_166)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	893
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	894
	movlw	low(09h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_167)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_167)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	goto	l743
	line	899
	
l13165:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	900
	
l743:
	line	903
	movlw	(03h)&0ffh
	
	call	_lcd_clear_line
	line	904
	
l13167:
		movlw	2
	movlb	5	; () banked
	xorwf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17551
	goto	u17550

u17551:
	goto	l13171
u17550:
	line	906
	
l13169:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_168)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_168)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	line	907
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_169)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_169)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	line	908
	movlw	low(05h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_170)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_170)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	line	909
	goto	l746
	line	911
	
l13171:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_171)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_171)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	line	912
	
l746:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_datetime_display
	__end_of_menu_update_datetime_display:
	signat	_menu_update_datetime_display,89
	global	_menu_draw_setup

;; *************** function _menu_draw_setup *****************
;; Defined at:
;;		line 1529 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  label           2   41[COMRAM] PTR const unsigned char 
;;		 -> STR_247(5), STR_246(6), STR_245(1), STR_244(1), 
;;		 -> STR_243(1), 
;;  sensor_name     2   44[COMRAM] PTR const unsigned char 
;;		 -> Fake(1), STR_250(5), STR_249(5), STR_248(9), 
;;  sensor          1   43[COMRAM] unsigned char 
;;  item_idx        1   46[COMRAM] unsigned char 
;;  i               1   47[COMRAM] unsigned char 
;;  setup_labels   10   25[COMRAM] PTR const unsigned char 
;;		 -> STR_247(5), STR_246(6), STR_245(1), STR_244(1), 
;;		 -> STR_243(1), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/5
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
	line	1529
global __ptext23
__ptext23:
psect	text23
	file	"src\menu.c"
	line	1529
	
_menu_draw_setup:
;incstack = 0
	callstack 23
	line	1534
	
l13801:
	call	_lcd_clear	;wreg free
	line	1535
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1536
	
l13803:
		movlw	low(STR_242)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_242)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1539
	
l13805:
	lfsr	2,(menu_draw_setup@F2715)
	lfsr	1,(menu_draw_setup@setup_labels)
	movlw	10-1
u18681:
	movff	plusw2,plusw1
	decf	wreg
	bc	u18681

	line	1542
	
l13807:
	movlw	low(0)
	movwf	((c:menu_draw_setup@i))^00h,c
	line	1544
	
l13813:
	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_setup@i))^00h,c,w
	movwf	((c:menu_draw_setup@item_idx))^00h,c
	line	1545
		movlw	05h-1
	cpfsgt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u18691
	goto	u18690

u18691:
	goto	l13817
u18690:
	goto	l1072
	line	1548
	
l13817:; BSR set to: 5

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1551
	
l13819:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u18701
	goto	u18700

u18701:
	goto	l13853
u18700:
	line	1553
	
l13821:
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
	line	1555
	
l13823:
	movf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u18711
	goto	u18710
u18711:
	goto	l13831
u18710:
	
l13825:
		decf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u18721
	goto	u18720

u18721:
	goto	l13829
u18720:
	
l13827:
		movlw	low(STR_250)
	movwf	((c:_menu_draw_setup$1556))^00h,c
	movlw	high(STR_250)
	movwf	((c:_menu_draw_setup$1556+1))^00h,c

	goto	l1055
	
l13829:
		movlw	low(STR_249)
	movwf	((c:_menu_draw_setup$1556))^00h,c
	movlw	high(STR_249)
	movwf	((c:_menu_draw_setup$1556+1))^00h,c

	
l1055:
		movff	(c:_menu_draw_setup$1556),(c:menu_draw_setup@sensor_name)
	movff	(c:_menu_draw_setup$1556+1),(c:menu_draw_setup@sensor_name+1)

	goto	l1051
	
l13831:
		movlw	low(STR_248)
	movwf	((c:menu_draw_setup@sensor_name))^00h,c
	movlw	high(STR_248)
	movwf	((c:menu_draw_setup@sensor_name+1))^00h,c

	
l1051:
	line	1558
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18731
	goto	u18730

u18731:
	goto	l13841
u18730:
	line	1561
	
l13833:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1562
	
l13835:
		movlw	low(STR_251)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_251)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1563
	
l13837:
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1564
	
l13839:
		movlw	low(STR_252)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_252)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1565
	goto	l13843
	line	1569
	
l13841:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1573
	
l13843:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1574
	
l13845:
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
	goto	u18741
	goto	u18740
u18741:
	goto	l13849
u18740:
	
l13847:
		movlw	low(STR_254)
	movwf	((c:_menu_draw_setup$1562))^00h,c
	movlw	high(STR_254)
	movwf	((c:_menu_draw_setup$1562+1))^00h,c

	goto	l13851
	
l13849:
		movlw	low(STR_253)
	movwf	((c:_menu_draw_setup$1562))^00h,c
	movlw	high(STR_253)
	movwf	((c:_menu_draw_setup$1562+1))^00h,c

	
l13851:
		movff	(c:_menu_draw_setup$1562),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1562+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1575
	goto	l13879
	line	1579
	
l13853:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_labels)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:menu_draw_setup@label)
	movff	postdec2,(c:menu_draw_setup@label+1)
	line	1581
	
l13855:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18751
	goto	u18750

u18751:
	goto	l13865
u18750:
	line	1584
	
l13857:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1585
	
l13859:
		movlw	low(STR_255)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_255)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1586
	
l13861:
		movff	(c:menu_draw_setup@label),(c:lcd_print@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1587
	
l13863:
		movlw	low(STR_256)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_256)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1588
	goto	l13867
	line	1592
	
l13865:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@label),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1596
	
l13867:
		movlw	3
	xorwf	((c:menu_draw_setup@item_idx))^00h,c,w
	btfss	status,2
	goto	u18761
	goto	u18760

u18761:
	goto	l13879
u18760:
	line	1599
	
l13869:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1600
	
l13871:
	movlb	7	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u18771
	goto	u18770
u18771:
	goto	l13875
u18770:
	
l13873:; BSR set to: 7

		movlw	low(STR_258)
	movwf	((c:_menu_draw_setup$1570))^00h,c
	movlw	high(STR_258)
	movwf	((c:_menu_draw_setup$1570+1))^00h,c

	goto	l13877
	
l13875:; BSR set to: 7

		movlw	low(STR_257)
	movwf	((c:_menu_draw_setup$1570))^00h,c
	movlw	high(STR_257)
	movwf	((c:_menu_draw_setup$1570+1))^00h,c

	
l13877:; BSR set to: 7

		movff	(c:_menu_draw_setup$1570),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1570+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1542
	
l13879:
	incf	((c:menu_draw_setup@i))^00h,c
	
l13881:
		movlw	03h-1
	cpfsgt	((c:menu_draw_setup@i))^00h,c
	goto	u18781
	goto	u18780

u18781:
	goto	l13813
u18780:
	line	1604
	
l1072:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_setup
	__end_of_menu_draw_setup:
	signat	_menu_draw_setup,89
	global	_menu_draw_options

;; *************** function _menu_draw_options *****************
;; Defined at:
;;		line 1370 in file "src\menu.c"
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
;;		On entry : 0/5
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
	line	1370
global __ptext24
__ptext24:
psect	text24
	file	"src\menu.c"
	line	1370
	
_menu_draw_options:
;incstack = 0
	callstack 23
	line	1373
	
l13287:
	call	_lcd_clear	;wreg free
	line	1374
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1375
	
l13289:
		movlw	low(STR_232)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_232)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1378
	
l13291:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	line	1380
	
l13297:
	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_options@i))^00h,c,w
	movwf	((c:menu_draw_options@item_index))^00h,c
	line	1381
		movlw	05h-1
	cpfsgt	((c:menu_draw_options@item_index))^00h,c
	goto	u17681
	goto	u17680

u17681:
	goto	l13301
u17680:
	goto	l996
	line	1384
	
l13301:; BSR set to: 5

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1387
	
l13303:
	movf	((c:menu_draw_options@item_index))^00h,c,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17691
	goto	u17690

u17691:
	goto	l13313
u17690:
	line	1389
	
l13305:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1390
	
l13307:
		movlw	low(STR_233)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_233)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1391
	
l13309:
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
	line	1392
	
l13311:
		movlw	low(STR_234)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_234)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1393
	goto	l13315
	line	1397
	
l13313:; BSR set to: 5

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
	line	1378
	
l13315:
	incf	((c:menu_draw_options@i))^00h,c
	
l13317:
		movlw	03h-1
	cpfsgt	((c:menu_draw_options@i))^00h,c
	goto	u17701
	goto	u17700

u17701:
	goto	l13297
u17700:
	line	1400
	
l996:
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
;;		On entry : 0/5
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
	
l12563:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	168
	
l12565:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u22867:
decfsz	wreg,f
	bra	u22867
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u22867
	nop2
asmopt pop

	line	169
	
l1624:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
	signat	_lcd_clear,89
	global	_menu_draw_input

;; *************** function _menu_draw_input *****************
;; Defined at:
;;		line 1402 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1   31[BANK0 ] unsigned char 
;;  val_len         1   30[BANK0 ] unsigned char 
;;  flag            2   38[BANK0 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), NULL(0), 
;;  opts            2   36[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  flag            2   34[BANK0 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), NULL(0), 
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
;;		On entry : 0/5
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
	line	1402
global __ptext26
__ptext26:
psect	text26
	file	"src\menu.c"
	line	1402
	
_menu_draw_input:
;incstack = 0
	callstack 23
	line	1407
	
l13683:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1409
	
l13685:
		movlw	low(menu_draw_input@title)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_235)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_235)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(01h)
	movlb	5	; () banked
	addwf	((_current_input))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	1+(0+((c:?_sprintf)+04h))^00h,c
	movlw	high(01h)
	addwfc	1+(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1410
	
l13687:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@title)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1413
	
l13689:
	movlb	5	; () banked
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
	line	1414
	
l13691:; BSR set to: 0

	movlb	5	; () banked
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
	line	1417
	
l13693:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@i))&0ffh
	goto	l13797
	line	1419
	
l13695:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_input@i))&0ffh,w
	movwf	((menu_draw_input@item_idx))&0ffh
	line	1420
	
l13697:; BSR set to: 0

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1423
	
l13699:
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
	line	1427
	
l13701:
	line	1429
	
l13703:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18461
	goto	u18460

u18461:
	goto	l13753
u18460:
	line	1431
	
l13705:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u18471
	goto	u18470
u18471:
	goto	l13749
u18470:
	line	1433
	
l13707:; BSR set to: 5

	movlw	low(02h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	line	1436
	
l13709:; BSR set to: 0

	movff	(menu_draw_input@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_option_field@flow_type)
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u18481
	goto	u18480
u18481:
	goto	l13723
u18480:
	line	1438
	
l13711:
	movlb	5	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18491
	goto	u18490
u18491:
	goto	l13725
u18490:
	line	1441
	
l13713:; BSR set to: 5

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts+1)
	line	1442
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag+1)
	line	1444
	
l13715:
	movlb	0	; () banked
	movf	((menu_draw_input@opts))&0ffh,w
iorwf	((menu_draw_input@opts+1))&0ffh,w
	btfsc	status,2
	goto	u18501
	goto	u18500

u18501:
	goto	l13723
u18500:
	
l13717:; BSR set to: 0

	movf	((menu_draw_input@flag))&0ffh,w
iorwf	((menu_draw_input@flag+1))&0ffh,w
	btfsc	status,2
	goto	u18511
	goto	u18510

u18511:
	goto	l13723
u18510:
	
l13719:; BSR set to: 0

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
	goto	u18521
	goto	u18520
u18521:
	goto	l13723
u18520:
	line	1446
	
l13721:; BSR set to: 0

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
	line	1447
	goto	l13757
	line	1450
	
l13723:
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
	goto	l13757
	line	1456
	
l13725:; BSR set to: 5

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts_1518)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts_1518+1)
	line	1457
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag_1522)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag_1522+1)
	line	1459
	
l13727:
	movlb	0	; () banked
	movf	((menu_draw_input@opts_1518))&0ffh,w
iorwf	((menu_draw_input@opts_1518+1))&0ffh,w
	btfsc	status,2
	goto	u18531
	goto	u18530

u18531:
	goto	l13745
u18530:
	
l13729:; BSR set to: 0

	movf	((menu_draw_input@flag_1522))&0ffh,w
iorwf	((menu_draw_input@flag_1522+1))&0ffh,w
	btfsc	status,2
	goto	u18541
	goto	u18540

u18541:
	goto	l13745
u18540:
	
l13731:; BSR set to: 0

	movff	(menu_draw_input@flag_1522),fsr2l
	movff	(menu_draw_input@flag_1522+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	01h
	addwf	((menu_draw_input@opts_1518))&0ffh,w
	movwf	(??_menu_draw_input+1+0)^00h,c
	movlw	0
	addwfc	((menu_draw_input@opts_1518+1))&0ffh,w
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
	goto	u18551
	goto	u18550
u18551:
	goto	l13745
u18550:
	line	1461
	
l13733:; BSR set to: 0

	movff	(menu_draw_input@flag_1522),fsr2l
	movff	(menu_draw_input@flag_1522+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movf	((??_menu_draw_input+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_input+1+0
	movff	prodh,??_menu_draw_input+1+0+1
	movf	(??_menu_draw_input+1+0)^00h,c,w
	addwf	((menu_draw_input@opts_1518))&0ffh,w
	movwf	(??_menu_draw_input+3+0)^00h,c
	movf	(??_menu_draw_input+1+1)^00h,c,w
	addwfc	((menu_draw_input@opts_1518+1))&0ffh,w
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
	line	1462
	
l13735:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j))&0ffh
	goto	l13741
	line	1463
	
l13737:; BSR set to: 0

	movf	((menu_draw_input@j))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1462
	
l13739:; BSR set to: 0

	incf	((menu_draw_input@j))&0ffh
	
l13741:; BSR set to: 0

		movf	((menu_draw_input@val_len))&0ffh,w
	subwf	((menu_draw_input@j))&0ffh,w
	btfss	status,0
	goto	u18561
	goto	u18560

u18561:
	goto	l13737
u18560:
	line	1464
	
l13743:; BSR set to: 0

	movf	((menu_draw_input@val_len))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1465
	goto	l13757
	line	1468
	
l13745:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_236)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_236)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l13757
	line	1481
	
l13749:; BSR set to: 5

	movlw	low(01h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l13723
	line	1488
	
l13753:; BSR set to: 5

	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l13723
	line	1493
	
l13757:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_1526))&0ffh
	line	1494
	
l13759:; BSR set to: 0

	movf	((menu_draw_input@val_len_1526))&0ffh,w
	btfsc	status,2
	goto	u18571
	goto	u18570
u18571:
	goto	l13795
u18570:
	
l13761:; BSR set to: 0

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
		movlw	low(STR_237)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_237)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u18581
	goto	u18580

u18581:
	goto	l13795
u18580:
	line	1497
	
l13763:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u18591
	goto	u18590
u18591:
	goto	l13771
u18590:
	
l13765:; BSR set to: 5

	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18601
	goto	u18600

u18601:
	goto	l13771
u18600:
	line	1500
	
l13767:; BSR set to: 5

	movff	(menu_draw_input@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_numeric_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u18611
	goto	u18610
u18611:
	goto	l13795
u18610:
	
l13769:
	movff	(menu_draw_input@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_time_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u18621
	goto	u18620
u18621:
	goto	l13771
u18620:
	goto	l13795
	line	1507
	
l13771:
	movlb	0	; () banked
	movf	((menu_draw_input@show_brackets))&0ffh,w
	btfss	status,2
	goto	u18631
	goto	u18630
u18631:
	goto	l13775
u18630:
	line	1510
	
l13773:; BSR set to: 0

	movf	((menu_draw_input@val_len_1526))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	1511
	goto	l13795
	line	1515
	
l13775:; BSR set to: 0

	movf	((menu_draw_input@val_len_1526))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_input@start_pos))&0ffh
	line	1516
	
l13777:; BSR set to: 0

	movff	(menu_draw_input@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1519
	
l13779:
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u18641
	goto	u18640

u18641:
	goto	l13783
u18640:
	
l13781:; BSR set to: 0

		movlw	low(STR_239)
	movwf	((_menu_draw_input$1532))&0ffh
	movlw	high(STR_239)
	movwf	((_menu_draw_input$1532+1))&0ffh

	goto	l13785
	
l13783:; BSR set to: 0

		movlw	low(STR_238)
	movwf	((_menu_draw_input$1532))&0ffh
	movlw	high(STR_238)
	movwf	((_menu_draw_input$1532+1))&0ffh

	
l13785:; BSR set to: 0

		movff	(_menu_draw_input$1532),(c:lcd_print@str)
	movff	(_menu_draw_input$1532+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1521
	
l13787:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1523
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u18651
	goto	u18650

u18651:
	goto	l13791
u18650:
	
l13789:; BSR set to: 0

		movlw	low(STR_241)
	movwf	((_menu_draw_input$1536))&0ffh
	movlw	high(STR_241)
	movwf	((_menu_draw_input$1536+1))&0ffh

	goto	l13793
	
l13791:; BSR set to: 0

		movlw	low(STR_240)
	movwf	((_menu_draw_input$1536))&0ffh
	movlw	high(STR_240)
	movwf	((_menu_draw_input$1536+1))&0ffh

	
l13793:; BSR set to: 0

		movff	(_menu_draw_input$1536),(c:lcd_print@str)
	movff	(_menu_draw_input$1536+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1417
	
l13795:
	movlb	0	; () banked
	incf	((menu_draw_input@i))&0ffh
	
l13797:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_input@i))&0ffh
	goto	u18661
	goto	u18660

u18661:
	goto	l1037
u18660:
	
l13799:; BSR set to: 0

	movlb	5	; () banked
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
	goto	u18671
	goto	u18670

u18671:
	goto	l13695
u18670:
	line	1527
	
l1037:; BSR set to: 0

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
;;		 -> menu_draw_clock@value_buf(15), STR_273(1), value_pwr_fail(6), value_brightness(4), 
;;		 -> value_contrast(4), value_menu_timeout(6), value_log_entries(6), STR_272(1), 
;;		 -> STR_271(1), STR_270(1), value_clock_display(10), value_end_runtime(10), 
;;		 -> value_clock_enable(10), menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), value_relay_pulse(10), STR_137(5), 
;;		 -> STR_136(11), STR_135(11), STR_134(9), STR_133(9), 
;;		 -> STR_132(12), STR_131(10), STR_130(9), STR_129(10), 
;;		 -> STR_128(5), STR_127(8), STR_126(10), STR_125(8), 
;;		 -> STR_124(7), STR_123(5), STR_122(8), STR_121(8), 
;;		 -> STR_120(12), STR_119(9), STR_118(11), STR_117(10), 
;;		 -> STR_116(6), STR_115(5), STR_114(7), STR_113(7), 
;;		 -> STR_112(5), STR_111(8), STR_110(8), STR_109(11), 
;;		 -> STR_108(8), STR_107(5), STR_106(7), STR_105(7), 
;;		 -> STR_104(5), STR_103(8), STR_102(9), STR_101(9), 
;;		 -> STR_100(10), STR_99(11), STR_98(10), STR_97(7), 
;;		 -> STR_96(7), STR_95(5), STR_94(8), STR_93(8), 
;;		 -> STR_92(8), STR_91(9), STR_90(6), STR_89(6), 
;;		 -> STR_88(13), STR_87(9), STR_86(12), STR_85(11), 
;;		 -> STR_84(10), STR_83(7), NULL(0), STR_82(7), 
;;		 -> STR_76(1), STR_75(1), STR_74(9), STR_73(6), 
;;		 -> STR_72(6), STR_71(1), STR_70(1), STR_69(1), 
;;		 -> STR_68(5), STR_67(5), STR_66(1), STR_65(1), 
;;		 -> STR_64(1), STR_63(4), STR_62(2), STR_61(1), 
;;		 -> STR_60(1), STR_59(1), STR_58(5), STR_57(4), 
;;		 -> STR_56(1), STR_55(1), STR_54(1), STR_53(8), 
;;		 -> STR_52(7), STR_51(1), STR_50(1), STR_49(5), 
;;		 -> STR_48(5), STR_47(9), STR_46(1), STR_45(1), 
;;		 -> STR_44(1), STR_43(8), STR_42(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   16[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_clock@value_buf(15), STR_273(1), value_pwr_fail(6), value_brightness(4), 
;;		 -> value_contrast(4), value_menu_timeout(6), value_log_entries(6), STR_272(1), 
;;		 -> STR_271(1), STR_270(1), value_clock_display(10), value_end_runtime(10), 
;;		 -> value_clock_enable(10), menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), value_relay_pulse(10), STR_137(5), 
;;		 -> STR_136(11), STR_135(11), STR_134(9), STR_133(9), 
;;		 -> STR_132(12), STR_131(10), STR_130(9), STR_129(10), 
;;		 -> STR_128(5), STR_127(8), STR_126(10), STR_125(8), 
;;		 -> STR_124(7), STR_123(5), STR_122(8), STR_121(8), 
;;		 -> STR_120(12), STR_119(9), STR_118(11), STR_117(10), 
;;		 -> STR_116(6), STR_115(5), STR_114(7), STR_113(7), 
;;		 -> STR_112(5), STR_111(8), STR_110(8), STR_109(11), 
;;		 -> STR_108(8), STR_107(5), STR_106(7), STR_105(7), 
;;		 -> STR_104(5), STR_103(8), STR_102(9), STR_101(9), 
;;		 -> STR_100(10), STR_99(11), STR_98(10), STR_97(7), 
;;		 -> STR_96(7), STR_95(5), STR_94(8), STR_93(8), 
;;		 -> STR_92(8), STR_91(9), STR_90(6), STR_89(6), 
;;		 -> STR_88(13), STR_87(9), STR_86(12), STR_85(11), 
;;		 -> STR_84(10), STR_83(7), NULL(0), STR_82(7), 
;;		 -> STR_76(1), STR_75(1), STR_74(9), STR_73(6), 
;;		 -> STR_72(6), STR_71(1), STR_70(1), STR_69(1), 
;;		 -> STR_68(5), STR_67(5), STR_66(1), STR_65(1), 
;;		 -> STR_64(1), STR_63(4), STR_62(2), STR_61(1), 
;;		 -> STR_60(1), STR_59(1), STR_58(5), STR_57(4), 
;;		 -> STR_56(1), STR_55(1), STR_54(1), STR_53(8), 
;;		 -> STR_52(7), STR_51(1), STR_50(1), STR_49(5), 
;;		 -> STR_48(5), STR_47(9), STR_46(1), STR_45(1), 
;;		 -> STR_44(1), STR_43(8), STR_42(9), 
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
	
l12429:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l12433
	line	10
	
l12431:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l12433:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16107
	tblrd	*
	
	movf	tablat,w
	bra	u16100
u16107:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u16100:
	iorlw	0
	btfss	status,2
	goto	u16111
	goto	u16110
u16111:
	goto	l12431
u16110:
	line	12
	
l12435:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l2587:
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
;;		 -> original_value(10), menu_draw_utility@value_buf(15), menu_draw_clock@value_buf(15), STR_273(1), 
;;		 -> value_pwr_fail(6), value_brightness(4), value_contrast(4), value_menu_timeout(6), 
;;		 -> value_log_entries(6), STR_272(1), STR_271(1), STR_270(1), 
;;		 -> value_clock_display(10), value_end_runtime(10), value_clock_enable(10), menu_draw_input@value_buf(15), 
;;		 -> menu_update_edit_value@display_buf(10), value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), 
;;		 -> value_low_flow(10), value_flow_units(10), value_rlylow(10), value_flow_type(10), 
;;		 -> value_high_tbp(10), value_high_temp(10), value_back(5), value_display(10), 
;;		 -> value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), value_sensor(12), value_enable(10), 
;;		 -> value_relay_pulse(10), NULL(0), 
;;  from            2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_273(1), value_pwr_fail(6), value_brightness(4), value_contrast(4), 
;;		 -> value_menu_timeout(6), value_log_entries(6), STR_272(1), STR_271(1), 
;;		 -> STR_270(1), STR_267(5), value_clock_display(10), STR_265(9), 
;;		 -> STR_264(6), STR_263(6), value_end_runtime(10), value_clock_enable(10), 
;;		 -> STR_236(6), menu_update_edit_value@value_buf(10), value_no_flow_bp(10), STR_219(4), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), STR_214(4), 
;;		 -> STR_213(2), value_flow_units(10), STR_212(9), STR_211(6), 
;;		 -> STR_210(6), value_rlylow(10), STR_209(5), STR_208(5), 
;;		 -> STR_207(8), STR_206(7), value_flow_type(10), STR_205(5), 
;;		 -> STR_204(5), STR_203(5), STR_202(9), STR_201(6), 
;;		 -> STR_200(6), value_high_tbp(10), value_high_temp(10), STR_195(5), 
;;		 -> value_back(5), STR_194(5), STR_193(5), value_display(10), 
;;		 -> STR_192(9), STR_191(6), STR_190(6), value_rlyslp(10), 
;;		 -> STR_189(9), STR_188(6), STR_187(6), value_rlyplp(10), 
;;		 -> STR_186(9), STR_185(6), STR_184(6), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), STR_176(9), 
;;		 -> value_sensor(12), value_enable(10), value_relay_pulse(10), NULL(0), 
;;		 -> STR_76(1), STR_75(1), STR_74(9), STR_73(6), 
;;		 -> STR_72(6), STR_71(1), STR_70(1), STR_69(1), 
;;		 -> STR_68(5), STR_67(5), STR_66(1), STR_65(1), 
;;		 -> STR_64(1), STR_63(4), STR_62(2), STR_61(1), 
;;		 -> STR_60(1), STR_59(1), STR_58(5), STR_57(4), 
;;		 -> STR_56(1), STR_55(1), STR_54(1), STR_53(8), 
;;		 -> STR_52(7), STR_51(1), STR_50(1), STR_49(5), 
;;		 -> STR_48(5), STR_47(9), STR_46(1), STR_45(1), 
;;		 -> STR_44(1), STR_43(8), STR_42(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   19[COMRAM] PTR unsigned char 
;;		 -> original_value(10), menu_draw_utility@value_buf(15), menu_draw_clock@value_buf(15), STR_273(1), 
;;		 -> value_pwr_fail(6), value_brightness(4), value_contrast(4), value_menu_timeout(6), 
;;		 -> value_log_entries(6), STR_272(1), STR_271(1), STR_270(1), 
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
;;		On entry : 0/5
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
	
l12423:
		movff	(c:strcpy@to),(c:strcpy@cp)
	movff	(c:strcpy@to+1),(c:strcpy@cp+1)

	line	19
	goto	l12427
	line	20
	
l12425:
	infsnz	((c:strcpy@cp))^00h,c
	incf	((c:strcpy@cp+1))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l12427:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16077
	tblrd	*
	
	movf	tablat,w
	bra	u16070
u16077:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u16070:
	movff	(c:strcpy@cp),tblptrl
	movff	(c:strcpy@cp+1),tblptrh
	clrf	tblptru
	
	movwf	(??_strcpy+0+0)^00h,c
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16087
	movff	??_strcpy+0+0,tablat
	tblwt*
	bra	u16080
u16087:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	??_strcpy+0+0,indf0
u16080:
	
	movf	(??_strcpy+0+0)^00h,c,w
	btfss	status,2
	goto	u16091
	goto	u16090
u16091:
	goto	l12425
u16090:
	line	24
	
l2581:
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
;;		 -> STR_273(1), value_pwr_fail(6), value_brightness(4), value_contrast(4), 
;;		 -> value_menu_timeout(6), value_log_entries(6), STR_272(1), STR_271(1), 
;;		 -> STR_270(1), value_clock_display(10), value_end_runtime(10), value_clock_enable(10), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), value_relay_pulse(10), 
;;		 -> NULL(0), 
;;  s2              2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_339(5), STR_338(6), STR_337(6), STR_336(8), 
;;		 -> STR_237(1), STR_76(1), STR_75(1), STR_74(9), 
;;		 -> STR_73(6), STR_72(6), STR_71(1), STR_70(1), 
;;		 -> STR_69(1), STR_68(5), STR_67(5), STR_66(1), 
;;		 -> STR_65(1), STR_64(1), STR_63(4), STR_62(2), 
;;		 -> STR_61(1), STR_60(1), STR_59(1), STR_58(5), 
;;		 -> STR_57(4), STR_56(1), STR_55(1), STR_54(1), 
;;		 -> STR_53(8), STR_52(7), STR_51(1), STR_50(1), 
;;		 -> STR_49(5), STR_48(5), STR_47(9), STR_46(1), 
;;		 -> STR_45(1), STR_44(1), STR_43(8), STR_42(9), 
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
	
l13185:
	goto	l13189
	line	38
	
l13187:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l13189:
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
	bra	u17577
	tblrd	*
	
	movf	tablat,w
	bra	u17570
u17577:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u17570:
	movwf	(??_strcmp+1+0)^00h,c
	movf	(??_strcmp+0+0)^00h,c,w
	subwf	((??_strcmp+1+0))^00h,c,w
	movwf	((c:strcmp@r))^00h,c
	movf	((c:strcmp@r))^00h,c,w
	btfss	status,2
	goto	u17581
	goto	u17580
u17581:
	goto	l13193
u17580:
	
l13191:
	movff	(c:strcmp@s1),tblptrl
	movff	(c:strcmp@s1+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u17597
	tblrd	*
	
	movf	tablat,w
	bra	u17590
u17597:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u17590:
	iorlw	0
	btfss	status,2
	goto	u17601
	goto	u17600
u17601:
	goto	l13187
u17600:
	line	41
	
l13193:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l2575:
	return	;funcret
	callstack 0
GLOBAL	__end_of_strcmp
	__end_of_strcmp:
	signat	_strcmp,8314
	global	_lcd_print_at

;; *************** function _lcd_print_at *****************
;; Defined at:
;;		line 918 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   21[COMRAM] unsigned char 
;;  str             2   22[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_utility@value_buf(15), STR_291(2), STR_290(2), STR_289(5), 
;;		 -> STR_288(7), STR_287(10), STR_286(12), STR_285(8), 
;;		 -> STR_284(14), menu_draw_clock@value_buf(15), STR_279(6), Fake(1), 
;;		 -> STR_250(5), STR_249(5), STR_248(9), STR_247(5), 
;;		 -> STR_246(6), STR_245(1), STR_244(1), STR_243(1), 
;;		 -> menu_draw_input@value_buf(15), menu_draw_input@title(10), STR_171(5), STR_170(2), 
;;		 -> STR_169(5), STR_168(2), STR_167(2), STR_166(2), 
;;		 -> STR_165(2), STR_164(2), STR_163(2), STR_162(2), 
;;		 -> STR_161(2), STR_160(2), menu_update_datetime_display@time_buf(9), menu_update_datetime_display@date_buf(9), 
;;		 -> STR_137(5), STR_136(11), STR_135(11), STR_134(9), 
;;		 -> STR_133(9), STR_132(12), STR_131(10), STR_130(9), 
;;		 -> STR_129(10), STR_128(5), STR_127(8), STR_126(10), 
;;		 -> STR_125(8), STR_124(7), STR_123(5), STR_122(8), 
;;		 -> STR_121(8), STR_120(12), STR_119(9), STR_118(11), 
;;		 -> STR_117(10), STR_116(6), STR_115(5), STR_114(7), 
;;		 -> STR_113(7), STR_112(5), STR_111(8), STR_110(8), 
;;		 -> STR_109(11), STR_108(8), STR_107(5), STR_106(7), 
;;		 -> STR_105(7), STR_104(5), STR_103(8), STR_102(9), 
;;		 -> STR_101(9), STR_100(10), STR_99(11), STR_98(10), 
;;		 -> STR_97(7), STR_96(7), STR_95(5), STR_94(8), 
;;		 -> STR_93(8), STR_92(8), STR_91(9), STR_90(6), 
;;		 -> STR_89(6), STR_88(13), STR_87(9), STR_86(12), 
;;		 -> STR_85(11), STR_84(10), STR_83(7), STR_82(7), 
;;		 -> STR_81(5), STR_80(6), STR_79(13), STR_78(11), 
;;		 -> STR_77(10), 
;; Auto vars:     Size  Location     Type
;;  row             1   24[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/5
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
psect	text30,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	918
global __ptext30
__ptext30:
psect	text30
	file	"src\menu.c"
	line	918
	
_lcd_print_at:
;incstack = 0
	callstack 23
	movwf	((c:lcd_print_at@row))^00h,c
	line	920
	
l12419:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	921
	
l12421:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	922
	
l749:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print_at
	__end_of_lcd_print_at:
	signat	_lcd_print_at,12409
	global	_lcd_clear_line

;; *************** function _lcd_clear_line *****************
;; Defined at:
;;		line 924 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  row             1   21[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
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
psect	text31,class=CODE,space=0,reloc=2,group=0
	line	924
global __ptext31
__ptext31:
psect	text31
	file	"src\menu.c"
	line	924
	
_lcd_clear_line:
;incstack = 0
	callstack 23
	movwf	((c:lcd_clear_line@row))^00h,c
	line	926
	
l12415:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	927
	
l12417:
		movlw	low(STR_172)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_172)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	928
	
l752:
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
;;		On entry : 0/5
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
	
l12097:
	goto	l12109
	line	135
	
l1609:
	line	136
	movff	(c:lcd_set_cursor@col),(c:lcd_set_cursor@addr)
	line	137
	goto	l12111
	line	139
	
l12099:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(040h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	140
	goto	l12111
	line	142
	
l12101:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(094h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	143
	goto	l12111
	line	145
	
l12103:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(0D4h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	146
	goto	l12111
	line	148
	
l12105:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	149
	goto	l12111
	line	133
	
l12109:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l1609
	xorlw	1^0	; case 1
	skipnz
	goto	l12099
	xorlw	2^1	; case 2
	skipnz
	goto	l12101
	xorlw	3^2	; case 3
	skipnz
	goto	l12103
	goto	l12105

	line	152
	
l12111:
	movf	((c:lcd_set_cursor@addr))^00h,c,w
	iorlw	low(080h)
	
	call	_lcd_cmd
	line	153
	
l1615:
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
;;		 -> STR_295(2), STR_294(2), STR_293(2), STR_292(2), 
;;		 -> menu_draw_utility@value_buf(15), STR_291(2), STR_290(2), STR_289(5), 
;;		 -> STR_288(7), STR_287(10), STR_286(12), STR_285(8), 
;;		 -> STR_284(14), STR_283(2), STR_282(2), STR_281(2), 
;;		 -> STR_280(2), menu_draw_clock@value_buf(15), STR_279(6), STR_258(2), 
;;		 -> STR_257(2), STR_256(2), STR_255(2), STR_254(2), 
;;		 -> STR_253(2), STR_252(2), STR_251(2), Fake(1), 
;;		 -> STR_250(5), STR_249(5), STR_248(9), STR_247(5), 
;;		 -> STR_246(6), STR_245(1), STR_244(1), STR_243(1), 
;;		 -> STR_242(21), STR_241(2), STR_240(2), STR_239(2), 
;;		 -> STR_238(2), menu_draw_input@value_buf(15), menu_draw_input@title(10), STR_234(2), 
;;		 -> STR_233(2), STR_232(21), STR_231(2), STR_230(2), 
;;		 -> STR_229(6), menu_update_numeric_value@value_buf(6), STR_228(2), STR_227(2), 
;;		 -> STR_226(7), menu_update_edit_value@display_buf(10), STR_172(21), STR_171(5), 
;;		 -> STR_170(2), STR_169(5), STR_168(2), STR_167(2), 
;;		 -> STR_166(2), STR_165(2), STR_164(2), STR_163(2), 
;;		 -> STR_162(2), STR_161(2), STR_160(2), menu_update_datetime_display@time_buf(9), 
;;		 -> menu_update_datetime_display@date_buf(9), STR_147(2), STR_146(2), STR_145(8), 
;;		 -> menu_update_time_value@value_buf(6), STR_137(5), STR_136(11), STR_135(11), 
;;		 -> STR_134(9), STR_133(9), STR_132(12), STR_131(10), 
;;		 -> STR_130(9), STR_129(10), STR_128(5), STR_127(8), 
;;		 -> STR_126(10), STR_125(8), STR_124(7), STR_123(5), 
;;		 -> STR_122(8), STR_121(8), STR_120(12), STR_119(9), 
;;		 -> STR_118(11), STR_117(10), STR_116(6), STR_115(5), 
;;		 -> STR_114(7), STR_113(7), STR_112(5), STR_111(8), 
;;		 -> STR_110(8), STR_109(11), STR_108(8), STR_107(5), 
;;		 -> STR_106(7), STR_105(7), STR_104(5), STR_103(8), 
;;		 -> STR_102(9), STR_101(9), STR_100(10), STR_99(11), 
;;		 -> STR_98(10), STR_97(7), STR_96(7), STR_95(5), 
;;		 -> STR_94(8), STR_93(8), STR_92(8), STR_91(9), 
;;		 -> STR_90(6), STR_89(6), STR_88(13), STR_87(9), 
;;		 -> STR_86(12), STR_85(11), STR_84(10), STR_83(7), 
;;		 -> STR_82(7), STR_81(5), STR_80(6), STR_79(13), 
;;		 -> STR_78(11), STR_77(10), STR_38(8), STR_37(12), 
;;		 -> STR_32(6), STR_31(12), STR_18(16), STR_17(13), 
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
	
l12113:
	goto	l12119
	line	160
	
l12115:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15497
	tblrd	*
	
	movf	tablat,w
	bra	u15490
u15497:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15490:
	
	call	_lcd_data
	
l12117:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	158
	
l12119:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15507
	tblrd	*
	
	movf	tablat,w
	bra	u15500
u15507:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15500:
	iorlw	0
	btfss	status,2
	goto	u15511
	goto	u15510
u15511:
	goto	l12115
u15510:
	line	162
	
l1621:
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
	
l12063:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	52
	
l12065:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	53
	
l12067:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	54
	
l12069:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	55
	
l12071:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	56
	
l12073:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	57
	
l12075:
	asmopt push
asmopt off
	movlw	133
u22877:
decfsz	wreg,f
	bra	u22877
	nop
asmopt pop

	line	60
	
l12077:
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	61
	
l12079:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	62
	
l12081:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	63
	
l12083:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	64
	
l12085:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	65
	
l12087:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	66
	asmopt push
asmopt off
	movlw	133
u22887:
decfsz	wreg,f
	bra	u22887
	nop
asmopt pop

	line	67
	
l1602:
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
;;		On entry : 3A/5
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
	line	253
global __ptext35
__ptext35:
psect	text35
	file	"src\menu.c"
	line	253
	
_is_time_field:
;incstack = 0
	callstack 27
	movwf	((c:is_time_field@line))^00h,c
	line	255
	
l12691:
	movf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16531
	goto	u16530
u16531:
	goto	l12707
u16530:
	line	258
	
l12693:
	movlw	low(01h)
	movwf	((c:_is_time_field$1251))^00h,c
	
l12695:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16541
	goto	u16540

u16541:
	goto	l532
u16540:
	
l12697:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16551
	goto	u16550

u16551:
	goto	l532
u16550:
	
l12699:
		movlw	8
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16561
	goto	u16560

u16561:
	goto	l532
u16560:
	
l12701:
	movlw	low(0)
	movwf	((c:_is_time_field$1251))^00h,c
	
l532:
	movf	((c:_is_time_field$1251))^00h,c,w
	goto	l533
	line	260
	
l12707:
		decf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16571
	goto	u16570

u16571:
	goto	l12715
u16570:
	line	263
	
l12709:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16581
	goto	u16580

u16581:
	movlw	1
	goto	u16590
u16580:
	movlw	0
u16590:
	goto	l533
	line	265
	
l12715:
		movlw	2
	xorwf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16601
	goto	u16600

u16601:
	goto	l12729
u16600:
	line	267
	
l12717:
	movf	((c:is_time_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u16611
	goto	u16610
u16611:
	goto	l12725
u16610:
	line	270
	
l12719:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16621
	goto	u16620

u16621:
	movlw	1
	goto	u16630
u16620:
	movlw	0
u16630:
	goto	l533
	line	275
	
l12725:
		movlw	4
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16641
	goto	u16640

u16641:
	movlw	1
	goto	u16650
u16640:
	movlw	0
u16650:
	goto	l533
	line	279
	
l12729:
	movlw	(0)&0ffh
	line	280
	
l533:
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
;;		On entry : 3A/5
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
	line	285
global __ptext36
__ptext36:
psect	text36
	file	"src\menu.c"
	line	285
	
_is_option_field:
;incstack = 0
	callstack 26
	movwf	((c:is_option_field@line))^00h,c
	line	288
	
l12819:
	movf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16771
	goto	u16770
u16771:
	goto	l12823
u16770:
	
l12821:
		decf	((c:is_option_field@line))^00h,c,w
	btfss	status,2
	goto	u16781
	goto	u16780

u16781:
	goto	l12827
u16780:
	line	289
	
l12823:
	movlw	(01h)&0ffh
	goto	l545
	line	291
	
l12827:
	movf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16791
	goto	u16790
u16791:
	goto	l12845
u16790:
	line	294
	
l12829:
	movlw	low(01h)
	movwf	((c:_is_option_field$1256))^00h,c
	
l12831:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16801
	goto	u16800

u16801:
	goto	l548
u16800:
	
l12833:
		movlw	10
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16811
	goto	u16810

u16811:
	goto	l548
u16810:
	
l12835:
		movlw	11
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16821
	goto	u16820

u16821:
	goto	l548
u16820:
	
l12837:
		movlw	12
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16831
	goto	u16830

u16831:
	goto	l548
u16830:
	
l12839:
	movlw	low(0)
	movwf	((c:_is_option_field$1256))^00h,c
	
l548:
	movf	((c:_is_option_field$1256))^00h,c,w
	goto	l545
	line	296
	
l12845:
		decf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16841
	goto	u16840

u16841:
	goto	l12859
u16840:
	line	299
	
l12847:
	movlw	low(01h)
	movwf	((c:_is_option_field$1257))^00h,c
	
l12849:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16851
	goto	u16850

u16851:
	goto	l552
u16850:
	
l12851:
		movlw	7
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16861
	goto	u16860

u16861:
	goto	l552
u16860:
	
l12853:
	movlw	low(0)
	movwf	((c:_is_option_field$1257))^00h,c
	
l552:
	movf	((c:_is_option_field$1257))^00h,c,w
	goto	l545
	line	301
	
l12859:
		movlw	2
	xorwf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16871
	goto	u16870

u16871:
	goto	l12893
u16870:
	line	303
	
l12861:
	movf	((c:is_option_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u16881
	goto	u16880
u16881:
	goto	l12879
u16880:
	line	306
	
l12863:
	movlw	low(01h)
	movwf	((c:_is_option_field$1258))^00h,c
	
l12865:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16891
	goto	u16890

u16891:
	goto	l557
u16890:
	
l12867:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16901
	goto	u16900

u16901:
	goto	l557
u16900:
	
l12869:
		movlw	8
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16911
	goto	u16910

u16911:
	goto	l557
u16910:
	
l12871:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16921
	goto	u16920

u16921:
	goto	l557
u16920:
	
l12873:
	movlw	low(0)
	movwf	((c:_is_option_field$1258))^00h,c
	
l557:
	movf	((c:_is_option_field$1258))^00h,c,w
	goto	l545
	line	311
	
l12879:
	movlw	low(01h)
	movwf	((c:_is_option_field$1259))^00h,c
	
l12881:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16931
	goto	u16930

u16931:
	goto	l560
u16930:
	
l12883:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16941
	goto	u16940

u16941:
	goto	l560
u16940:
	
l12885:
		movlw	5
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16951
	goto	u16950

u16951:
	goto	l560
u16950:
	
l12887:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16961
	goto	u16960

u16961:
	goto	l560
u16960:
	
l12889:
	movlw	low(0)
	movwf	((c:_is_option_field$1259))^00h,c
	
l560:
	movf	((c:_is_option_field$1259))^00h,c,w
	goto	l545
	line	315
	
l12893:
	movlw	(0)&0ffh
	line	316
	
l545:
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
;;		On entry : 3A/5
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
	line	221
global __ptext37
__ptext37:
psect	text37
	file	"src\menu.c"
	line	221
	
_is_numeric_field:
;incstack = 0
	callstack 27
	movwf	((c:is_numeric_field@line))^00h,c
	line	223
	
l12631:
	movf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16391
	goto	u16390
u16391:
	goto	l12649
u16390:
	line	226
	
l12633:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1244))^00h,c
	
l12635:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16401
	goto	u16400

u16401:
	goto	l516
u16400:
	
l12637:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16411
	goto	u16410

u16411:
	goto	l516
u16410:
	
l12639:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16421
	goto	u16420

u16421:
	goto	l516
u16420:
	
l12641:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16431
	goto	u16430

u16431:
	goto	l516
u16430:
	
l12643:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1244))^00h,c
	
l516:
	movf	((c:_is_numeric_field$1244))^00h,c,w
	goto	l517
	line	228
	
l12649:
		decf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16441
	goto	u16440

u16441:
	goto	l12665
u16440:
	line	231
	
l12651:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1245))^00h,c
	
l12653:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16451
	goto	u16450

u16451:
	goto	l521
u16450:
	
l12655:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16461
	goto	u16460

u16461:
	goto	l521
u16460:
	
l12657:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16471
	goto	u16470

u16471:
	goto	l521
u16470:
	
l12659:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1245))^00h,c
	
l521:
	movf	((c:_is_numeric_field$1245))^00h,c,w
	goto	l517
	line	233
	
l12665:
		movlw	2
	xorwf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16481
	goto	u16480

u16481:
	goto	l12683
u16480:
	line	235
	
l12667:
	movf	((c:is_numeric_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u16491
	goto	u16490
u16491:
	goto	l12683
u16490:
	line	238
	
l12669:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1246))^00h,c
	
l12671:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16501
	goto	u16500

u16501:
	goto	l526
u16500:
	
l12673:
		movlw	5
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16511
	goto	u16510

u16511:
	goto	l526
u16510:
	
l12675:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16521
	goto	u16520

u16521:
	goto	l526
u16520:
	
l12677:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1246))^00h,c
	
l526:
	movf	((c:_is_numeric_field$1246))^00h,c,w
	goto	l517
	line	243
	
l12683:
	movlw	(0)&0ffh
	line	248
	
l517:
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
;;		On entry : 3A/5
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
	line	322
global __ptext38
__ptext38:
psect	text38
	file	"src\menu.c"
	line	322
	
_get_option_edit_flag:
;incstack = 0
	callstack 26
	movwf	((c:get_option_edit_flag@line))^00h,c
	line	325
	
l12897:
	movf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16971
	goto	u16970
u16971:
	goto	l12903
u16970:
	line	326
	
l12899:
		movlw	low(_enable_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l564
	line	327
	
l12903:
		decf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16981
	goto	u16980

u16981:
	goto	l12909
u16980:
	line	328
	
l12905:
		movlw	low(_sensor_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l564
	line	331
	
l12909:
	movf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16991
	goto	u16990
u16991:
	goto	l12935
u16990:
	line	333
	
l12911:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17001
	goto	u17000

u17001:
	goto	l12917
u17000:
	line	334
	
l12913:
		movlw	low(_relay_high_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l564
	line	335
	
l12917:
		movlw	10
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17011
	goto	u17010

u17011:
	goto	l12923
u17010:
	line	336
	
l12919:
		movlw	low(_relay_plp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l564
	line	337
	
l12923:
		movlw	11
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17021
	goto	u17020

u17021:
	goto	l12929
u17020:
	line	338
	
l12925:
		movlw	low(_relay_slp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l564
	line	339
	
l12929:
		movlw	12
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17031
	goto	u17030

u17031:
	goto	l12995
u17030:
	line	340
	
l12931:
		movlw	low(_display_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l564
	line	343
	
l12935:
		decf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17041
	goto	u17040

u17041:
	goto	l12949
u17040:
	line	345
	
l12937:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17051
	goto	u17050

u17051:
	goto	l12943
u17050:
	goto	l12913
	line	347
	
l12943:
		movlw	7
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17061
	goto	u17060

u17061:
	goto	l12995
u17060:
	goto	l12931
	line	351
	
l12949:
		movlw	2
	xorwf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17071
	goto	u17070

u17071:
	goto	l12995
u17070:
	line	353
	
l12951:
		movlw	2
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17081
	goto	u17080

u17081:
	goto	l12957
u17080:
	line	354
	
l12953:
		movlw	low(_flow_type_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l564
	line	356
	
l12957:
	movf	((c:get_option_edit_flag@flow_type))^00h,c,w
	btfss	status,2
	goto	u17091
	goto	u17090
u17091:
	goto	l12977
u17090:
	line	358
	
l12959:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17101
	goto	u17100

u17101:
	goto	l12965
u17100:
	line	359
	
l12961:
		movlw	low(_flow_units_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l564
	line	360
	
l12965:
		movlw	8
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17111
	goto	u17110

u17111:
	goto	l12971
u17110:
	line	361
	
l12967:
		movlw	low(_relay_low_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l564
	line	362
	
l12971:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17121
	goto	u17120

u17121:
	goto	l12995
u17120:
	goto	l12931
	line	367
	
l12977:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17131
	goto	u17130

u17131:
	goto	l12983
u17130:
	line	368
	
l12979:
		movlw	low(_no_flow_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l564
	line	369
	
l12983:
		movlw	5
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17141
	goto	u17140

u17141:
	goto	l12989
u17140:
	goto	l12967
	line	371
	
l12989:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17151
	goto	u17150

u17151:
	goto	l12995
u17150:
	goto	l12931
	line	376
	
l12995:
		movlw	low(0)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(0)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	line	377
	
l564:
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
;;		On entry : 3A/5
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
	line	383
global __ptext39
__ptext39:
psect	text39
	file	"src\menu.c"
	line	383
	
_get_item_options_for_field:
;incstack = 0
	callstack 26
	movwf	((c:get_item_options_for_field@line))^00h,c
	line	386
	
l12999:
	movf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17161
	goto	u17160
u17161:
	goto	l13005
u17160:
	line	387
	
l13001:
		movlw	low(_menu_item_options)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l589
	line	388
	
l13005:
		decf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17171
	goto	u17170

u17171:
	goto	l13011
u17170:
	line	389
	
l13007:
		movlw	low(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l589
	line	392
	
l13011:
	movf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17181
	goto	u17180
u17181:
	goto	l13029
u17180:
	line	394
	
l13013:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u17191
	goto	u17190

u17191:
	goto	l13019
u17190:
	
l13015:
		movlw	10
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u17201
	goto	u17200

u17201:
	goto	l13019
u17200:
	
l13017:
		movlw	11
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17211
	goto	u17210

u17211:
	goto	l13023
u17210:
	line	395
	
l13019:
		movlw	low(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l589
	line	396
	
l13023:
		movlw	12
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17221
	goto	u17220

u17221:
	goto	l13089
u17220:
	line	397
	
l13025:
		movlw	low(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l589
	line	400
	
l13029:
		decf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17231
	goto	u17230

u17231:
	goto	l13043
u17230:
	line	402
	
l13031:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17241
	goto	u17240

u17241:
	goto	l13037
u17240:
	goto	l13019
	line	404
	
l13037:
		movlw	7
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17251
	goto	u17250

u17251:
	goto	l13089
u17250:
	goto	l13025
	line	408
	
l13043:
		movlw	2
	xorwf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17261
	goto	u17260

u17261:
	goto	l13089
u17260:
	line	410
	
l13045:
		movlw	2
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17271
	goto	u17270

u17271:
	goto	l13051
u17270:
	line	411
	
l13047:
		movlw	low(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l589
	line	413
	
l13051:
	movf	((c:get_item_options_for_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u17281
	goto	u17280
u17281:
	goto	l13071
u17280:
	line	415
	
l13053:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17291
	goto	u17290

u17291:
	goto	l13059
u17290:
	line	416
	
l13055:
		movlw	low(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l589
	line	417
	
l13059:
		movlw	8
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17301
	goto	u17300

u17301:
	goto	l13065
u17300:
	goto	l13019
	line	419
	
l13065:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17311
	goto	u17310

u17311:
	goto	l13089
u17310:
	goto	l13025
	line	424
	
l13071:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17321
	goto	u17320

u17321:
	goto	l13077
u17320:
	line	425
	
l13073:
		movlw	low(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l589
	line	426
	
l13077:
		movlw	5
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17331
	goto	u17330

u17331:
	goto	l13083
u17330:
	goto	l13019
	line	428
	
l13083:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17341
	goto	u17340

u17341:
	goto	l13089
u17340:
	goto	l13025
	line	433
	
l13089:
		movlw	low(0)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(0)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	line	434
	
l589:
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
;;		On entry : 0/5
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
	line	443
global __ptext40
__ptext40:
psect	text40
	file	"src\menu.c"
	line	443
	
_init_time_editor:
;incstack = 0
	callstack 24
	line	446
	
l13901:
	movff	(c:init_time_editor@mode),0+(_menu+010h)
	line	447
	movff	(c:init_time_editor@value_seconds),0+(_menu+014h)
	movff	(c:init_time_editor@value_seconds+1),1+(_menu+014h)
	line	450
	
l13903:
	movf	((c:init_time_editor@mode))^00h,c,w
	btfss	status,2
	goto	u18801
	goto	u18800
u18801:
	goto	l13907
u18800:
	line	452
	
l13905:
	movff	(c:init_time_editor@value_seconds),(c:___lwdiv@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	movlb	5	; () banked
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
	movlb	5	; () banked
	movwf	(0+(_menu+013h))&0ffh
	line	454
	goto	l13909
	line	457
	
l13907:
	movff	(c:init_time_editor@value_seconds),(c:___lwdiv@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwdiv@dividend+1)
	movlw	high(0E10h)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(0E10h)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	movlb	5	; () banked
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
	movlb	5	; () banked
	movwf	(0+(_menu+013h))&0ffh
	line	462
	
l13909:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+011h))&0ffh
	line	467
	
l13911:; BSR set to: 5

		movlw	low(init_time_editor@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_138)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_138)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:init_time_editor@value_seconds),0+((c:?_sprintf)+04h)
	movff	(c:init_time_editor@value_seconds+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+012h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	468
	
l13913:
		movlw	low(init_time_editor@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	469
	
l615:
	return	;funcret
	callstack 0
GLOBAL	__end_of_init_time_editor
	__end_of_init_time_editor:
	signat	_init_time_editor,8313
	global	_init_numeric_editor

;; *************** function _init_numeric_editor *****************
;; Defined at:
;;		line 1105 in file "src\menu.c"
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
;;		On entry : 0/5
;;		On exit  : 3F/5
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
psect	text41,class=CODE,space=0,reloc=2,group=0
	line	1105
global __ptext41
__ptext41:
psect	text41
	file	"src\menu.c"
	line	1105
	
_init_numeric_editor:
;incstack = 0
	callstack 26
	line	1109
	
l14263:
	movlb	5	; () banked
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
	line	1110
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
	line	1113
	
l14265:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+0Fh))&0ffh
	line	1115
	
l14267:; BSR set to: 5

	movf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u19031
	goto	u19030
u19031:
	goto	l14275
u19030:
	line	1118
	
l14269:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u19041
	goto	u19040

u19041:
	goto	l14273
u19040:
	
l14271:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19051
	goto	u19050

u19051:
	goto	l14289
u19050:
	line	1119
	
l14273:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+0Fh))&0ffh
	goto	l14289
	line	1121
	
l14275:; BSR set to: 5

		decf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u19061
	goto	u19060

u19061:
	goto	l14281
u19060:
	line	1124
	
l14277:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19071
	goto	u19070

u19071:
	goto	l14289
u19070:
	goto	l14273
	line	1127
	
l14281:; BSR set to: 5

		movlw	2
	xorwf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u19081
	goto	u19080

u19081:
	goto	l14289
u19080:
	
l14283:; BSR set to: 5

	movf	((c:init_numeric_editor@flow_type))^00h,c,w
	btfss	status,2
	goto	u19091
	goto	u19090
u19091:
	goto	l14289
u19090:
	line	1130
	
l14285:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19101
	goto	u19100

u19101:
	goto	l14289
u19100:
	goto	l14273
	line	1135
	
l14289:; BSR set to: 5

	movff	(c:init_numeric_editor@value),0+(_menu+0Dh)
	movff	(c:init_numeric_editor@value+1),1+(_menu+0Dh)
	line	1138
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u19111
	goto	u19110
u19111:
	goto	l846
u19110:
	
l14291:; BSR set to: 5

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u19120
	goto	u19121

u19121:
	goto	l846
u19120:
	line	1139
	
l14293:; BSR set to: 5

	movlw	high(0)
	movwf	((c:init_numeric_editor@value+1))^00h,c
	movlw	low(0)
	movwf	((c:init_numeric_editor@value))^00h,c
	
l846:; BSR set to: 5

	line	1142
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u19131
	goto	u19130
u19131:
	goto	l14297
u19130:
	
l14295:; BSR set to: 5

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u19141
	goto	u19140

u19141:
	movlw	1
	goto	u19150
u19140:
	movlw	0
u19150:
	movwf	((c:_init_numeric_editor$1447))^00h,c
	clrf	((c:_init_numeric_editor$1447+1))^00h,c
	goto	l14299
	
l14297:; BSR set to: 5

	movlw	high(0)
	movwf	((c:_init_numeric_editor$1447+1))^00h,c
	movlw	low(0)
	movwf	((c:_init_numeric_editor$1447))^00h,c
	
l14299:; BSR set to: 5

	movff	(c:_init_numeric_editor$1447),0+(_menu+09h)
	line	1145
	
l14301:; BSR set to: 5

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u19161
	goto	u19160

u19161:
	goto	l852
u19160:
	
l14303:; BSR set to: 5

	movff	(c:init_numeric_editor@value),(c:init_numeric_editor@abs_val)
	movff	(c:init_numeric_editor@value+1),(c:init_numeric_editor@abs_val+1)
	goto	l14305
	
l852:; BSR set to: 5

	movff	(c:init_numeric_editor@value),??_init_numeric_editor+0+0
	movff	(c:init_numeric_editor@value+1),??_init_numeric_editor+0+0+1
	comf	(??_init_numeric_editor+0+0)^00h,c
	comf	(??_init_numeric_editor+0+1)^00h,c
	infsnz	(??_init_numeric_editor+0+0)^00h,c
	incf	(??_init_numeric_editor+0+1)^00h,c
	movff	??_init_numeric_editor+0+0,(c:init_numeric_editor@abs_val)
	movff	??_init_numeric_editor+0+1,(c:init_numeric_editor@abs_val+1)
	line	1146
	
l14305:; BSR set to: 5

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
	movlb	5	; () banked
	movwf	(0+(_menu+0Ah))&0ffh
	line	1147
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
	movlb	5	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	line	1148
	movff	(c:init_numeric_editor@abs_val),(c:___lwmod@dividend)
	movff	(c:init_numeric_editor@abs_val+1),(c:___lwmod@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	movlb	5	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	line	1151
	
l14307:; BSR set to: 5

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u19171
	goto	u19170
u19171:
	movlw	1
	goto	u19180
u19170:
	movlw	0
u19180:
	movwf	(0+(_menu+08h))&0ffh
	line	1152
	
l855:; BSR set to: 5

	return	;funcret
	callstack 0
GLOBAL	__end_of_init_numeric_editor
	__end_of_init_numeric_editor:
	signat	_init_numeric_editor,4217
	global	_init_datetime_editor

;; *************** function _init_datetime_editor *****************
;; Defined at:
;;		line 671 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            80    0[BANK1 ] unsigned char [80]
;;  current_time    7   80[BANK1 ] struct .
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/5
;;		On exit  : 3F/5
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0      87       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0      87       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       87 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_rtc_read_time
;;		_sprintf
;;		_uart_println
;; This function is called by:
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text42,class=CODE,space=0,reloc=2,group=0
	line	671
global __ptext42
__ptext42:
psect	text42
	file	"src\menu.c"
	line	671
	
_init_datetime_editor:; BSR set to: 5

;incstack = 0
	callstack 23
	line	676
	
l13945:
		movlw	low(init_datetime_editor@current_time)
	movwf	((c:rtc_read_time@time))^00h,c
	movlw	high(init_datetime_editor@current_time)
	movwf	((c:rtc_read_time@time+1))^00h,c

	call	_rtc_read_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u18821
	goto	u18820
u18821:
	goto	l13953
u18820:
	line	678
	
l13947:
	movff	0+(init_datetime_editor@current_time+04h),0+(_menu+016h)
	line	679
	movff	0+(init_datetime_editor@current_time+05h),0+(_menu+017h)
	line	680
	movff	0+(init_datetime_editor@current_time+06h),0+(_menu+018h)
	line	681
	movff	0+(init_datetime_editor@current_time+02h),0+(_menu+019h)
	line	682
	movff	0+(init_datetime_editor@current_time+01h),0+(_menu+01Ah)
	line	683
	movff	(init_datetime_editor@current_time),0+(_menu+01Bh)
	line	688
	
l13949:
		movlw	low(init_datetime_editor@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(init_datetime_editor@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_148)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_148)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+016h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+017h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+018h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(_menu+019h),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	movff	0+(_menu+01Ah),0+((c:?_sprintf)+0Ch)
	clrf	(1+((c:?_sprintf)+0Ch))^00h,c
	movff	0+(_menu+01Bh),0+((c:?_sprintf)+0Eh)
	clrf	(1+((c:?_sprintf)+0Eh))^00h,c
	call	_sprintf	;wreg free
	line	689
	
l13951:
		movlw	low(init_datetime_editor@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(init_datetime_editor@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	690
	goto	l13967
	line	693
	
l13953:
		movlw	low(STR_149)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_149)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	694
	
l13955:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	(0+(_menu+016h))&0ffh
	line	695
	
l13957:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+017h))&0ffh
	line	696
	
l13959:; BSR set to: 5

	movlw	low(019h)
	movwf	(0+(_menu+018h))&0ffh
	line	697
	
l13961:; BSR set to: 5

	movlw	low(0Ch)
	movwf	(0+(_menu+019h))&0ffh
	line	698
	
l13963:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Ah))&0ffh
	line	699
	
l13965:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Bh))&0ffh
	line	702
	
l13967:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+01Ch))&0ffh
	line	703
	
l13969:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Dh))&0ffh
	line	704
	
l13971:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	705
	
l672:; BSR set to: 5

	return	;funcret
	callstack 0
GLOBAL	__end_of_init_datetime_editor
	__end_of_init_datetime_editor:
	signat	_init_datetime_editor,89
	global	_rtc_read_time

;; *************** function _rtc_read_time *****************
;; Defined at:
;;		line 121 in file "src\rtc.c"
;; Parameters:    Size  Location     Type
;;  time            2   64[COMRAM] PTR struct .
;;		 -> menu_handle_button@verify_time(7), init_datetime_editor@current_time(7), main@current_time(7), 
;; Auto vars:     Size  Location     Type
;;  i               1   87[BANK0 ] unsigned char 
;;  debug_buf      80    0[BANK0 ] unsigned char [80]
;;  data            7   80[BANK0 ] unsigned char [7]
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/5
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
;;		_init_datetime_editor
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text43,class=CODE,space=0,reloc=2,group=0
	file	"src\rtc.c"
	line	121
global __ptext43
__ptext43:
psect	text43
	file	"src\rtc.c"
	line	121
	
_rtc_read_time:; BSR set to: 5

;incstack = 0
	callstack 25
	line	126
	
l12567:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16331
	goto	u16330
u16331:
	goto	l12573
u16330:
	line	127
	
l12569:
	movlw	(01h)&0ffh
	goto	l1754
	line	128
	
l12573:
	asmopt push
asmopt off
	movlw	133
u22897:
decfsz	wreg,f
	bra	u22897
	nop
asmopt pop

	line	130
	
l12575:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u16341
	goto	u16340
u16341:
	goto	l12581
u16340:
	goto	l12569
	line	132
	
l12581:
	asmopt push
asmopt off
	movlw	133
u22907:
decfsz	wreg,f
	bra	u22907
	nop
asmopt pop

	line	134
	
l12583:
	movlw	(0)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u16351
	goto	u16350
u16351:
	goto	l12589
u16350:
	goto	l12569
	line	136
	
l12589:
	asmopt push
asmopt off
	movlw	133
u22917:
decfsz	wreg,f
	bra	u22917
	nop
asmopt pop

	line	138
	
l12591:
	call	_i2c_stop	;wreg free
	line	139
	
l12593:
	asmopt push
asmopt off
	movlw	228
u22927:
	nop2
	nop2
decfsz	wreg,f
	bra	u22927
	nop2
	nop2
asmopt pop

	line	142
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16361
	goto	u16360
u16361:
	goto	l12599
u16360:
	goto	l12569
	line	144
	
l12599:
	asmopt push
asmopt off
	movlw	133
u22937:
decfsz	wreg,f
	bra	u22937
	nop
asmopt pop

	line	146
	
l12601:
	movlw	(0D1h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u16371
	goto	u16370
u16371:
	goto	l12607
u16370:
	goto	l12569
	line	148
	
l12607:
	asmopt push
asmopt off
	movlw	133
u22947:
decfsz	wreg,f
	bra	u22947
	nop
asmopt pop

	line	150
	
l12609:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((rtc_read_time@i))&0ffh
	line	152
	
l12615:; BSR set to: 0

	movf	((rtc_read_time@i))&0ffh,w
	addlw	low(rtc_read_time@data)
	movwf	fsr2l
	clrf	fsr2h
	movlw	(01h)&0ffh
	
	call	_i2c_read
	movwf	indf2,c

	line	150
	
l12617:
	movlb	0	; () banked
	incf	((rtc_read_time@i))&0ffh
	
l12619:; BSR set to: 0

		movlw	06h-1
	cpfsgt	((rtc_read_time@i))&0ffh
	goto	u16381
	goto	u16380

u16381:
	goto	l12615
u16380:
	line	154
	
l12621:; BSR set to: 0

	movlw	(0)&0ffh
	
	call	_i2c_read
	movlb	0	; () banked
	movwf	(0+(rtc_read_time@data+06h))&0ffh
	line	155
	call	_i2c_stop	;wreg free
	line	160
	
l12623:
		movlw	low(rtc_read_time@debug_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_354)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_354)
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
	line	161
	
l12625:
		movlw	low(rtc_read_time@debug_buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	164
	movlb	0	; () banked
	movf	((rtc_read_time@data))&0ffh,w
	andlw	low(07Fh)
	
	call	_bcd_to_dec
	movff	(c:rtc_read_time@time),fsr2l
	movff	(c:rtc_read_time@time+1),fsr2h
	movwf	indf2,c

	line	165
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

	line	166
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

	line	167
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

	line	168
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

	line	169
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

	line	170
	lfsr	2,06h
	movf	((c:rtc_read_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_read_time@time+1))^00h,c,w
	addwfc	fsr2h
	movlb	0	; () banked
	movf	(0+(rtc_read_time@data+06h))&0ffh,w
	
	call	_bcd_to_dec
	movwf	indf2,c

	line	172
	
l12627:
	movlw	(0)&0ffh
	line	173
	
l1754:
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
psect	text44,class=CODE,space=0,reloc=2,group=0
	line	63
global __ptext44
__ptext44:
psect	text44
	file	"src\rtc.c"
	line	63
	
_bcd_to_dec:
;incstack = 0
	callstack 27
	movwf	((c:bcd_to_dec@bcd))^00h,c
	line	65
	
l12517:
	movff	(c:bcd_to_dec@bcd),??_bcd_to_dec+0+0
	movlw	0Fh
	andwf	(??_bcd_to_dec+0+0)^00h,c
	swapf	((c:bcd_to_dec@bcd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	mullw	0Ah
	movf	(prodl)^0f00h,c,w
	addwf	(??_bcd_to_dec+0+0)^00h,c,w
	line	66
	
l1736:
	return	;funcret
	callstack 0
GLOBAL	__end_of_bcd_to_dec
	__end_of_bcd_to_dec:
	signat	_bcd_to_dec,4217
	global	_get_current_numeric_value

;; *************** function _get_current_numeric_value *****************
;; Defined at:
;;		line 1154 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  value           2   22[COMRAM] int 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] int 
;; Registers used:
;;		wreg, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : 3F/5
;;		On exit  : 3F/5
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
psect	text45,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1154
global __ptext45
__ptext45:
psect	text45
	file	"src\menu.c"
	line	1154
	
_get_current_numeric_value:
;incstack = 0
	callstack 27
	line	1156
	
l14309:; BSR set to: 5

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
	line	1157
	
l14311:; BSR set to: 5

	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u19191
	goto	u19190
u19191:
	goto	l14315
u19190:
	line	1158
	
l14313:; BSR set to: 5

	negf	((c:get_current_numeric_value@value))^00h,c
	comf	((c:get_current_numeric_value@value+1))^00h,c
	btfsc	status,0
	incf	((c:get_current_numeric_value@value+1))^00h,c
	line	1159
	
l14315:; BSR set to: 5

	movff	(c:get_current_numeric_value@value),(c:?_get_current_numeric_value)
	movff	(c:get_current_numeric_value@value+1),(c:?_get_current_numeric_value+1)
	line	1160
	
l859:; BSR set to: 5

	return	;funcret
	callstack 0
GLOBAL	__end_of_get_current_numeric_value
	__end_of_get_current_numeric_value:
	signat	_get_current_numeric_value,90
	global	_beep

;; *************** function _beep *****************
;; Defined at:
;;		line 163 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  duration_ms     2   14[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2   17[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/5
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
psect	text46,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	163
global __ptext46
__ptext46:
psect	text46
	file	"src\main.c"
	line	163
	
_beep:; BSR set to: 5

;incstack = 0
	callstack 27
	line	165
	
l13279:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	166
	
l13281:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l157
	line	168
	
l13283:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u22957:
decfsz	wreg,f
	bra	u22957
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u22957
	nop2
asmopt pop

	line	166
	
l13285:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l157:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u17671
	goto	u17670

u17671:
	goto	l13283
u17670:
	
l159:
	line	170
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	171
	
l160:
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
;;		On entry : 3F/5
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
psect	text47,class=CODE,space=0,reloc=2,group=0
	file	"src\lcd.c"
	line	70
global __ptext47
__ptext47:
psect	text47
	file	"src\lcd.c"
	line	70
	
_lcd_init:
;incstack = 0
	callstack 26
	line	73
	
l14703:; BSR set to: 5

	movlw	(0F0h)&0ffh
	andwf	((c:3986))^0f00h,c	;volatile
	line	74
	
l14705:; BSR set to: 5

	bcf	((c:3986))^0f00h,c,5	;volatile
	line	75
	
l14707:; BSR set to: 5

	bcf	((c:3986))^0f00h,c,6	;volatile
	line	76
	
l14709:; BSR set to: 5

	bcf	((c:3986))^0f00h,c,7	;volatile
	line	79
	
l14711:; BSR set to: 5

	bcf	((c:3977))^0f00h,c,6	;volatile
	line	80
	
l14713:; BSR set to: 5

	bcf	((c:3977))^0f00h,c,5	;volatile
	line	81
	
l14715:; BSR set to: 5

	bcf	((c:3977))^0f00h,c,7	;volatile
	line	82
	
l14717:; BSR set to: 5

	movlw	(0)&0ffh
	
	call	_lcd_write_nibble
	line	85
	
l14719:
	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u22967:
decfsz	wreg,f
	bra	u22967
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u22967
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u22967
	nop
asmopt pop

	line	88
	
l14721:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	89
	
l14723:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	90
	
l14725:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	91
	
l14727:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	92
	
l14729:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	93
	
l14731:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	94
	
l14733:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u22977:
decfsz	wreg,f
	bra	u22977
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u22977
asmopt pop

	line	96
	
l14735:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	97
	
l14737:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	98
	
l14739:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	99
	
l14741:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	100
	
l14743:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u22987:
decfsz	wreg,f
	bra	u22987
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u22987
	nop2
asmopt pop

	line	102
	
l14745:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	103
	
l14747:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	104
	
l14749:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	105
	
l14751:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	106
	
l14753:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u22997:
decfsz	wreg,f
	bra	u22997
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u22997
	nop2
asmopt pop

	line	109
	
l14755:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	110
	
l14757:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	111
	
l14759:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	112
	
l14761:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	113
	
l14763:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u23007:
decfsz	wreg,f
	bra	u23007
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u23007
	nop2
asmopt pop

	line	116
	
l14765:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	119
	
l14767:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	122
	
l14769:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	125
	
l14771:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	126
	
l1605:
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
;;		On entry : 0/5
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
psect	text48,class=CODE,space=0,reloc=2,group=0
	line	17
global __ptext48
__ptext48:
psect	text48
	file	"src\lcd.c"
	line	17
	
_lcd_cmd:
;incstack = 0
	callstack 24
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	20
	
l12029:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	21
	
l12031:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	22
	
l12033:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	23
	
l12035:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	24
	
l12037:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	25
	
l12039:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	26
	
l12041:
	asmopt push
asmopt off
	movlw	133
u23017:
decfsz	wreg,f
	bra	u23017
	nop
asmopt pop

	line	29
	
l12043:
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	30
	
l12045:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	31
	
l12047:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	32
	
l12049:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	33
	
l12051:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	34
	
l12053:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	37
	
l12055:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u15441
	goto	u15440

u15441:
	goto	l12059
u15440:
	
l12057:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u15451
	goto	u15450

u15451:
	goto	l12061
u15450:
	line	39
	
l12059:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u23027:
decfsz	wreg,f
	bra	u23027
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u23027
	nop2
asmopt pop

	line	40
	goto	l1599
	line	43
	
l12061:
	asmopt push
asmopt off
	movlw	133
u23037:
decfsz	wreg,f
	bra	u23037
	nop
asmopt pop

	line	45
	
l1599:
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
;;		On entry : 0/5
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
psect	text49,class=CODE,space=0,reloc=2,group=0
	line	8
global __ptext49
__ptext49:
psect	text49
	file	"src\lcd.c"
	line	8
	
_lcd_write_nibble:
;incstack = 0
	callstack 24
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	10
	
l12023:
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u15351
	goto	u15350
u15351:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u15368
u15350:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u15368:
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not ((1<<1)-1)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	11
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u15371
	goto	u15370
u15371:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u15388
u15370:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u15388:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<1)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	12
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u15391
	goto	u15390
u15391:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u15408
u15390:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u15408:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<2)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	13
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u15411
	goto	u15410
u15411:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u15428
u15410:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u15428:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<3)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	14
	
l1592:
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
psect	text50,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	16
global __ptext50
__ptext50:
psect	text50
	file	"src\i2c.c"
	line	16
	
_i2c_init:
;incstack = 0
	callstack 28
	line	19
	
l14571:
	bsf	((c:3988))^0f00h,c,3	;volatile
	line	20
	bsf	((c:3988))^0f00h,c,4	;volatile
	line	23
	
l14573:
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
	
l14575:
	asmopt push
asmopt off
	movlw	26
u23047:
decfsz	wreg,f
	bra	u23047
	nop2
asmopt pop

	line	34
	
l1647:
	return	;funcret
	callstack 0
GLOBAL	__end_of_i2c_init
	__end_of_i2c_init:
	signat	_i2c_init,89
	global	_handle_utility_numeric_rotation

;; *************** function _handle_utility_numeric_rotation *****************
;; Defined at:
;;		line 646 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  direction       1    wreg     char 
;; Auto vars:     Size  Location     Type
;;  direction       1   71[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/5
;;		On exit  : 3F/5
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
;;		_rebuild_utility_menu
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text51,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	646
global __ptext51
__ptext51:
psect	text51
	file	"src\menu.c"
	line	646
	
_handle_utility_numeric_rotation:
;incstack = 0
	callstack 25
	movwf	((c:handle_utility_numeric_rotation@direction))^00h,c
	line	650
	
l14829:
		movlw	3
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19551
	goto	u19550

u19551:
	goto	l667
u19550:
	line	652
	
l14831:; BSR set to: 5

		movf	((c:handle_utility_numeric_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u19561
	goto	u19560

u19561:
	goto	l14837
u19560:
	line	654
	
l14833:; BSR set to: 5

	movlw	0Ah
	movlb	7	; () banked
	addwf	(0+(_system_config+020h))&0ffh
	movlw	0
	addwfc	(1+(_system_config+020h))&0ffh
	line	655
		movf	(1+(_system_config+020h))&0ffh,w
	bnz	u19570
	movlw	251
	subwf	 (0+(_system_config+020h))&0ffh,w
	btfss	status,0
	goto	u19571
	goto	u19570

u19571:
	goto	l14843
u19570:
	line	656
	
l14835:; BSR set to: 7

	movlw	high(0)
	movwf	(1+(_system_config+020h))&0ffh
	movlw	low(0)
	movwf	(0+(_system_config+020h))&0ffh
	goto	l14843
	line	660
	
l14837:; BSR set to: 5

	movlb	7	; () banked
		movf	(1+(_system_config+020h))&0ffh,w
	bnz	u19581
	movlw	10
	subwf	 (0+(_system_config+020h))&0ffh,w
	btfsc	status,0
	goto	u19581
	goto	u19580

u19581:
	goto	l14841
u19580:
	line	661
	
l14839:; BSR set to: 7

	movlw	high(0FAh)
	movwf	(1+(_system_config+020h))&0ffh
	movlw	low(0FAh)
	movwf	(0+(_system_config+020h))&0ffh
	goto	l14843
	line	663
	
l14841:; BSR set to: 7

	movlw	0Ah
	subwf	(0+(_system_config+020h))&0ffh
	movlw	0
	subwfb	(1+(_system_config+020h))&0ffh
	line	667
	
l14843:; BSR set to: 7

	call	_rebuild_utility_menu	;wreg free
	line	669
	
l667:; BSR set to: 5

	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_utility_numeric_rotation
	__end_of_handle_utility_numeric_rotation:
	signat	_handle_utility_numeric_rotation,4217
	global	_rebuild_utility_menu

;; *************** function _rebuild_utility_menu *****************
;; Defined at:
;;		line 1652 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   70[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/5
;;		On exit  : 3F/5
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
;;		_handle_utility_numeric_rotation
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text52,class=CODE,space=0,reloc=2,group=0
	line	1652
global __ptext52
__ptext52:
psect	text52
	file	"src\menu.c"
	line	1652
	
_rebuild_utility_menu:; BSR set to: 5

;incstack = 0
	callstack 25
	line	1657
	
l13915:
	movlw	low(0)
	movwf	((c:rebuild_utility_menu@i))^00h,c
	line	1659
	
l13921:
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
	line	1660
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
	line	1657
	
l13923:
	incf	((c:rebuild_utility_menu@i))^00h,c
	
l13925:
		movlw	09h-1
	cpfsgt	((c:rebuild_utility_menu@i))^00h,c
	goto	u18811
	goto	u18810

u18811:
	goto	l13921
u18810:
	line	1664
	
l13927:
		movlw	low(STR_270)
	movlb	6	; () banked
	movwf	(0+(_utility_menu+02h))&0ffh
	movlw	high(STR_270)
	movwf	(1+(_utility_menu+02h))&0ffh

	line	1665
		movlw	low(STR_271)
	movwf	(0+(_utility_menu+07h))&0ffh
	movlw	high(STR_271)
	movwf	(1+(_utility_menu+07h))&0ffh

	line	1666
		movlw	low(STR_272)
	movwf	(0+(_utility_menu+0Ch))&0ffh
	movlw	high(STR_272)
	movwf	(1+(_utility_menu+0Ch))&0ffh

	line	1667
		movlw	low(_value_log_entries)
	movwf	(0+(_utility_menu+011h))&0ffh
	movlw	high(_value_log_entries)
	movwf	(1+(_utility_menu+011h))&0ffh

	line	1668
		movlw	low(_value_menu_timeout)
	movwf	(0+(_utility_menu+016h))&0ffh
	movlw	high(_value_menu_timeout)
	movwf	(1+(_utility_menu+016h))&0ffh

	line	1669
		movlw	low(_value_contrast)
	movwf	(0+(_utility_menu+01Bh))&0ffh
	movlw	high(_value_contrast)
	movwf	(1+(_utility_menu+01Bh))&0ffh

	line	1670
		movlw	low(_value_brightness)
	movwf	(0+(_utility_menu+020h))&0ffh
	movlw	high(_value_brightness)
	movwf	(1+(_utility_menu+020h))&0ffh

	line	1671
		movlw	low(_value_pwr_fail)
	movwf	(0+(_utility_menu+025h))&0ffh
	movlw	high(_value_pwr_fail)
	movwf	(1+(_utility_menu+025h))&0ffh

	line	1672
		movlw	low(STR_273)
	movwf	(0+(_utility_menu+02Ah))&0ffh
	movlw	high(STR_273)
	movwf	(1+(_utility_menu+02Ah))&0ffh

	line	1675
	
l13929:; BSR set to: 6

		movlw	low(_value_log_entries)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_log_entries)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_274)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_274)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+020h),0+((c:?_sprintf)+04h)
	movff	1+(_system_config+020h),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1678
	
l13931:
		movlw	low(_value_menu_timeout)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_menu_timeout)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_275)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_275)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(03Ch)
	movwf	((c:___lbdiv@divisor))^00h,c
	movlb	7	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	
	call	___lbdiv
	movwf	(??_rebuild_utility_menu+0+0)^00h,c
	movf	((??_rebuild_utility_menu+0+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	7	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	
	call	___lbmod
	movwf	(??_rebuild_utility_menu+1+0)^00h,c
	movf	((??_rebuild_utility_menu+1+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1679
	
l13933:
		movlw	low(_value_contrast)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_contrast)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_276)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_276)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+010h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1680
	
l13935:
		movlw	low(_value_brightness)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_brightness)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_277)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_277)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1683
	
l13937:
	movff	0+(_system_config+012h),(c:___lwdiv@dividend)
	movff	1+(_system_config+012h),(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:_rebuild_utility_menu$3243)
	movff	1+?___lwdiv,(c:_rebuild_utility_menu$3243+1)
	
l13939:
	movff	0+(_system_config+012h),(c:___lwmod@dividend)
	movff	1+(_system_config+012h),(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movff	0+?___lwmod,(c:_rebuild_utility_menu$3244)
	movff	1+?___lwmod,(c:_rebuild_utility_menu$3244+1)
	
l13941:
		movlw	low(_value_pwr_fail)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_pwr_fail)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_278)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_278)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:_rebuild_utility_menu$3243),0+((c:?_sprintf)+04h)
	movff	(c:_rebuild_utility_menu$3243+1),1+((c:?_sprintf)+04h)
	movff	(c:_rebuild_utility_menu$3244),0+((c:?_sprintf)+06h)
	movff	(c:_rebuild_utility_menu$3244+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1685
	
l13943:
	movlw	low(09h)
	movlb	5	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	1686
	
l1096:; BSR set to: 5

	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_utility_menu
	__end_of_rebuild_utility_menu:
	signat	_rebuild_utility_menu,89
	global	_sprintf

;; *************** function _sprintf *****************
;; Defined at:
;;		line 505 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              2   26[COMRAM] PTR unsigned char 
;;		 -> rtc_read_time@debug_buf(80), rtc_set_time@buf(80), menu_handle_button@buf_1796(50), menu_handle_button@buf_1788(50), 
;;		 -> menu_handle_button@buf_1779(50), menu_handle_button@buf_1769(50), menu_handle_button@buf_1743(50), menu_handle_button@buf_1730(80), 
;;		 -> menu_handle_button@buf_1711(80), menu_handle_button@buf_1709(50), menu_handle_button@buf_1707(50), menu_handle_button@buf(50), 
;;		 -> menu_handle_encoder@buf_1680(50), menu_handle_encoder@buf_1677(50), menu_handle_encoder@buf(50), STR_273(1), 
;;		 -> value_pwr_fail(6), value_brightness(4), value_contrast(4), value_menu_timeout(6), 
;;		 -> value_log_entries(6), STR_272(1), STR_271(1), STR_270(1), 
;;		 -> value_clock_display(10), value_end_runtime(10), value_clock_enable(10), rebuild_clock_menu@buf(50), 
;;		 -> menu_draw_input@title(10), menu_update_edit_value@value_buf(10), handle_numeric_rotation@buf(50), rebuild_input_menu@buf(50), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), menu_update_datetime_display@time_buf(9), 
;;		 -> menu_update_datetime_display@date_buf(9), init_datetime_editor@buf(80), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> value_relay_pulse(10), handle_time_rotation@buf(50), init_time_editor@buf(60), NULL(0), 
;;		 -> main@buf_714(30), main@buf_675(40), main@buf_672(60), main@buf_667(50), 
;;		 -> main@time_buf(60), main@buf_633(30), main@buf_628(50), main@buf(50), 
;;		 -> trigger_relay_pulse@buf(60), 
;;  f               2   28[COMRAM] PTR const unsigned char 
;;		 -> STR_354(40), STR_353(50), STR_347(28), STR_341(46), 
;;		 -> STR_334(32), STR_333(38), STR_331(5), STR_330(6), 
;;		 -> STR_329(6), STR_328(5), STR_327(6), STR_326(6), 
;;		 -> STR_325(5), STR_324(5), STR_323(6), STR_322(6), 
;;		 -> STR_320(10), STR_319(26), STR_315(44), STR_313(45), 
;;		 -> STR_312(34), STR_311(32), STR_310(42), STR_309(32), 
;;		 -> STR_308(10), STR_307(10), STR_306(26), STR_305(28), 
;;		 -> STR_304(25), STR_303(20), STR_302(26), STR_301(35), 
;;		 -> STR_300(28), STR_299(37), STR_298(32), STR_297(23), 
;;		 -> STR_296(37), STR_278(10), STR_277(3), STR_276(3), 
;;		 -> STR_275(10), STR_274(3), STR_269(29), STR_268(46), 
;;		 -> STR_266(10), STR_260(3), STR_259(35), STR_235(9), 
;;		 -> STR_225(9), STR_224(7), STR_223(29), STR_221(48), 
;;		 -> STR_220(10), STR_218(10), STR_217(5), STR_216(6), 
;;		 -> STR_215(6), STR_199(10), STR_198(3), STR_197(6), 
;;		 -> STR_196(6), STR_183(10), STR_182(10), STR_181(5), 
;;		 -> STR_180(10), STR_179(5), STR_178(6), STR_177(6), 
;;		 -> STR_173(3), STR_159(15), STR_158(15), STR_157(13), 
;;		 -> STR_156(13), STR_155(13), STR_154(15), STR_153(15), 
;;		 -> STR_152(13), STR_151(13), STR_150(13), STR_148(47), 
;;		 -> STR_144(27), STR_143(51), STR_142(3), STR_141(25), 
;;		 -> STR_140(45), STR_138(35), STR_30(17), STR_29(23), 
;;		 -> STR_28(35), STR_27(17), STR_25(37), STR_14(28), 
;;		 -> STR_11(28), STR_6(39), STR_3(27), STR_1(48), 
;; Auto vars:     Size  Location     Type
;;  idx             1   47[COMRAM] unsigned char 
;;  tmpval          4    0        struct .
;;  width           2   60[COMRAM] int 
;;  val             2   58[COMRAM] unsigned int 
;;  len             2   55[COMRAM] unsigned int 
;;  cp              2   53[COMRAM] PTR const unsigned char 
;;		 -> STR_366(7), sprintf@c(1), ?_sprintf(2), STR_273(1), 
;;		 -> value_pwr_fail(6), value_brightness(4), value_contrast(4), value_menu_timeout(6), 
;;		 -> value_log_entries(6), STR_272(1), STR_271(1), STR_270(1), 
;;		 -> value_clock_display(10), value_end_runtime(10), STR_262(9), STR_261(8), 
;;		 -> value_clock_enable(10), value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), 
;;		 -> value_low_flow(10), value_flow_units(10), value_rlylow(10), value_flow_type(10), 
;;		 -> value_high_tbp(10), value_high_temp(10), value_back(5), value_display(10), 
;;		 -> value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), value_sensor(12), STR_175(9), 
;;		 -> STR_174(8), value_enable(10), value_relay_pulse(10), menu_update_time_value@value_buf(6), 
;;		 -> display_edit_flag(1), relay_high_edit_flag(1), enable_edit_flag(1), NULL(0), 
;;		 -> menu_item_options$option_count(1), STR_76(1), STR_75(1), STR_74(9), 
;;		 -> STR_73(6), STR_72(6), STR_71(1), STR_70(1), 
;;		 -> STR_69(1), STR_68(5), STR_67(5), STR_66(1), 
;;		 -> STR_65(1), STR_64(1), STR_63(4), STR_62(2), 
;;		 -> STR_61(1), STR_60(1), STR_59(1), STR_58(5), 
;;		 -> STR_57(4), STR_56(1), STR_55(1), STR_54(1), 
;;		 -> STR_53(8), STR_52(7), STR_51(1), STR_50(1), 
;;		 -> STR_49(5), STR_48(5), STR_47(9), STR_46(1), 
;;		 -> STR_45(1), STR_44(1), STR_43(8), STR_42(9), 
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
;;		_init_datetime_editor
;;		_menu_update_datetime_display
;;		_rebuild_input_menu
;;		_handle_numeric_rotation
;;		_menu_update_edit_value
;;		_menu_draw_input
;;		_rebuild_clock_menu
;;		_rebuild_utility_menu
;;		_menu_handle_encoder
;;		_menu_handle_button
;;		_rtc_set_time
;;		_rtc_read_time
;; This function uses a non-reentrant model
;;
psect	text53,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
global __ptext53
__ptext53:
psect	text53
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
	
_sprintf:; BSR set to: 5

;incstack = 0
	callstack 27
	line	550
	
l12199:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l12409
	line	555
	
l12201:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u15631
	goto	u15630

u15631:
	goto	l12207
u15630:
	line	558
	
l12203:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15647
	movff	(c:sprintf@c),tablat
	tblwt*
	bra	u15640
u15647:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:sprintf@c),indf0
u15640:
	
	
l12205:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l12409
	line	563
	
l12207:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	565
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	goto	l12217
	line	578
	
l12209:
	bsf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	579
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	580
	goto	l12217
	line	585
	
l12211:
	bsf	(0+(1/8)+(c:sprintf@flag))^00h,c,(1)&7
	line	586
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	587
	goto	l12217
	line	597
	
l12213:
	bsf	(0+(2/8)+(c:sprintf@flag))^00h,c,(2)&7
	line	598
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	568
	
l12217:
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
	goto	l12209
	xorlw	43^32	; case 43
	skipnz
	goto	l12211
	xorlw	48^43	; case 48
	skipnz
	goto	l12213
	goto	l1816

	line	603
	
l1816:
	line	606
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u15651
	goto	u15650
u15651:
	goto	l12221
u15650:
	line	607
	
l12219:
	bcf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	614
	
l12221:
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
	goto	u15661
	goto	u15660
u15661:
	goto	l12281
u15660:
	line	615
	
l12223:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	617
	
l12225:
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
	
l12227:
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

	
l12229:
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	619
	
l12231:
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
	goto	u15671
	goto	u15670
u15671:
	goto	l12225
u15670:
	goto	l12281
	line	747
	
l12233:
	bsf	(0+(7/8)+(c:sprintf@flag))^00h,c,(7)&7
	line	749
	goto	l12283
	line	760
	
l12235:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l12237:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l12239:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u15681
	goto	u15680

u15681:
	goto	l12243
u15680:
	line	767
	
l12241:
		movlw	low(STR_366)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_366)
	movwf	((c:sprintf@cp+1))^00h,c

	line	771
	
l12243:
	movlw	high(0)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@len))^00h,c
	line	772
	goto	l12247
	line	773
	
l12245:
	infsnz	((c:sprintf@len))^00h,c
	incf	((c:sprintf@len+1))^00h,c
	line	772
	
l12247:
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
	bra	u15697
	tblrd	*
	
	movf	tablat,w
	bra	u15690
u15697:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15690:
	iorlw	0
	btfss	status,2
	goto	u15701
	goto	u15700
u15701:
	goto	l12245
u15700:
	line	783
	
l12249:
		movf	((c:sprintf@width))^00h,c,w
	subwf	((c:sprintf@len))^00h,c,w
	movf	((c:sprintf@width+1))^00h,c,w
	subwfb	((c:sprintf@len+1))^00h,c,w
	btfsc	status,0
	goto	u15711
	goto	u15710

u15711:
	goto	l12253
u15710:
	line	784
	
l12251:
	movf	((c:sprintf@len))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	subwfb	((c:sprintf@width+1))^00h,c

	goto	l12259
	line	786
	
l12253:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	goto	l12259
	line	791
	
l12255:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15727
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u15720
u15727:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u15720:
	
	
l12257:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	790
	
l12259:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
		incf	((c:sprintf@width))^00h,c,w
	bnz	u15731
	incf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u15731
	goto	u15730

u15731:
	goto	l12255
u15730:
	goto	l12267
	line	794
	
l12261:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15747
	tblrd	*
	
	movf	tablat,w
	bra	u15740
u15747:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15740:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movwf	(??_sprintf+0+0)^00h,c
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15757
	movff	??_sprintf+0+0,tablat
	tblwt*
	bra	u15750
u15757:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	??_sprintf+0+0,indf0
u15750:
	
	
l12263:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l12265:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	793
	
l12267:
	decf	((c:sprintf@len))^00h,c
	btfss	status,0
	decf	((c:sprintf@len+1))^00h,c
		incf	((c:sprintf@len))^00h,c,w
	bnz	u15761
	incf	((c:sprintf@len+1))^00h,c,w
	btfss	status,2
	goto	u15761
	goto	u15760

u15761:
	goto	l12261
u15760:
	goto	l12409
	line	825
	
l12269:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:sprintf@c))^00h,c
	
l12271:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	831
	
l12273:
		movlw	low(sprintf@c)
	movwf	((c:sprintf@cp))^00h,c
	clrf	((c:sprintf@cp+1))^00h,c

	line	832
	
l12275:
	movlw	high(01h)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(01h)
	movwf	((c:sprintf@len))^00h,c
	line	833
	goto	l12249
	line	844
	
l12277:
	movlw	(0C0h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	845
	goto	l12283
	line	661
	
l12281:
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
	goto	l12411
	xorlw	88^0	; case 88
	skipnz
	goto	l12233
	xorlw	99^88	; case 99
	skipnz
	goto	l12269
	xorlw	100^99	; case 100
	skipnz
	goto	l12283
	xorlw	105^100	; case 105
	skipnz
	goto	l12283
	xorlw	115^105	; case 115
	skipnz
	goto	l12235
	xorlw	117^115	; case 117
	skipnz
	goto	l12277
	xorlw	120^117	; case 120
	skipnz
	goto	l12233
	goto	l12273

	line	1277
	
l12283:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	0C0h
	andwf	(??_sprintf+0+0)^00h,c
	btfss	status,2
	goto	u15771
	goto	u15770
u15771:
	goto	l12295
u15770:
	line	1285
	
l12285:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l12287:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l12289:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u15780
	goto	u15781

u15781:
	goto	l12329
u15780:
	line	1288
	
l12291:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l12293:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	goto	l12329
	line	1312
	
l12295:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l12297:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	goto	l12329
	line	1331
	
l12299:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l12301:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u15791
	goto	u15790

u15791:
	goto	l12305
u15790:
	goto	l12331
	line	1332
	
l12305:
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
	goto	u15801
	goto	u15800

u15801:
	goto	l12309
u15800:
	goto	l12331
	line	1331
	
l12309:
	incf	((c:sprintf@c))^00h,c
	goto	l12301
	line	1342
	
l12313:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l12315:
		movlw	4
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u15811
	goto	u15810

u15811:
	goto	l12319
u15810:
	goto	l12331
	line	1343
	
l12319:
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
	goto	u15821
	goto	u15820

u15821:
	goto	l12323
u15820:
	goto	l12331
	line	1342
	
l12323:
	incf	((c:sprintf@c))^00h,c
	goto	l12315
	line	1320
	
l12329:
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
	goto	l12299
	xorlw	128^0	; case 128
	skipnz
	goto	l12313
	xorlw	192^128	; case 192
	skipnz
	goto	l12299
	goto	l12331

	line	1371
	
l12331:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u15831
	goto	u15830

u15831:
	goto	l12337
u15830:
	
l12333:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u15841
	goto	u15840
u15841:
	goto	l12337
u15840:
	line	1372
	
l12335:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	line	1407
	
l12337:
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
	goto	u15851
	goto	u15850

u15851:
	goto	l12341
u15850:
	line	1408
	
l12339:
	movf	((c:sprintf@c))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movlw	0
	subwfb	((c:sprintf@width+1))^00h,c
	goto	l12343
	line	1410
	
l12341:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	1413
	
l12343:
	
	btfss	((c:sprintf@flag))^00h,c,(2)&7
	goto	u15861
	goto	u15860
u15861:
	goto	l12369
u15860:
	line	1415
	
l12345:
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u15871
	goto	u15870
u15871:
	goto	l1864
u15870:
	line	1416
	
l12347:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u15881
	goto	u15880
u15881:
	goto	l12351
u15880:
	
l12349:
	movlw	high(02Bh)
	movwf	((c:_sprintf$2527+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$2527))^00h,c
	goto	l12353
	
l12351:
	movlw	high(02Dh)
	movwf	((c:_sprintf$2527+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$2527))^00h,c
	
l12353:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15897
	movff	(c:_sprintf$2527),tablat
	tblwt*
	bra	u15890
u15897:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:_sprintf$2527),indf0
u15890:
	
	
l12355:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l12361
	line	1422
	
l1864:
	line	1425
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u15901
	goto	u15900
u15901:
	goto	l12361
u15900:
	line	1426
	
l12357:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15917
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u15910
u15917:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u15910:
	
	goto	l12355
	line	1441
	
l12361:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u15921
	goto	u15920

u15921:
	goto	l12391
u15920:
	line	1443
	
l12363:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15937
	movlw	030h
	movwf	tablat
	tblwt*
	bra	u15930
u15937:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	030h
	movwf	indf0
u15930:
	
	
l12365:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1444
	
l12367:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u15941
	goto	u15940

u15941:
	goto	l12363
u15940:
	goto	l12391
	line	1454
	
l12369:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u15951
	goto	u15950

u15951:
	goto	l1875
u15950:
	line	1456
	
l12371:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15967
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u15960
u15967:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u15960:
	
	
l12373:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1457
	
l12375:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u15971
	goto	u15970

u15971:
	goto	l12371
u15970:
	
l1875:
	line	1460
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u15981
	goto	u15980
u15981:
	goto	l1878
u15980:
	line	1461
	
l12377:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u15991
	goto	u15990
u15991:
	goto	l12381
u15990:
	
l12379:
	movlw	high(02Bh)
	movwf	((c:_sprintf$2528+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$2528))^00h,c
	goto	l12383
	
l12381:
	movlw	high(02Dh)
	movwf	((c:_sprintf$2528+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$2528))^00h,c
	
l12383:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16007
	movff	(c:_sprintf$2528),tablat
	tblwt*
	bra	u16000
u16007:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:_sprintf$2528),indf0
u16000:
	
	
l12385:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l12391
	line	1469
	
l1878:
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u16011
	goto	u16010
u16011:
	goto	l12391
u16010:
	line	1470
	
l12387:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16027
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u16020
u16027:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u16020:
	
	goto	l12385
	line	1498
	
l12391:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l12407
	line	1515
	
l12393:
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
	goto	l12403
	line	1526
	
l12395:
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
	
l12397:
	movlw	low((STR_367))
	addwf	((c:sprintf@idx))^00h,c,w
	movwf	tblptrl
	clrf	tblptrh
	movlw	high((STR_367))
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
	goto	l12403
	line	1502
	
l12401:
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
	goto	l12393
	xorlw	128^0	; case 128
	skipnz
	goto	l12395
	xorlw	192^128	; case 192
	skipnz
	goto	l12393
	goto	l12403

	line	1550
	
l12403:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16037
	movff	(c:sprintf@c),tablat
	tblwt*
	bra	u16030
u16037:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:sprintf@c),indf0
u16030:
	
	
l12405:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l12407:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u16041
	goto	u16040

u16041:
	goto	l12401
u16040:
	line	553
	
l12409:
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
	goto	u16051
	goto	u16050
u16051:
	goto	l12201
u16050:
	line	1564
	
l12411:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16067
	movlw	0
	movwf	tablat
	tblwt*
	bra	u16060
u16067:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	0
	movwf	indf0
u16060:
	
	line	1567
	
l1894:
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
psect	text54,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
global __ptext54
__ptext54:
psect	text54
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
	
_isdigit:
;incstack = 0
	callstack 27
	movwf	((c:isdigit@c))^00h,c
	line	14
	
l12137:
	movlw	low(0)
	movwf	((c:_isdigit$2970))^00h,c
	
l12139:
		movlw	03Ah-0
	cpfslt	((c:isdigit@c))^00h,c
	goto	u15551
	goto	u15550

u15551:
	goto	l12145
u15550:
	
l12141:
		movlw	030h-1
	cpfsgt	((c:isdigit@c))^00h,c
	goto	u15561
	goto	u15560

u15561:
	goto	l12145
u15560:
	
l12143:
	movlw	low(01h)
	movwf	((c:_isdigit$2970))^00h,c
	
l12145:
	movff	(c:_isdigit$2970),??_isdigit+0+0
	rrcf	(??_isdigit+0+0)^00h,c,w
	line	15
	
l2561:
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
psect	text55,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
global __ptext55
__ptext55:
psect	text55
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
	
___wmul:
;incstack = 0
	callstack 27
	line	37
	
l12149:
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
	
l12151:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	line	53
	
l1897:
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
;;		_rebuild_utility_menu
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text56,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext56
__ptext56:
psect	text56
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
___lwmod:
;incstack = 0
	callstack 27
	line	12
	
l12177:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u15601
	goto	u15600

u15601:
	goto	l2386
u15600:
	line	13
	
l12179:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l12183
	line	15
	
l12181:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l12183:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u15611
	goto	u15610
u15611:
	goto	l12181
u15610:
	line	19
	
l12185:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u15621
	goto	u15620

u15621:
	goto	l12189
u15620:
	line	20
	
l12187:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l12189:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l12191:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l12185
	line	23
	
l2386:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l2393:
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
;;		_rebuild_utility_menu
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text57,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
global __ptext57
__ptext57:
psect	text57
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
	
___lwdiv:
;incstack = 0
	callstack 27
	line	13
	
l12155:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l12157:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u15571
	goto	u15570

u15571:
	goto	l2376
u15570:
	line	15
	
l12159:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l12163
	line	17
	
l12161:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l12163:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u15581
	goto	u15580
u15581:
	goto	l12161
u15580:
	line	21
	
l12165:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l12167:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u15591
	goto	u15590

u15591:
	goto	l12173
u15590:
	line	23
	
l12169:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l12171:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l12173:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l12175:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l12165
	line	28
	
l2376:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l2383:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
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
;;		On entry : 0/7
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
psect	text58,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
global __ptext58
__ptext58:
psect	text58
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
	
___lbmod:
;incstack = 0
	callstack 27
	movwf	((c:___lbmod@dividend))^00h,c
	line	9
	
l12547:
	movlw	low(08h)
	movwf	((c:___lbmod@counter))^00h,c
	line	10
	movlw	low(0)
	movwf	((c:___lbmod@rem))^00h,c
	line	12
	
l12549:
	bcf	status,0
	rlcf	((c:___lbmod@dividend))^00h,c,w
	rlcf	((c:___lbmod@rem))^00h,c,w
	movwf	((c:___lbmod@rem))^00h,c
	line	13
	
l12551:
	bcf status,0
	rlcf	((c:___lbmod@dividend))^00h,c

	line	14
	
l12553:
		movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c,w
	btfss	status,0
	goto	u16321
	goto	u16320

u16321:
	goto	l12557
u16320:
	line	15
	
l12555:
	movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c
	line	16
	
l12557:
	decfsz	((c:___lbmod@counter))^00h,c
	
	goto	l12549
	line	17
	
l12559:
	movf	((c:___lbmod@rem))^00h,c,w
	line	18
	
l2297:
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
;;		On entry : 0/7
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
psect	text59,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
global __ptext59
__ptext59:
psect	text59
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
	
___lbdiv:
;incstack = 0
	callstack 27
	movwf	((c:___lbdiv@dividend))^00h,c
	line	9
	
l12521:
	movlw	low(0)
	movwf	((c:___lbdiv@quotient))^00h,c
	line	10
	
l12523:
	movf	((c:___lbdiv@divisor))^00h,c,w
	btfsc	status,2
	goto	u16291
	goto	u16290
u16291:
	goto	l12543
u16290:
	line	11
	
l12525:
	movlw	low(01h)
	movwf	((c:___lbdiv@counter))^00h,c
	line	12
	goto	l12531
	line	13
	
l12527:
	bcf status,0
	rlcf	((c:___lbdiv@divisor))^00h,c

	line	14
	
l12529:
	incf	((c:___lbdiv@counter))^00h,c
	line	12
	
l12531:
	
	btfss	((c:___lbdiv@divisor))^00h,c,(7)&7
	goto	u16301
	goto	u16300
u16301:
	goto	l12527
u16300:
	line	17
	
l12533:
	bcf status,0
	rlcf	((c:___lbdiv@quotient))^00h,c

	line	18
		movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c,w
	btfss	status,0
	goto	u16311
	goto	u16310

u16311:
	goto	l12539
u16310:
	line	19
	
l12535:
	movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c
	line	20
	
l12537:
	bsf	(0+(0/8)+(c:___lbdiv@quotient))^00h,c,(0)&7
	line	22
	
l12539:
	bcf status,0
	rrcf	((c:___lbdiv@divisor))^00h,c

	line	23
	
l12541:
	decfsz	((c:___lbdiv@counter))^00h,c
	
	goto	l12533
	line	25
	
l12543:
	movf	((c:___lbdiv@quotient))^00h,c,w
	line	26
	
l2291:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
	signat	___lbdiv,8313
	global	_handle_datetime_rotation

;; *************** function _handle_datetime_rotation *****************
;; Defined at:
;;		line 710 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  direction       1    wreg     char 
;; Auto vars:     Size  Location     Type
;;  direction       1   14[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3F/5
;;		On exit  : 3F/5
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text60,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	710
global __ptext60
__ptext60:
psect	text60
	file	"src\menu.c"
	line	710
	
_handle_datetime_rotation:
;incstack = 0
	callstack 28
	movwf	((c:handle_datetime_rotation@direction))^00h,c
	line	712
	
l14845:
	movlb	5	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u19591
	goto	u19590
u19591:
	goto	l14895
u19590:
	line	714
	
l14847:; BSR set to: 5

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u19601
	goto	u19600
u19601:
	goto	l14863
u19600:
	line	716
	
l14849:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u19611
	goto	u19610

u19611:
	goto	l14857
u19610:
	line	718
	
l14851:; BSR set to: 5

	incf	(0+(_menu+016h))&0ffh
	line	719
	
l14853:; BSR set to: 5

		movlw	020h-1
	cpfsgt	(0+(_menu+016h))&0ffh
	goto	u19621
	goto	u19620

u19621:
	goto	l682
u19620:
	line	720
	
l14855:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+016h))&0ffh
	goto	l717
	line	724
	
l14857:; BSR set to: 5

		movlw	02h-0
	cpfslt	(0+(_menu+016h))&0ffh
	goto	u19631
	goto	u19630

u19631:
	goto	l14861
u19630:
	line	725
	
l14859:; BSR set to: 5

	movlw	low(01Fh)
	movwf	(0+(_menu+016h))&0ffh
	goto	l717
	line	727
	
l14861:; BSR set to: 5

	decf	(0+(_menu+016h))&0ffh
	goto	l717
	line	730
	
l14863:; BSR set to: 5

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u19641
	goto	u19640

u19641:
	goto	l14879
u19640:
	line	732
	
l14865:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u19651
	goto	u19650

u19651:
	goto	l14873
u19650:
	line	734
	
l14867:; BSR set to: 5

	incf	(0+(_menu+017h))&0ffh
	line	735
	
l14869:; BSR set to: 5

		movlw	0Dh-1
	cpfsgt	(0+(_menu+017h))&0ffh
	goto	u19661
	goto	u19660

u19661:
	goto	l717
u19660:
	line	736
	
l14871:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+017h))&0ffh
	goto	l717
	line	740
	
l14873:; BSR set to: 5

		movlw	02h-0
	cpfslt	(0+(_menu+017h))&0ffh
	goto	u19671
	goto	u19670

u19671:
	goto	l14877
u19670:
	line	741
	
l14875:; BSR set to: 5

	movlw	low(0Ch)
	movwf	(0+(_menu+017h))&0ffh
	goto	l717
	line	743
	
l14877:; BSR set to: 5

	decf	(0+(_menu+017h))&0ffh
	goto	l717
	line	746
	
l14879:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u19681
	goto	u19680

u19681:
	goto	l682
u19680:
	line	748
	
l14881:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u19691
	goto	u19690

u19691:
	goto	l14889
u19690:
	line	750
	
l14883:; BSR set to: 5

	incf	(0+(_menu+018h))&0ffh
	line	751
	
l14885:; BSR set to: 5

		movlw	064h-1
	cpfsgt	(0+(_menu+018h))&0ffh
	goto	u19701
	goto	u19700

u19701:
	goto	l682
u19700:
	line	752
	
l14887:; BSR set to: 5

	movlw	low(019h)
	movwf	(0+(_menu+018h))&0ffh
	goto	l717
	line	756
	
l14889:; BSR set to: 5

		movlw	01Ah-0
	cpfslt	(0+(_menu+018h))&0ffh
	goto	u19711
	goto	u19710

u19711:
	goto	l14893
u19710:
	line	757
	
l14891:; BSR set to: 5

	movlw	low(063h)
	movwf	(0+(_menu+018h))&0ffh
	goto	l717
	line	759
	
l14893:; BSR set to: 5

	decf	(0+(_menu+018h))&0ffh
	goto	l717
	line	762
	
l682:; BSR set to: 5

	goto	l717
	line	765
	
l14895:; BSR set to: 5

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u19721
	goto	u19720
u19721:
	goto	l14911
u19720:
	line	767
	
l14897:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u19731
	goto	u19730

u19731:
	goto	l14905
u19730:
	line	769
	
l14899:; BSR set to: 5

	incf	(0+(_menu+019h))&0ffh
	line	770
	
l14901:; BSR set to: 5

		movlw	018h-1
	cpfsgt	(0+(_menu+019h))&0ffh
	goto	u19741
	goto	u19740

u19741:
	goto	l717
u19740:
	line	771
	
l14903:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+019h))&0ffh
	goto	l717
	line	775
	
l14905:; BSR set to: 5

	movf	(0+(_menu+019h))&0ffh,w
	btfss	status,2
	goto	u19751
	goto	u19750
u19751:
	goto	l14909
u19750:
	line	776
	
l14907:; BSR set to: 5

	movlw	low(017h)
	movwf	(0+(_menu+019h))&0ffh
	goto	l717
	line	778
	
l14909:; BSR set to: 5

	decf	(0+(_menu+019h))&0ffh
	goto	l717
	line	781
	
l14911:; BSR set to: 5

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u19761
	goto	u19760

u19761:
	goto	l14927
u19760:
	line	783
	
l14913:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u19771
	goto	u19770

u19771:
	goto	l14921
u19770:
	line	785
	
l14915:; BSR set to: 5

	incf	(0+(_menu+01Ah))&0ffh
	line	786
	
l14917:; BSR set to: 5

		movlw	03Ch-1
	cpfsgt	(0+(_menu+01Ah))&0ffh
	goto	u19781
	goto	u19780

u19781:
	goto	l717
u19780:
	line	787
	
l14919:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Ah))&0ffh
	goto	l717
	line	791
	
l14921:; BSR set to: 5

	movf	(0+(_menu+01Ah))&0ffh,w
	btfss	status,2
	goto	u19791
	goto	u19790
u19791:
	goto	l14925
u19790:
	line	792
	
l14923:; BSR set to: 5

	movlw	low(03Bh)
	movwf	(0+(_menu+01Ah))&0ffh
	goto	l717
	line	794
	
l14925:; BSR set to: 5

	decf	(0+(_menu+01Ah))&0ffh
	goto	l717
	line	797
	
l14927:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u19801
	goto	u19800

u19801:
	goto	l717
u19800:
	line	799
	
l14929:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u19811
	goto	u19810

u19811:
	goto	l14937
u19810:
	line	801
	
l14931:; BSR set to: 5

	incf	(0+(_menu+01Bh))&0ffh
	line	802
	
l14933:; BSR set to: 5

		movlw	03Ch-1
	cpfsgt	(0+(_menu+01Bh))&0ffh
	goto	u19821
	goto	u19820

u19821:
	goto	l717
u19820:
	line	803
	
l14935:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Bh))&0ffh
	goto	l717
	line	807
	
l14937:; BSR set to: 5

	movf	(0+(_menu+01Bh))&0ffh,w
	btfss	status,2
	goto	u19831
	goto	u19830
u19831:
	goto	l14941
u19830:
	line	808
	
l14939:; BSR set to: 5

	movlw	low(03Bh)
	movwf	(0+(_menu+01Bh))&0ffh
	goto	l717
	line	810
	
l14941:; BSR set to: 5

	decf	(0+(_menu+01Bh))&0ffh
	line	814
	
l717:; BSR set to: 5

	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_datetime_rotation
	__end_of_handle_datetime_rotation:
	signat	_handle_datetime_rotation,4217
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
;;		On exit  : 3F/7
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
psect	text61,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	260
global __ptext61
__ptext61:
psect	text61
	file	"src\eeprom.c"
	line	260
	
_get_menu_timeout_seconds:; BSR set to: 5

;incstack = 0
	callstack 28
	line	263
	
l14555:; BSR set to: 5

		movlw	05h-0
	movlb	7	; () banked
	cpfslt	(0+(_system_config+01h))&0ffh
	goto	u19411
	goto	u19410

u19411:
	goto	l14561
u19410:
	line	265
	
l14557:; BSR set to: 7

	movlw	(01Eh)&0ffh
	goto	l1580
	line	267
	
l14561:; BSR set to: 7

		movlw	079h-1
	cpfsgt	(0+(_system_config+01h))&0ffh
	goto	u19421
	goto	u19420

u19421:
	goto	l14567
u19420:
	goto	l14557
	line	271
	
l14567:; BSR set to: 7

	movf	(0+(_system_config+01h))&0ffh,w
	line	272
	
l1580:; BSR set to: 7

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
;;		On entry : 0/4
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
psect	text62,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	205
global __ptext62
__ptext62:
psect	text62
	file	"src\encoder.c"
	line	205
	
_encoder_init:; BSR set to: 7

;incstack = 0
	callstack 28
	line	208
	
l14691:
	movlw	low(0C4h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	209
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	212
	movlw	high(0)
	movlb	5	; () banked
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
	
l14693:; BSR set to: 5

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	220
	
l14695:; BSR set to: 5

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	221
	
l14697:; BSR set to: 5

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	224
	
l14699:; BSR set to: 5

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u19531
	goto	u19530
u19531:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u19538
u19530:
	clrf	(??_encoder_init+0+0)^00h,c
u19538:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u19541
	goto	u19540
u19541:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u19548
u19540:
	clrf	(??_encoder_init+1+0)^00h,c
u19548:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:_enc_state))^00h,c
	line	225
	
l353:
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
psect	text63,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	180
global __ptext63
__ptext63:
psect	text63
	file	"src\eeprom.c"
	line	180
	
_eeprom_init:
;incstack = 0
	callstack 25
	line	182
	
l14521:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	185
	
l14523:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	189
	
l14529:
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
	
l14531:
	incf	((c:eeprom_init@i))^00h,c
	
l14533:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u19371
	goto	u19370

u19371:
	goto	l14529
u19370:
	line	191
	
l14535:
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
	
l14537:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	195
	
l14539:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u19380
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u19381
	goto	u19380

u19381:
	goto	l14545
u19380:
	line	198
	
l14541:
	call	_load_factory_defaults	;wreg free
	line	199
	
l14543:
	call	_save_current_config	;wreg free
	line	203
	
l14545:
	call	_sync_menu_variables	;wreg free
	line	207
	
l14547:
	movlb	7	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	mullw	02h
	movff	prodl,(_menu_timeout_seconds)
	movff	prodh,(_menu_timeout_seconds+1)
	line	210
	
l14549:; BSR set to: 7

	movlb	5	; () banked
		movf	((_menu_timeout_seconds+1))&0ffh,w
	bnz	u19390
	movlw	10
	subwf	 ((_menu_timeout_seconds))&0ffh,w
	btfss	status,0
	goto	u19391
	goto	u19390

u19391:
	goto	l14553
u19390:
	
l14551:; BSR set to: 5

		incf	((_menu_timeout_seconds))&0ffh,w
	movlw	1
	subwfb	((_menu_timeout_seconds+1))&0ffh,w
	btfss	status,0
	goto	u19401
	goto	u19400

u19401:
	goto	l1558
u19400:
	line	212
	
l14553:; BSR set to: 5

	movlw	high(01Eh)
	movwf	((_menu_timeout_seconds+1))&0ffh
	movlw	low(01Eh)
	movwf	((_menu_timeout_seconds))&0ffh
	line	214
	
l1558:; BSR set to: 5

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
psect	text64,class=CODE,space=0,reloc=2,group=0
	line	247
global __ptext64
__ptext64:
psect	text64
	file	"src\eeprom.c"
	line	247
	
_sync_menu_variables:; BSR set to: 5

;incstack = 0
	callstack 27
	line	256
	
l14441:
	movff	_input_config,(c:_enable_edit_flag)
	line	257
	movff	0+(_input_config+01h),(c:_sensor_edit_flag)
	line	258
	
l1576:
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
;;		On entry : 0/5
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
psect	text65,class=CODE,space=0,reloc=2,group=0
	line	216
global __ptext65
__ptext65:
psect	text65
	file	"src\eeprom.c"
	line	216
	
_save_current_config:
;incstack = 0
	callstack 26
	line	219
	
l13883:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	223
	
l13889:
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
	
l13891:
	incf	((c:save_current_config@i))^00h,c
	
l13893:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u18791
	goto	u18790

u18791:
	goto	l13889
u18790:
	line	227
	
l13895:
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
	
l13897:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	231
	
l13899:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	232
	
l1563:
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
;;		On entry : 0/5
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
psect	text66,class=CODE,space=0,reloc=2,group=0
	line	155
global __ptext66
__ptext66:
psect	text66
	file	"src\eeprom.c"
	line	155
	
_eeprom_write_word:
;incstack = 0
	callstack 26
	line	157
	
l13241:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	158
	
l13243:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	159
	
l1537:
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
;;		On entry : 0/5
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
psect	text67,class=CODE,space=0,reloc=2,group=0
	line	161
global __ptext67
__ptext67:
psect	text67
	file	"src\eeprom.c"
	line	161
	
_eeprom_write_block:
;incstack = 0
	callstack 26
	line	163
	
l13245:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	164
	
l13247:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l13253
	line	166
	
l13249:
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
	
l13251:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l13253:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u17641
	goto	u17640

u17641:
	goto	l13249
u17640:
	line	168
	
l1543:
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
;;		On entry : 0/5
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
psect	text68,class=CODE,space=0,reloc=2,group=0
	line	128
global __ptext68
__ptext68:
psect	text68
	file	"src\eeprom.c"
	line	128
	
_eeprom_write_byte:
;incstack = 0
	callstack 26
	line	130
	
l12439:
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
	
l12441:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	139
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	140
	
l12443:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	143
	
l1528:
	line	142
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u16121
	goto	u16120
u16121:
	goto	l1528
u16120:
	
l1530:
	line	144
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	145
	
l1531:
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
psect	text69,class=CODE,space=0,reloc=2,group=0
	line	92
global __ptext69
__ptext69:
psect	text69
	file	"src\eeprom.c"
	line	92
	
_calculate_config_checksum:
;incstack = 0
	callstack 27
	line	94
	
l13197:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	98
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	100
	
l13203:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	101
	
l13205:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	103
	
l13211:
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
	
l13213:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l13215:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u17610
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u17611
	goto	u17610

u17611:
	goto	l13211
u17610:
	line	98
	
l13217:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l13219:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u17621
	goto	u17620

u17621:
	goto	l13203
u17620:
	line	108
	
l13221:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	109
	
l13223:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1947+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1947))^00h,c
	line	111
	
l13229:
	movf	((c:calculate_config_checksum@j_1947))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j_1947+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	109
	
l13231:
	infsnz	((c:calculate_config_checksum@j_1947))^00h,c
	incf	((c:calculate_config_checksum@j_1947+1))^00h,c
	
l13233:
		movf	((c:calculate_config_checksum@j_1947+1))^00h,c,w
	bnz	u17630
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1947))^00h,c,w
	btfss	status,0
	goto	u17631
	goto	u17630

u17631:
	goto	l13229
u17630:
	
l1521:
	line	114
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	115
	
l1522:
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
psect	text70,class=CODE,space=0,reloc=2,group=0
	line	241
global __ptext70
__ptext70:
psect	text70
	file	"src\eeprom.c"
	line	241
	
_load_factory_defaults:
;incstack = 0
	callstack 26
	line	243
	
l14439:
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
	
l1569:
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
psect	text71,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
global __ptext71
__ptext71:
psect	text71
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
	
_memcpy:
;incstack = 0
	callstack 26
	line	34
	
l13173:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l13183
	line	37
	
l13175:
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
	
l13177:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l13179:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l13181:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l13183:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u17561
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u17561
	goto	u17560

u17561:
	goto	l13175
u17560:
	line	41
	
l2567:
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
psect	text72,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	147
global __ptext72
__ptext72:
psect	text72
	file	"src\eeprom.c"
	line	147
	
_eeprom_read_word:
;incstack = 0
	callstack 26
	line	150
	
l14423:
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
	
l14425:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	153
	
l1534:
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
psect	text73,class=CODE,space=0,reloc=2,group=0
	line	170
global __ptext73
__ptext73:
psect	text73
	file	"src\eeprom.c"
	line	170
	
_eeprom_read_block:
;incstack = 0
	callstack 26
	line	172
	
l14429:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	173
	
l14431:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l14437
	line	175
	
l14433:
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
	
l14435:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l14437:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u19281
	goto	u19280

u19281:
	goto	l14433
u19280:
	line	177
	
l1549:
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
psect	text74,class=CODE,space=0,reloc=2,group=0
	line	118
global __ptext74
__ptext74:
psect	text74
	file	"src\eeprom.c"
	line	118
	
_eeprom_read_byte:
;incstack = 0
	callstack 26
	line	120
	
l13235:
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
	
l13237:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	126
	
l1525:
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
;;		On entry : 0/5
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
psect	text75,class=CODE,space=0,reloc=2,group=0
	file	"src\ad7994.c"
	line	60
global __ptext75
__ptext75:
psect	text75
	file	"src\ad7994.c"
	line	60
	
_ad7994_read_channel:
;incstack = 0
	callstack 26
	movwf	((c:ad7994_read_channel@channel))^00h,c
	line	70
	
l14773:
	goto	l14785
	line	73
	
l14775:
	movlw	low(018h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	74
	goto	l14787
	line	76
	
l14777:
	movlw	low(028h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	77
	goto	l14787
	line	79
	
l14779:
	movlw	low(048h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	80
	goto	l14787
	line	82
	
l14781:
	movlw	low(088h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	83
	goto	l14787
	line	84
	
l1792:
	line	86
	setf	((c:?_ad7994_read_channel))^00h,c
	setf	((c:?_ad7994_read_channel+1))^00h,c
	goto	l1793
	line	70
	
l14785:
	movf	((c:ad7994_read_channel@channel))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 1 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l14775
	xorlw	2^1	; case 2
	skipnz
	goto	l14777
	xorlw	3^2	; case 3
	skipnz
	goto	l14779
	xorlw	4^3	; case 4
	skipnz
	goto	l14781
	goto	l1792

	line	89
	
l14787:
	call	_i2c_start	;wreg free
	line	90
	
l14789:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	line	91
	
l14791:
	movlw	(02h)&0ffh
	
	call	_i2c_write
	line	92
	
l14793:
	movf	((c:ad7994_read_channel@config_byte))^00h,c,w
	
	call	_i2c_write
	line	93
	
l14795:
	call	_i2c_stop	;wreg free
	line	95
	
l14797:
	bsf	((c:3979))^0f00h,c,5	;volatile
	line	96
	
l14799:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	97
	
l14801:
	bcf	((c:3979))^0f00h,c,5	;volatile
	line	98
	
l14803:
	asmopt push
asmopt off
	movlw	5
u23057:
decfsz	wreg,f
	bra	u23057
	nop
asmopt pop

	line	100
	
l14805:
	call	_i2c_start	;wreg free
	line	101
	
l14807:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	line	102
	
l14809:
	movlw	(0)&0ffh
	
	call	_i2c_write
	line	103
	
l14811:
	call	_i2c_stop	;wreg free
	line	105
	
l14813:
	call	_i2c_start	;wreg free
	line	106
	
l14815:
	movlw	(045h)&0ffh
	
	call	_i2c_write
	line	107
	
l14817:
	movlw	(01h)&0ffh
	
	call	_i2c_read
	movwf	((c:ad7994_read_channel@msb))^00h,c
	line	108
	
l14819:
	movlw	(0)&0ffh
	
	call	_i2c_read
	movwf	((c:ad7994_read_channel@lsb))^00h,c
	line	109
	
l14821:
	call	_i2c_stop	;wreg free
	line	111
	movf	((c:ad7994_read_channel@msb))^00h,c,w
	movwf	(??_ad7994_read_channel+0+0)^00h,c
	movf	((c:ad7994_read_channel@lsb))^00h,c,w
	movwf	((c:ad7994_read_channel@result))^00h,c
	movff	??_ad7994_read_channel+0+0,((c:ad7994_read_channel@result+1))
	line	116
	
l14823:
	movlw	low(0FFFh)
	andwf	((c:ad7994_read_channel@result))^00h,c
	movlw	high(0FFFh)
	andwf	((c:ad7994_read_channel@result+1))^00h,c
	line	121
	
l14825:
	movff	(c:ad7994_read_channel@result),(c:?_ad7994_read_channel)
	movff	(c:ad7994_read_channel@result+1),(c:?_ad7994_read_channel+1)
	line	122
	
l1793:
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
;;		On entry : 0/5
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
;;		_rtc_read_register
;;		_rtc_read_time
;;		_ad7994_read_channel
;; This function uses a non-reentrant model
;;
psect	text76,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	142
global __ptext76
__ptext76:
psect	text76
	file	"src\i2c.c"
	line	142
	
_i2c_read:
;incstack = 0
	callstack 26
	movwf	((c:i2c_read@ack))^00h,c
	line	146
	
l12483:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16211
	goto	u16210
u16211:
	goto	l1688
u16210:
	line	147
	
l12485:
	movlw	(0FFh)&0ffh
	goto	l1689
	
l1688:
	line	149
	bsf	((c:4037))^0f00h,c,3	;volatile
	line	152
	
l12489:
	movlw	high(03E8h)
	movwf	((c:i2c_read@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_read@timeout))^00h,c
	line	153
	goto	l1690
	line	155
	
l12491:
	decf	((c:i2c_read@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_read@timeout+1))^00h,c
	movf	((c:i2c_read@timeout))^00h,c,w
iorwf	((c:i2c_read@timeout+1))^00h,c,w
	btfss	status,2
	goto	u16221
	goto	u16220

u16221:
	goto	l1690
u16220:
	goto	l12485
	line	157
	
l1690:
	line	153
	btfss	((c:4039))^0f00h,c,0	;volatile
	goto	u16231
	goto	u16230
u16231:
	goto	l12491
u16230:
	
l1693:
	line	159
	movff	(c:4041),(c:i2c_read@data)	;volatile
	line	161
	
l12497:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16241
	goto	u16240
u16241:
	goto	l12503
u16240:
	line	162
	
l12499:
	movf	((c:i2c_read@data))^00h,c,w
	goto	l1689
	line	165
	
l12503:
	movf	((c:i2c_read@ack))^00h,c,w
	btfsc	status,2
	goto	u16251
	goto	u16250
u16251:
	clrf	(??_i2c_read+0+0)^00h,c
	incf	(??_i2c_read+0+0)^00h,c
	goto	u16268
u16250:
	clrf	(??_i2c_read+0+0)^00h,c
u16268:
	swapf	(??_i2c_read+0+0)^00h,c
	rlncf	(??_i2c_read+0+0)^00h,c
	movf	((c:4037))^0f00h,c,w	;volatile
	xorwf	(??_i2c_read+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<5)
	xorwf	(??_i2c_read+0+0)^00h,c,w
	movwf	((c:4037))^0f00h,c	;volatile
	line	166
	
l12505:
	bsf	((c:4037))^0f00h,c,4	;volatile
	line	169
	
l12507:
	movlw	high(03E8h)
	movwf	((c:i2c_read@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_read@timeout))^00h,c
	line	170
	goto	l1695
	line	172
	
l12509:
	decf	((c:i2c_read@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_read@timeout+1))^00h,c
	movf	((c:i2c_read@timeout))^00h,c,w
iorwf	((c:i2c_read@timeout+1))^00h,c,w
	btfss	status,2
	goto	u16271
	goto	u16270

u16271:
	goto	l1695
u16270:
	goto	l12499
	line	174
	
l1695:
	line	170
	btfsc	((c:4037))^0f00h,c,4	;volatile
	goto	u16281
	goto	u16280
u16281:
	goto	l12509
u16280:
	goto	l12499
	line	177
	
l1689:
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
;;		On entry : 0/5
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
psect	text77,class=CODE,space=0,reloc=2,group=0
	file	"src\ad7994.c"
	line	14
global __ptext77
__ptext77:
psect	text77
	file	"src\ad7994.c"
	line	14
	
_ad7994_init:
;incstack = 0
	callstack 25
	line	16
	
l14627:
		movlw	low(STR_355)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_355)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	18
	
l14629:
	bcf	((c:3988))^0f00h,c,5	;volatile
	line	19
	
l14631:
	bcf	((c:3979))^0f00h,c,5	;volatile
	line	20
	
l14633:
	asmopt push
asmopt off
movlw	104
movwf	(??_ad7994_init+0+0)^00h,c
	movlw	228
u23067:
decfsz	wreg,f
	bra	u23067
	decfsz	(??_ad7994_init+0+0)^00h,c,f
	bra	u23067
	nop2
asmopt pop

	line	21
	
l14635:
		movlw	low(STR_356)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_356)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	23
	
l14637:
		movlw	low(STR_357)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_357)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	25
	
l14639:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19491
	goto	u19490
u19491:
	goto	l14647
u19490:
	line	27
	
l14641:
		movlw	low(STR_358)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_358)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	28
	
l14643:
	movlw	(01h)&0ffh
	goto	l1780
	line	31
	
l14647:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19501
	goto	u19500
u19501:
	goto	l14657
u19500:
	line	33
	
l14649:
		movlw	low(STR_359)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_359)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	34
	
l14651:
	call	_i2c_stop	;wreg free
	line	35
	
l14653:
	movlw	(02h)&0ffh
	goto	l1780
	line	37
	
l14657:
		movlw	low(STR_360)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_360)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	39
	
l14659:
	movlw	(02h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19511
	goto	u19510
u19511:
	goto	l14669
u19510:
	line	41
	
l14661:
		movlw	low(STR_361)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_361)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	42
	
l14663:
	call	_i2c_stop	;wreg free
	line	43
	
l14665:
	movlw	(03h)&0ffh
	goto	l1780
	line	45
	
l14669:
		movlw	low(STR_362)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_362)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	47
	
l14671:
	movlw	(08h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19521
	goto	u19520
u19521:
	goto	l14681
u19520:
	line	49
	
l14673:
		movlw	low(STR_363)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_363)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	50
	
l14675:
	call	_i2c_stop	;wreg free
	line	51
	
l14677:
	movlw	(04h)&0ffh
	goto	l1780
	line	53
	
l14681:
		movlw	low(STR_364)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_364)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	55
	
l14683:
	call	_i2c_stop	;wreg free
	line	56
	
l14685:
		movlw	low(STR_365)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_365)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	57
	
l14687:
	movlw	(0)&0ffh
	line	58
	
l1780:
	return	;funcret
	callstack 0
GLOBAL	__end_of_ad7994_init
	__end_of_ad7994_init:
	signat	_ad7994_init,89
	global	_uart_println

;; *************** function _uart_println *****************
;; Defined at:
;;		line 81 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   17[COMRAM] PTR const unsigned char 
;;		 -> STR_365(29), STR_364(38), STR_363(43), STR_362(38), 
;;		 -> STR_361(49), STR_360(31), STR_359(39), STR_358(31), 
;;		 -> STR_357(37), STR_356(28), STR_355(22), rtc_read_time@debug_buf(80), 
;;		 -> rtc_set_time@buf(80), STR_352(32), STR_351(28), STR_350(30), 
;;		 -> STR_349(28), STR_348(29), menu_handle_button@buf_1796(50), STR_346(20), 
;;		 -> STR_345(26), STR_344(25), STR_343(37), STR_342(37), 
;;		 -> menu_handle_button@buf_1788(50), STR_340(20), STR_335(25), menu_handle_button@buf_1779(50), 
;;		 -> menu_handle_button@buf_1769(50), STR_332(53), STR_321(27), menu_handle_button@buf_1743(50), 
;;		 -> STR_318(24), STR_317(27), STR_316(16), menu_handle_button@buf_1730(80), 
;;		 -> STR_314(36), menu_handle_button@buf_1711(80), menu_handle_button@buf_1709(50), menu_handle_button@buf_1707(50), 
;;		 -> menu_handle_button@buf(50), menu_handle_encoder@buf_1680(50), menu_handle_encoder@buf_1677(50), menu_handle_encoder@buf(50), 
;;		 -> rebuild_clock_menu@buf(50), handle_numeric_rotation@buf(50), STR_222(31), rebuild_input_menu@buf(50), 
;;		 -> STR_149(26), init_datetime_editor@buf(80), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), STR_139(29), init_time_editor@buf(60), STR_41(21), 
;;		 -> STR_40(20), STR_39(36), STR_36(33), STR_35(21), 
;;		 -> STR_34(20), STR_33(22), main@buf_714(30), main@buf_675(40), 
;;		 -> main@buf_672(60), main@buf_667(50), STR_26(16), main@time_buf(60), 
;;		 -> STR_24(19), STR_23(22), STR_22(22), STR_21(24), 
;;		 -> STR_20(19), STR_19(22), STR_16(23), STR_15(28), 
;;		 -> main@buf_633(30), STR_13(34), STR_12(38), main@buf_628(50), 
;;		 -> STR_10(42), STR_9(37), STR_8(16), STR_7(20), 
;;		 -> main@buf(50), STR_5(23), STR_4(29), STR_2(42), 
;;		 -> trigger_relay_pulse@buf(60), 
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
;;		_init_datetime_editor
;;		_rebuild_input_menu
;;		_handle_numeric_rotation
;;		_rebuild_clock_menu
;;		_menu_handle_encoder
;;		_menu_handle_button
;;		_rtc_set_time
;;		_rtc_read_time
;;		_ad7994_init
;; This function uses a non-reentrant model
;;
psect	text78,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	81
global __ptext78
__ptext78:
psect	text78
	file	"src\main.c"
	line	81
	
_uart_println:
;incstack = 0
	callstack 26
	line	83
	
l12193:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	84
	
l12195:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	85
	
l12197:
	movlw	(0Ah)&0ffh
	
	call	_uart_write
	line	86
	
l136:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_println
	__end_of_uart_println:
	signat	_uart_println,4217
	global	_uart_print

;; *************** function _uart_print *****************
;; Defined at:
;;		line 73 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   15[COMRAM] PTR const unsigned char 
;;		 -> STR_365(29), STR_364(38), STR_363(43), STR_362(38), 
;;		 -> STR_361(49), STR_360(31), STR_359(39), STR_358(31), 
;;		 -> STR_357(37), STR_356(28), STR_355(22), rtc_read_time@debug_buf(80), 
;;		 -> rtc_set_time@buf(80), STR_352(32), STR_351(28), STR_350(30), 
;;		 -> STR_349(28), STR_348(29), menu_handle_button@buf_1796(50), STR_346(20), 
;;		 -> STR_345(26), STR_344(25), STR_343(37), STR_342(37), 
;;		 -> menu_handle_button@buf_1788(50), STR_340(20), STR_335(25), menu_handle_button@buf_1779(50), 
;;		 -> menu_handle_button@buf_1769(50), STR_332(53), STR_321(27), menu_handle_button@buf_1743(50), 
;;		 -> STR_318(24), STR_317(27), STR_316(16), menu_handle_button@buf_1730(80), 
;;		 -> STR_314(36), menu_handle_button@buf_1711(80), menu_handle_button@buf_1709(50), menu_handle_button@buf_1707(50), 
;;		 -> menu_handle_button@buf(50), menu_handle_encoder@buf_1680(50), menu_handle_encoder@buf_1677(50), menu_handle_encoder@buf(50), 
;;		 -> rebuild_clock_menu@buf(50), handle_numeric_rotation@buf(50), STR_222(31), rebuild_input_menu@buf(50), 
;;		 -> STR_149(26), init_datetime_editor@buf(80), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), STR_139(29), init_time_editor@buf(60), STR_41(21), 
;;		 -> STR_40(20), STR_39(36), STR_36(33), STR_35(21), 
;;		 -> STR_34(20), STR_33(22), main@buf_714(30), main@buf_675(40), 
;;		 -> main@buf_672(60), main@buf_667(50), STR_26(16), main@time_buf(60), 
;;		 -> STR_24(19), STR_23(22), STR_22(22), STR_21(24), 
;;		 -> STR_20(19), STR_19(22), STR_16(23), STR_15(28), 
;;		 -> main@buf_633(30), STR_13(34), STR_12(38), main@buf_628(50), 
;;		 -> STR_10(42), STR_9(37), STR_8(16), STR_7(20), 
;;		 -> main@buf(50), STR_5(23), STR_4(29), STR_2(42), 
;;		 -> trigger_relay_pulse@buf(60), 
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
psect	text79,class=CODE,space=0,reloc=2,group=0
	line	73
global __ptext79
__ptext79:
psect	text79
	file	"src\main.c"
	line	73
	
_uart_print:
;incstack = 0
	callstack 26
	line	75
	
l12089:
	goto	l12095
	line	77
	
l12091:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15467
	tblrd	*
	
	movf	tablat,w
	bra	u15460
u15467:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15460:
	
	call	_uart_write
	
l12093:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	75
	
l12095:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15477
	tblrd	*
	
	movf	tablat,w
	bra	u15470
u15477:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15470:
	iorlw	0
	btfss	status,2
	goto	u15481
	goto	u15480
u15481:
	goto	l12091
u15480:
	line	79
	
l133:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_print
	__end_of_uart_print:
	signat	_uart_print,4217
	global	_uart_write

;; *************** function _uart_write *****************
;; Defined at:
;;		line 66 in file "src\main.c"
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
psect	text80,class=CODE,space=0,reloc=2,group=0
	line	66
global __ptext80
__ptext80:
psect	text80
	file	"src\main.c"
	line	66
	
_uart_write:
;incstack = 0
	callstack 27
	movwf	((c:uart_write@c))^00h,c
	line	68
	
l12025:
	line	69
	
l124:
	line	68
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u15431
	goto	u15430
u15431:
	goto	l124
u15430:
	line	70
	
l12027:
	movff	(c:uart_write@c),(c:4013)	;volatile
	line	71
	
l127:
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
;;		_rtc_write_register
;;		_rtc_read_register
;;		_rtc_set_time
;;		_rtc_read_time
;;		_ad7994_init
;;		_ad7994_read_channel
;; This function uses a non-reentrant model
;;
psect	text81,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	119
global __ptext81
__ptext81:
psect	text81
	file	"src\i2c.c"
	line	119
	
_i2c_write:
;incstack = 0
	callstack 27
	movwf	((c:i2c_write@data))^00h,c
	line	121
	
l12473:
	movff	(c:i2c_write@data),(c:4041)	;volatile
	line	125
	
l1681:
	line	124
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u16191
	goto	u16190
u16191:
	goto	l1681
u16190:
	
l1683:
	line	126
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	129
	btfss	((c:4037))^0f00h,c,6	;volatile
	goto	u16201
	goto	u16200
u16201:
	goto	l12479
u16200:
	line	131
	
l12475:
	movlw	(01h)&0ffh
	goto	l1685
	line	134
	
l12479:
	movlw	(0)&0ffh
	line	135
	
l1685:
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
;;		On entry : 0/5
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
;;		_rtc_read_register
;;		_rtc_set_time
;;		_rtc_read_time
;;		_ad7994_init
;;		_ad7994_read_channel
;; This function uses a non-reentrant model
;;
psect	text82,class=CODE,space=0,reloc=2,group=0
	line	99
global __ptext82
__ptext82:
psect	text82
	file	"src\i2c.c"
	line	99
	
_i2c_stop:
;incstack = 0
	callstack 26
	line	101
	
l12463:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16161
	goto	u16160
u16161:
	goto	l1673
u16160:
	goto	l1674
	line	102
	
l1673:
	line	104
	bsf	((c:4037))^0f00h,c,2	;volatile
	line	107
	
l12467:
	movlw	high(03E8h)
	movwf	((c:i2c_stop@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_stop@timeout))^00h,c
	line	108
	goto	l1675
	line	110
	
l12469:
	decf	((c:i2c_stop@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_stop@timeout+1))^00h,c
	movf	((c:i2c_stop@timeout))^00h,c,w
iorwf	((c:i2c_stop@timeout+1))^00h,c,w
	btfss	status,2
	goto	u16171
	goto	u16170

u16171:
	goto	l1675
u16170:
	goto	l1674
	line	112
	
l1675:
	line	108
	btfsc	((c:4037))^0f00h,c,2	;volatile
	goto	u16181
	goto	u16180
u16181:
	goto	l12469
u16180:
	line	113
	
l1674:
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
;;		On entry : 0/5
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
;;		_rtc_read_register
;;		_rtc_set_time
;;		_rtc_read_time
;;		_ad7994_init
;;		_ad7994_read_channel
;; This function uses a non-reentrant model
;;
psect	text83,class=CODE,space=0,reloc=2,group=0
	line	57
global __ptext83
__ptext83:
psect	text83
	file	"src\i2c.c"
	line	57
	
_i2c_start:
;incstack = 0
	callstack 26
	line	59
	
l12445:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16131
	goto	u16130
u16131:
	goto	l1657
u16130:
	line	60
	
l12447:
	movlw	(01h)&0ffh
	goto	l1658
	
l1657:
	line	62
	bsf	((c:4037))^0f00h,c,0	;volatile
	line	65
	
l12451:
	movlw	high(03E8h)
	movwf	((c:i2c_start@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_start@timeout))^00h,c
	line	66
	goto	l1659
	line	68
	
l12453:
	decf	((c:i2c_start@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_start@timeout+1))^00h,c
	movf	((c:i2c_start@timeout))^00h,c,w
iorwf	((c:i2c_start@timeout+1))^00h,c,w
	btfss	status,2
	goto	u16141
	goto	u16140

u16141:
	goto	l1659
u16140:
	goto	l12447
	line	70
	
l1659:
	line	66
	btfsc	((c:4037))^0f00h,c,0	;volatile
	goto	u16151
	goto	u16150
u16151:
	goto	l12453
u16150:
	line	72
	
l12459:
	movlw	(0)&0ffh
	line	73
	
l1658:
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
;;		_i2c_start
;;		_i2c_restart
;;		_i2c_stop
;;		_i2c_read
;; This function uses a non-reentrant model
;;
psect	text84,class=CODE,space=0,reloc=2,group=0
	line	40
global __ptext84
__ptext84:
psect	text84
	file	"src\i2c.c"
	line	40
	
_i2c_wait_idle:
;incstack = 0
	callstack 26
	line	42
	
l12121:
	movlw	high(03E8h)
	movwf	((c:i2c_wait_idle@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_wait_idle@timeout))^00h,c
	line	45
	goto	l12129
	line	47
	
l12123:
	decf	((c:i2c_wait_idle@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_wait_idle@timeout+1))^00h,c
	movf	((c:i2c_wait_idle@timeout))^00h,c,w
iorwf	((c:i2c_wait_idle@timeout+1))^00h,c,w
	btfss	status,2
	goto	u15521
	goto	u15520

u15521:
	goto	l12129
u15520:
	line	48
	
l12125:
	movlw	(01h)&0ffh
	goto	l1653
	line	45
	
l12129:
	movff	(c:4037),??_i2c_wait_idle+0+0	;volatile
	movlw	01Fh
	andwf	(??_i2c_wait_idle+0+0)^00h,c
	btfss	status,2
	goto	u15531
	goto	u15530
u15531:
	goto	l12123
u15530:
	
l12131:
	btfsc	((c:4039))^0f00h,c,2	;volatile
	goto	u15541
	goto	u15540
u15541:
	goto	l12123
u15540:
	line	50
	
l12133:
	movlw	(0)&0ffh
	line	51
	
l1653:
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
	
i2l11901:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u1507_41
	goto	i2u1507_40
i2u1507_41:
	goto	i2l350
i2u1507_40:
	line	49
	
i2l11903:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	50
	
i2l11905:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	52
	
i2l11907:
	incf	((c:_relay_ms_counter))^00h,c
	line	53
	
i2l11909:
		movlw	0Ah-1
	cpfsgt	((c:_relay_ms_counter))^00h,c
	goto	i2u1508_41
	goto	i2u1508_40

i2u1508_41:
	goto	i2l11931
i2u1508_40:
	line	55
	
i2l11911:
	movlw	low(0)
	movwf	((c:_relay_ms_counter))^00h,c
	line	57
	
i2l11913:
	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1509_41
	goto	i2u1509_40

i2u1509_41:
	goto	i2l11921
i2u1509_40:
	
i2l11915:; BSR set to: 0

	movf	((c:_relay_latch_mode))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1510_41
	goto	i2u1510_40
i2u1510_41:
	goto	i2l11921
i2u1510_40:
	
i2l11917:; BSR set to: 0

	movlb	5	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	i2u1511_41
	goto	i2u1511_40

i2u1511_41:
	goto	i2l11921
i2u1511_40:
	line	59
	
i2l11919:; BSR set to: 5

	decf	((_relay_counter))&0ffh	;volatile
	btfss	status,0
	decf	((_relay_counter+1))&0ffh	;volatile
	line	60
	goto	i2l11931
	line	61
	
i2l11921:
	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1512_41
	goto	i2u1512_40

i2u1512_41:
	goto	i2l11931
i2u1512_40:
	
i2l11923:; BSR set to: 0

	movf	((c:_relay_latch_mode))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1513_41
	goto	i2u1513_40
i2u1513_41:
	goto	i2l11931
i2u1513_40:
	
i2l11925:; BSR set to: 0

	movlb	5	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1514_41
	goto	i2u1514_40

i2u1514_41:
	goto	i2l11931
i2u1514_40:
	line	64
	
i2l11927:; BSR set to: 5

	bsf	((c:3979))^0f00h,c,1	;volatile
	line	65
	
i2l11929:; BSR set to: 5

	movlw	low(0)
	movlb	0	; () banked
	movwf	((_relay_state))&0ffh	;volatile
	line	71
	
i2l11931:
	incf	((c:_ms_counter))^00h,c	;volatile
	line	72
	
i2l11933:
		movlw	02h-1
	cpfsgt	((c:_ms_counter))^00h,c	;volatile
	goto	i2u1515_41
	goto	i2u1515_40

i2u1515_41:
	goto	i2l11949
i2u1515_40:
	line	74
	
i2l11935:
	movlw	low(0)
	movwf	((c:_ms_counter))^00h,c	;volatile
	line	75
	
i2l11937:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1516_41
	goto	i2u1516_40

i2u1516_41:
	goto	i2l11949
i2u1516_40:
	line	77
	
i2l11939:
	decf	((c:_menu_timeout_timer))^00h,c	;volatile
	btfss	status,0
	decf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	line	80
	
i2l11941:
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
	goto	i2u1517_41
	goto	i2u1517_40

i2u1517_41:
	goto	i2l11945
i2u1517_40:
	line	83
	
i2l11943:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_timeout_debug_flag))&0ffh	;volatile
	line	86
	
i2l11945:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1518_41
	goto	i2u1518_40

i2u1518_41:
	goto	i2l11949
i2u1518_40:
	line	88
	
i2l11947:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	94
	
i2l11949:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u1519_41
	goto	i2u1519_40
i2u1519_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u1519_48
i2u1519_40:
	clrf	(??_isr+0+0)^00h,c
i2u1519_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u1520_41
	goto	i2u1520_40
i2u1520_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u1520_48
i2u1520_40:
	clrf	(??_isr+1+0)^00h,c
i2u1520_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	95
	
i2l11951:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	98
	
i2l11953:
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
	
i2l11955:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u1521_41
	goto	i2u1521_40
i2u1521_41:
	goto	i2l11981
i2u1521_40:
	line	103
	
i2l11957:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u1522_41
	goto	i2u1522_40

i2u1522_41:
	goto	i2l11969
i2u1522_40:
	line	105
	
i2l11959:
	movlb	5	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	106
	
i2l11961:; BSR set to: 5

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	109
	
i2l11963:; BSR set to: 5

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1523_41
	goto	i2u1523_40

i2u1523_41:
	goto	i2l11981
i2u1523_40:
	line	111
	
i2l11965:; BSR set to: 5

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	112
	
i2l11967:; BSR set to: 5

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l11981
	line	115
	
i2l11969:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u1524_41
	goto	i2u1524_40

i2u1524_41:
	goto	i2l11981
i2u1524_40:
	line	117
	
i2l11971:
	movlb	5	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	line	118
	
i2l11973:; BSR set to: 5

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	121
	
i2l11975:; BSR set to: 5

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1525_41
	goto	i2u1525_40

i2u1525_41:
	goto	i2l335
i2u1525_40:
	goto	i2l11965
	line	127
	
i2l335:; BSR set to: 5

	line	129
	
i2l11981:
	movff	(c:isr@new_state),(c:_enc_state)
	line	132
	
i2l11983:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	133
	
i2l11985:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u1526_41
	goto	i2u1526_40

i2u1526_41:
	goto	i2l12013
i2u1526_40:
	line	135
	
i2l11987:
	incf	((c:_btn_debounce))^00h,c
	line	136
	
i2l11989:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u1527_41
	goto	i2u1527_40

i2u1527_41:
	goto	i2l350
i2u1527_40:
	line	138
	
i2l11991:
	movff	(c:isr@btn),(c:_last_btn)
	line	139
	
i2l11993:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	141
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1528_41
	goto	i2u1528_40
i2u1528_41:
	goto	i2l12003
i2u1528_40:
	line	144
	
i2l11995:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	145
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	148
	
i2l11997:; BSR set to: 5

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1529_41
	goto	i2u1529_40

i2u1529_41:
	goto	i2l347
i2u1529_40:
	line	150
	
i2l11999:; BSR set to: 5

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	151
	
i2l12001:; BSR set to: 5

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l350
	line	157
	
i2l12003:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1530_41
	goto	i2u1530_40

i2u1530_41:
	goto	i2l12007
i2u1530_40:
	line	159
	
i2l12005:
	movlw	low(02h)
	movlb	5	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	160
	goto	i2l344
	line	161
	
i2l12007:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u1531_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1531_41
	goto	i2u1531_40

i2u1531_41:
	goto	i2l12011
i2u1531_40:
	line	163
	
i2l12009:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	164
	goto	i2l344
	line	167
	
i2l12011:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	168
	
i2l344:; BSR set to: 5

	line	170
	movlw	low(01h)
	movwf	((_button_pressed))&0ffh	;volatile
	line	171
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	goto	i2l350
	line	177
	
i2l12013:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	179
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1532_41
	goto	i2u1532_40
i2u1532_41:
	goto	i2l350
i2u1532_40:
	
i2l12015:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1533_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1533_41
	goto	i2u1533_40

i2u1533_41:
	goto	i2l350
i2u1533_40:
	line	181
	
i2l12017:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	184
	
i2l12019:
		movlw	8
	xorwf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1534_41
	movlw	7
	xorwf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1534_41
	goto	i2u1534_40

i2u1534_41:
	goto	i2l347
i2u1534_40:
	line	186
	
i2l12021:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	goto	i2l350
	line	189
	
i2l347:
	line	203
	
i2l350:
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
psect	text86,class=CODE,space=0,reloc=2,group=0
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext86
__ptext86:
psect	text86
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
i2___lwmod:
;incstack = 0
	callstack 22
	line	12
	
i2l11513:
	movf	((c:i2___lwmod@divisor))^00h,c,w
iorwf	((c:i2___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	i2u1452_41
	goto	i2u1452_40

i2u1452_41:
	goto	i2l2386
i2u1452_40:
	line	13
	
i2l11515:
	movlw	low(01h)
	movwf	((c:i2___lwmod@counter))^00h,c
	line	14
	goto	i2l11519
	line	15
	
i2l11517:
	bcf	status,0
	rlcf	((c:i2___lwmod@divisor))^00h,c
	rlcf	((c:i2___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:i2___lwmod@counter))^00h,c
	line	14
	
i2l11519:
	
	btfss	((c:i2___lwmod@divisor+1))^00h,c,(15)&7
	goto	i2u1453_41
	goto	i2u1453_40
i2u1453_41:
	goto	i2l11517
i2u1453_40:
	line	19
	
i2l11521:
		movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c,w
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	i2u1454_41
	goto	i2u1454_40

i2u1454_41:
	goto	i2l11525
i2u1454_40:
	line	20
	
i2l11523:
	movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c

	line	21
	
i2l11525:
	bcf	status,0
	rrcf	((c:i2___lwmod@divisor+1))^00h,c
	rrcf	((c:i2___lwmod@divisor))^00h,c
	line	22
	
i2l11527:
	decfsz	((c:i2___lwmod@counter))^00h,c
	
	goto	i2l11521
	line	23
	
i2l2386:
	line	24
	movff	(c:i2___lwmod@dividend),(c:?i2___lwmod)
	movff	(c:i2___lwmod@dividend+1),(c:?i2___lwmod+1)
	line	25
	
i2l2393:
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
