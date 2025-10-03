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
	FNCALL	_menu_handle_encoder,_sprintf
	FNCALL	_menu_handle_encoder,_strcpy
	FNCALL	_menu_handle_encoder,_uart_println
	FNCALL	_handle_time_rotation,_sprintf
	FNCALL	_handle_time_rotation,_uart_println
	FNCALL	_handle_numeric_rotation,_sprintf
	FNCALL	_handle_numeric_rotation,_uart_println
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
	FNCALL	_rebuild_clock_menu,_memcpy
	FNCALL	_rebuild_clock_menu,_sprintf
	FNCALL	_rebuild_clock_menu,_strcpy
	FNCALL	_rebuild_clock_menu,_uart_println
	FNCALL	_menu_update_time_value,___lbdiv
	FNCALL	_menu_update_time_value,___lbmod
	FNCALL	_menu_update_time_value,_is_time_field
	FNCALL	_menu_update_time_value,_lcd_print
	FNCALL	_menu_update_time_value,_lcd_set_cursor
	FNCALL	_menu_update_time_value,_sprintf
	FNCALL	_menu_update_time_value,_uart_println
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
	FNCALL	_menu_draw_clock,_lcd_clear_line
	FNCALL	_menu_draw_clock,_lcd_print
	FNCALL	_menu_draw_clock,_lcd_print_at
	FNCALL	_menu_draw_clock,_lcd_set_cursor
	FNCALL	_menu_draw_clock,_strcmp
	FNCALL	_menu_draw_clock,_strcpy
	FNCALL	_menu_draw_clock,_strlen
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
	global	_options_menu
	global	_menu_timeout_flag
	global	_value_sensor
	global	_value_scale20
	global	_value_scale4
	global	_value_enable
	global	menu_draw_setup@F2641
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
	line	1202

;initializer for menu_draw_setup@F2641
		db	low(STR_193)
	db	high(STR_193)

		db	low(STR_194)
	db	high(STR_194)

		db	low(STR_195)
	db	high(STR_195)

		db	low(STR_196)
	db	high(STR_196)

		db	low(STR_197)
	db	high(STR_197)

	line	102

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
	line	111
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
	line	154
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
	line	129
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
	line	142
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
	line	169
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
	
STR_117:
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
	
STR_171:
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
	
STR_115:
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
	
STR_235:
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
	
STR_249:
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
	
STR_225:
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
	
STR_228:
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
	
STR_232:
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
	db	44
	db	32
	db	102	;'f'
	db	108	;'l'
	db	97	;'a'
	db	103	;'g'
	db	32
	db	98	;'b'
	db	101	;'e'
	db	102	;'f'
	db	111	;'o'
	db	114	;'r'
	db	101	;'e'
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
	
STR_113:
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
	
STR_209:
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
	
STR_230:
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
	
STR_217:
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
	
STR_250:
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
	
STR_227:
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
	
STR_172:
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
	
STR_114:
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
	
STR_173:
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
	
STR_218:
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
	
STR_234:
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
	
STR_229:
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
	
STR_118:
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
	
STR_238:
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
	
STR_231:
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
	
STR_236:
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
	
STR_233:
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
	
STR_116:
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
	
STR_251:
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
	
STR_226:
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
	
STR_122:
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
	
STR_192:
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
	
STR_182:
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
	
STR_256:
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
	
STR_130:
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
	
STR_185:
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_175:
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
	
STR_257:
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
	
STR_219:
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
	
STR_127:
	db	37
	db	43
	db	48	;'0'
	db	52	;'4'
	db	100	;'d'
	db	0
	
STR_58:
	db	80	;'P'
	db	117	;'u'
	db	108	;'l'
	db	115	;'s'
	db	101	;'e'
	db	0
	
STR_57:
	db	76	;'L'
	db	97	;'a'
	db	116	;'t'
	db	99	;'c'
	db	104	;'h'
	db	0
	
STR_196:
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
	
STR_129:
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
	
STR_120:
	db	40
	db	0
	
STR_203:
	db	42
	db	0
	
STR_183:
	db	91	;'['
	db	0
	
STR_184:
	db	93	;']'
	db	0
STR_88	equ	STR_79+0
STR_96	equ	STR_79+0
STR_107	equ	STR_79+0
STR_111	equ	STR_79+0
STR_34	equ	STR_93+3
STR_155	equ	STR_93+3
STR_200	equ	STR_93+3
STR_143	equ	STR_53+0
STR_153	equ	STR_53+0
STR_158	equ	STR_53+0
STR_216	equ	STR_53+0
STR_255	equ	STR_53+0
STR_106	equ	STR_95+0
STR_42	equ	STR_95+4
STR_169	equ	STR_95+4
STR_123	equ	STR_227+29
STR_210	equ	STR_227+29
STR_82	equ	STR_68+0
STR_91	equ	STR_68+0
STR_99	equ	STR_68+0
STR_33	equ	STR_85+5
STR_145	equ	STR_85+5
STR_199	equ	STR_85+5
STR_157	equ	STR_38+0
STR_89	equ	STR_80+0
STR_97	equ	STR_80+0
STR_108	equ	STR_80+0
STR_112	equ	STR_80+0
STR_197	equ	STR_80+0
STR_87	equ	STR_76+0
STR_43	equ	STR_76+4
STR_134	equ	STR_57+0
STR_137	equ	STR_57+0
STR_140	equ	STR_57+0
STR_150	equ	STR_57+0
STR_160	equ	STR_57+0
STR_213	equ	STR_57+0
STR_253	equ	STR_57+0
STR_156	equ	STR_37+0
STR_26	equ	STR_20+0
STR_135	equ	STR_58+0
STR_138	equ	STR_58+0
STR_141	equ	STR_58+0
STR_151	equ	STR_58+0
STR_161	equ	STR_58+0
STR_214	equ	STR_58+0
STR_254	equ	STR_58+0
STR_32	equ	STR_71+3
STR_126	equ	STR_71+3
STR_198	equ	STR_71+3
STR_100	equ	STR_92+0
STR_81	equ	STR_67+0
STR_90	equ	STR_67+0
STR_98	equ	STR_67+0
STR_109	equ	STR_67+0
STR_144	equ	STR_52+0
STR_154	equ	STR_52+0
STR_159	equ	STR_52+0
STR_136	equ	STR_59+0
STR_139	equ	STR_59+0
STR_142	equ	STR_59+0
STR_152	equ	STR_59+0
STR_162	equ	STR_59+0
STR_215	equ	STR_59+0
STR_125	equ	STR_27+0
STR_212	equ	STR_27+0
STR_124	equ	STR_28+0
STR_211	equ	STR_28+0
STR_252	equ	STR_28+0
STR_128	equ	STR_127+0
STR_146	equ	STR_127+0
STR_147	equ	STR_127+0
STR_165	equ	STR_127+0
STR_166	equ	STR_127+0
STR_239	equ	STR_127+0
STR_240	equ	STR_127+0
STR_243	equ	STR_127+0
STR_244	equ	STR_127+0
STR_246	equ	STR_127+0
STR_247	equ	STR_127+0
STR_131	equ	STR_129+0
STR_167	equ	STR_129+0
STR_241	equ	STR_129+0
STR_242	equ	STR_129+0
STR_245	equ	STR_129+0
STR_248	equ	STR_129+0
STR_132	equ	STR_130+0
STR_133	equ	STR_130+0
STR_149	equ	STR_130+0
STR_168	equ	STR_130+0
STR_170	equ	STR_130+0
STR_237	equ	STR_130+0
STR_174	equ	STR_175+2
STR_148	equ	STR_11+20
STR_190	equ	STR_184+0
STR_202	equ	STR_184+0
STR_206	equ	STR_184+0
STR_223	equ	STR_184+0
STR_188	equ	STR_183+0
STR_201	equ	STR_183+0
STR_205	equ	STR_183+0
STR_221	equ	STR_183+0
STR_164	equ	STR_48+0
STR_22	equ	STR_16+0
STR_83	equ	STR_69+0
STR_102	equ	STR_69+0
STR_84	equ	STR_70+0
STR_103	equ	STR_70+0
STR_25	equ	STR_19+0
STR_207	equ	STR_203+0
STR_121	equ	STR_257+5
STR_178	equ	STR_257+5
STR_181	equ	STR_257+5
STR_191	equ	STR_257+5
STR_224	equ	STR_257+5
STR_177	equ	STR_120+0
STR_180	equ	STR_120+0
STR_189	equ	STR_120+0
STR_222	equ	STR_120+0
STR_163	equ	STR_47+0
STR_119	equ	STR_122+13
STR_176	equ	STR_122+14
STR_179	equ	STR_122+15
STR_186	equ	STR_122+15
STR_204	equ	STR_122+19
STR_208	equ	STR_122+19
STR_29	equ	STR_122+20
STR_30	equ	STR_122+20
STR_31	equ	STR_122+20
STR_35	equ	STR_122+20
STR_36	equ	STR_122+20
STR_39	equ	STR_122+20
STR_40	equ	STR_122+20
STR_41	equ	STR_122+20
STR_44	equ	STR_122+20
STR_45	equ	STR_122+20
STR_46	equ	STR_122+20
STR_49	equ	STR_122+20
STR_50	equ	STR_122+20
STR_51	equ	STR_122+20
STR_54	equ	STR_122+20
STR_55	equ	STR_122+20
STR_56	equ	STR_122+20
STR_60	equ	STR_122+20
STR_61	equ	STR_122+20
STR_187	equ	STR_122+20
STR_193	equ	STR_122+20
STR_194	equ	STR_122+20
STR_195	equ	STR_122+20
STR_220	equ	STR_122+20
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
menu_update_numeric_value@F2612:
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
       ds      20
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
	line	1202
menu_draw_setup@F2641:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	102
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
; Initialize objects allocated to BANK2 (53 bytes)
	global __pidataBANK2
	; load TBLPTR registers with __pidataBANK2
	movlw	low (__pidataBANK2)
	movwf	tblptrl
	movlw	high(__pidataBANK2)
	movwf	tblptrh
	movlw	low highword(__pidataBANK2)
	movwf	tblptru
	lfsr	0,__pdataBANK2
	lfsr	1,53
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
; Clear objects allocated to BANK1 (20 bytes)
	global __pbssBANK1
lfsr	0,__pbssBANK1
movlw	20
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
	global	main@sensor_type
main@sensor_type:	; 1 bytes @ 0x47
	ds   1
	global	main@flow_type
main@flow_type:	; 1 bytes @ 0x48
	ds   1
	global	main@sensor_type_620
main@sensor_type_620:	; 1 bytes @ 0x49
	ds   1
	global	main@flow_type_621
main@flow_type_621:	; 1 bytes @ 0x4A
	ds   1
	global	main@sensor_type_635
main@sensor_type_635:	; 1 bytes @ 0x4B
	ds   1
	global	main@flow_type_636
main@flow_type_636:	; 1 bytes @ 0x4C
	ds   1
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0x4D
	ds   2
	global	main@current_event
main@current_event:	; 1 bytes @ 0x4F
	ds   1
	global	main@delta
main@delta:	; 2 bytes @ 0x50
	ds   2
psect	cstackBANK1,class=BANK1,space=1,noexec,lowdata
global __pcstackBANK1
__pcstackBANK1:
	global	menu_handle_encoder@buf_1431
menu_handle_encoder@buf_1431:	; 50 bytes @ 0x0
	global	menu_handle_button@buf_1462
menu_handle_button@buf_1462:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_encoder@buf_1434
menu_handle_encoder@buf_1434:	; 50 bytes @ 0x32
	global	menu_handle_button@buf_1484
menu_handle_button@buf_1484:	; 50 bytes @ 0x32
	ds   50
	global	menu_handle_encoder@buf
menu_handle_encoder@buf:	; 50 bytes @ 0x64
	global	menu_handle_button@buf_1494
menu_handle_button@buf_1494:	; 50 bytes @ 0x64
	ds   50
	global	_menu_handle_encoder$1429
_menu_handle_encoder$1429:	; 2 bytes @ 0x96
	global	menu_handle_button@buf
menu_handle_button@buf:	; 50 bytes @ 0x96
	ds   2
	global	_menu_handle_encoder$1430
_menu_handle_encoder$1430:	; 2 bytes @ 0x98
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
	global	_menu_handle_button$1444
_menu_handle_button$1444:	; 2 bytes @ 0xC8
	ds   2
	global	_menu_handle_button$1445
_menu_handle_button$1445:	; 2 bytes @ 0xCA
	ds   2
	global	_menu_handle_button$1496
_menu_handle_button$1496:	; 2 bytes @ 0xCC
	ds   2
	global	menu_handle_button@edit_flag_1456
menu_handle_button@edit_flag_1456:	; 2 bytes @ 0xCE
	ds   2
	global	menu_handle_button@opts_1457
menu_handle_button@opts_1457:	; 2 bytes @ 0xD0
	ds   2
	global	menu_handle_button@edit_flag_1487
menu_handle_button@edit_flag_1487:	; 2 bytes @ 0xD2
	ds   2
	global	menu_handle_button@opts_1488
menu_handle_button@opts_1488:	; 2 bytes @ 0xD4
	ds   2
	global	menu_handle_button@current_val_1483
menu_handle_button@current_val_1483:	; 2 bytes @ 0xD6
	ds   2
	global	menu_handle_button@i
menu_handle_button@i:	; 1 bytes @ 0xD8
	ds   1
	global	menu_handle_button@opts
menu_handle_button@opts:	; 2 bytes @ 0xD9
	ds   2
	global	menu_handle_button@edit_flag
menu_handle_button@edit_flag:	; 2 bytes @ 0xDB
	ds   2
	global	menu_handle_button@press_type
menu_handle_button@press_type:	; 1 bytes @ 0xDD
	ds   1
	global	menu_handle_button@current_val
menu_handle_button@current_val:	; 2 bytes @ 0xDE
	ds   2
	global	menu_handle_button@new_seconds
menu_handle_button@new_seconds:	; 2 bytes @ 0xE0
	ds   2
	global	menu_handle_button@flow_type_1480
menu_handle_button@flow_type_1480:	; 1 bytes @ 0xE2
	ds   1
	global	menu_handle_button@flow_type
menu_handle_button@flow_type:	; 1 bytes @ 0xE3
	ds   1
	global	menu_handle_button@sensor_type_1479
menu_handle_button@sensor_type_1479:	; 1 bytes @ 0xE4
	ds   1
	global	menu_handle_button@sensor_type
menu_handle_button@sensor_type:	; 1 bytes @ 0xE5
	ds   1
	global	menu_handle_button@new_value
menu_handle_button@new_value:	; 2 bytes @ 0xE6
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
	global	_menu_update_edit_value$1250
_menu_update_edit_value$1250:	; 2 bytes @ 0x16
	ds   2
	global	_menu_update_edit_value$1254
_menu_update_edit_value$1254:	; 2 bytes @ 0x18
	ds   1
	global	menu_draw_input@start_pos
menu_draw_input@start_pos:	; 1 bytes @ 0x19
	ds   1
	global	menu_update_edit_value@start_col
menu_update_edit_value@start_col:	; 1 bytes @ 0x1A
	global	_menu_draw_input$1316
_menu_draw_input$1316:	; 2 bytes @ 0x1A
	ds   1
	global	menu_update_edit_value@blink_pos
menu_update_edit_value@blink_pos:	; 1 bytes @ 0x1B
	ds   1
	global	menu_update_edit_value@screen_line
menu_update_edit_value@screen_line:	; 1 bytes @ 0x1C
	global	_menu_draw_input$1320
_menu_draw_input$1320:	; 2 bytes @ 0x1C
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
	global	menu_draw_input@opts_1302
menu_draw_input@opts_1302:	; 2 bytes @ 0x24
	ds   2
	global	menu_draw_input@flag_1306
menu_draw_input@flag_1306:	; 2 bytes @ 0x26
	ds   2
	global	menu_draw_input@val_len_1310
menu_draw_input@val_len_1310:	; 1 bytes @ 0x28
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
	global	_handle_time_rotation$1109
_handle_time_rotation$1109:	; 2 bytes @ 0x32
	global	_rebuild_input_menu$1143
_rebuild_input_menu$1143:	; 2 bytes @ 0x32
	global	_handle_numeric_rotation$1239
_handle_numeric_rotation$1239:	; 2 bytes @ 0x32
	global	_rebuild_clock_menu$1376
_rebuild_clock_menu$1376:	; 2 bytes @ 0x32
	global	menu_update_time_value@debug_after
menu_update_time_value@debug_after:	; 50 bytes @ 0x32
	ds   2
	global	handle_time_rotation@direction
handle_time_rotation@direction:	; 1 bytes @ 0x34
	global	_rebuild_input_menu$1157
_rebuild_input_menu$1157:	; 2 bytes @ 0x34
	global	_handle_numeric_rotation$1241
_handle_numeric_rotation$1241:	; 2 bytes @ 0x34
	global	_rebuild_clock_menu$1382
_rebuild_clock_menu$1382:	; 2 bytes @ 0x34
	ds   2
	global	handle_numeric_rotation@max_tens
handle_numeric_rotation@max_tens:	; 1 bytes @ 0x36
	global	_rebuild_input_menu$1158
_rebuild_input_menu$1158:	; 2 bytes @ 0x36
	global	_rebuild_clock_menu$1383
_rebuild_clock_menu$1383:	; 2 bytes @ 0x36
	ds   1
	global	handle_numeric_rotation@max_units
handle_numeric_rotation@max_units:	; 1 bytes @ 0x37
	ds   1
	global	handle_numeric_rotation@direction
handle_numeric_rotation@direction:	; 1 bytes @ 0x38
	global	_rebuild_input_menu$1164
_rebuild_input_menu$1164:	; 2 bytes @ 0x38
	ds   2
	global	_rebuild_input_menu$1165
_rebuild_input_menu$1165:	; 2 bytes @ 0x3A
	ds   2
	global	_rebuild_input_menu$1171
_rebuild_input_menu$1171:	; 2 bytes @ 0x3C
	ds   2
	global	_rebuild_input_menu$1172
_rebuild_input_menu$1172:	; 2 bytes @ 0x3E
	ds   2
	global	_rebuild_input_menu$1176
_rebuild_input_menu$1176:	; 2 bytes @ 0x40
	ds   2
	global	_rebuild_input_menu$1190
_rebuild_input_menu$1190:	; 2 bytes @ 0x42
	ds   2
	global	_rebuild_input_menu$1191
_rebuild_input_menu$1191:	; 2 bytes @ 0x44
	ds   2
	global	_rebuild_input_menu$1195
_rebuild_input_menu$1195:	; 2 bytes @ 0x46
	ds   2
	global	_rebuild_input_menu$1200
_rebuild_input_menu$1200:	; 2 bytes @ 0x48
	ds   2
	global	_rebuild_input_menu$1204
_rebuild_input_menu$1204:	; 2 bytes @ 0x4A
	ds   2
	global	_rebuild_input_menu$1210
_rebuild_input_menu$1210:	; 2 bytes @ 0x4C
	ds   2
	global	_rebuild_input_menu$1211
_rebuild_input_menu$1211:	; 2 bytes @ 0x4E
	ds   2
	global	_rebuild_input_menu$1215
_rebuild_input_menu$1215:	; 2 bytes @ 0x50
	ds   2
	global	rebuild_input_menu@flow_type_val
rebuild_input_menu@flow_type_val:	; 1 bytes @ 0x52
	ds   1
	global	rebuild_input_menu@sensor
rebuild_input_menu@sensor:	; 1 bytes @ 0x53
	ds   1
	global	_rebuild_input_menu$2425
_rebuild_input_menu$2425:	; 2 bytes @ 0x54
	ds   2
	global	_rebuild_input_menu$2426
_rebuild_input_menu$2426:	; 2 bytes @ 0x56
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
?_get_menu_timeout_seconds:	; 1 bytes @ 0x0
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
?_menu_draw_clock:	; 1 bytes @ 0x0
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
	global	_isdigit$2170
_isdigit$2170:	; 1 bytes @ 0xF
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
	global	_is_numeric_field$1069
_is_numeric_field$1069:	; 1 bytes @ 0x10
	global	_is_time_field$1076
_is_time_field$1076:	; 1 bytes @ 0x10
	global	_is_option_field$1081
_is_option_field$1081:	; 1 bytes @ 0x10
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
	global	_is_numeric_field$1070
_is_numeric_field$1070:	; 1 bytes @ 0x11
	global	is_time_field@line
is_time_field@line:	; 1 bytes @ 0x11
	global	_is_option_field$1082
_is_option_field$1082:	; 1 bytes @ 0x11
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
	global	_is_numeric_field$1071
_is_numeric_field$1071:	; 1 bytes @ 0x12
	global	_is_option_field$1083
_is_option_field$1083:	; 1 bytes @ 0x12
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
	global	_is_option_field$1084
_is_option_field$1084:	; 1 bytes @ 0x13
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
	global	_menu_update_numeric_value$1265
_menu_update_numeric_value$1265:	; 2 bytes @ 0x16
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
	global	calculate_config_checksum@j_1644
calculate_config_checksum@j_1644:	; 2 bytes @ 0x17
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
	global	_menu_update_numeric_value$1266
_menu_update_numeric_value$1266:	; 2 bytes @ 0x18
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
	global	_menu_update_numeric_value$1267
_menu_update_numeric_value$1267:	; 2 bytes @ 0x1A
	global	sprintf@sp
sprintf@sp:	; 2 bytes @ 0x1A
	ds   1
??_save_current_config:	; 1 bytes @ 0x1B
	global	save_current_config@checksum
save_current_config@checksum:	; 2 bytes @ 0x1B
	ds   1
??_init_numeric_editor:	; 1 bytes @ 0x1C
	global	_menu_update_numeric_value$1268
_menu_update_numeric_value$1268:	; 2 bytes @ 0x1C
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
	global	_menu_update_numeric_value$1269
_menu_update_numeric_value$1269:	; 2 bytes @ 0x1E
	global	eeprom_init@stored_checksum
eeprom_init@stored_checksum:	; 2 bytes @ 0x1E
	ds   1
	global	_init_numeric_editor$1229
_init_numeric_editor$1229:	; 2 bytes @ 0x1F
	ds   1
	global	_menu_update_numeric_value$1270
_menu_update_numeric_value$1270:	; 2 bytes @ 0x20
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
	global	_menu_update_numeric_value$1271
_menu_update_numeric_value$1271:	; 2 bytes @ 0x22
	global	_menu_draw_setup$1340
_menu_draw_setup$1340:	; 2 bytes @ 0x22
	ds   2
	global	_menu_update_numeric_value$1272
_menu_update_numeric_value$1272:	; 2 bytes @ 0x24
	global	_menu_draw_setup$1346
_menu_draw_setup$1346:	; 2 bytes @ 0x24
	ds   2
??_sprintf:	; 1 bytes @ 0x26
	global	_menu_update_numeric_value$1274
_menu_update_numeric_value$1274:	; 2 bytes @ 0x26
	global	_menu_draw_setup$1367
_menu_draw_setup$1367:	; 2 bytes @ 0x26
	ds   2
	global	menu_draw_setup@label
menu_draw_setup@label:	; 2 bytes @ 0x28
	global	menu_update_numeric_value@value_buf
menu_update_numeric_value@value_buf:	; 6 bytes @ 0x28
	ds   1
	global	_sprintf$1729
_sprintf$1729:	; 2 bytes @ 0x29
	ds   1
	global	menu_draw_setup@sensor
menu_draw_setup@sensor:	; 1 bytes @ 0x2A
	ds   1
	global	menu_draw_setup@sensor_name
menu_draw_setup@sensor_name:	; 2 bytes @ 0x2B
	global	_sprintf$1730
_sprintf$1730:	; 2 bytes @ 0x2B
	ds   1
	global	menu_draw_clock@start_pos
menu_draw_clock@start_pos:	; 1 bytes @ 0x2C
	ds   1
	global	menu_draw_setup@item_idx
menu_draw_setup@item_idx:	; 1 bytes @ 0x2D
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x2D
	global	_menu_draw_clock$1404
_menu_draw_clock$1404:	; 2 bytes @ 0x2D
	ds   1
	global	menu_update_numeric_value@start_col
menu_update_numeric_value@start_col:	; 1 bytes @ 0x2E
	global	menu_draw_setup@i
menu_draw_setup@i:	; 1 bytes @ 0x2E
	global	sprintf@cp
sprintf@cp:	; 2 bytes @ 0x2E
	ds   1
	global	menu_update_numeric_value@screen_line
menu_update_numeric_value@screen_line:	; 1 bytes @ 0x2F
	global	_menu_draw_clock$1408
_menu_draw_clock$1408:	; 2 bytes @ 0x2F
	ds   1
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x30
	ds   1
	global	menu_draw_clock@val_len
menu_draw_clock@val_len:	; 1 bytes @ 0x31
	global	sprintf@val
sprintf@val:	; 2 bytes @ 0x31
	ds   1
	global	menu_draw_clock@j
menu_draw_clock@j:	; 1 bytes @ 0x32
	ds   1
	global	menu_draw_clock@val_len_1398
menu_draw_clock@val_len_1398:	; 1 bytes @ 0x33
	global	sprintf@len
sprintf@len:	; 2 bytes @ 0x33
	ds   1
	global	menu_draw_clock@show_brackets
menu_draw_clock@show_brackets:	; 1 bytes @ 0x34
	ds   1
	global	menu_draw_clock@item_idx
menu_draw_clock@item_idx:	; 1 bytes @ 0x35
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x35
	ds   1
	global	menu_draw_clock@i
menu_draw_clock@i:	; 1 bytes @ 0x36
	global	sprintf@width
