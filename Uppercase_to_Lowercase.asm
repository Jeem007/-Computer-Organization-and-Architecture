.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 'Upper Case Input : $'
MSG2 DB 'Lower Case Output: $'

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
    
     
    ;CONVERT TO Lowecase
    
    MOV AH,2
    ADD BL,32 ; //ADD BL,20H
    MOV DL,BL
    INT 21H  
    
    ;EXIT
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     

