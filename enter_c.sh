#bin/bosh
nasm -f elf32 tex.asm -o tex.o
gcc -c System.c -m32 -o System.o
ld   -o System.bin -T ld_sprit.lsd -m elf_i386 -Bstatic -Ttext 0x1000 System.o tex.o
dd if=System.bin of=text.img bs=512 seek=1 skip=16 count=1
