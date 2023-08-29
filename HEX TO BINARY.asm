.MODEL SMALL
.STACK 100H
.DATA 
M1 DB 10,13,"TYPE A HEX NUMBER (0 - FFFF): $"
M2 DB 10,13,"IN BINARY IT IS: $"
M3 DB 10,13,"ILLEGAL HEX CHARACTER.TRY AGAIN: $"
M4 DB 10,13,"NUMBER OF 1: $"
C1 DB 00H
.CODE
MAIN PROC
    
    ;DATA
    MOV AX,@DATA
    MOV DS,AX
    
    ;M1
    MOV AH,9
    LEA DX,M1
    INT 21H
    
   
    XOR BX,BX
    MOV CL,4 
    
    START:
    ;TAKE INPUT
    MOV AH,1
    INT 21H
    
    WHILE:
    CMP AL, 0DH ;UNTIL PRESS ENTER TAKES INPUT
    JE END_WHILE
    
    CMP AL,'0'
    JL ERR
    CMP AL,'9'
    JG LETTER
    
    AND AL,0FH ;GET NUMERICAL VALUE OR ADD AL,30H
    
    ;ADD AL,30H
    JMP SHIFT
    
    LETTER:
    CMP AL,'F'
    JG ERR
    CMP AL,'A'
    JL ERR
    
    SUB AL,37H ;GET NUMERICAL VALUE
    
    SHIFT:
    SHL BX,CL
    OR BL,AL
    INT 21H
    JMP WHILE
    
    END_WHILE:
    MOV AH,9
    LEA DX,M2
    INT 21H  
    
    MOV CX,16
    MOV AH,2
    
    SHOW:
    SHL BX,1
    JC ONE
    MOV DL,'0'
    INT 21H
    JMP LOOP1
    
    ONE:
    MOV DL,'1'
    INT 21H 
    INC C1
    
    LOOP1:
    LOOP SHOW
    JMP COUNT
    
    ERR:
    MOV AH,9
    LEA DX,M3
    INT 21H
    JMP START
    
    
    COUNT:
    MOV AH,9
    LEA DX,M4
    INT 21H
    
    
    ADD C1,30H
    MOV AH,2  
    MOV DL,C1
    INT 21H
    
    
    
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN