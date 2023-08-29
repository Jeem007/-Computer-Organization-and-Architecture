.MODEL SMALL
.STACK 100H
.DATA  
 MSG1 DB "GREATER VALUES CHECK BETWEEN TWO NUMBER $"
 MSG2 DB "GIVE TWO NUMBERS TO CHECK (0-9): $" 
 MSG3 DB "VOWEL CHECK.TYPE A LATER TO CHECK: $"   
 MSG4 DB "VOWEL $"
 MSG5 DB "NOT VOWEL $"

 
 
 
.CODE      

MAIN PROC 
    ;DATA SEGMENT INITIALIZE
    MOV AX,@DATA
    MOV DS,AX 
    
    ;MSG1 DISPLAY
    MOV AH,9
    LEA DX,MSG1
    INT 21H     
    
    ;NEW LINE
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    ;MSG2 DISPLAY
    
    MOV AH,9
    LEA DX,MSG2 
    INT 21H
    

    
    ;TAKING 2 INPUT FROM USER TO CHECK GREATER NUMBER
    
    MOV AH,1 
    INT 21H 
    MOV BL,AL 
     
            
   
    MOV AH,1 
    INT 21H
    MOV BH,AL  
    
    ;NEW LINE 
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H    
    
    
    
    
    
    
    
    ;COMPARE

    CMP BL,BH
    JG GREATER ;JG->JUMP GREATER TO LEVEL NAME GREATER  IF BL>BH 
    JL LESS    
    
    
    
      
    
    GREATER: 
    MOV AH,2
    MOV DL,BL
    INT 21H 
    JMP NEXT
  
    
    
    LESS:
    MOV AH,2
    MOV DL,BH
    INT 21H  
    JMP NEXT
    
    
    
    ;VOWEL CHECK
    
    NEXT:
   
    
    ;NEW LINE
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    
    
    ;MSG3 PRINT
    MOV AH,9
    LEA DX,MSG3
    INT 21H  

    
    ;TAKING INPUT FROM USER TO CHECK IT IS VOWEL
                                                                  
    MOV AH,1
    INT 21H 
    MOV CH,AL
 
    
         
    ;NEW LINE
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H

    
   
    
    CMP CH,'A'
    JE VOWEL
    CMP CH,'E'
    JE VOWEL
    CMP CH,'I'
    JE VOWEL
    CMP CH,'O'
    JE VOWEL
    CMP CH,'U'
    JE VOWEL
    JNE NOTVOWEL
    
    
    
    
    
    VOWEL: 
    MOV AH,9
    LEA DX,MSG4
    INT 21H 
    JMP NEXT1  
    
    NOTVOWEL:
    MOV AH,9
    LEA DX,MSG5
    INT 21H 
    JMP NEXT1
    
    
    
    ;LOOP PRACTICE
    NEXT1:  
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    ;PRINT MSG4 10 TIMES 
    
    MOV CX,10
    MOV AH,9
    LEA DX, MSG4 
    
    LEVEL:
        INT 21H
        LOOP LEVEL
        
    
    
    ;INCREMENT CHECK
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    
    
    ;HERE VALUE IS 5
    
    MOV CH,5
    ADD CH,48
    
    MOV AH,2
    MOV DL,CH
    INT 21H 
    
    ;HERE VALUE WILL BE 6
    
    INC CH
    MOV AH,2
    MOV DL,CH
    INT 21H 
       
    
    
   
    
    
                  
    END: 
    MOV AH,4CH
    INT 21H

    
    
    MAIN ENDP
END MAIN

