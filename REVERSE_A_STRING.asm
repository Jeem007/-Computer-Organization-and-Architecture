.MODEL SMALL
.STACK 100H
.DATA 
M1 DB 10,13,"TYPE A MESSAGE: $"
.CODE
MAIN PROC
    ;DATA
    MOV AX,@DATA
    MOV DS,AX
    
    ;DISLAY USER PROMPT
    MOV AH,9
    LEA DX,M1
    INT 21H
    
    ;INITIALIZE CHARACTER COUNT
    XOR CX,CX 
    
    ;READ CHAR
    MOV AH,1
    INT 21H  
    
    
    ;CARIAGE RETURN CHECK
    WHILE:
    CMP AL,0DH
    JE END_WHILE 
    
    ;SAVE CHAR ON THE STACK
    PUSH AX
    INC CX
    
    
    ;READ A CHAR
    INT 21H
    JMP WHILE
    
    
    END_WHILE:
    ;GO TO NEW LINE
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    JCXZ EXIT  ;EXIT IF NO CHARATERS READ
    
    ;FOR COUNT TIMES DO
    TOP:
        ;POP A CHAR FROM STACK
        POP DX
        ;DISPLAY IT
        INT 21H
        LOOP TOP
    ;END FOR
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN