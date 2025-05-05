       IDENTIFICATION DIVISION.
       PROGRAM-ID. code3.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-NOTE-TABLEAU.
           05 WS-NOTE PIC 9(2) OCCURS 3 TIMES.

       77 WS-INDEX PIC 9.

       PROCEDURE DIVISION.


      *on entre 3 note dans un tableau 
           PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX GREATER 
           THAN 3
           DISPLAY "entrer une note"  
           ACCEPT WS-NOTE(WS-INDEX)
           END-PERFORM.

      *on affiche tous les éléments du tableau sur la même ligne
           DISPLAY "on affiche tous le tableau".
           DISPLAY WS-NOTE-TABLEAU.

      *on affiche tous les éléments du tableau mais seulement un élément par ligne
           DISPLAY "on afficher les éléments du tableau 1 par 1".

           PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX GREATER 
           THAN 3 
           DISPLAY WS-NOTE(WS-INDEX)
           END-PERFORM.


           STOP RUN.
