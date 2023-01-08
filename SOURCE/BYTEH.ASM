; ByteHunter by Nop & The_Q    -  Use this prog freely
; __________________________________________________________________________


Org  100h

Start:
  Jmp Main


text_title db "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿",0ah,0dh


SBuff       dw 0
MaxOff      dw 0                        ;Maximun offset
COff        dw 0                        ;Current offset
Off         dw 0
FSeg        dw 0
found       db 0
handle      dw 0
Str2Search  dw 0
str2Put     dw 0

about   db 0dh                              ;let that and don't be a lamer
        db "ÚÄÄÄÄÄ  Phrozen Crew  ÄÄÄÄÄ¿",0dh
        db "³ Byte Hunter by nOP & THE_q ³",0dh
        db "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ",0dh

text_openingA  db ' ş OPENiNG FiLE : [ $'
text_openingB  db ' ]',0dh,0ah,'$'
text_searching db ' ş SEARCHiNG PROGRESS: $'
text_patched   db 0Dh,0ah,' ş PATCHED!',0dh,0ah,'$'
text_closing   db ' ş CLOSiNG FiLE',0dh,0ah,0dh,0ah,'$'
text_quit      db ' ş PRESS A KEY TO EXiT',0dh,0ah,'$'
error1         db ' ş ERROR : FiLE NOT FOUND!',0dh,0ah,'$'
error2         db 0Dh,0ah,' ş ERROR: BYTES NOT FOUND',0dh,0ah,'$'
point          db 'úúú$'



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                   M A I N     P R O C E D U R E S                      ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Do_Search:

        Mov dx,Maxoff
        mov ax,Coff
        Sub dx,ax
        Mov word ptr FSEG,DX             ;off=Maxoff-Coff

        Xor bx,bx

        mov si,str2search
        Lodsb
        mov bl,al                      ;bl with Str2search size

        mov CX,word ptr SBuff          ;Size of buffer
        Lea di,Buffer

        Lodsb                   ;First byte in Str2Search
Loc4:   Repnz Scasb

        Cmp cx, 0                        ;Case not found
        jnz Loc3

Loc6:   mov bx,[handle]                         ;file handle

        mov cx,word ptr FSEG

        mov ax,Sbuff
        Cmp ax,7fffh
        jz j2
        mov ax,8001h
        jmp j3

    j2: xor ax,ax
        inc cx

    j3: mov dx,ax
        mov ax,4200h
        int 21h                         ;restore file position

        mov bx,[handle]                 ;file handle
        mov al,[found]                  ; return value
        RET

j_gate: Jmp Loc6


Loc3:
        push ax                         ;Save current location_in_buffer
        push di
        push cx                         ;Save the first byte in str2search

        mov cx,bx
        dec cx                          ;skip the first byte,we know it match

Loc2:   Lodsb
        cmp al,'?'
        jz Loc7
        Mov ah,[di]
        Cmp ah,al
        jnz Loc1

Loc7:   Dec cx
        jz Loc5
        inc di
        jmp Loc2


Loc5:
        pop cx
        push cx

        mov ax,Sbuff
        Cmp ax,7fffh
        jnz j1
        add ax,8001h

  j1:   sub ax,cx                       ;Off=Sbuff-CX-BX
                                        ;If Sbuff=0fff then Off:=Off+f000
        dec ax
        Mov word ptr OFF,AX

        mov ax,4200h
        mov bx,[handle]                 ;file handle
        mov cx,word ptr FSEG
        mov dx,word ptr OFF
        int 21h                         ;move file loc to replace

        xor cx,cx

        mov ah,40h
        mov si,Str2Put
        mov cl,byte ptr [si]
        inc si
        mov dx,si
        int 21h                         ;write rep bytes

        inc Byte ptr [Found]

Loc1:
        mov si,str2search
        add si,2
        pop cx
        pop di
        pop ax

        cmp Byte ptr found,1
        jz j_gate
        Jmp Loc4



