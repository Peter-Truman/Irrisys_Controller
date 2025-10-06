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
	FNCALL	_main,_save_current_config
	FNCALL	_main,_sprintf
	FNCALL	_main,_system_init
	FNCALL	_main,_uart_init
	FNCALL	_main,_uart_println
	FNCALL	_rtc_read_time,_bcd_to_dec
	FNCALL	_rtc_read_time,_i2c_read
	FNCALL	_rtc_read_time,_i2c_restart
	FNCALL	_rtc_read_time,_i2c_start
	FNCALL	_rtc_read_time,_i2c_stop
	FNCALL	_rtc_read_time,_i2c_write
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
	FNCALL	_ad7994_read_channel,_sprintf
	FNCALL	_ad7994_read_channel,_uart_println
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_sprintf,___wmul
	FNCALL	_sprintf,_isdigit
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
	global	_display_edit_flag
	global	_flow_type_edit_flag
	global	_enable_edit_flag
	global	_menu_timeout_flag
	global	_relay_slp_edit_flag
	global	_options_menu
	global	_menu_timeout_seconds
	global	_last_btn
	global	_value_sensor
	global	_value_relay_pulse
	global	_value_display
	global	_value_rlylow
	global	_value_rlyhigh
	global	_value_scale20
	global	_value_scale4
	global	_value_enable
	global	_value_back
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
	global	_value_rlyslp
	global	_value_rlyplp
	global	_value_slpbp
	global	_value_plpbp
	global	_value_highbp
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"src\menu.c"
	line	25

;initializer for _display_edit_flag
	db	low(01h)
psect	idataBANK1,class=CODE,space=0,delta=1,noexec
global __pidataBANK1
__pidataBANK1:
	line	22

;initializer for _flow_type_edit_flag
	db	low(01h)
	line	20

;initializer for _enable_edit_flag
	db	low(01h)
psect	idataBANK2,class=CODE,space=0,delta=1,noexec
global __pidataBANK2
__pidataBANK2:
	file	"src\encoder.c"
	line	16

;initializer for _menu_timeout_flag
	db	low(01h)
	file	"src\menu.c"
	line	28

;initializer for _relay_slp_edit_flag
	db	low(01h)
psect	idataBANK3,class=CODE,space=0,delta=1,noexec
global __pidataBANK3
__pidataBANK3:
	line	65

;initializer for _options_menu
		db	low(STR_78)
	db	high(STR_78)

		db	low(STR_79)
	db	high(STR_79)

		db	low(STR_80)
	db	high(STR_80)

		db	low(STR_81)
	db	high(STR_81)

		db	low(STR_82)
	db	high(STR_82)

	file	"src\eeprom.c"
	line	11

;initializer for _menu_timeout_seconds
	dw	(01Eh)&0ffffh
	file	"src\encoder.c"
	line	32

;initializer for _last_btn
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
	line	85

;initializer for _value_back
	db	low(042h)
	db	low(061h)
	db	low(063h)
	db	low(06Bh)
	db	low(0)
psect	idataBANK4,class=CODE,space=0,delta=1,noexec
global __pidataBANK4
__pidataBANK4:
	line	1230

;initializer for menu_draw_setup@F2659
		db	low(STR_211)
	db	high(STR_211)

		db	low(STR_212)
	db	high(STR_212)

		db	low(STR_213)
	db	high(STR_213)

		db	low(STR_214)
	db	high(STR_214)

		db	low(STR_215)
	db	high(STR_215)

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
	line	52
_menu_item_options:
	db	low(0)
	db	low(02h)
		db	low(STR_43)
	db	high(STR_43)

		db	low(STR_44)
	db	high(STR_44)

		db	low(STR_45)
	db	high(STR_45)

		db	low(STR_46)
	db	high(STR_46)

		db	low(STR_47)
	db	high(STR_47)

	db	low(01h)
	db	low(03h)
		db	low(STR_48)
	db	high(STR_48)

		db	low(STR_49)
	db	high(STR_49)

		db	low(STR_50)
	db	high(STR_50)

		db	low(STR_51)
	db	high(STR_51)

		db	low(STR_52)
	db	high(STR_52)

	db	low(02h)
	db	low(02h)
		db	low(STR_53)
	db	high(STR_53)

		db	low(STR_54)
	db	high(STR_54)

		db	low(STR_55)
	db	high(STR_55)

		db	low(STR_56)
	db	high(STR_56)

		db	low(STR_57)
	db	high(STR_57)

	db	low(03h)
	db	low(02h)
		db	low(STR_58)
	db	high(STR_58)

		db	low(STR_59)
	db	high(STR_59)

		db	low(STR_60)
	db	high(STR_60)

		db	low(STR_61)
	db	high(STR_61)

		db	low(STR_62)
	db	high(STR_62)

	db	low(04h)
	db	low(02h)
		db	low(STR_63)
	db	high(STR_63)

		db	low(STR_64)
	db	high(STR_64)

		db	low(STR_65)
	db	high(STR_65)

		db	low(STR_66)
	db	high(STR_66)

		db	low(STR_67)
	db	high(STR_67)

	db	low(05h)
	db	low(02h)
		db	low(STR_68)
	db	high(STR_68)

		db	low(STR_69)
	db	high(STR_69)

		db	low(STR_70)
	db	high(STR_70)

		db	low(STR_71)
	db	high(STR_71)

		db	low(STR_72)
	db	high(STR_72)

	db	low(06h)
	db	low(03h)
		db	low(STR_73)
	db	high(STR_73)

		db	low(STR_74)
	db	high(STR_74)

		db	low(STR_75)
	db	high(STR_75)

		db	low(STR_76)
	db	high(STR_76)

		db	low(STR_77)
	db	high(STR_77)

	global __end_of_menu_item_options
__end_of_menu_item_options:
	global	_pressure_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	112
_pressure_menu_template:
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

	db	low(01h)
		db	low(STR_96)
	db	high(STR_96)

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

	db	low(01h)
		db	low(STR_124)
	db	high(STR_124)

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

	db	low(0)
	global __end_of_temp_menu_template
__end_of_temp_menu_template:
	global	_flow_digital_template
psect	mediumconst
	file	"src\menu.c"
	line	143
_flow_digital_template:
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

	db	low(0)
	global __end_of_flow_digital_template
__end_of_flow_digital_template:
	global	_clock_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	170
_clock_menu_template:
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

	db	low(01h)
		db	low(STR_129)
	db	high(STR_129)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_clock_menu_template
__end_of_clock_menu_template:
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
	global	_menu
	global	_menu_timeout_reload
	global	_relay_high_edit_flag
	global	_input_config
	global	_relay_state
	global	_button_hold_ms
	global	_enc_accumulator
	global	_ms_counter
	global	_relay_latch_mode
	global	_relay_low_edit_flag
	global	_relay_plp_edit_flag
	global	_flow_units_edit_flag
	global	_sensor_edit_flag
	global	_menu_timeout_timer
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
	
STR_135:; BSR set to: 2

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
	
STR_285:; BSR set to: 2

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
	
STR_189:; BSR set to: 2

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
	
STR_1:; BSR set to: 2

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
	
STR_236:; BSR set to: 2

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
	
STR_132:; BSR set to: 2

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
	
STR_292:; BSR set to: 2

	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	82	;'R'
	db	101	;'e'
	db	97	;'a'
	db	100	;'d'
	db	58	;':'
	db	32
	db	77	;'M'
	db	83	;'S'
	db	66	;'B'
	db	61	;'='
	db	48	;'0'
	db	120	;'x'
	db	37
	db	48	;'0'
	db	50	;'2'
	db	88	;'X'
	db	32
	db	76	;'L'
	db	83	;'S'
	db	66	;'B'
	db	61	;'='
	db	48	;'0'
	db	120	;'x'
	db	37
	db	48	;'0'
	db	50	;'2'
	db	88	;'X'
	db	32
	db	82	;'R'
	db	97	;'a'
	db	119	;'w'
	db	61	;'='
	db	48	;'0'
	db	120	;'x'
	db	37
	db	48	;'0'
	db	52	;'4'
	db	88	;'X'
	db	0
	
STR_287:; BSR set to: 2

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
	
STR_257:; BSR set to: 2

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
	
STR_2:; BSR set to: 2

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
	
STR_10:; BSR set to: 2

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
	
STR_283:; BSR set to: 2

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
	
STR_6:; BSR set to: 2

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
	
STR_286:; BSR set to: 2

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
	
STR_288:; BSR set to: 2

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
	
STR_271:; BSR set to: 2

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
	
STR_281:; BSR set to: 2

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
	
STR_243:; BSR set to: 2

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
	
STR_246:; BSR set to: 2

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
	
STR_9:; BSR set to: 2

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
	
STR_23:; BSR set to: 2

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
	
STR_40:; BSR set to: 2

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
	
STR_130:; BSR set to: 2

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
	
STR_227:; BSR set to: 2

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
	
STR_248:; BSR set to: 2

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
	
STR_26:; BSR set to: 2

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
	
STR_291:; BSR set to: 2

	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	82	;'R'
	db	101	;'e'
	db	97	;'a'
	db	100	;'d'
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
	db	73	;'I'
	db	110	;'n'
	db	118	;'v'
	db	97	;'a'
	db	108	;'l'
	db	105	;'i'
	db	100	;'d'
	db	32
	db	99	;'c'
	db	104	;'h'
	db	97	;'a'
	db	110	;'n'
	db	110	;'n'
	db	101	;'e'
	db	108	;'l'
	db	0
	
STR_11:; BSR set to: 2

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
	
STR_37:; BSR set to: 2

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
	
STR_256:; BSR set to: 2

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
	
STR_272:; BSR set to: 2

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
	
STR_245:; BSR set to: 2

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
	
STR_282:; BSR set to: 2

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
	
STR_284:; BSR set to: 2

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
	
STR_190:; BSR set to: 2

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
	
STR_289:; BSR set to: 2

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
	
STR_131:; BSR set to: 2

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
	
STR_191:; BSR set to: 2

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
	
STR_237:; BSR set to: 2

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
	
STR_4:; BSR set to: 2

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
	
STR_280:; BSR set to: 2

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
	
STR_252:; BSR set to: 2

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
	
STR_247:; BSR set to: 2

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
	
STR_13:; BSR set to: 2

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
	
STR_12:; BSR set to: 2

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
	
STR_136:; BSR set to: 2

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
	
STR_260:; BSR set to: 2

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
	
STR_3:; BSR set to: 2

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
	
STR_249:; BSR set to: 2

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
	
STR_253:; BSR set to: 2

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
	
STR_31:; BSR set to: 2

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
	
STR_251:; BSR set to: 2

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
	
STR_133:; BSR set to: 2

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
	
STR_273:; BSR set to: 2

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
	
STR_19:; BSR set to: 2

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
	
STR_244:; BSR set to: 2

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
	
STR_5:; BSR set to: 2

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
	
STR_14:; BSR set to: 2

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
	
STR_27:; BSR set to: 2

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
	
STR_25:; BSR set to: 2

	db	67	;'C'
	db	72	;'H'
	db	51	;'3'
	db	58	;':'
	db	37
	db	52	;'4'
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
	
STR_279:; BSR set to: 2

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
	
STR_34:; BSR set to: 2

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
	
STR_17:; BSR set to: 2

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
	
STR_20:; BSR set to: 2

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
	
STR_21:; BSR set to: 2

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
	
STR_290:; BSR set to: 2

	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	82	;'R'
	db	101	;'e'
	db	97	;'a'
	db	100	;'d'
	db	32
	db	67	;'C'
	db	72	;'H'
	db	37
	db	117	;'u'
	db	58	;':'
	db	32
	db	83	;'S'
	db	116	;'t'
	db	97	;'a'
	db	114	;'r'
	db	116	;'t'
	db	0
	
STR_140:; BSR set to: 2

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
	
STR_210:; BSR set to: 2

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
	
STR_200:; BSR set to: 2

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
	
STR_36:; BSR set to: 2

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
	
STR_278:; BSR set to: 2

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
	
STR_250:; BSR set to: 2

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
	
STR_7:; BSR set to: 2

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
	
STR_35:; BSR set to: 2

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
	
STR_29:; BSR set to: 2

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
	
STR_293:; BSR set to: 2

	db	65	;'A'
	db	68	;'D'
	db	67	;'C'
	db	32
	db	82	;'R'
	db	101	;'e'
	db	97	;'a'
	db	100	;'d'
	db	58	;':'
	db	32
	db	70	;'F'
	db	105	;'i'
	db	110	;'n'
	db	97	;'a'
	db	108	;'l'
	db	61	;'='
	db	37
	db	117	;'u'
	db	0
	
STR_18:; BSR set to: 2

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
	
STR_22:; BSR set to: 2

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
	
STR_295:; BSR set to: 2

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
	
STR_28:; BSR set to: 2

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
	
STR_16:; BSR set to: 2

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
	
STR_8:; BSR set to: 2

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
	
STR_24:; BSR set to: 2

	db	67	;'C'
	db	72	;'H'
	db	49	;'1'
	db	58	;':'
	db	37
	db	52	;'4'
	db	117	;'u'
	db	32
	db	67	;'C'
	db	72	;'H'
	db	50	;'2'
	db	58	;':'
	db	37
	db	52	;'4'
	db	117	;'u'
	db	0
	
STR_30:; BSR set to: 2

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
	
STR_89:; BSR set to: 2

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
	
STR_80:; BSR set to: 2

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
	
STR_15:; BSR set to: 2

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
	
STR_121:; BSR set to: 2

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
	
STR_87:; BSR set to: 2

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
	
STR_32:; BSR set to: 2

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
	
STR_86:; BSR set to: 2

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
	
STR_110:; BSR set to: 2

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
	
STR_79:; BSR set to: 2

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
	
STR_85:; BSR set to: 2

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
	
STR_148:; BSR set to: 2

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
	
STR_127:; BSR set to: 2

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
	
STR_101:; BSR set to: 2

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
	
STR_78:; BSR set to: 2

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
	
STR_88:; BSR set to: 2

	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_102:; BSR set to: 2

	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	84	;'T'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_203:; BSR set to: 2

	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_193:; BSR set to: 2

	db	37
	db	99	;'c'
	db	37
	db	100	;'d'
	db	37
	db	100	;'d'
	db	37
	db	100	;'d'
	db	0
	
STR_43:; BSR set to: 2

	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_75:; BSR set to: 2

	db	78	;'N'
	db	111	;'o'
	db	116	;'t'
	db	32
	db	85	;'U'
	db	115	;'s'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_92:; BSR set to: 2

	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	0
	
STR_120:; BSR set to: 2

	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_93:; BSR set to: 2

	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_94:; BSR set to: 2

	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_44:; BSR set to: 2

	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_54:; BSR set to: 2

	db	68	;'D'
	db	105	;'i'
	db	103	;'g'
	db	105	;'i'
	db	116	;'t'
	db	97	;'a'
	db	108	;'l'
	db	0
	
STR_126:; BSR set to: 2

	db	69	;'E'
	db	110	;'n'
	db	100	;'d'
	db	32
	db	82	;'R'
	db	117	;'u'
	db	110	;'n'
	db	0
	
STR_111:; BSR set to: 2

	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_109:; BSR set to: 2

	db	78	;'N'
	db	111	;'o'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_95:; BSR set to: 2

	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	0
	
STR_39:; BSR set to: 2

	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_294:; BSR set to: 2

	db	40
	db	110	;'n'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	41
	db	0
	
STR_83:; BSR set to: 2

	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	0
	
STR_53:; BSR set to: 2

	db	65	;'A'
	db	110	;'n'
	db	97	;'a'
	db	108	;'l'
	db	111	;'o'
	db	103	;'g'
	db	0
	
STR_84:; BSR set to: 2

	db	83	;'S'
	db	101	;'e'
	db	110	;'n'
	db	115	;'s'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_238:; BSR set to: 2

	db	67	;'C'
	db	76	;'L'
	db	79	;'O'
	db	67	;'C'
	db	75	;'K'
	db	0
	
STR_90:; BSR set to: 2

	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_91:; BSR set to: 2

	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_145:; BSR set to: 2

	db	37
	db	43
	db	48	;'0'
	db	52	;'4'
	db	100	;'d'
	db	0
	
STR_73:; BSR set to: 2

	db	76	;'L'
	db	97	;'a'
	db	116	;'t'
	db	99	;'c'
	db	104	;'h'
	db	0
	
STR_214:; BSR set to: 2

	db	67	;'C'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_117:; BSR set to: 2

	db	85	;'U'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	115	;'s'
	db	0
	
STR_81:; BSR set to: 2

	db	65	;'A'
	db	98	;'b'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_33:; BSR set to: 2

	db	82	;'R'
	db	101	;'e'
	db	97	;'a'
	db	100	;'d'
	db	121	;'y'
	db	0
	
STR_147:; BSR set to: 2

	db	37
	db	48	;'0'
	db	51	;'3'
	db	100	;'d'
	db	0
	
STR_68:; BSR set to: 2

	db	72	;'H'
	db	105	;'i'
	db	100	;'d'
	db	101	;'e'
	db	0
	
STR_108:; BSR set to: 2

	db	84	;'T'
	db	121	;'y'
	db	112	;'p'
	db	101	;'e'
	db	0
	
STR_96:; BSR set to: 2

	db	66	;'B'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_82:; BSR set to: 2

	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	0
	
STR_69:; BSR set to: 2

	db	83	;'S'
	db	104	;'h'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_64:; BSR set to: 2

	db	76	;'L'
	db	112	;'p'
	db	83	;'S'
	db	0
	
STR_63:; BSR set to: 2

	db	37
	db	0
	
STR_138:; BSR set to: 2

	db	40
	db	0
	
STR_221:; BSR set to: 2

	db	42
	db	0
	
STR_201:; BSR set to: 2

	db	91	;'['
	db	0
	
STR_202:; BSR set to: 2

	db	93	;']'
	db	0
STR_104	equ	STR_95+0
STR_112	equ	STR_95+0
STR_123	equ	STR_95+0
STR_128	equ	STR_95+0
STR_50	equ	STR_109+3
STR_173	equ	STR_109+3
STR_218	equ	STR_109+3
STR_161	equ	STR_69+0
STR_171	equ	STR_69+0
STR_176	equ	STR_69+0
STR_235	equ	STR_69+0
STR_277	equ	STR_69+0
STR_122	equ	STR_111+0
STR_58	equ	STR_111+4
STR_187	equ	STR_111+4
STR_134	equ	STR_245+29
STR_141	equ	STR_245+29
STR_228	equ	STR_245+29
STR_98	equ	STR_84+0
STR_107	equ	STR_84+0
STR_115	equ	STR_84+0
STR_49	equ	STR_101+5
STR_163	equ	STR_101+5
STR_217	equ	STR_101+5
STR_175	equ	STR_54+0
STR_105	equ	STR_96+0
STR_113	equ	STR_96+0
STR_124	equ	STR_96+0
STR_129	equ	STR_96+0
STR_215	equ	STR_96+0
STR_103	equ	STR_92+0
STR_59	equ	STR_92+4
STR_152	equ	STR_73+0
STR_155	equ	STR_73+0
STR_158	equ	STR_73+0
STR_168	equ	STR_73+0
STR_178	equ	STR_73+0
STR_231	equ	STR_73+0
STR_275	equ	STR_73+0
STR_174	equ	STR_53+0
STR_42	equ	STR_36+0
STR_74	equ	STR_127+4
STR_153	equ	STR_127+4
STR_156	equ	STR_127+4
STR_159	equ	STR_127+4
STR_169	equ	STR_127+4
STR_179	equ	STR_127+4
STR_232	equ	STR_127+4
STR_276	equ	STR_127+4
STR_48	equ	STR_87+3
STR_144	equ	STR_87+3
STR_216	equ	STR_87+3
STR_116	equ	STR_108+0
STR_97	equ	STR_83+0
STR_106	equ	STR_83+0
STR_114	equ	STR_83+0
STR_125	equ	STR_83+0
STR_162	equ	STR_68+0
STR_172	equ	STR_68+0
STR_177	equ	STR_68+0
STR_154	equ	STR_75+0
STR_157	equ	STR_75+0
STR_160	equ	STR_75+0
STR_170	equ	STR_75+0
STR_180	equ	STR_75+0
STR_233	equ	STR_75+0
STR_143	equ	STR_43+0
STR_230	equ	STR_43+0
STR_142	equ	STR_44+0
STR_229	equ	STR_44+0
STR_274	equ	STR_44+0
STR_146	equ	STR_145+0
STR_164	equ	STR_145+0
STR_165	equ	STR_145+0
STR_183	equ	STR_145+0
STR_184	equ	STR_145+0
STR_261	equ	STR_145+0
STR_262	equ	STR_145+0
STR_265	equ	STR_145+0
STR_266	equ	STR_145+0
STR_268	equ	STR_145+0
STR_269	equ	STR_145+0
STR_149	equ	STR_147+0
STR_185	equ	STR_147+0
STR_263	equ	STR_147+0
STR_264	equ	STR_147+0
STR_267	equ	STR_147+0
STR_270	equ	STR_147+0
STR_150	equ	STR_148+0
STR_151	equ	STR_148+0
STR_167	equ	STR_148+0
STR_186	equ	STR_148+0
STR_188	equ	STR_148+0
STR_234	equ	STR_148+0
STR_254	equ	STR_148+0
STR_255	equ	STR_148+0
STR_259	equ	STR_148+0
STR_192	equ	STR_193+2
STR_258	equ	STR_253+0
STR_166	equ	STR_27+20
STR_208	equ	STR_202+0
STR_220	equ	STR_202+0
STR_224	equ	STR_202+0
STR_241	equ	STR_202+0
STR_206	equ	STR_201+0
STR_219	equ	STR_201+0
STR_223	equ	STR_201+0
STR_239	equ	STR_201+0
STR_182	equ	STR_64+0
STR_38	equ	STR_32+0
STR_99	equ	STR_85+0
STR_118	equ	STR_85+0
STR_100	equ	STR_86+0
STR_119	equ	STR_86+0
STR_41	equ	STR_35+0
STR_225	equ	STR_221+0
STR_139	equ	STR_294+5
STR_196	equ	STR_294+5
STR_199	equ	STR_294+5
STR_209	equ	STR_294+5
STR_242	equ	STR_294+5
STR_195	equ	STR_138+0
STR_198	equ	STR_138+0
STR_207	equ	STR_138+0
STR_240	equ	STR_138+0
STR_181	equ	STR_63+0
STR_137	equ	STR_140+13
STR_194	equ	STR_140+14
STR_197	equ	STR_140+15
STR_204	equ	STR_140+15
STR_222	equ	STR_140+19
STR_226	equ	STR_140+19
STR_45	equ	STR_140+20
STR_46	equ	STR_140+20
STR_47	equ	STR_140+20
STR_51	equ	STR_140+20
STR_52	equ	STR_140+20
STR_55	equ	STR_140+20
STR_56	equ	STR_140+20
STR_57	equ	STR_140+20
STR_60	equ	STR_140+20
STR_61	equ	STR_140+20
STR_62	equ	STR_140+20
STR_65	equ	STR_140+20
STR_66	equ	STR_140+20
STR_67	equ	STR_140+20
STR_70	equ	STR_140+20
STR_71	equ	STR_140+20
STR_72	equ	STR_140+20
STR_76	equ	STR_140+20
STR_77	equ	STR_140+20
STR_205	equ	STR_140+20
STR_211	equ	STR_140+20
STR_212	equ	STR_140+20
STR_213	equ	STR_140+20
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
	global	_menu
_menu:
       ds      22
	global	_menu_timeout_reload
_menu_timeout_reload:
       ds      2
	global	_relay_high_edit_flag
_relay_high_edit_flag:
       ds      1
psect	dataCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pdataCOMRAM
__pdataCOMRAM:
	file	"src\menu.c"
	line	25
	global	_display_edit_flag
_display_edit_flag:
       ds      1
psect	bssBANK0,class=BANK0,space=1,noexec,lowdata
global __pbssBANK0
__pbssBANK0:
	global	_relay_state
_relay_state:
       ds      1
psect	bssBANK1,class=BANK1,space=1,noexec,lowdata
global __pbssBANK1
__pbssBANK1:
	global	_button_hold_ms
_button_hold_ms:
       ds      2
_enc_accumulator:
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
	global	_flow_units_edit_flag
_flow_units_edit_flag:
       ds      1
	global	_sensor_edit_flag
_sensor_edit_flag:
       ds      1
psect	dataBANK1,class=BANK1,space=1,noexec,lowdata
global __pdataBANK1
__pdataBANK1:
	file	"src\menu.c"
	line	22
	global	_flow_type_edit_flag
_flow_type_edit_flag:
       ds      1
psect	dataBANK1
	file	"src\menu.c"
	line	20
	global	_enable_edit_flag
_enable_edit_flag:
       ds      1
psect	bssBANK2,class=BANK2,space=1,noexec,lowdata
global __pbssBANK2
__pbssBANK2:
	global	_menu_timeout_timer
_menu_timeout_timer:
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
	line	28
	global	_relay_slp_edit_flag
_relay_slp_edit_flag:
       ds      1
psect	bssBANK3,class=BANK3,space=1,noexec,lowdata
global __pbssBANK3
__pbssBANK3:
menu_update_numeric_value@F2630:
       ds      6
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
psect	dataBANK3,class=BANK3,space=1,noexec,lowdata
global __pdataBANK3
__pdataBANK3:
	file	"src\menu.c"
	line	65
	global	_options_menu
_options_menu:
       ds      10
psect	dataBANK3
	file	"src\eeprom.c"
	line	11
	global	_menu_timeout_seconds
_menu_timeout_seconds:
       ds      2
psect	dataBANK3
	file	"src\encoder.c"
	line	32
_last_btn:
       ds      1
psect	dataBANK3
	file	"src\menu.c"
	line	74
_value_sensor:
       ds      12
psect	dataBANK3
	file	"src\menu.c"
	line	102
_value_relay_pulse:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	84
_value_display:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	83
_value_rlylow:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	80
_value_rlyhigh:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	76
_value_scale20:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	75
_value_scale4:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	73
_value_enable:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	85
_value_back:
       ds      5
psect	bssBANK4,class=BANK4,space=1,noexec,lowdata
global __pbssBANK4
__pbssBANK4:
_original_value:
       ds      10
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
	line	101
_value_end_runtime:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	100
_value_clock_enable:
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
	line	91
_value_flow_type:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	90
_value_high_temp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	89
_value_low_pressure:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	88
_value_hi_pressure:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	82
_value_rlyslp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	81
_value_rlyplp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	79
_value_slpbp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	78
_value_plpbp:
       ds      10
psect	dataBANK4
	file	"src\menu.c"
	line	77
_value_highbp:
       ds      10
psect	bssBANK5,class=BANK5,space=1,noexec,lowdata
global __pbssBANK5
__pbssBANK5:
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
; Initialize objects allocated to BANK4 (190 bytes)
	global __pidataBANK4
	; load TBLPTR registers with __pidataBANK4
	movlw	low (__pidataBANK4)
	movwf	tblptrl
	movlw	high(__pidataBANK4)
	movwf	tblptrh
	movlw	low highword(__pidataBANK4)
	movwf	tblptru
	lfsr	0,__pdataBANK4
	lfsr	1,190
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK3 (100 bytes)
	global __pidataBANK3
	; load TBLPTR registers with __pidataBANK3
	movlw	low (__pidataBANK3)
	movwf	tblptrl
	movlw	high(__pidataBANK3)
	movwf	tblptrh
	movlw	low highword(__pidataBANK3)
	movwf	tblptru
	lfsr	0,__pdataBANK3
	lfsr	1,100
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
; Initialize objects allocated to BANK2 (2 bytes)
	global __pidataBANK2
	; load TBLPTR registers with __pidataBANK2
	movlw	low (__pidataBANK2)
	movwf	tblptrl
	movlw	high(__pidataBANK2)
	movwf	tblptrh
	movlw	low highword(__pidataBANK2)
	movwf	tblptru
	tblrd*+ ;fetch initializer
	movff	tablat, __pdataBANK2+0		
	tblrd*+ ;fetch initializer
	movff	tablat, __pdataBANK2+1		
; Initialize objects allocated to BANK1 (2 bytes)
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
	tblrd*+ ;fetch initializer
	movff	tablat, __pdataBANK1+1		
; Initialize objects allocated to COMRAM (1 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	tblrd*+ ;fetch initializer
	movff	tablat, __pdataCOMRAM+0		
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
; Clear objects allocated to BANK4 (10 bytes)
	global __pbssBANK4
lfsr	0,__pbssBANK4
movlw	10
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
; Clear objects allocated to BANK3 (123 bytes)
	global __pbssBANK3
lfsr	0,__pbssBANK3
movlw	123
clear_3:
clrf	postinc0,c
decf	wreg
bnz	clear_3
; Clear objects allocated to BANK2 (14 bytes)
	global __pbssBANK2
lfsr	0,__pbssBANK2
movlw	14
clear_4:
clrf	postinc0,c
decf	wreg
bnz	clear_4
; Clear objects allocated to BANK1 (9 bytes)
	global __pbssBANK1
lfsr	0,__pbssBANK1
movlw	9
clear_5:
clrf	postinc0,c
decf	wreg
bnz	clear_5
; Clear objects allocated to BANK0 (1 bytes)
	global __pbssBANK0
movlb	0
clrf	(__pbssBANK0+0)&0xffh,b
; Clear objects allocated to COMRAM (25 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	25
clear_6:
clrf	postinc0,c
decf	wreg
bnz	clear_6
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
psect	cstackBANK3,class=BANK3,space=1,noexec,lowdata
global __pcstackBANK3
__pcstackBANK3:
	global	main@buf_670
main@buf_670:	; 30 bytes @ 0x0
	ds   30
psect	cstackBANK2,class=BANK2,space=1,noexec,lowdata
global __pcstackBANK2
__pcstackBANK2:
	global	main@time_buf
main@time_buf:	; 60 bytes @ 0x0
	ds   60
	global	main@buf_640
main@buf_640:	; 60 bytes @ 0x3C
	ds   60
	global	main@buf
main@buf:	; 50 bytes @ 0x78
	ds   50
	global	main@buf_643
main@buf_643:	; 40 bytes @ 0xAA
	ds   40
	global	main@buf_603
main@buf_603:	; 30 bytes @ 0xD2
	ds   30
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
	global	main@adc_ch2
main@adc_ch2:	; 2 bytes @ 0xE6
	ds   2
	global	main@adc_ch3
main@adc_ch3:	; 2 bytes @ 0xE8
	ds   2
	global	main@last_button
main@last_button:	; 1 bytes @ 0xEA
	ds   1
	global	main@adc_error
main@adc_error:	; 1 bytes @ 0xEB
	ds   1
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0xEC
	ds   2
	global	main@current_time
main@current_time:	; 7 bytes @ 0xEE
	ds   7
psect	cstackBANK0,class=BANK0,space=1,noexec,lowdata
global __pcstackBANK0
__pcstackBANK0:
	global	menu_update_edit_value@display_buf
menu_update_edit_value@display_buf:	; 10 bytes @ 0x0
	global	menu_draw_input@value_buf
menu_draw_input@value_buf:	; 15 bytes @ 0x0
	global	ad7994_read_channel@buf
ad7994_read_channel@buf:	; 40 bytes @ 0x0
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
	global	ad7994_read_channel@channel
ad7994_read_channel@channel:	; 1 bytes @ 0x28
	ds   1
	global	menu_draw_input@show_brackets
menu_draw_input@show_brackets:	; 1 bytes @ 0x29
	global	ad7994_read_channel@config_byte
ad7994_read_channel@config_byte:	; 1 bytes @ 0x29
	ds   1
	global	menu_draw_input@sensor_type
menu_draw_input@sensor_type:	; 1 bytes @ 0x2A
	global	ad7994_read_channel@msb
ad7994_read_channel@msb:	; 1 bytes @ 0x2A
	ds   1
	global	menu_draw_input@flow_type
menu_draw_input@flow_type:	; 1 bytes @ 0x2B
	global	ad7994_read_channel@lsb
ad7994_read_channel@lsb:	; 1 bytes @ 0x2B
	ds   1
	global	menu_draw_input@i
menu_draw_input@i:	; 1 bytes @ 0x2C
	global	ad7994_read_channel@result
ad7994_read_channel@result:	; 2 bytes @ 0x2C
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
	global	_rebuild_input_menu$2996
_rebuild_input_menu$2996:	; 2 bytes @ 0x54
	ds   2
	global	_rebuild_input_menu$2997
_rebuild_input_menu$2997:	; 2 bytes @ 0x56
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
	global	main@lcd_buf
main@lcd_buf:	; 17 bytes @ 0x6E
	ds   17
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
?_load_factory_defaults:	; 1 bytes @ 0x0
?_sync_menu_variables:	; 1 bytes @ 0x0
?_uart_init:	; 1 bytes @ 0x0
?_uart_write:	; 1 bytes @ 0x0
?_system_init:	; 1 bytes @ 0x0
?_trigger_relay_pulse:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_isr:	; 1 bytes @ 0x0
?_lcd_clear_line:	; 1 bytes @ 0x0
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
	global	_isdigit$2724
_isdigit$2724:	; 1 bytes @ 0xF
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
	global	_is_numeric_field$1147
_is_numeric_field$1147:	; 1 bytes @ 0x11
	global	is_time_field@line
is_time_field@line:	; 1 bytes @ 0x11
	global	_is_option_field$1159
_is_option_field$1159:	; 1 bytes @ 0x11
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
??___wmul:	; 1 bytes @ 0x12
??___lwmod:	; 1 bytes @ 0x12
	global	_is_numeric_field$1148
_is_numeric_field$1148:	; 1 bytes @ 0x12
	global	_is_option_field$1160
_is_option_field$1160:	; 1 bytes @ 0x12
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
	global	strcpy@cp
strcpy@cp:	; 2 bytes @ 0x12
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
	global	_is_option_field$1161
_is_option_field$1161:	; 1 bytes @ 0x13
	global	lcd_set_cursor@row
lcd_set_cursor@row:	; 1 bytes @ 0x13
	global	rtc_write_register@value
rtc_write_register@value:	; 1 bytes @ 0x13
	global	calculate_config_checksum@data
calculate_config_checksum@data:	; 2 bytes @ 0x13
	global	eeprom_write_word@data
eeprom_write_word@data:	; 2 bytes @ 0x13
	global	eeprom_write_block@address
eeprom_write_block@address:	; 2 bytes @ 0x13
	global	i2c_read@timeout
i2c_read@timeout:	; 2 bytes @ 0x13
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x13
	ds   1
??_memcpy:	; 1 bytes @ 0x14
??_rtc_write_register:	; 1 bytes @ 0x14
	global	is_option_field@line
is_option_field@line:	; 1 bytes @ 0x14
	global	lcd_set_cursor@addr
lcd_set_cursor@addr:	; 1 bytes @ 0x14
	global	rtc_write_register@reg
rtc_write_register@reg:	; 1 bytes @ 0x14
	global	strcmp@r
strcmp@r:	; 1 bytes @ 0x14
	global	eeprom_read_block@length
eeprom_read_block@length:	; 2 bytes @ 0x14
	global	memcpy@d
memcpy@d:	; 2 bytes @ 0x14
	ds   1
??_rtc_init:	; 1 bytes @ 0x15
??_menu_update_numeric_value:	; 1 bytes @ 0x15
?_lcd_print_at:	; 1 bytes @ 0x15
??_lcd_clear_line:	; 1 bytes @ 0x15
??_eeprom_write_word:	; 1 bytes @ 0x15
	global	lcd_print_at@col
lcd_print_at@col:	; 1 bytes @ 0x15
	global	lcd_clear_line@row
lcd_clear_line@row:	; 1 bytes @ 0x15
	global	menu_update_numeric_value@sensor_type
menu_update_numeric_value@sensor_type:	; 1 bytes @ 0x15
	global	i2c_read@data
i2c_read@data:	; 1 bytes @ 0x15
	global	calculate_config_checksum@j
calculate_config_checksum@j:	; 2 bytes @ 0x15
	global	eeprom_read_word@result
eeprom_read_word@result:	; 2 bytes @ 0x15
	global	eeprom_write_block@length
eeprom_write_block@length:	; 2 bytes @ 0x15
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x15
	ds   1
?_rtc_read_time:	; 1 bytes @ 0x16
??_eeprom_read_block:	; 1 bytes @ 0x16
	global	menu_update_numeric_value@flow_type
menu_update_numeric_value@flow_type:	; 1 bytes @ 0x16
	global	lcd_print_at@str
lcd_print_at@str:	; 2 bytes @ 0x16
	global	get_current_numeric_value@value
get_current_numeric_value@value:	; 2 bytes @ 0x16
	global	eeprom_read_block@ptr
eeprom_read_block@ptr:	; 2 bytes @ 0x16
	global	rtc_read_time@time
rtc_read_time@time:	; 2 bytes @ 0x16
	global	memcpy@s
memcpy@s:	; 2 bytes @ 0x16
	ds   1
??_eeprom_write_block:	; 1 bytes @ 0x17
??___lwdiv:	; 1 bytes @ 0x17
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x17
	global	_menu_update_numeric_value$1343
_menu_update_numeric_value$1343:	; 2 bytes @ 0x17
	global	calculate_config_checksum@j_1717
calculate_config_checksum@j_1717:	; 2 bytes @ 0x17
	global	eeprom_write_block@ptr
eeprom_write_block@ptr:	; 2 bytes @ 0x17
	ds   1
??_rtc_read_time:	; 1 bytes @ 0x18
??_lcd_print_at:	; 1 bytes @ 0x18
	global	lcd_print_at@row
lcd_print_at@row:	; 1 bytes @ 0x18
	global	memcpy@tmp
memcpy@tmp:	; 1 bytes @ 0x18
	global	eeprom_read_block@i
eeprom_read_block@i:	; 2 bytes @ 0x18
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x18
	global	rtc_read_time@data
rtc_read_time@data:	; 7 bytes @ 0x18
	ds   1
??_menu_draw_options:	; 1 bytes @ 0x19
??_menu_draw_setup:	; 1 bytes @ 0x19
??_menu_draw_clock:	; 1 bytes @ 0x19
??_load_factory_defaults:	; 1 bytes @ 0x19
	global	menu_draw_options@item_index
menu_draw_options@item_index:	; 1 bytes @ 0x19
	global	calculate_config_checksum@i
calculate_config_checksum@i:	; 1 bytes @ 0x19
	global	_menu_update_numeric_value$1344
_menu_update_numeric_value$1344:	; 2 bytes @ 0x19
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
	global	init_numeric_editor@value
init_numeric_editor@value:	; 2 bytes @ 0x1A
	global	sprintf@sp
sprintf@sp:	; 2 bytes @ 0x1A
	ds   1
??_save_current_config:	; 1 bytes @ 0x1B
	global	_menu_update_numeric_value$1345
_menu_update_numeric_value$1345:	; 2 bytes @ 0x1B
	global	save_current_config@checksum
save_current_config@checksum:	; 2 bytes @ 0x1B
	ds   1
??_init_numeric_editor:	; 1 bytes @ 0x1C
	global	sprintf@f
sprintf@f:	; 2 bytes @ 0x1C
	ds   1
	global	save_current_config@i
save_current_config@i:	; 1 bytes @ 0x1D
	global	_menu_update_numeric_value$1346
_menu_update_numeric_value$1346:	; 2 bytes @ 0x1D
	ds   1
??_eeprom_init:	; 1 bytes @ 0x1E
	global	init_numeric_editor@flow_type
init_numeric_editor@flow_type:	; 1 bytes @ 0x1E
	global	eeprom_init@stored_checksum
eeprom_init@stored_checksum:	; 2 bytes @ 0x1E
	global	menu_draw_clock@value_buf
menu_draw_clock@value_buf:	; 15 bytes @ 0x1E
	ds   1
	global	rtc_read_time@i
rtc_read_time@i:	; 1 bytes @ 0x1F
	global	_init_numeric_editor$1307
_init_numeric_editor$1307:	; 2 bytes @ 0x1F
	global	_menu_update_numeric_value$1347
_menu_update_numeric_value$1347:	; 2 bytes @ 0x1F
	ds   1
	global	eeprom_init@calculated_checksum
eeprom_init@calculated_checksum:	; 2 bytes @ 0x20
	ds   1
	global	init_numeric_editor@sensor_type
init_numeric_editor@sensor_type:	; 1 bytes @ 0x21
	global	_menu_update_numeric_value$1348
_menu_update_numeric_value$1348:	; 2 bytes @ 0x21
	ds   1
	global	eeprom_init@i
eeprom_init@i:	; 1 bytes @ 0x22
	global	init_numeric_editor@abs_val
init_numeric_editor@abs_val:	; 2 bytes @ 0x22
	ds   1
	global	_menu_update_numeric_value$1349
_menu_update_numeric_value$1349:	; 2 bytes @ 0x23
	global	_menu_draw_setup$1418
_menu_draw_setup$1418:	; 2 bytes @ 0x23
	ds   2
	global	_menu_update_numeric_value$1350
_menu_update_numeric_value$1350:	; 2 bytes @ 0x25
	global	_menu_draw_setup$1424
_menu_draw_setup$1424:	; 2 bytes @ 0x25
	ds   2
	global	_menu_update_numeric_value$1352
_menu_update_numeric_value$1352:	; 2 bytes @ 0x27
	global	_menu_draw_setup$1432
_menu_draw_setup$1432:	; 2 bytes @ 0x27
	ds   2
	global	menu_draw_setup@label
menu_draw_setup@label:	; 2 bytes @ 0x29
	global	menu_update_numeric_value@value_buf
menu_update_numeric_value@value_buf:	; 6 bytes @ 0x29
	ds   1
??_sprintf:	; 1 bytes @ 0x2A
	ds   1
	global	menu_draw_setup@sensor
menu_draw_setup@sensor:	; 1 bytes @ 0x2B
	ds   1
	global	menu_draw_setup@sensor_name
menu_draw_setup@sensor_name:	; 2 bytes @ 0x2C
	ds   1
	global	menu_draw_clock@actual_len
menu_draw_clock@actual_len:	; 1 bytes @ 0x2D
	global	sprintf@idx
sprintf@idx:	; 1 bytes @ 0x2D
	ds   1
	global	menu_draw_setup@item_idx
menu_draw_setup@item_idx:	; 1 bytes @ 0x2E
	global	menu_draw_clock@start_pos
menu_draw_clock@start_pos:	; 1 bytes @ 0x2E
	global	_sprintf$2281
_sprintf$2281:	; 2 bytes @ 0x2E
	ds   1
	global	menu_update_numeric_value@start_col
menu_update_numeric_value@start_col:	; 1 bytes @ 0x2F
	global	menu_draw_setup@i
menu_draw_setup@i:	; 1 bytes @ 0x2F
	global	_menu_draw_clock$1470
_menu_draw_clock$1470:	; 2 bytes @ 0x2F
	ds   1
	global	menu_update_numeric_value@screen_line
menu_update_numeric_value@screen_line:	; 1 bytes @ 0x30
	global	_sprintf$2282
_sprintf$2282:	; 2 bytes @ 0x30
	ds   1
	global	_menu_draw_clock$1474
_menu_draw_clock$1474:	; 2 bytes @ 0x31
	ds   1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x32
	ds   1
	global	menu_draw_clock@val_len
menu_draw_clock@val_len:	; 1 bytes @ 0x33
	global	sprintf@cp
sprintf@cp:	; 2 bytes @ 0x33
	ds   1
	global	menu_draw_clock@val_len_1464
menu_draw_clock@val_len_1464:	; 1 bytes @ 0x34
	ds   1
	global	menu_draw_clock@j
menu_draw_clock@j:	; 1 bytes @ 0x35
	global	sprintf@len
sprintf@len:	; 2 bytes @ 0x35
	ds   1
	global	menu_draw_clock@show_brackets
menu_draw_clock@show_brackets:	; 1 bytes @ 0x36
	ds   1
	global	menu_draw_clock@i
menu_draw_clock@i:	; 1 bytes @ 0x37
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x37
	ds   1
	global	menu_draw_clock@item_idx
menu_draw_clock@item_idx:	; 1 bytes @ 0x38
	global	sprintf@val
sprintf@val:	; 2 bytes @ 0x38
	ds   2
	global	sprintf@width
sprintf@width:	; 2 bytes @ 0x3A
	ds   2
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x3C
	ds   1
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x3D
	ds   1
??_handle_numeric_rotation:	; 1 bytes @ 0x3E
??_handle_time_rotation:	; 1 bytes @ 0x3E
??_menu_update_time_value:	; 1 bytes @ 0x3E
??_menu_update_edit_value:	; 1 bytes @ 0x3E
??_menu_draw_input:	; 1 bytes @ 0x3E
??_trigger_relay_pulse:	; 1 bytes @ 0x3E
?_init_time_editor:	; 1 bytes @ 0x3E
??_rebuild_input_menu:	; 1 bytes @ 0x3E
??_rebuild_clock_menu:	; 1 bytes @ 0x3E
	global	?_ad7994_read_channel
?_ad7994_read_channel:	; 2 bytes @ 0x3E
	global	init_time_editor@value_seconds
init_time_editor@value_seconds:	; 2 bytes @ 0x3E
	ds   2
??_ad7994_read_channel:	; 1 bytes @ 0x40
	global	init_time_editor@mode
init_time_editor@mode:	; 1 bytes @ 0x40
	ds   1
??_init_time_editor:	; 1 bytes @ 0x41
	ds   2
?_menu_handle_encoder:	; 1 bytes @ 0x43
??_menu_handle_button:	; 1 bytes @ 0x43
	global	menu_handle_encoder@delta
menu_handle_encoder@delta:	; 2 bytes @ 0x43
	ds   2
??_menu_handle_encoder:	; 1 bytes @ 0x45
	ds   6
??_main:	; 1 bytes @ 0x4B
	ds   2
	global	main@adc_ch1
main@adc_ch1:	; 2 bytes @ 0x4D
	ds   2
;!
;!Data Sizes:
;!    Strings     2897
;!    Constant    865
;!    Data        295
;!    BSS         694
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126     79     105
;!    BANK0           128    127     128
;!    BANK1           256    245     256
;!    BANK2           256    240     256
;!    BANK3           256     30     253
;!    BANK4           256      0     200
;!    BANK5           256      0     128
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
;!		 -> STR_100(CODE[11]), STR_101(CODE[10]), STR_102(CODE[9]), STR_103(CODE[9]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[5]), STR_106(CODE[7]), STR_107(CODE[7]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[8]), STR_110(CODE[11]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_114(CODE[7]), STR_115(CODE[7]), 
;!		 -> STR_116(CODE[5]), STR_117(CODE[6]), STR_118(CODE[10]), STR_119(CODE[11]), 
;!		 -> STR_120(CODE[9]), STR_121(CODE[12]), STR_122(CODE[8]), STR_123(CODE[8]), 
;!		 -> STR_124(CODE[5]), STR_125(CODE[7]), STR_126(CODE[8]), STR_127(CODE[10]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[5]), STR_83(CODE[7]), STR_84(CODE[7]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[11]), STR_87(CODE[12]), STR_88(CODE[9]), 
;!		 -> STR_89(CODE[13]), STR_90(CODE[6]), STR_91(CODE[6]), STR_92(CODE[9]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[10]), 
;!
;!    clock_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK3[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    clock_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[11]), STR_101(CODE[10]), STR_102(CODE[9]), STR_103(CODE[9]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[5]), STR_106(CODE[7]), STR_107(CODE[7]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[8]), STR_110(CODE[11]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_114(CODE[7]), STR_115(CODE[7]), 
;!		 -> STR_116(CODE[5]), STR_117(CODE[6]), STR_118(CODE[10]), STR_119(CODE[11]), 
;!		 -> STR_120(CODE[9]), STR_121(CODE[12]), STR_122(CODE[8]), STR_123(CODE[8]), 
;!		 -> STR_124(CODE[5]), STR_125(CODE[7]), STR_126(CODE[8]), STR_127(CODE[10]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[5]), STR_83(CODE[7]), STR_84(CODE[7]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[11]), STR_87(CODE[12]), STR_88(CODE[9]), 
;!		 -> STR_89(CODE[13]), STR_90(CODE[6]), STR_91(CODE[6]), STR_92(CODE[9]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[10]), 
;!
;!    clock_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK3[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
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
;!		 -> STR_100(CODE[11]), STR_101(CODE[10]), STR_102(CODE[9]), STR_103(CODE[9]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[5]), STR_106(CODE[7]), STR_107(CODE[7]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[8]), STR_110(CODE[11]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_114(CODE[7]), STR_115(CODE[7]), 
;!		 -> STR_116(CODE[5]), STR_117(CODE[6]), STR_118(CODE[10]), STR_119(CODE[11]), 
;!		 -> STR_120(CODE[9]), STR_121(CODE[12]), STR_122(CODE[8]), STR_123(CODE[8]), 
;!		 -> STR_124(CODE[5]), STR_125(CODE[7]), STR_126(CODE[8]), STR_127(CODE[10]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[5]), STR_83(CODE[7]), STR_84(CODE[7]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[11]), STR_87(CODE[12]), STR_88(CODE[9]), 
;!		 -> STR_89(CODE[13]), STR_90(CODE[6]), STR_91(CODE[6]), STR_92(CODE[9]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[10]), 
;!
;!    flow_analog_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK3[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    flow_digital_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[11]), STR_101(CODE[10]), STR_102(CODE[9]), STR_103(CODE[9]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[5]), STR_106(CODE[7]), STR_107(CODE[7]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[8]), STR_110(CODE[11]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_114(CODE[7]), STR_115(CODE[7]), 
;!		 -> STR_116(CODE[5]), STR_117(CODE[6]), STR_118(CODE[10]), STR_119(CODE[11]), 
;!		 -> STR_120(CODE[9]), STR_121(CODE[12]), STR_122(CODE[8]), STR_123(CODE[8]), 
;!		 -> STR_124(CODE[5]), STR_125(CODE[7]), STR_126(CODE[8]), STR_127(CODE[10]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[5]), STR_83(CODE[7]), STR_84(CODE[7]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[11]), STR_87(CODE[12]), STR_88(CODE[9]), 
;!		 -> STR_89(CODE[13]), STR_90(CODE[6]), STR_91(CODE[6]), STR_92(CODE[9]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[10]), 
;!
;!    flow_digital_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK3[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    input_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[11]), STR_101(CODE[10]), STR_102(CODE[9]), STR_103(CODE[9]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[5]), STR_106(CODE[7]), STR_107(CODE[7]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[8]), STR_110(CODE[11]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_114(CODE[7]), STR_115(CODE[7]), 
;!		 -> STR_116(CODE[5]), STR_117(CODE[6]), STR_118(CODE[10]), STR_119(CODE[11]), 
;!		 -> STR_120(CODE[9]), STR_121(CODE[12]), STR_122(CODE[8]), STR_123(CODE[8]), 
;!		 -> STR_124(CODE[5]), STR_125(CODE[7]), STR_126(CODE[8]), STR_127(CODE[10]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[5]), STR_83(CODE[7]), STR_84(CODE[7]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[11]), STR_87(CODE[12]), STR_88(CODE[9]), 
;!		 -> STR_89(CODE[13]), STR_90(CODE[6]), STR_91(CODE[6]), STR_92(CODE[9]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[10]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK3[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    lcd_print@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> Fake(UNKNOWN), main@lcd_buf(BANK0[17]), menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@title(BANK0[10]), 
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), menu_update_numeric_value@value_buf(COMRAM[6]), menu_update_time_value@value_buf(BANK0[6]), 
;!		 -> STR_100(CODE[11]), STR_101(CODE[10]), STR_102(CODE[9]), STR_103(CODE[9]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[5]), STR_106(CODE[7]), STR_107(CODE[7]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[8]), STR_110(CODE[11]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_114(CODE[7]), STR_115(CODE[7]), 
;!		 -> STR_116(CODE[5]), STR_117(CODE[6]), STR_118(CODE[10]), STR_119(CODE[11]), 
;!		 -> STR_120(CODE[9]), STR_121(CODE[12]), STR_122(CODE[8]), STR_123(CODE[8]), 
;!		 -> STR_124(CODE[5]), STR_125(CODE[7]), STR_126(CODE[8]), STR_127(CODE[10]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[5]), STR_137(CODE[8]), STR_138(CODE[2]), 
;!		 -> STR_139(CODE[2]), STR_140(CODE[21]), STR_15(CODE[13]), STR_16(CODE[16]), 
;!		 -> STR_194(CODE[7]), STR_195(CODE[2]), STR_196(CODE[2]), STR_197(CODE[6]), 
;!		 -> STR_198(CODE[2]), STR_199(CODE[2]), STR_200(CODE[21]), STR_201(CODE[2]), 
;!		 -> STR_202(CODE[2]), STR_206(CODE[2]), STR_207(CODE[2]), STR_208(CODE[2]), 
;!		 -> STR_209(CODE[2]), STR_210(CODE[21]), STR_211(CODE[1]), STR_212(CODE[1]), 
;!		 -> STR_213(CODE[1]), STR_214(CODE[6]), STR_215(CODE[5]), STR_216(CODE[9]), 
;!		 -> STR_217(CODE[5]), STR_218(CODE[5]), STR_219(CODE[2]), STR_220(CODE[2]), 
;!		 -> STR_221(CODE[2]), STR_222(CODE[2]), STR_223(CODE[2]), STR_224(CODE[2]), 
;!		 -> STR_225(CODE[2]), STR_226(CODE[2]), STR_238(CODE[6]), STR_239(CODE[2]), 
;!		 -> STR_240(CODE[2]), STR_241(CODE[2]), STR_242(CODE[2]), STR_32(CODE[12]), 
;!		 -> STR_33(CODE[6]), STR_38(CODE[12]), STR_39(CODE[8]), STR_78(CODE[10]), 
;!		 -> STR_79(CODE[11]), STR_80(CODE[13]), STR_81(CODE[6]), STR_82(CODE[5]), 
;!		 -> STR_83(CODE[7]), STR_84(CODE[7]), STR_85(CODE[10]), STR_86(CODE[11]), 
;!		 -> STR_87(CODE[12]), STR_88(CODE[9]), STR_89(CODE[13]), STR_90(CODE[6]), 
;!		 -> STR_91(CODE[6]), STR_92(CODE[9]), STR_93(CODE[8]), STR_94(CODE[8]), 
;!		 -> STR_95(CODE[8]), STR_96(CODE[5]), STR_97(CODE[7]), STR_98(CODE[7]), 
;!		 -> STR_99(CODE[10]), 
;!
;!    lcd_print_at@str	PTR const unsigned char  size(2) Largest target is 15
;!		 -> Fake(UNKNOWN), menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), 
;!		 -> STR_100(CODE[11]), STR_101(CODE[10]), STR_102(CODE[9]), STR_103(CODE[9]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[5]), STR_106(CODE[7]), STR_107(CODE[7]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[8]), STR_110(CODE[11]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_114(CODE[7]), STR_115(CODE[7]), 
;!		 -> STR_116(CODE[5]), STR_117(CODE[6]), STR_118(CODE[10]), STR_119(CODE[11]), 
;!		 -> STR_120(CODE[9]), STR_121(CODE[12]), STR_122(CODE[8]), STR_123(CODE[8]), 
;!		 -> STR_124(CODE[5]), STR_125(CODE[7]), STR_126(CODE[8]), STR_127(CODE[10]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[5]), STR_211(CODE[1]), STR_212(CODE[1]), 
;!		 -> STR_213(CODE[1]), STR_214(CODE[6]), STR_215(CODE[5]), STR_216(CODE[9]), 
;!		 -> STR_217(CODE[5]), STR_218(CODE[5]), STR_238(CODE[6]), STR_78(CODE[10]), 
;!		 -> STR_79(CODE[11]), STR_80(CODE[13]), STR_81(CODE[6]), STR_82(CODE[5]), 
;!		 -> STR_83(CODE[7]), STR_84(CODE[7]), STR_85(CODE[10]), STR_86(CODE[11]), 
;!		 -> STR_87(CODE[12]), STR_88(CODE[9]), STR_89(CODE[13]), STR_90(CODE[6]), 
;!		 -> STR_91(CODE[6]), STR_92(CODE[9]), STR_93(CODE[8]), STR_94(CODE[8]), 
;!		 -> STR_95(CODE[8]), STR_96(CODE[5]), STR_97(CODE[7]), STR_98(CODE[7]), 
;!		 -> STR_99(CODE[10]), 
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
;!    menu_draw_clock$1470	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_239(CODE[2]), STR_240(CODE[2]), 
;!
;!    menu_draw_clock$1474	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_241(CODE[2]), STR_242(CODE[2]), 
;!
;!    menu_draw_input$1394	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_206(CODE[2]), STR_207(CODE[2]), 
;!
;!    menu_draw_input$1398	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_208(CODE[2]), STR_209(CODE[2]), 
;!
;!    menu_draw_input@flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(BANK1[1]), flow_type_edit_flag(BANK1[1]), flow_units_edit_flag(BANK1[1]), 
;!		 -> no_flow_edit_flag(BANK3[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(BANK1[1]), relay_plp_edit_flag(BANK1[1]), 
;!		 -> relay_slp_edit_flag(BANK2[1]), sensor_edit_flag(BANK1[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@flag_1384	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(BANK1[1]), flow_type_edit_flag(BANK1[1]), flow_units_edit_flag(BANK1[1]), 
;!		 -> no_flow_edit_flag(BANK3[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(BANK1[1]), relay_plp_edit_flag(BANK1[1]), 
;!		 -> relay_slp_edit_flag(BANK2[1]), sensor_edit_flag(BANK1[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_43(CODE[9]), STR_44(CODE[8]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[9]), STR_49(CODE[5]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[7]), STR_54(CODE[8]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[4]), 
;!		 -> STR_59(CODE[5]), STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[1]), 
;!		 -> STR_63(CODE[2]), STR_64(CODE[4]), STR_65(CODE[1]), STR_66(CODE[1]), 
;!		 -> STR_67(CODE[1]), STR_68(CODE[5]), STR_69(CODE[5]), STR_70(CODE[1]), 
;!		 -> STR_71(CODE[1]), STR_72(CODE[1]), STR_73(CODE[6]), STR_74(CODE[6]), 
;!		 -> STR_75(CODE[9]), STR_76(CODE[1]), STR_77(CODE[1]), 
;!
;!    menu_draw_input@opts_1380	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts_1380$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_43(CODE[9]), STR_44(CODE[8]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[9]), STR_49(CODE[5]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[7]), STR_54(CODE[8]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[4]), 
;!		 -> STR_59(CODE[5]), STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[1]), 
;!		 -> STR_63(CODE[2]), STR_64(CODE[4]), STR_65(CODE[1]), STR_66(CODE[1]), 
;!		 -> STR_67(CODE[1]), STR_68(CODE[5]), STR_69(CODE[5]), STR_70(CODE[1]), 
;!		 -> STR_71(CODE[1]), STR_72(CODE[1]), STR_73(CODE[6]), STR_74(CODE[6]), 
;!		 -> STR_75(CODE[9]), STR_76(CODE[1]), STR_77(CODE[1]), 
;!
;!    menu_draw_setup$1418	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_217(CODE[5]), STR_218(CODE[5]), 
;!
;!    menu_draw_setup$1424	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_221(CODE[2]), STR_222(CODE[2]), 
;!
;!    menu_draw_setup$1432	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_225(CODE[2]), STR_226(CODE[2]), 
;!
;!    menu_draw_setup@F2659	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_211(CODE[1]), STR_212(CODE[1]), STR_213(CODE[1]), STR_214(CODE[6]), 
;!		 -> STR_215(CODE[5]), 
;!
;!    menu_draw_setup@label	PTR const unsigned char  size(2) Largest target is 6
;!		 -> STR_211(CODE[1]), STR_212(CODE[1]), STR_213(CODE[1]), STR_214(CODE[6]), 
;!		 -> STR_215(CODE[5]), 
;!
;!    menu_draw_setup@sensor_name	PTR const unsigned char  size(2) Largest target is 9
;!		 -> Fake(UNKNOWN), STR_216(CODE[9]), STR_217(CODE[5]), STR_218(CODE[5]), 
;!
;!    menu_draw_setup@setup_labels	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_211(CODE[1]), STR_212(CODE[1]), STR_213(CODE[1]), STR_214(CODE[6]), 
;!		 -> STR_215(CODE[5]), 
;!
;!    menu_handle_button@edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(BANK1[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1526	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(BANK1[1]), flow_type_edit_flag(BANK1[1]), flow_units_edit_flag(BANK1[1]), 
;!		 -> no_flow_edit_flag(BANK3[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(BANK1[1]), relay_plp_edit_flag(BANK1[1]), 
;!		 -> relay_slp_edit_flag(BANK2[1]), sensor_edit_flag(BANK1[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1557	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(BANK1[1]), flow_type_edit_flag(BANK1[1]), flow_units_edit_flag(BANK1[1]), 
;!		 -> no_flow_edit_flag(BANK3[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(BANK1[1]), relay_plp_edit_flag(BANK1[1]), 
;!		 -> relay_slp_edit_flag(BANK2[1]), sensor_edit_flag(BANK1[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_43(CODE[9]), STR_44(CODE[8]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[9]), STR_49(CODE[5]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[7]), STR_54(CODE[8]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[4]), 
;!		 -> STR_59(CODE[5]), STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[1]), 
;!		 -> STR_63(CODE[2]), STR_64(CODE[4]), STR_65(CODE[1]), STR_66(CODE[1]), 
;!		 -> STR_67(CODE[1]), STR_68(CODE[5]), STR_69(CODE[5]), STR_70(CODE[1]), 
;!		 -> STR_71(CODE[1]), STR_72(CODE[1]), STR_73(CODE[6]), STR_74(CODE[6]), 
;!		 -> STR_75(CODE[9]), STR_76(CODE[1]), STR_77(CODE[1]), 
;!
;!    menu_handle_button@opts_1527	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1527$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_43(CODE[9]), STR_44(CODE[8]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[9]), STR_49(CODE[5]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[7]), STR_54(CODE[8]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[4]), 
;!		 -> STR_59(CODE[5]), STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[1]), 
;!		 -> STR_63(CODE[2]), STR_64(CODE[4]), STR_65(CODE[1]), STR_66(CODE[1]), 
;!		 -> STR_67(CODE[1]), STR_68(CODE[5]), STR_69(CODE[5]), STR_70(CODE[1]), 
;!		 -> STR_71(CODE[1]), STR_72(CODE[1]), STR_73(CODE[6]), STR_74(CODE[6]), 
;!		 -> STR_75(CODE[9]), STR_76(CODE[1]), STR_77(CODE[1]), 
;!
;!    menu_handle_button@opts_1558	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1558$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_43(CODE[9]), STR_44(CODE[8]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[9]), STR_49(CODE[5]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[7]), STR_54(CODE[8]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[4]), 
;!		 -> STR_59(CODE[5]), STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[1]), 
;!		 -> STR_63(CODE[2]), STR_64(CODE[4]), STR_65(CODE[1]), STR_66(CODE[1]), 
;!		 -> STR_67(CODE[1]), STR_68(CODE[5]), STR_69(CODE[5]), STR_70(CODE[1]), 
;!		 -> STR_71(CODE[1]), STR_72(CODE[1]), STR_73(CODE[6]), STR_74(CODE[6]), 
;!		 -> STR_75(CODE[9]), STR_76(CODE[1]), STR_77(CODE[1]), 
;!
;!    menu_handle_encoder$2998	const PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_43(CODE[9]), STR_44(CODE[8]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[9]), STR_49(CODE[5]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[7]), STR_54(CODE[8]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[4]), 
;!		 -> STR_59(CODE[5]), STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[1]), 
;!		 -> STR_63(CODE[2]), STR_64(CODE[4]), STR_65(CODE[1]), STR_66(CODE[1]), 
;!		 -> STR_67(CODE[1]), STR_68(CODE[5]), STR_69(CODE[5]), STR_70(CODE[1]), 
;!		 -> STR_71(CODE[1]), STR_72(CODE[1]), STR_73(CODE[6]), STR_74(CODE[6]), 
;!		 -> STR_75(CODE[9]), STR_76(CODE[1]), STR_77(CODE[1]), 
;!
;!    menu_handle_encoder@clock_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(BANK1[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@clock_opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@clock_opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_43(CODE[9]), STR_44(CODE[8]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[9]), STR_49(CODE[5]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[7]), STR_54(CODE[8]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[4]), 
;!		 -> STR_59(CODE[5]), STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[1]), 
;!		 -> STR_63(CODE[2]), STR_64(CODE[4]), STR_65(CODE[1]), STR_66(CODE[1]), 
;!		 -> STR_67(CODE[1]), STR_68(CODE[5]), STR_69(CODE[5]), STR_70(CODE[1]), 
;!		 -> STR_71(CODE[1]), STR_72(CODE[1]), STR_73(CODE[6]), STR_74(CODE[6]), 
;!		 -> STR_75(CODE[9]), STR_76(CODE[1]), STR_77(CODE[1]), 
;!
;!    menu_handle_encoder@edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(BANK1[1]), flow_type_edit_flag(BANK1[1]), flow_units_edit_flag(BANK1[1]), 
;!		 -> no_flow_edit_flag(BANK3[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(BANK1[1]), relay_plp_edit_flag(BANK1[1]), 
;!		 -> relay_slp_edit_flag(BANK2[1]), sensor_edit_flag(BANK1[1]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@opts	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_43(CODE[9]), STR_44(CODE[8]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[9]), STR_49(CODE[5]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[7]), STR_54(CODE[8]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[4]), 
;!		 -> STR_59(CODE[5]), STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[1]), 
;!		 -> STR_63(CODE[2]), STR_64(CODE[4]), STR_65(CODE[1]), STR_66(CODE[1]), 
;!		 -> STR_67(CODE[1]), STR_68(CODE[5]), STR_69(CODE[5]), STR_70(CODE[1]), 
;!		 -> STR_71(CODE[1]), STR_72(CODE[1]), STR_73(CODE[6]), STR_74(CODE[6]), 
;!		 -> STR_75(CODE[9]), STR_76(CODE[1]), STR_77(CODE[1]), 
;!
;!    menu_item_options$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_43(CODE[9]), STR_44(CODE[8]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[9]), STR_49(CODE[5]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[7]), STR_54(CODE[8]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[4]), 
;!		 -> STR_59(CODE[5]), STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[1]), 
;!		 -> STR_63(CODE[2]), STR_64(CODE[4]), STR_65(CODE[1]), STR_66(CODE[1]), 
;!		 -> STR_67(CODE[1]), STR_68(CODE[5]), STR_69(CODE[5]), STR_70(CODE[1]), 
;!		 -> STR_71(CODE[1]), STR_72(CODE[1]), STR_73(CODE[6]), STR_74(CODE[6]), 
;!		 -> STR_75(CODE[9]), STR_76(CODE[1]), STR_77(CODE[1]), 
;!
;!    options_menu	PTR const unsigned char [5] size(2) Largest target is 13
;!		 -> STR_78(CODE[10]), STR_79(CODE[11]), STR_80(CODE[13]), STR_81(CODE[6]), 
;!		 -> STR_82(CODE[5]), 
;!
;!    pressure_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[11]), STR_101(CODE[10]), STR_102(CODE[9]), STR_103(CODE[9]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[5]), STR_106(CODE[7]), STR_107(CODE[7]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[8]), STR_110(CODE[11]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_114(CODE[7]), STR_115(CODE[7]), 
;!		 -> STR_116(CODE[5]), STR_117(CODE[6]), STR_118(CODE[10]), STR_119(CODE[11]), 
;!		 -> STR_120(CODE[9]), STR_121(CODE[12]), STR_122(CODE[8]), STR_123(CODE[8]), 
;!		 -> STR_124(CODE[5]), STR_125(CODE[7]), STR_126(CODE[8]), STR_127(CODE[10]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[5]), STR_83(CODE[7]), STR_84(CODE[7]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[11]), STR_87(CODE[12]), STR_88(CODE[9]), 
;!		 -> STR_89(CODE[13]), STR_90(CODE[6]), STR_91(CODE[6]), STR_92(CODE[9]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[10]), 
;!
;!    pressure_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK3[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    rebuild_clock_menu$1441	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_229(CODE[8]), STR_230(CODE[9]), 
;!
;!    rebuild_clock_menu$1447	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_231(CODE[6]), STR_232(CODE[6]), STR_233(CODE[9]), 
;!
;!    rebuild_clock_menu$1448	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_232(CODE[6]), STR_233(CODE[9]), 
;!
;!    rebuild_input_menu$1221	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_142(CODE[8]), STR_143(CODE[9]), 
;!
;!    rebuild_input_menu$1235	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_152(CODE[6]), STR_153(CODE[6]), STR_154(CODE[9]), 
;!
;!    rebuild_input_menu$1236	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_153(CODE[6]), STR_154(CODE[9]), 
;!
;!    rebuild_input_menu$1242	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_155(CODE[6]), STR_156(CODE[6]), STR_157(CODE[9]), 
;!
;!    rebuild_input_menu$1243	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_156(CODE[6]), STR_157(CODE[9]), 
;!
;!    rebuild_input_menu$1249	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_158(CODE[6]), STR_159(CODE[6]), STR_160(CODE[9]), 
;!
;!    rebuild_input_menu$1250	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_159(CODE[6]), STR_160(CODE[9]), 
;!
;!    rebuild_input_menu$1254	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_161(CODE[5]), STR_162(CODE[5]), 
;!
;!    rebuild_input_menu$1268	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_168(CODE[6]), STR_169(CODE[6]), STR_170(CODE[9]), 
;!
;!    rebuild_input_menu$1269	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_169(CODE[6]), STR_170(CODE[9]), 
;!
;!    rebuild_input_menu$1273	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_171(CODE[5]), STR_172(CODE[5]), 
;!
;!    rebuild_input_menu$1278	PTR const unsigned char  size(2) Largest target is 8
;!		 -> STR_174(CODE[7]), STR_175(CODE[8]), 
;!
;!    rebuild_input_menu$1282	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_176(CODE[5]), STR_177(CODE[5]), 
;!
;!    rebuild_input_menu$1288	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_178(CODE[6]), STR_179(CODE[6]), STR_180(CODE[9]), 
;!
;!    rebuild_input_menu$1289	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_179(CODE[6]), STR_180(CODE[9]), 
;!
;!    rebuild_input_menu$1293	PTR const unsigned char  size(2) Largest target is 4
;!		 -> STR_181(CODE[2]), STR_182(CODE[4]), 
;!
;!    rtc_read_time@time	PTR struct . size(2) Largest target is 7
;!		 -> main@current_time(BANK1[7]), 
;!
;!    S903$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_43(CODE[9]), STR_44(CODE[8]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[9]), STR_49(CODE[5]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[7]), STR_54(CODE[8]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[4]), 
;!		 -> STR_59(CODE[5]), STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[1]), 
;!		 -> STR_63(CODE[2]), STR_64(CODE[4]), STR_65(CODE[1]), STR_66(CODE[1]), 
;!		 -> STR_67(CODE[1]), STR_68(CODE[5]), STR_69(CODE[5]), STR_70(CODE[1]), 
;!		 -> STR_71(CODE[1]), STR_72(CODE[1]), STR_73(CODE[6]), STR_74(CODE[6]), 
;!		 -> STR_75(CODE[9]), STR_76(CODE[1]), STR_77(CODE[1]), 
;!
;!    S907$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[11]), STR_101(CODE[10]), STR_102(CODE[9]), STR_103(CODE[9]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[5]), STR_106(CODE[7]), STR_107(CODE[7]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[8]), STR_110(CODE[11]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_114(CODE[7]), STR_115(CODE[7]), 
;!		 -> STR_116(CODE[5]), STR_117(CODE[6]), STR_118(CODE[10]), STR_119(CODE[11]), 
;!		 -> STR_120(CODE[9]), STR_121(CODE[12]), STR_122(CODE[8]), STR_123(CODE[8]), 
;!		 -> STR_124(CODE[5]), STR_125(CODE[7]), STR_126(CODE[8]), STR_127(CODE[10]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[5]), STR_83(CODE[7]), STR_84(CODE[7]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[11]), STR_87(CODE[12]), STR_88(CODE[9]), 
;!		 -> STR_89(CODE[13]), STR_90(CODE[6]), STR_91(CODE[6]), STR_92(CODE[9]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[10]), 
;!
;!    S907$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK3[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    sp__get_item_options_for_field	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    sp__get_option_edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(BANK1[1]), flow_type_edit_flag(BANK1[1]), flow_units_edit_flag(BANK1[1]), 
;!		 -> no_flow_edit_flag(BANK3[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(BANK1[1]), relay_plp_edit_flag(BANK1[1]), 
;!		 -> relay_slp_edit_flag(BANK2[1]), sensor_edit_flag(BANK1[1]), NULL(NULL[0]), 
;!
;!    sp__memcpy	PTR void  size(2) Largest target is 384
;!		 -> clock_menu(BANK3[25]), input_config(BIGRAM[384]), input_menu(BANK3[75]), system_config(BANK5[128]), 
;!
;!    sp__strcpy	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK4[10]), 
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK3[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 12
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(BANK1[1]), menu_item_options$option_count(CODE[1]), menu_update_time_value@value_buf(BANK0[6]), 
;!		 -> relay_high_edit_flag(COMRAM[1]), ?_sprintf(COMRAM[2]), sprintf@c(COMRAM[1]), STR_142(CODE[8]), 
;!		 -> STR_143(CODE[9]), STR_229(CODE[8]), STR_230(CODE[9]), STR_294(CODE[7]), 
;!		 -> STR_43(CODE[9]), STR_44(CODE[8]), STR_45(CODE[1]), STR_46(CODE[1]), 
;!		 -> STR_47(CODE[1]), STR_48(CODE[9]), STR_49(CODE[5]), STR_50(CODE[5]), 
;!		 -> STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[7]), STR_54(CODE[8]), 
;!		 -> STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[4]), 
;!		 -> STR_59(CODE[5]), STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[1]), 
;!		 -> STR_63(CODE[2]), STR_64(CODE[4]), STR_65(CODE[1]), STR_66(CODE[1]), 
;!		 -> STR_67(CODE[1]), STR_68(CODE[5]), STR_69(CODE[5]), STR_70(CODE[1]), 
;!		 -> STR_71(CODE[1]), STR_72(CODE[1]), STR_73(CODE[6]), STR_74(CODE[6]), 
;!		 -> STR_75(CODE[9]), STR_76(CODE[1]), STR_77(CODE[1]), value_back(BANK3[5]), 
;!		 -> value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), value_enable(BANK3[10]), 
;!		 -> value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), 
;!		 -> value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_low_flow(BANK4[10]), 
;!		 -> value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), 
;!		 -> value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), 
;!		 -> value_sensor(BANK3[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 51
;!		 -> STR_1(CODE[48]), STR_12(CODE[28]), STR_130(CODE[35]), STR_132(CODE[45]), 
;!		 -> STR_133(CODE[25]), STR_134(CODE[3]), STR_135(CODE[51]), STR_136(CODE[27]), 
;!		 -> STR_141(CODE[3]), STR_145(CODE[6]), STR_146(CODE[6]), STR_147(CODE[5]), 
;!		 -> STR_148(CODE[10]), STR_149(CODE[5]), STR_150(CODE[10]), STR_151(CODE[10]), 
;!		 -> STR_164(CODE[6]), STR_165(CODE[6]), STR_166(CODE[3]), STR_167(CODE[10]), 
;!		 -> STR_183(CODE[6]), STR_184(CODE[6]), STR_185(CODE[5]), STR_186(CODE[10]), 
;!		 -> STR_188(CODE[10]), STR_189(CODE[48]), STR_191(CODE[29]), STR_192(CODE[7]), 
;!		 -> STR_193(CODE[9]), STR_203(CODE[9]), STR_227(CODE[35]), STR_228(CODE[3]), 
;!		 -> STR_23(CODE[37]), STR_234(CODE[10]), STR_236(CODE[46]), STR_237(CODE[29]), 
;!		 -> STR_24(CODE[16]), STR_243(CODE[37]), STR_244(CODE[23]), STR_245(CODE[32]), 
;!		 -> STR_246(CODE[37]), STR_247(CODE[28]), STR_248(CODE[35]), STR_249(CODE[26]), 
;!		 -> STR_25(CODE[23]), STR_250(CODE[20]), STR_251(CODE[25]), STR_252(CODE[28]), 
;!		 -> STR_253(CODE[26]), STR_254(CODE[10]), STR_255(CODE[10]), STR_256(CODE[32]), 
;!		 -> STR_257(CODE[42]), STR_258(CODE[26]), STR_259(CODE[10]), STR_26(CODE[35]), 
;!		 -> STR_261(CODE[6]), STR_262(CODE[6]), STR_263(CODE[5]), STR_264(CODE[5]), 
;!		 -> STR_265(CODE[6]), STR_266(CODE[6]), STR_267(CODE[5]), STR_268(CODE[6]), 
;!		 -> STR_269(CODE[6]), STR_27(CODE[23]), STR_270(CODE[5]), STR_271(CODE[38]), 
;!		 -> STR_272(CODE[32]), STR_28(CODE[17]), STR_290(CODE[21]), STR_292(CODE[43]), 
;!		 -> STR_293(CODE[19]), STR_3(CODE[27]), STR_6(CODE[39]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 60
;!		 -> ad7994_read_channel@buf(BANK0[40]), handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK2[50]), main@buf_603(BANK2[30]), main@buf_640(BANK2[60]), main@buf_643(BANK2[40]), 
;!		 -> main@buf_670(BANK3[30]), main@lcd_buf(BANK0[17]), main@time_buf(BANK2[60]), menu_draw_input@title(BANK0[10]), 
;!		 -> menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1532(BANK1[50]), menu_handle_button@buf_1554(BANK1[50]), menu_handle_button@buf_1564(BANK1[50]), 
;!		 -> menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1496(BANK1[50]), menu_handle_encoder@buf_1499(BANK1[50]), menu_update_edit_value@value_buf(BANK0[10]), 
;!		 -> menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), 
;!		 -> trigger_relay_pulse@buf(BANK0[60]), value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), 
;!		 -> value_display(BANK3[10]), value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), 
;!		 -> value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), 
;!		 -> value_highbp(BANK4[10]), value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), 
;!		 -> value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), 
;!		 -> value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), 
;!		 -> value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK3[12]), value_slpbp(BANK4[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK3[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_205(CODE[1]), STR_274(CODE[8]), STR_275(CODE[6]), STR_276(CODE[6]), 
;!		 -> STR_277(CODE[5]), STR_43(CODE[9]), STR_44(CODE[8]), STR_45(CODE[1]), 
;!		 -> STR_46(CODE[1]), STR_47(CODE[1]), STR_48(CODE[9]), STR_49(CODE[5]), 
;!		 -> STR_50(CODE[5]), STR_51(CODE[1]), STR_52(CODE[1]), STR_53(CODE[7]), 
;!		 -> STR_54(CODE[8]), STR_55(CODE[1]), STR_56(CODE[1]), STR_57(CODE[1]), 
;!		 -> STR_58(CODE[4]), STR_59(CODE[5]), STR_60(CODE[1]), STR_61(CODE[1]), 
;!		 -> STR_62(CODE[1]), STR_63(CODE[2]), STR_64(CODE[4]), STR_65(CODE[1]), 
;!		 -> STR_66(CODE[1]), STR_67(CODE[1]), STR_68(CODE[5]), STR_69(CODE[5]), 
;!		 -> STR_70(CODE[1]), STR_71(CODE[1]), STR_72(CODE[1]), STR_73(CODE[6]), 
;!		 -> STR_74(CODE[6]), STR_75(CODE[9]), STR_76(CODE[1]), STR_77(CODE[1]), 
;!
;!    strcpy@cp	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK4[10]), 
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK3[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 12
;!		 -> menu_update_edit_value@value_buf(BANK0[10]), STR_144(CODE[9]), STR_152(CODE[6]), STR_153(CODE[6]), 
;!		 -> STR_154(CODE[9]), STR_155(CODE[6]), STR_156(CODE[6]), STR_157(CODE[9]), 
;!		 -> STR_158(CODE[6]), STR_159(CODE[6]), STR_160(CODE[9]), STR_161(CODE[5]), 
;!		 -> STR_162(CODE[5]), STR_163(CODE[5]), STR_168(CODE[6]), STR_169(CODE[6]), 
;!		 -> STR_170(CODE[9]), STR_171(CODE[5]), STR_172(CODE[5]), STR_173(CODE[5]), 
;!		 -> STR_174(CODE[7]), STR_175(CODE[8]), STR_176(CODE[5]), STR_177(CODE[5]), 
;!		 -> STR_178(CODE[6]), STR_179(CODE[6]), STR_180(CODE[9]), STR_181(CODE[2]), 
;!		 -> STR_182(CODE[4]), STR_187(CODE[4]), STR_204(CODE[6]), STR_231(CODE[6]), 
;!		 -> STR_232(CODE[6]), STR_233(CODE[9]), STR_235(CODE[5]), STR_43(CODE[9]), 
;!		 -> STR_44(CODE[8]), STR_45(CODE[1]), STR_46(CODE[1]), STR_47(CODE[1]), 
;!		 -> STR_48(CODE[9]), STR_49(CODE[5]), STR_50(CODE[5]), STR_51(CODE[1]), 
;!		 -> STR_52(CODE[1]), STR_53(CODE[7]), STR_54(CODE[8]), STR_55(CODE[1]), 
;!		 -> STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[4]), STR_59(CODE[5]), 
;!		 -> STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[1]), STR_63(CODE[2]), 
;!		 -> STR_64(CODE[4]), STR_65(CODE[1]), STR_66(CODE[1]), STR_67(CODE[1]), 
;!		 -> STR_68(CODE[5]), STR_69(CODE[5]), STR_70(CODE[1]), STR_71(CODE[1]), 
;!		 -> STR_72(CODE[1]), STR_73(CODE[6]), STR_74(CODE[6]), STR_75(CODE[9]), 
;!		 -> STR_76(CODE[1]), STR_77(CODE[1]), value_back(BANK3[5]), value_clock_display(BANK4[10]), 
;!		 -> value_clock_enable(BANK4[10]), value_display(BANK3[10]), value_enable(BANK3[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), 
;!		 -> value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), 
;!		 -> value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), 
;!		 -> value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK3[12]), 
;!		 -> value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strcpy@to	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK4[10]), 
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK3[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strlen@cp	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_43(CODE[9]), 
;!		 -> STR_44(CODE[8]), STR_45(CODE[1]), STR_46(CODE[1]), STR_47(CODE[1]), 
;!		 -> STR_48(CODE[9]), STR_49(CODE[5]), STR_50(CODE[5]), STR_51(CODE[1]), 
;!		 -> STR_52(CODE[1]), STR_53(CODE[7]), STR_54(CODE[8]), STR_55(CODE[1]), 
;!		 -> STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[4]), STR_59(CODE[5]), 
;!		 -> STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[1]), STR_63(CODE[2]), 
;!		 -> STR_64(CODE[4]), STR_65(CODE[1]), STR_66(CODE[1]), STR_67(CODE[1]), 
;!		 -> STR_68(CODE[5]), STR_69(CODE[5]), STR_70(CODE[1]), STR_71(CODE[1]), 
;!		 -> STR_72(CODE[1]), STR_73(CODE[6]), STR_74(CODE[6]), STR_75(CODE[9]), 
;!		 -> STR_76(CODE[1]), STR_77(CODE[1]), value_back(BANK3[5]), value_clock_display(BANK4[10]), 
;!		 -> value_clock_enable(BANK4[10]), value_display(BANK3[10]), value_enable(BANK3[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), 
;!		 -> value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), 
;!		 -> value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), 
;!		 -> value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK3[12]), 
;!		 -> value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    strlen@s	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), STR_43(CODE[9]), 
;!		 -> STR_44(CODE[8]), STR_45(CODE[1]), STR_46(CODE[1]), STR_47(CODE[1]), 
;!		 -> STR_48(CODE[9]), STR_49(CODE[5]), STR_50(CODE[5]), STR_51(CODE[1]), 
;!		 -> STR_52(CODE[1]), STR_53(CODE[7]), STR_54(CODE[8]), STR_55(CODE[1]), 
;!		 -> STR_56(CODE[1]), STR_57(CODE[1]), STR_58(CODE[4]), STR_59(CODE[5]), 
;!		 -> STR_60(CODE[1]), STR_61(CODE[1]), STR_62(CODE[1]), STR_63(CODE[2]), 
;!		 -> STR_64(CODE[4]), STR_65(CODE[1]), STR_66(CODE[1]), STR_67(CODE[1]), 
;!		 -> STR_68(CODE[5]), STR_69(CODE[5]), STR_70(CODE[1]), STR_71(CODE[1]), 
;!		 -> STR_72(CODE[1]), STR_73(CODE[6]), STR_74(CODE[6]), STR_75(CODE[9]), 
;!		 -> STR_76(CODE[1]), STR_77(CODE[1]), value_back(BANK3[5]), value_clock_display(BANK4[10]), 
;!		 -> value_clock_enable(BANK4[10]), value_display(BANK3[10]), value_enable(BANK3[10]), value_end_runtime(BANK4[10]), 
;!		 -> value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), 
;!		 -> value_high_temp(BANK4[10]), value_highbp(BANK4[10]), value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), 
;!		 -> value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), 
;!		 -> value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), 
;!		 -> value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), value_scale4(BANK3[10]), value_sensor(BANK3[12]), 
;!		 -> value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    temp_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[11]), STR_101(CODE[10]), STR_102(CODE[9]), STR_103(CODE[9]), 
;!		 -> STR_104(CODE[8]), STR_105(CODE[5]), STR_106(CODE[7]), STR_107(CODE[7]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[8]), STR_110(CODE[11]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[8]), STR_113(CODE[5]), STR_114(CODE[7]), STR_115(CODE[7]), 
;!		 -> STR_116(CODE[5]), STR_117(CODE[6]), STR_118(CODE[10]), STR_119(CODE[11]), 
;!		 -> STR_120(CODE[9]), STR_121(CODE[12]), STR_122(CODE[8]), STR_123(CODE[8]), 
;!		 -> STR_124(CODE[5]), STR_125(CODE[7]), STR_126(CODE[8]), STR_127(CODE[10]), 
;!		 -> STR_128(CODE[8]), STR_129(CODE[5]), STR_83(CODE[7]), STR_84(CODE[7]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[11]), STR_87(CODE[12]), STR_88(CODE[9]), 
;!		 -> STR_89(CODE[13]), STR_90(CODE[6]), STR_91(CODE[6]), STR_92(CODE[9]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[8]), STR_95(CODE[8]), STR_96(CODE[5]), 
;!		 -> STR_97(CODE[7]), STR_98(CODE[7]), STR_99(CODE[10]), 
;!
;!    temp_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK3[5]), value_clock_display(BANK4[10]), value_clock_enable(BANK4[10]), value_display(BANK3[10]), 
;!		 -> value_enable(BANK3[10]), value_end_runtime(BANK4[10]), value_flow_type(BANK4[10]), value_flow_units(BANK4[10]), 
;!		 -> value_hi_pressure(BANK4[10]), value_high_tbp(BANK4[10]), value_high_temp(BANK4[10]), value_highbp(BANK4[10]), 
;!		 -> value_low_flow(BANK4[10]), value_low_flow_bp(BANK4[10]), value_low_pressure(BANK4[10]), value_no_flow(BANK4[10]), 
;!		 -> value_no_flow_bp(BANK4[10]), value_plpbp(BANK4[10]), value_relay_pulse(BANK3[10]), value_rlyhigh(BANK3[10]), 
;!		 -> value_rlylow(BANK3[10]), value_rlyplp(BANK4[10]), value_rlyslp(BANK4[10]), value_scale20(BANK3[10]), 
;!		 -> value_scale4(BANK3[10]), value_sensor(BANK3[12]), value_slpbp(BANK4[10]), NULL(NULL[0]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 60
;!		 -> ad7994_read_channel@buf(BANK0[40]), handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK2[50]), main@buf_603(BANK2[30]), main@buf_640(BANK2[60]), main@buf_643(BANK2[40]), 
;!		 -> main@buf_670(BANK3[30]), main@time_buf(BANK2[60]), menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1532(BANK1[50]), 
;!		 -> menu_handle_button@buf_1554(BANK1[50]), menu_handle_button@buf_1564(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1496(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1499(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), 
;!		 -> rebuild_input_menu@buf(BANK0[50]), STR_10(CODE[42]), STR_11(CODE[34]), STR_13(CODE[28]), 
;!		 -> STR_131(CODE[29]), STR_14(CODE[23]), STR_17(CODE[22]), STR_18(CODE[19]), 
;!		 -> STR_19(CODE[24]), STR_190(CODE[31]), STR_2(CODE[42]), STR_20(CODE[22]), 
;!		 -> STR_21(CODE[22]), STR_22(CODE[19]), STR_260(CODE[27]), STR_273(CODE[25]), 
;!		 -> STR_278(CODE[20]), STR_279(CODE[22]), STR_280(CODE[28]), STR_281(CODE[37]), 
;!		 -> STR_282(CODE[31]), STR_283(CODE[39]), STR_284(CODE[31]), STR_285(CODE[49]), 
;!		 -> STR_286(CODE[38]), STR_287(CODE[43]), STR_288(CODE[38]), STR_289(CODE[29]), 
;!		 -> STR_29(CODE[20]), STR_291(CODE[34]), STR_30(CODE[15]), STR_31(CODE[26]), 
;!		 -> STR_34(CODE[22]), STR_35(CODE[20]), STR_36(CODE[21]), STR_37(CODE[33]), 
;!		 -> STR_4(CODE[29]), STR_40(CODE[36]), STR_41(CODE[20]), STR_42(CODE[21]), 
;!		 -> STR_5(CODE[23]), STR_7(CODE[20]), STR_8(CODE[16]), STR_9(CODE[37]), 
;!		 -> trigger_relay_pulse@buf(BANK0[60]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 60
;!		 -> ad7994_read_channel@buf(BANK0[40]), handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), 
;!		 -> main@buf(BANK2[50]), main@buf_603(BANK2[30]), main@buf_640(BANK2[60]), main@buf_643(BANK2[40]), 
;!		 -> main@buf_670(BANK3[30]), main@time_buf(BANK2[60]), menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1532(BANK1[50]), 
;!		 -> menu_handle_button@buf_1554(BANK1[50]), menu_handle_button@buf_1564(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1496(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1499(BANK1[50]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), 
;!		 -> rebuild_input_menu@buf(BANK0[50]), STR_10(CODE[42]), STR_11(CODE[34]), STR_13(CODE[28]), 
;!		 -> STR_131(CODE[29]), STR_14(CODE[23]), STR_17(CODE[22]), STR_18(CODE[19]), 
;!		 -> STR_19(CODE[24]), STR_190(CODE[31]), STR_2(CODE[42]), STR_20(CODE[22]), 
;!		 -> STR_21(CODE[22]), STR_22(CODE[19]), STR_260(CODE[27]), STR_273(CODE[25]), 
;!		 -> STR_278(CODE[20]), STR_279(CODE[22]), STR_280(CODE[28]), STR_281(CODE[37]), 
;!		 -> STR_282(CODE[31]), STR_283(CODE[39]), STR_284(CODE[31]), STR_285(CODE[49]), 
;!		 -> STR_286(CODE[38]), STR_287(CODE[43]), STR_288(CODE[38]), STR_289(CODE[29]), 
;!		 -> STR_29(CODE[20]), STR_291(CODE[34]), STR_30(CODE[15]), STR_31(CODE[26]), 
;!		 -> STR_34(CODE[22]), STR_35(CODE[20]), STR_36(CODE[21]), STR_37(CODE[33]), 
;!		 -> STR_4(CODE[29]), STR_40(CODE[36]), STR_41(CODE[20]), STR_42(CODE[21]), 
;!		 -> STR_5(CODE[23]), STR_7(CODE[20]), STR_8(CODE[16]), STR_9(CODE[37]), 
;!		 -> trigger_relay_pulse@buf(BANK0[60]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_menu_handle_encoder
;!    _rtc_read_time->_i2c_read
;!    _i2c_restart->_i2c_wait_idle
;!    _rtc_init->_rtc_write_register
;!    _rtc_write_register->_i2c_start
;!    _rtc_write_register->_i2c_stop
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
;!    _init_numeric_editor->___lwdiv
;!    _lcd_init->_lcd_cmd
;!    _lcd_cmd->_lcd_write_nibble
;!    _eeprom_init->_save_current_config
;!    _save_current_config->_eeprom_write_block
;!    _eeprom_write_word->_eeprom_write_byte
;!    _eeprom_write_block->_eeprom_write_byte
;!    _load_factory_defaults->_memcpy
;!    _eeprom_read_word->_eeprom_read_byte
;!    _eeprom_read_block->_eeprom_read_byte
;!    _ad7994_read_channel->_sprintf
;!    _sprintf->___lwdiv
;!    ___lwdiv->___lwmod
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
;! (0) _main                                               309   309      0 1139064
;!                                             75 COMRAM     4     4      0
;!                                            110 BANK0     17    17      0
;!                                            230 BANK1     15    15      0
;!                                              0 BANK2    240   240      0
;!                                              0 BANK3     30    30      0
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
;! (1) _rtc_read_time                                       10     8      2     846
;!                                             22 COMRAM    10     8      2
;!                         _bcd_to_dec
;!                           _i2c_read
;!                        _i2c_restart
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;! ---------------------------------------------------------------------------------
;! (2) _i2c_restart                                          2     2      0      46
;!                                             17 COMRAM     2     2      0
;!                      _i2c_wait_idle
;! ---------------------------------------------------------------------------------
;! (2) _bcd_to_dec                                           2     2      0      44
;!                                             14 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _rtc_init                                             2     2      0     234
;!                                             21 COMRAM     2     2      0
;!                 _rtc_write_register
;! ---------------------------------------------------------------------------------
;! (2) _rtc_write_register                                   2     1      1     234
;!                                             19 COMRAM     2     1      1
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_numeric_value                           28    28      0    9762
;!                                             21 COMRAM    28    28      0
;!                   _is_numeric_field
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_edit_value                              31    31      0   39619
;!                                             62 COMRAM     2     2      0
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
;! (1) _menu_handle_encoder                                172   170      2  313068
;!                                             67 COMRAM     8     6      2
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
;! (2) _handle_time_rotation                                53    53      0   29727
;!                                              0 BANK0     53    53      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _handle_numeric_rotation                             57    57      0   30080
;!                                              0 BANK0     57    57      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                 235   235      0  417069
;!                                             67 COMRAM     5     5      0
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
;! (2) _trigger_relay_pulse                                 61    61      0   29659
;!                                              0 BANK0     61    61      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_input_menu                                  90    90      0   45018
;!                                             62 COMRAM     1     1      0
;!                                              0 BANK0     89    89      0
;!                            ___lwdiv
;!                            ___lwmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_clock_menu                                  58    58      0   38667
;!                                             62 COMRAM     2     2      0
;!                                              0 BANK0     56    56      0
;!                            ___lbdiv
;!                            ___lbmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_time_value                             111   111      0   69578
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
;! (2) _menu_draw_clock                                     32    32      0   30120
;!                                             25 COMRAM    32    32      0
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
;! (2) _menu_draw_setup                                     23    23      0   23095
;!                                             25 COMRAM    23    23      0
;!                          _lcd_clear
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_options                                    2     2      0   22501
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
;! (2) _menu_draw_input                                     51    51      0   62567
;!                                             62 COMRAM     5     5      0
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
;! (3) _lcd_print_at                                         4     1      3    8443
;!                                             21 COMRAM     4     1      3
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_clear_line                                       1     1      0    6761
;!                                             21 COMRAM     1     1      0
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_set_cursor                                       3     2      1    2789
;!                                             18 COMRAM     3     2      1
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (4) _lcd_print                                            2     0      2    3941
;!                                             17 COMRAM     2     0      2
;!                           _lcd_data
;! ---------------------------------------------------------------------------------
;! (5) _lcd_data                                             1     1      0     186
;!                                             16 COMRAM     1     1      0
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
;! (2) _init_time_editor                                    63    60      3   35226
;!                                             62 COMRAM     3     0      3
;!                                              0 BANK0     60    60      0
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _init_numeric_editor                                 10     8      2    5628
;!                                             26 COMRAM    10     8      2
;!                            ___lwdiv
;!                            ___lwmod
;! ---------------------------------------------------------------------------------
;! (2) _get_current_numeric_value                           10     8      2      46
;!                                             14 COMRAM    10     8      2
;! ---------------------------------------------------------------------------------
;! (2) _beep                                                 5     3      2    1870
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
;! (1) _ad7994_read_channel                                 50    48      2   30243
;!                                             62 COMRAM     4     2      2
;!                                              0 BANK0     46    46      0
;!                           _i2c_read
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _sprintf                                             40    24     16   23147
;!                                             26 COMRAM    36    20     16
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
;! (2) ___lwmod                                              5     1      4    2502
;!                                             14 COMRAM     5     1      4
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4    2581
;!                                             19 COMRAM     7     3      4
;!                            ___lwmod (ARG)
;! ---------------------------------------------------------------------------------
;! (2) _i2c_read                                             5     5      0     136
;!                                             17 COMRAM     5     5      0
;!                      _i2c_wait_idle
;! ---------------------------------------------------------------------------------
;! (1) _ad7994_init                                          1     1      0    6368
;!                                             19 COMRAM     1     1      0
;!                          _i2c_start
;!                           _i2c_stop
;!                          _i2c_write
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    6254
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
;! (2) _i2c_write                                            1     1      0      22
;!                                             14 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (2) _i2c_stop                                             2     2      0      46
;!                                             17 COMRAM     2     2      0
;!                      _i2c_wait_idle
;! ---------------------------------------------------------------------------------
;! (2) _i2c_start                                            2     2      0      46
;!                                             17 COMRAM     2     2      0
;!                      _i2c_wait_idle
;! ---------------------------------------------------------------------------------
;! (3) _i2c_wait_idle                                        3     3      0      23
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
;!     _sprintf
;!       ___lbdiv (ARG)
;!       ___lbmod (ARG)
;!       ___lwdiv (ARG)
;!         ___lwmod (ARG)
;!       ___lwmod (ARG)
;!       ___wmul (ARG)
;!       _isdigit (ARG)
;!     _uart_println
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
;!   _rtc_init
;!     _rtc_write_register
;!       _i2c_start
;!       _i2c_stop
;!       _i2c_write
;!   _rtc_read_time
;!     _bcd_to_dec
;!     _i2c_read
;!     _i2c_restart
;!       _i2c_wait_idle
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
;!BANK5              100      0      80      15       50.0%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100      0      C8      13       78.1%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100     1E      FD      11       98.8%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100     F0     100       9      100.0%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100     F5     100       7      100.0%
;!BITBANK15           80      0       0      34        0.0%
;!BANK15              80      0       0      35        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80     7F      80       5      100.0%
;!BITCOMRAM           7E      0       0       0        0.0%
;!COMRAM              7E     4F      69       1       83.3%
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
;!ABS                  0      0     52E      50        0.0%
;!DATA                 0      0     6AE       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 173 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            30    0[BANK3 ] unsigned char [30]
;;  current_even    1    0        unsigned char 
;;  time_buf       60    0[BANK2 ] unsigned char [60]
;;  buf            40  170[BANK2 ] unsigned char [40]
;;  delta           2    0        int 
;;  buf            60   60[BANK2 ] unsigned char [60]
;;  buf            30  210[BANK2 ] unsigned char [30]
;;  buf            50  120[BANK2 ] unsigned char [50]
;;  lcd_buf        17  110[BANK0 ] unsigned char [17]
;;  current_time    7  238[BANK1 ] struct .
;;  last_encoder    2  236[BANK1 ] int 
;;  adc_ch3         2  232[BANK1 ] unsigned int 
;;  adc_ch2         2  230[BANK1 ] unsigned int 
;;  adc_ch1         2   77[COMRAM] unsigned int 
;;  adc_error       1  235[BANK1 ] unsigned char 
;;  last_button     1  234[BANK1 ] unsigned char 
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
;;      Locals:         2      17      15     240      30       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4      17      15     240      30       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      306 bytes
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
	
l12969:
	call	_system_init	;wreg free
	line	178
	
l12971:
	call	_eeprom_init	;wreg free
	line	185
	
l12973:; BSR set to: 3

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
	
l12975:
	call	_uart_init	;wreg free
	line	189
	
l12977:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	191
	
l12979:
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
	
l12981:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	195
	
l12983:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	196
	
l12985:
	call	_i2c_init	;wreg free
	line	197
	
l12987:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	200
	
l12989:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	201
	
l12991:
	call	_rtc_init	;wreg free
	iorlw	0
	btfss	status,2
	goto	u15971
	goto	u15970
u15971:
	goto	l12995
u15970:
	line	203
	
l12993:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	204
	goto	l170
	line	207
	
l12995:
		movlw	low(STR_11)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_11)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	208
	
l170:
	line	210
	call	_ad7994_init	;wreg free
	movlb	1	; () banked
	movwf	((main@adc_error))&0ffh
	line	211
	
l12997:; BSR set to: 1

	movf	((main@adc_error))&0ffh,w
	btfsc	status,2
	goto	u15981
	goto	u15980
u15981:
	goto	l13003
u15980:
	line	214
	
l12999:; BSR set to: 1

		movlw	low(main@buf_603)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_603)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_12)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_12)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@adc_error),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	215
	
l13001:
		movlw	low(main@buf_603)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_603)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	226
	
l13003:
	call	_encoder_init	;wreg free
	line	227
	
l13005:; BSR set to: 3

	call	_menu_init	;wreg free
	line	228
	
l13007:; BSR set to: 3

	call	_lcd_init	;wreg free
	line	230
	
l13009:
		movlw	low(STR_13)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_13)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	231
	
l13011:
		movlw	low(STR_14)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_14)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	233
	
l13013:
	call	_lcd_clear	;wreg free
	line	234
	
l13015:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	235
	
l13017:
		movlw	low(STR_15)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	236
	
l13019:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	237
	
l13021:
		movlw	low(STR_16)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_16)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	239
	
l13023:
		movlw	low(STR_17)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_17)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	240
	
l13025:
		movlw	low(STR_18)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_18)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	241
	
l13027:
		movlw	low(STR_19)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_19)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	243
	
l13029:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	244
	
l13031:
	asmopt push
asmopt off
movlw  5
movwf	(??_main+0+0+1)^00h,c
movlw	15
movwf	(??_main+0+0)^00h,c
	movlw	241
u16007:
decfsz	wreg,f
	bra	u16007
	decfsz	(??_main+0+0)^00h,c,f
	bra	u16007
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u16007
	nop
asmopt pop

	line	245
	
l13033:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	247
	
l13035:
		movlw	low(STR_20)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_20)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	248
	
l13037:
		movlw	low(STR_21)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_21)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	250
	
l13039:
	asmopt push
asmopt off
movlw  41
movwf	(??_main+0+0+1)^00h,c
movlw	150
movwf	(??_main+0+0)^00h,c
	movlw	127
u16017:
decfsz	wreg,f
	bra	u16017
	decfsz	(??_main+0+0)^00h,c,f
	bra	u16017
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u16017
	nop
asmopt pop

	line	254
	
l13041:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	255
	
l13043:; BSR set to: 2

	movlw	low(05h)
	movwf	(0+((c:_menu)+02h))^00h,c
	line	257
	
l13045:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	258
	
l13047:
		movlw	low(STR_22)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_22)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	261
	
l13049:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	262
	
l13051:; BSR set to: 1

	movlw	low(0)
	movwf	((main@last_button))&0ffh
	line	277
	
l13053:
		movlw	low(main@current_time)
	movwf	((c:rtc_read_time@time))^00h,c
	movlw	high(main@current_time)
	movwf	((c:rtc_read_time@time+1))^00h,c

	call	_rtc_read_time	;wreg free
	iorlw	0
	btfss	status,2
	goto	u15991
	goto	u15990
u15991:
	goto	l13059
u15990:
	line	282
	
l13055:
		movlw	low(main@time_buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@time_buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_23)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_23)
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
	line	283
	
l13057:
		movlw	low(main@time_buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@time_buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	287
	
l13059:
	movlw	(01h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(c:main@adc_ch1)
	movff	1+?_ad7994_read_channel,(c:main@adc_ch1+1)
	line	288
	
l13061:
	movlw	(02h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch2)
	movff	1+?_ad7994_read_channel,(main@adc_ch2+1)
	line	289
	
l13063:
	movlw	(03h)&0ffh
	
	call	_ad7994_read_channel
	movff	0+?_ad7994_read_channel,(main@adc_ch3)
	movff	1+?_ad7994_read_channel,(main@adc_ch3+1)
	line	293
	
l13065:
	asmopt push
asmopt off
movlw  41
movwf	(??_main+0+0+1)^00h,c
movlw	150
movwf	(??_main+0+0)^00h,c
	movlw	127
u16027:
decfsz	wreg,f
	bra	u16027
	decfsz	(??_main+0+0)^00h,c,f
	bra	u16027
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u16027
	nop
asmopt pop

	goto	l13053
	global	start
	goto	start
	callstack 0
	line	646
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
	
l8507:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	55
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	57
	
l8509:
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
	
l121:
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
	
l8511:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	91
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	94
	
l139:
	line	93
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u9211
	goto	u9210
u9211:
	goto	l139
u9210:
	line	96
	
l8513:
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
	
l8515:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	103
	
l8517:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	105
	
l8519:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	106
	
l8521:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	107
	
l8523:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	108
	
l8525:
	bsf	((c:3987))^0f00h,c,0	;volatile
	line	109
	
l8527:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	111
	
l8529:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	112
	
l8531:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	115
	
l8533:
	bcf	((c:3988))^0f00h,c,1	;volatile
	line	116
	
l8535:
	bsf	((c:3979))^0f00h,c,1	;volatile
	line	117
	
l142:
	return	;funcret
	callstack 0
GLOBAL	__end_of_system_init
	__end_of_system_init:
	signat	_system_init,89
	global	_rtc_read_time

;; *************** function _rtc_read_time *****************
;; Defined at:
;;		line 147 in file "src\rtc.c"
;; Parameters:    Size  Location     Type
;;  time            2   22[COMRAM] PTR struct .
;;		 -> main@current_time(7), 
;; Auto vars:     Size  Location     Type
;;  i               1   31[COMRAM] unsigned char 
;;  data            7   24[COMRAM] unsigned char [7]
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/1
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
;;		_bcd_to_dec
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
	line	147
global __ptext3
__ptext3:
psect	text3
	file	"src\rtc.c"
	line	147
	
_rtc_read_time:
;incstack = 0
	callstack 26
	line	152
	
l8751:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u9351
	goto	u9350
u9351:
	goto	l8757
u9350:
	line	153
	
l8753:
	movlw	(01h)&0ffh
	goto	l1510
	line	154
	
l8757:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9361
	goto	u9360
u9361:
	goto	l8763
u9360:
	goto	l8753
	line	156
	
l8763:
	movlw	(0)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9371
	goto	u9370
u9371:
	goto	l8769
u9370:
	goto	l8753
	line	160
	
l8769:
	call	_i2c_restart	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u9381
	goto	u9380
u9381:
	goto	l8775
u9380:
	goto	l8753
	line	162
	
l8775:
	movlw	(0D1h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9391
	goto	u9390
u9391:
	goto	l8781
u9390:
	goto	l8753
	line	165
	
l8781:
	movlw	low(0)
	movwf	((c:rtc_read_time@i))^00h,c
	line	167
	
l8787:
	movf	((c:rtc_read_time@i))^00h,c,w
	addlw	low(rtc_read_time@data)
	movwf	fsr2l
	clrf	fsr2h
	movlw	(01h)&0ffh
	
	call	_i2c_read
	movwf	indf2,c

	line	165
	
l8789:
	incf	((c:rtc_read_time@i))^00h,c
	
l8791:
		movlw	06h-1
	cpfsgt	((c:rtc_read_time@i))^00h,c
	goto	u9401
	goto	u9400

u9401:
	goto	l8787
u9400:
	line	169
	
l8793:
	movlw	(0)&0ffh
	
	call	_i2c_read
	movwf	(0+((c:rtc_read_time@data)+06h))^00h,c
	line	170
	call	_i2c_stop	;wreg free
	line	173
	
l8795:
	movf	((c:rtc_read_time@data))^00h,c,w
	andlw	low(07Fh)
	
	call	_bcd_to_dec
	movff	(c:rtc_read_time@time),fsr2l
	movff	(c:rtc_read_time@time+1),fsr2h
	movwf	indf2,c

	line	174
	
l8797:
	lfsr	2,01h
	movf	((c:rtc_read_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_read_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	(0+((c:rtc_read_time@data)+01h))^00h,c,w
	andlw	low(07Fh)
	
	call	_bcd_to_dec
	movwf	indf2,c

	line	175
	
l8799:
	lfsr	2,02h
	movf	((c:rtc_read_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_read_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	(0+((c:rtc_read_time@data)+02h))^00h,c,w
	andlw	low(03Fh)
	
	call	_bcd_to_dec
	movwf	indf2,c

	line	176
	
l8801:
	lfsr	2,03h
	movf	((c:rtc_read_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_read_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	(0+((c:rtc_read_time@data)+03h))^00h,c,w
	andlw	low(07h)
	
	call	_bcd_to_dec
	movwf	indf2,c

	line	177
	
l8803:
	lfsr	2,04h
	movf	((c:rtc_read_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_read_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	(0+((c:rtc_read_time@data)+04h))^00h,c,w
	andlw	low(03Fh)
	
	call	_bcd_to_dec
	movwf	indf2,c

	line	178
	
l8805:
	lfsr	2,05h
	movf	((c:rtc_read_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_read_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	(0+((c:rtc_read_time@data)+05h))^00h,c,w
	andlw	low(01Fh)
	
	call	_bcd_to_dec
	movwf	indf2,c

	line	179
	
l8807:
	lfsr	2,06h
	movf	((c:rtc_read_time@time))^00h,c,w
	addwf	fsr2l
	movf	((c:rtc_read_time@time+1))^00h,c,w
	addwfc	fsr2h
	movf	(0+((c:rtc_read_time@data)+06h))^00h,c,w
	
	call	_bcd_to_dec
	movwf	indf2,c

	line	181
	
l8809:
	movlw	(0)&0ffh
	line	182
	
l1510:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rtc_read_time
	__end_of_rtc_read_time:
	signat	_rtc_read_time,4217
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
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_i2c_wait_idle
;; This function is called by:
;;		_rtc_read_time
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
	
l8415:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u9061
	goto	u9060
u9061:
	goto	l1439
u9060:
	line	82
	
l8417:
	movlw	(01h)&0ffh
	goto	l1440
	
l1439:
	line	84
	bsf	((c:4037))^0f00h,c,1	;volatile
	line	86
	
l8421:
	movlw	high(03E8h)
	movwf	((c:i2c_restart@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_restart@timeout))^00h,c
	line	87
	goto	l1441
	line	89
	
l8423:
	decf	((c:i2c_restart@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_restart@timeout+1))^00h,c
	movf	((c:i2c_restart@timeout))^00h,c,w
iorwf	((c:i2c_restart@timeout+1))^00h,c,w
	btfss	status,2
	goto	u9071
	goto	u9070

u9071:
	goto	l1441
u9070:
	goto	l8417
	line	91
	
l1441:
	line	87
	btfsc	((c:4037))^0f00h,c,1	;volatile
	goto	u9081
	goto	u9080
u9081:
	goto	l8423
u9080:
	line	93
	
l8429:
	movlw	(0)&0ffh
	line	94
	
l1440:
	return	;funcret
	callstack 0
GLOBAL	__end_of_i2c_restart
	__end_of_i2c_restart:
	signat	_i2c_restart,89
	global	_bcd_to_dec

;; *************** function _bcd_to_dec *****************
;; Defined at:
;;		line 141 in file "src\rtc.c"
;; Parameters:    Size  Location     Type
;;  bcd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bcd             1   15[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, prodl, prodh
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rtc_read_time
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	file	"src\rtc.c"
	line	141
global __ptext5
__ptext5:
psect	text5
	file	"src\rtc.c"
	line	141
	
_bcd_to_dec:
;incstack = 0
	callstack 27
	movwf	((c:bcd_to_dec@bcd))^00h,c
	line	143
	
l8503:
	movff	(c:bcd_to_dec@bcd),??_bcd_to_dec+0+0
	movlw	0Fh
	andwf	(??_bcd_to_dec+0+0)^00h,c
	swapf	((c:bcd_to_dec@bcd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	mullw	0Ah
	movf	(prodl)^0f00h,c,w
	addwf	(??_bcd_to_dec+0+0)^00h,c,w
	line	144
	
l1506:
	return	;funcret
	callstack 0
GLOBAL	__end_of_bcd_to_dec
	__end_of_bcd_to_dec:
	signat	_bcd_to_dec,4217
	global	_rtc_init

;; *************** function _rtc_init *****************
;; Defined at:
;;		line 117 in file "src\rtc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, cstack
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
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_rtc_write_register
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	117
global __ptext6
__ptext6:
psect	text6
	file	"src\rtc.c"
	line	117
	
_rtc_init:
;incstack = 0
	callstack 25
	line	121
	
l8593:
	asmopt push
asmopt off
movlw  21
movwf	(??_rtc_init+0+0+1)^00h,c
movlw	75
movwf	(??_rtc_init+0+0)^00h,c
	movlw	190
u16037:
decfsz	wreg,f
	bra	u16037
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u16037
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u16037
	nop2
asmopt pop

	line	122
	asmopt push
asmopt off
movlw  21
movwf	(??_rtc_init+0+0+1)^00h,c
movlw	75
movwf	(??_rtc_init+0+0)^00h,c
	movlw	190
u16047:
decfsz	wreg,f
	bra	u16047
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u16047
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u16047
	nop2
asmopt pop

	line	123
	asmopt push
asmopt off
movlw  21
movwf	(??_rtc_init+0+0+1)^00h,c
movlw	75
movwf	(??_rtc_init+0+0)^00h,c
	movlw	190
u16057:
decfsz	wreg,f
	bra	u16057
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u16057
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u16057
	nop2
asmopt pop

	line	124
	asmopt push
asmopt off
movlw  21
movwf	(??_rtc_init+0+0+1)^00h,c
movlw	75
movwf	(??_rtc_init+0+0)^00h,c
	movlw	190
u16067:
decfsz	wreg,f
	bra	u16067
	decfsz	(??_rtc_init+0+0)^00h,c,f
	bra	u16067
	decfsz	(??_rtc_init+0+0+1)^00h,c,f
	bra	u16067
	nop2
asmopt pop

	line	129
	
l8595:
	movlw	low(0)
	movwf	((c:rtc_write_register@value))^00h,c
	movlw	(0Eh)&0ffh
	
	call	_rtc_write_register
	iorlw	0
	btfsc	status,2
	goto	u9281
	goto	u9280
u9281:
	goto	l8601
u9280:
	line	131
	
l8597:
	movlw	(01h)&0ffh
	goto	l1503
	line	138
	
l8601:
	movlw	(0)&0ffh
	line	139
	
l1503:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rtc_init
	__end_of_rtc_init:
	signat	_rtc_init,89
	global	_rtc_write_register

;; *************** function _rtc_write_register *****************
;; Defined at:
;;		line 19 in file "src\rtc.c"
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
;;		On entry : 0/3
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
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	19
global __ptext7
__ptext7:
psect	text7
	file	"src\rtc.c"
	line	19
	
_rtc_write_register:
;incstack = 0
	callstack 25
	movwf	((c:rtc_write_register@reg))^00h,c
	line	22
	
l8467:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u9171
	goto	u9170
u9171:
	goto	l8473
u9170:
	line	23
	
l8469:
	movlw	(01h)&0ffh
	goto	l1488
	line	26
	
l8473:
	movlw	(0D0h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9181
	goto	u9180
u9181:
	goto	l8481
u9180:
	line	28
	
l8475:
	call	_i2c_stop	;wreg free
	goto	l8469
	line	33
	
l8481:
	movf	((c:rtc_write_register@reg))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9191
	goto	u9190
u9191:
	goto	l8489
u9190:
	goto	l8475
	line	40
	
l8489:
	movf	((c:rtc_write_register@value))^00h,c,w
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9201
	goto	u9200
u9201:
	goto	l8497
u9200:
	goto	l8475
	line	47
	
l8497:
	call	_i2c_stop	;wreg free
	line	49
	
l8499:
	movlw	(0)&0ffh
	line	50
	
l1488:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rtc_write_register
	__end_of_rtc_write_register:
	signat	_rtc_write_register,8313
	global	_menu_update_numeric_value

;; *************** function _menu_update_numeric_value *****************
;; Defined at:
;;		line 1007 in file "src\menu.c"
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
;;		On entry : 0/0
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
psect	text8,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1007
global __ptext8
__ptext8:
psect	text8
	file	"src\menu.c"
	line	1007
	
_menu_update_numeric_value:
;incstack = 0
	callstack 25
	line	1010
	
l12143:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14311
	goto	u14310

u14311:
	goto	l807
u14310:
	
l12145:; BSR set to: 2

	movf	(0+((c:_menu)+03h))^00h,c,w
	btfss	status,2
	goto	u14321
	goto	u14320
u14321:
	goto	l12147
u14320:
	goto	l807
	line	1014
	
l12147:; BSR set to: 2

	movf	(0+((c:_menu)+01h))^00h,c,w
	subwf	((c:_menu))^00h,c,w
	movwf	((c:menu_update_numeric_value@screen_line))^00h,c
	line	1015
		movlw	03h-1
	cpfsgt	((c:menu_update_numeric_value@screen_line))^00h,c
	goto	u14331
	goto	u14330

u14331:
	goto	l12151
u14330:
	goto	l807
	line	1020
	
l12151:; BSR set to: 2

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
	
l12153:; BSR set to: 2

	movff	(c:menu_update_numeric_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(c:menu_update_numeric_value@flow_type),(c:is_numeric_field@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u14341
	goto	u14340
u14341:
	goto	l12157
u14340:
	goto	l807
	line	1028
	
l12157:
	lfsr	2,(menu_update_numeric_value@value_buf)
	movlw	6-1
u14351:
	clrf	postinc2
	decf	wreg
	bc	u14351
	line	1030
	
l12159:
	movf	(0+((c:_menu)+0Fh))^00h,c,w
	btfsc	status,2
	goto	u14361
	goto	u14360
u14361:
	goto	l12191
u14360:
	line	1033
	
l12161:
		decf	(0+((c:_menu)+08h))^00h,c,w
	btfss	status,2
	goto	u14371
	goto	u14370

u14371:
	goto	l12165
u14370:
	
l12163:
	movf	(0+((c:_menu)+05h))^00h,c,w
	btfsc	status,2
	goto	u14381
	goto	u14380
u14381:
	goto	l12167
u14380:
	
l12165:
	movlw	low(030h)
	addwf	(0+((c:_menu)+0Ah))^00h,c,w
	movwf	((c:_menu_update_numeric_value$1343))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1343))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1343))^00h,c
	goto	l12169
	
l12167:
	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1343+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1343))^00h,c
	
l12169:
	movff	(c:_menu_update_numeric_value$1343),(c:menu_update_numeric_value@value_buf)
	line	1034
	
l12171:
		movlw	2
	xorwf	(0+((c:_menu)+08h))^00h,c,w
	btfss	status,2
	goto	u14391
	goto	u14390

u14391:
	goto	l12175
u14390:
	
l12173:
	movf	(0+((c:_menu)+05h))^00h,c,w
	btfsc	status,2
	goto	u14401
	goto	u14400
u14401:
	goto	l12177
u14400:
	
l12175:
	movlw	low(030h)
	addwf	(0+((c:_menu)+0Bh))^00h,c,w
	movwf	((c:_menu_update_numeric_value$1344))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1344))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1344))^00h,c
	goto	l12179
	
l12177:
	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1344+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1344))^00h,c
	
l12179:
	movff	(c:_menu_update_numeric_value$1344),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1035
	
l12181:
		movlw	3
	xorwf	(0+((c:_menu)+08h))^00h,c,w
	btfss	status,2
	goto	u14411
	goto	u14410

u14411:
	goto	l12185
u14410:
	
l12183:
	movf	(0+((c:_menu)+05h))^00h,c,w
	btfsc	status,2
	goto	u14421
	goto	u14420
u14421:
	goto	l12187
u14420:
	
l12185:
	movlw	low(030h)
	addwf	(0+((c:_menu)+0Ch))^00h,c,w
	movwf	((c:_menu_update_numeric_value$1345))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1345))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1345))^00h,c
	goto	l12189
	
l12187:
	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1345+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1345))^00h,c
	
l12189:
	movff	(c:_menu_update_numeric_value$1345),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1036
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+03h))^00h,c
	line	1037
	goto	l833
	line	1041
	
l12191:
	movf	(0+((c:_menu)+08h))^00h,c,w
	btfss	status,2
	goto	u14431
	goto	u14430
u14431:
	goto	l12195
u14430:
	
l12193:
	movf	(0+((c:_menu)+05h))^00h,c,w
	btfsc	status,2
	goto	u14441
	goto	u14440
u14441:
	goto	l12203
u14440:
	
l12195:
	movf	(0+((c:_menu)+09h))^00h,c,w
	btfss	status,2
	goto	u14451
	goto	u14450
u14451:
	goto	l12199
u14450:
	
l12197:
	movlw	high(02Bh)
	movwf	((c:_menu_update_numeric_value$1347+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_menu_update_numeric_value$1347))^00h,c
	goto	l12201
	
l12199:
	movlw	high(02Dh)
	movwf	((c:_menu_update_numeric_value$1347+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_menu_update_numeric_value$1347))^00h,c
	
l12201:
	movff	(c:_menu_update_numeric_value$1347),(c:_menu_update_numeric_value$1346)
	movff	(c:_menu_update_numeric_value$1347+1),(c:_menu_update_numeric_value$1346+1)
	goto	l12205
	
l12203:
	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1346+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1346))^00h,c
	
l12205:
	movff	(c:_menu_update_numeric_value$1346),(c:menu_update_numeric_value@value_buf)
	line	1042
	
l12207:
		decf	(0+((c:_menu)+08h))^00h,c,w
	btfss	status,2
	goto	u14461
	goto	u14460

u14461:
	goto	l12211
u14460:
	
l12209:
	movf	(0+((c:_menu)+05h))^00h,c,w
	btfsc	status,2
	goto	u14471
	goto	u14470
u14471:
	goto	l12213
u14470:
	
l12211:
	movlw	low(030h)
	addwf	(0+((c:_menu)+0Ah))^00h,c,w
	movwf	((c:_menu_update_numeric_value$1348))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1348))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1348))^00h,c
	goto	l12215
	
l12213:
	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1348+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1348))^00h,c
	
l12215:
	movff	(c:_menu_update_numeric_value$1348),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1043
	
l12217:
		movlw	2
	xorwf	(0+((c:_menu)+08h))^00h,c,w
	btfss	status,2
	goto	u14481
	goto	u14480

u14481:
	goto	l12221
u14480:
	
l12219:
	movf	(0+((c:_menu)+05h))^00h,c,w
	btfsc	status,2
	goto	u14491
	goto	u14490
u14491:
	goto	l12223
u14490:
	
l12221:
	movlw	low(030h)
	addwf	(0+((c:_menu)+0Bh))^00h,c,w
	movwf	((c:_menu_update_numeric_value$1349))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1349))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1349))^00h,c
	goto	l12225
	
l12223:
	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1349+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1349))^00h,c
	
l12225:
	movff	(c:_menu_update_numeric_value$1349),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1044
	
l12227:
		movlw	3
	xorwf	(0+((c:_menu)+08h))^00h,c,w
	btfss	status,2
	goto	u14501
	goto	u14500

u14501:
	goto	l12231
u14500:
	
l12229:
	movf	(0+((c:_menu)+05h))^00h,c,w
	btfsc	status,2
	goto	u14511
	goto	u14510
u14511:
	goto	l12233
u14510:
	
l12231:
	movlw	low(030h)
	addwf	(0+((c:_menu)+0Ch))^00h,c,w
	movwf	((c:_menu_update_numeric_value$1350))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1350))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1350))^00h,c
	goto	l12235
	
l12233:
	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1350+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1350))^00h,c
	
l12235:
	movff	(c:_menu_update_numeric_value$1350),0+((c:menu_update_numeric_value@value_buf)+03h)
	line	1045
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+04h))^00h,c
	line	1046
	
l833:
	line	1049
	movf	(0+((c:_menu)+0Fh))^00h,c,w
	btfss	status,2
	goto	u14521
	goto	u14520
u14521:
	goto	l12239
u14520:
	
l12237:
	movlw	high(0Eh)
	movwf	((c:_menu_update_numeric_value$1352+1))^00h,c
	movlw	low(0Eh)
	movwf	((c:_menu_update_numeric_value$1352))^00h,c
	goto	l12241
	
l12239:
	movlw	high(0Fh)
	movwf	((c:_menu_update_numeric_value$1352+1))^00h,c
	movlw	low(0Fh)
	movwf	((c:_menu_update_numeric_value$1352))^00h,c
	
l12241:
	movff	(c:_menu_update_numeric_value$1352),(c:menu_update_numeric_value@start_col)
	line	1051
	
l12243:
	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1052
	
l12245:
		movlw	low(STR_197)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_197)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1054
	
l12247:
	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1055
	
l12249:
		movlw	low(STR_198)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_198)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1056
	
l12251:
		movlw	low(menu_update_numeric_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1057
	
l12253:
		movlw	low(STR_199)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_199)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1058
	
l807:
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
;;		On entry : 0/0
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
psect	text9,class=CODE,space=0,reloc=2,group=0
	line	943
global __ptext9
__ptext9:
psect	text9
	file	"src\menu.c"
	line	943
	
_menu_update_edit_value:
;incstack = 0
	callstack 25
	line	947
	
l12255:
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
	
l12257:; BSR set to: 0

	movf	(0+((c:_menu)+03h))^00h,c,w
	btfsc	status,2
	goto	u14531
	goto	u14530
u14531:
	goto	l785
u14530:
	
l12259:; BSR set to: 0

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u14541
	goto	u14540

u14541:
	goto	l12261
u14540:
	goto	l785
	line	955
	
l12261:; BSR set to: 2

	movf	(0+((c:_menu)+01h))^00h,c,w
	subwf	((c:_menu))^00h,c,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@screen_line))&0ffh
	line	956
		movlw	03h-1
	cpfsgt	((menu_update_edit_value@screen_line))&0ffh
	goto	u14551
	goto	u14550

u14551:
	goto	l12265
u14550:
	goto	l785
	line	960
	
l12265:; BSR set to: 0

	movff	(menu_update_edit_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_update_edit_value@flow_type),(c:is_numeric_field@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u14561
	goto	u14560
u14561:
	goto	l12269
u14560:
	goto	l785
	line	965
	
l12269:
	movf	(0+((c:_menu)+0Fh))^00h,c,w
	btfsc	status,2
	goto	u14571
	goto	u14570
u14571:
	goto	l12273
u14570:
	line	967
	
l12271:
		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_192)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_192)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+((c:_menu)+0Ah),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+((c:_menu)+0Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+((c:_menu)+0Ch),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	968
	goto	l12281
	line	973
	
l12273:
	movf	(0+((c:_menu)+09h))^00h,c,w
	btfss	status,2
	goto	u14581
	goto	u14580
u14581:
	goto	l12277
u14580:
	
l12275:
	movlw	high(02Bh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1328+1))&0ffh
	movlw	low(02Bh)
	movwf	((_menu_update_edit_value$1328))&0ffh
	goto	l12279
	
l12277:
	movlw	high(02Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1328+1))&0ffh
	movlw	low(02Dh)
	movwf	((_menu_update_edit_value$1328))&0ffh
	
l12279:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_193)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_193)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu_update_edit_value$1328),0+((c:?_sprintf)+04h)
	movff	(_menu_update_edit_value$1328+1),1+((c:?_sprintf)+04h)
	movff	0+((c:_menu)+0Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+((c:_menu)+0Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+((c:_menu)+0Ch),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	call	_sprintf	;wreg free
	line	978
	
l12281:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@from))^00h,c
	clrf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	980
	
l12283:
	movf	(0+((c:_menu)+05h))^00h,c,w
	btfss	status,2
	goto	u14591
	goto	u14590
u14591:
	goto	l12293
u14590:
	line	983
	
l12285:
	movf	(0+((c:_menu)+0Fh))^00h,c,w
	btfsc	status,2
	goto	u14601
	goto	u14600
u14601:
	goto	l795
u14600:
	line	984
	
l12287:
	decf	(0+((c:_menu)+08h))^00h,c,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@blink_pos))&0ffh
	goto	l12289
	line	985
	
l795:
	line	986
	movff	0+((c:_menu)+08h),(menu_update_edit_value@blink_pos)
	line	988
	
l12289:
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
	goto	u14611
	goto	u14610

u14611:
	goto	l12293
u14610:
	line	989
	
l12291:; BSR set to: 0

	movf	((menu_update_edit_value@blink_pos))&0ffh,w
	addlw	low(menu_update_edit_value@display_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	993
	
l12293:
	movf	(0+((c:_menu)+0Fh))^00h,c,w
	btfss	status,2
	goto	u14621
	goto	u14620
u14621:
	goto	l12297
u14620:
	
l12295:
	movlw	high(0Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1332+1))&0ffh
	movlw	low(0Dh)
	movwf	((_menu_update_edit_value$1332))&0ffh
	goto	l12299
	
l12297:
	movlw	high(0Eh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1332+1))&0ffh
	movlw	low(0Eh)
	movwf	((_menu_update_edit_value$1332))&0ffh
	
l12299:; BSR set to: 0

	movff	(_menu_update_edit_value$1332),(menu_update_edit_value@start_col)
	line	994
	
l12301:; BSR set to: 0

	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	995
	
l12303:
		movlw	low(STR_194)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_194)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	997
	
l12305:
	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	movlb	0	; () banked
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	998
	
l12307:
		movlw	low(STR_195)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_195)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	999
	
l12309:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1000
	
l12311:
		movlw	low(STR_196)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_196)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1001
	
l785:
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
;;		On entry : 3F/3
;;		On exit  : 3F/3
;;		Unchanged: 3E/0
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
psect	text10,class=CODE,space=0,reloc=2,group=0
	line	628
global __ptext10
__ptext10:
psect	text10
	file	"src\menu.c"
	line	628
	
_menu_init:
;incstack = 0
	callstack 28
	line	630
	
l8679:; BSR set to: 3

	movlw	low(0)
	movwf	((c:_menu))^00h,c
	line	631
	movlw	low(0)
	movwf	(0+((c:_menu)+01h))^00h,c
	line	632
	movlw	low(05h)
	movwf	(0+((c:_menu)+02h))^00h,c
	line	633
	movlw	low(0)
	movwf	(0+((c:_menu)+03h))^00h,c
	line	634
	movlw	low(0)
	movwf	(0+((c:_menu)+05h))^00h,c
	line	635
	movlw	high(0)
	movwf	(1+((c:_menu)+06h))^00h,c
	movlw	low(0)
	movwf	(0+((c:_menu)+06h))^00h,c
	line	636
	
l632:; BSR set to: 3

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
;;  delta           2   67[COMRAM] int 
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
;;		On entry : 0/0
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
psect	text11,class=CODE,space=0,reloc=2,group=0
	line	1439
global __ptext11
__ptext11:
psect	text11
	file	"src\menu.c"
	line	1439
	
_menu_handle_encoder:; BSR set to: 3

;incstack = 0
	callstack 22
	line	1444
	
l11967:
	movf	(0+((c:_menu)+03h))^00h,c,w
	btfsc	status,2
	goto	u13931
	goto	u13930
u13931:
	goto	l12089
u13930:
	line	1446
	
l11969:
	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u13941
	goto	u13940

u13941:
	goto	l1005
u13940:
	line	1449
	
l11971:
		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13951
	goto	u13950

u13951:
	goto	l12033
u13950:
	line	1452
	
l11973:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_243)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_243)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(c:menu_handle_encoder@delta),0+((c:?_sprintf)+06h)
	movff	(c:menu_handle_encoder@delta+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1453
	
l11975:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1456
	
l11977:
		movlw	2
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u13961
	goto	u13960

u13961:
	goto	l11983
u13960:
	line	1459
	
l11979:
	movf	((c:menu_handle_encoder@delta))^00h,c,w
	
	call	_handle_time_rotation
	line	1460
	call	_menu_update_time_value	;wreg free
	goto	l1005
	line	1461
	
l11981:
	goto	l1005
	line	1464
	
l11983:
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
	
l11985:; BSR set to: 1

	movf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u13971
	goto	u13970
u13971:
	goto	l11989
u13970:
	line	1469
	
l11987:; BSR set to: 1

		movlw	low(_menu_item_options)
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1470
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	movlw	high(_enable_edit_flag)
	movwf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1471
	goto	l1007
	line	1472
	
l11989:; BSR set to: 1

		decf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u13981
	goto	u13980

u13981:
	goto	l11993
u13980:
	line	1474
	
l11991:; BSR set to: 1

		movlw	low(_menu_item_options+048h)
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1475
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1476
	goto	l1007
	line	1477
	
l11993:; BSR set to: 1

		movlw	3
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u13991
	goto	u13990

u13991:
	goto	l1007
u13990:
	line	1479
	
l11995:; BSR set to: 1

		movlw	low(_menu_item_options+03Ch)
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1480
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1483
	
l1007:; BSR set to: 1

	movf	((menu_handle_encoder@clock_opts))&0ffh,w
iorwf	((menu_handle_encoder@clock_opts+1))&0ffh,w
	btfsc	status,2
	goto	u14001
	goto	u14000

u14001:
	goto	l1005
u14000:
	
l11997:; BSR set to: 1

	movf	((menu_handle_encoder@clock_flag))&0ffh,w
iorwf	((menu_handle_encoder@clock_flag+1))&0ffh,w
	btfsc	status,2
	goto	u14011
	goto	u14010

u14011:
	goto	l1005
u14010:
	line	1485
	
l11999:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_244)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_244)
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
	
l12001:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1488
	
l12003:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u14021
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u14020
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u14021
	goto	u14020

u14021:
	goto	l12011
u14020:
	line	1490
	
l12005:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	incf	indf2

	line	1491
	
l12007:
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
	goto	u14031
	goto	u14030

u14031:
	goto	l12019
u14030:
	line	1492
	
l12009:; BSR set to: 1

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	goto	l12019
	line	1494
	
l12011:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u14040
	goto	u14041

u14041:
	goto	l12019
u14040:
	line	1496
	
l12013:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u14051
	goto	u14050
u14051:
	goto	l12017
u14050:
	line	1497
	
l12015:
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

	goto	l12019
	line	1499
	
l12017:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	decf	indf2

	line	1503
	
l12019:
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
	goto	u14061
	goto	u14060

u14061:
	goto	l12023
u14060:
	line	1504
	
l12021:; BSR set to: 1

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	line	1506
	
l12023:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_245)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_245)
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
	
l12025:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1510
	
l12027:
	movf	((c:_menu))^00h,c,w
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
	
l12029:
	call	_menu_draw_clock	;wreg free
	goto	l1005
	line	1518
	
l12033:; BSR set to: 2

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
	
l12035:; BSR set to: 1

	movff	(menu_handle_encoder@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_option_field@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u14071
	goto	u14070
u14071:
	goto	l12067
u14070:
	line	1524
	
l12037:
	movff	(menu_handle_encoder@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_option_edit_flag@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_encoder@edit_flag)
	movff	1+?_get_option_edit_flag,(menu_handle_encoder@edit_flag+1)
	line	1525
	movff	(menu_handle_encoder@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_item_options_for_field@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_encoder@opts)
	movff	1+?_get_item_options_for_field,(menu_handle_encoder@opts+1)
	line	1527
	
l12039:
	movlb	1	; () banked
	movf	((menu_handle_encoder@edit_flag))&0ffh,w
iorwf	((menu_handle_encoder@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u14081
	goto	u14080

u14081:
	goto	l1005
u14080:
	
l12041:; BSR set to: 1

	movf	((menu_handle_encoder@opts))&0ffh,w
iorwf	((menu_handle_encoder@opts+1))&0ffh,w
	btfsc	status,2
	goto	u14091
	goto	u14090

u14091:
	goto	l1005
u14090:
	line	1529
	
l12043:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u14101
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u14100
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u14101
	goto	u14100

u14101:
	goto	l12051
u14100:
	line	1531
	
l12045:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	incf	indf2

	line	1532
	
l12047:; BSR set to: 1

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
	goto	u14111
	goto	u14110

u14111:
	goto	l12059
u14110:
	line	1533
	
l12049:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	goto	l12059
	line	1535
	
l12051:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u14120
	goto	u14121

u14121:
	goto	l12059
u14120:
	line	1537
	
l12053:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u14131
	goto	u14130
u14131:
	goto	l12057
u14130:
	line	1538
	
l12055:; BSR set to: 1

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

	goto	l12059
	line	1540
	
l12057:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	decf	indf2

	line	1544
	
l12059:; BSR set to: 1

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
	goto	u14141
	goto	u14140

u14141:
	goto	l12063
u14140:
	line	1545
	
l12061:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	line	1548
	
l12063:; BSR set to: 1

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14151
	goto	u14150

u14151:
	goto	l11981
u14150:
	line	1550
	
l12065:; BSR set to: 2

	movf	((c:_menu))^00h,c,w
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
	goto	l1005
	line	1555
	
l12067:
	movff	(menu_handle_encoder@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_numeric_field@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u14161
	goto	u14160
u14161:
	goto	l12077
u14160:
	line	1557
	
l12069:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u14170
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u14171
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u14171
	goto	u14170

u14171:
	goto	l12073
u14170:
	
l12071:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1494))&0ffh
	setf	((_menu_handle_encoder$1494+1))&0ffh
	goto	l12075
	
l12073:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1494+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1494))&0ffh
	
l12075:; BSR set to: 1

	movf	((_menu_handle_encoder$1494))&0ffh,w
	
	call	_handle_numeric_rotation
	line	1558
	goto	l1005
	line	1559
	
l12077:
	movff	(menu_handle_encoder@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_time_field@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u14181
	goto	u14180
u14181:
	goto	l11981
u14180:
	line	1561
	
l12079:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u14190
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u14191
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u14191
	goto	u14190

u14191:
	goto	l12083
u14190:
	
l12081:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1495))&0ffh
	setf	((_menu_handle_encoder$1495+1))&0ffh
	goto	l12085
	
l12083:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1495+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1495))&0ffh
	
l12085:; BSR set to: 1

	movf	((_menu_handle_encoder$1495))&0ffh,w
	
	call	_handle_time_rotation
	goto	l1005
	line	1568
	
l12089:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u14201
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u14200
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u14201
	goto	u14200

u14201:
	goto	l12107
u14200:
	line	1572
	
l12091:
		movlw	low(menu_handle_encoder@buf_1496)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1496)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_246)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_246)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(c:_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+((c:_menu)+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1573
	
l12093:
		movlw	low(menu_handle_encoder@buf_1496)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1496)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1576
	
l12095:
	movlw	low(-1)
	addwf	(0+((c:_menu)+02h))^00h,c,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	clrf	1+(??_menu_handle_encoder+0+0)^00h,c
	movlw	high(-1)
	addwfc	1+(??_menu_handle_encoder+0+0)^00h,c
	movf	((c:_menu))^00h,c,w
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
	goto	u14211
	goto	u14210

u14211:
	goto	l12103
u14210:
	line	1578
	
l12097:
	incf	((c:_menu))^00h,c
	line	1581
	
l12099:
	movf	(0+((c:_menu)+01h))^00h,c,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	clrf	(??_menu_handle_encoder+0+0+1)^00h,c

	movlw	03h
	addwf	(??_menu_handle_encoder+0+0)^00h,c
	movlw	0
	addwfc	(??_menu_handle_encoder+0+1)^00h,c
	movf	((c:_menu))^00h,c,w
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
	goto	u14221
	goto	u14220

u14221:
	goto	l12103
u14220:
	line	1583
	
l12101:
	incf	(0+((c:_menu)+01h))^00h,c
	line	1587
	
l12103:
		movlw	low(menu_handle_encoder@buf_1496)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1496)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_247)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_247)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+((c:_menu)+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1588
	
l12105:
		movlw	low(menu_handle_encoder@buf_1496)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1496)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1589
	goto	l12125
	line	1590
	
l12107:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u14230
	goto	u14231

u14231:
	goto	l12125
u14230:
	line	1594
	
l12109:
		movlw	low(menu_handle_encoder@buf_1499)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1499)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_248)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_248)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(c:_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+((c:_menu)+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1595
	
l12111:
		movlw	low(menu_handle_encoder@buf_1499)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1499)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1598
	
l12113:
	movf	((c:_menu))^00h,c,w
	btfsc	status,2
	goto	u14241
	goto	u14240
u14241:
	goto	l12121
u14240:
	line	1600
	
l12115:
	decf	((c:_menu))^00h,c
	line	1603
	
l12117:
		movf	(0+((c:_menu)+01h))^00h,c,w
	subwf	((c:_menu))^00h,c,w
	btfsc	status,0
	goto	u14251
	goto	u14250

u14251:
	goto	l12121
u14250:
	line	1605
	
l12119:
	decf	(0+((c:_menu)+01h))^00h,c
	line	1609
	
l12121:
		movlw	low(menu_handle_encoder@buf_1499)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1499)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_249)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_249)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+((c:_menu)+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1610
	
l12123:
		movlw	low(menu_handle_encoder@buf_1499)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1499)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1614
	
l12125:
	movf	(0+((c:_menu)+03h))^00h,c,w
	btfss	status,2
	goto	u14261
	goto	u14260
u14261:
	goto	l1005
u14260:
	line	1616
	
l12127:
	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14271
	goto	u14270
u14271:
	goto	l12131
u14270:
	line	1617
	
l12129:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	goto	l1005
	line	1618
	
l12131:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14281
	goto	u14280

u14281:
	goto	l12135
u14280:
	line	1619
	
l12133:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	goto	l1005
	line	1620
	
l12135:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14291
	goto	u14290

u14291:
	goto	l12139
u14290:
	line	1621
	
l12137:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	goto	l1005
	line	1622
	
l12139:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14301
	goto	u14300

u14301:
	goto	l11981
u14300:
	goto	l12029
	line	1625
	
l1005:
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
;;		On entry : 0/2
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
psect	text12,class=CODE,space=0,reloc=2,group=0
	line	450
global __ptext12
__ptext12:
psect	text12
	file	"src\menu.c"
	line	450
	
_handle_time_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_time_rotation@direction))&0ffh
	line	452
	
l11081:
		movlw	low(STR_131)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_131)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	456
	
l11083:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_132)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_132)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+((c:_menu)+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+((c:_menu)+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movlb	0	; () banked
	movf	((handle_time_rotation@direction))&0ffh,w
	movwf	(0+((c:?_sprintf)+08h))^00h,c
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	btfsc	(0+((c:?_sprintf)+08h))^00h,c,7
	decf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+((c:_menu)+011h),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	call	_sprintf	;wreg free
	line	457
	
l11085:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	459
	
l11087:
	movf	(0+((c:_menu)+011h))^00h,c,w
	btfss	status,2
	goto	u12911
	goto	u12910
u12911:
	goto	l11129
u12910:
	line	461
	
l11089:
	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12921
	goto	u12920

u12921:
	goto	l11111
u12920:
	line	463
	
l11091:; BSR set to: 0

	incf	(0+((c:_menu)+012h))^00h,c
	line	465
	
l11093:; BSR set to: 0

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u12931
	goto	u12930

u12931:
	goto	l11101
u12930:
	
l11095:; BSR set to: 2

		movlw	2
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u12941
	goto	u12940

u12941:
	goto	l11101
u12940:
	
l11097:; BSR set to: 2

		movlw	03h-1
	cpfsgt	(0+((c:_menu)+012h))^00h,c
	goto	u12951
	goto	u12950

u12951:
	goto	l11101
u12950:
	line	466
	
l11099:; BSR set to: 2

	movlw	low(0)
	movwf	(0+((c:_menu)+012h))^00h,c
	goto	l11155
	line	467
	
l11101:; BSR set to: 2

		movlw	2
	xorwf	(0+((c:_menu)+010h))^00h,c,w
	btfss	status,2
	goto	u12961
	goto	u12960

u12961:
	goto	l11107
u12960:
	
l11103:; BSR set to: 2

		movlw	018h-1
	cpfsgt	(0+((c:_menu)+012h))^00h,c
	goto	u12971
	goto	u12970

u12971:
	goto	l11107
u12970:
	goto	l11099
	line	469
	
l11107:; BSR set to: 2

		movlw	064h-1
	cpfsgt	(0+((c:_menu)+012h))^00h,c
	goto	u12981
	goto	u12980

u12981:
	goto	l592
u12980:
	goto	l11099
	line	474
	
l11111:; BSR set to: 0

	movf	(0+((c:_menu)+012h))^00h,c,w
	btfss	status,2
	goto	u12991
	goto	u12990
u12991:
	goto	l11127
u12990:
	line	477
	
l11113:; BSR set to: 0

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13001
	goto	u13000

u13001:
	goto	l11119
u13000:
	
l11115:; BSR set to: 2

		movlw	2
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u13011
	goto	u13010

u13011:
	goto	l11119
u13010:
	line	478
	
l11117:; BSR set to: 2

	movlw	low(02h)
	movwf	(0+((c:_menu)+012h))^00h,c
	goto	l11155
	line	480
	
l11119:; BSR set to: 2

		movlw	2
	xorwf	(0+((c:_menu)+010h))^00h,c,w
	btfsc	status,2
	goto	u13021
	goto	u13020

u13021:
	goto	l11123
u13020:
	
l11121:; BSR set to: 2

	movlw	high(063h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1186+1))&0ffh
	movlw	low(063h)
	movwf	((_handle_time_rotation$1186))&0ffh
	goto	l11125
	
l11123:; BSR set to: 2

	movlw	high(017h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1186+1))&0ffh
	movlw	low(017h)
	movwf	((_handle_time_rotation$1186))&0ffh
	
l11125:; BSR set to: 0

	movff	(_handle_time_rotation$1186),0+((c:_menu)+012h)
	goto	l11155
	line	484
	
l11127:; BSR set to: 0

	decf	(0+((c:_menu)+012h))^00h,c
	goto	l11155
	line	486
	
l592:; BSR set to: 2

	line	487
	goto	l11155
	line	488
	
l11129:
		decf	(0+((c:_menu)+011h))^00h,c,w
	btfss	status,2
	goto	u13031
	goto	u13030

u13031:
	goto	l11155
u13030:
	line	491
	
l11131:
		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13041
	goto	u13040

u13041:
	goto	l11141
u13040:
	
l11133:; BSR set to: 2

		movlw	2
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u13051
	goto	u13050

u13051:
	goto	l11141
u13050:
	
l11135:; BSR set to: 2

		movlw	2
	xorwf	(0+((c:_menu)+012h))^00h,c,w
	btfss	status,2
	goto	u13061
	goto	u13060

u13061:
	goto	l11141
u13060:
	line	494
	
l11137:; BSR set to: 2

	movlw	low(0)
	movwf	(0+((c:_menu)+013h))^00h,c
	goto	l604
	line	498
	
l11141:; BSR set to: 2

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u13071
	goto	u13070

u13071:
	goto	l11149
u13070:
	line	500
	
l11143:; BSR set to: 0

	incf	(0+((c:_menu)+013h))^00h,c
	line	501
	
l11145:; BSR set to: 0

		movlw	03Ch-1
	cpfsgt	(0+((c:_menu)+013h))^00h,c
	goto	u13081
	goto	u13080

u13081:
	goto	l11155
u13080:
	line	502
	
l11147:; BSR set to: 0

	movlw	low(0)
	movwf	(0+((c:_menu)+013h))^00h,c
	goto	l11155
	line	506
	
l11149:; BSR set to: 0

	movf	(0+((c:_menu)+013h))^00h,c,w
	btfss	status,2
	goto	u13091
	goto	u13090
u13091:
	goto	l11153
u13090:
	line	507
	
l11151:; BSR set to: 0

	movlw	low(03Bh)
	movwf	(0+((c:_menu)+013h))^00h,c
	goto	l11155
	line	509
	
l11153:; BSR set to: 0

	decf	(0+((c:_menu)+013h))^00h,c
	line	513
	
l11155:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_133)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_133)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+((c:_menu)+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+((c:_menu)+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	514
	
l11157:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	515
	
l604:
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
;;		On entry : 3F/1
;;		On exit  : 0/0
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
psect	text13,class=CODE,space=0,reloc=2,group=0
	line	856
global __ptext13
__ptext13:
psect	text13
	file	"src\menu.c"
	line	856
	
_handle_numeric_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_numeric_rotation@direction))&0ffh
	line	858
	
l10979:
		movlw	low(STR_190)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_190)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	861
	
l10981:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_191)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_191)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+((c:_menu)+08h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+((c:_menu)+0Fh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	862
	
l10983:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	865
	
l10985:
	movf	(0+((c:_menu)+0Fh))^00h,c,w
	btfsc	status,2
	goto	u12671
	goto	u12670
u12671:
	goto	l11079
u12670:
	
l10987:
	movf	(0+((c:_menu)+08h))^00h,c,w
	btfss	status,2
	goto	u12681
	goto	u12680
u12681:
	goto	l11079
u12680:
	line	867
	
l10989:
	movlw	low(01h)
	movwf	(0+((c:_menu)+08h))^00h,c
	goto	l11079
	line	873
	
l10991:
	movf	(0+((c:_menu)+0Fh))^00h,c,w
	btfss	status,2
	goto	u12691
	goto	u12690
u12691:
	goto	l777
u12690:
	
l10993:
	movlb	0	; () banked
	movf	((handle_numeric_rotation@direction))&0ffh,w
	btfsc	status,2
	goto	u12701
	goto	u12700
u12701:
	goto	l777
u12700:
	line	875
	
l10995:; BSR set to: 0

	movf	(0+((c:_menu)+09h))^00h,c,w
	btfsc	status,2
	goto	u12711
	goto	u12710
u12711:
	movlw	1
	goto	u12720
u12710:
	movlw	0
u12720:
	movwf	(0+((c:_menu)+09h))^00h,c
	goto	l777
	line	880
	
l10997:
	movlb	0	; () banked
		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12731
	goto	u12730

u12731:
	goto	l11005
u12730:
	line	882
	
l10999:; BSR set to: 0

	incf	(0+((c:_menu)+0Ah))^00h,c
	line	883
	
l11001:; BSR set to: 0

		movlw	06h-1
	cpfsgt	(0+((c:_menu)+0Ah))^00h,c
	goto	u12741
	goto	u12740

u12741:
	goto	l777
u12740:
	line	884
	
l11003:; BSR set to: 0

	movlw	low(0)
	movwf	(0+((c:_menu)+0Ah))^00h,c
	goto	l777
	line	886
	
l11005:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u12750
	goto	u12751

u12751:
	goto	l777
u12750:
	line	888
	
l11007:; BSR set to: 0

	movf	(0+((c:_menu)+0Ah))^00h,c,w
	btfss	status,2
	goto	u12761
	goto	u12760
u12761:
	goto	l11011
u12760:
	line	889
	
l11009:; BSR set to: 0

	movlw	low(05h)
	movwf	(0+((c:_menu)+0Ah))^00h,c
	goto	l777
	line	891
	
l11011:; BSR set to: 0

	decf	(0+((c:_menu)+0Ah))^00h,c
	goto	l777
	line	897
	
l11013:
		movlw	5
	xorwf	(0+((c:_menu)+0Ah))^00h,c,w
	btfsc	status,2
	goto	u12771
	goto	u12770

u12771:
	goto	l11017
u12770:
	
l11015:
	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1317+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1317))&0ffh
	goto	l11019
	
l11017:
	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1317+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1317))&0ffh
	
l11019:; BSR set to: 0

	movff	(_handle_numeric_rotation$1317),(handle_numeric_rotation@max_tens)
	line	898
	
l11021:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12781
	goto	u12780

u12781:
	goto	l11033
u12780:
	line	900
	
l11023:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u12791
	goto	u12790
u12791:
	goto	l11027
u12790:
	goto	l777
	line	902
	
l11027:; BSR set to: 0

	incf	(0+((c:_menu)+0Bh))^00h,c
	line	903
	
l11029:; BSR set to: 0

		movf	(0+((c:_menu)+0Bh))^00h,c,w
	subwf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfsc	status,0
	goto	u12801
	goto	u12800

u12801:
	goto	l777
u12800:
	line	904
	
l11031:; BSR set to: 0

	movlw	low(0)
	movwf	(0+((c:_menu)+0Bh))^00h,c
	goto	l777
	line	906
	
l11033:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u12810
	goto	u12811

u12811:
	goto	l777
u12810:
	line	908
	
l11035:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u12821
	goto	u12820
u12821:
	goto	l11039
u12820:
	goto	l777
	line	910
	
l11039:; BSR set to: 0

	movf	(0+((c:_menu)+0Bh))^00h,c,w
	btfss	status,2
	goto	u12831
	goto	u12830
u12831:
	goto	l11043
u12830:
	line	911
	
l11041:; BSR set to: 0

	movff	(handle_numeric_rotation@max_tens),0+((c:_menu)+0Bh)
	goto	l777
	line	913
	
l11043:; BSR set to: 0

	decf	(0+((c:_menu)+0Bh))^00h,c
	goto	l777
	line	920
	
l11045:
		movlw	5
	xorwf	(0+((c:_menu)+0Ah))^00h,c,w
	btfsc	status,2
	goto	u12841
	goto	u12840

u12841:
	goto	l11049
u12840:
	
l11047:
	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1319+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1319))&0ffh
	goto	l11051
	
l11049:
	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1319+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1319))&0ffh
	
l11051:; BSR set to: 0

	movff	(_handle_numeric_rotation$1319),(handle_numeric_rotation@max_units)
	line	921
	
l11053:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12851
	goto	u12850

u12851:
	goto	l11065
u12850:
	line	923
	
l11055:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u12861
	goto	u12860
u12861:
	goto	l11059
u12860:
	goto	l777
	line	925
	
l11059:; BSR set to: 0

	incf	(0+((c:_menu)+0Ch))^00h,c
	line	926
	
l11061:; BSR set to: 0

		movf	(0+((c:_menu)+0Ch))^00h,c,w
	subwf	((handle_numeric_rotation@max_units))&0ffh,w
	btfsc	status,0
	goto	u12871
	goto	u12870

u12871:
	goto	l777
u12870:
	line	927
	
l11063:; BSR set to: 0

	movlw	low(0)
	movwf	(0+((c:_menu)+0Ch))^00h,c
	goto	l777
	line	929
	
l11065:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u12880
	goto	u12881

u12881:
	goto	l777
u12880:
	line	931
	
l11067:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u12891
	goto	u12890
u12891:
	goto	l11071
u12890:
	goto	l777
	line	933
	
l11071:; BSR set to: 0

	movf	(0+((c:_menu)+0Ch))^00h,c,w
	btfss	status,2
	goto	u12901
	goto	u12900
u12901:
	goto	l11075
u12900:
	line	934
	
l11073:; BSR set to: 0

	movff	(handle_numeric_rotation@max_units),0+((c:_menu)+0Ch)
	goto	l777
	line	936
	
l11075:; BSR set to: 0

	decf	(0+((c:_menu)+0Ch))^00h,c
	goto	l777
	line	870
	
l11079:
	movf	(0+((c:_menu)+08h))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l10991
	xorlw	1^0	; case 1
	skipnz
	goto	l10997
	xorlw	2^1	; case 2
	skipnz
	goto	l11013
	xorlw	3^2	; case 3
	skipnz
	goto	l11045
	goto	l777

	line	941
	
l777:
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
;;		On entry : 0/0
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
psect	text14,class=CODE,space=0,reloc=2,group=0
	line	1631
global __ptext14
__ptext14:
psect	text14
	file	"src\menu.c"
	line	1631
	
_menu_handle_button:
;incstack = 0
	callstack 22
	movlb	1	; () banked
	movwf	((menu_handle_button@press_type))&0ffh
	line	1636
	
l12313:
	movf	(0+((c:_menu)+03h))^00h,c,w
	btfsc	status,2
	goto	u14631
	goto	u14630
u14631:
	goto	l12689
u14630:
	line	1638
	
l12315:
	movlb	1	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u14641
	goto	u14640

u14641:
	goto	l12679
u14640:
	line	1641
	
l12317:; BSR set to: 1

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14651
	goto	u14650

u14651:
	goto	l12423
u14650:
	line	1646
	
l12319:; BSR set to: 2

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_250)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_250)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1647
	
l12321:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1650
	
l12323:
		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1651
	
l12325:; BSR set to: 1

		movlw	low(0)
	movwf	((menu_handle_button@edit_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@edit_flag+1))&0ffh

	line	1653
	
l12327:; BSR set to: 1

	movf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u14661
	goto	u14660
u14661:
	goto	l12337
u14660:
	line	1655
	
l12329:; BSR set to: 1

		movlw	low(_menu_item_options)
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1656
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	movlw	high(_enable_edit_flag)
	movwf	((menu_handle_button@edit_flag+1))&0ffh

	line	1657
	
l12331:; BSR set to: 1

	movff	(_enable_edit_flag),(_system_config)
	line	1658
	
l12333:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_251)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_251)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1659
	
l12335:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1660
	goto	l1068
	line	1661
	
l12337:; BSR set to: 1

		decf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u14671
	goto	u14670

u14671:
	goto	l12347
u14670:
	line	1663
	
l12339:; BSR set to: 1

		movlw	low(_menu_item_options+048h)
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1664
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	1665
	
l12341:; BSR set to: 1

	movff	(c:_relay_high_edit_flag),0+(_system_config+06h)
	line	1666
	
l12343:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_252)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_252)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+06h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	goto	l12335
	line	1669
	
l12347:; BSR set to: 1

		movlw	2
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u14681
	goto	u14680

u14681:
	goto	l12401
u14680:
	line	1672
	
l12349:; BSR set to: 1

	incf	(0+((c:_menu)+011h))^00h,c
	line	1673
	
l12351:; BSR set to: 1

	movlw	low(01h)
	movwf	(0+((c:_menu)+05h))^00h,c
	line	1676
	
l12353:; BSR set to: 1

		decf	(0+((c:_menu)+011h))^00h,c,w
	btfss	status,2
	goto	u14691
	goto	u14690

u14691:
	goto	l12359
u14690:
	
l12355:; BSR set to: 1

		movlw	2
	xorwf	(0+((c:_menu)+012h))^00h,c,w
	btfss	status,2
	goto	u14701
	goto	u14700

u14701:
	goto	l12359
u14700:
	line	1678
	
l12357:; BSR set to: 1

	movlw	low(0)
	movwf	(0+((c:_menu)+013h))^00h,c
	line	1681
	
l12359:; BSR set to: 1

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1683
	
l12361:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_253)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_253)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+((c:_menu)+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1684
	
l12363:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1687
	
l12365:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_254)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_254)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+((c:_menu)+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+((c:_menu)+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1688
	
l12367:
	call	_menu_draw_clock	;wreg free
	line	1690
	
l12369:
		movlw	02h-1
	cpfsgt	(0+((c:_menu)+011h))^00h,c
	goto	u14711
	goto	u14710

u14711:
	goto	l1079
u14710:
	line	1693
	
l12371:
	movf	(0+((c:_menu)+012h))^00h,c,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+((c:_menu)+013h))^00h,c,w
	addwf	(??_menu_handle_button+0+0)^00h,c,w
	movlb	1	; () banked
	movwf	((menu_handle_button@new_value))&0ffh
	movlw	0
	addwfc	(??_menu_handle_button+0+1)^00h,c,w
	movwf	1+((menu_handle_button@new_value))&0ffh
	line	1696
	
l12373:; BSR set to: 1

	movf	((menu_handle_button@new_value))&0ffh,w
iorwf	((menu_handle_button@new_value+1))&0ffh,w
	btfss	status,2
	goto	u14721
	goto	u14720

u14721:
	goto	l12377
u14720:
	line	1697
	
l12375:; BSR set to: 1

	movlw	high(01h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(01h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	1698
	
l12377:; BSR set to: 1

		movf	((menu_handle_button@new_value+1))&0ffh,w
	bnz	u14730
	movlw	121
	subwf	 ((menu_handle_button@new_value))&0ffh,w
	btfss	status,0
	goto	u14731
	goto	u14730

u14731:
	goto	l12381
u14730:
	line	1699
	
l12379:; BSR set to: 1

	movlw	high(078h)
	movwf	((menu_handle_button@new_value+1))&0ffh
	movlw	low(078h)
	movwf	((menu_handle_button@new_value))&0ffh
	line	1701
	
l12381:; BSR set to: 1

	movff	(menu_handle_button@new_value),0+(_system_config+07h)
	line	1704
	
l12383:; BSR set to: 1

		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_255)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_255)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(03Ch)
	movwf	((c:___lbdiv@divisor))^00h,c
	movlb	5	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbdiv
	movwf	(??_menu_handle_button+0+0)^00h,c
	movf	((??_menu_handle_button+0+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	5	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	
	call	___lbmod
	movwf	(??_menu_handle_button+1+0)^00h,c
	movf	((??_menu_handle_button+1+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1705
	
l12385:
		movff	0+(_clock_menu+0Ch),(c:strcpy@to)
	movff	1+(_clock_menu+0Ch),(c:strcpy@to+1)

		movlw	low(_value_relay_pulse)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1707
	
l12387:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_256)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_256)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+07h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1708
	
l12389:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1709
	
l12391:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1710
	
l12393:; BSR set to: 2

	movlw	low(0)
	movwf	(0+((c:_menu)+03h))^00h,c
	line	1711
	
l12395:; BSR set to: 2

	call	_menu_draw_clock	;wreg free
	line	1715
	
l12397:
	movlw	(0)&0ffh
	
	call	_trigger_relay_pulse
	line	1716
	goto	l1079
	line	1717
	
l1073:
	line	1719
	goto	l1079
	line	1724
	
l12401:; BSR set to: 1

		movlw	3
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u14741
	goto	u14740

u14741:
	goto	l1068
u14740:
	line	1726
	
l12403:; BSR set to: 1

		movlw	low(_menu_item_options+03Ch)
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1727
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	1731
	
l1068:
	movlb	1	; () banked
	movf	((menu_handle_button@opts))&0ffh,w
iorwf	((menu_handle_button@opts+1))&0ffh,w
	btfsc	status,2
	goto	u14751
	goto	u14750

u14751:
	goto	l12417
u14750:
	
l12405:; BSR set to: 1

	movf	((menu_handle_button@edit_flag))&0ffh,w
iorwf	((menu_handle_button@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u14761
	goto	u14760

u14761:
	goto	l12417
u14760:
	
l12407:; BSR set to: 1

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
	goto	u14771
	goto	u14770
u14771:
	goto	l12417
u14770:
	line	1733
	
l12409:; BSR set to: 1

	movf	((c:_menu))^00h,c,w
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
	
l12411:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1735
	
l12413:; BSR set to: 2

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_257)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_257)
	movwf	((c:sprintf@f+1))^00h,c

	movf	((c:_menu))^00h,c,w
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
	
l12415:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1739
	
l12417:
	movlw	low(0)
	movwf	(0+((c:_menu)+03h))^00h,c
	line	1740
	
l12419:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1079
	line	1745
	
l12423:; BSR set to: 2

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
	
l12425:; BSR set to: 1

	movff	(menu_handle_button@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_option_field@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u14781
	goto	u14780
u14781:
	goto	l12529
u14780:
	line	1751
	
l12427:
	movff	(menu_handle_button@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_option_edit_flag@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1526)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1526+1)
	line	1752
	movff	(menu_handle_button@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_item_options_for_field@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1527)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1527+1)
	line	1754
	
l12429:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag_1526))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1526+1))&0ffh,w
	btfsc	status,2
	goto	u14791
	goto	u14790

u14791:
	goto	l12417
u14790:
	
l12431:; BSR set to: 1

	movf	((menu_handle_button@opts_1527))&0ffh,w
iorwf	((menu_handle_button@opts_1527+1))&0ffh,w
	btfsc	status,2
	goto	u14801
	goto	u14800

u14801:
	goto	l12417
u14800:
	line	1757
	
l12433:; BSR set to: 1

	movf	((c:_menu))^00h,c,w
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
	
l12435:
	movf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u14811
	goto	u14810
u14811:
	goto	l12439
u14810:
	line	1762
	
l12437:
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(_enable_edit_flag),indf2

	line	1763
	goto	l12523
	line	1764
	
l12439:
		decf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u14821
	goto	u14820

u14821:
	goto	l12451
u14820:
	line	1766
	
l12441:
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(_sensor_edit_flag),indf2

	line	1769
	
l12443:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((_sensor_edit_flag))&0ffh,w
	btfss	status,2
	goto	u14831
	goto	u14830

u14831:
	goto	l12449
u14830:
	
l12445:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfsc	status,2
	goto	u14841
	goto	u14840

u14841:
	goto	l12449
u14840:
	line	1771
	
l12447:; BSR set to: 1

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
	
l12449:
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	1776
	goto	l12523
	line	1777
	
l12451:
		movlw	2
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u14851
	goto	u14850

u14851:
	goto	l12459
u14850:
	
l12453:
		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14861
	goto	u14860

u14861:
	goto	l12459
u14860:
	line	1779
	
l12455:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(_flow_type_edit_flag),indf2

	line	1782
	
l12457:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	1783
	goto	l12523
	line	1784
	
l12459:
		movlw	3
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u14871
	goto	u14870

u14871:
	goto	l12467
u14870:
	
l12461:
		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14881
	goto	u14880

u14881:
	goto	l12467
u14880:
	
l12463:; BSR set to: 1

		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14891
	goto	u14890

u14891:
	goto	l12467
u14890:
	goto	l12523
	line	1787
	
l12465:; BSR set to: 1

	goto	l12523
	line	1788
	
l12467:
		movlw	3
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u14901
	goto	u14900

u14901:
	goto	l12475
u14900:
	
l12469:
		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14911
	goto	u14910

u14911:
	goto	l12475
u14910:
	
l12471:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14921
	goto	u14920
u14921:
	goto	l12475
u14920:
	line	1790
	
l12473:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(_flow_units_edit_flag),indf2

	line	1791
	goto	l12523
	line	1792
	
l12475:
	movlb	1	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14931
	goto	u14930
u14931:
	goto	l12493
u14930:
	line	1794
	
l12477:; BSR set to: 1

		movlw	9
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u14941
	goto	u14940

u14941:
	goto	l12481
u14940:
	line	1795
	
l12479:; BSR set to: 1

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

	goto	l12523
	line	1796
	
l12481:; BSR set to: 1

		movlw	10
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u14951
	goto	u14950

u14951:
	goto	l12485
u14950:
	line	1797
	
l12483:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+039h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+039h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(_relay_plp_edit_flag),indf2

	goto	l12523
	line	1798
	
l12485:; BSR set to: 1

		movlw	11
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u14961
	goto	u14960

u14961:
	goto	l12489
u14960:
	line	1799
	
l12487:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(_relay_slp_edit_flag),indf2

	goto	l12523
	line	1800
	
l12489:; BSR set to: 1

		movlw	12
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u14971
	goto	u14970

u14971:
	goto	l12465
u14970:
	line	1801
	
l12491:; BSR set to: 1

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

	goto	l12523
	line	1803
	
l12493:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14981
	goto	u14980

u14981:
	goto	l12503
u14980:
	line	1805
	
l12495:; BSR set to: 1

		movlw	6
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u14991
	goto	u14990

u14991:
	goto	l12499
u14990:
	goto	l12479
	line	1807
	
l12499:; BSR set to: 1

		movlw	7
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15001
	goto	u15000

u15001:
	goto	l12465
u15000:
	goto	l12491
	line	1810
	
l12503:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15011
	goto	u15010

u15011:
	goto	l12465
u15010:
	line	1812
	
l12505:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u15021
	goto	u15020
u15021:
	goto	l12515
u15020:
	line	1814
	
l12507:; BSR set to: 1

		movlw	8
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15031
	goto	u15030

u15031:
	goto	l12511
u15030:
	line	1815
	
l12509:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Bh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Bh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(_relay_low_edit_flag),indf2

	goto	l12523
	line	1816
	
l12511:; BSR set to: 1

		movlw	9
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15041
	goto	u15040

u15041:
	goto	l12465
u15040:
	goto	l12491
	line	1821
	
l12515:; BSR set to: 1

		movlw	5
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15051
	goto	u15050

u15051:
	goto	l12519
u15050:
	goto	l12509
	line	1823
	
l12519:; BSR set to: 1

		movlw	6
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15061
	goto	u15060

u15061:
	goto	l12465
u15060:
	goto	l12491
	line	1828
	
l12523:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	goto	l12417
	line	1835
	
l12529:
	movff	(menu_handle_button@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_time_field@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u15071
	goto	u15070
u15071:
	goto	l12593
u15070:
	line	1837
	
l12531:
	incf	(0+((c:_menu)+011h))^00h,c
	line	1838
	
l12533:
	movlw	low(01h)
	movwf	(0+((c:_menu)+05h))^00h,c
	line	1839
	
l12535:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1842
	
l12537:
		movlw	low(menu_handle_button@buf_1532)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1532)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_258)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_258)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+((c:_menu)+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1843
	
l12539:
		movlw	low(menu_handle_button@buf_1532)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1532)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1845
	
l12541:
	call	_menu_update_time_value	;wreg free
	line	1847
	
l12543:
		movlw	02h-1
	cpfsgt	(0+((c:_menu)+011h))^00h,c
	goto	u15081
	goto	u15080

u15081:
	goto	l1079
u15080:
	line	1851
	
l12545:
	movf	(0+((c:_menu)+010h))^00h,c,w
	btfss	status,2
	goto	u15091
	goto	u15090
u15091:
	goto	l12549
u15090:
	line	1852
	
l12547:
	movf	(0+((c:_menu)+012h))^00h,c,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+((c:_menu)+013h))^00h,c,w
	addwf	(??_menu_handle_button+0+0)^00h,c,w
	movlb	1	; () banked
	movwf	((menu_handle_button@new_seconds))&0ffh
	movlw	0
	addwfc	(??_menu_handle_button+0+1)^00h,c,w
	movwf	1+((menu_handle_button@new_seconds))&0ffh
	goto	l12551
	line	1854
	
l12549:
	movff	0+((c:_menu)+012h),(c:___wmul@multiplier)
	clrf	((c:___wmul@multiplier+1))^00h,c
	movlw	high(0E10h)
	movwf	((c:___wmul@multiplicand+1))^00h,c
	movlw	low(0E10h)
	movwf	((c:___wmul@multiplicand))^00h,c
	call	___wmul	;wreg free
	movf	(0+((c:_menu)+013h))^00h,c,w
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
	
l12551:; BSR set to: 1

	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15101
	goto	u15100
u15101:
	goto	l12565
u15100:
	line	1859
	
l12553:; BSR set to: 1

		movlw	5
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15111
	goto	u15110

u15111:
	goto	l12557
u15110:
	line	1860
	
l12555:; BSR set to: 1

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
	goto	l12585
	line	1861
	
l12557:; BSR set to: 1

		movlw	7
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15121
	goto	u15120

u15121:
	goto	l12561
u15120:
	line	1862
	
l12559:; BSR set to: 1

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
	goto	l12585
	line	1863
	
l12561:; BSR set to: 1

		movlw	8
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15131
	goto	u15130

u15131:
	goto	l1126
u15130:
	line	1864
	
l12563:; BSR set to: 1

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
	goto	l12585
	line	1865
	
l1126:; BSR set to: 1

	goto	l12585
	line	1866
	
l12565:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15141
	goto	u15140

u15141:
	goto	l12571
u15140:
	line	1868
	
l12567:; BSR set to: 1

		movlw	5
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15151
	goto	u15150

u15151:
	goto	l12585
u15150:
	goto	l12555
	line	1871
	
l12571:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15161
	goto	u15160

u15161:
	goto	l12585
u15160:
	line	1873
	
l12573:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u15171
	goto	u15170
u15171:
	goto	l12579
u15170:
	
l12575:; BSR set to: 1

		movlw	7
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15181
	goto	u15180

u15181:
	goto	l12579
u15180:
	line	1874
	
l12577:; BSR set to: 1

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
	goto	l12585
	line	1875
	
l12579:; BSR set to: 1

		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u15191
	goto	u15190

u15191:
	goto	l12585
u15190:
	
l12581:; BSR set to: 1

		movlw	4
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15201
	goto	u15200

u15201:
	goto	l12585
u15200:
	goto	l12577
	line	1881
	
l12585:
	movf	((c:_menu))^00h,c,w
	mullw	05h
	movlw	low(_input_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:sprintf@sp)
	movff	postdec2,(c:sprintf@sp+1)
		movlw	low(STR_259)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_259)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+((c:_menu)+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+((c:_menu)+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1883
	
l12587:
	movlw	low(0)
	movwf	(0+((c:_menu)+03h))^00h,c
	line	1884
	
l12589:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1885
	
l12591:; BSR set to: 2

		movlw	low(STR_260)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_260)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1079
	line	1889
	
l12593:
	movff	(menu_handle_button@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_numeric_field@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u15211
	goto	u15210
u15211:
	goto	l1073
u15210:
	line	1891
	
l12595:
	incf	(0+((c:_menu)+08h))^00h,c
	line	1892
	
l12597:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1894
	
l12599:
		movlw	2
	xorwf	(0+((c:_menu)+08h))^00h,c,w
	btfss	status,2
	goto	u15221
	goto	u15220

u15221:
	goto	l12605
u15220:
	
l12601:
		movlw	5
	xorwf	(0+((c:_menu)+0Ah))^00h,c,w
	btfss	status,2
	goto	u15231
	goto	u15230

u15231:
	goto	l12605
u15230:
	line	1896
	
l12603:
	movlw	low(0)
	movwf	(0+((c:_menu)+0Bh))^00h,c
	line	1897
	movlw	low(0)
	movwf	(0+((c:_menu)+0Ch))^00h,c
	line	1900
	
l12605:
		movlw	04h-1
	cpfsgt	(0+((c:_menu)+08h))^00h,c
	goto	u15241
	goto	u15240

u15241:
	goto	l1073
u15240:
	line	1902
	
l12607:
	call	_get_current_numeric_value	;wreg free
	movff	0+?_get_current_numeric_value,(menu_handle_button@new_value_1537)
	movff	1+?_get_current_numeric_value,(menu_handle_button@new_value_1537+1)
	line	1905
	
l12609:
	movlb	1	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15251
	goto	u15250
u15251:
	goto	l12633
u15250:
	line	1907
	
l12611:; BSR set to: 1

		movlw	2
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15261
	goto	u15260

u15261:
	goto	l12617
u15260:
	line	1909
	
l12613:; BSR set to: 1

	movlb	2	; () banked
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
	
l12615:; BSR set to: 2

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_261)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_261)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1911
	goto	l12675
	line	1912
	
l12617:; BSR set to: 1

		movlw	3
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15271
	goto	u15270

u15271:
	goto	l12623
u15270:
	line	1914
	
l12619:; BSR set to: 1

	movlb	2	; () banked
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
	
l12621:; BSR set to: 2

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_262)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_262)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1916
	goto	l12675
	line	1917
	
l12623:; BSR set to: 1

		movlw	4
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15281
	goto	u15280

u15281:
	goto	l12629
u15280:
	line	1919
	
l12625:; BSR set to: 1

	movlb	2	; () banked
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
	
l12627:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_263)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_263)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1921
	goto	l12675
	line	1922
	
l12629:; BSR set to: 1

		movlw	6
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15291
	goto	u15290

u15291:
	goto	l1146
u15290:
	line	1925
	
l12631:; BSR set to: 1

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_264)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_264)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l12675
	line	1927
	
l1146:; BSR set to: 1

	goto	l12675
	line	1928
	
l12633:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15301
	goto	u15300

u15301:
	goto	l12653
u15300:
	line	1930
	
l12635:; BSR set to: 1

		movlw	2
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15311
	goto	u15310

u15311:
	goto	l12641
u15310:
	line	1932
	
l12637:; BSR set to: 1

	movlb	2	; () banked
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
	
l12639:; BSR set to: 2

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_265)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_265)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1934
	goto	l12675
	line	1935
	
l12641:; BSR set to: 1

		movlw	3
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15321
	goto	u15320

u15321:
	goto	l12647
u15320:
	line	1937
	
l12643:; BSR set to: 1

	movlb	2	; () banked
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
	
l12645:; BSR set to: 2

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_266)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_266)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1939
	goto	l12675
	line	1940
	
l12647:; BSR set to: 1

		movlw	4
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15331
	goto	u15330

u15331:
	goto	l1146
u15330:
	line	1942
	
l12649:; BSR set to: 1

	movlb	2	; () banked
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
	
l12651:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_267)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_267)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l12675
	line	1946
	
l12653:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u15341
	goto	u15340

u15341:
	goto	l12675
u15340:
	
l12655:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u15351
	goto	u15350
u15351:
	goto	l12675
u15350:
	line	1948
	
l12657:; BSR set to: 1

		movlw	4
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15361
	goto	u15360

u15361:
	goto	l12663
u15360:
	line	1950
	
l12659:; BSR set to: 1

	movlb	2	; () banked
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
	
l12661:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_268)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_268)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1952
	goto	l12675
	line	1953
	
l12663:; BSR set to: 1

		movlw	5
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15371
	goto	u15370

u15371:
	goto	l12669
u15370:
	line	1955
	
l12665:; BSR set to: 1

	movlb	2	; () banked
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
	
l12667:; BSR set to: 2

		movff	0+(_input_menu+01Bh),(c:sprintf@sp)
	movff	1+(_input_menu+01Bh),(c:sprintf@sp+1)

		movlw	low(STR_269)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_269)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1957
	goto	l12675
	line	1958
	
l12669:; BSR set to: 1

		movlw	6
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15381
	goto	u15380

u15381:
	goto	l1146
u15380:
	line	1960
	
l12671:; BSR set to: 1

	movlb	2	; () banked
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
	
l12673:; BSR set to: 2

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_270)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_270)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value_1537),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value_1537+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1965
	
l12675:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1966
	
l12677:; BSR set to: 2

	movlw	low(0)
	movwf	(0+((c:_menu)+03h))^00h,c
	goto	l1079
	line	1970
	
l12679:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u15391
	goto	u15390

u15391:
	goto	l1079
u15390:
	line	1972
	
l12681:; BSR set to: 1

	movlw	low(0)
	movwf	(0+((c:_menu)+03h))^00h,c
	line	1973
	
l12683:; BSR set to: 1

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1974
	
l12685:
	asmopt push
asmopt off
movlw  3
movwf	(??_menu_handle_button+0+0+1)^00h,c
movlw	8
movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	119
u16077:
decfsz	wreg,f
	bra	u16077
	decfsz	(??_menu_handle_button+0+0)^00h,c,f
	bra	u16077
	decfsz	(??_menu_handle_button+0+0+1)^00h,c,f
	bra	u16077
	nop
asmopt pop

	line	1975
	
l12687:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1079
	line	1980
	
l12689:
	movlb	1	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u15401
	goto	u15400

u15401:
	goto	l12961
u15400:
	line	1982
	
l12691:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15411
	goto	u15410
u15411:
	goto	l12711
u15410:
	line	1984
	
l12693:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1986
	goto	l12709
	line	1992
	
l12695:
	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	1993
	movlw	low(0)
	movwf	((c:_menu))^00h,c
	line	1994
	movlw	low(0)
	movwf	(0+((c:_menu)+01h))^00h,c
	line	1995
	movlw	low(05h)
	movwf	(0+((c:_menu)+02h))^00h,c
	line	1996
	
l12697:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	1997
	goto	l1079
	line	2006
	
l12699:
	movlb	2	; () banked
	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u15421
	goto	u15420
u15421:
	goto	l12705
u15420:
	line	2008
	
l12701:; BSR set to: 2

	call	_save_current_config	;wreg free
	line	2009
	
l12703:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	2011
	
l12705:; BSR set to: 2

	setf	((_current_menu))&0ffh
	line	2012
	goto	l1079
	line	1986
	
l12709:
	movf	((c:_menu))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l1073
	xorlw	1^0	; case 1
	skipnz
	goto	l12695
	xorlw	2^1	; case 2
	skipnz
	goto	l1073
	xorlw	3^2	; case 3
	skipnz
	goto	l1073
	xorlw	4^3	; case 4
	skipnz
	goto	l12699
	goto	l1079

	line	2015
	
l12711:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15431
	goto	u15430

u15431:
	goto	l12861
u15430:
	line	2017
	
l12713:; BSR set to: 2

	movf	((c:_menu))^00h,c,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	clrf	(??_menu_handle_button+0+0+1)^00h,c

	movlw	low(-1)
	addwf	(0+((c:_menu)+02h))^00h,c,w
	movwf	(??_menu_handle_button+2+0)^00h,c
	clrf	1+(??_menu_handle_button+2+0)^00h,c
	movlw	high(-1)
	addwfc	1+(??_menu_handle_button+2+0)^00h,c
	movf	(??_menu_handle_button+0+0)^00h,c,w
xorwf	(??_menu_handle_button+2+0)^00h,c,w
	bnz	u15441
movf	(??_menu_handle_button+0+1)^00h,c,w
xorwf	(??_menu_handle_button+2+1)^00h,c,w
	btfss	status,2
	goto	u15441
	goto	u15440

u15441:
	goto	l12727
u15440:
	line	2019
	
l12715:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2020
	
l12717:
	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2021
	
l12719:; BSR set to: 2

	movlw	low(0)
	movwf	((c:_menu))^00h,c
	line	2022
	
l12721:; BSR set to: 2

	movlw	low(0)
	movwf	(0+((c:_menu)+01h))^00h,c
	line	2023
	
l12723:; BSR set to: 2

	movlw	low(05h)
	movwf	(0+((c:_menu)+02h))^00h,c
	goto	l12697
	line	2026
	
l12727:; BSR set to: 2

	movf	((c:_menu))^00h,c,w
	mullw	05h
	movlw	low(_input_menu+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfsc	status,2
	goto	u15451
	goto	u15450
u15451:
	goto	l1079
u15450:
	line	2028
	
l12729:; BSR set to: 2

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
	
l12731:; BSR set to: 1

	movff	(menu_handle_button@sensor_type_1549),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type_1550),(c:is_numeric_field@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u15461
	goto	u15460
u15461:
	goto	l12789
u15460:
	line	2034
	
l12733:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val))&0ffh
	line	2037
	movf	((menu_handle_button@sensor_type_1549))&0ffh,w
	btfss	status,2
	goto	u15471
	goto	u15470
u15471:
	goto	l12751
u15470:
	line	2039
	
l12735:; BSR set to: 1

		movlw	2
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15481
	goto	u15480

u15481:
	goto	l12739
u15480:
	line	2040
	
l12737:; BSR set to: 1

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
	goto	l12781
	line	2041
	
l12739:; BSR set to: 1

		movlw	3
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15491
	goto	u15490

u15491:
	goto	l12743
u15490:
	line	2042
	
l12741:; BSR set to: 1

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
	goto	l12781
	line	2043
	
l12743:; BSR set to: 1

		movlw	4
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15501
	goto	u15500

u15501:
	goto	l12747
u15500:
	line	2044
	
l12745:; BSR set to: 1

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
	goto	l12781
	line	2045
	
l12747:; BSR set to: 1

		movlw	6
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15511
	goto	u15510

u15511:
	goto	l1187
u15510:
	line	2046
	
l12749:; BSR set to: 1

	movlw	high(032h)
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(032h)
	movwf	((menu_handle_button@current_val))&0ffh
	goto	l12781
	line	2047
	
l1187:; BSR set to: 1

	goto	l12781
	line	2048
	
l12751:; BSR set to: 1

		decf	((menu_handle_button@sensor_type_1549))&0ffh,w
	btfss	status,2
	goto	u15521
	goto	u15520

u15521:
	goto	l12765
u15520:
	line	2050
	
l12753:; BSR set to: 1

		movlw	2
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15531
	goto	u15530

u15531:
	goto	l12757
u15530:
	goto	l12737
	line	2052
	
l12757:; BSR set to: 1

		movlw	3
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15541
	goto	u15540

u15541:
	goto	l12761
u15540:
	goto	l12741
	line	2054
	
l12761:; BSR set to: 1

		movlw	4
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15551
	goto	u15550

u15551:
	goto	l1187
u15550:
	goto	l12745
	line	2057
	
l12765:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1549))&0ffh,w
	btfss	status,2
	goto	u15561
	goto	u15560

u15561:
	goto	l12781
u15560:
	
l12767:; BSR set to: 1

	movf	((menu_handle_button@flow_type_1550))&0ffh,w
	btfss	status,2
	goto	u15571
	goto	u15570
u15571:
	goto	l12781
u15570:
	line	2059
	
l12769:; BSR set to: 1

		movlw	4
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15581
	goto	u15580

u15581:
	goto	l12773
u15580:
	goto	l12737
	line	2061
	
l12773:; BSR set to: 1

		movlw	5
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15591
	goto	u15590

u15591:
	goto	l12777
u15590:
	goto	l12741
	line	2063
	
l12777:; BSR set to: 1

		movlw	6
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15601
	goto	u15600

u15601:
	goto	l1187
u15600:
	line	2064
	
l12779:; BSR set to: 1

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
	line	2067
	
l12781:
	movff	(menu_handle_button@current_val),(c:init_numeric_editor@value)
	movff	(menu_handle_button@current_val+1),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	2068
	
l12783:
	movlw	low(01h)
	movwf	(0+((c:_menu)+03h))^00h,c
	line	2069
	
l12785:
	movlw	low(01h)
	movwf	(0+((c:_menu)+05h))^00h,c
	goto	l12419
	line	2073
	
l12789:
	movff	(menu_handle_button@sensor_type_1549),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type_1550),(c:is_time_field@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u15611
	goto	u15610
u15611:
	goto	l12835
u15610:
	line	2075
	
l12791:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val_1553+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val_1553))&0ffh
	line	2078
	movf	((menu_handle_button@sensor_type_1549))&0ffh,w
	btfss	status,2
	goto	u15621
	goto	u15620
u15621:
	goto	l12805
u15620:
	line	2080
	
l12793:; BSR set to: 1

		movlw	5
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15631
	goto	u15630

u15631:
	goto	l12797
u15630:
	line	2081
	
l12795:; BSR set to: 1

	movlb	2	; () banked
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
	goto	l12823
	line	2082
	
l12797:; BSR set to: 1

		movlw	7
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15641
	goto	u15640

u15641:
	goto	l12801
u15640:
	line	2083
	
l12799:; BSR set to: 1

	movlb	2	; () banked
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
	goto	l12823
	line	2084
	
l12801:; BSR set to: 1

		movlw	8
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15651
	goto	u15650

u15651:
	goto	l1209
u15650:
	line	2085
	
l12803:; BSR set to: 1

	movlb	2	; () banked
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
	goto	l12823
	line	2086
	
l1209:; BSR set to: 1

	goto	l12823
	line	2087
	
l12805:; BSR set to: 1

		decf	((menu_handle_button@sensor_type_1549))&0ffh,w
	btfss	status,2
	goto	u15661
	goto	u15660

u15661:
	goto	l12811
u15660:
	line	2089
	
l12807:; BSR set to: 1

		movlw	5
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15671
	goto	u15670

u15671:
	goto	l12823
u15670:
	goto	l12795
	line	2092
	
l12811:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1549))&0ffh,w
	btfss	status,2
	goto	u15681
	goto	u15680

u15681:
	goto	l12823
u15680:
	line	2095
	
l12813:; BSR set to: 1

	movf	((menu_handle_button@flow_type_1550))&0ffh,w
	btfss	status,2
	goto	u15691
	goto	u15690
u15691:
	goto	l12817
u15690:
	
l12815:; BSR set to: 1

		movlw	7
	xorwf	((c:_menu))^00h,c,w
	btfsc	status,2
	goto	u15701
	goto	u15700

u15701:
	goto	l12821
u15700:
	
l12817:; BSR set to: 1

		decf	((menu_handle_button@flow_type_1550))&0ffh,w
	btfss	status,2
	goto	u15711
	goto	u15710

u15711:
	goto	l12823
u15710:
	
l12819:; BSR set to: 1

		movlw	4
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15721
	goto	u15720

u15721:
	goto	l12823
u15720:
	line	2096
	
l12821:; BSR set to: 1

	movlb	2	; () banked
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
	
l12823:
		movlw	low(menu_handle_button@buf_1554)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1554)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_271)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_271)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@current_val_1553),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@current_val_1553+1),1+((c:?_sprintf)+04h)
	movff	(c:_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	2101
	
l12825:
		movlw	low(menu_handle_button@buf_1554)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1554)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2103
	
l12827:
	movff	(menu_handle_button@current_val_1553),(c:init_time_editor@value_seconds)
	movff	(menu_handle_button@current_val_1553+1),(c:init_time_editor@value_seconds+1)
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	goto	l12783
	line	2109
	
l12835:
	movff	(menu_handle_button@sensor_type_1549),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type_1550),(c:is_option_field@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u15731
	goto	u15730
u15731:
	goto	l1073
u15730:
	line	2111
	
l12837:
		movlw	low(_original_value)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_original_value)
	movwf	((c:strcpy@to+1))^00h,c

	movf	((c:_menu))^00h,c,w
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
	
l12839:
	movff	(menu_handle_button@sensor_type_1549),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type_1550),(c:get_option_edit_flag@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1557)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1557+1)
	line	2114
	
l12841:
	movff	(menu_handle_button@sensor_type_1549),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type_1550),(c:get_item_options_for_field@flow_type)
	movf	((c:_menu))^00h,c,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1558)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1558+1)
	line	2116
	
l12843:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag_1557))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1557+1))&0ffh,w
	btfsc	status,2
	goto	u15741
	goto	u15740

u15741:
	goto	l12857
u15740:
	
l12845:; BSR set to: 1

	movf	((menu_handle_button@opts_1558))&0ffh,w
iorwf	((menu_handle_button@opts_1558+1))&0ffh,w
	btfsc	status,2
	goto	u15751
	goto	u15750

u15751:
	goto	l12857
u15750:
	line	2119
	
l12847:; BSR set to: 1

	movlw	low(0)
	movwf	((menu_handle_button@i))&0ffh
	goto	l12855
	line	2121
	
l12849:; BSR set to: 1

	movf	((c:_menu))^00h,c,w
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
	goto	u15761
	goto	u15760

u15761:
	goto	l12853
u15760:
	line	2123
	
l12851:
	movff	(menu_handle_button@edit_flag_1557),fsr2l
	movff	(menu_handle_button@edit_flag_1557+1),fsr2h
	movff	(menu_handle_button@i),indf2

	line	2124
	goto	l12857
	line	2119
	
l12853:
	movlb	1	; () banked
	incf	((menu_handle_button@i))&0ffh
	
l12855:; BSR set to: 1

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
	goto	u15771
	goto	u15770

u15771:
	goto	l12849
u15770:
	line	2129
	
l12857:
	movlw	low(01h)
	movwf	(0+((c:_menu)+03h))^00h,c
	line	2130
	movlw	low(01h)
	movwf	(0+((c:_menu)+05h))^00h,c
	goto	l12419
	line	2135
	
l12861:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15781
	goto	u15780

u15781:
	goto	l12895
u15780:
	line	2137
	
l12863:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2139
	
l12865:
		movlw	4
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15791
	goto	u15790

u15791:
	goto	l12871
u15790:
	line	2141
	
l12867:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2142
	movlw	low(0)
	movwf	((c:_menu))^00h,c
	line	2143
	movlw	low(0)
	movwf	(0+((c:_menu)+01h))^00h,c
	line	2144
	movlw	low(05h)
	movwf	(0+((c:_menu)+02h))^00h,c
	line	2145
	
l12869:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	2146
	goto	l1079
	line	2147
	
l12871:
		movlw	03h-0
	cpfslt	((c:_menu))^00h,c
	goto	u15801
	goto	u15800

u15801:
	goto	l12883
u15800:
	line	2149
	
l12873:
	movf	((c:_menu))^00h,c,w
	
	call	_rebuild_input_menu
	line	2150
	
l12875:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2151
	
l12877:; BSR set to: 2

	movlw	low(0)
	movwf	((c:_menu))^00h,c
	line	2152
	
l12879:; BSR set to: 2

	movlw	low(0)
	movwf	(0+((c:_menu)+01h))^00h,c
	line	2153
	
l12881:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	line	2154
	goto	l1079
	line	2155
	
l12883:
		movlw	3
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15811
	goto	u15810

u15811:
	goto	l1073
u15810:
	line	2157
	
l12885:
	call	_rebuild_clock_menu	;wreg free
	line	2158
	
l12887:
	movlw	low(03h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2159
	
l12889:; BSR set to: 2

	movlw	low(0)
	movwf	((c:_menu))^00h,c
	line	2160
	
l12891:; BSR set to: 2

	movlw	low(0)
	movwf	(0+((c:_menu)+01h))^00h,c
	line	2161
	
l12893:
	call	_menu_draw_clock	;wreg free
	goto	l1079
	line	2164
	
l12895:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15821
	goto	u15820

u15821:
	goto	l1079
u15820:
	line	2168
	
l12897:; BSR set to: 2

		movlw	05h-1
	cpfsgt	((c:_menu))^00h,c
	goto	u15831
	goto	u15830

u15831:
	goto	l12901
u15830:
	
l12899:; BSR set to: 2

	movlw	high(0)
	movlb	1	; () banked
	movwf	((_menu_handle_button$1566+1))&0ffh
	movlw	low(0)
	movwf	((_menu_handle_button$1566))&0ffh
	goto	l12903
	
l12901:; BSR set to: 2

	movf	((c:_menu))^00h,c,w
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
	
l12903:; BSR set to: 1

		movlw	low(menu_handle_button@buf_1564)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1564)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_272)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_272)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu_handle_button$1566),0+((c:?_sprintf)+06h)
	movff	(_menu_handle_button$1566+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	2169
	
l12905:
		movlw	low(menu_handle_button@buf_1564)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1564)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2171
		movlw	4
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15841
	goto	u15840

u15841:
	goto	l12919
u15840:
	goto	l12715
	line	2181
	
l12919:
	movf	((c:_menu))^00h,c,w
	mullw	05h
	movlw	low(_clock_menu+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_clock_menu+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfsc	status,2
	goto	u15851
	goto	u15850
u15851:
	goto	l12959
u15850:
	line	2183
	
l12921:
		movlw	low(STR_273)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_273)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2186
	
l12923:
		movlw	low(_original_value)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_original_value)
	movwf	((c:strcpy@to+1))^00h,c

	movf	((c:_menu))^00h,c,w
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
	
l12925:
	movf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15861
	goto	u15860
u15861:
	goto	l12929
u15860:
	line	2191
	
l12927:
		movff	0+(_clock_menu+02h),(c:strcmp@s1)
	movff	1+(_clock_menu+02h),(c:strcmp@s1+1)

		movlw	low(STR_274)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_274)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u15871
	goto	u15870

u15871:
	movlw	1
	goto	u15880
u15870:
	movlw	0
u15880:
	movlb	1	; () banked
	movwf	((_enable_edit_flag))&0ffh
	line	2192
	goto	l12951
	line	2193
	
l12929:
		decf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15891
	goto	u15890

u15891:
	goto	l12941
u15890:
	line	2195
	
l12931:
		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_275)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_275)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u15901
	goto	u15900

u15901:
	goto	l12935
u15900:
	line	2196
	
l12933:
	movlw	low(0)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l12951
	line	2197
	
l12935:
		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_276)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_276)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u15911
	goto	u15910

u15911:
	goto	l12939
u15910:
	line	2198
	
l12937:
	movlw	low(01h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l12951
	line	2200
	
l12939:
	movlw	low(02h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l12951
	line	2202
	
l12941:
		movlw	2
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15921
	goto	u15920

u15921:
	goto	l12947
u15920:
	line	2205
	
l12943:
	movff	0+(_system_config+07h),0+((c:_menu)+0Dh)
	clrf	(1+((c:_menu)+0Dh))^00h,c
	line	2206
	
l12945:
	movff	0+(_system_config+07h),(c:init_time_editor@value_seconds)
	clrf	((c:init_time_editor@value_seconds+1))^00h,c
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	line	2207
	goto	l12951
	line	2208
	
l12947:
		movlw	3
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u15931
	goto	u15930

u15931:
	goto	l1253
u15930:
	line	2210
	
l12949:
		movff	0+(_clock_menu+011h),(c:strcmp@s1)
	movff	1+(_clock_menu+011h),(c:strcmp@s1+1)

		movlw	low(STR_277)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_277)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u15941
	goto	u15940

u15941:
	movlw	1
	goto	u15950
u15940:
	movlw	0
u15950:
	movwf	((c:_display_edit_flag))^00h,c
	goto	l12951
	line	2213
	
l1253:
	
l12951:
	movlw	low(01h)
	movwf	(0+((c:_menu)+03h))^00h,c
	line	2214
	
l12953:
	movlw	low(01h)
	movwf	(0+((c:_menu)+05h))^00h,c
	line	2215
	
l12955:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l12893
	line	2222
	
l12959:
		movlw	low(STR_278)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_278)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1079
	line	2226
	
l12961:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u15961
	goto	u15960

u15961:
	goto	l1079
u15960:
	goto	l12683
	line	2233
	
l1079:
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
psect	text15,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	119
global __ptext15
__ptext15:
psect	text15
	file	"src\main.c"
	line	119
	
_trigger_relay_pulse:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((trigger_relay_pulse@latch_mode))&0ffh
	line	124
	
l10927:
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
	
l10929:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	127
	
l10931:
	movlb	0	; () banked
	movf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	u12621
	goto	u12620
u12621:
	goto	l150
u12620:
	line	129
	
l10933:; BSR set to: 0

	movlw	low(01h)
	movwf	((_relay_state))&0ffh	;volatile
	line	131
	movf	((trigger_relay_pulse@latch_mode))&0ffh,w
	btfsc	status,2
	goto	u12631
	goto	u12630
u12631:
	goto	l10939
u12630:
	line	134
	
l10935:; BSR set to: 0

	movlw	high(0)
	movlb	2	; () banked
	movwf	((_relay_counter+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_relay_counter))&0ffh	;volatile
	line	135
	
l10937:; BSR set to: 2

		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	136
	goto	l10945
	line	140
	
l10939:; BSR set to: 0

	movlb	5	; () banked
	movf	(0+(_system_config+07h))&0ffh,w
	mullw	064h
	movff	prodl,(_relay_counter)	;volatile
	movff	prodh,(_relay_counter+1)	;volatile
	line	141
	
l10941:; BSR set to: 5

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
	
l10943:
		movlw	low(trigger_relay_pulse@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	145
	
l10945:
	bcf	((c:3979))^0f00h,c,1	;volatile
	line	147
	
l150:
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
;;		On entry : 0/2
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
psect	text16,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	641
global __ptext16
__ptext16:
psect	text16
	file	"src\menu.c"
	line	641
	
_rebuild_input_menu:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((rebuild_input_menu@input_num))&0ffh
	line	644
	
l11439:
	movff	(rebuild_input_menu@input_num),(_current_input)
	line	647
	
l11441:
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
	
l11443:; BSR set to: 0

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
	
l11445:; BSR set to: 0

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
	goto	u13541
	goto	u13540
u13541:
	goto	l11449
u13540:
	
l11447:; BSR set to: 0

		movlw	low(STR_143)
	movwf	((_rebuild_input_menu$1221))&0ffh
	movlw	high(STR_143)
	movwf	((_rebuild_input_menu$1221+1))&0ffh

	goto	l11451
	
l11449:; BSR set to: 0

		movlw	low(STR_142)
	movwf	((_rebuild_input_menu$1221))&0ffh
	movlw	high(STR_142)
	movwf	((_rebuild_input_menu$1221+1))&0ffh

	
l11451:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_141)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_141)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_input_menu$1221),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$1221+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	653
	
l11453:
	movlb	0	; () banked
	movf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u13551
	goto	u13550
u13551:
	goto	l11559
u13550:
	line	655
	
l11455:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_144)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_144)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	656
	
l11457:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_145)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_145)
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
	
l11459:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_146)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_146)
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
	
l11461:
		movlw	low(_value_hi_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_hi_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_147)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_147)
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
	
l11463:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2996)
	movff	1+?___lwdiv,(_rebuild_input_menu$2996+1)
	
l11465:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2997)
	movff	1+?___lwmod,(_rebuild_input_menu$2997+1)
	
l11467:
		movlw	low(_value_highbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_highbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_148)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_148)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2996),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2996+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2997),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2997+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	662
	
l11469:
		movlw	low(_value_low_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_149)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_149)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	high(032h)
	movwf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(032h)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	665
	
l11471:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2996)
	movff	1+?___lwdiv,(_rebuild_input_menu$2996+1)
	
l11473:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2997)
	movff	1+?___lwmod,(_rebuild_input_menu$2997+1)
	
l11475:
		movlw	low(_value_plpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_plpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_150)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_150)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2996),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2996+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2997),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2997+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	668
	
l11477:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2996)
	movff	1+?___lwdiv,(_rebuild_input_menu$2996+1)
	
l11479:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2997)
	movff	1+?___lwmod,(_rebuild_input_menu$2997+1)
	
l11481:
		movlw	low(_value_slpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_slpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_151)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_151)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2996),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2996+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2997),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2997+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	671
	
l11483:
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
	goto	u13561
	goto	u13560
u13561:
	goto	l11491
u13560:
	
l11485:; BSR set to: 0

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
	goto	u13571
	goto	u13570

u13571:
	goto	l11489
u13570:
	
l11487:; BSR set to: 0

		movlw	low(STR_154)
	movwf	((_rebuild_input_menu$1236))&0ffh
	movlw	high(STR_154)
	movwf	((_rebuild_input_menu$1236+1))&0ffh

	goto	l649
	
l11489:; BSR set to: 0

		movlw	low(STR_153)
	movwf	((_rebuild_input_menu$1236))&0ffh
	movlw	high(STR_153)
	movwf	((_rebuild_input_menu$1236+1))&0ffh

	
l649:; BSR set to: 0

		movff	(_rebuild_input_menu$1236),(_rebuild_input_menu$1235)
	movff	(_rebuild_input_menu$1236+1),(_rebuild_input_menu$1235+1)

	goto	l11493
	
l11491:; BSR set to: 0

		movlw	low(STR_152)
	movwf	((_rebuild_input_menu$1235))&0ffh
	movlw	high(STR_152)
	movwf	((_rebuild_input_menu$1235+1))&0ffh

	
l11493:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1235),(c:strcpy@from)
	movff	(_rebuild_input_menu$1235+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	673
	
l11495:
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
	goto	u13581
	goto	u13580
u13581:
	goto	l11503
u13580:
	
l11497:; BSR set to: 0

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
	goto	u13591
	goto	u13590

u13591:
	goto	l11501
u13590:
	
l11499:; BSR set to: 0

		movlw	low(STR_157)
	movwf	((_rebuild_input_menu$1243))&0ffh
	movlw	high(STR_157)
	movwf	((_rebuild_input_menu$1243+1))&0ffh

	goto	l657
	
l11501:; BSR set to: 0

		movlw	low(STR_156)
	movwf	((_rebuild_input_menu$1243))&0ffh
	movlw	high(STR_156)
	movwf	((_rebuild_input_menu$1243+1))&0ffh

	
l657:; BSR set to: 0

		movff	(_rebuild_input_menu$1243),(_rebuild_input_menu$1242)
	movff	(_rebuild_input_menu$1243+1),(_rebuild_input_menu$1242+1)

	goto	l11505
	
l11503:; BSR set to: 0

		movlw	low(STR_155)
	movwf	((_rebuild_input_menu$1242))&0ffh
	movlw	high(STR_155)
	movwf	((_rebuild_input_menu$1242+1))&0ffh

	
l11505:; BSR set to: 0

		movlw	low(_value_rlyplp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyplp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1242),(c:strcpy@from)
	movff	(_rebuild_input_menu$1242+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	675
	
l11507:
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
	goto	u13601
	goto	u13600
u13601:
	goto	l11515
u13600:
	
l11509:; BSR set to: 0

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
	goto	u13611
	goto	u13610

u13611:
	goto	l11513
u13610:
	
l11511:; BSR set to: 0

		movlw	low(STR_160)
	movwf	((_rebuild_input_menu$1250))&0ffh
	movlw	high(STR_160)
	movwf	((_rebuild_input_menu$1250+1))&0ffh

	goto	l665
	
l11513:; BSR set to: 0

		movlw	low(STR_159)
	movwf	((_rebuild_input_menu$1250))&0ffh
	movlw	high(STR_159)
	movwf	((_rebuild_input_menu$1250+1))&0ffh

	
l665:; BSR set to: 0

		movff	(_rebuild_input_menu$1250),(_rebuild_input_menu$1249)
	movff	(_rebuild_input_menu$1250+1),(_rebuild_input_menu$1249+1)

	goto	l11517
	
l11515:; BSR set to: 0

		movlw	low(STR_158)
	movwf	((_rebuild_input_menu$1249))&0ffh
	movlw	high(STR_158)
	movwf	((_rebuild_input_menu$1249+1))&0ffh

	
l11517:; BSR set to: 0

		movlw	low(_value_rlyslp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyslp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1249),(c:strcpy@from)
	movff	(_rebuild_input_menu$1249+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	676
	
l11519:
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
	goto	u13621
	goto	u13620
u13621:
	goto	l11523
u13620:
	
l11521:; BSR set to: 0

		movlw	low(STR_162)
	movwf	((_rebuild_input_menu$1254))&0ffh
	movlw	high(STR_162)
	movwf	((_rebuild_input_menu$1254+1))&0ffh

	goto	l11525
	
l11523:; BSR set to: 0

		movlw	low(STR_161)
	movwf	((_rebuild_input_menu$1254))&0ffh
	movlw	high(STR_161)
	movwf	((_rebuild_input_menu$1254+1))&0ffh

	
l11525:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1254),(c:strcpy@from)
	movff	(_rebuild_input_menu$1254+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	679
	
l11527:
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
	
l11529:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	683
	
l11531:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	684
	
l11533:; BSR set to: 3

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	685
	
l11535:; BSR set to: 3

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	686
	
l11537:; BSR set to: 3

		movlw	low(_value_hi_pressure)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_hi_pressure)
	movwf	(1+(_input_menu+016h))&0ffh

	line	687
	
l11539:; BSR set to: 3

		movlw	low(_value_highbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_highbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	688
	
l11541:; BSR set to: 3

		movlw	low(_value_low_pressure)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_pressure)
	movwf	(1+(_input_menu+020h))&0ffh

	line	689
	
l11543:; BSR set to: 3

		movlw	low(_value_plpbp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_plpbp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	690
	
l11545:; BSR set to: 3

		movlw	low(_value_slpbp)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_slpbp)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	691
	
l11547:; BSR set to: 3

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	692
	
l11549:; BSR set to: 3

		movlw	low(_value_rlyplp)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_rlyplp)
	movwf	(1+(_input_menu+034h))&0ffh

	line	693
	
l11551:; BSR set to: 3

		movlw	low(_value_rlyslp)
	movwf	(0+(_input_menu+039h))&0ffh
	movlw	high(_value_rlyslp)
	movwf	(1+(_input_menu+039h))&0ffh

	line	694
	
l11553:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+03Eh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+03Eh))&0ffh

	line	695
	
l11555:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+043h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+043h))&0ffh

	line	697
	
l11557:; BSR set to: 3

	movlw	low(0Eh)
	movwf	(0+((c:_menu)+02h))^00h,c
	line	698
	goto	l11725
	line	699
	
l11559:; BSR set to: 0

		decf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u13631
	goto	u13630

u13631:
	goto	l11617
u13630:
	line	701
	
l11561:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_163)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_163)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	702
	
l11563:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_164)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_164)
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
	
l11565:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_165)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_165)
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
	
l11567:
		movlw	low(_value_high_temp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_temp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_166)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_166)
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
	
l11569:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2996)
	movff	1+?___lwdiv,(_rebuild_input_menu$2996+1)
	
l11571:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2997)
	movff	1+?___lwmod,(_rebuild_input_menu$2997+1)
	
l11573:
		movlw	low(_value_high_tbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_tbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_167)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_167)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2996),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2996+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2997),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2997+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	709
	
l11575:
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
	goto	u13641
	goto	u13640
u13641:
	goto	l11583
u13640:
	
l11577:; BSR set to: 0

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
	goto	u13651
	goto	u13650

u13651:
	goto	l11581
u13650:
	
l11579:; BSR set to: 0

		movlw	low(STR_170)
	movwf	((_rebuild_input_menu$1269))&0ffh
	movlw	high(STR_170)
	movwf	((_rebuild_input_menu$1269+1))&0ffh

	goto	l679
	
l11581:; BSR set to: 0

		movlw	low(STR_169)
	movwf	((_rebuild_input_menu$1269))&0ffh
	movlw	high(STR_169)
	movwf	((_rebuild_input_menu$1269+1))&0ffh

	
l679:; BSR set to: 0

		movff	(_rebuild_input_menu$1269),(_rebuild_input_menu$1268)
	movff	(_rebuild_input_menu$1269+1),(_rebuild_input_menu$1268+1)

	goto	l11585
	
l11583:; BSR set to: 0

		movlw	low(STR_168)
	movwf	((_rebuild_input_menu$1268))&0ffh
	movlw	high(STR_168)
	movwf	((_rebuild_input_menu$1268+1))&0ffh

	
l11585:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1268),(c:strcpy@from)
	movff	(_rebuild_input_menu$1268+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	710
	
l11587:
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
	goto	u13661
	goto	u13660
u13661:
	goto	l11591
u13660:
	
l11589:; BSR set to: 0

		movlw	low(STR_172)
	movwf	((_rebuild_input_menu$1273))&0ffh
	movlw	high(STR_172)
	movwf	((_rebuild_input_menu$1273+1))&0ffh

	goto	l11593
	
l11591:; BSR set to: 0

		movlw	low(STR_171)
	movwf	((_rebuild_input_menu$1273))&0ffh
	movlw	high(STR_171)
	movwf	((_rebuild_input_menu$1273+1))&0ffh

	
l11593:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1273),(c:strcpy@from)
	movff	(_rebuild_input_menu$1273+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	713
	
l11595:
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
	
l11597:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	717
	
l11599:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	718
	
l11601:; BSR set to: 3

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	719
	
l11603:; BSR set to: 3

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	720
	
l11605:; BSR set to: 3

		movlw	low(_value_high_temp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_high_temp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	721
	
l11607:; BSR set to: 3

		movlw	low(_value_high_tbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_high_tbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	722
	
l11609:; BSR set to: 3

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+020h))&0ffh

	line	723
	
l11611:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+025h))&0ffh

	line	724
	
l11613:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	726
	
l11615:; BSR set to: 3

	movlw	low(09h)
	movwf	(0+((c:_menu)+02h))^00h,c
	line	727
	goto	l11725
	line	728
	
l11617:; BSR set to: 0

		movlw	2
	xorwf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u13671
	goto	u13670

u13671:
	goto	l11725
u13670:
	line	730
	
l11619:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_173)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_173)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	731
	
l11621:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfsc	status,2
	goto	u13681
	goto	u13680
u13681:
	goto	l11625
u13680:
	
l11623:; BSR set to: 0

		movlw	low(STR_175)
	movwf	((_rebuild_input_menu$1278))&0ffh
	movlw	high(STR_175)
	movwf	((_rebuild_input_menu$1278+1))&0ffh

	goto	l11627
	
l11625:; BSR set to: 0

		movlw	low(STR_174)
	movwf	((_rebuild_input_menu$1278))&0ffh
	movlw	high(STR_174)
	movwf	((_rebuild_input_menu$1278+1))&0ffh

	
l11627:; BSR set to: 0

		movlw	low(_value_flow_type)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_type)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1278),(c:strcpy@from)
	movff	(_rebuild_input_menu$1278+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	732
	
l11629:
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
	goto	u13691
	goto	u13690
u13691:
	goto	l11633
u13690:
	
l11631:; BSR set to: 0

		movlw	low(STR_177)
	movwf	((_rebuild_input_menu$1282))&0ffh
	movlw	high(STR_177)
	movwf	((_rebuild_input_menu$1282+1))&0ffh

	goto	l11635
	
l11633:; BSR set to: 0

		movlw	low(STR_176)
	movwf	((_rebuild_input_menu$1282))&0ffh
	movlw	high(STR_176)
	movwf	((_rebuild_input_menu$1282+1))&0ffh

	
l11635:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1282),(c:strcpy@from)
	movff	(_rebuild_input_menu$1282+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	734
	
l11637:
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
	goto	u13701
	goto	u13700
u13701:
	goto	l11645
u13700:
	
l11639:; BSR set to: 0

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
	goto	u13711
	goto	u13710

u13711:
	goto	l11643
u13710:
	
l11641:; BSR set to: 0

		movlw	low(STR_180)
	movwf	((_rebuild_input_menu$1289))&0ffh
	movlw	high(STR_180)
	movwf	((_rebuild_input_menu$1289+1))&0ffh

	goto	l701
	
l11643:; BSR set to: 0

		movlw	low(STR_179)
	movwf	((_rebuild_input_menu$1289))&0ffh
	movlw	high(STR_179)
	movwf	((_rebuild_input_menu$1289+1))&0ffh

	
l701:; BSR set to: 0

		movff	(_rebuild_input_menu$1289),(_rebuild_input_menu$1288)
	movff	(_rebuild_input_menu$1289+1),(_rebuild_input_menu$1288+1)

	goto	l11647
	
l11645:; BSR set to: 0

		movlw	low(STR_178)
	movwf	((_rebuild_input_menu$1288))&0ffh
	movlw	high(STR_178)
	movwf	((_rebuild_input_menu$1288+1))&0ffh

	
l11647:; BSR set to: 0

		movlw	low(_value_rlylow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlylow)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1288),(c:strcpy@from)
	movff	(_rebuild_input_menu$1288+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	736
	
l11649:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfss	status,2
	goto	u13721
	goto	u13720
u13721:
	goto	l11697
u13720:
	line	738
	
l11651:; BSR set to: 0

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
	goto	u13731
	goto	u13730
u13731:
	goto	l11655
u13730:
	
l11653:; BSR set to: 0

		movlw	low(STR_182)
	movwf	((_rebuild_input_menu$1293))&0ffh
	movlw	high(STR_182)
	movwf	((_rebuild_input_menu$1293+1))&0ffh

	goto	l11657
	
l11655:; BSR set to: 0

		movlw	low(STR_181)
	movwf	((_rebuild_input_menu$1293))&0ffh
	movlw	high(STR_181)
	movwf	((_rebuild_input_menu$1293+1))&0ffh

	
l11657:; BSR set to: 0

		movlw	low(_value_flow_units)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_units)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1293),(c:strcpy@from)
	movff	(_rebuild_input_menu$1293+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	739
	
l11659:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_183)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_183)
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
	
l11661:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_184)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_184)
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
	
l11663:
		movlw	low(_value_low_flow)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_185)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_185)
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
	
l11665:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2996)
	movff	1+?___lwdiv,(_rebuild_input_menu$2996+1)
	
l11667:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2997)
	movff	1+?___lwmod,(_rebuild_input_menu$2997+1)
	
l11669:
		movlw	low(_value_low_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_186)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_186)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2996),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2996+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2997),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2997+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	747
	
l11671:
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
	
l11673:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	751
	
l11675:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	752
	
l11677:; BSR set to: 3

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	753
	
l11679:; BSR set to: 3

		movlw	low(_value_flow_units)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_flow_units)
	movwf	(1+(_input_menu+011h))&0ffh

	line	754
	
l11681:; BSR set to: 3

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+016h))&0ffh

	line	755
	
l11683:; BSR set to: 3

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	756
	
l11685:; BSR set to: 3

		movlw	low(_value_low_flow)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_flow)
	movwf	(1+(_input_menu+020h))&0ffh

	line	757
	
l11687:; BSR set to: 3

		movlw	low(_value_low_flow_bp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_low_flow_bp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	758
	
l11689:; BSR set to: 3

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	759
	
l11691:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	760
	
l11693:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+034h))&0ffh

	line	762
	
l11695:; BSR set to: 3

	movlw	low(0Bh)
	movwf	(0+((c:_menu)+02h))^00h,c
	line	763
	goto	l11725
	line	766
	
l11697:; BSR set to: 0

		movlw	low(_value_no_flow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_no_flow)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_187)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_187)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	769
	
l11699:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2996)
	movff	1+?___lwdiv,(_rebuild_input_menu$2996+1)
	
l11701:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2997)
	movff	1+?___lwmod,(_rebuild_input_menu$2997+1)
	
l11703:
		movlw	low(_value_no_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_no_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_188)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_188)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2996),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2996+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2997),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2997+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	772
	
l11705:
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
	
l11707:
		movlw	low(_value_enable)
	movlb	3	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	776
	
l11709:; BSR set to: 3

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	777
	
l11711:; BSR set to: 3

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	778
	
l11713:; BSR set to: 3

		movlw	low(_value_no_flow)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_no_flow)
	movwf	(1+(_input_menu+011h))&0ffh

	line	779
	
l11715:; BSR set to: 3

		movlw	low(_value_no_flow_bp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_no_flow_bp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	780
	
l11717:; BSR set to: 3

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	781
	
l11719:; BSR set to: 3

		movlw	low(_value_display)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+020h))&0ffh

	line	782
	
l11721:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_input_menu+025h))&0ffh

	line	784
	
l11723:; BSR set to: 3

	movlw	low(08h)
	movwf	(0+((c:_menu)+02h))^00h,c
	line	791
	
l11725:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_189)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_189)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(rebuild_input_menu@sensor),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(rebuild_input_menu@flow_type_val),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+((c:_menu)+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	792
	
l11727:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	793
	
l708:
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
;;		On entry : 0/2
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
psect	text17,class=CODE,space=0,reloc=2,group=0
	line	1303
global __ptext17
__ptext17:
psect	text17
	file	"src\menu.c"
	line	1303
	
_rebuild_clock_menu:
;incstack = 0
	callstack 24
	line	1309
	
l11775:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_227)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_227)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_system_config+06h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1310
	
l11777:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1313
	
l11779:
	movlb	5	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u13901
	goto	u13900
u13901:
	goto	l11783
u13900:
	
l11781:; BSR set to: 5

		movlw	low(STR_230)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1441))&0ffh
	movlw	high(STR_230)
	movwf	((_rebuild_clock_menu$1441+1))&0ffh

	goto	l11785
	
l11783:; BSR set to: 5

		movlw	low(STR_229)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1441))&0ffh
	movlw	high(STR_229)
	movwf	((_rebuild_clock_menu$1441+1))&0ffh

	
l11785:; BSR set to: 0

		movlw	low(_value_clock_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_clock_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_228)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_228)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_clock_menu$1441),0+((c:?_sprintf)+04h)
	movff	(_rebuild_clock_menu$1441+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	1315
	
l11787:
	movlb	5	; () banked
	movf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u13911
	goto	u13910
u13911:
	goto	l11795
u13910:
	
l11789:; BSR set to: 5

		decf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u13921
	goto	u13920

u13921:
	goto	l11793
u13920:
	
l11791:; BSR set to: 5

		movlw	low(STR_233)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1448))&0ffh
	movlw	high(STR_233)
	movwf	((_rebuild_clock_menu$1448+1))&0ffh

	goto	l965
	
l11793:; BSR set to: 5

		movlw	low(STR_232)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1448))&0ffh
	movlw	high(STR_232)
	movwf	((_rebuild_clock_menu$1448+1))&0ffh

	
l965:; BSR set to: 0

		movff	(_rebuild_clock_menu$1448),(_rebuild_clock_menu$1447)
	movff	(_rebuild_clock_menu$1448+1),(_rebuild_clock_menu$1447+1)

	goto	l11797
	
l11795:; BSR set to: 5

		movlw	low(STR_231)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1447))&0ffh
	movlw	high(STR_231)
	movwf	((_rebuild_clock_menu$1447+1))&0ffh

	
l11797:; BSR set to: 0

		movlw	low(_value_end_runtime)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_end_runtime)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_clock_menu$1447),(c:strcpy@from)
	movff	(_rebuild_clock_menu$1447+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1320
	
l11799:
		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_234)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_234)
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
	line	1322
	
l11801:
		movlw	low(_value_clock_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_clock_display)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_235)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_235)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1324
	
l11803:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_236)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_236)
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
	
l11805:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1328
	
l11807:
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
	
l11809:
		movlw	low(_value_clock_enable)
	movlb	3	; () banked
	movwf	(0+(_clock_menu+02h))&0ffh
	movlw	high(_value_clock_enable)
	movwf	(1+(_clock_menu+02h))&0ffh

	line	1332
	
l11811:; BSR set to: 3

		movlw	low(_value_end_runtime)
	movwf	(0+(_clock_menu+07h))&0ffh
	movlw	high(_value_end_runtime)
	movwf	(1+(_clock_menu+07h))&0ffh

	line	1333
	
l11813:; BSR set to: 3

		movlw	low(_value_relay_pulse)
	movwf	(0+(_clock_menu+0Ch))&0ffh
	movlw	high(_value_relay_pulse)
	movwf	(1+(_clock_menu+0Ch))&0ffh

	line	1334
	
l11815:; BSR set to: 3

		movlw	low(_value_clock_display)
	movwf	(0+(_clock_menu+011h))&0ffh
	movlw	high(_value_clock_display)
	movwf	(1+(_clock_menu+011h))&0ffh

	line	1335
	
l11817:; BSR set to: 3

		movlw	low(_value_back)
	movwf	(0+(_clock_menu+016h))&0ffh
	movlw	high(_value_back)
	movwf	(1+(_clock_menu+016h))&0ffh

	line	1337
	
l11819:; BSR set to: 3

	movlw	low(05h)
	movwf	(0+((c:_menu)+02h))^00h,c
	line	1339
	
l11821:; BSR set to: 3

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_237)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_237)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+((c:_menu)+02h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1340
	
l11823:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1341
	
l966:
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
psect	text18,class=CODE,space=0,reloc=2,group=0
	line	520
global __ptext18
__ptext18:
psect	text18
	file	"src\menu.c"
	line	520
	
_menu_update_time_value:
;incstack = 0
	callstack 23
	line	522
	
l11159:
	movf	(0+((c:_menu)+03h))^00h,c,w
	btfss	status,2
	goto	u13101
	goto	u13100
u13101:
	goto	l11163
u13100:
	goto	l613
	line	529
	
l11163:
	movf	(0+((c:_menu)+011h))^00h,c,w
	btfss	status,2
	goto	u13111
	goto	u13110
u13111:
	goto	l11169
u13110:
	
l11165:
	movf	(0+((c:_menu)+05h))^00h,c,w
	btfss	status,2
	goto	u13121
	goto	u13120
u13121:
	goto	l11169
u13120:
	line	531
	
l11167:
	movlw	low(020h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	532
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	533
	goto	l11171
	line	536
	
l11169:
	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	(0+((c:_menu)+012h))^00h,c,w
	
	call	___lbdiv
	addlw	low(030h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	537
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movf	(0+((c:_menu)+012h))^00h,c,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	541
	
l11171:; BSR set to: 0

	movlw	low(03Ah)
	movwf	(0+(menu_update_time_value@value_buf+02h))&0ffh
	line	544
	
l11173:; BSR set to: 0

		decf	(0+((c:_menu)+011h))^00h,c,w
	btfss	status,2
	goto	u13131
	goto	u13130

u13131:
	goto	l11179
u13130:
	
l11175:; BSR set to: 0

	movf	(0+((c:_menu)+05h))^00h,c,w
	btfss	status,2
	goto	u13141
	goto	u13140
u13141:
	goto	l11179
u13140:
	line	546
	
l11177:; BSR set to: 0

	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	547
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	548
	goto	l11181
	line	551
	
l11179:; BSR set to: 0

	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	(0+((c:_menu)+013h))^00h,c,w
	
	call	___lbdiv
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	552
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movf	(0+((c:_menu)+013h))^00h,c,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	555
	
l11181:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(menu_update_time_value@value_buf+05h))&0ffh
	line	558
	
l11183:; BSR set to: 0

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13151
	goto	u13150

u13151:
	goto	l11191
u13150:
	
l11185:; BSR set to: 2

		movlw	2
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u13161
	goto	u13160

u13161:
	goto	l11191
u13160:
	line	560
	
l11187:; BSR set to: 2

		movlw	low(_value_relay_pulse)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_relay_pulse)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_134)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_134)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(menu_update_time_value@value_buf)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c

	call	_sprintf	;wreg free
	line	561
	call	_menu_draw_clock	;wreg free
	goto	l613
	line	566
	
l11191:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u13171
	goto	u13170

u13171:
	goto	l11195
u13170:
	goto	l613
	line	570
	
l11195:; BSR set to: 2

	movf	(0+((c:_menu)+01h))^00h,c,w
	subwf	((c:_menu))^00h,c,w
	movlb	0	; () banked
	movwf	((menu_update_time_value@screen_line))&0ffh
	line	571
		movlw	03h-1
	cpfsgt	((menu_update_time_value@screen_line))&0ffh
	goto	u13181
	goto	u13180

u13181:
	goto	l620
u13180:
	goto	l613
	line	572
	
l620:; BSR set to: 0

	line	574
	movff	(c:_menu),(menu_update_time_value@item_idx)
	line	578
	
l11199:; BSR set to: 0

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
	
l11201:; BSR set to: 0

	movff	(menu_update_time_value@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_update_time_value@flow_type),(c:is_time_field@flow_type)
	movf	((menu_update_time_value@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfss	status,2
	goto	u13191
	goto	u13190
u13191:
	goto	l11205
u13190:
	goto	l613
	line	588
	
l11205:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_135)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_135)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+((c:_menu)+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+((c:_menu)+05h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+((c:_menu)+012h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+((c:_menu)+013h),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	call	_sprintf	;wreg free
	line	589
	
l11207:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	593
	
l11209:
		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_136)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_136)
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
	
l11211:
	line	599
	
l11213:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	600
	
l11215:
		movlw	low(STR_137)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_137)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	602
	
l11217:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	603
	
l11219:
		movlw	low(STR_138)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_138)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	604
	
l11221:
		movlw	low(menu_update_time_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	605
	
l11223:
		movlw	low(STR_139)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_139)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	606
	
l613:
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
;;		On entry : 0/1
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
psect	text19,class=CODE,space=0,reloc=2,group=0
	line	1346
global __ptext19
__ptext19:
psect	text19
	file	"src\menu.c"
	line	1346
	
_menu_draw_clock:
;incstack = 0
	callstack 23
	line	1349
	
l10841:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1350
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_238)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_238)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1353
	
l10843:
	movlw	low(0)
	movwf	((c:menu_draw_clock@i))^00h,c
	goto	l10923
	line	1355
	
l10845:
	movf	(0+((c:_menu)+01h))^00h,c,w
	addwf	((c:menu_draw_clock@i))^00h,c,w
	movwf	((c:menu_draw_clock@item_idx))^00h,c
	line	1356
	
l10847:
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1359
	
l10849:
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
	
l10851:
	line	1365
	
l10853:
	movf	((c:menu_draw_clock@item_idx))^00h,c,w
xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u12511
	goto	u12510

u12511:
	goto	l10883
u12510:
	line	1367
	
l10855:
	movf	(0+((c:_menu)+03h))^00h,c,w
	btfsc	status,2
	goto	u12521
	goto	u12520
u12521:
	goto	l10879
u12520:
	line	1369
	
l10857:
	movlw	low(02h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	line	1372
	
l10859:
		movlw	2
	xorwf	((c:menu_draw_clock@item_idx))^00h,c,w
	btfsc	status,2
	goto	u12531
	goto	u12530

u12531:
	goto	l10863
u12530:
	line	1374
	
l10861:
	movf	(0+((c:_menu)+05h))^00h,c,w
	btfsc	status,2
	goto	u12541
	goto	u12540
u12541:
	goto	l10865
u12540:
	line	1377
	
l10863:
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
	goto	l10887
	line	1382
	
l10865:
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
	
l10867:
	movlw	low(0)
	movwf	((c:menu_draw_clock@j))^00h,c
	goto	l10873
	line	1384
	
l10869:
	movf	((c:menu_draw_clock@j))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1383
	
l10871:
	incf	((c:menu_draw_clock@j))^00h,c
	
l10873:
		movf	((c:menu_draw_clock@val_len))^00h,c,w
	subwf	((c:menu_draw_clock@j))^00h,c,w
	btfss	status,0
	goto	u12551
	goto	u12550

u12551:
	goto	l10869
u12550:
	line	1385
	
l10875:
	movf	((c:menu_draw_clock@val_len))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l10887
	line	1397
	
l10879:
	movlw	low(01h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l10863
	line	1404
	
l10883:
	movlw	low(0)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l10863
	line	1409
	
l10887:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_clock@val_len_1464))^00h,c
	line	1411
	
l10889:
	movf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfss	status,2
	goto	u12561
	goto	u12560
u12561:
	goto	l10895
u12560:
	line	1414
	
l10891:
	movf	((c:menu_draw_clock@val_len_1464))^00h,c,w
	btfsc	status,2
	goto	u12571
	goto	u12570
u12571:
	goto	l10921
u12570:
	line	1415
	
l10893:
	movf	((c:menu_draw_clock@val_len_1464))^00h,c,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_print_at
	goto	l10921
	line	1420
	
l10895:
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
	
l10897:
	movf	((c:menu_draw_clock@actual_len))^00h,c,w
	sublw	low(012h)
	movwf	((c:menu_draw_clock@start_pos))^00h,c
	line	1423
	
l10899:
	movff	(c:menu_draw_clock@start_pos),(c:lcd_set_cursor@col)
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1424
	
l10901:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u12581
	goto	u12580

u12581:
	goto	l10905
u12580:
	
l10903:
		movlw	low(STR_240)
	movwf	((c:_menu_draw_clock$1470))^00h,c
	movlw	high(STR_240)
	movwf	((c:_menu_draw_clock$1470+1))^00h,c

	goto	l10907
	
l10905:
		movlw	low(STR_239)
	movwf	((c:_menu_draw_clock$1470))^00h,c
	movlw	high(STR_239)
	movwf	((c:_menu_draw_clock$1470+1))^00h,c

	
l10907:
		movff	(c:_menu_draw_clock$1470),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1470+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1427
	
l10909:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1429
	
l10911:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1430
	
l10913:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u12591
	goto	u12590

u12591:
	goto	l10917
u12590:
	
l10915:
		movlw	low(STR_242)
	movwf	((c:_menu_draw_clock$1474))^00h,c
	movlw	high(STR_242)
	movwf	((c:_menu_draw_clock$1474+1))^00h,c

	goto	l10919
	
l10917:
		movlw	low(STR_241)
	movwf	((c:_menu_draw_clock$1474))^00h,c
	movlw	high(STR_241)
	movwf	((c:_menu_draw_clock$1474+1))^00h,c

	
l10919:
		movff	(c:_menu_draw_clock$1474),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1474+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1353
	
l10921:
	incf	((c:menu_draw_clock@i))^00h,c
	
l10923:
		movlw	03h-0
	cpfslt	((c:menu_draw_clock@i))^00h,c
	goto	u12601
	goto	u12600

u12601:
	goto	l996
u12600:
	
l10925:
	movf	(0+((c:_menu)+02h))^00h,c,w
	movwf	(??_menu_draw_clock+0+0)^00h,c
	clrf	(??_menu_draw_clock+0+0+1)^00h,c

	movf	((c:menu_draw_clock@i))^00h,c,w
	movff	0+((c:_menu)+01h),??_menu_draw_clock+2+0
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
	goto	u12611
	goto	u12610

u12611:
	goto	l10845
u12610:
	line	1433
	
l996:
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
;;		On entry : 3A/5
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
psect	text20,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
global __ptext20
__ptext20:
psect	text20
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
	
___lbmod:
;incstack = 0
	callstack 27
	movwf	((c:___lbmod@dividend))^00h,c
	line	9
	
l7445:
	movlw	low(08h)
	movwf	((c:___lbmod@counter))^00h,c
	line	10
	movlw	low(0)
	movwf	((c:___lbmod@rem))^00h,c
	line	12
	
l7447:
	bcf	status,0
	rlcf	((c:___lbmod@dividend))^00h,c,w
	rlcf	((c:___lbmod@rem))^00h,c,w
	movwf	((c:___lbmod@rem))^00h,c
	line	13
	
l7449:
	bcf status,0
	rlcf	((c:___lbmod@dividend))^00h,c

	line	14
	
l7451:
		movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c,w
	btfss	status,0
	goto	u7701
	goto	u7700

u7701:
	goto	l7455
u7700:
	line	15
	
l7453:
	movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c
	line	16
	
l7455:
	decfsz	((c:___lbmod@counter))^00h,c
	
	goto	l7447
	line	17
	
l7457:
	movf	((c:___lbmod@rem))^00h,c,w
	line	18
	
l2055:
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
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text21,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
global __ptext21
__ptext21:
psect	text21
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
	
___lbdiv:
;incstack = 0
	callstack 27
	movwf	((c:___lbdiv@dividend))^00h,c
	line	9
	
l7419:
	movlw	low(0)
	movwf	((c:___lbdiv@quotient))^00h,c
	line	10
	
l7421:
	movf	((c:___lbdiv@divisor))^00h,c,w
	btfsc	status,2
	goto	u7671
	goto	u7670
u7671:
	goto	l7441
u7670:
	line	11
	
l7423:
	movlw	low(01h)
	movwf	((c:___lbdiv@counter))^00h,c
	line	12
	goto	l7429
	line	13
	
l7425:
	bcf status,0
	rlcf	((c:___lbdiv@divisor))^00h,c

	line	14
	
l7427:
	incf	((c:___lbdiv@counter))^00h,c
	line	12
	
l7429:
	
	btfss	((c:___lbdiv@divisor))^00h,c,(7)&7
	goto	u7681
	goto	u7680
u7681:
	goto	l7425
u7680:
	line	17
	
l7431:
	bcf status,0
	rlcf	((c:___lbdiv@quotient))^00h,c

	line	18
		movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c,w
	btfss	status,0
	goto	u7691
	goto	u7690

u7691:
	goto	l7437
u7690:
	line	19
	
l7433:
	movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c
	line	20
	
l7435:
	bsf	(0+(0/8)+(c:___lbdiv@quotient))^00h,c,(0)&7
	line	22
	
l7437:
	bcf status,0
	rrcf	((c:___lbdiv@divisor))^00h,c

	line	23
	
l7439:
	decfsz	((c:___lbdiv@counter))^00h,c
	
	goto	l7431
	line	25
	
l7441:
	movf	((c:___lbdiv@quotient))^00h,c,w
	line	26
	
l2049:
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
;;  label           2   41[COMRAM] PTR const unsigned char 
;;		 -> STR_215(5), STR_214(6), STR_213(1), STR_212(1), 
;;		 -> STR_211(1), 
;;  sensor_name     2   44[COMRAM] PTR const unsigned char 
;;		 -> Fake(1), STR_218(5), STR_217(5), STR_216(9), 
;;  sensor          1   43[COMRAM] unsigned char 
;;  item_idx        1   46[COMRAM] unsigned char 
;;  i               1   47[COMRAM] unsigned char 
;;  setup_labels   10   25[COMRAM] PTR const unsigned char 
;;		 -> STR_215(5), STR_214(6), STR_213(1), STR_212(1), 
;;		 -> STR_211(1), 
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
psect	text22,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1223
global __ptext22
__ptext22:
psect	text22
	file	"src\menu.c"
	line	1223
	
_menu_draw_setup:
;incstack = 0
	callstack 23
	line	1228
	
l11343:
	call	_lcd_clear	;wreg free
	line	1229
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1230
	
l11345:
		movlw	low(STR_210)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_210)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1233
	
l11347:
	lfsr	2,(menu_draw_setup@F2659)
	lfsr	1,(menu_draw_setup@setup_labels)
	movlw	10-1
u13421:
	movff	plusw2,plusw1
	decf	wreg
	bc	u13421

	line	1236
	
l11349:
	movlw	low(0)
	movwf	((c:menu_draw_setup@i))^00h,c
	line	1238
	
l11355:
	movf	(0+((c:_menu)+01h))^00h,c,w
	addwf	((c:menu_draw_setup@i))^00h,c,w
	movwf	((c:menu_draw_setup@item_idx))^00h,c
	line	1239
		movlw	05h-1
	cpfsgt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u13431
	goto	u13430

u13431:
	goto	l11359
u13430:
	goto	l949
	line	1242
	
l11359:
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1245
	
l11361:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u13441
	goto	u13440

u13441:
	goto	l11395
u13440:
	line	1247
	
l11363:
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
	
l11365:
	movf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u13451
	goto	u13450
u13451:
	goto	l11373
u13450:
	
l11367:
		decf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u13461
	goto	u13460

u13461:
	goto	l11371
u13460:
	
l11369:
		movlw	low(STR_218)
	movwf	((c:_menu_draw_setup$1418))^00h,c
	movlw	high(STR_218)
	movwf	((c:_menu_draw_setup$1418+1))^00h,c

	goto	l932
	
l11371:
		movlw	low(STR_217)
	movwf	((c:_menu_draw_setup$1418))^00h,c
	movlw	high(STR_217)
	movwf	((c:_menu_draw_setup$1418+1))^00h,c

	
l932:
		movff	(c:_menu_draw_setup$1418),(c:menu_draw_setup@sensor_name)
	movff	(c:_menu_draw_setup$1418+1),(c:menu_draw_setup@sensor_name+1)

	goto	l928
	
l11373:
		movlw	low(STR_216)
	movwf	((c:menu_draw_setup@sensor_name))^00h,c
	movlw	high(STR_216)
	movwf	((c:menu_draw_setup@sensor_name+1))^00h,c

	
l928:
	line	1252
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u13471
	goto	u13470

u13471:
	goto	l11383
u13470:
	line	1255
	
l11375:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1256
	
l11377:
		movlw	low(STR_219)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_219)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1257
	
l11379:
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1258
	
l11381:
		movlw	low(STR_220)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_220)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1259
	goto	l11385
	line	1263
	
l11383:
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1267
	
l11385:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1268
	
l11387:
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
	goto	u13481
	goto	u13480
u13481:
	goto	l11391
u13480:
	
l11389:
		movlw	low(STR_222)
	movwf	((c:_menu_draw_setup$1424))^00h,c
	movlw	high(STR_222)
	movwf	((c:_menu_draw_setup$1424+1))^00h,c

	goto	l11393
	
l11391:
		movlw	low(STR_221)
	movwf	((c:_menu_draw_setup$1424))^00h,c
	movlw	high(STR_221)
	movwf	((c:_menu_draw_setup$1424+1))^00h,c

	
l11393:
		movff	(c:_menu_draw_setup$1424),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1424+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1269
	goto	l11421
	line	1273
	
l11395:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_labels)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:menu_draw_setup@label)
	movff	postdec2,(c:menu_draw_setup@label+1)
	line	1275
	
l11397:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u13491
	goto	u13490

u13491:
	goto	l11407
u13490:
	line	1278
	
l11399:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1279
	
l11401:
		movlw	low(STR_223)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_223)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1280
	
l11403:
		movff	(c:menu_draw_setup@label),(c:lcd_print@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1281
	
l11405:
		movlw	low(STR_224)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_224)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1282
	goto	l11409
	line	1286
	
l11407:
	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@label),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1290
	
l11409:
		movlw	3
	xorwf	((c:menu_draw_setup@item_idx))^00h,c,w
	btfss	status,2
	goto	u13501
	goto	u13500

u13501:
	goto	l11421
u13500:
	line	1293
	
l11411:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1294
	
l11413:
	movlb	5	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u13511
	goto	u13510
u13511:
	goto	l11417
u13510:
	
l11415:; BSR set to: 5

		movlw	low(STR_226)
	movwf	((c:_menu_draw_setup$1432))^00h,c
	movlw	high(STR_226)
	movwf	((c:_menu_draw_setup$1432+1))^00h,c

	goto	l11419
	
l11417:; BSR set to: 5

		movlw	low(STR_225)
	movwf	((c:_menu_draw_setup$1432))^00h,c
	movlw	high(STR_225)
	movwf	((c:_menu_draw_setup$1432+1))^00h,c

	
l11419:; BSR set to: 5

		movff	(c:_menu_draw_setup$1432),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1432+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1236
	
l11421:
	incf	((c:menu_draw_setup@i))^00h,c
	
l11423:
		movlw	03h-1
	cpfsgt	((c:menu_draw_setup@i))^00h,c
	goto	u13521
	goto	u13520

u13521:
	goto	l11355
u13520:
	line	1298
	
l949:
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
;;  item_index      1   25[COMRAM] unsigned char 
;;  i               1   26[COMRAM] unsigned char 
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
psect	text23,class=CODE,space=0,reloc=2,group=0
	line	1064
global __ptext23
__ptext23:
psect	text23
	file	"src\menu.c"
	line	1064
	
_menu_draw_options:
;incstack = 0
	callstack 23
	line	1067
	
l10947:; BSR set to: 2

	call	_lcd_clear	;wreg free
	line	1068
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1069
	
l10949:
		movlw	low(STR_200)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_200)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1072
	
l10951:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	line	1074
	
l10957:
	movf	(0+((c:_menu)+01h))^00h,c,w
	addwf	((c:menu_draw_options@i))^00h,c,w
	movwf	((c:menu_draw_options@item_index))^00h,c
	line	1075
		movlw	05h-1
	cpfsgt	((c:menu_draw_options@item_index))^00h,c
	goto	u12641
	goto	u12640

u12641:
	goto	l10961
u12640:
	goto	l873
	line	1078
	
l10961:
	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1081
	
l10963:
	movf	((c:menu_draw_options@item_index))^00h,c,w
xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u12651
	goto	u12650

u12651:
	goto	l10973
u12650:
	line	1083
	
l10965:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1084
	
l10967:
		movlw	low(STR_201)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_201)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1085
	
l10969:
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
	
l10971:
		movlw	low(STR_202)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_202)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1087
	goto	l10975
	line	1091
	
l10973:
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
	
l10975:
	incf	((c:menu_draw_options@i))^00h,c
	
l10977:
		movlw	03h-1
	cpfsgt	((c:menu_draw_options@i))^00h,c
	goto	u12661
	goto	u12660

u12661:
	goto	l10957
u12660:
	line	1094
	
l873:
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
psect	text24,class=CODE,space=0,reloc=2,group=0
	file	"src\lcd.c"
	line	165
global __ptext24
__ptext24:
psect	text24
	file	"src\lcd.c"
	line	165
	
_lcd_clear:
;incstack = 0
	callstack 24
	line	167
	
l10777:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	168
	
l10779:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u16087:
decfsz	wreg,f
	bra	u16087
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u16087
	nop2
asmopt pop

	line	169
	
l1398:
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
psect	text25,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1096
global __ptext25
__ptext25:
psect	text25
	file	"src\menu.c"
	line	1096
	
_menu_draw_input:
;incstack = 0
	callstack 23
	line	1101
	
l11225:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1103
	
l11227:
		movlw	low(menu_draw_input@title)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_203)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_203)
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
	
l11229:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@title)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1107
	
l11231:
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
	
l11233:; BSR set to: 0

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
	
l11235:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@i))&0ffh
	goto	l11339
	line	1113
	
l11237:; BSR set to: 0

	movf	(0+((c:_menu)+01h))^00h,c,w
	addwf	((menu_draw_input@i))&0ffh,w
	movwf	((menu_draw_input@item_idx))&0ffh
	line	1114
	
l11239:; BSR set to: 0

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1117
	
l11241:
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
	
l11243:
	line	1123
	
l11245:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u13201
	goto	u13200

u13201:
	goto	l11295
u13200:
	line	1125
	
l11247:; BSR set to: 0

	movf	(0+((c:_menu)+03h))^00h,c,w
	btfsc	status,2
	goto	u13211
	goto	u13210
u13211:
	goto	l11291
u13210:
	line	1127
	
l11249:; BSR set to: 0

	movlw	low(02h)
	movwf	((menu_draw_input@show_brackets))&0ffh
	line	1130
	
l11251:; BSR set to: 0

	movff	(menu_draw_input@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_option_field@flow_type)
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u13221
	goto	u13220
u13221:
	goto	l11265
u13220:
	line	1132
	
l11253:
	movf	(0+((c:_menu)+05h))^00h,c,w
	btfsc	status,2
	goto	u13231
	goto	u13230
u13231:
	goto	l11267
u13230:
	line	1135
	
l11255:
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
	
l11257:
	movlb	0	; () banked
	movf	((menu_draw_input@opts))&0ffh,w
iorwf	((menu_draw_input@opts+1))&0ffh,w
	btfsc	status,2
	goto	u13241
	goto	u13240

u13241:
	goto	l11265
u13240:
	
l11259:; BSR set to: 0

	movf	((menu_draw_input@flag))&0ffh,w
iorwf	((menu_draw_input@flag+1))&0ffh,w
	btfsc	status,2
	goto	u13251
	goto	u13250

u13251:
	goto	l11265
u13250:
	
l11261:; BSR set to: 0

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
	goto	u13261
	goto	u13260
u13261:
	goto	l11265
u13260:
	line	1140
	
l11263:; BSR set to: 0

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
	goto	l11299
	line	1144
	
l11265:
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
	goto	l11299
	line	1150
	
l11267:
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
	
l11269:
	movlb	0	; () banked
	movf	((menu_draw_input@opts_1380))&0ffh,w
iorwf	((menu_draw_input@opts_1380+1))&0ffh,w
	btfsc	status,2
	goto	u13271
	goto	u13270

u13271:
	goto	l11287
u13270:
	
l11271:; BSR set to: 0

	movf	((menu_draw_input@flag_1384))&0ffh,w
iorwf	((menu_draw_input@flag_1384+1))&0ffh,w
	btfsc	status,2
	goto	u13281
	goto	u13280

u13281:
	goto	l11287
u13280:
	
l11273:; BSR set to: 0

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
	goto	u13291
	goto	u13290
u13291:
	goto	l11287
u13290:
	line	1155
	
l11275:; BSR set to: 0

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
	
l11277:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j))&0ffh
	goto	l11283
	line	1157
	
l11279:; BSR set to: 0

	movf	((menu_draw_input@j))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1156
	
l11281:; BSR set to: 0

	incf	((menu_draw_input@j))&0ffh
	
l11283:; BSR set to: 0

		movf	((menu_draw_input@val_len))&0ffh,w
	subwf	((menu_draw_input@j))&0ffh,w
	btfss	status,0
	goto	u13301
	goto	u13300

u13301:
	goto	l11279
u13300:
	line	1158
	
l11285:; BSR set to: 0

	movf	((menu_draw_input@val_len))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1159
	goto	l11299
	line	1162
	
l11287:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_204)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_204)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l11299
	line	1175
	
l11291:; BSR set to: 0

	movlw	low(01h)
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l11265
	line	1182
	
l11295:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l11265
	line	1187
	
l11299:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_1388))&0ffh
	line	1188
	
l11301:; BSR set to: 0

	movf	((menu_draw_input@val_len_1388))&0ffh,w
	btfsc	status,2
	goto	u13311
	goto	u13310
u13311:
	goto	l11337
u13310:
	
l11303:; BSR set to: 0

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
		movlw	low(STR_205)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_205)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u13321
	goto	u13320

u13321:
	goto	l11337
u13320:
	line	1191
	
l11305:
	movf	(0+((c:_menu)+03h))^00h,c,w
	btfsc	status,2
	goto	u13331
	goto	u13330
u13331:
	goto	l11313
u13330:
	
l11307:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u13341
	goto	u13340

u13341:
	goto	l11313
u13340:
	line	1194
	
l11309:; BSR set to: 0

	movff	(menu_draw_input@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_numeric_field@flow_type)
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u13351
	goto	u13350
u13351:
	goto	l11337
u13350:
	
l11311:
	movff	(menu_draw_input@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_time_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u13361
	goto	u13360
u13361:
	goto	l11313
u13360:
	goto	l11337
	line	1201
	
l11313:
	movlb	0	; () banked
	movf	((menu_draw_input@show_brackets))&0ffh,w
	btfss	status,2
	goto	u13371
	goto	u13370
u13371:
	goto	l11317
u13370:
	line	1204
	
l11315:; BSR set to: 0

	movf	((menu_draw_input@val_len_1388))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	1205
	goto	l11337
	line	1209
	
l11317:; BSR set to: 0

	movf	((menu_draw_input@val_len_1388))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_input@start_pos))&0ffh
	line	1210
	
l11319:; BSR set to: 0

	movff	(menu_draw_input@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1213
	
l11321:
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u13381
	goto	u13380

u13381:
	goto	l11325
u13380:
	
l11323:; BSR set to: 0

		movlw	low(STR_207)
	movwf	((_menu_draw_input$1394))&0ffh
	movlw	high(STR_207)
	movwf	((_menu_draw_input$1394+1))&0ffh

	goto	l11327
	
l11325:; BSR set to: 0

		movlw	low(STR_206)
	movwf	((_menu_draw_input$1394))&0ffh
	movlw	high(STR_206)
	movwf	((_menu_draw_input$1394+1))&0ffh

	
l11327:; BSR set to: 0

		movff	(_menu_draw_input$1394),(c:lcd_print@str)
	movff	(_menu_draw_input$1394+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1215
	
l11329:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1217
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u13391
	goto	u13390

u13391:
	goto	l11333
u13390:
	
l11331:; BSR set to: 0

		movlw	low(STR_209)
	movwf	((_menu_draw_input$1398))&0ffh
	movlw	high(STR_209)
	movwf	((_menu_draw_input$1398+1))&0ffh

	goto	l11335
	
l11333:; BSR set to: 0

		movlw	low(STR_208)
	movwf	((_menu_draw_input$1398))&0ffh
	movlw	high(STR_208)
	movwf	((_menu_draw_input$1398+1))&0ffh

	
l11335:; BSR set to: 0

		movff	(_menu_draw_input$1398),(c:lcd_print@str)
	movff	(_menu_draw_input$1398+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1111
	
l11337:
	movlb	0	; () banked
	incf	((menu_draw_input@i))&0ffh
	
l11339:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_input@i))&0ffh
	goto	u13401
	goto	u13400

u13401:
	goto	l914
u13400:
	
l11341:; BSR set to: 0

	movf	(0+((c:_menu)+02h))^00h,c,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	clrf	(??_menu_draw_input+0+0+1)^00h,c

	movf	((menu_draw_input@i))&0ffh,w
	movff	0+((c:_menu)+01h),??_menu_draw_input+2+0
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
	goto	u13411
	goto	u13410

u13411:
	goto	l11237
u13410:
	line	1221
	
l914:; BSR set to: 0

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
;;		 -> value_enable(10), value_relay_pulse(10), NULL(0), STR_77(1), 
;;		 -> STR_76(1), STR_75(9), STR_74(6), STR_73(6), 
;;		 -> STR_72(1), STR_71(1), STR_70(1), STR_69(5), 
;;		 -> STR_68(5), STR_67(1), STR_66(1), STR_65(1), 
;;		 -> STR_64(4), STR_63(2), STR_62(1), STR_61(1), 
;;		 -> STR_60(1), STR_59(5), STR_58(4), STR_57(1), 
;;		 -> STR_56(1), STR_55(1), STR_54(8), STR_53(7), 
;;		 -> STR_52(1), STR_51(1), STR_50(5), STR_49(5), 
;;		 -> STR_48(9), STR_47(1), STR_46(1), STR_45(1), 
;;		 -> STR_44(8), STR_43(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   16[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_clock@value_buf(15), value_clock_display(10), value_end_runtime(10), value_clock_enable(10), 
;;		 -> menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), value_rlylow(10), 
;;		 -> value_flow_type(10), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), value_relay_pulse(10), NULL(0), STR_77(1), 
;;		 -> STR_76(1), STR_75(9), STR_74(6), STR_73(6), 
;;		 -> STR_72(1), STR_71(1), STR_70(1), STR_69(5), 
;;		 -> STR_68(5), STR_67(1), STR_66(1), STR_65(1), 
;;		 -> STR_64(4), STR_63(2), STR_62(1), STR_61(1), 
;;		 -> STR_60(1), STR_59(5), STR_58(4), STR_57(1), 
;;		 -> STR_56(1), STR_55(1), STR_54(8), STR_53(7), 
;;		 -> STR_52(1), STR_51(1), STR_50(5), STR_49(5), 
;;		 -> STR_48(9), STR_47(1), STR_46(1), STR_45(1), 
;;		 -> STR_44(8), STR_43(9), 
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
psect	text26,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
global __ptext26
__ptext26:
psect	text26
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
	
_strlen:; BSR set to: 0

;incstack = 0
	callstack 26
	line	8
	
l10495:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l10499
	line	10
	
l10497:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l10499:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11947
	tblrd	*
	
	movf	tablat,w
	bra	u11940
u11947:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11940:
	iorlw	0
	btfss	status,2
	goto	u11951
	goto	u11950
u11951:
	goto	l10497
u11950:
	line	12
	
l10501:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l2345:
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
;;		 -> STR_235(5), value_clock_display(10), STR_233(9), STR_232(6), 
;;		 -> STR_231(6), value_end_runtime(10), value_clock_enable(10), STR_204(6), 
;;		 -> menu_update_edit_value@value_buf(10), value_no_flow_bp(10), STR_187(4), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), STR_182(4), STR_181(2), 
;;		 -> value_flow_units(10), STR_180(9), STR_179(6), STR_178(6), 
;;		 -> value_rlylow(10), STR_177(5), STR_176(5), STR_175(8), 
;;		 -> STR_174(7), value_flow_type(10), STR_173(5), STR_172(5), 
;;		 -> STR_171(5), STR_170(9), STR_169(6), STR_168(6), 
;;		 -> value_high_tbp(10), value_high_temp(10), STR_163(5), value_back(5), 
;;		 -> STR_162(5), STR_161(5), value_display(10), STR_160(9), 
;;		 -> STR_159(6), STR_158(6), value_rlyslp(10), STR_157(9), 
;;		 -> STR_156(6), STR_155(6), value_rlyplp(10), STR_154(9), 
;;		 -> STR_153(6), STR_152(6), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), STR_144(9), value_sensor(12), 
;;		 -> value_enable(10), value_relay_pulse(10), NULL(0), STR_77(1), 
;;		 -> STR_76(1), STR_75(9), STR_74(6), STR_73(6), 
;;		 -> STR_72(1), STR_71(1), STR_70(1), STR_69(5), 
;;		 -> STR_68(5), STR_67(1), STR_66(1), STR_65(1), 
;;		 -> STR_64(4), STR_63(2), STR_62(1), STR_61(1), 
;;		 -> STR_60(1), STR_59(5), STR_58(4), STR_57(1), 
;;		 -> STR_56(1), STR_55(1), STR_54(8), STR_53(7), 
;;		 -> STR_52(1), STR_51(1), STR_50(5), STR_49(5), 
;;		 -> STR_48(9), STR_47(1), STR_46(1), STR_45(1), 
;;		 -> STR_44(8), STR_43(9), 
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
;;		On entry : 0/0
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
psect	text27,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
global __ptext27
__ptext27:
psect	text27
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
	
_strcpy:
;incstack = 0
	callstack 26
	line	18
	
l10489:
		movff	(c:strcpy@to),(c:strcpy@cp)
	movff	(c:strcpy@to+1),(c:strcpy@cp+1)

	line	19
	goto	l10493
	line	20
	
l10491:
	infsnz	((c:strcpy@cp))^00h,c
	incf	((c:strcpy@cp+1))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l10493:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movff	(c:strcpy@cp),fsr2l
	movff	(c:strcpy@cp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11927
	tblrd	*
	
	movf	tablat,w
	bra	u11920
u11927:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11920:
	movwf	indf2
	movf	indf2,w
	btfss	status,2
	goto	u11931
	goto	u11930
u11931:
	goto	l10491
u11930:
	line	24
	
l2339:
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
;;		 -> STR_277(5), STR_276(6), STR_275(6), STR_274(8), 
;;		 -> STR_205(1), STR_77(1), STR_76(1), STR_75(9), 
;;		 -> STR_74(6), STR_73(6), STR_72(1), STR_71(1), 
;;		 -> STR_70(1), STR_69(5), STR_68(5), STR_67(1), 
;;		 -> STR_66(1), STR_65(1), STR_64(4), STR_63(2), 
;;		 -> STR_62(1), STR_61(1), STR_60(1), STR_59(5), 
;;		 -> STR_58(4), STR_57(1), STR_56(1), STR_55(1), 
;;		 -> STR_54(8), STR_53(7), STR_52(1), STR_51(1), 
;;		 -> STR_50(5), STR_49(5), STR_48(9), STR_47(1), 
;;		 -> STR_46(1), STR_45(1), STR_44(8), STR_43(9), 
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
psect	text28,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
global __ptext28
__ptext28:
psect	text28
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
	
_strcmp:
;incstack = 0
	callstack 26
	line	37
	
l7311:
	goto	l7315
	line	38
	
l7313:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l7315:
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
	goto	u7531
	goto	u7530
u7531:
	goto	l7319
u7530:
	
l7317:
	movff	(c:strcmp@s1),fsr2l
	movff	(c:strcmp@s1+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u7541
	goto	u7540
u7541:
	goto	l7313
u7540:
	line	41
	
l7319:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l2333:
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
;;  col             1   21[COMRAM] unsigned char 
;;  str             2   22[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_clock@value_buf(15), STR_238(6), Fake(1), STR_218(5), 
;;		 -> STR_217(5), STR_216(9), STR_215(5), STR_214(6), 
;;		 -> STR_213(1), STR_212(1), STR_211(1), menu_draw_input@value_buf(15), 
;;		 -> menu_draw_input@title(10), STR_129(5), STR_128(8), STR_127(10), 
;;		 -> STR_126(8), STR_125(7), STR_124(5), STR_123(8), 
;;		 -> STR_122(8), STR_121(12), STR_120(9), STR_119(11), 
;;		 -> STR_118(10), STR_117(6), STR_116(5), STR_115(7), 
;;		 -> STR_114(7), STR_113(5), STR_112(8), STR_111(8), 
;;		 -> STR_110(11), STR_109(8), STR_108(5), STR_107(7), 
;;		 -> STR_106(7), STR_105(5), STR_104(8), STR_103(9), 
;;		 -> STR_102(9), STR_101(10), STR_100(11), STR_99(10), 
;;		 -> STR_98(7), STR_97(7), STR_96(5), STR_95(8), 
;;		 -> STR_94(8), STR_93(8), STR_92(9), STR_91(6), 
;;		 -> STR_90(6), STR_89(13), STR_88(9), STR_87(12), 
;;		 -> STR_86(11), STR_85(10), STR_84(7), STR_83(7), 
;;		 -> STR_82(5), STR_81(6), STR_80(13), STR_79(11), 
;;		 -> STR_78(10), 
;; Auto vars:     Size  Location     Type
;;  row             1   24[COMRAM] unsigned char 
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
;;		_menu_draw_clock
;; This function uses a non-reentrant model
;;
psect	text29,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	612
global __ptext29
__ptext29:
psect	text29
	file	"src\menu.c"
	line	612
	
_lcd_print_at:
;incstack = 0
	callstack 23
	movwf	((c:lcd_print_at@row))^00h,c
	line	614
	
l10481:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	615
	
l10483:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	616
	
l626:
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
;;  row             1   21[COMRAM] unsigned char 
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
;;		_menu_draw_clock
;; This function uses a non-reentrant model
;;
psect	text30,class=CODE,space=0,reloc=2,group=0
	line	618
global __ptext30
__ptext30:
psect	text30
	file	"src\menu.c"
	line	618
	
_lcd_clear_line:
;incstack = 0
	callstack 23
	movwf	((c:lcd_clear_line@row))^00h,c
	line	620
	
l10485:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	621
	
l10487:
		movlw	low(STR_140)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_140)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	622
	
l629:
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
;; This function uses a non-reentrant model
;;
psect	text31,class=CODE,space=0,reloc=2,group=0
	file	"src\lcd.c"
	line	129
global __ptext31
__ptext31:
psect	text31
	file	"src\lcd.c"
	line	129
	
_lcd_set_cursor:
;incstack = 0
	callstack 24
	movwf	((c:lcd_set_cursor@row))^00h,c
	line	133
	
l10457:
	goto	l10469
	line	135
	
l1383:
	line	136
	movff	(c:lcd_set_cursor@col),(c:lcd_set_cursor@addr)
	line	137
	goto	l10471
	line	139
	
l10459:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(040h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	140
	goto	l10471
	line	142
	
l10461:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(094h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	143
	goto	l10471
	line	145
	
l10463:
	movf	((c:lcd_set_cursor@col))^00h,c,w
	addlw	low(0D4h)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	146
	goto	l10471
	line	148
	
l10465:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@addr))^00h,c
	line	149
	goto	l10471
	line	133
	
l10469:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l1383
	xorlw	1^0	; case 1
	skipnz
	goto	l10459
	xorlw	2^1	; case 2
	skipnz
	goto	l10461
	xorlw	3^2	; case 3
	skipnz
	goto	l10463
	goto	l10465

	line	152
	
l10471:
	movf	((c:lcd_set_cursor@addr))^00h,c,w
	iorlw	low(080h)
	
	call	_lcd_cmd
	line	153
	
l1389:
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
;;		 -> STR_242(2), STR_241(2), STR_240(2), STR_239(2), 
;;		 -> menu_draw_clock@value_buf(15), STR_238(6), STR_226(2), STR_225(2), 
;;		 -> STR_224(2), STR_223(2), STR_222(2), STR_221(2), 
;;		 -> STR_220(2), STR_219(2), Fake(1), STR_218(5), 
;;		 -> STR_217(5), STR_216(9), STR_215(5), STR_214(6), 
;;		 -> STR_213(1), STR_212(1), STR_211(1), STR_210(21), 
;;		 -> STR_209(2), STR_208(2), STR_207(2), STR_206(2), 
;;		 -> menu_draw_input@value_buf(15), menu_draw_input@title(10), STR_202(2), STR_201(2), 
;;		 -> STR_200(21), STR_199(2), STR_198(2), STR_197(6), 
;;		 -> menu_update_numeric_value@value_buf(6), STR_196(2), STR_195(2), STR_194(7), 
;;		 -> menu_update_edit_value@display_buf(10), STR_140(21), STR_139(2), STR_138(2), 
;;		 -> STR_137(8), menu_update_time_value@value_buf(6), STR_129(5), STR_128(8), 
;;		 -> STR_127(10), STR_126(8), STR_125(7), STR_124(5), 
;;		 -> STR_123(8), STR_122(8), STR_121(12), STR_120(9), 
;;		 -> STR_119(11), STR_118(10), STR_117(6), STR_116(5), 
;;		 -> STR_115(7), STR_114(7), STR_113(5), STR_112(8), 
;;		 -> STR_111(8), STR_110(11), STR_109(8), STR_108(5), 
;;		 -> STR_107(7), STR_106(7), STR_105(5), STR_104(8), 
;;		 -> STR_103(9), STR_102(9), STR_101(10), STR_100(11), 
;;		 -> STR_99(10), STR_98(7), STR_97(7), STR_96(5), 
;;		 -> STR_95(8), STR_94(8), STR_93(8), STR_92(9), 
;;		 -> STR_91(6), STR_90(6), STR_89(13), STR_88(9), 
;;		 -> STR_87(12), STR_86(11), STR_85(10), STR_84(7), 
;;		 -> STR_83(7), STR_82(5), STR_81(6), STR_80(13), 
;;		 -> STR_79(11), STR_78(10), STR_39(8), STR_38(12), 
;;		 -> STR_33(6), STR_32(12), main@lcd_buf(17), STR_16(16), 
;;		 -> STR_15(13), 
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
;; This function uses a non-reentrant model
;;
psect	text32,class=CODE,space=0,reloc=2,group=0
	line	156
global __ptext32
__ptext32:
psect	text32
	file	"src\lcd.c"
	line	156
	
_lcd_print:
;incstack = 0
	callstack 23
	line	158
	
l10473:
	goto	l10479
	line	160
	
l10475:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11897
	tblrd	*
	
	movf	tablat,w
	bra	u11890
u11897:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11890:
	
	call	_lcd_data
	
l10477:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	158
	
l10479:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11907
	tblrd	*
	
	movf	tablat,w
	bra	u11900
u11907:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11900:
	iorlw	0
	btfss	status,2
	goto	u11911
	goto	u11910
u11911:
	goto	l10475
u11910:
	line	162
	
l1395:
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
psect	text33,class=CODE,space=0,reloc=2,group=0
	line	48
global __ptext33
__ptext33:
psect	text33
	file	"src\lcd.c"
	line	48
	
_lcd_data:
;incstack = 0
	callstack 23
	movwf	((c:lcd_data@data))^00h,c
	line	51
	
l10431:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	52
	
l10433:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	53
	
l10435:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	54
	
l10437:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	55
	
l10439:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	56
	
l10441:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	57
	
l10443:
	asmopt push
asmopt off
	movlw	133
u16097:
decfsz	wreg,f
	bra	u16097
	nop
asmopt pop

	line	60
	
l10445:
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	61
	
l10447:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	62
	
l10449:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	63
	
l10451:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	64
	
l10453:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	65
	
l10455:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	66
	asmopt push
asmopt off
	movlw	133
u16107:
decfsz	wreg,f
	bra	u16107
	nop
asmopt pop

	line	67
	
l1376:
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
;;		On entry : 0/1
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
psect	text34,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	229
global __ptext34
__ptext34:
psect	text34
	file	"src\menu.c"
	line	229
	
_is_time_field:
;incstack = 0
	callstack 27
	movwf	((c:is_time_field@line))^00h,c
	line	231
	
l6897:
	movf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6701
	goto	u6700
u6701:
	goto	l6913
u6700:
	line	234
	
l6899:
	movlw	low(01h)
	movwf	((c:_is_time_field$1153))^00h,c
	
l6901:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6711
	goto	u6710

u6711:
	goto	l499
u6710:
	
l6903:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6721
	goto	u6720

u6721:
	goto	l499
u6720:
	
l6905:
		movlw	8
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6731
	goto	u6730

u6731:
	goto	l499
u6730:
	
l6907:
	movlw	low(0)
	movwf	((c:_is_time_field$1153))^00h,c
	
l499:
	movf	((c:_is_time_field$1153))^00h,c,w
	goto	l500
	line	236
	
l6913:
		decf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6741
	goto	u6740

u6741:
	goto	l6921
u6740:
	line	239
	
l6915:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6751
	goto	u6750

u6751:
	movlw	1
	goto	u6760
u6750:
	movlw	0
u6760:
	goto	l500
	line	241
	
l6921:
		movlw	2
	xorwf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6771
	goto	u6770

u6771:
	goto	l6935
u6770:
	line	243
	
l6923:
	movf	((c:is_time_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u6781
	goto	u6780
u6781:
	goto	l6931
u6780:
	line	246
	
l6925:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6791
	goto	u6790

u6791:
	movlw	1
	goto	u6800
u6790:
	movlw	0
u6800:
	goto	l500
	line	251
	
l6931:
		movlw	4
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6811
	goto	u6810

u6811:
	movlw	1
	goto	u6820
u6810:
	movlw	0
u6820:
	goto	l500
	line	255
	
l6935:
	movlw	(0)&0ffh
	line	256
	
l500:
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
;;		On entry : 0/1
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
psect	text35,class=CODE,space=0,reloc=2,group=0
	line	261
global __ptext35
__ptext35:
psect	text35
	file	"src\menu.c"
	line	261
	
_is_option_field:
;incstack = 0
	callstack 26
	movwf	((c:is_option_field@line))^00h,c
	line	264
	
l7025:
	movf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6941
	goto	u6940
u6941:
	goto	l7029
u6940:
	
l7027:
		decf	((c:is_option_field@line))^00h,c,w
	btfss	status,2
	goto	u6951
	goto	u6950

u6951:
	goto	l7033
u6950:
	line	265
	
l7029:
	movlw	(01h)&0ffh
	goto	l512
	line	267
	
l7033:
	movf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6961
	goto	u6960
u6961:
	goto	l7051
u6960:
	line	270
	
l7035:
	movlw	low(01h)
	movwf	((c:_is_option_field$1158))^00h,c
	
l7037:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6971
	goto	u6970

u6971:
	goto	l515
u6970:
	
l7039:
		movlw	10
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6981
	goto	u6980

u6981:
	goto	l515
u6980:
	
l7041:
		movlw	11
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6991
	goto	u6990

u6991:
	goto	l515
u6990:
	
l7043:
		movlw	12
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7001
	goto	u7000

u7001:
	goto	l515
u7000:
	
l7045:
	movlw	low(0)
	movwf	((c:_is_option_field$1158))^00h,c
	
l515:
	movf	((c:_is_option_field$1158))^00h,c,w
	goto	l512
	line	272
	
l7051:
		decf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7011
	goto	u7010

u7011:
	goto	l7065
u7010:
	line	275
	
l7053:
	movlw	low(01h)
	movwf	((c:_is_option_field$1159))^00h,c
	
l7055:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7021
	goto	u7020

u7021:
	goto	l519
u7020:
	
l7057:
		movlw	7
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7031
	goto	u7030

u7031:
	goto	l519
u7030:
	
l7059:
	movlw	low(0)
	movwf	((c:_is_option_field$1159))^00h,c
	
l519:
	movf	((c:_is_option_field$1159))^00h,c,w
	goto	l512
	line	277
	
l7065:
		movlw	2
	xorwf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7041
	goto	u7040

u7041:
	goto	l7099
u7040:
	line	279
	
l7067:
	movf	((c:is_option_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u7051
	goto	u7050
u7051:
	goto	l7085
u7050:
	line	282
	
l7069:
	movlw	low(01h)
	movwf	((c:_is_option_field$1160))^00h,c
	
l7071:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7061
	goto	u7060

u7061:
	goto	l524
u7060:
	
l7073:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7071
	goto	u7070

u7071:
	goto	l524
u7070:
	
l7075:
		movlw	8
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7081
	goto	u7080

u7081:
	goto	l524
u7080:
	
l7077:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7091
	goto	u7090

u7091:
	goto	l524
u7090:
	
l7079:
	movlw	low(0)
	movwf	((c:_is_option_field$1160))^00h,c
	
l524:
	movf	((c:_is_option_field$1160))^00h,c,w
	goto	l512
	line	287
	
l7085:
	movlw	low(01h)
	movwf	((c:_is_option_field$1161))^00h,c
	
l7087:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7101
	goto	u7100

u7101:
	goto	l527
u7100:
	
l7089:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7111
	goto	u7110

u7111:
	goto	l527
u7110:
	
l7091:
		movlw	5
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7121
	goto	u7120

u7121:
	goto	l527
u7120:
	
l7093:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u7131
	goto	u7130

u7131:
	goto	l527
u7130:
	
l7095:
	movlw	low(0)
	movwf	((c:_is_option_field$1161))^00h,c
	
l527:
	movf	((c:_is_option_field$1161))^00h,c,w
	goto	l512
	line	291
	
l7099:
	movlw	(0)&0ffh
	line	292
	
l512:
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
;;		On entry : 0/2
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
psect	text36,class=CODE,space=0,reloc=2,group=0
	line	197
global __ptext36
__ptext36:
psect	text36
	file	"src\menu.c"
	line	197
	
_is_numeric_field:
;incstack = 0
	callstack 27
	movwf	((c:is_numeric_field@line))^00h,c
	line	199
	
l10781:
	movf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u12371
	goto	u12370
u12371:
	goto	l10799
u12370:
	line	202
	
l10783:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1146))^00h,c
	
l10785:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12381
	goto	u12380

u12381:
	goto	l483
u12380:
	
l10787:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12391
	goto	u12390

u12391:
	goto	l483
u12390:
	
l10789:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12401
	goto	u12400

u12401:
	goto	l483
u12400:
	
l10791:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12411
	goto	u12410

u12411:
	goto	l483
u12410:
	
l10793:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1146))^00h,c
	
l483:
	movf	((c:_is_numeric_field$1146))^00h,c,w
	goto	l484
	line	204
	
l10799:
		decf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u12421
	goto	u12420

u12421:
	goto	l10815
u12420:
	line	207
	
l10801:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1147))^00h,c
	
l10803:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12431
	goto	u12430

u12431:
	goto	l488
u12430:
	
l10805:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12441
	goto	u12440

u12441:
	goto	l488
u12440:
	
l10807:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12451
	goto	u12450

u12451:
	goto	l488
u12450:
	
l10809:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1147))^00h,c
	
l488:
	movf	((c:_is_numeric_field$1147))^00h,c,w
	goto	l484
	line	209
	
l10815:
		movlw	2
	xorwf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u12461
	goto	u12460

u12461:
	goto	l10833
u12460:
	line	211
	
l10817:
	movf	((c:is_numeric_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u12471
	goto	u12470
u12471:
	goto	l10833
u12470:
	line	214
	
l10819:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1148))^00h,c
	
l10821:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12481
	goto	u12480

u12481:
	goto	l493
u12480:
	
l10823:
		movlw	5
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12491
	goto	u12490

u12491:
	goto	l493
u12490:
	
l10825:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u12501
	goto	u12500

u12501:
	goto	l493
u12500:
	
l10827:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1148))^00h,c
	
l493:
	movf	((c:_is_numeric_field$1148))^00h,c,w
	goto	l484
	line	219
	
l10833:
	movlw	(0)&0ffh
	line	224
	
l484:
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
;;		On entry : 0/1
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
psect	text37,class=CODE,space=0,reloc=2,group=0
	line	298
global __ptext37
__ptext37:
psect	text37
	file	"src\menu.c"
	line	298
	
_get_option_edit_flag:
;incstack = 0
	callstack 26
	movwf	((c:get_option_edit_flag@line))^00h,c
	line	301
	
l7103:
	movf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7141
	goto	u7140
u7141:
	goto	l7109
u7140:
	line	302
	
l7105:
		movlw	low(_enable_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(_enable_edit_flag)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l531
	line	303
	
l7109:
		decf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7151
	goto	u7150

u7151:
	goto	l7115
u7150:
	line	304
	
l7111:
		movlw	low(_sensor_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(_sensor_edit_flag)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l531
	line	307
	
l7115:
	movf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7161
	goto	u7160
u7161:
	goto	l7141
u7160:
	line	309
	
l7117:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7171
	goto	u7170

u7171:
	goto	l7123
u7170:
	line	310
	
l7119:
		movlw	low(_relay_high_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l531
	line	311
	
l7123:
		movlw	10
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7181
	goto	u7180

u7181:
	goto	l7129
u7180:
	line	312
	
l7125:
		movlw	low(_relay_plp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(_relay_plp_edit_flag)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l531
	line	313
	
l7129:
		movlw	11
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7191
	goto	u7190

u7191:
	goto	l7135
u7190:
	line	314
	
l7131:
		movlw	low(_relay_slp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(_relay_slp_edit_flag)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l531
	line	315
	
l7135:
		movlw	12
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7201
	goto	u7200

u7201:
	goto	l7201
u7200:
	line	316
	
l7137:
		movlw	low(_display_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l531
	line	319
	
l7141:
		decf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7211
	goto	u7210

u7211:
	goto	l7155
u7210:
	line	321
	
l7143:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7221
	goto	u7220

u7221:
	goto	l7149
u7220:
	goto	l7119
	line	323
	
l7149:
		movlw	7
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7231
	goto	u7230

u7231:
	goto	l7201
u7230:
	goto	l7137
	line	327
	
l7155:
		movlw	2
	xorwf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7241
	goto	u7240

u7241:
	goto	l7201
u7240:
	line	329
	
l7157:
		movlw	2
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7251
	goto	u7250

u7251:
	goto	l7163
u7250:
	line	330
	
l7159:
		movlw	low(_flow_type_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(_flow_type_edit_flag)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l531
	line	332
	
l7163:
	movf	((c:get_option_edit_flag@flow_type))^00h,c,w
	btfss	status,2
	goto	u7261
	goto	u7260
u7261:
	goto	l7183
u7260:
	line	334
	
l7165:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7271
	goto	u7270

u7271:
	goto	l7171
u7270:
	line	335
	
l7167:
		movlw	low(_flow_units_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(_flow_units_edit_flag)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l531
	line	336
	
l7171:
		movlw	8
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7281
	goto	u7280

u7281:
	goto	l7177
u7280:
	line	337
	
l7173:
		movlw	low(_relay_low_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(_relay_low_edit_flag)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l531
	line	338
	
l7177:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7291
	goto	u7290

u7291:
	goto	l7201
u7290:
	goto	l7137
	line	343
	
l7183:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7301
	goto	u7300

u7301:
	goto	l7189
u7300:
	line	344
	
l7185:
		movlw	low(_no_flow_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(_no_flow_edit_flag)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l531
	line	345
	
l7189:
		movlw	5
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7311
	goto	u7310

u7311:
	goto	l7195
u7310:
	goto	l7173
	line	347
	
l7195:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u7321
	goto	u7320

u7321:
	goto	l7201
u7320:
	goto	l7137
	line	352
	
l7201:
		movlw	low(0)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(0)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	line	353
	
l531:
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
;;		On entry : 0/1
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
	line	359
global __ptext38
__ptext38:
psect	text38
	file	"src\menu.c"
	line	359
	
_get_item_options_for_field:
;incstack = 0
	callstack 26
	movwf	((c:get_item_options_for_field@line))^00h,c
	line	362
	
l7205:
	movf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7331
	goto	u7330
u7331:
	goto	l7211
u7330:
	line	363
	
l7207:
		movlw	low(_menu_item_options)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l556
	line	364
	
l7211:
		decf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7341
	goto	u7340

u7341:
	goto	l7217
u7340:
	line	365
	
l7213:
		movlw	low(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l556
	line	368
	
l7217:
	movf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7351
	goto	u7350
u7351:
	goto	l7235
u7350:
	line	370
	
l7219:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u7361
	goto	u7360

u7361:
	goto	l7225
u7360:
	
l7221:
		movlw	10
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u7371
	goto	u7370

u7371:
	goto	l7225
u7370:
	
l7223:
		movlw	11
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7381
	goto	u7380

u7381:
	goto	l7229
u7380:
	line	371
	
l7225:
		movlw	low(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l556
	line	372
	
l7229:
		movlw	12
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7391
	goto	u7390

u7391:
	goto	l7295
u7390:
	line	373
	
l7231:
		movlw	low(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l556
	line	376
	
l7235:
		decf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7401
	goto	u7400

u7401:
	goto	l7249
u7400:
	line	378
	
l7237:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7411
	goto	u7410

u7411:
	goto	l7243
u7410:
	goto	l7225
	line	380
	
l7243:
		movlw	7
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7421
	goto	u7420

u7421:
	goto	l7295
u7420:
	goto	l7231
	line	384
	
l7249:
		movlw	2
	xorwf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u7431
	goto	u7430

u7431:
	goto	l7295
u7430:
	line	386
	
l7251:
		movlw	2
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7441
	goto	u7440

u7441:
	goto	l7257
u7440:
	line	387
	
l7253:
		movlw	low(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l556
	line	389
	
l7257:
	movf	((c:get_item_options_for_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u7451
	goto	u7450
u7451:
	goto	l7277
u7450:
	line	391
	
l7259:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7461
	goto	u7460

u7461:
	goto	l7265
u7460:
	line	392
	
l7261:
		movlw	low(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l556
	line	393
	
l7265:
		movlw	8
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7471
	goto	u7470

u7471:
	goto	l7271
u7470:
	goto	l7225
	line	395
	
l7271:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7481
	goto	u7480

u7481:
	goto	l7295
u7480:
	goto	l7231
	line	400
	
l7277:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7491
	goto	u7490

u7491:
	goto	l7283
u7490:
	line	401
	
l7279:
		movlw	low(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l556
	line	402
	
l7283:
		movlw	5
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7501
	goto	u7500

u7501:
	goto	l7289
u7500:
	goto	l7225
	line	404
	
l7289:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u7511
	goto	u7510

u7511:
	goto	l7295
u7510:
	goto	l7231
	line	409
	
l7295:
		movlw	low(0)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(0)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	line	410
	
l556:
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
;;  value_second    2   62[COMRAM] unsigned int 
;;  mode            1   64[COMRAM] unsigned char 
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
psect	text39,class=CODE,space=0,reloc=2,group=0
	line	419
global __ptext39
__ptext39:
psect	text39
	file	"src\menu.c"
	line	419
	
_init_time_editor:
;incstack = 0
	callstack 24
	line	422
	
l11425:
	movff	(c:init_time_editor@mode),0+((c:_menu)+010h)
	line	423
	movff	(c:init_time_editor@value_seconds),0+((c:_menu)+014h)
	movff	(c:init_time_editor@value_seconds+1),1+((c:_menu)+014h)
	line	426
	
l11427:
	movf	((c:init_time_editor@mode))^00h,c,w
	btfss	status,2
	goto	u13531
	goto	u13530
u13531:
	goto	l11431
u13530:
	line	428
	
l11429:
	movff	(c:init_time_editor@value_seconds),(c:___lwdiv@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	movwf	(0+((c:_menu)+012h))^00h,c
	line	429
	movff	(c:init_time_editor@value_seconds),(c:___lwmod@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	movwf	(0+((c:_menu)+013h))^00h,c
	line	430
	goto	l11433
	line	433
	
l11431:
	movff	(c:init_time_editor@value_seconds),(c:___lwdiv@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwdiv@dividend+1)
	movlw	high(0E10h)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(0E10h)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	movwf	(0+((c:_menu)+012h))^00h,c
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
	movwf	(0+((c:_menu)+013h))^00h,c
	line	438
	
l11433:
	movlw	low(0)
	movwf	(0+((c:_menu)+011h))^00h,c
	line	443
	
l11435:
		movlw	low(init_time_editor@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_130)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_130)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:init_time_editor@value_seconds),0+((c:?_sprintf)+04h)
	movff	(c:init_time_editor@value_seconds+1),1+((c:?_sprintf)+04h)
	movff	0+((c:_menu)+012h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+((c:_menu)+013h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	444
	
l11437:
		movlw	low(init_time_editor@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	445
	
l582:
	return	;funcret
	callstack 0
GLOBAL	__end_of_init_time_editor
	__end_of_init_time_editor:
	signat	_init_time_editor,8313
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
;;		On exit  : 0/0
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
	
l11729:
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
	
l11731:; BSR set to: 2

	movlw	low(0)
	movwf	(0+((c:_menu)+0Fh))^00h,c
	line	809
	
l11733:; BSR set to: 2

	movf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u13741
	goto	u13740
u13741:
	goto	l11741
u13740:
	line	812
	
l11735:; BSR set to: 2

		movlw	4
	xorwf	((c:_menu))^00h,c,w
	btfsc	status,2
	goto	u13751
	goto	u13750

u13751:
	goto	l11739
u13750:
	
l11737:; BSR set to: 2

		movlw	6
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u13761
	goto	u13760

u13761:
	goto	l11755
u13760:
	line	813
	
l11739:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+((c:_menu)+0Fh))^00h,c
	goto	l11755
	line	815
	
l11741:; BSR set to: 2

		decf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u13771
	goto	u13770

u13771:
	goto	l11747
u13770:
	line	818
	
l11743:; BSR set to: 2

		movlw	4
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u13781
	goto	u13780

u13781:
	goto	l11755
u13780:
	goto	l11739
	line	821
	
l11747:; BSR set to: 2

		movlw	2
	xorwf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u13791
	goto	u13790

u13791:
	goto	l11755
u13790:
	
l11749:; BSR set to: 2

	movf	((c:init_numeric_editor@flow_type))^00h,c,w
	btfss	status,2
	goto	u13801
	goto	u13800
u13801:
	goto	l11755
u13800:
	line	824
	
l11751:; BSR set to: 2

		movlw	6
	xorwf	((c:_menu))^00h,c,w
	btfss	status,2
	goto	u13811
	goto	u13810

u13811:
	goto	l11755
u13810:
	goto	l11739
	line	829
	
l11755:; BSR set to: 2

	movff	(c:init_numeric_editor@value),0+((c:_menu)+0Dh)
	movff	(c:init_numeric_editor@value+1),1+((c:_menu)+0Dh)
	line	832
	movf	(0+((c:_menu)+0Fh))^00h,c,w
	btfsc	status,2
	goto	u13821
	goto	u13820
u13821:
	goto	l723
u13820:
	
l11757:; BSR set to: 2

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u13830
	goto	u13831

u13831:
	goto	l723
u13830:
	line	833
	
l11759:; BSR set to: 2

	movlw	high(0)
	movwf	((c:init_numeric_editor@value+1))^00h,c
	movlw	low(0)
	movwf	((c:init_numeric_editor@value))^00h,c
	
l723:; BSR set to: 2

	line	836
	movf	(0+((c:_menu)+0Fh))^00h,c,w
	btfss	status,2
	goto	u13841
	goto	u13840
u13841:
	goto	l11763
u13840:
	
l11761:; BSR set to: 2

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u13851
	goto	u13850

u13851:
	movlw	1
	goto	u13860
u13850:
	movlw	0
u13860:
	movwf	((c:_init_numeric_editor$1307))^00h,c
	clrf	((c:_init_numeric_editor$1307+1))^00h,c
	goto	l11765
	
l11763:; BSR set to: 2

	movlw	high(0)
	movwf	((c:_init_numeric_editor$1307+1))^00h,c
	movlw	low(0)
	movwf	((c:_init_numeric_editor$1307))^00h,c
	
l11765:; BSR set to: 2

	movff	(c:_init_numeric_editor$1307),0+((c:_menu)+09h)
	line	839
	
l11767:; BSR set to: 2

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u13871
	goto	u13870

u13871:
	goto	l729
u13870:
	
l11769:; BSR set to: 2

	movff	(c:init_numeric_editor@value),(c:init_numeric_editor@abs_val)
	movff	(c:init_numeric_editor@value+1),(c:init_numeric_editor@abs_val+1)
	goto	l11771
	
l729:; BSR set to: 2

	movff	(c:init_numeric_editor@value),??_init_numeric_editor+0+0
	movff	(c:init_numeric_editor@value+1),??_init_numeric_editor+0+0+1
	comf	(??_init_numeric_editor+0+0)^00h,c
	comf	(??_init_numeric_editor+0+1)^00h,c
	infsnz	(??_init_numeric_editor+0+0)^00h,c
	incf	(??_init_numeric_editor+0+1)^00h,c
	movff	??_init_numeric_editor+0+0,(c:init_numeric_editor@abs_val)
	movff	??_init_numeric_editor+0+1,(c:init_numeric_editor@abs_val+1)
	line	840
	
l11771:; BSR set to: 2

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
	movwf	(0+((c:_menu)+0Ah))^00h,c
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
	movwf	(0+((c:_menu)+0Bh))^00h,c
	line	842
	movff	(c:init_numeric_editor@abs_val),(c:___lwmod@dividend)
	movff	(c:init_numeric_editor@abs_val+1),(c:___lwmod@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	movwf	(0+((c:_menu)+0Ch))^00h,c
	line	845
	
l11773:
	movf	(0+((c:_menu)+0Fh))^00h,c,w
	btfss	status,2
	goto	u13881
	goto	u13880
u13881:
	movlw	1
	goto	u13890
u13880:
	movlw	0
u13890:
	movwf	(0+((c:_menu)+08h))^00h,c
	line	846
	
l732:
	return	;funcret
	callstack 0
GLOBAL	__end_of_init_numeric_editor
	__end_of_init_numeric_editor:
	signat	_init_numeric_editor,4217
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
;;		On entry : 0/1
;;		On exit  : 0/0
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
	line	848
global __ptext41
__ptext41:
psect	text41
	file	"src\menu.c"
	line	848
	
_get_current_numeric_value:
;incstack = 0
	callstack 27
	line	850
	
l8335:
	movf	(0+((c:_menu)+0Bh))^00h,c,w
	mullw	0Ah
	movff	prodl,??_get_current_numeric_value+0+0
	movff	prodh,??_get_current_numeric_value+0+0+1
	movf	(0+((c:_menu)+0Ah))^00h,c,w
	mullw	064h
	movff	prodl,??_get_current_numeric_value+2+0
	movff	prodh,??_get_current_numeric_value+2+0+1
	movf	(??_get_current_numeric_value+0+0)^00h,c,w
	addwf	(??_get_current_numeric_value+2+0)^00h,c,w
	movwf	(??_get_current_numeric_value+4+0)^00h,c
	movf	(??_get_current_numeric_value+0+1)^00h,c,w
	addwfc	(??_get_current_numeric_value+2+1)^00h,c,w
	movwf	1+(??_get_current_numeric_value+4+0)^00h,c
	movf	(0+((c:_menu)+0Ch))^00h,c,w
	addwf	(??_get_current_numeric_value+4+0)^00h,c,w
	movwf	((c:get_current_numeric_value@value))^00h,c
	movlw	0
	addwfc	(??_get_current_numeric_value+4+1)^00h,c,w
	movwf	1+((c:get_current_numeric_value@value))^00h,c
	line	851
	
l8337:
	movf	(0+((c:_menu)+09h))^00h,c,w
	btfsc	status,2
	goto	u9011
	goto	u9010
u9011:
	goto	l8341
u9010:
	line	852
	
l8339:
	negf	((c:get_current_numeric_value@value))^00h,c
	comf	((c:get_current_numeric_value@value+1))^00h,c
	btfsc	status,0
	incf	((c:get_current_numeric_value@value+1))^00h,c
	line	853
	
l8341:
	movff	(c:get_current_numeric_value@value),(c:?_get_current_numeric_value)
	movff	(c:get_current_numeric_value@value+1),(c:?_get_current_numeric_value+1)
	line	854
	
l736:
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
psect	text42,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	162
global __ptext42
__ptext42:
psect	text42
	file	"src\main.c"
	line	162
	
_beep:
;incstack = 0
	callstack 27
	line	164
	
l7481:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	165
	
l7483:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l157
	line	167
	
l7485:
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

	line	165
	
l7487:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l157:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u7731
	goto	u7730

u7731:
	goto	l7485
u7730:
	
l159:
	line	169
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	170
	
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
psect	text43,class=CODE,space=0,reloc=2,group=0
	file	"src\lcd.c"
	line	70
global __ptext43
__ptext43:
psect	text43
	file	"src\lcd.c"
	line	70
	
_lcd_init:
;incstack = 0
	callstack 26
	line	73
	
l11825:; BSR set to: 3

	movlw	(0F0h)&0ffh
	andwf	((c:3986))^0f00h,c	;volatile
	line	74
	
l11827:; BSR set to: 3

	bcf	((c:3986))^0f00h,c,5	;volatile
	line	75
	
l11829:; BSR set to: 3

	bcf	((c:3986))^0f00h,c,6	;volatile
	line	76
	
l11831:; BSR set to: 3

	bcf	((c:3986))^0f00h,c,7	;volatile
	line	79
	
l11833:; BSR set to: 3

	bcf	((c:3977))^0f00h,c,6	;volatile
	line	80
	
l11835:; BSR set to: 3

	bcf	((c:3977))^0f00h,c,5	;volatile
	line	81
	
l11837:; BSR set to: 3

	bcf	((c:3977))^0f00h,c,7	;volatile
	line	82
	
l11839:; BSR set to: 3

	movlw	(0)&0ffh
	
	call	_lcd_write_nibble
	line	85
	
l11841:
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

	line	88
	
l11843:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	89
	
l11845:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	90
	
l11847:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	91
	
l11849:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	92
	
l11851:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	93
	
l11853:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	94
	
l11855:
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

	line	96
	
l11857:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	97
	
l11859:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	98
	
l11861:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	99
	
l11863:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	100
	
l11865:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u16147:
decfsz	wreg,f
	bra	u16147
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u16147
	nop2
asmopt pop

	line	102
	
l11867:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	103
	
l11869:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	104
	
l11871:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	105
	
l11873:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	106
	
l11875:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u16157:
decfsz	wreg,f
	bra	u16157
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u16157
	nop2
asmopt pop

	line	109
	
l11877:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	110
	
l11879:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	111
	
l11881:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	112
	
l11883:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	113
	
l11885:
	asmopt push
asmopt off
movlw	11
movwf	(??_lcd_init+0+0)^00h,c
	movlw	98
u16167:
decfsz	wreg,f
	bra	u16167
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u16167
	nop2
asmopt pop

	line	116
	
l11887:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	119
	
l11889:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	122
	
l11891:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	125
	
l11893:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	126
	
l1379:
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
psect	text44,class=CODE,space=0,reloc=2,group=0
	line	17
global __ptext44
__ptext44:
psect	text44
	file	"src\lcd.c"
	line	17
	
_lcd_cmd:
;incstack = 0
	callstack 24
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	20
	
l10397:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	21
	
l10399:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	22
	
l10401:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	23
	
l10403:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	24
	
l10405:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	25
	
l10407:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	26
	
l10409:
	asmopt push
asmopt off
	movlw	133
u16177:
decfsz	wreg,f
	bra	u16177
	nop
asmopt pop

	line	29
	
l10411:
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	30
	
l10413:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	31
	
l10415:
	bcf	((c:3977))^0f00h,c,5	;volatile
	line	32
	
l10417:
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	33
	
l10419:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	34
	
l10421:
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	37
	
l10423:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u11871
	goto	u11870

u11871:
	goto	l10427
u11870:
	
l10425:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u11881
	goto	u11880

u11881:
	goto	l10429
u11880:
	line	39
	
l10427:
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

	line	40
	goto	l1373
	line	43
	
l10429:
	asmopt push
asmopt off
	movlw	133
u16197:
decfsz	wreg,f
	bra	u16197
	nop
asmopt pop

	line	45
	
l1373:
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
psect	text45,class=CODE,space=0,reloc=2,group=0
	line	8
global __ptext45
__ptext45:
psect	text45
	file	"src\lcd.c"
	line	8
	
_lcd_write_nibble:
;incstack = 0
	callstack 24
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	10
	
l10395:
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u11791
	goto	u11790
u11791:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u11808
u11790:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u11808:
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not ((1<<1)-1)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	11
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u11811
	goto	u11810
u11811:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u11828
u11810:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u11828:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<1)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	12
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u11831
	goto	u11830
u11831:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u11848
u11830:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u11848:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<2)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	13
	
	btfsc	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u11851
	goto	u11850
u11851:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
	incf	(??_lcd_write_nibble+0+0)^00h,c
	goto	u11868
u11850:
	clrf	(??_lcd_write_nibble+0+0)^00h,c
u11868:
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	rlncf	(??_lcd_write_nibble+0+0)^00h,c
	movf	((c:3977))^0f00h,c,w	;volatile
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<3)
	xorwf	(??_lcd_write_nibble+0+0)^00h,c,w
	movwf	((c:3977))^0f00h,c	;volatile
	line	14
	
l1366:
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
psect	text46,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	16
global __ptext46
__ptext46:
psect	text46
	file	"src\i2c.c"
	line	16
	
_i2c_init:
;incstack = 0
	callstack 28
	line	19
	
l8587:
	bsf	((c:3988))^0f00h,c,3	;volatile
	line	20
	bsf	((c:3988))^0f00h,c,4	;volatile
	line	23
	
l8589:
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
	
l8591:
	asmopt push
asmopt off
	movlw	26
u16207:
decfsz	wreg,f
	bra	u16207
	nop2
asmopt pop

	line	34
	
l1421:
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
;;		On entry : 3F/3
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
psect	text47,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	260
global __ptext47
__ptext47:
psect	text47
	file	"src\eeprom.c"
	line	260
	
_get_menu_timeout_seconds:
;incstack = 0
	callstack 28
	line	263
	
l8571:; BSR set to: 3

		movlw	05h-0
	movlb	5	; () banked
	cpfslt	(0+(_system_config+01h))&0ffh
	goto	u9261
	goto	u9260

u9261:
	goto	l8577
u9260:
	line	265
	
l8573:; BSR set to: 5

	movlw	(01Eh)&0ffh
	goto	l1354
	line	267
	
l8577:; BSR set to: 5

		movlw	079h-1
	cpfsgt	(0+(_system_config+01h))&0ffh
	goto	u9271
	goto	u9270

u9271:
	goto	l8583
u9270:
	goto	l8573
	line	271
	
l8583:; BSR set to: 5

	movf	(0+(_system_config+01h))&0ffh,w
	line	272
	
l1354:; BSR set to: 5

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
;;		On entry : 0/1
;;		On exit  : 3F/3
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
psect	text48,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	205
global __ptext48
__ptext48:
psect	text48
	file	"src\encoder.c"
	line	205
	
_encoder_init:; BSR set to: 5

;incstack = 0
	callstack 28
	line	208
	
l8669:
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
	movlb	3	; () banked
	movwf	((_button_pressed))&0ffh	;volatile
	line	214
	movlw	high(0)
	movlb	1	; () banked
	movwf	((_button_hold_ms+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_button_hold_ms))&0ffh	;volatile
	line	215
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	216
	movlw	low(0)
	movlb	3	; () banked
	movwf	((_relay_ms_counter))&0ffh
	line	219
	
l8671:; BSR set to: 3

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	220
	
l8673:; BSR set to: 3

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	221
	
l8675:; BSR set to: 3

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	224
	
l8677:; BSR set to: 3

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u9331
	goto	u9330
u9331:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u9338
u9330:
	clrf	(??_encoder_init+0+0)^00h,c
u9338:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u9341
	goto	u9340
u9341:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u9348
u9340:
	clrf	(??_encoder_init+1+0)^00h,c
u9348:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movlb	3	; () banked
	movwf	((_enc_state))&0ffh
	line	225
	
l344:; BSR set to: 3

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
psect	text49,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	180
global __ptext49
__ptext49:
psect	text49
	file	"src\eeprom.c"
	line	180
	
_eeprom_init:; BSR set to: 3

;incstack = 0
	callstack 25
	line	182
	
l8537:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	185
	
l8539:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	189
	
l8545:
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
	
l8547:
	incf	((c:eeprom_init@i))^00h,c
	
l8549:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u9221
	goto	u9220

u9221:
	goto	l8545
u9220:
	line	191
	
l8551:
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
	
l8553:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	195
	
l8555:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u9230
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u9231
	goto	u9230

u9231:
	goto	l8561
u9230:
	line	198
	
l8557:
	call	_load_factory_defaults	;wreg free
	line	199
	
l8559:
	call	_save_current_config	;wreg free
	line	203
	
l8561:
	call	_sync_menu_variables	;wreg free
	line	207
	
l8563:
	movlb	5	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	mullw	02h
	movff	prodl,(_menu_timeout_seconds)
	movff	prodh,(_menu_timeout_seconds+1)
	line	210
	
l8565:; BSR set to: 5

	movlb	3	; () banked
		movf	((_menu_timeout_seconds+1))&0ffh,w
	bnz	u9240
	movlw	10
	subwf	 ((_menu_timeout_seconds))&0ffh,w
	btfss	status,0
	goto	u9241
	goto	u9240

u9241:
	goto	l8569
u9240:
	
l8567:; BSR set to: 3

		incf	((_menu_timeout_seconds))&0ffh,w
	movlw	1
	subwfb	((_menu_timeout_seconds+1))&0ffh,w
	btfss	status,0
	goto	u9251
	goto	u9250

u9251:
	goto	l1332
u9250:
	line	212
	
l8569:; BSR set to: 3

	movlw	high(01Eh)
	movwf	((_menu_timeout_seconds+1))&0ffh
	movlw	low(01Eh)
	movwf	((_menu_timeout_seconds))&0ffh
	line	214
	
l1332:; BSR set to: 3

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
psect	text50,class=CODE,space=0,reloc=2,group=0
	line	247
global __ptext50
__ptext50:
psect	text50
	file	"src\eeprom.c"
	line	247
	
_sync_menu_variables:; BSR set to: 3

;incstack = 0
	callstack 27
	line	256
	
l8413:
	movff	_input_config,(_enable_edit_flag)
	line	257
	movff	0+(_input_config+01h),(_sensor_edit_flag)
	line	258
	
l1350:
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
psect	text51,class=CODE,space=0,reloc=2,group=0
	line	216
global __ptext51
__ptext51:
psect	text51
	file	"src\eeprom.c"
	line	216
	
_save_current_config:
;incstack = 0
	callstack 26
	line	219
	
l7967:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	223
	
l7973:
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
	
l7975:
	incf	((c:save_current_config@i))^00h,c
	
l7977:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u8631
	goto	u8630

u8631:
	goto	l7973
u8630:
	line	227
	
l7979:
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
	
l7981:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	231
	
l7983:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	232
	
l1337:
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
psect	text52,class=CODE,space=0,reloc=2,group=0
	line	155
global __ptext52
__ptext52:
psect	text52
	file	"src\eeprom.c"
	line	155
	
_eeprom_write_word:
;incstack = 0
	callstack 26
	line	157
	
l7367:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	158
	
l7369:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	159
	
l1311:
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
psect	text53,class=CODE,space=0,reloc=2,group=0
	line	161
global __ptext53
__ptext53:
psect	text53
	file	"src\eeprom.c"
	line	161
	
_eeprom_write_block:
;incstack = 0
	callstack 26
	line	163
	
l7371:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	164
	
l7373:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l7379
	line	166
	
l7375:
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
	
l7377:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l7379:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u7581
	goto	u7580

u7581:
	goto	l7375
u7580:
	line	168
	
l1317:
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
psect	text54,class=CODE,space=0,reloc=2,group=0
	line	128
global __ptext54
__ptext54:
psect	text54
	file	"src\eeprom.c"
	line	128
	
_eeprom_write_byte:
;incstack = 0
	callstack 26
	line	130
	
l6533:
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
	
l6535:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	139
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	140
	
l6537:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	143
	
l1302:
	line	142
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u6111
	goto	u6110
u6111:
	goto	l1302
u6110:
	
l1304:
	line	144
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	145
	
l1305:
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
psect	text55,class=CODE,space=0,reloc=2,group=0
	line	92
global __ptext55
__ptext55:
psect	text55
	file	"src\eeprom.c"
	line	92
	
_calculate_config_checksum:
;incstack = 0
	callstack 27
	line	94
	
l7323:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	98
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	100
	
l7329:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	101
	
l7331:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	103
	
l7337:
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
	
l7339:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l7341:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u7550
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u7551
	goto	u7550

u7551:
	goto	l7337
u7550:
	line	98
	
l7343:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l7345:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u7561
	goto	u7560

u7561:
	goto	l7329
u7560:
	line	108
	
l7347:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	109
	
l7349:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1717+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1717))^00h,c
	line	111
	
l7355:
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
	
l7357:
	infsnz	((c:calculate_config_checksum@j_1717))^00h,c
	incf	((c:calculate_config_checksum@j_1717+1))^00h,c
	
l7359:
		movf	((c:calculate_config_checksum@j_1717+1))^00h,c,w
	bnz	u7570
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1717))^00h,c,w
	btfss	status,0
	goto	u7571
	goto	u7570

u7571:
	goto	l7355
u7570:
	
l1295:
	line	114
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	115
	
l1296:
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
psect	text56,class=CODE,space=0,reloc=2,group=0
	line	241
global __ptext56
__ptext56:
psect	text56
	file	"src\eeprom.c"
	line	241
	
_load_factory_defaults:
;incstack = 0
	callstack 26
	line	243
	
l8411:
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
	
l1343:
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
psect	text57,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
global __ptext57
__ptext57:
psect	text57
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
	
_memcpy:
;incstack = 0
	callstack 26
	line	34
	
l7299:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l7309
	line	37
	
l7301:
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
	
l7303:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l7305:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l7307:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l7309:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u7521
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u7521
	goto	u7520

u7521:
	goto	l7301
u7520:
	line	41
	
l2325:
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
psect	text58,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	147
global __ptext58
__ptext58:
psect	text58
	file	"src\eeprom.c"
	line	147
	
_eeprom_read_word:
;incstack = 0
	callstack 26
	line	150
	
l8395:
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
	
l8397:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	153
	
l1308:
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
psect	text59,class=CODE,space=0,reloc=2,group=0
	line	170
global __ptext59
__ptext59:
psect	text59
	file	"src\eeprom.c"
	line	170
	
_eeprom_read_block:
;incstack = 0
	callstack 26
	line	172
	
l8401:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	173
	
l8403:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l8409
	line	175
	
l8405:
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
	
l8407:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l8409:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u9051
	goto	u9050

u9051:
	goto	l8405
u9050:
	line	177
	
l1323:
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
psect	text60,class=CODE,space=0,reloc=2,group=0
	line	118
global __ptext60
__ptext60:
psect	text60
	file	"src\eeprom.c"
	line	118
	
_eeprom_read_byte:
;incstack = 0
	callstack 26
	line	120
	
l7361:
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
	
l7363:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	126
	
l1299:
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
;;  channel         1   40[BANK0 ] unsigned char 
;;  buf            40    0[BANK0 ] unsigned char [40]
;;  result          2   44[BANK0 ] unsigned int 
;;  lsb             1   43[BANK0 ] unsigned char 
;;  msb             1   42[BANK0 ] unsigned char 
;;  config_byte     1   41[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   62[COMRAM] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      46       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4      46       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       50 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
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
psect	text61,class=CODE,space=0,reloc=2,group=0
	file	"src\ad7994.c"
	line	60
global __ptext61
__ptext61:
psect	text61
	file	"src\ad7994.c"
	line	60
	
_ad7994_read_channel:
;incstack = 0
	callstack 25
	movlb	0	; () banked
	movwf	((ad7994_read_channel@channel))&0ffh
	line	67
	
l11895:
		movlw	low(ad7994_read_channel@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_290)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_290)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(ad7994_read_channel@channel),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	68
	
l11897:
		movlw	low(ad7994_read_channel@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	70
	goto	l11915
	line	73
	
l11899:; BSR set to: 0

	movlw	low(018h)
	movwf	((ad7994_read_channel@config_byte))&0ffh
	line	74
	goto	l11917
	line	76
	
l11901:; BSR set to: 0

	movlw	low(028h)
	movwf	((ad7994_read_channel@config_byte))&0ffh
	line	77
	goto	l11917
	line	79
	
l11903:; BSR set to: 0

	movlw	low(048h)
	movwf	((ad7994_read_channel@config_byte))&0ffh
	line	80
	goto	l11917
	line	82
	
l11905:; BSR set to: 0

	movlw	low(088h)
	movwf	((ad7994_read_channel@config_byte))&0ffh
	line	83
	goto	l11917
	line	85
	
l11907:; BSR set to: 0

		movlw	low(STR_291)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_291)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	86
	
l11909:
	setf	((c:?_ad7994_read_channel))^00h,c
	setf	((c:?_ad7994_read_channel+1))^00h,c
	goto	l1551
	line	70
	
l11915:
	movlb	0	; () banked
	movf	((ad7994_read_channel@channel))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 1 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l11899
	xorlw	2^1	; case 2
	skipnz
	goto	l11901
	xorlw	3^2	; case 3
	skipnz
	goto	l11903
	xorlw	4^3	; case 4
	skipnz
	goto	l11905
	goto	l11907

	line	89
	
l11917:; BSR set to: 0

	call	_i2c_start	;wreg free
	line	90
	
l11919:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	line	91
	
l11921:
	movlw	(02h)&0ffh
	
	call	_i2c_write
	line	92
	
l11923:
	movlb	0	; () banked
	movf	((ad7994_read_channel@config_byte))&0ffh,w
	
	call	_i2c_write
	line	93
	
l11925:
	call	_i2c_stop	;wreg free
	line	95
	
l11927:
	bsf	((c:3979))^0f00h,c,5	;volatile
	line	96
	
l11929:
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	97
	
l11931:
	bcf	((c:3979))^0f00h,c,5	;volatile
	line	98
	
l11933:
	asmopt push
asmopt off
	movlw	5
u16217:
decfsz	wreg,f
	bra	u16217
	nop
asmopt pop

	line	100
	
l11935:
	call	_i2c_start	;wreg free
	line	101
	
l11937:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	line	102
	
l11939:
	movlw	(0)&0ffh
	
	call	_i2c_write
	line	103
	
l11941:
	call	_i2c_stop	;wreg free
	line	105
	
l11943:
	call	_i2c_start	;wreg free
	line	106
	
l11945:
	movlw	(045h)&0ffh
	
	call	_i2c_write
	line	107
	
l11947:
	movlw	(01h)&0ffh
	
	call	_i2c_read
	movlb	0	; () banked
	movwf	((ad7994_read_channel@msb))&0ffh
	line	108
	
l11949:; BSR set to: 0

	movlw	(0)&0ffh
	
	call	_i2c_read
	movlb	0	; () banked
	movwf	((ad7994_read_channel@lsb))&0ffh
	line	109
	
l11951:; BSR set to: 0

	call	_i2c_stop	;wreg free
	line	111
	movlb	0	; () banked
	movf	((ad7994_read_channel@msb))&0ffh,w
	movwf	(??_ad7994_read_channel+0+0)^00h,c
	movf	((ad7994_read_channel@lsb))&0ffh,w
	movwf	((ad7994_read_channel@result))&0ffh
	movff	??_ad7994_read_channel+0+0,((ad7994_read_channel@result+1))
	line	113
	
l11953:; BSR set to: 0

		movlw	low(ad7994_read_channel@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_292)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_292)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(ad7994_read_channel@msb),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(ad7994_read_channel@lsb),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	(ad7994_read_channel@result),0+((c:?_sprintf)+08h)
	movff	(ad7994_read_channel@result+1),1+((c:?_sprintf)+08h)
	call	_sprintf	;wreg free
	line	114
	
l11955:
		movlw	low(ad7994_read_channel@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	116
	
l11957:
	movlb	0	; () banked
	movlw	low(0FFFh)
	andwf	((ad7994_read_channel@result))&0ffh
	movlw	high(0FFFh)
	andwf	((ad7994_read_channel@result+1))&0ffh
	line	118
	
l11959:; BSR set to: 0

		movlw	low(ad7994_read_channel@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_293)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_293)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(ad7994_read_channel@result),0+((c:?_sprintf)+04h)
	movff	(ad7994_read_channel@result+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	119
	
l11961:
		movlw	low(ad7994_read_channel@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	121
	
l11963:
	movff	(ad7994_read_channel@result),(c:?_ad7994_read_channel)
	movff	(ad7994_read_channel@result+1),(c:?_ad7994_read_channel+1)
	line	122
	
l1551:
	return	;funcret
	callstack 0
GLOBAL	__end_of_ad7994_read_channel
	__end_of_ad7994_read_channel:
	signat	_ad7994_read_channel,4218
	global	_sprintf

;; *************** function _sprintf *****************
;; Defined at:
;;		line 505 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              2   26[COMRAM] PTR unsigned char 
;;		 -> ad7994_read_channel@buf(40), menu_handle_button@buf_1564(50), menu_handle_button@buf_1554(50), menu_handle_button@buf_1532(50), 
;;		 -> menu_handle_button@buf(50), menu_handle_encoder@buf_1499(50), menu_handle_encoder@buf_1496(50), menu_handle_encoder@buf(50), 
;;		 -> value_clock_display(10), value_end_runtime(10), value_clock_enable(10), rebuild_clock_menu@buf(50), 
;;		 -> menu_draw_input@title(10), menu_update_edit_value@value_buf(10), handle_numeric_rotation@buf(50), rebuild_input_menu@buf(50), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), menu_update_time_value@debug_after(50), 
;;		 -> menu_update_time_value@debug_before(50), value_relay_pulse(10), handle_time_rotation@buf(50), init_time_editor@buf(60), 
;;		 -> NULL(0), main@buf_670(30), main@buf_643(40), main@buf_640(60), 
;;		 -> main@lcd_buf(17), main@time_buf(60), main@buf_603(30), main@buf(50), 
;;		 -> trigger_relay_pulse@buf(60), 
;;  f               2   28[COMRAM] PTR const unsigned char 
;;		 -> STR_293(19), STR_292(43), STR_290(21), STR_272(32), 
;;		 -> STR_271(38), STR_270(5), STR_269(6), STR_268(6), 
;;		 -> STR_267(5), STR_266(6), STR_265(6), STR_264(5), 
;;		 -> STR_263(5), STR_262(6), STR_261(6), STR_259(10), 
;;		 -> STR_258(26), STR_257(42), STR_256(32), STR_255(10), 
;;		 -> STR_254(10), STR_253(26), STR_252(28), STR_251(25), 
;;		 -> STR_250(20), STR_249(26), STR_248(35), STR_247(28), 
;;		 -> STR_246(37), STR_245(32), STR_244(23), STR_243(37), 
;;		 -> STR_237(29), STR_236(46), STR_234(10), STR_228(3), 
;;		 -> STR_227(35), STR_203(9), STR_193(9), STR_192(7), 
;;		 -> STR_191(29), STR_189(48), STR_188(10), STR_186(10), 
;;		 -> STR_185(5), STR_184(6), STR_183(6), STR_167(10), 
;;		 -> STR_166(3), STR_165(6), STR_164(6), STR_151(10), 
;;		 -> STR_150(10), STR_149(5), STR_148(10), STR_147(5), 
;;		 -> STR_146(6), STR_145(6), STR_141(3), STR_136(27), 
;;		 -> STR_135(51), STR_134(3), STR_133(25), STR_132(45), 
;;		 -> STR_130(35), STR_28(17), STR_27(23), STR_26(35), 
;;		 -> STR_25(23), STR_24(16), STR_23(37), STR_12(28), 
;;		 -> STR_6(39), STR_3(27), STR_1(48), 
;; Auto vars:     Size  Location     Type
;;  idx             1   45[COMRAM] unsigned char 
;;  tmpval          4    0        struct .
;;  width           2   58[COMRAM] int 
;;  val             2   56[COMRAM] unsigned int 
;;  len             2   53[COMRAM] unsigned int 
;;  cp              2   51[COMRAM] PTR const unsigned char 
;;		 -> STR_294(7), sprintf@c(1), ?_sprintf(2), value_clock_display(10), 
;;		 -> value_end_runtime(10), STR_230(9), STR_229(8), value_clock_enable(10), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), STR_143(9), STR_142(8), 
;;		 -> value_enable(10), value_relay_pulse(10), menu_update_time_value@value_buf(6), display_edit_flag(1), 
;;		 -> relay_high_edit_flag(1), NULL(0), menu_item_options$option_count(1), STR_77(1), 
;;		 -> STR_76(1), STR_75(9), STR_74(6), STR_73(6), 
;;		 -> STR_72(1), STR_71(1), STR_70(1), STR_69(5), 
;;		 -> STR_68(5), STR_67(1), STR_66(1), STR_65(1), 
;;		 -> STR_64(4), STR_63(2), STR_62(1), STR_61(1), 
;;		 -> STR_60(1), STR_59(5), STR_58(4), STR_57(1), 
;;		 -> STR_56(1), STR_55(1), STR_54(8), STR_53(7), 
;;		 -> STR_52(1), STR_51(1), STR_50(5), STR_49(5), 
;;		 -> STR_48(9), STR_47(1), STR_46(1), STR_45(1), 
;;		 -> STR_44(8), STR_43(9), enable_edit_flag(1), 
;;  c               1   61[COMRAM] unsigned char 
;;  flag            1   60[COMRAM] unsigned char 
;;  ap              1   55[COMRAM] PTR void [1]
;;		 -> ?_sprintf(2), 
;;  prec            1   50[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  2   26[COMRAM] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/3
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:        16       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        17       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        36       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       36 bytes
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
;;		_ad7994_read_channel
;; This function uses a non-reentrant model
;;
psect	text62,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
global __ptext62
__ptext62:
psect	text62
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
	
_sprintf:
;incstack = 0
	callstack 27
	line	550
	
l10561:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l10771
	line	555
	
l10563:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u12041
	goto	u12040

u12041:
	goto	l10569
u12040:
	line	558
	
l10565:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l10567:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l10771
	line	563
	
l10569:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	565
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	goto	l10579
	line	578
	
l10571:
	bsf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	579
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	580
	goto	l10579
	line	585
	
l10573:
	bsf	(0+(1/8)+(c:sprintf@flag))^00h,c,(1)&7
	line	586
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	587
	goto	l10579
	line	597
	
l10575:
	bsf	(0+(2/8)+(c:sprintf@flag))^00h,c,(2)&7
	line	598
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	568
	
l10579:
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
	goto	l10571
	xorlw	43^32	; case 43
	skipnz
	goto	l10573
	xorlw	48^43	; case 48
	skipnz
	goto	l10575
	goto	l1574

	line	603
	
l1574:
	line	606
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u12051
	goto	u12050
u12051:
	goto	l10583
u12050:
	line	607
	
l10581:
	bcf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	614
	
l10583:
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
	goto	u12061
	goto	u12060
u12061:
	goto	l10643
u12060:
	line	615
	
l10585:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	617
	
l10587:
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
	
l10589:
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

	
l10591:
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	619
	
l10593:
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
	goto	u12071
	goto	u12070
u12071:
	goto	l10587
u12070:
	goto	l10643
	line	747
	
l10595:
	bsf	(0+(7/8)+(c:sprintf@flag))^00h,c,(7)&7
	line	749
	goto	l10645
	line	760
	
l10597:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l10599:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l10601:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u12081
	goto	u12080

u12081:
	goto	l10605
u12080:
	line	767
	
l10603:
		movlw	low(STR_294)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_294)
	movwf	((c:sprintf@cp+1))^00h,c

	line	771
	
l10605:
	movlw	high(0)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@len))^00h,c
	line	772
	goto	l10609
	line	773
	
l10607:
	infsnz	((c:sprintf@len))^00h,c
	incf	((c:sprintf@len+1))^00h,c
	line	772
	
l10609:
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
	bra	u12097
	tblrd	*
	
	movf	tablat,w
	bra	u12090
u12097:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u12090:
	iorlw	0
	btfss	status,2
	goto	u12101
	goto	u12100
u12101:
	goto	l10607
u12100:
	line	783
	
l10611:
		movf	((c:sprintf@width))^00h,c,w
	subwf	((c:sprintf@len))^00h,c,w
	movf	((c:sprintf@width+1))^00h,c,w
	subwfb	((c:sprintf@len+1))^00h,c,w
	btfsc	status,0
	goto	u12111
	goto	u12110

u12111:
	goto	l10615
u12110:
	line	784
	
l10613:
	movf	((c:sprintf@len))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	subwfb	((c:sprintf@width+1))^00h,c

	goto	l10621
	line	786
	
l10615:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	goto	l10621
	line	791
	
l10617:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l10619:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	790
	
l10621:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
		incf	((c:sprintf@width))^00h,c,w
	bnz	u12121
	incf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u12121
	goto	u12120

u12121:
	goto	l10617
u12120:
	goto	l10629
	line	794
	
l10623:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u12137
	tblrd	*
	
	movf	tablat,w
	bra	u12130
u12137:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u12130:
	movwf	indf2
	
l10625:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l10627:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	793
	
l10629:
	decf	((c:sprintf@len))^00h,c
	btfss	status,0
	decf	((c:sprintf@len+1))^00h,c
		incf	((c:sprintf@len))^00h,c,w
	bnz	u12141
	incf	((c:sprintf@len+1))^00h,c,w
	btfss	status,2
	goto	u12141
	goto	u12140

u12141:
	goto	l10623
u12140:
	goto	l10771
	line	825
	
l10631:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:sprintf@c))^00h,c
	
l10633:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	831
	
l10635:
		movlw	low(sprintf@c)
	movwf	((c:sprintf@cp))^00h,c
	clrf	((c:sprintf@cp+1))^00h,c

	line	832
	
l10637:
	movlw	high(01h)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(01h)
	movwf	((c:sprintf@len))^00h,c
	line	833
	goto	l10611
	line	844
	
l10639:
	movlw	(0C0h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	845
	goto	l10645
	line	661
	
l10643:
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
	goto	l10773
	xorlw	88^0	; case 88
	skipnz
	goto	l10595
	xorlw	99^88	; case 99
	skipnz
	goto	l10631
	xorlw	100^99	; case 100
	skipnz
	goto	l10645
	xorlw	105^100	; case 105
	skipnz
	goto	l10645
	xorlw	115^105	; case 115
	skipnz
	goto	l10597
	xorlw	117^115	; case 117
	skipnz
	goto	l10639
	xorlw	120^117	; case 120
	skipnz
	goto	l10595
	goto	l10635

	line	1277
	
l10645:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	0C0h
	andwf	(??_sprintf+0+0)^00h,c
	btfss	status,2
	goto	u12151
	goto	u12150
u12151:
	goto	l10657
u12150:
	line	1285
	
l10647:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l10649:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l10651:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u12160
	goto	u12161

u12161:
	goto	l10691
u12160:
	line	1288
	
l10653:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l10655:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	goto	l10691
	line	1312
	
l10657:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l10659:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	goto	l10691
	line	1331
	
l10661:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l10663:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u12171
	goto	u12170

u12171:
	goto	l10667
u12170:
	goto	l10693
	line	1332
	
l10667:
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
	goto	u12181
	goto	u12180

u12181:
	goto	l10671
u12180:
	goto	l10693
	line	1331
	
l10671:
	incf	((c:sprintf@c))^00h,c
	goto	l10663
	line	1342
	
l10675:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l10677:
		movlw	4
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u12191
	goto	u12190

u12191:
	goto	l10681
u12190:
	goto	l10693
	line	1343
	
l10681:
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
	goto	u12201
	goto	u12200

u12201:
	goto	l10685
u12200:
	goto	l10693
	line	1342
	
l10685:
	incf	((c:sprintf@c))^00h,c
	goto	l10677
	line	1320
	
l10691:
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
	goto	l10661
	xorlw	128^0	; case 128
	skipnz
	goto	l10675
	xorlw	192^128	; case 192
	skipnz
	goto	l10661
	goto	l10693

	line	1371
	
l10693:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u12211
	goto	u12210

u12211:
	goto	l10699
u12210:
	
l10695:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u12221
	goto	u12220
u12221:
	goto	l10699
u12220:
	line	1372
	
l10697:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	line	1407
	
l10699:
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
	goto	u12231
	goto	u12230

u12231:
	goto	l10703
u12230:
	line	1408
	
l10701:
	movf	((c:sprintf@c))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movlw	0
	subwfb	((c:sprintf@width+1))^00h,c
	goto	l10705
	line	1410
	
l10703:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	1413
	
l10705:
	
	btfss	((c:sprintf@flag))^00h,c,(2)&7
	goto	u12241
	goto	u12240
u12241:
	goto	l10731
u12240:
	line	1415
	
l10707:
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u12251
	goto	u12250
u12251:
	goto	l1622
u12250:
	line	1416
	
l10709:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u12261
	goto	u12260
u12261:
	goto	l10713
u12260:
	
l10711:
	movlw	high(02Bh)
	movwf	((c:_sprintf$2281+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$2281))^00h,c
	goto	l10715
	
l10713:
	movlw	high(02Dh)
	movwf	((c:_sprintf$2281+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$2281))^00h,c
	
l10715:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$2281),indf2

	
l10717:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l10723
	line	1422
	
l1622:
	line	1425
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u12271
	goto	u12270
u12271:
	goto	l10723
u12270:
	line	1426
	
l10719:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l10717
	line	1441
	
l10723:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u12281
	goto	u12280

u12281:
	goto	l10753
u12280:
	line	1443
	
l10725:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(030h)
	movwf	indf2
	
l10727:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1444
	
l10729:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u12291
	goto	u12290

u12291:
	goto	l10725
u12290:
	goto	l10753
	line	1454
	
l10731:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u12301
	goto	u12300

u12301:
	goto	l1633
u12300:
	line	1456
	
l10733:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l10735:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1457
	
l10737:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u12311
	goto	u12310

u12311:
	goto	l10733
u12310:
	
l1633:
	line	1460
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u12321
	goto	u12320
u12321:
	goto	l1636
u12320:
	line	1461
	
l10739:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u12331
	goto	u12330
u12331:
	goto	l10743
u12330:
	
l10741:
	movlw	high(02Bh)
	movwf	((c:_sprintf$2282+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$2282))^00h,c
	goto	l10745
	
l10743:
	movlw	high(02Dh)
	movwf	((c:_sprintf$2282+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$2282))^00h,c
	
l10745:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$2282),indf2

	
l10747:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l10753
	line	1469
	
l1636:
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u12341
	goto	u12340
u12341:
	goto	l10753
u12340:
	line	1470
	
l10749:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l10747
	line	1498
	
l10753:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l10769
	line	1515
	
l10755:
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
	goto	l10765
	line	1526
	
l10757:
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
	
l10759:
	movlw	low((STR_295))
	addwf	((c:sprintf@idx))^00h,c,w
	movwf	tblptrl
	clrf	tblptrh
	movlw	high((STR_295))
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
	goto	l10765
	line	1502
	
l10763:
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
	goto	l10755
	xorlw	128^0	; case 128
	skipnz
	goto	l10757
	xorlw	192^128	; case 192
	skipnz
	goto	l10755
	goto	l10765

	line	1550
	
l10765:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l10767:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l10769:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u12351
	goto	u12350

u12351:
	goto	l10763
u12350:
	line	553
	
l10771:
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
	goto	u12361
	goto	u12360
u12361:
	goto	l10563
u12360:
	line	1564
	
l10773:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	clrf	indf2
	line	1567
	
l1652:
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
;;		On entry : 0/3
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
psect	text63,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
global __ptext63
__ptext63:
psect	text63
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
	
_isdigit:
;incstack = 0
	callstack 27
	movwf	((c:isdigit@c))^00h,c
	line	14
	
l10505:
	movlw	low(0)
	movwf	((c:_isdigit$2724))^00h,c
	
l10507:
		movlw	03Ah-0
	cpfslt	((c:isdigit@c))^00h,c
	goto	u11961
	goto	u11960

u11961:
	goto	l10513
u11960:
	
l10509:
		movlw	030h-1
	cpfsgt	((c:isdigit@c))^00h,c
	goto	u11971
	goto	u11970

u11971:
	goto	l10513
u11970:
	
l10511:
	movlw	low(01h)
	movwf	((c:_isdigit$2724))^00h,c
	
l10513:
	movff	(c:_isdigit$2724),??_isdigit+0+0
	rrcf	(??_isdigit+0+0)^00h,c,w
	line	15
	
l2319:
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
psect	text64,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
global __ptext64
__ptext64:
psect	text64
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
	
___wmul:
;incstack = 0
	callstack 27
	line	37
	
l10517:
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
	
l10519:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	line	53
	
l1655:
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
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text65,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext65
__ptext65:
psect	text65
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
___lwmod:
;incstack = 0
	callstack 27
	line	12
	
l10545:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u12011
	goto	u12010

u12011:
	goto	l2144
u12010:
	line	13
	
l10547:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l10551
	line	15
	
l10549:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l10551:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u12021
	goto	u12020
u12021:
	goto	l10549
u12020:
	line	19
	
l10553:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u12031
	goto	u12030

u12031:
	goto	l10557
u12030:
	line	20
	
l10555:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l10557:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l10559:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l10553
	line	23
	
l2144:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l2151:
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
psect	text66,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
global __ptext66
__ptext66:
psect	text66
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwdiv.c"
	line	7
	
___lwdiv:
;incstack = 0
	callstack 27
	line	13
	
l10523:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l10525:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u11981
	goto	u11980

u11981:
	goto	l2134
u11980:
	line	15
	
l10527:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l10531
	line	17
	
l10529:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l10531:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u11991
	goto	u11990
u11991:
	goto	l10529
u11990:
	line	21
	
l10533:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l10535:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u12001
	goto	u12000

u12001:
	goto	l10541
u12000:
	line	23
	
l10537:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l10539:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l10541:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l10543:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l10533
	line	28
	
l2134:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l2141:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_i2c_read

;; *************** function _i2c_read *****************
;; Defined at:
;;		line 142 in file "src\i2c.c"
;; Parameters:    Size  Location     Type
;;  ack             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ack             1   18[COMRAM] unsigned char 
;;  timeout         2   19[COMRAM] unsigned int 
;;  data            1   21[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/1
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
psect	text67,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	142
global __ptext67
__ptext67:
psect	text67
	file	"src\i2c.c"
	line	142
	
_i2c_read:
;incstack = 0
	callstack 26
	movwf	((c:i2c_read@ack))^00h,c
	line	146
	
l8433:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u9091
	goto	u9090
u9091:
	goto	l1462
u9090:
	line	147
	
l8435:
	movlw	(0FFh)&0ffh
	goto	l1463
	
l1462:
	line	149
	bsf	((c:4037))^0f00h,c,3	;volatile
	line	152
	
l8439:
	movlw	high(03E8h)
	movwf	((c:i2c_read@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_read@timeout))^00h,c
	line	153
	goto	l1464
	line	155
	
l8441:
	decf	((c:i2c_read@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_read@timeout+1))^00h,c
	movf	((c:i2c_read@timeout))^00h,c,w
iorwf	((c:i2c_read@timeout+1))^00h,c,w
	btfss	status,2
	goto	u9101
	goto	u9100

u9101:
	goto	l1464
u9100:
	goto	l8435
	line	157
	
l1464:
	line	153
	btfss	((c:4039))^0f00h,c,0	;volatile
	goto	u9111
	goto	u9110
u9111:
	goto	l8441
u9110:
	
l1467:
	line	159
	movff	(c:4041),(c:i2c_read@data)	;volatile
	line	161
	
l8447:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u9121
	goto	u9120
u9121:
	goto	l8453
u9120:
	line	162
	
l8449:
	movf	((c:i2c_read@data))^00h,c,w
	goto	l1463
	line	165
	
l8453:
	movf	((c:i2c_read@ack))^00h,c,w
	btfsc	status,2
	goto	u9131
	goto	u9130
u9131:
	clrf	(??_i2c_read+0+0)^00h,c
	incf	(??_i2c_read+0+0)^00h,c
	goto	u9148
u9130:
	clrf	(??_i2c_read+0+0)^00h,c
u9148:
	swapf	(??_i2c_read+0+0)^00h,c
	rlncf	(??_i2c_read+0+0)^00h,c
	movf	((c:4037))^0f00h,c,w	;volatile
	xorwf	(??_i2c_read+0+0)^00h,c,w
	andlw	not (((1<<1)-1)<<5)
	xorwf	(??_i2c_read+0+0)^00h,c,w
	movwf	((c:4037))^0f00h,c	;volatile
	line	166
	
l8455:
	bsf	((c:4037))^0f00h,c,4	;volatile
	line	169
	
l8457:
	movlw	high(03E8h)
	movwf	((c:i2c_read@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_read@timeout))^00h,c
	line	170
	goto	l1469
	line	172
	
l8459:
	decf	((c:i2c_read@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_read@timeout+1))^00h,c
	movf	((c:i2c_read@timeout))^00h,c,w
iorwf	((c:i2c_read@timeout+1))^00h,c,w
	btfss	status,2
	goto	u9151
	goto	u9150

u9151:
	goto	l1469
u9150:
	goto	l8449
	line	174
	
l1469:
	line	170
	btfsc	((c:4037))^0f00h,c,4	;volatile
	goto	u9161
	goto	u9160
u9161:
	goto	l8459
u9160:
	goto	l8449
	line	177
	
l1463:
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
psect	text68,class=CODE,space=0,reloc=2,group=0
	file	"src\ad7994.c"
	line	14
global __ptext68
__ptext68:
psect	text68
	file	"src\ad7994.c"
	line	14
	
_ad7994_init:
;incstack = 0
	callstack 25
	line	16
	
l8605:
		movlw	low(STR_279)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_279)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	18
	
l8607:
	bcf	((c:3988))^0f00h,c,5	;volatile
	line	19
	
l8609:
	bcf	((c:3979))^0f00h,c,5	;volatile
	line	20
	
l8611:
	asmopt push
asmopt off
movlw	104
movwf	(??_ad7994_init+0+0)^00h,c
	movlw	228
u16227:
decfsz	wreg,f
	bra	u16227
	decfsz	(??_ad7994_init+0+0)^00h,c,f
	bra	u16227
	nop2
asmopt pop

	line	21
	
l8613:
		movlw	low(STR_280)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_280)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	23
	
l8615:
		movlw	low(STR_281)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_281)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	25
	
l8617:
	call	_i2c_start	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u9291
	goto	u9290
u9291:
	goto	l8625
u9290:
	line	27
	
l8619:
		movlw	low(STR_282)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_282)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	28
	
l8621:
	movlw	(01h)&0ffh
	goto	l1538
	line	31
	
l8625:
	movlw	(044h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9301
	goto	u9300
u9301:
	goto	l8635
u9300:
	line	33
	
l8627:
		movlw	low(STR_283)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_283)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	34
	
l8629:
	call	_i2c_stop	;wreg free
	line	35
	
l8631:
	movlw	(02h)&0ffh
	goto	l1538
	line	37
	
l8635:
		movlw	low(STR_284)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_284)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	39
	
l8637:
	movlw	(02h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9311
	goto	u9310
u9311:
	goto	l8647
u9310:
	line	41
	
l8639:
		movlw	low(STR_285)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_285)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	42
	
l8641:
	call	_i2c_stop	;wreg free
	line	43
	
l8643:
	movlw	(03h)&0ffh
	goto	l1538
	line	45
	
l8647:
		movlw	low(STR_286)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_286)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	47
	
l8649:
	movlw	(08h)&0ffh
	
	call	_i2c_write
	iorlw	0
	btfsc	status,2
	goto	u9321
	goto	u9320
u9321:
	goto	l8659
u9320:
	line	49
	
l8651:
		movlw	low(STR_287)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_287)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	50
	
l8653:
	call	_i2c_stop	;wreg free
	line	51
	
l8655:
	movlw	(04h)&0ffh
	goto	l1538
	line	53
	
l8659:
		movlw	low(STR_288)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_288)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	55
	
l8661:
	call	_i2c_stop	;wreg free
	line	56
	
l8663:
		movlw	low(STR_289)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_289)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	57
	
l8665:
	movlw	(0)&0ffh
	line	58
	
l1538:
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
;;		 -> STR_291(34), ad7994_read_channel@buf(40), STR_289(29), STR_288(38), 
;;		 -> STR_287(43), STR_286(38), STR_285(49), STR_284(31), 
;;		 -> STR_283(39), STR_282(31), STR_281(37), STR_280(28), 
;;		 -> STR_279(22), STR_278(20), STR_273(25), menu_handle_button@buf_1564(50), 
;;		 -> menu_handle_button@buf_1554(50), STR_260(27), menu_handle_button@buf_1532(50), menu_handle_button@buf(50), 
;;		 -> menu_handle_encoder@buf_1499(50), menu_handle_encoder@buf_1496(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), 
;;		 -> handle_numeric_rotation@buf(50), STR_190(31), rebuild_input_menu@buf(50), menu_update_time_value@debug_after(50), 
;;		 -> menu_update_time_value@debug_before(50), handle_time_rotation@buf(50), STR_131(29), init_time_editor@buf(60), 
;;		 -> STR_42(21), STR_41(20), STR_40(36), STR_37(33), 
;;		 -> STR_36(21), STR_35(20), STR_34(22), STR_31(26), 
;;		 -> STR_30(15), STR_29(20), main@buf_670(30), main@buf_643(40), 
;;		 -> main@buf_640(60), main@time_buf(60), STR_22(19), STR_21(22), 
;;		 -> STR_20(22), STR_19(24), STR_18(19), STR_17(22), 
;;		 -> STR_14(23), STR_13(28), main@buf_603(30), STR_11(34), 
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
;;		_ad7994_init
;;		_ad7994_read_channel
;; This function uses a non-reentrant model
;;
psect	text69,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	80
global __ptext69
__ptext69:
psect	text69
	file	"src\main.c"
	line	80
	
_uart_println:
;incstack = 0
	callstack 26
	line	82
	
l6611:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	83
	
l6613:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	84
	
l6615:
	movlw	(0Ah)&0ffh
	
	call	_uart_write
	line	85
	
l136:
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
;;		 -> STR_291(34), ad7994_read_channel@buf(40), STR_289(29), STR_288(38), 
;;		 -> STR_287(43), STR_286(38), STR_285(49), STR_284(31), 
;;		 -> STR_283(39), STR_282(31), STR_281(37), STR_280(28), 
;;		 -> STR_279(22), STR_278(20), STR_273(25), menu_handle_button@buf_1564(50), 
;;		 -> menu_handle_button@buf_1554(50), STR_260(27), menu_handle_button@buf_1532(50), menu_handle_button@buf(50), 
;;		 -> menu_handle_encoder@buf_1499(50), menu_handle_encoder@buf_1496(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), 
;;		 -> handle_numeric_rotation@buf(50), STR_190(31), rebuild_input_menu@buf(50), menu_update_time_value@debug_after(50), 
;;		 -> menu_update_time_value@debug_before(50), handle_time_rotation@buf(50), STR_131(29), init_time_editor@buf(60), 
;;		 -> STR_42(21), STR_41(20), STR_40(36), STR_37(33), 
;;		 -> STR_36(21), STR_35(20), STR_34(22), STR_31(26), 
;;		 -> STR_30(15), STR_29(20), main@buf_670(30), main@buf_643(40), 
;;		 -> main@buf_640(60), main@time_buf(60), STR_22(19), STR_21(22), 
;;		 -> STR_20(22), STR_19(24), STR_18(19), STR_17(22), 
;;		 -> STR_14(23), STR_13(28), main@buf_603(30), STR_11(34), 
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
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_uart_write
;; This function is called by:
;;		_uart_println
;; This function uses a non-reentrant model
;;
psect	text70,class=CODE,space=0,reloc=2,group=0
	line	72
global __ptext70
__ptext70:
psect	text70
	file	"src\main.c"
	line	72
	
_uart_print:
;incstack = 0
	callstack 26
	line	74
	
l6501:
	goto	l6507
	line	76
	
l6503:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u6047
	tblrd	*
	
	movf	tablat,w
	bra	u6040
u6047:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u6040:
	
	call	_uart_write
	
l6505:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	74
	
l6507:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u6057
	tblrd	*
	
	movf	tablat,w
	bra	u6050
u6057:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u6050:
	iorlw	0
	btfss	status,2
	goto	u6061
	goto	u6060
u6061:
	goto	l6503
u6060:
	line	78
	
l133:
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_print
;;		_uart_println
;; This function uses a non-reentrant model
;;
psect	text71,class=CODE,space=0,reloc=2,group=0
	line	65
global __ptext71
__ptext71:
psect	text71
	file	"src\main.c"
	line	65
	
_uart_write:
;incstack = 0
	callstack 27
	movwf	((c:uart_write@c))^00h,c
	line	67
	
l6473:
	line	68
	
l124:
	line	67
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u6001
	goto	u6000
u6001:
	goto	l124
u6000:
	line	69
	
l6475:
	movff	(c:uart_write@c),(c:4013)	;volatile
	line	70
	
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
;;		_rtc_write_register
;;		_rtc_read_time
;;		_ad7994_init
;;		_ad7994_read_channel
;; This function uses a non-reentrant model
;;
psect	text72,class=CODE,space=0,reloc=2,group=0
	file	"src\i2c.c"
	line	119
global __ptext72
__ptext72:
psect	text72
	file	"src\i2c.c"
	line	119
	
_i2c_write:
;incstack = 0
	callstack 27
	movwf	((c:i2c_write@data))^00h,c
	line	121
	
l7409:
	movff	(c:i2c_write@data),(c:4041)	;volatile
	line	125
	
l1455:
	line	124
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u7651
	goto	u7650
u7651:
	goto	l1455
u7650:
	
l1457:
	line	126
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	129
	btfss	((c:4037))^0f00h,c,6	;volatile
	goto	u7661
	goto	u7660
u7661:
	goto	l7415
u7660:
	line	131
	
l7411:
	movlw	(01h)&0ffh
	goto	l1459
	line	134
	
l7415:
	movlw	(0)&0ffh
	line	135
	
l1459:
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
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_i2c_wait_idle
;; This function is called by:
;;		_rtc_write_register
;;		_rtc_read_time
;;		_ad7994_init
;;		_ad7994_read_channel
;; This function uses a non-reentrant model
;;
psect	text73,class=CODE,space=0,reloc=2,group=0
	line	99
global __ptext73
__ptext73:
psect	text73
	file	"src\i2c.c"
	line	99
	
_i2c_stop:
;incstack = 0
	callstack 26
	line	101
	
l7399:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u7621
	goto	u7620
u7621:
	goto	l1447
u7620:
	goto	l1448
	line	102
	
l1447:
	line	104
	bsf	((c:4037))^0f00h,c,2	;volatile
	line	107
	
l7403:
	movlw	high(03E8h)
	movwf	((c:i2c_stop@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_stop@timeout))^00h,c
	line	108
	goto	l1449
	line	110
	
l7405:
	decf	((c:i2c_stop@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_stop@timeout+1))^00h,c
	movf	((c:i2c_stop@timeout))^00h,c,w
iorwf	((c:i2c_stop@timeout+1))^00h,c,w
	btfss	status,2
	goto	u7631
	goto	u7630

u7631:
	goto	l1449
u7630:
	goto	l1448
	line	112
	
l1449:
	line	108
	btfsc	((c:4037))^0f00h,c,2	;volatile
	goto	u7641
	goto	u7640
u7641:
	goto	l7405
u7640:
	line	113
	
l1448:
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
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_i2c_wait_idle
;; This function is called by:
;;		_rtc_write_register
;;		_rtc_read_time
;;		_ad7994_init
;;		_ad7994_read_channel
;; This function uses a non-reentrant model
;;
psect	text74,class=CODE,space=0,reloc=2,group=0
	line	57
global __ptext74
__ptext74:
psect	text74
	file	"src\i2c.c"
	line	57
	
_i2c_start:
;incstack = 0
	callstack 26
	line	59
	
l7381:
	call	_i2c_wait_idle	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u7591
	goto	u7590
u7591:
	goto	l1431
u7590:
	line	60
	
l7383:
	movlw	(01h)&0ffh
	goto	l1432
	
l1431:
	line	62
	bsf	((c:4037))^0f00h,c,0	;volatile
	line	65
	
l7387:
	movlw	high(03E8h)
	movwf	((c:i2c_start@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_start@timeout))^00h,c
	line	66
	goto	l1433
	line	68
	
l7389:
	decf	((c:i2c_start@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_start@timeout+1))^00h,c
	movf	((c:i2c_start@timeout))^00h,c,w
iorwf	((c:i2c_start@timeout+1))^00h,c,w
	btfss	status,2
	goto	u7601
	goto	u7600

u7601:
	goto	l1433
u7600:
	goto	l7383
	line	70
	
l1433:
	line	66
	btfsc	((c:4037))^0f00h,c,0	;volatile
	goto	u7611
	goto	u7610
u7611:
	goto	l7389
u7610:
	line	72
	
l7395:
	movlw	(0)&0ffh
	line	73
	
l1432:
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
;;		_i2c_start
;;		_i2c_restart
;;		_i2c_stop
;;		_i2c_read
;; This function uses a non-reentrant model
;;
psect	text75,class=CODE,space=0,reloc=2,group=0
	line	40
global __ptext75
__ptext75:
psect	text75
	file	"src\i2c.c"
	line	40
	
_i2c_wait_idle:
;incstack = 0
	callstack 26
	line	42
	
l6539:
	movlw	high(03E8h)
	movwf	((c:i2c_wait_idle@timeout+1))^00h,c
	movlw	low(03E8h)
	movwf	((c:i2c_wait_idle@timeout))^00h,c
	line	45
	goto	l6547
	line	47
	
l6541:
	decf	((c:i2c_wait_idle@timeout))^00h,c
	btfss	status,0
	decf	((c:i2c_wait_idle@timeout+1))^00h,c
	movf	((c:i2c_wait_idle@timeout))^00h,c,w
iorwf	((c:i2c_wait_idle@timeout+1))^00h,c,w
	btfss	status,2
	goto	u6121
	goto	u6120

u6121:
	goto	l6547
u6120:
	line	48
	
l6543:
	movlw	(01h)&0ffh
	goto	l1427
	line	45
	
l6547:
	movff	(c:4037),??_i2c_wait_idle+0+0	;volatile
	movlw	01Fh
	andwf	(??_i2c_wait_idle+0+0)^00h,c
	btfss	status,2
	goto	u6131
	goto	u6130
u6131:
	goto	l6541
u6130:
	
l6549:
	btfsc	((c:4039))^0f00h,c,2	;volatile
	goto	u6141
	goto	u6140
u6141:
	goto	l6541
u6140:
	line	50
	
l6551:
	movlw	(0)&0ffh
	line	51
	
l1427:
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
	
i2l10273:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u1151_41
	goto	i2u1151_40
i2u1151_41:
	goto	i2l341
i2u1151_40:
	line	49
	
i2l10275:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	50
	
i2l10277:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	52
	
i2l10279:
	movlb	3	; () banked
	incf	((_relay_ms_counter))&0ffh
	line	53
	
i2l10281:; BSR set to: 3

		movlw	0Ah-1
	cpfsgt	((_relay_ms_counter))&0ffh
	goto	i2u1152_41
	goto	i2u1152_40

i2u1152_41:
	goto	i2l10303
i2u1152_40:
	line	55
	
i2l10283:; BSR set to: 3

	movlw	low(0)
	movwf	((_relay_ms_counter))&0ffh
	line	57
	
i2l10285:; BSR set to: 3

	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1153_41
	goto	i2u1153_40

i2u1153_41:
	goto	i2l10293
i2u1153_40:
	
i2l10287:; BSR set to: 0

	movlb	1	; () banked
	movf	((_relay_latch_mode))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1154_41
	goto	i2u1154_40
i2u1154_41:
	goto	i2l10293
i2u1154_40:
	
i2l10289:; BSR set to: 1

	movlb	2	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	i2u1155_41
	goto	i2u1155_40

i2u1155_41:
	goto	i2l10293
i2u1155_40:
	line	59
	
i2l10291:; BSR set to: 2

	decf	((_relay_counter))&0ffh	;volatile
	btfss	status,0
	decf	((_relay_counter+1))&0ffh	;volatile
	line	60
	goto	i2l10303
	line	61
	
i2l10293:
	movlb	0	; () banked
		decf	((_relay_state))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1156_41
	goto	i2u1156_40

i2u1156_41:
	goto	i2l10303
i2u1156_40:
	
i2l10295:; BSR set to: 0

	movlb	1	; () banked
	movf	((_relay_latch_mode))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1157_41
	goto	i2u1157_40
i2u1157_41:
	goto	i2l10303
i2u1157_40:
	
i2l10297:; BSR set to: 1

	movlb	2	; () banked
	movf	((_relay_counter))&0ffh,w	;volatile
iorwf	((_relay_counter+1))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1158_41
	goto	i2u1158_40

i2u1158_41:
	goto	i2l10303
i2u1158_40:
	line	64
	
i2l10299:; BSR set to: 2

	bsf	((c:3979))^0f00h,c,1	;volatile
	line	65
	
i2l10301:; BSR set to: 2

	movlw	low(0)
	movlb	0	; () banked
	movwf	((_relay_state))&0ffh	;volatile
	line	71
	
i2l10303:
	movlb	1	; () banked
	incf	((_ms_counter))&0ffh	;volatile
	line	72
	
i2l10305:; BSR set to: 1

		movlw	02h-1
	cpfsgt	((_ms_counter))&0ffh	;volatile
	goto	i2u1159_41
	goto	i2u1159_40

i2u1159_41:
	goto	i2l10321
i2u1159_40:
	line	74
	
i2l10307:; BSR set to: 1

	movlw	low(0)
	movwf	((_ms_counter))&0ffh	;volatile
	line	75
	
i2l10309:; BSR set to: 1

	movlb	2	; () banked
	movf	((_menu_timeout_timer))&0ffh,w	;volatile
iorwf	((_menu_timeout_timer+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	i2u1160_41
	goto	i2u1160_40

i2u1160_41:
	goto	i2l10321
i2u1160_40:
	line	77
	
i2l10311:; BSR set to: 2

	decf	((_menu_timeout_timer))&0ffh	;volatile
	btfss	status,0
	decf	((_menu_timeout_timer+1))&0ffh	;volatile
	line	80
	
i2l10313:; BSR set to: 2

	movff	(_menu_timeout_timer),(c:i2___lwmod@dividend)	;volatile
	movff	(_menu_timeout_timer+1),(c:i2___lwmod@dividend+1)	;volatile
	movlw	high(01F4h)
	movwf	((c:i2___lwmod@divisor+1))^00h,c
	movlw	low(01F4h)
	movwf	((c:i2___lwmod@divisor))^00h,c
	call	i2___lwmod	;wreg free
	movf	(0+?i2___lwmod)^00h,c,w
iorwf	(1+?i2___lwmod)^00h,c,w
	btfss	status,2
	goto	i2u1161_41
	goto	i2u1161_40

i2u1161_41:
	goto	i2l10317
i2u1161_40:
	line	83
	
i2l10315:; BSR set to: 2

	movlw	low(01h)
	movwf	((_timeout_debug_flag))&0ffh	;volatile
	line	86
	
i2l10317:; BSR set to: 2

	movf	((_menu_timeout_timer))&0ffh,w	;volatile
iorwf	((_menu_timeout_timer+1))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1162_41
	goto	i2u1162_40

i2u1162_41:
	goto	i2l10321
i2u1162_40:
	line	88
	
i2l10319:; BSR set to: 2

	movlw	low(0)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	94
	
i2l10321:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u1163_41
	goto	i2u1163_40
i2u1163_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u1163_48
i2u1163_40:
	clrf	(??_isr+0+0)^00h,c
i2u1163_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u1164_41
	goto	i2u1164_40
i2u1164_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u1164_48
i2u1164_40:
	clrf	(??_isr+1+0)^00h,c
i2u1164_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	95
	
i2l10323:
	movlb	3	; () banked
	rlncf	((_enc_state))&0ffh,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	98
	
i2l10325:; BSR set to: 3

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
	movlb	1	; () banked
	addwf	((_enc_accumulator))&0ffh
	line	101
	
i2l10327:; BSR set to: 1

	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u1165_41
	goto	i2u1165_40
i2u1165_41:
	goto	i2l10353
i2u1165_40:
	line	103
	
i2l10329:; BSR set to: 1

		movf	((_enc_accumulator))&0ffh,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u1166_41
	goto	i2u1166_40

i2u1166_41:
	goto	i2l10341
i2u1166_40:
	line	105
	
i2l10331:; BSR set to: 1

	movlb	2	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	106
	
i2l10333:; BSR set to: 2

	movlw	low(0)
	movlb	1	; () banked
	movwf	((_enc_accumulator))&0ffh
	line	109
	
i2l10335:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1167_41
	goto	i2u1167_40

i2u1167_41:
	goto	i2l10353
i2u1167_40:
	line	111
	
i2l10337:; BSR set to: 1

	movff	(c:_menu_timeout_reload),(_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(_menu_timeout_timer+1)	;volatile
	line	112
	
i2l10339:; BSR set to: 1

	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l10353
	line	115
	
i2l10341:; BSR set to: 1

		movf	((_enc_accumulator))&0ffh,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u1168_41
	goto	i2u1168_40

i2u1168_41:
	goto	i2l10353
i2u1168_40:
	line	117
	
i2l10343:; BSR set to: 1

	movlb	2	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	line	118
	
i2l10345:; BSR set to: 2

	movlw	low(0)
	movlb	1	; () banked
	movwf	((_enc_accumulator))&0ffh
	line	121
	
i2l10347:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1169_41
	goto	i2u1169_40

i2u1169_41:
	goto	i2l326
i2u1169_40:
	goto	i2l10337
	line	127
	
i2l326:; BSR set to: 1

	line	129
	
i2l10353:
	movff	(c:isr@new_state),(_enc_state)
	line	132
	
i2l10355:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	133
	
i2l10357:
	movlb	3	; () banked
	movf	((_last_btn))&0ffh,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u1170_41
	goto	i2u1170_40

i2u1170_41:
	goto	i2l10385
i2u1170_40:
	line	135
	
i2l10359:; BSR set to: 3

	incf	((_btn_debounce))&0ffh
	line	136
	
i2l10361:; BSR set to: 3

		movlw	014h-1
	cpfsgt	((_btn_debounce))&0ffh
	goto	i2u1171_41
	goto	i2u1171_40

i2u1171_41:
	goto	i2l341
i2u1171_40:
	line	138
	
i2l10363:; BSR set to: 3

	movff	(c:isr@btn),(_last_btn)
	line	139
	
i2l10365:; BSR set to: 3

	movlw	low(0)
	movwf	((_btn_debounce))&0ffh
	line	141
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1172_41
	goto	i2u1172_40
i2u1172_41:
	goto	i2l10375
i2u1172_40:
	line	144
	
i2l10367:; BSR set to: 3

	movlw	high(0)
	movlb	1	; () banked
	movwf	((_button_hold_ms+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_button_hold_ms))&0ffh	;volatile
	line	145
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	148
	
i2l10369:; BSR set to: 2

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1173_41
	goto	i2u1173_40

i2u1173_41:
	goto	i2l338
i2u1173_40:
	line	150
	
i2l10371:; BSR set to: 2

	movff	(c:_menu_timeout_reload),(_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(_menu_timeout_timer+1)	;volatile
	line	151
	
i2l10373:; BSR set to: 2

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l341
	line	157
	
i2l10375:; BSR set to: 3

		movlw	8
	movlb	1	; () banked
	subwf	 ((_button_hold_ms))&0ffh,w	;volatile
	movlw	7
	subwfb	((_button_hold_ms+1))&0ffh,w	;volatile
	btfss	status,0
	goto	i2u1174_41
	goto	i2u1174_40

i2u1174_41:
	goto	i2l10379
i2u1174_40:
	line	159
	
i2l10377:; BSR set to: 1

	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	160
	goto	i2l335
	line	161
	
i2l10379:; BSR set to: 1

		movf	((_button_hold_ms+1))&0ffh,w	;volatile
	bnz	i2u1175_40
	movlw	50
	subwf	 ((_button_hold_ms))&0ffh,w	;volatile
	btfss	status,0
	goto	i2u1175_41
	goto	i2u1175_40

i2u1175_41:
	goto	i2l10383
i2u1175_40:
	line	163
	
i2l10381:; BSR set to: 1

	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	164
	goto	i2l335
	line	167
	
i2l10383:; BSR set to: 1

	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	168
	
i2l335:; BSR set to: 2

	line	170
	movlw	low(01h)
	movlb	3	; () banked
	movwf	((_button_pressed))&0ffh	;volatile
	line	171
	movlw	high(0)
	movlb	1	; () banked
	movwf	((_button_hold_ms+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_button_hold_ms))&0ffh	;volatile
	goto	i2l341
	line	177
	
i2l10385:; BSR set to: 3

	movlw	low(0)
	movwf	((_btn_debounce))&0ffh
	line	179
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1176_41
	goto	i2u1176_40
i2u1176_41:
	goto	i2l341
i2u1176_40:
	
i2l10387:; BSR set to: 3

	movlb	1	; () banked
		incf	((_button_hold_ms))&0ffh,w	;volatile
	bnz	i2u1177_40
	incf	((_button_hold_ms+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	i2u1177_41
	goto	i2u1177_40

i2u1177_41:
	goto	i2l341
i2u1177_40:
	line	181
	
i2l10389:; BSR set to: 1

	infsnz	((_button_hold_ms))&0ffh	;volatile
	incf	((_button_hold_ms+1))&0ffh	;volatile
	line	184
	
i2l10391:; BSR set to: 1

		movlw	8
	xorwf	((_button_hold_ms))&0ffh,w	;volatile
	bnz	i2u1178_41
	movlw	7
	xorwf	((_button_hold_ms+1))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u1178_41
	goto	i2u1178_40

i2u1178_41:
	goto	i2l338
i2u1178_40:
	line	186
	
i2l10393:; BSR set to: 1

	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	goto	i2l341
	line	189
	
i2l338:
	line	203
	
i2l341:
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
;;		On entry : 3F/2
;;		On exit  : 3F/2
;;		Unchanged: 3F/0
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
psect	text77,class=CODE,space=0,reloc=2,group=0
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext77
__ptext77:
psect	text77
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
i2___lwmod:
;incstack = 0
	callstack 22
	line	12
	
i2l9887:; BSR set to: 2

	movf	((c:i2___lwmod@divisor))^00h,c,w
iorwf	((c:i2___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	i2u1145_41
	goto	i2u1145_40

i2u1145_41:
	goto	i2l2144
i2u1145_40:
	line	13
	
i2l9889:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:i2___lwmod@counter))^00h,c
	line	14
	goto	i2l9893
	line	15
	
i2l9891:; BSR set to: 2

	bcf	status,0
	rlcf	((c:i2___lwmod@divisor))^00h,c
	rlcf	((c:i2___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:i2___lwmod@counter))^00h,c
	line	14
	
i2l9893:; BSR set to: 2

	
	btfss	((c:i2___lwmod@divisor+1))^00h,c,(15)&7
	goto	i2u1146_41
	goto	i2u1146_40
i2u1146_41:
	goto	i2l9891
i2u1146_40:
	line	19
	
i2l9895:; BSR set to: 2

		movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c,w
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	i2u1147_41
	goto	i2u1147_40

i2u1147_41:
	goto	i2l9899
i2u1147_40:
	line	20
	
i2l9897:; BSR set to: 2

	movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c

	line	21
	
i2l9899:; BSR set to: 2

	bcf	status,0
	rrcf	((c:i2___lwmod@divisor+1))^00h,c
	rrcf	((c:i2___lwmod@divisor))^00h,c
	line	22
	
i2l9901:; BSR set to: 2

	decfsz	((c:i2___lwmod@counter))^00h,c
	
	goto	i2l9895
	line	23
	
i2l2144:; BSR set to: 2

	line	24
	movff	(c:i2___lwmod@dividend),(c:?i2___lwmod)
	movff	(c:i2___lwmod@dividend+1),(c:?i2___lwmod+1)
	line	25
	
i2l2151:; BSR set to: 2

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
