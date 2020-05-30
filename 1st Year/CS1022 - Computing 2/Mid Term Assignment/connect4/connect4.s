;
; CS1022 Introduction to Computing II 2018/2019
; Mid-Term Assignment - Connect 4 - SOLUTION
;
; get, put and puts subroutines provided by jones@scss.tcd.ie
;

PINSEL0	EQU	0xE002C000
U0RBR	EQU	0xE000C000
U0THR	EQU	0xE000C000
U0LCR	EQU	0xE000C00C
U0LSR	EQU	0xE000C014


	AREA	globals, DATA, READWRITE
BOARD	DCB	0,0,0,0,0,0,0
		DCB	0,0,0,0,0,0,0
		DCB	0,0,0,0,0,0,0
		DCB	0,0,0,0,0,0,0
		DCB	0,0,0,0,0,0,0
		DCB	0,0,0,0,0,0,0


	AREA	RESET, CODE, READONLY
	ENTRY

	; initialise SP to top of RAM
	LDR	R13, =0x40010000	; initialse SP

	; initialise the console
	BL		inithw
	
	;
	; your program goes here
	;
			
			MOV		r4, #1				;set turn counter to 1 (reds turn)
			LDR		r0, =str_go			;string s = str_go
			BL		puts				;print string s
			B		move
reset		LDR		r0, =BOARD			;R0=address
			BL		resetBoard			;initialise board
			LDR		r0, =str_restartLn	;string x = str_restartLn
			BL		puts				;print string x
			LDR		r0, =str_nextln		;string x = str_nextln
			BL		puts				;print string x
			MOV		r4, #1				;r4 = 1 (so it'll be reds turn next)
move		LDR		r1, =BOARD			;r1 = array address
			BL 		printBoard			;go to printBoard
			LDR		r1, =BOARD			;r1 = array address (r1 is changed during the board printing process)
			CMP		r4, #0				;is r4 = 0?
			BEQ		yTurn				;if yes its yellows turn... go to yTurn
			LDR		r2, =0x22			;else its reds turn... r2 = player colour (red)
			MOV		r4, #0				;r4 = 0 (so it'll be yellows turn next)
			B		turn				;go to turn
yTurn		LDR		r2, =0x29			;r2 = player colour (yellow)
			MOV		r4, #1				;r4 = 1 (so it'll be reds turn next)
turn		BL		playerChoice		;go to playerChoice
			CMP		R0, #0x72			;is playerChoice = r?
			BEQ		reset				;if yes go to init
			LDR		r1, =BOARD			;r1 = array address
			MOV		r2, r0				;r2 = col played
			B		move				;else next move

stop	B	stop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; your subroutines go here
;

;
; printBoard subroutine
; 	
; parameters:
;	r1: board address
; return value:
;	none
;
printBoard	
			PUSH 	{r4-r10, LR}
			LDR		r0, [r1]			;r1 = r0 (board address)
			LDR		r4, =0				;r4 = row index
			LDR 	r5, =0				;r5 = column index
			MOV		r10, r1				;r10 = board address
			CMP		r4, #0				;is row == 0?
			BNE		nextRow				;if not, go to nextRow
printMarker	CMP		r5, #8				;is column index < 8?
			BGE		nextRow				;if column index >= 8, go to nextRow... finished with row
			CMP		r5, #0				;if this the first column?
			BNE		notBlank			;if not the first column go to notBlank
			MOV		r0, #0x20			;r0 = space
			BL 		put					;print out r0
			B		blank				;go to blank
notBlank	MOV		r0, r5				;r0 = column index
			ADD		r0, r0, #0x30		;convert for ascii
			BL		put					;print r0
blank		MOV		r0, #0x20			;r0 = 0x20 (space)
			BL 		put					;print r0
			ADD		r5, r5, #1			;column index++
			B		printMarker			;go to printMarker (print out markers 1-7 on board edge for user)
nextRow		LDR 	r0, =str_nextln		;string x = str_nextln
			BL		puts				;priint string x
			MOV		r5, #0				;r5 = column = 0
			ADD		r4, r4, #1			;r4 = row++
			CMP		r4, #7				;is r4 (row index) >= 7? 
			BGE		done				;if yes the finished and go to done
printColumn	CMP		r5, #8				;else, is r5 (column index) >= 8?
			BGE 	nextRow				;if yes, move on to the next row
			CMP		r5, #0				;is column index = 0?
			BNE		notMarkers			;if not equal, go to notMarkers (not drawing the markers 1-7 on edge of board)
			MOV		r0, r4				;else, r0 = row index (r4)
			ADD		r0, r0, #0x30		;convert for ascii
			BL		put					;print r0
			B		nextColumn			;go to nextColumn
