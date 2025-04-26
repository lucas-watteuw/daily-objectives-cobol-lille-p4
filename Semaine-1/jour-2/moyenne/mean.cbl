       IDENTIFICATION DIVISION.
       PROGRAM-ID. mul.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-NUMBER1 PIC 9(4).
       01 WS-NUMBER2 PIC 9(4).
       01 WS-NUMBER3 PIC 9(4).
       01 WS-AVERAGE1 PIC 9(4).
       01 WS-AVERAGE2 PIC 9(4).
       01 WS-AVERAGE3 PIC 9(5).

       PROCEDURE DIVISION.

           DISPLAY "entrez le premier nombre".
           ACCEPT WS-NUMBER1.
          
           DISPLAY "entrez le second nombre".
           ACCEPT WS-NUMBER2.

           DISPLAY "entrez le dernier nombre".
           ACCEPT WS-NUMBER3.

           COMPUTE WS-AVERAGE1 = FUNCTION MEAN(WS-NUMBER1, WS-NUMBER2,
           WS-NUMBER3).

           COMPUTE WS-AVERAGE2 = (WS-NUMBER1 + WS-NUMBER2 + WS-NUMBER3)
           /3.

           ADD WS-NUMBER1 WS-NUMBER2 WS-NUMBER3 TO WS-AVERAGE3.
           DIVIDE WS-AVERAGE3 BY 3 GIVING WS-AVERAGE3.

           DISPLAY "la moyenne avec la fonction MEAN est " WS-AVERAGE1.
           
           DISPLAY "la moyenne avec + et / est " WS-AVERAGE2.

           DISPLAy "la moyenne avec ADD et DIVIDE est " WS-AVERAGE3.

           STOP RUN.
