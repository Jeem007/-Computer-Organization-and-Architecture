.MODEL SMALL
.CODE
MAIN PROC
    MOV CX,16
    MOV AX, 0000000000000011B
    
REVERSE:

    SHL AX,1
    RCR BX,1
    LOOP REVERSE
    ;MOV AL,BL

    MOV CX,16
     
L1:    
    SHL BX,1
    JC L2 
    
    
    MOV DL,'0'
    MOV AH,2
    INT 21H  
    LOOP L1
    JMP EXIT
L2:  
    MOV DL,'1'
    MOV AH,2
    INT 21H       
    LOOP L1
EXIT:      
    MOV AH,4CH
    INT 21H
   
MAIN ENDP
END MAIN