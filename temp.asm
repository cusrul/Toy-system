bits 16;
org 0x7c00;


	mov ax,0xb800
	mov es,ax
	 mov byte [0xb800],'L'
         mov byte [0xb801],0x07
         mov byte [0xb802],'a'
         mov byte [0xb803],0x07
    mov ah,0x0e;
	mov al,'a'
	int 0x10;
	jmp $

	mov si,system_start;
	call printf_string;


	
	

;//get disk information;

;//system_run  flag
mov dx,0x0000 ;dh->磁头号,dl->驱动器号
mov ax,0x0000
mov es,ax
mov bx,0x1000 ;es:bx->the data   0x1000:0000
mov ch,0 ;ch->磁道号
mov cl,2 ;cl->起始扇区号
mov ah,02h ;param
mov al,01h ;how many blocks to read
int 13h
	
;//load disk  flag;
	mov ax,1000;
	
	mov si,disk_load_finsh;
	call printf_string;

	
	mov si,0;  
	mov ah,01h;get disk nember that can use;
	int 13H;
	mov [ds:0x9000+si],al; this is main disk number;  
	inc si
	mov ah,08h;
	int 13h;
	mov [ds:0x9000+si],bl; this is disk [si]ze; 2H 1.2M  03H 720k 04H 1.44M -1
	inc si
	mov [ds:0x9000+si],ch; cylinder low 8 byte; -2
	inc si
	mov [ds:0x9000+si],cl; cl 7-6 byte is cylinfer hight 2 byte; 0-5 is sector number; -3
	inc si
	mov [ds:0x9000+si],dh;head number; -4
	inc si
	mov [ds:0x9000+si],dl; disk num; -5
	push si;

	mov si,get_screen_information;
	call printf_string;
	; start get screen information;
	pop si;
	inc si;
	mov ah,0fh;
	int 10h;
	mov [ds:0x9000+si],al; al is the screen model; -6
	inc si;
	mov [ds:0x9000+si],bh; bh is the now page;  -7
	inc si;
	mov [ds:0x9000+si],ah ;the nember of rows about screen; -8


	
;	mov si,0;
;	mov cx,32;
;.move_gdt_form:
;	mov ah,[ds:GDT_form+si]
;	mov [ds:0x9800+si],ah;
;	inc si; 
;	loop	.move_gdt_form;
;//move gdt to 0x9800;

	mov si,move_gdt_close_int;	
	call printf_string; text prinf string,use function--> .printf_string
	
	
	
	mov ax,0;
	mov ds,ax;	
	cli;	
	pusha;

	lgdt [lgdt]
	popa;
	
	
	mov al,0xdd;
	out 0x64,al;
	
	
	mov eax,cr0
	or eax,0x1;
	mov cr0,eax;
	jmp dword 0x0008:0x1000
	



	


	



	
	

printf_char:
this:
	mov al,es:si;	
	mov ah,0x0e;
	add al,'0';
	int 0x10;
	inc si;
	loop this;
	jmp pop_sp;




%include "printf_string.o"
%include "disk_load.o"
%include "enter_string.o"
%include "enter.o"
%include "pop_sp.o"
hware: dw 0x9000 ;hardware address;0x90000


;// GDT_form  init;
GDT_form: 
dw 0,0,0,0 ; thie first GDT_form ,this is must empty;
dw 0x07ff ;limit 8M
dw 0x0000; base add;
dw 0x9a00; code read/exec
dw 0x00c0; granularity=4096;

dw 0x07ff ;limit 8M
dw 0x0000; base add;
dw 0x9200; code read/write
dw 0x00c0; granularity=

dw 0x7cff ; Limit (bits 0-15)
dw 0x0 ; Base (bits 0-15)
db 0x0 ; Base (bits 16-23)
db 10010010b ; Access Byte
db 01000000b ; Flags , Limit (bits 16-19)
db 0x0 ; Base (bits 24-31)
GDT_EDN:
lgdt:
	dw GDT_EDN-GDT_form-1;
	dd GDT_form;
system_start:db 0xa,0xd,"system_started;",0
get_screen_information:db 0xa,0xd,"getting screen information;",0
move_gdt_close_int:db 0xa,0xd,"moved gdt finshed",0

disk_load_finsh:db 0xa,0xd,"the disk load is finsh;",0
enter_is_work: db "this enter is good running",0
string_buffer: times 50 db 0; this is the enter_buffer end;
enter_successful: db 0xd,0xa,"enter is run",0;
times 510-($-$$) db 0;
dw 0xaa55;
