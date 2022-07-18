nasm -f bin -o loader.bin loader.asm
dd if=loader.bin of=text.img bs=512 seek=1  count=100 conv=notrunc
