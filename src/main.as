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
	FNCALL	_menu_handle_button,_uart_println
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
	FNCALL	_isr,_relay_timer_tick
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
	global	_options_menu
	global	_menu_timeout_flag
	global	_value_sensor
	global	_value_relay_pulse
	global	_value_scale20
	global	_value_scale4
	global	_value_enable
	global	menu_draw_setup@F2659
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
psect	idataBANK2,class=CODE,space=0,delta=1,noexec
global __pidataBANK2
__pidataBANK2:
	line	65

;initializer for _options_menu
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

	file	"src\encoder.c"
	line	16

;initializer for _menu_timeout_flag
	db	low(01h)
	file	"src\menu.c"
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
psect	idataBANK3,class=CODE,space=0,delta=1,noexec
global __pidataBANK3
__pidataBANK3:
	line	1230

;initializer for menu_draw_setup@F2659
		db	low(STR_195)
	db	high(STR_195)

		db	low(STR_196)
	db	high(STR_196)

		db	low(STR_197)
	db	high(STR_197)

		db	low(STR_198)
	db	high(STR_198)

		db	low(STR_199)
	db	high(STR_199)

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
		db	low(STR_27)
	db	high(STR_27)

		db	low(STR_28)
	db	high(STR_28)

		db	low(STR_29)
	db	high(STR_29)

		db	low(STR_30)
	db	high(STR_30)

		db	low(STR_31)
	db	high(STR_31)

	db	low(01h)
	db	low(03h)
		db	low(STR_32)
	db	high(STR_32)

		db	low(STR_33)
	db	high(STR_33)

		db	low(STR_34)
	db	high(STR_34)

		db	low(STR_35)
	db	high(STR_35)

		db	low(STR_36)
	db	high(STR_36)

	db	low(02h)
	db	low(02h)
		db	low(STR_37)
	db	high(STR_37)

		db	low(STR_38)
	db	high(STR_38)

		db	low(STR_39)
	db	high(STR_39)

		db	low(STR_40)
	db	high(STR_40)

		db	low(STR_41)
	db	high(STR_41)

	db	low(03h)
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

	db	low(04h)
	db	low(02h)
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

	db	low(05h)
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

	db	low(06h)
	db	low(03h)
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

	global __end_of_menu_item_options
__end_of_menu_item_options:
	global	_pressure_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	112
_pressure_menu_template:
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

	db	low(0)
	global __end_of_pressure_menu_template
__end_of_pressure_menu_template:
	global	_flow_analog_template
psect	mediumconst
	file	"src\menu.c"
	line	155
_flow_analog_template:
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

	db	low(0)
	global __end_of_flow_analog_template
__end_of_flow_analog_template:
	global	_temp_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	130
_temp_menu_template:
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

	db	low(0)
	global __end_of_temp_menu_template
__end_of_temp_menu_template:
	global	_flow_digital_template
psect	mediumconst
	file	"src\menu.c"
	line	143
_flow_digital_template:
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

	db	low(0)
	global __end_of_flow_digital_template
__end_of_flow_digital_template:
	global	_clock_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	170
_clock_menu_template:
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
	global	_ms_counter
	global	_button_pressed
	global	_relay_low_edit_flag
	global	_relay_plp_edit_flag
	global	_relay_high_edit_flag
	global	_flow_units_edit_flag
	global	_no_flow_edit_flag
	global	_sensor_edit_flag
	global	_input_config
	global	_clock_menu
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
	global	_PIR1bits
_PIR1bits	set	0xF9E
	global	_TMR1L
_TMR1L	set	0xFCE
	global	_TMR1H
_TMR1H	set	0xFCF
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
	global	_EECON1bits
_EECON1bits	set	0xFA6
	global	_EEADR
_EEADR	set	0xFA9
	
STR_119:
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
	
STR_173:
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
	
STR_220:
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
	
STR_116:
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
	
STR_241:
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
	
STR_255:
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
	
STR_227:
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
	
STR_230:
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
	
STR_114:
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
	
STR_211:
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
	
STR_232:
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
	
STR_240:
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
	
STR_256:
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
	
STR_229:
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
	
STR_174:
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
	
STR_115:
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
	
STR_175:
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
	
STR_221:
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
	
STR_236:
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
	
STR_231:
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
	
STR_120:
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
	
STR_244:
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
	
STR_233:
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
	
STR_237:
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
	
STR_235:
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
	
STR_117:
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
	
STR_257:
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
	
STR_228:
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
	
STR_124:
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
	
STR_194:
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
	
STR_184:
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
	
STR_262:
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
	
STR_234:
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
	
STR_73:
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
	
STR_64:
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
	
STR_105:
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
	
STR_71:
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
	
STR_70:
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
	
STR_94:
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
	
STR_63:
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
	
STR_69:
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
	
STR_132:
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
	
STR_111:
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
	
STR_85:
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
	
STR_62:
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
	
STR_72:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_86:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	84	;'T'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_187:
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_177:
	db	37
	db	99	;'c'
	db	37
	db	100	;'d'
	db	37
	db	100	;'d'
	db	37
	db	100	;'d'
	db	0
	
STR_27:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_59:
	db	78	;'N'
	db	111	;'o'
	db	116	;'t'
	db	32
	db	85	;'U'
	db	115	;'s'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_76:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	0
	
STR_104:
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_77:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_78:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_28:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_38:
	db	68	;'D'
	db	105	;'i'
	db	103	;'g'
	db	105	;'i'
	db	116	;'t'
	db	97	;'a'
	db	108	;'l'
	db	0
	
STR_110:
	db	69	;'E'
	db	110	;'n'
	db	100	;'d'
	db	32
	db	82	;'R'
	db	117	;'u'
	db	110	;'n'
	db	0
	
STR_95:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_93:
	db	78	;'N'
	db	111	;'o'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_79:
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
	
STR_263:
	db	40
	db	110	;'n'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	41
	db	0
	
STR_67:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	0
	
STR_37:
	db	65	;'A'
	db	110	;'n'
	db	97	;'a'
	db	108	;'l'
	db	111	;'o'
	db	103	;'g'
	db	0
	
STR_68:
	db	83	;'S'
	db	101	;'e'
	db	110	;'n'
	db	115	;'s'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_222:
	db	67	;'C'
	db	76	;'L'
	db	79	;'O'
	db	67	;'C'
	db	75	;'K'
	db	0
	
STR_74:
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_75:
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_129:
	db	37
	db	43
	db	48	;'0'
	db	52	;'4'
	db	100	;'d'
	db	0
	
STR_57:
	db	76	;'L'
	db	97	;'a'
	db	116	;'t'
	db	99	;'c'
	db	104	;'h'
	db	0
	
STR_198:
	db	67	;'C'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_101:
	db	85	;'U'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	115	;'s'
	db	0
	
STR_65:
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
	
STR_131:
	db	37
	db	48	;'0'
	db	51	;'3'
	db	100	;'d'
	db	0
	
STR_52:
	db	72	;'H'
	db	105	;'i'
	db	100	;'d'
	db	101	;'e'
	db	0
	
STR_92:
	db	84	;'T'
	db	121	;'y'
	db	112	;'p'
	db	101	;'e'
	db	0
	
STR_80:
	db	66	;'B'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_66:
	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	0
	
STR_53:
	db	83	;'S'
	db	104	;'h'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_48:
	db	76	;'L'
	db	112	;'p'
	db	83	;'S'
	db	0
	
STR_47:
	db	37
	db	0
	
STR_122:
	db	40
	db	0
	
STR_205:
	db	42
	db	0
	
STR_185:
	db	91	;'['
	db	0
	
STR_186:
	db	93	;']'
	db	0
STR_88	equ	STR_79+0
STR_96	equ	STR_79+0
STR_107	equ	STR_79+0
STR_112	equ	STR_79+0
STR_34	equ	STR_93+3
STR_157	equ	STR_93+3
STR_202	equ	STR_93+3
STR_145	equ	STR_53+0
STR_155	equ	STR_53+0
STR_160	equ	STR_53+0
STR_219	equ	STR_53+0
STR_261	equ	STR_53+0
STR_106	equ	STR_95+0
STR_42	equ	STR_95+4
STR_171	equ	STR_95+4
STR_118	equ	STR_229+29
STR_125	equ	STR_229+29
STR_212	equ	STR_229+29
STR_82	equ	STR_68+0
STR_91	equ	STR_68+0
STR_99	equ	STR_68+0
STR_33	equ	STR_85+5
STR_147	equ	STR_85+5
STR_201	equ	STR_85+5
STR_159	equ	STR_38+0
STR_89	equ	STR_80+0
STR_97	equ	STR_80+0
STR_108	equ	STR_80+0
STR_113	equ	STR_80+0
STR_199	equ	STR_80+0
STR_87	equ	STR_76+0
STR_43	equ	STR_76+4
STR_136	equ	STR_57+0
STR_139	equ	STR_57+0
STR_142	equ	STR_57+0
STR_152	equ	STR_57+0
STR_162	equ	STR_57+0
STR_215	equ	STR_57+0
STR_259	equ	STR_57+0
STR_158	equ	STR_37+0
STR_26	equ	STR_20+0
STR_58	equ	STR_111+4
STR_137	equ	STR_111+4
STR_140	equ	STR_111+4
STR_143	equ	STR_111+4
STR_153	equ	STR_111+4
STR_163	equ	STR_111+4
STR_216	equ	STR_111+4
STR_260	equ	STR_111+4
STR_32	equ	STR_71+3
STR_128	equ	STR_71+3
STR_200	equ	STR_71+3
STR_100	equ	STR_92+0
STR_81	equ	STR_67+0
STR_90	equ	STR_67+0
STR_98	equ	STR_67+0
STR_109	equ	STR_67+0
STR_146	equ	STR_52+0
STR_156	equ	STR_52+0
STR_161	equ	STR_52+0
STR_138	equ	STR_59+0
STR_141	equ	STR_59+0
STR_144	equ	STR_59+0
STR_154	equ	STR_59+0
STR_164	equ	STR_59+0
STR_217	equ	STR_59+0
STR_127	equ	STR_27+0
STR_214	equ	STR_27+0
STR_126	equ	STR_28+0
STR_213	equ	STR_28+0
STR_258	equ	STR_28+0
STR_130	equ	STR_129+0
STR_148	equ	STR_129+0
STR_149	equ	STR_129+0
STR_167	equ	STR_129+0
STR_168	equ	STR_129+0
STR_245	equ	STR_129+0
STR_246	equ	STR_129+0
STR_249	equ	STR_129+0
STR_250	equ	STR_129+0
STR_252	equ	STR_129+0
STR_253	equ	STR_129+0
STR_133	equ	STR_131+0
STR_169	equ	STR_131+0
STR_247	equ	STR_131+0
STR_248	equ	STR_131+0
STR_251	equ	STR_131+0
STR_254	equ	STR_131+0
STR_134	equ	STR_132+0
STR_135	equ	STR_132+0
STR_151	equ	STR_132+0
STR_170	equ	STR_132+0
STR_172	equ	STR_132+0
STR_218	equ	STR_132+0
STR_238	equ	STR_132+0
STR_239	equ	STR_132+0
STR_243	equ	STR_132+0
STR_176	equ	STR_177+2
STR_242	equ	STR_237+0
STR_150	equ	STR_11+20
STR_192	equ	STR_186+0
STR_204	equ	STR_186+0
STR_208	equ	STR_186+0
STR_225	equ	STR_186+0
STR_190	equ	STR_185+0
STR_203	equ	STR_185+0
STR_207	equ	STR_185+0
STR_223	equ	STR_185+0
STR_166	equ	STR_48+0
STR_22	equ	STR_16+0
STR_83	equ	STR_69+0
STR_102	equ	STR_69+0
STR_84	equ	STR_70+0
STR_103	equ	STR_70+0
STR_25	equ	STR_19+0
STR_209	equ	STR_205+0
STR_123	equ	STR_263+5
STR_180	equ	STR_263+5
STR_183	equ	STR_263+5
STR_193	equ	STR_263+5
STR_226	equ	STR_263+5
STR_179	equ	STR_122+0
STR_182	equ	STR_122+0
STR_191	equ	STR_122+0
STR_224	equ	STR_122+0
STR_165	equ	STR_47+0
STR_121	equ	STR_124+13
STR_178	equ	STR_124+14
STR_181	equ	STR_124+15
STR_188	equ	STR_124+15
STR_206	equ	STR_124+19
STR_210	equ	STR_124+19
STR_29	equ	STR_124+20
STR_30	equ	STR_124+20
STR_31	equ	STR_124+20
STR_35	equ	STR_124+20
STR_36	equ	STR_124+20
STR_39	equ	STR_124+20
STR_40	equ	STR_124+20
STR_41	equ	STR_124+20
STR_44	equ	STR_124+20
STR_45	equ	STR_124+20
STR_46	equ	STR_124+20
STR_49	equ	STR_124+20
STR_50	equ	STR_124+20
STR_51	equ	STR_124+20
STR_54	equ	STR_124+20
STR_55	equ	STR_124+20
STR_56	equ	STR_124+20
STR_60	equ	STR_124+20
STR_61	equ	STR_124+20
STR_189	equ	STR_124+20
STR_195	equ	STR_124+20
STR_196	equ	STR_124+20
STR_197	equ	STR_124+20
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
	file	"src\encoder.c"
	line	16
	global	_menu_timeout_flag
_menu_timeout_flag:
       ds      1
psect	dataBANK2
	file	"src\menu.c"
	line	74
_value_sensor:
       ds      12
psect	dataBANK2
	file	"src\menu.c"
	line	102
_value_relay_pulse:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	76
_value_scale20:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	75
_value_scale4:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	73
_value_enable:
       ds      10
psect	bssBANK3,class=BANK3,space=1,noexec,lowdata
global __pbssBANK3
__pbssBANK3:
_original_value:
       ds      10
psect	dataBANK3,class=BANK3,space=1,noexec,lowdata
global __pdataBANK3
__pdataBANK3:
	file	"src\menu.c"
	line	1230
menu_draw_setup@F2659:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	103
_value_clock_display:
       ds      10
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
psect	dataBANK3
	file	"src\menu.c"
	line	93
_value_no_flow:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	92
_value_flow_units:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	91
_value_flow_type:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	90
_value_high_temp:
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
psect	bssBANK4,class=BANK4,space=1,noexec,lowdata
global __pbssBANK4
__pbssBANK4:
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
; Initialize objects allocated to BANK3 (210 bytes)
	global __pidataBANK3
	; load TBLPTR registers with __pidataBANK3
	movlw	low (__pidataBANK3)
	movwf	tblptrl
	movlw	high(__pidataBANK3)
	movwf	tblptrh
	movlw	low highword(__pidataBANK3)
	movwf	tblptru
	lfsr	0,__pdataBANK3
	lfsr	1,210
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK2 (63 bytes)
	global __pidataBANK2
	; load TBLPTR registers with __pidataBANK2
	movlw	low (__pidataBANK2)
	movwf	tblptrl
	movlw	high(__pidataBANK2)
	movwf	tblptrh
	movlw	low highword(__pidataBANK2)
	movwf	tblptru
	lfsr	0,__pdataBANK2
	lfsr	1,63
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
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
	copy_data2:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data2
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
; Clear objects allocated to BANK4 (128 bytes)
	global __pbssBANK4
lfsr	0,__pbssBANK4
movlw	128
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
; Clear objects allocated to BANK3 (10 bytes)
	global __pbssBANK3
lfsr	0,__pbssBANK3
movlw	10
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
; Clear objects allocated to BANK2 (112 bytes)
	global __pbssBANK2
