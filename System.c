typedef char t_color;
void s_printf(char  ch,char color,int arr);
int cmain(void){
	t_color cr=0x30;
	char ch = '0';
	int i=0;
	int arr=0xb8000;
	while(arr+i<=0xb8fff){
	s_printf(ch,cr,arr+i);
	i+=2;
	}
	return 0;
}
