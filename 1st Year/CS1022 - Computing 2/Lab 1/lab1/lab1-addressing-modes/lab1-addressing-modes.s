;
; CS1022 Introduction to Computing II 2018/2019
; Lab 1 - Addressing Modes
;

N	EQU	10

	AREA	globals, DATA, READWRITE

; N word-size values

ARRAY	SPACE	N*4		; N words (4 bytes each)


	AREA	RESET, CODE, READONLY
	ENTRY

	; for convenience, let's initialise test array [0, 1, 2, ... , N-1]


	LDR	R0, =ARRAY
	LDR	R1, =0
L1	CMP	R1, #N
	BHS	L2
	STR	R1, [R0, R1, LSL #2]
	ADD R1, R1, #1
	B	L1
L2

	; initialise registers for your program

	LDR	R0, =ARRAY	; array start address
	LDR	R1, =10		; size of array (half-words)

	; your program goes here
	
	;Q1 (i)
	
;	MOV	R3, #0
;FOR	CMP	R3, #N
;	BHS	STOP
;	LDR	R5, [R0]
;	MUL	R6, R5, R5
;	STR	R6, [R0]
;	ADD	R0, R0, #4
;	ADD	R3, R3, #1
;	B	FOR

	;Q1 (ii)
	
;	MOV	R3, #0
;	MOV	R4, #0
;FOR	CMP	R3, #N
;	BEQ	STOP
;	LDR	R5, [R0, R4]
;	MUL	R6, R5, R5
;	STR	R6, [R0, R4]
;	ADD R4, R4, #4
;	ADD	R3, R3, #1
;	B	FOR

	;Q1 (iii)
		
;	MOV	R3, #0
;FOR	CMP	R3, #N
;	BEQ	STOP
;	LDR	R5, [R0, R3, LSL #2]
;	MUL	R6, R5, R5
;	STR	R6, [R0, R3, LSL #2]
;	ADD	R3, R3, #1
;	B	FOR

	;Q1 (iv)
	
	MOV	R3, #0
FOR	CMP	R3, #N
	BEQ	STOP
	LDR	R5, [R0], #2
	MUL	R6, R5, R5
	STR	R6, [R0], #2
	ADD R3, R3, #1
	B	FOR
	
STOP	B	STOP

	END
