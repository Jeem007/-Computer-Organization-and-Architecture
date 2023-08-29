.MODEL SMALL
.STACK 100H
.DATA 
M DB 'Hello world $' ;we have to end string with this symbol $

.CODE

MAIN PROC
     ;1->SINGLE KEY INPUT
     ;2->SINGLE CHARACTER OUTPUT
     ;9->CHARACTER STRING OUTPUT
     
     
     ;INTIALIZE DATA SEGMENT
     
     MOV AX, @DATA
     MOV DS,AX
     
     
     ;PRINT STRING
     
     MOV AH,9    ;9 FOR STRING
     LEA DX, M
     INT 21H  
     
     
                                          
                                          
    ;PRINT NEW LINE & CARRIAGE RETURN
     MOV AH,2 
     MOV DL,10
     INT 21H
     
     MOV DL,13
     INT 21H
     
     ;INPUT FROM USER
     
     MOV AH,1
     INT 21H
     MOV BL,AL 
     
     
     ;PRINT NEW LINE & CARRIAGE RETURN
     
     MOV AH,2 
     MOV DL,10
     INT 21H
     
     MOV DL,13
     INT 21H
     
                  
     ;DISLAY INPUT  
   
     MOV AH,2
     MOV DL,BL
     INT 21H
    
                 
                 
     EXIT:
     MOV AH,4CH 
     INT 21H
     
     MAIN ENDP
END MAIN
     
     