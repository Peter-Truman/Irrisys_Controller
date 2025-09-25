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
	FNCALL	_main,_menu_handle_button
	FNCALL	_main,_menu_handle_encoder
	FNCALL	_main,_menu_init
	FNCALL	_main,_save_current_config
	FNCALL	_main,_sprintf
	FNCALL	_main,_system_init
	FNCALL	_main,_uart_init
	FNCALL	_main,_uart_println
	FNCALL	_menu_handle_encoder,_get_item_options
	FNCALL	_menu_handle_button,_beep
	FNCALL	_menu_handle_button,_get_item_options
	FNCALL	_menu_handle_button,_strcmp
	FNCALL	_menu_handle_button,_strcpy
	FNCALL	_menu_handle_button,_uart_println
	FNCALL	_uart_println,_uart_print
	FNCALL	_uart_println,_uart_write
	FNCALL	_uart_print,_uart_write
	FNCALL	_menu_draw_options,_lcd_clear_line
	FNCALL	_menu_draw_options,_lcd_print
	FNCALL	_menu_draw_options,_lcd_print_at
	FNCALL	_menu_draw_input,_get_item_options
	FNCALL	_menu_draw_input,_lcd_clear_line
	FNCALL	_menu_draw_input,_lcd_print_at
	FNCALL	_menu_draw_input,_sprintf
	FNCALL	_menu_draw_input,_strcat
	FNCALL	_menu_draw_input,_strcmp
	FNCALL	_menu_draw_input,_strcpy
	FNCALL	_menu_draw_input,_strlen
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
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
	global	_options_menu
	global	_last_btn
	global	_enable_edit_flag
	global	menu_draw_input@F2375
	global	_current_menu
	global	_value_sensor
	global	_value_enable
	global	_input_menu
	global	_value_display
	global	_value_rlyslp
	global	_value_rlyplp
	global	_value_rlyhigh
	global	_value_slpbp
	global	_value_plpbp
	global	_value_highbp
	global	_value_scale20
	global	_value_scale4
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"src\menu.c"
	line	38

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
	line	211

;initializer for menu_draw_input@F2375
	db	low(028h)
	db	low(0)
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	db   0
	line	18

;initializer for _current_menu
	db	low(01h)
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
psect	idataBANK1,class=CODE,space=0,delta=1,noexec
global __pidataBANK1
__pidataBANK1:
	line	60

;initializer for _input_menu
		db	low(STR_28)
	db	high(STR_28)

		db	low(_value_enable)
	db	0

	db	low(01h)
		db	low(STR_29)
	db	high(STR_29)

		db	low(_value_sensor)
	db	0

	db	low(01h)
		db	low(STR_30)
	db	high(STR_30)

		db	low(_value_scale4)
	db	high(_value_scale4)

	db	low(01h)
		db	low(STR_31)
	db	high(STR_31)

		db	low(_value_scale20)
	db	high(_value_scale20)

	db	low(01h)
		db	low(STR_32)
	db	high(STR_32)

		db	low(_value_highbp)
	db	high(_value_highbp)

	db	low(01h)
		db	low(STR_33)
	db	high(STR_33)

		db	low(_value_plpbp)
	db	high(_value_plpbp)

	db	low(01h)
		db	low(STR_34)
	db	high(STR_34)

		db	low(_value_slpbp)
	db	high(_value_slpbp)

	db	low(01h)
		db	low(STR_35)
	db	high(STR_35)

		db	low(_value_rlyhigh)
	db	high(_value_rlyhigh)

	db	low(01h)
		db	low(STR_36)
	db	high(STR_36)

		db	low(_value_rlyplp)
	db	high(_value_rlyplp)

	db	low(01h)
		db	low(STR_37)
	db	high(STR_37)

		db	low(_value_rlyslp)
	db	high(_value_rlyslp)

	db	low(01h)
		db	low(STR_38)
	db	high(STR_38)

		db	low(_value_display)
	db	high(_value_display)

	db	low(01h)
		db	low(STR_39)
	db	high(STR_39)

		db	low(_value_back)
	db	0

	db	low(0)
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
	global	_enc_table
psect	mediumconst,class=MEDIUMCONST,space=0,reloc=2,noexec
global __pmediumconst
__pmediumconst:
	db	0
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
	global	_menu_item_options
psect	mediumconst
	file	"src\menu.c"
	line	29
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
	global	_menu_item_options
	global	_button_hold_ms
	global	_btn_debounce
	global	_enc_accumulator
	global	_enc_state
	global	_button_pressed
	global	_original_value
	global	_value_back
	global	_sensor_edit_flag
	global	_input_config
	global	_menu
	global	main@blink_timer
	global	_encoder_count
	global	_save_pending
	global	_button_event
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
	
STR_69:
	db	86	;'V'
	db	101	;'e'
	db	114	;'r'
	db	121	;'y'
	db	32
	db	108	;'l'
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
	db	114	;'r'
	db	101	;'e'
	db	116	;'t'
	db	117	;'u'
	db	114	;'r'
	db	110	;'n'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
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
	db	32
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	0
	
STR_64:
	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	32
	db	115	;'s'
	db	101	;'e'
	db	108	;'l'
	db	101	;'e'
	db	99	;'c'
	db	116	;'t'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	45
	db	32
	db	114	;'r'
	db	101	;'e'
	db	116	;'t'
	db	117	;'u'
	db	114	;'r'
	db	110	;'n'
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
	
STR_63:
	db	65	;'A'
	db	98	;'b'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	32
	db	115	;'s'
	db	101	;'e'
	db	108	;'l'
	db	101	;'e'
	db	99	;'c'
	db	116	;'t'
	db	101	;'e'
	db	100	;'d'
	db	32
	db	45
	db	32
	db	110	;'n'
	db	111	;'o'
	db	116	;'t'
	db	32
	db	105	;'i'
	db	109	;'m'
	db	112	;'p'
	db	108	;'l'
	db	101	;'e'
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	116	;'t'
	db	101	;'e'
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
	
STR_65:
	db	85	;'U'
	db	110	;'n'
	db	107	;'k'
	db	110	;'n'
	db	111	;'o'
	db	119	;'w'
	db	110	;'n'
	db	32
	db	79	;'O'
	db	80	;'P'
	db	84	;'T'
	db	73	;'I'
	db	79	;'O'
	db	78	;'N'
	db	83	;'S'
	db	32
	db	115	;'s'
	db	101	;'e'
	db	108	;'l'
	db	101	;'e'
	db	99	;'c'
	db	116	;'t'
	db	105	;'i'
	db	111	;'o'
	db	110	;'n'
	db	0
	
STR_68:
	db	82	;'R'
	db	101	;'e'
	db	116	;'t'
	db	117	;'u'
	db	114	;'r'
	db	110	;'n'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
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
	db	32
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	0
	
STR_62:
	db	83	;'S'
	db	119	;'w'
	db	105	;'i'
	db	116	;'t'
	db	99	;'c'
	db	104	;'h'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	32
	db	85	;'U'
	db	84	;'T'
	db	73	;'I'
	db	76	;'L'
	db	73	;'I'
	db	84	;'T'
	db	89	;'Y'
	db	32
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	0
	
STR_61:
	db	83	;'S'
	db	119	;'w'
	db	105	;'i'
	db	116	;'t'
	db	99	;'c'
	db	104	;'h'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	32
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
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
	
STR_60:
	db	83	;'S'
	db	119	;'w'
	db	105	;'i'
	db	116	;'t'
	db	99	;'c'
	db	104	;'h'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	32
	db	77	;'M'
	db	65	;'A'
	db	73	;'I'
	db	78	;'N'
	db	32
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
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
	
STR_40:
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
	
STR_18:
	db	80	;'P'
	db	114	;'r'
	db	101	;'e'
	db	115	;'s'
	db	115	;'s'
	db	117	;'u'
	db	114	;'r'
	db	101	;'e'
	db	0
	
STR_35:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	0
	
STR_51:
	db	40
	db	32
	db	32
	db	32
	db	32
	db	32
	db	41
	db	0
	
STR_46:
	db	40
	db	69	;'E'
	db	114	;'r'
	db	114	;'r'
	db	111	;'o'
	db	114	;'r'
	db	41
	db	0
	
STR_44:
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	49	;'1'
	db	0
	
STR_32:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_36:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_37:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_41:
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
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	0
	
STR_70:
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
	
STR_33:
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_34:
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_26:
	db	65	;'A'
	db	98	;'b'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_45:
	db	40
	db	37
	db	115	;'s'
	db	41
	db	0
	
STR_54:
	db	91	;'['
	db	37
	db	115	;'s'
	db	93	;']'
	db	0
	
STR_39:
	db	66	;'B'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_19:
	db	84	;'T'
	db	101	;'e'
	db	109	;'m'
	db	112	;'p'
	db	0
	
STR_27:
	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	0
	
STR_20:
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_48:
	db	40
	db	0
	
STR_42:
	db	91	;'['
	db	0
STR_59	equ	STR_19+0
STR_67	equ	STR_19+0
STR_58	equ	STR_18+0
STR_66	equ	STR_18+0
STR_57	equ	STR_13+0
STR_56	equ	STR_14+0
STR_43	equ	STR_54+3
STR_47	equ	STR_45+0
STR_50	equ	STR_51+6
STR_53	equ	STR_51+6
STR_49	equ	STR_40+19
STR_52	equ	STR_40+19
STR_15	equ	STR_40+20
STR_16	equ	STR_40+20
STR_17	equ	STR_40+20
STR_21	equ	STR_40+20
STR_22	equ	STR_40+20
STR_55	equ	STR_40+20
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
_btn_debounce:
       ds      1
_enc_accumulator:
       ds      1
_enc_state:
       ds      1
	global	_button_pressed
_button_pressed:
       ds      1
_original_value:
       ds      10
_value_back:
       ds      1
	global	_sensor_edit_flag
_sensor_edit_flag:
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
	global	_encoder_count
_encoder_count:
       ds      2
	global	_save_pending
_save_pending:
       ds      1
	global	_button_event
_button_event:
       ds      1
psect	dataBANK0,class=BANK0,space=1,noexec,lowdata
global __pdataBANK0
__pdataBANK0:
	file	"src\menu.c"
	line	211
menu_draw_input@F2375:
       ds      10
psect	dataBANK0
	file	"src\menu.c"
	line	18
	global	_current_menu
_current_menu:
       ds      1
psect	dataBANK0
	file	"src\menu.c"
	line	47
_value_sensor:
       ds      12
psect	dataBANK0
	file	"src\menu.c"
	line	46
_value_enable:
       ds      10
psect	dataBANK1,class=BANK1,space=1,noexec,lowdata
global __pdataBANK1
__pdataBANK1:
	file	"src\menu.c"
	line	60
	global	_input_menu
_input_menu:
       ds      60
psect	dataBANK1
	file	"src\menu.c"
	line	56
_value_display:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	55
_value_rlyslp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	54
_value_rlyplp:
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
	line	49
_value_scale20:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	48
_value_scale4:
       ds      10