sprintf@width:	; 2 bytes @ 0x36
	ds   2
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
;!    Strings     1850
;!    Constant    852
;!    Data        285
;!    BSS         677
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126     72     102
;!    BANK0           128    110     125
;!    BANK1           256    232     252
;!    BANK2           256     82     247
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
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), STR_69(CODE[10]), 
;!		 -> STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), STR_73(CODE[13]), 
;!		 -> STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), STR_81(CODE[7]), 
;!		 -> STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), STR_85(CODE[10]), 
;!		 -> STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), STR_89(CODE[5]), 
;!		 -> STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), STR_97(CODE[5]), 
;!		 -> STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    clock_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    clock_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), STR_69(CODE[10]), 
;!		 -> STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), STR_73(CODE[13]), 
;!		 -> STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), STR_81(CODE[7]), 
;!		 -> STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), STR_85(CODE[10]), 
;!		 -> STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), STR_89(CODE[5]), 
;!		 -> STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), STR_97(CODE[5]), 
;!		 -> STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    clock_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
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
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), STR_69(CODE[10]), 
;!		 -> STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), STR_73(CODE[13]), 
;!		 -> STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), STR_81(CODE[7]), 
;!		 -> STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), STR_85(CODE[10]), 
;!		 -> STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), STR_89(CODE[5]), 
;!		 -> STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), STR_97(CODE[5]), 
;!		 -> STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    flow_analog_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    flow_digital_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), STR_69(CODE[10]), 
;!		 -> STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), STR_73(CODE[13]), 
;!		 -> STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), STR_81(CODE[7]), 
;!		 -> STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), STR_85(CODE[10]), 
;!		 -> STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), STR_89(CODE[5]), 
;!		 -> STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), STR_97(CODE[5]), 
;!		 -> STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    flow_digital_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    input_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), STR_69(CODE[10]), 
;!		 -> STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), STR_73(CODE[13]), 
;!		 -> STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), STR_81(CODE[7]), 
;!		 -> STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), STR_85(CODE[10]), 
;!		 -> STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), STR_89(CODE[5]), 
;!		 -> STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), STR_97(CODE[5]), 
;!		 -> STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    lcd_print@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> Fake(UNKNOWN), menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), 
;!		 -> menu_update_edit_value@display_buf(BANK0[10]), menu_update_numeric_value@value_buf(COMRAM[6]), menu_update_time_value@value_buf(BANK0[6]), STR_100(CODE[5]), 
;!		 -> STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), STR_104(CODE[9]), 
;!		 -> STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), STR_108(CODE[5]), 
;!		 -> STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[8]), STR_112(CODE[5]), 
;!		 -> STR_119(CODE[8]), STR_120(CODE[2]), STR_121(CODE[2]), STR_122(CODE[21]), 
;!		 -> STR_16(CODE[12]), STR_17(CODE[6]), STR_176(CODE[7]), STR_177(CODE[2]), 
;!		 -> STR_178(CODE[2]), STR_179(CODE[6]), STR_180(CODE[2]), STR_181(CODE[2]), 
;!		 -> STR_182(CODE[21]), STR_183(CODE[2]), STR_184(CODE[2]), STR_188(CODE[2]), 
;!		 -> STR_189(CODE[2]), STR_190(CODE[2]), STR_191(CODE[2]), STR_192(CODE[21]), 
;!		 -> STR_193(CODE[1]), STR_194(CODE[1]), STR_195(CODE[1]), STR_196(CODE[6]), 
;!		 -> STR_197(CODE[5]), STR_198(CODE[9]), STR_199(CODE[5]), STR_200(CODE[5]), 
;!		 -> STR_201(CODE[2]), STR_202(CODE[2]), STR_203(CODE[2]), STR_204(CODE[2]), 
;!		 -> STR_205(CODE[2]), STR_206(CODE[2]), STR_207(CODE[2]), STR_208(CODE[2]), 
;!		 -> STR_219(CODE[6]), STR_22(CODE[12]), STR_221(CODE[2]), STR_222(CODE[2]), 
;!		 -> STR_223(CODE[2]), STR_224(CODE[2]), STR_23(CODE[8]), STR_3(CODE[13]), 
;!		 -> STR_4(CODE[16]), STR_62(CODE[10]), STR_63(CODE[11]), STR_64(CODE[13]), 
;!		 -> STR_65(CODE[6]), STR_66(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), 
;!		 -> STR_69(CODE[10]), STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), 
;!		 -> STR_73(CODE[13]), STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), 
;!		 -> STR_77(CODE[8]), STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), 
;!		 -> STR_81(CODE[7]), STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), 
;!		 -> STR_85(CODE[10]), STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), 
;!		 -> STR_89(CODE[5]), STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), 
;!		 -> STR_93(CODE[8]), STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), 
;!		 -> STR_97(CODE[5]), STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    lcd_print_at@str	PTR const unsigned char  size(2) Largest target is 15
;!		 -> Fake(UNKNOWN), menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), 
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_193(CODE[1]), STR_194(CODE[1]), STR_195(CODE[1]), 
;!		 -> STR_196(CODE[6]), STR_197(CODE[5]), STR_198(CODE[9]), STR_199(CODE[5]), 
;!		 -> STR_200(CODE[5]), STR_219(CODE[6]), STR_62(CODE[10]), STR_63(CODE[11]), 
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
;!    memcpy@d	PTR unsigned char  size(2) Largest target is 384
;!		 -> clock_menu(BANK1[20]), input_config(BIGRAM[384]), input_menu(BANK2[75]), system_config(BANK4[128]), 
;!
;!    memcpy@d1	PTR void  size(2) Largest target is 384
;!		 -> clock_menu(BANK1[20]), input_config(BIGRAM[384]), input_menu(BANK2[75]), system_config(BANK4[128]), 
;!
;!    memcpy@s	PTR const unsigned char  size(2) Largest target is 384
;!		 -> clock_menu_template(CODE[20]), factory_defaults(CODE[384]), flow_analog_template(CODE[55]), flow_digital_template(CODE[40]), 
;!		 -> pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    memcpy@s1	PTR const void  size(2) Largest target is 384
;!		 -> clock_menu_template(CODE[20]), factory_defaults(CODE[384]), flow_analog_template(CODE[55]), flow_digital_template(CODE[40]), 
;!		 -> pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    menu_draw_clock$1404	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_221(CODE[2]), STR_222(CODE[2]), 
;!
;!    menu_draw_clock$1408	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_223(CODE[2]), STR_224(CODE[2]), 
;!
;!    menu_draw_input$1316	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_188(CODE[2]), STR_189(CODE[2]), 
;!
;!    menu_draw_input$1320	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_190(CODE[2]), STR_191(CODE[2]), 
;!
;!    menu_draw_input@flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_draw_input@flag_1306	PTR unsigned char  size(2) Largest target is 1
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
;!    menu_draw_input@opts_1302	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts_1302$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    menu_draw_setup$1340	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_199(CODE[5]), STR_200(CODE[5]), 
;!
;!    menu_draw_setup$1346	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_203(CODE[2]), STR_204(CODE[2]), 
;!
;!    menu_draw_setup$1367	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_207(CODE[2]), STR_208(CODE[2]), 
;!
;!    menu_draw_setup@F2641	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_193(CODE[1]), STR_194(CODE[1]), STR_195(CODE[1]), STR_196(CODE[6]), 
;!		 -> STR_197(CODE[5]), 
;!
;!    menu_draw_setup@label	PTR const unsigned char  size(2) Largest target is 6
;!		 -> STR_193(CODE[1]), STR_194(CODE[1]), STR_195(CODE[1]), STR_196(CODE[6]), 
;!		 -> STR_197(CODE[5]), 
;!
;!    menu_draw_setup@sensor_name	PTR const unsigned char  size(2) Largest target is 9
;!		 -> Fake(UNKNOWN), STR_198(CODE[9]), STR_199(CODE[5]), STR_200(CODE[5]), 
;!
;!    menu_draw_setup@setup_labels	PTR const unsigned char [5] size(2) Largest target is 6
;!		 -> STR_193(CODE[1]), STR_194(CODE[1]), STR_195(CODE[1]), STR_196(CODE[6]), 
;!		 -> STR_197(CODE[5]), 
;!
;!    menu_handle_button@edit_flag	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1456	PTR unsigned char  size(2) Largest target is 1
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), flow_type_edit_flag(COMRAM[1]), flow_units_edit_flag(COMRAM[1]), 
;!		 -> no_flow_edit_flag(COMRAM[1]), relay_high_edit_flag(COMRAM[1]), relay_low_edit_flag(COMRAM[1]), relay_plp_edit_flag(COMRAM[1]), 
;!		 -> relay_slp_edit_flag(COMRAM[1]), sensor_edit_flag(COMRAM[1]), NULL(NULL[0]), 
;!
;!    menu_handle_button@edit_flag_1487	PTR unsigned char  size(2) Largest target is 1
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
;!    menu_handle_button@opts_1457	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1457$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    menu_handle_button@opts_1488	PTR const struct . size(2) Largest target is 119
;!		 -> menu_item_options(CODE[84]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1488$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    menu_handle_encoder$2427	const PTR const unsigned char  size(2) Largest target is 9
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
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), STR_69(CODE[10]), 
;!		 -> STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), STR_73(CODE[13]), 
;!		 -> STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), STR_81(CODE[7]), 
;!		 -> STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), STR_85(CODE[10]), 
;!		 -> STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), STR_89(CODE[5]), 
;!		 -> STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), STR_97(CODE[5]), 
;!		 -> STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    pressure_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    rebuild_clock_menu$1376	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_211(CODE[8]), STR_212(CODE[9]), 
;!
;!    rebuild_clock_menu$1382	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_213(CODE[6]), STR_214(CODE[6]), STR_215(CODE[9]), 
;!
;!    rebuild_clock_menu$1383	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_214(CODE[6]), STR_215(CODE[9]), 
;!
;!    rebuild_input_menu$1143	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_124(CODE[8]), STR_125(CODE[9]), 
;!
;!    rebuild_input_menu$1157	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_134(CODE[6]), STR_135(CODE[6]), STR_136(CODE[9]), 
;!
;!    rebuild_input_menu$1158	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_135(CODE[6]), STR_136(CODE[9]), 
;!
;!    rebuild_input_menu$1164	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_137(CODE[6]), STR_138(CODE[6]), STR_139(CODE[9]), 
;!
;!    rebuild_input_menu$1165	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_138(CODE[6]), STR_139(CODE[9]), 
;!
;!    rebuild_input_menu$1171	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_140(CODE[6]), STR_141(CODE[6]), STR_142(CODE[9]), 
;!
;!    rebuild_input_menu$1172	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_141(CODE[6]), STR_142(CODE[9]), 
;!
;!    rebuild_input_menu$1176	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_143(CODE[5]), STR_144(CODE[5]), 
;!
;!    rebuild_input_menu$1190	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_150(CODE[6]), STR_151(CODE[6]), STR_152(CODE[9]), 
;!
;!    rebuild_input_menu$1191	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_151(CODE[6]), STR_152(CODE[9]), 
;!
;!    rebuild_input_menu$1195	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_153(CODE[5]), STR_154(CODE[5]), 
;!
;!    rebuild_input_menu$1200	PTR const unsigned char  size(2) Largest target is 8
;!		 -> STR_156(CODE[7]), STR_157(CODE[8]), 
;!
;!    rebuild_input_menu$1204	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_158(CODE[5]), STR_159(CODE[5]), 
;!
;!    rebuild_input_menu$1210	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_160(CODE[6]), STR_161(CODE[6]), STR_162(CODE[9]), 
;!
;!    rebuild_input_menu$1211	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_161(CODE[6]), STR_162(CODE[9]), 
;!
;!    rebuild_input_menu$1215	PTR const unsigned char  size(2) Largest target is 4
;!		 -> STR_163(CODE[2]), STR_164(CODE[4]), 
;!
;!    S831$options	PTR const unsigned char [5] size(2) Largest target is 9
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
;!    S835$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), STR_69(CODE[10]), 
;!		 -> STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), STR_73(CODE[13]), 
;!		 -> STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), STR_81(CODE[7]), 
;!		 -> STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), STR_85(CODE[10]), 
;!		 -> STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), STR_89(CODE[5]), 
;!		 -> STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), STR_97(CODE[5]), 
;!		 -> STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    S835$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
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
;!		 -> clock_menu(BANK1[20]), input_config(BIGRAM[384]), input_menu(BANK2[75]), system_config(BANK4[128]), 
;!
;!    sp__strcpy	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK3[10]), 
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 12
;!		 -> display_edit_flag(COMRAM[1]), enable_edit_flag(COMRAM[1]), menu_item_options$option_count(CODE[1]), menu_update_time_value@value_buf(BANK0[6]), 
;!		 -> relay_high_edit_flag(COMRAM[1]), ?_sprintf(COMRAM[2]), sprintf@c(COMRAM[1]), STR_124(CODE[8]), 
;!		 -> STR_125(CODE[9]), STR_211(CODE[8]), STR_212(CODE[9]), STR_257(CODE[7]), 
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
;!		 -> value_plpbp(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), 
;!		 -> value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), value_sensor(BANK2[12]), 
;!		 -> value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 51
;!		 -> STR_11(CODE[23]), STR_113(CODE[35]), STR_115(CODE[45]), STR_116(CODE[25]), 
;!		 -> STR_117(CODE[51]), STR_118(CODE[27]), STR_12(CODE[17]), STR_123(CODE[3]), 
;!		 -> STR_127(CODE[6]), STR_128(CODE[6]), STR_129(CODE[5]), STR_130(CODE[10]), 
;!		 -> STR_131(CODE[5]), STR_132(CODE[10]), STR_133(CODE[10]), STR_146(CODE[6]), 
;!		 -> STR_147(CODE[6]), STR_148(CODE[3]), STR_149(CODE[10]), STR_165(CODE[6]), 
;!		 -> STR_166(CODE[6]), STR_167(CODE[5]), STR_168(CODE[10]), STR_170(CODE[10]), 
;!		 -> STR_171(CODE[48]), STR_173(CODE[29]), STR_174(CODE[7]), STR_175(CODE[9]), 
;!		 -> STR_185(CODE[9]), STR_209(CODE[35]), STR_210(CODE[3]), STR_217(CODE[34]), 
;!		 -> STR_218(CODE[29]), STR_225(CODE[37]), STR_226(CODE[23]), STR_227(CODE[32]), 
;!		 -> STR_228(CODE[37]), STR_229(CODE[28]), STR_230(CODE[35]), STR_231(CODE[26]), 
;!		 -> STR_232(CODE[36]), STR_233(CODE[25]), STR_234(CODE[28]), STR_235(CODE[42]), 
;!		 -> STR_236(CODE[26]), STR_237(CODE[10]), STR_239(CODE[6]), STR_240(CODE[6]), 
;!		 -> STR_241(CODE[5]), STR_242(CODE[5]), STR_243(CODE[6]), STR_244(CODE[6]), 
;!		 -> STR_245(CODE[5]), STR_246(CODE[6]), STR_247(CODE[6]), STR_248(CODE[5]), 
;!		 -> STR_249(CODE[38]), STR_250(CODE[32]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK2[40]), 
;!		 -> main@buf_623(BANK2[30]), menu_draw_input@title(BANK0[10]), menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1462(BANK1[50]), 
;!		 -> menu_handle_button@buf_1484(BANK1[50]), menu_handle_button@buf_1494(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1431(BANK1[50]), 
;!		 -> menu_handle_encoder@buf_1434(BANK1[50]), menu_update_edit_value@value_buf(BANK0[10]), menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), 
;!		 -> rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), value_back(BANK0[5]), value_clock_display(BANK3[10]), 
;!		 -> value_clock_enable(BANK3[10]), value_display(BANK0[10]), value_enable(BANK2[10]), value_end_runtime(BANK3[10]), 
;!		 -> value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), 
;!		 -> value_high_temp(BANK3[10]), value_highbp(BANK3[10]), value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), 
;!		 -> value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), 
;!		 -> value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), 
;!		 -> value_scale20(BANK2[10]), value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_187(CODE[1]), STR_220(CODE[1]), STR_252(CODE[8]), STR_253(CODE[6]), 
;!		 -> STR_254(CODE[6]), STR_255(CODE[5]), STR_27(CODE[9]), STR_28(CODE[8]), 
;!		 -> STR_29(CODE[1]), STR_30(CODE[1]), STR_31(CODE[1]), STR_32(CODE[9]), 
;!		 -> STR_33(CODE[5]), STR_34(CODE[5]), STR_35(CODE[1]), STR_36(CODE[1]), 
;!		 -> STR_37(CODE[7]), STR_38(CODE[8]), STR_39(CODE[1]), STR_40(CODE[1]), 
;!		 -> STR_41(CODE[1]), STR_42(CODE[4]), STR_43(CODE[5]), STR_44(CODE[1]), 
;!		 -> STR_45(CODE[1]), STR_46(CODE[1]), STR_47(CODE[2]), STR_48(CODE[4]), 
;!		 -> STR_49(CODE[1]), STR_50(CODE[1]), STR_51(CODE[1]), STR_52(CODE[5]), 
;!		 -> STR_53(CODE[5]), STR_54(CODE[1]), STR_55(CODE[1]), STR_56(CODE[1]), 
;!		 -> STR_57(CODE[6]), STR_58(CODE[6]), STR_59(CODE[9]), STR_60(CODE[1]), 
;!		 -> STR_61(CODE[1]), 
;!
;!    strcpy@cp	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK3[10]), 
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 12
;!		 -> menu_update_edit_value@value_buf(BANK0[10]), STR_126(CODE[9]), STR_134(CODE[6]), STR_135(CODE[6]), 
;!		 -> STR_136(CODE[9]), STR_137(CODE[6]), STR_138(CODE[6]), STR_139(CODE[9]), 
;!		 -> STR_140(CODE[6]), STR_141(CODE[6]), STR_142(CODE[9]), STR_143(CODE[5]), 
;!		 -> STR_144(CODE[5]), STR_145(CODE[5]), STR_150(CODE[6]), STR_151(CODE[6]), 
;!		 -> STR_152(CODE[9]), STR_153(CODE[5]), STR_154(CODE[5]), STR_155(CODE[5]), 
;!		 -> STR_156(CODE[7]), STR_157(CODE[8]), STR_158(CODE[5]), STR_159(CODE[5]), 
;!		 -> STR_160(CODE[6]), STR_161(CODE[6]), STR_162(CODE[9]), STR_163(CODE[2]), 
;!		 -> STR_164(CODE[4]), STR_169(CODE[4]), STR_186(CODE[6]), STR_213(CODE[6]), 
;!		 -> STR_214(CODE[6]), STR_215(CODE[9]), STR_216(CODE[5]), STR_27(CODE[9]), 
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
;!		 -> value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), 
;!		 -> value_scale20(BANK2[10]), value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcpy@to	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_clock@value_buf(COMRAM[15]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@display_buf(BANK0[10]), original_value(BANK3[10]), 
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
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
;!		 -> value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), 
;!		 -> value_scale20(BANK2[10]), value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), 
;!		 -> NULL(NULL[0]), 
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
;!		 -> value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), 
;!		 -> value_scale20(BANK2[10]), value_scale4(BANK2[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    temp_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_100(CODE[5]), STR_101(CODE[6]), STR_102(CODE[10]), STR_103(CODE[11]), 
;!		 -> STR_104(CODE[9]), STR_105(CODE[12]), STR_106(CODE[8]), STR_107(CODE[8]), 
;!		 -> STR_108(CODE[5]), STR_109(CODE[7]), STR_110(CODE[8]), STR_111(CODE[8]), 
;!		 -> STR_112(CODE[5]), STR_67(CODE[7]), STR_68(CODE[7]), STR_69(CODE[10]), 
;!		 -> STR_70(CODE[11]), STR_71(CODE[12]), STR_72(CODE[9]), STR_73(CODE[13]), 
;!		 -> STR_74(CODE[6]), STR_75(CODE[6]), STR_76(CODE[9]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[8]), STR_80(CODE[5]), STR_81(CODE[7]), 
;!		 -> STR_82(CODE[7]), STR_83(CODE[10]), STR_84(CODE[11]), STR_85(CODE[10]), 
;!		 -> STR_86(CODE[9]), STR_87(CODE[9]), STR_88(CODE[8]), STR_89(CODE[5]), 
;!		 -> STR_90(CODE[7]), STR_91(CODE[7]), STR_92(CODE[5]), STR_93(CODE[8]), 
;!		 -> STR_94(CODE[11]), STR_95(CODE[8]), STR_96(CODE[8]), STR_97(CODE[5]), 
;!		 -> STR_98(CODE[7]), STR_99(CODE[7]), 
;!
;!    temp_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(BANK0[5]), value_clock_display(BANK3[10]), value_clock_enable(BANK3[10]), value_display(BANK0[10]), 
;!		 -> value_enable(BANK2[10]), value_end_runtime(BANK3[10]), value_flow_type(BANK3[10]), value_flow_units(BANK3[10]), 
;!		 -> value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK3[10]), 
;!		 -> value_low_flow(BANK3[10]), value_low_flow_bp(BANK3[10]), value_low_pressure(BANK3[10]), value_no_flow(BANK3[10]), 
;!		 -> value_no_flow_bp(BANK3[10]), value_plpbp(BANK3[10]), value_rlyhigh(BANK3[10]), value_rlylow(BANK3[10]), 
;!		 -> value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), value_scale4(BANK2[10]), 
;!		 -> value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK2[40]), 
;!		 -> main@buf_623(BANK2[30]), menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1462(BANK1[50]), menu_handle_button@buf_1484(BANK1[50]), 
;!		 -> menu_handle_button@buf_1494(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1431(BANK1[50]), menu_handle_encoder@buf_1434(BANK1[50]), 
;!		 -> menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), 
;!		 -> STR_1(CODE[28]), STR_10(CODE[19]), STR_114(CODE[29]), STR_13(CODE[20]), 
;!		 -> STR_14(CODE[15]), STR_15(CODE[26]), STR_172(CODE[31]), STR_18(CODE[22]), 
;!		 -> STR_19(CODE[20]), STR_2(CODE[23]), STR_20(CODE[21]), STR_21(CODE[33]), 
;!		 -> STR_238(CODE[27]), STR_24(CODE[36]), STR_25(CODE[20]), STR_251(CODE[25]), 
;!		 -> STR_256(CODE[20]), STR_26(CODE[21]), STR_5(CODE[22]), STR_6(CODE[19]), 
;!		 -> STR_7(CODE[24]), STR_8(CODE[22]), STR_9(CODE[22]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK2[40]), 
;!		 -> main@buf_623(BANK2[30]), menu_handle_button@buf(BANK1[50]), menu_handle_button@buf_1462(BANK1[50]), menu_handle_button@buf_1484(BANK1[50]), 
;!		 -> menu_handle_button@buf_1494(BANK1[50]), menu_handle_encoder@buf(BANK1[50]), menu_handle_encoder@buf_1431(BANK1[50]), menu_handle_encoder@buf_1434(BANK1[50]), 
;!		 -> menu_update_time_value@debug_after(BANK0[50]), menu_update_time_value@debug_before(BANK0[50]), rebuild_clock_menu@buf(BANK0[50]), rebuild_input_menu@buf(BANK0[50]), 
;!		 -> STR_1(CODE[28]), STR_10(CODE[19]), STR_114(CODE[29]), STR_13(CODE[20]), 
;!		 -> STR_14(CODE[15]), STR_15(CODE[26]), STR_172(CODE[31]), STR_18(CODE[22]), 
;!		 -> STR_19(CODE[20]), STR_2(CODE[23]), STR_20(CODE[21]), STR_21(CODE[33]), 
;!		 -> STR_238(CODE[27]), STR_24(CODE[36]), STR_25(CODE[20]), STR_251(CODE[25]), 
;!		 -> STR_256(CODE[20]), STR_26(CODE[21]), STR_5(CODE[22]), STR_6(CODE[19]), 
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
;!    _menu_draw_setup->_lcd_print_at
;!    _menu_draw_options->_lcd_print_at
;!    _lcd_clear->_lcd_cmd
;!    _menu_draw_input->_sprintf
;!    _menu_draw_clock->_lcd_print_at
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
;!    _menu_handle_encoder->_handle_numeric_rotation
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
;! (0) _main                                                84    84      0  799405
;!                                             70 COMRAM     2     2      0
;!                                              0 BANK2     82    82      0
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
;! (1) _menu_update_numeric_value                           28    28      0    9219
;!                                             20 COMRAM    28    28      0
;!                   _is_numeric_field
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_edit_value                              31    31      0   35021
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
;! (1) _menu_handle_encoder                                172   170      2  215414
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
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _handle_time_rotation                                53    53      0   23779
;!                                              0 BANK0     53    53      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _handle_numeric_rotation                             57    57      0   24132
;!                                              0 BANK0     57    57      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                 237   237      0  313097
;!                                             62 COMRAM     5     5      0
;!                                              0 BANK1    232   232      0
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
;! (2) _rebuild_input_menu                                  90    90      0   38530
;!                                             57 COMRAM     1     1      0
;!                                              0 BANK0     89    89      0
;!                            ___lwdiv
;!                            ___lwmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_clock_menu                                  56    56      0   31430
;!                                              0 BANK0     56    56      0
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_time_value                             111   111      0   32632
;!                                              0 BANK0    110   110      0
;!                            ___lbdiv
;!                            ___lbmod
;!                      _is_time_field
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) ___lbmod                                              4     3      1     311
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) ___lbdiv                                              4     3      1     314
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_setup                                     23    23      0   21466
;!                                             24 COMRAM    23    23      0
;!                          _lcd_clear
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_options                                    2     2      0   20872
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
;! (2) _menu_draw_input                                     51    51      0   57035
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
;! (2) _menu_draw_clock                                     31    31      0   29069
;!                                             24 COMRAM    31    31      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;!                             _strcmp
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (2) _strlen                                               4     2      2     580
;!                                             14 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (2) _strcpy                                               6     2      4    5869
;!                                             14 COMRAM     6     2      4
;! ---------------------------------------------------------------------------------
;! (3) _strcmp                                               7     3      4    1155
;!                                             14 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (3) _lcd_print_at                                         4     1      3    7900
;!                                             20 COMRAM     4     1      3
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_clear_line                                       1     1      0    6218
;!                                             20 COMRAM     1     1      0
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _lcd_set_cursor                                       3     2      1    2426
;!                                             17 COMRAM     3     2      1
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (2) _lcd_print                                            2     0      2    3761
;!                                             16 COMRAM     2     0      2
;!                           _lcd_data
;! ---------------------------------------------------------------------------------
;! (3) _lcd_data                                             1     1      0     186
;!                                             15 COMRAM     1     1      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (2) _init_time_editor                                    63    60      3   28918
;!                                             57 COMRAM     3     0      3
;!                                              0 BANK0     60    60      0
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    3911
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
;! (1) _sprintf                                             35    23     12   19542
;!                                             26 COMRAM    31    19     12
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
;! (2) _beep                                                 5     3      2    1794
;!                                             14 COMRAM     5     3      2
;! ---------------------------------------------------------------------------------
;! (1) _lcd_init                                             2     2      0     372
;!                                             17 COMRAM     2     2      0
;!                            _lcd_cmd
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (3) _lcd_cmd                                              2     2      0     248
;!                                             15 COMRAM     2     2      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (4) _lcd_write_nibble                                     1     1      0     124
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
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (7) _isr                                                  9     9      0     390
;!                                              5 COMRAM     9     9      0
;!                          i2___lwmod
;! ---------------------------------------------------------------------------------
;! (8) i2___lwmod                                            5     1      4     211
;!                                              0 COMRAM     5     1      4
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 8
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
;!       ___lwdiv
;!         ___lwmod (ARG)
;!       ___lwmod
;!       ___wmul
;!       _isdigit
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
;!   _menu_draw_input
;!     _get_item_options_for_field
;!     _get_option_edit_flag
;!     _is_numeric_field
;!     _is_option_field
;!     _is_time_field
;!     _lcd_clear_line
;!       _lcd_print
;!       _lcd_set_cursor
;!     _lcd_print
;!     _lcd_print_at
;!       _lcd_print
;!       _lcd_set_cursor
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
;!       _lcd_clear_line
;!       _lcd_print
;!       _lcd_print_at
;!       _lcd_set_cursor
;!       _strcmp
;!       _strcpy
;!       _strlen
;!     _menu_draw_input
;!     _menu_draw_options
;!     _menu_draw_setup
;!     _menu_update_time_value
;!       ___lbdiv
;!       ___lbmod
;!       _is_time_field
;!       _lcd_print
;!       _lcd_set_cursor
;!       _sprintf
;!       _uart_println
;!     _rebuild_clock_menu
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
;!BANK4              100      0      80      13       50.0%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100      0      DC      11       85.9%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100     52      F7       9       96.5%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100     E8      FC       7       98.4%
;!BITBANK15           80      0       0      34        0.0%
;!BANK15              80      0       0      35        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80     6E      7D       5       97.7%
;!BITCOMRAM           7E      0       0       0        0.0%
;!COMRAM              7E     48      66       1       81.0%
;!BITBIGSFRhhhhlh     1A      0       0      37        0.0%
;!BITBIGSFRhhhlh      11      0       0      39        0.0%
;!BITBIGSFRhhhhh       D      0       0      36        0.0%
;!BITBIGSFRhlhll       A      0       0      43        0.0%
;!BITBIGSFRhhhll       8      0       0      40        0.0%
;!BITBIGSFRhhlh        7      0       0      41        0.0%
;!BITBIGSFRlh          6      0       0      45        0.0%
;!BITBIGSFRhll         6      0       0      44        0.0%
;!BITBIGSFRll          6      0       0      46        0.0%
;!BITBIGSFRhhhhll      1      0       0      38        0.0%
;!BITBIGSFRhhll        1      0       0      42        0.0%
;!BIGSFR               0      0       0     200        0.0%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0     432      47        0.0%
;!DATA                 0      0     5B2       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 247 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  flow_type       1   76[BANK2 ] unsigned char 
;;  sensor_type     1   75[BANK2 ] unsigned char 
;;  buf            30   40[BANK2 ] unsigned char [30]
;;  current_even    1   79[BANK2 ] unsigned char 
;;  flow_type       1   74[BANK2 ] unsigned char 
;;  sensor_type     1   73[BANK2 ] unsigned char 
;;  flow_type       1   72[BANK2 ] unsigned char 
;;  sensor_type     1   71[BANK2 ] unsigned char 
;;  buf            40    0[BANK2 ] unsigned char [40]
;;  delta           2   80[BANK2 ] int 
;;  last_encoder    2   77[BANK2 ] int 
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
;;      Locals:         0       0       0      82       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0      82       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       84 bytes
;; Hardware stack levels required when called: 8
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
	line	247
global __ptext0
__ptext0:
psect	text0
	file	"src\main.c"
	line	247
	
_main:
;incstack = 0
	callstack 23
	line	250
	
l11054:
	call	_system_init	;wreg free
	line	251
	
l11056:
	call	_eeprom_init	;wreg free
	line	258
	
l11058:; BSR set to: 4

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
	line	260
	
l11060:
	call	_uart_init	;wreg free
	line	261
	
l11062:
	call	_encoder_init	;wreg free
	line	262
	
l11064:
	call	_menu_init	;wreg free
	line	263
	
l11066:; BSR set to: 2

	call	_lcd_init	;wreg free
	line	265
	
l11068:
		movlw	low(STR_1)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_1)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	266
	
l11070:
		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	268
	
l11072:
	call	_lcd_clear	;wreg free
	line	269
	
l11074:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	270
	
l11076:
		movlw	low(STR_3)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_3)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	271
	
l11078:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	272
	
l11080:
		movlw	low(STR_4)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_4)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	274
	
l11082:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	275
	
l11084:
		movlw	low(STR_6)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_6)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	276
	
l11086:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	278
	
l11088:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	279
	
l11090:
	asmopt push
asmopt off
movlw  5
movwf	(??_main+0+0+1)^00h,c
movlw	15
movwf	(??_main+0+0)^00h,c
	movlw	241
u15547:
decfsz	wreg,f
	bra	u15547
	decfsz	(??_main+0+0)^00h,c,f
	bra	u15547
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u15547
	nop
asmopt pop

	line	280
	
l11092:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	282
	
l11094:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	283
	
l11096:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	285
	
l11098:
	asmopt push
asmopt off
movlw  41
movwf	(??_main+0+0+1)^00h,c
movlw	150
movwf	(??_main+0+0)^00h,c
	movlw	127
u15557:
decfsz	wreg,f
	bra	u15557
	decfsz	(??_main+0+0)^00h,c,f
	bra	u15557
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u15557
	nop
asmopt pop

	line	289
	
l11100:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	290
	
l11102:; BSR set to: 2

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	292
	
l11104:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	293
	
l11106:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	296
	
l11108:
	movlw	high(0)
	movlb	2	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	297
	
l11110:; BSR set to: 2

	movlw	low(0)
	movwf	((main@last_button))&0ffh
	line	304
	
l11112:
	movlb	2	; () banked
	movf	((main@last_encoder))&0ffh,w
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u15120
movf	((main@last_encoder+1))&0ffh,w
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u15121
	goto	u15120

u15121:
	goto	l11174
u15120:
	line	306
	
l11114:; BSR set to: 2

	movf	((main@last_encoder))&0ffh,w
	subwf	((_encoder_count))&0ffh,w	;volatile
	movwf	((main@delta))&0ffh
	movf	((main@last_encoder+1))&0ffh,w
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movwf	1+((main@delta))&0ffh
	line	309
	
l11116:; BSR set to: 2

	movlw	high(01h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	312
	
l11118:
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
	line	313
	
l11120:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	315
	
l11122:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	318
	
l11124:
	movlw	high(01F4h)
	movlb	2	; () banked
	movwf	((main@encoder_activity_timer+1))&0ffh
	movlw	low(01F4h)
	movwf	((main@encoder_activity_timer))&0ffh
	line	321
	
l11126:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15131
	goto	u15130
u15131:
	goto	l196
u15130:
	line	323
	
l11128:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	324
	
l196:; BSR set to: 2

	line	327
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15141
	goto	u15140
u15141:
	goto	l11142
u15140:
	
l11130:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15151
	goto	u15150

u15151:
	goto	l11142
u15150:
	line	330
	
l11132:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((main@sensor_type))&0ffh
	line	331
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((main@flow_type))&0ffh
	line	333
	
l11134:; BSR set to: 2

	movff	(main@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(main@flow_type),(c:is_numeric_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u15161
	goto	u15160
u15161:
	goto	l11138
u15160:
	line	336
	
l11136:
	movlb	2	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_numeric_rotation
	line	337
	goto	l11146
	line	338
	
l11138:
	movff	(main@sensor_type),(c:is_time_field@sensor_type)
	movff	(main@flow_type),(c:is_time_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u15171
	goto	u15170
u15171:
	goto	l11142
u15170:
	line	341
	
l11140:
	movlb	2	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_time_rotation
	line	342
	call	_menu_update_time_value	;wreg free
	line	343
	goto	l11146
	line	347
	
l11142:
	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	line	357
	
l11146:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15181
	goto	u15180
u15181:
	goto	l11162
u15180:
	
l11148:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15191
	goto	u15190

u15191:
	goto	l11162
u15190:
	line	360
	
l11150:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((main@sensor_type_620))&0ffh
	line	361
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((main@flow_type_621))&0ffh
	line	364
	
l11152:; BSR set to: 2

	movff	(main@sensor_type_620),(c:is_numeric_field@sensor_type)
	movff	(main@flow_type_621),(c:is_numeric_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u15201
	goto	u15200
u15201:
	goto	l11156
u15200:
	line	367
	
l11154:
	call	_menu_update_numeric_value	;wreg free
	line	368
	goto	l11174
	line	369
	
l11156:
	movff	(main@sensor_type_620),(c:is_time_field@sensor_type)
	movff	(main@flow_type_621),(c:is_time_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u15211
	goto	u15210
u15211:
	goto	l11160
u15210:
	line	372
	
l11158:
	call	_menu_update_time_value	;wreg free
	line	373
	goto	l11174
	line	377
	
l11160:
	call	_menu_update_edit_value	;wreg free
	goto	l11174
	line	383
	
l11162:; BSR set to: 2

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15221
	goto	u15220
u15221:
	goto	l11166
u15220:
	line	385
	
l11164:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	386
	goto	l11174
	line	387
	
l11166:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15231
	goto	u15230

u15231:
	goto	l11170
u15230:
	line	389
	
l11168:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	line	390
	goto	l11174
	line	391
	
l11170:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15241
	goto	u15240

u15241:
	goto	l11174
u15240:
	line	393
	
l11172:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	399
	
l11174:
	movlb	2	; () banked
	movf	((main@last_button))&0ffh,w
xorwf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u15251
	goto	u15250

u15251:
	goto	l11250
u15250:
	line	401
	
l11176:; BSR set to: 2

	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u15261
	goto	u15260
u15261:
	goto	l11246
u15260:
	line	403
	
l11178:; BSR set to: 2

	movff	(_button_event),(main@current_event)	;volatile
	line	404
	
l11180:; BSR set to: 2

	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	407
	
l11182:; BSR set to: 2

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
	line	408
	
l11184:
		movlw	low(main@buf_623)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_623)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	411
	
l11186:
		movlw	2
	movlb	2	; () banked
	xorwf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u15271
	goto	u15270

u15271:
	goto	l11222
u15270:
	line	413
	
l11188:; BSR set to: 2

		movlw	low(STR_13)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_13)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	416
	
l11190:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15281
	goto	u15280
u15281:
	goto	l11204
u15280:
	line	419
	
l11192:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	420
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	421
	movlw	low(0)
	movwf	(0+(_menu+08h))&0ffh
	line	425
	
l11194:; BSR set to: 2

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
	line	426
	
l11196:; BSR set to: 2

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
	line	428
	
l11198:; BSR set to: 2

		movlw	low(STR_14)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_14)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	431
	
l11200:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15291
	goto	u15290

u15291:
	goto	l11246
u15290:
	line	432
	
l11202:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	goto	l11246
	line	438
	
l11204:; BSR set to: 2

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15301
	goto	u15300
u15301:
	goto	l11210
u15300:
	line	440
	
l11206:; BSR set to: 2

	setf	((_current_menu))&0ffh
	line	441
	
l11208:; BSR set to: 2

		movlw	low(STR_15)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	442
	goto	l11246
	line	443
	
l11210:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15311
	goto	u15310

u15311:
	goto	l11216
u15310:
	line	445
	
l11212:; BSR set to: 2

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	446
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	447
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	448
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	449
	
l11214:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	450
	goto	l11246
	line	451
	
l11216:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15321
	goto	u15320

u15321:
	goto	l227
u15320:
	line	453
	
l11218:; BSR set to: 2

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	454
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	455
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	456
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	457
	
l11220:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	goto	l11246
	line	462
	
l11222:; BSR set to: 2

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15331
	goto	u15330

u15331:
	goto	l11232
u15330:
	line	464
	
l11224:; BSR set to: 2

		decf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u15341
	goto	u15340

u15341:
	goto	l11246
u15340:
	line	466
	
l11226:; BSR set to: 2

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	467
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	468
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	469
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	470
	
l11228:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	471
	
l11230:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l11246
	line	477
	
l11232:; BSR set to: 2

	movf	((main@current_event))&0ffh,w
	
	call	_menu_handle_button
	line	480
	
l11234:
	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15351
	goto	u15350
u15351:
	goto	l11238
u15350:
	goto	l11220
	line	482
	
l11238:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15361
	goto	u15360

u15361:
	goto	l11242
u15360:
	goto	l11202
	line	484
	
l11242:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15371
	goto	u15370

u15371:
	goto	l227
u15370:
	goto	l11214
	line	486
	
l227:; BSR set to: 2

	line	488
	
l11246:
	movff	(_button_event),(main@last_button)	;volatile
	line	489
	
l11248:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	494
	
l11250:; BSR set to: 2

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15381
	goto	u15380

u15381:
	goto	l11266
u15380:
	
l11252:; BSR set to: 2

		incf	((main@last_menu_state))&0ffh,w
	btfsc	status,2
	goto	u15391
	goto	u15390

u15391:
	goto	l11266
u15390:
	line	497
	
l11254:; BSR set to: 2

	call	_lcd_clear	;wreg free
	line	498
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	499
	
l11256:
		movlw	low(STR_16)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_16)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	500
	
l11258:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	501
		movlw	low(STR_17)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_17)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	502
		movlw	low(STR_18)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_18)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	504
		movlw	low(STR_19)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_19)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	505
	
l11260:
	call	_save_current_config	;wreg free
	line	506
	
l11262:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	507
	
l11264:; BSR set to: 2

		movlw	low(STR_20)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_20)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	509
	
l11266:
	movff	(_current_menu),(main@last_menu_state)
	line	512
	
l11268:
	movlb	2	; () banked
	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfsc	status,2
	goto	u15401
	goto	u15400

u15401:
	goto	l11272
u15400:
	line	514
	
l11270:; BSR set to: 2

	decf	((main@encoder_activity_timer))&0ffh
	btfss	status,0
	decf	((main@encoder_activity_timer+1))&0ffh
	line	518
	
l11272:; BSR set to: 2

	movlw	low(01h)
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	519
	
l11274:; BSR set to: 2

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	bnz	u15410
	movlw	16
	subwf	 ((main@blink_timer))&0ffh,w
	movlw	39
	subwfb	((main@blink_timer+1))&0ffh,w
	btfss	status,0
	goto	u15411
	goto	u15410

u15411:
	goto	l11298
u15410:
	line	521
	
l11276:; BSR set to: 2

	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	522
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u15421
	goto	u15420
u15421:
	goto	l11296
u15420:
	line	525
	
l11278:; BSR set to: 2

	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfss	status,2
	goto	u15431
	goto	u15430

u15431:
	goto	l11298
u15430:
	line	527
	
l11280:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u15441
	goto	u15440
u15441:
	movlw	1
	goto	u15450
u15440:
	movlw	0
u15450:
	movwf	(0+(_menu+05h))&0ffh
	line	531
	
l11282:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15461
	goto	u15460

u15461:
	goto	l11298
u15460:
	line	534
	
l11284:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((main@sensor_type_635))&0ffh
	line	535
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((main@flow_type_636))&0ffh
	line	538
	
l11286:; BSR set to: 2

	movff	(main@sensor_type_635),(c:is_numeric_field@sensor_type)
	movff	(main@flow_type_636),(c:is_numeric_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u15471
	goto	u15470
u15471:
	goto	l11290
u15470:
	line	541
	
l11288:
	call	_menu_update_numeric_value	;wreg free
	line	542
	goto	l11298
	line	543
	
l11290:
	movff	(main@sensor_type_635),(c:is_time_field@sensor_type)
	movff	(main@flow_type_636),(c:is_time_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u15481
	goto	u15480
u15481:
	goto	l11294
u15480:
	line	546
	
l11292:
	call	_menu_update_time_value	;wreg free
	line	547
	goto	l11298
	line	551
	
l11294:
	call	_menu_update_edit_value	;wreg free
	goto	l11298
	line	558
	
l11296:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	572
	
l11298:
		movlw	03h-0
	movlb	2	; () banked
	cpfslt	((_current_menu))&0ffh
	goto	u15491
	goto	u15490

u15491:
	goto	l11332
u15490:
	line	574
	
l11300:; BSR set to: 2

	movf	((_menu_timeout_flag))&0ffh,w	;volatile
	btfss	status,2
	goto	u15501
	goto	u15500
u15501:
	goto	l11332
u15500:
	line	576
	
l11302:; BSR set to: 2

		movlw	low(STR_21)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_21)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	579
	
l11304:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	580
	
l11306:
	asmopt push
asmopt off
movlw  3
movwf	(??_main+0+0+1)^00h,c
movlw	8
movwf	(??_main+0+0)^00h,c
	movlw	119
u15567:
decfsz	wreg,f
	bra	u15567
	decfsz	(??_main+0+0)^00h,c,f
	bra	u15567
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u15567
	nop
asmopt pop

	line	581
	
l11308:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	584
	
l11310:
	movlb	2	; () banked
	setf	((_current_menu))&0ffh
	line	585
	
l11312:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	586
	
l11314:; BSR set to: 2

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	587
	
l11316:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	590
	
l11318:; BSR set to: 2

	call	_lcd_clear	;wreg free
	line	591
	
l11320:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	592
	
l11322:
		movlw	low(STR_22)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_22)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	593
	
