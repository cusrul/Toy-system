global init_sp
[section .data]
[section .text]

init_sp:
    mov eax,cs;
    mov ds,eax;
    mov ss,eax;
    
    ret
