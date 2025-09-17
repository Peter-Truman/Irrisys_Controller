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
	FNCALL	_menu_handle_encoder,_beep
	FNCALL	_menu_handle_button,_beep
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
	FNCALL	_lcd_init,_uart_println
	FNCALL	_uart_println,_uart_print
	FNCALL	_uart_println,_uart_write
	FNCALL	_uart_print,_uart_write
	FNCALL	_lcd_clear,_lcd_cmd
	FNCALL	_lcd_cmd,_lcd_write_nibble
	FNROOT	_main
	FNCALL	intlevel2,_isr
	global	intlevel2
	FNROOT	intlevel2
	global	menu_draw_input@F2295
	global	_options_menu
	global	_last_btn
	global	_value_sensor
	global	_value_enable
	global	_value_scale20
	global	_value_scale4
	global	_input_menu
	global	_value_display
	global	_value_rlyslp
	global	_value_rlyplp
	global	_value_rlyhigh
	global	_value_slpbp
	global	_value_plpbp
	global	_value_highbp
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"src\menu.c"
	line	139

;initializer for menu_draw_input@F2295
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
	line	16

;initializer for _options_menu
		db	low(STR_28)
	db	high(STR_28)

		db	low(STR_29)
	db	high(STR_29)

		db	low(STR_30)
	db	high(STR_30)

		db	low(STR_31)
	db	high(STR_31)

		db	low(STR_32)
	db	high(STR_32)

	file	"src\encoder.c"
	line	18

;initializer for _last_btn
	db	low(01h)
	file	"src\menu.c"
	line	25

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
	line	24

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
	line	27

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
	line	26

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
psect	idataBANK1,class=CODE,space=0,delta=1,noexec
global __pidataBANK1
__pidataBANK1:
	line	38

;initializer for _input_menu
		db	low(STR_33)
	db	high(STR_33)

		db	low(_value_enable)
	db	0

	db	low(01h)
		db	low(STR_34)
	db	high(STR_34)

		db	low(_value_sensor)
	db	0

	db	low(01h)
		db	low(STR_35)
	db	high(STR_35)

		db	low(_value_scale4)
	db	0

	db	low(01h)
		db	low(STR_36)
	db	high(STR_36)

		db	low(_value_scale20)
	db	0

	db	low(01h)
		db	low(STR_37)
	db	high(STR_37)

		db	low(_value_highbp)
	db	high(_value_highbp)

	db	low(01h)
		db	low(STR_38)
	db	high(STR_38)

		db	low(_value_plpbp)
	db	high(_value_plpbp)

	db	low(01h)
		db	low(STR_39)
	db	high(STR_39)

		db	low(_value_slpbp)
	db	high(_value_slpbp)

	db	low(01h)
		db	low(STR_40)
	db	high(STR_40)

		db	low(_value_rlyhigh)
	db	high(_value_rlyhigh)

	db	low(01h)
		db	low(STR_41)
	db	high(STR_41)

		db	low(_value_rlyplp)
	db	high(_value_rlyplp)

	db	low(01h)
		db	low(STR_42)
	db	high(STR_42)

		db	low(_value_rlyslp)
	db	high(_value_rlyslp)

	db	low(01h)
		db	low(STR_43)
	db	high(STR_43)

		db	low(_value_display)
	db	high(_value_display)

	db	low(01h)
		db	low(STR_44)
	db	high(STR_44)

		db	low(_value_back)
	db	0

	db	low(0)
	line	34

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
	line	33

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
	line	32

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
	line	31

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
	line	30

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
	line	29

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
	line	28

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
	global	_value_back
	global	_menu
	global	_encoder_count
	global	_button_event
	global	_button_pressed
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
	
STR_6:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	83	;'S'
	db	101	;'e'
	db	116	;'t'
	db	116	;'t'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	52	;'4'
	db	45
	db	98	;'b'
	db	105	;'i'
	db	116	;'t'
	db	32
	db	109	;'m'
	db	111	;'o'
	db	100	;'d'
	db	101	;'e'
	db	32
	db	48	;'0'
	db	120	;'x'
	db	48	;'0'
	db	50	;'2'
	db	0
	
STR_9:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	67	;'C'
	db	108	;'l'
	db	101	;'e'
	db	97	;'a'
	db	114	;'r'
	db	32
	db	100	;'d'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	32
	db	48	;'0'
	db	120	;'x'
	db	48	;'0'
	db	49	;'1'
	db	0
	
STR_7:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	70	;'F'
	db	117	;'u'
	db	110	;'n'
	db	99	;'c'
	db	116	;'t'
	db	105	;'i'
	db	111	;'o'
	db	110	;'n'
	db	32
	db	115	;'s'
	db	101	;'e'
	db	116	;'t'
	db	32
	db	48	;'0'
	db	120	;'x'
	db	50	;'2'
	db	56	;'8'
	db	0
	
STR_8:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	32
	db	79	;'O'
	db	70	;'F'
	db	70	;'F'
	db	32
	db	48	;'0'
	db	120	;'x'
	db	48	;'0'
	db	56	;'8'
	db	0
	
STR_13:
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
	
STR_10:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	69	;'E'
	db	110	;'n'
	db	116	;'t'
	db	114	;'r'
	db	121	;'y'
	db	32
	db	109	;'m'
	db	111	;'o'
	db	100	;'d'
	db	101	;'e'
	db	32
	db	48	;'0'
	db	120	;'x'
	db	48	;'0'
	db	54	;'6'
	db	0
	
STR_11:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	32
	db	79	;'O'
	db	78	;'N'
	db	32
	db	48	;'0'
	db	120	;'x'
	db	48	;'0'
	db	67	;'C'
	db	0
	
STR_27:
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
	
STR_2:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	80	;'P'
	db	111	;'o'
	db	119	;'w'
	db	101	;'e'
	db	114	;'r'
	db	45
	db	117	;'u'
	db	112	;'p'
	db	32
	db	100	;'d'
	db	101	;'e'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	0
	
STR_1:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	83	;'S'
	db	101	;'e'
	db	116	;'t'
	db	116	;'t'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	84	;'T'
	db	82	;'R'
	db	73	;'I'
	db	83	;'S'
	db	65	;'A'
	db	0
	
STR_18:
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
	
STR_26:
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
	
STR_15:
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
	
STR_24:
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
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	83	;'S'
	db	101	;'e'
	db	99	;'c'
	db	111	;'o'
	db	110	;'n'
	db	100	;'d'
	db	32
	db	48	;'0'
	db	120	;'x'
	db	48	;'0'
	db	51	;'3'
	db	0
	
STR_16:
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
	
STR_21:
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
	
STR_22:
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
	
STR_45:
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
	
STR_5:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	84	;'T'
	db	104	;'h'
	db	105	;'i'
	db	114	;'r'
	db	100	;'d'
	db	32
	db	48	;'0'
	db	120	;'x'
	db	48	;'0'
	db	51	;'3'
	db	0
	
STR_3:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	32
	db	73	;'I'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	58	;':'
	db	32
	db	70	;'F'
	db	105	;'i'
	db	114	;'r'
	db	115	;'s'
	db	116	;'t'
	db	32
	db	48	;'0'
	db	120	;'x'
	db	48	;'0'
	db	51	;'3'
	db	0
	
STR_14:
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
	
STR_12:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
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
	db	0
	
STR_17:
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
	
STR_23:
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
	
STR_25:
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
	
STR_20:
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
	
STR_30:
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
	
STR_19:
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
	
STR_36:
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
	
STR_29:
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
	
STR_35:
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
	
STR_28:
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
	
STR_40:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	0
	
STR_49:
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	49	;'1'
	db	0
	
STR_37:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_41:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_42:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_46:
	db	79	;'O'
	db	80	;'P'
	db	84	;'T'
	db	73	;'I'
	db	79	;'O'
	db	78	;'N'
	db	83	;'S'
	db	0
	
STR_43:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	0
	
STR_55:
	db	40
	db	110	;'n'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	41
	db	0
	
STR_33:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	0
	
STR_34:
	db	83	;'S'
	db	101	;'e'
	db	110	;'n'
	db	115	;'s'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_38:
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_39:
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_31:
	db	65	;'A'
	db	98	;'b'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_50:
	db	40
	db	37
	db	115	;'s'
	db	41
	db	0
	
STR_53:
	db	91	;'['
	db	37
	db	115	;'s'
	db	93	;']'
	db	0
	
STR_44:
	db	66	;'B'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_32:
	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	0
	
STR_47:
	db	91	;'['
	db	0
STR_48	equ	STR_53+3
STR_52	equ	STR_55+5
STR_51	equ	STR_45+19
STR_54	equ	STR_45+20
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
_value_back:
       ds      1
psect	dataCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pdataCOMRAM
__pdataCOMRAM:
	file	"src\menu.c"
	line	139
menu_draw_input@F2295:
       ds      10
psect	dataCOMRAM
	file	"src\menu.c"
	line	16
	global	_options_menu
_options_menu:
       ds      10
psect	dataCOMRAM
	file	"src\encoder.c"
	line	18
_last_btn:
       ds      1
psect	dataCOMRAM
	file	"src\menu.c"
	line	25
_value_sensor:
       ds      10
psect	dataCOMRAM
	file	"src\menu.c"
	line	24
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
	line	27
_value_scale20:
       ds      10
psect	dataBANK0
	file	"src\menu.c"
	line	26
_value_scale4:
       ds      10
psect	dataBANK1,class=BANK1,space=1,noexec,lowdata
global __pdataBANK1
__pdataBANK1:
	file	"src\menu.c"
	line	38
	global	_input_menu
_input_menu:
       ds      60
psect	dataBANK1
	file	"src\menu.c"
	line	34
_value_display:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	33
_value_rlyslp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	32
_value_rlyplp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	31
_value_rlyhigh:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	30
_value_slpbp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	29
_value_plpbp:
       ds      10
psect	dataBANK1
	file	"src\menu.c"
	line	28
_value_highbp:
       ds      10
	file	"src\main.as"
	line	#
