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
    
    ;FOR LOOP WE NEED A COUTER REGISTER CX
    
    
    
    MOV CX,10   ;10 TIMES LOOP
    MOV AH,2
    MOV DL,'*' 
    
    
   
    LEVEL:
     
        INT 21H
        LOOP LEVEL
    
    
    
    
    
    

    
    END:
    ; DOS RETURN
    MOV AH,4CH
    INT 21H
    
    
    
    
    
    MAIN ENDP
END MAIN