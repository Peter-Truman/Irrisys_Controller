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
	debug_source C
	FNCALL	_main,_beep
	FNCALL	_main,_encoder_init
	FNCALL	_main,_lcd_clear
	FNCALL	_main,_lcd_cmd
	FNCALL	_main,_lcd_data
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_print
	FNCALL	_main,_lcd_set_cursor
	FNCALL	_main,_menu_draw_input
	FNCALL	_main,_menu_draw_options
	FNCALL	_main,_menu_handle_button
	FNCALL	_main,_menu_handle_encoder
	FNCALL	_main,_menu_init
	FNCALL	_main,_sprintf
	FNCALL	_main,_system_init
	FNCALL	_main,_uart_init
	FNCALL	_main,_uart_println
	FNCALL	_uart_println,_uart_print
	FNCALL	_uart_println,_uart_write
	FNCALL	_uart_print,_uart_write
	FNCALL	_menu_handle_button,_beep
	FNCALL	_menu_handle_button,_strcpy
	FNCALL	_menu_draw_options,_lcd_clear_line
	FNCALL	_menu_draw_options,_lcd_print
	FNCALL	_menu_draw_options,_lcd_print_at
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
	FNCALL	_lcd_write_nibble,_lcd_pulse_enable
	FNROOT	_main
	FNCALL	intlevel2,_isr
	global	intlevel2
	FNROOT	intlevel2
	global	menu_draw_input@F2299
	global	_options_menu
	global	_enable_edit_flag
	global	_last_btn
	global	_value_enable
	global	_value_scale4
	global	_value_sensor
	global	_input_menu
	global	_value_display
	global	_value_rlyslp
	global	_value_rlyplp
	global	_value_rlyhigh
	global	_value_slpbp
	global	_value_plpbp
	global	_value_highbp
	global	_value_scale20
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"src\menu.c"
	line	159

;initializer for menu_draw_input@F2299
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

;initializer for _options_menu
		db	low(STR_17)
	db	high(STR_17)

		db	low(STR_18)
	db	high(STR_18)

		db	low(STR_19)
	db	high(STR_19)

		db	low(STR_20)
	db	high(STR_20)

		db	low(STR_21)
	db	high(STR_21)

	line	15

;initializer for _enable_edit_flag
	db	low(01h)
	file	"src\encoder.c"
	line	18

;initializer for _last_btn
	db	low(01h)
	file	"src\menu.c"
	line	26

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
psect	idataBANK0,class=CODE,space=0,delta=1,noexec
global __pidataBANK0
__pidataBANK0:
	line	28

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
	line	27

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
psect	idataBANK1,class=CODE,space=0,delta=1,noexec
global __pidataBANK1
__pidataBANK1:
	line	40

;initializer for _input_menu
		db	low(STR_22)
	db	high(STR_22)

		db	low(_value_enable)
	db	0

	db	low(01h)
		db	low(STR_23)
	db	high(STR_23)

		db	low(_value_sensor)
	db	0

	db	low(01h)
		db	low(STR_24)
	db	high(STR_24)

		db	low(_value_scale4)
	db	0

	db	low(01h)
		db	low(STR_25)
	db	high(STR_25)

		db	low(_value_scale20)
	db	high(_value_scale20)

	db	low(01h)
		db	low(STR_26)
	db	high(STR_26)

		db	low(_value_highbp)
	db	high(_value_highbp)

	db	low(01h)
		db	low(STR_27)
	db	high(STR_27)

		db	low(_value_plpbp)
	db	high(_value_plpbp)

	db	low(01h)
		db	low(STR_28)
	db	high(STR_28)

		db	low(_value_slpbp)
	db	high(_value_slpbp)

	db	low(01h)
		db	low(STR_29)
	db	high(STR_29)

		db	low(_value_rlyhigh)
	db	high(_value_rlyhigh)

	db	low(01h)
		db	low(STR_30)
	db	high(STR_30)

		db	low(_value_rlyplp)
	db	high(_value_rlyplp)

	db	low(01h)
		db	low(STR_31)
	db	high(STR_31)

		db	low(_value_rlyslp)
	db	high(_value_rlyslp)

	db	low(01h)
		db	low(STR_32)
	db	high(STR_32)

		db	low(_value_display)
	db	high(_value_display)

	db	low(01h)
		db	low(STR_33)
	db	high(STR_33)

		db	low(_value_back)
	db	0

	db	low(0)
	line	36

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
	line	35

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
	line	34

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
	line	33

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
	line	32

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
	line	31

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
	line	30

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
	line	29

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
	global	_enc_table
psect	mediumconst,class=MEDIUMCONST,space=0,reloc=2,noexec
global __pmediumconst
__pmediumconst:
	db	0
	file	"src\encoder.c"
	line	21
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
	global	_enc_table
	global	_dpowers
	global	_button_hold_ms
	global	_btn_debounce
	global	_enc_accumulator
	global	_enc_state
	global	_original_value
	global	_value_back
	global	_menu
	global	_encoder_count
	global	_button_event
	global	_button_pressed
	global	_TRISB
_TRISB	set	0xF93
	global	_LATCbits
_LATCbits	set	0xF8B
	global	_LATAbits
_LATAbits	set	0xF89
	global	_TRISC
_TRISC	set	0xF94
	global	_OSCCONbits
_OSCCONbits	set	0xFD3
	global	_PORTBbits
_PORTBbits	set	0xF81
	global	_LATA
_LATA	set	0xF89
	global	_TRISA
_TRISA	set	0xF92
	global	_TRISCbits
_TRISCbits	set	0xF94
	global	_OSCTUNE
_OSCTUNE	set	0xF9B
	global	_PIR1bits
_PIR1bits	set	0xF9E
	global	_RCSTA
_RCSTA	set	0xFAB
	global	_TXSTA
_TXSTA	set	0xFAC
	global	_TXREG
_TXREG	set	0xFAD
	global	_SPBRG
_SPBRG	set	0xFAF
	global	_SPBRGH
_SPBRGH	set	0xFB0
	global	_BAUDCON
_BAUDCON	set	0xFB8
	global	_ADCON1
_ADCON1	set	0xFC1
	global	_OSCCON
_OSCCON	set	0xFD3
	global	_T0CON
_T0CON	set	0xFD5
	global	_TMR0L
_TMR0L	set	0xFD6
	global	_INTCON2bits
_INTCON2bits	set	0xFF1
	global	_INTCONbits
_INTCONbits	set	0xFF2
	global	_LATC
_LATC	set	0xF8B
	global	_LATB
_LATB	set	0xF8A
	
STR_13:
	db	69	;'E'
	db	100	;'d'
	db	105	;'i'
	db	116	;'t'
	db	32
	db	109	;'m'
	db	111	;'o'
	db	100	;'d'
	db	101	;'e'
	db	44
	db	32
	db	105	;'i'
	db	116	;'t'
	db	101	;'e'
	db	109	;'m'
	db	32
	db	37
	db	100	;'d'
	db	44
	db	32
	db	118	;'v'
	db	97	;'a'
	db	108	;'l'
	db	117	;'u'
	db	101	;'e'
	db	58	;':'
	db	32
	db	37
	db	115	;'s'
	db	0
	
STR_1:
	db	13
	db	10
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
	db	83	;'S'
	db	116	;'t'
	db	97	;'a'
	db	114	;'r'
	db	116	;'t'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	61	;'='
	db	61	;'='
	db	61	;'='
	db	0
	
STR_16:
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
	
STR_6:
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
	
STR_15:
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
	
STR_3:
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
	
STR_12:
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
	
STR_4:
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
	
STR_9:
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
	
STR_10:
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
	
STR_34:
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
	
STR_2:
	db	83	;'S'
	db	121	;'y'
	db	115	;'s'
	db	116	;'t'
	db	101	;'e'
	db	109	;'m'
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
	
STR_5:
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
	
STR_11:
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
	
STR_14:
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
	
STR_8:
	db	77	;'M'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	32
	db	84	;'T'
	db	101	;'e'
	db	115	;'s'
	db	116	;'t'
	db	32
	db	77	;'M'
	db	111	;'o'
	db	100	;'d'
	db	101	;'e'
	db	0
	
STR_19:
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
	
STR_7:
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
	
STR_25:
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
	
STR_18:
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
	
STR_24:
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
	
STR_17:
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
	
STR_41:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_29:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	0
	
STR_38:
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	49	;'1'
	db	0
	
STR_26:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_30:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_31:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_35:
	db	79	;'O'
	db	80	;'P'
	db	84	;'T'
	db	73	;'I'
	db	79	;'O'
	db	78	;'N'
	db	83	;'S'
	db	0
	
STR_40:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_32:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	0
	
STR_54:
	db	40
	db	110	;'n'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	41
	db	0
	
STR_22:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	0
	
STR_23:
	db	83	;'S'
	db	101	;'e'
	db	110	;'n'
	db	115	;'s'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_27:
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_28:
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_20:
	db	65	;'A'
	db	98	;'b'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_39:
	db	40
	db	37
	db	115	;'s'
	db	41
	db	0
	
STR_50:
	db	91	;'['
	db	37
	db	115	;'s'
	db	93	;']'
	db	0
	
STR_33:
	db	66	;'B'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_21:
	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	0
	
STR_45:
	db	40
	db	0
	
STR_36:
	db	91	;'['
	db	0
STR_44	equ	STR_41+0
STR_53	equ	STR_41+0
STR_43	equ	STR_40+0
STR_52	equ	STR_40+0
STR_37	equ	STR_50+3
STR_42	equ	STR_39+0
STR_47	equ	STR_54+5
STR_49	equ	STR_54+5
STR_46	equ	STR_34+19
STR_48	equ	STR_34+19
STR_51	equ	STR_34+20
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
	config BORV = "3"
	config WDT = "OFF"
	config WDTPS = "32768"
	config CCP2MX = "PORTC"
	config PBADEN = "OFF"
	config LPT1OSC = "OFF"
	config MCLRE = "ON"
	config STVREN = "ON"
	config LVP = "OFF"
	config XINST = "OFF"
	config DEBUG = "OFF"
	config CP0 = "OFF"
	config CP1 = "OFF"
	config CP2 = "OFF"
	config CPB = "OFF"
	config CPD = "OFF"
	config WRT0 = "OFF"
	config WRT1 = "OFF"
	config WRT2 = "OFF"
	config WRTC = "OFF"
	config WRTB = "OFF"
	config WRTD = "OFF"
	config EBTR0 = "OFF"
	config EBTR1 = "OFF"
	config EBTR2 = "OFF"
	config EBTRB = "OFF"
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
_original_value:
       ds      10
_value_back:
       ds      1
psect	dataCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pdataCOMRAM
__pdataCOMRAM:
	file	"src\menu.c"
	line	159
menu_draw_input@F2299:
       ds      10
psect	dataCOMRAM
	file	"src\menu.c"
	line	18
	global	_options_menu
_options_menu:
       ds      10
psect	dataCOMRAM
	file	"src\menu.c"
	line	15
_enable_edit_flag:
       ds      1
psect	dataCOMRAM
	file	"src\encoder.c"
	line	18
_last_btn:
       ds      1
psect	dataCOMRAM
	file	"src\menu.c"
	line	26
_value_enable:
       ds      10
psect	bssBANK0,class=BANK0,space=1,noexec,lowdata
global __pbssBANK0
__pbssBANK0:
	global	_menu
_menu:
       ds      8
	global	_encoder_count
_encoder_count:
       ds      2
	global	_button_event
_button_event:
       ds      1
	global	_button_pressed
_button_pressed:
       ds      1
psect	dataBANK0,class=BANK0,space=1,noexec,lowdata
global __pdataBANK0
__pdataBANK0:
	file	"src\menu.c"
	line	28
_value_scale4:
       ds      10
psect	dataBANK0
	file	"src\menu.c"
	line	27
_value_sensor:
       ds      10
psect	dataBANK1,class=BANK1,space=1,noexec,lowdata
global __pdataBANK1
__pdataBANK1:
	file	"src\menu.c"
	line	40
	global	_input_menu
_input_menu:
       ds      60
psect	dataBANK1
	file	"src\menu.c"
	line	36
_value_display:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	35
_value_rlyslp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	34
_value_rlyplp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	33
_value_rlyhigh:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	32
_value_slpbp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	31
_value_plpbp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	30
_value_highbp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	29
_value_scale20:
       ds      10
	file	"src\main.as"
	line	#
psect	cinit
; Initialize objects allocated to BANK1 (140 bytes)
	global __pidataBANK1
	; load TBLPTR registers with __pidataBANK1
	movlw	low (__pidataBANK1)
	movwf	tblptrl
	movlw	high(__pidataBANK1)
	movwf	tblptrh
	movlw	low highword(__pidataBANK1)
	movwf	tblptru
	lfsr	0,__pdataBANK1
	lfsr	1,140
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK0 (20 bytes)
	global __pidataBANK0
	; load TBLPTR registers with __pidataBANK0
	movlw	low (__pidataBANK0)
	movwf	tblptrl
	movlw	high(__pidataBANK0)
	movwf	tblptrh
	movlw	low highword(__pidataBANK0)
	movwf	tblptru
	lfsr	0,__pdataBANK0
	lfsr	1,20
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
; Initialize objects allocated to COMRAM (32 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	lfsr	0,__pdataCOMRAM
	lfsr	1,32
	copy_data2:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data2
	line	#
; Clear objects allocated to BANK0 (12 bytes)
	global __pbssBANK0
lfsr	0,__pbssBANK0
movlw	12
clear_0:
clrf	postinc0,c
decf	wreg
bnz	clear_0
; Clear objects allocated to COMRAM (16 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	16
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
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
	global	main@buf_421
main@buf_421:	; 40 bytes @ 0x0
	ds   40
	global	main@buf
main@buf:	; 40 bytes @ 0x28
	ds   40
	global	main@was_editing
main@was_editing:	; 1 bytes @ 0x50
	ds   1
	global	main@blink_timer
main@blink_timer:	; 2 bytes @ 0x51
	ds   2
	global	main@delta
main@delta:	; 2 bytes @ 0x53
	ds   2
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0x55
	ds   2
	global	main@current_menu
main@current_menu:	; 1 bytes @ 0x57
	ds   1
psect	cstackBANK0,class=BANK0,space=1,noexec,lowdata
global __pcstackBANK0
__pcstackBANK0:
	global	menu_draw_input@blank
menu_draw_input@blank:	; 10 bytes @ 0x0
	ds   10
	global	menu_draw_input@value_buf
menu_draw_input@value_buf:	; 12 bytes @ 0xA
	ds   12
	global	menu_draw_input@val_len
menu_draw_input@val_len:	; 1 bytes @ 0x16
	ds   1
	global	menu_draw_input@val_len_692
menu_draw_input@val_len_692:	; 1 bytes @ 0x17
	ds   1
	global	_menu_draw_input$681
_menu_draw_input$681:	; 2 bytes @ 0x18
	ds   2
	global	_menu_draw_input$687
_menu_draw_input$687:	; 2 bytes @ 0x1A
	ds   2
	global	menu_draw_input@j
menu_draw_input@j:	; 1 bytes @ 0x1C
	ds   1
	global	menu_draw_input@j_695
menu_draw_input@j_695:	; 1 bytes @ 0x1D
	ds   1
	global	menu_draw_input@val_len_699
menu_draw_input@val_len_699:	; 1 bytes @ 0x1E
	ds   1
	global	menu_draw_input@i
menu_draw_input@i:	; 1 bytes @ 0x1F
	ds   1
	global	menu_draw_input@item_idx
menu_draw_input@item_idx:	; 1 bytes @ 0x20
	ds   1
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_encoder_init:	; 1 bytes @ 0x0
?_menu_init:	; 1 bytes @ 0x0
?_menu_draw_options:	; 1 bytes @ 0x0
?_menu_draw_input:	; 1 bytes @ 0x0
?_menu_handle_button:	; 1 bytes @ 0x0
?_uart_init:	; 1 bytes @ 0x0
?_uart_write:	; 1 bytes @ 0x0
?_system_init:	; 1 bytes @ 0x0
?_lcd_pulse_enable:	; 1 bytes @ 0x0
?_lcd_write_nibble:	; 1 bytes @ 0x0
?_lcd_cmd:	; 1 bytes @ 0x0
?_lcd_data:	; 1 bytes @ 0x0
?_lcd_init:	; 1 bytes @ 0x0
?_lcd_clear:	; 1 bytes @ 0x0
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
?_menu_handle_encoder:	; 1 bytes @ 0x9
?_strcat:	; 1 bytes @ 0x9
?_strcpy:	; 1 bytes @ 0x9
??_uart_init:	; 1 bytes @ 0x9
??_uart_write:	; 1 bytes @ 0x9
??_system_init:	; 1 bytes @ 0x9
??_lcd_pulse_enable:	; 1 bytes @ 0x9
??_lcd_write_nibble:	; 1 bytes @ 0x9
?_beep:	; 1 bytes @ 0x9
	global	?_strlen
?_strlen:	; 2 bytes @ 0x9
	global	?_strcmp
?_strcmp:	; 2 bytes @ 0x9
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
	global	menu_handle_encoder@delta
menu_handle_encoder@delta:	; 2 bytes @ 0x9
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x9
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
??_menu_handle_encoder:	; 1 bytes @ 0xB
??_strlen:	; 1 bytes @ 0xB
?_lcd_print:	; 1 bytes @ 0xB
??_beep:	; 1 bytes @ 0xB
	global	lcd_cmd@cmd
lcd_cmd@cmd:	; 1 bytes @ 0xB
	global	lcd_print@str
lcd_print@str:	; 2 bytes @ 0xB
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0xB
	global	strcmp@s2
strcmp@s2:	; 2 bytes @ 0xB
	global	strlen@cp
strlen@cp:	; 2 bytes @ 0xB
	ds   1
??_strcat:	; 1 bytes @ 0xC
??_strcpy:	; 1 bytes @ 0xC
??_uart_print:	; 1 bytes @ 0xC
?_uart_println:	; 1 bytes @ 0xC
??_lcd_init:	; 1 bytes @ 0xC
??_lcd_clear:	; 1 bytes @ 0xC
?_lcd_set_cursor:	; 1 bytes @ 0xC
	global	lcd_set_cursor@col
lcd_set_cursor@col:	; 1 bytes @ 0xC
	global	strcat@cp
strcat@cp:	; 1 bytes @ 0xC
	global	strcpy@cp
strcpy@cp:	; 1 bytes @ 0xC
	global	uart_println@str
uart_println@str:	; 2 bytes @ 0xC
	global	beep@i
beep@i:	; 2 bytes @ 0xC
	ds   1
??_strcmp:	; 1 bytes @ 0xD
??_lcd_set_cursor:	; 1 bytes @ 0xD
??_lcd_print:	; 1 bytes @ 0xD
??___lwdiv:	; 1 bytes @ 0xD
	global	lcd_set_cursor@pos
lcd_set_cursor@pos:	; 1 bytes @ 0xD
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0xD
	ds   1
??_menu_handle_button:	; 1 bytes @ 0xE
??_uart_println:	; 1 bytes @ 0xE
	global	lcd_set_cursor@row
lcd_set_cursor@row:	; 1 bytes @ 0xE
	global	menu_handle_button@press_type
menu_handle_button@press_type:	; 1 bytes @ 0xE
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0xE
	ds   1
?_lcd_print_at:	; 1 bytes @ 0xF
??_lcd_clear_line:	; 1 bytes @ 0xF
	global	lcd_print_at@col
lcd_print_at@col:	; 1 bytes @ 0xF
	global	lcd_clear_line@row
lcd_clear_line@row:	; 1 bytes @ 0xF
	global	strcmp@r
strcmp@r:	; 1 bytes @ 0xF
	ds   1
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x10
	global	lcd_print_at@str
lcd_print_at@str:	; 2 bytes @ 0x10
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x10
	ds   2
??_lcd_print_at:	; 1 bytes @ 0x12
	global	lcd_print_at@row
lcd_print_at@row:	; 1 bytes @ 0x12
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x12
	ds   1
??_menu_draw_options:	; 1 bytes @ 0x13
	ds   1
??___lwmod:	; 1 bytes @ 0x14
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x14
	ds   1
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x15
	global	sprintf@sp
sprintf@sp:	; 2 bytes @ 0x15
	ds   2
	global	sprintf@f
sprintf@f:	; 2 bytes @ 0x17
	ds   1
	global	menu_draw_options@i
menu_draw_options@i:	; 1 bytes @ 0x18
	ds   5
??_sprintf:	; 1 bytes @ 0x1D
	ds   1
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x1E
	ds   1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x1F
	ds   1
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x20
	ds   1
	global	sprintf@cp
sprintf@cp:	; 2 bytes @ 0x21
	ds   2
	global	sprintf@val
sprintf@val:	; 2 bytes @ 0x23
	ds   2
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x25
	ds   1
??_menu_draw_input:	; 1 bytes @ 0x26
	ds   2
??_main:	; 1 bytes @ 0x28
	ds   2
;!
;!Data Sizes:
;!    Strings     560
;!    Constant    26
;!    Data        192
;!    BSS         28
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126     42      90
;!    BANK0           128     33      65
;!    BANK1           256     88     228
;!    BANK2           256      0       0
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
;!    input_menu$label	PTR const unsigned char  size(2) Largest target is 11
;!		 -> STR_22(CODE[7]), STR_23(CODE[7]), STR_24(CODE[10]), STR_25(CODE[11]), 
;!		 -> STR_26(CODE[8]), STR_27(CODE[6]), STR_28(CODE[6]), STR_29(CODE[9]), 
;!		 -> STR_30(CODE[8]), STR_31(CODE[8]), STR_32(CODE[8]), STR_33(CODE[5]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 10
;!		 -> value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(COMRAM[10]), value_highbp(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK1[10]), value_scale4(BANK0[10]), value_sensor(BANK0[10]), value_slpbp(BANK1[10]), 
;!
;!    lcd_print@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> menu_draw_input@value_buf(BANK0[12]), STR_17(CODE[10]), STR_18(CODE[11]), STR_19(CODE[13]), 
;!		 -> STR_20(CODE[6]), STR_21(CODE[5]), STR_22(CODE[7]), STR_23(CODE[7]), 
;!		 -> STR_24(CODE[10]), STR_25(CODE[11]), STR_26(CODE[8]), STR_27(CODE[6]), 
;!		 -> STR_28(CODE[6]), STR_29(CODE[9]), STR_30(CODE[8]), STR_31(CODE[8]), 
;!		 -> STR_32(CODE[8]), STR_33(CODE[5]), STR_34(CODE[21]), STR_35(CODE[8]), 
;!		 -> STR_36(CODE[2]), STR_37(CODE[2]), STR_38(CODE[8]), STR_7(CODE[13]), 
;!		 -> STR_8(CODE[15]), 
;!
;!    lcd_print_at@str	PTR const unsigned char  size(2) Largest target is 13
;!		 -> menu_draw_input@value_buf(BANK0[12]), STR_17(CODE[10]), STR_18(CODE[11]), STR_19(CODE[13]), 
;!		 -> STR_20(CODE[6]), STR_21(CODE[5]), STR_22(CODE[7]), STR_23(CODE[7]), 
;!		 -> STR_24(CODE[10]), STR_25(CODE[11]), STR_26(CODE[8]), STR_27(CODE[6]), 
;!		 -> STR_28(CODE[6]), STR_29(CODE[9]), STR_30(CODE[8]), STR_31(CODE[8]), 
;!		 -> STR_32(CODE[8]), STR_33(CODE[5]), STR_35(CODE[8]), STR_36(CODE[2]), 
;!		 -> STR_38(CODE[8]), 
;!
;!    menu_draw_input$681	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_40(CODE[8]), STR_41(CODE[9]), 
;!
;!    menu_draw_input$687	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_43(CODE[8]), STR_44(CODE[9]), 
;!
;!    options_menu	PTR const unsigned char [5] size(2) Largest target is 13
;!		 -> STR_17(CODE[10]), STR_18(CODE[11]), STR_19(CODE[13]), STR_20(CODE[6]), 
;!		 -> STR_21(CODE[5]), 
;!
;!    S295$label	PTR const unsigned char  size(2) Largest target is 11
;!		 -> STR_22(CODE[7]), STR_23(CODE[7]), STR_24(CODE[10]), STR_25(CODE[11]), 
;!		 -> STR_26(CODE[8]), STR_27(CODE[6]), STR_28(CODE[6]), STR_29(CODE[9]), 
;!		 -> STR_30(CODE[8]), STR_31(CODE[8]), STR_32(CODE[8]), STR_33(CODE[5]), 
;!
;!    S295$value	PTR unsigned char  size(2) Largest target is 10
;!		 -> value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(COMRAM[10]), value_highbp(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK1[10]), value_scale4(BANK0[10]), value_sensor(BANK0[10]), value_slpbp(BANK1[10]), 
;!
;!    sp__strcat	PTR unsigned char  size(1) Largest target is 12
;!		 -> menu_draw_input@blank(BANK0[10]), menu_draw_input@value_buf(BANK0[12]), 
;!
;!    sp__strcpy	PTR unsigned char  size(1) Largest target is 12
;!		 -> menu_draw_input@value_buf(BANK0[12]), original_value(COMRAM[10]), value_enable(COMRAM[10]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 10
;!		 -> ?_sprintf(COMRAM[2]), STR_40(CODE[8]), STR_41(CODE[9]), STR_54(CODE[7]), 
;!		 -> value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(COMRAM[10]), value_highbp(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK1[10]), value_scale4(BANK0[10]), value_sensor(BANK0[10]), value_slpbp(BANK1[10]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 30
;!		 -> STR_12(CODE[23]), STR_13(CODE[30]), STR_14(CODE[17]), STR_39(CODE[5]), 
;!		 -> STR_42(CODE[5]), STR_45(CODE[2]), STR_50(CODE[5]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 40
;!		 -> main@buf(BANK1[40]), main@buf_421(BANK1[40]), menu_draw_input@value_buf(BANK0[12]), 
;!
;!    strcat@cp	PTR unsigned char  size(1) Largest target is 12
;!		 -> menu_draw_input@blank(BANK0[10]), menu_draw_input@value_buf(BANK0[12]), 
;!
;!    strcat@from	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_46(CODE[2]), STR_47(CODE[2]), STR_48(CODE[2]), STR_49(CODE[2]), 
;!
;!    strcat@to	PTR unsigned char  size(1) Largest target is 12
;!		 -> menu_draw_input@blank(BANK0[10]), menu_draw_input@value_buf(BANK0[12]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 10
;!		 -> value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(COMRAM[10]), value_highbp(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK1[10]), value_scale4(BANK0[10]), value_sensor(BANK0[10]), value_slpbp(BANK1[10]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 1
;!		 -> STR_51(CODE[1]), 
;!
;!    strcpy@cp	PTR unsigned char  size(1) Largest target is 12
;!		 -> menu_draw_input@value_buf(BANK0[12]), original_value(COMRAM[10]), value_enable(COMRAM[10]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 10
;!		 -> menu_draw_input@blank(BANK0[10]), STR_52(CODE[8]), STR_53(CODE[9]), value_back(COMRAM[1]), 
;!		 -> value_display(BANK1[10]), value_enable(COMRAM[10]), value_highbp(BANK1[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), value_scale20(BANK1[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK0[10]), value_slpbp(BANK1[10]), 
;!
;!    strcpy@to	PTR unsigned char  size(1) Largest target is 12
;!		 -> menu_draw_input@value_buf(BANK0[12]), original_value(COMRAM[10]), value_enable(COMRAM[10]), 
;!
;!    strlen@cp	PTR const unsigned char  size(2) Largest target is 12
;!		 -> menu_draw_input@value_buf(BANK0[12]), STR_43(CODE[8]), STR_44(CODE[9]), value_back(COMRAM[1]), 
;!		 -> value_display(BANK1[10]), value_enable(COMRAM[10]), value_highbp(BANK1[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), value_scale20(BANK1[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK0[10]), value_slpbp(BANK1[10]), 
;!
;!    strlen@s	PTR const unsigned char  size(2) Largest target is 12
;!		 -> menu_draw_input@value_buf(BANK0[12]), STR_43(CODE[8]), STR_44(CODE[9]), value_back(COMRAM[1]), 
;!		 -> value_display(BANK1[10]), value_enable(COMRAM[10]), value_highbp(BANK1[10]), value_plpbp(BANK1[10]), 
;!		 -> value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), value_scale20(BANK1[10]), 
;!		 -> value_scale4(BANK0[10]), value_sensor(BANK0[10]), value_slpbp(BANK1[10]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 40
;!		 -> main@buf(BANK1[40]), main@buf_421(BANK1[40]), STR_1(CODE[27]), STR_10(CODE[22]), 
;!		 -> STR_11(CODE[19]), STR_15(CODE[24]), STR_16(CODE[26]), STR_2(CODE[21]), 
;!		 -> STR_3(CODE[23]), STR_4(CODE[22]), STR_5(CODE[19]), STR_6(CODE[24]), 
;!		 -> STR_9(CODE[22]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 40
;!		 -> main@buf(BANK1[40]), main@buf_421(BANK1[40]), STR_1(CODE[27]), STR_10(CODE[22]), 
;!		 -> STR_11(CODE[19]), STR_15(CODE[24]), STR_16(CODE[26]), STR_2(CODE[21]), 
;!		 -> STR_3(CODE[23]), STR_4(CODE[22]), STR_5(CODE[19]), STR_6(CODE[24]), 
;!		 -> STR_9(CODE[22]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_menu_draw_input
;!    _uart_println->_uart_print
;!    _uart_print->_uart_write
;!    _menu_handle_button->_beep
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
;!
;!Critical Paths under _isr in COMRAM
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->_menu_draw_input
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
;! (0) _main                                                90    90      0   25627
;!                                             40 COMRAM     2     2      0
;!                                              0 BANK1     88    88      0
;!                               _beep
;!                       _encoder_init
;!                          _lcd_clear
;!                            _lcd_cmd
;!                           _lcd_data
;!                           _lcd_init
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                    _menu_draw_input
;!                  _menu_draw_options
;!                 _menu_handle_button
;!                _menu_handle_encoder
;!                          _menu_init
;!                            _sprintf
;!                        _system_init
;!                          _uart_init
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    1508
;!                                             12 COMRAM     2     0      2
;!                         _uart_print
;!                         _uart_write
;! ---------------------------------------------------------------------------------
;! (2) _uart_print                                           2     0      2     186
;!                                             10 COMRAM     2     0      2
;!                         _uart_write
;! ---------------------------------------------------------------------------------
;! (2) _uart_write                                           1     1      0      31
;!                                              9 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _uart_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _system_init                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _menu_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_encoder                                  7     5      2     183
;!                                              9 COMRAM     7     5      2
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                   1     1      0    2191
;!                                             14 COMRAM     1     1      0
;!                               _beep
;!                             _strcpy
;! ---------------------------------------------------------------------------------
;! (2) _beep                                                 5     3      2    1058
;!                                              9 COMRAM     5     3      2
;! ---------------------------------------------------------------------------------
;! (1) _menu_draw_options                                    6     6      0    4792
;!                                             19 COMRAM     6     6      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;! ---------------------------------------------------------------------------------
;! (1) _menu_draw_input                                     35    35      0   10611
;!                                             38 COMRAM     2     2      0
;!                                              0 BANK0     33    33      0
;!                     _lcd_clear_line
;!                       _lcd_print_at
;!                            _sprintf
;!                             _strcat
;!                             _strcmp
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (2) _strlen                                               4     2      2     400
;!                                              9 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (2) _strcpy                                               4     1      3    1009
;!                                              9 COMRAM     4     1      3
;! ---------------------------------------------------------------------------------
;! (2) _strcmp                                               7     3      4     313
;!                                              9 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (2) _strcat                                               4     1      3     863
;!                                              9 COMRAM     4     1      3
;! ---------------------------------------------------------------------------------
;! (1) _sprintf                                             23    15      8    2959
;!                                             21 COMRAM    17     9      8
;!                            ___lwdiv
;!                            ___lwmod
;! ---------------------------------------------------------------------------------
;! (2) ___lwmod                                              5     1      4     412
;!                                             16 COMRAM     5     1      4
;!                            ___lwdiv (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4     421
;!                                              9 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (2) _lcd_print_at                                         4     1      3    2491
;!                                             15 COMRAM     4     1      3
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _lcd_clear_line                                       1     1      0    1349
;!                                             15 COMRAM     1     1      0
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_set_cursor                                       3     2      1     620
;!                                             12 COMRAM     3     2      1
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (3) _lcd_print                                            2     0      2     698
;!                                             11 COMRAM     2     0      2
;!                           _lcd_data
;! ---------------------------------------------------------------------------------
;! (4) _lcd_data                                             1     1      0      93
;!                                             10 COMRAM     1     1      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (1) _lcd_init                                             2     2      0     124
;!                                             12 COMRAM     2     2      0
;!                            _lcd_cmd
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (1) _lcd_clear                                            1     1      0      93
;!                                             12 COMRAM     1     1      0
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (4) _lcd_cmd                                              2     2      0      93
;!                                             10 COMRAM     2     2      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (5) _lcd_write_nibble                                     1     1      0      31
;!                                              9 COMRAM     1     1      0
;!                   _lcd_pulse_enable
;! ---------------------------------------------------------------------------------
;! (6) _lcd_pulse_enable                                     0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _encoder_init                                         2     2      0       0
;!                                              9 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 6
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (7) _isr                                                  9     9      0     179
;!                                              0 COMRAM     9     9      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 7
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _beep
;!   _encoder_init
;!   _lcd_clear
;!     _lcd_cmd
;!       _lcd_write_nibble
;!         _lcd_pulse_enable
;!   _lcd_cmd
;!   _lcd_data
;!     _lcd_write_nibble
;!   _lcd_init
;!     _lcd_cmd
;!     _lcd_write_nibble
;!   _lcd_print
;!     _lcd_data
;!   _lcd_set_cursor
;!     _lcd_cmd
;!   _menu_draw_input
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
;!     _strcpy
;!   _menu_handle_encoder
;!   _menu_init
;!   _sprintf
;!   _system_init
;!   _uart_init
;!   _uart_println
;!     _uart_print
;!       _uart_write
;!     _uart_write
;!
;! _isr (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BIGRAM             F7F      0       0      50        0.0%
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
;!BANK3              100      0       0      11        0.0%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100      0       0       9        0.0%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100     58      E4       7       89.1%
;!BITBANK15           80      0       0      34        0.0%
;!BANK15              80      0       0      35        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80     21      41       5       50.8%
;!BITCOMRAM           7E      0       0       0        0.0%
;!COMRAM              7E     2A      5A       1       71.4%
;!BITBIGSFRhhhhlh     1A      0       0      37        0.0%
;!BITBIGSFRhhhlh      11      0       0      39        0.0%
;!BITBIGSFRhhhhh       D      0       0      36        0.0%
;!BITBIGSFRhlh         C      0       0      43        0.0%
;!BITBIGSFRhhhll       8      0       0      40        0.0%
;!BITBIGSFRlllh        7      0       0      47        0.0%
;!BITBIGSFRhhlh        7      0       0      41        0.0%
;!BITBIGSFRllh         6      0       0      46        0.0%
;!BITBIGSFRhlll        6      0       0      45        0.0%
;!BITBIGSFRhllh        2      0       0      44        0.0%
;!BITBIGSFRhhhhll      1      0       0      38        0.0%
;!BITBIGSFRhhll        1      0       0      42        0.0%
;!BITBIGSFRllll        1      0       0      48        0.0%
;!BIGSFR               0      0       0     200        0.0%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0     17F      49        0.0%
;!DATA                 0      0     17F       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 224 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            40    0[BANK1 ] unsigned char [40]
;;  buf            40   40[BANK1 ] unsigned char [40]
;;  delta           2   83[BANK1 ] int 
;;  last_encoder    2   85[BANK1 ] int 
;;  blink_timer     2   81[BANK1 ] unsigned int 
;;  current_menu    1   87[BANK1 ] unsigned char 
;;  was_editing     1   80[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 3F/1
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0      88       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0      88       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       90 bytes
;; Hardware stack levels required when called: 7
;; This function calls:
;;		_beep
;;		_encoder_init
;;		_lcd_clear
;;		_lcd_cmd
;;		_lcd_data
;;		_lcd_init
;;		_lcd_print
;;		_lcd_set_cursor
;;		_menu_draw_input
;;		_menu_draw_options
;;		_menu_handle_button
;;		_menu_handle_encoder
;;		_menu_init
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
	line	224
global __ptext0
__ptext0:
psect	text0
	file	"src\main.c"
	line	224
	
_main:
;incstack = 0
	callstack 24
	line	226
	
l3045:
	call	_system_init	;wreg free
	line	227
	call	_uart_init	;wreg free
	line	229
	
l3047:
		movlw	low(STR_1)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_1)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	230
	
l3049:
		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	232
	
l3051:
	call	_lcd_init	;wreg free
	line	234
	
l3053:
		movlw	low(STR_3)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_3)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	235
	
l3055:
	movlw	(080h)&0ffh
	
	call	_lcd_cmd
	line	236
	
l3057:
	movlw	(054h)&0ffh
	
	call	_lcd_data
	line	237
	
l3059:
	movlw	(045h)&0ffh
	
	call	_lcd_data
	line	238
	
l3061:
	movlw	(053h)&0ffh
	
	call	_lcd_data
	line	239
	
l3063:
	movlw	(054h)&0ffh
	
	call	_lcd_data
	line	241
	
l3065:
	call	_encoder_init	;wreg free
	line	242
	
l3067:
		movlw	low(STR_4)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_4)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	244
	
l3069:
	call	_menu_init	;wreg free
	line	245
	
l3071:; BSR set to: 0

		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	247
	
l3073:
		movlw	low(STR_6)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_6)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	248
	call	_lcd_clear	;wreg free
	line	249
	movlw	low(03h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	250
	
l3075:
		movlw	low(STR_7)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	251
	
l3077:
	movlw	low(02h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	252
		movlw	low(STR_8)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	254
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	255
	
l3079:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	256
	
l3081:
	asmopt push
asmopt off
movlw  5
movwf	(??_main+0+0+1)^00h,c
movlw	15
movwf	(??_main+0+0)^00h,c
	movlw	241
u3297:
decfsz	wreg,f
	bra	u3297
	decfsz	(??_main+0+0)^00h,c,f
	bra	u3297
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u3297
	nop
asmopt pop

	line	257
	
l3083:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	258
	
l3085:
	asmopt push
asmopt off
movlw  5
movwf	(??_main+0+0+1)^00h,c
movlw	15
movwf	(??_main+0+0)^00h,c
	movlw	241
u3307:
decfsz	wreg,f
	bra	u3307
	decfsz	(??_main+0+0)^00h,c,f
	bra	u3307
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u3307
	nop
asmopt pop

	line	259
	
l3087:
	movlw	high(0C8h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(0C8h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	261
	
l3089:
	asmopt push
asmopt off
movlw  82
movwf	(??_main+0+0+1)^00h,c
movlw	43
movwf	(??_main+0+0)^00h,c
	movlw	0
u3317:
decfsz	wreg,f
	bra	u3317
	decfsz	(??_main+0+0)^00h,c,f
	bra	u3317
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u3317
	nop2
asmopt pop

	line	263
	
l3091:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	264
	
l3093:
	call	_lcd_clear	;wreg free
	line	265
	
l3095:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((main@current_menu))&0ffh
	line	266
	
l3097:; BSR set to: 1

	call	_menu_draw_options	;wreg free
	line	268
	
l3099:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	269
	
l3101:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((main@blink_timer+1))&0ffh
	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	line	270
	
l3103:; BSR set to: 1

	line	272
	
l3105:; BSR set to: 1

		movlw	low(STR_11)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_11)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	286
	
l3107:
	movlb	1	; () banked
	movf	((main@last_encoder))&0ffh,w
	movlb	0	; () banked
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u3100
	movlb	1	; () banked
movf	((main@last_encoder+1))&0ffh,w
	movlb	0	; () banked
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u3101
	goto	u3100

u3101:
	goto	l3131
u3100:
	line	288
	
l3109:; BSR set to: 0

	movlb	1	; () banked
	movf	((main@last_encoder))&0ffh,w
	movlb	0	; () banked
	subwf	((_encoder_count))&0ffh,w	;volatile
	movlb	1	; () banked
	movwf	((main@delta))&0ffh
	movf	((main@last_encoder+1))&0ffh,w
	movlb	0	; () banked
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movlb	1	; () banked
	movwf	1+((main@delta))&0ffh
	line	294
	
l3111:; BSR set to: 1

		movlw	low(main@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_12)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_12)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_encoder_count),0+((c:?_sprintf)+04h)	;volatile
	movff	(_encoder_count+1),1+((c:?_sprintf)+04h)	;volatile
	movff	(main@delta),0+((c:?_sprintf)+06h)
	movff	(main@delta+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	295
	
l3113:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	298
	
l3115:
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u3111
	goto	u3110
u3111:
	goto	l3121
u3110:
	line	300
	
l3117:; BSR set to: 0

		movlw	low(main@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_13)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_13)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movf	((_menu))&0ffh,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+06h)
	movff	postdec2,1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	301
	
l3119:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	304
	
l3121:
	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	line	307
	
l3123:; BSR set to: 0

	movlb	1	; () banked
	movf	((main@current_menu))&0ffh,w
	btfss	status,2
	goto	u3121
	goto	u3120
u3121:
	goto	l3127
u3120:
	line	309
	
l3125:; BSR set to: 1

	call	_menu_draw_options	;wreg free
	line	310
	goto	l3129
	line	313
	
l3127:; BSR set to: 1

	call	_menu_draw_input	;wreg free
	line	316
	
l3129:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	320
	
l3131:
	movlb	0	; () banked
	movf	((_button_pressed))&0ffh,w	;volatile
	btfsc	status,2
	goto	u3131
	goto	u3130
u3131:
	goto	l3197
u3130:
	line	322
	
l3133:; BSR set to: 0

	movlw	low(0)
	movwf	((_button_pressed))&0ffh	;volatile
	line	325
	
l3135:; BSR set to: 0

		movlw	low(main@buf_421)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_421)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_14)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_14)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_button_event),0+((c:?_sprintf)+04h)	;volatile
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	326
	
l3137:
		movlw	low(main@buf_421)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_421)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	329
	
l3139:
	movff	0+(_menu+03h),(main@was_editing)
	line	331
	
l3141:
	movlb	0	; () banked
	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u3141
	goto	u3140
u3141:
	goto	l3197
u3140:
	line	333
	
l3143:; BSR set to: 0

		decf	((_button_event))&0ffh,w	;volatile
	btfss	status,2
	goto	u3151
	goto	u3150

u3151:
	goto	l3147
u3150:
	line	335
	
l3145:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	336
	goto	l3155
	line	337
	
l3147:; BSR set to: 0

		movlw	2
	xorwf	((_button_event))&0ffh,w	;volatile
	btfss	status,2
	goto	u3161
	goto	u3160

u3161:
	goto	l3151
u3160:
	line	339
	
l3149:; BSR set to: 0

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	340
	goto	l3155
	line	341
	
l3151:; BSR set to: 0

		movlw	3
	xorwf	((_button_event))&0ffh,w	;volatile
	btfss	status,2
	goto	u3171
	goto	u3170

u3171:
	goto	l3155
u3170:
	line	343
	
l3153:; BSR set to: 0

	movlw	high(0C8h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(0C8h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	346
	
l3155:
	movlb	0	; () banked
	movf	((_button_event))&0ffh,w	;volatile
	
	call	_menu_handle_button
	line	349
	
l3157:
	movlb	1	; () banked
	movf	((main@was_editing))&0ffh,w
	btfsc	status,2
	goto	u3181
	goto	u3180
u3181:
	goto	l3165
u3180:
	
l3159:; BSR set to: 1

	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u3191
	goto	u3190
u3191:
	goto	l3165
u3190:
	line	351
	
l3161:; BSR set to: 0

	movlb	1	; () banked
		decf	((main@current_menu))&0ffh,w
	btfss	status,2
	goto	u3201
	goto	u3200

u3201:
	goto	l3165
u3200:
	line	353
	
l3163:; BSR set to: 1

	call	_menu_draw_input	;wreg free
	line	358
	
l3165:
	movlb	0	; () banked
		decf	((_button_event))&0ffh,w	;volatile
	btfss	status,2
	goto	u3211
	goto	u3210

u3211:
	goto	l3181
u3210:
	
l3167:; BSR set to: 0

	movlb	1	; () banked
	movf	((main@current_menu))&0ffh,w
	btfss	status,2
	goto	u3221
	goto	u3220
u3221:
	goto	l3181
u3220:
	line	360
	
l3169:; BSR set to: 1

		movlw	low(STR_15)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	361
	
l3171:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((main@current_menu))&0ffh
	line	362
	
l3173:; BSR set to: 1

	call	_menu_init	;wreg free
	line	363
	
l3175:; BSR set to: 0

	movlw	low(0Ch)
	movwf	(0+(_menu+02h))&0ffh
	line	364
	
l3177:; BSR set to: 0

	call	_lcd_clear	;wreg free
	line	365
	
l3179:
	call	_menu_draw_input	;wreg free
	line	366
	goto	l3195
	line	367
	
l3181:
		movlw	3
	movlb	0	; () banked
	xorwf	((_button_event))&0ffh,w	;volatile
	btfss	status,2
	goto	u3231
	goto	u3230

u3231:
	goto	l3195
u3230:
	line	369
	
l3183:; BSR set to: 0

		movlw	low(STR_16)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_16)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	370
	
l3185:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((main@current_menu))&0ffh
	line	371
	
l3187:; BSR set to: 1

	call	_menu_init	;wreg free
	line	372
	
l3189:; BSR set to: 0

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	373
	
l3191:; BSR set to: 0

	call	_lcd_clear	;wreg free
	line	374
	
l3193:
	call	_menu_draw_options	;wreg free
	line	377
	
l3195:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	382
	
l3197:; BSR set to: 0

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u3241
	goto	u3240
u3241:
	goto	l3209
u3240:
	line	384
	
l3199:; BSR set to: 0

	movlb	1	; () banked
	infsnz	((main@blink_timer))&0ffh
	incf	((main@blink_timer+1))&0ffh
	line	385
	
l3201:; BSR set to: 1

		movlw	48
	subwf	 ((main@blink_timer))&0ffh,w
	movlw	117
	subwfb	((main@blink_timer+1))&0ffh,w
	btfss	status,0
	goto	u3251
	goto	u3250

u3251:
	goto	l3107
u3250:
	line	387
	
l3203:; BSR set to: 1

	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	line	388
	movlb	0	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u3261
	goto	u3260
u3261:
	movlw	1
	goto	u3270
u3260:
	movlw	0
u3270:
	movwf	(0+(_menu+05h))&0ffh
	line	389
	
l3205:; BSR set to: 0

	movlb	1	; () banked
		decf	((main@current_menu))&0ffh,w
	btfss	status,2
	goto	u3281
	goto	u3280

u3281:
	goto	l155
u3280:
	line	391
	
l3207:; BSR set to: 1

	call	_menu_draw_input	;wreg free
	goto	l3107
	line	397
	
l3209:; BSR set to: 0

	movlw	high(0)
	movlb	1	; () banked
	movwf	((main@blink_timer+1))&0ffh
	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	goto	l3107
	line	398
	
l155:; BSR set to: 1

	goto	l3107
	global	start
	goto	start
	callstack 0
	line	401
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_uart_println

;; *************** function _uart_println *****************
;; Defined at:
;;		line 78 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   12[COMRAM] PTR const unsigned char 
;;		 -> STR_16(26), STR_15(24), main@buf_421(40), main@buf(40), 
;;		 -> STR_11(19), STR_10(22), STR_9(22), STR_6(24), 
;;		 -> STR_5(19), STR_4(22), STR_3(23), STR_2(21), 
;;		 -> STR_1(27), 
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
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	line	78
global __ptext1
__ptext1:
psect	text1
	file	"src\main.c"
	line	78
	
_uart_println:; BSR set to: 1

;incstack = 0
	callstack 27
	line	80
	
l2797:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	81
	
l2799:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	82
	
l2801:
	movlw	(0Ah)&0ffh
	
	call	_uart_write
	line	83
	
l86:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_println
	__end_of_uart_println:
	signat	_uart_println,4217
	global	_uart_print

;; *************** function _uart_print *****************
;; Defined at:
;;		line 70 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   10[COMRAM] PTR const unsigned char 
;;		 -> STR_16(26), STR_15(24), main@buf_421(40), main@buf(40), 
;;		 -> STR_11(19), STR_10(22), STR_9(22), STR_6(24), 
;;		 -> STR_5(19), STR_4(22), STR_3(23), STR_2(21), 
;;		 -> STR_1(27), 
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
psect	text2,class=CODE,space=0,reloc=2,group=0
	line	70
global __ptext2
__ptext2:
psect	text2
	file	"src\main.c"
	line	70
	
_uart_print:
;incstack = 0
	callstack 27
	line	72
	
l2655:
	goto	l2661
	line	74
	
l2657:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u2427
	tblrd	*
	
	movf	tablat,w
	bra	u2420
u2427:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u2420:
	
	call	_uart_write
	
l2659:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	72
	
l2661:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u2437
	tblrd	*
	
	movf	tablat,w
	bra	u2430
u2437:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u2430:
	iorlw	0
	btfss	status,2
	goto	u2441
	goto	u2440
u2441:
	goto	l2657
u2440:
	line	76
	
l83:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_print
	__end_of_uart_print:
	signat	_uart_print,4217
	global	_uart_write

;; *************** function _uart_write *****************
;; Defined at:
;;		line 63 in file "src\main.c"
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
psect	text3,class=CODE,space=0,reloc=2,group=0
	line	63
global __ptext3
__ptext3:
psect	text3
	file	"src\main.c"
	line	63
	
_uart_write:
;incstack = 0
	callstack 28
	movwf	((c:uart_write@c))^00h,c
	line	65
	
l2589:
	line	66
	
l74:
	line	65
	btfss	((c:3998))^0f00h,c,4	;volatile
	goto	u2291
	goto	u2290
u2291:
	goto	l74
u2290:
	line	67
	
l2591:
	movff	(c:uart_write@c),(c:4013)	;volatile
	line	68
	
l77:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_write
	__end_of_uart_write:
	signat	_uart_write,4217
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
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	49
global __ptext4
__ptext4:
psect	text4
	file	"src\main.c"
	line	49
	
_uart_init:
;incstack = 0
	callstack 29
	line	52
	
l2793:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	53
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	56
	
l2795:
	movlw	low(024h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	57
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	58
	movlw	low(08h)
	movwf	((c:4024))^0f00h,c	;volatile
	line	59
	movlw	low(0)
	movwf	((c:4016))^0f00h,c	;volatile
	line	60
	movlw	low(044h)
	movwf	((c:4015))^0f00h,c	;volatile
	line	61
	
l71:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
	signat	_uart_init,89
	global	_system_init

;; *************** function _system_init *****************
;; Defined at:
;;		line 86 in file "src\main.c"
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
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	86
global __ptext5
__ptext5:
psect	text5
	file	"src\main.c"
	line	86
	
_system_init:
;incstack = 0
	callstack 29
	line	89
	
l2803:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	90
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	94
	
l89:
	line	93
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u2651
	goto	u2650
u2651:
	goto	l89
u2650:
	line	97
	
l2805:
	movlw	low(0Fh)
	movwf	((c:4033))^0f00h,c	;volatile
	line	100
	movlw	low(0)
	movwf	((c:3986))^0f00h,c	;volatile
	line	101
	
l2807:
	setf	((c:3987))^0f00h,c	;volatile
	line	102
	movlw	low(0)
	movwf	((c:3988))^0f00h,c	;volatile
	line	103
	
l2809:
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	106
	
l2811:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	109
	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	110
	movlw	low(0)
	movwf	((c:3978))^0f00h,c	;volatile
	line	111
	movlw	low(0)
	movwf	((c:3979))^0f00h,c	;volatile
	line	112
	
l92:
	return	;funcret
	callstack 0
GLOBAL	__end_of_system_init
	__end_of_system_init:
	signat	_system_init,89
	global	_menu_init

;; *************** function _menu_init *****************
;; Defined at:
;;		line 74 in file "src\menu.c"
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
psect	text6,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	74
global __ptext6
__ptext6:
psect	text6
	file	"src\menu.c"
	line	74
	
_menu_init:
;incstack = 0
	callstack 29
	line	76
	
l2853:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_menu))&0ffh
	line	77
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	78
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	79
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	80
	movlw	low(0)
	movwf	(0+(_menu+05h))&0ffh
	line	81
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	82
	
l267:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_init
	__end_of_menu_init:
	signat	_menu_init,89
	global	_menu_handle_encoder

;; *************** function _menu_handle_encoder *****************
;; Defined at:
;;		line 190 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  delta           2    9[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 3F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	190
global __ptext7
__ptext7:
psect	text7
	file	"src\menu.c"
	line	190
	
_menu_handle_encoder:; BSR set to: 0

;incstack = 0
	callstack 29
	line	193
	
l2877:
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u2711
	goto	u2710
u2711:
	goto	l2887
u2710:
	line	195
	
l2879:; BSR set to: 0

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u2721
	goto	u2720

u2721:
	goto	l317
u2720:
	
l2881:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u2731
	goto	u2730
u2731:
	goto	l317
u2730:
	line	198
	
l2883:; BSR set to: 0

	movf	((c:_enable_edit_flag))^00h,c,w
	btfsc	status,2
	goto	u2741
	goto	u2740
u2741:
	movlw	1
	goto	u2750
u2740:
	movlw	0
u2750:
	movwf	((c:_enable_edit_flag))^00h,c
	goto	l317
	line	204
	
l2887:; BSR set to: 0

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u2761
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u2760
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u2761
	goto	u2760

u2761:
	goto	l2897
u2760:
	line	207
	
l2889:; BSR set to: 0

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
	goto	u2771
	goto	u2770

u2771:
	goto	l317
u2770:
	line	209
	
l2891:; BSR set to: 0

	incf	((_menu))&0ffh
	line	212
	
l2893:; BSR set to: 0

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
	goto	u2781
	goto	u2780

u2781:
	goto	l317
u2780:
	line	214
	
l2895:; BSR set to: 0

	incf	(0+(_menu+01h))&0ffh
	goto	l317
	line	218
	
l2897:; BSR set to: 0

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u2790
	goto	u2791

u2791:
	goto	l317
u2790:
	line	221
	
l2899:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u2801
	goto	u2800
u2801:
	goto	l317
u2800:
	line	223
	
l2901:; BSR set to: 0

	decf	((_menu))&0ffh
	line	226
	
l2903:; BSR set to: 0

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u2811
	goto	u2810

u2811:
	goto	l317
u2810:
	line	228
	
l2905:; BSR set to: 0

	decf	(0+(_menu+01h))&0ffh
	line	232
	
l317:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_encoder
	__end_of_menu_handle_encoder:
	signat	_menu_handle_encoder,4217
	global	_menu_handle_button

;; *************** function _menu_handle_button *****************
;; Defined at:
;;		line 235 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  press_type      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  press_type      1   14[COMRAM] unsigned char 
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
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_beep
;;		_strcpy
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2,group=0
	line	235
global __ptext8
__ptext8:
psect	text8
	file	"src\menu.c"
	line	235
	
_menu_handle_button:; BSR set to: 0

;incstack = 0
	callstack 28
	movwf	((c:menu_handle_button@press_type))^00h,c
	line	237
	
l2991:
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u2961
	goto	u2960
u2961:
	goto	l3021
u2960:
	line	239
	
l2993:; BSR set to: 0

		decf	((c:menu_handle_button@press_type))^00h,c,w
	btfss	status,2
	goto	u2971
	goto	u2970

u2971:
	goto	l3009
u2970:
	line	243
	
l2995:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u2981
	goto	u2980
u2981:
	goto	l3003
u2980:
	line	245
	
l2997:; BSR set to: 0

	movf	((c:_enable_edit_flag))^00h,c,w
	btfsc	status,2
	goto	u2991
	goto	u2990
u2991:
	goto	l3001
u2990:
	line	247
	
l2999:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:strcpy@to))^00h,c

		movlw	low(STR_52)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_52)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	248
	goto	l3003
	line	251
	
l3001:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:strcpy@to))^00h,c

		movlw	low(STR_53)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_53)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	255
	
l3003:
	movlw	low(0)
	movlb	0	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	256
	
l3005:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	257
	
l3007:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	258
	goto	l341
	line	259
	
l3009:; BSR set to: 0

		movlw	2
	xorwf	((c:menu_handle_button@press_type))^00h,c,w
	btfss	status,2
	goto	u3001
	goto	u3000

u3001:
	goto	l341
u3000:
	line	262
	
l3011:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u3011
	goto	u3010
u3011:
	goto	l3015
u3010:
	line	265
	
l3013:; BSR set to: 0

		movlw	69
	xorwf	((c:_original_value))^00h,c,w
	btfsc	status,2
	goto	u3021
	goto	u3020

u3021:
	movlw	1
	goto	u3030
u3020:
	movlw	0
u3030:
	movwf	((c:_enable_edit_flag))^00h,c
	line	267
	
l3015:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	268
	
l3017:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	269
	
l3019:; BSR set to: 0

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l341
	line	274
	
l3021:; BSR set to: 0

		decf	((c:menu_handle_button@press_type))^00h,c,w
	btfss	status,2
	goto	u3041
	goto	u3040

u3041:
	goto	l3041
u3040:
	line	277
	
l3023:; BSR set to: 0

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
	goto	u3051
	goto	u3050
u3051:
	goto	l3007
u3050:
	
l3025:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u3061
	goto	u3060
u3061:
	goto	l3007
u3060:
	line	280
	
l3027:; BSR set to: 0

		movlw	low(_original_value)
	movwf	((c:strcpy@to))^00h,c

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
	line	281
	
l3029:
		movlw	69
	xorwf	((c:_value_enable))^00h,c,w
	btfsc	status,2
	goto	u3071
	goto	u3070

u3071:
	movlw	1
	goto	u3080
u3070:
	movlw	0
u3080:
	movwf	((c:_enable_edit_flag))^00h,c
	line	283
	
l3031:
	movlw	low(01h)
	movlb	0	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	284
	
l3033:; BSR set to: 0

	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	goto	l3005
	line	293
	
l3041:; BSR set to: 0

		movlw	3
	xorwf	((c:menu_handle_button@press_type))^00h,c,w
	btfss	status,2
	goto	u3091
	goto	u3090

u3091:
	goto	l341
u3090:
	line	296
	
l3043:; BSR set to: 0

	movlw	high(0C8h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(0C8h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	299
	
l341:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_button
	__end_of_menu_handle_button:
	signat	_menu_handle_button,4217
	global	_beep

;; *************** function _beep *****************
;; Defined at:
;;		line 213 in file "src\main.c"
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
	file	"src\main.c"
	line	213
global __ptext9
__ptext9:
psect	text9
	file	"src\main.c"
	line	213
	
_beep:
;incstack = 0
	callstack 28
	line	215
	
l2663:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	216
	
l2665:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l127
	line	218
	
l2667:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u3327:
decfsz	wreg,f
	bra	u3327
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u3327
	nop2
asmopt pop

	line	216
	
l2669:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l127:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u2451
	goto	u2450

u2451:
	goto	l2667
u2450:
	
l129:
	line	220
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	221
	
l130:
	return	;funcret
	callstack 0
GLOBAL	__end_of_beep
	__end_of_beep:
	signat	_beep,4217
	global	_menu_draw_options

;; *************** function _menu_draw_options *****************
;; Defined at:
;;		line 85 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   24[COMRAM] unsigned char 
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
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
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
	line	85
global __ptext10
__ptext10:
psect	text10
	file	"src\menu.c"
	line	85
	
_menu_draw_options:
;incstack = 0
	callstack 24
	line	88
	
l2855:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	89
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_35)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_35)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	92
	
l2857:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	goto	l2873
	line	94
	
l2859:; BSR set to: 0

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	97
	
l2861:
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
	bnz	u2681
movf	(??_menu_draw_options+0+1)^00h,c,w
xorwf	(??_menu_draw_options+2+1)^00h,c,w
	btfss	status,2
	goto	u2681
	goto	u2680

u2681:
	goto	l2869
u2680:
	line	99
	
l2863:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_36)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_36)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_print_at
	line	100
	
l2865:
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
	line	101
	
l2867:
		movlw	low(STR_37)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_37)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	102
	goto	l2871
	line	105
	
l2869:; BSR set to: 0

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
	line	92
	
l2871:
	incf	((c:menu_draw_options@i))^00h,c
	
l2873:
		movlw	03h-0
	cpfslt	((c:menu_draw_options@i))^00h,c
	goto	u2691
	goto	u2690

u2691:
	goto	l277
u2690:
	
l2875:
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
	goto	u2701
	goto	u2700

u2701:
	goto	l2859
u2700:
	line	108
	
l277:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_options
	__end_of_menu_draw_options:
	signat	_menu_draw_options,89
	global	_menu_draw_input

;; *************** function _menu_draw_input *****************
;; Defined at:
;;		line 111 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1   29[BANK0 ] unsigned char 
;;  j               1   28[BANK0 ] unsigned char 
;;  blank          10    0[BANK0 ] unsigned char [10]
;;  val_len         1   23[BANK0 ] unsigned char 
;;  val_len         1   22[BANK0 ] unsigned char 
;;  value_buf      12   10[BANK0 ] unsigned char [12]
;;  item_idx        1   32[BANK0 ] unsigned char 
;;  val_len         1   30[BANK0 ] unsigned char 
;;  i               1   31[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 3F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      33       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2      33       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       35 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
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
	line	111
global __ptext11
__ptext11:
psect	text11
	file	"src\menu.c"
	line	111
	
_menu_draw_input:
;incstack = 0
	callstack 24
	line	114
	
l2907:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	115
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_38)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_38)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	118
	
l2909:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@i))&0ffh
	goto	l2987
	line	120
	
l2911:; BSR set to: 0

	movf	(0+(_menu+01h))&0ffh,w
	addwf	((menu_draw_input@i))&0ffh,w
	movwf	((menu_draw_input@item_idx))&0ffh
	line	121
	
l2913:; BSR set to: 0

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_clear_line
	line	124
	
l2915:
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
	line	129
	
l2917:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u2821
	goto	u2820

u2821:
	goto	l2975
u2820:
	line	131
	
l2919:; BSR set to: 0

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u2831
	goto	u2830
u2831:
	goto	l2973
u2830:
	line	134
	
l2921:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u2841
	goto	u2840
u2841:
	goto	l2935
u2840:
	line	137
	
l2923:; BSR set to: 0

	movf	((menu_draw_input@item_idx))&0ffh,w
	btfss	status,2
	goto	u2851
	goto	u2850
u2851:
	goto	l2933
u2850:
	line	139
	
l2925:; BSR set to: 0

	movf	((c:_enable_edit_flag))^00h,c,w
	btfss	status,2
	goto	u2861
	goto	u2860
u2861:
	goto	l2929
u2860:
	
l2927:; BSR set to: 0

		movlw	low(STR_41)
	movwf	((_menu_draw_input$681))&0ffh
	movlw	high(STR_41)
	movwf	((_menu_draw_input$681+1))&0ffh

	goto	l2931
	
