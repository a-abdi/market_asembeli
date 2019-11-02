        page 200,180      
title 'test1.asm'

CURSOR MACRO ROW,COLUMN 
   MOV DH,ROW
   MOV DL,COLUMN
   MOV AH,02h
   MOV BH,0h
   INT 10H
ENDM 

CIN MACRO STRING
    Mov dx,0000h 
    LEA DX, STRING
    MOV AH,0Ah
    INT 21H
ENDM

CINC MACRO 
     mov ah,01h
     int 21h
ENDM

COUT MACRO STR
     MOV AH,09H
     LEA DX,STR
     INT 21H
ENDM 

PG MACRO PGNO 
    MOV AH,00H
    MOV AL,PGNO
    INT 10H
ENDM

COPY MACRO L1,L2
     mov dl,l2
     mov l1,dl
ENDM  

clear_b MACRO 
    mov ax,0c01h
    int 21h    
ENDM   
datasg segment 'data' 
 j          db  ?
 i          db  ?
 w          dw  ? 
 a1         db  ?
 h          db  0  
 x2         db  ?
 true       db  0
 gg         dw  0
 false      db  0 
 true1      db  0
 bb         dw  0 
 dj1        Dw  ?
 dj2        Dw  ?
 dj3        Dw  0
 dj5        dw  0 
 dj6        dw  0
 r1         db  0
 r2         db  0 
 dj8        dw  0
 r_1        db  0
 z          dw  0
 za         dw  0 
 bx1        dw  0 
 
 nama       db  'name:             id:       cost:       number:        $'     

 array_i    db      50  dup(' '),'$'
 array_u    db      50  dup(' '),'$'
 array_c    db      50  dup(' '),'$'
 array_n    db      100 dup(' '),'$'
 
 index1     db      10  dup(' '),'$'
 index2     db      15  dup(' '),'$'
 bafer    label byte
 mx11       db      10
 ln11       db      ?
 b_b        db      10 dup(' '),'$' 
 
 nam      label byte
 mx1        db      10
 ln1        db      ?
 b_n        db      10 dup(' '),'$' 
 
 id       label   byte
 max2       db      5
 len2       db      ? 
 b_i        db      5 dup(' '),'$' 
 
 cost     label   byte
 max3       db      5
 len3       db      ?
 b_c        db      5 dup(' '),'$' 
   
 num   label   byte
 max4   db     5
 len4   db      ?
 b_u    db   5 dup(' '),'$'   
 p1     db   '_______________________________________$'
 p2     db   '²           ²       ²        ²        ²$'
 p3     db   '²  NAME     ²  ID   ²  COST  ² NUMBER ²$'
 p4     db   '²___________²_______²________²________²$'
 p5     db   '²           ²       ²        ²        ²$'
 p6     db   '²           ²       ²        ²        ²$'
 p7     db   '²___________²_______²________²________²$'
 
 p8     db   '                  CHOOSE A NUMBER FROM MENO:   $'
 p9     db   '__________________________________________________________$'
 p10    db   '²           ²         ²           ²          ²           ²$'
 p11    db   '² INSERT: 1 ² SHOW: 2 ² SEARCH: 3 ² DELET: 4 ²   EXIT: 5 ²$'
 p12    db   '²___________²_________²___________²__________²___________²$'
 
 p13    db   '___________________________$'
 p14    db   '²               ²         ²$'
 p15    db   '² GO TO MENO: 1 ² EXIT: 2 ²$'
 p16    db   '²_______________²_________²$'
 p17    db   'PLEASE CHOOSE:     $' 
 
 p19    db   '___________________________________________________$'
 p20    db   '²           ²           ²               ²         ²$'
 p21    db   '² SEARCH: 1 ² FACTOR: 2 ² GO TO MENO: 3 ² EXIT: 4 ²$'
 p22    db   '²___________²___________²_______________²_________²$' 
 
 p24    db   '_______________________________________________________$'
 p25    db   '²           ²               ²               ²         ²$'
 p26    db   '² DELETE: 1 ² ALL DELETE: 2 ² GO TO MENO: 3 ² EXIT: 4 ²$'
 p27    db   '²___________²_______________²_______________²_________²$' 
   
 p1_1   db   ' !!!! MEMORY IS FULL !!!!     $' 
 p1_3   db   'please Enter name:      $' 
 p1_4   db   'PLEASE ENTER ID DIGIT   $'
 p1_5   db   'ID IS REPLY PLEASE ENTER AGAIN$' 
 p1_6   db   'ID IS EMPTY ENTER ID$' 
 p1_7   db   'PLEASE ENTER ID OR NAME:            $' 
 p1_8   db   '!!! NO FOND DATA FOR DELETE !!!$'
 p1_9   db   '     !!! DATA DELETE !!!       $'
 p1_9_1 db   '   !!! DATA ALL DELETE !!!       $'
 p1_10  db   '  !!! SEARCH SUCCESSFULL !!!   $'
 p1_11  db   ' !!! SEARCH UNSUCCESSFULL !!!  $'
 p1_12  db   '!!! SEARCH ALREADY OUTANDOUT !!!$'
 p1_13  db   'please Enter cost      $' 
 p1_14  db   'please Enter number      $'
 p1_20  db   'TOTAL PRICE:$'
 p1_21  db   '!!! NO EXISTENT NUMBER KALA !!!   $'

 clear1 db   '    $'
 clear2 db   '         $'                                           
 clear3 db   '                                $' 