lfsr	0,__pbssBANK2
movlw	112
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
; Clear objects allocated to COMRAM (23 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	23
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
	global	main@buf
main@buf:	; 40 bytes @ 0x0
	ds   40
	global	main@buf_623
main@buf_623:	; 30 bytes @ 0x28
	ds   30
	global	main@last_button
main@last_button:	; 1 bytes @ 0x46
	ds   1
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0x47
	ds   2
	global	main@current_event
main@current_event:	; 1 bytes @ 0x49
	ds   1
	global	main@delta
main@delta:	; 2 bytes @ 0x4A
	ds   2
psect	cstackBANK1,class=BANK1,space=1,noexec,lowdata
global __pcstackBANK1
__pcstackBANK1:
	global	menu_handle_encoder@buf_1478
menu_handle_encoder@buf_1478:	; 50 bytes @ 0x0
	global	menu_handle_button@buf_1512
menu_handle_button@buf_1512:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_encoder@buf_1481
menu_handle_encoder@buf_1481:	; 50 bytes @ 0x32
	global	menu_handle_button@buf_1534
menu_handle_button@buf_1534:	; 50 bytes @ 0x32
	ds   50
	global	menu_handle_encoder@buf
menu_handle_encoder@buf:	; 50 bytes @ 0x64
	global	menu_handle_button@buf_1544
menu_handle_button@buf_1544:	; 50 bytes @ 0x64
	ds   50
	global	_menu_handle_encoder$1476
_menu_handle_encoder$1476:	; 2 bytes @ 0x96
	global	menu_handle_button@buf
menu_handle_button@buf:	; 50 bytes @ 0x96
	ds   2
	global	_menu_handle_encoder$1477
_menu_handle_encoder$1477:	; 2 bytes @ 0x98
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
	global	_menu_handle_button$1546
_menu_handle_button$1546:	; 2 bytes @ 0xC8
	ds   2
	global	menu_handle_button@edit_flag_1506
menu_handle_button@edit_flag_1506:	; 2 bytes @ 0xCA
	ds   2
	global	menu_handle_button@opts_1507
menu_handle_button@opts_1507:	; 2 bytes @ 0xCC
	ds   2
	global	menu_handle_button@edit_flag_1537
menu_handle_button@edit_flag_1537:	; 2 bytes @ 0xCE
	ds   2
	global	menu_handle_button@opts_1538
menu_handle_button@opts_1538:	; 2 bytes @ 0xD0
	ds   2
	global	menu_handle_button@current_val_1533
menu_handle_button@current_val_1533:	; 2 bytes @ 0xD2
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
	global	menu_handle_button@flow_type_1530
menu_handle_button@flow_type_1530:	; 1 bytes @ 0xE0
	ds   1
	global	menu_handle_button@flow_type
menu_handle_button@flow_type:	; 1 bytes @ 0xE1
	ds   1
	global	menu_handle_button@sensor_type_1529
menu_handle_button@sensor_type_1529:	; 1 bytes @ 0xE2
	ds   1
	global	menu_handle_button@sensor_type
menu_handle_button@sensor_type:	; 1 bytes @ 0xE3
	ds   1
	global	menu_handle_button@new_value_1517
menu_handle_button@new_value_1517:	; 2 bytes @ 0xE4
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
	global	_menu_update_edit_value$1310
_menu_update_edit_value$1310:	; 2 bytes @ 0x16
	ds   2
	global	_menu_update_edit_value$1314
_menu_update_edit_value$1314:	; 2 bytes @ 0x18
	ds   1
	global	menu_draw_input@start_pos
menu_draw_input@start_pos:	; 1 bytes @ 0x19
	ds   1
	global	menu_update_edit_value@start_col
menu_update_edit_value@start_col:	; 1 bytes @ 0x1A
	global	_menu_draw_input$1376
_menu_draw_input$1376:	; 2 bytes @ 0x1A
	ds   1
	global	menu_update_edit_value@blink_pos
menu_update_edit_value@blink_pos:	; 1 bytes @ 0x1B
	ds   1
	global	menu_update_edit_value@screen_line
menu_update_edit_value@screen_line:	; 1 bytes @ 0x1C
	global	_menu_draw_input$1380
_menu_draw_input$1380:	; 2 bytes @ 0x1C
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
	global	menu_draw_input@opts_1362
menu_draw_input@opts_1362:	; 2 bytes @ 0x24
	ds   2
	global	menu_draw_input@flag_1366
menu_draw_input@flag_1366:	; 2 bytes @ 0x26
	ds   2
	global	menu_draw_input@val_len_1370
menu_draw_input@val_len_1370:	; 1 bytes @ 0x28
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
	global	_handle_time_rotation$1168
_handle_time_rotation$1168:	; 2 bytes @ 0x32
	global	_rebuild_input_menu$1203
_rebuild_input_menu$1203:	; 2 bytes @ 0x32
	global	_handle_numeric_rotation$1299
_handle_numeric_rotation$1299:	; 2 bytes @ 0x32
	global	_rebuild_clock_menu$1423
_rebuild_clock_menu$1423:	; 2 bytes @ 0x32
	global	menu_update_time_value@debug_after
menu_update_time_value@debug_after:	; 50 bytes @ 0x32
	ds   2
	global	handle_time_rotation@direction
handle_time_rotation@direction:	; 1 bytes @ 0x34
	global	_rebuild_input_menu$1217
_rebuild_input_menu$1217:	; 2 bytes @ 0x34
	global	_handle_numeric_rotation$1301
_handle_numeric_rotation$1301:	; 2 bytes @ 0x34
	global	_rebuild_clock_menu$1429
_rebuild_clock_menu$1429:	; 2 bytes @ 0x34
	ds   2
	global	handle_numeric_rotation@max_tens
handle_numeric_rotation@max_tens:	; 1 bytes @ 0x36
	global	_rebuild_input_menu$1218
_rebuild_input_menu$1218:	; 2 bytes @ 0x36
	global	_rebuild_clock_menu$1430
_rebuild_clock_menu$1430:	; 2 bytes @ 0x36
	ds   1
	global	handle_numeric_rotation@max_units
handle_numeric_rotation@max_units:	; 1 bytes @ 0x37
	ds   1
	global	handle_numeric_rotation@direction
handle_numeric_rotation@direction:	; 1 bytes @ 0x38
	global	_rebuild_input_menu$1224
_rebuild_input_menu$1224:	; 2 bytes @ 0x38
	ds   2
	global	_rebuild_input_menu$1225
_rebuild_input_menu$1225:	; 2 bytes @ 0x3A
	ds   2
	global	_rebuild_input_menu$1231
_rebuild_input_menu$1231:	; 2 bytes @ 0x3C
	ds   2
	global	_rebuild_input_menu$1232
_rebuild_input_menu$1232:	; 2 bytes @ 0x3E
	ds   2
	global	_rebuild_input_menu$1236
_rebuild_input_menu$1236:	; 2 bytes @ 0x40
	ds   2
	global	_rebuild_input_menu$1250
_rebuild_input_menu$1250:	; 2 bytes @ 0x42
	ds   2
	global	_rebuild_input_menu$1251
_rebuild_input_menu$1251:	; 2 bytes @ 0x44
	ds   2
	global	_rebuild_input_menu$1255
_rebuild_input_menu$1255:	; 2 bytes @ 0x46
	ds   2
	global	_rebuild_input_menu$1260
_rebuild_input_menu$1260:	; 2 bytes @ 0x48
	ds   2
	global	_rebuild_input_menu$1264
_rebuild_input_menu$1264:	; 2 bytes @ 0x4A
	ds   2
	global	_rebuild_input_menu$1270
_rebuild_input_menu$1270:	; 2 bytes @ 0x4C
	ds   2
	global	_rebuild_input_menu$1271
_rebuild_input_menu$1271:	; 2 bytes @ 0x4E
	ds   2
	global	_rebuild_input_menu$1275
_rebuild_input_menu$1275:	; 2 bytes @ 0x50
	ds   2
	global	rebuild_input_menu@flow_type_val
rebuild_input_menu@flow_type_val:	; 1 bytes @ 0x52
	ds   1
	global	rebuild_input_menu@sensor
rebuild_input_menu@sensor:	; 1 bytes @ 0x53
	ds   1
	global	_rebuild_input_menu$2476
_rebuild_input_menu$2476:	; 2 bytes @ 0x54
	ds   2
	global	_rebuild_input_menu$2477
_rebuild_input_menu$2477:	; 2 bytes @ 0x56
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
?_relay_timer_tick:	; 1 bytes @ 0x0
??_relay_timer_tick:	; 1 bytes @ 0x0
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
	global	_isdigit$2223
_isdigit$2223:	; 1 bytes @ 0xF
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
	global	_is_numeric_field$1128
_is_numeric_field$1128:	; 1 bytes @ 0x10
	global	_is_time_field$1135
_is_time_field$1135:	; 1 bytes @ 0x10
	global	_is_option_field$1140
_is_option_field$1140:	; 1 bytes @ 0x10
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
	global	_is_numeric_field$1129
_is_numeric_field$1129:	; 1 bytes @ 0x11
	global	is_time_field@line
is_time_field@line:	; 1 bytes @ 0x11
	global	_is_option_field$1141
_is_option_field$1141:	; 1 bytes @ 0x11
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
	global	_is_numeric_field$1130
_is_numeric_field$1130:	; 1 bytes @ 0x12
	global	_is_option_field$1142
_is_option_field$1142:	; 1 bytes @ 0x12
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
	global	_is_option_field$1143
_is_option_field$1143:	; 1 bytes @ 0x13
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
	global	_menu_update_numeric_value$1325
_menu_update_numeric_value$1325:	; 2 bytes @ 0x16
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
	global	calculate_config_checksum@j_1697
calculate_config_checksum@j_1697:	; 2 bytes @ 0x17
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
	global	_menu_update_numeric_value$1326
_menu_update_numeric_value$1326:	; 2 bytes @ 0x18
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
	global	_menu_update_numeric_value$1327
_menu_update_numeric_value$1327:	; 2 bytes @ 0x1A
	global	sprintf@sp
sprintf@sp:	; 2 bytes @ 0x1A
	ds   1
??_save_current_config:	; 1 bytes @ 0x1B
	global	save_current_config@checksum
save_current_config@checksum:	; 2 bytes @ 0x1B
	ds   1
??_init_numeric_editor:	; 1 bytes @ 0x1C
	global	_menu_update_numeric_value$1328
_menu_update_numeric_value$1328:	; 2 bytes @ 0x1C
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
	global	_menu_update_numeric_value$1329
_menu_update_numeric_value$1329:	; 2 bytes @ 0x1E
	global	eeprom_init@stored_checksum
eeprom_init@stored_checksum:	; 2 bytes @ 0x1E
	ds   1
	global	_init_numeric_editor$1289
_init_numeric_editor$1289:	; 2 bytes @ 0x1F
	ds   1
	global	_menu_update_numeric_value$1330
_menu_update_numeric_value$1330:	; 2 bytes @ 0x20
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
	global	_menu_update_numeric_value$1331
_menu_update_numeric_value$1331:	; 2 bytes @ 0x22
	global	_menu_draw_setup$1400
_menu_draw_setup$1400:	; 2 bytes @ 0x22
	ds   2
	global	_menu_update_numeric_value$1332
_menu_update_numeric_value$1332:	; 2 bytes @ 0x24
	global	_menu_draw_setup$1406
_menu_draw_setup$1406:	; 2 bytes @ 0x24
	ds   2
??_sprintf:	; 1 bytes @ 0x26
	global	_menu_update_numeric_value$1334
_menu_update_numeric_value$1334:	; 2 bytes @ 0x26
	global	_menu_draw_setup$1414
_menu_draw_setup$1414:	; 2 bytes @ 0x26
	ds   2
	global	menu_draw_setup@label
menu_draw_setup@label:	; 2 bytes @ 0x28
	global	menu_update_numeric_value@value_buf
menu_update_numeric_value@value_buf:	; 6 bytes @ 0x28
	ds   1
	global	_sprintf$1782
_sprintf$1782:	; 2 bytes @ 0x29
	ds   1
	global	menu_draw_setup@sensor
menu_draw_setup@sensor:	; 1 bytes @ 0x2A
	ds   1
	global	menu_draw_setup@sensor_name
menu_draw_setup@sensor_name:	; 2 bytes @ 0x2B
	global	_sprintf$1783
_sprintf$1783:	; 2 bytes @ 0x2B
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
	global	_menu_draw_clock$1452
_menu_draw_clock$1452:	; 2 bytes @ 0x2E
	global	sprintf@cp
sprintf@cp:	; 2 bytes @ 0x2E
	ds   1
	global	menu_update_numeric_value@screen_line
menu_update_numeric_value@screen_line:	; 1 bytes @ 0x2F
	ds   1
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x30
	global	_menu_draw_clock$1456
_menu_draw_clock$1456:	; 2 bytes @ 0x30
	ds   1
	global	sprintf@val
sprintf@val:	; 2 bytes @ 0x31
	ds   1
	global	menu_draw_clock@val_len
menu_draw_clock@val_len:	; 1 bytes @ 0x32
	ds   1
	global	menu_draw_clock@val_len_1446
menu_draw_clock@val_len_1446:	; 1 bytes @ 0x33
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
;!    Strings     1882
;!    Constant    857
;!    Data        295
;!    BSS         682
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126     72     102
;!    BANK0           128    110     125
;!    BANK1           256    230     255
;!    BANK2           256     76     251
;!    BANK3           256      0     220
;!    BANK4           256      0     128
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
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[10]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), 
;!		 -> STR_69(CODE[10]), STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), 
;!		 -> STR_73(CODE[13]), STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), 
;!		 -> STR_77(CODE[8]), STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), 
;!		 -> STR_81(CODE[7]), STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), 
;!		 -> STR_89(CODE[5]), STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[5]), STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    clock_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    clock_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[10]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), 
;!		 -> STR_69(CODE[10]), STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), 
;!		 -> STR_73(CODE[13]), STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), 
;!		 -> STR_77(CODE[8]), STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), 
;!		 -> STR_81(CODE[7]), STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), 
;!		 -> STR_89(CODE[5]), STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[5]), STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    clock_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
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
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[10]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), 
;!		 -> STR_69(CODE[10]), STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), 
;!		 -> STR_73(CODE[13]), STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), 
;!		 -> STR_77(CODE[8]), STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), 
;!		 -> STR_81(CODE[7]), STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), 
;!		 -> STR_89(CODE[5]), STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[5]), STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    flow_analog_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    flow_digital_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[10]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), 
;!		 -> STR_69(CODE[10]), STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), 
;!		 -> STR_73(CODE[13]), STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), 
;!		 -> STR_77(CODE[8]), STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), 
;!		 -> STR_81(CODE[7]), STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), 
;!		 -> STR_89(CODE[5]), STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[5]), STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    flow_digital_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    input_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[10]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), 
;!		 -> STR_69(CODE[10]), STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), 
;!		 -> STR_73(CODE[13]), STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), 
;!		 -> STR_77(CODE[8]), STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), 
;!		 -> STR_81(CODE[7]), STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), 
;!		 -> STR_89(CODE[5]), STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[5]), STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    lcd_print@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> Fake(UNKNOWN), menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), 
;!		 -> menu_update_edit_value@display_buf(BANK0[10]), menu_update_numeric_value@value_buf(COMRAM[6]), menu_update_time_value@value_buf(BANK0[6]), STR_100(CODE[5]), 
;!		 -> STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), STR_104(CODE[9]), 
;!		 -> STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), STR_108(CODE[5]), 
;!		 -> STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[10]), STR_112(CODE[8]), 
;!		 -> STR_113(CODE[5]), STR_121(CODE[8]), STR_122(CODE[2]), STR_123(CODE[2]), 
;!		 -> STR_124(CODE[21]), STR_16(CODE[12]), STR_17(CODE[6]), STR_178(CODE[7]), 
;!		 -> STR_179(CODE[2]), STR_180(CODE[2]), STR_181(CODE[6]), STR_182(CODE[2]), 
;!		 -> STR_183(CODE[2]), STR_184(CODE[21]), STR_185(CODE[2]), STR_186(CODE[2]), 
;!		 -> STR_190(CODE[2]), STR_191(CODE[2]), STR_192(CODE[2]), STR_193(CODE[2]), 
;!		 -> STR_194(CODE[21]), STR_195(CODE[1]), STR_196(CODE[1]), STR_197(CODE[1]), 
;!		 -> STR_198(CODE[6]), STR_199(CODE[5]), STR_200(CODE[9]), STR_201(CODE[5]), 
;!		 -> STR_202(CODE[5]), STR_203(CODE[2]), STR_204(CODE[2]), STR_205(CODE[2]), 
;!		 -> STR_206(CODE[2]), STR_207(CODE[2]), STR_208(CODE[2]), STR_209(CODE[2]), 
;!		 -> STR_210(CODE[2]), STR_22(CODE[12]), STR_222(CODE[6]), STR_223(CODE[2]), 
;!		 -> STR_224(CODE[2]), STR_225(CODE[2]), STR_226(CODE[2]), STR_23(CODE[8]), 
;!		 -> STR_3(CODE[13]), STR_4(CODE[16]), STR_62(CODE[10]), STR_63(CODE[11]), 
;!		 -> STR_64(CODE[13]), STR_65(CODE[6]), STR_66(CODE[5]), STR_67(CODE[7]), 
;!		 -> STR_68(CODE[7]), STR_69(CODE[10]), STR_70(CODE[11]), STR_71(CODE[12]), 
;!		 -> STR_72(CODE[9]), STR_73(CODE[13]), STR_74(CODE[6]), STR_75(CODE[6]), 
;!		 -> STR_76(CODE[9]), STR_77(CODE[8]), STR_78(CODE[8]), STR_79(CODE[8]), 
;!		 -> STR_80(CODE[5]), STR_81(CODE[7]), STR_82(CODE[7]), STR_83(CODE[10]), 
;!		 -> STR_84(CODE[11]), STR_85(CODE[10]), STR_86(CODE[9]), STR_87(CODE[9]), 
;!		 -> STR_88(CODE[8]), STR_89(CODE[5]), STR_90(CODE[7]), STR_91(CODE[7]), 
;!		 -> STR_92(CODE[5]), STR_93(CODE[8]), STR_94(CODE[11]), STR_95(CODE[8]), 
;!		 -> STR_96(CODE[8]), STR_97(CODE[5]), STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    lcd_print_at@str	PTR const unsigned char  size(2) Largest target is 15
;!		 -> Fake(UNKNOWN), menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), 
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[10]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_195(CODE[1]), STR_196(CODE[1]), 
;!		 -> STR_197(CODE[1]), STR_198(CODE[6]), STR_199(CODE[5]), STR_200(CODE[9]), 
;!		 -> STR_201(CODE[5]), STR_202(CODE[5]), STR_222(CODE[6]), STR_62(CODE[10]), 
;!		 -> STR_63(CODE[11]), STR_64(CODE[13]), STR_65(CODE[6]), STR_66(CODE[5]), 
;!		 -> STR_67(CODE[7]), STR_68(CODE[7]), STR_69(CODE[10]), STR_70(CODE[11]), 
;!		 -> STR_71(CODE[12]), STR_72(CODE[9]), STR_73(CODE[13]), STR_74(CODE[6]), 
;!		 -> STR_75(CODE[6]), STR_76(CODE[9]), STR_77(CODE[8]), STR_78(CODE[8]), 
;!		 -> STR_79(CODE[8]), STR_80(CODE[5]), STR_81(CODE[7]), STR_82(CODE[7]), 
;!		 -> STR_83(CODE[10]), STR_84(CODE[11]), STR_85(CODE[10]), STR_86(CODE[9]), 
;!		 -> STR_87(CODE[9]), STR_88(CODE[8]), STR_89(CODE[5]), STR_90(CODE[7]), 
;!		 -> STR_91(CODE[7]), STR_92(CODE[5]), STR_93(CODE[8]), STR_94(CODE[11]), 
;!		 -> STR_95(CODE[8]), STR_96(CODE[8]), STR_97(CODE[5]), STR_98(CODE[7]), 
;!		 -> STR_99(CODE[7]), 
;!
;!    memcpy@d	PTR unsigned char  size(2) Largest target is 384
;!		 -> clock_menu(BANK1[25]), input_config(BIGRAM[384]), input_menu(BANK2[75]), system_config(BANK4[128]), 
;!
;!    memcpy@d1	PTR void  size(2) Largest target is 384
;!		 -> clock_menu(BANK1[25]), input_config(BIGRAM[384]), input_menu(BANK2[75]), system_config(BANK4[128]), 
;!
;!    memcpy@s	PTR const unsigned char  size(2) Largest target is 384
;!		 -> clock_menu_template(CODE[25]), factory_defaults(CODE[384]), flow_analog_template(CODE[55]), flow_digital_template(CODE[40]), 
;!		 -> pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    memcpy@s1	PTR const void  size(2) Largest target is 384
;!		 -> clock_menu_template(CODE[25]), factory_defaults(CODE[384]), flow_analog_template(CODE[55]), flow_digital_template(CODE[40]), 
;!		 -> pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    menu_draw_clock$1452	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_223(CODE[2]), STR_224(CODE[2]), 
;!
;!    menu_draw_clock$1456	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_225(CODE[2]), STR_226(CODE[2]), 
;!
;!    menu_draw_input$1376	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_190(CODE[2]), STR_191(CODE[2]), 
;!
;!    menu_draw_input$1380	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_192(CODE[2]), STR_193(CODE[2]), 
;!
;!    menu_draw_input@flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@flag_1366	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_27(CODE[9]), STR_28(CODE[8]), STR_29(CODE[1]), STR_30(CODE[1]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[9]), STR_33(CODE[5]), STR_34(CODE[5]), 
;!		 -> STR_35(CODE[1]), STR_36(CODE[1]), STR_37(CODE[7]), STR_38(CODE[8]), 
;!		 -> STR_39(CODE[1]), STR_40(CODE[1]), STR_41(CODE[1]), STR_42(CODE[4]), 
;!		 -> STR_43(CODE[5]), STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[2]), STR_48(CODE[4]), STR_49(CODE[1]), STR_50(CODE[1]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[5]), STR_53(CODE[5]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[6]), STR_58(CODE[6]), 
;!		 -> STR_59(CODE[9]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!
;!    menu_draw_input@opts_1362	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts_1362$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_27(CODE[9]), STR_28(CODE[8]), STR_29(CODE[1]), STR_30(CODE[1]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[9]), STR_33(CODE[5]), STR_34(CODE[5]), 
;!		 -> STR_35(CODE[1]), STR_36(CODE[1]), STR_37(CODE[7]), STR_38(CODE[8]), 
;!		 -> STR_39(CODE[1]), STR_40(CODE[1]), STR_41(CODE[1]), STR_42(CODE[4]), 
;!		 -> STR_43(CODE[5]), STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[2]), STR_48(CODE[4]), STR_49(CODE[1]), STR_50(CODE[1]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[5]), STR_53(CODE[5]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[6]), STR_58(CODE[6]), 
;!		 -> STR_59(CODE[9]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!
;!    menu_draw_setup$1400	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_201(CODE[5]), STR_202(CODE[5]), 
;!
;!    menu_draw_setup$1406	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_205(CODE[2]), STR_206(CODE[2]), 
;!
;!    menu_draw_setup$1414	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_209(CODE[2]), STR_210(CODE[2]), 
;!
;!    menu_draw_setup@F2659	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_195(CODE[1]), STR_196(CODE[1]), STR_197(CODE[1]), STR_198(CODE[6]), 
;!		 -> STR_199(CODE[5]), 
;!
;!    menu_draw_setup@label	PTR const unsigned char  size(2) Largest target is 6
;!		 -> STR_195(CODE[1]), STR_196(CODE[1]), STR_197(CODE[1]), STR_198(CODE[6]), 
;!		 -> STR_199(CODE[5]), 
;!
;!    menu_draw_setup@sensor_name	PTR const unsigned char  size(2) Largest target is 9
;!		 -> Fake(UNKNOWN), STR_200(CODE[9]), STR_201(CODE[5]), STR_202(CODE[5]), 
;!
;!    menu_draw_setup@setup_labels	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_195(CODE[1]), STR_196(CODE[1]), STR_197(CODE[1]), STR_198(CODE[6]), 
;!		 -> STR_199(CODE[5]), 
;!
;!    menu_handle_button@edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1506	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1537	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_27(CODE[9]), STR_28(CODE[8]), STR_29(CODE[1]), STR_30(CODE[1]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[9]), STR_33(CODE[5]), STR_34(CODE[5]), 
;!		 -> STR_35(CODE[1]), STR_36(CODE[1]), STR_37(CODE[7]), STR_38(CODE[8]), 
;!		 -> STR_39(CODE[1]), STR_40(CODE[1]), STR_41(CODE[1]), STR_42(CODE[4]), 
;!		 -> STR_43(CODE[5]), STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[2]), STR_48(CODE[4]), STR_49(CODE[1]), STR_50(CODE[1]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[5]), STR_53(CODE[5]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[6]), STR_58(CODE[6]), 
;!		 -> STR_59(CODE[9]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!
;!    menu_handle_button@opts_1507	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1507$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_27(CODE[9]), STR_28(CODE[8]), STR_29(CODE[1]), STR_30(CODE[1]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[9]), STR_33(CODE[5]), STR_34(CODE[5]), 
;!		 -> STR_35(CODE[1]), STR_36(CODE[1]), STR_37(CODE[7]), STR_38(CODE[8]), 
;!		 -> STR_39(CODE[1]), STR_40(CODE[1]), STR_41(CODE[1]), STR_42(CODE[4]), 
;!		 -> STR_43(CODE[5]), STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[2]), STR_48(CODE[4]), STR_49(CODE[1]), STR_50(CODE[1]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[5]), STR_53(CODE[5]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[6]), STR_58(CODE[6]), 
;!		 -> STR_59(CODE[9]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!
;!    menu_handle_button@opts_1538	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1538$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_27(CODE[9]), STR_28(CODE[8]), STR_29(CODE[1]), STR_30(CODE[1]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[9]), STR_33(CODE[5]), STR_34(CODE[5]), 
;!		 -> STR_35(CODE[1]), STR_36(CODE[1]), STR_37(CODE[7]), STR_38(CODE[8]), 
;!		 -> STR_39(CODE[1]), STR_40(CODE[1]), STR_41(CODE[1]), STR_42(CODE[4]), 
;!		 -> STR_43(CODE[5]), STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[2]), STR_48(CODE[4]), STR_49(CODE[1]), STR_50(CODE[1]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[5]), STR_53(CODE[5]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[6]), STR_58(CODE[6]), 
;!		 -> STR_59(CODE[9]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!
;!    menu_handle_encoder$2478	const PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_27(CODE[9]), STR_28(CODE[8]), STR_29(CODE[1]), STR_30(CODE[1]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[9]), STR_33(CODE[5]), STR_34(CODE[5]), 
;!		 -> STR_35(CODE[1]), STR_36(CODE[1]), STR_37(CODE[7]), STR_38(CODE[8]), 
;!		 -> STR_39(CODE[1]), STR_40(CODE[1]), STR_41(CODE[1]), STR_42(CODE[4]), 
;!		 -> STR_43(CODE[5]), STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[2]), STR_48(CODE[4]), STR_49(CODE[1]), STR_50(CODE[1]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[5]), STR_53(CODE[5]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[6]), STR_58(CODE[6]), 
;!		 -> STR_59(CODE[9]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!
;!    menu_handle_encoder@clock_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@clock_opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@clock_opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_27(CODE[9]), STR_28(CODE[8]), STR_29(CODE[1]), STR_30(CODE[1]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[9]), STR_33(CODE[5]), STR_34(CODE[5]), 
;!		 -> STR_35(CODE[1]), STR_36(CODE[1]), STR_37(CODE[7]), STR_38(CODE[8]), 
;!		 -> STR_39(CODE[1]), STR_40(CODE[1]), STR_41(CODE[1]), STR_42(CODE[4]), 
;!		 -> STR_43(CODE[5]), STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[2]), STR_48(CODE[4]), STR_49(CODE[1]), STR_50(CODE[1]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[5]), STR_53(CODE[5]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[6]), STR_58(CODE[6]), 
;!		 -> STR_59(CODE[9]), STR_60(CODE[1]), STR_61(CODE[1]), 
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
;!		 -> STR_27(CODE[9]), STR_28(CODE[8]), STR_29(CODE[1]), STR_30(CODE[1]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[9]), STR_33(CODE[5]), STR_34(CODE[5]), 
;!		 -> STR_35(CODE[1]), STR_36(CODE[1]), STR_37(CODE[7]), STR_38(CODE[8]), 
;!		 -> STR_39(CODE[1]), STR_40(CODE[1]), STR_41(CODE[1]), STR_42(CODE[4]), 
;!		 -> STR_43(CODE[5]), STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[2]), STR_48(CODE[4]), STR_49(CODE[1]), STR_50(CODE[1]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[5]), STR_53(CODE[5]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[6]), STR_58(CODE[6]), 
;!		 -> STR_59(CODE[9]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!
;!    menu_item_options$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_27(CODE[9]), STR_28(CODE[8]), STR_29(CODE[1]), STR_30(CODE[1]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[9]), STR_33(CODE[5]), STR_34(CODE[5]), 
;!		 -> STR_35(CODE[1]), STR_36(CODE[1]), STR_37(CODE[7]), STR_38(CODE[8]), 
;!		 -> STR_39(CODE[1]), STR_40(CODE[1]), STR_41(CODE[1]), STR_42(CODE[4]), 
;!		 -> STR_43(CODE[5]), STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[2]), STR_48(CODE[4]), STR_49(CODE[1]), STR_50(CODE[1]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[5]), STR_53(CODE[5]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[6]), STR_58(CODE[6]), 
;!		 -> STR_59(CODE[9]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!
;!    options_menu	PTR const unsigned char [5] size(2) Largest target is 13
;!		 -> STR_62(CODE[10]), STR_63(CODE[11]), STR_64(CODE[13]), STR_65(CODE[6]), 
;!		 -> STR_66(CODE[5]), 
;!
;!    pressure_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[10]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), 
;!		 -> STR_69(CODE[10]), STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), 
;!		 -> STR_73(CODE[13]), STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), 
;!		 -> STR_77(CODE[8]), STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), 
;!		 -> STR_81(CODE[7]), STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), 
;!		 -> STR_89(CODE[5]), STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[5]), STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    pressure_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    rebuild_clock_menu$1423	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_213(CODE[8]), STR_214(CODE[9]), 
;!
;!    rebuild_clock_menu$1429	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_215(CODE[6]), STR_216(CODE[6]), STR_217(CODE[9]), 
;!
;!    rebuild_clock_menu$1430	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_216(CODE[6]), STR_217(CODE[9]), 
;!
;!    rebuild_input_menu$1203	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_126(CODE[8]), STR_127(CODE[9]), 
;!
;!    rebuild_input_menu$1217	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_136(CODE[6]), STR_137(CODE[6]), STR_138(CODE[9]), 
;!
;!    rebuild_input_menu$1218	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_137(CODE[6]), STR_138(CODE[9]), 
;!
;!    rebuild_input_menu$1224	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_139(CODE[6]), STR_140(CODE[6]), STR_141(CODE[9]), 
;!
;!    rebuild_input_menu$1225	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_140(CODE[6]), STR_141(CODE[9]), 
;!
;!    rebuild_input_menu$1231	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_142(CODE[6]), STR_143(CODE[6]), STR_144(CODE[9]), 
;!
;!    rebuild_input_menu$1232	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_143(CODE[6]), STR_144(CODE[9]), 
;!
;!    rebuild_input_menu$1236	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_145(CODE[5]), STR_146(CODE[5]), 
;!
;!    rebuild_input_menu$1250	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_152(CODE[6]), STR_153(CODE[6]), STR_154(CODE[9]), 
;!
;!    rebuild_input_menu$1251	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_153(CODE[6]), STR_154(CODE[9]), 
;!
;!    rebuild_input_menu$1255	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_155(CODE[5]), STR_156(CODE[5]), 
;!
;!    rebuild_input_menu$1260	PTR const unsigned char  size(2) Largest target is 8
;!		 -> STR_158(CODE[7]), STR_159(CODE[8]), 
;!
;!    rebuild_input_menu$1264	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_160(CODE[5]), STR_161(CODE[5]), 
;!
;!    rebuild_input_menu$1270	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_162(CODE[6]), STR_163(CODE[6]), STR_164(CODE[9]), 
;!
;!    rebuild_input_menu$1271	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_163(CODE[6]), STR_164(CODE[9]), 
;!
;!    rebuild_input_menu$1275	PTR const unsigned char  size(2) Largest target is 4
;!		 -> STR_165(CODE[2]), STR_166(CODE[4]), 
;!
;!    S871$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_27(CODE[9]), STR_28(CODE[8]), STR_29(CODE[1]), STR_30(CODE[1]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[9]), STR_33(CODE[5]), STR_34(CODE[5]), 
;!		 -> STR_35(CODE[1]), STR_36(CODE[1]), STR_37(CODE[7]), STR_38(CODE[8]), 
;!		 -> STR_39(CODE[1]), STR_40(CODE[1]), STR_41(CODE[1]), STR_42(CODE[4]), 
;!		 -> STR_43(CODE[5]), STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[2]), STR_48(CODE[4]), STR_49(CODE[1]), STR_50(CODE[1]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[5]), STR_53(CODE[5]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[6]), STR_58(CODE[6]), 
;!		 -> STR_59(CODE[9]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!
;!    S875$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[10]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), 
;!		 -> STR_69(CODE[10]), STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), 
;!		 -> STR_73(CODE[13]), STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), 
;!		 -> STR_77(CODE[8]), STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), 
;!		 -> STR_81(CODE[7]), STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), 
;!		 -> STR_89(CODE[5]), STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[5]), STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    S875$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
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
;!		 -> clock_menu(BANK1[25]), input_config(BIGRAM[384]), input_menu(BANK2[75]), system_config(BANK4[128]), 
;!
;!    sp__strcpy	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK3[10]), 
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 12
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), menu_item_options$option_count(CODE[1]), menu_update_time_value@value_buf(BANK0[6]), 
;!		 -> relay_high_edit_flag(COMRAM[1]), ?_sprintf(COMRAM[2]), sprintf@c(COMRAM[1]), STR_126(CODE[8]), 
;!		 -> STR_127(CODE[9]), STR_213(CODE[8]), STR_214(CODE[9]), STR_263(CODE[7]), 
;!		 -> STR_27(CODE[9]), STR_28(CODE[8]), STR_29(CODE[1]), STR_30(CODE[1]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[9]), STR_33(CODE[5]), STR_34(CODE[5]), 
;!		 -> STR_35(CODE[1]), STR_36(CODE[1]), STR_37(CODE[7]), STR_38(CODE[8]), 
;!		 -> STR_39(CODE[1]), STR_40(CODE[1]), STR_41(CODE[1]), STR_42(CODE[4]), 
;!		 -> STR_43(CODE[5]), STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[2]), STR_48(CODE[4]), STR_49(CODE[1]), STR_50(CODE[1]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[5]), STR_53(CODE[5]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[6]), STR_58(CODE[6]), 
;!		 -> STR_59(CODE[9]), STR_60(CODE[1]), STR_61(CODE[1]), value_back(BANK0[5]), 
;!		 -> value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), value_enable(BANK2[10]), 
;!		 -> value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), value_hi_pressure(BANK3[10]), 
;!		 -> value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), value_low_flow(BANK3[10]), 
;!		 -> value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), value_no_flow_bp(BANK3[10]), 
;!		 -> value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 51
;!		 -> STR_11(CODE[23]), STR_114(CODE[35]), STR_116(CODE[45]), STR_117(CODE[25]), 
;!		 -> STR_118(CODE[3]), STR_119(CODE[51]), STR_12(CODE[17]), STR_120(CODE[27]), 
;!		 -> STR_125(CODE[3]), STR_129(CODE[6]), STR_130(CODE[6]), STR_131(CODE[5]), 
;!		 -> STR_132(CODE[10]), STR_133(CODE[5]), STR_134(CODE[10]), STR_135(CODE[10]), 
;!		 -> STR_148(CODE[6]), STR_149(CODE[6]), STR_150(CODE[3]), STR_151(CODE[10]), 
;!		 -> STR_167(CODE[6]), STR_168(CODE[6]), STR_169(CODE[5]), STR_170(CODE[10]), 
;!		 -> STR_172(CODE[10]), STR_173(CODE[48]), STR_175(CODE[29]), STR_176(CODE[7]), 
;!		 -> STR_177(CODE[9]), STR_187(CODE[9]), STR_211(CODE[35]), STR_212(CODE[3]), 
;!		 -> STR_218(CODE[10]), STR_220(CODE[46]), STR_221(CODE[29]), STR_227(CODE[37]), 
;!		 -> STR_228(CODE[23]), STR_229(CODE[32]), STR_230(CODE[37]), STR_231(CODE[28]), 
;!		 -> STR_232(CODE[35]), STR_233(CODE[26]), STR_234(CODE[20]), STR_235(CODE[25]), 
;!		 -> STR_236(CODE[28]), STR_237(CODE[26]), STR_238(CODE[10]), STR_239(CODE[10]), 
;!		 -> STR_240(CODE[32]), STR_241(CODE[42]), STR_242(CODE[26]), STR_243(CODE[10]), 
;!		 -> STR_245(CODE[6]), STR_246(CODE[6]), STR_247(CODE[5]), STR_248(CODE[5]), 
;!		 -> STR_249(CODE[6]), STR_250(CODE[6]), STR_251(CODE[5]), STR_252(CODE[6]), 
;!		 -> STR_253(CODE[6]), STR_254(CODE[5]), STR_255(CODE[38]), STR_256(CODE[32]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK2[40]), 
;!		 -> main@buf_623(BANK2[30]), menu_draw_input@title(BANK0[10]), menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1512(BANK1[50]), 
;!		 -> menu_handle_button@buf_1534(BANK1[50]), menu_handle_button@buf_1544(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1478(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1481(BANK1[50]), menu_update_edit_value@value_buf(BANK0[10]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), 
;!		 -> rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), value_back(BANK0[5]), value_clock_display(BANK3[10]), 
;!		 -> value_clock_enable(BANK3[10]), value_display(BANK0[10]), value_enable(BANK2[10]), value_end_runtime(BANK3[10]), 
;!		 -> value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), 
;!		 -> value_high_temp(BANK3[10]), value_highbp(BANK3[10]), value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), 
;!		 -> value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), 
;!		 -> value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), 
;!		 -> value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), value_sensor(BANK2[12]), 
;!		 -> value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_189(CODE[1]), STR_258(CODE[8]), STR_259(CODE[6]), STR_260(CODE[6]), 
;!		 -> STR_261(CODE[5]), STR_27(CODE[9]), STR_28(CODE[8]), STR_29(CODE[1]), 
;!		 -> STR_30(CODE[1]), STR_31(CODE[1]), STR_32(CODE[9]), STR_33(CODE[5]), 
;!		 -> STR_34(CODE[5]), STR_35(CODE[1]), STR_36(CODE[1]), STR_37(CODE[7]), 
;!		 -> STR_38(CODE[8]), STR_39(CODE[1]), STR_40(CODE[1]), STR_41(CODE[1]), 
;!		 -> STR_42(CODE[4]), STR_43(CODE[5]), STR_44(CODE[1]), STR_45(CODE[1]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[2]), STR_48(CODE[4]), STR_49(CODE[1]), 
;!		 -> STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[5]), STR_53(CODE[5]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[6]), 
;!		 -> STR_58(CODE[6]), STR_59(CODE[9]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!
;!    strcpy@cp	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK3[10]), 
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 12
;!		 -> menu_update_edit_value@value_buf(BANK0[10]), STR_128(CODE[9]), STR_136(CODE[6]), STR_137(CODE[6]), 
;!		 -> STR_138(CODE[9]), STR_139(CODE[6]), STR_140(CODE[6]), STR_141(CODE[9]), 
;!		 -> STR_142(CODE[6]), STR_143(CODE[6]), STR_144(CODE[9]), STR_145(CODE[5]), 
;!		 -> STR_146(CODE[5]), STR_147(CODE[5]), STR_152(CODE[6]), STR_153(CODE[6]), 
;!		 -> STR_154(CODE[9]), STR_155(CODE[5]), STR_156(CODE[5]), STR_157(CODE[5]), 
;!		 -> STR_158(CODE[7]), STR_159(CODE[8]), STR_160(CODE[5]), STR_161(CODE[5]), 
;!		 -> STR_162(CODE[6]), STR_163(CODE[6]), STR_164(CODE[9]), STR_165(CODE[2]), 
;!		 -> STR_166(CODE[4]), STR_171(CODE[4]), STR_188(CODE[6]), STR_215(CODE[6]), 
;!		 -> STR_216(CODE[6]), STR_217(CODE[9]), STR_219(CODE[5]), STR_27(CODE[9]), 
;!		 -> STR_28(CODE[8]), STR_29(CODE[1]), STR_30(CODE[1]), STR_31(CODE[1]), 
;!		 -> STR_32(CODE[9]), STR_33(CODE[5]), STR_34(CODE[5]), STR_35(CODE[1]), 
;!		 -> STR_36(CODE[1]), STR_37(CODE[7]), STR_38(CODE[8]), STR_39(CODE[1]), 
;!		 -> STR_40(CODE[1]), STR_41(CODE[1]), STR_42(CODE[4]), STR_43(CODE[5]), 
;!		 -> STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), STR_47(CODE[2]), 
;!		 -> STR_48(CODE[4]), STR_49(CODE[1]), STR_50(CODE[1]), STR_51(CODE[1]), 
;!		 -> STR_52(CODE[5]), STR_53(CODE[5]), STR_54(CODE[1]), STR_55(CODE[1]), 
;!		 -> STR_56(CODE[1]), STR_57(CODE[6]), STR_58(CODE[6]), STR_59(CODE[9]), 
;!		 -> STR_60(CODE[1]), STR_61(CODE[1]), value_back(BANK0[5]), value_clock_display(BANK3[10]), 
;!		 -> value_clock_enable(BANK3[10]), value_display(BANK0[10]), value_enable(BANK2[10]), value_end_runtime(BANK3[10]), 
;!		 -> value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), 
;!		 -> value_high_temp(BANK3[10]), value_highbp(BANK3[10]), value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), 
;!		 -> value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), 
;!		 -> value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), 
;!		 -> value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), value_sensor(BANK2[12]), 
;!		 -> value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strcpy@to	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK3[10]), 
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strlen@cp	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_27(CODE[9]), 
;!		 -> STR_28(CODE[8]), STR_29(CODE[1]), STR_30(CODE[1]), STR_31(CODE[1]), 
;!		 -> STR_32(CODE[9]), STR_33(CODE[5]), STR_34(CODE[5]), STR_35(CODE[1]), 
;!		 -> STR_36(CODE[1]), STR_37(CODE[7]), STR_38(CODE[8]), STR_39(CODE[1]), 
;!		 -> STR_40(CODE[1]), STR_41(CODE[1]), STR_42(CODE[4]), STR_43(CODE[5]), 
;!		 -> STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), STR_47(CODE[2]), 
;!		 -> STR_48(CODE[4]), STR_49(CODE[1]), STR_50(CODE[1]), STR_51(CODE[1]), 
;!		 -> STR_52(CODE[5]), STR_53(CODE[5]), STR_54(CODE[1]), STR_55(CODE[1]), 
;!		 -> STR_56(CODE[1]), STR_57(CODE[6]), STR_58(CODE[6]), STR_59(CODE[9]), 
;!		 -> STR_60(CODE[1]), STR_61(CODE[1]), value_back(BANK0[5]), value_clock_display(BANK3[10]), 
;!		 -> value_clock_enable(BANK3[10]), value_display(BANK0[10]), value_enable(BANK2[10]), value_end_runtime(BANK3[10]), 
;!		 -> value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), 
;!		 -> value_high_temp(BANK3[10]), value_highbp(BANK3[10]), value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), 
;!		 -> value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), 
;!		 -> value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), 
;!		 -> value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), value_sensor(BANK2[12]), 
;!		 -> value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strlen@s	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_27(CODE[9]), 
;!		 -> STR_28(CODE[8]), STR_29(CODE[1]), STR_30(CODE[1]), STR_31(CODE[1]), 
;!		 -> STR_32(CODE[9]), STR_33(CODE[5]), STR_34(CODE[5]), STR_35(CODE[1]), 
;!		 -> STR_36(CODE[1]), STR_37(CODE[7]), STR_38(CODE[8]), STR_39(CODE[1]), 
;!		 -> STR_40(CODE[1]), STR_41(CODE[1]), STR_42(CODE[4]), STR_43(CODE[5]), 
;!		 -> STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), STR_47(CODE[2]), 
;!		 -> STR_48(CODE[4]), STR_49(CODE[1]), STR_50(CODE[1]), STR_51(CODE[1]), 
;!		 -> STR_52(CODE[5]), STR_53(CODE[5]), STR_54(CODE[1]), STR_55(CODE[1]), 
;!		 -> STR_56(CODE[1]), STR_57(CODE[6]), STR_58(CODE[6]), STR_59(CODE[9]), 
;!		 -> STR_60(CODE[1]), STR_61(CODE[1]), value_back(BANK0[5]), value_clock_display(BANK3[10]), 
;!		 -> value_clock_enable(BANK3[10]), value_display(BANK0[10]), value_enable(BANK2[10]), value_end_runtime(BANK3[10]), 
;!		 -> value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), 
;!		 -> value_high_temp(BANK3[10]), value_highbp(BANK3[10]), value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), 
;!		 -> value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), 
;!		 -> value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), 
;!		 -> value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), value_sensor(BANK2[12]), 
;!		 -> value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    temp_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[10]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), 
;!		 -> STR_69(CODE[10]), STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), 
;!		 -> STR_73(CODE[13]), STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), 
;!		 -> STR_77(CODE[8]), STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), 
;!		 -> STR_81(CODE[7]), STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), 
;!		 -> STR_89(CODE[5]), STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[5]), STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    temp_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_relay_pulse(BANK2[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK2[40]), 
;!		 -> main@buf_623(BANK2[30]), menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1512(BANK1[50]), menu_handle_button@buf_1534(BANK1[50]), 
;!		 -> menu_handle_button@buf_1544(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1478(BANK1[50]), menu_handle_encoder@buf_1481(BANK1[50]), 
;!		 -> menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), 
;!		 -> STR_1(CODE[28]), STR_10(CODE[19]), STR_115(CODE[29]), STR_13(CODE[20]), 
;!		 -> STR_14(CODE[15]), STR_15(CODE[26]), STR_174(CODE[31]), STR_18(CODE[22]), 
;!		 -> STR_19(CODE[20]), STR_2(CODE[23]), STR_20(CODE[21]), STR_21(CODE[33]), 
;!		 -> STR_24(CODE[36]), STR_244(CODE[27]), STR_25(CODE[20]), STR_257(CODE[25]), 
;!		 -> STR_26(CODE[21]), STR_262(CODE[20]), STR_5(CODE[22]), STR_6(CODE[19]), 
;!		 -> STR_7(CODE[24]), STR_8(CODE[22]), STR_9(CODE[22]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK2[40]), 
;!		 -> main@buf_623(BANK2[30]), menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1512(BANK1[50]), menu_handle_button@buf_1534(BANK1[50]), 
;!		 -> menu_handle_button@buf_1544(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1478(BANK1[50]), menu_handle_encoder@buf_1481(BANK1[50]), 
;!		 -> menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), 
;!		 -> STR_1(CODE[28]), STR_10(CODE[19]), STR_115(CODE[29]), STR_13(CODE[20]), 
;!		 -> STR_14(CODE[15]), STR_15(CODE[26]), STR_174(CODE[31]), STR_18(CODE[22]), 
;!		 -> STR_19(CODE[20]), STR_2(CODE[23]), STR_20(CODE[21]), STR_21(CODE[33]), 
;!		 -> STR_24(CODE[36]), STR_244(CODE[27]), STR_25(CODE[20]), STR_257(CODE[25]), 
;!		 -> STR_26(CODE[21]), STR_262(CODE[20]), STR_5(CODE[22]), STR_6(CODE[19]), 
;!		 -> STR_7(CODE[24]), STR_8(CODE[22]), STR_9(CODE[22]), 
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
;! (0) _main                                                78    78      0  975391
;!                                             70 COMRAM     2     2      0
;!                                              0 BANK2     76    76      0
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
;! (1) _menu_update_edit_value                              31    31      0   36641
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
;! (1) _menu_handle_encoder                                172   170      2  284431
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
;! (2) _handle_time_rotation                                53    53      0   25011
;!                                              0 BANK0     53    53      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _handle_numeric_rotation                             57    57      0   25364
;!                                              0 BANK0     57    57      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                 235   235      0  353517
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
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_input_menu                                  90    90      0   40122
;!                                             57 COMRAM     1     1      0
;!                                              0 BANK0     89    89      0
;!                            ___lwdiv
;!                            ___lwmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_clock_menu                                  58    58      0   33951
;!                                             57 COMRAM     2     2      0
;!                                              0 BANK0     56    56      0
;!                            ___lbdiv
;!                            ___lbmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_time_value                             111   111      0   63050
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
;! (2) _menu_draw_input                                     51    51      0   58683
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
;! (2) _init_time_editor                                    63    60      3   30330
;!                                             57 COMRAM     3     0      3
;!                                              0 BANK0     60    60      0
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    4063
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
;! (1) _sprintf                                             35    23     12   20622
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
;!                   _relay_timer_tick
;!                          i2___lwmod
;! ---------------------------------------------------------------------------------
;! (9) i2___lwmod                                            5     1      4     211
;!                                              0 COMRAM     5     1      4
;! ---------------------------------------------------------------------------------
;! (9) _relay_timer_tick                                     0     0      0       0
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
;!   _relay_timer_tick
;!   i2___lwmod
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BIGRAM             F7F      0     180      50        9.7%
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
;!BANK4              100      0      80      13       50.0%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100      0      DC      11       85.9%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100     4C      FB       9       98.0%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100     E6      FF       7       99.6%
;!BITBANK15           80      0       0      34        0.0%
;!BANK15              80      0       0      35        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80     6E      7D       5       97.7%
;!BITCOMRAM           7E      0       0       0        0.0%
;!COMRAM              7E     48      66       1       81.0%
;!BITBIGSFRhhhhlh     1A      0       0      37        0.0%
;!BITBIGSFRhhhhh       D      0       0      36        0.0%
;!BITBIGSFRhhhlhl      C      0       0      40        0.0%
;!BITBIGSFRhhhll       8      0       0      41        0.0%
;!BITBIGSFRhlhhll      7      0       0      44        0.0%
;!BITBIGSFRhhlh        7      0       0      42        0.0%
;!BITBIGSFRlh          6      0       0      47        0.0%
;!BITBIGSFRhll         6      0       0      46        0.0%
;!BITBIGSFRll          6      0       0      48        0.0%
;!BITBIGSFRhhhlhh      3      0       0      39        0.0%
;!BITBIGSFRhlhl        2      0       0      45        0.0%
;!BITBIGSFRhhhhll      1      0       0      38        0.0%
;!BITBIGSFRhhll        1      0       0      43        0.0%
;!BIGSFR               0      0       0     200        0.0%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0     439      49        0.0%
;!DATA                 0      0     5B9       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 240 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            30   40[BANK2 ] unsigned char [30]
;;  current_even    1   73[BANK2 ] unsigned char 
;;  buf            40    0[BANK2 ] unsigned char [40]
;;  delta           2   74[BANK2 ] int 
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
	line	240
global __ptext0
__ptext0:
psect	text0
	file	"src\main.c"
	line	240
	
_main:
;incstack = 0
	callstack 22
	line	243
	
l11422:
	call	_system_init	;wreg free
	line	244
	
l11424:
	call	_eeprom_init	;wreg free
	line	251
	
l11426:; BSR set to: 4

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
	line	253
	
l11428:
	call	_uart_init	;wreg free
	line	254
	
l11430:
	call	_encoder_init	;wreg free
	line	255
	
l11432:
	call	_menu_init	;wreg free
	line	256
	
l11434:; BSR set to: 2

	call	_lcd_init	;wreg free
	line	258
	
l11436:
		movlw	low(STR_1)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_1)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	259
	
l11438:
		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	261
	
l11440:
	call	_lcd_clear	;wreg free
	line	262
	
l11442:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	263
	
l11444:
		movlw	low(STR_3)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_3)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	264
	
l11446:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	265
	
l11448:
		movlw	low(STR_4)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_4)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	267
	
l11450:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	268
	
l11452:
		movlw	low(STR_6)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_6)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	269
	
l11454:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	271
	
l11456:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	272
	
l11458:
	asmopt push
asmopt off
movlw  5
movwf	(??_main+0+0+1)^00h,c
movlw	15
movwf	(??_main+0+0)^00h,c
	movlw	241
u16047:
decfsz	wreg,f
	bra	u16047
	decfsz	(??_main+0+0)^00h,c,f
	bra	u16047
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u16047
	nop
asmopt pop

	line	273
	
l11460:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	275
	
l11462:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	276
	
l11464:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	278
	
l11466:
	asmopt push
asmopt off
movlw  41
movwf	(??_main+0+0+1)^00h,c
movlw	150
movwf	(??_main+0+0)^00h,c
	movlw	127
u16057:
decfsz	wreg,f
	bra	u16057
	decfsz	(??_main+0+0)^00h,c,f
	bra	u16057
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u16057
	nop
asmopt pop

	line	282
	