l2929:; BSR set to: 0

		movlw	low(STR_40)
	movwf	((_menu_draw_input$681))&0ffh
	movlw	high(STR_40)
	movwf	((_menu_draw_input$681+1))&0ffh

	
l2931:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_39)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_39)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_menu_draw_input$681),0+((c:?_sprintf)+04h)
	movff	(_menu_draw_input$681+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	140
	goto	l2977
	line	143
	
l2933:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_42)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_42)
	movwf	((c:sprintf@f+1))^00h,c

	movf	((menu_draw_input@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+04h)
	movff	postdec2,1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l2977
	line	149
	
l2935:; BSR set to: 0

	movf	((menu_draw_input@item_idx))&0ffh,w
	btfss	status,2
	goto	u2871
	goto	u2870
u2871:
	goto	l2957
u2870:
	line	151
	
l2937:; BSR set to: 0

	movf	((c:_enable_edit_flag))^00h,c,w
	btfss	status,2
	goto	u2881
	goto	u2880
u2881:
	goto	l2941
u2880:
	
l2939:; BSR set to: 0

		movlw	low(STR_44)
	movwf	((_menu_draw_input$687))&0ffh
	movlw	high(STR_44)
	movwf	((_menu_draw_input$687+1))&0ffh

	goto	l2943
	
l2941:; BSR set to: 0

		movlw	low(STR_43)
	movwf	((_menu_draw_input$687))&0ffh
	movlw	high(STR_43)
	movwf	((_menu_draw_input$687+1))&0ffh

	
l2943:; BSR set to: 0

		movff	(_menu_draw_input$687),(c:strlen@s)
	movff	(_menu_draw_input$687+1),(c:strlen@s+1)

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len))&0ffh
	line	152
	
