;
;This program will test out the functions library
;
;
;Include our external functions library functions
%include "./functions.inc"
 
bits 32


SECTION .data
	welcomeString		db	"Welcome to my program",0ah,0dh,0h
	.len		equ ($-welcomeString)
	
	endl				db	0ah,0dh,0h
	.len		equ ($-endl)
	
	processA_Msg	db	"Process case A", 00h
	processB_Msg	db	"Process case B", 00h
	processC_Msg	db	"Process case C", 00h
	processD_Msg	db	"Process case D", 00h
	default_msg		db 	"Default  case!", 00h
	
	CaseTable		db 'A'
					dd  Process_A
	.entrySize		equ	($-CaseTable)
					db	'B'
					dd	Process_B
					db  'C'
					dd	Process_C
					db	'D'
					dd	Process_D
		
  .numberOfEntries	equ ($-CaseTable)/CaseTable.entrySize


SECTION .bss

 
SECTION     .text
	global   _start
     
_start:		
	
	push	welcomeString
	call	PrintString
	call	Printendl
	call	Printendl
	
	;process the Switch Statement/Case table
	mov	    ecx, CaseTable.numberOfEntries		;Number of items in the switch
	mov		esi, CaseTable						;Put the address of our table into rsi
	mov		al, 'B'								;Our test value
	
	Switch1:		
	cmp		al, [esi]							;compare our value to the lookup table value
	jne    Switch1_goAgain		                ;this isn't the one!
	call	Near [esi+1] 						;Call the fucntion associated with the found value
	jmp		leave_Switch1
	
	Switch1_goAgain:
			add esi, CaseTable.entrySize		;
	loop Switch1	
								;try next time
	Switch1_default:							;The default condition
		call Switch1_default					;Default Condition
	leave_Switch1:								;End of our switch
	
	
	
	

	
	
exit:
	mov		eax,sys_exit							;What are we going to do? Exit!
	mov		ebx,0							;Return code
	int		80h								;Poke the kernel
	
Process_A:
	mov		ebx,1111h
	
	
ret

Process_B:
	mov		ebx,2222h
	call	PrintString
	call	Printendl
ret

Process_C:
	mov		ebx,3333h
	
ret

Process_D:
	mov		ebx,4444h
	
ret

Switch1_defualt:
	mov		ebx,9999h
	
ret

