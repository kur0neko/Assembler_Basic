;
;This program will test out the functions library
;
;
;Include our external functions library functions
%include "./functions.inc"
 
SECTION .data
	openPrompt	db	"Welcome to my Program", 0dh, 0ah, 0h	;Prompt String
		.size	equ	$-openPrompt							;Length of Prompt String


	Array2dim 	dw 10h,20h,30h,40h,50h
				dw	60h,70h,80h,90h,100
				dw 110h,120h,130h,140h,150h
				dw	160h,170h,180h,190h,200h
				dw	210h,220h,230h,240h,250h
	.size		equ 2
	.numCols 	equ 5


 
SECTION .bss
 
SECTION     .text
	global      _start
     
_start:
	;
	;Display Program Header
    push	openPrompt			;The prompt address - argument #1
    push	openPrompt.size		;The size of the prompt string - argument #2
    call    PrintText


    ;formula 

    ;Address = ((numberof Cols * Row[number]) * size)+ ArrayAddress
    ;put Array2dim[3][2] into al (indirect method)
;
	;put array2dim [3][2] into al

	mov 	ebx,3
	mov 	eax, Array2dim.numCols			;number of columns
	mul 	ebx								;Multiply that by row number
	add 	eax, 2
	mov 	edx,Array2dim.size				;Add our columns number
	mul 	edx								;Multiply by the size of each entry in the array2im
	add 	eax, Array2dim 					;Add the address of our array
	mov 	esi, eax 						;put the address into esi
	mov 	ax, [esi] 						;put  value at that location into ax

	;put array2dim[3][2] into ax [indeed]

	mov 	eax, Array2dim.numCols  		;number of columns 	
	mov 	ebx,3
	mov 	eax, Array2dim.numCols			;number of columns
	mul 	ebx								;Multiply that by row number
	add 	eax, 2
	mov 	edx,Array2dim.size				;Add our columns number
	mul 	edx								;Multiply by the size of each entry in the array2im
	add 	eax, Array2dim 					;Add the address of our array
	mov 	esi, eax 						;put the address into esi
	mov 	ax, [Array2dim+esi] 			;put  value at that location into al

	;if in windows; mov ax, Array2dim[esi]












;Setup the registers for exit and poke the kernel
Exit: 
	mov		eax,sys_exit				;What are we going to do? Exit!
	mov		ebx,0						;Return code
	int		80h							;Poke the kernel