l2945:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_45)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_45)
	movwf	((c:sprintf@f+1))^00h,c

	call	_sprintf	;wreg free
	line	153
	
l2947:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@j))&0ffh
	goto	l2953
	line	154
	
l2949:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcat@to))^00h,c

		movlw	low(STR_46)
	movwf	((c:strcat@from))^00h,c
	movlw	high(STR_46)
	movwf	((c:strcat@from+1))^00h,c

	call	_strcat	;wreg free
	line	153
	
l2951:
	movlb	0	; () banked
	incf	((menu_draw_input@j))&0ffh
	
l2953:; BSR set to: 0

		movf	((menu_draw_input@val_len))&0ffh,w
	subwf	((menu_draw_input@j))&0ffh,w
	btfss	status,0
	goto	u2891
	goto	u2890

u2891:
	goto	l2949
u2890:
	line	155
	
l2955:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcat@to))^00h,c

		movlw	low(STR_47)
	movwf	((c:strcat@from))^00h,c
	movlw	high(STR_47)
	movwf	((c:strcat@from+1))^00h,c

	call	_strcat	;wreg free
	line	156
	goto	l2977
	line	159
	
l2957:; BSR set to: 0

	movf	((menu_draw_input@item_idx))&0ffh,w
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
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_692))&0ffh
	line	160
	
