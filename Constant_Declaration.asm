.MODEL SMALL
.STACK 100H

.DATA
A EQU '2'      ;CONSTATNT-> NAME EQU CONSTANT ->NO NEED TO MEMORY ALLOCATE     
B EQU 'HELLO$'
               ; WE DONOT ACCESS STRING DATA IN EOQ CONSTANT AS IT HAS NO MEMORY ALLOCATE.
               ;FOR STRING DATA WE NEED A MEMORY ALLOCATION SO WE NEED TO PASS IT ON ANOTHER VARIABLE TO ACCESS IT
               
C DB B         ;IN VARIABLE C WE STORE ALL THE DATA OF B

.CODE
MAIN PROC    
    ;.DATA SEGMENT INITIALIZATION
    MOV AX, @DATA
    MOV DS,AX 
    
    ;INPUT A
    MOV AH,1    ; CONSTANT VALUE IS 2 IN A. SO NO MATTER WE INPUT ANY NUMBER RESULT WILL BE 2
    INT 21H
    MOV BL,A   
    
    ;NEW LINE
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    ;OUTPUT
    MOV AH,2
    MOV DL,A
    INT 21H    
    
    ;NEW LINE
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H  
     
    ;DISPLAY CONSTANT STRING WITH USING ANOTHER VARIBALE NAME C
    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    
   
    
    MAIN ENDP
END MAIN
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     

