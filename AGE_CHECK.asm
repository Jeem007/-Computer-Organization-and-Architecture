.MODEL SMALL
.STACK 100H
.DATA  
MSG1 DB "Please ebter your age or quit the program: $" 

MSG2 DB "Thank you. Program ends here $"
MCHILD DB "You are a Child. $"
MTEENAGE DB "You are a Teenager. $"
MADULT DB "You are an Adult. $" 
MINVALID DB "INVALID INPUT. $"
MTHANKS DB "THANK YOU. PROGRAM ENDS HERE $"


.CODE
MAIN PROC
    
   ;DATA
   MOV AX, @DATA
   MOV DS, AX
   
   MOV DL,01H
 
   LOOP:
   
   ;MSG1
   MOV AH,9
   LEA DX,MSG1
   INT 21H 
   
   ;INPUT
   MOV AH,1
   INT 21H
   MOV BL,AL
   MOV DH,AL
   SUB BL,30H
   
   
   ;NEW LINE
   MOV AH,2
   MOV DL,10
   INT 21H
   MOV DL,13
   INT 21H
   
   ;0-2
   MOV CL,2 
   
   MOV CH,5 
   
   MOV BH,9
   
    
   CMP BL,CL
   JLE CHILD
   
   CMP BL,CH
   JLE TEENAGER
   
   CMP BL,BH
   JLE ADULT
   
   CMP DH,'q' 
   JE QUIT
   CMP DH,'Q' 
   JE QUIT
   
   JMP INVALID  

   INC DL
   JNZ LOOP
   
  
   CHILD:
   MOV AH,9
   LEA DX,MCHILD
   INT 21H
   MOV AH,2
   MOV DL,10
   INT 21H
   MOV DL,13
   INT 21H 
   JMP LOOP
   
   
   TEENAGER:
   MOV AH,9
   LEA DX,MTEENAGE
   INT 21H
   MOV AH,2
   MOV DL,10
   INT 21H
   MOV DL,13
   INT 21H 
   JMP LOOP 
   
   
   ADULT:
   
   MOV AH,9
   LEA DX,MADULT
   INT 21H
   MOV AH,2
   MOV DL,10
   INT 21H
   MOV DL,13
   INT 21H
   JMP LOOP
    
   
   INVALID:
   
   MOV AH,9
   LEA DX,MINVALID
   INT 21H
   MOV AH,2
   MOV DL,10
   INT 21H
   MOV DL,13
   INT 21H 
   JMP LOOP
   
   QUIT:
   MOV AH,9
   LEA DX,MTHANKS
   INT 21H 
   JMP EXIT
   
   
   
   EXIT:
   MOV AH,4CH
   INT 21H 
    
    MAIN ENDP
END MAIN