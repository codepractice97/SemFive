.model SMALL
.stack 100H
.data
	msg1 db "Enter first 2 digit number: $"
	msg2 db 10,"Enter second 2 digit number: $"
	msg3 db 10,"Sum is: $"
	num1 db ?
	num2 db ?
	num3 db ?
.code
.startup
	mov AX,@data
	mov DS,AX

	;Display first message
	mov DX,offset msg1
	mov AH,09H
	int 21H

	;Input first number
	mov AH,01H
	int 21H
	sub AL,30H
	Mov BH,AL
	mov AH,01H
	int 21H
	sub AL,30H
	Mov BL,AL

	;Display second message
	mov DX,offset msg2
	mov AH,09H
	int 21H

	;Input second number
	mov AH,01H
	int 21H
	sub AL,30H
	Mov CH,AL
	mov AH,01H
	int 21H
	sub AL,30H
	Mov CL,AL

	;Add ones digits
	mov AL,CL 
	add AL,BL
	mov AH,0H
	AAA ;Note to not add after aaa, carry bit resets
	mov num1,AL

	;Add seconds digits
	add BH,AH
	mov AL,BH
	add AL,CH
	mov AH,0H
	AAA
	mov num2,AL
	mov num3,AH

	;Display third message
	mov DX,offset msg3
	mov AH,09H
	int 21H

	;Display Result
	mov DL,num3
	ADD DL,30H
	mov AH,02H
	int 21H
	mov DL,num2
	ADD DL,30H
	mov AH,02H
	int 21H
	mov DL,num1
	ADD DL,30H
	mov AH,02H
	int 21H
.exit
END