psect	cinit
; Initialize objects allocated to BANK1 (130 bytes)
	global __pidataBANK1
	; load TBLPTR registers with __pidataBANK1
	movlw	low (__pidataBANK1)
	movwf	tblptrl
	movlw	high(__pidataBANK1)
	movwf	tblptrh
	movlw	low highword(__pidataBANK1)
	movwf	tblptru
	lfsr	0,__pdataBANK1
	lfsr	1,130
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
; Initialize objects allocated to COMRAM (41 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	lfsr	0,__pdataCOMRAM
	lfsr	1,41
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
; Clear objects allocated to COMRAM (6 bytes)
	global __pbssCOMRAM
clrf	(__pbssCOMRAM+5)&0xffh,c
clrf	(__pbssCOMRAM+4)&0xffh,c
clrf	(__pbssCOMRAM+3)&0xffh,c
clrf	(__pbssCOMRAM+2)&0xffh,c
clrf	(__pbssCOMRAM+1)&0xffh,c
clrf	(__pbssCOMRAM+0)&0xffh,c
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
	global	main@buf_494
main@buf_494:	; 40 bytes @ 0x28
	ds   40
	global	main@blink_timer
main@blink_timer:	; 4 bytes @ 0x50
	ds   4
	global	main@was_editing
main@was_editing:	; 1 bytes @ 0x54
	ds   1
	global	main@delta
main@delta:	; 2 bytes @ 0x55
	ds   2
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0x57
	ds   2
	global	main@current_menu
main@current_menu:	; 1 bytes @ 0x59
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
?_strcat:	; 1 bytes @ 0x9
?_strcpy:	; 1 bytes @ 0x9
??_uart_init:	; 1 bytes @ 0x9
??_uart_write:	; 1 bytes @ 0x9
??_system_init:	; 1 bytes @ 0x9
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
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0xD
	ds   1
?_menu_handle_encoder:	; 1 bytes @ 0xE
??_menu_handle_button:	; 1 bytes @ 0xE
??_uart_println:	; 1 bytes @ 0xE
??_lcd_init:	; 1 bytes @ 0xE
	global	lcd_set_cursor@row
lcd_set_cursor@row:	; 1 bytes @ 0xE
	global	menu_handle_button@press_type
menu_handle_button@press_type:	; 1 bytes @ 0xE
	global	menu_handle_encoder@delta
menu_handle_encoder@delta:	; 2 bytes @ 0xE
	ds   1
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
	ds   1
??_menu_handle_encoder:	; 1 bytes @ 0x10
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
sprintf@sp:	; 1 bytes @ 0x15
	ds   1
	global	sprintf@f
sprintf@f:	; 2 bytes @ 0x16
	ds   2
	global	menu_draw_options@i
menu_draw_options@i:	; 1 bytes @ 0x18
	ds   4
??_sprintf:	; 1 bytes @ 0x1C
	ds   1
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
	ds   2
	global	menu_draw_input@blank
menu_draw_input@blank:	; 10 bytes @ 0x27
	ds   10
	global	menu_draw_input@value_buf
menu_draw_input@value_buf:	; 12 bytes @ 0x31
	ds   12
	global	menu_draw_input@val_len
menu_draw_input@val_len:	; 1 bytes @ 0x3D
	ds   1
	global	menu_draw_input@j
menu_draw_input@j:	; 1 bytes @ 0x3E
	ds   1
	global	menu_draw_input@val_len_759
menu_draw_input@val_len_759:	; 1 bytes @ 0x3F
	ds   1
	global	menu_draw_input@i
menu_draw_input@i:	; 1 bytes @ 0x40
	ds   1
	global	menu_draw_input@item_idx
menu_draw_input@item_idx:	; 1 bytes @ 0x41
	ds   1
??_main:	; 1 bytes @ 0x42
	ds   2
;!
;!Data Sizes:
;!    Strings     813
;!    Constant    26
;!    Data        191
;!    BSS         18
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126     68     115
;!    BANK0           128     90     122
;!    BANK1           256      0     130
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
;!		 -> STR_33(CODE[7]), STR_34(CODE[7]), STR_35(CODE[10]), STR_36(CODE[11]), 
;!		 -> STR_37(CODE[8]), STR_38(CODE[6]), STR_39(CODE[6]), STR_40(CODE[9]), 
;!		 -> STR_41(CODE[8]), STR_42(CODE[8]), STR_43(CODE[8]), STR_44(CODE[5]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 10
;!		 -> value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(COMRAM[10]), value_highbp(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK0[10]), value_scale4(BANK0[10]), value_sensor(COMRAM[10]), value_slpbp(BANK1[10]), 
;!
;!    lcd_print@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> menu_draw_input@value_buf(COMRAM[12]), STR_19(CODE[13]), STR_20(CODE[15]), STR_28(CODE[10]), 
;!		 -> STR_29(CODE[11]), STR_30(CODE[13]), STR_31(CODE[6]), STR_32(CODE[5]), 
;!		 -> STR_33(CODE[7]), STR_34(CODE[7]), STR_35(CODE[10]), STR_36(CODE[11]), 
;!		 -> STR_37(CODE[8]), STR_38(CODE[6]), STR_39(CODE[6]), STR_40(CODE[9]), 
;!		 -> STR_41(CODE[8]), STR_42(CODE[8]), STR_43(CODE[8]), STR_44(CODE[5]), 
;!		 -> STR_45(CODE[21]), STR_46(CODE[8]), STR_47(CODE[2]), STR_48(CODE[2]), 
;!		 -> STR_49(CODE[8]), 
;!
;!    lcd_print_at@str	PTR const unsigned char  size(2) Largest target is 13
;!		 -> menu_draw_input@value_buf(COMRAM[12]), STR_28(CODE[10]), STR_29(CODE[11]), STR_30(CODE[13]), 
;!		 -> STR_31(CODE[6]), STR_32(CODE[5]), STR_33(CODE[7]), STR_34(CODE[7]), 
;!		 -> STR_35(CODE[10]), STR_36(CODE[11]), STR_37(CODE[8]), STR_38(CODE[6]), 
;!		 -> STR_39(CODE[6]), STR_40(CODE[9]), STR_41(CODE[8]), STR_42(CODE[8]), 
;!		 -> STR_43(CODE[8]), STR_44(CODE[5]), STR_46(CODE[8]), STR_47(CODE[2]), 
;!		 -> STR_49(CODE[8]), 
;!
;!    options_menu	PTR const unsigned char [5] size(2) Largest target is 13
;!		 -> STR_28(CODE[10]), STR_29(CODE[11]), STR_30(CODE[13]), STR_31(CODE[6]), 
;!		 -> STR_32(CODE[5]), 
;!
;!    S665$label	PTR const unsigned char  size(2) Largest target is 11
;!		 -> STR_33(CODE[7]), STR_34(CODE[7]), STR_35(CODE[10]), STR_36(CODE[11]), 
;!		 -> STR_37(CODE[8]), STR_38(CODE[6]), STR_39(CODE[6]), STR_40(CODE[9]), 
;!		 -> STR_41(CODE[8]), STR_42(CODE[8]), STR_43(CODE[8]), STR_44(CODE[5]), 
;!
;!    S665$value	PTR unsigned char  size(2) Largest target is 10
;!		 -> value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(COMRAM[10]), value_highbp(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK0[10]), value_scale4(BANK0[10]), value_sensor(COMRAM[10]), value_slpbp(BANK1[10]), 
;!
;!    sp__strcat	PTR unsigned char  size(1) Largest target is 10
;!		 -> menu_draw_input@blank(COMRAM[10]), 
;!
;!    sp__strcpy	PTR unsigned char  size(1) Largest target is 12
;!		 -> menu_draw_input@value_buf(COMRAM[12]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 10
;!		 -> ?_sprintf(COMRAM[2]), STR_55(CODE[7]), value_back(COMRAM[1]), value_display(BANK1[10]), 
;!		 -> value_enable(COMRAM[10]), value_highbp(BANK1[10]), value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), 
;!		 -> value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), value_scale20(BANK0[10]), value_scale4(BANK0[10]), 
;!		 -> value_sensor(COMRAM[10]), value_slpbp(BANK1[10]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 23
;!		 -> STR_24(CODE[23]), STR_25(CODE[17]), STR_50(CODE[5]), STR_53(CODE[5]), 
;!
;!    sprintf@sp	PTR unsigned char  size(1) Largest target is 40
;!		 -> main@buf(BANK0[40]), main@buf_494(BANK0[40]), menu_draw_input@value_buf(COMRAM[12]), 
;!
;!    strcat@cp	PTR unsigned char  size(1) Largest target is 10
;!		 -> menu_draw_input@blank(COMRAM[10]), 
;!
;!    strcat@from	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_51(CODE[2]), STR_52(CODE[2]), 
;!
;!    strcat@to	PTR unsigned char  size(1) Largest target is 10
;!		 -> menu_draw_input@blank(COMRAM[10]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 10
;!		 -> value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(COMRAM[10]), value_highbp(BANK1[10]), 
;!		 -> value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), value_rlyslp(BANK1[10]), 
;!		 -> value_scale20(BANK0[10]), value_scale4(BANK0[10]), value_sensor(COMRAM[10]), value_slpbp(BANK1[10]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 1
;!		 -> STR_54(CODE[1]), 
;!
;!    strcpy@cp	PTR unsigned char  size(1) Largest target is 12
;!		 -> menu_draw_input@value_buf(COMRAM[12]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 10
;!		 -> menu_draw_input@blank(COMRAM[10]), value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(COMRAM[10]), 
;!		 -> value_highbp(BANK1[10]), value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), 
;!		 -> value_rlyslp(BANK1[10]), value_scale20(BANK0[10]), value_scale4(BANK0[10]), value_sensor(COMRAM[10]), 
;!		 -> value_slpbp(BANK1[10]), 
;!
;!    strcpy@to	PTR unsigned char  size(1) Largest target is 12
;!		 -> menu_draw_input@value_buf(COMRAM[12]), 
;!
;!    strlen@cp	PTR const unsigned char  size(2) Largest target is 12
;!		 -> menu_draw_input@value_buf(COMRAM[12]), value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(COMRAM[10]), 
;!		 -> value_highbp(BANK1[10]), value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), 
;!		 -> value_rlyslp(BANK1[10]), value_scale20(BANK0[10]), value_scale4(BANK0[10]), value_sensor(COMRAM[10]), 
;!		 -> value_slpbp(BANK1[10]), 
;!
;!    strlen@s	PTR const unsigned char  size(2) Largest target is 12
;!		 -> menu_draw_input@value_buf(COMRAM[12]), value_back(COMRAM[1]), value_display(BANK1[10]), value_enable(COMRAM[10]), 
;!		 -> value_highbp(BANK1[10]), value_plpbp(BANK1[10]), value_rlyhigh(BANK1[10]), value_rlyplp(BANK1[10]), 
;!		 -> value_rlyslp(BANK1[10]), value_scale20(BANK0[10]), value_scale4(BANK0[10]), value_sensor(COMRAM[10]), 
;!		 -> value_slpbp(BANK1[10]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 40
;!		 -> main@buf(BANK0[40]), main@buf_494(BANK0[40]), STR_1(CODE[24]), STR_10(CODE[26]), 
;!		 -> STR_11(CODE[26]), STR_12(CODE[19]), STR_13(CODE[27]), STR_14(CODE[21]), 
;!		 -> STR_15(CODE[23]), STR_16(CODE[22]), STR_17(CODE[19]), STR_18(CODE[24]), 
;!		 -> STR_2(CODE[25]), STR_21(CODE[22]), STR_22(CODE[22]), STR_23(CODE[19]), 
;!		 -> STR_26(CODE[24]), STR_27(CODE[26]), STR_3(CODE[21]), STR_4(CODE[22]), 
;!		 -> STR_5(CODE[21]), STR_6(CODE[34]), STR_7(CODE[28]), STR_8(CODE[27]), 
;!		 -> STR_9(CODE[29]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 40
;!		 -> main@buf(BANK0[40]), main@buf_494(BANK0[40]), STR_1(CODE[24]), STR_10(CODE[26]), 
;!		 -> STR_11(CODE[26]), STR_12(CODE[19]), STR_13(CODE[27]), STR_14(CODE[21]), 
;!		 -> STR_15(CODE[23]), STR_16(CODE[22]), STR_17(CODE[19]), STR_18(CODE[24]), 
;!		 -> STR_2(CODE[25]), STR_21(CODE[22]), STR_22(CODE[22]), STR_23(CODE[19]), 
;!		 -> STR_26(CODE[24]), STR_27(CODE[26]), STR_3(CODE[21]), STR_4(CODE[22]), 
;!		 -> STR_5(CODE[21]), STR_6(CODE[34]), STR_7(CODE[28]), STR_8(CODE[27]), 
;!		 -> STR_9(CODE[29]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_menu_draw_input
;!    _menu_handle_encoder->_beep
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
;!    _lcd_init->_uart_println
;!    _uart_println->_uart_print
;!    _uart_print->_uart_write
;!    _lcd_clear->_lcd_cmd
;!    _lcd_cmd->_lcd_write_nibble
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
;! (0) _main                                                92    92      0   23454
;!                                             66 COMRAM     2     2      0
;!                                              0 BANK0     90    90      0
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
;! (1) _uart_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _system_init                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _menu_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_encoder                                  7     5      2    1100
;!                                             14 COMRAM     7     5      2
;!                               _beep
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                   1     1      0    1046
;!                                             14 COMRAM     1     1      0
;!                               _beep
;! ---------------------------------------------------------------------------------
;! (2) _beep                                                 5     3      2     958
;!                                              9 COMRAM     5     3      2
;! ---------------------------------------------------------------------------------
;! (1) _menu_draw_options                                    6     6      0    4265
;!                                             19 COMRAM     6     6      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;! ---------------------------------------------------------------------------------
;! (1) _menu_draw_input                                     29    29      0    7660
;!                                             37 COMRAM    29    29      0
;!                     _lcd_clear_line
;!                       _lcd_print_at
;!                            _sprintf
;!                             _strcat
;!                             _strcmp
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (2) _strlen                                               4     2      2     310
;!                                              9 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (2) _strcpy                                               4     1      3     469
;!                                              9 COMRAM     4     1      3
;! ---------------------------------------------------------------------------------
;! (2) _strcmp                                               7     3      4     313
;!                                              9 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (2) _strcat                                               4     1      3     402
;!                                              9 COMRAM     4     1      3
;! ---------------------------------------------------------------------------------
;! (1) _sprintf                                             22    15      7    1825
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
;! (2) _lcd_print_at                                         4     1      3    2205
;!                                             15 COMRAM     4     1      3
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _lcd_clear_line                                       1     1      0    1249
;!                                             15 COMRAM     1     1      0
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_set_cursor                                       3     2      1     594
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
;! (1) _lcd_init                                             2     2      0    2263
;!                                             14 COMRAM     2     2      0
;!                            _lcd_cmd
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    2087
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
;!   _encoder_init
;!   _lcd_clear
;!     _lcd_cmd
;!       _lcd_write_nibble
;!   _lcd_cmd
;!   _lcd_data
;!     _lcd_write_nibble
;!   _lcd_init
;!     _lcd_cmd
;!     _uart_println
;!       _uart_print
;!         _uart_write
;!       _uart_write
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
;!   _menu_handle_encoder
;!     _beep
;!   _menu_init
;!   _sprintf
;!   _system_init
;!   _uart_init
;!   _uart_println
;!
;! _isr (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BIGRAM             F7F      0       0      48        0.0%
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
;!BANK1              100      0      82       7       50.8%
;!BITBANK15           80      0       0      34        0.0%
;!BANK15              80      0       0      35        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80     5A      7A       5       95.3%
;!BITCOMRAM           7E      0       0       0        0.0%
;!COMRAM              7E     44      73       1       91.3%
;!BITBIGSFRhhhhlh     1A      0       0      37        0.0%
;!BITBIGSFRhhhlh      11      0       0      39        0.0%
;!BITBIGSFRhlh         F      0       0      43        0.0%
;!BITBIGSFRhhhhh       D      0       0      36        0.0%
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
;!ABS                  0      0     16F      47        0.0%
;!DATA                 0      0     16F       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 234 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            40   40[BANK0 ] unsigned char [40]
;;  buf            40    0[BANK0 ] unsigned char [40]
;;  delta           2   85[BANK0 ] int 
;;  blink_timer     4   80[BANK0 ] unsigned long 
;;  last_encoder    2   87[BANK0 ] int 
;;  current_menu    1   89[BANK0 ] unsigned char 
;;  was_editing     1   84[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 3F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      90       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2      90       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       92 bytes
;; Hardware stack levels required when called: 6
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
	line	234
global __ptext0
__ptext0:
psect	text0
	file	"src\main.c"
	line	234
	
_main:
;incstack = 0
	callstack 25
	line	236
	
l2660:
	call	_system_init	;wreg free
	line	237
	call	_uart_init	;wreg free
	line	239
	
l2662:
		movlw	low(STR_13)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_13)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	240
	
l2664:
		movlw	low(STR_14)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_14)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	242
	
l2666:
	call	_lcd_init	;wreg free
	line	244
	
l2668:
		movlw	low(STR_15)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	245
	
l2670:
	movlw	(080h)&0ffh
	
	call	_lcd_cmd
	line	246
	
l2672:
	movlw	(054h)&0ffh
	
	call	_lcd_data
	line	247
	
l2674:
	movlw	(045h)&0ffh
	
	call	_lcd_data
	line	248
	
l2676:
	movlw	(053h)&0ffh
	
	call	_lcd_data
	line	249
	
l2678:
	movlw	(054h)&0ffh
	
	call	_lcd_data
	line	251
	
l2680:
	call	_encoder_init	;wreg free
	line	252
	
l2682:
		movlw	low(STR_16)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_16)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	254
	
l2684:
	call	_menu_init	;wreg free
	line	255
		movlw	low(STR_17)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_17)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	257
		movlw	low(STR_18)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_18)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	258
	
l2686:
	call	_lcd_clear	;wreg free
	line	259
	
l2688:
	movlw	low(03h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	260
		movlw	low(STR_19)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_19)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	261
	
l2690:
	movlw	low(02h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	262
	
l2692:
		movlw	low(STR_20)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_20)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	264
	
l2694:
		movlw	low(STR_21)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_21)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	265
	
l2696:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	266
	
l2698:
	asmopt push
asmopt off
movlw  5
movwf	(??_main+0+0+1)^00h,c
movlw	15
movwf	(??_main+0+0)^00h,c
	movlw	241
u2347:
decfsz	wreg,f
	bra	u2347
	decfsz	(??_main+0+0)^00h,c,f
	bra	u2347
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u2347
	nop
asmopt pop

	line	267
	
l2700:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	268
	
l2702:
	asmopt push
asmopt off
movlw  5
movwf	(??_main+0+0+1)^00h,c
movlw	15
movwf	(??_main+0+0)^00h,c
	movlw	241
u2357:
decfsz	wreg,f
	bra	u2357
	decfsz	(??_main+0+0)^00h,c,f
	bra	u2357
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u2357
	nop
asmopt pop

	line	269
	
l2704:
	movlw	high(0C8h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(0C8h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	271
	
l2706:
	asmopt push
asmopt off
movlw  82
movwf	(??_main+0+0+1)^00h,c
movlw	43
movwf	(??_main+0+0)^00h,c
	movlw	0
u2367:
decfsz	wreg,f
	bra	u2367
	decfsz	(??_main+0+0)^00h,c,f
	bra	u2367
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u2367
	nop2
asmopt pop

	line	273
	
l2708:
		movlw	low(STR_22)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_22)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	274
	
l2710:
	call	_lcd_clear	;wreg free
	line	275
	
l2712:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((main@current_menu))&0ffh
	line	276
	
l2714:; BSR set to: 0

	call	_menu_draw_options	;wreg free
	line	278
	
l2716:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	279
	
l2718:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	280
	
l2720:; BSR set to: 0

	line	282
	
l2722:; BSR set to: 0

		movlw	low(STR_23)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_23)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	287
	
l2724:
	movlb	0	; () banked
	movf	((main@last_encoder))&0ffh,w
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u2160
movf	((main@last_encoder+1))&0ffh,w
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u2161
	goto	u2160

u2161:
	goto	l2744
u2160:
	line	289
	
l2726:; BSR set to: 0

	movf	((main@last_encoder))&0ffh,w
	subwf	((_encoder_count))&0ffh,w	;volatile
	movwf	((main@delta))&0ffh
	movf	((main@last_encoder+1))&0ffh,w
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movwf	1+((main@delta))&0ffh
	line	292
	
l2728:; BSR set to: 0

	movlw	high(0Ah)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	295
	
l2730:
		movlw	low(main@buf)
	movwf	((c:sprintf@sp))^00h,c

		movlw	low(STR_24)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_24)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_encoder_count),0+((c:?_sprintf)+03h)	;volatile
	movff	(_encoder_count+1),1+((c:?_sprintf)+03h)	;volatile
	movff	(main@delta),0+((c:?_sprintf)+05h)
	movff	(main@delta+1),1+((c:?_sprintf)+05h)
	call	_sprintf	;wreg free
	line	296
	
