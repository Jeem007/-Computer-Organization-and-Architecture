.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC 
    ;GREATER VALUE CHECK
    
    ;TAKE 2 VALUES  
    
    MOV BL,7 
    MOV BH,6
               
    CMP BL,BH
    JG LEVEL ;CONDITIONAL JUMP IF BL>BH
    
    MOV AH,2
    MOV DL,BH
    ADD DL,30H
    INT 21H
    
    JMP END  ;UNCONDITIONAL JUMP
    
    LEVEL:
    MOV AH,2
    MOV DL,BL
    ADD DL,30H
    INT 21H
    
    END:         ; DOS RETURN
    MOV AH,4CH
    INT 21H
    
    
    
    
    
    MAIN ENDP
END MAIN