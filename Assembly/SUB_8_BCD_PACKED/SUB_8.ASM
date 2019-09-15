.model SMALL
.stack 100H
.386
.data
	msg1 db 'Enter firsr 8 digit BCD number: $'
	msg2 db 10, 'Enter second 8 digit BCD number: $' 
	msg3 db 10, 'Result is: $'
	num1 dd ?
	num2 dd ?
.code
.startup
	mov EDX,@data
	mov DS,EDX

	;Display First message
	mov EDX, offset msg1
	mov AH,09H
	int 21H
	
	;Input First Number
	MOV EBX,0
	MOV ECX,8
	inp1:
		MOV AH,01H
		int 21H
		SUB AL,48
		CMP AL,9
		JG terminate
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
		JG terminate
		SHL EDX,4
		ADD DL,AL
		LOOP inp2
	MOV num2,EDX


terminate:
.exit
END
