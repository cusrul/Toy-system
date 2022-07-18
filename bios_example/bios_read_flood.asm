bits 16;
org 0x7c00;
	mov si,enter;	
	call .printf_string; text prinf string,use function--> .printf_string
	call .load;
	jmp	0x1000:0;


.stop:			;loop for stop this computer
	jmp .stop; 



.printf_string:  ;printf-string-function:need si=string addr; 

._printf_f_loop:
	mov ah,0x0e;
	mov al,[si];
	cmp al,0;
	je .pop_sp; 
	int 0x10;
	inc si;
	jmp ._printf_f_loop;
.pop_sp:	;use reture prevous function,not need parmar
	ret;
.enter_string:		;function enter_string enter <=50 byte ,save in string_buffer
	mov si,string_buffer+2; +2 because enter need jump "enter"
._enter_f_loop:
	mov ah,0x00;
	int 0x16;
	cmp al,'=';
	je .pop_sp; return prevous function;
	mov ah,0x0e;
	int 0x10;
	mov [si],al;
	add si,1;
	jmp ._enter_f_loop;

.load:
mov dx,0x0000 ;dh->磁头号,dl->驱动器号
mov ax,0x1000
mov es,ax
xor bx,bx ;es:bx->the data   0x1000:0000
mov ch,0 ;ch->磁道号
mov cl,2 ;cl->起始扇区号
mov ah,02h ;param
mov al,01h ;how many blocks to read
int 13h
ret;
enter:db 0x0a,"this is first step in building system:enter 512 byte in momery",0x0d,0x0a,"enter = when complete",0xd,0xa,"start input:",0xd,0xa,0
enter_is_work: db "this enter is good running",0
string_buffer: 
db 0xa,0xd;
times 50 db 0; this is the enter_buffer end;
enter_successful: db 0xd,0xa,"enter is run",0;
times 510-($-$$) db 0;
dw 0xaa55;
	mov ah,0x0e;
	mov al,'n';
	int 0x10;
	mov ah,0x0e;
	mov al,'s';
	int 0x10;
