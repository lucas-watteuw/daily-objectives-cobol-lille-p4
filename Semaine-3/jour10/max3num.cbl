       IDENTIFICATION DIVISION.
       PROGRAM-ID. max3num.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *les 3 nombres entrer par l'utilisateur
       01 WS-NUM1 PIC 9(3).
       01 WS-NUM2 PIC 9(3).
       01 WS-NUM3 PIC 9(3).
      *le maximum entrer par l'utilisateur
       01 WS-MAX PIC 9(3).

       PROCEDURE DIVISION.
      *l'utilisateur entre 3 nombre
           DISPLAY "entrer 3 nombres".
           ACCEPT WS-NUM1.
           ACCEPT WS-NUM2.
           ACCEPT WS-NUM3.
       
      *on regarde le plus grand d'entre eux et on l'affiche
           COMPUTE WS-MAX = FUNCTION MAX(WS-NUM1, WS-NUM2, WS-NUM3).
           DISPLAY "le maximum est " WS-MAX.


           STOP RUN.