l2959:; BSR set to: 0

	lfsr	2,(menu_draw_input@F2299)
	lfsr	1,(menu_draw_input@blank)
	movlw	10-1
u2901:
	movff	plusw2,plusw1
	decf	wreg
	bc	u2901

	line	161
	
l2961:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j_695))&0ffh
	goto	l2967
	line	162
	
l2963:; BSR set to: 0

		movlw	low(menu_draw_input@blank)
	movwf	((c:strcat@to))^00h,c

		movlw	low(STR_48)
	movwf	((c:strcat@from))^00h,c
	movlw	high(STR_48)
	movwf	((c:strcat@from+1))^00h,c

	call	_strcat	;wreg free
	line	161
	
l2965:
	movlb	0	; () banked
	incf	((menu_draw_input@j_695))&0ffh
	
l2967:; BSR set to: 0

		movf	((menu_draw_input@val_len_692))&0ffh,w
	subwf	((menu_draw_input@j_695))&0ffh,w
	btfss	status,0
	goto	u2911
	goto	u2910

u2911:
	goto	l2963
u2910:
	line	163
	
l2969:; BSR set to: 0

		movlw	low(menu_draw_input@blank)
	movwf	((c:strcat@to))^00h,c

		movlw	low(STR_49)
	movwf	((c:strcat@from))^00h,c
	movlw	high(STR_49)
	movwf	((c:strcat@from+1))^00h,c

	call	_strcat	;wreg free
	line	164
	
l2971:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c

		movlw	low(menu_draw_input@blank)
	movwf	((c:strcpy@from))^00h,c
	clrf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l2977
	line	171
	
l2973:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_50)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_50)
	movwf	((c:sprintf@f+1))^00h,c

	movf	((menu_draw_input@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+04h)
	movff	postdec2,1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l2977
	line	177
	
l2975:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c

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
	line	181
	
l2977:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_699))&0ffh
	line	182
	
l2979:; BSR set to: 0

	movf	((menu_draw_input@val_len_699))&0ffh,w
	btfsc	status,2
	goto	u2921
	goto	u2920
u2921:
	goto	l2985
u2920:
	
l2981:; BSR set to: 0

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
		movlw	low(STR_51)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_51)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u2931
	goto	u2930

u2931:
	goto	l2985
u2930:
	line	184
	
l2983:; BSR set to: 0

	movf	((menu_draw_input@val_len_699))&0ffh,w
	sublw	low(014h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	118
	
l2985:
	movlb	0	; () banked
	incf	((menu_draw_input@i))&0ffh
	
l2987:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_input@i))&0ffh
	goto	u2941
	goto	u2940

u2941:
	goto	l312
u2940:
	
l2989:; BSR set to: 0

	movf	((menu_draw_input@i))&0ffh,w
	movff	0+(_menu+01h),??_menu_draw_input+0+0
	clrf	(??_menu_draw_input+0+0+1)^00h,c
	addwf	(??_menu_draw_input+0+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_input+0+1)^00h,c
	btfsc	(??_menu_draw_input+0+1)^00h,c,7
	goto	u2951
	movf	(??_menu_draw_input+0+1)^00h,c,w
	bnz	u2950
	movlw	12
	subwf	 (??_menu_draw_input+0+0)^00h,c,w
	btfss	status,0
	goto	u2951
	goto	u2950

u2951:
	goto	l2911
u2950:
	line	187
	
