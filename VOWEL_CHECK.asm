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
    
    ;MSG1 PRINT  
    MOV AH,9
    LEA DX,MSG1
    INT 21H 
    ;TAKING INPUT
    
    MOV AH,1
    INT 21H
    
    CMP AL, 'A'
    JE PRINT     ; JE FOR EQUAL CHECK 
     
     CMP AL, 'E'
    JE PRINT     ;EQUAL CHECK  
    
     CMP AL, 'I'
    JE PRINT     ;EQUAL CHECK  
    
     CMP AL, 'O'
    JE PRINT     ;EQUAL CHECK   
    
     CMP AL, 'U'
    JE PRINT     ;EQUAL CHECK  
    
    MOV AH,9
    LEA DX,MSG3
    INT 21H  
    JMP END
   
   
   
   
    PRINT:
    MOV AH,9
    LEA DX,MSG2
    INT 21H  
    
 
    
    END:
    ; DOS RETURN
    MOV AH,4CH
    INT 21H
    
    
    
    
    
    MAIN ENDP
END MAIN