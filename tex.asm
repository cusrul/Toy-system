global mov_u16
[section .data]
[section .text]

mov_u16:
    mov   al, [esp+4]   ; argument 1
    mov   ah,[esp+8]
    mov   ebx,[esp+12]
    mov  byte [ebx],al;
    mov  byte [ebx+1],ah;
    ret
