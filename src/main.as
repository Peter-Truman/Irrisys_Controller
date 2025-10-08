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
	global	_menu_timeout_seconds
	global	_last_btn
	global	_relay_slp_edit_flag
	global	_display_edit_flag
	global	_flow_type_edit_flag
	global	_enable_edit_flag
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
	global	menu_draw_setup@F2710
	global	_value_clock_display
	global	_value_high_tbp
	global	_value_low_flow_bp
	global	_value_no_flow_bp
	global	_value_low_flow
	global	_value_no_flow
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

	db	low(01h)
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
	
STR_315:
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
	
STR_337:
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
	
STR_342:
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
	
STR_329:
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
	
STR_340:
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
	
STR_301:
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
	
STR_304:
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
	
STR_306:
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
	
STR_314:
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
	
STR_330:
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
	
STR_303:
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
	
STR_341:
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
	
STR_339:
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
	
STR_310:
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
	
STR_305:
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
	
STR_318:
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
	
STR_307:
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
	
STR_311:
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
	
STR_309:
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
	
STR_331:
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
	
STR_302:
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
	
STR_338:
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
	
STR_336:
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
	
STR_308:
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
	
STR_350:
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
	
STR_136:
	db	77	;'M'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	32
	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
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
	
STR_139:
	db	80	;'P'
	db	119	;'w'
	db	114	;'r'
	db	32
	db	70	;'F'
	db	97	;'a'
	db	105	;'i'
	db	108	;'l'
	db	32
	db	68	;'D'
	db	108	;'l'
	db	121	;'y'
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
	
STR_272:
	db	78	;'N'
	db	111	;'o'
	db	116	;'t'
	db	32
	db	73	;'I'
	db	109	;'m'
	db	112	;'p'
	db	108	;'l'
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
	
STR_349:
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
STR_335	equ	STR_71+0
STR_124	equ	STR_113+0
STR_60	equ	STR_113+4
STR_220	equ	STR_113+4
STR_41	equ	STR_136+5
STR_145	equ	STR_303+29
STR_174	equ	STR_303+29
STR_261	equ	STR_303+29
STR_100	equ	STR_86+0
STR_109	equ	STR_86+0
STR_117	equ	STR_86+0
STR_51	equ	STR_103+5
STR_196	equ	STR_103+5
STR_250	equ	STR_103+5
STR_273	equ	STR_272+0
STR_208	equ	STR_56+0
STR_247	equ	STR_132+4
STR_98	equ	STR_291+1
STR_107	equ	STR_291+1
STR_115	equ	STR_291+1
STR_126	equ	STR_291+1
STR_131	equ	STR_291+1
STR_140	equ	STR_291+1
STR_248	equ	STR_291+1
STR_293	equ	STR_291+1
STR_105	equ	STR_94+0
STR_61	equ	STR_94+4
STR_185	equ	STR_75+0
STR_188	equ	STR_75+0
STR_191	equ	STR_75+0
STR_201	equ	STR_75+0
STR_211	equ	STR_75+0
STR_264	equ	STR_75+0
STR_333	equ	STR_75+0
STR_207	equ	STR_55+0
STR_44	equ	STR_38+0
STR_76	equ	STR_129+4
STR_186	equ	STR_129+4
STR_189	equ	STR_129+4
STR_192	equ	STR_129+4
STR_202	equ	STR_129+4
STR_212	equ	STR_129+4
STR_265	equ	STR_129+4
STR_334	equ	STR_129+4
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
STR_332	equ	STR_46+0
STR_179	equ	STR_178+0
STR_197	equ	STR_178+0
STR_198	equ	STR_178+0
STR_216	equ	STR_178+0
STR_217	equ	STR_178+0
STR_319	equ	STR_178+0
STR_320	equ	STR_178+0
STR_323	equ	STR_178+0
STR_324	equ	STR_178+0
STR_326	equ	STR_178+0
STR_327	equ	STR_178+0
STR_182	equ	STR_180+0
STR_218	equ	STR_180+0
STR_321	equ	STR_180+0
STR_322	equ	STR_180+0
STR_325	equ	STR_180+0
STR_328	equ	STR_180+0
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
STR_312	equ	STR_158+3
STR_313	equ	STR_158+3
STR_317	equ	STR_158+3
STR_157	equ	STR_156+0
STR_225	equ	STR_226+2
STR_316	equ	STR_311+0
STR_199	equ	STR_29+20
STR_275	equ	STR_29+20
STR_277	equ	STR_29+20
STR_278	equ	STR_29+20
STR_167	equ	STR_288+9
STR_172	equ	STR_288+9
STR_235	equ	STR_288+9
STR_241	equ	STR_288+9
STR_253	equ	STR_288+9
STR_257	equ	STR_288+9
STR_283	equ	STR_288+9
STR_296	equ	STR_288+9
STR_299	equ	STR_288+9
STR_171	equ	STR_166+0
STR_234	equ	STR_166+0
STR_239	equ	STR_166+0
STR_252	equ	STR_166+0
STR_256	equ	STR_166+0
STR_281	equ	STR_166+0
STR_295	equ	STR_166+0
STR_297	equ	STR_166+0
STR_215	equ	STR_66+0
STR_40	equ	STR_34+0
STR_280	equ	STR_285+4
STR_101	equ	STR_87+0
STR_120	equ	STR_87+0
STR_102	equ	STR_88+0
STR_121	equ	STR_88+0
STR_43	equ	STR_37+0
STR_258	equ	STR_254+0
STR_150	equ	STR_349+5
STR_165	equ	STR_349+5
STR_170	equ	STR_349+5
STR_229	equ	STR_349+5
STR_232	equ	STR_349+5
STR_242	equ	STR_349+5
STR_284	equ	STR_349+5
STR_300	equ	STR_349+5
STR_164	equ	STR_149+0
STR_169	equ	STR_149+0
STR_228	equ	STR_149+0
STR_231	equ	STR_149+0
STR_240	equ	STR_149+0
STR_282	equ	STR_149+0
STR_298	equ	STR_149+0
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
       ds      31
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
	line	93
_value_flow_units:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	92
_value_flow_type:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	91
_value_high_temp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	90
_value_low_pressure:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	89
_value_hi_pressure:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	84
_value_rlylow:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	83
_value_rlyslp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	82
_value_rlyplp:
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
	line	77
_value_scale20:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	76
_value_scale4:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	74
_value_enable:
       ds      10
psect	bssBANK5,class=BANK5,space=1,noexec,lowdata
global __pbssBANK5
__pbssBANK5:
	global	_system_config
_system_config:
       ds      128
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
psect	bssBIGRAM,class=BIGRAM,space=1,noexec
global __pbssBIGRAM
__pbssBIGRAM:
	global	_input_config
_input_config:
       ds      384
	file	"src\main.as"
	line	#
psect	cinit
; Initialize objects allocated to BANK5 (70 bytes)
	global __pidataBANK5
	; load TBLPTR registers with __pidataBANK5
	movlw	low (__pidataBANK5)
	movwf	tblptrl
	movlw	high(__pidataBANK5)
	movwf	tblptrh
	movlw	low highword(__pidataBANK5)
	movwf	tblptru
	lfsr	0,__pdataBANK5
	lfsr	1,70
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK4 (192 bytes)
	global __pidataBANK4
	; load TBLPTR registers with __pidataBANK4
	movlw	low (__pidataBANK4)
	movwf	tblptrl
	movlw	high(__pidataBANK4)
	movwf	tblptrh
	movlw	low highword(__pidataBANK4)
	movwf	tblptru
	lfsr	0,__pdataBANK4
	lfsr	1,192
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
; Initialize objects allocated to BANK3 (51 bytes)
	global __pidataBANK3
	; load TBLPTR registers with __pidataBANK3
	movlw	low (__pidataBANK3)
	movwf	tblptrl
	movlw	high(__pidataBANK3)
	movwf	tblptrh
	movlw	low highword(__pidataBANK3)
	movwf	tblptru
	lfsr	0,__pdataBANK3
	lfsr	1,51
	copy_data2:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data2
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
; Clear objects allocated to BANK5 (128 bytes)
	global __pbssBANK5
lfsr	0,__pbssBANK5
movlw	128
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
; Clear objects allocated to BANK4 (61 bytes)
	global __pbssBANK4
lfsr	0,__pbssBANK4
movlw	61
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
; Clear objects allocated to BANK3 (135 bytes)
	global __pbssBANK3
lfsr	0,__pbssBANK3
movlw	135
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
psect	cstackBANK5,class=BANK5,space=1,noexec,lowdata
global __pcstackBANK5
__pcstackBANK5:
	global	main@set_time
main@set_time:	; 7 bytes @ 0x0
	ds   7
psect	cstackBANK3,class=BANK3,space=1,noexec,lowdata
global __pcstackBANK3
__pcstackBANK3:
	global	main@buf_678
main@buf_678:	; 40 bytes @ 0x0
	ds   40
	global	main@buf_705
main@buf_705:	; 30 bytes @ 0x28
	ds   30
psect	cstackBANK2,class=BANK2,space=1,noexec,lowdata
global __pcstackBANK2
__pcstackBANK2:
	global	main@time_buf
main@time_buf:	; 60 bytes @ 0x0
	ds   60
	global	main@buf_675
main@buf_675:	; 60 bytes @ 0x3C
	ds   60
	global	main@buf
main@buf:	; 50 bytes @ 0x78
	ds   50
	global	main@buf_670
main@buf_670:	; 50 bytes @ 0xAA
	ds   50
	global	main@buf_636
main@buf_636:	; 30 bytes @ 0xDC
	ds   30
psect	cstackBANK1,class=BANK1,space=1,noexec,lowdata
global __pcstackBANK1
__pcstackBANK1:
	global	menu_handle_encoder@buf_1661
menu_handle_encoder@buf_1661:	; 50 bytes @ 0x0
	global	menu_handle_button@buf_1697
menu_handle_button@buf_1697:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_encoder@buf_1664
menu_handle_encoder@buf_1664:	; 50 bytes @ 0x32
	global	menu_handle_button@buf_1721
menu_handle_button@buf_1721:	; 50 bytes @ 0x32
	ds   50
	global	menu_handle_encoder@buf
menu_handle_encoder@buf:	; 50 bytes @ 0x64
	global	menu_handle_button@buf_1731
menu_handle_button@buf_1731:	; 50 bytes @ 0x64
	ds   50
	global	_menu_handle_encoder$1659
_menu_handle_encoder$1659:	; 2 bytes @ 0x96
	global	menu_handle_button@buf
menu_handle_button@buf:	; 50 bytes @ 0x96
	ds   2
	global	_menu_handle_encoder$1660
_menu_handle_encoder$1660:	; 2 bytes @ 0x98
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
	global	_menu_handle_button$1733
_menu_handle_button$1733:	; 2 bytes @ 0xC8
	ds   2
	global	menu_handle_button@edit_flag_1691
menu_handle_button@edit_flag_1691:	; 2 bytes @ 0xCA
	ds   2
	global	menu_handle_button@opts_1692
menu_handle_button@opts_1692:	; 2 bytes @ 0xCC
	ds   2
	global	menu_handle_button@edit_flag_1724
menu_handle_button@edit_flag_1724:	; 2 bytes @ 0xCE
	ds   2
	global	menu_handle_button@opts_1725
menu_handle_button@opts_1725:	; 2 bytes @ 0xD0
	ds   2
	global	menu_handle_button@current_val_1720
menu_handle_button@current_val_1720:	; 2 bytes @ 0xD2
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
	global	menu_handle_button@flow_type_1717
menu_handle_button@flow_type_1717:	; 1 bytes @ 0xE0
	ds   1
	global	menu_handle_button@flow_type
menu_handle_button@flow_type:	; 1 bytes @ 0xE1
	ds   1
	global	menu_handle_button@sensor_type_1716
menu_handle_button@sensor_type_1716:	; 1 bytes @ 0xE2
	ds   1
	global	menu_handle_button@sensor_type
menu_handle_button@sensor_type:	; 1 bytes @ 0xE3
	ds   1
	global	menu_handle_button@new_value_1702
menu_handle_button@new_value_1702:	; 2 bytes @ 0xE4
	ds   2
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0xE6
	ds   2
	global	main@current_event
main@current_event:	; 1 bytes @ 0xE8
	ds   1
	global	main@delta
main@delta:	; 2 bytes @ 0xE9
	ds   2
	global	main@current_time
main@current_time:	; 7 bytes @ 0xEB
	ds   7
psect	cstackBANK0,class=BANK0,space=1,noexec,lowdata
global __pcstackBANK0
__pcstackBANK0:
??_menu_draw_utility:	; 1 bytes @ 0x0
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
	ds   5
	global	menu_draw_utility@value_buf
menu_draw_utility@value_buf:	; 15 bytes @ 0x5
	ds   5
	global	menu_update_edit_value@value_buf
menu_update_edit_value@value_buf:	; 10 bytes @ 0xA
	ds   5
	global	menu_draw_input@title
menu_draw_input@title:	; 10 bytes @ 0xF
	ds   5
	global	menu_update_edit_value@sensor_type
menu_update_edit_value@sensor_type:	; 1 bytes @ 0x14
	global	menu_draw_utility@start_pos
menu_draw_utility@start_pos:	; 1 bytes @ 0x14
	ds   1
	global	menu_update_edit_value@flow_type
menu_update_edit_value@flow_type:	; 1 bytes @ 0x15
	global	_menu_draw_utility$1627
_menu_draw_utility$1627:	; 2 bytes @ 0x15
	ds   1
	global	_menu_update_edit_value$1449
_menu_update_edit_value$1449:	; 2 bytes @ 0x16
	ds   1
	global	_menu_draw_utility$1635
_menu_draw_utility$1635:	; 2 bytes @ 0x17
	ds   1
	global	_menu_update_edit_value$1453
_menu_update_edit_value$1453:	; 2 bytes @ 0x18
	ds   1
	global	menu_draw_input@start_pos
menu_draw_input@start_pos:	; 1 bytes @ 0x19
	global	_menu_draw_utility$1639
_menu_draw_utility$1639:	; 2 bytes @ 0x19
	ds   1
	global	menu_update_edit_value@start_col
menu_update_edit_value@start_col:	; 1 bytes @ 0x1A
	global	_menu_draw_input$1513
_menu_draw_input$1513:	; 2 bytes @ 0x1A
	ds   1
	global	menu_update_edit_value@blink_pos
menu_update_edit_value@blink_pos:	; 1 bytes @ 0x1B
	global	menu_draw_utility@len
menu_draw_utility@len:	; 1 bytes @ 0x1B
	ds   1
	global	menu_update_edit_value@screen_line
menu_update_edit_value@screen_line:	; 1 bytes @ 0x1C
	global	menu_draw_utility@j
menu_draw_utility@j:	; 1 bytes @ 0x1C
	global	_menu_draw_input$1517
_menu_draw_input$1517:	; 2 bytes @ 0x1C
	ds   1
	global	menu_draw_utility@val_len
menu_draw_utility@val_len:	; 1 bytes @ 0x1D
	ds   1
	global	menu_draw_input@val_len
menu_draw_input@val_len:	; 1 bytes @ 0x1E
	global	menu_draw_utility@show_brackets
menu_draw_utility@show_brackets:	; 1 bytes @ 0x1E
	ds   1
	global	menu_draw_input@j
menu_draw_input@j:	; 1 bytes @ 0x1F
	global	menu_draw_utility@item_idx
menu_draw_utility@item_idx:	; 1 bytes @ 0x1F
	ds   1
	global	menu_draw_utility@i
menu_draw_utility@i:	; 1 bytes @ 0x20
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
	global	_rebuild_input_menu$3186
_rebuild_input_menu$3186:	; 2 bytes @ 0x54
	ds   2
	global	_rebuild_input_menu$3187
_rebuild_input_menu$3187:	; 2 bytes @ 0x56
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
??_menu_handle_button:	; 1 bytes @ 0x6E
	ds   5
	global	main@adc_ch1
main@adc_ch1:	; 2 bytes @ 0x73
	ds   2
	global	main@adc_ch2
main@adc_ch2:	; 2 bytes @ 0x75
	ds   2
	global	main@adc_ch3
main@adc_ch3:	; 2 bytes @ 0x77
	ds   2
	global	main@last_button
main@last_button:	; 1 bytes @ 0x79
	ds   1
	global	main@adc_error
main@adc_error:	; 1 bytes @ 0x7A
	ds   1
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
	global	_isdigit$2904
_isdigit$2904:	; 1 bytes @ 0xF
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
	global	calculate_config_checksum@j_1884
calculate_config_checksum@j_1884:	; 2 bytes @ 0x17
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
	global	_sprintf$2461
_sprintf$2461:	; 2 bytes @ 0x30
	ds   1
	global	_menu_draw_clock$1608
_menu_draw_clock$1608:	; 2 bytes @ 0x31
	ds   1
	global	_sprintf$2462
_sprintf$2462:	; 2 bytes @ 0x32
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
	global	_rebuild_utility_menu$3188
_rebuild_utility_menu$3188:	; 2 bytes @ 0x42
	ds   1
??_init_time_editor:	; 1 bytes @ 0x43
	ds   1
	global	_rebuild_utility_menu$3189
_rebuild_utility_menu$3189:	; 2 bytes @ 0x44
	ds   1
?_menu_handle_encoder:	; 1 bytes @ 0x45
	global	menu_handle_encoder@delta
menu_handle_encoder@delta:	; 2 bytes @ 0x45
	ds   1
	global	rebuild_utility_menu@i
rebuild_utility_menu@i:	; 1 bytes @ 0x46
	ds   1
??_menu_handle_encoder:	; 1 bytes @ 0x47
	ds   2
	global	menu_update_datetime_display@time_buf
menu_update_datetime_display@time_buf:	; 9 bytes @ 0x49
	ds   9
??_main:	; 1 bytes @ 0x52
	ds   2
;!
;!Data Sizes:
;!    Strings     3194
;!    Constant    910
;!    Data        321
;!    BSS         749
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126     84     110
;!    BANK0           128    123     128
;!    BANK1           256    242     254
;!    BANK2           256    250     256
;!    BANK3           256     70     256
;!    BANK4           256      0     253
;!    BANK5           256      7     205
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
;!		 -> STR_132(CODE[10]), STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), 
;!		 -> STR_136(CODE[13]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[13]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    clock_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), 
;!		 -> value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
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
;!		 -> STR_136(CODE[13]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[13]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    clock_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), 
;!		 -> value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
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
;!		 -> STR_132(CODE[10]), STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), 
;!		 -> STR_136(CODE[13]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[13]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    flow_analog_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), 
;!		 -> value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
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
;!		 -> STR_136(CODE[13]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[13]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    flow_digital_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), 
;!		 -> value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
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
;!		 -> STR_136(CODE[13]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[13]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), 
;!		 -> value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
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
;!		 -> STR_134(CODE[10]), STR_135(CODE[12]), STR_136(CODE[13]), STR_137(CODE[9]), 
;!		 -> STR_138(CODE[11]), STR_139(CODE[13]), STR_140(CODE[5]), STR_148(CODE[8]), 
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
;!		 -> STR_295(CODE[2]), STR_296(CODE[2]), STR_297(CODE[2]), STR_298(CODE[2]), 
;!		 -> STR_299(CODE[2]), STR_300(CODE[2]), STR_34(CODE[12]), STR_35(CODE[6]), 
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
;!		 -> STR_133(CODE[9]), STR_134(CODE[10]), STR_135(CODE[12]), STR_136(CODE[13]), 
;!		 -> STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[13]), STR_140(CODE[5]), 
;!		 -> STR_163(CODE[6]), STR_164(CODE[2]), STR_165(CODE[2]), STR_166(CODE[2]), 
;!		 -> STR_167(CODE[2]), STR_168(CODE[6]), STR_169(CODE[2]), STR_170(CODE[2]), 
;!		 -> STR_171(CODE[2]), STR_172(CODE[2]), STR_244(CODE[1]), STR_245(CODE[1]), 
;!		 -> STR_246(CODE[1]), STR_247(CODE[6]), STR_248(CODE[5]), STR_249(CODE[9]), 
;!		 -> STR_250(CODE[5]), STR_251(CODE[5]), STR_280(CODE[6]), STR_285(CODE[10]), 
;!		 -> STR_286(CODE[11]), STR_287(CODE[10]), STR_288(CODE[11]), STR_289(CODE[10]), 
;!		 -> STR_290(CODE[7]), STR_291(CODE[6]), STR_292(CODE[14]), STR_293(CODE[5]), 
;!		 -> STR_294(CODE[8]), STR_295(CODE[2]), STR_296(CODE[2]), STR_80(CODE[10]), 
;!		 -> STR_81(CODE[11]), STR_82(CODE[13]), STR_83(CODE[6]), STR_84(CODE[5]), 
;!		 -> STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), STR_88(CODE[11]), 
;!		 -> STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), STR_92(CODE[6]), 
;!		 -> STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
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
;!    menu_draw_utility$1635	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_297(CODE[2]), STR_298(CODE[2]), 
;!
;!    menu_draw_utility$1639	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_299(CODE[2]), STR_300(CODE[2]), 
;!
;!    menu_handle_button@edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1691	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1724	PTR unsigned char  size(2) Largest target is 1
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
;!    menu_handle_button@opts_1692	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1692$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    menu_handle_button@opts_1725	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1725$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    menu_handle_encoder$3190	const PTR const unsigned char  size(2) Largest target is 9
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
;!		 -> STR_136(CODE[13]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[13]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    pressure_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), 
;!		 -> value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
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
;!		 -> init_datetime_editor@current_time(COMRAM[7]), main@current_time(BANK1[7]), 
;!
;!    rtc_set_time@time	PTR struct . size(2) Largest target is 7
;!		 -> main@set_time(BANK5[7]), 
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
;!		 -> STR_136(CODE[13]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[13]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    S951$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), 
;!		 -> value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
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
;!		 -> clock_menu(BANK3[25]), input_config(BIGRAM[384]), input_menu(BANK3[75]), system_config(BANK5[128]), 
;!
;!    sp__strcpy	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_draw_utility@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), 
;!		 -> original_value(BANK4[10]), STR_271(CODE[1]), STR_272(CODE[9]), STR_273(CODE[9]), 
;!		 -> STR_274(CODE[1]), value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), 
;!		 -> value_clock_enable(BANK4[10]), value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), 
;!		 -> value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), 
;!		 -> value_high_tbp(BANK5[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), 
;!		 -> value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), 
;!		 -> value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), 
;!		 -> value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), 
;!		 -> value_rlyslp(BANK4[10]), value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), 
;!		 -> value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 12
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), menu_item_options$option_count(CODE[1]), menu_update_time_value@value_buf(BANK0[6]), 
;!		 -> relay_high_edit_flag(COMRAM[1]), ?_sprintf(COMRAM[2]), sprintf@c(COMRAM[1]), STR_175(CODE[8]), 
;!		 -> STR_176(CODE[9]), STR_262(CODE[8]), STR_263(CODE[9]), STR_271(CODE[1]), 
;!		 -> STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), STR_349(CODE[7]), 
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
;!		 -> value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), value_high_temp(BANK4[10]), 
;!		 -> value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), 
;!		 -> value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), 
;!		 -> value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), 
;!		 -> value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK4[10]), 
;!		 -> value_scale4(BANK4[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
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
;!		 -> STR_30(CODE[17]), STR_301(CODE[37]), STR_302(CODE[23]), STR_303(CODE[32]), 
;!		 -> STR_304(CODE[37]), STR_305(CODE[28]), STR_306(CODE[35]), STR_307(CODE[26]), 
;!		 -> STR_308(CODE[20]), STR_309(CODE[25]), STR_310(CODE[28]), STR_311(CODE[26]), 
;!		 -> STR_312(CODE[10]), STR_313(CODE[10]), STR_314(CODE[32]), STR_315(CODE[42]), 
;!		 -> STR_316(CODE[26]), STR_317(CODE[10]), STR_319(CODE[6]), STR_320(CODE[6]), 
;!		 -> STR_321(CODE[5]), STR_322(CODE[5]), STR_323(CODE[6]), STR_324(CODE[6]), 
;!		 -> STR_325(CODE[5]), STR_326(CODE[6]), STR_327(CODE[6]), STR_328(CODE[5]), 
;!		 -> STR_329(CODE[38]), STR_330(CODE[32]), STR_337(CODE[40]), STR_6(CODE[39]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(COMRAM[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK2[50]), main@buf_636(BANK2[30]), main@buf_670(BANK2[50]), main@buf_675(BANK2[60]), 
;!		 -> main@buf_678(BANK3[40]), main@buf_705(BANK3[30]), main@time_buf(BANK2[60]), menu_draw_input@title(BANK0[10]), 
;!		 -> menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1697(BANK1[50]), menu_handle_button@buf_1721(BANK1[50]), menu_handle_button@buf_1731(BANK1[50]), 
;!		 -> menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1661(BANK1[50]), menu_handle_encoder@buf_1664(BANK1[50]), menu_update_datetime_display@date_buf(COMRAM[9]), 
;!		 -> menu_update_datetime_display@time_buf(COMRAM[9]), menu_update_edit_value@value_buf(BANK0[10]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), 
;!		 -> rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), STR_271(CODE[1]), 
;!		 -> STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), trigger_relay_pulse@buf(BANK0[60]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), 
;!		 -> value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), 
;!		 -> value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_238(CODE[1]), STR_332(CODE[8]), STR_333(CODE[6]), STR_334(CODE[6]), 
;!		 -> STR_335(CODE[5]), STR_45(CODE[9]), STR_46(CODE[8]), STR_47(CODE[1]), 
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
;!		 -> original_value(BANK4[10]), STR_271(CODE[1]), STR_272(CODE[9]), STR_273(CODE[9]), 
;!		 -> STR_274(CODE[1]), value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), 
;!		 -> value_clock_enable(BANK4[10]), value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), 
;!		 -> value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), 
;!		 -> value_high_tbp(BANK5[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), 
;!		 -> value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), 
;!		 -> value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), 
;!		 -> value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), 
;!		 -> value_rlyslp(BANK4[10]), value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), 
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
;!		 -> STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), STR_45(CODE[9]), 
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
;!		 -> value_enable(BANK4[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), 
;!		 -> value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), 
;!		 -> value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), 
;!		 -> value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK4[10]), value_scale4(BANK4[10]), 
;!		 -> value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strcpy@to	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_draw_utility@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), 
;!		 -> original_value(BANK4[10]), STR_271(CODE[1]), STR_272(CODE[9]), STR_273(CODE[9]), 
;!		 -> STR_274(CODE[1]), value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), 
;!		 -> value_clock_enable(BANK4[10]), value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), 
;!		 -> value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), 
;!		 -> value_high_tbp(BANK5[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), 
;!		 -> value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), 
;!		 -> value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), 
;!		 -> value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), 
;!		 -> value_rlyslp(BANK4[10]), value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), 
;!		 -> value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strlen@cp	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_271(CODE[1]), 
;!		 -> STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), STR_45(CODE[9]), 
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
;!		 -> value_enable(BANK4[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), 
;!		 -> value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), 
;!		 -> value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), 
;!		 -> value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK4[10]), value_scale4(BANK4[10]), 
;!		 -> value_sensor(BANK4[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strlen@s	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_271(CODE[1]), 
;!		 -> STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), STR_45(CODE[9]), 
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
;!		 -> value_enable(BANK4[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), 
;!		 -> value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), 
;!		 -> value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), 
;!		 -> value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK4[10]), value_scale4(BANK4[10]), 
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
;!		 -> STR_136(CODE[13]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[13]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    temp_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), 
;!		 -> value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(COMRAM[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK2[50]), main@buf_636(BANK2[30]), main@buf_670(BANK2[50]), main@buf_675(BANK2[60]), 
;!		 -> main@buf_678(BANK3[40]), main@buf_705(BANK3[30]), main@time_buf(BANK2[60]), menu_handle_button@buf(BANK1[50]), 
;!		 -> menu_handle_button@buf_1697(BANK1[50]), menu_handle_button@buf_1721(BANK1[50]), menu_handle_button@buf_1731(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1661(BANK1[50]), menu_handle_encoder@buf_1664(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), 
;!		 -> rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), STR_10(CODE[42]), 
;!		 -> STR_11(CODE[34]), STR_12(CODE[36]), STR_13(CODE[20]), STR_142(CODE[29]), 
;!		 -> STR_15(CODE[28]), STR_152(CODE[26]), STR_16(CODE[23]), STR_19(CODE[22]), 
;!		 -> STR_2(CODE[42]), STR_20(CODE[19]), STR_21(CODE[24]), STR_22(CODE[22]), 
;!		 -> STR_223(CODE[31]), STR_23(CODE[22]), STR_24(CODE[19]), STR_26(CODE[16]), 
;!		 -> STR_31(CODE[20]), STR_318(CODE[27]), STR_32(CODE[15]), STR_33(CODE[26]), 
;!		 -> STR_331(CODE[25]), STR_336(CODE[20]), STR_338(CODE[22]), STR_339(CODE[28]), 
;!		 -> STR_340(CODE[37]), STR_341(CODE[31]), STR_342(CODE[39]), STR_343(CODE[31]), 
;!		 -> STR_344(CODE[49]), STR_345(CODE[38]), STR_346(CODE[43]), STR_347(CODE[38]), 
;!		 -> STR_348(CODE[29]), STR_36(CODE[22]), STR_37(CODE[20]), STR_38(CODE[21]), 
;!		 -> STR_39(CODE[33]), STR_4(CODE[29]), STR_42(CODE[36]), STR_43(CODE[20]), 
;!		 -> STR_44(CODE[21]), STR_5(CODE[23]), STR_7(CODE[20]), STR_8(CODE[16]), 
;!		 -> STR_9(CODE[37]), trigger_relay_pulse@buf(BANK0[60]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(COMRAM[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK2[50]), main@buf_636(BANK2[30]), main@buf_670(BANK2[50]), main@buf_675(BANK2[60]), 
;!		 -> main@buf_678(BANK3[40]), main@buf_705(BANK3[30]), main@time_buf(BANK2[60]), menu_handle_button@buf(BANK1[50]), 
;!		 -> menu_handle_button@buf_1697(BANK1[50]), menu_handle_button@buf_1721(BANK1[50]), menu_handle_button@buf_1731(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1661(BANK1[50]), menu_handle_encoder@buf_1664(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), 
;!		 -> rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), STR_10(CODE[42]), 
;!		 -> STR_11(CODE[34]), STR_12(CODE[36]), STR_13(CODE[20]), STR_142(CODE[29]), 
;!		 -> STR_15(CODE[28]), STR_152(CODE[26]), STR_16(CODE[23]), STR_19(CODE[22]), 
;!		 -> STR_2(CODE[42]), STR_20(CODE[19]), STR_21(CODE[24]), STR_22(CODE[22]), 
;!		 -> STR_223(CODE[31]), STR_23(CODE[22]), STR_24(CODE[19]), STR_26(CODE[16]), 
;!		 -> STR_31(CODE[20]), STR_318(CODE[27]), STR_32(CODE[15]), STR_33(CODE[26]), 
;!		 -> STR_331(CODE[25]), STR_336(CODE[20]), STR_338(CODE[22]), STR_339(CODE[28]), 
;!		 -> STR_340(CODE[37]), STR_341(CODE[31]), STR_342(CODE[39]), STR_343(CODE[31]), 
;!		 -> STR_344(CODE[49]), STR_345(CODE[38]), STR_346(CODE[43]), STR_347(CODE[38]), 
;!		 -> STR_348(CODE[29]), STR_36(CODE[22]), STR_37(CODE[20]), STR_38(CODE[21]), 
;!		 -> STR_39(CODE[33]), STR_4(CODE[29]), STR_42(CODE[36]), STR_43(CODE[20]), 
;!		 -> STR_44(CODE[21]), STR_5(CODE[23]), STR_7(CODE[20]), STR_8(CODE[16]), 
;!		 -> STR_9(CODE[37]), trigger_relay_pulse@buf(BANK0[60]), 
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
;!		 -> STR_136(CODE[13]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[13]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    utility_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), 
;!		 -> value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
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
;!		 -> STR_136(CODE[13]), STR_137(CODE[9]), STR_138(CODE[11]), STR_139(CODE[13]), 
;!		 -> STR_140(CODE[5]), STR_85(CODE[7]), STR_86(CODE[7]), STR_87(CODE[10]), 
;!		 -> STR_88(CODE[11]), STR_89(CODE[12]), STR_90(CODE[9]), STR_91(CODE[13]), 
;!		 -> STR_92(CODE[6]), STR_93(CODE[6]), STR_94(CODE[9]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[8]), STR_98(CODE[5]), STR_99(CODE[7]), 
;!
;!    utility_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> STR_271(CODE[1]), STR_272(CODE[9]), STR_273(CODE[9]), STR_274(CODE[1]), 
;!		 -> value_back(BANK3[5]), value_brightness(BANK3[4]), value_clock_display(BANK5[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_contrast(BANK3[4]), value_display(BANK3[10]), value_enable(BANK4[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK5[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_log_entries(BANK3[6]), value_low_flow(BANK5[10]), 
;!		 -> value_low_flow_bp(BANK5[10]), value_low_pressure(BANK4[10]), value_menu_timeout(BANK3[6]), value_no_flow(BANK5[10]), 
;!		 -> value_no_flow_bp(BANK5[10]), value_plpbp(BANK4[10]), value_pwr_fail(BANK3[6]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK4[10]), value_rlylow(BANK4[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), 
;!		 -> value_scale20(BANK4[10]), value_scale4(BANK4[10]), value_sensor(BANK4[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
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
;! (0) _main                                               366   366      0 1449436
;!                                             82 COMRAM     2     2      0
;!                                            115 BANK0      8     8      0
;!                                            230 BANK1     12    12      0
;!                                              0 BANK2    250   250      0
;!                                              0 BANK3     70    70      0
;!                                              0 BANK5      7     7      0
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
;! (1) _rtc_read_time                                       90    88      2   35046
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
;! (1) _menu_update_edit_value                              31    31      0   42999
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
;! (1) _menu_handle_encoder                                172   170      2  368491
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
;! (2) _handle_time_rotation                                53    53      0   33791
;!                                              0 BANK0     53    53      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _handle_numeric_rotation                             57    57      0   34144
;!                                              0 BANK0     57    57      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                 235   235      0  603092
;!                                            110 BANK0      5     5      0
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
;! (2) _trigger_relay_pulse                                 61    61      0   33723
;!                                              0 BANK0     61    61      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_utility_menu                                 7     7      0   33063
;!                                             64 COMRAM     7     7      0
;!                            ___lbdiv
;!                            ___lbmod
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_input_menu                                  90    90      0   50161
;!                                             64 COMRAM     1     1      0
;!                                              0 BANK0     89    89      0
;!                            ___lwdiv
;!                            ___lwmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_clock_menu                                  58    58      0   44074
;!                                             64 COMRAM     2     2      0
;!                                              0 BANK0     56    56      0
;!                            ___lbdiv
;!                            ___lbmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_time_value                             111   111      0   81433
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
;! (3) ___lbmod                                              4     3      1     772
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (3) ___lbdiv                                              4     3      1     781
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_utility                                   33    33      0   84427
;!                                              0 BANK0     33    33      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;!       _menu_update_datetime_display
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (3) _menu_update_datetime_display                        18    18      0   47591
;!                                             64 COMRAM    18    18      0
;!                     _lcd_clear_line
;!                       _lcd_print_at
;!                            _sprintf
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_setup                                     23    23      0   29215
;!                                             25 COMRAM    23    23      0
;!                          _lcd_clear
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_options                                    2     2      0   28621
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
;! (2) _menu_draw_input                                     51    51      0   73390
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
;! (3) _strlen                                               4     2      2     850
;!                                             14 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (3) _strcpy                                               7     3      4    6589
;!                                             14 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (3) _strcmp                                               7     3      4    1213
;!                                             14 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (3) _lcd_print_at                                         4     1      3   14203
;!                                             21 COMRAM     4     1      3
;!                          _lcd_print
;!                     _lcd_set_cursor
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
;! (2) _init_time_editor                                    63    60      3   39650
;!                                             64 COMRAM     3     0      3
;!                                              0 BANK0     60    60      0
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _sprintf                                             42    24     18   25807
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
;! (2) _beep                                                 5     3      2    2228
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
;! (1) _ad7994_init                                          1     1      0    7825
;!                                             19 COMRAM     1     1      0
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    7658
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
;!BANK5              100      7      CD      15       80.1%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100      0      FD      13       98.8%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100     46     100      11      100.0%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100     FA     100       9      100.0%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100     F2      FE       7       99.2%
;!BITBANK15           80      0       0      34        0.0%
;!BANK15              80      0       0      35        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80     7B      80       5      100.0%
;!BITCOMRAM           7E      0       0       0        0.0%
;!COMRAM              7E     54      6E       1       87.3%
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
;!ABS                  0      0     5B6      50        0.0%
;!DATA                 0      0     736       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 173 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            30   40[BANK3 ] unsigned char [30]
;;  current_even    1  232[BANK1 ] unsigned char 
;;  time_buf       60    0[BANK2 ] unsigned char [60]
;;  buf            40    0[BANK3 ] unsigned char [40]
;;  delta           2  233[BANK1 ] int 
;;  buf            60   60[BANK2 ] unsigned char [60]
;;  buf            50  170[BANK2 ] unsigned char [50]
;;  lcd_buf        17    0        unsigned char [17]
;;  buf            30  220[BANK2 ] unsigned char [30]
;;  buf            50  120[BANK2 ] unsigned char [50]
;;  set_time        7    0[BANK5 ] struct .
;;  current_time    7  235[BANK1 ] struct .
;;  last_encoder    2  230[BANK1 ] int 
;;  adc_ch3         2  119[BANK0 ] unsigned int 
;;  adc_ch2         2  117[BANK0 ] unsigned int 
;;  adc_ch1         2  115[BANK0 ] unsigned int 
;;  adc_error       1  122[BANK0 ] unsigned char 
;;  last_button     1  121[BANK0 ] unsigned char 
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
;;      Locals:         0       8      12     250      70       0       7       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       8      12     250      70       0       7       0       0       0       0       0       0       0       0       0       0
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
	
l14858:
	call	_system_init	;wreg free
	line	178
	
l14860:
	call	_eeprom_init	;wreg free
	line	185
	
l14862:; BSR set to: 5

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
	
l14864:
	call	_uart_init	;wreg free
	line	189
	
l14866:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	191
	
l14868:
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
	
l14870:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	195
	
l14872:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	196
	
l14874:
	call	_i2c_init	;wreg free
	line	197
	
l14876:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	200
	
l14878:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	201
	
l14880:
	call	_rtc_init	;wreg free
	iorlw	0
	btfss	status,2
	goto	u19971
	goto	u19970
u19971:
	goto	l14884
u19970:
	line	203
	
l14882:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	204
	goto	l14886
	line	207
	
l14884:
		movlw	low(STR_11)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_11)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	212
	
l14886:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((main@set_time))&0ffh
	line	213
	
l14888:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(main@set_time+01h))&0ffh
	line	214
	
l14890:; BSR set to: 5

	movlw	low(0Ch)
	movwf	(0+(main@set_time+02h))&0ffh
	line	215
	
l14892:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(main@set_time+03h))&0ffh
	line	216
	
l14894:; BSR set to: 5

	movlw	low(07h)
	movwf	(0+(main@set_time+04h))&0ffh
	line	217
	
l14896:; BSR set to: 5

	movlw	low(0Ah)
	movwf	(0+(main@set_time+05h))&0ffh
	line	218
	
l14898:; BSR set to: 5

	movlw	low(019h)
	movwf	(0+(main@set_time+06h))&0ffh
	line	220
	
l14900:; BSR set to: 5

		movlw	low(main@set_time)
	movwf	((c:rtc_set_time@time))^00h,c
	movlw	high(main@set_time)
	movwf	((c:rtc_set_time@time+1))^00h,c

	call	_rtc_set_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u19981
	goto	u19980
u19981:
	goto	l14904
u19980:
	line	222
	
l14902:
		movlw	low(STR_12)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_12)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	223
	goto	l174
	line	226
	
l14904:
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
	
l14906:; BSR set to: 0

	movf	((main@adc_error))&0ffh,w
	btfsc	status,2
	goto	u19991
	goto	u19990
u19991:
	goto	l14912
u19990:
	line	233
	
l14908:; BSR set to: 0

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
	
l14910:
		movlw	low(main@buf_636)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_636)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	237
	
l14912:
	call	_encoder_init	;wreg free
	line	238
	
l14914:
	call	_menu_init	;wreg free
	line	239
	
l14916:; BSR set to: 3

	call	_lcd_init	;wreg free
	line	241
	
l14918:
		movlw	low(STR_15)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	242
	
l14920:
		movlw	low(STR_16)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_16)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	244
	
l14922:
	call	_lcd_clear	;wreg free
	line	245
	
l14924:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	246
	
l14926:
		movlw	low(STR_17)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_17)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	247
	
l14928:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	248
	
l14930:
		movlw	low(STR_18)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_18)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	250
	
l14932:
		movlw	low(STR_19)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_19)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	251
	
l14934:
		movlw	low(STR_20)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_20)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	252
	
l14936:
		movlw	low(STR_21)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_21)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	254
	
