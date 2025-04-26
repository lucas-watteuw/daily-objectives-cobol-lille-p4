       IDENTIFICATION DIVISION.
       PROGRAM-ID. mul.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-NUMBER1 PIC 9(4).
       01 WS-NUMBER2 PIC 9(4).
       01 WS-RESULT  PIC 9(8).
       01 WS-RESULT2  PIC 9(8).

       PROCEDURE DIVISION.
           
           DISPLAY "entrez un nombre".
           ACCEPT WS-NUMBER1.

           DISPLAY "entrez un second nombre".
           ACCEPT WS-NUMBER2.

           MULTIPLY WS-NUMBER1 BY WS-NUMBER2 GIVING WS-RESULT.
           DISPLAY "le résultat en utilisant MULTIPLY est " WS-RESULT.

           COMPUTE WS-RESULT2 = WS-NUMBER1 * WS-NUMBER2.
           DISPLAY "le résultat en utilisant * est " WS-RESULT2.


           STOP RUN.
