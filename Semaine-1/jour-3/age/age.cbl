       IDENTIFICATION DIVISION.
       PROGRAM-ID. age.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01 WS-AGE PIC 9(3).

       PROCEDURE DIVISION.

           DISPLAY "Quelle est votre âge?".
           ACCEPT WS-AGE.

      *on commence par un evaluate 

           EVALUATE WS-AGE
      *on part du principe qu'il faut en 13 et 18 ans pour être un adolescent     
           WHEN LESS THAN 13
           DISPLAY "vous êtes un enfant."
           WHEN LESS THAN 18
           DISPLAY "vous êtes un adolescent"
           WHEN LESS THAN 64
           DISPLAY "vous êtes un adulte"
           WHEN OTHER 
           DISPLAY "vous êtes un senior"
           END-EVALUATE. 

      *on continue avec un IF

           IF WS-AGE LESS THAN 13
           DISPLAY "vous êtes un enfant."
           ELSE 
           IF WS-AGE LESS THAN 18 AND WS-AGE GREATER THAN 12
           DISPLAY "vous êtes un adolescent."
           ELSE 
           IF WS-AGE LESS THAN 64 AND WS-AGE GREATER THAN 17
           DISPLAY "vous êtes un adulte."
           ELSE 
           DISPLAY "vous êtes un senior."
           END-IF
           END-IF
           END-IF.



           STOP RUN.