l14938:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	255
	
l14940:
	asmopt push
asmopt off
movlw  5
movwf	(??_main+0+0+1)^00h,c
movlw	15
movwf	(??_main+0+0)^00h,c
	movlw	241
u20467:
decfsz	wreg,f
	bra	u20467
	decfsz	(??_main+0+0)^00h,c,f
	bra	u20467
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u20467
	nop
asmopt pop

	line	256
	
l14942:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	258
	
l14944:
		movlw	low(STR_22)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_22)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	259
	
l14946:
		movlw	low(STR_23)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_23)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	265
	
l14948:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	266
	
l14950:; BSR set to: 2

	movlw	low(05h)
	movlb	3	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	268
	
l14952:; BSR set to: 3

	call	_menu_draw_options	;wreg free
	line	269
	
l14954:
		movlw	low(STR_24)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_24)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	272
	
l14956:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	273
	
l14958:; BSR set to: 1

	movlw	low(0)
	movlb	0	; () banked
	movwf	((main@last_button))&0ffh
	line	287
	
l14960:
	movlb	1	; () banked
	incf	((main@sample_counter))&0ffh
	line	289
	
l14962:; BSR set to: 1

		movlw	0Ah-1
	cpfsgt	((main@sample_counter))&0ffh
	goto	u20001
	goto	u20000

u20001:
	goto	l14984
u20000:
	line	291
	
l14964:; BSR set to: 1

	movlw	low(0)
	movwf	((main@sample_counter))&0ffh
	line	294
	
l14966:; BSR set to: 1

		movlw	low(main@current_time)
	movwf	((c:rtc_read_time@time))^00h,c
	movlw	high(main@current_time)
	movwf	((c:rtc_read_time@time+1))^00h,c

	call	_rtc_read_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u20011
	goto	u20010
u20011:
	goto	l14972
u20010:
	line	299
	
l14968:
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
	
l14970:
		movlw	low(main@time_buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@time_buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	301
	goto	l14974
	line	304
	
l14972:
		movlw	low(STR_26)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_26)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	308
	
l14974:
	movlw	(01h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch1)
	movff	1+?_ad7994_read_channel,(main@adc_ch1+1)
	line	309
	
l14976:
	movlw	(02h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch2)
	movff	1+?_ad7994_read_channel,(main@adc_ch2+1)
	line	310
	
l14978:
	movlw	(03h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch3)
	movff	1+?_ad7994_read_channel,(main@adc_ch3+1)
	line	314
	
l14980:
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
	
l14982:
		movlw	low(main@buf_670)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_670)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	320
	
l14984:
	asmopt push
asmopt off
movlw  3
movwf	(??_main+0+0+1)^00h,c
movlw	8
movwf	(??_main+0+0)^00h,c
	movlw	119
u20477:
decfsz	wreg,f
	bra	u20477
	decfsz	(??_main+0+0)^00h,c,f
	bra	u20477
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u20477
	nop
asmopt pop

	line	325
	
l14986:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	337
	
l14988:
	movlb	1	; () banked
	movf	((main@last_relay_state))&0ffh,w
	movlb	0	; () banked
xorwf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u20021
	goto	u20020

u20021:
	goto	l14992
u20020:
	
l14990:; BSR set to: 0

	movlb	1	; () banked
	movf	((main@last_relay_counter))&0ffh,w
	movlb	2	; () banked
xorwf	((_relay_counter))&0ffh,w	;volatile
	bnz	u20030
	movlb	1	; () banked
movf	((main@last_relay_counter+1))&0ffh,w
	movlb	2	; () banked
xorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u20031
	goto	u20030

u20031:
	goto	l15000
u20030:
	line	340
	
l14992:
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
	
l14994:
		movlw	low(main@buf_675)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_675)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	342
	
l14996:
	movff	(_relay_state),(main@last_relay_state)	;volatile
	line	343
	
l14998:
	movff	(_relay_counter),(main@last_relay_counter)	;volatile
	movff	(_relay_counter+1),(main@last_relay_counter+1)	;volatile
	line	348
	
l15000:
	movlb	1	; () banked
	movf	((main@last_encoder))&0ffh,w
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u20040
movf	((main@last_encoder+1))&0ffh,w
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u20041
	goto	u20040

u20041:
	goto	l15058
u20040:
	line	350
	
l15002:; BSR set to: 1

	movf	((main@last_encoder))&0ffh,w
	subwf	((_encoder_count))&0ffh,w	;volatile
	movwf	((main@delta))&0ffh
	movf	((main@last_encoder+1))&0ffh,w
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movwf	1+((main@delta))&0ffh
	line	353
	
l15004:; BSR set to: 1

	movlw	high(01h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	356
	
l15006:
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
	
l15008:
		movlw	low(main@buf_678)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_678)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	359
	
l15010:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	362
	
l15012:
	movlw	high(0Ah)
	movlb	1	; () banked
	movwf	((main@encoder_activity_timer+1))&0ffh
	movlw	low(0Ah)
	movwf	((main@encoder_activity_timer))&0ffh
	line	365
	
l15014:; BSR set to: 1

	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u20051
	goto	u20050
u20051:
	goto	l198
u20050:
	line	367
	
l15016:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	368
	
l198:; BSR set to: 3

	line	371
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u20061
	goto	u20060
u20061:
	goto	l15028
u20060:
	
l15018:; BSR set to: 3

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20071
	goto	u20070

u20071:
	goto	l15028
u20070:
	line	373
	
l15020:; BSR set to: 2

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
	goto	u20081
	goto	u20080
u20081:
	goto	l15024
u20080:
	line	376
	
l15022:
	movlb	1	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_numeric_rotation
	line	377
	goto	l15032
	line	378
	
l15024:
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
	goto	u20091
	goto	u20090
u20091:
	goto	l15028
u20090:
	line	381
	
l15026:
	movlb	1	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_time_rotation
	line	382
	call	_menu_update_time_value	;wreg free
	line	383
	goto	l15032
	line	387
	
l15028:
	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	line	397
	
l15032:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u20101
	goto	u20100
u20101:
	goto	l15046
u20100:
	
l15034:; BSR set to: 3

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20111
	goto	u20110

u20111:
	goto	l15046
u20110:
	line	400
	
l15036:; BSR set to: 2

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
	goto	u20121
	goto	u20120
u20121:
	goto	l15040
u20120:
	line	403
	
l15038:
	call	_menu_update_numeric_value	;wreg free
	line	404
	goto	l15058
	line	405
	
l15040:
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
	goto	u20131
	goto	u20130
u20131:
	goto	l15044
u20130:
	line	408
	
l15042:
	call	_menu_update_time_value	;wreg free
	line	409
	goto	l15058
	line	413
	
l15044:
	call	_menu_update_edit_value	;wreg free
	goto	l15058
	line	419
	
l15046:
	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20141
	goto	u20140
u20141:
	goto	l15050
u20140:
	line	421
	
l15048:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	422
	goto	l15058
	line	423
	
l15050:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20151
	goto	u20150

u20151:
	goto	l15054
u20150:
	line	425
	
l15052:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	line	426
	goto	l15058
	line	427
	
l15054:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20161
	goto	u20160

u20161:
	goto	l15058
u20160:
	line	429
	
l15056:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	435
	
l15058:
	movlb	0	; () banked
	movf	((main@last_button))&0ffh,w
	movlb	2	; () banked
xorwf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u20171
	goto	u20170

u20171:
	goto	l15134
u20170:
	line	437
	
l15060:; BSR set to: 2

	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u20181
	goto	u20180
u20181:
	goto	l15130
u20180:
	line	439
	
l15062:; BSR set to: 2

	movff	(_button_event),(main@current_event)	;volatile
	line	440
	
l15064:; BSR set to: 2

	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	443
	
l15066:; BSR set to: 2

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
	
l15068:
		movlw	low(main@buf_705)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_705)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	447
	
l15070:
		movlw	2
	movlb	1	; () banked
	xorwf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u20191
	goto	u20190

u20191:
	goto	l15106
u20190:
	line	449
	
l15072:; BSR set to: 1

		movlw	low(STR_31)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_31)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	452
	
l15074:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u20201
	goto	u20200
u20201:
	goto	l15088
u20200:
	line	455
	
l15076:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	456
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	457
	movlw	low(0)
	movwf	(0+(_menu+08h))&0ffh
	line	461
	
l15078:; BSR set to: 3

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
	
l15080:; BSR set to: 2

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
	
l15082:; BSR set to: 2

		movlw	low(STR_32)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_32)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	467
	
l15084:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20211
	goto	u20210

u20211:
	goto	l15130
u20210:
	line	468
	
l15086:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	goto	l15130
	line	474
	
l15088:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20221
	goto	u20220
u20221:
	goto	l15094
u20220:
	line	476
	
l15090:; BSR set to: 2

	setf	((_current_menu))&0ffh
	line	477
	
l15092:; BSR set to: 2

		movlw	low(STR_33)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_33)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	478
	goto	l15130
	line	479
	
l15094:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20231
	goto	u20230

u20231:
	goto	l15100
u20230:
	line	481
	
l15096:; BSR set to: 2

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
	
l15098:
	call	_menu_draw_setup	;wreg free
	line	486
	goto	l15130
	line	487
	
l15100:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20241
	goto	u20240

u20241:
	goto	l229
u20240:
	line	489
	
l15102:; BSR set to: 2

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
	
l15104:
	call	_menu_draw_options	;wreg free
	goto	l15130
	line	498
	
l15106:; BSR set to: 1

	movlb	2	; () banked
		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20251
	goto	u20250

u20251:
	goto	l15116
u20250:
	line	500
	
l15108:; BSR set to: 2

	movlb	1	; () banked
		decf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u20261
	goto	u20260

u20261:
	goto	l15130
u20260:
	line	502
	
l15110:; BSR set to: 1

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
	
l15112:; BSR set to: 3

	call	_menu_draw_options	;wreg free
	line	507
	
l15114:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l15130
	line	513
	
l15116:; BSR set to: 2

	movlb	1	; () banked
	movf	((main@current_event))&0ffh,w
	
	call	_menu_handle_button
	line	516
	
l15118:
	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20271
	goto	u20270
u20271:
	goto	l15122
u20270:
	goto	l15104
	line	518
	
l15122:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20281
	goto	u20280

u20281:
	goto	l15126
u20280:
	goto	l15086
	line	520
	
l15126:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20291
	goto	u20290

u20291:
	goto	l229
u20290:
	goto	l15098
	line	522
	
l229:; BSR set to: 2

	line	524
	
l15130:
	movff	(_button_event),(main@last_button)	;volatile
	line	525
	
l15132:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	530
	
l15134:; BSR set to: 2

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20301
	goto	u20300

u20301:
	goto	l15150
u20300:
	
l15136:; BSR set to: 2

	movlb	1	; () banked
		incf	((main@last_menu_state))&0ffh,w
	btfsc	status,2
	goto	u20311
	goto	u20310

u20311:
	goto	l15150
u20310:
	line	533
	
l15138:; BSR set to: 1

	call	_lcd_clear	;wreg free
	line	534
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	535
	
l15140:
		movlw	low(STR_34)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_34)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	536
	
l15142:
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
	
l15144:
	call	_save_current_config	;wreg free
	line	542
	
l15146:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	543
	
l15148:; BSR set to: 1

		movlw	low(STR_38)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_38)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	545
	
l15150:
	movff	(_current_menu),(main@last_menu_state)
	line	548
	
l15152:
	movlb	1	; () banked
	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfsc	status,2
	goto	u20321
	goto	u20320

u20321:
	goto	l15156
u20320:
	line	550
	
l15154:; BSR set to: 1

	decf	((main@encoder_activity_timer))&0ffh
	btfss	status,0
	decf	((main@encoder_activity_timer+1))&0ffh
	line	554
	
l15156:; BSR set to: 1

	movlw	low(01h)
	movlb	0	; () banked
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	555
	
l15158:; BSR set to: 0

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	iorwf	((main@blink_timer+1))&0ffh,w
	bnz	u20330
	movlw	10
	subwf	 ((main@blink_timer))&0ffh,w
	btfss	status,0
	goto	u20331
	goto	u20330

u20331:
	goto	l15192
u20330:
	line	557
	
l15160:; BSR set to: 0

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
	goto	u20341
	goto	u20340
u20341:
	goto	l15190
u20340:
	line	561
	
l15162:; BSR set to: 3

	movlb	1	; () banked
	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfss	status,2
	goto	u20351
	goto	u20350

u20351:
	goto	l15192
u20350:
	line	563
	
l15164:; BSR set to: 1

	movlb	3	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20361
	goto	u20360
u20361:
	movlw	1
	goto	u20370
u20360:
	movlw	0
u20370:
	movwf	(0+(_menu+05h))&0ffh
	line	567
	goto	l15188
	line	570
	
l15166:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	571
	goto	l15192
	line	575
	
l15168:; BSR set to: 2

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
	goto	u20381
	goto	u20380
u20381:
	goto	l15172
u20380:
	line	577
	
l15170:
	call	_menu_update_numeric_value	;wreg free
	line	578
	goto	l15192
	line	579
	
l15172:
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
	goto	u20391
	goto	u20390
u20391:
	goto	l15176
u20390:
	line	581
	
l15174:
	call	_menu_update_time_value	;wreg free
	line	582
	goto	l15192
	line	586
	
l15176:
	call	_menu_draw_input	;wreg free
	goto	l15192
	line	591
	
l15178:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	592
	goto	l15192
	line	594
	
l15180:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20401
	goto	u20400

u20401:
	goto	l15184
u20400:
	goto	l15174
	line	600
	
l15184:; BSR set to: 3

	call	_menu_draw_clock	;wreg free
	goto	l15192
	line	567
	
l15188:; BSR set to: 3

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
	goto	l15166
	xorlw	1^0	; case 1
	skipnz
	goto	l15168
	xorlw	2^1	; case 2
	skipnz
	goto	l15178
	xorlw	3^2	; case 3
	skipnz
	goto	l15180
	goto	l15192

	line	608
	
l15190:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	622
	
l15192:
		movlw	03h-0
	movlb	2	; () banked
	cpfslt	((_current_menu))&0ffh
	goto	u20411
	goto	u20410

u20411:
	goto	l15226
u20410:
	line	624
	
l15194:; BSR set to: 2

	movlb	1	; () banked
	movf	((_menu_timeout_flag))&0ffh,w	;volatile
	btfss	status,2
	goto	u20421
	goto	u20420
u20421:
	goto	l15226
u20420:
	line	626
	
l15196:; BSR set to: 1

		movlw	low(STR_39)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_39)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	629
	
l15198:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	630
	
l15200:
	asmopt push
asmopt off
movlw  3
movwf	(??_main+0+0+1)^00h,c
movlw	8
movwf	(??_main+0+0)^00h,c
	movlw	119
u20487:
decfsz	wreg,f
	bra	u20487
	decfsz	(??_main+0+0)^00h,c,f
	bra	u20487
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u20487
	nop
asmopt pop

	line	631
	
l15202:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	634
	
l15204:
	movlb	2	; () banked
	setf	((_current_menu))&0ffh
	line	635
	
l15206:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	636
	
l15208:; BSR set to: 3

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	637
	
l15210:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	640
	
l15212:; BSR set to: 3

	call	_lcd_clear	;wreg free
	line	641
	
l15214:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	642
	
l15216:
		movlw	low(STR_40)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_40)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	643
	
l15218:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	644
	
l15220:
		movlw	low(STR_41)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_41)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	647
	
l15222:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	648
	
l15224:; BSR set to: 1

	movlw	high(0)
	movwf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_menu_timeout_timer))^00h,c	;volatile
	line	653
	
l15226:
	movlb	1	; () banked
	movf	((_long_press_beep_flag))&0ffh,w	;volatile
	btfsc	status,2
	goto	u20431
	goto	u20430
u20431:
	goto	l15234
u20430:
	line	655
	
l15228:; BSR set to: 1

	movlw	low(0)
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	line	656
	
l15230:; BSR set to: 1

	movlw	high(01F4h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01F4h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	657
	
l15232:
		movlw	low(STR_42)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_42)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	662
	
l15234:
	movlb	1	; () banked
	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u20441
	goto	u20440
u20441:
	goto	l15246
u20440:
	
l15236:; BSR set to: 1

	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u20451
	goto	u20450
u20451:
	goto	l15246
u20450:
	line	664
	
l15238:; BSR set to: 3

		movlw	low(STR_43)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_43)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	665
	
l15240:
	call	_save_current_config	;wreg free
	line	666
	
l15242:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	667
	
l15244:; BSR set to: 1

		movlw	low(STR_44)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_44)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	672
	
l15246:
	asmopt push
asmopt off
	movlw	133
u20497:
decfsz	wreg,f
	bra	u20497
	nop
asmopt pop

	goto	l14960
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
	
l13436:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	55
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	57
	
l13438:
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
	
l13440:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	91
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	94
	
l141:
	line	93
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u17681
	goto	u17680
u17681:
	goto	l141
u17680:
	line	96
	
l13442:
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
	
l13444:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	103
	
l13446:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	105
	
l13448:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	106
	
l13450:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	107
	
l13452:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	108
	
l13454:
	bsf	((c:3987))^0f00h,c,0	;volatile
	line	109
	
l13456:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	111
	
l13458:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	112
	
l13460:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	115
	
l13462:
	bcf	((c:3988))^0f00h,c,1	;volatile
	line	116
	
l13464:
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
;;		On entry : 3F/5
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
	
l13534:; BSR set to: 5

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
	
l13536:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u17761
	goto	u17760
u17761:
	goto	l13542
u17760:
	line	90
	
l13538:
	movlw	(01h)&0ffh
	goto	l1672
	line	91
	
l13542:
	asmopt push
asmopt off
	movlw	133
u20507:
decfsz	wreg,f
	bra	u20507
	nop
asmopt pop

	line	93
	
l13544:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u17771
	goto	u17770
u17771:
	goto	l13550
u17770:
	goto	l13538
	line	95
	
l13550:
	asmopt push
asmopt off
	movlw	133
u20517:
decfsz	wreg,f
	bra	u20517
	nop
asmopt pop

	line	97
	
l13552:
	movlw	(0)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u17781
	goto	u17780
u17781:
	goto	l13558
u17780:
	goto	l13538
	line	99
	
l13558:
	asmopt push
asmopt off
	movlw	133
u20527:
decfsz	wreg,f
	bra	u20527
	nop
asmopt pop

	line	101
	
l13560:
	movlw	low(0)
	movwf	((c:rtc_set_time@i))^00h,c
	line	103
	
l13566:
	movf	((c:rtc_set_time@i))^00h,c,w
	addlw	low(rtc_set_time@data)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u17791
	goto	u17790
u17791:
	goto	l13572
u17790:
	goto	l13538
	line	105
	
l13572:
	asmopt push
asmopt off
	movlw	133
u20537:
decfsz	wreg,f
	bra	u20537
	nop
asmopt pop

	line	101
	
l13574:
	incf	((c:rtc_set_time@i))^00h,c
		movlw	07h-1
	cpfsgt	((c:rtc_set_time@i))^00h,c
	goto	u17801
	goto	u17800

u17801:
	goto	l13566
u17800:
	line	108
	
l13576:
	call	_i2c_stop	;wreg free
	line	109
	
l13578:
	asmopt push
asmopt off
	movlw	228
u20547:
	nop2
	nop2
decfsz	wreg,f
	bra	u20547
	nop2
	nop2
asmopt pop

	line	110
	
l13580:
	movlw	(0)&0ffh
	line	111
	
l1672:
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
;;		On entry : 0/5
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
	
l13432:
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
	
l1668:
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
	
l13730:; BSR set to: 1

	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u17871
	goto	u17870
u17871:
	goto	l13736
u17870:
	line	120
	
l13732:
	movlw	(01h)&0ffh
	goto	l1681
	line	121
	
l13736:
	asmopt push
asmopt off
	movlw	133
u20557:
decfsz	wreg,f
	bra	u20557
	nop
asmopt pop

	line	123
	
l13738:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u17881
	goto	u17880
u17881:
	goto	l13744
u17880:
	goto	l13732
	line	125
	
l13744:
	asmopt push
asmopt off
	movlw	133
u20567:
decfsz	wreg,f
	bra	u20567
	nop
asmopt pop

	line	127
	
l13746:
	movlw	(0)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u17891
	goto	u17890
u17891:
	goto	l13752
u17890:
	goto	l13732
	line	129
	
l13752:
	asmopt push
asmopt off
	movlw	133
u20577:
decfsz	wreg,f
	bra	u20577
	nop
asmopt pop

	line	131
	
l13754:
	call	_i2c_stop	;wreg free
	line	132
	
l13756:
	asmopt push
asmopt off
	movlw	228
u20587:
	nop2
	nop2
decfsz	wreg,f
	bra	u20587
	nop2
	nop2
asmopt pop

	line	135
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u17901
	goto	u17900
u17901:
	goto	l13762
u17900:
	goto	l13732
	line	137
	
l13762:
	asmopt push
asmopt off
	movlw	133
u20597:
decfsz	wreg,f
	bra	u20597
	nop
asmopt pop

	line	139
	
l13764:
	movlw	(0D1h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u17911
	goto	u17910
u17911:
	goto	l13770
u17910:
	goto	l13732
	line	141
	
l13770:
	asmopt push
asmopt off
	movlw	133
u20607:
decfsz	wreg,f
	bra	u20607
	nop
asmopt pop

	line	143
	
l13772:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((rtc_read_time@i))&0ffh
	line	145
	
l13778:; BSR set to: 0

	movf	((rtc_read_time@i))&0ffh,w
	addlw	low(rtc_read_time@data)
	movwf	fsr2l
	clrf	fsr2h
	movlw	(01h)&0ffh
	
	call	_i2c_read
	movwf	indf2,c

	line	143
	
l13780:
	movlb	0	; () banked
	incf	((rtc_read_time@i))&0ffh
	
l13782:; BSR set to: 0

		movlw	06h-1
	cpfsgt	((rtc_read_time@i))&0ffh
	goto	u17921
	goto	u17920

u17921:
	goto	l13778
u17920:
	line	147
	
l13784:; BSR set to: 0

	movlw	(0)&0ffh
	
	call	_i2c_read
	movlb	0	; () banked
	movwf	(0+(rtc_read_time@data+06h))&0ffh
	line	148
	call	_i2c_stop	;wreg free
	line	153
	
l13786:
		movlw	low(rtc_read_time@debug_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_337)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_337)
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
	
l13788:
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
	
l13790:
	movlw	(0)&0ffh
	line	166
	
l1681:
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
	
l13428:
	movff	(c:bcd_to_dec@bcd),??_bcd_to_dec+0+0
	movlw	0Fh
	andwf	(??_bcd_to_dec+0+0)^00h,c
	swapf	((c:bcd_to_dec@bcd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	mullw	0Ah
	movf	(prodl)^0f00h,c,w
	addwf	(??_bcd_to_dec+0+0)^00h,c,w
	line	66
	
l1665:
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
	
l13522:
	asmopt push
asmopt off
movlw  21
movwf	(??_rtc_init+0+0+1)^00h,c
movlw	75
movwf	(??_rtc_init+0+0)^00h,c
	movlw	190
u20617:
decfsz	wreg,f
	bra	u20617
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u20617
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u20617
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
u20627:
decfsz	wreg,f
	bra	u20627
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u20627
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u20627
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
u20637:
decfsz	wreg,f
	bra	u20637
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u20637
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u20637
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
u20647:
decfsz	wreg,f
	bra	u20647
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u20647
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u20647
	nop2
asmopt pop

	line	54
	
l13524:
	movlw	low(0)
	movwf	((c:rtc_write_register@value))^00h,c
	movlw	(0Eh)&0ffh
	
	call	_rtc_write_register
	iorlw	0
	btfsc	status,2
	goto	u17751
	goto	u17750
u17751:
	goto	l13530
u17750:
	line	56
	
l13526:
	movlw	(01h)&0ffh
	goto	l1662
	line	59
	
l13530:
	movlw	(0)&0ffh
	line	60
	
l1662:
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
	
l13398:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u17641
	goto	u17640
u17641:
	goto	l13404
u17640:
	line	12
	
l13400:
	movlw	(01h)&0ffh
	goto	l1647
	line	13
	
l13404:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u17651
	goto	u17650
u17651:
	goto	l13410
u17650:
	goto	l13400
	line	15
	
l13410:
	movf	((c:rtc_write_register@reg))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u17661
	goto	u17660
u17661:
	goto	l13416
u17660:
	goto	l13400
	line	17
	
l13416:
	movf	((c:rtc_write_register@value))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u17671
	goto	u17670
u17671:
	goto	l13422
u17670:
	goto	l13400
	line	19
	
l13422:
	call	_i2c_stop	;wreg free
	line	20
	
l13424:
	movlw	(0)&0ffh
	line	21
	
l1647:
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
	
l14026:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18311
	goto	u18310

u18311:
	goto	l912
u18310:
	
l14028:; BSR set to: 2

	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u18321
	goto	u18320
u18321:
	goto	l14030
u18320:
	goto	l912
	line	1279
	
l14030:; BSR set to: 3

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((c:menu_update_numeric_value@screen_line))^00h,c
	line	1280
		movlw	03h-1
	cpfsgt	((c:menu_update_numeric_value@screen_line))^00h,c
	goto	u18331
	goto	u18330

u18331:
	goto	l14034
u18330:
	goto	l912
	line	1285
	
l14034:; BSR set to: 3

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
	
l14036:; BSR set to: 2

	movff	(c:menu_update_numeric_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(c:menu_update_numeric_value@flow_type),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u18341
	goto	u18340
u18341:
	goto	l14040
u18340:
	goto	l912
	line	1293
	
l14040:
	lfsr	2,(menu_update_numeric_value@value_buf)
	movlw	6-1
u18351:
	clrf	postinc2
	decf	wreg
	bc	u18351
	line	1295
	
l14042:
	movlb	3	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u18361
	goto	u18360
u18361:
	goto	l14074
u18360:
	line	1298
	
l14044:; BSR set to: 3

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18371
	goto	u18370

u18371:
	goto	l14048
u18370:
	
l14046:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18381
	goto	u18380
u18381:
	goto	l14050
u18380:
	
l14048:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1464))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1464))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1464))^00h,c
	goto	l14052
	
