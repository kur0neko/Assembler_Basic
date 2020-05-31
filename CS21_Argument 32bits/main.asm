;
;This program will test out the functions library
;
;
;Include our external functions library functions
%include "./functions.inc"
 
SECTION .data
	
	


 
SECTION .bss

	numArgument 		resw 	1
	programPath 		resw 	1
	argumentOne 		resw 	1
	argumentTwo 		resw 	1
	argumentThree 		resw 	1


 
SECTION     .text
	global      _start
     
_start:
	;
	;Display Program Header

	;push	welcomePrompt						;Move welcome prompt
	;call	PrintString
	;call	Printendl
	;call	Printendl

	pop 	eax									;get number of argument and put into rax
	;mov 	[numArgument], eax					;Save the number of argument
	;pop 	eax									;get address of  program path
	;mov 	[programPath], eax					;Save  programPath st argument
	;pop 	eax									;get address of first argument and put into rax
	;mov 	[argumentOne], eax					;Save the first of argument
	;pop 	eax									;get seccond argument put into rax
	;mov 	[argumentTwo], eax					;Save  2 nd argument
	;pop 	eax									;get address of third argument and put into rax
	;mov 	[argumentThree], eax				;Save the third of argument

	mov 	ecx,eax

	arguLoop:
		call PrintString					 	;print string text arg
		call Printendl
	loop arguLoop	
   
   
 
;Setup the registers for exit and poke the kernel
endit:

	mov		eax,sys_exit				;What are we going to do? Exit!
	mov		ebx,0						;Return code
	int		80h							;Poke the kernel
