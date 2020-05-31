;
;This program will test out the functions library
;
;
;Include our external functions library functions

;
;This program will test out the functions library
;
;
;Include our external functions library functions

sys_exit	equ	1h
sys_read	equ	3h
sys_write	equ	4h
stdin		equ	0h
stdout		equ	1h
stderr		equ	3h

bits 32

SECTION .data

	szLF db 0dh,0ah,0h

SECTION .bss
	
 
SECTION     .text
	
	global		DisplayText
	global		Displayendl
	global		ReadText
	global 		addTwo			;#
	global 		addArray       	;#
	global		addTwoArray		
	global		revArray
	global		pow2			;#
	global		multiplyTwo		;#
	
	nop
	

DisplayText:

	mov		eax,04h		;Move the write code into eax
	mov		ebx,01h			;Move the code fron stdout into ebx
	int		80h				;Poke the kernal
	ret
	
	
	
;#####################################################################################

Displayendl:

	mov	ecx, szLF			;Move address of characters to ecx
	mov	edx,03h				;Move length of characters to edx	
	mov eax,04h             ;What are we going to do? Write
	mov ebx,01h             ;Write to what?
	int 80h                 ;Poke the kernel
	
nop
	
	mov		eax,1			;What are we going to do? Exit!
	mov		ebx,0			;Return code
	int		80h				;Poke the kernel
	
;#####################################################################################

ReadText:
	mov		ebx,stdin		;Read from inpu
	mov		eax,sys_read	;Read from
	int		80h				;Poke the kernel
	
	ret

;#####################################################################################

addTwo:
	nop
	
	mov	eax,[esp+4]			;Copy first paremeter to eax
	mov	edx,[esp+8]			;Copy second parameter to edx
	add	eax,edx				;Add first and second parameters
	
	ret						;Return will, by default, be in the eax register
	
;######################################################################################

addArray: 
	nop
	mov	esi,[esp+4]			;Copy first parameter to esi: Pointer to array
	mov	ecx,[esp+8]			;Copy second paraneter to ecx: number of items in the array
    mov edi,0
    mov eax,0				;Set total to zero
    
    Loop1:
		mov edx,[esi+edi]	;Copy Value at array address+counter to edx
		add eax, edi		;Add the array value in edx to eax
		add edi, 4          ;Increment ebx by a double word size (4 bytes)
		
	Loop  Loop1				;ecx contains the counter -decrement it and loop
	ret                     ;Return will, by defaultm, be in the eax register
	
;######################################################################################

pow2:
	nop						
	mov	eax,[esp+4]			;Copy first parameter to esi
	mul	eax					;Mul eax, eax
	
	ret						;return
	
;######################################################################################

multiplyTwo:
	nop           
	mov eax,[esp+4]			;Copy first number into eax and push it in the stack
	mov ebx,[esp+8]			;Copy second number into eax and push it in the stack
	mul	ebx					;Multiply with eax,ebx
	
	ret						;return value 
			
;######################################################################################

;revArray:
		
	;mov	esi,[esp+4]					;Copy first parameter to esi: Pointer to Array1
	;mov	edi,[esp+8]					;Copy second parameter to edi; Pointer to array2 (empty array)
	;mov	ecx,[esp+12]				;Array size
   ; mov ebx,0						;Set counter to zero
   ; mov eax,0						;Set total to zero
   ; push ebx	
    
   ; LoopReverse:
    
	;mov [edi+ecx-1],[esi+ebx]		;Copy Value at array address+counter to edx
	;add ebx,	4          			;Increment ebx by a double word size (4 bytes)
	;sub	ecx,	4
	;Loop  LoopReverse				;ecx contains the counter -decrement it and loop
	
	;pop ebx
	
	;ret                     		;Return will, by defaultm, be in the eax register

;######################################################################################



	


		

	




	




































	
