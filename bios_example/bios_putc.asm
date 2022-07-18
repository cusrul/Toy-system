bits 16; 
org 0x7c00; 指示起始地址
	mov ah,0x0e ; al tty打印字符，光标自动后移
	mov al,'@' ;打印字符
	int 0x10  ; int 0x10 INT中断
times 510-($-$$) db 0;添加0
dw 0xaa55
