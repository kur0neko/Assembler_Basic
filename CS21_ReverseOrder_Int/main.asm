;
;Example program to execute 64-bit functions in Linux
;

;
;Include our external functions library functions
%include "./functions64.inc"
 
SECTION .data
 
	welcomePrompt	db	"Welcome to my 64 bit Program", 00h
	goodbyePrompt	db	"Program ending, have a great day!", 00h
	
	promptInput		db		"Please Enter the String 20 byte: ",00h
	
	
 
SECTION .bss

	
	
	readBuffer		resb	255			;where data will be stored the input
	.len			equ ($-readBuffer)
	reverseBuffer	resb	255			;the data will reversed from readBuffer
	
 
SECTION     .text
	global  _start
     
_start:
		nop

	push	welcomePrompt
	call	PrintString
	call	Printendl
	call	Printendl
	
	push	promptInput 		; print prompt ask user input for the string
	call	PrintString
	
	
	push	readBuffer			;get keyboard input from the user
	push	readBuffer.len		;it's gonna go into readBuffer
	call	ReadText
	
	
	;Reverse	the data input (hint: loop from the book)
	;Print	the new reversed string
	
	
	;push the name on the stack
	
	
	mov	rcx, readBuffer.len
	mov	rsi,0      
	
	Outerloop: 
			movzx	rax, BYTE[readBuffer+esi]
			push	rax
			inc		rsi
			
	loop	Outerloop
	
	;pop the name from the stack in reverse
	
	mov rcx, readBuffer.len
	mov	rsi,0
	
	Innerloop: 
				pop		rax
				mov		[reverseBuffer+esi],rax
				inc		rsi
				
	loop	Innerloop
			
			push reverseBuffer
			push readBuffer.len
			call PrintText
				
	
;
;Setup the registers for exit and poke the kernel
;Exit: 
Exit:
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel
