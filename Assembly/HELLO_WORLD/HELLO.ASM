.model SMALL
.stack 100H
.data
msg db 'Hello World',10,'$'
.code
.startup
mov AX,@data
mov DS,AX
mov DX,offset msg
mov AH,09H
int 21H
.EXIT
END