datasg ends
           
stacksg segment stack 'stack'
    DW 32h DUP(0) 
stacksg ends    
codesg segment 'code'
    assume cs:codesg,ds:datasg,ss:stack sg
main proc far  
     mov ax,datasg
     mov ds,ax
     
Start:
    PG  03
    call   clrscr  
    mov    i,6
    mov    j,11    
    cursor 1,7
    cout   p8          
    cursor 2,11
    cout   p9
    cursor 3,11
    cout   p10
    cursor 4,11
    cout   p11
    cursor 5,11
    cout   p12 
    jmp    one
one0:
    mov    dl,3
    add    dl,j
    cursor dl,25
    cout   p1_1      
one:
    cursor 1,7
    cout   p8
    cursor 1,52    
    clear_b  
    cmp al ,'1'
    je  part1
    cmp al ,'2'
    je  part2 
    cmp al ,'3'
    je  part3
    cmp al ,'4'
    je  part4
    cmp al ,'5'
    je  payan
    jmp start
 ;********************************************************************   
 part1: 
    mov di,0
    mov cx,0        
    cmp i,6
    jg  one1    
    cursor i,20
    inc    i
    cout   p1
    cursor i,20
    inc    i
    cout   p2
    cursor i,20
    inc    i
    cout   p3
    cursor i,20
    inc    i
    cout   p4
 one1:
    mov    dl,false
    cmp    dl,1
    je     one0  
    cursor i,20
    inc    i
    cout   p5
    cursor i,20
    inc    i
    cout   p6
    cursor i,20
    inc    i    
    cout   p7 
one15:     
    cursor j,22    
    cin    nam
    mov    dl,3
    add    dl,j
    cursor dl,24
    cout   clear3 
    mov    di,0 
    cmp    b_n[di],0Dh
    je     one14
    jmp    one8
one18:
    mov    dl,3
    add    dl,j
    cursor dl,29
    cout   p1_13
    jmp    one17     
one20:
    mov    dl,3
    add    dl,j
    cursor dl,29
    cout   p1_14
    jmp    one19         
one14:
    mov    dl,3
    add    dl,j
    cursor dl,29
    cout   p1_3
    jmp    one15 
    
one9:
    mov    dl,3
    add    dl,j
    cursor dl,29
    cout   p1_4
    jmp    one8 
one10:
    mov    dl,3
    add    dl,j
    cursor dl,25
    cout   p1_5 
    jmp    one8 
one11:
    mov    dl,3
    add    dl,j
    cursor dl,29
    cout   p1_6          
 one8:
    mov    x2,dl  
    mov    bx,0
    cursor j,34
    cout   clear1 
    cursor j,34
    cin    id 
    mov    dl,3
    add    dl,j
    cursor dl,24
    cout   clear3       
 one6:        
    cmp    b_i[bx],0Dh
    je     one7
    mov    dl,b_i[bx]
    call   digit
    cmp    dl,0
    je     one9
    copy   b_b[bx],b_i[bx]
    inc    bx
    jmp    one6
 one7:
    cmp    bx,0
    je     one11
    mov    b_b[bx],0Dh
    mov    bx,0
    mov    index1[bx],0Dh
    call   search_i
    mov    bx,0
    cmp    index1[bx],0Dh
    jne    one10
