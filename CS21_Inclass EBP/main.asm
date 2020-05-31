;
;This program will test out the functions library
;
;
;Include our external functions library functions
%include "./functions.inc"
 
SECTION .data
	openPrompt	db	"Welcome to my Program", 0dh, 0ah, 0h	;Prompt String
		.size	equ	$-openPrompt			;Length of Prompt String
 
SECTION .bss
 
SECTION     .text
	global      _start
	global 		MyFunc1
	global 		MyFunc2
	global 		MyFunc3

     
_start:

 	nop

 	push 	11111111h 				;argument #1
 	push 	22222222h				;argument #2
 	call 	MyFunc3
 	;pop	eax 	;Not needed since MyFunc3 is ret 8
 	;pop 	eax 	;Not needed since MyFunc3 is ret 8



 	;Do not remove/change the lines below here.
 	;These exit out of the application and back
 	;To linux	in an orderly fashion


	;call MyFunc2


 	nop

 	mov 	eax,1 					;Exit system call value
 	mov 	ebx,9 					;Exit return code
 	int 	80h						;call the kernel


  MyFunc1:

  	push 	ebp					;'Save the call's ebp pointer
  	mov 	ebp, esp			;Setup out own ebp - stack foundation of our function


  	mov esp,ebp					;Restore our stack pointer- remove any local variables
  	pop 	ebp					;Restore the caller's ebp pointer
  	
  	ret				 	



  MyFunc2:						;Basic function template, with two interger local variables

  	push 	ebp					;Save the caller's ebp pointer
  	mov 	ebp, esp			;Set up our own ebp-stack foundation of our function
  	sub 	esp,8				;allocate two 4-bytes integer variables


  	mov 	DWORD [ebp-4],0h			;set x to 0
  	mov 	DWORD [ebp-8],0h			;set y to 10h


  	mov 	esp, ebp			;Restore stack pointer and remove any local variables
  	pop 	ebp					;Restore the caller's ebp pointer
  	ret	 	


  	MyFunc3:						;Basic function template, with two interger local variables

  	push 	ebp					;Save the caller's ebp pointer
  	mov 	ebp, esp			;Set up our own ebp-stack foundation of our function


  	mov 	eax,[ebp+8]			;set x to 0
  	mov 	eax,[ebp+12]		;set y to 10h



  	mov 	esp, ebp			;Restore stack pointer and remove any local variables
  	pop 	ebp					;Restore the caller's ebp pointer
  	ret	 	 8








