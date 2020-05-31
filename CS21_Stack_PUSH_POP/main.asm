;
;Example program to execute 64-bit functions in Linux
;

;
;Include our external functions library functions
%include "./functions64.inc"
 
SECTION .data
 
	welcomePrompt			db		"Welcome to my 64 bit Program on Linux", 00h
	linePrompt				db		"=============================================================",00h;
	goodbyePrompt			db		"Program ending, have a great day!", 00h
	
	Array1					db 		10h,20h,30h,40h,50h
	
	.len					equ	($-Array1)

	aVar					db		0h
	
	
	

 
SECTION .bss
	
 
SECTION     .text
	global  _start
     
_start:

push	linePrompt
call	PrintString
call 	Printendl

push welcomePrompt
call	PrintString
call 	Printendl

push	linePrompt
call	PrintString
call 	Printendl


;push	10h
;push	20h
;push	30h


;pop		rax
;push 	rax
;call	Print64bitNumHex
;call 	Printendl

;pop		rax
;push	rax
;call	Print64bitNumHex
;call 	Printendl

;pop		rax
;push	rax
;call	Print64bitNumHex
;call 	Printendl


	;Nested Loop

	mov rcx,	10
	OuterLoop:
				; --> for(int i=0; i > 10;i--){
				;			var=i+10
				;}
				;		for(int j=100; j >10;j--)
				
		mov		[aVar],rcx		;aVar= rcx+10
		add 	DWORD [aVar],10	;	
		push	rcx				;Save the outer loop counter
		mov 	rcx,100			;Set inner loop count to 100	(do it 100 times)
		InnerLoop:
				;do something 100 times
				
		Loop InnerLoop
		pop		rcx				;Restore value of outer loop counter
		;Do something after the inter loop while still being
		;in the outerloop
	
	Loop	OuterLoop

;push address and array contents onto stack

push	Array1					;push the array address onto stack ____windowversion push OFFSET array1
push	Array1.len				;Push the size of the array (LENGTHOF is window method)


movzx	rax,BYTE[Array1]		;push the first value in array1 onto Stack
push 	rax

mov		rax,0h					;same as above
mov		al,[Array1]
push	rax







push	linePrompt
call	PrintString
call 	Printendl

push 	goodbyePrompt
call	PrintString
call 	Printendl

push	linePrompt
call	PrintString
call 	Printendl

mov		rcx,1000000
loop1:
	push	0h

Loop loop1






	
	
	
	
	
	
	
	
	
	
	
	


;
;Setup the registers for exit and poke the kernel
;Exit: 
Exit:
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel
