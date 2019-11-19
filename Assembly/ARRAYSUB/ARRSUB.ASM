.model SMALL
.stack 100H
.data
    arr1 db 10 dup(?)
    arr2 db 10 dup(?)
    msg1 db 'Enter first 10 digit array: $'
    msg2 db 10, 'Enter second 10 digit array: $'
    msg3 db 10, 'Subtraction is: $'
.code
.startup
    mov dx, offset msg1
    mov ah, 09H
    int 21H

    ; Take first array input
    mov bx, offset arr1
    mov si,0
    mov cx,10
    inp1:
        mov ah, 01H
        int 21H
        sub al, 30H
        mov [bx+si], al
        inc si
        mov dx, 20H
        mov ah, 02H
        int 21H
        loop inp1

    mov dx, offset msg2
    mov ah, 09H
    int 21H
    
    ; Take second array input
    mov bx, offset arr2
    mov si,0
    mov cx,10
    inp2:
        mov ah, 01H
        int 21H
        sub al, 30H
        mov [bx+si], al
        inc si
        mov dx, 20H
        mov ah, 02H
        int 21H
        loop inp2
    
    mov dx,offset msg3
    mov ah, 09H
    int 21H

    ; Calculate subtraction of both arrays
    mov si,0
    mov cx,10
    calc:
        mov bx, offset arr1
        mov bp, offset arr2
        mov al, [bx+si]
        mov dl, [bp+si]
        sub al, dl
        das
        mov [bx+si], al
        inc si
        loop calc

    ; Print summed array
    mov si, 0
    mov cx, 10
    disp:
        mov bp, offset arr1
        mov al, [bp+si]
        ror al, 4
        and al, 0FH
        add al, 30H
        mov dl, al
        mov ah,02H
        int 21H
        mov al, [bp+si]
        and al, 0FH
        add al, 30H
        mov dl, al
        mov ah,02H
        int 21H
        ; Print space
        mov dx, 20H
        mov ah, 02H
        int 21H
        loop disp
.exit
END