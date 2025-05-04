       IDENTIFICATION DIVISION.
       PROGRAM-ID. calculatrice.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *pour une opération mathématique, il faut au minimum 2 nombres
      *ainsi que le résultat
       01 WS-NOMBRE1 PIC S9(4).
       01 WS-NOMBRE2 PIC S9(4).
       01 WS-RESULT PIC S9(4).

      *chaine de caractère pour éviter répétition
       01 WS-ADD PIC X(72) VALUE "entrer un nombre différent de 0 si vo
      -     "us voulez faire une autre addition".
       01 WS-SUB PIC X(76) VALUE "entrer un nombre différent de 0 si vo
      -     "us voulez faire une autre soustraction".
       01 WS-MUL PIC X(78) VALUE "entrer un nombre différent de 0 si vo
      -     "us voulez faire une autre multiplication".
       01 WS-DIV PIC X(72) VALUE "entrer un nombre différent de 0 si vo
      -     "us voulez faire une autre division".
       01 WS-PUI PIC X(73) VALUE "entrer un nombre différent de 0 si vo
      -     "us voulez faire une autre puissance".
       01 WS-ASKNUM1 PIC X(24) VALUE "Entrer le premier nombre".


      *opération voulu par l'utilisateur
       01 WS-COMMAND PIC X(2).

       PROCEDURE DIVISION.

           PERFORM UNTIL EXIT
           
           DISPLAY "entrer votre commande"
           DISPLAY "0 pour l'addition"
           DISPLAY "1 pour la soustraction"
           DISPLAY "2 pour la multiplication"
           DISPLAY "3 pour la division"
           DISPLAY "4 pour la puissance"
           DISPLAY "5 pour l'addition avec le nombre précédamment calc"
      -    "ulée"
           DISPLAY "6 pour la soustraction avec le nombre précédamment"
      -    "calculée"
           DISPLAY "7 pour la multiplication avec le nombre précédamme"
      -    "nt calculée"
           DISPLAY "8 pour la division avec le nombre précédamment cal
      -    "culée"
           DISPLAY "9 pour la puissance avec le nombre précédamment ca
      -    "lculée"
           DISPLAY "autre pour arrêter le programme"
           ACCEPT WS-COMMAND

            EVALUATE WS-COMMAND
      *addition
               WHEN EQUAL "0"
               DISPLAY "Vous voulez faire une addition"
               MOVE 0 TO WS-RESULT
               DISPLAY WS-ASKNUM1
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
               WHEN EQUAL "1"
               DISPLAY "Vous voulez faire une soustraction"
               DISPLAY WS-ASKNUM1
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
               WHEN EQUAL "2"
               DISPLAY "Vous voulez faire une multiplication"
               DISPLAY WS-ASKNUM1
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
               WHEN EQUAL "3"
               DISPLAY "Vous voulez faire une division"
               DISPLAY WS-ASKNUM1
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
               DISPLAY WS-DIV
               ACCEPT WS-NOMBRE2
               END-PERFORM

      *puissance         
               WHEN EQUAL "4"
               DISPLAY "Vous voulez mettre à la puissance"
               DISPLAY "Entrer le nombre qui sera mis à la puissance"
               ACCEPT WS-NOMBRE1
               DISPLAY "Entrer la puissance"
               ACCEPT WS-NOMBRE2
               COMPUTE WS-RESULT = WS-NOMBRE1 ** WS-NOMBRE2
               DISPLAY WS-NOMBRE1 " ** " WS-NOMBRE2 " = " WS-RESULT
      *si l'utilisateur veut continuer à mettre le résultat à une autre puissance
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY WS-PUI
               ACCEPT WS-NOMBRE2
               PERFORM UNTIL WS-NOMBRE2 EQUAL 0 
               COMPUTE WS-RESULT = WS-NOMBRE1 ** WS-NOMBRE2
               DISPLAY WS-NOMBRE1 " ** " WS-NOMBRE2 " = " WS-RESULT
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY WS-PUI 
               ACCEPT WS-NOMBRE2
               END-PERFORM

      *addition avec le précédent résultat
               WHEN EQUAL "5"
               DISPLAY "Vous voulez faire une addition avec le précéde"
      -        "nt résultat"
               MOVE WS-RESULT TO WS-NOMBRE1
      *on met 0 dans result pour éviter que ce qu'il y a dans WS-RESULT ne viennent fausser le calcul
               MOVE 0 TO WS-RESULT
               DISPLAY "Entrer le nombre à ajouter"
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

      *soustraction avec le précédent résultat
               WHEN EQUAL "6"
               DISPLAY "Vous voulez faire une soustraction avec le résu
      -        "ltat précédent"
               DISPLAY "Entrer le nombre à soustraire du résultat pré 
      -        "cédent "
               ACCEPT WS-NOMBRE2
               MOVE WS-RESULT TO WS-NOMBRE1
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
               
      *multiplication avec le résultat précedent
               WHEN EQUAL "7"
               DISPLAY "Vous voulez faire une multiplication avec le rés
      -        "ultat précédent"
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY "Entrer un nombre"
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

      *division avec le précédent résultat

               WHEN EQUAL "8"
               DISPLAY "Vous voulez faire une division avec le résultat 
      -        " précédent"
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY "Entrer un nombre"
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
               DISPLAY WS-DIV
               ACCEPT WS-NOMBRE2
               END-PERFORM

      *puissance avec le précédent résultat
               WHEN EQUAL "9"
               DISPLAY "Vous voulez mettre à la puissance"
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY "Entrer la puissance"
               ACCEPT WS-NOMBRE2
               COMPUTE WS-RESULT = WS-NOMBRE1 ** WS-NOMBRE2
               DISPLAY WS-NOMBRE1 " ** " WS-NOMBRE2 " = " WS-RESULT
      *si l'utilisateur veut continuer à mettre le résultat à une autre puissance
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY WS-PUI
               ACCEPT WS-NOMBRE2
               PERFORM UNTIL WS-NOMBRE2 EQUAL 0 
               COMPUTE WS-RESULT = WS-NOMBRE1 ** WS-NOMBRE2
               DISPLAY WS-NOMBRE1 " ** " WS-NOMBRE2 " = " WS-RESULT
               MOVE WS-RESULT TO WS-NOMBRE1
               DISPLAY WS-PUI 
               ACCEPT WS-NOMBRE2
               END-PERFORM

               


      *fin du programme
               WHEN OTHER
               DISPLAY "commande inconnu, arrêt du programme"
               STOP RUN
            END-EVALUATE

      
      
     

           END-PERFORM.
           

           STOP RUN.
