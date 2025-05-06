       IDENTIFICATION DIVISION.
       PROGRAM-ID. pgcd.
       AUTHOR. lucas & thomas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-NUM1 PIC 9(3).
       01 WS-NUM2 PIC 9(3).
       01 WS-REST PIC 9(3).

       PROCEDURE DIVISION.

      *on demande à l'utilisateur d'entrer 2 nombre
           DISPLAY "entrer 2 nombres non nuls".
           ACCEPT WS-NUM1.
           ACCEPT WS-NUM2.

      *    PERFORM UNTIL WS-NUM1 EQUAL WS-NUM2 
      *        IF WS-NUM1 LESS THAN WS-NUM2
      *            SUBTRACT WS-NUM1 TO WS-NUM2
      *        ELSE
      *            SUBTRACT WS-NUM2 TO WS-NUM1
      *         END-IF

      *     END-PERFORM.
           PERFORM UNTIL WS-NUM2 EQUAL zero
               DIVIDE WS-NUM1 BY WS-NUM2 GIVING WS-REST
               MOVE WS-NUM2 TO WS-NUM1
               MOVE WS-REST TO WS-NUM2

           END-PERFORM
           DISPLAY "le pgcd est " WS-NUM1.

           STOP RUN.
