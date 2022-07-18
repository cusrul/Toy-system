bits 32;
org 0x1000
  	push   ebp
  	mov    ebp,esp
  	sub    esp,0x18
  	call   [0x1041] 
  	add    eax,0x3d
  	mov    DWORD   [ebp-0x14],0x1
  	mov    DWORD   [ebp-0x10],0x2
  	mov    edx,DWORD   [ebp-0x14]
  	mov    eax,DWORD   [ebp-0x10]
  	add    eax,edx
  	mov    DWORD   [ebp-0xc],eax
  	call  	[0x1031]
  	nop
  	leave  
  	ret    


  	push   ebp
  	mov    ebp,esp
  	call   [0x1041]
  	add    eax,0xf
  	nop
  	pop    ebp
  	ret    


  	mov    eax,DWORD   [esp]
  	ret    
