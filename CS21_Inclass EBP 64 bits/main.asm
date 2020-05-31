;
;Example program to execute 64-bit functions in Linux
;

;
;Include our external functions library functions
%include "./functions64.inc"
 
SECTION .data

MyArray 	dq 	10,20,30,40,50,60,70
	.size 	equ ($-MyArray)/8
 
 
SECTION .bss

 
SECTION     .text
	global  _start

	global 		MyFunc1
	global 		MyFunc2
	global 		MyFunc3
	global 		MyFunc4

     
_start:

	nop
	push 	MyArray				;Put the address of our array onto the stack
	push 	MyArray.size 		;Put the number of array item onto the stack
	call 	MyFunc4








	mov 	rax, 111111111111111h				;argument #1

 	push 	rax 

 	mov     rax, 222222222222222h 				;argument #2
 	
 	push 	rax

 	call 	MyFunc3

	
	
	
	

;
;Setup the registers for exit and poke the kernel


	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel

	MyFunc1:

  	push 	rbp					;'Save the call's ebp pointer
  	mov 	rbp, rsp			;Setup out own ebp - stack foundation of our function


  	mov 	rsp,rbp				;Restore our stack pointer- remove any local variables
  	pop 	rbp					;Restore the caller's ebp pointer
  	
  	ret				
	
	

	MyFunc2:						;Basic function template, with two interger local variables

  	push 	rbp					;Save the caller's ebp pointer
  	mov 	rbp, rsp			;Set up our own ebp-stack foundation of our function
  	sub 	rsp,8				;allocate two 4-bytes integer variables


  	mov 	QWORD [ebp-8],44h			;set x to 0
  	mov 	QWORD [ebp-16],55h			;set y to 10h


  	mov 	rsp, rbp			;Restore stack pointer and remove any local variables
  	pop 	rbp					;Restore the caller's ebp pointer
  	ret	 	


  	MyFunc3:						;Basic function template, with two interger local variables

  	push 	rbp					;Save the caller's ebp pointer
  	mov 	rbp, rsp			;Set up our own ebp-stack foundation of our function


  	mov 	rax,[ebp+16]		;set x to 0
  	mov 	rax,[ebp+24]		;set y to 10h

  	mov 	QWORD [ebp+16],0		;set x to 0
  	mov 	QWORD [ebp+24],0		;set y to 10h



  	mov 	rsp, rbp			;Restore stack pointer and remove any local variables
  	pop 	rbp					;Restore the caller's ebp pointer
  	ret	 	 16

  	MyFunc4:					;gonna get two argument sent to it from the stack Array adress and size of array
  	push 	rbp					;Save the caller's ebp pointer
  	mov 	rbp, rsp			;Set up our own ebp-stack foundation of our function


  	mov 	rcx,[ebp+16]		;Put our second argument into rcx -array size
  	mov 	rdi,[ebp+24]		;Put our first argument into rdi - address of the array
  	mov 	rax,0 				;clear out our accumulator

 	loop1:
 		add rax, QWORD[rdi]		;Add an item in the array to rax 
 		mov QWORD [rdi], 0                              
 		add rdi,8				

 	loop loop1

 	pop 	rdi
 	pop 	rcx
 	
 	nop

 	;clean up the stack frame and return
  	mov 	rsp, rbp			;Restore stack pointer and remove any local variables
  	pop 	rbp					;Restore the caller's ebp pointer
  	ret	 	26









