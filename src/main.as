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
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_sprintf,___wmul
	FNCALL	_sprintf,_isdigit
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
	global	_menu_timeout_flag
	global	_relay_slp_edit_flag
	global	_display_edit_flag
	global	_flow_type_edit_flag
	global	_enable_edit_flag
	global	_options_menu
	global	_menu_timeout_seconds
	global	_last_btn
	global	_value_sensor
	global	_value_relay_pulse
	global	_value_display
	global	_value_scale20
	global	_value_scale4
	global	_value_enable
	global	_value_pwr_fail
	global	_value_menu_timeout
	global	_value_log_entries
	global	_value_back
	global	_value_brightness
	global	_value_contrast
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
	global	menu_draw_setup@F2710
	global	_value_clock_display
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"src\encoder.c"
	line	16

;initializer for _menu_timeout_flag
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

	file	"src\eeprom.c"
	line	11

;initializer for _menu_timeout_seconds
	dw	(01Eh)&0ffffh
	file	"src\encoder.c"
	line	32

;initializer for _last_btn
	db	low(01h)
	file	"src\menu.c"
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
psect	idataBANK7,class=CODE,space=0,delta=1,noexec
global __pidataBANK7
__pidataBANK7:
	line	1504

;initializer for menu_draw_setup@F2710
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
	global	_enc_accumulator
	global	_ms_counter
	global	main@last_menu_state
	global	main@last_relay_state
	global	main@sample_counter
	global	_relay_latch_mode
	global	_save_pending
	global	_relay_low_edit_flag
	global	_relay_plp_edit_flag
	global	_relay_high_edit_flag
	global	_flow_units_edit_flag
	global	_sensor_edit_flag
	global	_input_config
	global	_relay_state
	global	_encoder_count
	global	_long_press_beep_flag
	global	_relay_counter
	global	_current_menu
	global	_timeout_debug_flag
	global	_button_event
	global	_current_input
	global	_menu
	global	main@blink_timer
	global	main@last_relay_counter
	global	main@encoder_activity_timer
	global	_btn_debounce
	global	_enc_state
	global	_relay_ms_counter
	global	_button_pressed
	global	_input_menu
	global	_clock_menu
	global	_no_flow_edit_flag
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
	
STR_331:
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
	
STR_351:
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
	
STR_340:
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
	
STR_312:
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
	
STR_314:
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
	
STR_352:
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
	
STR_332:
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
	
STR_341:
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
	
STR_342:
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
	
STR_313:
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
	
STR_311:
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
	
STR_333:
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
	
STR_346:
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
	
STR_354:
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
	
STR_345:
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
	
STR_316:
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
	
STR_320:
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
	
STR_344:
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
	
STR_334:
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
	
STR_343:
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
	
STR_339:
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
	
STR_365:
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
	
STR_315:
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
	
STR_132:
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
	
STR_364:
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
STR_338	equ	STR_68+0
STR_121	equ	STR_110+0
STR_57	equ	STR_110+4
STR_219	equ	STR_110+4
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
STR_336	equ	STR_72+0
STR_206	equ	STR_52+0
STR_41	equ	STR_35+0
STR_73	equ	STR_126+4
STR_185	equ	STR_126+4
STR_188	equ	STR_126+4
STR_191	equ	STR_126+4
STR_201	equ	STR_126+4
STR_211	equ	STR_126+4
STR_264	equ	STR_126+4
STR_337	equ	STR_126+4
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
STR_335	equ	STR_43+0
STR_178	equ	STR_177+0
STR_196	equ	STR_177+0
STR_197	equ	STR_177+0
STR_215	equ	STR_177+0
STR_216	equ	STR_177+0
STR_321	equ	STR_177+0
STR_322	equ	STR_177+0
STR_325	equ	STR_177+0
STR_326	equ	STR_177+0
STR_328	equ	STR_177+0
STR_329	equ	STR_177+0
STR_181	equ	STR_179+0
STR_217	equ	STR_179+0
STR_323	equ	STR_179+0
STR_324	equ	STR_179+0
STR_327	equ	STR_179+0
STR_330	equ	STR_179+0
STR_158	equ	STR_312+30
STR_159	equ	STR_312+30
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
STR_319	equ	STR_155+3
STR_154	equ	STR_153+0
STR_224	equ	STR_225+2
STR_318	equ	STR_306+0
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
STR_147	equ	STR_364+5
STR_161	equ	STR_364+5
STR_165	equ	STR_364+5
STR_228	equ	STR_364+5
STR_231	equ	STR_364+5
STR_241	equ	STR_364+5
STR_283	equ	STR_364+5
STR_295	equ	STR_364+5
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
_enc_accumulator:
       ds      1
	global	_ms_counter
_ms_counter:
       ds      1
main@last_menu_state:
       ds      1
main@last_relay_state:
       ds      1
main@sample_counter:
       ds      1
	global	_relay_latch_mode
_relay_latch_mode:
       ds      1
	global	_save_pending
_save_pending:
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
	global	_sensor_edit_flag
_sensor_edit_flag:
       ds      1
psect	dataCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pdataCOMRAM
__pdataCOMRAM:
	file	"src\encoder.c"
	line	16
	global	_menu_timeout_flag
_menu_timeout_flag:
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
psect	bssBANK3,class=BANK3,space=1,noexec,lowdata
global __pbssBANK3
__pbssBANK3:
	global	_encoder_count
_encoder_count:
       ds      2
	global	_long_press_beep_flag
_long_press_beep_flag:
       ds      1
psect	bssBANK4,class=BANK4,space=1,noexec,lowdata
global __pbssBANK4
__pbssBANK4:
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
_btn_debounce:
       ds      1
_enc_state:
       ds      1
_relay_ms_counter:
       ds      1
	global	_button_pressed
_button_pressed:
       ds      1
	global	_input_menu
_input_menu:
       ds      75
	global	_clock_menu
_clock_menu:
       ds      25
	global	_no_flow_edit_flag
_no_flow_edit_flag:
       ds      1
psect	dataBANK5,class=BANK5,space=1,noexec,lowdata
global __pdataBANK5
__pdataBANK5:
	file	"src\menu.c"
	line	66
	global	_options_menu
_options_menu:
       ds      10
psect	dataBANK5
	file	"src\eeprom.c"
	line	11
	global	_menu_timeout_seconds
_menu_timeout_seconds:
       ds      2
psect	dataBANK5
	file	"src\encoder.c"
	line	32
_last_btn:
       ds      1
psect	dataBANK5
	file	"src\menu.c"
	line	75
_value_sensor:
       ds      12
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
	line	77
_value_scale20:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	76
_value_scale4:
       ds      10
psect	dataBANK5
	file	"src\menu.c"
	line	74
_value_enable:
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
menu_update_numeric_value@F2681:
       ds      6
_original_value:
       ds      10
psect	dataBANK6,class=BANK6,space=1,noexec,lowdata
global __pdataBANK6
__pdataBANK6:
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
	line	98
_value_high_tbp:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	97
_value_low_flow_bp:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	96
_value_no_flow_bp:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	95
_value_low_flow:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	94
_value_no_flow:
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
	line	1504
menu_draw_setup@F2710:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	104
_value_clock_display:
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
; Initialize objects allocated to BANK7 (20 bytes)
	global __pidataBANK7
	; load TBLPTR registers with __pidataBANK7
	movlw	low (__pidataBANK7)
	movwf	tblptrl
	movlw	high(__pidataBANK7)
	movwf	tblptrh
	movlw	low highword(__pidataBANK7)
	movwf	tblptru
	lfsr	0,__pdataBANK7
	lfsr	1,20
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK6 (190 bytes)
	global __pidataBANK6
	; load TBLPTR registers with __pidataBANK6
	movlw	low (__pidataBANK6)
	movwf	tblptrl
	movlw	high(__pidataBANK6)
	movwf	tblptrh
	movlw	low highword(__pidataBANK6)
	movwf	tblptru
	lfsr	0,__pdataBANK6
	lfsr	1,190
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
; Initialize objects allocated to BANK5 (106 bytes)
	global __pidataBANK5
	; load TBLPTR registers with __pidataBANK5
	movlw	low (__pidataBANK5)
	movwf	tblptrl
	movlw	high(__pidataBANK5)
	movwf	tblptrh
	movlw	low highword(__pidataBANK5)
	movwf	tblptru
	lfsr	0,__pdataBANK5
	lfsr	1,106
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
; Clear objects allocated to BANK5 (148 bytes)
	global __pbssBANK5
lfsr	0,__pbssBANK5
movlw	148
clear_3:
clrf	postinc0,c
decf	wreg
bnz	clear_3
; Clear objects allocated to BANK4 (6 bytes)
	global __pbssBANK4
movlb	4
clrf	(__pbssBANK4+5)&0xffh,b
clrf	(__pbssBANK4+4)&0xffh,b
clrf	(__pbssBANK4+3)&0xffh,b
clrf	(__pbssBANK4+2)&0xffh,b
clrf	(__pbssBANK4+1)&0xffh,b
clrf	(__pbssBANK4+0)&0xffh,b
; Clear objects allocated to BANK3 (3 bytes)
	global __pbssBANK3
movlb	3
clrf	(__pbssBANK3+2)&0xffh,b
clrf	(__pbssBANK3+1)&0xffh,b
clrf	(__pbssBANK3+0)&0xffh,b
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
	global	main@current_time
main@current_time:	; 7 bytes @ 0x0
	ds   7
psect	cstackBANK4,class=BANK4,space=1,noexec,lowdata
global __pcstackBANK4
__pcstackBANK4:
	global	main@buf
main@buf:	; 50 bytes @ 0x0
	ds   50
	global	main@buf_628
main@buf_628:	; 50 bytes @ 0x32
	ds   50
	global	main@buf_667
main@buf_667:	; 50 bytes @ 0x64
	ds   50
	global	main@buf_675
main@buf_675:	; 40 bytes @ 0x96
	ds   40
	global	main@buf_633
main@buf_633:	; 30 bytes @ 0xBE
	ds   30
	global	main@buf_707
main@buf_707:	; 30 bytes @ 0xDC
	ds   30
psect	cstackBANK3,class=BANK3,space=1,noexec,lowdata
global __pcstackBANK3
__pcstackBANK3:
	global	menu_handle_button@buf_1777
menu_handle_button@buf_1777:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_button@buf
menu_handle_button@buf:	; 50 bytes @ 0x32
	ds   50
	global	menu_handle_button@verify_time
menu_handle_button@verify_time:	; 7 bytes @ 0x64
	ds   7
	global	menu_handle_button@new_time
menu_handle_button@new_time:	; 7 bytes @ 0x6B
	ds   7
	global	menu_handle_button@sensor_type
menu_handle_button@sensor_type:	; 1 bytes @ 0x72
	ds   1
	global	menu_handle_button@new_value_1730
menu_handle_button@new_value_1730:	; 2 bytes @ 0x73
	ds   2
??_main:	; 1 bytes @ 0x75
	ds   2
	global	main@time_buf
main@time_buf:	; 60 bytes @ 0x77
	ds   60
	global	main@buf_672
main@buf_672:	; 60 bytes @ 0xB3
	ds   60
	global	main@adc_ch1
main@adc_ch1:	; 2 bytes @ 0xEF
	ds   2
	global	main@adc_ch2
main@adc_ch2:	; 2 bytes @ 0xF1
	ds   2
	global	main@adc_ch3
main@adc_ch3:	; 2 bytes @ 0xF3
	ds   2
	global	main@last_button
main@last_button:	; 1 bytes @ 0xF5
	ds   1
	global	main@adc_error
main@adc_error:	; 1 bytes @ 0xF6
	ds   1
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0xF7
	ds   2
	global	main@current_event
main@current_event:	; 1 bytes @ 0xF9
	ds   1
	global	main@status
main@status:	; 1 bytes @ 0xFA
	ds   1
	global	main@delta
main@delta:	; 2 bytes @ 0xFB
	ds   2
psect	cstackBANK2,class=BANK2,space=1,noexec,lowdata
global __pcstackBANK2
__pcstackBANK2:
	global	menu_handle_button@buf_1691
menu_handle_button@buf_1691:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_button@buf_1725
menu_handle_button@buf_1725:	; 50 bytes @ 0x32
	ds   50
	global	menu_handle_button@buf_1752
menu_handle_button@buf_1752:	; 50 bytes @ 0x64
	ds   50
	global	menu_handle_button@buf_1762
menu_handle_button@buf_1762:	; 50 bytes @ 0x96
	ds   50
	global	menu_handle_button@buf_1771
menu_handle_button@buf_1771:	; 50 bytes @ 0xC8
	ds   50
	global	menu_handle_button@press_type
menu_handle_button@press_type:	; 1 bytes @ 0xFA
	ds   1
	global	menu_handle_button@new_seconds
menu_handle_button@new_seconds:	; 2 bytes @ 0xFB
	ds   2
	global	menu_handle_button@flow_type_1748
menu_handle_button@flow_type_1748:	; 1 bytes @ 0xFD
	ds   1
	global	menu_handle_button@flow_type
menu_handle_button@flow_type:	; 1 bytes @ 0xFE
	ds   1
	global	menu_handle_button@sensor_type_1747
menu_handle_button@sensor_type_1747:	; 1 bytes @ 0xFF
	ds   1
psect	cstackBANK1,class=BANK1,space=1,noexec,lowdata
global __pcstackBANK1
__pcstackBANK1:
	global	menu_handle_encoder@buf_1663
menu_handle_encoder@buf_1663:	; 50 bytes @ 0x0
	global	init_datetime_editor@buf
init_datetime_editor@buf:	; 80 bytes @ 0x0
	ds   50
	global	menu_handle_encoder@buf_1666
menu_handle_encoder@buf_1666:	; 50 bytes @ 0x32
	ds   30
	global	init_datetime_editor@current_time
init_datetime_editor@current_time:	; 7 bytes @ 0x50
	ds   7
	global	menu_handle_button@buf_1693
menu_handle_button@buf_1693:	; 80 bytes @ 0x57
	ds   13
	global	menu_handle_encoder@buf
menu_handle_encoder@buf:	; 50 bytes @ 0x64
	ds   50
	global	_menu_handle_encoder$1661
_menu_handle_encoder$1661:	; 2 bytes @ 0x96
	ds   2
	global	_menu_handle_encoder$1662
_menu_handle_encoder$1662:	; 2 bytes @ 0x98
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
	global	menu_handle_button@buf_1712
menu_handle_button@buf_1712:	; 80 bytes @ 0xA7
	ds   80
	global	menu_handle_button@opts_1756
menu_handle_button@opts_1756:	; 2 bytes @ 0xF7
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
	global	_menu_draw_utility$1629
_menu_draw_utility$1629:	; 2 bytes @ 0x10
	ds   2
	global	_menu_draw_utility$1637
_menu_draw_utility$1637:	; 2 bytes @ 0x12
	ds   2
	global	menu_update_edit_value@sensor_type
menu_update_edit_value@sensor_type:	; 1 bytes @ 0x14
	global	_menu_draw_utility$1641
_menu_draw_utility$1641:	; 2 bytes @ 0x14
	ds   1
	global	menu_update_edit_value@flow_type
menu_update_edit_value@flow_type:	; 1 bytes @ 0x15
	ds   1
	global	menu_draw_utility@len
menu_draw_utility@len:	; 1 bytes @ 0x16
	global	_menu_update_edit_value$1454
_menu_update_edit_value$1454:	; 2 bytes @ 0x16
	ds   1
	global	menu_draw_utility@val_len
menu_draw_utility@val_len:	; 1 bytes @ 0x17
	ds   1
	global	menu_draw_utility@j
menu_draw_utility@j:	; 1 bytes @ 0x18
	global	_menu_update_edit_value$1458
_menu_update_edit_value$1458:	; 2 bytes @ 0x18
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
	global	_menu_draw_input$1518
_menu_draw_input$1518:	; 2 bytes @ 0x1A
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
	global	_menu_draw_input$1522
_menu_draw_input$1522:	; 2 bytes @ 0x1C
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
	global	menu_draw_input@opts_1504
menu_draw_input@opts_1504:	; 2 bytes @ 0x24
	ds   2
	global	menu_draw_input@flag_1508
menu_draw_input@flag_1508:	; 2 bytes @ 0x26
	ds   2
	global	menu_draw_input@val_len_1512
menu_draw_input@val_len_1512:	; 1 bytes @ 0x28
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
	global	_handle_time_rotation$1273
_handle_time_rotation$1273:	; 2 bytes @ 0x32
	global	_rebuild_input_menu$1347
_rebuild_input_menu$1347:	; 2 bytes @ 0x32
	global	_handle_numeric_rotation$1443
_handle_numeric_rotation$1443:	; 2 bytes @ 0x32
	global	_rebuild_clock_menu$1565
_rebuild_clock_menu$1565:	; 2 bytes @ 0x32
	global	menu_update_time_value@debug_after
menu_update_time_value@debug_after:	; 50 bytes @ 0x32
	ds   2
	global	handle_time_rotation@direction
handle_time_rotation@direction:	; 1 bytes @ 0x34
	global	_rebuild_input_menu$1361
_rebuild_input_menu$1361:	; 2 bytes @ 0x34
	global	_handle_numeric_rotation$1445
_handle_numeric_rotation$1445:	; 2 bytes @ 0x34
	global	_rebuild_clock_menu$1571
_rebuild_clock_menu$1571:	; 2 bytes @ 0x34
	ds   2
	global	handle_numeric_rotation@max_tens
handle_numeric_rotation@max_tens:	; 1 bytes @ 0x36
	global	_rebuild_input_menu$1362
_rebuild_input_menu$1362:	; 2 bytes @ 0x36
	global	_rebuild_clock_menu$1572
_rebuild_clock_menu$1572:	; 2 bytes @ 0x36
	ds   1
	global	handle_numeric_rotation@max_units
handle_numeric_rotation@max_units:	; 1 bytes @ 0x37
	ds   1
	global	handle_numeric_rotation@direction
handle_numeric_rotation@direction:	; 1 bytes @ 0x38
	global	_rebuild_input_menu$1368
_rebuild_input_menu$1368:	; 2 bytes @ 0x38
	ds   2
	global	_rebuild_input_menu$1369
_rebuild_input_menu$1369:	; 2 bytes @ 0x3A
	ds   2
	global	trigger_relay_pulse@latch_mode
trigger_relay_pulse@latch_mode:	; 1 bytes @ 0x3C
	global	_rebuild_input_menu$1375
_rebuild_input_menu$1375:	; 2 bytes @ 0x3C
	ds   2
	global	_rebuild_input_menu$1376
_rebuild_input_menu$1376:	; 2 bytes @ 0x3E
	ds   2
	global	_rebuild_input_menu$1380
_rebuild_input_menu$1380:	; 2 bytes @ 0x40
	ds   2
	global	_rebuild_input_menu$1394
_rebuild_input_menu$1394:	; 2 bytes @ 0x42
	ds   2
	global	_rebuild_input_menu$1395
_rebuild_input_menu$1395:	; 2 bytes @ 0x44
	ds   2
	global	_rebuild_input_menu$1399
_rebuild_input_menu$1399:	; 2 bytes @ 0x46
	ds   2
	global	_rebuild_input_menu$1404
_rebuild_input_menu$1404:	; 2 bytes @ 0x48
	ds   2
	global	_rebuild_input_menu$1408
_rebuild_input_menu$1408:	; 2 bytes @ 0x4A
	ds   2
	global	_rebuild_input_menu$1414
_rebuild_input_menu$1414:	; 2 bytes @ 0x4C
	ds   2
	global	_rebuild_input_menu$1415
_rebuild_input_menu$1415:	; 2 bytes @ 0x4E
	ds   2
	global	_rebuild_input_menu$1419
_rebuild_input_menu$1419:	; 2 bytes @ 0x50
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
	global	_rebuild_input_menu$3224
_rebuild_input_menu$3224:	; 2 bytes @ 0x54
	ds   2
	global	_rebuild_input_menu$3225
_rebuild_input_menu$3225:	; 2 bytes @ 0x56
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
	global	_menu_handle_button$1764
_menu_handle_button$1764:	; 2 bytes @ 0x73
	ds   2
	global	menu_handle_button@edit_flag_1719
menu_handle_button@edit_flag_1719:	; 2 bytes @ 0x75
	ds   2
	global	menu_handle_button@opts_1720
menu_handle_button@opts_1720:	; 2 bytes @ 0x77
	ds   2
	global	menu_handle_button@edit_flag_1755
menu_handle_button@edit_flag_1755:	; 2 bytes @ 0x79
	ds   2
	global	menu_handle_button@current_val_1751
menu_handle_button@current_val_1751:	; 2 bytes @ 0x7B
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
?_menu_draw_utility:	; 1 bytes @ 0x0
?_menu_update_numeric_value:	; 1 bytes @ 0x0
?_menu_update_edit_value:	; 1 bytes @ 0x0
?_menu_draw_input:	; 1 bytes @ 0x0
?_menu_draw_setup:	; 1 bytes @ 0x0
?_menu_handle_button:	; 1 bytes @ 0x0
?_save_current_config:	; 1 bytes @ 0x0
?_menu_draw_clock:	; 1 bytes @ 0x0
?_get_menu_timeout_seconds:	; 1 bytes @ 0x0
?_handle_datetime_rotation:	; 1 bytes @ 0x0
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
?_rebuild_utility_menu:	; 1 bytes @ 0x0
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
	global	_isdigit$2951
_isdigit$2951:	; 1 bytes @ 0xF
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
	global	_is_numeric_field$1233
_is_numeric_field$1233:	; 1 bytes @ 0x10
	global	_is_time_field$1240
_is_time_field$1240:	; 1 bytes @ 0x10
	global	_is_option_field$1245
_is_option_field$1245:	; 1 bytes @ 0x10
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
	global	_is_numeric_field$1234
_is_numeric_field$1234:	; 1 bytes @ 0x11
	global	is_time_field@line
is_time_field@line:	; 1 bytes @ 0x11
	global	_is_option_field$1246
_is_option_field$1246:	; 1 bytes @ 0x11
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
	global	_is_numeric_field$1235
_is_numeric_field$1235:	; 1 bytes @ 0x12
	global	_is_option_field$1247
_is_option_field$1247:	; 1 bytes @ 0x12
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
	global	_is_option_field$1248
_is_option_field$1248:	; 1 bytes @ 0x13
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
	global	_menu_update_numeric_value$1469
_menu_update_numeric_value$1469:	; 2 bytes @ 0x17
	global	calculate_config_checksum@j_1928
calculate_config_checksum@j_1928:	; 2 bytes @ 0x17
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
	global	_menu_update_numeric_value$1470
_menu_update_numeric_value$1470:	; 2 bytes @ 0x19
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
	global	_menu_update_numeric_value$1471
_menu_update_numeric_value$1471:	; 2 bytes @ 0x1B
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
	global	_menu_update_numeric_value$1472
_menu_update_numeric_value$1472:	; 2 bytes @ 0x1D
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
	global	_init_numeric_editor$1433
_init_numeric_editor$1433:	; 2 bytes @ 0x1F
	global	_menu_update_numeric_value$1473
_menu_update_numeric_value$1473:	; 2 bytes @ 0x1F
	ds   1
	global	eeprom_init@calculated_checksum
eeprom_init@calculated_checksum:	; 2 bytes @ 0x20
	ds   1
	global	init_numeric_editor@sensor_type
init_numeric_editor@sensor_type:	; 1 bytes @ 0x21
	global	_menu_update_numeric_value$1474
_menu_update_numeric_value$1474:	; 2 bytes @ 0x21
	ds   1
	global	eeprom_init@i
eeprom_init@i:	; 1 bytes @ 0x22
	global	init_numeric_editor@abs_val
init_numeric_editor@abs_val:	; 2 bytes @ 0x22
	ds   1
	global	_menu_update_numeric_value$1475
_menu_update_numeric_value$1475:	; 2 bytes @ 0x23
	global	_menu_draw_setup$1542
_menu_draw_setup$1542:	; 2 bytes @ 0x23
	ds   2
	global	_menu_update_numeric_value$1476
_menu_update_numeric_value$1476:	; 2 bytes @ 0x25
	global	_menu_draw_setup$1548
_menu_draw_setup$1548:	; 2 bytes @ 0x25
	ds   2
	global	_menu_update_numeric_value$1478
_menu_update_numeric_value$1478:	; 2 bytes @ 0x27
	global	_menu_draw_setup$1556
_menu_draw_setup$1556:	; 2 bytes @ 0x27
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
	global	_menu_draw_clock$1609
_menu_draw_clock$1609:	; 2 bytes @ 0x2F
	ds   1
	global	menu_update_numeric_value@screen_line
menu_update_numeric_value@screen_line:	; 1 bytes @ 0x30
	global	_sprintf$2508
_sprintf$2508:	; 2 bytes @ 0x30
	ds   1
	global	_menu_draw_clock$1613
_menu_draw_clock$1613:	; 2 bytes @ 0x31
	ds   1
	global	_sprintf$2509
_sprintf$2509:	; 2 bytes @ 0x32
	ds   1
	global	menu_draw_clock@val_len
menu_draw_clock@val_len:	; 1 bytes @ 0x33
	ds   1
	global	menu_draw_clock@val_len_1603
menu_draw_clock@val_len_1603:	; 1 bytes @ 0x34
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
?_rtc_set_time:	; 1 bytes @ 0x40
??_trigger_relay_pulse:	; 1 bytes @ 0x40
?_init_time_editor:	; 1 bytes @ 0x40
??_menu_update_datetime_display:	; 1 bytes @ 0x40
??_rebuild_input_menu:	; 1 bytes @ 0x40
??_rebuild_clock_menu:	; 1 bytes @ 0x40
??_rebuild_utility_menu:	; 1 bytes @ 0x40
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
	global	_rebuild_utility_menu$3226
_rebuild_utility_menu$3226:	; 2 bytes @ 0x42
	ds   1
??_init_time_editor:	; 1 bytes @ 0x43
	ds   1
	global	_rebuild_utility_menu$3227
_rebuild_utility_menu$3227:	; 2 bytes @ 0x44
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
;!    Strings     3764
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
;!    BANK3           256    253     256
;!    BANK4           256    250     256
;!    BANK5           256      0     254
;!    BANK6           256      0     251
;!    BANK7           256      7     155
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
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK5[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), 
;!		 -> value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), 
;!		 -> value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK5[10]), value_scale4(BANK5[10]), value_sensor(BANK5[12]), value_slpbp(BANK6[10]), 
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
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK5[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), 
;!		 -> value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), 
;!		 -> value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK5[10]), value_scale4(BANK5[10]), value_sensor(BANK5[12]), value_slpbp(BANK6[10]), 
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
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK5[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), 
;!		 -> value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), 
;!		 -> value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK5[10]), value_scale4(BANK5[10]), value_sensor(BANK5[12]), value_slpbp(BANK6[10]), 
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
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK5[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), 
;!		 -> value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), 
;!		 -> value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK5[10]), value_scale4(BANK5[10]), value_sensor(BANK5[12]), value_slpbp(BANK6[10]), 
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
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK5[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), 
;!		 -> value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), 
;!		 -> value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK5[10]), value_scale4(BANK5[10]), value_sensor(BANK5[12]), value_slpbp(BANK6[10]), 
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
;!    menu_draw_clock$1609	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_280(CODE[2]), STR_281(CODE[2]), 
;!
;!    menu_draw_clock$1613	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_282(CODE[2]), STR_283(CODE[2]), 
;!
;!    menu_draw_input$1518	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_238(CODE[2]), STR_239(CODE[2]), 
;!
;!    menu_draw_input$1522	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_240(CODE[2]), STR_241(CODE[2]), 
;!
;!    menu_draw_input@flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(BANK5[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@flag_1508	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(BANK5[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
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
;!    menu_draw_input@opts_1504	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts_1504$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    menu_draw_setup$1542	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_249(CODE[5]), STR_250(CODE[5]), 
;!
;!    menu_draw_setup$1548	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_253(CODE[2]), STR_254(CODE[2]), 
;!
;!    menu_draw_setup$1556	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_257(CODE[2]), STR_258(CODE[2]), 
;!
;!    menu_draw_setup@F2710	PTR const unsigned char [5] size(2) Largest target is 6
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
;!    menu_draw_utility$1637	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_292(CODE[2]), STR_293(CODE[2]), 
;!
;!    menu_draw_utility$1641	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_294(CODE[2]), STR_295(CODE[2]), 
;!
;!    menu_handle_button@edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1719	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(BANK5[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1755	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(BANK5[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
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
;!    menu_handle_button@opts_1720	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1720$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    menu_handle_button@opts_1756	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1756$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    menu_handle_encoder$3228	const PTR const unsigned char  size(2) Largest target is 9
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
;!		 -> no_flow_edit_flag(BANK5[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
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
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK5[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), 
;!		 -> value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), 
;!		 -> value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK5[10]), value_scale4(BANK5[10]), value_sensor(BANK5[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    rebuild_clock_menu$1565	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_261(CODE[8]), STR_262(CODE[9]), 
;!
;!    rebuild_clock_menu$1571	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_263(CODE[6]), STR_264(CODE[6]), STR_265(CODE[9]), 
;!
;!    rebuild_clock_menu$1572	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_264(CODE[6]), STR_265(CODE[9]), 
;!
;!    rebuild_input_menu$1347	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_174(CODE[8]), STR_175(CODE[9]), 
;!
;!    rebuild_input_menu$1361	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_184(CODE[6]), STR_185(CODE[6]), STR_186(CODE[9]), 
;!
;!    rebuild_input_menu$1362	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_185(CODE[6]), STR_186(CODE[9]), 
;!
;!    rebuild_input_menu$1368	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_187(CODE[6]), STR_188(CODE[6]), STR_189(CODE[9]), 
;!
;!    rebuild_input_menu$1369	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_188(CODE[6]), STR_189(CODE[9]), 
;!
;!    rebuild_input_menu$1375	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_190(CODE[6]), STR_191(CODE[6]), STR_192(CODE[9]), 
;!
;!    rebuild_input_menu$1376	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_191(CODE[6]), STR_192(CODE[9]), 
;!
;!    rebuild_input_menu$1380	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_193(CODE[5]), STR_194(CODE[5]), 
;!
;!    rebuild_input_menu$1394	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_200(CODE[6]), STR_201(CODE[6]), STR_202(CODE[9]), 
;!
;!    rebuild_input_menu$1395	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_201(CODE[6]), STR_202(CODE[9]), 
;!
;!    rebuild_input_menu$1399	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_203(CODE[5]), STR_204(CODE[5]), 
;!
;!    rebuild_input_menu$1404	PTR const unsigned char  size(2) Largest target is 8
;!		 -> STR_206(CODE[7]), STR_207(CODE[8]), 
;!
;!    rebuild_input_menu$1408	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_208(CODE[5]), STR_209(CODE[5]), 
;!
;!    rebuild_input_menu$1414	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_210(CODE[6]), STR_211(CODE[6]), STR_212(CODE[9]), 
;!
;!    rebuild_input_menu$1415	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_211(CODE[6]), STR_212(CODE[9]), 
;!
;!    rebuild_input_menu$1419	PTR const unsigned char  size(2) Largest target is 4
;!		 -> STR_213(CODE[2]), STR_214(CODE[4]), 
;!
;!    rtc_read_register@value	PTR unsigned char  size(2) Largest target is 1
;!		 -> main@status(BANK3[1]), 
;!
;!    rtc_read_time@time	PTR struct . size(2) Largest target is 7
;!		 -> init_datetime_editor@current_time(BANK1[7]), main@current_time(BANK7[7]), menu_handle_button@verify_time(BANK3[7]), 
;!
;!    rtc_set_time@time	PTR struct . size(2) Largest target is 7
;!		 -> menu_handle_button@new_time(BANK3[7]), 
;!
;!    S945$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    S949$label	PTR const unsigned char  size(2) Largest target is 13
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
;!    S949$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK5[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), 
;!		 -> value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), 
;!		 -> value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK5[10]), value_scale4(BANK5[10]), value_sensor(BANK5[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    sp__get_item_options_for_field	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    sp__get_option_edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(BANK5[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    sp__memcpy	PTR void  size(2) Largest target is 384
;!		 -> clock_menu(BANK5[25]), input_config(BIGRAM[384]), input_menu(BANK5[75]), system_config(BANK7[128]), 
;!
;!    sp__strcpy	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_draw_utility@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), 
;!		 -> original_value(BANK6[10]), STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), 
;!		 -> STR_273(CODE[1]), value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), 
;!		 -> value_clock_enable(BANK6[10]), value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK5[10]), 
;!		 -> value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), 
;!		 -> value_high_tbp(BANK6[10]), value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), 
;!		 -> value_low_flow(BANK6[10]), value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), 
;!		 -> value_no_flow(BANK6[10]), value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), 
;!		 -> value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), 
;!		 -> value_rlyslp(BANK6[10]), value_scale20(BANK5[10]), value_scale4(BANK5[10]), value_sensor(BANK5[12]), 
;!		 -> value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 12
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), menu_item_options$option_count(CODE[1]), menu_update_time_value@value_buf(BANK0[6]), 
;!		 -> relay_high_edit_flag(COMRAM[1]), ?_sprintf(COMRAM[2]), sprintf@c(COMRAM[1]), STR_174(CODE[8]), 
;!		 -> STR_175(CODE[9]), STR_261(CODE[8]), STR_262(CODE[9]), STR_270(CODE[1]), 
;!		 -> STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), STR_364(CODE[7]), 
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
;!		 -> value_display(BANK5[10]), value_enable(BANK5[10]), value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), 
;!		 -> value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), value_high_temp(BANK6[10]), 
;!		 -> value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), value_low_flow_bp(BANK6[10]), 
;!		 -> value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), value_no_flow_bp(BANK6[10]), 
;!		 -> value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), 
;!		 -> value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), value_scale20(BANK5[10]), 
;!		 -> value_scale4(BANK5[10]), value_sensor(BANK5[12]), value_slpbp(BANK6[10]), NULL(NULL[0]), 
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
;!		 -> STR_310(CODE[42]), STR_311(CODE[34]), STR_312(CODE[45]), STR_314(CODE[44]), 
;!		 -> STR_318(CODE[26]), STR_319(CODE[10]), STR_321(CODE[6]), STR_322(CODE[6]), 
;!		 -> STR_323(CODE[5]), STR_324(CODE[5]), STR_325(CODE[6]), STR_326(CODE[6]), 
;!		 -> STR_327(CODE[5]), STR_328(CODE[6]), STR_329(CODE[6]), STR_330(CODE[5]), 
;!		 -> STR_332(CODE[38]), STR_333(CODE[32]), STR_340(CODE[46]), STR_345(CODE[28]), 
;!		 -> STR_351(CODE[50]), STR_352(CODE[40]), STR_6(CODE[39]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(BANK1[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK4[50]), main@buf_628(BANK4[50]), main@buf_633(BANK4[30]), main@buf_667(BANK4[50]), 
;!		 -> main@buf_672(BANK3[60]), main@buf_675(BANK4[40]), main@buf_707(BANK4[30]), main@time_buf(BANK3[60]), 
;!		 -> menu_draw_input@title(BANK0[10]), menu_handle_button@buf(BANK3[50]), menu_handle_button@buf_1691(BANK2[50]), menu_handle_button@buf_1693(BANK1[80]), 
;!		 -> menu_handle_button@buf_1712(BANK1[80]), menu_handle_button@buf_1725(BANK2[50]), menu_handle_button@buf_1752(BANK2[50]), menu_handle_button@buf_1762(BANK2[50]), 
;!		 -> menu_handle_button@buf_1771(BANK2[50]), menu_handle_button@buf_1777(BANK3[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1663(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1666(BANK1[50]), menu_update_datetime_display@date_buf(COMRAM[9]), menu_update_datetime_display@time_buf(COMRAM[9]), menu_update_edit_value@value_buf(BANK0[10]), 
;!		 -> menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), 
;!		 -> rtc_read_time@debug_buf(BANK0[80]), rtc_set_time@buf(BANK0[80]), STR_270(CODE[1]), STR_271(CODE[1]), 
;!		 -> STR_272(CODE[1]), STR_273(CODE[1]), trigger_relay_pulse@buf(BANK0[60]), value_back(BANK5[5]), 
;!		 -> value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), value_contrast(BANK5[4]), 
;!		 -> value_display(BANK5[10]), value_enable(BANK5[10]), value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), 
;!		 -> value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), value_high_temp(BANK6[10]), 
;!		 -> value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), value_low_flow_bp(BANK6[10]), 
;!		 -> value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), value_no_flow_bp(BANK6[10]), 
;!		 -> value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), 
;!		 -> value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), value_scale20(BANK5[10]), 
;!		 -> value_scale4(BANK5[10]), value_sensor(BANK5[12]), value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), STR_273(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK5[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), 
;!		 -> value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), 
;!		 -> value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK5[10]), value_scale4(BANK5[10]), value_sensor(BANK5[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_237(CODE[1]), STR_335(CODE[8]), STR_336(CODE[6]), STR_337(CODE[6]), 
;!		 -> STR_338(CODE[5]), STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), 
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
;!		 -> value_clock_enable(BANK6[10]), value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK5[10]), 
;!		 -> value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), 
;!		 -> value_high_tbp(BANK6[10]), value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), 
;!		 -> value_low_flow(BANK6[10]), value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), 
;!		 -> value_no_flow(BANK6[10]), value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), 
;!		 -> value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), 
;!		 -> value_rlyslp(BANK6[10]), value_scale20(BANK5[10]), value_scale4(BANK5[10]), value_sensor(BANK5[12]), 
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
;!		 -> value_enable(BANK5[10]), value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), 
;!		 -> value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), value_high_temp(BANK6[10]), value_highbp(BANK6[10]), 
;!		 -> value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), 
;!		 -> value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), 
;!		 -> value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), 
;!		 -> value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), value_scale20(BANK5[10]), value_scale4(BANK5[10]), 
;!		 -> value_sensor(BANK5[12]), value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    strcpy@to	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_draw_utility@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), 
;!		 -> original_value(BANK6[10]), STR_270(CODE[1]), STR_271(CODE[1]), STR_272(CODE[1]), 
;!		 -> STR_273(CODE[1]), value_back(BANK5[5]), value_brightness(BANK5[4]), value_clock_display(BANK7[10]), 
;!		 -> value_clock_enable(BANK6[10]), value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK5[10]), 
;!		 -> value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), 
;!		 -> value_high_tbp(BANK6[10]), value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), 
;!		 -> value_low_flow(BANK6[10]), value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), 
;!		 -> value_no_flow(BANK6[10]), value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), 
;!		 -> value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), 
;!		 -> value_rlyslp(BANK6[10]), value_scale20(BANK5[10]), value_scale4(BANK5[10]), value_sensor(BANK5[12]), 
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
;!		 -> value_enable(BANK5[10]), value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), 
;!		 -> value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), value_high_temp(BANK6[10]), value_highbp(BANK6[10]), 
;!		 -> value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), 
;!		 -> value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), 
;!		 -> value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), 
;!		 -> value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), value_scale20(BANK5[10]), value_scale4(BANK5[10]), 
;!		 -> value_sensor(BANK5[12]), value_slpbp(BANK6[10]), NULL(NULL[0]), 
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
;!		 -> value_enable(BANK5[10]), value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), 
;!		 -> value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), value_high_temp(BANK6[10]), value_highbp(BANK6[10]), 
;!		 -> value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), 
;!		 -> value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), 
;!		 -> value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), 
;!		 -> value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), value_scale20(BANK5[10]), value_scale4(BANK5[10]), 
;!		 -> value_sensor(BANK5[12]), value_slpbp(BANK6[10]), NULL(NULL[0]), 
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
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK5[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), 
;!		 -> value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), 
;!		 -> value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK5[10]), value_scale4(BANK5[10]), value_sensor(BANK5[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(BANK1[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK4[50]), main@buf_628(BANK4[50]), main@buf_633(BANK4[30]), main@buf_667(BANK4[50]), 
;!		 -> main@buf_672(BANK3[60]), main@buf_675(BANK4[40]), main@buf_707(BANK4[30]), main@time_buf(BANK3[60]), 
;!		 -> menu_handle_button@buf(BANK3[50]), menu_handle_button@buf_1691(BANK2[50]), menu_handle_button@buf_1693(BANK1[80]), menu_handle_button@buf_1712(BANK1[80]), 
;!		 -> menu_handle_button@buf_1725(BANK2[50]), menu_handle_button@buf_1752(BANK2[50]), menu_handle_button@buf_1762(BANK2[50]), menu_handle_button@buf_1771(BANK2[50]), 
;!		 -> menu_handle_button@buf_1777(BANK3[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1663(BANK1[50]), menu_handle_encoder@buf_1666(BANK1[50]), 
;!		 -> menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), 
;!		 -> rtc_read_time@debug_buf(BANK0[80]), rtc_set_time@buf(BANK0[80]), STR_10(CODE[42]), STR_12(CODE[38]), 
;!		 -> STR_13(CODE[34]), STR_139(CODE[29]), STR_149(CODE[26]), STR_15(CODE[28]), 
;!		 -> STR_16(CODE[23]), STR_19(CODE[22]), STR_2(CODE[42]), STR_20(CODE[19]), 
;!		 -> STR_21(CODE[24]), STR_22(CODE[22]), STR_222(CODE[31]), STR_23(CODE[22]), 
;!		 -> STR_24(CODE[19]), STR_26(CODE[16]), STR_313(CODE[36]), STR_315(CODE[16]), 
;!		 -> STR_316(CODE[27]), STR_317(CODE[24]), STR_320(CODE[27]), STR_33(CODE[22]), 
;!		 -> STR_331(CODE[53]), STR_334(CODE[25]), STR_339(CODE[20]), STR_34(CODE[20]), 
;!		 -> STR_341(CODE[37]), STR_342(CODE[37]), STR_343(CODE[25]), STR_344(CODE[26]), 
;!		 -> STR_346(CODE[29]), STR_347(CODE[28]), STR_348(CODE[30]), STR_349(CODE[28]), 
;!		 -> STR_35(CODE[21]), STR_350(CODE[32]), STR_353(CODE[22]), STR_354(CODE[28]), 
;!		 -> STR_355(CODE[37]), STR_356(CODE[31]), STR_357(CODE[39]), STR_358(CODE[31]), 
;!		 -> STR_359(CODE[49]), STR_36(CODE[33]), STR_360(CODE[38]), STR_361(CODE[43]), 
;!		 -> STR_362(CODE[38]), STR_363(CODE[29]), STR_39(CODE[36]), STR_4(CODE[29]), 
;!		 -> STR_40(CODE[20]), STR_41(CODE[21]), STR_5(CODE[23]), STR_7(CODE[20]), 
;!		 -> STR_8(CODE[16]), STR_9(CODE[37]), trigger_relay_pulse@buf(BANK0[60]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(BANK1[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK4[50]), main@buf_628(BANK4[50]), main@buf_633(BANK4[30]), main@buf_667(BANK4[50]), 
;!		 -> main@buf_672(BANK3[60]), main@buf_675(BANK4[40]), main@buf_707(BANK4[30]), main@time_buf(BANK3[60]), 
;!		 -> menu_handle_button@buf(BANK3[50]), menu_handle_button@buf_1691(BANK2[50]), menu_handle_button@buf_1693(BANK1[80]), menu_handle_button@buf_1712(BANK1[80]), 
;!		 -> menu_handle_button@buf_1725(BANK2[50]), menu_handle_button@buf_1752(BANK2[50]), menu_handle_button@buf_1762(BANK2[50]), menu_handle_button@buf_1771(BANK2[50]), 
;!		 -> menu_handle_button@buf_1777(BANK3[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1663(BANK1[50]), menu_handle_encoder@buf_1666(BANK1[50]), 
;!		 -> menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), 
;!		 -> rtc_read_time@debug_buf(BANK0[80]), rtc_set_time@buf(BANK0[80]), STR_10(CODE[42]), STR_12(CODE[38]), 
;!		 -> STR_13(CODE[34]), STR_139(CODE[29]), STR_149(CODE[26]), STR_15(CODE[28]), 
;!		 -> STR_16(CODE[23]), STR_19(CODE[22]), STR_2(CODE[42]), STR_20(CODE[19]), 
;!		 -> STR_21(CODE[24]), STR_22(CODE[22]), STR_222(CODE[31]), STR_23(CODE[22]), 
;!		 -> STR_24(CODE[19]), STR_26(CODE[16]), STR_313(CODE[36]), STR_315(CODE[16]), 
;!		 -> STR_316(CODE[27]), STR_317(CODE[24]), STR_320(CODE[27]), STR_33(CODE[22]), 
;!		 -> STR_331(CODE[53]), STR_334(CODE[25]), STR_339(CODE[20]), STR_34(CODE[20]), 
;!		 -> STR_341(CODE[37]), STR_342(CODE[37]), STR_343(CODE[25]), STR_344(CODE[26]), 
;!		 -> STR_346(CODE[29]), STR_347(CODE[28]), STR_348(CODE[30]), STR_349(CODE[28]), 
;!		 -> STR_35(CODE[21]), STR_350(CODE[32]), STR_353(CODE[22]), STR_354(CODE[28]), 
;!		 -> STR_355(CODE[37]), STR_356(CODE[31]), STR_357(CODE[39]), STR_358(CODE[31]), 
;!		 -> STR_359(CODE[49]), STR_36(CODE[33]), STR_360(CODE[38]), STR_361(CODE[43]), 
;!		 -> STR_362(CODE[38]), STR_363(CODE[29]), STR_39(CODE[36]), STR_4(CODE[29]), 
;!		 -> STR_40(CODE[20]), STR_41(CODE[21]), STR_5(CODE[23]), STR_7(CODE[20]), 
;!		 -> STR_8(CODE[16]), STR_9(CODE[37]), trigger_relay_pulse@buf(BANK0[60]), 
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
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK5[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), 
;!		 -> value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), 
;!		 -> value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK5[10]), value_scale4(BANK5[10]), value_sensor(BANK5[12]), value_slpbp(BANK6[10]), 
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
;!		 -> value_contrast(BANK5[4]), value_display(BANK5[10]), value_enable(BANK5[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK6[10]), value_hi_pressure(BANK6[10]), value_high_tbp(BANK6[10]), 
;!		 -> value_high_temp(BANK6[10]), value_highbp(BANK6[10]), value_log_entries(BANK5[6]), value_low_flow(BANK6[10]), 
;!		 -> value_low_flow_bp(BANK6[10]), value_low_pressure(BANK6[10]), value_menu_timeout(BANK5[6]), value_no_flow(BANK6[10]), 
;!		 -> value_no_flow_bp(BANK6[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK5[6]), value_relay_pulse(BANK5[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK6[10]), 
;!		 -> value_scale20(BANK5[10]), value_scale4(BANK5[10]), value_sensor(BANK5[12]), value_slpbp(BANK6[10]), 
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
;!    _init_numeric_editor->___lwdiv
;!    _init_datetime_editor->_rtc_read_time
;!    _rtc_read_time->_sprintf
;!    _sprintf->___lwdiv
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
;! (0) _main                                               410   410      0 1825427
;!                                            117 BANK3    136   136      0
;!                                              0 BANK4    250   250      0
;!                                              0 BANK7      7     7      0
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
;! (1) _menu_update_edit_value                              31    31      0   44479
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
;! (1) _menu_handle_encoder                                172   170      2  466926
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
;! (2) _handle_time_rotation                                53    53      0   36661
;!                                              0 BANK0     53    53      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _handle_numeric_rotation                             57    57      0   37014
;!                                              0 BANK0     57    57      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                 559   559      0  777605
;!                                            110 BANK0     17    17      0
;!                                             87 BANK1    169   169      0
;!                                              0 BANK2    256   256      0
;!                                              0 BANK3    117   117      0
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
;! (2) _trigger_relay_pulse                                 61    61      0   36593
;!                                              0 BANK0     61    61      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rtc_set_time                                        90    88      2   39151
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
;! (2) _rebuild_utility_menu                                 7     7      0   34363
;!                                             64 COMRAM     7     7      0
;!                            ___lbdiv
;!                            ___lbmod
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_input_menu                                  90    90      0   53031
;!                                             64 COMRAM     1     1      0
;!                                              0 BANK0     89    89      0
;!                            ___lwdiv
;!                            ___lwmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_clock_menu                                  58    58      0   46944
;!                                             64 COMRAM     2     2      0
;!                                              0 BANK0     56    56      0
;!                            ___lbdiv
;!                            ___lbmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_time_value                             111   111      0   84303
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
;! (2) ___lbmod                                              4     3      1     772
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) ___lbdiv                                              4     3      1     781
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_utility                                   34    34      0   85953
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
;! (3) _menu_update_datetime_display                        18    18      0   48711
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
;! (2) _menu_draw_input                                     51    51      0   74690
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
;! (2) _init_time_editor                                    63    60      3   42520
;!                                             64 COMRAM     3     0      3
;!                                              0 BANK0     60    60      0
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _init_numeric_editor                                 10     8      2    5988
;!                                             26 COMRAM    10     8      2
;!                            ___lwdiv
;!                            ___lwmod
;! ---------------------------------------------------------------------------------
;! (2) _init_datetime_editor                                87    87      0   74769
;!                                              0 BANK1     87    87      0
;!                      _rtc_read_time
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _rtc_read_time                                       90    88      2   38026
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
;! (1) _sprintf                                             42    24     18   27107
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
;! (2) _bcd_to_dec                                           2     2      0      62
;!                                             14 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (2) _get_current_numeric_value                           10     8      2      68
;!                                             14 COMRAM    10     8      2
;! ---------------------------------------------------------------------------------
;! (2) _beep                                                 5     3      2    2588
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
;! (1) _ad7994_init                                          1     1      0    9395
;!                                             19 COMRAM     1     1      0
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    9228
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
;!       ___lbdiv
;!       ___lbmod
;!       ___lwdiv
;!       ___lwmod
;!       _sprintf
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
;!BANK7              100      7      9B      19       60.5%
;!BITBANK6           100      0       0      16        0.0%
;!BANK6              100      0      FB      17       98.0%
;!BITBANK5           100      0       0      14        0.0%
;!BANK5              100      0      FE      15       99.2%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100     FA     100      13      100.0%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100     FD     100      11      100.0%
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
;!ABS                  0      0     784      50        0.0%
;!DATA                 0      0     904       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 174 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            30  220[BANK4 ] unsigned char [30]
;;  current_even    1  249[BANK3 ] unsigned char 
;;  time_buf       60  119[BANK3 ] unsigned char [60]
;;  buf            40  150[BANK4 ] unsigned char [40]
;;  delta           2  251[BANK3 ] int 
;;  buf            60  179[BANK3 ] unsigned char [60]
;;  buf            50  100[BANK4 ] unsigned char [50]
;;  buf            50   50[BANK4 ] unsigned char [50]
;;  lcd_buf        17    0        unsigned char [17]
;;  buf            30  190[BANK4 ] unsigned char [30]
;;  status          1  250[BANK3 ] unsigned char 
;;  buf            50    0[BANK4 ] unsigned char [50]
;;  current_time    7    0[BANK7 ] struct .
;;  last_encoder    2  247[BANK3 ] int 
;;  adc_ch3         2  243[BANK3 ] unsigned int 
;;  adc_ch2         2  241[BANK3 ] unsigned int 
;;  adc_ch1         2  239[BANK3 ] unsigned int 
;;  adc_error       1  246[BANK3 ] unsigned char 
;;  last_button     1  245[BANK3 ] unsigned char 
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
;;      Locals:         0       0       0       0     134     250       0       0       7       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       2       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0     136     250       0       0       7       0       0       0       0       0       0       0       0
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
	
l15981:
	call	_system_init	;wreg free
	line	179
	
l15983:
	call	_eeprom_init	;wreg free
	line	186
	
l15985:; BSR set to: 5

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
	
l15987:
	call	_uart_init	;wreg free
	line	190
	
l15989:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	192
	
l15991:
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
	
l15993:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	196
	
l15995:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	197
	
l15997:
	call	_i2c_init	;wreg free
	line	198
	
l15999:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	201
	
l16001:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	202
	
l16003:
	call	_rtc_init	;wreg free
	iorlw	0
	btfss	status,2
	goto	u21861
	goto	u21860
u21861:
	goto	l16017
u21860:
	line	204
	
l16005:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	208
	
l16007:
		movlw	low(main@status)
	movwf	((c:rtc_read_register@value))^00h,c
	movlw	high(main@status)
	movwf	((c:rtc_read_register@value+1))^00h,c

	movlw	(0Fh)&0ffh
	
	call	_rtc_read_register
	iorlw	0
	btfss	status,2
	goto	u21871
	goto	u21870
u21871:
	goto	l172
u21870:
	line	211
	
l16009:
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
	
l16011:
		movlw	low(main@buf_628)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_628)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	214
	
l16013:
	movlb	3	; () banked
	
	btfss	((main@status))&0ffh,(7)&7
	goto	u21881
	goto	u21880
u21881:
	goto	l172
u21880:
	line	216
	
l16015:; BSR set to: 3

		movlw	low(STR_12)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_12)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l172
	line	222
	
l16017:
		movlw	low(STR_13)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_13)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	223
	
l172:
	line	246
	call	_ad7994_init	;wreg free
	movlb	3	; () banked
	movwf	((main@adc_error))&0ffh
	line	247
	
l16019:; BSR set to: 3

	movf	((main@adc_error))&0ffh,w
	btfsc	status,2
	goto	u21891
	goto	u21890
u21891:
	goto	l16025
u21890:
	line	250
	
l16021:; BSR set to: 3

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
	
l16023:
		movlw	low(main@buf_633)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_633)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	254
	
l16025:
	call	_encoder_init	;wreg free
	line	255
	
l16027:; BSR set to: 5

	call	_menu_init	;wreg free
	line	256
	
l16029:; BSR set to: 5

	call	_lcd_init	;wreg free
	line	258
	
l16031:
		movlw	low(STR_15)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	259
	
l16033:
		movlw	low(STR_16)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_16)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	261
	
l16035:
	call	_lcd_clear	;wreg free
	line	262
	
l16037:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	263
	
l16039:
		movlw	low(STR_17)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_17)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	264
	
l16041:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	265
	
l16043:
		movlw	low(STR_18)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_18)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	267
	
l16045:
		movlw	low(STR_19)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_19)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	268
	
l16047:
		movlw	low(STR_20)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_20)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	269
	
l16049:
		movlw	low(STR_21)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_21)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	271
	
l16051:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	272
	
l16053:
	asmopt push
asmopt off
movlw  5
	movlb	3	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	15
movwf	(??_main+0+0)&0ffh
	movlw	241
u22327:
decfsz	wreg,f
	bra	u22327
	decfsz	(??_main+0+0)&0ffh,f
	bra	u22327
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u22327
asmopt pop

	line	273
	
l16055:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	275
	
l16057:
		movlw	low(STR_22)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_22)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	276
	
l16059:
		movlw	low(STR_23)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_23)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	282
	
l16061:
	movlb	4	; () banked
	setf	((_current_menu))&0ffh
	line	283
	
l16063:; BSR set to: 4

	movlw	low(05h)
	movlb	5	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	285
	
l16065:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	286
	
l16067:
		movlw	low(STR_24)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_24)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	289
	
l16069:
	movlw	high(0)
	movlb	3	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	290
	
l16071:; BSR set to: 3

	movlw	low(0)
	movwf	((main@last_button))&0ffh
	line	304
	
l16073:
	incf	((c:main@sample_counter))^00h,c
	line	306
	
l16075:
		movlw	0Ah-1
	cpfsgt	((c:main@sample_counter))^00h,c
	goto	u21901
	goto	u21900

u21901:
	goto	l16097
u21900:
	line	308
	
l16077:
	movlw	low(0)
	movwf	((c:main@sample_counter))^00h,c
	line	311
	
l16079:
		movlw	low(main@current_time)
	movwf	((c:rtc_read_time@time))^00h,c
	movlw	high(main@current_time)
	movwf	((c:rtc_read_time@time+1))^00h,c

	call	_rtc_read_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u21911
	goto	u21910
u21911:
	goto	l16085
u21910:
	line	316
	
l16081:
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
	
l16083:
		movlw	low(main@time_buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@time_buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	318
	goto	l16087
	line	321
	
l16085:
		movlw	low(STR_26)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_26)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	325
	
l16087:
	movlw	(01h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch1)
	movff	1+?_ad7994_read_channel,(main@adc_ch1+1)
	line	326
	
l16089:
	movlw	(02h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch2)
	movff	1+?_ad7994_read_channel,(main@adc_ch2+1)
	line	327
	
l16091:
	movlw	(03h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch3)
	movff	1+?_ad7994_read_channel,(main@adc_ch3+1)
	line	331
	
l16093:
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
	
l16095:
		movlw	low(main@buf_667)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_667)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	337
	
l16097:
	asmopt push
asmopt off
movlw  3
	movlb	3	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	8
movwf	(??_main+0+0)&0ffh
	movlw	119
u22337:
decfsz	wreg,f
	bra	u22337
	decfsz	(??_main+0+0)&0ffh,f
	bra	u22337
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u22337
asmopt pop

	line	342
	
l16099:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	354
	
l16101:
	movf	((c:main@last_relay_state))^00h,c,w
	movlb	0	; () banked
xorwf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u21921
	goto	u21920

u21921:
	goto	l16105
u21920:
	
l16103:; BSR set to: 0

	movlb	5	; () banked
	movf	((main@last_relay_counter))&0ffh,w
	movlb	4	; () banked
xorwf	((_relay_counter))&0ffh,w	;volatile
	bnz	u21930
	movlb	5	; () banked
movf	((main@last_relay_counter+1))&0ffh,w
	movlb	4	; () banked
xorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u21931
	goto	u21930

u21931:
	goto	l16113
u21930:
	line	357
	
l16105:
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
	
l16107:
		movlw	low(main@buf_672)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_672)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	359
	
l16109:
	movff	(_relay_state),(c:main@last_relay_state)	;volatile
	line	360
	
l16111:
	movff	(_relay_counter),(main@last_relay_counter)	;volatile
	movff	(_relay_counter+1),(main@last_relay_counter+1)	;volatile
	line	365
	
l16113:
	movlb	3	; () banked
	movf	((main@last_encoder))&0ffh,w
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u21940
movf	((main@last_encoder+1))&0ffh,w
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u21941
	goto	u21940

u21941:
	goto	l16179
u21940:
	line	367
	
l16115:; BSR set to: 3

	movf	((main@last_encoder))&0ffh,w
	subwf	((_encoder_count))&0ffh,w	;volatile
	movwf	((main@delta))&0ffh
	movf	((main@last_encoder+1))&0ffh,w
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movwf	1+((main@delta))&0ffh
	line	370
	
l16117:; BSR set to: 3

	movlw	high(01h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	373
	
l16119:
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
	
l16121:
		movlw	low(main@buf_675)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_675)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	376
	
l16123:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	379
	
l16125:
	movlw	high(0Ah)
	movlb	5	; () banked
	movwf	((main@encoder_activity_timer+1))&0ffh
	movlw	low(0Ah)
	movwf	((main@encoder_activity_timer))&0ffh
	line	382
	
l16127:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u21951
	goto	u21950
u21951:
	goto	l196
u21950:
	line	384
	
l16129:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	385
	
l196:; BSR set to: 5

	line	388
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u21961
	goto	u21960
u21961:
	goto	l16143
u21960:
	
l16131:; BSR set to: 5

	movlb	4	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21971
	goto	u21970

u21971:
	goto	l16143
u21970:
	line	390
	
l16133:; BSR set to: 4

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
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u21981
	goto	u21980
u21981:
	goto	l16137
u21980:
	line	393
	
l16135:
	movlb	3	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_numeric_rotation
	line	394
	goto	l16153
	line	395
	
l16137:
	movlb	4	; () banked
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
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u21991
	goto	u21990
u21991:
	goto	l16141
u21990:
	line	398
	
l16139:
	movlb	3	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_time_rotation
	line	399
	call	_menu_update_time_value	;wreg free
	line	400
	goto	l16153
	line	404
	
l16141:
	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	goto	l16153
	line	407
	
l16143:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22001
	goto	u22000
u22001:
	goto	l16141
u22000:
	
l16145:; BSR set to: 5

		movlw	4
	movlb	4	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22011
	goto	u22010

u22011:
	goto	l16141
u22010:
	line	410
	
l16147:; BSR set to: 4

	movlb	3	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_datetime_rotation
	line	411
	
l16149:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	420
	
l16153:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22021
	goto	u22020
u22021:
	goto	l16167
u22020:
	
l16155:; BSR set to: 5

	movlb	4	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22031
	goto	u22030

u22031:
	goto	l16167
u22030:
	line	423
	
l16157:; BSR set to: 4

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
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u22041
	goto	u22040
u22041:
	goto	l16161
u22040:
	line	426
	
l16159:
	call	_menu_update_numeric_value	;wreg free
	line	427
	goto	l16179
	line	428
	
l16161:
	movlb	4	; () banked
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
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u22051
	goto	u22050
u22051:
	goto	l16165
u22050:
	line	431
	
l16163:
	call	_menu_update_time_value	;wreg free
	line	432
	goto	l16179
	line	436
	
l16165:
	call	_menu_update_edit_value	;wreg free
	goto	l16179
	line	442
	
l16167:
	movlb	4	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22061
	goto	u22060
u22061:
	goto	l16171
u22060:
	line	444
	
l16169:; BSR set to: 4

	call	_menu_draw_options	;wreg free
	line	445
	goto	l16179
	line	446
	
l16171:; BSR set to: 4

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22071
	goto	u22070

u22071:
	goto	l16175
u22070:
	line	448
	
l16173:; BSR set to: 4

	call	_menu_draw_input	;wreg free
	line	449
	goto	l16179
	line	450
	
l16175:; BSR set to: 4

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22081
	goto	u22080

u22081:
	goto	l16179
u22080:
	line	452
	
l16177:; BSR set to: 4

	call	_menu_draw_setup	;wreg free
	line	458
	
l16179:
	movlb	3	; () banked
	movf	((main@last_button))&0ffh,w
	movlb	4	; () banked
xorwf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u22091
	goto	u22090

u22091:
	goto	l16219
u22090:
	line	460
	
l16181:; BSR set to: 4

	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u22101
	goto	u22100
u22101:
	goto	l16215
u22100:
	line	462
	
l16183:; BSR set to: 4

	movff	(_button_event),(main@current_event)	;volatile
	line	463
	
l16185:; BSR set to: 4

	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	466
	
l16187:; BSR set to: 4

		movlw	low(main@buf_707)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_707)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_30)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_30)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@current_event),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	467
	
l16189:
		movlw	low(main@buf_707)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_707)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	470
	
l16191:
	movlb	4	; () banked
		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22111
	goto	u22110

u22111:
	goto	l16201
u22110:
	line	472
	
l16193:; BSR set to: 4

	movlb	3	; () banked
		decf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u22121
	goto	u22120

u22121:
	goto	l16215
u22120:
	line	474
	
l16195:; BSR set to: 3

	movlw	low(0)
	movlb	4	; () banked
	movwf	((_current_menu))&0ffh
	line	475
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu))&0ffh
	line	476
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	477
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	478
	
l16197:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	479
	
l16199:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l16215
	line	485
	
l16201:; BSR set to: 4

	movlb	3	; () banked
	movf	((main@current_event))&0ffh,w
	
	call	_menu_handle_button
	line	488
	
l16203:
	movlb	4	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22131
	goto	u22130
u22131:
	goto	l16207
u22130:
	line	489
	
l16205:; BSR set to: 4

	call	_menu_draw_options	;wreg free
	goto	l16215
	line	490
	
l16207:; BSR set to: 4

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22141
	goto	u22140

u22141:
	goto	l16211
u22140:
	line	491
	
l16209:; BSR set to: 4

	call	_menu_draw_input	;wreg free
	goto	l16215
	line	492
	
l16211:; BSR set to: 4

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22151
	goto	u22150

u22151:
	goto	l16215
u22150:
	line	493
	
l16213:; BSR set to: 4

	call	_menu_draw_setup	;wreg free
	line	496
	
l16215:
	movff	(_button_event),(main@last_button)	;volatile
	line	497
	
l16217:
	movlw	low(0)
	movlb	4	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	502
	
l16219:; BSR set to: 4

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22161
	goto	u22160

u22161:
	goto	l16235
u22160:
	
l16221:; BSR set to: 4

		incf	((c:main@last_menu_state))^00h,c,w
	btfsc	status,2
	goto	u22171
	goto	u22170

u22171:
	goto	l16235
u22170:
	line	505
	
l16223:; BSR set to: 4

	call	_lcd_clear	;wreg free
	line	506
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	507
	
l16225:
		movlw	low(STR_31)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_31)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	508
	
l16227:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	509
		movlw	low(STR_32)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_32)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	510
		movlw	low(STR_33)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_33)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	512
		movlw	low(STR_34)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_34)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	513
	
l16229:
	call	_save_current_config	;wreg free
	line	514
	
l16231:
	movlw	low(0)
	movwf	((c:_save_pending))^00h,c
	line	515
	
l16233:
		movlw	low(STR_35)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_35)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	517
	
l16235:
	movff	(_current_menu),(c:main@last_menu_state)
	line	520
	
l16237:
	movlb	5	; () banked
	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfsc	status,2
	goto	u22181
	goto	u22180

u22181:
	goto	l16241
u22180:
	line	522
	
l16239:; BSR set to: 5

	decf	((main@encoder_activity_timer))&0ffh
	btfss	status,0
	decf	((main@encoder_activity_timer+1))&0ffh
	line	526
	
l16241:; BSR set to: 5

	movlw	low(01h)
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	527
	
l16243:; BSR set to: 5

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	iorwf	((main@blink_timer+1))&0ffh,w
	bnz	u22190
	movlw	10
	subwf	 ((main@blink_timer))&0ffh,w
	btfss	status,0
	goto	u22191
	goto	u22190

u22191:
	goto	l16279
u22190:
	line	529
	
l16245:; BSR set to: 5

	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	530
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22201
	goto	u22200
u22201:
	goto	l16277
u22200:
	line	533
	
l16247:; BSR set to: 5

	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfss	status,2
	goto	u22211
	goto	u22210

u22211:
	goto	l16279
u22210:
	line	535
	
l16249:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u22221
	goto	u22220
u22221:
	movlw	1
	goto	u22230
u22220:
	movlw	0
u22230:
	movwf	(0+(_menu+05h))&0ffh
	line	539
	goto	l16275
	line	542
	
l16251:; BSR set to: 4

	call	_menu_draw_options	;wreg free
	line	543
	goto	l16279
	line	547
	
l16253:; BSR set to: 4

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
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u22241
	goto	u22240
u22241:
	goto	l16257
u22240:
	line	549
	
l16255:
	call	_menu_update_numeric_value	;wreg free
	line	550
	goto	l16279
	line	551
	
l16257:
	movlb	4	; () banked
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
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u22251
	goto	u22250
u22251:
	goto	l16261
u22250:
	line	553
	
l16259:
	call	_menu_update_time_value	;wreg free
	line	554
	goto	l16279
	line	558
	
l16261:
	call	_menu_draw_input	;wreg free
	goto	l16279
	line	563
	
l16263:; BSR set to: 4

	call	_menu_draw_setup	;wreg free
	line	564
	goto	l16279
	line	566
	
l16265:; BSR set to: 4

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22261
	goto	u22260

u22261:
	goto	l16269
u22260:
	goto	l16259
	line	572
	
l16269:; BSR set to: 5

	call	_menu_draw_clock	;wreg free
	goto	l16279
	line	576
	
l16271:; BSR set to: 4

	call	_menu_draw_utility	;wreg free
	line	577
	goto	l16279
	line	539
	
l16275:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_menu))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l16251
	xorlw	1^0	; case 1
	skipnz
	goto	l16253
	xorlw	2^1	; case 2
	skipnz
	goto	l16263
	xorlw	3^2	; case 3
	skipnz
	goto	l16265
	xorlw	4^3	; case 4
	skipnz
	goto	l16271
	goto	l16279

	line	583
	
l16277:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	597
	
l16279:
		movlw	05h-0
	movlb	4	; () banked
	cpfslt	((_current_menu))&0ffh
	goto	u22271
	goto	u22270

u22271:
	goto	l16313
u22270:
	line	599
	
l16281:; BSR set to: 4

	movf	((c:_menu_timeout_flag))^00h,c,w	;volatile
	btfss	status,2
	goto	u22281
	goto	u22280
u22281:
	goto	l16313
u22280:
	line	601
	
l16283:; BSR set to: 4

		movlw	low(STR_36)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_36)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	604
	
l16285:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	605
	
l16287:
	asmopt push
asmopt off
movlw  3
	movlb	3	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	8
movwf	(??_main+0+0)&0ffh
	movlw	119
u22347:
decfsz	wreg,f
	bra	u22347
	decfsz	(??_main+0+0)&0ffh,f
	bra	u22347
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u22347
asmopt pop

	line	606
	
l16289:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	609
	
l16291:
	movlb	4	; () banked
	setf	((_current_menu))&0ffh
	line	610
	
l16293:; BSR set to: 4

	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	611
	
l16295:; BSR set to: 5

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	612
	
l16297:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	615
	
l16299:; BSR set to: 5

	call	_lcd_clear	;wreg free
	line	616
	
l16301:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	617
	
l16303:
		movlw	low(STR_37)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_37)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	618
	
l16305:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	619
	
l16307:
		movlw	low(STR_38)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_38)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	622
	
l16309:
	movlw	low(01h)
	movwf	((c:_menu_timeout_flag))^00h,c	;volatile
	line	623
	
l16311:
	movlw	high(0)
	movwf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_menu_timeout_timer))^00h,c	;volatile
	line	628
	
l16313:
	movlb	3	; () banked
	movf	((_long_press_beep_flag))&0ffh,w	;volatile
	btfsc	status,2
	goto	u22291
	goto	u22290
u22291:
	goto	l16321
u22290:
	line	630
	
l16315:; BSR set to: 3

	movlw	low(0)
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	line	631
	
l16317:; BSR set to: 3

	movlw	high(01F4h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01F4h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	632
	
l16319:
		movlw	low(STR_39)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_39)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	637
	
l16321:
	movf	((c:_save_pending))^00h,c,w
	btfsc	status,2
	goto	u22301
	goto	u22300
u22301:
	goto	l16333
u22300:
	
l16323:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u22311
	goto	u22310
u22311:
	goto	l16333
u22310:
	line	639
	
l16325:; BSR set to: 5

		movlw	low(STR_40)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_40)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	640
	
l16327:
	call	_save_current_config	;wreg free
	line	641
	
l16329:
	movlw	low(0)
	movwf	((c:_save_pending))^00h,c
	line	642
	
l16331:
		movlw	low(STR_41)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_41)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	647
	
l16333:
	asmopt push
asmopt off
	movlw	133
u22357:
decfsz	wreg,f
	bra	u22357
	nop
asmopt pop

	goto	l16073
	global	start
	goto	start
	callstack 0
	line	649
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
	
l14331:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	56
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	58
	
l14333:
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
	
l14335:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	92
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	95
	
l139:
	line	94
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u19101
	goto	u19100
u19101:
	goto	l139
u19100:
	line	97
	
l14337:
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
	
l14339:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	104
	
l14341:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	106
	
l14343:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	107
	
l14345:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	108
	
l14347:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	109
	
l14349:
	bsf	((c:3987))^0f00h,c,0	;volatile
	line	110
	
l14351:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	112
	
l14353:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	113
	
l14355:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	116
	
l14357:
	bcf	((c:3988))^0f00h,c,1	;volatile
	line	117
	
l14359:
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
	
l14429:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19181
	goto	u19180
u19181:
	goto	l14435
u19180:
	line	27
	
l14431:
	movlw	(01h)&0ffh
	goto	l1693
	line	28
	
l14435:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19191
	goto	u19190
u19191:
	goto	l14441
u19190:
	goto	l14431
	line	30
	
l14441:
	movf	((c:rtc_read_register@reg))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19201
	goto	u19200
u19201:
	goto	l14447
u19200:
	goto	l14431
	line	33
	
l14447:
	call	_i2c_restart	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19211
	goto	u19210
u19211:
	goto	l14453
u19210:
	goto	l14431
	line	35
	
l14453:
	movlw	(0D1h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19221
	goto	u19220
u19221:
	goto	l14459
u19220:
	goto	l14431
	line	37
	
l14459:
	movlw	(0)&0ffh
	
	call	_i2c_read
	movff	(c:rtc_read_register@value),fsr2l
	movff	(c:rtc_read_register@value+1),fsr2h
	movwf	indf2,c

	line	38
	
l14461:
	call	_i2c_stop	;wreg free
	line	39
	
l14463:
	movlw	(0)&0ffh
	line	40
	
l1693:
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
	
l14283:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19031
	goto	u19030
u19031:
	goto	l1633
u19030:
	line	82
	
l14285:
	movlw	(01h)&0ffh
	goto	l1634
	
l1633:
	line	84
	bsf	((c:4037))^0f00h,c,1	;volatile
	line	86
	
l14289:
	movlw	high(03E8h)
	movwf	((c:i2c_restart@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_restart@timeout))^00h,c
	line	87
	goto	l1635
	line	89
	
l14291:
	decf	((c:i2c_restart@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_restart@timeout+1))^00h,c
	movf	((c:i2c_restart@timeout))^00h,c,w
iorwf	((c:i2c_restart@timeout+1))^00h,c,w
	btfss	status,2
	goto	u19041
	goto	u19040

u19041:
	goto	l1635
u19040:
	goto	l14285
	line	91
	
l1635:
	line	87
	btfsc	((c:4037))^0f00h,c,1	;volatile
	goto	u19051
	goto	u19050
u19051:
	goto	l14291
u19050:
	line	93
	
l14297:
	movlw	(0)&0ffh
	line	94
	
l1634:
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
	
l14417:
	asmopt push
asmopt off
movlw  21
movwf	(??_rtc_init+0+0+1)^00h,c
movlw	75
movwf	(??_rtc_init+0+0)^00h,c
	movlw	190
u22367:
decfsz	wreg,f
	bra	u22367
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u22367
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u22367
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
u22377:
decfsz	wreg,f
	bra	u22377
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u22377
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u22377
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
u22387:
decfsz	wreg,f
	bra	u22387
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u22387
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u22387
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
u22397:
decfsz	wreg,f
	bra	u22397
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u22397
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u22397
	nop2
asmopt pop

	line	54
	
l14419:
	movlw	low(0)
	movwf	((c:rtc_write_register@value))^00h,c
	movlw	(0Eh)&0ffh
	
	call	_rtc_write_register
	iorlw	0
	btfsc	status,2
	goto	u19171
	goto	u19170
u19171:
	goto	l14425
u19170:
	line	56
	
l14421:
	movlw	(01h)&0ffh
	goto	l1701
	line	59
	
l14425:
	movlw	(0)&0ffh
	line	60
	
l1701:
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
	
l14301:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19061
	goto	u19060
u19061:
	goto	l14307
u19060:
	line	12
	
l14303:
	movlw	(01h)&0ffh
	goto	l1686
	line	13
	
l14307:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19071
	goto	u19070
u19071:
	goto	l14313
u19070:
	goto	l14303
	line	15
	
l14313:
	movf	((c:rtc_write_register@reg))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19081
	goto	u19080
u19081:
	goto	l14319
u19080:
	goto	l14303
	line	17
	
l14319:
	movf	((c:rtc_write_register@value))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19091
	goto	u19090
u19091:
	goto	l14325
u19090:
	goto	l14303
	line	19
	
l14325:
	call	_i2c_stop	;wreg free
	line	20
	
l14327:
	movlw	(0)&0ffh
	line	21
	
l1686:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rtc_write_register
	__end_of_rtc_write_register:
	signat	_rtc_write_register,8313
	global	_menu_update_numeric_value

;; *************** function _menu_update_numeric_value *****************
;; Defined at:
;;		line 1281 in file "src\menu.c"
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
;;		On entry : 0/4
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
	line	1281
global __ptext7
__ptext7:
psect	text7
	file	"src\menu.c"
	line	1281
	
_menu_update_numeric_value:
;incstack = 0
	callstack 25
	line	1284
	
l14973:
	movlb	4	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20001
	goto	u20000

u20001:
	goto	l907
u20000:
	
l14975:; BSR set to: 4

	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u20011
	goto	u20010
u20011:
	goto	l14977
u20010:
	goto	l907
	line	1288
	
l14977:; BSR set to: 5

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((c:menu_update_numeric_value@screen_line))^00h,c
	line	1289
		movlw	03h-1
	cpfsgt	((c:menu_update_numeric_value@screen_line))^00h,c
	goto	u20021
	goto	u20020

u20021:
	goto	l14981
u20020:
	goto	l907
	line	1294
	
l14981:; BSR set to: 5

	movlb	4	; () banked
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
	line	1295
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
	line	1298
	
l14983:; BSR set to: 4

	movff	(c:menu_update_numeric_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(c:menu_update_numeric_value@flow_type),(c:is_numeric_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u20031
	goto	u20030
u20031:
	goto	l14987
u20030:
	goto	l907
	line	1302
	
l14987:
	lfsr	2,(menu_update_numeric_value@value_buf)
	movlw	6-1
u20041:
	clrf	postinc2
	decf	wreg
	bc	u20041
	line	1304
	
l14989:
	movlb	5	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u20051
	goto	u20050
u20051:
	goto	l15021
u20050:
	line	1307
	
l14991:; BSR set to: 5

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20061
	goto	u20060

u20061:
	goto	l14995
u20060:
	
l14993:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20071
	goto	u20070
u20071:
	goto	l14997
u20070:
	
l14995:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1469))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1469))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1469))^00h,c
	goto	l14999
	
l14997:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1469+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1469))^00h,c
	
l14999:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1469),(c:menu_update_numeric_value@value_buf)
	line	1308
	
l15001:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20081
	goto	u20080

u20081:
	goto	l15005
u20080:
	
l15003:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20091
	goto	u20090
u20091:
	goto	l15007
u20090:
	
l15005:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1470))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1470))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1470))^00h,c
	goto	l15009
	
l15007:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1470+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1470))^00h,c
	
l15009:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1470),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1309
	
l15011:; BSR set to: 5

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20101
	goto	u20100

u20101:
	goto	l15015
u20100:
	
l15013:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20111
	goto	u20110
u20111:
	goto	l15017
u20110:
	
l15015:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1471))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1471))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1471))^00h,c
	goto	l15019
	
l15017:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1471+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1471))^00h,c
	
l15019:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1471),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1310
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+03h))^00h,c
	line	1311
	goto	l933
	line	1315
	
l15021:; BSR set to: 5

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20121
	goto	u20120
u20121:
	goto	l15025
u20120:
	
l15023:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20131
	goto	u20130
u20131:
	goto	l15033
u20130:
	
l15025:; BSR set to: 5

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u20141
	goto	u20140
u20141:
	goto	l15029
u20140:
	
l15027:; BSR set to: 5

	movlw	high(02Bh)
	movwf	((c:_menu_update_numeric_value$1473+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_menu_update_numeric_value$1473))^00h,c
	goto	l15031
	
l15029:; BSR set to: 5

	movlw	high(02Dh)
	movwf	((c:_menu_update_numeric_value$1473+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_menu_update_numeric_value$1473))^00h,c
	
l15031:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1473),(c:_menu_update_numeric_value$1472)
	movff	(c:_menu_update_numeric_value$1473+1),(c:_menu_update_numeric_value$1472+1)
	goto	l15035
	
l15033:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1472+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1472))^00h,c
	
l15035:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1472),(c:menu_update_numeric_value@value_buf)
	line	1316
	
l15037:; BSR set to: 5

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20151
	goto	u20150

u20151:
	goto	l15041
u20150:
	
l15039:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20161
	goto	u20160
u20161:
	goto	l15043
u20160:
	
l15041:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1474))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1474))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1474))^00h,c
	goto	l15045
	
l15043:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1474+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1474))^00h,c
	
l15045:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1474),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1317
	
l15047:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20171
	goto	u20170

u20171:
	goto	l15051
u20170:
	
l15049:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20181
	goto	u20180
u20181:
	goto	l15053
u20180:
	
l15051:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1475))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1475))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1475))^00h,c
	goto	l15055
	
l15053:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1475+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1475))^00h,c
	
l15055:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1475),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1318
	
l15057:; BSR set to: 5

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20191
	goto	u20190

u20191:
	goto	l15061
u20190:
	
l15059:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20201
	goto	u20200
u20201:
	goto	l15063
u20200:
	
l15061:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1476))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1476))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1476))^00h,c
	goto	l15065
	
l15063:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1476+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1476))^00h,c
	
l15065:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1476),0+((c:menu_update_numeric_value@value_buf)+03h)
	line	1319
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+04h))^00h,c
	line	1320
	
l933:; BSR set to: 5

	line	1323
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u20211
	goto	u20210
u20211:
	goto	l15069
u20210:
	
l15067:; BSR set to: 5

	movlw	high(0Eh)
	movwf	((c:_menu_update_numeric_value$1478+1))^00h,c
	movlw	low(0Eh)
	movwf	((c:_menu_update_numeric_value$1478))^00h,c
	goto	l15071
	
l15069:; BSR set to: 5

	movlw	high(0Fh)
	movwf	((c:_menu_update_numeric_value$1478+1))^00h,c
	movlw	low(0Fh)
	movwf	((c:_menu_update_numeric_value$1478))^00h,c
	
l15071:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1478),(c:menu_update_numeric_value@start_col)
	line	1325
	
l15073:; BSR set to: 5

	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1326
	
l15075:
		movlw	low(STR_229)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_229)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1328
	
l15077:
	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1329
	
l15079:
		movlw	low(STR_230)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_230)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1330
	
l15081:
		movlw	low(menu_update_numeric_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1331
	
l15083:
		movlw	low(STR_231)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_231)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1332
	
l907:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_numeric_value
	__end_of_menu_update_numeric_value:
	signat	_menu_update_numeric_value,89
	global	_menu_update_edit_value

;; *************** function _menu_update_edit_value *****************
;; Defined at:
;;		line 1217 in file "src\menu.c"
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
;;		On entry : 0/4
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
	line	1217
global __ptext8
__ptext8:
psect	text8
	file	"src\menu.c"
	line	1217
	
_menu_update_edit_value:
;incstack = 0
	callstack 25
	line	1221
	
l15085:
	movlb	4	; () banked
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
	line	1222
	movlb	4	; () banked
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
	line	1225
	
l15087:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u20221
	goto	u20220
u20221:
	goto	l885
u20220:
	
l15089:; BSR set to: 5

	movlb	4	; () banked
		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u20231
	goto	u20230

u20231:
	goto	l15091
u20230:
	goto	l885
	line	1229
	
l15091:; BSR set to: 4

	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@screen_line))&0ffh
	line	1230
		movlw	03h-1
	cpfsgt	((menu_update_edit_value@screen_line))&0ffh
	goto	u20241
	goto	u20240

u20241:
	goto	l15095
u20240:
	goto	l885
	line	1234
	
l15095:; BSR set to: 0

	movff	(menu_update_edit_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_update_edit_value@flow_type),(c:is_numeric_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u20251
	goto	u20250
u20251:
	goto	l15099
u20250:
	goto	l885
	line	1239
	
l15099:
	movlb	5	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u20261
	goto	u20260
u20261:
	goto	l15103
u20260:
	line	1241
	
l15101:; BSR set to: 5

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
	line	1242
	goto	l15111
	line	1247
	
l15103:; BSR set to: 5

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u20271
	goto	u20270
u20271:
	goto	l15107
u20270:
	
l15105:; BSR set to: 5

	movlw	high(02Bh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1454+1))&0ffh
	movlw	low(02Bh)
	movwf	((_menu_update_edit_value$1454))&0ffh
	goto	l15109
	
l15107:; BSR set to: 5

	movlw	high(02Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1454+1))&0ffh
	movlw	low(02Dh)
	movwf	((_menu_update_edit_value$1454))&0ffh
	
l15109:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_225)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_225)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu_update_edit_value$1454),0+((c:?_sprintf)+04h)
	movff	(_menu_update_edit_value$1454+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+0Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	call	_sprintf	;wreg free
	line	1252
	
l15111:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@from))^00h,c
	clrf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1254
	
l15113:
	movlb	5	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u20281
	goto	u20280
u20281:
	goto	l15123
u20280:
	line	1257
	
l15115:; BSR set to: 5

	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u20291
	goto	u20290
u20291:
	goto	l895
u20290:
	line	1258
	
l15117:; BSR set to: 5

	decf	(0+(_menu+08h))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@blink_pos))&0ffh
	goto	l15119
	line	1259
	
l895:; BSR set to: 5

	line	1260
	movff	0+(_menu+08h),(menu_update_edit_value@blink_pos)
	line	1262
	
l15119:
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
	goto	u20301
	goto	u20300

u20301:
	goto	l15123
u20300:
	line	1263
	
l15121:; BSR set to: 0

	movf	((menu_update_edit_value@blink_pos))&0ffh,w
	addlw	low(menu_update_edit_value@display_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1267
	
l15123:
	movlb	5	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u20311
	goto	u20310
u20311:
	goto	l15127
u20310:
	
l15125:; BSR set to: 5

	movlw	high(0Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1458+1))&0ffh
	movlw	low(0Dh)
	movwf	((_menu_update_edit_value$1458))&0ffh
	goto	l15129
	
l15127:; BSR set to: 5

	movlw	high(0Eh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1458+1))&0ffh
	movlw	low(0Eh)
	movwf	((_menu_update_edit_value$1458))&0ffh
	
l15129:; BSR set to: 0

	movff	(_menu_update_edit_value$1458),(menu_update_edit_value@start_col)
	line	1268
	
l15131:; BSR set to: 0

	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	1269
	
l15133:
		movlw	low(STR_226)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_226)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1271
	
l15135:
	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	movlb	0	; () banked
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	1272
	
l15137:
		movlw	low(STR_227)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_227)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1273
	
l15139:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1274
	
l15141:
		movlw	low(STR_228)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_228)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1275
	
l885:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_edit_value
	__end_of_menu_update_edit_value:
	signat	_menu_update_edit_value,89
	global	_menu_init

;; *************** function _menu_init *****************
;; Defined at:
;;		line 902 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
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
psect	text9,class=CODE,space=0,reloc=2,group=0
	line	902
global __ptext9
__ptext9:
psect	text9
	file	"src\menu.c"
	line	902
	
_menu_init:
;incstack = 0
	callstack 28
	line	904
	
l14541:; BSR set to: 5

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	905
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	906
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	907
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	908
	movlw	low(0)
	movwf	(0+(_menu+05h))&0ffh
	line	909
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	910
	
l732:; BSR set to: 5

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_init
	__end_of_menu_init:
	signat	_menu_init,89
	global	_menu_handle_encoder

;; *************** function _menu_handle_encoder *****************
;; Defined at:
;;		line 1870 in file "src\menu.c"
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
;;		On entry : 0/4
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
	line	1870
global __ptext10
__ptext10:
psect	text10
	file	"src\menu.c"
	line	1870
	
_menu_handle_encoder:; BSR set to: 5

;incstack = 0
	callstack 22
	line	1875
	
l14669:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u19291
	goto	u19290
u19291:
	goto	l14791
u19290:
	line	1877
	
l14671:; BSR set to: 5

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u19301
	goto	u19300

u19301:
	goto	l1157
u19300:
	line	1880
	
l14673:; BSR set to: 5

		movlw	3
	movlb	4	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19311
	goto	u19310

u19311:
	goto	l14735
u19310:
	line	1883
	
l14675:; BSR set to: 4

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
	line	1884
	
l14677:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1887
	
l14679:
		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19321
	goto	u19320

u19321:
	goto	l14685
u19320:
	line	1890
	
l14681:; BSR set to: 5

	movf	((c:menu_handle_encoder@delta))^00h,c,w
	
	call	_handle_time_rotation
	line	1891
	call	_menu_update_time_value	;wreg free
	goto	l1157
	line	1892
	
l14683:
	goto	l1157
	line	1895
	
l14685:; BSR set to: 5

		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1896
		movlw	low(0)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1898
	
l14687:; BSR set to: 1

	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19331
	goto	u19330
u19331:
	goto	l14691
u19330:
	line	1900
	
l14689:; BSR set to: 5

		movlw	low(_menu_item_options)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1901
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1902
	goto	l1159
	line	1903
	
l14691:; BSR set to: 5

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19341
	goto	u19340

u19341:
	goto	l14695
u19340:
	line	1905
	
l14693:; BSR set to: 5

		movlw	low(_menu_item_options+048h)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1906
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1907
	goto	l1159
	line	1908
	
l14695:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19351
	goto	u19350

u19351:
	goto	l1159
u19350:
	line	1910
	
l14697:; BSR set to: 5

		movlw	low(_menu_item_options+03Ch)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1911
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1914
	
l1159:
	movlb	1	; () banked
	movf	((menu_handle_encoder@clock_opts))&0ffh,w
iorwf	((menu_handle_encoder@clock_opts+1))&0ffh,w
	btfsc	status,2
	goto	u19361
	goto	u19360

u19361:
	goto	l1157
u19360:
	
l14699:; BSR set to: 1

	movf	((menu_handle_encoder@clock_flag))&0ffh,w
iorwf	((menu_handle_encoder@clock_flag+1))&0ffh,w
	btfsc	status,2
	goto	u19371
	goto	u19370

u19371:
	goto	l1157
u19370:
	line	1916
	
l14701:; BSR set to: 1

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
	line	1917
	
l14703:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1919
	
l14705:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u19381
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u19380
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u19381
	goto	u19380

u19381:
	goto	l14713
u19380:
	line	1921
	
l14707:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	incf	indf2

	line	1922
	
l14709:
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
	goto	u19391
	goto	u19390

u19391:
	goto	l14721
u19390:
	line	1923
	
l14711:; BSR set to: 0

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	goto	l14721
	line	1925
	
l14713:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u19400
	goto	u19401

u19401:
	goto	l14721
u19400:
	line	1927
	
l14715:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u19411
	goto	u19410
u19411:
	goto	l14719
u19410:
	line	1928
	
l14717:
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

	goto	l14721
	line	1930
	
l14719:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	decf	indf2

	line	1934
	
l14721:
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
	goto	u19421
	goto	u19420

u19421:
	goto	l14725
u19420:
	line	1935
	
l14723:; BSR set to: 0

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	line	1937
	
l14725:; BSR set to: 0

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
	line	1938
	
l14727:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1941
	
l14729:
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
	line	1942
	
l14731:
	call	_menu_draw_clock	;wreg free
	goto	l1157
	line	1949
	
l14735:; BSR set to: 4

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
	line	1950
	movlb	4	; () banked
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
	line	1953
	
l14737:; BSR set to: 1

	movff	(menu_handle_encoder@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_option_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u19431
	goto	u19430
u19431:
	goto	l14769
u19430:
	line	1955
	
l14739:
	movff	(menu_handle_encoder@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_encoder@edit_flag)
	movff	1+?_get_option_edit_flag,(menu_handle_encoder@edit_flag+1)
	line	1956
	movff	(menu_handle_encoder@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_encoder@opts)
	movff	1+?_get_item_options_for_field,(menu_handle_encoder@opts+1)
	line	1958
	
l14741:
	movlb	1	; () banked
	movf	((menu_handle_encoder@edit_flag))&0ffh,w
iorwf	((menu_handle_encoder@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u19441
	goto	u19440

u19441:
	goto	l1157
u19440:
	
l14743:; BSR set to: 1

	movf	((menu_handle_encoder@opts))&0ffh,w
iorwf	((menu_handle_encoder@opts+1))&0ffh,w
	btfsc	status,2
	goto	u19451
	goto	u19450

u19451:
	goto	l1157
u19450:
	line	1960
	
l14745:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u19461
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u19460
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u19461
	goto	u19460

u19461:
	goto	l14753
u19460:
	line	1962
	
l14747:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	incf	indf2

	line	1963
	
l14749:; BSR set to: 1

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
	goto	u19471
	goto	u19470

u19471:
	goto	l14761
u19470:
	line	1964
	
l14751:; BSR set to: 0

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	goto	l14761
	line	1966
	
l14753:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u19480
	goto	u19481

u19481:
	goto	l14761
u19480:
	line	1968
	
l14755:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u19491
	goto	u19490
u19491:
	goto	l14759
u19490:
	line	1969
	
l14757:; BSR set to: 1

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

	goto	l14761
	line	1971
	
l14759:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	decf	indf2

	line	1975
	
l14761:
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
	goto	u19501
	goto	u19500

u19501:
	goto	l14765
u19500:
	line	1976
	
l14763:; BSR set to: 0

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	line	1979
	
l14765:; BSR set to: 0

	movlb	4	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19511
	goto	u19510

u19511:
	goto	l14683
u19510:
	line	1981
	
l14767:; BSR set to: 4

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
	line	1982
	call	_menu_draw_input	;wreg free
	goto	l1157
	line	1986
	
l14769:
	movff	(menu_handle_encoder@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_numeric_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u19521
	goto	u19520
u19521:
	goto	l14779
u19520:
	line	1988
	
l14771:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u19530
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u19531
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u19531
	goto	u19530

u19531:
	goto	l14775
u19530:
	
l14773:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1661))&0ffh
	setf	((_menu_handle_encoder$1661+1))&0ffh
	goto	l14777
	
l14775:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1661+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1661))&0ffh
	
l14777:; BSR set to: 1

	movf	((_menu_handle_encoder$1661))&0ffh,w
	
	call	_handle_numeric_rotation
	line	1989
	goto	l1157
	line	1990
	
l14779:
	movff	(menu_handle_encoder@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_time_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u19541
	goto	u19540
u19541:
	goto	l14683
u19540:
	line	1992
	
l14781:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u19550
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u19551
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u19551
	goto	u19550

u19551:
	goto	l14785
u19550:
	
l14783:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1662))&0ffh
	setf	((_menu_handle_encoder$1662+1))&0ffh
	goto	l14787
	
l14785:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1662+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1662))&0ffh
	
l14787:; BSR set to: 1

	movf	((_menu_handle_encoder$1662))&0ffh,w
	
	call	_handle_time_rotation
	goto	l1157
	line	1999
	
l14791:; BSR set to: 5

		movlw	4
	movlb	4	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19561
	goto	u19560

u19561:
	goto	l14817
u19560:
	
l14793:; BSR set to: 4

	movlb	5	; () banked
	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u19571
	goto	u19570
u19571:
	goto	l14817
u19570:
	
l14795:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u19581
	goto	u19580
u19581:
	goto	l14817
u19580:
	
l14797:; BSR set to: 5

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u19591
	goto	u19590

u19591:
	goto	l14817
u19590:
	line	2001
	
l14799:; BSR set to: 5

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u19601
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u19600
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u19601
	goto	u19600

u19601:
	goto	l14807
u19600:
	line	2003
	
l14801:; BSR set to: 5

	incf	(0+(_menu+01Ch))&0ffh
	line	2004
	
l14803:; BSR set to: 5

		movlw	03h-1
	cpfsgt	(0+(_menu+01Ch))&0ffh
	goto	u19611
	goto	u19610

u19611:
	goto	l14813
u19610:
	line	2005
	
l14805:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Ch))&0ffh
	goto	l14813
	line	2009
	
l14807:; BSR set to: 5

	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u19621
	goto	u19620
u19621:
	goto	l14811
u19620:
	line	2010
	
l14809:; BSR set to: 5

	movlw	low(02h)
	movwf	(0+(_menu+01Ch))&0ffh
	goto	l14813
	line	2012
	
l14811:; BSR set to: 5

	decf	(0+(_menu+01Ch))&0ffh
	line	2014
	
l14813:
	call	_menu_draw_utility	;wreg free
	goto	l1157
	line	2019
	
l14817:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u19631
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u19630
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u19631
	goto	u19630

u19631:
	goto	l14835
u19630:
	line	2023
	
l14819:
		movlw	low(menu_handle_encoder@buf_1663)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1663)
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
	line	2024
	
l14821:
		movlw	low(menu_handle_encoder@buf_1663)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1663)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2027
	
l14823:
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
	goto	u19641
	goto	u19640

u19641:
	goto	l14831
u19640:
	line	2029
	
l14825:; BSR set to: 0

	movlb	5	; () banked
	incf	((_menu))&0ffh
	line	2032
	
l14827:; BSR set to: 5

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
	goto	u19651
	goto	u19650

u19651:
	goto	l14831
u19650:
	line	2034
	
l14829:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+01h))&0ffh
	line	2038
	
l14831:
		movlw	low(menu_handle_encoder@buf_1663)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1663)
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
	line	2039
	
l14833:
		movlw	low(menu_handle_encoder@buf_1663)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1663)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2040
	goto	l14853
	line	2041
	
l14835:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u19660
	goto	u19661

u19661:
	goto	l14853
u19660:
	line	2045
	
l14837:
		movlw	low(menu_handle_encoder@buf_1666)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1666)
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
	line	2046
	
l14839:
		movlw	low(menu_handle_encoder@buf_1666)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1666)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2049
	
l14841:
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u19671
	goto	u19670
u19671:
	goto	l14849
u19670:
	line	2051
	
l14843:; BSR set to: 5

	decf	((_menu))&0ffh
	line	2054
	
l14845:; BSR set to: 5

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u19681
	goto	u19680

u19681:
	goto	l14849
u19680:
	line	2056
	
l14847:; BSR set to: 5

	decf	(0+(_menu+01h))&0ffh
	line	2060
	
l14849:; BSR set to: 5

		movlw	low(menu_handle_encoder@buf_1666)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1666)
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
	line	2061
	
l14851:
		movlw	low(menu_handle_encoder@buf_1666)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1666)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2065
	
l14853:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u19691
	goto	u19690
u19691:
	goto	l1157
u19690:
	line	2067
	
l14855:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19701
	goto	u19700
u19701:
	goto	l14859
u19700:
	line	2068
	
l14857:; BSR set to: 4

	call	_menu_draw_options	;wreg free
	goto	l1157
	line	2069
	
l14859:; BSR set to: 4

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19711
	goto	u19710

u19711:
	goto	l14863
u19710:
	line	2070
	
l14861:; BSR set to: 4

	call	_menu_draw_input	;wreg free
	goto	l1157
	line	2071
	
l14863:; BSR set to: 4

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19721
	goto	u19720

u19721:
	goto	l14867
u19720:
	line	2072
	
l14865:; BSR set to: 4

	call	_menu_draw_setup	;wreg free
	goto	l1157
	line	2073
	
l14867:; BSR set to: 4

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19731
	goto	u19730

u19731:
	goto	l14871
u19730:
	goto	l14731
	line	2075
	
l14871:; BSR set to: 4

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19741
	goto	u19740

u19741:
	goto	l14683
u19740:
	goto	l14813
	line	2078
	
l1157:
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
;;		On entry : 39/3
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
	
l13261:
		movlw	low(STR_139)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_139)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	480
	
l13263:
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
	
l13265:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	483
	
l13267:
	movlb	5	; () banked
	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u17691
	goto	u17690
u17691:
	goto	l13309
u17690:
	line	485
	
l13269:; BSR set to: 5

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u17701
	goto	u17700

u17701:
	goto	l13291
u17700:
	line	487
	
l13271:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+012h))&0ffh
	line	489
	
l13273:; BSR set to: 5

		movlw	3
	movlb	4	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17711
	goto	u17710

u17711:
	goto	l13281
u17710:
	
l13275:; BSR set to: 4

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17721
	goto	u17720

u17721:
	goto	l13281
u17720:
	
l13277:; BSR set to: 5

		movlw	03h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u17731
	goto	u17730

u17731:
	goto	l13281
u17730:
	line	490
	
l13279:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+012h))&0ffh
	goto	l13335
	line	491
	
l13281:
		movlw	2
	movlb	5	; () banked
	xorwf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u17741
	goto	u17740

u17741:
	goto	l13287
u17740:
	
l13283:; BSR set to: 5

		movlw	018h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u17751
	goto	u17750

u17751:
	goto	l13287
u17750:
	goto	l13279
	line	493
	
l13287:; BSR set to: 5

		movlw	064h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u17761
	goto	u17760

u17761:
	goto	l613
u17760:
	goto	l13279
	line	498
	
l13291:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u17771
	goto	u17770
u17771:
	goto	l13307
u17770:
	line	501
	
l13293:; BSR set to: 5

		movlw	3
	movlb	4	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17781
	goto	u17780

u17781:
	goto	l13299
u17780:
	
l13295:; BSR set to: 4

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17791
	goto	u17790

u17791:
	goto	l13299
u17790:
	line	502
	
l13297:; BSR set to: 5

	movlw	low(02h)
	movwf	(0+(_menu+012h))&0ffh
	goto	l13335
	line	504
	
l13299:
		movlw	2
	movlb	5	; () banked
	xorwf	(0+(_menu+010h))&0ffh,w
	btfsc	status,2
	goto	u17801
	goto	u17800

u17801:
	goto	l13303
u17800:
	
l13301:; BSR set to: 5

	movlw	high(063h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1273+1))&0ffh
	movlw	low(063h)
	movwf	((_handle_time_rotation$1273))&0ffh
	goto	l13305
	
l13303:; BSR set to: 5

	movlw	high(017h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1273+1))&0ffh
	movlw	low(017h)
	movwf	((_handle_time_rotation$1273))&0ffh
	
l13305:; BSR set to: 0

	movff	(_handle_time_rotation$1273),0+(_menu+012h)
	goto	l13335
	line	508
	
l13307:; BSR set to: 5

	decf	(0+(_menu+012h))&0ffh
	goto	l13335
	line	510
	
l613:; BSR set to: 5

	line	511
	goto	l13335
	line	512
	
l13309:; BSR set to: 5

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u17811
	goto	u17810

u17811:
	goto	l13335
u17810:
	line	515
	
l13311:; BSR set to: 5

		movlw	3
	movlb	4	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17821
	goto	u17820

u17821:
	goto	l13321
u17820:
	
l13313:; BSR set to: 4

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17831
	goto	u17830

u17831:
	goto	l13321
u17830:
	
l13315:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u17841
	goto	u17840

u17841:
	goto	l13321
u17840:
	line	518
	
l13317:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l625
	line	522
	
l13321:
	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u17851
	goto	u17850

u17851:
	goto	l13329
u17850:
	line	524
	
l13323:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+013h))&0ffh
	line	525
	
l13325:; BSR set to: 5

		movlw	03Ch-1
	cpfsgt	(0+(_menu+013h))&0ffh
	goto	u17861
	goto	u17860

u17861:
	goto	l13335
u17860:
	line	526
	
l13327:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l13335
	line	530
	
l13329:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	btfss	status,2
	goto	u17871
	goto	u17870
u17871:
	goto	l13333
u17870:
	line	531
	
l13331:; BSR set to: 5

	movlw	low(03Bh)
	movwf	(0+(_menu+013h))&0ffh
	goto	l13335
	line	533
	
l13333:; BSR set to: 5

	decf	(0+(_menu+013h))&0ffh
	line	537
	
l13335:
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
	
l13337:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	539
	
l625:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_time_rotation
	__end_of_handle_time_rotation:
	signat	_handle_time_rotation,4217
	global	_handle_numeric_rotation

;; *************** function _handle_numeric_rotation *****************
;; Defined at:
;;		line 1130 in file "src\menu.c"
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
;;		On entry : 3D/3
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
	line	1130
global __ptext12
__ptext12:
psect	text12
	file	"src\menu.c"
	line	1130
	
_handle_numeric_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_numeric_rotation@direction))&0ffh
	line	1132
	
l13159:
		movlw	low(STR_222)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_222)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1135
	
l13161:
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
	line	1136
	
l13163:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1139
	
l13165:
	movlb	5	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u17451
	goto	u17450
u17451:
	goto	l13259
u17450:
	
l13167:; BSR set to: 5

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u17461
	goto	u17460
u17461:
	goto	l13259
u17460:
	line	1141
	
l13169:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+08h))&0ffh
	goto	l13259
	line	1147
	
l13171:; BSR set to: 5

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u17471
	goto	u17470
u17471:
	goto	l877
u17470:
	
l13173:; BSR set to: 5

	movlb	0	; () banked
	movf	((handle_numeric_rotation@direction))&0ffh,w
	btfsc	status,2
	goto	u17481
	goto	u17480
u17481:
	goto	l877
u17480:
	line	1149
	
l13175:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u17491
	goto	u17490
u17491:
	movlw	1
	goto	u17500
u17490:
	movlw	0
u17500:
	movwf	(0+(_menu+09h))&0ffh
	goto	l877
	line	1154
	
l13177:; BSR set to: 5

	movlb	0	; () banked
		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u17511
	goto	u17510

u17511:
	goto	l13185
u17510:
	line	1156
	
l13179:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+0Ah))&0ffh
	line	1157
	
l13181:; BSR set to: 5

		movlw	06h-1
	cpfsgt	(0+(_menu+0Ah))&0ffh
	goto	u17521
	goto	u17520

u17521:
	goto	l877
u17520:
	line	1158
	
l13183:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l877
	line	1160
	
l13185:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u17530
	goto	u17531

u17531:
	goto	l877
u17530:
	line	1162
	
l13187:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u17541
	goto	u17540
u17541:
	goto	l13191
u17540:
	line	1163
	
l13189:; BSR set to: 5

	movlw	low(05h)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l877
	line	1165
	
l13191:; BSR set to: 5

	decf	(0+(_menu+0Ah))&0ffh
	goto	l877
	line	1171
	
l13193:; BSR set to: 5

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u17551
	goto	u17550

u17551:
	goto	l13197
u17550:
	
l13195:; BSR set to: 5

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1443+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1443))&0ffh
	goto	l13199
	
l13197:; BSR set to: 5

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1443+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1443))&0ffh
	
l13199:; BSR set to: 0

	movff	(_handle_numeric_rotation$1443),(handle_numeric_rotation@max_tens)
	line	1172
	
l13201:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u17561
	goto	u17560

u17561:
	goto	l13213
u17560:
	line	1174
	
l13203:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u17571
	goto	u17570
u17571:
	goto	l13207
u17570:
	goto	l877
	line	1176
	
l13207:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+0Bh))&0ffh
	line	1177
	
l13209:; BSR set to: 5

		movf	(0+(_menu+0Bh))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfsc	status,0
	goto	u17581
	goto	u17580

u17581:
	goto	l877
u17580:
	line	1178
	
l13211:; BSR set to: 0

	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	goto	l877
	line	1180
	
l13213:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u17590
	goto	u17591

u17591:
	goto	l877
u17590:
	line	1182
	
l13215:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u17601
	goto	u17600
u17601:
	goto	l13219
u17600:
	goto	l877
	line	1184
	
l13219:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+0Bh))&0ffh,w
	btfss	status,2
	goto	u17611
	goto	u17610
u17611:
	goto	l13223
u17610:
	line	1185
	
l13221:; BSR set to: 5

	movff	(handle_numeric_rotation@max_tens),0+(_menu+0Bh)
	goto	l877
	line	1187
	
l13223:; BSR set to: 5

	decf	(0+(_menu+0Bh))&0ffh
	goto	l877
	line	1194
	
l13225:; BSR set to: 5

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u17621
	goto	u17620

u17621:
	goto	l13229
u17620:
	
l13227:; BSR set to: 5

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1445+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1445))&0ffh
	goto	l13231
	
l13229:; BSR set to: 5

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1445+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1445))&0ffh
	
l13231:; BSR set to: 0

	movff	(_handle_numeric_rotation$1445),(handle_numeric_rotation@max_units)
	line	1195
	
l13233:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u17631
	goto	u17630

u17631:
	goto	l13245
u17630:
	line	1197
	
l13235:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u17641
	goto	u17640
u17641:
	goto	l13239
u17640:
	goto	l877
	line	1199
	
l13239:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+0Ch))&0ffh
	line	1200
	
l13241:; BSR set to: 5

		movf	(0+(_menu+0Ch))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_units))&0ffh,w
	btfsc	status,0
	goto	u17651
	goto	u17650

u17651:
	goto	l877
u17650:
	line	1201
	
l13243:; BSR set to: 0

	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	goto	l877
	line	1203
	
l13245:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u17660
	goto	u17661

u17661:
	goto	l877
u17660:
	line	1205
	
l13247:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u17671
	goto	u17670
u17671:
	goto	l13251
u17670:
	goto	l877
	line	1207
	
l13251:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+0Ch))&0ffh,w
	btfss	status,2
	goto	u17681
	goto	u17680
u17681:
	goto	l13255
u17680:
	line	1208
	
l13253:; BSR set to: 5

	movff	(handle_numeric_rotation@max_units),0+(_menu+0Ch)
	goto	l877
	line	1210
	
l13255:; BSR set to: 5

	decf	(0+(_menu+0Ch))&0ffh
	goto	l877
	line	1144
	
l13259:; BSR set to: 5

	movf	(0+(_menu+08h))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l13171
	xorlw	1^0	; case 1
	skipnz
	goto	l13177
	xorlw	2^1	; case 2
	skipnz
	goto	l13193
	xorlw	3^2	; case 3
	skipnz
	goto	l13225
	goto	l877

	line	1215
	
l877:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_numeric_rotation
	__end_of_handle_numeric_rotation:
	signat	_handle_numeric_rotation,4217
	global	_menu_handle_button

;; *************** function _menu_handle_button *****************
;; Defined at:
;;		line 2084 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  press_type      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  press_type      1  250[BANK2 ] unsigned char 
;;  i               1  249[BANK1 ] unsigned char 
;;  buf            80  167[BANK1 ] unsigned char [80]
;;  opts            2  247[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  edit_flag       2  121[BANK0 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), NULL(0), 
;;  buf            50  100[BANK2 ] unsigned char [50]
;;  current_val     2  123[BANK0 ] unsigned int 
;;  current_val     2  125[BANK0 ] int 
;;  verify_time     7  100[BANK3 ] struct .
;;  new_value       2  250[BANK1 ] unsigned int 
;;  sensor_type     1  255[BANK2 ] unsigned char 
;;  flow_type       1  253[BANK2 ] unsigned char 
;;  new_value       2  115[BANK3 ] int 
;;  new_seconds     2  251[BANK2 ] unsigned int 
;;  buf            80   87[BANK1 ] unsigned char [80]
;;  new_time        7  107[BANK3 ] struct .
;;  buf            50  200[BANK2 ] unsigned char [50]
;;  buf            50  150[BANK2 ] unsigned char [50]
;;  buf            50   50[BANK2 ] unsigned char [50]
;;  opts            2  119[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  edit_flag       2  117[BANK0 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), NULL(0), 
;;  buf            50    0[BANK2 ] unsigned char [50]
;;  buf            50   50[BANK3 ] unsigned char [50]
;;  edit_flag       2  254[BANK1 ] PTR unsigned char 
;;		 -> display_edit_flag(1), relay_high_edit_flag(1), enable_edit_flag(1), NULL(0), 
;;  opts            2  252[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  buf            50    0[BANK3 ] unsigned char [50]
;;  sensor_type     1  114[BANK3 ] unsigned char 
;;  flow_type       1  254[BANK2 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/3
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      12     169     256     117       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0      17     169     256     117       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      559 bytes
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
	line	2084
global __ptext13
__ptext13:
psect	text13
	file	"src\menu.c"
	line	2084
	
_menu_handle_button:
;incstack = 0
	callstack 22
	movlb	2	; () banked
	movwf	((menu_handle_button@press_type))&0ffh
	line	2089
	
l15143:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u20321
	goto	u20320
u20321:
	goto	l15585
u20320:
	line	2091
	
l15145:; BSR set to: 5

	movlb	2	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u20331
	goto	u20330

u20331:
	goto	l15563
u20330:
	line	2094
	
l15147:; BSR set to: 2

		movlw	3
	movlb	4	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20341
	goto	u20340

u20341:
	goto	l15249
u20340:
	line	2099
	
l15149:; BSR set to: 4

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
	line	2100
	
l15151:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2103
	
l15153:
		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2104
	
l15155:; BSR set to: 1

		movlw	low(0)
	movwf	((menu_handle_button@edit_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@edit_flag+1))&0ffh

	line	2106
	
l15157:; BSR set to: 1

	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20351
	goto	u20350
u20351:
	goto	l15167
u20350:
	line	2108
	
l15159:; BSR set to: 5

		movlw	low(_menu_item_options)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2109
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2110
	
l15161:; BSR set to: 1

	movff	(c:_enable_edit_flag),(_system_config)
	line	2111
	
l15163:; BSR set to: 1

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
	line	2112
	
l15165:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2113
	goto	l1228
	line	2114
	
l15167:; BSR set to: 5

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20361
	goto	u20360

u20361:
	goto	l15177
u20360:
	line	2116
	
l15169:; BSR set to: 5

		movlw	low(_menu_item_options+048h)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2117
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2118
	
l15171:; BSR set to: 1

	movff	(c:_relay_high_edit_flag),0+(_system_config+06h)
	line	2119
	
l15173:; BSR set to: 1

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
	goto	l15165
	line	2122
	
l15177:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20371
	goto	u20370

u20371:
	goto	l15227
u20370:
	line	2125
	
l15179:; BSR set to: 5

	incf	(0+(_menu+011h))&0ffh
	line	2126
	
l15181:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2129
	
l15183:; BSR set to: 5

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u20381
	goto	u20380

u20381:
	goto	l15189
u20380:
	
l15185:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u20391
	goto	u20390

u20391:
	goto	l15189
u20390:
	line	2131
	
l15187:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	line	2134
	
l15189:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2136
	
l15191:
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
	line	2137
	
l15193:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2140
	
l15195:
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
	line	2141
	
l15197:
	call	_menu_draw_clock	;wreg free
	line	2143
	
l15199:
		movlw	02h-1
	movlb	5	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u20401
	goto	u20400

u20401:
	goto	l1239
u20400:
	line	2146
	
l15201:; BSR set to: 5

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
	line	2149
	
l15203:; BSR set to: 1

	movf	((menu_handle_button@new_value))&0ffh,w
iorwf	((menu_handle_button@new_value+1))&0ffh,w
	btfss	status,2
	goto	u20411
	goto	u20410

u20411:
	goto	l15207
u20410:
	line	2150
	
l15205:; BSR set to: 1

	movlw	high(01h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(01h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	2151
	
l15207:; BSR set to: 1

		movf	((menu_handle_button@new_value+1))&0ffh,w
	bnz	u20420
	movlw	121
	subwf	 ((menu_handle_button@new_value))&0ffh,w
	btfss	status,0
	goto	u20421
	goto	u20420

u20421:
	goto	l15211
u20420:
	line	2152
	
l15209:; BSR set to: 1

	movlw	high(078h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(078h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	2154
	
l15211:; BSR set to: 1

	movff	(menu_handle_button@new_value),0+(_system_config+07h)
	line	2157
	
l15213:; BSR set to: 1

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
	line	2158
	
l15215:
		movff	0+(_clock_menu+0Ch),(c:strcpy@to)
	movff	1+(_clock_menu+0Ch),(c:strcpy@to+1)

		movlw	low(_value_relay_pulse)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	2160
	
l15217:
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
	line	2161
	
l15219:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2162
	movlw	low(01h)
	movwf	((c:_save_pending))^00h,c
	line	2163
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2164
	
l15221:; BSR set to: 5

	call	_menu_draw_clock	;wreg free
	line	2168
	
l15223:
	movlw	(0)&0ffh
	
	call	_trigger_relay_pulse
	line	2169
	goto	l1239
	line	2170
	
l1233:
	line	2172
	goto	l1239
	line	2177
	
l15227:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20431
	goto	u20430

u20431:
	goto	l1228
u20430:
	line	2179
	
l15229:; BSR set to: 5

		movlw	low(_menu_item_options+03Ch)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2180
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2184
	
l1228:
	movlb	1	; () banked
	movf	((menu_handle_button@opts))&0ffh,w
iorwf	((menu_handle_button@opts+1))&0ffh,w
	btfsc	status,2
	goto	u20441
	goto	u20440

u20441:
	goto	l15243
u20440:
	
l15231:; BSR set to: 1

	movf	((menu_handle_button@edit_flag))&0ffh,w
iorwf	((menu_handle_button@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u20451
	goto	u20450

u20451:
	goto	l15243
u20450:
	
l15233:; BSR set to: 1

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
	goto	u20461
	goto	u20460
u20461:
	goto	l15243
u20460:
	line	2186
	
l15235:; BSR set to: 0

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
	line	2187
	
l15237:
	movlw	low(01h)
	movwf	((c:_save_pending))^00h,c
	line	2188
	
l15239:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_310)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_310)
	movwf	((c:sprintf@f+1))^00h,c

	movlb	5	; () banked
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
	line	2189
	
l15241:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2192
	
l15243:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2193
	
l15245:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1239
	line	2198
	
l15249:; BSR set to: 4

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20471
	goto	u20470

u20471:
	goto	l15307
u20470:
	
l15251:; BSR set to: 4

	movlb	5	; () banked
	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u20481
	goto	u20480
u20481:
	goto	l15307
u20480:
	line	2200
	
l15253:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2201
	
l15255:
	movlb	5	; () banked
	incf	(0+(_menu+01Dh))&0ffh
	line	2205
	
l15257:; BSR set to: 5

		movlw	low(menu_handle_button@buf_1691)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1691)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_311)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_311)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+01Ch),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Dh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2206
	
l15259:
		movlw	low(menu_handle_button@buf_1691)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1691)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2209
	
l15261:
		movlw	03h-1
	movlb	5	; () banked
	cpfsgt	(0+(_menu+01Dh))&0ffh
	goto	u20491
	goto	u20490

u20491:
	goto	l15301
u20490:
	line	2215
	
l15263:; BSR set to: 5

		movlw	low(menu_handle_button@buf_1693)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1693)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_312)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_312)
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
	line	2216
	
l15265:
		movlw	low(menu_handle_button@buf_1693)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1693)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2219
	
l15267:
	movff	0+(_menu+016h),0+(menu_handle_button@new_time+04h)
	line	2220
	
l15269:
	movff	0+(_menu+017h),0+(menu_handle_button@new_time+05h)
	line	2221
	
l15271:
	movff	0+(_menu+018h),0+(menu_handle_button@new_time+06h)
	line	2222
	
l15273:
	movff	0+(_menu+019h),0+(menu_handle_button@new_time+02h)
	line	2223
	
l15275:
	movff	0+(_menu+01Ah),0+(menu_handle_button@new_time+01h)
	line	2224
	
l15277:
	movff	0+(_menu+01Bh),(menu_handle_button@new_time)
	line	2225
	
l15279:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	(0+(menu_handle_button@new_time+03h))&0ffh
	line	2227
	
l15281:; BSR set to: 3

		movlw	low(menu_handle_button@new_time)
	movwf	((c:rtc_set_time@time))^00h,c
	movlw	high(menu_handle_button@new_time)
	movwf	((c:rtc_set_time@time+1))^00h,c

	call	_rtc_set_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u20501
	goto	u20500
u20501:
	goto	l15295
u20500:
	line	2229
	
l15283:
		movlw	low(STR_313)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_313)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2233
	
l15285:
		movlw	low(menu_handle_button@verify_time)
	movwf	((c:rtc_read_time@time))^00h,c
	movlw	high(menu_handle_button@verify_time)
	movwf	((c:rtc_read_time@time+1))^00h,c

	call	_rtc_read_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u20511
	goto	u20510
u20511:
	goto	l15293
u20510:
	line	2238
	
l15287:
		movlw	low(menu_handle_button@buf_1712)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1712)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_314)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_314)
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
	line	2239
	
l15289:
		movlw	low(menu_handle_button@buf_1712)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1712)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2240
	
l15291:
		movlw	low(STR_315)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_315)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2241
	goto	l15297
	line	2244
	
l15293:
		movlw	low(STR_316)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_316)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l15297
	line	2249
	
l15295:
		movlw	low(STR_317)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_317)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2252
	
l15297:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2253
	
l15299:
	call	_menu_draw_utility	;wreg free
	line	2254
	goto	l1239
	line	2258
	
l15301:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l15299
	line	2266
	
l15307:
	movlb	4	; () banked
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
	line	2267
	movlb	4	; () banked
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
	line	2270
	
l15309:; BSR set to: 2

	movff	(menu_handle_button@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_option_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u20521
	goto	u20520
u20521:
	goto	l15413
u20520:
	line	2272
	
l15311:
	movff	(menu_handle_button@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1719)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1719+1)
	line	2273
	movff	(menu_handle_button@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1720)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1720+1)
	line	2275
	
l15313:
	movlb	0	; () banked
	movf	((menu_handle_button@edit_flag_1719))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1719+1))&0ffh,w
	btfsc	status,2
	goto	u20531
	goto	u20530

u20531:
	goto	l15243
u20530:
	
l15315:; BSR set to: 0

	movf	((menu_handle_button@opts_1720))&0ffh,w
iorwf	((menu_handle_button@opts_1720+1))&0ffh,w
	btfsc	status,2
	goto	u20541
	goto	u20540

u20541:
	goto	l15243
u20540:
	line	2278
	
l15317:; BSR set to: 0

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
	movff	(menu_handle_button@edit_flag_1719),fsr2l
	movff	(menu_handle_button@edit_flag_1719+1),fsr2h
	movf	indf2,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movf	((??_menu_handle_button+0+0))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_button+1+0
	movff	prodh,??_menu_handle_button+1+0+1
	movf	(??_menu_handle_button+1+0)&0ffh,w
	addwf	((menu_handle_button@opts_1720))&0ffh,w
	movwf	(??_menu_handle_button+3+0)&0ffh
	movf	(??_menu_handle_button+1+1)&0ffh,w
	addwfc	((menu_handle_button@opts_1720+1))&0ffh,w
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
	line	2281
	
l15319:
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20551
	goto	u20550
u20551:
	goto	l15323
u20550:
	line	2283
	
l15321:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_enable_edit_flag),indf2

	line	2284
	goto	l15407
	line	2285
	
l15323:; BSR set to: 5

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20561
	goto	u20560

u20561:
	goto	l15335
u20560:
	line	2287
	
l15325:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_sensor_edit_flag),indf2

	line	2290
	
l15327:; BSR set to: 4

		movlw	2
	xorwf	((c:_sensor_edit_flag))^00h,c,w
	btfss	status,2
	goto	u20571
	goto	u20570

u20571:
	goto	l15333
u20570:
	
l15329:; BSR set to: 4

		movlw	2
	movlb	3	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfsc	status,2
	goto	u20581
	goto	u20580

u20581:
	goto	l15333
u20580:
	line	2292
	
l15331:; BSR set to: 3

	movlb	4	; () banked
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
	line	2296
	
l15333:
	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	2297
	goto	l15407
	line	2298
	
l15335:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20591
	goto	u20590

u20591:
	goto	l15343
u20590:
	
l15337:; BSR set to: 5

		movlw	2
	movlb	3	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u20601
	goto	u20600

u20601:
	goto	l15343
u20600:
	line	2300
	
l15339:; BSR set to: 3

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_flow_type_edit_flag),indf2

	line	2303
	
l15341:; BSR set to: 4

	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	2304
	goto	l15407
	line	2305
	
l15343:
		movlw	3
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20611
	goto	u20610

u20611:
	goto	l15351
u20610:
	
l15345:; BSR set to: 5

		movlw	2
	movlb	3	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u20621
	goto	u20620

u20621:
	goto	l15351
u20620:
	
l15347:; BSR set to: 3

	movlb	2	; () banked
		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u20631
	goto	u20630

u20631:
	goto	l15351
u20630:
	goto	l15407
	line	2308
	
l15349:
	goto	l15407
	line	2309
	
l15351:
		movlw	3
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20641
	goto	u20640

u20641:
	goto	l15359
u20640:
	
l15353:; BSR set to: 5

		movlw	2
	movlb	3	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u20651
	goto	u20650

u20651:
	goto	l15359
u20650:
	
l15355:; BSR set to: 3

	movlb	2	; () banked
	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u20661
	goto	u20660
u20661:
	goto	l15359
u20660:
	line	2311
	
l15357:; BSR set to: 2

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_flow_units_edit_flag),indf2

	line	2312
	goto	l15407
	line	2313
	
l15359:
	movlb	3	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u20671
	goto	u20670
u20671:
	goto	l15377
u20670:
	line	2315
	
l15361:; BSR set to: 3

		movlw	9
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20681
	goto	u20680

u20681:
	goto	l15365
u20680:
	line	2316
	
l15363:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+038h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+038h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_high_edit_flag),indf2

	goto	l15407
	line	2317
	
l15365:; BSR set to: 5

		movlw	10
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20691
	goto	u20690

u20691:
	goto	l15369
u20690:
	line	2318
	
l15367:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+039h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+039h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_plp_edit_flag),indf2

	goto	l15407
	line	2319
	
l15369:; BSR set to: 5

		movlw	11
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20701
	goto	u20700

u20701:
	goto	l15373
u20700:
	line	2320
	
l15371:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_slp_edit_flag),indf2

	goto	l15407
	line	2321
	
l15373:; BSR set to: 5

		movlw	12
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20711
	goto	u20710

u20711:
	goto	l15349
u20710:
	line	2322
	
l15375:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_display_edit_flag),indf2

	goto	l15407
	line	2324
	
l15377:; BSR set to: 3

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u20721
	goto	u20720

u20721:
	goto	l15387
u20720:
	line	2326
	
l15379:; BSR set to: 3

		movlw	6
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20731
	goto	u20730

u20731:
	goto	l15383
u20730:
	goto	l15363
	line	2328
	
l15383:; BSR set to: 5

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20741
	goto	u20740

u20741:
	goto	l15349
u20740:
	goto	l15375
	line	2331
	
l15387:; BSR set to: 3

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u20751
	goto	u20750

u20751:
	goto	l15349
u20750:
	line	2333
	
l15389:; BSR set to: 3

	movlb	2	; () banked
	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u20761
	goto	u20760
u20761:
	goto	l15399
u20760:
	line	2335
	
l15391:; BSR set to: 2

		movlw	8
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20771
	goto	u20770

u20771:
	goto	l15395
u20770:
	line	2336
	
l15393:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Bh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Bh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_low_edit_flag),indf2

	goto	l15407
	line	2337
	
l15395:; BSR set to: 5

		movlw	9
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20781
	goto	u20780

u20781:
	goto	l15349
u20780:
	goto	l15375
	line	2342
	
l15399:; BSR set to: 2

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20791
	goto	u20790

u20791:
	goto	l15403
u20790:
	goto	l15393
	line	2344
	
l15403:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20801
	goto	u20800

u20801:
	goto	l15349
u20800:
	goto	l15375
	line	2349
	
l15407:
	movlw	low(01h)
	movwf	((c:_save_pending))^00h,c
	goto	l15243
	line	2356
	
l15413:
	movff	(menu_handle_button@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_time_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u20811
	goto	u20810
u20811:
	goto	l15477
u20810:
	line	2358
	
l15415:
	movlb	5	; () banked
	incf	(0+(_menu+011h))&0ffh
	line	2359
	
l15417:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2360
	
l15419:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2363
	
l15421:
		movlw	low(menu_handle_button@buf_1725)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1725)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_318)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_318)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2364
	
l15423:
		movlw	low(menu_handle_button@buf_1725)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1725)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2366
	
l15425:
	call	_menu_update_time_value	;wreg free
	line	2368
	
l15427:
		movlw	02h-1
	movlb	5	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u20821
	goto	u20820

u20821:
	goto	l1239
u20820:
	line	2372
	
l15429:; BSR set to: 5

	movf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u20831
	goto	u20830
u20831:
	goto	l15433
u20830:
	line	2373
	
l15431:; BSR set to: 5

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
	goto	l15435
	line	2375
	
l15433:; BSR set to: 5

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
	line	2378
	
l15435:; BSR set to: 2

	movlb	3	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u20841
	goto	u20840
u20841:
	goto	l15449
u20840:
	line	2380
	
l15437:; BSR set to: 3

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20851
	goto	u20850

u20851:
	goto	l15441
u20850:
	line	2381
	
l15439:; BSR set to: 5

	movlb	4	; () banked
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
	goto	l15469
	line	2382
	
l15441:; BSR set to: 5

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20861
	goto	u20860

u20861:
	goto	l15445
u20860:
	line	2383
	
l15443:; BSR set to: 5

	movlb	4	; () banked
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
	goto	l15469
	line	2384
	
l15445:; BSR set to: 5

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20871
	goto	u20870

u20871:
	goto	l1293
u20870:
	line	2385
	
l15447:; BSR set to: 5

	movlb	4	; () banked
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
	goto	l15469
	line	2386
	
l1293:; BSR set to: 5

	goto	l15469
	line	2387
	
l15449:; BSR set to: 3

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u20881
	goto	u20880

u20881:
	goto	l15455
u20880:
	line	2389
	
l15451:; BSR set to: 3

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20891
	goto	u20890

u20891:
	goto	l15469
u20890:
	goto	l15439
	line	2392
	
l15455:; BSR set to: 3

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u20901
	goto	u20900

u20901:
	goto	l15469
u20900:
	line	2394
	
l15457:; BSR set to: 3

	movlb	2	; () banked
	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u20911
	goto	u20910
u20911:
	goto	l15463
u20910:
	
l15459:; BSR set to: 2

		movlw	7
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20921
	goto	u20920

u20921:
	goto	l15463
u20920:
	line	2395
	
l15461:; BSR set to: 5

	movlb	4	; () banked
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
	goto	l15469
	line	2396
	
l15463:
	movlb	2	; () banked
		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u20931
	goto	u20930

u20931:
	goto	l15469
u20930:
	
l15465:; BSR set to: 2

		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20941
	goto	u20940

u20941:
	goto	l15469
u20940:
	goto	l15461
	line	2402
	
l15469:
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
		movlw	low(STR_319)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_319)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2404
	
l15471:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2405
	
l15473:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:_save_pending))^00h,c
	line	2406
	
l15475:; BSR set to: 5

		movlw	low(STR_320)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_320)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1239
	line	2410
	
l15477:
	movff	(menu_handle_button@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_numeric_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u20951
	goto	u20950
u20951:
	goto	l1233
u20950:
	line	2412
	
l15479:
	movlb	5	; () banked
	incf	(0+(_menu+08h))&0ffh
	line	2413
	
l15481:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2415
	
l15483:
		movlw	2
	movlb	5	; () banked
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20961
	goto	u20960

u20961:
	goto	l15489
u20960:
	
l15485:; BSR set to: 5

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u20971
	goto	u20970

u20971:
	goto	l15489
u20970:
	line	2417
	
l15487:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+0Bh))&0ffh
	line	2418
	movlw	low(0)
	movwf	(0+(_menu+0Ch))&0ffh
	line	2421
	
l15489:; BSR set to: 5

		movlw	04h-1
	cpfsgt	(0+(_menu+08h))&0ffh
	goto	u20981
	goto	u20980

u20981:
	goto	l1233
u20980:
	line	2423
	
l15491:; BSR set to: 5

	call	_get_current_numeric_value	;wreg free
	movff	0+?_get_current_numeric_value,(menu_handle_button@new_value_1730)
	movff	1+?_get_current_numeric_value,(menu_handle_button@new_value_1730+1)
	line	2426
	
l15493:; BSR set to: 5

	movlb	3	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u20991
	goto	u20990
u20991:
	goto	l15517
u20990:
	line	2428
	
l15495:; BSR set to: 3

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21001
	goto	u21000

u21001:
	goto	l15501
u21000:
	line	2430
	
l15497:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1730),postinc2
	movff	(menu_handle_button@new_value_1730+1),postdec2
	line	2431
	
l15499:; BSR set to: 4

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_321)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_321)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1730),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1730+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2432
	goto	l15559
	line	2433
	
l15501:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21011
	goto	u21010

u21011:
	goto	l15507
u21010:
	line	2435
	
l15503:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1730),postinc2
	movff	(menu_handle_button@new_value_1730+1),postdec2
	line	2436
	
l15505:; BSR set to: 4

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_322)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_322)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1730),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1730+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2437
	goto	l15559
	line	2438
	
l15507:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21021
	goto	u21020

u21021:
	goto	l15513
u21020:
	line	2440
	
l15509:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1730),postinc2
	movff	(menu_handle_button@new_value_1730+1),postdec2
	line	2441
	
l15511:; BSR set to: 4

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_323)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_323)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1730),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1730+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2442
	goto	l15559
	line	2443
	
l15513:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21031
	goto	u21030

u21031:
	goto	l1313
u21030:
	line	2446
	
l15515:; BSR set to: 5

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_324)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_324)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1730),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1730+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l15559
	line	2448
	
l1313:; BSR set to: 5

	goto	l15559
	line	2449
	
l15517:; BSR set to: 3

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21041
	goto	u21040

u21041:
	goto	l15537
u21040:
	line	2451
	
l15519:; BSR set to: 3

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21051
	goto	u21050

u21051:
	goto	l15525
u21050:
	line	2453
	
l15521:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1730),postinc2
	movff	(menu_handle_button@new_value_1730+1),postdec2
	line	2454
	
l15523:; BSR set to: 4

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_325)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_325)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1730),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1730+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2455
	goto	l15559
	line	2456
	
l15525:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21061
	goto	u21060

u21061:
	goto	l15531
u21060:
	line	2458
	
l15527:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1730),postinc2
	movff	(menu_handle_button@new_value_1730+1),postdec2
	line	2459
	
l15529:; BSR set to: 4

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_326)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_326)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1730),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1730+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2460
	goto	l15559
	line	2461
	
l15531:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21071
	goto	u21070

u21071:
	goto	l1313
u21070:
	line	2463
	
l15533:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1730),postinc2
	movff	(menu_handle_button@new_value_1730+1),postdec2
	line	2464
	
l15535:; BSR set to: 4

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_327)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_327)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1730),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1730+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l15559
	line	2467
	
l15537:; BSR set to: 3

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21081
	goto	u21080

u21081:
	goto	l15559
u21080:
	
l15539:; BSR set to: 3

	movlb	2	; () banked
	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u21091
	goto	u21090
u21091:
	goto	l15559
u21090:
	line	2469
	
l15541:; BSR set to: 2

		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21101
	goto	u21100

u21101:
	goto	l15547
u21100:
	line	2471
	
l15543:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1730),postinc2
	movff	(menu_handle_button@new_value_1730+1),postdec2
	line	2472
	
l15545:; BSR set to: 4

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_328)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_328)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1730),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1730+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2473
	goto	l15559
	line	2474
	
l15547:; BSR set to: 5

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21111
	goto	u21110

u21111:
	goto	l15553
u21110:
	line	2476
	
l15549:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1730),postinc2
	movff	(menu_handle_button@new_value_1730+1),postdec2
	line	2477
	
l15551:; BSR set to: 4

		movff	0+(_input_menu+01Bh),(c:sprintf@sp)
	movff	1+(_input_menu+01Bh),(c:sprintf@sp+1)

		movlw	low(STR_329)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_329)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1730),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1730+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2478
	goto	l15559
	line	2479
	
l15553:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21121
	goto	u21120

u21121:
	goto	l1313
u21120:
	line	2481
	
l15555:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+020h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+020h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1730),postinc2
	movff	(menu_handle_button@new_value_1730+1),postdec2
	line	2482
	
l15557:; BSR set to: 4

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_330)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_330)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1730),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1730+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2486
	
l15559:
	movlw	low(01h)
	movwf	((c:_save_pending))^00h,c
	line	2487
	
l15561:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	goto	l1239
	line	2491
	
l15563:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u21131
	goto	u21130

u21131:
	goto	l1239
u21130:
	line	2494
	
l15565:; BSR set to: 2

		movlw	4
	movlb	4	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21141
	goto	u21140

u21141:
	goto	l15573
u21140:
	
l15567:; BSR set to: 4

	movlb	5	; () banked
	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u21151
	goto	u21150
u21151:
	goto	l15573
u21150:
	line	2496
	
l15569:; BSR set to: 5

		movlw	low(STR_331)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_331)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2497
	
l15571:
	call	_init_datetime_editor	;wreg free
	line	2500
	
l15573:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2501
	
l15575:; BSR set to: 5

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2502
	
l15577:
	asmopt push
asmopt off
movlw  3
	movlb	0	; () banked
movwf	(??_menu_handle_button+0+0+1)&0ffh
movlw	8
movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	119
u22407:
decfsz	wreg,f
	bra	u22407
	decfsz	(??_menu_handle_button+0+0)&0ffh,f
	bra	u22407
	decfsz	(??_menu_handle_button+0+0+1)&0ffh,f
	bra	u22407
asmopt pop

	line	2503
	
l15579:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2506
	
l15581:
		movlw	4
	movlb	4	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21161
	goto	u21160

u21161:
	goto	l1233
u21160:
	goto	l15299
	line	2512
	
l15585:; BSR set to: 5

	movlb	2	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u21171
	goto	u21170

u21171:
	goto	l15931
u21170:
	line	2514
	
l15587:; BSR set to: 2

	movlb	4	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21181
	goto	u21180
u21181:
	goto	l15619
u21180:
	line	2516
	
l15589:; BSR set to: 4

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2518
	goto	l15617
	line	2524
	
l15591:; BSR set to: 5

	movlw	low(02h)
	movlb	4	; () banked
	movwf	((_current_menu))&0ffh
	line	2525
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu))&0ffh
	line	2526
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2527
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2528
	
l15593:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	2529
	goto	l1239
	line	2532
	
l15595:; BSR set to: 5

	call	_rebuild_utility_menu	;wreg free
	line	2533
	
l15597:; BSR set to: 5

	movlw	low(04h)
	movlb	4	; () banked
	movwf	((_current_menu))&0ffh
	line	2534
	
l15599:; BSR set to: 4

	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu))&0ffh
	line	2535
	
l15601:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2539
	
l15603:; BSR set to: 5

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	goto	l15299
	line	2547
	
l15607:; BSR set to: 5

	movf	((c:_save_pending))^00h,c,w
	btfsc	status,2
	goto	u21191
	goto	u21190
u21191:
	goto	l15613
u21190:
	line	2549
	
l15609:; BSR set to: 5

	call	_save_current_config	;wreg free
	line	2550
	
l15611:
	movlw	low(0)
	movwf	((c:_save_pending))^00h,c
	line	2552
	
l15613:
	movlb	4	; () banked
	setf	((_current_menu))&0ffh
	line	2553
	goto	l1239
	line	2518
	
l15617:
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
	goto	l1233
	xorlw	1^0	; case 1
	skipnz
	goto	l15591
	xorlw	2^1	; case 2
	skipnz
	goto	l15595
	xorlw	3^2	; case 3
	skipnz
	goto	l1233
	xorlw	4^3	; case 4
	skipnz
	goto	l15607
	goto	l1239

	line	2556
	
l15619:; BSR set to: 4

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21201
	goto	u21200

u21201:
	goto	l15769
u21200:
	line	2558
	
l15621:; BSR set to: 4

	movlb	5	; () banked
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
	bnz	u21211
movf	(??_menu_handle_button+0+1)&0ffh,w
xorwf	(??_menu_handle_button+2+1)&0ffh,w
	btfss	status,2
	goto	u21211
	goto	u21210

u21211:
	goto	l15635
u21210:
	line	2560
	
l15623:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2561
	
l15625:
	movlw	low(02h)
	movlb	4	; () banked
	movwf	((_current_menu))&0ffh
	line	2562
	
l15627:; BSR set to: 4

	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu))&0ffh
	line	2563
	
l15629:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2564
	
l15631:; BSR set to: 5

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l15593
	line	2567
	
l15635:; BSR set to: 0

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
	goto	u21221
	goto	u21220
u21221:
	goto	l1239
u21220:
	line	2569
	
l15637:; BSR set to: 5

	movlb	4	; () banked
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
	movwf	((menu_handle_button@sensor_type_1747))&0ffh
	line	2570
	movlb	4	; () banked
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
	movwf	((menu_handle_button@flow_type_1748))&0ffh
	line	2573
	
l15639:; BSR set to: 2

	movff	(menu_handle_button@sensor_type_1747),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type_1748),(c:is_numeric_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u21231
	goto	u21230
u21231:
	goto	l15697
u21230:
	line	2575
	
l15641:
	movlw	high(0)
	movlb	0	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val))&0ffh
	line	2578
	movlb	2	; () banked
	movf	((menu_handle_button@sensor_type_1747))&0ffh,w
	btfss	status,2
	goto	u21241
	goto	u21240
u21241:
	goto	l15659
u21240:
	line	2580
	
l15643:; BSR set to: 2

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21251
	goto	u21250

u21251:
	goto	l15647
u21250:
	line	2581
	
l15645:; BSR set to: 5

	movlb	4	; () banked
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
	goto	l15689
	line	2582
	
l15647:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21261
	goto	u21260

u21261:
	goto	l15651
u21260:
	line	2583
	
l15649:; BSR set to: 5

	movlb	4	; () banked
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
	goto	l15689
	line	2584
	
l15651:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21271
	goto	u21270

u21271:
	goto	l15655
u21270:
	line	2585
	
l15653:; BSR set to: 5

	movlb	4	; () banked
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
	goto	l15689
	line	2586
	
l15655:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21281
	goto	u21280

u21281:
	goto	l1360
u21280:
	line	2587
	
l15657:; BSR set to: 5

	movlw	high(032h)
	movlb	0	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(032h)
	movwf	((menu_handle_button@current_val))&0ffh
	goto	l15689
	line	2588
	
l1360:; BSR set to: 5

	goto	l15689
	line	2589
	
l15659:; BSR set to: 2

		decf	((menu_handle_button@sensor_type_1747))&0ffh,w
	btfss	status,2
	goto	u21291
	goto	u21290

u21291:
	goto	l15673
u21290:
	line	2591
	
l15661:; BSR set to: 2

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21301
	goto	u21300

u21301:
	goto	l15665
u21300:
	goto	l15645
	line	2593
	
l15665:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21311
	goto	u21310

u21311:
	goto	l15669
u21310:
	goto	l15649
	line	2595
	
l15669:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21321
	goto	u21320

u21321:
	goto	l1360
u21320:
	goto	l15653
	line	2598
	
l15673:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1747))&0ffh,w
	btfss	status,2
	goto	u21331
	goto	u21330

u21331:
	goto	l15689
u21330:
	
l15675:; BSR set to: 2

	movf	((menu_handle_button@flow_type_1748))&0ffh,w
	btfss	status,2
	goto	u21341
	goto	u21340
u21341:
	goto	l15689
u21340:
	line	2600
	
l15677:; BSR set to: 2

		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21351
	goto	u21350

u21351:
	goto	l15681
u21350:
	goto	l15645
	line	2602
	
l15681:; BSR set to: 5

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21361
	goto	u21360

u21361:
	goto	l15685
u21360:
	goto	l15649
	line	2604
	
l15685:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21371
	goto	u21370

u21371:
	goto	l1360
u21370:
	line	2605
	
l15687:; BSR set to: 5

	movlb	4	; () banked
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
	line	2608
	
l15689:
	movff	(menu_handle_button@current_val),(c:init_numeric_editor@value)
	movff	(menu_handle_button@current_val+1),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	2609
	
l15691:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2610
	
l15693:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l15245
	line	2614
	
l15697:
	movff	(menu_handle_button@sensor_type_1747),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type_1748),(c:is_time_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u21381
	goto	u21380
u21381:
	goto	l15743
u21380:
	line	2616
	
l15699:
	movlw	high(0)
	movlb	0	; () banked
	movwf	((menu_handle_button@current_val_1751+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val_1751))&0ffh
	line	2619
	movlb	2	; () banked
	movf	((menu_handle_button@sensor_type_1747))&0ffh,w
	btfss	status,2
	goto	u21391
	goto	u21390
u21391:
	goto	l15713
u21390:
	line	2621
	
l15701:; BSR set to: 2

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21401
	goto	u21400

u21401:
	goto	l15705
u21400:
	line	2622
	
l15703:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1751)
	movff	postdec2,(menu_handle_button@current_val_1751+1)
	goto	l15731
	line	2623
	
l15705:; BSR set to: 5

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21411
	goto	u21410

u21411:
	goto	l15709
u21410:
	line	2624
	
l15707:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1751)
	movff	postdec2,(menu_handle_button@current_val_1751+1)
	goto	l15731
	line	2625
	
l15709:; BSR set to: 5

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21421
	goto	u21420

u21421:
	goto	l1382
u21420:
	line	2626
	
l15711:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1751)
	movff	postdec2,(menu_handle_button@current_val_1751+1)
	goto	l15731
	line	2627
	
l1382:; BSR set to: 5

	goto	l15731
	line	2628
	
l15713:; BSR set to: 2

		decf	((menu_handle_button@sensor_type_1747))&0ffh,w
	btfss	status,2
	goto	u21431
	goto	u21430

u21431:
	goto	l15719
u21430:
	line	2630
	
l15715:; BSR set to: 2

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21441
	goto	u21440

u21441:
	goto	l15731
u21440:
	goto	l15703
	line	2633
	
l15719:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1747))&0ffh,w
	btfss	status,2
	goto	u21451
	goto	u21450

u21451:
	goto	l15731
u21450:
	line	2636
	
l15721:; BSR set to: 2

	movf	((menu_handle_button@flow_type_1748))&0ffh,w
	btfss	status,2
	goto	u21461
	goto	u21460
u21461:
	goto	l15725
u21460:
	
l15723:; BSR set to: 2

		movlw	7
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u21471
	goto	u21470

u21471:
	goto	l15729
u21470:
	
l15725:
	movlb	2	; () banked
		decf	((menu_handle_button@flow_type_1748))&0ffh,w
	btfss	status,2
	goto	u21481
	goto	u21480

u21481:
	goto	l15731
u21480:
	
l15727:; BSR set to: 2

		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21491
	goto	u21490

u21491:
	goto	l15731
u21490:
	line	2637
	
l15729:; BSR set to: 5

	movlb	4	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1751)
	movff	postdec2,(menu_handle_button@current_val_1751+1)
	line	2641
	
l15731:
		movlw	low(menu_handle_button@buf_1752)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1752)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_332)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_332)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@current_val_1751),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@current_val_1751+1),1+((c:?_sprintf)+04h)
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2642
	
l15733:
		movlw	low(menu_handle_button@buf_1752)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1752)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2644
	
l15735:
	movff	(menu_handle_button@current_val_1751),(c:init_time_editor@value_seconds)
	movff	(menu_handle_button@current_val_1751+1),(c:init_time_editor@value_seconds+1)
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	goto	l15691
	line	2650
	
l15743:
	movff	(menu_handle_button@sensor_type_1747),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type_1748),(c:is_option_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u21501
	goto	u21500
u21501:
	goto	l1233
u21500:
	line	2652
	
l15745:
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
	line	2654
	
l15747:
	movff	(menu_handle_button@sensor_type_1747),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type_1748),(c:get_option_edit_flag@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1755)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1755+1)
	line	2655
	
l15749:
	movff	(menu_handle_button@sensor_type_1747),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type_1748),(c:get_item_options_for_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1756)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1756+1)
	line	2657
	
l15751:
	movlb	0	; () banked
	movf	((menu_handle_button@edit_flag_1755))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1755+1))&0ffh,w
	btfsc	status,2
	goto	u21511
	goto	u21510

u21511:
	goto	l15765
u21510:
	
l15753:; BSR set to: 0

	movlb	1	; () banked
	movf	((menu_handle_button@opts_1756))&0ffh,w
iorwf	((menu_handle_button@opts_1756+1))&0ffh,w
	btfsc	status,2
	goto	u21521
	goto	u21520

u21521:
	goto	l15765
u21520:
	line	2660
	
l15755:; BSR set to: 1

	movlw	low(0)
	movwf	((menu_handle_button@i))&0ffh
	goto	l15763
	line	2662
	
l15757:; BSR set to: 1

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
	addwf	((menu_handle_button@opts_1756))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+2+0)&0ffh
	movf	(??_menu_handle_button+0+1)&0ffh,w
	movlb	1	; () banked
	addwfc	((menu_handle_button@opts_1756+1))&0ffh,w
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
	goto	u21531
	goto	u21530

u21531:
	goto	l15761
u21530:
	line	2664
	
l15759:
	movff	(menu_handle_button@edit_flag_1755),fsr2l
	movff	(menu_handle_button@edit_flag_1755+1),fsr2h
	movff	(menu_handle_button@i),indf2

	line	2665
	goto	l15765
	line	2660
	
l15761:
	movlb	1	; () banked
	incf	((menu_handle_button@i))&0ffh
	
l15763:; BSR set to: 1

	movlw	01h
	addwf	((menu_handle_button@opts_1756))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	0
	movlb	1	; () banked
	addwfc	((menu_handle_button@opts_1756+1))&0ffh,w
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
	goto	u21541
	goto	u21540

u21541:
	goto	l15757
u21540:
	line	2670
	
l15765:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2671
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l15245
	line	2676
	
l15769:; BSR set to: 4

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21551
	goto	u21550

u21551:
	goto	l15803
u21550:
	line	2678
	
l15771:; BSR set to: 4

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2680
	
l15773:
		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21561
	goto	u21560

u21561:
	goto	l15779
u21560:
	line	2682
	
l15775:; BSR set to: 5

	movlw	low(0)
	movlb	4	; () banked
	movwf	((_current_menu))&0ffh
	line	2683
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu))&0ffh
	line	2684
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2685
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2686
	
l15777:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	2687
	goto	l1239
	line	2688
	
l15779:; BSR set to: 5

		movlw	03h-0
	cpfslt	((_menu))&0ffh
	goto	u21571
	goto	u21570

u21571:
	goto	l15791
u21570:
	line	2690
	
l15781:; BSR set to: 5

	movf	((_menu))&0ffh,w
	
	call	_rebuild_input_menu
	line	2691
	
l15783:
	movlw	low(01h)
	movlb	4	; () banked
	movwf	((_current_menu))&0ffh
	line	2692
	
l15785:; BSR set to: 4

	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu))&0ffh
	line	2693
	
l15787:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2694
	
l15789:; BSR set to: 5

	call	_menu_draw_input	;wreg free
	line	2695
	goto	l1239
	line	2696
	
l15791:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21581
	goto	u21580

u21581:
	goto	l1233
u21580:
	line	2698
	
l15793:; BSR set to: 5

	call	_rebuild_clock_menu	;wreg free
	line	2699
	
l15795:
	movlw	low(03h)
	movlb	4	; () banked
	movwf	((_current_menu))&0ffh
	line	2700
	
l15797:; BSR set to: 4

	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu))&0ffh
	line	2701
	
l15799:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2702
	
l15801:
	call	_menu_draw_clock	;wreg free
	goto	l1239
	line	2705
	
l15803:; BSR set to: 4

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21591
	goto	u21590

u21591:
	goto	l15869
u21590:
	line	2709
	
l15805:; BSR set to: 4

		movlw	05h-1
	movlb	5	; () banked
	cpfsgt	((_menu))&0ffh
	goto	u21601
	goto	u21600

u21601:
	goto	l15809
u21600:
	
l15807:; BSR set to: 5

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_menu_handle_button$1764+1))&0ffh
	movlw	low(0)
	movwf	((_menu_handle_button$1764))&0ffh
	goto	l15811
	
l15809:; BSR set to: 5

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
	movwf	((_menu_handle_button$1764))&0ffh
	clrf	((_menu_handle_button$1764+1))&0ffh
	
l15811:; BSR set to: 0

		movlw	low(menu_handle_button@buf_1762)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1762)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_333)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_333)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu_handle_button$1764),0+((c:?_sprintf)+06h)
	movff	(_menu_handle_button$1764+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	2710
	
l15813:
		movlw	low(menu_handle_button@buf_1762)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1762)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2712
		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21611
	goto	u21610

u21611:
	goto	l15827
u21610:
	goto	l15623
	line	2722
	
l15827:; BSR set to: 5

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
	goto	u21621
	goto	u21620
u21621:
	goto	l15867
u21620:
	line	2724
	
l15829:; BSR set to: 5

		movlw	low(STR_334)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_334)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2727
	
l15831:
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
	line	2730
	
l15833:
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21631
	goto	u21630
u21631:
	goto	l15837
u21630:
	line	2732
	
l15835:; BSR set to: 5

		movff	0+(_clock_menu+02h),(c:strcmp@s1)
	movff	1+(_clock_menu+02h),(c:strcmp@s1+1)

		movlw	low(STR_335)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_335)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u21641
	goto	u21640

u21641:
	movlw	1
	goto	u21650
u21640:
	movlw	0
u21650:
	movwf	((c:_enable_edit_flag))^00h,c
	line	2733
	goto	l15859
	line	2734
	
l15837:; BSR set to: 5

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21661
	goto	u21660

u21661:
	goto	l15849
u21660:
	line	2736
	
l15839:; BSR set to: 5

		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_336)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_336)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u21671
	goto	u21670

u21671:
	goto	l15843
u21670:
	line	2737
	
l15841:
	movlw	low(0)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l15859
	line	2738
	
l15843:
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
	goto	u21681
	goto	u21680

u21681:
	goto	l15847
u21680:
	line	2739
	
l15845:
	movlw	low(01h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l15859
	line	2741
	
l15847:
	movlw	low(02h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l15859
	line	2743
	
l15849:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21691
	goto	u21690

u21691:
	goto	l15855
u21690:
	line	2746
	
l15851:; BSR set to: 5

	movff	0+(_system_config+07h),0+(_menu+0Dh)
	clrf	(1+(_menu+0Dh))&0ffh
	line	2747
	
l15853:; BSR set to: 5

	movff	0+(_system_config+07h),(c:init_time_editor@value_seconds)
	clrf	((c:init_time_editor@value_seconds+1))^00h,c
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	line	2748
	goto	l15859
	line	2749
	
l15855:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21701
	goto	u21700

u21701:
	goto	l1426
u21700:
	line	2751
	
l15857:; BSR set to: 5

		movff	0+(_clock_menu+011h),(c:strcmp@s1)
	movff	1+(_clock_menu+011h),(c:strcmp@s1+1)

		movlw	low(STR_338)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_338)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u21711
	goto	u21710

u21711:
	movlw	1
	goto	u21720
u21710:
	movlw	0
u21720:
	movwf	((c:_display_edit_flag))^00h,c
	goto	l15859
	line	2754
	
l1426:; BSR set to: 5

	
l15859:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2755
	
l15861:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2756
	
l15863:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l15801
	line	2763
	
l15867:; BSR set to: 5

		movlw	low(STR_339)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_339)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1239
	line	2766
	
l15869:; BSR set to: 4

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21731
	goto	u21730

u21731:
	goto	l1233
u21730:
	line	2768
	
l15871:; BSR set to: 4

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2771
	
l15873:
		movlw	low(menu_handle_button@buf_1771)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1771)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_340)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_340)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Eh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+01Ch),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	2772
	
l15875:
		movlw	low(menu_handle_button@buf_1771)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1771)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2775
	
l15877:
	movlb	5	; () banked
	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u21741
	goto	u21740
u21741:
	goto	l15903
u21740:
	line	2777
	
l15879:; BSR set to: 5

	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u21751
	goto	u21750
u21751:
	goto	l15887
u21750:
	line	2780
	
l15881:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+03h))&0ffh
	line	2781
	movlw	low(0)
	movwf	(0+(_menu+01Dh))&0ffh
	line	2782
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2783
	
l15883:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2784
	
l15885:
		movlw	low(STR_341)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_341)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2785
	goto	l1239
	line	2786
	
l15887:; BSR set to: 5

		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u21761
	goto	u21760

u21761:
	goto	l15895
u21760:
	line	2789
	
l15889:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+03h))&0ffh
	line	2790
	movlw	low(0)
	movwf	(0+(_menu+01Dh))&0ffh
	line	2791
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2792
	
l15891:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2793
	
l15893:
		movlw	low(STR_342)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_342)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2794
	goto	l1239
	line	2795
	
l15895:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u21771
	goto	u21770

u21771:
	goto	l1233
u21770:
	line	2797
	
l15897:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Eh))&0ffh
	line	2798
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2799
	
l15899:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2800
	
l15901:
		movlw	low(STR_343)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_343)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1239
	line	2803
	
l15903:; BSR set to: 5

	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21781
	goto	u21780
u21781:
	goto	l15917
u21780:
	line	2805
	
l15905:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2806
	
l15907:
	call	_init_datetime_editor	;wreg free
	line	2807
	
l15909:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+01Eh))&0ffh
	line	2808
	
l15911:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Ch))&0ffh
	line	2809
	
l15913:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2810
	
l15915:
		movlw	low(STR_344)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_344)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2811
	goto	l1239
	line	2812
	
l15917:; BSR set to: 5

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21791
	goto	u21790

u21791:
	goto	l1233
u21790:
	line	2814
	
l15919:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2816
	
l15921:
	movlw	low(0)
	movlb	4	; () banked
	movwf	((_current_menu))&0ffh
	line	2817
	
l15923:; BSR set to: 4

	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu))&0ffh
	line	2818
	
l15925:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2819
	
l15927:; BSR set to: 5

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l15777
	line	2825
	
l15931:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u21801
	goto	u21800

u21801:
	goto	l1239
u21800:
	line	2828
	
l15933:; BSR set to: 2

		movlw	low(menu_handle_button@buf_1777)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1777)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_345)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_345)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2829
	
l15935:
		movlw	low(menu_handle_button@buf_1777)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1777)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2831
	
l15937:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2832
	
l15939:
	asmopt push
asmopt off
movlw  3
	movlb	0	; () banked
movwf	(??_menu_handle_button+0+0+1)&0ffh
movlw	8
movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	119
u22417:
decfsz	wreg,f
	bra	u22417
	decfsz	(??_menu_handle_button+0+0)&0ffh,f
	bra	u22417
	decfsz	(??_menu_handle_button+0+0+1)&0ffh,f
	bra	u22417
asmopt pop

	line	2833
	
l15941:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2835
	
l15943:
	movlb	4	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21811
	goto	u21810
u21811:
	goto	l15949
u21810:
	line	2837
	
l15945:; BSR set to: 4

	setf	((_current_menu))&0ffh
	line	2838
	
l15947:; BSR set to: 4

		movlw	low(STR_346)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_346)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2839
	goto	l1239
	line	2840
	
l15949:; BSR set to: 4

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21821
	goto	u21820

u21821:
	goto	l15957
u21820:
	line	2842
	
l15951:; BSR set to: 4

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	2843
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu))&0ffh
	line	2844
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2845
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2846
	
l15953:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	2847
	
l15955:
		movlw	low(STR_347)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_347)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2848
	goto	l1239
	line	2849
	
l15957:; BSR set to: 4

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21831
	goto	u21830

u21831:
	goto	l15965
u21830:
	line	2851
	
l15959:; BSR set to: 4

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	2852
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu))&0ffh
	line	2853
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2854
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2855
	
l15961:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	2856
	
l15963:
		movlw	low(STR_348)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_348)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2857
	goto	l1239
	line	2858
	
l15965:; BSR set to: 4

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21841
	goto	u21840

u21841:
	goto	l15973
u21840:
	line	2860
	
l15967:; BSR set to: 4

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	2861
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu))&0ffh
	line	2862
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2863
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2864
	
l15969:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	2865
	
l15971:
		movlw	low(STR_349)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_349)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2866
	goto	l1239
	line	2867
	
l15973:; BSR set to: 4

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21851
	goto	u21850

u21851:
	goto	l1233
u21850:
	line	2869
	
l15975:; BSR set to: 4

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	2870
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu))&0ffh
	line	2871
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2872
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2873
	
l15977:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	2874
	
l15979:
		movlw	low(STR_350)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_350)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2878
	
l1239:
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
	
l13099:
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
	
l13101:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	128
	
l13103:
	movlb	0	; () banked
	movf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u17391
	goto	u17390
u17391:
	goto	l150
u17390:
	line	130
	
l13105:; BSR set to: 0

	movlw	low(01h)
	movwf	((_relay_state))&0ffh	;volatile
	line	132
	movf	((trigger_relay_pulse@latch_mode))&0ffh,w
	btfsc	status,2
	goto	u17401
	goto	u17400
u17401:
	goto	l13111
u17400:
	line	135
	
l13107:; BSR set to: 0

	movlw	high(0)
	movlb	4	; () banked
	movwf	((_relay_counter+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_relay_counter))&0ffh	;volatile
	line	136
	
l13109:; BSR set to: 4

		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	137
	goto	l13117
	line	141
	
l13111:; BSR set to: 0

	movlb	7	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	mullw	064h
	movff	prodl,(_relay_counter)	;volatile
	movff	prodh,(_relay_counter+1)	;volatile
	line	142
	
l13113:; BSR set to: 7

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
	
l13115:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	146
	
l13117:
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
	
l14209:; BSR set to: 3

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
	
l14211:; BSR set to: 0

		movlw	low(rtc_set_time@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_351)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_351)
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
	
l14213:
		movlw	low(rtc_set_time@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	96
	
l14215:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u18971
	goto	u18970
u18971:
	goto	l14221
u18970:
	line	97
	
l14217:
	movlw	(01h)&0ffh
	goto	l1713
	line	98
	
l14221:
	asmopt push
asmopt off
	movlw	133
u22427:
decfsz	wreg,f
	bra	u22427
	nop
asmopt pop

	line	100
	
l14223:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u18981
	goto	u18980
u18981:
	goto	l14229
u18980:
	goto	l14217
	line	102
	
l14229:
	asmopt push
asmopt off
	movlw	133
u22437:
decfsz	wreg,f
	bra	u22437
	nop
asmopt pop

	line	104
	
l14231:
	movlw	(0)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u18991
	goto	u18990
u18991:
	goto	l14237
u18990:
	goto	l14217
	line	106
	
l14237:
	asmopt push
asmopt off
	movlw	133
u22447:
decfsz	wreg,f
	bra	u22447
	nop
asmopt pop

	line	108
	
l14239:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((rtc_set_time@i))&0ffh
	line	110
	
l14245:; BSR set to: 0

	movf	((rtc_set_time@i))&0ffh,w
	addlw	low(rtc_set_time@data)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19001
	goto	u19000
u19001:
	goto	l14251
u19000:
	goto	l14217
	line	112
	
l14251:
	asmopt push
asmopt off
	movlw	133
u22457:
decfsz	wreg,f
	bra	u22457
	nop
asmopt pop

	line	108
	
l14253:
	movlb	0	; () banked
	incf	((rtc_set_time@i))&0ffh
		movlw	07h-1
	cpfsgt	((rtc_set_time@i))&0ffh
	goto	u19011
	goto	u19010

u19011:
	goto	l14245
u19010:
	line	115
	
l14255:; BSR set to: 0

	call	_i2c_stop	;wreg free
	line	116
	
l14257:
	asmopt push
asmopt off
	movlw	228
u22467:
	nop2
	nop2
decfsz	wreg,f
	bra	u22467
	nop2
	nop2
asmopt pop

	line	117
	
l14259:
	movlw	(0)&0ffh
	line	118
	
l1713:
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
	
l13095:
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
	
l1707:
	return	;funcret
	callstack 0
GLOBAL	__end_of_dec_to_bcd
	__end_of_dec_to_bcd:
	signat	_dec_to_bcd,4217
	global	_rebuild_utility_menu

;; *************** function _rebuild_utility_menu *****************
;; Defined at:
;;		line 1620 in file "src\menu.c"
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
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text17,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1620
global __ptext17
__ptext17:
psect	text17
	file	"src\menu.c"
	line	1620
	
_rebuild_utility_menu:
;incstack = 0
	callstack 25
	line	1625
	
l14179:
	movlw	low(0)
	movwf	((c:rebuild_utility_menu@i))^00h,c
	line	1627
	
l14185:
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
	line	1628
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
	line	1625
	
l14187:
	incf	((c:rebuild_utility_menu@i))^00h,c
	
l14189:
		movlw	09h-1
	cpfsgt	((c:rebuild_utility_menu@i))^00h,c
	goto	u18961
	goto	u18960

u18961:
	goto	l14185
u18960:
	line	1632
	
l14191:
		movlw	low(STR_270)
	movlb	6	; () banked
	movwf	(0+(_utility_menu+02h))&0ffh
	movlw	high(STR_270)
	movwf	(1+(_utility_menu+02h))&0ffh

	line	1633
		movlw	low(STR_271)
	movwf	(0+(_utility_menu+07h))&0ffh
	movlw	high(STR_271)
	movwf	(1+(_utility_menu+07h))&0ffh

	line	1634
		movlw	low(STR_272)
	movwf	(0+(_utility_menu+0Ch))&0ffh
	movlw	high(STR_272)
	movwf	(1+(_utility_menu+0Ch))&0ffh

	line	1635
		movlw	low(_value_log_entries)
	movwf	(0+(_utility_menu+011h))&0ffh
	movlw	high(_value_log_entries)
	movwf	(1+(_utility_menu+011h))&0ffh

	line	1636
		movlw	low(_value_menu_timeout)
	movwf	(0+(_utility_menu+016h))&0ffh
	movlw	high(_value_menu_timeout)
	movwf	(1+(_utility_menu+016h))&0ffh

	line	1637
		movlw	low(_value_contrast)
	movwf	(0+(_utility_menu+01Bh))&0ffh
	movlw	high(_value_contrast)
	movwf	(1+(_utility_menu+01Bh))&0ffh

	line	1638
		movlw	low(_value_brightness)
	movwf	(0+(_utility_menu+020h))&0ffh
	movlw	high(_value_brightness)
	movwf	(1+(_utility_menu+020h))&0ffh

	line	1639
		movlw	low(_value_pwr_fail)
	movwf	(0+(_utility_menu+025h))&0ffh
	movlw	high(_value_pwr_fail)
	movwf	(1+(_utility_menu+025h))&0ffh

	line	1640
		movlw	low(STR_273)
	movwf	(0+(_utility_menu+02Ah))&0ffh
	movlw	high(STR_273)
	movwf	(1+(_utility_menu+02Ah))&0ffh

	line	1643
	
l14193:; BSR set to: 6

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
	line	1646
	
l14195:
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
	line	1647
	
l14197:
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
	line	1648
	
l14199:
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
	line	1651
	
l14201:
	movff	0+(_system_config+012h),(c:___lwdiv@dividend)
	movff	1+(_system_config+012h),(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:_rebuild_utility_menu$3226)
	movff	1+?___lwdiv,(c:_rebuild_utility_menu$3226+1)
	
l14203:
	movff	0+(_system_config+012h),(c:___lwmod@dividend)
	movff	1+(_system_config+012h),(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movff	0+?___lwmod,(c:_rebuild_utility_menu$3227)
	movff	1+?___lwmod,(c:_rebuild_utility_menu$3227+1)
	
l14205:
		movlw	low(_value_pwr_fail)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_pwr_fail)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_278)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_278)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:_rebuild_utility_menu$3226),0+((c:?_sprintf)+04h)
	movff	(c:_rebuild_utility_menu$3226+1),1+((c:?_sprintf)+04h)
	movff	(c:_rebuild_utility_menu$3227),0+((c:?_sprintf)+06h)
	movff	(c:_rebuild_utility_menu$3227+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1653
	
l14207:
	movlw	low(09h)
	movlb	5	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	1654
	
l1073:; BSR set to: 5

	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_utility_menu
	__end_of_rebuild_utility_menu:
	signat	_rebuild_utility_menu,89
	global	_rebuild_input_menu

;; *************** function _rebuild_input_menu *****************
;; Defined at:
;;		line 915 in file "src\menu.c"
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
;;		On entry : 3E/4
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
	line	915
global __ptext18
__ptext18:
psect	text18
	file	"src\menu.c"
	line	915
	
_rebuild_input_menu:; BSR set to: 5

;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((rebuild_input_menu@input_num))&0ffh
	line	918
	
l13783:
	movff	(rebuild_input_menu@input_num),(_current_input)
	line	921
	
l13785:
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
	line	922
	
l13787:; BSR set to: 0

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
	line	925
	
l13789:; BSR set to: 0

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
	goto	u18561
	goto	u18560
u18561:
	goto	l13793
u18560:
	
l13791:; BSR set to: 0

		movlw	low(STR_175)
	movwf	((_rebuild_input_menu$1347))&0ffh
	movlw	high(STR_175)
	movwf	((_rebuild_input_menu$1347+1))&0ffh

	goto	l13795
	
l13793:; BSR set to: 0

		movlw	low(STR_174)
	movwf	((_rebuild_input_menu$1347))&0ffh
	movlw	high(STR_174)
	movwf	((_rebuild_input_menu$1347+1))&0ffh

	
l13795:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_173)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_173)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_input_menu$1347),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$1347+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	927
	
l13797:
	movlb	0	; () banked
	movf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u18571
	goto	u18570
u18571:
	goto	l13903
u18570:
	line	929
	
l13799:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_176)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_176)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	930
	
l13801:
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
	line	931
	
l13803:
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
	line	932
	
l13805:
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
	line	935
	
l13807:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3224)
	movff	1+?___lwdiv,(_rebuild_input_menu$3224+1)
	
l13809:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3225)
	movff	1+?___lwmod,(_rebuild_input_menu$3225+1)
	
l13811:
		movlw	low(_value_highbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_highbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_180)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_180)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3224),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3224+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3225),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3225+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	936
	
l13813:
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
	line	939
	
l13815:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3224)
	movff	1+?___lwdiv,(_rebuild_input_menu$3224+1)
	
l13817:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3225)
	movff	1+?___lwmod,(_rebuild_input_menu$3225+1)
	
l13819:
		movlw	low(_value_plpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_plpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_182)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_182)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3224),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3224+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3225),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3225+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	942
	
l13821:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3224)
	movff	1+?___lwdiv,(_rebuild_input_menu$3224+1)
	
l13823:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3225)
	movff	1+?___lwmod,(_rebuild_input_menu$3225+1)
	
l13825:
		movlw	low(_value_slpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_slpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_183)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_183)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3224),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3224+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3225),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3225+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	945
	
l13827:
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
	goto	u18581
	goto	u18580
u18581:
	goto	l13835
u18580:
	
l13829:; BSR set to: 0

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
	goto	u18591
	goto	u18590

u18591:
	goto	l13833
u18590:
	
l13831:; BSR set to: 0

		movlw	low(STR_186)
	movwf	((_rebuild_input_menu$1362))&0ffh
	movlw	high(STR_186)
	movwf	((_rebuild_input_menu$1362+1))&0ffh

	goto	l749
	
l13833:; BSR set to: 0

		movlw	low(STR_185)
	movwf	((_rebuild_input_menu$1362))&0ffh
	movlw	high(STR_185)
	movwf	((_rebuild_input_menu$1362+1))&0ffh

	
l749:; BSR set to: 0

		movff	(_rebuild_input_menu$1362),(_rebuild_input_menu$1361)
	movff	(_rebuild_input_menu$1362+1),(_rebuild_input_menu$1361+1)

	goto	l13837
	
l13835:; BSR set to: 0

		movlw	low(STR_184)
	movwf	((_rebuild_input_menu$1361))&0ffh
	movlw	high(STR_184)
	movwf	((_rebuild_input_menu$1361+1))&0ffh

	
l13837:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1361),(c:strcpy@from)
	movff	(_rebuild_input_menu$1361+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	947
	
l13839:
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
	goto	u18601
	goto	u18600
u18601:
	goto	l13847
u18600:
	
l13841:; BSR set to: 0

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
	goto	u18611
	goto	u18610

u18611:
	goto	l13845
u18610:
	
l13843:; BSR set to: 0

		movlw	low(STR_189)
	movwf	((_rebuild_input_menu$1369))&0ffh
	movlw	high(STR_189)
	movwf	((_rebuild_input_menu$1369+1))&0ffh

	goto	l757
	
l13845:; BSR set to: 0

		movlw	low(STR_188)
	movwf	((_rebuild_input_menu$1369))&0ffh
	movlw	high(STR_188)
	movwf	((_rebuild_input_menu$1369+1))&0ffh

	
l757:; BSR set to: 0

		movff	(_rebuild_input_menu$1369),(_rebuild_input_menu$1368)
	movff	(_rebuild_input_menu$1369+1),(_rebuild_input_menu$1368+1)

	goto	l13849
	
l13847:; BSR set to: 0

		movlw	low(STR_187)
	movwf	((_rebuild_input_menu$1368))&0ffh
	movlw	high(STR_187)
	movwf	((_rebuild_input_menu$1368+1))&0ffh

	
l13849:; BSR set to: 0

		movlw	low(_value_rlyplp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyplp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1368),(c:strcpy@from)
	movff	(_rebuild_input_menu$1368+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	949
	
l13851:
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
	goto	u18621
	goto	u18620
u18621:
	goto	l13859
u18620:
	
l13853:; BSR set to: 0

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
	goto	u18631
	goto	u18630

u18631:
	goto	l13857
u18630:
	
l13855:; BSR set to: 0

		movlw	low(STR_192)
	movwf	((_rebuild_input_menu$1376))&0ffh
	movlw	high(STR_192)
	movwf	((_rebuild_input_menu$1376+1))&0ffh

	goto	l765
	
l13857:; BSR set to: 0

		movlw	low(STR_191)
	movwf	((_rebuild_input_menu$1376))&0ffh
	movlw	high(STR_191)
	movwf	((_rebuild_input_menu$1376+1))&0ffh

	
l765:; BSR set to: 0

		movff	(_rebuild_input_menu$1376),(_rebuild_input_menu$1375)
	movff	(_rebuild_input_menu$1376+1),(_rebuild_input_menu$1375+1)

	goto	l13861
	
l13859:; BSR set to: 0

		movlw	low(STR_190)
	movwf	((_rebuild_input_menu$1375))&0ffh
	movlw	high(STR_190)
	movwf	((_rebuild_input_menu$1375+1))&0ffh

	
l13861:; BSR set to: 0

		movlw	low(_value_rlyslp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyslp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1375),(c:strcpy@from)
	movff	(_rebuild_input_menu$1375+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	950
	
l13863:
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
	goto	u18641
	goto	u18640
u18641:
	goto	l13867
u18640:
	
l13865:; BSR set to: 0

		movlw	low(STR_194)
	movwf	((_rebuild_input_menu$1380))&0ffh
	movlw	high(STR_194)
	movwf	((_rebuild_input_menu$1380+1))&0ffh

	goto	l13869
	
l13867:; BSR set to: 0

		movlw	low(STR_193)
	movwf	((_rebuild_input_menu$1380))&0ffh
	movlw	high(STR_193)
	movwf	((_rebuild_input_menu$1380+1))&0ffh

	
l13869:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1380),(c:strcpy@from)
	movff	(_rebuild_input_menu$1380+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	953
	
l13871:
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
	line	956
	
l13873:
		movlw	low(_value_enable)
	movlb	5	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	957
	
l13875:; BSR set to: 5

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	958
	
l13877:; BSR set to: 5

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	959
	
l13879:; BSR set to: 5

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	960
	
l13881:; BSR set to: 5

		movlw	low(_value_hi_pressure)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_hi_pressure)
	movwf	(1+(_input_menu+016h))&0ffh

	line	961
	
l13883:; BSR set to: 5

		movlw	low(_value_highbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_highbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	962
	
l13885:; BSR set to: 5

		movlw	low(_value_low_pressure)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_pressure)
	movwf	(1+(_input_menu+020h))&0ffh

	line	963
	
l13887:; BSR set to: 5

		movlw	low(_value_plpbp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_plpbp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	964
	
l13889:; BSR set to: 5

		movlw	low(_value_slpbp)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_slpbp)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	965
	
l13891:; BSR set to: 5

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	966
	
l13893:; BSR set to: 5

		movlw	low(_value_rlyplp)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_rlyplp)
	movwf	(1+(_input_menu+034h))&0ffh

	line	967
	
l13895:; BSR set to: 5

		movlw	low(_value_rlyslp)
	movwf	(0+(_input_menu+039h))&0ffh
	movlw	high(_value_rlyslp)
	movwf	(1+(_input_menu+039h))&0ffh

	line	968
	
l13897:; BSR set to: 5

		movlw	low(_value_display)
	movwf	(0+(_input_menu+03Eh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+03Eh))&0ffh

	line	969
	
l13899:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_input_menu+043h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+043h))&0ffh

	line	971
	
l13901:; BSR set to: 5

	movlw	low(0Eh)
	movwf	(0+(_menu+02h))&0ffh
	line	972
	goto	l14069
	line	973
	
l13903:; BSR set to: 0

		decf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u18651
	goto	u18650

u18651:
	goto	l13961
u18650:
	line	975
	
l13905:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_195)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_195)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	976
	
l13907:
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
	line	977
	
l13909:
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
	line	978
	
l13911:
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
	line	981
	
l13913:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3224)
	movff	1+?___lwdiv,(_rebuild_input_menu$3224+1)
	
l13915:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3225)
	movff	1+?___lwmod,(_rebuild_input_menu$3225+1)
	
l13917:
		movlw	low(_value_high_tbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_tbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_199)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_199)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3224),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3224+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3225),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3225+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	983
	
l13919:
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
	goto	u18661
	goto	u18660
u18661:
	goto	l13927
u18660:
	
l13921:; BSR set to: 0

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
	goto	u18671
	goto	u18670

u18671:
	goto	l13925
u18670:
	
l13923:; BSR set to: 0

		movlw	low(STR_202)
	movwf	((_rebuild_input_menu$1395))&0ffh
	movlw	high(STR_202)
	movwf	((_rebuild_input_menu$1395+1))&0ffh

	goto	l779
	
l13925:; BSR set to: 0

		movlw	low(STR_201)
	movwf	((_rebuild_input_menu$1395))&0ffh
	movlw	high(STR_201)
	movwf	((_rebuild_input_menu$1395+1))&0ffh

	
l779:; BSR set to: 0

		movff	(_rebuild_input_menu$1395),(_rebuild_input_menu$1394)
	movff	(_rebuild_input_menu$1395+1),(_rebuild_input_menu$1394+1)

	goto	l13929
	
l13927:; BSR set to: 0

		movlw	low(STR_200)
	movwf	((_rebuild_input_menu$1394))&0ffh
	movlw	high(STR_200)
	movwf	((_rebuild_input_menu$1394+1))&0ffh

	
l13929:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1394),(c:strcpy@from)
	movff	(_rebuild_input_menu$1394+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	984
	
l13931:
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
	goto	u18681
	goto	u18680
u18681:
	goto	l13935
u18680:
	
l13933:; BSR set to: 0

		movlw	low(STR_204)
	movwf	((_rebuild_input_menu$1399))&0ffh
	movlw	high(STR_204)
	movwf	((_rebuild_input_menu$1399+1))&0ffh

	goto	l13937
	
l13935:; BSR set to: 0

		movlw	low(STR_203)
	movwf	((_rebuild_input_menu$1399))&0ffh
	movlw	high(STR_203)
	movwf	((_rebuild_input_menu$1399+1))&0ffh

	
l13937:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1399),(c:strcpy@from)
	movff	(_rebuild_input_menu$1399+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	987
	
l13939:
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
	line	990
	
l13941:
		movlw	low(_value_enable)
	movlb	5	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	991
	
l13943:; BSR set to: 5

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	992
	
l13945:; BSR set to: 5

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	993
	
l13947:; BSR set to: 5

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	994
	
l13949:; BSR set to: 5

		movlw	low(_value_high_temp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_high_temp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	995
	
l13951:; BSR set to: 5

		movlw	low(_value_high_tbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_high_tbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	996
	
l13953:; BSR set to: 5

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+020h))&0ffh

	line	997
	
l13955:; BSR set to: 5

		movlw	low(_value_display)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+025h))&0ffh

	line	998
	
l13957:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	1000
	
l13959:; BSR set to: 5

	movlw	low(09h)
	movwf	(0+(_menu+02h))&0ffh
	line	1001
	goto	l14069
	line	1002
	
l13961:; BSR set to: 0

		movlw	2
	xorwf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u18691
	goto	u18690

u18691:
	goto	l14069
u18690:
	line	1004
	
l13963:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_205)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_205)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1005
	
l13965:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfsc	status,2
	goto	u18701
	goto	u18700
u18701:
	goto	l13969
u18700:
	
l13967:; BSR set to: 0

		movlw	low(STR_207)
	movwf	((_rebuild_input_menu$1404))&0ffh
	movlw	high(STR_207)
	movwf	((_rebuild_input_menu$1404+1))&0ffh

	goto	l13971
	
l13969:; BSR set to: 0

		movlw	low(STR_206)
	movwf	((_rebuild_input_menu$1404))&0ffh
	movlw	high(STR_206)
	movwf	((_rebuild_input_menu$1404+1))&0ffh

	
l13971:; BSR set to: 0

		movlw	low(_value_flow_type)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_type)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1404),(c:strcpy@from)
	movff	(_rebuild_input_menu$1404+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1006
	
l13973:
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
	goto	u18711
	goto	u18710
u18711:
	goto	l13977
u18710:
	
l13975:; BSR set to: 0

		movlw	low(STR_209)
	movwf	((_rebuild_input_menu$1408))&0ffh
	movlw	high(STR_209)
	movwf	((_rebuild_input_menu$1408+1))&0ffh

	goto	l13979
	
l13977:; BSR set to: 0

		movlw	low(STR_208)
	movwf	((_rebuild_input_menu$1408))&0ffh
	movlw	high(STR_208)
	movwf	((_rebuild_input_menu$1408+1))&0ffh

	
l13979:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1408),(c:strcpy@from)
	movff	(_rebuild_input_menu$1408+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1008
	
l13981:
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
	goto	u18721
	goto	u18720
u18721:
	goto	l13989
u18720:
	
l13983:; BSR set to: 0

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
	goto	u18731
	goto	u18730

u18731:
	goto	l13987
u18730:
	
l13985:; BSR set to: 0

		movlw	low(STR_212)
	movwf	((_rebuild_input_menu$1415))&0ffh
	movlw	high(STR_212)
	movwf	((_rebuild_input_menu$1415+1))&0ffh

	goto	l801
	
l13987:; BSR set to: 0

		movlw	low(STR_211)
	movwf	((_rebuild_input_menu$1415))&0ffh
	movlw	high(STR_211)
	movwf	((_rebuild_input_menu$1415+1))&0ffh

	
l801:; BSR set to: 0

		movff	(_rebuild_input_menu$1415),(_rebuild_input_menu$1414)
	movff	(_rebuild_input_menu$1415+1),(_rebuild_input_menu$1414+1)

	goto	l13991
	
l13989:; BSR set to: 0

		movlw	low(STR_210)
	movwf	((_rebuild_input_menu$1414))&0ffh
	movlw	high(STR_210)
	movwf	((_rebuild_input_menu$1414+1))&0ffh

	
l13991:; BSR set to: 0

		movlw	low(_value_rlylow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlylow)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1414),(c:strcpy@from)
	movff	(_rebuild_input_menu$1414+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1010
	
l13993:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfss	status,2
	goto	u18741
	goto	u18740
u18741:
	goto	l14041
u18740:
	line	1012
	
l13995:; BSR set to: 0

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
	goto	u18751
	goto	u18750
u18751:
	goto	l13999
u18750:
	
l13997:; BSR set to: 0

		movlw	low(STR_214)
	movwf	((_rebuild_input_menu$1419))&0ffh
	movlw	high(STR_214)
	movwf	((_rebuild_input_menu$1419+1))&0ffh

	goto	l14001
	
l13999:; BSR set to: 0

		movlw	low(STR_213)
	movwf	((_rebuild_input_menu$1419))&0ffh
	movlw	high(STR_213)
	movwf	((_rebuild_input_menu$1419+1))&0ffh

	
l14001:; BSR set to: 0

		movlw	low(_value_flow_units)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_units)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1419),(c:strcpy@from)
	movff	(_rebuild_input_menu$1419+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1013
	
l14003:
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
	line	1014
	
l14005:
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
	line	1015
	
l14007:
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
	line	1018
	
l14009:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3224)
	movff	1+?___lwdiv,(_rebuild_input_menu$3224+1)
	
l14011:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3225)
	movff	1+?___lwmod,(_rebuild_input_menu$3225+1)
	
l14013:
		movlw	low(_value_low_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_218)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_218)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3224),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3224+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3225),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3225+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1021
	
l14015:
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
	line	1024
	
l14017:
		movlw	low(_value_enable)
	movlb	5	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	1025
	
l14019:; BSR set to: 5

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	1026
	
l14021:; BSR set to: 5

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	1027
	
l14023:; BSR set to: 5

		movlw	low(_value_flow_units)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_flow_units)
	movwf	(1+(_input_menu+011h))&0ffh

	line	1028
	
l14025:; BSR set to: 5

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+016h))&0ffh

	line	1029
	
l14027:; BSR set to: 5

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	1030
	
l14029:; BSR set to: 5

		movlw	low(_value_low_flow)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_flow)
	movwf	(1+(_input_menu+020h))&0ffh

	line	1031
	
l14031:; BSR set to: 5

		movlw	low(_value_low_flow_bp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_low_flow_bp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	1032
	
l14033:; BSR set to: 5

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	1033
	
l14035:; BSR set to: 5

		movlw	low(_value_display)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	1034
	
l14037:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+034h))&0ffh

	line	1036
	
l14039:; BSR set to: 5

	movlw	low(0Bh)
	movwf	(0+(_menu+02h))&0ffh
	line	1037
	goto	l14069
	line	1040
	
l14041:; BSR set to: 0

		movlw	low(_value_no_flow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_no_flow)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_219)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_219)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1043
	
l14043:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3224)
	movff	1+?___lwdiv,(_rebuild_input_menu$3224+1)
	
l14045:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3225)
	movff	1+?___lwmod,(_rebuild_input_menu$3225+1)
	
l14047:
		movlw	low(_value_no_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_no_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_220)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_220)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3224),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3224+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3225),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3225+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1046
	
l14049:
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
	line	1049
	
l14051:
		movlw	low(_value_enable)
	movlb	5	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	1050
	
l14053:; BSR set to: 5

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	1051
	
l14055:; BSR set to: 5

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	1052
	
l14057:; BSR set to: 5

		movlw	low(_value_no_flow)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_no_flow)
	movwf	(1+(_input_menu+011h))&0ffh

	line	1053
	
l14059:; BSR set to: 5

		movlw	low(_value_no_flow_bp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_no_flow_bp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	1054
	
l14061:; BSR set to: 5

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	1055
	
l14063:; BSR set to: 5

		movlw	low(_value_display)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+020h))&0ffh

	line	1056
	
l14065:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+025h))&0ffh

	line	1058
	
l14067:; BSR set to: 5

	movlw	low(08h)
	movwf	(0+(_menu+02h))&0ffh
	line	1065
	
l14069:
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
	line	1066
	
l14071:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1067
	
l808:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_input_menu
	__end_of_rebuild_input_menu:
	signat	_rebuild_input_menu,4217
	global	_rebuild_clock_menu

;; *************** function _rebuild_clock_menu *****************
;; Defined at:
;;		line 1577 in file "src\menu.c"
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
psect	text19,class=CODE,space=0,reloc=2,group=0
	line	1577
global __ptext19
__ptext19:
psect	text19
	file	"src\menu.c"
	line	1577
	
_rebuild_clock_menu:
;incstack = 0
	callstack 24
	line	1583
	
l14129:; BSR set to: 5

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
	line	1584
	
l14131:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1587
	
l14133:
	movlb	7	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u18931
	goto	u18930
u18931:
	goto	l14137
u18930:
	
l14135:; BSR set to: 7

		movlw	low(STR_262)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1565))&0ffh
	movlw	high(STR_262)
	movwf	((_rebuild_clock_menu$1565+1))&0ffh

	goto	l14139
	
l14137:; BSR set to: 7

		movlw	low(STR_261)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1565))&0ffh
	movlw	high(STR_261)
	movwf	((_rebuild_clock_menu$1565+1))&0ffh

	
l14139:; BSR set to: 0

		movlw	low(_value_clock_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_clock_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_260)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_260)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_clock_menu$1565),0+((c:?_sprintf)+04h)
	movff	(_rebuild_clock_menu$1565+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	1589
	
l14141:
	movlb	7	; () banked
	movf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u18941
	goto	u18940
u18941:
	goto	l14149
u18940:
	
l14143:; BSR set to: 7

		decf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u18951
	goto	u18950

u18951:
	goto	l14147
u18950:
	
l14145:; BSR set to: 7

		movlw	low(STR_265)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1572))&0ffh
	movlw	high(STR_265)
	movwf	((_rebuild_clock_menu$1572+1))&0ffh

	goto	l1065
	
l14147:; BSR set to: 7

		movlw	low(STR_264)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1572))&0ffh
	movlw	high(STR_264)
	movwf	((_rebuild_clock_menu$1572+1))&0ffh

	
l1065:; BSR set to: 0

		movff	(_rebuild_clock_menu$1572),(_rebuild_clock_menu$1571)
	movff	(_rebuild_clock_menu$1572+1),(_rebuild_clock_menu$1571+1)

	goto	l14151
	
l14149:; BSR set to: 7

		movlw	low(STR_263)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1571))&0ffh
	movlw	high(STR_263)
	movwf	((_rebuild_clock_menu$1571+1))&0ffh

	
l14151:; BSR set to: 0

		movlw	low(_value_end_runtime)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_end_runtime)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_clock_menu$1571),(c:strcpy@from)
	movff	(_rebuild_clock_menu$1571+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1594
	
l14153:
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
	line	1596
	
l14155:
		movlw	low(_value_clock_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_clock_display)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_267)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_267)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1598
	
l14157:
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
	line	1599
	
l14159:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1602
	
l14161:
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
	line	1605
	
l14163:
		movlw	low(_value_clock_enable)
	movlb	5	; () banked
	movwf	(0+(_clock_menu+02h))&0ffh
	movlw	high(_value_clock_enable)
	movwf	(1+(_clock_menu+02h))&0ffh

	line	1606
	
l14165:; BSR set to: 5

		movlw	low(_value_end_runtime)
	movwf	(0+(_clock_menu+07h))&0ffh
	movlw	high(_value_end_runtime)
	movwf	(1+(_clock_menu+07h))&0ffh

	line	1607
	
l14167:; BSR set to: 5

		movlw	low(_value_relay_pulse)
	movwf	(0+(_clock_menu+0Ch))&0ffh
	movlw	high(_value_relay_pulse)
	movwf	(1+(_clock_menu+0Ch))&0ffh

	line	1608
	
l14169:; BSR set to: 5

		movlw	low(_value_clock_display)
	movwf	(0+(_clock_menu+011h))&0ffh
	movlw	high(_value_clock_display)
	movwf	(1+(_clock_menu+011h))&0ffh

	line	1609
	
l14171:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_clock_menu+016h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_clock_menu+016h))&0ffh

	line	1611
	
l14173:; BSR set to: 5

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	1613
	
l14175:; BSR set to: 5

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
	line	1614
	
l14177:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1615
	
l1066:
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
;;		On entry : 0/3
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
	
l13339:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u17881
	goto	u17880
u17881:
	goto	l13343
u17880:
	goto	l634
	line	553
	
l13343:; BSR set to: 5

	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u17891
	goto	u17890
u17891:
	goto	l13349
u17890:
	
l13345:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17901
	goto	u17900
u17901:
	goto	l13349
u17900:
	line	555
	
l13347:; BSR set to: 5

	movlw	low(020h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	556
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	557
	goto	l13351
	line	560
	
l13349:; BSR set to: 5

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
	
l13351:; BSR set to: 0

	movlw	low(03Ah)
	movwf	(0+(menu_update_time_value@value_buf+02h))&0ffh
	line	568
	
l13353:; BSR set to: 0

	movlb	5	; () banked
		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u17911
	goto	u17910

u17911:
	goto	l13359
u17910:
	
l13355:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17921
	goto	u17920
u17921:
	goto	l13359
u17920:
	line	570
	
l13357:; BSR set to: 5

	movlw	low(020h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	571
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	572
	goto	l13361
	line	575
	
l13359:; BSR set to: 5

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
	
l13361:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(menu_update_time_value@value_buf+05h))&0ffh
	line	582
	
l13363:; BSR set to: 0

		movlw	3
	movlb	4	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17931
	goto	u17930

u17931:
	goto	l13371
u17930:
	
l13365:; BSR set to: 4

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17941
	goto	u17940

u17941:
	goto	l13371
u17940:
	line	584
	
l13367:; BSR set to: 5

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
	goto	l634
	line	590
	
l13371:
	movlb	4	; () banked
		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u17951
	goto	u17950

u17951:
	goto	l13375
u17950:
	goto	l634
	line	594
	
l13375:; BSR set to: 4

	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_time_value@screen_line))&0ffh
	line	595
		movlw	03h-1
	cpfsgt	((menu_update_time_value@screen_line))&0ffh
	goto	u17961
	goto	u17960

u17961:
	goto	l641
u17960:
	goto	l634
	line	596
	
l641:; BSR set to: 0

	line	598
	movff	(_menu),(menu_update_time_value@item_idx)
	line	602
	
l13379:; BSR set to: 0

	movlb	4	; () banked
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
	movlb	4	; () banked
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
	
l13381:; BSR set to: 0

	movff	(menu_update_time_value@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_update_time_value@flow_type),(c:is_time_field@flow_type)
	movf	((menu_update_time_value@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfss	status,2
	goto	u17971
	goto	u17970
u17971:
	goto	l13385
u17970:
	goto	l634
	line	612
	
l13385:
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
	
l13387:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	617
	
l13389:
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
	
l13391:
	line	623
	
l13393:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	624
	
l13395:
		movlw	low(STR_145)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_145)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	626
	
l13397:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	627
	
l13399:
		movlw	low(STR_146)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_146)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	628
	
l13401:
		movlw	low(menu_update_time_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	629
	
l13403:
		movlw	low(STR_147)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_147)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	630
	
l634:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_time_value
	__end_of_menu_update_time_value:
	signat	_menu_update_time_value,89
	global	_menu_draw_clock

;; *************** function _menu_draw_clock *****************
;; Defined at:
;;		line 1659 in file "src\menu.c"
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
psect	text21,class=CODE,space=0,reloc=2,group=0
	line	1659
global __ptext21
__ptext21:
psect	text21
	file	"src\menu.c"
	line	1659
	
_menu_draw_clock:
;incstack = 0
	callstack 23
	line	1662
	
l12573:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1663
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_279)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_279)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1666
	
l12575:
	movlw	low(0)
	movwf	((c:menu_draw_clock@i))^00h,c
	goto	l12655
	line	1668
	
l12577:; BSR set to: 5

	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_clock@i))^00h,c,w
	movwf	((c:menu_draw_clock@item_idx))^00h,c
	line	1669
	
l12579:; BSR set to: 5

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1672
	
l12581:
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
	line	1676
	
l12583:
	line	1678
	
l12585:
	movf	((c:menu_draw_clock@item_idx))^00h,c,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16401
	goto	u16400

u16401:
	goto	l12615
u16400:
	line	1680
	
l12587:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u16411
	goto	u16410
u16411:
	goto	l12611
u16410:
	line	1682
	
l12589:; BSR set to: 5

	movlw	low(02h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	line	1685
	
l12591:; BSR set to: 5

		movlw	2
	xorwf	((c:menu_draw_clock@item_idx))^00h,c,w
	btfsc	status,2
	goto	u16421
	goto	u16420

u16421:
	goto	l12595
u16420:
	line	1687
	
l12593:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u16431
	goto	u16430
u16431:
	goto	l12597
u16430:
	line	1690
	
l12595:; BSR set to: 5

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
	line	1691
	goto	l12619
	line	1695
	
l12597:; BSR set to: 5

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
	line	1696
	
l12599:
	movlw	low(0)
	movwf	((c:menu_draw_clock@j))^00h,c
	goto	l12605
	line	1697
	
l12601:
	movf	((c:menu_draw_clock@j))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1696
	
l12603:
	incf	((c:menu_draw_clock@j))^00h,c
	
l12605:
		movf	((c:menu_draw_clock@val_len))^00h,c,w
	subwf	((c:menu_draw_clock@j))^00h,c,w
	btfss	status,0
	goto	u16441
	goto	u16440

u16441:
	goto	l12601
u16440:
	line	1698
	
l12607:
	movf	((c:menu_draw_clock@val_len))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l12619
	line	1710
	
l12611:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l12595
	line	1717
	
l12615:; BSR set to: 5

	movlw	low(0)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l12595
	line	1722
	
l12619:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_clock@val_len_1603))^00h,c
	line	1724
	
l12621:
	movf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfss	status,2
	goto	u16451
	goto	u16450
u16451:
	goto	l12627
u16450:
	line	1727
	
l12623:
	movf	((c:menu_draw_clock@val_len_1603))^00h,c,w
	btfsc	status,2
	goto	u16461
	goto	u16460
u16461:
	goto	l12653
u16460:
	line	1728
	
l12625:
	movf	((c:menu_draw_clock@val_len_1603))^00h,c,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_print_at
	goto	l12653
	line	1733
	
l12627:
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
	line	1734
	
l12629:
	movf	((c:menu_draw_clock@actual_len))^00h,c,w
	sublw	low(012h)
	movwf	((c:menu_draw_clock@start_pos))^00h,c
	line	1736
	
l12631:
	movff	(c:menu_draw_clock@start_pos),(c:lcd_set_cursor@col)
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1737
	
l12633:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u16471
	goto	u16470

u16471:
	goto	l12637
u16470:
	
l12635:
		movlw	low(STR_281)
	movwf	((c:_menu_draw_clock$1609))^00h,c
	movlw	high(STR_281)
	movwf	((c:_menu_draw_clock$1609+1))^00h,c

	goto	l12639
	
l12637:
		movlw	low(STR_280)
	movwf	((c:_menu_draw_clock$1609))^00h,c
	movlw	high(STR_280)
	movwf	((c:_menu_draw_clock$1609+1))^00h,c

	
l12639:
		movff	(c:_menu_draw_clock$1609),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1609+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1740
	
l12641:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1742
	
l12643:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1743
	
l12645:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u16481
	goto	u16480

u16481:
	goto	l12649
u16480:
	
l12647:
		movlw	low(STR_283)
	movwf	((c:_menu_draw_clock$1613))^00h,c
	movlw	high(STR_283)
	movwf	((c:_menu_draw_clock$1613+1))^00h,c

	goto	l12651
	
l12649:
		movlw	low(STR_282)
	movwf	((c:_menu_draw_clock$1613))^00h,c
	movlw	high(STR_282)
	movwf	((c:_menu_draw_clock$1613+1))^00h,c

	
l12651:
		movff	(c:_menu_draw_clock$1613),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1613+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1666
	
l12653:
	incf	((c:menu_draw_clock@i))^00h,c
	
l12655:
		movlw	03h-0
	cpfslt	((c:menu_draw_clock@i))^00h,c
	goto	u16491
	goto	u16490

u16491:
	goto	l1103
u16490:
	
l12657:
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
	goto	u16501
	goto	u16500

u16501:
	goto	l12577
u16500:
	line	1746
	
l1103:
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
	callstack 27
	movwf	((c:___lbmod@dividend))^00h,c
	line	9
	
l12387:
	movlw	low(08h)
	movwf	((c:___lbmod@counter))^00h,c
	line	10
	movlw	low(0)
	movwf	((c:___lbmod@rem))^00h,c
	line	12
	
l12389:
	bcf	status,0
	rlcf	((c:___lbmod@dividend))^00h,c,w
	rlcf	((c:___lbmod@rem))^00h,c,w
	movwf	((c:___lbmod@rem))^00h,c
	line	13
	
l12391:
	bcf status,0
	rlcf	((c:___lbmod@dividend))^00h,c

	line	14
	
l12393:
		movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c,w
	btfss	status,0
	goto	u16061
	goto	u16060

u16061:
	goto	l12397
u16060:
	line	15
	
l12395:
	movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c
	line	16
	
l12397:
	decfsz	((c:___lbmod@counter))^00h,c
	
	goto	l12389
	line	17
	
l12399:
	movf	((c:___lbmod@rem))^00h,c,w
	line	18
	
l2265:
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
	callstack 27
	movwf	((c:___lbdiv@dividend))^00h,c
	line	9
	
l12361:
	movlw	low(0)
	movwf	((c:___lbdiv@quotient))^00h,c
	line	10
	
l12363:
	movf	((c:___lbdiv@divisor))^00h,c,w
	btfsc	status,2
	goto	u16031
	goto	u16030
u16031:
	goto	l12383
u16030:
	line	11
	
l12365:
	movlw	low(01h)
	movwf	((c:___lbdiv@counter))^00h,c
	line	12
	goto	l12371
	line	13
	
l12367:
	bcf status,0
	rlcf	((c:___lbdiv@divisor))^00h,c

	line	14
	
l12369:
	incf	((c:___lbdiv@counter))^00h,c
	line	12
	
l12371:
	
	btfss	((c:___lbdiv@divisor))^00h,c,(7)&7
	goto	u16041
	goto	u16040
u16041:
	goto	l12367
u16040:
	line	17
	
l12373:
	bcf status,0
	rlcf	((c:___lbdiv@quotient))^00h,c

	line	18
		movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c,w
	btfss	status,0
	goto	u16051
	goto	u16050

u16051:
	goto	l12379
u16050:
	line	19
	
l12375:
	movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c
	line	20
	
l12377:
	bsf	(0+(0/8)+(c:___lbdiv@quotient))^00h,c,(0)&7
	line	22
	
l12379:
	bcf status,0
	rrcf	((c:___lbdiv@divisor))^00h,c

	line	23
	
l12381:
	decfsz	((c:___lbdiv@counter))^00h,c
	
	goto	l12373
	line	25
	
l12383:
	movf	((c:___lbdiv@quotient))^00h,c,w
	line	26
	
l2259:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
	signat	___lbdiv,8313
	global	_menu_draw_utility

;; *************** function _menu_draw_utility *****************
;; Defined at:
;;		line 1751 in file "src\menu.c"
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
psect	text24,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1751
global __ptext24
__ptext24:
psect	text24
	file	"src\menu.c"
	line	1751
	
_menu_draw_utility:
;incstack = 0
	callstack 22
	line	1754
	
l13405:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1757
	
l13407:
	movlb	5	; () banked
	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u17981
	goto	u17980
u17981:
	goto	l13415
u17980:
	line	1759
	
l13409:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_284)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_284)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1761
	
l13411:
	call	_menu_update_datetime_display	;wreg free
	goto	l1107
	line	1767
	
l13415:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_285)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_285)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1769
	
l13417:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_utility@i))&0ffh
	goto	l13519
	line	1771
	
l13419:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_utility@i))&0ffh,w
	movwf	((menu_draw_utility@item_idx))&0ffh
	line	1772
	
l13421:; BSR set to: 0

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1775
	
l13423:
	movlb	0	; () banked
	movf	((menu_draw_utility@item_idx))&0ffh,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u17991
	goto	u17990

u17991:
	movlw	1
	goto	u18000
u17990:
	movlw	0
u18000:
	movlb	0	; () banked
	movwf	((menu_draw_utility@is_selected))&0ffh
	line	1778
	
l13425:; BSR set to: 0

	movf	((menu_draw_utility@item_idx))&0ffh,w
	btfss	status,2
	goto	u18011
	goto	u18010
u18011:
	goto	l13433
u18010:
	line	1780
	
l13427:; BSR set to: 0

	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u18021
	goto	u18020
u18021:
	goto	l13431
u18020:
	line	1782
	
l13429:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_286)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_286)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1783
	goto	l13517
	line	1786
	
l13431:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_287)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_287)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	goto	l13517
	line	1789
	
l13433:; BSR set to: 0

		movlw	8
	xorwf	((menu_draw_utility@item_idx))&0ffh,w
	btfss	status,2
	goto	u18031
	goto	u18030

u18031:
	goto	l13441
u18030:
	line	1791
	
l13435:; BSR set to: 0

	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u18041
	goto	u18040
u18041:
	goto	l13439
u18040:
	line	1793
	
l13437:; BSR set to: 0

	movlw	low(0Eh)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_288)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_288)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1794
	goto	l13517
	line	1797
	
l13439:; BSR set to: 0

	movlw	low(0Fh)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_289)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_289)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	goto	l13517
	line	1800
	
l13441:; BSR set to: 0

		decf	((menu_draw_utility@item_idx))&0ffh,w
	btfsc	status,2
	goto	u18051
	goto	u18050

u18051:
	goto	l13445
u18050:
	
l13443:; BSR set to: 0

		movlw	2
	xorwf	((menu_draw_utility@item_idx))&0ffh,w
	btfss	status,2
	goto	u18061
	goto	u18060

u18061:
	goto	l13455
u18060:
	line	1802
	
l13445:; BSR set to: 0

	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u18071
	goto	u18070
u18071:
	goto	l13453
u18070:
	line	1804
	
l13447:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_290)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_290)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1805
	
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
	line	1806
	
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
		movlw	low(STR_291)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_291)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1807
	goto	l13517
	line	1810
	
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
	line	1816
	
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
	line	1819
	
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
	goto	u18081
	goto	u18080

u18081:
	goto	l13517
u18080:
	
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
	goto	u18091
	goto	u18090

u18091:
	goto	l13517
u18090:
	line	1822
	
l13461:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_utility@show_brackets))&0ffh
	line	1824
	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u18101
	goto	u18100
u18101:
	goto	l13485
u18100:
	line	1826
	
l13463:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u18111
	goto	u18110
u18111:
	goto	l13467
u18110:
	
l13465:; BSR set to: 5

	movlw	high(01h)
	movlb	0	; () banked
	movwf	((_menu_draw_utility$1629+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_draw_utility$1629))&0ffh
	goto	l13469
	
l13467:; BSR set to: 5

	movlw	high(02h)
	movlb	0	; () banked
	movwf	((_menu_draw_utility$1629+1))&0ffh
	movlw	low(02h)
	movwf	((_menu_draw_utility$1629))&0ffh
	
l13469:; BSR set to: 0

	movff	(_menu_draw_utility$1629),(menu_draw_utility@show_brackets)
	line	1828
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u18121
	goto	u18120
u18121:
	goto	l13485
u18120:
	
l13471:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u18131
	goto	u18130
u18131:
	goto	l13485
u18130:
	line	1830
	
l13473:; BSR set to: 5

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
	line	1831
	
l13475:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_utility@j))&0ffh
	goto	l13481
	line	1832
	
l13477:; BSR set to: 0

	movf	((menu_draw_utility@j))&0ffh,w
	addlw	low(menu_draw_utility@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1831
	
l13479:; BSR set to: 0

	incf	((menu_draw_utility@j))&0ffh
	
l13481:; BSR set to: 0

		movf	((menu_draw_utility@len))&0ffh,w
	subwf	((menu_draw_utility@j))&0ffh,w
	btfss	status,0
	goto	u18141
	goto	u18140

u18141:
	goto	l13477
u18140:
	line	1833
	
l13483:; BSR set to: 0

	movf	((menu_draw_utility@len))&0ffh,w
	addlw	low(menu_draw_utility@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1834
	goto	l1135
	line	1837
	
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
	line	1843
	
l1135:
	line	1845
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
	line	1847
	
l13489:; BSR set to: 0

	movf	((menu_draw_utility@show_brackets))&0ffh,w
	btfss	status,2
	goto	u18151
	goto	u18150
u18151:
	goto	l13493
u18150:
	line	1850
	
l13491:; BSR set to: 0

	movf	((menu_draw_utility@val_len))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_utility@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1851
	goto	l13517
	line	1855
	
l13493:; BSR set to: 0

	movf	((menu_draw_utility@val_len))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_utility@start_pos))&0ffh
	line	1856
	
l13495:; BSR set to: 0

	movff	(menu_draw_utility@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1857
	
l13497:
	movlb	0	; () banked
		decf	((menu_draw_utility@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u18161
	goto	u18160

u18161:
	goto	l13501
u18160:
	
l13499:; BSR set to: 0

		movlw	low(STR_293)
	movwf	((_menu_draw_utility$1637))&0ffh
	movlw	high(STR_293)
	movwf	((_menu_draw_utility$1637+1))&0ffh

	goto	l13503
	
l13501:; BSR set to: 0

		movlw	low(STR_292)
	movwf	((_menu_draw_utility$1637))&0ffh
	movlw	high(STR_292)
	movwf	((_menu_draw_utility$1637+1))&0ffh

	
l13503:; BSR set to: 0

		movff	(_menu_draw_utility$1637),(c:lcd_print@str)
	movff	(_menu_draw_utility$1637+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1858
	
l13505:
		movlw	low(menu_draw_utility@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1859
	
l13507:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1860
	
l13509:
	movlb	0	; () banked
		decf	((menu_draw_utility@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u18171
	goto	u18170

u18171:
	goto	l13513
u18170:
	
l13511:; BSR set to: 0

		movlw	low(STR_295)
	movwf	((_menu_draw_utility$1641))&0ffh
	movlw	high(STR_295)
	movwf	((_menu_draw_utility$1641+1))&0ffh

	goto	l13515
	
l13513:; BSR set to: 0

		movlw	low(STR_294)
	movwf	((_menu_draw_utility$1641))&0ffh
	movlw	high(STR_294)
	movwf	((_menu_draw_utility$1641+1))&0ffh

	
l13515:; BSR set to: 0

		movff	(_menu_draw_utility$1641),(c:lcd_print@str)
	movff	(_menu_draw_utility$1641+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1769
	
l13517:
	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh
	
l13519:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_utility@i))&0ffh
	goto	u18181
	goto	u18180

u18181:
	goto	l1107
u18180:
	
l13521:; BSR set to: 0

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
	goto	u18191
	goto	u18190

u18191:
	goto	l13419
u18190:
	line	1865
	
l1107:
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
	
l12933:
	movlb	5	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17091
	goto	u17090
u17091:
	goto	l12957
u17090:
	
l12935:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17101
	goto	u17100
u17101:
	goto	l12957
u17100:
	line	795
	
l12937:; BSR set to: 5

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17111
	goto	u17110
u17111:
	goto	l12943
u17110:
	
l12939:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17121
	goto	u17120
u17121:
	goto	l12943
u17120:
	line	796
	
l12941:; BSR set to: 5

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
	goto	l12959
	line	797
	
l12943:; BSR set to: 5

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17131
	goto	u17130

u17131:
	goto	l12949
u17130:
	
l12945:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17141
	goto	u17140
u17141:
	goto	l12949
u17140:
	line	798
	
l12947:; BSR set to: 5

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
	goto	l12959
	line	799
	
l12949:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17151
	goto	u17150

u17151:
	goto	l12955
u17150:
	
l12951:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17161
	goto	u17160
u17161:
	goto	l12955
u17160:
	line	800
	
l12953:; BSR set to: 5

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
	goto	l12959
	line	802
	
l12955:; BSR set to: 5

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
	goto	l12959
	line	806
	
l12957:; BSR set to: 5

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
	line	810
	
l12959:
	movlb	5	; () banked
		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17171
	goto	u17170

u17171:
	goto	l12983
u17170:
	
l12961:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17181
	goto	u17180
u17181:
	goto	l12983
u17180:
	line	812
	
l12963:; BSR set to: 5

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17191
	goto	u17190
u17191:
	goto	l12969
u17190:
	
l12965:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17201
	goto	u17200
u17201:
	goto	l12969
u17200:
	line	813
	
l12967:; BSR set to: 5

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
	goto	l12985
	line	814
	
l12969:; BSR set to: 5

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17211
	goto	u17210

u17211:
	goto	l12975
u17210:
	
l12971:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17221
	goto	u17220
u17221:
	goto	l12975
u17220:
	line	815
	
l12973:; BSR set to: 5

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
	goto	l12985
	line	816
	
l12975:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17231
	goto	u17230

u17231:
	goto	l12981
u17230:
	
l12977:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17241
	goto	u17240
u17241:
	goto	l12981
u17240:
	line	817
	
l12979:; BSR set to: 5

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
	goto	l12985
	line	819
	
l12981:; BSR set to: 5

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
	goto	l12985
	line	823
	
l12983:; BSR set to: 5

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
	line	827
	
l12985:
	movlw	(01h)&0ffh
	
	call	_lcd_clear_line
	line	828
	
l12987:
	movlb	5	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17251
	goto	u17250
u17251:
	goto	l12995
u17250:
	line	830
	
l12989:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17261
	goto	u17260
u17261:
	goto	l12993
u17260:
	line	832
	
l12991:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_160)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_160)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	833
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	834
	movlw	low(09h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_161)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_161)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	835
	goto	l716
	line	838
	
l12993:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_162)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_162)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	839
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	840
	movlw	low(09h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_163)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_163)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	goto	l716
	line	845
	
l12995:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	846
	
l716:
	line	849
	movlw	(02h)&0ffh
	
	call	_lcd_clear_line
	line	850
	
l12997:
	movlb	5	; () banked
		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17271
	goto	u17270

u17271:
	goto	l13005
u17270:
	line	852
	
l12999:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17281
	goto	u17280
u17281:
	goto	l13003
u17280:
	line	854
	
l13001:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_164)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_164)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	855
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	856
	movlw	low(09h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_165)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_165)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	857
	goto	l720
	line	860
	
l13003:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_166)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_166)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	861
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	862
	movlw	low(09h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_167)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_167)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	goto	l720
	line	867
	
l13005:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	868
	
l720:
	line	871
	movlw	(03h)&0ffh
	
	call	_lcd_clear_line
	line	872
	
l13007:
		movlw	2
	movlb	5	; () banked
	xorwf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17291
	goto	u17290

u17291:
	goto	l13011
u17290:
	line	874
	
l13009:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_168)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_168)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	line	875
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_169)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_169)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	line	876
	movlw	low(05h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_170)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_170)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	line	877
	goto	l723
	line	879
	
l13011:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_171)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_171)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	line	880
	
l723:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_datetime_display
	__end_of_menu_update_datetime_display:
	signat	_menu_update_datetime_display,89
	global	_menu_draw_setup

;; *************** function _menu_draw_setup *****************
;; Defined at:
;;		line 1497 in file "src\menu.c"
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
;;		On entry : 0/4
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
	line	1497
global __ptext26
__ptext26:
psect	text26
	file	"src\menu.c"
	line	1497
	
_menu_draw_setup:
;incstack = 0
	callstack 23
	line	1502
	
l13641:
	call	_lcd_clear	;wreg free
	line	1503
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1504
	
l13643:
		movlw	low(STR_242)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_242)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1507
	
l13645:
	lfsr	2,(menu_draw_setup@F2710)
	lfsr	1,(menu_draw_setup@setup_labels)
	movlw	10-1
u18421:
	movff	plusw2,plusw1
	decf	wreg
	bc	u18421

	line	1510
	
l13647:
	movlw	low(0)
	movwf	((c:menu_draw_setup@i))^00h,c
	line	1512
	
l13653:
	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_setup@i))^00h,c,w
	movwf	((c:menu_draw_setup@item_idx))^00h,c
	line	1513
		movlw	05h-1
	cpfsgt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u18431
	goto	u18430

u18431:
	goto	l13657
u18430:
	goto	l1049
	line	1516
	
l13657:; BSR set to: 5

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1519
	
l13659:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u18441
	goto	u18440

u18441:
	goto	l13693
u18440:
	line	1521
	
l13661:
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
	line	1523
	
l13663:
	movf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u18451
	goto	u18450
u18451:
	goto	l13671
u18450:
	
l13665:
		decf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u18461
	goto	u18460

u18461:
	goto	l13669
u18460:
	
l13667:
		movlw	low(STR_250)
	movwf	((c:_menu_draw_setup$1542))^00h,c
	movlw	high(STR_250)
	movwf	((c:_menu_draw_setup$1542+1))^00h,c

	goto	l1032
	
l13669:
		movlw	low(STR_249)
	movwf	((c:_menu_draw_setup$1542))^00h,c
	movlw	high(STR_249)
	movwf	((c:_menu_draw_setup$1542+1))^00h,c

	
l1032:
		movff	(c:_menu_draw_setup$1542),(c:menu_draw_setup@sensor_name)
	movff	(c:_menu_draw_setup$1542+1),(c:menu_draw_setup@sensor_name+1)

	goto	l1028
	
l13671:
		movlw	low(STR_248)
	movwf	((c:menu_draw_setup@sensor_name))^00h,c
	movlw	high(STR_248)
	movwf	((c:menu_draw_setup@sensor_name+1))^00h,c

	
l1028:
	line	1526
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18471
	goto	u18470

u18471:
	goto	l13681
u18470:
	line	1529
	
l13673:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1530
	
l13675:
		movlw	low(STR_251)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_251)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1531
	
l13677:
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1532
	
l13679:
		movlw	low(STR_252)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_252)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1533
	goto	l13683
	line	1537
	
l13681:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1541
	
l13683:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1542
	
l13685:
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
	goto	u18481
	goto	u18480
u18481:
	goto	l13689
u18480:
	
l13687:
		movlw	low(STR_254)
	movwf	((c:_menu_draw_setup$1548))^00h,c
	movlw	high(STR_254)
	movwf	((c:_menu_draw_setup$1548+1))^00h,c

	goto	l13691
	
l13689:
		movlw	low(STR_253)
	movwf	((c:_menu_draw_setup$1548))^00h,c
	movlw	high(STR_253)
	movwf	((c:_menu_draw_setup$1548+1))^00h,c

	
l13691:
		movff	(c:_menu_draw_setup$1548),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1548+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1543
	goto	l13719
	line	1547
	
l13693:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_labels)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:menu_draw_setup@label)
	movff	postdec2,(c:menu_draw_setup@label+1)
	line	1549
	
l13695:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18491
	goto	u18490

u18491:
	goto	l13705
u18490:
	line	1552
	
l13697:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1553
	
l13699:
		movlw	low(STR_255)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_255)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1554
	
l13701:
		movff	(c:menu_draw_setup@label),(c:lcd_print@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1555
	
l13703:
		movlw	low(STR_256)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_256)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1556
	goto	l13707
	line	1560
	
l13705:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@label),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1564
	
l13707:
		movlw	3
	xorwf	((c:menu_draw_setup@item_idx))^00h,c,w
	btfss	status,2
	goto	u18501
	goto	u18500

u18501:
	goto	l13719
u18500:
	line	1567
	
l13709:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1568
	
l13711:
	movlb	7	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u18511
	goto	u18510
u18511:
	goto	l13715
u18510:
	
l13713:; BSR set to: 7

		movlw	low(STR_258)
	movwf	((c:_menu_draw_setup$1556))^00h,c
	movlw	high(STR_258)
	movwf	((c:_menu_draw_setup$1556+1))^00h,c

	goto	l13717
	
l13715:; BSR set to: 7

		movlw	low(STR_257)
	movwf	((c:_menu_draw_setup$1556))^00h,c
	movlw	high(STR_257)
	movwf	((c:_menu_draw_setup$1556+1))^00h,c

	
l13717:; BSR set to: 7

		movff	(c:_menu_draw_setup$1556),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1556+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1510
	
l13719:
	incf	((c:menu_draw_setup@i))^00h,c
	
l13721:
		movlw	03h-1
	cpfsgt	((c:menu_draw_setup@i))^00h,c
	goto	u18521
	goto	u18520

u18521:
	goto	l13653
u18520:
	line	1572
	
l1049:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_setup
	__end_of_menu_draw_setup:
	signat	_menu_draw_setup,89
	global	_menu_draw_options

;; *************** function _menu_draw_options *****************
;; Defined at:
;;		line 1338 in file "src\menu.c"
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
psect	text27,class=CODE,space=0,reloc=2,group=0
	line	1338
global __ptext27
__ptext27:
psect	text27
	file	"src\menu.c"
	line	1338
	
_menu_draw_options:
;incstack = 0
	callstack 23
	line	1341
	
l13127:
	call	_lcd_clear	;wreg free
	line	1342
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1343
	
l13129:
		movlw	low(STR_232)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_232)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1346
	
l13131:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	line	1348
	
l13137:
	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_options@i))^00h,c,w
	movwf	((c:menu_draw_options@item_index))^00h,c
	line	1349
		movlw	05h-1
	cpfsgt	((c:menu_draw_options@item_index))^00h,c
	goto	u17421
	goto	u17420

u17421:
	goto	l13141
u17420:
	goto	l973
	line	1352
	
l13141:; BSR set to: 5

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1355
	
l13143:
	movf	((c:menu_draw_options@item_index))^00h,c,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17431
	goto	u17430

u17431:
	goto	l13153
u17430:
	line	1357
	
l13145:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1358
	
l13147:
		movlw	low(STR_233)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_233)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1359
	
l13149:
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
	line	1360
	
l13151:
		movlw	low(STR_234)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_234)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1361
	goto	l13155
	line	1365
	
l13153:; BSR set to: 5

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
	line	1346
	
l13155:
	incf	((c:menu_draw_options@i))^00h,c
	
l13157:
		movlw	03h-1
	cpfsgt	((c:menu_draw_options@i))^00h,c
	goto	u17441
	goto	u17440

u17441:
	goto	l13137
u17440:
	line	1368
	
l973:
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
	
l12403:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	168
	
l12405:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u22477:
decfsz	wreg,f
	bra	u22477
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u22477
	nop2
asmopt pop

	line	169
	
l1592:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
	signat	_lcd_clear,89
	global	_menu_draw_input

;; *************** function _menu_draw_input *****************
;; Defined at:
;;		line 1370 in file "src\menu.c"
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
;;		On entry : 0/4
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
	line	1370
global __ptext29
__ptext29:
psect	text29
	file	"src\menu.c"
	line	1370
	
_menu_draw_input:
;incstack = 0
	callstack 23
	line	1375
	
l13523:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1377
	
l13525:
		movlw	low(menu_draw_input@title)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_235)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_235)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(01h)
	movlb	4	; () banked
	addwf	((_current_input))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	1+(0+((c:?_sprintf)+04h))^00h,c
	movlw	high(01h)
	addwfc	1+(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1378
	
l13527:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@title)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1381
	
l13529:
	movlb	4	; () banked
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
	line	1382
	
l13531:; BSR set to: 0

	movlb	4	; () banked
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
	line	1385
	
l13533:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@i))&0ffh
	goto	l13637
	line	1387
	
l13535:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_input@i))&0ffh,w
	movwf	((menu_draw_input@item_idx))&0ffh
	line	1388
	
l13537:; BSR set to: 0

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1391
	
l13539:
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
	line	1395
	
l13541:
	line	1397
	
l13543:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18201
	goto	u18200

u18201:
	goto	l13593
u18200:
	line	1399
	
l13545:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u18211
	goto	u18210
u18211:
	goto	l13589
u18210:
	line	1401
	
l13547:; BSR set to: 5

	movlw	low(02h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	line	1404
	
l13549:; BSR set to: 0

	movff	(menu_draw_input@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_option_field@flow_type)
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u18221
	goto	u18220
u18221:
	goto	l13563
u18220:
	line	1406
	
l13551:
	movlb	5	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18231
	goto	u18230
u18231:
	goto	l13565
u18230:
	line	1409
	
l13553:; BSR set to: 5

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts+1)
	line	1410
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag+1)
	line	1412
	
l13555:
	movlb	0	; () banked
	movf	((menu_draw_input@opts))&0ffh,w
iorwf	((menu_draw_input@opts+1))&0ffh,w
	btfsc	status,2
	goto	u18241
	goto	u18240

u18241:
	goto	l13563
u18240:
	
l13557:; BSR set to: 0

	movf	((menu_draw_input@flag))&0ffh,w
iorwf	((menu_draw_input@flag+1))&0ffh,w
	btfsc	status,2
	goto	u18251
	goto	u18250

u18251:
	goto	l13563
u18250:
	
l13559:; BSR set to: 0

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
	goto	u18261
	goto	u18260
u18261:
	goto	l13563
u18260:
	line	1414
	
l13561:; BSR set to: 0

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
	line	1415
	goto	l13597
	line	1418
	
l13563:
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
	goto	l13597
	line	1424
	
l13565:; BSR set to: 5

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts_1504)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts_1504+1)
	line	1425
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag_1508)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag_1508+1)
	line	1427
	
l13567:
	movlb	0	; () banked
	movf	((menu_draw_input@opts_1504))&0ffh,w
iorwf	((menu_draw_input@opts_1504+1))&0ffh,w
	btfsc	status,2
	goto	u18271
	goto	u18270

u18271:
	goto	l13585
u18270:
	
l13569:; BSR set to: 0

	movf	((menu_draw_input@flag_1508))&0ffh,w
iorwf	((menu_draw_input@flag_1508+1))&0ffh,w
	btfsc	status,2
	goto	u18281
	goto	u18280

u18281:
	goto	l13585
u18280:
	
l13571:; BSR set to: 0

	movff	(menu_draw_input@flag_1508),fsr2l
	movff	(menu_draw_input@flag_1508+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	01h
	addwf	((menu_draw_input@opts_1504))&0ffh,w
	movwf	(??_menu_draw_input+1+0)^00h,c
	movlw	0
	addwfc	((menu_draw_input@opts_1504+1))&0ffh,w
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
	goto	u18291
	goto	u18290
u18291:
	goto	l13585
u18290:
	line	1429
	
l13573:; BSR set to: 0

	movff	(menu_draw_input@flag_1508),fsr2l
	movff	(menu_draw_input@flag_1508+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movf	((??_menu_draw_input+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_input+1+0
	movff	prodh,??_menu_draw_input+1+0+1
	movf	(??_menu_draw_input+1+0)^00h,c,w
	addwf	((menu_draw_input@opts_1504))&0ffh,w
	movwf	(??_menu_draw_input+3+0)^00h,c
	movf	(??_menu_draw_input+1+1)^00h,c,w
	addwfc	((menu_draw_input@opts_1504+1))&0ffh,w
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
	line	1430
	
l13575:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j))&0ffh
	goto	l13581
	line	1431
	
l13577:; BSR set to: 0

	movf	((menu_draw_input@j))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1430
	
l13579:; BSR set to: 0

	incf	((menu_draw_input@j))&0ffh
	
l13581:; BSR set to: 0

		movf	((menu_draw_input@val_len))&0ffh,w
	subwf	((menu_draw_input@j))&0ffh,w
	btfss	status,0
	goto	u18301
	goto	u18300

u18301:
	goto	l13577
u18300:
	line	1432
	
l13583:; BSR set to: 0

	movf	((menu_draw_input@val_len))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1433
	goto	l13597
	line	1436
	
l13585:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_236)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_236)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l13597
	line	1449
	
l13589:; BSR set to: 5

	movlw	low(01h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l13563
	line	1456
	
l13593:; BSR set to: 5

	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l13563
	line	1461
	
l13597:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_1512))&0ffh
	line	1462
	
l13599:; BSR set to: 0

	movf	((menu_draw_input@val_len_1512))&0ffh,w
	btfsc	status,2
	goto	u18311
	goto	u18310
u18311:
	goto	l13635
u18310:
	
l13601:; BSR set to: 0

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
	goto	u18321
	goto	u18320

u18321:
	goto	l13635
u18320:
	line	1465
	
l13603:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u18331
	goto	u18330
u18331:
	goto	l13611
u18330:
	
l13605:; BSR set to: 5

	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18341
	goto	u18340

u18341:
	goto	l13611
u18340:
	line	1468
	
l13607:; BSR set to: 5

	movff	(menu_draw_input@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_numeric_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u18351
	goto	u18350
u18351:
	goto	l13635
u18350:
	
l13609:
	movff	(menu_draw_input@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_time_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u18361
	goto	u18360
u18361:
	goto	l13611
u18360:
	goto	l13635
	line	1475
	
l13611:
	movlb	0	; () banked
	movf	((menu_draw_input@show_brackets))&0ffh,w
	btfss	status,2
	goto	u18371
	goto	u18370
u18371:
	goto	l13615
u18370:
	line	1478
	
l13613:; BSR set to: 0

	movf	((menu_draw_input@val_len_1512))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	1479
	goto	l13635
	line	1483
	
l13615:; BSR set to: 0

	movf	((menu_draw_input@val_len_1512))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_input@start_pos))&0ffh
	line	1484
	
l13617:; BSR set to: 0

	movff	(menu_draw_input@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1487
	
l13619:
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u18381
	goto	u18380

u18381:
	goto	l13623
u18380:
	
l13621:; BSR set to: 0

		movlw	low(STR_239)
	movwf	((_menu_draw_input$1518))&0ffh
	movlw	high(STR_239)
	movwf	((_menu_draw_input$1518+1))&0ffh

	goto	l13625
	
l13623:; BSR set to: 0

		movlw	low(STR_238)
	movwf	((_menu_draw_input$1518))&0ffh
	movlw	high(STR_238)
	movwf	((_menu_draw_input$1518+1))&0ffh

	
l13625:; BSR set to: 0

		movff	(_menu_draw_input$1518),(c:lcd_print@str)
	movff	(_menu_draw_input$1518+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1489
	
l13627:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1491
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u18391
	goto	u18390

u18391:
	goto	l13631
u18390:
	
l13629:; BSR set to: 0

		movlw	low(STR_241)
	movwf	((_menu_draw_input$1522))&0ffh
	movlw	high(STR_241)
	movwf	((_menu_draw_input$1522+1))&0ffh

	goto	l13633
	
l13631:; BSR set to: 0

		movlw	low(STR_240)
	movwf	((_menu_draw_input$1522))&0ffh
	movlw	high(STR_240)
	movwf	((_menu_draw_input$1522+1))&0ffh

	
l13633:; BSR set to: 0

		movff	(_menu_draw_input$1522),(c:lcd_print@str)
	movff	(_menu_draw_input$1522+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1385
	
l13635:
	movlb	0	; () banked
	incf	((menu_draw_input@i))&0ffh
	
l13637:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_input@i))&0ffh
	goto	u18401
	goto	u18400

u18401:
	goto	l1014
u18400:
	
l13639:; BSR set to: 0

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
	goto	u18411
	goto	u18410

u18411:
	goto	l13535
u18410:
	line	1495
	
l1014:; BSR set to: 0

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
	
l12269:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l12273
	line	10
	
l12271:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l12273:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15847
	tblrd	*
	
	movf	tablat,w
	bra	u15840
u15847:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15840:
	iorlw	0
	btfss	status,2
	goto	u15851
	goto	u15850
u15851:
	goto	l12271
u15850:
	line	12
	
l12275:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l2555:
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
	
l12263:
		movff	(c:strcpy@to),(c:strcpy@cp)
	movff	(c:strcpy@to+1),(c:strcpy@cp+1)

	line	19
	goto	l12267
	line	20
	
l12265:
	infsnz	((c:strcpy@cp))^00h,c
	incf	((c:strcpy@cp+1))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l12267:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15817
	tblrd	*
	
	movf	tablat,w
	bra	u15810
u15817:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15810:
	movff	(c:strcpy@cp),tblptrl
	movff	(c:strcpy@cp+1),tblptrh
	clrf	tblptru
	
	movwf	(??_strcpy+0+0)^00h,c
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15827
	movff	??_strcpy+0+0,tablat
	tblwt*
	bra	u15820
u15827:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	??_strcpy+0+0,indf0
u15820:
	
	movf	(??_strcpy+0+0)^00h,c,w
	btfss	status,2
	goto	u15831
	goto	u15830
u15831:
	goto	l12265
u15830:
	line	24
	
l2549:
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
;;		 -> STR_338(5), STR_337(6), STR_336(6), STR_335(8), 
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
	
l13025:
	goto	l13029
	line	38
	
l13027:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l13029:
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
	bra	u17317
	tblrd	*
	
	movf	tablat,w
	bra	u17310
u17317:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u17310:
	movwf	(??_strcmp+1+0)^00h,c
	movf	(??_strcmp+0+0)^00h,c,w
	subwf	((??_strcmp+1+0))^00h,c,w
	movwf	((c:strcmp@r))^00h,c
	movf	((c:strcmp@r))^00h,c,w
	btfss	status,2
	goto	u17321
	goto	u17320
u17321:
	goto	l13033
u17320:
	
l13031:
	movff	(c:strcmp@s1),tblptrl
	movff	(c:strcmp@s1+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u17337
	tblrd	*
	
	movf	tablat,w
	bra	u17330
u17337:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u17330:
	iorlw	0
	btfss	status,2
	goto	u17341
	goto	u17340
u17341:
	goto	l13027
u17340:
	line	41
	
l13033:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l2543:
	return	;funcret
	callstack 0
GLOBAL	__end_of_strcmp
	__end_of_strcmp:
	signat	_strcmp,8314
	global	_lcd_print_at

;; *************** function _lcd_print_at *****************
;; Defined at:
;;		line 886 in file "src\menu.c"
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
psect	text33,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	886
global __ptext33
__ptext33:
psect	text33
	file	"src\menu.c"
	line	886
	
_lcd_print_at:
;incstack = 0
	callstack 23
	movwf	((c:lcd_print_at@row))^00h,c
	line	888
	
l12259:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	889
	
l12261:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	890
	
l726:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print_at
	__end_of_lcd_print_at:
	signat	_lcd_print_at,12409
	global	_lcd_clear_line

;; *************** function _lcd_clear_line *****************
;; Defined at:
;;		line 892 in file "src\menu.c"
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
psect	text34,class=CODE,space=0,reloc=2,group=0
	line	892
global __ptext34
__ptext34:
psect	text34
	file	"src\menu.c"
	line	892
	
_lcd_clear_line:
;incstack = 0
	callstack 23
	movwf	((c:lcd_clear_line@row))^00h,c
	line	894
	
l12255:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	895
	
l12257:
		movlw	low(STR_172)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_172)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	896
	
l729:
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
	
l11937:
	goto	l11949
	line	135
	
l1577:
	line	136
	movff	(c:lcd_set_cursor@col),(c:lcd_set_cursor@addr)
	line	137
	goto	l11951
	line	139
	
l11939:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(040h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	140
	goto	l11951
	line	142
	
l11941:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(094h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	143
	goto	l11951
	line	145
	
l11943:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(0D4h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	146
	goto	l11951
	line	148
	
l11945:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	149
	goto	l11951
	line	133
	
l11949:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l1577
	xorlw	1^0	; case 1
	skipnz
	goto	l11939
	xorlw	2^1	; case 2
	skipnz
	goto	l11941
	xorlw	3^2	; case 3
	skipnz
	goto	l11943
	goto	l11945

	line	152
	
l11951:
	movf	((c:lcd_set_cursor@addr))^00h,c,w
	iorlw	low(080h)
	
	call	_lcd_cmd
	line	153
	
l1583:
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
	
l11953:
	goto	l11959
	line	160
	
l11955:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15237
	tblrd	*
	
	movf	tablat,w
	bra	u15230
u15237:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15230:
	
	call	_lcd_data
	
l11957:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	158
	
l11959:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15247
	tblrd	*
	
	movf	tablat,w
	bra	u15240
u15247:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15240:
	iorlw	0
	btfss	status,2
	goto	u15251
	goto	u15250
u15251:
	goto	l11955
u15250:
	line	162
	
l1589:
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
	
l11903:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	52
	
l11905:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	53
	
l11907:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	54
	
l11909:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	55
	
l11911:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	56
	
l11913:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	57
	
l11915:
	asmopt push
asmopt off
	movlw	133
u22487:
decfsz	wreg,f
	bra	u22487
	nop
asmopt pop

	line	60
	
l11917:
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	61
	
l11919:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	62
	
l11921:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	63
	
l11923:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	64
	
l11925:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	65
	
l11927:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	66
	asmopt push
asmopt off
	movlw	133
u22497:
decfsz	wreg,f
	bra	u22497
	nop
asmopt pop

	line	67
	
l1570:
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
	
l12531:
	movf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16271
	goto	u16270
u16271:
	goto	l12547
u16270:
	line	258
	
l12533:
	movlw	low(01h)
	movwf	((c:_is_time_field$1240))^00h,c
	
l12535:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16281
	goto	u16280

u16281:
	goto	l520
u16280:
	
l12537:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16291
	goto	u16290

u16291:
	goto	l520
u16290:
	
l12539:
		movlw	8
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16301
	goto	u16300

u16301:
	goto	l520
u16300:
	
l12541:
	movlw	low(0)
	movwf	((c:_is_time_field$1240))^00h,c
	
l520:
	movf	((c:_is_time_field$1240))^00h,c,w
	goto	l521
	line	260
	
l12547:
		decf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16311
	goto	u16310

u16311:
	goto	l12555
u16310:
	line	263
	
l12549:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16321
	goto	u16320

u16321:
	movlw	1
	goto	u16330
u16320:
	movlw	0
u16330:
	goto	l521
	line	265
	
l12555:
		movlw	2
	xorwf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16341
	goto	u16340

u16341:
	goto	l12569
u16340:
	line	267
	
l12557:
	movf	((c:is_time_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u16351
	goto	u16350
u16351:
	goto	l12565
u16350:
	line	270
	
l12559:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16361
	goto	u16360

u16361:
	movlw	1
	goto	u16370
u16360:
	movlw	0
u16370:
	goto	l521
	line	275
	
l12565:
		movlw	4
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16381
	goto	u16380

u16381:
	movlw	1
	goto	u16390
u16380:
	movlw	0
u16390:
	goto	l521
	line	279
	
l12569:
	movlw	(0)&0ffh
	line	280
	
l521:
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
	
l12659:
	movf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16511
	goto	u16510
u16511:
	goto	l12663
u16510:
	
l12661:
		decf	((c:is_option_field@line))^00h,c,w
	btfss	status,2
	goto	u16521
	goto	u16520

u16521:
	goto	l12667
u16520:
	line	289
	
l12663:
	movlw	(01h)&0ffh
	goto	l533
	line	291
	
l12667:
	movf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16531
	goto	u16530
u16531:
	goto	l12685
u16530:
	line	294
	
l12669:
	movlw	low(01h)
	movwf	((c:_is_option_field$1245))^00h,c
	
l12671:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16541
	goto	u16540

u16541:
	goto	l536
u16540:
	
l12673:
		movlw	10
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16551
	goto	u16550

u16551:
	goto	l536
u16550:
	
l12675:
		movlw	11
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16561
	goto	u16560

u16561:
	goto	l536
u16560:
	
l12677:
		movlw	12
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16571
	goto	u16570

u16571:
	goto	l536
u16570:
	
l12679:
	movlw	low(0)
	movwf	((c:_is_option_field$1245))^00h,c
	
l536:
	movf	((c:_is_option_field$1245))^00h,c,w
	goto	l533
	line	296
	
l12685:
		decf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16581
	goto	u16580

u16581:
	goto	l12699
u16580:
	line	299
	
l12687:
	movlw	low(01h)
	movwf	((c:_is_option_field$1246))^00h,c
	
l12689:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16591
	goto	u16590

u16591:
	goto	l540
u16590:
	
l12691:
		movlw	7
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16601
	goto	u16600

u16601:
	goto	l540
u16600:
	
l12693:
	movlw	low(0)
	movwf	((c:_is_option_field$1246))^00h,c
	
l540:
	movf	((c:_is_option_field$1246))^00h,c,w
	goto	l533
	line	301
	
l12699:
		movlw	2
	xorwf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16611
	goto	u16610

u16611:
	goto	l12733
u16610:
	line	303
	
l12701:
	movf	((c:is_option_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u16621
	goto	u16620
u16621:
	goto	l12719
u16620:
	line	306
	
l12703:
	movlw	low(01h)
	movwf	((c:_is_option_field$1247))^00h,c
	
l12705:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16631
	goto	u16630

u16631:
	goto	l545
u16630:
	
l12707:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16641
	goto	u16640

u16641:
	goto	l545
u16640:
	
l12709:
		movlw	8
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16651
	goto	u16650

u16651:
	goto	l545
u16650:
	
l12711:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16661
	goto	u16660

u16661:
	goto	l545
u16660:
	
l12713:
	movlw	low(0)
	movwf	((c:_is_option_field$1247))^00h,c
	
l545:
	movf	((c:_is_option_field$1247))^00h,c,w
	goto	l533
	line	311
	
l12719:
	movlw	low(01h)
	movwf	((c:_is_option_field$1248))^00h,c
	
l12721:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16671
	goto	u16670

u16671:
	goto	l548
u16670:
	
l12723:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16681
	goto	u16680

u16681:
	goto	l548
u16680:
	
l12725:
		movlw	5
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16691
	goto	u16690

u16691:
	goto	l548
u16690:
	
l12727:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u16701
	goto	u16700

u16701:
	goto	l548
u16700:
	
l12729:
	movlw	low(0)
	movwf	((c:_is_option_field$1248))^00h,c
	
l548:
	movf	((c:_is_option_field$1248))^00h,c,w
	goto	l533
	line	315
	
l12733:
	movlw	(0)&0ffh
	line	316
	
l533:
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
	
l12471:
	movf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16131
	goto	u16130
u16131:
	goto	l12489
u16130:
	line	226
	
l12473:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1233))^00h,c
	
l12475:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16141
	goto	u16140

u16141:
	goto	l504
u16140:
	
l12477:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16151
	goto	u16150

u16151:
	goto	l504
u16150:
	
l12479:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16161
	goto	u16160

u16161:
	goto	l504
u16160:
	
l12481:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16171
	goto	u16170

u16171:
	goto	l504
u16170:
	
l12483:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1233))^00h,c
	
l504:
	movf	((c:_is_numeric_field$1233))^00h,c,w
	goto	l505
	line	228
	
l12489:
		decf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16181
	goto	u16180

u16181:
	goto	l12505
u16180:
	line	231
	
l12491:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1234))^00h,c
	
l12493:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16191
	goto	u16190

u16191:
	goto	l509
u16190:
	
l12495:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16201
	goto	u16200

u16201:
	goto	l509
u16200:
	
l12497:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16211
	goto	u16210

u16211:
	goto	l509
u16210:
	
l12499:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1234))^00h,c
	
l509:
	movf	((c:_is_numeric_field$1234))^00h,c,w
	goto	l505
	line	233
	
l12505:
		movlw	2
	xorwf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16221
	goto	u16220

u16221:
	goto	l12523
u16220:
	line	235
	
l12507:
	movf	((c:is_numeric_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u16231
	goto	u16230
u16231:
	goto	l12523
u16230:
	line	238
	
l12509:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1235))^00h,c
	
l12511:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16241
	goto	u16240

u16241:
	goto	l514
u16240:
	
l12513:
		movlw	5
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16251
	goto	u16250

u16251:
	goto	l514
u16250:
	
l12515:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16261
	goto	u16260

u16261:
	goto	l514
u16260:
	
l12517:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1235))^00h,c
	
l514:
	movf	((c:_is_numeric_field$1235))^00h,c,w
	goto	l505
	line	243
	
l12523:
	movlw	(0)&0ffh
	line	248
	
l505:
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
	
l12737:
	movf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16711
	goto	u16710
u16711:
	goto	l12743
u16710:
	line	326
	
l12739:
		movlw	low(_enable_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l552
	line	327
	
l12743:
		decf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16721
	goto	u16720

u16721:
	goto	l12749
u16720:
	line	328
	
l12745:
		movlw	low(_sensor_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l552
	line	331
	
l12749:
	movf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16731
	goto	u16730
u16731:
	goto	l12775
u16730:
	line	333
	
l12751:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16741
	goto	u16740

u16741:
	goto	l12757
u16740:
	line	334
	
l12753:
		movlw	low(_relay_high_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l552
	line	335
	
l12757:
		movlw	10
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16751
	goto	u16750

u16751:
	goto	l12763
u16750:
	line	336
	
l12759:
		movlw	low(_relay_plp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l552
	line	337
	
l12763:
		movlw	11
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16761
	goto	u16760

u16761:
	goto	l12769
u16760:
	line	338
	
l12765:
		movlw	low(_relay_slp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l552
	line	339
	
l12769:
		movlw	12
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16771
	goto	u16770

u16771:
	goto	l12835
u16770:
	line	340
	
l12771:
		movlw	low(_display_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l552
	line	343
	
l12775:
		decf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16781
	goto	u16780

u16781:
	goto	l12789
u16780:
	line	345
	
l12777:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16791
	goto	u16790

u16791:
	goto	l12783
u16790:
	goto	l12753
	line	347
	
l12783:
		movlw	7
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16801
	goto	u16800

u16801:
	goto	l12835
u16800:
	goto	l12771
	line	351
	
l12789:
		movlw	2
	xorwf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16811
	goto	u16810

u16811:
	goto	l12835
u16810:
	line	353
	
l12791:
		movlw	2
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16821
	goto	u16820

u16821:
	goto	l12797
u16820:
	line	354
	
l12793:
		movlw	low(_flow_type_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l552
	line	356
	
l12797:
	movf	((c:get_option_edit_flag@flow_type))^00h,c,w
	btfss	status,2
	goto	u16831
	goto	u16830
u16831:
	goto	l12817
u16830:
	line	358
	
l12799:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16841
	goto	u16840

u16841:
	goto	l12805
u16840:
	line	359
	
l12801:
		movlw	low(_flow_units_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l552
	line	360
	
l12805:
		movlw	8
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16851
	goto	u16850

u16851:
	goto	l12811
u16850:
	line	361
	
l12807:
		movlw	low(_relay_low_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l552
	line	362
	
l12811:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16861
	goto	u16860

u16861:
	goto	l12835
u16860:
	goto	l12771
	line	367
	
l12817:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16871
	goto	u16870

u16871:
	goto	l12823
u16870:
	line	368
	
l12819:
		movlw	low(_no_flow_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(_no_flow_edit_flag)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l552
	line	369
	
l12823:
		movlw	5
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16881
	goto	u16880

u16881:
	goto	l12829
u16880:
	goto	l12807
	line	371
	
l12829:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u16891
	goto	u16890

u16891:
	goto	l12835
u16890:
	goto	l12771
	line	376
	
l12835:
		movlw	low(0)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(0)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	line	377
	
l552:
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
	
l12839:
	movf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u16901
	goto	u16900
u16901:
	goto	l12845
u16900:
	line	387
	
l12841:
		movlw	low(_menu_item_options)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l577
	line	388
	
l12845:
		decf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u16911
	goto	u16910

u16911:
	goto	l12851
u16910:
	line	389
	
l12847:
		movlw	low(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l577
	line	392
	
l12851:
	movf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16921
	goto	u16920
u16921:
	goto	l12869
u16920:
	line	394
	
l12853:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u16931
	goto	u16930

u16931:
	goto	l12859
u16930:
	
l12855:
		movlw	10
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u16941
	goto	u16940

u16941:
	goto	l12859
u16940:
	
l12857:
		movlw	11
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u16951
	goto	u16950

u16951:
	goto	l12863
u16950:
	line	395
	
l12859:
		movlw	low(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l577
	line	396
	
l12863:
		movlw	12
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u16961
	goto	u16960

u16961:
	goto	l12929
u16960:
	line	397
	
l12865:
		movlw	low(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l577
	line	400
	
l12869:
		decf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16971
	goto	u16970

u16971:
	goto	l12883
u16970:
	line	402
	
l12871:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u16981
	goto	u16980

u16981:
	goto	l12877
u16980:
	goto	l12859
	line	404
	
l12877:
		movlw	7
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u16991
	goto	u16990

u16991:
	goto	l12929
u16990:
	goto	l12865
	line	408
	
l12883:
		movlw	2
	xorwf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17001
	goto	u17000

u17001:
	goto	l12929
u17000:
	line	410
	
l12885:
		movlw	2
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17011
	goto	u17010

u17011:
	goto	l12891
u17010:
	line	411
	
l12887:
		movlw	low(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l577
	line	413
	
l12891:
	movf	((c:get_item_options_for_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u17021
	goto	u17020
u17021:
	goto	l12911
u17020:
	line	415
	
l12893:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17031
	goto	u17030

u17031:
	goto	l12899
u17030:
	line	416
	
l12895:
		movlw	low(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l577
	line	417
	
l12899:
		movlw	8
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17041
	goto	u17040

u17041:
	goto	l12905
u17040:
	goto	l12859
	line	419
	
l12905:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17051
	goto	u17050

u17051:
	goto	l12929
u17050:
	goto	l12865
	line	424
	
l12911:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17061
	goto	u17060

u17061:
	goto	l12917
u17060:
	line	425
	
l12913:
		movlw	low(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l577
	line	426
	
l12917:
		movlw	5
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17071
	goto	u17070

u17071:
	goto	l12923
u17070:
	goto	l12859
	line	428
	
l12923:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17081
	goto	u17080

u17081:
	goto	l12929
u17080:
	goto	l12865
	line	433
	
l12929:
		movlw	low(0)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(0)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	line	434
	
l577:
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
;;		On entry : 0/4
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
	
l13741:
	movff	(c:init_time_editor@mode),0+(_menu+010h)
	line	447
	movff	(c:init_time_editor@value_seconds),0+(_menu+014h)
	movff	(c:init_time_editor@value_seconds+1),1+(_menu+014h)
	line	450
	
l13743:
	movf	((c:init_time_editor@mode))^00h,c,w
	btfss	status,2
	goto	u18541
	goto	u18540
u18541:
	goto	l13747
u18540:
	line	452
	
l13745:
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
	goto	l13749
	line	457
	
l13747:
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
	
l13749:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+011h))&0ffh
	line	467
	
l13751:; BSR set to: 5

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
	
l13753:
		movlw	low(init_time_editor@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	469
	
l603:
	return	;funcret
	callstack 0
GLOBAL	__end_of_init_time_editor
	__end_of_init_time_editor:
	signat	_init_time_editor,8313
	global	_init_numeric_editor

;; *************** function _init_numeric_editor *****************
;; Defined at:
;;		line 1073 in file "src\menu.c"
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
;;		On entry : 0/4
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
psect	text44,class=CODE,space=0,reloc=2,group=0
	line	1073
global __ptext44
__ptext44:
psect	text44
	file	"src\menu.c"
	line	1073
	
_init_numeric_editor:
;incstack = 0
	callstack 26
	line	1077
	
l14073:
	movlb	4	; () banked
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
	line	1078
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
	line	1081
	
l14075:; BSR set to: 4

	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+0Fh))&0ffh
	line	1083
	
l14077:; BSR set to: 5

	movf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u18761
	goto	u18760
u18761:
	goto	l14085
u18760:
	line	1086
	
l14079:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u18771
	goto	u18770

u18771:
	goto	l14083
u18770:
	
l14081:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18781
	goto	u18780

u18781:
	goto	l14099
u18780:
	line	1087
	
l14083:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+0Fh))&0ffh
	goto	l14099
	line	1089
	
l14085:; BSR set to: 5

		decf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u18791
	goto	u18790

u18791:
	goto	l14091
u18790:
	line	1092
	
l14087:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18801
	goto	u18800

u18801:
	goto	l14099
u18800:
	goto	l14083
	line	1095
	
l14091:; BSR set to: 5

		movlw	2
	xorwf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u18811
	goto	u18810

u18811:
	goto	l14099
u18810:
	
l14093:; BSR set to: 5

	movf	((c:init_numeric_editor@flow_type))^00h,c,w
	btfss	status,2
	goto	u18821
	goto	u18820
u18821:
	goto	l14099
u18820:
	line	1098
	
l14095:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18831
	goto	u18830

u18831:
	goto	l14099
u18830:
	goto	l14083
	line	1103
	
l14099:; BSR set to: 5

	movff	(c:init_numeric_editor@value),0+(_menu+0Dh)
	movff	(c:init_numeric_editor@value+1),1+(_menu+0Dh)
	line	1106
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u18841
	goto	u18840
u18841:
	goto	l823
u18840:
	
l14101:; BSR set to: 5

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u18850
	goto	u18851

u18851:
	goto	l823
u18850:
	line	1107
	
l14103:; BSR set to: 5

	movlw	high(0)
	movwf	((c:init_numeric_editor@value+1))^00h,c
	movlw	low(0)
	movwf	((c:init_numeric_editor@value))^00h,c
	
l823:; BSR set to: 5

	line	1110
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u18861
	goto	u18860
u18861:
	goto	l14107
u18860:
	
l14105:; BSR set to: 5

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u18871
	goto	u18870

u18871:
	movlw	1
	goto	u18880
u18870:
	movlw	0
u18880:
	movwf	((c:_init_numeric_editor$1433))^00h,c
	clrf	((c:_init_numeric_editor$1433+1))^00h,c
	goto	l14109
	
l14107:; BSR set to: 5

	movlw	high(0)
	movwf	((c:_init_numeric_editor$1433+1))^00h,c
	movlw	low(0)
	movwf	((c:_init_numeric_editor$1433))^00h,c
	
l14109:; BSR set to: 5

	movff	(c:_init_numeric_editor$1433),0+(_menu+09h)
	line	1113
	
l14111:; BSR set to: 5

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u18891
	goto	u18890

u18891:
	goto	l829
u18890:
	
l14113:; BSR set to: 5

	movff	(c:init_numeric_editor@value),(c:init_numeric_editor@abs_val)
	movff	(c:init_numeric_editor@value+1),(c:init_numeric_editor@abs_val+1)
	goto	l14115
	
l829:; BSR set to: 5

	movff	(c:init_numeric_editor@value),??_init_numeric_editor+0+0
	movff	(c:init_numeric_editor@value+1),??_init_numeric_editor+0+0+1
	comf	(??_init_numeric_editor+0+0)^00h,c
	comf	(??_init_numeric_editor+0+1)^00h,c
	infsnz	(??_init_numeric_editor+0+0)^00h,c
	incf	(??_init_numeric_editor+0+1)^00h,c
	movff	??_init_numeric_editor+0+0,(c:init_numeric_editor@abs_val)
	movff	??_init_numeric_editor+0+1,(c:init_numeric_editor@abs_val+1)
	line	1114
	
l14115:; BSR set to: 5

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
	line	1115
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
	line	1116
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
	line	1119
	
l14117:; BSR set to: 5

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u18901
	goto	u18900
u18901:
	movlw	1
	goto	u18910
u18900:
	movlw	0
u18910:
	movwf	(0+(_menu+08h))&0ffh
	line	1120
	
l832:; BSR set to: 5

	return	;funcret
	callstack 0
GLOBAL	__end_of_init_numeric_editor
	__end_of_init_numeric_editor:
	signat	_init_numeric_editor,4217
	global	_init_datetime_editor

;; *************** function _init_datetime_editor *****************
;; Defined at:
;;		line 639 in file "src\menu.c"
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
psect	text45,class=CODE,space=0,reloc=2,group=0
	line	639
global __ptext45
__ptext45:
psect	text45
	file	"src\menu.c"
	line	639
	
_init_datetime_editor:; BSR set to: 5

;incstack = 0
	callstack 23
	line	644
	
l13755:
		movlw	low(init_datetime_editor@current_time)
	movwf	((c:rtc_read_time@time))^00h,c
	movlw	high(init_datetime_editor@current_time)
	movwf	((c:rtc_read_time@time+1))^00h,c

	call	_rtc_read_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u18551
	goto	u18550
u18551:
	goto	l13763
u18550:
	line	646
	
l13757:
	movff	0+(init_datetime_editor@current_time+04h),0+(_menu+016h)
	line	647
	movff	0+(init_datetime_editor@current_time+05h),0+(_menu+017h)
	line	648
	movff	0+(init_datetime_editor@current_time+06h),0+(_menu+018h)
	line	649
	movff	0+(init_datetime_editor@current_time+02h),0+(_menu+019h)
	line	650
	movff	0+(init_datetime_editor@current_time+01h),0+(_menu+01Ah)
	line	651
	movff	(init_datetime_editor@current_time),0+(_menu+01Bh)
	line	656
	
l13759:
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
	line	657
	
l13761:
		movlw	low(init_datetime_editor@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(init_datetime_editor@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	658
	goto	l13777
	line	661
	
l13763:
		movlw	low(STR_149)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_149)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	662
	
l13765:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	(0+(_menu+016h))&0ffh
	line	663
	
l13767:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+017h))&0ffh
	line	664
	
l13769:; BSR set to: 5

	movlw	low(019h)
	movwf	(0+(_menu+018h))&0ffh
	line	665
	
l13771:; BSR set to: 5

	movlw	low(0Ch)
	movwf	(0+(_menu+019h))&0ffh
	line	666
	
l13773:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Ah))&0ffh
	line	667
	
l13775:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Bh))&0ffh
	line	670
	
l13777:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+01Ch))&0ffh
	line	671
	
l13779:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Dh))&0ffh
	line	672
	
l13781:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	673
	
l649:; BSR set to: 5

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
;;		On entry : 0/3
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
psect	text46,class=CODE,space=0,reloc=2,group=0
	file	"src\rtc.c"
	line	121
global __ptext46
__ptext46:
psect	text46
	file	"src\rtc.c"
	line	121
	
_rtc_read_time:; BSR set to: 5

;incstack = 0
	callstack 25
	line	126
	
l12407:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16071
	goto	u16070
u16071:
	goto	l12413
u16070:
	line	127
	
l12409:
	movlw	(01h)&0ffh
	goto	l1722
	line	128
	
l12413:
	asmopt push
asmopt off
	movlw	133
u22507:
decfsz	wreg,f
	bra	u22507
	nop
asmopt pop

	line	130
	
l12415:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u16081
	goto	u16080
u16081:
	goto	l12421
u16080:
	goto	l12409
	line	132
	
l12421:
	asmopt push
asmopt off
	movlw	133
u22517:
decfsz	wreg,f
	bra	u22517
	nop
asmopt pop

	line	134
	
l12423:
	movlw	(0)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u16091
	goto	u16090
u16091:
	goto	l12429
u16090:
	goto	l12409
	line	136
	
l12429:
	asmopt push
asmopt off
	movlw	133
u22527:
decfsz	wreg,f
	bra	u22527
	nop
asmopt pop

	line	138
	
l12431:
	call	_i2c_stop	;wreg free
	line	139
	
l12433:
	asmopt push
asmopt off
	movlw	228
u22537:
	nop2
	nop2
decfsz	wreg,f
	bra	u22537
	nop2
	nop2
asmopt pop

	line	142
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16101
	goto	u16100
u16101:
	goto	l12439
u16100:
	goto	l12409
	line	144
	
l12439:
	asmopt push
asmopt off
	movlw	133
u22547:
decfsz	wreg,f
	bra	u22547
	nop
asmopt pop

	line	146
	
l12441:
	movlw	(0D1h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u16111
	goto	u16110
u16111:
	goto	l12447
u16110:
	goto	l12409
	line	148
	
l12447:
	asmopt push
asmopt off
	movlw	133
u22557:
decfsz	wreg,f
	bra	u22557
	nop
asmopt pop

	line	150
	
l12449:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((rtc_read_time@i))&0ffh
	line	152
	
l12455:; BSR set to: 0

	movf	((rtc_read_time@i))&0ffh,w
	addlw	low(rtc_read_time@data)
	movwf	fsr2l
	clrf	fsr2h
	movlw	(01h)&0ffh
	
	call	_i2c_read
	movwf	indf2,c

	line	150
	
l12457:
	movlb	0	; () banked
	incf	((rtc_read_time@i))&0ffh
	
l12459:; BSR set to: 0

		movlw	06h-1
	cpfsgt	((rtc_read_time@i))&0ffh
	goto	u16121
	goto	u16120

u16121:
	goto	l12455
u16120:
	line	154
	
l12461:; BSR set to: 0

	movlw	(0)&0ffh
	
	call	_i2c_read
	movlb	0	; () banked
	movwf	(0+(rtc_read_time@data+06h))&0ffh
	line	155
	call	_i2c_stop	;wreg free
	line	160
	
l12463:
		movlw	low(rtc_read_time@debug_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_352)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_352)
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
	
l12465:
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
	
l12467:
	movlw	(0)&0ffh
	line	173
	
l1722:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rtc_read_time
	__end_of_rtc_read_time:
	signat	_rtc_read_time,4217
	global	_sprintf

;; *************** function _sprintf *****************
;; Defined at:
;;		line 505 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              2   26[COMRAM] PTR unsigned char 
;;		 -> rtc_read_time@debug_buf(80), rtc_set_time@buf(80), menu_handle_button@buf_1777(50), menu_handle_button@buf_1771(50), 
;;		 -> menu_handle_button@buf_1762(50), menu_handle_button@buf_1752(50), menu_handle_button@buf_1725(50), menu_handle_button@buf_1712(80), 
;;		 -> menu_handle_button@buf_1693(80), menu_handle_button@buf_1691(50), menu_handle_button@buf(50), menu_handle_encoder@buf_1666(50), 
;;		 -> menu_handle_encoder@buf_1663(50), menu_handle_encoder@buf(50), STR_273(1), value_pwr_fail(6), 
;;		 -> value_brightness(4), value_contrast(4), value_menu_timeout(6), value_log_entries(6), 
;;		 -> STR_272(1), STR_271(1), STR_270(1), value_clock_display(10), 
;;		 -> value_end_runtime(10), value_clock_enable(10), rebuild_clock_menu@buf(50), menu_draw_input@title(10), 
;;		 -> menu_update_edit_value@value_buf(10), handle_numeric_rotation@buf(50), rebuild_input_menu@buf(50), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), menu_update_datetime_display@time_buf(9), menu_update_datetime_display@date_buf(9), 
;;		 -> init_datetime_editor@buf(80), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), value_relay_pulse(10), 
;;		 -> handle_time_rotation@buf(50), init_time_editor@buf(60), NULL(0), main@buf_707(30), 
;;		 -> main@buf_675(40), main@buf_672(60), main@buf_667(50), main@time_buf(60), 
;;		 -> main@buf_633(30), main@buf_628(50), main@buf(50), trigger_relay_pulse@buf(60), 
;;  f               2   28[COMRAM] PTR const unsigned char 
;;		 -> STR_352(40), STR_351(50), STR_345(28), STR_340(46), 
;;		 -> STR_333(32), STR_332(38), STR_330(5), STR_329(6), 
;;		 -> STR_328(6), STR_327(5), STR_326(6), STR_325(6), 
;;		 -> STR_324(5), STR_323(5), STR_322(6), STR_321(6), 
;;		 -> STR_319(10), STR_318(26), STR_314(44), STR_312(45), 
;;		 -> STR_311(34), STR_310(42), STR_309(32), STR_308(10), 
;;		 -> STR_307(10), STR_306(26), STR_305(28), STR_304(25), 
;;		 -> STR_303(20), STR_302(26), STR_301(35), STR_300(28), 
;;		 -> STR_299(37), STR_298(32), STR_297(23), STR_296(37), 
;;		 -> STR_278(10), STR_277(3), STR_276(3), STR_275(10), 
;;		 -> STR_274(3), STR_269(29), STR_268(46), STR_266(10), 
;;		 -> STR_260(3), STR_259(35), STR_235(9), STR_225(9), 
;;		 -> STR_224(7), STR_223(29), STR_221(48), STR_220(10), 
;;		 -> STR_218(10), STR_217(5), STR_216(6), STR_215(6), 
;;		 -> STR_199(10), STR_198(3), STR_197(6), STR_196(6), 
;;		 -> STR_183(10), STR_182(10), STR_181(5), STR_180(10), 
;;		 -> STR_179(5), STR_178(6), STR_177(6), STR_173(3), 
;;		 -> STR_159(15), STR_158(15), STR_157(13), STR_156(13), 
;;		 -> STR_155(13), STR_154(15), STR_153(15), STR_152(13), 
;;		 -> STR_151(13), STR_150(13), STR_148(47), STR_144(27), 
;;		 -> STR_143(51), STR_142(3), STR_141(25), STR_140(45), 
;;		 -> STR_138(35), STR_30(17), STR_29(23), STR_28(35), 
;;		 -> STR_27(17), STR_25(37), STR_14(28), STR_11(28), 
;;		 -> STR_6(39), STR_3(27), STR_1(48), 
;; Auto vars:     Size  Location     Type
;;  idx             1   47[COMRAM] unsigned char 
;;  tmpval          4    0        struct .
;;  width           2   60[COMRAM] int 
;;  val             2   58[COMRAM] unsigned int 
;;  len             2   55[COMRAM] unsigned int 
;;  cp              2   53[COMRAM] PTR const unsigned char 
;;		 -> STR_364(7), sprintf@c(1), ?_sprintf(2), STR_273(1), 
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
psect	text47,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
global __ptext47
__ptext47:
psect	text47
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
	
_sprintf:
;incstack = 0
	callstack 27
	line	550
	
l12039:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l12249
	line	555
	
l12041:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u15371
	goto	u15370

u15371:
	goto	l12047
u15370:
	line	558
	
l12043:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15387
	movff	(c:sprintf@c),tablat
	tblwt*
	bra	u15380
u15387:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:sprintf@c),indf0
u15380:
	
	
l12045:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l12249
	line	563
	
l12047:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	565
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	goto	l12057
	line	578
	
l12049:
	bsf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	579
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	580
	goto	l12057
	line	585
	
l12051:
	bsf	(0+(1/8)+(c:sprintf@flag))^00h,c,(1)&7
	line	586
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	587
	goto	l12057
	line	597
	
l12053:
	bsf	(0+(2/8)+(c:sprintf@flag))^00h,c,(2)&7
	line	598
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	568
	
l12057:
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
	goto	l12049
	xorlw	43^32	; case 43
	skipnz
	goto	l12051
	xorlw	48^43	; case 48
	skipnz
	goto	l12053
	goto	l1784

	line	603
	
l1784:
	line	606
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u15391
	goto	u15390
u15391:
	goto	l12061
u15390:
	line	607
	
l12059:
	bcf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	614
	
l12061:
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
	goto	u15401
	goto	u15400
u15401:
	goto	l12121
u15400:
	line	615
	
l12063:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	617
	
l12065:
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
	
l12067:
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

	
l12069:
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	619
	
l12071:
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
	goto	u15411
	goto	u15410
u15411:
	goto	l12065
u15410:
	goto	l12121
	line	747
	
l12073:
	bsf	(0+(7/8)+(c:sprintf@flag))^00h,c,(7)&7
	line	749
	goto	l12123
	line	760
	
l12075:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l12077:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l12079:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u15421
	goto	u15420

u15421:
	goto	l12083
u15420:
	line	767
	
l12081:
		movlw	low(STR_364)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_364)
	movwf	((c:sprintf@cp+1))^00h,c

	line	771
	
l12083:
	movlw	high(0)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@len))^00h,c
	line	772
	goto	l12087
	line	773
	
l12085:
	infsnz	((c:sprintf@len))^00h,c
	incf	((c:sprintf@len+1))^00h,c
	line	772
	
l12087:
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
	bra	u15437
	tblrd	*
	
	movf	tablat,w
	bra	u15430
u15437:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15430:
	iorlw	0
	btfss	status,2
	goto	u15441
	goto	u15440
u15441:
	goto	l12085
u15440:
	line	783
	
l12089:
		movf	((c:sprintf@width))^00h,c,w
	subwf	((c:sprintf@len))^00h,c,w
	movf	((c:sprintf@width+1))^00h,c,w
	subwfb	((c:sprintf@len+1))^00h,c,w
	btfsc	status,0
	goto	u15451
	goto	u15450

u15451:
	goto	l12093
u15450:
	line	784
	
l12091:
	movf	((c:sprintf@len))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	subwfb	((c:sprintf@width+1))^00h,c

	goto	l12099
	line	786
	
l12093:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	goto	l12099
	line	791
	
l12095:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15467
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u15460
u15467:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u15460:
	
	
l12097:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	790
	
l12099:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
		incf	((c:sprintf@width))^00h,c,w
	bnz	u15471
	incf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u15471
	goto	u15470

u15471:
	goto	l12095
u15470:
	goto	l12107
	line	794
	
l12101:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15487
	tblrd	*
	
	movf	tablat,w
	bra	u15480
u15487:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15480:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movwf	(??_sprintf+0+0)^00h,c
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15497
	movff	??_sprintf+0+0,tablat
	tblwt*
	bra	u15490
u15497:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	??_sprintf+0+0,indf0
u15490:
	
	
l12103:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l12105:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	793
	
l12107:
	decf	((c:sprintf@len))^00h,c
	btfss	status,0
	decf	((c:sprintf@len+1))^00h,c
		incf	((c:sprintf@len))^00h,c,w
	bnz	u15501
	incf	((c:sprintf@len+1))^00h,c,w
	btfss	status,2
	goto	u15501
	goto	u15500

u15501:
	goto	l12101
u15500:
	goto	l12249
	line	825
	
l12109:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:sprintf@c))^00h,c
	
l12111:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	831
	
l12113:
		movlw	low(sprintf@c)
	movwf	((c:sprintf@cp))^00h,c
	clrf	((c:sprintf@cp+1))^00h,c

	line	832
	
l12115:
	movlw	high(01h)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(01h)
	movwf	((c:sprintf@len))^00h,c
	line	833
	goto	l12089
	line	844
	
l12117:
	movlw	(0C0h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	845
	goto	l12123
	line	661
	
l12121:
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
	goto	l12251
	xorlw	88^0	; case 88
	skipnz
	goto	l12073
	xorlw	99^88	; case 99
	skipnz
	goto	l12109
	xorlw	100^99	; case 100
	skipnz
	goto	l12123
	xorlw	105^100	; case 105
	skipnz
	goto	l12123
	xorlw	115^105	; case 115
	skipnz
	goto	l12075
	xorlw	117^115	; case 117
	skipnz
	goto	l12117
	xorlw	120^117	; case 120
	skipnz
	goto	l12073
	goto	l12113

	line	1277
	
l12123:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	0C0h
	andwf	(??_sprintf+0+0)^00h,c
	btfss	status,2
	goto	u15511
	goto	u15510
u15511:
	goto	l12135
u15510:
	line	1285
	
l12125:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l12127:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l12129:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u15520
	goto	u15521

u15521:
	goto	l12169
u15520:
	line	1288
	
l12131:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l12133:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	goto	l12169
	line	1312
	
l12135:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l12137:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	goto	l12169
	line	1331
	
l12139:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l12141:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u15531
	goto	u15530

u15531:
	goto	l12145
u15530:
	goto	l12171
	line	1332
	
l12145:
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
	goto	u15541
	goto	u15540

u15541:
	goto	l12149
u15540:
	goto	l12171
	line	1331
	
l12149:
	incf	((c:sprintf@c))^00h,c
	goto	l12141
	line	1342
	
l12153:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l12155:
		movlw	4
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u15551
	goto	u15550

u15551:
	goto	l12159
u15550:
	goto	l12171
	line	1343
	
l12159:
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
	goto	u15561
	goto	u15560

u15561:
	goto	l12163
u15560:
	goto	l12171
	line	1342
	
l12163:
	incf	((c:sprintf@c))^00h,c
	goto	l12155
	line	1320
	
l12169:
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
	goto	l12139
	xorlw	128^0	; case 128
	skipnz
	goto	l12153
	xorlw	192^128	; case 192
	skipnz
	goto	l12139
	goto	l12171

	line	1371
	
l12171:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u15571
	goto	u15570

u15571:
	goto	l12177
u15570:
	
l12173:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u15581
	goto	u15580
u15581:
	goto	l12177
u15580:
	line	1372
	
l12175:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	line	1407
	
l12177:
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
	goto	u15591
	goto	u15590

u15591:
	goto	l12181
u15590:
	line	1408
	
l12179:
	movf	((c:sprintf@c))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movlw	0
	subwfb	((c:sprintf@width+1))^00h,c
	goto	l12183
	line	1410
	
l12181:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	1413
	
l12183:
	
	btfss	((c:sprintf@flag))^00h,c,(2)&7
	goto	u15601
	goto	u15600
u15601:
	goto	l12209
u15600:
	line	1415
	
l12185:
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u15611
	goto	u15610
u15611:
	goto	l1832
u15610:
	line	1416
	
l12187:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u15621
	goto	u15620
u15621:
	goto	l12191
u15620:
	
l12189:
	movlw	high(02Bh)
	movwf	((c:_sprintf$2508+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$2508))^00h,c
	goto	l12193
	
l12191:
	movlw	high(02Dh)
	movwf	((c:_sprintf$2508+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$2508))^00h,c
	
l12193:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15637
	movff	(c:_sprintf$2508),tablat
	tblwt*
	bra	u15630
u15637:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:_sprintf$2508),indf0
u15630:
	
	
l12195:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l12201
	line	1422
	
l1832:
	line	1425
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u15641
	goto	u15640
u15641:
	goto	l12201
u15640:
	line	1426
	
l12197:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15657
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u15650
u15657:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u15650:
	
	goto	l12195
	line	1441
	
l12201:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u15661
	goto	u15660

u15661:
	goto	l12231
u15660:
	line	1443
	
l12203:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15677
	movlw	030h
	movwf	tablat
	tblwt*
	bra	u15670
u15677:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	030h
	movwf	indf0
u15670:
	
	
l12205:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1444
	
l12207:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u15681
	goto	u15680

u15681:
	goto	l12203
u15680:
	goto	l12231
	line	1454
	
l12209:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u15691
	goto	u15690

u15691:
	goto	l1843
u15690:
	line	1456
	
l12211:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15707
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u15700
u15707:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u15700:
	
	
l12213:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1457
	
l12215:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u15711
	goto	u15710

u15711:
	goto	l12211
u15710:
	
l1843:
	line	1460
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u15721
	goto	u15720
u15721:
	goto	l1846
u15720:
	line	1461
	
l12217:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u15731
	goto	u15730
u15731:
	goto	l12221
u15730:
	
l12219:
	movlw	high(02Bh)
	movwf	((c:_sprintf$2509+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$2509))^00h,c
	goto	l12223
	
l12221:
	movlw	high(02Dh)
	movwf	((c:_sprintf$2509+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$2509))^00h,c
	
l12223:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15747
	movff	(c:_sprintf$2509),tablat
	tblwt*
	bra	u15740
u15747:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:_sprintf$2509),indf0
u15740:
	
	
l12225:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l12231
	line	1469
	
l1846:
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u15751
	goto	u15750
u15751:
	goto	l12231
u15750:
	line	1470
	
l12227:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15767
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u15760
u15767:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u15760:
	
	goto	l12225
	line	1498
	
l12231:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l12247
	line	1515
	
l12233:
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
	goto	l12243
	line	1526
	
l12235:
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
	
l12237:
	movlw	low((STR_365))
	addwf	((c:sprintf@idx))^00h,c,w
	movwf	tblptrl
	clrf	tblptrh
	movlw	high((STR_365))
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
	goto	l12243
	line	1502
	
l12241:
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
	goto	l12233
	xorlw	128^0	; case 128
	skipnz
	goto	l12235
	xorlw	192^128	; case 192
	skipnz
	goto	l12233
	goto	l12243

	line	1550
	
l12243:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15777
	movff	(c:sprintf@c),tablat
	tblwt*
	bra	u15770
u15777:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:sprintf@c),indf0
u15770:
	
	
l12245:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l12247:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u15781
	goto	u15780

u15781:
	goto	l12241
u15780:
	line	553
	
l12249:
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
	goto	u15791
	goto	u15790
u15791:
	goto	l12041
u15790:
	line	1564
	
l12251:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15807
	movlw	0
	movwf	tablat
	tblwt*
	bra	u15800
u15807:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	0
	movwf	indf0
u15800:
	
	line	1567
	
l1862:
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
psect	text48,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
global __ptext48
__ptext48:
psect	text48
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
	
_isdigit:
;incstack = 0
	callstack 27
	movwf	((c:isdigit@c))^00h,c
	line	14
	
l11977:
	movlw	low(0)
	movwf	((c:_isdigit$2951))^00h,c
	
l11979:
		movlw	03Ah-0
	cpfslt	((c:isdigit@c))^00h,c
	goto	u15291
	goto	u15290

u15291:
	goto	l11985
u15290:
	
l11981:
		movlw	030h-1
	cpfsgt	((c:isdigit@c))^00h,c
	goto	u15301
	goto	u15300

u15301:
	goto	l11985
u15300:
	
l11983:
	movlw	low(01h)
	movwf	((c:_isdigit$2951))^00h,c
	
l11985:
	movff	(c:_isdigit$2951),??_isdigit+0+0
	rrcf	(??_isdigit+0+0)^00h,c,w
	line	15
	
l2529:
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
psect	text49,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
global __ptext49
__ptext49:
psect	text49
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
	
___wmul:
;incstack = 0
	callstack 27
	line	37
	
l11989:
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
	
l11991:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	line	53
	
l1865:
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
;;		On entry : 0/6
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
psect	text50,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext50
__ptext50:
psect	text50
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
___lwmod:
;incstack = 0
	callstack 27
	line	12
	
l12017:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u15341
	goto	u15340

u15341:
	goto	l2354
u15340:
	line	13
	
l12019:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l12023
	line	15
	
l12021:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l12023:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u15351
	goto	u15350
u15351:
	goto	l12021
u15350:
	line	19
	
l12025:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u15361
	goto	u15360

u15361:
	goto	l12029
u15360:
	line	20
	
l12027:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l12029:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l12031:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l12025
	line	23
	
l2354:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l2361:
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
;;		On entry : 0/6
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
psect	text51,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
global __ptext51
__ptext51:
psect	text51
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
	
___lwdiv:
;incstack = 0
	callstack 27
	line	13
	
l11995:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l11997:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u15311
	goto	u15310

u15311:
	goto	l2344
u15310:
	line	15
	
l11999:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l12003
	line	17
	
l12001:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l12003:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u15321
	goto	u15320
u15321:
	goto	l12001
u15320:
	line	21
	
l12005:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l12007:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u15331
	goto	u15330

u15331:
	goto	l12013
u15330:
	line	23
	
l12009:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l12011:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l12013:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l12015:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l12005
	line	28
	
l2344:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l2351:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
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
psect	text52,class=CODE,space=0,reloc=2,group=0
	file	"src\rtc.c"
	line	63
global __ptext52
__ptext52:
psect	text52
	file	"src\rtc.c"
	line	63
	
_bcd_to_dec:
;incstack = 0
	callstack 27
	movwf	((c:bcd_to_dec@bcd))^00h,c
	line	65
	
l12357:
	movff	(c:bcd_to_dec@bcd),??_bcd_to_dec+0+0
	movlw	0Fh
	andwf	(??_bcd_to_dec+0+0)^00h,c
	swapf	((c:bcd_to_dec@bcd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	mullw	0Ah
	movf	(prodl)^0f00h,c,w
	addwf	(??_bcd_to_dec+0+0)^00h,c,w
	line	66
	
l1704:
	return	;funcret
	callstack 0
GLOBAL	__end_of_bcd_to_dec
	__end_of_bcd_to_dec:
	signat	_bcd_to_dec,4217
	global	_get_current_numeric_value

;; *************** function _get_current_numeric_value *****************
;; Defined at:
;;		line 1122 in file "src\menu.c"
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
psect	text53,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1122
global __ptext53
__ptext53:
psect	text53
	file	"src\menu.c"
	line	1122
	
_get_current_numeric_value:
;incstack = 0
	callstack 27
	line	1124
	
l14119:; BSR set to: 5

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
	line	1125
	
l14121:; BSR set to: 5

	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u18921
	goto	u18920
u18921:
	goto	l14125
u18920:
	line	1126
	
l14123:; BSR set to: 5

	negf	((c:get_current_numeric_value@value))^00h,c
	comf	((c:get_current_numeric_value@value+1))^00h,c
	btfsc	status,0
	incf	((c:get_current_numeric_value@value+1))^00h,c
	line	1127
	
l14125:; BSR set to: 5

	movff	(c:get_current_numeric_value@value),(c:?_get_current_numeric_value)
	movff	(c:get_current_numeric_value@value+1),(c:?_get_current_numeric_value+1)
	line	1128
	
l836:; BSR set to: 5

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
psect	text54,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	163
global __ptext54
__ptext54:
psect	text54
	file	"src\main.c"
	line	163
	
_beep:; BSR set to: 5

;incstack = 0
	callstack 27
	line	165
	
l13119:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	166
	
l13121:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l157
	line	168
	
l13123:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u22567:
decfsz	wreg,f
	bra	u22567
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u22567
	nop2
asmopt pop

	line	166
	
l13125:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l157:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u17411
	goto	u17410

u17411:
	goto	l13123
u17410:
	
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
psect	text55,class=CODE,space=0,reloc=2,group=0
	file	"src\lcd.c"
	line	70
global __ptext55
__ptext55:
psect	text55
	file	"src\lcd.c"
	line	70
	
_lcd_init:
;incstack = 0
	callstack 26
	line	73
	
l14543:; BSR set to: 5

	movlw	(0F0h)&0ffh
	andwf	((c:3986))^0f00h,c	;volatile
	line	74
	
l14545:; BSR set to: 5

	bcf	((c:3986))^0f00h,c,5	;volatile
	line	75
	
l14547:; BSR set to: 5

	bcf	((c:3986))^0f00h,c,6	;volatile
	line	76
	
l14549:; BSR set to: 5

	bcf	((c:3986))^0f00h,c,7	;volatile
	line	79
	
l14551:; BSR set to: 5

	bcf	((c:3977))^0f00h,c,6	;volatile
	line	80
	
l14553:; BSR set to: 5

	bcf	((c:3977))^0f00h,c,5	;volatile
	line	81
	
l14555:; BSR set to: 5

	bcf	((c:3977))^0f00h,c,7	;volatile
	line	82
	
l14557:; BSR set to: 5

	movlw	(0)&0ffh
	
	call	_lcd_write_nibble
	line	85
	
l14559:
	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u22577:
decfsz	wreg,f
	bra	u22577
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u22577
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u22577
	nop
asmopt pop

	line	88
	
l14561:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	89
	
l14563:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	90
	
l14565:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	91
	
l14567:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	92
	
l14569:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	93
	
l14571:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	94
	
l14573:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u22587:
decfsz	wreg,f
	bra	u22587
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u22587
asmopt pop

	line	96
	
l14575:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	97
	
l14577:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	98
	
l14579:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	99
	
l14581:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	100
	
l14583:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u22597:
decfsz	wreg,f
	bra	u22597
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u22597
	nop2
asmopt pop

	line	102
	
l14585:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	103
	
l14587:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	104
	
l14589:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	105
	
l14591:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	106
	
l14593:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u22607:
decfsz	wreg,f
	bra	u22607
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u22607
	nop2
asmopt pop

	line	109
	
l14595:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	110
	
l14597:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	111
	
l14599:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	112
	
l14601:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	113
	
l14603:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u22617:
decfsz	wreg,f
	bra	u22617
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u22617
	nop2
asmopt pop

	line	116
	
l14605:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	119
	
l14607:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	122
	
l14609:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	125
	
l14611:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	126
	
l1573:
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
psect	text56,class=CODE,space=0,reloc=2,group=0
	line	17
global __ptext56
__ptext56:
psect	text56
	file	"src\lcd.c"
	line	17
	
_lcd_cmd:
;incstack = 0
	callstack 24
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	20
	
l11869:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	21
	
l11871:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	22
	
l11873:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	23
	
l11875:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	24
	
l11877:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	25
	
l11879:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	26
	
l11881:
	asmopt push
asmopt off
	movlw	133
u22627:
decfsz	wreg,f
	bra	u22627
	nop
asmopt pop

	line	29
	
l11883:
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	30
	
l11885:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	31
	
l11887:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	32
	
l11889:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	33
	
l11891:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	34
	
l11893:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	37
	
l11895:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u15181
	goto	u15180

u15181:
	goto	l11899
u15180:
	
l11897:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u15191
	goto	u15190

u15191:
	goto	l11901
u15190:
	line	39
	
l11899:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u22637:
decfsz	wreg,f
	bra	u22637
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u22637
	nop2
asmopt pop

	line	40
	goto	l1567
	line	43
	
l11901:
	asmopt push
asmopt off
	movlw	133
u22647:
decfsz	wreg,f
	bra	u22647
	nop
asmopt pop

	line	45
	
l1567:
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
psect	text57,class=CODE,space=0,reloc=2,group=0
	line	8
global __ptext57
__ptext57:
psect	text57
	file	"src\lcd.c"
	line	8
	
_lcd_write_nibble:
;incstack = 0
	callstack 24
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	10
	
l11863:
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u15091
	goto	u15090
u15091:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u15108
u15090:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u15108:
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not ((1<<1)-1)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	11
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u15111
	goto	u15110
u15111:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u15128
u15110:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u15128:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<1)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	12
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u15131
	goto	u15130
u15131:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u15148
u15130:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u15148:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<2)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	13
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u15151
	goto	u15150
u15151:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u15168
u15150:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u15168:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<3)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	14
	
l1560:
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
psect	text58,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	16
global __ptext58
__ptext58:
psect	text58
	file	"src\i2c.c"
	line	16
	
_i2c_init:
;incstack = 0
	callstack 28
	line	19
	
l14411:
	bsf	((c:3988))^0f00h,c,3	;volatile
	line	20
	bsf	((c:3988))^0f00h,c,4	;volatile
	line	23
	
l14413:
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
	
l14415:
	asmopt push
asmopt off
	movlw	26
u22657:
decfsz	wreg,f
	bra	u22657
	nop2
asmopt pop

	line	34
	
l1615:
	return	;funcret
	callstack 0
GLOBAL	__end_of_i2c_init
	__end_of_i2c_init:
	signat	_i2c_init,89
	global	_handle_datetime_rotation

;; *************** function _handle_datetime_rotation *****************
;; Defined at:
;;		line 678 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  direction       1    wreg     char 
;; Auto vars:     Size  Location     Type
;;  direction       1   14[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3F/3
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
psect	text59,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	678
global __ptext59
__ptext59:
psect	text59
	file	"src\menu.c"
	line	678
	
_handle_datetime_rotation:
;incstack = 0
	callstack 28
	movwf	((c:handle_datetime_rotation@direction))^00h,c
	line	680
	
l14875:
	movlb	5	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u19751
	goto	u19750
u19751:
	goto	l14925
u19750:
	line	682
	
l14877:; BSR set to: 5

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u19761
	goto	u19760
u19761:
	goto	l14893
u19760:
	line	684
	
l14879:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u19771
	goto	u19770

u19771:
	goto	l14887
u19770:
	line	686
	
l14881:; BSR set to: 5

	incf	(0+(_menu+016h))&0ffh
	line	687
	
l14883:; BSR set to: 5

		movlw	020h-1
	cpfsgt	(0+(_menu+016h))&0ffh
	goto	u19781
	goto	u19780

u19781:
	goto	l659
u19780:
	line	688
	
l14885:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+016h))&0ffh
	goto	l694
	line	692
	
l14887:; BSR set to: 5

		movlw	02h-0
	cpfslt	(0+(_menu+016h))&0ffh
	goto	u19791
	goto	u19790

u19791:
	goto	l14891
u19790:
	line	693
	
l14889:; BSR set to: 5

	movlw	low(01Fh)
	movwf	(0+(_menu+016h))&0ffh
	goto	l694
	line	695
	
l14891:; BSR set to: 5

	decf	(0+(_menu+016h))&0ffh
	goto	l694
	line	698
	
l14893:; BSR set to: 5

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u19801
	goto	u19800

u19801:
	goto	l14909
u19800:
	line	700
	
l14895:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u19811
	goto	u19810

u19811:
	goto	l14903
u19810:
	line	702
	
l14897:; BSR set to: 5

	incf	(0+(_menu+017h))&0ffh
	line	703
	
l14899:; BSR set to: 5

		movlw	0Dh-1
	cpfsgt	(0+(_menu+017h))&0ffh
	goto	u19821
	goto	u19820

u19821:
	goto	l694
u19820:
	line	704
	
l14901:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+017h))&0ffh
	goto	l694
	line	708
	
l14903:; BSR set to: 5

		movlw	02h-0
	cpfslt	(0+(_menu+017h))&0ffh
	goto	u19831
	goto	u19830

u19831:
	goto	l14907
u19830:
	line	709
	
l14905:; BSR set to: 5

	movlw	low(0Ch)
	movwf	(0+(_menu+017h))&0ffh
	goto	l694
	line	711
	
l14907:; BSR set to: 5

	decf	(0+(_menu+017h))&0ffh
	goto	l694
	line	714
	
l14909:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u19841
	goto	u19840

u19841:
	goto	l659
u19840:
	line	716
	
l14911:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u19851
	goto	u19850

u19851:
	goto	l14919
u19850:
	line	718
	
l14913:; BSR set to: 5

	incf	(0+(_menu+018h))&0ffh
	line	719
	
l14915:; BSR set to: 5

		movlw	064h-1
	cpfsgt	(0+(_menu+018h))&0ffh
	goto	u19861
	goto	u19860

u19861:
	goto	l659
u19860:
	line	720
	
l14917:; BSR set to: 5

	movlw	low(019h)
	movwf	(0+(_menu+018h))&0ffh
	goto	l694
	line	724
	
l14919:; BSR set to: 5

		movlw	01Ah-0
	cpfslt	(0+(_menu+018h))&0ffh
	goto	u19871
	goto	u19870

u19871:
	goto	l14923
u19870:
	line	725
	
l14921:; BSR set to: 5

	movlw	low(063h)
	movwf	(0+(_menu+018h))&0ffh
	goto	l694
	line	727
	
l14923:; BSR set to: 5

	decf	(0+(_menu+018h))&0ffh
	goto	l694
	line	730
	
l659:; BSR set to: 5

	goto	l694
	line	733
	
l14925:; BSR set to: 5

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u19881
	goto	u19880
u19881:
	goto	l14941
u19880:
	line	735
	
l14927:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u19891
	goto	u19890

u19891:
	goto	l14935
u19890:
	line	737
	
l14929:; BSR set to: 5

	incf	(0+(_menu+019h))&0ffh
	line	738
	
l14931:; BSR set to: 5

		movlw	018h-1
	cpfsgt	(0+(_menu+019h))&0ffh
	goto	u19901
	goto	u19900

u19901:
	goto	l694
u19900:
	line	739
	
l14933:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+019h))&0ffh
	goto	l694
	line	743
	
l14935:; BSR set to: 5

	movf	(0+(_menu+019h))&0ffh,w
	btfss	status,2
	goto	u19911
	goto	u19910
u19911:
	goto	l14939
u19910:
	line	744
	
l14937:; BSR set to: 5

	movlw	low(017h)
	movwf	(0+(_menu+019h))&0ffh
	goto	l694
	line	746
	
l14939:; BSR set to: 5

	decf	(0+(_menu+019h))&0ffh
	goto	l694
	line	749
	
l14941:; BSR set to: 5

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u19921
	goto	u19920

u19921:
	goto	l14957
u19920:
	line	751
	
l14943:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u19931
	goto	u19930

u19931:
	goto	l14951
u19930:
	line	753
	
l14945:; BSR set to: 5

	incf	(0+(_menu+01Ah))&0ffh
	line	754
	
l14947:; BSR set to: 5

		movlw	03Ch-1
	cpfsgt	(0+(_menu+01Ah))&0ffh
	goto	u19941
	goto	u19940

u19941:
	goto	l694
u19940:
	line	755
	
l14949:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Ah))&0ffh
	goto	l694
	line	759
	
l14951:; BSR set to: 5

	movf	(0+(_menu+01Ah))&0ffh,w
	btfss	status,2
	goto	u19951
	goto	u19950
u19951:
	goto	l14955
u19950:
	line	760
	
l14953:; BSR set to: 5

	movlw	low(03Bh)
	movwf	(0+(_menu+01Ah))&0ffh
	goto	l694
	line	762
	
l14955:; BSR set to: 5

	decf	(0+(_menu+01Ah))&0ffh
	goto	l694
	line	765
	
l14957:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u19961
	goto	u19960

u19961:
	goto	l694
u19960:
	line	767
	
l14959:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u19971
	goto	u19970

u19971:
	goto	l14967
u19970:
	line	769
	
l14961:; BSR set to: 5

	incf	(0+(_menu+01Bh))&0ffh
	line	770
	
l14963:; BSR set to: 5

		movlw	03Ch-1
	cpfsgt	(0+(_menu+01Bh))&0ffh
	goto	u19981
	goto	u19980

u19981:
	goto	l694
u19980:
	line	771
	
l14965:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Bh))&0ffh
	goto	l694
	line	775
	
l14967:; BSR set to: 5

	movf	(0+(_menu+01Bh))&0ffh,w
	btfss	status,2
	goto	u19991
	goto	u19990
u19991:
	goto	l14971
u19990:
	line	776
	
l14969:; BSR set to: 5

	movlw	low(03Bh)
	movwf	(0+(_menu+01Bh))&0ffh
	goto	l694
	line	778
	
l14971:; BSR set to: 5

	decf	(0+(_menu+01Bh))&0ffh
	line	782
	
l694:; BSR set to: 5

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
psect	text60,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	260
global __ptext60
__ptext60:
psect	text60
	file	"src\eeprom.c"
	line	260
	
_get_menu_timeout_seconds:; BSR set to: 5

;incstack = 0
	callstack 28
	line	263
	
l14395:; BSR set to: 5

		movlw	05h-0
	movlb	7	; () banked
	cpfslt	(0+(_system_config+01h))&0ffh
	goto	u19151
	goto	u19150

u19151:
	goto	l14401
u19150:
	line	265
	
l14397:; BSR set to: 7

	movlw	(01Eh)&0ffh
	goto	l1548
	line	267
	
l14401:; BSR set to: 7

		movlw	079h-1
	cpfsgt	(0+(_system_config+01h))&0ffh
	goto	u19161
	goto	u19160

u19161:
	goto	l14407
u19160:
	goto	l14397
	line	271
	
l14407:; BSR set to: 7

	movf	(0+(_system_config+01h))&0ffh,w
	line	272
	
l1548:; BSR set to: 7

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
;;		On entry : 0/3
;;		On exit  : 3F/5
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
psect	text61,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	205
global __ptext61
__ptext61:
psect	text61
	file	"src\encoder.c"
	line	205
	
_encoder_init:; BSR set to: 7

;incstack = 0
	callstack 28
	line	208
	
l14531:
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
	movlb	5	; () banked
	movwf	((_button_pressed))&0ffh	;volatile
	line	214
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	215
	movlw	low(0)
	movlb	4	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	216
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_relay_ms_counter))&0ffh
	line	219
	
l14533:; BSR set to: 5

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	220
	
l14535:; BSR set to: 5

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	221
	
l14537:; BSR set to: 5

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	224
	
l14539:; BSR set to: 5

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u19271
	goto	u19270
u19271:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u19278
u19270:
	clrf	(??_encoder_init+0+0)^00h,c
u19278:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u19281
	goto	u19280
u19281:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u19288
u19280:
	clrf	(??_encoder_init+1+0)^00h,c
u19288:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movlb	5	; () banked
	movwf	((_enc_state))&0ffh
	line	225
	
l343:; BSR set to: 5

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
psect	text62,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	180
global __ptext62
__ptext62:
psect	text62
	file	"src\eeprom.c"
	line	180
	
_eeprom_init:; BSR set to: 5

;incstack = 0
	callstack 25
	line	182
	
l14361:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	185
	
l14363:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	189
	
l14369:
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
	
l14371:
	incf	((c:eeprom_init@i))^00h,c
	
l14373:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u19111
	goto	u19110

u19111:
	goto	l14369
u19110:
	line	191
	
l14375:
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
	
l14377:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	195
	
l14379:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u19120
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u19121
	goto	u19120

u19121:
	goto	l14385
u19120:
	line	198
	
l14381:
	call	_load_factory_defaults	;wreg free
	line	199
	
l14383:
	call	_save_current_config	;wreg free
	line	203
	
l14385:
	call	_sync_menu_variables	;wreg free
	line	207
	
l14387:
	movlb	7	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	mullw	02h
	movff	prodl,(_menu_timeout_seconds)
	movff	prodh,(_menu_timeout_seconds+1)
	line	210
	
l14389:; BSR set to: 7

	movlb	5	; () banked
		movf	((_menu_timeout_seconds+1))&0ffh,w
	bnz	u19130
	movlw	10
	subwf	 ((_menu_timeout_seconds))&0ffh,w
	btfss	status,0
	goto	u19131
	goto	u19130

u19131:
	goto	l14393
u19130:
	
l14391:; BSR set to: 5

		incf	((_menu_timeout_seconds))&0ffh,w
	movlw	1
	subwfb	((_menu_timeout_seconds+1))&0ffh,w
	btfss	status,0
	goto	u19141
	goto	u19140

u19141:
	goto	l1526
u19140:
	line	212
	
l14393:; BSR set to: 5

	movlw	high(01Eh)
	movwf	((_menu_timeout_seconds+1))&0ffh
	movlw	low(01Eh)
	movwf	((_menu_timeout_seconds))&0ffh
	line	214
	
l1526:; BSR set to: 5

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
psect	text63,class=CODE,space=0,reloc=2,group=0
	line	247
global __ptext63
__ptext63:
psect	text63
	file	"src\eeprom.c"
	line	247
	
_sync_menu_variables:; BSR set to: 5

;incstack = 0
	callstack 27
	line	256
	
l14281:
	movff	_input_config,(c:_enable_edit_flag)
	line	257
	movff	0+(_input_config+01h),(c:_sensor_edit_flag)
	line	258
	
l1544:
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
;;		On entry : 0/4
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
psect	text64,class=CODE,space=0,reloc=2,group=0
	line	216
global __ptext64
__ptext64:
psect	text64
	file	"src\eeprom.c"
	line	216
	
_save_current_config:
;incstack = 0
	callstack 26
	line	219
	
l13723:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	223
	
l13729:
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
	
l13731:
	incf	((c:save_current_config@i))^00h,c
	
l13733:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u18531
	goto	u18530

u18531:
	goto	l13729
u18530:
	line	227
	
l13735:
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
	
l13737:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	231
	
l13739:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	232
	
l1531:
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
;;		On entry : 0/4
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
psect	text65,class=CODE,space=0,reloc=2,group=0
	line	155
global __ptext65
__ptext65:
psect	text65
	file	"src\eeprom.c"
	line	155
	
_eeprom_write_word:
;incstack = 0
	callstack 26
	line	157
	
l13081:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	158
	
l13083:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	159
	
l1505:
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
;;		On entry : 0/4
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
psect	text66,class=CODE,space=0,reloc=2,group=0
	line	161
global __ptext66
__ptext66:
psect	text66
	file	"src\eeprom.c"
	line	161
	
_eeprom_write_block:
;incstack = 0
	callstack 26
	line	163
	
l13085:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	164
	
l13087:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l13093
	line	166
	
l13089:
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
	
l13091:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l13093:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u17381
	goto	u17380

u17381:
	goto	l13089
u17380:
	line	168
	
l1511:
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
;;		On entry : 0/4
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
psect	text67,class=CODE,space=0,reloc=2,group=0
	line	128
global __ptext67
__ptext67:
psect	text67
	file	"src\eeprom.c"
	line	128
	
_eeprom_write_byte:
;incstack = 0
	callstack 26
	line	130
	
l12279:
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
	
l12281:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	139
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	140
	
l12283:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	143
	
l1496:
	line	142
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u15861
	goto	u15860
u15861:
	goto	l1496
u15860:
	
l1498:
	line	144
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	145
	
l1499:
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
psect	text68,class=CODE,space=0,reloc=2,group=0
	line	92
global __ptext68
__ptext68:
psect	text68
	file	"src\eeprom.c"
	line	92
	
_calculate_config_checksum:
;incstack = 0
	callstack 27
	line	94
	
l13037:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	98
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	100
	
l13043:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	101
	
l13045:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	103
	
l13051:
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
	
l13053:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l13055:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u17350
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u17351
	goto	u17350

u17351:
	goto	l13051
u17350:
	line	98
	
l13057:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l13059:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u17361
	goto	u17360

u17361:
	goto	l13043
u17360:
	line	108
	
l13061:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	109
	
l13063:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1928+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1928))^00h,c
	line	111
	
l13069:
	movf	((c:calculate_config_checksum@j_1928))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j_1928+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	109
	
l13071:
	infsnz	((c:calculate_config_checksum@j_1928))^00h,c
	incf	((c:calculate_config_checksum@j_1928+1))^00h,c
	
l13073:
		movf	((c:calculate_config_checksum@j_1928+1))^00h,c,w
	bnz	u17370
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1928))^00h,c,w
	btfss	status,0
	goto	u17371
	goto	u17370

u17371:
	goto	l13069
u17370:
	
l1489:
	line	114
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	115
	
l1490:
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
psect	text69,class=CODE,space=0,reloc=2,group=0
	line	241
global __ptext69
__ptext69:
psect	text69
	file	"src\eeprom.c"
	line	241
	
_load_factory_defaults:
;incstack = 0
	callstack 26
	line	243
	
l14279:
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
	
l1537:
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
psect	text70,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
global __ptext70
__ptext70:
psect	text70
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
	
_memcpy:
;incstack = 0
	callstack 26
	line	34
	
l13013:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l13023
	line	37
	
l13015:
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
	
l13017:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l13019:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l13021:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l13023:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u17301
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u17301
	goto	u17300

u17301:
	goto	l13015
u17300:
	line	41
	
l2535:
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
psect	text71,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	147
global __ptext71
__ptext71:
psect	text71
	file	"src\eeprom.c"
	line	147
	
_eeprom_read_word:
;incstack = 0
	callstack 26
	line	150
	
l14263:
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
	
l14265:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	153
	
l1502:
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
psect	text72,class=CODE,space=0,reloc=2,group=0
	line	170
global __ptext72
__ptext72:
psect	text72
	file	"src\eeprom.c"
	line	170
	
_eeprom_read_block:
;incstack = 0
	callstack 26
	line	172
	
l14269:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	173
	
l14271:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l14277
	line	175
	
l14273:
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
	
l14275:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l14277:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u19021
	goto	u19020

u19021:
	goto	l14273
u19020:
	line	177
	
l1517:
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
psect	text73,class=CODE,space=0,reloc=2,group=0
	line	118
global __ptext73
__ptext73:
psect	text73
	file	"src\eeprom.c"
	line	118
	
_eeprom_read_byte:
;incstack = 0
	callstack 26
	line	120
	
l13075:
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
	
l13077:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	126
	
l1493:
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
psect	text74,class=CODE,space=0,reloc=2,group=0
	file	"src\ad7994.c"
	line	60
global __ptext74
__ptext74:
psect	text74
	file	"src\ad7994.c"
	line	60
	
_ad7994_read_channel:
;incstack = 0
	callstack 26
	movwf	((c:ad7994_read_channel@channel))^00h,c
	line	70
	
l14613:
	goto	l14625
	line	73
	
l14615:
	movlw	low(018h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	74
	goto	l14627
	line	76
	
l14617:
	movlw	low(028h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	77
	goto	l14627
	line	79
	
l14619:
	movlw	low(048h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	80
	goto	l14627
	line	82
	
l14621:
	movlw	low(088h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	83
	goto	l14627
	line	84
	
l1760:
	line	86
	setf	((c:?_ad7994_read_channel))^00h,c
	setf	((c:?_ad7994_read_channel+1))^00h,c
	goto	l1761
	line	70
	
l14625:
	movf	((c:ad7994_read_channel@channel))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 1 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l14615
	xorlw	2^1	; case 2
	skipnz
	goto	l14617
	xorlw	3^2	; case 3
	skipnz
	goto	l14619
	xorlw	4^3	; case 4
	skipnz
	goto	l14621
	goto	l1760

	line	89
	
l14627:
	call	_i2c_start	;wreg free
	line	90
	
l14629:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	line	91
	
l14631:
	movlw	(02h)&0ffh
	
	call	_i2c_write
	line	92
	
l14633:
	movf	((c:ad7994_read_channel@config_byte))^00h,c,w
	
	call	_i2c_write
	line	93
	
l14635:
	call	_i2c_stop	;wreg free
	line	95
	
l14637:
	bsf	((c:3979))^0f00h,c,5	;volatile
	line	96
	
l14639:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	97
	
l14641:
	bcf	((c:3979))^0f00h,c,5	;volatile
	line	98
	
l14643:
	asmopt push
asmopt off
	movlw	5
u22667:
decfsz	wreg,f
	bra	u22667
	nop
asmopt pop

	line	100
	
l14645:
	call	_i2c_start	;wreg free
	line	101
	
l14647:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	line	102
	
l14649:
	movlw	(0)&0ffh
	
	call	_i2c_write
	line	103
	
l14651:
	call	_i2c_stop	;wreg free
	line	105
	
l14653:
	call	_i2c_start	;wreg free
	line	106
	
l14655:
	movlw	(045h)&0ffh
	
	call	_i2c_write
	line	107
	
l14657:
	movlw	(01h)&0ffh
	
	call	_i2c_read
	movwf	((c:ad7994_read_channel@msb))^00h,c
	line	108
	
l14659:
	movlw	(0)&0ffh
	
	call	_i2c_read
	movwf	((c:ad7994_read_channel@lsb))^00h,c
	line	109
	
l14661:
	call	_i2c_stop	;wreg free
	line	111
	movf	((c:ad7994_read_channel@msb))^00h,c,w
	movwf	(??_ad7994_read_channel+0+0)^00h,c
	movf	((c:ad7994_read_channel@lsb))^00h,c,w
	movwf	((c:ad7994_read_channel@result))^00h,c
	movff	??_ad7994_read_channel+0+0,((c:ad7994_read_channel@result+1))
	line	116
	
l14663:
	movlw	low(0FFFh)
	andwf	((c:ad7994_read_channel@result))^00h,c
	movlw	high(0FFFh)
	andwf	((c:ad7994_read_channel@result+1))^00h,c
	line	121
	
l14665:
	movff	(c:ad7994_read_channel@result),(c:?_ad7994_read_channel)
	movff	(c:ad7994_read_channel@result+1),(c:?_ad7994_read_channel+1)
	line	122
	
l1761:
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
psect	text75,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	142
global __ptext75
__ptext75:
psect	text75
	file	"src\i2c.c"
	line	142
	
_i2c_read:
;incstack = 0
	callstack 26
	movwf	((c:i2c_read@ack))^00h,c
	line	146
	
l12323:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u15951
	goto	u15950
u15951:
	goto	l1656
u15950:
	line	147
	
l12325:
	movlw	(0FFh)&0ffh
	goto	l1657
	
l1656:
	line	149
	bsf	((c:4037))^0f00h,c,3	;volatile
	line	152
	
l12329:
	movlw	high(03E8h)
	movwf	((c:i2c_read@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_read@timeout))^00h,c
	line	153
	goto	l1658
	line	155
	
l12331:
	decf	((c:i2c_read@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_read@timeout+1))^00h,c
	movf	((c:i2c_read@timeout))^00h,c,w
iorwf	((c:i2c_read@timeout+1))^00h,c,w
	btfss	status,2
	goto	u15961
	goto	u15960

u15961:
	goto	l1658
u15960:
	goto	l12325
	line	157
	
l1658:
	line	153
	btfss	((c:4039))^0f00h,c,0	;volatile
	goto	u15971
	goto	u15970
u15971:
	goto	l12331
u15970:
	
l1661:
	line	159
	movff	(c:4041),(c:i2c_read@data)	;volatile
	line	161
	
l12337:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u15981
	goto	u15980
u15981:
	goto	l12343
u15980:
	line	162
	
l12339:
	movf	((c:i2c_read@data))^00h,c,w
	goto	l1657
	line	165
	
l12343:
	movf	((c:i2c_read@ack))^00h,c,w
	btfsc	status,2
	goto	u15991
	goto	u15990
u15991:
	clrf	(??_i2c_read+0+0)^00h,c
	incf	(??_i2c_read+0+0)^00h,c
	goto	u16008
u15990:
	clrf	(??_i2c_read+0+0)^00h,c
u16008:
	swapf	(??_i2c_read+0+0)^00h,c
	rlncf	(??_i2c_read+0+0)^00h,c
	movf	((c:4037))^0f00h,c,w	;volatile
	xorwf	(??_i2c_read+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<5)
	xorwf	(??_i2c_read+0+0)^00h,c,w
	movwf	((c:4037))^0f00h,c	;volatile
	line	166
	
l12345:
	bsf	((c:4037))^0f00h,c,4	;volatile
	line	169
	
l12347:
	movlw	high(03E8h)
	movwf	((c:i2c_read@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_read@timeout))^00h,c
	line	170
	goto	l1663
	line	172
	
l12349:
	decf	((c:i2c_read@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_read@timeout+1))^00h,c
	movf	((c:i2c_read@timeout))^00h,c,w
iorwf	((c:i2c_read@timeout+1))^00h,c,w
	btfss	status,2
	goto	u16011
	goto	u16010

u16011:
	goto	l1663
u16010:
	goto	l12339
	line	174
	
l1663:
	line	170
	btfsc	((c:4037))^0f00h,c,4	;volatile
	goto	u16021
	goto	u16020
u16021:
	goto	l12349
u16020:
	goto	l12339
	line	177
	
l1657:
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
psect	text76,class=CODE,space=0,reloc=2,group=0
	file	"src\ad7994.c"
	line	14
global __ptext76
__ptext76:
psect	text76
	file	"src\ad7994.c"
	line	14
	
_ad7994_init:
;incstack = 0
	callstack 25
	line	16
	
l14467:
		movlw	low(STR_353)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_353)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	18
	
l14469:
	bcf	((c:3988))^0f00h,c,5	;volatile
	line	19
	
l14471:
	bcf	((c:3979))^0f00h,c,5	;volatile
	line	20
	
l14473:
	asmopt push
asmopt off
movlw	104
movwf	(??_ad7994_init+0+0)^00h,c
	movlw	228
u22677:
decfsz	wreg,f
	bra	u22677
	decfsz	(??_ad7994_init+0+0)^00h,c,f
	bra	u22677
	nop2
asmopt pop

	line	21
	
l14475:
		movlw	low(STR_354)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_354)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	23
	
l14477:
		movlw	low(STR_355)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_355)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	25
	
l14479:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19231
	goto	u19230
u19231:
	goto	l14487
u19230:
	line	27
	
l14481:
		movlw	low(STR_356)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_356)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	28
	
l14483:
	movlw	(01h)&0ffh
	goto	l1748
	line	31
	
l14487:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19241
	goto	u19240
u19241:
	goto	l14497
u19240:
	line	33
	
l14489:
		movlw	low(STR_357)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_357)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	34
	
l14491:
	call	_i2c_stop	;wreg free
	line	35
	
l14493:
	movlw	(02h)&0ffh
	goto	l1748
	line	37
	
l14497:
		movlw	low(STR_358)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_358)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	39
	
l14499:
	movlw	(02h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19251
	goto	u19250
u19251:
	goto	l14509
u19250:
	line	41
	
l14501:
		movlw	low(STR_359)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_359)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	42
	
l14503:
	call	_i2c_stop	;wreg free
	line	43
	
l14505:
	movlw	(03h)&0ffh
	goto	l1748
	line	45
	
l14509:
		movlw	low(STR_360)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_360)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	47
	
l14511:
	movlw	(08h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19261
	goto	u19260
u19261:
	goto	l14521
u19260:
	line	49
	
l14513:
		movlw	low(STR_361)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_361)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	50
	
l14515:
	call	_i2c_stop	;wreg free
	line	51
	
l14517:
	movlw	(04h)&0ffh
	goto	l1748
	line	53
	
l14521:
		movlw	low(STR_362)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_362)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	55
	
l14523:
	call	_i2c_stop	;wreg free
	line	56
	
l14525:
		movlw	low(STR_363)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_363)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	57
	
l14527:
	movlw	(0)&0ffh
	line	58
	
l1748:
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
;;		 -> STR_363(29), STR_362(38), STR_361(43), STR_360(38), 
;;		 -> STR_359(49), STR_358(31), STR_357(39), STR_356(31), 
;;		 -> STR_355(37), STR_354(28), STR_353(22), rtc_read_time@debug_buf(80), 
;;		 -> rtc_set_time@buf(80), STR_350(32), STR_349(28), STR_348(30), 
;;		 -> STR_347(28), STR_346(29), menu_handle_button@buf_1777(50), STR_344(26), 
;;		 -> STR_343(25), STR_342(37), STR_341(37), menu_handle_button@buf_1771(50), 
;;		 -> STR_339(20), STR_334(25), menu_handle_button@buf_1762(50), menu_handle_button@buf_1752(50), 
;;		 -> STR_331(53), STR_320(27), menu_handle_button@buf_1725(50), STR_317(24), 
;;		 -> STR_316(27), STR_315(16), menu_handle_button@buf_1712(80), STR_313(36), 
;;		 -> menu_handle_button@buf_1693(80), menu_handle_button@buf_1691(50), menu_handle_button@buf(50), menu_handle_encoder@buf_1666(50), 
;;		 -> menu_handle_encoder@buf_1663(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), handle_numeric_rotation@buf(50), 
;;		 -> STR_222(31), rebuild_input_menu@buf(50), STR_149(26), init_datetime_editor@buf(80), 
;;		 -> menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), handle_time_rotation@buf(50), STR_139(29), 
;;		 -> init_time_editor@buf(60), STR_41(21), STR_40(20), STR_39(36), 
;;		 -> STR_36(33), STR_35(21), STR_34(20), STR_33(22), 
;;		 -> main@buf_707(30), main@buf_675(40), main@buf_672(60), main@buf_667(50), 
;;		 -> STR_26(16), main@time_buf(60), STR_24(19), STR_23(22), 
;;		 -> STR_22(22), STR_21(24), STR_20(19), STR_19(22), 
;;		 -> STR_16(23), STR_15(28), main@buf_633(30), STR_13(34), 
;;		 -> STR_12(38), main@buf_628(50), STR_10(42), STR_9(37), 
;;		 -> STR_8(16), STR_7(20), main@buf(50), STR_5(23), 
;;		 -> STR_4(29), STR_2(42), trigger_relay_pulse@buf(60), 
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
psect	text77,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	81
global __ptext77
__ptext77:
psect	text77
	file	"src\main.c"
	line	81
	
_uart_println:
;incstack = 0
	callstack 26
	line	83
	
l12033:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	84
	
l12035:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	85
	
l12037:
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
;;		 -> STR_363(29), STR_362(38), STR_361(43), STR_360(38), 
;;		 -> STR_359(49), STR_358(31), STR_357(39), STR_356(31), 
;;		 -> STR_355(37), STR_354(28), STR_353(22), rtc_read_time@debug_buf(80), 
;;		 -> rtc_set_time@buf(80), STR_350(32), STR_349(28), STR_348(30), 
;;		 -> STR_347(28), STR_346(29), menu_handle_button@buf_1777(50), STR_344(26), 
;;		 -> STR_343(25), STR_342(37), STR_341(37), menu_handle_button@buf_1771(50), 
;;		 -> STR_339(20), STR_334(25), menu_handle_button@buf_1762(50), menu_handle_button@buf_1752(50), 
;;		 -> STR_331(53), STR_320(27), menu_handle_button@buf_1725(50), STR_317(24), 
;;		 -> STR_316(27), STR_315(16), menu_handle_button@buf_1712(80), STR_313(36), 
;;		 -> menu_handle_button@buf_1693(80), menu_handle_button@buf_1691(50), menu_handle_button@buf(50), menu_handle_encoder@buf_1666(50), 
;;		 -> menu_handle_encoder@buf_1663(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), handle_numeric_rotation@buf(50), 
;;		 -> STR_222(31), rebuild_input_menu@buf(50), STR_149(26), init_datetime_editor@buf(80), 
;;		 -> menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), handle_time_rotation@buf(50), STR_139(29), 
;;		 -> init_time_editor@buf(60), STR_41(21), STR_40(20), STR_39(36), 
;;		 -> STR_36(33), STR_35(21), STR_34(20), STR_33(22), 
;;		 -> main@buf_707(30), main@buf_675(40), main@buf_672(60), main@buf_667(50), 
;;		 -> STR_26(16), main@time_buf(60), STR_24(19), STR_23(22), 
;;		 -> STR_22(22), STR_21(24), STR_20(19), STR_19(22), 
;;		 -> STR_16(23), STR_15(28), main@buf_633(30), STR_13(34), 
;;		 -> STR_12(38), main@buf_628(50), STR_10(42), STR_9(37), 
;;		 -> STR_8(16), STR_7(20), main@buf(50), STR_5(23), 
;;		 -> STR_4(29), STR_2(42), trigger_relay_pulse@buf(60), 
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
psect	text78,class=CODE,space=0,reloc=2,group=0
	line	73
global __ptext78
__ptext78:
psect	text78
	file	"src\main.c"
	line	73
	
_uart_print:
;incstack = 0
	callstack 26
	line	75
	
l11929:
	goto	l11935
	line	77
	
l11931:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15207
	tblrd	*
	
	movf	tablat,w
	bra	u15200
u15207:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15200:
	
	call	_uart_write
	
l11933:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	75
	
l11935:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15217
	tblrd	*
	
	movf	tablat,w
	bra	u15210
u15217:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15210:
	iorlw	0
	btfss	status,2
	goto	u15221
	goto	u15220
u15221:
	goto	l11931
u15220:
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
psect	text79,class=CODE,space=0,reloc=2,group=0
	line	66
global __ptext79
__ptext79:
psect	text79
	file	"src\main.c"
	line	66
	
_uart_write:
;incstack = 0
	callstack 27
	movwf	((c:uart_write@c))^00h,c
	line	68
	
l11865:
	line	69
	
l124:
	line	68
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u15171
	goto	u15170
u15171:
	goto	l124
u15170:
	line	70
	
l11867:
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
psect	text80,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	119
global __ptext80
__ptext80:
psect	text80
	file	"src\i2c.c"
	line	119
	
_i2c_write:
;incstack = 0
	callstack 27
	movwf	((c:i2c_write@data))^00h,c
	line	121
	
l12313:
	movff	(c:i2c_write@data),(c:4041)	;volatile
	line	125
	
l1649:
	line	124
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u15931
	goto	u15930
u15931:
	goto	l1649
u15930:
	
l1651:
	line	126
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	129
	btfss	((c:4037))^0f00h,c,6	;volatile
	goto	u15941
	goto	u15940
u15941:
	goto	l12319
u15940:
	line	131
	
l12315:
	movlw	(01h)&0ffh
	goto	l1653
	line	134
	
l12319:
	movlw	(0)&0ffh
	line	135
	
l1653:
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
psect	text81,class=CODE,space=0,reloc=2,group=0
	line	99
global __ptext81
__ptext81:
psect	text81
	file	"src\i2c.c"
	line	99
	
_i2c_stop:
;incstack = 0
	callstack 26
	line	101
	
l12303:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u15901
	goto	u15900
u15901:
	goto	l1641
u15900:
	goto	l1642
	line	102
	
l1641:
	line	104
	bsf	((c:4037))^0f00h,c,2	;volatile
	line	107
	
l12307:
	movlw	high(03E8h)
	movwf	((c:i2c_stop@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_stop@timeout))^00h,c
	line	108
	goto	l1643
	line	110
	
l12309:
	decf	((c:i2c_stop@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_stop@timeout+1))^00h,c
	movf	((c:i2c_stop@timeout))^00h,c,w
iorwf	((c:i2c_stop@timeout+1))^00h,c,w
	btfss	status,2
	goto	u15911
	goto	u15910

u15911:
	goto	l1643
u15910:
	goto	l1642
	line	112
	
l1643:
	line	108
	btfsc	((c:4037))^0f00h,c,2	;volatile
	goto	u15921
	goto	u15920
u15921:
	goto	l12309
u15920:
	line	113
	
l1642:
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
psect	text82,class=CODE,space=0,reloc=2,group=0
	line	57
global __ptext82
__ptext82:
psect	text82
	file	"src\i2c.c"
	line	57
	
_i2c_start:
;incstack = 0
	callstack 26
	line	59
	
l12285:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u15871
	goto	u15870
u15871:
	goto	l1625
u15870:
	line	60
	
l12287:
	movlw	(01h)&0ffh
	goto	l1626
	
l1625:
	line	62
	bsf	((c:4037))^0f00h,c,0	;volatile
	line	65
	
l12291:
	movlw	high(03E8h)
	movwf	((c:i2c_start@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_start@timeout))^00h,c
	line	66
	goto	l1627
	line	68
	
l12293:
	decf	((c:i2c_start@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_start@timeout+1))^00h,c
	movf	((c:i2c_start@timeout))^00h,c,w
iorwf	((c:i2c_start@timeout+1))^00h,c,w
	btfss	status,2
	goto	u15881
	goto	u15880

u15881:
	goto	l1627
u15880:
	goto	l12287
	line	70
	
l1627:
	line	66
	btfsc	((c:4037))^0f00h,c,0	;volatile
	goto	u15891
	goto	u15890
u15891:
	goto	l12293
u15890:
	line	72
	
l12299:
	movlw	(0)&0ffh
	line	73
	
l1626:
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
psect	text83,class=CODE,space=0,reloc=2,group=0
	line	40
global __ptext83
__ptext83:
psect	text83
	file	"src\i2c.c"
	line	40
	
_i2c_wait_idle:
;incstack = 0
	callstack 26
	line	42
	
l11961:
	movlw	high(03E8h)
	movwf	((c:i2c_wait_idle@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_wait_idle@timeout))^00h,c
	line	45
	goto	l11969
	line	47
	
l11963:
	decf	((c:i2c_wait_idle@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_wait_idle@timeout+1))^00h,c
	movf	((c:i2c_wait_idle@timeout))^00h,c,w
iorwf	((c:i2c_wait_idle@timeout+1))^00h,c,w
	btfss	status,2
	goto	u15261
	goto	u15260

u15261:
	goto	l11969
u15260:
	line	48
	
l11965:
	movlw	(01h)&0ffh
	goto	l1621
	line	45
	
l11969:
	movff	(c:4037),??_i2c_wait_idle+0+0	;volatile
	movlw	01Fh
	andwf	(??_i2c_wait_idle+0+0)^00h,c
	btfss	status,2
	goto	u15271
	goto	u15270
u15271:
	goto	l11963
u15270:
	
l11971:
	btfsc	((c:4039))^0f00h,c,2	;volatile
	goto	u15281
	goto	u15280
u15281:
	goto	l11963
u15280:
	line	50
	
l11973:
	movlw	(0)&0ffh
	line	51
	
l1621:
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
	
i2l11741:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u1481_41
	goto	i2u1481_40
i2u1481_41:
	goto	i2l340
i2u1481_40:
	line	49
	
i2l11743:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	50
	
i2l11745:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	52
	
i2l11747:
	movlb	5	; () banked
	incf	((_relay_ms_counter))&0ffh
	line	53
	
i2l11749:; BSR set to: 5

		movlw	0Ah-1
	cpfsgt	((_relay_ms_counter))&0ffh
	goto	i2u1482_41
	goto	i2u1482_40

i2u1482_41:
	goto	i2l11771
i2u1482_40:
	line	55
	
i2l11751:; BSR set to: 5

	movlw	low(0)
	movwf	((_relay_ms_counter))&0ffh
	line	57
	
i2l11753:; BSR set to: 5

	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1483_41
	goto	i2u1483_40

i2u1483_41:
	goto	i2l11761
i2u1483_40:
	
i2l11755:; BSR set to: 0

	movf	((c:_relay_latch_mode))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1484_41
	goto	i2u1484_40
i2u1484_41:
	goto	i2l11761
i2u1484_40:
	
i2l11757:; BSR set to: 0

	movlb	4	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	i2u1485_41
	goto	i2u1485_40

i2u1485_41:
	goto	i2l11761
i2u1485_40:
	line	59
	
i2l11759:; BSR set to: 4

	decf	((_relay_counter))&0ffh	;volatile
	btfss	status,0
	decf	((_relay_counter+1))&0ffh	;volatile
	line	60
	goto	i2l11771
	line	61
	
i2l11761:
	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1486_41
	goto	i2u1486_40

i2u1486_41:
	goto	i2l11771
i2u1486_40:
	
i2l11763:; BSR set to: 0

	movf	((c:_relay_latch_mode))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1487_41
	goto	i2u1487_40
i2u1487_41:
	goto	i2l11771
i2u1487_40:
	
i2l11765:; BSR set to: 0

	movlb	4	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1488_41
	goto	i2u1488_40

i2u1488_41:
	goto	i2l11771
i2u1488_40:
	line	64
	
i2l11767:; BSR set to: 4

	bsf	((c:3979))^0f00h,c,1	;volatile
	line	65
	
i2l11769:; BSR set to: 4

	movlw	low(0)
	movlb	0	; () banked
	movwf	((_relay_state))&0ffh	;volatile
	line	71
	
i2l11771:
	incf	((c:_ms_counter))^00h,c	;volatile
	line	72
	
i2l11773:
		movlw	02h-1
	cpfsgt	((c:_ms_counter))^00h,c	;volatile
	goto	i2u1489_41
	goto	i2u1489_40

i2u1489_41:
	goto	i2l11789
i2u1489_40:
	line	74
	
i2l11775:
	movlw	low(0)
	movwf	((c:_ms_counter))^00h,c	;volatile
	line	75
	
i2l11777:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1490_41
	goto	i2u1490_40

i2u1490_41:
	goto	i2l11789
i2u1490_40:
	line	77
	
i2l11779:
	decf	((c:_menu_timeout_timer))^00h,c	;volatile
	btfss	status,0
	decf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	line	80
	
i2l11781:
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
	goto	i2u1491_41
	goto	i2u1491_40

i2u1491_41:
	goto	i2l11785
i2u1491_40:
	line	83
	
i2l11783:
	movlw	low(01h)
	movlb	4	; () banked
	movwf	((_timeout_debug_flag))&0ffh	;volatile
	line	86
	
i2l11785:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1492_41
	goto	i2u1492_40

i2u1492_41:
	goto	i2l11789
i2u1492_40:
	line	88
	
i2l11787:
	movlw	low(0)
	movwf	((c:_menu_timeout_flag))^00h,c	;volatile
	line	94
	
i2l11789:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u1493_41
	goto	i2u1493_40
i2u1493_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u1493_48
i2u1493_40:
	clrf	(??_isr+0+0)^00h,c
i2u1493_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u1494_41
	goto	i2u1494_40
i2u1494_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u1494_48
i2u1494_40:
	clrf	(??_isr+1+0)^00h,c
i2u1494_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	95
	
i2l11791:
	movlb	5	; () banked
	rlncf	((_enc_state))&0ffh,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	98
	
i2l11793:; BSR set to: 5

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
	
i2l11795:; BSR set to: 5

	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u1495_41
	goto	i2u1495_40
i2u1495_41:
	goto	i2l11821
i2u1495_40:
	line	103
	
i2l11797:; BSR set to: 5

		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u1496_41
	goto	i2u1496_40

i2u1496_41:
	goto	i2l11809
i2u1496_40:
	line	105
	
i2l11799:; BSR set to: 5

	movlb	3	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	106
	
i2l11801:; BSR set to: 3

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	109
	
i2l11803:; BSR set to: 3

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1497_41
	goto	i2u1497_40

i2u1497_41:
	goto	i2l11821
i2u1497_40:
	line	111
	
i2l11805:; BSR set to: 3

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	112
	
i2l11807:; BSR set to: 3

	movlw	low(01h)
	movwf	((c:_menu_timeout_flag))^00h,c	;volatile
	goto	i2l11821
	line	115
	
i2l11809:; BSR set to: 5

		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u1498_41
	goto	i2u1498_40

i2u1498_41:
	goto	i2l11821
i2u1498_40:
	line	117
	
i2l11811:; BSR set to: 5

	movlb	3	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	line	118
	
i2l11813:; BSR set to: 3

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	121
	
i2l11815:; BSR set to: 3

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1499_41
	goto	i2u1499_40

i2u1499_41:
	goto	i2l325
i2u1499_40:
	goto	i2l11805
	line	127
	
i2l325:; BSR set to: 3

	line	129
	
i2l11821:
	movff	(c:isr@new_state),(_enc_state)
	line	132
	
i2l11823:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	133
	
i2l11825:
	movlb	5	; () banked
	movf	((_last_btn))&0ffh,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u1500_41
	goto	i2u1500_40

i2u1500_41:
	goto	i2l11853
i2u1500_40:
	line	135
	
i2l11827:; BSR set to: 5

	incf	((_btn_debounce))&0ffh
	line	136
	
i2l11829:; BSR set to: 5

		movlw	014h-1
	cpfsgt	((_btn_debounce))&0ffh
	goto	i2u1501_41
	goto	i2u1501_40

i2u1501_41:
	goto	i2l340
i2u1501_40:
	line	138
	
i2l11831:; BSR set to: 5

	movff	(c:isr@btn),(_last_btn)
	line	139
	
i2l11833:; BSR set to: 5

	movlw	low(0)
	movwf	((_btn_debounce))&0ffh
	line	141
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1502_41
	goto	i2u1502_40
i2u1502_41:
	goto	i2l11843
i2u1502_40:
	line	144
	
i2l11835:; BSR set to: 5

	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	145
	movlw	low(0)
	movlb	4	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	148
	
i2l11837:; BSR set to: 4

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1503_41
	goto	i2u1503_40

i2u1503_41:
	goto	i2l337
i2u1503_40:
	line	150
	
i2l11839:; BSR set to: 4

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	151
	
i2l11841:; BSR set to: 4

	movlw	low(01h)
	movwf	((c:_menu_timeout_flag))^00h,c	;volatile
	goto	i2l340
	line	157
	
i2l11843:; BSR set to: 5

		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1504_41
	goto	i2u1504_40

i2u1504_41:
	goto	i2l11847
i2u1504_40:
	line	159
	
i2l11845:; BSR set to: 5

	movlw	low(02h)
	movlb	4	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	160
	goto	i2l334
	line	161
	
i2l11847:; BSR set to: 5

		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u1505_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1505_41
	goto	i2u1505_40

i2u1505_41:
	goto	i2l11851
i2u1505_40:
	line	163
	
i2l11849:; BSR set to: 5

	movlw	low(01h)
	movlb	4	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	164
	goto	i2l334
	line	167
	
i2l11851:; BSR set to: 5

	movlw	low(0)
	movlb	4	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	168
	
i2l334:; BSR set to: 4

	line	170
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_button_pressed))&0ffh	;volatile
	line	171
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	goto	i2l340
	line	177
	
i2l11853:; BSR set to: 5

	movlw	low(0)
	movwf	((_btn_debounce))&0ffh
	line	179
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1506_41
	goto	i2u1506_40
i2u1506_41:
	goto	i2l340
i2u1506_40:
	
i2l11855:; BSR set to: 5

		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1507_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1507_41
	goto	i2u1507_40

i2u1507_41:
	goto	i2l340
i2u1507_40:
	line	181
	
i2l11857:; BSR set to: 5

	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	184
	
i2l11859:; BSR set to: 5

		movlw	8
	xorwf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1508_41
	movlw	7
	xorwf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1508_41
	goto	i2u1508_40

i2u1508_41:
	goto	i2l337
i2u1508_40:
	line	186
	
i2l11861:; BSR set to: 5

	movlw	low(01h)
	movlb	3	; () banked
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	goto	i2l340
	line	189
	
i2l337:
	line	203
	
i2l340:
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
;;		On entry : 3A/5
;;		On exit  : 3A/0
;;		Unchanged: 3A/0
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
psect	text85,class=CODE,space=0,reloc=2,group=0
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext85
__ptext85:
psect	text85
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
i2___lwmod:
;incstack = 0
	callstack 22
	line	12
	
i2l11371:
	movf	((c:i2___lwmod@divisor))^00h,c,w
iorwf	((c:i2___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	i2u1432_41
	goto	i2u1432_40

i2u1432_41:
	goto	i2l2354
i2u1432_40:
	line	13
	
i2l11373:
	movlw	low(01h)
	movwf	((c:i2___lwmod@counter))^00h,c
	line	14
	goto	i2l11377
	line	15
	
i2l11375:
	bcf	status,0
	rlcf	((c:i2___lwmod@divisor))^00h,c
	rlcf	((c:i2___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:i2___lwmod@counter))^00h,c
	line	14
	
i2l11377:
	
	btfss	((c:i2___lwmod@divisor+1))^00h,c,(15)&7
	goto	i2u1433_41
	goto	i2u1433_40
i2u1433_41:
	goto	i2l11375
i2u1433_40:
	line	19
	
i2l11379:
		movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c,w
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	i2u1434_41
	goto	i2u1434_40

i2u1434_41:
	goto	i2l11383
i2u1434_40:
	line	20
	
i2l11381:
	movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c

	line	21
	
i2l11383:
	bcf	status,0
	rrcf	((c:i2___lwmod@divisor+1))^00h,c
	rrcf	((c:i2___lwmod@divisor))^00h,c
	line	22
	
i2l11385:
	decfsz	((c:i2___lwmod@counter))^00h,c
	
	goto	i2l11379
	line	23
	
i2l2354:
	line	24
	movff	(c:i2___lwmod@dividend),(c:?i2___lwmod)
	movff	(c:i2___lwmod@dividend+1),(c:?i2___lwmod+1)
	line	25
	
i2l2361:
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
