.model SMALL
.stack 100H
.386
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

	;SUBTRACT the two numbers
	MOV AX,num1
	MOV BX,num2
	MOV DX,0
	MOV CX,2
	SUB_LOOP:
		RCR DL,1 ; Set Stored Borrow
		SBB AL,BL
		DAS
		MOV DL,0
		RCL DL,1 ; Store borrow in DL
		ROR BX,8
		ROR AX,8
		LOOP SUB_LOOP
	MOV BX,AX
	MOV CL,DL ; Store borrow in CL

	;Display third message
	mov DX,offset msg3
	mov AH,09
	int 21H

	;Display Sum
	CMP CL,1
	JNE NOT_NEGATIVE
	MOV AX,9999H
	SUB AX,BX
	ADD AX,1H
	MOV BX,AX
	MOV DL,45
	MOV AH,02H
	int 21H
	
	NOT_NEGATIVE:
	
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