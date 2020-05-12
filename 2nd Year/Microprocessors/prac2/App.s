	AREA	AsmTemplate, CODE, READONLY
	IMPORT	main

; sample program makes the 4 LEDs P1.16, P1.17, P1.18, P1.19 go on and off in sequence
; (c) Mike Brady, 2011 -- 2019.

		EXPORT	start
start

IO1DIR	EQU	0xE0028018
IO1SET	EQU	0xE0028014
IO1CLR	EQU	0xE002801C
;#######################################################################################
		ldr r0, = -1049				; number to display
		movs r1, r0, lsl #1  		; logic shift r0 left 1 place and set carry 
		bcs	neg_num					; if has carry, num is negative
neg_num_done
		ldr r1, = 10				; r1 = denominator = 10
		ldr r4, = 0					; r4 = number of digits
		ldr r5, = 0x40000000		; r5 = start address 
unit	cmp r0, #0					; check if end of digits
		BEQ light					; if end of digits, go to light section
		bl div_sub					; branch w/ link to the division subroutine				
		cmp r1, #0					; is the remainder 0?
		bne not_zero				; if remainder != 0, branch to not_zero
		ldr r1, = 15;				; if remainder = 0, r1 = 15 (so all lights turn on)
not_zero
		str r1, [r5, r4, lsl #2]	; store digit in array for lights
		add r4, r4, #1				; r4++ (increment the index) 
		ldr r1, = 10				; make r1 (denominator) 10 again
		b unit
light
		cmp r11, #1					; is number negative?
		beq set_neg					; if negative goto set_neg
set_neg_done
		ldr	r1, = IO1DIR
		ldr	r2, = 0x000f0000		; select leds P1.19 to P1.16
		str	r2, [r1]				; leds are now outputs
		ldr	r1, = IO1SET			; r1 now points to the set register
		str	r2, [r1]				; leds set to turn offset them to turn the LEDs off
		ldr	r2, = IO1CLR			; r2 now points to the clear register
while	ldr	r3,= 0x00000000			; start with led P1.16
		mov r8, r4					; r8 = index
		add r8, r8, #1				; r8++
loop	str	r3, [r2]	   			; access clear register, clears bit then turns on led
		ldr	r9, = 6000000
delay	subs r9, r9, #1				; decrements r9 (r9 is acting as a timer/ delay)
		bne	delay					; delays for ~0.5 seconds
		str	r3, [r1]				; access set register, set the bit -> turn off the LED
		sub r10, r8, #2				; r8 (index) - 2 and store in r10
		ldr r3, [r5, r10, lsl #2]	; retreiving numbers from array
		b reverse_sub				; reverse bits so lights are no longer backward on board
reverse_done
		mov r3, r7, lsr #11			; move reversed bits back into light array
		sub r8, r8, #1				; decrement index
		cmp	r8, #0					; check if index == 0 (is done)
		bne	loop					; loops back to display next binary num
		b	while					; while loop to make it display continuosly
stop	b	stop

neg_num
		ldr r11, =1					; r11 = 1 (r11 is the negative flag)
		mvn r0, r0					; r0 = original num, invert r0's bits
		add r0, r0, #1				; r0 = r0 + 1, two's compliment of original r0
		b neg_num_done
set_neg
		ldr r11, =11
		str r11, [r5, r4, lsl #2]	; saving 1011 sequence to array to indicate '-'
		add r4, r4, #1
		b set_neg_done
reverse_sub
		ldr r11, = 0x80000000		; mask
		ldr r6, = 0					; counter
		ldr r7, = 0					; result
		mov r3, r3, lsl #28
rev_loop
		cmp r6, #4
		bge reverse_done
		and r12, r11, r3
		mov r3, r3, lsl #1
		add r7, r7, r12
		mov r7, r7, lsr #1
		add r6, r6, #1
		b 	rev_loop

fin		b	fin

; Division Subroutine - div
; Parameters:
; r0: numerator, r1: denominator -> r0/r1
; Returns:
; r0: quotient, r1: remainder

div_sub	push{r4-r12, lr}
		ldr r4, = 0				; quotient var
		ldr r5, = 0 			; remainder var
		ldr r7, = 0 			; numerator length (x) init at 0
		mov r6, r0				; r6 = numerator
get_num_length					; finds length of numerator
		movs r6, r6, lsr #1		; shift numerator right 1
		beq correct_length		; if r6 == r6 >> 1, r7 now equals numerator length
		add r7, r7, #1			; r7 = x, x++ (stop at n-1)
		b get_num_length		; loop until length of numerator is found
correct_length
div_start
		cmp r7, #0				; x == 0?
		blt div_sub_end			; if numeraor length (x) < 0 branch to end of div sub
		mov r5, r5, lsl #1		; remainder = (remainder << 1)
		ldr r9, = 1				; r9 = 1
		mov r8, r9, lsl r7		; r8 = (r9 shifted left by the length of the numerator)
		and r8, r8, r0			; r8 = number at x
		mov r8, r8, lsr r7 		; shift r8 back r7 places
		add r5, r5, r8			; r5 = r5 + r8, remainder += number at x
div_check
		cmp r5, r1				
		blt div_done			; if remainder < denominator, branch to end
		sub r5, r5, r1			; remainder = remainder - denominator 
		ldr r9, = 1				; r9 = 1
		mov r8, r9, lsl r7		; r8 = (r9 shifted left by the length of the numerator (whats left))
		orr r4, r8				; r4 = quotient || number at r8
		b div_check
div_done
		sub r7, r7, #1			; x-- (numerator length index--)
		b div_start		
div_sub_end
		mov r0, r4				; r0 = quotient
		mov r1, r5				; r1 = remainder
		pop{r4-r12, pc}

		END