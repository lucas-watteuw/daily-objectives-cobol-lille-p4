       IDENTIFICATION DIVISION.
       PROGRAM-ID. count.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-COMPTEUR PIC 99 Value 0.

       PROCEDURE DIVISION.

      *on initialise le compteur à 1, on l'incrémente de 1 jusqu'a ce 
      *que le compteur soit égale à 11, on n'affiche pas 11 à la fin
      *     PERFORM VARYING WS-COMPTEUR FROM 1 BY 1 UNTIL WS-COMPTEUR 
      *     EQUAL 11
      *EQUAL 11 pour afficher le 10 à la fin
      *     DISPLAY WS-COMPTEUR
      *     END-PERFORM.
           

      
           PERFORM UNTIL WS-COMPTEUR EQUAL 10 
           
           ADD 1 TO WS-COMPTEUR
           DISPLAY WS-COMPTEUR
           END-PERFORM.

           STOP RUN.
