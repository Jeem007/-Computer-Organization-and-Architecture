.MODEL SMALL
.STACK 100H
.DATA

A DB 'JMP CONCEPT $' ;-> VARIABLE A
B DB 'ASSEMBLY LANGUAGE $' 
C DB 'PROGRAMMING $'

.CODE

MAIN PROC
     ;DATA SEGMENT INITIALIZE
     MOV AX,@DATA 
     MOV DS,AX
     
     ;STRING A DISPLAY
     MOV AH,9
     LEA DX,A
     INT 21H
     
     ;NEW LINE & CARIAGE 
     
     MOV AH,2
     MOV DL,10
     INT 21H
     MOV DL,13
     INT 21H
     
     ;LEVEL CREATE
     
     
     M:                      ; ->LEVEL NAME M AND JUMP TO N
     MOV AH,9
     LEA DX, B               ;DISPLAY B
     INT 21H   
     
     ;NEW LINE
     
     MOV AH,2
     MOV DL,10
     INT 21H
     MOV DL,13
     INT 21H
     
     JMP N
     
     N:                      ; ->LEVEL N JUMP TO EXIT LEVEL
     MOV AH,9                
     LEA DX,C                ; DISPLAY C
     INT 21H
     JMP EXIT
     
     
     EXIT:                   ;EXIT
     MOV AH,4CH
     INT 21H
     
     MAIN ENDP
END MAIN
     
     
     
     
     
     