l11324:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	594
	
l11326:
		movlw	low(STR_23)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_23)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	597
	
l11328:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	598
	
l11330:; BSR set to: 2

	movlw	high(0)
	movwf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_menu_timeout_timer))^00h,c	;volatile
	line	603
	
l11332:; BSR set to: 2

	movf	((_long_press_beep_flag))&0ffh,w	;volatile
	btfsc	status,2
	goto	u15511
	goto	u15510
u15511:
	goto	l11340
u15510:
	line	605
	
l11334:; BSR set to: 2

	movlw	low(0)
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	line	606
	
l11336:; BSR set to: 2

	movlw	high(01F4h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01F4h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	607
	
l11338:
		movlw	low(STR_24)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_24)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	612
	
l11340:
	movlb	2	; () banked
	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u15521
	goto	u15520
u15521:
	goto	l11352
u15520:
	
l11342:; BSR set to: 2

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u15531
	goto	u15530

u15531:
	goto	l11352
u15530:
	line	614
	
l11344:; BSR set to: 2

		movlw	low(STR_25)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_25)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	615
	
l11346:
	call	_save_current_config	;wreg free
	line	616
	
l11348:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	617
	
l11350:; BSR set to: 2

		movlw	low(STR_26)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_26)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	620
	
l11352:
	asmopt push
asmopt off
	movlw	133
u15577:
decfsz	wreg,f
	bra	u15577
	nop
asmopt pop

	goto	l11112
	global	start
	goto	start
	callstack 0
	line	622
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_uart_init

;; *************** function _uart_init *****************
;; Defined at:
;;		line 51 in file "src\main.c"
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
	line	51
global __ptext1
__ptext1:
psect	text1
	file	"src\main.c"
	line	51
	
_uart_init:
;incstack = 0
	callstack 28
	line	53
	
l7300:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	54
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	56
	
l7302:
	movlw	low(024h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	57
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	58
	movlw	low(08h)
	movwf	((c:4024))^0f00h,c	;volatile
	line	60
	movlw	low(044h)
	movwf	((c:4015))^0f00h,c	;volatile
	line	61
	movlw	low(0)
	movwf	((c:4016))^0f00h,c	;volatile
	line	62
	
l109:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
	signat	_uart_init,89
	global	_system_init

;; *************** function _system_init *****************
;; Defined at:
;;		line 87 in file "src\main.c"
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
	line	87
global __ptext2
__ptext2:
psect	text2
	file	"src\main.c"
	line	87
	
_system_init:
;incstack = 0
	callstack 28
	line	89
	
l7304:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	90
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	93
	
l127:
	line	92
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u8461
	goto	u8460
u8461:
	goto	l127
u8460:
	line	95
	
l7306:
	movlw	low(0Fh)
	movwf	((c:4033))^0f00h,c	;volatile
	line	97
	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	98
	movlw	low(0)
	movwf	((c:3978))^0f00h,c	;volatile
	line	99
	movlw	low(0)
	movwf	((c:3979))^0f00h,c	;volatile
	line	101
	
l7308:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	102
	
l7310:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	104
	
l7312:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	105
	
l7314:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	106
	
l7316:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	107
	
l7318:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	108
	
l130:
	return	;funcret
	callstack 0
GLOBAL	__end_of_system_init
	__end_of_system_init:
	signat	_system_init,89
	global	_menu_update_numeric_value

;; *************** function _menu_update_numeric_value *****************
;; Defined at:
;;		line 979 in file "src\menu.c"
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
	line	979
global __ptext3
__ptext3:
psect	text3
	file	"src\menu.c"
	line	979
	
_menu_update_numeric_value:
;incstack = 0
	callstack 25
	line	982
	
l10282:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13511
	goto	u13510

u13511:
	goto	l778
u13510:
	
l10284:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u13521
	goto	u13520
u13521:
	goto	l10286
u13520:
	goto	l778
	line	986
	
l10286:; BSR set to: 2

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((c:menu_update_numeric_value@screen_line))^00h,c
	line	987
		movlw	03h-1
	cpfsgt	((c:menu_update_numeric_value@screen_line))^00h,c
	goto	u13531
	goto	u13530

u13531:
	goto	l10290
u13530:
	goto	l778
	line	992
	
l10290:; BSR set to: 2

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
	line	993
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
	line	996
	
l10292:; BSR set to: 2

	movff	(c:menu_update_numeric_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(c:menu_update_numeric_value@flow_type),(c:is_numeric_field@flow_type)
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u13541
	goto	u13540
u13541:
	goto	l10296
u13540:
	goto	l778
	line	1000
	
l10296:
	lfsr	2,(menu_update_numeric_value@value_buf)
	movlw	6-1
u13551:
	clrf	postinc2
	decf	wreg
	bc	u13551
	line	1002
	
l10298:
	movlb	2	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u13561
	goto	u13560
u13561:
	goto	l10330
u13560:
	line	1005
	
l10300:; BSR set to: 2

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u13571
	goto	u13570

u13571:
	goto	l10304
u13570:
	
l10302:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u13581
	goto	u13580
u13581:
	goto	l10306
u13580:
	
l10304:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1265))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1265))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1265))^00h,c
	goto	l10308
	
l10306:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1265+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1265))^00h,c
	
l10308:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1265),(c:menu_update_numeric_value@value_buf)
	line	1006
	
l10310:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u13591
	goto	u13590

u13591:
	goto	l10314
u13590:
	
l10312:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u13601
	goto	u13600
u13601:
	goto	l10316
u13600:
	
l10314:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1266))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1266))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1266))^00h,c
	goto	l10318
	
l10316:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1266+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1266))^00h,c
	
l10318:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1266),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1007
	
l10320:; BSR set to: 2

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u13611
	goto	u13610

u13611:
	goto	l10324
u13610:
	
l10322:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u13621
	goto	u13620
u13621:
	goto	l10326
u13620:
	
l10324:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1267))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1267))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1267))^00h,c
	goto	l10328
	
l10326:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1267+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1267))^00h,c
	
l10328:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1267),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1008
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+03h))^00h,c
	line	1009
	goto	l804
	line	1013
	
l10330:; BSR set to: 2

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u13631
	goto	u13630
u13631:
	goto	l10334
u13630:
	
l10332:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u13641
	goto	u13640
u13641:
	goto	l10342
u13640:
	
l10334:; BSR set to: 2

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u13651
	goto	u13650
u13651:
	goto	l10338
u13650:
	
l10336:; BSR set to: 2

	movlw	high(02Bh)
	movwf	((c:_menu_update_numeric_value$1269+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_menu_update_numeric_value$1269))^00h,c
	goto	l10340
	
l10338:; BSR set to: 2

	movlw	high(02Dh)
	movwf	((c:_menu_update_numeric_value$1269+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_menu_update_numeric_value$1269))^00h,c
	
l10340:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1269),(c:_menu_update_numeric_value$1268)
	movff	(c:_menu_update_numeric_value$1269+1),(c:_menu_update_numeric_value$1268+1)
	goto	l10344
	
l10342:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1268+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1268))^00h,c
	
l10344:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1268),(c:menu_update_numeric_value@value_buf)
	line	1014
	
l10346:; BSR set to: 2

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u13661
	goto	u13660

u13661:
	goto	l10350
u13660:
	
l10348:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u13671
	goto	u13670
u13671:
	goto	l10352
u13670:
	
l10350:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1270))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1270))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1270))^00h,c
	goto	l10354
	
l10352:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1270+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1270))^00h,c
	
l10354:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1270),0+((c:menu_update_numeric_value@value_buf)+01h)
	line	1015
	
l10356:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u13681
	goto	u13680

u13681:
	goto	l10360
u13680:
	
l10358:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u13691
	goto	u13690
u13691:
	goto	l10362
u13690:
	
l10360:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1271))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1271))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1271))^00h,c
	goto	l10364
	
l10362:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1271+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1271))^00h,c
	
l10364:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1271),0+((c:menu_update_numeric_value@value_buf)+02h)
	line	1016
	
l10366:; BSR set to: 2

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u13701
	goto	u13700

u13701:
	goto	l10370
u13700:
	
l10368:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u13711
	goto	u13710
u13711:
	goto	l10372
u13710:
	
l10370:; BSR set to: 2

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((c:_menu_update_numeric_value$1272))^00h,c
	clrf	1+((c:_menu_update_numeric_value$1272))^00h,c
	movlw	high(030h)
	addwfc	1+((c:_menu_update_numeric_value$1272))^00h,c
	goto	l10374
	
l10372:; BSR set to: 2

	movlw	high(020h)
	movwf	((c:_menu_update_numeric_value$1272+1))^00h,c
	movlw	low(020h)
	movwf	((c:_menu_update_numeric_value$1272))^00h,c
	
l10374:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1272),0+((c:menu_update_numeric_value@value_buf)+03h)
	line	1017
	movlw	low(0)
	movwf	(0+((c:menu_update_numeric_value@value_buf)+04h))^00h,c
	line	1018
	
l804:; BSR set to: 2

	line	1021
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u13721
	goto	u13720
u13721:
	goto	l10378
u13720:
	
l10376:; BSR set to: 2

	movlw	high(0Eh)
	movwf	((c:_menu_update_numeric_value$1274+1))^00h,c
	movlw	low(0Eh)
	movwf	((c:_menu_update_numeric_value$1274))^00h,c
	goto	l10380
	
l10378:; BSR set to: 2

	movlw	high(0Fh)
	movwf	((c:_menu_update_numeric_value$1274+1))^00h,c
	movlw	low(0Fh)
	movwf	((c:_menu_update_numeric_value$1274))^00h,c
	
l10380:; BSR set to: 2

	movff	(c:_menu_update_numeric_value$1274),(c:menu_update_numeric_value@start_col)
	line	1023
	
l10382:; BSR set to: 2

	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1024
	
l10384:
		movlw	low(STR_179)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_179)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1026
	
l10386:
	movff	(c:menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((c:menu_update_numeric_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	1027
	
l10388:
		movlw	low(STR_180)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_180)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1028
	
l10390:
		movlw	low(menu_update_numeric_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1029
	
l10392:
		movlw	low(STR_181)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_181)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1030
	
l778:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_numeric_value
	__end_of_menu_update_numeric_value:
	signat	_menu_update_numeric_value,89
	global	_menu_update_edit_value

;; *************** function _menu_update_edit_value *****************
;; Defined at:
;;		line 915 in file "src\menu.c"
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
	line	915
global __ptext4
__ptext4:
psect	text4
	file	"src\menu.c"
	line	915
	
_menu_update_edit_value:
;incstack = 0
	callstack 25
	line	919
	
l10394:
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
	line	920
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
	line	923
	
l10396:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u13731
	goto	u13730
u13731:
	goto	l756
u13730:
	
l10398:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfsc	status,2
	goto	u13741
	goto	u13740

u13741:
	goto	l10400
u13740:
	goto	l756
	line	927
	
l10400:; BSR set to: 2

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@screen_line))&0ffh
	line	928
		movlw	03h-1
	cpfsgt	((menu_update_edit_value@screen_line))&0ffh
	goto	u13751
	goto	u13750

u13751:
	goto	l10404
u13750:
	goto	l756
	line	932
	
l10404:; BSR set to: 0

	movff	(menu_update_edit_value@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_update_edit_value@flow_type),(c:is_numeric_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u13761
	goto	u13760
u13761:
	goto	l10408
u13760:
	goto	l756
	line	937
	
l10408:
	movlb	2	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u13771
	goto	u13770
u13771:
	goto	l10412
u13770:
	line	939
	
l10410:; BSR set to: 2

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_174)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_174)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+0Ah),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	940
	goto	l10420
	line	945
	
l10412:; BSR set to: 2

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u13781
	goto	u13780
u13781:
	goto	l10416
u13780:
	
l10414:; BSR set to: 2

	movlw	high(02Bh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1250+1))&0ffh
	movlw	low(02Bh)
	movwf	((_menu_update_edit_value$1250))&0ffh
	goto	l10418
	
l10416:; BSR set to: 2

	movlw	high(02Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1250+1))&0ffh
	movlw	low(02Dh)
	movwf	((_menu_update_edit_value$1250))&0ffh
	
l10418:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_175)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_175)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu_update_edit_value$1250),0+((c:?_sprintf)+04h)
	movff	(_menu_update_edit_value$1250+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+0Ah),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+0Bh),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	movff	0+(_menu+0Ch),0+((c:?_sprintf)+0Ah)
	clrf	(1+((c:?_sprintf)+0Ah))^00h,c
	call	_sprintf	;wreg free
	line	950
	
l10420:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@from))^00h,c
	clrf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	952
	
l10422:
	movlb	2	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u13791
	goto	u13790
u13791:
	goto	l10432
u13790:
	line	955
	
l10424:; BSR set to: 2

	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u13801
	goto	u13800
u13801:
	goto	l766
u13800:
	line	956
	
l10426:; BSR set to: 2

	decf	(0+(_menu+08h))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_edit_value@blink_pos))&0ffh
	goto	l10428
	line	957
	
l766:; BSR set to: 2

	line	958
	movff	0+(_menu+08h),(menu_update_edit_value@blink_pos)
	line	960
	
l10428:
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
	goto	u13811
	goto	u13810

u13811:
	goto	l10432
u13810:
	line	961
	
l10430:; BSR set to: 0

	movf	((menu_update_edit_value@blink_pos))&0ffh,w
	addlw	low(menu_update_edit_value@display_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	965
	
l10432:
	movlb	2	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u13821
	goto	u13820
u13821:
	goto	l10436
u13820:
	
l10434:; BSR set to: 2

	movlw	high(0Dh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1254+1))&0ffh
	movlw	low(0Dh)
	movwf	((_menu_update_edit_value$1254))&0ffh
	goto	l10438
	
l10436:; BSR set to: 2

	movlw	high(0Eh)
	movlb	0	; () banked
	movwf	((_menu_update_edit_value$1254+1))&0ffh
	movlw	low(0Eh)
	movwf	((_menu_update_edit_value$1254))&0ffh
	
l10438:; BSR set to: 0

	movff	(_menu_update_edit_value$1254),(menu_update_edit_value@start_col)
	line	966
	
l10440:; BSR set to: 0

	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	967
	
l10442:
		movlw	low(STR_176)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_176)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	969
	
l10444:
	movff	(menu_update_edit_value@start_col),(c:lcd_set_cursor@col)
	movlb	0	; () banked
	incf	((menu_update_edit_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	970
	
l10446:
		movlw	low(STR_177)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_177)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	971
	
l10448:
		movlw	low(menu_update_edit_value@display_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	972
	
l10450:
		movlw	low(STR_178)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_178)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	973
	
l756:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_edit_value
	__end_of_menu_update_edit_value:
	signat	_menu_update_edit_value,89
	global	_menu_init

;; *************** function _menu_init *****************
;; Defined at:
;;		line 600 in file "src\menu.c"
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
	line	600
global __ptext5
__ptext5:
psect	text5
	file	"src\menu.c"
	line	600
	
_menu_init:
;incstack = 0
	callstack 28
	line	602
	
l7414:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_menu))&0ffh
	line	603
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	604
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	605
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	606
	movlw	low(0)
	movwf	(0+(_menu+05h))&0ffh
	line	607
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	608
	
l603:; BSR set to: 2

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_init
	__end_of_menu_init:
	signat	_menu_init,89
	global	_menu_handle_encoder

;; *************** function _menu_handle_encoder *****************
;; Defined at:
;;		line 1394 in file "src\menu.c"
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
;; Hardware stack levels required when called: 7
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
;;		_sprintf
;;		_strcpy
;;		_uart_println
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	1394
global __ptext6
__ptext6:
psect	text6
	file	"src\menu.c"
	line	1394
	
_menu_handle_encoder:; BSR set to: 2

;incstack = 0
	callstack 23
	line	1399
	
l10110:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u13141
	goto	u13140
u13141:
	goto	l10228
u13140:
	line	1401
	
l10112:; BSR set to: 2

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u13151
	goto	u13150

u13151:
	goto	l986
u13150:
	line	1404
	
l10114:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13161
	goto	u13160

u13161:
	goto	l10172
u13160:
	line	1407
	
l10116:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_225)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_225)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(c:menu_handle_encoder@delta),0+((c:?_sprintf)+06h)
	movff	(c:menu_handle_encoder@delta+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1408
	
l10118:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1411
	
l10120:
		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1412
	
l10122:; BSR set to: 1

		movlw	low(0)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1414
	
l10124:; BSR set to: 1

	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13171
	goto	u13170
u13171:
	goto	l10128
u13170:
	line	1416
	
l10126:; BSR set to: 2

		movlw	low(_menu_item_options)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1417
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1418
	goto	l974
	line	1419
	
l10128:; BSR set to: 2

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13181
	goto	u13180

u13181:
	goto	l10132
u13180:
	line	1421
	
l10130:; BSR set to: 2

		movlw	low(_menu_item_options+048h)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1422
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1423
	goto	l974
	line	1424
	
l10132:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13191
	goto	u13190

u13191:
	goto	l974
u13190:
	line	1426
	
l10134:; BSR set to: 2

		movlw	low(_menu_item_options+03Ch)
	movlb	1	; () banked
	movwf	((menu_handle_encoder@clock_opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_encoder@clock_opts+1))&0ffh

	line	1427
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_encoder@clock_flag))&0ffh
	clrf	((menu_handle_encoder@clock_flag+1))&0ffh

	line	1430
	
l974:
	movlb	1	; () banked
	movf	((menu_handle_encoder@clock_opts))&0ffh,w
iorwf	((menu_handle_encoder@clock_opts+1))&0ffh,w
	btfsc	status,2
	goto	u13201
	goto	u13200

u13201:
	goto	l986
u13200:
	
l10136:; BSR set to: 1

	movf	((menu_handle_encoder@clock_flag))&0ffh,w
iorwf	((menu_handle_encoder@clock_flag+1))&0ffh,w
	btfsc	status,2
	goto	u13211
	goto	u13210

u13211:
	goto	l986
u13210:
	line	1432
	
l10138:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_226)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_226)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_encoder+0+0)^00h,c
	movf	((??_menu_handle_encoder+0+0))^00h,c,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1433
	
l10140:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1435
	
l10142:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13221
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u13220
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u13221
	goto	u13220

u13221:
	goto	l10150
u13220:
	line	1437
	
l10144:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	incf	indf2

	line	1438
	
l10146:
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
	goto	u13231
	goto	u13230

u13231:
	goto	l10158
u13230:
	line	1439
	
l10148:; BSR set to: 1

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	goto	l10158
	line	1441
	
l10150:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13240
	goto	u13241

u13241:
	goto	l10158
u13240:
	line	1443
	
l10152:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u13251
	goto	u13250
u13251:
	goto	l10156
u13250:
	line	1444
	
l10154:
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

	goto	l10158
	line	1446
	
l10156:
	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	decf	indf2

	line	1450
	
l10158:
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
	goto	u13261
	goto	u13260

u13261:
	goto	l10162
u13260:
	line	1451
	
l10160:; BSR set to: 1

	movff	(menu_handle_encoder@clock_flag),fsr2l
	movff	(menu_handle_encoder@clock_flag+1),fsr2h
	clrf	indf2
	line	1453
	
l10162:; BSR set to: 1

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_227)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_227)
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
	line	1454
	
l10164:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1457
	
l10166:
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
	line	1458
	
l10168:
	call	_menu_draw_clock	;wreg free
	goto	l986
	line	1461
	
l10170:
	goto	l986
	line	1465
	
l10172:; BSR set to: 2

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
	line	1466
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
	line	1469
	
l10174:; BSR set to: 1

	movff	(menu_handle_encoder@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_option_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u13271
	goto	u13270
u13271:
	goto	l10206
u13270:
	line	1471
	
l10176:
	movff	(menu_handle_encoder@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_encoder@edit_flag)
	movff	1+?_get_option_edit_flag,(menu_handle_encoder@edit_flag+1)
	line	1472
	movff	(menu_handle_encoder@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_encoder@opts)
	movff	1+?_get_item_options_for_field,(menu_handle_encoder@opts+1)
	line	1474
	
l10178:
	movlb	1	; () banked
	movf	((menu_handle_encoder@edit_flag))&0ffh,w
iorwf	((menu_handle_encoder@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u13281
	goto	u13280

u13281:
	goto	l986
u13280:
	
l10180:; BSR set to: 1

	movf	((menu_handle_encoder@opts))&0ffh,w
iorwf	((menu_handle_encoder@opts+1))&0ffh,w
	btfsc	status,2
	goto	u13291
	goto	u13290

u13291:
	goto	l986
u13290:
	line	1476
	
l10182:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13301
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u13300
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u13301
	goto	u13300

u13301:
	goto	l10190
u13300:
	line	1478
	
l10184:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	incf	indf2

	line	1479
	
l10186:; BSR set to: 1

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
	goto	u13311
	goto	u13310

u13311:
	goto	l10198
u13310:
	line	1480
	
l10188:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	goto	l10198
	line	1482
	
l10190:; BSR set to: 1

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13320
	goto	u13321

u13321:
	goto	l10198
u13320:
	line	1484
	
l10192:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u13331
	goto	u13330
u13331:
	goto	l10196
u13330:
	line	1485
	
l10194:; BSR set to: 1

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

	goto	l10198
	line	1487
	
l10196:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	decf	indf2

	line	1491
	
l10198:; BSR set to: 1

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
	goto	u13341
	goto	u13340

u13341:
	goto	l10202
u13340:
	line	1492
	
l10200:; BSR set to: 1

	movff	(menu_handle_encoder@edit_flag),fsr2l
	movff	(menu_handle_encoder@edit_flag+1),fsr2h
	clrf	indf2
	line	1495
	
l10202:; BSR set to: 1

	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13351
	goto	u13350

u13351:
	goto	l10170
u13350:
	line	1497
	
l10204:; BSR set to: 2

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
	line	1498
	call	_menu_draw_input	;wreg free
	goto	l986
	line	1502
	
l10206:
	movff	(menu_handle_encoder@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_numeric_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u13361
	goto	u13360
u13361:
	goto	l10216
u13360:
	line	1504
	
l10208:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13370
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u13371
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u13371
	goto	u13370

u13371:
	goto	l10212
u13370:
	
l10210:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1429))&0ffh
	setf	((_menu_handle_encoder$1429+1))&0ffh
	goto	l10214
	
l10212:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1429+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1429))&0ffh
	
l10214:; BSR set to: 1

	movf	((_menu_handle_encoder$1429))&0ffh,w
	
	call	_handle_numeric_rotation
	line	1505
	goto	l986
	line	1506
	
l10216:
	movff	(menu_handle_encoder@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_encoder@flow_type),(c:is_time_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u13381
	goto	u13380
u13381:
	goto	l10170
u13380:
	line	1508
	
l10218:
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13390
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u13391
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfsc	status,0
	goto	u13391
	goto	u13390

u13391:
	goto	l10222
u13390:
	
l10220:
	movlb	1	; () banked
	setf	((_menu_handle_encoder$1430))&0ffh
	setf	((_menu_handle_encoder$1430+1))&0ffh
	goto	l10224
	
l10222:
	movlw	high(01h)
	movlb	1	; () banked
	movwf	((_menu_handle_encoder$1430+1))&0ffh
	movlw	low(01h)
	movwf	((_menu_handle_encoder$1430))&0ffh
	
l10224:; BSR set to: 1

	movf	((_menu_handle_encoder$1430))&0ffh,w
	
	call	_handle_time_rotation
	goto	l986
	line	1515
	
l10228:; BSR set to: 2

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13401
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u13400
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u13401
	goto	u13400

u13401:
	goto	l10246
u13400:
	line	1519
	
l10230:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf_1431)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1431)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_228)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_228)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_current_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	1520
	
l10232:
		movlw	low(menu_handle_encoder@buf_1431)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1431)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1523
	
l10234:
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
	goto	u13411
	goto	u13410

u13411:
	goto	l10242
u13410:
	line	1525
	
l10236:; BSR set to: 2

	incf	((_menu))&0ffh
	line	1528
	
l10238:; BSR set to: 2

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
	goto	u13421
	goto	u13420

u13421:
	goto	l10242
u13420:
	line	1530
	
l10240:; BSR set to: 2

	incf	(0+(_menu+01h))&0ffh
	line	1534
	
l10242:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf_1431)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1431)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_229)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_229)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+01h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1535
	
l10244:
		movlw	low(menu_handle_encoder@buf_1431)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1431)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1536
	goto	l10264
	line	1537
	
l10246:; BSR set to: 2

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u13430
	goto	u13431

u13431:
	goto	l10264
u13430:
	line	1541
	
l10248:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf_1434)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1434)
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
	line	1542
	
l10250:
		movlw	low(menu_handle_encoder@buf_1434)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1434)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1545
	
l10252:
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u13441
	goto	u13440
u13441:
	goto	l10260
u13440:
	line	1547
	
l10254:; BSR set to: 2

	decf	((_menu))&0ffh
	line	1550
	
l10256:; BSR set to: 2

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u13451
	goto	u13450

u13451:
	goto	l10260
u13450:
	line	1552
	
l10258:; BSR set to: 2

	decf	(0+(_menu+01h))&0ffh
	line	1556
	
l10260:; BSR set to: 2

		movlw	low(menu_handle_encoder@buf_1434)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_encoder@buf_1434)
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
	line	1557
	
l10262:
		movlw	low(menu_handle_encoder@buf_1434)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_encoder@buf_1434)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1561
	
l10264:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u13461
	goto	u13460
u13461:
	goto	l986
u13460:
	line	1563
	
l10266:; BSR set to: 2

	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13471
	goto	u13470
u13471:
	goto	l10270
u13470:
	line	1564
	
l10268:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	goto	l986
	line	1565
	
l10270:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13481
	goto	u13480

u13481:
	goto	l10274
u13480:
	line	1566
	
l10272:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	goto	l986
	line	1567
	
l10274:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13491
	goto	u13490

u13491:
	goto	l10278
u13490:
	line	1568
	
l10276:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	goto	l986
	line	1569
	
l10278:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13501
	goto	u13500

u13501:
	goto	l10170
u13500:
	goto	l10168
	line	1572
	
l986:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_encoder
	__end_of_menu_handle_encoder:
	signat	_menu_handle_encoder,4217
	global	_handle_time_rotation

;; *************** function _handle_time_rotation *****************
;; Defined at:
;;		line 448 in file "src\menu.c"
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
	line	448
global __ptext7
__ptext7:
psect	text7
	file	"src\menu.c"
	line	448
	
_handle_time_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_time_rotation@direction))&0ffh
	line	450
	
l9294:
		movlw	low(STR_114)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_114)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	454
	
l9296:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_115)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_115)
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
	line	455
	
l9298:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	457
	
l9300:
	movlb	2	; () banked
	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u12111
	goto	u12110
u12111:
	goto	l9328
u12110:
	line	459
	
l9302:; BSR set to: 2

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12121
	goto	u12120

u12121:
	goto	l9316
u12120:
	line	461
	
l9304:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+012h))&0ffh
	line	462
	
l9306:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u12131
	goto	u12130

u12131:
	goto	l9312
u12130:
	
l9308:; BSR set to: 2

		movlw	018h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u12141
	goto	u12140

u12141:
	goto	l9312
u12140:
	line	463
	
l9310:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+012h))&0ffh
	goto	l9344
	line	464
	
l9312:; BSR set to: 2

		movlw	064h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u12151
	goto	u12150

u12151:
	goto	l566
u12150:
	goto	l9310
	line	469
	
l9316:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u12161
	goto	u12160
u12161:
	goto	l9326
u12160:
	line	471
	
l9318:; BSR set to: 2

		movlw	2
	xorwf	(0+(_menu+010h))&0ffh,w
	btfsc	status,2
	goto	u12171
	goto	u12170

u12171:
	goto	l9322
u12170:
	
l9320:; BSR set to: 2

	movlw	high(063h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1109+1))&0ffh
	movlw	low(063h)
	movwf	((_handle_time_rotation$1109))&0ffh
	goto	l9324
	
l9322:; BSR set to: 2

	movlw	high(017h)
	movlb	0	; () banked
	movwf	((_handle_time_rotation$1109+1))&0ffh
	movlw	low(017h)
	movwf	((_handle_time_rotation$1109))&0ffh
	
l9324:; BSR set to: 0

	movff	(_handle_time_rotation$1109),0+(_menu+012h)
	line	472
	goto	l9344
	line	475
	
l9326:; BSR set to: 2

	decf	(0+(_menu+012h))&0ffh
	goto	l9344
	line	477
	
l566:; BSR set to: 2

	line	478
	goto	l9344
	line	479
	
l9328:; BSR set to: 2

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u12181
	goto	u12180

u12181:
	goto	l9344
u12180:
	line	481
	
l9330:; BSR set to: 2

	movlb	0	; () banked
		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12191
	goto	u12190

u12191:
	goto	l9338
u12190:
	line	483
	
l9332:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+013h))&0ffh
	line	484
	
l9334:; BSR set to: 2

		movlw	03Ch-1
	cpfsgt	(0+(_menu+013h))&0ffh
	goto	u12201
	goto	u12200

u12201:
	goto	l9344
u12200:
	line	485
	
l9336:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l9344
	line	489
	
l9338:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	btfss	status,2
	goto	u12211
	goto	u12210
u12211:
	goto	l9342
u12210:
	line	490
	
l9340:; BSR set to: 2

	movlw	low(03Bh)
	movwf	(0+(_menu+013h))&0ffh
	goto	l9344
	line	492
	
l9342:; BSR set to: 2

	decf	(0+(_menu+013h))&0ffh
	line	496
	
l9344:
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
	call	_sprintf	;wreg free
	line	497
	
l9346:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	498
	
l580:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_time_rotation
	__end_of_handle_time_rotation:
	signat	_handle_time_rotation,4217
	global	_handle_numeric_rotation

;; *************** function _handle_numeric_rotation *****************
;; Defined at:
;;		line 828 in file "src\menu.c"
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
	line	828
global __ptext8
__ptext8:
psect	text8
	file	"src\menu.c"
	line	828
	
_handle_numeric_rotation:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((handle_numeric_rotation@direction))&0ffh
	line	830
	
l9192:
		movlw	low(STR_172)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_172)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	833
	
l9194:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_173)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_173)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+08h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Fh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	834
	
l9196:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	837
	
l9198:
	movlb	2	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u11871
	goto	u11870
u11871:
	goto	l9292
u11870:
	
l9200:; BSR set to: 2

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u11881
	goto	u11880
u11881:
	goto	l9292
u11880:
	line	839
	
l9202:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+08h))&0ffh
	goto	l9292
	line	845
	
l9204:; BSR set to: 2

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u11891
	goto	u11890
u11891:
	goto	l748
u11890:
	
l9206:; BSR set to: 2

	movlb	0	; () banked
	movf	((handle_numeric_rotation@direction))&0ffh,w
	btfsc	status,2
	goto	u11901
	goto	u11900
u11901:
	goto	l748
u11900:
	line	847
	
l9208:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u11911
	goto	u11910
u11911:
	movlw	1
	goto	u11920
u11910:
	movlw	0
u11920:
	movwf	(0+(_menu+09h))&0ffh
	goto	l748
	line	852
	
l9210:; BSR set to: 2

	movlb	0	; () banked
		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u11931
	goto	u11930

u11931:
	goto	l9218
u11930:
	line	854
	
l9212:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+0Ah))&0ffh
	line	855
	
l9214:; BSR set to: 2

		movlw	06h-1
	cpfsgt	(0+(_menu+0Ah))&0ffh
	goto	u11941
	goto	u11940

u11941:
	goto	l748
u11940:
	line	856
	
l9216:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l748
	line	858
	
l9218:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u11950
	goto	u11951

u11951:
	goto	l748
u11950:
	line	860
	
l9220:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u11961
	goto	u11960
u11961:
	goto	l9224
u11960:
	line	861
	
l9222:; BSR set to: 2

	movlw	low(05h)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l748
	line	863
	
l9224:; BSR set to: 2

	decf	(0+(_menu+0Ah))&0ffh
	goto	l748
	line	869
	
l9226:; BSR set to: 2

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u11971
	goto	u11970

u11971:
	goto	l9230
u11970:
	
l9228:; BSR set to: 2

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1239+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1239))&0ffh
	goto	l9232
	
l9230:; BSR set to: 2

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1239+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1239))&0ffh
	
l9232:; BSR set to: 0

	movff	(_handle_numeric_rotation$1239),(handle_numeric_rotation@max_tens)
	line	870
	
l9234:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u11981
	goto	u11980

u11981:
	goto	l9246
u11980:
	line	872
	
l9236:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u11991
	goto	u11990
u11991:
	goto	l9240
u11990:
	goto	l748
	line	874
	
l9240:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+0Bh))&0ffh
	line	875
	
l9242:; BSR set to: 2

		movf	(0+(_menu+0Bh))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfsc	status,0
	goto	u12001
	goto	u12000

u12001:
	goto	l748
u12000:
	line	876
	
l9244:; BSR set to: 0

	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	goto	l748
	line	878
	
l9246:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u12010
	goto	u12011

u12011:
	goto	l748
u12010:
	line	880
	
l9248:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u12021
	goto	u12020
u12021:
	goto	l9252
u12020:
	goto	l748
	line	882
	
l9252:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+0Bh))&0ffh,w
	btfss	status,2
	goto	u12031
	goto	u12030
u12031:
	goto	l9256
u12030:
	line	883
	
l9254:; BSR set to: 2

	movff	(handle_numeric_rotation@max_tens),0+(_menu+0Bh)
	goto	l748
	line	885
	
l9256:; BSR set to: 2

	decf	(0+(_menu+0Bh))&0ffh
	goto	l748
	line	892
	
l9258:; BSR set to: 2

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u12041
	goto	u12040

u12041:
	goto	l9262
u12040:
	
l9260:; BSR set to: 2

	movlw	high(09h)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1241+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1241))&0ffh
	goto	l9264
	
l9262:; BSR set to: 2

	movlw	high(0)
	movlb	0	; () banked
	movwf	((_handle_numeric_rotation$1241+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1241))&0ffh
	
l9264:; BSR set to: 0

	movff	(_handle_numeric_rotation$1241),(handle_numeric_rotation@max_units)
	line	893
	
l9266:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u12051
	goto	u12050

u12051:
	goto	l9278
u12050:
	line	895
	
l9268:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u12061
	goto	u12060
u12061:
	goto	l9272
u12060:
	goto	l748
	line	897
	
l9272:; BSR set to: 0

	movlb	2	; () banked
	incf	(0+(_menu+0Ch))&0ffh
	line	898
	
l9274:; BSR set to: 2

		movf	(0+(_menu+0Ch))&0ffh,w
	movlb	0	; () banked
	subwf	((handle_numeric_rotation@max_units))&0ffh,w
	btfsc	status,0
	goto	u12071
	goto	u12070

