includelib legacy_stdio_definitions.lib
extrn printf:near
extern scanf:near

.data

			print_string  BYTE "Please enter an integer: ", 0Ah, 00h
			output_string BYTE "The sum of proc. and user inputs (%lld, %lld, %lld, %lld): %lld", 0Ah, 00h

public inp_int
			
			inp_int QWORD 0

			format	DB	"%lld", 0

.code

public fibX64

	
fibX64:		cmp		rcx, 0		; check if i =< 0
			jle		L1			
			cmp		rcx, 1		; i == 1
			je		L2

			dec		rcx			; fib(i-1)
			push	rcx
			call	fibX64
			pop		rcx

			push	rax

			dec		rcx			; fib(i-2)
			push	rcx
			call	fibX64
			pop		rcx
			
			pop		rcx
			add		rax, rcx
			jmp		done

L1:			mov		rax, rcx
			jmp		done
L2:			mov		rax, 1

done:		ret


public use_scanf

use_scanf:	
			mov		[rsp+8],	rcx		; first
			mov		[rsp+16],	rdx		; second
			mov		[rsp+24],	r8		; third

			sub		rsp, 48				; reserve shadow space
			lea		rcx, print_string	; first arg is now string
			call	printf
			xor		rax, rax
			lea		rcx, format
			lea		rdx, inp_int
			call	scanf
			mov		rax, inp_int
			
			add		rax, [rsp+56]
			add		rax, [rsp+64]
			add		rax, [rsp+72]

			lea		rcx, output_string
			mov		rdx, [rsp+56]
			mov		r8,	[rsp+64]
			mov		r9, [rsp+72]
			mov		r10, inp_int
			mov		[rsp+32], r10
			mov		[rsp+40], rax
			mov		[rsp+56], rax
			call	printf
			mov		rax, [rsp+56]
			add		rsp, 48				; deallocate shadow space

			ret

public max5
			
			; originally: i = rcx, j = rdx, k = r8, l = r9
max5:		mov		r10, r9			; r10 = l
			mov		r9,	r8			; r9 = k

			mov		r8, rdx			; r8 = j
			mov		rdx, rcx		; rdx = i
			mov		rcx, inp_int	; rcx = inp_int
			call	max 

			mov		rcx, rax		; rax = max(inp_int, i, j)
			mov		rdx, r9			; rdx = k
			mov		r8, r10			; r8 = l
			call	max

			ret

max:		mov		rax, rcx		; v == a
			cmp		rdx, rax		; b > v ?
			jle		M1
			mov		rax, rdx
M1:			cmp		r8,	rax			; c > v ?
			jle		M2
			mov		rax, r8
M2:			ret

end