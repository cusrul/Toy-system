bits 16
org 0x7c00;
	mov si,enter_is_work;	
	call printf_string;
.stop:			;loop for stop this computer
	jmp .stop; 

%include "printf_string.o"

enter: db "this is a text for nasm",0;
enter_is_work: db "this enter is good running",0
string_buffer: 
db 0xa,0xd;
times 50 db 0; this is the enter_buffer end;
enter_successful: db 0xd,0xa,"enter is run",0;
times 510-($-$$) db 0;
dw 0xaa55;
