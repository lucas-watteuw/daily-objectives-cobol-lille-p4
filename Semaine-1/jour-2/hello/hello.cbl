       IDENTIFICATION DIVISION.
       PROGRAM-ID. hello.
       AUTHOR. lucas.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-NOM PIC X(12).

       PROCEDURE DIVISION.

           DISPLAY "Quelle est votre nom?".

           ACCEPT WS-NOM.

           DISPLAY "votre nom est " WS-NOM.

           STOP RUN.

