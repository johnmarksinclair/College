.686 ;; identifies this as 32 bit assembly
.model flat, C ;; define the memory module and calling convention


;; Assembly programs are dived into two sections - data and code

.data

.code

public	poly

poly:	;; prologue
		push ebp ;; pushing base pointer onto the stack
		mov ebp, esp ;; establishing the stack frame

		push	2			;;n, where x^n
		push	[ebp+8]
		call	pow
		add		eax, 1
		add		eax, [ebp+8]

		;; epilogue
		mov esp, ebp ;; move value of base pointer back to the stack pointer
		pop ebp
		ret


pow:	;; prologue
		push ebp ;; pushing base pointer onto the stack
		mov ebp, esp ;; establishing the stack frame

		mov	eax, [ebp+8]	; ebp+8 = first param
		xor	ecx, ecx		; clear ecx
		mov	ecx, 1			; i = 1, init count
		mov	edx, 1			; edx = 1, result register
pow1:	cmp	ecx, [ebp+12]	; ebp+12 = second param
		jg	pow2
		imul	edx, eax
		inc	ecx
		jmp	pow1
pow2:	mov	eax, edx

		;; epilogue
		mov esp, ebp ;; move value of base pointer back to the stack pointer
		pop ebp
		ret

public factorial

factorial:	;; prologue
			push	ebp				; pushing base pointer onto the stack
			mov		ebp, esp		; establishing the stack frame

			mov		edx, [ebp+8]	; param (N) is now in edx
			xor		eax, eax		; clear answer reg

			cmp		edx, 0			; N == 0 ?
			je		fac1			; jump to end if N==0
			
			dec		edx				; N = N-1
			push	edx
			call	factorial		; call factorial(N-1)
			mov		edx, [ebp+8]	; param (N) is now in edx
			imul	eax, edx		; ret reg * N
			jmp		fac2

fac1:		mov		eax, 1
fac2:		;; epilogue
			mov		esp, ebp		; move value of base pointer back to the stack pointer
			pop		ebp
			ret

public multiple_k_asm

multiple_k_asm: ;; prologue
				push ebp ;; pushing base pointer onto the stack
				mov ebp, esp ;; establishing the stack frame



				;; epilogue
				mov esp, ebp ;; move value of base pointer back to the stack pointer
				pop ebp
				ret

end