psect	bssBANK2,class=BANK2,space=1,noexec,lowdata
global __pbssBANK2
__pbssBANK2:
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
; Initialize objects allocated to BANK1 (150 bytes)
	global __pidataBANK1
	; load TBLPTR registers with __pidataBANK1
	movlw	low (__pidataBANK1)
	movwf	tblptrl
	movlw	high(__pidataBANK1)
	movwf	tblptrh
	movlw	low highword(__pidataBANK1)
	movwf	tblptru
	lfsr	0,__pdataBANK1
	lfsr	1,150
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK0 (33 bytes)
	global __pidataBANK0
	; load TBLPTR registers with __pidataBANK0
	movlw	low (__pidataBANK0)
	movwf	tblptrl
	movlw	high(__pidataBANK0)
	movwf	tblptrh
	movlw	low highword(__pidataBANK0)
	movwf	tblptru
	lfsr	0,__pdataBANK0
	lfsr	1,33
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
; Initialize objects allocated to COMRAM (12 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	lfsr	0,__pdataCOMRAM
	lfsr	1,12
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
; Clear objects allocated to BANK2 (128 bytes)
	global __pbssBANK2
lfsr	0,__pbssBANK2
movlw	128
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
; Clear objects allocated to BANK0 (16 bytes)
	global __pbssBANK0
lfsr	0,__pbssBANK0
movlw	16
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
; Clear objects allocated to COMRAM (18 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	18
clear_3:
clrf	postinc0,c
decf	wreg
bnz	clear_3
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
psect	cstackBANK0,class=BANK0,space=1,noexec,lowdata
global __pcstackBANK0
__pcstackBANK0:
	global	main@buf
main@buf:	; 40 bytes @ 0x0
	ds   40
	global	main@buf_489
main@buf_489:	; 30 bytes @ 0x28
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
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_eeprom_init:	; 1 bytes @ 0x0
?_encoder_init:	; 1 bytes @ 0x0
?_menu_init:	; 1 bytes @ 0x0
?_menu_draw_options:	; 1 bytes @ 0x0
?_menu_draw_input:	; 1 bytes @ 0x0
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
?_strcat:	; 1 bytes @ 0x9
?_strcpy:	; 1 bytes @ 0x9
??_sync_menu_variables:	; 1 bytes @ 0x9
??_uart_init:	; 1 bytes @ 0x9
??_uart_write:	; 1 bytes @ 0x9
??_system_init:	; 1 bytes @ 0x9
??_lcd_write_nibble:	; 1 bytes @ 0x9
?_beep:	; 1 bytes @ 0x9
?_eeprom_read_byte:	; 1 bytes @ 0x9
?_eeprom_write_byte:	; 1 bytes @ 0x9
	global	?_strlen
?_strlen:	; 2 bytes @ 0x9
	global	?_strcmp
?_strcmp:	; 2 bytes @ 0x9
	global	?_get_item_options
?_get_item_options:	; 2 bytes @ 0x9
?_memcpy:	; 2 bytes @ 0x9
	global	?_calculate_config_checksum
?_calculate_config_checksum:	; 2 bytes @ 0x9
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x9
	global	uart_write@c
uart_write@c:	; 1 bytes @ 0x9
	global	lcd_write_nibble@nibble
lcd_write_nibble@nibble:	; 1 bytes @ 0x9
	global	strcat@to
strcat@to:	; 1 bytes @ 0x9
	global	strcpy@to
strcpy@to:	; 1 bytes @ 0x9
	global	beep@duration_ms
beep@duration_ms:	; 2 bytes @ 0x9
	global	eeprom_read_byte@address
eeprom_read_byte@address:	; 2 bytes @ 0x9
	global	eeprom_write_byte@address
eeprom_write_byte@address:	; 2 bytes @ 0x9
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x9
	global	memcpy@d1
memcpy@d1:	; 2 bytes @ 0x9
	global	strcmp@s1
strcmp@s1:	; 2 bytes @ 0x9
	global	strlen@s
strlen@s:	; 2 bytes @ 0x9
	ds   1
?_uart_print:	; 1 bytes @ 0xA
??_lcd_cmd:	; 1 bytes @ 0xA
??_lcd_data:	; 1 bytes @ 0xA
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0xA
	global	uart_print@str
uart_print@str:	; 2 bytes @ 0xA
	global	strcat@from
strcat@from:	; 2 bytes @ 0xA
	global	strcpy@from
strcpy@from:	; 2 bytes @ 0xA
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
	global	lcd_print@str
lcd_print@str:	; 2 bytes @ 0xB
	global	eeprom_read_word@address
eeprom_read_word@address:	; 2 bytes @ 0xB
	global	eeprom_read_block@data
eeprom_read_block@data:	; 2 bytes @ 0xB
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0xB
	global	memcpy@s1
memcpy@s1:	; 2 bytes @ 0xB
	global	strcmp@s2
strcmp@s2:	; 2 bytes @ 0xB
	global	strlen@cp
strlen@cp:	; 2 bytes @ 0xB
	ds   1
??_strcat:	; 1 bytes @ 0xC
??_strcpy:	; 1 bytes @ 0xC
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
	global	strcat@cp
strcat@cp:	; 1 bytes @ 0xC
	global	strcpy@cp
strcpy@cp:	; 1 bytes @ 0xC
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
??_strcmp:	; 1 bytes @ 0xD
??_lcd_print:	; 1 bytes @ 0xD
??_lcd_set_cursor:	; 1 bytes @ 0xD
??_eeprom_read_word:	; 1 bytes @ 0xD
??___lwdiv:	; 1 bytes @ 0xD
	global	lcd_set_cursor@row
lcd_set_cursor@row:	; 1 bytes @ 0xD
	global	menu_handle_encoder@delta
menu_handle_encoder@delta:	; 2 bytes @ 0xD
	global	eeprom_read_block@address
eeprom_read_block@address:	; 2 bytes @ 0xD
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0xD
	global	memcpy@n
memcpy@n:	; 2 bytes @ 0xD
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
	ds   1
??_menu_handle_encoder:	; 1 bytes @ 0xF
??_memcpy:	; 1 bytes @ 0xF
?_lcd_print_at:	; 1 bytes @ 0xF
??_lcd_clear_line:	; 1 bytes @ 0xF
	global	lcd_print_at@col
lcd_print_at@col:	; 1 bytes @ 0xF
	global	lcd_clear_line@row
lcd_clear_line@row:	; 1 bytes @ 0xF
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0xF
	global	strcmp@r
strcmp@r:	; 1 bytes @ 0xF
	global	eeprom_read_block@length
eeprom_read_block@length:	; 2 bytes @ 0xF
	global	memcpy@d
memcpy@d:	; 2 bytes @ 0xF
	ds   1
??_menu_handle_button:	; 1 bytes @ 0x10
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
	ds   1
??_eeprom_read_block:	; 1 bytes @ 0x11
	global	eeprom_read_block@ptr
eeprom_read_block@ptr:	; 2 bytes @ 0x11
	global	memcpy@s
memcpy@s:	; 2 bytes @ 0x11
	ds   1
??_lcd_print_at:	; 1 bytes @ 0x12
??_eeprom_write_block:	; 1 bytes @ 0x12
	global	lcd_print_at@row
lcd_print_at@row:	; 1 bytes @ 0x12
	global	calculate_config_checksum@j_1044
calculate_config_checksum@j_1044:	; 2 bytes @ 0x12
	global	eeprom_write_block@ptr
eeprom_write_block@ptr:	; 2 bytes @ 0x12
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x12
	ds   1
??_menu_draw_options:	; 1 bytes @ 0x13
	global	memcpy@tmp
memcpy@tmp:	; 1 bytes @ 0x13
	global	eeprom_read_block@i
eeprom_read_block@i:	; 2 bytes @ 0x13
	ds   1
??_load_factory_defaults:	; 1 bytes @ 0x14
??___lwmod:	; 1 bytes @ 0x14
	global	calculate_config_checksum@i
calculate_config_checksum@i:	; 1 bytes @ 0x14
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x14
	global	menu_handle_encoder@opts
menu_handle_encoder@opts:	; 2 bytes @ 0x14
	global	_menu_handle_button$868
_menu_handle_button$868:	; 2 bytes @ 0x14
	global	eeprom_write_block@i
eeprom_write_block@i:	; 2 bytes @ 0x14
	ds   1
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x15
	global	sprintf@sp
sprintf@sp:	; 1 bytes @ 0x15
	ds   1
??_save_current_config:	; 1 bytes @ 0x16
	global	menu_handle_encoder@edit_flag
menu_handle_encoder@edit_flag:	; 1 bytes @ 0x16
	global	menu_handle_button@opts
menu_handle_button@opts:	; 2 bytes @ 0x16
	global	save_current_config@checksum
save_current_config@checksum:	; 2 bytes @ 0x16
	global	sprintf@f
sprintf@f:	; 2 bytes @ 0x16
	ds   2
	global	menu_draw_options@i
menu_draw_options@i:	; 1 bytes @ 0x18
	global	menu_handle_button@press_type
menu_handle_button@press_type:	; 1 bytes @ 0x18
	global	save_current_config@i
save_current_config@i:	; 1 bytes @ 0x18
	ds   1
??_eeprom_init:	; 1 bytes @ 0x19
	global	eeprom_init@stored_checksum
eeprom_init@stored_checksum:	; 2 bytes @ 0x19
	ds   2
	global	eeprom_init@calculated_checksum
eeprom_init@calculated_checksum:	; 2 bytes @ 0x1B
	ds   1
??_sprintf:	; 1 bytes @ 0x1C
	ds   1
	global	eeprom_init@i
eeprom_init@i:	; 1 bytes @ 0x1D
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x1D
	ds   1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x1E
	ds   1
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x1F
	ds   1
	global	sprintf@cp
sprintf@cp:	; 2 bytes @ 0x20
	ds   2
	global	sprintf@val
sprintf@val:	; 2 bytes @ 0x22
	ds   2
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x24
	ds   1
??_menu_draw_input:	; 1 bytes @ 0x25
	ds   4
	global	menu_draw_input@blank
menu_draw_input@blank:	; 10 bytes @ 0x29
	ds   10
	global	menu_draw_input@value_buf
menu_draw_input@value_buf:	; 15 bytes @ 0x33
	ds   15
	global	menu_draw_input@val_len
menu_draw_input@val_len:	; 1 bytes @ 0x42
	ds   1
	global	menu_draw_input@val_len_822
menu_draw_input@val_len_822:	; 1 bytes @ 0x43
	ds   1
	global	_menu_draw_input$806
_menu_draw_input$806:	; 2 bytes @ 0x44
	ds   2
	global	_menu_draw_input$815
_menu_draw_input$815:	; 2 bytes @ 0x46
	ds   2
	global	menu_draw_input@j
menu_draw_input@j:	; 1 bytes @ 0x48
	ds   1
	global	menu_draw_input@j_825
menu_draw_input@j_825:	; 1 bytes @ 0x49
	ds   1
	global	menu_draw_input@flag_value
menu_draw_input@flag_value:	; 1 bytes @ 0x4A
	ds   1
	global	menu_draw_input@flag_value_814
menu_draw_input@flag_value_814:	; 1 bytes @ 0x4B
	ds   1
	global	menu_draw_input@val_len_829
menu_draw_input@val_len_829:	; 1 bytes @ 0x4C
	ds   1
	global	menu_draw_input@opts
menu_draw_input@opts:	; 2 bytes @ 0x4D
	ds   2
	global	menu_draw_input@opts_810
menu_draw_input@opts_810:	; 2 bytes @ 0x4F
	ds   2
	global	menu_draw_input@i
menu_draw_input@i:	; 1 bytes @ 0x51
	ds   1
	global	menu_draw_input@item_idx
menu_draw_input@item_idx:	; 1 bytes @ 0x52
	ds   1
??_main:	; 1 bytes @ 0x53
	ds   2
;!
;!Data Sizes:
;!    Strings     739
;!    Constant    562
;!    Data        195
;!    BSS         546
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126     85     115
;!    BANK0           128     76     125
;!    BANK1           256      0     150
;!    BANK2           256      0     128
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
;!    input_menu$label	PTR const unsigned char  size(2) Largest target is 11
;!		 -> STR_28(CODE[7]), STR_29(CODE[7]), STR_30(CODE[10]), STR_31(CODE[11]), 
;!		 -> STR_32(CODE[8]), STR_33(CODE[6]), STR_34(CODE[6]), STR_35(CODE[9]), 
;!		 -> STR_36(CODE[8]), STR_37(CODE[8]), STR_38(CODE[8]), STR_39(CODE[5]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(BANK0[10]), value_highbp(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK1[10]), value_scale4(BANK1[10]), value_sensor(BANK0[12]), value_slpbp(BANK1[10]), 
;!
;!    lcd_print@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> menu_draw_input@value_buf(COMRAM[15]), STR_23(CODE[10]), STR_24(CODE[11]), STR_25(CODE[13]), 
;!		 -> STR_26(CODE[6]), STR_27(CODE[5]), STR_28(CODE[7]), STR_29(CODE[7]), 
;!		 -> STR_3(CODE[13]), STR_30(CODE[10]), STR_31(CODE[11]), STR_32(CODE[8]), 
;!		 -> STR_33(CODE[6]), STR_34(CODE[6]), STR_35(CODE[9]), STR_36(CODE[8]), 
;!		 -> STR_37(CODE[8]), STR_38(CODE[8]), STR_39(CODE[5]), STR_4(CODE[16]), 
;!		 -> STR_40(CODE[21]), STR_41(CODE[8]), STR_42(CODE[2]), STR_43(CODE[2]), 
;!		 -> STR_44(CODE[8]), 
;!
;!    lcd_print_at@str	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(COMRAM[15]), STR_23(CODE[10]), STR_24(CODE[11]), STR_25(CODE[13]), 
;!		 -> STR_26(CODE[6]), STR_27(CODE[5]), STR_28(CODE[7]), STR_29(CODE[7]), 
;!		 -> STR_30(CODE[10]), STR_31(CODE[11]), STR_32(CODE[8]), STR_33(CODE[6]), 
;!		 -> STR_34(CODE[6]), STR_35(CODE[9]), STR_36(CODE[8]), STR_37(CODE[8]), 
;!		 -> STR_38(CODE[8]), STR_39(CODE[5]), STR_41(CODE[8]), STR_42(CODE[2]), 
;!		 -> STR_44(CODE[8]), 
;!
;!    memcpy@d	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK2[128]), 
;!
;!    memcpy@d1	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK2[128]), 
;!
;!    memcpy@s	PTR const unsigned char  size(2) Largest target is 384
;!		 -> factory_defaults(CODE[384]), system_defaults(CODE[128]), 
;!
;!    memcpy@s1	PTR const void  size(2) Largest target is 384
;!		 -> factory_defaults(CODE[384]), system_defaults(CODE[128]), 
;!
;!    menu_draw_input@opts	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), STR_16(CODE[1]), 
;!		 -> STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), STR_20(CODE[5]), 
;!		 -> STR_21(CODE[1]), STR_22(CODE[1]), 
;!
;!    menu_draw_input@opts_810	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts_810$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), STR_16(CODE[1]), 
;!		 -> STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), STR_20(CODE[5]), 
;!		 -> STR_21(CODE[1]), STR_22(CODE[1]), 
;!
;!    menu_handle_button$868	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_56(CODE[8]), STR_57(CODE[9]), 
;!
;!    menu_handle_button@opts	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    options_menu	PTR const unsigned char [5] size(2) Largest target is 13
;!		 -> STR_23(CODE[10]), STR_24(CODE[11]), STR_25(CODE[13]), STR_26(CODE[6]), 
;!		 -> STR_27(CODE[5]), 
;!
;!    S658$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), STR_16(CODE[1]), 
;!		 -> STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), STR_20(CODE[5]), 
;!		 -> STR_21(CODE[1]), STR_22(CODE[1]), 
;!
;!    S662$label	PTR const unsigned char  size(2) Largest target is 11
;!		 -> STR_28(CODE[7]), STR_29(CODE[7]), STR_30(CODE[10]), STR_31(CODE[11]), 
;!		 -> STR_32(CODE[8]), STR_33(CODE[6]), STR_34(CODE[6]), STR_35(CODE[9]), 
;!		 -> STR_36(CODE[8]), STR_37(CODE[8]), STR_38(CODE[8]), STR_39(CODE[5]), 
;!
;!    S662$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(BANK0[10]), value_highbp(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK1[10]), value_scale4(BANK1[10]), value_sensor(BANK0[12]), value_slpbp(BANK1[10]), 
;!
;!    sp__get_item_options	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    sp__memcpy	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), system_config(BANK2[128]), 
;!
;!    sp__strcat	PTR unsigned char  size(1) Largest target is 15
;!		 -> menu_draw_input@blank(COMRAM[10]), menu_draw_input@value_buf(COMRAM[15]), 
;!
;!    sp__strcpy	PTR unsigned char  size(1) Largest target is 15
;!		 -> menu_draw_input@value_buf(COMRAM[15]), original_value(COMRAM[10]), value_enable(BANK0[10]), value_sensor(BANK0[12]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 12
;!		 -> ?_sprintf(COMRAM[2]), STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), 
;!		 -> STR_16(CODE[1]), STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), 
;!		 -> STR_20(CODE[5]), STR_21(CODE[1]), STR_22(CODE[1]), STR_70(CODE[7]), 
;!		 -> value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(BANK0[10]), value_highbp(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK1[10]), value_scale4(BANK1[10]), value_sensor(BANK0[12]), value_slpbp(BANK1[10]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 23
;!		 -> STR_11(CODE[23]), STR_12(CODE[17]), STR_45(CODE[5]), STR_46(CODE[8]), 
;!		 -> STR_47(CODE[5]), STR_48(CODE[2]), STR_51(CODE[8]), STR_54(CODE[5]), 
;!
;!    sprintf@sp	PTR unsigned char  size(1) Largest target is 40
;!		 -> main@buf(BANK0[40]), main@buf_489(BANK0[30]), menu_draw_input@value_buf(COMRAM[15]), 
;!
;!    strcat@cp	PTR unsigned char  size(1) Largest target is 15
;!		 -> menu_draw_input@blank(COMRAM[10]), menu_draw_input@value_buf(COMRAM[15]), 
;!
;!    strcat@from	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_49(CODE[2]), STR_50(CODE[2]), STR_52(CODE[2]), STR_53(CODE[2]), 
;!
;!    strcat@to	PTR unsigned char  size(1) Largest target is 15
;!		 -> menu_draw_input@blank(COMRAM[10]), menu_draw_input@value_buf(COMRAM[15]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> original_value(COMRAM[10]), value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(BANK0[10]), 
;!		 -> value_highbp(BANK1[10]), value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), 
;!		 -> value_rlyslp(BANK1[10]), value_scale20(BANK1[10]), value_scale4(BANK1[10]), value_sensor(BANK0[12]), 
;!		 -> value_slpbp(BANK1[10]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_55(CODE[1]), STR_58(CODE[9]), STR_59(CODE[5]), STR_66(CODE[9]), 
;!		 -> STR_67(CODE[5]), 
;!
;!    strcpy@cp	PTR unsigned char  size(1) Largest target is 15
;!		 -> menu_draw_input@value_buf(COMRAM[15]), original_value(COMRAM[10]), value_enable(BANK0[10]), value_sensor(BANK0[12]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 12
;!		 -> menu_draw_input@blank(COMRAM[10]), STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), 
;!		 -> STR_16(CODE[1]), STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), 
;!		 -> STR_20(CODE[5]), STR_21(CODE[1]), STR_22(CODE[1]), STR_56(CODE[8]), 
;!		 -> STR_57(CODE[9]), value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(BANK0[10]), 
;!		 -> value_highbp(BANK1[10]), value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), 
;!		 -> value_rlyslp(BANK1[10]), value_scale20(BANK1[10]), value_scale4(BANK1[10]), value_sensor(BANK0[12]), 
;!		 -> value_slpbp(BANK1[10]), 
;!
;!    strcpy@to	PTR unsigned char  size(1) Largest target is 15
;!		 -> menu_draw_input@value_buf(COMRAM[15]), original_value(COMRAM[10]), value_enable(BANK0[10]), value_sensor(BANK0[12]), 
;!
;!    strlen@cp	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(COMRAM[15]), STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), 
;!		 -> STR_16(CODE[1]), STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), 
;!		 -> STR_20(CODE[5]), STR_21(CODE[1]), STR_22(CODE[1]), value_back(COMRAM[1]), 
;!		 -> value_display(BANK1[10]), value_enable(BANK0[10]), value_highbp(BANK1[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), value_scale20(BANK1[10]), 
;!		 -> value_scale4(BANK1[10]), value_sensor(BANK0[12]), value_slpbp(BANK1[10]), 
;!
;!    strlen@s	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(COMRAM[15]), STR_13(CODE[9]), STR_14(CODE[8]), STR_15(CODE[1]), 
;!		 -> STR_16(CODE[1]), STR_17(CODE[1]), STR_18(CODE[9]), STR_19(CODE[5]), 
;!		 -> STR_20(CODE[5]), STR_21(CODE[1]), STR_22(CODE[1]), value_back(COMRAM[1]), 
;!		 -> value_display(BANK1[10]), value_enable(BANK0[10]), value_highbp(BANK1[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), value_scale20(BANK1[10]), 
;!		 -> value_scale4(BANK1[10]), value_sensor(BANK0[12]), value_slpbp(BANK1[10]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 44
;!		 -> main@buf(BANK0[40]), main@buf_489(BANK0[30]), STR_1(CODE[28]), STR_10(CODE[19]), 
;!		 -> STR_2(CODE[23]), STR_5(CODE[22]), STR_6(CODE[19]), STR_60(CODE[23]), 
;!		 -> STR_61(CODE[24]), STR_62(CODE[26]), STR_63(CODE[33]), STR_64(CODE[41]), 
;!		 -> STR_65(CODE[26]), STR_68(CODE[26]), STR_69(CODE[44]), STR_7(CODE[24]), 
;!		 -> STR_8(CODE[22]), STR_9(CODE[22]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 44
;!		 -> main@buf(BANK0[40]), main@buf_489(BANK0[30]), STR_1(CODE[28]), STR_10(CODE[19]), 
;!		 -> STR_2(CODE[23]), STR_5(CODE[22]), STR_6(CODE[19]), STR_60(CODE[23]), 
;!		 -> STR_61(CODE[24]), STR_62(CODE[26]), STR_63(CODE[33]), STR_64(CODE[41]), 
;!		 -> STR_65(CODE[26]), STR_68(CODE[26]), STR_69(CODE[44]), STR_7(CODE[24]), 
;!		 -> STR_8(CODE[22]), STR_9(CODE[22]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_menu_draw_input
;!    _menu_handle_encoder->_get_item_options
;!    _menu_handle_button->_strcmp
;!    _uart_println->_uart_print
;!    _uart_print->_uart_write
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
;!    None.
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
;! (0) _main                                                78    78      0   33558
;!                                             83 COMRAM     2     2      0
;!                                              0 BANK0     76    76      0
;!                               _beep
;!                        _eeprom_init
;!                       _encoder_init
;!                          _lcd_clear
;!                           _lcd_init
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                    _menu_draw_input
;!                  _menu_draw_options
;!                 _menu_handle_button
;!                _menu_handle_encoder
;!                          _menu_init
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
;! (1) _menu_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_encoder                                 10     8      2     565
;!                                             13 COMRAM    10     8      2
;!                   _get_item_options
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                   9     9      0    4598
;!                                             16 COMRAM     9     9      0
;!                               _beep
;!                   _get_item_options
;!                             _strcmp
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    1555
;!                                             12 COMRAM     2     0      2
;!                         _uart_print
;!                         _uart_write
;! ---------------------------------------------------------------------------------
;! (2) _uart_print                                           2     0      2     143
;!                                             10 COMRAM     2     0      2
;!                         _uart_write
;! ---------------------------------------------------------------------------------
;! (2) _uart_write                                           1     1      0      22
;!                                              9 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (2) _beep                                                 5     3      2     806
;!                                              9 COMRAM     5     3      2
;! ---------------------------------------------------------------------------------
;! (1) _menu_draw_options                                    6     6      0    4179
;!                                             19 COMRAM     6     6      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;! ---------------------------------------------------------------------------------
;! (1) _menu_draw_input                                     46    46      0   10478
;!                                             37 COMRAM    46    46      0
;!                   _get_item_options
;!                     _lcd_clear_line
;!                       _lcd_print_at
;!                            _sprintf
;!                             _strcat
;!                             _strcmp
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (2) _strlen                                               4     2      2     318
;!                                              9 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (2) _strcpy                                               4     1      3     835
;!                                              9 COMRAM     4     1      3
;! ---------------------------------------------------------------------------------
;! (2) _strcmp                                               7     3      4    1033
;!                                              9 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (2) _strcat                                               4     1      3     706
;!                                              9 COMRAM     4     1      3
;! ---------------------------------------------------------------------------------
;! (1) _sprintf                                             22    15      7    2433
;!                                             21 COMRAM    16     9      7
;!                            ___lwdiv
;!                            ___lwmod
;! ---------------------------------------------------------------------------------
;! (2) ___lwmod                                              5     1      4     311
;!                                             16 COMRAM     5     1      4
;!                            ___lwdiv (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4     314
;!                                              9 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (2) _lcd_print_at                                         4     1      3    2162
;!                                             15 COMRAM     4     1      3
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _lcd_clear_line                                       1     1      0    1206
;!                                             15 COMRAM     1     1      0
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_set_cursor                                       3     2      1     551
;!                                             12 COMRAM     3     2      1
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (3) _lcd_print                                            2     0      2     633
;!                                             11 COMRAM     2     0      2
;!                           _lcd_data
;! ---------------------------------------------------------------------------------
;! (4) _lcd_data                                             1     1      0     132
;!                                             10 COMRAM     1     1      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (2) _get_item_options                                     4     2      2     112
;!                                              9 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (1) _lcd_init                                             2     2      0     264
;!                                             12 COMRAM     2     2      0
;!                            _lcd_cmd
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (1) _lcd_clear                                            1     1      0     176
;!                                             12 COMRAM     1     1      0
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (4) _lcd_cmd                                              2     2      0     176
;!                                             10 COMRAM     2     2      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (5) _lcd_write_nibble                                     1     1      0      88
;!                                              9 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _encoder_init                                         2     2      0       0
;!                                              9 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _eeprom_init                                          5     5      0    4601
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
;! (1) _save_current_config                                  3     3      0    2288
;!                                             22 COMRAM     3     3      0
;!          _calculate_config_checksum
;!                 _eeprom_write_block
;!                  _eeprom_write_word
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_write_word                                    4     0      4     764
;!                                             12 COMRAM     4     0      4
;!                  _eeprom_write_byte
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_write_block                                  10     4      6    1136
;!                                             12 COMRAM    10     4      6
;!                  _eeprom_write_byte
;! ---------------------------------------------------------------------------------
;! (3) _eeprom_write_byte                                    3     0      3     523
;!                                              9 COMRAM     3     0      3
;! ---------------------------------------------------------------------------------
;! (2) _calculate_config_checksum                           12    10      2     275
;!                                              9 COMRAM    12    10      2
;! ---------------------------------------------------------------------------------
;! (2) _load_factory_defaults                                0     0      0     599
;!                             _memcpy
;! ---------------------------------------------------------------------------------
;! (3) _memcpy                                              11     5      6     599
;!                                              9 COMRAM    11     5      6
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_read_word                                     7     5      2     417
;!                                             11 COMRAM     7     5      2
;!                   _eeprom_read_byte
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_read_block                                   10     4      6     886
;!                                             11 COMRAM    10     4      6
;!                   _eeprom_read_byte
;! ---------------------------------------------------------------------------------
;! (3) _eeprom_read_byte                                     2     0      2     273
;!                                              9 COMRAM     2     0      2
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 5
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (6) _isr                                                  9     9      0     179
;!                                              0 COMRAM     9     9      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 6
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
;!     _lcd_print_at
;!       _lcd_print
;!       _lcd_set_cursor
;!     _sprintf
;!       ___lwdiv
;!       ___lwmod
;!         ___lwdiv (ARG)
;!     _strcat
;!     _strcmp
;!     _strcpy
;!     _strlen
;!   _menu_draw_options
;!     _lcd_clear_line
;!     _lcd_print
;!     _lcd_print_at
;!   _menu_handle_button
;!     _beep
;!     _get_item_options
;!     _strcmp
;!     _strcpy
;!     _uart_println
;!       _uart_print
;!         _uart_write
;!       _uart_write
;!   _menu_handle_encoder
;!     _get_item_options
;!   _menu_init
;!   _save_current_config
;!   _sprintf
;!   _system_init
;!   _uart_init
;!   _uart_println
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
;!BANK2              100      0      80       9       50.0%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100      0      96       7       58.6%
;!BITBANK15           80      0       0      35        0.0%
;!BANK15              80      0       0      36        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80     4C      7D       5       97.7%
;!BITCOMRAM           7E      0       0       0        0.0%
;!COMRAM              7E     55      73       1       91.3%
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
;!ABS                  0      0     206      12        0.0%
;!DATA                 0      0     386       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 218 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            30   40[BANK0 ] unsigned char [30]
;;  current_even    1   73[BANK0 ] unsigned char 
;;  buf            40    0[BANK0 ] unsigned char [40]
;;  delta           2   71[BANK0 ] int 
;;  last_encoder    2   74[BANK0 ] int 
;;  last_button     1   70[BANK0 ] unsigned char 
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
;;      Locals:         0      76       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2      76       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       78 bytes
;; Hardware stack levels required when called: 6
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
;;		_menu_handle_button
;;		_menu_handle_encoder
;;		_menu_init
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
	line	218
global __ptext0
__ptext0:
psect	text0
	file	"src\main.c"
	line	218
	
_main:
;incstack = 0
	callstack 25
	line	221
	
l3533:
	call	_system_init	;wreg free
	line	222
	
l3535:
	call	_eeprom_init	;wreg free
	line	223
	
l3537:
	call	_uart_init	;wreg free
	line	224
	
l3539:
	call	_encoder_init	;wreg free
	line	225
	
l3541:
	call	_menu_init	;wreg free
	line	226
	
l3543:; BSR set to: 0

	call	_lcd_init	;wreg free
	line	228
	
l3545:
		movlw	low(STR_1)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_1)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	229
	
l3547:
		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	231
	
l3549:
	call	_lcd_clear	;wreg free
	line	232
	
l3551:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	233
	
l3553:
		movlw	low(STR_3)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_3)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	234
	
l3555:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	235
	
l3557:
		movlw	low(STR_4)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_4)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	237
	
l3559:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	238
	
l3561:
		movlw	low(STR_6)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_6)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	239
	
l3563:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	241
	
l3565:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	242
	
l3567:
	asmopt push
asmopt off
movlw  5
movwf	(??_main+0+0+1)^00h,c
movlw	15
movwf	(??_main+0+0)^00h,c
	movlw	241
u3437:
decfsz	wreg,f
	bra	u3437
	decfsz	(??_main+0+0)^00h,c,f
	bra	u3437
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u3437
	nop
asmopt pop

	line	243
	
l3569:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	245
	
l3571:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	246
	
l3573:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	248
	
l3575:
	asmopt push
asmopt off
movlw  41
movwf	(??_main+0+0+1)^00h,c
movlw	150
movwf	(??_main+0+0)^00h,c
	movlw	127
u3447:
decfsz	wreg,f
	bra	u3447
	decfsz	(??_main+0+0)^00h,c,f
	bra	u3447
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u3447
	nop
asmopt pop

	line	252
	
l3577:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_current_menu))&0ffh
	line	253
	
