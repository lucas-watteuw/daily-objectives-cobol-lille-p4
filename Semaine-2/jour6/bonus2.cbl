       IDENTIFICATION DIVISION.
       PROGRAM-ID. bonus2.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-NOTE1 PIC 9(12).
       01 WS-NOTE2 PIC 9(12).
       01 WS-NOTE3 PIC 9(12).
       01 WS-NOTE4 PIC 9(12).
       01 WS-NOTE5 PIC 9(12).
       01 WS-MEAN PIC 9(12).
       01 WS-MAX PIC 9(12).
       01 WS-MIN PIC 9(12).

       01 WS-COMMAND PIC X(12).
       
       PROCEDURE DIVISION.

           DISPLAY "entrer le premier nombre".
           ACCEPT WS-NOTE1.

           DISPLAY "entrer le second nombre".
           ACCEPT WS-NOTE2.

           DISPLAY "entrer le troisième nombre".
           ACCEPT WS-NOTE3.

           DISPLAY "entrer le quatrième nombre".
           ACCEPT WS-NOTE4.

           DISPLAY "entrer le dernier nombre".
           ACCEPT WS-NOTE5.

      *on enregistre la moyenne
           COMPUTE WS-MEAN = FUNCTION MEAN(WS-NOTE1, WS-NOTE2, WS-NOTE3,
           WS-NOTE4, WS-NOTE5).

      *on enregistre la note maximum
           COMPUTE WS-MAX = FUNCTION MAX(WS-NOTE1, WS-NOTE2, WS-NOTE3,
           WS-NOTE4, WS-NOTE5).
      *on enregistre la note minimum
           COMPUTE WS-MIN = FUNCTION MIN(WS-NOTE1, WS-NOTE2, WS-NOTE3,
           WS-NOTE4, WS-NOTE5).

      *l'utilisateur n'a pas encore entrer de commande
           PERFORM UNTIL EXIT
           DISPLAY "Choississez ce que vous voulez faire"
           DISPLAY "MEAN pour la moyenne"
           DISPLAY "MAX pour la valeur maximum"
           DISPLAY "MIN pour la valeur minimum"
           DISPLAY " "

      *l'utilisateur entre une commande
           ACCEPT WS-COMMAND
       
           EVALUATE WS-COMMAND

           WHEN EQUAL "MEAN"
           DISPLAY "la moyenne est " WS-MEAN

           WHEN EQUAL "MAX"
           DISPLAY "le maximum est " WS-MAX

           WHEN EQUAL "MIN"
           DISPLAY "le minimum est " WS-MIN

           WHEN OTHER 
           DISPLAY "commande imcompréhensible, on arrête le programme"
           STOP RUN

           END-EVALUATE

           END-PERFORM.

           DISPLAY "Cette ligne ne s'affiche pas".

           STOP RUN.