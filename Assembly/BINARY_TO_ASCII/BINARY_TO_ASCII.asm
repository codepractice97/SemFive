.model Small
.stack 100H
.data
msg1 db "Enter 8 bit Binary: $"
msg2 db 10,13,"Character is: $"
.code
.startup
mov DX,@data
mov DS,DX

mov DX,offset msg1
Mov AH,09H
int 21H
mov BL,0H
mov CL,8
lp1:
	Mov AH,01H
	int 21H
	sub AL,30H
	cmp AL,1
	jg fin
	SHL BL,1
	Add BL,AL
loop lp1

mov DX,offset msg2
Mov AH,09H
int 21H
mov DL,Bl
Mov AH,02H
int 21H

fin:
.exit	
END
	
		