l3579:; BSR set to: 0

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	255
	
l3581:; BSR set to: 0

	call	_menu_draw_options	;wreg free
	line	256
	
l3583:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	259
	
l3585:
	movlw	high(0)
	movlb	0	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	260
	
l3587:; BSR set to: 0

	movlw	low(0)
	movwf	((main@last_button))&0ffh
	line	266
	
l3589:
	movlb	0	; () banked
	movf	((main@last_encoder))&0ffh,w
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u3310
movf	((main@last_encoder+1))&0ffh,w
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u3311
	goto	u3310

u3311:
	goto	l3609
u3310:
	line	268
	
l3591:; BSR set to: 0

	movf	((main@last_encoder))&0ffh,w
	subwf	((_encoder_count))&0ffh,w	;volatile
	movwf	((main@delta))&0ffh
	movf	((main@last_encoder+1))&0ffh,w
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movwf	1+((main@delta))&0ffh
	line	271
	
l3593:; BSR set to: 0

	movlw	high(01h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	274
	
l3595:
		movlw	low(main@buf)
	movwf	((c:sprintf@sp))^00h,c

		movlw	low(STR_11)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_11)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_encoder_count),0+((c:?_sprintf)+03h)	;volatile
	movff	(_encoder_count+1),1+((c:?_sprintf)+03h)	;volatile
	movff	(main@delta),0+((c:?_sprintf)+05h)
	movff	(main@delta+1),1+((c:?_sprintf)+05h)
	call	_sprintf	;wreg free
	line	275
	
l3597:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	277
	
l3599:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	279
	
l3601:
	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	line	282
	
l3603:
	movlb	0	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u3321
	goto	u3320
u3321:
	goto	l3607
u3320:
	line	284
	
l3605:; BSR set to: 0

	call	_menu_draw_options	;wreg free
	line	285
	goto	l3609
	line	288
	
l3607:; BSR set to: 0

	call	_menu_draw_input	;wreg free
	line	293
	
l3609:
	movlb	0	; () banked
	movf	((main@last_button))&0ffh,w
xorwf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u3331
	goto	u3330

u3331:
	goto	l3633
u3330:
	line	296
	
l3611:; BSR set to: 0

	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u3341
	goto	u3340
u3341:
	goto	l3629
u3340:
	line	298
	
l3613:; BSR set to: 0

	movff	(_button_event),(main@current_event)	;volatile
	line	299
	
l3615:; BSR set to: 0

	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	302
	
l3617:; BSR set to: 0

		movlw	low(main@buf_489)
	movwf	((c:sprintf@sp))^00h,c

		movlw	low(STR_12)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_12)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@current_event),0+((c:?_sprintf)+03h)
	clrf	(1+((c:?_sprintf)+03h))^00h,c
	call	_sprintf	;wreg free
	line	303
	
l3619:
		movlw	low(main@buf_489)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	305
	
l3621:
	movlb	0	; () banked
	movf	((main@current_event))&0ffh,w
	
	call	_menu_handle_button
	line	308
	
l3623:
	movlb	0	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u3351
	goto	u3350
u3351:
	goto	l3627
u3350:
	line	310
	
l3625:; BSR set to: 0

	call	_menu_draw_options	;wreg free
	line	311
	goto	l3629
	line	314
	
l3627:; BSR set to: 0

	call	_menu_draw_input	;wreg free
	line	317
	
l3629:
	movff	(_button_event),(main@last_button)	;volatile
	line	318
	
l3631:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	322
	
l3633:; BSR set to: 0

	movlw	low(01h)
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	323
	
l3635:; BSR set to: 0

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	bnz	u3360
	movlw	80
	subwf	 ((main@blink_timer))&0ffh,w
	movlw	195
	subwfb	((main@blink_timer+1))&0ffh,w
	btfss	status,0
	goto	u3361
	goto	u3360

u3361:
	goto	l158
u3360:
	line	325
	
l3637:; BSR set to: 0

	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	326
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u3371
	goto	u3370
u3371:
	goto	l3645
u3370:
	line	328
	
l3639:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u3381
	goto	u3380
u3381:
	movlw	1
	goto	u3390
u3380:
	movlw	0
u3390:
	movwf	(0+(_menu+05h))&0ffh
	line	331
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u3401
	goto	u3400
u3401:
	goto	l3643
u3400:
	line	333
	
l3641:; BSR set to: 0

	call	_menu_draw_options	;wreg free
	line	334
	goto	l158
	line	337
	
l3643:; BSR set to: 0

	call	_menu_draw_input	;wreg free
	goto	l158
	line	342
	
l3645:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	344
	
l158:
	line	347
	movlb	0	; () banked
	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u3411
	goto	u3410
u3411:
	goto	l3653
u3410:
	
l3647:; BSR set to: 0

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u3421
	goto	u3420
u3421:
	goto	l3653
u3420:
	line	349
	
l3649:; BSR set to: 0

	call	_save_current_config	;wreg free
	line	350
	
l3651:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_save_pending))&0ffh
	line	354
	
l3653:; BSR set to: 0

	asmopt push
asmopt off
	movlw	133
u3457:
decfsz	wreg,f
	bra	u3457
	nop
asmopt pop

	goto	l3589
	global	start
	goto	start
	callstack 0
	line	356
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
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
psect	text1,class=CODE,space=0,reloc=2,group=0
	line	33
global __ptext1
__ptext1:
psect	text1
	file	"src\main.c"
	line	33
	
_uart_init:
;incstack = 0
	callstack 29
	line	35
	
l2689:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	36
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	38
	
l2691:
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
	
l71:
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
psect	text2,class=CODE,space=0,reloc=2,group=0
	line	69
global __ptext2
__ptext2:
psect	text2
	file	"src\main.c"
	line	69
	
_system_init:
;incstack = 0
	callstack 29
	line	71
	
l2693:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	72
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	75
	
l89:
	line	74
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u1921
	goto	u1920
u1921:
	goto	l89
u1920:
	line	77
	
l2695:
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
	
l2697:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	84
	
l2699:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	86
	
l2701:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	87
	
l2703:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	88
	
l2705:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	89
	
l2707:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	90
	
l92:
	return	;funcret
	callstack 0
GLOBAL	__end_of_system_init
	__end_of_system_init:
	signat	_system_init,89
	global	_menu_init

;; *************** function _menu_init *****************
;; Defined at:
;;		line 108 in file "src\menu.c"
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
psect	text3,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	108
global __ptext3
__ptext3:
psect	text3
	file	"src\menu.c"
	line	108
	
_menu_init:
;incstack = 0
	callstack 29
	line	110
	
l2783:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_menu))&0ffh
	line	111
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	112
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	113
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	114
	movlw	low(0)
	movwf	(0+(_menu+05h))&0ffh
	line	115
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	116
	
l294:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_init
	__end_of_menu_init:
	signat	_menu_init,89
	global	_menu_handle_encoder

;; *************** function _menu_handle_encoder *****************
;; Defined at:
;;		line 242 in file "src\menu.c"
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
;;		On entry : 0/0
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
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	242
global __ptext4
__ptext4:
psect	text4
	file	"src\menu.c"
	line	242
	
_menu_handle_encoder:; BSR set to: 0

;incstack = 0
	callstack 28
	line	245
	
l2807:
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u2001
	goto	u2000
u2001:
	goto	l2841
u2000:
	line	247
	
l2809:; BSR set to: 0

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u2011
	goto	u2010

u2011:
	goto	l360
u2010:
	line	250
	
l2811:; BSR set to: 0

	movf	((_menu))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(c:menu_handle_encoder@opts)
	movff	1+?_get_item_options,(c:menu_handle_encoder@opts+1)
	line	251
	
l2813:
	movf	((c:menu_handle_encoder@opts))^00h,c,w
iorwf	((c:menu_handle_encoder@opts+1))^00h,c,w
	btfsc	status,2
	goto	u2021
	goto	u2020

u2021:
	goto	l360
u2020:
	line	254
	
l2815:
	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u2031
	goto	u2030
u2031:
	goto	l2819
u2030:
	
l2817:; BSR set to: 0

		movlw	low(_sensor_edit_flag)
	movwf	((c:menu_handle_encoder@edit_flag))^00h,c

	goto	l352
	
l2819:; BSR set to: 0

		movlw	low(_enable_edit_flag)
	movwf	((c:menu_handle_encoder@edit_flag))^00h,c

	
l352:; BSR set to: 0

	line	256
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u2041
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u2040
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u2041
	goto	u2040

u2041:
	goto	l2827
u2040:
	line	258
	
l2821:; BSR set to: 0

	movf	((c:menu_handle_encoder@edit_flag))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	incf	indf2

	line	259
	
l2823:; BSR set to: 0

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
	goto	u2051
	goto	u2050

u2051:
	goto	l2835
u2050:
	line	260
	
l2825:; BSR set to: 0

	movf	((c:menu_handle_encoder@edit_flag))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l2835
	line	262
	
l2827:; BSR set to: 0

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u2060
	goto	u2061

u2061:
	goto	l2835
u2060:
	line	264
	
l2829:; BSR set to: 0

	movf	((c:menu_handle_encoder@edit_flag))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u2071
	goto	u2070
u2071:
	goto	l2833
u2070:
	line	265
	
l2831:; BSR set to: 0

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

	goto	l2835
	line	267
	
l2833:; BSR set to: 0

	movf	((c:menu_handle_encoder@edit_flag))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	decf	indf2

	line	271
	
l2835:; BSR set to: 0

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
	goto	u2081
	goto	u2080

u2081:
	goto	l347
u2080:
	line	272
	
l2837:; BSR set to: 0

	movf	((c:menu_handle_encoder@edit_flag))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l360
	line	274
	
l347:; BSR set to: 0

	goto	l360
	line	279
	
l2841:; BSR set to: 0

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u2091
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u2090
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u2091
	goto	u2090

u2091:
	goto	l2851
u2090:
	line	282
	
l2843:; BSR set to: 0

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
	goto	u2101
	goto	u2100

u2101:
	goto	l360
u2100:
	line	284
	
l2845:; BSR set to: 0

	incf	((_menu))&0ffh
	line	287
	
l2847:; BSR set to: 0

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
	goto	u2111
	goto	u2110

u2111:
	goto	l360
u2110:
	line	289
	
l2849:; BSR set to: 0

	incf	(0+(_menu+01h))&0ffh
	goto	l360
	line	293
	
l2851:; BSR set to: 0

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u2120
	goto	u2121

u2121:
	goto	l360
u2120:
	line	296
	
l2853:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u2131
	goto	u2130
u2131:
	goto	l360
u2130:
	line	298
	
l2855:; BSR set to: 0

	decf	((_menu))&0ffh
	line	301
	
l2857:; BSR set to: 0

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u2141
	goto	u2140

u2141:
	goto	l360
u2140:
	line	303
	
l2859:; BSR set to: 0

	decf	(0+(_menu+01h))&0ffh
	line	307
	
l360:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_encoder
	__end_of_menu_handle_encoder:
	signat	_menu_handle_encoder,4217
	global	_menu_handle_button

;; *************** function _menu_handle_button *****************
;; Defined at:
;;		line 310 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  press_type      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  press_type      1   24[COMRAM] unsigned char 
;;  opts            2   22[COMRAM] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
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
;;      Locals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         9       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_beep
;;		_get_item_options
;;		_strcmp
;;		_strcpy
;;		_uart_println
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	310
global __ptext5
__ptext5:
psect	text5
	file	"src\menu.c"
	line	310
	
_menu_handle_button:
;incstack = 0
	callstack 26
	movwf	((c:menu_handle_button@press_type))^00h,c
	line	312
	
l3387:
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u3031
	goto	u3030
u3031:
	goto	l3445
u3030:
	line	314
	
l3389:; BSR set to: 0

		decf	((c:menu_handle_button@press_type))^00h,c,w
	btfss	status,2
	goto	u3041
	goto	u3040

u3041:
	goto	l3421
u3040:
	line	318
	
l3391:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	319
	
l3393:
	movlw	low(0)
	movlb	0	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	320
	
l3395:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	323
	
l3397:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u3051
	goto	u3050
u3051:
	goto	l3409
u3050:
	line	325
	
l3399:; BSR set to: 0

	lfsr	2,_input_config
	movff	(c:_enable_edit_flag),indf2

	line	326
	
l3401:; BSR set to: 0

	movf	((c:_enable_edit_flag))^00h,c,w
	btfss	status,2
	goto	u3061
	goto	u3060
u3061:
	goto	l3405
u3060:
	
l3403:; BSR set to: 0

		movlw	low(STR_57)
	movwf	((c:_menu_handle_button$868))^00h,c
	movlw	high(STR_57)
	movwf	((c:_menu_handle_button$868+1))^00h,c

	goto	l3407
	
l3405:; BSR set to: 0

		movlw	low(STR_56)
	movwf	((c:_menu_handle_button$868))^00h,c
	movlw	high(STR_56)
	movwf	((c:_menu_handle_button$868+1))^00h,c

	