l14050:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1464+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1464))^00h,c
	
l14052:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1464),(c:menu_update_numeric_value@value_buf)
	line	1299
	
l14054:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18391
	goto	u18390

u18391:
	goto	l14058
u18390:
	
l14056:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18401
	goto	u18400
u18401:
	goto	l14060
u18400:
	
l14058:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1465))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1465))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1465))^00h,c
	goto	l14062
	
l14060:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1465+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1465))^00h,c
	
l14062:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1465),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1300
	
l14064:; BSR set to: 3

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18411
	goto	u18410

u18411:
	goto	l14068
u18410:
	
l14066:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18421
	goto	u18420
u18421:
	goto	l14070
u18420:
	
l14068:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1466))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1466))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1466))^00h,c
	goto	l14072
	
l14070:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1466+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1466))^00h,c
	
l14072:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1466),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1301
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+03h))^00h,c
	line	1302
	goto	l938
	line	1306
	
l14074:; BSR set to: 3

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18431
	goto	u18430
u18431:
	goto	l14078
u18430:
	
l14076:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18441
	goto	u18440
u18441:
	goto	l14086
u18440:
	
l14078:; BSR set to: 3

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u18451
	goto	u18450
u18451:
	goto	l14082
u18450:
	
l14080:; BSR set to: 3

	movlw	high(02Bh)
	movwf	((c:_menu_update_numeric_value$1468+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_menu_update_numeric_value$1468))^00h,c
	goto	l14084
	
l14082:; BSR set to: 3

	movlw	high(02Dh)
	movwf	((c:_menu_update_numeric_value$1468+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_menu_update_numeric_value$1468))^00h,c
	
l14084:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1468),(c:_menu_update_numeric_value$1467)
	movff	(c:_menu_update_numeric_value$1468+1),(c:_menu_update_numeric_value$1467+1)
	goto	l14088
	
l14086:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1467+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1467))^00h,c
	
l14088:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1467),(c:menu_update_numeric_value@value_buf)
	line	1307
	
l14090:; BSR set to: 3

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18461
	goto	u18460

u18461:
	goto	l14094
u18460:
	
l14092:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18471
	goto	u18470
u18471:
	goto	l14096
u18470:
	
l14094:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1469))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1469))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1469))^00h,c
	goto	l14098
	
l14096:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1469+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1469))^00h,c
	
l14098:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1469),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1308
	
l14100:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18481
	goto	u18480

u18481:
	goto	l14104
u18480:
	
l14102:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18491
	goto	u18490
u18491:
	goto	l14106
u18490:
	
l14104:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1470))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1470))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1470))^00h,c
	goto	l14108
	
l14106:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1470+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1470))^00h,c
	
l14108:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1470),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1309
	
l14110:; BSR set to: 3

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18501
	goto	u18500

u18501:
	goto	l14114
u18500:
	
l14112:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u18511
	goto	u18510
u18511:
	goto	l14116
u18510:
	
l14114:; BSR set to: 3

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1471))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1471))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1471))^00h,c
	goto	l14118
	
l14116:; BSR set to: 3

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1471+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1471))^00h,c
	
l14118:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1471),0+((c:menu_update_numeric_value@value_buf)+03h)
	line	1310
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+04h))^00h,c
	line	1311
	
l938:; BSR set to: 3

	line	1314
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u18521
	goto	u18520
u18521:
	goto	l14122
u18520:
	
l14120:; BSR set to: 3

	movlw	high(0Eh)
	movwf	((c:_menu_update_numeric_value$1473+1))^00h,c
	movlw	low(0Eh)
	movwf	((c:_menu_update_numeric_value$1473))^00h,c
	goto	l14124
	
l14122:; BSR set to: 3

	movlw	high(0Fh)
	movwf	((c:_menu_update_numeric_value$1473+1))^00h,c
	movlw	low(0Fh)
	movwf	((c:_menu_update_numeric_value$1473))^00h,c
	
l14124:; BSR set to: 3

	movff	(c:_menu_update_numeric_value$1473),(c:menu_update_numeric_value@start_col)
	line	1316
	
l14126:; BSR set to: 3

	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1317
	
l14128:
		movlw	low(STR_230)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_230)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1319
	
l14130:
	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1320
	
l14132:
		movlw	low(STR_231)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_231)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1321
	
l14134:
		movlw	low(menu_update_numeric_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1322
	
l14136:
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
	
l14138:
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
	
l14140:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u18531
	goto	u18530
u18531:
	goto	l890
u18530:
	
l14142:; BSR set to: 3

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u18541
	goto	u18540

u18541:
	goto	l14144
u18540:
	goto	l890
	line	1220
	
l14144:; BSR set to: 2

	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@screen_line))&0ffh
	line	1221
		movlw	03h-1
	cpfsgt	((menu_update_edit_value@screen_line))&0ffh
	goto	u18551
	goto	u18550

u18551:
	goto	l14148
u18550:
	goto	l890
	line	1225
	
l14148:; BSR set to: 0

	movff	(menu_update_edit_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_update_edit_value@flow_type),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u18561
	goto	u18560
u18561:
	goto	l14152
u18560:
	goto	l890
	line	1230
	
l14152:
	movlb	3	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u18571
	goto	u18570
u18571:
	goto	l14156
u18570:
	line	1232
	
l14154:; BSR set to: 3

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
	goto	l14164
	line	1238
	
l14156:; BSR set to: 3

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u18581
	goto	u18580
u18581:
	goto	l14160
u18580:
	
l14158:; BSR set to: 3

	movlw	high(02Bh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1449+1))&0ffh
	movlw	low(02Bh)
	movwf	((_menu_update_edit_value$1449))&0ffh
	goto	l14162
	
l14160:; BSR set to: 3

	movlw	high(02Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1449+1))&0ffh
	movlw	low(02Dh)
	movwf	((_menu_update_edit_value$1449))&0ffh
	
l14162:; BSR set to: 0

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
	
l14164:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@from))^00h,c
	clrf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1245
	
l14166:
	movlb	3	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u18591
	goto	u18590
u18591:
	goto	l14176
u18590:
	line	1248
	
l14168:; BSR set to: 3

	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u18601
	goto	u18600
u18601:
	goto	l900
u18600:
	line	1249
	
l14170:; BSR set to: 3

	decf	(0+(_menu+08h))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@blink_pos))&0ffh
	goto	l14172
	line	1250
	
l900:; BSR set to: 3

	line	1251
	movff	0+(_menu+08h),(menu_update_edit_value@blink_pos)
	line	1253
	
l14172:
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
	goto	u18611
	goto	u18610

u18611:
	goto	l14176
u18610:
	line	1254
	
l14174:; BSR set to: 0

	movf	((menu_update_edit_value@blink_pos))&0ffh,w
	addlw	low(menu_update_edit_value@display_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1258
	
l14176:
	movlb	3	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u18621
	goto	u18620
u18621:
	goto	l14180
u18620:
	
l14178:; BSR set to: 3

	movlw	high(0Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1453+1))&0ffh
	movlw	low(0Dh)
	movwf	((_menu_update_edit_value$1453))&0ffh
	goto	l14182
	
l14180:; BSR set to: 3

	movlw	high(0Eh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1453+1))&0ffh
	movlw	low(0Eh)
	movwf	((_menu_update_edit_value$1453))&0ffh
	
l14182:; BSR set to: 0

	movff	(_menu_update_edit_value$1453),(menu_update_edit_value@start_col)
	line	1259
	
l14184:; BSR set to: 0

	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	1260
	
l14186:
		movlw	low(STR_227)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_227)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1262
	
l14188:
	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	movlb	0	; () banked
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	1263
	
l14190:
		movlw	low(STR_228)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_228)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1264
	
l14192:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1265
	
l14194:
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
	
l13658:
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
;;		line 1866 in file "src\menu.c"
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
	line	1866
global __ptext12
__ptext12:
psect	text12
	file	"src\menu.c"
	line	1866
	
_menu_handle_encoder:; BSR set to: 3

;incstack = 0
	callstack 22
	line	1871
	
l13850:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17931
	goto	u17930
u17931:
	goto	l13972
u17930:
	line	1873
	
l13852:; BSR set to: 3

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u17941
	goto	u17940

u17941:
	goto	l1160
u17940:
	line	1876
	
l13854:; BSR set to: 3

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u17951
	goto	u17950

u17951:
	goto	l13916
u17950:
	line	1879
	
l13856:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_301)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_301)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(c:menu_handle_encoder@delta),0+((c:?_sprintf)+06h)
	movff	(c:menu_handle_encoder@delta+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1880
	
l13858:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1883
	
l13860:
		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17961
	goto	u17960

u17961:
	goto	l13866
u17960:
	line	1886
	
l13862:; BSR set to: 3

	movf	((c:menu_handle_encoder@delta))^00h,c,w
	
	call	_handle_time_rotation
	line	1887
	call	_menu_update_time_value	;wreg free
	goto	l1160
	line	1888
	
l13864:
	goto	l1160
	line	1891
	
l13866:; BSR set to: 3

		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1892
		movlw	low(0)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1894
	
l13868:; BSR set to: 1

	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17971
	goto	u17970
u17971:
	goto	l13872
u17970:
	line	1896
	
l13870:; BSR set to: 3

		movlw	low(_menu_item_options)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1897
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1898
	goto	l1162
	line	1899
	
l13872:; BSR set to: 3

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17981
	goto	u17980

u17981:
	goto	l13876
u17980:
	line	1901
	
l13874:; BSR set to: 3

		movlw	low(_menu_item_options+048h)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1902
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1903
	goto	l1162
	line	1904
	
l13876:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17991
	goto	u17990

u17991:
	goto	l1162
u17990:
	line	1906
	
l13878:; BSR set to: 3

		movlw	low(_menu_item_options+03Ch)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1907
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1910
	
l1162:
	movlb	1	; () banked
	movf	((menu_handle_encoder@clock_opts))&0ffh,w
iorwf	((menu_handle_encoder@clock_opts+1))&0ffh,w
	btfsc	status,2
	goto	u18001
	goto	u18000

u18001:
	goto	l1160
u18000:
	
l13880:; BSR set to: 1

	movf	((menu_handle_encoder@clock_flag))&0ffh,w
iorwf	((menu_handle_encoder@clock_flag+1))&0ffh,w
	btfsc	status,2
	goto	u18011
	goto	u18010

u18011:
	goto	l1160
u18010:
	line	1912
	
l13882:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_302)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_302)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movf	((??_menu_handle_encoder+0+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1913
	
l13884:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1915
	
l13886:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18021
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u18020
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u18021
	goto	u18020

u18021:
	goto	l13894
u18020:
	line	1917
	
l13888:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	incf	indf2

	line	1918
	
l13890:
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
	goto	u18031
	goto	u18030

u18031:
	goto	l13902
u18030:
	line	1919
	
l13892:; BSR set to: 1

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	goto	l13902
	line	1921
	
l13894:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18040
	goto	u18041

u18041:
	goto	l13902
u18040:
	line	1923
	
l13896:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u18051
	goto	u18050
u18051:
	goto	l13900
u18050:
	line	1924
	
l13898:
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

	goto	l13902
	line	1926
	
l13900:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	decf	indf2

	line	1930
	
l13902:
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
	goto	u18061
	goto	u18060

u18061:
	goto	l13906
u18060:
	line	1931
	
l13904:; BSR set to: 1

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	line	1933
	
l13906:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_303)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_303)
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
	line	1934
	
l13908:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1937
	
l13910:
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
	line	1938
	
l13912:
	call	_menu_draw_clock	;wreg free
	goto	l1160
	line	1945
	
l13916:; BSR set to: 2

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
	line	1946
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
	line	1949
	
l13918:; BSR set to: 1

	movff	(menu_handle_encoder@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_option_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u18071
	goto	u18070
u18071:
	goto	l13950
u18070:
	line	1951
	
l13920:
	movff	(menu_handle_encoder@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_encoder@edit_flag)
	movff	1+?_get_option_edit_flag,(menu_handle_encoder@edit_flag+1)
	line	1952
	movff	(menu_handle_encoder@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_encoder@opts)
	movff	1+?_get_item_options_for_field,(menu_handle_encoder@opts+1)
	line	1954
	
l13922:
	movlb	1	; () banked
	movf	((menu_handle_encoder@edit_flag))&0ffh,w
iorwf	((menu_handle_encoder@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u18081
	goto	u18080

u18081:
	goto	l1160
u18080:
	
l13924:; BSR set to: 1

	movf	((menu_handle_encoder@opts))&0ffh,w
iorwf	((menu_handle_encoder@opts+1))&0ffh,w
	btfsc	status,2
	goto	u18091
	goto	u18090

u18091:
	goto	l1160
u18090:
	line	1956
	
l13926:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18101
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u18100
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u18101
	goto	u18100

u18101:
	goto	l13934
u18100:
	line	1958
	
l13928:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	incf	indf2

	line	1959
	
l13930:; BSR set to: 1

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
	goto	u18111
	goto	u18110

u18111:
	goto	l13942
u18110:
	line	1960
	
l13932:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	goto	l13942
	line	1962
	
l13934:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18120
	goto	u18121

u18121:
	goto	l13942
u18120:
	line	1964
	
l13936:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u18131
	goto	u18130
u18131:
	goto	l13940
u18130:
	line	1965
	
l13938:; BSR set to: 1

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

	goto	l13942
	line	1967
	
l13940:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	decf	indf2

	line	1971
	
l13942:; BSR set to: 1

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
	goto	u18141
	goto	u18140

u18141:
	goto	l13946
u18140:
	line	1972
	
l13944:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	line	1975
	
l13946:; BSR set to: 1

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18151
	goto	u18150

u18151:
	goto	l13864
u18150:
	line	1977
	
l13948:; BSR set to: 2

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
	line	1978
	call	_menu_draw_input	;wreg free
	goto	l1160
	line	1982
	
l13950:
	movff	(menu_handle_encoder@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u18161
	goto	u18160
u18161:
	goto	l13960
u18160:
	line	1984
	
l13952:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18170
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u18171
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u18171
	goto	u18170

u18171:
	goto	l13956
u18170:
	
l13954:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1659))&0ffh
	setf	((_menu_handle_encoder$1659+1))&0ffh
	goto	l13958
	
l13956:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1659+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1659))&0ffh
	
l13958:; BSR set to: 1

	movf	((_menu_handle_encoder$1659))&0ffh,w
	
	call	_handle_numeric_rotation
	line	1985
	goto	l1160
	line	1986
	
l13960:
	movff	(menu_handle_encoder@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_time_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u18181
	goto	u18180
u18181:
	goto	l13864
u18180:
	line	1988
	
l13962:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18190
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u18191
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u18191
	goto	u18190

u18191:
	goto	l13966
u18190:
	
l13964:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1660))&0ffh
	setf	((_menu_handle_encoder$1660+1))&0ffh
	goto	l13968
	
l13966:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1660+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1660))&0ffh
	
l13968:; BSR set to: 1

	movf	((_menu_handle_encoder$1660))&0ffh,w
	
	call	_handle_time_rotation
	goto	l1160
	line	1995
	
l13972:; BSR set to: 3

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18201
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u18200
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u18201
	goto	u18200

u18201:
	goto	l13990
u18200:
	line	1999
	
l13974:; BSR set to: 3

		movlw	low(menu_handle_encoder@buf_1661)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1661)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_304)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_304)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	2000
	
l13976:
		movlw	low(menu_handle_encoder@buf_1661)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1661)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2003
	
l13978:
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
	goto	u18211
	goto	u18210

u18211:
	goto	l13986
u18210:
	line	2005
	
l13980:; BSR set to: 3

	incf	((_menu))&0ffh
	line	2008
	
l13982:; BSR set to: 3

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
	goto	u18221
	goto	u18220

u18221:
	goto	l13986
u18220:
	line	2010
	
l13984:; BSR set to: 3

	incf	(0+(_menu+01h))&0ffh
	line	2014
	
l13986:; BSR set to: 3

		movlw	low(menu_handle_encoder@buf_1661)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1661)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_305)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_305)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2015
	
l13988:
		movlw	low(menu_handle_encoder@buf_1661)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1661)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2016
	goto	l14008
	line	2017
	
l13990:; BSR set to: 3

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u18230
	goto	u18231

u18231:
	goto	l14008
u18230:
	line	2021
	
l13992:; BSR set to: 3

		movlw	low(menu_handle_encoder@buf_1664)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1664)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_306)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_306)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	2022
	
l13994:
		movlw	low(menu_handle_encoder@buf_1664)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1664)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2025
	
l13996:
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u18241
	goto	u18240
u18241:
	goto	l14004
u18240:
	line	2027
	
l13998:; BSR set to: 3

	decf	((_menu))&0ffh
	line	2030
	
l14000:; BSR set to: 3

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u18251
	goto	u18250

u18251:
	goto	l14004
u18250:
	line	2032
	
l14002:; BSR set to: 3

	decf	(0+(_menu+01h))&0ffh
	line	2036
	
l14004:; BSR set to: 3

		movlw	low(menu_handle_encoder@buf_1664)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1664)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_307)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_307)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2037
	
l14006:
		movlw	low(menu_handle_encoder@buf_1664)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1664)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2041
	
l14008:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u18261
	goto	u18260
u18261:
	goto	l1160
u18260:
	line	2043
	
l14010:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18271
	goto	u18270
u18271:
	goto	l14014
u18270:
	line	2044
	
l14012:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	goto	l1160
	line	2045
	
l14014:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18281
	goto	u18280

u18281:
	goto	l14018
u18280:
	line	2046
	
l14016:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	goto	l1160
	line	2047
	
l14018:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18291
	goto	u18290

u18291:
	goto	l14022
u18290:
	line	2048
	
l14020:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	goto	l1160
	line	2049
	
l14022:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18301
	goto	u18300

u18301:
	goto	l13864
u18300:
	goto	l13912
	line	2052
	
l1160:
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
;;		On entry : 3D/1
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
	
l12412:
		movlw	low(STR_142)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_142)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	480
	
l12414:
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
	
l12416:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	483
	
l12418:
	movlb	3	; () banked
	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u16301
	goto	u16300
u16301:
	goto	l12460
u16300:
	line	485
	
l12420:; BSR set to: 3

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u16311
	goto	u16310

u16311:
	goto	l12442
u16310:
	line	487
	
l12422:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+012h))&0ffh
	line	489
	
l12424:; BSR set to: 3

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16321
	goto	u16320

u16321:
	goto	l12432
u16320:
	
l12426:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16331
	goto	u16330

u16331:
	goto	l12432
u16330:
	
l12428:; BSR set to: 3

		movlw	03h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u16341
	goto	u16340

u16341:
	goto	l12432
u16340:
	line	490
	
l12430:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+012h))&0ffh
	goto	l12486
	line	491
	
l12432:
		movlw	2
	movlb	3	; () banked
	xorwf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u16351
	goto	u16350

u16351:
	goto	l12438
u16350:
	
l12434:; BSR set to: 3

		movlw	018h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u16361
	goto	u16360

u16361:
	goto	l12438
u16360:
	goto	l12430
	line	493
	
l12438:; BSR set to: 3

		movlw	064h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u16371
	goto	u16370

u16371:
	goto	l620
u16370:
	goto	l12430
	line	498
	
l12442:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u16381
	goto	u16380
u16381:
	goto	l12458
u16380:
	line	501
	
l12444:; BSR set to: 3

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16391
	goto	u16390

u16391:
	goto	l12450
u16390:
	
l12446:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16401
	goto	u16400

u16401:
	goto	l12450
u16400:
	line	502
	
l12448:; BSR set to: 3

	movlw	low(02h)
	movwf	(0+(_menu+012h))&0ffh
	goto	l12486
	line	504
	
l12450:
		movlw	2
	movlb	3	; () banked
	xorwf	(0+(_menu+010h))&0ffh,w
	btfsc	status,2
	goto	u16411
	goto	u16410

u16411:
	goto	l12454
u16410:
	
l12452:; BSR set to: 3

	movlw	high(063h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1270+1))&0ffh
	movlw	low(063h)
	movwf	((_handle_time_rotation$1270))&0ffh
	goto	l12456
	
l12454:; BSR set to: 3

	movlw	high(017h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1270+1))&0ffh
	movlw	low(017h)
	movwf	((_handle_time_rotation$1270))&0ffh
	
l12456:; BSR set to: 0

	movff	(_handle_time_rotation$1270),0+(_menu+012h)
	goto	l12486
	line	508
	
l12458:; BSR set to: 3

	decf	(0+(_menu+012h))&0ffh
	goto	l12486
	line	510
	
l620:; BSR set to: 3

	line	511
	goto	l12486
	line	512
	
l12460:; BSR set to: 3

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u16421
	goto	u16420

u16421:
	goto	l12486
u16420:
	line	515
	
l12462:; BSR set to: 3

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16431
	goto	u16430

u16431:
	goto	l12472
u16430:
	
l12464:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16441
	goto	u16440

u16441:
	goto	l12472
u16440:
	
l12466:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u16451
	goto	u16450

u16451:
	goto	l12472
u16450:
	line	518
	
l12468:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l632
	line	522
	
l12472:
	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u16461
	goto	u16460

u16461:
	goto	l12480
u16460:
	line	524
	
l12474:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+013h))&0ffh
	line	525
	
l12476:; BSR set to: 3

		movlw	03Ch-1
	cpfsgt	(0+(_menu+013h))&0ffh
	goto	u16471
	goto	u16470

u16471:
	goto	l12486
u16470:
	line	526
	
l12478:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l12486
	line	530
	
l12480:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	btfss	status,2
	goto	u16481
	goto	u16480
u16481:
	goto	l12484
u16480:
	line	531
	
l12482:; BSR set to: 3

	movlw	low(03Bh)
	movwf	(0+(_menu+013h))&0ffh
	goto	l12486
	line	533
	
l12484:; BSR set to: 3

	decf	(0+(_menu+013h))&0ffh
	line	537
	
l12486:
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
	
l12488:
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
;;		On entry : 3F/1
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
	
l12310:
		movlw	low(STR_223)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_223)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1126
	
l12312:
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
	
l12314:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1130
	
l12316:
	movlb	3	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u16061
	goto	u16060
u16061:
	goto	l12410
u16060:
	
l12318:; BSR set to: 3

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u16071
	goto	u16070
u16071:
	goto	l12410
u16070:
	line	1132
	
l12320:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+08h))&0ffh
	goto	l12410
	line	1138
	
l12322:; BSR set to: 3

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u16081
	goto	u16080
u16081:
	goto	l882
u16080:
	
l12324:; BSR set to: 3

	movlb	0	; () banked
	movf	((handle_numeric_rotation@direction))&0ffh,w
	btfsc	status,2
	goto	u16091
	goto	u16090
u16091:
	goto	l882
u16090:
	line	1140
	
l12326:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u16101
	goto	u16100
u16101:
	movlw	1
	goto	u16110
u16100:
	movlw	0
u16110:
	movwf	(0+(_menu+09h))&0ffh
	goto	l882
	line	1145
	
l12328:; BSR set to: 3

	movlb	0	; () banked
		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u16121
	goto	u16120

u16121:
	goto	l12336
u16120:
	line	1147
	
l12330:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+0Ah))&0ffh
	line	1148
	
l12332:; BSR set to: 3

		movlw	06h-1
	cpfsgt	(0+(_menu+0Ah))&0ffh
	goto	u16131
	goto	u16130

u16131:
	goto	l882
u16130:
	line	1149
	
l12334:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l882
	line	1151
	
l12336:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u16140
	goto	u16141

u16141:
	goto	l882
u16140:
	line	1153
	
l12338:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u16151
	goto	u16150
u16151:
	goto	l12342
u16150:
	line	1154
	
l12340:; BSR set to: 3

	movlw	low(05h)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l882
	line	1156
	
l12342:; BSR set to: 3

	decf	(0+(_menu+0Ah))&0ffh
	goto	l882
	line	1162
	
l12344:; BSR set to: 3

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u16161
	goto	u16160

u16161:
	goto	l12348
u16160:
	
l12346:; BSR set to: 3

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1438+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1438))&0ffh
	goto	l12350
	
l12348:; BSR set to: 3

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1438+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1438))&0ffh
	
l12350:; BSR set to: 0

	movff	(_handle_numeric_rotation$1438),(handle_numeric_rotation@max_tens)
	line	1163
	
l12352:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u16171
	goto	u16170

u16171:
	goto	l12364
u16170:
	line	1165
	
l12354:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u16181
	goto	u16180
u16181:
	goto	l12358
u16180:
	goto	l882
	line	1167
	
l12358:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+0Bh))&0ffh
	line	1168
	
l12360:; BSR set to: 3

		movf	(0+(_menu+0Bh))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfsc	status,0
	goto	u16191
	goto	u16190

u16191:
	goto	l882
u16190:
	line	1169
	
l12362:; BSR set to: 0

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	goto	l882
	line	1171
	
l12364:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u16200
	goto	u16201

u16201:
	goto	l882
u16200:
	line	1173
	
l12366:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u16211
	goto	u16210
u16211:
	goto	l12370
u16210:
	goto	l882
	line	1175
	
l12370:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+0Bh))&0ffh,w
	btfss	status,2
	goto	u16221
	goto	u16220
u16221:
	goto	l12374
u16220:
	line	1176
	
l12372:; BSR set to: 3

	movff	(handle_numeric_rotation@max_tens),0+(_menu+0Bh)
	goto	l882
	line	1178
	
l12374:; BSR set to: 3

	decf	(0+(_menu+0Bh))&0ffh
	goto	l882
	line	1185
	
l12376:; BSR set to: 3

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u16231
	goto	u16230

u16231:
	goto	l12380
u16230:
	
l12378:; BSR set to: 3

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1440+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1440))&0ffh
	goto	l12382
	
l12380:; BSR set to: 3

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1440+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1440))&0ffh
	
l12382:; BSR set to: 0

	movff	(_handle_numeric_rotation$1440),(handle_numeric_rotation@max_units)
	line	1186
	
l12384:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u16241
	goto	u16240

u16241:
	goto	l12396
u16240:
	line	1188
	
l12386:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u16251
	goto	u16250
u16251:
	goto	l12390
u16250:
	goto	l882
	line	1190
	
l12390:; BSR set to: 0

	movlb	3	; () banked
	incf	(0+(_menu+0Ch))&0ffh
	line	1191
	
l12392:; BSR set to: 3

		movf	(0+(_menu+0Ch))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_units))&0ffh,w
	btfsc	status,0
	goto	u16261
	goto	u16260

u16261:
	goto	l882
u16260:
	line	1192
	
l12394:; BSR set to: 0

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	goto	l882
	line	1194
	
l12396:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u16270
	goto	u16271

u16271:
	goto	l882
u16270:
	line	1196
	
l12398:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u16281
	goto	u16280
u16281:
	goto	l12402
u16280:
	goto	l882
	line	1198
	
l12402:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+0Ch))&0ffh,w
	btfss	status,2
	goto	u16291
	goto	u16290
u16291:
	goto	l12406
u16290:
	line	1199
	
l12404:; BSR set to: 3

	movff	(handle_numeric_rotation@max_units),0+(_menu+0Ch)
	goto	l882
	line	1201
	
l12406:; BSR set to: 3

	decf	(0+(_menu+0Ch))&0ffh
	goto	l882
	line	1135
	
l12410:; BSR set to: 3

	movf	(0+(_menu+08h))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l12322
	xorlw	1^0	; case 1
	skipnz
	goto	l12328
	xorlw	2^1	; case 2
	skipnz
	goto	l12344
	xorlw	3^2	; case 3
	skipnz
	goto	l12376
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
;;		line 2058 in file "src\menu.c"
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
;;		On entry : 3F/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0     230       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       5     230       0       0       0       0       0       0       0       0       0       0       0       0       0       0
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
	line	2058
global __ptext15
__ptext15:
psect	text15
	file	"src\menu.c"
	line	2058
	
_menu_handle_button:
;incstack = 0
	callstack 22
	movwf	((menu_handle_button@press_type))&0ffh
	line	2063
	
l14196:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u18631
	goto	u18630
u18631:
	goto	l14568
u18630:
	line	2065
	
l14198:; BSR set to: 3

	movlb	1	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u18641
	goto	u18640

u18641:
	goto	l14558
u18640:
	line	2068
	
l14200:; BSR set to: 1

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18651
	goto	u18650

u18651:
	goto	l14302
u18650:
	line	2073
	
l14202:; BSR set to: 2

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_308)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_308)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2074
	
l14204:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2077
	
l14206:
		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2078
	
l14208:; BSR set to: 1

		movlw	low(0)
	movwf	((menu_handle_button@edit_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@edit_flag+1))&0ffh

	line	2080
	
l14210:; BSR set to: 1

	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18661
	goto	u18660
u18661:
	goto	l14220
u18660:
	line	2082
	
l14212:; BSR set to: 3

		movlw	low(_menu_item_options)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2083
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2084
	
l14214:; BSR set to: 1

	movff	(c:_enable_edit_flag),(_system_config)
	line	2085
	
l14216:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_309)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_309)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2086
	
l14218:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2087
	goto	l1223
	line	2088
	
l14220:; BSR set to: 3

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18671
	goto	u18670

u18671:
	goto	l14230
u18670:
	line	2090
	
l14222:; BSR set to: 3

		movlw	low(_menu_item_options+048h)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2091
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2092
	
l14224:; BSR set to: 1

	movff	(c:_relay_high_edit_flag),0+(_system_config+06h)
	line	2093
	
l14226:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_310)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_310)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+06h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	goto	l14218
	line	2096
	
l14230:; BSR set to: 3

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18681
	goto	u18680

u18681:
	goto	l14280
u18680:
	line	2099
	
l14232:; BSR set to: 3

	incf	(0+(_menu+011h))&0ffh
	line	2100
	
l14234:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2103
	
l14236:; BSR set to: 3

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u18691
	goto	u18690

u18691:
	goto	l14242
u18690:
	
l14238:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u18701
	goto	u18700

u18701:
	goto	l14242
u18700:
	line	2105
	
l14240:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	line	2108
	
l14242:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2110
	
l14244:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_311)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_311)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2111
	
l14246:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2114
	
l14248:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_312)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_312)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2115
	
l14250:
	call	_menu_draw_clock	;wreg free
	line	2117
	
l14252:
		movlw	02h-1
	movlb	3	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u18711
	goto	u18710

u18711:
	goto	l1234
u18710:
	line	2120
	
l14254:; BSR set to: 3

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
	line	2123
	
l14256:; BSR set to: 1

	movf	((menu_handle_button@new_value))&0ffh,w
iorwf	((menu_handle_button@new_value+1))&0ffh,w
	btfss	status,2
	goto	u18721
	goto	u18720

u18721:
	goto	l14260
u18720:
	line	2124
	
l14258:; BSR set to: 1

	movlw	high(01h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(01h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	2125
	
l14260:; BSR set to: 1

		movf	((menu_handle_button@new_value+1))&0ffh,w
	bnz	u18730
	movlw	121
	subwf	 ((menu_handle_button@new_value))&0ffh,w
	btfss	status,0
	goto	u18731
	goto	u18730

u18731:
	goto	l14264
u18730:
	line	2126
	
l14262:; BSR set to: 1

	movlw	high(078h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(078h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	2128
	
l14264:; BSR set to: 1

	movff	(menu_handle_button@new_value),0+(_system_config+07h)
	line	2131
	
l14266:; BSR set to: 1

		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_313)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_313)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(03Ch)
	movwf	((c:___lbdiv@divisor))^00h,c
	movlb	5	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbdiv
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movf	((??_menu_handle_button+0+0))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	5	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbmod
	movlb	0	; () banked
	movwf	(??_menu_handle_button+1+0)&0ffh
	movf	((??_menu_handle_button+1+0))&0ffh,w
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2132
	
l14268:
		movff	0+(_clock_menu+0Ch),(c:strcpy@to)
	movff	1+(_clock_menu+0Ch),(c:strcpy@to+1)

		movlw	low(_value_relay_pulse)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	2134
	
l14270:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_314)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_314)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+07h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2135
	
l14272:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2136
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	2137
	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2138
	
l14274:; BSR set to: 3

	call	_menu_draw_clock	;wreg free
	line	2142
	
l14276:
	movlw	(0)&0ffh
	
	call	_trigger_relay_pulse
	line	2143
	goto	l1234
	line	2144
	
l1228:
	line	2146
	goto	l1234
	line	2151
	
l14280:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18741
	goto	u18740

u18741:
	goto	l1223
u18740:
	line	2153
	
l14282:; BSR set to: 3

		movlw	low(_menu_item_options+03Ch)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2154
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2158
	
l1223:
	movlb	1	; () banked
	movf	((menu_handle_button@opts))&0ffh,w
iorwf	((menu_handle_button@opts+1))&0ffh,w
	btfsc	status,2
	goto	u18751
	goto	u18750

u18751:
	goto	l14296
u18750:
	
l14284:; BSR set to: 1

	movf	((menu_handle_button@edit_flag))&0ffh,w
iorwf	((menu_handle_button@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u18761
	goto	u18760

u18761:
	goto	l14296
u18760:
	
l14286:; BSR set to: 1

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
	goto	u18771
	goto	u18770
u18771:
	goto	l14296
u18770:
	line	2160
	
l14288:; BSR set to: 0

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
	line	2161
	
l14290:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	2162
	
l14292:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_315)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_315)
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
	line	2163
	
l14294:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2166
	
l14296:
	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2167
	
l14298:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1234
	line	2172
	
l14302:; BSR set to: 2

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
	line	2173
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
	line	2176
	
l14304:; BSR set to: 1

	movff	(menu_handle_button@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_option_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u18781
	goto	u18780
u18781:
	goto	l14408
u18780:
	line	2178
	
l14306:
	movff	(menu_handle_button@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1691)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1691+1)
	line	2179
	movff	(menu_handle_button@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1692)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1692+1)
	line	2181
	
