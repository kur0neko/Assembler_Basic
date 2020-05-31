;
;This program will test out the functions library
;
;
;Include our external functions library functions

sys_exit	equ	1h
sys_read	equ	3h
sys_write	equ	4h
stdin		equ	0h
stdout		equ	1h
stderr		equ	3h

bits 32

SECTION .data

	szLF db 0dh,0ah,0h

SECTION .bss
	
 
SECTION     .text
	
	global	DisplayText
	global	Displayendl
	
	nop

	
DisplayText:

	mov		eax,04h		;Move the write code into eax
	mov		ebx,01h			;Move the code fron stdout into ebx
	int		80h				;Poke the kernal
	ret



Displayendl:

	mov	ecx, szLF			;Move address of characters to ecx
	mov	edx,03h				;Move length of characters to edx	
	mov eax,04h             ;What are we going to do? Write
	mov ebx,01h             ;Write to what?
	int 80h                 ;Poke the kernel
	
nop
	
	mov		eax,1							;What are we going to do? Exit!
	mov		ebx,0							;Return code
	int		80h								;Poke the kernel

	


