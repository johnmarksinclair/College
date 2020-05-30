;
; CS1022 Introduction to Computing II 2018/2019
; Lab 1 - Matrix Multiplication
;

N	EQU	4

	AREA	globals, DATA, READWRITE

; result matrix R

ARR_R	SPACE	N*N*4		; 4 * 4 * word-size values


	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =ARR_A
	LDR	R1, =ARR_B
	LDR	R2, =ARR_R
	LDR	R3, =N

	; your program goes here

STOP	B	STOP

; two constant value matrices, A and B

ARR_A	DCD	 1,  2,  3,  4
	DCD	 5,  6,  7,  8
	DCD	 9, 10, 11, 12
	DCD	13, 14, 15, 16

ARR_B	DCD	 1,  2,  3,  4
	DCD	 5,  6,  7,  8
	DCD	 9, 10, 11, 12
	DCD	13, 14, 15, 16

	END
