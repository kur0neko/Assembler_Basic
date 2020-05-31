;
;This program will test out the functions library
;
;
;Include our external functions library functions
%include "./functions.inc"
 
SECTION .data
	
	string1		db	"Hello there",0h		;Prompt String
	.size		equ	 ($-string1)			;Length of Prompt String

	dwArray 	dd 	1111h,2222h, 3333h,4444h
	.size   	equ	 ($-dwArray)

	cmpString1	db	"Hello-word",0h
	.size  equ	($-cmpString1)

	cmpString2	db	"Hello-word",0h
	.size  equ	($-cmpString2)

	dashString	db	"-"
	.size		equ ($-dashString)


 
SECTION .bss

	string2 	resb 255


 
SECTION     .text
	global      _start
     
_start:
	;
	;Display Program Header
   
   ;MOVSB, copies data found at address in ESI to address in edi
	mov 	esi,	string1
	mov 	edi,	string2
	mov 	ecx,    string1.size
	rep movsb


	;MOVESD, copies data found at address in ESI to address in EDI

	mov 	esi, dwArray
	mov 	edi, dwArray2
	mov 	ecx, dwArray.len
	rep  movsd

	;copie array1 to array2

	mov 	esi,cmpString1
	mov 	edi,cmpString2
	repe 	cmpsb					;repeat until it find the byte that not equal

	;repne cmpsb					;keep going untill it find the a byte equal

	;cmpsw							;compare single word
	;cmpsd (dobule word)

	mov 	esi, cmpString2			;Our string we are looking or a day with
	mov 	edi, dashString			;Contains a single byte "-"
	mov 	ecx, cmpString2.len	    ;Lenght of our string
	repne 	ecx 					;rep incerements both esi and edi

	Loop1:							;so we need a loop if both arrays are not the same size
		cmp[esi],[edi]				;this loop will look for the first occurance
		je 	exit					;of a dasy in the string pointed to by
		inc esi						;esi
	loop Loop1


	exit:
		cmp ecx,0
		je notFound
		;found

		jmp endit
notFound:


mov 	edi, cmpString2				;Our Hello-There stribg
mov 	al,	[dashString]			;Lenght of our string
mov 	ecx, cmpString2.size		;Search character "-"
repne 	scasb						;Keep going untill "-" is found 




 
;Setup the registers for exit and poke the kernel
endit:

	mov		eax,sys_exit				;What are we going to do? Exit!
	mov		ebx,0						;Return code
	int		80h							;Poke the kernel
