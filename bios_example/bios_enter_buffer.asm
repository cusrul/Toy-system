bits 16; 
org 0x7c00; 指示起始地址
	mov si,buffer;
start:
	mov ah,0x00;
	int 0x16;
	cmp al,'=';
	je  stop;
	mov ah,0x0e;
	int 0x10;
	mov [si],al;
	add si,1;
	jmp start;
stop:
	
	mov ah,0x0e;
	mov si,buffer_start;
loop:
	mov ah,0x0e;
	mov al,[si];
	int 0x10;
	cmp al,0;
	je  end;
	add si,1;
	jmp loop;



end:
end_loop:
	jmp end_loop;
buffer_start: db "this is buffer:"
buffer:times 50 db 0;
times 510-($-$$) db 0;添加0
dw 0xaa55