one17:           
    cursor j,42
    cin    cost
    mov    dl,3
    add    dl,j
    cursor dl,24
    cout   clear3 
    mov    di,0    
    cmp    b_c[di],0Dh
    je     one18
one19:          
    cursor j,51
    cin    num
    mov    dl,3
    add    dl,j
    cursor dl,24
    cout   clear3 
    mov    di,0
    cmp    b_u[di],0Dh
    je     one20 
    add    j,3
    call   insert
    cmp    j,23
    jge    start
    jmp    one
;******************************************************************************************    
part2:
    PG  03
    call   clrscr
    mov    cx,10 
    mov    si,0
    mov    dx,0
 l1_1:
    mov    index1[si],dl
    inc    si
    add    dl,5
    loop   l1_1      
    call   show
    cursor 18 ,50
    cout   p13
    cursor 19 ,50
    cout   p14
    cursor 20 ,50
    cout   p15
    cursor 21 ,50
    cout   p16
one4:
    cursor 23,55
    cout p17  
    
    cursor  23,69
    clear_b 
    cmp    al,'1'
    je     start
    cmp    al,'2'
    je     payan
    jmp    one4           
;********************************************************************************************
    part3:
    PG  03
    call   clrscr    
    mov    di,0 
    mov    dj5,0
    mov    dj6,0 
    mov    z,0 
    mov    r1,7
    mov    index2[di],0Dh
    mov    h,0 
    cursor h,9
    cout   p8
    inc     h
    cursor h,14
    cout   p19
    inc     h
    cursor h,14
    cout   p20
    inc     h
    cursor h,14
    cout   p21
    inc     h
    cursor h,14
    cout   p22
    inc     h 
    mov    gg,0
g1: 
    cursor 0,9
    cout   p8
    cursor 0,53
    clear_b 
    cmp    al,'1'
    je     part3_1
    cmp    al,'2'
    je     part5
    cmp    al,'3'
    je     start 
    cmp    al,'4'
    je     payan
    jmp    g1
part3_1:
    cmp    h,5
    jg     part3_2
    cursor  h,30
    cout    p1_7
    add    h,2
part3_2:
    mov    di,0
    cursor 5,56
    cout   clear2
    cursor 5,56
    cin    bafer 
    cursor 19,24
    cout   clear3
    cmp    b_b[di],0Dh
    je     part3_2
    mov    index1[di],0Dh
    mov    true,1
    mov    bx,0
    mov    dl,b_b[bx]
    call   digit
    cmp    dl,0
    jne    qqqq
    call   search_n
    mov    di,0
    cmp    index1[di],0Dh
    je     part3_3
    mov    si,0
    mov    bx,0
    jmp    part3_8
;***
part3_10:
    mov    index1[di],0DH  
    mov    bx,0 
    mov    true1,1
part3_8:    
    mov    di,bx
    cmp    index1[di],0Dh
    je     part3_7
    mov     dl,index1[di]
    mov    si,0
    inc    bx
part3_9:
    cmp    index2[si],0Dh
    je     part3_8
    cmp    dl,index2[si]
    je     shift   
    inc    si
    jmp    part3_9  
shift:
    cmp    index1[di+1],0Dh
    je     part3_10
    mov    dl,index1[di+1]
    mov    index1[di],dl
    inc    di
    jmp    shift
;***
part3_7:
    mov    bx,0
part3_12:
    cmp    index1[bx],0Dh
    je     part3_13
    mov    si,gg
    mov    dl,index1[bx]
    mov    index2[si],dl
    inc    gg
    inc    si
    inc    bx
    mov    index2[si],0Dh
    jmp    part3_12
part3_13:    
    call   show     
    jmp    part3_3
part3_15:
    mov    dl,true1
    cmp    dl,1
    je     part3_16
    cursor 19,24
    cout   p1_11
    jmp    g1
part3_16:
    mov    true1,0
    cursor 19,24
    cout   p1_12
    jmp    g1    
part3_3:       
    mov    true,0
    cmp    di,0
    je     part3_15
    cursor 19,24
    cout   p1_10
    jmp    g1 