l2732:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	298
	
l2734:
	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	line	301
	
l2736:
	movlb	0	; () banked
	movf	((main@current_menu))&0ffh,w
	btfss	status,2
	goto	u2171
	goto	u2170
u2171:
	goto	l2740
u2170:
	line	303
	
l2738:; BSR set to: 0

	call	_menu_draw_options	;wreg free
	line	304
	goto	l2742
	line	307
	
l2740:; BSR set to: 0

	call	_menu_draw_input	;wreg free
	line	310
	
l2742:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	314
	
l2744:
	movlb	0	; () banked
	movf	((_button_pressed))&0ffh,w	;volatile
	btfsc	status,2
	goto	u2181
	goto	u2180
u2181:
	goto	l2810
u2180:
	line	316
	
l2746:; BSR set to: 0

	movlw	low(0)
	movwf	((_button_pressed))&0ffh	;volatile
	line	319
	
l2748:; BSR set to: 0

		movlw	low(main@buf_494)
	movwf	((c:sprintf@sp))^00h,c

		movlw	low(STR_25)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_25)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_button_event),0+((c:?_sprintf)+03h)	;volatile
	clrf	(1+((c:?_sprintf)+03h))^00h,c
	call	_sprintf	;wreg free
	line	320
	
l2750:
		movlw	low(main@buf_494)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	323
	
l2752:
	movff	0+(_menu+03h),(main@was_editing)
	line	325
	
l2754:
	movlb	0	; () banked
	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u2191
	goto	u2190
u2191:
	goto	l2810
u2190:
	line	327
	
l2756:; BSR set to: 0

		decf	((_button_event))&0ffh,w	;volatile
	btfss	status,2
	goto	u2201
	goto	u2200

u2201:
	goto	l2760
u2200:
	line	329
	
l2758:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	330
	goto	l2768
	line	331
	
l2760:; BSR set to: 0

		movlw	2
	xorwf	((_button_event))&0ffh,w	;volatile
	btfss	status,2
	goto	u2211
	goto	u2210

u2211:
	goto	l2764
u2210:
	line	333
	
l2762:; BSR set to: 0

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	334
	goto	l2768
	line	335
	
l2764:; BSR set to: 0

		movlw	3
	xorwf	((_button_event))&0ffh,w	;volatile
	btfss	status,2
	goto	u2221
	goto	u2220

u2221:
	goto	l2768
u2220:
	line	337
	
l2766:; BSR set to: 0

	movlw	high(0C8h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(0C8h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	340
	
l2768:
	movlb	0	; () banked
	movf	((_button_event))&0ffh,w	;volatile
	
	call	_menu_handle_button
	line	343
	
l2770:
	movlb	0	; () banked
	movf	((main@was_editing))&0ffh,w
	btfsc	status,2
	goto	u2231
	goto	u2230
u2231:
	goto	l2778
u2230:
	
l2772:; BSR set to: 0

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u2241
	goto	u2240
u2241:
	goto	l2778
u2240:
	line	345
	
l2774:; BSR set to: 0

		decf	((main@current_menu))&0ffh,w
	btfss	status,2
	goto	u2251
	goto	u2250

u2251:
	goto	l2778
u2250:
	line	347
	
l2776:; BSR set to: 0

	call	_menu_draw_input	;wreg free
	line	352
	
l2778:
	movlb	0	; () banked
		decf	((_button_event))&0ffh,w	;volatile
	btfss	status,2
	goto	u2261
	goto	u2260

u2261:
	goto	l2794
u2260:
	
l2780:; BSR set to: 0

	movf	((main@current_menu))&0ffh,w
	btfss	status,2
	goto	u2271
	goto	u2270
u2271:
	goto	l2794
u2270:
	line	354
	
l2782:; BSR set to: 0

		movlw	low(STR_26)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_26)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	355
	
l2784:
	movlw	low(01h)
	movlb	0	; () banked
	movwf	((main@current_menu))&0ffh
	line	356
	
l2786:; BSR set to: 0

	call	_menu_init	;wreg free
	line	357
	
l2788:; BSR set to: 0

	movlw	low(0Ch)
	movwf	(0+(_menu+02h))&0ffh
	line	358
	
l2790:; BSR set to: 0

	call	_lcd_clear	;wreg free
	line	359
	
l2792:
	call	_menu_draw_input	;wreg free
	line	360
	goto	l2808
	line	361
	
l2794:; BSR set to: 0

		movlw	3
	xorwf	((_button_event))&0ffh,w	;volatile
	btfss	status,2
	goto	u2281
	goto	u2280

u2281:
	goto	l2808
u2280:
	line	363
	
l2796:; BSR set to: 0

		movlw	low(STR_27)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_27)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	364
	
l2798:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((main@current_menu))&0ffh
	line	365
	
l2800:; BSR set to: 0

	call	_menu_init	;wreg free
	line	366
	
l2802:; BSR set to: 0

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	367
	
l2804:; BSR set to: 0

	call	_lcd_clear	;wreg free
	line	368
	
l2806:
	call	_menu_draw_options	;wreg free
	line	371
	
l2808:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	376
	
l2810:; BSR set to: 0

	movlw	low(01h)
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	377
	
l2812:; BSR set to: 0

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	bnz	u2290
	movlw	80
	subwf	 ((main@blink_timer))&0ffh,w
	movlw	195
	subwfb	((main@blink_timer+1))&0ffh,w
	btfss	status,0
	goto	u2291
	goto	u2290

u2291:
	goto	l2724
u2290:
	line	379
	
l2814:; BSR set to: 0

	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	381
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u2301
	goto	u2300
u2301:
	goto	l2724
u2300:
	line	383
	
l2816:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u2311
	goto	u2310
u2311:
	movlw	1
	goto	u2320
u2310:
	movlw	0
u2320:
	movwf	(0+(_menu+05h))&0ffh
	line	384
	
l2818:; BSR set to: 0

		decf	((main@current_menu))&0ffh,w
	btfss	status,2
	goto	u2331
	goto	u2330

u2331:
	goto	l158
u2330:
	line	386
	
l2820:; BSR set to: 0

	call	_menu_draw_input	;wreg free
	goto	l2724
	line	389
	
l158:; BSR set to: 0

	goto	l2724
	global	start
	goto	start
	callstack 0
	line	391
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_uart_init

;; *************** function _uart_init *****************
;; Defined at:
;;		line 30 in file "src\main.c"
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
	line	30
global __ptext1
__ptext1:
psect	text1
	file	"src\main.c"
	line	30
	
_uart_init:; BSR set to: 0

;incstack = 0
	callstack 29
	line	32
	
l2106:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	33
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	35
	
l2108:
	movlw	low(024h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	36
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	37
	movlw	low(08h)
	movwf	((c:4024))^0f00h,c	;volatile
	line	39
	movlw	low(044h)
	movwf	((c:4015))^0f00h,c	;volatile
	line	40
	movlw	low(0)
	movwf	((c:4016))^0f00h,c	;volatile
	line	41
	
l69:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
	signat	_uart_init,89
	global	_system_init

;; *************** function _system_init *****************
;; Defined at:
;;		line 66 in file "src\main.c"
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
	line	66
global __ptext2
__ptext2:
psect	text2
	file	"src\main.c"
	line	66
	
_system_init:
;incstack = 0
	callstack 29
	line	68
	
l2110:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	69
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	72
	
l87:
	line	71
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u1421
	goto	u1420
u1421:
	goto	l87
u1420:
	line	74
	
l2112:
	movlw	low(0Fh)
	movwf	((c:4033))^0f00h,c	;volatile
	line	76
	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	77
	movlw	low(0)
	movwf	((c:3978))^0f00h,c	;volatile
	line	78
	movlw	low(0)
	movwf	((c:3979))^0f00h,c	;volatile
	line	80
	
l2114:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	81
	
l2116:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	83
	
l2118:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	84
	
l2120:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	85
	
l2122:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	86
	
l2124:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	87
	
l90:
	return	;funcret
	callstack 0
GLOBAL	__end_of_system_init
	__end_of_system_init:
	signat	_system_init,89
	global	_menu_init

;; *************** function _menu_init *****************
;; Defined at:
;;		line 72 in file "src\menu.c"
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
	line	72
global __ptext3
__ptext3:
psect	text3
	file	"src\menu.c"
	line	72
	
_menu_init:
;incstack = 0
	callstack 29
	line	74
	
l2228:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_menu))&0ffh
	line	75
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	76
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	77
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	78
	movlw	low(0)
	movwf	(0+(_menu+05h))&0ffh
	line	79
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	80
	
l268:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_init
	__end_of_menu_init:
	signat	_menu_init,89
	global	_menu_handle_encoder

;; *************** function _menu_handle_encoder *****************
;; Defined at:
;;		line 169 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  delta           2   14[COMRAM] int 
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
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_beep
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	169
global __ptext4
__ptext4:
psect	text4
	file	"src\menu.c"
	line	169
	
_menu_handle_encoder:; BSR set to: 0

;incstack = 0
	callstack 28
	line	172
	
l2252:
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u1481
	goto	u1480
u1481:
	goto	l2260
u1480:
	line	174
	
l2254:; BSR set to: 0

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u1491
	goto	u1490

