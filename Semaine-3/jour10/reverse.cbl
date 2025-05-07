       IDENTIFICATION DIVISION.
       PROGRAM-ID. reverse.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *le mot que l'utilisateur va entrer
       01 WS-MOT PIC X(10).

       PROCEDURE DIVISION.
           
      *on demande à l'utilisateur d'entrer un mot et on l'enregistre
           DISPLAY "entrer un mot".
           ACCEPT WS-MOT.
      
      *on affiche le mot inversé en pensant à retirer les espaces inutiles
           DISPLAY "le mot inversé est " 
           FUNCTION REVERSE(FUNCTION TRIM(WS-MOT)).
      
      *on arrête le programme
           STOP RUN.
