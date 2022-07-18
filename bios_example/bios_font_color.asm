bits 16;
org 0x7c00; 指示起始地址 
	mov ah,0x09 ; al tty打印字符，光标自动后移
	mov al,'b' ; 字符
	mov bh,0x00;行
	mov bl,0x01;列
	mov cx,0x0010;输出次数
	int 0x10;
times 510-($-$$) db 0
dw 0xaa55
