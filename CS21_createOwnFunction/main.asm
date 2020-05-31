;
;Example program to execute 64-bit functions in Linux
;

;
;Include our external functions library functions
%include "./funcs.inc"
bits 32
 
SECTION .data
 
	welcomePrompt	db	"YO! Wassup!", 00h
		.len equ($-welcomePrompt)
	

		
SECTION .bss

 
SECTION     .text
	global  _start
     
_start:

	mov		ecx, welcomePrompt
	
	mov		edx, welcomePrompt.len
	
	call	DisplayText
	
	call	Displayendl

	
nop
	
	mov		eax,1							;What are we going to do? Exit!
	mov		ebx,0							;Return code
	int		80h								;Poke the kernel