notMarkers	MOV		r1, r10				;r1 = board array address
			MOV		r2, r4				;r2 = row index
			MOV		r3, r5				;r3 = column index
			BL		valueCheck			;check what value is at specified row and column
			ADD		r0, r0, #0x30		;convert for ascii
			BL		put					;print out row index
nextColumn	MOV		r0, #0x20			;r0 = 0x20 (space)
			BL 		put					;print r0
			ADD		r5, r5, #1			;column index++
			B		printColumn			;go to printColumn
done		LDR		r0, =str_nextln		;string x = str_nextln
			BL		puts				;print x
			POP		{r4-r10, PC}


;
; resetBoard subroutine
; 	sets all values on 7x8 board to '0'
; parameters:
;	r0: array address
; return value:
;	none
;
resetBoard
			PUSH	{r4-r6, LR}
			MOV		r4, r0				;r4 = array address
			MOV		r5, #0				;r5 = '0' byte
			MOV		r6, #0				;r6 = index, set index to 0
for			STRB	r5, [r4, r6]		;store r5 ('0') at r4 (array address) + r6 (index)
			ADD		r6, r6, #1			;index++
			CMP		r6, #43				;is index less than 43?
			BLT		for					;if yes, go to for
			POP		{r4-r6, PC}
			
			
;
; playerChoice subroutine
; 	
; parameters:
;	r1: array address, r2: player colour
; return value:
;	r0: column that was chosen
;
playerChoice
				PUSH 	{r4-r7, LR}
				MOV		r4, r1				;r4 = arrat address
				MOV		r5, r2				;r5 = player colour
				MOV		r0, r5				;r0 = player colour
				ADD		r0, r0, #0x30		;convert for ascii
				BL		put					;displays current player colour
				LDR		r0, =str_input		;string x = str_input
				B		printString			;go to printString
fullColumn		LDR		r0, =str_fullCol	;string x = str_fullCol
printString		BL		puts				;print string x
				BL		get					;get ans
				MOV		r6, r0				;r6 = chosen column
				BL		put					;print r6
				LDR		r0, =str_nextln		;string x = str_nextln
				BL		puts				;print string x
				CMP		r6, #0x72			;did user press r?
				BEQ		r					;if yes go to r
				CMP		r6, #0x31			;is chosen column less than 1?
				BLT		invalidInput		;if yes throw invalidInput
				CMP		r6, #0x37			;is chosen column gerater than 7?
				BGT		invalidInput		;if yes throw invalidInput
				SUB		r6, r6, #0x30		;convert chosen column back to decimal
				MOV		r1, r4				;r1 = array address
				MOV		r2, r5				;r2 = current colour
				MOV		r3, r6				;r3 = column
				BL		executeChosenMove	;call executeChosenMove subroutine 
				CMP		r0, #0				;is move invalid?
				BEQ		fullColumn			;if invalid go to fullColumn
				MOV		r0, r6				;r0 = chosen column
				B		end					;finished
r				MOV		r0, #0x72			;the pressed r 
end				POP		{r4-r7, PC}

invalidInput	LDR		r0, =str_inputError	;String x = str_inputError
				B		printString			;print string x			


;
; executeChosenMove subroutine
; 	
; parameters:
;	r1: array address, r2: player colour, r3: chosen column
; return value:
;	r0: 1 if valid move choice, 0 if invalid (column is full)
;
executeChosenMove
				PUSH 	{r4-r8, LR}
				MOV		r4, r1				;r4 = array address
				MOV		r5, r2				;r5 = player colour
				MOV		r6, r3				;r6 = chosen column
				MOV		r7, #6				;r7 = max row value
				MOV		r8, #0				;r8 = empty row value
				B		first
nextRow2		SUB		r7, r7, #1			;reduce current row
				CMP		r7, #0				;is current row at the lowest possible position?
				BNE		first				;if not go to first
				MOV		r0, #0				;else set r0 = 0 (signifies invalid move)
				B		fin					;go to fin (finished)
first			MOV		r1, r4				;r1 = array address
				MOV		r2, r7				;r2 = current row
				MOV		r3, r6				;r3 = chosen column
				BL		valueCheck			;get value
				CMP		r0, r8				;is value at location empty?
				BNE		nextRow2			;if empty go to nextRow2
				MOV		r0, r5				;r0 = current colour
				MOV		r1, r4				;r1 = array address
				MOV		r2, r7				;r2 = lowest available row in chosen column
				MOV		r3, r6				;r3 = chosen column
				BL		valueSet			;go to valueSet subroutine
				MOV		r0, #1				;set r0 = 1 (signifies valid move)
fin				POP		{r4-r8, PC}
			

