;
;This program will test out the functions library
;
;
;Include our external functions library functions
%include "./functions.inc"

bits 32


SECTION .data
	welcomeString		db	"Welcome to my program",0ah,0dh,0h
	dwordVal        db   -101
  wordVal         db   -101
  byteVal         db   -101


SECTION .bss

SECTION     .text
	global   _start

_start:

	push	welcomeString
	call	PrintString
	call	Printendl
	call	Printendl

	nop

	mov eax, [dwordVal]
	mov edx, 0h
	cdq                  ;sign endtends 32-bits eax to 64 bit edx;eax
  mov ax, [wordVal]
  mov dx, 0h

  cwd                   ;Sign extends 16-bits ax to 32-bit dx:ax
  mov al, [byteVal]
  mov ah, 0h            ;Sign extends 8-bits al to 16-bits ah:al
  cbw


	nop

	push closePrompt     ;The prompt address -argument #1
	call PrintString
	call Printendl










exit:
	mov		eax,sys_exit							;What are we going to do? Exit!
	mov		ebx,0							;Return code
	int		80h								;Poke the kernel
