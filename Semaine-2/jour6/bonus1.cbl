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
           DISPLAY "1 ou AJOUT pour ajouter une tache"
           DISPLAY "2 ou AFFICHER pour afficher les tache"
           DISPLAY "3 ou SUP pour supprimer une tache"
           DISPLAY "entrer n'importe quoi d'autre pour arrêter le " 
      -    "programme"
      *maintenant qu'on a afficher le menu, l'utilisateur peux entrer sa commande
           ACCEPT WS-COMMAND


           EVALUATE WS-COMMAND

      *si l'utilisateur veut ajouter une tache
           WHEN EQUAL "AJOUT" OR EQUAL "1"
           DISPLAY "Quelle est la nouvelle tache?"
      *on enregistre la nouvelle tache de l'utilisateur
           ACCEPT WS-NEW-TASK
      *on vérifie que la nouvelle tache n'est pas déja présente dans les taches existantes
           IF  WS-NEW-TASK EQUAL WS-TASK1 OR 
           WS-NEW-TASK EQUAL WS-TASK2 OR
           WS-NEW-TASK EQUAL WS-TASK3 OR
           WS-NEW-TASK EQUAL WS-TASK4 OR
           WS-NEW-TASK EQUAL WS-TASK5 
           DISPLAY "la tache est deja présente"
           DISPLAY " "
           ELSE
      *on enregistre la nouvelle tache dans la première tache libre    
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
           END-IF



      *l'utilisateur veut afficher les taches, on afficher toutes les taches sauf les taches vides
           WHEN EQUAL "AFFICHER" OR EQUAL "2"
           IF WS-TASK1 NOT EQUAL " "
           DISPLAY "la tache1 est " WS-TASK1
           END-IF
           IF WS-TASK2 NOT EQUAL " "
           DISPLAY "la tache2 est " WS-TASK2
           END-IF
           IF WS-TASK3 NOT EQUAL " "
           DISPLAY "la tache3 est " WS-TASK3
           END-IF
           IF WS-TASK4 NOT EQUAL " "
           DISPLAY "la tache4 est " WS-TASK4
           END-IF
           IF WS-TASK5 NOT EQUAL " "
           DISPLAY "la tache5 est " WS-TASK5
           END-IF
           DISPLAY " "
          
      *si l'utilisateur veut supprimer une tache
           WHEN EQUAL "SUP" OR EQUAL "3"
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
           DISPLAY "on arrête le programme"
           STOP RUN

           END-EVALUATE

           END-PERFORM.
           
           DISPLAY "cette ligne ne s'affiche jamais".

           STOP RUN.
