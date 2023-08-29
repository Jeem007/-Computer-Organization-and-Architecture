.model small
.stack 100h
.code


main proc  
    
    ;1ST INPUT
    MOV AH,1             ;FOR INPUT WE USE AH AND FOR INTEGER VALUE 1  
    INT 21H
    MOV BL,AL            ;BY DEFAULT DATA WILL BE SAVE IN AL
    
    ;2ND INPUT   
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    ;FOR DISPLAY
    
    ;1s't Input Display
    MOV AH,2             ;INPUT TYPE ER DATA DISPLAY ER JONNO 2 USE KORTE HOY 
    MOV DL,BL              ; DL ER MADDHOME DATA DISPLAY KORTE HOY  
    INT 21H
    
    ;2nd Input Display
    
    MOV AH,2
    MOV DL,BH
    INT 21H   
    
    ;THIS BLOCK IS USED FOR RETURN TO THE OPERATING SYSTEM
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN