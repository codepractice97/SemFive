.model SMALL
.stack 100H
.386
.data
	msg1 db 'Enter first 4 digit number: $'
	msg2 db 10,'Enter second 4 digit number: $'
	msg3 db 10,'Sum is: $'
	num1 dw ?
	num2 dw ?
	res dw ?
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
	MOV AL,BYTE PTR [num1]
	MOV BL,BYTE PTR [num2]
	SBB AL,BL
	DAS
	MOV BYTE PTR [res], AL

	MOV AL,BYTE PTR [num1+1]
	MOV BL,BYTE PTR [num2+1]
	SBB AL,BL
	DAS
	MOV BYTE PTR [res+1], AL

	;Display third message
	mov DX,offset msg3
	mov AH,09
	int 21H

	MOV BX,res
	;Display Sum
	MOV Al,0
	RCL AL,1
	CMP AL,1
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
