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
	global	_PORTC
_PORTC	set	7
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
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
	file	"8_BIT.as"
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
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x0
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_command
?_lcd_command:	; 2 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 2 bytes @ 0x0
	global	?_lcd_string
?_lcd_string:	; 2 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	1
	global	lcd_command@cmd
lcd_command@cmd:	; 1 bytes @ 0x1
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x1
	ds	1
	global	??_lcd_string
??_lcd_string:	; 0 bytes @ 0x2
	ds	1
	global	lcd_string@str
lcd_string@str:	; 1 bytes @ 0x3
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x4
	ds	3
;;Data sizes: Strings 12, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7       7
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
;; (0) _main                                                 3     3      0      60
;;                                              4 COMMON     3     3      0
;;                        _lcd_command
;;                         _lcd_string
;; ---------------------------------------------------------------------------------
;; (1) _lcd_string                                           2     2      0      45
;;                                              2 COMMON     2     2      0
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (2) _lcd_data                                             2     2      0      15
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _lcd_command                                          2     2      0      15
;;                                              0 COMMON     2     2      0
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
;;COMMON               E      7       7       1       50.0%
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
;;		line 51 in file "C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\8 BIT\8_BIT.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  698[COMMON] int 
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
	file	"C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\8 BIT\8_BIT.c"
	line	51
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	52
	
l1877:	
;8_BIT.c: 52: TRISB = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	53
;8_BIT.c: 53: TRISC = 0x00;
	clrf	(135)^080h	;volatile
	line	54
;8_BIT.c: 54: PORTB = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	55
;8_BIT.c: 55: PORTC = 0x00;
	clrf	(7)	;volatile
	line	58
	
l1879:	
;8_BIT.c: 58: lcd_command(0x38);
	movlw	(038h)
	fcall	_lcd_command
	line	59
	
l1881:	
;8_BIT.c: 59: _delay((unsigned long)((5)*(2000000/4000.0)));
	opt asmopt_off
movlw	4
movwf	((??_main+0)+0+1),f
	movlw	61
movwf	((??_main+0)+0),f
u2157:
	decfsz	((??_main+0)+0),f
	goto	u2157
	decfsz	((??_main+0)+0+1),f
	goto	u2157
	nop2
opt asmopt_on

	line	61
	
l1883:	
;8_BIT.c: 61: lcd_command(0x0C);
	movlw	(0Ch)
	fcall	_lcd_command
	line	62
	
l1885:	
;8_BIT.c: 62: _delay((unsigned long)((5)*(2000000/4000.0)));
	opt asmopt_off
movlw	4
movwf	((??_main+0)+0+1),f
	movlw	61
movwf	((??_main+0)+0),f
u2167:
	decfsz	((??_main+0)+0),f
	goto	u2167
	decfsz	((??_main+0)+0+1),f
	goto	u2167
	nop2
opt asmopt_on

	line	64
	
l1887:	
;8_BIT.c: 64: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	65
	
l1889:	
;8_BIT.c: 65: _delay((unsigned long)((5)*(2000000/4000.0)));
	opt asmopt_off
movlw	4
movwf	((??_main+0)+0+1),f
	movlw	61
movwf	((??_main+0)+0),f
u2177:
	decfsz	((??_main+0)+0),f
	goto	u2177
	decfsz	((??_main+0)+0+1),f
	goto	u2177
	nop2
opt asmopt_on

	line	67
	
l1891:	
;8_BIT.c: 67: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	68
	
l1893:	
;8_BIT.c: 68: _delay((unsigned long)((5)*(2000000/4000.0)));
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

	line	70
	
l1895:	
;8_BIT.c: 70: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	71
	
l1897:	
;8_BIT.c: 71: _delay((unsigned long)((5)*(2000000/4000.0)));
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

	goto	l1899
	line	73
