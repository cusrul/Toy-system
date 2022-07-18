#include <stdio.h>
#include <string.h>
#include <stdlib.h>



int main(void){
     FILE *file = fopen("/home/ubuntu/myos/gcc.bin", "r");
     FILE *swap_file = fopen("/home/ubuntu/myos/swap.bin", "w");
     if(swap_file == NULL)
    {
        printf("swap_file open error!\n");
        return 0;
    }
    if(file == NULL)
    {
        printf("open error!\n");
        return 0;
    }
     char c;
    
   
    int i=0;
    
    while((c = fgetc(file)) != EOF)
    {
       unsigned char  head,end,temp;
        end=c;
        head=c;
        end=end>>4;
        head=head*16;
        temp=end|head;
        fprintf(swap_file,"%c",temp);
        
    }
    fclose(file);
    fclose(swap_file);
    printf("%ld",sizeof( unsigned char ));
    return 0;

}
