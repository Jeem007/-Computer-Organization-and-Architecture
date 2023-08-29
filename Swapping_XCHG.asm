
;MOV 
;->used to transfer data between registers
;->between a register and a memory locatiom


.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC    
    ;.DATA SEGMENT INITIALIZATION
    MOV AX, @DATA
    MOV DS,AX 
    
    
    ;IF INPUT ABC THEN PRINT CBA
    
    ;TAKING 3 INPUT
   
    MOV  AH,1
    INT 21H
    MOV BL,AL
    INT 21H 
    MOV BH,AL
    INT 21H
    MOV CH,AL

    
    ;NEW LINE
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    
    ;DISPLAY 3 DATA  NORMAL WAY 
    
    MOV AH,2
    MOV DL,CH
    INT 21H 
    MOV DL,BH
    INT 21H
    MOV DL,BL
    INT 21H  
    
    
    ;NEW LINE
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    
    ;EXCHANGE  -----------
   
    
    ;INPUT TWO DATA FOR SWAP
    MOV  AH,1
    INT 21H
    MOV BL,AL  ;->BL
    INT 21H 
    MOV BH,AL  ;->BH
    
    ;NEW LINE
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
       
    ;EXCHANGE
    XCHG BL,BH 
   
   
    ;DISPLAY AFTER EXCHANGE SEQUENTIALLY BL THEN BH    
    MOV AH,2
    MOV DL,BL
    INT 21H
    MOV DL,BH
    INT 21H
    

    
   
    
    MAIN ENDP
END MAIN
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     

