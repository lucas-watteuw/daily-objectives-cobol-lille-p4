      * écrire un programme qui calcule la conjecture de SYracuz à partir 
      *d'un entier non nul saisie par l'utilisateur jusqu'a ce que ce nombre soit 1
       IDENTIFICATION DIVISION.
       PROGRAM-ID. syracuz.
       AUTHOR. lucas & thomas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      
      *le nombre non nul entrer par l'utilisateur
       01 WS-NUMBER PIC 9(3) VALUE 0.
      *variable pour éviter un dépassement
       01 WS-NUMBER2 PIC 9(4).

      *variable qui enregistre le reste
       01 WS-REMAINDER PIC 9(3).
      *variable qui enregistre le quotient
       01 WS-RESULT PIC 9(3).


       PROCEDURE DIVISION.
       
      * on force l'utilisateur à entrer un nombre non nul
           PERFORM UNTIL WS-NUMBER NOT EQUAL 0
           DISPLAY "saisir un nombre non nul"
           ACCEPT WS-NUMBER
           END-PERFORM.

      *on stocke le nombre entré par l'utilisateur dans une autre variable qui peux contenir un chiffre de plus
           MOVE WS-NUMBER TO WS-NUMBER2.
       
      *on calcule la conjecture de Syracuz pour le nombre donné tant que celui-ci n'est pas égale à 1
           PERFORM UNTIL WS-NUMBER2 EQUAL 1 

      *on vérifie si le nombre est pair
           DIVIDE WS-NUMBER2 BY 2 
           GIVING WS-RESULT REMAINDER WS-REMAINDER
           
      *si le nombre est pair, on le divise par 2
           IF WS-REMAINDER EQUAL ZERO
           COMPUTE WS-NUMBER2 = WS-NUMBER2 / 2
           DISPLAY "le nombre vaut " WS-NUMBER2

      *sinon c'est qu'il est impair, il faut dans ce cas le multiplier par 3 et ensuite ajouter 1
           ELSE
           COMPUTE WS-NUMBER2 = WS-NUMBER2 * 3 + 1
           DISPLAY "le nombre vaut " WS-NUMBER2
           END-IF 
           END-PERFORM.


           STOP RUN.

