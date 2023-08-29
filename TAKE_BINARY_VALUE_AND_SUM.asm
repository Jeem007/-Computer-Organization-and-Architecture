.MODEL SMALL
.STACK 100H
.DATA  
M1 DB 10,13,"TYPE A BINARY NUMBER UPTO 8 DIGITS: $"
M2 DB 10,13,"THE BINARY SUM IS: $"  
B1 DB ?
B2 DB ?
.CODE

MAIN PROC
    ;DATA
    MOV AX,@DATA
    MOV DS,AX
    
    ;M1
    MOV AH,9
    LEA DX,M1
    INT 21H
    
    MOV BL,0
    MOV CX,8
    MOV AH,1
    
    L1:
    INT 21H
    CMP AL,0DH
    JE OUT
    SUB AL,30H ;AND AL,01H
    SHL BL,1
    OR BL,AL
    LOOP L1
    
    OUT:
    MOV B1,BL ;1ST NO READ AND STORE
    
    MOV AH,9
    INT 21H
    MOV BL,0 ;READ 2ND NO
    MOV CX,8
    MOV AH,1
    
    L2:
    INT 21H
    CMP AL,0DH
    JE OUT2
    SUB AL,30H
    SHL BL,1
    OR BL,AL
    LOOP L2
    
    OUT2:
    MOV B2,BL
    MOV AH,9
    LEA DX,M2
    INT 21H
    ADD BL,B1
    MOV AH,2
    MOV CX,8
    
    
    L3:
    SHL BL,1
    JC ONE
    MOV DL,'0'
    INT 21H
    JMP CONTINUE
    
    ONE:
    MOV DL,'1'
    INT 21H 
    
    CONTINUE:
    LOOP L3
    
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN