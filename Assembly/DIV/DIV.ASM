.model SMALL
.stack 100H
.386
.data
    msg1 db 'Enter the first binary number: $'
    msg2 db 10, 'Enter a binary number to divide the first number with: $'
    msg3 db 10, 'Quotient is: $'
    msg4 db 10, 'Remainder is: $'
    num1 dd ?
    num2 dd ?
    quo dd ?
    rem dd ?
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
    mov EDX,0
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

    ; Divide the the first number with second number
    mov EDX,0 ; TO prevent exception due to division overflow
    mov EAX,num1
    mov EBX,num2
    div EBX
    mov quo,EAX
    mov rem,EDX

    ; Display Third Message
    mov EDX, offset msg3
    mov AH,09H
    int 21H

    mov EBX,quo
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

    ; Display Fourth Message
    mov EDX, offset msg4
    mov AH,09H
    int 21H

    mov EBX,rem
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
