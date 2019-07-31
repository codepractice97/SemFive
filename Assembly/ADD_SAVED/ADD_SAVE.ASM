.model SMALL
.stack 100H
.data
	msg1 db 'Enter Number: $'
	msg2 db 10,'Result; $'
	num1 db	3
.code
.startup
	mov dx,@data
	mov ds,dx

	mov dx,offset msg1
	mov ah,09
	int 21h

	mov ah,01
	int 21h
	sub al,48

	add al,num1

	add al,48

	mov dx,offset msg2
	mov ah,09
	int 21h

	mov dl,al
	mov ah,02
	int 21h
.EXIT
END
