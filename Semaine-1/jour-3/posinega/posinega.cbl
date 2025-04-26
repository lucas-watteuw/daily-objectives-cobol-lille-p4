       IDENTIFICATION DIVISION.
       PROGRAM-ID. posinega.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-NUMBER1 PIC S9(5).

       PROCEDURE DIVISION.

           DISPLAY "Entrez un nombre".
           ACCEPT WS-NUMBER1.
      
      *on vérifie si le nombre est pair ou impair avec un if
           IF WS-NUMBER1 LESS THAN ZERO 
           DISPLAY "ce nombre est négatif"
           ELSE 
           DISPLAY "ce nombre est positif"
           END-IF.

      *on vérifie si le nombre est pair ou impair avec un evaluate
               
           EVALUATE WS-NUMBER1
           WHEN LESS THAN ZERO 
           DISPLAY "ce nombre est négatif"
           WHEN OTHER 
           DISPLAY "ce nombre est positif"
           END-EVALUATE.

           
           STOP RUN.
