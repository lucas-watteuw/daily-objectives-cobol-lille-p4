       IDENTIFICATION DIVISION.
       PROGRAM-ID. bonus1.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-COMMAND PIC X(12).
       01 WS-TASK1 PIC X(12) VALUE " ".
       01 WS-TASK2 PIC X(12) VALUE "codecademy".
       01 WS-TASK3 PIC X(12) VALUE "sololearn".
       01 WS-TASK4 PIC X(12) VALUE "jeux vidéo".
       01 WS-TASK5 PIC X(12) VALUE "mimo".

       01 WS-NUMBER-TASK PIC 9.
       01 WS-NEW-TASK PIC X(12).

       PROCEDURE DIVISION.
           
      *l'utilisateur n'a pas encore entrer de commande
           PERFORM UNTIL EXIT
      *on demande à l'utilisateur d'entrer une commande en affichant le menu
           DISPLAY "entrer une commande"
           DISPLAY "AJOUT pour ajouter une tache"
           DISPLAY "AFFICHER pour afficher les tache"
           DISPLAY "SUP pour supprimer une tache"
           DISPLAY "entrer n'importe quoi d'autre pour arrêter le " 
      -    "programme"
      *maintenant qu'on a afficher le menu, l'utilisateur peux entrer sa commande
           ACCEPT WS-COMMAND

           EVALUATE WS-COMMAND

      *si l'utilisateur veut ajouter une tache
           WHEN EQUAL "AJOUT"
           DISPLAY "Quelle est la nouvelle tache?"
           ACCEPT WS-NEW-TASK
           IF WS-TASK1 EQUAL " "
           MOVE WS-NEW-TASK TO WS-TASK1
           ELSE 
           IF WS-TASK2 EQUAL " "
           MOVE WS-NEW-TASK TO WS-TASK2
           ELSE 
           IF WS-TASK3 EQUAL " "
           MOVE WS-NEW-TASK TO WS-TASK3
           ELSE 
           IF WS-TASK4 EQUAL " "
           MOVE WS-NEW-TASK TO WS-TASK4
           ELSE
      *si aucune tache n'est libre, la tache 5 sera par défaut override 
           MOVE WS-NEW-TASK TO WS-TASK5
           END-IF
           END-IF
           END-IF
           END-IF


      *l'utilisateur veut afficher les taches, on afficher toutes les taches, mêmes les vides
           WHEN EQUAL "AFFICHER"
           DISPLAY "la tache1 est " WS-TASK1
           DISPLAY "la tache2 est " WS-TASK2
           DISPLAY "la tache3 est " WS-TASK3
           DISPLAY "la tache4 est " WS-TASK4
           DISPLAY "la tache5 est " WS-TASK5
           DISPLAY " "
          
      *si l'utilisateur veut supprimer une tache
           WHEN EQUAL "SUP"
      *on demande à l'utilisateur quelle tache il veut supprimer,
           DISPLAY "Quelle est le numéro de la tache a supprimé?"
           ACCEPT WS-NUMBER-TASK
           EVALUATE WS-NUMBER-TASK
           WHEN EQUAL 1
           MOVE " " to WS-TASK1
           WHEN EQUAL 2
           MOVE " " to WS-TASK2
           WHEN EQUAL 3
           MOVE " " to WS-TASK3
           WHEN EQUAL 4
           MOVE " " to WS-TASK4 
      *par défaut, la dernière tache sera supprimé même si l'utilisateur entre autre chose que 5
      *par exemple 0, 6, AA ...
           WHEN OTHER
           MOVE " " to WS-TASK5
           END-EVALUATE
           DISPLAY " "

      *dans le cas ou l'utilisateur à entrer une commande incompréhensible, on arrête le programme
           WHEN OTHER
           STOP RUN

           END-EVALUATE

           END-PERFORM.
           
           DISPLAY "cette ligne ne s'affiche jamais".

           STOP RUN.
