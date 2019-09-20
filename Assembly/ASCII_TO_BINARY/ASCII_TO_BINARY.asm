.model Small
.stack 100H
.data
msg1 db "Enter character: $"
msg2 db 10,13,"Binary is: $"
.code
.startup
mov DX,@data
mov DS,DX

mov DX,offset msg1
Mov AH,09H
int 21H

mov AH,01H
int 21H
mov BL,AL

mov DX,offset msg2
Mov AH,09H
int 21H
Mov CL,8
	lp:
	ROL BL,1
	MOV AL,BL
	AND AL,01H  
	ADD AL,30H
	MOV DL,AL
	MOV AH,02H
	int 21H
	loop lp
.exit	
END
	
		
