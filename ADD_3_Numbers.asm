                                                  .MODEL SMALL
.STACK 100H
.DATA
FIRST_MSG DB 'INPUT FIRST DIGIT: $'
SECOND_MSG DB 'INPUT SECOND DIGIT: $' 
THIRD_MSG DB 'INPUT THIRD DIGIT: $'  
RESULT_MSG DB 'RESULT: $'

.CODE
MAIN PROC
    ;.DATA SEGMENT INITIALIZE
    MOV AX, @DATA 
    MOV DS,AX
    
    
    ;DISPLAY FIRST MSG
    
    MOV AH,9
    LEA DX, FIRST_MSG 
    INT 21H
    
    ;TAKE 1S'T INPUT
    MOV AH,1
    INT 21H
    MOV BL,AL  ;1ST INPUT STORED IN BL
    
    ;NEW LINE
    MOV AH,2
    MOV DL,0AH    ;10->0AH
    INT 21H 
    
    MOV DL,0DH    ;13 ->0DH
    INT 21H
     
    
    
    
    ;DISPLAY SECOND MSG
    
    MOV AH,9
    LEA DX, SECOND_MSG 
    INT 21H  
    
    ;TAKE 2ND INPUT
    MOV AH,1
    INT 21H
    MOV BH,AL     ;2ND INPUT STORED IN BH
    
    ;NEW LINE
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    ;DISPLAY THIRD MSG
    
    MOV AH,9
    LEA DX, THIRD_MSG 
    INT 21H  
    
    ;TAKE 3RD INPUT
    MOV AH,1
    INT 21H
    MOV CH,AL     ;3RD INPUT STORED IN CH
    
    ;NEW LINE
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    
    ;DISPLAY OUTPUT MSG
    
    MOV AH,9
    LEA DX, RESULT_MSG  
    INT 21H
    
    ;ADD
    ADD BL,BH   ; BL = BL + BH 
    SUB BL,48   ; SUB BL,30H / 48 
    
    ADD BL,CH   ; BL = BL + CH
    SUB BL,48
    ;SHOW OUTPUT RESULT  /DISPLAY
    MOV AH,2
    MOV DL,BL 
    INT 21H
    
    
    ;END
    
    MOV AH,4CH   
    INT 21H
    
    MAIN ENDP
END MAIN

    
    
    
    
    
    
    
    
    
    
    