l3407:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:strcpy@to))^00h,c

		movff	(c:_menu_handle_button$868),(c:strcpy@from)
	movff	(c:_menu_handle_button$868+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	327
	goto	l417
	line	328
	
l3409:; BSR set to: 0

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u3071
	goto	u3070

u3071:
	goto	l417
u3070:
	line	330
	
l3411:; BSR set to: 0

	lfsr	2,(_input_config)+01h
	movff	(c:_sensor_edit_flag),indf2

	line	331
	
l3413:; BSR set to: 0

	movlw	(01h)&0ffh
	
	call	_get_item_options
	movff	0+?_get_item_options,(c:menu_handle_button@opts)
	movff	1+?_get_item_options,(c:menu_handle_button@opts+1)
	line	332
	
l3415:
	movf	((c:menu_handle_button@opts))^00h,c,w
iorwf	((c:menu_handle_button@opts+1))^00h,c,w
	btfsc	status,2
	goto	u3081
	goto	u3080

u3081:
	goto	l377
u3080:
	
l3417:
	movlw	01h
	addwf	((c:menu_handle_button@opts))^00h,c,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	0
	addwfc	((c:menu_handle_button@opts+1))^00h,c,w
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
	tblrd	*
	
	movf	tablat,w
	cpfslt	((c:_sensor_edit_flag))^00h,c
	goto	u3091
	goto	u3090
u3091:
	goto	l377
u3090:
	line	334
	
l3419:
		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c

	movf	((c:_sensor_edit_flag))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(??_menu_handle_button+0+0)^00h,c,w
	addwf	((c:menu_handle_button@opts))^00h,c,w
	movwf	(??_menu_handle_button+2+0)^00h,c
	movf	(??_menu_handle_button+0+1)^00h,c,w
	addwfc	((c:menu_handle_button@opts+1))^00h,c,w
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
	
	movff	tablat,(c:strcpy@from)
	tblrd*-
	
	movff	tablat,(c:strcpy@from+1)

	call	_strcpy	;wreg free
	goto	l417
	line	340
	
l377:
	goto	l417
	line	341
	
l3421:; BSR set to: 0

		movlw	2
	xorwf	((c:menu_handle_button@press_type))^00h,c,w
	btfss	status,2
	goto	u3101
	goto	u3100

u3101:
	goto	l417
u3100:
	line	345
	
l3423:; BSR set to: 0

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	346
	
l3425:
	movlw	low(0)
	movlb	0	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	347
	
l3427:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	350
	
l3429:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u3111
	goto	u3110
u3111:
	goto	l3433
u3110:
	line	352
	
l3431:; BSR set to: 0

		movlw	69
	xorwf	((c:_original_value))^00h,c,w
	btfsc	status,2
	goto	u3121
	goto	u3120

u3121:
	movlw	1
	goto	u3130
u3120:
	movlw	0
u3130:
	movwf	((c:_enable_edit_flag))^00h,c
	line	353
	goto	l417
	line	354
	
l3433:; BSR set to: 0

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u3141
	goto	u3140

u3141:
	goto	l417
u3140:
	line	357
	
l3435:; BSR set to: 0

		movlw	low(_original_value)
	movwf	((c:strcmp@s1))^00h,c
	clrf	((c:strcmp@s1+1))^00h,c

		movlw	low(STR_58)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_58)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u3151
	goto	u3150

u3151:
	goto	l3439
u3150:
	line	358
	
l3437:
	movlw	low(0)
	movwf	((c:_sensor_edit_flag))^00h,c
	goto	l417
	line	359
	
l3439:
		movlw	low(_original_value)
	movwf	((c:strcmp@s1))^00h,c
	clrf	((c:strcmp@s1+1))^00h,c

		movlw	low(STR_59)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_59)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u3161
	goto	u3160

u3161:
	goto	l3443
u3160:
	line	360
	
l3441:
	movlw	low(01h)
	movwf	((c:_sensor_edit_flag))^00h,c
	goto	l417
	line	362
	
l3443:
	movlw	low(02h)
	movwf	((c:_sensor_edit_flag))^00h,c
	goto	l417
	line	368
	
l3445:; BSR set to: 0

		decf	((c:menu_handle_button@press_type))^00h,c,w
	btfss	status,2
	goto	u3171
	goto	u3170

u3171:
	goto	l3519
u3170:
	line	371
	
l3447:; BSR set to: 0

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u3181
	goto	u3180
u3181:
	goto	l3475
u3180:
	line	374
	
l3449:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	376
	goto	l3473
	line	379
	
l3451:; BSR set to: 0

		movlw	low(STR_60)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_60)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	382
	goto	l417
	line	385
	
l3453:; BSR set to: 0

		movlw	low(STR_61)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_61)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	386
	
l3455:
	movlw	low(01h)
	movlb	0	; () banked
	movwf	((_current_menu))&0ffh
	line	387
	
l3457:; BSR set to: 0

	movlw	low(0Ch)
	movwf	(0+(_menu+02h))&0ffh
	line	388
	
l3459:; BSR set to: 0

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	389
	
l3461:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	390
	goto	l417
	line	393
	
l3463:; BSR set to: 0

		movlw	low(STR_62)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_62)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	396
	goto	l417
	line	399
	
l3465:; BSR set to: 0

		movlw	low(STR_63)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_63)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	401
	goto	l417
	line	404
	
l3467:; BSR set to: 0

		movlw	low(STR_64)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_64)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	406
	goto	l417
	line	409
	
l3469:; BSR set to: 0

		movlw	low(STR_65)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_65)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	410
	goto	l417
	line	376
	
l3473:
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
	goto	l3451
	xorlw	1^0	; case 1
	skipnz
	goto	l3453
	xorlw	2^1	; case 2
	skipnz
	goto	l3463
	xorlw	3^2	; case 3
	skipnz
	goto	l3465
	xorlw	4^3	; case 4
	skipnz
	goto	l3467
	goto	l3469

	line	413
	
l3475:; BSR set to: 0

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u3191
	goto	u3190

u3191:
	goto	l417
u3190:
	line	416
	
l3477:; BSR set to: 0

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
	goto	u3201
	goto	u3200
u3201:
	goto	l3503
u3200:
	
l3479:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u3211
	goto	u3210
u3211:
	goto	l3483
u3210:
	
l3481:; BSR set to: 0

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u3221
	goto	u3220

u3221:
	goto	l3503
u3220:
	line	419
	
l3483:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	422
	
l3485:
		movlw	low(_original_value)
	movwf	((c:strcpy@to))^00h,c

	movlb	0	; () banked
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
	line	424
	
l3487:
	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u3231
	goto	u3230
u3231:
	goto	l3491
u3230:
	line	426
	
l3489:; BSR set to: 0

		movlw	69
	xorwf	((_value_enable))&0ffh,w
	btfsc	status,2
	goto	u3241
	goto	u3240

u3241:
	movlw	1
	goto	u3250
u3240:
	movlw	0
u3250:
	movwf	((c:_enable_edit_flag))^00h,c
	line	427
	goto	l406
	line	428
	
l3491:; BSR set to: 0

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u3261
	goto	u3260

u3261:
	goto	l406
u3260:
	line	431
	
l3493:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcmp@s1))^00h,c
	clrf	((c:strcmp@s1+1))^00h,c

		movlw	low(STR_66)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_66)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u3271
	goto	u3270

u3271:
	goto	l3497
u3270:
	line	432
	
l3495:
	movlw	low(0)
	movwf	((c:_sensor_edit_flag))^00h,c
	goto	l406
	line	433
	
l3497:
		movlw	low(_value_sensor)
	movwf	((c:strcmp@s1))^00h,c
	clrf	((c:strcmp@s1+1))^00h,c

		movlw	low(STR_67)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_67)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u3281
	goto	u3280

u3281:
	goto	l3501
u3280:
	line	434
	
l3499:
	movlw	low(01h)
	movwf	((c:_sensor_edit_flag))^00h,c
	goto	l406
	line	436
	
l3501:
	movlw	low(02h)
	movwf	((c:_sensor_edit_flag))^00h,c
	line	439
	
l406:
	movlw	low(01h)
	movlb	0	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	440
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	441
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	442
	goto	l417
	line	443
	
l3503:; BSR set to: 0

		movlw	11
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u3291
	goto	u3290

u3291:
	goto	l3517
u3290:
	line	446
	
l3505:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	447
	
l3507:
		movlw	low(STR_68)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_68)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	448
	
l3509:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_current_menu))&0ffh
	line	449
	
l3511:; BSR set to: 0

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	450
	
l3513:; BSR set to: 0

	movlw	low(01h)
	movwf	((_menu))&0ffh
	goto	l3461
	line	455
	
l3517:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l417
	line	459
	
l3519:; BSR set to: 0

		movlw	3
	xorwf	((c:menu_handle_button@press_type))^00h,c,w
	btfss	status,2
	goto	u3301
	goto	u3300

u3301:
	goto	l417
u3300:
	line	462
	
l3521:; BSR set to: 0

	movlw	high(0C8h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(0C8h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	463
	
l3523:
		movlw	low(STR_69)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_69)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	464
	
l3525:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_current_menu))&0ffh
	line	465
	
l3527:; BSR set to: 0

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l3459
	line	470
	
l417:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_button
	__end_of_menu_handle_button:
	signat	_menu_handle_button,4217
	global	_uart_println

;; *************** function _uart_println *****************
;; Defined at:
;;		line 61 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   12[COMRAM] PTR const unsigned char 
;;		 -> STR_69(44), STR_68(26), STR_65(26), STR_64(41), 
;;		 -> STR_63(33), STR_62(26), STR_61(24), STR_60(23), 
;;		 -> main@buf_489(30), main@buf(40), STR_10(19), STR_9(22), 
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
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	61
global __ptext6
__ptext6:
psect	text6
	file	"src\main.c"
	line	61
	
_uart_println:
;incstack = 0
	callstack 27
	line	63
	
l2495:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	64
	
l2497:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	65
	
l2499:
	movlw	(0Ah)&0ffh
	
	call	_uart_write
	line	66
	
l86:
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
;;		 -> STR_69(44), STR_68(26), STR_65(26), STR_64(41), 
;;		 -> STR_63(33), STR_62(26), STR_61(24), STR_60(23), 
;;		 -> main@buf_489(30), main@buf(40), STR_10(19), STR_9(22), 
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
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	53
global __ptext7
__ptext7:
psect	text7
	file	"src\main.c"
	line	53
	
_uart_print:
;incstack = 0
	callstack 27
	line	55
	
l2353:
	goto	l2359
	line	57
	
l2355:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1517
	tblrd	*
	
	movf	tablat,w
	bra	u1510
u1517:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u1510:
	
	call	_uart_write
	
l2357:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	55
	
l2359:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1527
	tblrd	*
	
	movf	tablat,w
	bra	u1520
u1527:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u1520:
	iorlw	0
	btfss	status,2
	goto	u1531
	goto	u1530
u1531:
	goto	l2355
u1530:
	line	59
	
l83:
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
psect	text8,class=CODE,space=0,reloc=2,group=0
	line	46
global __ptext8
__ptext8:
psect	text8
	file	"src\main.c"
	line	46
	
_uart_write:
;incstack = 0
	callstack 28
	movwf	((c:uart_write@c))^00h,c
	line	48
	
l2325:
	line	49
	
l74:
	line	48
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u1471
	goto	u1470
u1471:
	goto	l74
u1470:
	line	50
	
l2327:
	movff	(c:uart_write@c),(c:4013)	;volatile
	line	51
	
l77:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_write
	__end_of_uart_write:
	signat	_uart_write,4217
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
psect	text9,class=CODE,space=0,reloc=2,group=0
	line	207
global __ptext9
__ptext9:
psect	text9
	file	"src\main.c"
	line	207
	
_beep:
;incstack = 0
	callstack 28
	line	209
	
l2501:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	210
	
l2503:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l138
	line	212
	
l2505:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u3467:
decfsz	wreg,f
	bra	u3467
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u3467
	nop2
asmopt pop

	line	210
	
l2507:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l138:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u1681
	goto	u1680

u1681:
	goto	l2505
u1680:
	
l140:
	line	214
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	215
	
l141:
	return	;funcret
	callstack 0
GLOBAL	__end_of_beep
	__end_of_beep:
	signat	_beep,4217
	global	_menu_draw_options

;; *************** function _menu_draw_options *****************
;; Defined at:
;;		line 119 in file "src\menu.c"
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
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	119
global __ptext10
__ptext10:
psect	text10
	file	"src\menu.c"
	line	119
	
_menu_draw_options:
;incstack = 0
	callstack 25
	line	122
	
l2785:; BSR set to: 0

	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	123
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_41)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_41)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	126
	
l2787:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	goto	l2803
	line	128
	
l2789:; BSR set to: 0

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	131
	
l2791:
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
	bnz	u1971
movf	(??_menu_draw_options+0+1)^00h,c,w
xorwf	(??_menu_draw_options+2+1)^00h,c,w
	btfss	status,2
	goto	u1971
	goto	u1970

u1971:
	goto	l2799
u1970:
	line	133
	
l2793:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_42)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_42)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_print_at
	line	134
	
l2795:
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
	line	135
	
l2797:
		movlw	low(STR_43)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_43)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	136
	goto	l2801
	line	139
	
l2799:; BSR set to: 0

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
	line	126
	
l2801:
	incf	((c:menu_draw_options@i))^00h,c
	
l2803:
		movlw	03h-0
	cpfslt	((c:menu_draw_options@i))^00h,c
	goto	u1981
	goto	u1980

u1981:
	goto	l304
u1980:
	
l2805:
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
	goto	u1991
	goto	u1990

u1991:
	goto	l2789
u1990:
	line	142
	
l304:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_options
	__end_of_menu_draw_options:
	signat	_menu_draw_options,89
	global	_menu_draw_input

;; *************** function _menu_draw_input *****************
;; Defined at:
;;		line 145 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1   72[COMRAM] unsigned char 
;;  j               1   73[COMRAM] unsigned char 
;;  val_len         1   66[COMRAM] unsigned char 
;;  blank          10   41[COMRAM] unsigned char [10]
;;  val_len         1   67[COMRAM] unsigned char 
;;  flag_value      1   75[COMRAM] unsigned char 
;;  flag_value      1   74[COMRAM] unsigned char 
;;  opts            2   79[COMRAM] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  opts            2   77[COMRAM] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  value_buf      15   51[COMRAM] unsigned char [15]
;;  item_idx        1   82[COMRAM] unsigned char 
;;  val_len         1   76[COMRAM] unsigned char 
;;  i               1   81[COMRAM] unsigned char 
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
;;      Locals:        42       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        46       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       46 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_get_item_options
;;		_lcd_clear_line
;;		_lcd_print_at
;;		_sprintf
;;		_strcat
;;		_strcmp
;;		_strcpy
;;		_strlen
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2,group=0
	line	145
global __ptext11
__ptext11:
psect	text11
	file	"src\menu.c"
	line	145
	
_menu_draw_input:
;incstack = 0
	callstack 25
	line	148
	
l3295:; BSR set to: 0

	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	149
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_44)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_44)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	152
	
l3297:
	movlw	low(0)
	movwf	((c:menu_draw_input@i))^00h,c
	goto	l3383
	line	154
	
l3299:
	movlb	0	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_input@i))^00h,c,w
	movwf	((c:menu_draw_input@item_idx))^00h,c
	line	155
	
