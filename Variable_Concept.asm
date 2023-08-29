.MODEL SMALL
.STACK 100H
.DATA 
MSG1 DB 3                   ;DB ->DEFINED BYTE OR WE CAN USE DW->DEFINED WORD .FOR SMALL DATA WE USE DB
MSG2 DB ?                  ; ? USED WHEN WE DONT INITIALIZE THE VALUE OF VARIABLE PRIMARILY 

.CODE
MAIN PROC
    
    ; FOR INITIALIZE .DATA SEGMENT

    MOV AX, @DATA
    MOV DS, AX
   
   
    ;DISPLAY MSG1 
    MOV AH,2 
    ADD MSG1,48
    MOV DL,MSG1
    INT 21H
    
    ;FOR MSG2 TAKE INPUT FROM USER
    MOV AH,1
    INT 21H
    MOV MSG2,AL    
      
    ;NEW LINE AND CARRIAGE RETURN
    
    MOV AH,2
    MOV DL,10
    INT 21H
       
    MOV DL,13
    INT 21H   
       
    
    ;DISPLAY MSG2
    
    MOV AH,2  
    MOV DL,MSG2
    INT 21H
    
      
    
    EXIT:
    MOV AH,4CH
    INT 21H  
    
    
    MAIN ENDP
END MAIN
    
    
    


