;
;This program will test out the functions library
;
;
;Include our external functions library functions
%include "./functions.inc"
 
SECTION .data
	openPrompt	db	"Welcome to my Program", 0dh, 0ah, 0h	;Prompt String
	
			
	welcomePrompt	db	"Welcome to my 64 bit Program", 00h
	goodbyePrompt	db	"Program ending, have a great day!", 00h
	
	promptArray		db  "The current element in another array is ", 00h
	
	
	Array1 			dd 	10h,20h,30h,40h,50h,60h
	.len			equ 	($-Array1)/4
	
	revArray		dd	0h,0h,0h,0h,0h,0h
	.len			equ		($-revArray)/4

SECTION .bss

	resBuffer		resb	6 ;where data will be stored 
	
	

 
SECTION     .text
	global      _start
     
_start:
	;
	;Display Program Header
    push	welcomePrompt
	call	PrintString
	call	Printendl
	call	Printendl
	
	
	mov	ecx, Array1.len
	mov	esi,0      
	
	Printloop: 
			mov		eax, DWORD[Array1+esi]
			push	eax
			mov		DWORD[revArray+esi],eax	
			add		esi,4
			call	Print32bitNumHex
			call	Printendl	
	loop	Printloop
	
	call	Printendl
	
	push	promptArray
	call	PrintString
	call	Printendl
	call	Printendl
	
	
	mov ebx,0
	mov ecx,0
	mov	ecx, revArray.len 
	
	PrintArrayloop: 
			mov		ebx, DWORD[revArray+esi]
			push	ebx
			sub		esi,4
			call	Print32bitNumHex
			call	Printendl	
	loop	PrintArrayloop
	
	
	
	
	
	
			
	
	
	
	
	;pop the name from the stack in reverse
	;mov ecx, Array1.len
	;mov	esi,0
	
	 ;PopLoop: 
			;	pop		eax
				;mov		[revArray+esi],eax
				;add		esi,4
				;call	Print32bitNumHex
				;call	Printendl	
				
	;loop	PopLoop
			
	
;
;Setup the registers for exit and poke the kernel
Exit: 
	mov		eax,sys_exit					;What are we going to do? Exit!
	mov		ebx,0							;Return code
	int		80h								;Poke the kernel
