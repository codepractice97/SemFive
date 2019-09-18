.model SMALL
.stack 100H
.386
.data
	msg1 db 'Enter first 8 digit number: $'
	msg2 db 10,'Enter second 8 digit number: $'
	msg3 db 10,'Sum is: $'
	num1 dd ?
	num2 dd ?
.code
.startup
	mov EDX,@data
	mov DS,EDX

	;Display first message
	mov EDX,offset msg1
	mov AH,09H
	int 21H

	;Input first number
	MOV EBX,0
	MOV ECX,8
	inp1:
		MOV AH,01H
		int 21H
		SUB AL,30H
		cmp AL,9
		jg terminate
		SHL EDX,4
		ADD DL,AL
		LOOP inp1
	MOV num1,EDX

	;Display second message
	mov EDX,offset msg2
	mov AH,09H
	int 21H

	;Input Second Number
	MOV EBX,0
	MOV ECX,8
	inp2:
		MOV AH,01H
		int 21H
		SUB AL,30H
		cmp AL,9
		jg terminate
		SHL EDX,4
		ADD DL,AL
		LOOP inp2
	MOV num2,EDX

	;ADD the two numbers
	MOV EAX,num1
	MOV EDX,num2
	MOV EBX,0
	MOV ECX,4
	ADD_LOOP:
		ADC AL,DL
		DAA
		MOV BL,AL
		ROR EBX,8
		ROR EAX,8
		ROR EDX,8
		LOOP ADD_LOOP

	;Display third message
	mov EDX,offset msg3
	mov AH,09
	int 21H

	;Display Sum
	MOV AL,0
	RCL AL,1
	ADD AL,30H
	MOV DL,AL
	MOV AH,02H
	int 21H
	
	MOV ECX,8
	dis_result:
		ROL EBX,4
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
