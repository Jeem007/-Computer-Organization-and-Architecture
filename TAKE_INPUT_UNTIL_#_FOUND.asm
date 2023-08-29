 .MODEL SMALL
.STACK 100H
.DATA 

MSG1 DB "ENTER THE ALPHABETS: $"
MSG2 DB 10,13, "VOWELS $"
MSG3 DB 10,13, "NOT VOWELS $"

.CODE

MAIN PROC 
    
    ;DATA SEGMENT INITIALIZE
    MOV AX,@DATA
    MOV DS,AX 
    
    ;TAKING USER INPUT UNTIL # INPUTTED
    LEVEL:
    MOV AH,1
    INT 21H
    
    MOV BL,AL 
    
    CMP BL,"#"
    JE END  
   
   
   
    MOV AH,2
    MOV DL,BL 
    INT 21H
    JMP LEVEL
    
    
    
    

    
    END:
    ; DOS RETURN
    MOV AH,4CH
    INT 21H
    
    
    
    
    
    MAIN ENDP
END MAIN