;
; valueCheck subroutine
; 	
; parameters:
;	r1: array address, r2: row, r3: column
; return value:
;	r0: value at address
;
valueCheck
			PUSH	{r4-r7}
			MOV		r4, #7				;r4 = row size = 7
			CMP		r2, #7				;is row on board?
			BGT		notOnBoard			;if not, go to notOnBoard
			CMP		r3, #8				;is column on board?
			BGT		notOnBoard			;if not, go to notOnBoard
			CMP		r2, #0				;is row on board?
			BLT		notOnBoard			;if not, go to notOnBoard
			CMP		r3, #0				;is column on board?
			BLT		notOnBoard			;if not, go to notOnBoard
			SUB		r5, r2, #1			;r5 = chosen row - 1 (offset for ease of use)
			SUB		r6, r3, #1			;r6 = chosen column - 1 (offset for ease of use)
			MUL		r7, r5, r4			;r7 = row * row size
			ADD		r7, r7, r6			;r7 = r7 + chosen column (r7 now = specified spot)
			LDRB	r0, [r1, r7]		;r7 = value at specified spot
			B 		doneCheck			;go to doneCheck
notOnBoard	MOV		r0, #0				
doneCheck	POP		{r4-r7}				
			BX		LR
		

;
; valueSet subroutine
; 	
; parameters:
;	r1: array address, r2: row, r3: column
; return value:
;	r0: what colour to set
;
valueSet
			PUSH	{r4-r7}
			MOV		r4, #7				;r4 = row size = 7
			SUB		r5, r2, #1			;r5 = chosen row
			SUB		r6, r3, #1			;r6 = chosen column
			MUL		r7, r5, r4			;r7 = row * row size
			ADD		r7, r7, r6			;r7 = r7 + chosen column (r7 now = specified spot)
			STRB	r0, [r1, r7]		;r7 = value at specified spot
			POP		{r4-r7}
			BX		LR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; inithw subroutines
; performs hardware initialisation, including console
; parameters:
;	none
; return value:
;	none
;
inithw
	LDR	r0, =PINSEL0		; enable UART0 TxD and RxD signals
	MOV	r1, #0x50
	STRB	r1, [r0]
	LDR	r0, =U0LCR		; 7 data bits + parity
	LDR	r1, =0x02
	STRB	r1, [r0]
	BX	LR

;
; get subroutine
; returns the ASCII code of the next character read on the console
; parameters:
;	none
; return value:
;	r0 - ASCII code of the character read on teh console (byte)
;
get	LDR	r1, =U0LSR		; r1 -> U0LSR (Line Status Register)
get0	LDR	r0, [r1]		; wait until
	ANDS	r0, #0x01		; receiver data
	BEQ	get0			; ready
	LDR	r1, =U0RBR		; r1 -> U0RBR (Receiver Buffer Register)
	LDRB	r0, [r1]		; get received data
	BX	LR			; return

;
; put subroutine
; writes a character to the console
; parameters:
;	r0 - ASCII code of the character to write
; return value:
;	none
;
put	LDR	r1, =U0LSR		; r1 -> U0LSR (Line Status Register)
	LDRB	r1, [r1]		; wait until transmit
	ANDS	r1, r1, #0x20		; holding register
	BEQ	put			; empty
	LDR	r1, =U0THR		; r1 -> U0THR
	STRB	r0, [r1]		; output charcter
put0	LDR	r1, =U0LSR		; r1 -> U0LSR
	LDRB	r1, [r1]		; wait until
	ANDS	r1, r1, #0x40		; transmitter
	BEQ	put0			; empty (data flushed)
	BX	LR			; return

;
; puts subroutine
; writes the sequence of characters in a NULL-terminated string to the console
; parameters:
;	r0 - address of NULL-terminated ASCII string
; return value:
;	r0 - ASCII code of the character read on teh console (byte)
;
puts	STMFD	SP!, {r4, LR} 		; push r4 and LR
	MOV	r4, r0			; copy r0
puts0	LDRB	r0, [r4], #1		; get character + increment r4
	CMP	r0, #0			; 0?
	BEQ	puts1			; return
	BL	put			; put character
	B	puts0			; next character
puts1	LDMFD	SP!, {r4, PC} 		; pop r4 and PC


;
; hint! put the strings used by your program here ...
;

str_go
	DCB	"Let's play Connect4!",0xA, 0xD, 0xA, 0xD, 0

str_nextln
	DCB "", 0xA, 0

str_input
	DCB	" - it's your turn! Where would you like to place you marker? or press 'r' to reset board", 0
	
str_inputError
	DCB	"Invalid input, please choose a number from 1-7: ", 0
	
str_fullCol
	DCB	"Not there! That column us full, try again!", 0xA, 0xD, 0
	
str_yWins
	DCB	"Yellow is the Winner!", 0xA, 0xD, 0
	
str_rWins
	DCB	"Red is the Winner!", 0xA, 0xD, 0
	
str_restartLn
	DCB	"If you want to play again please press 'q'", 0xA, 0xD, 0
	
str_newGame
	DCB	"New game, board reset", 0xA, 0xD, 0
	
	END