l14308:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag_1691))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1691+1))&0ffh,w
	btfsc	status,2
	goto	u18791
	goto	u18790

u18791:
	goto	l14296
u18790:
	
l14310:; BSR set to: 1

	movf	((menu_handle_button@opts_1692))&0ffh,w
iorwf	((menu_handle_button@opts_1692+1))&0ffh,w
	btfsc	status,2
	goto	u18801
	goto	u18800

u18801:
	goto	l14296
u18800:
	line	2184
	
l14312:; BSR set to: 1

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
	movff	(menu_handle_button@edit_flag_1691),fsr2l
	movff	(menu_handle_button@edit_flag_1691+1),fsr2h
	movf	indf2,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movf	((??_menu_handle_button+0+0))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_button+1+0
	movff	prodh,??_menu_handle_button+1+0+1
	movf	(??_menu_handle_button+1+0)&0ffh,w
	movlb	1	; () banked
	addwf	((menu_handle_button@opts_1692))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+3+0)&0ffh
	movf	(??_menu_handle_button+1+1)&0ffh,w
	movlb	1	; () banked
	addwfc	((menu_handle_button@opts_1692+1))&0ffh,w
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
	
l14314:
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18811
	goto	u18810
u18811:
	goto	l14318
u18810:
	line	2189
	
l14316:; BSR set to: 3

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

	line	2190
	goto	l14402
	line	2191
	
l14318:; BSR set to: 3

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18821
	goto	u18820

u18821:
	goto	l14330
u18820:
	line	2193
	
l14320:; BSR set to: 3

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

	line	2196
	
l14322:; BSR set to: 2

		movlw	2
	xorwf	((c:_sensor_edit_flag))^00h,c,w
	btfss	status,2
	goto	u18831
	goto	u18830

u18831:
	goto	l14328
u18830:
	
l14324:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfsc	status,2
	goto	u18841
	goto	u18840

u18841:
	goto	l14328
u18840:
	line	2198
	
l14326:; BSR set to: 1

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
	line	2202
	
l14328:
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	2203
	goto	l14402
	line	2204
	
l14330:; BSR set to: 3

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18851
	goto	u18850

u18851:
	goto	l14338
u18850:
	
l14332:; BSR set to: 3

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u18861
	goto	u18860

u18861:
	goto	l14338
u18860:
	line	2206
	
l14334:; BSR set to: 1

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

	line	2209
	
l14336:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	2210
	goto	l14402
	line	2211
	
l14338:
		movlw	3
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18871
	goto	u18870

u18871:
	goto	l14346
u18870:
	
l14340:; BSR set to: 3

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u18881
	goto	u18880

u18881:
	goto	l14346
u18880:
	
l14342:; BSR set to: 1

		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u18891
	goto	u18890

u18891:
	goto	l14346
u18890:
	goto	l14402
	line	2214
	
l14344:
	goto	l14402
	line	2215
	
l14346:
		movlw	3
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18901
	goto	u18900

u18901:
	goto	l14354
u18900:
	
l14348:; BSR set to: 3

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u18911
	goto	u18910

u18911:
	goto	l14354
u18910:
	
l14350:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u18921
	goto	u18920
u18921:
	goto	l14354
u18920:
	line	2217
	
l14352:; BSR set to: 1

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

	line	2218
	goto	l14402
	line	2219
	
l14354:
	movlb	1	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u18931
	goto	u18930
u18931:
	goto	l14372
u18930:
	line	2221
	
l14356:; BSR set to: 1

		movlw	9
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18941
	goto	u18940

u18941:
	goto	l14360
u18940:
	line	2222
	
l14358:; BSR set to: 3

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

	goto	l14402
	line	2223
	
l14360:; BSR set to: 3

		movlw	10
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18951
	goto	u18950

u18951:
	goto	l14364
u18950:
	line	2224
	
l14362:; BSR set to: 3

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

	goto	l14402
	line	2225
	
l14364:; BSR set to: 3

		movlw	11
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18961
	goto	u18960

u18961:
	goto	l14368
u18960:
	line	2226
	
l14366:; BSR set to: 3

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

	goto	l14402
	line	2227
	
l14368:; BSR set to: 3

		movlw	12
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18971
	goto	u18970

u18971:
	goto	l14344
u18970:
	line	2228
	
l14370:; BSR set to: 3

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

	goto	l14402
	line	2230
	
l14372:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u18981
	goto	u18980

u18981:
	goto	l14382
u18980:
	line	2232
	
l14374:; BSR set to: 1

		movlw	6
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18991
	goto	u18990

u18991:
	goto	l14378
u18990:
	goto	l14358
	line	2234
	
l14378:; BSR set to: 3

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19001
	goto	u19000

u19001:
	goto	l14344
u19000:
	goto	l14370
	line	2237
	
l14382:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19011
	goto	u19010

u19011:
	goto	l14344
u19010:
	line	2239
	
l14384:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u19021
	goto	u19020
u19021:
	goto	l14394
u19020:
	line	2241
	
l14386:; BSR set to: 1

		movlw	8
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19031
	goto	u19030

u19031:
	goto	l14390
u19030:
	line	2242
	
l14388:; BSR set to: 3

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

	goto	l14402
	line	2243
	
l14390:; BSR set to: 3

		movlw	9
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19041
	goto	u19040

u19041:
	goto	l14344
u19040:
	goto	l14370
	line	2248
	
l14394:; BSR set to: 1

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19051
	goto	u19050

u19051:
	goto	l14398
u19050:
	goto	l14388
	line	2250
	
l14398:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19061
	goto	u19060

u19061:
	goto	l14344
u19060:
	goto	l14370
	line	2255
	
l14402:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	goto	l14296
	line	2262
	
l14408:
	movff	(menu_handle_button@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_time_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u19071
	goto	u19070
u19071:
	goto	l14472
u19070:
	line	2264
	
l14410:
	movlb	3	; () banked
	incf	(0+(_menu+011h))&0ffh
	line	2265
	
l14412:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2266
	
l14414:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2269
	
l14416:
		movlw	low(menu_handle_button@buf_1697)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1697)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_316)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_316)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2270
	
l14418:
		movlw	low(menu_handle_button@buf_1697)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1697)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2272
	
l14420:
	call	_menu_update_time_value	;wreg free
	line	2274
	
l14422:
		movlw	02h-1
	movlb	3	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u19081
	goto	u19080

u19081:
	goto	l1234
u19080:
	line	2278
	
l14424:; BSR set to: 3

	movf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u19091
	goto	u19090
u19091:
	goto	l14428
u19090:
	line	2279
	
l14426:; BSR set to: 3

	movf	(0+(_menu+012h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+(_menu+013h))&0ffh,w
	movlb	0	; () banked
	addwf	(??_menu_handle_button+0+0)&0ffh,w
	movlb	1	; () banked
	movwf	((menu_handle_button@new_seconds))&0ffh
	movlb	3	; () banked
	movlw	0
	movlb	0	; () banked
	addwfc	(??_menu_handle_button+0+1)&0ffh,w
	movlb	1	; () banked
	movwf	1+((menu_handle_button@new_seconds))&0ffh
	goto	l14430
	line	2281
	
l14428:; BSR set to: 3

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
	movlb	1	; () banked
	movwf	((menu_handle_button@new_seconds))&0ffh
	movf	(1+?___wmul)^00h,c,w
	movlb	0	; () banked
	addwfc	(??_menu_handle_button+0+1)&0ffh,w
	movlb	1	; () banked
	movwf	1+((menu_handle_button@new_seconds))&0ffh
	line	2284
	
l14430:; BSR set to: 1

	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19101
	goto	u19100
u19101:
	goto	l14444
u19100:
	line	2286
	
l14432:; BSR set to: 1

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19111
	goto	u19110

u19111:
	goto	l14436
u19110:
	line	2287
	
l14434:; BSR set to: 3

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
	goto	l14464
	line	2288
	
l14436:; BSR set to: 3

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19121
	goto	u19120

u19121:
	goto	l14440
u19120:
	line	2289
	
l14438:; BSR set to: 3

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
	goto	l14464
	line	2290
	
l14440:; BSR set to: 3

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19131
	goto	u19130

u19131:
	goto	l1281
u19130:
	line	2291
	
l14442:; BSR set to: 3

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
	goto	l14464
	line	2292
	
l1281:; BSR set to: 3

	goto	l14464
	line	2293
	
l14444:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19141
	goto	u19140

u19141:
	goto	l14450
u19140:
	line	2295
	
l14446:; BSR set to: 1

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19151
	goto	u19150

u19151:
	goto	l14464
u19150:
	goto	l14434
	line	2298
	
l14450:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19161
	goto	u19160

u19161:
	goto	l14464
u19160:
	line	2300
	
l14452:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u19171
	goto	u19170
u19171:
	goto	l14458
u19170:
	
l14454:; BSR set to: 1

		movlw	7
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19181
	goto	u19180

u19181:
	goto	l14458
u19180:
	line	2301
	
l14456:; BSR set to: 3

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
	goto	l14464
	line	2302
	
l14458:
	movlb	1	; () banked
		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u19191
	goto	u19190

u19191:
	goto	l14464
u19190:
	
l14460:; BSR set to: 1

		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19201
	goto	u19200

u19201:
	goto	l14464
u19200:
	goto	l14456
	line	2308
	
l14464:
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
		movlw	low(STR_317)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_317)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2310
	
l14466:
	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2311
	
l14468:; BSR set to: 3

	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	2312
	
l14470:; BSR set to: 1

		movlw	low(STR_318)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_318)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1234
	line	2316
	
l14472:
	movff	(menu_handle_button@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u19211
	goto	u19210
u19211:
	goto	l1228
u19210:
	line	2318
	
l14474:
	movlb	3	; () banked
	incf	(0+(_menu+08h))&0ffh
	line	2319
	
l14476:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2321
	
l14478:
		movlw	2
	movlb	3	; () banked
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u19221
	goto	u19220

u19221:
	goto	l14484
u19220:
	
l14480:; BSR set to: 3

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u19231
	goto	u19230

u19231:
	goto	l14484
u19230:
	line	2323
	
l14482:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+0Bh))&0ffh
	line	2324
	movlw	low(0)
	movwf	(0+(_menu+0Ch))&0ffh
	line	2327
	
l14484:; BSR set to: 3

		movlw	04h-1
	cpfsgt	(0+(_menu+08h))&0ffh
	goto	u19241
	goto	u19240

u19241:
	goto	l1228
u19240:
	line	2329
	
l14486:; BSR set to: 3

	call	_get_current_numeric_value	;wreg free
	movff	0+?_get_current_numeric_value,(menu_handle_button@new_value_1702)
	movff	1+?_get_current_numeric_value,(menu_handle_button@new_value_1702+1)
	line	2332
	
l14488:; BSR set to: 3

	movlb	1	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19251
	goto	u19250
u19251:
	goto	l14512
u19250:
	line	2334
	
l14490:; BSR set to: 1

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19261
	goto	u19260

u19261:
	goto	l14496
u19260:
	line	2336
	
l14492:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1702),postinc2
	movff	(menu_handle_button@new_value_1702+1),postdec2
	line	2337
	
l14494:; BSR set to: 2

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_319)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_319)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1702),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1702+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2338
	goto	l14554
	line	2339
	
l14496:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19271
	goto	u19270

u19271:
	goto	l14502
u19270:
	line	2341
	
l14498:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1702),postinc2
	movff	(menu_handle_button@new_value_1702+1),postdec2
	line	2342
	
l14500:; BSR set to: 2

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_320)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_320)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1702),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1702+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2343
	goto	l14554
	line	2344
	
l14502:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19281
	goto	u19280

u19281:
	goto	l14508
u19280:
	line	2346
	
l14504:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1702),postinc2
	movff	(menu_handle_button@new_value_1702+1),postdec2
	line	2347
	
l14506:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_321)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_321)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1702),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1702+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2348
	goto	l14554
	line	2349
	
l14508:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19291
	goto	u19290

u19291:
	goto	l1301
u19290:
	line	2352
	
l14510:; BSR set to: 3

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_322)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_322)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1702),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1702+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l14554
	line	2354
	
l1301:; BSR set to: 3

	goto	l14554
	line	2355
	
l14512:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19301
	goto	u19300

u19301:
	goto	l14532
u19300:
	line	2357
	
l14514:; BSR set to: 1

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19311
	goto	u19310

u19311:
	goto	l14520
u19310:
	line	2359
	
l14516:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1702),postinc2
	movff	(menu_handle_button@new_value_1702+1),postdec2
	line	2360
	
l14518:; BSR set to: 2

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_323)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_323)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1702),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1702+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2361
	goto	l14554
	line	2362
	
l14520:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19321
	goto	u19320

u19321:
	goto	l14526
u19320:
	line	2364
	
l14522:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1702),postinc2
	movff	(menu_handle_button@new_value_1702+1),postdec2
	line	2365
	
l14524:; BSR set to: 2

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_324)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_324)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1702),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1702+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2366
	goto	l14554
	line	2367
	
l14526:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19331
	goto	u19330

u19331:
	goto	l1301
u19330:
	line	2369
	
l14528:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1702),postinc2
	movff	(menu_handle_button@new_value_1702+1),postdec2
	line	2370
	
l14530:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_325)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_325)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1702),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1702+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l14554
	line	2373
	
l14532:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u19341
	goto	u19340

u19341:
	goto	l14554
u19340:
	
l14534:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u19351
	goto	u19350
u19351:
	goto	l14554
u19350:
	line	2375
	
l14536:; BSR set to: 1

		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19361
	goto	u19360

u19361:
	goto	l14542
u19360:
	line	2377
	
l14538:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1702),postinc2
	movff	(menu_handle_button@new_value_1702+1),postdec2
	line	2378
	
l14540:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_326)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_326)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1702),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1702+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2379
	goto	l14554
	line	2380
	
l14542:; BSR set to: 3

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19371
	goto	u19370

u19371:
	goto	l14548
u19370:
	line	2382
	
l14544:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1702),postinc2
	movff	(menu_handle_button@new_value_1702+1),postdec2
	line	2383
	
l14546:; BSR set to: 2

		movff	0+(_input_menu+01Bh),(c:sprintf@sp)
	movff	1+(_input_menu+01Bh),(c:sprintf@sp+1)

		movlw	low(STR_327)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_327)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1702),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1702+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2384
	goto	l14554
	line	2385
	
l14548:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19381
	goto	u19380

u19381:
	goto	l1301
u19380:
	line	2387
	
l14550:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+020h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+020h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1702),postinc2
	movff	(menu_handle_button@new_value_1702+1),postdec2
	line	2388
	
l14552:; BSR set to: 2

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_328)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_328)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1702),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1702+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2392
	
l14554:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	2393
	
l14556:; BSR set to: 1

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	goto	l1234
	line	2397
	
l14558:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u19391
	goto	u19390

u19391:
	goto	l1234
u19390:
	line	2399
	
l14560:; BSR set to: 1

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2400
	
l14562:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2401
	
l14564:
	asmopt push
asmopt off
movlw  3
	movlb	0	; () banked
movwf	(??_menu_handle_button+0+0+1)&0ffh
movlw	8
movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	119
u20657:
decfsz	wreg,f
	bra	u20657
	decfsz	(??_menu_handle_button+0+0)&0ffh,f
	bra	u20657
	decfsz	(??_menu_handle_button+0+0+1)&0ffh,f
	bra	u20657
asmopt pop

	line	2402
	
l14566:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1234
	line	2407
	
l14568:; BSR set to: 3

	movlb	1	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u19401
	goto	u19400

u19401:
	goto	l14850
u19400:
	line	2409
	
l14570:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19411
	goto	u19410
u19411:
	goto	l14600
u19410:
	line	2411
	
l14572:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2413
	goto	l14598
	line	2419
	
l14574:; BSR set to: 3

	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2420
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2421
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2422
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2423
	
l14576:; BSR set to: 3

	call	_menu_draw_setup	;wreg free
	line	2424
	goto	l1234
	line	2427
	
l14578:; BSR set to: 3

	call	_rebuild_utility_menu	;wreg free
	line	2428
	
l14580:; BSR set to: 3

	movlw	low(04h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2429
	
l14582:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2430
	
l14584:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2431
	
l14586:; BSR set to: 3

	call	_menu_draw_utility	;wreg free
	line	2432
	goto	l1234
	line	2438
	
l14588:; BSR set to: 3

	movlb	1	; () banked
	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u19421
	goto	u19420
u19421:
	goto	l14594
u19420:
	line	2440
	
l14590:; BSR set to: 1

	call	_save_current_config	;wreg free
	line	2441
	
l14592:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_save_pending))&0ffh
	line	2443
	
l14594:; BSR set to: 1

	movlb	2	; () banked
	setf	((_current_menu))&0ffh
	line	2444
	goto	l1234
	line	2413
	
l14598:
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
	goto	l1228
	xorlw	1^0	; case 1
	skipnz
	goto	l14574
	xorlw	2^1	; case 2
	skipnz
	goto	l14578
	xorlw	3^2	; case 3
	skipnz
	goto	l1228
	xorlw	4^3	; case 4
	skipnz
	goto	l14588
	goto	l1234

	line	2447
	
l14600:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19431
	goto	u19430

u19431:
	goto	l14750
u19430:
	line	2449
	
l14602:; BSR set to: 2

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
	bnz	u19441
movf	(??_menu_handle_button+0+1)&0ffh,w
xorwf	(??_menu_handle_button+2+1)&0ffh,w
	btfss	status,2
	goto	u19441
	goto	u19440

u19441:
	goto	l14616
u19440:
	line	2451
	
l14604:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2452
	
l14606:
	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2453
	
l14608:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2454
	
l14610:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2455
	
l14612:; BSR set to: 3

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l14576
	line	2458
	
l14616:; BSR set to: 0

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
	goto	u19451
	goto	u19450
u19451:
	goto	l1234
u19450:
	line	2460
	
l14618:; BSR set to: 3

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
	movwf	((menu_handle_button@sensor_type_1716))&0ffh
	line	2461
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
	movwf	((menu_handle_button@flow_type_1717))&0ffh
	line	2464
	
l14620:; BSR set to: 1

	movff	(menu_handle_button@sensor_type_1716),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type_1717),(c:is_numeric_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u19461
	goto	u19460
u19461:
	goto	l14678
u19460:
	line	2466
	
l14622:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val))&0ffh
	line	2469
	movf	((menu_handle_button@sensor_type_1716))&0ffh,w
	btfss	status,2
	goto	u19471
	goto	u19470
u19471:
	goto	l14640
u19470:
	line	2471
	
l14624:; BSR set to: 1

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19481
	goto	u19480

u19481:
	goto	l14628
u19480:
	line	2472
	
l14626:; BSR set to: 3

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
	goto	l14670
	line	2473
	
l14628:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19491
	goto	u19490

u19491:
	goto	l14632
u19490:
	line	2474
	
l14630:; BSR set to: 3

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
	goto	l14670
	line	2475
	
l14632:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19501
	goto	u19500

u19501:
	goto	l14636
u19500:
	line	2476
	
l14634:; BSR set to: 3

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
	goto	l14670
	line	2477
	
l14636:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19511
	goto	u19510

u19511:
	goto	l1342
u19510:
	line	2478
	
l14638:; BSR set to: 3

	movlw	high(032h)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(032h)
	movwf	((menu_handle_button@current_val))&0ffh
	goto	l14670
	line	2479
	
l1342:; BSR set to: 3

	goto	l14670
	line	2480
	
l14640:; BSR set to: 1

		decf	((menu_handle_button@sensor_type_1716))&0ffh,w
	btfss	status,2
	goto	u19521
	goto	u19520

u19521:
	goto	l14654
u19520:
	line	2482
	
l14642:; BSR set to: 1

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19531
	goto	u19530

u19531:
	goto	l14646
u19530:
	goto	l14626
	line	2484
	
l14646:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19541
	goto	u19540

u19541:
	goto	l14650
u19540:
	goto	l14630
	line	2486
	
l14650:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19551
	goto	u19550

u19551:
	goto	l1342
u19550:
	goto	l14634
	line	2489
	
l14654:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1716))&0ffh,w
	btfss	status,2
	goto	u19561
	goto	u19560

u19561:
	goto	l14670
u19560:
	
l14656:; BSR set to: 1

	movf	((menu_handle_button@flow_type_1717))&0ffh,w
	btfss	status,2
	goto	u19571
	goto	u19570
u19571:
	goto	l14670
u19570:
	line	2491
	
l14658:; BSR set to: 1

		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19581
	goto	u19580

u19581:
	goto	l14662
u19580:
	goto	l14626
	line	2493
	
l14662:; BSR set to: 3

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19591
	goto	u19590

u19591:
	goto	l14666
u19590:
	goto	l14630
	line	2495
	
l14666:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19601
	goto	u19600

u19601:
	goto	l1342
u19600:
	line	2496
	
l14668:; BSR set to: 3

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
	line	2499
	
l14670:
	movff	(menu_handle_button@current_val),(c:init_numeric_editor@value)
	movff	(menu_handle_button@current_val+1),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	2500
	
l14672:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2501
	
l14674:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l14298
	line	2505
	
l14678:
	movff	(menu_handle_button@sensor_type_1716),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type_1717),(c:is_time_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u19611
	goto	u19610
u19611:
	goto	l14724
u19610:
	line	2507
	
l14680:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val_1720+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val_1720))&0ffh
	line	2510
	movf	((menu_handle_button@sensor_type_1716))&0ffh,w
	btfss	status,2
	goto	u19621
	goto	u19620
u19621:
	goto	l14694
u19620:
	line	2512
	
l14682:; BSR set to: 1

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19631
	goto	u19630

u19631:
	goto	l14686
u19630:
	line	2513
	
l14684:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1720)
	movff	postdec2,(menu_handle_button@current_val_1720+1)
	goto	l14712
	line	2514
	
l14686:; BSR set to: 3

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19641
	goto	u19640

u19641:
	goto	l14690
u19640:
	line	2515
	
l14688:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1720)
	movff	postdec2,(menu_handle_button@current_val_1720+1)
	goto	l14712
	line	2516
	
l14690:; BSR set to: 3

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19651
	goto	u19650

u19651:
	goto	l1364
u19650:
	line	2517
	
l14692:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1720)
	movff	postdec2,(menu_handle_button@current_val_1720+1)
	goto	l14712
	line	2518
	
l1364:; BSR set to: 3

	goto	l14712
	line	2519
	
l14694:; BSR set to: 1

		decf	((menu_handle_button@sensor_type_1716))&0ffh,w
	btfss	status,2
	goto	u19661
	goto	u19660

u19661:
	goto	l14700
u19660:
	line	2521
	
l14696:; BSR set to: 1

		movlw	5
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19671
	goto	u19670

u19671:
	goto	l14712
u19670:
	goto	l14684
	line	2524
	
l14700:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1716))&0ffh,w
	btfss	status,2
	goto	u19681
	goto	u19680

u19681:
	goto	l14712
u19680:
	line	2527
	
l14702:; BSR set to: 1

	movf	((menu_handle_button@flow_type_1717))&0ffh,w
	btfss	status,2
	goto	u19691
	goto	u19690
u19691:
	goto	l14706
u19690:
	
l14704:; BSR set to: 1

		movlw	7
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u19701
	goto	u19700

u19701:
	goto	l14710
u19700:
	
l14706:
	movlb	1	; () banked
		decf	((menu_handle_button@flow_type_1717))&0ffh,w
	btfss	status,2
	goto	u19711
	goto	u19710

u19711:
	goto	l14712
u19710:
	
l14708:; BSR set to: 1

		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19721
	goto	u19720

u19721:
	goto	l14712
u19720:
	line	2528
	
l14710:; BSR set to: 3

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1720)
	movff	postdec2,(menu_handle_button@current_val_1720+1)
	line	2532
	
l14712:
		movlw	low(menu_handle_button@buf_1721)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1721)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_329)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_329)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@current_val_1720),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@current_val_1720+1),1+((c:?_sprintf)+04h)
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2533
	
l14714:
		movlw	low(menu_handle_button@buf_1721)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1721)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2535
	
l14716:
	movff	(menu_handle_button@current_val_1720),(c:init_time_editor@value_seconds)
	movff	(menu_handle_button@current_val_1720+1),(c:init_time_editor@value_seconds+1)
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	goto	l14672
	line	2541
	
l14724:
	movff	(menu_handle_button@sensor_type_1716),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type_1717),(c:is_option_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u19731
	goto	u19730
u19731:
	goto	l1228
u19730:
	line	2543
	
l14726:
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
	line	2545
	
l14728:
	movff	(menu_handle_button@sensor_type_1716),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type_1717),(c:get_option_edit_flag@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1724)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1724+1)
	line	2546
	
l14730:
	movff	(menu_handle_button@sensor_type_1716),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type_1717),(c:get_item_options_for_field@flow_type)
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1725)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1725+1)
	line	2548
	
l14732:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag_1724))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1724+1))&0ffh,w
	btfsc	status,2
	goto	u19741
	goto	u19740

u19741:
	goto	l14746
u19740:
	
l14734:; BSR set to: 1

	movf	((menu_handle_button@opts_1725))&0ffh,w
iorwf	((menu_handle_button@opts_1725+1))&0ffh,w
	btfsc	status,2
	goto	u19751
	goto	u19750

u19751:
	goto	l14746
u19750:
	line	2551
	
l14736:; BSR set to: 1

	movlw	low(0)
	movwf	((menu_handle_button@i))&0ffh
	goto	l14744
	line	2553
	
l14738:; BSR set to: 1

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
	addwf	((menu_handle_button@opts_1725))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+2+0)&0ffh
	movf	(??_menu_handle_button+0+1)&0ffh,w
	movlb	1	; () banked
	addwfc	((menu_handle_button@opts_1725+1))&0ffh,w
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
	goto	u19761
	goto	u19760

u19761:
	goto	l14742
u19760:
	line	2555
	
l14740:
	movff	(menu_handle_button@edit_flag_1724),fsr2l
	movff	(menu_handle_button@edit_flag_1724+1),fsr2h
	movff	(menu_handle_button@i),indf2

	line	2556
	goto	l14746
	line	2551
	
l14742:
	movlb	1	; () banked
	incf	((menu_handle_button@i))&0ffh
	
l14744:; BSR set to: 1

	movlw	01h
	addwf	((menu_handle_button@opts_1725))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	0
	movlb	1	; () banked
	addwfc	((menu_handle_button@opts_1725+1))&0ffh,w
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
	goto	u19771
	goto	u19770

u19771:
	goto	l14738
u19770:
	line	2561
	
l14746:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2562
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l14298
	line	2567
	
l14750:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19781
	goto	u19780

u19781:
	goto	l14784
u19780:
	line	2569
	
l14752:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2571
	
l14754:
		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19791
	goto	u19790

u19791:
	goto	l14760
u19790:
	line	2573
	
l14756:; BSR set to: 3

	movlw	low(0)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2574
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2575
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2576
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2577
	
l14758:; BSR set to: 3

	call	_menu_draw_options	;wreg free
	line	2578
	goto	l1234
	line	2579
	
l14760:; BSR set to: 3

		movlw	03h-0
	cpfslt	((_menu))&0ffh
	goto	u19801
	goto	u19800

u19801:
	goto	l14772
u19800:
	line	2581
	
l14762:; BSR set to: 3

	movf	((_menu))&0ffh,w
	
	call	_rebuild_input_menu
	line	2582
	
l14764:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2583
	
l14766:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2584
	
l14768:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2585
	
l14770:; BSR set to: 3

	call	_menu_draw_input	;wreg free
	line	2586
	goto	l1234
	line	2587
	
l14772:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19811
	goto	u19810

u19811:
	goto	l1228
u19810:
	line	2589
	
l14774:; BSR set to: 3

	call	_rebuild_clock_menu	;wreg free
	line	2590
	
l14776:
	movlw	low(03h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2591
	
l14778:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	((_menu))&0ffh
	line	2592
	
l14780:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2593
	
l14782:
	call	_menu_draw_clock	;wreg free
	goto	l1234
	line	2596
	
l14784:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u19821
	goto	u19820

u19821:
	goto	l1234
u19820:
	line	2600
	
l14786:; BSR set to: 2

		movlw	05h-1
	movlb	3	; () banked
	cpfsgt	((_menu))&0ffh
	goto	u19831
	goto	u19830

u19831:
	goto	l14790
u19830:
	
l14788:; BSR set to: 3

	movlw	high(0)
	movlb	1	; () banked
	movwf	((_menu_handle_button$1733+1))&0ffh
	movlw	low(0)
	movwf	((_menu_handle_button$1733))&0ffh
	goto	l14792
	
l14790:; BSR set to: 3

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
	movlb	1	; () banked
	movwf	((_menu_handle_button$1733))&0ffh
	clrf	((_menu_handle_button$1733+1))&0ffh
	
l14792:; BSR set to: 1

		movlw	low(menu_handle_button@buf_1731)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1731)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_330)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_330)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu_handle_button$1733),0+((c:?_sprintf)+06h)
	movff	(_menu_handle_button$1733+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	2601
	
l14794:
		movlw	low(menu_handle_button@buf_1731)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1731)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2603
		movlw	4
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19841
	goto	u19840

u19841:
	goto	l14808
u19840:
	goto	l14604
	line	2613
	
l14808:; BSR set to: 3

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
	goto	u19851
	goto	u19850
u19851:
	goto	l14848
u19850:
	line	2615
	
l14810:; BSR set to: 3

		movlw	low(STR_331)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_331)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2618
	
l14812:
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
	line	2621
	
l14814:
	movlb	3	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19861
	goto	u19860
u19861:
	goto	l14818
u19860:
	line	2623
	
l14816:; BSR set to: 3

		movff	0+(_clock_menu+02h),(c:strcmp@s1)
	movff	1+(_clock_menu+02h),(c:strcmp@s1+1)

		movlw	low(STR_332)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_332)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u19871
	goto	u19870

u19871:
	movlw	1
	goto	u19880
u19870:
	movlw	0
u19880:
	movwf	((c:_enable_edit_flag))^00h,c
	line	2624
	goto	l14840
	line	2625
	
l14818:; BSR set to: 3

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19891
	goto	u19890

u19891:
	goto	l14830
u19890:
	line	2627
	
l14820:; BSR set to: 3

		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_333)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_333)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u19901
	goto	u19900

u19901:
	goto	l14824
u19900:
	line	2628
	
l14822:
	movlw	low(0)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l14840
	line	2629
	
l14824:
		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_334)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_334)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u19911
	goto	u19910

u19911:
	goto	l14828
u19910:
	line	2630
	
l14826:
	movlw	low(01h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l14840
	line	2632
	
l14828:
	movlw	low(02h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l14840
	line	2634
	
l14830:; BSR set to: 3

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19921
	goto	u19920

u19921:
	goto	l14836
u19920:
	line	2637
	
l14832:; BSR set to: 3

	movff	0+(_system_config+07h),0+(_menu+0Dh)
	clrf	(1+(_menu+0Dh))&0ffh
	line	2638
	
l14834:; BSR set to: 3

	movff	0+(_system_config+07h),(c:init_time_editor@value_seconds)
	clrf	((c:init_time_editor@value_seconds+1))^00h,c
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	line	2639
	goto	l14840
	line	2640
	
l14836:; BSR set to: 3

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19931
	goto	u19930

u19931:
	goto	l1408
u19930:
	line	2642
	
l14838:; BSR set to: 3

		movff	0+(_clock_menu+011h),(c:strcmp@s1)
	movff	1+(_clock_menu+011h),(c:strcmp@s1+1)

		movlw	low(STR_335)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_335)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u19941
	goto	u19940

u19941:
	movlw	1
	goto	u19950
u19940:
	movlw	0
u19950:
	movwf	((c:_display_edit_flag))^00h,c
	goto	l14840
	line	2645
	
l1408:; BSR set to: 3

	
l14840:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2646
	
l14842:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2647
	
l14844:; BSR set to: 3

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l14782
	line	2654
	
l14848:; BSR set to: 3

		movlw	low(STR_336)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_336)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1234
	line	2658
	
l14850:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u19961
	goto	u19960

u19961:
	goto	l1234
u19960:
	goto	l14562
	line	2665
	
l1234:
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
	
l12250:
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
	
l12252:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	127
	
l12254:
	movlb	0	; () banked
	movf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u16001
	goto	u16000
u16001:
	goto	l152
u16000:
	line	129
	
l12256:; BSR set to: 0

	movlw	low(01h)
	movwf	((_relay_state))&0ffh	;volatile
	line	131
	movf	((trigger_relay_pulse@latch_mode))&0ffh,w
	btfsc	status,2
	goto	u16011
	goto	u16010
u16011:
	goto	l12262
u16010:
	line	134
	
l12258:; BSR set to: 0

	movlw	high(0)
	movlb	2	; () banked
	movwf	((_relay_counter+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_relay_counter))&0ffh	;volatile
	line	135
	
l12260:; BSR set to: 2

		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	136
	goto	l12268
	line	140
	
l12262:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	mullw	064h
	movff	prodl,(_relay_counter)	;volatile
	movff	prodh,(_relay_counter+1)	;volatile
	line	141
	
l12264:; BSR set to: 5

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
	
l12266:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	145
	
l12268:
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
	
l13184:
	movlw	low(0)
	movwf	((c:rebuild_utility_menu@i))^00h,c
	line	1618
	
l13190:
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
	
l13192:
	incf	((c:rebuild_utility_menu@i))^00h,c
	
l13194:
		movlw	09h-1
	cpfsgt	((c:rebuild_utility_menu@i))^00h,c
	goto	u17341
	goto	u17340

u17341:
	goto	l13190
u17340:
	line	1623
	
l13196:
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
	
l13198:; BSR set to: 4

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
	
