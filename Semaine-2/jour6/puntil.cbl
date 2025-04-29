       IDENTIFICATION DIVISION.
       PROGRAM-ID. puntil.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *VALUE 5 pour éviter une initialisation à 0
       01 WS-NUMBER PIC 9(12) VALUE 5.

       PROCEDURE DIVISION.

      *on reste dans la boucle tant que l'utilisateur
      *n'entre pas 0 ou une série de lettre
           PERFORM UNTIL WS-NUMBER EQUAL 0 
           DISPLAY "entrez un nombre"
           ACCEPT WS-NUMBER
           DISPLAY "vous avez entré" WS-NUMBER
           END-PERFORM.

           STOP RUN.
