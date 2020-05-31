;
;This program will test out the functions library
;
;
;Include our external functions library functions
%include "./functions.inc"
 
bits 32


SECTION .data

 	openPrompt 		db 		"Welcome to my program", 0dh, 0ah,0h 		;Prompt string
 		.len		equ 	($-openPrompt)		;Lenght of prompt string
 		char1		db		'8'
 		char2		db		'2'

	

SECTION .bss



 
SECTION     .text
	global   _start
     
_start:		

	push 	openPrompt 				;The prompt address - argument #1
	push 	openPrompt.len			;The size of the prompt string - argumen t #2
	call 	PrintText
	call 	Printendl

	mov eax, 0h						;clear out eax
	mov al,[char1]					;put 8 into al
	add al,[char2]					;add 2 to al
	aaa 							;ASCII adjust our total
	or ax, 3030h					;Add the 30h's in front of every digit



	








	
	
	

	
	
exit:
	mov		eax,sys_exit				    ;What are we going to do? Exit!
	mov		ebx,0							;Return code
	int		80h								;Poke the kernel
	


