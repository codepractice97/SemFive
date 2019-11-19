.model SMALL
.stack 100H
.data
    arr db 10 dup(?)
    msg1 db 'Enter a ten digit array to sort: $'
    msg2 db 10, 13, 'Sorted array: $'
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
    
    ; Sort the array
    mov bp, offset arr
    mov si, 0
    mov cx, 10
    sort1:
        mov dx,cx
        sort2:
            mov al, [bp+si]
            cmp al, [bp+si+1]
            jl INORDER
            xchg al, [bp+si+1]
            mov [bp+si], al
            INORDER:
            inc si
            loop sort2
        mov si, 0
        mov cx,dx
        loop sort1

    mov dx, offset msg2
    mov ah, 09H
    int 21H

    ; Display the array
    mov bp, offset arr
    mov si, 0
    mov cx, 10
    disp:
        mov al, [bp+si]
        mov dl, al
        mov ah,02H
        int 21H
        ; Print space
        mov dx, 20H
        mov ah, 02H
        int 21H
        inc si
        loop disp
.exit
END