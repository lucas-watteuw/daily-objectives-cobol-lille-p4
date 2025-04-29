       IDENTIFICATION DIVISION.
       PROGRAM-ID. mul.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-RESTE PIC 9(3).
       01 WS-COMPTEUR PIC 9(3).
       01 WS-QUOTIENT PIC 9(3).
       01 WS-COMPTEUR2 PIC 9(3).
       PROCEDURE DIVISION.

           DISPLAY "version non optimisée".

           PERFORM VARYING WS-COMPTEUR FROM 1 BY 1 UNTIL WS-COMPTEUR 
           EQUAL 100 
      *on divise le compteur par 3 pour récupérer le reste
           DIVIDE WS-COMPTEUR BY 3 GIVING WS-QUOTIENT REMAINDER WS-RESTE
      *si le reste est 0 alors on affiche la valeur du compteur
           IF WS-RESTE EQUAL ZERO 
           DISPLAY WS-COMPTEUR
           END-IF
           END-PERFORM.

           DISPLAY "version optimisée".

           PERFORM VARYING WS-COMPTEUR2 FROM 3 BY 3 UNTIL WS-COMPTEUR2 
           GREATER THAN 100
           DISPLAY WS-COMPTEUR2
           END-PERFORM.

           STOP RUN.
