bits 16; 
org 0x7c00; 指示起始地址
start:
	mov ah,0x00;
	mov int 0x16;
	mov ah,0x0e;
	int 0x10;	
	jmp start
times 510-($-$$) db 0;添加0
dw 0xaa55
