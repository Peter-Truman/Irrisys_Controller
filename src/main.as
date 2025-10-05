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
	global	_value_relay_pulse
	global	_value_scale4
	global	_options_menu
	global	_value_sensor
	global	_value_end_runtime
	global	_value_clock_enable
	global	_value_flow_type
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
	global	menu_draw_setup@F2659
	global	_value_clock_display
	global	_value_high_tbp
	global	_value_low_flow_bp
	global	_value_no_flow_bp
	global	_value_low_flow
	global	_value_no_flow
	global	_value_flow_units
	global	_value_high_temp
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
psect	idataBANK2,class=CODE,space=0,delta=1,noexec
global __pidataBANK2
__pidataBANK2:
	file	"src\encoder.c"
	line	16

;initializer for _menu_timeout_flag
	db	low(01h)
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
psect	idataBANK3,class=CODE,space=0,delta=1,noexec
global __pidataBANK3
__pidataBANK3:
	line	65

;initializer for _options_menu
		db	low(STR_69)
	db	high(STR_69)

		db	low(STR_70)
	db	high(STR_70)

		db	low(STR_71)
	db	high(STR_71)

		db	low(STR_72)
	db	high(STR_72)

		db	low(STR_73)
	db	high(STR_73)

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
psect	idataBANK4,class=CODE,space=0,delta=1,noexec
global __pidataBANK4
__pidataBANK4:
	line	1230

;initializer for menu_draw_setup@F2659
		db	low(STR_202)
	db	high(STR_202)

		db	low(STR_203)
	db	high(STR_203)

		db	low(STR_204)
	db	high(STR_204)

		db	low(STR_205)
	db	high(STR_205)

		db	low(STR_206)
	db	high(STR_206)

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
		db	low(STR_34)
	db	high(STR_34)

		db	low(STR_35)
	db	high(STR_35)

		db	low(STR_36)
	db	high(STR_36)

		db	low(STR_37)
	db	high(STR_37)

		db	low(STR_38)
	db	high(STR_38)

	db	low(01h)
	db	low(03h)
		db	low(STR_39)
	db	high(STR_39)

		db	low(STR_40)
	db	high(STR_40)

		db	low(STR_41)
	db	high(STR_41)

		db	low(STR_42)
	db	high(STR_42)

		db	low(STR_43)
	db	high(STR_43)

	db	low(02h)
	db	low(02h)
		db	low(STR_44)
	db	high(STR_44)

		db	low(STR_45)
	db	high(STR_45)

		db	low(STR_46)
	db	high(STR_46)

		db	low(STR_47)
	db	high(STR_47)

		db	low(STR_48)
	db	high(STR_48)

	db	low(03h)
	db	low(02h)
		db	low(STR_49)
	db	high(STR_49)

		db	low(STR_50)
	db	high(STR_50)

		db	low(STR_51)
	db	high(STR_51)

		db	low(STR_52)
	db	high(STR_52)

		db	low(STR_53)
	db	high(STR_53)

	db	low(04h)
	db	low(02h)
		db	low(STR_54)
	db	high(STR_54)

		db	low(STR_55)
	db	high(STR_55)

		db	low(STR_56)
	db	high(STR_56)

		db	low(STR_57)
	db	high(STR_57)

		db	low(STR_58)
	db	high(STR_58)

	db	low(05h)
	db	low(02h)
		db	low(STR_59)
	db	high(STR_59)

		db	low(STR_60)
	db	high(STR_60)

		db	low(STR_61)
	db	high(STR_61)

		db	low(STR_62)
	db	high(STR_62)

		db	low(STR_63)
	db	high(STR_63)

	db	low(06h)
	db	low(03h)
		db	low(STR_64)
	db	high(STR_64)

		db	low(STR_65)
	db	high(STR_65)

		db	low(STR_66)
	db	high(STR_66)

		db	low(STR_67)
	db	high(STR_67)

		db	low(STR_68)
	db	high(STR_68)

	global __end_of_menu_item_options
__end_of_menu_item_options:
	global	_pressure_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	112
_pressure_menu_template:
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

	db	low(01h)
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
	global __end_of_pressure_menu_template
__end_of_pressure_menu_template:
	global	_flow_analog_template
psect	mediumconst
	file	"src\menu.c"
	line	155
_flow_analog_template:
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
	global __end_of_flow_analog_template
__end_of_flow_analog_template:
	global	_temp_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	130
_temp_menu_template:
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

	db	low(0)
	global __end_of_temp_menu_template
__end_of_temp_menu_template:
	global	_flow_digital_template
psect	mediumconst
	file	"src\menu.c"
	line	143
_flow_digital_template:
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
	global __end_of_flow_digital_template
__end_of_flow_digital_template:
	global	_clock_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	170
_clock_menu_template:
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

	db	low(0)
	global __end_of_clock_menu_template
__end_of_clock_menu_template:
	global	_enc_table
	global	_dpowers
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
	global	_relay_state
	global	_clock_menu
	global	_menu
	global	main@blink_timer
	global	main@last_relay_counter
	global	main@encoder_activity_timer
	global	_relay_counter
	global	_encoder_count
	global	main@last_menu_state
	global	main@last_relay_state
	global	_current_menu
	global	_save_pending
	global	_long_press_beep_flag
	global	_timeout_debug_flag
	global	_button_event
	global	_current_input
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
	
STR_126:
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
	
STR_180:
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
	
STR_227:
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
	
STR_123:
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
	
STR_248:
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
	
STR_262:
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
	
STR_234:
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
	
STR_237:
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
	
STR_121:
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
	
STR_218:
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
	
STR_239:
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
	
STR_17:
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
	
STR_28:
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
	
STR_247:
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
	
STR_263:
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
	
STR_236:
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
	
STR_181:
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
	
STR_122:
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
	
STR_182:
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
	
STR_228:
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
	
STR_243:
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
	
STR_238:
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
	
STR_7:
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
	
STR_127:
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
	
STR_251:
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
	
STR_240:
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
	
STR_244:
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
	
STR_22:
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
	
STR_242:
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
	
STR_124:
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
	
STR_264:
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
	
STR_13:
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
	
STR_235:
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
	
STR_8:
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
	
STR_18:
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
	
STR_25:
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
	
STR_11:
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
	
STR_14:
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
	
STR_15:
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
	
STR_131:
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
	
STR_201:
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
	
STR_191:
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
	
STR_27:
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
	
STR_269:
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
	
STR_241:
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
	
STR_26:
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
	
STR_12:
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
	
STR_16:
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
	
STR_19:
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
	
STR_10:
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
	
STR_21:
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
	
STR_80:
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
	
STR_71:
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
	
STR_9:
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
	
STR_112:
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
	
STR_78:
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
	
STR_23:
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
	
STR_77:
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
	
STR_101:
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
	
STR_70:
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
	
STR_76:
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
	
STR_139:
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
	
STR_118:
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
	
STR_92:
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
	
STR_69:
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
	
STR_79:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_93:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	84	;'T'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_194:
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_184:
	db	37
	db	99	;'c'
	db	37
	db	100	;'d'
	db	37
	db	100	;'d'
	db	37
	db	100	;'d'
	db	0
	
STR_34:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_66:
	db	78	;'N'
	db	111	;'o'
	db	116	;'t'
	db	32
	db	85	;'U'
	db	115	;'s'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_83:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	0
	
STR_111:
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_84:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_85:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_35:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_45:
	db	68	;'D'
	db	105	;'i'
	db	103	;'g'
	db	105	;'i'
	db	116	;'t'
	db	97	;'a'
	db	108	;'l'
	db	0
	
STR_117:
	db	69	;'E'
	db	110	;'n'
	db	100	;'d'
	db	32
	db	82	;'R'
	db	117	;'u'
	db	110	;'n'
	db	0
	
STR_102:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_100:
	db	78	;'N'
	db	111	;'o'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_86:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	0
	
STR_30:
	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_270:
	db	40
	db	110	;'n'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	41
	db	0
	
STR_74:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	0
	
STR_44:
	db	65	;'A'
	db	110	;'n'
	db	97	;'a'
	db	108	;'l'
	db	111	;'o'
	db	103	;'g'
	db	0
	
STR_75:
	db	83	;'S'
	db	101	;'e'
	db	110	;'n'
	db	115	;'s'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_229:
	db	67	;'C'
	db	76	;'L'
	db	79	;'O'
	db	67	;'C'
	db	75	;'K'
	db	0
	
STR_81:
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_82:
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_136:
	db	37
	db	43
	db	48	;'0'
	db	52	;'4'
	db	100	;'d'
	db	0
	
STR_64:
	db	76	;'L'
	db	97	;'a'
	db	116	;'t'
	db	99	;'c'
	db	104	;'h'
	db	0
	
STR_205:
	db	67	;'C'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_108:
	db	85	;'U'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	115	;'s'
	db	0
	
STR_72:
	db	65	;'A'
	db	98	;'b'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_24:
	db	82	;'R'
	db	101	;'e'
	db	97	;'a'
	db	100	;'d'
	db	121	;'y'
	db	0
	
STR_138:
	db	37
	db	48	;'0'
	db	51	;'3'
	db	100	;'d'
	db	0
	
STR_59:
	db	72	;'H'
	db	105	;'i'
	db	100	;'d'
	db	101	;'e'
	db	0
	
STR_99:
	db	84	;'T'
	db	121	;'y'
	db	112	;'p'
	db	101	;'e'
	db	0
	
STR_87:
	db	66	;'B'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_73:
	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	0
	
STR_60:
	db	83	;'S'
	db	104	;'h'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_55:
	db	76	;'L'
	db	112	;'p'
	db	83	;'S'
	db	0
	
STR_54:
	db	37
	db	0
	
STR_129:
	db	40
	db	0
	
STR_212:
	db	42
	db	0
	
STR_192:
	db	91	;'['
	db	0
	
STR_193:
	db	93	;']'
	db	0
STR_95	equ	STR_86+0
STR_103	equ	STR_86+0
STR_114	equ	STR_86+0
STR_119	equ	STR_86+0
STR_41	equ	STR_100+3
STR_164	equ	STR_100+3
STR_209	equ	STR_100+3
STR_152	equ	STR_60+0
STR_162	equ	STR_60+0
STR_167	equ	STR_60+0
STR_226	equ	STR_60+0
STR_268	equ	STR_60+0
STR_113	equ	STR_102+0
STR_49	equ	STR_102+4
STR_178	equ	STR_102+4
STR_125	equ	STR_236+29
STR_132	equ	STR_236+29
STR_219	equ	STR_236+29
STR_89	equ	STR_75+0
STR_98	equ	STR_75+0
STR_106	equ	STR_75+0
STR_40	equ	STR_92+5
STR_154	equ	STR_92+5
STR_208	equ	STR_92+5
STR_166	equ	STR_45+0
STR_96	equ	STR_87+0
STR_104	equ	STR_87+0
STR_115	equ	STR_87+0
STR_120	equ	STR_87+0
STR_206	equ	STR_87+0
STR_94	equ	STR_83+0
STR_50	equ	STR_83+4
STR_143	equ	STR_64+0
STR_146	equ	STR_64+0
STR_149	equ	STR_64+0
STR_159	equ	STR_64+0
STR_169	equ	STR_64+0
STR_222	equ	STR_64+0
STR_266	equ	STR_64+0
STR_165	equ	STR_44+0
STR_33	equ	STR_27+0
STR_65	equ	STR_118+4
STR_144	equ	STR_118+4
STR_147	equ	STR_118+4
STR_150	equ	STR_118+4
STR_160	equ	STR_118+4
STR_170	equ	STR_118+4
STR_223	equ	STR_118+4
STR_267	equ	STR_118+4
STR_39	equ	STR_78+3
STR_135	equ	STR_78+3
STR_207	equ	STR_78+3
STR_107	equ	STR_99+0
STR_88	equ	STR_74+0
STR_97	equ	STR_74+0
STR_105	equ	STR_74+0
STR_116	equ	STR_74+0
STR_153	equ	STR_59+0
STR_163	equ	STR_59+0
STR_168	equ	STR_59+0
STR_145	equ	STR_66+0
STR_148	equ	STR_66+0
STR_151	equ	STR_66+0
STR_161	equ	STR_66+0
STR_171	equ	STR_66+0
STR_224	equ	STR_66+0
STR_134	equ	STR_34+0
STR_221	equ	STR_34+0
STR_133	equ	STR_35+0
STR_220	equ	STR_35+0
STR_265	equ	STR_35+0
STR_137	equ	STR_136+0
STR_155	equ	STR_136+0
STR_156	equ	STR_136+0
STR_174	equ	STR_136+0
STR_175	equ	STR_136+0
STR_252	equ	STR_136+0
STR_253	equ	STR_136+0
STR_256	equ	STR_136+0
STR_257	equ	STR_136+0
STR_259	equ	STR_136+0
STR_260	equ	STR_136+0
STR_140	equ	STR_138+0
STR_176	equ	STR_138+0
STR_254	equ	STR_138+0
STR_255	equ	STR_138+0
STR_258	equ	STR_138+0
STR_261	equ	STR_138+0
STR_141	equ	STR_139+0
STR_142	equ	STR_139+0
STR_158	equ	STR_139+0
STR_177	equ	STR_139+0
STR_179	equ	STR_139+0
STR_225	equ	STR_139+0
STR_245	equ	STR_139+0
STR_246	equ	STR_139+0
STR_250	equ	STR_139+0
STR_183	equ	STR_184+2
STR_249	equ	STR_244+0
STR_157	equ	STR_18+20
STR_199	equ	STR_193+0
STR_211	equ	STR_193+0
STR_215	equ	STR_193+0
STR_232	equ	STR_193+0
STR_197	equ	STR_192+0
STR_210	equ	STR_192+0
STR_214	equ	STR_192+0
STR_230	equ	STR_192+0
STR_173	equ	STR_55+0
STR_29	equ	STR_23+0
STR_90	equ	STR_76+0
STR_109	equ	STR_76+0
STR_91	equ	STR_77+0
STR_110	equ	STR_77+0
STR_32	equ	STR_26+0
STR_216	equ	STR_212+0
STR_130	equ	STR_270+5
STR_187	equ	STR_270+5
STR_190	equ	STR_270+5
STR_200	equ	STR_270+5
STR_233	equ	STR_270+5
STR_186	equ	STR_129+0
STR_189	equ	STR_129+0
STR_198	equ	STR_129+0
STR_231	equ	STR_129+0
STR_172	equ	STR_54+0
STR_128	equ	STR_131+13
STR_185	equ	STR_131+14
STR_188	equ	STR_131+15
STR_195	equ	STR_131+15
STR_213	equ	STR_131+19
STR_217	equ	STR_131+19
STR_36	equ	STR_131+20
STR_37	equ	STR_131+20
STR_38	equ	STR_131+20
STR_42	equ	STR_131+20
STR_43	equ	STR_131+20
STR_46	equ	STR_131+20
STR_47	equ	STR_131+20
STR_48	equ	STR_131+20
STR_51	equ	STR_131+20
STR_52	equ	STR_131+20
STR_53	equ	STR_131+20
STR_56	equ	STR_131+20
STR_57	equ	STR_131+20
STR_58	equ	STR_131+20
STR_61	equ	STR_131+20
STR_62	equ	STR_131+20
STR_63	equ	STR_131+20
STR_67	equ	STR_131+20
STR_68	equ	STR_131+20
STR_196	equ	STR_131+20
STR_202	equ	STR_131+20
STR_203	equ	STR_131+20
STR_204	equ	STR_131+20
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
menu_update_numeric_value@F2630:
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
	global	_relay_state
_relay_state:
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
	global	_clock_menu
_clock_menu:
       ds      25
psect	bssBANK2,class=BANK2,space=1,noexec,lowdata
global __pbssBANK2
__pbssBANK2:
	global	_menu
_menu:
       ds      22
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
main@last_menu_state:
       ds      1
main@last_relay_state:
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
psect	dataBANK2,class=BANK2,space=1,noexec,lowdata
global __pdataBANK2
__pdataBANK2:
	file	"src\encoder.c"
	line	16
	global	_menu_timeout_flag
_menu_timeout_flag:
       ds      1
psect	dataBANK2
	file	"src\menu.c"
	line	102
_value_relay_pulse:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	75
_value_scale4:
       ds      10
psect	bssBANK3,class=BANK3,space=1,noexec,lowdata
global __pbssBANK3
__pbssBANK3:
	global	_input_menu
_input_menu:
       ds      75
_original_value:
       ds      10
psect	dataBANK3,class=BANK3,space=1,noexec,lowdata
global __pdataBANK3
__pdataBANK3:
	file	"src\menu.c"
	line	65
	global	_options_menu
_options_menu:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	74
_value_sensor:
       ds      12
psect	dataBANK3
	file	"src\menu.c"
	line	101
_value_end_runtime:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	100
_value_clock_enable:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	91
_value_flow_type:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	89
_value_low_pressure:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	88
_value_hi_pressure:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	83
_value_rlylow:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	82
_value_rlyslp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	81
_value_rlyplp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	80
_value_rlyhigh:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	79
_value_slpbp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	78
_value_plpbp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	77
_value_highbp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	76
_value_scale20:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	73
_value_enable:
       ds      10
psect	bssBANK4,class=BANK4,space=1,noexec,lowdata
global __pbssBANK4
__pbssBANK4:
	global	_system_config
_system_config:
       ds      128
psect	dataBANK4,class=BANK4,space=1,noexec,lowdata
global __pdataBANK4
__pdataBANK4:
	file	"src\menu.c"
	line	1230
menu_draw_setup@F2659:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	103
_value_clock_display:
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
	line	90
_value_high_temp:
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
; Initialize objects allocated to BANK4 (90 bytes)
	global __pidataBANK4
	; load TBLPTR registers with __pidataBANK4
	movlw	low (__pidataBANK4)
	movwf	tblptrl
	movlw	high(__pidataBANK4)
	movwf	tblptrh
	movlw	low highword(__pidataBANK4)
	movwf	tblptru
	lfsr	0,__pdataBANK4
	lfsr	1,90
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK3 (162 bytes)
	global __pidataBANK3
	; load TBLPTR registers with __pidataBANK3
	movlw	low (__pidataBANK3)
	movwf	tblptrl
	movlw	high(__pidataBANK3)
	movwf	tblptrh
	movlw	low highword(__pidataBANK3)
	movwf	tblptru
	lfsr	0,__pdataBANK3
	lfsr	1,162
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
; Initialize objects allocated to BANK2 (21 bytes)
	global __pidataBANK2
	; load TBLPTR registers with __pidataBANK2
	movlw	low (__pidataBANK2)
	movwf	tblptrl
	movlw	high(__pidataBANK2)
	movwf	tblptrh
	movlw	low highword(__pidataBANK2)
	movwf	tblptru
	lfsr	0,__pdataBANK2
	lfsr	1,21
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
; Clear objects allocated to BANK4 (128 bytes)
	global __pbssBANK4
lfsr	0,__pbssBANK4
movlw	128
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
; Clear objects allocated to BANK3 (85 bytes)
	global __pbssBANK3
lfsr	0,__pbssBANK3
movlw	85
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
; Clear objects allocated to BANK2 (42 bytes)
	global __pbssBANK2
lfsr	0,__pbssBANK2
movlw	42
clear_3:
clrf	postinc0,c
decf	wreg
bnz	clear_3
; Clear objects allocated to BANK1 (25 bytes)
	global __pbssBANK1
lfsr	0,__pbssBANK1
movlw	25
clear_4:
clrf	postinc0,c
decf	wreg
bnz	clear_4
; Clear objects allocated to BANK0 (1 bytes)
	global __pbssBANK0
movlb	0
clrf	(__pbssBANK0+0)&0xffh,b
; Clear objects allocated to COMRAM (25 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	25
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
psect	cstackBANK2,class=BANK2,space=1,noexec,lowdata
global __pcstackBANK2
__pcstackBANK2:
	global	main@buf_640
main@buf_640:	; 60 bytes @ 0x0
	ds   60
	global	main@buf
main@buf:	; 50 bytes @ 0x3C
	ds   50
	global	main@buf_643
main@buf_643:	; 40 bytes @ 0x6E
	ds   40
	global	main@buf_670
main@buf_670:	; 30 bytes @ 0x96
	ds   30
	global	main@last_button
main@last_button:	; 1 bytes @ 0xB4
	ds   1
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0xB5
	ds   2
	global	main@current_event
main@current_event:	; 1 bytes @ 0xB7
	ds   1
	global	main@delta
main@delta:	; 2 bytes @ 0xB8
	ds   2
psect	cstackBANK1,class=BANK1,space=1,noexec,lowdata
global __pcstackBANK1
__pcstackBANK1:
	global	menu_handle_encoder@buf_1496
menu_handle_encoder@buf_1496:	; 50 bytes @ 0x0
	global	menu_handle_button@buf_1532
menu_handle_button@buf_1532:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_encoder@buf_1499
menu_handle_encoder@buf_1499:	; 50 bytes @ 0x32
	global	menu_handle_button@buf_1554
menu_handle_button@buf_1554:	; 50 bytes @ 0x32
	ds   50
	global	menu_handle_encoder@buf
menu_handle_encoder@buf:	; 50 bytes @ 0x64
	global	menu_handle_button@buf_1564
menu_handle_button@buf_1564:	; 50 bytes @ 0x64
	ds   50
	global	_menu_handle_encoder$1494
_menu_handle_encoder$1494:	; 2 bytes @ 0x96
	global	menu_handle_button@buf
menu_handle_button@buf:	; 50 bytes @ 0x96
	ds   2
	global	_menu_handle_encoder$1495
_menu_handle_encoder$1495:	; 2 bytes @ 0x98
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
	global	_menu_handle_button$1566
_menu_handle_button$1566:	; 2 bytes @ 0xC8
	ds   2
	global	menu_handle_button@edit_flag_1526
menu_handle_button@edit_flag_1526:	; 2 bytes @ 0xCA
	ds   2
	global	menu_handle_button@opts_1527
menu_handle_button@opts_1527:	; 2 bytes @ 0xCC
	ds   2
	global	menu_handle_button@edit_flag_1557
menu_handle_button@edit_flag_1557:	; 2 bytes @ 0xCE
	ds   2
	global	menu_handle_button@opts_1558
menu_handle_button@opts_1558:	; 2 bytes @ 0xD0
	ds   2
	global	menu_handle_button@current_val_1553
menu_handle_button@current_val_1553:	; 2 bytes @ 0xD2
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
	global	menu_handle_button@flow_type_1550
menu_handle_button@flow_type_1550:	; 1 bytes @ 0xE0
	ds   1
	global	menu_handle_button@flow_type
menu_handle_button@flow_type:	; 1 bytes @ 0xE1
	ds   1
	global	menu_handle_button@sensor_type_1549
menu_handle_button@sensor_type_1549:	; 1 bytes @ 0xE2
	ds   1
	global	menu_handle_button@sensor_type
menu_handle_button@sensor_type:	; 1 bytes @ 0xE3
	ds   1
	global	menu_handle_button@new_value_1537
menu_handle_button@new_value_1537:	; 2 bytes @ 0xE4
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
	global	rebuild_clock_menu@buf
rebuild_clock_menu@buf:	; 50 bytes @ 0x0
	global	trigger_relay_pulse@buf
trigger_relay_pulse@buf:	; 60 bytes @ 0x0
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
	global	_menu_update_edit_value$1328
_menu_update_edit_value$1328:	; 2 bytes @ 0x16
	ds   2
	global	_menu_update_edit_value$1332
_menu_update_edit_value$1332:	; 2 bytes @ 0x18
	ds   1
	global	menu_draw_input@start_pos
menu_draw_input@start_pos:	; 1 bytes @ 0x19
	ds   1
	global	menu_update_edit_value@start_col
menu_update_edit_value@start_col:	; 1 bytes @ 0x1A
	global	_menu_draw_input$1394
_menu_draw_input$1394:	; 2 bytes @ 0x1A
	ds   1
	global	menu_update_edit_value@blink_pos
menu_update_edit_value@blink_pos:	; 1 bytes @ 0x1B
	ds   1
	global	menu_update_edit_value@screen_line
menu_update_edit_value@screen_line:	; 1 bytes @ 0x1C
	global	_menu_draw_input$1398
_menu_draw_input$1398:	; 2 bytes @ 0x1C
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
	global	menu_draw_input@opts_1380
menu_draw_input@opts_1380:	; 2 bytes @ 0x24
	ds   2
	global	menu_draw_input@flag_1384
menu_draw_input@flag_1384:	; 2 bytes @ 0x26
	ds   2
	global	menu_draw_input@val_len_1388
menu_draw_input@val_len_1388:	; 1 bytes @ 0x28
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
	global	_handle_time_rotation$1186
_handle_time_rotation$1186:	; 2 bytes @ 0x32
	global	_rebuild_input_menu$1221
_rebuild_input_menu$1221:	; 2 bytes @ 0x32
	global	_handle_numeric_rotation$1317
_handle_numeric_rotation$1317:	; 2 bytes @ 0x32
	global	_rebuild_clock_menu$1441
_rebuild_clock_menu$1441:	; 2 bytes @ 0x32
	global	menu_update_time_value@debug_after
menu_update_time_value@debug_after:	; 50 bytes @ 0x32
	ds   2
	global	handle_time_rotation@direction
handle_time_rotation@direction:	; 1 bytes @ 0x34
	global	_rebuild_input_menu$1235
_rebuild_input_menu$1235:	; 2 bytes @ 0x34
	global	_handle_numeric_rotation$1319
_handle_numeric_rotation$1319:	; 2 bytes @ 0x34
	global	_rebuild_clock_menu$1447
_rebuild_clock_menu$1447:	; 2 bytes @ 0x34
	ds   2
	global	handle_numeric_rotation@max_tens
handle_numeric_rotation@max_tens:	; 1 bytes @ 0x36
	global	_rebuild_input_menu$1236
_rebuild_input_menu$1236:	; 2 bytes @ 0x36
	global	_rebuild_clock_menu$1448
_rebuild_clock_menu$1448:	; 2 bytes @ 0x36
	ds   1
	global	handle_numeric_rotation@max_units
handle_numeric_rotation@max_units:	; 1 bytes @ 0x37
	ds   1
	global	handle_numeric_rotation@direction
handle_numeric_rotation@direction:	; 1 bytes @ 0x38
	global	_rebuild_input_menu$1242
_rebuild_input_menu$1242:	; 2 bytes @ 0x38
	ds   2
	global	_rebuild_input_menu$1243
_rebuild_input_menu$1243:	; 2 bytes @ 0x3A
	ds   2
	global	trigger_relay_pulse@latch_mode
trigger_relay_pulse@latch_mode:	; 1 bytes @ 0x3C
	global	_rebuild_input_menu$1249
_rebuild_input_menu$1249:	; 2 bytes @ 0x3C
	ds   2
	global	_rebuild_input_menu$1250
_rebuild_input_menu$1250:	; 2 bytes @ 0x3E
	ds   2
	global	_rebuild_input_menu$1254
_rebuild_input_menu$1254:	; 2 bytes @ 0x40
	ds   2
	global	_rebuild_input_menu$1268
_rebuild_input_menu$1268:	; 2 bytes @ 0x42
	ds   2
	global	_rebuild_input_menu$1269
_rebuild_input_menu$1269:	; 2 bytes @ 0x44
	ds   2
	global	_rebuild_input_menu$1273
_rebuild_input_menu$1273:	; 2 bytes @ 0x46
	ds   2
	global	_rebuild_input_menu$1278
_rebuild_input_menu$1278:	; 2 bytes @ 0x48
	ds   2
	global	_rebuild_input_menu$1282
_rebuild_input_menu$1282:	; 2 bytes @ 0x4A
	ds   2
	global	_rebuild_input_menu$1288
_rebuild_input_menu$1288:	; 2 bytes @ 0x4C
	ds   2
	global	_rebuild_input_menu$1289
_rebuild_input_menu$1289:	; 2 bytes @ 0x4E
	ds   2
	global	_rebuild_input_menu$1293
_rebuild_input_menu$1293:	; 2 bytes @ 0x50
	ds   2
	global	rebuild_input_menu@flow_type_val
rebuild_input_menu@flow_type_val:	; 1 bytes @ 0x52
	ds   1
	global	rebuild_input_menu@sensor
rebuild_input_menu@sensor:	; 1 bytes @ 0x53
	ds   1
	global	_rebuild_input_menu$2504
_rebuild_input_menu$2504:	; 2 bytes @ 0x54
	ds   2
	global	_rebuild_input_menu$2505
_rebuild_input_menu$2505:	; 2 bytes @ 0x56
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
?_menu_draw_clock:	; 1 bytes @ 0x0
?_get_menu_timeout_seconds:	; 1 bytes @ 0x0
?_load_factory_defaults:	; 1 bytes @ 0x0
?_sync_menu_variables:	; 1 bytes @ 0x0
?_uart_init:	; 1 bytes @ 0x0
?_uart_write:	; 1 bytes @ 0x0
?_system_init:	; 1 bytes @ 0x0
?_trigger_relay_pulse:	; 1 bytes @ 0x0
?_lcd_write_nibble:	; 1 bytes @ 0x0
?_lcd_cmd:	; 1 bytes @ 0x0
?_lcd_data:	; 1 bytes @ 0x0
?_lcd_clear:	; 1 bytes @ 0x0
?_lcd_init:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_isr:	; 1 bytes @ 0x0
?_lcd_clear_line:	; 1 bytes @ 0x0
?_rebuild_input_menu:	; 1 bytes @ 0x0
?_rebuild_clock_menu:	; 1 bytes @ 0x0
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
	global	_isdigit$2243
_isdigit$2243:	; 1 bytes @ 0xF
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
	global	_is_numeric_field$1146
_is_numeric_field$1146:	; 1 bytes @ 0x10
	global	_is_time_field$1153
_is_time_field$1153:	; 1 bytes @ 0x10
	global	_is_option_field$1158
_is_option_field$1158:	; 1 bytes @ 0x10
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
	global	_is_numeric_field$1147
_is_numeric_field$1147:	; 1 bytes @ 0x11
	global	is_time_field@line
is_time_field@line:	; 1 bytes @ 0x11
	global	_is_option_field$1159
_is_option_field$1159:	; 1 bytes @ 0x11
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
	global	_is_numeric_field$1148
_is_numeric_field$1148:	; 1 bytes @ 0x12
	global	_is_option_field$1160
_is_option_field$1160:	; 1 bytes @ 0x12
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
	global	_is_option_field$1161
_is_option_field$1161:	; 1 bytes @ 0x13
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
	global	_menu_update_numeric_value$1343
_menu_update_numeric_value$1343:	; 2 bytes @ 0x16
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
	global	calculate_config_checksum@j_1717
calculate_config_checksum@j_1717:	; 2 bytes @ 0x17
	global	eeprom_write_block@ptr
eeprom_write_block@ptr:	; 2 bytes @ 0x17
	ds   1
??_menu_draw_options:	; 1 bytes @ 0x18
??_menu_draw_setup:	; 1 bytes @ 0x18
??_menu_draw_clock:	; 1 bytes @ 0x18
	global	menu_draw_options@item_index
menu_draw_options@item_index:	; 1 bytes @ 0x18
	global	memcpy@tmp
memcpy@tmp:	; 1 bytes @ 0x18
	global	_menu_update_numeric_value$1344
_menu_update_numeric_value$1344:	; 2 bytes @ 0x18
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
	global	_menu_update_numeric_value$1345
_menu_update_numeric_value$1345:	; 2 bytes @ 0x1A
	global	sprintf@sp
sprintf@sp:	; 2 bytes @ 0x1A
	ds   1
??_save_current_config:	; 1 bytes @ 0x1B
	global	save_current_config@checksum
save_current_config@checksum:	; 2 bytes @ 0x1B
	ds   1
??_init_numeric_editor:	; 1 bytes @ 0x1C
	global	_menu_update_numeric_value$1346
_menu_update_numeric_value$1346:	; 2 bytes @ 0x1C
	global	sprintf@f
sprintf@f:	; 2 bytes @ 0x1C
	ds   1
	global	save_current_config@i
save_current_config@i:	; 1 bytes @ 0x1D
	global	menu_draw_clock@value_buf
menu_draw_clock@value_buf:	; 15 bytes @ 0x1D
	ds   1
??_eeprom_init:	; 1 bytes @ 0x1E
	global	init_numeric_editor@flow_type
init_numeric_editor@flow_type:	; 1 bytes @ 0x1E
	global	_menu_update_numeric_value$1347
_menu_update_numeric_value$1347:	; 2 bytes @ 0x1E
	global	eeprom_init@stored_checksum
eeprom_init@stored_checksum:	; 2 bytes @ 0x1E
	ds   1
	global	_init_numeric_editor$1307
_init_numeric_editor$1307:	; 2 bytes @ 0x1F
	ds   1
	global	_menu_update_numeric_value$1348
_menu_update_numeric_value$1348:	; 2 bytes @ 0x20
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
	global	_menu_update_numeric_value$1349
_menu_update_numeric_value$1349:	; 2 bytes @ 0x22
	global	_menu_draw_setup$1418
_menu_draw_setup$1418:	; 2 bytes @ 0x22
	ds   2
	global	_menu_update_numeric_value$1350
_menu_update_numeric_value$1350:	; 2 bytes @ 0x24
	global	_menu_draw_setup$1424
_menu_draw_setup$1424:	; 2 bytes @ 0x24
	ds   2
??_sprintf:	; 1 bytes @ 0x26
	global	_menu_update_numeric_value$1352
_menu_update_numeric_value$1352:	; 2 bytes @ 0x26
	global	_menu_draw_setup$1432
_menu_draw_setup$1432:	; 2 bytes @ 0x26
	ds   2
	global	menu_draw_setup@label
menu_draw_setup@label:	; 2 bytes @ 0x28
	global	menu_update_numeric_value@value_buf
menu_update_numeric_value@value_buf:	; 6 bytes @ 0x28
	ds   1
	global	_sprintf$1802
_sprintf$1802:	; 2 bytes @ 0x29
	ds   1
	global	menu_draw_setup@sensor
menu_draw_setup@sensor:	; 1 bytes @ 0x2A
	ds   1
	global	menu_draw_setup@sensor_name
menu_draw_setup@sensor_name:	; 2 bytes @ 0x2B
	global	_sprintf$1803
_sprintf$1803:	; 2 bytes @ 0x2B
	ds   1
	global	menu_draw_clock@actual_len
menu_draw_clock@actual_len:	; 1 bytes @ 0x2C
	ds   1
	global	menu_draw_setup@item_idx
menu_draw_setup@item_idx:	; 1 bytes @ 0x2D
	global	menu_draw_clock@start_pos
menu_draw_clock@start_pos:	; 1 bytes @ 0x2D
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x2D
	ds   1
	global	menu_update_numeric_value@start_col
menu_update_numeric_value@start_col:	; 1 bytes @ 0x2E
	global	menu_draw_setup@i
menu_draw_setup@i:	; 1 bytes @ 0x2E
	global	_menu_draw_clock$1470
_menu_draw_clock$1470:	; 2 bytes @ 0x2E
	global	sprintf@cp
sprintf@cp:	; 2 bytes @ 0x2E
	ds   1
	global	menu_update_numeric_value@screen_line
menu_update_numeric_value@screen_line:	; 1 bytes @ 0x2F
	ds   1
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x30
	global	_menu_draw_clock$1474
_menu_draw_clock$1474:	; 2 bytes @ 0x30
	ds   1
	global	sprintf@val
sprintf@val:	; 2 bytes @ 0x31
	ds   1
	global	menu_draw_clock@val_len
menu_draw_clock@val_len:	; 1 bytes @ 0x32
	ds   1
	global	menu_draw_clock@val_len_1464
menu_draw_clock@val_len_1464:	; 1 bytes @ 0x33
	global	sprintf@len
sprintf@len:	; 2 bytes @ 0x33
	ds   1
	global	menu_draw_clock@j
menu_draw_clock@j:	; 1 bytes @ 0x34
	ds   1
	global	menu_draw_clock@show_brackets
menu_draw_clock@show_brackets:	; 1 bytes @ 0x35
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x35
	ds   1
	global	menu_draw_clock@i
menu_draw_clock@i:	; 1 bytes @ 0x36
	global	sprintf@width
sprintf@width:	; 2 bytes @ 0x36
	ds   1
	global	menu_draw_clock@item_idx
menu_draw_clock@item_idx:	; 1 bytes @ 0x37
	ds   1
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x38
	ds   1
??_handle_numeric_rotation:	; 1 bytes @ 0x39
??_handle_time_rotation:	; 1 bytes @ 0x39
??_menu_update_time_value:	; 1 bytes @ 0x39
??_menu_update_edit_value:	; 1 bytes @ 0x39
??_menu_draw_input:	; 1 bytes @ 0x39
??_trigger_relay_pulse:	; 1 bytes @ 0x39
?_init_time_editor:	; 1 bytes @ 0x39
??_rebuild_input_menu:	; 1 bytes @ 0x39
??_rebuild_clock_menu:	; 1 bytes @ 0x39
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
	ds   6
??_main:	; 1 bytes @ 0x46
	ds   2
;!
;!Data Sizes:
;!    Strings     2125
;!    Constant    857
;!    Data        295
;!    BSS         690
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126     72     104
;!    BANK0           128    110     126
;!    BANK1           256    230     255
;!    BANK2           256    186     249
;!    BANK3           256      0     247
;!    BANK4           256      0     218
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
;!		 -> input_config(BIGRAM[384]), system_config(BANK4[128]), 
;!
;!    clock_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[8]), STR_101(CODE[11]), STR_102(CODE[8]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[6]), STR_109(CODE[10]), STR_110(CODE[11]), STR_111(CODE[9]), 
;!		 -> STR_112(CODE[12]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[8]), STR_118(CODE[10]), STR_119(CODE[8]), 
;!		 -> STR_120(CODE[5]), STR_74(CODE[7]), STR_75(CODE[7]), STR_76(CODE[10]), 
;!		 -> STR_77(CODE[11]), STR_78(CODE[12]), STR_79(CODE[9]), STR_80(CODE[13]), 
;!		 -> STR_81(CODE[6]), STR_82(CODE[6]), STR_83(CODE[9]), STR_84(CODE[8]), 
;!		 -> STR_85(CODE[8]), STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), 
;!		 -> STR_89(CODE[7]), STR_90(CODE[10]), STR_91(CODE[11]), STR_92(CODE[10]), 
;!		 -> STR_93(CODE[9]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[5]), 
;!
;!    clock_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK3[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    clock_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[8]), STR_101(CODE[11]), STR_102(CODE[8]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[6]), STR_109(CODE[10]), STR_110(CODE[11]), STR_111(CODE[9]), 
;!		 -> STR_112(CODE[12]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[8]), STR_118(CODE[10]), STR_119(CODE[8]), 
;!		 -> STR_120(CODE[5]), STR_74(CODE[7]), STR_75(CODE[7]), STR_76(CODE[10]), 
;!		 -> STR_77(CODE[11]), STR_78(CODE[12]), STR_79(CODE[9]), STR_80(CODE[13]), 
;!		 -> STR_81(CODE[6]), STR_82(CODE[6]), STR_83(CODE[9]), STR_84(CODE[8]), 
;!		 -> STR_85(CODE[8]), STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), 
;!		 -> STR_89(CODE[7]), STR_90(CODE[10]), STR_91(CODE[11]), STR_92(CODE[10]), 
;!		 -> STR_93(CODE[9]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[5]), 
;!
;!    clock_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK3[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    eeprom_read_block@data	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK4[128]), 
;!
;!    eeprom_read_block@ptr	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK4[128]), 
;!
;!    eeprom_write_block@data	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK4[128]), 
;!
;!    eeprom_write_block@ptr	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK4[128]), 
;!
;!    flow_analog_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[8]), STR_101(CODE[11]), STR_102(CODE[8]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[6]), STR_109(CODE[10]), STR_110(CODE[11]), STR_111(CODE[9]), 
;!		 -> STR_112(CODE[12]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[8]), STR_118(CODE[10]), STR_119(CODE[8]), 
;!		 -> STR_120(CODE[5]), STR_74(CODE[7]), STR_75(CODE[7]), STR_76(CODE[10]), 
;!		 -> STR_77(CODE[11]), STR_78(CODE[12]), STR_79(CODE[9]), STR_80(CODE[13]), 
;!		 -> STR_81(CODE[6]), STR_82(CODE[6]), STR_83(CODE[9]), STR_84(CODE[8]), 
;!		 -> STR_85(CODE[8]), STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), 
;!		 -> STR_89(CODE[7]), STR_90(CODE[10]), STR_91(CODE[11]), STR_92(CODE[10]), 
;!		 -> STR_93(CODE[9]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[5]), 
;!
;!    flow_analog_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK3[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    flow_digital_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[8]), STR_101(CODE[11]), STR_102(CODE[8]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[6]), STR_109(CODE[10]), STR_110(CODE[11]), STR_111(CODE[9]), 
;!		 -> STR_112(CODE[12]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[8]), STR_118(CODE[10]), STR_119(CODE[8]), 
;!		 -> STR_120(CODE[5]), STR_74(CODE[7]), STR_75(CODE[7]), STR_76(CODE[10]), 
;!		 -> STR_77(CODE[11]), STR_78(CODE[12]), STR_79(CODE[9]), STR_80(CODE[13]), 
;!		 -> STR_81(CODE[6]), STR_82(CODE[6]), STR_83(CODE[9]), STR_84(CODE[8]), 
;!		 -> STR_85(CODE[8]), STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), 
;!		 -> STR_89(CODE[7]), STR_90(CODE[10]), STR_91(CODE[11]), STR_92(CODE[10]), 
;!		 -> STR_93(CODE[9]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[5]), 
;!
;!    flow_digital_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK3[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    input_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[8]), STR_101(CODE[11]), STR_102(CODE[8]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[6]), STR_109(CODE[10]), STR_110(CODE[11]), STR_111(CODE[9]), 
;!		 -> STR_112(CODE[12]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[8]), STR_118(CODE[10]), STR_119(CODE[8]), 
;!		 -> STR_120(CODE[5]), STR_74(CODE[7]), STR_75(CODE[7]), STR_76(CODE[10]), 
;!		 -> STR_77(CODE[11]), STR_78(CODE[12]), STR_79(CODE[9]), STR_80(CODE[13]), 
;!		 -> STR_81(CODE[6]), STR_82(CODE[6]), STR_83(CODE[9]), STR_84(CODE[8]), 
;!		 -> STR_85(CODE[8]), STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), 
;!		 -> STR_89(CODE[7]), STR_90(CODE[10]), STR_91(CODE[11]), STR_92(CODE[10]), 
;!		 -> STR_93(CODE[9]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[5]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK3[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    lcd_print@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> Fake(UNKNOWN), menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), 
;!		 -> menu_update_edit_value@display_buf(BANK0[10]), menu_update_numeric_value@value_buf(COMRAM[6]), menu_update_time_value@value_buf(BANK0[6]), STR_10(CODE[16]), 
;!		 -> STR_100(CODE[8]), STR_101(CODE[11]), STR_102(CODE[8]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[6]), STR_109(CODE[10]), STR_110(CODE[11]), STR_111(CODE[9]), 
;!		 -> STR_112(CODE[12]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[8]), STR_118(CODE[10]), STR_119(CODE[8]), 
;!		 -> STR_120(CODE[5]), STR_128(CODE[8]), STR_129(CODE[2]), STR_130(CODE[2]), 
;!		 -> STR_131(CODE[21]), STR_185(CODE[7]), STR_186(CODE[2]), STR_187(CODE[2]), 
;!		 -> STR_188(CODE[6]), STR_189(CODE[2]), STR_190(CODE[2]), STR_191(CODE[21]), 
;!		 -> STR_192(CODE[2]), STR_193(CODE[2]), STR_197(CODE[2]), STR_198(CODE[2]), 
;!		 -> STR_199(CODE[2]), STR_200(CODE[2]), STR_201(CODE[21]), STR_202(CODE[1]), 
;!		 -> STR_203(CODE[1]), STR_204(CODE[1]), STR_205(CODE[6]), STR_206(CODE[5]), 
;!		 -> STR_207(CODE[9]), STR_208(CODE[5]), STR_209(CODE[5]), STR_210(CODE[2]), 
;!		 -> STR_211(CODE[2]), STR_212(CODE[2]), STR_213(CODE[2]), STR_214(CODE[2]), 
;!		 -> STR_215(CODE[2]), STR_216(CODE[2]), STR_217(CODE[2]), STR_229(CODE[6]), 
;!		 -> STR_23(CODE[12]), STR_230(CODE[2]), STR_231(CODE[2]), STR_232(CODE[2]), 
;!		 -> STR_233(CODE[2]), STR_24(CODE[6]), STR_29(CODE[12]), STR_30(CODE[8]), 
;!		 -> STR_69(CODE[10]), STR_70(CODE[11]), STR_71(CODE[13]), STR_72(CODE[6]), 
;!		 -> STR_73(CODE[5]), STR_74(CODE[7]), STR_75(CODE[7]), STR_76(CODE[10]), 
;!		 -> STR_77(CODE[11]), STR_78(CODE[12]), STR_79(CODE[9]), STR_80(CODE[13]), 
;!		 -> STR_81(CODE[6]), STR_82(CODE[6]), STR_83(CODE[9]), STR_84(CODE[8]), 
;!		 -> STR_85(CODE[8]), STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), 
;!		 -> STR_89(CODE[7]), STR_9(CODE[13]), STR_90(CODE[10]), STR_91(CODE[11]), 
;!		 -> STR_92(CODE[10]), STR_93(CODE[9]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[5]), STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[5]), 
;!
;!    lcd_print_at@str	PTR const unsigned char  size(2) Largest target is 15
;!		 -> Fake(UNKNOWN), menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), 
;!		 -> STR_100(CODE[8]), STR_101(CODE[11]), STR_102(CODE[8]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[6]), STR_109(CODE[10]), STR_110(CODE[11]), STR_111(CODE[9]), 
;!		 -> STR_112(CODE[12]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[8]), STR_118(CODE[10]), STR_119(CODE[8]), 
;!		 -> STR_120(CODE[5]), STR_202(CODE[1]), STR_203(CODE[1]), STR_204(CODE[1]), 
;!		 -> STR_205(CODE[6]), STR_206(CODE[5]), STR_207(CODE[9]), STR_208(CODE[5]), 
;!		 -> STR_209(CODE[5]), STR_229(CODE[6]), STR_69(CODE[10]), STR_70(CODE[11]), 
;!		 -> STR_71(CODE[13]), STR_72(CODE[6]), STR_73(CODE[5]), STR_74(CODE[7]), 
;!		 -> STR_75(CODE[7]), STR_76(CODE[10]), STR_77(CODE[11]), STR_78(CODE[12]), 
;!		 -> STR_79(CODE[9]), STR_80(CODE[13]), STR_81(CODE[6]), STR_82(CODE[6]), 
;!		 -> STR_83(CODE[9]), STR_84(CODE[8]), STR_85(CODE[8]), STR_86(CODE[8]), 
;!		 -> STR_87(CODE[5]), STR_88(CODE[7]), STR_89(CODE[7]), STR_90(CODE[10]), 
;!		 -> STR_91(CODE[11]), STR_92(CODE[10]), STR_93(CODE[9]), STR_94(CODE[9]), 
;!		 -> STR_95(CODE[8]), STR_96(CODE[5]), STR_97(CODE[7]), STR_98(CODE[7]), 
;!		 -> STR_99(CODE[5]), 
;!
;!    memcpy@d	PTR unsigned char  size(2) Largest target is 384
;!		 -> clock_menu(BANK1[25]), input_config(BIGRAM[384]), input_menu(BANK3[75]), system_config(BANK4[128]), 
;!
;!    memcpy@d1	PTR void  size(2) Largest target is 384
;!		 -> clock_menu(BANK1[25]), input_config(BIGRAM[384]), input_menu(BANK3[75]), system_config(BANK4[128]), 
;!
;!    memcpy@s	PTR const unsigned char  size(2) Largest target is 384
;!		 -> clock_menu_template(CODE[25]), factory_defaults(CODE[384]), flow_analog_template(CODE[55]), flow_digital_template(CODE[40]), 
;!		 -> pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    memcpy@s1	PTR const void  size(2) Largest target is 384
;!		 -> clock_menu_template(CODE[25]), factory_defaults(CODE[384]), flow_analog_template(CODE[55]), flow_digital_template(CODE[40]), 
;!		 -> pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    menu_draw_clock$1470	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_230(CODE[2]), STR_231(CODE[2]), 
;!
;!    menu_draw_clock$1474	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_232(CODE[2]), STR_233(CODE[2]), 
;!
;!    menu_draw_input$1394	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_197(CODE[2]), STR_198(CODE[2]), 
;!
;!    menu_draw_input$1398	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_199(CODE[2]), STR_200(CODE[2]), 
;!
;!    menu_draw_input@flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@flag_1384	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_34(CODE[9]), STR_35(CODE[8]), STR_36(CODE[1]), STR_37(CODE[1]), 
;!		 -> STR_38(CODE[1]), STR_39(CODE[9]), STR_40(CODE[5]), STR_41(CODE[5]), 
;!		 -> STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[7]), STR_45(CODE[8]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[4]), 
;!		 -> STR_50(CODE[5]), STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[2]), STR_55(CODE[4]), STR_56(CODE[1]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[5]), STR_60(CODE[5]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[6]), STR_65(CODE[6]), 
;!		 -> STR_66(CODE[9]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!
;!    menu_draw_input@opts_1380	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts_1380$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_34(CODE[9]), STR_35(CODE[8]), STR_36(CODE[1]), STR_37(CODE[1]), 
;!		 -> STR_38(CODE[1]), STR_39(CODE[9]), STR_40(CODE[5]), STR_41(CODE[5]), 
;!		 -> STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[7]), STR_45(CODE[8]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[4]), 
;!		 -> STR_50(CODE[5]), STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[2]), STR_55(CODE[4]), STR_56(CODE[1]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[5]), STR_60(CODE[5]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[6]), STR_65(CODE[6]), 
;!		 -> STR_66(CODE[9]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!
;!    menu_draw_setup$1418	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_208(CODE[5]), STR_209(CODE[5]), 
;!
;!    menu_draw_setup$1424	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_212(CODE[2]), STR_213(CODE[2]), 
;!
;!    menu_draw_setup$1432	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_216(CODE[2]), STR_217(CODE[2]), 
;!
;!    menu_draw_setup@F2659	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_202(CODE[1]), STR_203(CODE[1]), STR_204(CODE[1]), STR_205(CODE[6]), 
;!		 -> STR_206(CODE[5]), 
;!
;!    menu_draw_setup@label	PTR const unsigned char  size(2) Largest target is 6
;!		 -> STR_202(CODE[1]), STR_203(CODE[1]), STR_204(CODE[1]), STR_205(CODE[6]), 
;!		 -> STR_206(CODE[5]), 
;!
;!    menu_draw_setup@sensor_name	PTR const unsigned char  size(2) Largest target is 9
;!		 -> Fake(UNKNOWN), STR_207(CODE[9]), STR_208(CODE[5]), STR_209(CODE[5]), 
;!
;!    menu_draw_setup@setup_labels	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_202(CODE[1]), STR_203(CODE[1]), STR_204(CODE[1]), STR_205(CODE[6]), 
;!		 -> STR_206(CODE[5]), 
;!
;!    menu_handle_button@edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1526	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1557	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_34(CODE[9]), STR_35(CODE[8]), STR_36(CODE[1]), STR_37(CODE[1]), 
;!		 -> STR_38(CODE[1]), STR_39(CODE[9]), STR_40(CODE[5]), STR_41(CODE[5]), 
;!		 -> STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[7]), STR_45(CODE[8]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[4]), 
;!		 -> STR_50(CODE[5]), STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[2]), STR_55(CODE[4]), STR_56(CODE[1]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[5]), STR_60(CODE[5]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[6]), STR_65(CODE[6]), 
;!		 -> STR_66(CODE[9]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!
;!    menu_handle_button@opts_1527	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1527$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_34(CODE[9]), STR_35(CODE[8]), STR_36(CODE[1]), STR_37(CODE[1]), 
;!		 -> STR_38(CODE[1]), STR_39(CODE[9]), STR_40(CODE[5]), STR_41(CODE[5]), 
;!		 -> STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[7]), STR_45(CODE[8]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[4]), 
;!		 -> STR_50(CODE[5]), STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[2]), STR_55(CODE[4]), STR_56(CODE[1]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[5]), STR_60(CODE[5]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[6]), STR_65(CODE[6]), 
;!		 -> STR_66(CODE[9]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!
;!    menu_handle_button@opts_1558	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1558$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_34(CODE[9]), STR_35(CODE[8]), STR_36(CODE[1]), STR_37(CODE[1]), 
;!		 -> STR_38(CODE[1]), STR_39(CODE[9]), STR_40(CODE[5]), STR_41(CODE[5]), 
;!		 -> STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[7]), STR_45(CODE[8]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[4]), 
;!		 -> STR_50(CODE[5]), STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[2]), STR_55(CODE[4]), STR_56(CODE[1]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[5]), STR_60(CODE[5]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[6]), STR_65(CODE[6]), 
;!		 -> STR_66(CODE[9]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!
;!    menu_handle_encoder$2506	const PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_34(CODE[9]), STR_35(CODE[8]), STR_36(CODE[1]), STR_37(CODE[1]), 
;!		 -> STR_38(CODE[1]), STR_39(CODE[9]), STR_40(CODE[5]), STR_41(CODE[5]), 
;!		 -> STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[7]), STR_45(CODE[8]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[4]), 
;!		 -> STR_50(CODE[5]), STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[2]), STR_55(CODE[4]), STR_56(CODE[1]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[5]), STR_60(CODE[5]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[6]), STR_65(CODE[6]), 
;!		 -> STR_66(CODE[9]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!
;!    menu_handle_encoder@clock_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@clock_opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@clock_opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_34(CODE[9]), STR_35(CODE[8]), STR_36(CODE[1]), STR_37(CODE[1]), 
;!		 -> STR_38(CODE[1]), STR_39(CODE[9]), STR_40(CODE[5]), STR_41(CODE[5]), 
;!		 -> STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[7]), STR_45(CODE[8]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[4]), 
;!		 -> STR_50(CODE[5]), STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[2]), STR_55(CODE[4]), STR_56(CODE[1]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[5]), STR_60(CODE[5]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[6]), STR_65(CODE[6]), 
;!		 -> STR_66(CODE[9]), STR_67(CODE[1]), STR_68(CODE[1]), 
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
;!		 -> STR_34(CODE[9]), STR_35(CODE[8]), STR_36(CODE[1]), STR_37(CODE[1]), 
;!		 -> STR_38(CODE[1]), STR_39(CODE[9]), STR_40(CODE[5]), STR_41(CODE[5]), 
;!		 -> STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[7]), STR_45(CODE[8]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[4]), 
;!		 -> STR_50(CODE[5]), STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[2]), STR_55(CODE[4]), STR_56(CODE[1]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[5]), STR_60(CODE[5]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[6]), STR_65(CODE[6]), 
;!		 -> STR_66(CODE[9]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!
;!    menu_item_options$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_34(CODE[9]), STR_35(CODE[8]), STR_36(CODE[1]), STR_37(CODE[1]), 
;!		 -> STR_38(CODE[1]), STR_39(CODE[9]), STR_40(CODE[5]), STR_41(CODE[5]), 
;!		 -> STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[7]), STR_45(CODE[8]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[4]), 
;!		 -> STR_50(CODE[5]), STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[2]), STR_55(CODE[4]), STR_56(CODE[1]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[5]), STR_60(CODE[5]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[6]), STR_65(CODE[6]), 
;!		 -> STR_66(CODE[9]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!
;!    options_menu	PTR const unsigned char [5] size(2) Largest target is 13
;!		 -> STR_69(CODE[10]), STR_70(CODE[11]), STR_71(CODE[13]), STR_72(CODE[6]), 
;!		 -> STR_73(CODE[5]), 
;!
;!    pressure_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[8]), STR_101(CODE[11]), STR_102(CODE[8]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[6]), STR_109(CODE[10]), STR_110(CODE[11]), STR_111(CODE[9]), 
;!		 -> STR_112(CODE[12]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[8]), STR_118(CODE[10]), STR_119(CODE[8]), 
;!		 -> STR_120(CODE[5]), STR_74(CODE[7]), STR_75(CODE[7]), STR_76(CODE[10]), 
;!		 -> STR_77(CODE[11]), STR_78(CODE[12]), STR_79(CODE[9]), STR_80(CODE[13]), 
;!		 -> STR_81(CODE[6]), STR_82(CODE[6]), STR_83(CODE[9]), STR_84(CODE[8]), 
;!		 -> STR_85(CODE[8]), STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), 
;!		 -> STR_89(CODE[7]), STR_90(CODE[10]), STR_91(CODE[11]), STR_92(CODE[10]), 
;!		 -> STR_93(CODE[9]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[5]), 
;!
;!    pressure_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK3[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    rebuild_clock_menu$1441	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_220(CODE[8]), STR_221(CODE[9]), 
;!
;!    rebuild_clock_menu$1447	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_222(CODE[6]), STR_223(CODE[6]), STR_224(CODE[9]), 
;!
;!    rebuild_clock_menu$1448	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_223(CODE[6]), STR_224(CODE[9]), 
;!
;!    rebuild_input_menu$1221	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_133(CODE[8]), STR_134(CODE[9]), 
;!
;!    rebuild_input_menu$1235	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_143(CODE[6]), STR_144(CODE[6]), STR_145(CODE[9]), 
;!
;!    rebuild_input_menu$1236	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_144(CODE[6]), STR_145(CODE[9]), 
;!
;!    rebuild_input_menu$1242	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_146(CODE[6]), STR_147(CODE[6]), STR_148(CODE[9]), 
;!
;!    rebuild_input_menu$1243	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_147(CODE[6]), STR_148(CODE[9]), 
;!
;!    rebuild_input_menu$1249	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_149(CODE[6]), STR_150(CODE[6]), STR_151(CODE[9]), 
;!
;!    rebuild_input_menu$1250	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_150(CODE[6]), STR_151(CODE[9]), 
;!
;!    rebuild_input_menu$1254	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_152(CODE[5]), STR_153(CODE[5]), 
;!
;!    rebuild_input_menu$1268	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_159(CODE[6]), STR_160(CODE[6]), STR_161(CODE[9]), 
;!
;!    rebuild_input_menu$1269	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_160(CODE[6]), STR_161(CODE[9]), 
;!
;!    rebuild_input_menu$1273	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_162(CODE[5]), STR_163(CODE[5]), 
;!
;!    rebuild_input_menu$1278	PTR const unsigned char  size(2) Largest target is 8
;!		 -> STR_165(CODE[7]), STR_166(CODE[8]), 
;!
;!    rebuild_input_menu$1282	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_167(CODE[5]), STR_168(CODE[5]), 
;!
;!    rebuild_input_menu$1288	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_169(CODE[6]), STR_170(CODE[6]), STR_171(CODE[9]), 
;!
;!    rebuild_input_menu$1289	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_170(CODE[6]), STR_171(CODE[9]), 
;!
;!    rebuild_input_menu$1293	PTR const unsigned char  size(2) Largest target is 4
;!		 -> STR_172(CODE[2]), STR_173(CODE[4]), 
;!
;!    S903$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_34(CODE[9]), STR_35(CODE[8]), STR_36(CODE[1]), STR_37(CODE[1]), 
;!		 -> STR_38(CODE[1]), STR_39(CODE[9]), STR_40(CODE[5]), STR_41(CODE[5]), 
;!		 -> STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[7]), STR_45(CODE[8]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[4]), 
;!		 -> STR_50(CODE[5]), STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[2]), STR_55(CODE[4]), STR_56(CODE[1]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[5]), STR_60(CODE[5]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[6]), STR_65(CODE[6]), 
;!		 -> STR_66(CODE[9]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!
;!    S907$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[8]), STR_101(CODE[11]), STR_102(CODE[8]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[6]), STR_109(CODE[10]), STR_110(CODE[11]), STR_111(CODE[9]), 
;!		 -> STR_112(CODE[12]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[8]), STR_118(CODE[10]), STR_119(CODE[8]), 
;!		 -> STR_120(CODE[5]), STR_74(CODE[7]), STR_75(CODE[7]), STR_76(CODE[10]), 
;!		 -> STR_77(CODE[11]), STR_78(CODE[12]), STR_79(CODE[9]), STR_80(CODE[13]), 
;!		 -> STR_81(CODE[6]), STR_82(CODE[6]), STR_83(CODE[9]), STR_84(CODE[8]), 
;!		 -> STR_85(CODE[8]), STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), 
;!		 -> STR_89(CODE[7]), STR_90(CODE[10]), STR_91(CODE[11]), STR_92(CODE[10]), 
;!		 -> STR_93(CODE[9]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[5]), 
;!
;!    S907$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK3[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
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
;!		 -> clock_menu(BANK1[25]), input_config(BIGRAM[384]), input_menu(BANK3[75]), system_config(BANK4[128]), 
;!
;!    sp__strcpy	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK3[10]), 
;!		 -> value_back(BANK0[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK3[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 12
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), menu_item_options$option_count(CODE[1]), menu_update_time_value@value_buf(BANK0[6]), 
;!		 -> relay_high_edit_flag(COMRAM[1]), ?_sprintf(COMRAM[2]), sprintf@c(COMRAM[1]), STR_133(CODE[8]), 
;!		 -> STR_134(CODE[9]), STR_220(CODE[8]), STR_221(CODE[9]), STR_270(CODE[7]), 
;!		 -> STR_34(CODE[9]), STR_35(CODE[8]), STR_36(CODE[1]), STR_37(CODE[1]), 
;!		 -> STR_38(CODE[1]), STR_39(CODE[9]), STR_40(CODE[5]), STR_41(CODE[5]), 
;!		 -> STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[7]), STR_45(CODE[8]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[4]), 
;!		 -> STR_50(CODE[5]), STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[1]), 
;!		 -> STR_54(CODE[2]), STR_55(CODE[4]), STR_56(CODE[1]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[1]), STR_59(CODE[5]), STR_60(CODE[5]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[6]), STR_65(CODE[6]), 
;!		 -> STR_66(CODE[9]), STR_67(CODE[1]), STR_68(CODE[1]), value_back(BANK0[5]), 
;!		 -> value_clock_display(BANK4[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), value_enable(BANK3[10]), 
;!		 -> value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK3[10]), 
;!		 -> value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK3[10]), value_low_flow(BANK4[10]), 
;!		 -> value_low_flow_bp(BANK4[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), 
;!		 -> value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), value_scale4(BANK2[10]), 
;!		 -> value_sensor(BANK3[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 51
;!		 -> STR_1(CODE[48]), STR_121(CODE[35]), STR_123(CODE[45]), STR_124(CODE[25]), 
;!		 -> STR_125(CODE[3]), STR_126(CODE[51]), STR_127(CODE[27]), STR_132(CODE[3]), 
;!		 -> STR_136(CODE[6]), STR_137(CODE[6]), STR_138(CODE[5]), STR_139(CODE[10]), 
;!		 -> STR_140(CODE[5]), STR_141(CODE[10]), STR_142(CODE[10]), STR_155(CODE[6]), 
;!		 -> STR_156(CODE[6]), STR_157(CODE[3]), STR_158(CODE[10]), STR_17(CODE[35]), 
;!		 -> STR_174(CODE[6]), STR_175(CODE[6]), STR_176(CODE[5]), STR_177(CODE[10]), 
;!		 -> STR_179(CODE[10]), STR_18(CODE[23]), STR_180(CODE[48]), STR_182(CODE[29]), 
;!		 -> STR_183(CODE[7]), STR_184(CODE[9]), STR_19(CODE[17]), STR_194(CODE[9]), 
;!		 -> STR_218(CODE[35]), STR_219(CODE[3]), STR_225(CODE[10]), STR_227(CODE[46]), 
;!		 -> STR_228(CODE[29]), STR_234(CODE[37]), STR_235(CODE[23]), STR_236(CODE[32]), 
;!		 -> STR_237(CODE[37]), STR_238(CODE[28]), STR_239(CODE[35]), STR_240(CODE[26]), 
;!		 -> STR_241(CODE[20]), STR_242(CODE[25]), STR_243(CODE[28]), STR_244(CODE[26]), 
;!		 -> STR_245(CODE[10]), STR_246(CODE[10]), STR_247(CODE[32]), STR_248(CODE[42]), 
;!		 -> STR_249(CODE[26]), STR_250(CODE[10]), STR_252(CODE[6]), STR_253(CODE[6]), 
;!		 -> STR_254(CODE[5]), STR_255(CODE[5]), STR_256(CODE[6]), STR_257(CODE[6]), 
;!		 -> STR_258(CODE[5]), STR_259(CODE[6]), STR_260(CODE[6]), STR_261(CODE[5]), 
;!		 -> STR_262(CODE[38]), STR_263(CODE[32]), STR_3(CODE[27]), STR_6(CODE[39]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK2[50]), 
;!		 -> main@buf_640(BANK2[60]), main@buf_643(BANK2[40]), main@buf_670(BANK2[30]), menu_draw_input@title(BANK0[10]), 
;!		 -> menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1532(BANK1[50]), menu_handle_button@buf_1554(BANK1[50]), menu_handle_button@buf_1564(BANK1[50]), 
;!		 -> menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1496(BANK1[50]), menu_handle_encoder@buf_1499(BANK1[50]), menu_update_edit_value@value_buf(BANK0[10]), 
;!		 -> menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), 
;!		 -> trigger_relay_pulse@buf(BANK0[60]), value_back(BANK0[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK3[10]), 
;!		 -> value_display(BANK0[10]), value_enable(BANK3[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), 
;!		 -> value_flow_units(BANK4[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), 
;!		 -> value_highbp(BANK3[10]), value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK3[10]), 
;!		 -> value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), 
;!		 -> value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), 
;!		 -> value_scale20(BANK3[10]), value_scale4(BANK2[10]), value_sensor(BANK3[12]), value_slpbp(BANK3[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK3[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_196(CODE[1]), STR_265(CODE[8]), STR_266(CODE[6]), STR_267(CODE[6]), 
;!		 -> STR_268(CODE[5]), STR_34(CODE[9]), STR_35(CODE[8]), STR_36(CODE[1]), 
;!		 -> STR_37(CODE[1]), STR_38(CODE[1]), STR_39(CODE[9]), STR_40(CODE[5]), 
;!		 -> STR_41(CODE[5]), STR_42(CODE[1]), STR_43(CODE[1]), STR_44(CODE[7]), 
;!		 -> STR_45(CODE[8]), STR_46(CODE[1]), STR_47(CODE[1]), STR_48(CODE[1]), 
;!		 -> STR_49(CODE[4]), STR_50(CODE[5]), STR_51(CODE[1]), STR_52(CODE[1]), 
;!		 -> STR_53(CODE[1]), STR_54(CODE[2]), STR_55(CODE[4]), STR_56(CODE[1]), 
;!		 -> STR_57(CODE[1]), STR_58(CODE[1]), STR_59(CODE[5]), STR_60(CODE[5]), 
;!		 -> STR_61(CODE[1]), STR_62(CODE[1]), STR_63(CODE[1]), STR_64(CODE[6]), 
;!		 -> STR_65(CODE[6]), STR_66(CODE[9]), STR_67(CODE[1]), STR_68(CODE[1]), 
;!
;!    strcpy@cp	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK3[10]), 
;!		 -> value_back(BANK0[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK3[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 12
;!		 -> menu_update_edit_value@value_buf(BANK0[10]), STR_135(CODE[9]), STR_143(CODE[6]), STR_144(CODE[6]), 
;!		 -> STR_145(CODE[9]), STR_146(CODE[6]), STR_147(CODE[6]), STR_148(CODE[9]), 
;!		 -> STR_149(CODE[6]), STR_150(CODE[6]), STR_151(CODE[9]), STR_152(CODE[5]), 
;!		 -> STR_153(CODE[5]), STR_154(CODE[5]), STR_159(CODE[6]), STR_160(CODE[6]), 
;!		 -> STR_161(CODE[9]), STR_162(CODE[5]), STR_163(CODE[5]), STR_164(CODE[5]), 
;!		 -> STR_165(CODE[7]), STR_166(CODE[8]), STR_167(CODE[5]), STR_168(CODE[5]), 
;!		 -> STR_169(CODE[6]), STR_170(CODE[6]), STR_171(CODE[9]), STR_172(CODE[2]), 
;!		 -> STR_173(CODE[4]), STR_178(CODE[4]), STR_195(CODE[6]), STR_222(CODE[6]), 
;!		 -> STR_223(CODE[6]), STR_224(CODE[9]), STR_226(CODE[5]), STR_34(CODE[9]), 
;!		 -> STR_35(CODE[8]), STR_36(CODE[1]), STR_37(CODE[1]), STR_38(CODE[1]), 
;!		 -> STR_39(CODE[9]), STR_40(CODE[5]), STR_41(CODE[5]), STR_42(CODE[1]), 
;!		 -> STR_43(CODE[1]), STR_44(CODE[7]), STR_45(CODE[8]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[4]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[1]), STR_54(CODE[2]), 
;!		 -> STR_55(CODE[4]), STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[1]), 
;!		 -> STR_59(CODE[5]), STR_60(CODE[5]), STR_61(CODE[1]), STR_62(CODE[1]), 
;!		 -> STR_63(CODE[1]), STR_64(CODE[6]), STR_65(CODE[6]), STR_66(CODE[9]), 
;!		 -> STR_67(CODE[1]), STR_68(CODE[1]), value_back(BANK0[5]), value_clock_display(BANK4[10]), 
;!		 -> value_clock_enable(BANK3[10]), value_display(BANK0[10]), value_enable(BANK3[10]), value_end_runtime(BANK3[10]), 
;!		 -> value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK3[10]), value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), 
;!		 -> value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), 
;!		 -> value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), 
;!		 -> value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), value_scale4(BANK2[10]), value_sensor(BANK3[12]), 
;!		 -> value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strcpy@to	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK3[10]), 
;!		 -> value_back(BANK0[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK3[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strlen@cp	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_34(CODE[9]), 
;!		 -> STR_35(CODE[8]), STR_36(CODE[1]), STR_37(CODE[1]), STR_38(CODE[1]), 
;!		 -> STR_39(CODE[9]), STR_40(CODE[5]), STR_41(CODE[5]), STR_42(CODE[1]), 
;!		 -> STR_43(CODE[1]), STR_44(CODE[7]), STR_45(CODE[8]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[4]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[1]), STR_54(CODE[2]), 
;!		 -> STR_55(CODE[4]), STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[1]), 
;!		 -> STR_59(CODE[5]), STR_60(CODE[5]), STR_61(CODE[1]), STR_62(CODE[1]), 
;!		 -> STR_63(CODE[1]), STR_64(CODE[6]), STR_65(CODE[6]), STR_66(CODE[9]), 
;!		 -> STR_67(CODE[1]), STR_68(CODE[1]), value_back(BANK0[5]), value_clock_display(BANK4[10]), 
;!		 -> value_clock_enable(BANK3[10]), value_display(BANK0[10]), value_enable(BANK3[10]), value_end_runtime(BANK3[10]), 
;!		 -> value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK3[10]), value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), 
;!		 -> value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), 
;!		 -> value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), 
;!		 -> value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), value_scale4(BANK2[10]), value_sensor(BANK3[12]), 
;!		 -> value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strlen@s	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_34(CODE[9]), 
;!		 -> STR_35(CODE[8]), STR_36(CODE[1]), STR_37(CODE[1]), STR_38(CODE[1]), 
;!		 -> STR_39(CODE[9]), STR_40(CODE[5]), STR_41(CODE[5]), STR_42(CODE[1]), 
;!		 -> STR_43(CODE[1]), STR_44(CODE[7]), STR_45(CODE[8]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[1]), STR_49(CODE[4]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[1]), STR_54(CODE[2]), 
;!		 -> STR_55(CODE[4]), STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[1]), 
;!		 -> STR_59(CODE[5]), STR_60(CODE[5]), STR_61(CODE[1]), STR_62(CODE[1]), 
;!		 -> STR_63(CODE[1]), STR_64(CODE[6]), STR_65(CODE[6]), STR_66(CODE[9]), 
;!		 -> STR_67(CODE[1]), STR_68(CODE[1]), value_back(BANK0[5]), value_clock_display(BANK4[10]), 
;!		 -> value_clock_enable(BANK3[10]), value_display(BANK0[10]), value_enable(BANK3[10]), value_end_runtime(BANK3[10]), 
;!		 -> value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK3[10]), value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), 
;!		 -> value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), 
;!		 -> value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), 
;!		 -> value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), value_scale4(BANK2[10]), value_sensor(BANK3[12]), 
;!		 -> value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    temp_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[8]), STR_101(CODE[11]), STR_102(CODE[8]), STR_103(CODE[8]), 
;!		 -> STR_104(CODE[5]), STR_105(CODE[7]), STR_106(CODE[7]), STR_107(CODE[5]), 
;!		 -> STR_108(CODE[6]), STR_109(CODE[10]), STR_110(CODE[11]), STR_111(CODE[9]), 
;!		 -> STR_112(CODE[12]), STR_113(CODE[8]), STR_114(CODE[8]), STR_115(CODE[5]), 
;!		 -> STR_116(CODE[7]), STR_117(CODE[8]), STR_118(CODE[10]), STR_119(CODE[8]), 
;!		 -> STR_120(CODE[5]), STR_74(CODE[7]), STR_75(CODE[7]), STR_76(CODE[10]), 
;!		 -> STR_77(CODE[11]), STR_78(CODE[12]), STR_79(CODE[9]), STR_80(CODE[13]), 
;!		 -> STR_81(CODE[6]), STR_82(CODE[6]), STR_83(CODE[9]), STR_84(CODE[8]), 
;!		 -> STR_85(CODE[8]), STR_86(CODE[8]), STR_87(CODE[5]), STR_88(CODE[7]), 
;!		 -> STR_89(CODE[7]), STR_90(CODE[10]), STR_91(CODE[11]), STR_92(CODE[10]), 
;!		 -> STR_93(CODE[9]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[5]), 
;!
;!    temp_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK3[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK2[50]), 
;!		 -> main@buf_640(BANK2[60]), main@buf_643(BANK2[40]), main@buf_670(BANK2[30]), menu_handle_button@buf(BANK1[50]), 
;!		 -> menu_handle_button@buf_1532(BANK1[50]), menu_handle_button@buf_1554(BANK1[50]), menu_handle_button@buf_1564(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1496(BANK1[50]), menu_handle_encoder@buf_1499(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), 
;!		 -> rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), STR_11(CODE[22]), STR_12(CODE[19]), 
;!		 -> STR_122(CODE[29]), STR_13(CODE[24]), STR_14(CODE[22]), STR_15(CODE[22]), 
;!		 -> STR_16(CODE[19]), STR_181(CODE[31]), STR_2(CODE[42]), STR_20(CODE[20]), 
;!		 -> STR_21(CODE[15]), STR_22(CODE[26]), STR_25(CODE[22]), STR_251(CODE[27]), 
;!		 -> STR_26(CODE[20]), STR_264(CODE[25]), STR_269(CODE[20]), STR_27(CODE[21]), 
;!		 -> STR_28(CODE[33]), STR_31(CODE[36]), STR_32(CODE[20]), STR_33(CODE[21]), 
;!		 -> STR_4(CODE[29]), STR_5(CODE[23]), STR_7(CODE[28]), STR_8(CODE[23]), 
;!		 -> trigger_relay_pulse@buf(BANK0[60]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK2[50]), 
;!		 -> main@buf_640(BANK2[60]), main@buf_643(BANK2[40]), main@buf_670(BANK2[30]), menu_handle_button@buf(BANK1[50]), 
;!		 -> menu_handle_button@buf_1532(BANK1[50]), menu_handle_button@buf_1554(BANK1[50]), menu_handle_button@buf_1564(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1496(BANK1[50]), menu_handle_encoder@buf_1499(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), 
;!		 -> rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), STR_11(CODE[22]), STR_12(CODE[19]), 
;!		 -> STR_122(CODE[29]), STR_13(CODE[24]), STR_14(CODE[22]), STR_15(CODE[22]), 
;!		 -> STR_16(CODE[19]), STR_181(CODE[31]), STR_2(CODE[42]), STR_20(CODE[20]), 
;!		 -> STR_21(CODE[15]), STR_22(CODE[26]), STR_25(CODE[22]), STR_251(CODE[27]), 
;!		 -> STR_26(CODE[20]), STR_264(CODE[25]), STR_269(CODE[20]), STR_27(CODE[21]), 
;!		 -> STR_28(CODE[33]), STR_31(CODE[36]), STR_32(CODE[20]), STR_33(CODE[21]), 
;!		 -> STR_4(CODE[29]), STR_5(CODE[23]), STR_7(CODE[28]), STR_8(CODE[23]), 
;!		 -> trigger_relay_pulse@buf(BANK0[60]), 
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
;! (0) _main                                               188   188      0 1020828
;!                                             70 COMRAM     2     2      0
;!                                              0 BANK2    186   186      0
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
;! (1) _menu_update_numeric_value                           28    28      0    9309
;!                                             20 COMRAM    28    28      0
;!                   _is_numeric_field
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_edit_value                              31    31      0   37361
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
;! (1) _menu_handle_encoder                                172   170      2  290107
;!                                             62 COMRAM     8     6      2
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
;! (2) _handle_time_rotation                                53    53      0   26250
;!                                              0 BANK0     53    53      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _handle_numeric_rotation                             57    57      0   26603
;!                                              0 BANK0     57    57      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                 235   235      0  386614
;!                                             62 COMRAM     5     5      0
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
;! (2) _trigger_relay_pulse                                 61    61      0   26182
;!                                              0 BANK0     61    61      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_input_menu                                  90    90      0   41361
;!                                             57 COMRAM     1     1      0
;!                                              0 BANK0     89    89      0
;!                            ___lwdiv
;!                            ___lwmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_clock_menu                                  58    58      0   35190
;!                                             57 COMRAM     2     2      0
;!                                              0 BANK0     56    56      0
;!                            ___lbdiv
;!                            ___lbmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_time_value                             111   111      0   64289
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
;! (2) _menu_draw_clock                                     32    32      0   28761
;!                                             24 COMRAM    32    32      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (2) ___lbmod                                              4     3      1     463
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) ___lbdiv                                              4     3      1     466
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_setup                                     23    23      0   21736
;!                                             24 COMRAM    23    23      0
;!                          _lcd_clear
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_options                                    2     2      0   21142
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
;! (2) _menu_draw_input                                     51    51      0   59403
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
;! (3) _strlen                                               4     2      2     670
;!                                             14 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (3) _strcpy                                               6     2      4    6229
;!                                             14 COMRAM     6     2      4
;! ---------------------------------------------------------------------------------
;! (3) _strcmp                                               7     3      4    1003
;!                                             14 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (3) _lcd_print_at                                         4     1      3    7990
;!                                             20 COMRAM     4     1      3
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_clear_line                                       1     1      0    6308
;!                                             20 COMRAM     1     1      0
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_set_cursor                                       3     2      1    2516
;!                                             17 COMRAM     3     2      1
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (4) _lcd_print                                            2     0      2    3761
;!                                             16 COMRAM     2     0      2
;!                           _lcd_data
;! ---------------------------------------------------------------------------------
;! (5) _lcd_data                                             1     1      0     186
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
;! (2) _init_time_editor                                    63    60      3   31569
;!                                             57 COMRAM     3     0      3
;!                                              0 BANK0     60    60      0
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    4582
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
;! (1) _sprintf                                             35    23     12   21342
;!                                             26 COMRAM    31    19     12
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
;! (2) _beep                                                 5     3      2    1870
;!                                             14 COMRAM     5     3      2
;! ---------------------------------------------------------------------------------
;! (1) _lcd_init                                             2     2      0     372
;!                                             17 COMRAM     2     2      0
;!                            _lcd_cmd
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (4) _lcd_cmd                                              2     2      0     248
;!                                             15 COMRAM     2     2      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (5) _lcd_write_nibble                                     1     1      0     124
;!                                             14 COMRAM     1     1      0
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
;!BANK4              100      0      DA      13       85.2%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100      0      F7      11       96.5%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100     BA      F9       9       97.3%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100     E6      FF       7       99.6%
;!BITBANK15           80      0       0      34        0.0%
;!BANK15              80      0       0      35        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80     6E      7E       5       98.4%
;!BITCOMRAM           7E      0       0       0        0.0%
;!COMRAM              7E     48      68       1       82.5%
;!BITBIGSFRhhhhlh     1A      0       0      37        0.0%
;!BITBIGSFRhhhlh      11      0       0      39        0.0%
;!BITBIGSFRhhhhh       D      0       0      36        0.0%
;!BITBIGSFRhlhll       A      0       0      43        0.0%
;!BITBIGSFRhhhll       8      0       0      40        0.0%
;!BITBIGSFRhhlh        7      0       0      41        0.0%
;!BITBIGSFRll          7      0       0      46        0.0%
;!BITBIGSFRlh          6      0       0      45        0.0%
;!BITBIGSFRhll         6      0       0      44        0.0%
;!BITBIGSFRhhhhll      1      0       0      38        0.0%
;!BITBIGSFRhhll        1      0       0      42        0.0%
;!BIGSFR               0      0       0     200        0.0%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0     4AF      47        0.0%
;!DATA                 0      0     62F       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 294 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            30  150[BANK2 ] unsigned char [30]
;;  current_even    1  183[BANK2 ] unsigned char 
;;  buf            40  110[BANK2 ] unsigned char [40]
;;  delta           2  184[BANK2 ] int 
;;  buf            60    0[BANK2 ] unsigned char [60]
;;  buf            50   60[BANK2 ] unsigned char [50]
;;  last_encoder    2  181[BANK2 ] int 
;;  last_button     1  180[BANK2 ] unsigned char 
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
;;      Locals:         0       0       0     186       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0     186       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      188 bytes
;; Hardware stack levels required when called: 9
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
	line	294
global __ptext0
__ptext0:
psect	text0
	file	"src\main.c"
	line	294
	
_main:
;incstack = 0
	callstack 22
	line	297
	
l11604:
	call	_system_init	;wreg free
	line	299
	
l11606:
	call	_eeprom_init	;wreg free
	line	306
	
l11608:; BSR set to: 4

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
	line	308
	
l11610:
	call	_uart_init	;wreg free
	line	310
	
l11612:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	312
	
l11614:
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
	line	313
	
l11616:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	315
	
l11618:
	call	_encoder_init	;wreg free
	line	316
	
l11620:
	call	_menu_init	;wreg free
	line	317
	
l11622:; BSR set to: 2

	call	_lcd_init	;wreg free
	line	319
	
l11624:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	320
	
l11626:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	322
	
l11628:
	call	_lcd_clear	;wreg free
	line	323
	
l11630:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	324
	
l11632:
		movlw	low(STR_9)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	325
	
l11634:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	326
	
l11636:
		movlw	low(STR_10)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	328
	
l11638:
		movlw	low(STR_11)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_11)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	329
	
l11640:
		movlw	low(STR_12)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_12)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	330
	
l11642:
		movlw	low(STR_13)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_13)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	332
	
l11644:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	333
	
l11646:
	asmopt push
asmopt off
movlw  5
movwf	(??_main+0+0+1)^00h,c
movlw	15
movwf	(??_main+0+0)^00h,c
	movlw	241
u16287:
decfsz	wreg,f
	bra	u16287
	decfsz	(??_main+0+0)^00h,c,f
	bra	u16287
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u16287
	nop
asmopt pop

	line	334
	
l11648:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	336
	
l11650:
		movlw	low(STR_14)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_14)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	337
	
l11652:
		movlw	low(STR_15)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	339
	
l11654:
	asmopt push
asmopt off
movlw  41
movwf	(??_main+0+0+1)^00h,c
movlw	150
movwf	(??_main+0+0)^00h,c
	movlw	127
u16297:
decfsz	wreg,f
	bra	u16297
	decfsz	(??_main+0+0)^00h,c,f
	bra	u16297
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u16297
	nop
asmopt pop

	line	343
	
l11656:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	344
	
l11658:; BSR set to: 2

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	346
	
l11660:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	347
	
l11662:
		movlw	low(STR_16)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_16)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	350
	
l11664:
	movlw	high(0)
	movlb	2	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	351
	
l11666:; BSR set to: 2

	movlw	low(0)
	movwf	((main@last_button))&0ffh
	line	366
	
l11668:
	movlb	2	; () banked
	movf	((main@last_relay_state))&0ffh,w
	movlb	0	; () banked
xorwf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u15841
	goto	u15840

u15841:
	goto	l11672
u15840:
	
l11670:; BSR set to: 0

	movlb	2	; () banked
	movf	((main@last_relay_counter))&0ffh,w
xorwf	((_relay_counter))&0ffh,w	;volatile
	bnz	u15850
movf	((main@last_relay_counter+1))&0ffh,w
xorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u15851
	goto	u15850

u15851:
	goto	l11680
u15850:
	line	369
	
l11672:
		movlw	low(main@buf_640)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_640)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_17)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_17)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_relay_state),0+((c:?_sprintf)+04h)	;volatile
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_relay_counter),0+((c:?_sprintf)+06h)	;volatile
	movff	(_relay_counter+1),1+((c:?_sprintf)+06h)	;volatile
	call	_sprintf	;wreg free
	line	370
	
l11674:
		movlw	low(main@buf_640)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_640)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	371
	
l11676:
	movff	(_relay_state),(main@last_relay_state)	;volatile
	line	372
	
l11678:
	movff	(_relay_counter),(main@last_relay_counter)	;volatile
	movff	(_relay_counter+1),(main@last_relay_counter+1)	;volatile
	line	376
	
l11680:
	movlb	2	; () banked
	movf	((main@last_encoder))&0ffh,w
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u15860
movf	((main@last_encoder+1))&0ffh,w
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u15861
	goto	u15860

u15861:
	goto	l11738
u15860:
	line	378
	
l11682:; BSR set to: 2

	movf	((main@last_encoder))&0ffh,w
	subwf	((_encoder_count))&0ffh,w	;volatile
	movwf	((main@delta))&0ffh
	movf	((main@last_encoder+1))&0ffh,w
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movwf	1+((main@delta))&0ffh
	line	381
	
l11684:; BSR set to: 2

	movlw	high(01h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	384
	
l11686:
		movlw	low(main@buf_643)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_643)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_18)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_18)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_encoder_count),0+((c:?_sprintf)+04h)	;volatile
	movff	(_encoder_count+1),1+((c:?_sprintf)+04h)	;volatile
	movff	(main@delta),0+((c:?_sprintf)+06h)
	movff	(main@delta+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	385
	
l11688:
		movlw	low(main@buf_643)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_643)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	387
	
l11690:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	390
	
l11692:
	movlw	high(01F4h)
	movlb	2	; () banked
	movwf	((main@encoder_activity_timer+1))&0ffh
	movlw	low(01F4h)
	movwf	((main@encoder_activity_timer))&0ffh
	line	393
	
l11694:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15871
	goto	u15870
u15871:
	goto	l221
u15870:
	line	395
	
l11696:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	396
	
l221:; BSR set to: 2

	line	399
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15881
	goto	u15880
u15881:
	goto	l11708
u15880:
	
l11698:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15891
	goto	u15890

u15891:
	goto	l11708
u15890:
	line	401
	
l11700:; BSR set to: 2

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
	goto	u15901
	goto	u15900
u15901:
	goto	l11704
u15900:
	line	404
	
l11702:
	movlb	2	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_numeric_rotation
	line	405
	goto	l11712
	line	406
	
l11704:
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
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u15911
	goto	u15910
u15911:
	goto	l11708
u15910:
	line	409
	
l11706:
	movlb	2	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_time_rotation
	line	410
	call	_menu_update_time_value	;wreg free
	line	411
	goto	l11712
	line	415
	
l11708:
	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	line	425
	
l11712:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15921
	goto	u15920
u15921:
	goto	l11726
u15920:
	
l11714:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15931
	goto	u15930

u15931:
	goto	l11726
u15930:
	line	428
	
l11716:; BSR set to: 2

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
	goto	u15941
	goto	u15940
u15941:
	goto	l11720
u15940:
	line	431
	
l11718:
	call	_menu_update_numeric_value	;wreg free
	line	432
	goto	l11738
	line	433
	
l11720:
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
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u15951
	goto	u15950
u15951:
	goto	l11724
u15950:
	line	436
	
l11722:
	call	_menu_update_time_value	;wreg free
	line	437
	goto	l11738
	line	441
	
l11724:
	call	_menu_update_edit_value	;wreg free
	goto	l11738
	line	447
	
l11726:; BSR set to: 2

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15961
	goto	u15960
u15961:
	goto	l11730
u15960:
	line	449
	
l11728:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	450
	goto	l11738
	line	451
	
l11730:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15971
	goto	u15970

u15971:
	goto	l11734
u15970:
	line	453
	
l11732:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	line	454
	goto	l11738
	line	455
	
l11734:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15981
	goto	u15980

u15981:
	goto	l11738
u15980:
	line	457
	
l11736:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	463
	
l11738:
	movlb	2	; () banked
	movf	((main@last_button))&0ffh,w
xorwf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u15991
	goto	u15990

u15991:
	goto	l11814
u15990:
	line	465
	
l11740:; BSR set to: 2

	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u16001
	goto	u16000
u16001:
	goto	l11810
u16000:
	line	467
	
l11742:; BSR set to: 2

	movff	(_button_event),(main@current_event)	;volatile
	line	468
	
l11744:; BSR set to: 2

	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	471
	
l11746:; BSR set to: 2

		movlw	low(main@buf_670)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_670)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_19)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_19)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@current_event),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	472
	
l11748:
		movlw	low(main@buf_670)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_670)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	475
	
l11750:
		movlw	2
	movlb	2	; () banked
	xorwf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u16011
	goto	u16010

u16011:
	goto	l11786
u16010:
	line	477
	
l11752:; BSR set to: 2

		movlw	low(STR_20)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_20)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	480
	
l11754:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u16021
	goto	u16020
u16021:
	goto	l11768
u16020:
	line	483
	
l11756:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	484
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	485
	movlw	low(0)
	movwf	(0+(_menu+08h))&0ffh
	line	489
	
l11758:; BSR set to: 2

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
	line	490
	
l11760:; BSR set to: 2

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
	line	492
	
l11762:; BSR set to: 2

		movlw	low(STR_21)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_21)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	495
	
l11764:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16031
	goto	u16030

u16031:
	goto	l11810
u16030:
	line	496
	
l11766:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	goto	l11810
	line	502
	
l11768:; BSR set to: 2

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16041
	goto	u16040
u16041:
	goto	l11774
u16040:
	line	504
	
l11770:; BSR set to: 2

	setf	((_current_menu))&0ffh
	line	505
	
l11772:; BSR set to: 2

		movlw	low(STR_22)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_22)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	506
	goto	l11810
	line	507
	
l11774:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16051
	goto	u16050

u16051:
	goto	l11780
u16050:
	line	509
	
l11776:; BSR set to: 2

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	510
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	511
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	512
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	513
	
l11778:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	514
	goto	l11810
	line	515
	
l11780:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16061
	goto	u16060

u16061:
	goto	l252
u16060:
	line	517
	
l11782:; BSR set to: 2

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	518
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	519
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	520
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	521
	
l11784:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	goto	l11810
	line	526
	
l11786:; BSR set to: 2

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16071
	goto	u16070

u16071:
	goto	l11796
u16070:
	line	528
	
l11788:; BSR set to: 2

		decf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u16081
	goto	u16080

u16081:
	goto	l11810
u16080:
	line	530
	
l11790:; BSR set to: 2

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	531
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	532
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	533
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	534
	
l11792:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	535
	
l11794:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l11810
	line	541
	
l11796:; BSR set to: 2

	movf	((main@current_event))&0ffh,w
	
	call	_menu_handle_button
	line	544
	
l11798:
	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16091
	goto	u16090
u16091:
	goto	l11802
u16090:
	goto	l11784
	line	546
	
l11802:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16101
	goto	u16100

u16101:
	goto	l11806
u16100:
	goto	l11766
	line	548
	
l11806:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16111
	goto	u16110

u16111:
	goto	l252
u16110:
	goto	l11778
	line	550
	
l252:; BSR set to: 2

	line	552
	
l11810:
	movff	(_button_event),(main@last_button)	;volatile
	line	553
	
l11812:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	558
	
l11814:; BSR set to: 2

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16121
	goto	u16120

u16121:
	goto	l11830
u16120:
	
l11816:; BSR set to: 2

		incf	((main@last_menu_state))&0ffh,w
	btfsc	status,2
	goto	u16131
	goto	u16130

u16131:
	goto	l11830
u16130:
	line	561
	
l11818:; BSR set to: 2

	call	_lcd_clear	;wreg free
	line	562
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	563
	
l11820:
		movlw	low(STR_23)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_23)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	564
	
l11822:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	565
		movlw	low(STR_24)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_24)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	566
		movlw	low(STR_25)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_25)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	568
		movlw	low(STR_26)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_26)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	569
	
l11824:
	call	_save_current_config	;wreg free
	line	570
	
l11826:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	571
	
l11828:; BSR set to: 2

		movlw	low(STR_27)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_27)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	573
	
l11830:
	movff	(_current_menu),(main@last_menu_state)
	line	576
	
l11832:
	movlb	2	; () banked
	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfsc	status,2
	goto	u16141
	goto	u16140

u16141:
	goto	l11836
u16140:
	line	578
	
l11834:; BSR set to: 2

	decf	((main@encoder_activity_timer))&0ffh
	btfss	status,0
	decf	((main@encoder_activity_timer+1))&0ffh
	line	582
	
l11836:; BSR set to: 2

	movlw	low(01h)
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	583
	
l11838:; BSR set to: 2

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	bnz	u16150
	movlw	16
	subwf	 ((main@blink_timer))&0ffh,w
	movlw	39
	subwfb	((main@blink_timer+1))&0ffh,w
	btfss	status,0
	goto	u16151
	goto	u16150

u16151:
	goto	l11872
u16150:
	line	585
	
l11840:; BSR set to: 2

	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	586
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u16161
	goto	u16160
u16161:
	goto	l11870
u16160:
	line	589
	
l11842:; BSR set to: 2

	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfss	status,2
	goto	u16171
	goto	u16170

u16171:
	goto	l11872
u16170:
	line	591
	
l11844:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u16181
	goto	u16180
u16181:
	movlw	1
	goto	u16190
u16180:
	movlw	0
u16190:
	movwf	(0+(_menu+05h))&0ffh
	line	595
	goto	l11868
	line	598
	
l11846:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	599
	goto	l11872
	line	603
	
l11848:; BSR set to: 2

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
	goto	u16201
	goto	u16200
u16201:
	goto	l11852
u16200:
	line	605
	
l11850:
	call	_menu_update_numeric_value	;wreg free
	line	606
	goto	l11872
	line	607
	
l11852:
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
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u16211
	goto	u16210
u16211:
	goto	l11856
u16210:
	line	609
	
l11854:
	call	_menu_update_time_value	;wreg free
	line	610
	goto	l11872
	line	614
	
l11856:
	call	_menu_draw_input	;wreg free
	goto	l11872
	line	619
	
l11858:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	620
	goto	l11872
	line	622
	
l11860:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16221
	goto	u16220

u16221:
	goto	l11864
u16220:
	goto	l11854
	line	628
	
l11864:; BSR set to: 2

	call	_menu_draw_clock	;wreg free
	goto	l11872
	line	595
	
l11868:; BSR set to: 2

	movf	((_current_menu))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l11846
	xorlw	1^0	; case 1
	skipnz
	goto	l11848
	xorlw	2^1	; case 2
	skipnz
	goto	l11858
	xorlw	3^2	; case 3
	skipnz
	goto	l11860
	goto	l11872

	line	636
	
l11870:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	650
	
l11872:
		movlw	03h-0
	movlb	2	; () banked
	cpfslt	((_current_menu))&0ffh
	goto	u16231
	goto	u16230

u16231:
	goto	l11906
u16230:
	line	652
	
l11874:; BSR set to: 2

	movf	((_menu_timeout_flag))&0ffh,w	;volatile
	btfss	status,2
	goto	u16241
	goto	u16240
u16241:
	goto	l11906
u16240:
	line	654
	
l11876:; BSR set to: 2

		movlw	low(STR_28)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_28)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	657
	
l11878:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	658
	
l11880:
	asmopt push
asmopt off
movlw  3
movwf	(??_main+0+0+1)^00h,c
movlw	8
movwf	(??_main+0+0)^00h,c
	movlw	119
u16307:
decfsz	wreg,f
	bra	u16307
	decfsz	(??_main+0+0)^00h,c,f
	bra	u16307
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u16307
	nop
asmopt pop

	line	659
	
l11882:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	662
	
l11884:
	movlb	2	; () banked
	setf	((_current_menu))&0ffh
	line	663
	
l11886:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	664
	
l11888:; BSR set to: 2

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	665
	
l11890:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	668
	
l11892:; BSR set to: 2

	call	_lcd_clear	;wreg free
	line	669
	
l11894:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	670
	
l11896:
		movlw	low(STR_29)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_29)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	671
	
l11898:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	672
	
l11900:
		movlw	low(STR_30)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_30)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	675
	
l11902:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	676
	
l11904:; BSR set to: 2

	movlw	high(0)
	movwf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_menu_timeout_timer))^00h,c	;volatile
	line	681
	
l11906:; BSR set to: 2

	movf	((_long_press_beep_flag))&0ffh,w	;volatile
	btfsc	status,2
	goto	u16251
	goto	u16250
u16251:
	goto	l11914
u16250:
	line	683
	
l11908:; BSR set to: 2

	movlw	low(0)
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	line	684
	
l11910:; BSR set to: 2

	movlw	high(01F4h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01F4h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	685
	
l11912:
		movlw	low(STR_31)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_31)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	690
	
l11914:
	movlb	2	; () banked
	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u16261
	goto	u16260
u16261:
	goto	l11926
u16260:
	
l11916:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u16271
	goto	u16270
u16271:
	goto	l11926
u16270:
	line	692
	
l11918:; BSR set to: 2

		movlw	low(STR_32)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_32)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	693
	
l11920:
	call	_save_current_config	;wreg free
	line	694
	
l11922:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	695
	
l11924:; BSR set to: 2

		movlw	low(STR_33)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_33)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	700
	
l11926:
	asmopt push
asmopt off
	movlw	133
u16317:
decfsz	wreg,f
	bra	u16317
	nop
asmopt pop

	goto	l11668
	global	start
	goto	start
	callstack 0
	line	702
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_uart_init

;; *************** function _uart_init *****************
;; Defined at:
;;		line 49 in file "src\main.c"
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
	line	49
global __ptext1
__ptext1:
psect	text1
	file	"src\main.c"
	line	49
	
_uart_init:
;incstack = 0
	callstack 28
	line	51
	
l7610:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	52
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	54
	
l7612:
	movlw	low(024h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	55
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	56
	movlw	low(08h)
	movwf	((c:4024))^0f00h,c	;volatile
	line	58
	movlw	low(044h)
	movwf	((c:4015))^0f00h,c	;volatile
	line	59
	movlw	low(0)
	movwf	((c:4016))^0f00h,c	;volatile
	line	60
	
l115:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
	signat	_uart_init,89
	global	_system_init

;; *************** function _system_init *****************
;; Defined at:
;;		line 85 in file "src\main.c"
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
	line	85
global __ptext2
__ptext2:
psect	text2
	file	"src\main.c"
	line	85
	
_system_init:
;incstack = 0
	callstack 28
	line	87
	
l7614:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	88
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	91
	
l133:
	line	90
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u8851
	goto	u8850
u8851:
	goto	l133
u8850:
	line	93
	
l7616:
	movlw	low(0Fh)
	movwf	((c:4033))^0f00h,c	;volatile
	line	95
	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	96
	movlw	low(0)
	movwf	((c:3978))^0f00h,c	;volatile
	line	97
	movlw	low(0)
	movwf	((c:3979))^0f00h,c	;volatile
	line	99
	
l7618:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	100
	
l7620:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	102
	
l7622:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	103
	
l7624:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	104
	
l7626:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	105
	
l7628:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	107
	
l7630:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	108
	
l7632:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	111
	
l7634:
	bcf	((c:3988))^0f00h,c,1	;volatile
	line	112
	
l7636:
	bsf	((c:3979))^0f00h,c,1	;volatile
	line	113
	
l136:
	return	;funcret
	callstack 0
GLOBAL	__end_of_system_init
	__end_of_system_init:
	signat	_system_init,89
	global	_menu_update_numeric_value

;; *************** function _menu_update_numeric_value *****************
;; Defined at:
;;		line 1007 in file "src\menu.c"
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
psect	text3,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1007
global __ptext3
__ptext3:
psect	text3
	file	"src\menu.c"
	line	1007
	
_menu_update_numeric_value:
;incstack = 0
	callstack 25
	line	1010
	
l10778:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14181
	goto	u14180

u14181:
	goto	l838
u14180:
	
l10780:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u14191
	goto	u14190
u14191:
	goto	l10782
u14190:
	goto	l838
	line	1014
	
l10782:; BSR set to: 2

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((c:menu_update_numeric_value@screen_line))^00h,c
	line	1015
		movlw	03h-1
	cpfsgt	((c:menu_update_numeric_value@screen_line))^00h,c
	goto	u14201
	goto	u14200

u14201:
	goto	l10786
u14200:
	goto	l838
	line	1020
	
l10786:; BSR set to: 2

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
	
l10788:; BSR set to: 2

	movff	(c:menu_update_numeric_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(c:menu_update_numeric_value@flow_type),(c:is_numeric_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u14211
	goto	u14210
u14211:
	goto	l10792
u14210:
	goto	l838
	line	1028
	
l10792:
	lfsr	2,(menu_update_numeric_value@value_buf)
	movlw	6-1
u14221:
	clrf	postinc2
	decf	wreg
	bc	u14221
	line	1030
	
l10794:
	movlb	2	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u14231
	goto	u14230
u14231:
	goto	l10826
u14230:
	line	1033
	
l10796:; BSR set to: 2

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14241
	goto	u14240

u14241:
	goto	l10800
u14240:
	
l10798:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14251
	goto	u14250
u14251:
	goto	l10802
u14250:
	
l10800:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1343))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1343))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1343))^00h,c
	goto	l10804
	
l10802:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1343+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1343))^00h,c
	
l10804:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1343),(c:menu_update_numeric_value@value_buf)
	line	1034
	
l10806:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14261
	goto	u14260

u14261:
	goto	l10810
u14260:
	
l10808:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14271
	goto	u14270
u14271:
	goto	l10812
u14270:
	
l10810:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1344))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1344))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1344))^00h,c
	goto	l10814
	
l10812:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1344+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1344))^00h,c
	
l10814:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1344),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1035
	
l10816:; BSR set to: 2

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14281
	goto	u14280

u14281:
	goto	l10820
u14280:
	
l10818:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14291
	goto	u14290
u14291:
	goto	l10822
u14290:
	
l10820:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1345))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1345))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1345))^00h,c
	goto	l10824
	
l10822:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1345+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1345))^00h,c
	
l10824:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1345),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1036
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+03h))^00h,c
	line	1037
	goto	l864
	line	1041
	
l10826:; BSR set to: 2

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14301
	goto	u14300
u14301:
	goto	l10830
u14300:
	
l10828:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14311
	goto	u14310
u14311:
	goto	l10838
u14310:
	
l10830:; BSR set to: 2

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u14321
	goto	u14320
u14321:
	goto	l10834
u14320:
	
l10832:; BSR set to: 2

	movlw	high(02Bh)
	movwf	((c:_menu_update_numeric_value$1347+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_menu_update_numeric_value$1347))^00h,c
	goto	l10836
	
l10834:; BSR set to: 2

	movlw	high(02Dh)
	movwf	((c:_menu_update_numeric_value$1347+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_menu_update_numeric_value$1347))^00h,c
	
l10836:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1347),(c:_menu_update_numeric_value$1346)
	movff	(c:_menu_update_numeric_value$1347+1),(c:_menu_update_numeric_value$1346+1)
	goto	l10840
	
l10838:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1346+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1346))^00h,c
	
l10840:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1346),(c:menu_update_numeric_value@value_buf)
	line	1042
	
l10842:; BSR set to: 2

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14331
	goto	u14330

u14331:
	goto	l10846
u14330:
	
l10844:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14341
	goto	u14340
u14341:
	goto	l10848
u14340:
	
l10846:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1348))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1348))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1348))^00h,c
	goto	l10850
	
l10848:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1348+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1348))^00h,c
	
l10850:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1348),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1043
	
l10852:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14351
	goto	u14350

u14351:
	goto	l10856
u14350:
	
l10854:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14361
	goto	u14360
u14361:
	goto	l10858
u14360:
	
l10856:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1349))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1349))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1349))^00h,c
	goto	l10860
	
l10858:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1349+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1349))^00h,c
	
l10860:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1349),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1044
	
l10862:; BSR set to: 2

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14371
	goto	u14370

u14371:
	goto	l10866
u14370:
	
l10864:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14381
	goto	u14380
u14381:
	goto	l10868
u14380:
	
l10866:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1350))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1350))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1350))^00h,c
	goto	l10870
	
l10868:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1350+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1350))^00h,c
	
l10870:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1350),0+((c:menu_update_numeric_value@value_buf)+03h)
	line	1045
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+04h))^00h,c
	line	1046
	
l864:; BSR set to: 2

	line	1049
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u14391
	goto	u14390
u14391:
	goto	l10874
u14390:
	
l10872:; BSR set to: 2

	movlw	high(0Eh)
	movwf	((c:_menu_update_numeric_value$1352+1))^00h,c
	movlw	low(0Eh)
	movwf	((c:_menu_update_numeric_value$1352))^00h,c
	goto	l10876
	
l10874:; BSR set to: 2

	movlw	high(0Fh)
	movwf	((c:_menu_update_numeric_value$1352+1))^00h,c
	movlw	low(0Fh)
	movwf	((c:_menu_update_numeric_value$1352))^00h,c
	
l10876:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1352),(c:menu_update_numeric_value@start_col)
	line	1051
	
l10878:; BSR set to: 2

	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1052
	
l10880:
		movlw	low(STR_188)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_188)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1054
	
l10882:
	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1055
	
l10884:
		movlw	low(STR_189)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_189)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1056
	
l10886:
		movlw	low(menu_update_numeric_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1057
	
l10888:
		movlw	low(STR_190)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_190)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1058
	
l838:
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
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	943
global __ptext4
__ptext4:
psect	text4
	file	"src\menu.c"
	line	943
	
_menu_update_edit_value:
;incstack = 0
	callstack 25
	line	947
	
l10890:
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
	
l10892:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u14401
	goto	u14400
u14401:
	goto	l816
u14400:
	
l10894:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u14411
	goto	u14410

u14411:
	goto	l10896
u14410:
	goto	l816
	line	955
	
l10896:; BSR set to: 2

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@screen_line))&0ffh
	line	956
		movlw	03h-1
	cpfsgt	((menu_update_edit_value@screen_line))&0ffh
	goto	u14421
	goto	u14420

u14421:
	goto	l10900
u14420:
	goto	l816
	line	960
	
l10900:; BSR set to: 0

	movff	(menu_update_edit_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_update_edit_value@flow_type),(c:is_numeric_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u14431
	goto	u14430
u14431:
	goto	l10904
u14430:
	goto	l816
	line	965
	
l10904:
	movlb	2	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u14441
	goto	u14440
u14441:
	goto	l10908
u14440:
	line	967
	
l10906:; BSR set to: 2

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_183)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_183)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+0Ah),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	968
	goto	l10916
	line	973
	
l10908:; BSR set to: 2

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u14451
	goto	u14450
u14451:
	goto	l10912
u14450:
	
l10910:; BSR set to: 2

	movlw	high(02Bh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1328+1))&0ffh
	movlw	low(02Bh)
	movwf	((_menu_update_edit_value$1328))&0ffh
	goto	l10914
	
l10912:; BSR set to: 2

	movlw	high(02Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1328+1))&0ffh
	movlw	low(02Dh)
	movwf	((_menu_update_edit_value$1328))&0ffh
	
l10914:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_184)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_184)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu_update_edit_value$1328),0+((c:?_sprintf)+04h)
	movff	(_menu_update_edit_value$1328+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+0Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	call	_sprintf	;wreg free
	line	978
	
l10916:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@from))^00h,c
	clrf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	980
	
l10918:
	movlb	2	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u14461
	goto	u14460
u14461:
	goto	l10928
u14460:
	line	983
	
l10920:; BSR set to: 2

	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u14471
	goto	u14470
u14471:
	goto	l826
u14470:
	line	984
	
l10922:; BSR set to: 2

	decf	(0+(_menu+08h))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@blink_pos))&0ffh
	goto	l10924
	line	985
	
l826:; BSR set to: 2

	line	986
	movff	0+(_menu+08h),(menu_update_edit_value@blink_pos)
	line	988
	
l10924:
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
	goto	u14481
	goto	u14480

u14481:
	goto	l10928
u14480:
	line	989
	
l10926:; BSR set to: 0

	movf	((menu_update_edit_value@blink_pos))&0ffh,w
	addlw	low(menu_update_edit_value@display_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	993
	
l10928:
	movlb	2	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u14491
	goto	u14490
u14491:
	goto	l10932
u14490:
	
l10930:; BSR set to: 2

	movlw	high(0Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1332+1))&0ffh
	movlw	low(0Dh)
	movwf	((_menu_update_edit_value$1332))&0ffh
	goto	l10934
	
l10932:; BSR set to: 2

	movlw	high(0Eh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1332+1))&0ffh
	movlw	low(0Eh)
	movwf	((_menu_update_edit_value$1332))&0ffh
	
l10934:; BSR set to: 0

	movff	(_menu_update_edit_value$1332),(menu_update_edit_value@start_col)
	line	994
	
l10936:; BSR set to: 0

	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	995
	
l10938:
		movlw	low(STR_185)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_185)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	997
	
l10940:
	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	movlb	0	; () banked
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	998
	
l10942:
		movlw	low(STR_186)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_186)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	999
	
l10944:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1000
	
l10946:
		movlw	low(STR_187)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_187)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1001
	
l816:
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
;;		On entry : 0/4
;;		On exit  : 3F/2
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
	line	628
global __ptext5
__ptext5:
psect	text5
	file	"src\menu.c"
	line	628
	
_menu_init:
;incstack = 0
	callstack 28
	line	630
	
l7732:
	movlw	low(0)
	movlb	2	; () banked
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
	
l663:; BSR set to: 2

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
;;  delta           2   62[COMRAM] int 
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
;;		On entry : 0/2
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
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	1439
global __ptext6
__ptext6:
psect	text6
	file	"src\menu.c"
	line	1439
	
_menu_handle_encoder:; BSR set to: 2

;incstack = 0
	callstack 22
	line	1444
	
l10602:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u13801
	goto	u13800
u13801:
	goto	l10724
u13800:
	line	1446
	
l10604:; BSR set to: 2

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u13811
	goto	u13810

u13811:
	goto	l1036
u13810:
	line	1449
	
l10606:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13821
	goto	u13820

u13821:
	goto	l10668
u13820:
	line	1452
	
l10608:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_234)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_234)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(c:menu_handle_encoder@delta),0+((c:?_sprintf)+06h)
	movff	(c:menu_handle_encoder@delta+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1453
	
l10610:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1456
	
l10612:
		movlw	2
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13831
	goto	u13830

u13831:
	goto	l10618
u13830:
	line	1459
	
l10614:; BSR set to: 2

	movf	((c:menu_handle_encoder@delta))^00h,c,w
	
	call	_handle_time_rotation
	line	1460
	call	_menu_update_time_value	;wreg free
	goto	l1036
	line	1461
	
l10616:
	goto	l1036
	line	1464
	
l10618:; BSR set to: 2

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
	
l10620:; BSR set to: 1

	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13841
	goto	u13840
u13841:
	goto	l10624
u13840:
	line	1469
	
l10622:; BSR set to: 2

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
	goto	l1038
	line	1472
	
l10624:; BSR set to: 2

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13851
	goto	u13850

u13851:
	goto	l10628
u13850:
	line	1474
	
l10626:; BSR set to: 2

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
	goto	l1038
	line	1477
	
l10628:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13861
	goto	u13860

u13861:
	goto	l1038
u13860:
	line	1479
	
l10630:; BSR set to: 2

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
	
l1038:
	movlb	1	; () banked
	movf	((menu_handle_encoder@clock_opts))&0ffh,w
iorwf	((menu_handle_encoder@clock_opts+1))&0ffh,w
	btfsc	status,2
	goto	u13871
	goto	u13870

u13871:
	goto	l1036
u13870:
	
l10632:; BSR set to: 1

	movf	((menu_handle_encoder@clock_flag))&0ffh,w
iorwf	((menu_handle_encoder@clock_flag+1))&0ffh,w
	btfsc	status,2
	goto	u13881
	goto	u13880

u13881:
	goto	l1036
u13880:
	line	1485
	
l10634:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_235)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_235)
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
	
l10636:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1488
	
l10638:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13891
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u13890
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u13891
	goto	u13890

u13891:
	goto	l10646
u13890:
	line	1490
	
l10640:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	incf	indf2

	line	1491
	
l10642:
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
	goto	u13901
	goto	u13900

u13901:
	goto	l10654
u13900:
	line	1492
	
l10644:; BSR set to: 1

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	goto	l10654
	line	1494
	
l10646:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13910
	goto	u13911

u13911:
	goto	l10654
u13910:
	line	1496
	
l10648:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u13921
	goto	u13920
u13921:
	goto	l10652
u13920:
	line	1497
	
l10650:
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

	goto	l10654
	line	1499
	
l10652:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	decf	indf2

	line	1503
	
l10654:
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
	goto	u13931
	goto	u13930

u13931:
	goto	l10658
u13930:
	line	1504
	
l10656:; BSR set to: 1

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	line	1506
	
l10658:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_236)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_236)
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
	
l10660:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1510
	
l10662:
	movlb	2	; () banked
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
	
l10664:
	call	_menu_draw_clock	;wreg free
	goto	l1036
	line	1518
	
l10668:; BSR set to: 2

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
	
l10670:; BSR set to: 1

	movff	(menu_handle_encoder@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_option_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u13941
	goto	u13940
u13941:
	goto	l10702
u13940:
	line	1524
	
l10672:
	movff	(menu_handle_encoder@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_encoder@edit_flag)
	movff	1+?_get_option_edit_flag,(menu_handle_encoder@edit_flag+1)
	line	1525
	movff	(menu_handle_encoder@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_encoder@opts)
	movff	1+?_get_item_options_for_field,(menu_handle_encoder@opts+1)
	line	1527
	
l10674:
	movlb	1	; () banked
	movf	((menu_handle_encoder@edit_flag))&0ffh,w
iorwf	((menu_handle_encoder@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u13951
	goto	u13950

u13951:
	goto	l1036
u13950:
	
l10676:; BSR set to: 1

	movf	((menu_handle_encoder@opts))&0ffh,w
iorwf	((menu_handle_encoder@opts+1))&0ffh,w
	btfsc	status,2
	goto	u13961
	goto	u13960

u13961:
	goto	l1036
u13960:
	line	1529
	
l10678:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13971
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u13970
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u13971
	goto	u13970

u13971:
	goto	l10686
u13970:
	line	1531
	
l10680:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	incf	indf2

	line	1532
	
l10682:; BSR set to: 1

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
	goto	u13981
	goto	u13980

u13981:
	goto	l10694
u13980:
	line	1533
	
l10684:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	goto	l10694
	line	1535
	
l10686:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13990
	goto	u13991

u13991:
	goto	l10694
u13990:
	line	1537
	
l10688:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u14001
	goto	u14000
u14001:
	goto	l10692
u14000:
	line	1538
	
l10690:; BSR set to: 1

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

	goto	l10694
	line	1540
	
l10692:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	decf	indf2

	line	1544
	
l10694:; BSR set to: 1

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
	goto	u14011
	goto	u14010

u14011:
	goto	l10698
u14010:
	line	1545
	
l10696:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	line	1548
	
l10698:; BSR set to: 1

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14021
	goto	u14020

u14021:
	goto	l10616
u14020:
	line	1550
	
l10700:; BSR set to: 2

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
	goto	l1036
	line	1555
	
l10702:
	movff	(menu_handle_encoder@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_numeric_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u14031
	goto	u14030
u14031:
	goto	l10712
u14030:
	line	1557
	
l10704:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u14040
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u14041
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u14041
	goto	u14040

u14041:
	goto	l10708
u14040:
	
l10706:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1494))&0ffh
	setf	((_menu_handle_encoder$1494+1))&0ffh
	goto	l10710
	
l10708:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1494+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1494))&0ffh
	
l10710:; BSR set to: 1

	movf	((_menu_handle_encoder$1494))&0ffh,w
	
	call	_handle_numeric_rotation
	line	1558
	goto	l1036
	line	1559
	
l10712:
	movff	(menu_handle_encoder@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_time_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u14051
	goto	u14050
u14051:
	goto	l10616
u14050:
	line	1561
	
l10714:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u14060
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u14061
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u14061
	goto	u14060

u14061:
	goto	l10718
u14060:
	
l10716:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1495))&0ffh
	setf	((_menu_handle_encoder$1495+1))&0ffh
	goto	l10720
	
l10718:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1495+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1495))&0ffh
	
l10720:; BSR set to: 1

	movf	((_menu_handle_encoder$1495))&0ffh,w
	
	call	_handle_time_rotation
	goto	l1036
	line	1568
	
l10724:; BSR set to: 2

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u14071
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u14070
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u14071
	goto	u14070

u14071:
	goto	l10742
u14070:
	line	1572
	
l10726:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf_1496)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1496)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_237)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_237)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1573
	
l10728:
		movlw	low(menu_handle_encoder@buf_1496)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1496)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1576
	
l10730:
	movlw	low(-1)
	movlb	2	; () banked
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
	goto	u14081
	goto	u14080

u14081:
	goto	l10738
u14080:
	line	1578
	
l10732:; BSR set to: 2

	incf	((_menu))&0ffh
	line	1581
	
l10734:; BSR set to: 2

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
	goto	u14091
	goto	u14090

u14091:
	goto	l10738
u14090:
	line	1583
	
l10736:; BSR set to: 2

	incf	(0+(_menu+01h))&0ffh
	line	1587
	
l10738:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf_1496)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1496)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_238)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_238)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1588
	
l10740:
		movlw	low(menu_handle_encoder@buf_1496)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1496)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1589
	goto	l10760
	line	1590
	
l10742:; BSR set to: 2

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u14100
	goto	u14101

u14101:
	goto	l10760
u14100:
	line	1594
	
l10744:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf_1499)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1499)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_239)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_239)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1595
	
l10746:
		movlw	low(menu_handle_encoder@buf_1499)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1499)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1598
	
l10748:
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u14111
	goto	u14110
u14111:
	goto	l10756
u14110:
	line	1600
	
l10750:; BSR set to: 2

	decf	((_menu))&0ffh
	line	1603
	
l10752:; BSR set to: 2

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u14121
	goto	u14120

u14121:
	goto	l10756
u14120:
	line	1605
	
l10754:; BSR set to: 2

	decf	(0+(_menu+01h))&0ffh
	line	1609
	
l10756:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf_1499)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1499)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_240)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_240)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1610
	
l10758:
		movlw	low(menu_handle_encoder@buf_1499)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1499)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1614
	
l10760:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u14131
	goto	u14130
u14131:
	goto	l1036
u14130:
	line	1616
	
l10762:; BSR set to: 2

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14141
	goto	u14140
u14141:
	goto	l10766
u14140:
	line	1617
	
l10764:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	goto	l1036
	line	1618
	
l10766:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14151
	goto	u14150

u14151:
	goto	l10770
u14150:
	line	1619
	
l10768:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	goto	l1036
	line	1620
	
l10770:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14161
	goto	u14160

u14161:
	goto	l10774
u14160:
	line	1621
	
l10772:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	goto	l1036
	line	1622
	
l10774:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14171
	goto	u14170

u14171:
	goto	l10616
u14170:
	goto	l10664
	line	1625
	
l1036:
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
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	450
global __ptext7
__ptext7:
psect	text7
	file	"src\menu.c"
	line	450
	
_handle_time_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_time_rotation@direction))&0ffh
	line	452
	
l9824:
		movlw	low(STR_122)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_122)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	456
	
l9826:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_123)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_123)
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
	
l9828:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	459
	
l9830:
	movlb	2	; () banked
	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u12781
	goto	u12780
u12781:
	goto	l9872
u12780:
	line	461
	
l9832:; BSR set to: 2

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12791
	goto	u12790

u12791:
	goto	l9854
u12790:
	line	463
	
l9834:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+012h))&0ffh
	line	465
	
l9836:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u12801
	goto	u12800

u12801:
	goto	l9844
u12800:
	
l9838:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12811
	goto	u12810

u12811:
	goto	l9844
u12810:
	
l9840:; BSR set to: 2

		movlw	03h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u12821
	goto	u12820

u12821:
	goto	l9844
u12820:
	line	466
	
l9842:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+012h))&0ffh
	goto	l9898
	line	467
	
l9844:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u12831
	goto	u12830

u12831:
	goto	l9850
u12830:
	
l9846:; BSR set to: 2

		movlw	018h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u12841
	goto	u12840

u12841:
	goto	l9850
u12840:
	goto	l9842
	line	469
	
l9850:; BSR set to: 2

		movlw	064h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u12851
	goto	u12850

u12851:
	goto	l623
u12850:
	goto	l9842
	line	474
	
l9854:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u12861
	goto	u12860
u12861:
	goto	l9870
u12860:
	line	477
	
l9856:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u12871
	goto	u12870

u12871:
	goto	l9862
u12870:
	
l9858:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12881
	goto	u12880

u12881:
	goto	l9862
u12880:
	line	478
	
l9860:; BSR set to: 2

	movlw	low(02h)
	movwf	(0+(_menu+012h))&0ffh
	goto	l9898
	line	480
	
l9862:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+010h))&0ffh,w
	btfsc	status,2
	goto	u12891
	goto	u12890

u12891:
	goto	l9866
u12890:
	
l9864:; BSR set to: 2

	movlw	high(063h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1186+1))&0ffh
	movlw	low(063h)
	movwf	((_handle_time_rotation$1186))&0ffh
	goto	l9868
	
l9866:; BSR set to: 2

	movlw	high(017h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1186+1))&0ffh
	movlw	low(017h)
	movwf	((_handle_time_rotation$1186))&0ffh
	
l9868:; BSR set to: 0

	movff	(_handle_time_rotation$1186),0+(_menu+012h)
	goto	l9898
	line	484
	
l9870:; BSR set to: 2

	decf	(0+(_menu+012h))&0ffh
	goto	l9898
	line	486
	
l623:; BSR set to: 2

	line	487
	goto	l9898
	line	488
	
l9872:; BSR set to: 2

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u12901
	goto	u12900

u12901:
	goto	l9898
u12900:
	line	491
	
l9874:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u12911
	goto	u12910

u12911:
	goto	l9884
u12910:
	
l9876:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12921
	goto	u12920

u12921:
	goto	l9884
u12920:
	
l9878:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u12931
	goto	u12930

u12931:
	goto	l9884
u12930:
	line	494
	
l9880:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l635
	line	498
	
l9884:; BSR set to: 2

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12941
	goto	u12940

u12941:
	goto	l9892
u12940:
	line	500
	
l9886:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+013h))&0ffh
	line	501
	
l9888:; BSR set to: 2

		movlw	03Ch-1
	cpfsgt	(0+(_menu+013h))&0ffh
	goto	u12951
	goto	u12950

u12951:
	goto	l9898
u12950:
	line	502
	
l9890:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l9898
	line	506
	
l9892:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	btfss	status,2
	goto	u12961
	goto	u12960
u12961:
	goto	l9896
u12960:
	line	507
	
l9894:; BSR set to: 2

	movlw	low(03Bh)
	movwf	(0+(_menu+013h))&0ffh
	goto	l9898
	line	509
	
l9896:; BSR set to: 2

	decf	(0+(_menu+013h))&0ffh
	line	513
	
l9898:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_124)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_124)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	514
	
l9900:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	515
	
l635:
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
;;		On entry : 3C/2
;;		On exit  : 3D/0
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
	line	856
global __ptext8
__ptext8:
psect	text8
	file	"src\menu.c"
	line	856
	
_handle_numeric_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_numeric_rotation@direction))&0ffh
	line	858
	
l9722:
		movlw	low(STR_181)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_181)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	861
	
l9724:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_182)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_182)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+08h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Fh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	862
	
l9726:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	865
	
l9728:
	movlb	2	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u12541
	goto	u12540
u12541:
	goto	l9822
u12540:
	
l9730:; BSR set to: 2

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u12551
	goto	u12550
u12551:
	goto	l9822
u12550:
	line	867
	
l9732:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+08h))&0ffh
	goto	l9822
	line	873
	
l9734:; BSR set to: 2

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u12561
	goto	u12560
u12561:
	goto	l808
u12560:
	
l9736:; BSR set to: 2

	movlb	0	; () banked
	movf	((handle_numeric_rotation@direction))&0ffh,w
	btfsc	status,2
	goto	u12571
	goto	u12570
u12571:
	goto	l808
u12570:
	line	875
	
l9738:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u12581
	goto	u12580
u12581:
	movlw	1
	goto	u12590
u12580:
	movlw	0
u12590:
	movwf	(0+(_menu+09h))&0ffh
	goto	l808
	line	880
	
l9740:; BSR set to: 2

	movlb	0	; () banked
		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12601
	goto	u12600

u12601:
	goto	l9748
u12600:
	line	882
	
l9742:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+0Ah))&0ffh
	line	883
	
l9744:; BSR set to: 2

		movlw	06h-1
	cpfsgt	(0+(_menu+0Ah))&0ffh
	goto	u12611
	goto	u12610

u12611:
	goto	l808
u12610:
	line	884
	
l9746:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l808
	line	886
	
l9748:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u12620
	goto	u12621

u12621:
	goto	l808
u12620:
	line	888
	
l9750:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u12631
	goto	u12630
u12631:
	goto	l9754
u12630:
	line	889
	
l9752:; BSR set to: 2

	movlw	low(05h)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l808
	line	891
	
l9754:; BSR set to: 2

	decf	(0+(_menu+0Ah))&0ffh
	goto	l808
	line	897
	
l9756:; BSR set to: 2

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u12641
	goto	u12640

u12641:
	goto	l9760
u12640:
	
l9758:; BSR set to: 2

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1317+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1317))&0ffh
	goto	l9762
	
l9760:; BSR set to: 2

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1317+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1317))&0ffh
	
l9762:; BSR set to: 0

	movff	(_handle_numeric_rotation$1317),(handle_numeric_rotation@max_tens)
	line	898
	
l9764:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12651
	goto	u12650

u12651:
	goto	l9776
u12650:
	line	900
	
l9766:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u12661
	goto	u12660
u12661:
	goto	l9770
u12660:
	goto	l808
	line	902
	
l9770:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+0Bh))&0ffh
	line	903
	
l9772:; BSR set to: 2

		movf	(0+(_menu+0Bh))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfsc	status,0
	goto	u12671
	goto	u12670

u12671:
	goto	l808
u12670:
	line	904
	
l9774:; BSR set to: 0

	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	goto	l808
	line	906
	
l9776:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u12680
	goto	u12681

u12681:
	goto	l808
u12680:
	line	908
	
l9778:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u12691
	goto	u12690
u12691:
	goto	l9782
u12690:
	goto	l808
	line	910
	
l9782:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+0Bh))&0ffh,w
	btfss	status,2
	goto	u12701
	goto	u12700
u12701:
	goto	l9786
u12700:
	line	911
	
l9784:; BSR set to: 2

	movff	(handle_numeric_rotation@max_tens),0+(_menu+0Bh)
	goto	l808
	line	913
	
l9786:; BSR set to: 2

	decf	(0+(_menu+0Bh))&0ffh
	goto	l808
	line	920
	
l9788:; BSR set to: 2

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u12711
	goto	u12710

u12711:
	goto	l9792
u12710:
	
l9790:; BSR set to: 2

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1319+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1319))&0ffh
	goto	l9794
	
l9792:; BSR set to: 2

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1319+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1319))&0ffh
	
l9794:; BSR set to: 0

	movff	(_handle_numeric_rotation$1319),(handle_numeric_rotation@max_units)
	line	921
	
l9796:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12721
	goto	u12720

u12721:
	goto	l9808
u12720:
	line	923
	
l9798:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u12731
	goto	u12730
u12731:
	goto	l9802
u12730:
	goto	l808
	line	925
	
l9802:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+0Ch))&0ffh
	line	926
	
l9804:; BSR set to: 2

		movf	(0+(_menu+0Ch))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_units))&0ffh,w
	btfsc	status,0
	goto	u12741
	goto	u12740

u12741:
	goto	l808
u12740:
	line	927
	
l9806:; BSR set to: 0

	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	goto	l808
	line	929
	
l9808:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u12750
	goto	u12751

u12751:
	goto	l808
u12750:
	line	931
	
l9810:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u12761
	goto	u12760
u12761:
	goto	l9814
u12760:
	goto	l808
	line	933
	
l9814:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+0Ch))&0ffh,w
	btfss	status,2
	goto	u12771
	goto	u12770
u12771:
	goto	l9818
u12770:
	line	934
	
l9816:; BSR set to: 2

	movff	(handle_numeric_rotation@max_units),0+(_menu+0Ch)
	goto	l808
	line	936
	
l9818:; BSR set to: 2

	decf	(0+(_menu+0Ch))&0ffh
	goto	l808
	line	870
	
l9822:; BSR set to: 2

	movf	(0+(_menu+08h))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l9734
	xorlw	1^0	; case 1
	skipnz
	goto	l9740
	xorlw	2^1	; case 2
	skipnz
	goto	l9756
	xorlw	3^2	; case 3
	skipnz
	goto	l9788
	goto	l808

	line	941
	
l808:
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
;;		On entry : 3F/2
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
psect	text9,class=CODE,space=0,reloc=2,group=0
	line	1631
global __ptext9
__ptext9:
psect	text9
	file	"src\menu.c"
	line	1631
	
_menu_handle_button:
;incstack = 0
	callstack 22
	movlb	1	; () banked
	movwf	((menu_handle_button@press_type))&0ffh
	line	1636
	
l10948:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u14501
	goto	u14500
u14501:
	goto	l11324
u14500:
	line	1638
	
l10950:; BSR set to: 2

	movlb	1	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u14511
	goto	u14510

u14511:
	goto	l11314
u14510:
	line	1641
	
l10952:; BSR set to: 1

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14521
	goto	u14520

u14521:
	goto	l11058
u14520:
	line	1646
	
l10954:; BSR set to: 2

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_241)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_241)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1647
	
l10956:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1650
	
l10958:
		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1651
	
l10960:; BSR set to: 1

		movlw	low(0)
	movwf	((menu_handle_button@edit_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@edit_flag+1))&0ffh

	line	1653
	
l10962:; BSR set to: 1

	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14531
	goto	u14530
u14531:
	goto	l10972
u14530:
	line	1655
	
l10964:; BSR set to: 2

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
	
l10966:; BSR set to: 1

	movff	(c:_enable_edit_flag),(_system_config)
	line	1658
	
l10968:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_242)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_242)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1659
	
l10970:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1660
	goto	l1099
	line	1661
	
l10972:; BSR set to: 2

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14541
	goto	u14540

u14541:
	goto	l10982
u14540:
	line	1663
	
l10974:; BSR set to: 2

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
	
l10976:; BSR set to: 1

	movff	(c:_relay_high_edit_flag),0+(_system_config+06h)
	line	1666
	
l10978:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_243)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_243)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+06h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	goto	l10970
	line	1669
	
l10982:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14551
	goto	u14550

u14551:
	goto	l11036
u14550:
	line	1672
	
l10984:; BSR set to: 2

	incf	(0+(_menu+011h))&0ffh
	line	1673
	
l10986:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	1676
	
l10988:; BSR set to: 2

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u14561
	goto	u14560

u14561:
	goto	l10994
u14560:
	
l10990:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u14571
	goto	u14570

u14571:
	goto	l10994
u14570:
	line	1678
	
l10992:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	line	1681
	
l10994:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1683
	
l10996:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_244)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_244)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1684
	
l10998:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1687
	
l11000:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_245)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_245)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1688
	
l11002:
	call	_menu_draw_clock	;wreg free
	line	1690
	
l11004:
		movlw	02h-1
	movlb	2	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u14581
	goto	u14580

u14581:
	goto	l1110
u14580:
	line	1693
	
l11006:; BSR set to: 2

	movf	(0+(_menu+012h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+(_menu+013h))&0ffh,w
	addwf	(??_menu_handle_button+0+0)^00h,c,w
	movlb	1	; () banked
	movwf	((menu_handle_button@new_value))&0ffh
	movlb	2	; () banked
	movlw	0
	addwfc	(??_menu_handle_button+0+1)^00h,c,w
	movlb	1	; () banked
	movwf	1+((menu_handle_button@new_value))&0ffh
	line	1696
	
l11008:; BSR set to: 1

	movf	((menu_handle_button@new_value))&0ffh,w
iorwf	((menu_handle_button@new_value+1))&0ffh,w
	btfss	status,2
	goto	u14591
	goto	u14590

u14591:
	goto	l11012
u14590:
	line	1697
	
l11010:; BSR set to: 1

	movlw	high(01h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(01h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	1698
	
l11012:; BSR set to: 1

		movf	((menu_handle_button@new_value+1))&0ffh,w
	bnz	u14600
	movlw	121
	subwf	 ((menu_handle_button@new_value))&0ffh,w
	btfss	status,0
	goto	u14601
	goto	u14600

u14601:
	goto	l11016
u14600:
	line	1699
	
l11014:; BSR set to: 1

	movlw	high(078h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(078h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	1701
	
l11016:; BSR set to: 1

	movff	(menu_handle_button@new_value),0+(_system_config+07h)
	line	1704
	
l11018:; BSR set to: 1

		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_246)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_246)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(03Ch)
	movwf	((c:___lbdiv@divisor))^00h,c
	movlb	4	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbdiv
	movwf	(??_menu_handle_button+0+0)^00h,c
	movf	((??_menu_handle_button+0+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	4	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbmod
	movwf	(??_menu_handle_button+1+0)^00h,c
	movf	((??_menu_handle_button+1+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1705
	
l11020:
		movff	0+(_clock_menu+0Ch),(c:strcpy@to)
	movff	1+(_clock_menu+0Ch),(c:strcpy@to+1)

		movlw	low(_value_relay_pulse)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1707
	
l11022:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_247)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_247)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+07h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1708
	
l11024:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1709
	
l11026:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1710
	
l11028:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	1711
	
l11030:; BSR set to: 2

	call	_menu_draw_clock	;wreg free
	line	1715
	
l11032:
	movlw	(0)&0ffh
	
	call	_trigger_relay_pulse
	line	1716
	goto	l1110
	line	1717
	
l1104:
	line	1719
	goto	l1110
	line	1724
	
l11036:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14611
	goto	u14610

u14611:
	goto	l1099
u14610:
	line	1726
	
l11038:; BSR set to: 2

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
	
l1099:
	movlb	1	; () banked
	movf	((menu_handle_button@opts))&0ffh,w
iorwf	((menu_handle_button@opts+1))&0ffh,w
	btfsc	status,2
	goto	u14621
	goto	u14620

u14621:
	goto	l11052
u14620:
	
l11040:; BSR set to: 1

	movf	((menu_handle_button@edit_flag))&0ffh,w
iorwf	((menu_handle_button@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u14631
	goto	u14630

u14631:
	goto	l11052
u14630:
	
l11042:; BSR set to: 1

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
	goto	u14641
	goto	u14640
u14641:
	goto	l11052
u14640:
	line	1733
	
l11044:; BSR set to: 1

	movlb	2	; () banked
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
	
l11046:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1735
	
l11048:; BSR set to: 2

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_248)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_248)
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
	line	1736
	
l11050:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1739
	
l11052:
	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1740
	
l11054:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1110
	line	1745
	
l11058:; BSR set to: 2

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
	
l11060:; BSR set to: 1

	movff	(menu_handle_button@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_option_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u14651
	goto	u14650
u14651:
	goto	l11164
u14650:
	line	1751
	
l11062:
	movff	(menu_handle_button@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1526)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1526+1)
	line	1752
	movff	(menu_handle_button@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1527)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1527+1)
	line	1754
	
l11064:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag_1526))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1526+1))&0ffh,w
	btfsc	status,2
	goto	u14661
	goto	u14660

u14661:
	goto	l11052
u14660:
	
l11066:; BSR set to: 1

	movf	((menu_handle_button@opts_1527))&0ffh,w
iorwf	((menu_handle_button@opts_1527+1))&0ffh,w
	btfsc	status,2
	goto	u14671
	goto	u14670

u14671:
	goto	l11052
u14670:
	line	1757
	
l11068:; BSR set to: 1

	movlb	2	; () banked
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
	movff	(menu_handle_button@edit_flag_1526),fsr2l
	movff	(menu_handle_button@edit_flag_1526+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movf	((??_menu_handle_button+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_handle_button+1+0
	movff	prodh,??_menu_handle_button+1+0+1
	movf	(??_menu_handle_button+1+0)^00h,c,w
	movlb	1	; () banked
	addwf	((menu_handle_button@opts_1527))&0ffh,w
	movwf	(??_menu_handle_button+3+0)^00h,c
	movf	(??_menu_handle_button+1+1)^00h,c,w
	addwfc	((menu_handle_button@opts_1527+1))&0ffh,w
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
	
l11070:
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14681
	goto	u14680
u14681:
	goto	l11074
u14680:
	line	1762
	
l11072:; BSR set to: 2

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
	goto	l11158
	line	1764
	
l11074:; BSR set to: 2

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14691
	goto	u14690

u14691:
	goto	l11086
u14690:
	line	1766
	
l11076:; BSR set to: 2

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
	
l11078:; BSR set to: 2

		movlw	2
	xorwf	((c:_sensor_edit_flag))^00h,c,w
	btfss	status,2
	goto	u14701
	goto	u14700

u14701:
	goto	l11084
u14700:
	
l11080:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfsc	status,2
	goto	u14711
	goto	u14710

u14711:
	goto	l11084
u14710:
	line	1771
	
l11082:; BSR set to: 1

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
	
l11084:
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	1776
	goto	l11158
	line	1777
	
l11086:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14721
	goto	u14720

u14721:
	goto	l11094
u14720:
	
l11088:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14731
	goto	u14730

u14731:
	goto	l11094
u14730:
	line	1779
	
l11090:; BSR set to: 1

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
	
l11092:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	1783
	goto	l11158
	line	1784
	
l11094:
		movlw	3
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14741
	goto	u14740

u14741:
	goto	l11102
u14740:
	
l11096:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14751
	goto	u14750

u14751:
	goto	l11102
u14750:
	
l11098:; BSR set to: 1

		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14761
	goto	u14760

u14761:
	goto	l11102
u14760:
	goto	l11158
	line	1787
	
l11100:
	goto	l11158
	line	1788
	
l11102:
		movlw	3
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14771
	goto	u14770

u14771:
	goto	l11110
u14770:
	
l11104:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14781
	goto	u14780

u14781:
	goto	l11110
u14780:
	
l11106:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14791
	goto	u14790
u14791:
	goto	l11110
u14790:
	line	1790
	
l11108:; BSR set to: 1

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
	goto	l11158
	line	1792
	
l11110:
	movlb	1	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14801
	goto	u14800
u14801:
	goto	l11128
u14800:
	line	1794
	
l11112:; BSR set to: 1

		movlw	9
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14811
	goto	u14810

u14811:
	goto	l11116
u14810:
	line	1795
	
l11114:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+038h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+038h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_high_edit_flag),indf2

	goto	l11158
	line	1796
	
l11116:; BSR set to: 2

		movlw	10
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14821
	goto	u14820

u14821:
	goto	l11120
u14820:
	line	1797
	
l11118:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+039h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+039h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_plp_edit_flag),indf2

	goto	l11158
	line	1798
	
l11120:; BSR set to: 2

		movlw	11
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14831
	goto	u14830

u14831:
	goto	l11124
u14830:
	line	1799
	
l11122:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_slp_edit_flag),indf2

	goto	l11158
	line	1800
	
l11124:; BSR set to: 2

		movlw	12
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14841
	goto	u14840

u14841:
	goto	l11100
u14840:
	line	1801
	
l11126:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_display_edit_flag),indf2

	goto	l11158
	line	1803
	
l11128:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14851
	goto	u14850

u14851:
	goto	l11138
u14850:
	line	1805
	
l11130:; BSR set to: 1

		movlw	6
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14861
	goto	u14860

u14861:
	goto	l11134
u14860:
	goto	l11114
	line	1807
	
l11134:; BSR set to: 2

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14871
	goto	u14870

u14871:
	goto	l11100
u14870:
	goto	l11126
	line	1810
	
l11138:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14881
	goto	u14880

u14881:
	goto	l11100
u14880:
	line	1812
	
l11140:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14891
	goto	u14890
u14891:
	goto	l11150
u14890:
	line	1814
	
l11142:; BSR set to: 1

		movlw	8
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14901
	goto	u14900

u14901:
	goto	l11146
u14900:
	line	1815
	
l11144:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Bh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Bh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_low_edit_flag),indf2

	goto	l11158
	line	1816
	
l11146:; BSR set to: 2

		movlw	9
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14911
	goto	u14910

u14911:
	goto	l11100
u14910:
	goto	l11126
	line	1821
	
l11150:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14921
	goto	u14920

u14921:
	goto	l11154
u14920:
	goto	l11144
	line	1823
	
l11154:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14931
	goto	u14930

u14931:
	goto	l11100
u14930:
	goto	l11126
	line	1828
	
l11158:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	goto	l11052
	line	1835
	
l11164:
	movff	(menu_handle_button@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_time_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u14941
	goto	u14940
u14941:
	goto	l11228
u14940:
	line	1837
	
l11166:
	movlb	2	; () banked
	incf	(0+(_menu+011h))&0ffh
	line	1838
	
l11168:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	1839
	
l11170:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1842
	
l11172:
		movlw	low(menu_handle_button@buf_1532)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1532)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_249)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_249)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1843
	
l11174:
		movlw	low(menu_handle_button@buf_1532)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1532)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1845
	
l11176:
	call	_menu_update_time_value	;wreg free
	line	1847
	
l11178:
		movlw	02h-1
	movlb	2	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u14951
	goto	u14950

u14951:
	goto	l1110
u14950:
	line	1851
	
l11180:; BSR set to: 2

	movf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u14961
	goto	u14960
u14961:
	goto	l11184
u14960:
	line	1852
	
l11182:; BSR set to: 2

	movf	(0+(_menu+012h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+(_menu+013h))&0ffh,w
	addwf	(??_menu_handle_button+0+0)^00h,c,w
	movlb	1	; () banked
	movwf	((menu_handle_button@new_seconds))&0ffh
	movlb	2	; () banked
	movlw	0
	addwfc	(??_menu_handle_button+0+1)^00h,c,w
	movlb	1	; () banked
	movwf	1+((menu_handle_button@new_seconds))&0ffh
	goto	l11186
	line	1854
	
l11184:; BSR set to: 2

	movff	0+(_menu+012h),(c:___wmul@multiplier)
	clrf	((c:___wmul@multiplier+1))^00h,c
	movlw	high(0E10h)
	movwf	((c:___wmul@multiplicand+1))^00h,c
	movlw	low(0E10h)
	movwf	((c:___wmul@multiplicand))^00h,c
	call	___wmul	;wreg free
	movlb	2	; () banked
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
	
l11186:; BSR set to: 1

	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14971
	goto	u14970
u14971:
	goto	l11200
u14970:
	line	1859
	
l11188:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14981
	goto	u14980

u14981:
	goto	l11192
u14980:
	line	1860
	
l11190:; BSR set to: 2

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
	goto	l11220
	line	1861
	
l11192:; BSR set to: 2

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14991
	goto	u14990

u14991:
	goto	l11196
u14990:
	line	1862
	
l11194:; BSR set to: 2

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
	goto	l11220
	line	1863
	
l11196:; BSR set to: 2

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15001
	goto	u15000

u15001:
	goto	l1157
u15000:
	line	1864
	
l11198:; BSR set to: 2

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
	goto	l11220
	line	1865
	
l1157:; BSR set to: 2

	goto	l11220
	line	1866
	
l11200:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15011
	goto	u15010

u15011:
	goto	l11206
u15010:
	line	1868
	
l11202:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15021
	goto	u15020

u15021:
	goto	l11220
u15020:
	goto	l11190
	line	1871
	
l11206:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15031
	goto	u15030

u15031:
	goto	l11220
u15030:
	line	1873
	
l11208:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u15041
	goto	u15040
u15041:
	goto	l11214
u15040:
	
l11210:; BSR set to: 1

		movlw	7
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15051
	goto	u15050

u15051:
	goto	l11214
u15050:
	line	1874
	
l11212:; BSR set to: 2

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
	goto	l11220
	line	1875
	
l11214:
	movlb	1	; () banked
		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u15061
	goto	u15060

u15061:
	goto	l11220
u15060:
	
l11216:; BSR set to: 1

		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15071
	goto	u15070

u15071:
	goto	l11220
u15070:
	goto	l11212
	line	1881
	
l11220:
	movlb	2	; () banked
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
		movlw	low(STR_250)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_250)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1883
	
l11222:
	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1884
	
l11224:; BSR set to: 2

	movlw	low(01h)
	movwf	((_save_pending))&0ffh
	line	1885
	
l11226:; BSR set to: 2

		movlw	low(STR_251)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_251)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1110
	line	1889
	
l11228:
	movff	(menu_handle_button@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_numeric_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u15081
	goto	u15080
u15081:
	goto	l1104
u15080:
	line	1891
	
l11230:
	movlb	2	; () banked
	incf	(0+(_menu+08h))&0ffh
	line	1892
	
l11232:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1894
	
l11234:
		movlw	2
	movlb	2	; () banked
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u15091
	goto	u15090

u15091:
	goto	l11240
u15090:
	
l11236:; BSR set to: 2

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u15101
	goto	u15100

u15101:
	goto	l11240
u15100:
	line	1896
	
l11238:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+0Bh))&0ffh
	line	1897
	movlw	low(0)
	movwf	(0+(_menu+0Ch))&0ffh
	line	1900
	
l11240:; BSR set to: 2

		movlw	04h-1
	cpfsgt	(0+(_menu+08h))&0ffh
	goto	u15111
	goto	u15110

u15111:
	goto	l1104
u15110:
	line	1902
	
l11242:; BSR set to: 2

	call	_get_current_numeric_value	;wreg free
	movff	0+?_get_current_numeric_value,(menu_handle_button@new_value_1537)
	movff	1+?_get_current_numeric_value,(menu_handle_button@new_value_1537+1)
	line	1905
	
l11244:; BSR set to: 2

	movlb	1	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15121
	goto	u15120
u15121:
	goto	l11268
u15120:
	line	1907
	
l11246:; BSR set to: 1

		movlw	2
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15131
	goto	u15130

u15131:
	goto	l11252
u15130:
	line	1909
	
l11248:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1537),postinc2
	movff	(menu_handle_button@new_value_1537+1),postdec2
	line	1910
	
l11250:; BSR set to: 2

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_252)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_252)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1911
	goto	l11310
	line	1912
	
l11252:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15141
	goto	u15140

u15141:
	goto	l11258
u15140:
	line	1914
	
l11254:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1537),postinc2
	movff	(menu_handle_button@new_value_1537+1),postdec2
	line	1915
	
l11256:; BSR set to: 2

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_253)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_253)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1916
	goto	l11310
	line	1917
	
l11258:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15151
	goto	u15150

u15151:
	goto	l11264
u15150:
	line	1919
	
l11260:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1537),postinc2
	movff	(menu_handle_button@new_value_1537+1),postdec2
	line	1920
	
l11262:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_254)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_254)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1921
	goto	l11310
	line	1922
	
l11264:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15161
	goto	u15160

u15161:
	goto	l1177
u15160:
	line	1925
	
l11266:; BSR set to: 2

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_255)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_255)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l11310
	line	1927
	
l1177:; BSR set to: 2

	goto	l11310
	line	1928
	
l11268:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15171
	goto	u15170

u15171:
	goto	l11288
u15170:
	line	1930
	
l11270:; BSR set to: 1

		movlw	2
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15181
	goto	u15180

u15181:
	goto	l11276
u15180:
	line	1932
	
l11272:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1537),postinc2
	movff	(menu_handle_button@new_value_1537+1),postdec2
	line	1933
	
l11274:; BSR set to: 2

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_256)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_256)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1934
	goto	l11310
	line	1935
	
l11276:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15191
	goto	u15190

u15191:
	goto	l11282
u15190:
	line	1937
	
l11278:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1537),postinc2
	movff	(menu_handle_button@new_value_1537+1),postdec2
	line	1938
	
l11280:; BSR set to: 2

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_257)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_257)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1939
	goto	l11310
	line	1940
	
l11282:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15201
	goto	u15200

u15201:
	goto	l1177
u15200:
	line	1942
	
l11284:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1537),postinc2
	movff	(menu_handle_button@new_value_1537+1),postdec2
	line	1943
	
l11286:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_258)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_258)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l11310
	line	1946
	
l11288:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15211
	goto	u15210

u15211:
	goto	l11310
u15210:
	
l11290:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u15221
	goto	u15220
u15221:
	goto	l11310
u15220:
	line	1948
	
l11292:; BSR set to: 1

		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15231
	goto	u15230

u15231:
	goto	l11298
u15230:
	line	1950
	
l11294:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1537),postinc2
	movff	(menu_handle_button@new_value_1537+1),postdec2
	line	1951
	
l11296:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_259)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_259)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1952
	goto	l11310
	line	1953
	
l11298:; BSR set to: 2

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15241
	goto	u15240

u15241:
	goto	l11304
u15240:
	line	1955
	
l11300:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1537),postinc2
	movff	(menu_handle_button@new_value_1537+1),postdec2
	line	1956
	