l11468:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	283
	
l11470:; BSR set to: 2

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	285
	
l11472:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	286
	
l11474:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	289
	
l11476:
	movlw	high(0)
	movlb	2	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	290
	
l11478:; BSR set to: 2

	movlw	low(0)
	movwf	((main@last_button))&0ffh
	line	297
	
l11480:
	movlb	2	; () banked
	movf	((main@last_encoder))&0ffh,w
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u15620
movf	((main@last_encoder+1))&0ffh,w
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u15621
	goto	u15620

u15621:
	goto	l11538
u15620:
	line	299
	
l11482:; BSR set to: 2

	movf	((main@last_encoder))&0ffh,w
	subwf	((_encoder_count))&0ffh,w	;volatile
	movwf	((main@delta))&0ffh
	movf	((main@last_encoder+1))&0ffh,w
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movwf	1+((main@delta))&0ffh
	line	302
	
l11484:; BSR set to: 2

	movlw	high(01h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	305
	
l11486:
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
	line	306
	
l11488:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	308
	
l11490:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	311
	
l11492:
	movlw	high(01F4h)
	movlb	2	; () banked
	movwf	((main@encoder_activity_timer+1))&0ffh
	movlw	low(01F4h)
	movwf	((main@encoder_activity_timer))&0ffh
	line	314
	
l11494:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15631
	goto	u15630
u15631:
	goto	l198
u15630:
	line	316
	
l11496:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	317
	
l198:; BSR set to: 2

	line	320
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15641
	goto	u15640
u15641:
	goto	l11508
u15640:
	
l11498:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15651
	goto	u15650

u15651:
	goto	l11508
u15650:
	line	322
	
l11500:; BSR set to: 2

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
	goto	u15661
	goto	u15660
u15661:
	goto	l11504
u15660:
	line	325
	
l11502:
	movlb	2	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_numeric_rotation
	line	326
	goto	l11512
	line	327
	
l11504:
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
	goto	u15671
	goto	u15670
u15671:
	goto	l11508
u15670:
	line	330
	
l11506:
	movlb	2	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_time_rotation
	line	331
	call	_menu_update_time_value	;wreg free
	line	332
	goto	l11512
	line	336
	
l11508:
	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	line	346
	
l11512:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15681
	goto	u15680
u15681:
	goto	l11526
u15680:
	
l11514:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15691
	goto	u15690

u15691:
	goto	l11526
u15690:
	line	349
	
l11516:; BSR set to: 2

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
	goto	u15701
	goto	u15700
u15701:
	goto	l11520
u15700:
	line	352
	
l11518:
	call	_menu_update_numeric_value	;wreg free
	line	353
	goto	l11538
	line	354
	
l11520:
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
	goto	u15711
	goto	u15710
u15711:
	goto	l11524
u15710:
	line	357
	
l11522:
	call	_menu_update_time_value	;wreg free
	line	358
	goto	l11538
	line	362
	
l11524:
	call	_menu_update_edit_value	;wreg free
	goto	l11538
	line	368
	
l11526:; BSR set to: 2

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15721
	goto	u15720
u15721:
	goto	l11530
u15720:
	line	370
	
l11528:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	371
	goto	l11538
	line	372
	
l11530:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15731
	goto	u15730

u15731:
	goto	l11534
u15730:
	line	374
	
l11532:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	line	375
	goto	l11538
	line	376
	
l11534:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15741
	goto	u15740

u15741:
	goto	l11538
u15740:
	line	378
	
l11536:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	384
	
l11538:
	movlb	2	; () banked
	movf	((main@last_button))&0ffh,w
xorwf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u15751
	goto	u15750

u15751:
	goto	l11614
u15750:
	line	386
	
l11540:; BSR set to: 2

	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u15761
	goto	u15760
u15761:
	goto	l11610
u15760:
	line	388
	
l11542:; BSR set to: 2

	movff	(_button_event),(main@current_event)	;volatile
	line	389
	
l11544:; BSR set to: 2

	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	392
	
l11546:; BSR set to: 2

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
	line	393
	
l11548:
		movlw	low(main@buf_623)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_623)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	396
	
l11550:
		movlw	2
	movlb	2	; () banked
	xorwf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u15771
	goto	u15770

u15771:
	goto	l11586
u15770:
	line	398
	
l11552:; BSR set to: 2

		movlw	low(STR_13)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_13)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	401
	
l11554:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15781
	goto	u15780
u15781:
	goto	l11568
u15780:
	line	404
	
l11556:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	405
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	406
	movlw	low(0)
	movwf	(0+(_menu+08h))&0ffh
	line	410
	
l11558:; BSR set to: 2

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
	line	411
	
l11560:; BSR set to: 2

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
	line	413
	
l11562:; BSR set to: 2

		movlw	low(STR_14)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_14)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	416
	
l11564:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15791
	goto	u15790

u15791:
	goto	l11610
u15790:
	line	417
	
l11566:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	goto	l11610
	line	423
	
l11568:; BSR set to: 2

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15801
	goto	u15800
u15801:
	goto	l11574
u15800:
	line	425
	
l11570:; BSR set to: 2

	setf	((_current_menu))&0ffh
	line	426
	
l11572:; BSR set to: 2

		movlw	low(STR_15)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	427
	goto	l11610
	line	428
	
l11574:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15811
	goto	u15810

u15811:
	goto	l11580
u15810:
	line	430
	
l11576:; BSR set to: 2

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	431
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	432
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	433
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	434
	
l11578:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	435
	goto	l11610
	line	436
	
l11580:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15821
	goto	u15820

u15821:
	goto	l229
u15820:
	line	438
	
l11582:; BSR set to: 2

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	439
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	440
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	441
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	442
	
l11584:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	goto	l11610
	line	447
	
l11586:; BSR set to: 2

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15831
	goto	u15830

u15831:
	goto	l11596
u15830:
	line	449
	
l11588:; BSR set to: 2

		decf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u15841
	goto	u15840

u15841:
	goto	l11610
u15840:
	line	451
	
l11590:; BSR set to: 2

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	452
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	453
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	454
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	455
	
l11592:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	456
	
l11594:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l11610
	line	462
	
l11596:; BSR set to: 2

	movf	((main@current_event))&0ffh,w
	
	call	_menu_handle_button
	line	465
	
l11598:
	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15851
	goto	u15850
u15851:
	goto	l11602
u15850:
	goto	l11584
	line	467
	
l11602:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15861
	goto	u15860

u15861:
	goto	l11606
u15860:
	goto	l11566
	line	469
	
l11606:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15871
	goto	u15870

u15871:
	goto	l229
u15870:
	goto	l11578
	line	471
	
l229:; BSR set to: 2

	line	473
	
l11610:
	movff	(_button_event),(main@last_button)	;volatile
	line	474
	
l11612:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	479
	
l11614:; BSR set to: 2

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15881
	goto	u15880

u15881:
	goto	l11630
u15880:
	
l11616:; BSR set to: 2

		incf	((main@last_menu_state))&0ffh,w
	btfsc	status,2
	goto	u15891
	goto	u15890

u15891:
	goto	l11630
u15890:
	line	482
	
l11618:; BSR set to: 2

	call	_lcd_clear	;wreg free
	line	483
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	484
	
l11620:
		movlw	low(STR_16)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_16)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	485
	
l11622:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	486
		movlw	low(STR_17)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_17)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	487
		movlw	low(STR_18)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_18)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	489
		movlw	low(STR_19)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_19)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	490
	
l11624:
	call	_save_current_config	;wreg free
	line	491
	
l11626:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	492
	
l11628:; BSR set to: 2

		movlw	low(STR_20)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_20)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	494
	
l11630:
	movff	(_current_menu),(main@last_menu_state)
	line	497
	
l11632:
	movlb	2	; () banked
	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfsc	status,2
	goto	u15901
	goto	u15900

u15901:
	goto	l11636
u15900:
	line	499
	
l11634:; BSR set to: 2

	decf	((main@encoder_activity_timer))&0ffh
	btfss	status,0
	decf	((main@encoder_activity_timer+1))&0ffh
	line	503
	
l11636:; BSR set to: 2

	movlw	low(01h)
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	504
	
l11638:; BSR set to: 2

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	bnz	u15910
	movlw	16
	subwf	 ((main@blink_timer))&0ffh,w
	movlw	39
	subwfb	((main@blink_timer+1))&0ffh,w
	btfss	status,0
	goto	u15911
	goto	u15910

u15911:
	goto	l11672
u15910:
	line	506
	
l11640:; BSR set to: 2

	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	507
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15921
	goto	u15920
u15921:
	goto	l11670
u15920:
	line	510
	
l11642:; BSR set to: 2

	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfss	status,2
	goto	u15931
	goto	u15930

u15931:
	goto	l11672
u15930:
	line	512
	
l11644:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u15941
	goto	u15940
u15941:
	movlw	1
	goto	u15950
u15940:
	movlw	0
u15950:
	movwf	(0+(_menu+05h))&0ffh
	line	516
	goto	l11668
	line	519
	
l11646:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	520
	goto	l11672
	line	524
	
l11648:; BSR set to: 2

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
	goto	u15961
	goto	u15960
u15961:
	goto	l11652
u15960:
	line	526
	
l11650:
	call	_menu_update_numeric_value	;wreg free
	line	527
	goto	l11672
	line	528
	
l11652:
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
	goto	u15971
	goto	u15970
u15971:
	goto	l11656
u15970:
	line	530
	
l11654:
	call	_menu_update_time_value	;wreg free
	line	531
	goto	l11672
	line	535
	
l11656:
	call	_menu_draw_input	;wreg free
	goto	l11672
	line	540
	
l11658:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	541
	goto	l11672
	line	543
	
l11660:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15981
	goto	u15980

u15981:
	goto	l11664
u15980:
	goto	l11654
	line	549
	
l11664:; BSR set to: 2

	call	_menu_draw_clock	;wreg free
	goto	l11672
	line	516
	
l11668:; BSR set to: 2

	movf	((_current_menu))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l11646
	xorlw	1^0	; case 1
	skipnz
	goto	l11648
	xorlw	2^1	; case 2
	skipnz
	goto	l11658
	xorlw	3^2	; case 3
	skipnz
	goto	l11660
	goto	l11672

	line	557
	
l11670:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	571
	
l11672:
		movlw	03h-0
	movlb	2	; () banked
	cpfslt	((_current_menu))&0ffh
	goto	u15991
	goto	u15990

u15991:
	goto	l11706
u15990:
	line	573
	
l11674:; BSR set to: 2

	movf	((_menu_timeout_flag))&0ffh,w	;volatile
	btfss	status,2
	goto	u16001
	goto	u16000
u16001:
	goto	l11706
u16000:
	line	575
	
l11676:; BSR set to: 2

		movlw	low(STR_21)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_21)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	578
	
l11678:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	579
	
l11680:
	asmopt push
asmopt off
movlw  3
movwf	(??_main+0+0+1)^00h,c
movlw	8
movwf	(??_main+0+0)^00h,c
	movlw	119
u16067:
decfsz	wreg,f
	bra	u16067
	decfsz	(??_main+0+0)^00h,c,f
	bra	u16067
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u16067
	nop
asmopt pop

	line	580
	
l11682:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	583
	
l11684:
	movlb	2	; () banked
	setf	((_current_menu))&0ffh
	line	584
	
l11686:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	585
	
l11688:; BSR set to: 2

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	586
	
l11690:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	589
	
l11692:; BSR set to: 2

	call	_lcd_clear	;wreg free
	line	590
	
l11694:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	591
	
l11696:
		movlw	low(STR_22)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_22)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	592
	
l11698:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	593
	
l11700:
		movlw	low(STR_23)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_23)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	596
	
l11702:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	597
	
l11704:; BSR set to: 2

	movlw	high(0)
	movwf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_menu_timeout_timer))^00h,c	;volatile
	line	602
	
l11706:; BSR set to: 2

	movf	((_long_press_beep_flag))&0ffh,w	;volatile
	btfsc	status,2
	goto	u16011
	goto	u16010
u16011:
	goto	l11714
u16010:
	line	604
	
l11708:; BSR set to: 2

	movlw	low(0)
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	line	605
	
l11710:; BSR set to: 2

	movlw	high(01F4h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01F4h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	606
	
l11712:
		movlw	low(STR_24)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_24)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	611
	
l11714:
	movlb	2	; () banked
	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u16021
	goto	u16020
u16021:
	goto	l11726
u16020:
	
l11716:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u16031
	goto	u16030
u16031:
	goto	l11726
u16030:
	line	613
	
l11718:; BSR set to: 2

		movlw	low(STR_25)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_25)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	614
	
l11720:
	call	_save_current_config	;wreg free
	line	615
	
l11722:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	616
	
l11724:; BSR set to: 2

		movlw	low(STR_26)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_26)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	621
	
l11726:
	asmopt push
asmopt off
	movlw	133
u16077:
decfsz	wreg,f
	bra	u16077
	nop
asmopt pop

	goto	l11480
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
;;		line 44 in file "src\main.c"
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
	line	44
global __ptext1
__ptext1:
psect	text1
	file	"src\main.c"
	line	44
	
_uart_init:
;incstack = 0
	callstack 28
	line	46
	
l7494:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	47
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	49
	
l7496:
	movlw	low(024h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	50
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	51
	movlw	low(08h)
	movwf	((c:4024))^0f00h,c	;volatile
	line	53
	movlw	low(044h)
	movwf	((c:4015))^0f00h,c	;volatile
	line	54
	movlw	low(0)
	movwf	((c:4016))^0f00h,c	;volatile
	line	55
	
l111:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
	signat	_uart_init,89
	global	_system_init

;; *************** function _system_init *****************
;; Defined at:
;;		line 80 in file "src\main.c"
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
	line	80
global __ptext2
__ptext2:
psect	text2
	file	"src\main.c"
	line	80
	
_system_init:
;incstack = 0
	callstack 28
	line	82
	
l7498:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	83
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	86
	
l129:
	line	85
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u8731
	goto	u8730
u8731:
	goto	l129
u8730:
	line	88
	
l7500:
	movlw	low(0Fh)
	movwf	((c:4033))^0f00h,c	;volatile
	line	90
	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	91
	movlw	low(0)
	movwf	((c:3978))^0f00h,c	;volatile
	line	92
	movlw	low(0)
	movwf	((c:3979))^0f00h,c	;volatile
	line	94
	
l7502:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	95
	
l7504:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	97
	
l7506:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	98
	
l7508:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	99
	
l7510:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	100
	
l7512:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	101
	
l132:
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
	
l10598:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13961
	goto	u13960

u13961:
	goto	l810
u13960:
	
l10600:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u13971
	goto	u13970
u13971:
	goto	l10602
u13970:
	goto	l810
	line	1014
	
l10602:; BSR set to: 2

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((c:menu_update_numeric_value@screen_line))^00h,c
	line	1015
		movlw	03h-1
	cpfsgt	((c:menu_update_numeric_value@screen_line))^00h,c
	goto	u13981
	goto	u13980

u13981:
	goto	l10606
u13980:
	goto	l810
	line	1020
	
l10606:; BSR set to: 2

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
	
l10608:; BSR set to: 2

	movff	(c:menu_update_numeric_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(c:menu_update_numeric_value@flow_type),(c:is_numeric_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u13991
	goto	u13990
u13991:
	goto	l10612
u13990:
	goto	l810
	line	1028
	
l10612:
	lfsr	2,(menu_update_numeric_value@value_buf)
	movlw	6-1
u14001:
	clrf	postinc2
	decf	wreg
	bc	u14001
	line	1030
	
l10614:
	movlb	2	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u14011
	goto	u14010
u14011:
	goto	l10646
u14010:
	line	1033
	
l10616:; BSR set to: 2

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14021
	goto	u14020

u14021:
	goto	l10620
u14020:
	
l10618:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14031
	goto	u14030
u14031:
	goto	l10622
u14030:
	
l10620:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1325))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1325))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1325))^00h,c
	goto	l10624
	
l10622:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1325+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1325))^00h,c
	
l10624:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1325),(c:menu_update_numeric_value@value_buf)
	line	1034
	
l10626:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14041
	goto	u14040

u14041:
	goto	l10630
u14040:
	
l10628:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14051
	goto	u14050
u14051:
	goto	l10632
u14050:
	
l10630:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1326))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1326))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1326))^00h,c
	goto	l10634
	
l10632:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1326+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1326))^00h,c
	
l10634:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1326),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1035
	
l10636:; BSR set to: 2

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14061
	goto	u14060

u14061:
	goto	l10640
u14060:
	
l10638:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14071
	goto	u14070
u14071:
	goto	l10642
u14070:
	
l10640:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1327))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1327))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1327))^00h,c
	goto	l10644
	
l10642:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1327+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1327))^00h,c
	
l10644:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1327),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1036
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+03h))^00h,c
	line	1037
	goto	l836
	line	1041
	
l10646:; BSR set to: 2

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14081
	goto	u14080
u14081:
	goto	l10650
u14080:
	
l10648:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14091
	goto	u14090
u14091:
	goto	l10658
u14090:
	
l10650:; BSR set to: 2

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u14101
	goto	u14100
u14101:
	goto	l10654
u14100:
	
l10652:; BSR set to: 2

	movlw	high(02Bh)
	movwf	((c:_menu_update_numeric_value$1329+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_menu_update_numeric_value$1329))^00h,c
	goto	l10656
	
l10654:; BSR set to: 2

	movlw	high(02Dh)
	movwf	((c:_menu_update_numeric_value$1329+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_menu_update_numeric_value$1329))^00h,c
	
l10656:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1329),(c:_menu_update_numeric_value$1328)
	movff	(c:_menu_update_numeric_value$1329+1),(c:_menu_update_numeric_value$1328+1)
	goto	l10660
	
l10658:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1328+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1328))^00h,c
	
l10660:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1328),(c:menu_update_numeric_value@value_buf)
	line	1042
	
l10662:; BSR set to: 2

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14111
	goto	u14110

u14111:
	goto	l10666
u14110:
	
l10664:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14121
	goto	u14120
u14121:
	goto	l10668
u14120:
	
l10666:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1330))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1330))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1330))^00h,c
	goto	l10670
	
l10668:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1330+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1330))^00h,c
	
l10670:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1330),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1043
	
l10672:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14131
	goto	u14130

u14131:
	goto	l10676
u14130:
	
l10674:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14141
	goto	u14140
u14141:
	goto	l10678
u14140:
	
l10676:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1331))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1331))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1331))^00h,c
	goto	l10680
	
l10678:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1331+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1331))^00h,c
	
l10680:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1331),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1044
	
l10682:; BSR set to: 2

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14151
	goto	u14150

u14151:
	goto	l10686
u14150:
	
l10684:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u14161
	goto	u14160
u14161:
	goto	l10688
u14160:
	
l10686:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1332))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1332))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1332))^00h,c
	goto	l10690
	
l10688:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1332+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1332))^00h,c
	
l10690:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1332),0+((c:menu_update_numeric_value@value_buf)+03h)
	line	1045
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+04h))^00h,c
	line	1046
	
l836:; BSR set to: 2

	line	1049
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u14171
	goto	u14170
u14171:
	goto	l10694
u14170:
	
l10692:; BSR set to: 2

	movlw	high(0Eh)
	movwf	((c:_menu_update_numeric_value$1334+1))^00h,c
	movlw	low(0Eh)
	movwf	((c:_menu_update_numeric_value$1334))^00h,c
	goto	l10696
	
l10694:; BSR set to: 2

	movlw	high(0Fh)
	movwf	((c:_menu_update_numeric_value$1334+1))^00h,c
	movlw	low(0Fh)
	movwf	((c:_menu_update_numeric_value$1334))^00h,c
	
l10696:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1334),(c:menu_update_numeric_value@start_col)
	line	1051
	
l10698:; BSR set to: 2

	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1052
	
l10700:
		movlw	low(STR_181)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_181)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1054
	
l10702:
	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1055
	
l10704:
		movlw	low(STR_182)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_182)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1056
	
l10706:
		movlw	low(menu_update_numeric_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1057
	
l10708:
		movlw	low(STR_183)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_183)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1058
	
l810:
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
	
l10710:
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
	
l10712:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u14181
	goto	u14180
u14181:
	goto	l788
u14180:
	
l10714:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u14191
	goto	u14190

u14191:
	goto	l10716
u14190:
	goto	l788
	line	955
	
l10716:; BSR set to: 2

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@screen_line))&0ffh
	line	956
		movlw	03h-1
	cpfsgt	((menu_update_edit_value@screen_line))&0ffh
	goto	u14201
	goto	u14200

u14201:
	goto	l10720
u14200:
	goto	l788
	line	960
	
l10720:; BSR set to: 0

	movff	(menu_update_edit_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_update_edit_value@flow_type),(c:is_numeric_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u14211
	goto	u14210
u14211:
	goto	l10724
u14210:
	goto	l788
	line	965
	
l10724:
	movlb	2	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u14221
	goto	u14220
u14221:
	goto	l10728
u14220:
	line	967
	
l10726:; BSR set to: 2

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_176)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_176)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+0Ah),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	968
	goto	l10736
	line	973
	
l10728:; BSR set to: 2

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u14231
	goto	u14230
u14231:
	goto	l10732
u14230:
	
l10730:; BSR set to: 2

	movlw	high(02Bh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1310+1))&0ffh
	movlw	low(02Bh)
	movwf	((_menu_update_edit_value$1310))&0ffh
	goto	l10734
	
l10732:; BSR set to: 2

	movlw	high(02Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1310+1))&0ffh
	movlw	low(02Dh)
	movwf	((_menu_update_edit_value$1310))&0ffh
	
l10734:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_177)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_177)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu_update_edit_value$1310),0+((c:?_sprintf)+04h)
	movff	(_menu_update_edit_value$1310+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+0Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	call	_sprintf	;wreg free
	line	978
	
l10736:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@from))^00h,c
	clrf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	980
	
l10738:
	movlb	2	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u14241
	goto	u14240
u14241:
	goto	l10748
u14240:
	line	983
	
l10740:; BSR set to: 2

	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u14251
	goto	u14250
u14251:
	goto	l798
u14250:
	line	984
	
l10742:; BSR set to: 2

	decf	(0+(_menu+08h))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@blink_pos))&0ffh
	goto	l10744
	line	985
	
l798:; BSR set to: 2

	line	986
	movff	0+(_menu+08h),(menu_update_edit_value@blink_pos)
	line	988
	
l10744:
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
	goto	u14261
	goto	u14260

u14261:
	goto	l10748
u14260:
	line	989
	
l10746:; BSR set to: 0

	movf	((menu_update_edit_value@blink_pos))&0ffh,w
	addlw	low(menu_update_edit_value@display_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	993
	
l10748:
	movlb	2	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u14271
	goto	u14270
u14271:
	goto	l10752
u14270:
	
l10750:; BSR set to: 2

	movlw	high(0Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1314+1))&0ffh
	movlw	low(0Dh)
	movwf	((_menu_update_edit_value$1314))&0ffh
	goto	l10754
	
l10752:; BSR set to: 2

	movlw	high(0Eh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1314+1))&0ffh
	movlw	low(0Eh)
	movwf	((_menu_update_edit_value$1314))&0ffh
	
l10754:; BSR set to: 0

	movff	(_menu_update_edit_value$1314),(menu_update_edit_value@start_col)
	line	994
	
l10756:; BSR set to: 0

	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	995
	
l10758:
		movlw	low(STR_178)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_178)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	997
	
l10760:
	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	movlb	0	; () banked
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	998
	
l10762:
		movlw	low(STR_179)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_179)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	999
	
l10764:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1000
	
l10766:
		movlw	low(STR_180)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_180)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1001
	
l788:
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
	
l7608:
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
	
l635:; BSR set to: 2

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
	
l10422:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u13581
	goto	u13580
u13581:
	goto	l10544
u13580:
	line	1446
	
l10424:; BSR set to: 2

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u13591
	goto	u13590

u13591:
	goto	l1008
u13590:
	line	1449
	
l10426:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13601
	goto	u13600

u13601:
	goto	l10488
u13600:
	line	1452
	
l10428:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_227)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_227)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(c:menu_handle_encoder@delta),0+((c:?_sprintf)+06h)
	movff	(c:menu_handle_encoder@delta+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1453
	
l10430:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1456
	
l10432:
		movlw	2
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13611
	goto	u13610

u13611:
	goto	l10438
u13610:
	line	1459
	
l10434:; BSR set to: 2

	movf	((c:menu_handle_encoder@delta))^00h,c,w
	
	call	_handle_time_rotation
	line	1460
	call	_menu_update_time_value	;wreg free
	goto	l1008
	line	1461
	
l10436:
	goto	l1008
	line	1464
	
l10438:; BSR set to: 2

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
	
l10440:; BSR set to: 1

	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13621
	goto	u13620
u13621:
	goto	l10444
u13620:
	line	1469
	
l10442:; BSR set to: 2

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
	goto	l1010
	line	1472
	
l10444:; BSR set to: 2

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13631
	goto	u13630

u13631:
	goto	l10448
u13630:
	line	1474
	
l10446:; BSR set to: 2

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
	goto	l1010
	line	1477
	
l10448:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13641
	goto	u13640

u13641:
	goto	l1010
u13640:
	line	1479
	
l10450:; BSR set to: 2

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
	
l1010:
	movlb	1	; () banked
	movf	((menu_handle_encoder@clock_opts))&0ffh,w
iorwf	((menu_handle_encoder@clock_opts+1))&0ffh,w
	btfsc	status,2
	goto	u13651
	goto	u13650

u13651:
	goto	l1008
u13650:
	
l10452:; BSR set to: 1

	movf	((menu_handle_encoder@clock_flag))&0ffh,w
iorwf	((menu_handle_encoder@clock_flag+1))&0ffh,w
	btfsc	status,2
	goto	u13661
	goto	u13660

u13661:
	goto	l1008
u13660:
	line	1485
	
l10454:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_228)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_228)
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
	
l10456:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1488
	
l10458:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13671
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u13670
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u13671
	goto	u13670

u13671:
	goto	l10466
u13670:
	line	1490
	
l10460:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	incf	indf2

	line	1491
	
l10462:
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
	goto	u13681
	goto	u13680

u13681:
	goto	l10474
u13680:
	line	1492
	
l10464:; BSR set to: 1

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	goto	l10474
	line	1494
	
l10466:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13690
	goto	u13691

u13691:
	goto	l10474
u13690:
	line	1496
	
l10468:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u13701
	goto	u13700
u13701:
	goto	l10472
u13700:
	line	1497
	
l10470:
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

	goto	l10474
	line	1499
	
l10472:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	decf	indf2

	line	1503
	
l10474:
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
	goto	u13711
	goto	u13710

u13711:
	goto	l10478
u13710:
	line	1504
	
l10476:; BSR set to: 1

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	line	1506
	
l10478:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_229)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_229)
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
	
l10480:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1510
	
l10482:
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
	
l10484:
	call	_menu_draw_clock	;wreg free
	goto	l1008
	line	1518
	
l10488:; BSR set to: 2

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
	
l10490:; BSR set to: 1

	movff	(menu_handle_encoder@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_option_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u13721
	goto	u13720
u13721:
	goto	l10522
u13720:
	line	1524
	
l10492:
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
	
l10494:
	movlb	1	; () banked
	movf	((menu_handle_encoder@edit_flag))&0ffh,w
iorwf	((menu_handle_encoder@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u13731
	goto	u13730

u13731:
	goto	l1008
u13730:
	
l10496:; BSR set to: 1

	movf	((menu_handle_encoder@opts))&0ffh,w
iorwf	((menu_handle_encoder@opts+1))&0ffh,w
	btfsc	status,2
	goto	u13741
	goto	u13740

u13741:
	goto	l1008
u13740:
	line	1529
	
l10498:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13751
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u13750
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u13751
	goto	u13750

u13751:
	goto	l10506
u13750:
	line	1531
	
l10500:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	incf	indf2

	line	1532
	
l10502:; BSR set to: 1

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
	goto	u13761
	goto	u13760

u13761:
	goto	l10514
u13760:
	line	1533
	
l10504:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	goto	l10514
	line	1535
	
l10506:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13770
	goto	u13771

u13771:
	goto	l10514
u13770:
	line	1537
	
l10508:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u13781
	goto	u13780
u13781:
	goto	l10512
u13780:
	line	1538
	
l10510:; BSR set to: 1

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

	goto	l10514
	line	1540
	
l10512:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	decf	indf2

	line	1544
	
l10514:; BSR set to: 1

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
	goto	u13791
	goto	u13790

u13791:
	goto	l10518
u13790:
	line	1545
	
l10516:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	line	1548
	
l10518:; BSR set to: 1

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13801
	goto	u13800

u13801:
	goto	l10436
u13800:
	line	1550
	
l10520:; BSR set to: 2

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
	goto	l1008
	line	1555
	
l10522:
	movff	(menu_handle_encoder@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_numeric_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u13811
	goto	u13810
u13811:
	goto	l10532
u13810:
	line	1557
	
l10524:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13820
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u13821
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u13821
	goto	u13820

u13821:
	goto	l10528
u13820:
	
l10526:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1476))&0ffh
	setf	((_menu_handle_encoder$1476+1))&0ffh
	goto	l10530
	
l10528:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1476+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1476))&0ffh
	
l10530:; BSR set to: 1

	movf	((_menu_handle_encoder$1476))&0ffh,w
	
	call	_handle_numeric_rotation
	line	1558
	goto	l1008
	line	1559
	
l10532:
	movff	(menu_handle_encoder@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_time_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u13831
	goto	u13830
u13831:
	goto	l10436
u13830:
	line	1561
	
l10534:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13840
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u13841
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u13841
	goto	u13840

u13841:
	goto	l10538
u13840:
	
l10536:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1477))&0ffh
	setf	((_menu_handle_encoder$1477+1))&0ffh
	goto	l10540
	
l10538:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1477+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1477))&0ffh
	
l10540:; BSR set to: 1

	movf	((_menu_handle_encoder$1477))&0ffh,w
	
	call	_handle_time_rotation
	goto	l1008
	line	1568
	
l10544:; BSR set to: 2

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13851
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u13850
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u13851
	goto	u13850

u13851:
	goto	l10562
u13850:
	line	1572
	
l10546:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf_1478)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1478)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_230)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_230)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1573
	
l10548:
		movlw	low(menu_handle_encoder@buf_1478)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1478)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1576
	
l10550:
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
	goto	u13861
	goto	u13860

u13861:
	goto	l10558
u13860:
	line	1578
	
l10552:; BSR set to: 2

	incf	((_menu))&0ffh
	line	1581
	
l10554:; BSR set to: 2

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
	goto	u13871
	goto	u13870

u13871:
	goto	l10558
u13870:
	line	1583
	
l10556:; BSR set to: 2

	incf	(0+(_menu+01h))&0ffh
	line	1587
	
l10558:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf_1478)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1478)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_231)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_231)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1588
	
l10560:
		movlw	low(menu_handle_encoder@buf_1478)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1478)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1589
	goto	l10580
	line	1590
	
l10562:; BSR set to: 2

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13880
	goto	u13881

u13881:
	goto	l10580
u13880:
	line	1594
	
l10564:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf_1481)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1481)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_232)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_232)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1595
	
l10566:
		movlw	low(menu_handle_encoder@buf_1481)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1481)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1598
	
l10568:
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u13891
	goto	u13890
u13891:
	goto	l10576
u13890:
	line	1600
	
l10570:; BSR set to: 2

	decf	((_menu))&0ffh
	line	1603
	
l10572:; BSR set to: 2

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u13901
	goto	u13900

u13901:
	goto	l10576
u13900:
	line	1605
	
l10574:; BSR set to: 2

	decf	(0+(_menu+01h))&0ffh
	line	1609
	
l10576:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf_1481)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1481)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_233)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_233)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1610
	
l10578:
		movlw	low(menu_handle_encoder@buf_1481)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1481)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1614
	
l10580:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u13911
	goto	u13910
u13911:
	goto	l1008
u13910:
	line	1616
	
l10582:; BSR set to: 2

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13921
	goto	u13920
u13921:
	goto	l10586
u13920:
	line	1617
	
l10584:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	goto	l1008
	line	1618
	
l10586:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13931
	goto	u13930

u13931:
	goto	l10590
u13930:
	line	1619
	
l10588:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	goto	l1008
	line	1620
	
l10590:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13941
	goto	u13940

u13941:
	goto	l10594
u13940:
	line	1621
	
l10592:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	goto	l1008
	line	1622
	
l10594:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13951
	goto	u13950

u13951:
	goto	l10436
u13950:
	goto	l10484
	line	1625
	
l1008:
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
	
l9644:
		movlw	low(STR_115)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_115)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	456
	
l9646:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_116)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_116)
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
	
l9648:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	459
	
l9650:
	movlb	2	; () banked
	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u12561
	goto	u12560
u12561:
	goto	l9692
u12560:
	line	461
	
l9652:; BSR set to: 2

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12571
	goto	u12570

u12571:
	goto	l9674
u12570:
	line	463
	
l9654:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+012h))&0ffh
	line	465
	
l9656:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u12581
	goto	u12580

u12581:
	goto	l9664
u12580:
	
l9658:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12591
	goto	u12590

u12591:
	goto	l9664
u12590:
	
l9660:; BSR set to: 2

		movlw	03h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u12601
	goto	u12600

u12601:
	goto	l9664
u12600:
	line	466
	
l9662:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+012h))&0ffh
	goto	l9718
	line	467
	
l9664:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u12611
	goto	u12610

u12611:
	goto	l9670
u12610:
	
l9666:; BSR set to: 2

		movlw	018h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u12621
	goto	u12620

u12621:
	goto	l9670
u12620:
	goto	l9662
	line	469
	
l9670:; BSR set to: 2

		movlw	064h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u12631
	goto	u12630

u12631:
	goto	l595
u12630:
	goto	l9662
	line	474
	
l9674:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u12641
	goto	u12640
u12641:
	goto	l9690
u12640:
	line	477
	
l9676:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u12651
	goto	u12650

u12651:
	goto	l9682
u12650:
	
l9678:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12661
	goto	u12660

u12661:
	goto	l9682
u12660:
	line	478
	
l9680:; BSR set to: 2

	movlw	low(02h)
	movwf	(0+(_menu+012h))&0ffh
	goto	l9718
	line	480
	
l9682:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+010h))&0ffh,w
	btfsc	status,2
	goto	u12671
	goto	u12670

u12671:
	goto	l9686
u12670:
	
l9684:; BSR set to: 2

	movlw	high(063h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1168+1))&0ffh
	movlw	low(063h)
	movwf	((_handle_time_rotation$1168))&0ffh
	goto	l9688
	
