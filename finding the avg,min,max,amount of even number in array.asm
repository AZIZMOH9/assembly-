; multi-segment executable file template.

data segment
    ARR db 3h,4h,5h,8h
    var1 db 
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    MOV AX,@DATA        ;assigning the adress of datasegment
    MOV DS,AX
    mov si,0
    mov ax,0
    mov cX,4
    mov bh,0ffh
    loop1:add al,ARR[si];finding the sum of all elements
    cmp bl,ARR[SI]      ;finding the max
    jb  LP1             ; jump if bl less than si element
    LP2:cmp bh,ARR[SI]  ;find the min
    JNC LP3             ;jump if carry
    LPK:
    inc si
    dec cl
    jnz loop1           ;jump if not zero.
    jmp done1           ;finishing of the first loop
    LP1:MOV BL,ARR[SI]  ; swap max element
    JMP LP2
    LP3:mov bh,ARR[SI]  ;swap mib element
    JMP LPK
    done1:mov cl,4      ;initializing for sec loop
    div cl
    mov si,0
    mov bx,0
    mov bh,2h
    loop3:              ; this loop finding the even number
    mov ax,0
    mov al,ARR[si]
    div bh              ;divide by two
    and ah,11h          ;if there is remainder zero 0 else zero 1
    jz ads              ;jump if zero
    ads2:inc si
    dec cl
    jnz loop3
    jmp done2
    ads:inc dl          ; counter of even number 
    jmp ads2
    done2:
    
      
ends

end start ; set entry point and stop the assembler.