bits 16;
org 0x7c00;
	mov si,enter;	
	call printf_string; text prinf string,use function--> .printf_string
	call disk_load;
	jmp	0x1000:0;


.stop:			;loop for stop this computer
	jmp .stop; 
%include "printf_string.o"
%include "disk_load.o"

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
