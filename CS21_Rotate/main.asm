;
;This program will test out the functions library
;
;
;Include our external functions library functions
%include "./functions.inc"
 
bits 32


SECTION .data
	welcomeString		db	"Welcome to my program",0ah,0dh,0h
	.len		equ ($-welcomeString)
	
printOne		db	"1",0h
printZero		db  "0",0h

numberToPrint   dd  11001100111000110101110111101110b
.len		equ ($-numberToPrint)*8  ;4bytes multiply by 8

smallToPrint	db 32h

numberA			dd 11000011b
numberB			dd 11


	

SECTION .bss

 
SECTION     .text
	global   _start
     
_start:		
	
	push	welcomeString
	call	PrintString
	call	Printendl
	call	Printendl
	
	;using a loop
	;	rotate you number
	; 	check the contents of the carry flag
	;	if 0n, print a 1
	;	if off, print a 0
	;when done, print an end endl and end the program
	;DO NOT destro the value of the numnberToPrint - it should have the same value
	; it did when the program began
	
	
	mov	eax, [numberToPrint]
	mov	esi,0
	mov ecx, numberToPrint.len
LoopRotate:
		rol	eax,1
		jc 	CFON
		jnc CFOFF
		
		
	CFON:
		push printOne
		call PrintString
		jmp Continue
	
	
	CFOFF:
		push printZero
		call PrintString
		jmp Continue
		
		Continue:
		
LOOP LoopRotate
	call	Printendl

		
	;Professor ALternative way
	
	;mov	ecx,31         	 		;number of bits in a double word
	;mov 	ebx,[numberToPrint]		;Move the number to print into ebx
	
	;Loop1	
		;rol ebx,1      			;Roll elft (Most sigbificant) cf
		;jc printAOne				;if carry flag is onm I print a 1
		
		;push printZero				;Otherwise, I print a zero
		;call PrintString			;
		;jmp  ContinueLoop			;Continue the loop
		
		;PrintAOne:
		;push printOne				;Print a1
		;call PrintString			;
		
		;continueLoop:
		
	;loop Loop1						;continue the loop
		
		
		
		
		
		

exit:
	mov		eax,sys_exit							;What are we going to do? Exit!
	mov		ebx,0							;Return code
	int		80h								;Poke the kernel
	


