;
;This program will test out the functions library
;
;
;Include our external functions library functions
%include "./functions.inc"
 
SECTION .data
	openPrompt	db	"Welcome to my Program", 0dh, 0ah, 0h	;Prompt String
	
	saveEAX			dd 0
	
			
	welcomePrompt	db	"Welcome to my 64 bit Program", 00h
	goodbyePrompt	db	"Program ending, have a great day!", 00h
	
	mov eax, 0
	
	
SECTION .bss

 
SECTION     .text
	global      _start
     
_start:
	
	nop
	
	call	Procedure1				;call the function procedure1
	
	;nop
	;mov 	ecx,10
	;mov edx,[var1]
	;mov	esi,var1
	
	nop
	mov		eax,1h
	mov	edx,0
	int	80h
	jmp	Endit
	
;A stupid function which wil simply add 10 to eax
;Recieve:	 EAX will contain the initial value
;Return: 	EAX will contain the final value
;Requires:  use ecx to calcualte, but restores its value before returning

Procedure1:
		;pushad						;Save all registers
		; Use pushad th save code, not to increase code
		mov		[saveEax],eax
		push	ecx					;Save ecx because we are chaning it
		mov		ecx,10h				;DO out stuff
		add		eax, ecx
		cmp		eax,100h			;if(eax > 100h)
		jg		endProc				;goto endProc
		call	Procedure1
		endProc:
		pop 	ecx
		;Eax always contain the result of a procedure call
		;pop	ecx
		;mov		[saveEAX],	eax		;Beacuse we must return our function value
		;popad						;in eax, we need to save it first
		;mov	eax, [saveEAX]          ;then restore it
		
		
									;you as a programmer not reponsible for maintain eax
		

			

Endit:	
;
;Setup the registers for exit and poke the kernel
Exit: 
	mov		eax,sys_exit					;What are we going to do? Exit!
	mov		ebx,0							;Return code
	int		80h								;Poke the kernel