u12071:
	goto	l748
u12070:
	line	899
	
l9276:; BSR set to: 0

	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	goto	l748
	line	901
	
l9278:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u12080
	goto	u12081

u12081:
	goto	l748
u12080:
	line	903
	
l9280:; BSR set to: 0

	movf	((handle_numeric_rotation@max_units))&0ffh,w
	btfss	status,2
	goto	u12091
	goto	u12090
u12091:
	goto	l9284
u12090:
	goto	l748
	line	905
	
l9284:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+0Ch))&0ffh,w
	btfss	status,2
	goto	u12101
	goto	u12100
u12101:
	goto	l9288
u12100:
	line	906
	
l9286:; BSR set to: 2

	movff	(handle_numeric_rotation@max_units),0+(_menu+0Ch)
	goto	l748
	line	908
	
l9288:; BSR set to: 2

	decf	(0+(_menu+0Ch))&0ffh
	goto	l748
	line	842
	
l9292:; BSR set to: 2

	movf	(0+(_menu+08h))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l9204
	xorlw	1^0	; case 1
	skipnz
	goto	l9210
	xorlw	2^1	; case 2
	skipnz
	goto	l9226
	xorlw	3^2	; case 3
	skipnz
	goto	l9258
	goto	l748

	line	913
	
l748:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_numeric_rotation
	__end_of_handle_numeric_rotation:
	signat	_handle_numeric_rotation,4217
	global	_menu_handle_button

;; *************** function _menu_handle_button *****************
;; Defined at:
;;		line 1578 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  press_type      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  press_type      1  221[BANK1 ] unsigned char 
;;  i               1  216[BANK1 ] unsigned char 
;;  opts            2  212[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  edit_flag       2  210[BANK1 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> NULL(0), sensor_edit_flag(1), enable_edit_flag(1), 
;;  buf            50   50[BANK1 ] unsigned char [50]
;;  current_val     2  214[BANK1 ] unsigned int 
;;  current_val     2  222[BANK1 ] int 
;;  sensor_type     1  228[BANK1 ] unsigned char 
;;  flow_type       1  226[BANK1 ] unsigned char 
;;  new_value       2  230[BANK1 ] int 
;;  new_seconds     2  224[BANK1 ] unsigned int 
;;  buf            50  100[BANK1 ] unsigned char [50]
;;  buf            50    0[BANK1 ] unsigned char [50]
;;  opts            2  208[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  edit_flag       2  206[BANK1 ] PTR unsigned char 
;;		 -> no_flow_edit_flag(1), relay_low_edit_flag(1), flow_units_edit_flag(1), flow_type_edit_flag(1), 
;;		 -> display_edit_flag(1), relay_slp_edit_flag(1), relay_plp_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> NULL(0), sensor_edit_flag(1), enable_edit_flag(1), 
;;  buf            50  150[BANK1 ] unsigned char [50]
;;  edit_flag       2  219[BANK1 ] PTR unsigned char 
;;		 -> display_edit_flag(1), relay_high_edit_flag(1), NULL(0), enable_edit_flag(1), 
;;  opts            2  217[BANK1 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(84), 
;;  sensor_type     1  229[BANK1 ] unsigned char 
;;  flow_type       1  227[BANK1 ] unsigned char 
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
;;      Locals:         0       0     232       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         5       0     232       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      237 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 7
;; This function calls:
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
	line	1578
global __ptext9
__ptext9:
psect	text9
	file	"src\menu.c"
	line	1578
	
_menu_handle_button:
;incstack = 0
	callstack 23
	movlb	1	; () banked
	movwf	((menu_handle_button@press_type))&0ffh
	line	1583
	
l10452:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u13831
	goto	u13830
u13831:
	goto	l10780
u13830:
	line	1585
	
l10454:; BSR set to: 2

	movlb	1	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u13841
	goto	u13840

u13841:
	goto	l10770
u13840:
	line	1588
	
l10456:; BSR set to: 1

		movlw	3
	movlb	2	; () banked
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u13851
	goto	u13850

u13851:
	goto	l10514
u13850:
	line	1595
	
l10458:; BSR set to: 2

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u13861
	goto	u13860
u13861:
	goto	l1036
u13860:
	
l10460:; BSR set to: 2

		decf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u13871
	goto	u13870

u13871:
	goto	l1040
u13870:
	
l10462:; BSR set to: 2

	movff	(c:_display_edit_flag),(_menu_handle_button$1445)
	movlb	1	; () banked
	clrf	((_menu_handle_button$1445+1))&0ffh
	goto	l1042
	
l1040:; BSR set to: 2

	movff	(c:_relay_high_edit_flag),(_menu_handle_button$1445)
	movlb	1	; () banked
	clrf	((_menu_handle_button$1445+1))&0ffh
	
l1042:; BSR set to: 1

	movff	(_menu_handle_button$1445),(_menu_handle_button$1444)
	movff	(_menu_handle_button$1445+1),(_menu_handle_button$1444+1)
	goto	l10464
	
l1036:; BSR set to: 2

	movff	(c:_enable_edit_flag),(_menu_handle_button$1444)
	movlb	1	; () banked
	clrf	((_menu_handle_button$1444+1))&0ffh
	
l10464:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_232)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_232)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu_handle_button$1444),0+((c:?_sprintf)+06h)
	movff	(_menu_handle_button$1444+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	1596
	
l10466:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1599
	
l10468:
		movlw	low(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1600
	
l10470:; BSR set to: 1

		movlw	low(0)
	movwf	((menu_handle_button@edit_flag))&0ffh
	movlw	high(0)
	movwf	((menu_handle_button@edit_flag+1))&0ffh

	line	1602
	
l10472:; BSR set to: 1

	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13881
	goto	u13880
u13881:
	goto	l10482
u13880:
	line	1604
	
l10474:; BSR set to: 2

		movlw	low(_menu_item_options)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1605
		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	1606
	
l10476:; BSR set to: 1

	movff	(c:_enable_edit_flag),(_system_config)
	line	1607
	
l10478:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_233)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_233)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1608
	
l10480:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1609
	goto	l1044
	line	1610
	
l10482:; BSR set to: 2

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13891
	goto	u13890

u13891:
	goto	l10492
u13890:
	line	1612
	
l10484:; BSR set to: 2

		movlw	low(_menu_item_options+048h)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+048h)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1613
		movlw	low(_relay_high_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	1614
	
l10486:; BSR set to: 1

	movff	(c:_relay_high_edit_flag),0+(_system_config+06h)
	line	1615
	
l10488:; BSR set to: 1

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_234)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_234)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_system_config+06h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	goto	l10480
	line	1618
	
l10492:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13901
	goto	u13900

u13901:
	goto	l1044
u13900:
	line	1620
	
l10494:; BSR set to: 2

		movlw	low(_menu_item_options+03Ch)
	movlb	1	; () banked
	movwf	((menu_handle_button@opts))&0ffh
	movlw	high(_menu_item_options+03Ch)
	movwf	((menu_handle_button@opts+1))&0ffh

	line	1621
		movlw	low(_display_edit_flag)
	movwf	((menu_handle_button@edit_flag))&0ffh
	clrf	((menu_handle_button@edit_flag+1))&0ffh

	line	1625
	
l1044:
	movlb	1	; () banked
	movf	((menu_handle_button@opts))&0ffh,w
iorwf	((menu_handle_button@opts+1))&0ffh,w
	btfsc	status,2
	goto	u13911
	goto	u13910

u13911:
	goto	l10508
u13910:
	
l10496:; BSR set to: 1

	movf	((menu_handle_button@edit_flag))&0ffh,w
iorwf	((menu_handle_button@edit_flag+1))&0ffh,w
	btfsc	status,2
	goto	u13921
	goto	u13920

u13921:
	goto	l10508
u13920:
	
l10498:; BSR set to: 1

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
	goto	u13931
	goto	u13930
u13931:
	goto	l10508
u13930:
	line	1627
	
l10500:; BSR set to: 1

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
	line	1628
	
l10502:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1629
	
l10504:; BSR set to: 2

		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_235)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_235)
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
	line	1630
	
l10506:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1633
	
l10508:
	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1634
	
l10510:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1049
	line	1635
	
l10512:
	goto	l1049
	line	1639
	
l10514:; BSR set to: 2

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
	line	1640
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
	line	1643
	
l10516:; BSR set to: 1

	movff	(menu_handle_button@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_option_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u13941
	goto	u13940
u13941:
	goto	l10620
u13940:
	line	1645
	
l10518:
	movff	(menu_handle_button@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1456)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1456+1)
	line	1646
	movff	(menu_handle_button@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1457)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1457+1)
	line	1648
	
l10520:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag_1456))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1456+1))&0ffh,w
	btfsc	status,2
	goto	u13951
	goto	u13950

u13951:
	goto	l10508
u13950:
	
l10522:; BSR set to: 1

	movf	((menu_handle_button@opts_1457))&0ffh,w
iorwf	((menu_handle_button@opts_1457+1))&0ffh,w
	btfsc	status,2
	goto	u13961
	goto	u13960

u13961:
	goto	l10508
u13960:
	line	1651
	
l10524:; BSR set to: 1

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
	movff	(menu_handle_button@edit_flag_1456),fsr2l
	movff	(menu_handle_button@edit_flag_1456+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movf	((??_menu_handle_button+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_handle_button+1+0
	movff	prodh,??_menu_handle_button+1+0+1
	movf	(??_menu_handle_button+1+0)^00h,c,w
	movlb	1	; () banked
	addwf	((menu_handle_button@opts_1457))&0ffh,w
	movwf	(??_menu_handle_button+3+0)^00h,c
	movf	(??_menu_handle_button+1+1)^00h,c,w
	addwfc	((menu_handle_button@opts_1457+1))&0ffh,w
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
	line	1654
	
l10526:
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13971
	goto	u13970
u13971:
	goto	l10530
u13970:
	line	1656
	
l10528:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_enable_edit_flag),indf2

	line	1657
	goto	l10614
	line	1658
	
l10530:; BSR set to: 2

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13981
	goto	u13980

u13981:
	goto	l10542
u13980:
	line	1660
	
l10532:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_sensor_edit_flag),indf2

	line	1663
	
l10534:; BSR set to: 2

		movlw	2
	xorwf	((c:_sensor_edit_flag))^00h,c,w
	btfss	status,2
	goto	u13991
	goto	u13990

u13991:
	goto	l10540
u13990:
	
l10536:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfsc	status,2
	goto	u14001
	goto	u14000

u14001:
	goto	l10540
u14000:
	line	1665
	
l10538:; BSR set to: 1

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
	line	1669
	
l10540:
	movlb	2	; () banked
	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	1670
	goto	l10614
	line	1671
	
l10542:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14011
	goto	u14010

u14011:
	goto	l10550
u14010:
	
l10544:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14021
	goto	u14020

u14021:
	goto	l10550
u14020:
	line	1673
	
l10546:; BSR set to: 1

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

	line	1676
	
l10548:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	
	call	_rebuild_input_menu
	line	1677
	goto	l10614
	line	1678
	
l10550:
		movlw	3
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14031
	goto	u14030

u14031:
	goto	l10558
u14030:
	
l10552:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14041
	goto	u14040

u14041:
	goto	l10558
u14040:
	
l10554:; BSR set to: 1

		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14051
	goto	u14050

u14051:
	goto	l10558
u14050:
	goto	l10614
	line	1681
	
l10556:
	goto	l10614
	line	1682
	
l10558:
		movlw	3
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14061
	goto	u14060

u14061:
	goto	l10566
u14060:
	
l10560:; BSR set to: 2

		movlw	2
	movlb	1	; () banked
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14071
	goto	u14070

u14071:
	goto	l10566
u14070:
	
l10562:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14081
	goto	u14080
u14081:
	goto	l10566
u14080:
	line	1684
	
l10564:; BSR set to: 1

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

	line	1685
	goto	l10614
	line	1686
	
l10566:
	movlb	1	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14091
	goto	u14090
u14091:
	goto	l10584
u14090:
	line	1688
	
l10568:; BSR set to: 1

		movlw	9
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14101
	goto	u14100

u14101:
	goto	l10572
u14100:
	line	1689
	
l10570:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+038h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+038h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_high_edit_flag),indf2

	goto	l10614
	line	1690
	
l10572:; BSR set to: 2

		movlw	10
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14111
	goto	u14110

u14111:
	goto	l10576
u14110:
	line	1691
	
l10574:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+039h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+039h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_plp_edit_flag),indf2

	goto	l10614
	line	1692
	
l10576:; BSR set to: 2

		movlw	11
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14121
	goto	u14120

u14121:
	goto	l10580
u14120:
	line	1693
	
l10578:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_slp_edit_flag),indf2

	goto	l10614
	line	1694
	
l10580:; BSR set to: 2

		movlw	12
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14131
	goto	u14130

u14131:
	goto	l10556
u14130:
	line	1695
	
l10582:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+04h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+04h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_display_edit_flag),indf2

	goto	l10614
	line	1697
	
l10584:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14141
	goto	u14140

u14141:
	goto	l10594
u14140:
	line	1699
	
l10586:; BSR set to: 1

		movlw	6
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14151
	goto	u14150

u14151:
	goto	l10590
u14150:
	goto	l10570
	line	1701
	
l10590:; BSR set to: 2

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14161
	goto	u14160

u14161:
	goto	l10556
u14160:
	goto	l10582
	line	1704
	
l10594:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14171
	goto	u14170

u14171:
	goto	l10556
u14170:
	line	1706
	
l10596:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14181
	goto	u14180
u14181:
	goto	l10606
u14180:
	line	1708
	
l10598:; BSR set to: 1

		movlw	8
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14191
	goto	u14190

u14191:
	goto	l10602
u14190:
	line	1709
	
l10600:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+03Bh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+03Bh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:_relay_low_edit_flag),indf2

	goto	l10614
	line	1710
	
l10602:; BSR set to: 2

		movlw	9
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14201
	goto	u14200

u14201:
	goto	l10556
u14200:
	goto	l10582
	line	1715
	
l10606:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14211
	goto	u14210

u14211:
	goto	l10610
u14210:
	goto	l10600
	line	1717
	
l10610:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14221
	goto	u14220

u14221:
	goto	l10556
u14220:
	goto	l10582
	line	1722
	
l10614:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	goto	l10508
	line	1729
	
l10620:
	movff	(menu_handle_button@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_time_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u14231
	goto	u14230
u14231:
	goto	l10684
u14230:
	line	1731
	
l10622:
	movlb	2	; () banked
	incf	(0+(_menu+011h))&0ffh
	line	1732
	
l10624:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	1733
	
l10626:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1736
	
l10628:
		movlw	low(menu_handle_button@buf_1462)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1462)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_236)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_236)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1737
	
l10630:
		movlw	low(menu_handle_button@buf_1462)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1462)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1739
	
l10632:
	call	_menu_update_time_value	;wreg free
	line	1741
	
l10634:
		movlw	02h-1
	movlb	2	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u14241
	goto	u14240

u14241:
	goto	l1049
u14240:
	line	1745
	
l10636:; BSR set to: 2

	movf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u14251
	goto	u14250
u14251:
	goto	l10640
u14250:
	line	1746
	
l10638:; BSR set to: 2

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
	goto	l10642
	line	1748
	
l10640:; BSR set to: 2

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
	line	1751
	
l10642:; BSR set to: 1

	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14261
	goto	u14260
u14261:
	goto	l10656
u14260:
	line	1753
	
l10644:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14271
	goto	u14270

u14271:
	goto	l10648
u14270:
	line	1754
	
l10646:; BSR set to: 2

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
	goto	l10676
	line	1755
	
l10648:; BSR set to: 2

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14281
	goto	u14280

u14281:
	goto	l10652
u14280:
	line	1756
	
l10650:; BSR set to: 2

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
	goto	l10676
	line	1757
	
l10652:; BSR set to: 2

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14291
	goto	u14290

u14291:
	goto	l1093
u14290:
	line	1758
	
l10654:; BSR set to: 2

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
	goto	l10676
	line	1759
	
l1093:; BSR set to: 2

	goto	l10676
	line	1760
	
l10656:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14301
	goto	u14300

u14301:
	goto	l10662
u14300:
	line	1762
	
l10658:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14311
	goto	u14310

u14311:
	goto	l10676
u14310:
	goto	l10646
	line	1765
	
l10662:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14321
	goto	u14320

u14321:
	goto	l10676
u14320:
	line	1767
	
l10664:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14331
	goto	u14330
u14331:
	goto	l10670
u14330:
	
l10666:; BSR set to: 1

		movlw	7
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14341
	goto	u14340

u14341:
	goto	l10670
u14340:
	line	1768
	
l10668:; BSR set to: 2

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
	goto	l10676
	line	1769
	
l10670:
	movlb	1	; () banked
		decf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14351
	goto	u14350

u14351:
	goto	l10676
u14350:
	
l10672:; BSR set to: 1

		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14361
	goto	u14360

u14361:
	goto	l10676
u14360:
	goto	l10668
	line	1775
	
l10676:
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
		movlw	low(STR_237)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_237)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1777
	
l10678:
	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1778
	
l10680:; BSR set to: 2

	movlw	low(01h)
	movwf	((_save_pending))&0ffh
	line	1779
	
l10682:; BSR set to: 2

		movlw	low(STR_238)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_238)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1049
	line	1783
	
l10684:
	movff	(menu_handle_button@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type),(c:is_numeric_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u14371
	goto	u14370
u14371:
	goto	l10512
u14370:
	line	1785
	
l10686:
	movlb	2	; () banked
	incf	(0+(_menu+08h))&0ffh
	line	1786
	
l10688:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1788
	
l10690:
		movlw	2
	movlb	2	; () banked
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u14381
	goto	u14380

u14381:
	goto	l10696
u14380:
	
l10692:; BSR set to: 2

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u14391
	goto	u14390

u14391:
	goto	l10696
u14390:
	line	1790
	
l10694:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+0Bh))&0ffh
	line	1791
	movlw	low(0)
	movwf	(0+(_menu+0Ch))&0ffh
	line	1794
	
l10696:; BSR set to: 2

		movlw	04h-1
	cpfsgt	(0+(_menu+08h))&0ffh
	goto	u14401
	goto	u14400

u14401:
	goto	l10512
u14400:
	line	1796
	
l10698:; BSR set to: 2

	call	_get_current_numeric_value	;wreg free
	movff	0+?_get_current_numeric_value,(menu_handle_button@new_value)
	movff	1+?_get_current_numeric_value,(menu_handle_button@new_value+1)
	line	1799
	
l10700:; BSR set to: 2

	movlb	1	; () banked
	movf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14411
	goto	u14410
u14411:
	goto	l10724
u14410:
	line	1801
	
l10702:; BSR set to: 1

		movlw	2
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14421
	goto	u14420

u14421:
	goto	l10708
u14420:
	line	1803
	
l10704:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value),postinc2
	movff	(menu_handle_button@new_value+1),postdec2
	line	1804
	
l10706:; BSR set to: 2

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_239)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_239)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1805
	goto	l10766
	line	1806
	
l10708:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14431
	goto	u14430

u14431:
	goto	l10714
u14430:
	line	1808
	
l10710:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value),postinc2
	movff	(menu_handle_button@new_value+1),postdec2
	line	1809
	
l10712:; BSR set to: 2

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_240)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_240)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1810
	goto	l10766
	line	1811
	
l10714:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14441
	goto	u14440

u14441:
	goto	l10720
u14440:
	line	1813
	
l10716:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value),postinc2
	movff	(menu_handle_button@new_value+1),postdec2
	line	1814
	
l10718:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_241)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_241)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1815
	goto	l10766
	line	1816
	
l10720:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14451
	goto	u14450

u14451:
	goto	l1113
u14450:
	line	1819
	
l10722:; BSR set to: 2

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_242)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_242)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l10766
	line	1821
	
l1113:; BSR set to: 2

	goto	l10766
	line	1822
	
l10724:; BSR set to: 1

		decf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14461
	goto	u14460

u14461:
	goto	l10744
u14460:
	line	1824
	
l10726:; BSR set to: 1

		movlw	2
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14471
	goto	u14470

u14471:
	goto	l10732
u14470:
	line	1826
	
l10728:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value),postinc2
	movff	(menu_handle_button@new_value+1),postdec2
	line	1827
	
l10730:; BSR set to: 2

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_243)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_243)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1828
	goto	l10766
	line	1829
	
l10732:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14481
	goto	u14480

u14481:
	goto	l10738
u14480:
	line	1831
	
l10734:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value),postinc2
	movff	(menu_handle_button@new_value+1),postdec2
	line	1832
	
l10736:; BSR set to: 2

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_244)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_244)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1833
	goto	l10766
	line	1834
	
l10738:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14491
	goto	u14490

u14491:
	goto	l1113
u14490:
	line	1836
	
l10740:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+018h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+018h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value),postinc2
	movff	(menu_handle_button@new_value+1),postdec2
	line	1837
	
l10742:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_245)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_245)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l10766
	line	1840
	
l10744:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type))&0ffh,w
	btfss	status,2
	goto	u14501
	goto	u14500

u14501:
	goto	l10766
u14500:
	
l10746:; BSR set to: 1

	movf	((menu_handle_button@flow_type))&0ffh,w
	btfss	status,2
	goto	u14511
	goto	u14510
u14511:
	goto	l10766
u14510:
	line	1842
	
l10748:; BSR set to: 1

		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14521
	goto	u14520

u14521:
	goto	l10754
u14520:
	line	1844
	
l10750:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+08h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+08h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value),postinc2
	movff	(menu_handle_button@new_value+1),postdec2
	line	1845
	
l10752:; BSR set to: 2

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_246)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_246)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1846
	goto	l10766
	line	1847
	
l10754:; BSR set to: 2

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14531
	goto	u14530

u14531:
	goto	l10760
u14530:
	line	1849
	
l10756:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+0Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+0Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value),postinc2
	movff	(menu_handle_button@new_value+1),postdec2
	line	1850
	
l10758:; BSR set to: 2

		movff	0+(_input_menu+01Bh),(c:sprintf@sp)
	movff	1+(_input_menu+01Bh),(c:sprintf@sp+1)

		movlw	low(STR_247)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_247)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1851
	goto	l10766
	line	1852
	
l10760:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14541
	goto	u14540

u14541:
	goto	l1113
u14540:
	line	1854
	
l10762:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+020h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+020h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(menu_handle_button@new_value),postinc2
	movff	(menu_handle_button@new_value+1),postdec2
	line	1855
	
l10764:; BSR set to: 2

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_248)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_248)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1859
	
l10766:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1860
	
l10768:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	goto	l1049
	line	1864
	
l10770:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u14551
	goto	u14550

u14551:
	goto	l1049
u14550:
	line	1866
	
l10772:; BSR set to: 1

	movlw	low(0)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1867
	
l10774:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1868
	
l10776:
	asmopt push
asmopt off
movlw  3
movwf	(??_menu_handle_button+0+0+1)^00h,c
movlw	8
movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	119
u15587:
decfsz	wreg,f
	bra	u15587
	decfsz	(??_menu_handle_button+0+0)^00h,c,f
	bra	u15587
	decfsz	(??_menu_handle_button+0+0+1)^00h,c,f
	bra	u15587
	nop
asmopt pop

	line	1869
	
l10778:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l1049
	line	1874
	
l10780:; BSR set to: 2

	movlb	1	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u14561
	goto	u14560

u14561:
	goto	l11046
u14560:
	line	1876
	
l10782:; BSR set to: 1

	movlb	2	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14571
	goto	u14570
u14571:
	goto	l10802
u14570:
	line	1878
	
l10784:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1880
	goto	l10800
	line	1886
	
l10786:; BSR set to: 2

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	1887
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	1888
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	1889
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	1890
	
l10788:; BSR set to: 2

	call	_menu_draw_setup	;wreg free
	line	1891
	goto	l1049
	line	1900
	
l10790:; BSR set to: 2

	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u14581
	goto	u14580
u14581:
	goto	l10796
u14580:
	line	1902
	
l10792:; BSR set to: 2

	call	_save_current_config	;wreg free
	line	1903
	
l10794:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1905
	
l10796:; BSR set to: 2

	setf	((_current_menu))&0ffh
	line	1906
	goto	l1049
	line	1880
	
l10800:
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
	goto	l10512
	xorlw	1^0	; case 1
	skipnz
	goto	l10786
	xorlw	2^1	; case 2
	skipnz
	goto	l10512
	xorlw	3^2	; case 3
	skipnz
	goto	l10512
	xorlw	4^3	; case 4
	skipnz
	goto	l10790
	goto	l1049

	line	1909
	
l10802:; BSR set to: 2

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14591
	goto	u14590

u14591:
	goto	l10952
u14590:
	line	1911
	
l10804:; BSR set to: 2

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
	bnz	u14601
movf	(??_menu_handle_button+0+1)^00h,c,w
xorwf	(??_menu_handle_button+2+1)^00h,c,w
	btfss	status,2
	goto	u14601
	goto	u14600

u14601:
	goto	l10818
u14600:
	line	1913
	
l10806:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1914
	
l10808:
	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	1915
	
l10810:; BSR set to: 2

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	1916
	
l10812:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	1917
	
l10814:; BSR set to: 2

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l10788
	line	1920
	
l10818:; BSR set to: 2

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
	goto	u14611
	goto	u14610
u14611:
	goto	l1049
u14610:
	line	1922
	
l10820:; BSR set to: 2

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
	movwf	((menu_handle_button@sensor_type_1479))&0ffh
	line	1923
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
	movwf	((menu_handle_button@flow_type_1480))&0ffh
	line	1926
	
l10822:; BSR set to: 1

	movff	(menu_handle_button@sensor_type_1479),(c:is_numeric_field@sensor_type)
	movff	(menu_handle_button@flow_type_1480),(c:is_numeric_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u14621
	goto	u14620
u14621:
	goto	l10880
u14620:
	line	1928
	
l10824:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val))&0ffh
	line	1931
	movf	((menu_handle_button@sensor_type_1479))&0ffh,w
	btfss	status,2
	goto	u14631
	goto	u14630
u14631:
	goto	l10842
u14630:
	line	1933
	
l10826:; BSR set to: 1

		movlw	2
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14641
	goto	u14640

u14641:
	goto	l10830
u14640:
	line	1934
	
l10828:; BSR set to: 2

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
	goto	l10872
	line	1935
	
l10830:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14651
	goto	u14650

u14651:
	goto	l10834
u14650:
	line	1936
	
l10832:; BSR set to: 2

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
	goto	l10872
	line	1937
	
l10834:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14661
	goto	u14660

u14661:
	goto	l10838
u14660:
	line	1938
	
l10836:; BSR set to: 2

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
	goto	l10872
	line	1939
	
l10838:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14671
	goto	u14670

u14671:
	goto	l1154
u14670:
	line	1940
	
l10840:; BSR set to: 2

	movlw	high(032h)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(032h)
	movwf	((menu_handle_button@current_val))&0ffh
	goto	l10872
	line	1941
	
l1154:; BSR set to: 2

	goto	l10872
	line	1942
	
l10842:; BSR set to: 1

		decf	((menu_handle_button@sensor_type_1479))&0ffh,w
	btfss	status,2
	goto	u14681
	goto	u14680

u14681:
	goto	l10856
u14680:
	line	1944
	
l10844:; BSR set to: 1

		movlw	2
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14691
	goto	u14690

u14691:
	goto	l10848
u14690:
	goto	l10828
	line	1946
	
l10848:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14701
	goto	u14700

u14701:
	goto	l10852
u14700:
	goto	l10832
	line	1948
	
l10852:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14711
	goto	u14710

u14711:
	goto	l1154
u14710:
	goto	l10836
	line	1951
	
l10856:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1479))&0ffh,w
	btfss	status,2
	goto	u14721
	goto	u14720

u14721:
	goto	l10872
u14720:
	
l10858:; BSR set to: 1

	movf	((menu_handle_button@flow_type_1480))&0ffh,w
	btfss	status,2
	goto	u14731
	goto	u14730
u14731:
	goto	l10872
u14730:
	line	1953
	
l10860:; BSR set to: 1

		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14741
	goto	u14740

u14741:
	goto	l10864
u14740:
	goto	l10828
	line	1955
	
l10864:; BSR set to: 2

		movlw	5
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14751
	goto	u14750

u14751:
	goto	l10868
u14750:
	goto	l10832
	line	1957
	
l10868:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14761
	goto	u14760

u14761:
	goto	l1154
u14760:
	line	1958
	
l10870:; BSR set to: 2

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
	line	1961
	
l10872:
	movff	(menu_handle_button@current_val),(c:init_numeric_editor@value)
	movff	(menu_handle_button@current_val+1),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	1962
	
l10874:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1963
	
l10876:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l10510
	line	1967
	
l10880:
	movff	(menu_handle_button@sensor_type_1479),(c:is_time_field@sensor_type)
	movff	(menu_handle_button@flow_type_1480),(c:is_time_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u14771
	goto	u14770
u14771:
	goto	l10926
u14770:
	line	1969
	
l10882:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((menu_handle_button@current_val_1483+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val_1483))&0ffh
	line	1972
	movf	((menu_handle_button@sensor_type_1479))&0ffh,w
	btfss	status,2
	goto	u14781
	goto	u14780
u14781:
	goto	l10896
u14780:
	line	1974
	
l10884:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14791
	goto	u14790

u14791:
	goto	l10888
u14790:
	line	1975
	
l10886:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1483)
	movff	postdec2,(menu_handle_button@current_val_1483+1)
	goto	l10914
	line	1976
	
l10888:; BSR set to: 2

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14801
	goto	u14800

u14801:
	goto	l10892
u14800:
	line	1977
	
l10890:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1483)
	movff	postdec2,(menu_handle_button@current_val_1483+1)
	goto	l10914
	line	1978
	
l10892:; BSR set to: 2

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14811
	goto	u14810

u14811:
	goto	l1176
u14810:
	line	1979
	
l10894:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1483)
	movff	postdec2,(menu_handle_button@current_val_1483+1)
	goto	l10914
	line	1980
	
l1176:; BSR set to: 2

	goto	l10914
	line	1981
	
l10896:; BSR set to: 1

		decf	((menu_handle_button@sensor_type_1479))&0ffh,w
	btfss	status,2
	goto	u14821
	goto	u14820

u14821:
	goto	l10902
u14820:
	line	1983
	
l10898:; BSR set to: 1

		movlw	5
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14831
	goto	u14830

u14831:
	goto	l10914
u14830:
	goto	l10886
	line	1986
	
l10902:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@sensor_type_1479))&0ffh,w
	btfss	status,2
	goto	u14841
	goto	u14840

u14841:
	goto	l10914
u14840:
	line	1989
	
l10904:; BSR set to: 1

	movf	((menu_handle_button@flow_type_1480))&0ffh,w
	btfss	status,2
	goto	u14851
	goto	u14850
u14851:
	goto	l10908
u14850:
	
l10906:; BSR set to: 1

		movlw	7
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u14861
	goto	u14860

u14861:
	goto	l10912
u14860:
	
l10908:
	movlb	1	; () banked
		decf	((menu_handle_button@flow_type_1480))&0ffh,w
	btfss	status,2
	goto	u14871
	goto	u14870

u14871:
	goto	l10914
u14870:
	
l10910:; BSR set to: 1

		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14881
	goto	u14880

u14881:
	goto	l10914
u14880:
	line	1990
	
l10912:; BSR set to: 2

	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+022h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+022h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1483)
	movff	postdec2,(menu_handle_button@current_val_1483+1)
	line	1994
	
l10914:
		movlw	low(menu_handle_button@buf_1484)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1484)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_249)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_249)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@current_val_1483),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@current_val_1483+1),1+((c:?_sprintf)+04h)
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1995
	
l10916:
		movlw	low(menu_handle_button@buf_1484)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1484)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1997
	
l10918:
	movff	(menu_handle_button@current_val_1483),(c:init_time_editor@value_seconds)
	movff	(menu_handle_button@current_val_1483+1),(c:init_time_editor@value_seconds+1)
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	goto	l10874
	line	2003
	
l10926:
	movff	(menu_handle_button@sensor_type_1479),(c:is_option_field@sensor_type)
	movff	(menu_handle_button@flow_type_1480),(c:is_option_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u14891
	goto	u14890
u14891:
	goto	l10512
u14890:
	line	2005
	
l10928:
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
	line	2007
	
l10930:
	movff	(menu_handle_button@sensor_type_1479),(c:get_option_edit_flag@sensor_type)
	movff	(menu_handle_button@flow_type_1480),(c:get_option_edit_flag@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_handle_button@edit_flag_1487)
	movff	1+?_get_option_edit_flag,(menu_handle_button@edit_flag_1487+1)
	line	2008
	
l10932:
	movff	(menu_handle_button@sensor_type_1479),(c:get_item_options_for_field@sensor_type)
	movff	(menu_handle_button@flow_type_1480),(c:get_item_options_for_field@flow_type)
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_handle_button@opts_1488)
	movff	1+?_get_item_options_for_field,(menu_handle_button@opts_1488+1)
	line	2010
	
l10934:
	movlb	1	; () banked
	movf	((menu_handle_button@edit_flag_1487))&0ffh,w
iorwf	((menu_handle_button@edit_flag_1487+1))&0ffh,w
	btfsc	status,2
	goto	u14901
	goto	u14900

u14901:
	goto	l10948
u14900:
	
l10936:; BSR set to: 1

	movf	((menu_handle_button@opts_1488))&0ffh,w
iorwf	((menu_handle_button@opts_1488+1))&0ffh,w
	btfsc	status,2
	goto	u14911
	goto	u14910

u14911:
	goto	l10948
u14910:
	line	2013
	
l10938:; BSR set to: 1

	movlw	low(0)
	movwf	((menu_handle_button@i))&0ffh
	goto	l10946
	line	2015
	
l10940:; BSR set to: 1

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
	addwf	((menu_handle_button@opts_1488))&0ffh,w
	movwf	(??_menu_handle_button+2+0)^00h,c
	movf	(??_menu_handle_button+0+1)^00h,c,w
	addwfc	((menu_handle_button@opts_1488+1))&0ffh,w
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
	goto	u14921
	goto	u14920

u14921:
	goto	l10944
u14920:
	line	2017
	
l10942:
	movff	(menu_handle_button@edit_flag_1487),fsr2l
	movff	(menu_handle_button@edit_flag_1487+1),fsr2h
	movff	(menu_handle_button@i),indf2

	line	2018
	goto	l10948
	line	2013
	
l10944:
	movlb	1	; () banked
	incf	((menu_handle_button@i))&0ffh
	
l10946:; BSR set to: 1

	movlw	01h
	addwf	((menu_handle_button@opts_1488))&0ffh,w
	movwf	(??_menu_handle_button+0+0)^00h,c
	movlw	0
	addwfc	((menu_handle_button@opts_1488+1))&0ffh,w
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
	goto	u14931
	goto	u14930

u14931:
	goto	l10940