l13200:
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
	movlb	5	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	
	call	___lbdiv
	movwf	(??_rebuild_utility_menu+0+0)^00h,c
	movf	((??_rebuild_utility_menu+0+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	5	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	
	call	___lbmod
	movwf	(??_rebuild_utility_menu+1+0)^00h,c
	movf	((??_rebuild_utility_menu+1+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1638
	
l13202:
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
	
l13204:
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
	
l13206:
	movff	0+(_system_config+012h),(c:___lwdiv@dividend)
	movff	1+(_system_config+012h),(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:_rebuild_utility_menu$3188)
	movff	1+?___lwdiv,(c:_rebuild_utility_menu$3188+1)
	
l13208:
	movff	0+(_system_config+012h),(c:___lwmod@dividend)
	movff	1+(_system_config+012h),(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movff	0+?___lwmod,(c:_rebuild_utility_menu$3189)
	movff	1+?___lwmod,(c:_rebuild_utility_menu$3189+1)
	
l13210:
		movlw	low(_value_pwr_fail)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_pwr_fail)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_279)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_279)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:_rebuild_utility_menu$3188),0+((c:?_sprintf)+04h)
	movff	(c:_rebuild_utility_menu$3188+1),1+((c:?_sprintf)+04h)
	movff	(c:_rebuild_utility_menu$3189),0+((c:?_sprintf)+06h)
	movff	(c:_rebuild_utility_menu$3189+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1644
	
l13212:
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
	
l12788:
	movff	(rebuild_input_menu@input_num),(_current_input)
	line	912
	
l12790:
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
	
l12792:; BSR set to: 0

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
	
l12794:; BSR set to: 0

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
	goto	u16941
	goto	u16940
u16941:
	goto	l12798
u16940:
	
l12796:; BSR set to: 0

		movlw	low(STR_176)
	movwf	((_rebuild_input_menu$1342))&0ffh
	movlw	high(STR_176)
	movwf	((_rebuild_input_menu$1342+1))&0ffh

	goto	l12800
	
l12798:; BSR set to: 0

		movlw	low(STR_175)
	movwf	((_rebuild_input_menu$1342))&0ffh
	movlw	high(STR_175)
	movwf	((_rebuild_input_menu$1342+1))&0ffh

	
l12800:; BSR set to: 0

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
	
l12802:
	movlb	0	; () banked
	movf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u16951
	goto	u16950
u16951:
	goto	l12908
u16950:
	line	920
	
l12804:; BSR set to: 0

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
	
l12806:
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
	
l12808:
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
	
l12810:
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
	
l12812:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3186)
	movff	1+?___lwdiv,(_rebuild_input_menu$3186+1)
	
l12814:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3187)
	movff	1+?___lwmod,(_rebuild_input_menu$3187+1)
	
l12816:
		movlw	low(_value_highbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_highbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_181)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_181)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3186),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3186+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3187),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3187+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	927
	
l12818:
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
	
l12820:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3186)
	movff	1+?___lwdiv,(_rebuild_input_menu$3186+1)
	
l12822:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3187)
	movff	1+?___lwmod,(_rebuild_input_menu$3187+1)
	
l12824:
		movlw	low(_value_plpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_plpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_183)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_183)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3186),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3186+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3187),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3187+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	933
	
l12826:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3186)
	movff	1+?___lwdiv,(_rebuild_input_menu$3186+1)
	
l12828:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3187)
	movff	1+?___lwmod,(_rebuild_input_menu$3187+1)
	
l12830:
		movlw	low(_value_slpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_slpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_184)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_184)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3186),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3186+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3187),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3187+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	936
	
l12832:
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
	goto	u16961
	goto	u16960
u16961:
	goto	l12840
u16960:
	
l12834:; BSR set to: 0

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
	goto	u16971
	goto	u16970

u16971:
	goto	l12838
u16970:
	
l12836:; BSR set to: 0

		movlw	low(STR_187)
	movwf	((_rebuild_input_menu$1357))&0ffh
	movlw	high(STR_187)
	movwf	((_rebuild_input_menu$1357+1))&0ffh

	goto	l754
	
l12838:; BSR set to: 0

		movlw	low(STR_186)
	movwf	((_rebuild_input_menu$1357))&0ffh
	movlw	high(STR_186)
	movwf	((_rebuild_input_menu$1357+1))&0ffh

	
l754:; BSR set to: 0

		movff	(_rebuild_input_menu$1357),(_rebuild_input_menu$1356)
	movff	(_rebuild_input_menu$1357+1),(_rebuild_input_menu$1356+1)

	goto	l12842
	
l12840:; BSR set to: 0

		movlw	low(STR_185)
	movwf	((_rebuild_input_menu$1356))&0ffh
	movlw	high(STR_185)
	movwf	((_rebuild_input_menu$1356+1))&0ffh

	
l12842:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1356),(c:strcpy@from)
	movff	(_rebuild_input_menu$1356+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	938
	
l12844:
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
	goto	u16981
	goto	u16980
u16981:
	goto	l12852
u16980:
	
l12846:; BSR set to: 0

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
	goto	u16991
	goto	u16990

u16991:
	goto	l12850
u16990:
	
l12848:; BSR set to: 0

		movlw	low(STR_190)
	movwf	((_rebuild_input_menu$1364))&0ffh
	movlw	high(STR_190)
	movwf	((_rebuild_input_menu$1364+1))&0ffh

	goto	l762
	
l12850:; BSR set to: 0

		movlw	low(STR_189)
	movwf	((_rebuild_input_menu$1364))&0ffh
	movlw	high(STR_189)
	movwf	((_rebuild_input_menu$1364+1))&0ffh

	
l762:; BSR set to: 0

		movff	(_rebuild_input_menu$1364),(_rebuild_input_menu$1363)
	movff	(_rebuild_input_menu$1364+1),(_rebuild_input_menu$1363+1)

	goto	l12854
	
l12852:; BSR set to: 0

		movlw	low(STR_188)
	movwf	((_rebuild_input_menu$1363))&0ffh
	movlw	high(STR_188)
	movwf	((_rebuild_input_menu$1363+1))&0ffh

	
l12854:; BSR set to: 0

		movlw	low(_value_rlyplp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyplp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1363),(c:strcpy@from)
	movff	(_rebuild_input_menu$1363+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	940
	
l12856:
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
	goto	u17001
	goto	u17000
u17001:
	goto	l12864
u17000:
	
l12858:; BSR set to: 0

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
	goto	u17011
	goto	u17010

u17011:
	goto	l12862
u17010:
	
l12860:; BSR set to: 0

		movlw	low(STR_193)
	movwf	((_rebuild_input_menu$1371))&0ffh
	movlw	high(STR_193)
	movwf	((_rebuild_input_menu$1371+1))&0ffh

	goto	l770
	
l12862:; BSR set to: 0

		movlw	low(STR_192)
	movwf	((_rebuild_input_menu$1371))&0ffh
	movlw	high(STR_192)
	movwf	((_rebuild_input_menu$1371+1))&0ffh

	
l770:; BSR set to: 0

		movff	(_rebuild_input_menu$1371),(_rebuild_input_menu$1370)
	movff	(_rebuild_input_menu$1371+1),(_rebuild_input_menu$1370+1)

	goto	l12866
	
l12864:; BSR set to: 0

		movlw	low(STR_191)
	movwf	((_rebuild_input_menu$1370))&0ffh
	movlw	high(STR_191)
	movwf	((_rebuild_input_menu$1370+1))&0ffh

	
l12866:; BSR set to: 0

		movlw	low(_value_rlyslp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyslp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1370),(c:strcpy@from)
	movff	(_rebuild_input_menu$1370+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	941
	
l12868:
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
	goto	u17021
	goto	u17020
u17021:
	goto	l12872
u17020:
	
l12870:; BSR set to: 0

		movlw	low(STR_195)
	movwf	((_rebuild_input_menu$1375))&0ffh
	movlw	high(STR_195)
	movwf	((_rebuild_input_menu$1375+1))&0ffh

	goto	l12874
	
l12872:; BSR set to: 0

		movlw	low(STR_194)
	movwf	((_rebuild_input_menu$1375))&0ffh
	movlw	high(STR_194)
	movwf	((_rebuild_input_menu$1375+1))&0ffh

	
l12874:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1375),(c:strcpy@from)
	movff	(_rebuild_input_menu$1375+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	944
	
l12876:
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
	
l12878:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	948
	
l12880:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	949
	
l12882:; BSR set to: 3

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	950
	
l12884:; BSR set to: 3

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	951
	
l12886:; BSR set to: 3

		movlw	low(_value_hi_pressure)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_hi_pressure)
	movwf	(1+(_input_menu+016h))&0ffh

	line	952
	
l12888:; BSR set to: 3

		movlw	low(_value_highbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_highbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	953
	
l12890:; BSR set to: 3

		movlw	low(_value_low_pressure)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_pressure)
	movwf	(1+(_input_menu+020h))&0ffh

	line	954
	
l12892:; BSR set to: 3

		movlw	low(_value_plpbp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_plpbp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	955
	
l12894:; BSR set to: 3

		movlw	low(_value_slpbp)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_slpbp)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	956
	
l12896:; BSR set to: 3

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	957
	
l12898:; BSR set to: 3

		movlw	low(_value_rlyplp)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_rlyplp)
	movwf	(1+(_input_menu+034h))&0ffh

	line	958
	
l12900:; BSR set to: 3

		movlw	low(_value_rlyslp)
	movwf	(0+(_input_menu+039h))&0ffh
	movlw	high(_value_rlyslp)
	movwf	(1+(_input_menu+039h))&0ffh

	line	959
	
l12902:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+03Eh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+03Eh))&0ffh

	line	960
	
l12904:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+043h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+043h))&0ffh

	line	962
	
l12906:; BSR set to: 3

	movlw	low(0Eh)
	movwf	(0+(_menu+02h))&0ffh
	line	963
	goto	l13074
	line	964
	
l12908:; BSR set to: 0

		decf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u17031
	goto	u17030

u17031:
	goto	l12966
u17030:
	line	966
	
l12910:; BSR set to: 0

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
	
l12912:
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
	
l12914:
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
	
l12916:
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
	
l12918:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3186)
	movff	1+?___lwdiv,(_rebuild_input_menu$3186+1)
	
l12920:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3187)
	movff	1+?___lwmod,(_rebuild_input_menu$3187+1)
	
l12922:
		movlw	low(_value_high_tbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_tbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_200)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_200)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3186),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3186+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3187),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3187+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	974
	
l12924:
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
	goto	u17041
	goto	u17040
u17041:
	goto	l12932
u17040:
	
l12926:; BSR set to: 0

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
	goto	u17051
	goto	u17050

u17051:
	goto	l12930
u17050:
	
l12928:; BSR set to: 0

		movlw	low(STR_203)
	movwf	((_rebuild_input_menu$1390))&0ffh
	movlw	high(STR_203)
	movwf	((_rebuild_input_menu$1390+1))&0ffh

	goto	l784
	
l12930:; BSR set to: 0

		movlw	low(STR_202)
	movwf	((_rebuild_input_menu$1390))&0ffh
	movlw	high(STR_202)
	movwf	((_rebuild_input_menu$1390+1))&0ffh

	
l784:; BSR set to: 0

		movff	(_rebuild_input_menu$1390),(_rebuild_input_menu$1389)
	movff	(_rebuild_input_menu$1390+1),(_rebuild_input_menu$1389+1)

	goto	l12934
	
l12932:; BSR set to: 0

		movlw	low(STR_201)
	movwf	((_rebuild_input_menu$1389))&0ffh
	movlw	high(STR_201)
	movwf	((_rebuild_input_menu$1389+1))&0ffh

	
l12934:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1389),(c:strcpy@from)
	movff	(_rebuild_input_menu$1389+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	975
	
l12936:
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
	goto	u17061
	goto	u17060
u17061:
	goto	l12940
u17060:
	
l12938:; BSR set to: 0

		movlw	low(STR_205)
	movwf	((_rebuild_input_menu$1394))&0ffh
	movlw	high(STR_205)
	movwf	((_rebuild_input_menu$1394+1))&0ffh

	goto	l12942
	
l12940:; BSR set to: 0

		movlw	low(STR_204)
	movwf	((_rebuild_input_menu$1394))&0ffh
	movlw	high(STR_204)
	movwf	((_rebuild_input_menu$1394+1))&0ffh

	
l12942:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1394),(c:strcpy@from)
	movff	(_rebuild_input_menu$1394+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	978
	
l12944:
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
	
l12946:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	982
	
l12948:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	983
	
l12950:; BSR set to: 3

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	984
	
l12952:; BSR set to: 3

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	985
	
l12954:; BSR set to: 3

		movlw	low(_value_high_temp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_high_temp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	986
	
l12956:; BSR set to: 3

		movlw	low(_value_high_tbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_high_tbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	987
	
l12958:; BSR set to: 3

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+020h))&0ffh

	line	988
	
l12960:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+025h))&0ffh

	line	989
	
l12962:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	991
	
l12964:; BSR set to: 3

	movlw	low(09h)
	movwf	(0+(_menu+02h))&0ffh
	line	992
	goto	l13074
	line	993
	
l12966:; BSR set to: 0

		movlw	2
	xorwf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u17071
	goto	u17070

u17071:
	goto	l13074
u17070:
	line	995
	
l12968:; BSR set to: 0

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
	
l12970:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfsc	status,2
	goto	u17081
	goto	u17080
u17081:
	goto	l12974
u17080:
	
l12972:; BSR set to: 0

		movlw	low(STR_208)
	movwf	((_rebuild_input_menu$1399))&0ffh
	movlw	high(STR_208)
	movwf	((_rebuild_input_menu$1399+1))&0ffh

	goto	l12976
	
l12974:; BSR set to: 0

		movlw	low(STR_207)
	movwf	((_rebuild_input_menu$1399))&0ffh
	movlw	high(STR_207)
	movwf	((_rebuild_input_menu$1399+1))&0ffh

	
l12976:; BSR set to: 0

		movlw	low(_value_flow_type)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_type)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1399),(c:strcpy@from)
	movff	(_rebuild_input_menu$1399+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	997
	
l12978:
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
	goto	u17091
	goto	u17090
u17091:
	goto	l12982
u17090:
	
l12980:; BSR set to: 0

		movlw	low(STR_210)
	movwf	((_rebuild_input_menu$1403))&0ffh
	movlw	high(STR_210)
	movwf	((_rebuild_input_menu$1403+1))&0ffh

	goto	l12984
	
l12982:; BSR set to: 0

		movlw	low(STR_209)
	movwf	((_rebuild_input_menu$1403))&0ffh
	movlw	high(STR_209)
	movwf	((_rebuild_input_menu$1403+1))&0ffh

	
l12984:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1403),(c:strcpy@from)
	movff	(_rebuild_input_menu$1403+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	999
	
l12986:
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
	goto	u17101
	goto	u17100
u17101:
	goto	l12994
u17100:
	
l12988:; BSR set to: 0

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
	goto	u17111
	goto	u17110

u17111:
	goto	l12992
u17110:
	
l12990:; BSR set to: 0

		movlw	low(STR_213)
	movwf	((_rebuild_input_menu$1410))&0ffh
	movlw	high(STR_213)
	movwf	((_rebuild_input_menu$1410+1))&0ffh

	goto	l806
	
l12992:; BSR set to: 0

		movlw	low(STR_212)
	movwf	((_rebuild_input_menu$1410))&0ffh
	movlw	high(STR_212)
	movwf	((_rebuild_input_menu$1410+1))&0ffh

	
l806:; BSR set to: 0

		movff	(_rebuild_input_menu$1410),(_rebuild_input_menu$1409)
	movff	(_rebuild_input_menu$1410+1),(_rebuild_input_menu$1409+1)

	goto	l12996
	
l12994:; BSR set to: 0

		movlw	low(STR_211)
	movwf	((_rebuild_input_menu$1409))&0ffh
	movlw	high(STR_211)
	movwf	((_rebuild_input_menu$1409+1))&0ffh

	
l12996:; BSR set to: 0

		movlw	low(_value_rlylow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlylow)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1409),(c:strcpy@from)
	movff	(_rebuild_input_menu$1409+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1001
	
l12998:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfss	status,2
	goto	u17121
	goto	u17120
u17121:
	goto	l13046
u17120:
	line	1003
	
l13000:; BSR set to: 0

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
	goto	u17131
	goto	u17130
u17131:
	goto	l13004
u17130:
	
l13002:; BSR set to: 0

		movlw	low(STR_215)
	movwf	((_rebuild_input_menu$1414))&0ffh
	movlw	high(STR_215)
	movwf	((_rebuild_input_menu$1414+1))&0ffh

	goto	l13006
	
l13004:; BSR set to: 0

		movlw	low(STR_214)
	movwf	((_rebuild_input_menu$1414))&0ffh
	movlw	high(STR_214)
	movwf	((_rebuild_input_menu$1414+1))&0ffh

	
l13006:; BSR set to: 0

		movlw	low(_value_flow_units)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_units)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1414),(c:strcpy@from)
	movff	(_rebuild_input_menu$1414+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1004
	
l13008:
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
	
l13010:
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
	
l13012:
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
	
l13014:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3186)
	movff	1+?___lwdiv,(_rebuild_input_menu$3186+1)
	
l13016:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3187)
	movff	1+?___lwmod,(_rebuild_input_menu$3187+1)
	
l13018:
		movlw	low(_value_low_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_219)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_219)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3186),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3186+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3187),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3187+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1012
	
l13020:
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
	
l13022:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	1016
	
l13024:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	1017
	
l13026:; BSR set to: 3

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	1018
	
l13028:; BSR set to: 3

		movlw	low(_value_flow_units)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_flow_units)
	movwf	(1+(_input_menu+011h))&0ffh

	line	1019
	
l13030:; BSR set to: 3

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+016h))&0ffh

	line	1020
	
l13032:; BSR set to: 3

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	1021
	
l13034:; BSR set to: 3

		movlw	low(_value_low_flow)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_flow)
	movwf	(1+(_input_menu+020h))&0ffh

	line	1022
	
l13036:; BSR set to: 3

		movlw	low(_value_low_flow_bp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_low_flow_bp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	1023
	
l13038:; BSR set to: 3

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	1024
	
l13040:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	1025
	
l13042:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+034h))&0ffh

	line	1027
	
l13044:; BSR set to: 3

	movlw	low(0Bh)
	movwf	(0+(_menu+02h))&0ffh
	line	1028
	goto	l13074
	line	1031
	
l13046:; BSR set to: 0

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
	
l13048:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3186)
	movff	1+?___lwdiv,(_rebuild_input_menu$3186+1)
	
l13050:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3187)
	movff	1+?___lwmod,(_rebuild_input_menu$3187+1)
	
l13052:
		movlw	low(_value_no_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_no_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_221)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_221)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3186),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3186+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3187),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3187+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1037
	
l13054:
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
	
l13056:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	1041
	
l13058:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	1042
	
l13060:; BSR set to: 3

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	1043
	
l13062:; BSR set to: 3

		movlw	low(_value_no_flow)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_no_flow)
	movwf	(1+(_input_menu+011h))&0ffh

	line	1044
	
l13064:; BSR set to: 3

		movlw	low(_value_no_flow_bp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_no_flow_bp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	1045
	
l13066:; BSR set to: 3

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	1046
	
l13068:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+020h))&0ffh

	line	1047
	
l13070:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+025h))&0ffh

	line	1049
	
l13072:; BSR set to: 3

	movlw	low(08h)
	movwf	(0+(_menu+02h))&0ffh
	line	1056
	
l13074:
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
	
l13076:
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
	
l13134:; BSR set to: 3

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
	
l13136:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1578
	
l13138:
	movlb	5	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u17311
	goto	u17310
u17311:
	goto	l13142
u17310:
	
l13140:; BSR set to: 5

		movlw	low(STR_263)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1560))&0ffh
	movlw	high(STR_263)
	movwf	((_rebuild_clock_menu$1560+1))&0ffh

	goto	l13144
	
l13142:; BSR set to: 5

		movlw	low(STR_262)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1560))&0ffh
	movlw	high(STR_262)
	movwf	((_rebuild_clock_menu$1560+1))&0ffh

	
l13144:; BSR set to: 0

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
	
l13146:
	movlb	5	; () banked
	movf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u17321
	goto	u17320
u17321:
	goto	l13154
u17320:
	
l13148:; BSR set to: 5

		decf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u17331
	goto	u17330

u17331:
	goto	l13152
u17330:
	
l13150:; BSR set to: 5

		movlw	low(STR_266)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1567))&0ffh
	movlw	high(STR_266)
	movwf	((_rebuild_clock_menu$1567+1))&0ffh

	goto	l1070
	
l13152:; BSR set to: 5

		movlw	low(STR_265)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1567))&0ffh
	movlw	high(STR_265)
	movwf	((_rebuild_clock_menu$1567+1))&0ffh

	
l1070:; BSR set to: 0

		movff	(_rebuild_clock_menu$1567),(_rebuild_clock_menu$1566)
	movff	(_rebuild_clock_menu$1567+1),(_rebuild_clock_menu$1566+1)

	goto	l13156
	
l13154:; BSR set to: 5

		movlw	low(STR_264)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1566))&0ffh
	movlw	high(STR_264)
	movwf	((_rebuild_clock_menu$1566+1))&0ffh

	
l13156:; BSR set to: 0

		movlw	low(_value_end_runtime)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_end_runtime)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_clock_menu$1566),(c:strcpy@from)
	movff	(_rebuild_clock_menu$1566+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1585
	
l13158:
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
	line	1587
	
l13160:
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
	
l13162:
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
	
l13164:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1593
	
l13166:
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
	
l13168:
		movlw	low(_value_clock_enable)
	movlb	3	; () banked
	movwf	(0+(_clock_menu+02h))&0ffh
	movlw	high(_value_clock_enable)
	movwf	(1+(_clock_menu+02h))&0ffh

	line	1597
	
l13170:; BSR set to: 3

		movlw	low(_value_end_runtime)
	movwf	(0+(_clock_menu+07h))&0ffh
	movlw	high(_value_end_runtime)
	movwf	(1+(_clock_menu+07h))&0ffh

	line	1598
	
l13172:; BSR set to: 3

		movlw	low(_value_relay_pulse)
	movwf	(0+(_clock_menu+0Ch))&0ffh
	movlw	high(_value_relay_pulse)
	movwf	(1+(_clock_menu+0Ch))&0ffh

	line	1599
	
l13174:; BSR set to: 3

		movlw	low(_value_clock_display)
	movwf	(0+(_clock_menu+011h))&0ffh
	movlw	high(_value_clock_display)
	movwf	(1+(_clock_menu+011h))&0ffh

	line	1600
	
l13176:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_clock_menu+016h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_clock_menu+016h))&0ffh

	line	1602
	
l13178:; BSR set to: 3

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	1604
	
l13180:; BSR set to: 3

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
	
l13182:
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
	
l12490:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u16491
	goto	u16490
u16491:
	goto	l12494
u16490:
	goto	l641
	line	553
	
l12494:; BSR set to: 3

	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u16501
	goto	u16500
u16501:
	goto	l12500
u16500:
	
l12496:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u16511
	goto	u16510
u16511:
	goto	l12500
u16510:
	line	555
	
l12498:; BSR set to: 3

	movlw	low(020h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	556
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	557
	goto	l12502
	line	560
	
l12500:; BSR set to: 3

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
	
l12502:; BSR set to: 0

	movlw	low(03Ah)
	movwf	(0+(menu_update_time_value@value_buf+02h))&0ffh
	line	568
	
l12504:; BSR set to: 0

	movlb	3	; () banked
		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u16521
	goto	u16520

u16521:
	goto	l12510
u16520:
	
l12506:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u16531
	goto	u16530
u16531:
	goto	l12510
u16530:
	line	570
	
l12508:; BSR set to: 3

	movlw	low(020h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	571
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	572
	goto	l12512
	line	575
	
l12510:; BSR set to: 3

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
	
l12512:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(menu_update_time_value@value_buf+05h))&0ffh
	line	582
	
l12514:; BSR set to: 0

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u16541
	goto	u16540

u16541:
	goto	l12522
u16540:
	
l12516:; BSR set to: 2

		movlw	2
	movlb	3	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16551
	goto	u16550

u16551:
	goto	l12522
u16550:
	line	584
	
l12518:; BSR set to: 3

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
	
l12522:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u16561
	goto	u16560

u16561:
	goto	l12526
u16560:
	goto	l641
	line	594
	
l12526:; BSR set to: 2

	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_time_value@screen_line))&0ffh
	line	595
		movlw	03h-1
	cpfsgt	((menu_update_time_value@screen_line))&0ffh
	goto	u16571
	goto	u16570

u16571:
	goto	l648
u16570:
	goto	l641
	line	596
	
l648:; BSR set to: 0

	line	598
	movff	(_menu),(menu_update_time_value@item_idx)
	line	602
	
l12530:; BSR set to: 0

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
	
l12532:; BSR set to: 0

	movff	(menu_update_time_value@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_update_time_value@flow_type),(c:is_time_field@flow_type)
	movf	((menu_update_time_value@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfss	status,2
	goto	u16581
	goto	u16580
u16581:
	goto	l12536
u16580:
	goto	l641
	line	612
	
l12536:
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
	
l12538:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	617
	
l12540:
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
	
l12542:
	line	623
	
l12544:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	624
	
l12546:
		movlw	low(STR_148)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_148)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	626
	
l12548:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	627
	
l12550:
		movlw	low(STR_149)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_149)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	628
	
l12552:
		movlw	low(menu_update_time_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	629
	
l12554:
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
	
l11652:
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
	
l11654:
	movlw	low(0)
	movwf	((c:menu_draw_clock@i))^00h,c
	goto	l11734
	line	1659
	
l11656:; BSR set to: 3

	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_clock@i))^00h,c,w
	movwf	((c:menu_draw_clock@item_idx))^00h,c
	line	1660
	
l11658:; BSR set to: 3

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1663
	
l11660:
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
	
l11662:
	line	1669
	
l11664:
	movf	((c:menu_draw_clock@item_idx))^00h,c,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14901
	goto	u14900

u14901:
	goto	l11694
u14900:
	line	1671
	
l11666:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u14911
	goto	u14910
u14911:
	goto	l11690
u14910:
	line	1673
	
l11668:; BSR set to: 3

	movlw	low(02h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	line	1676
	
l11670:; BSR set to: 3

		movlw	2
	xorwf	((c:menu_draw_clock@item_idx))^00h,c,w
	btfsc	status,2
	goto	u14921
	goto	u14920

u14921:
	goto	l11674
u14920:
	line	1678
	
l11672:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14931
	goto	u14930
u14931:
	goto	l11676
u14930:
	line	1681
	
l11674:; BSR set to: 3

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
	goto	l11698
	line	1686
	
l11676:; BSR set to: 3

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
	
l11678:
	movlw	low(0)
	movwf	((c:menu_draw_clock@j))^00h,c
	goto	l11684
	line	1688
	
l11680:
	movf	((c:menu_draw_clock@j))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1687
	
l11682:
	incf	((c:menu_draw_clock@j))^00h,c
	
l11684:
		movf	((c:menu_draw_clock@val_len))^00h,c,w
	subwf	((c:menu_draw_clock@j))^00h,c,w
	btfss	status,0
	goto	u14941
	goto	u14940

u14941:
	goto	l11680
u14940:
	line	1689
	
l11686:
	movf	((c:menu_draw_clock@val_len))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l11698
	line	1701
	
l11690:; BSR set to: 3

	movlw	low(01h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l11674
	line	1708
	
l11694:; BSR set to: 3

	movlw	low(0)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l11674
	line	1713
	
l11698:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_clock@val_len_1598))^00h,c
	line	1715
	
l11700:
	movf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfss	status,2
	goto	u14951
	goto	u14950
u14951:
	goto	l11706
u14950:
	line	1718
	
l11702:
	movf	((c:menu_draw_clock@val_len_1598))^00h,c,w
	btfsc	status,2
	goto	u14961
	goto	u14960
u14961:
	goto	l11732
u14960:
	line	1719
	
l11704:
	movf	((c:menu_draw_clock@val_len_1598))^00h,c,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_print_at
	goto	l11732
	line	1724
	
l11706:
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
	
l11708:
	movf	((c:menu_draw_clock@actual_len))^00h,c,w
	sublw	low(012h)
	movwf	((c:menu_draw_clock@start_pos))^00h,c
	line	1727
	
l11710:
	movff	(c:menu_draw_clock@start_pos),(c:lcd_set_cursor@col)
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1728
	
l11712:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u14971
	goto	u14970

u14971:
	goto	l11716
u14970:
	
l11714:
		movlw	low(STR_282)
	movwf	((c:_menu_draw_clock$1604))^00h,c
	movlw	high(STR_282)
	movwf	((c:_menu_draw_clock$1604+1))^00h,c

	goto	l11718
	
l11716:
		movlw	low(STR_281)
	movwf	((c:_menu_draw_clock$1604))^00h,c
	movlw	high(STR_281)
	movwf	((c:_menu_draw_clock$1604+1))^00h,c

	
l11718:
		movff	(c:_menu_draw_clock$1604),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1604+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1731
	
l11720:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1733
	
l11722:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1734
	
l11724:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u14981
	goto	u14980

u14981:
	goto	l11728
u14980:
	
l11726:
		movlw	low(STR_284)
	movwf	((c:_menu_draw_clock$1608))^00h,c
	movlw	high(STR_284)
	movwf	((c:_menu_draw_clock$1608+1))^00h,c

	goto	l11730
	
l11728:
		movlw	low(STR_283)
	movwf	((c:_menu_draw_clock$1608))^00h,c
	movlw	high(STR_283)
	movwf	((c:_menu_draw_clock$1608+1))^00h,c

	
l11730:
		movff	(c:_menu_draw_clock$1608),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1608+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1657
	
l11732:
	incf	((c:menu_draw_clock@i))^00h,c
	
l11734:
		movlw	03h-0
	cpfslt	((c:menu_draw_clock@i))^00h,c
	goto	u14991
	goto	u14990

u14991:
	goto	l1108
u14990:
	
l11736:
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
	goto	u15001
	goto	u15000

u15001:
	goto	l11656
u15000:
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
;;		On entry : 0/5
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
	
l12234:
	movlw	low(08h)
	movwf	((c:___lbmod@counter))^00h,c
	line	10
	movlw	low(0)
	movwf	((c:___lbmod@rem))^00h,c
	line	12
	
l12236:
	bcf	status,0
	rlcf	((c:___lbmod@dividend))^00h,c,w
	rlcf	((c:___lbmod@rem))^00h,c,w
	movwf	((c:___lbmod@rem))^00h,c
	line	13
	
l12238:
	bcf status,0
	rlcf	((c:___lbmod@dividend))^00h,c

	line	14
	
l12240:
		movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c,w
	btfss	status,0
	goto	u15991
	goto	u15990

u15991:
	goto	l12244
u15990:
	line	15
	
l12242:
	movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c
	line	16
	
l12244:
	decfsz	((c:___lbmod@counter))^00h,c
	
	goto	l12236
	line	17
	
l12246:
	movf	((c:___lbmod@rem))^00h,c,w
	line	18
	
l2224:
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
;;		On entry : 0/5
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
	
l12208:
	movlw	low(0)
	movwf	((c:___lbdiv@quotient))^00h,c
	line	10
	
l12210:
	movf	((c:___lbdiv@divisor))^00h,c,w
	btfsc	status,2
	goto	u15961
	goto	u15960
u15961:
	goto	l12230
u15960:
	line	11
	
l12212:
	movlw	low(01h)
	movwf	((c:___lbdiv@counter))^00h,c
	line	12
	goto	l12218
	line	13
	
l12214:
	bcf status,0
	rlcf	((c:___lbdiv@divisor))^00h,c

	line	14
	
l12216:
	incf	((c:___lbdiv@counter))^00h,c
	line	12
	
l12218:
	
	btfss	((c:___lbdiv@divisor))^00h,c,(7)&7
	goto	u15971
	goto	u15970
u15971:
	goto	l12214
u15970:
	line	17
	
l12220:
	bcf status,0
	rlcf	((c:___lbdiv@quotient))^00h,c

	line	18
		movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c,w
	btfss	status,0
	goto	u15981
	goto	u15980

u15981:
	goto	l12226
u15980:
	line	19
	
l12222:
	movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c
	line	20
	
l12224:
	bsf	(0+(0/8)+(c:___lbdiv@quotient))^00h,c,(0)&7
	line	22
	
l12226:
	bcf status,0
	rrcf	((c:___lbdiv@divisor))^00h,c

	line	23
	
l12228:
	decfsz	((c:___lbdiv@counter))^00h,c
	
	goto	l12220
	line	25
	
l12230:
	movf	((c:___lbdiv@quotient))^00h,c,w
	line	26
	
l2218:
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
;;  j               1   28[BANK0 ] unsigned char 
;;  len             1   27[BANK0 ] unsigned char 
;;  start_pos       1   20[BANK0 ] unsigned char 
;;  value_buf      15    5[BANK0 ] unsigned char [15]
;;  show_bracket    1   30[BANK0 ] unsigned char 
;;  val_len         1   29[BANK0 ] unsigned char 
;;  item_idx        1   31[BANK0 ] unsigned char 
;;  i               1   32[BANK0 ] unsigned char 
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
;;      Locals:         0      28       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0      33       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       33 bytes
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
	
l13214:; BSR set to: 3

	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1748
	
l13216:
	movlb	3	; () banked
	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u17351
	goto	u17350
u17351:
	goto	l13240
u17350:
	line	1750
	
l13218:; BSR set to: 3

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
	
l13220:
	movlb	3	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17361
	goto	u17360
u17361:
	goto	l13224
u17360:
	line	1755
	
l13222:; BSR set to: 3

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
	
l13224:; BSR set to: 3

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
	
