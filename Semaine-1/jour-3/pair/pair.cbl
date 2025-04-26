       IDENTIFICATION DIVISION.
       PROGRAM-ID. pair. 
       AUTHOR. lucas.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-NUMBER PIC S9(4).
       01 WS-QUOTIENT PIC S9(4).
       01 WS-RESTE PIC S9(4).

       PROCEDURE DIVISION.
           
           DISPLAY "entrer un nombre".
           ACCEPT WS-NUMBER.

           DIVIDE WS-NUMBER BY 2 GIVING WS-QUOTIENT REMAINDER WS-RESTE.
      *si le reste de la division est 0 lor le nombre est pair
           
           EVALUATE WS-RESTE
           WHEN EQUAL ZERO
           DISPLAY "nombre pair"
           WHEN OTHER 
           DISPLAY "nombre impair"
           END-EVALUATE.

           STOP RUN.
           