u14930:
	line	2023
	
l10948:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2024
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l10510
	line	2029
	
l10952:; BSR set to: 2

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14941
	goto	u14940

u14941:
	goto	l10986
u14940:
	line	2031
	
l10954:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	2033
	
l10956:
		movlw	4
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14951
	goto	u14950

u14951:
	goto	l10962
u14950:
	line	2035
	
l10958:; BSR set to: 2

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	2036
	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2037
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2038
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	2039
	
l10960:; BSR set to: 2

	call	_menu_draw_options	;wreg free
	line	2040
	goto	l1049
	line	2041
	
l10962:; BSR set to: 2

		movlw	03h-0
	cpfslt	((_menu))&0ffh
	goto	u14961
	goto	u14960

u14961:
	goto	l10974
u14960:
	line	2043
	
l10964:; BSR set to: 2

	movf	((_menu))&0ffh,w
	
	call	_rebuild_input_menu
	line	2044
	
l10966:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2045
	
l10968:; BSR set to: 2

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2046
	
l10970:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2047
	
l10972:; BSR set to: 2

	call	_menu_draw_input	;wreg free
	line	2048
	goto	l1049
	line	2049
	
l10974:; BSR set to: 2

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u14971
	goto	u14970

u14971:
	goto	l10512
u14970:
	line	2051
	
l10976:; BSR set to: 2

	call	_rebuild_clock_menu	;wreg free
	line	2052
	
l10978:
	movlw	low(03h)
	movlb	2	; () banked
	movwf	((_current_menu))&0ffh
	line	2053
	
l10980:; BSR set to: 2

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	2054
	
l10982:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	2055
	
l10984:
	call	_menu_draw_clock	;wreg free
	goto	l1049
	line	2058
	
l10986:; BSR set to: 2

		movlw	3
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u14981
	goto	u14980

u14981:
	goto	l1049
u14980:
	line	2062
	
l10988:; BSR set to: 2

		movlw	04h-1
	cpfsgt	((_menu))&0ffh
	goto	u14991
	goto	u14990

u14991:
	goto	l10992
u14990:
	
l10990:; BSR set to: 2

	movlw	high(0)
	movlb	1	; () banked
	movwf	((_menu_handle_button$1496+1))&0ffh
	movlw	low(0)
	movwf	((_menu_handle_button$1496))&0ffh
	goto	l10994
	
l10992:; BSR set to: 2

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
	movwf	((_menu_handle_button$1496))&0ffh
	clrf	((_menu_handle_button$1496+1))&0ffh
	
l10994:; BSR set to: 1

		movlw	low(menu_handle_button@buf_1494)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1494)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_250)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_250)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(_menu_handle_button$1496),0+((c:?_sprintf)+06h)
	movff	(_menu_handle_button$1496+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	2063
	
l10996:
		movlw	low(menu_handle_button@buf_1494)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1494)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2065
		movlw	3
	movlb	2	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15001
	goto	u15000

u15001:
	goto	l11010
u15000:
	goto	l10806
	line	2075
	
l11010:; BSR set to: 2

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
	goto	u15011
	goto	u15010
u15011:
	goto	l11044
u15010:
	line	2077
	
l11012:; BSR set to: 2

		movlw	low(STR_251)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_251)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	2080
	
l11014:
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
	line	2083
	
l11016:
	movlb	2	; () banked
	movf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15021
	goto	u15020
u15021:
	goto	l11020
u15020:
	line	2085
	
l11018:; BSR set to: 2

		movff	0+(_clock_menu+02h),(c:strcmp@s1)
	movff	1+(_clock_menu+02h),(c:strcmp@s1+1)

		movlw	low(STR_252)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_252)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u15031
	goto	u15030

u15031:
	movlw	1
	goto	u15040
u15030:
	movlw	0
u15040:
	movwf	((c:_enable_edit_flag))^00h,c
	line	2086
	goto	l11036
	line	2087
	
l11020:; BSR set to: 2

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15051
	goto	u15050

u15051:
	goto	l11032
u15050:
	line	2089
	
l11022:; BSR set to: 2

		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_253)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_253)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u15061
	goto	u15060

u15061:
	goto	l11026
u15060:
	line	2090
	
l11024:
	movlw	low(0)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l11036
	line	2091
	
l11026:
		movff	0+(_clock_menu+07h),(c:strcmp@s1)
	movff	1+(_clock_menu+07h),(c:strcmp@s1+1)

		movlw	low(STR_254)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_254)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfss	status,2
	goto	u15071
	goto	u15070

u15071:
	goto	l11030
u15070:
	line	2092
	
l11028:
	movlw	low(01h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l11036
	line	2094
	
l11030:
	movlw	low(02h)
	movwf	((c:_relay_high_edit_flag))^00h,c
	goto	l11036
	line	2096
	
l11032:; BSR set to: 2

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u15081
	goto	u15080

u15081:
	goto	l11036
u15080:
	line	2098
	
l11034:; BSR set to: 2

		movff	0+(_clock_menu+0Ch),(c:strcmp@s1)
	movff	1+(_clock_menu+0Ch),(c:strcmp@s1+1)

		movlw	low(STR_255)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_255)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u15091
	goto	u15090

u15091:
	movlw	1
	goto	u15100
u15090:
	movlw	0
u15100:
	movwf	((c:_display_edit_flag))^00h,c
	line	2101
	
l11036:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	2102
	
l11038:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	2103
	
l11040:; BSR set to: 2

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l10984
	line	2110
	
l11044:; BSR set to: 2

		movlw	low(STR_256)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_256)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l1049
	line	2114
	
l11046:; BSR set to: 1

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u15111
	goto	u15110

u15111:
	goto	l1049
u15110:
	goto	l10774
	line	2121
	
l1049:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_button
	__end_of_menu_handle_button:
	signat	_menu_handle_button,4217
	global	_rebuild_input_menu

;; *************** function _rebuild_input_menu *****************
;; Defined at:
;;		line 613 in file "src\menu.c"
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
	line	613
global __ptext10
__ptext10:
psect	text10
	file	"src\menu.c"
	line	613
	
_rebuild_input_menu:
;incstack = 0
	callstack 24
	movlb	0	; () banked
	movwf	((rebuild_input_menu@input_num))&0ffh
	line	616
	
l9618:
	movff	(rebuild_input_menu@input_num),(_current_input)
	line	619
	
l9620:
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
	line	620
	
l9622:; BSR set to: 0

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
	line	623
	
l9624:; BSR set to: 0

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
	goto	u12641
	goto	u12640
u12641:
	goto	l9628
u12640:
	
l9626:; BSR set to: 0

		movlw	low(STR_125)
	movwf	((_rebuild_input_menu$1143))&0ffh
	movlw	high(STR_125)
	movwf	((_rebuild_input_menu$1143+1))&0ffh

	goto	l9630
	
l9628:; BSR set to: 0

		movlw	low(STR_124)
	movwf	((_rebuild_input_menu$1143))&0ffh
	movlw	high(STR_124)
	movwf	((_rebuild_input_menu$1143+1))&0ffh

	
l9630:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_123)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_123)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_input_menu$1143),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$1143+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	625
	
l9632:
	movlb	0	; () banked
	movf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u12651
	goto	u12650
u12651:
	goto	l9738
u12650:
	line	627
	
l9634:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_126)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_126)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	628
	
l9636:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_127)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_127)
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
	line	629
	
l9638:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_128)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_128)
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
	line	630
	
l9640:
		movlw	low(_value_hi_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_hi_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_129)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_129)
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
	line	633
	
l9642:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2425)
	movff	1+?___lwdiv,(_rebuild_input_menu$2425+1)
	
l9644:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2426)
	movff	1+?___lwmod,(_rebuild_input_menu$2426+1)
	
l9646:
		movlw	low(_value_highbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_highbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_130)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_130)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2425),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2425+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2426),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2426+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	634
	
l9648:
		movlw	low(_value_low_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_131)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_131)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	high(032h)
	movwf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(032h)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	637
	
l9650:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2425)
	movff	1+?___lwdiv,(_rebuild_input_menu$2425+1)
	
l9652:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2426)
	movff	1+?___lwmod,(_rebuild_input_menu$2426+1)
	
l9654:
		movlw	low(_value_plpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_plpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_132)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_132)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2425),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2425+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2426),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2426+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	640
	
l9656:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2425)
	movff	1+?___lwdiv,(_rebuild_input_menu$2425+1)
	
l9658:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2426)
	movff	1+?___lwmod,(_rebuild_input_menu$2426+1)
	
l9660:
		movlw	low(_value_slpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_slpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_133)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_133)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2425),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2425+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2426),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2426+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	643
	
l9662:
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
	goto	u12661
	goto	u12660
u12661:
	goto	l9670
u12660:
	
l9664:; BSR set to: 0

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
	goto	u12671
	goto	u12670

u12671:
	goto	l9668
u12670:
	
l9666:; BSR set to: 0

		movlw	low(STR_136)
	movwf	((_rebuild_input_menu$1158))&0ffh
	movlw	high(STR_136)
	movwf	((_rebuild_input_menu$1158+1))&0ffh

	goto	l620
	
l9668:; BSR set to: 0

		movlw	low(STR_135)
	movwf	((_rebuild_input_menu$1158))&0ffh
	movlw	high(STR_135)
	movwf	((_rebuild_input_menu$1158+1))&0ffh

	
l620:; BSR set to: 0

		movff	(_rebuild_input_menu$1158),(_rebuild_input_menu$1157)
	movff	(_rebuild_input_menu$1158+1),(_rebuild_input_menu$1157+1)

	goto	l9672
	
l9670:; BSR set to: 0

		movlw	low(STR_134)
	movwf	((_rebuild_input_menu$1157))&0ffh
	movlw	high(STR_134)
	movwf	((_rebuild_input_menu$1157+1))&0ffh

	
l9672:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1157),(c:strcpy@from)
	movff	(_rebuild_input_menu$1157+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	645
	
l9674:
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
	goto	u12681
	goto	u12680
u12681:
	goto	l9682
u12680:
	
l9676:; BSR set to: 0

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
	goto	u12691
	goto	u12690

u12691:
	goto	l9680
u12690:
	
l9678:; BSR set to: 0

		movlw	low(STR_139)
	movwf	((_rebuild_input_menu$1165))&0ffh
	movlw	high(STR_139)
	movwf	((_rebuild_input_menu$1165+1))&0ffh

	goto	l628
	
l9680:; BSR set to: 0

		movlw	low(STR_138)
	movwf	((_rebuild_input_menu$1165))&0ffh
	movlw	high(STR_138)
	movwf	((_rebuild_input_menu$1165+1))&0ffh

	
l628:; BSR set to: 0

		movff	(_rebuild_input_menu$1165),(_rebuild_input_menu$1164)
	movff	(_rebuild_input_menu$1165+1),(_rebuild_input_menu$1164+1)

	goto	l9684
	
l9682:; BSR set to: 0

		movlw	low(STR_137)
	movwf	((_rebuild_input_menu$1164))&0ffh
	movlw	high(STR_137)
	movwf	((_rebuild_input_menu$1164+1))&0ffh

	
l9684:; BSR set to: 0

		movlw	low(_value_rlyplp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyplp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1164),(c:strcpy@from)
	movff	(_rebuild_input_menu$1164+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	647
	
l9686:
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
	goto	u12701
	goto	u12700
u12701:
	goto	l9694
u12700:
	
l9688:; BSR set to: 0

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
	goto	u12711
	goto	u12710

u12711:
	goto	l9692
u12710:
	
l9690:; BSR set to: 0

		movlw	low(STR_142)
	movwf	((_rebuild_input_menu$1172))&0ffh
	movlw	high(STR_142)
	movwf	((_rebuild_input_menu$1172+1))&0ffh

	goto	l636
	
l9692:; BSR set to: 0

		movlw	low(STR_141)
	movwf	((_rebuild_input_menu$1172))&0ffh
	movlw	high(STR_141)
	movwf	((_rebuild_input_menu$1172+1))&0ffh

	
l636:; BSR set to: 0

		movff	(_rebuild_input_menu$1172),(_rebuild_input_menu$1171)
	movff	(_rebuild_input_menu$1172+1),(_rebuild_input_menu$1171+1)

	goto	l9696
	
l9694:; BSR set to: 0

		movlw	low(STR_140)
	movwf	((_rebuild_input_menu$1171))&0ffh
	movlw	high(STR_140)
	movwf	((_rebuild_input_menu$1171+1))&0ffh

	
l9696:; BSR set to: 0

		movlw	low(_value_rlyslp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyslp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1171),(c:strcpy@from)
	movff	(_rebuild_input_menu$1171+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	648
	
l9698:
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
	goto	u12721
	goto	u12720
u12721:
	goto	l9702
u12720:
	
l9700:; BSR set to: 0

		movlw	low(STR_144)
	movwf	((_rebuild_input_menu$1176))&0ffh
	movlw	high(STR_144)
	movwf	((_rebuild_input_menu$1176+1))&0ffh

	goto	l9704
	
l9702:; BSR set to: 0

		movlw	low(STR_143)
	movwf	((_rebuild_input_menu$1176))&0ffh
	movlw	high(STR_143)
	movwf	((_rebuild_input_menu$1176+1))&0ffh

	
l9704:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1176),(c:strcpy@from)
	movff	(_rebuild_input_menu$1176+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	651
	
l9706:
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
	line	654
	
l9708:
		movlw	low(_value_enable)
	movlb	2	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	655
	
l9710:; BSR set to: 2

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	656
	
l9712:; BSR set to: 2

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	657
	
l9714:; BSR set to: 2

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	658
	
l9716:; BSR set to: 2

		movlw	low(_value_hi_pressure)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_hi_pressure)
	movwf	(1+(_input_menu+016h))&0ffh

	line	659
	
l9718:; BSR set to: 2

		movlw	low(_value_highbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_highbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	660
	
l9720:; BSR set to: 2

		movlw	low(_value_low_pressure)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_pressure)
	movwf	(1+(_input_menu+020h))&0ffh

	line	661
	
l9722:; BSR set to: 2

		movlw	low(_value_plpbp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_plpbp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	662
	
l9724:; BSR set to: 2

		movlw	low(_value_slpbp)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_slpbp)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	663
	
l9726:; BSR set to: 2

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	664
	
l9728:; BSR set to: 2

		movlw	low(_value_rlyplp)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_rlyplp)
	movwf	(1+(_input_menu+034h))&0ffh

	line	665
	
l9730:; BSR set to: 2

		movlw	low(_value_rlyslp)
	movwf	(0+(_input_menu+039h))&0ffh
	movlw	high(_value_rlyslp)
	movwf	(1+(_input_menu+039h))&0ffh

	line	666
	
l9732:; BSR set to: 2

		movlw	low(_value_display)
	movwf	(0+(_input_menu+03Eh))&0ffh
	clrf	(1+(_input_menu+03Eh))&0ffh

	line	667
	
l9734:; BSR set to: 2

		movlw	low(_value_back)
	movwf	(0+(_input_menu+043h))&0ffh
	clrf	(1+(_input_menu+043h))&0ffh

	line	669
	
l9736:; BSR set to: 2

	movlw	low(0Eh)
	movwf	(0+(_menu+02h))&0ffh
	line	670
	goto	l9904
	line	671
	
l9738:; BSR set to: 0

		decf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u12731
	goto	u12730

u12731:
	goto	l9796
u12730:
	line	673
	
l9740:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_145)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_145)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	674
	
l9742:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_146)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_146)
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
	line	675
	
l9744:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_147)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_147)
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
	line	676
	
l9746:
		movlw	low(_value_high_temp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_temp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_148)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_148)
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
	line	679
	
l9748:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2425)
	movff	1+?___lwdiv,(_rebuild_input_menu$2425+1)
	
l9750:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2426)
	movff	1+?___lwmod,(_rebuild_input_menu$2426+1)
	
l9752:
		movlw	low(_value_high_tbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_tbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_149)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_149)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2425),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2425+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2426),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2426+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	681
	
l9754:
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
	goto	u12741
	goto	u12740
u12741:
	goto	l9762
u12740:
	
l9756:; BSR set to: 0

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
	goto	u12751
	goto	u12750

u12751:
	goto	l9760
u12750:
	
l9758:; BSR set to: 0

		movlw	low(STR_152)
	movwf	((_rebuild_input_menu$1191))&0ffh
	movlw	high(STR_152)
	movwf	((_rebuild_input_menu$1191+1))&0ffh

	goto	l650
	
l9760:; BSR set to: 0

		movlw	low(STR_151)
	movwf	((_rebuild_input_menu$1191))&0ffh
	movlw	high(STR_151)
	movwf	((_rebuild_input_menu$1191+1))&0ffh

	
l650:; BSR set to: 0

		movff	(_rebuild_input_menu$1191),(_rebuild_input_menu$1190)
	movff	(_rebuild_input_menu$1191+1),(_rebuild_input_menu$1190+1)

	goto	l9764
	
l9762:; BSR set to: 0

		movlw	low(STR_150)
	movwf	((_rebuild_input_menu$1190))&0ffh
	movlw	high(STR_150)
	movwf	((_rebuild_input_menu$1190+1))&0ffh

	
l9764:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1190),(c:strcpy@from)
	movff	(_rebuild_input_menu$1190+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	682
	
l9766:
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
	goto	u12761
	goto	u12760
u12761:
	goto	l9770
u12760:
	
l9768:; BSR set to: 0

		movlw	low(STR_154)
	movwf	((_rebuild_input_menu$1195))&0ffh
	movlw	high(STR_154)
	movwf	((_rebuild_input_menu$1195+1))&0ffh

	goto	l9772
	
l9770:; BSR set to: 0

		movlw	low(STR_153)
	movwf	((_rebuild_input_menu$1195))&0ffh
	movlw	high(STR_153)
	movwf	((_rebuild_input_menu$1195+1))&0ffh

	
l9772:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1195),(c:strcpy@from)
	movff	(_rebuild_input_menu$1195+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	685
	
l9774:
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
	line	688
	
l9776:
		movlw	low(_value_enable)
	movlb	2	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	689
	
l9778:; BSR set to: 2

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	690
	
l9780:; BSR set to: 2

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	691
	
l9782:; BSR set to: 2

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	692
	
l9784:; BSR set to: 2

		movlw	low(_value_high_temp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_high_temp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	693
	
l9786:; BSR set to: 2

		movlw	low(_value_high_tbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_high_tbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	694
	
l9788:; BSR set to: 2

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+020h))&0ffh

	line	695
	
l9790:; BSR set to: 2

		movlw	low(_value_display)
	movwf	(0+(_input_menu+025h))&0ffh
	clrf	(1+(_input_menu+025h))&0ffh

	line	696
	
l9792:; BSR set to: 2

		movlw	low(_value_back)
	movwf	(0+(_input_menu+02Ah))&0ffh
	clrf	(1+(_input_menu+02Ah))&0ffh

	line	698
	
l9794:; BSR set to: 2

	movlw	low(09h)
	movwf	(0+(_menu+02h))&0ffh
	line	699
	goto	l9904
	line	700
	
l9796:; BSR set to: 0

		movlw	2
	xorwf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u12771
	goto	u12770

u12771:
	goto	l9904
u12770:
	line	702
	
l9798:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_155)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_155)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	703
	
l9800:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfsc	status,2
	goto	u12781
	goto	u12780
u12781:
	goto	l9804
u12780:
	
l9802:; BSR set to: 0

		movlw	low(STR_157)
	movwf	((_rebuild_input_menu$1200))&0ffh
	movlw	high(STR_157)
	movwf	((_rebuild_input_menu$1200+1))&0ffh

	goto	l9806
	
l9804:; BSR set to: 0

		movlw	low(STR_156)
	movwf	((_rebuild_input_menu$1200))&0ffh
	movlw	high(STR_156)
	movwf	((_rebuild_input_menu$1200+1))&0ffh

	
l9806:; BSR set to: 0

		movlw	low(_value_flow_type)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_type)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1200),(c:strcpy@from)
	movff	(_rebuild_input_menu$1200+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	704
	
l9808:
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
	goto	u12791
	goto	u12790
u12791:
	goto	l9812
u12790:
	
l9810:; BSR set to: 0

		movlw	low(STR_159)
	movwf	((_rebuild_input_menu$1204))&0ffh
	movlw	high(STR_159)
	movwf	((_rebuild_input_menu$1204+1))&0ffh

	goto	l9814
	
l9812:; BSR set to: 0

		movlw	low(STR_158)
	movwf	((_rebuild_input_menu$1204))&0ffh
	movlw	high(STR_158)
	movwf	((_rebuild_input_menu$1204+1))&0ffh

	
l9814:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1204),(c:strcpy@from)
	movff	(_rebuild_input_menu$1204+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	706
	
l9816:
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
	goto	u12801
	goto	u12800
u12801:
	goto	l9824
u12800:
	
l9818:; BSR set to: 0

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
	goto	u12811
	goto	u12810

u12811:
	goto	l9822
u12810:
	
l9820:; BSR set to: 0

		movlw	low(STR_162)
	movwf	((_rebuild_input_menu$1211))&0ffh
	movlw	high(STR_162)
	movwf	((_rebuild_input_menu$1211+1))&0ffh

	goto	l672
	
l9822:; BSR set to: 0

		movlw	low(STR_161)
	movwf	((_rebuild_input_menu$1211))&0ffh
	movlw	high(STR_161)
	movwf	((_rebuild_input_menu$1211+1))&0ffh

	
l672:; BSR set to: 0

		movff	(_rebuild_input_menu$1211),(_rebuild_input_menu$1210)
	movff	(_rebuild_input_menu$1211+1),(_rebuild_input_menu$1210+1)

	goto	l9826
	
l9824:; BSR set to: 0

		movlw	low(STR_160)
	movwf	((_rebuild_input_menu$1210))&0ffh
	movlw	high(STR_160)
	movwf	((_rebuild_input_menu$1210+1))&0ffh

	
l9826:; BSR set to: 0

		movlw	low(_value_rlylow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlylow)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1210),(c:strcpy@from)
	movff	(_rebuild_input_menu$1210+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	708
	
l9828:
	movlb	0	; () banked
	movf	((rebuild_input_menu@flow_type_val))&0ffh,w
	btfss	status,2
	goto	u12821
	goto	u12820
u12821:
	goto	l9876
u12820:
	line	710
	
l9830:; BSR set to: 0

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
	goto	u12831
	goto	u12830
u12831:
	goto	l9834
u12830:
	
l9832:; BSR set to: 0

		movlw	low(STR_164)
	movwf	((_rebuild_input_menu$1215))&0ffh
	movlw	high(STR_164)
	movwf	((_rebuild_input_menu$1215+1))&0ffh

	goto	l9836
	
l9834:; BSR set to: 0

		movlw	low(STR_163)
	movwf	((_rebuild_input_menu$1215))&0ffh
	movlw	high(STR_163)
	movwf	((_rebuild_input_menu$1215+1))&0ffh

	
l9836:; BSR set to: 0

		movlw	low(_value_flow_units)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_flow_units)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1215),(c:strcpy@from)
	movff	(_rebuild_input_menu$1215+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	711
	
l9838:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale4)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_165)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_165)
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
	line	712
	
l9840:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_166)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_166)
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
	line	713
	
l9842:
		movlw	low(_value_low_flow)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_167)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_167)
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
	line	716
	
l9844:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2425)
	movff	1+?___lwdiv,(_rebuild_input_menu$2425+1)
	
l9846:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2426)
	movff	1+?___lwmod,(_rebuild_input_menu$2426+1)
	
l9848:
		movlw	low(_value_low_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_168)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_168)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2425),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2425+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2426),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2426+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	719
	
l9850:
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
	line	722
	
l9852:
		movlw	low(_value_enable)
	movlb	2	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	723
	
l9854:; BSR set to: 2

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	724
	
l9856:; BSR set to: 2

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	725
	
l9858:; BSR set to: 2

		movlw	low(_value_flow_units)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_flow_units)
	movwf	(1+(_input_menu+011h))&0ffh

	line	726
	
l9860:; BSR set to: 2

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_scale4)
	movwf	(1+(_input_menu+016h))&0ffh

	line	727
	
l9862:; BSR set to: 2

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	728
	
l9864:; BSR set to: 2

		movlw	low(_value_low_flow)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_flow)
	movwf	(1+(_input_menu+020h))&0ffh

	line	729
	
l9866:; BSR set to: 2

		movlw	low(_value_low_flow_bp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_low_flow_bp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	730
	
l9868:; BSR set to: 2

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	731
	
l9870:; BSR set to: 2

		movlw	low(_value_display)
	movwf	(0+(_input_menu+02Fh))&0ffh
	clrf	(1+(_input_menu+02Fh))&0ffh

	line	732
	
l9872:; BSR set to: 2

		movlw	low(_value_back)
	movwf	(0+(_input_menu+034h))&0ffh
	clrf	(1+(_input_menu+034h))&0ffh

	line	734
	
l9874:; BSR set to: 2

	movlw	low(0Bh)
	movwf	(0+(_menu+02h))&0ffh
	line	735
	goto	l9904
	line	738
	
l9876:; BSR set to: 0

		movlw	low(_value_no_flow)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_no_flow)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_169)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_169)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	741
	
l9878:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2425)
	movff	1+?___lwdiv,(_rebuild_input_menu$2425+1)
	
l9880:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2426)
	movff	1+?___lwmod,(_rebuild_input_menu$2426+1)
	
l9882:
		movlw	low(_value_no_flow_bp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_no_flow_bp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_170)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_170)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2425),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2425+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2426),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2426+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	744
	
l9884:
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
	line	747
	
l9886:
		movlw	low(_value_enable)
	movlb	2	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	748
	
l9888:; BSR set to: 2

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	749
	
l9890:; BSR set to: 2

		movlw	low(_value_flow_type)
	movwf	(0+(_input_menu+0Ch))&0ffh
	movlw	high(_value_flow_type)
	movwf	(1+(_input_menu+0Ch))&0ffh

	line	750
	
l9892:; BSR set to: 2

		movlw	low(_value_no_flow)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_no_flow)
	movwf	(1+(_input_menu+011h))&0ffh

	line	751
	
l9894:; BSR set to: 2

		movlw	low(_value_no_flow_bp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_no_flow_bp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	752
	
l9896:; BSR set to: 2

		movlw	low(_value_rlylow)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_rlylow)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	753
	
l9898:; BSR set to: 2

		movlw	low(_value_display)
	movwf	(0+(_input_menu+020h))&0ffh
	clrf	(1+(_input_menu+020h))&0ffh

	line	754
	
l9900:; BSR set to: 2

		movlw	low(_value_back)
	movwf	(0+(_input_menu+025h))&0ffh
	clrf	(1+(_input_menu+025h))&0ffh

	line	756
	
l9902:; BSR set to: 2

	movlw	low(08h)
	movwf	(0+(_menu+02h))&0ffh
	line	763
	
l9904:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_171)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_171)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(rebuild_input_menu@sensor),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	(rebuild_input_menu@flow_type_val),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	764
	
l9906:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	765
	
l679:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_input_menu
	__end_of_rebuild_input_menu:
	signat	_rebuild_input_menu,4217
	global	_rebuild_clock_menu

;; *************** function _rebuild_clock_menu *****************
;; Defined at:
;;		line 1275 in file "src\menu.c"
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
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0      56       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       56 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_memcpy
;;		_sprintf
;;		_strcpy
;;		_uart_println
;; This function is called by:
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2,group=0
	line	1275
global __ptext11
__ptext11:
psect	text11
	file	"src\menu.c"
	line	1275
	
_rebuild_clock_menu:
;incstack = 0
	callstack 24
	line	1281
	
l9954:; BSR set to: 2

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_209)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_209)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_system_config),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_system_config+06h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1282
	
l9956:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1285
	
l9958:
	movlb	4	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u13001
	goto	u13000
u13001:
	goto	l9962
u13000:
	
l9960:; BSR set to: 4

		movlw	low(STR_212)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1376))&0ffh
	movlw	high(STR_212)
	movwf	((_rebuild_clock_menu$1376+1))&0ffh

	goto	l9964
	
l9962:; BSR set to: 4

		movlw	low(STR_211)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1376))&0ffh
	movlw	high(STR_211)
	movwf	((_rebuild_clock_menu$1376+1))&0ffh

	
l9964:; BSR set to: 0

		movlw	low(_value_clock_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_clock_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_210)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_210)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_clock_menu$1376),0+((c:?_sprintf)+04h)
	movff	(_rebuild_clock_menu$1376+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	1287
	
l9966:
	movlb	4	; () banked
	movf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u13011
	goto	u13010
u13011:
	goto	l9974
u13010:
	
l9968:; BSR set to: 4

		decf	(0+(_system_config+06h))&0ffh,w
	btfsc	status,2
	goto	u13021
	goto	u13020

u13021:
	goto	l9972
u13020:
	
l9970:; BSR set to: 4

		movlw	low(STR_215)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1383))&0ffh
	movlw	high(STR_215)
	movwf	((_rebuild_clock_menu$1383+1))&0ffh

	goto	l936
	
l9972:; BSR set to: 4

		movlw	low(STR_214)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1383))&0ffh
	movlw	high(STR_214)
	movwf	((_rebuild_clock_menu$1383+1))&0ffh

	
l936:; BSR set to: 0

		movff	(_rebuild_clock_menu$1383),(_rebuild_clock_menu$1382)
	movff	(_rebuild_clock_menu$1383+1),(_rebuild_clock_menu$1382+1)

	goto	l9976
	
l9974:; BSR set to: 4

		movlw	low(STR_213)
	movlb	0	; () banked
	movwf	((_rebuild_clock_menu$1382))&0ffh
	movlw	high(STR_213)
	movwf	((_rebuild_clock_menu$1382+1))&0ffh

	
l9976:; BSR set to: 0

		movlw	low(_value_end_runtime)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_end_runtime)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_clock_menu$1382),(c:strcpy@from)
	movff	(_rebuild_clock_menu$1382+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	1288
	
l9978:
		movlw	low(_value_clock_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_clock_display)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_216)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_216)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	1290
	
l9980:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_217)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_217)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(_value_clock_enable)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	movlw	high(_value_clock_enable)
	movwf	(1+((c:?_sprintf)+04h))^00h,c

		movlw	low(_value_end_runtime)
	movwf	(0+((c:?_sprintf)+06h))^00h,c
	movlw	high(_value_end_runtime)
	movwf	(1+((c:?_sprintf)+06h))^00h,c

	call	_sprintf	;wreg free
	line	1291
	
l9982:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1294
	
l9984:
		movlw	low(_clock_menu)
	movwf	((c:memcpy@d1))^00h,c
	movlw	high(_clock_menu)
	movwf	((c:memcpy@d1+1))^00h,c

		movlw	low(_clock_menu_template)
	movwf	((c:memcpy@s1))^00h,c
	movlw	high(_clock_menu_template)
	movwf	((c:memcpy@s1+1))^00h,c

	movlw	high(014h)
	movwf	((c:memcpy@n+1))^00h,c
	movlw	low(014h)
	movwf	((c:memcpy@n))^00h,c
	call	_memcpy	;wreg free
	line	1297
	
l9986:
		movlw	low(_value_clock_enable)
	movlb	1	; () banked
	movwf	(0+(_clock_menu+02h))&0ffh
	movlw	high(_value_clock_enable)
	movwf	(1+(_clock_menu+02h))&0ffh

	line	1298
	
l9988:; BSR set to: 1

		movlw	low(_value_end_runtime)
	movwf	(0+(_clock_menu+07h))&0ffh
	movlw	high(_value_end_runtime)
	movwf	(1+(_clock_menu+07h))&0ffh

	line	1299
	
l9990:; BSR set to: 1

		movlw	low(_value_clock_display)
	movwf	(0+(_clock_menu+0Ch))&0ffh
	movlw	high(_value_clock_display)
	movwf	(1+(_clock_menu+0Ch))&0ffh

	line	1300
	
l9992:; BSR set to: 1

		movlw	low(_value_back)
	movwf	(0+(_clock_menu+011h))&0ffh
	clrf	(1+(_clock_menu+011h))&0ffh

	line	1302
	
l9994:; BSR set to: 1

	movlw	low(04h)
	movlb	2	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	1304
	
l9996:; BSR set to: 2

		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_218)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_218)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+02h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1305
	
l9998:
		movlw	low(rebuild_clock_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1306
	
l937:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_clock_menu
	__end_of_rebuild_clock_menu:
	signat	_rebuild_clock_menu,89
	global	_menu_update_time_value

;; *************** function _menu_update_time_value *****************
;; Defined at:
;;		line 503 in file "src\menu.c"
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
;; Hardware stack levels required when called: 5
;; This function calls:
;;		___lbdiv
;;		___lbmod
;;		_is_time_field
;;		_lcd_print
;;		_lcd_set_cursor
;;		_sprintf
;;		_uart_println
;; This function is called by:
;;		_main
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2,group=0
	line	503
global __ptext12
__ptext12:
psect	text12
	file	"src\menu.c"
	line	503
	
_menu_update_time_value:
;incstack = 0
	callstack 25
	line	506
	
l9348:
	movlb	2	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u12221
	goto	u12220

u12221:
	goto	l586
u12220:
	
l9350:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u12231
	goto	u12230
u12231:
	goto	l9352
u12230:
	goto	l586
	line	510
	
l9352:; BSR set to: 2

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	0	; () banked
	movwf	((menu_update_time_value@screen_line))&0ffh
	line	511
		movlw	03h-1
	cpfsgt	((menu_update_time_value@screen_line))&0ffh
	goto	u12241
	goto	u12240

u12241:
	goto	l587
u12240:
	goto	l586
	line	512
	
l587:; BSR set to: 0

	line	514
	movff	(_menu),(menu_update_time_value@item_idx)
	line	518
	
l9356:; BSR set to: 0

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
	line	519
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
	line	522
	
l9358:; BSR set to: 0

	movff	(menu_update_time_value@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_update_time_value@flow_type),(c:is_time_field@flow_type)
	movf	((menu_update_time_value@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfss	status,2
	goto	u12251
	goto	u12250
u12251:
	goto	l9362
u12250:
	goto	l586
	line	531
	
l9362:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_117)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_117)
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
	line	532
	
l9364:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	535
	
l9366:
	movlb	2	; () banked
	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u12261
	goto	u12260
u12261:
	goto	l9372
u12260:
	
l9368:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u12271
	goto	u12270
u12271:
	goto	l9372
u12270:
	line	537
	
l9370:; BSR set to: 2

	movlw	low(020h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	538
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	539
	goto	l9374
	line	542
	
l9372:; BSR set to: 2

	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	(0+(_menu+012h))&0ffh,w
	
	call	___lbdiv
	addlw	low(030h)
	movlb	0	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	543
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	2	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	547
	
l9374:; BSR set to: 0

	movlw	low(03Ah)
	movwf	(0+(menu_update_time_value@value_buf+02h))&0ffh
	line	550
	
l9376:; BSR set to: 0

	movlb	2	; () banked
		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u12281
	goto	u12280

u12281:
	goto	l9382
u12280:
	
l9378:; BSR set to: 2

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u12291
	goto	u12290
u12291:
	goto	l9382
u12290:
	line	552
	
l9380:; BSR set to: 2

	movlw	low(020h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	553
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	554
	goto	l9384
	line	557
	
l9382:; BSR set to: 2

	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	(0+(_menu+013h))&0ffh,w
	
	call	___lbdiv
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	558
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	2	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	561
	
l9384:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(menu_update_time_value@value_buf+05h))&0ffh
	line	565
	
l9386:; BSR set to: 0

		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_118)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_118)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(menu_update_time_value@value_buf)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	(1+((c:?_sprintf)+04h))^00h,c

	call	_sprintf	;wreg free
	line	566
	