;8_BIT.c: 73: while (1) {
	
l699:	
	line	75
	
l1899:	
;8_BIT.c: 75: lcd_string("HELLO");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_string
	line	76
	
l1901:	
;8_BIT.c: 76: _delay((unsigned long)((500)*(2000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	68
movwf	((??_main+0)+0+1),f
	movlw	169
movwf	((??_main+0)+0),f
u2207:
	decfsz	((??_main+0)+0),f
	goto	u2207
	decfsz	((??_main+0)+0+1),f
	goto	u2207
	decfsz	((??_main+0)+0+2),f
	goto	u2207
	clrwdt
opt asmopt_on

	line	78
	
l1903:	
;8_BIT.c: 78: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	79
	
l1905:	
;8_BIT.c: 79: _delay((unsigned long)((500)*(2000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	68
movwf	((??_main+0)+0+1),f
	movlw	169
movwf	((??_main+0)+0),f
u2217:
	decfsz	((??_main+0)+0),f
	goto	u2217
	decfsz	((??_main+0)+0+1),f
	goto	u2217
	decfsz	((??_main+0)+0+2),f
	goto	u2217
	clrwdt
opt asmopt_on

	line	82
	
l1907:	
;8_BIT.c: 82: lcd_string("WORLD");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_lcd_string
	line	83
	
l1909:	
;8_BIT.c: 83: _delay((unsigned long)((500)*(2000000/4000.0)));
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

	line	85
	
l1911:	
;8_BIT.c: 85: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	86
	
l1913:	
;8_BIT.c: 86: _delay((unsigned long)((500)*(2000000/4000.0)));
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

	goto	l1899
	line	87
	
l700:	
	line	73
	goto	l1899
	
l701:	
	line	89
;8_BIT.c: 87: }
;8_BIT.c: 88: return 0;
;	Return value of _main is never used
	
l702:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_lcd_string
psect	text79,local,class=CODE,delta=2
global __ptext79
__ptext79:

;; *************** function _lcd_string *****************
;; Defined at:
;;		line 41 in file "C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\8 BIT\8_BIT.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR unsigned char 
;;		 -> STR_2(6), STR_1(6), 
;; Auto vars:     Size  Location     Type
;;  str             1    3[COMMON] PTR unsigned char 
;;		 -> STR_2(6), STR_1(6), 
;; Return value:  Size  Location     Type
;;                  2  692[COMMON] int 
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
	file	"C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\8 BIT\8_BIT.c"
	line	41
	global	__size_of_lcd_string
	__size_of_lcd_string	equ	__end_of_lcd_string-_lcd_string
	
_lcd_string:	
	opt	stack 6
; Regs used in _lcd_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_string@str stored from wreg
	movwf	(lcd_string@str)
	line	42
	
l1869:	
;8_BIT.c: 42: while (*str != '\0') {
	goto	l1875
	
l694:	
	line	43
	
l1871:	
;8_BIT.c: 43: lcd_data(*str);
	movf	(lcd_string@str),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	44
	
l1873:	
;8_BIT.c: 44: str++;
	movlw	(01h)
	movwf	(??_lcd_string+0)+0
	movf	(??_lcd_string+0)+0,w
	addwf	(lcd_string@str),f
	goto	l1875
	line	45
	
l693:	
	line	42
	
l1875:	
	movf	(lcd_string@str),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2141
	goto	u2140
u2141:
	goto	l1871
u2140:
	goto	l696
	
l695:	
	line	48
;8_BIT.c: 45: }
;8_BIT.c: 47: return 0;
;	Return value of _lcd_string is never used
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_string
	__end_of_lcd_string:
;; =============== function _lcd_string ends ============

	signat	_lcd_string,4218
	global	_lcd_data
psect	text80,local,class=CODE,delta=2
global __ptext80
__ptext80:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 27 in file "C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\8 BIT\8_BIT.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  689[COMMON] int 
;; Registers used:
;;		wreg
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_string
;; This function uses a non-reentrant model
;;
psect	text80
	file	"C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\8 BIT\8_BIT.c"
	line	27
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 6
; Regs used in _lcd_data: [wreg]
;lcd_data@data stored from wreg
	movwf	(lcd_data@data)
	line	28
	
l1855:	
;8_BIT.c: 28: PORTC = data;
	movf	(lcd_data@data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	29
	
l1857:	
;8_BIT.c: 29: RB0 = 1;
	bsf	(48/8),(48)&7
	line	30
	
l1859:	
;8_BIT.c: 30: RB1 = 0;
	bcf	(49/8),(49)&7
	line	31
	
l1861:	
;8_BIT.c: 31: RB2 = 1;
	bsf	(50/8),(50)&7
	line	32
	
l1863:	
;8_BIT.c: 32: _delay((unsigned long)((1)*(2000000/4000000.0)));
	
	line	33
	
l1865:	
;8_BIT.c: 33: RB2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	34
;8_BIT.c: 34: _delay((unsigned long)((2)*(2000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_lcd_data+0)+0,f
u2247:
	clrwdt
decfsz	(??_lcd_data+0)+0,f
	goto	u2247
	nop2	;nop
	clrwdt
opt asmopt_on

	goto	l690
	line	36
	
l1867:	
	line	37
;8_BIT.c: 36: return 0;
;	Return value of _lcd_data is never used
	
l690:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4218
	global	_lcd_command
psect	text81,local,class=CODE,delta=2
global __ptext81
__ptext81:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 13 in file "C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\8 BIT\8_BIT.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  686[COMMON] int 
;; Registers used:
;;		wreg
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text81
	file	"C:\Users\gvjeg\Desktop\embedded c\PIC\LCD\8 BIT\8_BIT.c"
	line	13
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 7
; Regs used in _lcd_command: [wreg]
;lcd_command@cmd stored from wreg
	movwf	(lcd_command@cmd)
	line	14
	
l1841:	
;8_BIT.c: 14: PORTC = cmd;
	movf	(lcd_command@cmd),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	15
	
l1843:	
;8_BIT.c: 15: RB0 = 0;
	bcf	(48/8),(48)&7
	line	16
	
l1845:	
;8_BIT.c: 16: RB1 = 0;
	bcf	(49/8),(49)&7
	line	17
	
l1847:	
;8_BIT.c: 17: RB2 = 1;
	bsf	(50/8),(50)&7
	line	18
	
l1849:	
;8_BIT.c: 18: _delay((unsigned long)((1)*(2000000/4000000.0)));
	
	line	19
	
l1851:	
;8_BIT.c: 19: RB2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	20
;8_BIT.c: 20: _delay((unsigned long)((2)*(2000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_lcd_command+0)+0,f
u2257:
	clrwdt
decfsz	(??_lcd_command+0)+0,f
	goto	u2257
	nop2	;nop
	clrwdt
opt asmopt_on

	goto	l687
	line	22
	
l1853:	
	line	23
;8_BIT.c: 22: return 0;
;	Return value of _lcd_command is never used
	
l687:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4218
psect	text82,local,class=CODE,delta=2
global __ptext82
__ptext82:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
