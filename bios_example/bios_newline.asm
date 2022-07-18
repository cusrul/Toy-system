bits 16; 
org 0x7c00; 指示起始地址
	mov si,string;
.print_string:	
	mov ah,0x0e ; al tty打印字符，光标自动后移
	mov al,[si];
	cmp al,0;
	je .jin;
	int 0x10  ; int 0x10 INT中断
	add si,1;
	jmp .print_string ;
.jin:
.loop:
	jmp .loop
string: db 0x0a,0x0a,"hello!\n this is newline###",0xa,"this is newline",0x0a,0
times 510-($-$$) db 0;添加0
dw 0xaa55