l9388:
		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	569
	
l9390:
	line	571
	
l9392:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	572
	
l9394:
		movlw	low(STR_119)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_119)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	574
	
l9396:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	0	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	575
	
l9398:
		movlw	low(STR_120)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_120)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	576
	
l9400:
		movlw	low(menu_update_time_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	577
	
l9402:
		movlw	low(STR_121)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_121)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	578
	
l586:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_time_value
	__end_of_menu_update_time_value:
	signat	_menu_update_time_value,89
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
;;		On entry : 3F/2
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
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
global __ptext13
__ptext13:
psect	text13
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
	
___lbmod:
;incstack = 0
	callstack 27
	movwf	((c:___lbmod@dividend))^00h,c
	line	9
	
l6312:
	movlw	low(08h)
	movwf	((c:___lbmod@counter))^00h,c
	line	10
	movlw	low(0)
	movwf	((c:___lbmod@rem))^00h,c
	line	12
	
l6314:
	bcf	status,0
	rlcf	((c:___lbmod@dividend))^00h,c,w
	rlcf	((c:___lbmod@rem))^00h,c,w
	movwf	((c:___lbmod@rem))^00h,c
	line	13
	
l6316:
	bcf status,0
	rlcf	((c:___lbmod@dividend))^00h,c

	line	14
	
l6318:
		movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c,w
	btfss	status,0
	goto	u7111
	goto	u7110

u7111:
	goto	l6322
u7110:
	line	15
	
l6320:
	movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c
	line	16
	
l6322:
	decfsz	((c:___lbmod@counter))^00h,c
	
	goto	l6314
	line	17
	
l6324:
	movf	((c:___lbmod@rem))^00h,c,w
	line	18
	
l1804:
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
;;		On entry : 3F/2
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
;; This function uses a non-reentrant model
;;
psect	text14,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
global __ptext14
__ptext14:
psect	text14
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
	
___lbdiv:
;incstack = 0
	callstack 27
	movwf	((c:___lbdiv@dividend))^00h,c
	line	9
	
l6286:
	movlw	low(0)
	movwf	((c:___lbdiv@quotient))^00h,c
	line	10
	
l6288:
	movf	((c:___lbdiv@divisor))^00h,c,w
	btfsc	status,2
	goto	u7081
	goto	u7080
u7081:
	goto	l6308
u7080:
	line	11
	
l6290:
	movlw	low(01h)
	movwf	((c:___lbdiv@counter))^00h,c
	line	12
	goto	l6296
	line	13
	
l6292:
	bcf status,0
	rlcf	((c:___lbdiv@divisor))^00h,c

	line	14
	
l6294:
	incf	((c:___lbdiv@counter))^00h,c
	line	12
	
l6296:
	
	btfss	((c:___lbdiv@divisor))^00h,c,(7)&7
	goto	u7091
	goto	u7090
u7091:
	goto	l6292
u7090:
	line	17
	
l6298:
	bcf status,0
	rlcf	((c:___lbdiv@quotient))^00h,c

	line	18
		movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c,w
	btfss	status,0
	goto	u7101
	goto	u7100

u7101:
	goto	l6304
u7100:
	line	19
	
l6300:
	movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c
	line	20
	
l6302:
	bsf	(0+(0/8)+(c:___lbdiv@quotient))^00h,c,(0)&7
	line	22
	
l6304:
	bcf status,0
	rrcf	((c:___lbdiv@divisor))^00h,c

	line	23
	
l6306:
	decfsz	((c:___lbdiv@counter))^00h,c
	
	goto	l6298
	line	25
	
l6308:
	movf	((c:___lbdiv@quotient))^00h,c,w
	line	26
	
l1798:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
	signat	___lbdiv,8313
	global	_menu_draw_setup

;; *************** function _menu_draw_setup *****************
;; Defined at:
;;		line 1195 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  label           2   40[COMRAM] PTR const unsigned char 
;;		 -> STR_197(5), STR_196(6), STR_195(1), STR_194(1), 
;;		 -> STR_193(1), 
;;  sensor_name     2   43[COMRAM] PTR const unsigned char 
;;		 -> Fake(1), STR_200(5), STR_199(5), STR_198(9), 
;;  sensor          1   42[COMRAM] unsigned char 
;;  item_idx        1   45[COMRAM] unsigned char 
;;  i               1   46[COMRAM] unsigned char 
;;  setup_labels   10   24[COMRAM] PTR const unsigned char 
;;		 -> STR_197(5), STR_196(6), STR_195(1), STR_194(1), 
;;		 -> STR_193(1), 
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
psect	text15,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1195
global __ptext15
__ptext15:
psect	text15
	file	"src\menu.c"
	line	1195
	
_menu_draw_setup:
;incstack = 0
	callstack 23
	line	1200
	
l9522:
	call	_lcd_clear	;wreg free
	line	1201
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1202
	
l9524:
		movlw	low(STR_192)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_192)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1205
	
l9526:
	lfsr	2,(menu_draw_setup@F2641)
	lfsr	1,(menu_draw_setup@setup_labels)
	movlw	10-1
u12521:
	movff	plusw2,plusw1
	decf	wreg
	bc	u12521

	line	1208
	
l9528:
	movlw	low(0)
	movwf	((c:menu_draw_setup@i))^00h,c
	line	1210
	
l9534:
	movlb	2	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_setup@i))^00h,c,w
	movwf	((c:menu_draw_setup@item_idx))^00h,c
	line	1211
		movlw	05h-1
	cpfsgt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u12531
	goto	u12530

u12531:
	goto	l9538
u12530:
	goto	l920
	line	1214
	
l9538:; BSR set to: 2

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1217
	
l9540:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u12541
	goto	u12540

u12541:
	goto	l9574
u12540:
	line	1219
	
l9542:
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
	line	1221
	
l9544:
	movf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u12551
	goto	u12550
u12551:
	goto	l9552
u12550:
	
l9546:
		decf	((c:menu_draw_setup@sensor))^00h,c,w
	btfsc	status,2
	goto	u12561
	goto	u12560

u12561:
	goto	l9550
u12560:
	
l9548:
		movlw	low(STR_200)
	movwf	((c:_menu_draw_setup$1340))^00h,c
	movlw	high(STR_200)
	movwf	((c:_menu_draw_setup$1340+1))^00h,c

	goto	l903
	
l9550:
		movlw	low(STR_199)
	movwf	((c:_menu_draw_setup$1340))^00h,c
	movlw	high(STR_199)
	movwf	((c:_menu_draw_setup$1340+1))^00h,c

	
l903:
		movff	(c:_menu_draw_setup$1340),(c:menu_draw_setup@sensor_name)
	movff	(c:_menu_draw_setup$1340+1),(c:menu_draw_setup@sensor_name+1)

	goto	l899
	
l9552:
		movlw	low(STR_198)
	movwf	((c:menu_draw_setup@sensor_name))^00h,c
	movlw	high(STR_198)
	movwf	((c:menu_draw_setup@sensor_name+1))^00h,c

	
l899:
	line	1224
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12571
	goto	u12570

u12571:
	goto	l9562
u12570:
	line	1227
	
l9554:; BSR set to: 2

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1228
	
l9556:
		movlw	low(STR_201)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_201)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1229
	
l9558:
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1230
	
l9560:
		movlw	low(STR_202)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_202)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1231
	goto	l9564
	line	1235
	
l9562:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@sensor_name),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@sensor_name+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1239
	
l9564:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1240
	
l9566:
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
	goto	u12581
	goto	u12580
u12581:
	goto	l9570
u12580:
	
l9568:
		movlw	low(STR_204)
	movwf	((c:_menu_draw_setup$1346))^00h,c
	movlw	high(STR_204)
	movwf	((c:_menu_draw_setup$1346+1))^00h,c

	goto	l9572
	
l9570:
		movlw	low(STR_203)
	movwf	((c:_menu_draw_setup$1346))^00h,c
	movlw	high(STR_203)
	movwf	((c:_menu_draw_setup$1346+1))^00h,c

	
l9572:
		movff	(c:_menu_draw_setup$1346),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1346+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1241
	goto	l9600
	line	1245
	
l9574:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_labels)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:menu_draw_setup@label)
	movff	postdec2,(c:menu_draw_setup@label+1)
	line	1247
	
l9576:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12591
	goto	u12590

u12591:
	goto	l9586
u12590:
	line	1250
	
l9578:; BSR set to: 2

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1251
	
l9580:
		movlw	low(STR_205)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_205)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1252
	
l9582:
		movff	(c:menu_draw_setup@label),(c:lcd_print@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1253
	
l9584:
		movlw	low(STR_206)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_206)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1254
	goto	l9588
	line	1258
	
l9586:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@label),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@label+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1262
	
l9588:
		movlw	3
	xorwf	((c:menu_draw_setup@item_idx))^00h,c,w
	btfss	status,2
	goto	u12601
	goto	u12600

u12601:
	goto	l9600
u12600:
	line	1265
	
l9590:
	movlw	low(013h)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1266
	
l9592:
	movlb	4	; () banked
	movf	((_system_config))&0ffh,w
	btfss	status,2
	goto	u12611
	goto	u12610
u12611:
	goto	l9596
u12610:
	
l9594:; BSR set to: 4

		movlw	low(STR_208)
	movwf	((c:_menu_draw_setup$1367))^00h,c
	movlw	high(STR_208)
	movwf	((c:_menu_draw_setup$1367+1))^00h,c

	goto	l9598
	
l9596:; BSR set to: 4

		movlw	low(STR_207)
	movwf	((c:_menu_draw_setup$1367))^00h,c
	movlw	high(STR_207)
	movwf	((c:_menu_draw_setup$1367+1))^00h,c

	
l9598:; BSR set to: 4

		movff	(c:_menu_draw_setup$1367),(c:lcd_print@str)
	movff	(c:_menu_draw_setup$1367+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1208
	
l9600:
	incf	((c:menu_draw_setup@i))^00h,c
	
l9602:
		movlw	03h-1
	cpfsgt	((c:menu_draw_setup@i))^00h,c
	goto	u12621
	goto	u12620

u12621:
	goto	l9534
u12620:
	line	1270
	
l920:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_setup
	__end_of_menu_draw_setup:
	signat	_menu_draw_setup,89
	global	_menu_draw_options

;; *************** function _menu_draw_options *****************
;; Defined at:
;;		line 1036 in file "src\menu.c"
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
psect	text16,class=CODE,space=0,reloc=2,group=0
	line	1036
global __ptext16
__ptext16:
psect	text16
	file	"src\menu.c"
	line	1036
	
_menu_draw_options:
;incstack = 0
	callstack 23
	line	1039
	
l9160:
	call	_lcd_clear	;wreg free
	line	1040
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	1041
	
l9162:
		movlw	low(STR_182)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_182)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1044
	
l9164:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	line	1046
	
l9170:
	movlb	2	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_options@i))^00h,c,w
	movwf	((c:menu_draw_options@item_index))^00h,c
	line	1047
		movlw	05h-1
	cpfsgt	((c:menu_draw_options@item_index))^00h,c
	goto	u11841
	goto	u11840

u11841:
	goto	l9174
u11840:
	goto	l844
	line	1050
	
l9174:; BSR set to: 2

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1053
	
l9176:
	movf	((c:menu_draw_options@item_index))^00h,c,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u11851
	goto	u11850

u11851:
	goto	l9186
u11850:
	line	1055
	
l9178:; BSR set to: 2

	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1056
	
l9180:
		movlw	low(STR_183)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_183)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1057
	
l9182:
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
	line	1058
	
l9184:
		movlw	low(STR_184)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_184)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1059
	goto	l9188
	line	1063
	
l9186:; BSR set to: 2

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
	line	1044
	
l9188:
	incf	((c:menu_draw_options@i))^00h,c
	
l9190:
		movlw	03h-1
	cpfsgt	((c:menu_draw_options@i))^00h,c
	goto	u11861
	goto	u11860

u11861:
	goto	l9170
u11860:
	line	1066
	
l844:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_options
	__end_of_menu_draw_options:
	signat	_menu_draw_options,89
	global	_lcd_clear

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 168 in file "src\main.c"
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
psect	text17,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	168
global __ptext17
__ptext17:
psect	text17
	file	"src\main.c"
	line	168
	
_lcd_clear:
;incstack = 0
	callstack 24
	line	170
	
l8892:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	171
	
l8894:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u15597:
decfsz	wreg,f
	bra	u15597
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u15597
	nop2
asmopt pop

	line	172
	
l160:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
	signat	_lcd_clear,89
	global	_menu_draw_input

;; *************** function _menu_draw_input *****************
;; Defined at:
;;		line 1068 in file "src\menu.c"
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
psect	text18,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1068
global __ptext18
__ptext18:
psect	text18
	file	"src\menu.c"
	line	1068
	
_menu_draw_input:
;incstack = 0
	callstack 23
	line	1073
	
l9404:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1075
	
l9406:
		movlw	low(menu_draw_input@title)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_185)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_185)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(01h)
	movlb	2	; () banked
	addwf	((_current_input))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	1+(0+((c:?_sprintf)+04h))^00h,c
	movlw	high(01h)
	addwfc	1+(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1076
	
l9408:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@title)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1079
	
l9410:
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
	line	1080
	
l9412:; BSR set to: 0

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
	line	1083
	
l9414:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@i))&0ffh
	goto	l9518
	line	1085
	
l9416:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(_menu+01h))&0ffh,w
	movlb	0	; () banked
	addwf	((menu_draw_input@i))&0ffh,w
	movwf	((menu_draw_input@item_idx))&0ffh
	line	1086
	
l9418:; BSR set to: 0

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_clear_line
	line	1089
	
l9420:
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
	line	1093
	
l9422:
	line	1095
	
l9424:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12301
	goto	u12300

u12301:
	goto	l9474
u12300:
	line	1097
	
l9426:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u12311
	goto	u12310
u12311:
	goto	l9470
u12310:
	line	1099
	
l9428:; BSR set to: 2

	movlw	low(02h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	line	1102
	
l9430:; BSR set to: 0

	movff	(menu_draw_input@sensor_type),(c:is_option_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_option_field@flow_type)
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_option_field
	iorlw	0
	btfsc	status,2
	goto	u12321
	goto	u12320
u12321:
	goto	l9444
u12320:
	line	1104
	
l9432:
	movlb	2	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u12331
	goto	u12330
u12331:
	goto	l9446
u12330:
	line	1107
	
l9434:; BSR set to: 2

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts+1)
	line	1108
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag+1)
	line	1110
	
l9436:
	movlb	0	; () banked
	movf	((menu_draw_input@opts))&0ffh,w
iorwf	((menu_draw_input@opts+1))&0ffh,w
	btfsc	status,2
	goto	u12341
	goto	u12340

u12341:
	goto	l9444
u12340:
	
l9438:; BSR set to: 0

	movf	((menu_draw_input@flag))&0ffh,w
iorwf	((menu_draw_input@flag+1))&0ffh,w
	btfsc	status,2
	goto	u12351
	goto	u12350

u12351:
	goto	l9444
u12350:
	
l9440:; BSR set to: 0

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
	goto	u12361
	goto	u12360
u12361:
	goto	l9444
u12360:
	line	1112
	
l9442:; BSR set to: 0

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
	line	1113
	goto	l9478
	line	1116
	
l9444:
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
	goto	l9478
	line	1122
	
l9446:; BSR set to: 2

	movff	(menu_draw_input@sensor_type),(c:get_item_options_for_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_item_options_for_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options_for_field
	movff	0+?_get_item_options_for_field,(menu_draw_input@opts_1302)
	movff	1+?_get_item_options_for_field,(menu_draw_input@opts_1302+1)
	line	1123
	movff	(menu_draw_input@sensor_type),(c:get_option_edit_flag@sensor_type)
	movff	(menu_draw_input@flow_type),(c:get_option_edit_flag@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_option_edit_flag
	movff	0+?_get_option_edit_flag,(menu_draw_input@flag_1306)
	movff	1+?_get_option_edit_flag,(menu_draw_input@flag_1306+1)
	line	1125
	
l9448:
	movlb	0	; () banked
	movf	((menu_draw_input@opts_1302))&0ffh,w
iorwf	((menu_draw_input@opts_1302+1))&0ffh,w
	btfsc	status,2
	goto	u12371
	goto	u12370

u12371:
	goto	l9466
u12370:
	
l9450:; BSR set to: 0

	movf	((menu_draw_input@flag_1306))&0ffh,w
iorwf	((menu_draw_input@flag_1306+1))&0ffh,w
	btfsc	status,2
	goto	u12381
	goto	u12380

u12381:
	goto	l9466
u12380:
	
l9452:; BSR set to: 0

	movff	(menu_draw_input@flag_1306),fsr2l
	movff	(menu_draw_input@flag_1306+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movlw	01h
	addwf	((menu_draw_input@opts_1302))&0ffh,w
	movwf	(??_menu_draw_input+1+0)^00h,c
	movlw	0
	addwfc	((menu_draw_input@opts_1302+1))&0ffh,w
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
	goto	u12391
	goto	u12390
u12391:
	goto	l9466
u12390:
	line	1127
	
l9454:; BSR set to: 0

	movff	(menu_draw_input@flag_1306),fsr2l
	movff	(menu_draw_input@flag_1306+1),fsr2h
	movf	indf2,w
	movwf	(??_menu_draw_input+0+0)^00h,c
	movf	((??_menu_draw_input+0+0))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_draw_input+1+0
	movff	prodh,??_menu_draw_input+1+0+1
	movf	(??_menu_draw_input+1+0)^00h,c,w
	addwf	((menu_draw_input@opts_1302))&0ffh,w
	movwf	(??_menu_draw_input+3+0)^00h,c
	movf	(??_menu_draw_input+1+1)^00h,c,w
	addwfc	((menu_draw_input@opts_1302+1))&0ffh,w
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
	line	1128
	
l9456:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j))&0ffh
	goto	l9462
	line	1129
	
l9458:; BSR set to: 0

	movf	((menu_draw_input@j))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1128
	
l9460:; BSR set to: 0

	incf	((menu_draw_input@j))&0ffh
	
l9462:; BSR set to: 0

		movf	((menu_draw_input@val_len))&0ffh,w
	subwf	((menu_draw_input@j))&0ffh,w
	btfss	status,0
	goto	u12401
	goto	u12400

u12401:
	goto	l9458
u12400:
	line	1130
	
l9464:; BSR set to: 0

	movf	((menu_draw_input@val_len))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	1131
	goto	l9478
	line	1134
	
l9466:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_186)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_186)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l9478
	line	1147
	
l9470:; BSR set to: 2

	movlw	low(01h)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l9444
	line	1154
	
l9474:; BSR set to: 2

	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l9444
	line	1159
	
l9478:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_1310))&0ffh
	line	1160
	
l9480:; BSR set to: 0

	movf	((menu_draw_input@val_len_1310))&0ffh,w
	btfsc	status,2
	goto	u12411
	goto	u12410
u12411:
	goto	l9516
u12410:
	
l9482:; BSR set to: 0

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
		movlw	low(STR_187)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_187)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u12421
	goto	u12420

u12421:
	goto	l9516
u12420:
	line	1163
	
l9484:
	movlb	2	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u12431
	goto	u12430
u12431:
	goto	l9492
u12430:
	
l9486:; BSR set to: 2

	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12441
	goto	u12440

u12441:
	goto	l9492
u12440:
	line	1166
	
l9488:; BSR set to: 2

	movff	(menu_draw_input@sensor_type),(c:is_numeric_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_numeric_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u12451
	goto	u12450
u12451:
	goto	l9516
u12450:
	
l9490:
	movff	(menu_draw_input@sensor_type),(c:is_time_field@sensor_type)
	movff	(menu_draw_input@flow_type),(c:is_time_field@flow_type)
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u12461
	goto	u12460
u12461:
	goto	l9492
u12460:
	goto	l9516
	line	1173
	
l9492:
	movlb	0	; () banked
	movf	((menu_draw_input@show_brackets))&0ffh,w
	btfss	status,2
	goto	u12471
	goto	u12470
u12471:
	goto	l9496
u12470:
	line	1176
	
l9494:; BSR set to: 0

	movf	((menu_draw_input@val_len_1310))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	1177
	goto	l9516
	line	1181
	
l9496:; BSR set to: 0

	movf	((menu_draw_input@val_len_1310))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_input@start_pos))&0ffh
	line	1182
	
