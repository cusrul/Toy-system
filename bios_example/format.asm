bits 16; 
org 0x7c00; 指示起始地址
times 510-($-$$) db 0;添加0
dw 0xaa55
