.intel_syntax noprefix
.bits 32
	
.global asm1

asm1:
	push	ebp
	mov	ebp,esp
	cmp	DWORD PTR [ebp+0x8],0xde ; = False
	jg 	part_a		; if 0xcd > 0xde = True goto part_a
	cmp	DWORD PTR [ebp+0x8],0x8  ; = True
	jne	part_b		; if 0xcd != 0x8 = True goto part_b
	mov	eax,DWORD PTR [ebp+0x8]
	add	eax,0x3
	jmp	part_d
part_a:
	cmp	DWORD PTR [ebp+0x8],0x4e
	jne	part_c
	mov	eax,DWORD PTR [ebp+0x8]
	sub	eax,0x3
	jmp	part_d
part_b:
	mov	eax,DWORD PTR [ebp+0x8] ; eax = 0xcd
	sub	eax,0x3		; eax -= 0x3 = 0xca
	jmp	part_d		; go to part_d.. dont worry about part_c
	cmp	DWORD PTR [ebp+0x8],0xee  ; = True
	jne	part_c 		; if 0xcd != 0xee = True goto part_c
	mov	eax,DWORD PTR [ebp+0x8]
	sub	eax,0x3
	jmp	part_d
part_c:
	mov	eax,DWORD PTR [ebp+0x8]	; eax = 0xcd
	add	eax,0x3		; 0xcd += 0x3
part_d:
	pop	ebp
	ret