l9498:; BSR set to: 0

	movff	(menu_draw_input@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	1185
	
l9500:
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u12481
	goto	u12480

u12481:
	goto	l9504
u12480:
	
l9502:; BSR set to: 0

		movlw	low(STR_189)
	movwf	((_menu_draw_input$1316))&0ffh
	movlw	high(STR_189)
	movwf	((_menu_draw_input$1316+1))&0ffh

	goto	l9506
	
l9504:; BSR set to: 0

		movlw	low(STR_188)
	movwf	((_menu_draw_input$1316))&0ffh
	movlw	high(STR_188)
	movwf	((_menu_draw_input$1316+1))&0ffh

	
l9506:; BSR set to: 0

		movff	(_menu_draw_input$1316),(c:lcd_print@str)
	movff	(_menu_draw_input$1316+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1187
	
l9508:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1189
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u12491
	goto	u12490

u12491:
	goto	l9512
u12490:
	
l9510:; BSR set to: 0

		movlw	low(STR_191)
	movwf	((_menu_draw_input$1320))&0ffh
	movlw	high(STR_191)
	movwf	((_menu_draw_input$1320+1))&0ffh

	goto	l9514
	
l9512:; BSR set to: 0

		movlw	low(STR_190)
	movwf	((_menu_draw_input$1320))&0ffh
	movlw	high(STR_190)
	movwf	((_menu_draw_input$1320+1))&0ffh

	
l9514:; BSR set to: 0

		movff	(_menu_draw_input$1320),(c:lcd_print@str)
	movff	(_menu_draw_input$1320+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1083
	
l9516:
	movlb	0	; () banked
	incf	((menu_draw_input@i))&0ffh
	
l9518:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_input@i))&0ffh
	goto	u12501
	goto	u12500

u12501:
	goto	l885
u12500:
	
l9520:; BSR set to: 0

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
	goto	u12511
	goto	u12510

u12511:
	goto	l9416
u12510:
	line	1193
	
l885:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_input
	__end_of_menu_draw_input:
	signat	_menu_draw_input,89
	global	_is_time_field

;; *************** function _is_time_field *****************
;; Defined at:
;;		line 227 in file "src\menu.c"
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
psect	text19,class=CODE,space=0,reloc=2,group=0
	line	227
global __ptext19
__ptext19:
psect	text19
	file	"src\menu.c"
	line	227
	
_is_time_field:; BSR set to: 0

;incstack = 0
	callstack 27
	movwf	((c:is_time_field@line))^00h,c
	line	229
	
l5864:
	movf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6261
	goto	u6260
u6261:
	goto	l5880
u6260:
	line	232
	
l5866:
	movlw	low(01h)
	movwf	((c:_is_time_field$1076))^00h,c
	
l5868:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6271
	goto	u6270

u6271:
	goto	l475
u6270:
	
l5870:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6281
	goto	u6280

u6281:
	goto	l475
u6280:
	
l5872:
		movlw	8
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6291
	goto	u6290

u6291:
	goto	l475
u6290:
	
l5874:
	movlw	low(0)
	movwf	((c:_is_time_field$1076))^00h,c
	
l475:
	movf	((c:_is_time_field$1076))^00h,c,w
	goto	l476
	line	234
	
l5880:
		decf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6301
	goto	u6300

u6301:
	goto	l5888
u6300:
	line	237
	
l5882:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6311
	goto	u6310

u6311:
	movlw	1
	goto	u6320
u6310:
	movlw	0
u6320:
	goto	l476
	line	239
	
l5888:
		movlw	2
	xorwf	((c:is_time_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6331
	goto	u6330

u6331:
	goto	l5902
u6330:
	line	241
	
l5890:
	movf	((c:is_time_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u6341
	goto	u6340
u6341:
	goto	l5898
u6340:
	line	244
	
l5892:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6351
	goto	u6350

u6351:
	movlw	1
	goto	u6360
u6350:
	movlw	0
u6360:
	goto	l476
	line	249
	
l5898:
		movlw	4
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u6371
	goto	u6370

u6371:
	movlw	1
	goto	u6380
u6370:
	movlw	0
u6380:
	goto	l476
	line	253
	
l5902:
	movlw	(0)&0ffh
	line	254
	
l476:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_time_field
	__end_of_is_time_field:
	signat	_is_time_field,12409
	global	_is_option_field

;; *************** function _is_option_field *****************
;; Defined at:
;;		line 259 in file "src\menu.c"
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
psect	text20,class=CODE,space=0,reloc=2,group=0
	line	259
global __ptext20
__ptext20:
psect	text20
	file	"src\menu.c"
	line	259
	
_is_option_field:
;incstack = 0
	callstack 26
	movwf	((c:is_option_field@line))^00h,c
	line	262
	
l5906:
	movf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6391
	goto	u6390
u6391:
	goto	l5910
u6390:
	
l5908:
		decf	((c:is_option_field@line))^00h,c,w
	btfss	status,2
	goto	u6401
	goto	u6400

u6401:
	goto	l5914
u6400:
	line	263
	
l5910:
	movlw	(01h)&0ffh
	goto	l488
	line	265
	
l5914:
	movf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6411
	goto	u6410
u6411:
	goto	l5932
u6410:
	line	268
	
l5916:
	movlw	low(01h)
	movwf	((c:_is_option_field$1081))^00h,c
	
l5918:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6421
	goto	u6420

u6421:
	goto	l491
u6420:
	
l5920:
		movlw	10
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6431
	goto	u6430

u6431:
	goto	l491
u6430:
	
l5922:
		movlw	11
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6441
	goto	u6440

u6441:
	goto	l491
u6440:
	
l5924:
		movlw	12
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6451
	goto	u6450

u6451:
	goto	l491
u6450:
	
l5926:
	movlw	low(0)
	movwf	((c:_is_option_field$1081))^00h,c
	
l491:
	movf	((c:_is_option_field$1081))^00h,c,w
	goto	l488
	line	270
	
l5932:
		decf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6461
	goto	u6460

u6461:
	goto	l5946
u6460:
	line	273
	
l5934:
	movlw	low(01h)
	movwf	((c:_is_option_field$1082))^00h,c
	
l5936:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6471
	goto	u6470

u6471:
	goto	l495
u6470:
	
l5938:
		movlw	7
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6481
	goto	u6480

u6481:
	goto	l495
u6480:
	
l5940:
	movlw	low(0)
	movwf	((c:_is_option_field$1082))^00h,c
	
l495:
	movf	((c:_is_option_field$1082))^00h,c,w
	goto	l488
	line	275
	
l5946:
		movlw	2
	xorwf	((c:is_option_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6491
	goto	u6490

u6491:
	goto	l5980
u6490:
	line	277
	
l5948:
	movf	((c:is_option_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u6501
	goto	u6500
u6501:
	goto	l5966
u6500:
	line	280
	
l5950:
	movlw	low(01h)
	movwf	((c:_is_option_field$1083))^00h,c
	
l5952:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6511
	goto	u6510

u6511:
	goto	l500
u6510:
	
l5954:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6521
	goto	u6520

u6521:
	goto	l500
u6520:
	
l5956:
		movlw	8
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6531
	goto	u6530

u6531:
	goto	l500
u6530:
	
l5958:
		movlw	9
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6541
	goto	u6540

u6541:
	goto	l500
u6540:
	
l5960:
	movlw	low(0)
	movwf	((c:_is_option_field$1083))^00h,c
	
l500:
	movf	((c:_is_option_field$1083))^00h,c,w
	goto	l488
	line	285
	
l5966:
	movlw	low(01h)
	movwf	((c:_is_option_field$1084))^00h,c
	
l5968:
		movlw	2
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6551
	goto	u6550

u6551:
	goto	l503
u6550:
	
l5970:
		movlw	3
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6561
	goto	u6560

u6561:
	goto	l503
u6560:
	
l5972:
		movlw	5
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6571
	goto	u6570

u6571:
	goto	l503
u6570:
	
l5974:
		movlw	6
	xorwf	((c:is_option_field@line))^00h,c,w
	btfsc	status,2
	goto	u6581
	goto	u6580

u6581:
	goto	l503
u6580:
	
l5976:
	movlw	low(0)
	movwf	((c:_is_option_field$1084))^00h,c
	
l503:
	movf	((c:_is_option_field$1084))^00h,c,w
	goto	l488
	line	289
	
l5980:
	movlw	(0)&0ffh
	line	290
	
l488:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_option_field
	__end_of_is_option_field:
	signat	_is_option_field,12409
	global	_is_numeric_field

;; *************** function _is_numeric_field *****************
;; Defined at:
;;		line 195 in file "src\menu.c"
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
psect	text21,class=CODE,space=0,reloc=2,group=0
	line	195
global __ptext21
__ptext21:
psect	text21
	file	"src\menu.c"
	line	195
	
_is_numeric_field:
;incstack = 0
	callstack 27
	movwf	((c:is_numeric_field@line))^00h,c
	line	197
	
l9076:
	movf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u11661
	goto	u11660
u11661:
	goto	l9094
u11660:
	line	200
	
l9078:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1069))^00h,c
	
l9080:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u11671
	goto	u11670

u11671:
	goto	l459
u11670:
	
l9082:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u11681
	goto	u11680

u11681:
	goto	l459
u11680:
	
l9084:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u11691
	goto	u11690

u11691:
	goto	l459
u11690:
	
l9086:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u11701
	goto	u11700

u11701:
	goto	l459
u11700:
	
l9088:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1069))^00h,c
	
l459:
	movf	((c:_is_numeric_field$1069))^00h,c,w
	goto	l460
	line	202
	
l9094:
		decf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u11711
	goto	u11710

u11711:
	goto	l9110
u11710:
	line	205
	
l9096:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1070))^00h,c
	
l9098:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u11721
	goto	u11720

u11721:
	goto	l464
u11720:
	
l9100:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u11731
	goto	u11730

u11731:
	goto	l464
u11730:
	
l9102:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u11741
	goto	u11740

u11741:
	goto	l464
u11740:
	
l9104:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1070))^00h,c
	
l464:
	movf	((c:_is_numeric_field$1070))^00h,c,w
	goto	l460
	line	207
	
l9110:
		movlw	2
	xorwf	((c:is_numeric_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u11751
	goto	u11750

u11751:
	goto	l9128
u11750:
	line	209
	
l9112:
	movf	((c:is_numeric_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u11761
	goto	u11760
u11761:
	goto	l9128
u11760:
	line	212
	
l9114:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$1071))^00h,c
	
l9116:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u11771
	goto	u11770

u11771:
	goto	l469
u11770:
	
l9118:
		movlw	5
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u11781
	goto	u11780

u11781:
	goto	l469
u11780:
	
l9120:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u11791
	goto	u11790

u11791:
	goto	l469
u11790:
	
l9122:
	movlw	low(0)
	movwf	((c:_is_numeric_field$1071))^00h,c
	
l469:
	movf	((c:_is_numeric_field$1071))^00h,c,w
	goto	l460
	line	217
	
l9128:
	movlw	(0)&0ffh
	line	222
	
l460:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_numeric_field
	__end_of_is_numeric_field:
	signat	_is_numeric_field,12409
	global	_get_option_edit_flag

;; *************** function _get_option_edit_flag *****************
;; Defined at:
;;		line 296 in file "src\menu.c"
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
psect	text22,class=CODE,space=0,reloc=2,group=0
	line	296
global __ptext22
__ptext22:
psect	text22
	file	"src\menu.c"
	line	296
	
_get_option_edit_flag:
;incstack = 0
	callstack 26
	movwf	((c:get_option_edit_flag@line))^00h,c
	line	299
	
l5984:
	movf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6591
	goto	u6590
u6591:
	goto	l5990
u6590:
	line	300
	
l5986:
		movlw	low(_enable_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l507
	line	301
	
l5990:
		decf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6601
	goto	u6600

u6601:
	goto	l5996
u6600:
	line	302
	
l5992:
		movlw	low(_sensor_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l507
	line	305
	
l5996:
	movf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6611
	goto	u6610
u6611:
	goto	l6022
u6610:
	line	307
	
l5998:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6621
	goto	u6620

u6621:
	goto	l6004
u6620:
	line	308
	
l6000:
		movlw	low(_relay_high_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l507
	line	309
	
l6004:
		movlw	10
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6631
	goto	u6630

u6631:
	goto	l6010
u6630:
	line	310
	
l6006:
		movlw	low(_relay_plp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l507
	line	311
	
l6010:
		movlw	11
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6641
	goto	u6640

u6641:
	goto	l6016
u6640:
	line	312
	
l6012:
		movlw	low(_relay_slp_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l507
	line	313
	
l6016:
		movlw	12
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6651
	goto	u6650

u6651:
	goto	l6082
u6650:
	line	314
	
l6018:
		movlw	low(_display_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l507
	line	317
	
l6022:
		decf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6661
	goto	u6660

u6661:
	goto	l6036
u6660:
	line	319
	
l6024:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6671
	goto	u6670

u6671:
	goto	l6030
u6670:
	goto	l6000
	line	321
	
l6030:
		movlw	7
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6681
	goto	u6680

u6681:
	goto	l6082
u6680:
	goto	l6018
	line	325
	
l6036:
		movlw	2
	xorwf	((c:get_option_edit_flag@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6691
	goto	u6690

u6691:
	goto	l6082
u6690:
	line	327
	
l6038:
		movlw	2
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6701
	goto	u6700

u6701:
	goto	l6044
u6700:
	line	328
	
l6040:
		movlw	low(_flow_type_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l507
	line	330
	
l6044:
	movf	((c:get_option_edit_flag@flow_type))^00h,c,w
	btfss	status,2
	goto	u6711
	goto	u6710
u6711:
	goto	l6064
u6710:
	line	332
	
l6046:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6721
	goto	u6720

u6721:
	goto	l6052
u6720:
	line	333
	
l6048:
		movlw	low(_flow_units_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l507
	line	334
	
l6052:
		movlw	8
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6731
	goto	u6730

u6731:
	goto	l6058
u6730:
	line	335
	
l6054:
		movlw	low(_relay_low_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l507
	line	336
	
l6058:
		movlw	9
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6741
	goto	u6740

u6741:
	goto	l6082
u6740:
	goto	l6018
	line	341
	
l6064:
		movlw	3
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6751
	goto	u6750

u6751:
	goto	l6070
u6750:
	line	342
	
l6066:
		movlw	low(_no_flow_edit_flag)
	movwf	((c:?_get_option_edit_flag))^00h,c
	clrf	((c:?_get_option_edit_flag+1))^00h,c

	goto	l507
	line	343
	
l6070:
		movlw	5
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6761
	goto	u6760

u6761:
	goto	l6076
u6760:
	goto	l6054
	line	345
	
l6076:
		movlw	6
	xorwf	((c:get_option_edit_flag@line))^00h,c,w
	btfss	status,2
	goto	u6771
	goto	u6770

u6771:
	goto	l6082
u6770:
	goto	l6018
	line	350
	
l6082:
		movlw	low(0)
	movwf	((c:?_get_option_edit_flag))^00h,c
	movlw	high(0)
	movwf	((c:?_get_option_edit_flag+1))^00h,c

	line	351
	
l507:
	return	;funcret
	callstack 0
GLOBAL	__end_of_get_option_edit_flag
	__end_of_get_option_edit_flag:
	signat	_get_option_edit_flag,12410
	global	_get_item_options_for_field

;; *************** function _get_item_options_for_field *****************
;; Defined at:
;;		line 357 in file "src\menu.c"
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
psect	text23,class=CODE,space=0,reloc=2,group=0
	line	357
global __ptext23
__ptext23:
psect	text23
	file	"src\menu.c"
	line	357
	
_get_item_options_for_field:
;incstack = 0
	callstack 26
	movwf	((c:get_item_options_for_field@line))^00h,c
	line	360
	
l6086:
	movf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6781
	goto	u6780
u6781:
	goto	l6092
u6780:
	line	361
	
l6088:
		movlw	low(_menu_item_options)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l532
	line	362
	
l6092:
		decf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6791
	goto	u6790

u6791:
	goto	l6098
u6790:
	line	363
	
l6094:
		movlw	low(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+0Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l532
	line	366
	
l6098:
	movf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6801
	goto	u6800
u6801:
	goto	l6116
u6800:
	line	368
	
l6100:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u6811
	goto	u6810

u6811:
	goto	l6106
u6810:
	
l6102:
		movlw	10
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfsc	status,2
	goto	u6821
	goto	u6820

u6821:
	goto	l6106
u6820:
	
l6104:
		movlw	11
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6831
	goto	u6830

u6831:
	goto	l6110
u6830:
	line	369
	
l6106:
		movlw	low(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+048h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l532
	line	370
	
l6110:
		movlw	12
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6841
	goto	u6840

u6841:
	goto	l6176
u6840:
	line	371
	
l6112:
		movlw	low(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+03Ch)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l532
	line	374
	
l6116:
		decf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6851
	goto	u6850

u6851:
	goto	l6130
u6850:
	line	376
	
l6118:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6861
	goto	u6860

u6861:
	goto	l6124
u6860:
	goto	l6106
	line	378
	
l6124:
		movlw	7
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6871
	goto	u6870

u6871:
	goto	l6176
u6870:
	goto	l6112
	line	382
	
l6130:
		movlw	2
	xorwf	((c:get_item_options_for_field@sensor_type))^00h,c,w
	btfss	status,2
	goto	u6881
	goto	u6880

u6881:
	goto	l6176
u6880:
	line	384
	
l6132:
		movlw	2
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6891
	goto	u6890

u6891:
	goto	l6138
u6890:
	line	385
	
l6134:
		movlw	low(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+018h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l532
	line	387
	
l6138:
	movf	((c:get_item_options_for_field@flow_type))^00h,c,w
	btfss	status,2
	goto	u6901
	goto	u6900
u6901:
	goto	l6158
u6900:
	line	389
	
l6140:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6911
	goto	u6910

u6911:
	goto	l6146
u6910:
	line	390
	
l6142:
		movlw	low(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+030h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l532
	line	391
	
l6146:
		movlw	8
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6921
	goto	u6920

u6921:
	goto	l6152
u6920:
	goto	l6106
	line	393
	
l6152:
		movlw	9
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6931
	goto	u6930

u6931:
	goto	l6176
u6930:
	goto	l6112
	line	398
	
l6158:
		movlw	3
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6941
	goto	u6940

u6941:
	goto	l6164
u6940:
	line	399
	
l6160:
		movlw	low(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(_menu_item_options+024h)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	goto	l532
	line	400
	
l6164:
		movlw	5
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6951
	goto	u6950

u6951:
	goto	l6170
u6950:
	goto	l6106
	line	402
	
l6170:
		movlw	6
	xorwf	((c:get_item_options_for_field@line))^00h,c,w
	btfss	status,2
	goto	u6961
	goto	u6960

u6961:
	goto	l6176
u6960:
	goto	l6112
	line	407
	
l6176:
		movlw	low(0)
	movwf	((c:?_get_item_options_for_field))^00h,c
	movlw	high(0)
	movwf	((c:?_get_item_options_for_field+1))^00h,c

	line	408
	
l532:
	return	;funcret
	callstack 0
GLOBAL	__end_of_get_item_options_for_field
	__end_of_get_item_options_for_field:
	signat	_get_item_options_for_field,12410
	global	_menu_draw_clock

;; *************** function _menu_draw_clock *****************
;; Defined at:
;;		line 1311 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1   50[COMRAM] unsigned char 
;;  val_len         1   49[COMRAM] unsigned char 
;;  start_pos       1   44[COMRAM] unsigned char 
;;  value_buf      15   29[COMRAM] unsigned char [15]
;;  item_idx        1   53[COMRAM] unsigned char 
;;  show_bracket    1   52[COMRAM] unsigned char 
;;  val_len         1   51[COMRAM] unsigned char 
;;  i               1   54[COMRAM] unsigned char 
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
;;      Locals:        26       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        31       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       31 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_lcd_clear_line
;;		_lcd_print
;;		_lcd_print_at
;;		_lcd_set_cursor
;;		_strcmp
;;		_strcpy
;;		_strlen
;; This function is called by:
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text24,class=CODE,space=0,reloc=2,group=0
	line	1311
global __ptext24
__ptext24:
psect	text24
	file	"src\menu.c"
	line	1311
	
_menu_draw_clock:
;incstack = 0
	callstack 23
	line	1314
	
l10000:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1315
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_219)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_219)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1318
	
l10002:
	movlw	low(0)
	movwf	((c:menu_draw_clock@i))^00h,c
	goto	l10072
	line	1320
	
l10004:; BSR set to: 2

	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_clock@i))^00h,c,w
	movwf	((c:menu_draw_clock@item_idx))^00h,c
	line	1321
	
l10006:; BSR set to: 2

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1324
	
l10008:
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
	line	1328
	
l10010:
	line	1330
	
l10012:
	movf	((c:menu_draw_clock@item_idx))^00h,c,w
	movlb	2	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u13031
	goto	u13030

u13031:
	goto	l10036
u13030:
	line	1332
	
l10014:; BSR set to: 2

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u13041
	goto	u13040
u13041:
	goto	l10032
u13040:
	line	1334
	
l10016:; BSR set to: 2

	movlw	low(02h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	line	1337
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u13051
	goto	u13050
u13051:
	goto	l10020
u13050:
	line	1339
	
l10018:; BSR set to: 2

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
	line	1340
	goto	l10040
	line	1344
	
l10020:; BSR set to: 2

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
	line	1345
	
l10022:
	movlw	low(0)
	movwf	((c:menu_draw_clock@j))^00h,c
	goto	l10028
	line	1346
	
l10024:
	movf	((c:menu_draw_clock@j))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	1345
	
l10026:
	incf	((c:menu_draw_clock@j))^00h,c
	
l10028:
		movf	((c:menu_draw_clock@val_len))^00h,c,w
	subwf	((c:menu_draw_clock@j))^00h,c,w
	btfss	status,0
	goto	u13061
	goto	u13060

u13061:
	goto	l10024
u13060:
	line	1347
	
l10030:
	movf	((c:menu_draw_clock@val_len))^00h,c,w
	addlw	low(menu_draw_clock@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l10040
	line	1353
	
l10032:; BSR set to: 2

	movlw	low(01h)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l10018
	line	1360
	
l10036:; BSR set to: 2

	movlw	low(0)
	movwf	((c:menu_draw_clock@show_brackets))^00h,c
	goto	l10018
	line	1365
	
l10040:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_clock@val_len_1398))^00h,c
	line	1366
	
l10042:
	movf	((c:menu_draw_clock@val_len_1398))^00h,c,w
	btfsc	status,2
	goto	u13071
	goto	u13070
u13071:
	goto	l10070
u13070:
	
l10044:
	movf	((c:menu_draw_clock@item_idx))^00h,c,w
	mullw	05h
	movlw	low(_clock_menu+02h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_clock_menu+02h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:strcmp@s1)
	movff	postdec2,(c:strcmp@s1+1)
		movlw	low(STR_220)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_220)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u13081
	goto	u13080

u13081:
	goto	l10070
u13080:
	line	1368
	
l10046:
	movf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfss	status,2
	goto	u13091
	goto	u13090
u13091:
	goto	l10050
u13090:
	line	1371
	
l10048:
	movf	((c:menu_draw_clock@val_len_1398))^00h,c,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_print_at
	line	1372
	goto	l10070
	line	1376
	
l10050:
	movf	((c:menu_draw_clock@val_len_1398))^00h,c,w
	sublw	low(012h)
	movwf	((c:menu_draw_clock@start_pos))^00h,c
	line	1377
	
l10052:
	movff	(c:menu_draw_clock@start_pos),(c:lcd_set_cursor@col)
	incf	((c:menu_draw_clock@i))^00h,c,w
	
	call	_lcd_set_cursor
	line	1380
	
l10054:
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u13101
	goto	u13100

u13101:
	goto	l10058
u13100:
	
l10056:
		movlw	low(STR_222)
	movwf	((c:_menu_draw_clock$1404))^00h,c
	movlw	high(STR_222)
	movwf	((c:_menu_draw_clock$1404+1))^00h,c

	goto	l10060
	
l10058:
		movlw	low(STR_221)
	movwf	((c:_menu_draw_clock$1404))^00h,c
	movlw	high(STR_221)
	movwf	((c:_menu_draw_clock$1404+1))^00h,c

	
l10060:
		movff	(c:_menu_draw_clock$1404),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1404+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1382
	
l10062:
		movlw	low(menu_draw_clock@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1384
		decf	((c:menu_draw_clock@show_brackets))^00h,c,w
	btfsc	status,2
	goto	u13111
	goto	u13110

u13111:
	goto	l10066
u13110:
	
l10064:
		movlw	low(STR_224)
	movwf	((c:_menu_draw_clock$1408))^00h,c
	movlw	high(STR_224)
	movwf	((c:_menu_draw_clock$1408+1))^00h,c

	goto	l10068
	
l10066:
		movlw	low(STR_223)
	movwf	((c:_menu_draw_clock$1408))^00h,c
	movlw	high(STR_223)
	movwf	((c:_menu_draw_clock$1408+1))^00h,c

	
l10068:
		movff	(c:_menu_draw_clock$1408),(c:lcd_print@str)
	movff	(c:_menu_draw_clock$1408+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	1318
	
l10070:
	incf	((c:menu_draw_clock@i))^00h,c
	
l10072:
		movlw	03h-0
	cpfslt	((c:menu_draw_clock@i))^00h,c
	goto	u13121
	goto	u13120

u13121:
	goto	l965
u13120:
	
l10074:
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
	goto	u13131
	goto	u13130

u13131:
	goto	l10004
u13130:
	line	1388
	
l965:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_clock
	__end_of_menu_draw_clock:
	signat	_menu_draw_clock,89
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
;;		 -> value_enable(10), NULL(0), STR_61(1), STR_60(1), 
;;		 -> STR_59(9), STR_58(6), STR_57(6), STR_56(1), 
;;		 -> STR_55(1), STR_54(1), STR_53(5), STR_52(5), 
;;		 -> STR_51(1), STR_50(1), STR_49(1), STR_48(4), 
;;		 -> STR_47(2), STR_46(1), STR_45(1), STR_44(1), 
;;		 -> STR_43(5), STR_42(4), STR_41(1), STR_40(1), 
;;		 -> STR_39(1), STR_38(8), STR_37(7), STR_36(1), 
;;		 -> STR_35(1), STR_34(5), STR_33(5), STR_32(9), 
;;		 -> STR_31(1), STR_30(1), STR_29(1), STR_28(8), 
;;		 -> STR_27(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   16[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_clock@value_buf(15), value_clock_display(10), value_end_runtime(10), value_clock_enable(10), 
;;		 -> menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), value_rlylow(10), 
;;		 -> value_flow_type(10), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), NULL(0), STR_61(1), STR_60(1), 
;;		 -> STR_59(9), STR_58(6), STR_57(6), STR_56(1), 
;;		 -> STR_55(1), STR_54(1), STR_53(5), STR_52(5), 
;;		 -> STR_51(1), STR_50(1), STR_49(1), STR_48(4), 
;;		 -> STR_47(2), STR_46(1), STR_45(1), STR_44(1), 
;;		 -> STR_43(5), STR_42(4), STR_41(1), STR_40(1), 
;;		 -> STR_39(1), STR_38(8), STR_37(7), STR_36(1), 
;;		 -> STR_35(1), STR_34(5), STR_33(5), STR_32(9), 
;;		 -> STR_31(1), STR_30(1), STR_29(1), STR_28(8), 
;;		 -> STR_27(9), 
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
psect	text25,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
global __ptext25
__ptext25:
psect	text25
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
	
_strlen:
;incstack = 0
	callstack 27
	line	8
	
l9150:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l9154
	line	10
	
l9152:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l9154:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
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
	iorlw	0
	btfss	status,2
	goto	u11831
	goto	u11830
u11831:
	goto	l9152
u11830:
	line	12
	
l9156:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l2094:
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
;;		 -> value_sensor(12), value_enable(10), NULL(0), 
;;  from            2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_216(5), value_clock_display(10), STR_215(9), STR_214(6), 
;;		 -> STR_213(6), value_end_runtime(10), value_clock_enable(10), STR_186(6), 
;;		 -> menu_update_edit_value@value_buf(10), value_no_flow_bp(10), STR_169(4), value_no_flow(10), 
;;		 -> value_low_flow_bp(10), value_low_flow(10), STR_164(4), STR_163(2), 
;;		 -> value_flow_units(10), STR_162(9), STR_161(6), STR_160(6), 
;;		 -> value_rlylow(10), STR_159(5), STR_158(5), STR_157(8), 
;;		 -> STR_156(7), value_flow_type(10), STR_155(5), STR_154(5), 
;;		 -> STR_153(5), STR_152(9), STR_151(6), STR_150(6), 
;;		 -> value_high_tbp(10), value_high_temp(10), STR_145(5), value_back(5), 
;;		 -> STR_144(5), STR_143(5), value_display(10), STR_142(9), 
;;		 -> STR_141(6), STR_140(6), value_rlyslp(10), STR_139(9), 
;;		 -> STR_138(6), STR_137(6), value_rlyplp(10), STR_136(9), 
;;		 -> STR_135(6), STR_134(6), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), STR_126(9), value_sensor(12), 
;;		 -> value_enable(10), NULL(0), STR_61(1), STR_60(1), 
;;		 -> STR_59(9), STR_58(6), STR_57(6), STR_56(1), 
;;		 -> STR_55(1), STR_54(1), STR_53(5), STR_52(5), 
;;		 -> STR_51(1), STR_50(1), STR_49(1), STR_48(4), 
;;		 -> STR_47(2), STR_46(1), STR_45(1), STR_44(1), 
;;		 -> STR_43(5), STR_42(4), STR_41(1), STR_40(1), 
;;		 -> STR_39(1), STR_38(8), STR_37(7), STR_36(1), 
;;		 -> STR_35(1), STR_34(5), STR_33(5), STR_32(9), 
;;		 -> STR_31(1), STR_30(1), STR_29(1), STR_28(8), 
;;		 -> STR_27(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   18[COMRAM] PTR unsigned char 
;;		 -> original_value(10), menu_draw_clock@value_buf(15), value_clock_display(10), value_end_runtime(10), 
;;		 -> value_clock_enable(10), menu_draw_input@value_buf(15), menu_update_edit_value@display_buf(10), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), NULL(0), 
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
psect	text26,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
global __ptext26
__ptext26:
psect	text26
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
	
_strcpy:
;incstack = 0
	callstack 27
	line	18
	
l9144:
		movff	(c:strcpy@to),(c:strcpy@cp)
	movff	(c:strcpy@to+1),(c:strcpy@cp+1)

	line	19
	goto	l9148
	line	20
	
l9146:
	infsnz	((c:strcpy@cp))^00h,c
	incf	((c:strcpy@cp+1))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l9148:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movff	(c:strcpy@cp),fsr2l
	movff	(c:strcpy@cp+1),fsr2h
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
	movwf	indf2
	movf	indf2,w
	btfss	status,2
	goto	u11811
	goto	u11810
u11811:
	goto	l9146
u11810:
	line	24
	
l2088:
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
;;		 -> value_sensor(12), value_enable(10), NULL(0), 
;;  s2              2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_255(5), STR_254(6), STR_253(6), STR_252(8), 
;;		 -> STR_220(1), STR_187(1), STR_61(1), STR_60(1), 
;;		 -> STR_59(9), STR_58(6), STR_57(6), STR_56(1), 
;;		 -> STR_55(1), STR_54(1), STR_53(5), STR_52(5), 
;;		 -> STR_51(1), STR_50(1), STR_49(1), STR_48(4), 
;;		 -> STR_47(2), STR_46(1), STR_45(1), STR_44(1), 
;;		 -> STR_43(5), STR_42(4), STR_41(1), STR_40(1), 
;;		 -> STR_39(1), STR_38(8), STR_37(7), STR_36(1), 
;;		 -> STR_35(1), STR_34(5), STR_33(5), STR_32(9), 
;;		 -> STR_31(1), STR_30(1), STR_29(1), STR_28(8), 
;;		 -> STR_27(9), 
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
;;		_menu_draw_clock
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text27,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
global __ptext27
__ptext27:
psect	text27
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
	
_strcmp:
;incstack = 0
	callstack 26
	line	37
	
l6216:
	goto	l6220
	line	38
	
l6218:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l6220:
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
	goto	u7021
	goto	u7020
u7021:
	goto	l6224
u7020:
	
l6222:
	movff	(c:strcmp@s1),fsr2l
	movff	(c:strcmp@s1+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u7031
	goto	u7030
u7031:
	goto	l6218
u7030:
	line	41
	
l6224:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l2082:
	return	;funcret
	callstack 0
GLOBAL	__end_of_strcmp
	__end_of_strcmp:
	signat	_strcmp,8314
	global	_lcd_print_at

;; *************** function _lcd_print_at *****************
;; Defined at:
;;		line 584 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   20[COMRAM] unsigned char 
;;  str             2   21[COMRAM] PTR const unsigned char 
;;		 -> menu_draw_clock@value_buf(15), STR_219(6), Fake(1), STR_200(5), 
;;		 -> STR_199(5), STR_198(9), STR_197(5), STR_196(6), 
;;		 -> STR_195(1), STR_194(1), STR_193(1), menu_draw_input@value_buf(15), 
;;		 -> menu_draw_input@title(10), STR_112(5), STR_111(8), STR_110(8), 
;;		 -> STR_109(7), STR_108(5), STR_107(8), STR_106(8), 
;;		 -> STR_105(12), STR_104(9), STR_103(11), STR_102(10), 
;;		 -> STR_101(6), STR_100(5), STR_99(7), STR_98(7), 
;;		 -> STR_97(5), STR_96(8), STR_95(8), STR_94(11), 
;;		 -> STR_93(8), STR_92(5), STR_91(7), STR_90(7), 
;;		 -> STR_89(5), STR_88(8), STR_87(9), STR_86(9), 
;;		 -> STR_85(10), STR_84(11), STR_83(10), STR_82(7), 
;;		 -> STR_81(7), STR_80(5), STR_79(8), STR_78(8), 
;;		 -> STR_77(8), STR_76(9), STR_75(6), STR_74(6), 
;;		 -> STR_73(13), STR_72(9), STR_71(12), STR_70(11), 
;;		 -> STR_69(10), STR_68(7), STR_67(7), STR_66(5), 
;;		 -> STR_65(6), STR_64(13), STR_63(11), STR_62(10), 
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
psect	text28,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	584
global __ptext28
__ptext28:
psect	text28
	file	"src\menu.c"
	line	584
	
_lcd_print_at:
;incstack = 0
	callstack 23
	movwf	((c:lcd_print_at@row))^00h,c
	line	586
	
l9136:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	587
	
l9138:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	588
	
l597:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print_at
	__end_of_lcd_print_at:
	signat	_lcd_print_at,12409
	global	_lcd_clear_line

;; *************** function _lcd_clear_line *****************
;; Defined at:
;;		line 590 in file "src\menu.c"
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
psect	text29,class=CODE,space=0,reloc=2,group=0
	line	590
global __ptext29
__ptext29:
psect	text29
	file	"src\menu.c"
	line	590
	
_lcd_clear_line:
;incstack = 0
	callstack 23
	movwf	((c:lcd_clear_line@row))^00h,c
	line	592
	
l9140:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	593
	
l9142:
		movlw	low(STR_122)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_122)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	594
	
l600:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear_line
	__end_of_lcd_clear_line:
	signat	_lcd_clear_line,4217
	global	_lcd_set_cursor

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 174 in file "src\main.c"
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
psect	text30,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	174
global __ptext30
__ptext30:
psect	text30
	file	"src\main.c"
	line	174
	
_lcd_set_cursor:
;incstack = 0
	callstack 25
	movwf	((c:lcd_set_cursor@row))^00h,c
	line	177
	
l8818:
	goto	l8832
	line	180
	
l8820:
	movlw	low(080h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	181
	goto	l8834
	line	183
	
l8822:
	movlw	low(0C0h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	184
	goto	l8834
	line	186
	
l8824:
	movlw	low(094h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	187
	goto	l8834
	line	189
	
l8826:
	movlw	low(0D4h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	190
	goto	l8834
	line	177
	
l8832:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l8820
	xorlw	1^0	; case 1
	skipnz
	goto	l8822
	xorlw	2^1	; case 2
	skipnz
	goto	l8824
	xorlw	3^2	; case 3
	skipnz
	goto	l8826
	goto	l8820

	line	195
	
l8834:
	movf	((c:lcd_set_cursor@address))^00h,c,w
	addwf	((c:lcd_set_cursor@col))^00h,c,w
	
	call	_lcd_cmd
	line	196
	
l170:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
	signat	_lcd_set_cursor,8313
	global	_lcd_print

;; *************** function _lcd_print *****************
;; Defined at:
;;		line 160 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_224(2), STR_223(2), STR_222(2), STR_221(2), 
;;		 -> menu_draw_clock@value_buf(15), STR_219(6), STR_208(2), STR_207(2), 
;;		 -> STR_206(2), STR_205(2), STR_204(2), STR_203(2), 
;;		 -> STR_202(2), STR_201(2), Fake(1), STR_200(5), 
;;		 -> STR_199(5), STR_198(9), STR_197(5), STR_196(6), 
;;		 -> STR_195(1), STR_194(1), STR_193(1), STR_192(21), 
;;		 -> STR_191(2), STR_190(2), STR_189(2), STR_188(2), 
;;		 -> menu_draw_input@value_buf(15), menu_draw_input@title(10), STR_184(2), STR_183(2), 
;;		 -> STR_182(21), STR_181(2), STR_180(2), STR_179(6), 
;;		 -> menu_update_numeric_value@value_buf(6), STR_178(2), STR_177(2), STR_176(7), 
;;		 -> menu_update_edit_value@display_buf(10), STR_122(21), STR_121(2), STR_120(2), 
;;		 -> STR_119(8), menu_update_time_value@value_buf(6), STR_112(5), STR_111(8), 
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
;;		 -> STR_62(10), STR_23(8), STR_22(12), STR_17(6), 
;;		 -> STR_16(12), STR_4(16), STR_3(13), 
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
psect	text31,class=CODE,space=0,reloc=2,group=0
	line	160
global __ptext31
__ptext31:
psect	text31
	file	"src\main.c"
	line	160
	
_lcd_print:
;incstack = 0
	callstack 25
	line	162
	
l8810:
	goto	l8816
	line	164
	
l8812:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11257
	tblrd	*
	
	movf	tablat,w
	bra	u11250
u11257:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11250:
	
	call	_lcd_data
	
l8814:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	162
	
l8816:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11267
	tblrd	*
	
	movf	tablat,w
	bra	u11260
u11267:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11260:
	iorlw	0
	btfss	status,2
	goto	u11271
	goto	u11270
u11271:
	goto	l8812
u11270:
	line	166
	
l157:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print
	__end_of_lcd_print:
	signat	_lcd_print,4217
	global	_lcd_data

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 152 in file "src\main.c"
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
psect	text32,class=CODE,space=0,reloc=2,group=0
	line	152
global __ptext32
__ptext32:
psect	text32
	file	"src\main.c"
	line	152
	
_lcd_data:
;incstack = 0
	callstack 25
	movwf	((c:lcd_data@data))^00h,c
	line	154
	
l8804:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	155
	
l8806:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	156
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	157
	
l8808:
	asmopt push
asmopt off
	movlw	133
u15607:
decfsz	wreg,f
	bra	u15607
	nop
asmopt pop

	line	158
	
l151:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
	signat	_lcd_data,4217
	global	_init_time_editor

;; *************** function _init_time_editor *****************
;; Defined at:
;;		line 417 in file "src\menu.c"
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
	file	"src\menu.c"
	line	417
global __ptext33
__ptext33:
psect	text33
	file	"src\menu.c"
	line	417
	
_init_time_editor:
;incstack = 0
	callstack 24
	line	420
	
l9604:
	movff	(c:init_time_editor@mode),0+(_menu+010h)
	line	421
	movff	(c:init_time_editor@value_seconds),0+(_menu+014h)
	movff	(c:init_time_editor@value_seconds+1),1+(_menu+014h)
	line	424
	
l9606:
	movf	((c:init_time_editor@mode))^00h,c,w
	btfss	status,2
	goto	u12631
	goto	u12630
u12631:
	goto	l9610
u12630:
	line	426
	
l9608:
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
	line	427
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
	line	428
	goto	l9612
	line	431
	
l9610:
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
	line	432
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
	line	436
	
l9612:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+011h))&0ffh
	line	441
	
l9614:; BSR set to: 2

		movlw	low(init_time_editor@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_113)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_113)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:init_time_editor@value_seconds),0+((c:?_sprintf)+04h)
	movff	(c:init_time_editor@value_seconds+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+012h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	442
	
l9616:
		movlw	low(init_time_editor@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	443
	
l558:
	return	;funcret
	callstack 0
GLOBAL	__end_of_init_time_editor
	__end_of_init_time_editor:
	signat	_init_time_editor,8313
	global	_uart_println

;; *************** function _uart_println *****************
;; Defined at:
;;		line 79 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   17[COMRAM] PTR const unsigned char 
;;		 -> STR_256(20), STR_251(25), menu_handle_button@buf_1494(50), menu_handle_button@buf_1484(50), 
;;		 -> STR_238(27), menu_handle_button@buf_1462(50), menu_handle_button@buf(50), menu_handle_encoder@buf_1434(50), 
;;		 -> menu_handle_encoder@buf_1431(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), handle_numeric_rotation@buf(50), 
;;		 -> STR_172(31), rebuild_input_menu@buf(50), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), STR_114(29), init_time_editor@buf(60), STR_26(21), 
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
	line	79
global __ptext34
__ptext34:
psect	text34
	file	"src\main.c"
	line	79
	
_uart_println:
;incstack = 0
	callstack 26
	line	81
	
l5614:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	82
	
l5616:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	83
	
l5618:
	movlw	(0Ah)&0ffh
	
	call	_uart_write
	line	84
	
l124:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_println
	__end_of_uart_println:
	signat	_uart_println,4217
	global	_uart_print

;; *************** function _uart_print *****************
;; Defined at:
;;		line 71 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   15[COMRAM] PTR const unsigned char 
;;		 -> STR_256(20), STR_251(25), menu_handle_button@buf_1494(50), menu_handle_button@buf_1484(50), 
;;		 -> STR_238(27), menu_handle_button@buf_1462(50), menu_handle_button@buf(50), menu_handle_encoder@buf_1434(50), 
;;		 -> menu_handle_encoder@buf_1431(50), menu_handle_encoder@buf(50), rebuild_clock_menu@buf(50), handle_numeric_rotation@buf(50), 
;;		 -> STR_172(31), rebuild_input_menu@buf(50), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), STR_114(29), init_time_editor@buf(60), STR_26(21), 
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
	line	71
global __ptext35
__ptext35:
psect	text35
	file	"src\main.c"
	line	71
	
_uart_print:
;incstack = 0
	callstack 26
	line	73
	
l5518:
	goto	l5524
	line	75
	
l5520:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5677
	tblrd	*
	
	movf	tablat,w
	bra	u5670
u5677:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5670:
	
	call	_uart_write
	
l5522:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	73
	
l5524:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u5687
	tblrd	*
	
	movf	tablat,w
	bra	u5680
u5687:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u5680:
	iorlw	0
	btfss	status,2
	goto	u5691
	goto	u5690
u5691:
	goto	l5520
u5690:
	line	77
	
l121:
	return	;funcret
	callstack 0
GLOBAL	__end_of_uart_print
	__end_of_uart_print:
	signat	_uart_print,4217
	global	_uart_write

;; *************** function _uart_write *****************
;; Defined at:
;;		line 64 in file "src\main.c"
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
	line	64
global __ptext36
__ptext36:
psect	text36
	file	"src\main.c"
	line	64
	
_uart_write:
;incstack = 0
	callstack 27
	movwf	((c:uart_write@c))^00h,c
	line	66
	
l5496:
	line	67
	
l112:
	line	66
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u5641
	goto	u5640
u5641:
	goto	l112
u5640:
	line	68
	
l5498:
	movff	(c:uart_write@c),(c:4013)	;volatile
	line	69
	
l115:
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
;;		 -> menu_handle_button@buf_1494(50), menu_handle_button@buf_1484(50), menu_handle_button@buf_1462(50), menu_handle_button@buf(50), 
;;		 -> menu_handle_encoder@buf_1434(50), menu_handle_encoder@buf_1431(50), menu_handle_encoder@buf(50), value_clock_display(10), 
;;		 -> value_end_runtime(10), value_clock_enable(10), rebuild_clock_menu@buf(50), menu_draw_input@title(10), 
;;		 -> menu_update_edit_value@value_buf(10), handle_numeric_rotation@buf(50), rebuild_input_menu@buf(50), value_no_flow_bp(10), 
;;		 -> value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), value_flow_units(10), 
;;		 -> value_rlylow(10), value_flow_type(10), value_high_tbp(10), value_high_temp(10), 
;;		 -> value_back(5), value_display(10), value_rlyslp(10), value_rlyplp(10), 
;;		 -> value_rlyhigh(10), value_slpbp(10), value_plpbp(10), value_low_pressure(10), 
;;		 -> value_highbp(10), value_hi_pressure(10), value_scale20(10), value_scale4(10), 
;;		 -> value_sensor(12), value_enable(10), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), init_time_editor@buf(60), NULL(0), main@buf_623(30), 
;;		 -> main@buf(40), 
;;  f               2   28[COMRAM] PTR const unsigned char 
;;		 -> STR_250(32), STR_249(38), STR_248(5), STR_247(6), 
;;		 -> STR_246(6), STR_245(5), STR_244(6), STR_243(6), 
;;		 -> STR_242(5), STR_241(5), STR_240(6), STR_239(6), 
;;		 -> STR_237(10), STR_236(26), STR_235(42), STR_234(28), 
;;		 -> STR_233(25), STR_232(36), STR_231(26), STR_230(35), 
;;		 -> STR_229(28), STR_228(37), STR_227(32), STR_226(23), 
;;		 -> STR_225(37), STR_218(29), STR_217(34), STR_210(3), 
;;		 -> STR_209(35), STR_185(9), STR_175(9), STR_174(7), 
;;		 -> STR_173(29), STR_171(48), STR_170(10), STR_168(10), 
;;		 -> STR_167(5), STR_166(6), STR_165(6), STR_149(10), 
;;		 -> STR_148(3), STR_147(6), STR_146(6), STR_133(10), 
;;		 -> STR_132(10), STR_131(5), STR_130(10), STR_129(5), 
;;		 -> STR_128(6), STR_127(6), STR_123(3), STR_118(27), 
;;		 -> STR_117(51), STR_116(25), STR_115(45), STR_113(35), 
;;		 -> STR_12(17), STR_11(23), 
;; Auto vars:     Size  Location     Type
;;  tmpval          4    0        struct .
;;  width           2   54[COMRAM] int 
;;  len             2   51[COMRAM] unsigned int 
;;  val             2   49[COMRAM] unsigned int 
;;  cp              2   46[COMRAM] PTR const unsigned char 
;;		 -> STR_257(7), sprintf@c(1), ?_sprintf(2), value_clock_display(10), 
;;		 -> value_end_runtime(10), STR_212(9), STR_211(8), value_clock_enable(10), 
;;		 -> value_no_flow_bp(10), value_no_flow(10), value_low_flow_bp(10), value_low_flow(10), 
;;		 -> value_flow_units(10), value_rlylow(10), value_flow_type(10), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), STR_125(9), STR_124(8), 
;;		 -> value_enable(10), menu_update_time_value@value_buf(6), display_edit_flag(1), relay_high_edit_flag(1), 
;;		 -> NULL(0), menu_item_options$option_count(1), STR_61(1), STR_60(1), 
;;		 -> STR_59(9), STR_58(6), STR_57(6), STR_56(1), 
;;		 -> STR_55(1), STR_54(1), STR_53(5), STR_52(5), 
;;		 -> STR_51(1), STR_50(1), STR_49(1), STR_48(4), 
;;		 -> STR_47(2), STR_46(1), STR_45(1), STR_44(1), 
;;		 -> STR_43(5), STR_42(4), STR_41(1), STR_40(1), 
;;		 -> STR_39(1), STR_38(8), STR_37(7), STR_36(1), 
;;		 -> STR_35(1), STR_34(5), STR_33(5), STR_32(9), 
;;		 -> STR_31(1), STR_30(1), STR_29(1), STR_28(8), 
;;		 -> STR_27(9), enable_edit_flag(1), 
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
	
l8896:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l9070
	line	555
	
l8898:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u11361
	goto	u11360

u11361:
	goto	l8904
u11360:
	line	558
	
l8900:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l8902:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l9070
	line	563
	
l8904:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	565
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	goto	l8914
	line	578
	
l8906:
	bsf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	579
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	580
	goto	l8914
	line	585
	
l8908:
	bsf	(0+(1/8)+(c:sprintf@flag))^00h,c,(1)&7
	line	586
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	587
	goto	l8914
	line	597
	
l8910:
	bsf	(0+(2/8)+(c:sprintf@flag))^00h,c,(2)&7
	line	598
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	568
	
l8914:
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
	goto	l8906
	xorlw	43^32	; case 43
	skipnz
	goto	l8908
	xorlw	48^43	; case 48
	skipnz
	goto	l8910
	goto	l1341

	line	603
	
l1341:
	line	606
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u11371
	goto	u11370
u11371:
	goto	l8918
u11370:
	line	607
	
l8916:
	bcf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	614
	
l8918:
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
	goto	u11381
	goto	u11380
u11381:
	goto	l8974
u11380:
	line	615
	
l8920:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	617
	
l8922:
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
	
l8924:
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

	
l8926:
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	619
	
l8928:
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
	goto	u11391
	goto	u11390
u11391:
	goto	l8922
u11390:
	goto	l8974
	line	760
	
l8930:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l8932:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l8934:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u11401
	goto	u11400

u11401:
	goto	l8938
u11400:
	line	767
	
l8936:
		movlw	low(STR_257)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_257)
	movwf	((c:sprintf@cp+1))^00h,c

	line	771
	
l8938:
	movlw	high(0)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@len))^00h,c
	line	772
	goto	l8942
	line	773
	
l8940:
	infsnz	((c:sprintf@len))^00h,c
	incf	((c:sprintf@len+1))^00h,c
	line	772
	
l8942:
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
	bra	u11417
	tblrd	*
	
	movf	tablat,w
	bra	u11410
u11417:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11410:
	iorlw	0
	btfss	status,2
	goto	u11421
	goto	u11420
u11421:
	goto	l8940
u11420:
	line	783
	
l8944:
		movf	((c:sprintf@width))^00h,c,w
	subwf	((c:sprintf@len))^00h,c,w
	movf	((c:sprintf@width+1))^00h,c,w
	subwfb	((c:sprintf@len+1))^00h,c,w
	btfsc	status,0
	goto	u11431
	goto	u11430

u11431:
	goto	l8948
u11430:
	line	784
	
l8946:
	movf	((c:sprintf@len))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	subwfb	((c:sprintf@width+1))^00h,c

	goto	l8954
	line	786
	
l8948:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	goto	l8954
	line	791
	
l8950:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l8952:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	790
	
l8954:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
		incf	((c:sprintf@width))^00h,c,w
	bnz	u11441
	incf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u11441
	goto	u11440

u11441:
	goto	l8950
u11440:
	goto	l8962
	line	794
	
l8956:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u11457
	tblrd	*
	
	movf	tablat,w
	bra	u11450
u11457:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u11450:
	movwf	indf2
	
l8958:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l8960:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	793
	
l8962:
	decf	((c:sprintf@len))^00h,c
	btfss	status,0
	decf	((c:sprintf@len+1))^00h,c
		incf	((c:sprintf@len))^00h,c,w
	bnz	u11461
	incf	((c:sprintf@len+1))^00h,c,w
	btfss	status,2
	goto	u11461
	goto	u11460

u11461:
	goto	l8956
u11460:
	goto	l9070
	line	825
	
l8964:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:sprintf@c))^00h,c
	
l8966:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	831
	
l8968:
		movlw	low(sprintf@c)
	movwf	((c:sprintf@cp))^00h,c
	clrf	((c:sprintf@cp+1))^00h,c

	line	832
	
l8970:
	movlw	high(01h)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(01h)
	movwf	((c:sprintf@len))^00h,c
	line	833
	goto	l8944
	line	661
	
l8974:
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
	goto	l9072
	xorlw	99^0	; case 99
	skipnz
	goto	l8964
	xorlw	100^99	; case 100
	skipnz
	goto	l8976
	xorlw	105^100	; case 105
	skipnz
	goto	l8976
	xorlw	115^105	; case 115
	skipnz
	goto	l8930
	goto	l8968

	line	1285
	
l8976:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l8978:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l8980:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u11470
	goto	u11471

u11471:
	goto	l8986
u11470:
	line	1288
	
l8982:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l8984:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	line	1331
	
l8986:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	
l8988:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u11481
	goto	u11480

u11481:
	goto	l8992
u11480:
	goto	l9000
	line	1332
	
l8992:
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
	goto	u11491
	goto	u11490

u11491:
	goto	l8996
u11490:
	goto	l9000
	line	1331
	
l8996:
	incf	((c:sprintf@c))^00h,c
	goto	l8988
	line	1371
	
l9000:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u11501
	goto	u11500

u11501:
	goto	l9006
u11500:
	
l9002:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u11511
	goto	u11510
u11511:
	goto	l9006
u11510:
	line	1372
	
l9004:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	line	1407
	
l9006:
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
	goto	u11521
	goto	u11520

u11521:
	goto	l9010
u11520:
	line	1408
	
l9008:
	movf	((c:sprintf@c))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movlw	0
	subwfb	((c:sprintf@width+1))^00h,c
	goto	l9012
	line	1410
	
l9010:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	1413
	
l9012:
	
	btfss	((c:sprintf@flag))^00h,c,(2)&7
	goto	u11531
	goto	u11530
u11531:
	goto	l9038
u11530:
	line	1415
	
l9014:
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u11541
	goto	u11540
u11541:
	goto	l1376
u11540:
	line	1416
	
l9016:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u11551
	goto	u11550
u11551:
	goto	l9020
u11550:
	
l9018:
	movlw	high(02Bh)
	movwf	((c:_sprintf$1729+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$1729))^00h,c
	goto	l9022
	
l9020:
	movlw	high(02Dh)
	movwf	((c:_sprintf$1729+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$1729))^00h,c
	
l9022:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$1729),indf2

	
l9024:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l9030
	line	1422
	
l1376:
	line	1425
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u11561
	goto	u11560
u11561:
	goto	l9030
u11560:
	line	1426
	
l9026:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l9024
	line	1441
	
l9030:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u11571
	goto	u11570

u11571:
	goto	l9060
u11570:
	line	1443
	
l9032:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(030h)
	movwf	indf2
	
l9034:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1444
	
l9036:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u11581
	goto	u11580

u11581:
	goto	l9032
u11580:
	goto	l9060
	line	1454
	
l9038:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u11591
	goto	u11590

u11591:
	goto	l1387
u11590:
	line	1456
	
l9040:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l9042:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1457
	
l9044:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u11601
	goto	u11600

u11601:
	goto	l9040
u11600:
	
l1387:
	line	1460
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u11611
	goto	u11610
u11611:
	goto	l1390
u11610:
	line	1461
	
l9046:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u11621
	goto	u11620
u11621:
	goto	l9050
u11620:
	
l9048:
	movlw	high(02Bh)
	movwf	((c:_sprintf$1730+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$1730))^00h,c
	goto	l9052
	
l9050:
	movlw	high(02Dh)
	movwf	((c:_sprintf$1730+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$1730))^00h,c
	
l9052:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$1730),indf2

	
l9054:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l9060
	line	1469
	
l1390:
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u11631
	goto	u11630
u11631:
	goto	l9060
u11630:
	line	1470
	
l9056:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l9054
	line	1498
	
l9060:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l9068
	line	1515
	
l9062:
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
	
l9064:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l9066:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l9068:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u11641
	goto	u11640

u11641:
	goto	l9062
u11640:
	line	553
	
l9070:
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
	goto	u11651
	goto	u11650
u11651:
	goto	l8898
u11650:
	line	1564
	
l9072:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	clrf	indf2
	line	1567
	
l1401:
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
	
l8836:
	movlw	low(0)
	movwf	((c:_isdigit$2170))^00h,c
	
l8838:
		movlw	03Ah-0
	cpfslt	((c:isdigit@c))^00h,c
	goto	u11281
	goto	u11280

u11281:
	goto	l8844
u11280:
	
l8840:
		movlw	030h-1
	cpfsgt	((c:isdigit@c))^00h,c
	goto	u11291
	goto	u11290

u11291:
	goto	l8844
u11290:
	
l8842:
	movlw	low(01h)
	movwf	((c:_isdigit$2170))^00h,c
	
l8844:
	movff	(c:_isdigit$2170),??_isdigit+0+0
	rrcf	(??_isdigit+0+0)^00h,c,w
	line	15
	
l2068:
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
	
l8848:
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
	
l8850:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	line	53
	
l1404:
	return	;funcret
	callstack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	_init_numeric_editor

;; *************** function _init_numeric_editor *****************
;; Defined at:
;;		line 771 in file "src\menu.c"
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
	line	771
global __ptext40
__ptext40:
psect	text40
	file	"src\menu.c"
	line	771
	
_init_numeric_editor:
;incstack = 0
	callstack 26
	line	775
	
l9908:
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
	line	776
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
	line	779
	
l9910:; BSR set to: 2

	movlw	low(0)
	movwf	(0+(_menu+0Fh))&0ffh
	line	781
	
l9912:; BSR set to: 2

	movf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u12841
	goto	u12840
u12841:
	goto	l9920
u12840:
	line	784
	
l9914:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u12851
	goto	u12850

u12851:
	goto	l9918
u12850:
	
l9916:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12861
	goto	u12860

u12861:
	goto	l9934
u12860:
	line	785
	
l9918:; BSR set to: 2

	movlw	low(01h)
	movwf	(0+(_menu+0Fh))&0ffh
	goto	l9934
	line	787
	
l9920:; BSR set to: 2

		decf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u12871
	goto	u12870

u12871:
	goto	l9926
u12870:
	line	790
	
l9922:; BSR set to: 2

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12881
	goto	u12880

u12881:
	goto	l9934
u12880:
	goto	l9918
	line	793
	
l9926:; BSR set to: 2

		movlw	2
	xorwf	((c:init_numeric_editor@sensor_type))^00h,c,w
	btfss	status,2
	goto	u12891
	goto	u12890

u12891:
	goto	l9934
u12890:
	
l9928:; BSR set to: 2

	movf	((c:init_numeric_editor@flow_type))^00h,c,w
	btfss	status,2
	goto	u12901
	goto	u12900
u12901:
	goto	l9934
u12900:
	line	796
	
l9930:; BSR set to: 2

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u12911
	goto	u12910

u12911:
	goto	l9934
u12910:
	goto	l9918
	line	801
	
l9934:; BSR set to: 2

	movff	(c:init_numeric_editor@value),0+(_menu+0Dh)
	movff	(c:init_numeric_editor@value+1),1+(_menu+0Dh)
	line	804
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u12921
	goto	u12920
u12921:
	goto	l694
u12920:
	
l9936:; BSR set to: 2

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u12930
	goto	u12931

u12931:
	goto	l694
u12930:
	line	805
	
l9938:; BSR set to: 2

	movlw	high(0)
	movwf	((c:init_numeric_editor@value+1))^00h,c
	movlw	low(0)
	movwf	((c:init_numeric_editor@value))^00h,c
	
l694:; BSR set to: 2

	line	808
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u12941
	goto	u12940
u12941:
	goto	l9942
u12940:
	
l9940:; BSR set to: 2

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u12951
	goto	u12950

u12951:
	movlw	1
	goto	u12960
u12950:
	movlw	0
u12960:
	movwf	((c:_init_numeric_editor$1229))^00h,c
	clrf	((c:_init_numeric_editor$1229+1))^00h,c
	goto	l9944
	
l9942:; BSR set to: 2

	movlw	high(0)
	movwf	((c:_init_numeric_editor$1229+1))^00h,c
	movlw	low(0)
	movwf	((c:_init_numeric_editor$1229))^00h,c
	
l9944:; BSR set to: 2

	movff	(c:_init_numeric_editor$1229),0+(_menu+09h)
	line	811
	
l9946:; BSR set to: 2

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u12971
	goto	u12970

u12971:
	goto	l700
u12970:
	
l9948:; BSR set to: 2

	movff	(c:init_numeric_editor@value),(c:init_numeric_editor@abs_val)
	movff	(c:init_numeric_editor@value+1),(c:init_numeric_editor@abs_val+1)
	goto	l9950
	
l700:; BSR set to: 2

	movff	(c:init_numeric_editor@value),??_init_numeric_editor+0+0
	movff	(c:init_numeric_editor@value+1),??_init_numeric_editor+0+0+1
	comf	(??_init_numeric_editor+0+0)^00h,c
	comf	(??_init_numeric_editor+0+1)^00h,c
	infsnz	(??_init_numeric_editor+0+0)^00h,c
	incf	(??_init_numeric_editor+0+1)^00h,c
	movff	??_init_numeric_editor+0+0,(c:init_numeric_editor@abs_val)
	movff	??_init_numeric_editor+0+1,(c:init_numeric_editor@abs_val+1)
	line	812
	
l9950:; BSR set to: 2

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
	line	813
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
	line	814
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
	line	817
	
l9952:; BSR set to: 2

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u12981
	goto	u12980
u12981:
	movlw	1
	goto	u12990
u12980:
	movlw	0
u12990:
	movwf	(0+(_menu+08h))&0ffh
	line	818
	
l703:; BSR set to: 2

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
	
l8876:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u11331
	goto	u11330

u11331:
	goto	l1893
u11330:
	line	13
	
l8878:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l8882
	line	15
	
l8880:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l8882:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u11341
	goto	u11340
u11341:
	goto	l8880
u11340:
	line	19
	
l8884:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u11351
	goto	u11350

u11351:
	goto	l8888
u11350:
	line	20
	
l8886:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l8888:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l8890:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l8884
	line	23
	
l1893:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l1900:
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
	
l8854:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l8856:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u11301
	goto	u11300

u11301:
	goto	l1883
u11300:
	line	15
	
l8858:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l8862
	line	17
	
l8860:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l8862:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u11311
	goto	u11310
u11311:
	goto	l8860
u11310:
	line	21
	
l8864:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l8866:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u11321
	goto	u11320

u11321:
	goto	l8872
u11320:
	line	23
	
l8868:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l8870:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l8872:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l8874:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l8864
	line	28
	
l1883:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l1890:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_get_current_numeric_value

;; *************** function _get_current_numeric_value *****************
;; Defined at:
;;		line 820 in file "src\menu.c"
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
	line	820
global __ptext43
__ptext43:
psect	text43
	file	"src\menu.c"
	line	820
	
_get_current_numeric_value:
;incstack = 0
	callstack 27
	line	822
	
l7148:; BSR set to: 2

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
	line	823
	
l7150:; BSR set to: 2

	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u8301
	goto	u8300
u8301:
	goto	l7154
u8300:
	line	824
	
l7152:; BSR set to: 2

	negf	((c:get_current_numeric_value@value))^00h,c
	comf	((c:get_current_numeric_value@value+1))^00h,c
	btfsc	status,0
	incf	((c:get_current_numeric_value@value+1))^00h,c
	line	825
	
l7154:; BSR set to: 2

	movff	(c:get_current_numeric_value@value),(c:?_get_current_numeric_value)
	movff	(c:get_current_numeric_value@value+1),(c:?_get_current_numeric_value+1)
	line	826
	
l707:; BSR set to: 2

	return	;funcret
	callstack 0
GLOBAL	__end_of_get_current_numeric_value
	__end_of_get_current_numeric_value:
	signat	_get_current_numeric_value,90
	global	_beep

;; *************** function _beep *****************
;; Defined at:
;;		line 236 in file "src\main.c"
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
	line	236
global __ptext44
__ptext44:
psect	text44
	file	"src\main.c"
	line	236
	
_beep:; BSR set to: 2

;incstack = 0
	callstack 27
	line	238
	
l6328:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	239
	
l6330:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l176
	line	241
	
l6332:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u15617:
decfsz	wreg,f
	bra	u15617
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u15617
	nop2
asmopt pop

	line	239
	
l6334:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l176:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u7121
	goto	u7120

u7121:
	goto	l6332
u7120:
	
l178:
	line	243
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	244
	
l179:
	return	;funcret
	callstack 0
GLOBAL	__end_of_beep
	__end_of_beep:
	signat	_beep,4217
	global	_lcd_init

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 198 in file "src\main.c"
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
	line	198
global __ptext45
__ptext45:
psect	text45
	file	"src\main.c"
	line	198
	
_lcd_init:
;incstack = 0
	callstack 26
	line	201
	
l10076:; BSR set to: 2

	movlw	low(010h)
	movwf	((c:3986))^0f00h,c	;volatile
	line	202
	movlw	low(046h)
	movwf	((c:3987))^0f00h,c	;volatile
	line	203
	movlw	low(0)
	movwf	((c:3988))^0f00h,c	;volatile
	line	206
	movlw	low(0)
	movwf	((c:3968))^0f00h,c	;volatile
	line	207
	movlw	low(0)
	movwf	((c:3969))^0f00h,c	;volatile
	line	208
	movlw	low(0)
	movwf	((c:3970))^0f00h,c	;volatile
	line	210
	
l10078:; BSR set to: 2

	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u15627:
decfsz	wreg,f
	bra	u15627
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u15627
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u15627
	nop
asmopt pop

	line	212
	
l10080:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	215
	
l10082:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	216
	
l10084:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u15637:
decfsz	wreg,f
	bra	u15637
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u15637
asmopt pop

	line	217
	
l10086:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	218
	
l10088:
	asmopt push
asmopt off
	movlw	240
u15647:
	nop2
decfsz	wreg,f
	bra	u15647
asmopt pop

	line	219
	
l10090:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	220
	
l10092:
	asmopt push
asmopt off
	movlw	240
u15657:
	nop2
decfsz	wreg,f
	bra	u15657
asmopt pop

	line	223
	
l10094:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	224
	
l10096:
	asmopt push
asmopt off
	movlw	240
u15667:
	nop2
decfsz	wreg,f
	bra	u15667
asmopt pop

	line	227
	
l10098:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	228
	
l10100:
	movlw	(08h)&0ffh
	
	call	_lcd_cmd
	line	229
	
l10102:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	230
	
l10104:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_init+0+0)^00h,c
	movlw	198
u15677:
decfsz	wreg,f
	bra	u15677
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u15677
	nop2
asmopt pop

	line	231
	
l10106:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	232
	
l10108:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	233
	
l173:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
	signat	_lcd_init,89
	global	_lcd_cmd

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 136 in file "src\main.c"
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
	line	136
global __ptext46
__ptext46:
psect	text46
	file	"src\main.c"
	line	136
	
_lcd_cmd:
;incstack = 0
	callstack 25
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	138
	
l8792:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	139
	
l8794:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	140
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	142
	
l8796:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u11231
	goto	u11230

u11231:
	goto	l8800
u11230:
	
l8798:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u11241
	goto	u11240

u11241:
	goto	l8802
u11240:
	line	144
	
l8800:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u15687:
decfsz	wreg,f
	bra	u15687
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u15687
	nop2
asmopt pop

	line	145
	goto	l148
	line	148
	
l8802:
	asmopt push
asmopt off
	movlw	133
u15697:
decfsz	wreg,f
	bra	u15697
	nop
asmopt pop

	line	150
	
l148:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
	signat	_lcd_cmd,4217
	global	_lcd_write_nibble

;; *************** function _lcd_write_nibble *****************
;; Defined at:
;;		line 111 in file "src\main.c"
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
	line	111
global __ptext47
__ptext47:
psect	text47
	file	"src\main.c"
	line	111
	
_lcd_write_nibble:
;incstack = 0
	callstack 25
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	113
	
l8774:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u11191
	goto	u11190
u11191:
	goto	l133
u11190:
	line	114
	
l8776:
	bsf	((c:3977))^0f00h,c,0	;volatile
	goto	l8778
	line	115
	
l133:
	line	116
	bcf	((c:3977))^0f00h,c,0	;volatile
	line	117
	
l8778:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u11201
	goto	u11200
u11201:
	goto	l135
u11200:
	line	118
	
l8780:
	bsf	((c:3977))^0f00h,c,1	;volatile
	goto	l8782
	line	119
	
l135:
	line	120
	bcf	((c:3977))^0f00h,c,1	;volatile
	line	121
	
l8782:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u11211
	goto	u11210
u11211:
	goto	l137
u11210:
	line	122
	
l8784:
	bsf	((c:3977))^0f00h,c,2	;volatile
	goto	l8786
	line	123
	
l137:
	line	124
	bcf	((c:3977))^0f00h,c,2	;volatile
	line	125
	
l8786:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u11221
	goto	u11220
u11221:
	goto	l139
u11220:
	line	126
	
l8788:
	bsf	((c:3977))^0f00h,c,3	;volatile
	goto	l140
	line	127
	
l139:
	line	128
	bcf	((c:3977))^0f00h,c,3	;volatile
	
l140:
	line	130
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	131
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	132
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	133
	
l8790:
	asmopt push
asmopt off
	movlw	133
u15707:
decfsz	wreg,f
	bra	u15707
	nop
asmopt pop

	line	134
	
l141:
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
	
l7388:; BSR set to: 4

		movlw	05h-0
	cpfslt	(0+(_system_config+01h))&0ffh
	goto	u8511
	goto	u8510

u8511:
	goto	l7394
u8510:
	line	265
	
l7390:; BSR set to: 4

	movlw	(01Eh)&0ffh
	goto	l1319
	line	267
	
l7394:; BSR set to: 4

		movlw	079h-1
	cpfsgt	(0+(_system_config+01h))&0ffh
	goto	u8521
	goto	u8520

u8521:
	goto	l7400
u8520:
	goto	l7390
	line	271
	
l7400:; BSR set to: 4

	movf	(0+(_system_config+01h))&0ffh,w
	line	272
	
l1319:; BSR set to: 4

	return	;funcret
	callstack 0
GLOBAL	__end_of_get_menu_timeout_seconds
	__end_of_get_menu_timeout_seconds:
	signat	_get_menu_timeout_seconds,89
	global	_encoder_init

;; *************** function _encoder_init *****************
;; Defined at:
;;		line 169 in file "src\encoder.c"
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
	line	169
global __ptext49
__ptext49:
psect	text49
	file	"src\encoder.c"
	line	169
	
_encoder_init:; BSR set to: 4

;incstack = 0
	callstack 28
	line	172
	
l7404:
	movlw	low(0C4h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	173
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	176
	movlw	high(0)
	movlb	2	; () banked
	movwf	((_encoder_count+1))&0ffh	;volatile
	movlw	low(0)
	movwf	((_encoder_count))&0ffh	;volatile
	line	177
	movlw	low(0)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	178
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	179
	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	182
	
l7406:; BSR set to: 2

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	183
	
l7408:; BSR set to: 2

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	184
	
l7410:; BSR set to: 2

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	187
	
l7412:; BSR set to: 2

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u8531
	goto	u8530
u8531:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u8538
u8530:
	clrf	(??_encoder_init+0+0)^00h,c
u8538:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u8541
	goto	u8540
u8541:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u8548
u8540:
	clrf	(??_encoder_init+1+0)^00h,c
u8548:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:_enc_state))^00h,c
	line	188
	
l329:
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
	
l7354:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	185
	
l7356:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	189
	
l7362:
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
	
l7364:
	incf	((c:eeprom_init@i))^00h,c
	
l7366:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u8471
	goto	u8470

u8471:
	goto	l7362
u8470:
	line	191
	
l7368:
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
	
l7370:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	195
	
l7372:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u8480
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u8481
	goto	u8480

u8481:
	goto	l7378
u8480:
	line	198
	
l7374:
	call	_load_factory_defaults	;wreg free
	line	199
	
l7376:
	call	_save_current_config	;wreg free
	line	203
	
l7378:
	call	_sync_menu_variables	;wreg free
	line	207
	
l7380:
	movlb	4	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	mullw	02h
	movff	prodl,(c:_menu_timeout_seconds)
	movff	prodh,(c:_menu_timeout_seconds+1)
	line	210
	
l7382:; BSR set to: 4

		movf	((c:_menu_timeout_seconds+1))^00h,c,w
	bnz	u8490
	movlw	10
	subwf	 ((c:_menu_timeout_seconds))^00h,c,w
	btfss	status,0
	goto	u8491
	goto	u8490

u8491:
	goto	l7386
u8490:
	
l7384:; BSR set to: 4

		incf	((c:_menu_timeout_seconds))^00h,c,w
	movlw	1
	subwfb	((c:_menu_timeout_seconds+1))^00h,c,w
	btfss	status,0
	goto	u8501
	goto	u8500

u8501:
	goto	l1297
u8500:
	line	212
	
l7386:; BSR set to: 4

	movlw	high(01Eh)
	movwf	((c:_menu_timeout_seconds+1))^00h,c
	movlw	low(01Eh)
	movwf	((c:_menu_timeout_seconds))^00h,c
	line	214
	
l1297:; BSR set to: 4

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
	
l7298:
	movff	_input_config,(c:_enable_edit_flag)
	line	257
	movff	0+(_input_config+01h),(c:_sensor_edit_flag)
	line	258
	
l1315:
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
	
l6780:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	223
	
l6786:
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
	
l6788:
	incf	((c:save_current_config@i))^00h,c
	
l6790:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u7921
	goto	u7920

u7921:
	goto	l6786
u7920:
	line	227
	
l6792:
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
	
l6794:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	231
	
l6796:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	232
	
l1302:
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
	
l6272:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	158
	
l6274:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	159
	
l1276:
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
	
l6276:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	164
	
l6278:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l6284
	line	166
	
l6280:
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
	
l6282:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l6284:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u7071
	goto	u7070

u7071:
	goto	l6280
u7070:
	line	168
	
l1282:
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
	
l5552:
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
	
l5554:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	139
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	140
	
l5556:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	143
	
l1267:
	line	142
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u5731
	goto	u5730
u5731:
	goto	l1267
u5730:
	
l1269:
	line	144
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	145
	
l1270:
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
	
l6228:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	98
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	100
	
l6234:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	101
	
l6236:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	103
	
l6242:
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
	
l6244:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l6246:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u7040
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u7041
	goto	u7040

u7041:
	goto	l6242
u7040:
	line	98
	
l6248:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l6250:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u7051
	goto	u7050

u7051:
	goto	l6234
u7050:
	line	108
	
l6252:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	109
	
l6254:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1644+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1644))^00h,c
	line	111
	
l6260:
	movf	((c:calculate_config_checksum@j_1644))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j_1644+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	109
	
l6262:
	infsnz	((c:calculate_config_checksum@j_1644))^00h,c
	incf	((c:calculate_config_checksum@j_1644+1))^00h,c
	
l6264:
		movf	((c:calculate_config_checksum@j_1644+1))^00h,c,w
	bnz	u7060
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1644))^00h,c,w
	btfss	status,0
	goto	u7061
	goto	u7060

