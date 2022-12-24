; multi-segment executable file template.

data segment
    ARR db 21,42,5,17,8,9,51,12,32,3
     
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    MOV AX,@DATA
    MOV DS,AX
    mov si,0
    mov ax,0
    mov cX,10
    loop1:add al,ARR[si] ;suming the element of array inside al reg
    inc si
    dec cl
    jnz loop1
    mov bl,0Ah
    div bl               ;finding the avarge
    mov bl,al
    mov si,0
    mov cl,0Ah
    loop2:cmp bl,ARR[SI] ;loop 2 to compare if the given element is bigge than the avg of array or not
    JLE  ADS
    complete:INC SI
    DEC CL
    JNZ loop2
    jmp done
    ADS:
    inc dl
    jmp complete
    done:
    
      
ends

end start ; set entry point and stop the assembler.