l9686:; BSR set to: 2

	movlw	high(017h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1168+1))&0ffh
	movlw	low(017h)
	movwf	((_handle_time_rotation$1168))&0ffh
	
l9688:; BSR set to: 0

	movff	(_handle_time_rotation$1168),0+(_menu+012h)
	goto	l9718
	line	484
	
l9690:; BSR set to: 2

	decf	(0+(_menu+012h))&0ffh
	goto	l9718
	line	486
	
l595:; BSR set to: 2

	line	487
	goto	l9718
	line	488
	
l9692:; BSR set to: 2

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u12681
	goto	u12680

u12681:
	goto	l9718
u12680:
	line	491
	
l9694:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u12691
	goto	u12690

u12691:
	goto	l9704
u12690:
	
l9696:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12701
	goto	u12700

u12701:
	goto	l9704
u12700:
	
l9698:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u12711
	goto	u12710

u12711:
	goto	l9704
u12710:
	line	494
	
l9700:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l607
	line	498
	
l9704:; BSR set to: 2

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12721
	goto	u12720

u12721:
	goto	l9712
u12720:
	line	500
	
l9706:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+013h))&0ffh
	line	501
	
l9708:; BSR set to: 2

		movlw	03Ch-1
	cpfsgt	(0+(_menu+013h))&0ffh
	goto	u12731
	goto	u12730

u12731:
	goto	l9718
u12730:
	line	502
	
l9710:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l9718
	line	506
	
l9712:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	btfss	status,2
	goto	u12741
	goto	u12740
u12741:
	goto	l9716
u12740:
	line	507
	
l9714:; BSR set to: 2

	movlw	low(03Bh)
	movwf	(0+(_menu+013h))&0ffh
	goto	l9718
	line	509
	
l9716:; BSR set to: 2

	decf	(0+(_menu+013h))&0ffh
	line	513
	
l9718:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_117)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_117)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	514
	
l9720:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	515
	
l607:
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
	
l9542:
		movlw	low(STR_174)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_174)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	861
	
l9544:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_175)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_175)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+08h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Fh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	862
	
l9546:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	865
	
l9548:
	movlb	2	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u12321
	goto	u12320
u12321:
	goto	l9642
u12320:
	
l9550:; BSR set to: 2

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u12331
	goto	u12330
u12331:
	goto	l9642
u12330:
	line	867
	
l9552:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+08h))&0ffh
	goto	l9642
	line	873
	
l9554:; BSR set to: 2

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u12341
	goto	u12340
u12341:
	goto	l780
u12340:
	
l9556:; BSR set to: 2

	movlb	0	; () banked
	movf	((handle_numeric_rotation@direction))&0ffh,w
	btfsc	status,2
	goto	u12351
	goto	u12350
u12351:
	goto	l780
u12350:
	line	875
	
l9558:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u12361
	goto	u12360
u12361:
	movlw	1
	goto	u12370
u12360:
	movlw	0
u12370:
	movwf	(0+(_menu+09h))&0ffh
	goto	l780
	line	880
	
l9560:; BSR set to: 2

	movlb	0	; () banked
		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12381
	goto	u12380

u12381:
	goto	l9568
u12380:
	line	882
	
l9562:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+0Ah))&0ffh
	line	883
	
l9564:; BSR set to: 2

		movlw	06h-1
	cpfsgt	(0+(_menu+0Ah))&0ffh
	goto	u12391
	goto	u12390

u12391:
	goto	l780
u12390:
	line	884
	
l9566:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l780
	line	886
	
l9568:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u12400
	goto	u12401

u12401:
	goto	l780
u12400:
	line	888
	
l9570:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u12411
	goto	u12410
u12411:
	goto	l9574
u12410:
	line	889
	
l9572:; BSR set to: 2

	movlw	low(05h)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l780
	line	891
	
l9574:; BSR set to: 2

	decf	(0+(_menu+0Ah))&0ffh
	goto	l780
	line	897
	
l9576:; BSR set to: 2

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u12421
	goto	u12420

u12421:
	goto	l9580
u12420:
	
l9578:; BSR set to: 2

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1299+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1299))&0ffh
	goto	l9582
	
l9580:; BSR set to: 2

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1299+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1299))&0ffh
	
l9582:; BSR set to: 0

	movff	(_handle_numeric_rotation$1299),(handle_numeric_rotation@max_tens)
	line	898
	
l9584:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12431
	goto	u12430

u12431:
	goto	l9596
u12430:
	line	900
	
l9586:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u12441
	goto	u12440
u12441:
	goto	l9590
u12440:
	goto	l780
	line	902
	
l9590:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+0Bh))&0ffh
	line	903
	
l9592:; BSR set to: 2

		movf	(0+(_menu+0Bh))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfsc	status,0
	goto	u12451
	goto	u12450

u12451:
	goto	l780
u12450:
	line	904
	
l9594:; BSR set to: 0

	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	goto	l780
	line	906
	
l9596:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u12460
	goto	u12461

u12461:
	goto	l780
u12460:
	line	908
	
l9598:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u12471
	goto	u12470
u12471:
	goto	l9602
u12470:
	goto	l780
	line	910
	
l9602:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+0Bh))&0ffh,w
	btfss	status,2
	goto	u12481
	goto	u12480
u12481:
	goto	l9606
u12480:
	line	911
	
l9604:; BSR set to: 2

	movff	(handle_numeric_rotation@max_tens),0+(_menu+0Bh)
	goto	l780
	line	913
	
l9606:; BSR set to: 2

	decf	(0+(_menu+0Bh))&0ffh
	goto	l780
	line	920
	
l9608:; BSR set to: 2

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u12491
	goto	u12490

u12491:
	goto	l9612
u12490:
	
l9610:; BSR set to: 2

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1301+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1301))&0ffh
	goto	l9614
	
l9612:; BSR set to: 2

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1301+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1301))&0ffh
	
l9614:; BSR set to: 0

	movff	(_handle_numeric_rotation$1301),(handle_numeric_rotation@max_units)
	line	921
	
l9616:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12501
	goto	u12500

u12501:
	goto	l9628
u12500:
	line	923
	
l9618:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u12511
	goto	u12510
u12511:
	goto	l9622
u12510:
	goto	l780
	line	925
	
l9622:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+0Ch))&0ffh
	line	926
	
l9624:; BSR set to: 2

		movf	(0+(_menu+0Ch))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_units))&0ffh,w
	btfsc	status,0
	goto	u12521
	goto	u12520

u12521:
	goto	l780
u12520:
	line	927
	
l9626:; BSR set to: 0

	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	goto	l780
	line	929
	
l9628:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u12530
	goto	u12531

u12531:
	goto	l780
u12530:
	line	931
	
l9630:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u12541
	goto	u12540
u12541:
	goto	l9634
u12540:
	goto	l780
	line	933
	
l9634:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+0Ch))&0ffh,w
	btfss	status,2
	goto	u12551
	goto	u12550
u12551:
	goto	l9638
u12550:
	line	934
	
l9636:; BSR set to: 2

	movff	(handle_numeric_rotation@max_units),0+(_menu+0Ch)
	goto	l780
	line	936
	
l9638:; BSR set to: 2

	decf	(0+(_menu+0Ch))&0ffh
	goto	l780
	line	870
	
l9642:; BSR set to: 2

	movf	(0+(_menu+08h))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l9554
	xorlw	1^0	; case 1
	skipnz
	goto	l9560
	xorlw	2^1	; case 2
	skipnz
	goto	l9576
	xorlw	3^2	; case 3
	skipnz
	goto	l9608
	goto	l780

	line	941
	
l780:
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
	
l10768:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u14281
	goto	u14280
u14281:
	goto	l11142
u14280:
	line	1638
	
l10770:; BSR set to: 2

	movlb	1	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u14291
	goto	u14290

u14291:
	goto	l11132
u14290:
	line	1641
	
l10772:; BSR set to: 1

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14301
	goto	u14300

u14301:
	goto	l10876
u14300:
	line	1646
	
l10774:; BSR set to: 2

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_234)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_234)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1647
	
l10776:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1650
	
l10778:
		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1651
	
l10780:; BSR set to: 1

		movlw	low(0)
	movwf	((menu_handle_button@edit_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@edit_flag+1))&0ffh

	line	1653
	
l10782:; BSR set to: 1

	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14311
	goto	u14310
u14311:
	goto	l10792
u14310:
	line	1655
	
l10784:; BSR set to: 2

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
	
l10786:; BSR set to: 1

	movff	(c:_enable_edit_flag),(_system_config)
	line	1658
	
l10788:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_235)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_235)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1659
	
l10790:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1660
	goto	l1071
	line	1661
	
l10792:; BSR set to: 2

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14321
	goto	u14320

u14321:
	goto	l10802
u14320:
	line	1663
	
l10794:; BSR set to: 2

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
	
l10796:; BSR set to: 1

	movff	(c:_relay_high_edit_flag),0+(_system_config+06h)
	line	1666
	
l10798:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_236)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_236)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+06h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	goto	l10790
	line	1669
	
l10802:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14331
	goto	u14330

u14331:
	goto	l10854
u14330:
	line	1672
	
l10804:; BSR set to: 2

	incf	(0+(_menu+011h))&0ffh
	line	1673
	
l10806:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	1676
	
l10808:; BSR set to: 2

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u14341
	goto	u14340

u14341:
	goto	l10814
u14340:
	
l10810:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u14351
	goto	u14350

u14351:
	goto	l10814
u14350:
	line	1678
	
l10812:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	line	1681
	
l10814:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1683
	
l10816:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_237)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_237)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1684
	
l10818:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1687
	
l10820:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_238)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_238)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1688
	
l10822:
	call	_menu_draw_clock	;wreg free
	line	1690
	
l10824:
		movlw	02h-1
	movlb	2	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u14361
	goto	u14360

u14361:
	goto	l1080
u14360:
	line	1693
	
l10826:; BSR set to: 2

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
	
l10828:; BSR set to: 1

	movf	((menu_handle_button@new_value))&0ffh,w
iorwf	((menu_handle_button@new_value+1))&0ffh,w
	btfss	status,2
	goto	u14371
	goto	u14370

u14371:
	goto	l10832
u14370:
	line	1697
	
l10830:; BSR set to: 1

	movlw	high(01h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(01h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	1698
	
l10832:; BSR set to: 1

		movf	((menu_handle_button@new_value+1))&0ffh,w
	bnz	u14380
	movlw	121
	subwf	 ((menu_handle_button@new_value))&0ffh,w
	btfss	status,0
	goto	u14381
	goto	u14380

u14381:
	goto	l10836
u14380:
	line	1699
	
l10834:; BSR set to: 1

	movlw	high(078h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(078h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	1701
	
l10836:; BSR set to: 1

	movff	(menu_handle_button@new_value),0+(_system_config+07h)
	line	1704
	
l10838:; BSR set to: 1

		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_239)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_239)
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
	
l10840:
		movff	0+(_clock_menu+0Ch),(c:strcpy@to)
	movff	1+(_clock_menu+0Ch),(c:strcpy@to+1)

		movlw	low(_value_relay_pulse)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1707
	
l10842:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_240)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_240)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+07h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1708
	
l10844:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1709
	
l10846:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1710
	
l10848:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	1711
	
l10850:
	call	_menu_draw_clock	;wreg free
	line	1712
	goto	l1080
	line	1713
	
l1076:
	line	1715
	goto	l1080
	line	1720
	
l10854:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14391
	goto	u14390

u14391:
	goto	l1071
u14390:
	line	1722
	
l10856:; BSR set to: 2

		movlw	low(_menu_item_options+03Ch)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1723
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	1727
	
l1071:
	movlb	1	; () banked
	movf	((menu_handle_button@opts))&0ffh,w
iorwf	((menu_handle_button@opts+1))&0ffh,w
	btfsc	status,2
	goto	u14401
	goto	u14400

u14401:
	goto	l10870
u14400:
	
l10858:; BSR set to: 1

	movf	((menu_handle_button@edit_flag))&0ffh,w
iorwf	((menu_handle_button@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u14411
	goto	u14410

u14411:
	goto	l10870
u14410:
	
l10860:; BSR set to: 1

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
	goto	u14421
	goto	u14420
u14421:
	goto	l10870
u14420:
	line	1729
	
l10862:; BSR set to: 1

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
	line	1730
	
l10864:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1731
	
l10866:; BSR set to: 2

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_241)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_241)
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
	line	1732
	
l10868:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1735
	
l10870:
	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1736
	
l10872:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1080
	line	1741
	
l10876:; BSR set to: 2

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
	line	1742
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
	line	1745
	
l10878:; BSR set to: 1

	movff	(menu_handle_button@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_option_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u14431
	goto	u14430
u14431:
	goto	l10982
u14430:
	line	1747
	
l10880:
	movff	(menu_handle_button@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1506)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1506+1)
	line	1748
	movff	(menu_handle_button@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1507)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1507+1)
	line	1750
	
l10882:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag_1506))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1506+1))&0ffh,w
	btfsc	status,2
	goto	u14441
	goto	u14440

u14441:
	goto	l10870
u14440:
	
l10884:; BSR set to: 1

	movf	((menu_handle_button@opts_1507))&0ffh,w
iorwf	((menu_handle_button@opts_1507+1))&0ffh,w
	btfsc	status,2
	goto	u14451
	goto	u14450

u14451:
	goto	l10870
u14450:
	line	1753
	
l10886:; BSR set to: 1

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
	movff	(menu_handle_button@edit_flag_1506),fsr2l
	movff	(menu_handle_button@edit_flag_1506+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movf	((??_menu_handle_button+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_handle_button+1+0
	movff	prodh,??_menu_handle_button+1+0+1
	movf	(??_menu_handle_button+1+0)^00h,c,w
	movlb	1	; () banked
	addwf	((menu_handle_button@opts_1507))&0ffh,w
	movwf	(??_menu_handle_button+3+0)^00h,c
	movf	(??_menu_handle_button+1+1)^00h,c,w
	addwfc	((menu_handle_button@opts_1507+1))&0ffh,w
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
	line	1756
	
l10888:
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14461
	goto	u14460
u14461:
	goto	l10892
u14460:
	line	1758
	
l10890:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_enable_edit_flag),indf2

	line	1759
	goto	l10976
	line	1760
	
l10892:; BSR set to: 2

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14471
	goto	u14470

u14471:
	goto	l10904
u14470:
	line	1762
	
l10894:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_sensor_edit_flag),indf2

	line	1765
	
l10896:; BSR set to: 2

		movlw	2
	xorwf	((c:_sensor_edit_flag))^00h,c,w
	btfss	status,2
	goto	u14481
	goto	u14480

u14481:
	goto	l10902
u14480:
	
l10898:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfsc	status,2
	goto	u14491
	goto	u14490

u14491:
	goto	l10902
u14490:
	line	1767
	
l10900:; BSR set to: 1

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
	line	1771
	
l10902:
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	1772
	goto	l10976
	line	1773
	
l10904:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14501
	goto	u14500

u14501:
	goto	l10912
u14500:
	
l10906:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14511
	goto	u14510

u14511:
	goto	l10912
u14510:
	line	1775
	
l10908:; BSR set to: 1

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

	line	1778
	
l10910:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	1779
	goto	l10976
	line	1780
	
l10912:
		movlw	3
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14521
	goto	u14520

u14521:
	goto	l10920
u14520:
	
l10914:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14531
	goto	u14530

u14531:
	goto	l10920
u14530:
	
l10916:; BSR set to: 1

		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14541
	goto	u14540

u14541:
	goto	l10920
u14540:
	goto	l10976
	line	1783
	
l10918:
	goto	l10976
	line	1784
	
l10920:
		movlw	3
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14551
	goto	u14550

u14551:
	goto	l10928
u14550:
	
l10922:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14561
	goto	u14560

u14561:
	goto	l10928
u14560:
	
l10924:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14571
	goto	u14570
u14571:
	goto	l10928
u14570:
	line	1786
	
l10926:; BSR set to: 1

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

	line	1787
	goto	l10976
	line	1788
	
l10928:
	movlb	1	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14581
	goto	u14580
u14581:
	goto	l10946
u14580:
	line	1790
	
l10930:; BSR set to: 1

		movlw	9
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14591
	goto	u14590

u14591:
	goto	l10934
u14590:
	line	1791
	
l10932:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+038h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+038h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_high_edit_flag),indf2

	goto	l10976
	line	1792
	
l10934:; BSR set to: 2

		movlw	10
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14601
	goto	u14600

u14601:
	goto	l10938
u14600:
	line	1793
	
l10936:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+039h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+039h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_plp_edit_flag),indf2

	goto	l10976
	line	1794
	
l10938:; BSR set to: 2

		movlw	11
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14611
	goto	u14610

u14611:
	goto	l10942
u14610:
	line	1795
	
l10940:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_slp_edit_flag),indf2

	goto	l10976
	line	1796
	
l10942:; BSR set to: 2

		movlw	12
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14621
	goto	u14620

u14621:
	goto	l10918
u14620:
	line	1797
	
l10944:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_display_edit_flag),indf2

	goto	l10976
	line	1799
	
l10946:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14631
	goto	u14630

u14631:
	goto	l10956
u14630:
	line	1801
	
l10948:; BSR set to: 1

		movlw	6
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14641
	goto	u14640

u14641:
	goto	l10952
u14640:
	goto	l10932
	line	1803
	
l10952:; BSR set to: 2

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14651
	goto	u14650

u14651:
	goto	l10918
u14650:
	goto	l10944
	line	1806
	
l10956:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14661
	goto	u14660

u14661:
	goto	l10918
u14660:
	line	1808
	
l10958:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14671
	goto	u14670
u14671:
	goto	l10968
u14670:
	line	1810
	
l10960:; BSR set to: 1

		movlw	8
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14681
	goto	u14680

u14681:
	goto	l10964
u14680:
	line	1811
	
l10962:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Bh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Bh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_low_edit_flag),indf2

	goto	l10976
	line	1812
	
l10964:; BSR set to: 2

		movlw	9
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14691
	goto	u14690

u14691:
	goto	l10918
u14690:
	goto	l10944
	line	1817
	
l10968:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14701
	goto	u14700

u14701:
	goto	l10972
u14700:
	goto	l10962
	line	1819
	
l10972:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14711
	goto	u14710

u14711:
	goto	l10918
u14710:
	goto	l10944
	line	1824
	
l10976:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	goto	l10870
	line	1831
	
l10982:
	movff	(menu_handle_button@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_time_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u14721
	goto	u14720
u14721:
	goto	l11046
u14720:
	line	1833
	
l10984:
	movlb	2	; () banked
	incf	(0+(_menu+011h))&0ffh
	line	1834
	
l10986:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	1835
	
l10988:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1838
	
l10990:
		movlw	low(menu_handle_button@buf_1512)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1512)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_242)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_242)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1839
	
l10992:
		movlw	low(menu_handle_button@buf_1512)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1512)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1841
	
l10994:
	call	_menu_update_time_value	;wreg free
	line	1843
	
l10996:
		movlw	02h-1
	movlb	2	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u14731
	goto	u14730

u14731:
	goto	l1080
u14730:
	line	1847
	
l10998:; BSR set to: 2

	movf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u14741
	goto	u14740
u14741:
	goto	l11002
u14740:
	line	1848
	
l11000:; BSR set to: 2

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
	goto	l11004
	line	1850
	
l11002:; BSR set to: 2

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
	line	1853
	
l11004:; BSR set to: 1

	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14751
	goto	u14750
u14751:
	goto	l11018
u14750:
	line	1855
	
l11006:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14761
	goto	u14760

u14761:
	goto	l11010
u14760:
	line	1856
	
l11008:; BSR set to: 2

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
	goto	l11038
	line	1857
	
l11010:; BSR set to: 2

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14771
	goto	u14770

u14771:
	goto	l11014
u14770:
	line	1858
	
l11012:; BSR set to: 2

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
	goto	l11038
	line	1859
	
l11014:; BSR set to: 2

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14781
	goto	u14780

u14781:
	goto	l1127
u14780:
	line	1860
	
l11016:; BSR set to: 2

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
	goto	l11038
	line	1861
	
l1127:; BSR set to: 2

	goto	l11038
	line	1862
	
l11018:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14791
	goto	u14790

u14791:
	goto	l11024
u14790:
	line	1864
	
l11020:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14801
	goto	u14800

u14801:
	goto	l11038
u14800:
	goto	l11008
	line	1867
	
l11024:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14811
	goto	u14810

u14811:
	goto	l11038
u14810:
	line	1869
	
l11026:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14821
	goto	u14820
u14821:
	goto	l11032
u14820:
	
l11028:; BSR set to: 1

		movlw	7
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14831
	goto	u14830

u14831:
	goto	l11032
u14830:
	line	1870
	
l11030:; BSR set to: 2

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
	goto	l11038
	line	1871
	
l11032:
	movlb	1	; () banked
		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14841
	goto	u14840

u14841:
	goto	l11038
u14840:
	
l11034:; BSR set to: 1

		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14851
	goto	u14850

u14851:
	goto	l11038
u14850:
	goto	l11030
	line	1877
	
l11038:
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
		movlw	low(STR_243)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_243)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1879
	
l11040:
	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1880
	
l11042:; BSR set to: 2

	movlw	low(01h)
	movwf	((_save_pending))&0ffh
	line	1881
	
l11044:; BSR set to: 2

		movlw	low(STR_244)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_244)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1080
	line	1885
	
l11046:
	movff	(menu_handle_button@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_numeric_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u14861
	goto	u14860
u14861:
	goto	l1076
u14860:
	line	1887
	
l11048:
	movlb	2	; () banked
	incf	(0+(_menu+08h))&0ffh
	line	1888
	
l11050:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1890
	
l11052:
		movlw	2
	movlb	2	; () banked
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14871
	goto	u14870

u14871:
	goto	l11058
u14870:
	
l11054:; BSR set to: 2

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u14881
	goto	u14880

u14881:
	goto	l11058
u14880:
	line	1892
	
l11056:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+0Bh))&0ffh
	line	1893
	movlw	low(0)
	movwf	(0+(_menu+0Ch))&0ffh
	line	1896
	
l11058:; BSR set to: 2

		movlw	04h-1
	cpfsgt	(0+(_menu+08h))&0ffh
	goto	u14891
	goto	u14890

u14891:
	goto	l1076
u14890:
	line	1898
	
l11060:; BSR set to: 2

	call	_get_current_numeric_value	;wreg free
	movff	0+?_get_current_numeric_value,(menu_handle_button@new_value_1517)
	movff	1+?_get_current_numeric_value,(menu_handle_button@new_value_1517+1)
	line	1901
	
l11062:; BSR set to: 2

	movlb	1	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14901
	goto	u14900
u14901:
	goto	l11086
u14900:
	line	1903
	
l11064:; BSR set to: 1

		movlw	2
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14911
	goto	u14910

u14911:
	goto	l11070
u14910:
	line	1905
	
l11066:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1517),postinc2
	movff	(menu_handle_button@new_value_1517+1),postdec2
	line	1906
	
l11068:; BSR set to: 2

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_245)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_245)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1517),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1517+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1907
	goto	l11128
	line	1908
	
l11070:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14921
	goto	u14920

u14921:
	goto	l11076
u14920:
	line	1910
	
l11072:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1517),postinc2
	movff	(menu_handle_button@new_value_1517+1),postdec2
	line	1911
	
l11074:; BSR set to: 2

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_246)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_246)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1517),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1517+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1912
	goto	l11128
	line	1913
	
l11076:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14931
	goto	u14930

u14931:
	goto	l11082
u14930:
	line	1915
	
l11078:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1517),postinc2
	movff	(menu_handle_button@new_value_1517+1),postdec2
	line	1916
	
l11080:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_247)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_247)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1517),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1517+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1917
	goto	l11128
	line	1918
	
l11082:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14941
	goto	u14940

u14941:
	goto	l1147
u14940:
	line	1921
	
l11084:; BSR set to: 2

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_248)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_248)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1517),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1517+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l11128
	line	1923
	
l1147:; BSR set to: 2

	goto	l11128
	line	1924
	
l11086:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14951
	goto	u14950

u14951:
	goto	l11106
u14950:
	line	1926
	
l11088:; BSR set to: 1

		movlw	2
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14961
	goto	u14960

u14961:
	goto	l11094
u14960:
	line	1928
	
l11090:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1517),postinc2
	movff	(menu_handle_button@new_value_1517+1),postdec2
	line	1929
	
l11092:; BSR set to: 2

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_249)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_249)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1517),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1517+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1930
	goto	l11128
	line	1931
	
l11094:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14971
	goto	u14970

u14971:
	goto	l11100
u14970:
	line	1933
	
l11096:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1517),postinc2
	movff	(menu_handle_button@new_value_1517+1),postdec2
	line	1934
	
l11098:; BSR set to: 2

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_250)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_250)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1517),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1517+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1935
	goto	l11128
	line	1936
	
l11100:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14981
	goto	u14980

u14981:
	goto	l1147
u14980:
	line	1938
	
l11102:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1517),postinc2
	movff	(menu_handle_button@new_value_1517+1),postdec2
	line	1939
	
l11104:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_251)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_251)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1517),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1517+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l11128
	line	1942
	
l11106:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14991
	goto	u14990

u14991:
	goto	l11128
u14990:
	
l11108:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u15001
	goto	u15000
u15001:
	goto	l11128
u15000:
	line	1944
	
l11110:; BSR set to: 1

		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15011
	goto	u15010

u15011:
	goto	l11116
u15010:
	line	1946
	
l11112:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1517),postinc2
	movff	(menu_handle_button@new_value_1517+1),postdec2
	line	1947
	
l11114:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_252)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_252)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1517),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1517+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1948
	goto	l11128
	line	1949
	
l11116:; BSR set to: 2

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15021
	goto	u15020

u15021:
	goto	l11122
u15020:
	line	1951
	
l11118:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1517),postinc2
	movff	(menu_handle_button@new_value_1517+1),postdec2
	line	1952
	
l11120:; BSR set to: 2

		movff	0+(_input_menu+01Bh),(c:sprintf@sp)
	movff	1+(_input_menu+01Bh),(c:sprintf@sp+1)

		movlw	low(STR_253)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_253)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1517),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1517+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1953
	goto	l11128
	line	1954
	
l11122:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15031
	goto	u15030

u15031:
	goto	l1147
u15030:
	line	1956
	
l11124:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+020h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+020h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1517),postinc2
	movff	(menu_handle_button@new_value_1517+1),postdec2
	line	1957
	
l11126:; BSR set to: 2

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_254)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_254)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1517),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1517+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1961
	
l11128:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1962
	
l11130:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	goto	l1080
	line	1966
	
l11132:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u15041
	goto	u15040

u15041:
	goto	l1080
u15040:
	line	1968
	
l11134:; BSR set to: 1

	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1969
	
l11136:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1970
	
l11138:
	asmopt push
asmopt off
movlw  3
movwf	(??_menu_handle_button+0+0+1)^00h,c
movlw	8
movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	119
u16087:
decfsz	wreg,f
	bra	u16087
	decfsz	(??_menu_handle_button+0+0)^00h,c,f
	bra	u16087
	decfsz	(??_menu_handle_button+0+0+1)^00h,c,f
	bra	u16087
	nop
asmopt pop

	line	1971
	
l11140:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1080
	line	1976
	
l11142:; BSR set to: 2

	movlb	1	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u15051
	goto	u15050

u15051:
	goto	l11414
u15050:
	line	1978
	
l11144:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15061
	goto	u15060
u15061:
	goto	l11164
u15060:
	line	1980
	
l11146:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1982
	goto	l11162
	line	1988
	
l11148:; BSR set to: 2

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	1989
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	1990
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	1991
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	1992
	
l11150:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	1993
	goto	l1080
	line	2002
	
l11152:; BSR set to: 2

	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u15071
	goto	u15070
u15071:
	goto	l11158
u15070:
	line	2004
	
l11154:; BSR set to: 2

	call	_save_current_config	;wreg free
	line	2005
	
l11156:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	2007
	
l11158:; BSR set to: 2

	setf	((_current_menu))&0ffh
	line	2008
	goto	l1080
	line	1982
	
l11162:
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
	goto	l1076
	xorlw	1^0	; case 1
	skipnz
	goto	l11148
	xorlw	2^1	; case 2
	skipnz
	goto	l1076
	xorlw	3^2	; case 3
	skipnz
	goto	l1076
	xorlw	4^3	; case 4
	skipnz
	goto	l11152
	goto	l1080

	line	2011
	
l11164:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15081
	goto	u15080

u15081:
	goto	l11314
u15080:
	line	2013
	
l11166:; BSR set to: 2

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
	bnz	u15091
movf	(??_menu_handle_button+0+1)^00h,c,w
xorwf	(??_menu_handle_button+2+1)^00h,c,w
	btfss	status,2
	goto	u15091
	goto	u15090

u15091:
	goto	l11180
u15090:
	line	2015
	
l11168:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2016
	
l11170:
	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2017
	
l11172:; BSR set to: 2

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2018
	
l11174:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2019
	
l11176:; BSR set to: 2

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l11150
	line	2022
	
l11180:; BSR set to: 2

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
	goto	u15101
	goto	u15100
u15101:
	goto	l1080
u15100:
	line	2024
	
l11182:; BSR set to: 2

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
	movwf	((menu_handle_button@sensor_type_1529))&0ffh
	line	2025
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
	movwf	((menu_handle_button@flow_type_1530))&0ffh
	line	2028
	
l11184:; BSR set to: 1

	movff	(menu_handle_button@sensor_type_1529),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type_1530),(c:is_numeric_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u15111
	goto	u15110
u15111:
	goto	l11242
u15110:
	line	2030
	
l11186:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val))&0ffh
	line	2033
	movf	((menu_handle_button@sensor_type_1529))&0ffh,w
	btfss	status,2
	goto	u15121
	goto	u15120
u15121:
	goto	l11204
u15120:
	line	2035
	
l11188:; BSR set to: 1

		movlw	2
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15131
	goto	u15130

u15131:
	goto	l11192
u15130:
	line	2036
	
l11190:; BSR set to: 2

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
	goto	l11234
	line	2037
	
l11192:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15141
	goto	u15140

u15141:
	goto	l11196
u15140:
	line	2038
	
l11194:; BSR set to: 2

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
	goto	l11234
	line	2039
	
l11196:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15151
	goto	u15150

u15151:
	goto	l11200
u15150:
	line	2040
	
l11198:; BSR set to: 2

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
	goto	l11234
	line	2041
	
l11200:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15161
	goto	u15160

u15161:
	goto	l1188
u15160:
	line	2042
	
l11202:; BSR set to: 2

	movlw	high(032h)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(032h)
	movwf	((menu_handle_button@current_val))&0ffh
	goto	l11234
	line	2043
	
l1188:; BSR set to: 2

	goto	l11234
	line	2044
	
l11204:; BSR set to: 1

		decf	((menu_handle_button@sensor_type_1529))&0ffh,w
	btfss	status,2
	goto	u15171
	goto	u15170

u15171:
	goto	l11218
u15170:
	line	2046
	
l11206:; BSR set to: 1

		movlw	2
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15181
	goto	u15180

u15181:
	goto	l11210
u15180:
	goto	l11190
	line	2048
	
l11210:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15191
	goto	u15190

u15191:
	goto	l11214
u15190:
	goto	l11194
	line	2050
	
l11214:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15201
	goto	u15200

u15201:
	goto	l1188
u15200:
	goto	l11198
	line	2053
	
l11218:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1529))&0ffh,w
	btfss	status,2
	goto	u15211
	goto	u15210

u15211:
	goto	l11234
u15210:
	
l11220:; BSR set to: 1

	movf	((menu_handle_button@flow_type_1530))&0ffh,w
	btfss	status,2
	goto	u15221
	goto	u15220
u15221:
	goto	l11234
u15220:
	line	2055
	
l11222:; BSR set to: 1

		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15231
	goto	u15230

u15231:
	goto	l11226
u15230:
	goto	l11190
	line	2057
	
l11226:; BSR set to: 2

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15241
	goto	u15240

u15241:
	goto	l11230
u15240:
	goto	l11194
	line	2059
	
l11230:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15251
	goto	u15250

u15251:
	goto	l1188
u15250:
	line	2060
	
l11232:; BSR set to: 2

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
	line	2063
	
l11234:
	movff	(menu_handle_button@current_val),(c:init_numeric_editor@value)
	movff	(menu_handle_button@current_val+1),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	2064
	
l11236:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2065
	
l11238:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l10872
	line	2069
	
l11242:
	movff	(menu_handle_button@sensor_type_1529),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type_1530),(c:is_time_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u15261
	goto	u15260
u15261:
	goto	l11288
u15260:
	line	2071
	
l11244:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val_1533+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val_1533))&0ffh
	line	2074
	movf	((menu_handle_button@sensor_type_1529))&0ffh,w
	btfss	status,2
	goto	u15271
	goto	u15270
u15271:
	goto	l11258
u15270:
	line	2076
	
l11246:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15281
	goto	u15280

u15281:
	goto	l11250
u15280:
	line	2077
	
l11248:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1533)
	movff	postdec2,(menu_handle_button@current_val_1533+1)
	goto	l11276
	line	2078
	
l11250:; BSR set to: 2

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15291
	goto	u15290

u15291:
	goto	l11254
u15290:
	line	2079
	
l11252:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1533)
	movff	postdec2,(menu_handle_button@current_val_1533+1)
	goto	l11276
	line	2080
	
l11254:; BSR set to: 2

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15301
	goto	u15300

u15301:
	goto	l1210
u15300:
	line	2081
	
l11256:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1533)
	movff	postdec2,(menu_handle_button@current_val_1533+1)
	goto	l11276
	line	2082
	
l1210:; BSR set to: 2

	goto	l11276
	line	2083
	
l11258:; BSR set to: 1

		decf	((menu_handle_button@sensor_type_1529))&0ffh,w
	btfss	status,2
	goto	u15311
	goto	u15310

u15311:
	goto	l11264
u15310:
	line	2085
	
l11260:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15321
	goto	u15320

u15321:
	goto	l11276
u15320:
	goto	l11248
	line	2088
	
l11264:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1529))&0ffh,w
	btfss	status,2
	goto	u15331
	goto	u15330

u15331:
	goto	l11276
u15330:
	line	2091
	
l11266:; BSR set to: 1

	movf	((menu_handle_button@flow_type_1530))&0ffh,w
	btfss	status,2
	goto	u15341
	goto	u15340
u15341:
	goto	l11270
u15340:
	
l11268:; BSR set to: 1

		movlw	7
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u15351
	goto	u15350

u15351:
	goto	l11274
u15350:
	
l11270:
	movlb	1	; () banked
		decf	((menu_handle_button@flow_type_1530))&0ffh,w
	btfss	status,2
	goto	u15361
	goto	u15360

u15361:
	goto	l11276
u15360:
	
l11272:; BSR set to: 1

		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15371
	goto	u15370

u15371:
	goto	l11276
u15370:
	line	2092
	
l11274:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1533)
	movff	postdec2,(menu_handle_button@current_val_1533+1)
	line	2096
	
l11276:
		movlw	low(menu_handle_button@buf_1534)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1534)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_255)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_255)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@current_val_1533),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@current_val_1533+1),1+((c:?_sprintf)+04h)
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2097
	
l11278:
		movlw	low(menu_handle_button@buf_1534)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1534)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2099
	
l11280:
	movff	(menu_handle_button@current_val_1533),(c:init_time_editor@value_seconds)
	movff	(menu_handle_button@current_val_1533+1),(c:init_time_editor@value_seconds+1)
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	goto	l11236
	line	2105
	
l11288:
	movff	(menu_handle_button@sensor_type_1529),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type_1530),(c:is_option_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u15381
	goto	u15380
u15381:
	goto	l1076
u15380:
	line	2107
	
l11290:
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
	line	2109
	
l11292:
	movff	(menu_handle_button@sensor_type_1529),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type_1530),(c:get_option_edit_flag@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1537)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1537+1)
	line	2110
	
l11294:
	movff	(menu_handle_button@sensor_type_1529),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type_1530),(c:get_item_options_for_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1538)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1538+1)
	line	2112
	
l11296:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag_1537))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1537+1))&0ffh,w
	btfsc	status,2
	goto	u15391
	goto	u15390

u15391:
	goto	l11310
u15390:
	
l11298:; BSR set to: 1

	movf	((menu_handle_button@opts_1538))&0ffh,w
iorwf	((menu_handle_button@opts_1538+1))&0ffh,w
	btfsc	status,2
	goto	u15401
	goto	u15400

u15401:
	goto	l11310
u15400:
	line	2115
	
l11300:; BSR set to: 1

	movlw	low(0)
	movwf	((menu_handle_button@i))&0ffh
	goto	l11308
	line	2117
	
l11302:; BSR set to: 1

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
	addwf	((menu_handle_button@opts_1538))&0ffh,w
	movwf	(??_menu_handle_button+2+0)^00h,c
	movf	(??_menu_handle_button+0+1)^00h,c,w
	addwfc	((menu_handle_button@opts_1538+1))&0ffh,w
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
	goto	u15411
	goto	u15410

u15411:
	goto	l11306
u15410:
	line	2119
	
l11304:
	movff	(menu_handle_button@edit_flag_1537),fsr2l
	movff	(menu_handle_button@edit_flag_1537+1),fsr2h
	movff	(menu_handle_button@i),indf2

	line	2120
	goto	l11310
	line	2115
	
l11306:
	movlb	1	; () banked
	incf	((menu_handle_button@i))&0ffh
	
l11308:; BSR set to: 1

	movlw	01h
	addwf	((menu_handle_button@opts_1538))&0ffh,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	0
	addwfc	((menu_handle_button@opts_1538+1))&0ffh,w
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
	goto	u15421
	goto	u15420

u15421:
	goto	l11302
u15420:
	line	2125
	
l11310:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2126
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l10872
	line	2131
	
l11314:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15431
	goto	u15430

u15431:
	goto	l11348
u15430:
	line	2133
	
l11316:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2135
	
l11318:
		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15441
	goto	u15440

u15441:
	goto	l11324
u15440:
	line	2137
	
l11320:; BSR set to: 2

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	2138
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2139
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2140
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2141
	
l11322:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	2142
	goto	l1080
	line	2143
	
l11324:; BSR set to: 2

		movlw	03h-0
	cpfslt	((_menu))&0ffh
	goto	u15451
	goto	u15450

u15451:
	goto	l11336
u15450:
	line	2145
	
l11326:; BSR set to: 2

	movf	((_menu))&0ffh,w
	
	call	_rebuild_input_menu
	line	2146
	
l11328:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2147
	
l11330:; BSR set to: 2

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2148
	
l11332:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2149
	
l11334:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	line	2150
	goto	l1080
	line	2151
	
l11336:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15461
	goto	u15460

u15461:
	goto	l1076
u15460:
	line	2153
	
l11338:; BSR set to: 2

	call	_rebuild_clock_menu	;wreg free
	line	2154
	
l11340:
	movlw	low(03h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2155
	
l11342:; BSR set to: 2

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2156
	
l11344:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	goto	l10850
	line	2160
	
l11348:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15471
	goto	u15470

u15471:
	goto	l1080
u15470:
	line	2164
	
l11350:; BSR set to: 2

		movlw	05h-1
	cpfsgt	((_menu))&0ffh
	goto	u15481
	goto	u15480

u15481:
	goto	l11354
u15480:
	
l11352:; BSR set to: 2

	movlw	high(0)
	movlb	1	; () banked
	movwf	((_menu_handle_button$1546+1))&0ffh
	movlw	low(0)
	movwf	((_menu_handle_button$1546))&0ffh
	goto	l11356
	
l11354:; BSR set to: 2

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
	movwf	((_menu_handle_button$1546))&0ffh
	clrf	((_menu_handle_button$1546+1))&0ffh
	
l11356:; BSR set to: 1

		movlw	low(menu_handle_button@buf_1544)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1544)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_256)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_256)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu_handle_button$1546),0+((c:?_sprintf)+06h)
	movff	(_menu_handle_button$1546+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	2165
	
l11358:
		movlw	low(menu_handle_button@buf_1544)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1544)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2167
		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15491
	goto	u15490

u15491:
	goto	l11372
u15490:
	goto	l11168
	line	2177
	
l11372:; BSR set to: 2

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
	goto	u15501
	goto	u15500
u15501:
	goto	l11412
u15500:
	line	2179
	
l11374:; BSR set to: 2

		movlw	low(STR_257)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_257)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2182
	
l11376:
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
	line	2185
	
l11378:
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15511
	goto	u15510
u15511:
	goto	l11382
u15510:
	line	2187
	
l11380:; BSR set to: 2

		movff	0+(_clock_menu+02h),(c:strcmp@s1)
	movff	1+(_clock_menu+02h),(c:strcmp@s1+1)

		movlw	low(STR_258)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_258)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u15521
	goto	u15520

u15521:
	movlw	1
	goto	u15530
u15520:
	movlw	0
u15530:
	movwf	((c:_enable_edit_flag))^00h,c
	line	2188
	goto	l11404
	line	2189
	
l11382:; BSR set to: 2

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15541
	goto	u15540

u15541:
	goto	l11394
u15540:
	line	2191
	
l11384:; BSR set to: 2

		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_259)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_259)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u15551
	goto	u15550

u15551:
	goto	l11388
u15550:
	line	2192
	
l11386:
	movlw	low(0)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l11404
	line	2193
	
l11388:
		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_260)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_260)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u15561
	goto	u15560

u15561:
	goto	l11392
u15560:
	line	2194
	
l11390:
	movlw	low(01h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l11404
	line	2196
	
l11392:
	movlw	low(02h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l11404
	line	2198
	
l11394:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15571
	goto	u15570

u15571:
	goto	l11400
u15570:
	line	2201
	
l11396:; BSR set to: 2

	movff	0+(_system_config+07h),0+(_menu+0Dh)
	clrf	(1+(_menu+0Dh))&0ffh
	line	2202
	
l11398:; BSR set to: 2

	movff	0+(_system_config+07h),(c:init_time_editor@value_seconds)
	clrf	((c:init_time_editor@value_seconds+1))^00h,c
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	line	2203
	goto	l11404
	line	2204
	
l11400:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15581
	goto	u15580

u15581:
	goto	l1254
u15580:
	line	2206
	
l11402:; BSR set to: 2

		movff	0+(_clock_menu+011h),(c:strcmp@s1)
	movff	1+(_clock_menu+011h),(c:strcmp@s1+1)

		movlw	low(STR_261)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_261)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u15591
	goto	u15590

u15591:
	movlw	1
	goto	u15600
u15590:
	movlw	0
u15600:
	movwf	((c:_display_edit_flag))^00h,c
	goto	l11404
	line	2209
	
l1254:; BSR set to: 2

	
l11404:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2210
	
l11406:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2211
	
l11408:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l10850
	line	2218
	
l11412:; BSR set to: 2

		movlw	low(STR_262)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_262)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1080
	line	2222
	
l11414:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u15611
	goto	u15610

u15611:
	goto	l1080
u15610:
	goto	l11136
	line	2229
	
l1080:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_button
	__end_of_menu_handle_button:
	signat	_menu_handle_button,4217
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
psect	text10,class=CODE,space=0,reloc=2,group=0
	line	641
global __ptext10
__ptext10:
psect	text10
	file	"src\menu.c"
	line	641
	
_rebuild_input_menu:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((rebuild_input_menu@input_num))&0ffh
	line	644
	
l10002:
	movff	(rebuild_input_menu@input_num),(_current_input)
	line	647
	
l10004:
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
	
l10006:; BSR set to: 0

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
	
l10008:; BSR set to: 0

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
	goto	u13191
	goto	u13190
u13191:
	goto	l10012
u13190:
	
l10010:; BSR set to: 0

		movlw	low(STR_127)
	movwf	((_rebuild_input_menu$1203))&0ffh
	movlw	high(STR_127)
	movwf	((_rebuild_input_menu$1203+1))&0ffh

	goto	l10014
	
l10012:; BSR set to: 0

		movlw	low(STR_126)
	movwf	((_rebuild_input_menu$1203))&0ffh
	movlw	high(STR_126)
	movwf	((_rebuild_input_menu$1203+1))&0ffh

	
l10014:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_125)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_125)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_input_menu$1203),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$1203+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	653
	
l10016:
	movlb	0	; () banked
	movf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u13201
	goto	u13200
u13201:
	goto	l10122
u13200:
	line	655
	
l10018:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_128)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_128)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	656
	
l10020:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_129)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_129)
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
	
l10022:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_130)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_130)
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
	
l10024:
		movlw	low(_value_hi_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_hi_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_131)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_131)
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
	
l10026:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2476)
	movff	1+?___lwdiv,(_rebuild_input_menu$2476+1)
	
l10028:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2477)
	movff	1+?___lwmod,(_rebuild_input_menu$2477+1)
	
l10030:
		movlw	low(_value_highbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_highbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_132)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_132)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2476),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2476+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2477),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2477+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	662
	
l10032:
		movlw	low(_value_low_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_133)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_133)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	high(032h)
	movwf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(032h)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	665
	
l10034:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2476)
	movff	1+?___lwdiv,(_rebuild_input_menu$2476+1)
	
l10036:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2477)
	movff	1+?___lwmod,(_rebuild_input_menu$2477+1)
	
l10038:
		movlw	low(_value_plpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_plpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_134)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_134)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2476),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2476+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2477),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2477+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	668
	
l10040:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2476)
	movff	1+?___lwdiv,(_rebuild_input_menu$2476+1)
	
l10042:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2477)
	movff	1+?___lwmod,(_rebuild_input_menu$2477+1)
	
l10044:
		movlw	low(_value_slpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_slpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_135)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_135)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2476),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2476+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2477),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2477+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	671
	
l10046:
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
	goto	u13211
	goto	u13210
u13211:
	goto	l10054
u13210:
	
l10048:; BSR set to: 0

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
	goto	u13221
	goto	u13220

u13221:
	goto	l10052
u13220:
	
l10050:; BSR set to: 0

		movlw	low(STR_138)
	movwf	((_rebuild_input_menu$1218))&0ffh
	movlw	high(STR_138)
	movwf	((_rebuild_input_menu$1218+1))&0ffh

	goto	l652
	
l10052:; BSR set to: 0

		movlw	low(STR_137)
	movwf	((_rebuild_input_menu$1218))&0ffh
	movlw	high(STR_137)
	movwf	((_rebuild_input_menu$1218+1))&0ffh

	
l652:; BSR set to: 0

		movff	(_rebuild_input_menu$1218),(_rebuild_input_menu$1217)
	movff	(_rebuild_input_menu$1218+1),(_rebuild_input_menu$1217+1)

	goto	l10056
	
l10054:; BSR set to: 0

		movlw	low(STR_136)
	movwf	((_rebuild_input_menu$1217))&0ffh
	movlw	high(STR_136)
	movwf	((_rebuild_input_menu$1217+1))&0ffh

	
l10056:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1217),(c:strcpy@from)
	movff	(_rebuild_input_menu$1217+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	673
	
l10058:
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
	goto	u13231
	goto	u13230
u13231:
	goto	l10066
u13230:
	
l10060:; BSR set to: 0

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
	goto	u13241
	goto	u13240

u13241:
	goto	l10064
u13240:
	
l10062:; BSR set to: 0

		movlw	low(STR_141)
	movwf	((_rebuild_input_menu$1225))&0ffh
	movlw	high(STR_141)
	movwf	((_rebuild_input_menu$1225+1))&0ffh

	goto	l660
	
l10064:; BSR set to: 0

		movlw	low(STR_140)
	movwf	((_rebuild_input_menu$1225))&0ffh
	movlw	high(STR_140)
	movwf	((_rebuild_input_menu$1225+1))&0ffh

	
l660:; BSR set to: 0

		movff	(_rebuild_input_menu$1225),(_rebuild_input_menu$1224)
	movff	(_rebuild_input_menu$1225+1),(_rebuild_input_menu$1224+1)

	goto	l10068
	
l10066:; BSR set to: 0

		movlw	low(STR_139)
	movwf	((_rebuild_input_menu$1224))&0ffh
	movlw	high(STR_139)
	movwf	((_rebuild_input_menu$1224+1))&0ffh

	
l10068:; BSR set to: 0

		movlw	low(_value_rlyplp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyplp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1224),(c:strcpy@from)
	movff	(_rebuild_input_menu$1224+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	675
	
l10070:
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
	goto	u13251
	goto	u13250
u13251:
	goto	l10078
u13250:
	
l10072:; BSR set to: 0

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
	goto	u13261
	goto	u13260

u13261:
	goto	l10076
u13260:
	
l10074:; BSR set to: 0

		movlw	low(STR_144)
	movwf	((_rebuild_input_menu$1232))&0ffh
	movlw	high(STR_144)
	movwf	((_rebuild_input_menu$1232+1))&0ffh

	goto	l668
	
l10076:; BSR set to: 0

		movlw	low(STR_143)
	movwf	((_rebuild_input_menu$1232))&0ffh
	movlw	high(STR_143)
	movwf	((_rebuild_input_menu$1232+1))&0ffh

	
l668:; BSR set to: 0

		movff	(_rebuild_input_menu$1232),(_rebuild_input_menu$1231)
	movff	(_rebuild_input_menu$1232+1),(_rebuild_input_menu$1231+1)

	goto	l10080
	
l10078:; BSR set to: 0

		movlw	low(STR_142)
	movwf	((_rebuild_input_menu$1231))&0ffh
	movlw	high(STR_142)
	movwf	((_rebuild_input_menu$1231+1))&0ffh

	
l10080:; BSR set to: 0

		movlw	low(_value_rlyslp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyslp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1231),(c:strcpy@from)
	movff	(_rebuild_input_menu$1231+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	676
	
l10082:
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
	goto	u13271
	goto	u13270
u13271:
	goto	l10086
u13270:
	
l10084:; BSR set to: 0

		movlw	low(STR_146)
	movwf	((_rebuild_input_menu$1236))&0ffh
	movlw	high(STR_146)
	movwf	((_rebuild_input_menu$1236+1))&0ffh

	goto	l10088
	
l10086:; BSR set to: 0

		movlw	low(STR_145)
	movwf	((_rebuild_input_menu$1236))&0ffh
	movlw	high(STR_145)
	movwf	((_rebuild_input_menu$1236+1))&0ffh

	
l10088:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1236),(c:strcpy@from)
	movff	(_rebuild_input_menu$1236+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	679
	
l10090:
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
	
l10092:
		movlw	low(_value_enable)
	movlb	2	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	683
	
l10094:; BSR set to: 2

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	684
	
l10096:; BSR set to: 2

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	685
	
l10098:; BSR set to: 2

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	686
	
l10100:; BSR set to: 2

		movlw	low(_value_hi_pressure)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_hi_pressure)
	movwf	(1+(_input_menu+016h))&0ffh

	line	687
	
l10102:; BSR set to: 2

		movlw	low(_value_highbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_highbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	688
	
l10104:; BSR set to: 2

		movlw	low(_value_low_pressure)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_pressure)
	movwf	(1+(_input_menu+020h))&0ffh

	line	689
	
l10106:; BSR set to: 2

		movlw	low(_value_plpbp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_plpbp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	690
	
l10108:; BSR set to: 2

		movlw	low(_value_slpbp)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_slpbp)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	691
	
l10110:; BSR set to: 2

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	692
	
l10112:; BSR set to: 2

		movlw	low(_value_rlyplp)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_rlyplp)
	movwf	(1+(_input_menu+034h))&0ffh

	line	693
	
l10114:; BSR set to: 2

		movlw	low(_value_rlyslp)
	movwf	(0+(_input_menu+039h))&0ffh
	movlw	high(_value_rlyslp)
	movwf	(1+(_input_menu+039h))&0ffh

	line	694
	
l10116:; BSR set to: 2

		movlw	low(_value_display)
	movwf	(0+(_input_menu+03Eh))&0ffh
	clrf	(1+(_input_menu+03Eh))&0ffh

	line	695
	
l10118:; BSR set to: 2

		movlw	low(_value_back)
	movwf	(0+(_input_menu+043h))&0ffh
	clrf	(1+(_input_menu+043h))&0ffh

	line	697
	
l10120:; BSR set to: 2

	movlw	low(0Eh)
	movwf	(0+(_menu+02h))&0ffh
	line	698
	goto	l10288
	line	699
	
l10122:; BSR set to: 0

		decf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u13281
	goto	u13280

u13281:
	goto	l10180
u13280:
	line	701
	
l10124:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_147)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_147)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	702
	
l10126:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_148)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_148)
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
	
l10128:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_149)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_149)
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
	
l10130:
		movlw	low(_value_high_temp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_temp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_150)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_150)
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
	
l10132:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2476)
	movff	1+?___lwdiv,(_rebuild_input_menu$2476+1)
	
l10134:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2477)
	movff	1+?___lwmod,(_rebuild_input_menu$2477+1)
	
l10136:
		movlw	low(_value_high_tbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_tbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_151)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_151)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2476),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2476+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2477),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2477+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	709
	
l10138:
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
	goto	u13291
	goto	u13290
u13291:
	goto	l10146
u13290:
	
l10140:; BSR set to: 0

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
	goto	u13301
	goto	u13300

u13301:
	goto	l10144
u13300:
	
l10142:; BSR set to: 0

		movlw	low(STR_154)
	movwf	((_rebuild_input_menu$1251))&0ffh
	movlw	high(STR_154)
	movwf	((_rebuild_input_menu$1251+1))&0ffh

	goto	l682
	
l10144:; BSR set to: 0

		movlw	low(STR_153)
	movwf	((_rebuild_input_menu$1251))&0ffh
	movlw	high(STR_153)
	movwf	((_rebuild_input_menu$1251+1))&0ffh

	
l682:; BSR set to: 0

		movff	(_rebuild_input_menu$1251),(_rebuild_input_menu$1250)
	movff	(_rebuild_input_menu$1251+1),(_rebuild_input_menu$1250+1)

	goto	l10148
	
l10146:; BSR set to: 0

		movlw	low(STR_152)
	movwf	((_rebuild_input_menu$1250))&0ffh
	movlw	high(STR_152)
	movwf	((_rebuild_input_menu$1250+1))&0ffh

	
l10148:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1250),(c:strcpy@from)
	movff	(_rebuild_input_menu$1250+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	710
	
l10150:
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
	goto	u13311
	goto	u13310
u13311:
	goto	l10154
u13310:
	
l10152:; BSR set to: 0

		movlw	low(STR_156)
	movwf	((_rebuild_input_menu$1255))&0ffh
	movlw	high(STR_156)
	movwf	((_rebuild_input_menu$1255+1))&0ffh

	goto	l10156
	
l10154:; BSR set to: 0

		movlw	low(STR_155)
	movwf	((_rebuild_input_menu$1255))&0ffh
	movlw	high(STR_155)
	movwf	((_rebuild_input_menu$1255+1))&0ffh

	
l10156:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1255),(c:strcpy@from)
	movff	(_rebuild_input_menu$1255+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	713
	
l10158:
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
	
l10160:
		movlw	low(_value_enable)
	movlb	2	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	717
	
l10162:; BSR set to: 2

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	718
	
l10164:; BSR set to: 2

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	719
	
l10166:; BSR set to: 2

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	720
	
l10168:; BSR set to: 2

		movlw	low(_value_high_temp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_high_temp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	721
	
l10170:; BSR set to: 2

		movlw	low(_value_high_tbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_high_tbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	722
	
l10172:; BSR set to: 2

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+020h))&0ffh

	line	723
	
l10174:; BSR set to: 2

		movlw	low(_value_display)
	movwf	(0+(_input_menu+025h))&0ffh
	clrf	(1+(_input_menu+025h))&0ffh

	line	724
	
l10176:; BSR set to: 2

		movlw	low(_value_back)
	movwf	(0+(_input_menu+02Ah))&0ffh
	clrf	(1+(_input_menu+02Ah))&0ffh

	line	726
	
l10178:; BSR set to: 2

	movlw	low(09h)
	movwf	(0+(_menu+02h))&0ffh
	line	727
	goto	l10288
	line	728
	
l10180:; BSR set to: 0

		movlw	2
	xorwf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u13321
	goto	u13320

u13321:
	goto	l10288
u13320:
	line	730
	
l10182:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_157)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_157)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	731
	
l10184:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfsc	status,2
	goto	u13331
	goto	u13330
u13331:
	goto	l10188
u13330:
	
l10186:; BSR set to: 0

		movlw	low(STR_159)
	movwf	((_rebuild_input_menu$1260))&0ffh
	movlw	high(STR_159)
	movwf	((_rebuild_input_menu$1260+1))&0ffh

	goto	l10190
	
l10188:; BSR set to: 0

		movlw	low(STR_158)
	movwf	((_rebuild_input_menu$1260))&0ffh
	movlw	high(STR_158)
	movwf	((_rebuild_input_menu$1260+1))&0ffh

	
l10190:; BSR set to: 0

		movlw	low(_value_flow_type)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_type)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1260),(c:strcpy@from)
	movff	(_rebuild_input_menu$1260+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	732
	
l10192:
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
	goto	u13341
	goto	u13340
u13341:
	goto	l10196
u13340:
	
l10194:; BSR set to: 0

		movlw	low(STR_161)
	movwf	((_rebuild_input_menu$1264))&0ffh
	movlw	high(STR_161)
	movwf	((_rebuild_input_menu$1264+1))&0ffh

	goto	l10198
	
l10196:; BSR set to: 0

		movlw	low(STR_160)
	movwf	((_rebuild_input_menu$1264))&0ffh
	movlw	high(STR_160)
	movwf	((_rebuild_input_menu$1264+1))&0ffh

	
l10198:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1264),(c:strcpy@from)
	movff	(_rebuild_input_menu$1264+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	734
	
l10200:
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
	goto	u13351
	goto	u13350
u13351:
	goto	l10208
u13350:
	
l10202:; BSR set to: 0

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
	goto	u13361
	goto	u13360

u13361:
	goto	l10206
u13360:
	
l10204:; BSR set to: 0

		movlw	low(STR_164)
	movwf	((_rebuild_input_menu$1271))&0ffh
	movlw	high(STR_164)
	movwf	((_rebuild_input_menu$1271+1))&0ffh

	goto	l704
	
l10206:; BSR set to: 0

		movlw	low(STR_163)
	movwf	((_rebuild_input_menu$1271))&0ffh
	movlw	high(STR_163)
	movwf	((_rebuild_input_menu$1271+1))&0ffh

	
l704:; BSR set to: 0

		movff	(_rebuild_input_menu$1271),(_rebuild_input_menu$1270)
	movff	(_rebuild_input_menu$1271+1),(_rebuild_input_menu$1270+1)

	goto	l10210
	
l10208:; BSR set to: 0

		movlw	low(STR_162)
	movwf	((_rebuild_input_menu$1270))&0ffh
	movlw	high(STR_162)
	movwf	((_rebuild_input_menu$1270+1))&0ffh

	
l10210:; BSR set to: 0

		movlw	low(_value_rlylow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlylow)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1270),(c:strcpy@from)
	movff	(_rebuild_input_menu$1270+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	736
	
l10212:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfss	status,2
	goto	u13371
	goto	u13370
u13371:
	goto	l10260
u13370:
	line	738
	
l10214:; BSR set to: 0

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
	goto	u13381
	goto	u13380
u13381:
	goto	l10218
u13380:
	
l10216:; BSR set to: 0

		movlw	low(STR_166)
	movwf	((_rebuild_input_menu$1275))&0ffh
	movlw	high(STR_166)
	movwf	((_rebuild_input_menu$1275+1))&0ffh

	goto	l10220
	
l10218:; BSR set to: 0

		movlw	low(STR_165)
	movwf	((_rebuild_input_menu$1275))&0ffh
	movlw	high(STR_165)
	movwf	((_rebuild_input_menu$1275+1))&0ffh

	
l10220:; BSR set to: 0

		movlw	low(_value_flow_units)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_units)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1275),(c:strcpy@from)
	movff	(_rebuild_input_menu$1275+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	739
	
l10222:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_167)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_167)
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
	
l10224:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_168)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_168)
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
	
l10226:
		movlw	low(_value_low_flow)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_169)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_169)
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
	
l10228:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2476)
	movff	1+?___lwdiv,(_rebuild_input_menu$2476+1)
	
l10230:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2477)
	movff	1+?___lwmod,(_rebuild_input_menu$2477+1)
	
l10232:
		movlw	low(_value_low_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_170)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_170)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2476),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2476+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2477),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2477+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	747
	
l10234:
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
	
l10236:
		movlw	low(_value_enable)
	movlb	2	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	751
	
l10238:; BSR set to: 2

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	752
	
l10240:; BSR set to: 2

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	753
	
l10242:; BSR set to: 2

		movlw	low(_value_flow_units)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_flow_units)
	movwf	(1+(_input_menu+011h))&0ffh

	line	754
	
l10244:; BSR set to: 2

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+016h))&0ffh

	line	755
	
l10246:; BSR set to: 2

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	756
	
l10248:; BSR set to: 2

		movlw	low(_value_low_flow)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_flow)
	movwf	(1+(_input_menu+020h))&0ffh

	line	757
	
l10250:; BSR set to: 2

		movlw	low(_value_low_flow_bp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_low_flow_bp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	758
	
l10252:; BSR set to: 2

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	759
	
l10254:; BSR set to: 2

		movlw	low(_value_display)
	movwf	(0+(_input_menu+02Fh))&0ffh
	clrf	(1+(_input_menu+02Fh))&0ffh

	line	760
	
l10256:; BSR set to: 2

		movlw	low(_value_back)
	movwf	(0+(_input_menu+034h))&0ffh
	clrf	(1+(_input_menu+034h))&0ffh

	line	762
	
l10258:; BSR set to: 2

	movlw	low(0Bh)
	movwf	(0+(_menu+02h))&0ffh
	line	763
	goto	l10288
	line	766
	
l10260:; BSR set to: 0

		movlw	low(_value_no_flow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_no_flow)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_171)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_171)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	769
	
l10262:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2476)
	movff	1+?___lwdiv,(_rebuild_input_menu$2476+1)
	
l10264:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2477)
	movff	1+?___lwmod,(_rebuild_input_menu$2477+1)
	
l10266:
		movlw	low(_value_no_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_no_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_172)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_172)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2476),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2476+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2477),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2477+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	772
	
l10268:
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
	
l10270:
		movlw	low(_value_enable)
	movlb	2	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	776
	
l10272:; BSR set to: 2

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	777
	
l10274:; BSR set to: 2

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	778
	
l10276:; BSR set to: 2

		movlw	low(_value_no_flow)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_no_flow)
	movwf	(1+(_input_menu+011h))&0ffh

	line	779
	
l10278:; BSR set to: 2

		movlw	low(_value_no_flow_bp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_no_flow_bp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	780
	
l10280:; BSR set to: 2

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	781
	
l10282:; BSR set to: 2

		movlw	low(_value_display)
	movwf	(0+(_input_menu+020h))&0ffh
	clrf	(1+(_input_menu+020h))&0ffh

	line	782
	
l10284:; BSR set to: 2

		movlw	low(_value_back)
	movwf	(0+(_input_menu+025h))&0ffh
	clrf	(1+(_input_menu+025h))&0ffh

	line	784
	
l10286:; BSR set to: 2

	movlw	low(08h)
	movwf	(0+(_menu+02h))&0ffh
	line	791
	
l10288:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_173)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_173)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(rebuild_input_menu@sensor),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(rebuild_input_menu@flow_type_val),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	792
	
l10290:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	793
	
l711:
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
psect	text11,class=CODE,space=0,reloc=2,group=0
	line	1303
global __ptext11
__ptext11:
psect	text11
	file	"src\menu.c"
	line	1303
	
_rebuild_clock_menu:
;incstack = 0
	callstack 24
	line	1309
	
l10338:; BSR set to: 2

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_211)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_211)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_system_config+06h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1310
	
l10340:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1313
	
l10342:
	movlb	4	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u13551
	goto	u13550
u13551:
	goto	l10346
u13550:
	
l10344:; BSR set to: 4

		movlw	low(STR_214)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1423))&0ffh
	movlw	high(STR_214)
	movwf	((_rebuild_clock_menu$1423+1))&0ffh

	goto	l10348
	
l10346:; BSR set to: 4

		movlw	low(STR_213)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1423))&0ffh
	movlw	high(STR_213)
	movwf	((_rebuild_clock_menu$1423+1))&0ffh

	
l10348:; BSR set to: 0

		movlw	low(_value_clock_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_clock_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_212)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_212)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_clock_menu$1423),0+((c:?_sprintf)+04h)
	movff	(_rebuild_clock_menu$1423+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	1315
	
l10350:
	movlb	4	; () banked
	movf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u13561
	goto	u13560
u13561:
	goto	l10358
u13560:
	
l10352:; BSR set to: 4

		decf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u13571
	goto	u13570

u13571:
	goto	l10356
u13570:
	
l10354:; BSR set to: 4

		movlw	low(STR_217)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1430))&0ffh
	movlw	high(STR_217)
	movwf	((_rebuild_clock_menu$1430+1))&0ffh

	goto	l968
	
l10356:; BSR set to: 4

		movlw	low(STR_216)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1430))&0ffh
	movlw	high(STR_216)
	movwf	((_rebuild_clock_menu$1430+1))&0ffh

	
l968:; BSR set to: 0

		movff	(_rebuild_clock_menu$1430),(_rebuild_clock_menu$1429)
	movff	(_rebuild_clock_menu$1430+1),(_rebuild_clock_menu$1429+1)

	goto	l10360
	
l10358:; BSR set to: 4

		movlw	low(STR_215)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1429))&0ffh
	movlw	high(STR_215)
	movwf	((_rebuild_clock_menu$1429+1))&0ffh

	
l10360:; BSR set to: 0

		movlw	low(_value_end_runtime)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_end_runtime)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_clock_menu$1429),(c:strcpy@from)
	movff	(_rebuild_clock_menu$1429+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1320
	
l10362:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_218)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_218)
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
	
l10364:
		movlw	low(_value_clock_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_clock_display)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_219)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_219)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1324
	
l10366:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_220)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_220)
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
	
l10368:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1328
	
l10370:
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
	
l10372:
		movlw	low(_value_clock_enable)
	movlb	1	; () banked
	movwf	(0+(_clock_menu+02h))&0ffh
	movlw	high(_value_clock_enable)
	movwf	(1+(_clock_menu+02h))&0ffh

	line	1332
	
l10374:; BSR set to: 1

		movlw	low(_value_end_runtime)
	movwf	(0+(_clock_menu+07h))&0ffh
	movlw	high(_value_end_runtime)
	movwf	(1+(_clock_menu+07h))&0ffh

	line	1333
	
l10376:; BSR set to: 1

		movlw	low(_value_relay_pulse)
	movwf	(0+(_clock_menu+0Ch))&0ffh
	movlw	high(_value_relay_pulse)
	movwf	(1+(_clock_menu+0Ch))&0ffh

	line	1334
	
l10378:; BSR set to: 1

		movlw	low(_value_clock_display)
	movwf	(0+(_clock_menu+011h))&0ffh
	movlw	high(_value_clock_display)
	movwf	(1+(_clock_menu+011h))&0ffh

	line	1335
	
l10380:; BSR set to: 1

		movlw	low(_value_back)
	movwf	(0+(_clock_menu+016h))&0ffh
	clrf	(1+(_clock_menu+016h))&0ffh

	line	1337
	
l10382:; BSR set to: 1

	movlw	low(05h)
	movlb	2	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	1339
	
l10384:; BSR set to: 2

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_221)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_221)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+02h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1340
	
l10386:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1341
	
l969:
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
psect	text12,class=CODE,space=0,reloc=2,group=0
	line	520
global __ptext12
__ptext12:
psect	text12
	file	"src\menu.c"
	line	520
	
_menu_update_time_value:
;incstack = 0
	callstack 23
	line	522
	
l9722:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u12751
	goto	u12750
u12751:
	goto	l9726
u12750:
	goto	l616
	line	529
	
l9726:; BSR set to: 2

	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u12761
	goto	u12760
u12761:
	goto	l9732
u12760:
	
l9728:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u12771
	goto	u12770
u12771:
	goto	l9732
u12770:
	line	531
	
l9730:; BSR set to: 2

	movlw	low(020h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	532
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	533
	goto	l9734
	line	536
	
l9732:; BSR set to: 2

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
	
l9734:; BSR set to: 0

	movlw	low(03Ah)
	movwf	(0+(menu_update_time_value@value_buf+02h))&0ffh
	line	544
	
l9736:; BSR set to: 0

	movlb	2	; () banked
		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u12781
	goto	u12780

u12781:
	goto	l9742
u12780:
	
l9738:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u12791
	goto	u12790
u12791:
	goto	l9742
u12790:
	line	546
	
l9740:; BSR set to: 2

	movlw	low(020h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	547
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	548
	goto	l9744
	line	551
	
l9742:; BSR set to: 2

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
	
l9744:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(menu_update_time_value@value_buf+05h))&0ffh
	line	558
	
l9746:; BSR set to: 0

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u12801
	goto	u12800

u12801:
	goto	l9754
u12800:
	
l9748:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12811
	goto	u12810

u12811:
	goto	l9754
u12810:
	line	560
	
l9750:; BSR set to: 2

		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_118)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_118)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(menu_update_time_value@value_buf)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c

	call	_sprintf	;wreg free
	line	561
	call	_menu_draw_clock	;wreg free
	goto	l616
	line	566
	
l9754:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u12821
	goto	u12820

u12821:
	goto	l9758
u12820:
	goto	l616
	line	570
	
l9758:; BSR set to: 2

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_time_value@screen_line))&0ffh
	line	571
		movlw	03h-1
	cpfsgt	((menu_update_time_value@screen_line))&0ffh
	goto	u12831
	goto	u12830

u12831:
	goto	l623
u12830:
	goto	l616
	line	572
	
l623:; BSR set to: 0

	line	574
	movff	(_menu),(menu_update_time_value@item_idx)
	line	578
	
l9762:; BSR set to: 0

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
	
l9764:; BSR set to: 0

	movff	(menu_update_time_value@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_update_time_value@flow_type),(c:is_time_field@flow_type)
	movf	((menu_update_time_value@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfss	status,2
	goto	u12841
	goto	u12840
u12841:
	goto	l9768
u12840:
	goto	l616
	line	588
	
l9768:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_119)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_119)
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
	
l9770:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	593
	
l9772:
		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_120)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_120)
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
	
l9774:
	line	599
	
l9776:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	600
	
l9778:
		movlw	low(STR_121)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_121)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	602
	
l9780:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	603
	
l9782:
		movlw	low(STR_122)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_122)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	604
	
l9784:
		movlw	low(menu_update_time_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	605
	
l9786:
		movlw	low(STR_123)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_123)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	606
	
l616:
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
psect	text13,class=CODE,space=0,reloc=2,group=0
	line	1346
global __ptext13
__ptext13:
psect	text13
	file	"src\menu.c"
	line	1346
	
_menu_draw_clock:
;incstack = 0
	callstack 23
	line	1349
	
l9424:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1350
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_222)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_222)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1353
	
l9426:
	movlw	low(0)
	movwf	((c:menu_draw_clock@i))^00h,c
	goto	l9506
	line	1355
	
l9428:; BSR set to: 2

	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_clock@i))^00h,c,w
	movwf	((c:menu_draw_clock@item_idx))^00h,c
	line	1356
	
l9430:; BSR set to: 2

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1359
	
l9432:
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
	
l9434:
	line	1365
	
l9436:
	movf	((c:menu_draw_clock@item_idx))^00h,c,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12181
	goto	u12180

u12181:
	goto	l9466
u12180:
	line	1367
	
l9438:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u12191
	goto	u12190
u12191:
	goto	l9462
u12190:
	line	1369
	
l9440:; BSR set to: 2

	movlw	low(02h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	line	1372
	
l9442:; BSR set to: 2

		movlw	2
	xorwf	((c:menu_draw_clock@item_idx))^00h,c,w
	btfsc	status,2
	goto	u12201
	goto	u12200

u12201:
	goto	l9446
u12200:
	line	1374
	
l9444:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u12211
	goto	u12210
u12211:
	goto	l9448
u12210:
	line	1377
	
l9446:; BSR set to: 2

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
	goto	l9470
	line	1382
	
l9448:; BSR set to: 2

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
	
l9450:
	movlw	low(0)
	movwf	((c:menu_draw_clock@j))^00h,c
	goto	l9456
	line	1384
	
l9452:
	movf	((c:menu_draw_clock@j))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1383
	
l9454:
	incf	((c:menu_draw_clock@j))^00h,c
	
l9456:
		movf	((c:menu_draw_clock@val_len))^00h,c,w
	subwf	((c:menu_draw_clock@j))^00h,c,w
	btfss	status,0
	goto	u12221
	goto	u12220

u12221:
	goto	l9452
u12220:
	line	1385
	
l9458:
	movf	((c:menu_draw_clock@val_len))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l9470
	line	1397
	
l9462:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l9446
	line	1404
	
l9466:; BSR set to: 2

	movlw	low(0)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l9446
	line	1409
	
l9470:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_clock@val_len_1446))^00h,c
	line	1411
	
l9472:
	movf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfss	status,2
	goto	u12231
	goto	u12230
u12231:
	goto	l9478
u12230:
	line	1414
	
l9474:
	movf	((c:menu_draw_clock@val_len_1446))^00h,c,w
	btfsc	status,2
	goto	u12241
	goto	u12240
u12241:
	goto	l9504
u12240:
	line	1415
	
l9476:
	movf	((c:menu_draw_clock@val_len_1446))^00h,c,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_print_at
	goto	l9504
	line	1420
	
l9478:
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
	
l9480:
	movf	((c:menu_draw_clock@actual_len))^00h,c,w
	sublw	low(012h)
	movwf	((c:menu_draw_clock@start_pos))^00h,c
	line	1423
	
l9482:
	movff	(c:menu_draw_clock@start_pos),(c:lcd_set_cursor@col)
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1424
	
l9484:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u12251
	goto	u12250

u12251:
	goto	l9488
u12250:
	
l9486:
		movlw	low(STR_224)
	movwf	((c:_menu_draw_clock$1452))^00h,c
	movlw	high(STR_224)
	movwf	((c:_menu_draw_clock$1452+1))^00h,c

	goto	l9490
	
l9488:
		movlw	low(STR_223)
	movwf	((c:_menu_draw_clock$1452))^00h,c
	movlw	high(STR_223)
	movwf	((c:_menu_draw_clock$1452+1))^00h,c

	
l9490:
		movff	(c:_menu_draw_clock$1452),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1452+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1427
	
l9492:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1429
	
l9494:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1430
	
l9496:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u12261
	goto	u12260

u12261:
	goto	l9500
u12260:
	
l9498:
		movlw	low(STR_226)
	movwf	((c:_menu_draw_clock$1456))^00h,c
	movlw	high(STR_226)
	movwf	((c:_menu_draw_clock$1456+1))^00h,c

	goto	l9502
	
l9500:
		movlw	low(STR_225)
	movwf	((c:_menu_draw_clock$1456))^00h,c
	movlw	high(STR_225)
	movwf	((c:_menu_draw_clock$1456+1))^00h,c

	
l9502:
		movff	(c:_menu_draw_clock$1456),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1456+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1353
	
l9504:
	incf	((c:menu_draw_clock@i))^00h,c
	
l9506:
		movlw	03h-0
	cpfslt	((c:menu_draw_clock@i))^00h,c
	goto	u12271
	goto	u12270

u12271:
	goto	l999
u12270:
	
l9508:
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
	goto	u12281
	goto	u12280

u12281:
	goto	l9428
u12280:
	line	1433
	
l999:
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
psect	text14,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
global __ptext14
__ptext14:
psect	text14
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
	
___lbmod:
;incstack = 0
	callstack 27
	movwf	((c:___lbmod@dividend))^00h,c
	line	9
	
l6544:
	movlw	low(08h)
	movwf	((c:___lbmod@counter))^00h,c
	line	10
	movlw	low(0)
	movwf	((c:___lbmod@rem))^00h,c
	line	12
	
l6546:
	bcf	status,0
	rlcf	((c:___lbmod@dividend))^00h,c,w
	rlcf	((c:___lbmod@rem))^00h,c,w
	movwf	((c:___lbmod@rem))^00h,c
	line	13
	
l6548:
	bcf status,0
	rlcf	((c:___lbmod@dividend))^00h,c

	line	14
	
l6550:
		movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c,w
	btfss	status,0
	goto	u7391
	goto	u7390

u7391:
	goto	l6554
u7390:
	line	15
	
l6552:
	movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c
	line	16
	
l6554:
	decfsz	((c:___lbmod@counter))^00h,c
	
	goto	l6546
	line	17
	
l6556:
	movf	((c:___lbmod@rem))^00h,c,w
	line	18
	
l1840:
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
psect	text15,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
global __ptext15
__ptext15:
psect	text15
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
	
___lbdiv:
;incstack = 0
	callstack 27
	movwf	((c:___lbdiv@dividend))^00h,c
	line	9
	
l6518:
	movlw	low(0)
	movwf	((c:___lbdiv@quotient))^00h,c
	line	10
	
l6520:
	movf	((c:___lbdiv@divisor))^00h,c,w
	btfsc	status,2
	goto	u7361
	goto	u7360
u7361:
	goto	l6540
u7360:
	line	11
	
l6522:
	movlw	low(01h)
	movwf	((c:___lbdiv@counter))^00h,c
	line	12
	goto	l6528
	line	13
	
l6524:
	bcf status,0
	rlcf	((c:___lbdiv@divisor))^00h,c

	line	14
	
l6526:
	incf	((c:___lbdiv@counter))^00h,c
	line	12
	
l6528:
	
	btfss	((c:___lbdiv@divisor))^00h,c,(7)&7
	goto	u7371
	goto	u7370
u7371:
	goto	l6524
u7370:
	line	17
	
l6530:
	bcf status,0
	rlcf	((c:___lbdiv@quotient))^00h,c

	line	18
		movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c,w
	btfss	status,0
	goto	u7381
	goto	u7380

u7381:
	goto	l6536
u7380:
	line	19
	
l6532:
	movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c
	line	20
	
l6534:
	bsf	(0+(0/8)+(c:___lbdiv@quotient))^00h,c,(0)&7
	line	22
	
l6536:
	bcf status,0
	rrcf	((c:___lbdiv@divisor))^00h,c

	line	23
	
l6538:
	decfsz	((c:___lbdiv@counter))^00h,c
	
	goto	l6530
	line	25
	
l6540:
	movf	((c:___lbdiv@quotient))^00h,c,w
	line	26
	
l1834:
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
;;		 -> STR_199(5), STR_198(6), STR_197(1), STR_196(1), 
;;		 -> STR_195(1), 
;;  sensor_name     2   43[COMRAM] PTR const unsigned char 
;;		 -> Fake(1), STR_202(5), STR_201(5), STR_200(9), 
;;  sensor          1   42[COMRAM] unsigned char 
;;  item_idx        1   45[COMRAM] unsigned char 
;;  i               1   46[COMRAM] unsigned char 
;;  setup_labels   10   24[COMRAM] PTR const unsigned char 
;;		 -> STR_199(5), STR_198(6), STR_197(1), STR_196(1), 
;;		 -> STR_195(1), 
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
psect	text16,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1223
global __ptext16
__ptext16:
psect	text16
	file	"src\menu.c"
	line	1223
	
_menu_draw_setup:
;incstack = 0
	callstack 23
	line	1228
	
l9906:
	call	_lcd_clear	;wreg free
	line	1229
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1230
	
l9908:
		movlw	low(STR_194)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_194)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1233
	
l9910:
	lfsr	2,(menu_draw_setup@F2659)
	lfsr	1,(menu_draw_setup@setup_labels)
	movlw	10-1
u13071:
	movff	plusw2,plusw1
	decf	wreg
	bc	u13071

	line	1236
	
l9912:
	movlw	low(0)
	movwf	((c:menu_draw_setup@i))^00h,c
	line	1238
	
l9918:
	movlb	2	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_setup@i))^00h,c,w
	movwf	((c:menu_draw_setup@item_idx))^00h,c
	line	1239
		movlw	05h-1
	cpfsgt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u13081
	goto	u13080

u13081:
	goto	l9922
u13080:
	goto	l952
	line	1242
	
l9922:; BSR set to: 2

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1245
	
l9924:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u13091
	goto	u13090

u13091:
	goto	l9958
u13090:
	line	1247
	
l9926:
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
	
l9928:
	movf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u13101
	goto	u13100
u13101:
	goto	l9936
u13100:
	
l9930:
		decf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u13111
	goto	u13110

u13111:
	goto	l9934
u13110:
	
l9932:
		movlw	low(STR_202)
	movwf	((c:_menu_draw_setup$1400))^00h,c
	movlw	high(STR_202)
	movwf	((c:_menu_draw_setup$1400+1))^00h,c

	goto	l935
	
l9934:
		movlw	low(STR_201)
	movwf	((c:_menu_draw_setup$1400))^00h,c
	movlw	high(STR_201)
	movwf	((c:_menu_draw_setup$1400+1))^00h,c

	
l935:
		movff	(c:_menu_draw_setup$1400),(c:menu_draw_setup@sensor_name)
	movff	(c:_menu_draw_setup$1400+1),(c:menu_draw_setup@sensor_name+1)

	goto	l931
	
l9936:
		movlw	low(STR_200)
	movwf	((c:menu_draw_setup@sensor_name))^00h,c
	movlw	high(STR_200)
	movwf	((c:menu_draw_setup@sensor_name+1))^00h,c

	
l931:
	line	1252
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13121
	goto	u13120

u13121:
	goto	l9946
u13120:
	line	1255
	
l9938:; BSR set to: 2

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1256
	
l9940:
		movlw	low(STR_203)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_203)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1257
	
l9942:
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1258
	
l9944:
		movlw	low(STR_204)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_204)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1259
	goto	l9948
	line	1263
	
l9946:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1267
	
l9948:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1268
	
l9950:
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
	goto	u13131
	goto	u13130
u13131:
	goto	l9954
u13130:
	
l9952:
		movlw	low(STR_206)
	movwf	((c:_menu_draw_setup$1406))^00h,c
	movlw	high(STR_206)
	movwf	((c:_menu_draw_setup$1406+1))^00h,c

	goto	l9956
	
l9954:
		movlw	low(STR_205)
	movwf	((c:_menu_draw_setup$1406))^00h,c
	movlw	high(STR_205)
	movwf	((c:_menu_draw_setup$1406+1))^00h,c

	
l9956:
		movff	(c:_menu_draw_setup$1406),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1406+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1269
	goto	l9984
	line	1273
	
l9958:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_labels)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:menu_draw_setup@label)
	movff	postdec2,(c:menu_draw_setup@label+1)
	line	1275
	
l9960:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13141
	goto	u13140

u13141:
	goto	l9970
u13140:
	line	1278
	
l9962:; BSR set to: 2

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1279
	
l9964:
		movlw	low(STR_207)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_207)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1280
	
l9966:
		movff	(c:menu_draw_setup@label),(c:lcd_print@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1281
	
l9968:
		movlw	low(STR_208)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_208)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1282
	goto	l9972
	line	1286
	
l9970:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@label),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1290
	
l9972:
		movlw	3
	xorwf	((c:menu_draw_setup@item_idx))^00h,c,w
	btfss	status,2
	goto	u13151
	goto	u13150

u13151:
	goto	l9984
u13150:
	line	1293
	
l9974:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1294
	
l9976:
	movlb	4	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u13161
	goto	u13160
u13161:
	goto	l9980
u13160:
	
l9978:; BSR set to: 4

		movlw	low(STR_210)
	movwf	((c:_menu_draw_setup$1414))^00h,c
	movlw	high(STR_210)
	movwf	((c:_menu_draw_setup$1414+1))^00h,c

	goto	l9982
	
l9980:; BSR set to: 4

		movlw	low(STR_209)
	movwf	((c:_menu_draw_setup$1414))^00h,c
	movlw	high(STR_209)
	movwf	((c:_menu_draw_setup$1414+1))^00h,c

	
l9982:; BSR set to: 4

		movff	(c:_menu_draw_setup$1414),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1414+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1236
	
l9984:
	incf	((c:menu_draw_setup@i))^00h,c
	
l9986:
		movlw	03h-1
	cpfsgt	((c:menu_draw_setup@i))^00h,c
	goto	u13171
	goto	u13170

u13171:
	goto	l9918
u13170:
	line	1298
	
l952:
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
psect	text17,class=CODE,space=0,reloc=2,group=0
	line	1064
global __ptext17
__ptext17:
psect	text17
	file	"src\menu.c"
	line	1064
	
_menu_draw_options:
;incstack = 0
	callstack 23
	line	1067
	
l9510:
	call	_lcd_clear	;wreg free
	line	1068
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1069
	
l9512:
		movlw	low(STR_184)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_184)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1072
	
l9514:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	line	1074
	
l9520:
	movlb	2	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_options@i))^00h,c,w
	movwf	((c:menu_draw_options@item_index))^00h,c
	line	1075
		movlw	05h-1
	cpfsgt	((c:menu_draw_options@item_index))^00h,c
	goto	u12291
	goto	u12290

u12291:
	goto	l9524
u12290:
	goto	l876
	line	1078
	
l9524:; BSR set to: 2

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1081
	
l9526:
	movf	((c:menu_draw_options@item_index))^00h,c,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12301
	goto	u12300

u12301:
	goto	l9536
u12300:
	line	1083
	
l9528:; BSR set to: 2

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1084
	
l9530:
		movlw	low(STR_185)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_185)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1085
	
l9532:
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
	
l9534:
		movlw	low(STR_186)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_186)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1087
	goto	l9538
	line	1091
	
l9536:; BSR set to: 2

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
	
l9538:
	incf	((c:menu_draw_options@i))^00h,c
	
l9540:
		movlw	03h-1
	cpfsgt	((c:menu_draw_options@i))^00h,c
	goto	u12311
	goto	u12310

u12311:
	goto	l9520
u12310:
	line	1094
	
l876:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_options
	__end_of_menu_draw_options:
	signat	_menu_draw_options,89
	global	_lcd_clear

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 161 in file "src\main.c"
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
psect	text18,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	161
global __ptext18
__ptext18:
psect	text18
	file	"src\main.c"
	line	161
	
_lcd_clear:
;incstack = 0
	callstack 24
	line	163
	
l9180:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	164
	
l9182:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u16097:
decfsz	wreg,f
	bra	u16097
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u16097
	nop2
asmopt pop

	line	165
	
l162:
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
psect	text19,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1096
global __ptext19
__ptext19:
psect	text19
	file	"src\menu.c"
	line	1096
	
_menu_draw_input:
;incstack = 0
	callstack 23
	line	1101
	
l9788:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1103
	
l9790:
		movlw	low(menu_draw_input@title)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_187)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_187)
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
	
l9792:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@title)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1107
	
l9794:
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
	
l9796:; BSR set to: 0

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
	
l9798:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@i))&0ffh
	goto	l9902
	line	1113
	
l9800:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_input@i))&0ffh,w
	movwf	((menu_draw_input@item_idx))&0ffh
	line	1114
	
l9802:; BSR set to: 0

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1117
	
l9804:
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
	
l9806:
	line	1123
	
l9808:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12851
	goto	u12850

u12851:
	goto	l9858
u12850:
	line	1125
	
l9810:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u12861
	goto	u12860
u12861:
	goto	l9854
u12860:
	line	1127
	
l9812:; BSR set to: 2

	movlw	low(02h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	line	1130
	
l9814:; BSR set to: 0

	movff	(menu_draw_input@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_option_field@flow_type)
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u12871
	goto	u12870
u12871:
	goto	l9828
u12870:
	line	1132
	
l9816:
	movlb	2	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u12881
	goto	u12880
u12881:
	goto	l9830
u12880:
	line	1135
	
l9818:; BSR set to: 2

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
	
l9820:
	movlb	0	; () banked
	movf	((menu_draw_input@opts))&0ffh,w
iorwf	((menu_draw_input@opts+1))&0ffh,w
	btfsc	status,2
	goto	u12891
	goto	u12890

u12891:
	goto	l9828
u12890:
	
l9822:; BSR set to: 0

	movf	((menu_draw_input@flag))&0ffh,w
iorwf	((menu_draw_input@flag+1))&0ffh,w
	btfsc	status,2
	goto	u12901
	goto	u12900

u12901:
	goto	l9828
u12900:
	
l9824:; BSR set to: 0

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
	goto	u12911
	goto	u12910
u12911:
	goto	l9828
u12910:
	line	1140
	
l9826:; BSR set to: 0

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
	goto	l9862
	line	1144
	
l9828:
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
	goto	l9862
	line	1150
	
l9830:; BSR set to: 2

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts_1362)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts_1362+1)
	line	1151
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag_1366)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag_1366+1)
	line	1153
	
l9832:
	movlb	0	; () banked
	movf	((menu_draw_input@opts_1362))&0ffh,w
iorwf	((menu_draw_input@opts_1362+1))&0ffh,w
	btfsc	status,2
	goto	u12921
	goto	u12920

u12921:
	goto	l9850
u12920:
	
l9834:; BSR set to: 0

	movf	((menu_draw_input@flag_1366))&0ffh,w
iorwf	((menu_draw_input@flag_1366+1))&0ffh,w
	btfsc	status,2
	goto	u12931
	goto	u12930

u12931:
	goto	l9850
u12930:
	
l9836:; BSR set to: 0

	movff	(menu_draw_input@flag_1366),fsr2l
	movff	(menu_draw_input@flag_1366+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	01h
	addwf	((menu_draw_input@opts_1362))&0ffh,w
	movwf	(??_menu_draw_input+1+0)^00h,c
	movlw	0
	addwfc	((menu_draw_input@opts_1362+1))&0ffh,w
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
	goto	u12941
	goto	u12940
u12941:
	goto	l9850
u12940:
	line	1155
	
l9838:; BSR set to: 0

	movff	(menu_draw_input@flag_1366),fsr2l
	movff	(menu_draw_input@flag_1366+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movf	((??_menu_draw_input+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_input+1+0
	movff	prodh,??_menu_draw_input+1+0+1
	movf	(??_menu_draw_input+1+0)^00h,c,w
	addwf	((menu_draw_input@opts_1362))&0ffh,w
	movwf	(??_menu_draw_input+3+0)^00h,c
	movf	(??_menu_draw_input+1+1)^00h,c,w
	addwfc	((menu_draw_input@opts_1362+1))&0ffh,w
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
	
l9840:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j))&0ffh
	goto	l9846
	line	1157
	
l9842:; BSR set to: 0

	movf	((menu_draw_input@j))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1156
	
l9844:; BSR set to: 0

	incf	((menu_draw_input@j))&0ffh
	
l9846:; BSR set to: 0

		movf	((menu_draw_input@val_len))&0ffh,w
	subwf	((menu_draw_input@j))&0ffh,w
	btfss	status,0
	goto	u12951
	goto	u12950

u12951:
	goto	l9842
u12950:
	line	1158
	
l9848:; BSR set to: 0

	movf	((menu_draw_input@val_len))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1159
	goto	l9862
	line	1162
	
l9850:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_188)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_188)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l9862
	line	1175
	
l9854:; BSR set to: 2

	movlw	low(01h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l9828
	line	1182
	
l9858:; BSR set to: 2

	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l9828
	line	1187
	
l9862:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_1370))&0ffh
	line	1188
	
l9864:; BSR set to: 0

	movf	((menu_draw_input@val_len_1370))&0ffh,w
	btfsc	status,2
	goto	u12961
	goto	u12960
u12961:
	goto	l9900
u12960:
	
l9866:; BSR set to: 0

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
		movlw	low(STR_189)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_189)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u12971
	goto	u12970

u12971:
	goto	l9900
u12970:
	line	1191
	
l9868:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u12981
	goto	u12980
u12981:
	goto	l9876
u12980:
	
l9870:; BSR set to: 2

	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12991
	goto	u12990

u12991:
	goto	l9876
u12990:
	line	1194
	
l9872:; BSR set to: 2

	movff	(menu_draw_input@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_numeric_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u13001
	goto	u13000
u13001:
	goto	l9900
u13000:
	
l9874:
	movff	(menu_draw_input@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_time_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u13011
	goto	u13010
u13011:
	goto	l9876
u13010:
	goto	l9900
	line	1201
	
l9876:
	movlb	0	; () banked
	movf	((menu_draw_input@show_brackets))&0ffh,w
	btfss	status,2
	goto	u13021
	goto	u13020
u13021:
	goto	l9880
u13020:
	line	1204
	
l9878:; BSR set to: 0

	movf	((menu_draw_input@val_len_1370))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	1205
	goto	l9900
	line	1209
	
l9880:; BSR set to: 0

	movf	((menu_draw_input@val_len_1370))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_input@start_pos))&0ffh
	line	1210
	
l9882:; BSR set to: 0

	movff	(menu_draw_input@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1213
	
l9884:
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u13031
	goto	u13030

u13031:
	goto	l9888
u13030:
	
l9886:; BSR set to: 0

		movlw	low(STR_191)
	movwf	((_menu_draw_input$1376))&0ffh
	movlw	high(STR_191)
	movwf	((_menu_draw_input$1376+1))&0ffh

	goto	l9890
	
l9888:; BSR set to: 0

		movlw	low(STR_190)
	movwf	((_menu_draw_input$1376))&0ffh
	movlw	high(STR_190)
	movwf	((_menu_draw_input$1376+1))&0ffh

	
l9890:; BSR set to: 0

		movff	(_menu_draw_input$1376),(c:lcd_print@str)
	movff	(_menu_draw_input$1376+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1215
	
l9892:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1217
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u13041
	goto	u13040

u13041:
	goto	l9896
u13040:
	
l9894:; BSR set to: 0

		movlw	low(STR_193)
	movwf	((_menu_draw_input$1380))&0ffh
	movlw	high(STR_193)
	movwf	((_menu_draw_input$1380+1))&0ffh

	goto	l9898
	
l9896:; BSR set to: 0

		movlw	low(STR_192)
	movwf	((_menu_draw_input$1380))&0ffh
	movlw	high(STR_192)
	movwf	((_menu_draw_input$1380+1))&0ffh

	
l9898:; BSR set to: 0

		movff	(_menu_draw_input$1380),(c:lcd_print@str)
	movff	(_menu_draw_input$1380+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1111
	
l9900:
	movlb	0	; () banked
	incf	((menu_draw_input@i))&0ffh
	
l9902:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_input@i))&0ffh
	goto	u13051
	goto	u13050

u13051:
	goto	l917
u13050:
	
l9904:; BSR set to: 0

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
	goto	u13061
	goto	u13060

u13061:
	goto	l9800
u13060:
	line	1221
	
l917:; BSR set to: 0

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
;;		 -> value_enable(10), value_relay_pulse(10), NULL(0), STR_61(1), 
;;		 -> STR_60(1), STR_59(9), STR_58(6), STR_57(6), 
;;		 -> STR_56(1), STR_55(1), STR_54(1), STR_53(5), 
;;		 -> STR_52(5), STR_51(1), STR_50(1), STR_49(1), 
;;		 -> STR_48(4), STR_47(2), STR_46(1), STR_45(1), 
;;		 -> STR_44(1), STR_43(5), STR_42(4), STR_41(1), 
;;		 -> STR_40(1), STR_39(1), STR_38(8), STR_37(7), 
;;		 -> STR_36(1), STR_35(1), STR_34(5), STR_33(5), 
;;		 -> STR_32(9), STR_31(1), STR_30(1), STR_29(1), 
;;		 -> STR_28(8), STR_27(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   16[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_clock@value_buf(15), value_clock_display(10), value_end_runtime(10), value_clock_enable(10), 
;;		 -> menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), value_rlylow(10), 
;;		 -> value_flow_type(10), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), value_relay_pulse(10), NULL(0), STR_61(1), 
;;		 -> STR_60(1), STR_59(9), STR_58(6), STR_57(6), 
;;		 -> STR_56(1), STR_55(1), STR_54(1), STR_53(5), 
;;		 -> STR_52(5), STR_51(1), STR_50(1), STR_49(1), 
;;		 -> STR_48(4), STR_47(2), STR_46(1), STR_45(1), 
;;		 -> STR_44(1), STR_43(5), STR_42(4), STR_41(1), 
;;		 -> STR_40(1), STR_39(1), STR_38(8), STR_37(7), 
;;		 -> STR_36(1), STR_35(1), STR_34(5), STR_33(5), 
;;		 -> STR_32(9), STR_31(1), STR_30(1), STR_29(1), 
;;		 -> STR_28(8), STR_27(9), 
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
psect	text20,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
global __ptext20
__ptext20:
psect	text20
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
	
_strlen:; BSR set to: 0

;incstack = 0
	callstack 26
	line	8
	
l9114:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l9118
	line	10
	
l9116:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l9118:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11647
	tblrd	*
	
	movf	tablat,w
	bra	u11640
u11647:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11640:
	iorlw	0
	btfss	status,2
	goto	u11651
	goto	u11650
u11651:
	goto	l9116
u11650:
	line	12
	
l9120:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l2130:
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
;;		 -> STR_219(5), value_clock_display(10), STR_217(9), STR_216(6), 
;;		 -> STR_215(6), value_end_runtime(10), value_clock_enable(10), STR_188(6), 
;;		 -> menu_update_edit_value@value_buf(10), value_no_flow_bp(10), STR_171(4), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), STR_166(4), STR_165(2), 
;;		 -> value_flow_units(10), STR_164(9), STR_163(6), STR_162(6), 
;;		 -> value_rlylow(10), STR_161(5), STR_160(5), STR_159(8), 
;;		 -> STR_158(7), value_flow_type(10), STR_157(5), STR_156(5), 
;;		 -> STR_155(5), STR_154(9), STR_153(6), STR_152(6), 
;;		 -> value_high_tbp(10), value_high_temp(10), STR_147(5), value_back(5), 
;;		 -> STR_146(5), STR_145(5), value_display(10), STR_144(9), 
;;		 -> STR_143(6), STR_142(6), value_rlyslp(10), STR_141(9), 
;;		 -> STR_140(6), STR_139(6), value_rlyplp(10), STR_138(9), 
;;		 -> STR_137(6), STR_136(6), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), STR_128(9), value_sensor(12), 
;;		 -> value_enable(10), value_relay_pulse(10), NULL(0), STR_61(1), 
;;		 -> STR_60(1), STR_59(9), STR_58(6), STR_57(6), 
;;		 -> STR_56(1), STR_55(1), STR_54(1), STR_53(5), 
;;		 -> STR_52(5), STR_51(1), STR_50(1), STR_49(1), 
;;		 -> STR_48(4), STR_47(2), STR_46(1), STR_45(1), 
;;		 -> STR_44(1), STR_43(5), STR_42(4), STR_41(1), 
;;		 -> STR_40(1), STR_39(1), STR_38(8), STR_37(7), 
;;		 -> STR_36(1), STR_35(1), STR_34(5), STR_33(5), 
;;		 -> STR_32(9), STR_31(1), STR_30(1), STR_29(1), 
;;		 -> STR_28(8), STR_27(9), 
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
psect	text21,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
global __ptext21
__ptext21:
psect	text21
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
	
_strcpy:
;incstack = 0
	callstack 26
	line	18
	
l9108:
		movff	(c:strcpy@to),(c:strcpy@cp)
	movff	(c:strcpy@to+1),(c:strcpy@cp+1)

	line	19
	goto	l9112
	line	20
	
l9110:
	infsnz	((c:strcpy@cp))^00h,c
	incf	((c:strcpy@cp+1))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l9112:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movff	(c:strcpy@cp),fsr2l
	movff	(c:strcpy@cp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11627
	tblrd	*
	
	movf	tablat,w
	bra	u11620
u11627:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11620:
	movwf	indf2
	movf	indf2,w
	btfss	status,2
	goto	u11631
	goto	u11630
u11631:
	goto	l9110
u11630:
	line	24
	
l2124:
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
;;		 -> STR_261(5), STR_260(6), STR_259(6), STR_258(8), 
;;		 -> STR_189(1), STR_61(1), STR_60(1), STR_59(9), 
;;		 -> STR_58(6), STR_57(6), STR_56(1), STR_55(1), 
;;		 -> STR_54(1), STR_53(5), STR_52(5), STR_51(1), 
;;		 -> STR_50(1), STR_49(1), STR_48(4), STR_47(2), 
;;		 -> STR_46(1), STR_45(1), STR_44(1), STR_43(5), 
;;		 -> STR_42(4), STR_41(1), STR_40(1), STR_39(1), 
;;		 -> STR_38(8), STR_37(7), STR_36(1), STR_35(1), 
;;		 -> STR_34(5), STR_33(5), STR_32(9), STR_31(1), 
;;		 -> STR_30(1), STR_29(1), STR_28(8), STR_27(9), 
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
psect	text22,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
global __ptext22
__ptext22:
psect	text22
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
	
_strcmp:
;incstack = 0
	callstack 26
	line	37
	
l6448:
	goto	l6452
	line	38
	
l6450:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l6452:
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
	goto	u7301
	goto	u7300
u7301:
	goto	l6456
u7300:
	
l6454:
	movff	(c:strcmp@s1),fsr2l
	movff	(c:strcmp@s1+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u7311
	goto	u7310
u7311:
	goto	l6450
u7310:
	line	41
	
l6456:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l2118:
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
;;		 -> menu_draw_clock@value_buf(15), STR_222(6), Fake(1), STR_202(5), 
;;		 -> STR_201(5), STR_200(9), STR_199(5), STR_198(6), 
;;		 -> STR_197(1), STR_196(1), STR_195(1), menu_draw_input@value_buf(15), 
;;		 -> menu_draw_input@title(10), STR_113(5), STR_112(8), STR_111(10), 
;;		 -> STR_110(8), STR_109(7), STR_108(5), STR_107(8), 
;;		 -> STR_106(8), STR_105(12), STR_104(9), STR_103(11), 
;;		 -> STR_102(10), STR_101(6), STR_100(5), STR_99(7), 
;;		 -> STR_98(7), STR_97(5), STR_96(8), STR_95(8), 
;;		 -> STR_94(11), STR_93(8), STR_92(5), STR_91(7), 
;;		 -> STR_90(7), STR_89(5), STR_88(8), STR_87(9), 
;;		 -> STR_86(9), STR_85(10), STR_84(11), STR_83(10), 
;;		 -> STR_82(7), STR_81(7), STR_80(5), STR_79(8), 
;;		 -> STR_78(8), STR_77(8), STR_76(9), STR_75(6), 
;;		 -> STR_74(6), STR_73(13), STR_72(9), STR_71(12), 
;;		 -> STR_70(11), STR_69(10), STR_68(7), STR_67(7), 
;;		 -> STR_66(5), STR_65(6), STR_64(13), STR_63(11), 
;;		 -> STR_62(10), 
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
psect	text23,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	612
global __ptext23
__ptext23:
psect	text23
	file	"src\menu.c"
	line	612
	
_lcd_print_at:
;incstack = 0
	callstack 23
	movwf	((c:lcd_print_at@row))^00h,c
	line	614
	
l9100:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	615
	
l9102:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	616
	
l629:
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
psect	text24,class=CODE,space=0,reloc=2,group=0
	line	618
global __ptext24
__ptext24:
psect	text24
	file	"src\menu.c"
	line	618
	
_lcd_clear_line:
;incstack = 0
	callstack 23
	movwf	((c:lcd_clear_line@row))^00h,c
	line	620
	
l9104:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	621
	
l9106:
		movlw	low(STR_124)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_124)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	622
	
l632:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear_line
	__end_of_lcd_clear_line:
	signat	_lcd_clear_line,4217
	global	_lcd_set_cursor

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 167 in file "src\main.c"
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
psect	text25,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	167
global __ptext25
__ptext25:
psect	text25
	file	"src\main.c"
	line	167
	
_lcd_set_cursor:
;incstack = 0
	callstack 24
	movwf	((c:lcd_set_cursor@row))^00h,c
	line	170
	
l9082:
	goto	l9096
	line	173
	
l9084:
	movlw	low(080h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	174
	goto	l9098
	line	176
	
l9086:
	movlw	low(0C0h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	177
	goto	l9098
	line	179
	
l9088:
	movlw	low(094h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	180
	goto	l9098
	line	182
	
l9090:
	movlw	low(0D4h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	183
	goto	l9098
	line	170
	
l9096:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l9084
	xorlw	1^0	; case 1
	skipnz
	goto	l9086
	xorlw	2^1	; case 2
	skipnz
	goto	l9088
	xorlw	3^2	; case 3
	skipnz
	goto	l9090
	goto	l9084

	line	188
	
l9098:
	movf	((c:lcd_set_cursor@address))^00h,c,w
	addwf	((c:lcd_set_cursor@col))^00h,c,w
	
	call	_lcd_cmd
	line	189
	
l172:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
	signat	_lcd_set_cursor,8313
	global	_lcd_print

;; *************** function _lcd_print *****************
;; Defined at:
;;		line 153 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_226(2), STR_225(2), STR_224(2), STR_223(2), 
;;		 -> menu_draw_clock@value_buf(15), STR_222(6), STR_210(2), STR_209(2), 
;;		 -> STR_208(2), STR_207(2), STR_206(2), STR_205(2), 
;;		 -> STR_204(2), STR_203(2), Fake(1), STR_202(5), 
;;		 -> STR_201(5), STR_200(9), STR_199(5), STR_198(6), 
;;		 -> STR_197(1), STR_196(1), STR_195(1), STR_194(21), 
;;		 -> STR_193(2), STR_192(2), STR_191(2), STR_190(2), 
;;		 -> menu_draw_input@value_buf(15), menu_draw_input@title(10), STR_186(2), STR_185(2), 
;;		 -> STR_184(21), STR_183(2), STR_182(2), STR_181(6), 
;;		 -> menu_update_numeric_value@value_buf(6), STR_180(2), STR_179(2), STR_178(7), 
;;		 -> menu_update_edit_value@display_buf(10), STR_124(21), STR_123(2), STR_122(2), 
;;		 -> STR_121(8), menu_update_time_value@value_buf(6), STR_113(5), STR_112(8), 
;;		 -> STR_111(10), STR_110(8), STR_109(7), STR_108(5), 
;;		 -> STR_107(8), STR_106(8), STR_105(12), STR_104(9), 
;;		 -> STR_103(11), STR_102(10), STR_101(6), STR_100(5), 
;;		 -> STR_99(7), STR_98(7), STR_97(5), STR_96(8), 
;;		 -> STR_95(8), STR_94(11), STR_93(8), STR_92(5), 
;;		 -> STR_91(7), STR_90(7), STR_89(5), STR_88(8), 
;;		 -> STR_87(9), STR_86(9), STR_85(10), STR_84(11), 
;;		 -> STR_83(10), STR_82(7), STR_81(7), STR_80(5), 
;;		 -> STR_79(8), STR_78(8), STR_77(8), STR_76(9), 
;;		 -> STR_75(6), STR_74(6), STR_73(13), STR_72(9), 
;;		 -> STR_71(12), STR_70(11), STR_69(10), STR_68(7), 
;;		 -> STR_67(7), STR_66(5), STR_65(6), STR_64(13), 
;;		 -> STR_63(11), STR_62(10), STR_23(8), STR_22(12), 
;;		 -> STR_17(6), STR_16(12), STR_4(16), STR_3(13), 
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
psect	text26,class=CODE,space=0,reloc=2,group=0
	line	153
global __ptext26
__ptext26:
psect	text26
	file	"src\main.c"
	line	153
	
_lcd_print:
;incstack = 0
	callstack 23
	line	155
	
l9074:
	goto	l9080
	line	157
	
l9076:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11597
	tblrd	*
	
	movf	tablat,w
	bra	u11590
u11597:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11590:
	
	call	_lcd_data
	
l9078:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	155
	
l9080:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11607
	tblrd	*
	
	movf	tablat,w
	bra	u11600
u11607:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11600:
	iorlw	0
	btfss	status,2
	goto	u11611
	goto	u11610
u11611:
	goto	l9076
u11610:
	line	159
	
l159:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print
	__end_of_lcd_print:
	signat	_lcd_print,4217
	global	_lcd_data

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 145 in file "src\main.c"
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
psect	text27,class=CODE,space=0,reloc=2,group=0
	line	145
global __ptext27
__ptext27:
psect	text27
	file	"src\main.c"
	line	145
	
_lcd_data:
;incstack = 0
	callstack 23
	movwf	((c:lcd_data@data))^00h,c
	line	147
	
l9068:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	148
	
l9070:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	149
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	150
	
l9072:
	asmopt push
asmopt off
	movlw	133
u16107:
decfsz	wreg,f
	bra	u16107
	nop
asmopt pop

	line	151
	
l153:
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
psect	text28,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	229
global __ptext28
__ptext28:
psect	text28
	file	"src\menu.c"
	line	229
	
_is_time_field:
;incstack = 0
	callstack 27
	movwf	((c:is_time_field@line))^00h,c
	line	231
	
l6034:
	movf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6471
	goto	u6470
u6471:
	goto	l6050
u6470:
	line	234
	
l6036:
	movlw	low(01h)
	movwf	((c:_is_time_field$1135))^00h,c
	
l6038:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6481
	goto	u6480

u6481:
	goto	l502
u6480:
	
l6040:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6491
	goto	u6490

u6491:
	goto	l502
u6490:
	
l6042:
		movlw	8
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6501
	goto	u6500

u6501:
	goto	l502
u6500:
	
l6044:
	movlw	low(0)
	movwf	((c:_is_time_field$1135))^00h,c
	
l502:
	movf	((c:_is_time_field$1135))^00h,c,w
	goto	l503
	line	236
	
l6050:
		decf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6511
	goto	u6510

u6511:
	goto	l6058
u6510:
	line	239
	
l6052:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6521
	goto	u6520

u6521:
	movlw	1
	goto	u6530
u6520:
	movlw	0
u6530:
	goto	l503
	line	241
	
l6058:
		movlw	2
	xorwf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6541
	goto	u6540

u6541:
	goto	l6072
u6540:
	line	243
	
l6060:
	movf	((c:is_time_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u6551
	goto	u6550
u6551:
	goto	l6068
u6550:
	line	246
	
l6062:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6561
	goto	u6560

u6561:
	movlw	1
	goto	u6570
u6560:
	movlw	0
u6570:
	goto	l503
	line	251
	
l6068:
		movlw	4
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6581
	goto	u6580

u6581:
	movlw	1
	goto	u6590
u6580:
	movlw	0
u6590:
	goto	l503
	line	255
	
l6072:
	movlw	(0)&0ffh
	line	256
	
l503:
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
psect	text29,class=CODE,space=0,reloc=2,group=0
	line	261
global __ptext29
__ptext29:
psect	text29
	file	"src\menu.c"
	line	261
	
_is_option_field:
;incstack = 0
	callstack 26
	movwf	((c:is_option_field@line))^00h,c
	line	264
	
l6162:
	movf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6711
	goto	u6710
u6711:
	goto	l6166
u6710:
	
l6164:
		decf	((c:is_option_field@line))^00h,c,w
	btfss	status,2
	goto	u6721
	goto	u6720

u6721:
	goto	l6170
u6720:
	line	265
	
l6166:
	movlw	(01h)&0ffh
	goto	l515
	line	267
	
l6170:
	movf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6731
	goto	u6730
u6731:
	goto	l6188
u6730:
	line	270
	
l6172:
	movlw	low(01h)
	movwf	((c:_is_option_field$1140))^00h,c
	
l6174:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6741
	goto	u6740

u6741:
	goto	l518
u6740:
	
l6176:
		movlw	10
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6751
	goto	u6750

u6751:
	goto	l518
u6750:
	
l6178:
		movlw	11
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6761
	goto	u6760

u6761:
	goto	l518
u6760:
	
l6180:
		movlw	12
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6771
	goto	u6770

u6771:
	goto	l518
u6770:
	
l6182:
	movlw	low(0)
	movwf	((c:_is_option_field$1140))^00h,c
	
l518:
	movf	((c:_is_option_field$1140))^00h,c,w
	goto	l515
	line	272
	
l6188:
		decf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6781
	goto	u6780

u6781:
	goto	l6202
u6780:
	line	275
	
l6190:
	movlw	low(01h)
	movwf	((c:_is_option_field$1141))^00h,c
	
l6192:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6791
	goto	u6790

u6791:
	goto	l522
u6790:
	
l6194:
		movlw	7
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6801
	goto	u6800

u6801:
	goto	l522
u6800:
	
l6196:
	movlw	low(0)
	movwf	((c:_is_option_field$1141))^00h,c
	
l522:
	movf	((c:_is_option_field$1141))^00h,c,w
	goto	l515
	line	277
	
l6202:
		movlw	2
	xorwf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6811
	goto	u6810

u6811:
	goto	l6236
u6810:
	line	279
	
l6204:
	movf	((c:is_option_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u6821
	goto	u6820
u6821:
	goto	l6222
u6820:
	line	282
	
l6206:
	movlw	low(01h)
	movwf	((c:_is_option_field$1142))^00h,c
	
l6208:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6831
	goto	u6830

u6831:
	goto	l527
u6830:
	
l6210:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6841
	goto	u6840

u6841:
	goto	l527
u6840:
	
l6212:
		movlw	8
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6851
	goto	u6850

u6851:
	goto	l527
u6850:
	
l6214:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6861
	goto	u6860

u6861:
	goto	l527
u6860:
	
l6216:
	movlw	low(0)
	movwf	((c:_is_option_field$1142))^00h,c
	
l527:
	movf	((c:_is_option_field$1142))^00h,c,w
	goto	l515
	line	287
	
l6222:
	movlw	low(01h)
	movwf	((c:_is_option_field$1143))^00h,c
	
l6224:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6871
	goto	u6870

u6871:
	goto	l530
u6870:
	
l6226:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6881
	goto	u6880

u6881:
	goto	l530
u6880:
	
l6228:
		movlw	5
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6891
	goto	u6890

u6891:
	goto	l530
u6890:
	
l6230:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6901
	goto	u6900

u6901:
	goto	l530
u6900:
	
l6232:
	movlw	low(0)
	movwf	((c:_is_option_field$1143))^00h,c
	
l530:
	movf	((c:_is_option_field$1143))^00h,c,w
	goto	l515
	line	291
	
l6236:
	movlw	(0)&0ffh
	line	292
	
l515:
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
psect	text30,class=CODE,space=0,reloc=2,group=0
	line	197
global __ptext30
__ptext30:
psect	text30
	file	"src\menu.c"
	line	197
	
_is_numeric_field:
;incstack = 0
	callstack 27
	movwf	((c:is_numeric_field@line))^00h,c
	line	199
	
l9364:
	movf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u12041
	goto	u12040
u12041:
	goto	l9382
u12040:
	line	202
	
l9366:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1128))^00h,c
	
l9368:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12051
	goto	u12050

u12051:
	goto	l486
u12050:
	
l9370:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12061
	goto	u12060

u12061:
	goto	l486
u12060:
	
l9372:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12071
	goto	u12070

u12071:
	goto	l486
u12070:
	
l9374:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12081
	goto	u12080

u12081:
	goto	l486
u12080:
	
l9376:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1128))^00h,c
	
l486:
	movf	((c:_is_numeric_field$1128))^00h,c,w
	goto	l487
	line	204
	
l9382:
		decf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u12091
	goto	u12090

u12091:
	goto	l9398
u12090:
	line	207
	
l9384:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1129))^00h,c
	
l9386:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12101
	goto	u12100

u12101:
	goto	l491
u12100:
	
l9388:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12111
	goto	u12110

u12111:
	goto	l491
u12110:
	
l9390:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12121
	goto	u12120

u12121:
	goto	l491
u12120:
	
l9392:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1129))^00h,c
	
l491:
	movf	((c:_is_numeric_field$1129))^00h,c,w
	goto	l487
	line	209
	
l9398:
		movlw	2
	xorwf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u12131
	goto	u12130

u12131:
	goto	l9416
u12130:
	line	211
	
l9400:
	movf	((c:is_numeric_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u12141
	goto	u12140
u12141:
	goto	l9416
u12140:
	line	214
	
l9402:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1130))^00h,c
	
l9404:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12151
	goto	u12150

u12151:
	goto	l496
u12150:
	
l9406:
		movlw	5
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12161
	goto	u12160

u12161:
	goto	l496
u12160:
	
l9408:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12171
	goto	u12170

u12171:
	goto	l496
u12170:
	
l9410:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1130))^00h,c
	
l496:
	movf	((c:_is_numeric_field$1130))^00h,c,w
	goto	l487
	line	219
	
l9416:
	movlw	(0)&0ffh
	line	224
	
l487:
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
psect	text31,class=CODE,space=0,reloc=2,group=0
	line	298
global __ptext31
__ptext31:
psect	text31
	file	"src\menu.c"
	line	298
	
_get_option_edit_flag:
;incstack = 0
	callstack 26
	movwf	((c:get_option_edit_flag@line))^00h,c
	line	301
	
l6240:
	movf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6911
	goto	u6910
u6911:
	goto	l6246
u6910:
	line	302
	
