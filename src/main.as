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
	global	_value_back
	global	_options_menu
	global	_value_sensor
	global	_value_relay_pulse
	global	_value_end_runtime
	global	_value_clock_enable
	global	_value_flow_type
	global	_value_display
	global	_value_rlylow
	global	_value_rlyplp
	global	_value_rlyhigh
	global	_value_slpbp
	global	_value_plpbp
	global	_value_highbp
	global	_value_scale20
	global	_value_scale4
	global	_value_enable
	global	_value_pwr_fail
	global	_value_menu_timeout
	global	_value_log_entries
	global	_value_brightness
	global	_value_contrast
	global	menu_draw_setup@F2719
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
	line	89

;initializer for _value_back
	db	low(042h)
	db	low(061h)
	db	low(063h)
	db	low(06Bh)
	db	low(0)
psect	idataBANK6,class=CODE,space=0,delta=1,noexec
global __pidataBANK6
__pidataBANK6:
	line	69

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

	line	78

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
	line	106

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
	line	105

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
	line	104

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
	line	95

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
	line	88

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
	line	87

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
	line	85

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
	line	84

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
	line	83

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
	line	82

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
	line	81

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
	line	80

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
	line	79

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
	line	77

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
	line	203

;initializer for _value_pwr_fail
	db	low(030h)
	db	low(030h)
	db	low(03Ah)
	db	low(030h)
	db	low(035h)
	db	low(0)
	line	200

;initializer for _value_menu_timeout
	db	low(030h)
	db	low(030h)
	db	low(03Ah)
	db	low(033h)
	db	low(030h)
	db	low(0)
	line	199

;initializer for _value_log_entries
	db	low(031h)
	db	low(030h)
	db	low(0)
	db   0
	db   0
	db   0
	line	202

;initializer for _value_brightness
	db	low(035h)
	db	low(030h)
	db	low(0)
	db   0
	line	201

;initializer for _value_contrast
	db	low(035h)
	db	low(030h)
	db	low(0)
	db   0
psect	idataBANK7,class=CODE,space=0,delta=1,noexec
global __pidataBANK7
__pidataBANK7:
	line	1575

;initializer for menu_draw_setup@F2719
		db	low(STR_247)
	db	high(STR_247)

		db	low(STR_248)
	db	high(STR_248)

		db	low(STR_249)
	db	high(STR_249)

		db	low(STR_250)
	db	high(STR_250)

		db	low(STR_251)
	db	high(STR_251)

	line	107

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
	line	100

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
	line	99

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
	line	98

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
	line	97

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
	line	96

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
	line	94

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
	line	93

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
	line	92

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
	line	86

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
	global	_utility_menu_template
psect	mediumconst,class=MEDIUMCONST,space=0,reloc=2,noexec
global __pmediumconst
__pmediumconst:
	db	0
	file	"src\menu.c"
	line	183
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
	line	116
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
	line	159
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
	line	134
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
	line	147
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
	line	174
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
	global	_button_pressed
	global	_relay_state
	global	_menu
	global	main@blink_timer
	global	main@last_relay_counter
	global	main@encoder_activity_timer
	global	_relay_counter
	global	_encoder_count
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
	
STR_339:
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
	
STR_147:
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
	
STR_361:
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
	
STR_369:
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
	
STR_225:
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
	
STR_152:
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
	
STR_272:
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
	
STR_348:
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
	
STR_320:
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
	
STR_322:
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
	
STR_371:
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
	
STR_314:
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
	
STR_362:
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
	
STR_367:
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
	
STR_370:
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
	
STR_372:
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
	
STR_340:
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
	
STR_300:
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
	
STR_303:
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
	
STR_349:
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
	
STR_350:
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
	
STR_321:
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
	
STR_263:
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
	
STR_305:
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
	
STR_319:
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
	
STR_360:
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
	
STR_313:
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
	
STR_341:
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
	
STR_318:
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
	
STR_302:
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
	
STR_366:
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
	
STR_368:
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
	
STR_226:
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
	
STR_317:
	db	77	;'M'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	32
	db	84	;'T'
	db	47
	db	79	;'O'
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
	
STR_358:
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
	
STR_373:
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
	
STR_227:
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
	
STR_356:
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
	
STR_273:
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
	
STR_359:
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
	
STR_357:
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
	
STR_309:
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
	
STR_304:
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
	
STR_355:
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
	
STR_148:
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
	
STR_324:
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
	
STR_328:
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
	
STR_153:
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
	
STR_306:
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
	
STR_310:
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
	
STR_352:
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
	
STR_308:
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
	
STR_342:
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
	
STR_351:
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
	
STR_325:
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
	
STR_301:
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
	
STR_176:
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
	
STR_246:
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
	
STR_236:
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
	
STR_354:
	db	69	;'E'
	db	100	;'d'
	db	105	;'i'
	db	116	;'t'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
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
	
STR_347:
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
	
STR_307:
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
	
STR_353:
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
	
STR_375:
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
	
STR_323:
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
	
STR_157:
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
	
STR_288:
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
	db	32
	db	32
	db	0
	
STR_161:
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
	
STR_155:
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
	
STR_154:
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
	
STR_160:
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
	
STR_159:
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
	
STR_290:
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
	
STR_239:
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_229:
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
	
STR_289:
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
	
STR_374:
	db	40
	db	110	;'n'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	41
	db	0
	
STR_292:
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
	
STR_283:
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
	
STR_181:
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
	
STR_183:
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
	
STR_145:
	db	40
	db	0
	
STR_257:
	db	42
	db	0
	
STR_166:
	db	91	;'['
	db	0
STR_103	equ	STR_94+0
STR_111	equ	STR_94+0
STR_122	equ	STR_94+0
STR_127	equ	STR_94+0
STR_49	equ	STR_108+3
STR_209	equ	STR_108+3
STR_254	equ	STR_108+3
STR_197	equ	STR_68+0
STR_207	equ	STR_68+0
STR_212	equ	STR_68+0
STR_271	equ	STR_68+0
STR_346	equ	STR_68+0
STR_121	equ	STR_110+0
STR_57	equ	STR_110+4
STR_223	equ	STR_110+4
STR_38	equ	STR_354+13
STR_132	equ	STR_353+8
STR_142	equ	STR_302+29
STR_143	equ	STR_302+29
STR_177	equ	STR_302+29
STR_264	equ	STR_302+29
STR_97	equ	STR_83+0
STR_106	equ	STR_83+0
STR_114	equ	STR_83+0
STR_48	equ	STR_100+5
STR_199	equ	STR_100+5
STR_253	equ	STR_100+5
STR_211	equ	STR_53+0
STR_291	equ	STR_129+0
STR_250	equ	STR_129+4
STR_104	equ	STR_95+0
STR_112	equ	STR_95+0
STR_123	equ	STR_95+0
STR_128	equ	STR_95+0
STR_137	equ	STR_95+0
STR_173	equ	STR_95+0
STR_175	equ	STR_95+0
STR_251	equ	STR_95+0
STR_293	equ	STR_95+0
STR_102	equ	STR_91+0
STR_58	equ	STR_91+4
STR_188	equ	STR_72+0
STR_191	equ	STR_72+0
STR_194	equ	STR_72+0
STR_204	equ	STR_72+0
STR_214	equ	STR_72+0
STR_267	equ	STR_72+0
STR_344	equ	STR_72+0
STR_210	equ	STR_52+0
STR_41	equ	STR_35+0
STR_73	equ	STR_126+4
STR_189	equ	STR_126+4
STR_192	equ	STR_126+4
STR_195	equ	STR_126+4
STR_205	equ	STR_126+4
STR_215	equ	STR_126+4
STR_268	equ	STR_126+4
STR_345	equ	STR_126+4
STR_47	equ	STR_86+3
STR_180	equ	STR_86+3
STR_252	equ	STR_86+3
STR_115	equ	STR_107+0
STR_96	equ	STR_82+0
STR_105	equ	STR_82+0
STR_113	equ	STR_82+0
STR_124	equ	STR_82+0
STR_198	equ	STR_67+0
STR_208	equ	STR_67+0
STR_213	equ	STR_67+0
STR_190	equ	STR_74+0
STR_193	equ	STR_74+0
STR_196	equ	STR_74+0
STR_206	equ	STR_74+0
STR_216	equ	STR_74+0
STR_269	equ	STR_74+0
STR_179	equ	STR_42+0
STR_266	equ	STR_42+0
STR_178	equ	STR_43+0
STR_265	equ	STR_43+0
STR_343	equ	STR_43+0
STR_182	equ	STR_181+0
STR_200	equ	STR_181+0
STR_201	equ	STR_181+0
STR_219	equ	STR_181+0
STR_220	equ	STR_181+0
STR_329	equ	STR_181+0
STR_330	equ	STR_181+0
STR_333	equ	STR_181+0
STR_334	equ	STR_181+0
STR_336	equ	STR_181+0
STR_337	equ	STR_181+0
STR_185	equ	STR_183+0
STR_221	equ	STR_183+0
STR_331	equ	STR_183+0
STR_332	equ	STR_183+0
STR_335	equ	STR_183+0
STR_338	equ	STR_183+0
STR_162	equ	STR_320+30
STR_163	equ	STR_320+30
STR_184	equ	STR_159+3
STR_186	equ	STR_159+3
STR_187	equ	STR_159+3
STR_203	equ	STR_159+3
STR_222	equ	STR_159+3
STR_224	equ	STR_159+3
STR_270	equ	STR_159+3
STR_279	equ	STR_159+3
STR_282	equ	STR_159+3
STR_311	equ	STR_159+3
STR_312	equ	STR_159+3
STR_316	equ	STR_159+3
STR_327	equ	STR_159+3
STR_158	equ	STR_157+0
STR_228	equ	STR_229+2
STR_315	equ	STR_310+0
STR_326	equ	STR_310+0
STR_202	equ	STR_29+20
STR_278	equ	STR_29+20
STR_280	equ	STR_29+20
STR_281	equ	STR_29+20
STR_167	equ	STR_292+5
STR_171	equ	STR_292+5
STR_174	equ	STR_292+5
STR_238	equ	STR_292+5
STR_244	equ	STR_292+5
STR_256	equ	STR_292+5
STR_260	equ	STR_292+5
STR_286	equ	STR_292+5
STR_295	equ	STR_292+5
STR_298	equ	STR_292+5
STR_170	equ	STR_166+0
STR_172	equ	STR_166+0
STR_237	equ	STR_166+0
STR_242	equ	STR_166+0
STR_255	equ	STR_166+0
STR_259	equ	STR_166+0
STR_284	equ	STR_166+0
STR_294	equ	STR_166+0
STR_296	equ	STR_166+0
STR_218	equ	STR_63+0
STR_37	equ	STR_31+0
STR_98	equ	STR_84+0
STR_117	equ	STR_84+0
STR_99	equ	STR_85+0
STR_118	equ	STR_85+0
STR_40	equ	STR_34+0
STR_261	equ	STR_257+0
STR_146	equ	STR_374+5
STR_151	equ	STR_374+5
STR_165	equ	STR_374+5
STR_169	equ	STR_374+5
STR_232	equ	STR_374+5
STR_235	equ	STR_374+5
STR_245	equ	STR_374+5
STR_287	equ	STR_374+5
STR_299	equ	STR_374+5
STR_150	equ	STR_145+0
STR_164	equ	STR_145+0
STR_168	equ	STR_145+0
STR_231	equ	STR_145+0
STR_234	equ	STR_145+0
STR_243	equ	STR_145+0
STR_285	equ	STR_145+0
STR_297	equ	STR_145+0
STR_217	equ	STR_62+0
STR_144	equ	STR_176+13
STR_149	equ	STR_176+13
STR_230	equ	STR_176+14
STR_233	equ	STR_176+15
STR_240	equ	STR_176+15
STR_258	equ	STR_176+19
STR_262	equ	STR_176+19
STR_44	equ	STR_176+20
STR_45	equ	STR_176+20
STR_46	equ	STR_176+20
STR_50	equ	STR_176+20
STR_51	equ	STR_176+20
STR_54	equ	STR_176+20
STR_55	equ	STR_176+20
STR_56	equ	STR_176+20
STR_59	equ	STR_176+20
STR_60	equ	STR_176+20
STR_61	equ	STR_176+20
STR_64	equ	STR_176+20
STR_65	equ	STR_176+20
STR_66	equ	STR_176+20
STR_69	equ	STR_176+20
STR_70	equ	STR_176+20
STR_71	equ	STR_176+20
STR_75	equ	STR_176+20
STR_76	equ	STR_176+20
STR_241	equ	STR_176+20
STR_247	equ	STR_176+20
STR_248	equ	STR_176+20
STR_249	equ	STR_176+20
STR_274	equ	STR_176+20
STR_275	equ	STR_176+20
STR_276	equ	STR_176+20
STR_277	equ	STR_176+20
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
	global	_button_pressed
_button_pressed:
       ds      1
	global	_relay_state
_relay_state:
       ds      1
psect	bssBANK5,class=BANK5,space=1,noexec,lowdata
global __pbssBANK5
__pbssBANK5:
	global	_menu
_menu:
       ds      31
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
	line	89
_value_back:
       ds      5
psect	bssBANK6,class=BANK6,space=1,noexec,lowdata
global __pbssBANK6
__pbssBANK6:
	global	_utility_menu
_utility_menu:
       ds      45
menu_update_numeric_value@F2690:
       ds      6
main@last_second_update:
       ds      4
_original_value:
       ds      10
psect	dataBANK6,class=BANK6,space=1,noexec,lowdata
global __pdataBANK6
__pdataBANK6:
	file	"src\menu.c"
	line	69
	global	_options_menu
_options_menu:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	78
_value_sensor:
       ds      12
psect	dataBANK6
	file	"src\menu.c"
	line	106
_value_relay_pulse:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	105
_value_end_runtime:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	104
_value_clock_enable:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	95
_value_flow_type:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	88
_value_display:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	87
_value_rlylow:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	85
_value_rlyplp:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	84
_value_rlyhigh:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	83
_value_slpbp:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	82
_value_plpbp:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	81
_value_highbp:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	80
_value_scale20:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	79
_value_scale4:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	77
_value_enable:
       ds      10
psect	dataBANK6
	file	"src\menu.c"
	line	203
_value_pwr_fail:
       ds      6
psect	dataBANK6
	file	"src\menu.c"
	line	200
_value_menu_timeout:
       ds      6
psect	dataBANK6
	file	"src\menu.c"
	line	199
_value_log_entries:
       ds      6
psect	dataBANK6
	file	"src\menu.c"
	line	202
_value_brightness:
       ds      4
psect	dataBANK6
	file	"src\menu.c"
	line	201
_value_contrast:
       ds      4
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
	line	1575
menu_draw_setup@F2719:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	107
_value_clock_display:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	101
_value_high_tbp:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	100
_value_low_flow_bp:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	99
_value_no_flow_bp:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	98
_value_low_flow:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	97
_value_no_flow:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	96
_value_flow_units:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	94
_value_high_temp:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	93
_value_low_pressure:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	92
_value_hi_pressure:
       ds      10
psect	dataBANK7
	file	"src\menu.c"
	line	86
_value_rlyslp:
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
; Initialize objects allocated to BANK7 (120 bytes)
	global __pidataBANK7
	; load TBLPTR registers with __pidataBANK7
	movlw	low (__pidataBANK7)
	movwf	tblptrl
	movlw	high(__pidataBANK7)
	movwf	tblptrh
	movlw	low highword(__pidataBANK7)
	movwf	tblptru
	lfsr	0,__pdataBANK7
	lfsr	1,120
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK6 (188 bytes)
	global __pidataBANK6
	; load TBLPTR registers with __pidataBANK6
	movlw	low (__pidataBANK6)
	movwf	tblptrl
	movlw	high(__pidataBANK6)
	movwf	tblptrh
	movlw	low highword(__pidataBANK6)
	movwf	tblptru
	lfsr	0,__pdataBANK6
	lfsr	1,188
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
; Initialize objects allocated to BANK5 (8 bytes)
	global __pidataBANK5
	; load TBLPTR registers with __pidataBANK5
	movlw	low (__pidataBANK5)
	movwf	tblptrl
	movlw	high(__pidataBANK5)
	movwf	tblptrh
	movlw	low highword(__pidataBANK5)
	movwf	tblptru
	lfsr	0,__pdataBANK5
	lfsr	1,8
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
; Clear objects allocated to BANK6 (65 bytes)
	global __pbssBANK6
lfsr	0,__pbssBANK6
movlw	65
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
; Clear objects allocated to BANK5 (152 bytes)
	global __pbssBANK5
lfsr	0,__pbssBANK5
movlw	152
clear_3:
clrf	postinc0,c
decf	wreg
bnz	clear_3
; Clear objects allocated to BANK0 (2 bytes)
	global __pbssBANK0
movlb	0
clrf	(__pbssBANK0+1)&0xffh,b
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
psect	cstackBANK8,class=BANK8,space=1,noexec,lowdata
global __pcstackBANK8
__pcstackBANK8:
	global	main@buf_714
main@buf_714:	; 30 bytes @ 0x0
	ds   30
psect	cstackBANK7,class=BANK7,space=1,noexec,lowdata
global __pcstackBANK7
__pcstackBANK7:
	global	main@current_time
main@current_time:	; 7 bytes @ 0x0
	ds   7
psect	cstackBANK6,class=BANK6,space=1,noexec,lowdata
global __pcstackBANK6
__pcstackBANK6:
	global	main@delta
main@delta:	; 2 bytes @ 0x0
	ds   2
psect	cstackBANK5,class=BANK5,space=1,noexec,lowdata
global __pcstackBANK5
__pcstackBANK5:
	global	main@buf_667
main@buf_667:	; 50 bytes @ 0x0
	ds   50
	global	main@buf_675
main@buf_675:	; 40 bytes @ 0x32
	ds   40
	global	main@last_button
main@last_button:	; 1 bytes @ 0x5A
	ds   1
	global	main@adc_error
main@adc_error:	; 1 bytes @ 0x5B
	ds   1
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0x5C
	ds   2
	global	main@current_event
main@current_event:	; 1 bytes @ 0x5E
	ds   1
	global	main@status
main@status:	; 1 bytes @ 0x5F
	ds   1
psect	cstackBANK4,class=BANK4,space=1,noexec,lowdata
global __pcstackBANK4
__pcstackBANK4:
	global	main@time_buf
main@time_buf:	; 60 bytes @ 0x0
	ds   60
	global	main@buf_672
main@buf_672:	; 60 bytes @ 0x3C
	ds   60
	global	main@buf
main@buf:	; 50 bytes @ 0x78
	ds   50
	global	main@buf_628
main@buf_628:	; 50 bytes @ 0xAA
	ds   50
	global	main@buf_633
main@buf_633:	; 30 bytes @ 0xDC
	ds   30
	global	main@adc_ch1
main@adc_ch1:	; 2 bytes @ 0xFA
	ds   2
	global	main@adc_ch2
main@adc_ch2:	; 2 bytes @ 0xFC
	ds   2
	global	main@adc_ch3
main@adc_ch3:	; 2 bytes @ 0xFE
	ds   2
psect	cstackBANK3,class=BANK3,space=1,noexec,lowdata
global __pcstackBANK3
__pcstackBANK3:
	global	menu_handle_button@buf_1790
menu_handle_button@buf_1790:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_button@buf_1799
menu_handle_button@buf_1799:	; 50 bytes @ 0x32
	ds   50
	global	menu_handle_button@buf_1809
menu_handle_button@buf_1809:	; 50 bytes @ 0x64
	ds   50
	global	menu_handle_button@buf
menu_handle_button@buf:	; 50 bytes @ 0x96
	ds   50
	global	menu_handle_button@new_seconds_1756
menu_handle_button@new_seconds_1756:	; 2 bytes @ 0xC8
	ds   2
	global	menu_handle_button@flow_type
menu_handle_button@flow_type:	; 1 bytes @ 0xCA
	ds   1
	global	menu_handle_button@sensor_type_1775
menu_handle_button@sensor_type_1775:	; 1 bytes @ 0xCB
	ds   1
	global	menu_handle_button@verify_time
menu_handle_button@verify_time:	; 7 bytes @ 0xCC
	ds   7
	global	menu_handle_button@new_time
menu_handle_button@new_time:	; 7 bytes @ 0xD3
	ds   7
	global	menu_handle_button@sensor_type
menu_handle_button@sensor_type:	; 1 bytes @ 0xDA
	ds   1
	global	menu_handle_button@new_value_1759
menu_handle_button@new_value_1759:	; 2 bytes @ 0xDB
	ds   2
??_main:	; 1 bytes @ 0xDD
	ds   2
psect	cstackBANK2,class=BANK2,space=1,noexec,lowdata
global __pcstackBANK2
__pcstackBANK2:
	global	menu_handle_button@buf_1713
menu_handle_button@buf_1713:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_button@buf_1718
menu_handle_button@buf_1718:	; 50 bytes @ 0x32
	ds   50
	global	menu_handle_button@buf_1720
menu_handle_button@buf_1720:	; 50 bytes @ 0x64
	ds   50
	global	menu_handle_button@buf_1754
menu_handle_button@buf_1754:	; 50 bytes @ 0x96
	ds   50
	global	menu_handle_button@buf_1780
menu_handle_button@buf_1780:	; 50 bytes @ 0xC8
	ds   50
	global	menu_handle_button@opts
menu_handle_button@opts:	; 2 bytes @ 0xFA
	ds   2
	global	menu_handle_button@edit_flag
menu_handle_button@edit_flag:	; 2 bytes @ 0xFC
	ds   2
	global	menu_handle_button@press_type
menu_handle_button@press_type:	; 1 bytes @ 0xFE
	ds   1
	global	menu_handle_button@flow_type_1776
menu_handle_button@flow_type_1776:	; 1 bytes @ 0xFF
	ds   1
psect	cstackBANK1,class=BANK1,space=1,noexec,lowdata
global __pcstackBANK1
__pcstackBANK1:
	global	menu_handle_encoder@buf_1683
menu_handle_encoder@buf_1683:	; 50 bytes @ 0x0
	global	init_datetime_editor@buf
init_datetime_editor@buf:	; 80 bytes @ 0x0
	ds   50
	global	menu_handle_encoder@buf_1686
menu_handle_encoder@buf_1686:	; 50 bytes @ 0x32
	ds   30
	global	init_datetime_editor@current_time
init_datetime_editor@current_time:	; 7 bytes @ 0x50
	ds   7
	global	menu_handle_button@buf_1722
menu_handle_button@buf_1722:	; 80 bytes @ 0x57
	ds   13
	global	menu_handle_encoder@buf
menu_handle_encoder@buf:	; 50 bytes @ 0x64
	ds   50
	global	_menu_handle_encoder$1681
_menu_handle_encoder$1681:	; 2 bytes @ 0x96
	ds   2
	global	_menu_handle_encoder$1682
_menu_handle_encoder$1682:	; 2 bytes @ 0x98
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
	global	menu_handle_button@buf_1741
menu_handle_button@buf_1741:	; 80 bytes @ 0xA7
	ds   80
	global	menu_handle_button@opts_1784
menu_handle_button@opts_1784:	; 2 bytes @ 0xF7
	ds   2
	global	menu_handle_button@i
menu_handle_button@i:	; 1 bytes @ 0xF9
	ds   1
	global	menu_handle_button@new_value
menu_handle_button@new_value:	; 2 bytes @ 0xFA
	ds   2
	global	menu_handle_button@new_seconds
menu_handle_button@new_seconds:	; 2 bytes @ 0xFC
	ds   2
	global	menu_handle_button@current_val
menu_handle_button@current_val:	; 2 bytes @ 0xFE
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
	global	_menu_draw_utility$1649
_menu_draw_utility$1649:	; 2 bytes @ 0x10
	ds   2
	global	_menu_draw_utility$1657
_menu_draw_utility$1657:	; 2 bytes @ 0x12
	ds   2
	global	menu_update_edit_value@sensor_type
menu_update_edit_value@sensor_type:	; 1 bytes @ 0x14
	global	_menu_draw_utility$1661
_menu_draw_utility$1661:	; 2 bytes @ 0x14
	ds   1
	global	menu_update_edit_value@flow_type
menu_update_edit_value@flow_type:	; 1 bytes @ 0x15
	ds   1
	global	menu_draw_utility@len
menu_draw_utility@len:	; 1 bytes @ 0x16
	global	_menu_update_edit_value$1474
_menu_update_edit_value$1474:	; 2 bytes @ 0x16
	ds   1
	global	menu_draw_utility@val_len
menu_draw_utility@val_len:	; 1 bytes @ 0x17
	ds   1
	global	menu_draw_utility@j
menu_draw_utility@j:	; 1 bytes @ 0x18
	global	_menu_update_edit_value$1478
_menu_update_edit_value$1478:	; 2 bytes @ 0x18
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
	global	_menu_draw_input$1538
_menu_draw_input$1538:	; 2 bytes @ 0x1A
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
	global	_menu_draw_input$1542
_menu_draw_input$1542:	; 2 bytes @ 0x1C
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
	global	menu_draw_input@opts_1524
menu_draw_input@opts_1524:	; 2 bytes @ 0x24
	ds   2
	global	menu_draw_input@flag_1528
menu_draw_input@flag_1528:	; 2 bytes @ 0x26
	ds   2
	global	menu_draw_input@val_len_1532
menu_draw_input@val_len_1532:	; 1 bytes @ 0x28
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
	global	_rebuild_input_menu$1367
_rebuild_input_menu$1367:	; 2 bytes @ 0x32
	global	_handle_numeric_rotation$1463
_handle_numeric_rotation$1463:	; 2 bytes @ 0x32
	global	_rebuild_clock_menu$1585
_rebuild_clock_menu$1585:	; 2 bytes @ 0x32
	global	menu_update_time_value@debug_after
menu_update_time_value@debug_after:	; 50 bytes @ 0x32
	ds   2
	global	handle_time_rotation@direction
handle_time_rotation@direction:	; 1 bytes @ 0x34
	global	_rebuild_input_menu$1381
_rebuild_input_menu$1381:	; 2 bytes @ 0x34
	global	_handle_numeric_rotation$1465
_handle_numeric_rotation$1465:	; 2 bytes @ 0x34
	global	_rebuild_clock_menu$1591
_rebuild_clock_menu$1591:	; 2 bytes @ 0x34
	ds   2
	global	handle_numeric_rotation@max_tens
handle_numeric_rotation@max_tens:	; 1 bytes @ 0x36
	global	_rebuild_input_menu$1382
_rebuild_input_menu$1382:	; 2 bytes @ 0x36
	global	_rebuild_clock_menu$1592
_rebuild_clock_menu$1592:	; 2 bytes @ 0x36
	ds   1
	global	handle_numeric_rotation@max_units
handle_numeric_rotation@max_units:	; 1 bytes @ 0x37
	ds   1
	global	handle_numeric_rotation@direction
handle_numeric_rotation@direction:	; 1 bytes @ 0x38
	global	_rebuild_input_menu$1388
_rebuild_input_menu$1388:	; 2 bytes @ 0x38
	ds   2
	global	_rebuild_input_menu$1389
_rebuild_input_menu$1389:	; 2 bytes @ 0x3A
	ds   2
	global	trigger_relay_pulse@latch_mode
trigger_relay_pulse@latch_mode:	; 1 bytes @ 0x3C
	global	_rebuild_input_menu$1395
_rebuild_input_menu$1395:	; 2 bytes @ 0x3C
	ds   2
	global	_rebuild_input_menu$1396
_rebuild_input_menu$1396:	; 2 bytes @ 0x3E
	ds   2
	global	_rebuild_input_menu$1400
_rebuild_input_menu$1400:	; 2 bytes @ 0x40
	ds   2
	global	_rebuild_input_menu$1414
_rebuild_input_menu$1414:	; 2 bytes @ 0x42
	ds   2
	global	_rebuild_input_menu$1415
_rebuild_input_menu$1415:	; 2 bytes @ 0x44
	ds   2
	global	_rebuild_input_menu$1419
_rebuild_input_menu$1419:	; 2 bytes @ 0x46
	ds   2
	global	_rebuild_input_menu$1424
_rebuild_input_menu$1424:	; 2 bytes @ 0x48
	ds   2
	global	_rebuild_input_menu$1428
_rebuild_input_menu$1428:	; 2 bytes @ 0x4A
	ds   2
	global	_rebuild_input_menu$1434
_rebuild_input_menu$1434:	; 2 bytes @ 0x4C
	ds   2
	global	_rebuild_input_menu$1435
_rebuild_input_menu$1435:	; 2 bytes @ 0x4E
	ds   2
	global	_rebuild_input_menu$1439
_rebuild_input_menu$1439:	; 2 bytes @ 0x50
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
	global	_rebuild_input_menu$3254
_rebuild_input_menu$3254:	; 2 bytes @ 0x54
	ds   2
	global	_rebuild_input_menu$3255
_rebuild_input_menu$3255:	; 2 bytes @ 0x56
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
	global	menu_update_time_value@screen_line_1295
menu_update_time_value@screen_line_1295:	; 1 bytes @ 0x6E
	ds   1
??_menu_handle_encoder:	; 1 bytes @ 0x6F
??_menu_handle_button:	; 1 bytes @ 0x6F
	ds   5
	global	_menu_handle_button$1792
_menu_handle_button$1792:	; 2 bytes @ 0x74
	ds   2
	global	menu_handle_button@edit_flag_1748
menu_handle_button@edit_flag_1748:	; 2 bytes @ 0x76
	ds   2
	global	menu_handle_button@opts_1749
menu_handle_button@opts_1749:	; 2 bytes @ 0x78
	ds   2
	global	menu_handle_button@edit_flag_1783
menu_handle_button@edit_flag_1783:	; 2 bytes @ 0x7A
	ds   2
	global	menu_handle_button@current_val_1779
menu_handle_button@current_val_1779:	; 2 bytes @ 0x7C
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
?_handle_time_rotation:	; 1 bytes @ 0x0
?_menu_update_time_value:	; 1 bytes @ 0x0
?_menu_draw_utility:	; 1 bytes @ 0x0
?_handle_numeric_rotation:	; 1 bytes @ 0x0
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
	global	_isdigit$2983
_isdigit$2983:	; 1 bytes @ 0xF
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
	global	_menu_update_numeric_value$1489
_menu_update_numeric_value$1489:	; 2 bytes @ 0x17
	global	calculate_config_checksum@j_1960
calculate_config_checksum@j_1960:	; 2 bytes @ 0x17
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
	global	_menu_update_numeric_value$1490
_menu_update_numeric_value$1490:	; 2 bytes @ 0x19
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
	global	_menu_update_numeric_value$1491
_menu_update_numeric_value$1491:	; 2 bytes @ 0x1B
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
	global	_menu_update_numeric_value$1492
_menu_update_numeric_value$1492:	; 2 bytes @ 0x1D
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
	global	_init_numeric_editor$1453
_init_numeric_editor$1453:	; 2 bytes @ 0x1F
	global	_menu_update_numeric_value$1493
_menu_update_numeric_value$1493:	; 2 bytes @ 0x1F
	ds   1
	global	eeprom_init@calculated_checksum
eeprom_init@calculated_checksum:	; 2 bytes @ 0x20
	ds   1
	global	init_numeric_editor@sensor_type
init_numeric_editor@sensor_type:	; 1 bytes @ 0x21
	global	_menu_update_numeric_value$1494
_menu_update_numeric_value$1494:	; 2 bytes @ 0x21
	ds   1
	global	eeprom_init@i
eeprom_init@i:	; 1 bytes @ 0x22
	global	init_numeric_editor@abs_val
init_numeric_editor@abs_val:	; 2 bytes @ 0x22
	ds   1
	global	_menu_update_numeric_value$1495
_menu_update_numeric_value$1495:	; 2 bytes @ 0x23
	global	_menu_draw_setup$1562
_menu_draw_setup$1562:	; 2 bytes @ 0x23
	ds   2
	global	_menu_update_numeric_value$1496
_menu_update_numeric_value$1496:	; 2 bytes @ 0x25
	global	_menu_draw_setup$1568
_menu_draw_setup$1568:	; 2 bytes @ 0x25
	ds   2
	global	_menu_update_numeric_value$1498
_menu_update_numeric_value$1498:	; 2 bytes @ 0x27
	global	_menu_draw_setup$1576
_menu_draw_setup$1576:	; 2 bytes @ 0x27
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
	global	_menu_draw_clock$1629
_menu_draw_clock$1629:	; 2 bytes @ 0x2F
	ds   1
	global	menu_update_numeric_value@screen_line
menu_update_numeric_value@screen_line:	; 1 bytes @ 0x30
	global	_sprintf$2540
_sprintf$2540:	; 2 bytes @ 0x30
	ds   1
	global	_menu_draw_clock$1633
_menu_draw_clock$1633:	; 2 bytes @ 0x31
	ds   1
	global	_sprintf$2541
_sprintf$2541:	; 2 bytes @ 0x32
	ds   1
	global	menu_draw_clock@val_len
menu_draw_clock@val_len:	; 1 bytes @ 0x33
	ds   1
	global	menu_draw_clock@val_len_1623
menu_draw_clock@val_len_1623:	; 1 bytes @ 0x34
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
??_handle_time_rotation:	; 1 bytes @ 0x40
??_menu_update_time_value:	; 1 bytes @ 0x40
??_handle_numeric_rotation:	; 1 bytes @ 0x40
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
	global	_rebuild_utility_menu$3256
_rebuild_utility_menu$3256:	; 2 bytes @ 0x42
	ds   1
??_init_time_editor:	; 1 bytes @ 0x43
	ds   1
	global	_rebuild_utility_menu$3257
_rebuild_utility_menu$3257:	; 2 bytes @ 0x44
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
;!    Strings     3848
;!    Constant    910
;!    Data        321
;!    BSS         749
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126     89     112
;!    BANK0           128    126     128
;!    BANK1           256    256     256
;!    BANK2           256    256     256
;!    BANK3           256    223     223
;!    BANK4           256    256     256
;!    BANK5           256     96     256
;!    BANK6           256      2     255
;!    BANK7           256      7     255
;!    BANK8           256     30      30
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
;!		 -> STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), STR_277(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), 
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
;!		 -> STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), STR_277(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), 
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
;!		 -> STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), STR_277(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), 
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
;!		 -> STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), STR_277(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), 
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
;!		 -> STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), STR_277(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), 
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
;!		 -> STR_144(CODE[8]), STR_145(CODE[2]), STR_146(CODE[2]), STR_149(CODE[8]), 
;!		 -> STR_150(CODE[2]), STR_151(CODE[2]), STR_164(CODE[2]), STR_165(CODE[2]), 
;!		 -> STR_166(CODE[2]), STR_167(CODE[2]), STR_168(CODE[2]), STR_169(CODE[2]), 
;!		 -> STR_17(CODE[13]), STR_170(CODE[2]), STR_171(CODE[2]), STR_172(CODE[2]), 
;!		 -> STR_173(CODE[5]), STR_174(CODE[2]), STR_175(CODE[5]), STR_176(CODE[21]), 
;!		 -> STR_18(CODE[16]), STR_230(CODE[7]), STR_231(CODE[2]), STR_232(CODE[2]), 
;!		 -> STR_233(CODE[6]), STR_234(CODE[2]), STR_235(CODE[2]), STR_236(CODE[21]), 
;!		 -> STR_237(CODE[2]), STR_238(CODE[2]), STR_242(CODE[2]), STR_243(CODE[2]), 
;!		 -> STR_244(CODE[2]), STR_245(CODE[2]), STR_246(CODE[21]), STR_247(CODE[1]), 
;!		 -> STR_248(CODE[1]), STR_249(CODE[1]), STR_250(CODE[6]), STR_251(CODE[5]), 
;!		 -> STR_252(CODE[9]), STR_253(CODE[5]), STR_254(CODE[5]), STR_255(CODE[2]), 
;!		 -> STR_256(CODE[2]), STR_257(CODE[2]), STR_258(CODE[2]), STR_259(CODE[2]), 
;!		 -> STR_260(CODE[2]), STR_261(CODE[2]), STR_262(CODE[2]), STR_283(CODE[6]), 
;!		 -> STR_284(CODE[2]), STR_285(CODE[2]), STR_286(CODE[2]), STR_287(CODE[2]), 
;!		 -> STR_288(CODE[14]), STR_289(CODE[8]), STR_290(CODE[12]), STR_291(CODE[10]), 
;!		 -> STR_292(CODE[7]), STR_293(CODE[5]), STR_294(CODE[2]), STR_295(CODE[2]), 
;!		 -> STR_296(CODE[2]), STR_297(CODE[2]), STR_298(CODE[2]), STR_299(CODE[2]), 
;!		 -> STR_31(CODE[12]), STR_32(CODE[6]), STR_37(CODE[12]), STR_38(CODE[8]), 
;!		 -> STR_77(CODE[10]), STR_78(CODE[11]), STR_79(CODE[13]), STR_80(CODE[6]), 
;!		 -> STR_81(CODE[5]), STR_82(CODE[7]), STR_83(CODE[7]), STR_84(CODE[10]), 
;!		 -> STR_85(CODE[11]), STR_86(CODE[12]), STR_87(CODE[9]), STR_88(CODE[13]), 
;!		 -> STR_89(CODE[6]), STR_90(CODE[6]), STR_91(CODE[9]), STR_92(CODE[8]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[5]), STR_96(CODE[7]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[10]), STR_99(CODE[11]), 
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
;!		 -> STR_137(CODE[5]), STR_164(CODE[2]), STR_165(CODE[2]), STR_166(CODE[2]), 
;!		 -> STR_167(CODE[2]), STR_168(CODE[2]), STR_169(CODE[2]), STR_170(CODE[2]), 
;!		 -> STR_171(CODE[2]), STR_172(CODE[2]), STR_173(CODE[5]), STR_174(CODE[2]), 
;!		 -> STR_175(CODE[5]), STR_247(CODE[1]), STR_248(CODE[1]), STR_249(CODE[1]), 
;!		 -> STR_250(CODE[6]), STR_251(CODE[5]), STR_252(CODE[9]), STR_253(CODE[5]), 
;!		 -> STR_254(CODE[5]), STR_283(CODE[6]), STR_288(CODE[14]), STR_289(CODE[8]), 
;!		 -> STR_290(CODE[12]), STR_291(CODE[10]), STR_292(CODE[7]), STR_293(CODE[5]), 
;!		 -> STR_294(CODE[2]), STR_295(CODE[2]), STR_77(CODE[10]), STR_78(CODE[11]), 
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
;!    menu_draw_clock$1629	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_284(CODE[2]), STR_285(CODE[2]), 
;!
;!    menu_draw_clock$1633	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_286(CODE[2]), STR_287(CODE[2]), 
;!
;!    menu_draw_input$1538	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_242(CODE[2]), STR_243(CODE[2]), 
;!
;!    menu_draw_input$1542	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_244(CODE[2]), STR_245(CODE[2]), 
;!
;!    menu_draw_input@flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@flag_1528	PTR unsigned char  size(2) Largest target is 1
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
;!    menu_draw_input@opts_1524	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts_1524$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    menu_draw_setup$1562	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_253(CODE[5]), STR_254(CODE[5]), 
;!
;!    menu_draw_setup$1568	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_257(CODE[2]), STR_258(CODE[2]), 
;!
;!    menu_draw_setup$1576	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_261(CODE[2]), STR_262(CODE[2]), 
;!
;!    menu_draw_setup@F2719	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_247(CODE[1]), STR_248(CODE[1]), STR_249(CODE[1]), STR_250(CODE[6]), 
;!		 -> STR_251(CODE[5]), 
;!
;!    menu_draw_setup@label	PTR const unsigned char  size(2) Largest target is 6
;!		 -> STR_247(CODE[1]), STR_248(CODE[1]), STR_249(CODE[1]), STR_250(CODE[6]), 
;!		 -> STR_251(CODE[5]), 
;!
;!    menu_draw_setup@sensor_name	PTR const unsigned char  size(2) Largest target is 9
;!		 -> Fake(UNKNOWN), STR_252(CODE[9]), STR_253(CODE[5]), STR_254(CODE[5]), 
;!
;!    menu_draw_setup@setup_labels	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_247(CODE[1]), STR_248(CODE[1]), STR_249(CODE[1]), STR_250(CODE[6]), 
;!		 -> STR_251(CODE[5]), 
;!
;!    menu_draw_utility$1657	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_296(CODE[2]), STR_297(CODE[2]), 
;!
;!    menu_draw_utility$1661	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_298(CODE[2]), STR_299(CODE[2]), 
;!
;!    menu_handle_button@edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1748	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1783	PTR unsigned char  size(2) Largest target is 1
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
;!    menu_handle_button@opts_1749	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1749$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    menu_handle_button@opts_1784	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1784$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    menu_handle_encoder$3258	const PTR const unsigned char  size(2) Largest target is 9
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
;!		 -> STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), STR_277(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    rebuild_clock_menu$1585	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_265(CODE[8]), STR_266(CODE[9]), 
;!
;!    rebuild_clock_menu$1591	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_267(CODE[6]), STR_268(CODE[6]), STR_269(CODE[9]), 
;!
;!    rebuild_clock_menu$1592	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_268(CODE[6]), STR_269(CODE[9]), 
;!
;!    rebuild_input_menu$1367	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_178(CODE[8]), STR_179(CODE[9]), 
;!
;!    rebuild_input_menu$1381	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_188(CODE[6]), STR_189(CODE[6]), STR_190(CODE[9]), 
;!
;!    rebuild_input_menu$1382	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_189(CODE[6]), STR_190(CODE[9]), 
;!
;!    rebuild_input_menu$1388	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_191(CODE[6]), STR_192(CODE[6]), STR_193(CODE[9]), 
;!
;!    rebuild_input_menu$1389	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_192(CODE[6]), STR_193(CODE[9]), 
;!
;!    rebuild_input_menu$1395	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_194(CODE[6]), STR_195(CODE[6]), STR_196(CODE[9]), 
;!
;!    rebuild_input_menu$1396	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_195(CODE[6]), STR_196(CODE[9]), 
;!
;!    rebuild_input_menu$1400	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_197(CODE[5]), STR_198(CODE[5]), 
;!
;!    rebuild_input_menu$1414	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_204(CODE[6]), STR_205(CODE[6]), STR_206(CODE[9]), 
;!
;!    rebuild_input_menu$1415	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_205(CODE[6]), STR_206(CODE[9]), 
;!
;!    rebuild_input_menu$1419	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_207(CODE[5]), STR_208(CODE[5]), 
;!
;!    rebuild_input_menu$1424	PTR const unsigned char  size(2) Largest target is 8
;!		 -> STR_210(CODE[7]), STR_211(CODE[8]), 
;!
;!    rebuild_input_menu$1428	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_212(CODE[5]), STR_213(CODE[5]), 
;!
;!    rebuild_input_menu$1434	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_214(CODE[6]), STR_215(CODE[6]), STR_216(CODE[9]), 
;!
;!    rebuild_input_menu$1435	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_215(CODE[6]), STR_216(CODE[9]), 
;!
;!    rebuild_input_menu$1439	PTR const unsigned char  size(2) Largest target is 4
;!		 -> STR_217(CODE[2]), STR_218(CODE[4]), 
;!
;!    rtc_read_register@value	PTR unsigned char  size(2) Largest target is 1
;!		 -> main@status(BANK5[1]), 
;!
;!    rtc_read_time@time	PTR struct . size(2) Largest target is 7
;!		 -> init_datetime_editor@current_time(BANK1[7]), main@current_time(BANK7[7]), menu_handle_button@verify_time(BANK3[7]), 
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
;!		 -> STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), STR_277(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), 
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
;!		 -> original_value(BANK6[10]), STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), 
;!		 -> STR_277(CODE[1]), value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), 
;!		 -> value_clock_enable(BANK6[10]), value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), 
;!		 -> value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), 
;!		 -> value_high_tbp(BANK7[10]), value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), 
;!		 -> value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), 
;!		 -> value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), 
;!		 -> value_relay_pulse(BANK6[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), 
;!		 -> value_rlyslp(BANK7[10]), value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), 
;!		 -> value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 12
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), menu_item_options$option_count(CODE[1]), menu_update_time_value@value_buf(BANK0[6]), 
;!		 -> relay_high_edit_flag(COMRAM[1]), ?_sprintf(COMRAM[2]), sprintf@c(COMRAM[1]), STR_178(CODE[8]), 
;!		 -> STR_179(CODE[9]), STR_265(CODE[8]), STR_266(CODE[9]), STR_274(CODE[1]), 
;!		 -> STR_275(CODE[1]), STR_276(CODE[1]), STR_277(CODE[1]), STR_374(CODE[7]), 
;!		 -> STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), STR_45(CODE[1]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[9]), STR_48(CODE[5]), STR_49(CODE[5]), 
;!		 -> STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[7]), STR_53(CODE[8]), 
;!		 -> STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[4]), 
;!		 -> STR_58(CODE[5]), STR_59(CODE[1]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[2]), STR_63(CODE[4]), STR_64(CODE[1]), STR_65(CODE[1]), 
;!		 -> STR_66(CODE[1]), STR_67(CODE[5]), STR_68(CODE[5]), STR_69(CODE[1]), 
;!		 -> STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[6]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[9]), STR_75(CODE[1]), STR_76(CODE[1]), value_back(BANK5[5]), 
;!		 -> value_brightness(BANK6[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), value_contrast(BANK6[4]), 
;!		 -> value_display(BANK6[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), 
;!		 -> value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), value_high_temp(BANK7[10]), 
;!		 -> value_highbp(BANK6[10]), value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), 
;!		 -> value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), 
;!		 -> value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), value_rlyhigh(BANK6[10]), 
;!		 -> value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), value_scale20(BANK6[10]), 
;!		 -> value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 51
;!		 -> STR_1(CODE[48]), STR_11(CODE[28]), STR_138(CODE[35]), STR_14(CODE[28]), 
;!		 -> STR_140(CODE[45]), STR_141(CODE[25]), STR_142(CODE[3]), STR_143(CODE[3]), 
;!		 -> STR_147(CODE[51]), STR_148(CODE[27]), STR_152(CODE[47]), STR_154(CODE[13]), 
;!		 -> STR_155(CODE[13]), STR_156(CODE[13]), STR_157(CODE[15]), STR_158(CODE[15]), 
;!		 -> STR_159(CODE[13]), STR_160(CODE[13]), STR_161(CODE[13]), STR_162(CODE[15]), 
;!		 -> STR_163(CODE[15]), STR_177(CODE[3]), STR_181(CODE[6]), STR_182(CODE[6]), 
;!		 -> STR_183(CODE[5]), STR_184(CODE[10]), STR_185(CODE[5]), STR_186(CODE[10]), 
;!		 -> STR_187(CODE[10]), STR_200(CODE[6]), STR_201(CODE[6]), STR_202(CODE[3]), 
;!		 -> STR_203(CODE[10]), STR_219(CODE[6]), STR_220(CODE[6]), STR_221(CODE[5]), 
;!		 -> STR_222(CODE[10]), STR_224(CODE[10]), STR_225(CODE[48]), STR_227(CODE[29]), 
;!		 -> STR_228(CODE[7]), STR_229(CODE[9]), STR_239(CODE[9]), STR_25(CODE[37]), 
;!		 -> STR_263(CODE[35]), STR_264(CODE[3]), STR_27(CODE[17]), STR_270(CODE[10]), 
;!		 -> STR_272(CODE[46]), STR_273(CODE[29]), STR_278(CODE[3]), STR_279(CODE[10]), 
;!		 -> STR_28(CODE[35]), STR_280(CODE[3]), STR_281(CODE[3]), STR_282(CODE[10]), 
;!		 -> STR_29(CODE[23]), STR_3(CODE[27]), STR_30(CODE[17]), STR_300(CODE[37]), 
;!		 -> STR_301(CODE[23]), STR_302(CODE[32]), STR_303(CODE[37]), STR_304(CODE[28]), 
;!		 -> STR_305(CODE[35]), STR_306(CODE[26]), STR_307(CODE[20]), STR_308(CODE[25]), 
;!		 -> STR_309(CODE[28]), STR_310(CODE[26]), STR_311(CODE[10]), STR_312(CODE[10]), 
;!		 -> STR_313(CODE[32]), STR_314(CODE[42]), STR_315(CODE[26]), STR_316(CODE[10]), 
;!		 -> STR_318(CODE[32]), STR_319(CODE[34]), STR_320(CODE[45]), STR_322(CODE[44]), 
;!		 -> STR_326(CODE[26]), STR_327(CODE[10]), STR_329(CODE[6]), STR_330(CODE[6]), 
;!		 -> STR_331(CODE[5]), STR_332(CODE[5]), STR_333(CODE[6]), STR_334(CODE[6]), 
;!		 -> STR_335(CODE[5]), STR_336(CODE[6]), STR_337(CODE[6]), STR_338(CODE[5]), 
;!		 -> STR_340(CODE[38]), STR_341(CODE[32]), STR_348(CODE[46]), STR_355(CODE[28]), 
;!		 -> STR_361(CODE[50]), STR_362(CODE[40]), STR_6(CODE[39]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(BANK1[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK4[50]), main@buf_628(BANK4[50]), main@buf_633(BANK4[30]), main@buf_667(BANK5[50]), 
;!		 -> main@buf_672(BANK4[60]), main@buf_675(BANK5[40]), main@buf_714(BANK8[30]), main@time_buf(BANK4[60]), 
;!		 -> menu_draw_input@title(BANK0[10]), menu_handle_button@buf(BANK3[50]), menu_handle_button@buf_1713(BANK2[50]), menu_handle_button@buf_1718(BANK2[50]), 
;!		 -> menu_handle_button@buf_1720(BANK2[50]), menu_handle_button@buf_1722(BANK1[80]), menu_handle_button@buf_1741(BANK1[80]), menu_handle_button@buf_1754(BANK2[50]), 
;!		 -> menu_handle_button@buf_1780(BANK2[50]), menu_handle_button@buf_1790(BANK3[50]), menu_handle_button@buf_1799(BANK3[50]), menu_handle_button@buf_1809(BANK3[50]), 
;!		 -> menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1683(BANK1[50]), menu_handle_encoder@buf_1686(BANK1[50]), menu_update_datetime_display@date_buf(COMRAM[9]), 
;!		 -> menu_update_datetime_display@time_buf(COMRAM[9]), menu_update_edit_value@value_buf(BANK0[10]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), 
;!		 -> rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), rtc_set_time@buf(BANK0[80]), 
;!		 -> STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), STR_277(CODE[1]), 
;!		 -> trigger_relay_pulse@buf(BANK0[60]), value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), 
;!		 -> value_clock_enable(BANK6[10]), value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), 
;!		 -> value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), 
;!		 -> value_high_tbp(BANK7[10]), value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), 
;!		 -> value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), 
;!		 -> value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), 
;!		 -> value_relay_pulse(BANK6[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), 
;!		 -> value_rlyslp(BANK7[10]), value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), 
;!		 -> value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), STR_277(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_241(CODE[1]), STR_343(CODE[8]), STR_344(CODE[6]), STR_345(CODE[6]), 
;!		 -> STR_346(CODE[5]), STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), 
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
;!		 -> original_value(BANK6[10]), STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), 
;!		 -> STR_277(CODE[1]), value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), 
;!		 -> value_clock_enable(BANK6[10]), value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), 
;!		 -> value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), 
;!		 -> value_high_tbp(BANK7[10]), value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), 
;!		 -> value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), 
;!		 -> value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), 
;!		 -> value_relay_pulse(BANK6[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), 
;!		 -> value_rlyslp(BANK7[10]), value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), 
;!		 -> value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 12
;!		 -> menu_update_edit_value@value_buf(BANK0[10]), STR_180(CODE[9]), STR_188(CODE[6]), STR_189(CODE[6]), 
;!		 -> STR_190(CODE[9]), STR_191(CODE[6]), STR_192(CODE[6]), STR_193(CODE[9]), 
;!		 -> STR_194(CODE[6]), STR_195(CODE[6]), STR_196(CODE[9]), STR_197(CODE[5]), 
;!		 -> STR_198(CODE[5]), STR_199(CODE[5]), STR_204(CODE[6]), STR_205(CODE[6]), 
;!		 -> STR_206(CODE[9]), STR_207(CODE[5]), STR_208(CODE[5]), STR_209(CODE[5]), 
;!		 -> STR_210(CODE[7]), STR_211(CODE[8]), STR_212(CODE[5]), STR_213(CODE[5]), 
;!		 -> STR_214(CODE[6]), STR_215(CODE[6]), STR_216(CODE[9]), STR_217(CODE[2]), 
;!		 -> STR_218(CODE[4]), STR_223(CODE[4]), STR_240(CODE[6]), STR_267(CODE[6]), 
;!		 -> STR_268(CODE[6]), STR_269(CODE[9]), STR_271(CODE[5]), STR_274(CODE[1]), 
;!		 -> STR_275(CODE[1]), STR_276(CODE[1]), STR_277(CODE[1]), STR_42(CODE[9]), 
;!		 -> STR_43(CODE[8]), STR_44(CODE[1]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[9]), STR_48(CODE[5]), STR_49(CODE[5]), STR_50(CODE[1]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[7]), STR_53(CODE[8]), STR_54(CODE[1]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[4]), STR_58(CODE[5]), 
;!		 -> STR_59(CODE[1]), STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[2]), 
;!		 -> STR_63(CODE[4]), STR_64(CODE[1]), STR_65(CODE[1]), STR_66(CODE[1]), 
;!		 -> STR_67(CODE[5]), STR_68(CODE[5]), STR_69(CODE[1]), STR_70(CODE[1]), 
;!		 -> STR_71(CODE[1]), STR_72(CODE[6]), STR_73(CODE[6]), STR_74(CODE[9]), 
;!		 -> STR_75(CODE[1]), STR_76(CODE[1]), value_back(BANK5[5]), value_brightness(BANK6[4]), 
;!		 -> value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), value_contrast(BANK6[4]), value_display(BANK6[10]), 
;!		 -> value_enable(BANK6[10]), value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), 
;!		 -> value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), value_high_temp(BANK7[10]), value_highbp(BANK6[10]), 
;!		 -> value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), 
;!		 -> value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), 
;!		 -> value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), 
;!		 -> value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), value_scale20(BANK6[10]), value_scale4(BANK6[10]), 
;!		 -> value_sensor(BANK6[12]), value_slpbp(BANK6[10]), NULL(NULL[0]), 
;!
;!    strcpy@to	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_draw_utility@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), 
;!		 -> original_value(BANK6[10]), STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), 
;!		 -> STR_277(CODE[1]), value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), 
;!		 -> value_clock_enable(BANK6[10]), value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), 
;!		 -> value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), 
;!		 -> value_high_tbp(BANK7[10]), value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), 
;!		 -> value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), 
;!		 -> value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), 
;!		 -> value_relay_pulse(BANK6[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), 
;!		 -> value_rlyslp(BANK7[10]), value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), 
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
;!		 -> STR_137(CODE[5]), STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), 
;!		 -> STR_277(CODE[1]), STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), 
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
;!		 -> STR_98(CODE[10]), STR_99(CODE[11]), value_back(BANK5[5]), value_brightness(BANK6[4]), 
;!		 -> value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), value_contrast(BANK6[4]), value_display(BANK6[10]), 
;!		 -> value_enable(BANK6[10]), value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), 
;!		 -> value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), value_high_temp(BANK7[10]), value_highbp(BANK6[10]), 
;!		 -> value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), 
;!		 -> value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), 
;!		 -> value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), 
;!		 -> value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), value_scale20(BANK6[10]), value_scale4(BANK6[10]), 
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
;!		 -> STR_137(CODE[5]), STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), 
;!		 -> STR_277(CODE[1]), STR_42(CODE[9]), STR_43(CODE[8]), STR_44(CODE[1]), 
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
;!		 -> STR_98(CODE[10]), STR_99(CODE[11]), value_back(BANK5[5]), value_brightness(BANK6[4]), 
;!		 -> value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), value_contrast(BANK6[4]), value_display(BANK6[10]), 
;!		 -> value_enable(BANK6[10]), value_end_runtime(BANK6[10]), value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), 
;!		 -> value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), value_high_temp(BANK7[10]), value_highbp(BANK6[10]), 
;!		 -> value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), 
;!		 -> value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), 
;!		 -> value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), 
;!		 -> value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), value_scale20(BANK6[10]), value_scale4(BANK6[10]), 
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
;!		 -> STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), STR_277(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), 
;!		 -> value_scale20(BANK6[10]), value_scale4(BANK6[10]), value_sensor(BANK6[12]), value_slpbp(BANK6[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(BANK1[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK4[50]), main@buf_628(BANK4[50]), main@buf_633(BANK4[30]), main@buf_667(BANK5[50]), 
;!		 -> main@buf_672(BANK4[60]), main@buf_675(BANK5[40]), main@buf_714(BANK8[30]), main@time_buf(BANK4[60]), 
;!		 -> menu_handle_button@buf(BANK3[50]), menu_handle_button@buf_1713(BANK2[50]), menu_handle_button@buf_1718(BANK2[50]), menu_handle_button@buf_1720(BANK2[50]), 
;!		 -> menu_handle_button@buf_1722(BANK1[80]), menu_handle_button@buf_1741(BANK1[80]), menu_handle_button@buf_1754(BANK2[50]), menu_handle_button@buf_1780(BANK2[50]), 
;!		 -> menu_handle_button@buf_1790(BANK3[50]), menu_handle_button@buf_1799(BANK3[50]), menu_handle_button@buf_1809(BANK3[50]), menu_handle_encoder@buf(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1683(BANK1[50]), menu_handle_encoder@buf_1686(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), 
;!		 -> rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), rtc_set_time@buf(BANK0[80]), 
;!		 -> STR_10(CODE[42]), STR_12(CODE[38]), STR_13(CODE[34]), STR_139(CODE[29]), 
;!		 -> STR_15(CODE[28]), STR_153(CODE[26]), STR_16(CODE[23]), STR_19(CODE[22]), 
;!		 -> STR_2(CODE[42]), STR_20(CODE[19]), STR_21(CODE[24]), STR_22(CODE[22]), 
;!		 -> STR_226(CODE[31]), STR_23(CODE[22]), STR_24(CODE[19]), STR_26(CODE[16]), 
;!		 -> STR_317(CODE[31]), STR_321(CODE[36]), STR_323(CODE[16]), STR_324(CODE[27]), 
;!		 -> STR_325(CODE[24]), STR_328(CODE[27]), STR_33(CODE[22]), STR_339(CODE[53]), 
;!		 -> STR_34(CODE[20]), STR_342(CODE[25]), STR_347(CODE[20]), STR_349(CODE[37]), 
;!		 -> STR_35(CODE[21]), STR_350(CODE[37]), STR_351(CODE[25]), STR_352(CODE[26]), 
;!		 -> STR_353(CODE[20]), STR_354(CODE[21]), STR_356(CODE[29]), STR_357(CODE[28]), 
;!		 -> STR_358(CODE[30]), STR_359(CODE[28]), STR_36(CODE[33]), STR_360(CODE[32]), 
;!		 -> STR_363(CODE[22]), STR_364(CODE[28]), STR_365(CODE[37]), STR_366(CODE[31]), 
;!		 -> STR_367(CODE[39]), STR_368(CODE[31]), STR_369(CODE[49]), STR_370(CODE[38]), 
;!		 -> STR_371(CODE[43]), STR_372(CODE[38]), STR_373(CODE[29]), STR_39(CODE[36]), 
;!		 -> STR_4(CODE[29]), STR_40(CODE[20]), STR_41(CODE[21]), STR_5(CODE[23]), 
;!		 -> STR_7(CODE[20]), STR_8(CODE[16]), STR_9(CODE[37]), trigger_relay_pulse@buf(BANK0[60]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 80
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_datetime_editor@buf(BANK1[80]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK4[50]), main@buf_628(BANK4[50]), main@buf_633(BANK4[30]), main@buf_667(BANK5[50]), 
;!		 -> main@buf_672(BANK4[60]), main@buf_675(BANK5[40]), main@buf_714(BANK8[30]), main@time_buf(BANK4[60]), 
;!		 -> menu_handle_button@buf(BANK3[50]), menu_handle_button@buf_1713(BANK2[50]), menu_handle_button@buf_1718(BANK2[50]), menu_handle_button@buf_1720(BANK2[50]), 
;!		 -> menu_handle_button@buf_1722(BANK1[80]), menu_handle_button@buf_1741(BANK1[80]), menu_handle_button@buf_1754(BANK2[50]), menu_handle_button@buf_1780(BANK2[50]), 
;!		 -> menu_handle_button@buf_1790(BANK3[50]), menu_handle_button@buf_1799(BANK3[50]), menu_handle_button@buf_1809(BANK3[50]), menu_handle_encoder@buf(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1683(BANK1[50]), menu_handle_encoder@buf_1686(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), 
;!		 -> rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), rtc_read_time@debug_buf(BANK0[80]), rtc_set_time@buf(BANK0[80]), 
;!		 -> STR_10(CODE[42]), STR_12(CODE[38]), STR_13(CODE[34]), STR_139(CODE[29]), 
;!		 -> STR_15(CODE[28]), STR_153(CODE[26]), STR_16(CODE[23]), STR_19(CODE[22]), 
;!		 -> STR_2(CODE[42]), STR_20(CODE[19]), STR_21(CODE[24]), STR_22(CODE[22]), 
;!		 -> STR_226(CODE[31]), STR_23(CODE[22]), STR_24(CODE[19]), STR_26(CODE[16]), 
;!		 -> STR_317(CODE[31]), STR_321(CODE[36]), STR_323(CODE[16]), STR_324(CODE[27]), 
;!		 -> STR_325(CODE[24]), STR_328(CODE[27]), STR_33(CODE[22]), STR_339(CODE[53]), 
;!		 -> STR_34(CODE[20]), STR_342(CODE[25]), STR_347(CODE[20]), STR_349(CODE[37]), 
;!		 -> STR_35(CODE[21]), STR_350(CODE[37]), STR_351(CODE[25]), STR_352(CODE[26]), 
;!		 -> STR_353(CODE[20]), STR_354(CODE[21]), STR_356(CODE[29]), STR_357(CODE[28]), 
;!		 -> STR_358(CODE[30]), STR_359(CODE[28]), STR_36(CODE[33]), STR_360(CODE[32]), 
;!		 -> STR_363(CODE[22]), STR_364(CODE[28]), STR_365(CODE[37]), STR_366(CODE[31]), 
;!		 -> STR_367(CODE[39]), STR_368(CODE[31]), STR_369(CODE[49]), STR_370(CODE[38]), 
;!		 -> STR_371(CODE[43]), STR_372(CODE[38]), STR_373(CODE[29]), STR_39(CODE[36]), 
;!		 -> STR_4(CODE[29]), STR_40(CODE[20]), STR_41(CODE[21]), STR_5(CODE[23]), 
;!		 -> STR_7(CODE[20]), STR_8(CODE[16]), STR_9(CODE[37]), trigger_relay_pulse@buf(BANK0[60]), 
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
;!		 -> STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), STR_277(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), 
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
;!		 -> STR_274(CODE[1]), STR_275(CODE[1]), STR_276(CODE[1]), STR_277(CODE[1]), 
;!		 -> value_back(BANK5[5]), value_brightness(BANK6[4]), value_clock_display(BANK7[10]), value_clock_enable(BANK6[10]), 
;!		 -> value_contrast(BANK6[4]), value_display(BANK6[10]), value_enable(BANK6[10]), value_end_runtime(BANK6[10]), 
;!		 -> value_flow_type(BANK6[10]), value_flow_units(BANK7[10]), value_hi_pressure(BANK7[10]), value_high_tbp(BANK7[10]), 
;!		 -> value_high_temp(BANK7[10]), value_highbp(BANK6[10]), value_log_entries(BANK6[6]), value_low_flow(BANK7[10]), 
;!		 -> value_low_flow_bp(BANK7[10]), value_low_pressure(BANK7[10]), value_menu_timeout(BANK6[6]), value_no_flow(BANK7[10]), 
;!		 -> value_no_flow_bp(BANK7[10]), value_plpbp(BANK6[10]), value_pwr_fail(BANK6[6]), value_relay_pulse(BANK6[10]), 
;!		 -> value_rlyhigh(BANK6[10]), value_rlylow(BANK6[10]), value_rlyplp(BANK6[10]), value_rlyslp(BANK7[10]), 
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
;! (0) _main                                               410   410      0 1928183
;!                                            221 BANK3      2     2      0
;!                                              0 BANK4    256   256      0
;!                                              0 BANK5     96    96      0
;!                                              0 BANK6      2     2      0
;!                                              0 BANK7      7     7      0
;!                                              0 BANK8     30    30      0
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
;! (1) _menu_update_numeric_value                           28    28      0   10482
;!                                             21 COMRAM    28    28      0
;!                   _is_numeric_field
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_edit_value                              31    31      0   45739
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
;! (1) _menu_handle_encoder                                172   170      2  484789
;!                                             87 COMRAM     2     0      2
;!                                            111 BANK0      6     6      0
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
;! (2) _handle_time_rotation                                53    53      0   37831
;!                                              0 BANK0     53    53      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _handle_numeric_rotation                             57    57      0   38184
;!                                              0 BANK0     57    57      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                 661   661      0  804928
;!                                            111 BANK0     15    15      0
;!                                             87 BANK1    169   169      0
;!                                              0 BANK2    256   256      0
;!                                              0 BANK3    221   221      0
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
;! (2) _trigger_relay_pulse                                 61    61      0   37763
;!                                              0 BANK0     61    61      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rtc_set_time                                        90    88      2   40501
;!                                             64 COMRAM     2     0      2
;!                                              0 BANK0     88    88      0
;!                         _dec_to_bcd
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (3) _dec_to_bcd                                           3     3      0    1795
;!                                             18 COMRAM     3     3      0
;!                            ___lbdiv
;!                            ___lbmod
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_input_menu                                  90    90      0   54201
;!                                             64 COMRAM     1     1      0
;!                                              0 BANK0     89    89      0
;!                            ___lwdiv
;!                            ___lwmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_clock_menu                                  58    58      0   48294
;!                                             64 COMRAM     2     2      0
;!                                              0 BANK0     56    56      0
;!                            ___lbdiv
;!                            ___lbmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_time_value                             113   113      0   88036
;!                                              0 BANK0    111   111      0
;!                            ___lbdiv
;!                            ___lbmod
;!                      _is_time_field
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                    _menu_draw_clock
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_clock                                     32    32      0   38400
;!                                             25 COMRAM    32    32      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_utility                                   34    34      0   89373
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
;! (3) _menu_update_datetime_display                        18    18      0   50511
;!                                             64 COMRAM    18    18      0
;!                     _lcd_clear_line
;!                       _lcd_print_at
;!                            _sprintf
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_setup                                     23    23      0   30655
;!                                             25 COMRAM    23    23      0
;!                          _lcd_clear
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_options                                    2     2      0   30061
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
;! (2) _menu_draw_input                                     51    51      0   77030
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
;! (3) _lcd_print_at                                         4     1      3   14563
;!                                             21 COMRAM     4     1      3
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                             _strlen (ARG)
;! ---------------------------------------------------------------------------------
;! (3) _lcd_clear_line                                       1     1      0    7481
;!                                             21 COMRAM     1     1      0
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_set_cursor                                       3     2      1    3059
;!                                             18 COMRAM     3     2      1
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (4) _lcd_print                                            2     0      2    4391
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
;! (2) _init_time_editor                                    63    60      3   43870
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
;! (2) _init_datetime_editor                                87    87      0   77109
;!                                              0 BANK1     87    87      0
;!                      _rtc_read_time
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _rtc_read_time                                       90    88      2   39196
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
;! (2) _beep                                                 5     3      2    2948
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
;! (1) _handle_utility_numeric_rotation                      1     1      0   35294
;!                                             71 COMRAM     1     1      0
;!               _rebuild_utility_menu
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_utility_menu                                 7     7      0   35263
;!                                             64 COMRAM     7     7      0
;!                            ___lbdiv
;!                            ___lbmod
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;! ---------------------------------------------------------------------------------
;! (1) _sprintf                                             42    24     18   27827
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
;! (2) ___lbmod                                              4     3      1     862
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) ___lbdiv                                              4     3      1     871
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
;! (1) _ad7994_init                                          1     1      0    9845
;!                                             19 COMRAM     1     1      0
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    9678
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
;!BANK8              100     1E      1E      21       11.7%
;!BITBANK7           100      0       0      18        0.0%
;!BANK7              100      7      FF      19       99.6%
;!BITBANK6           100      0       0      16        0.0%
;!BANK6              100      2      FF      17       99.6%
;!BITBANK5           100      0       0      14        0.0%
;!BANK5              100     60     100      15      100.0%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100    100     100      13      100.0%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100     DF      DF      11       87.1%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100    100     100       9      100.0%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100    100     100       7      100.0%
;!BITBANK15           80      0       0      34        0.0%
;!BANK15              80      0       0      35        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80     7E      80       5      100.0%
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
;!ABS                  0      0     7EB      50        0.0%
;!DATA                 0      0     96B       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 174 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            30    0[BANK8 ] unsigned char [30]
;;  current_even    1   94[BANK5 ] unsigned char 
;;  time_buf       60    0[BANK4 ] unsigned char [60]
;;  buf            40   50[BANK5 ] unsigned char [40]
;;  delta           2    0[BANK6 ] int 
;;  buf            60   60[BANK4 ] unsigned char [60]
;;  buf            50    0[BANK5 ] unsigned char [50]
;;  buf            50  170[BANK4 ] unsigned char [50]
;;  lcd_buf        17    0        unsigned char [17]
;;  buf            30  220[BANK4 ] unsigned char [30]
;;  status          1   95[BANK5 ] unsigned char 
;;  buf            50  120[BANK4 ] unsigned char [50]
;;  current_time    7    0[BANK7 ] struct .
;;  last_encoder    2   92[BANK5 ] int 
;;  adc_ch3         2  254[BANK4 ] unsigned int 
;;  adc_ch2         2  252[BANK4 ] unsigned int 
;;  adc_ch1         2  250[BANK4 ] unsigned int 
;;  adc_error       1   91[BANK5 ] unsigned char 
;;  last_button     1   90[BANK5 ] unsigned char 
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
;;      Locals:         0       0       0       0       0     256      96       2       7      30       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       2       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       2     256      96       2       7      30       0       0       0       0       0       0       0
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
	
l16536:
	call	_system_init	;wreg free
	line	179
	
l16538:
	call	_eeprom_init	;wreg free
	line	186
	
l16540:; BSR set to: 5

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
	
l16542:
	call	_uart_init	;wreg free
	line	190
	
l16544:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	192
	
l16546:
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
	
l16548:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	196
	
l16550:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	197
	
l16552:
	call	_i2c_init	;wreg free
	line	198
	
l16554:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	201
	
l16556:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	202
	
l16558:
	call	_rtc_init	;wreg free
	iorlw	0
	btfss	status,2
	goto	u22751
	goto	u22750
u22751:
	goto	l16572
u22750:
	line	204
	
l16560:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	208
	
l16562:
		movlw	low(main@status)
	movwf	((c:rtc_read_register@value))^00h,c
	movlw	high(main@status)
	movwf	((c:rtc_read_register@value+1))^00h,c

	movlw	(0Fh)&0ffh
	
	call	_rtc_read_register
	iorlw	0
	btfss	status,2
	goto	u22761
	goto	u22760
u22761:
	goto	l172
u22760:
	line	211
	
l16564:
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
	
l16566:
		movlw	low(main@buf_628)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_628)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	214
	
l16568:
	movlb	5	; () banked
	
	btfss	((main@status))&0ffh,(7)&7
	goto	u22771
	goto	u22770
u22771:
	goto	l172
u22770:
	line	216
	
l16570:; BSR set to: 5

		movlw	low(STR_12)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_12)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l172
	line	222
	
l16572:
		movlw	low(STR_13)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_13)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	223
	
l172:
	line	246
	call	_ad7994_init	;wreg free
	movlb	5	; () banked
	movwf	((main@adc_error))&0ffh
	line	247
	
l16574:; BSR set to: 5

	movf	((main@adc_error))&0ffh,w
	btfsc	status,2
	goto	u22781
	goto	u22780
u22781:
	goto	l16580
u22780:
	line	250
	
l16576:; BSR set to: 5

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
	
l16578:
		movlw	low(main@buf_633)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_633)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	254
	
l16580:
	call	_encoder_init	;wreg free
	line	255
	
l16582:
	call	_menu_init	;wreg free
	line	256
	
l16584:; BSR set to: 5

	call	_lcd_init	;wreg free
	line	258
	
l16586:
		movlw	low(STR_15)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	259
	
l16588:
		movlw	low(STR_16)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_16)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	261
	
l16590:
	call	_lcd_clear	;wreg free
	line	262
	
l16592:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	263
	
l16594:
		movlw	low(STR_17)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_17)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	264
	
l16596:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	265
	
l16598:
		movlw	low(STR_18)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_18)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	267
	
l16600:
		movlw	low(STR_19)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_19)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	268
	
l16602:
		movlw	low(STR_20)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_20)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	269
	
l16604:
		movlw	low(STR_21)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_21)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	271
	
l16606:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	272
	
l16608:
	asmopt push
asmopt off
movlw  5
	movlb	3	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	15
movwf	(??_main+0+0)&0ffh
	movlw	241
u23317:
decfsz	wreg,f
	bra	u23317
	decfsz	(??_main+0+0)&0ffh,f
	bra	u23317
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u23317
asmopt pop

	line	273
	
l16610:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	275
	
l16612:
		movlw	low(STR_22)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_22)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	276
	
l16614:
		movlw	low(STR_23)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_23)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	282
	
l16616:
	movlb	5	; () banked
	setf	((_current_menu))&0ffh
	line	283
	
l16618:; BSR set to: 5

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	285
	
l16620:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	286
	
l16622:
		movlw	low(STR_24)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_24)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	289
	
l16624:
	movlw	high(0)
	movlb	5	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	290
	
l16626:; BSR set to: 5

	movlw	low(0)
	movwf	((main@last_button))&0ffh
	line	304
	
l16628:
	movlb	5	; () banked
	incf	((main@sample_counter))&0ffh
	line	306
	
l16630:; BSR set to: 5

		movlw	0Ah-1
	cpfsgt	((main@sample_counter))&0ffh
	goto	u22791
	goto	u22790

u22791:
	goto	l16652
u22790:
	line	308
	
l16632:; BSR set to: 5

	movlw	low(0)
	movwf	((main@sample_counter))&0ffh
	line	311
	
l16634:; BSR set to: 5

		movlw	low(main@current_time)
	movwf	((c:rtc_read_time@time))^00h,c
	movlw	high(main@current_time)
	movwf	((c:rtc_read_time@time+1))^00h,c

	call	_rtc_read_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u22801
	goto	u22800
u22801:
	goto	l16640
u22800:
	line	316
	
l16636:
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
	
l16638:
		movlw	low(main@time_buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@time_buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	318
	goto	l16642
	line	321
	
l16640:
		movlw	low(STR_26)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_26)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	325
	
l16642:
	movlw	(01h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch1)
	movff	1+?_ad7994_read_channel,(main@adc_ch1+1)
	line	326
	
l16644:
	movlw	(02h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch2)
	movff	1+?_ad7994_read_channel,(main@adc_ch2+1)
	line	327
	
l16646:
	movlw	(03h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch3)
	movff	1+?_ad7994_read_channel,(main@adc_ch3+1)
	line	331
	
l16648:
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
	
l16650:
		movlw	low(main@buf_667)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_667)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	337
	
l16652:
	asmopt push
asmopt off
movlw  3
	movlb	3	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	8
movwf	(??_main+0+0)&0ffh
	movlw	119
u23327:
decfsz	wreg,f
	bra	u23327
	decfsz	(??_main+0+0)&0ffh,f
	bra	u23327
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u23327
asmopt pop

	line	342
	
l16654:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	354
	
l16656:
	movlb	5	; () banked
	movf	((main@last_relay_state))&0ffh,w
	movlb	0	; () banked
xorwf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u22811
	goto	u22810

u22811:
	goto	l16660
u22810:
	
l16658:; BSR set to: 0

	movlb	5	; () banked
	movf	((main@last_relay_counter))&0ffh,w
xorwf	((_relay_counter))&0ffh,w	;volatile
	bnz	u22820
movf	((main@last_relay_counter+1))&0ffh,w
xorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u22821
	goto	u22820

u22821:
	goto	l16668
u22820:
	line	357
	
l16660:
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
	
l16662:
		movlw	low(main@buf_672)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_672)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	359
	
l16664:
	movff	(_relay_state),(main@last_relay_state)	;volatile
	line	360
	
l16666:
	movff	(_relay_counter),(main@last_relay_counter)	;volatile
	movff	(_relay_counter+1),(main@last_relay_counter+1)	;volatile
	line	365
	
l16668:
	movlb	5	; () banked
	movf	((main@last_encoder))&0ffh,w
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u22830
movf	((main@last_encoder+1))&0ffh,w
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u22831
	goto	u22830

u22831:
	goto	l16758
u22830:
	line	367
	
l16670:; BSR set to: 5

	movf	((main@last_encoder))&0ffh,w
	subwf	((_encoder_count))&0ffh,w	;volatile
	movlb	6	; () banked
	movwf	((main@delta))&0ffh
	movlb	5	; () banked
	movf	((main@last_encoder+1))&0ffh,w
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movlb	6	; () banked
	movwf	1+((main@delta))&0ffh
	line	370
	
l16672:; BSR set to: 6

	movlw	high(01h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	373
	
l16674:
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
	
l16676:
		movlw	low(main@buf_675)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_675)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	376
	
l16678:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	379
	
l16680:
	movlw	high(0Ah)
	movlb	5	; () banked
	movwf	((main@encoder_activity_timer+1))&0ffh
	movlw	low(0Ah)
	movwf	((main@encoder_activity_timer))&0ffh
	line	382
	
l16682:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22841
	goto	u22840
u22841:
	goto	l196
u22840:
	line	384
	
l16684:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	385
	
l196:; BSR set to: 5

	line	389
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22851
	goto	u22850
u22851:
	goto	l16698
u22850:
	
l16686:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22861
	goto	u22860

u22861:
	goto	l16698
u22860:
	
l16688:; BSR set to: 5

	movf	(0+(_menu+01Eh))&0ffh,w
	btfss	status,2
	goto	u22871
	goto	u22870
u22871:
	goto	l16698
u22870:
	line	391
	
l16690:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22881
	goto	u22880

u22881:
	goto	l16694
u22880:
	line	393
	
l16692:; BSR set to: 5

	movlb	6	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_time_rotation
	line	394
	call	_menu_update_time_value	;wreg free
	line	395
	goto	l16732
	line	396
	
l16694:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22891
	goto	u22890

u22891:
	goto	l16732
u22890:
	line	399
	
l16696:; BSR set to: 5

	movlb	6	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_utility_numeric_rotation
	line	401
	call	_menu_draw_utility	;wreg free
	goto	l16732
	line	404
	
l16698:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22901
	goto	u22900
u22901:
	goto	l16708
u22900:
	
l16700:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22911
	goto	u22910

u22911:
	goto	l16708
u22910:
	
l16702:; BSR set to: 5

	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u22921
	goto	u22920
u22921:
	goto	l16708
u22920:
	line	407
	
l16704:; BSR set to: 5

	movlb	6	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_datetime_rotation
	line	408
	
l16706:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	409
	goto	l16732
	line	410
	
l16708:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22931
	goto	u22930
u22931:
	goto	l16722
u22930:
	
l16710:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22941
	goto	u22940

u22941:
	goto	l16722
u22940:
	line	412
	
l16712:; BSR set to: 5

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
	goto	u22951
	goto	u22950
u22951:
	goto	l16716
u22950:
	line	415
	
l16714:
	movlb	6	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_numeric_rotation
	line	416
	goto	l16732
	line	417
	
l16716:
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
	goto	u22961
	goto	u22960
u22961:
	goto	l16720
u22960:
	line	420
	
l16718:
	movlb	6	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_time_rotation
	line	421
	call	_menu_update_time_value	;wreg free
	line	422
	goto	l16732
	line	426
	
l16720:
	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	goto	l16732
	line	429
	
l16722:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22971
	goto	u22970
u22971:
	goto	l16720
u22970:
	
l16724:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22981
	goto	u22980

u22981:
	goto	l16720
u22980:
	line	432
	
l16726:; BSR set to: 5

	movlb	6	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_datetime_rotation
	goto	l16706
	line	442
	
l16732:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u22991
	goto	u22990
u22991:
	goto	l16746
u22990:
	
l16734:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u23001
	goto	u23000

u23001:
	goto	l16746
u23000:
	line	445
	
l16736:; BSR set to: 5

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
	goto	u23011
	goto	u23010
u23011:
	goto	l16740
u23010:
	line	448
	
l16738:
	call	_menu_update_numeric_value	;wreg free
	line	449
	goto	l16758
	line	450
	
l16740:
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
	goto	u23021
	goto	u23020
u23021:
	goto	l16744
u23020:
	line	453
	
l16742:
	call	_menu_update_time_value	;wreg free
	line	454
	goto	l16758
	line	458
	
l16744:
	call	_menu_update_edit_value	;wreg free
	goto	l16758
	line	464
	
l16746:; BSR set to: 5

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u23031
	goto	u23030
u23031:
	goto	l16750
u23030:
	line	466
	
l16748:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	467
	goto	l16758
	line	468
	
l16750:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u23041
	goto	u23040

u23041:
	goto	l16754
u23040:
	line	470
	
l16752:; BSR set to: 5

	call	_menu_draw_input	;wreg free
	line	471
	goto	l16758
	line	472
	
l16754:; BSR set to: 5

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u23051
	goto	u23050

u23051:
	goto	l16758
u23050:
	line	474
	
l16756:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	480
	
l16758:
	movlb	5	; () banked
	movf	((main@last_button))&0ffh,w
xorwf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u23061
	goto	u23060

u23061:
	goto	l16798
u23060:
	line	482
	
l16760:; BSR set to: 5

	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u23071
	goto	u23070
u23071:
	goto	l16794
u23070:
	line	484
	
l16762:; BSR set to: 5

	movff	(_button_event),(main@current_event)	;volatile
	line	485
	
l16764:; BSR set to: 5

	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	488
	
l16766:; BSR set to: 5

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
	line	489
	
l16768:
		movlw	low(main@buf_714)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_714)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	492
	
l16770:
	movlb	5	; () banked
		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u23081
	goto	u23080

u23081:
	goto	l16780
u23080:
	line	494
	
l16772:; BSR set to: 5

		decf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u23091
	goto	u23090

u23091:
	goto	l16794
u23090:
	line	496
	
l16774:; BSR set to: 5

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	497
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	498
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	499
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	500
	
l16776:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	501
	
l16778:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l16794
	line	507
	
l16780:; BSR set to: 5

	movf	((main@current_event))&0ffh,w
	
	call	_menu_handle_button
	line	510
	
l16782:
	movlb	5	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u23101
	goto	u23100
u23101:
	goto	l16786
u23100:
	line	511
	
l16784:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	goto	l16794
	line	512
	
l16786:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u23111
	goto	u23110

u23111:
	goto	l16790
u23110:
	line	513
	
l16788:; BSR set to: 5

	call	_menu_draw_input	;wreg free
	goto	l16794
	line	514
	
l16790:; BSR set to: 5

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u23121
	goto	u23120

u23121:
	goto	l16794
u23120:
	line	515
	
l16792:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	518
	
l16794:
	movff	(_button_event),(main@last_button)	;volatile
	line	519
	
l16796:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	524
	
l16798:; BSR set to: 5

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u23131
	goto	u23130

u23131:
	goto	l16814
u23130:
	
l16800:; BSR set to: 5

		incf	((main@last_menu_state))&0ffh,w
	btfsc	status,2
	goto	u23141
	goto	u23140

u23141:
	goto	l16814
u23140:
	line	527
	
l16802:; BSR set to: 5

	call	_lcd_clear	;wreg free
	line	528
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	529
	
l16804:
		movlw	low(STR_31)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_31)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	530
	
l16806:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	531
		movlw	low(STR_32)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_32)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	532
		movlw	low(STR_33)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_33)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	534
		movlw	low(STR_34)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_34)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	535
	
l16808:
	call	_save_current_config	;wreg free
	line	536
	
l16810:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	line	537
	
l16812:; BSR set to: 5

		movlw	low(STR_35)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_35)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	539
	
l16814:
	movff	(_current_menu),(main@last_menu_state)
	line	542
	
l16816:
	movlb	5	; () banked
	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfsc	status,2
	goto	u23151
	goto	u23150

u23151:
	goto	l16820
u23150:
	line	544
	
l16818:; BSR set to: 5

	decf	((main@encoder_activity_timer))&0ffh
	btfss	status,0
	decf	((main@encoder_activity_timer+1))&0ffh
	line	548
	
l16820:; BSR set to: 5

	movlw	low(01h)
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	549
	
l16822:; BSR set to: 5

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	iorwf	((main@blink_timer+1))&0ffh,w
	bnz	u23160
	movlw	10
	subwf	 ((main@blink_timer))&0ffh,w
	btfss	status,0
	goto	u23161
	goto	u23160

u23161:
	goto	l16864
u23160:
	line	551
	
l16824:; BSR set to: 5

	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	552
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u23171
	goto	u23170
u23171:
	goto	l16862
u23170:
	line	555
	
l16826:; BSR set to: 5

	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfss	status,2
	goto	u23181
	goto	u23180

u23181:
	goto	l16864
u23180:
	line	557
	
l16828:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u23191
	goto	u23190
u23191:
	movlw	1
	goto	u23200
u23190:
	movlw	0
u23200:
	movwf	(0+(_menu+05h))&0ffh
	line	561
	goto	l16860
	line	564
	
l16830:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	565
	goto	l16864
	line	569
	
l16832:; BSR set to: 5

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
	goto	u23211
	goto	u23210
u23211:
	goto	l16836
u23210:
	line	571
	
l16834:
	call	_menu_update_numeric_value	;wreg free
	line	572
	goto	l16864
	line	573
	
l16836:
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
	goto	u23221
	goto	u23220
u23221:
	goto	l16840
u23220:
	line	575
	
l16838:
	call	_menu_update_time_value	;wreg free
	line	576
	goto	l16864
	line	580
	
l16840:
	call	_menu_draw_input	;wreg free
	goto	l16864
	line	585
	
l16842:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	586
	goto	l16864
	line	588
	
l16844:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u23231
	goto	u23230

u23231:
	goto	l16848
u23230:
	goto	l16838
	line	594
	
l16848:; BSR set to: 5

	call	_menu_draw_clock	;wreg free
	goto	l16864
	line	598
	
l16850:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u23241
	goto	u23240

u23241:
	goto	l16856
u23240:
	
l16852:; BSR set to: 5

	movf	(0+(_menu+01Eh))&0ffh,w
	btfss	status,2
	goto	u23251
	goto	u23250
u23251:
	goto	l16856
u23250:
	goto	l16838
	line	604
	
l16856:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	goto	l16864
	line	561
	
l16860:; BSR set to: 5

	movf	((_current_menu))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l16830
	xorlw	1^0	; case 1
	skipnz
	goto	l16832
	xorlw	2^1	; case 2
	skipnz
	goto	l16842
	xorlw	3^2	; case 3
	skipnz
	goto	l16844
	xorlw	4^3	; case 4
	skipnz
	goto	l16850
	goto	l16864

	line	612
	
l16862:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	626
	
l16864:
		movlw	05h-0
	movlb	5	; () banked
	cpfslt	((_current_menu))&0ffh
	goto	u23261
	goto	u23260

u23261:
	goto	l16898
u23260:
	line	628
	
l16866:; BSR set to: 5

	movf	((_menu_timeout_flag))&0ffh,w	;volatile
	btfss	status,2
	goto	u23271
	goto	u23270
u23271:
	goto	l16898
u23270:
	line	630
	
l16868:; BSR set to: 5

		movlw	low(STR_36)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_36)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	633
	
l16870:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	634
	
l16872:
	asmopt push
asmopt off
movlw  3
	movlb	3	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	8
movwf	(??_main+0+0)&0ffh
	movlw	119
u23337:
decfsz	wreg,f
	bra	u23337
	decfsz	(??_main+0+0)&0ffh,f
	bra	u23337
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u23337
asmopt pop

	line	635
	
l16874:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	638
	
l16876:
	movlb	5	; () banked
	setf	((_current_menu))&0ffh
	line	639
	
l16878:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	640
	
l16880:; BSR set to: 5

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	641
	
l16882:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	644
	
l16884:; BSR set to: 5

	call	_lcd_clear	;wreg free
	line	645
	
l16886:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	646
	
l16888:
		movlw	low(STR_37)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_37)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	647
	
l16890:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	648
	
l16892:
		movlw	low(STR_38)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_38)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	651
	
l16894:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	652
	
l16896:; BSR set to: 5

	movlw	high(0)
	movwf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_menu_timeout_timer))^00h,c	;volatile
	line	657
	
l16898:; BSR set to: 5

	movf	((_long_press_beep_flag))&0ffh,w	;volatile
	btfsc	status,2
	goto	u23281
	goto	u23280
u23281:
	goto	l16906
u23280:
	line	659
	
l16900:; BSR set to: 5

	movlw	low(0)
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	line	660
	
l16902:; BSR set to: 5

	movlw	high(01F4h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01F4h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	661
	
l16904:
		movlw	low(STR_39)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_39)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	666
	
l16906:
	movlb	5	; () banked
	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u23291
	goto	u23290
u23291:
	goto	l16918
u23290:
	
l16908:; BSR set to: 5

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u23301
	goto	u23300

u23301:
	goto	l16918
u23300:
	line	668
	
l16910:; BSR set to: 5

		movlw	low(STR_40)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_40)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	669
	
l16912:
	call	_save_current_config	;wreg free
	line	670
	
l16914:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	line	671
	
l16916:; BSR set to: 5

		movlw	low(STR_41)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_41)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	676
	
l16918:
	asmopt push
asmopt off
	movlw	133
u23347:
decfsz	wreg,f
	bra	u23347
	nop
asmopt pop

	goto	l16628
	global	start
	goto	start
	callstack 0
	line	678
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
	
l14788:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	56
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	58
	
l14790:
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
	
l14792:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	92
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	95
	
l139:
	line	94
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u19871
	goto	u19870
u19871:
	goto	l139
u19870:
	line	97
	
l14794:
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
	
l14796:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	104
	
l14798:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	106
	
l14800:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	107
	
l14802:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	108
	
l14804:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	109
	
l14806:
	bsf	((c:3987))^0f00h,c,0	;volatile
	line	110
	
l14808:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	112
	
l14810:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	113
	
l14812:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	116
	
l14814:
	bcf	((c:3988))^0f00h,c,1	;volatile
	line	117
	
l14816:
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
	
l14886:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19951
	goto	u19950
u19951:
	goto	l14892
u19950:
	line	27
	
l14888:
	movlw	(01h)&0ffh
	goto	l1746
	line	28
	
l14892:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19961
	goto	u19960
u19961:
	goto	l14898
u19960:
	goto	l14888
	line	30
	
l14898:
	movf	((c:rtc_read_register@reg))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19971
	goto	u19970
u19971:
	goto	l14904
u19970:
	goto	l14888
	line	33
	
l14904:
	call	_i2c_restart	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19981
	goto	u19980
u19981:
	goto	l14910
u19980:
	goto	l14888
	line	35
	
l14910:
	movlw	(0D1h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19991
	goto	u19990
u19991:
	goto	l14916
u19990:
	goto	l14888
	line	37
	
l14916:
	movlw	(0)&0ffh
	
	call	_i2c_read
	movff	(c:rtc_read_register@value),fsr2l
	movff	(c:rtc_read_register@value+1),fsr2h
	movwf	indf2,c

	line	38
	
l14918:
	call	_i2c_stop	;wreg free
	line	39
	
l14920:
	movlw	(0)&0ffh
	line	40
	
l1746:
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
	
l14740:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19801
	goto	u19800
u19801:
	goto	l1686
u19800:
	line	82
	
l14742:
	movlw	(01h)&0ffh
	goto	l1687
	
l1686:
	line	84
	bsf	((c:4037))^0f00h,c,1	;volatile
	line	86
	
l14746:
	movlw	high(03E8h)
	movwf	((c:i2c_restart@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_restart@timeout))^00h,c
	line	87
	goto	l1688
	line	89
	
l14748:
	decf	((c:i2c_restart@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_restart@timeout+1))^00h,c
	movf	((c:i2c_restart@timeout))^00h,c,w
iorwf	((c:i2c_restart@timeout+1))^00h,c,w
	btfss	status,2
	goto	u19811
	goto	u19810

u19811:
	goto	l1688
u19810:
	goto	l14742
	line	91
	
l1688:
	line	87
	btfsc	((c:4037))^0f00h,c,1	;volatile
	goto	u19821
	goto	u19820
u19821:
	goto	l14748
u19820:
	line	93
	
l14754:
	movlw	(0)&0ffh
	line	94
	
l1687:
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
	
l14874:
	asmopt push
asmopt off
movlw  21
movwf	(??_rtc_init+0+0+1)^00h,c
movlw	75
movwf	(??_rtc_init+0+0)^00h,c
	movlw	190
u23357:
decfsz	wreg,f
	bra	u23357
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u23357
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u23357
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
u23367:
decfsz	wreg,f
	bra	u23367
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u23367
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u23367
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
u23377:
decfsz	wreg,f
	bra	u23377
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u23377
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u23377
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
u23387:
decfsz	wreg,f
	bra	u23387
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u23387
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u23387
	nop2
asmopt pop

	line	54
	
l14876:
	movlw	low(0)
	movwf	((c:rtc_write_register@value))^00h,c
	movlw	(0Eh)&0ffh
	
	call	_rtc_write_register
	iorlw	0
	btfsc	status,2
	goto	u19941
	goto	u19940
u19941:
	goto	l14882
u19940:
	line	56
	
l14878:
	movlw	(01h)&0ffh
	goto	l1754
	line	59
	
l14882:
	movlw	(0)&0ffh
	line	60
	
l1754:
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
	
l14758:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19831
	goto	u19830
u19831:
	goto	l14764
u19830:
	line	12
	
l14760:
	movlw	(01h)&0ffh
	goto	l1739
	line	13
	
l14764:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19841
	goto	u19840
u19841:
	goto	l14770
u19840:
	goto	l14760
	line	15
	
l14770:
	movf	((c:rtc_write_register@reg))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19851
	goto	u19850
u19851:
	goto	l14776
u19850:
	goto	l14760
	line	17
	
l14776:
	movf	((c:rtc_write_register@value))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19861
	goto	u19860
u19861:
	goto	l14782
u19860:
	goto	l14760
	line	19
	
l14782:
	call	_i2c_stop	;wreg free
	line	20
	
l14784:
	movlw	(0)&0ffh
	line	21
	
l1739:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rtc_write_register
	__end_of_rtc_write_register:
	signat	_rtc_write_register,8313
	global	_menu_update_numeric_value

;; *************** function _menu_update_numeric_value *****************
;; Defined at:
;;		line 1352 in file "src\menu.c"
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
	line	1352
global __ptext7
__ptext7:
psect	text7
	file	"src\menu.c"
	line	1352
	
_menu_update_numeric_value:
;incstack = 0
	callstack 25
	line	1355
	
l15446:
	movlb	5	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20811
	goto	u20810

u20811:
	goto	l942
u20810:
	
l15448:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u20821
	goto	u20820
u20821:
	goto	l15450
u20820:
	goto	l942
	line	1359
	
l15450:; BSR set to: 5

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((c:menu_update_numeric_value@screen_line))^00h,c
	line	1360
		movlw	03h-1
	cpfsgt	((c:menu_update_numeric_value@screen_line))^00h,c
	goto	u20831
	goto	u20830

u20831:
	goto	l15454
u20830:
	goto	l942
	line	1365
	
l15454:; BSR set to: 5

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
	line	1366
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
	line	1369
	
l15456:; BSR set to: 5

	movff	(c:menu_update_numeric_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(c:menu_update_numeric_value@flow_type),(c:is_numeric_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u20841
	goto	u20840
u20841:
	goto	l15460
u20840:
	goto	l942
	line	1373
	
l15460:
	lfsr	2,(menu_update_numeric_value@value_buf)
	movlw	6-1
u20851:
	clrf	postinc2
	decf	wreg
	bc	u20851
	line	1375
	
l15462:
	movlb	5	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u20861
	goto	u20860
u20861:
	goto	l15494
u20860:
	line	1378
	
l15464:; BSR set to: 5

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20871
	goto	u20870

u20871:
	goto	l15468
u20870:
	
l15466:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20881
	goto	u20880
u20881:
	goto	l15470
u20880:
	
l15468:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1489))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1489))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1489))^00h,c
	goto	l15472
	
l15470:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1489+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1489))^00h,c
	
l15472:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1489),(c:menu_update_numeric_value@value_buf)
	line	1379
	
l15474:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20891
	goto	u20890

u20891:
	goto	l15478
u20890:
	
l15476:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20901
	goto	u20900
u20901:
	goto	l15480
u20900:
	
l15478:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1490))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1490))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1490))^00h,c
	goto	l15482
	
l15480:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1490+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1490))^00h,c
	
l15482:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1490),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1380
	
l15484:; BSR set to: 5

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20911
	goto	u20910

u20911:
	goto	l15488
u20910:
	
l15486:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20921
	goto	u20920
u20921:
	goto	l15490
u20920:
	
l15488:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1491))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1491))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1491))^00h,c
	goto	l15492
	
l15490:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1491+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1491))^00h,c
	
l15492:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1491),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1381
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+03h))^00h,c
	line	1382
	goto	l968
	line	1386
	
l15494:; BSR set to: 5

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20931
	goto	u20930
u20931:
	goto	l15498
u20930:
	
l15496:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20941
	goto	u20940
u20941:
	goto	l15506
u20940:
	
l15498:; BSR set to: 5

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u20951
	goto	u20950
u20951:
	goto	l15502
u20950:
	
l15500:; BSR set to: 5

	movlw	high(02Bh)
	movwf	((c:_menu_update_numeric_value$1493+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_menu_update_numeric_value$1493))^00h,c
	goto	l15504
	
l15502:; BSR set to: 5

	movlw	high(02Dh)
	movwf	((c:_menu_update_numeric_value$1493+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_menu_update_numeric_value$1493))^00h,c
	
l15504:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1493),(c:_menu_update_numeric_value$1492)
	movff	(c:_menu_update_numeric_value$1493+1),(c:_menu_update_numeric_value$1492+1)
	goto	l15508
	
l15506:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1492+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1492))^00h,c
	
l15508:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1492),(c:menu_update_numeric_value@value_buf)
	line	1387
	
l15510:; BSR set to: 5

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20961
	goto	u20960

u20961:
	goto	l15514
u20960:
	
l15512:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20971
	goto	u20970
u20971:
	goto	l15516
u20970:
	
l15514:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1494))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1494))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1494))^00h,c
	goto	l15518
	
l15516:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1494+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1494))^00h,c
	
l15518:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1494),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1388
	
l15520:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u20981
	goto	u20980

u20981:
	goto	l15524
u20980:
	
l15522:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u20991
	goto	u20990
u20991:
	goto	l15526
u20990:
	
l15524:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1495))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1495))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1495))^00h,c
	goto	l15528
	
l15526:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1495+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1495))^00h,c
	
l15528:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1495),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1389
	
l15530:; BSR set to: 5

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u21001
	goto	u21000

u21001:
	goto	l15534
u21000:
	
l15532:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u21011
	goto	u21010
u21011:
	goto	l15536
u21010:
	
l15534:; BSR set to: 5

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1496))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1496))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1496))^00h,c
	goto	l15538
	
l15536:; BSR set to: 5

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1496+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1496))^00h,c
	
l15538:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1496),0+((c:menu_update_numeric_value@value_buf)+03h)
	line	1390
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+04h))^00h,c
	line	1391
	
l968:; BSR set to: 5

	line	1394
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u21021
	goto	u21020
u21021:
	goto	l15542
u21020:
	
l15540:; BSR set to: 5

	movlw	high(0Eh)
	movwf	((c:_menu_update_numeric_value$1498+1))^00h,c
	movlw	low(0Eh)
	movwf	((c:_menu_update_numeric_value$1498))^00h,c
	goto	l15544
	
l15542:; BSR set to: 5

	movlw	high(0Fh)
	movwf	((c:_menu_update_numeric_value$1498+1))^00h,c
	movlw	low(0Fh)
	movwf	((c:_menu_update_numeric_value$1498))^00h,c
	
l15544:; BSR set to: 5

	movff	(c:_menu_update_numeric_value$1498),(c:menu_update_numeric_value@start_col)
	line	1396
	
l15546:; BSR set to: 5

	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1397
	
l15548:
		movlw	low(STR_233)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_233)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1399
	
l15550:
	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1400
	
l15552:
		movlw	low(STR_234)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_234)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1401
	
l15554:
		movlw	low(menu_update_numeric_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1402
	
l15556:
		movlw	low(STR_235)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_235)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1403
	
l942:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_numeric_value
	__end_of_menu_update_numeric_value:
	signat	_menu_update_numeric_value,89
	global	_menu_update_edit_value

;; *************** function _menu_update_edit_value *****************
;; Defined at:
;;		line 1288 in file "src\menu.c"
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
	line	1288
global __ptext8
__ptext8:
psect	text8
	file	"src\menu.c"
	line	1288
	
_menu_update_edit_value:
;incstack = 0
	callstack 25
	line	1292
	
l15558:
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
	line	1293
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
	line	1296
	
l15560:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u21031
	goto	u21030
u21031:
	goto	l920
u21030:
	
l15562:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u21041
	goto	u21040

u21041:
	goto	l15564
u21040:
	goto	l920
	line	1300
	
l15564:; BSR set to: 5

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@screen_line))&0ffh
	line	1301
		movlw	03h-1
	cpfsgt	((menu_update_edit_value@screen_line))&0ffh
	goto	u21051
	goto	u21050

u21051:
	goto	l15568
u21050:
	goto	l920
	line	1305
	
l15568:; BSR set to: 0

	movff	(menu_update_edit_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_update_edit_value@flow_type),(c:is_numeric_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u21061
	goto	u21060
u21061:
	goto	l15572
u21060:
	goto	l920
	line	1310
	
l15572:
	movlb	5	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u21071
	goto	u21070
u21071:
	goto	l15576
u21070:
	line	1312
	
l15574:; BSR set to: 5

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_228)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_228)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+0Ah),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1313
	goto	l15584
	line	1318
	
l15576:; BSR set to: 5

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u21081
	goto	u21080
u21081:
	goto	l15580
u21080:
	
l15578:; BSR set to: 5

	movlw	high(02Bh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1474+1))&0ffh
	movlw	low(02Bh)
	movwf	((_menu_update_edit_value$1474))&0ffh
	goto	l15582
	
l15580:; BSR set to: 5

	movlw	high(02Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1474+1))&0ffh
	movlw	low(02Dh)
	movwf	((_menu_update_edit_value$1474))&0ffh
	
l15582:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_229)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_229)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu_update_edit_value$1474),0+((c:?_sprintf)+04h)
	movff	(_menu_update_edit_value$1474+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+0Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	call	_sprintf	;wreg free
	line	1323
	
l15584:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@from))^00h,c
	clrf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1325
	
l15586:
	movlb	5	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u21091
	goto	u21090
u21091:
	goto	l15596
u21090:
	line	1328
	
l15588:; BSR set to: 5

	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u21101
	goto	u21100
u21101:
	goto	l930
u21100:
	line	1329
	
l15590:; BSR set to: 5

	decf	(0+(_menu+08h))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@blink_pos))&0ffh
	goto	l15592
	line	1330
	
l930:; BSR set to: 5

	line	1331
	movff	0+(_menu+08h),(menu_update_edit_value@blink_pos)
	line	1333
	
l15592:
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
	goto	u21111
	goto	u21110

u21111:
	goto	l15596
u21110:
	line	1334
	
l15594:; BSR set to: 0

	movf	((menu_update_edit_value@blink_pos))&0ffh,w
	addlw	low(menu_update_edit_value@display_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1338
	
l15596:
	movlb	5	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u21121
	goto	u21120
u21121:
	goto	l15600
u21120:
	
l15598:; BSR set to: 5

	movlw	high(0Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1478+1))&0ffh
	movlw	low(0Dh)
	movwf	((_menu_update_edit_value$1478))&0ffh
	goto	l15602
	
l15600:; BSR set to: 5

	movlw	high(0Eh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1478+1))&0ffh
	movlw	low(0Eh)
	movwf	((_menu_update_edit_value$1478))&0ffh
	
l15602:; BSR set to: 0

	movff	(_menu_update_edit_value$1478),(menu_update_edit_value@start_col)
	line	1339
	
l15604:; BSR set to: 0

	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	1340
	
l15606:
		movlw	low(STR_230)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_230)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1342
	
l15608:
	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	movlb	0	; () banked
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	1343
	
l15610:
		movlw	low(STR_231)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_231)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1344
	
l15612:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1345
	
l15614:
		movlw	low(STR_232)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_232)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1346
	
l920:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_edit_value
	__end_of_menu_update_edit_value:
	signat	_menu_update_edit_value,89
	global	_menu_init

;; *************** function _menu_init *****************
;; Defined at:
;;		line 973 in file "src\menu.c"
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
	line	973
global __ptext9
__ptext9:
psect	text9
	file	"src\menu.c"
	line	973
	
_menu_init:
;incstack = 0
	callstack 28
	line	975
	
l14998:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu))&0ffh
	line	976
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	977
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	978
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	979
	movlw	low(0)
	movwf	(0+(_menu+05h))&0ffh
	line	980
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	981
	
l767:; BSR set to: 5

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_init
	__end_of_menu_init:
	signat	_menu_init,89
	global	_menu_handle_encoder

;; *************** function _menu_handle_encoder *****************
;; Defined at:
;;		line 1941 in file "src\menu.c"
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
	line	1941
global __ptext10
__ptext10:
psect	text10
	file	"src\menu.c"
	line	1941
	
_menu_handle_encoder:; BSR set to: 5

;incstack = 0
	callstack 22
	line	1946
	
l15240:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u20351
	goto	u20350
u20351:
	goto	l15362
u20350:
	line	1948
	
l15242:; BSR set to: 5

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u20361
	goto	u20360

u20361:
	goto	l1192
u20360:
	line	1951
	
l15244:; BSR set to: 5

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20371
	goto	u20370

u20371:
	goto	l15306
u20370:
	line	1954
	
l15246:; BSR set to: 5

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_300)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_300)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(c:menu_handle_encoder@delta),0+((c:?_sprintf)+06h)
	movff	(c:menu_handle_encoder@delta+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1955
	
l15248:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1958
	
l15250:
		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20381
	goto	u20380

u20381:
	goto	l15256
u20380:
	line	1961
	
l15252:; BSR set to: 5

	movf	((c:menu_handle_encoder@delta))^00h,c,w
	
	call	_handle_time_rotation
	line	1962
	call	_menu_update_time_value	;wreg free
	goto	l1192
	line	1963
	
l15254:
	goto	l1192
	line	1966
	
l15256:; BSR set to: 5

		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1967
		movlw	low(0)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1969
	
l15258:; BSR set to: 1

	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20391
	goto	u20390
u20391:
	goto	l15262
u20390:
	line	1971
	
l15260:; BSR set to: 5

		movlw	low(_menu_item_options)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1972
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1973
	goto	l1194
	line	1974
	
l15262:; BSR set to: 5

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20401
	goto	u20400

u20401:
	goto	l15266
u20400:
	line	1976
	
l15264:; BSR set to: 5

		movlw	low(_menu_item_options+048h)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1977
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1978
	goto	l1194
	line	1979
	
l15266:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20411
	goto	u20410

u20411:
	goto	l1194
u20410:
	line	1981
	
l15268:; BSR set to: 5

		movlw	low(_menu_item_options+03Ch)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1982
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1985
	
l1194:
	movlb	1	; () banked
	movf	((menu_handle_encoder@clock_opts))&0ffh,w
iorwf	((menu_handle_encoder@clock_opts+1))&0ffh,w
	btfsc	status,2
	goto	u20421
	goto	u20420

u20421:
	goto	l1192
u20420:
	
l15270:; BSR set to: 1

	movf	((menu_handle_encoder@clock_flag))&0ffh,w
iorwf	((menu_handle_encoder@clock_flag+1))&0ffh,w
	btfsc	status,2
	goto	u20431
	goto	u20430

u20431:
	goto	l1192
u20430:
	line	1987
	
l15272:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_301)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_301)
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
	line	1988
	
l15274:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1990
	
l15276:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20441
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u20440
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u20441
	goto	u20440

u20441:
	goto	l15284
u20440:
	line	1992
	
l15278:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	incf	indf2

	line	1993
	
l15280:
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
	goto	u20451
	goto	u20450

u20451:
	goto	l15292
u20450:
	line	1994
	
l15282:; BSR set to: 0

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	goto	l15292
	line	1996
	
l15284:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20460
	goto	u20461

u20461:
	goto	l15292
u20460:
	line	1998
	
l15286:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u20471
	goto	u20470
u20471:
	goto	l15290
u20470:
	line	1999
	
l15288:
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

	goto	l15292
	line	2001
	
l15290:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	decf	indf2

	line	2005
	
l15292:
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
	goto	u20481
	goto	u20480

u20481:
	goto	l15296
u20480:
	line	2006
	
l15294:; BSR set to: 0

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	line	2008
	
l15296:; BSR set to: 0

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
	line	2009
	
l15298:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2012
	
l15300:
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
	line	2013
	
l15302:
	call	_menu_draw_clock	;wreg free
	goto	l1192
	line	2020
	
l15306:; BSR set to: 5

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
	line	2021
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
	line	2024
	
l15308:; BSR set to: 1

	movff	(menu_handle_encoder@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_option_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u20491
	goto	u20490
u20491:
	goto	l15340
u20490:
	line	2026
	
l15310:
	movff	(menu_handle_encoder@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_encoder@edit_flag)
	movff	1+?_get_option_edit_flag,(menu_handle_encoder@edit_flag+1)
	line	2027
	movff	(menu_handle_encoder@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_encoder@opts)
	movff	1+?_get_item_options_for_field,(menu_handle_encoder@opts+1)
	line	2029
	
l15312:
	movlb	1	; () banked
	movf	((menu_handle_encoder@edit_flag))&0ffh,w
iorwf	((menu_handle_encoder@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u20501
	goto	u20500

u20501:
	goto	l1192
u20500:
	
l15314:; BSR set to: 1

	movf	((menu_handle_encoder@opts))&0ffh,w
iorwf	((menu_handle_encoder@opts+1))&0ffh,w
	btfsc	status,2
	goto	u20511
	goto	u20510

u20511:
	goto	l1192
u20510:
	line	2031
	
l15316:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20521
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u20520
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u20521
	goto	u20520

u20521:
	goto	l15324
u20520:
	line	2033
	
l15318:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	incf	indf2

	line	2034
	
l15320:; BSR set to: 1

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
	goto	u20531
	goto	u20530

u20531:
	goto	l15332
u20530:
	line	2035
	
l15322:; BSR set to: 0

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	goto	l15332
	line	2037
	
l15324:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20540
	goto	u20541

u20541:
	goto	l15332
u20540:
	line	2039
	
l15326:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u20551
	goto	u20550
u20551:
	goto	l15330
u20550:
	line	2040
	
l15328:; BSR set to: 1

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

	goto	l15332
	line	2042
	
l15330:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	decf	indf2

	line	2046
	
l15332:
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
	goto	u20561
	goto	u20560

u20561:
	goto	l15336
u20560:
	line	2047
	
l15334:; BSR set to: 0

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	line	2050
	
l15336:; BSR set to: 0

	movlb	5	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20571
	goto	u20570

u20571:
	goto	l15254
u20570:
	line	2052
	
l15338:; BSR set to: 5

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
	line	2053
	call	_menu_draw_input	;wreg free
	goto	l1192
	line	2057
	
l15340:
	movff	(menu_handle_encoder@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_numeric_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u20581
	goto	u20580
u20581:
	goto	l15350
u20580:
	line	2059
	
l15342:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20590
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u20591
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u20591
	goto	u20590

u20591:
	goto	l15346
u20590:
	
l15344:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1681))&0ffh
	setf	((_menu_handle_encoder$1681+1))&0ffh
	goto	l15348
	
l15346:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1681+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1681))&0ffh
	
l15348:; BSR set to: 1

	movf	((_menu_handle_encoder$1681))&0ffh,w
	
	call	_handle_numeric_rotation
	line	2060
	goto	l1192
	line	2061
	
l15350:
	movff	(menu_handle_encoder@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_time_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u20601
	goto	u20600
u20601:
	goto	l15254
u20600:
	line	2063
	
l15352:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20610
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u20611
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u20611
	goto	u20610

u20611:
	goto	l15356
u20610:
	
l15354:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1682))&0ffh
	setf	((_menu_handle_encoder$1682+1))&0ffh
	goto	l15358
	
l15356:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1682+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1682))&0ffh
	
l15358:; BSR set to: 1

	movf	((_menu_handle_encoder$1682))&0ffh,w
	
	call	_handle_time_rotation
	goto	l1192
	line	2070
	
l15362:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20621
	goto	u20620

u20621:
	goto	l15388
u20620:
	
l15364:; BSR set to: 5

	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u20631
	goto	u20630
u20631:
	goto	l15388
u20630:
	
l15366:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u20641
	goto	u20640
u20641:
	goto	l15388
u20640:
	
l15368:; BSR set to: 5

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u20651
	goto	u20650

u20651:
	goto	l15388
u20650:
	line	2072
	
l15370:; BSR set to: 5

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20661
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u20660
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u20661
	goto	u20660

u20661:
	goto	l15378
u20660:
	line	2074
	
l15372:; BSR set to: 5

	incf	(0+(_menu+01Ch))&0ffh
	line	2075
	
l15374:; BSR set to: 5

		movlw	03h-1
	cpfsgt	(0+(_menu+01Ch))&0ffh
	goto	u20671
	goto	u20670

u20671:
	goto	l15384
u20670:
	line	2076
	
l15376:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Ch))&0ffh
	goto	l15384
	line	2080
	
l15378:; BSR set to: 5

	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u20681
	goto	u20680
u20681:
	goto	l15382
u20680:
	line	2081
	
l15380:; BSR set to: 5

	movlw	low(02h)
	movwf	(0+(_menu+01Ch))&0ffh
	goto	l15384
	line	2083
	
l15382:; BSR set to: 5

	decf	(0+(_menu+01Ch))&0ffh
	line	2085
	
l15384:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	goto	l1192
	line	2090
	
l15388:; BSR set to: 5

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20691
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u20690
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u20691
	goto	u20690

u20691:
	goto	l15406
u20690:
	line	2094
	
l15390:; BSR set to: 5

		movlw	low(menu_handle_encoder@buf_1683)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1683)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_303)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_303)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	2095
	
l15392:
		movlw	low(menu_handle_encoder@buf_1683)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1683)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2098
	
l15394:
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
	goto	u20701
	goto	u20700

u20701:
	goto	l15402
u20700:
	line	2100
	
l15396:; BSR set to: 0

	movlb	5	; () banked
	incf	((_menu))&0ffh
	line	2103
	
l15398:; BSR set to: 5

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
	goto	u20711
	goto	u20710

u20711:
	goto	l15402
u20710:
	line	2105
	
l15400:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+01h))&0ffh
	line	2109
	
l15402:
		movlw	low(menu_handle_encoder@buf_1683)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1683)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_304)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_304)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2110
	
l15404:
		movlw	low(menu_handle_encoder@buf_1683)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1683)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2111
	goto	l15424
	line	2112
	
l15406:; BSR set to: 5

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u20720
	goto	u20721

u20721:
	goto	l15424
u20720:
	line	2116
	
l15408:; BSR set to: 5

		movlw	low(menu_handle_encoder@buf_1686)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1686)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_305)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_305)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	2117
	
l15410:
		movlw	low(menu_handle_encoder@buf_1686)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1686)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2120
	
l15412:
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u20731
	goto	u20730
u20731:
	goto	l15420
u20730:
	line	2122
	
l15414:; BSR set to: 5

	decf	((_menu))&0ffh
	line	2125
	
l15416:; BSR set to: 5

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u20741
	goto	u20740

u20741:
	goto	l15420
u20740:
	line	2127
	
l15418:; BSR set to: 5

	decf	(0+(_menu+01h))&0ffh
	line	2131
	
l15420:; BSR set to: 5

		movlw	low(menu_handle_encoder@buf_1686)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1686)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_306)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_306)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2132
	
l15422:
		movlw	low(menu_handle_encoder@buf_1686)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1686)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2136
	
l15424:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u20751
	goto	u20750
u20751:
	goto	l1192
u20750:
	line	2138
	
l15426:; BSR set to: 5

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20761
	goto	u20760
u20761:
	goto	l15430
u20760:
	line	2139
	
l15428:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	goto	l1192
	line	2140
	
l15430:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20771
	goto	u20770

u20771:
	goto	l15434
u20770:
	line	2141
	
l15432:; BSR set to: 5

	call	_menu_draw_input	;wreg free
	goto	l1192
	line	2142
	
l15434:; BSR set to: 5

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20781
	goto	u20780

u20781:
	goto	l15438
u20780:
	line	2143
	
l15436:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	goto	l1192
	line	2144
	
l15438:; BSR set to: 5

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20791
	goto	u20790

u20791:
	goto	l15442
u20790:
	goto	l15302
	line	2146
	
l15442:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u20801
	goto	u20800

u20801:
	goto	l15254
u20800:
	goto	l15384
	line	2149
	
l1192:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_encoder
	__end_of_menu_handle_encoder:
	signat	_menu_handle_encoder,4217
	global	_handle_time_rotation

;; *************** function _handle_time_rotation *****************
;; Defined at:
;;		line 477 in file "src\menu.c"
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
;;		On entry : 38/6
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
	line	477
global __ptext11
__ptext11:
psect	text11
	file	"src\menu.c"
	line	477
	
_handle_time_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_time_rotation@direction))&0ffh
	line	479
	
l13566:
		movlw	low(STR_139)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_139)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	483
	
l13568:
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
	line	484
	
l13570:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	486
	
l13572:
	movlb	5	; () banked
	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u18111
	goto	u18110
u18111:
	goto	l13628
u18110:
	line	488
	
l13574:; BSR set to: 5

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u18121
	goto	u18120

u18121:
	goto	l13604
u18120:
	line	490
	
l13576:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+012h))&0ffh
	line	492
	
l13578:; BSR set to: 5

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18131
	goto	u18130

u18131:
	goto	l13586
u18130:
	
l13580:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18141
	goto	u18140

u18141:
	goto	l13586
u18140:
	
l13582:; BSR set to: 5

		movlw	03h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u18151
	goto	u18150

u18151:
	goto	l13586
u18150:
	line	493
	
l13584:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+012h))&0ffh
	goto	l13664
	line	495
	
l13586:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18161
	goto	u18160

u18161:
	goto	l13594
u18160:
	
l13588:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18171
	goto	u18170

u18171:
	goto	l13594
u18170:
	
l13590:; BSR set to: 5

		movlw	05h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u18181
	goto	u18180

u18181:
	goto	l13594
u18180:
	goto	l13584
	line	497
	
l13594:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u18191
	goto	u18190

u18191:
	goto	l13600
u18190:
	
l13596:; BSR set to: 5

		movlw	018h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u18201
	goto	u18200

u18201:
	goto	l13600
u18200:
	goto	l13584
	line	499
	
l13600:; BSR set to: 5

		movlw	064h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u18211
	goto	u18210

u18211:
	goto	l626
u18210:
	goto	l13584
	line	501
	
l626:; BSR set to: 5

	goto	l13664
	line	504
	
l13604:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u18221
	goto	u18220
u18221:
	goto	l13626
u18220:
	line	507
	
l13606:; BSR set to: 5

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18231
	goto	u18230

u18231:
	goto	l13612
u18230:
	
l13608:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18241
	goto	u18240

u18241:
	goto	l13612
u18240:
	line	508
	
l13610:; BSR set to: 5

	movlw	low(02h)
	movwf	(0+(_menu+012h))&0ffh
	goto	l13664
	line	510
	
l13612:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18251
	goto	u18250

u18251:
	goto	l13618
u18250:
	
l13614:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18261
	goto	u18260

u18261:
	goto	l13618
u18260:
	line	511
	
l13616:; BSR set to: 5

	movlw	low(04h)
	movwf	(0+(_menu+012h))&0ffh
	goto	l13664
	line	513
	
l13618:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+010h))&0ffh,w
	btfsc	status,2
	goto	u18271
	goto	u18270

u18271:
	goto	l13622
u18270:
	
l13620:; BSR set to: 5

	movlw	high(063h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1284+1))&0ffh
	movlw	low(063h)
	movwf	((_handle_time_rotation$1284))&0ffh
	goto	l13624
	
l13622:; BSR set to: 5

	movlw	high(017h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1284+1))&0ffh
	movlw	low(017h)
	movwf	((_handle_time_rotation$1284))&0ffh
	
l13624:; BSR set to: 0

	movff	(_handle_time_rotation$1284),0+(_menu+012h)
	goto	l13664
	line	517
	
l13626:; BSR set to: 5

	decf	(0+(_menu+012h))&0ffh
	goto	l13664
	line	521
	
l13628:; BSR set to: 5

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u18281
	goto	u18280

u18281:
	goto	l13664
u18280:
	line	524
	
l13630:; BSR set to: 5

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18291
	goto	u18290

u18291:
	goto	l13640
u18290:
	
l13632:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18301
	goto	u18300

u18301:
	goto	l13640
u18300:
	
l13634:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u18311
	goto	u18310

u18311:
	goto	l13640
u18310:
	line	527
	
l13636:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l646
	line	531
	
l13640:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18321
	goto	u18320

u18321:
	goto	l13650
u18320:
	
l13642:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18331
	goto	u18330

u18331:
	goto	l13650
u18330:
	
l13644:; BSR set to: 5

		movlw	4
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u18341
	goto	u18340

u18341:
	goto	l13650
u18340:
	goto	l13636
	line	538
	
l13650:; BSR set to: 5

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u18351
	goto	u18350

u18351:
	goto	l13658
u18350:
	line	540
	
l13652:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+013h))&0ffh
	line	541
	
l13654:; BSR set to: 5

		movlw	03Ch-1
	cpfsgt	(0+(_menu+013h))&0ffh
	goto	u18361
	goto	u18360

u18361:
	goto	l13664
u18360:
	line	542
	
l13656:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l13664
	line	546
	
l13658:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	btfss	status,2
	goto	u18371
	goto	u18370
u18371:
	goto	l13662
u18370:
	line	547
	
l13660:; BSR set to: 5

	movlw	low(03Bh)
	movwf	(0+(_menu+013h))&0ffh
	goto	l13664
	line	549
	
l13662:; BSR set to: 5

	decf	(0+(_menu+013h))&0ffh
	line	553
	
l13664:
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
	line	554
	
l13666:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	555
	
l646:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_time_rotation
	__end_of_handle_time_rotation:
	signat	_handle_time_rotation,4217
	global	_handle_numeric_rotation

;; *************** function _handle_numeric_rotation *****************
;; Defined at:
;;		line 1201 in file "src\menu.c"
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
;;		On entry : 38/6
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
	line	1201
global __ptext12
__ptext12:
psect	text12
	file	"src\menu.c"
	line	1201
	
_handle_numeric_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_numeric_rotation@direction))&0ffh
	line	1203
	
l13878:
		movlw	low(STR_226)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_226)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1206
	
l13880:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_227)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_227)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+08h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Fh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1207
	
l13882:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1210
	
l13884:
	movlb	5	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u18731
	goto	u18730
u18731:
	goto	l13978
u18730:
	
l13886:; BSR set to: 5

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u18741
	goto	u18740
u18741:
	goto	l13978
u18740:
	line	1212
	
l13888:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+08h))&0ffh
	goto	l13978
	line	1218
	
l13890:; BSR set to: 5

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u18751
	goto	u18750
u18751:
	goto	l912
u18750:
	
l13892:; BSR set to: 5

	movlb	0	; () banked
	movf	((handle_numeric_rotation@direction))&0ffh,w
	btfsc	status,2
	goto	u18761
	goto	u18760
u18761:
	goto	l912
u18760:
	line	1220
	
l13894:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u18771
	goto	u18770
u18771:
	movlw	1
	goto	u18780
u18770:
	movlw	0
u18780:
	movwf	(0+(_menu+09h))&0ffh
	goto	l912
	line	1225
	
l13896:; BSR set to: 5

	movlb	0	; () banked
		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u18791
	goto	u18790

u18791:
	goto	l13904
u18790:
	line	1227
	
l13898:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+0Ah))&0ffh
	line	1228
	
l13900:; BSR set to: 5

		movlw	06h-1
	cpfsgt	(0+(_menu+0Ah))&0ffh
	goto	u18801
	goto	u18800

u18801:
	goto	l912
u18800:
	line	1229
	
l13902:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l912
	line	1231
	
l13904:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u18810
	goto	u18811

u18811:
	goto	l912
u18810:
	line	1233
	
l13906:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u18821
	goto	u18820
u18821:
	goto	l13910
u18820:
	line	1234
	
l13908:; BSR set to: 5

	movlw	low(05h)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l912
	line	1236
	
l13910:; BSR set to: 5

	decf	(0+(_menu+0Ah))&0ffh
	goto	l912
	line	1242
	
l13912:; BSR set to: 5

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u18831
	goto	u18830

u18831:
	goto	l13916
u18830:
	
l13914:; BSR set to: 5

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1463+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1463))&0ffh
	goto	l13918
	
l13916:; BSR set to: 5

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1463+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1463))&0ffh
	
l13918:; BSR set to: 0

	movff	(_handle_numeric_rotation$1463),(handle_numeric_rotation@max_tens)
	line	1243
	
l13920:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u18841
	goto	u18840

u18841:
	goto	l13932
u18840:
	line	1245
	
l13922:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u18851
	goto	u18850
u18851:
	goto	l13926
u18850:
	goto	l912
	line	1247
	
l13926:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+0Bh))&0ffh
	line	1248
	
l13928:; BSR set to: 5

		movf	(0+(_menu+0Bh))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfsc	status,0
	goto	u18861
	goto	u18860

u18861:
	goto	l912
u18860:
	line	1249
	
l13930:; BSR set to: 0

	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	goto	l912
	line	1251
	
l13932:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u18870
	goto	u18871

u18871:
	goto	l912
u18870:
	line	1253
	
l13934:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u18881
	goto	u18880
u18881:
	goto	l13938
u18880:
	goto	l912
	line	1255
	
l13938:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+0Bh))&0ffh,w
	btfss	status,2
	goto	u18891
	goto	u18890
u18891:
	goto	l13942
u18890:
	line	1256
	
l13940:; BSR set to: 5

	movff	(handle_numeric_rotation@max_tens),0+(_menu+0Bh)
	goto	l912
	line	1258
	
l13942:; BSR set to: 5

	decf	(0+(_menu+0Bh))&0ffh
	goto	l912
	line	1265
	
l13944:; BSR set to: 5

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u18901
	goto	u18900

u18901:
	goto	l13948
u18900:
	
l13946:; BSR set to: 5

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1465+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1465))&0ffh
	goto	l13950
	
l13948:; BSR set to: 5

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1465+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1465))&0ffh
	
l13950:; BSR set to: 0

	movff	(_handle_numeric_rotation$1465),(handle_numeric_rotation@max_units)
	line	1266
	
l13952:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u18911
	goto	u18910

u18911:
	goto	l13964
u18910:
	line	1268
	
l13954:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u18921
	goto	u18920
u18921:
	goto	l13958
u18920:
	goto	l912
	line	1270
	
l13958:; BSR set to: 0

	movlb	5	; () banked
	incf	(0+(_menu+0Ch))&0ffh
	line	1271
	
l13960:; BSR set to: 5

		movf	(0+(_menu+0Ch))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_units))&0ffh,w
	btfsc	status,0
	goto	u18931
	goto	u18930

u18931:
	goto	l912
u18930:
	line	1272
	
l13962:; BSR set to: 0

	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	goto	l912
	line	1274
	
l13964:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u18940
	goto	u18941

u18941:
	goto	l912
u18940:
	line	1276
	
l13966:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u18951
	goto	u18950
u18951:
	goto	l13970
u18950:
	goto	l912
	line	1278
	
l13970:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+0Ch))&0ffh,w
	btfss	status,2
	goto	u18961
	goto	u18960
u18961:
	goto	l13974
u18960:
	line	1279
	
l13972:; BSR set to: 5

	movff	(handle_numeric_rotation@max_units),0+(_menu+0Ch)
	goto	l912
	line	1281
	
l13974:; BSR set to: 5

	decf	(0+(_menu+0Ch))&0ffh
	goto	l912
	line	1215
	
l13978:; BSR set to: 5

	movf	(0+(_menu+08h))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l13890
	xorlw	1^0	; case 1
	skipnz
	goto	l13896
	xorlw	2^1	; case 2
	skipnz
	goto	l13912
	xorlw	3^2	; case 3
	skipnz
	goto	l13944
	goto	l912

	line	1286
	
l912:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_numeric_rotation
	__end_of_handle_numeric_rotation:
	signat	_handle_numeric_rotation,4217
	global	_menu_handle_button

;; *************** function _menu_handle_button *****************
;; Defined at:
;;		line 2155 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  press_type      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  press_type      1  254[BANK2 ] unsigned char 
;;  i               1  249[BANK1 ] unsigned char 
;;  opts            2  247[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  edit_flag       2  122[BANK0 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), NULL(0), 
;;  buf            50  200[BANK2 ] unsigned char [50]
;;  current_val     2  124[BANK0 ] unsigned int 
;;  current_val     2  254[BANK1 ] int 
;;  buf            80  167[BANK1 ] unsigned char [80]
;;  sensor_type     1  203[BANK3 ] unsigned char 
;;  flow_type       1  255[BANK2 ] unsigned char 
;;  verify_time     7  204[BANK3 ] struct .
;;  new_seconds     2  252[BANK1 ] unsigned int 
;;  new_value       2  250[BANK1 ] unsigned int 
;;  buf            50   50[BANK3 ] unsigned char [50]
;;  buf            50    0[BANK3 ] unsigned char [50]
;;  buf            80   87[BANK1 ] unsigned char [80]
;;  new_time        7  211[BANK3 ] struct .
;;  buf            50   50[BANK2 ] unsigned char [50]
;;  buf            50    0[BANK2 ] unsigned char [50]
;;  buf            50  100[BANK3 ] unsigned char [50]
;;  new_value       2  219[BANK3 ] int 
;;  new_seconds     2  200[BANK3 ] unsigned int 
;;  buf            50  100[BANK2 ] unsigned char [50]
;;  buf            50  150[BANK3 ] unsigned char [50]
;;  edit_flag       2  252[BANK2 ] PTR unsigned char 
;;		 -> display_edit_flag(1), relay_high_edit_flag(1), enable_edit_flag(1), NULL(0), 
;;  opts            2  250[BANK2 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  buf            50  150[BANK2 ] unsigned char [50]
;;  opts            2  120[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  edit_flag       2  118[BANK0 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), NULL(0), 
;;  sensor_type     1  218[BANK3 ] unsigned char 
;;  flow_type       1  202[BANK3 ] unsigned char 
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
;;      Locals:         0      10     169     256     221       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0      15     169     256     221       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      661 bytes
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
	line	2155
global __ptext13
__ptext13:
psect	text13
	file	"src\menu.c"
	line	2155
	
_menu_handle_button:
;incstack = 0
	callstack 22
	movlb	2	; () banked
	movwf	((menu_handle_button@press_type))&0ffh
	line	2160
	
l15616:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u21131
	goto	u21130
u21131:
	goto	l16092
u21130:
	line	2162
	
l15618:; BSR set to: 5

	movlb	2	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u21141
	goto	u21140

u21141:
	goto	l15836
u21140:
	line	2165
	
l15620:; BSR set to: 2

		movlw	3
	movlb	5	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21151
	goto	u21150

u21151:
	goto	l15722
u21150:
	line	2170
	
l15622:; BSR set to: 5

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_307)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_307)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2171
	
l15624:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2174
	
l15626:
		movlw	low(0)
	movlb	2	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2175
	
l15628:; BSR set to: 2

		movlw	low(0)
	movwf	((menu_handle_button@edit_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@edit_flag+1))&0ffh

	line	2177
	
l15630:; BSR set to: 2

	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21161
	goto	u21160
u21161:
	goto	l15640
u21160:
	line	2179
	
l15632:; BSR set to: 5

		movlw	low(_menu_item_options)
	movlb	2	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2180
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2181
	
l15634:; BSR set to: 2

	movff	(c:_enable_edit_flag),(_system_config)
	line	2182
	
l15636:; BSR set to: 2

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_308)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_308)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2183
	
l15638:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2184
	goto	l1263
	line	2185
	
l15640:; BSR set to: 5

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21171
	goto	u21170

u21171:
	goto	l15650
u21170:
	line	2187
	
l15642:; BSR set to: 5

		movlw	low(_menu_item_options+048h)
	movlb	2	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2188
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2189
	
l15644:; BSR set to: 2

	movff	(c:_relay_high_edit_flag),0+(_system_config+06h)
	line	2190
	
l15646:; BSR set to: 2

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_309)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_309)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+06h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	goto	l15638
	line	2193
	
l15650:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21181
	goto	u21180

u21181:
	goto	l15700
u21180:
	line	2196
	
l15652:; BSR set to: 5

	incf	(0+(_menu+011h))&0ffh
	line	2197
	
l15654:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2200
	
l15656:; BSR set to: 5

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u21191
	goto	u21190

u21191:
	goto	l15662
u21190:
	
l15658:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u21201
	goto	u21200

u21201:
	goto	l15662
u21200:
	line	2202
	
l15660:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	line	2205
	
l15662:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2207
	
l15664:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_310)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_310)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2208
	
l15666:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2211
	
l15668:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_311)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_311)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2212
	
l15670:
	call	_menu_draw_clock	;wreg free
	line	2214
	
l15672:
		movlw	02h-1
	movlb	5	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u21211
	goto	u21210

u21211:
	goto	l1274
u21210:
	line	2217
	
l15674:; BSR set to: 5

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
	line	2220
	
l15676:; BSR set to: 1

	movf	((menu_handle_button@new_value))&0ffh,w
iorwf	((menu_handle_button@new_value+1))&0ffh,w
	btfss	status,2
	goto	u21221
	goto	u21220

u21221:
	goto	l15680
u21220:
	line	2221
	
l15678:; BSR set to: 1

	movlw	high(01h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(01h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	2222
	
l15680:; BSR set to: 1

		movf	((menu_handle_button@new_value+1))&0ffh,w
	bnz	u21230
	movlw	121
	subwf	 ((menu_handle_button@new_value))&0ffh,w
	btfss	status,0
	goto	u21231
	goto	u21230

u21231:
	goto	l15684
u21230:
	line	2223
	
l15682:; BSR set to: 1

	movlw	high(078h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(078h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	2225
	
l15684:; BSR set to: 1

	movff	(menu_handle_button@new_value),0+(_system_config+07h)
	line	2228
	
l15686:; BSR set to: 1

		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_312)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_312)
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
	line	2229
	
l15688:
		movff	0+(_clock_menu+0Ch),(c:strcpy@to)
	movff	1+(_clock_menu+0Ch),(c:strcpy@to+1)

		movlw	low(_value_relay_pulse)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	2231
	
l15690:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_313)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_313)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+07h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2232
	
l15692:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2233
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	line	2234
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	2235
	
l15694:; BSR set to: 5

	call	_menu_draw_clock	;wreg free
	line	2239
	
l15696:
	movlw	(0)&0ffh
	
	call	_trigger_relay_pulse
	line	2240
	goto	l1274
	line	2241
	
l1268:
	line	2243
	goto	l1274
	line	2248
	
l15700:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21241
	goto	u21240

u21241:
	goto	l1263
u21240:
	line	2250
	
l15702:; BSR set to: 5

		movlw	low(_menu_item_options+03Ch)
	movlb	2	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	2251
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	2255
	
l1263:
	movlb	2	; () banked
	movf	((menu_handle_button@opts))&0ffh,w
iorwf	((menu_handle_button@opts+1))&0ffh,w
	btfsc	status,2
	goto	u21251
	goto	u21250

u21251:
	goto	l15716
u21250:
	
l15704:; BSR set to: 2

	movf	((menu_handle_button@edit_flag))&0ffh,w
iorwf	((menu_handle_button@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u21261
	goto	u21260

u21261:
	goto	l15716
u21260:
	
l15706:; BSR set to: 2

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
	goto	u21271
	goto	u21270
u21271:
	goto	l15716
u21270:
	line	2257
	
l15708:; BSR set to: 0

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
	line	2258
	
l15710:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	line	2259
	
l15712:; BSR set to: 5

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_314)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_314)
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
	line	2260
	
l15714:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2263
	
l15716:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2264
	
l15718:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1274
	line	2269
	
l15722:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21281
	goto	u21280

u21281:
	goto	l15778
u21280:
	
l15724:; BSR set to: 5

	movf	(0+(_menu+01Eh))&0ffh,w
	btfss	status,2
	goto	u21291
	goto	u21290
u21291:
	goto	l15778
u21290:
	line	2275
	
l15726:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21301
	goto	u21300

u21301:
	goto	l15764
u21300:
	line	2277
	
l15728:; BSR set to: 5

	incf	(0+(_menu+011h))&0ffh
	line	2278
	
l15730:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2279
	
l15732:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2282
	
l15734:
		movlw	low(menu_handle_button@buf_1713)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1713)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_315)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_315)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2283
	
l15736:
		movlw	low(menu_handle_button@buf_1713)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1713)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2285
	
l15738:
	call	_menu_update_time_value	;wreg free
	line	2287
	
l15740:
		movlw	02h-1
	movlb	5	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u21311
	goto	u21310

u21311:
	goto	l1274
u21310:
	line	2290
	
l15742:; BSR set to: 5

	movf	(0+(_menu+012h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+(_menu+013h))&0ffh,w
	movlb	0	; () banked
	addwf	(??_menu_handle_button+0+0)&0ffh,w
	movlb	1	; () banked
	movwf	((menu_handle_button@new_seconds))&0ffh
	movlb	5	; () banked
	movlw	0
	movlb	0	; () banked
	addwfc	(??_menu_handle_button+0+1)&0ffh,w
	movlb	1	; () banked
	movwf	1+((menu_handle_button@new_seconds))&0ffh
	line	2293
	
l15744:; BSR set to: 1

		movf	((menu_handle_button@new_seconds+1))&0ffh,w
	bnz	u21321
	movlw	10
	subwf	 ((menu_handle_button@new_seconds))&0ffh,w
	btfsc	status,0
	goto	u21321
	goto	u21320

u21321:
	goto	l15748
u21320:
	line	2294
	
l15746:; BSR set to: 1

	movlw	high(0Ah)
	movwf	((menu_handle_button@new_seconds+1))&0ffh
	movlw	low(0Ah)
	movwf	((menu_handle_button@new_seconds))&0ffh
	line	2295
	
l15748:; BSR set to: 1

		movf	((menu_handle_button@new_seconds+1))&0ffh,w
	bnz	u21330
	movlw	241
	subwf	 ((menu_handle_button@new_seconds))&0ffh,w
	btfss	status,0
	goto	u21331
	goto	u21330

u21331:
	goto	l15752
u21330:
	line	2296
	
l15750:; BSR set to: 1

	movlw	high(0F0h)
	movwf	((menu_handle_button@new_seconds+1))&0ffh
	movlw	low(0F0h)
	movwf	((menu_handle_button@new_seconds))&0ffh
	line	2298
	
l15752:; BSR set to: 1

	movff	(menu_handle_button@new_seconds),0+(_system_config+01h)
	line	2303
	
l15754:; BSR set to: 1

		movlw	low(_value_menu_timeout)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_menu_timeout)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_316)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_316)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(03Ch)
	movwf	((c:___lbdiv@divisor))^00h,c
	movlb	7	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	
	call	___lbdiv
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movf	((??_menu_handle_button+0+0))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	7	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	
	call	___lbmod
	movlb	0	; () banked
	movwf	(??_menu_handle_button+1+0)&0ffh
	movf	((??_menu_handle_button+1+0))&0ffh,w
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2305
	
l15756:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2306
	
l15758:; BSR set to: 5

	movlw	low(01h)
	movwf	((_save_pending))&0ffh
	line	2307
	
l15760:; BSR set to: 5

		movlw	low(STR_317)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_317)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2308
	
l15762:
	call	_menu_draw_utility	;wreg free
	goto	l1274
	line	2315
	
l15764:; BSR set to: 5

		movlw	low(menu_handle_button@buf_1718)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1718)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_318)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_318)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_system_config+020h),0+((c:?_sprintf)+06h)
	movff	1+(_system_config+020h),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	2316
	
l15766:
		movlw	low(menu_handle_button@buf_1718)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1718)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2318
	
l15768:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	line	2319
	
l15770:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	2320
	
l15772:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l15762
	line	2327
	
l15778:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u21341
	goto	u21340

u21341:
	goto	l15836
u21340:
	
l15780:; BSR set to: 5

	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u21351
	goto	u21350
u21351:
	goto	l15836
u21350:
	line	2329
	
l15782:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2330
	
l15784:
	movlb	5	; () banked
	incf	(0+(_menu+01Dh))&0ffh
	line	2334
	
l15786:; BSR set to: 5

		movlw	low(menu_handle_button@buf_1720)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1720)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_319)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_319)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+01Ch),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Dh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2335
	
l15788:
		movlw	low(menu_handle_button@buf_1720)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1720)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2338
	
l15790:
		movlw	03h-1
	movlb	5	; () banked
	cpfsgt	(0+(_menu+01Dh))&0ffh
	goto	u21361
	goto	u21360

u21361:
	goto	l15830
u21360:
	line	2344
	
l15792:; BSR set to: 5

		movlw	low(menu_handle_button@buf_1722)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1722)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_320)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_320)
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
	line	2345
	
l15794:
		movlw	low(menu_handle_button@buf_1722)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1722)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2348
	
l15796:
	movff	0+(_menu+016h),0+(menu_handle_button@new_time+04h)
	line	2349
	
l15798:
	movff	0+(_menu+017h),0+(menu_handle_button@new_time+05h)
	line	2350
	
l15800:
	movff	0+(_menu+018h),0+(menu_handle_button@new_time+06h)
	line	2351
	
l15802:
	movff	0+(_menu+019h),0+(menu_handle_button@new_time+02h)
	line	2352
	
l15804:
	movff	0+(_menu+01Ah),0+(menu_handle_button@new_time+01h)
	line	2353
	
l15806:
	movff	0+(_menu+01Bh),(menu_handle_button@new_time)
	line	2354
	
l15808:
	movlw	low(01h)
	movlb	3	; () banked
	movwf	(0+(menu_handle_button@new_time+03h))&0ffh
	line	2356
	
l15810:; BSR set to: 3

		movlw	low(menu_handle_button@new_time)
	movwf	((c:rtc_set_time@time))^00h,c
	movlw	high(menu_handle_button@new_time)
	movwf	((c:rtc_set_time@time+1))^00h,c

	call	_rtc_set_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u21371
	goto	u21370
u21371:
	goto	l15824
u21370:
	line	2358
	
l15812:
		movlw	low(STR_321)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_321)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2362
	
l15814:
		movlw	low(menu_handle_button@verify_time)
	movwf	((c:rtc_read_time@time))^00h,c
	movlw	high(menu_handle_button@verify_time)
	movwf	((c:rtc_read_time@time+1))^00h,c

	call	_rtc_read_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u21381
	goto	u21380
u21381:
	goto	l15822
u21380:
	line	2367
	
l15816:
		movlw	low(menu_handle_button@buf_1741)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1741)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_322)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_322)
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
	line	2368
	
l15818:
		movlw	low(menu_handle_button@buf_1741)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1741)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2369
	
l15820:
		movlw	low(STR_323)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_323)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2370
	goto	l15826
	line	2373
	
l15822:
		movlw	low(STR_324)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_324)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l15826
	line	2378
	
l15824:
		movlw	low(STR_325)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_325)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2381
	
l15826:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	goto	l15762
	line	2387
	
l15830:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l15762
	line	2396
	
l15836:
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
	line	2397
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
	movlb	3	; () banked
	movwf	((menu_handle_button@flow_type))&0ffh
	line	2400
	
l15838:; BSR set to: 3

	movff	(menu_handle_button@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_option_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u21391
	goto	u21390
u21391:
	goto	l15942
u21390:
	line	2402
	
l15840:
	movff	(menu_handle_button@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1748)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1748+1)
	line	2403
	movff	(menu_handle_button@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1749)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1749+1)
	line	2405
	
l15842:
	movlb	0	; () banked
	movf	((menu_handle_button@edit_flag_1748))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1748+1))&0ffh,w
	btfsc	status,2
	goto	u21401
	goto	u21400

u21401:
	goto	l15716
u21400:
	
l15844:; BSR set to: 0

	movf	((menu_handle_button@opts_1749))&0ffh,w
iorwf	((menu_handle_button@opts_1749+1))&0ffh,w
	btfsc	status,2
	goto	u21411
	goto	u21410

u21411:
	goto	l15716
u21410:
	line	2408
	
l15846:; BSR set to: 0

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
	movff	(menu_handle_button@edit_flag_1748),fsr2l
	movff	(menu_handle_button@edit_flag_1748+1),fsr2h
	movf	indf2,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movf	((??_menu_handle_button+0+0))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_button+1+0
	movff	prodh,??_menu_handle_button+1+0+1
	movf	(??_menu_handle_button+1+0)&0ffh,w
	addwf	((menu_handle_button@opts_1749))&0ffh,w
	movwf	(??_menu_handle_button+3+0)&0ffh
	movf	(??_menu_handle_button+1+1)&0ffh,w
	addwfc	((menu_handle_button@opts_1749+1))&0ffh,w
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
	line	2411
	
l15848:
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21421
	goto	u21420
u21421:
	goto	l15852
u21420:
	line	2413
	
l15850:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_enable_edit_flag),indf2

	line	2414
	goto	l15936
	line	2415
	
l15852:; BSR set to: 5

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21431
	goto	u21430

u21431:
	goto	l15864
u21430:
	line	2417
	
l15854:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_sensor_edit_flag),indf2

	line	2420
	
l15856:; BSR set to: 5

		movlw	2
	xorwf	((c:_sensor_edit_flag))^00h,c,w
	btfss	status,2
	goto	u21441
	goto	u21440

u21441:
	goto	l15862
u21440:
	
l15858:; BSR set to: 5

		movlw	2
	movlb	3	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfsc	status,2
	goto	u21451
	goto	u21450

u21451:
	goto	l15862
u21450:
	line	2422
	
l15860:; BSR set to: 3

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
	line	2426
	
l15862:
	movlb	5	; () banked
	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	2427
	goto	l15936
	line	2428
	
l15864:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21461
	goto	u21460

u21461:
	goto	l15872
u21460:
	
l15866:; BSR set to: 5

		movlw	2
	movlb	3	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21471
	goto	u21470

u21471:
	goto	l15872
u21470:
	line	2430
	
l15868:; BSR set to: 3

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

	line	2433
	
l15870:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	2434
	goto	l15936
	line	2435
	
l15872:
		movlw	3
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21481
	goto	u21480

u21481:
	goto	l15880
u21480:
	
l15874:; BSR set to: 5

		movlw	2
	movlb	3	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21491
	goto	u21490

u21491:
	goto	l15880
u21490:
	
l15876:; BSR set to: 3

		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u21501
	goto	u21500

u21501:
	goto	l15880
u21500:
	goto	l15936
	line	2438
	
l15878:
	goto	l15936
	line	2439
	
l15880:
		movlw	3
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21511
	goto	u21510

u21511:
	goto	l15888
u21510:
	
l15882:; BSR set to: 5

		movlw	2
	movlb	3	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21521
	goto	u21520

u21521:
	goto	l15888
u21520:
	
l15884:; BSR set to: 3

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u21531
	goto	u21530
u21531:
	goto	l15888
u21530:
	line	2441
	
l15886:; BSR set to: 3

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

	line	2442
	goto	l15936
	line	2443
	
l15888:
	movlb	3	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21541
	goto	u21540
u21541:
	goto	l15906
u21540:
	line	2445
	
l15890:; BSR set to: 3

		movlw	9
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21551
	goto	u21550

u21551:
	goto	l15894
u21550:
	line	2446
	
l15892:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+038h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+038h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_high_edit_flag),indf2

	goto	l15936
	line	2447
	
l15894:; BSR set to: 5

		movlw	10
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21561
	goto	u21560

u21561:
	goto	l15898
u21560:
	line	2448
	
l15896:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+039h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+039h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_plp_edit_flag),indf2

	goto	l15936
	line	2449
	
l15898:; BSR set to: 5

		movlw	11
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21571
	goto	u21570

u21571:
	goto	l15902
u21570:
	line	2450
	
l15900:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_slp_edit_flag),indf2

	goto	l15936
	line	2451
	
l15902:; BSR set to: 5

		movlw	12
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21581
	goto	u21580

u21581:
	goto	l15878
u21580:
	line	2452
	
l15904:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_display_edit_flag),indf2

	goto	l15936
	line	2454
	
l15906:; BSR set to: 3

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21591
	goto	u21590

u21591:
	goto	l15916
u21590:
	line	2456
	
l15908:; BSR set to: 3

		movlw	6
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21601
	goto	u21600

u21601:
	goto	l15912
u21600:
	goto	l15892
	line	2458
	
l15912:; BSR set to: 5

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21611
	goto	u21610

u21611:
	goto	l15878
u21610:
	goto	l15904
	line	2461
	
l15916:; BSR set to: 3

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21621
	goto	u21620

u21621:
	goto	l15878
u21620:
	line	2463
	
l15918:; BSR set to: 3

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u21631
	goto	u21630
u21631:
	goto	l15928
u21630:
	line	2465
	
l15920:; BSR set to: 3

		movlw	8
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21641
	goto	u21640

u21641:
	goto	l15924
u21640:
	line	2466
	
l15922:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Bh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Bh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_low_edit_flag),indf2

	goto	l15936
	line	2467
	
l15924:; BSR set to: 5

		movlw	9
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21651
	goto	u21650

u21651:
	goto	l15878
u21650:
	goto	l15904
	line	2472
	
l15928:; BSR set to: 3

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21661
	goto	u21660

u21661:
	goto	l15932
u21660:
	goto	l15922
	line	2474
	
l15932:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21671
	goto	u21670

u21671:
	goto	l15878
u21670:
	goto	l15904
	line	2479
	
l15936:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	goto	l15716
	line	2486
	
l15942:
	movff	(menu_handle_button@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_time_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u21681
	goto	u21680
u21681:
	goto	l16006
u21680:
	line	2488
	
l15944:
	movlb	5	; () banked
	incf	(0+(_menu+011h))&0ffh
	line	2489
	
l15946:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2490
	
l15948:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2493
	
l15950:
		movlw	low(menu_handle_button@buf_1754)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1754)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_326)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_326)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2494
	
l15952:
		movlw	low(menu_handle_button@buf_1754)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1754)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2496
	
l15954:
	call	_menu_update_time_value	;wreg free
	line	2498
	
l15956:
		movlw	02h-1
	movlb	5	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u21691
	goto	u21690

u21691:
	goto	l1274
u21690:
	line	2502
	
l15958:; BSR set to: 5

	movf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u21701
	goto	u21700
u21701:
	goto	l15962
u21700:
	line	2503
	
l15960:; BSR set to: 5

	movf	(0+(_menu+012h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+(_menu+013h))&0ffh,w
	movlb	0	; () banked
	addwf	(??_menu_handle_button+0+0)&0ffh,w
	movlb	3	; () banked
	movwf	((menu_handle_button@new_seconds_1756))&0ffh
	movlb	5	; () banked
	movlw	0
	movlb	0	; () banked
	addwfc	(??_menu_handle_button+0+1)&0ffh,w
	movlb	3	; () banked
	movwf	1+((menu_handle_button@new_seconds_1756))&0ffh
	goto	l15964
	line	2505
	
l15962:; BSR set to: 5

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
	movlb	3	; () banked
	movwf	((menu_handle_button@new_seconds_1756))&0ffh
	movf	(1+?___wmul)^00h,c,w
	movlb	0	; () banked
	addwfc	(??_menu_handle_button+0+1)&0ffh,w
	movlb	3	; () banked
	movwf	1+((menu_handle_button@new_seconds_1756))&0ffh
	line	2508
	
l15964:; BSR set to: 3

	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21711
	goto	u21710
u21711:
	goto	l15978
u21710:
	line	2510
	
l15966:; BSR set to: 3

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21721
	goto	u21720

u21721:
	goto	l15970
u21720:
	line	2511
	
l15968:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_seconds_1756),postinc2
	movff	(menu_handle_button@new_seconds_1756+1),postdec2
	goto	l15998
	line	2512
	
l15970:; BSR set to: 5

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21731
	goto	u21730

u21731:
	goto	l15974
u21730:
	line	2513
	
l15972:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_seconds_1756),postinc2
	movff	(menu_handle_button@new_seconds_1756+1),postdec2
	goto	l15998
	line	2514
	
l15974:; BSR set to: 5

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21741
	goto	u21740

u21741:
	goto	l1338
u21740:
	line	2515
	
l15976:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_seconds_1756),postinc2
	movff	(menu_handle_button@new_seconds_1756+1),postdec2
	goto	l15998
	line	2516
	
l1338:; BSR set to: 5

	goto	l15998
	line	2517
	
l15978:; BSR set to: 3

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21751
	goto	u21750

u21751:
	goto	l15984
u21750:
	line	2519
	
l15980:; BSR set to: 3

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21761
	goto	u21760

u21761:
	goto	l15998
u21760:
	goto	l15968
	line	2522
	
l15984:; BSR set to: 3

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21771
	goto	u21770

u21771:
	goto	l15998
u21770:
	line	2524
	
l15986:; BSR set to: 3

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u21781
	goto	u21780
u21781:
	goto	l15992
u21780:
	
l15988:; BSR set to: 3

		movlw	7
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21791
	goto	u21790

u21791:
	goto	l15992
u21790:
	line	2525
	
l15990:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_seconds_1756),postinc2
	movff	(menu_handle_button@new_seconds_1756+1),postdec2
	goto	l15998
	line	2526
	
l15992:
	movlb	3	; () banked
		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u21801
	goto	u21800

u21801:
	goto	l15998
u21800:
	
l15994:; BSR set to: 3

		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21811
	goto	u21810

u21811:
	goto	l15998
u21810:
	goto	l15990
	line	2532
	
l15998:
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
		movlw	low(STR_327)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_327)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2534
	
l16000:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2535
	
l16002:; BSR set to: 5

	movlw	low(01h)
	movwf	((_save_pending))&0ffh
	line	2536
	
l16004:; BSR set to: 5

		movlw	low(STR_328)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_328)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1274
	line	2540
	
l16006:
	movff	(menu_handle_button@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_numeric_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u21821
	goto	u21820
u21821:
	goto	l1268
u21820:
	line	2542
	
l16008:
	movlb	5	; () banked
	incf	(0+(_menu+08h))&0ffh
	line	2543
	
l16010:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2545
	
l16012:
		movlw	2
	movlb	5	; () banked
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u21831
	goto	u21830

u21831:
	goto	l16018
u21830:
	
l16014:; BSR set to: 5

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u21841
	goto	u21840

u21841:
	goto	l16018
u21840:
	line	2547
	
l16016:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+0Bh))&0ffh
	line	2548
	movlw	low(0)
	movwf	(0+(_menu+0Ch))&0ffh
	line	2551
	
l16018:; BSR set to: 5

		movlw	04h-1
	cpfsgt	(0+(_menu+08h))&0ffh
	goto	u21851
	goto	u21850

u21851:
	goto	l1268
u21850:
	line	2553
	
l16020:; BSR set to: 5

	call	_get_current_numeric_value	;wreg free
	movff	0+?_get_current_numeric_value,(menu_handle_button@new_value_1759)
	movff	1+?_get_current_numeric_value,(menu_handle_button@new_value_1759+1)
	line	2556
	
l16022:; BSR set to: 5

	movlb	3	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21861
	goto	u21860
u21861:
	goto	l16046
u21860:
	line	2558
	
l16024:; BSR set to: 3

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21871
	goto	u21870

u21871:
	goto	l16030
u21870:
	line	2560
	
l16026:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1759),postinc2
	movff	(menu_handle_button@new_value_1759+1),postdec2
	line	2561
	
l16028:; BSR set to: 5

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_329)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_329)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1759),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1759+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2562
	goto	l16088
	line	2563
	
l16030:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21881
	goto	u21880

u21881:
	goto	l16036
u21880:
	line	2565
	
l16032:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1759),postinc2
	movff	(menu_handle_button@new_value_1759+1),postdec2
	line	2566
	
l16034:; BSR set to: 5

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_330)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_330)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1759),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1759+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2567
	goto	l16088
	line	2568
	
l16036:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21891
	goto	u21890

u21891:
	goto	l16042
u21890:
	line	2570
	
l16038:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1759),postinc2
	movff	(menu_handle_button@new_value_1759+1),postdec2
	line	2571
	
l16040:; BSR set to: 5

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_331)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_331)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1759),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1759+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2572
	goto	l16088
	line	2573
	
l16042:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21901
	goto	u21900

u21901:
	goto	l1358
u21900:
	line	2576
	
l16044:; BSR set to: 5

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_332)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_332)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1759),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1759+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l16088
	line	2578
	
l1358:; BSR set to: 5

	goto	l16088
	line	2579
	
l16046:; BSR set to: 3

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21911
	goto	u21910

u21911:
	goto	l16066
u21910:
	line	2581
	
l16048:; BSR set to: 3

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21921
	goto	u21920

u21921:
	goto	l16054
u21920:
	line	2583
	
l16050:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1759),postinc2
	movff	(menu_handle_button@new_value_1759+1),postdec2
	line	2584
	
l16052:; BSR set to: 5

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_333)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_333)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1759),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1759+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2585
	goto	l16088
	line	2586
	
l16054:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21931
	goto	u21930

u21931:
	goto	l16060
u21930:
	line	2588
	
l16056:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1759),postinc2
	movff	(menu_handle_button@new_value_1759+1),postdec2
	line	2589
	
l16058:; BSR set to: 5

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_334)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_334)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1759),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1759+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2590
	goto	l16088
	line	2591
	
l16060:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21941
	goto	u21940

u21941:
	goto	l1358
u21940:
	line	2593
	
l16062:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1759),postinc2
	movff	(menu_handle_button@new_value_1759+1),postdec2
	line	2594
	
l16064:; BSR set to: 5

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_335)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_335)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1759),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1759+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l16088
	line	2597
	
l16066:; BSR set to: 3

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u21951
	goto	u21950

u21951:
	goto	l16088
u21950:
	
l16068:; BSR set to: 3

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u21961
	goto	u21960
u21961:
	goto	l16088
u21960:
	line	2599
	
l16070:; BSR set to: 3

		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21971
	goto	u21970

u21971:
	goto	l16076
u21970:
	line	2601
	
l16072:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1759),postinc2
	movff	(menu_handle_button@new_value_1759+1),postdec2
	line	2602
	
l16074:; BSR set to: 5

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_336)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_336)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1759),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1759+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2603
	goto	l16088
	line	2604
	
l16076:; BSR set to: 5

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21981
	goto	u21980

u21981:
	goto	l16082
u21980:
	line	2606
	
l16078:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1759),postinc2
	movff	(menu_handle_button@new_value_1759+1),postdec2
	line	2607
	
l16080:; BSR set to: 5

		movff	0+(_input_menu+01Bh),(c:sprintf@sp)
	movff	1+(_input_menu+01Bh),(c:sprintf@sp+1)

		movlw	low(STR_337)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_337)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1759),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1759+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2608
	goto	l16088
	line	2609
	
l16082:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u21991
	goto	u21990

u21991:
	goto	l1358
u21990:
	line	2611
	
l16084:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+020h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+020h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value_1759),postinc2
	movff	(menu_handle_button@new_value_1759+1),postdec2
	line	2612
	
l16086:; BSR set to: 5

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_338)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_338)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1759),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1759+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	2616
	
l16088:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	line	2617
	
l16090:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	goto	l1274
	line	2621
	
l16092:; BSR set to: 5

		movlw	2
	movlb	2	; () banked
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u22001
	goto	u22000

u22001:
	goto	l16114
u22000:
	line	2624
	
l16094:; BSR set to: 2

		movlw	4
	movlb	5	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22011
	goto	u22010

u22011:
	goto	l16102
u22010:
	
l16096:; BSR set to: 5

	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u22021
	goto	u22020
u22021:
	goto	l16102
u22020:
	line	2626
	
l16098:; BSR set to: 5

		movlw	low(STR_339)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_339)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2627
	
l16100:
	call	_init_datetime_editor	;wreg free
	line	2630
	
l16102:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	2631
	
l16104:; BSR set to: 5

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2632
	
l16106:
	asmopt push
asmopt off
movlw  3
	movlb	0	; () banked
movwf	(??_menu_handle_button+0+0+1)&0ffh
movlw	8
movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	119
u23397:
decfsz	wreg,f
	bra	u23397
	decfsz	(??_menu_handle_button+0+0)&0ffh,f
	bra	u23397
	decfsz	(??_menu_handle_button+0+0+1)&0ffh,f
	bra	u23397
asmopt pop

	line	2633
	
l16108:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2636
	
l16110:
		movlw	4
	movlb	5	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22031
	goto	u22030

u22031:
	goto	l1274
u22030:
	goto	l15762
	line	2642
	
l16114:; BSR set to: 2

		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u22041
	goto	u22040

u22041:
	goto	l16486
u22040:
	line	2644
	
l16116:; BSR set to: 2

	movlb	5	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22051
	goto	u22050
u22051:
	goto	l16148
u22050:
	line	2646
	
l16118:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2648
	goto	l16146
	line	2654
	
l16120:; BSR set to: 5

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	2655
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2656
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2657
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2658
	
l16122:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	2659
	goto	l1274
	line	2662
	
l16124:; BSR set to: 5

	call	_rebuild_utility_menu	;wreg free
	line	2663
	
l16126:; BSR set to: 5

	movlw	low(04h)
	movwf	((_current_menu))&0ffh
	line	2664
	
l16128:; BSR set to: 5

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2665
	
l16130:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2669
	
l16132:; BSR set to: 5

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	goto	l15762
	line	2677
	
l16136:; BSR set to: 5

	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u22061
	goto	u22060
u22061:
	goto	l16142
u22060:
	line	2679
	
l16138:; BSR set to: 5

	call	_save_current_config	;wreg free
	line	2680
	
l16140:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_save_pending))&0ffh
	line	2682
	
l16142:; BSR set to: 5

	setf	((_current_menu))&0ffh
	line	2683
	goto	l1274
	line	2648
	
l16146:
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
	goto	l1268
	xorlw	1^0	; case 1
	skipnz
	goto	l16120
	xorlw	2^1	; case 2
	skipnz
	goto	l16124
	xorlw	3^2	; case 3
	skipnz
	goto	l1268
	xorlw	4^3	; case 4
	skipnz
	goto	l16136
	goto	l1274

	line	2686
	
l16148:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22071
	goto	u22070

u22071:
	goto	l16298
u22070:
	line	2688
	
l16150:; BSR set to: 5

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
	bnz	u22081
movf	(??_menu_handle_button+0+1)&0ffh,w
xorwf	(??_menu_handle_button+2+1)&0ffh,w
	btfss	status,2
	goto	u22081
	goto	u22080

u22081:
	goto	l16164
u22080:
	line	2690
	
l16152:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2691
	
l16154:
	movlw	low(02h)
	movlb	5	; () banked
	movwf	((_current_menu))&0ffh
	line	2692
	
l16156:; BSR set to: 5

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2693
	
l16158:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2694
	
l16160:; BSR set to: 5

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l16122
	line	2697
	
l16164:; BSR set to: 0

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
	goto	u22091
	goto	u22090
u22091:
	goto	l1274
u22090:
	line	2699
	
l16166:; BSR set to: 5

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
	movwf	((menu_handle_button@sensor_type_1775))&0ffh
	line	2700
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
	movwf	((menu_handle_button@flow_type_1776))&0ffh
	line	2703
	
l16168:; BSR set to: 2

	movff	(menu_handle_button@sensor_type_1775),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type_1776),(c:is_numeric_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u22101
	goto	u22100
u22101:
	goto	l16226
u22100:
	line	2705
	
l16170:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val))&0ffh
	line	2708
	movlb	3	; () banked
	movf	((menu_handle_button@sensor_type_1775))&0ffh,w
	btfss	status,2
	goto	u22111
	goto	u22110
u22111:
	goto	l16188
u22110:
	line	2710
	
l16172:; BSR set to: 3

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22121
	goto	u22120

u22121:
	goto	l16176
u22120:
	line	2711
	
l16174:; BSR set to: 5

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
	goto	l16218
	line	2712
	
l16176:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22131
	goto	u22130

u22131:
	goto	l16180
u22130:
	line	2713
	
l16178:; BSR set to: 5

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
	goto	l16218
	line	2714
	
l16180:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22141
	goto	u22140

u22141:
	goto	l16184
u22140:
	line	2715
	
l16182:; BSR set to: 5

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
	goto	l16218
	line	2716
	
l16184:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22151
	goto	u22150

u22151:
	goto	l1405
u22150:
	line	2717
	
l16186:; BSR set to: 5

	movlw	high(032h)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(032h)
	movwf	((menu_handle_button@current_val))&0ffh
	goto	l16218
	line	2718
	
l1405:; BSR set to: 5

	goto	l16218
	line	2719
	
l16188:; BSR set to: 3

		decf	((menu_handle_button@sensor_type_1775))&0ffh,w
	btfss	status,2
	goto	u22161
	goto	u22160

u22161:
	goto	l16202
u22160:
	line	2721
	
l16190:; BSR set to: 3

		movlw	2
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22171
	goto	u22170

u22171:
	goto	l16194
u22170:
	goto	l16174
	line	2723
	
l16194:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22181
	goto	u22180

u22181:
	goto	l16198
u22180:
	goto	l16178
	line	2725
	
l16198:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22191
	goto	u22190

u22191:
	goto	l1405
u22190:
	goto	l16182
	line	2728
	
l16202:; BSR set to: 3

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1775))&0ffh,w
	btfss	status,2
	goto	u22201
	goto	u22200

u22201:
	goto	l16218
u22200:
	
l16204:; BSR set to: 3

	movlb	2	; () banked
	movf	((menu_handle_button@flow_type_1776))&0ffh,w
	btfss	status,2
	goto	u22211
	goto	u22210
u22211:
	goto	l16218
u22210:
	line	2730
	
l16206:; BSR set to: 2

		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22221
	goto	u22220

u22221:
	goto	l16210
u22220:
	goto	l16174
	line	2732
	
l16210:; BSR set to: 5

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22231
	goto	u22230

u22231:
	goto	l16214
u22230:
	goto	l16178
	line	2734
	
l16214:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22241
	goto	u22240

u22241:
	goto	l1405
u22240:
	line	2735
	
l16216:; BSR set to: 5

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
	line	2738
	
l16218:
	movff	(menu_handle_button@current_val),(c:init_numeric_editor@value)
	movff	(menu_handle_button@current_val+1),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	2739
	
l16220:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2740
	
l16222:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l15718
	line	2744
	
l16226:
	movff	(menu_handle_button@sensor_type_1775),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type_1776),(c:is_time_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u22251
	goto	u22250
u22251:
	goto	l16272
u22250:
	line	2746
	
l16228:
	movlw	high(0)
	movlb	0	; () banked
	movwf	((menu_handle_button@current_val_1779+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val_1779))&0ffh
	line	2749
	movlb	3	; () banked
	movf	((menu_handle_button@sensor_type_1775))&0ffh,w
	btfss	status,2
	goto	u22261
	goto	u22260
u22261:
	goto	l16242
u22260:
	line	2751
	
l16230:; BSR set to: 3

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22271
	goto	u22270

u22271:
	goto	l16234
u22270:
	line	2752
	
l16232:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1779)
	movff	postdec2,(menu_handle_button@current_val_1779+1)
	goto	l16260
	line	2753
	
l16234:; BSR set to: 5

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22281
	goto	u22280

u22281:
	goto	l16238
u22280:
	line	2754
	
l16236:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1779)
	movff	postdec2,(menu_handle_button@current_val_1779+1)
	goto	l16260
	line	2755
	
l16238:; BSR set to: 5

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22291
	goto	u22290

u22291:
	goto	l1427
u22290:
	line	2756
	
l16240:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1779)
	movff	postdec2,(menu_handle_button@current_val_1779+1)
	goto	l16260
	line	2757
	
l1427:; BSR set to: 5

	goto	l16260
	line	2758
	
l16242:; BSR set to: 3

		decf	((menu_handle_button@sensor_type_1775))&0ffh,w
	btfss	status,2
	goto	u22301
	goto	u22300

u22301:
	goto	l16248
u22300:
	line	2760
	
l16244:; BSR set to: 3

		movlw	5
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22311
	goto	u22310

u22311:
	goto	l16260
u22310:
	goto	l16232
	line	2763
	
l16248:; BSR set to: 3

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1775))&0ffh,w
	btfss	status,2
	goto	u22321
	goto	u22320

u22321:
	goto	l16260
u22320:
	line	2766
	
l16250:; BSR set to: 3

	movlb	2	; () banked
	movf	((menu_handle_button@flow_type_1776))&0ffh,w
	btfss	status,2
	goto	u22331
	goto	u22330
u22331:
	goto	l16254
u22330:
	
l16252:; BSR set to: 2

		movlw	7
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u22341
	goto	u22340

u22341:
	goto	l16258
u22340:
	
l16254:
	movlb	2	; () banked
		decf	((menu_handle_button@flow_type_1776))&0ffh,w
	btfss	status,2
	goto	u22351
	goto	u22350

u22351:
	goto	l16260
u22350:
	
l16256:; BSR set to: 2

		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22361
	goto	u22360

u22361:
	goto	l16260
u22360:
	line	2767
	
l16258:; BSR set to: 5

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1779)
	movff	postdec2,(menu_handle_button@current_val_1779+1)
	line	2771
	
l16260:
		movlw	low(menu_handle_button@buf_1780)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1780)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_340)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_340)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@current_val_1779),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@current_val_1779+1),1+((c:?_sprintf)+04h)
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2772
	
l16262:
		movlw	low(menu_handle_button@buf_1780)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1780)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2774
	
l16264:
	movff	(menu_handle_button@current_val_1779),(c:init_time_editor@value_seconds)
	movff	(menu_handle_button@current_val_1779+1),(c:init_time_editor@value_seconds+1)
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	goto	l16220
	line	2780
	
l16272:
	movff	(menu_handle_button@sensor_type_1775),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type_1776),(c:is_option_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u22371
	goto	u22370
u22371:
	goto	l1268
u22370:
	line	2782
	
l16274:
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
	line	2784
	
l16276:
	movff	(menu_handle_button@sensor_type_1775),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type_1776),(c:get_option_edit_flag@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1783)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1783+1)
	line	2785
	
l16278:
	movff	(menu_handle_button@sensor_type_1775),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type_1776),(c:get_item_options_for_field@flow_type)
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1784)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1784+1)
	line	2787
	
l16280:
	movlb	0	; () banked
	movf	((menu_handle_button@edit_flag_1783))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1783+1))&0ffh,w
	btfsc	status,2
	goto	u22381
	goto	u22380

u22381:
	goto	l16294
u22380:
	
l16282:; BSR set to: 0

	movlb	1	; () banked
	movf	((menu_handle_button@opts_1784))&0ffh,w
iorwf	((menu_handle_button@opts_1784+1))&0ffh,w
	btfsc	status,2
	goto	u22391
	goto	u22390

u22391:
	goto	l16294
u22390:
	line	2790
	
l16284:; BSR set to: 1

	movlw	low(0)
	movwf	((menu_handle_button@i))&0ffh
	goto	l16292
	line	2792
	
l16286:; BSR set to: 1

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
	addwf	((menu_handle_button@opts_1784))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+2+0)&0ffh
	movf	(??_menu_handle_button+0+1)&0ffh,w
	movlb	1	; () banked
	addwfc	((menu_handle_button@opts_1784+1))&0ffh,w
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
	goto	u22401
	goto	u22400

u22401:
	goto	l16290
u22400:
	line	2794
	
l16288:
	movff	(menu_handle_button@edit_flag_1783),fsr2l
	movff	(menu_handle_button@edit_flag_1783+1),fsr2h
	movff	(menu_handle_button@i),indf2

	line	2795
	goto	l16294
	line	2790
	
l16290:
	movlb	1	; () banked
	incf	((menu_handle_button@i))&0ffh
	
l16292:; BSR set to: 1

	movlw	01h
	addwf	((menu_handle_button@opts_1784))&0ffh,w
	movlb	0	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	0
	movlb	1	; () banked
	addwfc	((menu_handle_button@opts_1784+1))&0ffh,w
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
	goto	u22411
	goto	u22410

u22411:
	goto	l16286
u22410:
	line	2800
	
l16294:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2801
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l15718
	line	2806
	
l16298:; BSR set to: 5

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22421
	goto	u22420

u22421:
	goto	l16332
u22420:
	line	2808
	
l16300:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2810
	
l16302:
		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22431
	goto	u22430

u22431:
	goto	l16308
u22430:
	line	2812
	
l16304:; BSR set to: 5

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	2813
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2814
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2815
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2816
	
l16306:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	2817
	goto	l1274
	line	2818
	
l16308:; BSR set to: 5

		movlw	03h-0
	cpfslt	((_menu))&0ffh
	goto	u22441
	goto	u22440

u22441:
	goto	l16320
u22440:
	line	2820
	
l16310:; BSR set to: 5

	movf	((_menu))&0ffh,w
	
	call	_rebuild_input_menu
	line	2821
	
l16312:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_current_menu))&0ffh
	line	2822
	
l16314:; BSR set to: 5

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2823
	
l16316:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2824
	
l16318:; BSR set to: 5

	call	_menu_draw_input	;wreg free
	line	2825
	goto	l1274
	line	2826
	
l16320:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22451
	goto	u22450

u22451:
	goto	l1268
u22450:
	line	2828
	
l16322:; BSR set to: 5

	call	_rebuild_clock_menu	;wreg free
	line	2829
	
l16324:
	movlw	low(03h)
	movlb	5	; () banked
	movwf	((_current_menu))&0ffh
	line	2830
	
l16326:; BSR set to: 5

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2831
	
l16328:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2832
	
l16330:
	call	_menu_draw_clock	;wreg free
	goto	l1274
	line	2835
	
l16332:; BSR set to: 5

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22461
	goto	u22460

u22461:
	goto	l16398
u22460:
	line	2839
	
l16334:; BSR set to: 5

		movlw	05h-1
	cpfsgt	((_menu))&0ffh
	goto	u22471
	goto	u22470

u22471:
	goto	l16338
u22470:
	
l16336:; BSR set to: 5

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_menu_handle_button$1792+1))&0ffh
	movlw	low(0)
	movwf	((_menu_handle_button$1792))&0ffh
	goto	l16340
	
l16338:; BSR set to: 5

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
	movwf	((_menu_handle_button$1792))&0ffh
	clrf	((_menu_handle_button$1792+1))&0ffh
	
l16340:; BSR set to: 0

		movlw	low(menu_handle_button@buf_1790)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1790)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_341)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_341)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu_handle_button$1792),0+((c:?_sprintf)+06h)
	movff	(_menu_handle_button$1792+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	2840
	
l16342:
		movlw	low(menu_handle_button@buf_1790)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1790)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2842
		movlw	4
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22481
	goto	u22480

u22481:
	goto	l16356
u22480:
	goto	l16152
	line	2852
	
l16356:; BSR set to: 5

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
	goto	u22491
	goto	u22490
u22491:
	goto	l16396
u22490:
	line	2854
	
l16358:; BSR set to: 5

		movlw	low(STR_342)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_342)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2857
	
l16360:
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
	line	2860
	
l16362:
	movlb	5	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22501
	goto	u22500
u22501:
	goto	l16366
u22500:
	line	2862
	
l16364:; BSR set to: 5

		movff	0+(_clock_menu+02h),(c:strcmp@s1)
	movff	1+(_clock_menu+02h),(c:strcmp@s1+1)

		movlw	low(STR_343)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_343)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u22511
	goto	u22510

u22511:
	movlw	1
	goto	u22520
u22510:
	movlw	0
u22520:
	movwf	((c:_enable_edit_flag))^00h,c
	line	2863
	goto	l16388
	line	2864
	
l16366:; BSR set to: 5

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22531
	goto	u22530

u22531:
	goto	l16378
u22530:
	line	2866
	
l16368:; BSR set to: 5

		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_344)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_344)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u22541
	goto	u22540

u22541:
	goto	l16372
u22540:
	line	2867
	
l16370:
	movlw	low(0)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l16388
	line	2868
	
l16372:
		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_345)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_345)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u22551
	goto	u22550

u22551:
	goto	l16376
u22550:
	line	2869
	
l16374:
	movlw	low(01h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l16388
	line	2871
	
l16376:
	movlw	low(02h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l16388
	line	2873
	
l16378:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22561
	goto	u22560

u22561:
	goto	l16384
u22560:
	line	2876
	
l16380:; BSR set to: 5

	movff	0+(_system_config+07h),0+(_menu+0Dh)
	clrf	(1+(_menu+0Dh))&0ffh
	line	2877
	
l16382:; BSR set to: 5

	movff	0+(_system_config+07h),(c:init_time_editor@value_seconds)
	clrf	((c:init_time_editor@value_seconds+1))^00h,c
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	line	2878
	goto	l16388
	line	2879
	
l16384:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22571
	goto	u22570

u22571:
	goto	l1471
u22570:
	line	2881
	
l16386:; BSR set to: 5

		movff	0+(_clock_menu+011h),(c:strcmp@s1)
	movff	1+(_clock_menu+011h),(c:strcmp@s1+1)

		movlw	low(STR_346)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_346)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u22581
	goto	u22580

u22581:
	movlw	1
	goto	u22590
u22580:
	movlw	0
u22590:
	movwf	((c:_display_edit_flag))^00h,c
	goto	l16388
	line	2884
	
l1471:; BSR set to: 5

	
l16388:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2885
	
l16390:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2886
	
l16392:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l16330
	line	2893
	
l16396:; BSR set to: 5

		movlw	low(STR_347)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_347)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1274
	line	2896
	
l16398:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22601
	goto	u22600

u22601:
	goto	l1268
u22600:
	line	2898
	
l16400:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2901
	
l16402:
		movlw	low(menu_handle_button@buf_1799)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1799)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_348)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_348)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Eh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+01Ch),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	2902
	
l16404:
		movlw	low(menu_handle_button@buf_1799)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1799)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2905
	
l16406:
	movlb	5	; () banked
	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u22611
	goto	u22610
u22611:
	goto	l16432
u22610:
	line	2907
	
l16408:; BSR set to: 5

	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u22621
	goto	u22620
u22621:
	goto	l16416
u22620:
	line	2910
	
l16410:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+03h))&0ffh
	line	2911
	movlw	low(0)
	movwf	(0+(_menu+01Dh))&0ffh
	line	2912
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2913
	
l16412:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2914
	
l16414:
		movlw	low(STR_349)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_349)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2915
	goto	l1274
	line	2916
	
l16416:; BSR set to: 5

		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u22631
	goto	u22630

u22631:
	goto	l16424
u22630:
	line	2919
	
l16418:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+03h))&0ffh
	line	2920
	movlw	low(0)
	movwf	(0+(_menu+01Dh))&0ffh
	line	2921
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2922
	
l16420:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2923
	
l16422:
		movlw	low(STR_350)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_350)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2924
	goto	l1274
	line	2925
	
l16424:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u22641
	goto	u22640

u22641:
	goto	l1268
u22640:
	line	2927
	
l16426:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Eh))&0ffh
	line	2928
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2929
	
l16428:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2930
	
l16430:
		movlw	low(STR_351)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_351)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1274
	line	2933
	
l16432:; BSR set to: 5

	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22651
	goto	u22650
u22651:
	goto	l16446
u22650:
	line	2935
	
l16434:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2936
	
l16436:
	call	_init_datetime_editor	;wreg free
	line	2937
	
l16438:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+01Eh))&0ffh
	line	2938
	
l16440:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Ch))&0ffh
	line	2939
	
l16442:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2940
	
l16444:
		movlw	low(STR_352)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_352)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2941
	goto	l1274
	line	2942
	
l16446:; BSR set to: 5

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22661
	goto	u22660

u22661:
	goto	l16458
u22660:
	line	2944
	
l16448:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2946
	
l16450:
	movff	0+(_system_config+020h),(c:init_numeric_editor@value)
	movff	1+(_system_config+020h),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	2947
	
l16452:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+03h))&0ffh
	line	2948
	
l16454:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2949
	
l16456:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2950
		movlw	low(STR_353)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_353)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2951
	goto	l1274
	line	2952
	
l16458:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22671
	goto	u22670

u22671:
	goto	l16472
u22670:
	line	2954
	
l16460:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2956
	
l16462:
	movff	0+(_system_config+01h),(c:init_time_editor@value_seconds)
	clrf	((c:init_time_editor@value_seconds+1))^00h,c
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	line	2957
	
l16464:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2958
	
l16466:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2959
	
l16468:; BSR set to: 5

	call	_menu_draw_utility	;wreg free
	line	2960
	
l16470:
		movlw	low(STR_354)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_354)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2961
	goto	l1274
	line	2962
	
l16472:; BSR set to: 5

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u22681
	goto	u22680

u22681:
	goto	l1268
u22680:
	line	2964
	
l16474:; BSR set to: 5

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2966
	
l16476:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_current_menu))&0ffh
	line	2967
	
l16478:; BSR set to: 5

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2968
	
l16480:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2969
	
l16482:; BSR set to: 5

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l16306
	line	2975
	
l16486:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u22691
	goto	u22690

u22691:
	goto	l1274
u22690:
	line	2978
	
l16488:; BSR set to: 2

		movlw	low(menu_handle_button@buf_1809)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1809)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_355)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_355)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	2979
	
l16490:
		movlw	low(menu_handle_button@buf_1809)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1809)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2981
	
l16492:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2982
	
l16494:
	asmopt push
asmopt off
movlw  3
	movlb	0	; () banked
movwf	(??_menu_handle_button+0+0+1)&0ffh
movlw	8
movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	119
u23407:
decfsz	wreg,f
	bra	u23407
	decfsz	(??_menu_handle_button+0+0)&0ffh,f
	bra	u23407
	decfsz	(??_menu_handle_button+0+0+1)&0ffh,f
	bra	u23407
asmopt pop

	line	2983
	
l16496:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2985
	
l16498:
	movlb	5	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22701
	goto	u22700
u22701:
	goto	l16504
u22700:
	line	2987
	
l16500:; BSR set to: 5

	setf	((_current_menu))&0ffh
	line	2988
	
l16502:; BSR set to: 5

		movlw	low(STR_356)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_356)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2989
	goto	l1274
	line	2990
	
l16504:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22711
	goto	u22710

u22711:
	goto	l16512
u22710:
	line	2992
	
l16506:; BSR set to: 5

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	2993
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2994
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2995
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2996
	
l16508:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	2997
	
l16510:
		movlw	low(STR_357)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_357)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2998
	goto	l1274
	line	2999
	
l16512:; BSR set to: 5

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22721
	goto	u22720

u22721:
	goto	l16520
u22720:
	line	3001
	
l16514:; BSR set to: 5

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	3002
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	3003
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	3004
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	3005
	
l16516:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	3006
	
l16518:
		movlw	low(STR_358)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_358)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	3007
	goto	l1274
	line	3008
	
l16520:; BSR set to: 5

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22731
	goto	u22730

u22731:
	goto	l16528
u22730:
	line	3010
	
l16522:; BSR set to: 5

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	3011
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	3012
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	3013
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	3014
	
l16524:; BSR set to: 5

	call	_menu_draw_setup	;wreg free
	line	3015
	
l16526:
		movlw	low(STR_359)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_359)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	3016
	goto	l1274
	line	3017
	
l16528:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u22741
	goto	u22740

u22741:
	goto	l1268
u22740:
	line	3019
	
l16530:; BSR set to: 5

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	3020
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	3021
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	3022
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	3023
	
l16532:; BSR set to: 5

	call	_menu_draw_options	;wreg free
	line	3024
	
l16534:
		movlw	low(STR_360)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_360)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	3029
	
l1274:
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
	
l13506:
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
	
l13508:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	128
	
l13510:
	movlb	0	; () banked
	movf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u18051
	goto	u18050
u18051:
	goto	l150
u18050:
	line	130
	
l13512:; BSR set to: 0

	movlw	low(01h)
	movwf	((_relay_state))&0ffh	;volatile
	line	132
	movf	((trigger_relay_pulse@latch_mode))&0ffh,w
	btfsc	status,2
	goto	u18061
	goto	u18060
u18061:
	goto	l13518
u18060:
	line	135
	
l13514:; BSR set to: 0

	movlw	high(0)
	movlb	5	; () banked
	movwf	((_relay_counter+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_relay_counter))&0ffh	;volatile
	line	136
	
l13516:; BSR set to: 5

		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	137
	goto	l13524
	line	141
	
l13518:; BSR set to: 0

	movlb	7	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	mullw	064h
	movff	prodl,(_relay_counter)	;volatile
	movff	prodh,(_relay_counter+1)	;volatile
	line	142
	
l13520:; BSR set to: 7

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
	
l13522:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	146
	
l13524:
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
	
l14666:; BSR set to: 3

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
	
l14668:; BSR set to: 0

		movlw	low(rtc_set_time@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_361)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_361)
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
	
l14670:
		movlw	low(rtc_set_time@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	96
	
l14672:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u19741
	goto	u19740
u19741:
	goto	l14678
u19740:
	line	97
	
l14674:
	movlw	(01h)&0ffh
	goto	l1766
	line	98
	
l14678:
	asmopt push
asmopt off
	movlw	133
u23417:
decfsz	wreg,f
	bra	u23417
	nop
asmopt pop

	line	100
	
l14680:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19751
	goto	u19750
u19751:
	goto	l14686
u19750:
	goto	l14674
	line	102
	
l14686:
	asmopt push
asmopt off
	movlw	133
u23427:
decfsz	wreg,f
	bra	u23427
	nop
asmopt pop

	line	104
	
l14688:
	movlw	(0)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19761
	goto	u19760
u19761:
	goto	l14694
u19760:
	goto	l14674
	line	106
	
l14694:
	asmopt push
asmopt off
	movlw	133
u23437:
decfsz	wreg,f
	bra	u23437
	nop
asmopt pop

	line	108
	
l14696:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((rtc_set_time@i))&0ffh
	line	110
	
l14702:; BSR set to: 0

	movf	((rtc_set_time@i))&0ffh,w
	addlw	low(rtc_set_time@data)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u19771
	goto	u19770
u19771:
	goto	l14708
u19770:
	goto	l14674
	line	112
	
l14708:
	asmopt push
asmopt off
	movlw	133
u23447:
decfsz	wreg,f
	bra	u23447
	nop
asmopt pop

	line	108
	
l14710:
	movlb	0	; () banked
	incf	((rtc_set_time@i))&0ffh
		movlw	07h-1
	cpfsgt	((rtc_set_time@i))&0ffh
	goto	u19781
	goto	u19780

u19781:
	goto	l14702
u19780:
	line	115
	
l14712:; BSR set to: 0

	call	_i2c_stop	;wreg free
	line	116
	
l14714:
	asmopt push
asmopt off
	movlw	228
u23457:
	nop2
	nop2
decfsz	wreg,f
	bra	u23457
	nop2
	nop2
asmopt pop

	line	117
	
l14716:
	movlw	(0)&0ffh
	line	118
	
l1766:
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
	
l13502:
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
	
l1760:
	return	;funcret
	callstack 0
GLOBAL	__end_of_dec_to_bcd
	__end_of_dec_to_bcd:
	signat	_dec_to_bcd,4217
	global	_rebuild_input_menu

;; *************** function _rebuild_input_menu *****************
;; Defined at:
;;		line 986 in file "src\menu.c"
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
	line	986
global __ptext17
__ptext17:
psect	text17
	file	"src\menu.c"
	line	986
	
_rebuild_input_menu:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((rebuild_input_menu@input_num))&0ffh
	line	989
	
l14270:
	movff	(rebuild_input_menu@input_num),(_current_input)
	line	992
	
l14272:
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
	line	993
	
l14274:; BSR set to: 0

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
	line	996
	
l14276:; BSR set to: 0

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
	goto	u19341
	goto	u19340
u19341:
	goto	l14280
u19340:
	
l14278:; BSR set to: 0

		movlw	low(STR_179)
	movwf	((_rebuild_input_menu$1367))&0ffh
	movlw	high(STR_179)
	movwf	((_rebuild_input_menu$1367+1))&0ffh

	goto	l14282
	
l14280:; BSR set to: 0

		movlw	low(STR_178)
	movwf	((_rebuild_input_menu$1367))&0ffh
	movlw	high(STR_178)
	movwf	((_rebuild_input_menu$1367+1))&0ffh

	
l14282:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_177)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_177)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_input_menu$1367),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$1367+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	998
	
l14284:
	movlb	0	; () banked
	movf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u19351
	goto	u19350
u19351:
	goto	l14390
u19350:
	line	1000
	
l14286:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_180)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_180)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1001
	
l14288:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_181)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_181)
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
	line	1002
	
l14290:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_182)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_182)
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
	line	1003
	
l14292:
		movlw	low(_value_hi_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_hi_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_183)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_183)
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
	line	1006
	
l14294:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3254)
	movff	1+?___lwdiv,(_rebuild_input_menu$3254+1)
	
l14296:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3255)
	movff	1+?___lwmod,(_rebuild_input_menu$3255+1)
	
l14298:
		movlw	low(_value_highbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_highbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_184)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_184)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3254),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3254+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3255),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3255+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1007
	
l14300:
		movlw	low(_value_low_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_185)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_185)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	high(032h)
	movwf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(032h)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1010
	
l14302:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3254)
	movff	1+?___lwdiv,(_rebuild_input_menu$3254+1)
	
l14304:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3255)
	movff	1+?___lwmod,(_rebuild_input_menu$3255+1)
	
l14306:
		movlw	low(_value_plpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_plpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_186)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_186)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3254),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3254+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3255),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3255+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1013
	
l14308:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3254)
	movff	1+?___lwdiv,(_rebuild_input_menu$3254+1)
	
l14310:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3255)
	movff	1+?___lwmod,(_rebuild_input_menu$3255+1)
	
l14312:
		movlw	low(_value_slpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_slpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_187)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_187)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3254),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3254+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3255),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3255+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1016
	
l14314:
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
	goto	u19361
	goto	u19360
u19361:
	goto	l14322
u19360:
	
l14316:; BSR set to: 0

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
	goto	u19371
	goto	u19370

u19371:
	goto	l14320
u19370:
	
l14318:; BSR set to: 0

		movlw	low(STR_190)
	movwf	((_rebuild_input_menu$1382))&0ffh
	movlw	high(STR_190)
	movwf	((_rebuild_input_menu$1382+1))&0ffh

	goto	l784
	
l14320:; BSR set to: 0

		movlw	low(STR_189)
	movwf	((_rebuild_input_menu$1382))&0ffh
	movlw	high(STR_189)
	movwf	((_rebuild_input_menu$1382+1))&0ffh

	
l784:; BSR set to: 0

		movff	(_rebuild_input_menu$1382),(_rebuild_input_menu$1381)
	movff	(_rebuild_input_menu$1382+1),(_rebuild_input_menu$1381+1)

	goto	l14324
	
l14322:; BSR set to: 0

		movlw	low(STR_188)
	movwf	((_rebuild_input_menu$1381))&0ffh
	movlw	high(STR_188)
	movwf	((_rebuild_input_menu$1381+1))&0ffh

	
l14324:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1381),(c:strcpy@from)
	movff	(_rebuild_input_menu$1381+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1018
	
l14326:
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
	goto	u19381
	goto	u19380
u19381:
	goto	l14334
u19380:
	
l14328:; BSR set to: 0

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
	goto	u19391
	goto	u19390

u19391:
	goto	l14332
u19390:
	
l14330:; BSR set to: 0

		movlw	low(STR_193)
	movwf	((_rebuild_input_menu$1389))&0ffh
	movlw	high(STR_193)
	movwf	((_rebuild_input_menu$1389+1))&0ffh

	goto	l792
	
l14332:; BSR set to: 0

		movlw	low(STR_192)
	movwf	((_rebuild_input_menu$1389))&0ffh
	movlw	high(STR_192)
	movwf	((_rebuild_input_menu$1389+1))&0ffh

	
l792:; BSR set to: 0

		movff	(_rebuild_input_menu$1389),(_rebuild_input_menu$1388)
	movff	(_rebuild_input_menu$1389+1),(_rebuild_input_menu$1388+1)

	goto	l14336
	
l14334:; BSR set to: 0

		movlw	low(STR_191)
	movwf	((_rebuild_input_menu$1388))&0ffh
	movlw	high(STR_191)
	movwf	((_rebuild_input_menu$1388+1))&0ffh

	
l14336:; BSR set to: 0

		movlw	low(_value_rlyplp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyplp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1388),(c:strcpy@from)
	movff	(_rebuild_input_menu$1388+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1020
	
l14338:
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
	goto	u19401
	goto	u19400
u19401:
	goto	l14346
u19400:
	
l14340:; BSR set to: 0

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
	goto	u19411
	goto	u19410

u19411:
	goto	l14344
u19410:
	
l14342:; BSR set to: 0

		movlw	low(STR_196)
	movwf	((_rebuild_input_menu$1396))&0ffh
	movlw	high(STR_196)
	movwf	((_rebuild_input_menu$1396+1))&0ffh

	goto	l800
	
l14344:; BSR set to: 0

		movlw	low(STR_195)
	movwf	((_rebuild_input_menu$1396))&0ffh
	movlw	high(STR_195)
	movwf	((_rebuild_input_menu$1396+1))&0ffh

	
l800:; BSR set to: 0

		movff	(_rebuild_input_menu$1396),(_rebuild_input_menu$1395)
	movff	(_rebuild_input_menu$1396+1),(_rebuild_input_menu$1395+1)

	goto	l14348
	
l14346:; BSR set to: 0

		movlw	low(STR_194)
	movwf	((_rebuild_input_menu$1395))&0ffh
	movlw	high(STR_194)
	movwf	((_rebuild_input_menu$1395+1))&0ffh

	
l14348:; BSR set to: 0

		movlw	low(_value_rlyslp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyslp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1395),(c:strcpy@from)
	movff	(_rebuild_input_menu$1395+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1021
	
l14350:
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
	goto	u19421
	goto	u19420
u19421:
	goto	l14354
u19420:
	
l14352:; BSR set to: 0

		movlw	low(STR_198)
	movwf	((_rebuild_input_menu$1400))&0ffh
	movlw	high(STR_198)
	movwf	((_rebuild_input_menu$1400+1))&0ffh

	goto	l14356
	
l14354:; BSR set to: 0

		movlw	low(STR_197)
	movwf	((_rebuild_input_menu$1400))&0ffh
	movlw	high(STR_197)
	movwf	((_rebuild_input_menu$1400+1))&0ffh

	
l14356:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1400),(c:strcpy@from)
	movff	(_rebuild_input_menu$1400+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1024
	
l14358:
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
	line	1027
	
l14360:
		movlw	low(_value_enable)
	movlb	5	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	1028
	
l14362:; BSR set to: 5

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	1029
	
l14364:; BSR set to: 5

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	1030
	
l14366:; BSR set to: 5

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	1031
	
l14368:; BSR set to: 5

		movlw	low(_value_hi_pressure)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_hi_pressure)
	movwf	(1+(_input_menu+016h))&0ffh

	line	1032
	
l14370:; BSR set to: 5

		movlw	low(_value_highbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_highbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	1033
	
l14372:; BSR set to: 5

		movlw	low(_value_low_pressure)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_pressure)
	movwf	(1+(_input_menu+020h))&0ffh

	line	1034
	
l14374:; BSR set to: 5

		movlw	low(_value_plpbp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_plpbp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	1035
	
l14376:; BSR set to: 5

		movlw	low(_value_slpbp)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_slpbp)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	1036
	
l14378:; BSR set to: 5

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	1037
	
l14380:; BSR set to: 5

		movlw	low(_value_rlyplp)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_rlyplp)
	movwf	(1+(_input_menu+034h))&0ffh

	line	1038
	
l14382:; BSR set to: 5

		movlw	low(_value_rlyslp)
	movwf	(0+(_input_menu+039h))&0ffh
	movlw	high(_value_rlyslp)
	movwf	(1+(_input_menu+039h))&0ffh

	line	1039
	
l14384:; BSR set to: 5

		movlw	low(_value_display)
	movwf	(0+(_input_menu+03Eh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+03Eh))&0ffh

	line	1040
	
l14386:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_input_menu+043h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+043h))&0ffh

	line	1042
	
l14388:; BSR set to: 5

	movlw	low(0Eh)
	movwf	(0+(_menu+02h))&0ffh
	line	1043
	goto	l14556
	line	1044
	
l14390:; BSR set to: 0

		decf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u19431
	goto	u19430

u19431:
	goto	l14448
u19430:
	line	1046
	
l14392:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_199)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_199)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1047
	
l14394:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_200)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_200)
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
	line	1048
	
l14396:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_201)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_201)
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
	line	1049
	
l14398:
		movlw	low(_value_high_temp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_temp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_202)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_202)
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
	line	1052
	
l14400:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3254)
	movff	1+?___lwdiv,(_rebuild_input_menu$3254+1)
	
l14402:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3255)
	movff	1+?___lwmod,(_rebuild_input_menu$3255+1)
	
l14404:
		movlw	low(_value_high_tbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_tbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_203)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_203)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3254),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3254+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3255),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3255+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1054
	
l14406:
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
	goto	u19441
	goto	u19440
u19441:
	goto	l14414
u19440:
	
l14408:; BSR set to: 0

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
	goto	u19451
	goto	u19450

u19451:
	goto	l14412
u19450:
	
l14410:; BSR set to: 0

		movlw	low(STR_206)
	movwf	((_rebuild_input_menu$1415))&0ffh
	movlw	high(STR_206)
	movwf	((_rebuild_input_menu$1415+1))&0ffh

	goto	l814
	
l14412:; BSR set to: 0

		movlw	low(STR_205)
	movwf	((_rebuild_input_menu$1415))&0ffh
	movlw	high(STR_205)
	movwf	((_rebuild_input_menu$1415+1))&0ffh

	
l814:; BSR set to: 0

		movff	(_rebuild_input_menu$1415),(_rebuild_input_menu$1414)
	movff	(_rebuild_input_menu$1415+1),(_rebuild_input_menu$1414+1)

	goto	l14416
	
l14414:; BSR set to: 0

		movlw	low(STR_204)
	movwf	((_rebuild_input_menu$1414))&0ffh
	movlw	high(STR_204)
	movwf	((_rebuild_input_menu$1414+1))&0ffh

	
l14416:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1414),(c:strcpy@from)
	movff	(_rebuild_input_menu$1414+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1055
	
l14418:
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
	goto	u19461
	goto	u19460
u19461:
	goto	l14422
u19460:
	
l14420:; BSR set to: 0

		movlw	low(STR_208)
	movwf	((_rebuild_input_menu$1419))&0ffh
	movlw	high(STR_208)
	movwf	((_rebuild_input_menu$1419+1))&0ffh

	goto	l14424
	
l14422:; BSR set to: 0

		movlw	low(STR_207)
	movwf	((_rebuild_input_menu$1419))&0ffh
	movlw	high(STR_207)
	movwf	((_rebuild_input_menu$1419+1))&0ffh

	
l14424:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1419),(c:strcpy@from)
	movff	(_rebuild_input_menu$1419+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1058
	
l14426:
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
	line	1061
	
l14428:
		movlw	low(_value_enable)
	movlb	5	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	1062
	
l14430:; BSR set to: 5

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	1063
	
l14432:; BSR set to: 5

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	1064
	
l14434:; BSR set to: 5

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	1065
	
l14436:; BSR set to: 5

		movlw	low(_value_high_temp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_high_temp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	1066
	
l14438:; BSR set to: 5

		movlw	low(_value_high_tbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_high_tbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	1067
	
l14440:; BSR set to: 5

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+020h))&0ffh

	line	1068
	
l14442:; BSR set to: 5

		movlw	low(_value_display)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+025h))&0ffh

	line	1069
	
l14444:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	1071
	
l14446:; BSR set to: 5

	movlw	low(09h)
	movwf	(0+(_menu+02h))&0ffh
	line	1072
	goto	l14556
	line	1073
	
l14448:; BSR set to: 0

		movlw	2
	xorwf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u19471
	goto	u19470

u19471:
	goto	l14556
u19470:
	line	1075
	
l14450:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_209)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_209)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1076
	
l14452:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfsc	status,2
	goto	u19481
	goto	u19480
u19481:
	goto	l14456
u19480:
	
l14454:; BSR set to: 0

		movlw	low(STR_211)
	movwf	((_rebuild_input_menu$1424))&0ffh
	movlw	high(STR_211)
	movwf	((_rebuild_input_menu$1424+1))&0ffh

	goto	l14458
	
l14456:; BSR set to: 0

		movlw	low(STR_210)
	movwf	((_rebuild_input_menu$1424))&0ffh
	movlw	high(STR_210)
	movwf	((_rebuild_input_menu$1424+1))&0ffh

	
l14458:; BSR set to: 0

		movlw	low(_value_flow_type)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_type)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1424),(c:strcpy@from)
	movff	(_rebuild_input_menu$1424+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1077
	
l14460:
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
	goto	u19491
	goto	u19490
u19491:
	goto	l14464
u19490:
	
l14462:; BSR set to: 0

		movlw	low(STR_213)
	movwf	((_rebuild_input_menu$1428))&0ffh
	movlw	high(STR_213)
	movwf	((_rebuild_input_menu$1428+1))&0ffh

	goto	l14466
	
l14464:; BSR set to: 0

		movlw	low(STR_212)
	movwf	((_rebuild_input_menu$1428))&0ffh
	movlw	high(STR_212)
	movwf	((_rebuild_input_menu$1428+1))&0ffh

	
l14466:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1428),(c:strcpy@from)
	movff	(_rebuild_input_menu$1428+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1079
	
l14468:
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
	goto	u19501
	goto	u19500
u19501:
	goto	l14476
u19500:
	
l14470:; BSR set to: 0

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
	goto	u19511
	goto	u19510

u19511:
	goto	l14474
u19510:
	
l14472:; BSR set to: 0

		movlw	low(STR_216)
	movwf	((_rebuild_input_menu$1435))&0ffh
	movlw	high(STR_216)
	movwf	((_rebuild_input_menu$1435+1))&0ffh

	goto	l836
	
l14474:; BSR set to: 0

		movlw	low(STR_215)
	movwf	((_rebuild_input_menu$1435))&0ffh
	movlw	high(STR_215)
	movwf	((_rebuild_input_menu$1435+1))&0ffh

	
l836:; BSR set to: 0

		movff	(_rebuild_input_menu$1435),(_rebuild_input_menu$1434)
	movff	(_rebuild_input_menu$1435+1),(_rebuild_input_menu$1434+1)

	goto	l14478
	
l14476:; BSR set to: 0

		movlw	low(STR_214)
	movwf	((_rebuild_input_menu$1434))&0ffh
	movlw	high(STR_214)
	movwf	((_rebuild_input_menu$1434+1))&0ffh

	
l14478:; BSR set to: 0

		movlw	low(_value_rlylow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlylow)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1434),(c:strcpy@from)
	movff	(_rebuild_input_menu$1434+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1081
	
l14480:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfss	status,2
	goto	u19521
	goto	u19520
u19521:
	goto	l14528
u19520:
	line	1083
	
l14482:; BSR set to: 0

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
	goto	u19531
	goto	u19530
u19531:
	goto	l14486
u19530:
	
l14484:; BSR set to: 0

		movlw	low(STR_218)
	movwf	((_rebuild_input_menu$1439))&0ffh
	movlw	high(STR_218)
	movwf	((_rebuild_input_menu$1439+1))&0ffh

	goto	l14488
	
l14486:; BSR set to: 0

		movlw	low(STR_217)
	movwf	((_rebuild_input_menu$1439))&0ffh
	movlw	high(STR_217)
	movwf	((_rebuild_input_menu$1439+1))&0ffh

	
l14488:; BSR set to: 0

		movlw	low(_value_flow_units)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_units)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1439),(c:strcpy@from)
	movff	(_rebuild_input_menu$1439+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1084
	
l14490:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_219)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_219)
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
	line	1085
	
l14492:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_220)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_220)
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
	line	1086
	
l14494:
		movlw	low(_value_low_flow)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_221)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_221)
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
	line	1089
	
l14496:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3254)
	movff	1+?___lwdiv,(_rebuild_input_menu$3254+1)
	
l14498:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3255)
	movff	1+?___lwmod,(_rebuild_input_menu$3255+1)
	
l14500:
		movlw	low(_value_low_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_222)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_222)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3254),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3254+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3255),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3255+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1092
	
l14502:
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
	line	1095
	
l14504:
		movlw	low(_value_enable)
	movlb	5	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	1096
	
l14506:; BSR set to: 5

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	1097
	
l14508:; BSR set to: 5

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	1098
	
l14510:; BSR set to: 5

		movlw	low(_value_flow_units)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_flow_units)
	movwf	(1+(_input_menu+011h))&0ffh

	line	1099
	
l14512:; BSR set to: 5

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+016h))&0ffh

	line	1100
	
l14514:; BSR set to: 5

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	1101
	
l14516:; BSR set to: 5

		movlw	low(_value_low_flow)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_flow)
	movwf	(1+(_input_menu+020h))&0ffh

	line	1102
	
l14518:; BSR set to: 5

		movlw	low(_value_low_flow_bp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_low_flow_bp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	1103
	
l14520:; BSR set to: 5

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	1104
	
l14522:; BSR set to: 5

		movlw	low(_value_display)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	1105
	
l14524:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+034h))&0ffh

	line	1107
	
l14526:; BSR set to: 5

	movlw	low(0Bh)
	movwf	(0+(_menu+02h))&0ffh
	line	1108
	goto	l14556
	line	1111
	
l14528:; BSR set to: 0

		movlw	low(_value_no_flow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_no_flow)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_223)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_223)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1114
	
l14530:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$3254)
	movff	1+?___lwdiv,(_rebuild_input_menu$3254+1)
	
l14532:
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
	movff	0+?___lwmod,(_rebuild_input_menu$3255)
	movff	1+?___lwmod,(_rebuild_input_menu$3255+1)
	
l14534:
		movlw	low(_value_no_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_no_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_224)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_224)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$3254),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3254+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$3255),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$3255+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1117
	
l14536:
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
	line	1120
	
l14538:
		movlw	low(_value_enable)
	movlb	5	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	1121
	
l14540:; BSR set to: 5

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	1122
	
l14542:; BSR set to: 5

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	1123
	
l14544:; BSR set to: 5

		movlw	low(_value_no_flow)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_no_flow)
	movwf	(1+(_input_menu+011h))&0ffh

	line	1124
	
l14546:; BSR set to: 5

		movlw	low(_value_no_flow_bp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_no_flow_bp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	1125
	
l14548:; BSR set to: 5

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	1126
	
l14550:; BSR set to: 5

		movlw	low(_value_display)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+020h))&0ffh

	line	1127
	
l14552:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+025h))&0ffh

	line	1129
	
l14554:; BSR set to: 5

	movlw	low(08h)
	movwf	(0+(_menu+02h))&0ffh
	line	1136
	
l14556:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_225)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_225)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(rebuild_input_menu@sensor),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(rebuild_input_menu@flow_type_val),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1137
	
l14558:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1138
	
l843:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_input_menu
	__end_of_rebuild_input_menu:
	signat	_rebuild_input_menu,4217
	global	_rebuild_clock_menu

;; *************** function _rebuild_clock_menu *****************
;; Defined at:
;;		line 1648 in file "src\menu.c"
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
	line	1648
global __ptext18
__ptext18:
psect	text18
	file	"src\menu.c"
	line	1648
	
_rebuild_clock_menu:
;incstack = 0
	callstack 24
	line	1654
	
l14616:; BSR set to: 5

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_263)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_263)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_system_config+06h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1655
	
l14618:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1658
	
l14620:
	movlb	7	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u19711
	goto	u19710
u19711:
	goto	l14624
u19710:
	
l14622:; BSR set to: 7

		movlw	low(STR_266)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1585))&0ffh
	movlw	high(STR_266)
	movwf	((_rebuild_clock_menu$1585+1))&0ffh

	goto	l14626
	
l14624:; BSR set to: 7

		movlw	low(STR_265)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1585))&0ffh
	movlw	high(STR_265)
	movwf	((_rebuild_clock_menu$1585+1))&0ffh

	
l14626:; BSR set to: 0

		movlw	low(_value_clock_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_clock_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_264)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_264)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_clock_menu$1585),0+((c:?_sprintf)+04h)
	movff	(_rebuild_clock_menu$1585+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	1660
	
l14628:
	movlb	7	; () banked
	movf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u19721
	goto	u19720
u19721:
	goto	l14636
u19720:
	
l14630:; BSR set to: 7

		decf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u19731
	goto	u19730

u19731:
	goto	l14634
u19730:
	
l14632:; BSR set to: 7

		movlw	low(STR_269)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1592))&0ffh
	movlw	high(STR_269)
	movwf	((_rebuild_clock_menu$1592+1))&0ffh

	goto	l1100
	
l14634:; BSR set to: 7

		movlw	low(STR_268)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1592))&0ffh
	movlw	high(STR_268)
	movwf	((_rebuild_clock_menu$1592+1))&0ffh

	
l1100:; BSR set to: 0

		movff	(_rebuild_clock_menu$1592),(_rebuild_clock_menu$1591)
	movff	(_rebuild_clock_menu$1592+1),(_rebuild_clock_menu$1591+1)

	goto	l14638
	
l14636:; BSR set to: 7

		movlw	low(STR_267)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1591))&0ffh
	movlw	high(STR_267)
	movwf	((_rebuild_clock_menu$1591+1))&0ffh

	
l14638:; BSR set to: 0

		movlw	low(_value_end_runtime)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_end_runtime)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_clock_menu$1591),(c:strcpy@from)
	movff	(_rebuild_clock_menu$1591+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1665
	
l14640:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_270)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_270)
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
	line	1667
	
l14642:
		movlw	low(_value_clock_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_clock_display)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_271)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_271)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1669
	
l14644:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_272)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_272)
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
	line	1670
	
l14646:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1673
	
l14648:
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
	line	1676
	
l14650:
		movlw	low(_value_clock_enable)
	movlb	5	; () banked
	movwf	(0+(_clock_menu+02h))&0ffh
	movlw	high(_value_clock_enable)
	movwf	(1+(_clock_menu+02h))&0ffh

	line	1677
	
l14652:; BSR set to: 5

		movlw	low(_value_end_runtime)
	movwf	(0+(_clock_menu+07h))&0ffh
	movlw	high(_value_end_runtime)
	movwf	(1+(_clock_menu+07h))&0ffh

	line	1678
	
l14654:; BSR set to: 5

		movlw	low(_value_relay_pulse)
	movwf	(0+(_clock_menu+0Ch))&0ffh
	movlw	high(_value_relay_pulse)
	movwf	(1+(_clock_menu+0Ch))&0ffh

	line	1679
	
l14656:; BSR set to: 5

		movlw	low(_value_clock_display)
	movwf	(0+(_clock_menu+011h))&0ffh
	movlw	high(_value_clock_display)
	movwf	(1+(_clock_menu+011h))&0ffh

	line	1680
	
l14658:; BSR set to: 5

		movlw	low(_value_back)
	movwf	(0+(_clock_menu+016h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_clock_menu+016h))&0ffh

	line	1682
	
l14660:; BSR set to: 5

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	1684
	
l14662:; BSR set to: 5

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_273)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_273)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+02h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1685
	
l14664:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1686
	
l1101:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_clock_menu
	__end_of_rebuild_clock_menu:
	signat	_rebuild_clock_menu,89
	global	_menu_update_time_value

;; *************** function _menu_update_time_value *****************
;; Defined at:
;;		line 560 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  start_col       1    0        unsigned char 
;;  screen_line     1  109[BANK0 ] unsigned char 
;;  debug_after    50   50[BANK0 ] unsigned char [50]
;;  debug_before   50    0[BANK0 ] unsigned char [50]
;;  value_buf       6  103[BANK0 ] unsigned char [6]
;;  screen_line     1  110[BANK0 ] unsigned char 
;;  start_col       1    0        unsigned char 
;;  flow_type       1  102[BANK0 ] unsigned char 
;;  sensor_type     1  101[BANK0 ] unsigned char 
;;  item_idx        1  100[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/6
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0     111       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0     111       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      111 bytes
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
	line	560
global __ptext19
__ptext19:
psect	text19
	file	"src\menu.c"
	line	560
	
_menu_update_time_value:
;incstack = 0
	callstack 23
	line	562
	
l13668:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u18381
	goto	u18380
u18381:
	goto	l13672
u18380:
	goto	l656
	line	569
	
l13672:; BSR set to: 5

	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u18391
	goto	u18390
u18391:
	goto	l13678
u18390:
	
l13674:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u18401
	goto	u18400
u18401:
	goto	l13678
u18400:
	line	571
	
l13676:; BSR set to: 5

	movlw	low(020h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	572
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	573
	goto	l13680
	line	576
	
l13678:; BSR set to: 5

	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	(0+(_menu+012h))&0ffh,w
	
	call	___lbdiv
	addlw	low(030h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	577
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	5	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	581
	
l13680:; BSR set to: 0

	movlw	low(03Ah)
	movwf	(0+(menu_update_time_value@value_buf+02h))&0ffh
	line	584
	
l13682:; BSR set to: 0

	movlb	5	; () banked
		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u18411
	goto	u18410

u18411:
	goto	l13688
u18410:
	
l13684:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u18421
	goto	u18420
u18421:
	goto	l13688
u18420:
	line	586
	
l13686:; BSR set to: 5

	movlw	low(020h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	587
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	588
	goto	l13690
	line	591
	
l13688:; BSR set to: 5

	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	(0+(_menu+013h))&0ffh,w
	
	call	___lbdiv
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	592
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	5	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	595
	
l13690:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(menu_update_time_value@value_buf+05h))&0ffh
	line	598
	
l13692:; BSR set to: 0

		movlw	3
	movlb	5	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18431
	goto	u18430

u18431:
	goto	l13700
u18430:
	
l13694:; BSR set to: 5

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18441
	goto	u18440

u18441:
	goto	l13700
u18440:
	line	600
	
l13696:; BSR set to: 5

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
	line	601
	call	_menu_draw_clock	;wreg free
	goto	l656
	line	606
	
l13700:; BSR set to: 5

		movlw	4
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u18451
	goto	u18450

u18451:
	goto	l13726
u18450:
	
l13702:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18461
	goto	u18460

u18461:
	goto	l13726
u18460:
	line	609
	
l13704:; BSR set to: 5

		movlw	low(_value_menu_timeout)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_menu_timeout)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_143)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_143)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(menu_update_time_value@value_buf)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c

	call	_sprintf	;wreg free
	line	612
	
l13706:
	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_time_value@screen_line))&0ffh
	line	613
	
l13708:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_update_time_value@screen_line))&0ffh
	goto	u18471
	goto	u18470

u18471:
	goto	l656
u18470:
	line	615
	
l13710:; BSR set to: 0

	line	617
	
l13712:; BSR set to: 0

	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	618
	
l13714:
		movlw	low(STR_144)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_144)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	620
	
l13716:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	621
	
l13718:
		movlw	low(STR_145)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_145)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	622
	
l13720:
		movlw	low(menu_update_time_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	623
	
l13722:
		movlw	low(STR_146)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_146)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	goto	l656
	line	629
	
l13726:; BSR set to: 5

		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u18481
	goto	u18480

u18481:
	goto	l13730
u18480:
	goto	l656
	line	633
	
l13730:; BSR set to: 5

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_time_value@screen_line_1295))&0ffh
	line	634
		movlw	03h-1
	cpfsgt	((menu_update_time_value@screen_line_1295))&0ffh
	goto	u18491
	goto	u18490

u18491:
	goto	l665
u18490:
	goto	l656
	line	635
	
l665:; BSR set to: 0

	line	637
	movff	(_menu),(menu_update_time_value@item_idx)
	line	641
	
l13734:; BSR set to: 0

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
	line	642
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
	line	645
	
l13736:; BSR set to: 0

	movff	(menu_update_time_value@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_update_time_value@flow_type),(c:is_time_field@flow_type)
	movf	((menu_update_time_value@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfss	status,2
	goto	u18501
	goto	u18500
u18501:
	goto	l13740
u18500:
	goto	l656
	line	651
	
l13740:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_147)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_147)
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
	line	652
	
l13742:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	656
	
l13744:
		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_148)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_148)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(menu_update_time_value@value_buf)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c

	call	_sprintf	;wreg free
	line	657
		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	660
	
l13746:
	line	662
	
l13748:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line_1295))&0ffh,w
	
	call	_lcd_set_cursor
	line	663
	
l13750:
		movlw	low(STR_149)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_149)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	665
	
l13752:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line_1295))&0ffh,w
	
	call	_lcd_set_cursor
	line	666
	
l13754:
		movlw	low(STR_150)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_150)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	667
	
l13756:
		movlw	low(menu_update_time_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	668
	
l13758:
		movlw	low(STR_151)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_151)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	669
	
l656:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_time_value
	__end_of_menu_update_time_value:
	signat	_menu_update_time_value,89
	global	_menu_draw_clock

;; *************** function _menu_draw_clock *****************
;; Defined at:
;;		line 1730 in file "src\menu.c"
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
	line	1730
global __ptext20
__ptext20:
psect	text20
	file	"src\menu.c"
	line	1730
	
_menu_draw_clock:
;incstack = 0
	callstack 23
	line	1733
	
l12980:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1734
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_283)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_283)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1737
	
l12982:
	movlw	low(0)
	movwf	((c:menu_draw_clock@i))^00h,c
	goto	l13062
	line	1739
	
l12984:; BSR set to: 5

	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_clock@i))^00h,c,w
	movwf	((c:menu_draw_clock@item_idx))^00h,c
	line	1740
	
l12986:; BSR set to: 5

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1743
	
l12988:
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
	line	1747
	
l12990:
	line	1749
	
l12992:
	movf	((c:menu_draw_clock@item_idx))^00h,c,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u17061
	goto	u17060

u17061:
	goto	l13022
u17060:
	line	1751
	
l12994:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17071
	goto	u17070
u17071:
	goto	l13018
u17070:
	line	1753
	
l12996:; BSR set to: 5

	movlw	low(02h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	line	1756
	
l12998:; BSR set to: 5

		movlw	2
	xorwf	((c:menu_draw_clock@item_idx))^00h,c,w
	btfsc	status,2
	goto	u17081
	goto	u17080

u17081:
	goto	l13002
u17080:
	line	1758
	
l13000:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u17091
	goto	u17090
u17091:
	goto	l13004
u17090:
	line	1761
	
l13002:; BSR set to: 5

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
	line	1762
	goto	l13026
	line	1766
	
l13004:; BSR set to: 5

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
	line	1767
	
l13006:
	movlw	low(0)
	movwf	((c:menu_draw_clock@j))^00h,c
	goto	l13012
	line	1768
	
l13008:
	movf	((c:menu_draw_clock@j))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1767
	
l13010:
	incf	((c:menu_draw_clock@j))^00h,c
	
l13012:
		movf	((c:menu_draw_clock@val_len))^00h,c,w
	subwf	((c:menu_draw_clock@j))^00h,c,w
	btfss	status,0
	goto	u17101
	goto	u17100

u17101:
	goto	l13008
u17100:
	line	1769
	
l13014:
	movf	((c:menu_draw_clock@val_len))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l13026
	line	1781
	
l13018:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l13002
	line	1788
	
l13022:; BSR set to: 5

	movlw	low(0)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l13002
	line	1793
	
l13026:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_clock@val_len_1623))^00h,c
	line	1795
	
l13028:
	movf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfss	status,2
	goto	u17111
	goto	u17110
u17111:
	goto	l13034
u17110:
	line	1798
	
l13030:
	movf	((c:menu_draw_clock@val_len_1623))^00h,c,w
	btfsc	status,2
	goto	u17121
	goto	u17120
u17121:
	goto	l13060
u17120:
	line	1799
	
l13032:
	movf	((c:menu_draw_clock@val_len_1623))^00h,c,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_print_at
	goto	l13060
	line	1804
	
l13034:
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
	line	1805
	
l13036:
	movf	((c:menu_draw_clock@actual_len))^00h,c,w
	sublw	low(012h)
	movwf	((c:menu_draw_clock@start_pos))^00h,c
	line	1807
	
l13038:
	movff	(c:menu_draw_clock@start_pos),(c:lcd_set_cursor@col)
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1808
	
l13040:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u17131
	goto	u17130

u17131:
	goto	l13044
u17130:
	
l13042:
		movlw	low(STR_285)
	movwf	((c:_menu_draw_clock$1629))^00h,c
	movlw	high(STR_285)
	movwf	((c:_menu_draw_clock$1629+1))^00h,c

	goto	l13046
	
l13044:
		movlw	low(STR_284)
	movwf	((c:_menu_draw_clock$1629))^00h,c
	movlw	high(STR_284)
	movwf	((c:_menu_draw_clock$1629+1))^00h,c

	
l13046:
		movff	(c:_menu_draw_clock$1629),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1629+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1811
	
l13048:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1813
	
l13050:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1814
	
l13052:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u17141
	goto	u17140

u17141:
	goto	l13056
u17140:
	
l13054:
		movlw	low(STR_287)
	movwf	((c:_menu_draw_clock$1633))^00h,c
	movlw	high(STR_287)
	movwf	((c:_menu_draw_clock$1633+1))^00h,c

	goto	l13058
	
l13056:
		movlw	low(STR_286)
	movwf	((c:_menu_draw_clock$1633))^00h,c
	movlw	high(STR_286)
	movwf	((c:_menu_draw_clock$1633+1))^00h,c

	
l13058:
		movff	(c:_menu_draw_clock$1633),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1633+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1737
	
l13060:
	incf	((c:menu_draw_clock@i))^00h,c
	
l13062:
		movlw	03h-0
	cpfslt	((c:menu_draw_clock@i))^00h,c
	goto	u17151
	goto	u17150

u17151:
	goto	l1138
u17150:
	
l13064:
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
	goto	u17161
	goto	u17160

u17161:
	goto	l12984
u17160:
	line	1817
	
l1138:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_clock
	__end_of_menu_draw_clock:
	signat	_menu_draw_clock,89
	global	_menu_draw_utility

;; *************** function _menu_draw_utility *****************
;; Defined at:
;;		line 1822 in file "src\menu.c"
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
	line	1822
global __ptext21
__ptext21:
psect	text21
	file	"src\menu.c"
	line	1822
	
_menu_draw_utility:
;incstack = 0
	callstack 22
	line	1825
	
l13760:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1828
	
l13762:
	movlb	5	; () banked
	movf	(0+(_menu+01Eh))&0ffh,w
	btfsc	status,2
	goto	u18511
	goto	u18510
u18511:
	goto	l13770
u18510:
	line	1830
	
l13764:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_288)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_288)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1832
	
l13766:
	call	_menu_update_datetime_display	;wreg free
	goto	l1142
	line	1838
	
l13770:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_289)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_289)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1840
	
l13772:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_utility@i))&0ffh
	goto	l13874
	line	1842
	
l13774:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_utility@i))&0ffh,w
	movwf	((menu_draw_utility@item_idx))&0ffh
	line	1843
	
l13776:; BSR set to: 0

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1846
	
l13778:
	movlb	0	; () banked
	movf	((menu_draw_utility@item_idx))&0ffh,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u18521
	goto	u18520

u18521:
	movlw	1
	goto	u18530
u18520:
	movlw	0
u18530:
	movlb	0	; () banked
	movwf	((menu_draw_utility@is_selected))&0ffh
	line	1849
	
l13780:; BSR set to: 0

	movf	((menu_draw_utility@item_idx))&0ffh,w
	btfss	status,2
	goto	u18541
	goto	u18540
u18541:
	goto	l13788
u18540:
	line	1851
	
l13782:; BSR set to: 0

	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u18551
	goto	u18550
u18551:
	goto	l13786
u18550:
	line	1853
	
l13784:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_290)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_290)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1854
	goto	l13872
	line	1857
	
l13786:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_291)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_291)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	goto	l13872
	line	1860
	
l13788:; BSR set to: 0

		movlw	8
	xorwf	((menu_draw_utility@item_idx))&0ffh,w
	btfss	status,2
	goto	u18561
	goto	u18560

u18561:
	goto	l13796
u18560:
	line	1862
	
l13790:; BSR set to: 0

	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u18571
	goto	u18570
u18571:
	goto	l13794
u18570:
	line	1864
	
l13792:; BSR set to: 0

	movlw	low(0Eh)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_292)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_292)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1865
	goto	l13872
	line	1868
	
l13794:; BSR set to: 0

	movlw	low(0Fh)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_293)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_293)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	goto	l13872
	line	1871
	
l13796:; BSR set to: 0

		decf	((menu_draw_utility@item_idx))&0ffh,w
	btfsc	status,2
	goto	u18581
	goto	u18580

u18581:
	goto	l13800
u18580:
	
l13798:; BSR set to: 0

		movlw	2
	xorwf	((menu_draw_utility@item_idx))&0ffh,w
	btfss	status,2
	goto	u18591
	goto	u18590

u18591:
	goto	l13810
u18590:
	line	1873
	
l13800:; BSR set to: 0

	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u18601
	goto	u18600
u18601:
	goto	l13808
u18600:
	line	1875
	
l13802:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_294)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_294)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1876
	
l13804:
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
	line	1877
	
l13806:
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
		movlw	low(STR_295)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_295)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1878
	goto	l13872
	line	1881
	
l13808:; BSR set to: 0

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
	goto	l13872
	line	1887
	
l13810:; BSR set to: 0

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
	line	1890
	
l13812:
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
	goto	u18611
	goto	u18610

u18611:
	goto	l13872
u18610:
	
l13814:; BSR set to: 0

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
	goto	u18621
	goto	u18620

u18621:
	goto	l13872
u18620:
	line	1893
	
l13816:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_utility@show_brackets))&0ffh
	line	1895
	movf	((menu_draw_utility@is_selected))&0ffh,w
	btfsc	status,2
	goto	u18631
	goto	u18630
u18631:
	goto	l13840
u18630:
	line	1897
	
l13818:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u18641
	goto	u18640
u18641:
	goto	l13822
u18640:
	
l13820:; BSR set to: 5

	movlw	high(01h)
	movlb	0	; () banked
	movwf	((_menu_draw_utility$1649+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_draw_utility$1649))&0ffh
	goto	l13824
	
l13822:; BSR set to: 5

	movlw	high(02h)
	movlb	0	; () banked
	movwf	((_menu_draw_utility$1649+1))&0ffh
	movlw	low(02h)
	movwf	((_menu_draw_utility$1649))&0ffh
	
l13824:; BSR set to: 0

	movff	(_menu_draw_utility$1649),(menu_draw_utility@show_brackets)
	line	1899
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u18651
	goto	u18650
u18651:
	goto	l13840
u18650:
	
l13826:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u18661
	goto	u18660
u18661:
	goto	l13840
u18660:
	line	1901
	
l13828:; BSR set to: 5

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
	line	1902
	
l13830:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_utility@j))&0ffh
	goto	l13836
	line	1903
	
l13832:; BSR set to: 0

	movf	((menu_draw_utility@j))&0ffh,w
	addlw	low(menu_draw_utility@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1902
	
l13834:; BSR set to: 0

	incf	((menu_draw_utility@j))&0ffh
	
l13836:; BSR set to: 0

		movf	((menu_draw_utility@len))&0ffh,w
	subwf	((menu_draw_utility@j))&0ffh,w
	btfss	status,0
	goto	u18671
	goto	u18670

u18671:
	goto	l13832
u18670:
	line	1904
	
l13838:; BSR set to: 0

	movf	((menu_draw_utility@len))&0ffh,w
	addlw	low(menu_draw_utility@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1905
	goto	l1170
	line	1908
	
l13840:
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
	line	1914
	
l1170:
	line	1916
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
	line	1918
	
l13844:; BSR set to: 0

	movf	((menu_draw_utility@show_brackets))&0ffh,w
	btfss	status,2
	goto	u18681
	goto	u18680
u18681:
	goto	l13848
u18680:
	line	1921
	
l13846:; BSR set to: 0

	movf	((menu_draw_utility@val_len))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_utility@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_print_at
	line	1922
	goto	l13872
	line	1926
	
l13848:; BSR set to: 0

	movf	((menu_draw_utility@val_len))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_utility@start_pos))&0ffh
	line	1927
	
l13850:; BSR set to: 0

	movff	(menu_draw_utility@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1928
	
l13852:
	movlb	0	; () banked
		decf	((menu_draw_utility@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u18691
	goto	u18690

u18691:
	goto	l13856
u18690:
	
l13854:; BSR set to: 0

		movlw	low(STR_297)
	movwf	((_menu_draw_utility$1657))&0ffh
	movlw	high(STR_297)
	movwf	((_menu_draw_utility$1657+1))&0ffh

	goto	l13858
	
l13856:; BSR set to: 0

		movlw	low(STR_296)
	movwf	((_menu_draw_utility$1657))&0ffh
	movlw	high(STR_296)
	movwf	((_menu_draw_utility$1657+1))&0ffh

	
l13858:; BSR set to: 0

		movff	(_menu_draw_utility$1657),(c:lcd_print@str)
	movff	(_menu_draw_utility$1657+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1929
	
l13860:
		movlw	low(menu_draw_utility@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1930
	
l13862:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1931
	
l13864:
	movlb	0	; () banked
		decf	((menu_draw_utility@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u18701
	goto	u18700

u18701:
	goto	l13868
u18700:
	
l13866:; BSR set to: 0

		movlw	low(STR_299)
	movwf	((_menu_draw_utility$1661))&0ffh
	movlw	high(STR_299)
	movwf	((_menu_draw_utility$1661+1))&0ffh

	goto	l13870
	
l13868:; BSR set to: 0

		movlw	low(STR_298)
	movwf	((_menu_draw_utility$1661))&0ffh
	movlw	high(STR_298)
	movwf	((_menu_draw_utility$1661+1))&0ffh

	
l13870:; BSR set to: 0

		movff	(_menu_draw_utility$1661),(c:lcd_print@str)
	movff	(_menu_draw_utility$1661+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1840
	
l13872:
	movlb	0	; () banked
	incf	((menu_draw_utility@i))&0ffh
	
l13874:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_utility@i))&0ffh
	goto	u18711
	goto	u18710

u18711:
	goto	l1142
u18710:
	
l13876:; BSR set to: 0

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
	goto	u18721
	goto	u18720

u18721:
	goto	l13774
u18720:
	line	1936
	
l1142:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_utility
	__end_of_menu_draw_utility:
	signat	_menu_draw_utility,89
	global	_menu_update_datetime_display

;; *************** function _menu_update_datetime_display *****************
;; Defined at:
;;		line 858 in file "src\menu.c"
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
	line	858
global __ptext22
__ptext22:
psect	text22
	file	"src\menu.c"
	line	858
	
_menu_update_datetime_display:
;incstack = 0
	callstack 22
	line	864
	
l13340:
	movlb	5	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17751
	goto	u17750
u17751:
	goto	l13364
u17750:
	
l13342:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17761
	goto	u17760
u17761:
	goto	l13364
u17760:
	line	866
	
l13344:; BSR set to: 5

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17771
	goto	u17770
u17771:
	goto	l13350
u17770:
	
l13346:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17781
	goto	u17780
u17781:
	goto	l13350
u17780:
	line	867
	
l13348:; BSR set to: 5

		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_154)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_154)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+017h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+018h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l13366
	line	868
	
l13350:; BSR set to: 5

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17791
	goto	u17790

u17791:
	goto	l13356
u17790:
	
l13352:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17801
	goto	u17800
u17801:
	goto	l13356
u17800:
	line	869
	
l13354:; BSR set to: 5

		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_155)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_155)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+016h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+018h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l13366
	line	870
	
l13356:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17811
	goto	u17810

u17811:
	goto	l13362
u17810:
	
l13358:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17821
	goto	u17820
u17821:
	goto	l13362
u17820:
	line	871
	
l13360:; BSR set to: 5

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
	call	_sprintf	;wreg free
	goto	l13366
	line	873
	
l13362:; BSR set to: 5

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
	goto	l13366
	line	877
	
l13364:; BSR set to: 5

		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_158)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_158)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+016h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+017h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+018h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	881
	
l13366:
	movlb	5	; () banked
		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17831
	goto	u17830

u17831:
	goto	l13390
u17830:
	
l13368:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17841
	goto	u17840
u17841:
	goto	l13390
u17840:
	line	883
	
l13370:; BSR set to: 5

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17851
	goto	u17850
u17851:
	goto	l13376
u17850:
	
l13372:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17861
	goto	u17860
u17861:
	goto	l13376
u17860:
	line	884
	
l13374:; BSR set to: 5

		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_159)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_159)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+01Ah),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l13392
	line	885
	
l13376:; BSR set to: 5

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17871
	goto	u17870

u17871:
	goto	l13382
u17870:
	
l13378:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17881
	goto	u17880
u17881:
	goto	l13382
u17880:
	line	886
	
l13380:; BSR set to: 5

		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_160)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_160)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+019h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	goto	l13392
	line	887
	
l13382:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u17891
	goto	u17890

u17891:
	goto	l13388
u17890:
	
l13384:; BSR set to: 5

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u17901
	goto	u17900
u17901:
	goto	l13388
u17900:
	line	888
	
l13386:; BSR set to: 5

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
	call	_sprintf	;wreg free
	goto	l13392
	line	890
	
l13388:; BSR set to: 5

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
	goto	l13392
	line	894
	
l13390:; BSR set to: 5

		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_163)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_163)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+019h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+01Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	898
	
l13392:
	movlw	(01h)&0ffh
	
	call	_lcd_clear_line
	line	899
	
l13394:
	movlb	5	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17911
	goto	u17910
u17911:
	goto	l13402
u17910:
	line	901
	
l13396:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17921
	goto	u17920
u17921:
	goto	l13400
u17920:
	line	903
	
l13398:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_164)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_164)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	904
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	905
	movlw	low(09h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_165)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_165)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	906
	goto	l751
	line	909
	
l13400:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_166)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_166)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	910
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	911
	movlw	low(09h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_167)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_167)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	goto	l751
	line	916
	
l13402:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@date_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(01h)&0ffh
	
	call	_lcd_print_at
	line	917
	
l751:
	line	920
	movlw	(02h)&0ffh
	
	call	_lcd_clear_line
	line	921
	
l13404:
	movlb	5	; () banked
		decf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17931
	goto	u17930

u17931:
	goto	l13412
u17930:
	line	923
	
l13406:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u17941
	goto	u17940
u17941:
	goto	l13410
u17940:
	line	925
	
l13408:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_168)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_168)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	926
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	927
	movlw	low(09h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_169)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_169)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	928
	goto	l755
	line	931
	
l13410:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_170)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_170)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	932
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	933
	movlw	low(09h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_171)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_171)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	goto	l755
	line	938
	
l13412:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_update_datetime_display@time_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(02h)&0ffh
	
	call	_lcd_print_at
	line	939
	
l755:
	line	942
	movlw	(03h)&0ffh
	
	call	_lcd_clear_line
	line	943
	
l13414:
		movlw	2
	movlb	5	; () banked
	xorwf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u17951
	goto	u17950

u17951:
	goto	l13418
u17950:
	line	945
	
l13416:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_172)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_172)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	line	946
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_173)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_173)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	line	947
	movlw	low(05h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_174)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_174)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	line	948
	goto	l758
	line	950
	
l13418:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_175)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_175)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(03h)&0ffh
	
	call	_lcd_print_at
	line	951
	
l758:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_datetime_display
	__end_of_menu_update_datetime_display:
	signat	_menu_update_datetime_display,89
	global	_menu_draw_setup

;; *************** function _menu_draw_setup *****************
;; Defined at:
;;		line 1568 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  label           2   41[COMRAM] PTR const unsigned char 
;;		 -> STR_251(5), STR_250(6), STR_249(1), STR_248(1), 
;;		 -> STR_247(1), 
;;  sensor_name     2   44[COMRAM] PTR const unsigned char 
;;		 -> Fake(1), STR_254(5), STR_253(5), STR_252(9), 
;;  sensor          1   43[COMRAM] unsigned char 
;;  item_idx        1   46[COMRAM] unsigned char 
;;  i               1   47[COMRAM] unsigned char 
;;  setup_labels   10   25[COMRAM] PTR const unsigned char 
;;		 -> STR_251(5), STR_250(6), STR_249(1), STR_248(1), 
;;		 -> STR_247(1), 
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
	line	1568
global __ptext23
__ptext23:
psect	text23
	file	"src\menu.c"
	line	1568
	
_menu_draw_setup:
;incstack = 0
	callstack 23
	line	1573
	
l14098:
	call	_lcd_clear	;wreg free
	line	1574
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1575
	
l14100:
		movlw	low(STR_246)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_246)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1578
	
l14102:
	lfsr	2,(menu_draw_setup@F2719)
	lfsr	1,(menu_draw_setup@setup_labels)
	movlw	10-1
u19191:
	movff	plusw2,plusw1
	decf	wreg
	bc	u19191

	line	1581
	
l14104:
	movlw	low(0)
	movwf	((c:menu_draw_setup@i))^00h,c
	line	1583
	
l14110:
	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_setup@i))^00h,c,w
	movwf	((c:menu_draw_setup@item_idx))^00h,c
	line	1584
		movlw	05h-1
	cpfsgt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u19201
	goto	u19200

u19201:
	goto	l14114
u19200:
	goto	l1084
	line	1587
	
l14114:; BSR set to: 5

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1590
	
l14116:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u19211
	goto	u19210

u19211:
	goto	l14150
u19210:
	line	1592
	
l14118:
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
	line	1594
	
l14120:
	movf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u19221
	goto	u19220
u19221:
	goto	l14128
u19220:
	
l14122:
		decf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u19231
	goto	u19230

u19231:
	goto	l14126
u19230:
	
l14124:
		movlw	low(STR_254)
	movwf	((c:_menu_draw_setup$1562))^00h,c
	movlw	high(STR_254)
	movwf	((c:_menu_draw_setup$1562+1))^00h,c

	goto	l1067
	
l14126:
		movlw	low(STR_253)
	movwf	((c:_menu_draw_setup$1562))^00h,c
	movlw	high(STR_253)
	movwf	((c:_menu_draw_setup$1562+1))^00h,c

	
l1067:
		movff	(c:_menu_draw_setup$1562),(c:menu_draw_setup@sensor_name)
	movff	(c:_menu_draw_setup$1562+1),(c:menu_draw_setup@sensor_name+1)

	goto	l1063
	
l14128:
		movlw	low(STR_252)
	movwf	((c:menu_draw_setup@sensor_name))^00h,c
	movlw	high(STR_252)
	movwf	((c:menu_draw_setup@sensor_name+1))^00h,c

	
l1063:
	line	1597
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19241
	goto	u19240

u19241:
	goto	l14138
u19240:
	line	1600
	
l14130:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1601
	
l14132:
		movlw	low(STR_255)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_255)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1602
	
l14134:
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1603
	
l14136:
		movlw	low(STR_256)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_256)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1604
	goto	l14140
	line	1608
	
l14138:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1612
	
l14140:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1613
	
l14142:
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
	goto	u19251
	goto	u19250
u19251:
	goto	l14146
u19250:
	
l14144:
		movlw	low(STR_258)
	movwf	((c:_menu_draw_setup$1568))^00h,c
	movlw	high(STR_258)
	movwf	((c:_menu_draw_setup$1568+1))^00h,c

	goto	l14148
	
l14146:
		movlw	low(STR_257)
	movwf	((c:_menu_draw_setup$1568))^00h,c
	movlw	high(STR_257)
	movwf	((c:_menu_draw_setup$1568+1))^00h,c

	
l14148:
		movff	(c:_menu_draw_setup$1568),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1568+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1614
	goto	l14176
	line	1618
	
l14150:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_labels)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:menu_draw_setup@label)
	movff	postdec2,(c:menu_draw_setup@label+1)
	line	1620
	
l14152:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19261
	goto	u19260

u19261:
	goto	l14162
u19260:
	line	1623
	
l14154:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1624
	
l14156:
		movlw	low(STR_259)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_259)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1625
	
l14158:
		movff	(c:menu_draw_setup@label),(c:lcd_print@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1626
	
l14160:
		movlw	low(STR_260)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_260)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1627
	goto	l14164
	line	1631
	
l14162:; BSR set to: 5

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@label),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1635
	
l14164:
		movlw	3
	xorwf	((c:menu_draw_setup@item_idx))^00h,c,w
	btfss	status,2
	goto	u19271
	goto	u19270

u19271:
	goto	l14176
u19270:
	line	1638
	
l14166:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1639
	
l14168:
	movlb	7	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u19281
	goto	u19280
u19281:
	goto	l14172
u19280:
	
l14170:; BSR set to: 7

		movlw	low(STR_262)
	movwf	((c:_menu_draw_setup$1576))^00h,c
	movlw	high(STR_262)
	movwf	((c:_menu_draw_setup$1576+1))^00h,c

	goto	l14174
	
l14172:; BSR set to: 7

		movlw	low(STR_261)
	movwf	((c:_menu_draw_setup$1576))^00h,c
	movlw	high(STR_261)
	movwf	((c:_menu_draw_setup$1576+1))^00h,c

	
l14174:; BSR set to: 7

		movff	(c:_menu_draw_setup$1576),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1576+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1581
	
l14176:
	incf	((c:menu_draw_setup@i))^00h,c
	
l14178:
		movlw	03h-1
	cpfsgt	((c:menu_draw_setup@i))^00h,c
	goto	u19291
	goto	u19290

u19291:
	goto	l14110
u19290:
	line	1643
	
l1084:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_setup
	__end_of_menu_draw_setup:
	signat	_menu_draw_setup,89
	global	_menu_draw_options

;; *************** function _menu_draw_options *****************
;; Defined at:
;;		line 1409 in file "src\menu.c"
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
	line	1409
global __ptext24
__ptext24:
psect	text24
	file	"src\menu.c"
	line	1409
	
_menu_draw_options:
;incstack = 0
	callstack 23
	line	1412
	
l13534:
	call	_lcd_clear	;wreg free
	line	1413
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1414
	
l13536:
		movlw	low(STR_236)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_236)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1417
	
l13538:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	line	1419
	
l13544:
	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_options@i))^00h,c,w
	movwf	((c:menu_draw_options@item_index))^00h,c
	line	1420
		movlw	05h-1
	cpfsgt	((c:menu_draw_options@item_index))^00h,c
	goto	u18081
	goto	u18080

u18081:
	goto	l13548
u18080:
	goto	l1008
	line	1423
	
l13548:; BSR set to: 5

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1426
	
l13550:
	movf	((c:menu_draw_options@item_index))^00h,c,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18091
	goto	u18090

u18091:
	goto	l13560
u18090:
	line	1428
	
l13552:; BSR set to: 5

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1429
	
l13554:
		movlw	low(STR_237)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_237)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1430
	
l13556:
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
	line	1431
	
l13558:
		movlw	low(STR_238)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_238)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1432
	goto	l13562
	line	1436
	
l13560:; BSR set to: 5

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
	line	1417
	
l13562:
	incf	((c:menu_draw_options@i))^00h,c
	
l13564:
		movlw	03h-1
	cpfsgt	((c:menu_draw_options@i))^00h,c
	goto	u18101
	goto	u18100

u18101:
	goto	l13544
u18100:
	line	1439
	
l1008:
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
	
l12810:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	168
	
l12812:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u23467:
decfsz	wreg,f
	bra	u23467
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u23467
	nop2
asmopt pop

	line	169
	
l1645:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
	signat	_lcd_clear,89
	global	_menu_draw_input

;; *************** function _menu_draw_input *****************
;; Defined at:
;;		line 1441 in file "src\menu.c"
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
	line	1441
global __ptext26
__ptext26:
psect	text26
	file	"src\menu.c"
	line	1441
	
_menu_draw_input:
;incstack = 0
	callstack 23
	line	1446
	
l13980:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1448
	
l13982:
		movlw	low(menu_draw_input@title)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_239)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_239)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(01h)
	movlb	5	; () banked
	addwf	((_current_input))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	1+(0+((c:?_sprintf)+04h))^00h,c
	movlw	high(01h)
	addwfc	1+(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1449
	
l13984:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@title)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1452
	
l13986:
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
	line	1453
	
l13988:; BSR set to: 0

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
	line	1456
	
l13990:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@i))&0ffh
	goto	l14094
	line	1458
	
l13992:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_input@i))&0ffh,w
	movwf	((menu_draw_input@item_idx))&0ffh
	line	1459
	
l13994:; BSR set to: 0

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1462
	
l13996:
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
	line	1466
	
l13998:
	line	1468
	
l14000:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u18971
	goto	u18970

u18971:
	goto	l14050
u18970:
	line	1470
	
l14002:; BSR set to: 5

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u18981
	goto	u18980
u18981:
	goto	l14046
u18980:
	line	1472
	
l14004:; BSR set to: 5

	movlw	low(02h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	line	1475
	
l14006:; BSR set to: 0

	movff	(menu_draw_input@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_option_field@flow_type)
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u18991
	goto	u18990
u18991:
	goto	l14020
u18990:
	line	1477
	
l14008:
	movlb	5	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u19001
	goto	u19000
u19001:
	goto	l14022
u19000:
	line	1480
	
l14010:; BSR set to: 5

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts+1)
	line	1481
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag+1)
	line	1483
	
l14012:
	movlb	0	; () banked
	movf	((menu_draw_input@opts))&0ffh,w
iorwf	((menu_draw_input@opts+1))&0ffh,w
	btfsc	status,2
	goto	u19011
	goto	u19010

u19011:
	goto	l14020
u19010:
	
l14014:; BSR set to: 0

	movf	((menu_draw_input@flag))&0ffh,w
iorwf	((menu_draw_input@flag+1))&0ffh,w
	btfsc	status,2
	goto	u19021
	goto	u19020

u19021:
	goto	l14020
u19020:
	
l14016:; BSR set to: 0

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
	goto	u19031
	goto	u19030
u19031:
	goto	l14020
u19030:
	line	1485
	
l14018:; BSR set to: 0

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
	line	1486
	goto	l14054
	line	1489
	
l14020:
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
	goto	l14054
	line	1495
	
l14022:; BSR set to: 5

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts_1524)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts_1524+1)
	line	1496
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag_1528)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag_1528+1)
	line	1498
	
l14024:
	movlb	0	; () banked
	movf	((menu_draw_input@opts_1524))&0ffh,w
iorwf	((menu_draw_input@opts_1524+1))&0ffh,w
	btfsc	status,2
	goto	u19041
	goto	u19040

u19041:
	goto	l14042
u19040:
	
l14026:; BSR set to: 0

	movf	((menu_draw_input@flag_1528))&0ffh,w
iorwf	((menu_draw_input@flag_1528+1))&0ffh,w
	btfsc	status,2
	goto	u19051
	goto	u19050

u19051:
	goto	l14042
u19050:
	
l14028:; BSR set to: 0

	movff	(menu_draw_input@flag_1528),fsr2l
	movff	(menu_draw_input@flag_1528+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	01h
	addwf	((menu_draw_input@opts_1524))&0ffh,w
	movwf	(??_menu_draw_input+1+0)^00h,c
	movlw	0
	addwfc	((menu_draw_input@opts_1524+1))&0ffh,w
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
	goto	u19061
	goto	u19060
u19061:
	goto	l14042
u19060:
	line	1500
	
l14030:; BSR set to: 0

	movff	(menu_draw_input@flag_1528),fsr2l
	movff	(menu_draw_input@flag_1528+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movf	((??_menu_draw_input+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_input+1+0
	movff	prodh,??_menu_draw_input+1+0+1
	movf	(??_menu_draw_input+1+0)^00h,c,w
	addwf	((menu_draw_input@opts_1524))&0ffh,w
	movwf	(??_menu_draw_input+3+0)^00h,c
	movf	(??_menu_draw_input+1+1)^00h,c,w
	addwfc	((menu_draw_input@opts_1524+1))&0ffh,w
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
	line	1501
	
l14032:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j))&0ffh
	goto	l14038
	line	1502
	
l14034:; BSR set to: 0

	movf	((menu_draw_input@j))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1501
	
l14036:; BSR set to: 0

	incf	((menu_draw_input@j))&0ffh
	
l14038:; BSR set to: 0

		movf	((menu_draw_input@val_len))&0ffh,w
	subwf	((menu_draw_input@j))&0ffh,w
	btfss	status,0
	goto	u19071
	goto	u19070

u19071:
	goto	l14034
u19070:
	line	1503
	
l14040:; BSR set to: 0

	movf	((menu_draw_input@val_len))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1504
	goto	l14054
	line	1507
	
l14042:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_240)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_240)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l14054
	line	1520
	
l14046:; BSR set to: 5

	movlw	low(01h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l14020
	line	1527
	
l14050:; BSR set to: 5

	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l14020
	line	1532
	
l14054:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_1532))&0ffh
	line	1533
	
l14056:; BSR set to: 0

	movf	((menu_draw_input@val_len_1532))&0ffh,w
	btfsc	status,2
	goto	u19081
	goto	u19080
u19081:
	goto	l14092
u19080:
	
l14058:; BSR set to: 0

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
		movlw	low(STR_241)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_241)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u19091
	goto	u19090

u19091:
	goto	l14092
u19090:
	line	1536
	
l14060:
	movlb	5	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u19101
	goto	u19100
u19101:
	goto	l14068
u19100:
	
l14062:; BSR set to: 5

	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	5	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19111
	goto	u19110

u19111:
	goto	l14068
u19110:
	line	1539
	
l14064:; BSR set to: 5

	movff	(menu_draw_input@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_numeric_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u19121
	goto	u19120
u19121:
	goto	l14092
u19120:
	
l14066:
	movff	(menu_draw_input@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_time_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u19131
	goto	u19130
u19131:
	goto	l14068
u19130:
	goto	l14092
	line	1546
	
l14068:
	movlb	0	; () banked
	movf	((menu_draw_input@show_brackets))&0ffh,w
	btfss	status,2
	goto	u19141
	goto	u19140
u19141:
	goto	l14072
u19140:
	line	1549
	
l14070:; BSR set to: 0

	movf	((menu_draw_input@val_len_1532))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	1550
	goto	l14092
	line	1554
	
l14072:; BSR set to: 0

	movf	((menu_draw_input@val_len_1532))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_input@start_pos))&0ffh
	line	1555
	
l14074:; BSR set to: 0

	movff	(menu_draw_input@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1558
	
l14076:
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u19151
	goto	u19150

u19151:
	goto	l14080
u19150:
	
l14078:; BSR set to: 0

		movlw	low(STR_243)
	movwf	((_menu_draw_input$1538))&0ffh
	movlw	high(STR_243)
	movwf	((_menu_draw_input$1538+1))&0ffh

	goto	l14082
	
l14080:; BSR set to: 0

		movlw	low(STR_242)
	movwf	((_menu_draw_input$1538))&0ffh
	movlw	high(STR_242)
	movwf	((_menu_draw_input$1538+1))&0ffh

	
l14082:; BSR set to: 0

		movff	(_menu_draw_input$1538),(c:lcd_print@str)
	movff	(_menu_draw_input$1538+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1560
	
l14084:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1562
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u19161
	goto	u19160

u19161:
	goto	l14088
u19160:
	
l14086:; BSR set to: 0

		movlw	low(STR_245)
	movwf	((_menu_draw_input$1542))&0ffh
	movlw	high(STR_245)
	movwf	((_menu_draw_input$1542+1))&0ffh

	goto	l14090
	
l14088:; BSR set to: 0

		movlw	low(STR_244)
	movwf	((_menu_draw_input$1542))&0ffh
	movlw	high(STR_244)
	movwf	((_menu_draw_input$1542+1))&0ffh

	
l14090:; BSR set to: 0

		movff	(_menu_draw_input$1542),(c:lcd_print@str)
	movff	(_menu_draw_input$1542+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1456
	
l14092:
	movlb	0	; () banked
	incf	((menu_draw_input@i))&0ffh
	
l14094:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_input@i))&0ffh
	goto	u19171
	goto	u19170

u19171:
	goto	l1049
u19170:
	
l14096:; BSR set to: 0

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
	goto	u19181
	goto	u19180

u19181:
	goto	l13992
u19180:
	line	1566
	
l1049:; BSR set to: 0

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
;;		 -> menu_draw_clock@value_buf(15), STR_277(1), value_pwr_fail(6), value_brightness(4), 
;;		 -> value_contrast(4), value_log_entries(6), STR_276(1), STR_275(1), 
;;		 -> STR_274(1), value_clock_display(10), value_end_runtime(10), value_clock_enable(10), 
;;		 -> menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), value_rlylow(10), 
;;		 -> value_flow_type(10), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), value_menu_timeout(6), value_relay_pulse(10), STR_137(5), 
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
;;		 -> menu_draw_clock@value_buf(15), STR_277(1), value_pwr_fail(6), value_brightness(4), 
;;		 -> value_contrast(4), value_log_entries(6), STR_276(1), STR_275(1), 
;;		 -> STR_274(1), value_clock_display(10), value_end_runtime(10), value_clock_enable(10), 
;;		 -> menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), value_rlylow(10), 
;;		 -> value_flow_type(10), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), value_menu_timeout(6), value_relay_pulse(10), STR_137(5), 
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
	
l12676:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l12680
	line	10
	
l12678:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l12680:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16507
	tblrd	*
	
	movf	tablat,w
	bra	u16500
u16507:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u16500:
	iorlw	0
	btfss	status,2
	goto	u16511
	goto	u16510
u16511:
	goto	l12678
u16510:
	line	12
	
l12682:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l2608:
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
;;		 -> original_value(10), menu_draw_utility@value_buf(15), menu_draw_clock@value_buf(15), STR_277(1), 
;;		 -> value_pwr_fail(6), value_brightness(4), value_contrast(4), value_log_entries(6), 
;;		 -> STR_276(1), STR_275(1), STR_274(1), value_clock_display(10), 
;;		 -> value_end_runtime(10), value_clock_enable(10), menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), value_menu_timeout(6), 
;;		 -> value_relay_pulse(10), NULL(0), 
;;  from            2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_277(1), value_pwr_fail(6), value_brightness(4), value_contrast(4), 
;;		 -> value_log_entries(6), STR_276(1), STR_275(1), STR_274(1), 
;;		 -> STR_271(5), value_clock_display(10), STR_269(9), STR_268(6), 
;;		 -> STR_267(6), value_end_runtime(10), value_clock_enable(10), STR_240(6), 
;;		 -> menu_update_edit_value@value_buf(10), value_no_flow_bp(10), STR_223(4), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), STR_218(4), STR_217(2), 
;;		 -> value_flow_units(10), STR_216(9), STR_215(6), STR_214(6), 
;;		 -> value_rlylow(10), STR_213(5), STR_212(5), STR_211(8), 
;;		 -> STR_210(7), value_flow_type(10), STR_209(5), STR_208(5), 
;;		 -> STR_207(5), STR_206(9), STR_205(6), STR_204(6), 
;;		 -> value_high_tbp(10), value_high_temp(10), STR_199(5), value_back(5), 
;;		 -> STR_198(5), STR_197(5), value_display(10), STR_196(9), 
;;		 -> STR_195(6), STR_194(6), value_rlyslp(10), STR_193(9), 
;;		 -> STR_192(6), STR_191(6), value_rlyplp(10), STR_190(9), 
;;		 -> STR_189(6), STR_188(6), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), STR_180(9), value_sensor(12), 
;;		 -> value_enable(10), value_menu_timeout(6), value_relay_pulse(10), NULL(0), 
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
;;		 -> original_value(10), menu_draw_utility@value_buf(15), menu_draw_clock@value_buf(15), STR_277(1), 
;;		 -> value_pwr_fail(6), value_brightness(4), value_contrast(4), value_log_entries(6), 
;;		 -> STR_276(1), STR_275(1), STR_274(1), value_clock_display(10), 
;;		 -> value_end_runtime(10), value_clock_enable(10), menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), value_menu_timeout(6), 
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
	
l12670:
		movff	(c:strcpy@to),(c:strcpy@cp)
	movff	(c:strcpy@to+1),(c:strcpy@cp+1)

	line	19
	goto	l12674
	line	20
	
l12672:
	infsnz	((c:strcpy@cp))^00h,c
	incf	((c:strcpy@cp+1))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l12674:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16477
	tblrd	*
	
	movf	tablat,w
	bra	u16470
u16477:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u16470:
	movff	(c:strcpy@cp),tblptrl
	movff	(c:strcpy@cp+1),tblptrh
	clrf	tblptru
	
	movwf	(??_strcpy+0+0)^00h,c
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16487
	movff	??_strcpy+0+0,tablat
	tblwt*
	bra	u16480
u16487:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	??_strcpy+0+0,indf0
u16480:
	
	movf	(??_strcpy+0+0)^00h,c,w
	btfss	status,2
	goto	u16491
	goto	u16490
u16491:
	goto	l12672
u16490:
	line	24
	
l2602:
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
;;		 -> STR_277(1), value_pwr_fail(6), value_brightness(4), value_contrast(4), 
;;		 -> value_log_entries(6), STR_276(1), STR_275(1), STR_274(1), 
;;		 -> value_clock_display(10), value_end_runtime(10), value_clock_enable(10), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), value_menu_timeout(6), value_relay_pulse(10), 
;;		 -> NULL(0), 
;;  s2              2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_346(5), STR_345(6), STR_344(6), STR_343(8), 
;;		 -> STR_241(1), STR_76(1), STR_75(1), STR_74(9), 
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
	
l13432:
	goto	l13436
	line	38
	
l13434:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l13436:
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
	bra	u17977
	tblrd	*
	
	movf	tablat,w
	bra	u17970
u17977:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u17970:
	movwf	(??_strcmp+1+0)^00h,c
	movf	(??_strcmp+0+0)^00h,c,w
	subwf	((??_strcmp+1+0))^00h,c,w
	movwf	((c:strcmp@r))^00h,c
	movf	((c:strcmp@r))^00h,c,w
	btfss	status,2
	goto	u17981
	goto	u17980
u17981:
	goto	l13440
u17980:
	
l13438:
	movff	(c:strcmp@s1),tblptrl
	movff	(c:strcmp@s1+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u17997
	tblrd	*
	
	movf	tablat,w
	bra	u17990
u17997:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u17990:
	iorlw	0
	btfss	status,2
	goto	u18001
	goto	u18000
u18001:
	goto	l13434
u18000:
	line	41
	
l13440:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l2596:
	return	;funcret
	callstack 0
GLOBAL	__end_of_strcmp
	__end_of_strcmp:
	signat	_strcmp,8314
	global	_lcd_print_at

;; *************** function _lcd_print_at *****************
;; Defined at:
;;		line 957 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   21[COMRAM] unsigned char 
;;  str             2   22[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_utility@value_buf(15), STR_295(2), STR_294(2), STR_293(5), 
;;		 -> STR_292(7), STR_291(10), STR_290(12), STR_289(8), 
;;		 -> STR_288(14), menu_draw_clock@value_buf(15), STR_283(6), Fake(1), 
;;		 -> STR_254(5), STR_253(5), STR_252(9), STR_251(5), 
;;		 -> STR_250(6), STR_249(1), STR_248(1), STR_247(1), 
;;		 -> menu_draw_input@value_buf(15), menu_draw_input@title(10), STR_175(5), STR_174(2), 
;;		 -> STR_173(5), STR_172(2), STR_171(2), STR_170(2), 
;;		 -> STR_169(2), STR_168(2), STR_167(2), STR_166(2), 
;;		 -> STR_165(2), STR_164(2), menu_update_datetime_display@time_buf(9), menu_update_datetime_display@date_buf(9), 
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
	line	957
global __ptext30
__ptext30:
psect	text30
	file	"src\menu.c"
	line	957
	
_lcd_print_at:
;incstack = 0
	callstack 23
	movwf	((c:lcd_print_at@row))^00h,c
	line	959
	
l12666:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	960
	
l12668:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	961
	
l761:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print_at
	__end_of_lcd_print_at:
	signat	_lcd_print_at,12409
	global	_lcd_clear_line

;; *************** function _lcd_clear_line *****************
;; Defined at:
;;		line 963 in file "src\menu.c"
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
	line	963
global __ptext31
__ptext31:
psect	text31
	file	"src\menu.c"
	line	963
	
_lcd_clear_line:
;incstack = 0
	callstack 23
	movwf	((c:lcd_clear_line@row))^00h,c
	line	965
	
l12662:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	966
	
l12664:
		movlw	low(STR_176)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_176)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	967
	
l764:
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
	
l12344:
	goto	l12356
	line	135
	
l1630:
	line	136
	movff	(c:lcd_set_cursor@col),(c:lcd_set_cursor@addr)
	line	137
	goto	l12358
	line	139
	
l12346:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(040h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	140
	goto	l12358
	line	142
	
l12348:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(094h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	143
	goto	l12358
	line	145
	
l12350:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(0D4h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	146
	goto	l12358
	line	148
	
l12352:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	149
	goto	l12358
	line	133
	
l12356:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l1630
	xorlw	1^0	; case 1
	skipnz
	goto	l12346
	xorlw	2^1	; case 2
	skipnz
	goto	l12348
	xorlw	3^2	; case 3
	skipnz
	goto	l12350
	goto	l12352

	line	152
	
l12358:
	movf	((c:lcd_set_cursor@addr))^00h,c,w
	iorlw	low(080h)
	
	call	_lcd_cmd
	line	153
	
l1636:
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
;;		 -> STR_299(2), STR_298(2), STR_297(2), STR_296(2), 
;;		 -> menu_draw_utility@value_buf(15), STR_295(2), STR_294(2), STR_293(5), 
;;		 -> STR_292(7), STR_291(10), STR_290(12), STR_289(8), 
;;		 -> STR_288(14), STR_287(2), STR_286(2), STR_285(2), 
;;		 -> STR_284(2), menu_draw_clock@value_buf(15), STR_283(6), STR_262(2), 
;;		 -> STR_261(2), STR_260(2), STR_259(2), STR_258(2), 
;;		 -> STR_257(2), STR_256(2), STR_255(2), Fake(1), 
;;		 -> STR_254(5), STR_253(5), STR_252(9), STR_251(5), 
;;		 -> STR_250(6), STR_249(1), STR_248(1), STR_247(1), 
;;		 -> STR_246(21), STR_245(2), STR_244(2), STR_243(2), 
;;		 -> STR_242(2), menu_draw_input@value_buf(15), menu_draw_input@title(10), STR_238(2), 
;;		 -> STR_237(2), STR_236(21), STR_235(2), STR_234(2), 
;;		 -> STR_233(6), menu_update_numeric_value@value_buf(6), STR_232(2), STR_231(2), 
;;		 -> STR_230(7), menu_update_edit_value@display_buf(10), STR_176(21), STR_175(5), 
;;		 -> STR_174(2), STR_173(5), STR_172(2), STR_171(2), 
;;		 -> STR_170(2), STR_169(2), STR_168(2), STR_167(2), 
;;		 -> STR_166(2), STR_165(2), STR_164(2), menu_update_datetime_display@time_buf(9), 
;;		 -> menu_update_datetime_display@date_buf(9), STR_151(2), STR_150(2), STR_149(8), 
;;		 -> STR_146(2), STR_145(2), STR_144(8), menu_update_time_value@value_buf(6), 
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
;;		 -> STR_77(10), STR_38(8), STR_37(12), STR_32(6), 
;;		 -> STR_31(12), STR_18(16), STR_17(13), 
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
	
l12360:
	goto	l12366
	line	160
	
l12362:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15897
	tblrd	*
	
	movf	tablat,w
	bra	u15890
u15897:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15890:
	
	call	_lcd_data
	
l12364:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	158
	
l12366:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15907
	tblrd	*
	
	movf	tablat,w
	bra	u15900
u15907:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15900:
	iorlw	0
	btfss	status,2
	goto	u15911
	goto	u15910
u15911:
	goto	l12362
u15910:
	line	162
	
l1642:
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
	
l12310:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	52
	
l12312:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	53
	
l12314:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	54
	
l12316:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	55
	
l12318:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	56
	
l12320:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	57
	
l12322:
	asmopt push
asmopt off
	movlw	133
u23477:
decfsz	wreg,f
	bra	u23477
	nop
asmopt pop

	line	60
	
l12324:
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	61
	
l12326:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	62
	
l12328:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	63
	
l12330:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	64
	
l12332:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	65
	
l12334:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	66
	asmopt push
asmopt off
	movlw	133
u23487:
decfsz	wreg,f
	bra	u23487
	nop
asmopt pop

	line	67
	
l1623:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
	signat	_lcd_data,4217
	global	_is_time_field

;; *************** function _is_time_field *****************
;; Defined at:
;;		line 256 in file "src\menu.c"
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
	line	256
global __ptext35
__ptext35:
psect	text35
	file	"src\menu.c"
	line	256
	
_is_time_field:
;incstack = 0
	callstack 27
	movwf	((c:is_time_field@line))^00h,c
	line	258
	
l12938:
	movf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16931
	goto	u16930
u16931:
	goto	l12954
u16930:
	line	261
	
l12940:
	movlw	low(01h)
	movwf	((c:_is_time_field$1251))^00h,c
	
l12942:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16941
	goto	u16940

u16941:
	goto	l537
u16940:
	
l12944:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16951
	goto	u16950

u16951:
	goto	l537
u16950:
	
l12946:
		movlw	8
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16961
	goto	u16960

u16961:
	goto	l537
u16960:
	
l12948:
	movlw	low(0)
	movwf	((c:_is_time_field$1251))^00h,c
	
l537:
	movf	((c:_is_time_field$1251))^00h,c,w
	goto	l538
	line	263
	
l12954:
		decf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16971
	goto	u16970

u16971:
	goto	l12962
u16970:
	line	266
	
l12956:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u16981
	goto	u16980

u16981:
	movlw	1
	goto	u16990
u16980:
	movlw	0
u16990:
	goto	l538
	line	268
	
l12962:
		movlw	2
	xorwf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17001
	goto	u17000

u17001:
	goto	l12976
u17000:
	line	270
	
l12964:
	movf	((c:is_time_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u17011
	goto	u17010
u17011:
	goto	l12972
u17010:
	line	273
	
l12966:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u17021
	goto	u17020

u17021:
	movlw	1
	goto	u17030
u17020:
	movlw	0
u17030:
	goto	l538
	line	278
	
l12972:
		movlw	4
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u17041
	goto	u17040

u17041:
	movlw	1
	goto	u17050
u17040:
	movlw	0
u17050:
	goto	l538
	line	282
	
l12976:
	movlw	(0)&0ffh
	line	283
	
l538:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_time_field
	__end_of_is_time_field:
	signat	_is_time_field,12409
	global	_is_option_field

;; *************** function _is_option_field *****************
;; Defined at:
;;		line 288 in file "src\menu.c"
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
	line	288
global __ptext36
__ptext36:
psect	text36
	file	"src\menu.c"
	line	288
	
_is_option_field:
;incstack = 0
	callstack 26
	movwf	((c:is_option_field@line))^00h,c
	line	291
	
l13066:
	movf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17171
	goto	u17170
u17171:
	goto	l13070
u17170:
	
l13068:
		decf	((c:is_option_field@line))^00h,c,w
	btfss	status,2
	goto	u17181
	goto	u17180

u17181:
	goto	l13074
u17180:
	line	292
	
l13070:
	movlw	(01h)&0ffh
	goto	l550
	line	294
	
l13074:
	movf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17191
	goto	u17190
u17191:
	goto	l13092
u17190:
	line	297
	
l13076:
	movlw	low(01h)
	movwf	((c:_is_option_field$1256))^00h,c
	
l13078:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17201
	goto	u17200

u17201:
	goto	l553
u17200:
	
l13080:
		movlw	10
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17211
	goto	u17210

u17211:
	goto	l553
u17210:
	
l13082:
		movlw	11
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17221
	goto	u17220

u17221:
	goto	l553
u17220:
	
l13084:
		movlw	12
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17231
	goto	u17230

u17231:
	goto	l553
u17230:
	
l13086:
	movlw	low(0)
	movwf	((c:_is_option_field$1256))^00h,c
	
l553:
	movf	((c:_is_option_field$1256))^00h,c,w
	goto	l550
	line	299
	
l13092:
		decf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17241
	goto	u17240

u17241:
	goto	l13106
u17240:
	line	302
	
l13094:
	movlw	low(01h)
	movwf	((c:_is_option_field$1257))^00h,c
	
l13096:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17251
	goto	u17250

u17251:
	goto	l557
u17250:
	
l13098:
		movlw	7
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17261
	goto	u17260

u17261:
	goto	l557
u17260:
	
l13100:
	movlw	low(0)
	movwf	((c:_is_option_field$1257))^00h,c
	
l557:
	movf	((c:_is_option_field$1257))^00h,c,w
	goto	l550
	line	304
	
l13106:
		movlw	2
	xorwf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17271
	goto	u17270

u17271:
	goto	l13140
u17270:
	line	306
	
l13108:
	movf	((c:is_option_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u17281
	goto	u17280
u17281:
	goto	l13126
u17280:
	line	309
	
l13110:
	movlw	low(01h)
	movwf	((c:_is_option_field$1258))^00h,c
	
l13112:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17291
	goto	u17290

u17291:
	goto	l562
u17290:
	
l13114:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17301
	goto	u17300

u17301:
	goto	l562
u17300:
	
l13116:
		movlw	8
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17311
	goto	u17310

u17311:
	goto	l562
u17310:
	
l13118:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17321
	goto	u17320

u17321:
	goto	l562
u17320:
	
l13120:
	movlw	low(0)
	movwf	((c:_is_option_field$1258))^00h,c
	
l562:
	movf	((c:_is_option_field$1258))^00h,c,w
	goto	l550
	line	314
	
l13126:
	movlw	low(01h)
	movwf	((c:_is_option_field$1259))^00h,c
	
l13128:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17331
	goto	u17330

u17331:
	goto	l565
u17330:
	
l13130:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17341
	goto	u17340

u17341:
	goto	l565
u17340:
	
l13132:
		movlw	5
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17351
	goto	u17350

u17351:
	goto	l565
u17350:
	
l13134:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u17361
	goto	u17360

u17361:
	goto	l565
u17360:
	
l13136:
	movlw	low(0)
	movwf	((c:_is_option_field$1259))^00h,c
	
l565:
	movf	((c:_is_option_field$1259))^00h,c,w
	goto	l550
	line	318
	
l13140:
	movlw	(0)&0ffh
	line	319
	
l550:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_option_field
	__end_of_is_option_field:
	signat	_is_option_field,12409
	global	_is_numeric_field

;; *************** function _is_numeric_field *****************
;; Defined at:
;;		line 224 in file "src\menu.c"
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
	line	224
global __ptext37
__ptext37:
psect	text37
	file	"src\menu.c"
	line	224
	
_is_numeric_field:
;incstack = 0
	callstack 27
	movwf	((c:is_numeric_field@line))^00h,c
	line	226
	
l12878:
	movf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16791
	goto	u16790
u16791:
	goto	l12896
u16790:
	line	229
	
l12880:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1244))^00h,c
	
l12882:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16801
	goto	u16800

u16801:
	goto	l521
u16800:
	
l12884:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16811
	goto	u16810

u16811:
	goto	l521
u16810:
	
l12886:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16821
	goto	u16820

u16821:
	goto	l521
u16820:
	
l12888:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16831
	goto	u16830

u16831:
	goto	l521
u16830:
	
l12890:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1244))^00h,c
	
l521:
	movf	((c:_is_numeric_field$1244))^00h,c,w
	goto	l522
	line	231
	
l12896:
		decf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16841
	goto	u16840

u16841:
	goto	l12912
u16840:
	line	234
	
l12898:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1245))^00h,c
	
l12900:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16851
	goto	u16850

u16851:
	goto	l526
u16850:
	
l12902:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16861
	goto	u16860

u16861:
	goto	l526
u16860:
	
l12904:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16871
	goto	u16870

u16871:
	goto	l526
u16870:
	
l12906:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1245))^00h,c
	
l526:
	movf	((c:_is_numeric_field$1245))^00h,c,w
	goto	l522
	line	236
	
l12912:
		movlw	2
	xorwf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u16881
	goto	u16880

u16881:
	goto	l12930
u16880:
	line	238
	
l12914:
	movf	((c:is_numeric_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u16891
	goto	u16890
u16891:
	goto	l12930
u16890:
	line	241
	
l12916:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1246))^00h,c
	
l12918:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16901
	goto	u16900

u16901:
	goto	l531
u16900:
	
l12920:
		movlw	5
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16911
	goto	u16910

u16911:
	goto	l531
u16910:
	
l12922:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u16921
	goto	u16920

u16921:
	goto	l531
u16920:
	
l12924:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1246))^00h,c
	
l531:
	movf	((c:_is_numeric_field$1246))^00h,c,w
	goto	l522
	line	246
	
l12930:
	movlw	(0)&0ffh
	line	251
	
l522:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_numeric_field
	__end_of_is_numeric_field:
	signat	_is_numeric_field,12409
	global	_get_option_edit_flag

;; *************** function _get_option_edit_flag *****************
;; Defined at:
;;		line 325 in file "src\menu.c"
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
	line	325
global __ptext38
__ptext38:
psect	text38
	file	"src\menu.c"
	line	325
	
_get_option_edit_flag:
;incstack = 0
	callstack 26
	movwf	((c:get_option_edit_flag@line))^00h,c
	line	328
	
l13144:
	movf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17371
	goto	u17370
u17371:
	goto	l13150
u17370:
	line	329
	
l13146:
		movlw	low(_enable_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l569
	line	330
	
l13150:
		decf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17381
	goto	u17380

u17381:
	goto	l13156
u17380:
	line	331
	
l13152:
		movlw	low(_sensor_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l569
	line	334
	
l13156:
	movf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17391
	goto	u17390
u17391:
	goto	l13182
u17390:
	line	336
	
l13158:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17401
	goto	u17400

u17401:
	goto	l13164
u17400:
	line	337
	
l13160:
		movlw	low(_relay_high_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l569
	line	338
	
l13164:
		movlw	10
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17411
	goto	u17410

u17411:
	goto	l13170
u17410:
	line	339
	
l13166:
		movlw	low(_relay_plp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l569
	line	340
	
l13170:
		movlw	11
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17421
	goto	u17420

u17421:
	goto	l13176
u17420:
	line	341
	
l13172:
		movlw	low(_relay_slp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l569
	line	342
	
l13176:
		movlw	12
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17431
	goto	u17430

u17431:
	goto	l13242
u17430:
	line	343
	
l13178:
		movlw	low(_display_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l569
	line	346
	
l13182:
		decf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17441
	goto	u17440

u17441:
	goto	l13196
u17440:
	line	348
	
l13184:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17451
	goto	u17450

u17451:
	goto	l13190
u17450:
	goto	l13160
	line	350
	
l13190:
		movlw	7
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17461
	goto	u17460

u17461:
	goto	l13242
u17460:
	goto	l13178
	line	354
	
l13196:
		movlw	2
	xorwf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17471
	goto	u17470

u17471:
	goto	l13242
u17470:
	line	356
	
l13198:
		movlw	2
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17481
	goto	u17480

u17481:
	goto	l13204
u17480:
	line	357
	
l13200:
		movlw	low(_flow_type_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l569
	line	359
	
l13204:
	movf	((c:get_option_edit_flag@flow_type))^00h,c,w
	btfss	status,2
	goto	u17491
	goto	u17490
u17491:
	goto	l13224
u17490:
	line	361
	
l13206:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17501
	goto	u17500

u17501:
	goto	l13212
u17500:
	line	362
	
l13208:
		movlw	low(_flow_units_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l569
	line	363
	
l13212:
		movlw	8
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17511
	goto	u17510

u17511:
	goto	l13218
u17510:
	line	364
	
l13214:
		movlw	low(_relay_low_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l569
	line	365
	
l13218:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17521
	goto	u17520

u17521:
	goto	l13242
u17520:
	goto	l13178
	line	370
	
l13224:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17531
	goto	u17530

u17531:
	goto	l13230
u17530:
	line	371
	
l13226:
		movlw	low(_no_flow_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l569
	line	372
	
l13230:
		movlw	5
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17541
	goto	u17540

u17541:
	goto	l13236
u17540:
	goto	l13214
	line	374
	
l13236:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u17551
	goto	u17550

u17551:
	goto	l13242
u17550:
	goto	l13178
	line	379
	
l13242:
		movlw	low(0)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(0)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	line	380
	
l569:
	return	;funcret
	callstack 0
GLOBAL	__end_of_get_option_edit_flag
	__end_of_get_option_edit_flag:
	signat	_get_option_edit_flag,12410
	global	_get_item_options_for_field

;; *************** function _get_item_options_for_field *****************
;; Defined at:
;;		line 386 in file "src\menu.c"
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
	line	386
global __ptext39
__ptext39:
psect	text39
	file	"src\menu.c"
	line	386
	
_get_item_options_for_field:
;incstack = 0
	callstack 26
	movwf	((c:get_item_options_for_field@line))^00h,c
	line	389
	
l13246:
	movf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17561
	goto	u17560
u17561:
	goto	l13252
u17560:
	line	390
	
l13248:
		movlw	low(_menu_item_options)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l594
	line	391
	
l13252:
		decf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17571
	goto	u17570

u17571:
	goto	l13258
u17570:
	line	392
	
l13254:
		movlw	low(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l594
	line	395
	
l13258:
	movf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17581
	goto	u17580
u17581:
	goto	l13276
u17580:
	line	397
	
l13260:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u17591
	goto	u17590

u17591:
	goto	l13266
u17590:
	
l13262:
		movlw	10
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u17601
	goto	u17600

u17601:
	goto	l13266
u17600:
	
l13264:
		movlw	11
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17611
	goto	u17610

u17611:
	goto	l13270
u17610:
	line	398
	
l13266:
		movlw	low(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l594
	line	399
	
l13270:
		movlw	12
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17621
	goto	u17620

u17621:
	goto	l13336
u17620:
	line	400
	
l13272:
		movlw	low(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l594
	line	403
	
l13276:
		decf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17631
	goto	u17630

u17631:
	goto	l13290
u17630:
	line	405
	
l13278:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17641
	goto	u17640

u17641:
	goto	l13284
u17640:
	goto	l13266
	line	407
	
l13284:
		movlw	7
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17651
	goto	u17650

u17651:
	goto	l13336
u17650:
	goto	l13272
	line	411
	
l13290:
		movlw	2
	xorwf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u17661
	goto	u17660

u17661:
	goto	l13336
u17660:
	line	413
	
l13292:
		movlw	2
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17671
	goto	u17670

u17671:
	goto	l13298
u17670:
	line	414
	
l13294:
		movlw	low(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l594
	line	416
	
l13298:
	movf	((c:get_item_options_for_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u17681
	goto	u17680
u17681:
	goto	l13318
u17680:
	line	418
	
l13300:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17691
	goto	u17690

u17691:
	goto	l13306
u17690:
	line	419
	
l13302:
		movlw	low(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l594
	line	420
	
l13306:
		movlw	8
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17701
	goto	u17700

u17701:
	goto	l13312
u17700:
	goto	l13266
	line	422
	
l13312:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17711
	goto	u17710

u17711:
	goto	l13336
u17710:
	goto	l13272
	line	427
	
l13318:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17721
	goto	u17720

u17721:
	goto	l13324
u17720:
	line	428
	
l13320:
		movlw	low(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l594
	line	429
	
l13324:
		movlw	5
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17731
	goto	u17730

u17731:
	goto	l13330
u17730:
	goto	l13266
	line	431
	
l13330:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u17741
	goto	u17740

u17741:
	goto	l13336
u17740:
	goto	l13272
	line	436
	
l13336:
		movlw	low(0)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(0)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	line	437
	
l594:
	return	;funcret
	callstack 0
GLOBAL	__end_of_get_item_options_for_field
	__end_of_get_item_options_for_field:
	signat	_get_item_options_for_field,12410
	global	_init_time_editor

;; *************** function _init_time_editor *****************
;; Defined at:
;;		line 446 in file "src\menu.c"
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
	line	446
global __ptext40
__ptext40:
psect	text40
	file	"src\menu.c"
	line	446
	
_init_time_editor:
;incstack = 0
	callstack 24
	line	449
	
l14198:
	movff	(c:init_time_editor@mode),0+(_menu+010h)
	line	450
	movff	(c:init_time_editor@value_seconds),0+(_menu+014h)
	movff	(c:init_time_editor@value_seconds+1),1+(_menu+014h)
	line	453
	
l14200:
	movf	((c:init_time_editor@mode))^00h,c,w
	btfss	status,2
	goto	u19311
	goto	u19310
u19311:
	goto	l14204
u19310:
	line	455
	
l14202:
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
	line	456
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
	line	457
	goto	l14206
	line	460
	
l14204:
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
	line	461
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
	line	465
	
l14206:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+011h))&0ffh
	line	470
	
l14208:; BSR set to: 5

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
	line	471
	
l14210:
		movlw	low(init_time_editor@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	472
	
l620:
	return	;funcret
	callstack 0
GLOBAL	__end_of_init_time_editor
	__end_of_init_time_editor:
	signat	_init_time_editor,8313
	global	_init_numeric_editor

;; *************** function _init_numeric_editor *****************
;; Defined at:
;;		line 1144 in file "src\menu.c"
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
	line	1144
global __ptext41
__ptext41:
psect	text41
	file	"src\menu.c"
	line	1144
	
_init_numeric_editor:
;incstack = 0
	callstack 26
	line	1148
	
l14560:
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
	line	1149
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
	line	1152
	
l14562:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+0Fh))&0ffh
	line	1154
	
l14564:; BSR set to: 5

	movf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u19541
	goto	u19540
u19541:
	goto	l14572
u19540:
	line	1157
	
l14566:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u19551
	goto	u19550

u19551:
	goto	l14570
u19550:
	
l14568:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19561
	goto	u19560

u19561:
	goto	l14586
u19560:
	line	1158
	
l14570:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+0Fh))&0ffh
	goto	l14586
	line	1160
	
l14572:; BSR set to: 5

		decf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u19571
	goto	u19570

u19571:
	goto	l14578
u19570:
	line	1163
	
l14574:; BSR set to: 5

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19581
	goto	u19580

u19581:
	goto	l14586
u19580:
	goto	l14570
	line	1166
	
l14578:; BSR set to: 5

		movlw	2
	xorwf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u19591
	goto	u19590

u19591:
	goto	l14586
u19590:
	
l14580:; BSR set to: 5

	movf	((c:init_numeric_editor@flow_type))^00h,c,w
	btfss	status,2
	goto	u19601
	goto	u19600
u19601:
	goto	l14586
u19600:
	line	1169
	
l14582:; BSR set to: 5

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u19611
	goto	u19610

u19611:
	goto	l14586
u19610:
	goto	l14570
	line	1174
	
l14586:; BSR set to: 5

	movff	(c:init_numeric_editor@value),0+(_menu+0Dh)
	movff	(c:init_numeric_editor@value+1),1+(_menu+0Dh)
	line	1177
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u19621
	goto	u19620
u19621:
	goto	l858
u19620:
	
l14588:; BSR set to: 5

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u19630
	goto	u19631

u19631:
	goto	l858
u19630:
	line	1178
	
l14590:; BSR set to: 5

	movlw	high(0)
	movwf	((c:init_numeric_editor@value+1))^00h,c
	movlw	low(0)
	movwf	((c:init_numeric_editor@value))^00h,c
	
l858:; BSR set to: 5

	line	1181
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u19641
	goto	u19640
u19641:
	goto	l14594
u19640:
	
l14592:; BSR set to: 5

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u19651
	goto	u19650

u19651:
	movlw	1
	goto	u19660
u19650:
	movlw	0
u19660:
	movwf	((c:_init_numeric_editor$1453))^00h,c
	clrf	((c:_init_numeric_editor$1453+1))^00h,c
	goto	l14596
	
l14594:; BSR set to: 5

	movlw	high(0)
	movwf	((c:_init_numeric_editor$1453+1))^00h,c
	movlw	low(0)
	movwf	((c:_init_numeric_editor$1453))^00h,c
	
l14596:; BSR set to: 5

	movff	(c:_init_numeric_editor$1453),0+(_menu+09h)
	line	1184
	
l14598:; BSR set to: 5

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u19671
	goto	u19670

u19671:
	goto	l864
u19670:
	
l14600:; BSR set to: 5

	movff	(c:init_numeric_editor@value),(c:init_numeric_editor@abs_val)
	movff	(c:init_numeric_editor@value+1),(c:init_numeric_editor@abs_val+1)
	goto	l14602
	
l864:; BSR set to: 5

	movff	(c:init_numeric_editor@value),??_init_numeric_editor+0+0
	movff	(c:init_numeric_editor@value+1),??_init_numeric_editor+0+0+1
	comf	(??_init_numeric_editor+0+0)^00h,c
	comf	(??_init_numeric_editor+0+1)^00h,c
	infsnz	(??_init_numeric_editor+0+0)^00h,c
	incf	(??_init_numeric_editor+0+1)^00h,c
	movff	??_init_numeric_editor+0+0,(c:init_numeric_editor@abs_val)
	movff	??_init_numeric_editor+0+1,(c:init_numeric_editor@abs_val+1)
	line	1185
	
l14602:; BSR set to: 5

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
	line	1186
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
	line	1187
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
	line	1190
	
l14604:; BSR set to: 5

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u19681
	goto	u19680
u19681:
	movlw	1
	goto	u19690
u19680:
	movlw	0
u19690:
	movwf	(0+(_menu+08h))&0ffh
	line	1191
	
l867:; BSR set to: 5

	return	;funcret
	callstack 0
GLOBAL	__end_of_init_numeric_editor
	__end_of_init_numeric_editor:
	signat	_init_numeric_editor,4217
	global	_init_datetime_editor

;; *************** function _init_datetime_editor *****************
;; Defined at:
;;		line 710 in file "src\menu.c"
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
	line	710
global __ptext42
__ptext42:
psect	text42
	file	"src\menu.c"
	line	710
	
_init_datetime_editor:; BSR set to: 5

;incstack = 0
	callstack 23
	line	715
	
l14242:
		movlw	low(init_datetime_editor@current_time)
	movwf	((c:rtc_read_time@time))^00h,c
	movlw	high(init_datetime_editor@current_time)
	movwf	((c:rtc_read_time@time+1))^00h,c

	call	_rtc_read_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u19331
	goto	u19330
u19331:
	goto	l14250
u19330:
	line	717
	
l14244:
	movff	0+(init_datetime_editor@current_time+04h),0+(_menu+016h)
	line	718
	movff	0+(init_datetime_editor@current_time+05h),0+(_menu+017h)
	line	719
	movff	0+(init_datetime_editor@current_time+06h),0+(_menu+018h)
	line	720
	movff	0+(init_datetime_editor@current_time+02h),0+(_menu+019h)
	line	721
	movff	0+(init_datetime_editor@current_time+01h),0+(_menu+01Ah)
	line	722
	movff	(init_datetime_editor@current_time),0+(_menu+01Bh)
	line	727
	
l14246:
		movlw	low(init_datetime_editor@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(init_datetime_editor@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_152)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_152)
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
	line	728
	
l14248:
		movlw	low(init_datetime_editor@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(init_datetime_editor@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	729
	goto	l14264
	line	732
	
l14250:
		movlw	low(STR_153)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_153)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	733
	
l14252:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	(0+(_menu+016h))&0ffh
	line	734
	
l14254:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+017h))&0ffh
	line	735
	
l14256:; BSR set to: 5

	movlw	low(019h)
	movwf	(0+(_menu+018h))&0ffh
	line	736
	
l14258:; BSR set to: 5

	movlw	low(0Ch)
	movwf	(0+(_menu+019h))&0ffh
	line	737
	
l14260:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Ah))&0ffh
	line	738
	
l14262:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Bh))&0ffh
	line	741
	
l14264:
	movlw	low(0)
	movlb	5	; () banked
	movwf	(0+(_menu+01Ch))&0ffh
	line	742
	
l14266:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Dh))&0ffh
	line	743
	
l14268:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	744
	
l684:; BSR set to: 5

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
	
l12814:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16731
	goto	u16730
u16731:
	goto	l12820
u16730:
	line	127
	
l12816:
	movlw	(01h)&0ffh
	goto	l1775
	line	128
	
l12820:
	asmopt push
asmopt off
	movlw	133
u23497:
decfsz	wreg,f
	bra	u23497
	nop
asmopt pop

	line	130
	
l12822:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u16741
	goto	u16740
u16741:
	goto	l12828
u16740:
	goto	l12816
	line	132
	
l12828:
	asmopt push
asmopt off
	movlw	133
u23507:
decfsz	wreg,f
	bra	u23507
	nop
asmopt pop

	line	134
	
l12830:
	movlw	(0)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u16751
	goto	u16750
u16751:
	goto	l12836
u16750:
	goto	l12816
	line	136
	
l12836:
	asmopt push
asmopt off
	movlw	133
u23517:
decfsz	wreg,f
	bra	u23517
	nop
asmopt pop

	line	138
	
l12838:
	call	_i2c_stop	;wreg free
	line	139
	
l12840:
	asmopt push
asmopt off
	movlw	228
u23527:
	nop2
	nop2
decfsz	wreg,f
	bra	u23527
	nop2
	nop2
asmopt pop

	line	142
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16761
	goto	u16760
u16761:
	goto	l12846
u16760:
	goto	l12816
	line	144
	
l12846:
	asmopt push
asmopt off
	movlw	133
u23537:
decfsz	wreg,f
	bra	u23537
	nop
asmopt pop

	line	146
	
l12848:
	movlw	(0D1h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u16771
	goto	u16770
u16771:
	goto	l12854
u16770:
	goto	l12816
	line	148
	
l12854:
	asmopt push
asmopt off
	movlw	133
u23547:
decfsz	wreg,f
	bra	u23547
	nop
asmopt pop

	line	150
	
l12856:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((rtc_read_time@i))&0ffh
	line	152
	
l12862:; BSR set to: 0

	movf	((rtc_read_time@i))&0ffh,w
	addlw	low(rtc_read_time@data)
	movwf	fsr2l
	clrf	fsr2h
	movlw	(01h)&0ffh
	
	call	_i2c_read
	movwf	indf2,c

	line	150
	
l12864:
	movlb	0	; () banked
	incf	((rtc_read_time@i))&0ffh
	
l12866:; BSR set to: 0

		movlw	06h-1
	cpfsgt	((rtc_read_time@i))&0ffh
	goto	u16781
	goto	u16780

u16781:
	goto	l12862
u16780:
	line	154
	
l12868:; BSR set to: 0

	movlw	(0)&0ffh
	
	call	_i2c_read
	movlb	0	; () banked
	movwf	(0+(rtc_read_time@data+06h))&0ffh
	line	155
	call	_i2c_stop	;wreg free
	line	160
	
l12870:
		movlw	low(rtc_read_time@debug_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_362)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_362)
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
	
l12872:
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
	
l12874:
	movlw	(0)&0ffh
	line	173
	
l1775:
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
	
l12764:
	movff	(c:bcd_to_dec@bcd),??_bcd_to_dec+0+0
	movlw	0Fh
	andwf	(??_bcd_to_dec+0+0)^00h,c
	swapf	((c:bcd_to_dec@bcd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	mullw	0Ah
	movf	(prodl)^0f00h,c,w
	addwf	(??_bcd_to_dec+0+0)^00h,c,w
	line	66
	
l1757:
	return	;funcret
	callstack 0
GLOBAL	__end_of_bcd_to_dec
	__end_of_bcd_to_dec:
	signat	_bcd_to_dec,4217
	global	_get_current_numeric_value

;; *************** function _get_current_numeric_value *****************
;; Defined at:
;;		line 1193 in file "src\menu.c"
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
	line	1193
global __ptext45
__ptext45:
psect	text45
	file	"src\menu.c"
	line	1193
	
_get_current_numeric_value:
;incstack = 0
	callstack 27
	line	1195
	
l14606:; BSR set to: 5

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
	line	1196
	
l14608:; BSR set to: 5

	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u19701
	goto	u19700
u19701:
	goto	l14612
u19700:
	line	1197
	
l14610:; BSR set to: 5

	negf	((c:get_current_numeric_value@value))^00h,c
	comf	((c:get_current_numeric_value@value+1))^00h,c
	btfsc	status,0
	incf	((c:get_current_numeric_value@value+1))^00h,c
	line	1198
	
l14612:; BSR set to: 5

	movff	(c:get_current_numeric_value@value),(c:?_get_current_numeric_value)
	movff	(c:get_current_numeric_value@value+1),(c:?_get_current_numeric_value+1)
	line	1199
	
l871:; BSR set to: 5

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
	
l13526:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	166
	
l13528:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l157
	line	168
	
l13530:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u23557:
decfsz	wreg,f
	bra	u23557
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u23557
	nop2
asmopt pop

	line	166
	
l13532:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l157:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u18071
	goto	u18070

u18071:
	goto	l13530
u18070:
	
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
	
l15000:; BSR set to: 5

	movlw	(0F0h)&0ffh
	andwf	((c:3986))^0f00h,c	;volatile
	line	74
	
l15002:; BSR set to: 5

	bcf	((c:3986))^0f00h,c,5	;volatile
	line	75
	
l15004:; BSR set to: 5

	bcf	((c:3986))^0f00h,c,6	;volatile
	line	76
	
l15006:; BSR set to: 5

	bcf	((c:3986))^0f00h,c,7	;volatile
	line	79
	
l15008:; BSR set to: 5

	bcf	((c:3977))^0f00h,c,6	;volatile
	line	80
	
l15010:; BSR set to: 5

	bcf	((c:3977))^0f00h,c,5	;volatile
	line	81
	
l15012:; BSR set to: 5

	bcf	((c:3977))^0f00h,c,7	;volatile
	line	82
	
l15014:; BSR set to: 5

	movlw	(0)&0ffh
	
	call	_lcd_write_nibble
	line	85
	
l15016:
	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u23567:
decfsz	wreg,f
	bra	u23567
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u23567
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u23567
	nop
asmopt pop

	line	88
	
l15018:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	89
	
l15020:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	90
	
l15022:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	91
	
l15024:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	92
	
l15026:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	93
	
l15028:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	94
	
l15030:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u23577:
decfsz	wreg,f
	bra	u23577
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u23577
asmopt pop

	line	96
	
l15032:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	97
	
l15034:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	98
	
l15036:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	99
	
l15038:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	100
	
l15040:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u23587:
decfsz	wreg,f
	bra	u23587
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u23587
	nop2
asmopt pop

	line	102
	
l15042:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	103
	
l15044:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	104
	
l15046:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	105
	
l15048:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	106
	
l15050:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u23597:
decfsz	wreg,f
	bra	u23597
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u23597
	nop2
asmopt pop

	line	109
	
l15052:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	110
	
l15054:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	111
	
l15056:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	112
	
l15058:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	113
	
l15060:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u23607:
decfsz	wreg,f
	bra	u23607
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u23607
	nop2
asmopt pop

	line	116
	
l15062:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	119
	
l15064:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	122
	
l15066:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	125
	
l15068:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	126
	
l1626:
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
	
l12276:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	21
	
l12278:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	22
	
l12280:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	23
	
l12282:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	24
	
l12284:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	25
	
l12286:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	26
	
l12288:
	asmopt push
asmopt off
	movlw	133
u23617:
decfsz	wreg,f
	bra	u23617
	nop
asmopt pop

	line	29
	
l12290:
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	30
	
l12292:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	31
	
l12294:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	32
	
l12296:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	33
	
l12298:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	34
	
l12300:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	37
	
l12302:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u15841
	goto	u15840

u15841:
	goto	l12306
u15840:
	
l12304:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u15851
	goto	u15850

u15851:
	goto	l12308
u15850:
	line	39
	
l12306:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u23627:
decfsz	wreg,f
	bra	u23627
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u23627
	nop2
asmopt pop

	line	40
	goto	l1620
	line	43
	
l12308:
	asmopt push
asmopt off
	movlw	133
u23637:
decfsz	wreg,f
	bra	u23637
	nop
asmopt pop

	line	45
	
l1620:
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
	
l12270:
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u15751
	goto	u15750
u15751:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u15768
u15750:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u15768:
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not ((1<<1)-1)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	11
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u15771
	goto	u15770
u15771:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u15788
u15770:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u15788:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<1)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	12
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u15791
	goto	u15790
u15791:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u15808
u15790:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u15808:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<2)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	13
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u15811
	goto	u15810
u15811:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u15828
u15810:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u15828:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<3)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	14
	
l1613:
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
	
l14868:
	bsf	((c:3988))^0f00h,c,3	;volatile
	line	20
	bsf	((c:3988))^0f00h,c,4	;volatile
	line	23
	
l14870:
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
	
l14872:
	asmopt push
asmopt off
	movlw	26
u23647:
decfsz	wreg,f
	bra	u23647
	nop2
asmopt pop

	line	34
	
l1668:
	return	;funcret
	callstack 0
GLOBAL	__end_of_i2c_init
	__end_of_i2c_init:
	signat	_i2c_init,89
	global	_handle_utility_numeric_rotation

;; *************** function _handle_utility_numeric_rotation *****************
;; Defined at:
;;		line 685 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  direction       1    wreg     char 
;; Auto vars:     Size  Location     Type
;;  direction       1   71[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/6
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
	line	685
global __ptext51
__ptext51:
psect	text51
	file	"src\menu.c"
	line	685
	
_handle_utility_numeric_rotation:
;incstack = 0
	callstack 25
	movwf	((c:handle_utility_numeric_rotation@direction))^00h,c
	line	689
	
l15126:
		movlw	3
	movlb	5	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u20061
	goto	u20060

u20061:
	goto	l679
u20060:
	line	691
	
l15128:; BSR set to: 5

		movf	((c:handle_utility_numeric_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u20071
	goto	u20070

u20071:
	goto	l15134
u20070:
	line	693
	
l15130:; BSR set to: 5

	movlw	0Ah
	movlb	7	; () banked
	addwf	(0+(_system_config+020h))&0ffh
	movlw	0
	addwfc	(1+(_system_config+020h))&0ffh
	line	694
		movf	(1+(_system_config+020h))&0ffh,w
	bnz	u20080
	movlw	251
	subwf	 (0+(_system_config+020h))&0ffh,w
	btfss	status,0
	goto	u20081
	goto	u20080

u20081:
	goto	l15140
u20080:
	line	695
	
l15132:; BSR set to: 7

	movlw	high(0)
	movwf	(1+(_system_config+020h))&0ffh
	movlw	low(0)
	movwf	(0+(_system_config+020h))&0ffh
	goto	l15140
	line	699
	
l15134:; BSR set to: 5

	movlb	7	; () banked
		movf	(1+(_system_config+020h))&0ffh,w
	bnz	u20091
	movlw	10
	subwf	 (0+(_system_config+020h))&0ffh,w
	btfsc	status,0
	goto	u20091
	goto	u20090

u20091:
	goto	l15138
u20090:
	line	700
	
l15136:; BSR set to: 7

	movlw	high(0FAh)
	movwf	(1+(_system_config+020h))&0ffh
	movlw	low(0FAh)
	movwf	(0+(_system_config+020h))&0ffh
	goto	l15140
	line	702
	
l15138:; BSR set to: 7

	movlw	0Ah
	subwf	(0+(_system_config+020h))&0ffh
	movlw	0
	subwfb	(1+(_system_config+020h))&0ffh
	line	706
	
l15140:; BSR set to: 7

	call	_rebuild_utility_menu	;wreg free
	line	708
	
l679:; BSR set to: 5

	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_utility_numeric_rotation
	__end_of_handle_utility_numeric_rotation:
	signat	_handle_utility_numeric_rotation,4217
	global	_rebuild_utility_menu

;; *************** function _rebuild_utility_menu *****************
;; Defined at:
;;		line 1691 in file "src\menu.c"
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
	line	1691
global __ptext52
__ptext52:
psect	text52
	file	"src\menu.c"
	line	1691
	
_rebuild_utility_menu:; BSR set to: 5

;incstack = 0
	callstack 25
	line	1696
	
l14212:
	movlw	low(0)
	movwf	((c:rebuild_utility_menu@i))^00h,c
	line	1698
	
l14218:
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
	line	1699
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
	line	1696
	
l14220:
	incf	((c:rebuild_utility_menu@i))^00h,c
	
l14222:
		movlw	09h-1
	cpfsgt	((c:rebuild_utility_menu@i))^00h,c
	goto	u19321
	goto	u19320

u19321:
	goto	l14218
u19320:
	line	1703
	
l14224:
		movlw	low(STR_274)
	movlb	6	; () banked
	movwf	(0+(_utility_menu+02h))&0ffh
	movlw	high(STR_274)
	movwf	(1+(_utility_menu+02h))&0ffh

	line	1704
		movlw	low(STR_275)
	movwf	(0+(_utility_menu+07h))&0ffh
	movlw	high(STR_275)
	movwf	(1+(_utility_menu+07h))&0ffh

	line	1705
		movlw	low(STR_276)
	movwf	(0+(_utility_menu+0Ch))&0ffh
	movlw	high(STR_276)
	movwf	(1+(_utility_menu+0Ch))&0ffh

	line	1706
		movlw	low(_value_log_entries)
	movwf	(0+(_utility_menu+011h))&0ffh
	movlw	high(_value_log_entries)
	movwf	(1+(_utility_menu+011h))&0ffh

	line	1707
		movlw	low(_value_menu_timeout)
	movwf	(0+(_utility_menu+016h))&0ffh
	movlw	high(_value_menu_timeout)
	movwf	(1+(_utility_menu+016h))&0ffh

	line	1708
		movlw	low(_value_contrast)
	movwf	(0+(_utility_menu+01Bh))&0ffh
	movlw	high(_value_contrast)
	movwf	(1+(_utility_menu+01Bh))&0ffh

	line	1709
		movlw	low(_value_brightness)
	movwf	(0+(_utility_menu+020h))&0ffh
	movlw	high(_value_brightness)
	movwf	(1+(_utility_menu+020h))&0ffh

	line	1710
		movlw	low(_value_pwr_fail)
	movwf	(0+(_utility_menu+025h))&0ffh
	movlw	high(_value_pwr_fail)
	movwf	(1+(_utility_menu+025h))&0ffh

	line	1711
		movlw	low(STR_277)
	movwf	(0+(_utility_menu+02Ah))&0ffh
	movlw	high(STR_277)
	movwf	(1+(_utility_menu+02Ah))&0ffh

	line	1714
	
l14226:; BSR set to: 6

		movlw	low(_value_log_entries)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_log_entries)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_278)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_278)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+020h),0+((c:?_sprintf)+04h)
	movff	1+(_system_config+020h),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1717
	
l14228:
		movlw	low(_value_menu_timeout)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_menu_timeout)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_279)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_279)
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
	line	1718
	
l14230:
		movlw	low(_value_contrast)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_contrast)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_280)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_280)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+010h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1719
	
l14232:
		movlw	low(_value_brightness)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_brightness)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_281)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_281)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1722
	
l14234:
	movff	0+(_system_config+012h),(c:___lwdiv@dividend)
	movff	1+(_system_config+012h),(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(c:_rebuild_utility_menu$3256)
	movff	1+?___lwdiv,(c:_rebuild_utility_menu$3256+1)
	
l14236:
	movff	0+(_system_config+012h),(c:___lwmod@dividend)
	movff	1+(_system_config+012h),(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movff	0+?___lwmod,(c:_rebuild_utility_menu$3257)
	movff	1+?___lwmod,(c:_rebuild_utility_menu$3257+1)
	
l14238:
		movlw	low(_value_pwr_fail)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_pwr_fail)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_282)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_282)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:_rebuild_utility_menu$3256),0+((c:?_sprintf)+04h)
	movff	(c:_rebuild_utility_menu$3256+1),1+((c:?_sprintf)+04h)
	movff	(c:_rebuild_utility_menu$3257),0+((c:?_sprintf)+06h)
	movff	(c:_rebuild_utility_menu$3257+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1724
	
l14240:
	movlw	low(09h)
	movlb	5	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	1725
	
l1108:; BSR set to: 5

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
;;		 -> rtc_read_time@debug_buf(80), rtc_set_time@buf(80), menu_handle_button@buf_1809(50), menu_handle_button@buf_1799(50), 
;;		 -> menu_handle_button@buf_1790(50), menu_handle_button@buf_1780(50), menu_handle_button@buf_1754(50), menu_handle_button@buf_1741(80), 
;;		 -> menu_handle_button@buf_1722(80), menu_handle_button@buf_1720(50), menu_handle_button@buf_1718(50), menu_handle_button@buf_1713(50), 
;;		 -> menu_handle_button@buf(50), menu_handle_encoder@buf_1686(50), menu_handle_encoder@buf_1683(50), menu_handle_encoder@buf(50), 
;;		 -> STR_277(1), value_pwr_fail(6), value_brightness(4), value_contrast(4), 
;;		 -> value_log_entries(6), STR_276(1), STR_275(1), STR_274(1), 
;;		 -> value_clock_display(10), value_end_runtime(10), value_clock_enable(10), rebuild_clock_menu@buf(50), 
;;		 -> menu_draw_input@title(10), menu_update_edit_value@value_buf(10), handle_numeric_rotation@buf(50), rebuild_input_menu@buf(50), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), menu_update_datetime_display@time_buf(9), 
;;		 -> menu_update_datetime_display@date_buf(9), init_datetime_editor@buf(80), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> value_menu_timeout(6), value_relay_pulse(10), handle_time_rotation@buf(50), init_time_editor@buf(60), 
;;		 -> NULL(0), main@buf_714(30), main@buf_675(40), main@buf_672(60), 
;;		 -> main@buf_667(50), main@time_buf(60), main@buf_633(30), main@buf_628(50), 
;;		 -> main@buf(50), trigger_relay_pulse@buf(60), 
;;  f               2   28[COMRAM] PTR const unsigned char 
;;		 -> STR_362(40), STR_361(50), STR_355(28), STR_348(46), 
;;		 -> STR_341(32), STR_340(38), STR_338(5), STR_337(6), 
;;		 -> STR_336(6), STR_335(5), STR_334(6), STR_333(6), 
;;		 -> STR_332(5), STR_331(5), STR_330(6), STR_329(6), 
;;		 -> STR_327(10), STR_326(26), STR_322(44), STR_320(45), 
;;		 -> STR_319(34), STR_318(32), STR_316(10), STR_315(26), 
;;		 -> STR_314(42), STR_313(32), STR_312(10), STR_311(10), 
;;		 -> STR_310(26), STR_309(28), STR_308(25), STR_307(20), 
;;		 -> STR_306(26), STR_305(35), STR_304(28), STR_303(37), 
;;		 -> STR_302(32), STR_301(23), STR_300(37), STR_282(10), 
;;		 -> STR_281(3), STR_280(3), STR_279(10), STR_278(3), 
;;		 -> STR_273(29), STR_272(46), STR_270(10), STR_264(3), 
;;		 -> STR_263(35), STR_239(9), STR_229(9), STR_228(7), 
;;		 -> STR_227(29), STR_225(48), STR_224(10), STR_222(10), 
;;		 -> STR_221(5), STR_220(6), STR_219(6), STR_203(10), 
;;		 -> STR_202(3), STR_201(6), STR_200(6), STR_187(10), 
;;		 -> STR_186(10), STR_185(5), STR_184(10), STR_183(5), 
;;		 -> STR_182(6), STR_181(6), STR_177(3), STR_163(15), 
;;		 -> STR_162(15), STR_161(13), STR_160(13), STR_159(13), 
;;		 -> STR_158(15), STR_157(15), STR_156(13), STR_155(13), 
;;		 -> STR_154(13), STR_152(47), STR_148(27), STR_147(51), 
;;		 -> STR_143(3), STR_142(3), STR_141(25), STR_140(45), 
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
;;		 -> STR_374(7), sprintf@c(1), ?_sprintf(2), STR_277(1), 
;;		 -> value_pwr_fail(6), value_brightness(4), value_contrast(4), value_log_entries(6), 
;;		 -> STR_276(1), STR_275(1), STR_274(1), value_clock_display(10), 
;;		 -> value_end_runtime(10), STR_266(9), STR_265(8), value_clock_enable(10), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), STR_179(9), STR_178(8), 
;;		 -> value_enable(10), value_menu_timeout(6), value_relay_pulse(10), menu_update_time_value@value_buf(6), 
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
	
l12446:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l12656
	line	555
	
l12448:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u16031
	goto	u16030

u16031:
	goto	l12454
u16030:
	line	558
	
l12450:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16047
	movff	(c:sprintf@c),tablat
	tblwt*
	bra	u16040
u16047:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:sprintf@c),indf0
u16040:
	
	
l12452:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l12656
	line	563
	
l12454:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	565
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	goto	l12464
	line	578
	
l12456:
	bsf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	579
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	580
	goto	l12464
	line	585
	
l12458:
	bsf	(0+(1/8)+(c:sprintf@flag))^00h,c,(1)&7
	line	586
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	587
	goto	l12464
	line	597
	
l12460:
	bsf	(0+(2/8)+(c:sprintf@flag))^00h,c,(2)&7
	line	598
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	568
	
l12464:
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
	goto	l12456
	xorlw	43^32	; case 43
	skipnz
	goto	l12458
	xorlw	48^43	; case 48
	skipnz
	goto	l12460
	goto	l1837

	line	603
	
l1837:
	line	606
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u16051
	goto	u16050
u16051:
	goto	l12468
u16050:
	line	607
	
l12466:
	bcf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	614
	
l12468:
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
	goto	u16061
	goto	u16060
u16061:
	goto	l12528
u16060:
	line	615
	
l12470:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	617
	
l12472:
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
	
l12474:
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

	
l12476:
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	619
	
l12478:
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
	goto	u16071
	goto	u16070
u16071:
	goto	l12472
u16070:
	goto	l12528
	line	747
	
l12480:
	bsf	(0+(7/8)+(c:sprintf@flag))^00h,c,(7)&7
	line	749
	goto	l12530
	line	760
	
l12482:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l12484:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l12486:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u16081
	goto	u16080

u16081:
	goto	l12490
u16080:
	line	767
	
l12488:
		movlw	low(STR_374)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_374)
	movwf	((c:sprintf@cp+1))^00h,c

	line	771
	
l12490:
	movlw	high(0)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@len))^00h,c
	line	772
	goto	l12494
	line	773
	
l12492:
	infsnz	((c:sprintf@len))^00h,c
	incf	((c:sprintf@len+1))^00h,c
	line	772
	
l12494:
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
	bra	u16097
	tblrd	*
	
	movf	tablat,w
	bra	u16090
u16097:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u16090:
	iorlw	0
	btfss	status,2
	goto	u16101
	goto	u16100
u16101:
	goto	l12492
u16100:
	line	783
	
l12496:
		movf	((c:sprintf@width))^00h,c,w
	subwf	((c:sprintf@len))^00h,c,w
	movf	((c:sprintf@width+1))^00h,c,w
	subwfb	((c:sprintf@len+1))^00h,c,w
	btfsc	status,0
	goto	u16111
	goto	u16110

u16111:
	goto	l12500
u16110:
	line	784
	
l12498:
	movf	((c:sprintf@len))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	subwfb	((c:sprintf@width+1))^00h,c

	goto	l12506
	line	786
	
l12500:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	goto	l12506
	line	791
	
l12502:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16127
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u16120
u16127:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u16120:
	
	
l12504:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	790
	
l12506:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
		incf	((c:sprintf@width))^00h,c,w
	bnz	u16131
	incf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u16131
	goto	u16130

u16131:
	goto	l12502
u16130:
	goto	l12514
	line	794
	
l12508:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
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
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movwf	(??_sprintf+0+0)^00h,c
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16157
	movff	??_sprintf+0+0,tablat
	tblwt*
	bra	u16150
u16157:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	??_sprintf+0+0,indf0
u16150:
	
	
l12510:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l12512:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	793
	
l12514:
	decf	((c:sprintf@len))^00h,c
	btfss	status,0
	decf	((c:sprintf@len+1))^00h,c
		incf	((c:sprintf@len))^00h,c,w
	bnz	u16161
	incf	((c:sprintf@len+1))^00h,c,w
	btfss	status,2
	goto	u16161
	goto	u16160

u16161:
	goto	l12508
u16160:
	goto	l12656
	line	825
	
l12516:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:sprintf@c))^00h,c
	
l12518:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	831
	
l12520:
		movlw	low(sprintf@c)
	movwf	((c:sprintf@cp))^00h,c
	clrf	((c:sprintf@cp+1))^00h,c

	line	832
	
l12522:
	movlw	high(01h)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(01h)
	movwf	((c:sprintf@len))^00h,c
	line	833
	goto	l12496
	line	844
	
l12524:
	movlw	(0C0h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	845
	goto	l12530
	line	661
	
l12528:
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
	goto	l12658
	xorlw	88^0	; case 88
	skipnz
	goto	l12480
	xorlw	99^88	; case 99
	skipnz
	goto	l12516
	xorlw	100^99	; case 100
	skipnz
	goto	l12530
	xorlw	105^100	; case 105
	skipnz
	goto	l12530
	xorlw	115^105	; case 115
	skipnz
	goto	l12482
	xorlw	117^115	; case 117
	skipnz
	goto	l12524
	xorlw	120^117	; case 120
	skipnz
	goto	l12480
	goto	l12520

	line	1277
	
l12530:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	0C0h
	andwf	(??_sprintf+0+0)^00h,c
	btfss	status,2
	goto	u16171
	goto	u16170
u16171:
	goto	l12542
u16170:
	line	1285
	
l12532:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l12534:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l12536:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u16180
	goto	u16181

u16181:
	goto	l12576
u16180:
	line	1288
	
l12538:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l12540:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	goto	l12576
	line	1312
	
l12542:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l12544:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	goto	l12576
	line	1331
	
l12546:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l12548:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u16191
	goto	u16190

u16191:
	goto	l12552
u16190:
	goto	l12578
	line	1332
	
l12552:
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
	goto	u16201
	goto	u16200

u16201:
	goto	l12556
u16200:
	goto	l12578
	line	1331
	
l12556:
	incf	((c:sprintf@c))^00h,c
	goto	l12548
	line	1342
	
l12560:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l12562:
		movlw	4
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u16211
	goto	u16210

u16211:
	goto	l12566
u16210:
	goto	l12578
	line	1343
	
l12566:
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
	goto	u16221
	goto	u16220

u16221:
	goto	l12570
u16220:
	goto	l12578
	line	1342
	
l12570:
	incf	((c:sprintf@c))^00h,c
	goto	l12562
	line	1320
	
l12576:
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
	goto	l12546
	xorlw	128^0	; case 128
	skipnz
	goto	l12560
	xorlw	192^128	; case 192
	skipnz
	goto	l12546
	goto	l12578

	line	1371
	
l12578:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u16231
	goto	u16230

u16231:
	goto	l12584
u16230:
	
l12580:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u16241
	goto	u16240
u16241:
	goto	l12584
u16240:
	line	1372
	
l12582:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	line	1407
	
l12584:
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
	goto	u16251
	goto	u16250

u16251:
	goto	l12588
u16250:
	line	1408
	
l12586:
	movf	((c:sprintf@c))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movlw	0
	subwfb	((c:sprintf@width+1))^00h,c
	goto	l12590
	line	1410
	
l12588:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	1413
	
l12590:
	
	btfss	((c:sprintf@flag))^00h,c,(2)&7
	goto	u16261
	goto	u16260
u16261:
	goto	l12616
u16260:
	line	1415
	
l12592:
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u16271
	goto	u16270
u16271:
	goto	l1885
u16270:
	line	1416
	
l12594:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u16281
	goto	u16280
u16281:
	goto	l12598
u16280:
	
l12596:
	movlw	high(02Bh)
	movwf	((c:_sprintf$2540+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$2540))^00h,c
	goto	l12600
	
l12598:
	movlw	high(02Dh)
	movwf	((c:_sprintf$2540+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$2540))^00h,c
	
l12600:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16297
	movff	(c:_sprintf$2540),tablat
	tblwt*
	bra	u16290
u16297:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:_sprintf$2540),indf0
u16290:
	
	
l12602:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l12608
	line	1422
	
l1885:
	line	1425
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u16301
	goto	u16300
u16301:
	goto	l12608
u16300:
	line	1426
	
l12604:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16317
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u16310
u16317:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u16310:
	
	goto	l12602
	line	1441
	
l12608:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u16321
	goto	u16320

u16321:
	goto	l12638
u16320:
	line	1443
	
l12610:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16337
	movlw	030h
	movwf	tablat
	tblwt*
	bra	u16330
u16337:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	030h
	movwf	indf0
u16330:
	
	
l12612:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1444
	
l12614:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u16341
	goto	u16340

u16341:
	goto	l12610
u16340:
	goto	l12638
	line	1454
	
l12616:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u16351
	goto	u16350

u16351:
	goto	l1896
u16350:
	line	1456
	
l12618:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16367
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u16360
u16367:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u16360:
	
	
l12620:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1457
	
l12622:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u16371
	goto	u16370

u16371:
	goto	l12618
u16370:
	
l1896:
	line	1460
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u16381
	goto	u16380
u16381:
	goto	l1899
u16380:
	line	1461
	
l12624:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u16391
	goto	u16390
u16391:
	goto	l12628
u16390:
	
l12626:
	movlw	high(02Bh)
	movwf	((c:_sprintf$2541+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$2541))^00h,c
	goto	l12630
	
l12628:
	movlw	high(02Dh)
	movwf	((c:_sprintf$2541+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$2541))^00h,c
	
l12630:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16407
	movff	(c:_sprintf$2541),tablat
	tblwt*
	bra	u16400
u16407:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:_sprintf$2541),indf0
u16400:
	
	
l12632:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l12638
	line	1469
	
l1899:
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u16411
	goto	u16410
u16411:
	goto	l12638
u16410:
	line	1470
	
l12634:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16427
	movlw	020h
	movwf	tablat
	tblwt*
	bra	u16420
u16427:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	020h
	movwf	indf0
u16420:
	
	goto	l12632
	line	1498
	
l12638:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l12654
	line	1515
	
l12640:
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
	goto	l12650
	line	1526
	
l12642:
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
	
l12644:
	movlw	low((STR_375))
	addwf	((c:sprintf@idx))^00h,c,w
	movwf	tblptrl
	clrf	tblptrh
	movlw	high((STR_375))
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
	goto	l12650
	line	1502
	
l12648:
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
	goto	l12640
	xorlw	128^0	; case 128
	skipnz
	goto	l12642
	xorlw	192^128	; case 192
	skipnz
	goto	l12640
	goto	l12650

	line	1550
	
l12650:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16437
	movff	(c:sprintf@c),tablat
	tblwt*
	bra	u16430
u16437:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movff	(c:sprintf@c),indf0
u16430:
	
	
l12652:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l12654:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u16441
	goto	u16440

u16441:
	goto	l12648
u16440:
	line	553
	
l12656:
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
	goto	u16451
	goto	u16450
u16451:
	goto	l12448
u16450:
	line	1564
	
l12658:
	movff	(c:sprintf@sp),tblptrl
	movff	(c:sprintf@sp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u16467
	movlw	0
	movwf	tablat
	tblwt*
	bra	u16460
u16467:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movlw	0
	movwf	indf0
u16460:
	
	line	1567
	
l1915:
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
	
l12384:
	movlw	low(0)
	movwf	((c:_isdigit$2983))^00h,c
	
l12386:
		movlw	03Ah-0
	cpfslt	((c:isdigit@c))^00h,c
	goto	u15951
	goto	u15950

u15951:
	goto	l12392
u15950:
	
l12388:
		movlw	030h-1
	cpfsgt	((c:isdigit@c))^00h,c
	goto	u15961
	goto	u15960

u15961:
	goto	l12392
u15960:
	
l12390:
	movlw	low(01h)
	movwf	((c:_isdigit$2983))^00h,c
	
l12392:
	movff	(c:_isdigit$2983),??_isdigit+0+0
	rrcf	(??_isdigit+0+0)^00h,c,w
	line	15
	
l2582:
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
	
l12396:
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
	
l12398:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	line	53
	
l1918:
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
	
l12424:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u16001
	goto	u16000

u16001:
	goto	l2407
u16000:
	line	13
	
l12426:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l12430
	line	15
	
l12428:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l12430:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u16011
	goto	u16010
u16011:
	goto	l12428
u16010:
	line	19
	
l12432:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u16021
	goto	u16020

u16021:
	goto	l12436
u16020:
	line	20
	
l12434:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l12436:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l12438:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l12432
	line	23
	
l2407:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l2414:
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
	
l12402:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l12404:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u15971
	goto	u15970

u15971:
	goto	l2397
u15970:
	line	15
	
l12406:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l12410
	line	17
	
l12408:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l12410:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u15981
	goto	u15980
u15981:
	goto	l12408
u15980:
	line	21
	
l12412:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l12414:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u15991
	goto	u15990

u15991:
	goto	l12420
u15990:
	line	23
	
l12416:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l12418:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l12420:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l12422:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l12412
	line	28
	
l2397:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l2404:
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
	
l12794:
	movlw	low(08h)
	movwf	((c:___lbmod@counter))^00h,c
	line	10
	movlw	low(0)
	movwf	((c:___lbmod@rem))^00h,c
	line	12
	
l12796:
	bcf	status,0
	rlcf	((c:___lbmod@dividend))^00h,c,w
	rlcf	((c:___lbmod@rem))^00h,c,w
	movwf	((c:___lbmod@rem))^00h,c
	line	13
	
l12798:
	bcf status,0
	rlcf	((c:___lbmod@dividend))^00h,c

	line	14
	
l12800:
		movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c,w
	btfss	status,0
	goto	u16721
	goto	u16720

u16721:
	goto	l12804
u16720:
	line	15
	
l12802:
	movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c
	line	16
	
l12804:
	decfsz	((c:___lbmod@counter))^00h,c
	
	goto	l12796
	line	17
	
l12806:
	movf	((c:___lbmod@rem))^00h,c,w
	line	18
	
l2318:
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
	
l12768:
	movlw	low(0)
	movwf	((c:___lbdiv@quotient))^00h,c
	line	10
	
l12770:
	movf	((c:___lbdiv@divisor))^00h,c,w
	btfsc	status,2
	goto	u16691
	goto	u16690
u16691:
	goto	l12790
u16690:
	line	11
	
l12772:
	movlw	low(01h)
	movwf	((c:___lbdiv@counter))^00h,c
	line	12
	goto	l12778
	line	13
	
l12774:
	bcf status,0
	rlcf	((c:___lbdiv@divisor))^00h,c

	line	14
	
l12776:
	incf	((c:___lbdiv@counter))^00h,c
	line	12
	
l12778:
	
	btfss	((c:___lbdiv@divisor))^00h,c,(7)&7
	goto	u16701
	goto	u16700
u16701:
	goto	l12774
u16700:
	line	17
	
l12780:
	bcf status,0
	rlcf	((c:___lbdiv@quotient))^00h,c

	line	18
		movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c,w
	btfss	status,0
	goto	u16711
	goto	u16710

u16711:
	goto	l12786
u16710:
	line	19
	
l12782:
	movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c
	line	20
	
l12784:
	bsf	(0+(0/8)+(c:___lbdiv@quotient))^00h,c,(0)&7
	line	22
	
l12786:
	bcf status,0
	rrcf	((c:___lbdiv@divisor))^00h,c

	line	23
	
l12788:
	decfsz	((c:___lbdiv@counter))^00h,c
	
	goto	l12780
	line	25
	
l12790:
	movf	((c:___lbdiv@quotient))^00h,c,w
	line	26
	
l2312:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
	signat	___lbdiv,8313
	global	_handle_datetime_rotation

;; *************** function _handle_datetime_rotation *****************
;; Defined at:
;;		line 749 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  direction       1    wreg     char 
;; Auto vars:     Size  Location     Type
;;  direction       1   14[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3F/6
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
	line	749
global __ptext60
__ptext60:
psect	text60
	file	"src\menu.c"
	line	749
	
_handle_datetime_rotation:
;incstack = 0
	callstack 28
	movwf	((c:handle_datetime_rotation@direction))^00h,c
	line	751
	
l15142:
	movlb	5	; () banked
	movf	(0+(_menu+01Ch))&0ffh,w
	btfss	status,2
	goto	u20101
	goto	u20100
u20101:
	goto	l15192
u20100:
	line	753
	
l15144:; BSR set to: 5

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u20111
	goto	u20110
u20111:
	goto	l15160
u20110:
	line	755
	
l15146:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u20121
	goto	u20120

u20121:
	goto	l15154
u20120:
	line	757
	
l15148:; BSR set to: 5

	incf	(0+(_menu+016h))&0ffh
	line	758
	
l15150:; BSR set to: 5

		movlw	020h-1
	cpfsgt	(0+(_menu+016h))&0ffh
	goto	u20131
	goto	u20130

u20131:
	goto	l694
u20130:
	line	759
	
l15152:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+016h))&0ffh
	goto	l729
	line	763
	
l15154:; BSR set to: 5

		movlw	02h-0
	cpfslt	(0+(_menu+016h))&0ffh
	goto	u20141
	goto	u20140

u20141:
	goto	l15158
u20140:
	line	764
	
l15156:; BSR set to: 5

	movlw	low(01Fh)
	movwf	(0+(_menu+016h))&0ffh
	goto	l729
	line	766
	
l15158:; BSR set to: 5

	decf	(0+(_menu+016h))&0ffh
	goto	l729
	line	769
	
l15160:; BSR set to: 5

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u20151
	goto	u20150

u20151:
	goto	l15176
u20150:
	line	771
	
l15162:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u20161
	goto	u20160

u20161:
	goto	l15170
u20160:
	line	773
	
l15164:; BSR set to: 5

	incf	(0+(_menu+017h))&0ffh
	line	774
	
l15166:; BSR set to: 5

		movlw	0Dh-1
	cpfsgt	(0+(_menu+017h))&0ffh
	goto	u20171
	goto	u20170

u20171:
	goto	l729
u20170:
	line	775
	
l15168:; BSR set to: 5

	movlw	low(01h)
	movwf	(0+(_menu+017h))&0ffh
	goto	l729
	line	779
	
l15170:; BSR set to: 5

		movlw	02h-0
	cpfslt	(0+(_menu+017h))&0ffh
	goto	u20181
	goto	u20180

u20181:
	goto	l15174
u20180:
	line	780
	
l15172:; BSR set to: 5

	movlw	low(0Ch)
	movwf	(0+(_menu+017h))&0ffh
	goto	l729
	line	782
	
l15174:; BSR set to: 5

	decf	(0+(_menu+017h))&0ffh
	goto	l729
	line	785
	
l15176:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u20191
	goto	u20190

u20191:
	goto	l694
u20190:
	line	787
	
l15178:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u20201
	goto	u20200

u20201:
	goto	l15186
u20200:
	line	789
	
l15180:; BSR set to: 5

	incf	(0+(_menu+018h))&0ffh
	line	790
	
l15182:; BSR set to: 5

		movlw	064h-1
	cpfsgt	(0+(_menu+018h))&0ffh
	goto	u20211
	goto	u20210

u20211:
	goto	l694
u20210:
	line	791
	
l15184:; BSR set to: 5

	movlw	low(019h)
	movwf	(0+(_menu+018h))&0ffh
	goto	l729
	line	795
	
l15186:; BSR set to: 5

		movlw	01Ah-0
	cpfslt	(0+(_menu+018h))&0ffh
	goto	u20221
	goto	u20220

u20221:
	goto	l15190
u20220:
	line	796
	
l15188:; BSR set to: 5

	movlw	low(063h)
	movwf	(0+(_menu+018h))&0ffh
	goto	l729
	line	798
	
l15190:; BSR set to: 5

	decf	(0+(_menu+018h))&0ffh
	goto	l729
	line	801
	
l694:; BSR set to: 5

	goto	l729
	line	804
	
l15192:; BSR set to: 5

	movf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u20231
	goto	u20230
u20231:
	goto	l15208
u20230:
	line	806
	
l15194:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u20241
	goto	u20240

u20241:
	goto	l15202
u20240:
	line	808
	
l15196:; BSR set to: 5

	incf	(0+(_menu+019h))&0ffh
	line	809
	
l15198:; BSR set to: 5

		movlw	018h-1
	cpfsgt	(0+(_menu+019h))&0ffh
	goto	u20251
	goto	u20250

u20251:
	goto	l729
u20250:
	line	810
	
l15200:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+019h))&0ffh
	goto	l729
	line	814
	
l15202:; BSR set to: 5

	movf	(0+(_menu+019h))&0ffh,w
	btfss	status,2
	goto	u20261
	goto	u20260
u20261:
	goto	l15206
u20260:
	line	815
	
l15204:; BSR set to: 5

	movlw	low(017h)
	movwf	(0+(_menu+019h))&0ffh
	goto	l729
	line	817
	
l15206:; BSR set to: 5

	decf	(0+(_menu+019h))&0ffh
	goto	l729
	line	820
	
l15208:; BSR set to: 5

		decf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u20271
	goto	u20270

u20271:
	goto	l15224
u20270:
	line	822
	
l15210:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u20281
	goto	u20280

u20281:
	goto	l15218
u20280:
	line	824
	
l15212:; BSR set to: 5

	incf	(0+(_menu+01Ah))&0ffh
	line	825
	
l15214:; BSR set to: 5

		movlw	03Ch-1
	cpfsgt	(0+(_menu+01Ah))&0ffh
	goto	u20291
	goto	u20290

u20291:
	goto	l729
u20290:
	line	826
	
l15216:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Ah))&0ffh
	goto	l729
	line	830
	
l15218:; BSR set to: 5

	movf	(0+(_menu+01Ah))&0ffh,w
	btfss	status,2
	goto	u20301
	goto	u20300
u20301:
	goto	l15222
u20300:
	line	831
	
l15220:; BSR set to: 5

	movlw	low(03Bh)
	movwf	(0+(_menu+01Ah))&0ffh
	goto	l729
	line	833
	
l15222:; BSR set to: 5

	decf	(0+(_menu+01Ah))&0ffh
	goto	l729
	line	836
	
l15224:; BSR set to: 5

		movlw	2
	xorwf	(0+(_menu+01Dh))&0ffh,w
	btfss	status,2
	goto	u20311
	goto	u20310

u20311:
	goto	l729
u20310:
	line	838
	
l15226:; BSR set to: 5

		movf	((c:handle_datetime_rotation@direction))^00h,c,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u20321
	goto	u20320

u20321:
	goto	l15234
u20320:
	line	840
	
l15228:; BSR set to: 5

	incf	(0+(_menu+01Bh))&0ffh
	line	841
	
l15230:; BSR set to: 5

		movlw	03Ch-1
	cpfsgt	(0+(_menu+01Bh))&0ffh
	goto	u20331
	goto	u20330

u20331:
	goto	l729
u20330:
	line	842
	
l15232:; BSR set to: 5

	movlw	low(0)
	movwf	(0+(_menu+01Bh))&0ffh
	goto	l729
	line	846
	
l15234:; BSR set to: 5

	movf	(0+(_menu+01Bh))&0ffh,w
	btfss	status,2
	goto	u20341
	goto	u20340
u20341:
	goto	l15238
u20340:
	line	847
	
l15236:; BSR set to: 5

	movlw	low(03Bh)
	movwf	(0+(_menu+01Bh))&0ffh
	goto	l729
	line	849
	
l15238:; BSR set to: 5

	decf	(0+(_menu+01Bh))&0ffh
	line	853
	
l729:; BSR set to: 5

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
	
l14852:; BSR set to: 5

		movlw	05h-0
	movlb	7	; () banked
	cpfslt	(0+(_system_config+01h))&0ffh
	goto	u19921
	goto	u19920

u19921:
	goto	l14858
u19920:
	line	265
	
l14854:; BSR set to: 7

	movlw	(01Eh)&0ffh
	goto	l1601
	line	267
	
l14858:; BSR set to: 7

		movlw	079h-1
	cpfsgt	(0+(_system_config+01h))&0ffh
	goto	u19931
	goto	u19930

u19931:
	goto	l14864
u19930:
	goto	l14854
	line	271
	
l14864:; BSR set to: 7

	movf	(0+(_system_config+01h))&0ffh,w
	line	272
	
l1601:; BSR set to: 7

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
	
l14988:
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
	movlb	0	; () banked
	movwf	((_button_pressed))&0ffh	;volatile
	line	214
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	215
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	216
	movlw	low(0)
	movwf	((c:_relay_ms_counter))^00h,c
	line	219
	
l14990:; BSR set to: 5

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	220
	
l14992:; BSR set to: 5

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	221
	
l14994:; BSR set to: 5

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	224
	
l14996:; BSR set to: 5

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u20041
	goto	u20040
u20041:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u20048
u20040:
	clrf	(??_encoder_init+0+0)^00h,c
u20048:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u20051
	goto	u20050
u20051:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u20058
u20050:
	clrf	(??_encoder_init+1+0)^00h,c
u20058:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:_enc_state))^00h,c
	line	225
	
l358:
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
	
l14818:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	185
	
l14820:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	189
	
l14826:
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
	
l14828:
	incf	((c:eeprom_init@i))^00h,c
	
l14830:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u19881
	goto	u19880

u19881:
	goto	l14826
u19880:
	line	191
	
l14832:
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
	
l14834:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	195
	
l14836:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u19890
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u19891
	goto	u19890

u19891:
	goto	l14842
u19890:
	line	198
	
l14838:
	call	_load_factory_defaults	;wreg free
	line	199
	
l14840:
	call	_save_current_config	;wreg free
	line	203
	
l14842:
	call	_sync_menu_variables	;wreg free
	line	207
	
l14844:
	movlb	7	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	mullw	02h
	movff	prodl,(_menu_timeout_seconds)
	movff	prodh,(_menu_timeout_seconds+1)
	line	210
	
l14846:; BSR set to: 7

	movlb	5	; () banked
		movf	((_menu_timeout_seconds+1))&0ffh,w
	bnz	u19900
	movlw	10
	subwf	 ((_menu_timeout_seconds))&0ffh,w
	btfss	status,0
	goto	u19901
	goto	u19900

u19901:
	goto	l14850
u19900:
	
l14848:; BSR set to: 5

		incf	((_menu_timeout_seconds))&0ffh,w
	movlw	1
	subwfb	((_menu_timeout_seconds+1))&0ffh,w
	btfss	status,0
	goto	u19911
	goto	u19910

u19911:
	goto	l1579
u19910:
	line	212
	
l14850:; BSR set to: 5

	movlw	high(01Eh)
	movwf	((_menu_timeout_seconds+1))&0ffh
	movlw	low(01Eh)
	movwf	((_menu_timeout_seconds))&0ffh
	line	214
	
l1579:; BSR set to: 5

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
	
l14738:
	movff	_input_config,(c:_enable_edit_flag)
	line	257
	movff	0+(_input_config+01h),(c:_sensor_edit_flag)
	line	258
	
l1597:
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
	
l14180:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	223
	
l14186:
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
	
l14188:
	incf	((c:save_current_config@i))^00h,c
	
l14190:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u19301
	goto	u19300

u19301:
	goto	l14186
u19300:
	line	227
	
l14192:
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
	
l14194:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	231
	
l14196:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	232
	
l1584:
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
	
l13488:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	158
	
l13490:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	159
	
l1558:
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
	
l13492:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	164
	
l13494:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l13500
	line	166
	
l13496:
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
	
l13498:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l13500:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u18041
	goto	u18040

u18041:
	goto	l13496
u18040:
	line	168
	
l1564:
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
	
l12686:
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
	
l12688:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	139
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	140
	
l12690:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	143
	
l1549:
	line	142
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u16521
	goto	u16520
u16521:
	goto	l1549
u16520:
	
l1551:
	line	144
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	145
	
l1552:
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
	
l13444:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	98
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	100
	
l13450:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	101
	
l13452:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	103
	
l13458:
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
	
l13460:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l13462:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u18010
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u18011
	goto	u18010

u18011:
	goto	l13458
u18010:
	line	98
	
l13464:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l13466:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u18021
	goto	u18020

u18021:
	goto	l13450
u18020:
	line	108
	
l13468:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	109
	
l13470:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1960+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1960))^00h,c
	line	111
	
l13476:
	movf	((c:calculate_config_checksum@j_1960))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j_1960+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	109
	
l13478:
	infsnz	((c:calculate_config_checksum@j_1960))^00h,c
	incf	((c:calculate_config_checksum@j_1960+1))^00h,c
	
l13480:
		movf	((c:calculate_config_checksum@j_1960+1))^00h,c,w
	bnz	u18030
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1960))^00h,c,w
	btfss	status,0
	goto	u18031
	goto	u18030

u18031:
	goto	l13476
u18030:
	
l1542:
	line	114
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	115
	
l1543:
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
	
l14736:
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
	
l1590:
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
	
l13420:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l13430
	line	37
	
l13422:
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
	
l13424:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l13426:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l13428:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l13430:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u17961
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u17961
	goto	u17960

u17961:
	goto	l13422
u17960:
	line	41
	
l2588:
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
	
l14720:
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
	
l14722:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	153
	
l1555:
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
	
l14726:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	173
	
l14728:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l14734
	line	175
	
l14730:
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
	
l14732:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l14734:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u19791
	goto	u19790

u19791:
	goto	l14730
u19790:
	line	177
	
l1570:
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
	
l13482:
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
	
l13484:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	126
	
l1546:
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
	
l15070:
	goto	l15082
	line	73
	
l15072:
	movlw	low(018h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	74
	goto	l15084
	line	76
	
l15074:
	movlw	low(028h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	77
	goto	l15084
	line	79
	
l15076:
	movlw	low(048h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	80
	goto	l15084
	line	82
	
l15078:
	movlw	low(088h)
	movwf	((c:ad7994_read_channel@config_byte))^00h,c
	line	83
	goto	l15084
	line	84
	
l1813:
	line	86
	setf	((c:?_ad7994_read_channel))^00h,c
	setf	((c:?_ad7994_read_channel+1))^00h,c
	goto	l1814
	line	70
	
l15082:
	movf	((c:ad7994_read_channel@channel))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 1 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l15072
	xorlw	2^1	; case 2
	skipnz
	goto	l15074
	xorlw	3^2	; case 3
	skipnz
	goto	l15076
	xorlw	4^3	; case 4
	skipnz
	goto	l15078
	goto	l1813

	line	89
	
l15084:
	call	_i2c_start	;wreg free
	line	90
	
l15086:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	line	91
	
l15088:
	movlw	(02h)&0ffh
	
	call	_i2c_write
	line	92
	
l15090:
	movf	((c:ad7994_read_channel@config_byte))^00h,c,w
	
	call	_i2c_write
	line	93
	
l15092:
	call	_i2c_stop	;wreg free
	line	95
	
l15094:
	bsf	((c:3979))^0f00h,c,5	;volatile
	line	96
	
l15096:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	97
	
l15098:
	bcf	((c:3979))^0f00h,c,5	;volatile
	line	98
	
l15100:
	asmopt push
asmopt off
	movlw	5
u23657:
decfsz	wreg,f
	bra	u23657
	nop
asmopt pop

	line	100
	
l15102:
	call	_i2c_start	;wreg free
	line	101
	
l15104:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	line	102
	
l15106:
	movlw	(0)&0ffh
	
	call	_i2c_write
	line	103
	
l15108:
	call	_i2c_stop	;wreg free
	line	105
	
l15110:
	call	_i2c_start	;wreg free
	line	106
	
l15112:
	movlw	(045h)&0ffh
	
	call	_i2c_write
	line	107
	
l15114:
	movlw	(01h)&0ffh
	
	call	_i2c_read
	movwf	((c:ad7994_read_channel@msb))^00h,c
	line	108
	
l15116:
	movlw	(0)&0ffh
	
	call	_i2c_read
	movwf	((c:ad7994_read_channel@lsb))^00h,c
	line	109
	
l15118:
	call	_i2c_stop	;wreg free
	line	111
	movf	((c:ad7994_read_channel@msb))^00h,c,w
	movwf	(??_ad7994_read_channel+0+0)^00h,c
	movf	((c:ad7994_read_channel@lsb))^00h,c,w
	movwf	((c:ad7994_read_channel@result))^00h,c
	movff	??_ad7994_read_channel+0+0,((c:ad7994_read_channel@result+1))
	line	116
	
l15120:
	movlw	low(0FFFh)
	andwf	((c:ad7994_read_channel@result))^00h,c
	movlw	high(0FFFh)
	andwf	((c:ad7994_read_channel@result+1))^00h,c
	line	121
	
l15122:
	movff	(c:ad7994_read_channel@result),(c:?_ad7994_read_channel)
	movff	(c:ad7994_read_channel@result+1),(c:?_ad7994_read_channel+1)
	line	122
	
l1814:
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
	
l12730:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16611
	goto	u16610
u16611:
	goto	l1709
u16610:
	line	147
	
l12732:
	movlw	(0FFh)&0ffh
	goto	l1710
	
l1709:
	line	149
	bsf	((c:4037))^0f00h,c,3	;volatile
	line	152
	
l12736:
	movlw	high(03E8h)
	movwf	((c:i2c_read@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_read@timeout))^00h,c
	line	153
	goto	l1711
	line	155
	
l12738:
	decf	((c:i2c_read@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_read@timeout+1))^00h,c
	movf	((c:i2c_read@timeout))^00h,c,w
iorwf	((c:i2c_read@timeout+1))^00h,c,w
	btfss	status,2
	goto	u16621
	goto	u16620

u16621:
	goto	l1711
u16620:
	goto	l12732
	line	157
	
l1711:
	line	153
	btfss	((c:4039))^0f00h,c,0	;volatile
	goto	u16631
	goto	u16630
u16631:
	goto	l12738
u16630:
	
l1714:
	line	159
	movff	(c:4041),(c:i2c_read@data)	;volatile
	line	161
	
l12744:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16641
	goto	u16640
u16641:
	goto	l12750
u16640:
	line	162
	
l12746:
	movf	((c:i2c_read@data))^00h,c,w
	goto	l1710
	line	165
	
l12750:
	movf	((c:i2c_read@ack))^00h,c,w
	btfsc	status,2
	goto	u16651
	goto	u16650
u16651:
	clrf	(??_i2c_read+0+0)^00h,c
	incf	(??_i2c_read+0+0)^00h,c
	goto	u16668
u16650:
	clrf	(??_i2c_read+0+0)^00h,c
u16668:
	swapf	(??_i2c_read+0+0)^00h,c
	rlncf	(??_i2c_read+0+0)^00h,c
	movf	((c:4037))^0f00h,c,w	;volatile
	xorwf	(??_i2c_read+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<5)
	xorwf	(??_i2c_read+0+0)^00h,c,w
	movwf	((c:4037))^0f00h,c	;volatile
	line	166
	
l12752:
	bsf	((c:4037))^0f00h,c,4	;volatile
	line	169
	
l12754:
	movlw	high(03E8h)
	movwf	((c:i2c_read@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_read@timeout))^00h,c
	line	170
	goto	l1716
	line	172
	
l12756:
	decf	((c:i2c_read@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_read@timeout+1))^00h,c
	movf	((c:i2c_read@timeout))^00h,c,w
iorwf	((c:i2c_read@timeout+1))^00h,c,w
	btfss	status,2
	goto	u16671
	goto	u16670

u16671:
	goto	l1716
u16670:
	goto	l12746
	line	174
	
l1716:
	line	170
	btfsc	((c:4037))^0f00h,c,4	;volatile
	goto	u16681
	goto	u16680
u16681:
	goto	l12756
u16680:
	goto	l12746
	line	177
	
l1710:
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
	
l14924:
		movlw	low(STR_363)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_363)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	18
	
l14926:
	bcf	((c:3988))^0f00h,c,5	;volatile
	line	19
	
l14928:
	bcf	((c:3979))^0f00h,c,5	;volatile
	line	20
	
l14930:
	asmopt push
asmopt off
movlw	104
movwf	(??_ad7994_init+0+0)^00h,c
	movlw	228
u23667:
decfsz	wreg,f
	bra	u23667
	decfsz	(??_ad7994_init+0+0)^00h,c,f
	bra	u23667
	nop2
asmopt pop

	line	21
	
l14932:
		movlw	low(STR_364)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_364)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	23
	
l14934:
		movlw	low(STR_365)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_365)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	25
	
l14936:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u20001
	goto	u20000
u20001:
	goto	l14944
u20000:
	line	27
	
l14938:
		movlw	low(STR_366)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_366)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	28
	
l14940:
	movlw	(01h)&0ffh
	goto	l1801
	line	31
	
l14944:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u20011
	goto	u20010
u20011:
	goto	l14954
u20010:
	line	33
	
l14946:
		movlw	low(STR_367)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_367)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	34
	
l14948:
	call	_i2c_stop	;wreg free
	line	35
	
l14950:
	movlw	(02h)&0ffh
	goto	l1801
	line	37
	
l14954:
		movlw	low(STR_368)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_368)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	39
	
l14956:
	movlw	(02h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u20021
	goto	u20020
u20021:
	goto	l14966
u20020:
	line	41
	
l14958:
		movlw	low(STR_369)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_369)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	42
	
l14960:
	call	_i2c_stop	;wreg free
	line	43
	
l14962:
	movlw	(03h)&0ffh
	goto	l1801
	line	45
	
l14966:
		movlw	low(STR_370)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_370)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	47
	
l14968:
	movlw	(08h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u20031
	goto	u20030
u20031:
	goto	l14978
u20030:
	line	49
	
l14970:
		movlw	low(STR_371)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_371)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	50
	
l14972:
	call	_i2c_stop	;wreg free
	line	51
	
l14974:
	movlw	(04h)&0ffh
	goto	l1801
	line	53
	
l14978:
		movlw	low(STR_372)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_372)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	55
	
l14980:
	call	_i2c_stop	;wreg free
	line	56
	
l14982:
		movlw	low(STR_373)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_373)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	57
	
l14984:
	movlw	(0)&0ffh
	line	58
	
l1801:
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
;;		 -> STR_373(29), STR_372(38), STR_371(43), STR_370(38), 
;;		 -> STR_369(49), STR_368(31), STR_367(39), STR_366(31), 
;;		 -> STR_365(37), STR_364(28), STR_363(22), rtc_read_time@debug_buf(80), 
;;		 -> rtc_set_time@buf(80), STR_360(32), STR_359(28), STR_358(30), 
;;		 -> STR_357(28), STR_356(29), menu_handle_button@buf_1809(50), STR_354(21), 
;;		 -> STR_353(20), STR_352(26), STR_351(25), STR_350(37), 
;;		 -> STR_349(37), menu_handle_button@buf_1799(50), STR_347(20), STR_342(25), 
;;		 -> menu_handle_button@buf_1790(50), menu_handle_button@buf_1780(50), STR_339(53), STR_328(27), 
;;		 -> menu_handle_button@buf_1754(50), STR_325(24), STR_324(27), STR_323(16), 
;;		 -> menu_handle_button@buf_1741(80), STR_321(36), menu_handle_button@buf_1722(80), menu_handle_button@buf_1720(50), 
;;		 -> menu_handle_button@buf_1718(50), STR_317(31), menu_handle_button@buf_1713(50), menu_handle_button@buf(50), 
;;		 -> menu_handle_encoder@buf_1686(50), menu_handle_encoder@buf_1683(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), 
;;		 -> handle_numeric_rotation@buf(50), STR_226(31), rebuild_input_menu@buf(50), STR_153(26), 
;;		 -> init_datetime_editor@buf(80), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), handle_time_rotation@buf(50), 
;;		 -> STR_139(29), init_time_editor@buf(60), STR_41(21), STR_40(20), 
;;		 -> STR_39(36), STR_36(33), STR_35(21), STR_34(20), 
;;		 -> STR_33(22), main@buf_714(30), main@buf_675(40), main@buf_672(60), 
;;		 -> main@buf_667(50), STR_26(16), main@time_buf(60), STR_24(19), 
;;		 -> STR_23(22), STR_22(22), STR_21(24), STR_20(19), 
;;		 -> STR_19(22), STR_16(23), STR_15(28), main@buf_633(30), 
;;		 -> STR_13(34), STR_12(38), main@buf_628(50), STR_10(42), 
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
	
l12440:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	84
	
l12442:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	85
	
l12444:
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
;;		 -> STR_373(29), STR_372(38), STR_371(43), STR_370(38), 
;;		 -> STR_369(49), STR_368(31), STR_367(39), STR_366(31), 
;;		 -> STR_365(37), STR_364(28), STR_363(22), rtc_read_time@debug_buf(80), 
;;		 -> rtc_set_time@buf(80), STR_360(32), STR_359(28), STR_358(30), 
;;		 -> STR_357(28), STR_356(29), menu_handle_button@buf_1809(50), STR_354(21), 
;;		 -> STR_353(20), STR_352(26), STR_351(25), STR_350(37), 
;;		 -> STR_349(37), menu_handle_button@buf_1799(50), STR_347(20), STR_342(25), 
;;		 -> menu_handle_button@buf_1790(50), menu_handle_button@buf_1780(50), STR_339(53), STR_328(27), 
;;		 -> menu_handle_button@buf_1754(50), STR_325(24), STR_324(27), STR_323(16), 
;;		 -> menu_handle_button@buf_1741(80), STR_321(36), menu_handle_button@buf_1722(80), menu_handle_button@buf_1720(50), 
;;		 -> menu_handle_button@buf_1718(50), STR_317(31), menu_handle_button@buf_1713(50), menu_handle_button@buf(50), 
;;		 -> menu_handle_encoder@buf_1686(50), menu_handle_encoder@buf_1683(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), 
;;		 -> handle_numeric_rotation@buf(50), STR_226(31), rebuild_input_menu@buf(50), STR_153(26), 
;;		 -> init_datetime_editor@buf(80), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), handle_time_rotation@buf(50), 
;;		 -> STR_139(29), init_time_editor@buf(60), STR_41(21), STR_40(20), 
;;		 -> STR_39(36), STR_36(33), STR_35(21), STR_34(20), 
;;		 -> STR_33(22), main@buf_714(30), main@buf_675(40), main@buf_672(60), 
;;		 -> main@buf_667(50), STR_26(16), main@time_buf(60), STR_24(19), 
;;		 -> STR_23(22), STR_22(22), STR_21(24), STR_20(19), 
;;		 -> STR_19(22), STR_16(23), STR_15(28), main@buf_633(30), 
;;		 -> STR_13(34), STR_12(38), main@buf_628(50), STR_10(42), 
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
	
l12336:
	goto	l12342
	line	77
	
l12338:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15867
	tblrd	*
	
	movf	tablat,w
	bra	u15860
u15867:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15860:
	
	call	_uart_write
	
l12340:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	75
	
l12342:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u15877
	tblrd	*
	
	movf	tablat,w
	bra	u15870
u15877:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u15870:
	iorlw	0
	btfss	status,2
	goto	u15881
	goto	u15880
u15881:
	goto	l12338
u15880:
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
	
l12272:
	line	69
	
l124:
	line	68
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u15831
	goto	u15830
u15831:
	goto	l124
u15830:
	line	70
	
l12274:
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
	
l12720:
	movff	(c:i2c_write@data),(c:4041)	;volatile
	line	125
	
l1702:
	line	124
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u16591
	goto	u16590
u16591:
	goto	l1702
u16590:
	
l1704:
	line	126
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	129
	btfss	((c:4037))^0f00h,c,6	;volatile
	goto	u16601
	goto	u16600
u16601:
	goto	l12726
u16600:
	line	131
	
l12722:
	movlw	(01h)&0ffh
	goto	l1706
	line	134
	
l12726:
	movlw	(0)&0ffh
	line	135
	
l1706:
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
	
l12710:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16561
	goto	u16560
u16561:
	goto	l1694
u16560:
	goto	l1695
	line	102
	
l1694:
	line	104
	bsf	((c:4037))^0f00h,c,2	;volatile
	line	107
	
l12714:
	movlw	high(03E8h)
	movwf	((c:i2c_stop@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_stop@timeout))^00h,c
	line	108
	goto	l1696
	line	110
	
l12716:
	decf	((c:i2c_stop@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_stop@timeout+1))^00h,c
	movf	((c:i2c_stop@timeout))^00h,c,w
iorwf	((c:i2c_stop@timeout+1))^00h,c,w
	btfss	status,2
	goto	u16571
	goto	u16570

u16571:
	goto	l1696
u16570:
	goto	l1695
	line	112
	
l1696:
	line	108
	btfsc	((c:4037))^0f00h,c,2	;volatile
	goto	u16581
	goto	u16580
u16581:
	goto	l12716
u16580:
	line	113
	
l1695:
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
	
l12692:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u16531
	goto	u16530
u16531:
	goto	l1678
u16530:
	line	60
	
l12694:
	movlw	(01h)&0ffh
	goto	l1679
	
l1678:
	line	62
	bsf	((c:4037))^0f00h,c,0	;volatile
	line	65
	
l12698:
	movlw	high(03E8h)
	movwf	((c:i2c_start@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_start@timeout))^00h,c
	line	66
	goto	l1680
	line	68
	
l12700:
	decf	((c:i2c_start@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_start@timeout+1))^00h,c
	movf	((c:i2c_start@timeout))^00h,c,w
iorwf	((c:i2c_start@timeout+1))^00h,c,w
	btfss	status,2
	goto	u16541
	goto	u16540

u16541:
	goto	l1680
u16540:
	goto	l12694
	line	70
	
l1680:
	line	66
	btfsc	((c:4037))^0f00h,c,0	;volatile
	goto	u16551
	goto	u16550
u16551:
	goto	l12700
u16550:
	line	72
	
l12706:
	movlw	(0)&0ffh
	line	73
	
l1679:
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
	
l12368:
	movlw	high(03E8h)
	movwf	((c:i2c_wait_idle@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_wait_idle@timeout))^00h,c
	line	45
	goto	l12376
	line	47
	
l12370:
	decf	((c:i2c_wait_idle@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_wait_idle@timeout+1))^00h,c
	movf	((c:i2c_wait_idle@timeout))^00h,c,w
iorwf	((c:i2c_wait_idle@timeout+1))^00h,c,w
	btfss	status,2
	goto	u15921
	goto	u15920

u15921:
	goto	l12376
u15920:
	line	48
	
l12372:
	movlw	(01h)&0ffh
	goto	l1674
	line	45
	
l12376:
	movff	(c:4037),??_i2c_wait_idle+0+0	;volatile
	movlw	01Fh
	andwf	(??_i2c_wait_idle+0+0)^00h,c
	btfss	status,2
	goto	u15931
	goto	u15930
u15931:
	goto	l12370
u15930:
	
l12378:
	btfsc	((c:4039))^0f00h,c,2	;volatile
	goto	u15941
	goto	u15940
u15941:
	goto	l12370
u15940:
	line	50
	
l12380:
	movlw	(0)&0ffh
	line	51
	
l1674:
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
	
i2l12148:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u1547_41
	goto	i2u1547_40
i2u1547_41:
	goto	i2l355
i2u1547_40:
	line	49
	
i2l12150:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	50
	
i2l12152:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	52
	
i2l12154:
	incf	((c:_relay_ms_counter))^00h,c
	line	53
	
i2l12156:
		movlw	0Ah-1
	cpfsgt	((c:_relay_ms_counter))^00h,c
	goto	i2u1548_41
	goto	i2u1548_40

i2u1548_41:
	goto	i2l12178
i2u1548_40:
	line	55
	
i2l12158:
	movlw	low(0)
	movwf	((c:_relay_ms_counter))^00h,c
	line	57
	
i2l12160:
	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1549_41
	goto	i2u1549_40

i2u1549_41:
	goto	i2l12168
i2u1549_40:
	
i2l12162:; BSR set to: 0

	movf	((c:_relay_latch_mode))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1550_41
	goto	i2u1550_40
i2u1550_41:
	goto	i2l12168
i2u1550_40:
	
i2l12164:; BSR set to: 0

	movlb	5	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	i2u1551_41
	goto	i2u1551_40

i2u1551_41:
	goto	i2l12168
i2u1551_40:
	line	59
	
i2l12166:; BSR set to: 5

	decf	((_relay_counter))&0ffh	;volatile
	btfss	status,0
	decf	((_relay_counter+1))&0ffh	;volatile
	line	60
	goto	i2l12178
	line	61
	
i2l12168:
	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1552_41
	goto	i2u1552_40

i2u1552_41:
	goto	i2l12178
i2u1552_40:
	
i2l12170:; BSR set to: 0

	movf	((c:_relay_latch_mode))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1553_41
	goto	i2u1553_40
i2u1553_41:
	goto	i2l12178
i2u1553_40:
	
i2l12172:; BSR set to: 0

	movlb	5	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1554_41
	goto	i2u1554_40

i2u1554_41:
	goto	i2l12178
i2u1554_40:
	line	64
	
i2l12174:; BSR set to: 5

	bsf	((c:3979))^0f00h,c,1	;volatile
	line	65
	
i2l12176:; BSR set to: 5

	movlw	low(0)
	movlb	0	; () banked
	movwf	((_relay_state))&0ffh	;volatile
	line	71
	
i2l12178:
	incf	((c:_ms_counter))^00h,c	;volatile
	line	72
	
i2l12180:
		movlw	02h-1
	cpfsgt	((c:_ms_counter))^00h,c	;volatile
	goto	i2u1555_41
	goto	i2u1555_40

i2u1555_41:
	goto	i2l12196
i2u1555_40:
	line	74
	
i2l12182:
	movlw	low(0)
	movwf	((c:_ms_counter))^00h,c	;volatile
	line	75
	
i2l12184:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1556_41
	goto	i2u1556_40

i2u1556_41:
	goto	i2l12196
i2u1556_40:
	line	77
	
i2l12186:
	decf	((c:_menu_timeout_timer))^00h,c	;volatile
	btfss	status,0
	decf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	line	80
	
i2l12188:
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
	goto	i2u1557_41
	goto	i2u1557_40

i2u1557_41:
	goto	i2l12192
i2u1557_40:
	line	83
	
i2l12190:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_timeout_debug_flag))&0ffh	;volatile
	line	86
	
i2l12192:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1558_41
	goto	i2u1558_40

i2u1558_41:
	goto	i2l12196
i2u1558_40:
	line	88
	
i2l12194:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	94
	
i2l12196:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u1559_41
	goto	i2u1559_40
i2u1559_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u1559_48
i2u1559_40:
	clrf	(??_isr+0+0)^00h,c
i2u1559_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u1560_41
	goto	i2u1560_40
i2u1560_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u1560_48
i2u1560_40:
	clrf	(??_isr+1+0)^00h,c
i2u1560_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	95
	
i2l12198:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	98
	
i2l12200:
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
	
i2l12202:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u1561_41
	goto	i2u1561_40
i2u1561_41:
	goto	i2l12228
i2u1561_40:
	line	103
	
i2l12204:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u1562_41
	goto	i2u1562_40

i2u1562_41:
	goto	i2l12216
i2u1562_40:
	line	105
	
i2l12206:
	movlb	5	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	106
	
i2l12208:; BSR set to: 5

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	109
	
i2l12210:; BSR set to: 5

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1563_41
	goto	i2u1563_40

i2u1563_41:
	goto	i2l12228
i2u1563_40:
	line	111
	
i2l12212:; BSR set to: 5

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	112
	
i2l12214:; BSR set to: 5

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l12228
	line	115
	
i2l12216:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u1564_41
	goto	i2u1564_40

i2u1564_41:
	goto	i2l12228
i2u1564_40:
	line	117
	
i2l12218:
	movlb	5	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	line	118
	
i2l12220:; BSR set to: 5

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	121
	
i2l12222:; BSR set to: 5

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1565_41
	goto	i2u1565_40

i2u1565_41:
	goto	i2l340
i2u1565_40:
	goto	i2l12212
	line	127
	
i2l340:; BSR set to: 5

	line	129
	
i2l12228:
	movff	(c:isr@new_state),(c:_enc_state)
	line	132
	
i2l12230:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	133
	
i2l12232:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u1566_41
	goto	i2u1566_40

i2u1566_41:
	goto	i2l12260
i2u1566_40:
	line	135
	
i2l12234:
	incf	((c:_btn_debounce))^00h,c
	line	136
	
i2l12236:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u1567_41
	goto	i2u1567_40

i2u1567_41:
	goto	i2l355
i2u1567_40:
	line	138
	
i2l12238:
	movff	(c:isr@btn),(c:_last_btn)
	line	139
	
i2l12240:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	141
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1568_41
	goto	i2u1568_40
i2u1568_41:
	goto	i2l12250
i2u1568_40:
	line	144
	
i2l12242:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	145
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	148
	
i2l12244:; BSR set to: 5

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1569_41
	goto	i2u1569_40

i2u1569_41:
	goto	i2l352
i2u1569_40:
	line	150
	
i2l12246:; BSR set to: 5

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	151
	
i2l12248:; BSR set to: 5

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l355
	line	157
	
i2l12250:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1570_41
	goto	i2u1570_40

i2u1570_41:
	goto	i2l12254
i2u1570_40:
	line	159
	
i2l12252:
	movlw	low(02h)
	movlb	5	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	160
	goto	i2l349
	line	161
	
i2l12254:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u1571_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1571_41
	goto	i2u1571_40

i2u1571_41:
	goto	i2l12258
i2u1571_40:
	line	163
	
i2l12256:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	164
	goto	i2l349
	line	167
	
i2l12258:
	movlw	low(0)
	movlb	5	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	168
	
i2l349:; BSR set to: 5

	line	170
	movlw	low(01h)
	movlb	0	; () banked
	movwf	((_button_pressed))&0ffh	;volatile
	line	171
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	goto	i2l355
	line	177
	
i2l12260:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	179
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1572_41
	goto	i2u1572_40
i2u1572_41:
	goto	i2l355
i2u1572_40:
	
i2l12262:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1573_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1573_41
	goto	i2u1573_40

i2u1573_41:
	goto	i2l355
i2u1573_40:
	line	181
	
i2l12264:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	184
	
i2l12266:
		movlw	8
	xorwf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1574_41
	movlw	7
	xorwf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1574_41
	goto	i2u1574_40

i2u1574_41:
	goto	i2l352
i2u1574_40:
	line	186
	
i2l12268:
	movlw	low(01h)
	movlb	5	; () banked
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	goto	i2l355
	line	189
	
i2l352:
	line	203
	
i2l355:
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
	
i2l11748:
	movf	((c:i2___lwmod@divisor))^00h,c,w
iorwf	((c:i2___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	i2u1488_41
	goto	i2u1488_40

i2u1488_41:
	goto	i2l2407
i2u1488_40:
	line	13
	
i2l11750:
	movlw	low(01h)
	movwf	((c:i2___lwmod@counter))^00h,c
	line	14
	goto	i2l11754
	line	15
	
i2l11752:
	bcf	status,0
	rlcf	((c:i2___lwmod@divisor))^00h,c
	rlcf	((c:i2___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:i2___lwmod@counter))^00h,c
	line	14
	
i2l11754:
	
	btfss	((c:i2___lwmod@divisor+1))^00h,c,(15)&7
	goto	i2u1489_41
	goto	i2u1489_40
i2u1489_41:
	goto	i2l11752
i2u1489_40:
	line	19
	
i2l11756:
		movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c,w
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	i2u1490_41
	goto	i2u1490_40

i2u1490_41:
	goto	i2l11760
i2u1490_40:
	line	20
	
i2l11758:
	movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c

	line	21
	
i2l11760:
	bcf	status,0
	rrcf	((c:i2___lwmod@divisor+1))^00h,c
	rrcf	((c:i2___lwmod@divisor))^00h,c
	line	22
	
i2l11762:
	decfsz	((c:i2___lwmod@counter))^00h,c
	
	goto	i2l11756
	line	23
	
i2l2407:
	line	24
	movff	(c:i2___lwmod@dividend),(c:?i2___lwmod)
	movff	(c:i2___lwmod@dividend+1),(c:?i2___lwmod+1)
	line	25
	
i2l2414:
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