l13226:
	movlb	3	; () banked
		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17371
	goto	u17370

u17371:
	goto	l13230
u17370:
	line	1762
	
l13228:; BSR set to: 3

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
	
l13230:; BSR set to: 3

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
	
l13232:
		movlw	2
	movlb	3	; () banked
	xorwf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17381
	goto	u17380

u17381:
	goto	l13236
u17380:
	line	1769
	
l13234:; BSR set to: 3

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
	
l13236:; BSR set to: 3

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
	
l13240:; BSR set to: 3

	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17391
	goto	u17390
u17391:
	goto	l13254
u17390:
	
l13242:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17401
	goto	u17400
u17401:
	goto	l13254
u17400:
	line	1780
	
l13244:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_292)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_292)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1782
	
l13246:
	call	_menu_update_datetime_display	;wreg free
	line	1785
	
l13248:
	movlw	(03h)&0ffh
	
	call	_lcd_clear_line
	line	1786
	
l13250:
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
	
l13254:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_294)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_294)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1794
	
l13256:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_utility@i))&0ffh
	goto	l13340
	line	1796
	
l13258:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_utility@i))&0ffh,w
	movwf	((menu_draw_utility@item_idx))&0ffh
	line	1797
	
l13260:; BSR set to: 0

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1800
	
l13262:
	movlw	low(0)
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
	line	1803
	
l13264:
		movlw	8
	movlb	0	; () banked
	xorwf	((menu_draw_utility@item_idx))&0ffh,w
	btfss	status,2
	goto	u17411
	goto	u17410

u17411:
	goto	l13268
u17410:
	goto	l13338
	line	1807
	
l13268:; BSR set to: 0

	movf	((menu_draw_utility@item_idx))&0ffh,w
	btfss	status,2
	goto	u17421
	goto	u17420
u17421:
	goto	l13278
u17420:
	line	1809
	
l13270:; BSR set to: 0

	movf	((menu_draw_utility@item_idx))&0ffh,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17431
	goto	u17430

u17431:
	goto	l13338
u17430:
	line	1811
	
l13272:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_295)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_295)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1812
	
l13274:
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
	line	1813
	
l13276:
	movlw	low(0Ah)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_296)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_296)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	goto	l13338
	line	1819
	
l13278:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_utility@show_brackets))&0ffh
	line	1821
	
l13280:; BSR set to: 0

	movf	((menu_draw_utility@item_idx))&0ffh,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17441
	goto	u17440

u17441:
	goto	l13304
u17440:
	line	1823
	
l13282:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u17451
	goto	u17450
u17451:
	goto	l13286
u17450:
	
l13284:; BSR set to: 3

	movlw	high(01h)
	movlb	0	; () banked
	movwf	((_menu_draw_utility$1627+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_draw_utility$1627))&0ffh
	goto	l13288
	
l13286:; BSR set to: 3

	movlw	high(02h)
	movlb	0	; () banked
	movwf	((_menu_draw_utility$1627+1))&0ffh
	movlw	low(02h)
	movwf	((_menu_draw_utility$1627))&0ffh
	
l13288:; BSR set to: 0

	movff	(_menu_draw_utility$1627),(menu_draw_utility@show_brackets)
	line	1825
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17461
	goto	u17460
u17461:
	goto	l13304
u17460:
	
l13290:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17471
	goto	u17470
u17471:
	goto	l13304
u17470:
	line	1827
	
l13292:; BSR set to: 3

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
	line	1828
	
l13294:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_utility@j))&0ffh
	goto	l13300
	line	1829
	
l13296:; BSR set to: 0

	movf	((menu_draw_utility@j))&0ffh,w
	addlw	low(menu_draw_utility@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1828
	
l13298:; BSR set to: 0

	incf	((menu_draw_utility@j))&0ffh
	
l13300:; BSR set to: 0

		movf	((menu_draw_utility@len))&0ffh,w
	subwf	((menu_draw_utility@j))&0ffh,w
	btfss	status,0
	goto	u17481
	goto	u17480

u17481:
	goto	l13296
u17480:
	line	1830
	
l13302:; BSR set to: 0

	movf	((menu_draw_utility@len))&0ffh,w
	addlw	low(menu_draw_utility@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1831
	goto	l1137
	line	1834
	
l13304:; BSR set to: 3

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
	line	1840
	
l1137:
	line	1842
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
	line	1844
	
l13308:; BSR set to: 0

	movf	((menu_draw_utility@show_brackets))&0ffh,w
	btfss	status,2
	goto	u17491
	goto	u17490
u17491:
	goto	l13314
u17490:
	line	1846
	
l13310:; BSR set to: 0

	movf	((menu_draw_utility@val_len))&0ffh,w
	btfsc	status,2
	goto	u17501
	goto	u17500
u17501:
	goto	l13338
u17500:
	line	1847
	
l13312:; BSR set to: 0

	movf	((menu_draw_utility@val_len))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_utility@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	goto	l13338
	line	1851
	
l13314:; BSR set to: 0

	movf	((menu_draw_utility@val_len))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_utility@start_pos))&0ffh
	line	1852
	
l13316:; BSR set to: 0

	movff	(menu_draw_utility@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1853
	
l13318:
	movlb	0	; () banked
		decf	((menu_draw_utility@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u17511
	goto	u17510

u17511:
	goto	l13322
u17510:
	
l13320:; BSR set to: 0

		movlw	low(STR_298)
	movwf	((_menu_draw_utility$1635))&0ffh
	movlw	high(STR_298)
	movwf	((_menu_draw_utility$1635+1))&0ffh

	goto	l13324
	
l13322:; BSR set to: 0

		movlw	low(STR_297)
	movwf	((_menu_draw_utility$1635))&0ffh
	movlw	high(STR_297)
	movwf	((_menu_draw_utility$1635+1))&0ffh

	
l13324:; BSR set to: 0

		movff	(_menu_draw_utility$1635),(c:lcd_print@str)
	movff	(_menu_draw_utility$1635+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1854
	
l13326:
		movlw	low(menu_draw_utility@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1855
	
l13328:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1856
	
l13330:
	movlb	0	; () banked
		decf	((menu_draw_utility@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u17521
	goto	u17520

u17521:
	goto	l13334
u17520:
	
l13332:; BSR set to: 0

		movlw	low(STR_300)
	movwf	((_menu_draw_utility$1639))&0ffh
	movlw	high(STR_300)
	movwf	((_menu_draw_utility$1639+1))&0ffh

	goto	l13336
	
l13334:; BSR set to: 0

		movlw	low(STR_299)
	movwf	((_menu_draw_utility$1639))&0ffh
	movlw	high(STR_299)
	movwf	((_menu_draw_utility$1639+1))&0ffh

	
l13336:; BSR set to: 0

		movff	(_menu_draw_utility$1639),(c:lcd_print@str)
	movff	(_menu_draw_utility$1639+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1794
	
l13338:
	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh
	
l13340:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_utility@i))&0ffh
	goto	u17531
	goto	u17530

u17531:
	goto	l1118
u17530:
	
l13342:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+02h))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_draw_utility+0+0)&0ffh
	clrf	(??_menu_draw_utility+0+0+1)&0ffh

	movf	((menu_draw_utility@i))&0ffh,w
	movff	0+(_menu+01h),??_menu_draw_utility+2+0
	clrf	(??_menu_draw_utility+2+0+1)&0ffh
	addwf	(??_menu_draw_utility+2+0)&0ffh
	movlw	0
	addwfc	(??_menu_draw_utility+2+1)&0ffh
		movf	(??_menu_draw_utility+0+0)&0ffh,w
	subwf	(??_menu_draw_utility+2+0)&0ffh,w
	movf	(??_menu_draw_utility+2+1)&0ffh,w
	xorlw	80h
	movwf	(??_menu_draw_utility+4+0)&0ffh
	movf	(??_menu_draw_utility+0+1)&0ffh,w
	xorlw	80h
	subwfb	(??_menu_draw_utility+4+0)&0ffh,w
	btfss	status,0
	goto	u17541
	goto	u17540

u17541:
	goto	l13258
u17540:
	line	1860
	
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
	
l12012:
	movlb	3	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u15591
	goto	u15590
u15591:
	goto	l12036
u15590:
	
l12014:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15601
	goto	u15600
u15601:
	goto	l12036
u15600:
	line	795
	
l12016:; BSR set to: 3

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u15611
	goto	u15610
u15611:
	goto	l12022
u15610:
	
l12018:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u15621
	goto	u15620
u15621:
	goto	l12022
u15620:
	line	796
	
l12020:; BSR set to: 3

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
	goto	l12038
	line	797
	
l12022:; BSR set to: 3

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u15631
	goto	u15630

u15631:
	goto	l12028
u15630:
	
l12024:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u15641
	goto	u15640
u15641:
	goto	l12028
u15640:
	line	798
	
l12026:; BSR set to: 3

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
	goto	l12038
	line	799
	
l12028:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u15651
	goto	u15650

u15651:
	goto	l12034
u15650:
	
l12030:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u15661
	goto	u15660
u15661:
	goto	l12034
u15660:
	line	800
	
l12032:; BSR set to: 3

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
	goto	l12038
	line	802
	
l12034:; BSR set to: 3

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
	goto	l12038
	line	806
	
l12036:; BSR set to: 3

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
	
l12038:
	movlb	3	; () banked
		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u15671
	goto	u15670

u15671:
	goto	l12062
u15670:
	
l12040:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15681
	goto	u15680
u15681:
	goto	l12062
u15680:
	line	812
	
l12042:; BSR set to: 3

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u15691
	goto	u15690
u15691:
	goto	l12048
u15690:
	
l12044:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u15701
	goto	u15700
u15701:
	goto	l12048
u15700:
	line	813
	
l12046:; BSR set to: 3

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
	goto	l12064
	line	814
	
l12048:; BSR set to: 3

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u15711
	goto	u15710

u15711:
	goto	l12054
u15710:
	
l12050:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u15721
	goto	u15720
u15721:
	goto	l12054
u15720:
	line	815
	
l12052:; BSR set to: 3

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
	goto	l12064
	line	816
	
l12054:; BSR set to: 3

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u15731
	goto	u15730

u15731:
	goto	l12060
u15730:
	
l12056:; BSR set to: 3

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u15741
	goto	u15740
u15741:
	goto	l12060
u15740:
	line	817
	
l12058:; BSR set to: 3

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
	goto	l12064
	line	819
	
l12060:; BSR set to: 3

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
	goto	l12064
	line	823
	
l12062:; BSR set to: 3

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
	
l12064:
	movlw	(01h)&0ffh
	
	call	_lcd_clear_line
	line	828
	
l12066:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_163)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_163)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	829
	
l12068:
	movlb	3	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u15751
	goto	u15750
u15751:
	goto	l12076
u15750:
	line	831
	
l12070:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15761
	goto	u15760
u15761:
	goto	l12074
u15760:
	line	833
	
l12072:; BSR set to: 3

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
	
l12074:; BSR set to: 3

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
	
l12076:; BSR set to: 3

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
	
l12078:
	movlb	3	; () banked
		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u15771
	goto	u15770

u15771:
	goto	l12086
u15770:
	line	854
	
l12080:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15781
	goto	u15780
u15781:
	goto	l12084
u15780:
	line	856
	
l12082:; BSR set to: 3

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
	
l12084:; BSR set to: 3

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
	
l12086:; BSR set to: 3

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
	
l12674:
	call	_lcd_clear	;wreg free
	line	1494
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1495
	
l12676:
		movlw	low(STR_243)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_243)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1498
	
l12678:
	lfsr	2,(menu_draw_setup@F2710)
	lfsr	1,(menu_draw_setup@setup_labels)
	movlw	10-1
u16811:
	movff	plusw2,plusw1
	decf	wreg
	bc	u16811

	line	1501
	
l12680:
	movlw	low(0)
	movwf	((c:menu_draw_setup@i))^00h,c
	line	1503
	
l12686:
	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_setup@i))^00h,c,w
	movwf	((c:menu_draw_setup@item_idx))^00h,c
	line	1504
		movlw	05h-1
	cpfsgt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u16821
	goto	u16820

u16821:
	goto	l12690
u16820:
	goto	l1054
	line	1507
	
l12690:; BSR set to: 3

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1510
	
l12692:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u16831
	goto	u16830

u16831:
	goto	l12726
u16830:
	line	1512
	
l12694:
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
	
l12696:
	movf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u16841
	goto	u16840
u16841:
	goto	l12704
u16840:
	
l12698:
		decf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u16851
	goto	u16850

u16851:
	goto	l12702
u16850:
	
l12700:
		movlw	low(STR_251)
	movwf	((c:_menu_draw_setup$1537))^00h,c
	movlw	high(STR_251)
	movwf	((c:_menu_draw_setup$1537+1))^00h,c

	goto	l1037
	
l12702:
		movlw	low(STR_250)
	movwf	((c:_menu_draw_setup$1537))^00h,c
	movlw	high(STR_250)
	movwf	((c:_menu_draw_setup$1537+1))^00h,c

	
l1037:
		movff	(c:_menu_draw_setup$1537),(c:menu_draw_setup@sensor_name)
	movff	(c:_menu_draw_setup$1537+1),(c:menu_draw_setup@sensor_name+1)

	goto	l1033
	
l12704:
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
	goto	u16861
	goto	u16860

u16861:
	goto	l12714
u16860:
	line	1520
	
l12706:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1521
	
l12708:
		movlw	low(STR_252)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_252)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1522
	
l12710:
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1523
	
l12712:
		movlw	low(STR_253)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_253)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1524
	goto	l12716
	line	1528
	
l12714:; BSR set to: 3

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1532
	
l12716:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1533
	
l12718:
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
	goto	u16871
	goto	u16870
u16871:
	goto	l12722
u16870:
	
l12720:
		movlw	low(STR_255)
	movwf	((c:_menu_draw_setup$1543))^00h,c
	movlw	high(STR_255)
	movwf	((c:_menu_draw_setup$1543+1))^00h,c

	goto	l12724
	
l12722:
		movlw	low(STR_254)
	movwf	((c:_menu_draw_setup$1543))^00h,c
	movlw	high(STR_254)
	movwf	((c:_menu_draw_setup$1543+1))^00h,c

	
l12724:
		movff	(c:_menu_draw_setup$1543),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1543+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1534
	goto	l12752
	line	1538
	
l12726:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_labels)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:menu_draw_setup@label)
	movff	postdec2,(c:menu_draw_setup@label+1)
	line	1540
	
l12728:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16881
	goto	u16880

u16881:
	goto	l12738
u16880:
	line	1543
	
l12730:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1544
	
l12732:
		movlw	low(STR_256)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_256)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1545
	
l12734:
		movff	(c:menu_draw_setup@label),(c:lcd_print@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1546
	
l12736:
		movlw	low(STR_257)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_257)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1547
	goto	l12740
	line	1551
	
l12738:; BSR set to: 3

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@label),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1555
	
l12740:
		movlw	3
	xorwf	((c:menu_draw_setup@item_idx))^00h,c,w
	btfss	status,2
	goto	u16891
	goto	u16890

u16891:
	goto	l12752
u16890:
	line	1558
	
l12742:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1559
	
l12744:
	movlb	5	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u16901
	goto	u16900
u16901:
	goto	l12748
u16900:
	
l12746:; BSR set to: 5

		movlw	low(STR_259)
	movwf	((c:_menu_draw_setup$1551))^00h,c
	movlw	high(STR_259)
	movwf	((c:_menu_draw_setup$1551+1))^00h,c

	goto	l12750
	
l12748:; BSR set to: 5

		movlw	low(STR_258)
	movwf	((c:_menu_draw_setup$1551))^00h,c
	movlw	high(STR_258)
	movwf	((c:_menu_draw_setup$1551+1))^00h,c

	
l12750:; BSR set to: 5

		movff	(c:_menu_draw_setup$1551),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1551+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1501
	
l12752:
	incf	((c:menu_draw_setup@i))^00h,c
	
l12754:
		movlw	03h-1
	cpfsgt	((c:menu_draw_setup@i))^00h,c
	goto	u16911
	goto	u16910

u16911:
	goto	l12686
u16910:
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
	
l12278:
	call	_lcd_clear	;wreg free
	line	1333
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1334
	
l12280:
		movlw	low(STR_233)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_233)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1337
	
l12282:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	line	1339
	
l12288:
	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_options@i))^00h,c,w
	movwf	((c:menu_draw_options@item_index))^00h,c
	line	1340
		movlw	05h-1
	cpfsgt	((c:menu_draw_options@item_index))^00h,c
	goto	u16031
	goto	u16030

u16031:
	goto	l12292
u16030:
	goto	l978
	line	1343
	
l12292:; BSR set to: 3

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1346
	
l12294:
	movf	((c:menu_draw_options@item_index))^00h,c,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16041
	goto	u16040

u16041:
	goto	l12304
u16040:
	line	1348
	
l12296:; BSR set to: 3

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1349
	
l12298:
		movlw	low(STR_234)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_234)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1350
	
l12300:
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
	
l12302:
		movlw	low(STR_235)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_235)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1352
	goto	l12306
	line	1356
	
l12304:; BSR set to: 3

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
	
l12306:
	incf	((c:menu_draw_options@i))^00h,c
	
l12308:
		movlw	03h-1
	cpfsgt	((c:menu_draw_options@i))^00h,c
	goto	u16051
	goto	u16050

u16051:
	goto	l12288
u16050:
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
	
l11546:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	168
	
l11548:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u20667:
decfsz	wreg,f
	bra	u20667
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u20667
	nop2
asmopt pop

	line	169
	
l1553:
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
	
l12556:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1368
	
l12558:
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
	
l12560:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@title)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1372
	
l12562:
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
	
l12564:; BSR set to: 0

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
	
l12566:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@i))&0ffh
	goto	l12670
	line	1378
	
l12568:; BSR set to: 0

	movlb	3	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_input@i))&0ffh,w
	movwf	((menu_draw_input@item_idx))&0ffh
	line	1379
	
l12570:; BSR set to: 0

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1382
	
l12572:
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
	
l12574:
	line	1388
	
l12576:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16591
	goto	u16590

u16591:
	goto	l12626
u16590:
	line	1390
	
l12578:; BSR set to: 3

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u16601
	goto	u16600
u16601:
	goto	l12622
u16600:
	line	1392
	
l12580:; BSR set to: 3

	movlw	low(02h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	line	1395
	
l12582:; BSR set to: 0

	movff	(menu_draw_input@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_option_field@flow_type)
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u16611
	goto	u16610
u16611:
	goto	l12596
u16610:
	line	1397
	
l12584:
	movlb	3	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u16621
	goto	u16620
u16621:
	goto	l12598
u16620:
	line	1400
	
l12586:; BSR set to: 3

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
	
l12588:
	movlb	0	; () banked
	movf	((menu_draw_input@opts))&0ffh,w
iorwf	((menu_draw_input@opts+1))&0ffh,w
	btfsc	status,2
	goto	u16631
	goto	u16630

u16631:
	goto	l12596
u16630:
	
l12590:; BSR set to: 0

	movf	((menu_draw_input@flag))&0ffh,w
iorwf	((menu_draw_input@flag+1))&0ffh,w
	btfsc	status,2
	goto	u16641
	goto	u16640

u16641:
	goto	l12596
u16640:
	
l12592:; BSR set to: 0

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
	goto	u16651
	goto	u16650
u16651:
	goto	l12596
u16650:
	line	1405
	
l12594:; BSR set to: 0

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
	goto	l12630
	line	1409
	
l12596:
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
	goto	l12630
	line	1415
	
l12598:; BSR set to: 3

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
	
l12600:
	movlb	0	; () banked
	movf	((menu_draw_input@opts_1499))&0ffh,w
iorwf	((menu_draw_input@opts_1499+1))&0ffh,w
	btfsc	status,2
	goto	u16661
	goto	u16660

u16661:
	goto	l12618
u16660:
	
l12602:; BSR set to: 0

	movf	((menu_draw_input@flag_1503))&0ffh,w
iorwf	((menu_draw_input@flag_1503+1))&0ffh,w
	btfsc	status,2
	goto	u16671
	goto	u16670

u16671:
	goto	l12618
u16670:
	
l12604:; BSR set to: 0

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
	goto	u16681
	goto	u16680
u16681:
	goto	l12618
u16680:
	line	1420
	
l12606:; BSR set to: 0

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
	
l12608:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j))&0ffh
	goto	l12614
	line	1422
	
l12610:; BSR set to: 0

	movf	((menu_draw_input@j))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1421
	
l12612:; BSR set to: 0

	incf	((menu_draw_input@j))&0ffh
	
l12614:; BSR set to: 0

		movf	((menu_draw_input@val_len))&0ffh,w
	subwf	((menu_draw_input@j))&0ffh,w
	btfss	status,0
	goto	u16691
	goto	u16690

u16691:
	goto	l12610
u16690:
	line	1423
	
l12616:; BSR set to: 0

	movf	((menu_draw_input@val_len))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1424
	goto	l12630
	line	1427
	
l12618:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_237)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_237)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l12630
	line	1440
	
l12622:; BSR set to: 3

	movlw	low(01h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l12596
	line	1447
	
l12626:; BSR set to: 3

	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l12596
	line	1452
	
l12630:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_1507))&0ffh
	line	1453
	
l12632:; BSR set to: 0

	movf	((menu_draw_input@val_len_1507))&0ffh,w
	btfsc	status,2
	goto	u16701
	goto	u16700
u16701:
	goto	l12668
u16700:
	
l12634:; BSR set to: 0

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
	goto	u16711
	goto	u16710

u16711:
	goto	l12668
u16710:
	line	1456
	
l12636:
	movlb	3	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u16721
	goto	u16720
u16721:
	goto	l12644
u16720:
	
l12638:; BSR set to: 3

	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	3	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u16731
	goto	u16730

u16731:
	goto	l12644
u16730:
	line	1459
	
l12640:; BSR set to: 3

	movff	(menu_draw_input@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_numeric_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u16741
	goto	u16740
u16741:
	goto	l12668
u16740:
	
l12642:
	movff	(menu_draw_input@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_time_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u16751
	goto	u16750
u16751:
	goto	l12644
u16750:
	goto	l12668
	line	1466
	
l12644:
	movlb	0	; () banked
	movf	((menu_draw_input@show_brackets))&0ffh,w
	btfss	status,2
	goto	u16761
	goto	u16760
u16761:
	goto	l12648
u16760:
	line	1469
	
l12646:; BSR set to: 0

	movf	((menu_draw_input@val_len_1507))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	1470
	goto	l12668
	line	1474
	
l12648:; BSR set to: 0

	movf	((menu_draw_input@val_len_1507))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_input@start_pos))&0ffh
	line	1475
	
l12650:; BSR set to: 0

	movff	(menu_draw_input@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1478
	
l12652:
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u16771
	goto	u16770

u16771:
	goto	l12656
u16770:
	
l12654:; BSR set to: 0

		movlw	low(STR_240)
	movwf	((_menu_draw_input$1513))&0ffh
	movlw	high(STR_240)
	movwf	((_menu_draw_input$1513+1))&0ffh

	goto	l12658
	
l12656:; BSR set to: 0

		movlw	low(STR_239)
	movwf	((_menu_draw_input$1513))&0ffh
	movlw	high(STR_239)
	movwf	((_menu_draw_input$1513+1))&0ffh

	
l12658:; BSR set to: 0

		movff	(_menu_draw_input$1513),(c:lcd_print@str)
	movff	(_menu_draw_input$1513+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1480
	
l12660:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1482
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u16781
	goto	u16780

u16781:
	goto	l12664
u16780:
	
l12662:; BSR set to: 0

		movlw	low(STR_242)
	movwf	((_menu_draw_input$1517))&0ffh
	movlw	high(STR_242)
	movwf	((_menu_draw_input$1517+1))&0ffh

	goto	l12666
	
l12664:; BSR set to: 0

		movlw	low(STR_241)
	movwf	((_menu_draw_input$1517))&0ffh
	movlw	high(STR_241)
	movwf	((_menu_draw_input$1517+1))&0ffh

	
l12666:; BSR set to: 0

		movff	(_menu_draw_input$1517),(c:lcd_print@str)
	movff	(_menu_draw_input$1517+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1376
	
l12668:
	movlb	0	; () banked
	incf	((menu_draw_input@i))&0ffh
	
l12670:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_input@i))&0ffh
	goto	u16791
	goto	u16790

u16791:
	goto	l1019
u16790:
	
l12672:; BSR set to: 0

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
	goto	u16801
	goto	u16800

u16801:
	goto	l12568
u16800:
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
;;		 -> value_contrast(4), value_menu_timeout(6), value_log_entries(6), STR_273(9), 
;;		 -> STR_272(9), STR_271(1), value_clock_display(10), value_end_runtime(10), 
;;		 -> value_clock_enable(10), menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
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
;;  cp              2   16[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_clock@value_buf(15), STR_274(1), value_pwr_fail(6), value_brightness(4), 
;;		 -> value_contrast(4), value_menu_timeout(6), value_log_entries(6), STR_273(9), 
;;		 -> STR_272(9), STR_271(1), value_clock_display(10), value_end_runtime(10), 
;;		 -> value_clock_enable(10), menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
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
	
l11508:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l11512
	line	10
	
l11510:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l11512:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14577
	tblrd	*
	
	movf	tablat,w
	bra	u14570
u14577:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u14570:
	iorlw	0
	btfss	status,2
	goto	u14581
	goto	u14580
u14581:
	goto	l11510
u14580:
	line	12
	
l11514:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l2514:
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
;;		 -> value_log_entries(6), STR_273(9), STR_272(9), STR_271(1), 
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
;;		 -> value_menu_timeout(6), value_log_entries(6), STR_273(9), STR_272(9), 
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
;;		 -> value_log_entries(6), STR_273(9), STR_272(9), STR_271(1), 
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
	
l11502:
		movff	(c:strcpy@to),(c:strcpy@cp)
	movff	(c:strcpy@to+1),(c:strcpy@cp+1)

	line	19
	goto	l11506
	line	20
	
l11504:
	infsnz	((c:strcpy@cp))^00h,c
	incf	((c:strcpy@cp+1))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l11506:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14547
	tblrd	*
	
	movf	tablat,w
	bra	u14540
u14547:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u14540:
	movff	(c:strcpy@cp),tblptrl
	movff	(c:strcpy@cp+1),tblptrh
	clrf	tblptru
	
	movwf	(??_strcpy+0+0)^00h,c
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14557
	movff	??_strcpy+0+0,tablat
	tblwt*
	bra	u14550
u14557:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	??_strcpy+0+0,indf0
u14550:
	
	movf	(??_strcpy+0+0)^00h,c,w
	btfss	status,2
	goto	u14561
	goto	u14560
u14561:
	goto	l11504
u14560:
	line	24
	
l2508:
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
;;		 -> value_menu_timeout(6), value_log_entries(6), STR_273(9), STR_272(9), 
;;		 -> STR_271(1), value_clock_display(10), value_end_runtime(10), value_clock_enable(10), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), value_relay_pulse(10), 
;;		 -> NULL(0), 
;;  s2              2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_335(5), STR_334(6), STR_333(6), STR_332(8), 
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
	
l12100:
	goto	l12104
	line	38
	
l12102:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l12104:
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
	bra	u15807
	tblrd	*
	
	movf	tablat,w
	bra	u15800
u15807:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15800:
	movwf	(??_strcmp+1+0)^00h,c
	movf	(??_strcmp+0+0)^00h,c,w
	subwf	((??_strcmp+1+0))^00h,c,w
	movwf	((c:strcmp@r))^00h,c
	movf	((c:strcmp@r))^00h,c,w
	btfss	status,2
	goto	u15811
	goto	u15810
u15811:
	goto	l12108
u15810:
	
l12106:
	movff	(c:strcmp@s1),tblptrl
	movff	(c:strcmp@s1+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15827
	tblrd	*
	
	movf	tablat,w
	bra	u15820
u15827:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15820:
	iorlw	0
	btfss	status,2
	goto	u15831
	goto	u15830
u15831:
	goto	l12102
u15830:
	line	41
	
l12108:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l2502:
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
;;		 -> menu_draw_utility@value_buf(15), STR_296(2), STR_295(2), STR_294(8), 
;;		 -> STR_293(5), STR_292(14), STR_291(6), STR_290(7), 
;;		 -> STR_289(10), STR_288(11), STR_287(10), STR_286(11), 
;;		 -> STR_285(10), menu_draw_clock@value_buf(15), STR_280(6), Fake(1), 
;;		 -> STR_251(5), STR_250(5), STR_249(9), STR_248(5), 
;;		 -> STR_247(6), STR_246(1), STR_245(1), STR_244(1), 
;;		 -> menu_draw_input@value_buf(15), menu_draw_input@title(10), STR_172(2), STR_171(2), 
;;		 -> STR_170(2), STR_169(2), STR_168(6), STR_167(2), 
;;		 -> STR_166(2), STR_165(2), STR_164(2), STR_163(6), 
;;		 -> menu_update_datetime_display@time_buf(9), menu_update_datetime_display@date_buf(9), STR_140(5), STR_139(13), 
;;		 -> STR_138(11), STR_137(9), STR_136(13), STR_135(12), 
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
	
l11498:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	880
	
l11500:
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
	
l11494:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	886
	
l11496:
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
	
l11190:
	goto	l11202
	line	135
	
l1538:
	line	136
	movff	(c:lcd_set_cursor@col),(c:lcd_set_cursor@addr)
	line	137
	goto	l11204
	line	139
	
l11192:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(040h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	140
	goto	l11204
	line	142
	
l11194:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(094h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	143
	goto	l11204
	line	145
	
l11196:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(0D4h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	146
	goto	l11204
	line	148
	
l11198:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	149
	goto	l11204
	line	133
	
l11202:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l1538
	xorlw	1^0	; case 1
	skipnz
	goto	l11192
	xorlw	2^1	; case 2
	skipnz
	goto	l11194
	xorlw	3^2	; case 3
	skipnz
	goto	l11196
	goto	l11198

	line	152
	
l11204:
	movf	((c:lcd_set_cursor@addr))^00h,c,w
	iorlw	low(080h)
	
	call	_lcd_cmd
	line	153
	
l1544:
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
;;		 -> STR_300(2), STR_299(2), STR_298(2), STR_297(2), 
;;		 -> menu_draw_utility@value_buf(15), STR_296(2), STR_295(2), STR_294(8), 
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
;;		 -> STR_139(13), STR_138(11), STR_137(9), STR_136(13), 
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
	
l11206:
	goto	l11212
	line	160
	
l11208:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u13967
	tblrd	*
	
	movf	tablat,w
	bra	u13960
u13967:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u13960:
	
	call	_lcd_data
	
l11210:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	158
	
l11212:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u13977
	tblrd	*
	
	movf	tablat,w
	bra	u13970
u13977:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u13970:
	iorlw	0
	btfss	status,2
	goto	u13981
	goto	u13980
u13981:
	goto	l11208
u13980:
	line	162
	
l1550:
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
	
l11160:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	52
	
l11162:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	53
	
l11164:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	54
	
l11166:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	55
	
l11168:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	56
	
l11170:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	57
	
l11172:
	asmopt push
asmopt off
	movlw	133
u20677:
decfsz	wreg,f
	bra	u20677
	nop
asmopt pop

	line	60
	
l11174:
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	61
	
l11176:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	62
	
l11178:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	63
	
l11180:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	64
	
l11182:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	65
	
l11184:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	66
	asmopt push
asmopt off
	movlw	133
u20687:
decfsz	wreg,f
	bra	u20687
	nop
asmopt pop

	line	67
	
l1531:
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
	
l11610:
	movf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u14771
	goto	u14770
u14771:
	goto	l11626
u14770:
	line	258
	
l11612:
	movlw	low(01h)
	movwf	((c:_is_time_field$1237))^00h,c
	
l11614:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u14781
	goto	u14780

u14781:
	goto	l527
u14780:
	
l11616:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u14791
	goto	u14790

u14791:
	goto	l527
u14790:
	
l11618:
		movlw	8
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u14801
	goto	u14800

u14801:
	goto	l527
u14800:
	
l11620:
	movlw	low(0)
	movwf	((c:_is_time_field$1237))^00h,c
	
l527:
	movf	((c:_is_time_field$1237))^00h,c,w
	goto	l528
	line	260
	
l11626:
		decf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u14811
	goto	u14810

u14811:
	goto	l11634
u14810:
	line	263
	
l11628:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u14821
	goto	u14820

u14821:
	movlw	1
	goto	u14830
u14820:
	movlw	0
u14830:
	goto	l528
	line	265
	
l11634:
		movlw	2
	xorwf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u14841
	goto	u14840

u14841:
	goto	l11648
u14840:
	line	267
	
l11636:
	movf	((c:is_time_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u14851
	goto	u14850
u14851:
	goto	l11644
u14850:
	line	270
	
l11638:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u14861
	goto	u14860

u14861:
	movlw	1
	goto	u14870
u14860:
	movlw	0
u14870:
	goto	l528
	line	275
	
l11644:
		movlw	4
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u14881
	goto	u14880

u14881:
	movlw	1
	goto	u14890
u14880:
	movlw	0
u14890:
	goto	l528
	line	279
	
l11648:
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
	
l11738:
	movf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15011
	goto	u15010
u15011:
	goto	l11742
u15010:
	
l11740:
		decf	((c:is_option_field@line))^00h,c,w
	btfss	status,2
	goto	u15021
	goto	u15020

u15021:
	goto	l11746
u15020:
	line	289
	
l11742:
	movlw	(01h)&0ffh
	goto	l540
	line	291
	
l11746:
	movf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15031
	goto	u15030
u15031:
	goto	l11764
u15030:
	line	294
	
l11748:
	movlw	low(01h)
	movwf	((c:_is_option_field$1242))^00h,c
	
l11750:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15041
	goto	u15040

u15041:
	goto	l543
u15040:
	
l11752:
		movlw	10
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15051
	goto	u15050

u15051:
	goto	l543
u15050:
	
l11754:
		movlw	11
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15061
	goto	u15060

u15061:
	goto	l543
u15060:
	
l11756:
		movlw	12
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15071
	goto	u15070

u15071:
	goto	l543
u15070:
	
l11758:
	movlw	low(0)
	movwf	((c:_is_option_field$1242))^00h,c
	
l543:
	movf	((c:_is_option_field$1242))^00h,c,w
	goto	l540
	line	296
	
l11764:
		decf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15081
	goto	u15080

u15081:
	goto	l11778
u15080:
	line	299
	
l11766:
	movlw	low(01h)
	movwf	((c:_is_option_field$1243))^00h,c
	
l11768:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15091
	goto	u15090

u15091:
	goto	l547
u15090:
	
l11770:
		movlw	7
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15101
	goto	u15100

u15101:
	goto	l547
u15100:
	
l11772:
	movlw	low(0)
	movwf	((c:_is_option_field$1243))^00h,c
	
l547:
	movf	((c:_is_option_field$1243))^00h,c,w
	goto	l540
	line	301
	
l11778:
		movlw	2
	xorwf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15111
	goto	u15110

u15111:
	goto	l11812
u15110:
	line	303
	
l11780:
	movf	((c:is_option_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u15121
	goto	u15120
u15121:
	goto	l11798
u15120:
	line	306
	
l11782:
	movlw	low(01h)
	movwf	((c:_is_option_field$1244))^00h,c
	
l11784:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15131
	goto	u15130

u15131:
	goto	l552
u15130:
	
l11786:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15141
	goto	u15140

u15141:
	goto	l552
u15140:
	
l11788:
		movlw	8
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15151
	goto	u15150

u15151:
	goto	l552
u15150:
	
l11790:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15161
	goto	u15160

u15161:
	goto	l552
u15160:
	
l11792:
	movlw	low(0)
	movwf	((c:_is_option_field$1244))^00h,c
	
l552:
	movf	((c:_is_option_field$1244))^00h,c,w
	goto	l540
	line	311
	
l11798:
	movlw	low(01h)
	movwf	((c:_is_option_field$1245))^00h,c
	
l11800:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15171
	goto	u15170

u15171:
	goto	l555
u15170:
	
l11802:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15181
	goto	u15180

u15181:
	goto	l555
u15180:
	
l11804:
		movlw	5
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15191
	goto	u15190

u15191:
	goto	l555
u15190:
	
l11806:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u15201
	goto	u15200

u15201:
	goto	l555
u15200:
	
l11808:
	movlw	low(0)
	movwf	((c:_is_option_field$1245))^00h,c
	
l555:
	movf	((c:_is_option_field$1245))^00h,c,w
	goto	l540
	line	315
	
l11812:
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
	
l11550:
	movf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u14631
	goto	u14630
u14631:
	goto	l11568
u14630:
	line	226
	
l11552:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1230))^00h,c
	
l11554:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u14641
	goto	u14640

u14641:
	goto	l511
u14640:
	
l11556:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u14651
	goto	u14650

u14651:
	goto	l511
u14650:
	
l11558:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u14661
	goto	u14660

u14661:
	goto	l511
u14660:
	
l11560:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u14671
	goto	u14670

u14671:
	goto	l511
u14670:
	
l11562:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1230))^00h,c
	
l511:
	movf	((c:_is_numeric_field$1230))^00h,c,w
	goto	l512
	line	228
	
l11568:
		decf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u14681
	goto	u14680

u14681:
	goto	l11584
u14680:
	line	231
	
l11570:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1231))^00h,c
	
l11572:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u14691
	goto	u14690

u14691:
	goto	l516
u14690:
	
l11574:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u14701
	goto	u14700

u14701:
	goto	l516
u14700:
	
l11576:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u14711
	goto	u14710

u14711:
	goto	l516
u14710:
	
l11578:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1231))^00h,c
	
l516:
	movf	((c:_is_numeric_field$1231))^00h,c,w
	goto	l512
	line	233
	
l11584:
		movlw	2
	xorwf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u14721
	goto	u14720

u14721:
	goto	l11602
u14720:
	line	235
	
l11586:
	movf	((c:is_numeric_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u14731
	goto	u14730
u14731:
	goto	l11602
u14730:
	line	238
	
l11588:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1232))^00h,c
	
l11590:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u14741
	goto	u14740

u14741:
	goto	l521
u14740:
	
l11592:
		movlw	5
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u14751
	goto	u14750

u14751:
	goto	l521
u14750:
	
l11594:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u14761
	goto	u14760

u14761:
	goto	l521
u14760:
	
l11596:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1232))^00h,c
	
