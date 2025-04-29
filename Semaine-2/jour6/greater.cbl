       IDENTIFICATION DIVISION.
       PROGRAM-ID. greater.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-MAX-NUMBER PIC 9(3).
       01 WS-NOMBRE PIC 9(3).

       PROCEDURE DIVISION.

      *on enregistre le premier nombre que l'utilisateur a entrer dans 2 variable différentes
           DISPLAY "Entrer un nombre".
           ACCEPT WS-MAX-NUMBER.
           COMPUTE WS-NOMBRE = WS-MAX-NUMBER.
           DISPLAY WS-MAX-NUMBER WS-NOMBRE.

      *on vérifie si l'utilisateur a entrer un 0
           PERFORM UNTIL WS-NOMBRE EQUAL ZERO
           DISPLAY "Entrer un nombre"
           ACCEPT WS-NOMBRE
           IF WS-NOMBRE GREATER THAN WS-MAX-NUMBER
           COMPUTE WS-MAX-NUMBER = WS-NOMBRE
           END-PERFORM.

           DISPLAY "le plus grand nombre entrer est " WS-MAX-NUMBER.

           STOP RUN.
