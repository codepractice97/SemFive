.model SMALL
.stack 100H
.data
	msg1 db 'Enter first 4 digit number: $'
	msg2 db 10,'Enter second 4 digit number: $'
	msg3 db 10,'Sum is: $'
	num1 dw ?
	num2 dw ?
.code
.startup
	mov DX,@data
	mov DS,DX

	;Display first message
	mov DX,offset msg1
	mov AH,09H
	int 21H

	;Input first number
	MOV BX,0
	MOV CX,4
	inp1:
		MOV AH,01H
		int 21H
		SUB AL,30H
		SHL DX,4
		ADD DL,AL
		LOOP inp1
	MOV num1,DX

	;Display second message
	mov DX,offset msg2
	mov AH,09H
	int 21H

	;Input Second Number
	MOV BX,0
	MOV CX,4
	inp2:
		MOV AH,01H
		int 21H
		SUB AL,30H
		SHL DX,4
		ADD DL,AL
		LOOP inp2
	MOV num2,DX

	;Add ones and tens digits
	MOV AX,num1
	MOV DX,num2
	ADD AL,DL
	MOV AH,0
	DAA

.exit
END
