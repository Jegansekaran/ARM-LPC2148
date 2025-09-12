opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_lcd_command
	FNCALL	_main,_lcd_string
	FNCALL	_lcd_string,_lcd_data
	FNROOT	_main
	global	_PORTB
psect	text78,local,class=CODE,delta=2
global __ptext78
__ptext78:
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_RD2
_RD2	set	66
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_2:	
	retlw	87	;'W'
	retlw	79	;'O'
	retlw	82	;'R'
	retlw	76	;'L'
	retlw	68	;'D'
	retlw	0
psect	strings
	
STR_1:	
	retlw	72	;'H'
	retlw	69	;'E'
	retlw	76	;'L'
	retlw	76	;'L'
	retlw	79	;'O'
	retlw	0
psect	strings
	file	"4_bit.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x0
	global	?_lcd_string
?_lcd_string:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	2
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x2
	global	lcd_command@cmd
lcd_command@cmd:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_string
??_lcd_string:	; 0 bytes @ 0x3
	ds	1
	global	lcd_string@str
lcd_string@str:	; 1 bytes @ 0x4
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x5
	ds	3
;;Data sizes: Strings 12, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8       8
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_string@str	PTR unsigned char  size(1) Largest target is 6
;;		 -> STR_2(CODE[6]), STR_1(CODE[6]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_string
;;   _lcd_string->_lcd_data
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0      90
;;                                              5 COMMON     3     3      0
;;                        _lcd_command
;;                         _lcd_string
;; ---------------------------------------------------------------------------------
;; (1) _lcd_string                                           2     2      0      60
;;                                              3 COMMON     2     2      0
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_command                                          3     3      0      30
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _lcd_data                                             3     3      0      30
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_command
;;   _lcd_string
;;     _lcd_data
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      8       8       1       57.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 51 in file "C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\4 BIT\4_bit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_command
;;		_lcd_string
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\4 BIT\4_bit.c"
	line	51
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	52
	
l1897:	
;4_bit.c: 52: TRISB = 0xF0;
	movlw	(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	53
	
l1899:	
;4_bit.c: 53: PORTB = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	54
	
l1901:	
;4_bit.c: 54: TRISD = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	55
	
l1903:	
;4_bit.c: 55: PORTD = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	57
	
l1905:	
;4_bit.c: 57: _delay((unsigned long)((20)*(2000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_main+0)+0+1),f
	movlw	251
movwf	((??_main+0)+0),f
u2177:
	decfsz	((??_main+0)+0),f
	goto	u2177
	decfsz	((??_main+0)+0+1),f
	goto	u2177
	nop2
opt asmopt_on

	line	59
	
l1907:	
;4_bit.c: 59: lcd_command(0x02);
	movlw	(02h)
	fcall	_lcd_command
	line	60
	
l1909:	
;4_bit.c: 60: _delay((unsigned long)((5)*(2000000/4000.0)));
	opt asmopt_off
movlw	4
movwf	((??_main+0)+0+1),f
	movlw	61
movwf	((??_main+0)+0),f
u2187:
	decfsz	((??_main+0)+0),f
	goto	u2187
	decfsz	((??_main+0)+0+1),f
	goto	u2187
	nop2
opt asmopt_on

	line	61
	
l1911:	
;4_bit.c: 61: lcd_command(40);
	movlw	(028h)
	fcall	_lcd_command
	line	62
	
l1913:	
;4_bit.c: 62: _delay((unsigned long)((5)*(2000000/4000.0)));
	opt asmopt_off
movlw	4
movwf	((??_main+0)+0+1),f
	movlw	61
movwf	((??_main+0)+0),f
u2197:
	decfsz	((??_main+0)+0),f
	goto	u2197
	decfsz	((??_main+0)+0+1),f
	goto	u2197
	nop2
opt asmopt_on

	line	63
	
l1915:	
;4_bit.c: 63: lcd_command(0x0C);
	movlw	(0Ch)
	fcall	_lcd_command
	line	64
	
l1917:	
;4_bit.c: 64: _delay((unsigned long)((5)*(2000000/4000.0)));
	opt asmopt_off
movlw	4
movwf	((??_main+0)+0+1),f
	movlw	61
movwf	((??_main+0)+0),f
u2207:
	decfsz	((??_main+0)+0),f
	goto	u2207
	decfsz	((??_main+0)+0+1),f
	goto	u2207
	nop2
opt asmopt_on

	line	65
	
l1919:	
;4_bit.c: 65: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	66
	
l1921:	
;4_bit.c: 66: _delay((unsigned long)((5)*(2000000/4000.0)));
	opt asmopt_off
movlw	4
movwf	((??_main+0)+0+1),f
	movlw	61
movwf	((??_main+0)+0),f
u2217:
	decfsz	((??_main+0)+0),f
	goto	u2217
	decfsz	((??_main+0)+0+1),f
	goto	u2217
	nop2
opt asmopt_on

	goto	l1923
	line	68
;4_bit.c: 68: while (1) {
	
l699:	
	line	69
	
l1923:	
;4_bit.c: 69: lcd_string("HELLO");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_string
	line	70
	
l1925:	
;4_bit.c: 70: _delay((unsigned long)((500)*(2000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	68
movwf	((??_main+0)+0+1),f
	movlw	169
movwf	((??_main+0)+0),f
u2227:
	decfsz	((??_main+0)+0),f
	goto	u2227
	decfsz	((??_main+0)+0+1),f
	goto	u2227
	decfsz	((??_main+0)+0+2),f
	goto	u2227
	clrwdt
opt asmopt_on

	line	72
	
l1927:	
;4_bit.c: 72: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	73
	
l1929:	
;4_bit.c: 73: _delay((unsigned long)((500)*(2000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	68
movwf	((??_main+0)+0+1),f
	movlw	169
movwf	((??_main+0)+0),f
u2237:
	decfsz	((??_main+0)+0),f
	goto	u2237
	decfsz	((??_main+0)+0+1),f
	goto	u2237
	decfsz	((??_main+0)+0+2),f
	goto	u2237
	clrwdt
opt asmopt_on

	line	75
	
l1931:	
;4_bit.c: 75: lcd_string("WORLD");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_lcd_string
	line	76
	
l1933:	
;4_bit.c: 76: _delay((unsigned long)((500)*(2000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	68
movwf	((??_main+0)+0+1),f
	movlw	169
movwf	((??_main+0)+0),f
u2247:
	decfsz	((??_main+0)+0),f
	goto	u2247
	decfsz	((??_main+0)+0+1),f
	goto	u2247
	decfsz	((??_main+0)+0+2),f
	goto	u2247
	clrwdt
opt asmopt_on

	line	78
	
l1935:	
;4_bit.c: 78: lcd_command(1);
	movlw	(01h)
	fcall	_lcd_command
	line	79
	
l1937:	
;4_bit.c: 79: _delay((unsigned long)((500)*(2000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	68
movwf	((??_main+0)+0+1),f
	movlw	169
movwf	((??_main+0)+0),f
u2257:
	decfsz	((??_main+0)+0),f
	goto	u2257
	decfsz	((??_main+0)+0+1),f
	goto	u2257
	decfsz	((??_main+0)+0+2),f
	goto	u2257
	clrwdt
opt asmopt_on

	goto	l1923
	line	80
	
l700:	
	line	68
	goto	l1923
	
l701:	
	line	81
	
l702:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_string
psect	text79,local,class=CODE,delta=2
global __ptext79
__ptext79:

;; *************** function _lcd_string *****************
;; Defined at:
;;		line 44 in file "C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\4 BIT\4_bit.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR unsigned char 
;;		 -> STR_2(6), STR_1(6), 
;; Auto vars:     Size  Location     Type
;;  str             1    4[COMMON] PTR unsigned char 
;;		 -> STR_2(6), STR_1(6), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text79
	file	"C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\4 BIT\4_bit.c"
	line	44
	global	__size_of_lcd_string
	__size_of_lcd_string	equ	__end_of_lcd_string-_lcd_string
	
_lcd_string:	
	opt	stack 6
; Regs used in _lcd_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_string@str stored from wreg
	movwf	(lcd_string@str)
	line	45
	
l1889:	
;4_bit.c: 45: while (*str != '\0') {
	goto	l1895
	
l694:	
	line	46
	
l1891:	
;4_bit.c: 46: lcd_data(*str);
	movf	(lcd_string@str),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	47
	
l1893:	
;4_bit.c: 47: str++;
	movlw	(01h)
	movwf	(??_lcd_string+0)+0
	movf	(??_lcd_string+0)+0,w
	addwf	(lcd_string@str),f
	goto	l1895
	line	48
	
l693:	
	line	45
	
l1895:	
	movf	(lcd_string@str),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2161
	goto	u2160
u2161:
	goto	l1891
u2160:
	goto	l696
	
l695:	
	line	49
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_string
	__end_of_lcd_string:
;; =============== function _lcd_string ends ============

	signat	_lcd_string,4216
	global	_lcd_command
psect	text80,local,class=CODE,delta=2
global __ptext80
__ptext80:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 26 in file "C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\4 BIT\4_bit.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text80
	file	"C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\4 BIT\4_bit.c"
	line	26
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 7
; Regs used in _lcd_command: [wreg+status,2+status,0]
;lcd_command@cmd stored from wreg
	line	28
	movwf	(lcd_command@cmd)
	
l1865:	
;4_bit.c: 28: PORTB = (cmd >> 4) & 0x0F;
	movf	(lcd_command@cmd),w
	movwf	(??_lcd_command+0)+0
	movlw	04h
u2155:
	clrc
	rrf	(??_lcd_command+0)+0,f
	addlw	-1
	skipz
	goto	u2155
	movf	0+(??_lcd_command+0)+0,w
	andlw	0Fh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	29
	
l1867:	
;4_bit.c: 29: RD0 = 0;
	bcf	(64/8),(64)&7
	line	30
	
l1869:	
;4_bit.c: 30: RD1 = 0;
	bcf	(65/8),(65)&7
	line	31
	
l1871:	
;4_bit.c: 31: RD2 = 1;
	bsf	(66/8),(66)&7
	line	32
	
l1873:	
;4_bit.c: 32: _delay((unsigned long)((5)*(2000000/4000.0)));
	opt asmopt_off
movlw	4
movwf	((??_lcd_command+0)+0+1),f
	movlw	61
movwf	((??_lcd_command+0)+0),f
u2267:
	decfsz	((??_lcd_command+0)+0),f
	goto	u2267
	decfsz	((??_lcd_command+0)+0+1),f
	goto	u2267
	nop2
opt asmopt_on

	line	33
	
l1875:	
;4_bit.c: 33: RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	36
	
l1877:	
;4_bit.c: 36: PORTB = cmd & 0x0F;
	movf	(lcd_command@cmd),w
	andlw	0Fh
	movwf	(6)	;volatile
	line	37
	
l1879:	
;4_bit.c: 37: RD0 = 0;
	bcf	(64/8),(64)&7
	line	38
	
l1881:	
;4_bit.c: 38: RD1 = 0;
	bcf	(65/8),(65)&7
	line	39
	
l1883:	
;4_bit.c: 39: RD2 = 1;
	bsf	(66/8),(66)&7
	line	40
	
l1885:	
;4_bit.c: 40: _delay((unsigned long)((5)*(2000000/4000.0)));
	opt asmopt_off
movlw	4
movwf	((??_lcd_command+0)+0+1),f
	movlw	61
movwf	((??_lcd_command+0)+0),f
u2277:
	decfsz	((??_lcd_command+0)+0),f
	goto	u2277
	decfsz	((??_lcd_command+0)+0+1),f
	goto	u2277
	nop2
opt asmopt_on

	line	41
	
l1887:	
;4_bit.c: 41: RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	42
	
l690:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_lcd_data
psect	text81,local,class=CODE,delta=2
global __ptext81
__ptext81:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 8 in file "C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\4 BIT\4_bit.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_string
;; This function uses a non-reentrant model
;;
psect	text81
	file	"C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\4 BIT\4_bit.c"
	line	8
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 6
; Regs used in _lcd_data: [wreg+status,2+status,0]
;lcd_data@data stored from wreg
	line	10
	movwf	(lcd_data@data)
	
l1841:	
;4_bit.c: 10: PORTB = (data >> 4) & 0x0F;
	movf	(lcd_data@data),w
	movwf	(??_lcd_data+0)+0
	movlw	04h
u2145:
	clrc
	rrf	(??_lcd_data+0)+0,f
	addlw	-1
	skipz
	goto	u2145
	movf	0+(??_lcd_data+0)+0,w
	andlw	0Fh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	11
	
l1843:	
;4_bit.c: 11: RD0 = 1;
	bsf	(64/8),(64)&7
	line	12
	
l1845:	
;4_bit.c: 12: RD1 = 0;
	bcf	(65/8),(65)&7
	line	13
	
l1847:	
;4_bit.c: 13: RD2 = 1;
	bsf	(66/8),(66)&7
	line	14
	
l1849:	
;4_bit.c: 14: _delay((unsigned long)((5)*(2000000/4000.0)));
	opt asmopt_off
movlw	4
movwf	((??_lcd_data+0)+0+1),f
	movlw	61
movwf	((??_lcd_data+0)+0),f
u2287:
	decfsz	((??_lcd_data+0)+0),f
	goto	u2287
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u2287
	nop2
opt asmopt_on

	line	15
	
l1851:	
;4_bit.c: 15: RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	18
	
l1853:	
;4_bit.c: 18: PORTB = data & 0x0F;
	movf	(lcd_data@data),w
	andlw	0Fh
	movwf	(6)	;volatile
	line	19
	
l1855:	
;4_bit.c: 19: RD0 = 1;
	bsf	(64/8),(64)&7
	line	20
	
l1857:	
;4_bit.c: 20: RD1 = 0;
	bcf	(65/8),(65)&7
	line	21
	
l1859:	
;4_bit.c: 21: RD2 = 1;
	bsf	(66/8),(66)&7
	line	22
	
l1861:	
;4_bit.c: 22: _delay((unsigned long)((5)*(2000000/4000.0)));
	opt asmopt_off
movlw	4
movwf	((??_lcd_data+0)+0+1),f
	movlw	61
movwf	((??_lcd_data+0)+0),f
u2297:
	decfsz	((??_lcd_data+0)+0),f
	goto	u2297
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u2297
	nop2
opt asmopt_on

	line	23
	
l1863:	
;4_bit.c: 23: RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	24
	
l687:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
psect	text82,local,class=CODE,delta=2
global __ptext82
__ptext82:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