l3301:; BSR set to: 0

	incf	((c:menu_draw_input@i))^00h,c,w
	
	call	_lcd_clear_line
	line	158
	
l3303:
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
	line	163
	
l3305:
	movf	((c:menu_draw_input@item_idx))^00h,c,w
	movlb	0	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u2871
	goto	u2870

u2871:
	goto	l3371
u2870:
	line	165
	
l3307:; BSR set to: 0

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u2881
	goto	u2880
u2881:
	goto	l3369
u2880:
	line	168
	
l3309:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u2891
	goto	u2890
u2891:
	goto	l3327
u2890:
	line	171
	
l3311:; BSR set to: 0

	movf	((c:menu_draw_input@item_idx))^00h,c,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(c:menu_draw_input@opts)
	movff	1+?_get_item_options,(c:menu_draw_input@opts+1)
	line	172
	
l3313:
	movf	((c:menu_draw_input@opts))^00h,c,w
iorwf	((c:menu_draw_input@opts+1))^00h,c,w
	btfsc	status,2
	goto	u2901
	goto	u2900

u2901:
	goto	l3325
u2900:
	line	174
	
l3315:
	movf	((c:menu_draw_input@item_idx))^00h,c,w
	btfsc	status,2
	goto	u2911
	goto	u2910
u2911:
	goto	l314
u2910:
	
l3317:
	movff	(c:_sensor_edit_flag),(c:_menu_draw_input$806)
	clrf	((c:_menu_draw_input$806+1))^00h,c
	goto	l316
	
l314:
	movff	(c:_enable_edit_flag),(c:_menu_draw_input$806)
	clrf	((c:_menu_draw_input$806+1))^00h,c
	
l316:
	movff	(c:_menu_draw_input$806),(c:menu_draw_input@flag_value)
	line	175
	
l3319:
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
	goto	u2921
	goto	u2920
u2921:
	goto	l3323
u2920:
	line	177
	
l3321:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:sprintf@sp))^00h,c

		movlw	low(STR_45)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_45)
	movwf	((c:sprintf@f+1))^00h,c

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
	
	movff	tablat,0+((c:?_sprintf)+03h)
	tblrd*-
	
	movff	tablat,1+((c:?_sprintf)+03h)

	call	_sprintf	;wreg free
	line	178
	goto	l3373
	line	181
	
l3323:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:sprintf@sp))^00h,c

		movlw	low(STR_46)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_46)
	movwf	((c:sprintf@f+1))^00h,c

	call	_sprintf	;wreg free
	goto	l3373
	line	186
	
l3325:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:sprintf@sp))^00h,c

		movlw	low(STR_47)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_47)
	movwf	((c:sprintf@f+1))^00h,c

	movf	((c:menu_draw_input@item_idx))^00h,c,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+03h)
	movff	postdec2,1+((c:?_sprintf)+03h)
	call	_sprintf	;wreg free
	goto	l3373
	line	192
	
l3327:; BSR set to: 0

	movf	((c:menu_draw_input@item_idx))^00h,c,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(c:menu_draw_input@opts_810)
	movff	1+?_get_item_options,(c:menu_draw_input@opts_810+1)
	line	193
	
l3329:
	movf	((c:menu_draw_input@opts_810))^00h,c,w
iorwf	((c:menu_draw_input@opts_810+1))^00h,c,w
	btfsc	status,2
	goto	u2931
	goto	u2930

u2931:
	goto	l3353
u2930:
	line	195
	
l3331:
	movf	((c:menu_draw_input@item_idx))^00h,c,w
	btfsc	status,2
	goto	u2941
	goto	u2940
u2941:
	goto	l323
u2940:
	
l3333:
	movff	(c:_sensor_edit_flag),(c:_menu_draw_input$815)
	clrf	((c:_menu_draw_input$815+1))^00h,c
	goto	l325
	
l323:
	movff	(c:_enable_edit_flag),(c:_menu_draw_input$815)
	clrf	((c:_menu_draw_input$815+1))^00h,c
	
l325:
	movff	(c:_menu_draw_input$815),(c:menu_draw_input@flag_value_814)
	line	196
	
l3335:
	movlw	01h
	addwf	((c:menu_draw_input@opts_810))^00h,c,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	0
	addwfc	((c:menu_draw_input@opts_810+1))^00h,c,w
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
	cpfslt	((c:menu_draw_input@flag_value_814))^00h,c
	goto	u2951
	goto	u2950
u2951:
	goto	l3351
u2950:
	line	198
	
l3337:
	movf	((c:menu_draw_input@flag_value_814))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_input+0+0
	movff	prodh,??_menu_draw_input+0+0+1
	movf	(??_menu_draw_input+0+0)^00h,c,w
	addwf	((c:menu_draw_input@opts_810))^00h,c,w
	movwf	(??_menu_draw_input+2+0)^00h,c
	movf	(??_menu_draw_input+0+1)^00h,c,w
	addwfc	((c:menu_draw_input@opts_810+1))^00h,c,w
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
	line	199
	
l3339:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:sprintf@sp))^00h,c

		movlw	low(STR_48)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_48)
	movwf	((c:sprintf@f+1))^00h,c

	call	_sprintf	;wreg free
	line	200
	
l3341:
	movlw	low(0)
	movwf	((c:menu_draw_input@j))^00h,c
	goto	l3347
	line	201
	
l3343:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcat@to))^00h,c

		movlw	low(STR_49)
	movwf	((c:strcat@from))^00h,c
	movlw	high(STR_49)
	movwf	((c:strcat@from+1))^00h,c

	call	_strcat	;wreg free
	line	200
	
l3345:
	incf	((c:menu_draw_input@j))^00h,c
	
l3347:
		movf	((c:menu_draw_input@val_len))^00h,c,w
	subwf	((c:menu_draw_input@j))^00h,c,w
	btfss	status,0
	goto	u2961
	goto	u2960

u2961:
	goto	l3343
u2960:
	line	202
	
l3349:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcat@to))^00h,c

		movlw	low(STR_50)
	movwf	((c:strcat@from))^00h,c
	movlw	high(STR_50)
	movwf	((c:strcat@from+1))^00h,c

	call	_strcat	;wreg free
	line	203
	goto	l3373
	line	206
	
l3351:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:sprintf@sp))^00h,c

		movlw	low(STR_51)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_51)
	movwf	((c:sprintf@f+1))^00h,c

	call	_sprintf	;wreg free
	goto	l3373
	line	211
	
l3353:
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
	movwf	((c:menu_draw_input@val_len_822))^00h,c
	line	212
	
l3355:
	lfsr	2,(menu_draw_input@F2375)
	lfsr	1,(menu_draw_input@blank)
	movlw	10-1
u2971:
	movff	plusw2,plusw1
	decf	wreg
	bc	u2971

	line	213
	
l3357:
	movlw	low(0)
	movwf	((c:menu_draw_input@j_825))^00h,c
	goto	l3363
	line	214
	
l3359:
		movlw	low(menu_draw_input@blank)
	movwf	((c:strcat@to))^00h,c

		movlw	low(STR_52)
	movwf	((c:strcat@from))^00h,c
	movlw	high(STR_52)
	movwf	((c:strcat@from+1))^00h,c

	call	_strcat	;wreg free
	line	213
	
l3361:
	incf	((c:menu_draw_input@j_825))^00h,c
	
l3363:
		movf	((c:menu_draw_input@val_len_822))^00h,c,w
	subwf	((c:menu_draw_input@j_825))^00h,c,w
	btfss	status,0
	goto	u2981
	goto	u2980

u2981:
	goto	l3359
u2980:
	line	215
	
l3365:
		movlw	low(menu_draw_input@blank)
	movwf	((c:strcat@to))^00h,c

		movlw	low(STR_53)
	movwf	((c:strcat@from))^00h,c
	movlw	high(STR_53)
	movwf	((c:strcat@from+1))^00h,c

	call	_strcat	;wreg free
	line	216
	
l3367:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c

		movlw	low(menu_draw_input@blank)
	movwf	((c:strcpy@from))^00h,c
	clrf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l3373
	line	223
	
l3369:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:sprintf@sp))^00h,c

		movlw	low(STR_54)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_54)
	movwf	((c:sprintf@f+1))^00h,c

	movf	((c:menu_draw_input@item_idx))^00h,c,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+03h)
	movff	postdec2,1+((c:?_sprintf)+03h)
	call	_sprintf	;wreg free
	goto	l3373
	line	229
	
l3371:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c

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
	line	233
	
l3373:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_input@val_len_829))^00h,c
	line	234
	
l3375:
	movf	((c:menu_draw_input@val_len_829))^00h,c,w
	btfsc	status,2
	goto	u2991
	goto	u2990
u2991:
	goto	l3381
u2990:
	
l3377:
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
		movlw	low(STR_55)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_55)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u3001
	goto	u3000

u3001:
	goto	l3381
u3000:
	line	236
	
l3379:
	movf	((c:menu_draw_input@val_len_829))^00h,c,w
	sublw	low(014h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_input@i))^00h,c,w
	
	call	_lcd_print_at
	line	152
	
l3381:
	incf	((c:menu_draw_input@i))^00h,c
	
l3383:
		movlw	03h-0
	cpfslt	((c:menu_draw_input@i))^00h,c
	goto	u3011
	goto	u3010

u3011:
	goto	l343
u3010:
	
l3385:
	movf	((c:menu_draw_input@i))^00h,c,w
	movff	0+(_menu+01h),??_menu_draw_input+0+0
	clrf	(??_menu_draw_input+0+0+1)^00h,c
	addwf	(??_menu_draw_input+0+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_input+0+1)^00h,c
	btfsc	(??_menu_draw_input+0+1)^00h,c,7
	goto	u3021
	movf	(??_menu_draw_input+0+1)^00h,c,w
	bnz	u3020
	movlw	12
	subwf	 (??_menu_draw_input+0+0)^00h,c,w
	btfss	status,0
	goto	u3021
	goto	u3020

u3021:
	goto	l3299
u3020:
	line	239
	
