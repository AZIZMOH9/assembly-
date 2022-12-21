; multi-segment executable file template.

data segment
    var1 db 3
    var2 db 6
    sums db 0
    mult dw 0
    subs db 0
    divs dw 0
     
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    MOV AX,@DATA
    mov ds,ax
    mov bl,var1    
    add bl,var2      ;summing two numbers
    mov sums,bl      ;adding the result to variable datasegment
    mov bl,var2
    sub bl,var1      ;sub two numbers
    mov subs,bl      ;adding the result to variable datasegment
    mov ax,0
    mov al,var2
    div var1         ;div two numbers
    mov divs,ax      ;adding the result to variable datasegment
    mov al,var1
    mul var2         ;mult two numbers
    mov mult,ax      ;adding the result to variable datasegment
    

    
      
ends

end start ; set entry point and stop the assembler