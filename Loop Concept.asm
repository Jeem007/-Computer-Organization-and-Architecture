.MODEL SMALL
.STACK 100H
.DATA 

A DB 'LOOP CONCEPT $'
.CODE 
   

MAIN PROC
    ;.DATA SEGMENT INITIALIZE
    MOV AX, @DATA
    MOV DS, AX    
    
    
    ;STRING DISPLAY
    MOV AH,9
    LEA DX,A
    INT 21H   
    
    ;NEW LINE  
    
    MOV AH,2
    MOV DL,10     ;10->0A
    INT 21H 
    
    ;CARIAGE RETURN
    
    MOV DL,13    ;13 ->0D
    INT 21H
    
    
    
    ;LOOP CONCEPT  -> WE USE CX
    
    MOV CX,26      ; HERE 26 MEANS HOW MANY TIME LOOP WILL BE CONTINUE
    MOV AH,2
    MOV DL, 'A'
    
   
    LEVEL1:  
    INT 21H  
    INC DL           ;INC ->INCREMENT
    LOOP LEVEL1
    
    
    ;EXIT
    
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    
    
    
    
                   
                      
    
    