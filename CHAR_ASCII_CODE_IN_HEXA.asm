.MODEL SMALL  
.STACK 100H
.DATA
M1 DB 10,13,"TYPE A CHARACTER: $"
M2 DB 10,13,"THE ASCII CODE OF "
C1 DB ?," IN HEXA IS: $" 

.CODE
MAIN PROC
    ;DATA
    MOV AX,@DATA
    MOV DS,AX
    
    BEGIN:
    MOV AH,9
    LEA DX,M1
    INT 21H
    
    ;READ CHAR
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JE EXIT
    
    ;STORE CHAR
    MOV C1,AL
    MOV BL,AL
    
    ;M2 PRINT
    MOV AH,9
    LEA DX,M2
    INT 21H  
    
    
    ;CONV
    
    MOV CL,4    ;
    SHR C1,CL   ;CL->4 SHR SO DIVIDE BY 2
    ADD C1,30H
    MOV DL,C1
    JMP EXE1
    
    
    CONTINUE:
    AND BL,0FH
    CMP BL,9
    JG ERROR_
    
    ADD BL,30H
    MOV DL,BL
    JMP EXE2
    
    EXE1:
    MOV AH,2
    INT 21H
    JMP CONTINUE
    
    EXE2:
    MOV AH,2
    INT 21H
    
    JMP BEGIN  
    
    
    ERROR_:
    ADD BL,37H
    MOV DL,BL
    MOV AH,2
    INT 21H
    JMP BEGIN
    
    
    
              
    
    

EXIT:      
    MOV AH,4CH
    INT 21H
   
MAIN ENDP
END MAIN