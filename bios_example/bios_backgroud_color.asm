bits 16; 
org 0x7c00; 指示起始地址
	mov ah,0x0b; 修改背景色
	mov bx,0x0039; 背景色
	int 0x10;
times 510-($-$$) db 0;添加0
dw 0xaa55
