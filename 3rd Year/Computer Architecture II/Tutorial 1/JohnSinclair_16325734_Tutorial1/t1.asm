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
				push ebp			;; pushing base pointer onto the stack
				mov ebp, esp		;; establishing the stack frame
				push ebx			;; preserve ebx
				push edi			;; preserve edi
				
				mov edi, [ebp+16]	;; edi = pointer to the array
				
				xor cx, cx			;; clear the counter (cx)
				mov	cx, [ebp+8]		;; store N in cx
				

mulk2:			cmp cx, -1			;; for loop N--
				je	mulk1
				mov	bx, [ebp+12]	;; ebx = k
				mov ax, cx
				add ax, 1
				xor	dx, dx			;; clear modulo ans
				div bx
				cmp	dx, 0
				jne	elsecase
				xor edx, edx
				mov	dx, cx
				imul	dx, 2
				add	edx, edi
				mov ax, 1
				mov	[edx], ax		;;make array[i] = 1
				jmp skipelse

elsecase:		xor edx, edx
				mov	dx, cx
				imul	edx, 2
				add	edx, edi
				mov	ax, 0
				mov	[edx], ax		;; make array[i] = 0


skipelse:		dec	cx				;; decrement counter
				jmp	mulk2			;; loop

mulk1:			;; epilogue
				pop edi				;; restore edi
				pop ebx				;; restore ebx
				mov esp, ebp		;; move value of base pointer back to the stack pointer
				pop ebp
				ret

end