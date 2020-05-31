;
;Example program to execute 64-bit functions in Linux
;

;
;Include our external functions library functions
%include "./functions64.inc"
 
SECTION .data
 
	welcomePrompt	db	"Welcome to my 64 bit Program", 00h
	goodbyePrompt	db	"Program ending, have a great day!", 00h
	
	sourceString			db	"Yeah Man!",00h
	desString				db	"Wassup Man!",00h
	.len		db 	$-sourceString		;size of the string to copy
	
	
		
	
 
SECTION .bss

	reservString	resb sourceString.len
 
SECTION     .text
	global  _start
     
_start:
		nop
		
		mov	rsi,0
		mov	rx,[szSource]	;loop counter
		
	
	L1:
		mov	al, [source+rsi] 						;get char from source
		mov	[reservString+rsi],al
		inc	rsi
		
		loop L1

	push	welcomePrompt
	call	PrintString
	call	Printendl
	call	Printendl
			
	
;
;Setup the registers for exit and poke the kernel
;Exit: 
Exit:
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel
