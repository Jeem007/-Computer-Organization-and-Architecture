 .MODEL SMALL
.STACK 100H
.DATA 


.CODE

MAIN PROC 
    
    ;DATA SEGMENT INITIALIZE
    MOV AX,@DATA
    MOV DS,AX 
    
    ;FOR LOOP WE NEED A COUTER REGISTER CX
    
    
    
    MOV CX,10  ;10 TIMES COUNT
    MOV AH,2
    MOV DL,48   ;48 FOR DECIAML
    
    
    TOP:
        INT 21H
        INC DL
        LOOP TOP
    
    
    
    
    

    
    END:
    ; DOS RETURN
    MOV AH,4CH
    INT 21H
    
    
    
    
    
    MAIN ENDP
END MAIN