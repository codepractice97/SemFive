.model SMALL
.stack 100H
.data
	msg1 db 10,'Enter first number: ','$'
	msg2 db 10,'Enter second number: ','$'
	msg3 db 10,'Result: ','$'
	num1 db ?
	num2 db	?
	sum dw ?
.code
.startup

	mov ax,@data
	mov ds,ax

	;Display first message
	mov dx,offset msg1
	mov ah,09
	int 21h

	;Input first number and save in num1
	mov ah,01
	int 21h
	sub al,48 ;convert to decimal
	mov num1,al

	;Diplay second message
	mov dx,offset msg2
	mov ah,09H
	int 21h

	;Input second number and save in num2
	mov ah,01
	int 21h
	sub al,48 ;convert to decimal
	mov num2,al

	;Add the two numbers
	mov al,num1
	add al,num2

	mov ah,0 ;clear register
	AAA
	;or ax, 3030h
	mov sum,ax

	;Display third message
	mov dx,offset msg3
	mov ah,09
	int 21h

	;Display tens digit
	mov ax,sum
	mov dl,ah
	add dl,48 ;convert to ascii
	mov ah,02
	int 21h

	;Display ones digit
	mov ax,sum
	mov dl,al
	add dl,48
	mov ah,02
	int 21h

.EXIT
END