l11302:; BSR set to: 2

		movff	0+(_input_menu+01Bh),(c:sprintf@sp)
	movff	1+(_input_menu+01Bh),(c:sprintf@sp+1)

		movlw	low(STR_260)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_260)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1957
	goto	l11310
	line	1958
	
l11304:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15251
	goto	u15250

u15251:
	goto	l1177
u15250:
	line	1960
	
l11306:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+020h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+020h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1537),postinc2
	movff	(menu_handle_button@new_value_1537+1),postdec2
	line	1961
	
l11308:; BSR set to: 2

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_261)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_261)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1965
	
l11310:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1966
	
l11312:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	goto	l1110
	line	1970
	
l11314:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u15261
	goto	u15260

u15261:
	goto	l1110
u15260:
	line	1972
	
l11316:; BSR set to: 1

	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1973
	
l11318:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1974
	
l11320:
	asmopt push
asmopt off
movlw  3
movwf	(??_menu_handle_button+0+0+1)^00h,c
movlw	8
movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	119
u16327:
decfsz	wreg,f
	bra	u16327
	decfsz	(??_menu_handle_button+0+0)^00h,c,f
	bra	u16327
	decfsz	(??_menu_handle_button+0+0+1)^00h,c,f
	bra	u16327
	nop
asmopt pop

	line	1975
	
l11322:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1110
	line	1980
	
l11324:; BSR set to: 2

	movlb	1	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u15271
	goto	u15270

u15271:
	goto	l11596
u15270:
	line	1982
	
l11326:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15281
	goto	u15280
u15281:
	goto	l11346
u15280:
	line	1984
	
l11328:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1986
	goto	l11344
	line	1992
	
l11330:; BSR set to: 2

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	1993
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	1994
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	1995
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	1996
	
l11332:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	1997
	goto	l1110
	line	2006
	
l11334:; BSR set to: 2

	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u15291
	goto	u15290
u15291:
	goto	l11340
u15290:
	line	2008
	
l11336:; BSR set to: 2

	call	_save_current_config	;wreg free
	line	2009
	
l11338:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	2011
	
l11340:; BSR set to: 2

	setf	((_current_menu))&0ffh
	line	2012
	goto	l1110
	line	1986
	
l11344:
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l1104
	xorlw	1^0	; case 1
	skipnz
	goto	l11330
	xorlw	2^1	; case 2
	skipnz
	goto	l1104
	xorlw	3^2	; case 3
	skipnz
	goto	l1104
	xorlw	4^3	; case 4
	skipnz
	goto	l11334
	goto	l1110

	line	2015
	
l11346:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15301
	goto	u15300

u15301:
	goto	l11496
u15300:
	line	2017
	
l11348:; BSR set to: 2

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
	bnz	u15311
movf	(??_menu_handle_button+0+1)^00h,c,w
xorwf	(??_menu_handle_button+2+1)^00h,c,w
	btfss	status,2
	goto	u15311
	goto	u15310

u15311:
	goto	l11362
u15310:
	line	2019
	
l11350:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2020
	
l11352:
	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2021
	
l11354:; BSR set to: 2

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2022
	
l11356:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2023
	
l11358:; BSR set to: 2

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l11332
	line	2026
	
l11362:; BSR set to: 2

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
	goto	u15321
	goto	u15320
u15321:
	goto	l1110
u15320:
	line	2028
	
l11364:; BSR set to: 2

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
	movwf	((menu_handle_button@sensor_type_1549))&0ffh
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
	movwf	((menu_handle_button@flow_type_1550))&0ffh
	line	2032
	
l11366:; BSR set to: 1

	movff	(menu_handle_button@sensor_type_1549),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type_1550),(c:is_numeric_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u15331
	goto	u15330
u15331:
	goto	l11424
u15330:
	line	2034
	
l11368:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val))&0ffh
	line	2037
	movf	((menu_handle_button@sensor_type_1549))&0ffh,w
	btfss	status,2
	goto	u15341
	goto	u15340
u15341:
	goto	l11386
u15340:
	line	2039
	
l11370:; BSR set to: 1

		movlw	2
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15351
	goto	u15350

u15351:
	goto	l11374
u15350:
	line	2040
	
l11372:; BSR set to: 2

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
	goto	l11416
	line	2041
	
l11374:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15361
	goto	u15360

u15361:
	goto	l11378
u15360:
	line	2042
	
l11376:; BSR set to: 2

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
	goto	l11416
	line	2043
	
l11378:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15371
	goto	u15370

u15371:
	goto	l11382
u15370:
	line	2044
	
l11380:; BSR set to: 2

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
	goto	l11416
	line	2045
	
l11382:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15381
	goto	u15380

u15381:
	goto	l1218
u15380:
	line	2046
	
l11384:; BSR set to: 2

	movlw	high(032h)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(032h)
	movwf	((menu_handle_button@current_val))&0ffh
	goto	l11416
	line	2047
	
l1218:; BSR set to: 2

	goto	l11416
	line	2048
	
l11386:; BSR set to: 1

		decf	((menu_handle_button@sensor_type_1549))&0ffh,w
	btfss	status,2
	goto	u15391
	goto	u15390

u15391:
	goto	l11400
u15390:
	line	2050
	
l11388:; BSR set to: 1

		movlw	2
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15401
	goto	u15400

u15401:
	goto	l11392
u15400:
	goto	l11372
	line	2052
	
l11392:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15411
	goto	u15410

u15411:
	goto	l11396
u15410:
	goto	l11376
	line	2054
	
l11396:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15421
	goto	u15420

u15421:
	goto	l1218
u15420:
	goto	l11380
	line	2057
	
l11400:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1549))&0ffh,w
	btfss	status,2
	goto	u15431
	goto	u15430

u15431:
	goto	l11416
u15430:
	
l11402:; BSR set to: 1

	movf	((menu_handle_button@flow_type_1550))&0ffh,w
	btfss	status,2
	goto	u15441
	goto	u15440
u15441:
	goto	l11416
u15440:
	line	2059
	
l11404:; BSR set to: 1

		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15451
	goto	u15450

u15451:
	goto	l11408
u15450:
	goto	l11372
	line	2061
	
l11408:; BSR set to: 2

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15461
	goto	u15460

u15461:
	goto	l11412
u15460:
	goto	l11376
	line	2063
	
l11412:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15471
	goto	u15470

u15471:
	goto	l1218
u15470:
	line	2064
	
l11414:; BSR set to: 2

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
	
l11416:
	movff	(menu_handle_button@current_val),(c:init_numeric_editor@value)
	movff	(menu_handle_button@current_val+1),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	2068
	
l11418:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2069
	
l11420:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l11054
	line	2073
	
l11424:
	movff	(menu_handle_button@sensor_type_1549),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type_1550),(c:is_time_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u15481
	goto	u15480
u15481:
	goto	l11470
u15480:
	line	2075
	
l11426:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val_1553+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val_1553))&0ffh
	line	2078
	movf	((menu_handle_button@sensor_type_1549))&0ffh,w
	btfss	status,2
	goto	u15491
	goto	u15490
u15491:
	goto	l11440
u15490:
	line	2080
	
l11428:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15501
	goto	u15500

u15501:
	goto	l11432
u15500:
	line	2081
	
l11430:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1553)
	movff	postdec2,(menu_handle_button@current_val_1553+1)
	goto	l11458
	line	2082
	
l11432:; BSR set to: 2

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15511
	goto	u15510

u15511:
	goto	l11436
u15510:
	line	2083
	
l11434:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1553)
	movff	postdec2,(menu_handle_button@current_val_1553+1)
	goto	l11458
	line	2084
	
l11436:; BSR set to: 2

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15521
	goto	u15520

u15521:
	goto	l1240
u15520:
	line	2085
	
l11438:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1553)
	movff	postdec2,(menu_handle_button@current_val_1553+1)
	goto	l11458
	line	2086
	
l1240:; BSR set to: 2

	goto	l11458
	line	2087
	
l11440:; BSR set to: 1

		decf	((menu_handle_button@sensor_type_1549))&0ffh,w
	btfss	status,2
	goto	u15531
	goto	u15530

u15531:
	goto	l11446
u15530:
	line	2089
	
l11442:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15541
	goto	u15540

u15541:
	goto	l11458
u15540:
	goto	l11430
	line	2092
	
l11446:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1549))&0ffh,w
	btfss	status,2
	goto	u15551
	goto	u15550

u15551:
	goto	l11458
u15550:
	line	2095
	
l11448:; BSR set to: 1

	movf	((menu_handle_button@flow_type_1550))&0ffh,w
	btfss	status,2
	goto	u15561
	goto	u15560
u15561:
	goto	l11452
u15560:
	
l11450:; BSR set to: 1

		movlw	7
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u15571
	goto	u15570

u15571:
	goto	l11456
u15570:
	
l11452:
	movlb	1	; () banked
		decf	((menu_handle_button@flow_type_1550))&0ffh,w
	btfss	status,2
	goto	u15581
	goto	u15580

u15581:
	goto	l11458
u15580:
	
l11454:; BSR set to: 1

		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15591
	goto	u15590

u15591:
	goto	l11458
u15590:
	line	2096
	
l11456:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1553)
	movff	postdec2,(menu_handle_button@current_val_1553+1)
	line	2100
	
l11458:
		movlw	low(menu_handle_button@buf_1554)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1554)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_262)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_262)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@current_val_1553),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@current_val_1553+1),1+((c:?_sprintf)+04h)
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2101
	
l11460:
		movlw	low(menu_handle_button@buf_1554)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1554)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2103
	
l11462:
	movff	(menu_handle_button@current_val_1553),(c:init_time_editor@value_seconds)
	movff	(menu_handle_button@current_val_1553+1),(c:init_time_editor@value_seconds+1)
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	goto	l11418
	line	2109
	
l11470:
	movff	(menu_handle_button@sensor_type_1549),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type_1550),(c:is_option_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u15601
	goto	u15600
u15601:
	goto	l1104
u15600:
	line	2111
	
l11472:
		movlw	low(_original_value)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_original_value)
	movwf	((c:strcpy@to+1))^00h,c

	movlb	2	; () banked
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
	
l11474:
	movff	(menu_handle_button@sensor_type_1549),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type_1550),(c:get_option_edit_flag@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1557)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1557+1)
	line	2114
	
l11476:
	movff	(menu_handle_button@sensor_type_1549),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type_1550),(c:get_item_options_for_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1558)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1558+1)
	line	2116
	
l11478:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag_1557))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1557+1))&0ffh,w
	btfsc	status,2
	goto	u15611
	goto	u15610

u15611:
	goto	l11492
u15610:
	
l11480:; BSR set to: 1

	movf	((menu_handle_button@opts_1558))&0ffh,w
iorwf	((menu_handle_button@opts_1558+1))&0ffh,w
	btfsc	status,2
	goto	u15621
	goto	u15620

u15621:
	goto	l11492
u15620:
	line	2119
	
l11482:; BSR set to: 1

	movlw	low(0)
	movwf	((menu_handle_button@i))&0ffh
	goto	l11490
	line	2121
	
l11484:; BSR set to: 1

	movlb	2	; () banked
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
	addwf	((menu_handle_button@opts_1558))&0ffh,w
	movwf	(??_menu_handle_button+2+0)^00h,c
	movf	(??_menu_handle_button+0+1)^00h,c,w
	addwfc	((menu_handle_button@opts_1558+1))&0ffh,w
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
	goto	u15631
	goto	u15630

u15631:
	goto	l11488
u15630:
	line	2123
	
l11486:
	movff	(menu_handle_button@edit_flag_1557),fsr2l
	movff	(menu_handle_button@edit_flag_1557+1),fsr2h
	movff	(menu_handle_button@i),indf2

	line	2124
	goto	l11492
	line	2119
	
l11488:
	movlb	1	; () banked
	incf	((menu_handle_button@i))&0ffh
	
l11490:; BSR set to: 1

	movlw	01h
	addwf	((menu_handle_button@opts_1558))&0ffh,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	0
	addwfc	((menu_handle_button@opts_1558+1))&0ffh,w
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
	goto	u15641
	goto	u15640

u15641:
	goto	l11484
u15640:
	line	2129
	
l11492:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2130
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l11054
	line	2135
	
l11496:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15651
	goto	u15650

u15651:
	goto	l11530
u15650:
	line	2137
	
l11498:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2139
	
l11500:
		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15661
	goto	u15660

u15661:
	goto	l11506
u15660:
	line	2141
	
l11502:; BSR set to: 2

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	2142
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2143
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2144
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2145
	
l11504:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	2146
	goto	l1110
	line	2147
	
l11506:; BSR set to: 2

		movlw	03h-0
	cpfslt	((_menu))&0ffh
	goto	u15671
	goto	u15670

u15671:
	goto	l11518
u15670:
	line	2149
	
l11508:; BSR set to: 2

	movf	((_menu))&0ffh,w
	
	call	_rebuild_input_menu
	line	2150
	
l11510:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2151
	
l11512:; BSR set to: 2

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2152
	
l11514:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2153
	
l11516:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	line	2154
	goto	l1110
	line	2155
	
l11518:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15681
	goto	u15680

u15681:
	goto	l1104
u15680:
	line	2157
	
l11520:; BSR set to: 2

	call	_rebuild_clock_menu	;wreg free
	line	2158
	
l11522:
	movlw	low(03h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2159
	
l11524:; BSR set to: 2

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2160
	
l11526:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2161
	
l11528:
	call	_menu_draw_clock	;wreg free
	goto	l1110
	line	2164
	
l11530:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15691
	goto	u15690

u15691:
	goto	l1110
u15690:
	line	2168
	
l11532:; BSR set to: 2

		movlw	05h-1
	cpfsgt	((_menu))&0ffh
	goto	u15701
	goto	u15700

u15701:
	goto	l11536
u15700:
	
l11534:; BSR set to: 2

	movlw	high(0)
	movlb	1	; () banked
	movwf	((_menu_handle_button$1566+1))&0ffh
	movlw	low(0)
	movwf	((_menu_handle_button$1566))&0ffh
	goto	l11538
	
l11536:; BSR set to: 2

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
	movwf	((_menu_handle_button$1566))&0ffh
	clrf	((_menu_handle_button$1566+1))&0ffh
	
l11538:; BSR set to: 1

		movlw	low(menu_handle_button@buf_1564)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1564)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_263)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_263)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu_handle_button$1566),0+((c:?_sprintf)+06h)
	movff	(_menu_handle_button$1566+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	2169
	
l11540:
		movlw	low(menu_handle_button@buf_1564)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1564)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2171
		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15711
	goto	u15710

u15711:
	goto	l11554
u15710:
	goto	l11350
	line	2181
	
l11554:; BSR set to: 2

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
	goto	u15721
	goto	u15720
u15721:
	goto	l11594
u15720:
	line	2183
	
l11556:; BSR set to: 2

		movlw	low(STR_264)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_264)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2186
	
l11558:
		movlw	low(_original_value)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_original_value)
	movwf	((c:strcpy@to+1))^00h,c

	movlb	2	; () banked
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
	
l11560:
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15731
	goto	u15730
u15731:
	goto	l11564
u15730:
	line	2191
	
l11562:; BSR set to: 2

		movff	0+(_clock_menu+02h),(c:strcmp@s1)
	movff	1+(_clock_menu+02h),(c:strcmp@s1+1)

		movlw	low(STR_265)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_265)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u15741
	goto	u15740

u15741:
	movlw	1
	goto	u15750
u15740:
	movlw	0
u15750:
	movwf	((c:_enable_edit_flag))^00h,c
	line	2192
	goto	l11586
	line	2193
	
l11564:; BSR set to: 2

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15761
	goto	u15760

u15761:
	goto	l11576
u15760:
	line	2195
	
l11566:; BSR set to: 2

		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_266)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_266)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u15771
	goto	u15770

u15771:
	goto	l11570
u15770:
	line	2196
	
l11568:
	movlw	low(0)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l11586
	line	2197
	
l11570:
		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_267)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_267)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u15781
	goto	u15780

u15781:
	goto	l11574
u15780:
	line	2198
	
l11572:
	movlw	low(01h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l11586
	line	2200
	
l11574:
	movlw	low(02h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l11586
	line	2202
	
l11576:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15791
	goto	u15790

u15791:
	goto	l11582
u15790:
	line	2205
	
l11578:; BSR set to: 2

	movff	0+(_system_config+07h),0+(_menu+0Dh)
	clrf	(1+(_menu+0Dh))&0ffh
	line	2206
	
l11580:; BSR set to: 2

	movff	0+(_system_config+07h),(c:init_time_editor@value_seconds)
	clrf	((c:init_time_editor@value_seconds+1))^00h,c
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	line	2207
	goto	l11586
	line	2208
	
l11582:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15801
	goto	u15800

u15801:
	goto	l1284
u15800:
	line	2210
	
l11584:; BSR set to: 2

		movff	0+(_clock_menu+011h),(c:strcmp@s1)
	movff	1+(_clock_menu+011h),(c:strcmp@s1+1)

		movlw	low(STR_268)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_268)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u15811
	goto	u15810

u15811:
	movlw	1
	goto	u15820
u15810:
	movlw	0
u15820:
	movwf	((c:_display_edit_flag))^00h,c
	goto	l11586
	line	2213
	
l1284:; BSR set to: 2

	
l11586:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2214
	
l11588:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2215
	
l11590:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l11528
	line	2222
	
l11594:; BSR set to: 2

		movlw	low(STR_269)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_269)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1110
	line	2226
	
l11596:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u15831
	goto	u15830

u15831:
	goto	l1110
u15830:
	goto	l11318
	line	2233
	
l1110:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_button
	__end_of_menu_handle_button:
	signat	_menu_handle_button,4217
	global	_trigger_relay_pulse

;; *************** function _trigger_relay_pulse *****************
;; Defined at:
;;		line 115 in file "src\main.c"
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
;;		On entry : 0/2
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
psect	text10,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	115
global __ptext10
__ptext10:
psect	text10
	file	"src\main.c"
	line	115
	
_trigger_relay_pulse:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((trigger_relay_pulse@latch_mode))&0ffh
	line	120
	
l9670:
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
	line	121
	
l9672:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	123
	
l9674:
	movlb	0	; () banked
	movf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u12491
	goto	u12490
u12491:
	goto	l144
u12490:
	line	125
	
l9676:; BSR set to: 0

	movlw	low(01h)
	movwf	((_relay_state))&0ffh	;volatile
	line	127
	movf	((trigger_relay_pulse@latch_mode))&0ffh,w
	btfsc	status,2
	goto	u12501
	goto	u12500
u12501:
	goto	l9682
u12500:
	line	130
	
l9678:; BSR set to: 0

	movlw	high(0)
	movlb	2	; () banked
	movwf	((_relay_counter+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_relay_counter))&0ffh	;volatile
	line	131
	
l9680:; BSR set to: 2

		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	132
	goto	l9688
	line	136
	
l9682:; BSR set to: 0

	movlb	4	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	mullw	064h
	movff	prodl,(_relay_counter)	;volatile
	movff	prodh,(_relay_counter+1)	;volatile
	line	137
	
l9684:; BSR set to: 4

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
	line	138
	
l9686:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	141
	
l9688:
	bcf	((c:3979))^0f00h,c,1	;volatile
	line	143
	
l144:
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
;;		On entry : 3F/2
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
psect	text11,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	641
global __ptext11
__ptext11:
psect	text11
	file	"src\menu.c"
	line	641
	
_rebuild_input_menu:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((rebuild_input_menu@input_num))&0ffh
	line	644
	
l10182:
	movff	(rebuild_input_menu@input_num),(_current_input)
	line	647
	
l10184:
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
	
l10186:; BSR set to: 0

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
	
l10188:; BSR set to: 0

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
	goto	u13411
	goto	u13410
u13411:
	goto	l10192
u13410:
	
l10190:; BSR set to: 0

		movlw	low(STR_134)
	movwf	((_rebuild_input_menu$1221))&0ffh
	movlw	high(STR_134)
	movwf	((_rebuild_input_menu$1221+1))&0ffh

	goto	l10194
	
l10192:; BSR set to: 0

		movlw	low(STR_133)
	movwf	((_rebuild_input_menu$1221))&0ffh
	movlw	high(STR_133)
	movwf	((_rebuild_input_menu$1221+1))&0ffh

	
l10194:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_132)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_132)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_input_menu$1221),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$1221+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	653
	
l10196:
	movlb	0	; () banked
	movf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u13421
	goto	u13420
u13421:
	goto	l10302
u13420:
	line	655
	
l10198:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_135)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_135)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	656
	
l10200:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_136)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_136)
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
	
l10202:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_137)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_137)
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
	
l10204:
		movlw	low(_value_hi_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_hi_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_138)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_138)
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
	
l10206:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2504)
	movff	1+?___lwdiv,(_rebuild_input_menu$2504+1)
	
l10208:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2505)
	movff	1+?___lwmod,(_rebuild_input_menu$2505+1)
	
l10210:
		movlw	low(_value_highbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_highbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_139)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_139)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2504),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2504+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2505),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2505+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	662
	
l10212:
		movlw	low(_value_low_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_140)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_140)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	high(032h)
	movwf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(032h)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	665
	
l10214:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2504)
	movff	1+?___lwdiv,(_rebuild_input_menu$2504+1)
	
l10216:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2505)
	movff	1+?___lwmod,(_rebuild_input_menu$2505+1)
	
l10218:
		movlw	low(_value_plpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_plpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_141)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_141)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2504),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2504+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2505),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2505+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	668
	
l10220:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2504)
	movff	1+?___lwdiv,(_rebuild_input_menu$2504+1)
	
l10222:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2505)
	movff	1+?___lwmod,(_rebuild_input_menu$2505+1)
	
l10224:
		movlw	low(_value_slpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_slpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_142)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_142)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2504),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2504+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2505),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2505+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	671
	
l10226:
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
	goto	u13431
	goto	u13430
u13431:
	goto	l10234
u13430:
	
l10228:; BSR set to: 0

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
	goto	u13441
	goto	u13440

u13441:
	goto	l10232
u13440:
	
l10230:; BSR set to: 0

		movlw	low(STR_145)
	movwf	((_rebuild_input_menu$1236))&0ffh
	movlw	high(STR_145)
	movwf	((_rebuild_input_menu$1236+1))&0ffh

	goto	l680
	
l10232:; BSR set to: 0

		movlw	low(STR_144)
	movwf	((_rebuild_input_menu$1236))&0ffh
	movlw	high(STR_144)
	movwf	((_rebuild_input_menu$1236+1))&0ffh

	
l680:; BSR set to: 0

		movff	(_rebuild_input_menu$1236),(_rebuild_input_menu$1235)
	movff	(_rebuild_input_menu$1236+1),(_rebuild_input_menu$1235+1)

	goto	l10236
	
l10234:; BSR set to: 0

		movlw	low(STR_143)
	movwf	((_rebuild_input_menu$1235))&0ffh
	movlw	high(STR_143)
	movwf	((_rebuild_input_menu$1235+1))&0ffh

	
l10236:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1235),(c:strcpy@from)
	movff	(_rebuild_input_menu$1235+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	673
	
l10238:
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
	goto	u13451
	goto	u13450
u13451:
	goto	l10246
u13450:
	
l10240:; BSR set to: 0

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
	goto	u13461
	goto	u13460

u13461:
	goto	l10244
u13460:
	
l10242:; BSR set to: 0

		movlw	low(STR_148)
	movwf	((_rebuild_input_menu$1243))&0ffh
	movlw	high(STR_148)
	movwf	((_rebuild_input_menu$1243+1))&0ffh

	goto	l688
	
l10244:; BSR set to: 0

		movlw	low(STR_147)
	movwf	((_rebuild_input_menu$1243))&0ffh
	movlw	high(STR_147)
	movwf	((_rebuild_input_menu$1243+1))&0ffh

	
l688:; BSR set to: 0

		movff	(_rebuild_input_menu$1243),(_rebuild_input_menu$1242)
	movff	(_rebuild_input_menu$1243+1),(_rebuild_input_menu$1242+1)

	goto	l10248
	
l10246:; BSR set to: 0

		movlw	low(STR_146)
	movwf	((_rebuild_input_menu$1242))&0ffh
	movlw	high(STR_146)
	movwf	((_rebuild_input_menu$1242+1))&0ffh

	
l10248:; BSR set to: 0

		movlw	low(_value_rlyplp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyplp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1242),(c:strcpy@from)
	movff	(_rebuild_input_menu$1242+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	675
	
l10250:
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
	goto	u13471
	goto	u13470
u13471:
	goto	l10258
u13470:
	
l10252:; BSR set to: 0

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
	goto	u13481
	goto	u13480

u13481:
	goto	l10256
u13480:
	
l10254:; BSR set to: 0

		movlw	low(STR_151)
	movwf	((_rebuild_input_menu$1250))&0ffh
	movlw	high(STR_151)
	movwf	((_rebuild_input_menu$1250+1))&0ffh

	goto	l696
	
l10256:; BSR set to: 0

		movlw	low(STR_150)
	movwf	((_rebuild_input_menu$1250))&0ffh
	movlw	high(STR_150)
	movwf	((_rebuild_input_menu$1250+1))&0ffh

	
l696:; BSR set to: 0

		movff	(_rebuild_input_menu$1250),(_rebuild_input_menu$1249)
	movff	(_rebuild_input_menu$1250+1),(_rebuild_input_menu$1249+1)

	goto	l10260
	
l10258:; BSR set to: 0

		movlw	low(STR_149)
	movwf	((_rebuild_input_menu$1249))&0ffh
	movlw	high(STR_149)
	movwf	((_rebuild_input_menu$1249+1))&0ffh

	
l10260:; BSR set to: 0

		movlw	low(_value_rlyslp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyslp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1249),(c:strcpy@from)
	movff	(_rebuild_input_menu$1249+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	676
	
l10262:
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
	goto	u13491
	goto	u13490
u13491:
	goto	l10266
u13490:
	
l10264:; BSR set to: 0

		movlw	low(STR_153)
	movwf	((_rebuild_input_menu$1254))&0ffh
	movlw	high(STR_153)
	movwf	((_rebuild_input_menu$1254+1))&0ffh

	goto	l10268
	
l10266:; BSR set to: 0

		movlw	low(STR_152)
	movwf	((_rebuild_input_menu$1254))&0ffh
	movlw	high(STR_152)
	movwf	((_rebuild_input_menu$1254+1))&0ffh

	
l10268:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1254),(c:strcpy@from)
	movff	(_rebuild_input_menu$1254+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	679
	
l10270:
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
	
l10272:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	683
	
l10274:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	684
	
l10276:; BSR set to: 3

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	685
	
l10278:; BSR set to: 3

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	686
	
l10280:; BSR set to: 3

		movlw	low(_value_hi_pressure)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_hi_pressure)
	movwf	(1+(_input_menu+016h))&0ffh

	line	687
	
l10282:; BSR set to: 3

		movlw	low(_value_highbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_highbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	688
	
l10284:; BSR set to: 3

		movlw	low(_value_low_pressure)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_pressure)
	movwf	(1+(_input_menu+020h))&0ffh

	line	689
	
l10286:; BSR set to: 3

		movlw	low(_value_plpbp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_plpbp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	690
	
l10288:; BSR set to: 3

		movlw	low(_value_slpbp)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_slpbp)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	691
	
l10290:; BSR set to: 3

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	692
	
l10292:; BSR set to: 3

		movlw	low(_value_rlyplp)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_rlyplp)
	movwf	(1+(_input_menu+034h))&0ffh

	line	693
	
l10294:; BSR set to: 3

		movlw	low(_value_rlyslp)
	movwf	(0+(_input_menu+039h))&0ffh
	movlw	high(_value_rlyslp)
	movwf	(1+(_input_menu+039h))&0ffh

	line	694
	
l10296:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+03Eh))&0ffh
	clrf	(1+(_input_menu+03Eh))&0ffh

	line	695
	
l10298:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+043h))&0ffh
	clrf	(1+(_input_menu+043h))&0ffh

	line	697
	
l10300:; BSR set to: 3

	movlw	low(0Eh)
	movlb	2	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	698
	goto	l10468
	line	699
	
l10302:; BSR set to: 0

		decf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u13501
	goto	u13500

u13501:
	goto	l10360
u13500:
	line	701
	
l10304:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_154)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_154)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	702
	
l10306:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_155)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_155)
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
	
l10308:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_156)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_156)
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
	
l10310:
		movlw	low(_value_high_temp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_temp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_157)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_157)
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
	
l10312:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2504)
	movff	1+?___lwdiv,(_rebuild_input_menu$2504+1)
	
l10314:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2505)
	movff	1+?___lwmod,(_rebuild_input_menu$2505+1)
	
l10316:
		movlw	low(_value_high_tbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_tbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_158)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_158)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2504),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2504+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2505),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2505+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	709
	
l10318:
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
	goto	u13511
	goto	u13510
u13511:
	goto	l10326
u13510:
	
l10320:; BSR set to: 0

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
	goto	u13521
	goto	u13520

u13521:
	goto	l10324
u13520:
	
l10322:; BSR set to: 0

		movlw	low(STR_161)
	movwf	((_rebuild_input_menu$1269))&0ffh
	movlw	high(STR_161)
	movwf	((_rebuild_input_menu$1269+1))&0ffh

	goto	l710
	
l10324:; BSR set to: 0

		movlw	low(STR_160)
	movwf	((_rebuild_input_menu$1269))&0ffh
	movlw	high(STR_160)
	movwf	((_rebuild_input_menu$1269+1))&0ffh

	
l710:; BSR set to: 0

		movff	(_rebuild_input_menu$1269),(_rebuild_input_menu$1268)
	movff	(_rebuild_input_menu$1269+1),(_rebuild_input_menu$1268+1)

	goto	l10328
	
l10326:; BSR set to: 0

		movlw	low(STR_159)
	movwf	((_rebuild_input_menu$1268))&0ffh
	movlw	high(STR_159)
	movwf	((_rebuild_input_menu$1268+1))&0ffh

	
l10328:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1268),(c:strcpy@from)
	movff	(_rebuild_input_menu$1268+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	710
	
l10330:
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
	goto	u13531
	goto	u13530
u13531:
	goto	l10334
u13530:
	
l10332:; BSR set to: 0

		movlw	low(STR_163)
	movwf	((_rebuild_input_menu$1273))&0ffh
	movlw	high(STR_163)
	movwf	((_rebuild_input_menu$1273+1))&0ffh

	goto	l10336
	
l10334:; BSR set to: 0

		movlw	low(STR_162)
	movwf	((_rebuild_input_menu$1273))&0ffh
	movlw	high(STR_162)
	movwf	((_rebuild_input_menu$1273+1))&0ffh

	
l10336:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1273),(c:strcpy@from)
	movff	(_rebuild_input_menu$1273+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	713
	
l10338:
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
	
l10340:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	717
	
l10342:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	718
	
l10344:; BSR set to: 3

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	719
	
l10346:; BSR set to: 3

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	720
	
l10348:; BSR set to: 3

		movlw	low(_value_high_temp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_high_temp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	721
	
l10350:; BSR set to: 3

		movlw	low(_value_high_tbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_high_tbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	722
	
l10352:; BSR set to: 3

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+020h))&0ffh

	line	723
	
l10354:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+025h))&0ffh
	clrf	(1+(_input_menu+025h))&0ffh

	line	724
	
l10356:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+02Ah))&0ffh
	clrf	(1+(_input_menu+02Ah))&0ffh

	line	726
	
l10358:; BSR set to: 3

	movlw	low(09h)
	movlb	2	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	727
	goto	l10468
	line	728
	
l10360:; BSR set to: 0

		movlw	2
	xorwf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u13541
	goto	u13540

u13541:
	goto	l10468
u13540:
	line	730
	
l10362:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_164)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_164)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	731
	
l10364:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfsc	status,2
	goto	u13551
	goto	u13550
u13551:
	goto	l10368
u13550:
	
l10366:; BSR set to: 0

		movlw	low(STR_166)
	movwf	((_rebuild_input_menu$1278))&0ffh
	movlw	high(STR_166)
	movwf	((_rebuild_input_menu$1278+1))&0ffh

	goto	l10370
	
l10368:; BSR set to: 0

		movlw	low(STR_165)
	movwf	((_rebuild_input_menu$1278))&0ffh
	movlw	high(STR_165)
	movwf	((_rebuild_input_menu$1278+1))&0ffh

	
l10370:; BSR set to: 0

		movlw	low(_value_flow_type)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_type)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1278),(c:strcpy@from)
	movff	(_rebuild_input_menu$1278+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	732
	
l10372:
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
	goto	u13561
	goto	u13560
u13561:
	goto	l10376
u13560:
	
l10374:; BSR set to: 0

		movlw	low(STR_168)
	movwf	((_rebuild_input_menu$1282))&0ffh
	movlw	high(STR_168)
	movwf	((_rebuild_input_menu$1282+1))&0ffh

	goto	l10378
	
l10376:; BSR set to: 0

		movlw	low(STR_167)
	movwf	((_rebuild_input_menu$1282))&0ffh
	movlw	high(STR_167)
	movwf	((_rebuild_input_menu$1282+1))&0ffh

	
l10378:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1282),(c:strcpy@from)
	movff	(_rebuild_input_menu$1282+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	734
	
l10380:
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
	goto	u13571
	goto	u13570
u13571:
	goto	l10388
u13570:
	
l10382:; BSR set to: 0

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
	goto	u13581
	goto	u13580

u13581:
	goto	l10386
u13580:
	
l10384:; BSR set to: 0

		movlw	low(STR_171)
	movwf	((_rebuild_input_menu$1289))&0ffh
	movlw	high(STR_171)
	movwf	((_rebuild_input_menu$1289+1))&0ffh

	goto	l732
	
l10386:; BSR set to: 0

		movlw	low(STR_170)
	movwf	((_rebuild_input_menu$1289))&0ffh
	movlw	high(STR_170)
	movwf	((_rebuild_input_menu$1289+1))&0ffh

	
l732:; BSR set to: 0

		movff	(_rebuild_input_menu$1289),(_rebuild_input_menu$1288)
	movff	(_rebuild_input_menu$1289+1),(_rebuild_input_menu$1288+1)

	goto	l10390
	
l10388:; BSR set to: 0

		movlw	low(STR_169)
	movwf	((_rebuild_input_menu$1288))&0ffh
	movlw	high(STR_169)
	movwf	((_rebuild_input_menu$1288+1))&0ffh

	
l10390:; BSR set to: 0

		movlw	low(_value_rlylow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlylow)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1288),(c:strcpy@from)
	movff	(_rebuild_input_menu$1288+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	736
	
l10392:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfss	status,2
	goto	u13591
	goto	u13590
u13591:
	goto	l10440
u13590:
	line	738
	
l10394:; BSR set to: 0

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
	goto	u13601
	goto	u13600
u13601:
	goto	l10398
u13600:
	
l10396:; BSR set to: 0

		movlw	low(STR_173)
	movwf	((_rebuild_input_menu$1293))&0ffh
	movlw	high(STR_173)
	movwf	((_rebuild_input_menu$1293+1))&0ffh

	goto	l10400
	
l10398:; BSR set to: 0

		movlw	low(STR_172)
	movwf	((_rebuild_input_menu$1293))&0ffh
	movlw	high(STR_172)
	movwf	((_rebuild_input_menu$1293+1))&0ffh

	
l10400:; BSR set to: 0

		movlw	low(_value_flow_units)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_units)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1293),(c:strcpy@from)
	movff	(_rebuild_input_menu$1293+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	739
	
l10402:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_174)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_174)
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
	
l10404:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_175)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_175)
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
	
l10406:
		movlw	low(_value_low_flow)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_176)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_176)
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
	
l10408:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2504)
	movff	1+?___lwdiv,(_rebuild_input_menu$2504+1)
	
l10410:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2505)
	movff	1+?___lwmod,(_rebuild_input_menu$2505+1)
	
l10412:
		movlw	low(_value_low_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_177)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_177)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2504),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2504+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2505),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2505+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	747
	
l10414:
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
	
l10416:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	751
	
l10418:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	752
	
l10420:; BSR set to: 3

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	753
	
l10422:; BSR set to: 3

		movlw	low(_value_flow_units)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_flow_units)
	movwf	(1+(_input_menu+011h))&0ffh

	line	754
	
l10424:; BSR set to: 3

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+016h))&0ffh

	line	755
	
l10426:; BSR set to: 3

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	756
	
l10428:; BSR set to: 3

		movlw	low(_value_low_flow)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_flow)
	movwf	(1+(_input_menu+020h))&0ffh

	line	757
	
l10430:; BSR set to: 3

		movlw	low(_value_low_flow_bp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_low_flow_bp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	758
	
l10432:; BSR set to: 3

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	759
	
l10434:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+02Fh))&0ffh
	clrf	(1+(_input_menu+02Fh))&0ffh

	line	760
	
l10436:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+034h))&0ffh
	clrf	(1+(_input_menu+034h))&0ffh

	line	762
	
l10438:; BSR set to: 3

	movlw	low(0Bh)
	movlb	2	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	763
	goto	l10468
	line	766
	
l10440:; BSR set to: 0

		movlw	low(_value_no_flow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_no_flow)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_178)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_178)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	769
	
l10442:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2504)
	movff	1+?___lwdiv,(_rebuild_input_menu$2504+1)
	
l10444:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2505)
	movff	1+?___lwmod,(_rebuild_input_menu$2505+1)
	
l10446:
		movlw	low(_value_no_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_no_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_179)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_179)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2504),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2504+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2505),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2505+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	772
	
l10448:
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
	
l10450:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	776
	
l10452:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	777
	
l10454:; BSR set to: 3

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	778
	
l10456:; BSR set to: 3

		movlw	low(_value_no_flow)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_no_flow)
	movwf	(1+(_input_menu+011h))&0ffh

	line	779
	