;******************   
qqqq:
    call   search_i
    mov    di,0
    cmp    index1[di],0Dh
    je     part3_17
    mov    si,0
part3_6:
    cmp    index2[si],0Dh
    je     part3_5
    mov    dl,index2[si]
    cmp    index1[di],dl
    je     part3_18
    inc    si
    jmp    part3_6
part3_5:
    cursor 19,24
    cout   p1_10
    mov    si,gg
    mov    dl,index1[di]
    mov    index2[si],dl
    inc    gg
    inc    si
    mov    index2[si],0Dh
    call   show
part3_4:
    mov    true,0
    jmp    g1
part3_18:
    mov    true,0
    cursor 19,24
    cout   p1_12
    jmp    g1   
part3_17:
    mov    true,0
    cursor 19,24
    cout   p1_11
    jmp    g1 
;********************************************************************************************  
 part4:
       PG  03
       call   clrscr             
       cursor 1,8
       cout   p8
       cursor 2,15
       cout   p24
       cursor 3,15
       cout   p25
       cursor 4,15
       cout   p26
       cursor 5,15
       cout   p27
       jmp    part4_4 
part4_3:
       cmp    di,0
       jne    part4_4
       cursor 12,25
       cout   p1_8
part4_4:
       cursor 1,8
       cout   p8 
       mov    di,0 
       mov    index1[di],0Dh      
       cursor 1,53          
       clear_b 
       cmp   al,'1'
       je    part4_1
       cmp   al,'2'
       je    part4_5
       cmp   al,'3'
       je    start 
       cmp   al,'4'
       je    payan 
       jmp   part4_4
part4_1:
       cursor 12,25 
       cout   clear3      
       cursor 7,27
       cout   p1_7
       cursor 7,52
       cin    bafer
       mov    di,0
       mov    dl,b_b[di]
       call   digit
       cmp    dl,0
       jne    s_i 
       call   search_n
       mov    di,0
part4_2:    
       cmp    index1[di],0Dh
       je     part4_3
       mov    bx,0
       mov    bl,index1[di]
       inc    di
       mov    array_i[bx],' '
       mov    si,ax
       mov    array_n[si],' '
       mov    false,0
       cursor 12,25 
       cout   p1_9
       jmp    part4_2
s_i:         
       call   search_i
       mov    di,0
       cmp    index1[di],0Dh
       je     part4_3
       mov    bx,0         
       mov    bl,index1[di]
       mov    si,ax
       mov    array_i[bx],' '
       mov    array_n[si],' '
       mov    false,0
       cursor 12,25 
       cout   p1_9
       jmp    part4_4 
part4_5:
       mov    si,0 
       mov    cx,10
       mov    di,0
       mov    false,0
part4_6:
       mov    array_i[di],' '
       mov    array_n[si],' '
       add    di,5  
       add    si,10
       loop   part4_6 
       cursor 12,25 
       cout   p1_9_1           
       jmp    part4_4 
;******************************************************************************************  
 part5:                                               
part5_1:              
       mov    di,z
       cmp    index2[di],0Dh
       je     part5_3
       mov    dh,0
       mov    dl,index2[di]
       mov    si,dx
       mov    bb,si    ;daron si adrac factor   
       call   adad_c   ;tabdil cost be adad zakhira dar bx
       mov    dj1,bx
       mov    si,bb
       call   adad_u 
       call   sub_num
       mov    bx,dj2
       mov    r2,77
       call   strin 
       inc    r1
       mov    dl,0
       add    dl,5
       mov    dx,dj1
       add    dx,dj5 
       mov    dj5,dx
       jnc    part5_2
       add    dj6,1 
part5_2:
       mov    dx,dj2
       add    dx,dj6 
       mov    dj6,dx
       jmp    part5_1
part5_3:
       cursor 19,24
       cout   clear3
       mov    za,1
       mov    dx,dj6
       mov    ax,dj5
       mov    cx,10000
       div    cx 
       mov    dj2,dx
       mov    dj8,ax
       mov    r_1,49       
       cursor 19,24
       cout   p1_20       
       mov    ax,dj2
       mov    cx,4 
       mov    bx1,10
       call   strin1
       mov    ax,dj8
       mov    cx,4
       call   strin1
       mov    za,0                     
       jmp    g1

