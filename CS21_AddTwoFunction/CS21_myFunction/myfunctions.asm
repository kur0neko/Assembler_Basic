global	addTwo

addTwo:
	nop

	mov	rax,[esp+16]
	mov rdx,[esp+24]
	add	rax,rdx

	ret
	
				
	
;
;Setup the registers for exit and poke the kernel
;Exit: 
