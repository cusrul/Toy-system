global asm_enable_page
[section .data]
[section .text]

asm_enable_page:
    mov eax,0x00020000;
    mov cr3,eax;
    mov eax,cr0;
    or eax,0x80000000;
    mov cr0,eax;
    ret