;********************************************************************************************
payan: 
      mov    ax,4c00h
      int    21h
    PG  03
    call   clrscr
    
 ret    
main Endp
;********************************************************************************************
insert proc near        
    mov  bx,0     
src1:  
    cmp  array_i[bx],' '
    je   ded
    add  bx,5
    cmp  bx,45
    jg   dd1
    jmp  src1   
dd1:       
    mov    false,1  
    jmp    k5 
ded:
    mov  false,0        
    mov  di,0
    mov  si,bx                            
y1:
    mov  dl,b_i[di]
    cmp  dl,0Dh
    je   k1   
    copy array_i[si],b_i[di] 
    inc  si   
    inc  di
    jmp  y1
 k1:
    mov  array_i[si],'$'           
    mov  di,0
    mov  si,bx 
y2:
    mov  dl,b_c[di]
    cmp  dl,0Dh
    je   k2
    call digit
    cmp  dl,0
    je   e2
    copy array_c[si],b_c[di] 
    inc  si
 e2:   
    inc  di
    jmp  y2
 k2:
    mov  array_c[si],'$'          
    mov  di,0
    mov  si,bx
y3:
    mov  dl,b_u[di]
    cmp  dl,0Dh
    je   k3
    call digit
    cmp  dl,0
    je   e3
    copy array_u[si],b_u[di] 
    inc  si
 e3:   
    inc  di
    jmp  y3
 k3:
    mov  array_u[si],'$'   
    mov  ax,0      
    mov  di,0 
    mov  dl,2
    mov  ax,bx
    mul  dl
    mov  si,ax 
y4:
    mov  dl,b_n[di]
    cmp  dl,0Dh
    je   k4
    call alfa
    cmp  dl,0
    je   e4
    copy array_n[si],b_n[di] 
    inc  si
 e4:   
    inc  di
    jmp  y4
 k4:
    mov  array_n[si],'$'
 k5:             
 ret         
insert endp   
;*******************************************     
digit proc near
   cmp dl,'0'   
   jl  v1        
   cmp dl,'9'     
   jg  v1                   
   jmp v2            
v1:                   
   mov dl,0            
v2:                     
ret
digit endp        
;******************************************
alfa proc near      
   cmp dl,'A'   
   jl  v3        
   cmp dl,'Z'     
   jle v4          
   cmp dl,'z'       
   jg  v3                       
   cmp dl,'a'         
   jge v4                                              
v3:                     
   mov dl,0              
v4:                       
ret
alfa endp
;*****************************************
show proc near   
     mov i ,0
     mov cx,10
     mov bx,0 
     cmp true,1
     jne part2_1
     mov dl,h
     mov i,dl               
part2_1:
     cmp index1[bx],0Dh
     je  q1
     mov dx,0
     mov dl,index1[bx]
     mov di,dx
     mov ax,0
     mov ax,di
     mov dl,2
     mul dl
     mov si,ax
     inc bx                     
     cmp array_i[di],' '     
     je  part2_2 
     cmp array_i[di],'$'     
     je  part2_2 
     cursor i,15                  
     cout   nama        
     cursor i,21   
     cout   array_n[si]     
     cursor  i,37
     cout   array_i[di]
     cursor  i,49 
     cout   array_c[di]
     cursor  i,63 
     cout   array_u[di]
     inc    i
part2_2:   
     loop part2_1
q1:  
     mov dl,i 
     mov h,dl
     mov dl,true
     mov i,dl
     mov true,0         
ret
show endp  
;********************************************************************************************* 
 clrscr proc near
    mov ax,0600h
    mov bh,0fh
    mov cx,0000
    mov dx,184fh
    int 10h
    ret   
  clrscr endp  
;*********************************************************************************************
 search_i proc near      
     mov    bx,0
     mov    di,0
     mov    si,0
     mov    ax,0
     
t1:  
     cmp    b_b[di],0Dh
     je     t2 
     mov    dl,array_i[si]
     cmp    b_b[di],dl
     jne    t3
     inc    di
     inc    si
     jmp    t1
t2:  
     cmp    array_i[si],'$'
     jne    t3
     mov    index1[bx],al          
     inc    bx
     mov    index1[bx],0Dh
     jmp    te     
