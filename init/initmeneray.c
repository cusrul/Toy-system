#include <global_def>
void mov_u16(char a,char b,int c);
void initmeneray(){
    initpage();
}


int initpage(){
    
    init_PDT();
    add_system_PDT();
    return 0;
}


int init_PDT(void){
char ch=0,cl=0;
    for(int i=0x0;i<0xffff;){
        mov_u16(ch,cl,PDT+i);
        i+=2;
    }
    return 0;
}

int add_system_PDT(){
    char ech,ecl,ch,cl;
    ech =0x00; //base 32-12
    ecl =0x02;
    ch=0x10;
    cl=0b00000011;
    mov_u16(cl,ch,PDT);
    mov_u16(ecl,ech,PDT+2);
    return 0;
}
int sys_logo_print(){
	char ch=0x30;
	char cl = '#';
	int i=0;
	int arr=0xb8000;
	while(arr+i<=0xb8fff){
	mov_u16(cl,ch,arr+i);
	i+=2;
    
	}
   return 1;
}
