.model SMALL
.stack 100H
.386
.data
	msg1 db 'Enter first number: $'
	msg2 db 10,'Enter second number: $'
	msg3 db 10,'Sum is: $'
	num1 db ?
	num2 db ?
	result db ?
.code
.startup
	mov DX,@data
	mov DS,DX

	;Display first message
	mov DX,offset msg1
	mov AH,09H
	int 21H

	;Input first number
	MOV AH,01H
	int 21H
	SUB Al,30H
	MOV num1,AL

	;Display second message
	mov DX,offset msg2
	mov AH,09H
	int 21H

	;Input Second Number
	MOV AH,01H
	int 21H
	SUB Al,30H
	MOV num2,AL

	;SUBTRACT the two numbers
	MOV AL,num1
	MOV BL,num2
	MOV AH,0
	SUB AL,BL
	AAS
	MOV BX,AX

	;Display third message
	mov DX,offset msg3
	mov AH,09
	int 21H
	
	CMP BH,-1
	JNE NOT_NEGATIVE
	MOV AL,9H
        sub AL,BL
	ADD AL,1H
	MOV BL,AL
	MOV DL,45
	MOV AH,02H
	int 21H

	NOT_NEGATIVE:
	ADD BL,30H
	MOV DL,BL
	MOV AH,02H
	int 21H
	
terminate:
.exit
END
