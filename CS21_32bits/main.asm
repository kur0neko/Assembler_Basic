;
;This program will test out the functions library
;
;
;Include our external functions library functions
%include "./functions.inc"
 
SECTION .data
	openPrompt	db	"Welcome to my Program", 0dh, 0ah, 0h	;Prompt String
		.size	equ	$-openPrompt							;Length of Prompt String

		floatVar1 	dq 	1.0
		floatVar2	dq 	2.0
		floatVar3 	dq 	234.89

 
SECTION .bss

		floatStore	 resq 1
 
SECTION     .text

	global      _start
     

_start:
	;
	;Display Program Header
    push	openPrompt			;The prompt address - argument #1
    push	openPrompt.size		;The size of the prompt string - argument #2
    call    PrintText



    ;this how we load stuff to the stacks
       ;floatVar1+(floatVar2 * floatVar3)

    fld 	qword[floatVar2] 	;push 2.0 onto the stack
    fld 	qword[floatVar3]	;push 234.89 onto the stack
    fmul  						;(floatvar2 * floatVar3)
    fld 	qword[floatVar1]	;push 1.0 onto the stack
    fadd 						;floatVar1+ (floatVar2*floatVar3)
    fld 	qword[floatVar4] 	;push 32.99 onto the stack
    fdiv 						;Divide it

    fstp 	qword[floatStore]	;Save our answer


    fld 	qword[floatVar3]	;Push 234.98 onto the stack
    fsqrt 						;Take it's square root
    ;fld 						;Push ST(0) this will not push 
   ; fmul 						;Multiply it by itself (should reverse the sqrt)
    fld 	qword[floatvar2]	






    ;pop the stack out after copying FSTP

    fstp 	qword[floatStore]
    fstp 	qword[floatStore]
    fstp 	qword[floatStore]


;
;Setup the registers for exit and poke the kernel
Exit: 
	mov		eax,sys_exit				;What are we going to do? Exit!
	mov		ebx,0						;Return code
	int		80h							;Poke the kernel
