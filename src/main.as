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
	FNCALL	_main,_sprintf
	FNCALL	_main,_system_init
	FNCALL	_main,_uart_init
	FNCALL	_main,_uart_println
	FNCALL	_menu_update_numeric_value,_is_numeric_field
	FNCALL	_menu_update_numeric_value,_lcd_print
	FNCALL	_menu_update_numeric_value,_lcd_set_cursor
	FNCALL	_menu_update_numeric_value,_sprintf
	FNCALL	_menu_update_numeric_value,_uart_println
	FNCALL	_menu_update_edit_value,_get_item_options
	FNCALL	_menu_update_edit_value,_lcd_print
	FNCALL	_menu_update_edit_value,_lcd_set_cursor
	FNCALL	_menu_update_edit_value,_strcpy
	FNCALL	_menu_update_edit_value,_strlen
	FNCALL	_menu_handle_encoder,_get_item_options
	FNCALL	_menu_handle_encoder,_sprintf
	FNCALL	_menu_handle_encoder,_uart_println
	FNCALL	_menu_handle_button,___wmul
	FNCALL	_menu_handle_button,_beep
	FNCALL	_menu_handle_button,_get_current_numeric_value
	FNCALL	_menu_handle_button,_get_item_options
	FNCALL	_menu_handle_button,_init_numeric_editor
	FNCALL	_menu_handle_button,_init_time_editor
	FNCALL	_menu_handle_button,_is_numeric_field
	FNCALL	_menu_handle_button,_is_time_field
	FNCALL	_menu_handle_button,_menu_draw_input
	FNCALL	_menu_handle_button,_menu_draw_options
	FNCALL	_menu_handle_button,_menu_draw_setup
	FNCALL	_menu_handle_button,_menu_update_time_value
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
	FNCALL	_menu_update_time_value,___lbdiv
	FNCALL	_menu_update_time_value,___lbmod
	FNCALL	_menu_update_time_value,_is_time_field
	FNCALL	_menu_update_time_value,_lcd_print
	FNCALL	_menu_update_time_value,_lcd_set_cursor
	FNCALL	_menu_update_time_value,_sprintf
	FNCALL	_menu_update_time_value,_uart_println
	FNCALL	_menu_draw_setup,_lcd_clear_line
	FNCALL	_menu_draw_setup,_lcd_print
	FNCALL	_menu_draw_setup,_lcd_print_at
	FNCALL	_menu_draw_setup,_strlen
	FNCALL	_menu_draw_options,_lcd_clear_line
	FNCALL	_menu_draw_options,_lcd_print
	FNCALL	_menu_draw_options,_lcd_print_at
	FNCALL	_menu_draw_input,_get_item_options
	FNCALL	_menu_draw_input,_is_numeric_field
	FNCALL	_menu_draw_input,_lcd_clear_line
	FNCALL	_menu_draw_input,_lcd_print
	FNCALL	_menu_draw_input,_lcd_print_at
	FNCALL	_menu_draw_input,_lcd_set_cursor
	FNCALL	_menu_draw_input,_sprintf
	FNCALL	_menu_draw_input,_strcmp
	FNCALL	_menu_draw_input,_strcpy
	FNCALL	_menu_draw_input,_strlen
	FNCALL	_menu_draw_input,_uart_println
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
	FNCALL	_lcd_clear,_lcd_cmd
	FNCALL	_lcd_cmd,_lcd_write_nibble
	FNCALL	_handle_time_rotation,_sprintf
	FNCALL	_handle_time_rotation,_uart_println
	FNCALL	_handle_numeric_rotation,_sprintf
	FNCALL	_handle_numeric_rotation,_uart_println
	FNCALL	_uart_println,_uart_print
	FNCALL	_uart_println,_uart_write
	FNCALL	_uart_print,_uart_write
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
	FNROOT	_main
	FNCALL	_isr,i2___lwmod
	FNCALL	intlevel2,_isr
	global	intlevel2
	FNROOT	intlevel2
	global	_options_menu
	global	menu_draw_setup@F2635
	global	_menu_timeout_seconds
	global	_last_btn
	global	_value_scale4
	global	_value_back
	global	_enable_edit_flag
	global	_menu_timeout_flag
	global	_value_sensor
	global	_value_display
	global	_value_rlyhigh
	global	_value_highbp
	global	_value_scale20
	global	_value_enable
	global	menu_draw_setup@F2633
	global	_value_high_tbp
	global	_value_high_temp
	global	_value_low_pressure
	global	_value_hi_pressure
	global	_value_rlyslp
	global	_value_rlyplp
	global	_value_slpbp
	global	_value_plpbp
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"src\menu.c"
	line	38

;initializer for _options_menu
		db	low(STR_33)
	db	high(STR_33)

		db	low(STR_34)
	db	high(STR_34)

		db	low(STR_35)
	db	high(STR_35)

		db	low(STR_36)
	db	high(STR_36)

		db	low(STR_37)
	db	high(STR_37)

	line	1276

;initializer for menu_draw_setup@F2635
		db	low(STR_163)
	db	high(STR_163)

		db	low(STR_164)
	db	high(STR_164)

		db	low(STR_165)
	db	high(STR_165)

	file	"src\eeprom.c"
	line	11

;initializer for _menu_timeout_seconds
	dw	(01Eh)&0ffffh
	file	"src\encoder.c"
	line	28

;initializer for _last_btn
	db	low(01h)
	file	"src\menu.c"
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
	line	57

;initializer for _value_back
	db	low(042h)
	db	low(061h)
	db	low(063h)
	db	low(06Bh)
	db	low(0)
psect	idataBANK0,class=CODE,space=0,delta=1,noexec
global __pidataBANK0
__pidataBANK0:
	line	17

;initializer for _enable_edit_flag
	db	low(01h)
psect	idataBANK1,class=CODE,space=0,delta=1,noexec
global __pidataBANK1
__pidataBANK1:
	file	"src\encoder.c"
	line	16

;initializer for _menu_timeout_flag
	db	low(01h)
psect	idataBANK2,class=CODE,space=0,delta=1,noexec
global __pidataBANK2
__pidataBANK2:
	file	"src\menu.c"
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
psect	idataBANK3,class=CODE,space=0,delta=1,noexec
global __pidataBANK3
__pidataBANK3:
	line	1268

;initializer for menu_draw_setup@F2633
		db	low(STR_158)
	db	high(STR_158)

		db	low(STR_159)
	db	high(STR_159)

		db	low(STR_160)
	db	high(STR_160)

		db	low(STR_161)
	db	high(STR_161)

		db	low(STR_162)
	db	high(STR_162)

	line	68

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
	line	67

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
	line	66

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
	line	65

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
	line	64

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
	line	63

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
	line	69

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
	line	62

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
	line	61

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
	line	60

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
psect	mediumconst,class=MEDIUMCONST,space=0,reloc=2,noexec
global __pmediumconst
__pmediumconst:
	db	0
	file	"src\menu.c"
	line	116
	global	_flow_analog_template
_flow_analog_template:
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

	db	low(0)
	global __end_of_flow_analog_template
__end_of_flow_analog_template:
psect	mediumconst
	file	"src\menu.c"
	line	105
	global	_flow_digital_template
_flow_digital_template:
		db	low(STR_61)
	db	high(STR_61)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_62)
	db	high(STR_62)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_63)
	db	high(STR_63)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_64)
	db	high(STR_64)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_65)
	db	high(STR_65)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_66)
	db	high(STR_66)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_67)
	db	high(STR_67)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_68)
	db	high(STR_68)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_flow_digital_template
__end_of_flow_digital_template:
	global	_enc_table
psect	mediumconst
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
	global	_pressure_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	76
_pressure_menu_template:
		db	low(STR_38)
	db	high(STR_38)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_39)
	db	high(STR_39)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_40)
	db	high(STR_40)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_41)
	db	high(STR_41)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_42)
	db	high(STR_42)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_43)
	db	high(STR_43)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_44)
	db	high(STR_44)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_45)
	db	high(STR_45)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_46)
	db	high(STR_46)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_47)
	db	high(STR_47)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_48)
	db	high(STR_48)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_49)
	db	high(STR_49)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_50)
	db	high(STR_50)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_51)
	db	high(STR_51)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_pressure_menu_template
__end_of_pressure_menu_template:
	global	_temp_menu_template
psect	mediumconst
	file	"src\menu.c"
	line	93
_temp_menu_template:
		db	low(STR_52)
	db	high(STR_52)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_53)
	db	high(STR_53)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_54)
	db	high(STR_54)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_55)
	db	high(STR_55)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_56)
	db	high(STR_56)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_57)
	db	high(STR_57)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_58)
	db	high(STR_58)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_59)
	db	high(STR_59)

		db	low(0)
	db	high(0)

	db	low(01h)
		db	low(STR_60)
	db	high(STR_60)

		db	low(0)
	db	high(0)

	db	low(0)
	global __end_of_temp_menu_template
__end_of_temp_menu_template:
	global	_menu_item_options
psect	mediumconst
	file	"src\menu.c"
	line	29
_menu_item_options:
	db	low(0)
	db	low(02h)
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

	db	low(01h)
	db	low(03h)
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

	global __end_of_menu_item_options
__end_of_menu_item_options:
	global	_enc_table
	global	_dpowers
	global	_factory_defaults
	global	_system_defaults
	global	_pressure_menu_template
	global	_temp_menu_template
	global	_menu_item_options
	global	_button_hold_ms
	global	_menu_timeout_timer
	global	_menu_timeout_reload
	global	_btn_debounce
	global	_enc_accumulator
	global	_enc_state
	global	_ms_counter
	global	_button_pressed
	global	_input_config
	global	_menu
	global	_sensor_edit_flag
	global	main@blink_timer
	global	main@encoder_activity_timer
	global	_encoder_count
	global	main@last_menu_state
	global	_current_menu
	global	_long_press_beep_flag
	global	_timeout_debug_flag
	global	_current_input
	global	_button_event
	global	_save_pending
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
	
STR_84:
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
	
STR_82:
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
	
STR_138:
	db	83	;'S'
	db	107	;'k'
	db	105	;'i'
	db	112	;'p'
	db	112	;'p'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	110	;'n'
	db	117	;'u'
	db	109	;'m'
	db	101	;'e'
	db	114	;'r'
	db	105	;'i'
	db	99	;'c'
	db	32
	db	100	;'d'
	db	114	;'r'
	db	97	;'a'
	db	119	;'w'
	db	32
	db	105	;'i'
	db	110	;'n'
	db	32
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	95	;'_'
	db	100	;'d'
	db	114	;'r'
	db	97	;'a'
	db	119	;'w'
	db	95	;'_'
	db	105	;'i'
	db	110	;'n'
	db	112	;'p'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_156:
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
	
STR_80:
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
	
STR_125:
	db	109	;'m'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	95	;'_'
	db	117	;'u'
	db	112	;'p'
	db	100	;'d'
	db	97	;'a'
	db	116	;'t'
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
	db	118	;'v'
	db	97	;'a'
	db	108	;'l'
	db	117	;'u'
	db	101	;'e'
	db	32
	db	99	;'c'
	db	97	;'a'
	db	108	;'l'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_19:
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
	
STR_123:
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
	
STR_81:
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
	
STR_124:
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
	
STR_86:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	58	;':'
	db	32
	db	40
	db	32
	db	32
	db	58	;':'
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	41
	db	32
	db	91	;'['
	db	88	;'X'
	db	88	;'X'
	db	32
	db	98	;'b'
	db	108	;'l'
	db	97	;'a'
	db	110	;'n'
	db	107	;'k'
	db	101	;'e'
	db	100	;'d'
	db	93	;']'
	db	0
	
STR_87:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	58	;':'
	db	32
	db	40
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	58	;':'
	db	32
	db	32
	db	41
	db	32
	db	91	;'['
	db	89	;'Y'
	db	89	;'Y'
	db	32
	db	98	;'b'
	db	108	;'l'
	db	97	;'a'
	db	110	;'n'
	db	107	;'k'
	db	101	;'e'
	db	100	;'d'
	db	93	;']'
	db	0
	
STR_148:
	db	65	;'A'
	db	116	;'t'
	db	32
	db	108	;'l'
	db	105	;'i'
	db	109	;'m'
	db	105	;'i'
	db	116	;'t'
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
	db	116	;'t'
	db	97	;'a'
	db	108	;'l'
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
	
STR_85:
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
	
STR_151:
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
	
STR_121:
	db	77	;'M'
	db	101	;'e'
	db	110	;'n'
	db	117	;'u'
	db	32
	db	105	;'i'
	db	116	;'t'
	db	101	;'e'
	db	109	;'m'
	db	115	;'s'
	db	32
	db	97	;'a'
	db	102	;'f'
	db	116	;'t'
	db	101	;'e'
	db	114	;'r'
	db	32
	db	114	;'r'
	db	101	;'e'
	db	98	;'b'
	db	117	;'u'
	db	105	;'i'
	db	108	;'l'
	db	100	;'d'
	db	58	;':'
	db	0
	
STR_149:
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
	
STR_88:
	db	76	;'L'
	db	67	;'C'
	db	68	;'D'
	db	58	;':'
	db	32
	db	40
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	58	;':'
	db	37
	db	48	;'0'
	db	50	;'2'
	db	100	;'d'
	db	41
	db	32
	db	91	;'['
	db	115	;'s'
	db	111	;'o'
	db	108	;'l'
	db	105	;'i'
	db	100	;'d'
	db	93	;']'
	db	0
	
STR_83:
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
	
STR_126:
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
	
STR_120:
	db	84	;'T'
	db	111	;'o'
	db	116	;'t'
	db	97	;'a'
	db	108	;'l'
	db	32
	db	105	;'i'
	db	116	;'t'
	db	101	;'e'
	db	109	;'m'
	db	115	;'s'
	db	32
	db	115	;'s'
	db	101	;'e'
	db	116	;'t'
	db	32
	db	116	;'t'
	db	111	;'o'
	db	58	;':'
	db	32
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
	
STR_92:
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
	
STR_134:
	db	68	;'D'
	db	114	;'r'
	db	97	;'a'
	db	119	;'w'
	db	105	;'i'
	db	110	;'n'
	db	103	;'g'
	db	32
	db	105	;'i'
	db	100	;'d'
	db	120	;'x'
	db	32
	db	37
	db	100	;'d'
	db	58	;':'
	db	32
	db	37
	db	115	;'s'
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
	
STR_44:
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
	
STR_35:
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
	
STR_76:
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
	
STR_42:
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
	
STR_122:
	db	73	;'I'
	db	116	;'t'
	db	101	;'e'
	db	109	;'m'
	db	32
	db	37
	db	100	;'d'
	db	58	;':'
	db	32
	db	37
	db	115	;'s'
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
	
STR_41:
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
	
STR_65:
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
	
STR_34:
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
	
STR_40:
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
	
STR_100:
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
	
STR_56:
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
	
STR_33:
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
	
STR_43:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_57:
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	32
	db	84	;'T'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_133:
	db	73	;'I'
	db	78	;'N'
	db	80	;'P'
	db	85	;'U'
	db	84	;'T'
	db	32
	db	37
	db	100	;'d'
	db	0
	
STR_23:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_106:
	db	78	;'N'
	db	111	;'o'
	db	116	;'t'
	db	32
	db	85	;'U'
	db	115	;'s'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_47:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	72	;'H'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	0
	
STR_75:
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_158:
	db	73	;'I'
	db	110	;'n'
	db	112	;'p'
	db	117	;'u'
	db	116	;'t'
	db	32
	db	49	;'1'
	db	0
	
STR_159:
	db	73	;'I'
	db	110	;'n'
	db	112	;'p'
	db	117	;'u'
	db	116	;'t'
	db	32
	db	50	;'2'
	db	0
	
STR_160:
	db	73	;'I'
	db	110	;'n'
	db	112	;'p'
	db	117	;'u'
	db	116	;'t'
	db	32
	db	51	;'3'
	db	0
	
STR_49:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	0
	
STR_130:
	db	79	;'O'
	db	80	;'P'
	db	84	;'T'
	db	73	;'I'
	db	79	;'O'
	db	78	;'N'
	db	83	;'S'
	db	0
	
STR_24:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	100	;'d'
	db	0
	
STR_48:
	db	82	;'R'
	db	108	;'l'
	db	121	;'y'
	db	32
	db	76	;'L'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_64:
	db	78	;'N'
	db	111	;'o'
	db	32
	db	70	;'F'
	db	108	;'l'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_50:
	db	68	;'D'
	db	105	;'i'
	db	115	;'s'
	db	112	;'p'
	db	108	;'l'
	db	97	;'a'
	db	121	;'y'
	db	0
	
STR_21:
	db	84	;'T'
	db	105	;'i'
	db	109	;'m'
	db	101	;'e'
	db	111	;'o'
	db	117	;'u'
	db	116	;'t'
	db	0
	
STR_168:
	db	40
	db	110	;'n'
	db	117	;'u'
	db	108	;'l'
	db	108	;'l'
	db	41
	db	0
	
STR_38:
	db	69	;'E'
	db	110	;'n'
	db	97	;'a'
	db	98	;'b'
	db	108	;'l'
	db	101	;'e'
	db	0
	
STR_39:
	db	83	;'S'
	db	101	;'e'
	db	110	;'n'
	db	115	;'s'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_45:
	db	80	;'P'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_46:
	db	83	;'S'
	db	76	;'L'
	db	80	;'P'
	db	66	;'B'
	db	80	;'P'
	db	0
	
STR_157:
	db	83	;'S'
	db	69	;'E'
	db	84	;'T'
	db	85	;'U'
	db	80	;'P'
	db	0
	
STR_97:
	db	37
	db	43
	db	48	;'0'
	db	52	;'4'
	db	100	;'d'
	db	0
	
STR_105:
	db	80	;'P'
	db	117	;'u'
	db	108	;'l'
	db	115	;'s'
	db	101	;'e'
	db	0
	
STR_104:
	db	76	;'L'
	db	97	;'a'
	db	116	;'t'
	db	99	;'c'
	db	104	;'h'
	db	0
	
STR_161:
	db	67	;'C'
	db	108	;'l'
	db	111	;'o'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_135:
	db	69	;'E'
	db	114	;'r'
	db	114	;'r'
	db	111	;'o'
	db	114	;'r'
	db	0
	
STR_72:
	db	85	;'U'
	db	110	;'n'
	db	105	;'i'
	db	116	;'t'
	db	115	;'s'
	db	0
	
STR_36:
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
	
STR_99:
	db	37
	db	48	;'0'
	db	51	;'3'
	db	100	;'d'
	db	0
	
STR_114:
	db	72	;'H'
	db	105	;'i'
	db	100	;'d'
	db	101	;'e'
	db	0
	
STR_63:
	db	84	;'T'
	db	121	;'y'
	db	112	;'p'
	db	101	;'e'
	db	0
	
STR_51:
	db	66	;'B'
	db	97	;'a'
	db	99	;'c'
	db	107	;'k'
	db	0
	
STR_37:
	db	69	;'E'
	db	120	;'x'
	db	105	;'i'
	db	116	;'t'
	db	0
	
STR_113:
	db	83	;'S'
	db	104	;'h'
	db	111	;'o'
	db	119	;'w'
	db	0
	
STR_90:
	db	40
	db	0
	
STR_131:
	db	91	;'['
	db	0
STR_59	equ	STR_50+0
STR_67	equ	STR_50+0
STR_78	equ	STR_50+0
STR_30	equ	STR_64+3
STR_165	equ	STR_64+3
STR_66	equ	STR_48+0
STR_77	equ	STR_48+0
STR_93	equ	STR_122+9
STR_53	equ	STR_39+0
STR_62	equ	STR_39+0
STR_70	equ	STR_39+0
STR_143	equ	STR_135+0
STR_29	equ	STR_56+5
STR_115	equ	STR_56+5
STR_164	equ	STR_56+5
STR_60	equ	STR_51+0
STR_68	equ	STR_51+0
STR_79	equ	STR_51+0
STR_162	equ	STR_51+0
STR_58	equ	STR_47+0
STR_107	equ	STR_104+0
STR_110	equ	STR_104+0
STR_108	equ	STR_105+0
STR_111	equ	STR_105+0
STR_28	equ	STR_42+3
STR_96	equ	STR_42+3
STR_163	equ	STR_42+3
STR_71	equ	STR_63+0
STR_52	equ	STR_38+0
STR_61	equ	STR_38+0
STR_69	equ	STR_38+0
STR_109	equ	STR_106+0
STR_112	equ	STR_106+0
STR_95	equ	STR_23+0
STR_94	equ	STR_24+0
STR_98	equ	STR_97+0
STR_116	equ	STR_97+0
STR_117	equ	STR_97+0
STR_152	equ	STR_97+0
STR_153	equ	STR_97+0
STR_101	equ	STR_99+0
STR_154	equ	STR_99+0
STR_155	equ	STR_99+0
STR_102	equ	STR_100+0
STR_103	equ	STR_100+0
STR_119	equ	STR_100+0
STR_150	equ	STR_100+0
STR_118	equ	STR_11+20
STR_132	equ	STR_86+26
STR_141	equ	STR_86+26
STR_167	equ	STR_86+26
STR_139	equ	STR_131+0
STR_166	equ	STR_131+0
STR_20	equ	STR_16+0
STR_54	equ	STR_40+0
STR_73	equ	STR_40+0
STR_55	equ	STR_41+0
STR_74	equ	STR_41+0
STR_91	equ	STR_168+5
STR_129	equ	STR_168+5
STR_142	equ	STR_168+5
STR_147	equ	STR_168+5
STR_128	equ	STR_90+0
STR_140	equ	STR_90+0
STR_146	equ	STR_90+0
STR_145	equ	STR_92+10
STR_89	equ	STR_92+13
STR_127	equ	STR_92+14
STR_136	equ	STR_92+15
STR_144	equ	STR_92+15
STR_25	equ	STR_92+20
STR_26	equ	STR_92+20
STR_27	equ	STR_92+20
STR_31	equ	STR_92+20
STR_32	equ	STR_92+20
STR_137	equ	STR_92+20
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
menu_update_numeric_value@F2559:
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
psect	dataCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pdataCOMRAM
__pdataCOMRAM:
	file	"src\menu.c"
	line	38
	global	_options_menu
_options_menu:
       ds      10
psect	dataCOMRAM
	file	"src\menu.c"
	line	1276
menu_draw_setup@F2635:
       ds      6
psect	dataCOMRAM
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
	line	48
_value_scale4:
       ds      10
psect	dataCOMRAM
	file	"src\menu.c"
	line	57
_value_back:
       ds      5
psect	bssBANK0,class=BANK0,space=1,noexec,lowdata
global __pbssBANK0
__pbssBANK0:
	global	_menu
_menu:
       ds      22
	global	_sensor_edit_flag
_sensor_edit_flag:
       ds      1
psect	dataBANK0,class=BANK0,space=1,noexec,lowdata
global __pdataBANK0
__pdataBANK0:
	file	"src\menu.c"
	line	17
	global	_enable_edit_flag
_enable_edit_flag:
       ds      1
psect	bssBANK1,class=BANK1,space=1,noexec,lowdata
global __pbssBANK1
__pbssBANK1:
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
	global	_long_press_beep_flag
_long_press_beep_flag:
       ds      1
	global	_timeout_debug_flag
_timeout_debug_flag:
       ds      1
	global	_current_input
_current_input:
       ds      1
	global	_button_event
_button_event:
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
	global	_save_pending
_save_pending:
       ds      1
	global	_input_menu
_input_menu:
       ds      75
psect	dataBANK2,class=BANK2,space=1,noexec,lowdata
global __pdataBANK2
__pdataBANK2:
	file	"src\menu.c"
	line	47
_value_sensor:
       ds      12
psect	dataBANK2
	file	"src\menu.c"
	line	56
_value_display:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	53
_value_rlyhigh:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	50
_value_highbp:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	49
_value_scale20:
       ds      10
psect	dataBANK2
	file	"src\menu.c"
	line	46
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
	line	1268
menu_draw_setup@F2633:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	68
_value_low_flow_bp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	67
_value_no_flow_bp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	66
_value_low_flow:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	65
_value_no_flow:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	64
_value_flow_units:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	63
_value_flow_type:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	69
_value_high_tbp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	62
_value_high_temp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	61
_value_low_pressure:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	60
_value_hi_pressure:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	55
_value_rlyslp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	54
_value_rlyplp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	52
_value_slpbp:
       ds      10
psect	dataBANK3
	file	"src\menu.c"
	line	51
_value_plpbp:
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
; Initialize objects allocated to BANK3 (150 bytes)
	global __pidataBANK3
	; load TBLPTR registers with __pidataBANK3
	movlw	low (__pidataBANK3)
	movwf	tblptrl
	movlw	high(__pidataBANK3)
	movwf	tblptrh
	movlw	low highword(__pidataBANK3)
	movwf	tblptru
	lfsr	0,__pdataBANK3
	lfsr	1,150
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK2 (62 bytes)
	global __pidataBANK2
	; load TBLPTR registers with __pidataBANK2
	movlw	low (__pidataBANK2)
	movwf	tblptrl
	movlw	high(__pidataBANK2)
	movwf	tblptrh
	movlw	low highword(__pidataBANK2)
	movwf	tblptru
	lfsr	0,__pdataBANK2
	lfsr	1,62
	copy_data1:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data1
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
; Initialize objects allocated to BANK0 (1 bytes)
	global __pidataBANK0
	; load TBLPTR registers with __pidataBANK0
	movlw	low (__pidataBANK0)
	movwf	tblptrl
	movlw	high(__pidataBANK0)
	movwf	tblptrh
	movlw	low highword(__pidataBANK0)
	movwf	tblptru
	tblrd*+ ;fetch initializer
	movff	tablat, __pdataBANK0+0		
; Initialize objects allocated to COMRAM (34 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	lfsr	0,__pdataCOMRAM
	lfsr	1,34
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
; Clear objects allocated to BANK2 (76 bytes)
	global __pbssBANK2
lfsr	0,__pbssBANK2
movlw	76
clear_3:
clrf	postinc0,c
decf	wreg
bnz	clear_3
; Clear objects allocated to BANK1 (14 bytes)
	global __pbssBANK1
lfsr	0,__pbssBANK1
movlw	14
clear_4:
clrf	postinc0,c
decf	wreg
bnz	clear_4
; Clear objects allocated to BANK0 (23 bytes)
	global __pbssBANK0
lfsr	0,__pbssBANK0
movlw	23
clear_5:
clrf	postinc0,c
decf	wreg
bnz	clear_5
; Clear objects allocated to COMRAM (17 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	17
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
psect	cstackBANK2,class=BANK2,space=1,noexec,lowdata
global __pcstackBANK2
__pcstackBANK2:
	global	menu_handle_button@buf
menu_handle_button@buf:	; 50 bytes @ 0x0
	ds   50
	global	menu_handle_button@buf_1233
menu_handle_button@buf_1233:	; 50 bytes @ 0x32
	ds   50
	global	menu_handle_button@edit_flag
menu_handle_button@edit_flag:	; 1 bytes @ 0x64
	ds   1
	global	menu_handle_button@edit_flag_1240
menu_handle_button@edit_flag_1240:	; 1 bytes @ 0x65
	ds   1
	global	menu_handle_button@current_val
menu_handle_button@current_val:	; 2 bytes @ 0x66
	ds   2
	global	menu_handle_button@opts
menu_handle_button@opts:	; 2 bytes @ 0x68
	ds   2
	global	menu_handle_button@current_val_1232
menu_handle_button@current_val_1232:	; 2 bytes @ 0x6A
	ds   2
	global	menu_handle_button@opts_1236
menu_handle_button@opts_1236:	; 2 bytes @ 0x6C
	ds   2
	global	menu_handle_button@new_seconds
menu_handle_button@new_seconds:	; 2 bytes @ 0x6E
	ds   2
	global	menu_handle_button@i
menu_handle_button@i:	; 1 bytes @ 0x70
	ds   1
	global	menu_handle_button@press_type
menu_handle_button@press_type:	; 1 bytes @ 0x71
	ds   1
	global	menu_handle_button@new_value
menu_handle_button@new_value:	; 2 bytes @ 0x72
	ds   2
psect	cstackBANK1,class=BANK1,space=1,noexec,lowdata
global __pcstackBANK1
__pcstackBANK1:
	global	menu_update_time_value@debug_before
menu_update_time_value@debug_before:	; 50 bytes @ 0x0
	ds   50
	global	menu_update_time_value@debug_after
menu_update_time_value@debug_after:	; 50 bytes @ 0x32
	ds   50
	global	menu_update_time_value@debug
menu_update_time_value@debug:	; 50 bytes @ 0x64
	ds   50
	global	menu_update_time_value@item_idx
menu_update_time_value@item_idx:	; 1 bytes @ 0x96
	ds   1
	global	menu_update_time_value@value_buf
menu_update_time_value@value_buf:	; 6 bytes @ 0x97
	ds   6
	global	menu_update_time_value@screen_line
menu_update_time_value@screen_line:	; 1 bytes @ 0x9D
	ds   1
??_menu_handle_button:	; 1 bytes @ 0x9E
	ds   5
??_main:	; 1 bytes @ 0xA3
	ds   2
	global	main@buf
main@buf:	; 40 bytes @ 0xA5
	ds   40
	global	main@buf_586
main@buf_586:	; 30 bytes @ 0xCD
	ds   30
	global	main@last_button
main@last_button:	; 1 bytes @ 0xEB
	ds   1
	global	main@last_encoder
main@last_encoder:	; 2 bytes @ 0xEC
	ds   2
	global	main@current_event
main@current_event:	; 1 bytes @ 0xEE
	ds   1
	global	main@delta
main@delta:	; 2 bytes @ 0xEF
	ds   2
psect	cstackBANK0,class=BANK0,space=1,noexec,lowdata
global __pcstackBANK0
__pcstackBANK0:
??_menu_handle_encoder:	; 1 bytes @ 0x0
??_menu_draw_input:	; 1 bytes @ 0x0
	global	handle_time_rotation@buf
handle_time_rotation@buf:	; 50 bytes @ 0x0
	global	rebuild_input_menu@buf_1092
rebuild_input_menu@buf_1092:	; 50 bytes @ 0x0
	global	handle_numeric_rotation@buf
handle_numeric_rotation@buf:	; 50 bytes @ 0x0
	global	menu_update_numeric_value@debug
menu_update_numeric_value@debug:	; 50 bytes @ 0x0
	global	init_time_editor@buf
init_time_editor@buf:	; 60 bytes @ 0x0
	ds   5
	global	menu_draw_input@buf
menu_draw_input@buf:	; 50 bytes @ 0x5
	global	menu_handle_encoder@buf
menu_handle_encoder@buf:	; 50 bytes @ 0x5
	ds   45
	global	_handle_time_rotation$1006
_handle_time_rotation$1006:	; 2 bytes @ 0x32
	global	_handle_numeric_rotation$1107
_handle_numeric_rotation$1107:	; 2 bytes @ 0x32
	global	_menu_update_numeric_value$1117
_menu_update_numeric_value$1117:	; 2 bytes @ 0x32
	global	rebuild_input_menu@buf
rebuild_input_menu@buf:	; 30 bytes @ 0x32
	ds   2
	global	handle_time_rotation@direction
handle_time_rotation@direction:	; 1 bytes @ 0x34
	global	handle_numeric_rotation@max_tens
handle_numeric_rotation@max_tens:	; 1 bytes @ 0x34
	global	_menu_update_numeric_value$1118
_menu_update_numeric_value$1118:	; 2 bytes @ 0x34
	ds   1
	global	handle_numeric_rotation@direction
handle_numeric_rotation@direction:	; 1 bytes @ 0x35
	ds   1
	global	_menu_update_numeric_value$1119
_menu_update_numeric_value$1119:	; 2 bytes @ 0x36
	ds   1
	global	menu_handle_encoder@opts
menu_handle_encoder@opts:	; 2 bytes @ 0x37
	global	menu_draw_input@title
menu_draw_input@title:	; 10 bytes @ 0x37
	ds   1
	global	_menu_update_numeric_value$1120
_menu_update_numeric_value$1120:	; 2 bytes @ 0x38
	ds   1
	global	menu_handle_encoder@edit_flag
menu_handle_encoder@edit_flag:	; 1 bytes @ 0x39
	ds   1
	global	_menu_update_numeric_value$1121
_menu_update_numeric_value$1121:	; 2 bytes @ 0x3A
	ds   2
	global	_menu_update_numeric_value$1122
_menu_update_numeric_value$1122:	; 2 bytes @ 0x3C
	ds   2
	global	_menu_update_numeric_value$1123
_menu_update_numeric_value$1123:	; 2 bytes @ 0x3E
	ds   2
	global	_menu_update_numeric_value$1124
_menu_update_numeric_value$1124:	; 2 bytes @ 0x40
	ds   1
	global	menu_draw_input@value_buf
menu_draw_input@value_buf:	; 15 bytes @ 0x41
	ds   1
	global	_menu_update_numeric_value$1126
_menu_update_numeric_value$1126:	; 2 bytes @ 0x42
	ds   2
	global	menu_update_numeric_value@item_idx
menu_update_numeric_value@item_idx:	; 1 bytes @ 0x44
	ds   1
	global	menu_update_numeric_value@value_buf
menu_update_numeric_value@value_buf:	; 6 bytes @ 0x45
	ds   6
	global	menu_update_numeric_value@start_col
menu_update_numeric_value@start_col:	; 1 bytes @ 0x4B
	ds   1
	global	menu_update_numeric_value@screen_line
menu_update_numeric_value@screen_line:	; 1 bytes @ 0x4C
	ds   4
	global	menu_draw_input@start_pos
menu_draw_input@start_pos:	; 1 bytes @ 0x50
	global	_rebuild_input_menu$1046
_rebuild_input_menu$1046:	; 2 bytes @ 0x50
	ds   1
	global	_menu_draw_input$1151
_menu_draw_input$1151:	; 2 bytes @ 0x51
	ds   1
	global	_rebuild_input_menu$1060
_rebuild_input_menu$1060:	; 2 bytes @ 0x52
	ds   1
	global	_menu_draw_input$1158
_menu_draw_input$1158:	; 2 bytes @ 0x53
	ds   1
	global	_rebuild_input_menu$1061
_rebuild_input_menu$1061:	; 2 bytes @ 0x54
	ds   1
	global	_menu_draw_input$1171
_menu_draw_input$1171:	; 2 bytes @ 0x55
	ds   1
	global	_rebuild_input_menu$1067
_rebuild_input_menu$1067:	; 2 bytes @ 0x56
	ds   1
	global	_menu_draw_input$1175
_menu_draw_input$1175:	; 2 bytes @ 0x57
	ds   1
	global	_rebuild_input_menu$1068
_rebuild_input_menu$1068:	; 2 bytes @ 0x58
	ds   1
	global	menu_draw_input@flag_value
menu_draw_input@flag_value:	; 1 bytes @ 0x59
	ds   1
	global	menu_draw_input@flag_value_1157
menu_draw_input@flag_value_1157:	; 1 bytes @ 0x5A
	global	_rebuild_input_menu$1074
_rebuild_input_menu$1074:	; 2 bytes @ 0x5A
	ds   1
	global	menu_draw_input@val_len
menu_draw_input@val_len:	; 1 bytes @ 0x5B
	ds   1
	global	menu_draw_input@val_len_1162
menu_draw_input@val_len_1162:	; 1 bytes @ 0x5C
	global	_rebuild_input_menu$1075
_rebuild_input_menu$1075:	; 2 bytes @ 0x5C
	ds   1
	global	menu_draw_input@j
menu_draw_input@j:	; 1 bytes @ 0x5D
	ds   1
	global	menu_draw_input@j_1163
menu_draw_input@j_1163:	; 1 bytes @ 0x5E
	global	_rebuild_input_menu$1079
_rebuild_input_menu$1079:	; 2 bytes @ 0x5E
	ds   1
	global	menu_draw_input@opts
menu_draw_input@opts:	; 2 bytes @ 0x5F
	ds   1
	global	rebuild_input_menu@sensor
rebuild_input_menu@sensor:	; 1 bytes @ 0x60
	ds   1
	global	rebuild_input_menu@i
rebuild_input_menu@i:	; 1 bytes @ 0x61
	global	menu_draw_input@opts_1153
menu_draw_input@opts_1153:	; 2 bytes @ 0x61
	ds   1
	global	_rebuild_input_menu$2195
_rebuild_input_menu$2195:	; 2 bytes @ 0x62
	ds   1
	global	menu_draw_input@val_len_1164
menu_draw_input@val_len_1164:	; 1 bytes @ 0x63
	ds   1
	global	menu_draw_input@show_brackets
menu_draw_input@show_brackets:	; 1 bytes @ 0x64
	global	_rebuild_input_menu$2196
_rebuild_input_menu$2196:	; 2 bytes @ 0x64
	ds   1
	global	menu_draw_input@i
menu_draw_input@i:	; 1 bytes @ 0x65
	ds   1
	global	rebuild_input_menu@input_num
rebuild_input_menu@input_num:	; 1 bytes @ 0x66
	global	menu_draw_input@item_idx
menu_draw_input@item_idx:	; 1 bytes @ 0x66
	ds   1
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_isdigit:	; 1 bit 
?_eeprom_init:	; 1 bytes @ 0x0
?_encoder_init:	; 1 bytes @ 0x0
?_menu_init:	; 1 bytes @ 0x0
?_menu_draw_options:	; 1 bytes @ 0x0
?_is_numeric_field:	; 1 bytes @ 0x0
?_handle_numeric_rotation:	; 1 bytes @ 0x0
?_is_time_field:	; 1 bytes @ 0x0
?_handle_time_rotation:	; 1 bytes @ 0x0
?_menu_update_time_value:	; 1 bytes @ 0x0
?_menu_update_numeric_value:	; 1 bytes @ 0x0
?_menu_update_edit_value:	; 1 bytes @ 0x0
?_menu_draw_input:	; 1 bytes @ 0x0
?_menu_draw_setup:	; 1 bytes @ 0x0
?_menu_handle_button:	; 1 bytes @ 0x0
?_get_menu_timeout_seconds:	; 1 bytes @ 0x0
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
?_lcd_clear_line:	; 1 bytes @ 0x0
?_rebuild_input_menu:	; 1 bytes @ 0x0
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
??_is_numeric_field:	; 1 bytes @ 0xE
??_is_time_field:	; 1 bytes @ 0xE
??_get_menu_timeout_seconds:	; 1 bytes @ 0xE
??_sync_menu_variables:	; 1 bytes @ 0xE
??_isdigit:	; 1 bytes @ 0xE
??_uart_init:	; 1 bytes @ 0xE
??_uart_write:	; 1 bytes @ 0xE
??_system_init:	; 1 bytes @ 0xE
??_lcd_write_nibble:	; 1 bytes @ 0xE
?_beep:	; 1 bytes @ 0xE
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
	global	?_get_item_options
?_get_item_options:	; 2 bytes @ 0xE
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
	global	_is_numeric_field$992
_is_numeric_field$992:	; 1 bytes @ 0xE
	global	_is_time_field$995
_is_time_field$995:	; 1 bytes @ 0xE
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
	global	is_numeric_field@line
is_numeric_field@line:	; 1 bytes @ 0xF
	global	is_time_field@line
is_time_field@line:	; 1 bytes @ 0xF
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0xF
	global	___lbmod@dividend
___lbmod@dividend:	; 1 bytes @ 0xF
	global	_isdigit$1946
_isdigit$1946:	; 1 bytes @ 0xF
	global	uart_print@str
uart_print@str:	; 2 bytes @ 0xF
	ds   1
??_strlen:	; 1 bytes @ 0x10
??_get_item_options:	; 1 bytes @ 0x10
?_lcd_print:	; 1 bytes @ 0x10
??_beep:	; 1 bytes @ 0x10
??_get_current_numeric_value:	; 1 bytes @ 0x10
??_calculate_config_checksum:	; 1 bytes @ 0x10
??_eeprom_read_byte:	; 1 bytes @ 0x10
?_eeprom_read_block:	; 1 bytes @ 0x10
	global	?_eeprom_read_word
?_eeprom_read_word:	; 2 bytes @ 0x10
	global	lcd_cmd@cmd
lcd_cmd@cmd:	; 1 bytes @ 0x10
	global	get_item_options@item_index
get_item_options@item_index:	; 1 bytes @ 0x10
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
	global	get_item_options@i
get_item_options@i:	; 1 bytes @ 0x11
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
	global	calculate_config_checksum@data
calculate_config_checksum@data:	; 2 bytes @ 0x13
	global	eeprom_write_word@data
eeprom_write_word@data:	; 2 bytes @ 0x13
	global	eeprom_write_block@address
eeprom_write_block@address:	; 2 bytes @ 0x13
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x13
	ds   1
??_menu_update_edit_value:	; 1 bytes @ 0x14
??_memcpy:	; 1 bytes @ 0x14
?_lcd_print_at:	; 1 bytes @ 0x14
??_lcd_clear_line:	; 1 bytes @ 0x14
	global	lcd_print_at@col
lcd_print_at@col:	; 1 bytes @ 0x14
	global	lcd_clear_line@row
lcd_clear_line@row:	; 1 bytes @ 0x14
	global	strcmp@r
strcmp@r:	; 1 bytes @ 0x14
	global	eeprom_read_block@length
eeprom_read_block@length:	; 2 bytes @ 0x14
	global	memcpy@d
memcpy@d:	; 2 bytes @ 0x14
	ds   1
??_eeprom_write_word:	; 1 bytes @ 0x15
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
	global	calculate_config_checksum@j_1420
calculate_config_checksum@j_1420:	; 2 bytes @ 0x17
	global	eeprom_write_block@ptr
eeprom_write_block@ptr:	; 2 bytes @ 0x17
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x17
	ds   1
??_menu_draw_options:	; 1 bytes @ 0x18
??_menu_draw_setup:	; 1 bytes @ 0x18
	global	memcpy@tmp
memcpy@tmp:	; 1 bytes @ 0x18
	global	eeprom_read_block@i
eeprom_read_block@i:	; 2 bytes @ 0x18
	global	menu_update_edit_value@value_buf
menu_update_edit_value@value_buf:	; 15 bytes @ 0x18
	ds   1
??_load_factory_defaults:	; 1 bytes @ 0x19
	global	calculate_config_checksum@i
calculate_config_checksum@i:	; 1 bytes @ 0x19
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x19
	global	eeprom_write_block@i
eeprom_write_block@i:	; 2 bytes @ 0x19
	ds   1
?_init_numeric_editor:	; 1 bytes @ 0x1A
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x1A
	global	init_numeric_editor@value
init_numeric_editor@value:	; 2 bytes @ 0x1A
	global	sprintf@sp
sprintf@sp:	; 2 bytes @ 0x1A
	ds   1
??_save_current_config:	; 1 bytes @ 0x1B
	global	save_current_config@checksum
save_current_config@checksum:	; 2 bytes @ 0x1B
	ds   1
??_init_numeric_editor:	; 1 bytes @ 0x1C
	global	sprintf@f
sprintf@f:	; 2 bytes @ 0x1C
	ds   1
	global	menu_draw_options@i
menu_draw_options@i:	; 1 bytes @ 0x1D
	global	save_current_config@i
save_current_config@i:	; 1 bytes @ 0x1D
	global	menu_draw_setup@sensor_type_names
menu_draw_setup@sensor_type_names:	; 6 bytes @ 0x1D
	ds   1
??_eeprom_init:	; 1 bytes @ 0x1E
	global	_init_numeric_editor$1097
_init_numeric_editor$1097:	; 2 bytes @ 0x1E
	global	eeprom_init@stored_checksum
eeprom_init@stored_checksum:	; 2 bytes @ 0x1E
	ds   2
	global	_init_numeric_editor$1096
_init_numeric_editor$1096:	; 1 bytes @ 0x20
	global	eeprom_init@calculated_checksum
eeprom_init@calculated_checksum:	; 2 bytes @ 0x20
	ds   1
	global	init_numeric_editor@abs_val
init_numeric_editor@abs_val:	; 2 bytes @ 0x21
	ds   1
	global	eeprom_init@i
eeprom_init@i:	; 1 bytes @ 0x22
	ds   1
	global	menu_draw_setup@setup_items
menu_draw_setup@setup_items:	; 10 bytes @ 0x23
	ds   3
??_sprintf:	; 1 bytes @ 0x26
	ds   1
	global	_menu_update_edit_value$1185
_menu_update_edit_value$1185:	; 2 bytes @ 0x27
	ds   2
	global	menu_update_edit_value@start_pos
menu_update_edit_value@start_pos:	; 1 bytes @ 0x29
	global	_sprintf$1505
_sprintf$1505:	; 2 bytes @ 0x29
	ds   1
	global	menu_update_edit_value@val_len
menu_update_edit_value@val_len:	; 1 bytes @ 0x2A
	ds   1
	global	menu_update_edit_value@val_len_1190
menu_update_edit_value@val_len_1190:	; 1 bytes @ 0x2B
	global	_sprintf$1506
_sprintf$1506:	; 2 bytes @ 0x2B
	ds   1
	global	menu_update_edit_value@val_len_1193
menu_update_edit_value@val_len_1193:	; 1 bytes @ 0x2C
	ds   1
	global	menu_update_edit_value@j
menu_update_edit_value@j:	; 1 bytes @ 0x2D
	global	menu_draw_setup@type_len
menu_draw_setup@type_len:	; 1 bytes @ 0x2D
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x2D
	ds   1
	global	menu_update_edit_value@j_1191
menu_update_edit_value@j_1191:	; 1 bytes @ 0x2E
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x2E
	global	menu_draw_setup@type_text
menu_draw_setup@type_text:	; 2 bytes @ 0x2E
	ds   1
	global	menu_update_edit_value@screen_line
menu_update_edit_value@screen_line:	; 1 bytes @ 0x2F
	global	sprintf@cp
sprintf@cp:	; 2 bytes @ 0x2F
	ds   1
	global	menu_update_edit_value@flag_value
menu_update_edit_value@flag_value:	; 1 bytes @ 0x30
	global	menu_draw_setup@sensor_type
menu_draw_setup@sensor_type:	; 1 bytes @ 0x30
	ds   1
	global	menu_draw_setup@item_idx
menu_draw_setup@item_idx:	; 1 bytes @ 0x31
	global	menu_update_edit_value@opts
menu_update_edit_value@opts:	; 2 bytes @ 0x31
	global	sprintf@val
sprintf@val:	; 2 bytes @ 0x31
	ds   1
	global	menu_draw_setup@i
menu_draw_setup@i:	; 1 bytes @ 0x32
	ds   1
	global	menu_update_edit_value@item_idx
menu_update_edit_value@item_idx:	; 1 bytes @ 0x33
	global	sprintf@len
sprintf@len:	; 2 bytes @ 0x33
	ds   2
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x35
	ds   1
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x36
	ds   1
	global	sprintf@width
sprintf@width:	; 2 bytes @ 0x37
	ds   2
??_handle_numeric_rotation:	; 1 bytes @ 0x39
??_handle_time_rotation:	; 1 bytes @ 0x39
??_menu_update_time_value:	; 1 bytes @ 0x39
?_menu_handle_encoder:	; 1 bytes @ 0x39
??_menu_update_numeric_value:	; 1 bytes @ 0x39
?_init_time_editor:	; 1 bytes @ 0x39
??_rebuild_input_menu:	; 1 bytes @ 0x39
	global	init_time_editor@value_seconds
init_time_editor@value_seconds:	; 2 bytes @ 0x39
	global	menu_handle_encoder@delta
menu_handle_encoder@delta:	; 2 bytes @ 0x39
	ds   2
	global	init_time_editor@mode
init_time_editor@mode:	; 1 bytes @ 0x3B
	ds   1
??_init_time_editor:	; 1 bytes @ 0x3C
;!
;!Data Sizes:
;!    Strings     1470
;!    Constant    772
;!    Data        248
;!    BSS         652
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          126     60     111
;!    BANK0           128    103     127
;!    BANK1           256    241     256
;!    BANK2           256    116     254
;!    BANK3           256      0     160
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
;!		 -> STR_38(CODE[7]), STR_39(CODE[7]), STR_40(CODE[10]), STR_41(CODE[11]), 
;!		 -> STR_42(CODE[12]), STR_43(CODE[9]), STR_44(CODE[13]), STR_45(CODE[6]), 
;!		 -> STR_46(CODE[6]), STR_47(CODE[9]), STR_48(CODE[8]), STR_49(CODE[8]), 
;!		 -> STR_50(CODE[8]), STR_51(CODE[5]), STR_52(CODE[7]), STR_53(CODE[7]), 
;!		 -> STR_54(CODE[10]), STR_55(CODE[11]), STR_56(CODE[10]), STR_57(CODE[9]), 
;!		 -> STR_58(CODE[9]), STR_59(CODE[8]), STR_60(CODE[5]), STR_61(CODE[7]), 
;!		 -> STR_62(CODE[7]), STR_63(CODE[5]), STR_64(CODE[8]), STR_65(CODE[11]), 
;!		 -> STR_66(CODE[8]), STR_67(CODE[8]), STR_68(CODE[5]), STR_69(CODE[7]), 
;!		 -> STR_70(CODE[7]), STR_71(CODE[5]), STR_72(CODE[6]), STR_73(CODE[10]), 
;!		 -> STR_74(CODE[11]), STR_75(CODE[9]), STR_76(CODE[12]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[5]), 
;!
;!    flow_analog_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(COMRAM[5]), value_display(BANK2[10]), value_enable(BANK2[10]), value_hi_pressure(BANK3[10]), 
;!		 -> value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK2[10]), value_low_pressure(BANK3[10]), 
;!		 -> value_plpbp(BANK3[10]), value_rlyhigh(BANK2[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), 
;!		 -> value_scale20(BANK2[10]), value_scale4(COMRAM[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    flow_digital_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_38(CODE[7]), STR_39(CODE[7]), STR_40(CODE[10]), STR_41(CODE[11]), 
;!		 -> STR_42(CODE[12]), STR_43(CODE[9]), STR_44(CODE[13]), STR_45(CODE[6]), 
;!		 -> STR_46(CODE[6]), STR_47(CODE[9]), STR_48(CODE[8]), STR_49(CODE[8]), 
;!		 -> STR_50(CODE[8]), STR_51(CODE[5]), STR_52(CODE[7]), STR_53(CODE[7]), 
;!		 -> STR_54(CODE[10]), STR_55(CODE[11]), STR_56(CODE[10]), STR_57(CODE[9]), 
;!		 -> STR_58(CODE[9]), STR_59(CODE[8]), STR_60(CODE[5]), STR_61(CODE[7]), 
;!		 -> STR_62(CODE[7]), STR_63(CODE[5]), STR_64(CODE[8]), STR_65(CODE[11]), 
;!		 -> STR_66(CODE[8]), STR_67(CODE[8]), STR_68(CODE[5]), STR_69(CODE[7]), 
;!		 -> STR_70(CODE[7]), STR_71(CODE[5]), STR_72(CODE[6]), STR_73(CODE[10]), 
;!		 -> STR_74(CODE[11]), STR_75(CODE[9]), STR_76(CODE[12]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[5]), 
;!
;!    flow_digital_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(COMRAM[5]), value_display(BANK2[10]), value_enable(BANK2[10]), value_hi_pressure(BANK3[10]), 
;!		 -> value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK2[10]), value_low_pressure(BANK3[10]), 
;!		 -> value_plpbp(BANK3[10]), value_rlyhigh(BANK2[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), 
;!		 -> value_scale20(BANK2[10]), value_scale4(COMRAM[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    input_menu$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_38(CODE[7]), STR_39(CODE[7]), STR_40(CODE[10]), STR_41(CODE[11]), 
;!		 -> STR_42(CODE[12]), STR_43(CODE[9]), STR_44(CODE[13]), STR_45(CODE[6]), 
;!		 -> STR_46(CODE[6]), STR_47(CODE[9]), STR_48(CODE[8]), STR_49(CODE[8]), 
;!		 -> STR_50(CODE[8]), STR_51(CODE[5]), STR_52(CODE[7]), STR_53(CODE[7]), 
;!		 -> STR_54(CODE[10]), STR_55(CODE[11]), STR_56(CODE[10]), STR_57(CODE[9]), 
;!		 -> STR_58(CODE[9]), STR_59(CODE[8]), STR_60(CODE[5]), STR_61(CODE[7]), 
;!		 -> STR_62(CODE[7]), STR_63(CODE[5]), STR_64(CODE[8]), STR_65(CODE[11]), 
;!		 -> STR_66(CODE[8]), STR_67(CODE[8]), STR_68(CODE[5]), STR_69(CODE[7]), 
;!		 -> STR_70(CODE[7]), STR_71(CODE[5]), STR_72(CODE[6]), STR_73(CODE[10]), 
;!		 -> STR_74(CODE[11]), STR_75(CODE[9]), STR_76(CODE[12]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[5]), 
;!
;!    input_menu$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(COMRAM[5]), value_display(BANK2[10]), value_enable(BANK2[10]), value_hi_pressure(BANK3[10]), 
;!		 -> value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK2[10]), value_low_pressure(BANK3[10]), 
;!		 -> value_plpbp(BANK3[10]), value_rlyhigh(BANK2[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), 
;!		 -> value_scale20(BANK2[10]), value_scale4(COMRAM[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    lcd_print@str	PTR const unsigned char  size(2) Largest target is 21
;!		 -> menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@value_buf(COMRAM[15]), menu_update_numeric_value@value_buf(BANK0[6]), 
;!		 -> menu_update_time_value@value_buf(BANK1[6]), STR_127(CODE[7]), STR_128(CODE[2]), STR_129(CODE[2]), 
;!		 -> STR_130(CODE[8]), STR_131(CODE[2]), STR_132(CODE[2]), STR_139(CODE[2]), 
;!		 -> STR_140(CODE[2]), STR_141(CODE[2]), STR_142(CODE[2]), STR_145(CODE[11]), 
;!		 -> STR_146(CODE[2]), STR_147(CODE[2]), STR_157(CODE[6]), STR_158(CODE[8]), 
;!		 -> STR_159(CODE[8]), STR_16(CODE[12]), STR_160(CODE[8]), STR_161(CODE[6]), 
;!		 -> STR_162(CODE[5]), STR_163(CODE[9]), STR_164(CODE[5]), STR_165(CODE[5]), 
;!		 -> STR_166(CODE[2]), STR_167(CODE[2]), STR_17(CODE[6]), STR_20(CODE[12]), 
;!		 -> STR_21(CODE[8]), STR_3(CODE[13]), STR_33(CODE[10]), STR_34(CODE[11]), 
;!		 -> STR_35(CODE[13]), STR_36(CODE[6]), STR_37(CODE[5]), STR_38(CODE[7]), 
;!		 -> STR_39(CODE[7]), STR_4(CODE[16]), STR_40(CODE[10]), STR_41(CODE[11]), 
;!		 -> STR_42(CODE[12]), STR_43(CODE[9]), STR_44(CODE[13]), STR_45(CODE[6]), 
;!		 -> STR_46(CODE[6]), STR_47(CODE[9]), STR_48(CODE[8]), STR_49(CODE[8]), 
;!		 -> STR_50(CODE[8]), STR_51(CODE[5]), STR_52(CODE[7]), STR_53(CODE[7]), 
;!		 -> STR_54(CODE[10]), STR_55(CODE[11]), STR_56(CODE[10]), STR_57(CODE[9]), 
;!		 -> STR_58(CODE[9]), STR_59(CODE[8]), STR_60(CODE[5]), STR_61(CODE[7]), 
;!		 -> STR_62(CODE[7]), STR_63(CODE[5]), STR_64(CODE[8]), STR_65(CODE[11]), 
;!		 -> STR_66(CODE[8]), STR_67(CODE[8]), STR_68(CODE[5]), STR_69(CODE[7]), 
;!		 -> STR_70(CODE[7]), STR_71(CODE[5]), STR_72(CODE[6]), STR_73(CODE[10]), 
;!		 -> STR_74(CODE[11]), STR_75(CODE[9]), STR_76(CODE[12]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[5]), STR_89(CODE[8]), STR_90(CODE[2]), 
;!		 -> STR_91(CODE[2]), STR_92(CODE[21]), 
;!
;!    lcd_print_at@str	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@title(BANK0[10]), menu_draw_input@value_buf(BANK0[15]), STR_130(CODE[8]), STR_131(CODE[2]), 
;!		 -> STR_157(CODE[6]), STR_158(CODE[8]), STR_159(CODE[8]), STR_160(CODE[8]), 
;!		 -> STR_161(CODE[6]), STR_162(CODE[5]), STR_163(CODE[9]), STR_164(CODE[5]), 
;!		 -> STR_165(CODE[5]), STR_166(CODE[2]), STR_33(CODE[10]), STR_34(CODE[11]), 
;!		 -> STR_35(CODE[13]), STR_36(CODE[6]), STR_37(CODE[5]), STR_38(CODE[7]), 
;!		 -> STR_39(CODE[7]), STR_40(CODE[10]), STR_41(CODE[11]), STR_42(CODE[12]), 
;!		 -> STR_43(CODE[9]), STR_44(CODE[13]), STR_45(CODE[6]), STR_46(CODE[6]), 
;!		 -> STR_47(CODE[9]), STR_48(CODE[8]), STR_49(CODE[8]), STR_50(CODE[8]), 
;!		 -> STR_51(CODE[5]), STR_52(CODE[7]), STR_53(CODE[7]), STR_54(CODE[10]), 
;!		 -> STR_55(CODE[11]), STR_56(CODE[10]), STR_57(CODE[9]), STR_58(CODE[9]), 
;!		 -> STR_59(CODE[8]), STR_60(CODE[5]), STR_61(CODE[7]), STR_62(CODE[7]), 
;!		 -> STR_63(CODE[5]), STR_64(CODE[8]), STR_65(CODE[11]), STR_66(CODE[8]), 
;!		 -> STR_67(CODE[8]), STR_68(CODE[5]), STR_69(CODE[7]), STR_70(CODE[7]), 
;!		 -> STR_71(CODE[5]), STR_72(CODE[6]), STR_73(CODE[10]), STR_74(CODE[11]), 
;!		 -> STR_75(CODE[9]), STR_76(CODE[12]), STR_77(CODE[8]), STR_78(CODE[8]), 
;!		 -> STR_79(CODE[5]), 
;!
;!    memcpy@d	PTR unsigned char  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), input_menu(BANK2[75]), system_config(BANK4[128]), 
;!
;!    memcpy@d1	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), input_menu(BANK2[75]), system_config(BANK4[128]), 
;!
;!    memcpy@s	PTR const unsigned char  size(2) Largest target is 384
;!		 -> factory_defaults(CODE[384]), pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    memcpy@s1	PTR const void  size(2) Largest target is 384
;!		 -> factory_defaults(CODE[384]), pressure_menu_template(CODE[70]), system_defaults(CODE[128]), temp_menu_template(CODE[45]), 
;!
;!    menu_draw_input$1171	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_139(CODE[2]), STR_140(CODE[2]), 
;!
;!    menu_draw_input$1175	PTR const unsigned char  size(2) Largest target is 2
;!		 -> STR_141(CODE[2]), STR_142(CODE[2]), 
;!
;!    menu_draw_input@opts	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_23(CODE[9]), STR_24(CODE[8]), STR_25(CODE[1]), STR_26(CODE[1]), 
;!		 -> STR_27(CODE[1]), STR_28(CODE[9]), STR_29(CODE[5]), STR_30(CODE[5]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[1]), 
;!
;!    menu_draw_input@opts_1153	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_draw_input@opts_1153$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_23(CODE[9]), STR_24(CODE[8]), STR_25(CODE[1]), STR_26(CODE[1]), 
;!		 -> STR_27(CODE[1]), STR_28(CODE[9]), STR_29(CODE[5]), STR_30(CODE[5]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[1]), 
;!
;!    menu_draw_setup@F2633	PTR const unsigned char [5] size(2) Largest target is 8
;!		 -> STR_158(CODE[8]), STR_159(CODE[8]), STR_160(CODE[8]), STR_161(CODE[6]), 
;!		 -> STR_162(CODE[5]), 
;!
;!    menu_draw_setup@F2635	PTR const unsigned char [3] size(2) Largest target is 9
;!		 -> STR_163(CODE[9]), STR_164(CODE[5]), STR_165(CODE[5]), 
;!
;!    menu_draw_setup@sensor_type_names	PTR const unsigned char [3] size(2) Largest target is 9
;!		 -> STR_163(CODE[9]), STR_164(CODE[5]), STR_165(CODE[5]), 
;!
;!    menu_draw_setup@setup_items	PTR const unsigned char [5] size(2) Largest target is 8
;!		 -> STR_158(CODE[8]), STR_159(CODE[8]), STR_160(CODE[8]), STR_161(CODE[6]), 
;!		 -> STR_162(CODE[5]), 
;!
;!    menu_draw_setup@type_text	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_163(CODE[9]), STR_164(CODE[5]), STR_165(CODE[5]), 
;!
;!    menu_handle_button@edit_flag	PTR unsigned char  size(1) Largest target is 1
;!		 -> enable_edit_flag(BANK0[1]), sensor_edit_flag(BANK0[1]), 
;!
;!    menu_handle_button@edit_flag_1240	PTR unsigned char  size(1) Largest target is 1
;!		 -> enable_edit_flag(BANK0[1]), sensor_edit_flag(BANK0[1]), 
;!
;!    menu_handle_button@opts	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_23(CODE[9]), STR_24(CODE[8]), STR_25(CODE[1]), STR_26(CODE[1]), 
;!		 -> STR_27(CODE[1]), STR_28(CODE[9]), STR_29(CODE[5]), STR_30(CODE[5]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[1]), 
;!
;!    menu_handle_button@opts_1236	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_handle_button@opts_1236$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_23(CODE[9]), STR_24(CODE[8]), STR_25(CODE[1]), STR_26(CODE[1]), 
;!		 -> STR_27(CODE[1]), STR_28(CODE[9]), STR_29(CODE[5]), STR_30(CODE[5]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[1]), 
;!
;!    menu_handle_encoder@edit_flag	PTR unsigned char  size(1) Largest target is 1
;!		 -> enable_edit_flag(BANK0[1]), sensor_edit_flag(BANK0[1]), 
;!
;!    menu_handle_encoder@opts	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_handle_encoder@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_23(CODE[9]), STR_24(CODE[8]), STR_25(CODE[1]), STR_26(CODE[1]), 
;!		 -> STR_27(CODE[1]), STR_28(CODE[9]), STR_29(CODE[5]), STR_30(CODE[5]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[1]), 
;!
;!    menu_item_options$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_23(CODE[9]), STR_24(CODE[8]), STR_25(CODE[1]), STR_26(CODE[1]), 
;!		 -> STR_27(CODE[1]), STR_28(CODE[9]), STR_29(CODE[5]), STR_30(CODE[5]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[1]), 
;!
;!    menu_update_edit_value@opts	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    menu_update_edit_value@opts$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_23(CODE[9]), STR_24(CODE[8]), STR_25(CODE[1]), STR_26(CODE[1]), 
;!		 -> STR_27(CODE[1]), STR_28(CODE[9]), STR_29(CODE[5]), STR_30(CODE[5]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[1]), 
;!
;!    options_menu	PTR const unsigned char [5] size(2) Largest target is 13
;!		 -> STR_33(CODE[10]), STR_34(CODE[11]), STR_35(CODE[13]), STR_36(CODE[6]), 
;!		 -> STR_37(CODE[5]), 
;!
;!    pressure_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_38(CODE[7]), STR_39(CODE[7]), STR_40(CODE[10]), STR_41(CODE[11]), 
;!		 -> STR_42(CODE[12]), STR_43(CODE[9]), STR_44(CODE[13]), STR_45(CODE[6]), 
;!		 -> STR_46(CODE[6]), STR_47(CODE[9]), STR_48(CODE[8]), STR_49(CODE[8]), 
;!		 -> STR_50(CODE[8]), STR_51(CODE[5]), STR_52(CODE[7]), STR_53(CODE[7]), 
;!		 -> STR_54(CODE[10]), STR_55(CODE[11]), STR_56(CODE[10]), STR_57(CODE[9]), 
;!		 -> STR_58(CODE[9]), STR_59(CODE[8]), STR_60(CODE[5]), STR_61(CODE[7]), 
;!		 -> STR_62(CODE[7]), STR_63(CODE[5]), STR_64(CODE[8]), STR_65(CODE[11]), 
;!		 -> STR_66(CODE[8]), STR_67(CODE[8]), STR_68(CODE[5]), STR_69(CODE[7]), 
;!		 -> STR_70(CODE[7]), STR_71(CODE[5]), STR_72(CODE[6]), STR_73(CODE[10]), 
;!		 -> STR_74(CODE[11]), STR_75(CODE[9]), STR_76(CODE[12]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[5]), 
;!
;!    pressure_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(COMRAM[5]), value_display(BANK2[10]), value_enable(BANK2[10]), value_hi_pressure(BANK3[10]), 
;!		 -> value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK2[10]), value_low_pressure(BANK3[10]), 
;!		 -> value_plpbp(BANK3[10]), value_rlyhigh(BANK2[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), 
;!		 -> value_scale20(BANK2[10]), value_scale4(COMRAM[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    rebuild_input_menu$1046	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_94(CODE[8]), STR_95(CODE[9]), 
;!
;!    rebuild_input_menu$1060	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_104(CODE[6]), STR_105(CODE[6]), STR_106(CODE[9]), 
;!
;!    rebuild_input_menu$1061	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_105(CODE[6]), STR_106(CODE[9]), 
;!
;!    rebuild_input_menu$1067	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_107(CODE[6]), STR_108(CODE[6]), STR_109(CODE[9]), 
;!
;!    rebuild_input_menu$1068	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_108(CODE[6]), STR_109(CODE[9]), 
;!
;!    rebuild_input_menu$1074	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_110(CODE[6]), STR_111(CODE[6]), STR_112(CODE[9]), 
;!
;!    rebuild_input_menu$1075	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_111(CODE[6]), STR_112(CODE[9]), 
;!
;!    rebuild_input_menu$1079	PTR const unsigned char  size(2) Largest target is 5
;!		 -> STR_113(CODE[5]), STR_114(CODE[5]), 
;!
;!    S812$options	PTR const unsigned char [5] size(2) Largest target is 9
;!		 -> STR_23(CODE[9]), STR_24(CODE[8]), STR_25(CODE[1]), STR_26(CODE[1]), 
;!		 -> STR_27(CODE[1]), STR_28(CODE[9]), STR_29(CODE[5]), STR_30(CODE[5]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[1]), 
;!
;!    S816$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_38(CODE[7]), STR_39(CODE[7]), STR_40(CODE[10]), STR_41(CODE[11]), 
;!		 -> STR_42(CODE[12]), STR_43(CODE[9]), STR_44(CODE[13]), STR_45(CODE[6]), 
;!		 -> STR_46(CODE[6]), STR_47(CODE[9]), STR_48(CODE[8]), STR_49(CODE[8]), 
;!		 -> STR_50(CODE[8]), STR_51(CODE[5]), STR_52(CODE[7]), STR_53(CODE[7]), 
;!		 -> STR_54(CODE[10]), STR_55(CODE[11]), STR_56(CODE[10]), STR_57(CODE[9]), 
;!		 -> STR_58(CODE[9]), STR_59(CODE[8]), STR_60(CODE[5]), STR_61(CODE[7]), 
;!		 -> STR_62(CODE[7]), STR_63(CODE[5]), STR_64(CODE[8]), STR_65(CODE[11]), 
;!		 -> STR_66(CODE[8]), STR_67(CODE[8]), STR_68(CODE[5]), STR_69(CODE[7]), 
;!		 -> STR_70(CODE[7]), STR_71(CODE[5]), STR_72(CODE[6]), STR_73(CODE[10]), 
;!		 -> STR_74(CODE[11]), STR_75(CODE[9]), STR_76(CODE[12]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[5]), 
;!
;!    S816$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(COMRAM[5]), value_display(BANK2[10]), value_enable(BANK2[10]), value_hi_pressure(BANK3[10]), 
;!		 -> value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK2[10]), value_low_pressure(BANK3[10]), 
;!		 -> value_plpbp(BANK3[10]), value_rlyhigh(BANK2[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), 
;!		 -> value_scale20(BANK2[10]), value_scale4(COMRAM[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    sp__get_item_options	PTR const struct . size(2) Largest target is 34
;!		 -> menu_item_options(CODE[24]), NULL(NULL[0]), 
;!
;!    sp__memcpy	PTR void  size(2) Largest target is 384
;!		 -> input_config(BIGRAM[384]), input_menu(BANK2[75]), system_config(BANK4[128]), 
;!
;!    sp__strcpy	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@value_buf(COMRAM[15]), original_value(BANK3[10]), value_back(COMRAM[5]), 
;!		 -> value_display(BANK2[10]), value_enable(BANK2[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), 
;!		 -> value_high_temp(BANK3[10]), value_highbp(BANK2[10]), value_low_pressure(BANK3[10]), value_plpbp(BANK3[10]), 
;!		 -> value_rlyhigh(BANK2[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(COMRAM[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    sprintf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_sprintf(COMRAM[2]), 
;!
;!    sprintf@cp	PTR const unsigned char  size(2) Largest target is 13
;!		 -> menu_update_time_value@value_buf(BANK1[6]), ?_sprintf(COMRAM[2]), STR_168(CODE[7]), STR_38(CODE[7]), 
;!		 -> STR_39(CODE[7]), STR_40(CODE[10]), STR_41(CODE[11]), STR_42(CODE[12]), 
;!		 -> STR_43(CODE[9]), STR_44(CODE[13]), STR_45(CODE[6]), STR_46(CODE[6]), 
;!		 -> STR_47(CODE[9]), STR_48(CODE[8]), STR_49(CODE[8]), STR_50(CODE[8]), 
;!		 -> STR_51(CODE[5]), STR_52(CODE[7]), STR_53(CODE[7]), STR_54(CODE[10]), 
;!		 -> STR_55(CODE[11]), STR_56(CODE[10]), STR_57(CODE[9]), STR_58(CODE[9]), 
;!		 -> STR_59(CODE[8]), STR_60(CODE[5]), STR_61(CODE[7]), STR_62(CODE[7]), 
;!		 -> STR_63(CODE[5]), STR_64(CODE[8]), STR_65(CODE[11]), STR_66(CODE[8]), 
;!		 -> STR_67(CODE[8]), STR_68(CODE[5]), STR_69(CODE[7]), STR_70(CODE[7]), 
;!		 -> STR_71(CODE[5]), STR_72(CODE[6]), STR_73(CODE[10]), STR_74(CODE[11]), 
;!		 -> STR_75(CODE[9]), STR_76(CODE[12]), STR_77(CODE[8]), STR_78(CODE[8]), 
;!		 -> STR_79(CODE[5]), STR_94(CODE[8]), STR_95(CODE[9]), 
;!
;!    sprintf@f	PTR const unsigned char  size(2) Largest target is 51
;!		 -> STR_100(CODE[10]), STR_101(CODE[5]), STR_102(CODE[10]), STR_103(CODE[10]), 
;!		 -> STR_11(CODE[23]), STR_116(CODE[6]), STR_117(CODE[6]), STR_118(CODE[3]), 
;!		 -> STR_119(CODE[10]), STR_12(CODE[17]), STR_120(CODE[23]), STR_122(CODE[12]), 
;!		 -> STR_124(CODE[29]), STR_126(CODE[24]), STR_133(CODE[9]), STR_134(CODE[19]), 
;!		 -> STR_148(CODE[28]), STR_149(CODE[26]), STR_150(CODE[10]), STR_152(CODE[6]), 
;!		 -> STR_153(CODE[6]), STR_154(CODE[5]), STR_155(CODE[5]), STR_156(CODE[38]), 
;!		 -> STR_80(CODE[35]), STR_82(CODE[45]), STR_83(CODE[25]), STR_84(CODE[51]), 
;!		 -> STR_85(CODE[27]), STR_86(CODE[28]), STR_87(CODE[28]), STR_88(CODE[25]), 
;!		 -> STR_93(CODE[3]), STR_97(CODE[6]), STR_98(CODE[6]), STR_99(CODE[5]), 
;!
;!    sprintf@sp	PTR unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK1[40]), 
;!		 -> main@buf_586(BANK1[30]), menu_draw_input@buf(BANK0[50]), menu_draw_input@title(BANK0[10]), menu_handle_button@buf(BANK2[50]), 
;!		 -> menu_handle_button@buf_1233(BANK2[50]), menu_handle_encoder@buf(BANK0[50]), menu_update_numeric_value@debug(BANK0[50]), menu_update_time_value@debug(BANK1[50]), 
;!		 -> menu_update_time_value@debug_after(BANK1[50]), menu_update_time_value@debug_before(BANK1[50]), rebuild_input_menu@buf(BANK0[30]), rebuild_input_menu@buf_1092(BANK0[50]), 
;!		 -> value_back(COMRAM[5]), value_display(BANK2[10]), value_enable(BANK2[10]), value_hi_pressure(BANK3[10]), 
;!		 -> value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK2[10]), value_low_pressure(BANK3[10]), 
;!		 -> value_plpbp(BANK3[10]), value_rlyhigh(BANK2[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), 
;!		 -> value_scale20(BANK2[10]), value_scale4(COMRAM[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcmp@s1	PTR const unsigned char  size(2) Largest target is 12
;!		 -> value_back(COMRAM[5]), value_display(BANK2[10]), value_enable(BANK2[10]), value_hi_pressure(BANK3[10]), 
;!		 -> value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK2[10]), value_low_pressure(BANK3[10]), 
;!		 -> value_plpbp(BANK3[10]), value_rlyhigh(BANK2[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), 
;!		 -> value_scale20(BANK2[10]), value_scale4(COMRAM[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    strcmp@s2	PTR const unsigned char  size(2) Largest target is 9
;!		 -> STR_137(CODE[1]), STR_23(CODE[9]), STR_24(CODE[8]), STR_25(CODE[1]), 
;!		 -> STR_26(CODE[1]), STR_27(CODE[1]), STR_28(CODE[9]), STR_29(CODE[5]), 
;!		 -> STR_30(CODE[5]), STR_31(CODE[1]), STR_32(CODE[1]), 
;!
;!    strcpy@cp	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@value_buf(COMRAM[15]), original_value(BANK3[10]), value_back(COMRAM[5]), 
;!		 -> value_display(BANK2[10]), value_enable(BANK2[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), 
;!		 -> value_high_temp(BANK3[10]), value_highbp(BANK2[10]), value_low_pressure(BANK3[10]), value_plpbp(BANK3[10]), 
;!		 -> value_rlyhigh(BANK2[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(COMRAM[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strcpy@from	PTR const unsigned char  size(2) Largest target is 12
;!		 -> STR_104(CODE[6]), STR_105(CODE[6]), STR_106(CODE[9]), STR_107(CODE[6]), 
;!		 -> STR_108(CODE[6]), STR_109(CODE[9]), STR_110(CODE[6]), STR_111(CODE[6]), 
;!		 -> STR_112(CODE[9]), STR_113(CODE[5]), STR_114(CODE[5]), STR_115(CODE[5]), 
;!		 -> STR_135(CODE[6]), STR_136(CODE[6]), STR_143(CODE[6]), STR_144(CODE[6]), 
;!		 -> STR_23(CODE[9]), STR_24(CODE[8]), STR_25(CODE[1]), STR_26(CODE[1]), 
;!		 -> STR_27(CODE[1]), STR_28(CODE[9]), STR_29(CODE[5]), STR_30(CODE[5]), 
;!		 -> STR_31(CODE[1]), STR_32(CODE[1]), STR_96(CODE[9]), value_back(COMRAM[5]), 
;!		 -> value_display(BANK2[10]), value_enable(BANK2[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), 
;!		 -> value_high_temp(BANK3[10]), value_highbp(BANK2[10]), value_low_pressure(BANK3[10]), value_plpbp(BANK3[10]), 
;!		 -> value_rlyhigh(BANK2[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(COMRAM[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strcpy@to	PTR unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@value_buf(COMRAM[15]), original_value(BANK3[10]), value_back(COMRAM[5]), 
;!		 -> value_display(BANK2[10]), value_enable(BANK2[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), 
;!		 -> value_high_temp(BANK3[10]), value_highbp(BANK2[10]), value_low_pressure(BANK3[10]), value_plpbp(BANK3[10]), 
;!		 -> value_rlyhigh(BANK2[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(COMRAM[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strlen@cp	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@value_buf(COMRAM[15]), STR_163(CODE[9]), STR_164(CODE[5]), 
;!		 -> STR_165(CODE[5]), STR_23(CODE[9]), STR_24(CODE[8]), STR_25(CODE[1]), 
;!		 -> STR_26(CODE[1]), STR_27(CODE[1]), STR_28(CODE[9]), STR_29(CODE[5]), 
;!		 -> STR_30(CODE[5]), STR_31(CODE[1]), STR_32(CODE[1]), value_back(COMRAM[5]), 
;!		 -> value_display(BANK2[10]), value_enable(BANK2[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), 
;!		 -> value_high_temp(BANK3[10]), value_highbp(BANK2[10]), value_low_pressure(BANK3[10]), value_plpbp(BANK3[10]), 
;!		 -> value_rlyhigh(BANK2[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(COMRAM[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    strlen@s	PTR const unsigned char  size(2) Largest target is 15
;!		 -> menu_draw_input@value_buf(BANK0[15]), menu_update_edit_value@value_buf(COMRAM[15]), STR_163(CODE[9]), STR_164(CODE[5]), 
;!		 -> STR_165(CODE[5]), STR_23(CODE[9]), STR_24(CODE[8]), STR_25(CODE[1]), 
;!		 -> STR_26(CODE[1]), STR_27(CODE[1]), STR_28(CODE[9]), STR_29(CODE[5]), 
;!		 -> STR_30(CODE[5]), STR_31(CODE[1]), STR_32(CODE[1]), value_back(COMRAM[5]), 
;!		 -> value_display(BANK2[10]), value_enable(BANK2[10]), value_hi_pressure(BANK3[10]), value_high_tbp(BANK3[10]), 
;!		 -> value_high_temp(BANK3[10]), value_highbp(BANK2[10]), value_low_pressure(BANK3[10]), value_plpbp(BANK3[10]), 
;!		 -> value_rlyhigh(BANK2[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), value_scale20(BANK2[10]), 
;!		 -> value_scale4(COMRAM[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), NULL(NULL[0]), 
;!
;!    temp_menu_template$label	PTR const unsigned char  size(2) Largest target is 13
;!		 -> STR_38(CODE[7]), STR_39(CODE[7]), STR_40(CODE[10]), STR_41(CODE[11]), 
;!		 -> STR_42(CODE[12]), STR_43(CODE[9]), STR_44(CODE[13]), STR_45(CODE[6]), 
;!		 -> STR_46(CODE[6]), STR_47(CODE[9]), STR_48(CODE[8]), STR_49(CODE[8]), 
;!		 -> STR_50(CODE[8]), STR_51(CODE[5]), STR_52(CODE[7]), STR_53(CODE[7]), 
;!		 -> STR_54(CODE[10]), STR_55(CODE[11]), STR_56(CODE[10]), STR_57(CODE[9]), 
;!		 -> STR_58(CODE[9]), STR_59(CODE[8]), STR_60(CODE[5]), STR_61(CODE[7]), 
;!		 -> STR_62(CODE[7]), STR_63(CODE[5]), STR_64(CODE[8]), STR_65(CODE[11]), 
;!		 -> STR_66(CODE[8]), STR_67(CODE[8]), STR_68(CODE[5]), STR_69(CODE[7]), 
;!		 -> STR_70(CODE[7]), STR_71(CODE[5]), STR_72(CODE[6]), STR_73(CODE[10]), 
;!		 -> STR_74(CODE[11]), STR_75(CODE[9]), STR_76(CODE[12]), STR_77(CODE[8]), 
;!		 -> STR_78(CODE[8]), STR_79(CODE[5]), 
;!
;!    temp_menu_template$value	PTR unsigned char  size(2) Largest target is 12
;!		 -> value_back(COMRAM[5]), value_display(BANK2[10]), value_enable(BANK2[10]), value_hi_pressure(BANK3[10]), 
;!		 -> value_high_tbp(BANK3[10]), value_high_temp(BANK3[10]), value_highbp(BANK2[10]), value_low_pressure(BANK3[10]), 
;!		 -> value_plpbp(BANK3[10]), value_rlyhigh(BANK2[10]), value_rlyplp(BANK3[10]), value_rlyslp(BANK3[10]), 
;!		 -> value_scale20(BANK2[10]), value_scale4(COMRAM[10]), value_sensor(BANK2[12]), value_slpbp(BANK3[10]), 
;!		 -> NULL(NULL[0]), 
;!
;!    uart_print@str	PTR const unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK1[40]), 
;!		 -> main@buf_586(BANK1[30]), menu_draw_input@buf(BANK0[50]), menu_handle_button@buf(BANK2[50]), menu_handle_button@buf_1233(BANK2[50]), 
;!		 -> menu_handle_encoder@buf(BANK0[50]), menu_update_numeric_value@debug(BANK0[50]), menu_update_time_value@debug(BANK1[50]), menu_update_time_value@debug_after(BANK1[50]), 
;!		 -> menu_update_time_value@debug_before(BANK1[50]), rebuild_input_menu@buf(BANK0[30]), rebuild_input_menu@buf_1092(BANK0[50]), STR_1(CODE[28]), 
;!		 -> STR_10(CODE[19]), STR_121(CODE[26]), STR_123(CODE[31]), STR_125(CODE[33]), 
;!		 -> STR_13(CODE[20]), STR_138(CODE[41]), STR_14(CODE[15]), STR_15(CODE[26]), 
;!		 -> STR_151(CODE[27]), STR_18(CODE[22]), STR_19(CODE[33]), STR_2(CODE[23]), 
;!		 -> STR_22(CODE[36]), STR_5(CODE[22]), STR_6(CODE[19]), STR_7(CODE[24]), 
;!		 -> STR_8(CODE[22]), STR_81(CODE[29]), STR_9(CODE[22]), 
;!
;!    uart_println@str	PTR const unsigned char  size(2) Largest target is 60
;!		 -> handle_numeric_rotation@buf(BANK0[50]), handle_time_rotation@buf(BANK0[50]), init_time_editor@buf(BANK0[60]), main@buf(BANK1[40]), 
;!		 -> main@buf_586(BANK1[30]), menu_draw_input@buf(BANK0[50]), menu_handle_button@buf(BANK2[50]), menu_handle_button@buf_1233(BANK2[50]), 
;!		 -> menu_handle_encoder@buf(BANK0[50]), menu_update_numeric_value@debug(BANK0[50]), menu_update_time_value@debug(BANK1[50]), menu_update_time_value@debug_after(BANK1[50]), 
;!		 -> menu_update_time_value@debug_before(BANK1[50]), rebuild_input_menu@buf(BANK0[30]), rebuild_input_menu@buf_1092(BANK0[50]), STR_1(CODE[28]), 
;!		 -> STR_10(CODE[19]), STR_121(CODE[26]), STR_123(CODE[31]), STR_125(CODE[33]), 
;!		 -> STR_13(CODE[20]), STR_138(CODE[41]), STR_14(CODE[15]), STR_15(CODE[26]), 
;!		 -> STR_151(CODE[27]), STR_18(CODE[22]), STR_19(CODE[33]), STR_2(CODE[23]), 
;!		 -> STR_22(CODE[36]), STR_5(CODE[22]), STR_6(CODE[19]), STR_7(CODE[24]), 
;!		 -> STR_8(CODE[22]), STR_81(CODE[29]), STR_9(CODE[22]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _menu_update_numeric_value->_sprintf
;!    _menu_update_edit_value->_lcd_set_cursor
;!    _menu_update_edit_value->_strcpy
;!    _menu_handle_encoder->_sprintf
;!    _menu_handle_button->_init_time_editor
;!    _rebuild_input_menu->_sprintf
;!    _menu_update_time_value->_sprintf
;!    _menu_draw_setup->_lcd_print_at
;!    _menu_draw_options->_lcd_print_at
;!    _menu_draw_input->_sprintf
;!    _lcd_print_at->_lcd_set_cursor
;!    _lcd_clear_line->_lcd_set_cursor
;!    _lcd_set_cursor->_lcd_cmd
;!    _lcd_print->_lcd_data
;!    _lcd_data->_lcd_write_nibble
;!    _init_time_editor->_sprintf
;!    _init_numeric_editor->___lwdiv
;!    _lcd_init->_lcd_cmd
;!    _lcd_clear->_lcd_cmd
;!    _lcd_cmd->_lcd_write_nibble
;!    _handle_time_rotation->_sprintf
;!    _handle_numeric_rotation->_sprintf
;!    _uart_println->_uart_print
;!    _uart_print->_uart_write
;!    _sprintf->___lwdiv
;!    ___lwdiv->___lwmod
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
;!    _main->_menu_draw_input
;!    _menu_handle_button->_menu_draw_input
;!    _menu_handle_button->_rebuild_input_menu
;!
;!Critical Paths under _isr in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    _main->_menu_handle_button
;!    _menu_handle_button->_menu_update_time_value
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
;! (0) _main                                                78    78      0  328541
;!                                            163 BANK1     78    78      0
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
;!                            _sprintf
;!                        _system_init
;!                          _uart_init
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _system_init                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_numeric_value                           77    77      0   19372
;!                                              0 BANK0     77    77      0
;!                   _is_numeric_field
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_edit_value                              32    32      0    7980
;!                                             20 COMRAM    32    32      0
;!                   _get_item_options
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                             _strcpy
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (1) _menu_init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_encoder                                 60    58      2   15992
;!                                             57 COMRAM     2     0      2
;!                                              0 BANK0     58    58      0
;!                   _get_item_options
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_handle_button                                 121   121      0  148924
;!                                            158 BANK1      5     5      0
;!                                              0 BANK2    116   116      0
;!                             ___wmul
;!                               _beep
;!          _get_current_numeric_value
;!                   _get_item_options
;!                _init_numeric_editor
;!                   _init_time_editor
;!                   _is_numeric_field
;!                      _is_time_field
;!                    _menu_draw_input
;!                  _menu_draw_options
;!                    _menu_draw_setup
;!             _menu_update_time_value
;!                 _rebuild_input_menu
;!                _save_current_config
;!                            _sprintf
;!                             _strcmp
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _rebuild_input_menu                                 104   104      0   23532
;!                                             57 COMRAM     1     1      0
;!                                              0 BANK0    103   103      0
;!                            ___lwdiv
;!                            ___lwmod
;!                             _memcpy
;!                            _sprintf
;!                             _strcpy
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _menu_update_time_value                             159   159      0   19986
;!                                              0 BANK1    158   158      0
;!                            ___lbdiv
;!                            ___lbmod
;!                      _is_time_field
;!                          _lcd_print
;!                     _lcd_set_cursor
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _is_time_field                                        2     2      0      90
;!                                             14 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (2) ___lbmod                                              4     3      1     311
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) ___lbdiv                                              4     3      1     314
;!                                             14 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_setup                                     27    27      0   12142
;!                                             24 COMRAM    27    27      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                             _strlen
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_options                                    6     6      0   11247
;!                                             24 COMRAM     6     6      0
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;! ---------------------------------------------------------------------------------
;! (2) _menu_draw_input                                    103   103      0   33941
;!                                              0 BANK0    103   103      0
;!                   _get_item_options
;!                   _is_numeric_field
;!                     _lcd_clear_line
;!                          _lcd_print
;!                       _lcd_print_at
;!                     _lcd_set_cursor
;!                            _sprintf
;!                             _strcmp
;!                             _strcpy
;!                             _strlen
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _strlen                                               4     2      2     622
;!                                             14 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (2) _strcpy                                               6     2      4    2811
;!                                             14 COMRAM     6     2      4
;! ---------------------------------------------------------------------------------
;! (2) _strcmp                                               7     3      4     395
;!                                             14 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (3) _lcd_print_at                                         4     1      3    5202
;!                                             20 COMRAM     4     1      3
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (3) _lcd_clear_line                                       1     1      0    3638
;!                                             20 COMRAM     1     1      0
;!                          _lcd_print
;!                     _lcd_set_cursor
;! ---------------------------------------------------------------------------------
;! (2) _lcd_set_cursor                                       3     2      1    1387
;!                                             17 COMRAM     3     2      1
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (2) _lcd_print                                            2     0      2    2229
;!                                             16 COMRAM     2     0      2
;!                           _lcd_data
;! ---------------------------------------------------------------------------------
;! (3) _lcd_data                                             1     1      0     132
;!                                             15 COMRAM     1     1      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (2) _is_numeric_field                                     2     2      0     112
;!                                             14 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (2) _get_item_options                                     4     2      2     112
;!                                             14 COMRAM     4     2      2
;! ---------------------------------------------------------------------------------
;! (2) _init_time_editor                                    63    60      3   18887
;!                                             57 COMRAM     3     0      3
;!                                              0 BANK0     60    60      0
;!                            ___lwdiv
;!                            ___lwmod
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (2) _init_numeric_editor                                  9     7      2    3786
;!                                             26 COMRAM     9     7      2
;!                            ___lwdiv
;!                            ___lwmod
;! ---------------------------------------------------------------------------------
;! (2) _get_current_numeric_value                           10     8      2      46
;!                                             14 COMRAM    10     8      2
;! ---------------------------------------------------------------------------------
;! (2) _beep                                                 5     3      2    1642
;!                                             14 COMRAM     5     3      2
;! ---------------------------------------------------------------------------------
;! (1) _lcd_init                                             2     2      0     264
;!                                             17 COMRAM     2     2      0
;!                            _lcd_cmd
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (1) _lcd_clear                                            1     1      0     176
;!                                             17 COMRAM     1     1      0
;!                            _lcd_cmd
;! ---------------------------------------------------------------------------------
;! (3) _lcd_cmd                                              2     2      0     176
;!                                             15 COMRAM     2     2      0
;!                   _lcd_write_nibble
;! ---------------------------------------------------------------------------------
;! (4) _lcd_write_nibble                                     1     1      0      88
;!                                             14 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _handle_time_rotation                                53    53      0   15232
;!                                              0 BANK0     53    53      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _handle_numeric_rotation                             54    54      0   15365
;!                                              0 BANK0     54    54      0
;!                            _sprintf
;!                       _uart_println
;! ---------------------------------------------------------------------------------
;! (1) _uart_println                                         2     0      2    2923
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
;! (1) _sprintf                                             35    23     12   12107
;!                                             26 COMRAM    31    19     12
;!                            ___lwdiv
;!                            ___lwmod
;!                             ___wmul
;!                            _isdigit
;! ---------------------------------------------------------------------------------
;! (2) _isdigit                                              3     3      0      68
;!                                             14 COMRAM     3     3      0
;! ---------------------------------------------------------------------------------
;! (2) ___wmul                                               6     2      4    1715
;!                                             14 COMRAM     6     2      4
;!           _get_menu_timeout_seconds (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___lwmod                                              5     1      4    1779
;!                                             14 COMRAM     5     1      4
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4    1682
;!                                             19 COMRAM     7     3      4
;!                            ___lwmod (ARG)
;! ---------------------------------------------------------------------------------
;! (1) _get_menu_timeout_seconds                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _encoder_init                                         2     2      0       0
;!                                             14 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _eeprom_init                                          5     5      0    5057
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
;! (2) _save_current_config                                  3     3      0    2288
;!                                             27 COMRAM     3     3      0
;!          _calculate_config_checksum
;!                 _eeprom_write_block
;!                  _eeprom_write_word
;! ---------------------------------------------------------------------------------
;! (3) _eeprom_write_word                                    4     0      4     764
;!                                             17 COMRAM     4     0      4
;!                  _eeprom_write_byte
;! ---------------------------------------------------------------------------------
;! (3) _eeprom_write_block                                  10     4      6    1136
;!                                             17 COMRAM    10     4      6
;!                  _eeprom_write_byte
;! ---------------------------------------------------------------------------------
;! (4) _eeprom_write_byte                                    3     0      3     523
;!                                             14 COMRAM     3     0      3
;! ---------------------------------------------------------------------------------
;! (3) _calculate_config_checksum                           12    10      2     275
;!                                             14 COMRAM    12    10      2
;! ---------------------------------------------------------------------------------
;! (2) _load_factory_defaults                                0     0      0    1055
;!                             _memcpy
;! ---------------------------------------------------------------------------------
;! (3) _memcpy                                              11     5      6    1055
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
;!     _get_item_options
;!     _is_numeric_field
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
;!     _uart_println
;!   _menu_draw_options
;!     _lcd_clear_line
;!     _lcd_print
;!     _lcd_print_at
;!   _menu_draw_setup
;!     _lcd_clear_line
;!     _lcd_print
;!     _lcd_print_at
;!     _strlen
;!   _menu_handle_button
;!     ___wmul
;!     _beep
;!     _get_current_numeric_value
;!     _get_item_options
;!     _init_numeric_editor
;!       ___lwdiv
;!       ___lwmod
;!     _init_time_editor
;!       ___lwdiv
;!       ___lwmod
;!       _sprintf
;!       _uart_println
;!     _is_numeric_field
;!     _is_time_field
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
;!     _get_item_options
;!     _sprintf
;!     _uart_println
;!   _menu_init
;!   _menu_update_edit_value
;!     _get_item_options
;!     _lcd_print
;!     _lcd_set_cursor
;!     _strcpy
;!     _strlen
;!   _menu_update_numeric_value
;!     _is_numeric_field
;!     _lcd_print
;!     _lcd_set_cursor
;!     _sprintf
;!     _uart_println
;!   _menu_update_time_value
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
;!BANK3              100      0      A0      11       62.5%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100     74      FE       9       99.2%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100     F1     100       7      100.0%
;!BITBANK15           80      0       0      34        0.0%
;!BANK15              80      0       0      35        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80     67      7F       5       99.2%
;!BITCOMRAM           7E      0       0       0        0.0%
;!COMRAM              7E     3C      6F       1       88.1%
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
;!ABS                  0      0     40C      47        0.0%
;!DATA                 0      0     58C       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 246 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf            30  205[BANK1 ] unsigned char [30]
;;  current_even    1  238[BANK1 ] unsigned char 
;;  buf            40  165[BANK1 ] unsigned char [40]
;;  delta           2  239[BANK1 ] int 
;;  last_encoder    2  236[BANK1 ] int 
;;  last_button     1  235[BANK1 ] unsigned char 
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
;;      Locals:         0       0      76       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       2       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0      78       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       78 bytes
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
	line	246
global __ptext0
__ptext0:
psect	text0
	file	"src\main.c"
	line	246
	
_main:
;incstack = 0
	callstack 23
	line	249
	
l6745:
	call	_system_init	;wreg free
	line	250
	
l6747:
	call	_eeprom_init	;wreg free
	line	257
	
l6749:; BSR set to: 4

	call	_get_menu_timeout_seconds	;wreg free
	movlb	1	; () banked
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
	line	259
	
l6751:
	call	_uart_init	;wreg free
	line	260
	
l6753:
	call	_encoder_init	;wreg free
	line	261
	
l6755:
	call	_menu_init	;wreg free
	line	262
	
l6757:; BSR set to: 0

	call	_lcd_init	;wreg free
	line	264
	
l6759:
		movlw	low(STR_1)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_1)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	265
	
l6761:
		movlw	low(STR_2)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_2)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	267
	
l6763:
	call	_lcd_clear	;wreg free
	line	268
	
l6765:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	269
	
l6767:
		movlw	low(STR_3)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_3)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	270
	
l6769:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	271
	
l6771:
		movlw	low(STR_4)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_4)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	273
	
l6773:
		movlw	low(STR_5)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_5)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	274
	
l6775:
		movlw	low(STR_6)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_6)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	275
	
l6777:
		movlw	low(STR_7)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_7)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	277
	
l6779:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	278
	
l6781:
	asmopt push
asmopt off
movlw  5
	movlb	1	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	15
movwf	(??_main+0+0)&0ffh
	movlw	241
u8147:
decfsz	wreg,f
	bra	u8147
	decfsz	(??_main+0+0)&0ffh,f
	bra	u8147
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u8147
asmopt pop

	line	279
	
l6783:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	281
	
l6785:
		movlw	low(STR_8)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_8)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	282
	
l6787:
		movlw	low(STR_9)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_9)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	284
	
l6789:
	asmopt push
asmopt off
movlw  41
	movlb	1	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	150
movwf	(??_main+0+0)&0ffh
	movlw	127
u8157:
decfsz	wreg,f
	bra	u8157
	decfsz	(??_main+0+0)&0ffh,f
	bra	u8157
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u8157
asmopt pop

	line	288
	
l6791:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_current_menu))&0ffh
	line	289
	
l6793:; BSR set to: 1

	movlw	low(05h)
	movlb	0	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	291
	
l6795:; BSR set to: 0

	call	_menu_draw_options	;wreg free
	line	292
	
l6797:
		movlw	low(STR_10)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_10)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	295
	
l6799:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((main@last_encoder+1))&0ffh
	movlw	low(0)
	movwf	((main@last_encoder))&0ffh
	line	296
	
l6801:; BSR set to: 1

	movlw	low(0)
	movwf	((main@last_button))&0ffh
	line	303
	
l6803:
	movlb	1	; () banked
	movf	((main@last_encoder))&0ffh,w
xorwf	((_encoder_count))&0ffh,w	;volatile
	bnz	u7740
movf	((main@last_encoder+1))&0ffh,w
xorwf	((_encoder_count+1))&0ffh,w	;volatile
	btfsc	status,2
	goto	u7741
	goto	u7740

u7741:
	goto	l6861
u7740:
	line	305
	
l6805:; BSR set to: 1

	movf	((main@last_encoder))&0ffh,w
	subwf	((_encoder_count))&0ffh,w	;volatile
	movwf	((main@delta))&0ffh
	movf	((main@last_encoder+1))&0ffh,w
	subwfb	((_encoder_count+1))&0ffh,w	;volatile
	movwf	1+((main@delta))&0ffh
	line	308
	
l6807:; BSR set to: 1

	movlw	high(01h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	311
	
l6809:
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
	line	312
	
l6811:
		movlw	low(main@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	314
	
l6813:
	movff	(_encoder_count),(main@last_encoder)	;volatile
	movff	(_encoder_count+1),(main@last_encoder+1)	;volatile
	line	317
	
l6815:
	movlw	high(01F4h)
	movlb	1	; () banked
	movwf	((main@encoder_activity_timer+1))&0ffh
	movlw	low(01F4h)
	movwf	((main@encoder_activity_timer))&0ffh
	line	320
	
l6817:; BSR set to: 1

	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u7751
	goto	u7750
u7751:
	goto	l192
u7750:
	line	322
	
l6819:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	323
	
l192:; BSR set to: 0

	line	326
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u7761
	goto	u7760
u7761:
	goto	l6831
u7760:
	
l6821:; BSR set to: 0

	movlb	1	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7771
	goto	u7770

u7771:
	goto	l6831
u7770:
	line	328
	
l6823:; BSR set to: 1

	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u7781
	goto	u7780
u7781:
	goto	l6827
u7780:
	line	331
	
l6825:
	movlb	1	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_numeric_rotation
	line	332
	goto	l6835
	line	333
	
l6827:
	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u7791
	goto	u7790
u7791:
	goto	l6831
u7790:
	line	336
	
l6829:
	movlb	1	; () banked
	movf	((main@delta))&0ffh,w
	
	call	_handle_time_rotation
	line	337
	call	_menu_update_time_value	;wreg free
	line	338
	goto	l6835
	line	342
	
l6831:
	movff	(main@delta),(c:menu_handle_encoder@delta)
	movff	(main@delta+1),(c:menu_handle_encoder@delta+1)
	call	_menu_handle_encoder	;wreg free
	line	352
	
l6835:
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u7801
	goto	u7800
u7801:
	goto	l6849
u7800:
	
l6837:; BSR set to: 0

	movlb	1	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7811
	goto	u7810

u7811:
	goto	l6849
u7810:
	line	355
	
l6839:; BSR set to: 1

	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u7821
	goto	u7820
u7821:
	goto	l6843
u7820:
	line	358
	
l6841:
	call	_menu_update_numeric_value	;wreg free
	line	359
	goto	l6861
	line	360
	
l6843:
	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u7831
	goto	u7830
u7831:
	goto	l6847
u7830:
	line	363
	
l6845:
	call	_menu_update_time_value	;wreg free
	line	364
	goto	l6861
	line	368
	
l6847:
	call	_menu_update_edit_value	;wreg free
	goto	l6861
	line	374
	
l6849:
	movlb	1	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7841
	goto	u7840
u7841:
	goto	l6853
u7840:
	line	376
	
l6851:; BSR set to: 1

	call	_menu_draw_options	;wreg free
	line	377
	goto	l6861
	line	378
	
l6853:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7851
	goto	u7850

u7851:
	goto	l6857
u7850:
	line	380
	
l6855:; BSR set to: 1

	call	_menu_draw_input	;wreg free
	line	381
	goto	l6861
	line	382
	
l6857:; BSR set to: 1

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7861
	goto	u7860

u7861:
	goto	l6861
u7860:
	line	384
	
l6859:; BSR set to: 1

	call	_menu_draw_setup	;wreg free
	line	390
	
l6861:
	movlb	1	; () banked
	movf	((main@last_button))&0ffh,w
xorwf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u7871
	goto	u7870

u7871:
	goto	l6937
u7870:
	line	392
	
l6863:; BSR set to: 1

	movf	((_button_event))&0ffh,w	;volatile
	btfsc	status,2
	goto	u7881
	goto	u7880
u7881:
	goto	l6933
u7880:
	line	394
	
l6865:; BSR set to: 1

	movff	(_button_event),(main@current_event)	;volatile
	line	395
	
l6867:; BSR set to: 1

	movlw	low(0)
	movwf	((_button_event))&0ffh	;volatile
	line	398
	
l6869:; BSR set to: 1

		movlw	low(main@buf_586)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(main@buf_586)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_12)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_12)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(main@current_event),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	399
	
l6871:
		movlw	low(main@buf_586)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(main@buf_586)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	402
	
l6873:
		movlw	2
	movlb	1	; () banked
	xorwf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u7891
	goto	u7890

u7891:
	goto	l6909
u7890:
	line	404
	
l6875:; BSR set to: 1

		movlw	low(STR_13)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_13)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	407
	
l6877:
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u7901
	goto	u7900
u7901:
	goto	l6891
u7900:
	line	410
	
l6879:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	411
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	412
	movlw	low(0)
	movwf	(0+(_menu+08h))&0ffh
	line	416
	
l6881:; BSR set to: 0

	movlb	1	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movlb	0	; () banked
	movwf	((_enable_edit_flag))&0ffh
	line	417
	
l6883:; BSR set to: 0

	movlb	1	; () banked
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
	movwf	((_sensor_edit_flag))&0ffh
	line	419
	
l6885:; BSR set to: 0

		movlw	low(STR_14)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_14)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	422
	
l6887:
	movlb	1	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7911
	goto	u7910

u7911:
	goto	l6933
u7910:
	line	423
	
l6889:; BSR set to: 1

	call	_menu_draw_input	;wreg free
	goto	l6933
	line	429
	
l6891:; BSR set to: 0

	movlb	1	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7921
	goto	u7920
u7921:
	goto	l6897
u7920:
	line	431
	
l6893:; BSR set to: 1

	setf	((_current_menu))&0ffh
	line	432
	
l6895:; BSR set to: 1

		movlw	low(STR_15)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_15)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	433
	goto	l6933
	line	434
	
l6897:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7931
	goto	u7930

u7931:
	goto	l6903
u7930:
	line	436
	
l6899:; BSR set to: 1

	movlw	low(02h)
	movwf	((_current_menu))&0ffh
	line	437
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_menu))&0ffh
	line	438
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	439
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	440
	
l6901:
	call	_menu_draw_setup	;wreg free
	line	441
	goto	l6933
	line	442
	
l6903:; BSR set to: 1

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7941
	goto	u7940

u7941:
	goto	l223
u7940:
	line	444
	
l6905:; BSR set to: 1

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	445
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_menu))&0ffh
	line	446
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	447
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	448
	
l6907:
	call	_menu_draw_options	;wreg free
	goto	l6933
	line	453
	
l6909:; BSR set to: 1

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7951
	goto	u7950

u7951:
	goto	l6919
u7950:
	line	455
	
l6911:; BSR set to: 1

		decf	((main@current_event))&0ffh,w
	btfss	status,2
	goto	u7961
	goto	u7960

u7961:
	goto	l6933
u7960:
	line	457
	
l6913:; BSR set to: 1

	movlw	low(0)
	movwf	((_current_menu))&0ffh
	line	458
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_menu))&0ffh
	line	459
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	460
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	461
	
l6915:; BSR set to: 0

	call	_menu_draw_options	;wreg free
	line	462
	
l6917:
	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	goto	l6933
	line	468
	
l6919:; BSR set to: 1

	movf	((main@current_event))&0ffh,w
	
	call	_menu_handle_button
	line	471
	
l6921:
	movlb	1	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7971
	goto	u7970
u7971:
	goto	l6925
u7970:
	goto	l6907
	line	473
	
l6925:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7981
	goto	u7980

u7981:
	goto	l6929
u7980:
	goto	l6889
	line	475
	
l6929:; BSR set to: 1

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7991
	goto	u7990

u7991:
	goto	l223
u7990:
	goto	l6901
	line	477
	
l223:; BSR set to: 1

	line	479
	
l6933:
	movff	(_button_event),(main@last_button)	;volatile
	line	480
	
l6935:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	485
	
l6937:; BSR set to: 1

		incf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u8001
	goto	u8000

u8001:
	goto	l6947
u8000:
	
l6939:; BSR set to: 1

		incf	((main@last_menu_state))&0ffh,w
	btfsc	status,2
	goto	u8011
	goto	u8010

u8011:
	goto	l6947
u8010:
	line	488
	
l6941:; BSR set to: 1

	call	_lcd_clear	;wreg free
	line	489
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	490
	
l6943:
		movlw	low(STR_16)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_16)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	491
	
l6945:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	492
		movlw	low(STR_17)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_17)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	493
		movlw	low(STR_18)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_18)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	495
	
l6947:
	movff	(_current_menu),(main@last_menu_state)
	line	498
	
l6949:
	movlb	1	; () banked
	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfsc	status,2
	goto	u8021
	goto	u8020

u8021:
	goto	l6953
u8020:
	line	500
	
l6951:; BSR set to: 1

	decf	((main@encoder_activity_timer))&0ffh
	btfss	status,0
	decf	((main@encoder_activity_timer+1))&0ffh
	line	504
	
l6953:; BSR set to: 1

	movlw	low(01h)
	addwf	((main@blink_timer))&0ffh
	movlw	0
	addwfc	((main@blink_timer+1))&0ffh
	addwfc	((main@blink_timer+2))&0ffh
	addwfc	((main@blink_timer+3))&0ffh
	line	505
	
l6955:; BSR set to: 1

		movf	((main@blink_timer+3))&0ffh,w
	iorwf	((main@blink_timer+2))&0ffh,w
	bnz	u8030
	movlw	16
	subwf	 ((main@blink_timer))&0ffh,w
	movlw	39
	subwfb	((main@blink_timer+1))&0ffh,w
	btfss	status,0
	goto	u8031
	goto	u8030

u8031:
	goto	l6977
u8030:
	line	507
	
l6957:; BSR set to: 1

	movlw	low(0)
	movwf	((main@blink_timer))&0ffh
	movlw	high(0)
	movwf	((main@blink_timer+1))&0ffh
	movlw	low highword(0)
	movwf	((main@blink_timer+2))&0ffh
	movlw	high highword(0)
	movwf	((main@blink_timer+3))&0ffh
	line	508
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u8041
	goto	u8040
u8041:
	goto	l6975
u8040:
	line	511
	
l6959:; BSR set to: 0

	movlb	1	; () banked
	movf	((main@encoder_activity_timer))&0ffh,w
iorwf	((main@encoder_activity_timer+1))&0ffh,w
	btfss	status,2
	goto	u8051
	goto	u8050

u8051:
	goto	l6977
u8050:
	line	513
	
l6961:; BSR set to: 1

	movlb	0	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u8061
	goto	u8060
u8061:
	movlw	1
	goto	u8070
u8060:
	movlw	0
u8070:
	movwf	(0+(_menu+05h))&0ffh
	line	517
	
l6963:; BSR set to: 0

	movlb	1	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u8081
	goto	u8080

u8081:
	goto	l6977
u8080:
	line	520
	
l6965:; BSR set to: 1

	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u8091
	goto	u8090
u8091:
	goto	l6969
u8090:
	line	523
	
l6967:
	call	_menu_update_numeric_value	;wreg free
	line	524
	goto	l6977
	line	525
	
l6969:
	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u8101
	goto	u8100
u8101:
	goto	l6973
u8100:
	line	528
	
l6971:
	call	_menu_update_time_value	;wreg free
	line	529
	goto	l6977
	line	533
	
l6973:
	call	_menu_update_edit_value	;wreg free
	goto	l6977
	line	540
	
l6975:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	554
	
l6977:
		movlw	03h-0
	movlb	1	; () banked
	cpfslt	((_current_menu))&0ffh
	goto	u8111
	goto	u8110

u8111:
	goto	l7011
u8110:
	line	556
	
l6979:; BSR set to: 1

	movf	((_menu_timeout_flag))&0ffh,w	;volatile
	btfss	status,2
	goto	u8121
	goto	u8120
u8121:
	goto	l7011
u8120:
	line	558
	
l6981:; BSR set to: 1

		movlw	low(STR_19)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_19)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	561
	
l6983:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	562
	
l6985:
	asmopt push
asmopt off
movlw  3
	movlb	1	; () banked
movwf	(??_main+0+0+1)&0ffh
movlw	8
movwf	(??_main+0+0)&0ffh
	movlw	119
u8167:
decfsz	wreg,f
	bra	u8167
	decfsz	(??_main+0+0)&0ffh,f
	bra	u8167
	decfsz	(??_main+0+0+1)&0ffh,f
	bra	u8167
asmopt pop

	line	563
	
l6987:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	566
	
l6989:
	movlb	1	; () banked
	setf	((_current_menu))&0ffh
	line	567
	
l6991:; BSR set to: 1

	movlw	low(0)
	movlb	0	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	568
	
l6993:; BSR set to: 0

	movlw	low(0)
	movwf	((_menu))&0ffh
	line	569
	
l6995:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	572
	
l6997:; BSR set to: 0

	call	_lcd_clear	;wreg free
	line	573
	
l6999:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(0)&0ffh
	
	call	_lcd_set_cursor
	line	574
	
l7001:
		movlw	low(STR_20)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_20)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	575
	
l7003:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlw	(01h)&0ffh
	
	call	_lcd_set_cursor
	line	576
	
l7005:
		movlw	low(STR_21)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_21)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	579
	
l7007:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	580
	
l7009:; BSR set to: 1

	movlw	high(0)
	movwf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_menu_timeout_timer))^00h,c	;volatile
	line	585
	
l7011:; BSR set to: 1

	movf	((_long_press_beep_flag))&0ffh,w	;volatile
	btfsc	status,2
	goto	u8131
	goto	u8130
u8131:
	goto	l7019
u8130:
	line	587
	
l7013:; BSR set to: 1

	movlw	low(0)
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	line	588
	
l7015:; BSR set to: 1

	movlw	high(01F4h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(01F4h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	589
	
l7017:
		movlw	low(STR_22)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_22)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	601
	
l7019:
	asmopt push
asmopt off
	movlw	133
u8177:
decfsz	wreg,f
	bra	u8177
	nop
asmopt pop

	goto	l6803
	global	start
	goto	start
	callstack 0
	line	603
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_uart_init

;; *************** function _uart_init *****************
;; Defined at:
;;		line 50 in file "src\main.c"
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
	line	50
global __ptext1
__ptext1:
psect	text1
	file	"src\main.c"
	line	50
	
_uart_init:
;incstack = 0
	callstack 28
	line	52
	
l5107:
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	53
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	55
	
l5109:
	movlw	low(024h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	56
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	57
	movlw	low(08h)
	movwf	((c:4024))^0f00h,c	;volatile
	line	59
	movlw	low(044h)
	movwf	((c:4015))^0f00h,c	;volatile
	line	60
	movlw	low(0)
	movwf	((c:4016))^0f00h,c	;volatile
	line	61
	
l105:
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2,group=0
	line	86
global __ptext2
__ptext2:
psect	text2
	file	"src\main.c"
	line	86
	
_system_init:
;incstack = 0
	callstack 28
	line	88
	
l5111:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	89
	movlw	low(040h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	92
	
l123:
	line	91
	btfss	((c:4051))^0f00h,c,2	;volatile
	goto	u4931
	goto	u4930
u4931:
	goto	l123
u4930:
	line	94
	
l5113:
	movlw	low(0Fh)
	movwf	((c:4033))^0f00h,c	;volatile
	line	96
	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	97
	movlw	low(0)
	movwf	((c:3978))^0f00h,c	;volatile
	line	98
	movlw	low(0)
	movwf	((c:3979))^0f00h,c	;volatile
	line	100
	
l5115:
	bcf	((c:3988))^0f00h,c,2	;volatile
	line	101
	
l5117:
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	103
	
l5119:
	bsf	((c:3987))^0f00h,c,1	;volatile
	line	104
	
l5121:
	bsf	((c:3987))^0f00h,c,2	;volatile
	line	105
	
l5123:
	bsf	((c:3987))^0f00h,c,6	;volatile
	line	106
	
l5125:
	bcf	((c:4081))^0f00h,c,7	;volatile
	line	107
	
l126:
	return	;funcret
	callstack 0
GLOBAL	__end_of_system_init
	__end_of_system_init:
	signat	_system_init,89
	global	_menu_update_numeric_value

;; *************** function _menu_update_numeric_value *****************
;; Defined at:
;;		line 586 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  debug          50    0[BANK0 ] unsigned char [50]
;;  value_buf       6   69[BANK0 ] unsigned char [6]
;;  screen_line     1   76[BANK0 ] unsigned char 
;;  start_col       1   75[BANK0 ] unsigned char 
;;  item_idx        1   68[BANK0 ] unsigned char 
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
;;      Locals:         0      77       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0      77       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       77 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_is_numeric_field
;;		_lcd_print
;;		_lcd_set_cursor
;;		_sprintf
;;		_uart_println
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	586
global __ptext3
__ptext3:
psect	text3
	file	"src\menu.c"
	line	586
	
_menu_update_numeric_value:
;incstack = 0
	callstack 25
	line	590
	
l5431:
		movlw	low(STR_125)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_125)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	593
	
l5433:
	movlb	1	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u5511
	goto	u5510

u5511:
	goto	l595
u5510:
	
l5435:; BSR set to: 1

	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u5521
	goto	u5520
u5521:
	goto	l5437
u5520:
	goto	l595
	line	597
	
l5437:; BSR set to: 0

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((menu_update_numeric_value@screen_line))&0ffh
	line	598
		movlw	03h-1
	cpfsgt	((menu_update_numeric_value@screen_line))&0ffh
	goto	u5531
	goto	u5530

u5531:
	goto	l596
u5530:
	goto	l595
	line	599
	
l596:; BSR set to: 0

	line	602
	movff	(_menu),(menu_update_numeric_value@item_idx)
	line	605
	
l5441:; BSR set to: 0

	movf	((menu_update_numeric_value@item_idx))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfss	status,2
	goto	u5541
	goto	u5540
u5541:
	goto	l5445
u5540:
	goto	l595
	line	609
	
l5445:
	lfsr	2,(menu_update_numeric_value@value_buf)
	movlw	6-1
u5551:
	clrf	postinc2
	decf	wreg
	bc	u5551
	line	611
	
l5447:
	movlb	0	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u5561
	goto	u5560
u5561:
	goto	l5483
u5560:
	line	615
	
l5449:; BSR set to: 0

		movlw	low(menu_update_numeric_value@debug)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_126)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_126)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+08h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+05h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	616
	
l5451:
		movlw	low(menu_update_numeric_value@debug)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	619
	
l5453:
	movlb	0	; () banked
		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u5571
	goto	u5570

u5571:
	goto	l5457
u5570:
	
l5455:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u5581
	goto	u5580
u5581:
	goto	l5459
u5580:
	
l5457:; BSR set to: 0

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((_menu_update_numeric_value$1117))&0ffh
	clrf	1+((_menu_update_numeric_value$1117))&0ffh
	movlw	high(030h)
	addwfc	1+((_menu_update_numeric_value$1117))&0ffh
	goto	l5461
	
l5459:; BSR set to: 0

	movlw	high(020h)
	movwf	((_menu_update_numeric_value$1117+1))&0ffh
	movlw	low(020h)
	movwf	((_menu_update_numeric_value$1117))&0ffh
	
l5461:; BSR set to: 0

	movff	(_menu_update_numeric_value$1117),(menu_update_numeric_value@value_buf)
	line	620
	
l5463:; BSR set to: 0

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u5591
	goto	u5590

u5591:
	goto	l5467
u5590:
	
l5465:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u5601
	goto	u5600
u5601:
	goto	l5469
u5600:
	
l5467:; BSR set to: 0

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((_menu_update_numeric_value$1118))&0ffh
	clrf	1+((_menu_update_numeric_value$1118))&0ffh
	movlw	high(030h)
	addwfc	1+((_menu_update_numeric_value$1118))&0ffh
	goto	l5471
	
l5469:; BSR set to: 0

	movlw	high(020h)
	movwf	((_menu_update_numeric_value$1118+1))&0ffh
	movlw	low(020h)
	movwf	((_menu_update_numeric_value$1118))&0ffh
	
l5471:; BSR set to: 0

	movff	(_menu_update_numeric_value$1118),0+(menu_update_numeric_value@value_buf+01h)
	line	621
	
l5473:; BSR set to: 0

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u5611
	goto	u5610

u5611:
	goto	l5477
u5610:
	
l5475:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u5621
	goto	u5620
u5621:
	goto	l5479
u5620:
	
l5477:; BSR set to: 0

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((_menu_update_numeric_value$1119))&0ffh
	clrf	1+((_menu_update_numeric_value$1119))&0ffh
	movlw	high(030h)
	addwfc	1+((_menu_update_numeric_value$1119))&0ffh
	goto	l5481
	
l5479:; BSR set to: 0

	movlw	high(020h)
	movwf	((_menu_update_numeric_value$1119+1))&0ffh
	movlw	low(020h)
	movwf	((_menu_update_numeric_value$1119))&0ffh
	
l5481:; BSR set to: 0

	movff	(_menu_update_numeric_value$1119),0+(menu_update_numeric_value@value_buf+02h)
	line	622
	movlw	low(0)
	movwf	(0+(menu_update_numeric_value@value_buf+03h))&0ffh
	line	623
	goto	l619
	line	627
	
l5483:; BSR set to: 0

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u5631
	goto	u5630
u5631:
	goto	l5487
u5630:
	
l5485:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u5641
	goto	u5640
u5641:
	goto	l5495
u5640:
	
l5487:; BSR set to: 0

	movf	(0+(_menu+09h))&0ffh,w
	btfss	status,2
	goto	u5651
	goto	u5650
u5651:
	goto	l5491
u5650:
	
l5489:; BSR set to: 0

	movlw	high(02Bh)
	movwf	((_menu_update_numeric_value$1121+1))&0ffh
	movlw	low(02Bh)
	movwf	((_menu_update_numeric_value$1121))&0ffh
	goto	l5493
	
l5491:; BSR set to: 0

	movlw	high(02Dh)
	movwf	((_menu_update_numeric_value$1121+1))&0ffh
	movlw	low(02Dh)
	movwf	((_menu_update_numeric_value$1121))&0ffh
	
l5493:; BSR set to: 0

	movff	(_menu_update_numeric_value$1121),(_menu_update_numeric_value$1120)
	movff	(_menu_update_numeric_value$1121+1),(_menu_update_numeric_value$1120+1)
	goto	l5497
	
l5495:; BSR set to: 0

	movlw	high(020h)
	movwf	((_menu_update_numeric_value$1120+1))&0ffh
	movlw	low(020h)
	movwf	((_menu_update_numeric_value$1120))&0ffh
	
l5497:; BSR set to: 0

	movff	(_menu_update_numeric_value$1120),(menu_update_numeric_value@value_buf)
	line	628
	
l5499:; BSR set to: 0

		decf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u5661
	goto	u5660

u5661:
	goto	l5503
u5660:
	
l5501:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u5671
	goto	u5670
u5671:
	goto	l5505
u5670:
	
l5503:; BSR set to: 0

	movlw	low(030h)
	addwf	(0+(_menu+0Ah))&0ffh,w
	movwf	((_menu_update_numeric_value$1122))&0ffh
	clrf	1+((_menu_update_numeric_value$1122))&0ffh
	movlw	high(030h)
	addwfc	1+((_menu_update_numeric_value$1122))&0ffh
	goto	l5507
	
l5505:; BSR set to: 0

	movlw	high(020h)
	movwf	((_menu_update_numeric_value$1122+1))&0ffh
	movlw	low(020h)
	movwf	((_menu_update_numeric_value$1122))&0ffh
	
l5507:; BSR set to: 0

	movff	(_menu_update_numeric_value$1122),0+(menu_update_numeric_value@value_buf+01h)
	line	629
	
l5509:; BSR set to: 0

		movlw	2
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u5681
	goto	u5680

u5681:
	goto	l5513
u5680:
	
l5511:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u5691
	goto	u5690
u5691:
	goto	l5515
u5690:
	
l5513:; BSR set to: 0

	movlw	low(030h)
	addwf	(0+(_menu+0Bh))&0ffh,w
	movwf	((_menu_update_numeric_value$1123))&0ffh
	clrf	1+((_menu_update_numeric_value$1123))&0ffh
	movlw	high(030h)
	addwfc	1+((_menu_update_numeric_value$1123))&0ffh
	goto	l5517
	
l5515:; BSR set to: 0

	movlw	high(020h)
	movwf	((_menu_update_numeric_value$1123+1))&0ffh
	movlw	low(020h)
	movwf	((_menu_update_numeric_value$1123))&0ffh
	
l5517:; BSR set to: 0

	movff	(_menu_update_numeric_value$1123),0+(menu_update_numeric_value@value_buf+02h)
	line	630
	
l5519:; BSR set to: 0

		movlw	3
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u5701
	goto	u5700

u5701:
	goto	l5523
u5700:
	
l5521:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u5711
	goto	u5710
u5711:
	goto	l5525
u5710:
	
l5523:; BSR set to: 0

	movlw	low(030h)
	addwf	(0+(_menu+0Ch))&0ffh,w
	movwf	((_menu_update_numeric_value$1124))&0ffh
	clrf	1+((_menu_update_numeric_value$1124))&0ffh
	movlw	high(030h)
	addwfc	1+((_menu_update_numeric_value$1124))&0ffh
	goto	l5527
	
l5525:; BSR set to: 0

	movlw	high(020h)
	movwf	((_menu_update_numeric_value$1124+1))&0ffh
	movlw	low(020h)
	movwf	((_menu_update_numeric_value$1124))&0ffh
	
l5527:; BSR set to: 0

	movff	(_menu_update_numeric_value$1124),0+(menu_update_numeric_value@value_buf+03h)
	line	631
	movlw	low(0)
	movwf	(0+(menu_update_numeric_value@value_buf+04h))&0ffh
	line	632
	
l619:; BSR set to: 0

	line	635
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u5721
	goto	u5720
u5721:
	goto	l5531
u5720:
	
l5529:; BSR set to: 0

	movlw	high(0Eh)
	movwf	((_menu_update_numeric_value$1126+1))&0ffh
	movlw	low(0Eh)
	movwf	((_menu_update_numeric_value$1126))&0ffh
	goto	l5533
	
l5531:; BSR set to: 0

	movlw	high(0Fh)
	movwf	((_menu_update_numeric_value$1126+1))&0ffh
	movlw	low(0Fh)
	movwf	((_menu_update_numeric_value$1126))&0ffh
	
l5533:; BSR set to: 0

	movff	(_menu_update_numeric_value$1126),(menu_update_numeric_value@start_col)
	line	637
	
l5535:; BSR set to: 0

	movff	(menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	incf	((menu_update_numeric_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	638
	
l5537:
		movlw	low(STR_127)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_127)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	641
	
l5539:
	movff	(menu_update_numeric_value@start_col),(c:lcd_set_cursor@col)
	movlb	0	; () banked
	incf	((menu_update_numeric_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	642
	
l5541:
		movlw	low(STR_128)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_128)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	643
	
l5543:
		movlw	low(menu_update_numeric_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	644
	
l5545:
		movlw	low(STR_129)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_129)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	645
	
l595:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_numeric_value
	__end_of_menu_update_numeric_value:
	signat	_menu_update_numeric_value,89
	global	_menu_update_edit_value

;; *************** function _menu_update_edit_value *****************
;; Defined at:
;;		line 809 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1   45[COMRAM] unsigned char 
;;  j               1   46[COMRAM] unsigned char 
;;  val_len         1   42[COMRAM] unsigned char 
;;  val_len         1   43[COMRAM] unsigned char 
;;  start_pos       1   41[COMRAM] unsigned char 
;;  flag_value      1   48[COMRAM] unsigned char 
;;  value_buf      15   24[COMRAM] unsigned char [15]
;;  opts            2   49[COMRAM] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  item_idx        1   51[COMRAM] unsigned char 
;;  screen_line     1   47[COMRAM] unsigned char 
;;  val_len         1   44[COMRAM] unsigned char 
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
;;      Locals:        28       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        32       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       32 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_get_item_options
;;		_lcd_print
;;		_lcd_set_cursor
;;		_strcpy
;;		_strlen
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	809
global __ptext4
__ptext4:
psect	text4
	file	"src\menu.c"
	line	809
	
_menu_update_edit_value:
;incstack = 0
	callstack 25
	line	812
	
l5547:
	movlb	1	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u5731
	goto	u5730

u5731:
	goto	l717
u5730:
	
l5549:; BSR set to: 1

	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u5741
	goto	u5740
u5741:
	goto	l5551
u5740:
	goto	l717
	line	816
	
l5551:; BSR set to: 0

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movwf	((c:menu_update_edit_value@screen_line))^00h,c
	line	817
		movlw	03h-1
	cpfsgt	((c:menu_update_edit_value@screen_line))^00h,c
	goto	u5751
	goto	u5750

u5751:
	goto	l718
u5750:
	goto	l717
	line	818
	
l718:; BSR set to: 0

	line	821
	movff	(_menu),(c:menu_update_edit_value@item_idx)
	line	825
	
l5555:; BSR set to: 0

	movf	((c:menu_update_edit_value@item_idx))^00h,c,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(c:menu_update_edit_value@opts)
	movff	1+?_get_item_options,(c:menu_update_edit_value@opts+1)
	line	827
	
l5557:
	movf	((c:menu_update_edit_value@opts))^00h,c,w
iorwf	((c:menu_update_edit_value@opts+1))^00h,c,w
	btfsc	status,2
	goto	u5761
	goto	u5760

u5761:
	goto	l5587
u5760:
	line	829
	
l5559:
	movf	((c:menu_update_edit_value@item_idx))^00h,c,w
	btfsc	status,2
	goto	u5771
	goto	u5770
u5771:
	goto	l721
u5770:
	
l5561:
	movff	(_sensor_edit_flag),(c:_menu_update_edit_value$1185)
	clrf	((c:_menu_update_edit_value$1185+1))^00h,c
	goto	l723
	
l721:
	movff	(_enable_edit_flag),(c:_menu_update_edit_value$1185)
	clrf	((c:_menu_update_edit_value$1185+1))^00h,c
	
l723:
	movff	(c:_menu_update_edit_value$1185),(c:menu_update_edit_value@flag_value)
	line	830
	
l5563:
	movlw	01h
	addwf	((c:menu_update_edit_value@opts))^00h,c,w
	movwf	(??_menu_update_edit_value+0+0)^00h,c
	movlw	0
	addwfc	((c:menu_update_edit_value@opts+1))^00h,c,w
	movwf	(??_menu_update_edit_value+0+0+1)^00h,c
	movff	??_menu_update_edit_value+0+0,tblptrl
	movff	??_menu_update_edit_value+0+1,tblptrh
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
	cpfslt	((c:menu_update_edit_value@flag_value))^00h,c
	goto	u5781
	goto	u5780
u5781:
	goto	l5581
u5780:
	line	832
	
l5565:
	movlb	0	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u5791
	goto	u5790
u5791:
	goto	l5569
u5790:
	line	835
	
l5567:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

	movf	((c:menu_update_edit_value@flag_value))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_update_edit_value+0+0
	movff	prodh,??_menu_update_edit_value+0+0+1
	movf	(??_menu_update_edit_value+0+0)^00h,c,w
	addwf	((c:menu_update_edit_value@opts))^00h,c,w
	movwf	(??_menu_update_edit_value+2+0)^00h,c
	movf	(??_menu_update_edit_value+0+1)^00h,c,w
	addwfc	((c:menu_update_edit_value@opts+1))^00h,c,w
	movwf	1+(??_menu_update_edit_value+2+0)^00h,c
	movlw	02h
	addwf	(??_menu_update_edit_value+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_update_edit_value+2+1)^00h,c
	movff	??_menu_update_edit_value+2+0,tblptrl
	movff	??_menu_update_edit_value+2+1,tblptrh
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
	line	836
	goto	l5603
	line	840
	
l5569:; BSR set to: 0

	movf	((c:menu_update_edit_value@flag_value))^00h,c,w
	mullw	02h
	movff	prodl,??_menu_update_edit_value+0+0
	movff	prodh,??_menu_update_edit_value+0+0+1
	movf	(??_menu_update_edit_value+0+0)^00h,c,w
	addwf	((c:menu_update_edit_value@opts))^00h,c,w
	movwf	(??_menu_update_edit_value+2+0)^00h,c
	movf	(??_menu_update_edit_value+0+1)^00h,c,w
	addwfc	((c:menu_update_edit_value@opts+1))^00h,c,w
	movwf	1+(??_menu_update_edit_value+2+0)^00h,c
	movlw	02h
	addwf	(??_menu_update_edit_value+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_update_edit_value+2+1)^00h,c
	movff	??_menu_update_edit_value+2+0,tblptrl
	movff	??_menu_update_edit_value+2+1,tblptrh
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
	movwf	((c:menu_update_edit_value@val_len))^00h,c
	line	841
	
l5571:
	movlw	low(0)
	movwf	((c:menu_update_edit_value@j))^00h,c
	goto	l5577
	line	842
	
l5573:
	movf	((c:menu_update_edit_value@j))^00h,c,w
	addlw	low(menu_update_edit_value@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	841
	
l5575:
	incf	((c:menu_update_edit_value@j))^00h,c
	
l5577:
		movf	((c:menu_update_edit_value@val_len))^00h,c,w
	subwf	((c:menu_update_edit_value@j))^00h,c,w
	btfss	status,0
	goto	u5801
	goto	u5800

u5801:
	goto	l5573
u5800:
	line	843
	
l5579:
	movf	((c:menu_update_edit_value@val_len))^00h,c,w
	addlw	low(menu_update_edit_value@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l5603
	line	848
	
l5581:
	movlb	0	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u5811
	goto	u5810
u5811:
	goto	l5585
u5810:
	line	849
	
l5583:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_143)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_143)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l5603
	line	851
	
l5585:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_144)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_144)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l5603
	line	856
	
l5587:
	movlb	0	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u5821
	goto	u5820
u5821:
	goto	l5591
u5820:
	line	858
	
l5589:; BSR set to: 0

		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

	movf	((c:menu_update_edit_value@item_idx))^00h,c,w
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
	line	859
	goto	l5603
	line	862
	
l5591:; BSR set to: 0

	movf	((c:menu_update_edit_value@item_idx))^00h,c,w
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
	movwf	((c:menu_update_edit_value@val_len_1190))^00h,c
	line	863
	
l5593:
	movlw	low(0)
	movwf	((c:menu_update_edit_value@j_1191))^00h,c
	goto	l5599
	line	864
	
l5595:
	movf	((c:menu_update_edit_value@j_1191))^00h,c,w
	addlw	low(menu_update_edit_value@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	863
	
l5597:
	incf	((c:menu_update_edit_value@j_1191))^00h,c
	
l5599:
		movf	((c:menu_update_edit_value@val_len_1190))^00h,c,w
	subwf	((c:menu_update_edit_value@j_1191))^00h,c,w
	btfss	status,0
	goto	u5831
	goto	u5830

u5831:
	goto	l5595
u5830:
	line	865
	
l5601:
	movf	((c:menu_update_edit_value@val_len_1190))^00h,c,w
	addlw	low(menu_update_edit_value@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	870
	
l5603:
	movlw	low(0Ah)
	movwf	((c:lcd_set_cursor@col))^00h,c
	incf	((c:menu_update_edit_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	871
	
l5605:
		movlw	low(STR_145)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_145)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	874
	
l5607:
		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_update_edit_value@val_len_1193))^00h,c
	line	875
	
l5609:
	movf	((c:menu_update_edit_value@val_len_1193))^00h,c,w
	btfsc	status,2
	goto	u5841
	goto	u5840
u5841:
	goto	l717
u5840:
	line	878
	
l5611:
	movf	((c:menu_update_edit_value@val_len_1193))^00h,c,w
	sublw	low(012h)
	movwf	((c:menu_update_edit_value@start_pos))^00h,c
	line	879
	
l5613:
	movff	(c:menu_update_edit_value@start_pos),(c:lcd_set_cursor@col)
	incf	((c:menu_update_edit_value@screen_line))^00h,c,w
	
	call	_lcd_set_cursor
	line	882
	
l5615:
		movlw	low(STR_146)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_146)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	884
	
l5617:
		movlw	low(menu_update_edit_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	886
	
l5619:
		movlw	low(STR_147)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_147)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	888
	
l717:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_edit_value
	__end_of_menu_update_edit_value:
	signat	_menu_update_edit_value,89
	global	_menu_init

;; *************** function _menu_init *****************
;; Defined at:
;;		line 352 in file "src\menu.c"
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
;;		On exit  : 3F/0
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
	line	352
global __ptext5
__ptext5:
psect	text5
	file	"src\menu.c"
	line	352
	
_menu_init:
;incstack = 0
	callstack 28
	line	354
	
l5225:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_menu))&0ffh
	line	355
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	356
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	357
	movlw	low(0)
	movwf	(0+(_menu+03h))&0ffh
	line	358
	movlw	low(0)
	movwf	(0+(_menu+05h))&0ffh
	line	359
	movlw	high(0)
	movwf	(1+(_menu+06h))&0ffh
	movlw	low(0)
	movwf	(0+(_menu+06h))&0ffh
	line	360
	
l491:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_init
	__end_of_menu_init:
	signat	_menu_init,89
	global	_menu_handle_encoder

;; *************** function _menu_handle_encoder *****************
;; Defined at:
;;		line 891 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  delta           2   57[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;  edit_flag       1   57[BANK0 ] PTR unsigned char 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), 
;;  buf            50    5[BANK0 ] unsigned char [50]
;;  opts            2   55[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 3F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      53       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2      58       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       60 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_get_item_options
;;		_sprintf
;;		_uart_println
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	891
global __ptext6
__ptext6:
psect	text6
	file	"src\menu.c"
	line	891
	
_menu_handle_encoder:; BSR set to: 0

;incstack = 0
	callstack 25
	line	894
	
l6415:
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u7151
	goto	u7150
u7151:
	goto	l6449
u7150:
	line	896
	
l6417:; BSR set to: 0

	movf	((c:menu_handle_encoder@delta))^00h,c,w
iorwf	((c:menu_handle_encoder@delta+1))^00h,c,w
	btfsc	status,2
	goto	u7161
	goto	u7160

u7161:
	goto	l756
u7160:
	line	899
	
l6419:; BSR set to: 0

	movf	((_menu))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(menu_handle_encoder@opts)
	movff	1+?_get_item_options,(menu_handle_encoder@opts+1)
	line	900
	
l6421:
	movlb	0	; () banked
	movf	((menu_handle_encoder@opts))&0ffh,w
iorwf	((menu_handle_encoder@opts+1))&0ffh,w
	btfsc	status,2
	goto	u7171
	goto	u7170

u7171:
	goto	l756
u7170:
	line	903
	
l6423:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u7181
	goto	u7180
u7181:
	goto	l6427
u7180:
	
l6425:; BSR set to: 0

		movlw	low(_sensor_edit_flag)
	movwf	((menu_handle_encoder@edit_flag))&0ffh

	goto	l748
	
l6427:; BSR set to: 0

		movlw	low(_enable_edit_flag)
	movwf	((menu_handle_encoder@edit_flag))&0ffh

	
l748:; BSR set to: 0

	line	905
	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u7191
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u7190
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u7191
	goto	u7190

u7191:
	goto	l6435
u7190:
	line	907
	
l6429:; BSR set to: 0

	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	incf	indf2

	line	908
	
l6431:; BSR set to: 0

	movlw	01h
	addwf	((menu_handle_encoder@opts))&0ffh,w
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	movlw	0
	addwfc	((menu_handle_encoder@opts+1))&0ffh,w
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
	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
		tblrd	*+
	movf	tablat,w
	subwf	postinc2,w
	btfss	status,0
	goto	u7201
	goto	u7200

u7201:
	goto	l6443
u7200:
	line	909
	
l6433:; BSR set to: 0

	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l6443
	line	911
	
l6435:; BSR set to: 0

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u7210
	goto	u7211

u7211:
	goto	l6443
u7210:
	line	913
	
l6437:; BSR set to: 0

	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u7221
	goto	u7220
u7221:
	goto	l6441
u7220:
	line	914
	
l6439:; BSR set to: 0

	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	movlw	01h
	addwf	((menu_handle_encoder@opts))&0ffh,w
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	movlw	0
	addwfc	((menu_handle_encoder@opts+1))&0ffh,w
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
	movwf	indf2,c

	goto	l6443
	line	916
	
l6441:; BSR set to: 0

	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	decf	indf2

	line	920
	
l6443:; BSR set to: 0

	movlw	01h
	addwf	((menu_handle_encoder@opts))&0ffh,w
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	movlw	0
	addwfc	((menu_handle_encoder@opts+1))&0ffh,w
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
	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
		tblrd	*+
	movf	tablat,w
	subwf	postinc2,w
	btfss	status,0
	goto	u7231
	goto	u7230

u7231:
	goto	l743
u7230:
	line	921
	
l6445:; BSR set to: 0

	movf	((menu_handle_encoder@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l756
	line	923
	
l743:; BSR set to: 0

	goto	l756
	line	928
	
l6449:; BSR set to: 0

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u7241
	movf	((c:menu_handle_encoder@delta+1))^00h,c,w
	bnz	u7240
	decf	((c:menu_handle_encoder@delta))^00h,c,w
	btfss	status,0
	goto	u7241
	goto	u7240

u7241:
	goto	l6459
u7240:
	line	931
	
l6451:; BSR set to: 0

	movlw	low(-1)
	addwf	(0+(_menu+02h))&0ffh,w
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	clrf	1+(??_menu_handle_encoder+0+0)&0ffh
	movlw	high(-1)
	addwfc	1+(??_menu_handle_encoder+0+0)&0ffh
	movf	((_menu))&0ffh,w
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
	goto	u7251
	goto	u7250

u7251:
	goto	l756
u7250:
	line	933
	
l6453:; BSR set to: 0

	incf	((_menu))&0ffh
	line	936
	
l6455:; BSR set to: 0

	movf	(0+(_menu+01h))&0ffh,w
	movwf	(??_menu_handle_encoder+0+0)&0ffh
	clrf	(??_menu_handle_encoder+0+0+1)&0ffh

	movlw	03h
	addwf	(??_menu_handle_encoder+0+0)&0ffh
	movlw	0
	addwfc	(??_menu_handle_encoder+0+1)&0ffh
	movf	((_menu))&0ffh,w
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
	goto	u7261
	goto	u7260

u7261:
	goto	l756
u7260:
	line	938
	
l6457:; BSR set to: 0

	incf	(0+(_menu+01h))&0ffh
	goto	l756
	line	942
	
l6459:; BSR set to: 0

	btfsc	((c:menu_handle_encoder@delta+1))^00h,c,7
	goto	u7270
	goto	u7271

u7271:
	goto	l756
u7270:
	line	945
	
l6461:; BSR set to: 0

	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u7281
	goto	u7280
u7281:
	goto	l756
u7280:
	line	950
	
l6463:; BSR set to: 0

		movlw	low(menu_handle_encoder@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_148)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_148)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_menu),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+02h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	951
	
l6465:
		movlw	low(menu_handle_encoder@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	953
	
l6467:
	movlb	0	; () banked
	decf	((_menu))&0ffh
	line	956
	
l6469:; BSR set to: 0

		movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	btfsc	status,0
	goto	u7291
	goto	u7290

u7291:
	goto	l756
u7290:
	line	958
	
l6471:; BSR set to: 0

	decf	(0+(_menu+01h))&0ffh
	line	962
	
l756:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_encoder
	__end_of_menu_handle_encoder:
	signat	_menu_handle_encoder,4217
	global	_menu_handle_button

;; *************** function _menu_handle_button *****************
;; Defined at:
;;		line 965 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  press_type      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  press_type      1  113[BANK2 ] unsigned char 
;;  i               1  112[BANK2 ] unsigned char 
;;  edit_flag       1  101[BANK2 ] PTR unsigned char 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), 
;;  opts            2  108[BANK2 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  buf            50   50[BANK2 ] unsigned char [50]
;;  current_val     2  106[BANK2 ] unsigned int 
;;  current_val     2  102[BANK2 ] int 
;;  new_value       2  114[BANK2 ] int 
;;  new_seconds     2  110[BANK2 ] unsigned int 
;;  edit_flag       1  100[BANK2 ] PTR unsigned char 
;;		 -> sensor_edit_flag(1), enable_edit_flag(1), 
;;  buf            50    0[BANK2 ] unsigned char [50]
;;  opts            2  104[BANK2 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
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
;;      Locals:         0       0       0     116       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       5       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       5     116       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      121 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 7
;; This function calls:
;;		___wmul
;;		_beep
;;		_get_current_numeric_value
;;		_get_item_options
;;		_init_numeric_editor
;;		_init_time_editor
;;		_is_numeric_field
;;		_is_time_field
;;		_menu_draw_input
;;		_menu_draw_options
;;		_menu_draw_setup
;;		_menu_update_time_value
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
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	965
global __ptext7
__ptext7:
psect	text7
	file	"src\menu.c"
	line	965
	
_menu_handle_button:; BSR set to: 0

;incstack = 0
	callstack 23
	movlb	2	; () banked
	movwf	((menu_handle_button@press_type))&0ffh
	line	969
	
l6473:
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u7301
	goto	u7300
u7301:
	goto	l6583
u7300:
	line	971
	
l6475:; BSR set to: 0

	movlb	2	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u7311
	goto	u7310

u7311:
	goto	l857
u7310:
	line	974
	
l6477:; BSR set to: 2

	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u7321
	goto	u7320
u7321:
	goto	l6481
u7320:
	
l6479:; BSR set to: 0

		decf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7331
	goto	u7330

u7331:
	goto	l6499
u7330:
	line	977
	
l6481:; BSR set to: 0

	movf	((_menu))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(menu_handle_button@opts)
	movff	1+?_get_item_options,(menu_handle_button@opts+1)
	line	978
	
l6483:
	movlb	2	; () banked
	movf	((menu_handle_button@opts))&0ffh,w
iorwf	((menu_handle_button@opts+1))&0ffh,w
	btfsc	status,2
	goto	u7341
	goto	u7340

u7341:
	goto	l6495
u7340:
	line	980
	
l6485:; BSR set to: 2

	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u7351
	goto	u7350
u7351:
	goto	l6489
u7350:
	
l6487:; BSR set to: 0

		movlw	low(_sensor_edit_flag)
	movlb	2	; () banked
	movwf	((menu_handle_button@edit_flag))&0ffh

	goto	l6491
	
l6489:; BSR set to: 0

		movlw	low(_enable_edit_flag)
	movlb	2	; () banked
	movwf	((menu_handle_button@edit_flag))&0ffh

	line	983
	
l6491:; BSR set to: 2

	movlb	0	; () banked
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
	movlb	2	; () banked
	movf	((menu_handle_button@edit_flag))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movlb	1	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movf	((??_menu_handle_button+0+0))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_button+1+0
	movff	prodh,??_menu_handle_button+1+0+1
	movf	(??_menu_handle_button+1+0)&0ffh,w
	movlb	2	; () banked
	addwf	((menu_handle_button@opts))&0ffh,w
	movlb	1	; () banked
	movwf	(??_menu_handle_button+3+0)&0ffh
	movf	(??_menu_handle_button+1+1)&0ffh,w
	movlb	2	; () banked
	addwfc	((menu_handle_button@opts+1))&0ffh,w
	movlb	1	; () banked
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
	line	986
	
l6493:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	989
	
l6495:; BSR set to: 2

	movlw	low(0)
	movlb	0	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	990
	
l6497:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	991
	goto	l857
	line	992
	
l6499:; BSR set to: 0

	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u7361
	goto	u7360
u7361:
	goto	l6541
u7360:
	line	995
	
l6501:
	movlb	0	; () banked
	incf	(0+(_menu+011h))&0ffh
	line	996
	
l6503:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	line	997
	
l6505:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1001
	
l6507:
		movlw	low(menu_handle_button@buf)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_149)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_149)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+011h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	1002
	
l6509:
		movlw	low(menu_handle_button@buf)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1005
	
l6511:
	call	_menu_update_time_value	;wreg free
	line	1007
	
l6513:
		movlw	02h-1
	movlb	0	; () banked
	cpfsgt	(0+(_menu+011h))&0ffh
	goto	u7371
	goto	u7370

u7371:
	goto	l857
u7370:
	line	1011
	
l6515:; BSR set to: 0

	movf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u7381
	goto	u7380
u7381:
	goto	l6519
u7380:
	line	1012
	
l6517:; BSR set to: 0

	movf	(0+(_menu+012h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+(_menu+013h))&0ffh,w
	movlb	1	; () banked
	addwf	(??_menu_handle_button+0+0)&0ffh,w
	movlb	2	; () banked
	movwf	((menu_handle_button@new_seconds))&0ffh
	movlb	0	; () banked
	movlw	0
	movlb	1	; () banked
	addwfc	(??_menu_handle_button+0+1)&0ffh,w
	movlb	2	; () banked
	movwf	1+((menu_handle_button@new_seconds))&0ffh
	goto	l6521
	line	1014
	
l6519:; BSR set to: 0

	movff	0+(_menu+012h),(c:___wmul@multiplier)
	clrf	((c:___wmul@multiplier+1))^00h,c
	movlw	high(0E10h)
	movwf	((c:___wmul@multiplicand+1))^00h,c
	movlw	low(0E10h)
	movwf	((c:___wmul@multiplicand))^00h,c
	call	___wmul	;wreg free
	movlb	0	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	mullw	03Ch
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movf	(0+?___wmul)^00h,c,w
	movlb	1	; () banked
	addwf	(??_menu_handle_button+0+0)&0ffh,w
	movlb	2	; () banked
	movwf	((menu_handle_button@new_seconds))&0ffh
	movf	(1+?___wmul)^00h,c,w
	movlb	1	; () banked
	addwfc	(??_menu_handle_button+0+1)&0ffh,w
	movlb	2	; () banked
	movwf	1+((menu_handle_button@new_seconds))&0ffh
	line	1017
	
l6521:; BSR set to: 2

		movlw	5
	movlb	0	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7391
	goto	u7390

u7391:
	goto	l6525
u7390:
	line	1018
	
l6523:; BSR set to: 0

	movlb	1	; () banked
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
	goto	l6533
	line	1019
	
l6525:; BSR set to: 0

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7401
	goto	u7400

u7401:
	goto	l6529
u7400:
	line	1020
	
l6527:; BSR set to: 0

	movlb	1	; () banked
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
	goto	l6533
	line	1021
	
l6529:; BSR set to: 0

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7411
	goto	u7410

u7411:
	goto	l6533
u7410:
	line	1022
	
l6531:; BSR set to: 0

	movlb	1	; () banked
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
	line	1026
	
l6533:
	movlb	0	; () banked
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
		movlw	low(STR_150)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_150)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1029
	
l6535:
	movlw	low(0)
	movlb	0	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1030
	
l6537:; BSR set to: 0

	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1032
	
l6539:; BSR set to: 2

		movlw	low(STR_151)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_151)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	goto	l857
	line	1035
	
l6541:
	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u7421
	goto	u7420
u7421:
	goto	l788
u7420:
	line	1038
	
l6543:
	movlb	0	; () banked
	incf	(0+(_menu+08h))&0ffh
	line	1039
	
l6545:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1042
	
l6547:
		movlw	2
	movlb	0	; () banked
	xorwf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u7431
	goto	u7430

u7431:
	goto	l6553
u7430:
	
l6549:; BSR set to: 0

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u7441
	goto	u7440

u7441:
	goto	l6553
u7440:
	line	1044
	
l6551:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+0Bh))&0ffh
	line	1045
	movlw	low(0)
	movwf	(0+(_menu+0Ch))&0ffh
	line	1048
	
l6553:; BSR set to: 0

		movlw	04h-1
	cpfsgt	(0+(_menu+08h))&0ffh
	goto	u7451
	goto	u7450

u7451:
	goto	l788
u7450:
	line	1052
	
l6555:; BSR set to: 0

	call	_get_current_numeric_value	;wreg free
	movff	0+?_get_current_numeric_value,(menu_handle_button@new_value)
	movff	1+?_get_current_numeric_value,(menu_handle_button@new_value+1)
	line	1055
	
l6557:; BSR set to: 0

		movlw	2
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7461
	goto	u7460

u7461:
	goto	l6563
u7460:
	line	1057
	
l6559:; BSR set to: 0

	movlb	1	; () banked
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
	line	1058
	
l6561:; BSR set to: 1

		movff	0+(_input_menu+0Ch),(c:sprintf@sp)
	movff	1+(_input_menu+0Ch),(c:sprintf@sp+1)

		movlw	low(STR_152)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_152)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1059
	goto	l6579
	line	1060
	
l6563:; BSR set to: 0

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7471
	goto	u7470

u7471:
	goto	l6569
u7470:
	line	1062
	
l6565:; BSR set to: 0

	movlb	1	; () banked
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
	line	1063
	
l6567:; BSR set to: 1

		movff	0+(_input_menu+011h),(c:sprintf@sp)
	movff	1+(_input_menu+011h),(c:sprintf@sp+1)

		movlw	low(STR_153)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_153)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1064
	goto	l6579
	line	1065
	
l6569:; BSR set to: 0

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7481
	goto	u7480

u7481:
	goto	l6575
u7480:
	line	1067
	
l6571:; BSR set to: 0

	movlb	1	; () banked
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
	line	1068
	
l6573:; BSR set to: 1

		movff	0+(_input_menu+016h),(c:sprintf@sp)
	movff	1+(_input_menu+016h),(c:sprintf@sp+1)

		movlw	low(STR_154)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_154)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	line	1069
	goto	l6579
	line	1070
	
l6575:; BSR set to: 0

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7491
	goto	u7490

u7491:
	goto	l797
u7490:
	line	1073
	
l6577:; BSR set to: 0

		movff	0+(_input_menu+020h),(c:sprintf@sp)
	movff	1+(_input_menu+020h),(c:sprintf@sp+1)

		movlw	low(STR_155)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_155)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@new_value),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@new_value+1),1+((c:?_sprintf)+04h)
	call	_sprintf	;wreg free
	goto	l6579
	line	1077
	
l797:; BSR set to: 0

	
l6579:
	movlw	low(01h)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1080
	
l6581:; BSR set to: 2

	movlw	low(0)
	movlb	0	; () banked
	movwf	(0+(_menu+03h))&0ffh
	goto	l857
	line	1083
	
l788:
	goto	l857
	line	1087
	
l6583:; BSR set to: 0

	movlb	2	; () banked
		decf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u7501
	goto	u7500

u7501:
	goto	l6727
u7500:
	line	1089
	
l6585:; BSR set to: 2

	movlb	1	; () banked
	movf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7511
	goto	u7510
u7511:
	goto	l6605
u7510:
	line	1091
	
l6587:; BSR set to: 1

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1093
	goto	l6603
	line	1100
	
l6589:; BSR set to: 0

	movlw	low(02h)
	movlb	1	; () banked
	movwf	((_current_menu))&0ffh
	line	1101
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_menu))&0ffh
	line	1102
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	1103
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	1104
	
l6591:; BSR set to: 0

	call	_menu_draw_setup	;wreg free
	line	1105
	goto	l857
	line	1117
	
l6593:; BSR set to: 0

	movlb	2	; () banked
	movf	((_save_pending))&0ffh,w
	btfsc	status,2
	goto	u7521
	goto	u7520
u7521:
	goto	l6599
u7520:
	line	1119
	
l6595:; BSR set to: 2

	call	_save_current_config	;wreg free
	line	1120
	
l6597:
	movlw	low(0)
	movlb	2	; () banked
	movwf	((_save_pending))&0ffh
	line	1122
	
l6599:; BSR set to: 2

	movlb	1	; () banked
	setf	((_current_menu))&0ffh
	line	1123
	goto	l857
	line	1093
	
l6603:
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
	goto	l788
	xorlw	1^0	; case 1
	skipnz
	goto	l6589
	xorlw	2^1	; case 2
	skipnz
	goto	l788
	xorlw	3^2	; case 3
	skipnz
	goto	l788
	xorlw	4^3	; case 4
	skipnz
	goto	l6593
	goto	l857

	line	1126
	
l6605:; BSR set to: 1

		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7531
	goto	u7530

u7531:
	goto	l6703
u7530:
	line	1128
	
l6607:; BSR set to: 1

		movlw	13
	movlb	0	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7541
	goto	u7540

u7541:
	goto	l6621
u7540:
	line	1130
	
l6609:; BSR set to: 0

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1132
	
l6611:
	movlw	low(02h)
	movlb	1	; () banked
	movwf	((_current_menu))&0ffh
	line	1133
	
l6613:; BSR set to: 1

	movlw	low(0)
	movlb	0	; () banked
	movwf	((_menu))&0ffh
	line	1134
	
l6615:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	1135
	
l6617:; BSR set to: 0

	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	goto	l6591
	line	1138
	
l6621:; BSR set to: 0

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
	goto	u7551
	goto	u7550
u7551:
	goto	l857
u7550:
	line	1141
	
l6623:; BSR set to: 0

	movf	((_menu))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u7561
	goto	u7560
u7561:
	goto	l6649
u7560:
	line	1147
	
l6625:
		movlw	2
	movlb	0	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7571
	goto	u7570

u7571:
	goto	l6629
u7570:
	line	1148
	
l6627:; BSR set to: 0

	movlb	1	; () banked
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
	goto	l6641
	line	1149
	
l6629:; BSR set to: 0

		movlw	3
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7581
	goto	u7580

u7581:
	goto	l6633
u7580:
	line	1150
	
l6631:; BSR set to: 0

	movlb	1	; () banked
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
	goto	l6641
	line	1151
	
l6633:; BSR set to: 0

		movlw	4
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7591
	goto	u7590

u7591:
	goto	l6637
u7590:
	line	1152
	
l6635:; BSR set to: 0

	movlb	1	; () banked
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
	goto	l6641
	line	1153
	
l6637:; BSR set to: 0

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7601
	goto	u7600

u7601:
	goto	l823
u7600:
	line	1154
	
l6639:; BSR set to: 0

	movlw	high(032h)
	movlb	2	; () banked
	movwf	((menu_handle_button@current_val+1))&0ffh
	movlw	low(032h)
	movwf	((menu_handle_button@current_val))&0ffh
	goto	l6641
	line	1156
	
l823:; BSR set to: 0

	
l6641:
	movff	(menu_handle_button@current_val),(c:init_numeric_editor@value)
	movff	(menu_handle_button@current_val+1),(c:init_numeric_editor@value+1)
	call	_init_numeric_editor	;wreg free
	line	1157
	
l6643:
	movlw	low(01h)
	movlb	0	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1158
	
l6645:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l6497
	line	1161
	
l6649:
	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfsc	status,2
	goto	u7611
	goto	u7610
u7611:
	goto	l6677
u7610:
	line	1165
	
l6651:
	movlw	high(0)
	movlb	2	; () banked
	movwf	((menu_handle_button@current_val_1232+1))&0ffh
	movlw	low(0)
	movwf	((menu_handle_button@current_val_1232))&0ffh
	line	1168
	
l6653:; BSR set to: 2

		movlw	5
	movlb	0	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7621
	goto	u7620

u7621:
	goto	l6657
u7620:
	line	1169
	
l6655:; BSR set to: 0

	movlb	1	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ah)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ah)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1232)
	movff	postdec2,(menu_handle_button@current_val_1232+1)
	goto	l6665
	line	1170
	
l6657:; BSR set to: 0

		movlw	7
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7631
	goto	u7630

u7631:
	goto	l6661
u7630:
	line	1171
	
l6659:; BSR set to: 0

	movlb	1	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Ch)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Ch)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1232)
	movff	postdec2,(menu_handle_button@current_val_1232+1)
	goto	l6665
	line	1172
	
l6661:; BSR set to: 0

		movlw	8
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7641
	goto	u7640

u7641:
	goto	l6665
u7640:
	line	1173
	
l6663:; BSR set to: 0

	movlb	1	; () banked
	movf	((_current_input))&0ffh,w
	mullw	080h
	movlw	low(_input_config+01Eh)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01Eh)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(menu_handle_button@current_val_1232)
	movff	postdec2,(menu_handle_button@current_val_1232+1)
	line	1177
	
l6665:
		movlw	low(menu_handle_button@buf_1233)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_handle_button@buf_1233)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_156)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_156)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_handle_button@current_val_1232),0+((c:?_sprintf)+04h)
	movff	(menu_handle_button@current_val_1232+1),1+((c:?_sprintf)+04h)
	movff	(_menu),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	1178
	
l6667:
		movlw	low(menu_handle_button@buf_1233)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_handle_button@buf_1233)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	1180
	
l6669:
	movff	(menu_handle_button@current_val_1232),(c:init_time_editor@value_seconds)
	movff	(menu_handle_button@current_val_1232+1),(c:init_time_editor@value_seconds+1)
	movlw	low(0)
	movwf	((c:init_time_editor@mode))^00h,c
	call	_init_time_editor	;wreg free
	goto	l6643
	line	1188
	
l6677:
		movlw	low(_original_value)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_original_value)
	movwf	((c:strcpy@to+1))^00h,c

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
	line	1191
	
l6679:
	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(menu_handle_button@opts_1236)
	movff	1+?_get_item_options,(menu_handle_button@opts_1236+1)
	line	1192
	
l6681:
	movlb	2	; () banked
	movf	((menu_handle_button@opts_1236))&0ffh,w
iorwf	((menu_handle_button@opts_1236+1))&0ffh,w
	btfsc	status,2
	goto	u7651
	goto	u7650

u7651:
	goto	l6699
u7650:
	line	1194
	
l6683:; BSR set to: 2

	movlb	0	; () banked
	movf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u7661
	goto	u7660
u7661:
	goto	l6687
u7660:
	
l6685:; BSR set to: 0

		movlw	low(_sensor_edit_flag)
	movlb	2	; () banked
	movwf	((menu_handle_button@edit_flag_1240))&0ffh

	goto	l6689
	
l6687:; BSR set to: 0

		movlw	low(_enable_edit_flag)
	movlb	2	; () banked
	movwf	((menu_handle_button@edit_flag_1240))&0ffh

	line	1197
	
l6689:; BSR set to: 2

	movlw	low(0)
	movwf	((menu_handle_button@i))&0ffh
	goto	l6697
	line	1199
	
l6691:; BSR set to: 2

	movlb	0	; () banked
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
	movlb	2	; () banked
	movf	((menu_handle_button@i))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_handle_button+0+0
	movff	prodh,??_menu_handle_button+0+0+1
	movlb	1	; () banked
	movf	(??_menu_handle_button+0+0)&0ffh,w
	movlb	2	; () banked
	addwf	((menu_handle_button@opts_1236))&0ffh,w
	movlb	1	; () banked
	movwf	(??_menu_handle_button+2+0)&0ffh
	movf	(??_menu_handle_button+0+1)&0ffh,w
	movlb	2	; () banked
	addwfc	((menu_handle_button@opts_1236+1))&0ffh,w
	movlb	1	; () banked
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
	goto	u7671
	goto	u7670

u7671:
	goto	l6695
u7670:
	line	1201
	
l6693:
	movlb	2	; () banked
	movf	((menu_handle_button@edit_flag_1240))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	movff	(menu_handle_button@i),indf2

	line	1202
	goto	l6699
	line	1197
	
l6695:
	movlb	2	; () banked
	incf	((menu_handle_button@i))&0ffh
	
l6697:; BSR set to: 2

	movlw	01h
	addwf	((menu_handle_button@opts_1236))&0ffh,w
	movlb	1	; () banked
	movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	0
	movlb	2	; () banked
	addwfc	((menu_handle_button@opts_1236+1))&0ffh,w
	movlb	1	; () banked
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
	movlb	2	; () banked
	subwf	((menu_handle_button@i))&0ffh,w
	btfss	status,0
	goto	u7681
	goto	u7680

u7681:
	goto	l6691
u7680:
	line	1207
	
l6699:; BSR set to: 2

	movlw	low(01h)
	movlb	0	; () banked
	movwf	(0+(_menu+03h))&0ffh
	line	1208
	movlw	low(01h)
	movwf	(0+(_menu+05h))&0ffh
	goto	l6497
	line	1213
	
l6703:; BSR set to: 1

		movlw	2
	xorwf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u7691
	goto	u7690

u7691:
	goto	l788
u7690:
	line	1215
	
l6705:; BSR set to: 1

	movlw	high(032h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(032h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1217
	
l6707:
		movlw	4
	movlb	0	; () banked
	xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7701
	goto	u7700

u7701:
	goto	l6713
u7700:
	line	1220
	
l6709:; BSR set to: 0

	movlw	low(0)
	movlb	1	; () banked
	movwf	((_current_menu))&0ffh
	line	1221
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_menu))&0ffh
	line	1222
	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	1223
	movlw	low(05h)
	movwf	(0+(_menu+02h))&0ffh
	line	1224
	
l6711:; BSR set to: 0

	call	_menu_draw_options	;wreg free
	line	1225
	goto	l857
	line	1226
	
l6713:; BSR set to: 0

		movlw	03h-0
	cpfslt	((_menu))&0ffh
	goto	u7711
	goto	u7710

u7711:
	goto	l788
u7710:
	line	1229
	
l6715:; BSR set to: 0

	movf	((_menu))&0ffh,w
	
	call	_rebuild_input_menu
	line	1232
	
l6717:; BSR set to: 0

	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_current_menu))&0ffh
	line	1233
	
l6719:; BSR set to: 1

	movlw	low(0)
	movlb	0	; () banked
	movwf	((_menu))&0ffh
	line	1234
	
l6721:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+01h))&0ffh
	line	1236
	
l6723:; BSR set to: 0

	call	_menu_draw_input	;wreg free
	line	1237
	goto	l857
	line	1244
	
l6727:; BSR set to: 2

		movlw	2
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u7721
	goto	u7720

u7721:
	goto	l6735
u7720:
	line	1246
	
l6729:; BSR set to: 2

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1247
	
l6731:
	asmopt push
asmopt off
movlw  3
	movlb	1	; () banked
movwf	(??_menu_handle_button+0+0+1)&0ffh
movlw	8
movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	119
u8187:
decfsz	wreg,f
	bra	u8187
	decfsz	(??_menu_handle_button+0+0)&0ffh,f
	bra	u8187
	decfsz	(??_menu_handle_button+0+0+1)&0ffh,f
	bra	u8187
asmopt pop

	line	1248
	
l6733:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1249
	goto	l857
	line	1250
	
l6735:; BSR set to: 2

		movlw	3
	xorwf	((menu_handle_button@press_type))&0ffh,w
	btfss	status,2
	goto	u7731
	goto	u7730

u7731:
	goto	l857
u7730:
	line	1252
	
l6737:; BSR set to: 2

	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1253
	
l6739:
	asmopt push
asmopt off
movlw  3
	movlb	1	; () banked
movwf	(??_menu_handle_button+0+0+1)&0ffh
movlw	8
movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	119
u8197:
decfsz	wreg,f
	bra	u8197
	decfsz	(??_menu_handle_button+0+0)&0ffh,f
	bra	u8197
	decfsz	(??_menu_handle_button+0+0+1)&0ffh,f
	bra	u8197
asmopt pop

	line	1254
	
l6741:
	movlw	high(064h)
	movwf	((c:beep@duration_ms+1))^00h,c
	movlw	low(064h)
	movwf	((c:beep@duration_ms))^00h,c
	call	_beep	;wreg free
	line	1255
	asmopt push
asmopt off
movlw  3
	movlb	1	; () banked
movwf	(??_menu_handle_button+0+0+1)&0ffh
movlw	8
movwf	(??_menu_handle_button+0+0)&0ffh
	movlw	119
u8207:
decfsz	wreg,f
	bra	u8207
	decfsz	(??_menu_handle_button+0+0)&0ffh,f
	bra	u8207
	decfsz	(??_menu_handle_button+0+0+1)&0ffh,f
	bra	u8207
asmopt pop

	goto	l6733
	line	1259
	
l857:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_handle_button
	__end_of_menu_handle_button:
	signat	_menu_handle_button,4217
	global	_rebuild_input_menu

;; *************** function _rebuild_input_menu *****************
;; Defined at:
;;		line 363 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  input_num       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  input_num       1  102[BANK0 ] unsigned char 
;;  buf            50    0[BANK0 ] unsigned char [50]
;;  i               1   97[BANK0 ] unsigned char 
;;  buf            30   50[BANK0 ] unsigned char [30]
;;  sensor          1   96[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/0
;;		On exit  : 3F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0     103       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1     103       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      104 bytes
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
psect	text8,class=CODE,space=0,reloc=2,group=0
	line	363
global __ptext8
__ptext8:
psect	text8
	file	"src\menu.c"
	line	363
	
_rebuild_input_menu:
;incstack = 0
	callstack 24
	movwf	((rebuild_input_menu@input_num))&0ffh
	line	366
	
l4853:
	movff	(rebuild_input_menu@input_num),(_current_input)
	line	369
	
l4855:
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
	line	372
	
l4857:; BSR set to: 0

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
	goto	u4691
	goto	u4690
u4691:
	goto	l4861
u4690:
	
l4859:; BSR set to: 0

		movlw	low(STR_95)
	movwf	((_rebuild_input_menu$1046))&0ffh
	movlw	high(STR_95)
	movwf	((_rebuild_input_menu$1046+1))&0ffh

	goto	l4863
	
l4861:; BSR set to: 0

		movlw	low(STR_94)
	movwf	((_rebuild_input_menu$1046))&0ffh
	movlw	high(STR_94)
	movwf	((_rebuild_input_menu$1046+1))&0ffh

	
l4863:; BSR set to: 0

		movlw	low(_value_enable)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_enable)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_93)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_93)
	movwf	((c:sprintf@f+1))^00h,c

		movff	(_rebuild_input_menu$1046),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$1046+1),1+((c:?_sprintf)+04h)

	call	_sprintf	;wreg free
	line	374
	
l4865:
	movlb	0	; () banked
	movf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u4701
	goto	u4700
u4701:
	goto	l4971
u4700:
	line	376
	
l4867:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_96)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_96)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	377
	
l4869:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_97)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_97)
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
	line	378
	
l4871:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_98)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_98)
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
	line	379
	
l4873:
		movlw	low(_value_hi_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_hi_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_99)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_99)
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
	line	381
	
l4875:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2195)
	movff	1+?___lwdiv,(_rebuild_input_menu$2195+1)
	
l4877:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2196)
	movff	1+?___lwmod,(_rebuild_input_menu$2196+1)
	
l4879:
		movlw	low(_value_highbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_highbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_100)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_100)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2195),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2195+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2196),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2196+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	382
	
l4881:
		movlw	low(_value_low_pressure)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_low_pressure)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_101)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_101)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	high(032h)
	movwf	(1+((c:?_sprintf)+04h))^00h,c
	movlw	low(032h)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	384
	
l4883:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2195)
	movff	1+?___lwdiv,(_rebuild_input_menu$2195+1)
	
l4885:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2196)
	movff	1+?___lwmod,(_rebuild_input_menu$2196+1)
	
l4887:
		movlw	low(_value_plpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_plpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_102)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_102)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2195),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2195+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2196),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2196+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	386
	
l4889:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2195)
	movff	1+?___lwdiv,(_rebuild_input_menu$2195+1)
	
l4891:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2196)
	movff	1+?___lwmod,(_rebuild_input_menu$2196+1)
	
l4893:
		movlw	low(_value_slpbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_slpbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_103)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_103)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2195),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2195+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2196),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2196+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	388
	
l4895:
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
	goto	u4711
	goto	u4710
u4711:
	goto	l4903
u4710:
	
l4897:; BSR set to: 0

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
	goto	u4721
	goto	u4720

u4721:
	goto	l4901
u4720:
	
l4899:; BSR set to: 0

		movlw	low(STR_106)
	movwf	((_rebuild_input_menu$1061))&0ffh
	movlw	high(STR_106)
	movwf	((_rebuild_input_menu$1061+1))&0ffh

	goto	l508
	
l4901:; BSR set to: 0

		movlw	low(STR_105)
	movwf	((_rebuild_input_menu$1061))&0ffh
	movlw	high(STR_105)
	movwf	((_rebuild_input_menu$1061+1))&0ffh

	
l508:; BSR set to: 0

		movff	(_rebuild_input_menu$1061),(_rebuild_input_menu$1060)
	movff	(_rebuild_input_menu$1061+1),(_rebuild_input_menu$1060+1)

	goto	l4905
	
l4903:; BSR set to: 0

		movlw	low(STR_104)
	movwf	((_rebuild_input_menu$1060))&0ffh
	movlw	high(STR_104)
	movwf	((_rebuild_input_menu$1060+1))&0ffh

	
l4905:; BSR set to: 0

		movlw	low(_value_rlyhigh)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyhigh)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1060),(c:strcpy@from)
	movff	(_rebuild_input_menu$1060+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	390
	
l4907:
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
	goto	u4731
	goto	u4730
u4731:
	goto	l4915
u4730:
	
l4909:; BSR set to: 0

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
	goto	u4741
	goto	u4740

u4741:
	goto	l4913
u4740:
	
l4911:; BSR set to: 0

		movlw	low(STR_109)
	movwf	((_rebuild_input_menu$1068))&0ffh
	movlw	high(STR_109)
	movwf	((_rebuild_input_menu$1068+1))&0ffh

	goto	l516
	
l4913:; BSR set to: 0

		movlw	low(STR_108)
	movwf	((_rebuild_input_menu$1068))&0ffh
	movlw	high(STR_108)
	movwf	((_rebuild_input_menu$1068+1))&0ffh

	
l516:; BSR set to: 0

		movff	(_rebuild_input_menu$1068),(_rebuild_input_menu$1067)
	movff	(_rebuild_input_menu$1068+1),(_rebuild_input_menu$1067+1)

	goto	l4917
	
l4915:; BSR set to: 0

		movlw	low(STR_107)
	movwf	((_rebuild_input_menu$1067))&0ffh
	movlw	high(STR_107)
	movwf	((_rebuild_input_menu$1067+1))&0ffh

	
l4917:; BSR set to: 0

		movlw	low(_value_rlyplp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyplp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1067),(c:strcpy@from)
	movff	(_rebuild_input_menu$1067+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	392
	
l4919:
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
	goto	u4751
	goto	u4750
u4751:
	goto	l4927
u4750:
	
l4921:; BSR set to: 0

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
	goto	u4761
	goto	u4760

u4761:
	goto	l4925
u4760:
	
l4923:; BSR set to: 0

		movlw	low(STR_112)
	movwf	((_rebuild_input_menu$1075))&0ffh
	movlw	high(STR_112)
	movwf	((_rebuild_input_menu$1075+1))&0ffh

	goto	l524
	
l4925:; BSR set to: 0

		movlw	low(STR_111)
	movwf	((_rebuild_input_menu$1075))&0ffh
	movlw	high(STR_111)
	movwf	((_rebuild_input_menu$1075+1))&0ffh

	
l524:; BSR set to: 0

		movff	(_rebuild_input_menu$1075),(_rebuild_input_menu$1074)
	movff	(_rebuild_input_menu$1075+1),(_rebuild_input_menu$1074+1)

	goto	l4929
	
l4927:; BSR set to: 0

		movlw	low(STR_110)
	movwf	((_rebuild_input_menu$1074))&0ffh
	movlw	high(STR_110)
	movwf	((_rebuild_input_menu$1074+1))&0ffh

	
l4929:; BSR set to: 0

		movlw	low(_value_rlyslp)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_rlyslp)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1074),(c:strcpy@from)
	movff	(_rebuild_input_menu$1074+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	393
	
l4931:
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
	goto	u4771
	goto	u4770
u4771:
	goto	l4935
u4770:
	
l4933:; BSR set to: 0

		movlw	low(STR_114)
	movwf	((_rebuild_input_menu$1079))&0ffh
	movlw	high(STR_114)
	movwf	((_rebuild_input_menu$1079+1))&0ffh

	goto	l4937
	
l4935:; BSR set to: 0

		movlw	low(STR_113)
	movwf	((_rebuild_input_menu$1079))&0ffh
	movlw	high(STR_113)
	movwf	((_rebuild_input_menu$1079+1))&0ffh

	
l4937:; BSR set to: 0

		movlw	low(_value_display)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_display)
	movwf	((c:strcpy@to+1))^00h,c

		movff	(_rebuild_input_menu$1079),(c:strcpy@from)
	movff	(_rebuild_input_menu$1079+1),(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	396
	
l4939:
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
	line	399
	
l4941:
		movlw	low(_value_enable)
	movlb	2	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	400
	
l4943:; BSR set to: 2

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	401
	
l4945:; BSR set to: 2

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	clrf	(1+(_input_menu+0Ch))&0ffh

	line	402
	
l4947:; BSR set to: 2

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	403
	
l4949:; BSR set to: 2

		movlw	low(_value_hi_pressure)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_hi_pressure)
	movwf	(1+(_input_menu+016h))&0ffh

	line	404
	
l4951:; BSR set to: 2

		movlw	low(_value_highbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_highbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	405
	
l4953:; BSR set to: 2

		movlw	low(_value_low_pressure)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_low_pressure)
	movwf	(1+(_input_menu+020h))&0ffh

	line	406
	
l4955:; BSR set to: 2

		movlw	low(_value_plpbp)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_plpbp)
	movwf	(1+(_input_menu+025h))&0ffh

	line	407
	
l4957:; BSR set to: 2

		movlw	low(_value_slpbp)
	movwf	(0+(_input_menu+02Ah))&0ffh
	movlw	high(_value_slpbp)
	movwf	(1+(_input_menu+02Ah))&0ffh

	line	408
	
l4959:; BSR set to: 2

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+02Fh))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+02Fh))&0ffh

	line	409
	
l4961:; BSR set to: 2

		movlw	low(_value_rlyplp)
	movwf	(0+(_input_menu+034h))&0ffh
	movlw	high(_value_rlyplp)
	movwf	(1+(_input_menu+034h))&0ffh

	line	410
	
l4963:; BSR set to: 2

		movlw	low(_value_rlyslp)
	movwf	(0+(_input_menu+039h))&0ffh
	movlw	high(_value_rlyslp)
	movwf	(1+(_input_menu+039h))&0ffh

	line	411
	
l4965:; BSR set to: 2

		movlw	low(_value_display)
	movwf	(0+(_input_menu+03Eh))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+03Eh))&0ffh

	line	412
	
l4967:; BSR set to: 2

		movlw	low(_value_back)
	movwf	(0+(_input_menu+043h))&0ffh
	clrf	(1+(_input_menu+043h))&0ffh

	line	414
	
l4969:; BSR set to: 2

	movlw	low(0Eh)
	movlb	0	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	415
	goto	l5009
	line	416
	
l4971:; BSR set to: 0

		decf	((rebuild_input_menu@sensor))&0ffh,w
	btfss	status,2
	goto	u4781
	goto	u4780

u4781:
	goto	l5009
u4780:
	line	418
	
l4973:; BSR set to: 0

		movlw	low(_value_sensor)
	movwf	((c:strcpy@to))^00h,c
	movlw	high(_value_sensor)
	movwf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_115)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_115)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	line	419
	
l4975:
		movlw	low(_value_scale4)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_116)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_116)
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
	line	420
	
l4977:
		movlw	low(_value_scale20)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_scale20)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_117)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_117)
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
	line	421
	
l4979:
		movlw	low(_value_high_temp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_temp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_118)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_118)
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
	line	423
	
l4981:
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
	movff	0+?___lwdiv,(_rebuild_input_menu$2195)
	movff	1+?___lwdiv,(_rebuild_input_menu$2195+1)
	
l4983:
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
	movff	0+?___lwmod,(_rebuild_input_menu$2196)
	movff	1+?___lwmod,(_rebuild_input_menu$2196+1)
	
l4985:
		movlw	low(_value_high_tbp)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(_value_high_tbp)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_119)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_119)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(_rebuild_input_menu$2195),0+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2195+1),1+((c:?_sprintf)+04h)
	movff	(_rebuild_input_menu$2196),0+((c:?_sprintf)+06h)
	movff	(_rebuild_input_menu$2196+1),1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	426
	
l4987:
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
	line	429
	
l4989:
		movlw	low(_value_enable)
	movlb	2	; () banked
	movwf	(0+(_input_menu+02h))&0ffh
	movlw	high(_value_enable)
	movwf	(1+(_input_menu+02h))&0ffh

	line	430
	
l4991:; BSR set to: 2

		movlw	low(_value_sensor)
	movwf	(0+(_input_menu+07h))&0ffh
	movlw	high(_value_sensor)
	movwf	(1+(_input_menu+07h))&0ffh

	line	431
	
l4993:; BSR set to: 2

		movlw	low(_value_scale4)
	movwf	(0+(_input_menu+0Ch))&0ffh
	clrf	(1+(_input_menu+0Ch))&0ffh

	line	432
	
l4995:; BSR set to: 2

		movlw	low(_value_scale20)
	movwf	(0+(_input_menu+011h))&0ffh
	movlw	high(_value_scale20)
	movwf	(1+(_input_menu+011h))&0ffh

	line	433
	
l4997:; BSR set to: 2

		movlw	low(_value_high_temp)
	movwf	(0+(_input_menu+016h))&0ffh
	movlw	high(_value_high_temp)
	movwf	(1+(_input_menu+016h))&0ffh

	line	434
	
l4999:; BSR set to: 2

		movlw	low(_value_high_tbp)
	movwf	(0+(_input_menu+01Bh))&0ffh
	movlw	high(_value_high_tbp)
	movwf	(1+(_input_menu+01Bh))&0ffh

	line	435
	
l5001:; BSR set to: 2

		movlw	low(_value_rlyhigh)
	movwf	(0+(_input_menu+020h))&0ffh
	movlw	high(_value_rlyhigh)
	movwf	(1+(_input_menu+020h))&0ffh

	line	436
	
l5003:; BSR set to: 2

		movlw	low(_value_display)
	movwf	(0+(_input_menu+025h))&0ffh
	movlw	high(_value_display)
	movwf	(1+(_input_menu+025h))&0ffh

	line	437
	
l5005:; BSR set to: 2

		movlw	low(_value_back)
	movwf	(0+(_input_menu+02Ah))&0ffh
	clrf	(1+(_input_menu+02Ah))&0ffh

	line	439
	
l5007:; BSR set to: 2

	movlw	low(09h)
	movlb	0	; () banked
	movwf	(0+(_menu+02h))&0ffh
	line	445
	
l5009:; BSR set to: 0

		movlw	low(rebuild_input_menu@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_120)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_120)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+02h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	446
	
l5011:
		movlw	low(rebuild_input_menu@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	449
	
l5013:
		movlw	low(STR_121)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_121)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	450
	
l5015:
	movlw	low(0Ch)
	movlb	0	; () banked
	movwf	((rebuild_input_menu@i))&0ffh
	
l5017:; BSR set to: 0

		movlw	0Eh-1
	cpfsgt	((rebuild_input_menu@i))&0ffh
	goto	u4791
	goto	u4790

u4791:
	goto	l5021
u4790:
	goto	l533
	line	453
	
l5021:; BSR set to: 0

		movlw	low(rebuild_input_menu@buf_1092)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_122)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_122)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(rebuild_input_menu@i),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movf	((rebuild_input_menu@i))&0ffh,w
	mullw	05h
	movlw	low(_input_menu)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+06h)
	movff	postdec2,1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	454
	
l5023:
		movlw	low(rebuild_input_menu@buf_1092)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	450
	
l5025:
	movlb	0	; () banked
	incf	((rebuild_input_menu@i))&0ffh
	goto	l5017
	line	456
	
l533:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_rebuild_input_menu
	__end_of_rebuild_input_menu:
	signat	_rebuild_input_menu,4217
	global	_menu_update_time_value

;; *************** function _menu_update_time_value *****************
;; Defined at:
;;		line 235 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  debug          50  100[BANK1 ] unsigned char [50]
;;  debug_after    50   50[BANK1 ] unsigned char [50]
;;  debug_before   50    0[BANK1 ] unsigned char [50]
;;  value_buf       6  151[BANK1 ] unsigned char [6]
;;  screen_line     1  157[BANK1 ] unsigned char 
;;  start_col       1    0        unsigned char 
;;  item_idx        1  150[BANK1 ] unsigned char 
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
;;      Locals:         0       0     158       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0     158       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      158 bytes
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
psect	text9,class=CODE,space=0,reloc=2,group=0
	line	235
global __ptext9
__ptext9:
psect	text9
	file	"src\menu.c"
	line	235
	
_menu_update_time_value:; BSR set to: 0

;incstack = 0
	callstack 25
	line	238
	
l4597:
	movlb	1	; () banked
		decf	((_current_menu))&0ffh,w
	btfss	status,2
	goto	u4271
	goto	u4270

u4271:
	goto	l466
u4270:
	
l4599:; BSR set to: 1

	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfss	status,2
	goto	u4281
	goto	u4280
u4281:
	goto	l4601
u4280:
	goto	l466
	line	242
	
l4601:; BSR set to: 0

	movf	(0+(_menu+01h))&0ffh,w
	subwf	((_menu))&0ffh,w
	movlb	1	; () banked
	movwf	((menu_update_time_value@screen_line))&0ffh
	line	243
		movlw	03h-1
	cpfsgt	((menu_update_time_value@screen_line))&0ffh
	goto	u4291
	goto	u4290

u4291:
	goto	l467
u4290:
	goto	l466
	line	244
	
l467:; BSR set to: 1

	line	247
	movff	(_menu),(menu_update_time_value@item_idx)
	line	250
	
l4605:; BSR set to: 1

	movf	((menu_update_time_value@item_idx))&0ffh,w
	
	call	_is_time_field
	iorlw	0
	btfss	status,2
	goto	u4301
	goto	u4300
u4301:
	goto	l4609
u4300:
	goto	l466
	line	259
	
l4609:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_update_time_value@debug_before)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_84)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_84)
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
	line	260
	
l4611:
		movlw	low(menu_update_time_value@debug_before)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_update_time_value@debug_before)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	263
	
l4613:
	movlb	0	; () banked
	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u4311
	goto	u4310
u4311:
	goto	l4619
u4310:
	
l4615:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u4321
	goto	u4320
u4321:
	goto	l4619
u4320:
	line	265
	
l4617:; BSR set to: 0

	movlw	low(020h)
	movlb	1	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	266
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	267
	goto	l4621
	line	270
	
l4619:; BSR set to: 0

	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	(0+(_menu+012h))&0ffh,w
	
	call	___lbdiv
	addlw	low(030h)
	movlb	1	; () banked
	movwf	((menu_update_time_value@value_buf))&0ffh
	line	271
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	0	; () banked
	movf	(0+(_menu+012h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	1	; () banked
	movwf	(0+(menu_update_time_value@value_buf+01h))&0ffh
	line	275
	
l4621:; BSR set to: 1

	movlw	low(03Ah)
	movwf	(0+(menu_update_time_value@value_buf+02h))&0ffh
	line	278
	
l4623:; BSR set to: 1

	movlb	0	; () banked
		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u4331
	goto	u4330

u4331:
	goto	l4629
u4330:
	
l4625:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u4341
	goto	u4340
u4341:
	goto	l4629
u4340:
	line	280
	
l4627:; BSR set to: 0

	movlw	low(020h)
	movlb	1	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	281
	movlw	low(020h)
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	282
	goto	l4631
	line	285
	
l4629:; BSR set to: 0

	movlw	low(0Ah)
	movwf	((c:___lbdiv@divisor))^00h,c
	movf	(0+(_menu+013h))&0ffh,w
	
	call	___lbdiv
	addlw	low(030h)
	movlb	1	; () banked
	movwf	(0+(menu_update_time_value@value_buf+03h))&0ffh
	line	286
	movlw	low(0Ah)
	movwf	((c:___lbmod@divisor))^00h,c
	movlb	0	; () banked
	movf	(0+(_menu+013h))&0ffh,w
	
	call	___lbmod
	addlw	low(030h)
	movlb	1	; () banked
	movwf	(0+(menu_update_time_value@value_buf+04h))&0ffh
	line	289
	
l4631:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(menu_update_time_value@value_buf+05h))&0ffh
	line	293
	
l4633:; BSR set to: 1

		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_update_time_value@debug_after)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_85)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_85)
	movwf	((c:sprintf@f+1))^00h,c

		movlw	low(menu_update_time_value@value_buf)
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	movlw	high(menu_update_time_value@value_buf)
	movwf	(1+((c:?_sprintf)+04h))^00h,c

	call	_sprintf	;wreg free
	line	294
	
l4635:
		movlw	low(menu_update_time_value@debug_after)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_update_time_value@debug_after)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	298
	
l4637:
	movlb	0	; () banked
	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u4351
	goto	u4350
u4351:
	goto	l4643
u4350:
	
l4639:; BSR set to: 0

	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u4361
	goto	u4360
u4361:
	goto	l4643
u4360:
	line	300
	
l4641:; BSR set to: 0

		movlw	low(menu_update_time_value@debug)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_update_time_value@debug)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_86)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_86)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+013h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	301
	goto	l4651
	line	302
	
l4643:; BSR set to: 0

	movf	(0+(_menu+05h))&0ffh,w
	btfss	status,2
	goto	u4371
	goto	u4370
u4371:
	goto	l4649
u4370:
	
l4645:; BSR set to: 0

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u4381
	goto	u4380

u4381:
	goto	l4649
u4380:
	line	304
	
l4647:; BSR set to: 0

		movlw	low(menu_update_time_value@debug)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_update_time_value@debug)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_87)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_87)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	305
	goto	l4651
	line	308
	
l4649:; BSR set to: 0

		movlw	low(menu_update_time_value@debug)
	movwf	((c:sprintf@sp))^00h,c
	movlw	high(menu_update_time_value@debug)
	movwf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_88)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_88)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	310
	
l4651:
		movlw	low(menu_update_time_value@debug)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(menu_update_time_value@debug)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	313
	
l4653:
	line	315
	
l4655:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	1	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	316
	
l4657:
		movlw	low(STR_89)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_89)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	318
	
l4659:
	movlw	low(0Dh)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movlb	1	; () banked
	incf	((menu_update_time_value@screen_line))&0ffh,w
	
	call	_lcd_set_cursor
	line	319
	
l4661:
		movlw	low(STR_90)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_90)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	320
	
l4663:
		movlw	low(menu_update_time_value@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(menu_update_time_value@value_buf)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	321
	
l4665:
		movlw	low(STR_91)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_91)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	322
	
l466:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_update_time_value
	__end_of_menu_update_time_value:
	signat	_menu_update_time_value,89
	global	_is_time_field

;; *************** function _is_time_field *****************
;; Defined at:
;;		line 144 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  line            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  line            1   15[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3E/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_menu_update_time_value
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2,group=0
	line	144
global __ptext10
__ptext10:
psect	text10
	file	"src\menu.c"
	line	144
	
_is_time_field:
;incstack = 0
	callstack 27
	movwf	((c:is_time_field@line))^00h,c
	line	148
	
l4387:
	movlw	low(01h)
	movwf	((c:_is_time_field$995))^00h,c
	
l4389:
		movlw	5
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u4031
	goto	u4030

u4031:
	goto	l432
u4030:
	
l4391:
		movlw	7
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u4041
	goto	u4040

u4041:
	goto	l432
u4040:
	
l4393:
		movlw	8
	xorwf	((c:is_time_field@line))^00h,c,w
	btfsc	status,2
	goto	u4051
	goto	u4050

u4051:
	goto	l432
u4050:
	
l4395:
	movlw	low(0)
	movwf	((c:_is_time_field$995))^00h,c
	
l432:
	movf	((c:_is_time_field$995))^00h,c,w
	line	149
	
l433:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_time_field
	__end_of_is_time_field:
	signat	_is_time_field,4217
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
;;		On entry : 3F/0
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
psect	text11,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
global __ptext11
__ptext11:
psect	text11
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbmod.c"
	line	4
	
___lbmod:
;incstack = 0
	callstack 27
	movwf	((c:___lbmod@dividend))^00h,c
	line	9
	
l4551:
	movlw	low(08h)
	movwf	((c:___lbmod@counter))^00h,c
	line	10
	movlw	low(0)
	movwf	((c:___lbmod@rem))^00h,c
	line	12
	
l4553:
	bcf	status,0
	rlcf	((c:___lbmod@dividend))^00h,c,w
	rlcf	((c:___lbmod@rem))^00h,c,w
	movwf	((c:___lbmod@rem))^00h,c
	line	13
	
l4555:
	bcf status,0
	rlcf	((c:___lbmod@dividend))^00h,c

	line	14
	
l4557:
		movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c,w
	btfss	status,0
	goto	u4221
	goto	u4220

u4221:
	goto	l4561
u4220:
	line	15
	
l4559:
	movf	((c:___lbmod@divisor))^00h,c,w
	subwf	((c:___lbmod@rem))^00h,c
	line	16
	
l4561:
	decfsz	((c:___lbmod@counter))^00h,c
	
	goto	l4553
	line	17
	
l4563:
	movf	((c:___lbmod@rem))^00h,c,w
	line	18
	
l1453:
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
;;		On entry : 3F/0
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
psect	text12,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
global __ptext12
__ptext12:
psect	text12
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lbdiv.c"
	line	4
	
___lbdiv:
;incstack = 0
	callstack 27
	movwf	((c:___lbdiv@dividend))^00h,c
	line	9
	
l4525:
	movlw	low(0)
	movwf	((c:___lbdiv@quotient))^00h,c
	line	10
	
l4527:
	movf	((c:___lbdiv@divisor))^00h,c,w
	btfsc	status,2
	goto	u4191
	goto	u4190
u4191:
	goto	l4547
u4190:
	line	11
	
l4529:
	movlw	low(01h)
	movwf	((c:___lbdiv@counter))^00h,c
	line	12
	goto	l4535
	line	13
	
l4531:
	bcf status,0
	rlcf	((c:___lbdiv@divisor))^00h,c

	line	14
	
l4533:
	incf	((c:___lbdiv@counter))^00h,c
	line	12
	
l4535:
	
	btfss	((c:___lbdiv@divisor))^00h,c,(7)&7
	goto	u4201
	goto	u4200
u4201:
	goto	l4531
u4200:
	line	17
	
l4537:
	bcf status,0
	rlcf	((c:___lbdiv@quotient))^00h,c

	line	18
		movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c,w
	btfss	status,0
	goto	u4211
	goto	u4210

u4211:
	goto	l4543
u4210:
	line	19
	
l4539:
	movf	((c:___lbdiv@divisor))^00h,c,w
	subwf	((c:___lbdiv@dividend))^00h,c
	line	20
	
l4541:
	bsf	(0+(0/8)+(c:___lbdiv@quotient))^00h,c,(0)&7
	line	22
	
l4543:
	bcf status,0
	rrcf	((c:___lbdiv@divisor))^00h,c

	line	23
	
l4545:
	decfsz	((c:___lbdiv@counter))^00h,c
	
	goto	l4537
	line	25
	
l4547:
	movf	((c:___lbdiv@quotient))^00h,c,w
	line	26
	
l1447:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
	signat	___lbdiv,8313
	global	_menu_draw_setup

;; *************** function _menu_draw_setup *****************
;; Defined at:
;;		line 1262 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  type_text       2   46[COMRAM] PTR const unsigned char 
;;		 -> STR_165(5), STR_164(5), STR_163(9), 
;;  type_len        1   45[COMRAM] unsigned char 
;;  sensor_type     1   48[COMRAM] unsigned char 
;;  item_idx        1   49[COMRAM] unsigned char 
;;  i               1   50[COMRAM] unsigned char 
;;  setup_items    10   35[COMRAM] PTR const unsigned char 
;;		 -> STR_162(5), STR_161(6), STR_160(8), STR_159(8), 
;;		 -> STR_158(8), 
;;  sensor_type_    6   29[COMRAM] PTR const unsigned char 
;;		 -> STR_165(5), STR_164(5), STR_163(9), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        22       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        27       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       27 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_lcd_clear_line
;;		_lcd_print
;;		_lcd_print_at
;;		_strlen
;; This function is called by:
;;		_main
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	1262
global __ptext13
__ptext13:
psect	text13
	file	"src\menu.c"
	line	1262
	
_menu_draw_setup:
;incstack = 0
	callstack 23
	line	1267
	
l4799:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	1268
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_157)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_157)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	1276
	
l4801:
	lfsr	2,(menu_draw_setup@F2633)
	lfsr	1,(menu_draw_setup@setup_items)
	movlw	10-1
u4611:
	movff	plusw2,plusw1
	decf	wreg
	bc	u4611

	line	1279
	
l4803:
	lfsr	2,(menu_draw_setup@F2635)
	lfsr	1,(menu_draw_setup@sensor_type_names)
	movlw	6-1
u4621:
	movff	plusw2,plusw1
	decf	wreg
	bc	u4621

	line	1282
	
l4805:
	movlw	low(0)
	movwf	((c:menu_draw_setup@i))^00h,c
	goto	l4835
	line	1284
	
l4807:; BSR set to: 0

	movf	(0+(_menu+01h))&0ffh,w
	addwf	((c:menu_draw_setup@i))^00h,c,w
	movwf	((c:menu_draw_setup@item_idx))^00h,c
	line	1285
	
l4809:; BSR set to: 0

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_clear_line
	line	1288
	
l4811:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	movlb	0	; () banked
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u4631
	goto	u4630

u4631:
	goto	l4819
u4630:
	line	1290
	
l4813:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_166)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_166)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1291
	
l4815:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_items)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:lcd_print@str)
	movff	postdec2,(c:lcd_print@str+1)
	call	_lcd_print	;wreg free
	line	1292
	
l4817:
		movlw	low(STR_167)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_167)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	1293
	goto	l4821
	line	1296
	
l4819:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:lcd_print_at@col))^00h,c
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@setup_items)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:lcd_print_at@str)
	movff	postdec2,(c:lcd_print_at@str+1)
	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1300
	
l4821:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@item_idx))^00h,c
	goto	u4641
	goto	u4640

u4641:
	goto	l4833
u4640:
	line	1302
	
l4823:
	movf	((c:menu_draw_setup@item_idx))^00h,c,w
	mullw	080h
	movlw	low(_input_config+01h)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_config+01h)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:menu_draw_setup@sensor_type))^00h,c
	line	1303
	
l4825:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@sensor_type))^00h,c
	goto	u4651
	goto	u4650

u4651:
	goto	l4833
u4650:
	line	1305
	
l4827:
	movf	((c:menu_draw_setup@sensor_type))^00h,c,w
	mullw	02h
	movf	(prodl)^0f00h,c,w
	addlw	low(menu_draw_setup@sensor_type_names)
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:menu_draw_setup@type_text)
	movff	postdec2,(c:menu_draw_setup@type_text+1)
	line	1306
	
l4829:
		movff	(c:menu_draw_setup@type_text),(c:strlen@s)
	movff	(c:menu_draw_setup@type_text+1),(c:strlen@s+1)

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movwf	((c:menu_draw_setup@type_len))^00h,c
	line	1308
	
l4831:
	movf	((c:menu_draw_setup@type_len))^00h,c,w
	sublw	low(014h)
	movwf	((c:lcd_print_at@col))^00h,c
		movff	(c:menu_draw_setup@type_text),(c:lcd_print_at@str)
	movff	(c:menu_draw_setup@type_text+1),(c:lcd_print_at@str+1)

	incf	((c:menu_draw_setup@i))^00h,c,w
	
	call	_lcd_print_at
	line	1282
	
l4833:
	incf	((c:menu_draw_setup@i))^00h,c
	
l4835:
		movlw	03h-0
	cpfslt	((c:menu_draw_setup@i))^00h,c
	goto	u4661
	goto	u4660

u4661:
	goto	l875
u4660:
	
l4837:
	movlb	0	; () banked
	movf	(0+(_menu+02h))&0ffh,w
	movwf	(??_menu_draw_setup+0+0)^00h,c
	clrf	(??_menu_draw_setup+0+0+1)^00h,c

	movf	((c:menu_draw_setup@i))^00h,c,w
	movff	0+(_menu+01h),??_menu_draw_setup+2+0
	clrf	(??_menu_draw_setup+2+0+1)^00h,c
	addwf	(??_menu_draw_setup+2+0)^00h,c
	movlw	0
	addwfc	(??_menu_draw_setup+2+1)^00h,c
		movf	(??_menu_draw_setup+0+0)^00h,c,w
	subwf	(??_menu_draw_setup+2+0)^00h,c,w
	movf	(??_menu_draw_setup+2+1)^00h,c,w
	xorlw	80h
	movwf	(??_menu_draw_setup+4+0)^00h,c
	movf	(??_menu_draw_setup+0+1)^00h,c,w
	xorlw	80h
	subwfb	(??_menu_draw_setup+4+0)^00h,c,w
	btfss	status,0
	goto	u4671
	goto	u4670

u4671:
	goto	l4807
u4670:
	line	1312
	
l875:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_setup
	__end_of_menu_draw_setup:
	signat	_menu_draw_setup,89
	global	_menu_draw_options

;; *************** function _menu_draw_options *****************
;; Defined at:
;;		line 648 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   29[COMRAM] unsigned char 
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
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_lcd_clear_line
;;		_lcd_print
;;		_lcd_print_at
;; This function is called by:
;;		_main
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text14,class=CODE,space=0,reloc=2,group=0
	line	648
global __ptext14
__ptext14:
psect	text14
	file	"src\menu.c"
	line	648
	
_menu_draw_options:
;incstack = 0
	callstack 23
	line	651
	
l4575:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	652
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_130)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_130)
	movwf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	655
	
l4577:
	movlw	low(0)
	movwf	((c:menu_draw_options@i))^00h,c
	goto	l4593
	line	657
	
l4579:; BSR set to: 0

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_clear_line
	line	660
	
l4581:
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
	bnz	u4241
movf	(??_menu_draw_options+0+1)^00h,c,w
xorwf	(??_menu_draw_options+2+1)^00h,c,w
	btfss	status,2
	goto	u4241
	goto	u4240

u4241:
	goto	l4589
u4240:
	line	662
	
l4583:; BSR set to: 0

	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(STR_131)
	movwf	((c:lcd_print_at@str))^00h,c
	movlw	high(STR_131)
	movwf	((c:lcd_print_at@str+1))^00h,c

	incf	((c:menu_draw_options@i))^00h,c,w
	
	call	_lcd_print_at
	line	663
	
l4585:
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
	line	664
	
l4587:
		movlw	low(STR_132)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_132)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	665
	goto	l4591
	line	668
	
l4589:; BSR set to: 0

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
	line	655
	
l4591:
	incf	((c:menu_draw_options@i))^00h,c
	
l4593:
		movlw	03h-0
	cpfslt	((c:menu_draw_options@i))^00h,c
	goto	u4251
	goto	u4250

u4251:
	goto	l661
u4250:
	
l4595:
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
	goto	u4261
	goto	u4260

u4261:
	goto	l4579
u4260:
	line	671
	
l661:
	return	;funcret
	callstack 0
GLOBAL	__end_of_menu_draw_options
	__end_of_menu_draw_options:
	signat	_menu_draw_options,89
	global	_menu_draw_input

;; *************** function _menu_draw_input *****************
;; Defined at:
;;		line 674 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1   93[BANK0 ] unsigned char 
;;  j               1   94[BANK0 ] unsigned char 
;;  val_len         1   91[BANK0 ] unsigned char 
;;  val_len         1   92[BANK0 ] unsigned char 
;;  flag_value      1   90[BANK0 ] unsigned char 
;;  flag_value      1   89[BANK0 ] unsigned char 
;;  start_pos       1   80[BANK0 ] unsigned char 
;;  opts            2   97[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  opts            2   95[BANK0 ] PTR const struct .
;;		 -> NULL(0), menu_item_options(24), 
;;  buf            50    5[BANK0 ] unsigned char [50]
;;  value_buf      15   65[BANK0 ] unsigned char [15]
;;  item_idx        1  102[BANK0 ] unsigned char 
;;  show_bracket    1  100[BANK0 ] unsigned char 
;;  val_len         1   99[BANK0 ] unsigned char 
;;  i               1  101[BANK0 ] unsigned char 
;;  title          10   55[BANK0 ] unsigned char [10]
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
;;      Locals:         0      98       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0     103       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:      103 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_get_item_options
;;		_is_numeric_field
;;		_lcd_clear_line
;;		_lcd_print
;;		_lcd_print_at
;;		_lcd_set_cursor
;;		_sprintf
;;		_strcmp
;;		_strcpy
;;		_strlen
;;		_uart_println
;; This function is called by:
;;		_main
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2,group=0
	line	674
global __ptext15
__ptext15:
psect	text15
	file	"src\menu.c"
	line	674
	
_menu_draw_input:
;incstack = 0
	callstack 23
	line	677
	
l6283:
	movlw	(0)&0ffh
	
	call	_lcd_clear_line
	line	679
	
l6285:
		movlw	low(menu_draw_input@title)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_133)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_133)
	movwf	((c:sprintf@f+1))^00h,c

	movlw	low(01h)
	movlb	1	; () banked
	addwf	((_current_input))&0ffh,w
	movwf	(0+((c:?_sprintf)+04h))^00h,c
	clrf	1+(0+((c:?_sprintf)+04h))^00h,c
	movlw	high(01h)
	addwfc	1+(0+((c:?_sprintf)+04h))^00h,c
	call	_sprintf	;wreg free
	line	680
	
l6287:
	movlw	low(0)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@title)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	movlw	(0)&0ffh
	
	call	_lcd_print_at
	line	683
	
l6289:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((menu_draw_input@i))&0ffh
	goto	l6411
	line	685
	
l6291:; BSR set to: 0

	movf	(0+(_menu+01h))&0ffh,w
	addwf	((menu_draw_input@i))&0ffh,w
	movwf	((menu_draw_input@item_idx))&0ffh
	line	686
	
l6293:; BSR set to: 0

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_clear_line
	line	689
	
l6295:
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
	line	692
	
l6297:
		movlw	0Bh-1
	movlb	0	; () banked
	cpfsgt	((menu_draw_input@item_idx))&0ffh
	goto	u6931
	goto	u6930

u6931:
	goto	l6303
u6930:
	line	695
	
l6299:; BSR set to: 0

		movlw	low(menu_draw_input@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_134)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_134)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(menu_draw_input@item_idx),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movf	((menu_draw_input@item_idx))&0ffh,w
	mullw	05h
	movlw	low(_input_menu)
	addwf	(prodl)^0f00h,c,w
	movwf	c:fsr2l
	movlw	high(_input_menu)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,0+((c:?_sprintf)+06h)
	movff	postdec2,1+((c:?_sprintf)+06h)
	call	_sprintf	;wreg free
	line	696
	
l6301:
		movlw	low(menu_draw_input@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	701
	
l6303:
	line	703
	
l6305:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u6941
	goto	u6940

u6941:
	goto	l6367
u6940:
	line	705
	
l6307:; BSR set to: 0

	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u6951
	goto	u6950
u6951:
	goto	l6363
u6950:
	line	707
	
l6309:; BSR set to: 0

	movlw	low(02h)
	movwf	((menu_draw_input@show_brackets))&0ffh
	line	709
	movf	(0+(_menu+05h))&0ffh,w
	btfsc	status,2
	goto	u6961
	goto	u6960
u6961:
	goto	l6327
u6960:
	line	712
	
l6311:; BSR set to: 0

	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(menu_draw_input@opts)
	movff	1+?_get_item_options,(menu_draw_input@opts+1)
	line	713
	
l6313:
	movlb	0	; () banked
	movf	((menu_draw_input@opts))&0ffh,w
iorwf	((menu_draw_input@opts+1))&0ffh,w
	btfsc	status,2
	goto	u6971
	goto	u6970

u6971:
	goto	l6325
u6970:
	line	715
	
l6315:; BSR set to: 0

	movf	((menu_draw_input@item_idx))&0ffh,w
	btfsc	status,2
	goto	u6981
	goto	u6980
u6981:
	goto	l672
u6980:
	
l6317:; BSR set to: 0

	movff	(_sensor_edit_flag),(_menu_draw_input$1151)
	clrf	((_menu_draw_input$1151+1))&0ffh
	goto	l674
	
l672:; BSR set to: 0

	movff	(_enable_edit_flag),(_menu_draw_input$1151)
	clrf	((_menu_draw_input$1151+1))&0ffh
	
l674:; BSR set to: 0

	movff	(_menu_draw_input$1151),(menu_draw_input@flag_value)
	line	716
	
l6319:; BSR set to: 0

	movlw	01h
	addwf	((menu_draw_input@opts))&0ffh,w
	movwf	(??_menu_draw_input+0+0)&0ffh
	movlw	0
	addwfc	((menu_draw_input@opts+1))&0ffh,w
	movwf	(??_menu_draw_input+0+0+1)&0ffh
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
	cpfslt	((menu_draw_input@flag_value))&0ffh
	goto	u6991
	goto	u6990
u6991:
	goto	l6323
u6990:
	line	718
	
l6321:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

	movf	((menu_draw_input@flag_value))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_draw_input+0+0
	movff	prodh,??_menu_draw_input+0+0+1
	movf	(??_menu_draw_input+0+0)&0ffh,w
	addwf	((menu_draw_input@opts))&0ffh,w
	movwf	(??_menu_draw_input+2+0)&0ffh
	movf	(??_menu_draw_input+0+1)&0ffh,w
	addwfc	((menu_draw_input@opts+1))&0ffh,w
	movwf	1+(??_menu_draw_input+2+0)&0ffh
	movlw	02h
	addwf	(??_menu_draw_input+2+0)&0ffh
	movlw	0
	addwfc	(??_menu_draw_input+2+1)&0ffh
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
	
	movff	tablat,(c:strcpy@from)
	tblrd*-
	
	movff	tablat,(c:strcpy@from+1)

	call	_strcpy	;wreg free
	line	719
	goto	l6371
	line	722
	
l6323:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_135)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_135)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l6371
	line	727
	
l6325:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

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
	goto	l6371
	line	733
	
l6327:; BSR set to: 0

	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_get_item_options
	movff	0+?_get_item_options,(menu_draw_input@opts_1153)
	movff	1+?_get_item_options,(menu_draw_input@opts_1153+1)
	line	734
	
l6329:
	movlb	0	; () banked
	movf	((menu_draw_input@opts_1153))&0ffh,w
iorwf	((menu_draw_input@opts_1153+1))&0ffh,w
	btfsc	status,2
	goto	u7001
	goto	u7000

u7001:
	goto	l6351
u7000:
	line	736
	
l6331:; BSR set to: 0

	movf	((menu_draw_input@item_idx))&0ffh,w
	btfsc	status,2
	goto	u7011
	goto	u7010
u7011:
	goto	l681
u7010:
	
l6333:; BSR set to: 0

	movff	(_sensor_edit_flag),(_menu_draw_input$1158)
	clrf	((_menu_draw_input$1158+1))&0ffh
	goto	l683
	
l681:; BSR set to: 0

	movff	(_enable_edit_flag),(_menu_draw_input$1158)
	clrf	((_menu_draw_input$1158+1))&0ffh
	
l683:; BSR set to: 0

	movff	(_menu_draw_input$1158),(menu_draw_input@flag_value_1157)
	line	737
	
l6335:; BSR set to: 0

	movlw	01h
	addwf	((menu_draw_input@opts_1153))&0ffh,w
	movwf	(??_menu_draw_input+0+0)&0ffh
	movlw	0
	addwfc	((menu_draw_input@opts_1153+1))&0ffh,w
	movwf	(??_menu_draw_input+0+0+1)&0ffh
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
	cpfslt	((menu_draw_input@flag_value_1157))&0ffh
	goto	u7021
	goto	u7020
u7021:
	goto	l6349
u7020:
	line	739
	
l6337:; BSR set to: 0

	movf	((menu_draw_input@flag_value_1157))&0ffh,w
	mullw	02h
	movff	prodl,??_menu_draw_input+0+0
	movff	prodh,??_menu_draw_input+0+0+1
	movf	(??_menu_draw_input+0+0)&0ffh,w
	addwf	((menu_draw_input@opts_1153))&0ffh,w
	movwf	(??_menu_draw_input+2+0)&0ffh
	movf	(??_menu_draw_input+0+1)&0ffh,w
	addwfc	((menu_draw_input@opts_1153+1))&0ffh,w
	movwf	1+(??_menu_draw_input+2+0)&0ffh
	movlw	02h
	addwf	(??_menu_draw_input+2+0)&0ffh
	movlw	0
	addwfc	(??_menu_draw_input+2+1)&0ffh
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
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len))&0ffh
	line	740
	
l6339:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j))&0ffh
	goto	l6345
	line	741
	
l6341:; BSR set to: 0

	movf	((menu_draw_input@j))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	740
	
l6343:; BSR set to: 0

	incf	((menu_draw_input@j))&0ffh
	
l6345:; BSR set to: 0

		movf	((menu_draw_input@val_len))&0ffh,w
	subwf	((menu_draw_input@j))&0ffh,w
	btfss	status,0
	goto	u7031
	goto	u7030

u7031:
	goto	l6341
u7030:
	line	742
	
l6347:; BSR set to: 0

	movf	((menu_draw_input@val_len))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	743
	goto	l6371
	line	746
	
l6349:; BSR set to: 0

		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strcpy@to))^00h,c
	clrf	((c:strcpy@to+1))^00h,c

		movlw	low(STR_136)
	movwf	((c:strcpy@from))^00h,c
	movlw	high(STR_136)
	movwf	((c:strcpy@from+1))^00h,c

	call	_strcpy	;wreg free
	goto	l6371
	line	751
	
l6351:; BSR set to: 0

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
	movwf	((menu_draw_input@val_len_1162))&0ffh
	line	752
	
l6353:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@j_1163))&0ffh
	goto	l6359
	line	753
	
l6355:; BSR set to: 0

	movf	((menu_draw_input@j_1163))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(020h)
	movwf	indf2
	line	752
	
l6357:; BSR set to: 0

	incf	((menu_draw_input@j_1163))&0ffh
	
l6359:; BSR set to: 0

		movf	((menu_draw_input@val_len_1162))&0ffh,w
	subwf	((menu_draw_input@j_1163))&0ffh,w
	btfss	status,0
	goto	u7041
	goto	u7040

u7041:
	goto	l6355
u7040:
	line	754
	
l6361:; BSR set to: 0

	movf	((menu_draw_input@val_len_1162))&0ffh,w
	addlw	low(menu_draw_input@value_buf)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	goto	l6371
	line	761
	
l6363:; BSR set to: 0

	movlw	low(01h)
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l6325
	line	768
	
l6367:; BSR set to: 0

	movlw	low(0)
	movwf	((menu_draw_input@show_brackets))&0ffh
	goto	l6325
	line	773
	
l6371:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:strlen@s))^00h,c
	clrf	((c:strlen@s+1))^00h,c

	call	_strlen	;wreg free
	movf	(0+?_strlen)^00h,c,w
	movlb	0	; () banked
	movwf	((menu_draw_input@val_len_1164))&0ffh
	line	774
	
l6373:; BSR set to: 0

	movf	((menu_draw_input@val_len_1164))&0ffh,w
	btfsc	status,2
	goto	u7051
	goto	u7050
u7051:
	goto	l6409
u7050:
	
l6375:; BSR set to: 0

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
		movlw	low(STR_137)
	movwf	((c:strcmp@s2))^00h,c
	movlw	high(STR_137)
	movwf	((c:strcmp@s2+1))^00h,c

	call	_strcmp	;wreg free
	movf	(0+?_strcmp)^00h,c,w
iorwf	(1+?_strcmp)^00h,c,w
	btfsc	status,2
	goto	u7061
	goto	u7060

u7061:
	goto	l6409
u7060:
	line	777
	
l6377:
	movlb	0	; () banked
	movf	(0+(_menu+03h))&0ffh,w
	btfsc	status,2
	goto	u7071
	goto	u7070
u7071:
	goto	l6385
u7070:
	
l6379:; BSR set to: 0

	movf	((menu_draw_input@item_idx))&0ffh,w
	
	call	_is_numeric_field
	iorlw	0
	btfsc	status,2
	goto	u7081
	goto	u7080
u7081:
	goto	l6385
u7080:
	
l6381:
	movlb	0	; () banked
	movf	((menu_draw_input@item_idx))&0ffh,w
xorwf	((_menu))&0ffh,w
	btfss	status,2
	goto	u7091
	goto	u7090

u7091:
	goto	l6385
u7090:
	line	780
	
l6383:; BSR set to: 0

		movlw	low(STR_138)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_138)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	783
	goto	l6409
	line	786
	
l6385:
	movlb	0	; () banked
	movf	((menu_draw_input@show_brackets))&0ffh,w
	btfss	status,2
	goto	u7101
	goto	u7100
u7101:
	goto	l6389
u7100:
	line	789
	
l6387:; BSR set to: 0

	movf	((menu_draw_input@val_len_1164))&0ffh,w
	sublw	low(013h)
	movwf	((c:lcd_print_at@col))^00h,c
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print_at@str))^00h,c
	clrf	((c:lcd_print_at@str+1))^00h,c

	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_print_at
	line	790
	goto	l6409
	line	794
	
l6389:; BSR set to: 0

	movf	((menu_draw_input@val_len_1164))&0ffh,w
	sublw	low(012h)
	movwf	((menu_draw_input@start_pos))&0ffh
	line	795
	
l6391:; BSR set to: 0

	movff	(menu_draw_input@start_pos),(c:lcd_set_cursor@col)
	incf	((menu_draw_input@i))&0ffh,w
	
	call	_lcd_set_cursor
	line	798
	
l6393:
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u7111
	goto	u7110

u7111:
	goto	l6397
u7110:
	
l6395:; BSR set to: 0

		movlw	low(STR_140)
	movwf	((_menu_draw_input$1171))&0ffh
	movlw	high(STR_140)
	movwf	((_menu_draw_input$1171+1))&0ffh

	goto	l6399
	
l6397:; BSR set to: 0

		movlw	low(STR_139)
	movwf	((_menu_draw_input$1171))&0ffh
	movlw	high(STR_139)
	movwf	((_menu_draw_input$1171+1))&0ffh

	
l6399:; BSR set to: 0

		movff	(_menu_draw_input$1171),(c:lcd_print@str)
	movff	(_menu_draw_input$1171+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	800
	
l6401:
		movlw	low(menu_draw_input@value_buf)
	movwf	((c:lcd_print@str))^00h,c
	clrf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	802
	movlb	0	; () banked
		decf	((menu_draw_input@show_brackets))&0ffh,w
	btfsc	status,2
	goto	u7121
	goto	u7120

u7121:
	goto	l6405
u7120:
	
l6403:; BSR set to: 0

		movlw	low(STR_142)
	movwf	((_menu_draw_input$1175))&0ffh
	movlw	high(STR_142)
	movwf	((_menu_draw_input$1175+1))&0ffh

	goto	l6407
	
l6405:; BSR set to: 0

		movlw	low(STR_141)
	movwf	((_menu_draw_input$1175))&0ffh
	movlw	high(STR_141)
	movwf	((_menu_draw_input$1175+1))&0ffh

	
l6407:; BSR set to: 0

		movff	(_menu_draw_input$1175),(c:lcd_print@str)
	movff	(_menu_draw_input$1175+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	683
	
l6409:
	movlb	0	; () banked
	incf	((menu_draw_input@i))&0ffh
	
l6411:; BSR set to: 0

		movlw	03h-0
	cpfslt	((menu_draw_input@i))&0ffh
	goto	u7131
	goto	u7130

u7131:
	goto	l711
u7130:
	
l6413:; BSR set to: 0

	movf	(0+(_menu+02h))&0ffh,w
	movwf	(??_menu_draw_input+0+0)&0ffh
	clrf	(??_menu_draw_input+0+0+1)&0ffh

	movf	((menu_draw_input@i))&0ffh,w
	movff	0+(_menu+01h),??_menu_draw_input+2+0
	clrf	(??_menu_draw_input+2+0+1)&0ffh
	addwf	(??_menu_draw_input+2+0)&0ffh
	movlw	0
	addwfc	(??_menu_draw_input+2+1)&0ffh
		movf	(??_menu_draw_input+0+0)&0ffh,w
	subwf	(??_menu_draw_input+2+0)&0ffh,w
	movf	(??_menu_draw_input+2+1)&0ffh,w
	xorlw	80h
	movwf	(??_menu_draw_input+4+0)&0ffh
	movf	(??_menu_draw_input+0+1)&0ffh,w
	xorlw	80h
	subwfb	(??_menu_draw_input+4+0)&0ffh,w
	btfss	status,0
	goto	u7141
	goto	u7140

u7141:
	goto	l6291
u7140:
	line	807
	
l711:; BSR set to: 0

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
;;		 -> STR_165(5), STR_164(5), STR_163(9), menu_update_edit_value@value_buf(15), 
;;		 -> menu_draw_input@value_buf(15), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), NULL(0), STR_32(1), STR_31(1), 
;;		 -> STR_30(5), STR_29(5), STR_28(9), STR_27(1), 
;;		 -> STR_26(1), STR_25(1), STR_24(8), STR_23(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_165(5), STR_164(5), STR_163(9), menu_update_edit_value@value_buf(15), 
;;		 -> menu_draw_input@value_buf(15), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), NULL(0), STR_32(1), STR_31(1), 
;;		 -> STR_30(5), STR_29(5), STR_28(9), STR_27(1), 
;;		 -> STR_26(1), STR_25(1), STR_24(8), STR_23(9), 
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
;;		_menu_draw_input
;;		_menu_update_edit_value
;;		_menu_draw_setup
;; This function uses a non-reentrant model
;;
psect	text16,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
global __ptext16
__ptext16:
psect	text16
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strlen.c"
	line	4
	
_strlen:; BSR set to: 0

;incstack = 0
	callstack 27
	line	8
	
l4445:
		movff	(c:strlen@s),(c:strlen@cp)
	movff	(c:strlen@s+1),(c:strlen@cp+1)

	line	9
	goto	l4449
	line	10
	
l4447:
	infsnz	((c:strlen@cp))^00h,c
	incf	((c:strlen@cp+1))^00h,c
	line	9
	
l4449:
	movff	(c:strlen@cp),tblptrl
	movff	(c:strlen@cp+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u4117
	tblrd	*
	
	movf	tablat,w
	bra	u4110
u4117:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u4110:
	iorlw	0
	btfss	status,2
	goto	u4121
	goto	u4120
u4121:
	goto	l4447
u4120:
	line	12
	
l4451:
	movf	((c:strlen@s))^00h,c,w
	subwf	((c:strlen@cp))^00h,c,w
	movwf	((c:?_strlen))^00h,c
	movf	((c:strlen@s+1))^00h,c,w
	subwfb	((c:strlen@cp+1))^00h,c,w
	movwf	1+((c:?_strlen))^00h,c
	line	13
	
l1743:
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
;;		 -> original_value(10), menu_update_edit_value@value_buf(15), menu_draw_input@value_buf(15), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), NULL(0), 
;;  from            2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_144(6), STR_143(6), STR_136(6), STR_135(6), 
;;		 -> value_high_tbp(10), value_high_temp(10), STR_115(5), value_back(5), 
;;		 -> STR_114(5), STR_113(5), value_display(10), STR_112(9), 
;;		 -> STR_111(6), STR_110(6), value_rlyslp(10), STR_109(9), 
;;		 -> STR_108(6), STR_107(6), value_rlyplp(10), STR_106(9), 
;;		 -> STR_105(6), STR_104(6), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), STR_96(9), value_sensor(12), 
;;		 -> value_enable(10), NULL(0), STR_32(1), STR_31(1), 
;;		 -> STR_30(5), STR_29(5), STR_28(9), STR_27(1), 
;;		 -> STR_26(1), STR_25(1), STR_24(8), STR_23(9), 
;; Auto vars:     Size  Location     Type
;;  cp              2   18[COMRAM] PTR unsigned char 
;;		 -> original_value(10), menu_update_edit_value@value_buf(15), menu_draw_input@value_buf(15), value_high_tbp(10), 
;;		 -> value_high_temp(10), value_back(5), value_display(10), value_rlyslp(10), 
;;		 -> value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), value_plpbp(10), 
;;		 -> value_low_pressure(10), value_highbp(10), value_hi_pressure(10), value_scale20(10), 
;;		 -> value_scale4(10), value_sensor(12), value_enable(10), NULL(0), 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] PTR unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 3E/0
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
;;		_menu_draw_input
;;		_menu_update_edit_value
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text17,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
global __ptext17
__ptext17:
psect	text17
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcpy.c"
	line	8
	
_strcpy:
;incstack = 0
	callstack 27
	line	18
	
l4427:
		movff	(c:strcpy@to),(c:strcpy@cp)
	movff	(c:strcpy@to+1),(c:strcpy@cp+1)

	line	19
	goto	l4431
	line	20
	
l4429:
	infsnz	((c:strcpy@cp))^00h,c
	incf	((c:strcpy@cp+1))^00h,c
	line	21
	infsnz	((c:strcpy@from))^00h,c
	incf	((c:strcpy@from+1))^00h,c
	line	19
	
l4431:
	movff	(c:strcpy@from),tblptrl
	movff	(c:strcpy@from+1),tblptrh
	clrf	tblptru
	
	movff	(c:strcpy@cp),fsr2l
	movff	(c:strcpy@cp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u4087
	tblrd	*
	
	movf	tablat,w
	bra	u4080
u4087:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u4080:
	movwf	indf2
	movf	indf2,w
	btfss	status,2
	goto	u4091
	goto	u4090
u4091:
	goto	l4429
u4090:
	line	24
	
l1737:
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
;;		 -> value_high_tbp(10), value_high_temp(10), value_back(5), value_display(10), 
;;		 -> value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), value_slpbp(10), 
;;		 -> value_plpbp(10), value_low_pressure(10), value_highbp(10), value_hi_pressure(10), 
;;		 -> value_scale20(10), value_scale4(10), value_sensor(12), value_enable(10), 
;;		 -> NULL(0), 
;;  s2              2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_137(1), STR_32(1), STR_31(1), STR_30(5), 
;;		 -> STR_29(5), STR_28(9), STR_27(1), STR_26(1), 
;;		 -> STR_25(1), STR_24(8), STR_23(9), 
;; Auto vars:     Size  Location     Type
;;  r               1   20[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] int 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 3E/1
;;		On exit  : 3E/0
;;		Unchanged: 3E/0
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
psect	text18,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
global __ptext18
__ptext18:
psect	text18
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\strcmp.c"
	line	33
	
_strcmp:
;incstack = 0
	callstack 27
	line	37
	
l4455:
	goto	l4459
	line	38
	
l4457:
	infsnz	((c:strcmp@s1))^00h,c
	incf	((c:strcmp@s1+1))^00h,c
	line	39
	infsnz	((c:strcmp@s2))^00h,c
	incf	((c:strcmp@s2+1))^00h,c
	line	37
	
l4459:
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
	goto	u4131
	goto	u4130
u4131:
	goto	l4463
u4130:
	
l4461:
	movff	(c:strcmp@s1),fsr2l
	movff	(c:strcmp@s1+1),fsr2h
	movf	indf2,w
	btfss	status,2
	goto	u4141
	goto	u4140
u4141:
	goto	l4457
u4140:
	line	41
	
l4463:
	movf	((c:strcmp@r))^00h,c,w
	movwf	((c:?_strcmp))^00h,c
	clrf	((c:?_strcmp+1))^00h,c
	btfsc	((c:?_strcmp))^00h,c,7
	decf	((c:?_strcmp+1))^00h,c
	line	42
	
l1731:
	return	;funcret
	callstack 0
GLOBAL	__end_of_strcmp
	__end_of_strcmp:
	signat	_strcmp,8314
	global	_lcd_print_at

;; *************** function _lcd_print_at *****************
;; Defined at:
;;		line 325 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;;  col             1   20[COMRAM] unsigned char 
;;  str             2   21[COMRAM] PTR const unsigned char 
;;		 -> STR_166(2), STR_165(5), STR_164(5), STR_163(9), 
;;		 -> STR_162(5), STR_161(6), STR_160(8), STR_159(8), 
;;		 -> STR_158(8), STR_157(6), menu_draw_input@value_buf(15), menu_draw_input@title(10), 
;;		 -> STR_131(2), STR_130(8), STR_79(5), STR_78(8), 
;;		 -> STR_77(8), STR_76(12), STR_75(9), STR_74(11), 
;;		 -> STR_73(10), STR_72(6), STR_71(5), STR_70(7), 
;;		 -> STR_69(7), STR_68(5), STR_67(8), STR_66(8), 
;;		 -> STR_65(11), STR_64(8), STR_63(5), STR_62(7), 
;;		 -> STR_61(7), STR_60(5), STR_59(8), STR_58(9), 
;;		 -> STR_57(9), STR_56(10), STR_55(11), STR_54(10), 
;;		 -> STR_53(7), STR_52(7), STR_51(5), STR_50(8), 
;;		 -> STR_49(8), STR_48(8), STR_47(9), STR_46(6), 
;;		 -> STR_45(6), STR_44(13), STR_43(9), STR_42(12), 
;;		 -> STR_41(11), STR_40(10), STR_39(7), STR_38(7), 
;;		 -> STR_37(5), STR_36(6), STR_35(13), STR_34(11), 
;;		 -> STR_33(10), 
;; Auto vars:     Size  Location     Type
;;  row             1   23[COMRAM] unsigned char 
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
;; This function uses a non-reentrant model
;;
psect	text19,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	325
global __ptext19
__ptext19:
psect	text19
	file	"src\menu.c"
	line	325
	
_lcd_print_at:
;incstack = 0
	callstack 23
	movwf	((c:lcd_print_at@row))^00h,c
	line	327
	
l4399:
	movff	(c:lcd_print_at@col),(c:lcd_set_cursor@col)
	movf	((c:lcd_print_at@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	328
	
l4401:
		movff	(c:lcd_print_at@str),(c:lcd_print@str)
	movff	(c:lcd_print_at@str+1),(c:lcd_print@str+1)

	call	_lcd_print	;wreg free
	line	329
	
l479:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print_at
	__end_of_lcd_print_at:
	signat	_lcd_print_at,12409
	global	_lcd_clear_line

;; *************** function _lcd_clear_line *****************
;; Defined at:
;;		line 332 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  row             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  row             1   20[COMRAM] unsigned char 
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
;; This function uses a non-reentrant model
;;
psect	text20,class=CODE,space=0,reloc=2,group=0
	line	332
global __ptext20
__ptext20:
psect	text20
	file	"src\menu.c"
	line	332
	
_lcd_clear_line:
;incstack = 0
	callstack 23
	movwf	((c:lcd_clear_line@row))^00h,c
	line	334
	
l4403:
	movlw	low(0)
	movwf	((c:lcd_set_cursor@col))^00h,c
	movf	((c:lcd_clear_line@row))^00h,c,w
	
	call	_lcd_set_cursor
	line	335
	
l4405:
		movlw	low(STR_92)
	movwf	((c:lcd_print@str))^00h,c
	movlw	high(STR_92)
	movwf	((c:lcd_print@str+1))^00h,c

	call	_lcd_print	;wreg free
	line	336
	
l482:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear_line
	__end_of_lcd_clear_line:
	signat	_lcd_clear_line,4217
	global	_lcd_set_cursor

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 173 in file "src\main.c"
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
;;		_menu_update_time_value
;;		_lcd_print_at
;;		_lcd_clear_line
;;		_menu_update_numeric_value
;;		_menu_draw_input
;;		_menu_update_edit_value
;; This function uses a non-reentrant model
;;
psect	text21,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	173
global __ptext21
__ptext21:
psect	text21
	file	"src\main.c"
	line	173
	
_lcd_set_cursor:
;incstack = 0
	callstack 25
	movwf	((c:lcd_set_cursor@row))^00h,c
	line	176
	
l4115:
	goto	l4129
	line	179
	
l4117:
	movlw	low(080h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	180
	goto	l4131
	line	182
	
l4119:
	movlw	low(0C0h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	183
	goto	l4131
	line	185
	
l4121:
	movlw	low(094h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	186
	goto	l4131
	line	188
	
l4123:
	movlw	low(0D4h)
	movwf	((c:lcd_set_cursor@address))^00h,c
	line	189
	goto	l4131
	line	176
	
l4129:
	movf	((c:lcd_set_cursor@row))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l4117
	xorlw	1^0	; case 1
	skipnz
	goto	l4119
	xorlw	2^1	; case 2
	skipnz
	goto	l4121
	xorlw	3^2	; case 3
	skipnz
	goto	l4123
	goto	l4117

	line	194
	
l4131:
	movf	((c:lcd_set_cursor@address))^00h,c,w
	addwf	((c:lcd_set_cursor@col))^00h,c,w
	
	call	_lcd_cmd
	line	195
	
l166:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
	signat	_lcd_set_cursor,8313
	global	_lcd_print

;; *************** function _lcd_print *****************
;; Defined at:
;;		line 159 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   16[COMRAM] PTR const unsigned char 
;;		 -> STR_167(2), STR_166(2), STR_165(5), STR_164(5), 
;;		 -> STR_163(9), STR_162(5), STR_161(6), STR_160(8), 
;;		 -> STR_159(8), STR_158(8), STR_157(6), STR_147(2), 
;;		 -> STR_146(2), STR_145(11), menu_update_edit_value@value_buf(15), STR_142(2), 
;;		 -> STR_141(2), STR_140(2), STR_139(2), menu_draw_input@value_buf(15), 
;;		 -> menu_draw_input@title(10), STR_132(2), STR_131(2), STR_130(8), 
;;		 -> STR_129(2), STR_128(2), STR_127(7), menu_update_numeric_value@value_buf(6), 
;;		 -> STR_92(21), STR_91(2), STR_90(2), STR_89(8), 
;;		 -> menu_update_time_value@value_buf(6), STR_79(5), STR_78(8), STR_77(8), 
;;		 -> STR_76(12), STR_75(9), STR_74(11), STR_73(10), 
;;		 -> STR_72(6), STR_71(5), STR_70(7), STR_69(7), 
;;		 -> STR_68(5), STR_67(8), STR_66(8), STR_65(11), 
;;		 -> STR_64(8), STR_63(5), STR_62(7), STR_61(7), 
;;		 -> STR_60(5), STR_59(8), STR_58(9), STR_57(9), 
;;		 -> STR_56(10), STR_55(11), STR_54(10), STR_53(7), 
;;		 -> STR_52(7), STR_51(5), STR_50(8), STR_49(8), 
;;		 -> STR_48(8), STR_47(9), STR_46(6), STR_45(6), 
;;		 -> STR_44(13), STR_43(9), STR_42(12), STR_41(11), 
;;		 -> STR_40(10), STR_39(7), STR_38(7), STR_37(5), 
;;		 -> STR_36(6), STR_35(13), STR_34(11), STR_33(10), 
;;		 -> STR_21(8), STR_20(12), STR_17(6), STR_16(12), 
;;		 -> STR_4(16), STR_3(13), 
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
;;		_menu_update_time_value
;;		_lcd_print_at
;;		_lcd_clear_line
;;		_menu_update_numeric_value
;;		_menu_draw_options
;;		_menu_draw_input
;;		_menu_update_edit_value
;;		_menu_draw_setup
;; This function uses a non-reentrant model
;;
psect	text22,class=CODE,space=0,reloc=2,group=0
	line	159
global __ptext22
__ptext22:
psect	text22
	file	"src\main.c"
	line	159
	
_lcd_print:
;incstack = 0
	callstack 25
	line	161
	
l4107:
	goto	l4113
	line	163
	
l4109:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u3577
	tblrd	*
	
	movf	tablat,w
	bra	u3570
u3577:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u3570:
	
	call	_lcd_data
	
l4111:
	infsnz	((c:lcd_print@str))^00h,c
	incf	((c:lcd_print@str+1))^00h,c
	line	161
	
l4113:
	movff	(c:lcd_print@str),tblptrl
	movff	(c:lcd_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u3587
	tblrd	*
	
	movf	tablat,w
	bra	u3580
u3587:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u3580:
	iorlw	0
	btfss	status,2
	goto	u3591
	goto	u3590
u3591:
	goto	l4109
u3590:
	line	165
	
l153:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_print
	__end_of_lcd_print:
	signat	_lcd_print,4217
	global	_lcd_data

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 151 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1   15[COMRAM] unsigned char 
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
;; This function uses a non-reentrant model
;;
psect	text23,class=CODE,space=0,reloc=2,group=0
	line	151
global __ptext23
__ptext23:
psect	text23
	file	"src\main.c"
	line	151
	
_lcd_data:
;incstack = 0
	callstack 25
	movwf	((c:lcd_data@data))^00h,c
	line	153
	
l4093:
	bsf	((c:3977))^0f00h,c,6	;volatile
	line	154
	
l4095:
	swapf	((c:lcd_data@data))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	155
	movf	((c:lcd_data@data))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	156
	
l4097:
	asmopt push
asmopt off
	movlw	133
u8217:
decfsz	wreg,f
	bra	u8217
	nop
asmopt pop

	line	157
	
l147:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
	signat	_lcd_data,4217
	global	_is_numeric_field

;; *************** function _is_numeric_field *****************
;; Defined at:
;;		line 138 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  line            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  line            1   15[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_menu_update_numeric_value
;;		_menu_draw_input
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text24,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	138
global __ptext24
__ptext24:
psect	text24
	file	"src\menu.c"
	line	138
	
_is_numeric_field:
;incstack = 0
	callstack 27
	movwf	((c:is_numeric_field@line))^00h,c
	line	140
	
l4373:
	movlw	low(01h)
	movwf	((c:_is_numeric_field$992))^00h,c
	
l4375:
		movlw	2
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u3991
	goto	u3990

u3991:
	goto	l427
u3990:
	
l4377:
		movlw	3
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u4001
	goto	u4000

u4001:
	goto	l427
u4000:
	
l4379:
		movlw	4
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u4011
	goto	u4010

u4011:
	goto	l427
u4010:
	
l4381:
		movlw	6
	xorwf	((c:is_numeric_field@line))^00h,c,w
	btfsc	status,2
	goto	u4021
	goto	u4020

u4021:
	goto	l427
u4020:
	
l4383:
	movlw	low(0)
	movwf	((c:_is_numeric_field$992))^00h,c
	
l427:
	movf	((c:_is_numeric_field$992))^00h,c,w
	line	141
	
l428:
	return	;funcret
	callstack 0
GLOBAL	__end_of_is_numeric_field
	__end_of_is_numeric_field:
	signat	_is_numeric_field,4217
	global	_get_item_options

;; *************** function _get_item_options *****************
;; Defined at:
;;		line 339 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  item_index      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  item_index      1   16[COMRAM] unsigned char 
;;  i               1   17[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] PTR const struct .
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_menu_draw_input
;;		_menu_update_edit_value
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text25,class=CODE,space=0,reloc=2,group=0
	line	339
global __ptext25
__ptext25:
psect	text25
	file	"src\menu.c"
	line	339
	
_get_item_options:
;incstack = 0
	callstack 27
	movwf	((c:get_item_options@item_index))^00h,c
	line	341
	
l4407:
	movlw	low(0)
	movwf	((c:get_item_options@i))^00h,c
	line	343
	
l4413:
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
	goto	u4061
	goto	u4060
u4061:
	goto	l4419
u4060:
	line	345
	
l4415:
	movf	((c:get_item_options@i))^00h,c,w
	mullw	0Ch
	movlw	low(_menu_item_options)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:?_get_item_options))^00h,c
	movlw	high(_menu_item_options)
	addwfc	prod+1,w
	movwf	1+((c:?_get_item_options))^00h,c
	goto	l488
	line	341
	
l4419:
	incf	((c:get_item_options@i))^00h,c
	
l4421:
		movlw	02h-1
	cpfsgt	((c:get_item_options@i))^00h,c
	goto	u4071
	goto	u4070

u4071:
	goto	l4413
u4070:
	line	348
	
l4423:
		movlw	low(0)
	movwf	((c:?_get_item_options))^00h,c
	movlw	high(0)
	movwf	((c:?_get_item_options+1))^00h,c

	line	349
	
l488:
	return	;funcret
	callstack 0
GLOBAL	__end_of_get_item_options
	__end_of_get_item_options:
	signat	_get_item_options,4218
	global	_init_time_editor

;; *************** function _init_time_editor *****************
;; Defined at:
;;		line 153 in file "src\menu.c"
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
;;		On entry : 0/1
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
psect	text26,class=CODE,space=0,reloc=2,group=0
	line	153
global __ptext26
__ptext26:
psect	text26
	file	"src\menu.c"
	line	153
	
_init_time_editor:
;incstack = 0
	callstack 24
	line	156
	
l4839:
	movff	(c:init_time_editor@mode),0+(_menu+010h)
	line	157
	movff	(c:init_time_editor@value_seconds),0+(_menu+014h)
	movff	(c:init_time_editor@value_seconds+1),1+(_menu+014h)
	line	160
	
l4841:
	movf	((c:init_time_editor@mode))^00h,c,w
	btfss	status,2
	goto	u4681
	goto	u4680
u4681:
	goto	l4845
u4680:
	line	162
	
l4843:
	movff	(c:init_time_editor@value_seconds),(c:___lwdiv@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwdiv@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	movlb	0	; () banked
	movwf	(0+(_menu+012h))&0ffh
	line	163
	movff	(c:init_time_editor@value_seconds),(c:___lwmod@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwmod@dividend+1)
	movlw	high(03Ch)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(03Ch)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	movlb	0	; () banked
	movwf	(0+(_menu+013h))&0ffh
	line	164
	goto	l4847
	line	167
	
l4845:
	movff	(c:init_time_editor@value_seconds),(c:___lwdiv@dividend)
	movff	(c:init_time_editor@value_seconds+1),(c:___lwdiv@dividend+1)
	movlw	high(0E10h)
	movwf	((c:___lwdiv@divisor+1))^00h,c
	movlw	low(0E10h)
	movwf	((c:___lwdiv@divisor))^00h,c
	call	___lwdiv	;wreg free
	movf	(0+?___lwdiv)^00h,c,w
	movlb	0	; () banked
	movwf	(0+(_menu+012h))&0ffh
	line	168
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
	movlb	0	; () banked
	movwf	(0+(_menu+013h))&0ffh
	line	172
	
l4847:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+011h))&0ffh
	line	177
	
l4849:; BSR set to: 0

		movlw	low(init_time_editor@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_80)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_80)
	movwf	((c:sprintf@f+1))^00h,c

	movff	(c:init_time_editor@value_seconds),0+((c:?_sprintf)+04h)
	movff	(c:init_time_editor@value_seconds+1),1+((c:?_sprintf)+04h)
	movff	0+(_menu+012h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+08h)
	clrf	(1+((c:?_sprintf)+08h))^00h,c
	call	_sprintf	;wreg free
	line	178
	
l4851:
		movlw	low(init_time_editor@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	179
	
l438:
	return	;funcret
	callstack 0
GLOBAL	__end_of_init_time_editor
	__end_of_init_time_editor:
	signat	_init_time_editor,8313
	global	_init_numeric_editor

;; *************** function _init_numeric_editor *****************
;; Defined at:
;;		line 458 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  value           2   26[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;  abs_val         2   33[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 3C/1
;;		On exit  : 3F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         9       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text27,class=CODE,space=0,reloc=2,group=0
	line	458
global __ptext27
__ptext27:
psect	text27
	file	"src\menu.c"
	line	458
	
_init_numeric_editor:
;incstack = 0
	callstack 26
	line	461
	
l5029:
	movlw	low(01h)
	movwf	((c:_init_numeric_editor$1096))^00h,c
	
l5031:
		movlw	4
	movlb	0	; () banked
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u4801
	goto	u4800

u4801:
	goto	l5037
u4800:
	
l5033:; BSR set to: 0

		movlw	6
	xorwf	((_menu))&0ffh,w
	btfsc	status,2
	goto	u4811
	goto	u4810

u4811:
	goto	l5037
u4810:
	
l5035:; BSR set to: 0

	movlw	low(0)
	movwf	((c:_init_numeric_editor$1096))^00h,c
	
l5037:; BSR set to: 0

	movff	(c:_init_numeric_editor$1096),0+(_menu+0Fh)
	line	464
	
l5039:; BSR set to: 0

	movff	(c:init_numeric_editor@value),0+(_menu+0Dh)
	movff	(c:init_numeric_editor@value+1),1+(_menu+0Dh)
	line	467
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u4821
	goto	u4820
u4821:
	goto	l538
u4820:
	
l5041:; BSR set to: 0

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u4830
	goto	u4831

u4831:
	goto	l538
u4830:
	line	468
	
l5043:; BSR set to: 0

	movlw	high(0)
	movwf	((c:init_numeric_editor@value+1))^00h,c
	movlw	low(0)
	movwf	((c:init_numeric_editor@value))^00h,c
	
l538:; BSR set to: 0

	line	471
	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u4841
	goto	u4840
u4841:
	goto	l5047
u4840:
	
l5045:; BSR set to: 0

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u4851
	goto	u4850

u4851:
	movlw	1
	goto	u4860
u4850:
	movlw	0
u4860:
	movwf	((c:_init_numeric_editor$1097))^00h,c
	clrf	((c:_init_numeric_editor$1097+1))^00h,c
	goto	l5049
	
l5047:; BSR set to: 0

	movlw	high(0)
	movwf	((c:_init_numeric_editor$1097+1))^00h,c
	movlw	low(0)
	movwf	((c:_init_numeric_editor$1097))^00h,c
	
l5049:; BSR set to: 0

	movff	(c:_init_numeric_editor$1097),0+(_menu+09h)
	line	474
	
l5051:; BSR set to: 0

	btfsc	((c:init_numeric_editor@value+1))^00h,c,7
	goto	u4871
	goto	u4870

u4871:
	goto	l544
u4870:
	
l5053:; BSR set to: 0

	movff	(c:init_numeric_editor@value),(c:init_numeric_editor@abs_val)
	movff	(c:init_numeric_editor@value+1),(c:init_numeric_editor@abs_val+1)
	goto	l5055
	
l544:; BSR set to: 0

	movff	(c:init_numeric_editor@value),??_init_numeric_editor+0+0
	movff	(c:init_numeric_editor@value+1),??_init_numeric_editor+0+0+1
	comf	(??_init_numeric_editor+0+0)^00h,c
	comf	(??_init_numeric_editor+0+1)^00h,c
	infsnz	(??_init_numeric_editor+0+0)^00h,c
	incf	(??_init_numeric_editor+0+1)^00h,c
	movff	??_init_numeric_editor+0+0,(c:init_numeric_editor@abs_val)
	movff	??_init_numeric_editor+0+1,(c:init_numeric_editor@abs_val+1)
	line	475
	
l5055:; BSR set to: 0

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
	movlb	0	; () banked
	movwf	(0+(_menu+0Ah))&0ffh
	line	476
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
	movlb	0	; () banked
	movwf	(0+(_menu+0Bh))&0ffh
	line	477
	movff	(c:init_numeric_editor@abs_val),(c:___lwmod@dividend)
	movff	(c:init_numeric_editor@abs_val+1),(c:___lwmod@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___lwmod@divisor+1))^00h,c
	movlw	low(0Ah)
	movwf	((c:___lwmod@divisor))^00h,c
	call	___lwmod	;wreg free
	movf	(0+?___lwmod)^00h,c,w
	movlb	0	; () banked
	movwf	(0+(_menu+0Ch))&0ffh
	line	480
	
l5057:; BSR set to: 0

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u4881
	goto	u4880
u4881:
	movlw	1
	goto	u4890
u4880:
	movlw	0
u4890:
	movwf	(0+(_menu+08h))&0ffh
	line	481
	
l547:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_init_numeric_editor
	__end_of_init_numeric_editor:
	signat	_init_numeric_editor,4217
	global	_get_current_numeric_value

;; *************** function _get_current_numeric_value *****************
;; Defined at:
;;		line 484 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  value           2   22[COMRAM] int 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] int 
;; Registers used:
;;		wreg, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : 3F/0
;;		On exit  : 3F/0
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
psect	text28,class=CODE,space=0,reloc=2,group=0
	line	484
global __ptext28
__ptext28:
psect	text28
	file	"src\menu.c"
	line	484
	
_get_current_numeric_value:; BSR set to: 0

;incstack = 0
	callstack 27
	line	486
	
l5059:; BSR set to: 0

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
	line	487
	
l5061:; BSR set to: 0

	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u4901
	goto	u4900
u4901:
	goto	l5065
u4900:
	line	488
	
l5063:; BSR set to: 0

	negf	((c:get_current_numeric_value@value))^00h,c
	comf	((c:get_current_numeric_value@value+1))^00h,c
	btfsc	status,0
	incf	((c:get_current_numeric_value@value+1))^00h,c
	line	489
	
l5065:; BSR set to: 0

	movff	(c:get_current_numeric_value@value),(c:?_get_current_numeric_value)
	movff	(c:get_current_numeric_value@value+1),(c:?_get_current_numeric_value+1)
	line	490
	
l551:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_get_current_numeric_value
	__end_of_get_current_numeric_value:
	signat	_get_current_numeric_value,90
	global	_beep

;; *************** function _beep *****************
;; Defined at:
;;		line 235 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  duration_ms     2   14[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2   17[COMRAM] unsigned int 
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text29,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	235
global __ptext29
__ptext29:
psect	text29
	file	"src\main.c"
	line	235
	
_beep:; BSR set to: 0

;incstack = 0
	callstack 27
	line	237
	
l4567:
	bsf	((c:3979))^0f00h,c,2	;volatile
	line	238
	
l4569:
	movlw	high(0)
	movwf	((c:beep@i+1))^00h,c
	movlw	low(0)
	movwf	((c:beep@i))^00h,c
	goto	l172
	line	240
	
l4571:
	asmopt push
asmopt off
movlw	11
movwf	(??_beep+0+0)^00h,c
	movlw	98
u8227:
decfsz	wreg,f
	bra	u8227
	decfsz	(??_beep+0+0)^00h,c,f
	bra	u8227
	nop2
asmopt pop

	line	238
	
l4573:
	infsnz	((c:beep@i))^00h,c
	incf	((c:beep@i+1))^00h,c
	
l172:
		movf	((c:beep@duration_ms))^00h,c,w
	subwf	((c:beep@i))^00h,c,w
	movf	((c:beep@duration_ms+1))^00h,c,w
	subwfb	((c:beep@i+1))^00h,c,w
	btfss	status,0
	goto	u4231
	goto	u4230

u4231:
	goto	l4571
u4230:
	
l174:
	line	242
	bcf	((c:3979))^0f00h,c,2	;volatile
	line	243
	
l175:
	return	;funcret
	callstack 0
GLOBAL	__end_of_beep
	__end_of_beep:
	signat	_beep,4217
	global	_lcd_init

;; *************** function _lcd_init *****************
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
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_lcd_cmd
;;		_lcd_write_nibble
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text30,class=CODE,space=0,reloc=2,group=0
	line	197
global __ptext30
__ptext30:
psect	text30
	file	"src\main.c"
	line	197
	
_lcd_init:
;incstack = 0
	callstack 26
	line	200
	
l5131:; BSR set to: 0

	movlw	low(010h)
	movwf	((c:3986))^0f00h,c	;volatile
	line	201
	movlw	low(046h)
	movwf	((c:3987))^0f00h,c	;volatile
	line	202
	movlw	low(0)
	movwf	((c:3988))^0f00h,c	;volatile
	line	205
	movlw	low(0)
	movwf	((c:3968))^0f00h,c	;volatile
	line	206
	movlw	low(0)
	movwf	((c:3969))^0f00h,c	;volatile
	line	207
	movlw	low(0)
	movwf	((c:3970))^0f00h,c	;volatile
	line	209
	
l5133:; BSR set to: 0

	asmopt push
asmopt off
movlw  3
movwf	(??_lcd_init+0+0+1)^00h,c
movlw	8
movwf	(??_lcd_init+0+0)^00h,c
	movlw	119
u8237:
decfsz	wreg,f
	bra	u8237
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u8237
	decfsz	(??_lcd_init+0+0+1)^00h,c,f
	bra	u8237
	nop
asmopt pop

	line	211
	
l5135:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	214
	
l5137:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	215
	
l5139:
	asmopt push
asmopt off
movlw	52
movwf	(??_lcd_init+0+0)^00h,c
	movlw	242
u8247:
decfsz	wreg,f
	bra	u8247
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u8247
asmopt pop

	line	216
	
l5141:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	217
	
l5143:
	asmopt push
asmopt off
	movlw	240
u8257:
	nop2
decfsz	wreg,f
	bra	u8257
asmopt pop

	line	218
	
l5145:
	movlw	(03h)&0ffh
	
	call	_lcd_write_nibble
	line	219
	
l5147:
	asmopt push
asmopt off
	movlw	240
u8267:
	nop2
decfsz	wreg,f
	bra	u8267
asmopt pop

	line	222
	
l5149:
	movlw	(02h)&0ffh
	
	call	_lcd_write_nibble
	line	223
	
l5151:
	asmopt push
asmopt off
	movlw	240
u8277:
	nop2
decfsz	wreg,f
	bra	u8277
asmopt pop

	line	226
	
l5153:
	movlw	(028h)&0ffh
	
	call	_lcd_cmd
	line	227
	
l5155:
	movlw	(08h)&0ffh
	
	call	_lcd_cmd
	line	228
	
l5157:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	229
	
l5159:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_init+0+0)^00h,c
	movlw	198
u8287:
decfsz	wreg,f
	bra	u8287
	decfsz	(??_lcd_init+0+0)^00h,c,f
	bra	u8287
	nop2
asmopt pop

	line	230
	
l5161:
	movlw	(06h)&0ffh
	
	call	_lcd_cmd
	line	231
	
l5163:
	movlw	(0Ch)&0ffh
	
	call	_lcd_cmd
	line	232
	
l169:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
	signat	_lcd_init,89
	global	_lcd_clear

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 167 in file "src\main.c"
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
psect	text31,class=CODE,space=0,reloc=2,group=0
	line	167
global __ptext31
__ptext31:
psect	text31
	file	"src\main.c"
	line	167
	
_lcd_clear:
;incstack = 0
	callstack 26
	line	169
	
l5127:
	movlw	(01h)&0ffh
	
	call	_lcd_cmd
	line	170
	
l5129:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_clear+0+0)^00h,c
	movlw	198
u8297:
decfsz	wreg,f
	bra	u8297
	decfsz	(??_lcd_clear+0+0)^00h,c,f
	bra	u8297
	nop2
asmopt pop

	line	171
	
l156:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
	signat	_lcd_clear,89
	global	_lcd_cmd

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 135 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1   16[COMRAM] unsigned char 
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
;;		_lcd_clear
;;		_lcd_set_cursor
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text32,class=CODE,space=0,reloc=2,group=0
	line	135
global __ptext32
__ptext32:
psect	text32
	file	"src\main.c"
	line	135
	
_lcd_cmd:
;incstack = 0
	callstack 25
	movwf	((c:lcd_cmd@cmd))^00h,c
	line	137
	
l4081:
	bcf	((c:3977))^0f00h,c,6	;volatile
	line	138
	
l4083:
	swapf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	(0ffh shr 4) & 0ffh
	
	call	_lcd_write_nibble
	line	139
	movf	((c:lcd_cmd@cmd))^00h,c,w
	andlw	low(0Fh)
	
	call	_lcd_write_nibble
	line	141
	
l4085:
		decf	((c:lcd_cmd@cmd))^00h,c,w
	btfsc	status,2
	goto	u3521
	goto	u3520

u3521:
	goto	l4089
u3520:
	
l4087:
		movlw	2
	xorwf	((c:lcd_cmd@cmd))^00h,c,w
	btfss	status,2
	goto	u3531
	goto	u3530

u3531:
	goto	l4091
u3530:
	line	143
	
l4089:
	asmopt push
asmopt off
movlw	21
movwf	(??_lcd_cmd+0+0)^00h,c
	movlw	198
u8307:
decfsz	wreg,f
	bra	u8307
	decfsz	(??_lcd_cmd+0+0)^00h,c,f
	bra	u8307
	nop2
asmopt pop

	line	144
	goto	l144
	line	147
	
l4091:
	asmopt push
asmopt off
	movlw	133
u8317:
decfsz	wreg,f
	bra	u8317
	nop
asmopt pop

	line	149
	
l144:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
	signat	_lcd_cmd,4217
	global	_lcd_write_nibble

;; *************** function _lcd_write_nibble *****************
;; Defined at:
;;		line 110 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  nibble          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  nibble          1   14[COMRAM] unsigned char 
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_cmd
;;		_lcd_data
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text33,class=CODE,space=0,reloc=2,group=0
	line	110
global __ptext33
__ptext33:
psect	text33
	file	"src\main.c"
	line	110
	
_lcd_write_nibble:
;incstack = 0
	callstack 25
	movwf	((c:lcd_write_nibble@nibble))^00h,c
	line	112
	
l4059:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(0)&7
	goto	u3471
	goto	u3470
u3471:
	goto	l129
u3470:
	line	113
	
l4061:
	bsf	((c:3977))^0f00h,c,0	;volatile
	goto	l4063
	line	114
	
l129:
	line	115
	bcf	((c:3977))^0f00h,c,0	;volatile
	line	116
	
l4063:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(1)&7
	goto	u3481
	goto	u3480
u3481:
	goto	l131
u3480:
	line	117
	
l4065:
	bsf	((c:3977))^0f00h,c,1	;volatile
	goto	l4067
	line	118
	
l131:
	line	119
	bcf	((c:3977))^0f00h,c,1	;volatile
	line	120
	
l4067:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(2)&7
	goto	u3491
	goto	u3490
u3491:
	goto	l133
u3490:
	line	121
	
l4069:
	bsf	((c:3977))^0f00h,c,2	;volatile
	goto	l4071
	line	122
	
l133:
	line	123
	bcf	((c:3977))^0f00h,c,2	;volatile
	line	124
	
l4071:
	
	btfss	((c:lcd_write_nibble@nibble))^00h,c,(3)&7
	goto	u3501
	goto	u3500
u3501:
	goto	l135
u3500:
	line	125
	
l4073:
	bsf	((c:3977))^0f00h,c,3	;volatile
	goto	l136
	line	126
	
l135:
	line	127
	bcf	((c:3977))^0f00h,c,3	;volatile
	
l136:
	line	129
	bsf	((c:3977))^0f00h,c,7	;volatile
	line	130
		asmopt push
	asmopt off
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	nop2	;2 cycle nop
	asmopt pop

	line	131
	bcf	((c:3977))^0f00h,c,7	;volatile
	line	132
	
l4075:
	asmopt push
asmopt off
	movlw	133
u8327:
decfsz	wreg,f
	bra	u8327
	nop
asmopt pop

	line	133
	
l137:
	return	;funcret
	callstack 0
GLOBAL	__end_of_lcd_write_nibble
	__end_of_lcd_write_nibble:
	signat	_lcd_write_nibble,4217
	global	_handle_time_rotation

;; *************** function _handle_time_rotation *****************
;; Defined at:
;;		line 182 in file "src\menu.c"
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
;;		On entry : 3F/1
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
;; This function uses a non-reentrant model
;;
psect	text34,class=CODE,space=0,reloc=2,group=0
	file	"src\menu.c"
	line	182
global __ptext34
__ptext34:
psect	text34
	file	"src\menu.c"
	line	182
	
_handle_time_rotation:
;incstack = 0
	callstack 25
	movlb	0	; () banked
	movwf	((handle_time_rotation@direction))&0ffh
	line	184
	
l5319:
		movlw	low(STR_81)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_81)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	188
	
l5321:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_82)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_82)
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
	line	189
	
l5323:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	191
	
l5325:
	movlb	0	; () banked
	movf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u5251
	goto	u5250
u5251:
	goto	l5353
u5250:
	line	193
	
l5327:; BSR set to: 0

		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u5261
	goto	u5260

u5261:
	goto	l5341
u5260:
	line	195
	
l5329:; BSR set to: 0

	incf	(0+(_menu+012h))&0ffh
	line	196
	
l5331:; BSR set to: 0

		movlw	2
	xorwf	(0+(_menu+010h))&0ffh,w
	btfss	status,2
	goto	u5271
	goto	u5270

u5271:
	goto	l5337
u5270:
	
l5333:; BSR set to: 0

		movlw	018h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u5281
	goto	u5280

u5281:
	goto	l5337
u5280:
	line	197
	
l5335:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+012h))&0ffh
	goto	l5369
	line	198
	
l5337:; BSR set to: 0

		movlw	064h-1
	cpfsgt	(0+(_menu+012h))&0ffh
	goto	u5291
	goto	u5290

u5291:
	goto	l446
u5290:
	goto	l5335
	line	203
	
l5341:; BSR set to: 0

	movf	(0+(_menu+012h))&0ffh,w
	btfss	status,2
	goto	u5301
	goto	u5300
u5301:
	goto	l5351
u5300:
	line	205
	
l5343:; BSR set to: 0

		movlw	2
	xorwf	(0+(_menu+010h))&0ffh,w
	btfsc	status,2
	goto	u5311
	goto	u5310

u5311:
	goto	l5347
u5310:
	
l5345:; BSR set to: 0

	movlw	high(063h)
	movwf	((_handle_time_rotation$1006+1))&0ffh
	movlw	low(063h)
	movwf	((_handle_time_rotation$1006))&0ffh
	goto	l5349
	
l5347:; BSR set to: 0

	movlw	high(017h)
	movwf	((_handle_time_rotation$1006+1))&0ffh
	movlw	low(017h)
	movwf	((_handle_time_rotation$1006))&0ffh
	
l5349:; BSR set to: 0

	movff	(_handle_time_rotation$1006),0+(_menu+012h)
	line	206
	goto	l5369
	line	209
	
l5351:; BSR set to: 0

	decf	(0+(_menu+012h))&0ffh
	goto	l5369
	line	211
	
l446:; BSR set to: 0

	line	212
	goto	l5369
	line	213
	
l5353:; BSR set to: 0

		decf	(0+(_menu+011h))&0ffh,w
	btfss	status,2
	goto	u5321
	goto	u5320

u5321:
	goto	l5369
u5320:
	line	215
	
l5355:; BSR set to: 0

		movf	((handle_time_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u5331
	goto	u5330

u5331:
	goto	l5363
u5330:
	line	217
	
l5357:; BSR set to: 0

	incf	(0+(_menu+013h))&0ffh
	line	218
	
l5359:; BSR set to: 0

		movlw	03Ch-1
	cpfsgt	(0+(_menu+013h))&0ffh
	goto	u5341
	goto	u5340

u5341:
	goto	l5369
u5340:
	line	219
	
l5361:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+013h))&0ffh
	goto	l5369
	line	223
	
l5363:; BSR set to: 0

	movf	(0+(_menu+013h))&0ffh,w
	btfss	status,2
	goto	u5351
	goto	u5350
u5351:
	goto	l5367
u5350:
	line	224
	
l5365:; BSR set to: 0

	movlw	low(03Bh)
	movwf	(0+(_menu+013h))&0ffh
	goto	l5369
	line	226
	
l5367:; BSR set to: 0

	decf	(0+(_menu+013h))&0ffh
	line	230
	
l5369:; BSR set to: 0

		movlw	low(handle_time_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_83)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_83)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+012h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+013h),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	231
	
l5371:
		movlw	low(handle_time_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	232
	
l460:
	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_time_rotation
	__end_of_handle_time_rotation:
	signat	_handle_time_rotation,4217
	global	_handle_numeric_rotation

;; *************** function _handle_numeric_rotation *****************
;; Defined at:
;;		line 493 in file "src\menu.c"
;; Parameters:    Size  Location     Type
;;  direction       1    wreg     char 
;; Auto vars:     Size  Location     Type
;;  direction       1   53[BANK0 ] char 
;;  max_tens        1   52[BANK0 ] unsigned char 
;;  buf            50    0[BANK0 ] unsigned char [50]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 3F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0      54       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0      54       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       54 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_sprintf
;;		_uart_println
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text35,class=CODE,space=0,reloc=2,group=0
	line	493
global __ptext35
__ptext35:
psect	text35
	file	"src\menu.c"
	line	493
	
_handle_numeric_rotation:
;incstack = 0
	callstack 25
	movlb	0	; () banked
	movwf	((handle_numeric_rotation@direction))&0ffh
	line	495
	
l5227:
		movlw	low(STR_123)
	movwf	((c:uart_println@str))^00h,c
	movlw	high(STR_123)
	movwf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	499
	
l5229:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:sprintf@sp))^00h,c
	clrf	((c:sprintf@sp+1))^00h,c

		movlw	low(STR_124)
	movwf	((c:sprintf@f))^00h,c
	movlw	high(STR_124)
	movwf	((c:sprintf@f+1))^00h,c

	movff	0+(_menu+08h),0+((c:?_sprintf)+04h)
	clrf	(1+((c:?_sprintf)+04h))^00h,c
	movff	0+(_menu+0Fh),0+((c:?_sprintf)+06h)
	clrf	(1+((c:?_sprintf)+06h))^00h,c
	call	_sprintf	;wreg free
	line	500
	
l5231:
		movlw	low(handle_numeric_rotation@buf)
	movwf	((c:uart_println@str))^00h,c
	clrf	((c:uart_println@str+1))^00h,c

	call	_uart_println	;wreg free
	line	503
	
l5233:
	movlb	0	; () banked
	movf	(0+(_menu+0Fh))&0ffh,w
	btfsc	status,2
	goto	u5021
	goto	u5020
u5021:
	goto	l5317
u5020:
	
l5235:; BSR set to: 0

	movf	(0+(_menu+08h))&0ffh,w
	btfss	status,2
	goto	u5031
	goto	u5030
u5031:
	goto	l5317
u5030:
	line	505
	
l5237:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_menu+08h))&0ffh
	goto	l5317
	line	511
	
l5239:; BSR set to: 0

	movf	(0+(_menu+0Fh))&0ffh,w
	btfss	status,2
	goto	u5041
	goto	u5040
u5041:
	goto	l587
u5040:
	
l5241:; BSR set to: 0

	movf	((handle_numeric_rotation@direction))&0ffh,w
	btfsc	status,2
	goto	u5051
	goto	u5050
u5051:
	goto	l587
u5050:
	line	513
	
l5243:; BSR set to: 0

	movf	(0+(_menu+09h))&0ffh,w
	btfsc	status,2
	goto	u5061
	goto	u5060
u5061:
	movlw	1
	goto	u5070
u5060:
	movlw	0
u5070:
	movwf	(0+(_menu+09h))&0ffh
	goto	l587
	line	518
	
l5245:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u5081
	goto	u5080

u5081:
	goto	l5253
u5080:
	line	520
	
l5247:; BSR set to: 0

	incf	(0+(_menu+0Ah))&0ffh
	line	521
	
l5249:; BSR set to: 0

		movlw	06h-1
	cpfsgt	(0+(_menu+0Ah))&0ffh
	goto	u5091
	goto	u5090

u5091:
	goto	l587
u5090:
	line	522
	
l5251:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l587
	line	524
	
l5253:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u5100
	goto	u5101

u5101:
	goto	l587
u5100:
	line	526
	
l5255:; BSR set to: 0

	movf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u5111
	goto	u5110
u5111:
	goto	l5259
u5110:
	line	527
	
l5257:; BSR set to: 0

	movlw	low(05h)
	movwf	(0+(_menu+0Ah))&0ffh
	goto	l587
	line	529
	
l5259:; BSR set to: 0

	decf	(0+(_menu+0Ah))&0ffh
	goto	l587
	line	536
	
l5261:; BSR set to: 0

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfsc	status,2
	goto	u5121
	goto	u5120

u5121:
	goto	l5265
u5120:
	
l5263:; BSR set to: 0

	movlw	high(09h)
	movwf	((_handle_numeric_rotation$1107+1))&0ffh
	movlw	low(09h)
	movwf	((_handle_numeric_rotation$1107))&0ffh
	goto	l5267
	
l5265:; BSR set to: 0

	movlw	high(0)
	movwf	((_handle_numeric_rotation$1107+1))&0ffh
	movlw	low(0)
	movwf	((_handle_numeric_rotation$1107))&0ffh
	
l5267:; BSR set to: 0

	movff	(_handle_numeric_rotation$1107),(handle_numeric_rotation@max_tens)
	line	537
	
l5269:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u5131
	goto	u5130

u5131:
	goto	l5281
u5130:
	line	539
	
l5271:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u5141
	goto	u5140
u5141:
	goto	l5275
u5140:
	goto	l587
	line	541
	
l5275:; BSR set to: 0

	incf	(0+(_menu+0Bh))&0ffh
	line	542
	
l5277:; BSR set to: 0

		movf	(0+(_menu+0Bh))&0ffh,w
	subwf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfsc	status,0
	goto	u5151
	goto	u5150

u5151:
	goto	l587
u5150:
	line	543
	
l5279:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+0Bh))&0ffh
	goto	l587
	line	545
	
l5281:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u5160
	goto	u5161

u5161:
	goto	l587
u5160:
	line	547
	
l5283:; BSR set to: 0

	movf	((handle_numeric_rotation@max_tens))&0ffh,w
	btfss	status,2
	goto	u5171
	goto	u5170
u5171:
	goto	l5287
u5170:
	goto	l587
	line	549
	
l5287:; BSR set to: 0

	movf	(0+(_menu+0Bh))&0ffh,w
	btfss	status,2
	goto	u5181
	goto	u5180
u5181:
	goto	l5291
u5180:
	line	550
	
l5289:; BSR set to: 0

	movff	(handle_numeric_rotation@max_tens),0+(_menu+0Bh)
	goto	l587
	line	552
	
l5291:; BSR set to: 0

	decf	(0+(_menu+0Bh))&0ffh
	goto	l587
	line	560
	
l5293:; BSR set to: 0

		movlw	5
	xorwf	(0+(_menu+0Ah))&0ffh,w
	btfss	status,2
	goto	u5191
	goto	u5190

u5191:
	goto	l5299
u5190:
	
l5295:; BSR set to: 0

	movf	(0+(_menu+0Bh))&0ffh,w
	btfss	status,2
	goto	u5201
	goto	u5200
u5201:
	goto	l5299
u5200:
	line	562
	
l5297:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_menu+0Ch))&0ffh
	line	563
	goto	l587
	line	567
	
l5299:; BSR set to: 0

		movf	((handle_numeric_rotation@direction))&0ffh,w
	xorlw	80h
	addlw	-(80h^01h)
	btfss	status,0
	goto	u5211
	goto	u5210

u5211:
	goto	l5307
u5210:
	line	569
	
l5301:; BSR set to: 0

	incf	(0+(_menu+0Ch))&0ffh
	line	570
	
l5303:; BSR set to: 0

		movlw	0Ah-1
	cpfsgt	(0+(_menu+0Ch))&0ffh
	goto	u5221
	goto	u5220

u5221:
	goto	l587
u5220:
	goto	l5297
	line	573
	
l5307:; BSR set to: 0

	btfsc	((handle_numeric_rotation@direction))&0ffh,7
	goto	u5230
	goto	u5231

u5231:
	goto	l587
u5230:
	line	575
	
l5309:; BSR set to: 0

	movf	(0+(_menu+0Ch))&0ffh,w
	btfss	status,2
	goto	u5241
	goto	u5240
u5241:
	goto	l5313
u5240:
	line	576
	
l5311:; BSR set to: 0

	movlw	low(09h)
	movwf	(0+(_menu+0Ch))&0ffh
	goto	l587
	line	578
	
l5313:; BSR set to: 0

	decf	(0+(_menu+0Ch))&0ffh
	goto	l587
	line	508
	
l5317:; BSR set to: 0

	movf	(0+(_menu+08h))&0ffh,w
	; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l5239
	xorlw	1^0	; case 1
	skipnz
	goto	l5245
	xorlw	2^1	; case 2
	skipnz
	goto	l5261
	xorlw	3^2	; case 3
	skipnz
	goto	l5293
	goto	l587

	line	583
	
l587:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_handle_numeric_rotation
	__end_of_handle_numeric_rotation:
	signat	_handle_numeric_rotation,4217
	global	_uart_println

;; *************** function _uart_println *****************
;; Defined at:
;;		line 78 in file "src\main.c"
;; Parameters:    Size  Location     Type
;;  str             2   17[COMRAM] PTR const unsigned char 
;;		 -> menu_handle_button@buf_1233(50), STR_151(27), menu_handle_button@buf(50), menu_handle_encoder@buf(50), 
;;		 -> STR_138(41), menu_draw_input@buf(50), menu_update_numeric_value@debug(50), STR_125(33), 
;;		 -> handle_numeric_rotation@buf(50), STR_123(31), rebuild_input_menu@buf_1092(50), STR_121(26), 
;;		 -> rebuild_input_menu@buf(30), menu_update_time_value@debug(50), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), STR_81(29), init_time_editor@buf(60), STR_22(36), 
;;		 -> STR_19(33), STR_18(22), STR_15(26), STR_14(15), 
;;		 -> STR_13(20), main@buf_586(30), main@buf(40), STR_10(19), 
;;		 -> STR_9(22), STR_8(22), STR_7(24), STR_6(19), 
;;		 -> STR_5(22), STR_2(23), STR_1(28), 
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
;;		_uart_print
;;		_uart_write
;; This function is called by:
;;		_main
;;		_init_time_editor
;;		_handle_time_rotation
;;		_menu_update_time_value
;;		_rebuild_input_menu
;;		_handle_numeric_rotation
;;		_menu_update_numeric_value
;;		_menu_draw_input
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text36,class=CODE,space=0,reloc=2,group=0
	file	"src\main.c"
	line	78
global __ptext36
__ptext36:
psect	text36
	file	"src\main.c"
	line	78
	
_uart_println:; BSR set to: 0

;incstack = 0
	callstack 26
	line	80
	
l4195:
		movff	(c:uart_println@str),(c:uart_print@str)
	movff	(c:uart_println@str+1),(c:uart_print@str+1)

	call	_uart_print	;wreg free
	line	81
	
l4197:
	movlw	(0Dh)&0ffh
	
	call	_uart_write
	line	82
	
l4199:
	movlw	(0Ah)&0ffh
	
	call	_uart_write
	line	83
	
l120:
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
;;  str             2   15[COMRAM] PTR const unsigned char 
;;		 -> menu_handle_button@buf_1233(50), STR_151(27), menu_handle_button@buf(50), menu_handle_encoder@buf(50), 
;;		 -> STR_138(41), menu_draw_input@buf(50), menu_update_numeric_value@debug(50), STR_125(33), 
;;		 -> handle_numeric_rotation@buf(50), STR_123(31), rebuild_input_menu@buf_1092(50), STR_121(26), 
;;		 -> rebuild_input_menu@buf(30), menu_update_time_value@debug(50), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), STR_81(29), init_time_editor@buf(60), STR_22(36), 
;;		 -> STR_19(33), STR_18(22), STR_15(26), STR_14(15), 
;;		 -> STR_13(20), main@buf_586(30), main@buf(40), STR_10(19), 
;;		 -> STR_9(22), STR_8(22), STR_7(24), STR_6(19), 
;;		 -> STR_5(22), STR_2(23), STR_1(28), 
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
;;		_uart_write
;; This function is called by:
;;		_uart_println
;; This function uses a non-reentrant model
;;
psect	text37,class=CODE,space=0,reloc=2,group=0
	line	70
global __ptext37
__ptext37:
psect	text37
	file	"src\main.c"
	line	70
	
_uart_print:
;incstack = 0
	callstack 26
	line	72
	
l4099:
	goto	l4105
	line	74
	
l4101:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u3547
	tblrd	*
	
	movf	tablat,w
	bra	u3540
u3547:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u3540:
	
	call	_uart_write
	
l4103:
	infsnz	((c:uart_print@str))^00h,c
	incf	((c:uart_print@str+1))^00h,c
	line	72
	
l4105:
	movff	(c:uart_print@str),tblptrl
	movff	(c:uart_print@str+1),tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u3557
	tblrd	*
	
	movf	tablat,w
	bra	u3550
u3557:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u3550:
	iorlw	0
	btfss	status,2
	goto	u3561
	goto	u3560
u3561:
	goto	l4101
u3560:
	line	76
	
l117:
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
;;  c               1   14[COMRAM] unsigned char 
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_print
;;		_uart_println
;; This function uses a non-reentrant model
;;
psect	text38,class=CODE,space=0,reloc=2,group=0
	line	63
global __ptext38
__ptext38:
psect	text38
	file	"src\main.c"
	line	63
	
_uart_write:
;incstack = 0
	callstack 27
	movwf	((c:uart_write@c))^00h,c
	line	65
	
l4077:
	line	66
	
l108:
	line	65
	btfss	((c:4012))^0f00h,c,1	;volatile
	goto	u3511
	goto	u3510
u3511:
	goto	l108
u3510:
	line	67
	
l4079:
	movff	(c:uart_write@c),(c:4013)	;volatile
	line	68
	
l111:
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
;;		 -> menu_handle_button@buf_1233(50), menu_handle_button@buf(50), menu_handle_encoder@buf(50), menu_draw_input@buf(50), 
;;		 -> menu_draw_input@title(10), menu_update_numeric_value@debug(50), handle_numeric_rotation@buf(50), rebuild_input_menu@buf_1092(50), 
;;		 -> rebuild_input_menu@buf(30), value_high_tbp(10), value_high_temp(10), value_back(5), 
;;		 -> value_display(10), value_rlyslp(10), value_rlyplp(10), value_rlyhigh(10), 
;;		 -> value_slpbp(10), value_plpbp(10), value_low_pressure(10), value_highbp(10), 
;;		 -> value_hi_pressure(10), value_scale20(10), value_scale4(10), value_sensor(12), 
;;		 -> value_enable(10), menu_update_time_value@debug(50), menu_update_time_value@debug_after(50), menu_update_time_value@debug_before(50), 
;;		 -> handle_time_rotation@buf(50), init_time_editor@buf(60), NULL(0), main@buf_586(30), 
;;		 -> main@buf(40), 
;;  f               2   28[COMRAM] PTR const unsigned char 
;;		 -> STR_156(38), STR_155(5), STR_154(5), STR_153(6), 
;;		 -> STR_152(6), STR_150(10), STR_149(26), STR_148(28), 
;;		 -> STR_134(19), STR_133(9), STR_126(24), STR_124(29), 
;;		 -> STR_122(12), STR_120(23), STR_119(10), STR_118(3), 
;;		 -> STR_117(6), STR_116(6), STR_103(10), STR_102(10), 
;;		 -> STR_101(5), STR_100(10), STR_99(5), STR_98(6), 
;;		 -> STR_97(6), STR_93(3), STR_88(25), STR_87(28), 
;;		 -> STR_86(28), STR_85(27), STR_84(51), STR_83(25), 
;;		 -> STR_82(45), STR_80(35), STR_12(17), STR_11(23), 
;; Auto vars:     Size  Location     Type
;;  tmpval          4    0        struct .
;;  width           2   55[COMRAM] int 
;;  len             2   51[COMRAM] unsigned int 
;;  val             2   49[COMRAM] unsigned int 
;;  cp              2   47[COMRAM] PTR const unsigned char 
;;		 -> STR_168(7), ?_sprintf(2), STR_95(9), STR_94(8), 
;;		 -> menu_update_time_value@value_buf(6), STR_79(5), STR_78(8), STR_77(8), 
;;		 -> STR_76(12), STR_75(9), STR_74(11), STR_73(10), 
;;		 -> STR_72(6), STR_71(5), STR_70(7), STR_69(7), 
;;		 -> STR_68(5), STR_67(8), STR_66(8), STR_65(11), 
;;		 -> STR_64(8), STR_63(5), STR_62(7), STR_61(7), 
;;		 -> STR_60(5), STR_59(8), STR_58(9), STR_57(9), 
;;		 -> STR_56(10), STR_55(11), STR_54(10), STR_53(7), 
;;		 -> STR_52(7), STR_51(5), STR_50(8), STR_49(8), 
;;		 -> STR_48(8), STR_47(9), STR_46(6), STR_45(6), 
;;		 -> STR_44(13), STR_43(9), STR_42(12), STR_41(11), 
;;		 -> STR_40(10), STR_39(7), STR_38(7), 
;;  flag            1   54[COMRAM] unsigned char 
;;  c               1   53[COMRAM] unsigned char 
;;  ap              1   46[COMRAM] PTR void [1]
;;		 -> ?_sprintf(2), 
;;  prec            1   45[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  2   26[COMRAM] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/1
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
;;		_menu_update_numeric_value
;;		_menu_draw_input
;;		_menu_handle_encoder
;;		_menu_handle_button
;; This function uses a non-reentrant model
;;
psect	text39,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
global __ptext39
__ptext39:
psect	text39
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\doprnt.c"
	line	505
	
_sprintf:
;incstack = 0
	callstack 27
	line	550
	
l4201:
		movlw	low(?_sprintf+04h)
	movwf	((c:sprintf@ap))^00h,c

	line	553
	goto	l4367
	line	555
	
l4203:
		movlw	37
	xorwf	((c:sprintf@c))^00h,c,w
	btfsc	status,2
	goto	u3691
	goto	u3690

u3691:
	goto	l4209
u3690:
	line	558
	
l4205:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l4207:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	559
	goto	l4367
	line	563
	
l4209:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	565
	movlw	low(0)
	movwf	((c:sprintf@flag))^00h,c
	goto	l4219
	line	578
	
l4211:
	bsf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	579
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	580
	goto	l4219
	line	585
	
l4213:
	bsf	(0+(1/8)+(c:sprintf@flag))^00h,c,(1)&7
	line	586
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	587
	goto	l4219
	line	597
	
l4215:
	bsf	(0+(2/8)+(c:sprintf@flag))^00h,c,(2)&7
	line	598
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	568
	
l4219:
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
	goto	l4211
	xorlw	43^32	; case 43
	skipnz
	goto	l4213
	xorlw	48^43	; case 48
	skipnz
	goto	l4215
	goto	l992

	line	603
	
l992:
	line	606
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u3701
	goto	u3700
u3701:
	goto	l4223
u3700:
	line	607
	
l4221:
	bcf	(0+(0/8)+(c:sprintf@flag))^00h,c,(0)&7
	line	614
	
l4223:
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
	goto	u3711
	goto	u3710
u3711:
	goto	l4271
u3710:
	line	615
	
l4225:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	617
	
l4227:
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
	
l4229:
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

	
l4231:
	infsnz	((c:sprintf@f))^00h,c
	incf	((c:sprintf@f+1))^00h,c
	line	619
	
l4233:
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
	goto	u3721
	goto	u3720
u3721:
	goto	l4227
u3720:
	goto	l4271
	line	760
	
l4235:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@cp)
	movff	postdec2,(c:sprintf@cp+1)
	
l4237:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	766
	
l4239:
	movf	((c:sprintf@cp))^00h,c,w
iorwf	((c:sprintf@cp+1))^00h,c,w
	btfss	status,2
	goto	u3731
	goto	u3730

u3731:
	goto	l4243
u3730:
	line	767
	
l4241:
		movlw	low(STR_168)
	movwf	((c:sprintf@cp))^00h,c
	movlw	high(STR_168)
	movwf	((c:sprintf@cp+1))^00h,c

	line	771
	
l4243:
	movlw	high(0)
	movwf	((c:sprintf@len+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@len))^00h,c
	line	772
	goto	l4247
	line	773
	
l4245:
	infsnz	((c:sprintf@len))^00h,c
	incf	((c:sprintf@len+1))^00h,c
	line	772
	
l4247:
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
	bra	u3747
	tblrd	*
	
	movf	tablat,w
	bra	u3740
u3747:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u3740:
	iorlw	0
	btfss	status,2
	goto	u3751
	goto	u3750
u3751:
	goto	l4245
u3750:
	line	783
	
l4249:
		movf	((c:sprintf@width))^00h,c,w
	subwf	((c:sprintf@len))^00h,c,w
	movf	((c:sprintf@width+1))^00h,c,w
	subwfb	((c:sprintf@len+1))^00h,c,w
	btfsc	status,0
	goto	u3761
	goto	u3760

u3761:
	goto	l4253
u3760:
	line	784
	
l4251:
	movf	((c:sprintf@len))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movf	((c:sprintf@len+1))^00h,c,w
	subwfb	((c:sprintf@width+1))^00h,c

	goto	l4259
	line	786
	
l4253:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	goto	l4259
	line	791
	
l4255:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l4257:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	790
	
l4259:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
		incf	((c:sprintf@width))^00h,c,w
	bnz	u3771
	incf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u3771
	goto	u3770

u3771:
	goto	l4255
u3770:
	goto	l4267
	line	794
	
l4261:
	movff	(c:sprintf@cp),tblptrl
	movff	(c:sprintf@cp+1),tblptrh
	clrf	tblptru
	
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	u3787
	tblrd	*
	
	movf	tablat,w
	bra	u3780
u3787:
	movff	tblptrl,fsr0l
	movff	tblptrh,fsr0h
	movf	indf0,w
u3780:
	movwf	indf2
	
l4263:
	infsnz	((c:sprintf@cp))^00h,c
	incf	((c:sprintf@cp+1))^00h,c
	
l4265:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	793
	
l4267:
	decf	((c:sprintf@len))^00h,c
	btfss	status,0
	decf	((c:sprintf@len+1))^00h,c
		incf	((c:sprintf@len))^00h,c,w
	bnz	u3791
	incf	((c:sprintf@len+1))^00h,c,w
	btfss	status,2
	goto	u3791
	goto	u3790

u3791:
	goto	l4261
u3790:
	goto	l4367
	line	661
	
l4271:
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
	goto	l4369
	xorlw	100^0	; case 100
	skipnz
	goto	l4273
	xorlw	105^100	; case 105
	skipnz
	goto	l4273
	xorlw	115^105	; case 115
	skipnz
	goto	l4235
	goto	l4367

	line	1285
	
l4273:
	movf	((c:sprintf@ap))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:sprintf@val)
	movff	postdec2,(c:sprintf@val+1)
	
l4275:
	movlw	(02h)&0ffh
	addwf	((c:sprintf@ap))^00h,c
	line	1287
	
l4277:
	btfsc	((c:sprintf@val+1))^00h,c,7
	goto	u3800
	goto	u3801

u3801:
	goto	l4283
u3800:
	line	1288
	
l4279:
	movlw	(03h)&0ffh
	iorwf	((c:sprintf@flag))^00h,c
	line	1289
	
l4281:
	negf	((c:sprintf@val))^00h,c
	comf	((c:sprintf@val+1))^00h,c
	btfsc	status,0
	incf	((c:sprintf@val+1))^00h,c
	line	1331
	
l4283:
	movlw	low(01h)
	movwf	((c:sprintf@c))^00h,c
	line	1332
	
l4289:
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
	goto	u3811
	goto	u3810

u3811:
	goto	l4293
u3810:
	goto	l4297
	line	1331
	
l4293:
	incf	((c:sprintf@c))^00h,c
	
l4295:
		movlw	5
	xorwf	((c:sprintf@c))^00h,c,w
	btfss	status,2
	goto	u3821
	goto	u3820

u3821:
	goto	l4289
u3820:
	line	1371
	
l4297:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u3831
	goto	u3830

u3831:
	goto	l4303
u3830:
	
l4299:
	movff	(c:sprintf@flag),??_sprintf+0+0
	movlw	03h
	andwf	(??_sprintf+0+0)^00h,c
	btfsc	status,2
	goto	u3841
	goto	u3840
u3841:
	goto	l4303
u3840:
	line	1372
	
l4301:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	line	1407
	
l4303:
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
	goto	u3851
	goto	u3850

u3851:
	goto	l4307
u3850:
	line	1408
	
l4305:
	movf	((c:sprintf@c))^00h,c,w
	subwf	((c:sprintf@width))^00h,c
	movlw	0
	subwfb	((c:sprintf@width+1))^00h,c
	goto	l4309
	line	1410
	
l4307:
	movlw	high(0)
	movwf	((c:sprintf@width+1))^00h,c
	movlw	low(0)
	movwf	((c:sprintf@width))^00h,c
	line	1413
	
l4309:
	
	btfss	((c:sprintf@flag))^00h,c,(2)&7
	goto	u3861
	goto	u3860
u3861:
	goto	l4335
u3860:
	line	1415
	
l4311:
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u3871
	goto	u3870
u3871:
	goto	l1025
u3870:
	line	1416
	
l4313:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u3881
	goto	u3880
u3881:
	goto	l4317
u3880:
	
l4315:
	movlw	high(02Bh)
	movwf	((c:_sprintf$1505+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$1505))^00h,c
	goto	l4319
	
l4317:
	movlw	high(02Dh)
	movwf	((c:_sprintf$1505+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$1505))^00h,c
	
l4319:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$1505),indf2

	
l4321:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l4327
	line	1422
	
l1025:
	line	1425
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u3891
	goto	u3890
u3891:
	goto	l4327
u3890:
	line	1426
	
l4323:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l4321
	line	1441
	
l4327:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u3901
	goto	u3900

u3901:
	goto	l4357
u3900:
	line	1443
	
l4329:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(030h)
	movwf	indf2
	
l4331:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1444
	
l4333:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u3911
	goto	u3910

u3911:
	goto	l4329
u3910:
	goto	l4357
	line	1454
	
l4335:
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfsc	status,2
	goto	u3921
	goto	u3920

u3921:
	goto	l1036
u3920:
	line	1456
	
l4337:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	
l4339:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1457
	
l4341:
	decf	((c:sprintf@width))^00h,c
	btfss	status,0
	decf	((c:sprintf@width+1))^00h,c
	movf	((c:sprintf@width))^00h,c,w
iorwf	((c:sprintf@width+1))^00h,c,w
	btfss	status,2
	goto	u3931
	goto	u3930

u3931:
	goto	l4337
u3930:
	
l1036:
	line	1460
	
	btfss	((c:sprintf@flag))^00h,c,(1)&7
	goto	u3941
	goto	u3940
u3941:
	goto	l1039
u3940:
	line	1461
	
l4343:
	
	btfsc	((c:sprintf@flag))^00h,c,(0)&7
	goto	u3951
	goto	u3950
u3951:
	goto	l4347
u3950:
	
l4345:
	movlw	high(02Bh)
	movwf	((c:_sprintf$1506+1))^00h,c
	movlw	low(02Bh)
	movwf	((c:_sprintf$1506))^00h,c
	goto	l4349
	
l4347:
	movlw	high(02Dh)
	movwf	((c:_sprintf$1506+1))^00h,c
	movlw	low(02Dh)
	movwf	((c:_sprintf$1506))^00h,c
	
l4349:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:_sprintf$1506),indf2

	
l4351:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	goto	l4357
	line	1469
	
l1039:
	
	btfss	((c:sprintf@flag))^00h,c,(0)&7
	goto	u3961
	goto	u3960
u3961:
	goto	l4357
u3960:
	line	1470
	
l4353:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movlw	low(020h)
	movwf	indf2
	goto	l4351
	line	1498
	
l4357:
	movff	(c:sprintf@c),(c:sprintf@prec)
	line	1500
	goto	l4365
	line	1515
	
l4359:
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
	
l4361:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	movff	(c:sprintf@c),indf2

	
l4363:
	infsnz	((c:sprintf@sp))^00h,c
	incf	((c:sprintf@sp+1))^00h,c
	line	1500
	
l4365:
	decf	((c:sprintf@prec))^00h,c
		incf	((c:sprintf@prec))^00h,c,w
	btfss	status,2
	goto	u3971
	goto	u3970

u3971:
	goto	l4359
u3970:
	line	553
	
l4367:
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
	goto	u3981
	goto	u3980
u3981:
	goto	l4203
u3980:
	line	1564
	
l4369:
	movff	(c:sprintf@sp),fsr2l
	movff	(c:sprintf@sp+1),fsr2h
	clrf	indf2
	line	1567
	
l1050:
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
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text40,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
global __ptext40
__ptext40:
psect	text40
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\isdigit.c"
	line	8
	
_isdigit:
;incstack = 0
	callstack 27
	movwf	((c:isdigit@c))^00h,c
	line	14
	
l4139:
	movlw	low(0)
	movwf	((c:_isdigit$1946))^00h,c
	
l4141:
		movlw	03Ah-0
	cpfslt	((c:isdigit@c))^00h,c
	goto	u3611
	goto	u3610

u3611:
	goto	l4147
u3610:
	
l4143:
		movlw	030h-1
	cpfsgt	((c:isdigit@c))^00h,c
	goto	u3621
	goto	u3620

u3621:
	goto	l4147
u3620:
	
l4145:
	movlw	low(01h)
	movwf	((c:_isdigit$1946))^00h,c
	
l4147:
	movff	(c:_isdigit$1946),??_isdigit+0+0
	rrcf	(??_isdigit+0+0)^00h,c,w
	line	15
	
l1717:
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
;;		On entry : 0/1
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
psect	text41,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
global __ptext41
__ptext41:
psect	text41
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\Umul16.c"
	line	15
	
___wmul:
;incstack = 0
	callstack 27
	line	37
	
l4151:
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
	
l4153:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	line	53
	
l1053:
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
psect	text42,class=CODE,space=0,reloc=2,group=2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext42
__ptext42:
psect	text42
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
___lwmod:
;incstack = 0
	callstack 27
	line	12
	
l4179:
	movf	((c:___lwmod@divisor))^00h,c,w
iorwf	((c:___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u3661
	goto	u3660

u3661:
	goto	l1542
u3660:
	line	13
	
l4181:
	movlw	low(01h)
	movwf	((c:___lwmod@counter))^00h,c
	line	14
	goto	l4185
	line	15
	
l4183:
	bcf	status,0
	rlcf	((c:___lwmod@divisor))^00h,c
	rlcf	((c:___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:___lwmod@counter))^00h,c
	line	14
	
l4185:
	
	btfss	((c:___lwmod@divisor+1))^00h,c,(15)&7
	goto	u3671
	goto	u3670
u3671:
	goto	l4183
u3670:
	line	19
	
l4187:
		movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c,w
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	u3681
	goto	u3680

u3681:
	goto	l4191
u3680:
	line	20
	
l4189:
	movf	((c:___lwmod@divisor))^00h,c,w
	subwf	((c:___lwmod@dividend))^00h,c
	movf	((c:___lwmod@divisor+1))^00h,c,w
	subwfb	((c:___lwmod@dividend+1))^00h,c

	line	21
	
l4191:
	bcf	status,0
	rrcf	((c:___lwmod@divisor+1))^00h,c
	rrcf	((c:___lwmod@divisor))^00h,c
	line	22
	
l4193:
	decfsz	((c:___lwmod@counter))^00h,c
	
	goto	l4187
	line	23
	
l1542:
	line	24
	movff	(c:___lwmod@dividend),(c:?___lwmod)
	movff	(c:___lwmod@dividend+1),(c:?___lwmod+1)
	line	25
	
l1549:
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
;;  quotient        2   23[COMRAM] unsigned int 
;;  counter         1   25[COMRAM] unsigned char 
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
	
l4157:
	movlw	high(0)
	movwf	((c:___lwdiv@quotient+1))^00h,c
	movlw	low(0)
	movwf	((c:___lwdiv@quotient))^00h,c
	line	14
	
l4159:
	movf	((c:___lwdiv@divisor))^00h,c,w
iorwf	((c:___lwdiv@divisor+1))^00h,c,w
	btfsc	status,2
	goto	u3631
	goto	u3630

u3631:
	goto	l1532
u3630:
	line	15
	
l4161:
	movlw	low(01h)
	movwf	((c:___lwdiv@counter))^00h,c
	line	16
	goto	l4165
	line	17
	
l4163:
	bcf	status,0
	rlcf	((c:___lwdiv@divisor))^00h,c
	rlcf	((c:___lwdiv@divisor+1))^00h,c
	line	18
	incf	((c:___lwdiv@counter))^00h,c
	line	16
	
l4165:
	
	btfss	((c:___lwdiv@divisor+1))^00h,c,(15)&7
	goto	u3641
	goto	u3640
u3641:
	goto	l4163
u3640:
	line	21
	
l4167:
	bcf	status,0
	rlcf	((c:___lwdiv@quotient))^00h,c
	rlcf	((c:___lwdiv@quotient+1))^00h,c
	line	22
	
l4169:
		movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c,w
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c,w
	btfss	status,0
	goto	u3651
	goto	u3650

u3651:
	goto	l4175
u3650:
	line	23
	
l4171:
	movf	((c:___lwdiv@divisor))^00h,c,w
	subwf	((c:___lwdiv@dividend))^00h,c
	movf	((c:___lwdiv@divisor+1))^00h,c,w
	subwfb	((c:___lwdiv@dividend+1))^00h,c

	line	24
	
l4173:
	bsf	(0+(0/8)+(c:___lwdiv@quotient))^00h,c,(0)&7
	line	26
	
l4175:
	bcf	status,0
	rrcf	((c:___lwdiv@divisor+1))^00h,c
	rrcf	((c:___lwdiv@divisor))^00h,c
	line	27
	
l4177:
	decfsz	((c:___lwdiv@counter))^00h,c
	
	goto	l4167
	line	28
	
l1532:
	line	29
	movff	(c:___lwdiv@quotient),(c:?___lwdiv)
	movff	(c:___lwdiv@quotient+1),(c:?___lwdiv+1)
	line	30
	
l1539:
	return	;funcret
	callstack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
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
psect	text44,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	260
global __ptext44
__ptext44:
psect	text44
	file	"src\eeprom.c"
	line	260
	
_get_menu_timeout_seconds:
;incstack = 0
	callstack 28
	line	263
	
l5199:; BSR set to: 4

		movlw	05h-0
	cpfslt	(0+(_system_config+01h))&0ffh
	goto	u4981
	goto	u4980

u4981:
	goto	l5205
u4980:
	line	265
	
l5201:; BSR set to: 4

	movlw	(01Eh)&0ffh
	goto	l970
	line	267
	
l5205:; BSR set to: 4

		movlw	079h-1
	cpfsgt	(0+(_system_config+01h))&0ffh
	goto	u4991
	goto	u4990

u4991:
	goto	l5211
u4990:
	goto	l5201
	line	271
	
l5211:; BSR set to: 4

	movf	(0+(_system_config+01h))&0ffh,w
	line	272
	
l970:; BSR set to: 4

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
psect	text45,class=CODE,space=0,reloc=2,group=0
	file	"src\encoder.c"
	line	169
global __ptext45
__ptext45:
psect	text45
	file	"src\encoder.c"
	line	169
	
_encoder_init:; BSR set to: 4

;incstack = 0
	callstack 28
	line	172
	
l5215:
	movlw	low(0C4h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	173
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	176
	movlw	high(0)
	movlb	1	; () banked
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
	
l5217:; BSR set to: 1

	bcf	((c:4082))^0f00h,c,2	;volatile
	line	183
	
l5219:; BSR set to: 1

	bsf	((c:4082))^0f00h,c,5	;volatile
	line	184
	
l5221:; BSR set to: 1

	bsf	((c:4082))^0f00h,c,7	;volatile
	line	187
	
l5223:; BSR set to: 1

	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	u5001
	goto	u5000
u5001:
	clrf	(??_encoder_init+0+0)^00h,c
	incf	(??_encoder_init+0+0)^00h,c
	goto	u5008
u5000:
	clrf	(??_encoder_init+0+0)^00h,c
u5008:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	u5011
	goto	u5010
u5011:
	clrf	(??_encoder_init+1+0)^00h,c
	incf	(??_encoder_init+1+0)^00h,c
	goto	u5018
u5010:
	clrf	(??_encoder_init+1+0)^00h,c
u5018:
	bcf	status,0
	rlcf	(??_encoder_init+1+0)^00h,c,w
	iorwf	(??_encoder_init+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:_enc_state))^00h,c
	line	188
	
l324:
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
psect	text46,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	180
global __ptext46
__ptext46:
psect	text46
	file	"src\eeprom.c"
	line	180
	
_eeprom_init:
;incstack = 0
	callstack 25
	line	182
	
l5165:
	movlw	high(0200h)
	movwf	((c:eeprom_read_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_read_word@address))^00h,c
	call	_eeprom_read_word	;wreg free
	movff	0+?_eeprom_read_word,(c:eeprom_init@stored_checksum)
	movff	1+?_eeprom_read_word,(c:eeprom_init@stored_checksum+1)
	line	185
	
l5167:
	movlw	low(0)
	movwf	((c:eeprom_init@i))^00h,c
	line	189
	
l5173:
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
	
l5175:
	incf	((c:eeprom_init@i))^00h,c
	
l5177:
		movlw	03h-1
	cpfsgt	((c:eeprom_init@i))^00h,c
	goto	u4941
	goto	u4940

u4941:
	goto	l5173
u4940:
	line	191
	
l5179:
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
	
l5181:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum)
	movff	1+?_calculate_config_checksum,(c:eeprom_init@calculated_checksum+1)
	line	195
	
l5183:
	movf	((c:eeprom_init@calculated_checksum))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum))^00h,c,w
	bnz	u4950
movf	((c:eeprom_init@calculated_checksum+1))^00h,c,w
xorwf	((c:eeprom_init@stored_checksum+1))^00h,c,w
	btfsc	status,2
	goto	u4951
	goto	u4950

u4951:
	goto	l5189
u4950:
	line	198
	
l5185:
	call	_load_factory_defaults	;wreg free
	line	199
	
l5187:
	call	_save_current_config	;wreg free
	line	203
	
l5189:
	call	_sync_menu_variables	;wreg free
	line	207
	
l5191:
	movlb	4	; () banked
	movf	(0+(_system_config+01h))&0ffh,w
	mullw	02h
	movff	prodl,(c:_menu_timeout_seconds)
	movff	prodh,(c:_menu_timeout_seconds+1)
	line	210
	
l5193:; BSR set to: 4

		movf	((c:_menu_timeout_seconds+1))^00h,c,w
	bnz	u4960
	movlw	10
	subwf	 ((c:_menu_timeout_seconds))^00h,c,w
	btfss	status,0
	goto	u4961
	goto	u4960

u4961:
	goto	l5197
u4960:
	
l5195:; BSR set to: 4

		incf	((c:_menu_timeout_seconds))^00h,c,w
	movlw	1
	subwfb	((c:_menu_timeout_seconds+1))^00h,c,w
	btfss	status,0
	goto	u4971
	goto	u4970

u4971:
	goto	l948
u4970:
	line	212
	
l5197:; BSR set to: 4

	movlw	high(01Eh)
	movwf	((c:_menu_timeout_seconds+1))^00h,c
	movlw	low(01Eh)
	movwf	((c:_menu_timeout_seconds))^00h,c
	line	214
	
l948:; BSR set to: 4

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
psect	text47,class=CODE,space=0,reloc=2,group=0
	line	247
global __ptext47
__ptext47:
psect	text47
	file	"src\eeprom.c"
	line	247
	
_sync_menu_variables:; BSR set to: 4

;incstack = 0
	callstack 27
	line	256
	
l5105:
	movff	_input_config,(_enable_edit_flag)
	line	257
	movff	0+(_input_config+01h),(_sensor_edit_flag)
	line	258
	
l966:
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
;;		_menu_handle_button
;;		_eeprom_init
;; This function uses a non-reentrant model
;;
psect	text48,class=CODE,space=0,reloc=2,group=0
	line	216
global __ptext48
__ptext48:
psect	text48
	file	"src\eeprom.c"
	line	216
	
_save_current_config:
;incstack = 0
	callstack 25
	line	219
	
l5069:
	movlw	low(0)
	movwf	((c:save_current_config@i))^00h,c
	line	223
	
l5075:
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
	
l5077:
	incf	((c:save_current_config@i))^00h,c
	
l5079:
		movlw	03h-1
	cpfsgt	((c:save_current_config@i))^00h,c
	goto	u4911
	goto	u4910

u4911:
	goto	l5075
u4910:
	line	227
	
l5081:
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
	
l5083:
	call	_calculate_config_checksum	;wreg free
	movff	0+?_calculate_config_checksum,(c:save_current_config@checksum)
	movff	1+?_calculate_config_checksum,(c:save_current_config@checksum+1)
	line	231
	
l5085:
	movlw	high(0200h)
	movwf	((c:eeprom_write_word@address+1))^00h,c
	movlw	low(0200h)
	movwf	((c:eeprom_write_word@address))^00h,c
	movff	(c:save_current_config@checksum),(c:eeprom_write_word@data)
	movff	(c:save_current_config@checksum+1),(c:eeprom_write_word@data+1)
	call	_eeprom_write_word	;wreg free
	line	232
	
l953:
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
psect	text49,class=CODE,space=0,reloc=2,group=0
	line	155
global __ptext49
__ptext49:
psect	text49
	file	"src\eeprom.c"
	line	155
	
_eeprom_write_word:
;incstack = 0
	callstack 25
	line	157
	
l4511:
	movff	(c:eeprom_write_word@address),(c:eeprom_write_byte@address)
	movff	(c:eeprom_write_word@address+1),(c:eeprom_write_byte@address+1)
	movff	(c:eeprom_write_word@data),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	158
	
l4513:
	movlw	low(01h)
	addwf	((c:eeprom_write_word@address))^00h,c,w
	movwf	((c:eeprom_write_byte@address))^00h,c
	movlw	high(01h)
	addwfc	((c:eeprom_write_word@address+1))^00h,c,w
	movwf	1+((c:eeprom_write_byte@address))^00h,c
	movff	0+((c:eeprom_write_word@data)+01h),(c:eeprom_write_byte@data)
	call	_eeprom_write_byte	;wreg free
	line	159
	
l927:
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
psect	text50,class=CODE,space=0,reloc=2,group=0
	line	161
global __ptext50
__ptext50:
psect	text50
	file	"src\eeprom.c"
	line	161
	
_eeprom_write_block:
;incstack = 0
	callstack 25
	line	163
	
l4515:
		movff	(c:eeprom_write_block@data),(c:eeprom_write_block@ptr)
	movff	(c:eeprom_write_block@data+1),(c:eeprom_write_block@ptr+1)

	line	164
	
l4517:
	movlw	high(0)
	movwf	((c:eeprom_write_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_write_block@i))^00h,c
	goto	l4523
	line	166
	
l4519:
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
	
l4521:
	infsnz	((c:eeprom_write_block@i))^00h,c
	incf	((c:eeprom_write_block@i+1))^00h,c
	
l4523:
		movf	((c:eeprom_write_block@length))^00h,c,w
	subwf	((c:eeprom_write_block@i))^00h,c,w
	movf	((c:eeprom_write_block@length+1))^00h,c,w
	subwfb	((c:eeprom_write_block@i+1))^00h,c,w
	btfss	status,0
	goto	u4181
	goto	u4180

u4181:
	goto	l4519
u4180:
	line	168
	
l933:
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
psect	text51,class=CODE,space=0,reloc=2,group=0
	line	128
global __ptext51
__ptext51:
psect	text51
	file	"src\eeprom.c"
	line	128
	
_eeprom_write_byte:
;incstack = 0
	callstack 25
	line	130
	
l4133:
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
	
l4135:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	139
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	140
	
l4137:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	143
	
l918:
	line	142
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u3601
	goto	u3600
u3601:
	goto	l918
u3600:
	
l920:
	line	144
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	145
	
l921:
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
psect	text52,class=CODE,space=0,reloc=2,group=0
	line	92
global __ptext52
__ptext52:
psect	text52
	file	"src\eeprom.c"
	line	92
	
_calculate_config_checksum:
;incstack = 0
	callstack 26
	line	94
	
l4467:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@checksum+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@checksum))^00h,c
	line	98
	movlw	low(0)
	movwf	((c:calculate_config_checksum@i))^00h,c
	line	100
	
l4473:
	movf	((c:calculate_config_checksum@i))^00h,c,w
	mullw	080h
	movlw	low(_input_config)
	addwf	(prodl)^0f00h,c,w
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_input_config)
	addwfc	prod+1,w
	movwf	1+((c:calculate_config_checksum@data))^00h,c
	line	101
	
l4475:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j))^00h,c
	line	103
	
l4481:
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
	
l4483:
	infsnz	((c:calculate_config_checksum@j))^00h,c
	incf	((c:calculate_config_checksum@j+1))^00h,c
	
l4485:
		movf	((c:calculate_config_checksum@j+1))^00h,c,w
	bnz	u4150
	movlw	128
	subwf	 ((c:calculate_config_checksum@j))^00h,c,w
	btfss	status,0
	goto	u4151
	goto	u4150

u4151:
	goto	l4481
u4150:
	line	98
	
l4487:
	incf	((c:calculate_config_checksum@i))^00h,c
	
l4489:
		movlw	03h-1
	cpfsgt	((c:calculate_config_checksum@i))^00h,c
	goto	u4161
	goto	u4160

u4161:
	goto	l4473
u4160:
	line	108
	
l4491:
		movlw	low(_system_config)
	movwf	((c:calculate_config_checksum@data))^00h,c
	movlw	high(_system_config)
	movwf	((c:calculate_config_checksum@data+1))^00h,c

	line	109
	
l4493:
	movlw	high(0)
	movwf	((c:calculate_config_checksum@j_1420+1))^00h,c
	movlw	low(0)
	movwf	((c:calculate_config_checksum@j_1420))^00h,c
	line	111
	
l4499:
	movf	((c:calculate_config_checksum@j_1420))^00h,c,w
	addwf	((c:calculate_config_checksum@data))^00h,c,w
	movwf	c:fsr2l
	movf	((c:calculate_config_checksum@j_1420+1))^00h,c,w
	addwfc	((c:calculate_config_checksum@data+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_calculate_config_checksum+0+0)^00h,c
	movf	((??_calculate_config_checksum+0+0))^00h,c,w
	addwf	((c:calculate_config_checksum@checksum))^00h,c
	movlw	0
	addwfc	((c:calculate_config_checksum@checksum+1))^00h,c
	line	109
	
l4501:
	infsnz	((c:calculate_config_checksum@j_1420))^00h,c
	incf	((c:calculate_config_checksum@j_1420+1))^00h,c
	
l4503:
		movf	((c:calculate_config_checksum@j_1420+1))^00h,c,w
	bnz	u4170
	movlw	128
	subwf	 ((c:calculate_config_checksum@j_1420))^00h,c,w
	btfss	status,0
	goto	u4171
	goto	u4170

u4171:
	goto	l4499
u4170:
	
l911:
	line	114
	movff	(c:calculate_config_checksum@checksum),(c:?_calculate_config_checksum)
	movff	(c:calculate_config_checksum@checksum+1),(c:?_calculate_config_checksum+1)
	line	115
	
l912:
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
psect	text53,class=CODE,space=0,reloc=2,group=0
	line	241
global __ptext53
__ptext53:
psect	text53
	file	"src\eeprom.c"
	line	241
	
_load_factory_defaults:
;incstack = 0
	callstack 26
	line	243
	
l5103:
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
	
l959:
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
;;		 -> system_config(128), input_menu(75), input_config(384), 
;;  s1              2   16[COMRAM] PTR const void 
;;		 -> system_defaults(128), factory_defaults(384), temp_menu_template(45), pressure_menu_template(70), 
;;  n               2   18[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  s               2   22[COMRAM] PTR const unsigned char 
;;		 -> system_defaults(128), factory_defaults(384), temp_menu_template(45), pressure_menu_template(70), 
;;  d               2   20[COMRAM] PTR unsigned char 
;;		 -> system_config(128), input_menu(75), input_config(384), 
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
;;		_load_factory_defaults
;; This function uses a non-reentrant model
;;
psect	text54,class=CODE,space=0,reloc=2,group=3
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
global __ptext54
__ptext54:
psect	text54
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\memcpy.c"
	line	27
	
_memcpy:
;incstack = 0
	callstack 26
	line	34
	
l4433:
		movff	(c:memcpy@s1),(c:memcpy@s)
	movff	(c:memcpy@s1+1),(c:memcpy@s+1)

	line	35
		movff	(c:memcpy@d1),(c:memcpy@d)
	movff	(c:memcpy@d1+1),(c:memcpy@d+1)

	line	36
	goto	l4443
	line	37
	
l4435:
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
	
l4437:
	infsnz	((c:memcpy@s))^00h,c
	incf	((c:memcpy@s+1))^00h,c
	line	38
	
l4439:
	movff	(c:memcpy@d),fsr2l
	movff	(c:memcpy@d+1),fsr2h
	movff	(c:memcpy@tmp),indf2

	
l4441:
	infsnz	((c:memcpy@d))^00h,c
	incf	((c:memcpy@d+1))^00h,c
	line	36
	
l4443:
	decf	((c:memcpy@n))^00h,c
	btfss	status,0
	decf	((c:memcpy@n+1))^00h,c
		incf	((c:memcpy@n))^00h,c,w
	bnz	u4101
	incf	((c:memcpy@n+1))^00h,c,w
	btfss	status,2
	goto	u4101
	goto	u4100

u4101:
	goto	l4435
u4100:
	line	41
	
l1723:
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
psect	text55,class=CODE,space=0,reloc=2,group=0
	file	"src\eeprom.c"
	line	147
global __ptext55
__ptext55:
psect	text55
	file	"src\eeprom.c"
	line	147
	
_eeprom_read_word:
;incstack = 0
	callstack 26
	line	150
	
l5087:
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
	
l5089:
	movff	(c:eeprom_read_word@result),(c:?_eeprom_read_word)
	movff	(c:eeprom_read_word@result+1),(c:?_eeprom_read_word+1)
	line	153
	
l924:
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
psect	text56,class=CODE,space=0,reloc=2,group=0
	line	170
global __ptext56
__ptext56:
psect	text56
	file	"src\eeprom.c"
	line	170
	
_eeprom_read_block:
;incstack = 0
	callstack 26
	line	172
	
l5093:
		movff	(c:eeprom_read_block@data),(c:eeprom_read_block@ptr)
	movff	(c:eeprom_read_block@data+1),(c:eeprom_read_block@ptr+1)

	line	173
	
l5095:
	movlw	high(0)
	movwf	((c:eeprom_read_block@i+1))^00h,c
	movlw	low(0)
	movwf	((c:eeprom_read_block@i))^00h,c
	goto	l5101
	line	175
	
l5097:
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
	
l5099:
	infsnz	((c:eeprom_read_block@i))^00h,c
	incf	((c:eeprom_read_block@i+1))^00h,c
	
l5101:
		movf	((c:eeprom_read_block@length))^00h,c,w
	subwf	((c:eeprom_read_block@i))^00h,c,w
	movf	((c:eeprom_read_block@length+1))^00h,c,w
	subwfb	((c:eeprom_read_block@i+1))^00h,c,w
	btfss	status,0
	goto	u4921
	goto	u4920

u4921:
	goto	l5097
u4920:
	line	177
	
l939:
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
psect	text57,class=CODE,space=0,reloc=2,group=0
	line	118
global __ptext57
__ptext57:
psect	text57
	file	"src\eeprom.c"
	line	118
	
_eeprom_read_byte:
;incstack = 0
	callstack 26
	line	120
	
l4505:
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
	
l4507:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	126
	
l915:
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
	
i2l6185:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	i2u672_41
	goto	i2u672_40
i2u672_41:
	goto	i2l321
i2u672_40:
	line	43
	
i2l6187:
	movlw	low(06h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	44
	
i2l6189:
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	47
	
i2l6191:
	incf	((c:_ms_counter))^00h,c	;volatile
	line	48
	
i2l6193:
		movlw	02h-1
	cpfsgt	((c:_ms_counter))^00h,c	;volatile
	goto	i2u673_41
	goto	i2u673_40

i2u673_41:
	goto	i2l6209
i2u673_40:
	line	50
	
i2l6195:
	movlw	low(0)
	movwf	((c:_ms_counter))^00h,c	;volatile
	line	51
	
i2l6197:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u674_41
	goto	i2u674_40

i2u674_41:
	goto	i2l6209
i2u674_40:
	line	53
	
i2l6199:
	decf	((c:_menu_timeout_timer))^00h,c	;volatile
	btfss	status,0
	decf	((c:_menu_timeout_timer+1))^00h,c	;volatile
	line	56
	
i2l6201:
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
	goto	i2u675_41
	goto	i2u675_40

i2u675_41:
	goto	i2l6205
i2u675_40:
	line	59
	
i2l6203:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_timeout_debug_flag))&0ffh	;volatile
	line	62
	
i2l6205:
	movf	((c:_menu_timeout_timer))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_timer+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u676_41
	goto	i2u676_40

i2u676_41:
	goto	i2l6209
i2u676_40:
	line	64
	
i2l6207:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	line	70
	
i2l6209:
	btfsc	((c:3969))^0f00h,c,2	;volatile
	goto	i2u677_41
	goto	i2u677_40
i2u677_41:
	clrf	(??_isr+0+0)^00h,c
	incf	(??_isr+0+0)^00h,c
	goto	i2u677_48
i2u677_40:
	clrf	(??_isr+0+0)^00h,c
i2u677_48:
	btfsc	((c:3969))^0f00h,c,1	;volatile
	goto	i2u678_41
	goto	i2u678_40
i2u678_41:
	clrf	(??_isr+1+0)^00h,c
	incf	(??_isr+1+0)^00h,c
	goto	i2u678_48
i2u678_40:
	clrf	(??_isr+1+0)^00h,c
i2u678_48:
	bcf	status,0
	rlcf	(??_isr+1+0)^00h,c,w
	iorwf	(??_isr+0+0)^00h,c,w
	andlw	low(03h)
	movwf	((c:isr@new_state))^00h,c
	line	71
	
i2l6211:
	rlncf	((c:_enc_state))^00h,c,w
	rlncf	wreg
	andlw	(0ffh shl 2) & 0ffh
	iorwf	((c:isr@new_state))^00h,c,w
	movwf	((c:isr@combined))^00h,c
	line	74
	
i2l6213:
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
	
i2l6215:
	movf	((c:isr@new_state))^00h,c,w
	btfss	status,2
	goto	i2u679_41
	goto	i2u679_40
i2u679_41:
	goto	i2l6241
i2u679_40:
	line	79
	
i2l6217:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^04h)
	btfss	status,0
	goto	i2u680_41
	goto	i2u680_40

i2u680_41:
	goto	i2l6229
i2u680_40:
	line	81
	
i2l6219:
	movlb	1	; () banked
	infsnz	((_encoder_count))&0ffh	;volatile
	incf	((_encoder_count+1))&0ffh	;volatile
	line	82
	
i2l6221:; BSR set to: 1

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	85
	
i2l6223:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u681_41
	goto	i2u681_40

i2u681_41:
	goto	i2l6241
i2u681_40:
	line	87
	
i2l6225:; BSR set to: 1

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	88
	
i2l6227:; BSR set to: 1

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l6241
	line	91
	
i2l6229:
		movf	((c:_enc_accumulator))^00h,c,w
	xorlw	80h
	addlw	-(80h^-3)
	btfsc	status,0
	goto	i2u682_41
	goto	i2u682_40

i2u682_41:
	goto	i2l6241
i2u682_40:
	line	93
	
i2l6231:
	movlb	1	; () banked
	decf	((_encoder_count))&0ffh	;volatile
	btfss	status,0
	decf	((_encoder_count+1))&0ffh	;volatile
	line	94
	
i2l6233:; BSR set to: 1

	movlw	low(0)
	movwf	((c:_enc_accumulator))^00h,c
	line	97
	
i2l6235:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u683_41
	goto	i2u683_40

i2u683_41:
	goto	i2l306
i2u683_40:
	goto	i2l6225
	line	103
	
i2l306:; BSR set to: 1

	line	105
	
i2l6241:
	movff	(c:isr@new_state),(c:_enc_state)
	line	108
	
i2l6243:
	movlw	0
	btfsc	((c:3969))^0f00h,c,6	;volatile
	movlw	1
	movwf	((c:isr@btn))^00h,c
	line	109
	
i2l6245:
	movf	((c:_last_btn))^00h,c,w
xorwf	((c:isr@btn))^00h,c,w
	btfsc	status,2
	goto	i2u684_41
	goto	i2u684_40

i2u684_41:
	goto	i2l6273
i2u684_40:
	line	111
	
i2l6247:
	incf	((c:_btn_debounce))^00h,c
	line	112
	
i2l6249:
		movlw	014h-1
	cpfsgt	((c:_btn_debounce))^00h,c
	goto	i2u685_41
	goto	i2u685_40

i2u685_41:
	goto	i2l321
i2u685_40:
	line	114
	
i2l6251:
	movff	(c:isr@btn),(c:_last_btn)
	line	115
	
i2l6253:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	117
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u686_41
	goto	i2u686_40
i2u686_41:
	goto	i2l6263
i2u686_40:
	line	120
	
i2l6255:
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	line	121
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	124
	
i2l6257:; BSR set to: 1

	movf	((c:_menu_timeout_reload))^00h,c,w	;volatile
iorwf	((c:_menu_timeout_reload+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u687_41
	goto	i2u687_40

i2u687_41:
	goto	i2l318
i2u687_40:
	line	126
	
i2l6259:; BSR set to: 1

	movff	(c:_menu_timeout_reload),(c:_menu_timeout_timer)	;volatile
	movff	(c:_menu_timeout_reload+1),(c:_menu_timeout_timer+1)	;volatile
	line	127
	
i2l6261:; BSR set to: 1

	movlw	low(01h)
	movwf	((_menu_timeout_flag))&0ffh	;volatile
	goto	i2l321
	line	133
	
i2l6263:
		movlw	8
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	movlw	7
	subwfb	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u688_41
	goto	i2u688_40

i2u688_41:
	goto	i2l6267
i2u688_40:
	line	135
	
i2l6265:
	movlw	low(02h)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	136
	goto	i2l315
	line	137
	
i2l6267:
		movf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	bnz	i2u689_40
	movlw	50
	subwf	 ((c:_button_hold_ms))^00h,c,w	;volatile
	btfss	status,0
	goto	i2u689_41
	goto	i2u689_40

i2u689_41:
	goto	i2l6271
i2u689_40:
	line	139
	
i2l6269:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	140
	goto	i2l315
	line	143
	
i2l6271:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((_button_event))&0ffh	;volatile
	line	144
	
i2l315:; BSR set to: 1

	line	146
	movlw	low(01h)
	movwf	((c:_button_pressed))^00h,c	;volatile
	line	147
	movlw	high(0)
	movwf	((c:_button_hold_ms+1))^00h,c	;volatile
	movlw	low(0)
	movwf	((c:_button_hold_ms))^00h,c	;volatile
	goto	i2l321
	line	153
	
i2l6273:
	movlw	low(0)
	movwf	((c:_btn_debounce))^00h,c
	line	155
	movf	((c:isr@btn))^00h,c,w
	btfss	status,2
	goto	i2u690_41
	goto	i2u690_40
i2u690_41:
	goto	i2l321
i2u690_40:
	
i2l6275:
		incf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u691_40
	incf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfsc	status,2
	goto	i2u691_41
	goto	i2u691_40

i2u691_41:
	goto	i2l321
i2u691_40:
	line	157
	
i2l6277:
	infsnz	((c:_button_hold_ms))^00h,c	;volatile
	incf	((c:_button_hold_ms+1))^00h,c	;volatile
	line	160
	
i2l6279:
		movlw	8
	xorwf	((c:_button_hold_ms))^00h,c,w	;volatile
	bnz	i2u692_41
	movlw	7
	xorwf	((c:_button_hold_ms+1))^00h,c,w	;volatile
	btfss	status,2
	goto	i2u692_41
	goto	i2u692_40

i2u692_41:
	goto	i2l318
i2u692_40:
	line	162
	
i2l6281:
	movlw	low(01h)
	movlb	1	; () banked
	movwf	((_long_press_beep_flag))&0ffh	;volatile
	goto	i2l321
	line	165
	
i2l318:
	line	167
	
i2l321:
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
psect	text59,class=CODE,space=0,reloc=2,group=0
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
global __ptext59
__ptext59:
psect	text59
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\lwmod.c"
	line	7
	
i2___lwmod:
;incstack = 0
	callstack 23
	line	12
	
i2l5893:
	movf	((c:i2___lwmod@divisor))^00h,c,w
iorwf	((c:i2___lwmod@divisor+1))^00h,c,w
	btfsc	status,2
	goto	i2u629_41
	goto	i2u629_40

i2u629_41:
	goto	i2l1542
i2u629_40:
	line	13
	
i2l5895:
	movlw	low(01h)
	movwf	((c:i2___lwmod@counter))^00h,c
	line	14
	goto	i2l5899
	line	15
	
i2l5897:
	bcf	status,0
	rlcf	((c:i2___lwmod@divisor))^00h,c
	rlcf	((c:i2___lwmod@divisor+1))^00h,c
	line	16
	incf	((c:i2___lwmod@counter))^00h,c
	line	14
	
i2l5899:
	
	btfss	((c:i2___lwmod@divisor+1))^00h,c,(15)&7
	goto	i2u630_41
	goto	i2u630_40
i2u630_41:
	goto	i2l5897
i2u630_40:
	line	19
	
i2l5901:
		movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c,w
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c,w
	btfss	status,0
	goto	i2u631_41
	goto	i2u631_40

i2u631_41:
	goto	i2l5905
i2u631_40:
	line	20
	
i2l5903:
	movf	((c:i2___lwmod@divisor))^00h,c,w
	subwf	((c:i2___lwmod@dividend))^00h,c
	movf	((c:i2___lwmod@divisor+1))^00h,c,w
	subwfb	((c:i2___lwmod@dividend+1))^00h,c

	line	21
	
i2l5905:
	bcf	status,0
	rrcf	((c:i2___lwmod@divisor+1))^00h,c
	rrcf	((c:i2___lwmod@divisor))^00h,c
	line	22
	
i2l5907:
	decfsz	((c:i2___lwmod@counter))^00h,c
	
	goto	i2l5901
	line	23
	
i2l1542:
	line	24
	movff	(c:i2___lwmod@dividend),(c:?i2___lwmod)
	movff	(c:i2___lwmod@dividend+1),(c:?i2___lwmod+1)
	line	25
	
i2l1549:
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
