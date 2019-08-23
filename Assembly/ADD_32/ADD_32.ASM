.model SMALL
.stack 100H
.386
.data
	msg1 db 'Enter first 32 bit number: $'
	msg2 db 10,'Enter second 32 bit number: $'
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
		SUB AL,48
		CMP AL,9
		JLE NOT_HEX
		SUB AL,7
		NOT_HEX:
		CMP AL,15
		JLE NOT_SMALL_HEX
		SUB AL,32
		NOT_SMALL_HEX:
		SHL EDX,4
		ADD DL,AL
		LOOP inp1
	MOV num1,EDX

	;Display second message
	mov EDX,offset msg2
	mov AH,09H
	int 21H

	;Input second number
	MOV EBX,0
	MOV ECX,8
	inp2:
		MOV AH,01H
		int 21H
		SUB AL,48
		CMP AL,9
		JLE NOT_HEX2
		SUB AL,7
		NOT_HEX2:
		CMP AL,15
		JLE NOT_SMALL_HEX2
		SUB AL,32
		NOT_SMALL_HEX2:
		SHL EDX,4
		ADD DL,AL
		LOOP inp2
	MOV num2,EDX

	;Add the two numbers
	MOV EAX,num1
	ADD EAX,num2
	MOV EBX,EAX
	
	;Display third message
	mov EDX,offset msg3
	mov AH,09H
	int 21H	

	;Display Result:
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
		CMP AL,39H
		JLE IS_HEX
		ADD AL,7H
		IS_HEX:
		MOV DL,AL
		MOV AH,02H
		int 21H
		LOOP dis_result

.exit
END