u7061:
	goto	l6260
u7060:
	
l1260:
	line	114
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	115
	
l1261:
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
	
l7296:
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
	
l1308:
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
;;		 -> clock_menu(20), system_config(128), input_menu(75), input_config(384), 
;;  s1              2   16[COMRAM] PTR const void 
;;		 -> system_defaults(128), factory_defaults(384), clock_menu_template(20), flow_analog_template(55), 
;;		 -> flow_digital_template(40), temp_menu_template(45), pressure_menu_template(70), 
;;  n               2   18[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  s               2   22[COMRAM] PTR const unsigned char 
;;		 -> system_defaults(128), factory_defaults(384), clock_menu_template(20), flow_analog_template(55), 
;;		 -> flow_digital_template(40), temp_menu_template(45), pressure_menu_template(70), 
;;  d               2   20[COMRAM] PTR unsigned char 
;;		 -> clock_menu(20), system_config(128), input_menu(75), input_config(384), 
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
	
l6194:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l6204
	line	37
	
l6196:
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
	
l6198:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l6200:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l6202:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l6204:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u6991
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u6991
	goto	u6990

u6991:
	goto	l6196
u6990:
	line	41
	
l2074:
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
	
l7280:
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
	
l7282:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	153
	
l1273:
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
	
l7286:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	173
	
l7288:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l7294
	line	175
	
l7290:
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
	
l7292:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l7294:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u8451
	goto	u8450

u8451:
	goto	l7290
u8450:
	line	177
	
l1288:
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
	
l6266:
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
	
l6268:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	126
	
l1264:
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
	callstack 23
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
	
i2l8676:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u1098_41
	goto	i2u1098_40
i2u1098_41:
	goto	i2l326
i2u1098_40:
	line	43
	
i2l8678:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	44
	
i2l8680:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	47
	
i2l8682:
	incf	((c:_ms_counter))^00h,c	;volatile
	line	48
	
i2l8684:
		movlw	02h-1
	cpfsgt	((c:_ms_counter))^00h,c	;volatile
	goto	i2u1099_41
	goto	i2u1099_40

i2u1099_41:
	goto	i2l8700
i2u1099_40:
	line	50
	
i2l8686:
	movlw	low(0)
	movwf	((c:_ms_counter))^00h,c	;volatile
	line	51
	
i2l8688:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1100_41
	goto	i2u1100_40

i2u1100_41:
	goto	i2l8700
i2u1100_40:
	line	53
	
i2l8690:
	decf	((c:_menu_timeout_timer))^00h,c	;volatile
	btfss	status,0
	decf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	line	56
	
i2l8692:
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
	goto	i2u1101_41
	goto	i2u1101_40

i2u1101_41:
	goto	i2l8696
i2u1101_40:
	line	59
	
i2l8694:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_timeout_debug_flag))&0ffh	;volatile
	line	62
	
i2l8696:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1102_41
	goto	i2u1102_40

i2u1102_41:
	goto	i2l8700
i2u1102_40:
	line	64
	
i2l8698:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	70
	
i2l8700:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u1103_41
	goto	i2u1103_40
i2u1103_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u1103_48
i2u1103_40:
	clrf	(??_isr+0+0)^00h,c
i2u1103_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u1104_41
	goto	i2u1104_40
i2u1104_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u1104_48
i2u1104_40:
	clrf	(??_isr+1+0)^00h,c
i2u1104_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	71
	
i2l8702:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	74
	
i2l8704:
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
	
i2l8706:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u1105_41
	goto	i2u1105_40
i2u1105_41:
	goto	i2l8732
i2u1105_40:
	line	79
	
i2l8708:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u1106_41
	goto	i2u1106_40

i2u1106_41:
	goto	i2l8720
i2u1106_40:
	line	81
	
i2l8710:
	movlb	2	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	82
	
i2l8712:; BSR set to: 2

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	85
	
i2l8714:; BSR set to: 2

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1107_41
	goto	i2u1107_40

i2u1107_41:
	goto	i2l8732
i2u1107_40:
	line	87
	
i2l8716:; BSR set to: 2

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	88
	
i2l8718:; BSR set to: 2

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l8732
	line	91
	
i2l8720:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u1108_41
	goto	i2u1108_40

i2u1108_41:
	goto	i2l8732
i2u1108_40:
	line	93
	
i2l8722:
	movlb	2	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	line	94
	
i2l8724:; BSR set to: 2

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	97
	
i2l8726:; BSR set to: 2

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1109_41
	goto	i2u1109_40

i2u1109_41:
	goto	i2l311
i2u1109_40:
	goto	i2l8716
	line	103
	
i2l311:; BSR set to: 2

	line	105
	
i2l8732:
	movff	(c:isr@new_state),(c:_enc_state)
	line	108
	
i2l8734:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	109
	
i2l8736:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u1110_41
	goto	i2u1110_40

i2u1110_41:
	goto	i2l8764
i2u1110_40:
	line	111
	
i2l8738:
	incf	((c:_btn_debounce))^00h,c
	line	112
	
i2l8740:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u1111_41
	goto	i2u1111_40

i2u1111_41:
	goto	i2l326
i2u1111_40:
	line	114
	
i2l8742:
	movff	(c:isr@btn),(c:_last_btn)
	line	115
	
i2l8744:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	117
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1112_41
	goto	i2u1112_40
i2u1112_41:
	goto	i2l8754
i2u1112_40:
	line	120
	
i2l8746:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	121
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	124
	
i2l8748:; BSR set to: 2

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1113_41
	goto	i2u1113_40

i2u1113_41:
	goto	i2l323
i2u1113_40:
	line	126
	
i2l8750:; BSR set to: 2

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	127
	
i2l8752:; BSR set to: 2

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l326
	line	133
	
i2l8754:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1114_41
	goto	i2u1114_40

i2u1114_41:
	goto	i2l8758
i2u1114_40:
	line	135
	
i2l8756:
	movlw	low(02h)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	136
	goto	i2l320
	line	137
	
i2l8758:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u1115_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u1115_41
	goto	i2u1115_40

i2u1115_41:
	goto	i2l8762
i2u1115_40:
	line	139
	
i2l8760:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	140
	goto	i2l320
	line	143
	
i2l8762:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	144
	
i2l320:; BSR set to: 2

	line	146
	movlw	low(01h)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	147
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	goto	i2l326
	line	153
	
i2l8764:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	155
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u1116_41
	goto	i2u1116_40
i2u1116_41:
	goto	i2l326
i2u1116_40:
	
i2l8766:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1117_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u1117_41
	goto	i2u1117_40

i2u1117_41:
	goto	i2l326
i2u1117_40:
	line	157
	
i2l8768:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	160
	
i2l8770:
		movlw	8
	xorwf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u1118_41
	movlw	7
	xorwf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u1118_41
	goto	i2u1118_40

i2u1118_41:
	goto	i2l323
i2u1118_40:
	line	162
	
i2l8772:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	goto	i2l326
	line	165
	
i2l323:
	line	167
	
i2l326:
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
	callstack 23
	line	12
	
i2l8360:
	movf	((c:i2___lwmod@divisor))^00h,c,w
iorwf	((c:i2___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	i2u1053_41
	goto	i2u1053_40

i2u1053_41:
	goto	i2l1893
i2u1053_40:
	line	13
	
i2l8362:
	movlw	low(01h)
	movwf	((c:i2___lwmod@counter))^00h,c
	line	14
	goto	i2l8366
	line	15
	
i2l8364:
	bcf	status,0
	rlcf	((c:i2___lwmod@divisor))^00h,c
	rlcf	((c:i2___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:i2___lwmod@counter))^00h,c
	line	14
	
i2l8366:
	
	btfss	((c:i2___lwmod@divisor+1))^00h,c,(15)&7
	goto	i2u1054_41
	goto	i2u1054_40
i2u1054_41:
	goto	i2l8364
i2u1054_40:
	line	19
	
i2l8368:
		movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c,w
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	i2u1055_41
	goto	i2u1055_40

i2u1055_41:
	goto	i2l8372
i2u1055_40:
	line	20
	
i2l8370:
	movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c

	line	21
	
i2l8372:
	bcf	status,0
	rrcf	((c:i2___lwmod@divisor+1))^00h,c
	rrcf	((c:i2___lwmod@divisor))^00h,c
	line	22
	
i2l8374:
	decfsz	((c:i2___lwmod@counter))^00h,c
	
	goto	i2l8368
	line	23
	
i2l1893:
	line	24
	movff	(c:i2___lwmod@dividend),(c:?i2___lwmod)
	movff	(c:i2___lwmod@dividend+1),(c:?i2___lwmod+1)
	line	25
	
i2l1900:
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
