;
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Recursion
;

N	EQU	10

	AREA	globals, DATA, READWRITE

; N word-size values

SORTED	SPACE	N*4		; N words (4 bytes each)


	AREA	RESET, CODE, READONLY
	ENTRY

	;
	; copy the test data into RAM
	;

	LDR	R4, =SORTED
	LDR	R5, =UNSORT
	LDR	R6, =0
whInit	CMP	R6, #N
	BHS	eWhInit
	LDR	R7, [R5, R6, LSL #2]
	STR	R7, [R4, R6, LSL #2]
	ADD	R6, R6, #1
	B	whInit
eWhInit


	;
	; call your sort subroutine to test it
	;

STOP	B	STOP


	;
	; your swap subroutine goes here
	;


	;
	; your sort subroutine goes here
	;


UNSORT	DCD	9,3,0,1,6,2,4,7,8,5

	END