GoForIt:
;;;; FUNCTION
;;;; AX = point to String to search
;;;; BX = point to String to put
;;;; DX = FileName

        mov Str2search,ax
        mov str2put,bx
        push dx
        mov si,dx

        mov ah,9
        lea dx,text_openingA
        int 21h

        mov ah,2
Msg1:   lodsb
        cmp al,0
        jz Msg2
        mov dl,al
        int 21h
        jmp Msg1
Msg2:
        mov ah,9
        lea dx,text_openingB
        int 21h

; ş Open File
        mov ax,3d02h
        pop dx
        int 21h
        jnc noerror1

; ş ERROR: File not found
         mov ah,9
         lea dx,error1
         int 21h
         jmp _ret


noerror1:
; ş Save handle in [handle] and BX
        mov bx,ax                          
        mov [handle],bx

; ş Go to last byte of the file
        mov ax,4202h
        xor cx,cx
        xor dx,dx
        int 21h

; ş Save Values
	push ax			;file size in dx:ax
        mov MaxOff,dx
        mov COff,dx

; ş Go to first byte
	mov ah,42h		;set file position
	mov al,00h
	xor cx,cx
	xor dx,dx
	int 21h

; ş Display 'Searching'
        mov ah,9
        lea dx,text_searching
        int 21h

; ş Put Found value to 0
        xor ax,ax
        mov [found],al

        cmp word ptr MaxOff , 0
	jz p3

p2:
; ş Show waiting string
        mov ah,9
        lea dx,point
        int 21h

; ş Read 0f000h bytes to buffer
        mov ah,3fh
        lea dx,Buffer
        mov cx,8001h
        int 21h

        Mov word ptr SBuff,8001h
        Call Do_Search
        cmp al,1
        je bytes_found0

        mov ah,3fh
        mov bx,[handle]
        lea dx,Buffer
        mov cx,7fffh
	int 21h

        Mov word ptr SBuff,7fffh
        Call Do_Search
        cmp al, 1
        je bytes_found0

        mov bx,[handle]

        dec Word ptr COff
	jnz p2

p3:	pop cx

        mov ah,3fh
        lea dx,Buffer
	int 21h

        Mov word ptr SBuff,CX
        Call Do_Search
        cmp al,1
        je bytes_found

        mov ah,9
        lea dx,error2
        int 21h
        jmp _ret

 bytes_found0:
        pop cx   ; to prevent a bug

 bytes_found:
        mov ah,9
        lea dx,text_patched
        int 21h

 _ret:
; ş Close File
       mov ah,9
       lea dx,text_closing
       int 21h

       mov ah, 3eh
       mov bx, [handle]
       int 21h

  ret

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Border:
        Push DS
        mov ax,40h
        mov ds,ax

        xor cx,cx
        mov CL,byte ptr [51h]
        dec cl
        push cx

        Xor dx,dx
        inc dh
        Mov Word ptr [50h],DX

        mov ah,2
Bor1:   mov dl,'³'
        int 21h
        mov dl,0Ah
        int 21h
        mov dl,0dh
        int 21h
        loop Bor1

        pop cx
        push cx

        mov bx,014dh
        Mov Word ptr [50h],bX

        mov ah,2
Bor2:   mov dl,'³'
        int 21h
        inc bh
        Mov Word ptr [50h],bX
        loop Bor2

        pop cx
        add cx,3
        mov dh,cl
        xor dl,dl
        Mov Word ptr [50h],DX

        Pop DS
        Ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                      M A I N     P R O G R A M                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Main:
        mov ax,3
        int 10h                 ;ClrScr

; ş Display text_title
        mov ah,9
        lea dx,text_title
        int 21h

        Call Border             ;Put text in Box ..

; ş ENTER REF HERE:






; ş END OF REF

exit:
; ş End Message
       mov ah,9
       lea dx,text_Quit
       int 21h

; ş Wait a Key
       xor ax,ax
       int 16h

; ş Exit
       mov ax,4c00h
       int 21h


Buffer:                         ;Buffer where Searched Bytes are .
                                ;Located in heap to save space .

Code Ends
End Start
