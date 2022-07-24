.PHONY: start

start: tex.o init_sp.o System.o System.bin
		
		
		
		 
		
tex.o: tex.asm
		nasm -f elf32 tex.asm -o tex.o
init_sp.o:asm_enable_page.asm
		nasm -f elf32	asm_enable_page.asm -o asm_enable_page.o
System.o:System.c init/initmeneray.c init/initmeneray.h inc/meneray.h 
		gcc -c System.c -m32 -o System.o  -Iinc -ffunction-sections
System.bin:System.o tex.o init_sp.o
		ld   -o System.bin -T ld_sprit.lsd -m elf_i386  -Ttext 0x1000 System.o tex.o asm_enable_page.o 
		dd if=System.bin of=text.img bs=512 seek=1 skip=8 count=144