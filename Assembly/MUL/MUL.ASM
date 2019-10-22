.model SMALL
.stack 100H
.386
.data
    msg1 db 'Enter the first binary number: $'
    msg2 db 10, 'Enter a binary number to multiply with the first number: $'
    msg3 db 10, 'Result is: $'
    num1 dd ?
    num2 dd ?
    res1 dd ?
    res2 dd ?
.code
.startup
    
    ; Display First Message
    mov EDX, offset msg1
    mov AH,09H
    int 21H

    ; Take the first number input
    mov EBX,0
    mov ECX,8
    inp1:
        mov AH,01H
        int 21H
        sub AL,30H
        cmp AL,9
        jle NOT_HEX
        sub AL,7
        cmp AL,15
        jg TERMINATE
        NOT_HEX:
        rol EBX,4
        add BL,AL
        loop inp1
    mov num1,EBX

    ;Display Second Message
    mov EDX,offset msg2
    mov AH,09H
    int 21H

    ; Take the second number input
    mov EBX,0
    mov ECX,8
    inp2:
        mov AH,01H
        int 21H
        sub AL,48
        cmp AL,9
        jle NOT_HEX2
        sub AL,7
        cmp AL,15
        jg TERMINATE
        NOT_HEX2:
        shl EDX,4
        add DL,AL
        loop inp2
    mov num2,EDX

    ; Multiply the two numbers
    mov EAX,num1
    mov EBX,num2
    mul EBX
    mov res1,EDX
    mov res2,EAX

    ; Display Third Message
    mov EDX, offset msg3
    mov AH,09H
    int 21H

    mov EBX,res1
    mov ECX,8
    dis_res1:
        rol EBX,4
        mov AL,BL
        and AL,0FH
        add AL,30H
        cmp AL,39H
        jle IS_HEX1
        add AL,7H
        IS_HEX1:
        mov DL,AL
        mov AH,02H
        int 21H
        loop dis_res1

    mov EBX,res2
    mov ECX,8
    dis_res2:
        rol EBX,4
        mov AL,BL
        and AL,0FH
        add AL,30H
        cmp AL,39H
        jle IS_HEX2
        add AL,7H
        IS_HEX2:
        mov DL,AL
        mov AH,02H
        int 21H
        loop dis_res2


    TERMINATE:
.exit
END