u1491:
	goto	l303
u1490:
	line	176
	
l2256:; BSR set to: 0

	movlw	high(05h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(05h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l303
	line	183
	
l2260:; BSR set to: 0

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u1501
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u1500
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u1501
	goto	u1500

u1501:
	goto	l2270
u1500:
	line	186
	
l2262:; BSR set to: 0

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
	goto	u1511
	goto	u1510

u1511:
	goto	l303
u1510:
	line	188
	
l2264:; BSR set to: 0

	incf	((_menu))&0ffh
	line	191
	
l2266:; BSR set to: 0

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
	goto	u1521
	goto	u1520

u1521:
	goto	l303
u1520:
	line	193
	
l2268:; BSR set to: 0

	incf	(0+(_menu+01h))&0ffh
	goto	l303
	line	197
	
l2270:; BSR set to: 0

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u1530
	goto	u1531

u1531:
	goto	l303
u1530:
	line	200
	
l2272:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u1541
	goto	u1540
u1541:
	goto	l303
u1540:
	line	202
	
l2274:; BSR set to: 0

	decf	((_menu))&0ffh
	line	205
	
l2276:; BSR set to: 0

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u1551
	goto	u1550

u1551:
	goto	l303
u1550:
	line	207
	
l2278:; BSR set to: 0

	decf	(0+(_menu+01h))&0ffh
	line	211
	
l303:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_encoder
	__end_of_menu_handle_encoder:
	signat	_menu_handle_encoder,4217
	global	_menu_handle_button

;; *************** function _menu_handle_button *****************
;; Defined at:
;;		line 214 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  press_type      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  press_type      1   14[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
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
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	214
global __ptext5
__ptext5:
psect	text5
	file	"src\menu.c"
	line	214
	
_menu_handle_button:
;incstack = 0
	callstack 28
	movwf	((c:menu_handle_button@press_type))^00h,c
	line	218
	
l2332:
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u1651
	goto	u1650
u1651:
	goto	l2346
u1650:
	line	220
	
l2334:; BSR set to: 0

		decf	((c:menu_handle_button@press_type))^00h,c,w
	btfss	status,2
	goto	u1661
	goto	u1660

u1661:
	goto	l2340
u1660:
	line	223
	
l2336:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	224
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	225
	
l2338:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	226
	goto	l322
	line	227
	
l2340:; BSR set to: 0

		movlw	2
	xorwf	((c:menu_handle_button@press_type))^00h,c,w
	btfss	status,2
	goto	u1671
	goto	u1670

u1671:
	goto	l322
u1670:
	line	230
	
l2342:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	231
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	232
	
l2344:; BSR set to: 0

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l322
	line	237
	
l2346:; BSR set to: 0

		decf	((c:menu_handle_button@press_type))^00h,c,w
	btfss	status,2
	goto	u1681
	goto	u1680

u1681:
	goto	l2354
u1680:
	line	240
	
l2348:; BSR set to: 0

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
	goto	u1691
	goto	u1690
u1691:
	goto	l322
u1690:
	line	242
	
l2350:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_menu+03h))&0ffh
	line	243
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	244
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l2338
	line	248
	
l2354:; BSR set to: 0

		movlw	3
	xorwf	((c:menu_handle_button@press_type))^00h,c,w
	btfss	status,2
	goto	u1701
	goto	u1700

u1701:
	goto	l322
u1700:
	line	251
	
l2356:; BSR set to: 0

	movlw	high(0C8h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(0C8h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	255
	
l322:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_button
	__end_of_menu_handle_button:
	signat	_menu_handle_button,4217
	global	_beep

;; *************** function _beep *****************
;; Defined at:
;;		line 223 in file "src\main.c"
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
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	223
global __ptext6
__ptext6:
psect	text6
	file	"src\main.c"
	line	223
	
_beep:
;incstack = 0
	callstack 28
	line	225
	
l1976:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	226
	
l1978:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l134
	line	228
	
l1980:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u2377:
decfsz	wreg,f
	bra	u2377
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u2377
	nop2
asmopt pop

	line	226
	
l1982:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l134:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u1241
	goto	u1240

u1241:
	goto	l1980
u1240:
	
l136:
	line	230
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	231
	
l137:
	return	;funcret
	callstack 0
GLOBAL	__end_of_beep
	__end_of_beep:
	signat	_beep,4217
	global	_menu_draw_options

;; *************** function _menu_draw_options *****************
;; Defined at:
;;		line 83 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   24[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
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
psect	text7,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	83
global __ptext7
__ptext7:
psect	text7
	file	"src\menu.c"
	line	83
	
_menu_draw_options:
;incstack = 0
	callstack 25
	line	86
	
l2230:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	87
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_46)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_46)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	90
	
l2232:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	goto	l2248
	line	92
	
l2234:; BSR set to: 0

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	95
	
l2236:
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
	bnz	u1451
movf	(??_menu_draw_options+0+1)^00h,c,w
xorwf	(??_menu_draw_options+2+1)^00h,c,w
	btfss	status,2
	goto	u1451
	goto	u1450

u1451:
	goto	l2244
u1450:
	line	97
	
l2238:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_47)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_47)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_print_at
	line	98
	
l2240:
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
	line	99
	
l2242:
		movlw	low(STR_48)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_48)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	100
	goto	l2246
	line	103
	
l2244:; BSR set to: 0

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
	line	90
	
l2246:
	incf	((c:menu_draw_options@i))^00h,c
	
l2248:
		movlw	03h-0
	cpfslt	((c:menu_draw_options@i))^00h,c
	goto	u1461
	goto	u1460

u1461:
	goto	l278
u1460:
	
l2250:
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
	goto	u1471
	goto	u1470

u1471:
	goto	l2234
u1470:
	line	106
	
l278:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_options
	__end_of_menu_draw_options:
	signat	_menu_draw_options,89
	global	_menu_draw_input

;; *************** function _menu_draw_input *****************
;; Defined at:
;;		line 109 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1   62[COMRAM] unsigned char 
;;  blank          10   39[COMRAM] unsigned char [10]
;;  val_len         1   61[COMRAM] unsigned char 
;;  value_buf      12   49[COMRAM] unsigned char [12]
;;  item_idx        1   65[COMRAM] unsigned char 
;;  val_len         1   63[COMRAM] unsigned char 
;;  i               1   64[COMRAM] unsigned char 
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
;;      Locals:        27       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        29       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       29 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
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
psect	text8,class=CODE,space=0,reloc=2,group=0
	line	109
global __ptext8
__ptext8:
psect	text8
	file	"src\menu.c"
	line	109
	
_menu_draw_input:
;incstack = 0
	callstack 25
	line	112
	
l2608:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	113
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_49)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_49)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	116
	
l2610:
	movlw	low(0)
	movwf	((c:menu_draw_input@i))^00h,c
	goto	l2656
	line	118
	
l2612:
	movlb	0	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_input@i))^00h,c,w
	movwf	((c:menu_draw_input@item_idx))^00h,c
	line	119
	
l2614:; BSR set to: 0

	incf	((c:menu_draw_input@i))^00h,c,w
	
	call	_lcd_clear_line
	line	122
	
l2616:
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
	line	127
	
l2618:
	movf	((c:menu_draw_input@item_idx))^00h,c,w
	movlb	0	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u2071
	goto	u2070

u2071:
	goto	l2644
u2070:
	line	129
	
l2620:; BSR set to: 0

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u2081
	goto	u2080
u2081:
	goto	l2642
u2080:
	line	132
	
l2622:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u2091
	goto	u2090
u2091:
	goto	l2626
u2090:
	line	134
	
l2624:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:sprintf@sp))^00h,c

		movlw	low(STR_50)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_50)
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
	line	135
	goto	l2646
	line	139
	
l2626:; BSR set to: 0

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
	movwf	((c:menu_draw_input@val_len))^00h,c
	line	140
	
l2628:
	lfsr	2,(menu_draw_input@F2295)
	lfsr	1,(menu_draw_input@blank)
	movlw	10-1
u2101:
	movff	plusw2,plusw1
	decf	wreg
	bc	u2101

	line	141
	
l2630:
	movlw	low(0)
	movwf	((c:menu_draw_input@j))^00h,c
	goto	l2636
	line	142
	
l2632:
		movlw	low(menu_draw_input@blank)
	movwf	((c:strcat@to))^00h,c

		movlw	low(STR_51)
	movwf	((c:strcat@from))^00h,c
	movlw	high(STR_51)
	movwf	((c:strcat@from+1))^00h,c

	call	_strcat	;wreg free
	line	141
	
l2634:
	incf	((c:menu_draw_input@j))^00h,c
	
l2636:
		movf	((c:menu_draw_input@val_len))^00h,c,w
	subwf	((c:menu_draw_input@j))^00h,c,w
	btfss	status,0
	goto	u2111
	goto	u2110

u2111:
	goto	l2632
u2110:
	line	143
	
l2638:
		movlw	low(menu_draw_input@blank)
	movwf	((c:strcat@to))^00h,c

		movlw	low(STR_52)
	movwf	((c:strcat@from))^00h,c
	movlw	high(STR_52)
	movwf	((c:strcat@from+1))^00h,c

	call	_strcat	;wreg free
	line	144
	
l2640:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c

		movlw	low(menu_draw_input@blank)
	movwf	((c:strcpy@from))^00h,c
	clrf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l2646
	line	150
	
l2642:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:sprintf@sp))^00h,c

		movlw	low(STR_53)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_53)
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
	goto	l2646
	line	156
	
l2644:; BSR set to: 0

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
	line	160
	
l2646:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_input@val_len_759))^00h,c
	line	161
	
l2648:
	movf	((c:menu_draw_input@val_len_759))^00h,c,w
	btfsc	status,2
	goto	u2121
	goto	u2120
u2121:
	goto	l2654
u2120:
	
l2650:
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
		movlw	low(STR_54)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_54)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u2131
	goto	u2130

u2131:
	goto	l2654
u2130:
	line	163
	
l2652:
	movf	((c:menu_draw_input@val_len_759))^00h,c,w
	sublw	low(014h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_input@i))^00h,c,w
	
	call	_lcd_print_at
	line	116
	
