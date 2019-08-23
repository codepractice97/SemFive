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
		cmp AL,9
		jg terminate
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
		cmp AL,'A'
		jge terminate
		SHL DX,4
		ADD DL,AL
		LOOP inp2
	MOV num2,DX

	;Add one's and ten's digits
	MOV AX,num1
	MOV DX,num2
	ADD AL,DL
	DAA
	MOV BL,AL

	;Add hundred's and thousand's digit
	MOV AL,AH
	ADC AL,DH
	DAA
	MOV BH,AL

	;Display third message
	mov DX,offset msg3
	mov AH,09
	int 21H

	;Display Sum
	MOV AL,0
	RCL AL,1
	ADD AL,30H
	MOV DL,AL
	MOV AH,02H
	int 21H
	
	MOV CX,4
	dis_result:
		ROL BX,4
		MOV AL,BL
		AND AL,0FH
		ADD AL,30H
		MOV DL,AL
		MOV AH,02H
		int 21H
		LOOP dis_result
terminate:
.exit
END
