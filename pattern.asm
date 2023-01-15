; multi-segment executable file template.

data segment
    ; add your data here!

    column db 0
    row db 0
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
mov ax,@Data
mov ds,ax
mov es,ax
mov cx,5
loop1:
    mov bx,cx
    loop2:
        inc column
        call cursor
        call display
        dec bx
        jnz loop2
    mov column,0
    inc row
    dec cx
    jnz loop1
    int 20h
    ret


ends      
display proc
    mov ah,02h
    mov dl,cl
    add dl,30h
    int 21h
    ret
display endp

cursor proc
    mov ah,02h
    mov bh,0
    mov dl,column
    mov dh,row
    int 10h
    ret
cursor endp

end start ; set entry point and stop the assembler.