l521:
	movf	((c:_is_numeric_field$1232))^00h,c,w
	goto	l512
	line	243
	
l11602:
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
	
l11816:
	movf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15211
	goto	u15210
u15211:
	goto	l11822
u15210:
	line	326
	
l11818:
		movlw	low(_enable_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	327
	
l11822:
		decf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15221
	goto	u15220

u15221:
	goto	l11828
u15220:
	line	328
	
l11824:
		movlw	low(_sensor_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	331
	
l11828:
	movf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15231
	goto	u15230
u15231:
	goto	l11854
u15230:
	line	333
	
l11830:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15241
	goto	u15240

u15241:
	goto	l11836
u15240:
	line	334
	
l11832:
		movlw	low(_relay_high_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	335
	
l11836:
		movlw	10
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15251
	goto	u15250

u15251:
	goto	l11842
u15250:
	line	336
	
l11838:
		movlw	low(_relay_plp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	337
	
l11842:
		movlw	11
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15261
	goto	u15260

u15261:
	goto	l11848
u15260:
	line	338
	
l11844:
		movlw	low(_relay_slp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	339
	
l11848:
		movlw	12
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15271
	goto	u15270

u15271:
	goto	l11914
u15270:
	line	340
	
l11850:
		movlw	low(_display_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	343
	
l11854:
		decf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15281
	goto	u15280

u15281:
	goto	l11868
u15280:
	line	345
	
l11856:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15291
	goto	u15290

u15291:
	goto	l11862
u15290:
	goto	l11832
	line	347
	
l11862:
		movlw	7
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15301
	goto	u15300

u15301:
	goto	l11914
u15300:
	goto	l11850
	line	351
	
l11868:
		movlw	2
	xorwf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15311
	goto	u15310

u15311:
	goto	l11914
u15310:
	line	353
	
l11870:
		movlw	2
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15321
	goto	u15320

u15321:
	goto	l11876
u15320:
	line	354
	
l11872:
		movlw	low(_flow_type_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	356
	
l11876:
	movf	((c:get_option_edit_flag@flow_type))^00h,c,w
	btfss	status,2
	goto	u15331
	goto	u15330
u15331:
	goto	l11896
u15330:
	line	358
	
l11878:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15341
	goto	u15340

u15341:
	goto	l11884
u15340:
	line	359
	
l11880:
		movlw	low(_flow_units_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	360
	
l11884:
		movlw	8
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15351
	goto	u15350

u15351:
	goto	l11890
u15350:
	line	361
	
l11886:
		movlw	low(_relay_low_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	362
	
l11890:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15361
	goto	u15360

u15361:
	goto	l11914
u15360:
	goto	l11850
	line	367
	
l11896:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15371
	goto	u15370

u15371:
	goto	l11902
u15370:
	line	368
	
l11898:
		movlw	low(_no_flow_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l559
	line	369
	
l11902:
		movlw	5
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15381
	goto	u15380

u15381:
	goto	l11908
u15380:
	goto	l11886
	line	371
	
l11908:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u15391
	goto	u15390

u15391:
	goto	l11914
u15390:
	goto	l11850
	line	376
	
l11914:
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
	
l11918:
	movf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15401
	goto	u15400
u15401:
	goto	l11924
u15400:
	line	387
	
l11920:
		movlw	low(_menu_item_options)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l584
	line	388
	
l11924:
		decf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15411
	goto	u15410

u15411:
	goto	l11930
u15410:
	line	389
	
l11926:
		movlw	low(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l584
	line	392
	
l11930:
	movf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15421
	goto	u15420
u15421:
	goto	l11948
u15420:
	line	394
	
l11932:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u15431
	goto	u15430

u15431:
	goto	l11938
u15430:
	
l11934:
		movlw	10
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u15441
	goto	u15440

u15441:
	goto	l11938
u15440:
	
l11936:
		movlw	11
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15451
	goto	u15450

u15451:
	goto	l11942
u15450:
	line	395
	
l11938:
		movlw	low(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l584
	line	396
	
l11942:
		movlw	12
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15461
	goto	u15460

u15461:
	goto	l12008
u15460:
	line	397
	
l11944:
		movlw	low(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l584
	line	400
	
l11948:
		decf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15471
	goto	u15470

u15471:
	goto	l11962
u15470:
	line	402
	
l11950:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15481
	goto	u15480

u15481:
	goto	l11956
u15480:
	goto	l11938
	line	404
	
l11956:
		movlw	7
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15491
	goto	u15490

u15491:
	goto	l12008
u15490:
	goto	l11944
	line	408
	
l11962:
		movlw	2
	xorwf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u15501
	goto	u15500

u15501:
	goto	l12008
u15500:
	line	410
	
l11964:
		movlw	2
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15511
	goto	u15510

u15511:
	goto	l11970
u15510:
	line	411
	
l11966:
		movlw	low(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l584
	line	413
	
l11970:
	movf	((c:get_item_options_for_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u15521
	goto	u15520
u15521:
	goto	l11990
u15520:
	line	415
	
l11972:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15531
	goto	u15530

u15531:
	goto	l11978
u15530:
	line	416
	
l11974:
		movlw	low(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l584
	line	417
	
l11978:
		movlw	8
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15541
	goto	u15540

u15541:
	goto	l11984
u15540:
	goto	l11938
	line	419
	
l11984:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15551
	goto	u15550

u15551:
	goto	l12008
u15550:
	goto	l11944
	line	424
	
l11990:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15561
	goto	u15560

u15561:
	goto	l11996
u15560:
	line	425
	
l11992:
		movlw	low(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l584
	line	426
	
l11996:
		movlw	5
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15571
	goto	u15570

u15571:
	goto	l12002
u15570:
	goto	l11938
	line	428
	
l12002:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u15581
	goto	u15580

u15581:
	goto	l12008
u15580:
	goto	l11944
	line	433
	
l12008:
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
	
l12774:
	movff	(c:init_time_editor@mode),0+(_menu+010h)
	line	447
	movff	(c:init_time_editor@value_seconds),0+(_menu+014h)
	movff	(c:init_time_editor@value_seconds+1),1+(_menu+014h)
	line	450
	
l12776:
	movf	((c:init_time_editor@mode))^00h,c,w
	btfss	status,2
	goto	u16931
	goto	u16930
u16931:
	goto	l12780
u16930:
	line	452
	
l12778:
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
	goto	l12782
	line	457
	
l12780:
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
	
l12782:; BSR set to: 3

	movlw	low(0)
	movwf	(0+(_menu+011h))&0ffh
	line	467
	
l12784:; BSR set to: 3

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
	
l12786:
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
;;		 -> rtc_read_time@debug_buf(80), menu_handle_button@buf_1731(50), menu_handle_button@buf_1721(50), menu_handle_button@buf_1697(50), 
;;		 -> menu_handle_button@buf(50), menu_handle_encoder@buf_1664(50), menu_handle_encoder@buf_1661(50), menu_handle_encoder@buf(50), 
;;		 -> STR_274(1), value_pwr_fail(6), value_brightness(4), value_contrast(4), 
;;		 -> value_menu_timeout(6), value_log_entries(6), STR_273(9), STR_272(9), 
;;		 -> STR_271(1), value_clock_display(10), value_end_runtime(10), value_clock_enable(10), 
;;		 -> rebuild_clock_menu@buf(50), menu_draw_input@title(10), menu_update_edit_value@value_buf(10), handle_numeric_rotation@buf(50), 
;;		 -> rebuild_input_menu@buf(50), value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), 
;;		 -> value_low_flow(10), value_flow_units(10), value_rlylow(10), value_flow_type(10), 
;;		 -> value_high_tbp(10), value_high_temp(10), value_back(5), value_display(10), 
;;		 -> value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), value_sensor(12), value_enable(10), 
;;		 -> menu_update_datetime_display@time_buf(9), menu_update_datetime_display@date_buf(9), init_datetime_editor@buf(80), menu_update_time_value@debug_after(50), 
;;		 -> menu_update_time_value@debug_before(50), value_relay_pulse(10), handle_time_rotation@buf(50), init_time_editor@buf(60), 
;;		 -> NULL(0), main@buf_705(30), main@buf_678(40), main@buf_675(60), 
;;		 -> main@buf_670(50), main@time_buf(60), main@buf_636(30), main@buf(50), 
;;		 -> trigger_relay_pulse@buf(60), 
;;  f               2   28[COMRAM] PTR const unsigned char 
;;		 -> STR_337(40), STR_330(32), STR_329(38), STR_328(5), 
;;		 -> STR_327(6), STR_326(6), STR_325(5), STR_324(6), 
;;		 -> STR_323(6), STR_322(5), STR_321(5), STR_320(6), 
;;		 -> STR_319(6), STR_317(10), STR_316(26), STR_315(42), 
;;		 -> STR_314(32), STR_313(10), STR_312(10), STR_311(26), 
;;		 -> STR_310(28), STR_309(25), STR_308(20), STR_307(26), 
;;		 -> STR_306(35), STR_305(28), STR_304(37), STR_303(32), 
;;		 -> STR_302(23), STR_301(37), STR_279(10), STR_278(3), 
;;		 -> STR_277(3), STR_276(10), STR_275(3), STR_270(29), 
;;		 -> STR_269(46), STR_267(10), STR_261(3), STR_260(35), 
;;		 -> STR_236(9), STR_226(9), STR_225(7), STR_224(29), 
;;		 -> STR_222(48), STR_221(10), STR_219(10), STR_218(5), 
;;		 -> STR_217(6), STR_216(6), STR_200(10), STR_199(3), 
;;		 -> STR_198(6), STR_197(6), STR_184(10), STR_183(10), 
;;		 -> STR_182(5), STR_181(10), STR_180(5), STR_179(6), 
;;		 -> STR_178(6), STR_174(3), STR_162(15), STR_161(15), 
;;		 -> STR_160(13), STR_159(13), STR_158(13), STR_157(15), 
;;		 -> STR_156(15), STR_155(13), STR_154(13), STR_153(13), 
;;		 -> STR_151(47), STR_147(27), STR_146(51), STR_145(3), 
;;		 -> STR_144(25), STR_143(45), STR_141(35), STR_30(17), 
;;		 -> STR_29(23), STR_28(35), STR_27(17), STR_25(37), 
;;		 -> STR_14(28), STR_6(39), STR_3(27), STR_1(48), 
;; Auto vars:     Size  Location     Type
;;  idx             1   47[COMRAM] unsigned char 
;;  tmpval          4    0        struct .
;;  width           2   60[COMRAM] int 
;;  val             2   58[COMRAM] unsigned int 
;;  len             2   55[COMRAM] unsigned int 
;;  cp              2   53[COMRAM] PTR const unsigned char 
;;		 -> STR_349(7), sprintf@c(1), ?_sprintf(2), STR_274(1), 
;;		 -> value_pwr_fail(6), value_brightness(4), value_contrast(4), value_menu_timeout(6), 
;;		 -> value_log_entries(6), STR_273(9), STR_272(9), STR_271(1), 
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
	
l11278:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l11488
	line	555
	
l11280:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u14101
	goto	u14100

u14101:
	goto	l11286
u14100:
	line	558
	
l11282:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14117
	movff	(c:sprintf@c),tablat
	tblwt*
	bra	u14110
u14117:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:sprintf@c),indf0
u14110:
	
	
l11284:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l11488
	line	563
	
l11286:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	565
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	goto	l11296
	line	578
	
l11288:
	bsf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	579
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	580
	goto	l11296
	line	585
	
l11290:
	bsf	(0+(1/8)+(c:sprintf@flag))^00h,c,(1)&7
	line	586
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	587
	goto	l11296
	line	597
	
l11292:
	bsf	(0+(2/8)+(c:sprintf@flag))^00h,c,(2)&7
	line	598
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	568
	
l11296:
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
	goto	l11288
	xorlw	43^32	; case 43
	skipnz
	goto	l11290
	xorlw	48^43	; case 48
	skipnz
	goto	l11292
	goto	l1743

	line	603
	
l1743:
	line	606
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u14121
	goto	u14120
u14121:
	goto	l11300
u14120:
	line	607
	
l11298:
	bcf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	614
	
l11300:
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
	goto	u14131
	goto	u14130
u14131:
	goto	l11360
u14130:
	line	615
	
l11302:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	617
	
l11304:
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
	
l11306:
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

	
l11308:
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	619
	
l11310:
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
	goto	u14141
	goto	u14140
u14141:
	goto	l11304
u14140:
	goto	l11360
	line	747
	
l11312:
	bsf	(0+(7/8)+(c:sprintf@flag))^00h,c,(7)&7
	line	749
	goto	l11362
	line	760
	
l11314:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l11316:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l11318:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u14151
	goto	u14150

u14151:
	goto	l11322
u14150:
	line	767
	
l11320:
		movlw	low(STR_349)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_349)
	movwf	((c:sprintf@cp+1))^00h,c

	line	771
	
l11322:
	movlw	high(0)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@len))^00h,c
	line	772
	goto	l11326
	line	773
	
l11324:
	infsnz	((c:sprintf@len))^00h,c
	incf	((c:sprintf@len+1))^00h,c
	line	772
	
l11326:
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
	bra	u14167
	tblrd	*
	
	movf	tablat,w
	bra	u14160
u14167:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u14160:
	iorlw	0
	btfss	status,2
	goto	u14171
	goto	u14170
u14171:
	goto	l11324
u14170:
	line	783
	
l11328:
		movf	((c:sprintf@width))^00h,c,w
	subwf	((c:sprintf@len))^00h,c,w
	movf	((c:sprintf@width+1))^00h,c,w
	subwfb	((c:sprintf@len+1))^00h,c,w
	btfsc	status,0
	goto	u14181
	goto	u14180

u14181:
	goto	l11332
u14180:
	line	784
	
l11330:
	movf	((c:sprintf@len))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	subwfb	((c:sprintf@width+1))^00h,c

	goto	l11338
	line	786
	
l11332:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	goto	l11338
	line	791
	
l11334:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14197
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u14190
u14197:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u14190:
	
	
l11336:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	790
	
l11338:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
		incf	((c:sprintf@width))^00h,c,w
	bnz	u14201
	incf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u14201
	goto	u14200

u14201:
	goto	l11334
u14200:
	goto	l11346
	line	794
	
l11340:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14217
	tblrd	*
	
	movf	tablat,w
	bra	u14210
u14217:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u14210:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movwf	(??_sprintf+0+0)^00h,c
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14227
	movff	??_sprintf+0+0,tablat
	tblwt*
	bra	u14220
u14227:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	??_sprintf+0+0,indf0
u14220:
	
	
l11342:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l11344:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	793
	
l11346:
	decf	((c:sprintf@len))^00h,c
	btfss	status,0
	decf	((c:sprintf@len+1))^00h,c
		incf	((c:sprintf@len))^00h,c,w
	bnz	u14231
	incf	((c:sprintf@len+1))^00h,c,w
	btfss	status,2
	goto	u14231
	goto	u14230

u14231:
	goto	l11340
u14230:
	goto	l11488
	line	825
	
l11348:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:sprintf@c))^00h,c
	
l11350:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	831
	
l11352:
		movlw	low(sprintf@c)
	movwf	((c:sprintf@cp))^00h,c
	clrf	((c:sprintf@cp+1))^00h,c

	line	832
	
l11354:
	movlw	high(01h)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(01h)
	movwf	((c:sprintf@len))^00h,c
	line	833
	goto	l11328
	line	844
	
l11356:
	movlw	(0C0h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	845
	goto	l11362
	line	661
	
l11360:
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
	goto	l11490
	xorlw	88^0	; case 88
	skipnz
	goto	l11312
	xorlw	99^88	; case 99
	skipnz
	goto	l11348
	xorlw	100^99	; case 100
	skipnz
	goto	l11362
	xorlw	105^100	; case 105
	skipnz
	goto	l11362
	xorlw	115^105	; case 115
	skipnz
	goto	l11314
	xorlw	117^115	; case 117
	skipnz
	goto	l11356
	xorlw	120^117	; case 120
	skipnz
	goto	l11312
	goto	l11352

	line	1277
	
l11362:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	0C0h
	andwf	(??_sprintf+0+0)^00h,c
	btfss	status,2
	goto	u14241
	goto	u14240
u14241:
	goto	l11374
u14240:
	line	1285
	
l11364:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l11366:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l11368:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u14250
	goto	u14251

u14251:
	goto	l11408
u14250:
	line	1288
	
l11370:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l11372:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	goto	l11408
	line	1312
	
l11374:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l11376:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	goto	l11408
	line	1331
	
l11378:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l11380:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u14261
	goto	u14260

u14261:
	goto	l11384
u14260:
	goto	l11410
	line	1332
	
l11384:
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
	goto	u14271
	goto	u14270

u14271:
	goto	l11388
u14270:
	goto	l11410
	line	1331
	
l11388:
	incf	((c:sprintf@c))^00h,c
	goto	l11380
	line	1342
	
l11392:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l11394:
		movlw	4
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u14281
	goto	u14280

u14281:
	goto	l11398
u14280:
	goto	l11410
	line	1343
	
l11398:
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
	goto	u14291
	goto	u14290

u14291:
	goto	l11402
u14290:
	goto	l11410
	line	1342
	
l11402:
	incf	((c:sprintf@c))^00h,c
	goto	l11394
	line	1320
	
l11408:
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
	goto	l11378
	xorlw	128^0	; case 128
	skipnz
	goto	l11392
	xorlw	192^128	; case 192
	skipnz
	goto	l11378
	goto	l11410

	line	1371
	
l11410:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u14301
	goto	u14300

u14301:
	goto	l11416
u14300:
	
l11412:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u14311
	goto	u14310
u14311:
	goto	l11416
u14310:
	line	1372
	
l11414:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	line	1407
	
l11416:
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
	goto	u14321
	goto	u14320

u14321:
	goto	l11420
u14320:
	line	1408
	
l11418:
	movf	((c:sprintf@c))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movlw	0
	subwfb	((c:sprintf@width+1))^00h,c
	goto	l11422
	line	1410
	
l11420:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	1413
	
l11422:
	
	btfss	((c:sprintf@flag))^00h,c,(2)&7
	goto	u14331
	goto	u14330
u14331:
	goto	l11448
u14330:
	line	1415
	
l11424:
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u14341
	goto	u14340
u14341:
	goto	l1791
u14340:
	line	1416
	
l11426:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u14351
	goto	u14350
u14351:
	goto	l11430
u14350:
	
l11428:
	movlw	high(02Bh)
	movwf	((c:_sprintf$2461+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$2461))^00h,c
	goto	l11432
	
l11430:
	movlw	high(02Dh)
	movwf	((c:_sprintf$2461+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$2461))^00h,c
	
l11432:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14367
	movff	(c:_sprintf$2461),tablat
	tblwt*
	bra	u14360
u14367:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:_sprintf$2461),indf0
u14360:
	
	
l11434:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l11440
	line	1422
	
l1791:
	line	1425
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u14371
	goto	u14370
u14371:
	goto	l11440
u14370:
	line	1426
	
l11436:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14387
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u14380
u14387:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u14380:
	
	goto	l11434
	line	1441
	
l11440:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u14391
	goto	u14390

u14391:
	goto	l11470
u14390:
	line	1443
	
l11442:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14407
	movlw	030h
	movwf	tablat
	tblwt*
	bra	u14400
u14407:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	030h
	movwf	indf0
u14400:
	
	
l11444:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1444
	
l11446:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u14411
	goto	u14410

u14411:
	goto	l11442
u14410:
	goto	l11470
	line	1454
	
l11448:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u14421
	goto	u14420

u14421:
	goto	l1802
u14420:
	line	1456
	
l11450:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14437
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u14430
u14437:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u14430:
	
	
l11452:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1457
	
l11454:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u14441
	goto	u14440

u14441:
	goto	l11450
u14440:
	
l1802:
	line	1460
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u14451
	goto	u14450
u14451:
	goto	l1805
u14450:
	line	1461
	
l11456:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u14461
	goto	u14460
u14461:
	goto	l11460
u14460:
	
l11458:
	movlw	high(02Bh)
	movwf	((c:_sprintf$2462+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$2462))^00h,c
	goto	l11462
	
l11460:
	movlw	high(02Dh)
	movwf	((c:_sprintf$2462+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$2462))^00h,c
	
l11462:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14477
	movff	(c:_sprintf$2462),tablat
	tblwt*
	bra	u14470
u14477:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:_sprintf$2462),indf0
u14470:
	
	
l11464:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l11470
	line	1469
	
l1805:
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u14481
	goto	u14480
u14481:
	goto	l11470
u14480:
	line	1470
	
l11466:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14497
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u14490
u14497:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u14490:
	
	goto	l11464
	line	1498
	
l11470:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l11486
	line	1515
	
l11472:
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
	goto	l11482
	line	1526
	
l11474:
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
	
l11476:
	movlw	low((STR_350))
	addwf	((c:sprintf@idx))^00h,c,w
	movwf	tblptrl
	clrf	tblptrh
	movlw	high((STR_350))
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
	goto	l11482
	line	1502
	
l11480:
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
	goto	l11472
	xorlw	128^0	; case 128
	skipnz
	goto	l11474
	xorlw	192^128	; case 192
	skipnz
	goto	l11472
	goto	l11482

	line	1550
	
l11482:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14507
	movff	(c:sprintf@c),tablat
	tblwt*
	bra	u14500
u14507:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:sprintf@c),indf0
u14500:
	
	
l11484:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l11486:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u14511
	goto	u14510

u14511:
	goto	l11480
u14510:
	line	553
	
l11488:
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
	goto	u14521
	goto	u14520
u14521:
	goto	l11280
u14520:
	line	1564
	
l11490:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14537
	movlw	0
	movwf	tablat
	tblwt*
	bra	u14530
u14537:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	0
	movwf	indf0
u14530:
	
	line	1567
	
l1821:
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
	
l11214:
	movlw	low(0)
	movwf	((c:_isdigit$2904))^00h,c
	
l11216:
		movlw	03Ah-0
	cpfslt	((c:isdigit@c))^00h,c
	goto	u13991
	goto	u13990

u13991:
	goto	l11222
u13990:
	
l11218:
		movlw	030h-1
	cpfsgt	((c:isdigit@c))^00h,c
	goto	u14001
	goto	u14000

u14001:
	goto	l11222
u14000:
	
l11220:
	movlw	low(01h)
	movwf	((c:_isdigit$2904))^00h,c
	
l11222:
	movff	(c:_isdigit$2904),??_isdigit+0+0
	rrcf	(??_isdigit+0+0)^00h,c,w
	line	15
	
l2488:
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
	
l11226:
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
	
l11228:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	line	53
	
l1824:
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
	
l13078:
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
	
l13080:; BSR set to: 2

	movlw	low(0)
	movlb	3	; () banked
	movwf	(0+(_menu+0Fh))&0ffh
	line	1074
	
l13082:; BSR set to: 3

	movf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17141
	goto	u17140
u17141:
	goto	l13090
u17140:
	line	1077
	
l13084:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u17151
	goto	u17150

u17151:
	goto	l13088
u17150:
	
l13086:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17161
	goto	u17160

u17161:
	goto	l13104
u17160:
	line	1078
	
l13088:; BSR set to: 3

	movlw	low(01h)
	movwf	(0+(_menu+0Fh))&0ffh
	goto	l13104
	line	1080
	
l13090:; BSR set to: 3

		decf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17171
	goto	u17170

u17171:
	goto	l13096
u17170:
	line	1083
	
l13092:; BSR set to: 3

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17181
	goto	u17180

u17181:
	goto	l13104
u17180:
	goto	l13088
	line	1086
	
l13096:; BSR set to: 3

		movlw	2
	xorwf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17191
	goto	u17190

u17191:
	goto	l13104
u17190:
	
l13098:; BSR set to: 3

	movf	((c:init_numeric_editor@flow_type))^00h,c,w
	btfss	status,2
	goto	u17201
	goto	u17200
u17201:
	goto	l13104
u17200:
	line	1089
	
l13100:; BSR set to: 3

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17211
	goto	u17210

u17211:
	goto	l13104
u17210:
	goto	l13088
	line	1094
	
l13104:; BSR set to: 3

	movff	(c:init_numeric_editor@value),0+(_menu+0Dh)
	movff	(c:init_numeric_editor@value+1),1+(_menu+0Dh)
	line	1097
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u17221
	goto	u17220
u17221:
	goto	l828
u17220:
	
l13106:; BSR set to: 3

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u17230
	goto	u17231

u17231:
	goto	l828
u17230:
	line	1098
	
l13108:; BSR set to: 3

	movlw	high(0)
	movwf	((c:init_numeric_editor@value+1))^00h,c
	movlw	low(0)
	movwf	((c:init_numeric_editor@value))^00h,c
	
l828:; BSR set to: 3

	line	1101
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u17241
	goto	u17240
u17241:
	goto	l13112
u17240:
	
l13110:; BSR set to: 3

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u17251
	goto	u17250

u17251:
	movlw	1
	goto	u17260
u17250:
	movlw	0
u17260:
	movwf	((c:_init_numeric_editor$1428))^00h,c
	clrf	((c:_init_numeric_editor$1428+1))^00h,c
	goto	l13114
	
l13112:; BSR set to: 3

	movlw	high(0)
	movwf	((c:_init_numeric_editor$1428+1))^00h,c
	movlw	low(0)
	movwf	((c:_init_numeric_editor$1428))^00h,c
	
l13114:; BSR set to: 3

	movff	(c:_init_numeric_editor$1428),0+(_menu+09h)
	line	1104
	
l13116:; BSR set to: 3

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u17271
	goto	u17270

u17271:
	goto	l834
u17270:
	
l13118:; BSR set to: 3

	movff	(c:init_numeric_editor@value),(c:init_numeric_editor@abs_val)
	movff	(c:init_numeric_editor@value+1),(c:init_numeric_editor@abs_val+1)
	goto	l13120
	
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
	
l13120:; BSR set to: 3

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
	
l13122:; BSR set to: 3

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u17281
	goto	u17280
u17281:
	movlw	1
	goto	u17290
u17280:
	movlw	0
u17290:
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
	
l11254:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u14041
	goto	u14040

u14041:
	goto	l2313
u14040:
	line	13
	
l11256:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l11260
	line	15
	
l11258:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l11260:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u14051
	goto	u14050
u14051:
	goto	l11258
u14050:
	line	19
	
l11262:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u14061
	goto	u14060

u14061:
	goto	l11266
u14060:
	line	20
	
l11264:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l11266:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l11268:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l11262
	line	23
	
l2313:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l2320:
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
	
l11232:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l11234:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u14011
	goto	u14010

u14011:
	goto	l2303
u14010:
	line	15
	
l11236:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l11240
	line	17
	
l11238:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l11240:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u14021
	goto	u14020
u14021:
	goto	l11238
u14020:
	line	21
	
l11242:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l11244:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u14031
	goto	u14030

u14031:
	goto	l11250
u14030:
	line	23
	
l11246:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l11248:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l11250:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l11252:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l11242
	line	28
	
l2303:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l2310:
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
	
l13124:; BSR set to: 3

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
	
l13126:; BSR set to: 3

	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u17301
	goto	u17300
u17301:
	goto	l13130
u17300:
	line	1117
	
l13128:; BSR set to: 3

	negf	((c:get_current_numeric_value@value))^00h,c
	comf	((c:get_current_numeric_value@value+1))^00h,c
	btfsc	status,0
	incf	((c:get_current_numeric_value@value+1))^00h,c
	line	1118
	
l13130:; BSR set to: 3

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
	
l12270:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	165
	
l12272:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l159
	line	167
	
l12274:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u20697:
decfsz	wreg,f
	bra	u20697
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u20697
	nop2
asmopt pop

	line	165
	
l12276:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l159:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u16021
	goto	u16020

u16021:
	goto	l12274
u16020:
	
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
	
l13660:; BSR set to: 3

	movlw	(0F0h)&0ffh
	andwf	((c:3986))^0f00h,c	;volatile
	line	74
	
l13662:; BSR set to: 3

	bcf	((c:3986))^0f00h,c,5	;volatile
	line	75
	
l13664:; BSR set to: 3

	bcf	((c:3986))^0f00h,c,6	;volatile
	line	76
	
l13666:; BSR set to: 3

	bcf	((c:3986))^0f00h,c,7	;volatile
	line	79
	
l13668:; BSR set to: 3

	bcf	((c:3977))^0f00h,c,6	;volatile
	line	80
	
l13670:; BSR set to: 3

	bcf	((c:3977))^0f00h,c,5	;volatile
	line	81
	
l13672:; BSR set to: 3

	bcf	((c:3977))^0f00h,c,7	;volatile
	line	82
	
l13674:; BSR set to: 3

	movlw	(0)&0ffh
	
	call	_lcd_write_nibble
	line	85
	
l13676:
	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u20707:
decfsz	wreg,f
	bra	u20707
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u20707
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u20707
	nop
asmopt pop

	line	88
	
l13678:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	89
	
l13680:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	90
	
l13682:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	91
	
l13684:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	92
	
l13686:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	93
	
l13688:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	94
	
l13690:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u20717:
decfsz	wreg,f
	bra	u20717
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u20717
asmopt pop

	line	96
	
l13692:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	97
	
l13694:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	98
	
l13696:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	99
	
l13698:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	100
	
l13700:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u20727:
decfsz	wreg,f
	bra	u20727
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u20727
	nop2
asmopt pop

	line	102
	
l13702:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	103
	
l13704:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	104
	
l13706:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	105
	
l13708:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	106
	
l13710:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u20737:
decfsz	wreg,f
	bra	u20737
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u20737
	nop2
asmopt pop

	line	109
	
l13712:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	110
	
l13714:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	111
	
l13716:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	112
	
l13718:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	113
	
l13720:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u20747:
decfsz	wreg,f
	bra	u20747
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u20747
	nop2
asmopt pop

	line	116
	
l13722:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	119
	
l13724:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	122
	
l13726:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	125
	
l13728:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	126
	
l1534:
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
	
l11126:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	21
	
l11128:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	22
	
l11130:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	23
	
l11132:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	24
	
l11134:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	25
	
l11136:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	26
	
l11138:
	asmopt push
asmopt off
	movlw	133
u20757:
decfsz	wreg,f
	bra	u20757
	nop
asmopt pop

	line	29
	
l11140:
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	30
	
l11142:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	31
	
l11144:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	32
	
l11146:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	33
	
l11148:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	34
	
l11150:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	37
	
l11152:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u13931
	goto	u13930

u13931:
	goto	l11156
u13930:
	
l11154:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u13941
	goto	u13940

u13941:
	goto	l11158
u13940:
	line	39
	
l11156:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u20767:
decfsz	wreg,f
	bra	u20767
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u20767
	nop2
asmopt pop

	line	40
	goto	l1528
	line	43
	
l11158:
	asmopt push
asmopt off
	movlw	133
u20777:
decfsz	wreg,f
	bra	u20777
	nop
asmopt pop

	line	45
	
l1528:
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
	
l11124:
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u13851
	goto	u13850
u13851:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u13868
u13850:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u13868:
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not ((1<<1)-1)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	11
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u13871
	goto	u13870
u13871:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u13888
u13870:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u13888:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<1)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	12
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u13891
	goto	u13890
u13891:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u13908
u13890:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u13908:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<2)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	13
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u13911
	goto	u13910
u13911:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u13928
u13910:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u13928:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<3)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	14
	
l1521:
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
	
l13516:
	bsf	((c:3988))^0f00h,c,3	;volatile
	line	20
	bsf	((c:3988))^0f00h,c,4	;volatile
	line	23
	
l13518:
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
	
l13520:
	asmopt push
asmopt off
	movlw	26
u20787:
decfsz	wreg,f
	bra	u20787
	nop2
asmopt pop

	line	34
	
l1576:
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
	
l13500:; BSR set to: 5

		movlw	05h-0
	cpfslt	(0+(_system_config+01h))&0ffh
	goto	u17731
	goto	u17730

u17731:
	goto	l13506
u17730:
	line	265
	
l13502:; BSR set to: 5

	movlw	(01Eh)&0ffh
	goto	l1509
	line	267
	
l13506:; BSR set to: 5

		movlw	079h-1
	cpfsgt	(0+(_system_config+01h))&0ffh
	goto	u17741
	goto	u17740

u17741:
	goto	l13512
u17740:
	goto	l13502
	line	271
	
l13512:; BSR set to: 5

	movf	(0+(_system_config+01h))&0ffh,w
	line	272
	
l1509:; BSR set to: 5

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
psect	text57,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	205
global __ptext57
__ptext57:
psect	text57
	file	"src\encoder.c"
	line	205
	
_encoder_init:; BSR set to: 5

;incstack = 0
	callstack 28
	line	208
	
l13648:
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
	
l13650:; BSR set to: 2

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	220
	
l13652:; BSR set to: 2

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	221
	
l13654:; BSR set to: 2

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	224
	
l13656:; BSR set to: 2

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u17851
	goto	u17850
u17851:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u17858
u17850:
	clrf	(??_encoder_init+0+0)^00h,c
u17858:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u17861
	goto	u17860
u17861:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u17868
u17860:
	clrf	(??_encoder_init+1+0)^00h,c
u17868:
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
	
l13466:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	185
	
l13468:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	189
	
l13474:
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
	
l13476:
	incf	((c:eeprom_init@i))^00h,c
	
l13478:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u17691
	goto	u17690

u17691:
	goto	l13474
u17690:
	line	191
	
l13480:
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
	
l13482:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	195
	
l13484:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u17700
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u17701
	goto	u17700

u17701:
	goto	l13490
u17700:
	line	198
	
l13486:
	call	_load_factory_defaults	;wreg free
	line	199
	
l13488:
	call	_save_current_config	;wreg free
	line	203
	
l13490:
	call	_sync_menu_variables	;wreg free
	line	207
	
l13492:
	movlb	5	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	mullw	02h
	movff	prodl,(c:_menu_timeout_seconds)
	movff	prodh,(c:_menu_timeout_seconds+1)
	line	210
	
l13494:; BSR set to: 5

		movf	((c:_menu_timeout_seconds+1))^00h,c,w
	bnz	u17710
	movlw	10
	subwf	 ((c:_menu_timeout_seconds))^00h,c,w
	btfss	status,0
	goto	u17711
	goto	u17710

u17711:
	goto	l13498
u17710:
	
l13496:; BSR set to: 5

		incf	((c:_menu_timeout_seconds))^00h,c,w
	movlw	1
	subwfb	((c:_menu_timeout_seconds+1))^00h,c,w
	btfss	status,0
	goto	u17721
	goto	u17720

u17721:
	goto	l1487
u17720:
	line	212
	
l13498:; BSR set to: 5

	movlw	high(01Eh)
	movwf	((c:_menu_timeout_seconds+1))^00h,c
	movlw	low(01Eh)
	movwf	((c:_menu_timeout_seconds))^00h,c
	line	214
	
l1487:; BSR set to: 5

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
	
_sync_menu_variables:; BSR set to: 5

;incstack = 0
	callstack 27
	line	256
	
l13362:
	movff	_input_config,(c:_enable_edit_flag)
	line	257
	movff	0+(_input_config+01h),(c:_sensor_edit_flag)
	line	258
	
l1505:
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
	
l12756:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	223
	
l12762:
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
	
l12764:
	incf	((c:save_current_config@i))^00h,c
	
l12766:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u16921
	goto	u16920

u16921:
	goto	l12762
u16920:
	line	227
	
l12768:
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
	
l12770:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	231
	
l12772:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	232
	
l1492:
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
	
l12156:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	158
	
l12158:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	159
	
l1466:
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
	
l12160:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	164
	
l12162:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l12168
	line	166
	
l12164:
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
	
l12166:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l12168:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u15871
	goto	u15870

u15871:
	goto	l12164
u15870:
	line	168
	
l1472:
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
	
l11518:
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
	
l11520:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	139
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	140
	
l11522:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	143
	
l1457:
	line	142
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u14591
	goto	u14590
u14591:
	goto	l1457
u14590:
	
l1459:
	line	144
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	145
	
l1460:
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
	
l12112:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	98
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	100
	
l12118:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	101
	
l12120:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	103
	
l12126:
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
	
l12128:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l12130:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u15840
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u15841
	goto	u15840

u15841:
	goto	l12126
u15840:
	line	98
	
l12132:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l12134:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u15851
	goto	u15850

u15851:
	goto	l12118
u15850:
	line	108
	
l12136:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	109
	
l12138:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1884+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1884))^00h,c
	line	111
	
l12144:
	movf	((c:calculate_config_checksum@j_1884))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j_1884+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	109
	
l12146:
	infsnz	((c:calculate_config_checksum@j_1884))^00h,c
	incf	((c:calculate_config_checksum@j_1884+1))^00h,c
	
l12148:
		movf	((c:calculate_config_checksum@j_1884+1))^00h,c,w
	bnz	u15860
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1884))^00h,c,w
	btfss	status,0
	goto	u15861
	goto	u15860

u15861:
	goto	l12144
u15860:
	
l1450:
	line	114
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	115
	
l1451:
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
	
l13360:
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
	
l1498:
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
	
l12088:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l12098
	line	37
	
l12090:
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
	
l12092:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l12094:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l12096:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l12098:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u15791
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u15791
	goto	u15790

u15791:
	goto	l12090
u15790:
	line	41
	
l2494:
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
	
l13344:
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
	
l13346:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	153
	
l1463:
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
	
l13350:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	173
	
l13352:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l13358
	line	175
	
l13354:
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
	
l13356:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l13358:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u17551
	goto	u17550

u17551:
	goto	l13354
u17550:
	line	177
	
l1478:
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
	
l12150:
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
	
l12152:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	126
	
l1454:
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
	
l13794:
	goto	l13806
	line	73
	
l13796:
	movlw	low(018h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	74
	goto	l13808
	line	76
	
l13798:
	movlw	low(028h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	77
	goto	l13808
	line	79
	
l13800:
	movlw	low(048h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	80
	goto	l13808
	line	82
	
l13802:
	movlw	low(088h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	83
	goto	l13808
	line	84
	
l1719:
	line	86
	setf	((c:?_ad7994_read_channel))^00h,c
	setf	((c:?_ad7994_read_channel+1))^00h,c
	goto	l1720
	line	70
	
l13806:
	movf	((c:ad7994_read_channel@channel))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 1 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l13796
	xorlw	2^1	; case 2
	skipnz
	goto	l13798
	xorlw	3^2	; case 3
	skipnz
	goto	l13800
	xorlw	4^3	; case 4
	skipnz
	goto	l13802
	goto	l1719

	line	89
	
l13808:
	call	_i2c_start	;wreg free
	line	90
	
l13810:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	line	91
	
l13812:
	movlw	(02h)&0ffh
	
	call	_i2c_write
	line	92
	
l13814:
	movf	((c:ad7994_read_channel@config_byte))^00h,c,w
	
	call	_i2c_write
	line	93
	
l13816:
	call	_i2c_stop	;wreg free
	line	95
	
l13818:
	bsf	((c:3979))^0f00h,c,5	;volatile
	line	96
	
l13820:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	97
	
l13822:
	bcf	((c:3979))^0f00h,c,5	;volatile
	line	98
	
l13824:
	asmopt push
asmopt off
	movlw	5
u20797:
decfsz	wreg,f
	bra	u20797
	nop
asmopt pop

	line	100
	
l13826:
	call	_i2c_start	;wreg free
	line	101
	
l13828:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	line	102
	
l13830:
	movlw	(0)&0ffh
	
	call	_i2c_write
	line	103
	
l13832:
	call	_i2c_stop	;wreg free
	line	105
	
l13834:
	call	_i2c_start	;wreg free
	line	106
	
l13836:
	movlw	(045h)&0ffh
	
	call	_i2c_write
	line	107
	
l13838:
	movlw	(01h)&0ffh
	
	call	_i2c_read
	movwf	((c:ad7994_read_channel@msb))^00h,c
	line	108
	
l13840:
	movlw	(0)&0ffh
	
	call	_i2c_read
	movwf	((c:ad7994_read_channel@lsb))^00h,c
	line	109
	
l13842:
	call	_i2c_stop	;wreg free
	line	111
	movf	((c:ad7994_read_channel@msb))^00h,c,w
	movwf	(??_ad7994_read_channel+0+0)^00h,c
	movf	((c:ad7994_read_channel@lsb))^00h,c,w
	movwf	((c:ad7994_read_channel@result))^00h,c
	movff	??_ad7994_read_channel+0+0,((c:ad7994_read_channel@result+1))
	line	116
	
l13844:
	movlw	low(0FFFh)
	andwf	((c:ad7994_read_channel@result))^00h,c
	movlw	high(0FFFh)
	andwf	((c:ad7994_read_channel@result+1))^00h,c
	line	121
	
l13846:
	movff	(c:ad7994_read_channel@result),(c:?_ad7994_read_channel)
	movff	(c:ad7994_read_channel@result+1),(c:?_ad7994_read_channel+1)
	line	122
	
l1720:
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
	
l13364:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u17561
	goto	u17560
u17561:
	goto	l1617
u17560:
	line	147
	
l13366:
	movlw	(0FFh)&0ffh
	goto	l1618
	
l1617:
	line	149
	bsf	((c:4037))^0f00h,c,3	;volatile
	line	152
	
l13370:
	movlw	high(03E8h)
	movwf	((c:i2c_read@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_read@timeout))^00h,c
	line	153
	goto	l1619
	line	155
	
l13372:
	decf	((c:i2c_read@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_read@timeout+1))^00h,c
	movf	((c:i2c_read@timeout))^00h,c,w
iorwf	((c:i2c_read@timeout+1))^00h,c,w
	btfss	status,2
	goto	u17571
	goto	u17570

u17571:
	goto	l1619
u17570:
	goto	l13366
	line	157
	
l1619:
	line	153
	btfss	((c:4039))^0f00h,c,0	;volatile
	goto	u17581
	goto	u17580
u17581:
	goto	l13372
u17580:
	
l1622:
	line	159
	movff	(c:4041),(c:i2c_read@data)	;volatile
	line	161
	
l13378:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u17591
	goto	u17590
u17591:
	goto	l13384
u17590:
	line	162
	
l13380:
	movf	((c:i2c_read@data))^00h,c,w
	goto	l1618
	line	165
	
l13384:
	movf	((c:i2c_read@ack))^00h,c,w
	btfsc	status,2
	goto	u17601
	goto	u17600
u17601:
	clrf	(??_i2c_read+0+0)^00h,c
	incf	(??_i2c_read+0+0)^00h,c
	goto	u17618
u17600:
	clrf	(??_i2c_read+0+0)^00h,c
u17618:
	swapf	(??_i2c_read+0+0)^00h,c
	rlncf	(??_i2c_read+0+0)^00h,c
	movf	((c:4037))^0f00h,c,w	;volatile
	xorwf	(??_i2c_read+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<5)
	xorwf	(??_i2c_read+0+0)^00h,c,w
	movwf	((c:4037))^0f00h,c	;volatile
	line	166
	
l13386:
	bsf	((c:4037))^0f00h,c,4	;volatile
	line	169
	
l13388:
	movlw	high(03E8h)
	movwf	((c:i2c_read@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_read@timeout))^00h,c
	line	170
	goto	l1624
	line	172
	
l13390:
	decf	((c:i2c_read@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_read@timeout+1))^00h,c
	movf	((c:i2c_read@timeout))^00h,c,w
iorwf	((c:i2c_read@timeout+1))^00h,c,w
	btfss	status,2
	goto	u17621
	goto	u17620

u17621:
	goto	l1624
u17620:
	goto	l13380
	line	174
	
l1624:
	line	170
	btfsc	((c:4037))^0f00h,c,4	;volatile
	goto	u17631
	goto	u17630
u17631:
	goto	l13390
u17630:
	goto	l13380
	line	177
	
l1618:
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
	
l13584:
		movlw	low(STR_338)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_338)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	18
	
l13586:
	bcf	((c:3988))^0f00h,c,5	;volatile
	line	19
	
l13588:
	bcf	((c:3979))^0f00h,c,5	;volatile
	line	20
	
l13590:
	asmopt push
asmopt off
movlw	104
movwf	(??_ad7994_init+0+0)^00h,c
	movlw	228
u20807:
decfsz	wreg,f
	bra	u20807
	decfsz	(??_ad7994_init+0+0)^00h,c,f
	bra	u20807
	nop2
asmopt pop

	line	21
	
l13592:
		movlw	low(STR_339)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_339)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	23
	
l13594:
		movlw	low(STR_340)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_340)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	25
	
l13596:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u17811
	goto	u17810
u17811:
	goto	l13604
u17810:
	line	27
	
l13598:
		movlw	low(STR_341)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_341)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	28
	
l13600:
	movlw	(01h)&0ffh
	goto	l1707
	line	31
	
l13604:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u17821
	goto	u17820
u17821:
	goto	l13614
u17820:
	line	33
	
l13606:
		movlw	low(STR_342)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_342)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	34
	
