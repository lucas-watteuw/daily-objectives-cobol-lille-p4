       IDENTIFICATION DIVISION.
       PROGRAM-ID. table.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-NOMBRE PIC 9(3).

       01 WS-COMPTEUR PIC 9(3).

       01 WS-RESULT PIC 9(4).

       PROCEDURE DIVISION.
           
           DISPLAY "entrer un nombre".
           ACCEPT WS-NOMBRE.

           PERFORM VARYING WS-COMPTEUR FROM 1 BY 1 UNTIL WS-COMPTEUR 
           EQUAL 11
           MULTIPLY WS-COMPTEUR BY WS-NOMBRE GIVING WS-RESULT
           DISPLAY WS-COMPTEUR " * " WS-NOMBRE " = " WS-RESULT
           END-PERFORM.

           STOP RUN.