l10458:; BSR set to: 3

		movlw	low(_value_no_flow_bp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_no_flow_bp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	780
	
l10460:; BSR set to: 3

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	781
	
l10462:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+020h))&0ffh
	clrf	(1+(_input_menu+020h))&0ffh

	line	782
	
l10464:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+025h))&0ffh
	clrf	(1+(_input_menu+025h))&0ffh

	line	784
	
l10466:; BSR set to: 3

	movlw	low(08h)
	movlb	2	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	791
	
l10468:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_180)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_180)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(rebuild_input_menu@sensor),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(rebuild_input_menu@flow_type_val),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	792
	
l10470:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	793
	
l739:
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
;;		On entry : 3F/2
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
psect	text12,class=CODE,space=0,reloc=2,group=0
	line	1303
global __ptext12
__ptext12:
psect	text12
	file	"src\menu.c"
	line	1303
	
_rebuild_clock_menu:
;incstack = 0
	callstack 24
	line	1309
	
l10518:; BSR set to: 2

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_218)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_218)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_system_config+06h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1310
	
l10520:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1313
	
l10522:
	movlb	4	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u13771
	goto	u13770
u13771:
	goto	l10526
u13770:
	
l10524:; BSR set to: 4

		movlw	low(STR_221)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1441))&0ffh
	movlw	high(STR_221)
	movwf	((_rebuild_clock_menu$1441+1))&0ffh

	goto	l10528
	
l10526:; BSR set to: 4

		movlw	low(STR_220)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1441))&0ffh
	movlw	high(STR_220)
	movwf	((_rebuild_clock_menu$1441+1))&0ffh

	
l10528:; BSR set to: 0

		movlw	low(_value_clock_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_clock_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_219)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_219)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_clock_menu$1441),0+((c:?_sprintf)+04h)
	movff	(_rebuild_clock_menu$1441+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	1315
	
l10530:
	movlb	4	; () banked
	movf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u13781
	goto	u13780
u13781:
	goto	l10538
u13780:
	
l10532:; BSR set to: 4

		decf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u13791
	goto	u13790

u13791:
	goto	l10536
u13790:
	
l10534:; BSR set to: 4

		movlw	low(STR_224)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1448))&0ffh
	movlw	high(STR_224)
	movwf	((_rebuild_clock_menu$1448+1))&0ffh

	goto	l996
	
l10536:; BSR set to: 4

		movlw	low(STR_223)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1448))&0ffh
	movlw	high(STR_223)
	movwf	((_rebuild_clock_menu$1448+1))&0ffh

	
l996:; BSR set to: 0

		movff	(_rebuild_clock_menu$1448),(_rebuild_clock_menu$1447)
	movff	(_rebuild_clock_menu$1448+1),(_rebuild_clock_menu$1447+1)

	goto	l10540
	
l10538:; BSR set to: 4

		movlw	low(STR_222)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1447))&0ffh
	movlw	high(STR_222)
	movwf	((_rebuild_clock_menu$1447+1))&0ffh

	
l10540:; BSR set to: 0

		movlw	low(_value_end_runtime)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_end_runtime)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_clock_menu$1447),(c:strcpy@from)
	movff	(_rebuild_clock_menu$1447+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1320
	
l10542:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_225)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_225)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(03Ch)
	movwf	((c:___lbdiv@divisor))^00h,c
	movlb	4	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbdiv
	movwf	(??_rebuild_clock_menu+0+0)^00h,c
	movf	((??_rebuild_clock_menu+0+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	4	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbmod
	movwf	(??_rebuild_clock_menu+1+0)^00h,c
	movf	((??_rebuild_clock_menu+1+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1322
	
l10544:
		movlw	low(_value_clock_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_clock_display)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_226)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_226)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1324
	
l10546:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_227)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_227)
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
	
l10548:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1328
	
l10550:
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
	
l10552:
		movlw	low(_value_clock_enable)
	movlb	1	; () banked
	movwf	(0+(_clock_menu+02h))&0ffh
	movlw	high(_value_clock_enable)
	movwf	(1+(_clock_menu+02h))&0ffh

	line	1332
	
l10554:; BSR set to: 1

		movlw	low(_value_end_runtime)
	movwf	(0+(_clock_menu+07h))&0ffh
	movlw	high(_value_end_runtime)
	movwf	(1+(_clock_menu+07h))&0ffh

	line	1333
	
l10556:; BSR set to: 1

		movlw	low(_value_relay_pulse)
	movwf	(0+(_clock_menu+0Ch))&0ffh
	movlw	high(_value_relay_pulse)
	movwf	(1+(_clock_menu+0Ch))&0ffh

	line	1334
	
l10558:; BSR set to: 1

		movlw	low(_value_clock_display)
	movwf	(0+(_clock_menu+011h))&0ffh
	movlw	high(_value_clock_display)
	movwf	(1+(_clock_menu+011h))&0ffh

	line	1335
	
l10560:; BSR set to: 1

		movlw	low(_value_back)
	movwf	(0+(_clock_menu+016h))&0ffh
	clrf	(1+(_clock_menu+016h))&0ffh

	line	1337
	
l10562:; BSR set to: 1

	movlw	low(05h)
	movlb	2	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	1339
	
l10564:; BSR set to: 2

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_228)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_228)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+02h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1340
	
l10566:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1341
	
l997:
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
psect	text13,class=CODE,space=0,reloc=2,group=0
	line	520
global __ptext13
__ptext13:
psect	text13
	file	"src\menu.c"
	line	520
	
_menu_update_time_value:
;incstack = 0
	callstack 23
	line	522
	
l9902:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u12971
	goto	u12970
u12971:
	goto	l9906
u12970:
	goto	l644
	line	529
	
l9906:; BSR set to: 2

	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u12981
	goto	u12980
u12981:
	goto	l9912
u12980:
	
l9908:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u12991
	goto	u12990
u12991:
	goto	l9912
u12990:
	line	531
	
l9910:; BSR set to: 2

	movlw	low(020h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	532
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	533
	goto	l9914
	line	536
	
l9912:; BSR set to: 2

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
	movlb	2	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	541
	
l9914:; BSR set to: 0

	movlw	low(03Ah)
	movwf	(0+(menu_update_time_value@value_buf+02h))&0ffh
	line	544
	
l9916:; BSR set to: 0

	movlb	2	; () banked
		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u13001
	goto	u13000

u13001:
	goto	l9922
u13000:
	
l9918:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u13011
	goto	u13010
u13011:
	goto	l9922
u13010:
	line	546
	
l9920:; BSR set to: 2

	movlw	low(020h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	547
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	548
	goto	l9924
	line	551
	
l9922:; BSR set to: 2

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
	movlb	2	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	555
	
l9924:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(menu_update_time_value@value_buf+05h))&0ffh
	line	558
	
l9926:; BSR set to: 0

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13021
	goto	u13020

u13021:
	goto	l9934
u13020:
	
l9928:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13031
	goto	u13030

u13031:
	goto	l9934
u13030:
	line	560
	
l9930:; BSR set to: 2

		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_125)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_125)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(menu_update_time_value@value_buf)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c

	call	_sprintf	;wreg free
	line	561
	call	_menu_draw_clock	;wreg free
	goto	l644
	line	566
	
l9934:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u13041
	goto	u13040

u13041:
	goto	l9938
u13040:
	goto	l644
	line	570
	
l9938:; BSR set to: 2

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_time_value@screen_line))&0ffh
	line	571
		movlw	03h-1
	cpfsgt	((menu_update_time_value@screen_line))&0ffh
	goto	u13051
	goto	u13050

u13051:
	goto	l651
u13050:
	goto	l644
	line	572
	
l651:; BSR set to: 0

	line	574
	movff	(_menu),(menu_update_time_value@item_idx)
	line	578
	
l9942:; BSR set to: 0

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
	
l9944:; BSR set to: 0

	movff	(menu_update_time_value@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_update_time_value@flow_type),(c:is_time_field@flow_type)
	movf	((menu_update_time_value@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfss	status,2
	goto	u13061
	goto	u13060
u13061:
	goto	l9948
u13060:
	goto	l644
	line	588
	
l9948:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_126)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_126)
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
	
l9950:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	593
	
l9952:
		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_127)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_127)
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
	
l9954:
	line	599
	
l9956:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	600
	
l9958:
		movlw	low(STR_128)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_128)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	602
	
l9960:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	603
	
l9962:
		movlw	low(STR_129)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_129)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	604
	
l9964:
		movlw	low(menu_update_time_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	605
	
l9966:
		movlw	low(STR_130)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_130)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	606
	
l644:
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
;;  j               1   52[COMRAM] unsigned char 
;;  val_len         1   50[COMRAM] unsigned char 
;;  start_pos       1   45[COMRAM] unsigned char 
;;  actual_len      1   44[COMRAM] unsigned char 
;;  value_buf      15   29[COMRAM] unsigned char [15]
;;  item_idx        1   55[COMRAM] unsigned char 
;;  show_bracket    1   53[COMRAM] unsigned char 
;;  val_len         1   51[COMRAM] unsigned char 
;;  i               1   54[COMRAM] unsigned char 
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
psect	text14,class=CODE,space=0,reloc=2,group=0
	line	1346
global __ptext14
__ptext14:
psect	text14
	file	"src\menu.c"
	line	1346
	
_menu_draw_clock:
;incstack = 0
	callstack 23
	line	1349
	
l9584:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1350
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_229)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_229)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1353
	
l9586:
	movlw	low(0)
	movwf	((c:menu_draw_clock@i))^00h,c
	goto	l9666
	line	1355
	
l9588:; BSR set to: 2

	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_clock@i))^00h,c,w
	movwf	((c:menu_draw_clock@item_idx))^00h,c
	line	1356
	
l9590:; BSR set to: 2

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1359
	
l9592:
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
	
l9594:
	line	1365
	
l9596:
	movf	((c:menu_draw_clock@item_idx))^00h,c,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12381
	goto	u12380

u12381:
	goto	l9626
u12380:
	line	1367
	
l9598:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u12391
	goto	u12390
u12391:
	goto	l9622
u12390:
	line	1369
	
l9600:; BSR set to: 2

	movlw	low(02h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	line	1372
	
l9602:; BSR set to: 2

		movlw	2
	xorwf	((c:menu_draw_clock@item_idx))^00h,c,w
	btfsc	status,2
	goto	u12401
	goto	u12400

u12401:
	goto	l9606
u12400:
	line	1374
	
l9604:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u12411
	goto	u12410
u12411:
	goto	l9608
u12410:
	line	1377
	
l9606:; BSR set to: 2

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
	goto	l9630
	line	1382
	
l9608:; BSR set to: 2

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
	
l9610:
	movlw	low(0)
	movwf	((c:menu_draw_clock@j))^00h,c
	goto	l9616
	line	1384
	
l9612:
	movf	((c:menu_draw_clock@j))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1383
	
l9614:
	incf	((c:menu_draw_clock@j))^00h,c
	
l9616:
		movf	((c:menu_draw_clock@val_len))^00h,c,w
	subwf	((c:menu_draw_clock@j))^00h,c,w
	btfss	status,0
	goto	u12421
	goto	u12420

u12421:
	goto	l9612
u12420:
	line	1385
	
l9618:
	movf	((c:menu_draw_clock@val_len))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l9630
	line	1397
	
l9622:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l9606
	line	1404
	
l9626:; BSR set to: 2

	movlw	low(0)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l9606
	line	1409
	
l9630:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_clock@val_len_1464))^00h,c
	line	1411
	
l9632:
	movf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfss	status,2
	goto	u12431
	goto	u12430
u12431:
	goto	l9638
u12430:
	line	1414
	
l9634:
	movf	((c:menu_draw_clock@val_len_1464))^00h,c,w
	btfsc	status,2
	goto	u12441
	goto	u12440
u12441:
	goto	l9664
u12440:
	line	1415
	
l9636:
	movf	((c:menu_draw_clock@val_len_1464))^00h,c,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_print_at
	goto	l9664
	line	1420
	
l9638:
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
	
l9640:
	movf	((c:menu_draw_clock@actual_len))^00h,c,w
	sublw	low(012h)
	movwf	((c:menu_draw_clock@start_pos))^00h,c
	line	1423
	
l9642:
	movff	(c:menu_draw_clock@start_pos),(c:lcd_set_cursor@col)
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1424
	
l9644:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u12451
	goto	u12450

u12451:
	goto	l9648
u12450:
	
l9646:
		movlw	low(STR_231)
	movwf	((c:_menu_draw_clock$1470))^00h,c
	movlw	high(STR_231)
	movwf	((c:_menu_draw_clock$1470+1))^00h,c

	goto	l9650
	
l9648:
		movlw	low(STR_230)
	movwf	((c:_menu_draw_clock$1470))^00h,c
	movlw	high(STR_230)
	movwf	((c:_menu_draw_clock$1470+1))^00h,c

	
l9650:
		movff	(c:_menu_draw_clock$1470),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1470+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1427
	
l9652:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1429
	
l9654:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1430
	
l9656:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u12461
	goto	u12460

u12461:
	goto	l9660
u12460:
	
l9658:
		movlw	low(STR_233)
	movwf	((c:_menu_draw_clock$1474))^00h,c
	movlw	high(STR_233)
	movwf	((c:_menu_draw_clock$1474+1))^00h,c

	goto	l9662
	
l9660:
		movlw	low(STR_232)
	movwf	((c:_menu_draw_clock$1474))^00h,c
	movlw	high(STR_232)
	movwf	((c:_menu_draw_clock$1474+1))^00h,c

	
l9662:
		movff	(c:_menu_draw_clock$1474),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1474+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1353
	
l9664:
	incf	((c:menu_draw_clock@i))^00h,c
	
l9666:
		movlw	03h-0
	cpfslt	((c:menu_draw_clock@i))^00h,c
	goto	u12471
	goto	u12470

u12471:
	goto	l1027
u12470:
	
l9668:
	movlb	2	; () banked
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
	goto	u12481
	goto	u12480

u12481:
	goto	l9588
u12480:
	line	1433
	
l1027:
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
;;		On entry : 39/4
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
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
global __ptext15
__ptext15:
psect	text15
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
	
___lbmod:
;incstack = 0
	callstack 27
	movwf	((c:___lbmod@dividend))^00h,c
	line	9
	
l6640:
	movlw	low(08h)
	movwf	((c:___lbmod@counter))^00h,c
	line	10
	movlw	low(0)
	movwf	((c:___lbmod@rem))^00h,c
	line	12
	
l6642:
	bcf	status,0
	rlcf	((c:___lbmod@dividend))^00h,c,w
	rlcf	((c:___lbmod@rem))^00h,c,w
	movwf	((c:___lbmod@rem))^00h,c
	line	13
	
l6644:
	bcf status,0
	rlcf	((c:___lbmod@dividend))^00h,c

	line	14
	
l6646:
		movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c,w
	btfss	status,0
	goto	u7491
	goto	u7490

u7491:
	goto	l6650
u7490:
	line	15
	
l6648:
	movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c
	line	16
	
l6650:
	decfsz	((c:___lbmod@counter))^00h,c
	
	goto	l6642
	line	17
	
l6652:
	movf	((c:___lbmod@rem))^00h,c,w
	line	18
	
l1870:
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
;;		On entry : 39/4
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
;; This function uses a non-reentrant model
;;
psect	text16,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
global __ptext16
__ptext16:
psect	text16
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
	
___lbdiv:
;incstack = 0
	callstack 27
	movwf	((c:___lbdiv@dividend))^00h,c
	line	9
	
l6614:
	movlw	low(0)
	movwf	((c:___lbdiv@quotient))^00h,c
	line	10
	
l6616:
	movf	((c:___lbdiv@divisor))^00h,c,w
	btfsc	status,2
	goto	u7461
	goto	u7460
u7461:
	goto	l6636
u7460:
	line	11
	
l6618:
	movlw	low(01h)
	movwf	((c:___lbdiv@counter))^00h,c
	line	12
	goto	l6624
	line	13
	
l6620:
	bcf status,0
	rlcf	((c:___lbdiv@divisor))^00h,c

	line	14
	
l6622:
	incf	((c:___lbdiv@counter))^00h,c
	line	12
	
l6624:
	
	btfss	((c:___lbdiv@divisor))^00h,c,(7)&7
	goto	u7471
	goto	u7470
u7471:
	goto	l6620
u7470:
	line	17
	
l6626:
	bcf status,0
	rlcf	((c:___lbdiv@quotient))^00h,c

	line	18
		movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c,w
	btfss	status,0
	goto	u7481
	goto	u7480

u7481:
	goto	l6632
u7480:
	line	19
	
l6628:
	movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c
	line	20
	
l6630:
	bsf	(0+(0/8)+(c:___lbdiv@quotient))^00h,c,(0)&7
	line	22
	
l6632:
	bcf status,0
	rrcf	((c:___lbdiv@divisor))^00h,c

	line	23
	
l6634:
	decfsz	((c:___lbdiv@counter))^00h,c
	
	goto	l6626
	line	25
	
l6636:
	movf	((c:___lbdiv@quotient))^00h,c,w
	line	26
	
l1864:
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
;;  label           2   40[COMRAM] PTR const unsigned char 
;;		 -> STR_206(5), STR_205(6), STR_204(1), STR_203(1), 
;;		 -> STR_202(1), 
;;  sensor_name     2   43[COMRAM] PTR const unsigned char 
;;		 -> Fake(1), STR_209(5), STR_208(5), STR_207(9), 
;;  sensor          1   42[COMRAM] unsigned char 
;;  item_idx        1   45[COMRAM] unsigned char 
;;  i               1   46[COMRAM] unsigned char 
;;  setup_labels   10   24[COMRAM] PTR const unsigned char 
;;		 -> STR_206(5), STR_205(6), STR_204(1), STR_203(1), 
;;		 -> STR_202(1), 
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
psect	text17,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1223
global __ptext17
__ptext17:
psect	text17
	file	"src\menu.c"
	line	1223
	
_menu_draw_setup:
;incstack = 0
	callstack 23
	line	1228
	
l10086:
	call	_lcd_clear	;wreg free
	line	1229
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1230
	
l10088:
		movlw	low(STR_201)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_201)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1233
	
l10090:
	lfsr	2,(menu_draw_setup@F2659)
	lfsr	1,(menu_draw_setup@setup_labels)
	movlw	10-1
u13291:
	movff	plusw2,plusw1
	decf	wreg
	bc	u13291

	line	1236
	
l10092:
	movlw	low(0)
	movwf	((c:menu_draw_setup@i))^00h,c
	line	1238
	
l10098:
	movlb	2	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_setup@i))^00h,c,w
	movwf	((c:menu_draw_setup@item_idx))^00h,c
	line	1239
		movlw	05h-1
	cpfsgt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u13301
	goto	u13300

u13301:
	goto	l10102
u13300:
	goto	l980
	line	1242
	
l10102:; BSR set to: 2

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1245
	
l10104:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u13311
	goto	u13310

u13311:
	goto	l10138
u13310:
	line	1247
	
l10106:
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
	
l10108:
	movf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u13321
	goto	u13320
u13321:
	goto	l10116
u13320:
	
l10110:
		decf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u13331
	goto	u13330

u13331:
	goto	l10114
u13330:
	
l10112:
		movlw	low(STR_209)
	movwf	((c:_menu_draw_setup$1418))^00h,c
	movlw	high(STR_209)
	movwf	((c:_menu_draw_setup$1418+1))^00h,c

	goto	l963
	
l10114:
		movlw	low(STR_208)
	movwf	((c:_menu_draw_setup$1418))^00h,c
	movlw	high(STR_208)
	movwf	((c:_menu_draw_setup$1418+1))^00h,c

	
l963:
		movff	(c:_menu_draw_setup$1418),(c:menu_draw_setup@sensor_name)
	movff	(c:_menu_draw_setup$1418+1),(c:menu_draw_setup@sensor_name+1)

	goto	l959
	
l10116:
		movlw	low(STR_207)
	movwf	((c:menu_draw_setup@sensor_name))^00h,c
	movlw	high(STR_207)
	movwf	((c:menu_draw_setup@sensor_name+1))^00h,c

	
l959:
	line	1252
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13341
	goto	u13340

u13341:
	goto	l10126
u13340:
	line	1255
	
l10118:; BSR set to: 2

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1256
	
l10120:
		movlw	low(STR_210)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_210)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1257
	
l10122:
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1258
	
l10124:
		movlw	low(STR_211)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_211)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1259
	goto	l10128
	line	1263
	
l10126:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1267
	
l10128:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1268
	
l10130:
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
	goto	u13351
	goto	u13350
u13351:
	goto	l10134
u13350:
	
l10132:
		movlw	low(STR_213)
	movwf	((c:_menu_draw_setup$1424))^00h,c
	movlw	high(STR_213)
	movwf	((c:_menu_draw_setup$1424+1))^00h,c

	goto	l10136
	
l10134:
		movlw	low(STR_212)
	movwf	((c:_menu_draw_setup$1424))^00h,c
	movlw	high(STR_212)
	movwf	((c:_menu_draw_setup$1424+1))^00h,c

	
l10136:
		movff	(c:_menu_draw_setup$1424),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1424+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1269
	goto	l10164
	line	1273
	
l10138:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_labels)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:menu_draw_setup@label)
	movff	postdec2,(c:menu_draw_setup@label+1)
	line	1275
	
l10140:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13361
	goto	u13360

u13361:
	goto	l10150
u13360:
	line	1278
	
l10142:; BSR set to: 2

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1279
	
l10144:
		movlw	low(STR_214)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_214)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1280
	
l10146:
		movff	(c:menu_draw_setup@label),(c:lcd_print@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1281
	
l10148:
		movlw	low(STR_215)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_215)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1282
	goto	l10152
	line	1286
	
l10150:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@label),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1290
	
l10152:
		movlw	3
	xorwf	((c:menu_draw_setup@item_idx))^00h,c,w
	btfss	status,2
	goto	u13371
	goto	u13370

u13371:
	goto	l10164
u13370:
	line	1293
	
l10154:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1294
	
l10156:
	movlb	4	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u13381
	goto	u13380
u13381:
	goto	l10160
u13380:
	
l10158:; BSR set to: 4

		movlw	low(STR_217)
	movwf	((c:_menu_draw_setup$1432))^00h,c
	movlw	high(STR_217)
	movwf	((c:_menu_draw_setup$1432+1))^00h,c

	goto	l10162
	
l10160:; BSR set to: 4

		movlw	low(STR_216)
	movwf	((c:_menu_draw_setup$1432))^00h,c
	movlw	high(STR_216)
	movwf	((c:_menu_draw_setup$1432+1))^00h,c

	
l10162:; BSR set to: 4

		movff	(c:_menu_draw_setup$1432),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1432+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1236
	
l10164:
	incf	((c:menu_draw_setup@i))^00h,c
	
l10166:
		movlw	03h-1
	cpfsgt	((c:menu_draw_setup@i))^00h,c
	goto	u13391
	goto	u13390

u13391:
	goto	l10098
u13390:
	line	1298
	
l980:
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
;;  item_index      1   24[COMRAM] unsigned char 
;;  i               1   25[COMRAM] unsigned char 
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
psect	text18,class=CODE,space=0,reloc=2,group=0
	line	1064
global __ptext18
__ptext18:
psect	text18
	file	"src\menu.c"
	line	1064
	
_menu_draw_options:
;incstack = 0
	callstack 23
	line	1067
	
l9690:
	call	_lcd_clear	;wreg free
	line	1068
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1069
	
l9692:
		movlw	low(STR_191)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_191)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1072
	
l9694:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	line	1074
	
l9700:
	movlb	2	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_options@i))^00h,c,w
	movwf	((c:menu_draw_options@item_index))^00h,c
	line	1075
		movlw	05h-1
	cpfsgt	((c:menu_draw_options@item_index))^00h,c
	goto	u12511
	goto	u12510

u12511:
	goto	l9704
u12510:
	goto	l904
	line	1078
	
l9704:; BSR set to: 2

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1081
	
l9706:
	movf	((c:menu_draw_options@item_index))^00h,c,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12521
	goto	u12520

u12521:
	goto	l9716
u12520:
	line	1083
	
l9708:; BSR set to: 2

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1084
	
l9710:
		movlw	low(STR_192)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_192)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1085
	
l9712:
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
	
l9714:
		movlw	low(STR_193)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_193)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1087
	goto	l9718
	line	1091
	
l9716:; BSR set to: 2

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
	
l9718:
	incf	((c:menu_draw_options@i))^00h,c
	
l9720:
		movlw	03h-1
	cpfsgt	((c:menu_draw_options@i))^00h,c
	goto	u12531
	goto	u12530

u12531:
	goto	l9700
u12530:
	line	1094
	
l904:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_options
	__end_of_menu_draw_options:
	signat	_menu_draw_options,89
	global	_lcd_clear

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 215 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/2
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
psect	text19,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	215
global __ptext19
__ptext19:
psect	text19
	file	"src\main.c"
	line	215
	
_lcd_clear:
;incstack = 0
	callstack 24
	line	217
	
l9520:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	218
	
l9522:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u16337:
decfsz	wreg,f
	bra	u16337
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u16337
	nop2
asmopt pop

	line	219
	
l178:
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
psect	text20,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1096
global __ptext20
__ptext20:
psect	text20
	file	"src\menu.c"
	line	1096
	
_menu_draw_input:
;incstack = 0
	callstack 23
	line	1101
	
l9968:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1103
	
l9970:
		movlw	low(menu_draw_input@title)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_194)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_194)
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
	
l9972:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@title)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1107
	
l9974:
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
	
l9976:; BSR set to: 0

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
	
l9978:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@i))&0ffh
	goto	l10082
	line	1113
	
l9980:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_input@i))&0ffh,w
	movwf	((menu_draw_input@item_idx))&0ffh
	line	1114
	
l9982:; BSR set to: 0

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1117
	
l9984:
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
	
l9986:
	line	1123
	
l9988:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13071
	goto	u13070

u13071:
	goto	l10038
u13070:
	line	1125
	
l9990:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u13081
	goto	u13080
u13081:
	goto	l10034
u13080:
	line	1127
	
l9992:; BSR set to: 2

	movlw	low(02h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	line	1130
	
l9994:; BSR set to: 0

	movff	(menu_draw_input@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_option_field@flow_type)
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u13091
	goto	u13090
u13091:
	goto	l10008
u13090:
	line	1132
	
l9996:
	movlb	2	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u13101
	goto	u13100
u13101:
	goto	l10010
u13100:
	line	1135
	
l9998:; BSR set to: 2

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
	
l10000:
	movlb	0	; () banked
	movf	((menu_draw_input@opts))&0ffh,w
iorwf	((menu_draw_input@opts+1))&0ffh,w
	btfsc	status,2
	goto	u13111
	goto	u13110

u13111:
	goto	l10008
u13110:
	
l10002:; BSR set to: 0

	movf	((menu_draw_input@flag))&0ffh,w
iorwf	((menu_draw_input@flag+1))&0ffh,w
	btfsc	status,2
	goto	u13121
	goto	u13120

u13121:
	goto	l10008
u13120:
	
l10004:; BSR set to: 0

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
	goto	u13131
	goto	u13130
u13131:
	goto	l10008
u13130:
	line	1140
	
l10006:; BSR set to: 0

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
	goto	l10042
	line	1144
	
l10008:
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
	goto	l10042
	line	1150
	
l10010:; BSR set to: 2

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts_1380)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts_1380+1)
	line	1151
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag_1384)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag_1384+1)
	line	1153
	
l10012:
	movlb	0	; () banked
	movf	((menu_draw_input@opts_1380))&0ffh,w
iorwf	((menu_draw_input@opts_1380+1))&0ffh,w
	btfsc	status,2
	goto	u13141
	goto	u13140

u13141:
	goto	l10030
u13140:
	
l10014:; BSR set to: 0

	movf	((menu_draw_input@flag_1384))&0ffh,w
iorwf	((menu_draw_input@flag_1384+1))&0ffh,w
	btfsc	status,2
	goto	u13151
	goto	u13150

u13151:
	goto	l10030
u13150:
	
l10016:; BSR set to: 0

	movff	(menu_draw_input@flag_1384),fsr2l
	movff	(menu_draw_input@flag_1384+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	01h
	addwf	((menu_draw_input@opts_1380))&0ffh,w
	movwf	(??_menu_draw_input+1+0)^00h,c
	movlw	0
	addwfc	((menu_draw_input@opts_1380+1))&0ffh,w
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
	goto	u13161
	goto	u13160
u13161:
	goto	l10030
u13160:
	line	1155
	
l10018:; BSR set to: 0

	movff	(menu_draw_input@flag_1384),fsr2l
	movff	(menu_draw_input@flag_1384+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movf	((??_menu_draw_input+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_input+1+0
	movff	prodh,??_menu_draw_input+1+0+1
	movf	(??_menu_draw_input+1+0)^00h,c,w
	addwf	((menu_draw_input@opts_1380))&0ffh,w
	movwf	(??_menu_draw_input+3+0)^00h,c
	movf	(??_menu_draw_input+1+1)^00h,c,w
	addwfc	((menu_draw_input@opts_1380+1))&0ffh,w
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
	
l10020:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j))&0ffh
	goto	l10026
	line	1157
	
l10022:; BSR set to: 0

	movf	((menu_draw_input@j))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1156
	
l10024:; BSR set to: 0

	incf	((menu_draw_input@j))&0ffh
	
l10026:; BSR set to: 0

		movf	((menu_draw_input@val_len))&0ffh,w
	subwf	((menu_draw_input@j))&0ffh,w
	btfss	status,0
	goto	u13171
	goto	u13170

u13171:
	goto	l10022
u13170:
	line	1158
	
l10028:; BSR set to: 0

	movf	((menu_draw_input@val_len))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1159
	goto	l10042
	line	1162
	
l10030:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_195)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_195)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l10042
	line	1175
	
l10034:; BSR set to: 2

	movlw	low(01h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l10008
	line	1182
	
l10038:; BSR set to: 2

	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l10008
	line	1187
	
l10042:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_1388))&0ffh
	line	1188
	
l10044:; BSR set to: 0

	movf	((menu_draw_input@val_len_1388))&0ffh,w
	btfsc	status,2
	goto	u13181
	goto	u13180
u13181:
	goto	l10080
u13180:
	
l10046:; BSR set to: 0

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
		movlw	low(STR_196)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_196)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u13191
	goto	u13190

u13191:
	goto	l10080
u13190:
	line	1191
	
l10048:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u13201
	goto	u13200
u13201:
	goto	l10056
u13200:
	
l10050:; BSR set to: 2

	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13211
	goto	u13210

u13211:
	goto	l10056
u13210:
	line	1194
	
l10052:; BSR set to: 2

	movff	(menu_draw_input@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_numeric_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u13221
	goto	u13220
u13221:
	goto	l10080
u13220:
	
l10054:
	movff	(menu_draw_input@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_time_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u13231
	goto	u13230
u13231:
	goto	l10056
u13230:
	goto	l10080
	line	1201
	
l10056:
	movlb	0	; () banked
	movf	((menu_draw_input@show_brackets))&0ffh,w
	btfss	status,2
	goto	u13241
	goto	u13240
u13241:
	goto	l10060
u13240:
	line	1204
	
l10058:; BSR set to: 0

	movf	((menu_draw_input@val_len_1388))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	1205
	goto	l10080
	line	1209
	
l10060:; BSR set to: 0

	movf	((menu_draw_input@val_len_1388))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_input@start_pos))&0ffh
	line	1210
	
l10062:; BSR set to: 0

	movff	(menu_draw_input@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1213
	
l10064:
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u13251
	goto	u13250

u13251:
	goto	l10068
u13250:
	
l10066:; BSR set to: 0

		movlw	low(STR_198)
	movwf	((_menu_draw_input$1394))&0ffh
	movlw	high(STR_198)
	movwf	((_menu_draw_input$1394+1))&0ffh

	goto	l10070
	
l10068:; BSR set to: 0

		movlw	low(STR_197)
	movwf	((_menu_draw_input$1394))&0ffh
	movlw	high(STR_197)
	movwf	((_menu_draw_input$1394+1))&0ffh

	
l10070:; BSR set to: 0

		movff	(_menu_draw_input$1394),(c:lcd_print@str)
	movff	(_menu_draw_input$1394+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1215
	
l10072:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1217
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u13261
	goto	u13260

u13261:
	goto	l10076
u13260:
	
l10074:; BSR set to: 0

		movlw	low(STR_200)
	movwf	((_menu_draw_input$1398))&0ffh
	movlw	high(STR_200)
	movwf	((_menu_draw_input$1398+1))&0ffh

	goto	l10078
	
l10076:; BSR set to: 0

		movlw	low(STR_199)
	movwf	((_menu_draw_input$1398))&0ffh
	movlw	high(STR_199)
	movwf	((_menu_draw_input$1398+1))&0ffh

	
l10078:; BSR set to: 0

		movff	(_menu_draw_input$1398),(c:lcd_print@str)
	movff	(_menu_draw_input$1398+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1111
	
l10080:
	movlb	0	; () banked
	incf	((menu_draw_input@i))&0ffh
	
l10082:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_input@i))&0ffh
	goto	u13271
	goto	u13270

u13271:
	goto	l945
u13270:
	
l10084:; BSR set to: 0

	movlb	2	; () banked
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
	goto	u13281
	goto	u13280

u13281:
	goto	l9980
u13280:
	line	1221
	
l945:; BSR set to: 0

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
;;		 -> value_enable(10), value_relay_pulse(10), NULL(0), STR_68(1), 
;;		 -> STR_67(1), STR_66(9), STR_65(6), STR_64(6), 
;;		 -> STR_63(1), STR_62(1), STR_61(1), STR_60(5), 
;;		 -> STR_59(5), STR_58(1), STR_57(1), STR_56(1), 
;;		 -> STR_55(4), STR_54(2), STR_53(1), STR_52(1), 
;;		 -> STR_51(1), STR_50(5), STR_49(4), STR_48(1), 
;;		 -> STR_47(1), STR_46(1), STR_45(8), STR_44(7), 
;;		 -> STR_43(1), STR_42(1), STR_41(5), STR_40(5), 
;;		 -> STR_39(9), STR_38(1), STR_37(1), STR_36(1), 
;;		 -> STR_35(8), STR_34(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   16[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_clock@value_buf(15), value_clock_display(10), value_end_runtime(10), value_clock_enable(10), 
;;		 -> menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), value_rlylow(10), 
;;		 -> value_flow_type(10), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), value_relay_pulse(10), NULL(0), STR_68(1), 
;;		 -> STR_67(1), STR_66(9), STR_65(6), STR_64(6), 
;;		 -> STR_63(1), STR_62(1), STR_61(1), STR_60(5), 
;;		 -> STR_59(5), STR_58(1), STR_57(1), STR_56(1), 
;;		 -> STR_55(4), STR_54(2), STR_53(1), STR_52(1), 
;;		 -> STR_51(1), STR_50(5), STR_49(4), STR_48(1), 
;;		 -> STR_47(1), STR_46(1), STR_45(8), STR_44(7), 
;;		 -> STR_43(1), STR_42(1), STR_41(5), STR_40(5), 
;;		 -> STR_39(9), STR_38(1), STR_37(1), STR_36(1), 
;;		 -> STR_35(8), STR_34(9), 
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
psect	text21,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
global __ptext21
__ptext21:
psect	text21
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
	
_strlen:; BSR set to: 0

;incstack = 0
	callstack 26
	line	8
	
l9274:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l9278
	line	10
	
l9276:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l9278:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11847
	tblrd	*
	
	movf	tablat,w
	bra	u11840
u11847:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11840:
	iorlw	0
	btfss	status,2
	goto	u11851
	goto	u11850
u11851:
	goto	l9276
u11850:
	line	12
	
l9280:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l2160:
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
;;		 -> STR_226(5), value_clock_display(10), STR_224(9), STR_223(6), 
;;		 -> STR_222(6), value_end_runtime(10), value_clock_enable(10), STR_195(6), 
;;		 -> menu_update_edit_value@value_buf(10), value_no_flow_bp(10), STR_178(4), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), STR_173(4), STR_172(2), 
;;		 -> value_flow_units(10), STR_171(9), STR_170(6), STR_169(6), 
;;		 -> value_rlylow(10), STR_168(5), STR_167(5), STR_166(8), 
;;		 -> STR_165(7), value_flow_type(10), STR_164(5), STR_163(5), 
;;		 -> STR_162(5), STR_161(9), STR_160(6), STR_159(6), 
;;		 -> value_high_tbp(10), value_high_temp(10), STR_154(5), value_back(5), 
;;		 -> STR_153(5), STR_152(5), value_display(10), STR_151(9), 
;;		 -> STR_150(6), STR_149(6), value_rlyslp(10), STR_148(9), 
;;		 -> STR_147(6), STR_146(6), value_rlyplp(10), STR_145(9), 
;;		 -> STR_144(6), STR_143(6), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), STR_135(9), value_sensor(12), 
;;		 -> value_enable(10), value_relay_pulse(10), NULL(0), STR_68(1), 
;;		 -> STR_67(1), STR_66(9), STR_65(6), STR_64(6), 
;;		 -> STR_63(1), STR_62(1), STR_61(1), STR_60(5), 
;;		 -> STR_59(5), STR_58(1), STR_57(1), STR_56(1), 
;;		 -> STR_55(4), STR_54(2), STR_53(1), STR_52(1), 
;;		 -> STR_51(1), STR_50(5), STR_49(4), STR_48(1), 
;;		 -> STR_47(1), STR_46(1), STR_45(8), STR_44(7), 
;;		 -> STR_43(1), STR_42(1), STR_41(5), STR_40(5), 
;;		 -> STR_39(9), STR_38(1), STR_37(1), STR_36(1), 
;;		 -> STR_35(8), STR_34(9), 
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
;;		_rebuild_input_menu
;;		_menu_update_edit_value
;;		_menu_draw_input
;;		_rebuild_clock_menu
;;		_menu_draw_clock
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text22,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
global __ptext22
__ptext22:
psect	text22
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
	
