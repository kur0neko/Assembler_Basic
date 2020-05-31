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

	
	Array1 		10h,30h,F0h,20h,50h,12h
	Array2		E0h,40h,22h,E5h,40h,55h
	Array3					
	
	

 
SECTION .bss
	
 
SECTION     .text
	global  _start
     
_start:

	
	
	
	
	
	
	
	
	
	
	
	


;
;Setup the registers for exit and poke the kernel
;Exit: 
Exit:
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel
