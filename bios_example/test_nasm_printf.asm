org 0x7c00
.printf_string:
._printf_f_loop:
        mov ah,0x0e;
        mov al,[si];
        cmp al,0;
        je .pop_sp; 
        int 0x10;
        inc si;
        jmp ._printf_f_loop;
.pop_sp:        ;use reture prevous function,not need parmar
        ret;