l2654:
	incf	((c:menu_draw_input@i))^00h,c
	
l2656:
		movlw	03h-0
	cpfslt	((c:menu_draw_input@i))^00h,c
	goto	u2141
	goto	u2140

u2141:
	goto	l298
u2140:
	
l2658:
	movf	((c:menu_draw_input@i))^00h,c,w
	movff	0+(_menu+01h),??_menu_draw_input+0+0
	clrf	(??_menu_draw_input+0+0+1)^00h,c
	addwf	(??_menu_draw_input+0+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_input+0+1)^00h,c
	btfsc	(??_menu_draw_input+0+1)^00h,c,7
	goto	u2151
	movf	(??_menu_draw_input+0+1)^00h,c,w
	bnz	u2150
	movlw	12
	subwf	 (??_menu_draw_input+0+0)^00h,c,w
	btfss	status,0
	goto	u2151
	goto	u2150

u2151:
	goto	l2612
u2150:
	line	166
	
l298:
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
;;		 -> menu_draw_input@value_buf(12), value_back(1), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_highbp(10), value_scale20(10), value_scale4(10), value_sensor(10), 
;;		 -> value_enable(10), 
;; Auto vars:     Size  Location     Type
;;  cp              2   11[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_input@value_buf(12), value_back(1), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_highbp(10), value_scale20(10), value_scale4(10), value_sensor(10), 
;;		 -> value_enable(10), 
;; Return value:  Size  Location     Type
;;                  2    9[COMRAM] unsigned int 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0
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
psect	text9,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
global __ptext9
__ptext9:
psect	text9
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
	
_strlen:
;incstack = 0
	callstack 28
	line	8
	
l2580:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l2584
	line	10
	
l2582:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l2584:
	movff	(c:strlen@cp),fsr2l
	movff	(c:strlen@cp+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u2031
	goto	u2030
u2031:
	goto	l2582
u2030:
	line	12
	
l2586:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l1046:
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
;;		 -> menu_draw_input@value_buf(12), 
;;  from            2   10[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_input@blank(10), value_back(1), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_highbp(10), value_scale20(10), value_scale4(10), value_sensor(10), 
;;		 -> value_enable(10), 
;; Auto vars:     Size  Location     Type
;;  cp              1   12[COMRAM] PTR unsigned char 
;;		 -> menu_draw_input@value_buf(12), 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR unsigned char 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0
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
psect	text10,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
global __ptext10
__ptext10:
psect	text10
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
	
_strcpy:
;incstack = 0
	callstack 28
	line	18
	
l2590:
		movff	(c:strcpy@to),(c:strcpy@cp)

	line	19
	goto	l2594
	line	20
	
l2592:
	incf	((c:strcpy@cp))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l2594:
	movff	(c:strcpy@from),fsr2l
	movff	(c:strcpy@from+1),fsr2h
	movf	((c:strcpy@cp))^00h,c,w
	movwf	fsr1l
	clrf	fsr1h
	movff	indf2,indf1
	movf	indf1,w
	btfss	status,2
	goto	u2041
	goto	u2040
u2041:
	goto	l2592
u2040:
	line	24
	
l1040:
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
;;		 -> STR_54(1), 
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
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
global __ptext11
__ptext11:
psect	text11
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
	
_strcmp:
;incstack = 0
	callstack 28
	line	37
	
l2596:
	goto	l2600
	line	38
	
l2598:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l2600:
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
	goto	u2051
	goto	u2050
u2051:
	goto	l2604
u2050:
	
l2602:
	movff	(c:strcmp@s1),fsr2l
	movff	(c:strcmp@s1+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u2061
	goto	u2060
u2061:
	goto	l2598
u2060:
	line	41
	
l2604:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l1034:
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
;;		 -> menu_draw_input@blank(10), 
;;  from            2   10[COMRAM] PTR const unsigned char 
;;		 -> STR_52(2), STR_51(2), 
;; Auto vars:     Size  Location     Type
;;  cp              1   12[COMRAM] PTR unsigned char 
;;		 -> menu_draw_input@blank(10), 
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
psect	text12,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcat.c"
	line	8
global __ptext12
__ptext12:
psect	text12
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcat.c"
	line	8
	
_strcat:
;incstack = 0
	callstack 28
	line	18
	
l2078:
		movff	(c:strcat@to),(c:strcat@cp)

	line	19
	goto	l2082
	line	20
	
l2080:
	incf	((c:strcat@cp))^00h,c
	line	19
	
l2082:
	movf	((c:strcat@cp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u1371
	goto	u1370
u1371:
	goto	l2080
u1370:
	goto	l2086
	line	22
	
l2084:
	incf	((c:strcat@cp))^00h,c
	line	23
	infsnz	((c:strcat@from))^00h,c
	incf	((c:strcat@from+1))^00h,c
	line	21
	
l2086:
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
	goto	u1381
	goto	u1380
u1381:
	goto	l2084
u1380:
	line	26
	
l1026:
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
;;		 -> menu_draw_input@value_buf(12), main@buf_494(40), main@buf(40), 
;;  f               2   22[COMRAM] PTR const unsigned char 
;;		 -> STR_53(5), STR_50(5), STR_25(17), STR_24(23), 
;; Auto vars:     Size  Location     Type
;;  tmpval          4    0        struct .
;;  val             2   34[COMRAM] unsigned int 
;;  cp              2   32[COMRAM] PTR const unsigned char 
;;		 -> STR_55(7), ?_sprintf(2), value_back(1), value_display(10), 
;;		 -> value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_highbp(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(10), value_enable(10), 
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
psect	text13,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
global __ptext13
__ptext13:
psect	text13
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
	
_sprintf:
;incstack = 0
	callstack 28
	line	550
	
l1984:
		movlw	low(?_sprintf+03h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l2054
	line	555
	
l1986:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u1251
	goto	u1250

u1251:
	goto	l1992
u1250:
	line	558
	
l1988:
	movf	((c:sprintf@sp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	(c:sprintf@c),indf2

	
l1990:
	incf	((c:sprintf@sp))^00h,c
	line	559
	goto	l2054
	line	565
	
l1992:
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	line	661
	goto	l2012
	line	760
	
l1994:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l1996:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l1998:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u1261
	goto	u1260

u1261:
	goto	l2008
u1260:
	line	767
	
l2000:
		movlw	low(STR_55)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_55)
	movwf	((c:sprintf@cp+1))^00h,c

	goto	l2008
	line	804
	
l2002:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movf	((c:sprintf@sp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1277
	tblrd	*
	
	movf	tablat,w
	bra	u1270
u1277:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u1270:
	movwf	indf2
	
l2004:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l2006:
	incf	((c:sprintf@sp))^00h,c
	line	803
	
l2008:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1287
	tblrd	*
	
	movf	tablat,w
	bra	u1280
u1287:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u1280:
	iorlw	0
	btfss	status,2
	goto	u1291
	goto	u1290
u1291:
	goto	l2002
u1290:
	goto	l2054
	line	661
	
l2012:
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
	goto	l2056
	xorlw	100^0	; case 100
	skipnz
	goto	l2014
	xorlw	105^100	; case 105
	skipnz
	goto	l2014
	xorlw	115^105	; case 115
	skipnz
	goto	l1994
	goto	l2054

	line	1285
	
l2014:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l2016:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l2018:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u1300
	goto	u1301

u1301:
	goto	l2024
u1300:
	line	1288
	
l2020:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l2022:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	line	1331
	
l2024:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	line	1332
	
l2030:
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
	goto	u1311
	goto	u1310

u1311:
	goto	l2034
u1310:
	goto	l2038
	line	1331
	
l2034:
	incf	((c:sprintf@c))^00h,c
	
l2036:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u1321
	goto	u1320

u1321:
	goto	l2030
u1320:
	line	1464
	
l2038:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u1331
	goto	u1330
u1331:
	goto	l2044
u1330:
	line	1465
	
l2040:
	movf	((c:sprintf@sp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(02Dh)
	movwf	indf2
	
l2042:
	incf	((c:sprintf@sp))^00h,c
	line	1498
	
l2044:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l2052
	line	1515
	
l2046:
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
	
l2048:
	movf	((c:sprintf@sp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	(c:sprintf@c),indf2

	
l2050:
	incf	((c:sprintf@sp))^00h,c
	line	1500
	
l2052:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u1341
	goto	u1340

u1341:
	goto	l2046
u1340:
	line	553
	
l2054:
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
	goto	u1351
	goto	u1350
u1351:
	goto	l1986
u1350:
	line	1564
	
l2056:
	movf	((c:sprintf@sp))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1567
	
l355:
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
psect	text14,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext14
__ptext14:
psect	text14
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
___lwmod:
;incstack = 0
	callstack 28
	line	12
	
l1954:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u1211
	goto	u1210

u1211:
	goto	l847
u1210:
	line	13
	
l1956:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l1960
	line	15
	
l1958:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l1960:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u1221
	goto	u1220
u1221:
	goto	l1958
u1220:
	line	19
	
l1962:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u1231
	goto	u1230

u1231:
	goto	l1966
u1230:
	line	20
	
l1964:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l1966:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l1968:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l1962
	line	23
	
l847:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l854:
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
psect	text15,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
global __ptext15
__ptext15:
psect	text15
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
	
___lwdiv:
;incstack = 0
	callstack 28
	line	13
	
l1932:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l1934:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u1181
	goto	u1180

u1181:
	goto	l837
u1180:
	line	15
	
l1936:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l1940
	line	17
	
l1938:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l1940:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u1191
	goto	u1190
u1191:
	goto	l1938
u1190:
	line	21
	
l1942:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l1944:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u1201
	goto	u1200

u1201:
	goto	l1950
u1200:
	line	23
	
l1946:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l1948:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l1950:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l1952:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l1942
	line	28
	
l837:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l844:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_lcd_print_at

;; *************** function _lcd_print_at *****************
;; Defined at:
;;		line 58 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   15[COMRAM] unsigned char 
;;  str             2   16[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_input@value_buf(12), STR_49(8), STR_47(2), STR_46(8), 
;;		 -> STR_44(5), STR_43(8), STR_42(8), STR_41(8), 
;;		 -> STR_40(9), STR_39(6), STR_38(6), STR_37(8), 
;;		 -> STR_36(11), STR_35(10), STR_34(7), STR_33(7), 
;;		 -> STR_32(5), STR_31(6), STR_30(13), STR_29(11), 
;;		 -> STR_28(10), 
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
psect	text16,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	58
global __ptext16
__ptext16:
psect	text16
	file	"src\menu.c"
	line	58
	
_lcd_print_at:
;incstack = 0
	callstack 25
	movwf	((c:lcd_print_at@row))^00h,c
	line	60
	
l2060:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	61
	
l2062:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	62
	
l262:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print_at
	__end_of_lcd_print_at:
	signat	_lcd_print_at,12409
	global	_lcd_clear_line

;; *************** function _lcd_clear_line *****************
;; Defined at:
;;		line 65 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  row             1   15[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
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
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_lcd_print
;;		_lcd_set_cursor
;; This function is called by:
;;		_menu_draw_options
;;		_menu_draw_input
;; This function uses a non-reentrant model
;;
psect	text17,class=CODE,space=0,reloc=2,group=0
	line	65
global __ptext17
__ptext17:
psect	text17
	file	"src\menu.c"
	line	65
	
_lcd_clear_line:
;incstack = 0
	callstack 25
	movwf	((c:lcd_clear_line@row))^00h,c
	line	67
	
l2064:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	68
	
l2066:
		movlw	low(STR_45)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_45)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	69
	
l265:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear_line
	__end_of_lcd_clear_line:
	signat	_lcd_clear_line,4217
	global	_lcd_set_cursor

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 203 in file "src\main.c"
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
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_lcd_cmd
;; This function is called by:
;;		_main
;;		_lcd_print_at
;;		_lcd_clear_line
;; This function uses a non-reentrant model
;;
psect	text18,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	203
global __ptext18
__ptext18:
psect	text18
	file	"src\main.c"
	line	203
	
_lcd_set_cursor:
;incstack = 0
	callstack 25
	movwf	((c:lcd_set_cursor@row))^00h,c
	line	205
	
l1908:
	movff	(c:lcd_set_cursor@col),(c:lcd_set_cursor@pos)
	line	206
	
l1910:
		decf	((c:lcd_set_cursor@row))^00h,c,w
	btfss	status,2
	goto	u1121
	goto	u1120

u1121:
	goto	l1914
u1120:
	line	207
	
l1912:
	movlw	(040h)&0ffh
	addwf	((c:lcd_set_cursor@pos))^00h,c
	goto	l1922
	line	208
	
l1914:
		movlw	2
	xorwf	((c:lcd_set_cursor@row))^00h,c,w
	btfss	status,2
	goto	u1131
	goto	u1130

u1131:
	goto	l1918
u1130:
	line	209
	
l1916:
	movlw	(014h)&0ffh
	addwf	((c:lcd_set_cursor@pos))^00h,c
	goto	l1922
	line	210
	
l1918:
		movlw	3
	xorwf	((c:lcd_set_cursor@row))^00h,c,w
	btfss	status,2
	goto	u1141
	goto	u1140

u1141:
	goto	l1922
u1140:
	line	211
	
l1920:
	movlw	(054h)&0ffh
	addwf	((c:lcd_set_cursor@pos))^00h,c
	line	212
	
l1922:
	movf	((c:lcd_set_cursor@pos))^00h,c,w
	iorlw	low(080h)
	
	call	_lcd_cmd
	line	213
	
l125:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
	signat	_lcd_set_cursor,8313
	global	_lcd_print

;; *************** function _lcd_print *****************
;; Defined at:
;;		line 215 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   11[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_input@value_buf(12), STR_49(8), STR_48(2), STR_47(2), 
;;		 -> STR_46(8), STR_45(21), STR_44(5), STR_43(8), 
;;		 -> STR_42(8), STR_41(8), STR_40(9), STR_39(6), 
;;		 -> STR_38(6), STR_37(8), STR_36(11), STR_35(10), 
;;		 -> STR_34(7), STR_33(7), STR_32(5), STR_31(6), 
;;		 -> STR_30(13), STR_29(11), STR_28(10), STR_20(15), 
;;		 -> STR_19(13), 
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
psect	text19,class=CODE,space=0,reloc=2,group=0
	line	215
global __ptext19
__ptext19:
psect	text19
	file	"src\main.c"
	line	215
	
_lcd_print:
;incstack = 0
	callstack 25
	line	217
	
l1924:
	goto	l1930
	line	219
	
l1926:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1157
	tblrd	*
	
	movf	tablat,w
	bra	u1150
u1157:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u1150:
	
	call	_lcd_data
	
l1928:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	217
	
l1930:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1167
	tblrd	*
	
	movf	tablat,w
	bra	u1160
u1167:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u1160:
	iorlw	0
	btfss	status,2
	goto	u1171
	goto	u1170
u1171:
	goto	l1926
u1170:
	line	221
	
l131:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print
	__end_of_lcd_print:
	signat	_lcd_print,4217
	global	_lcd_data

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 129 in file "src\main.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text20,class=CODE,space=0,reloc=2,group=0
	line	129
global __ptext20
__ptext20:
psect	text20
	file	"src\main.c"
	line	129
	
_lcd_data:
;incstack = 0
	callstack 25
	movwf	((c:lcd_data@data))^00h,c
	line	131
	
l1894:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	132
	
l1896:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	133
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	134
	
l1898:
	asmopt push
asmopt off
	movlw	133
u2387:
decfsz	wreg,f
	bra	u2387
	nop
asmopt pop

	line	135
	
l111:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
	signat	_lcd_data,4217
	global	_lcd_init

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 137 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
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
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_lcd_cmd
;;		_uart_println
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text21,class=CODE,space=0,reloc=2,group=0
	line	137
global __ptext21
__ptext21:
psect	text21
	file	"src\main.c"
	line	137
	
_lcd_init:
;incstack = 0
	callstack 26
	line	139
	
l2126:
		movlw	low(STR_1)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_1)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	140
	
l2128:
	movlw	low(010h)
	movwf	((c:3986))^0f00h,c	;volatile
	line	141
	
l2130:
	movlw	low(0)
	movwf	((c:3968))^0f00h,c	;volatile
	line	142
	
l2132:
	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	144
	
l2134:
		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	145
	
l2136:
	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u2397:
decfsz	wreg,f
	bra	u2397
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u2397
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u2397
	nop
asmopt pop

	line	147
	
l2138:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	148
	
l2140:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	150
	
l2142:
		movlw	low(STR_3)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_3)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	151
	
l2144:
	movf	((c:3977))^0f00h,c,w	;volatile
	andlw	low(0F0h)
	iorlw	low(03h)
	movwf	((c:3977))^0f00h,c	;volatile
	line	152
	
l2146:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	153
	
l2148:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	154
	
l2150:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	155
	
l2152:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u2407:
decfsz	wreg,f
	bra	u2407
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u2407
asmopt pop

	line	157
	
l2154:
		movlw	low(STR_4)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_4)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	158
	
l2156:
	movf	((c:3977))^0f00h,c,w	;volatile
	andlw	low(0F0h)
	iorlw	low(03h)
	movwf	((c:3977))^0f00h,c	;volatile
	line	159
	
l2158:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	160
	
l2160:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	161
	
l2162:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	162
	
l2164:
	asmopt push
asmopt off
	movlw	240
u2417:
	nop2
decfsz	wreg,f
	bra	u2417
asmopt pop

	line	164
	
l2166:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	165
	
l2168:
	movf	((c:3977))^0f00h,c,w	;volatile
	andlw	low(0F0h)
	iorlw	low(03h)
	movwf	((c:3977))^0f00h,c	;volatile
	line	166
	
l2170:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	167
	
l2172:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	168
	
l2174:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	169
	
l2176:
	asmopt push
asmopt off
	movlw	240
u2427:
	nop2
decfsz	wreg,f
	bra	u2427
asmopt pop

	line	171
	
l2178:
		movlw	low(STR_6)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_6)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	172
	
l2180:
	movf	((c:3977))^0f00h,c,w	;volatile
	andlw	low(0F0h)
	iorlw	low(02h)
	movwf	((c:3977))^0f00h,c	;volatile
	line	173
	
l2182:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	174
	
l2184:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	175
	
l2186:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	176
	
l2188:
	asmopt push
asmopt off
	movlw	240
u2437:
	nop2
decfsz	wreg,f
	bra	u2437
asmopt pop

	line	178
	
l2190:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	179
	
l2192:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	181
	
l2194:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	182
	
l2196:
	movlw	(08h)&0ffh
	
	call	_lcd_cmd
	line	184
	
l2198:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	185
	
l2200:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	186
	
l2202:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_init+0+0)^00h,c
	movlw	198
u2447:
decfsz	wreg,f
	bra	u2447
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u2447
	nop2
asmopt pop

	line	188
	
l2204:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	189
	
l2206:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	191
	
l2208:
		movlw	low(STR_11)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_11)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	192
	
l2210:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	194
	
l2212:
		movlw	low(STR_12)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_12)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	195
	
l114:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
	signat	_lcd_init,89
	global	_uart_println

;; *************** function _uart_println *****************
;; Defined at:
;;		line 58 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   12[COMRAM] PTR const unsigned char 
;;		 -> STR_27(26), STR_26(24), main@buf_494(40), main@buf(40), 
;;		 -> STR_23(19), STR_22(22), STR_21(22), STR_18(24), 
;;		 -> STR_17(19), STR_16(22), STR_15(23), STR_14(21), 
;;		 -> STR_13(27), STR_12(19), STR_11(26), STR_10(26), 
;;		 -> STR_9(29), STR_8(27), STR_7(28), STR_6(34), 
;;		 -> STR_5(21), STR_4(22), STR_3(21), STR_2(25), 
;;		 -> STR_1(24), 
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
;;		_lcd_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text22,class=CODE,space=0,reloc=2,group=0
	line	58
global __ptext22
__ptext22:
psect	text22
	file	"src\main.c"
	line	58
	
_uart_println:
;incstack = 0
	callstack 27
	line	60
	
l1970:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	61
	
l1972:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	62
	
l1974:
	movlw	(0Ah)&0ffh
	
	call	_uart_write
	line	63
	
l84:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_println
	__end_of_uart_println:
	signat	_uart_println,4217
	global	_uart_print

;; *************** function _uart_print *****************
;; Defined at:
;;		line 50 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   10[COMRAM] PTR const unsigned char 
;;		 -> STR_27(26), STR_26(24), main@buf_494(40), main@buf(40), 
;;		 -> STR_23(19), STR_22(22), STR_21(22), STR_18(24), 
;;		 -> STR_17(19), STR_16(22), STR_15(23), STR_14(21), 
;;		 -> STR_13(27), STR_12(19), STR_11(26), STR_10(26), 
;;		 -> STR_9(29), STR_8(27), STR_7(28), STR_6(34), 
;;		 -> STR_5(21), STR_4(22), STR_3(21), STR_2(25), 
;;		 -> STR_1(24), 
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
psect	text23,class=CODE,space=0,reloc=2,group=0
	line	50
global __ptext23
__ptext23:
psect	text23
	file	"src\main.c"
	line	50
	
_uart_print:
;incstack = 0
	callstack 27
	line	52
	
l1900:
	goto	l1906
	line	54
	
l1902:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1097
	tblrd	*
	
	movf	tablat,w
	bra	u1090
u1097:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u1090:
	
	call	_uart_write
	
l1904:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	52
	
l1906:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u1107
	tblrd	*
	
	movf	tablat,w
	bra	u1100
u1107:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u1100:
	iorlw	0
	btfss	status,2
	goto	u1111
	goto	u1110
u1111:
	goto	l1902
u1110:
	line	56
	
l81:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_print
	__end_of_uart_print:
	signat	_uart_print,4217
	global	_uart_write

;; *************** function _uart_write *****************
;; Defined at:
;;		line 43 in file "src\main.c"
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
psect	text24,class=CODE,space=0,reloc=2,group=0
	line	43
global __ptext24
__ptext24:
psect	text24
	file	"src\main.c"
	line	43
	
_uart_write:
;incstack = 0
	callstack 28
	movwf	((c:uart_write@c))^00h,c
	line	45
	
l1878:
	line	46
	
l72:
	line	45
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u1061
	goto	u1060
u1061:
	goto	l72
u1060:
	line	47
	
l1880:
	movff	(c:uart_write@c),(c:4013)	;volatile
	line	48
	
l75:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_write
	__end_of_uart_write:
	signat	_uart_write,4217
	global	_lcd_clear

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 197 in file "src\main.c"
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
psect	text25,class=CODE,space=0,reloc=2,group=0
	line	197
global __ptext25
__ptext25:
psect	text25
	file	"src\main.c"
	line	197
	
_lcd_clear:
;incstack = 0
	callstack 27
	line	199
	
l2214:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	200
	
l2216:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u2457:
decfsz	wreg,f
	bra	u2457
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u2457
	nop2
asmopt pop

	line	201
	
l117:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
	signat	_lcd_clear,89
	global	_lcd_cmd

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 114 in file "src\main.c"
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
;;		_lcd_init
;;		_lcd_clear
;;		_lcd_set_cursor
;;		_main
;; This function uses a non-reentrant model
;;
psect	text26,class=CODE,space=0,reloc=2,group=0
	line	114
global __ptext26
__ptext26:
psect	text26
	file	"src\main.c"
	line	114
	
_lcd_cmd:
;incstack = 0
	callstack 25
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	116
	
l1882:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	117
	
l1884:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	118
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	119
	
l1886:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u1071
	goto	u1070

u1071:
	goto	l1890
u1070:
	
l1888:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u1081
	goto	u1080

u1081:
	goto	l1892
u1080:
	line	121
	
l1890:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u2467:
decfsz	wreg,f
	bra	u2467
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u2467
	nop2
asmopt pop

	line	122
	goto	l108
	line	125
	
l1892:
	asmopt push
asmopt off
	movlw	133
u2477:
decfsz	wreg,f
	bra	u2477
	nop
asmopt pop

	line	127
	
l108:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
	signat	_lcd_cmd,4217
	global	_lcd_write_nibble

;; *************** function _lcd_write_nibble *****************
;; Defined at:
;;		line 90 in file "src\main.c"
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
;; This function uses a non-reentrant model
;;
psect	text27,class=CODE,space=0,reloc=2,group=0
	line	90
global __ptext27
__ptext27:
psect	text27
	file	"src\main.c"
	line	90
	
_lcd_write_nibble:
;incstack = 0
	callstack 25
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	92
	
l1860:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u1021
	goto	u1020
u1021:
	goto	l93
u1020:
	line	93
	
l1862:
	bsf	((c:3977))^0f00h,c,0	;volatile
	goto	l1864
	line	94
	
l93:
	line	95
	bcf	((c:3977))^0f00h,c,0	;volatile
	line	96
	
l1864:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u1031
	goto	u1030
u1031:
	goto	l95
u1030:
	line	97
	
l1866:
	bsf	((c:3977))^0f00h,c,1	;volatile
	goto	l1868
	line	98
	
l95:
	line	99
	bcf	((c:3977))^0f00h,c,1	;volatile
	line	100
	
l1868:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u1041
	goto	u1040
u1041:
	goto	l97
u1040:
	line	101
	
l1870:
	bsf	((c:3977))^0f00h,c,2	;volatile
	goto	l1872
	line	102
	
l97:
	line	103
	bcf	((c:3977))^0f00h,c,2	;volatile
	line	104
	
l1872:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u1051
	goto	u1050
u1051:
	goto	l99
u1050:
	line	105
	
l1874:
	bsf	((c:3977))^0f00h,c,3	;volatile
	goto	l100
	line	106
	
l99:
	line	107
	bcf	((c:3977))^0f00h,c,3	;volatile
	
l100:
	line	108
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	109
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	110
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	111
	
l1876:
	asmopt push
asmopt off
	movlw	133
u2487:
decfsz	wreg,f
	bra	u2487
	nop
asmopt pop

	line	112
	
l101:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_write_nibble
	__end_of_lcd_write_nibble:
	signat	_lcd_write_nibble,4217
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
psect	text28,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	106
global __ptext28
__ptext28:
psect	text28
	file	"src\encoder.c"
	line	106
	
_encoder_init:
;incstack = 0
	callstack 29
	line	109
	
l2218:
	movlw	low(0C4h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	110
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	113
	
l2220:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	114
	
l2222:
	bsf	((c:4082))^0f00h,c,5	;volatile
	line	115
	
l2224:
	bsf	((c:4082))^0f00h,c,7	;volatile
	line	118
	
l2226:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u1431
	goto	u1430
u1431:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u1438
u1430:
	clrf	(??_encoder_init+0+0)^00h,c
u1438:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u1441
	goto	u1440
u1441:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u1448
u1440:
	clrf	(??_encoder_init+1+0)^00h,c
u1448:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:_enc_state))^00h,c
	line	119
	
l213:
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
	line	30
	
i2l2520:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u189_41
	goto	i2u189_40
i2u189_41:
	goto	i2l210
i2u189_40:
	line	33
	
i2l2522:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	34
	
i2l2524:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	37
	
i2l2526:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u190_41
	goto	i2u190_40
i2u190_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u190_48
i2u190_40:
	clrf	(??_isr+0+0)^00h,c
i2u190_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u191_41
	goto	i2u191_40
i2u191_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u191_48
i2u191_40:
	clrf	(??_isr+1+0)^00h,c
i2u191_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	38
	
i2l2528:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	41
	
i2l2530:
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
	
i2l2532:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u192_41
	goto	i2u192_40
i2u192_41:
	goto	i2l2546
i2u192_40:
	line	46
	
i2l2534:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u193_41
	goto	i2u193_40

i2u193_41:
	goto	i2l2540
i2u193_40:
	line	48
	
i2l2536:
	movlb	0	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	49
	
i2l2538:; BSR set to: 0

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	50
	goto	i2l2546
	line	51
	
i2l2540:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u194_41
	goto	i2u194_40

i2u194_41:
	goto	i2l2546
i2u194_40:
	line	53
	
i2l2542:
	movlb	0	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	goto	i2l2538
	line	58
	
i2l2546:
	movff	(c:isr@new_state),(c:_enc_state)
	line	61
	
i2l2548:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	62
	
i2l2550:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u195_41
	goto	i2u195_40

i2u195_41:
	goto	i2l2574
i2u195_40:
	line	64
	
i2l2552:
	incf	((c:_btn_debounce))^00h,c
	line	65
	
i2l2554:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u196_41
	goto	i2u196_40

i2u196_41:
	goto	i2l210
i2u196_40:
	line	67
	
i2l2556:
	movff	(c:isr@btn),(c:_last_btn)
	line	68
	
i2l2558:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	70
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u197_41
	goto	i2u197_40
i2u197_41:
	goto	i2l2562
i2u197_40:
	line	73
	
i2l2560:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	74
	goto	i2l210
	line	78
	
i2l2562:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u198_41
	goto	i2u198_40

i2u198_41:
	goto	i2l2566
i2u198_40:
	line	80
	
i2l2564:
	movlw	low(03h)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	81
	goto	i2l204
	line	82
	
i2l2566:
		movlw	132
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	3
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u199_41
	goto	i2u199_40

i2u199_41:
	goto	i2l2570
i2u199_40:
	line	84
	
i2l2568:
	movlw	low(02h)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	85
	goto	i2l204
	line	86
	
i2l2570:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u200_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u200_41
	goto	i2u200_40

i2u200_41:
	goto	i2l204
i2u200_40:
	line	88
	
i2l2572:
	movlw	low(01h)
	movlb	0	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	90
	
i2l204:
	movlw	low(01h)
	movlb	0	; () banked
	movwf	((_button_pressed))&0ffh	;volatile
	goto	i2l210
	line	96
	
i2l2574:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	98
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u201_41
	goto	i2u201_40
i2u201_41:
	goto	i2l210
i2u201_40:
	
i2l2576:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u202_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u202_41
	goto	i2u202_40

i2u202_41:
	goto	i2l210
i2u202_40:
	line	100
	
i2l2578:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	104
	
i2l210:
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
