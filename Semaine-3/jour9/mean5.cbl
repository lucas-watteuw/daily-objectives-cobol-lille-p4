       IDENTIFICATION DIVISION.
       PROGRAM-ID. mean5.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-NOTE-TABLEAU.
           05 WS-NOTE PIC 9(2) OCCURS 5 TIMES.

       01 WS-INDEX PIC 9.
       01 WS-MEAN PIC 9(2).
       01 WS-MEAN2 PIC 9(2).

       PROCEDURE DIVISION.

      *on remplit un tableau avec 5 note
           PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX GREATER 
           THAN 5
           DISPLAY "entrer une note"  
           ACCEPT WS-NOTE(WS-INDEX)
           END-PERFORM.
      
      *on utilise la fonction mean pour calculer la moyenne.
           COMPUTE WS-MEAN = FUNCTION MEAN(WS-NOTE(1), WS-NOTE(2),
           WS-NOTE(3), WS-NOTE(4), WS-NOTE(5)).
           DISPLAY "la moyenne avec fonction MEAN est " WS-MEAN.

      *on recalcul la moyenne différamment
      *on additione tous les nombres entre eux
           PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX GREATER 
           THAN 5
           ADD WS-NOTE(WS-INDEX) TO WS-MEAN2
           END-PERFORM.
      *on divise la somme par le nombre d'élément du tableau
           DIVIDE WS-MEAN2 BY 5 GIVING WS-MEAN2.
           DISPLAY "la moyenne avec somme et division est " WS-MEAN2.

           STOP RUN.
