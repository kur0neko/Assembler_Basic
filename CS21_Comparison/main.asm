;
;This program will test out the functions library
;
;
;Include our external functions library functions
%include "./funcs.inc"
%include "./functions.inc"
 
SECTION .data
	openPrompt	db	"Welcome to my Program", 0dh, 0ah, 0h	;Prompt String
	closePrompt	db	"Program ending, have a great day!", 00h
	
	anInteger	db			10h
	anIntCmp	db			20h
	asInteger	db			-10h
	aSIntCmp	db			-5h
	
	

SECTION .bss

	
 
SECTION     .text
	global      _start
     
_start:
	
	push 	openPrompt
	call	PrintString
	call	Printendl
	
	nop
	cmp 	BYTE[anInteger], 50h
	je		thierEqual
	jae		itsEitherGreaterThanOrEqual
	ja		itsGreaterThan
	jb		itsLessThan
	jbe		itsEitheLessThanOrEqual
	
	jmp		goesHere
	
	;if(anInteger == 0x50)
	;
	;go to thierEqual
	;
	;else if (anInteger > 0x50)
	;
	;go to itsGreaterThan
	;
	;else
	;
	;goto itsless than
	
	goesHere:
		nop
		;DO something cause this should never happen
		;Something	strange really happened
		jmp endint
	
	
	
	thierEqual:
			nop
			;Do something cause they were equal
			jmp endint
			
	itsGreaterThan:
			nop
			;Do something cause anInteger was greater than 50h
			jmp endint
			
	itsLessThan:
			nop
			;Do something cause anInteger was less than 50h
			
			

	endint:
	
	
	cmp	BYTE[asInteger], 12h
	je	thierEqual
	jg	itsGreaterThan		;Change a to g tor signed comparisons
	jl	itsLessThan			;Change b to l for signed comparisons
	jmp	goesHere
	
	;if(anInteger == 0x12)
	;
	;go to thierEqual
	;
	;else if (anInteger > 0x12)
	;
	;go to itsGreaterThan
	;
	;else
	;
	;goto itsless than
	
	mov	al, [anIntCmp]			;If you want to compare two memory locations
	cmp	[anInteger], al			;
	jmp	ae						;unsigned jump
	
	mov al, [aSIntCmp]			;
	cmp	[asInteger],al			;
	
	jmp	ge						;signed jump
			
	;### 1)

	
	and bl, 00111000b
	jnz L1
	
	;alternative
	;test bl,00111000b ;non destructive AND operation betwen each pair of matching bits in two opearnds
	;jnz	L1
	
	;#### 2)
	
	and bl,00111000b
	cmp	bl,00111000b ;38h in hex     0011 | 1000b
	je	L2
	

	;#### 3)
	
	add al,0
	
	jp L3
	
	
	;### 4)
	
	and eax, 8000h
	cmp eax, 8000h
	je L4
	
	; Alternative way
	
	add	eax,0
	js L4
	
	
	;#### 5)
	
	sub ebx, ecx
	cmp ebx,0
	ja L5
	
	
	;write the code only test if the bit number two is off
	
	;# 
	
	mov	ah,al
	and ah,111111101b
	cmp ah,111111101b
	je	Bill1
	
	
	
	
	

	
	
	push	closePrompt
	call	PrintString
	call	Printendl
	
	nop
	
			
	
	
Exit: 
	mov		eax,sys_exit					;What are we going to do? Exit!
	mov		ebx,0							;Return code
	int		80h								;Poke the kernel
