.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 'Lower Case Input : $'
MSG2 DB 'Upper Case Output: $'

.CODE
MAIN PROC    
    ;.DATA SEGMENT INITIALIZATION
    MOV AX, @DATA
    MOV DS,AX 
    
    
    ;MSG1
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    ;INPUT MSG
    MOV AH,1
    INT 21H
    MOV BL,AL 
    
    ;NEW LINE
    
    MOV AH,2 
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H   
    
  
    ;MSG2 
    MOV AH,9
    LEA DX,MSG2
    INT 21H 
    
     
    ;CONVERT TO UPPERCASE
    
    MOV AH,2
    SUB BL,32 ; //SUB BL,20H
    MOV DL,BL
    INT 21H  
    
    ;EXIT
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     

