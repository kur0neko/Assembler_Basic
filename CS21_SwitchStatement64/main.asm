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
	
	processA_Msg	db	"Process A dummy!", 00h
	processB_Msg	db	"Process B dummy!", 00h
	processC_Msg	db	"Process C dummy!", 00h
	processD_Msg	db	"Process D dummy!", 00h
	default_msg		db 	"Default  Dummy!", 00h
	
	CaseTable		db 'A'
					dq  Process_A
	.entrySize		equ	($-CaseTable)
					db	'B'
					dq	Process_B
					db  'C'
					dq	Process_C
					db	'D'
					dq	Process_D
		
  .numberOfEntries	equ ($-CaseTable)/CaseTable.entrySize
	
 
SECTION .bss

 
SECTION     .text
	global  _start
     
_start:

	push	welcomePrompt
	call	PrintString
	call	Printendl
	call	Printendl
	
	;process the Switch Statement/Case table
	mov	    rcx, CaseTable.numberOfEntries		;Number of items in the switch
	mov		rsi, CaseTable						;Put the address of our table into rsi
	mov		al, 'E'								;Our test value
	
	Switch1:		
	
	cmp		al, [rsi]							;compare our value to the lookup table value
	
	jne    Switch1_goAgain		                ;this isn't the one!
	
	call	Near [rsi+1] 						;Call the fucntion associated with the found value
	
	jmp		leave_Switch1
	
	Switch1_goAgain:
	
	add rsi, CaseTable.entrySize

			;
	loop Switch1	
								;try next time
	Switch1_default:							;The default condition
	

	call Switch1_default					;Default Condition
	

	leave_Switch1:								;End of our switch
	
	push	goodbyePrompt
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
	
	
	
Process_A:
	mov		rbx,1111h
ret

Process_B:
	mov		rbx,2222h
ret

Process_C:
	mov		rbx,3333h
ret

Process_D:
	mov		rbx,4444h
ret

Switch1_Defualt:
	mov		rbx,9999h
ret

		

