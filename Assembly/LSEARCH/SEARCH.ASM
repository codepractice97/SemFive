.model SMALL
.stack 100H
.data
    arr db 10 dup(?)
    num db ?
    msg1 db 'Enter a 10 digit array: $'
    msg2 db 10, 'Enter the number to search: $'
    msg3 db 10, 'Number Found$'
    msg4 db 10, 'Number Not Found$'
.code
.startup
    mov dx, offset msg1
    mov ah, 09H
    int 21H

    ; Take array input
    mov bx, offset arr
    mov si,0
    mov cx,10
    inp:
        mov ah, 01H
        int 21H
        mov [bx+si], al
        inc si
        mov dx, 20H
        mov ah, 02H
        int 21H
        loop inp

    mov dx, offset msg2
    mov ah, 09H
    int 21H
    
    ; Take number to search input
    mov ah,01H
    int 21H
    mov num, al

    ; Search for the number
    mov bx, offset arr
    mov si,0
    mov cx,10
    check:
        mov al, [bx+si]
        cmp al, num
        je FOUND
        inc si
        loop check
    
    ; Display number not found message
    mov dx,offset msg4
    mov ah, 09H
    int 21H
    .exit

    FOUND:
        mov dx,offset msg3
        mov ah, 09H
        int 21H
.exit
END