_strcpy:
;incstack = 0
	callstack 26
	line	18
	
l9268:
		movff	(c:strcpy@to),(c:strcpy@cp)
	movff	(c:strcpy@to+1),(c:strcpy@cp+1)

	line	19
	goto	l9272
	line	20
	
l9270:
	infsnz	((c:strcpy@cp))^00h,c
	incf	((c:strcpy@cp+1))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l9272:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movff	(c:strcpy@cp),fsr2l
	movff	(c:strcpy@cp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11827
	tblrd	*
	
	movf	tablat,w
	bra	u11820
u11827:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11820:
	movwf	indf2
	movf	indf2,w
	btfss	status,2
	goto	u11831
	goto	u11830
u11831:
	goto	l9270
u11830:
	line	24
	
l2154:
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
;;		 -> STR_268(5), STR_267(6), STR_266(6), STR_265(8), 
;;		 -> STR_196(1), STR_68(1), STR_67(1), STR_66(9), 
;;		 -> STR_65(6), STR_64(6), STR_63(1), STR_62(1), 
;;		 -> STR_61(1), STR_60(5), STR_59(5), STR_58(1), 
;;		 -> STR_57(1), STR_56(1), STR_55(4), STR_54(2), 
;;		 -> STR_53(1), STR_52(1), STR_51(1), STR_50(5), 
;;		 -> STR_49(4), STR_48(1), STR_47(1), STR_46(1), 
;;		 -> STR_45(8), STR_44(7), STR_43(1), STR_42(1), 
;;		 -> STR_41(5), STR_40(5), STR_39(9), STR_38(1), 
;;		 -> STR_37(1), STR_36(1), STR_35(8), STR_34(9), 
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
psect	text23,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
global __ptext23
__ptext23:
psect	text23
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
	
_strcmp:
;incstack = 0
	callstack 26
	line	37
	
l6544:
	goto	l6548
	line	38
	
l6546:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l6548:
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
	goto	u7401
	goto	u7400
u7401:
	goto	l6552
u7400:
	
l6550:
	movff	(c:strcmp@s1),fsr2l
	movff	(c:strcmp@s1+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u7411
	goto	u7410
u7411:
	goto	l6546
u7410:
	line	41
	
l6552:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l2148:
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
;;  col             1   20[COMRAM] unsigned char 
;;  str             2   21[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_clock@value_buf(15), STR_229(6), Fake(1), STR_209(5), 
;;		 -> STR_208(5), STR_207(9), STR_206(5), STR_205(6), 
;;		 -> STR_204(1), STR_203(1), STR_202(1), menu_draw_input@value_buf(15), 
;;		 -> menu_draw_input@title(10), STR_120(5), STR_119(8), STR_118(10), 
;;		 -> STR_117(8), STR_116(7), STR_115(5), STR_114(8), 
;;		 -> STR_113(8), STR_112(12), STR_111(9), STR_110(11), 
;;		 -> STR_109(10), STR_108(6), STR_107(5), STR_106(7), 
;;		 -> STR_105(7), STR_104(5), STR_103(8), STR_102(8), 
;;		 -> STR_101(11), STR_100(8), STR_99(5), STR_98(7), 
;;		 -> STR_97(7), STR_96(5), STR_95(8), STR_94(9), 
;;		 -> STR_93(9), STR_92(10), STR_91(11), STR_90(10), 
;;		 -> STR_89(7), STR_88(7), STR_87(5), STR_86(8), 
;;		 -> STR_85(8), STR_84(8), STR_83(9), STR_82(6), 
;;		 -> STR_81(6), STR_80(13), STR_79(9), STR_78(12), 
;;		 -> STR_77(11), STR_76(10), STR_75(7), STR_74(7), 
;;		 -> STR_73(5), STR_72(6), STR_71(13), STR_70(11), 
;;		 -> STR_69(10), 
;; Auto vars:     Size  Location     Type
;;  row             1   23[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/2
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
psect	text24,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	612
global __ptext24
__ptext24:
psect	text24
	file	"src\menu.c"
	line	612
	
_lcd_print_at:
;incstack = 0
	callstack 23
	movwf	((c:lcd_print_at@row))^00h,c
	line	614
	
l9260:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	615
	
l9262:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	616
	
l657:
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
;;  row             1   20[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/2
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
psect	text25,class=CODE,space=0,reloc=2,group=0
	line	618
global __ptext25
__ptext25:
psect	text25
	file	"src\menu.c"
	line	618
	
_lcd_clear_line:
;incstack = 0
	callstack 23
	movwf	((c:lcd_clear_line@row))^00h,c
	line	620
	
l9264:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	621
	
l9266:
		movlw	low(STR_131)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_131)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	622
	
l660:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear_line
	__end_of_lcd_clear_line:
	signat	_lcd_clear_line,4217
	global	_lcd_set_cursor

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 221 in file "src\main.c"
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
;;		On entry : 0/2
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
psect	text26,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	221
global __ptext26
__ptext26:
psect	text26
	file	"src\main.c"
	line	221
	
_lcd_set_cursor:
;incstack = 0
	callstack 24
	movwf	((c:lcd_set_cursor@row))^00h,c
	line	224
	
l9242:
	goto	l9256
	line	227
	
l9244:
	movlw	low(080h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	228
	goto	l9258
	line	230
	
l9246:
	movlw	low(0C0h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	231
	goto	l9258
	line	233
	
l9248:
	movlw	low(094h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	234
	goto	l9258
	line	236
	
l9250:
	movlw	low(0D4h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	237
	goto	l9258
	line	224
	
l9256:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l9244
	xorlw	1^0	; case 1
	skipnz
	goto	l9246
	xorlw	2^1	; case 2
	skipnz
	goto	l9248
	xorlw	3^2	; case 3
	skipnz
	goto	l9250
	goto	l9244

	line	242
	
l9258:
	movf	((c:lcd_set_cursor@address))^00h,c,w
	addwf	((c:lcd_set_cursor@col))^00h,c,w
	
	call	_lcd_cmd
	line	243
	
l188:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
	signat	_lcd_set_cursor,8313
	global	_lcd_print

;; *************** function _lcd_print *****************
;; Defined at:
;;		line 207 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_233(2), STR_232(2), STR_231(2), STR_230(2), 
;;		 -> menu_draw_clock@value_buf(15), STR_229(6), STR_217(2), STR_216(2), 
;;		 -> STR_215(2), STR_214(2), STR_213(2), STR_212(2), 
;;		 -> STR_211(2), STR_210(2), Fake(1), STR_209(5), 
;;		 -> STR_208(5), STR_207(9), STR_206(5), STR_205(6), 
;;		 -> STR_204(1), STR_203(1), STR_202(1), STR_201(21), 
;;		 -> STR_200(2), STR_199(2), STR_198(2), STR_197(2), 
;;		 -> menu_draw_input@value_buf(15), menu_draw_input@title(10), STR_193(2), STR_192(2), 
;;		 -> STR_191(21), STR_190(2), STR_189(2), STR_188(6), 
;;		 -> menu_update_numeric_value@value_buf(6), STR_187(2), STR_186(2), STR_185(7), 
;;		 -> menu_update_edit_value@display_buf(10), STR_131(21), STR_130(2), STR_129(2), 
;;		 -> STR_128(8), menu_update_time_value@value_buf(6), STR_120(5), STR_119(8), 
;;		 -> STR_118(10), STR_117(8), STR_116(7), STR_115(5), 
;;		 -> STR_114(8), STR_113(8), STR_112(12), STR_111(9), 
;;		 -> STR_110(11), STR_109(10), STR_108(6), STR_107(5), 
;;		 -> STR_106(7), STR_105(7), STR_104(5), STR_103(8), 
;;		 -> STR_102(8), STR_101(11), STR_100(8), STR_99(5), 
;;		 -> STR_98(7), STR_97(7), STR_96(5), STR_95(8), 
;;		 -> STR_94(9), STR_93(9), STR_92(10), STR_91(11), 
;;		 -> STR_90(10), STR_89(7), STR_88(7), STR_87(5), 
;;		 -> STR_86(8), STR_85(8), STR_84(8), STR_83(9), 
;;		 -> STR_82(6), STR_81(6), STR_80(13), STR_79(9), 
;;		 -> STR_78(12), STR_77(11), STR_76(10), STR_75(7), 
;;		 -> STR_74(7), STR_73(5), STR_72(6), STR_71(13), 
;;		 -> STR_70(11), STR_69(10), STR_30(8), STR_29(12), 
;;		 -> STR_24(6), STR_23(12), STR_10(16), STR_9(13), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/2
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
psect	text27,class=CODE,space=0,reloc=2,group=0
	line	207
global __ptext27
__ptext27:
psect	text27
	file	"src\main.c"
	line	207
	
_lcd_print:
;incstack = 0
	callstack 23
	line	209
	
l9234:
	goto	l9240
	line	211
	
l9236:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11797
	tblrd	*
	
	movf	tablat,w
	bra	u11790
u11797:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11790:
	
	call	_lcd_data
	
l9238:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	209
	
l9240:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11807
	tblrd	*
	
	movf	tablat,w
	bra	u11800
u11807:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11800:
	iorlw	0
	btfss	status,2
	goto	u11811
	goto	u11810
u11811:
	goto	l9236
u11810:
	line	213
	
l175:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print
	__end_of_lcd_print:
	signat	_lcd_print,4217
	global	_lcd_data

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 199 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1   15[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/2
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
psect	text28,class=CODE,space=0,reloc=2,group=0
	line	199
global __ptext28
__ptext28:
psect	text28
	file	"src\main.c"
	line	199
	
_lcd_data:
;incstack = 0
	callstack 23
	movwf	((c:lcd_data@data))^00h,c
	line	201
	
l9228:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	202
	
l9230:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	203
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	204
	
l9232:
	asmopt push
asmopt off
	movlw	133
u16347:
decfsz	wreg,f
	bra	u16347
	nop
asmopt pop

	line	205
	
l169:
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
;;		On entry : 3D/2
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
psect	text29,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	229
global __ptext29
__ptext29:
psect	text29
	file	"src\menu.c"
	line	229
	
_is_time_field:
;incstack = 0
	callstack 27
	movwf	((c:is_time_field@line))^00h,c
	line	231
	
l6130:
	movf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6571
	goto	u6570
u6571:
	goto	l6146
u6570:
	line	234
	
l6132:
	movlw	low(01h)
	movwf	((c:_is_time_field$1153))^00h,c
	
l6134:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6581
	goto	u6580

u6581:
	goto	l530
u6580:
	
l6136:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6591
	goto	u6590

u6591:
	goto	l530
u6590:
	
l6138:
		movlw	8
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6601
	goto	u6600

u6601:
	goto	l530
u6600:
	
l6140:
	movlw	low(0)
	movwf	((c:_is_time_field$1153))^00h,c
	
l530:
	movf	((c:_is_time_field$1153))^00h,c,w
	goto	l531
	line	236
	
l6146:
		decf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6611
	goto	u6610

u6611:
	goto	l6154
u6610:
	line	239
	
l6148:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6621
	goto	u6620

u6621:
	movlw	1
	goto	u6630
u6620:
	movlw	0
u6630:
	goto	l531
	line	241
	
l6154:
		movlw	2
	xorwf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6641
	goto	u6640

u6641:
	goto	l6168
u6640:
	line	243
	
l6156:
	movf	((c:is_time_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u6651
	goto	u6650
u6651:
	goto	l6164
u6650:
	line	246
	
l6158:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6661
	goto	u6660

u6661:
	movlw	1
	goto	u6670
u6660:
	movlw	0
u6670:
	goto	l531
	line	251
	
l6164:
		movlw	4
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6681
	goto	u6680

u6681:
	movlw	1
	goto	u6690
u6680:
	movlw	0
u6690:
	goto	l531
	line	255
	
l6168:
	movlw	(0)&0ffh
	line	256
	
l531:
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
;;		On entry : 3D/2
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
psect	text30,class=CODE,space=0,reloc=2,group=0
	line	261
global __ptext30
__ptext30:
psect	text30
	file	"src\menu.c"
	line	261
	
_is_option_field:
;incstack = 0
	callstack 26
	movwf	((c:is_option_field@line))^00h,c
	line	264
	
l6258:
	movf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6811
	goto	u6810
u6811:
	goto	l6262
u6810:
	
l6260:
		decf	((c:is_option_field@line))^00h,c,w
	btfss	status,2
	goto	u6821
	goto	u6820

u6821:
	goto	l6266
u6820:
	line	265
	
l6262:
	movlw	(01h)&0ffh
	goto	l543
	line	267
	
l6266:
	movf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6831
	goto	u6830
u6831:
	goto	l6284
u6830:
	line	270
	
l6268:
	movlw	low(01h)
	movwf	((c:_is_option_field$1158))^00h,c
	
l6270:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6841
	goto	u6840

u6841:
	goto	l546
u6840:
	
l6272:
		movlw	10
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6851
	goto	u6850

u6851:
	goto	l546
u6850:
	
l6274:
		movlw	11
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6861
	goto	u6860

u6861:
	goto	l546
u6860:
	
l6276:
		movlw	12
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6871
	goto	u6870

u6871:
	goto	l546
u6870:
	
l6278:
	movlw	low(0)
	movwf	((c:_is_option_field$1158))^00h,c
	
l546:
	movf	((c:_is_option_field$1158))^00h,c,w
	goto	l543
	line	272
	
l6284:
		decf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6881
	goto	u6880

u6881:
	goto	l6298
u6880:
	line	275
	
l6286:
	movlw	low(01h)
	movwf	((c:_is_option_field$1159))^00h,c
	
l6288:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6891
	goto	u6890

u6891:
	goto	l550
u6890:
	
l6290:
		movlw	7
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6901
	goto	u6900

u6901:
	goto	l550
u6900:
	
l6292:
	movlw	low(0)
	movwf	((c:_is_option_field$1159))^00h,c
	
l550:
	movf	((c:_is_option_field$1159))^00h,c,w
	goto	l543
	line	277
	
l6298:
		movlw	2
	xorwf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6911
	goto	u6910

u6911:
	goto	l6332
u6910:
	line	279
	
l6300:
	movf	((c:is_option_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u6921
	goto	u6920
u6921:
	goto	l6318
u6920:
	line	282
	
l6302:
	movlw	low(01h)
	movwf	((c:_is_option_field$1160))^00h,c
	
l6304:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6931
	goto	u6930

u6931:
	goto	l555
u6930:
	
l6306:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6941
	goto	u6940

u6941:
	goto	l555
u6940:
	
l6308:
		movlw	8
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6951
	goto	u6950

u6951:
	goto	l555
u6950:
	
l6310:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6961
	goto	u6960

u6961:
	goto	l555
u6960:
	
l6312:
	movlw	low(0)
	movwf	((c:_is_option_field$1160))^00h,c
	
l555:
	movf	((c:_is_option_field$1160))^00h,c,w
	goto	l543
	line	287
	
l6318:
	movlw	low(01h)
	movwf	((c:_is_option_field$1161))^00h,c
	
l6320:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6971
	goto	u6970

u6971:
	goto	l558
u6970:
	
l6322:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6981
	goto	u6980

u6981:
	goto	l558
u6980:
	
l6324:
		movlw	5
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6991
	goto	u6990

u6991:
	goto	l558
u6990:
	
l6326:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7001
	goto	u7000

u7001:
	goto	l558
u7000:
	
l6328:
	movlw	low(0)
	movwf	((c:_is_option_field$1161))^00h,c
	
l558:
	movf	((c:_is_option_field$1161))^00h,c,w
	goto	l543
	line	291
	
l6332:
	movlw	(0)&0ffh
	line	292
	
l543:
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
;;		On entry : 3D/2
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
psect	text31,class=CODE,space=0,reloc=2,group=0
	line	197
global __ptext31
__ptext31:
psect	text31
	file	"src\menu.c"
	line	197
	
_is_numeric_field:
;incstack = 0
	callstack 27
	movwf	((c:is_numeric_field@line))^00h,c
	line	199
	
l9524:
	movf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u12241
	goto	u12240
u12241:
	goto	l9542
u12240:
	line	202
	
l9526:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1146))^00h,c
	
l9528:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12251
	goto	u12250

u12251:
	goto	l514
u12250:
	
l9530:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12261
	goto	u12260

u12261:
	goto	l514
u12260:
	
l9532:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12271
	goto	u12270

u12271:
	goto	l514
u12270:
	
l9534:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12281
	goto	u12280

u12281:
	goto	l514
u12280:
	
l9536:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1146))^00h,c
	
l514:
	movf	((c:_is_numeric_field$1146))^00h,c,w
	goto	l515
	line	204
	
l9542:
		decf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u12291
	goto	u12290

u12291:
	goto	l9558
u12290:
	line	207
	
l9544:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1147))^00h,c
	
l9546:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12301
	goto	u12300

u12301:
	goto	l519
u12300:
	
l9548:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12311
	goto	u12310

u12311:
	goto	l519
u12310:
	
l9550:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12321
	goto	u12320

u12321:
	goto	l519
u12320:
	
l9552:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1147))^00h,c
	
l519:
	movf	((c:_is_numeric_field$1147))^00h,c,w
	goto	l515
	line	209
	
l9558:
		movlw	2
	xorwf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u12331
	goto	u12330

u12331:
	goto	l9576
u12330:
	line	211
	
l9560:
	movf	((c:is_numeric_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u12341
	goto	u12340
u12341:
	goto	l9576
u12340:
	line	214
	
l9562:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1148))^00h,c
	
l9564:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12351
	goto	u12350

u12351:
	goto	l524
u12350:
	
l9566:
		movlw	5
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12361
	goto	u12360

u12361:
	goto	l524
u12360:
	
l9568:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12371
	goto	u12370

u12371:
	goto	l524
u12370:
	
l9570:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1148))^00h,c
	
l524:
	movf	((c:_is_numeric_field$1148))^00h,c,w
	goto	l515
	line	219
	
l9576:
	movlw	(0)&0ffh
	line	224
	
l515:
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
;;		On entry : 3D/2
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
psect	text32,class=CODE,space=0,reloc=2,group=0
	line	298
global __ptext32
__ptext32:
psect	text32
	file	"src\menu.c"
	line	298
	
_get_option_edit_flag:
;incstack = 0
	callstack 26
	movwf	((c:get_option_edit_flag@line))^00h,c
	line	301
	
l6336:
	movf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7011
	goto	u7010
u7011:
	goto	l6342
u7010:
	line	302
	
l6338:
		movlw	low(_enable_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l562
	line	303
	
l6342:
		decf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7021
	goto	u7020

u7021:
	goto	l6348
u7020:
	line	304
	
l6344:
		movlw	low(_sensor_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l562
	line	307
	
l6348:
	movf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7031
	goto	u7030
u7031:
	goto	l6374
u7030:
	line	309
	
l6350:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7041
	goto	u7040

u7041:
	goto	l6356
u7040:
	line	310
	
l6352:
		movlw	low(_relay_high_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l562
	line	311
	
l6356:
		movlw	10
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7051
	goto	u7050

u7051:
	goto	l6362
u7050:
	line	312
	
l6358:
		movlw	low(_relay_plp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l562
	line	313
	
l6362:
		movlw	11
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7061
	goto	u7060

u7061:
	goto	l6368
u7060:
	line	314
	
l6364:
		movlw	low(_relay_slp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l562
	line	315
	
l6368:
		movlw	12
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7071
	goto	u7070

u7071:
	goto	l6434
u7070:
	line	316
	
l6370:
		movlw	low(_display_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l562
	line	319
	
l6374:
		decf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7081
	goto	u7080

u7081:
	goto	l6388
u7080:
	line	321
	
l6376:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7091
	goto	u7090

u7091:
	goto	l6382
u7090:
	goto	l6352
	line	323
	
l6382:
		movlw	7
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7101
	goto	u7100

u7101:
	goto	l6434
u7100:
	goto	l6370
	line	327
	
l6388:
		movlw	2
	xorwf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7111
	goto	u7110

u7111:
	goto	l6434
u7110:
	line	329
	
l6390:
		movlw	2
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7121
	goto	u7120

u7121:
	goto	l6396
u7120:
	line	330
	
l6392:
		movlw	low(_flow_type_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l562
	line	332
	
l6396:
	movf	((c:get_option_edit_flag@flow_type))^00h,c,w
	btfss	status,2
	goto	u7131
	goto	u7130
u7131:
	goto	l6416
u7130:
	line	334
	
l6398:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7141
	goto	u7140

u7141:
	goto	l6404
u7140:
	line	335
	
l6400:
		movlw	low(_flow_units_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l562
	line	336
	
l6404:
		movlw	8
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7151
	goto	u7150

u7151:
	goto	l6410
u7150:
	line	337
	
l6406:
		movlw	low(_relay_low_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l562
	line	338
	
l6410:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7161
	goto	u7160

u7161:
	goto	l6434
u7160:
	goto	l6370
	line	343
	
l6416:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7171
	goto	u7170

u7171:
	goto	l6422
u7170:
	line	344
	
l6418:
		movlw	low(_no_flow_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l562
	line	345
	
l6422:
		movlw	5
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7181
	goto	u7180

u7181:
	goto	l6428
u7180:
	goto	l6406
	line	347
	
l6428:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7191
	goto	u7190

u7191:
	goto	l6434
u7190:
	goto	l6370
	line	352
	
l6434:
		movlw	low(0)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(0)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	line	353
	
l562:
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
;;		On entry : 3D/2
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
psect	text33,class=CODE,space=0,reloc=2,group=0
	line	359
global __ptext33
__ptext33:
psect	text33
	file	"src\menu.c"
	line	359
	
_get_item_options_for_field:
;incstack = 0
	callstack 26
	movwf	((c:get_item_options_for_field@line))^00h,c
	line	362
	
l6438:
	movf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7201
	goto	u7200
u7201:
	goto	l6444
u7200:
	line	363
	
l6440:
		movlw	low(_menu_item_options)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l587
	line	364
	
l6444:
		decf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7211
	goto	u7210

u7211:
	goto	l6450
u7210:
	line	365
	
l6446:
		movlw	low(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l587
	line	368
	
l6450:
	movf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7221
	goto	u7220
u7221:
	goto	l6468
u7220:
	line	370
	
l6452:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u7231
	goto	u7230

u7231:
	goto	l6458
u7230:
	
l6454:
		movlw	10
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u7241
	goto	u7240

u7241:
	goto	l6458
u7240:
	
l6456:
		movlw	11
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7251
	goto	u7250

u7251:
	goto	l6462
u7250:
	line	371
	
l6458:
		movlw	low(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l587
	line	372
	
l6462:
		movlw	12
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7261
	goto	u7260

u7261:
	goto	l6528
u7260:
	line	373
	
l6464:
		movlw	low(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l587
	line	376
	
l6468:
		decf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7271
	goto	u7270

u7271:
	goto	l6482
u7270:
	line	378
	
l6470:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7281
	goto	u7280

u7281:
	goto	l6476
u7280:
	goto	l6458
	line	380
	
l6476:
		movlw	7
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7291
	goto	u7290

u7291:
	goto	l6528
u7290:
	goto	l6464
	line	384
	
l6482:
		movlw	2
	xorwf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7301
	goto	u7300

u7301:
	goto	l6528
u7300:
	line	386
	
l6484:
		movlw	2
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7311
	goto	u7310

u7311:
	goto	l6490
u7310:
	line	387
	
l6486:
		movlw	low(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l587
	line	389
	
l6490:
	movf	((c:get_item_options_for_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u7321
	goto	u7320
u7321:
	goto	l6510
u7320:
	line	391
	
l6492:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7331
	goto	u7330

u7331:
	goto	l6498
u7330:
	line	392
	
l6494:
		movlw	low(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l587
	line	393
	
l6498:
		movlw	8
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7341
	goto	u7340

u7341:
	goto	l6504
u7340:
	goto	l6458
	line	395
	
l6504:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7351
	goto	u7350

u7351:
	goto	l6528
u7350:
	goto	l6464
	line	400
	
l6510:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7361
	goto	u7360

u7361:
	goto	l6516
u7360:
	line	401
	
l6512:
		movlw	low(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l587
	line	402
	
l6516:
		movlw	5
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7371
	goto	u7370

u7371:
	goto	l6522
u7370:
	goto	l6458
	line	404
	
l6522:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7381
	goto	u7380

u7381:
	goto	l6528
u7380:
	goto	l6464
	line	409
	
l6528:
		movlw	low(0)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(0)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	line	410
	
l587:
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
;;  value_second    2   57[COMRAM] unsigned int 
;;  mode            1   59[COMRAM] unsigned char 
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
psect	text34,class=CODE,space=0,reloc=2,group=0
	line	419
global __ptext34
__ptext34:
psect	text34
	file	"src\menu.c"
	line	419
	
_init_time_editor:
;incstack = 0
	callstack 24
	line	422
	
l10168:
	movff	(c:init_time_editor@mode),0+(_menu+010h)
	line	423
	movff	(c:init_time_editor@value_seconds),0+(_menu+014h)
	movff	(c:init_time_editor@value_seconds+1),1+(_menu+014h)
	line	426
	
l10170:
	movf	((c:init_time_editor@mode))^00h,c,w
	btfss	status,2
	goto	u13401
	goto	u13400
u13401:
	goto	l10174
u13400:
	line	428
	
l10172:
	movff	(c:init_time_editor@value_seconds),(c:___lwdiv@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	movlb	2	; () banked
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
	movlb	2	; () banked
	movwf	(0+(_menu+013h))&0ffh
	line	430
	goto	l10176
	line	433
	
l10174:
	movff	(c:init_time_editor@value_seconds),(c:___lwdiv@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwdiv@dividend+1)
	movlw	high(0E10h)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(0E10h)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	movlb	2	; () banked
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
	movlb	2	; () banked
	movwf	(0+(_menu+013h))&0ffh
	line	438
	
l10176:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+011h))&0ffh
	line	443
	
l10178:; BSR set to: 2

		movlw	low(init_time_editor@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_121)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_121)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:init_time_editor@value_seconds),0+((c:?_sprintf)+04h)
	movff	(c:init_time_editor@value_seconds+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+012h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	444
	
l10180:
		movlw	low(init_time_editor@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	445
	
l613:
	return	;funcret
	callstack 0
GLOBAL	__end_of_init_time_editor
	__end_of_init_time_editor:
	signat	_init_time_editor,8313
	global	_uart_println

;; *************** function _uart_println *****************
;; Defined at:
;;		line 77 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   17[COMRAM] PTR const unsigned char 
;;		 -> STR_269(20), STR_264(25), menu_handle_button@buf_1564(50), menu_handle_button@buf_1554(50), 
;;		 -> STR_251(27), menu_handle_button@buf_1532(50), menu_handle_button@buf(50), menu_handle_encoder@buf_1499(50), 
;;		 -> menu_handle_encoder@buf_1496(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), handle_numeric_rotation@buf(50), 
;;		 -> STR_181(31), rebuild_input_menu@buf(50), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), STR_122(29), init_time_editor@buf(60), STR_33(21), 
;;		 -> STR_32(20), STR_31(36), STR_28(33), STR_27(21), 
;;		 -> STR_26(20), STR_25(22), STR_22(26), STR_21(15), 
;;		 -> STR_20(20), main@buf_670(30), main@buf_643(40), main@buf_640(60), 
;;		 -> STR_16(19), STR_15(22), STR_14(22), STR_13(24), 
;;		 -> STR_12(19), STR_11(22), STR_8(23), STR_7(28), 
;;		 -> main@buf(50), STR_5(23), STR_4(29), STR_2(42), 
;;		 -> trigger_relay_pulse@buf(60), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/4
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
;; This function uses a non-reentrant model
;;
psect	text35,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	77
global __ptext35
__ptext35:
psect	text35
	file	"src\main.c"
	line	77
	
_uart_println:
;incstack = 0
	callstack 26
	line	79
	
l5880:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	80
	
l5882:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	81
	
l5884:
	movlw	(0Ah)&0ffh
	
	call	_uart_write
	line	82
	
l130:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_println
	__end_of_uart_println:
	signat	_uart_println,4217
	global	_uart_print

;; *************** function _uart_print *****************
;; Defined at:
;;		line 69 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   15[COMRAM] PTR const unsigned char 
;;		 -> STR_269(20), STR_264(25), menu_handle_button@buf_1564(50), menu_handle_button@buf_1554(50), 
;;		 -> STR_251(27), menu_handle_button@buf_1532(50), menu_handle_button@buf(50), menu_handle_encoder@buf_1499(50), 
;;		 -> menu_handle_encoder@buf_1496(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), handle_numeric_rotation@buf(50), 
;;		 -> STR_181(31), rebuild_input_menu@buf(50), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), STR_122(29), init_time_editor@buf(60), STR_33(21), 
;;		 -> STR_32(20), STR_31(36), STR_28(33), STR_27(21), 
;;		 -> STR_26(20), STR_25(22), STR_22(26), STR_21(15), 
;;		 -> STR_20(20), main@buf_670(30), main@buf_643(40), main@buf_640(60), 
;;		 -> STR_16(19), STR_15(22), STR_14(22), STR_13(24), 
;;		 -> STR_12(19), STR_11(22), STR_8(23), STR_7(28), 
;;		 -> main@buf(50), STR_5(23), STR_4(29), STR_2(42), 
;;		 -> trigger_relay_pulse@buf(60), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/4
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
psect	text36,class=CODE,space=0,reloc=2,group=0
	line	69
global __ptext36
__ptext36:
psect	text36
	file	"src\main.c"
	line	69
	
_uart_print:
;incstack = 0
	callstack 26
	line	71
	
l5786:
	goto	l5792
	line	73
	
l5788:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5977
	tblrd	*
	
	movf	tablat,w
	bra	u5970
u5977:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5970:
	
	call	_uart_write
	
l5790:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	71
	
l5792:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5987
	tblrd	*
	
	movf	tablat,w
	bra	u5980
u5987:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5980:
	iorlw	0
	btfss	status,2
	goto	u5991
	goto	u5990
u5991:
	goto	l5788
u5990:
	line	75
	
l127:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_print
	__end_of_uart_print:
	signat	_uart_print,4217
	global	_uart_write

;; *************** function _uart_write *****************
;; Defined at:
;;		line 62 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1   14[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
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
;;		_uart_print
;;		_uart_println
;; This function uses a non-reentrant model
;;
psect	text37,class=CODE,space=0,reloc=2,group=0
	line	62
global __ptext37
__ptext37:
psect	text37
	file	"src\main.c"
	line	62
	
_uart_write:
;incstack = 0
	callstack 27
	movwf	((c:uart_write@c))^00h,c
	line	64
	
l5756:
	line	65
	
l118:
	line	64
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u5931
	goto	u5930
u5931:
	goto	l118
u5930:
	line	66
	
l5758:
	movff	(c:uart_write@c),(c:4013)	;volatile
	line	67
	
l121:
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
;;		 -> menu_handle_button@buf_1564(50), menu_handle_button@buf_1554(50), menu_handle_button@buf_1532(50), menu_handle_button@buf(50), 
;;		 -> menu_handle_encoder@buf_1499(50), menu_handle_encoder@buf_1496(50), menu_handle_encoder@buf(50), value_clock_display(10), 
;;		 -> value_end_runtime(10), value_clock_enable(10), rebuild_clock_menu@buf(50), menu_draw_input@title(10), 
;;		 -> menu_update_edit_value@value_buf(10), handle_numeric_rotation@buf(50), rebuild_input_menu@buf(50), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> value_relay_pulse(10), handle_time_rotation@buf(50), init_time_editor@buf(60), NULL(0), 
;;		 -> main@buf_670(30), main@buf_643(40), main@buf_640(60), main@buf(50), 
;;		 -> trigger_relay_pulse@buf(60), 
;;  f               2   28[COMRAM] PTR const unsigned char 
;;		 -> STR_263(32), STR_262(38), STR_261(5), STR_260(6), 
;;		 -> STR_259(6), STR_258(5), STR_257(6), STR_256(6), 
;;		 -> STR_255(5), STR_254(5), STR_253(6), STR_252(6), 
;;		 -> STR_250(10), STR_249(26), STR_248(42), STR_247(32), 
;;		 -> STR_246(10), STR_245(10), STR_244(26), STR_243(28), 
;;		 -> STR_242(25), STR_241(20), STR_240(26), STR_239(35), 
;;		 -> STR_238(28), STR_237(37), STR_236(32), STR_235(23), 
;;		 -> STR_234(37), STR_228(29), STR_227(46), STR_225(10), 
;;		 -> STR_219(3), STR_218(35), STR_194(9), STR_184(9), 
;;		 -> STR_183(7), STR_182(29), STR_180(48), STR_179(10), 
;;		 -> STR_177(10), STR_176(5), STR_175(6), STR_174(6), 
;;		 -> STR_158(10), STR_157(3), STR_156(6), STR_155(6), 
;;		 -> STR_142(10), STR_141(10), STR_140(5), STR_139(10), 
;;		 -> STR_138(5), STR_137(6), STR_136(6), STR_132(3), 
;;		 -> STR_127(27), STR_126(51), STR_125(3), STR_124(25), 
;;		 -> STR_123(45), STR_121(35), STR_19(17), STR_18(23), 
;;		 -> STR_17(35), STR_6(39), STR_3(27), STR_1(48), 
;; Auto vars:     Size  Location     Type
;;  tmpval          4    0        struct .
;;  width           2   54[COMRAM] int 
;;  len             2   51[COMRAM] unsigned int 
;;  val             2   49[COMRAM] unsigned int 
;;  cp              2   46[COMRAM] PTR const unsigned char 
;;		 -> STR_270(7), sprintf@c(1), ?_sprintf(2), value_clock_display(10), 
;;		 -> value_end_runtime(10), STR_221(9), STR_220(8), value_clock_enable(10), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), STR_134(9), STR_133(8), 
;;		 -> value_enable(10), value_relay_pulse(10), menu_update_time_value@value_buf(6), display_edit_flag(1), 
;;		 -> relay_high_edit_flag(1), NULL(0), menu_item_options$option_count(1), STR_68(1), 
;;		 -> STR_67(1), STR_66(9), STR_65(6), STR_64(6), 
;;		 -> STR_63(1), STR_62(1), STR_61(1), STR_60(5), 
;;		 -> STR_59(5), STR_58(1), STR_57(1), STR_56(1), 
;;		 -> STR_55(4), STR_54(2), STR_53(1), STR_52(1), 
;;		 -> STR_51(1), STR_50(5), STR_49(4), STR_48(1), 
;;		 -> STR_47(1), STR_46(1), STR_45(8), STR_44(7), 
;;		 -> STR_43(1), STR_42(1), STR_41(5), STR_40(5), 
;;		 -> STR_39(9), STR_38(1), STR_37(1), STR_36(1), 
;;		 -> STR_35(8), STR_34(9), enable_edit_flag(1), 
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
;;		On entry : 0/4
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
;; This function uses a non-reentrant model
;;
psect	text38,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
global __ptext38
__ptext38:
psect	text38
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
	
_sprintf:
;incstack = 0
	callstack 27
	line	550
	
l9340:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l9514
	line	555
	
l9342:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u11941
	goto	u11940

u11941:
	goto	l9348
u11940:
	line	558
	
l9344:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l9346:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l9514
	line	563
	
l9348:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	565
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	goto	l9358
	line	578
	
l9350:
	bsf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	579
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	580
	goto	l9358
	line	585
	
l9352:
	bsf	(0+(1/8)+(c:sprintf@flag))^00h,c,(1)&7
	line	586
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	587
	goto	l9358
	line	597
	
l9354:
	bsf	(0+(2/8)+(c:sprintf@flag))^00h,c,(2)&7
	line	598
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	568
	
l9358:
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
	goto	l9350
	xorlw	43^32	; case 43
	skipnz
	goto	l9352
	xorlw	48^43	; case 48
	skipnz
	goto	l9354
	goto	l1407

	line	603
	
l1407:
	line	606
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u11951
	goto	u11950
u11951:
	goto	l9362
u11950:
	line	607
	
l9360:
	bcf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	614
	
l9362:
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
	goto	u11961
	goto	u11960
u11961:
	goto	l9418
u11960:
	line	615
	
l9364:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	617
	
l9366:
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
	
l9368:
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

	
l9370:
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	619
	
l9372:
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
	goto	u11971
	goto	u11970
u11971:
	goto	l9366
u11970:
	goto	l9418
	line	760
	
l9374:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l9376:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l9378:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u11981
	goto	u11980

u11981:
	goto	l9382
u11980:
	line	767
	
l9380:
		movlw	low(STR_270)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_270)
	movwf	((c:sprintf@cp+1))^00h,c

	line	771
	
l9382:
	movlw	high(0)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@len))^00h,c
	line	772
	goto	l9386
	line	773
	
l9384:
	infsnz	((c:sprintf@len))^00h,c
	incf	((c:sprintf@len+1))^00h,c
	line	772
	
l9386:
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
	bra	u11997
	tblrd	*
	
	movf	tablat,w
	bra	u11990
u11997:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11990:
	iorlw	0
	btfss	status,2
	goto	u12001
	goto	u12000
u12001:
	goto	l9384
u12000:
	line	783
	
l9388:
		movf	((c:sprintf@width))^00h,c,w
	subwf	((c:sprintf@len))^00h,c,w
	movf	((c:sprintf@width+1))^00h,c,w
	subwfb	((c:sprintf@len+1))^00h,c,w
	btfsc	status,0
	goto	u12011
	goto	u12010

u12011:
	goto	l9392
u12010:
	line	784
	
l9390:
	movf	((c:sprintf@len))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	subwfb	((c:sprintf@width+1))^00h,c

	goto	l9398
	line	786
	
l9392:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	goto	l9398
	line	791
	
l9394:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l9396:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	790
	
l9398:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
		incf	((c:sprintf@width))^00h,c,w
	bnz	u12021
	incf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u12021
	goto	u12020

u12021:
	goto	l9394
u12020:
	goto	l9406
	line	794
	
l9400:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u12037
	tblrd	*
	
	movf	tablat,w
	bra	u12030
u12037:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u12030:
	movwf	indf2
	
l9402:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l9404:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	793
	
l9406:
	decf	((c:sprintf@len))^00h,c
	btfss	status,0
	decf	((c:sprintf@len+1))^00h,c
		incf	((c:sprintf@len))^00h,c,w
	bnz	u12041
	incf	((c:sprintf@len+1))^00h,c,w
	btfss	status,2
	goto	u12041
	goto	u12040

u12041:
	goto	l9400
u12040:
	goto	l9514
	line	825
	
l9408:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:sprintf@c))^00h,c
	
l9410:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	831
	
l9412:
		movlw	low(sprintf@c)
	movwf	((c:sprintf@cp))^00h,c
	clrf	((c:sprintf@cp+1))^00h,c

	line	832
	
l9414:
	movlw	high(01h)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(01h)
	movwf	((c:sprintf@len))^00h,c
	line	833
	goto	l9388
	line	661
	
l9418:
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
	goto	l9516
	xorlw	99^0	; case 99
	skipnz
	goto	l9408
	xorlw	100^99	; case 100
	skipnz
	goto	l9420
	xorlw	105^100	; case 105
	skipnz
	goto	l9420
	xorlw	115^105	; case 115
	skipnz
	goto	l9374
	goto	l9412

	line	1285
	
l9420:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l9422:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l9424:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u12050
	goto	u12051

u12051:
	goto	l9430
u12050:
	line	1288
	
l9426:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l9428:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	line	1331
	
l9430:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l9432:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u12061
	goto	u12060

u12061:
	goto	l9436
u12060:
	goto	l9444
	line	1332
	
l9436:
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
	goto	u12071
	goto	u12070

u12071:
	goto	l9440
u12070:
	goto	l9444
	line	1331
	
l9440:
	incf	((c:sprintf@c))^00h,c
	goto	l9432
	line	1371
	
l9444:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u12081
	goto	u12080

u12081:
	goto	l9450
u12080:
	
l9446:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u12091
	goto	u12090
u12091:
	goto	l9450
u12090:
	line	1372
	
l9448:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	line	1407
	
l9450:
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
	goto	u12101
	goto	u12100

u12101:
	goto	l9454
u12100:
	line	1408
	
l9452:
	movf	((c:sprintf@c))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movlw	0
	subwfb	((c:sprintf@width+1))^00h,c
	goto	l9456
	line	1410
	
l9454:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	1413
	
l9456:
	
	btfss	((c:sprintf@flag))^00h,c,(2)&7
	goto	u12111
	goto	u12110
u12111:
	goto	l9482
u12110:
	line	1415
	
l9458:
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u12121
	goto	u12120
u12121:
	goto	l1442
u12120:
	line	1416
	
l9460:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u12131
	goto	u12130
u12131:
	goto	l9464
u12130:
	
l9462:
	movlw	high(02Bh)
	movwf	((c:_sprintf$1802+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$1802))^00h,c
	goto	l9466
	
l9464:
	movlw	high(02Dh)
	movwf	((c:_sprintf$1802+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$1802))^00h,c
	
l9466:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$1802),indf2

	
l9468:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l9474
	line	1422
	
l1442:
	line	1425
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u12141
	goto	u12140
u12141:
	goto	l9474
u12140:
	line	1426
	
l9470:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l9468
	line	1441
	
l9474:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u12151
	goto	u12150

u12151:
	goto	l9504
u12150:
	line	1443
	
l9476:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(030h)
	movwf	indf2
	
l9478:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1444
	
l9480:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u12161
	goto	u12160

u12161:
	goto	l9476
u12160:
	goto	l9504
	line	1454
	
l9482:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u12171
	goto	u12170

u12171:
	goto	l1453
u12170:
	line	1456
	
l9484:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l9486:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1457
	
l9488:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u12181
	goto	u12180

u12181:
	goto	l9484
u12180:
	
l1453:
	line	1460
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u12191
	goto	u12190
u12191:
	goto	l1456
u12190:
	line	1461
	
l9490:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u12201
	goto	u12200
u12201:
	goto	l9494
u12200:
	
l9492:
	movlw	high(02Bh)
	movwf	((c:_sprintf$1803+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$1803))^00h,c
	goto	l9496
	
l9494:
	movlw	high(02Dh)
	movwf	((c:_sprintf$1803+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$1803))^00h,c
	
l9496:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$1803),indf2

	
l9498:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l9504
	line	1469
	
l1456:
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u12211
	goto	u12210
u12211:
	goto	l9504
u12210:
	line	1470
	
l9500:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l9498
	line	1498
	
l9504:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l9512
	line	1515
	
l9506:
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
	
l9508:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l9510:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l9512:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u12221
	goto	u12220

u12221:
	goto	l9506
u12220:
	line	553
	
l9514:
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
	goto	u12231
	goto	u12230
u12231:
	goto	l9342
u12230:
	line	1564
	
l9516:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	clrf	indf2
	line	1567
	
l1467:
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
;;		On entry : 0/4
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
psect	text39,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
global __ptext39
__ptext39:
psect	text39
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
	
_isdigit:
;incstack = 0
	callstack 27
	movwf	((c:isdigit@c))^00h,c
	line	14
	
l9284:
	movlw	low(0)
	movwf	((c:_isdigit$2243))^00h,c
	
l9286:
		movlw	03Ah-0
	cpfslt	((c:isdigit@c))^00h,c
	goto	u11861
	goto	u11860

u11861:
	goto	l9292
u11860:
	
l9288:
		movlw	030h-1
	cpfsgt	((c:isdigit@c))^00h,c
	goto	u11871
	goto	u11870

u11871:
	goto	l9292
u11870:
	
l9290:
	movlw	low(01h)
	movwf	((c:_isdigit$2243))^00h,c
	
l9292:
	movff	(c:_isdigit$2243),??_isdigit+0+0
	rrcf	(??_isdigit+0+0)^00h,c,w
	line	15
	
l2134:
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
;;		On entry : 0/4
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
psect	text40,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
global __ptext40
__ptext40:
psect	text40
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
	
___wmul:
;incstack = 0
	callstack 27
	line	37
	
l9296:
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
	
l9298:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	line	53
	
l1470:
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
;;		On exit  : 3F/2
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
	file	"src\menu.c"
	line	799
global __ptext41
__ptext41:
psect	text41
	file	"src\menu.c"
	line	799
	
_init_numeric_editor:
;incstack = 0
	callstack 26
	line	803
	
l10472:
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
	
l10474:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+0Fh))&0ffh
	line	809
	
l10476:; BSR set to: 2

	movf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u13611
	goto	u13610
u13611:
	goto	l10484
u13610:
	line	812
	
l10478:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u13621
	goto	u13620

u13621:
	goto	l10482
u13620:
	
l10480:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13631
	goto	u13630

u13631:
	goto	l10498
u13630:
	line	813
	
l10482:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+0Fh))&0ffh
	goto	l10498
	line	815
	
l10484:; BSR set to: 2

		decf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u13641
	goto	u13640

u13641:
	goto	l10490
u13640:
	line	818
	
l10486:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13651
	goto	u13650

u13651:
	goto	l10498
u13650:
	goto	l10482
	line	821
	
l10490:; BSR set to: 2

		movlw	2
	xorwf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u13661
	goto	u13660

u13661:
	goto	l10498
u13660:
	
l10492:; BSR set to: 2

	movf	((c:init_numeric_editor@flow_type))^00h,c,w
	btfss	status,2
	goto	u13671
	goto	u13670
u13671:
	goto	l10498
u13670:
	line	824
	
l10494:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13681
	goto	u13680

u13681:
	goto	l10498
u13680:
	goto	l10482
	line	829
	
l10498:; BSR set to: 2

	movff	(c:init_numeric_editor@value),0+(_menu+0Dh)
	movff	(c:init_numeric_editor@value+1),1+(_menu+0Dh)
	line	832
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u13691
	goto	u13690
u13691:
	goto	l754
u13690:
	
l10500:; BSR set to: 2

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u13700
	goto	u13701

u13701:
	goto	l754
u13700:
	line	833
	
l10502:; BSR set to: 2

	movlw	high(0)
	movwf	((c:init_numeric_editor@value+1))^00h,c
	movlw	low(0)
	movwf	((c:init_numeric_editor@value))^00h,c
	
l754:; BSR set to: 2

	line	836
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u13711
	goto	u13710
u13711:
	goto	l10506
u13710:
	
l10504:; BSR set to: 2

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u13721
	goto	u13720

u13721:
	movlw	1
	goto	u13730
u13720:
	movlw	0
u13730:
	movwf	((c:_init_numeric_editor$1307))^00h,c
	clrf	((c:_init_numeric_editor$1307+1))^00h,c
	goto	l10508
	
l10506:; BSR set to: 2

	movlw	high(0)
	movwf	((c:_init_numeric_editor$1307+1))^00h,c
	movlw	low(0)
	movwf	((c:_init_numeric_editor$1307))^00h,c
	
l10508:; BSR set to: 2

	movff	(c:_init_numeric_editor$1307),0+(_menu+09h)
	line	839
	
l10510:; BSR set to: 2

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u13741
	goto	u13740

u13741:
	goto	l760
u13740:
	
l10512:; BSR set to: 2

	movff	(c:init_numeric_editor@value),(c:init_numeric_editor@abs_val)
	movff	(c:init_numeric_editor@value+1),(c:init_numeric_editor@abs_val+1)
	goto	l10514
	
l760:; BSR set to: 2

	movff	(c:init_numeric_editor@value),??_init_numeric_editor+0+0
	movff	(c:init_numeric_editor@value+1),??_init_numeric_editor+0+0+1
	comf	(??_init_numeric_editor+0+0)^00h,c
	comf	(??_init_numeric_editor+0+1)^00h,c
	infsnz	(??_init_numeric_editor+0+0)^00h,c
	incf	(??_init_numeric_editor+0+1)^00h,c
	movff	??_init_numeric_editor+0+0,(c:init_numeric_editor@abs_val)
	movff	??_init_numeric_editor+0+1,(c:init_numeric_editor@abs_val+1)
	line	840
	
l10514:; BSR set to: 2

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
	movlb	2	; () banked
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
	movlb	2	; () banked
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
	movlb	2	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	line	845
	
l10516:; BSR set to: 2

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u13751
	goto	u13750
u13751:
	movlw	1
	goto	u13760
u13750:
	movlw	0
u13760:
	movwf	(0+(_menu+08h))&0ffh
	line	846
	
l763:; BSR set to: 2

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
psect	text42,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext42
__ptext42:
psect	text42
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
___lwmod:; BSR set to: 2

;incstack = 0
	callstack 27
	line	12
	
l9324:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u11911
	goto	u11910

u11911:
	goto	l1959
u11910:
	line	13
	
l9326:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l9330
	line	15
	
l9328:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l9330:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u11921
	goto	u11920
u11921:
	goto	l9328
u11920:
	line	19
	
l9332:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u11931
	goto	u11930

u11931:
	goto	l9336
u11930:
	line	20
	
l9334:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l9336:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l9338:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l9332
	line	23
	
l1959:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l1966:
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
psect	text43,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
global __ptext43
__ptext43:
psect	text43
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
	
___lwdiv:
;incstack = 0
	callstack 27
	line	13
	
l9302:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l9304:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u11881
	goto	u11880

u11881:
	goto	l1949
u11880:
	line	15
	
l9306:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l9310
	line	17
	
l9308:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l9310:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u11891
	goto	u11890
u11891:
	goto	l9308
u11890:
	line	21
	
l9312:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l9314:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u11901
	goto	u11900

u11901:
	goto	l9320
u11900:
	line	23
	
l9316:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l9318:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l9320:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l9322:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l9312
	line	28
	
l1949:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l1956:
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
;;		On entry : 3F/2
;;		On exit  : 3F/2
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
psect	text44,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	848
global __ptext44
__ptext44:
psect	text44
	file	"src\menu.c"
	line	848
	
_get_current_numeric_value:
;incstack = 0
	callstack 27
	line	850
	
l7530:; BSR set to: 2

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
	
l7532:; BSR set to: 2

	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u8801
	goto	u8800
u8801:
	goto	l7536
u8800:
	line	852
	
l7534:; BSR set to: 2

	negf	((c:get_current_numeric_value@value))^00h,c
	comf	((c:get_current_numeric_value@value+1))^00h,c
	btfsc	status,0
	incf	((c:get_current_numeric_value@value+1))^00h,c
	line	853
	
l7536:; BSR set to: 2

	movff	(c:get_current_numeric_value@value),(c:?_get_current_numeric_value)
	movff	(c:get_current_numeric_value@value+1),(c:?_get_current_numeric_value+1)
	line	854
	
l767:; BSR set to: 2

	return	;funcret
	callstack 0
GLOBAL	__end_of_get_current_numeric_value
	__end_of_get_current_numeric_value:
	signat	_get_current_numeric_value,90
	global	_beep

;; *************** function _beep *****************
;; Defined at:
;;		line 283 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  duration_ms     2   14[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2   17[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/2
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
psect	text45,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	283
global __ptext45
__ptext45:
psect	text45
	file	"src\main.c"
	line	283
	
_beep:; BSR set to: 2

;incstack = 0
	callstack 27
	line	285
	
l6676:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	286
	
l6678:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l194
	line	288
	
l6680:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u16357:
decfsz	wreg,f
	bra	u16357
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u16357
	nop2
asmopt pop

	line	286
	
l6682:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l194:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u7521
	goto	u7520

u7521:
	goto	l6680
u7520:
	
l196:
	line	290
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	291
	
l197:
	return	;funcret
	callstack 0
GLOBAL	__end_of_beep
	__end_of_beep:
	signat	_beep,4217
	global	_lcd_init

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 245 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 3F/2
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
psect	text46,class=CODE,space=0,reloc=2,group=0
	line	245
global __ptext46
__ptext46:
psect	text46
	file	"src\main.c"
	line	245
	
_lcd_init:
;incstack = 0
	callstack 26
	line	248
	
l10568:; BSR set to: 2

	movlw	low(010h)
	movwf	((c:3986))^0f00h,c	;volatile
	line	249
	movlw	low(046h)
	movwf	((c:3987))^0f00h,c	;volatile
	line	250
	movlw	low(0)
	movwf	((c:3988))^0f00h,c	;volatile
	line	253
	movlw	low(0)
	movwf	((c:3968))^0f00h,c	;volatile
	line	254
	movlw	low(0)
	movwf	((c:3969))^0f00h,c	;volatile
	line	257
	
l10570:; BSR set to: 2

	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u16367:
decfsz	wreg,f
	bra	u16367
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u16367
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u16367
	nop
asmopt pop

	line	259
	
l10572:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	262
	
l10574:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	263
	
l10576:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u16377:
decfsz	wreg,f
	bra	u16377
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u16377
asmopt pop

	line	264
	
l10578:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	265
	
l10580:
	asmopt push
asmopt off
	movlw	240
u16387:
	nop2
decfsz	wreg,f
	bra	u16387
asmopt pop

	line	266
	
l10582:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	267
	
l10584:
	asmopt push
asmopt off
	movlw	240
u16397:
	nop2
decfsz	wreg,f
	bra	u16397
asmopt pop

	line	270
	
l10586:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	271
	
l10588:
	asmopt push
asmopt off
	movlw	240
u16407:
	nop2
decfsz	wreg,f
	bra	u16407
asmopt pop

	line	274
	
l10590:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	275
	
l10592:
	movlw	(08h)&0ffh
	
	call	_lcd_cmd
	line	276
	
l10594:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	277
	
l10596:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_init+0+0)^00h,c
	movlw	198
u16417:
decfsz	wreg,f
	bra	u16417
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u16417
	nop2
asmopt pop

	line	278
	
l10598:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	279
	
l10600:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	280
	
l191:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
	signat	_lcd_init,89
	global	_lcd_cmd

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 183 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1   16[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/2
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
psect	text47,class=CODE,space=0,reloc=2,group=0
	line	183
global __ptext47
__ptext47:
psect	text47
	file	"src\main.c"
	line	183
	
_lcd_cmd:
;incstack = 0
	callstack 24
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	185
	
l9216:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	186
	
l9218:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	187
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	189
	
l9220:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u11771
	goto	u11770

u11771:
	goto	l9224
u11770:
	
l9222:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u11781
	goto	u11780

u11781:
	goto	l9226
u11780:
	line	191
	
l9224:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u16427:
decfsz	wreg,f
	bra	u16427
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u16427
	nop2
asmopt pop

	line	192
	goto	l166
	line	195
	
l9226:
	asmopt push
asmopt off
	movlw	133
u16437:
decfsz	wreg,f
	bra	u16437
	nop
asmopt pop

	line	197
	
l166:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
	signat	_lcd_cmd,4217
	global	_lcd_write_nibble

;; *************** function _lcd_write_nibble *****************
;; Defined at:
;;		line 158 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  nibble          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  nibble          1   14[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, cstack
;; Tracked objects:
;;		On entry : 0/2
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
psect	text48,class=CODE,space=0,reloc=2,group=0
	line	158
global __ptext48
__ptext48:
psect	text48
	file	"src\main.c"
	line	158
	
_lcd_write_nibble:
;incstack = 0
	callstack 24
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	160
	
l9198:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u11731
	goto	u11730
u11731:
	goto	l151
u11730:
	line	161
	
l9200:
	bsf	((c:3977))^0f00h,c,0	;volatile
	goto	l9202
	line	162
	
l151:
	line	163
	bcf	((c:3977))^0f00h,c,0	;volatile
	line	164
	
l9202:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u11741
	goto	u11740
u11741:
	goto	l153
u11740:
	line	165
	
l9204:
	bsf	((c:3977))^0f00h,c,1	;volatile
	goto	l9206
	line	166
	
l153:
	line	167
	bcf	((c:3977))^0f00h,c,1	;volatile
	line	168
	
l9206:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u11751
	goto	u11750
u11751:
	goto	l155
u11750:
	line	169
	
l9208:
	bsf	((c:3977))^0f00h,c,2	;volatile
	goto	l9210
	line	170
	
l155:
	line	171
	bcf	((c:3977))^0f00h,c,2	;volatile
	line	172
	
l9210:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u11761
	goto	u11760
u11761:
	goto	l157
u11760:
	line	173
	
l9212:
	bsf	((c:3977))^0f00h,c,3	;volatile
	goto	l158
	line	174
	
l157:
	line	175
	bcf	((c:3977))^0f00h,c,3	;volatile
	
l158:
	line	177
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	178
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	179
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	180
	
l9214:
	asmopt push
asmopt off
	movlw	133
u16447:
decfsz	wreg,f
	bra	u16447
	nop
asmopt pop

	line	181
	
l159:
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
;;		On entry : 3F/4
;;		On exit  : 3F/4
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
psect	text49,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	260
global __ptext49
__ptext49:
psect	text49
	file	"src\eeprom.c"
	line	260
	
_get_menu_timeout_seconds:
;incstack = 0
	callstack 28
	line	263
	
l7706:; BSR set to: 4

		movlw	05h-0
	cpfslt	(0+(_system_config+01h))&0ffh
	goto	u8901
	goto	u8900

u8901:
	goto	l7712
u8900:
	line	265
	
l7708:; BSR set to: 4

	movlw	(01Eh)&0ffh
	goto	l1385
	line	267
	
l7712:; BSR set to: 4

		movlw	079h-1
	cpfsgt	(0+(_system_config+01h))&0ffh
	goto	u8911
	goto	u8910

u8911:
	goto	l7718
u8910:
	goto	l7708
	line	271
	
l7718:; BSR set to: 4

	movf	(0+(_system_config+01h))&0ffh,w
	line	272
	
l1385:; BSR set to: 4

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
psect	text50,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	205
global __ptext50
__ptext50:
psect	text50
	file	"src\encoder.c"
	line	205
	
_encoder_init:; BSR set to: 4

;incstack = 0
	callstack 28
	line	208
	
l7722:
	movlw	low(0C4h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	209
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	212
	movlw	high(0)
	movlb	2	; () banked
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
	movwf	((_button_event))&0ffh	;volatile
	line	216
	movlw	low(0)
	movwf	((c:_relay_ms_counter))^00h,c
	line	219
	
l7724:; BSR set to: 2

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	220
	
l7726:; BSR set to: 2

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	221
	
l7728:; BSR set to: 2

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	224
	
l7730:; BSR set to: 2

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u8921
	goto	u8920
u8921:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u8928
u8920:
	clrf	(??_encoder_init+0+0)^00h,c
u8928:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u8931
	goto	u8930
u8931:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u8938
u8930:
	clrf	(??_encoder_init+1+0)^00h,c
u8938:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:_enc_state))^00h,c
	line	225
	
l375:
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
;;		On exit  : 3F/4
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
psect	text51,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	180
global __ptext51
__ptext51:
psect	text51
	file	"src\eeprom.c"
	line	180
	
_eeprom_init:
;incstack = 0
	callstack 25
	line	182
	
l7672:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	185
	
l7674:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	189
	
l7680:
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
	
l7682:
	incf	((c:eeprom_init@i))^00h,c
	
l7684:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u8861
	goto	u8860

u8861:
	goto	l7680
u8860:
	line	191
	
l7686:
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
	
l7688:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	195
	
l7690:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u8870
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u8871
	goto	u8870

u8871:
	goto	l7696
u8870:
	line	198
	
l7692:
	call	_load_factory_defaults	;wreg free
	line	199
	
l7694:
	call	_save_current_config	;wreg free
	line	203
	
l7696:
	call	_sync_menu_variables	;wreg free
	line	207
	
l7698:
	movlb	4	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	mullw	02h
	movff	prodl,(c:_menu_timeout_seconds)
	movff	prodh,(c:_menu_timeout_seconds+1)
	line	210
	
l7700:; BSR set to: 4

		movf	((c:_menu_timeout_seconds+1))^00h,c,w
	bnz	u8880
	movlw	10
	subwf	 ((c:_menu_timeout_seconds))^00h,c,w
	btfss	status,0
	goto	u8881
	goto	u8880

u8881:
	goto	l7704
u8880:
	
l7702:; BSR set to: 4

		incf	((c:_menu_timeout_seconds))^00h,c,w
	movlw	1
	subwfb	((c:_menu_timeout_seconds+1))^00h,c,w
	btfss	status,0
	goto	u8891
	goto	u8890

u8891:
	goto	l1363
u8890:
	line	212
	
l7704:; BSR set to: 4

	movlw	high(01Eh)
	movwf	((c:_menu_timeout_seconds+1))^00h,c
	movlw	low(01Eh)
	movwf	((c:_menu_timeout_seconds))^00h,c
	line	214
	
l1363:; BSR set to: 4

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
psect	text52,class=CODE,space=0,reloc=2,group=0
	line	247
global __ptext52
__ptext52:
psect	text52
	file	"src\eeprom.c"
	line	247
	
_sync_menu_variables:; BSR set to: 4

;incstack = 0
	callstack 27
	line	256
	
l7608:
	movff	_input_config,(c:_enable_edit_flag)
	line	257
	movff	0+(_input_config+01h),(c:_sensor_edit_flag)
	line	258
	
l1381:
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
;;		On entry : 0/2
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
psect	text53,class=CODE,space=0,reloc=2,group=0
	line	216
global __ptext53
__ptext53:
psect	text53
	file	"src\eeprom.c"
	line	216
	
_save_current_config:
;incstack = 0
	callstack 26
	line	219
	
l7162:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	223
	
l7168:
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
	
l7170:
	incf	((c:save_current_config@i))^00h,c
	
l7172:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u8421
	goto	u8420

u8421:
	goto	l7168
u8420:
	line	227
	
l7174:
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
	
l7176:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	231
	
l7178:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	232
	
l1368:
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
;;		On entry : 0/2
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
psect	text54,class=CODE,space=0,reloc=2,group=0
	line	155
global __ptext54
__ptext54:
psect	text54
	file	"src\eeprom.c"
	line	155
	
_eeprom_write_word:
;incstack = 0
	callstack 26
	line	157
	
l6600:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	158
	
l6602:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	159
	
l1342:
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
;;		On entry : 0/2
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
psect	text55,class=CODE,space=0,reloc=2,group=0
	line	161
global __ptext55
__ptext55:
psect	text55
	file	"src\eeprom.c"
	line	161
	
_eeprom_write_block:
;incstack = 0
	callstack 26
	line	163
	
l6604:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	164
	
l6606:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l6612
	line	166
	
l6608:
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
	
l6610:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l6612:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u7451
	goto	u7450

u7451:
	goto	l6608
u7450:
	line	168
	
l1348:
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
;;		On entry : 0/2
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
psect	text56,class=CODE,space=0,reloc=2,group=0
	line	128
global __ptext56
__ptext56:
psect	text56
	file	"src\eeprom.c"
	line	128
	
_eeprom_write_byte:
;incstack = 0
	callstack 26
	line	130
	
l5818:
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
	
l5820:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	139
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	140
	
l5822:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	143
	
l1333:
	line	142
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u6041
	goto	u6040
u6041:
	goto	l1333
u6040:
	
l1335:
	line	144
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	145
	
l1336:
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
psect	text57,class=CODE,space=0,reloc=2,group=0
	line	92
global __ptext57
__ptext57:
psect	text57
	file	"src\eeprom.c"
	line	92
	
_calculate_config_checksum:
;incstack = 0
	callstack 27
	line	94
	
l6556:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	98
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	100
	
l6562:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	101
	
l6564:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	103
	
l6570:
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
	
l6572:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l6574:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u7420
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u7421
	goto	u7420

u7421:
	goto	l6570
u7420:
	line	98
	
l6576:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l6578:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u7431
	goto	u7430

u7431:
	goto	l6562
u7430:
	line	108
	
l6580:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	109
	
l6582:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1717+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1717))^00h,c
	line	111
	
l6588:
	movf	((c:calculate_config_checksum@j_1717))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j_1717+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	109
	
l6590:
	infsnz	((c:calculate_config_checksum@j_1717))^00h,c
	incf	((c:calculate_config_checksum@j_1717+1))^00h,c
	
l6592:
		movf	((c:calculate_config_checksum@j_1717+1))^00h,c,w
	bnz	u7440
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1717))^00h,c,w
	btfss	status,0
	goto	u7441
	goto	u7440

u7441:
	goto	l6588
u7440:
	
l1326:
	line	114
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	115
	
l1327:
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
psect	text58,class=CODE,space=0,reloc=2,group=0
	line	241
global __ptext58
__ptext58:
psect	text58
	file	"src\eeprom.c"
	line	241
	
_load_factory_defaults:
;incstack = 0
	callstack 26
	line	243
	
l7606:
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
	
l1374:
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
psect	text59,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
global __ptext59
__ptext59:
psect	text59
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
	
_memcpy:
;incstack = 0
	callstack 26
	line	34
	
l6532:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l6542
	line	37
	
l6534:
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
	
l6536:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l6538:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l6540:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l6542:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u7391
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u7391
	goto	u7390

u7391:
	goto	l6534
u7390:
	line	41
	
l2140:
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
psect	text60,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	147
global __ptext60
__ptext60:
psect	text60
	file	"src\eeprom.c"
	line	147
	
_eeprom_read_word:
;incstack = 0
	callstack 26
	line	150
	
l7590:
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
	
l7592:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	153
	
l1339:
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
psect	text61,class=CODE,space=0,reloc=2,group=0
	line	170
global __ptext61
__ptext61:
psect	text61
	file	"src\eeprom.c"
	line	170
	
_eeprom_read_block:
;incstack = 0
	callstack 26
	line	172
	
l7596:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	173
	
l7598:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l7604
	line	175
	
l7600:
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
	
l7602:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l7604:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u8841
	goto	u8840

u8841:
	goto	l7600
u8840:
	line	177
	
l1354:
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
psect	text62,class=CODE,space=0,reloc=2,group=0
	line	118
global __ptext62
__ptext62:
psect	text62
	file	"src\eeprom.c"
	line	118
	
_eeprom_read_byte:
;incstack = 0
	callstack 26
	line	120
	
l6594:
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
	
l6596:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	126
	
l1330:
	return	;funcret
	callstack 0
GLOBAL	__end_of_eeprom_read_byte
	__end_of_eeprom_read_byte:
	signat	_eeprom_read_byte,4217
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
	
i2l9076:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u1145_41
	goto	i2u1145_40
i2u1145_41:
	goto	i2l372
i2u1145_40:
	line	49
	
i2l9078:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	50
	
i2l9080:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	52
	
i2l9082:
	incf	((c:_relay_ms_counter))^00h,c
	line	53
	
i2l9084:
		movlw	0Ah-1
	cpfsgt	((c:_relay_ms_counter))^00h,c
	goto	i2u1146_41
	goto	i2u1146_40

i2u1146_41:
	goto	i2l9106
i2u1146_40:
	line	55
	
i2l9086:
	movlw	low(0)
	movwf	((c:_relay_ms_counter))^00h,c
	line	57
	
i2l9088:
	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1147_41
	goto	i2u1147_40

i2u1147_41:
	goto	i2l9096
i2u1147_40:
	
i2l9090:; BSR set to: 0

	movf	((c:_relay_latch_mode))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1148_41
	goto	i2u1148_40
i2u1148_41:
	goto	i2l9096
i2u1148_40:
	
i2l9092:; BSR set to: 0

	movlb	2	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	i2u1149_41
	goto	i2u1149_40

i2u1149_41:
	goto	i2l9096
i2u1149_40:
	line	59
	
i2l9094:; BSR set to: 2

	decf	((_relay_counter))&0ffh	;volatile
	btfss	status,0
	decf	((_relay_counter+1))&0ffh	;volatile
	line	60
	goto	i2l9106
	line	61
	
i2l9096:
	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1150_41
	goto	i2u1150_40

i2u1150_41:
	goto	i2l9106
i2u1150_40:
	
i2l9098:; BSR set to: 0

	movf	((c:_relay_latch_mode))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1151_41
	goto	i2u1151_40
i2u1151_41:
	goto	i2l9106
i2u1151_40:
	
i2l9100:; BSR set to: 0

	movlb	2	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1152_41
	goto	i2u1152_40

i2u1152_41:
	goto	i2l9106
i2u1152_40:
	line	64
	
i2l9102:; BSR set to: 2

	bsf	((c:3979))^0f00h,c,1	;volatile
	line	65
	
i2l9104:; BSR set to: 2

	movlw	low(0)
	movlb	0	; () banked
	movwf	((_relay_state))&0ffh	;volatile
	line	71
	
i2l9106:
	incf	((c:_ms_counter))^00h,c	;volatile
	line	72
	
i2l9108:
		movlw	02h-1
	cpfsgt	((c:_ms_counter))^00h,c	;volatile
	goto	i2u1153_41
	goto	i2u1153_40

i2u1153_41:
	goto	i2l9124
i2u1153_40:
	line	74
	
i2l9110:
	movlw	low(0)
	movwf	((c:_ms_counter))^00h,c	;volatile
	line	75
	
i2l9112:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1154_41
	goto	i2u1154_40

i2u1154_41:
	goto	i2l9124
i2u1154_40:
	line	77
	
i2l9114:
	decf	((c:_menu_timeout_timer))^00h,c	;volatile
	btfss	status,0
	decf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	line	80
	
i2l9116:
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
	goto	i2u1155_41
	goto	i2u1155_40

i2u1155_41:
	goto	i2l9120
i2u1155_40:
	line	83
	
i2l9118:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_timeout_debug_flag))&0ffh	;volatile
	line	86
	
i2l9120:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1156_41
	goto	i2u1156_40

i2u1156_41:
	goto	i2l9124
i2u1156_40:
	line	88
	
i2l9122:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	94
	
i2l9124:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u1157_41
	goto	i2u1157_40
i2u1157_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u1157_48
i2u1157_40:
	clrf	(??_isr+0+0)^00h,c
i2u1157_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u1158_41
	goto	i2u1158_40
i2u1158_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u1158_48
i2u1158_40:
	clrf	(??_isr+1+0)^00h,c
i2u1158_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	95
	
i2l9126:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	98
	
i2l9128:
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
	
i2l9130:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u1159_41
	goto	i2u1159_40
i2u1159_41:
	goto	i2l9156
i2u1159_40:
	line	103
	
i2l9132:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u1160_41
	goto	i2u1160_40

i2u1160_41:
	goto	i2l9144
i2u1160_40:
	line	105
	
i2l9134:
	movlb	2	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	106
	
i2l9136:; BSR set to: 2

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	109
	
i2l9138:; BSR set to: 2

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1161_41
	goto	i2u1161_40

i2u1161_41:
	goto	i2l9156
i2u1161_40:
	line	111
	
i2l9140:; BSR set to: 2

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	112
	
i2l9142:; BSR set to: 2

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l9156
	line	115
	
i2l9144:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u1162_41
	goto	i2u1162_40

i2u1162_41:
	goto	i2l9156
i2u1162_40:
	line	117
	
i2l9146:
	movlb	2	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	line	118
	
i2l9148:; BSR set to: 2

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	121
	
i2l9150:; BSR set to: 2

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1163_41
	goto	i2u1163_40

i2u1163_41:
	goto	i2l357
i2u1163_40:
	goto	i2l9140
	line	127
	
i2l357:; BSR set to: 2

	line	129
	
i2l9156:
	movff	(c:isr@new_state),(c:_enc_state)
	line	132
	
i2l9158:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	133
	
i2l9160:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u1164_41
	goto	i2u1164_40

i2u1164_41:
	goto	i2l9188
i2u1164_40:
	line	135
	
i2l9162:
	incf	((c:_btn_debounce))^00h,c
	line	136
	
i2l9164:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u1165_41
	goto	i2u1165_40

i2u1165_41:
	goto	i2l372
i2u1165_40:
	line	138
	
i2l9166:
	movff	(c:isr@btn),(c:_last_btn)
	line	139
	
i2l9168:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	141
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1166_41
	goto	i2u1166_40
i2u1166_41:
	goto	i2l9178
i2u1166_40:
	line	144
	
i2l9170:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	145
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	148
	
i2l9172:; BSR set to: 2

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1167_41
	goto	i2u1167_40

i2u1167_41:
	goto	i2l369
i2u1167_40:
	line	150
	
i2l9174:; BSR set to: 2

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	151
	
i2l9176:; BSR set to: 2

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l372
	line	157
	
i2l9178:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1168_41
	goto	i2u1168_40

i2u1168_41:
	goto	i2l9182
i2u1168_40:
	line	159
	
i2l9180:
	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	160
	goto	i2l366
	line	161
	
i2l9182:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u1169_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1169_41
	goto	i2u1169_40

i2u1169_41:
	goto	i2l9186
i2u1169_40:
	line	163
	
i2l9184:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	164
	goto	i2l366
	line	167
	
i2l9186:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	168
	
i2l366:; BSR set to: 2

	line	170
	movlw	low(01h)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	171
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	goto	i2l372
	line	177
	
i2l9188:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	179
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1170_41
	goto	i2u1170_40
i2u1170_41:
	goto	i2l372
i2u1170_40:
	
i2l9190:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1171_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1171_41
	goto	i2u1171_40

i2u1171_41:
	goto	i2l372
i2u1171_40:
	line	181
	
i2l9192:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	184
	
i2l9194:
		movlw	8
	xorwf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1172_41
	movlw	7
	xorwf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1172_41
	goto	i2u1172_40

i2u1172_41:
	goto	i2l369
i2u1172_40:
	line	186
	
i2l9196:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	goto	i2l372
	line	189
	
i2l369:
	line	203
	
i2l372:
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
psect	text64,class=CODE,space=0,reloc=2,group=0
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext64
__ptext64:
psect	text64
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
i2___lwmod:
;incstack = 0
	callstack 22
	line	12
	
i2l8736:
	movf	((c:i2___lwmod@divisor))^00h,c,w
iorwf	((c:i2___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	i2u1098_41
	goto	i2u1098_40

i2u1098_41:
	goto	i2l1959
i2u1098_40:
	line	13
	
i2l8738:
	movlw	low(01h)
	movwf	((c:i2___lwmod@counter))^00h,c
	line	14
	goto	i2l8742
	line	15
	
i2l8740:
	bcf	status,0
	rlcf	((c:i2___lwmod@divisor))^00h,c
	rlcf	((c:i2___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:i2___lwmod@counter))^00h,c
	line	14
	
i2l8742:
	
	btfss	((c:i2___lwmod@divisor+1))^00h,c,(15)&7
	goto	i2u1099_41
	goto	i2u1099_40
i2u1099_41:
	goto	i2l8740
i2u1099_40:
	line	19
	
i2l8744:
		movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c,w
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	i2u1100_41
	goto	i2u1100_40

i2u1100_41:
	goto	i2l8748
i2u1100_40:
	line	20
	
i2l8746:
	movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c

	line	21
	
i2l8748:
	bcf	status,0
	rrcf	((c:i2___lwmod@divisor+1))^00h,c
	rrcf	((c:i2___lwmod@divisor))^00h,c
	line	22
	
i2l8750:
	decfsz	((c:i2___lwmod@counter))^00h,c
	
	goto	i2l8744
	line	23
	
i2l1959:
	line	24
	movff	(c:i2___lwmod@dividend),(c:?i2___lwmod)
	movff	(c:i2___lwmod@dividend+1),(c:?i2___lwmod+1)
	line	25
	
i2l1966:
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
