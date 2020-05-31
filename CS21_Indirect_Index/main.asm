;
;Example program to execute 64-bit functions in Linux
;

;
;Include our external functions library functions
%include "./functions64.inc"
 
SECTION .data
 
	welcomePrompt	db	"Welcome to my 64 bit Program", 00h
	goodbyePrompt	db	"Program ending, have a great day!", 00h
		
	byteArray	db	10h,20h,30h,40h,50h
	
	.len		equ ($-byteArray)   ;length of byte array
	
	qWordArray	dq	10h,20h,30h,40h,50h
	
	.len		equ ($-qWordArray)/8
	
	
	baPtr	 QWORD	byteArray			;A pointer which points to byteArray
	qaPtr	 QWORD	qwwordArray         ;A pointer which points to qwordArray
	
	
	
	

  
SECTION .bss

	FloatSave	resq	1
 
SECTION     .text
	global  _start
     
_start:

	push	welcomePrompt
	call	PrintString
	call	Printendl
	call	Printendl
	
	
	;looping
	mov		rcx,5				;Size of our array
	mov		rax,0				;clear register
	mov		rbx,0				;clear out our temporary register
	mov		rsi, byteArray		;Put the address of byteArray	into rsi
	
	addLoop:
	
		movzx	rax, BYTE[rsi]  ;mov a number at rsi into bl	
		add		rax,rbx         ;add that
		inc		rsi
	LOOP	addLoop
	addLoopExit:
	
	
	movzx 		rax, BYTE [byteArray+0]
	movzx		rax, BYTE [byteArray+1]
	
	;windows version
	;movzx		rax,BYTE PTR[byteArray+0]
	;movzx		rax,BYTE PTR byteArray ;as as above
 	;movzx		rax,BYTE PTR[byteArray+1]
	
	
	;In c++ will be 
	;----------------------
	;int* x = array
	;count<< *x<<endl;
	;x+=8
	
	
	;In window visual studio 
	;----------------------------
	
	;mov rsi, OFFSET byteArray
	
	;everything else will be the same
	
	mov			rsi,byteArray				;Esi 32bits
	movzx		rax, BYTE [rsi]				;Copies the first entry to rax
	inc			rsi							;Point to the second entry ;amother way is add rsi 1
	movzx		rax, BYTE [rsi]              ;Move the second entry into rax
	push		rax
	call		Print64bitNumHex
	call		Printendl
	
	;In window visual studio 
	;---------------------------
	
	;mov rsi, OFFSET qWordArray
	
	;everything else will be the same
	
	
	;Adding up all entries in the array using indirect
	
	mov		rax,	0
	mov		rbx,	0
	mov		rsi, byteArray
	movzx	rax, BYTE [rsi] 			;mov 10 into rax
	inc		rsi			
	mov		bl,[rsi]					;now increasement position
	
	;movzx	rbx,BYTE[rsi]
	
	add		rax, rbx
	inc		rsi
	mov		bl,[rsi]
	add		rax, rbx
	inc		rsi
	mov 	bl,[rsi]
	add		rax, rbx
	push	rax
	call	Print64bitNumHex
	call	Printendl
	
	mov			rsi, qWordArray					;Will contain the adddress the quad-word array
	mov			rax, QWORD [rsi]				;Copies the first entry into rax
	add			rsi, 8							;Point to th second quad-word array entry
	mov 		rax, QWORD [rsi]				;Copies	the secobd ebtry into rax
	push		rax
	call		Print64bitNumHex
	call		Printendl
	
	
	;Adding up all entries in the array using indexed
	;OFFSET is mean byte
	
	mov			rax,0
	mov			rbx,0
	mov			rsi,0    						;Put the offset from the begining of the array into rsi
	movzx		rax,BYTE [byteArray+rsi]		;copy 10 into rax; byteArray address+0
	add			rsi,1							;Position	oofset to the next value(20)
	mov			bl,[byteArray+rsi]				;Put 20 into bl
	add			rax,rbx							;Add 20 to rax
	push		rax
	call		Print64bitNumHex
	call		Printendl
	
	
	
	mov			rax,0
	mov			rbx,0
	mov			rsi,0  
	movzx		rax,BYTE [byteArray+rsi]		;copy 10 into rax; byteArray address+0
	inc			rsi,    						;Position	oofset to the next value(20)
	mov			bl,[byteArray+rsi]				;Put 20 into bl
	add			rax,rbx	
	push		rax
	call		Print64bitNumHex
	call		Printendl
	

	goodBye:
	push 	goodbyePrompt
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
