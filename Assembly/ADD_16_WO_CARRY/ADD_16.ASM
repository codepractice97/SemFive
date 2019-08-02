.model SMALL
.stack 100H
.data
	msg1 db 'Sum is: $'
	num1 dw 0201H
	num2 dw 0101H
	sum dw ?
.code
.startup
	mov ax,@data
	mov ds,ax

	;Add the two numbers
	mov ax,num1
	add ax,num2

	; mov ah,0
	; AAA
	mov sum,ax

	;Display message
	mov dx,offset msg1
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
.exit
END
