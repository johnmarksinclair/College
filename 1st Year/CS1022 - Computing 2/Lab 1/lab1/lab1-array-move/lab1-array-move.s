;
; CS1022 Introduction to Computing II 2018/2019
; Lab 1 - Array Move
;

N	EQU	16		; number of elements

	AREA	globals, DATA, READWRITE

; N word-size values

ARRAY	SPACE	N*4		; N words


	AREA	RESET, CODE, READONLY
	ENTRY

	; for convenience, let's initialise test array [0, 1, 2, ... , N-1]

	LDR	R0, =ARRAY
	LDR	R1, =0
L1	CMP	R1, #N
	BHS	L2
	STR	R1, [R0, R1, LSL #2]
	ADD	R1, R1, #1
	B	L1
L2

	; initialise registers for your program

	LDR	R0, =ARRAY
	LDR	R1, =6
	LDR	R2, =3
	LDR	R3, =N

	; your program goes here
	
	ADD R7, R0, R1	;R7 = POINTS AT 6TH SLOT
	ADD	R8, R0, R2	;R8 = POINTS AT 3RD SLOIT
	MOV	R6, R7		;R6 = DESTINATION
	LDR	R4, [R7]	;R4 = TEMP, R4 = 6TH NUMBER
	SUB R7, R7, #1 	;R7 = 5TH SLOT
L4	CMP	R7, R8
	BEQ	L3
	LDR	R5, [R7]	;R5 = N-1 SLOT
	STR	R5, [R6]	;STORE R5 IN N-TH SLOT
	SUB	R6, R6, #1	;DESTINATION - 1
	SUB	R7, R7, #1	;INITIAL LOCATION - 1
	B	L4
L3	STR	R4, [R7]	;STORE ORIGINAL IN NEW POS

STOP	B	STOP

	END