l13608:
	call	_i2c_stop	;wreg free
	line	35
	
l13610:
	movlw	(02h)&0ffh
	goto	l1707
	line	37
	
l13614:
		movlw	low(STR_343)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_343)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	39
	
l13616:
	movlw	(02h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u17831
	goto	u17830
u17831:
	goto	l13626
u17830:
	line	41
	
l13618:
		movlw	low(STR_344)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_344)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	42
	
l13620:
	call	_i2c_stop	;wreg free
	line	43
	
l13622:
	movlw	(03h)&0ffh
	goto	l1707
	line	45
	
l13626:
		movlw	low(STR_345)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_345)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	47
	
l13628:
	movlw	(08h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u17841
	goto	u17840
u17841:
	goto	l13638
u17840:
	line	49
	
l13630:
		movlw	low(STR_346)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_346)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	50
	
l13632:
	call	_i2c_stop	;wreg free
	line	51
	
l13634:
	movlw	(04h)&0ffh
	goto	l1707
	line	53
	
l13638:
		movlw	low(STR_347)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_347)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	55
	
l13640:
	call	_i2c_stop	;wreg free
	line	56
	
l13642:
		movlw	low(STR_348)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_348)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	57
	
l13644:
	movlw	(0)&0ffh
	line	58
	
l1707:
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
;;		 -> STR_348(29), STR_347(38), STR_346(43), STR_345(38), 
;;		 -> STR_344(49), STR_343(31), STR_342(39), STR_341(31), 
;;		 -> STR_340(37), STR_339(28), STR_338(22), rtc_read_time@debug_buf(80), 
;;		 -> STR_336(20), STR_331(25), menu_handle_button@buf_1731(50), menu_handle_button@buf_1721(50), 
;;		 -> STR_318(27), menu_handle_button@buf_1697(50), menu_handle_button@buf(50), menu_handle_encoder@buf_1664(50), 
;;		 -> menu_handle_encoder@buf_1661(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), handle_numeric_rotation@buf(50), 
;;		 -> STR_223(31), rebuild_input_menu@buf(50), STR_152(26), init_datetime_editor@buf(80), 
;;		 -> menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), handle_time_rotation@buf(50), STR_142(29), 
;;		 -> init_time_editor@buf(60), STR_44(21), STR_43(20), STR_42(36), 
;;		 -> STR_39(33), STR_38(21), STR_37(20), STR_36(22), 
;;		 -> STR_33(26), STR_32(15), STR_31(20), main@buf_705(30), 
;;		 -> main@buf_678(40), main@buf_675(60), main@buf_670(50), STR_26(16), 
;;		 -> main@time_buf(60), STR_24(19), STR_23(22), STR_22(22), 
;;		 -> STR_21(24), STR_20(19), STR_19(22), STR_16(23), 
;;		 -> STR_15(28), main@buf_636(30), STR_13(20), STR_12(36), 
;;		 -> STR_11(34), STR_10(42), STR_9(37), STR_8(16), 
;;		 -> STR_7(20), main@buf(50), STR_5(23), STR_4(29), 
;;		 -> STR_2(42), trigger_relay_pulse@buf(60), 
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
	
l11540:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	83
	
l11542:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	84
	
l11544:
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
;;		 -> STR_348(29), STR_347(38), STR_346(43), STR_345(38), 
;;		 -> STR_344(49), STR_343(31), STR_342(39), STR_341(31), 
;;		 -> STR_340(37), STR_339(28), STR_338(22), rtc_read_time@debug_buf(80), 
;;		 -> STR_336(20), STR_331(25), menu_handle_button@buf_1731(50), menu_handle_button@buf_1721(50), 
;;		 -> STR_318(27), menu_handle_button@buf_1697(50), menu_handle_button@buf(50), menu_handle_encoder@buf_1664(50), 
;;		 -> menu_handle_encoder@buf_1661(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), handle_numeric_rotation@buf(50), 
;;		 -> STR_223(31), rebuild_input_menu@buf(50), STR_152(26), init_datetime_editor@buf(80), 
;;		 -> menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), handle_time_rotation@buf(50), STR_142(29), 
;;		 -> init_time_editor@buf(60), STR_44(21), STR_43(20), STR_42(36), 
;;		 -> STR_39(33), STR_38(21), STR_37(20), STR_36(22), 
;;		 -> STR_33(26), STR_32(15), STR_31(20), main@buf_705(30), 
;;		 -> main@buf_678(40), main@buf_675(60), main@buf_670(50), STR_26(16), 
;;		 -> main@time_buf(60), STR_24(19), STR_23(22), STR_22(22), 
;;		 -> STR_21(24), STR_20(19), STR_19(22), STR_16(23), 
;;		 -> STR_15(28), main@buf_636(30), STR_13(20), STR_12(36), 
;;		 -> STR_11(34), STR_10(42), STR_9(37), STR_8(16), 
;;		 -> STR_7(20), main@buf(50), STR_5(23), STR_4(29), 
;;		 -> STR_2(42), trigger_relay_pulse@buf(60), 
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
	
l11270:
	goto	l11276
	line	76
	
l11272:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14077
	tblrd	*
	
	movf	tablat,w
	bra	u14070
u14077:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u14070:
	
	call	_uart_write
	
l11274:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	74
	
l11276:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u14087
	tblrd	*
	
	movf	tablat,w
	bra	u14080
u14087:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u14080:
	iorlw	0
	btfss	status,2
	goto	u14091
	goto	u14090
u14091:
	goto	l11272
u14090:
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
	
l11186:
	line	68
	
l126:
	line	67
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u13951
	goto	u13950
u13951:
	goto	l126
u13950:
	line	69
	
l11188:
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
	
l12198:
	movff	(c:i2c_write@data),(c:4041)	;volatile
	line	125
	
l1610:
	line	124
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u15941
	goto	u15940
u15941:
	goto	l1610
u15940:
	
l1612:
	line	126
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	129
	btfss	((c:4037))^0f00h,c,6	;volatile
	goto	u15951
	goto	u15950
u15951:
	goto	l12204
u15950:
	line	131
	
l12200:
	movlw	(01h)&0ffh
	goto	l1614
	line	134
	
l12204:
	movlw	(0)&0ffh
	line	135
	
l1614:
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
	
l12188:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u15911
	goto	u15910
u15911:
	goto	l1602
u15910:
	goto	l1603
	line	102
	
l1602:
	line	104
	bsf	((c:4037))^0f00h,c,2	;volatile
	line	107
	
l12192:
	movlw	high(03E8h)
	movwf	((c:i2c_stop@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_stop@timeout))^00h,c
	line	108
	goto	l1604
	line	110
	
l12194:
	decf	((c:i2c_stop@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_stop@timeout+1))^00h,c
	movf	((c:i2c_stop@timeout))^00h,c,w
iorwf	((c:i2c_stop@timeout+1))^00h,c,w
	btfss	status,2
	goto	u15921
	goto	u15920

u15921:
	goto	l1604
u15920:
	goto	l1603
	line	112
	
l1604:
	line	108
	btfsc	((c:4037))^0f00h,c,2	;volatile
	goto	u15931
	goto	u15930
u15931:
	goto	l12194
u15930:
	line	113
	
l1603:
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
	
l12170:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u15881
	goto	u15880
u15881:
	goto	l1586
u15880:
	line	60
	
l12172:
	movlw	(01h)&0ffh
	goto	l1587
	
l1586:
	line	62
	bsf	((c:4037))^0f00h,c,0	;volatile
	line	65
	
l12176:
	movlw	high(03E8h)
	movwf	((c:i2c_start@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_start@timeout))^00h,c
	line	66
	goto	l1588
	line	68
	
l12178:
	decf	((c:i2c_start@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_start@timeout+1))^00h,c
	movf	((c:i2c_start@timeout))^00h,c,w
iorwf	((c:i2c_start@timeout+1))^00h,c,w
	btfss	status,2
	goto	u15891
	goto	u15890

u15891:
	goto	l1588
u15890:
	goto	l12172
	line	70
	
l1588:
	line	66
	btfsc	((c:4037))^0f00h,c,0	;volatile
	goto	u15901
	goto	u15900
u15901:
	goto	l12178
u15900:
	line	72
	
l12184:
	movlw	(0)&0ffh
	line	73
	
l1587:
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
	
l11524:
	movlw	high(03E8h)
	movwf	((c:i2c_wait_idle@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_wait_idle@timeout))^00h,c
	line	45
	goto	l11532
	line	47
	
l11526:
	decf	((c:i2c_wait_idle@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_wait_idle@timeout+1))^00h,c
	movf	((c:i2c_wait_idle@timeout))^00h,c,w
iorwf	((c:i2c_wait_idle@timeout+1))^00h,c,w
	btfss	status,2
	goto	u14601
	goto	u14600

u14601:
	goto	l11532
u14600:
	line	48
	
l11528:
	movlw	(01h)&0ffh
	goto	l1582
	line	45
	
l11532:
	movff	(c:4037),??_i2c_wait_idle+0+0	;volatile
	movlw	01Fh
	andwf	(??_i2c_wait_idle+0+0)^00h,c
	btfss	status,2
	goto	u14611
	goto	u14610
u14611:
	goto	l11526
u14610:
	
l11534:
	btfsc	((c:4039))^0f00h,c,2	;volatile
	goto	u14621
	goto	u14620
u14621:
	goto	l11526
u14620:
	line	50
	
l11536:
	movlw	(0)&0ffh
	line	51
	
l1582:
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
	
i2l11002:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u1357_41
	goto	i2u1357_40
i2u1357_41:
	goto	i2l349
i2u1357_40:
	line	49
	
i2l11004:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	50
	
i2l11006:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	52
	
i2l11008:
	incf	((c:_relay_ms_counter))^00h,c
	line	53
	
i2l11010:
		movlw	0Ah-1
	cpfsgt	((c:_relay_ms_counter))^00h,c
	goto	i2u1358_41
	goto	i2u1358_40

i2u1358_41:
	goto	i2l11032
i2u1358_40:
	line	55
	
i2l11012:
	movlw	low(0)
	movwf	((c:_relay_ms_counter))^00h,c
	line	57
	
i2l11014:
	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1359_41
	goto	i2u1359_40

i2u1359_41:
	goto	i2l11022
i2u1359_40:
	
i2l11016:; BSR set to: 0

	movf	((c:_relay_latch_mode))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1360_41
	goto	i2u1360_40
i2u1360_41:
	goto	i2l11022
i2u1360_40:
	
i2l11018:; BSR set to: 0

	movlb	2	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	i2u1361_41
	goto	i2u1361_40

i2u1361_41:
	goto	i2l11022
i2u1361_40:
	line	59
	
i2l11020:; BSR set to: 2

	decf	((_relay_counter))&0ffh	;volatile
	btfss	status,0
	decf	((_relay_counter+1))&0ffh	;volatile
	line	60
	goto	i2l11032
	line	61
	
i2l11022:
	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1362_41
	goto	i2u1362_40

i2u1362_41:
	goto	i2l11032
i2u1362_40:
	
i2l11024:; BSR set to: 0

	movf	((c:_relay_latch_mode))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1363_41
	goto	i2u1363_40
i2u1363_41:
	goto	i2l11032
i2u1363_40:
	
i2l11026:; BSR set to: 0

	movlb	2	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1364_41
	goto	i2u1364_40

i2u1364_41:
	goto	i2l11032
i2u1364_40:
	line	64
	
i2l11028:; BSR set to: 2

	bsf	((c:3979))^0f00h,c,1	;volatile
	line	65
	
i2l11030:; BSR set to: 2

	movlw	low(0)
	movlb	0	; () banked
	movwf	((_relay_state))&0ffh	;volatile
	line	71
	
i2l11032:
	incf	((c:_ms_counter))^00h,c	;volatile
	line	72
	
i2l11034:
		movlw	02h-1
	cpfsgt	((c:_ms_counter))^00h,c	;volatile
	goto	i2u1365_41
	goto	i2u1365_40

i2u1365_41:
	goto	i2l11050
i2u1365_40:
	line	74
	
i2l11036:
	movlw	low(0)
	movwf	((c:_ms_counter))^00h,c	;volatile
	line	75
	
i2l11038:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1366_41
	goto	i2u1366_40

i2u1366_41:
	goto	i2l11050
i2u1366_40:
	line	77
	
i2l11040:
	decf	((c:_menu_timeout_timer))^00h,c	;volatile
	btfss	status,0
	decf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	line	80
	
i2l11042:
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
	goto	i2u1367_41
	goto	i2u1367_40

i2u1367_41:
	goto	i2l11046
i2u1367_40:
	line	83
	
i2l11044:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_timeout_debug_flag))&0ffh	;volatile
	line	86
	
i2l11046:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1368_41
	goto	i2u1368_40

i2u1368_41:
	goto	i2l11050
i2u1368_40:
	line	88
	
i2l11048:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	94
	
i2l11050:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u1369_41
	goto	i2u1369_40
i2u1369_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u1369_48
i2u1369_40:
	clrf	(??_isr+0+0)^00h,c
i2u1369_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u1370_41
	goto	i2u1370_40
i2u1370_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u1370_48
i2u1370_40:
	clrf	(??_isr+1+0)^00h,c
i2u1370_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	95
	
i2l11052:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	98
	
i2l11054:
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
	
i2l11056:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u1371_41
	goto	i2u1371_40
i2u1371_41:
	goto	i2l11082
i2u1371_40:
	line	103
	
i2l11058:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u1372_41
	goto	i2u1372_40

i2u1372_41:
	goto	i2l11070
i2u1372_40:
	line	105
	
i2l11060:
	movlb	1	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	106
	
i2l11062:; BSR set to: 1

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	109
	
i2l11064:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1373_41
	goto	i2u1373_40

i2u1373_41:
	goto	i2l11082
i2u1373_40:
	line	111
	
i2l11066:; BSR set to: 1

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	112
	
i2l11068:; BSR set to: 1

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l11082
	line	115
	
i2l11070:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u1374_41
	goto	i2u1374_40

i2u1374_41:
	goto	i2l11082
i2u1374_40:
	line	117
	
i2l11072:
	movlb	1	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	line	118
	
i2l11074:; BSR set to: 1

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	121
	
i2l11076:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1375_41
	goto	i2u1375_40

i2u1375_41:
	goto	i2l334
i2u1375_40:
	goto	i2l11066
	line	127
	
i2l334:; BSR set to: 1

	line	129
	
i2l11082:
	movff	(c:isr@new_state),(c:_enc_state)
	line	132
	
i2l11084:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	133
	
i2l11086:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u1376_41
	goto	i2u1376_40

i2u1376_41:
	goto	i2l11114
i2u1376_40:
	line	135
	
i2l11088:
	incf	((c:_btn_debounce))^00h,c
	line	136
	
i2l11090:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u1377_41
	goto	i2u1377_40

i2u1377_41:
	goto	i2l349
i2u1377_40:
	line	138
	
i2l11092:
	movff	(c:isr@btn),(c:_last_btn)
	line	139
	
i2l11094:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	141
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1378_41
	goto	i2u1378_40
i2u1378_41:
	goto	i2l11104
i2u1378_40:
	line	144
	
i2l11096:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	145
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	148
	
i2l11098:; BSR set to: 2

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1379_41
	goto	i2u1379_40

i2u1379_41:
	goto	i2l346
i2u1379_40:
	line	150
	
i2l11100:; BSR set to: 2

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	151
	
i2l11102:; BSR set to: 2

	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l349
	line	157
	
i2l11104:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1380_41
	goto	i2u1380_40

i2u1380_41:
	goto	i2l11108
i2u1380_40:
	line	159
	
i2l11106:
	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	160
	goto	i2l343
	line	161
	
i2l11108:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u1381_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1381_41
	goto	i2u1381_40

i2u1381_41:
	goto	i2l11112
i2u1381_40:
	line	163
	
i2l11110:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	164
	goto	i2l343
	line	167
	
i2l11112:
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
	
i2l11114:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	179
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1382_41
	goto	i2u1382_40
i2u1382_41:
	goto	i2l349
i2u1382_40:
	
i2l11116:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1383_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1383_41
	goto	i2u1383_40

i2u1383_41:
	goto	i2l349
i2u1383_40:
	line	181
	
i2l11118:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	184
	
i2l11120:
		movlw	8
	xorwf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1384_41
	movlw	7
	xorwf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1384_41
	goto	i2u1384_40

i2u1384_41:
	goto	i2l346
i2u1384_40:
	line	186
	
i2l11122:
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
	
i2l10596:
	movf	((c:i2___lwmod@divisor))^00h,c,w
iorwf	((c:i2___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	i2u1305_41
	goto	i2u1305_40

i2u1305_41:
	goto	i2l2313
i2u1305_40:
	line	13
	
i2l10598:
	movlw	low(01h)
	movwf	((c:i2___lwmod@counter))^00h,c
	line	14
	goto	i2l10602
	line	15
	
i2l10600:
	bcf	status,0
	rlcf	((c:i2___lwmod@divisor))^00h,c
	rlcf	((c:i2___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:i2___lwmod@counter))^00h,c
	line	14
	
i2l10602:
	
	btfss	((c:i2___lwmod@divisor+1))^00h,c,(15)&7
	goto	i2u1306_41
	goto	i2u1306_40
i2u1306_41:
	goto	i2l10600
i2u1306_40:
	line	19
	
i2l10604:
		movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c,w
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	i2u1307_41
	goto	i2u1307_40

i2u1307_41:
	goto	i2l10608
i2u1307_40:
	line	20
	
i2l10606:
	movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c

	line	21
	
i2l10608:
	bcf	status,0
	rrcf	((c:i2___lwmod@divisor+1))^00h,c
	rrcf	((c:i2___lwmod@divisor))^00h,c
	line	22
	
i2l10610:
	decfsz	((c:i2___lwmod@counter))^00h,c
	
	goto	i2l10604
	line	23
	
i2l2313:
	line	24
	movff	(c:i2___lwmod@dividend),(c:?i2___lwmod)
	movff	(c:i2___lwmod@dividend+1),(c:?i2___lwmod+1)
	line	25
	
i2l2320:
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