l6242:
		movlw	low(_enable_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l534
	line	303
	
l6246:
		decf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6921
	goto	u6920

u6921:
	goto	l6252
u6920:
	line	304
	
l6248:
		movlw	low(_sensor_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l534
	line	307
	
l6252:
	movf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6931
	goto	u6930
u6931:
	goto	l6278
u6930:
	line	309
	
l6254:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6941
	goto	u6940

u6941:
	goto	l6260
u6940:
	line	310
	
l6256:
		movlw	low(_relay_high_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l534
	line	311
	
l6260:
		movlw	10
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6951
	goto	u6950

u6951:
	goto	l6266
u6950:
	line	312
	
l6262:
		movlw	low(_relay_plp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l534
	line	313
	
l6266:
		movlw	11
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6961
	goto	u6960

u6961:
	goto	l6272
u6960:
	line	314
	
l6268:
		movlw	low(_relay_slp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l534
	line	315
	
l6272:
		movlw	12
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6971
	goto	u6970

u6971:
	goto	l6338
u6970:
	line	316
	
l6274:
		movlw	low(_display_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l534
	line	319
	
l6278:
		decf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6981
	goto	u6980

u6981:
	goto	l6292
u6980:
	line	321
	
l6280:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6991
	goto	u6990

u6991:
	goto	l6286
u6990:
	goto	l6256
	line	323
	
l6286:
		movlw	7
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7001
	goto	u7000

u7001:
	goto	l6338
u7000:
	goto	l6274
	line	327
	
l6292:
		movlw	2
	xorwf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7011
	goto	u7010

u7011:
	goto	l6338
u7010:
	line	329
	
l6294:
		movlw	2
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7021
	goto	u7020

u7021:
	goto	l6300
u7020:
	line	330
	
l6296:
		movlw	low(_flow_type_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l534
	line	332
	
l6300:
	movf	((c:get_option_edit_flag@flow_type))^00h,c,w
	btfss	status,2
	goto	u7031
	goto	u7030
u7031:
	goto	l6320
u7030:
	line	334
	
l6302:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7041
	goto	u7040

u7041:
	goto	l6308
u7040:
	line	335
	
l6304:
		movlw	low(_flow_units_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l534
	line	336
	
l6308:
		movlw	8
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7051
	goto	u7050

u7051:
	goto	l6314
u7050:
	line	337
	
l6310:
		movlw	low(_relay_low_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l534
	line	338
	
l6314:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7061
	goto	u7060

u7061:
	goto	l6338
u7060:
	goto	l6274
	line	343
	
l6320:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7071
	goto	u7070

u7071:
	goto	l6326
u7070:
	line	344
	
l6322:
		movlw	low(_no_flow_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l534
	line	345
	
l6326:
		movlw	5
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7081
	goto	u7080

u7081:
	goto	l6332
u7080:
	goto	l6310
	line	347
	
l6332:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7091
	goto	u7090

u7091:
	goto	l6338
u7090:
	goto	l6274
	line	352
	
l6338:
		movlw	low(0)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(0)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	line	353
	
l534:
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
psect	text32,class=CODE,space=0,reloc=2,group=0
	line	359
global __ptext32
__ptext32:
psect	text32
	file	"src\menu.c"
	line	359
	
_get_item_options_for_field:
;incstack = 0
	callstack 26
	movwf	((c:get_item_options_for_field@line))^00h,c
	line	362
	
l6342:
	movf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7101
	goto	u7100
u7101:
	goto	l6348
u7100:
	line	363
	
l6344:
		movlw	low(_menu_item_options)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l559
	line	364
	
l6348:
		decf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7111
	goto	u7110

u7111:
	goto	l6354
u7110:
	line	365
	
l6350:
		movlw	low(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l559
	line	368
	
l6354:
	movf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7121
	goto	u7120
u7121:
	goto	l6372
u7120:
	line	370
	
l6356:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u7131
	goto	u7130

u7131:
	goto	l6362
u7130:
	
l6358:
		movlw	10
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u7141
	goto	u7140

u7141:
	goto	l6362
u7140:
	
l6360:
		movlw	11
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7151
	goto	u7150

u7151:
	goto	l6366
u7150:
	line	371
	
l6362:
		movlw	low(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l559
	line	372
	
l6366:
		movlw	12
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7161
	goto	u7160

u7161:
	goto	l6432
u7160:
	line	373
	
l6368:
		movlw	low(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l559
	line	376
	
l6372:
		decf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7171
	goto	u7170

u7171:
	goto	l6386
u7170:
	line	378
	
l6374:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7181
	goto	u7180

u7181:
	goto	l6380
u7180:
	goto	l6362
	line	380
	
l6380:
		movlw	7
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7191
	goto	u7190

u7191:
	goto	l6432
u7190:
	goto	l6368
	line	384
	
l6386:
		movlw	2
	xorwf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7201
	goto	u7200

u7201:
	goto	l6432
u7200:
	line	386
	
l6388:
		movlw	2
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7211
	goto	u7210

u7211:
	goto	l6394
u7210:
	line	387
	
l6390:
		movlw	low(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l559
	line	389
	
l6394:
	movf	((c:get_item_options_for_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u7221
	goto	u7220
u7221:
	goto	l6414
u7220:
	line	391
	
l6396:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7231
	goto	u7230

u7231:
	goto	l6402
u7230:
	line	392
	
l6398:
		movlw	low(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l559
	line	393
	
l6402:
		movlw	8
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7241
	goto	u7240

u7241:
	goto	l6408
u7240:
	goto	l6362
	line	395
	
l6408:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7251
	goto	u7250

u7251:
	goto	l6432
u7250:
	goto	l6368
	line	400
	
l6414:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7261
	goto	u7260

u7261:
	goto	l6420
u7260:
	line	401
	
l6416:
		movlw	low(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l559
	line	402
	
l6420:
		movlw	5
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7271
	goto	u7270

u7271:
	goto	l6426
u7270:
	goto	l6362
	line	404
	
l6426:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7281
	goto	u7280

u7281:
	goto	l6432
u7280:
	goto	l6368
	line	409
	
l6432:
		movlw	low(0)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(0)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	line	410
	
l559:
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
psect	text33,class=CODE,space=0,reloc=2,group=0
	line	419
global __ptext33
__ptext33:
psect	text33
	file	"src\menu.c"
	line	419
	
_init_time_editor:
;incstack = 0
	callstack 24
	line	422
	
l9988:
	movff	(c:init_time_editor@mode),0+(_menu+010h)
	line	423
	movff	(c:init_time_editor@value_seconds),0+(_menu+014h)
	movff	(c:init_time_editor@value_seconds+1),1+(_menu+014h)
	line	426
	
l9990:
	movf	((c:init_time_editor@mode))^00h,c,w
	btfss	status,2
	goto	u13181
	goto	u13180
u13181:
	goto	l9994
u13180:
	line	428
	
l9992:
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
	goto	l9996
	line	433
	
l9994:
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
	
l9996:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+011h))&0ffh
	line	443
	
l9998:; BSR set to: 2

		movlw	low(init_time_editor@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_114)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_114)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:init_time_editor@value_seconds),0+((c:?_sprintf)+04h)
	movff	(c:init_time_editor@value_seconds+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+012h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	444
	
l10000:
		movlw	low(init_time_editor@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	445
	
l585:
	return	;funcret
	callstack 0
GLOBAL	__end_of_init_time_editor
	__end_of_init_time_editor:
	signat	_init_time_editor,8313
	global	_uart_println

;; *************** function _uart_println *****************
;; Defined at:
;;		line 72 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   17[COMRAM] PTR const unsigned char 
;;		 -> STR_262(20), STR_257(25), menu_handle_button@buf_1544(50), menu_handle_button@buf_1534(50), 
;;		 -> STR_244(27), menu_handle_button@buf_1512(50), menu_handle_button@buf(50), menu_handle_encoder@buf_1481(50), 
;;		 -> menu_handle_encoder@buf_1478(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), handle_numeric_rotation@buf(50), 
;;		 -> STR_174(31), rebuild_input_menu@buf(50), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), STR_115(29), init_time_editor@buf(60), STR_26(21), 
;;		 -> STR_25(20), STR_24(36), STR_21(33), STR_20(21), 
;;		 -> STR_19(20), STR_18(22), STR_15(26), STR_14(15), 
;;		 -> STR_13(20), main@buf_623(30), main@buf(40), STR_10(19), 
;;		 -> STR_9(22), STR_8(22), STR_7(24), STR_6(19), 
;;		 -> STR_5(22), STR_2(23), STR_1(28), 
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
;;		_uart_print
;;		_uart_write
;; This function is called by:
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
psect	text34,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	72
global __ptext34
__ptext34:
psect	text34
	file	"src\main.c"
	line	72
	
_uart_println:
;incstack = 0
	callstack 26
	line	74
	
l5784:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	75
	
l5786:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	76
	
l5788:
	movlw	(0Ah)&0ffh
	
	call	_uart_write
	line	77
	
l126:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_println
	__end_of_uart_println:
	signat	_uart_println,4217
	global	_uart_print

;; *************** function _uart_print *****************
;; Defined at:
;;		line 64 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   15[COMRAM] PTR const unsigned char 
;;		 -> STR_262(20), STR_257(25), menu_handle_button@buf_1544(50), menu_handle_button@buf_1534(50), 
;;		 -> STR_244(27), menu_handle_button@buf_1512(50), menu_handle_button@buf(50), menu_handle_encoder@buf_1481(50), 
;;		 -> menu_handle_encoder@buf_1478(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), handle_numeric_rotation@buf(50), 
;;		 -> STR_174(31), rebuild_input_menu@buf(50), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), STR_115(29), init_time_editor@buf(60), STR_26(21), 
;;		 -> STR_25(20), STR_24(36), STR_21(33), STR_20(21), 
;;		 -> STR_19(20), STR_18(22), STR_15(26), STR_14(15), 
;;		 -> STR_13(20), main@buf_623(30), main@buf(40), STR_10(19), 
;;		 -> STR_9(22), STR_8(22), STR_7(24), STR_6(19), 
;;		 -> STR_5(22), STR_2(23), STR_1(28), 
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
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_uart_write
;; This function is called by:
;;		_uart_println
;; This function uses a non-reentrant model
;;
psect	text35,class=CODE,space=0,reloc=2,group=0
	line	64
global __ptext35
__ptext35:
psect	text35
	file	"src\main.c"
	line	64
	
_uart_print:
;incstack = 0
	callstack 26
	line	66
	
l5690:
	goto	l5696
	line	68
	
l5692:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5877
	tblrd	*
	
	movf	tablat,w
	bra	u5870
u5877:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5870:
	
	call	_uart_write
	
l5694:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	66
	
l5696:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5887
	tblrd	*
	
	movf	tablat,w
	bra	u5880
u5887:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5880:
	iorlw	0
	btfss	status,2
	goto	u5891
	goto	u5890
u5891:
	goto	l5692
u5890:
	line	70
	
l123:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_print
	__end_of_uart_print:
	signat	_uart_print,4217
	global	_uart_write

;; *************** function _uart_write *****************
;; Defined at:
;;		line 57 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1   14[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
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
;;		_uart_print
;;		_uart_println
;; This function uses a non-reentrant model
;;
psect	text36,class=CODE,space=0,reloc=2,group=0
	line	57
global __ptext36
__ptext36:
psect	text36
	file	"src\main.c"
	line	57
	
_uart_write:
;incstack = 0
	callstack 27
	movwf	((c:uart_write@c))^00h,c
	line	59
	
l5660:
	line	60
	
l114:
	line	59
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u5831
	goto	u5830
u5831:
	goto	l114
u5830:
	line	61
	
l5662:
	movff	(c:uart_write@c),(c:4013)	;volatile
	line	62
	
l117:
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
;;		 -> menu_handle_button@buf_1544(50), menu_handle_button@buf_1534(50), menu_handle_button@buf_1512(50), menu_handle_button@buf(50), 
;;		 -> menu_handle_encoder@buf_1481(50), menu_handle_encoder@buf_1478(50), menu_handle_encoder@buf(50), value_clock_display(10), 
;;		 -> value_end_runtime(10), value_clock_enable(10), rebuild_clock_menu@buf(50), menu_draw_input@title(10), 
;;		 -> menu_update_edit_value@value_buf(10), handle_numeric_rotation@buf(50), rebuild_input_menu@buf(50), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> value_relay_pulse(10), handle_time_rotation@buf(50), init_time_editor@buf(60), NULL(0), 
;;		 -> main@buf_623(30), main@buf(40), 
;;  f               2   28[COMRAM] PTR const unsigned char 
;;		 -> STR_256(32), STR_255(38), STR_254(5), STR_253(6), 
;;		 -> STR_252(6), STR_251(5), STR_250(6), STR_249(6), 
;;		 -> STR_248(5), STR_247(5), STR_246(6), STR_245(6), 
;;		 -> STR_243(10), STR_242(26), STR_241(42), STR_240(32), 
;;		 -> STR_239(10), STR_238(10), STR_237(26), STR_236(28), 
;;		 -> STR_235(25), STR_234(20), STR_233(26), STR_232(35), 
;;		 -> STR_231(28), STR_230(37), STR_229(32), STR_228(23), 
;;		 -> STR_227(37), STR_221(29), STR_220(46), STR_218(10), 
;;		 -> STR_212(3), STR_211(35), STR_187(9), STR_177(9), 
;;		 -> STR_176(7), STR_175(29), STR_173(48), STR_172(10), 
;;		 -> STR_170(10), STR_169(5), STR_168(6), STR_167(6), 
;;		 -> STR_151(10), STR_150(3), STR_149(6), STR_148(6), 
;;		 -> STR_135(10), STR_134(10), STR_133(5), STR_132(10), 
;;		 -> STR_131(5), STR_130(6), STR_129(6), STR_125(3), 
;;		 -> STR_120(27), STR_119(51), STR_118(3), STR_117(25), 
;;		 -> STR_116(45), STR_114(35), STR_12(17), STR_11(23), 
;; Auto vars:     Size  Location     Type
;;  tmpval          4    0        struct .
;;  width           2   54[COMRAM] int 
;;  len             2   51[COMRAM] unsigned int 
;;  val             2   49[COMRAM] unsigned int 
;;  cp              2   46[COMRAM] PTR const unsigned char 
;;		 -> STR_263(7), sprintf@c(1), ?_sprintf(2), value_clock_display(10), 
;;		 -> value_end_runtime(10), STR_214(9), STR_213(8), value_clock_enable(10), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), STR_127(9), STR_126(8), 
;;		 -> value_enable(10), value_relay_pulse(10), menu_update_time_value@value_buf(6), display_edit_flag(1), 
;;		 -> relay_high_edit_flag(1), NULL(0), menu_item_options$option_count(1), STR_61(1), 
;;		 -> STR_60(1), STR_59(9), STR_58(6), STR_57(6), 
;;		 -> STR_56(1), STR_55(1), STR_54(1), STR_53(5), 
;;		 -> STR_52(5), STR_51(1), STR_50(1), STR_49(1), 
;;		 -> STR_48(4), STR_47(2), STR_46(1), STR_45(1), 
;;		 -> STR_44(1), STR_43(5), STR_42(4), STR_41(1), 
;;		 -> STR_40(1), STR_39(1), STR_38(8), STR_37(7), 
;;		 -> STR_36(1), STR_35(1), STR_34(5), STR_33(5), 
;;		 -> STR_32(9), STR_31(1), STR_30(1), STR_29(1), 
;;		 -> STR_28(8), STR_27(9), enable_edit_flag(1), 
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
;;		On entry : 0/2
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
;;		_rebuild_clock_menu
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text37,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
global __ptext37
__ptext37:
psect	text37
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
	
_sprintf:
;incstack = 0
	callstack 27
	line	550
	
l9184:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l9358
	line	555
	
l9186:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u11741
	goto	u11740

u11741:
	goto	l9192
u11740:
	line	558
	
l9188:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l9190:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l9358
	line	563
	
l9192:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	565
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	goto	l9202
	line	578
	
l9194:
	bsf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	579
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	580
	goto	l9202
	line	585
	
l9196:
	bsf	(0+(1/8)+(c:sprintf@flag))^00h,c,(1)&7
	line	586
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	587
	goto	l9202
	line	597
	
l9198:
	bsf	(0+(2/8)+(c:sprintf@flag))^00h,c,(2)&7
	line	598
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	568
	
l9202:
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
	goto	l9194
	xorlw	43^32	; case 43
	skipnz
	goto	l9196
	xorlw	48^43	; case 48
	skipnz
	goto	l9198
	goto	l1377

	line	603
	
l1377:
	line	606
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u11751
	goto	u11750
u11751:
	goto	l9206
u11750:
	line	607
	
l9204:
	bcf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	614
	
l9206:
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
	goto	u11761
	goto	u11760
u11761:
	goto	l9262
u11760:
	line	615
	
l9208:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	617
	
l9210:
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
	
l9212:
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

	
l9214:
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	619
	
l9216:
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
	goto	u11771
	goto	u11770
u11771:
	goto	l9210
u11770:
	goto	l9262
	line	760
	
l9218:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l9220:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l9222:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u11781
	goto	u11780

u11781:
	goto	l9226
u11780:
	line	767
	
l9224:
		movlw	low(STR_263)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_263)
	movwf	((c:sprintf@cp+1))^00h,c

	line	771
	
l9226:
	movlw	high(0)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@len))^00h,c
	line	772
	goto	l9230
	line	773
	
l9228:
	infsnz	((c:sprintf@len))^00h,c
	incf	((c:sprintf@len+1))^00h,c
	line	772
	
l9230:
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
	bra	u11797
	tblrd	*
	
	movf	tablat,w
	bra	u11790
u11797:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11790:
	iorlw	0
	btfss	status,2
	goto	u11801
	goto	u11800
u11801:
	goto	l9228
u11800:
	line	783
	
l9232:
		movf	((c:sprintf@width))^00h,c,w
	subwf	((c:sprintf@len))^00h,c,w
	movf	((c:sprintf@width+1))^00h,c,w
	subwfb	((c:sprintf@len+1))^00h,c,w
	btfsc	status,0
	goto	u11811
	goto	u11810

u11811:
	goto	l9236
u11810:
	line	784
	
l9234:
	movf	((c:sprintf@len))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	subwfb	((c:sprintf@width+1))^00h,c

	goto	l9242
	line	786
	
l9236:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	goto	l9242
	line	791
	
l9238:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l9240:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	790
	
l9242:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
		incf	((c:sprintf@width))^00h,c,w
	bnz	u11821
	incf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u11821
	goto	u11820

u11821:
	goto	l9238
u11820:
	goto	l9250
	line	794
	
l9244:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11837
	tblrd	*
	
	movf	tablat,w
	bra	u11830
u11837:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11830:
	movwf	indf2
	
l9246:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l9248:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	793
	
l9250:
	decf	((c:sprintf@len))^00h,c
	btfss	status,0
	decf	((c:sprintf@len+1))^00h,c
		incf	((c:sprintf@len))^00h,c,w
	bnz	u11841
	incf	((c:sprintf@len+1))^00h,c,w
	btfss	status,2
	goto	u11841
	goto	u11840

u11841:
	goto	l9244
u11840:
	goto	l9358
	line	825
	
l9252:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:sprintf@c))^00h,c
	
l9254:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	831
	
l9256:
		movlw	low(sprintf@c)
	movwf	((c:sprintf@cp))^00h,c
	clrf	((c:sprintf@cp+1))^00h,c

	line	832
	
l9258:
	movlw	high(01h)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(01h)
	movwf	((c:sprintf@len))^00h,c
	line	833
	goto	l9232
	line	661
	
l9262:
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
	goto	l9360
	xorlw	99^0	; case 99
	skipnz
	goto	l9252
	xorlw	100^99	; case 100
	skipnz
	goto	l9264
	xorlw	105^100	; case 105
	skipnz
	goto	l9264
	xorlw	115^105	; case 115
	skipnz
	goto	l9218
	goto	l9256

	line	1285
	
l9264:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l9266:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l9268:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u11850
	goto	u11851

u11851:
	goto	l9274
u11850:
	line	1288
	
l9270:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l9272:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	line	1331
	
l9274:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l9276:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u11861
	goto	u11860

u11861:
	goto	l9280
u11860:
	goto	l9288
	line	1332
	
l9280:
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
	goto	u11871
	goto	u11870

u11871:
	goto	l9284
u11870:
	goto	l9288
	line	1331
	
l9284:
	incf	((c:sprintf@c))^00h,c
	goto	l9276
	line	1371
	
l9288:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u11881
	goto	u11880

u11881:
	goto	l9294
u11880:
	
l9290:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u11891
	goto	u11890
u11891:
	goto	l9294
u11890:
	line	1372
	
l9292:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	line	1407
	
l9294:
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
	goto	u11901
	goto	u11900

u11901:
	goto	l9298
u11900:
	line	1408
	
l9296:
	movf	((c:sprintf@c))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movlw	0
	subwfb	((c:sprintf@width+1))^00h,c
	goto	l9300
	line	1410
	
l9298:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	1413
	
l9300:
	
	btfss	((c:sprintf@flag))^00h,c,(2)&7
	goto	u11911
	goto	u11910
u11911:
	goto	l9326
u11910:
	line	1415
	
l9302:
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u11921
	goto	u11920
u11921:
	goto	l1412
u11920:
	line	1416
	
l9304:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u11931
	goto	u11930
u11931:
	goto	l9308
u11930:
	
l9306:
	movlw	high(02Bh)
	movwf	((c:_sprintf$1782+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$1782))^00h,c
	goto	l9310
	
l9308:
	movlw	high(02Dh)
	movwf	((c:_sprintf$1782+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$1782))^00h,c
	
l9310:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$1782),indf2

	
l9312:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l9318
	line	1422
	
l1412:
	line	1425
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u11941
	goto	u11940
u11941:
	goto	l9318
u11940:
	line	1426
	
l9314:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l9312
	line	1441
	
l9318:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u11951
	goto	u11950

u11951:
	goto	l9348
u11950:
	line	1443
	
l9320:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(030h)
	movwf	indf2
	
l9322:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1444
	
l9324:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u11961
	goto	u11960

u11961:
	goto	l9320
u11960:
	goto	l9348
	line	1454
	
l9326:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u11971
	goto	u11970

u11971:
	goto	l1423
u11970:
	line	1456
	
l9328:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l9330:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1457
	
l9332:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u11981
	goto	u11980

u11981:
	goto	l9328
u11980:
	
l1423:
	line	1460
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u11991
	goto	u11990
u11991:
	goto	l1426
u11990:
	line	1461
	
l9334:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u12001
	goto	u12000
u12001:
	goto	l9338
u12000:
	
l9336:
	movlw	high(02Bh)
	movwf	((c:_sprintf$1783+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$1783))^00h,c
	goto	l9340
	
l9338:
	movlw	high(02Dh)
	movwf	((c:_sprintf$1783+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$1783))^00h,c
	
l9340:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$1783),indf2

	
l9342:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l9348
	line	1469
	
l1426:
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u12011
	goto	u12010
u12011:
	goto	l9348
u12010:
	line	1470
	
l9344:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l9342
	line	1498
	
l9348:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l9356
	line	1515
	
l9350:
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
	
l9352:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l9354:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l9356:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u12021
	goto	u12020

u12021:
	goto	l9350
u12020:
	line	553
	
l9358:
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
	goto	u12031
	goto	u12030
u12031:
	goto	l9186
u12030:
	line	1564
	
l9360:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	clrf	indf2
	line	1567
	
l1437:
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
psect	text38,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
global __ptext38
__ptext38:
psect	text38
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
	
_isdigit:
;incstack = 0
	callstack 27
	movwf	((c:isdigit@c))^00h,c
	line	14
	
l9124:
	movlw	low(0)
	movwf	((c:_isdigit$2223))^00h,c
	
l9126:
		movlw	03Ah-0
	cpfslt	((c:isdigit@c))^00h,c
	goto	u11661
	goto	u11660

u11661:
	goto	l9132
u11660:
	
l9128:
		movlw	030h-1
	cpfsgt	((c:isdigit@c))^00h,c
	goto	u11671
	goto	u11670

u11671:
	goto	l9132
u11670:
	
l9130:
	movlw	low(01h)
	movwf	((c:_isdigit$2223))^00h,c
	
l9132:
	movff	(c:_isdigit$2223),??_isdigit+0+0
	rrcf	(??_isdigit+0+0)^00h,c,w
	line	15
	
l2104:
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
psect	text39,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
global __ptext39
__ptext39:
psect	text39
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
	
___wmul:
;incstack = 0
	callstack 27
	line	37
	
l9136:
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
	
l9138:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	line	53
	
l1440:
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
psect	text40,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	799
global __ptext40
__ptext40:
psect	text40
	file	"src\menu.c"
	line	799
	
_init_numeric_editor:
;incstack = 0
	callstack 26
	line	803
	
l10292:
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
	
l10294:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+0Fh))&0ffh
	line	809
	
l10296:; BSR set to: 2

	movf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u13391
	goto	u13390
u13391:
	goto	l10304
u13390:
	line	812
	
l10298:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u13401
	goto	u13400

u13401:
	goto	l10302
u13400:
	
l10300:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13411
	goto	u13410

u13411:
	goto	l10318
u13410:
	line	813
	
l10302:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+0Fh))&0ffh
	goto	l10318
	line	815
	
l10304:; BSR set to: 2

		decf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u13421
	goto	u13420

u13421:
	goto	l10310
u13420:
	line	818
	
l10306:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13431
	goto	u13430

u13431:
	goto	l10318
u13430:
	goto	l10302
	line	821
	
l10310:; BSR set to: 2

		movlw	2
	xorwf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u13441
	goto	u13440

u13441:
	goto	l10318
u13440:
	
l10312:; BSR set to: 2

	movf	((c:init_numeric_editor@flow_type))^00h,c,w
	btfss	status,2
	goto	u13451
	goto	u13450
u13451:
	goto	l10318
u13450:
	line	824
	
l10314:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13461
	goto	u13460

u13461:
	goto	l10318
u13460:
	goto	l10302
	line	829
	
l10318:; BSR set to: 2

	movff	(c:init_numeric_editor@value),0+(_menu+0Dh)
	movff	(c:init_numeric_editor@value+1),1+(_menu+0Dh)
	line	832
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u13471
	goto	u13470
u13471:
	goto	l726
u13470:
	
l10320:; BSR set to: 2

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u13480
	goto	u13481

u13481:
	goto	l726
u13480:
	line	833
	
l10322:; BSR set to: 2

	movlw	high(0)
	movwf	((c:init_numeric_editor@value+1))^00h,c
	movlw	low(0)
	movwf	((c:init_numeric_editor@value))^00h,c
	
l726:; BSR set to: 2

	line	836
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u13491
	goto	u13490
u13491:
	goto	l10326
u13490:
	
l10324:; BSR set to: 2

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u13501
	goto	u13500

u13501:
	movlw	1
	goto	u13510
u13500:
	movlw	0
u13510:
	movwf	((c:_init_numeric_editor$1289))^00h,c
	clrf	((c:_init_numeric_editor$1289+1))^00h,c
	goto	l10328
	
l10326:; BSR set to: 2

	movlw	high(0)
	movwf	((c:_init_numeric_editor$1289+1))^00h,c
	movlw	low(0)
	movwf	((c:_init_numeric_editor$1289))^00h,c
	
l10328:; BSR set to: 2

	movff	(c:_init_numeric_editor$1289),0+(_menu+09h)
	line	839
	
l10330:; BSR set to: 2

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u13521
	goto	u13520

u13521:
	goto	l732
u13520:
	
l10332:; BSR set to: 2

	movff	(c:init_numeric_editor@value),(c:init_numeric_editor@abs_val)
	movff	(c:init_numeric_editor@value+1),(c:init_numeric_editor@abs_val+1)
	goto	l10334
	
l732:; BSR set to: 2

	movff	(c:init_numeric_editor@value),??_init_numeric_editor+0+0
	movff	(c:init_numeric_editor@value+1),??_init_numeric_editor+0+0+1
	comf	(??_init_numeric_editor+0+0)^00h,c
	comf	(??_init_numeric_editor+0+1)^00h,c
	infsnz	(??_init_numeric_editor+0+0)^00h,c
	incf	(??_init_numeric_editor+0+1)^00h,c
	movff	??_init_numeric_editor+0+0,(c:init_numeric_editor@abs_val)
	movff	??_init_numeric_editor+0+1,(c:init_numeric_editor@abs_val+1)
	line	840
	
l10334:; BSR set to: 2

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
	
l10336:; BSR set to: 2

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u13531
	goto	u13530
u13531:
	movlw	1
	goto	u13540
u13530:
	movlw	0
u13540:
	movwf	(0+(_menu+08h))&0ffh
	line	846
	
l735:; BSR set to: 2

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
psect	text41,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext41
__ptext41:
psect	text41
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
___lwmod:; BSR set to: 2

;incstack = 0
	callstack 27
	line	12
	
l9164:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u11711
	goto	u11710

u11711:
	goto	l1929
u11710:
	line	13
	
l9166:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l9170
	line	15
	
l9168:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l9170:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u11721
	goto	u11720
u11721:
	goto	l9168
u11720:
	line	19
	
l9172:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u11731
	goto	u11730

u11731:
	goto	l9176
u11730:
	line	20
	
l9174:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l9176:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l9178:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l9172
	line	23
	
l1929:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l1936:
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
psect	text42,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
global __ptext42
__ptext42:
psect	text42
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
	
___lwdiv:
;incstack = 0
	callstack 27
	line	13
	
l9142:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l9144:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u11681
	goto	u11680

u11681:
	goto	l1919
u11680:
	line	15
	
l9146:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l9150
	line	17
	
l9148:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l9150:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u11691
	goto	u11690
u11691:
	goto	l9148
u11690:
	line	21
	
l9152:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l9154:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u11701
	goto	u11700

u11701:
	goto	l9160
u11700:
	line	23
	
l9156:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l9158:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l9160:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l9162:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l9152
	line	28
	
l1919:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l1926:
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
psect	text43,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	848
global __ptext43
__ptext43:
psect	text43
	file	"src\menu.c"
	line	848
	
_get_current_numeric_value:
;incstack = 0
	callstack 27
	line	850
	
l7414:; BSR set to: 2

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
	
l7416:; BSR set to: 2

	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u8681
	goto	u8680
u8681:
	goto	l7420
u8680:
	line	852
	
l7418:; BSR set to: 2

	negf	((c:get_current_numeric_value@value))^00h,c
	comf	((c:get_current_numeric_value@value+1))^00h,c
	btfsc	status,0
	incf	((c:get_current_numeric_value@value+1))^00h,c
	line	853
	
l7420:; BSR set to: 2

	movff	(c:get_current_numeric_value@value),(c:?_get_current_numeric_value)
	movff	(c:get_current_numeric_value@value+1),(c:?_get_current_numeric_value+1)
	line	854
	
l739:; BSR set to: 2

	return	;funcret
	callstack 0
GLOBAL	__end_of_get_current_numeric_value
	__end_of_get_current_numeric_value:
	signat	_get_current_numeric_value,90
	global	_beep

;; *************** function _beep *****************
;; Defined at:
;;		line 229 in file "src\main.c"
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
psect	text44,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	229
global __ptext44
__ptext44:
psect	text44
	file	"src\main.c"
	line	229
	
_beep:; BSR set to: 2

;incstack = 0
	callstack 27
	line	231
	
l6560:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	232
	
l6562:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l178
	line	234
	
l6564:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u16117:
decfsz	wreg,f
	bra	u16117
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u16117
	nop2
asmopt pop

	line	232
	
l6566:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l178:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u7401
	goto	u7400

u7401:
	goto	l6564
u7400:
	
l180:
	line	236
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	237
	
l181:
	return	;funcret
	callstack 0
GLOBAL	__end_of_beep
	__end_of_beep:
	signat	_beep,4217
	global	_lcd_init

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 191 in file "src\main.c"
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
psect	text45,class=CODE,space=0,reloc=2,group=0
	line	191
global __ptext45
__ptext45:
psect	text45
	file	"src\main.c"
	line	191
	
_lcd_init:
;incstack = 0
	callstack 26
	line	194
	
l10388:; BSR set to: 2

	movlw	low(010h)
	movwf	((c:3986))^0f00h,c	;volatile
	line	195
	movlw	low(046h)
	movwf	((c:3987))^0f00h,c	;volatile
	line	196
	movlw	low(0)
	movwf	((c:3988))^0f00h,c	;volatile
	line	199
	movlw	low(0)
	movwf	((c:3968))^0f00h,c	;volatile
	line	200
	movlw	low(0)
	movwf	((c:3969))^0f00h,c	;volatile
	line	201
	movlw	low(0)
	movwf	((c:3970))^0f00h,c	;volatile
	line	203
	
l10390:; BSR set to: 2

	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u16127:
decfsz	wreg,f
	bra	u16127
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u16127
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u16127
	nop
asmopt pop

	line	205
	
l10392:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	208
	
l10394:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	209
	
l10396:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u16137:
decfsz	wreg,f
	bra	u16137
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u16137
asmopt pop

	line	210
	
l10398:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	211
	
l10400:
	asmopt push
asmopt off
	movlw	240
u16147:
	nop2
decfsz	wreg,f
	bra	u16147
asmopt pop

	line	212
	
l10402:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	213
	
l10404:
	asmopt push
asmopt off
	movlw	240
u16157:
	nop2
decfsz	wreg,f
	bra	u16157
asmopt pop

	line	216
	
l10406:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	217
	
l10408:
	asmopt push
asmopt off
	movlw	240
u16167:
	nop2
decfsz	wreg,f
	bra	u16167
asmopt pop

	line	220
	
l10410:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	221
	
l10412:
	movlw	(08h)&0ffh
	
	call	_lcd_cmd
	line	222
	
l10414:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	223
	
l10416:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_init+0+0)^00h,c
	movlw	198
u16177:
decfsz	wreg,f
	bra	u16177
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u16177
	nop2
asmopt pop

	line	224
	
l10418:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	225
	
l10420:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	226
	
l175:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
	signat	_lcd_init,89
	global	_lcd_cmd

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 129 in file "src\main.c"
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
psect	text46,class=CODE,space=0,reloc=2,group=0
	line	129
global __ptext46
__ptext46:
psect	text46
	file	"src\main.c"
	line	129
	
_lcd_cmd:
;incstack = 0
	callstack 24
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	131
	
l9056:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	132
	
l9058:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	133
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	135
	
l9060:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u11571
	goto	u11570

u11571:
	goto	l9064
u11570:
	
l9062:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u11581
	goto	u11580

u11581:
	goto	l9066
u11580:
	line	137
	
l9064:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u16187:
decfsz	wreg,f
	bra	u16187
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u16187
	nop2
asmopt pop

	line	138
	goto	l150
	line	141
	
l9066:
	asmopt push
asmopt off
	movlw	133
u16197:
decfsz	wreg,f
	bra	u16197
	nop
asmopt pop

	line	143
	
l150:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
	signat	_lcd_cmd,4217
	global	_lcd_write_nibble

;; *************** function _lcd_write_nibble *****************
;; Defined at:
;;		line 104 in file "src\main.c"
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
psect	text47,class=CODE,space=0,reloc=2,group=0
	line	104
global __ptext47
__ptext47:
psect	text47
	file	"src\main.c"
	line	104
	
_lcd_write_nibble:
;incstack = 0
	callstack 24
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	106
	
l9038:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u11531
	goto	u11530
u11531:
	goto	l135
u11530:
	line	107
	
l9040:
	bsf	((c:3977))^0f00h,c,0	;volatile
	goto	l9042
	line	108
	
l135:
	line	109
	bcf	((c:3977))^0f00h,c,0	;volatile
	line	110
	
l9042:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u11541
	goto	u11540
u11541:
	goto	l137
u11540:
	line	111
	
l9044:
	bsf	((c:3977))^0f00h,c,1	;volatile
	goto	l9046
	line	112
	
l137:
	line	113
	bcf	((c:3977))^0f00h,c,1	;volatile
	line	114
	
l9046:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u11551
	goto	u11550
u11551:
	goto	l139
u11550:
	line	115
	
l9048:
	bsf	((c:3977))^0f00h,c,2	;volatile
	goto	l9050
	line	116
	
l139:
	line	117
	bcf	((c:3977))^0f00h,c,2	;volatile
	line	118
	
l9050:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u11561
	goto	u11560
u11561:
	goto	l141
u11560:
	line	119
	
l9052:
	bsf	((c:3977))^0f00h,c,3	;volatile
	goto	l142
	line	120
	
l141:
	line	121
	bcf	((c:3977))^0f00h,c,3	;volatile
	
l142:
	line	123
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	124
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	125
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	126
	
l9054:
	asmopt push
asmopt off
	movlw	133
u16207:
decfsz	wreg,f
	bra	u16207
	nop
asmopt pop

	line	127
	
l143:
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
psect	text48,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	260
global __ptext48
__ptext48:
psect	text48
	file	"src\eeprom.c"
	line	260
	
_get_menu_timeout_seconds:
;incstack = 0
	callstack 28
	line	263
	
l7582:; BSR set to: 4

		movlw	05h-0
	cpfslt	(0+(_system_config+01h))&0ffh
	goto	u8781
	goto	u8780

u8781:
	goto	l7588
u8780:
	line	265
	
l7584:; BSR set to: 4

	movlw	(01Eh)&0ffh
	goto	l1355
	line	267
	
l7588:; BSR set to: 4

		movlw	079h-1
	cpfsgt	(0+(_system_config+01h))&0ffh
	goto	u8791
	goto	u8790

u8791:
	goto	l7594
u8790:
	goto	l7584
	line	271
	
l7594:; BSR set to: 4

	movf	(0+(_system_config+01h))&0ffh,w
	line	272
	
l1355:; BSR set to: 4

	return	;funcret
	callstack 0
GLOBAL	__end_of_get_menu_timeout_seconds
	__end_of_get_menu_timeout_seconds:
	signat	_get_menu_timeout_seconds,89
	global	_encoder_init

;; *************** function _encoder_init *****************
;; Defined at:
;;		line 181 in file "src\encoder.c"
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
psect	text49,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	181
global __ptext49
__ptext49:
psect	text49
	file	"src\encoder.c"
	line	181
	
_encoder_init:; BSR set to: 4

;incstack = 0
	callstack 28
	line	184
	
l7598:
	movlw	low(0C4h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	185
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	188
	movlw	high(0)
	movlb	2	; () banked
	movwf	((_encoder_count+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_encoder_count))&0ffh	;volatile
	line	189
	movlw	low(0)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	190
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	191
	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	194
	
l7600:; BSR set to: 2

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	195
	
l7602:; BSR set to: 2

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	196
	
l7604:; BSR set to: 2

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	199
	
l7606:; BSR set to: 2

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u8801
	goto	u8800
u8801:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u8808
u8800:
	clrf	(??_encoder_init+0+0)^00h,c
u8808:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u8811
	goto	u8810
u8811:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u8818
u8810:
	clrf	(??_encoder_init+1+0)^00h,c
u8818:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:_enc_state))^00h,c
	line	200
	
l347:
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
psect	text50,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	180
global __ptext50
__ptext50:
psect	text50
	file	"src\eeprom.c"
	line	180
	
_eeprom_init:
;incstack = 0
	callstack 25
	line	182
	
l7548:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	185
	
l7550:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	189
	
l7556:
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
	
l7558:
	incf	((c:eeprom_init@i))^00h,c
	
l7560:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u8741
	goto	u8740

u8741:
	goto	l7556
u8740:
	line	191
	
l7562:
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
	
l7564:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	195
	
l7566:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u8750
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u8751
	goto	u8750

u8751:
	goto	l7572
u8750:
	line	198
	
l7568:
	call	_load_factory_defaults	;wreg free
	line	199
	
l7570:
	call	_save_current_config	;wreg free
	line	203
	
l7572:
	call	_sync_menu_variables	;wreg free
	line	207
	
l7574:
	movlb	4	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	mullw	02h
	movff	prodl,(c:_menu_timeout_seconds)
	movff	prodh,(c:_menu_timeout_seconds+1)
	line	210
	
l7576:; BSR set to: 4

		movf	((c:_menu_timeout_seconds+1))^00h,c,w
	bnz	u8760
	movlw	10
	subwf	 ((c:_menu_timeout_seconds))^00h,c,w
	btfss	status,0
	goto	u8761
	goto	u8760

u8761:
	goto	l7580
u8760:
	
l7578:; BSR set to: 4

		incf	((c:_menu_timeout_seconds))^00h,c,w
	movlw	1
	subwfb	((c:_menu_timeout_seconds+1))^00h,c,w
	btfss	status,0
	goto	u8771
	goto	u8770

u8771:
	goto	l1333
u8770:
	line	212
	
l7580:; BSR set to: 4

	movlw	high(01Eh)
	movwf	((c:_menu_timeout_seconds+1))^00h,c
	movlw	low(01Eh)
	movwf	((c:_menu_timeout_seconds))^00h,c
	line	214
	
l1333:; BSR set to: 4

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
psect	text51,class=CODE,space=0,reloc=2,group=0
	line	247
global __ptext51
__ptext51:
psect	text51
	file	"src\eeprom.c"
	line	247
	
_sync_menu_variables:; BSR set to: 4

;incstack = 0
	callstack 27
	line	256
	
l7492:
	movff	_input_config,(c:_enable_edit_flag)
	line	257
	movff	0+(_input_config+01h),(c:_sensor_edit_flag)
	line	258
	
l1351:
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
psect	text52,class=CODE,space=0,reloc=2,group=0
	line	216
global __ptext52
__ptext52:
psect	text52
	file	"src\eeprom.c"
	line	216
	
_save_current_config:
;incstack = 0
	callstack 26
	line	219
	
l7046:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	223
	
l7052:
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
	
l7054:
	incf	((c:save_current_config@i))^00h,c
	
l7056:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u8301
	goto	u8300

u8301:
	goto	l7052
u8300:
	line	227
	
l7058:
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
	
l7060:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	231
	
l7062:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	232
	
l1338:
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
psect	text53,class=CODE,space=0,reloc=2,group=0
	line	155
global __ptext53
__ptext53:
psect	text53
	file	"src\eeprom.c"
	line	155
	
_eeprom_write_word:
;incstack = 0
	callstack 26
	line	157
	
l6504:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	158
	
l6506:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	159
	
l1312:
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
psect	text54,class=CODE,space=0,reloc=2,group=0
	line	161
global __ptext54
__ptext54:
psect	text54
	file	"src\eeprom.c"
	line	161
	
_eeprom_write_block:
;incstack = 0
	callstack 26
	line	163
	
l6508:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	164
	
l6510:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l6516
	line	166
	
l6512:
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
	
l6514:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l6516:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u7351
	goto	u7350

u7351:
	goto	l6512
u7350:
	line	168
	
l1318:
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
psect	text55,class=CODE,space=0,reloc=2,group=0
	line	128
global __ptext55
__ptext55:
psect	text55
	file	"src\eeprom.c"
	line	128
	
_eeprom_write_byte:
;incstack = 0
	callstack 26
	line	130
	
l5722:
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
	
l5724:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	139
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	140
	
l5726:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	143
	
l1303:
	line	142
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u5941
	goto	u5940
u5941:
	goto	l1303
u5940:
	
l1305:
	line	144
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	145
	
l1306:
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
psect	text56,class=CODE,space=0,reloc=2,group=0
	line	92
global __ptext56
__ptext56:
psect	text56
	file	"src\eeprom.c"
	line	92
	
_calculate_config_checksum:
;incstack = 0
	callstack 27
	line	94
	
l6460:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	98
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	100
	
l6466:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	101
	
l6468:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	103
	
l6474:
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
	
l6476:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l6478:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u7320
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u7321
	goto	u7320

u7321:
	goto	l6474
u7320:
	line	98
	
l6480:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l6482:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u7331
	goto	u7330

u7331:
	goto	l6466
u7330:
	line	108
	
l6484:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	109
	
l6486:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1697+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1697))^00h,c
	line	111
	
l6492:
	movf	((c:calculate_config_checksum@j_1697))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j_1697+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	109
	
l6494:
	infsnz	((c:calculate_config_checksum@j_1697))^00h,c
	incf	((c:calculate_config_checksum@j_1697+1))^00h,c
	
l6496:
		movf	((c:calculate_config_checksum@j_1697+1))^00h,c,w
	bnz	u7340
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1697))^00h,c,w
	btfss	status,0
	goto	u7341
	goto	u7340

u7341:
	goto	l6492
u7340:
	
l1296:
	line	114
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	115
	
l1297:
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
psect	text57,class=CODE,space=0,reloc=2,group=0
	line	241
global __ptext57
__ptext57:
psect	text57
	file	"src\eeprom.c"
	line	241
	
_load_factory_defaults:
;incstack = 0
	callstack 26
	line	243
	
l7490:
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
	
l1344:
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
;;		 -> clock_menu(25), system_config(128), input_menu(75), input_config(384), 
;;  s1              2   16[COMRAM] PTR const void 
;;		 -> system_defaults(128), factory_defaults(384), clock_menu_template(25), flow_analog_template(55), 
;;		 -> flow_digital_template(40), temp_menu_template(45), pressure_menu_template(70), 
;;  n               2   18[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  s               2   22[COMRAM] PTR const unsigned char 
;;		 -> system_defaults(128), factory_defaults(384), clock_menu_template(25), flow_analog_template(55), 
;;		 -> flow_digital_template(40), temp_menu_template(45), pressure_menu_template(70), 
;;  d               2   20[COMRAM] PTR unsigned char 
;;		 -> clock_menu(25), system_config(128), input_menu(75), input_config(384), 
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
psect	text58,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
global __ptext58
__ptext58:
psect	text58
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
	
_memcpy:
;incstack = 0
	callstack 26
	line	34
	
l6436:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l6446
	line	37
	
l6438:
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
	
l6440:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l6442:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l6444:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l6446:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u7291
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u7291
	goto	u7290

u7291:
	goto	l6438
u7290:
	line	41
	
l2110:
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
psect	text59,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	147
global __ptext59
__ptext59:
psect	text59
	file	"src\eeprom.c"
	line	147
	
_eeprom_read_word:
;incstack = 0
	callstack 26
	line	150
	
l7474:
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
	
l7476:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	153
	
l1309:
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
psect	text60,class=CODE,space=0,reloc=2,group=0
	line	170
global __ptext60
__ptext60:
psect	text60
	file	"src\eeprom.c"
	line	170
	
_eeprom_read_block:
;incstack = 0
	callstack 26
	line	172
	
l7480:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	173
	
l7482:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l7488
	line	175
	
l7484:
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
	
l7486:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l7488:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u8721
	goto	u8720

u8721:
	goto	l7484
u8720:
	line	177
	
l1324:
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
psect	text61,class=CODE,space=0,reloc=2,group=0
	line	118
global __ptext61
__ptext61:
psect	text61
	file	"src\eeprom.c"
	line	118
	
_eeprom_read_byte:
;incstack = 0
	callstack 26
	line	120
	
l6498:
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
	
l6500:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	126
	
l1300:
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
;;		_relay_timer_tick
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
	line	40
	
i2l8932:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u1131_41
	goto	i2u1131_40
i2u1131_41:
	goto	i2l9030
i2u1131_40:
	line	43
	
i2l8934:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	44
	
i2l8936:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	47
	
i2l8938:
	incf	((c:_ms_counter))^00h,c	;volatile
	line	48
	
i2l8940:
		movlw	02h-1
	cpfsgt	((c:_ms_counter))^00h,c	;volatile
	goto	i2u1132_41
	goto	i2u1132_40

i2u1132_41:
	goto	i2l8956
i2u1132_40:
	line	50
	
i2l8942:
	movlw	low(0)
	movwf	((c:_ms_counter))^00h,c	;volatile
	line	51
	
i2l8944:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1133_41
	goto	i2u1133_40

i2u1133_41:
	goto	i2l8956
i2u1133_40:
	line	53
	
i2l8946:
	decf	((c:_menu_timeout_timer))^00h,c	;volatile
	btfss	status,0
	decf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	line	56
	
i2l8948:
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
	goto	i2u1134_41
	goto	i2u1134_40

i2u1134_41:
	goto	i2l8952
i2u1134_40:
	line	59
	
i2l8950:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_timeout_debug_flag))&0ffh	;volatile
	line	62
	
i2l8952:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1135_41
	goto	i2u1135_40

i2u1135_41:
	goto	i2l8956
i2u1135_40:
	line	64
	
i2l8954:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	70
	
i2l8956:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u1136_41
	goto	i2u1136_40
i2u1136_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u1136_48
i2u1136_40:
	clrf	(??_isr+0+0)^00h,c
i2u1136_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u1137_41
	goto	i2u1137_40
i2u1137_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u1137_48
i2u1137_40:
	clrf	(??_isr+1+0)^00h,c
i2u1137_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	71
	
i2l8958:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	74
	
i2l8960:
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
	
i2l8962:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u1138_41
	goto	i2u1138_40
i2u1138_41:
	goto	i2l8988
i2u1138_40:
	line	79
	
i2l8964:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u1139_41
	goto	i2u1139_40

i2u1139_41:
	goto	i2l8976
i2u1139_40:
	line	81
	
i2l8966:
	movlb	2	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	82
	
i2l8968:; BSR set to: 2

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	85
	
i2l8970:; BSR set to: 2

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1140_41
	goto	i2u1140_40

i2u1140_41:
	goto	i2l8988
i2u1140_40:
	line	87
	
i2l8972:; BSR set to: 2

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	88
	
i2l8974:; BSR set to: 2

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l8988
	line	91
	
i2l8976:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u1141_41
	goto	i2u1141_40

i2u1141_41:
	goto	i2l8988
i2u1141_40:
	line	93
	
i2l8978:
	movlb	2	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	line	94
	
i2l8980:; BSR set to: 2

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	97
	
i2l8982:; BSR set to: 2

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1142_41
	goto	i2u1142_40

i2u1142_41:
	goto	i2l326
i2u1142_40:
	goto	i2l8972
	line	103
	
i2l326:; BSR set to: 2

	line	105
	
i2l8988:
	movff	(c:isr@new_state),(c:_enc_state)
	line	108
	
i2l8990:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	109
	
i2l8992:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u1143_41
	goto	i2u1143_40

i2u1143_41:
	goto	i2l9020
i2u1143_40:
	line	111
	
i2l8994:
	incf	((c:_btn_debounce))^00h,c
	line	112
	
i2l8996:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u1144_41
	goto	i2u1144_40

i2u1144_41:
	goto	i2l9030
i2u1144_40:
	line	114
	
i2l8998:
	movff	(c:isr@btn),(c:_last_btn)
	line	115
	
i2l9000:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	117
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1145_41
	goto	i2u1145_40
i2u1145_41:
	goto	i2l9010
i2u1145_40:
	line	120
	
i2l9002:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	121
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	124
	
i2l9004:; BSR set to: 2

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1146_41
	goto	i2u1146_40

i2u1146_41:
	goto	i2l338
i2u1146_40:
	line	126
	
i2l9006:; BSR set to: 2

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	127
	
i2l9008:; BSR set to: 2

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l9030
	line	133
	
i2l9010:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1147_41
	goto	i2u1147_40

i2u1147_41:
	goto	i2l9014
i2u1147_40:
	line	135
	
i2l9012:
	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	136
	goto	i2l335
	line	137
	
i2l9014:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u1148_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1148_41
	goto	i2u1148_40

i2u1148_41:
	goto	i2l9018
i2u1148_40:
	line	139
	
i2l9016:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	140
	goto	i2l335
	line	143
	
i2l9018:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	144
	
i2l335:; BSR set to: 2

	line	146
	movlw	low(01h)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	147
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	goto	i2l9030
	line	153
	
i2l9020:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	155
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1149_41
	goto	i2u1149_40
i2u1149_41:
	goto	i2l9030
i2u1149_40:
	
i2l9022:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1150_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1150_41
	goto	i2u1150_40

i2u1150_41:
	goto	i2l9030
i2u1150_40:
	line	157
	
i2l9024:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	160
	
i2l9026:
		movlw	8
	xorwf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1151_41
	movlw	7
	xorwf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1151_41
	goto	i2u1151_40

i2u1151_41:
	goto	i2l338
i2u1151_40:
	line	162
	
i2l9028:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	goto	i2l9030
	line	165
	
i2l338:
	line	169
	
i2l9030:
	btfss	((c:3998))^0f00h,c,0	;volatile
	goto	i2u1152_41
	goto	i2u1152_40
i2u1152_41:
	goto	i2l344
i2u1152_40:
	line	171
	
i2l9032:
	bcf	((c:3998))^0f00h,c,0	;volatile
	line	172
	
i2l9034:
	movlw	low(0Bh)
	movwf	((c:4047))^0f00h,c	;volatile
	line	173
	movlw	low(0DCh)
	movwf	((c:4046))^0f00h,c	;volatile
	line	177
	
i2l9036:
	call	_relay_timer_tick	;wreg free
	line	179
	
i2l344:
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
psect	text63,class=CODE,space=0,reloc=2,group=0
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext63
__ptext63:
psect	text63
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
i2___lwmod:
;incstack = 0
	callstack 22
	line	12
	
i2l8610:
	movf	((c:i2___lwmod@divisor))^00h,c,w
iorwf	((c:i2___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	i2u1086_41
	goto	i2u1086_40

i2u1086_41:
	goto	i2l1929
i2u1086_40:
	line	13
	
i2l8612:
	movlw	low(01h)
	movwf	((c:i2___lwmod@counter))^00h,c
	line	14
	goto	i2l8616
	line	15
	
i2l8614:
	bcf	status,0
	rlcf	((c:i2___lwmod@divisor))^00h,c
	rlcf	((c:i2___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:i2___lwmod@counter))^00h,c
	line	14
	
i2l8616:
	
	btfss	((c:i2___lwmod@divisor+1))^00h,c,(15)&7
	goto	i2u1087_41
	goto	i2u1087_40
i2u1087_41:
	goto	i2l8614
i2u1087_40:
	line	19
	
i2l8618:
		movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c,w
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	i2u1088_41
	goto	i2u1088_40

i2u1088_41:
	goto	i2l8622
i2u1088_40:
	line	20
	
i2l8620:
	movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c

	line	21
	
i2l8622:
	bcf	status,0
	rrcf	((c:i2___lwmod@divisor+1))^00h,c
	rrcf	((c:i2___lwmod@divisor))^00h,c
	line	22
	
i2l8624:
	decfsz	((c:i2___lwmod@counter))^00h,c
	
	goto	i2l8618
	line	23
	
i2l1929:
	line	24
	movff	(c:i2___lwmod@dividend),(c:?i2___lwmod)
	movff	(c:i2___lwmod@dividend+1),(c:?i2___lwmod+1)
	line	25
	
i2l1936:
	return	;funcret
	callstack 0
GLOBAL	__end_ofi2___lwmod
	__end_ofi2___lwmod:
	signat	i2___lwmod,8282
	global	_relay_timer_tick

;; *************** function _relay_timer_tick *****************
;; Defined at:
;;		line 211 in file "src\encoder.c"
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text64,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	211
global __ptext64
__ptext64:
psect	text64
	file	"src\encoder.c"
	line	211
	
_relay_timer_tick:
;incstack = 0
	callstack 22
	line	215
	
i2l353:
	return	;funcret
	callstack 0
GLOBAL	__end_of_relay_timer_tick
	__end_of_relay_timer_tick:
	signat	_relay_timer_tick,89
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