l343:
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
;;		 -> menu_draw_input@value_buf(15), value_back(1), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_highbp(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), STR_22(1), STR_21(1), STR_20(5), 
;;		 -> STR_19(5), STR_18(9), STR_17(1), STR_16(1), 
;;		 -> STR_15(1), STR_14(8), STR_13(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   11[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_input@value_buf(15), value_back(1), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_highbp(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), STR_22(1), STR_21(1), STR_20(5), 
;;		 -> STR_19(5), STR_18(9), STR_17(1), STR_16(1), 
;;		 -> STR_15(1), STR_14(8), STR_13(9), 
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
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
global __ptext12
__ptext12:
psect	text12
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
	
_strlen:
;incstack = 0
	callstack 28
	line	8
	
l2631:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l2635
	line	10
	
l2633:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l2635:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1837
	tblrd	*
	
	movf	tablat,w
	bra	u1830
u1837:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u1830:
	iorlw	0
	btfss	status,2
	goto	u1841
	goto	u1840
u1841:
	goto	l2633
u1840:
	line	12
	
l2637:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l1233:
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
;;  to              1    9[COMRAM] PTR unsigned char 
;;		 -> original_value(10), menu_draw_input@value_buf(15), value_sensor(12), value_enable(10), 
;;  from            2   10[COMRAM] PTR const unsigned char 
;;		 -> STR_57(9), STR_56(8), menu_draw_input@blank(10), value_back(1), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_highbp(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), STR_22(1), 
;;		 -> STR_21(1), STR_20(5), STR_19(5), STR_18(9), 
;;		 -> STR_17(1), STR_16(1), STR_15(1), STR_14(8), 
;;		 -> STR_13(9), 
;; Auto vars:     Size  Location     Type
;;  cp              1   12[COMRAM] PTR unsigned char 
;;		 -> original_value(10), menu_draw_input@value_buf(15), value_sensor(12), value_enable(10), 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
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
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_draw_input
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
global __ptext13
__ptext13:
psect	text13
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
	
_strcpy:
;incstack = 0
	callstack 28
	line	18
	
l2651:
		movff	(c:strcpy@to),(c:strcpy@cp)

	line	19
	goto	l2655
	line	20
	
l2653:
	incf	((c:strcpy@cp))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l2655:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movf	((c:strcpy@cp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1877
	tblrd	*
	
	movf	tablat,w
	bra	u1870
u1877:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u1870:
	movwf	indf2
	movf	indf2,w
	btfss	status,2
	goto	u1881
	goto	u1880
u1881:
	goto	l2653
u1880:
	line	24
	
l1227:
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
;;		 -> original_value(10), value_back(1), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_highbp(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), 
;;  s2              2   11[COMRAM] PTR const unsigned char 
;;		 -> STR_67(5), STR_66(9), STR_59(5), STR_58(9), 
;;		 -> STR_55(1), 
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
psect	text14,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
global __ptext14
__ptext14:
psect	text14
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
	
_strcmp:
;incstack = 0
	callstack 28
	line	37
	
l3283:
	goto	l3287
	line	38
	
l3285:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l3287:
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
	goto	u2851
	goto	u2850
u2851:
	goto	l3291
u2850:
	
l3289:
	movff	(c:strcmp@s1),fsr2l
	movff	(c:strcmp@s1+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u2861
	goto	u2860
u2861:
	goto	l3285
u2860:
	line	41
	
l3291:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l1221:
	return	;funcret
	callstack 0
GLOBAL	__end_of_strcmp
	__end_of_strcmp:
	signat	_strcmp,8314
	global	_strcat

;; *************** function _strcat *****************
;; Defined at:
;;		line 8 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcat.c"
;; Parameters:    Size  Location     Type
;;  to              1    9[COMRAM] PTR unsigned char 
;;		 -> menu_draw_input@blank(10), menu_draw_input@value_buf(15), 
;;  from            2   10[COMRAM] PTR const unsigned char 
;;		 -> STR_53(2), STR_52(2), STR_50(2), STR_49(2), 
;; Auto vars:     Size  Location     Type
;;  cp              1   12[COMRAM] PTR unsigned char 
;;		 -> menu_draw_input@blank(10), menu_draw_input@value_buf(15), 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR unsigned char 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
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
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_draw_input
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcat.c"
	line	8
global __ptext15
__ptext15:
psect	text15
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcat.c"
	line	8
	
_strcat:
;incstack = 0
	callstack 28
	line	18
	
l2641:
		movff	(c:strcat@to),(c:strcat@cp)

	line	19
	goto	l2645
	line	20
	
l2643:
	incf	((c:strcat@cp))^00h,c
	line	19
	
l2645:
	movf	((c:strcat@cp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u1851
	goto	u1850
u1851:
	goto	l2643
u1850:
	goto	l2649
	line	22
	
l2647:
	incf	((c:strcat@cp))^00h,c
	line	23
	infsnz	((c:strcat@from))^00h,c
	incf	((c:strcat@from+1))^00h,c
	line	21
	
l2649:
	movff	(c:strcat@from),tblptrl
	movff	(c:strcat@from+1),tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	movf	((c:strcat@cp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	tblrd	*
	
	movff	tablat,indf2
	movf	indf2,w
	btfss	status,2
	goto	u1861
	goto	u1860
u1861:
	goto	l2647
u1860:
	line	26
	
l1213:
	return	;funcret
	callstack 0
GLOBAL	__end_of_strcat
	__end_of_strcat:
	signat	_strcat,8314
	global	_sprintf

;; *************** function _sprintf *****************
;; Defined at:
;;		line 505 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1   21[COMRAM] PTR unsigned char 
;;		 -> menu_draw_input@value_buf(15), main@buf_489(30), main@buf(40), 
;;  f               2   22[COMRAM] PTR const unsigned char 
;;		 -> STR_54(5), STR_51(8), STR_48(2), STR_47(5), 
;;		 -> STR_46(8), STR_45(5), STR_12(17), STR_11(23), 
;; Auto vars:     Size  Location     Type
;;  tmpval          4    0        struct .
;;  val             2   34[COMRAM] unsigned int 
;;  cp              2   32[COMRAM] PTR const unsigned char 
;;		 -> STR_70(7), ?_sprintf(2), value_back(1), value_display(10), 
;;		 -> value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_highbp(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), STR_22(1), STR_21(1), 
;;		 -> STR_20(5), STR_19(5), STR_18(9), STR_17(1), 
;;		 -> STR_16(1), STR_15(1), STR_14(8), STR_13(9), 
;;  len             2    0        unsigned int 
;;  c               1   36[COMRAM] unsigned char 
;;  ap              1   31[COMRAM] PTR void [1]
;;		 -> ?_sprintf(2), 
;;  prec            1   30[COMRAM] char 
;;  flag            1   29[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   21[COMRAM] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         7       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         8       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        16       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_main
;;		_menu_draw_input
;; This function uses a non-reentrant model
;;
psect	text16,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
global __ptext16
__ptext16:
psect	text16
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
	
_sprintf:
;incstack = 0
	callstack 28
	line	550
	
l2509:
		movlw	low(?_sprintf+03h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l2579
	line	555
	
l2511:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u1691
	goto	u1690

u1691:
	goto	l2517
u1690:
	line	558
	
l2513:
	movf	((c:sprintf@sp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	(c:sprintf@c),indf2

	
l2515:
	incf	((c:sprintf@sp))^00h,c
	line	559
	goto	l2579
	line	565
	
l2517:
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	line	661
	goto	l2537
	line	760
	
l2519:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l2521:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l2523:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u1701
	goto	u1700

u1701:
	goto	l2533
u1700:
	line	767
	
l2525:
		movlw	low(STR_70)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_70)
	movwf	((c:sprintf@cp+1))^00h,c

	goto	l2533
	line	804
	
l2527:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movf	((c:sprintf@sp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1717
	tblrd	*
	
	movf	tablat,w
	bra	u1710
u1717:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u1710:
	movwf	indf2
	
l2529:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l2531:
	incf	((c:sprintf@sp))^00h,c
	line	803
	
l2533:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1727
	tblrd	*
	
	movf	tablat,w
	bra	u1720
u1727:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u1720:
	iorlw	0
	btfss	status,2
	goto	u1731
	goto	u1730
u1731:
	goto	l2527
u1730:
	goto	l2579
	line	661
	
l2537:
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
	goto	l2581
	xorlw	100^0	; case 100
	skipnz
	goto	l2539
	xorlw	105^100	; case 105
	skipnz
	goto	l2539
	xorlw	115^105	; case 115
	skipnz
	goto	l2519
	goto	l2579

	line	1285
	
l2539:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l2541:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l2543:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u1740
	goto	u1741

u1741:
	goto	l2549
u1740:
	line	1288
	
l2545:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l2547:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	line	1331
	
l2549:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	line	1332
	
l2555:
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
	goto	u1751
	goto	u1750

u1751:
	goto	l2559
u1750:
	goto	l2563
	line	1331
	
l2559:
	incf	((c:sprintf@c))^00h,c
	
l2561:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u1761
	goto	u1760

u1761:
	goto	l2555
u1760:
	line	1464
	
l2563:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u1771
	goto	u1770
u1771:
	goto	l2569
u1770:
	line	1465
	
l2565:
	movf	((c:sprintf@sp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(02Dh)
	movwf	indf2
	
l2567:
	incf	((c:sprintf@sp))^00h,c
	line	1498
	
l2569:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l2577
	line	1515
	
l2571:
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
	
l2573:
	movf	((c:sprintf@sp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	(c:sprintf@c),indf2

	
l2575:
	incf	((c:sprintf@sp))^00h,c
	line	1500
	
l2577:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u1781
	goto	u1780

u1781:
	goto	l2571
u1780:
	line	553
	
l2579:
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
	goto	u1791
	goto	u1790
u1791:
	goto	l2511
u1790:
	line	1564
	
l2581:
	movf	((c:sprintf@sp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1567
	
l536:
	return	;funcret
	callstack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
	signat	_sprintf,4698
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
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text17,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext17
__ptext17:
psect	text17
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
___lwmod:
;incstack = 0
	callstack 28
	line	12
	
l2479:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u1651
	goto	u1650

u1651:
	goto	l1028
u1650:
	line	13
	
l2481:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l2485
	line	15
	
l2483:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l2485:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u1661
	goto	u1660
u1661:
	goto	l2483
u1660:
	line	19
	
l2487:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u1671
	goto	u1670

u1671:
	goto	l2491
u1670:
	line	20
	
l2489:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l2491:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l2493:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l2487
	line	23
	
l1028:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l1035:
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
;;  quotient        2   13[COMRAM] unsigned int 
;;  counter         1   15[COMRAM] unsigned char 
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
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text18,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
global __ptext18
__ptext18:
psect	text18
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
	
___lwdiv:
;incstack = 0
	callstack 28
	line	13
	
l2457:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l2459:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u1621
	goto	u1620

u1621:
	goto	l1018
u1620:
	line	15
	
l2461:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l2465
	line	17
	
l2463:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l2465:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u1631
	goto	u1630
u1631:
	goto	l2463
u1630:
	line	21
	
l2467:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l2469:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u1641
	goto	u1640

u1641:
	goto	l2475
u1640:
	line	23
	
l2471:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l2473:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l2475:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l2477:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l2467
	line	28
	
l1018:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l1025:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_lcd_print_at

;; *************** function _lcd_print_at *****************
;; Defined at:
;;		line 81 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   15[COMRAM] unsigned char 
;;  str             2   16[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_input@value_buf(15), STR_44(8), STR_42(2), STR_41(8), 
;;		 -> STR_39(5), STR_38(8), STR_37(8), STR_36(8), 
;;		 -> STR_35(9), STR_34(6), STR_33(6), STR_32(8), 
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
;; This function uses a non-reentrant model
;;
psect	text19,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	81
global __ptext19
__ptext19:
psect	text19
	file	"src\menu.c"
	line	81
	
_lcd_print_at:
;incstack = 0
	callstack 25
	movwf	((c:lcd_print_at@row))^00h,c
	line	83
	
l2603:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	84
	
l2605:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	85
	
l282:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print_at
	__end_of_lcd_print_at:
	signat	_lcd_print_at,12409
	global	_lcd_clear_line

;; *************** function _lcd_clear_line *****************
;; Defined at:
;;		line 88 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  row             1   15[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 3F/0
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
;; This function uses a non-reentrant model
;;
psect	text20,class=CODE,space=0,reloc=2,group=0
	line	88
global __ptext20
__ptext20:
psect	text20
	file	"src\menu.c"
	line	88
	
_lcd_clear_line:
;incstack = 0
	callstack 25
	movwf	((c:lcd_clear_line@row))^00h,c
	line	90
	
l2607:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	91
	
l2609:
		movlw	low(STR_40)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_40)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	92
	
l285:
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
;; This function uses a non-reentrant model
;;
psect	text21,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	156
global __ptext21
__ptext21:
psect	text21
	file	"src\main.c"
	line	156
	
_lcd_set_cursor:
;incstack = 0
	callstack 25
	movwf	((c:lcd_set_cursor@row))^00h,c
	line	159
	
l2369:
	goto	l2383
	line	162
	
l2371:
	movlw	low(080h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	163
	goto	l2385
	line	165
	
l2373:
	movlw	low(0C0h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	166
	goto	l2385
	line	168
	
l2375:
	movlw	low(094h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	169
	goto	l2385
	line	171
	
l2377:
	movlw	low(0D4h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	172
	goto	l2385
	line	159
	
l2383:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l2371
	xorlw	1^0	; case 1
	skipnz
	goto	l2373
	xorlw	2^1	; case 2
	skipnz
	goto	l2375
	xorlw	3^2	; case 3
	skipnz
	goto	l2377
	goto	l2371

	line	177
	
l2385:
	movf	((c:lcd_set_cursor@address))^00h,c,w
	addwf	((c:lcd_set_cursor@col))^00h,c,w
	
	call	_lcd_cmd
	line	178
	
l132:
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
;;		 -> menu_draw_input@value_buf(15), STR_44(8), STR_43(2), STR_42(2), 
;;		 -> STR_41(8), STR_40(21), STR_39(5), STR_38(8), 
;;		 -> STR_37(8), STR_36(8), STR_35(9), STR_34(6), 
;;		 -> STR_33(6), STR_32(8), STR_31(11), STR_30(10), 
;;		 -> STR_29(7), STR_28(7), STR_27(5), STR_26(6), 
;;		 -> STR_25(13), STR_24(11), STR_23(10), STR_4(16), 
;;		 -> STR_3(13), 
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
;; This function uses a non-reentrant model
;;
psect	text22,class=CODE,space=0,reloc=2,group=0
	line	142
global __ptext22
__ptext22:
psect	text22
	file	"src\main.c"
	line	142
	
_lcd_print:
;incstack = 0
	callstack 25
	line	144
	
l2361:
	goto	l2367
	line	146
	
l2363:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1547
	tblrd	*
	
	movf	tablat,w
	bra	u1540
u1547:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u1540:
	
	call	_lcd_data
	
l2365:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	144
	
l2367:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1557
	tblrd	*
	
	movf	tablat,w
	bra	u1550
u1557:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u1550:
	iorlw	0
	btfss	status,2
	goto	u1561
	goto	u1560
u1561:
	goto	l2363
u1560:
	line	148
	
l119:
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
psect	text23,class=CODE,space=0,reloc=2,group=0
	line	134
global __ptext23
__ptext23:
psect	text23
	file	"src\main.c"
	line	134
	
_lcd_data:
;incstack = 0
	callstack 25
	movwf	((c:lcd_data@data))^00h,c
	line	136
	
l2341:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	137
	
l2343:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	138
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	139
	
l2345:
	asmopt push
asmopt off
	movlw	133
u3477:
decfsz	wreg,f
	bra	u3477
	nop
asmopt pop

	line	140
	
l113:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
	signat	_lcd_data,4217
	global	_get_item_options

;; *************** function _get_item_options *****************
;; Defined at:
;;		line 95 in file "src\menu.c"
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
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text24,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	95
global __ptext24
__ptext24:
psect	text24
	file	"src\menu.c"
	line	95
	
_get_item_options:
;incstack = 0
	callstack 28
	movwf	((c:get_item_options@item_index))^00h,c
	line	97
	
l2611:
	movlw	low(0)
	movwf	((c:get_item_options@i))^00h,c
	line	99
	
l2617:
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
	goto	u1811
	goto	u1810
u1811:
	goto	l2623
u1810:
	line	101
	
l2619:
	movf	((c:get_item_options@i))^00h,c,w
	mullw	0Ch
	movlw	low(_menu_item_options)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:?_get_item_options))^00h,c
	movlw	high(_menu_item_options)
	addwfc	prod+1,w
	movwf	1+((c:?_get_item_options))^00h,c
	goto	l291
	line	97
	
l2623:
	incf	((c:get_item_options@i))^00h,c
	
l2625:
		movlw	02h-1
	cpfsgt	((c:get_item_options@i))^00h,c
	goto	u1821
	goto	u1820

u1821:
	goto	l2617
u1820:
	line	104
	
l2627:
		movlw	low(0)
	movwf	((c:?_get_item_options))^00h,c
	movlw	high(0)
	movwf	((c:?_get_item_options+1))^00h,c

	line	105
	
l291:
	return	;funcret
	callstack 0
GLOBAL	__end_of_get_item_options
	__end_of_get_item_options:
	signat	_get_item_options,4218
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
psect	text25,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	180
global __ptext25
__ptext25:
psect	text25
	file	"src\main.c"
	line	180
	
_lcd_init:
;incstack = 0
	callstack 27
	line	182
	
l2713:; BSR set to: 0

	movlw	(030h)&0ffh
	andwf	((c:3986))^0f00h,c	;volatile
	line	183
	
l2715:; BSR set to: 0

	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	185
	
l2717:; BSR set to: 0

	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u3487:
decfsz	wreg,f
	bra	u3487
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u3487
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u3487
	nop
asmopt pop

	line	187
	
l2719:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	189
	
l2721:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	190
	
l2723:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u3497:
decfsz	wreg,f
	bra	u3497
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u3497
asmopt pop

	line	191
	
l2725:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	192
	
l2727:
	asmopt push
asmopt off
	movlw	240
u3507:
	nop2
decfsz	wreg,f
	bra	u3507
asmopt pop

	line	193
	
l2729:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	194
	
l2731:
	asmopt push
asmopt off
	movlw	240
u3517:
	nop2
decfsz	wreg,f
	bra	u3517
asmopt pop

	line	196
	
l2733:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	197
	
l2735:
	asmopt push
asmopt off
	movlw	240
u3527:
	nop2
decfsz	wreg,f
	bra	u3527
asmopt pop

	line	199
	
l2737:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	200
	
l2739:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	201
	
l2741:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	202
	
l2743:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_init+0+0)^00h,c
	movlw	198
u3537:
decfsz	wreg,f
	bra	u3537
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u3537
	nop2
asmopt pop

	line	203
	
l2745:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	204
	
l135:
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
psect	text26,class=CODE,space=0,reloc=2,group=0
	line	150
global __ptext26
__ptext26:
psect	text26
	file	"src\main.c"
	line	150
	
_lcd_clear:
;incstack = 0
	callstack 27
	line	152
	
l2709:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	153
	
l2711:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u3547:
decfsz	wreg,f
	bra	u3547
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u3547
	nop2
asmopt pop

	line	154
	
l122:
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
psect	text27,class=CODE,space=0,reloc=2,group=0
	line	118
global __ptext27
__ptext27:
psect	text27
	file	"src\main.c"
	line	118
	
_lcd_cmd:
;incstack = 0
	callstack 25
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	120
	
l2329:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	121
	
l2331:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	122
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	124
	
l2333:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u1481
	goto	u1480

u1481:
	goto	l2337
u1480:
	
l2335:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u1491
	goto	u1490

u1491:
	goto	l2339
u1490:
	line	126
	
l2337:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u3557:
decfsz	wreg,f
	bra	u3557
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u3557
	nop2
asmopt pop

	line	127
	goto	l110
	line	130
	
l2339:
	asmopt push
asmopt off
	movlw	133
u3567:
decfsz	wreg,f
	bra	u3567
	nop
asmopt pop

	line	132
	
l110:
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
psect	text28,class=CODE,space=0,reloc=2,group=0
	line	93
global __ptext28
__ptext28:
psect	text28
	file	"src\main.c"
	line	93
	
_lcd_write_nibble:
;incstack = 0
	callstack 25
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	95
	
l2307:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u1431
	goto	u1430
u1431:
	goto	l95
u1430:
	line	96
	
l2309:
	bsf	((c:3977))^0f00h,c,0	;volatile
	goto	l2311
	line	97
	
l95:
	line	98
	bcf	((c:3977))^0f00h,c,0	;volatile
	line	99
	
l2311:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u1441
	goto	u1440
u1441:
	goto	l97
u1440:
	line	100
	
l2313:
	bsf	((c:3977))^0f00h,c,1	;volatile
	goto	l2315
	line	101
	
l97:
	line	102
	bcf	((c:3977))^0f00h,c,1	;volatile
	line	103
	
l2315:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u1451
	goto	u1450
u1451:
	goto	l99
u1450:
	line	104
	
l2317:
	bsf	((c:3977))^0f00h,c,2	;volatile
	goto	l2319
	line	105
	
l99:
	line	106
	bcf	((c:3977))^0f00h,c,2	;volatile
	line	107
	
l2319:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u1461
	goto	u1460
u1461:
	goto	l101
u1460:
	line	108
	
l2321:
	bsf	((c:3977))^0f00h,c,3	;volatile
	goto	l102
	line	109
	
l101:
	line	110
	bcf	((c:3977))^0f00h,c,3	;volatile
	
l102:
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
	
l2323:
	asmopt push
asmopt off
	movlw	133
u3577:
decfsz	wreg,f
	bra	u3577
	nop
asmopt pop

	line	116
	
l103:
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
psect	text29,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	114
global __ptext29
__ptext29:
psect	text29
	file	"src\encoder.c"
	line	114
	
_encoder_init:
;incstack = 0
	callstack 29
	line	117
	
l2773:
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
	
l2775:; BSR set to: 0

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	128
	
l2777:; BSR set to: 0

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	129
	
l2779:; BSR set to: 0

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	132
	
l2781:; BSR set to: 0

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u1951
	goto	u1950
u1951:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u1958
u1950:
	clrf	(??_encoder_init+0+0)^00h,c
u1958:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u1961
	goto	u1960
u1961:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u1968
u1960:
	clrf	(??_encoder_init+1+0)^00h,c
u1968:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:_enc_state))^00h,c
	line	133
	
l217:
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
psect	text30,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	177
global __ptext30
__ptext30:
psect	text30
	file	"src\eeprom.c"
	line	177
	
_eeprom_init:
;incstack = 0
	callstack 26
	line	179
	
l2747:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	182
	
l2749:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	186
	
l2755:
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
	
l2757:
	incf	((c:eeprom_init@i))^00h,c
	
l2759:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u1931
	goto	u1930

u1931:
	goto	l2755
u1930:
	line	188
	
l2761:
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
	
l2763:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	192
	
l2765:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u1940
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u1941
	goto	u1940

u1941:
	goto	l2771
u1940:
	line	195
	
l2767:
	call	_load_factory_defaults	;wreg free
	line	196
	
l2769:
	call	_save_current_config	;wreg free
	line	200
	
l2771:
	call	_sync_menu_variables	;wreg free
	line	201
	
l485:
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
psect	text31,class=CODE,space=0,reloc=2,group=0
	line	234
global __ptext31
__ptext31:
psect	text31
	file	"src\eeprom.c"
	line	234
	
_sync_menu_variables:
;incstack = 0
	callstack 28
	line	243
	
l2687:
	movff	_input_config,(c:_enable_edit_flag)
	line	244
	movff	0+(_input_config+01h),(c:_sensor_edit_flag)
	line	245
	
l503:
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
;;		_main
;;		_eeprom_init
;; This function uses a non-reentrant model
;;
psect	text32,class=CODE,space=0,reloc=2,group=0
	line	203
global __ptext32
__ptext32:
psect	text32
	file	"src\eeprom.c"
	line	203
	
_save_current_config:
;incstack = 0
	callstack 27
	line	206
	
l2585:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	210
	
l2591:
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
	
l2593:
	incf	((c:save_current_config@i))^00h,c
	
l2595:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u1801
	goto	u1800

u1801:
	goto	l2591
u1800:
	line	214
	
l2597:
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
	
l2599:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	218
	
l2601:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	219
	
l490:
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
psect	text33,class=CODE,space=0,reloc=2,group=0
	line	152
global __ptext33
__ptext33:
psect	text33
	file	"src\eeprom.c"
	line	152
	
_eeprom_write_word:
;incstack = 0
	callstack 27
	line	154
	
l2431:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	155
	
l2433:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	156
	
l467:
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
psect	text34,class=CODE,space=0,reloc=2,group=0
	line	158
global __ptext34
__ptext34:
psect	text34
	file	"src\eeprom.c"
	line	158
	
_eeprom_write_block:
;incstack = 0
	callstack 27
	line	160
	
l2435:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	161
	
l2437:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l2443
	line	163
	
l2439:
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
	
l2441:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l2443:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u1601
	goto	u1600

u1601:
	goto	l2439
u1600:
	line	165
	
l473:
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
psect	text35,class=CODE,space=0,reloc=2,group=0
	line	125
global __ptext35
__ptext35:
psect	text35
	file	"src\eeprom.c"
	line	125
	
_eeprom_write_byte:
;incstack = 0
	callstack 27
	line	127
	
l2347:
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
	
l2349:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	136
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	137
	
l2351:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	140
	
l458:
	line	139
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u1501
	goto	u1500
u1501:
	goto	l458
u1500:
	
l460:
	line	141
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	142
	
l461:
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
psect	text36,class=CODE,space=0,reloc=2,group=0
	line	89
global __ptext36
__ptext36:
psect	text36
	file	"src\eeprom.c"
	line	89
	
_calculate_config_checksum:
;incstack = 0
	callstack 28
	line	91
	
l2387:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	95
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	97
	
l2393:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	98
	
l2395:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	100
	
l2401:
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
	
l2403:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l2405:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u1570
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u1571
	goto	u1570

u1571:
	goto	l2401
u1570:
	line	95
	
l2407:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l2409:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u1581
	goto	u1580

u1581:
	goto	l2393
u1580:
	line	105
	
l2411:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	106
	
l2413:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1044+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1044))^00h,c
	line	108
	
l2419:
	movf	((c:calculate_config_checksum@j_1044))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j_1044+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	106
	
l2421:
	infsnz	((c:calculate_config_checksum@j_1044))^00h,c
	incf	((c:calculate_config_checksum@j_1044+1))^00h,c
	
l2423:
		movf	((c:calculate_config_checksum@j_1044+1))^00h,c,w
	bnz	u1590
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1044))^00h,c,w
	btfss	status,0
	goto	u1591
	goto	u1590

u1591:
	goto	l2419
u1590:
	
l451:
	line	111
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	112
	
l452:
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
psect	text37,class=CODE,space=0,reloc=2,group=0
	line	228
global __ptext37
__ptext37:
psect	text37
	file	"src\eeprom.c"
	line	228
	
_load_factory_defaults:
;incstack = 0
	callstack 27
	line	230
	
l2685:
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
	
l496:
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
;;		 -> system_config(128), input_config(384), 
;;  s1              2   11[COMRAM] PTR const void 
;;		 -> system_defaults(128), factory_defaults(384), 
;;  n               2   13[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  s               2   17[COMRAM] PTR const unsigned char 
;;		 -> system_defaults(128), factory_defaults(384), 
;;  d               2   15[COMRAM] PTR unsigned char 
;;		 -> system_config(128), input_config(384), 
;;  tmp             1   19[COMRAM] unsigned char 
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
;;		_load_factory_defaults
;; This function uses a non-reentrant model
;;
psect	text38,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
global __ptext38
__ptext38:
psect	text38
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
	
_memcpy:
;incstack = 0
	callstack 27
	line	34
	
l2445:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l2455
	line	37
	
l2447:
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
	
l2449:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l2451:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l2453:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l2455:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u1611
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u1611
	goto	u1610

u1611:
	goto	l2447
u1610:
	line	41
	
l1204:
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
psect	text39,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	144
global __ptext39
__ptext39:
psect	text39
	file	"src\eeprom.c"
	line	144
	
_eeprom_read_word:
;incstack = 0
	callstack 27
	line	147
	
l2669:
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
	
l2671:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	150
	
l464:
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
psect	text40,class=CODE,space=0,reloc=2,group=0
	line	167
global __ptext40
__ptext40:
psect	text40
	file	"src\eeprom.c"
	line	167
	
_eeprom_read_block:
;incstack = 0
	callstack 27
	line	169
	
l2675:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	170
	
l2677:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l2683
	line	172
	
l2679:
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
	
l2681:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l2683:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u1911
	goto	u1910

u1911:
	goto	l2679
u1910:
	line	174
	
l479:
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
psect	text41,class=CODE,space=0,reloc=2,group=0
	line	115
global __ptext41
__ptext41:
psect	text41
	file	"src\eeprom.c"
	line	115
	
_eeprom_read_byte:
;incstack = 0
	callstack 27
	line	117
	
l2425:
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
	
l2427:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	123
	
l455:
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
	callstack 25
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
	
i2l3221:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u271_41
	goto	i2u271_40
i2u271_41:
	goto	i2l214
i2u271_40:
	line	34
	
i2l3223:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	35
	
i2l3225:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	38
	
i2l3227:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u272_41
	goto	i2u272_40
i2u272_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u272_48
i2u272_40:
	clrf	(??_isr+0+0)^00h,c
i2u272_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u273_41
	goto	i2u273_40
i2u273_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u273_48
i2u273_40:
	clrf	(??_isr+1+0)^00h,c
i2u273_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	39
	
i2l3229:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	42
	
i2l3231:
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
	
i2l3233:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u274_41
	goto	i2u274_40
i2u274_41:
	goto	i2l3247
i2u274_40:
	line	47
	
i2l3235:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u275_41
	goto	i2u275_40

i2u275_41:
	goto	i2l3241
i2u275_40:
	line	49
	
i2l3237:
	movlb	0	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	50
	
i2l3239:; BSR set to: 0

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	51
	goto	i2l3247
	line	52
	
i2l3241:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u276_41
	goto	i2u276_40

i2u276_41:
	goto	i2l3247
i2u276_40:
	line	54
	
i2l3243:
	movlb	0	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	goto	i2l3239
	line	59
	
i2l3247:
	movff	(c:isr@new_state),(c:_enc_state)
	line	62
	
i2l3249:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	63
	
i2l3251:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u277_41
	goto	i2u277_40

i2u277_41:
	goto	i2l3277
i2u277_40:
	line	65
	
i2l3253:
	incf	((c:_btn_debounce))^00h,c
	line	66
	
i2l3255:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u278_41
	goto	i2u278_40

i2u278_41:
	goto	i2l214
i2u278_40:
	line	68
	
i2l3257:
	movff	(c:isr@btn),(c:_last_btn)
	line	69
	
i2l3259:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	71
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u279_41
	goto	i2u279_40
i2u279_41:
	goto	i2l3263
i2u279_40:
	line	74
	
i2l3261:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	75
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	76
	goto	i2l214
	line	80
	
i2l3263:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u280_41
	goto	i2u280_40

i2u280_41:
	goto	i2l3267
i2u280_40:
	line	82
	
i2l3265:
	movlw	low(03h)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	83
	goto	i2l207
	line	84
	
i2l3267:
		movlw	132
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	3
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u281_41
	goto	i2u281_40

i2u281_41:
	goto	i2l3271
i2u281_40:
	line	86
	
i2l3269:
	movlw	low(02h)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	87
	goto	i2l207
	line	88
	
i2l3271:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u282_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u282_41
	goto	i2u282_40

i2u282_41:
	goto	i2l3275
i2u282_40:
	line	90
	
i2l3273:
	movlw	low(01h)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	91
	goto	i2l207
	line	94
	
i2l3275:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	95
	
i2l207:; BSR set to: 0

	line	97
	movlw	low(01h)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	98
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	goto	i2l214
	line	104
	
i2l3277:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	106
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u283_41
	goto	i2u283_40
i2u283_41:
	goto	i2l214
i2u283_40:
	
i2l3279:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u284_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u284_41
	goto	i2u284_40

i2u284_41:
	goto	i2l214
i2u284_40:
	line	108
	
i2l3281:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	112
	
i2l214:
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