t3:                    
     add    ax,5 
     mov    si,ax
     mov    di,0 
     cmp    ax,49
     jl     t1
te:                 
ret
search_i endp  
;************************************************************************************ 
 search_n proc near     
     mov    bx,0
     mov    di,0
     mov    si,0
     mov    ax,0 
     mov    cl,0
t4:  
     cmp    b_b[di],0Dh
     je     t5 
     mov    dl,array_n[si]
     cmp    b_b[di],dl
     jne    t6
     inc    di
     inc    si
     jmp    t4
t5:  
     cmp    array_n[si],'$'
     jne    t6 
     mov    index1[bx],cl
     inc    bx 
     mov    index1[bx],0Dh     
t6:                    
     add    ax,10
     add    cl,5 
     mov    si,ax
     mov    di,0 
     cmp    cl,49
     jl     t4       
ret
search_n endp 

;************************************************************************************
adad_c proc near        ;tabdil cost be adad
     mov  ax,0
     mov  dx,0
     mov  bx,0
x12: 
     mov  bx,ax              
     mov  dl,array_c[si]
     sub  dl,30h          
     add  bx,dx
     inc  si
     cmp  array_c[si],'$'
     je   x13 
     mov  ah,0
     mov  al,10   
     mul  bx
     jmp  x12
x13:         
ret
adad_c endp       
;************************************************************************************
adad_u proc near         ;tabdil number be adad
      mov  ax,0
      mov  dx,0 
      mov  bx,0
x16: 
      mov  bx,ax              
      mov  dl,array_u[si]
      sub  dl,30h          
      add  bx,dx
      inc  si
      cmp  array_u[si],'$'
      je   x15 
      mov  ah,0
      mov  al,10     
      mul  bx
      jmp  x16
x15:         
ret
adad_u endp 
;************************************************************************************
strin proc near     ;zarb do adad
       mov  ax,bx
       mul  dj1
       mov  dj1,ax
       mov  dj2,dx
       mov  cx,10000
       div  cx 
       mov  bx1,10
       mov  dj8,ax
       mov  ax,dx 
       mov  cx,4 
       call strin1
       mov  cx,4 
       mov  ax,dj8
       call strin1 
                      
ret      
strin endp
;************************************************************************************ 
strin1 proc near   ;chap adad
strin1_2:    
       mov  dx,0      
       div  bx1
       mov  dj3,ax
       mov  ah,2h
       add  dl,30h
       mov  bl,dl
       cursor r1,r2
       cmp  za,1
       jne  ggggg       
       cursor 19,r_1
       dec    r_1
ggggg:       
       mov  dl,bl
       int  21h
       dec  r2
       mov  ax,dj3
       loop strin1_2
strin1_1:          
ret
strin1 endp
;************************************************************************************
sub_num proc near       ;sub number and store
        mov    dj2,bx
x26:                
        cursor r1,63
        cout   clear1
        cursor r1,63
        cin    num
        mov    ax,0
        mov    dx,0 
        mov    bx,0
        mov    si,0
x20: 
        mov    bx,ax              
        mov    dl,b_u[si]
        sub    dl,30h          
        add    bx,dx
        inc    si
        cmp    b_u[si],0Dh
        je     x21 
        mov    ah,0
        mov    al,10     
        mul    bx
        jmp    x20
x21:    
        mov    ax,dj2
        sub    ax,bx        
        cmp    ax,0
        jl     x23
        mov    dj2,bx        
        mov    di,z
        mov    cl,index2[di]
        mov    ch,0                               
        mov    bx1,cx
        mov    di,bx1
        mov    dx,0
x22:                   
        mov    bx,10    
        div    bx       
        add    dl,30h
        mov    array_u[di],dl
        inc    bx1 
        mov    di,bx1
        cmp    ax,0
        je     x24
       
x25:    
        mov    si,di
        copy   array_u[di],array_u[si-1] 
        dec    di 
        cmp    di,cx        
        jg     x25 
        mov    dx,0
        jmp    x22        
x23:    
        cursor 19,24
        cout   p1_21
        jmp    x26         
x24:    
        inc    z
        mov    array_u[di],'$'   
ret
sub_num endp
;************************************************************************************    
codesg Ends
end main