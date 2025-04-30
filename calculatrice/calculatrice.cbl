       IDENTIFICATION DIVISION.
       PROGRAM-ID. calculatrice.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *une calculatrice enregistre jusqu'a 9 chiffres après la ","

      *pour une opération mathématique, il faut au minimum 2 nombres
      *ainsi que le résultat
       01 WS-NOMBRE1 PIC S9(20).
       01 WS-NOMBRE2 PIC S9(20).
       01 WS-RESULT PIC S9(20).

      *chaine de caractère pour éviter répétition
       01 WS-ADD PIC X(72) VALUE "entrer un nombre différent de 0 si vo
      -     "us voulez faire une autre addition".
       01 WS-SUB PIC X(76) VALUE "entrer un nombre différent de 0 si vo
      -     "us voulez faire une autre soustraction".
       01 WS-MUL PIC X(78) VALUE "entrer un nombre différent de 0 si vo
      -     "us voulez faire une autre multiplication".
       01 WS-DIV PIC X(72) VALUE "entrer un nombre différent de 0 si vo
      -     "us voulez faire une autre division".


      *opération voulu par l'utilisateur
       01 WS-COMMAND PIC X(13).

       PROCEDURE DIVISION.

           PERFORM UNTIL EXIT
           
           DISPLAY "entrer votre commande"
           DISPLAY "1 pour l'addition"
           DISPLAY "2 pour la soustraction"
           DISPLAY "3 pour la multiplication"
           DISPLAY "4 pour la division"
           DISPLAY "5 pour la puissance"
           DISPLAY "autre pour arrêter le programme"
           ACCEPT WS-COMMAND

            EVALUATE WS-COMMAND
      *addition
               WHEN EQUAL "1"
               DISPLAY "Vous voulez faire une addition"
               MOVE 0 TO WS-RESULT
               DISPLAY "Entrer le premier nombre"
               ACCEPT WS-NOMBRE1
               DISPLAY "Entrer le second nombre"
               ACCEPT WS-NOMBRE2
               ADD WS-NOMBRE1 WS-NOMBRE2 TO WS-RESULT
               DISPLAY WS-NOMBRE1 " + " WS-NOMBRE2 " = " WS-RESULT
      
      *       si l'utilisateur veut refaire une addition avec le précédent résultat
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY WS-ADD 
               ACCEPT WS-NOMBRE2
               PERFORM UNTIL WS-NOMBRE2 EQUAL 0 
      *        on met 0 dans WS-RESULT car le MOVE WS-RESULT TO WS-NOMBRE1 ne met pas 
      *        automatiquement WS-RESULT à 0
      *        ADD WS-NOMBRE1 WS-NOMBRE2 TO WS-RESULT fait WS-RESULT += WS-NOMBRE1 + WS-NOMBRE2
               MOVE 0 TO WS-RESULT
               ADD WS-NOMBRE1 WS-NOMBRE2 TO WS-RESULT
               DISPLAY WS-NOMBRE1 " + " WS-NOMBRE2 " = " WS-RESULT
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY WS-ADD 
               ACCEPT WS-NOMBRE2
               END-PERFORM

      *soustraction
               WHEN EQUAL "2"
               DISPLAY "Vous voulez faire une soustraction"
               DISPLAY "Entrer le premier nombre"
               ACCEPT WS-NOMBRE1
               DISPLAY "Entrer le second nombre"
               ACCEPT WS-NOMBRE2
               SUBTRACT WS-NOMBRE2 FROM WS-NOMBRE1 GIVING WS-RESULT
               DISPLAY WS-NOMBRE1 " - " WS-NOMBRE2 " = " WS-RESULT
      *       si l'utilisateur veut soustraire un autre nombre de son résultat précédent
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY WS-SUB 
               ACCEPT WS-NOMBRE2
               PERFORM UNTIL WS-NOMBRE2 EQUAL 0 
               SUBTRACT WS-NOMBRE2 FROM WS-NOMBRE1 GIVING WS-RESULT
               DISPLAY WS-NOMBRE1 " - " WS-NOMBRE2 " = " WS-RESULT
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY WS-SUB 
               ACCEPT WS-NOMBRE2
               END-PERFORM

      *multiplication
               WHEN EQUAL "3"
               DISPLAY "Vous voulez faire une multiplication"
               DISPLAY "Entrer le premier nombre"
               ACCEPT WS-NOMBRE1
               DISPLAY "Entrer le second nombre"
               ACCEPT WS-NOMBRE2
               MULTIPLY WS-NOMBRE1 BY WS-NOMBRE2 GIVING WS-RESULT
               DISPLAY WS-NOMBRE1 " * " WS-NOMBRE2 " = " WS-RESULT
      *si l'utilisateur souhaite multiplier un autre nombre avec son résultat précédent
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY WS-MUL 
               ACCEPT WS-NOMBRE2
               PERFORM UNTIL WS-NOMBRE2 EQUAL 0 
               MULTIPLY WS-NOMBRE1 BY WS-NOMBRE2 GIVING WS-RESULT
               DISPLAY WS-NOMBRE1 " * " WS-NOMBRE2 " = " WS-RESULT
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY WS-MUL 
               ACCEPT WS-NOMBRE2
               END-PERFORM
               

      *division
               WHEN EQUAL "4"
               DISPLAY "Vous voulez faire une division"
               DISPLAY "Entrer le premier nombre"
               ACCEPT WS-NOMBRE1
               DISPLAY "Entrer le second nombre"
               ACCEPT WS-NOMBRE2
               DIVIDE WS-NOMBRE1 BY WS-NOMBRE2 GIVING WS-RESULT
               DISPLAY WS-NOMBRE1 " / " WS-NOMBRE2 " = " WS-RESULT
      *si l'utilisateur veut diviser son résultat par un autre nombre
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY WS-DIV
               ACCEPT WS-NOMBRE2
               PERFORM UNTIL WS-NOMBRE2 EQUAL 0 
               DIVIDE WS-NOMBRE1 BY WS-NOMBRE2 GIVING WS-RESULT
               DISPLAY WS-NOMBRE1 " / " WS-NOMBRE2 " = " WS-RESULT
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY WS-MUL 
               ACCEPT WS-NOMBRE2
               END-PERFORM

      *puissance         
               WHEN EQUAL "5"
               DISPLAY "Vous voulez mettre à la puissance"
      *fin du programme
               WHEN OTHER
               DISPLAY "commande inconnu, arrêt du programme"
               STOP RUN
            END-EVALUATE

      
      
     

           END-PERFORM.
           

           STOP RUN.
