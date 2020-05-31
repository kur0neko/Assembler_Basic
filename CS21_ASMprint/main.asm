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
	
	endl				db	0ah,0dh,0h
	.len		equ ($-endl)
	
	
	
	
	

SECTION .bss

 
SECTION     .text
	global   _start
     
_start:		
	nop
	
	;ecx that will contain the address of the string you wish to print
	mov		ecx, welcomeString
	
	;edx that will contain the length of the string
	
	mov		edx, welcomeString.len
	
	;eax	contain the action we want to take; 4h = write
	
	mov		eax,04h

	;ebx	contain the destination of the action: 1h = stdout
	mov		ebx,01h
	
	int		80h  ;tickle the kernel
	
	mov		ecx,endl
	mov		edx, end.len
	mov 	eax,04h
	mov		ebx,01h
	int		80h
	
	
exit:
	mov		eax,1							;What are we going to do? Exit!
	mov		ebx,0							;Return code
	int		80h								;Poke the kernel
