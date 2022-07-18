bits 16; 
org 0x7c00; 指示起始地址
	mov ah,0x0e ; al tty打印字符，光标自动后移
	mov al,'@' ;打印字符
	int 0x10  ; int 0x10 INT中断
	mov ah,0x02; 移动光标 IN10
	mov bh,0x00; bh决定页码
	mov dx,0x11; dx决定行列
	int 0x10 ;开始中断
	mov ah,0x0e;
	mov al,'#'
	int 0x10
times 510-($-$$) db 0;添加0
dw 0xaa55
