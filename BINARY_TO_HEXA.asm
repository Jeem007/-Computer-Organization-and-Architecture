.MODEL SMALL
.STACK 100H
.DATA 
M1 DB 10,13,"TYPE A BINARY DIGIT UPTO 16 BITS: $"
M2 DB 10,13,"IN HEXADECIMAL IT IS: $"


.CODE

MAIN PROC
    ;DATA
    MOV AX,@DATA
    MOV DS,AX
    
    ;M1
    MOV AH,9
    LEA DX,M1
    INT 21H
    
    ;READ BINARY
    MOV BX,0
    MOV AH,1
    MOV CX,16
    
    INPUT:
    INT 21H 
    CMP AL,0DH ;FINISH ENTER
    JE OUTPUT
    
    AND AL,01H ;CONVERT TO NUMERICAL 0,1
    SHL BX,1
    OR BL,AL
    LOOP INPUT
    
    
    OUTPUT:
    MOV AH,9
    LEA DX,M2
    INT 21H 
    
    MOV DH,4 ;SHOW 4 DIGIT HEXA
    
    L2:
    MOV CL,4
    MOV DL,BH
    SHR DL,CL
    MOV AH,2
    
    CMP DL,9
    JG LETTER
    ADD DL,30H
    INT 21H
    JMP L3
    
    LETTER:
    ADD DL,37H
    INT 21H
  
    
    L3:
    
    ROL BX,CL ;GET SECOND HEX DIGIT
    DEC DH
    CMP DH,0
    JNE L2
    
    
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN