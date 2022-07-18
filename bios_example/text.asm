org 07c00h
    mov ax, cs
    mov ds, ax
call welcome_words
call load_os
jmp os
welcome_words:
	mov ax,boot_message
	mov bp,ax                             ;bp存储需要显示的字符串的起始地址
	mov cx,boot_message_length            ;cx存储要显示的字符串的长度
	mov ax,01301h                         ;ah=13h,是int 10h中断的参数之一,al=01h,标识输出方式
	mov bx,000ah                          ;bh为页码,bl为颜色
	mov dx,0d00h                          ;dx为显示位置坐标,0d行,0列
	int 10h
	ret
load_os:
	mov ah,02h                            ;读磁盘扇区
	mov al,01h                            ;读取1个扇区
	mov ch,00h                            ;起始磁道
	mov cl,02h                            ;起始扇区
	mov dh,00h                            ;磁头号
	mov dl,00h                            ;驱动器号
	mov bx,os                             ;存储缓冲区
	int 13h
	ret
boot_message:
	db "[Boot]modu os"
	db 0dh,0ah                            ;换行
	db "[Boot]loading..."
boot_message_length equ $-boot_message    ;计算字符串长度
times 510-($-$$) db 0                     ;填充至510byte
dw 0xaa55                                 ;引导扇区标识,至此文件大小为512byte

os:
	call os_say_hello
	jmp $
os_say_hello:
	mov ax,os_message
	mov bp,ax
	mov cx,os_message_length
	mov ax,01301h
	mov bx,000eh
	mov dx,1000h
	int 10h
	ret
os_message:
	db "[OS]os loaded"
	db 0dh,0ah
	db "[OS]happy using"
os_message_length equ $-os_message
times 1022-($-$$) db 0