l312:; BSR set to: 0

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
;;		 -> STR_44(9), STR_43(8), menu_draw_input@value_buf(12), value_back(1), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_highbp(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(10), value_enable(10), 
;; Auto vars:     Size  Location     Type
;;  cp              2   11[COMRAM] PTR const unsigned char 
;;		 -> STR_44(9), STR_43(8), menu_draw_input@value_buf(12), value_back(1), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_highbp(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(10), value_enable(10), 
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
	
_strlen:; BSR set to: 0

;incstack = 0
	callstack 28
	line	8
	
l2755:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l2759
	line	10
	
l2757:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l2759:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u2577
	tblrd	*
	
	movf	tablat,w
	bra	u2570
u2577:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u2570:
	iorlw	0
	btfss	status,2
	goto	u2581
	goto	u2580
u2581:
	goto	l2757
u2580:
	line	12
	
l2761:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l1065:
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
;;		 -> original_value(10), menu_draw_input@value_buf(12), value_enable(10), 
;;  from            2   10[COMRAM] PTR const unsigned char 
;;		 -> STR_53(9), STR_52(8), menu_draw_input@blank(10), value_back(1), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_highbp(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(10), value_enable(10), 
;; Auto vars:     Size  Location     Type
;;  cp              1   12[COMRAM] PTR unsigned char 
;;		 -> original_value(10), menu_draw_input@value_buf(12), value_enable(10), 
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
	
l2775:
		movff	(c:strcpy@to),(c:strcpy@cp)

	line	19
	goto	l2779
	line	20
	
l2777:
	incf	((c:strcpy@cp))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l2779:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movf	((c:strcpy@cp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u2617
	tblrd	*
	
	movf	tablat,w
	bra	u2610
u2617:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u2610:
	movwf	indf2
	movf	indf2,w
	btfss	status,2
	goto	u2621
	goto	u2620
u2621:
	goto	l2777
u2620:
	line	24
	
l1059:
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
;;		 -> value_back(1), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_highbp(10), 
;;		 -> value_scale20(10), value_scale4(10), value_sensor(10), value_enable(10), 
;;  s2              2   11[COMRAM] PTR const unsigned char 
;;		 -> STR_51(1), 
;; Auto vars:     Size  Location     Type
;;  r               1   15[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  2    9[COMRAM] int 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 3F/0
;;		On exit  : 3F/0
;;		Unchanged: 3F/0
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
	
l2781:; BSR set to: 0

	goto	l2785
	line	38
	
l2783:; BSR set to: 0

	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l2785:; BSR set to: 0

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
	goto	u2631
	goto	u2630
u2631:
	goto	l2789
u2630:
	
l2787:; BSR set to: 0

	movff	(c:strcmp@s1),fsr2l
	movff	(c:strcmp@s1+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u2641
	goto	u2640
u2641:
	goto	l2783
u2640:
	line	41
	
l2789:; BSR set to: 0

	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l1053:; BSR set to: 0

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
;;		 -> menu_draw_input@blank(10), menu_draw_input@value_buf(12), 
;;  from            2   10[COMRAM] PTR const unsigned char 
;;		 -> STR_49(2), STR_48(2), STR_47(2), STR_46(2), 
;; Auto vars:     Size  Location     Type
;;  cp              1   12[COMRAM] PTR unsigned char 
;;		 -> menu_draw_input@blank(10), menu_draw_input@value_buf(12), 
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
	
_strcat:; BSR set to: 0

;incstack = 0
	callstack 28
	line	18
	
l2765:
		movff	(c:strcat@to),(c:strcat@cp)

	line	19
	goto	l2769
	line	20
	
l2767:
	incf	((c:strcat@cp))^00h,c
	line	19
	
l2769:
	movf	((c:strcat@cp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u2591
	goto	u2590
u2591:
	goto	l2767
u2590:
	goto	l2773
	line	22
	
l2771:
	incf	((c:strcat@cp))^00h,c
	line	23
	infsnz	((c:strcat@from))^00h,c
	incf	((c:strcat@from+1))^00h,c
	line	21
	
l2773:
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
	goto	u2601
	goto	u2600
u2601:
	goto	l2771
u2600:
	line	26
	
l1045:
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
;;  sp              2   21[COMRAM] PTR unsigned char 
;;		 -> menu_draw_input@value_buf(12), main@buf_421(40), main@buf(40), 
;;  f               2   23[COMRAM] PTR const unsigned char 
;;		 -> STR_50(5), STR_45(2), STR_42(5), STR_39(5), 
;;		 -> STR_14(17), STR_13(30), STR_12(23), 
;; Auto vars:     Size  Location     Type
;;  tmpval          4    0        struct .
;;  val             2   35[COMRAM] unsigned int 
;;  cp              2   33[COMRAM] PTR const unsigned char 
;;		 -> STR_54(7), ?_sprintf(2), STR_41(9), STR_40(8), 
;;		 -> value_back(1), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_highbp(10), 
;;		 -> value_scale20(10), value_scale4(10), value_sensor(10), value_enable(10), 
;;  len             2    0        unsigned int 
;;  c               1   37[COMRAM] unsigned char 
;;  ap              1   32[COMRAM] PTR void [1]
;;		 -> ?_sprintf(2), 
;;  prec            1   31[COMRAM] char 
;;  flag            1   30[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   21[COMRAM] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3E/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         8       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         8       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        17       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       17 bytes
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
	
l2671:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l2741
	line	555
	
l2673:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u2461
	goto	u2460

u2461:
	goto	l2679
u2460:
	line	558
	
l2675:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l2677:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l2741
	line	565
	
l2679:
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	line	661
	goto	l2699
	line	760
	
l2681:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l2683:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l2685:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u2471
	goto	u2470

u2471:
	goto	l2695
u2470:
	line	767
	
l2687:
		movlw	low(STR_54)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_54)
	movwf	((c:sprintf@cp+1))^00h,c

	goto	l2695
	line	804
	
l2689:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u2487
	tblrd	*
	
	movf	tablat,w
	bra	u2480
u2487:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u2480:
	movwf	indf2
	
l2691:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l2693:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	803
	
l2695:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u2497
	tblrd	*
	
	movf	tablat,w
	bra	u2490
u2497:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u2490:
	iorlw	0
	btfss	status,2
	goto	u2501
	goto	u2500
u2501:
	goto	l2689
u2500:
	goto	l2741
	line	661
	
l2699:
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
	goto	l2743
	xorlw	100^0	; case 100
	skipnz
	goto	l2701
	xorlw	105^100	; case 105
	skipnz
	goto	l2701
	xorlw	115^105	; case 115
	skipnz
	goto	l2681
	goto	l2741

	line	1285
	
l2701:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l2703:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l2705:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u2510
	goto	u2511

u2511:
	goto	l2711
u2510:
	line	1288
	
l2707:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l2709:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	line	1331
	
l2711:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	line	1332
	
l2717:
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
	goto	u2521
	goto	u2520

u2521:
	goto	l2721
u2520:
	goto	l2725
	line	1331
	
l2721:
	incf	((c:sprintf@c))^00h,c
	
l2723:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u2531
	goto	u2530

u2531:
	goto	l2717
u2530:
	line	1464
	
l2725:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u2541
	goto	u2540
u2541:
	goto	l2731
u2540:
	line	1465
	
l2727:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(02Dh)
	movwf	indf2
	
l2729:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1498
	
l2731:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l2739
	line	1515
	
l2733:
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
	
l2735:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l2737:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l2739:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u2551
	goto	u2550

u2551:
	goto	l2733
u2550:
	line	553
	
l2741:
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
	goto	u2561
	goto	u2560
u2561:
	goto	l2673
u2560:
	line	1564
	
l2743:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	clrf	indf2
	line	1567
	
l374:
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
;;		On entry : 0/1
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
	
l2639:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u2391
	goto	u2390

u2391:
	goto	l866
u2390:
	line	13
	
l2641:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l2645
	line	15
	
l2643:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l2645:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l2643
u2400:
	line	19
	
l2647:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u2411
	goto	u2410

u2411:
	goto	l2651
u2410:
	line	20
	
l2649:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l2651:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l2653:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l2647
	line	23
	
l866:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l873:
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
;;  quotient        2   14[COMRAM] unsigned int 
;;  counter         1   13[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    9[COMRAM] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/1
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
	
l2617:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l2619:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u2361
	goto	u2360

u2361:
	goto	l856
u2360:
	line	15
	
l2621:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l2625
	line	17
	
l2623:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l2625:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l2623
u2370:
	line	21
	
l2627:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l2629:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u2381
	goto	u2380

u2381:
	goto	l2635
u2380:
	line	23
	
l2631:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l2633:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l2635:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l2637:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l2627
	line	28
	
l856:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l863:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_lcd_print_at

;; *************** function _lcd_print_at *****************
;; Defined at:
;;		line 60 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   15[COMRAM] unsigned char 
;;  str             2   16[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_input@value_buf(12), STR_38(8), STR_36(2), STR_35(8), 
;;		 -> STR_33(5), STR_32(8), STR_31(8), STR_30(8), 
;;		 -> STR_29(9), STR_28(6), STR_27(6), STR_26(8), 
;;		 -> STR_25(11), STR_24(10), STR_23(7), STR_22(7), 
;;		 -> STR_21(5), STR_20(6), STR_19(13), STR_18(11), 
;;		 -> STR_17(10), 
;; Auto vars:     Size  Location     Type
;;  row             1   18[COMRAM] unsigned char 
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
;; This function uses a non-reentrant model
;;
psect	text19,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	60
global __ptext19
__ptext19:
psect	text19
	file	"src\menu.c"
	line	60
	
_lcd_print_at:
;incstack = 0
	callstack 24
	movwf	((c:lcd_print_at@row))^00h,c
	line	62
	
l2747:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	63
	
l2749:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	64
	
l261:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print_at
	__end_of_lcd_print_at:
	signat	_lcd_print_at,12409
	global	_lcd_clear_line

;; *************** function _lcd_clear_line *****************
;; Defined at:
;;		line 67 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  row             1   15[COMRAM] unsigned char 
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
;; This function uses a non-reentrant model
;;
psect	text20,class=CODE,space=0,reloc=2,group=0
	line	67
global __ptext20
__ptext20:
psect	text20
	file	"src\menu.c"
	line	67
	
_lcd_clear_line:
;incstack = 0
	callstack 24
	movwf	((c:lcd_clear_line@row))^00h,c
	line	69
	
l2751:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	70
	
l2753:
		movlw	low(STR_34)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_34)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	71
	
l264:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear_line
	__end_of_lcd_clear_line:
	signat	_lcd_clear_line,4217
	global	_lcd_set_cursor

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 193 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   12[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  row             1   14[COMRAM] unsigned char 
;;  pos             1   13[COMRAM] unsigned char 
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
;; Hardware stack levels required when called: 4
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
	line	193
global __ptext21
__ptext21:
psect	text21
	file	"src\main.c"
	line	193
	
_lcd_set_cursor:
;incstack = 0
	callstack 24
	movwf	((c:lcd_set_cursor@row))^00h,c
	line	195
	
l2593:
	movff	(c:lcd_set_cursor@col),(c:lcd_set_cursor@pos)
	line	196
	
l2595:
		decf	((c:lcd_set_cursor@row))^00h,c,w
	btfss	status,2
	goto	u2301
	goto	u2300

u2301:
	goto	l2599
u2300:
	line	197
	
l2597:
	movlw	(040h)&0ffh
	addwf	((c:lcd_set_cursor@pos))^00h,c
	goto	l2607
	line	198
	
l2599:
		movlw	2
	xorwf	((c:lcd_set_cursor@row))^00h,c,w
	btfss	status,2
	goto	u2311
	goto	u2310

u2311:
	goto	l2603
u2310:
	line	199
	
l2601:
	movlw	(014h)&0ffh
	addwf	((c:lcd_set_cursor@pos))^00h,c
	goto	l2607
	line	200
	
l2603:
		movlw	3
	xorwf	((c:lcd_set_cursor@row))^00h,c,w
	btfss	status,2
	goto	u2321
	goto	u2320

u2321:
	goto	l2607
u2320:
	line	201
	
l2605:
	movlw	(054h)&0ffh
	addwf	((c:lcd_set_cursor@pos))^00h,c
	line	202
	
l2607:
	movf	((c:lcd_set_cursor@pos))^00h,c,w
	iorlw	low(080h)
	
	call	_lcd_cmd
	line	203
	
l118:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
	signat	_lcd_set_cursor,8313
	global	_lcd_print

;; *************** function _lcd_print *****************
;; Defined at:
;;		line 205 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   11[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_input@value_buf(12), STR_38(8), STR_37(2), STR_36(2), 
;;		 -> STR_35(8), STR_34(21), STR_33(5), STR_32(8), 
;;		 -> STR_31(8), STR_30(8), STR_29(9), STR_28(6), 
;;		 -> STR_27(6), STR_26(8), STR_25(11), STR_24(10), 
;;		 -> STR_23(7), STR_22(7), STR_21(5), STR_20(6), 
;;		 -> STR_19(13), STR_18(11), STR_17(10), STR_8(15), 
;;		 -> STR_7(13), 
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
;; Hardware stack levels required when called: 4
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
	line	205
global __ptext22
__ptext22:
psect	text22
	file	"src\main.c"
	line	205
	
_lcd_print:
;incstack = 0
	callstack 24
	line	207
	
l2609:
	goto	l2615
	line	209
	
l2611:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u2337
	tblrd	*
	
	movf	tablat,w
	bra	u2330
u2337:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u2330:
	
	call	_lcd_data
	
l2613:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	207
	
l2615:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u2347
	tblrd	*
	
	movf	tablat,w
	bra	u2340
u2347:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u2340:
	iorlw	0
	btfss	status,2
	goto	u2351
	goto	u2350
u2351:
	goto	l2611
u2350:
	line	211
	
l124:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print
	__end_of_lcd_print:
	signat	_lcd_print,4217
	global	_lcd_data

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 140 in file "src\main.c"
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
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_lcd_write_nibble
;; This function is called by:
;;		_lcd_print
;;		_main
;; This function uses a non-reentrant model
;;
psect	text23,class=CODE,space=0,reloc=2,group=0
	line	140
global __ptext23
__ptext23:
psect	text23
	file	"src\main.c"
	line	140
	
_lcd_data:
;incstack = 0
	callstack 24
	movwf	((c:lcd_data@data))^00h,c
	line	142
	
l2583:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	143
	
l2585:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	144
	movf	((c:lcd_data@data))^00h,c,w
	
	call	_lcd_write_nibble
	line	145
	
l2587:
	asmopt push
asmopt off
	movlw	133
u3337:
decfsz	wreg,f
	bra	u3337
	nop
asmopt pop

	line	146
	
l104:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
	signat	_lcd_data,4217
	global	_lcd_init

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 148 in file "src\main.c"
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
psect	text24,class=CODE,space=0,reloc=2,group=0
	line	148
global __ptext24
__ptext24:
psect	text24
	file	"src\main.c"
	line	148
	
_lcd_init:
;incstack = 0
	callstack 26
	line	151
	
l2813:
	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u3347:
decfsz	wreg,f
	bra	u3347
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u3347
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u3347
	nop
asmopt pop

	line	154
	
l2815:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	155
	
l2817:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	158
	
l2819:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	159
	
l2821:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u3357:
decfsz	wreg,f
	bra	u3357
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u3357
asmopt pop

	line	160
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	161
	
l2823:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u3367:
decfsz	wreg,f
	bra	u3367
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u3367
	nop2
asmopt pop

	line	162
	
l2825:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	163
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u3377:
decfsz	wreg,f
	bra	u3377
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u3377
	nop2
asmopt pop

	line	166
	
l2827:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	167
	
l2829:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u3387:
decfsz	wreg,f
	bra	u3387
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u3387
	nop2
asmopt pop

	line	170
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	173
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	176
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	177
	
l2831:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_init+0+0)^00h,c
	movlw	198
u3397:
decfsz	wreg,f
	bra	u3397
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u3397
	nop2
asmopt pop

	line	180
	
l2833:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	183
	
l2835:
	movlw	(02h)&0ffh
	
	call	_lcd_cmd
	line	184
	
l2837:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_init+0+0)^00h,c
	movlw	198
u3407:
decfsz	wreg,f
	bra	u3407
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u3407
	nop2
asmopt pop

	line	185
	
l107:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
	signat	_lcd_init,89
	global	_lcd_clear

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 187 in file "src\main.c"
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
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_lcd_cmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text25,class=CODE,space=0,reloc=2,group=0
	line	187
global __ptext25
__ptext25:
psect	text25
	file	"src\main.c"
	line	187
	
_lcd_clear:
;incstack = 0
	callstack 26
	line	189
	
l2839:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	190
	
l2841:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u3417:
decfsz	wreg,f
	bra	u3417
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u3417
	nop2
asmopt pop

	line	191
	
l110:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
	signat	_lcd_clear,89
	global	_lcd_cmd

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 132 in file "src\main.c"
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
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_lcd_write_nibble
;; This function is called by:
;;		_lcd_init
;;		_lcd_clear
;;		_lcd_set_cursor
;;		_main
;; This function uses a non-reentrant model
;;
psect	text26,class=CODE,space=0,reloc=2,group=0
	line	132
global __ptext26
__ptext26:
psect	text26
	file	"src\main.c"
	line	132
	
_lcd_cmd:
;incstack = 0
	callstack 24
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	134
	
l2577:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	135
	
l2579:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	136
	movf	((c:lcd_cmd@cmd))^00h,c,w
	
	call	_lcd_write_nibble
	line	137
	
l2581:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u3427:
decfsz	wreg,f
	bra	u3427
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u3427
	nop2
asmopt pop

	line	138
	
l101:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
	signat	_lcd_cmd,4217
	global	_lcd_write_nibble

;; *************** function _lcd_write_nibble *****************
;; Defined at:
;;		line 123 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  nibble          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  nibble          1    9[COMRAM] unsigned char 
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
;;		_lcd_pulse_enable
;; This function is called by:
;;		_lcd_cmd
;;		_lcd_data
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text27,class=CODE,space=0,reloc=2,group=0
	line	123
global __ptext27
__ptext27:
psect	text27
	file	"src\main.c"
	line	123
	
_lcd_write_nibble:
;incstack = 0
	callstack 24
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	126
	
l2573:
	movlw	(0F0h)&0ffh
	andwf	((c:3977))^0f00h,c	;volatile
	line	128
	movf	((c:lcd_write_nibble@nibble))^00h,c,w
	andlw	low(0Fh)
	iorwf	((c:3977))^0f00h,c	;volatile
	line	129
	
l2575:
	call	_lcd_pulse_enable	;wreg free
	line	130
	
l98:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_write_nibble
	__end_of_lcd_write_nibble:
	signat	_lcd_write_nibble,4217
	global	_lcd_pulse_enable

;; *************** function _lcd_pulse_enable *****************
;; Defined at:
;;		line 115 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_write_nibble
;; This function uses a non-reentrant model
;;
psect	text28,class=CODE,space=0,reloc=2,group=0
	line	115
global __ptext28
__ptext28:
psect	text28
	file	"src\main.c"
	line	115
	
_lcd_pulse_enable:
;incstack = 0
	callstack 24
	line	117
	
l2569:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	118
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	119
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	120
	
l2571:
	asmopt push
asmopt off
	movlw	160
u3437:
	nop2
decfsz	wreg,f
	bra	u3437
asmopt pop

	line	121
	
l95:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_pulse_enable
	__end_of_lcd_pulse_enable:
	signat	_lcd_pulse_enable,89
	global	_encoder_init

;; *************** function _encoder_init *****************
;; Defined at:
;;		line 106 in file "src\encoder.c"
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
	line	106
global __ptext29
__ptext29:
psect	text29
	file	"src\encoder.c"
	line	106
	
_encoder_init:
;incstack = 0
	callstack 29
	line	109
	
l2843:
	movlw	low(0C4h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	110
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	113
	
l2845:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	114
	
l2847:
	bsf	((c:4082))^0f00h,c,5	;volatile
	line	115
	
l2849:
	bsf	((c:4082))^0f00h,c,7	;volatile
	line	118
	
l2851:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u2661
	goto	u2660
u2661:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u2668
u2660:
	clrf	(??_encoder_init+0+0)^00h,c
u2668:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u2671
	goto	u2670
u2671:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u2678
u2670:
	clrf	(??_encoder_init+1+0)^00h,c
u2678:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:_enc_state))^00h,c
	line	119
	
l208:
	return	;funcret
	callstack 0
GLOBAL	__end_of_encoder_init
	__end_of_encoder_init:
	signat	_encoder_init,89
	global	_isr

;; *************** function _isr *****************
;; Defined at:
;;		line 28 in file "src\encoder.c"
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
	line	28
	
_isr:
;incstack = 0
	callstack 24
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
	line	30
	
i2l2509:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u215_41
	goto	i2u215_40
i2u215_41:
	goto	i2l205
i2u215_40:
	line	33
	
i2l2511:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	34
	
i2l2513:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	37
	
i2l2515:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u216_41
	goto	i2u216_40
i2u216_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u216_48
i2u216_40:
	clrf	(??_isr+0+0)^00h,c
i2u216_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u217_41
	goto	i2u217_40
i2u217_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u217_48
i2u217_40:
	clrf	(??_isr+1+0)^00h,c
i2u217_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	38
	
i2l2517:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	41
	
i2l2519:
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
	line	44
	
i2l2521:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u218_41
	goto	i2u218_40
i2u218_41:
	goto	i2l2535
i2u218_40:
	line	46
	
i2l2523:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u219_41
	goto	i2u219_40

i2u219_41:
	goto	i2l2529
i2u219_40:
	line	48
	
i2l2525:
	movlb	0	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	49
	
i2l2527:; BSR set to: 0

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	50
	goto	i2l2535
	line	51
	
i2l2529:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u220_41
	goto	i2u220_40

i2u220_41:
	goto	i2l2535
i2u220_40:
	line	53
	
i2l2531:
	movlb	0	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	goto	i2l2527
	line	58
	
i2l2535:
	movff	(c:isr@new_state),(c:_enc_state)
	line	61
	
i2l2537:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	62
	
i2l2539:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u221_41
	goto	i2u221_40

i2u221_41:
	goto	i2l2563
i2u221_40:
	line	64
	
i2l2541:
	incf	((c:_btn_debounce))^00h,c
	line	65
	
i2l2543:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u222_41
	goto	i2u222_40

i2u222_41:
	goto	i2l205
i2u222_40:
	line	67
	
i2l2545:
	movff	(c:isr@btn),(c:_last_btn)
	line	68
	
i2l2547:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	70
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u223_41
	goto	i2u223_40
i2u223_41:
	goto	i2l2551
i2u223_40:
	line	73
	
i2l2549:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	74
	goto	i2l205
	line	78
	
i2l2551:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u224_41
	goto	i2u224_40

i2u224_41:
	goto	i2l2555
i2u224_40:
	line	80
	
i2l2553:
	movlw	low(03h)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	81
	goto	i2l199
	line	82
	
i2l2555:
		movlw	132
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	3
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u225_41
	goto	i2u225_40

i2u225_41:
	goto	i2l2559
i2u225_40:
	line	84
	
i2l2557:
	movlw	low(02h)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	85
	goto	i2l199
	line	86
	
i2l2559:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u226_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u226_41
	goto	i2u226_40

i2u226_41:
	goto	i2l199
i2u226_40:
	line	88
	
i2l2561:
	movlw	low(01h)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	90
	
i2l199:
	movlw	low(01h)
	movlb	0	; () banked
	movwf	((_button_pressed))&0ffh	;volatile
	goto	i2l205
	line	96
	
i2l2563:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	98
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u227_41
	goto	i2u227_40
i2u227_41:
	goto	i2l205
i2u227_40:
	
i2l2565:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u228_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u228_41
	goto	i2u228_40

i2u228_41:
	goto	i2l205
i2u228_40:
	line	100
	
i2l2567:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	104
	
i2l205:
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
