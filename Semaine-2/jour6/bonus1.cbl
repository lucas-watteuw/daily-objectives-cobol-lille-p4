       IDENTIFICATION DIVISION.
       PROGRAM-ID. bonus1.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-COMMAND PIC X(12).
       01 WS-TASK1 PIC X(12).
       01 WS-TASK2 PIC X(12).
       01 WS-TASK3 PIC X(12).
       01 WS-TASK4 PIC X(12).
       01 WS-TASK5 PIC X(12).

       PROCEDURE DIVISION.
           
      *l'utilisateur n'a pas encore entrer de commande
           PERFORM UNTIL EXIT
      *on demande à l'utilisateur d'entrer une commande
           DISPLAY "entrer une commande"
           DISPLAY "AJOUT pour ajouter une tache"
           DISPLAY "AFFICHER pour afficher les tache"
           DISPLAY "SUP pour supprimer une tache"
           DISPLAY "entrer n'importe quoi d'autre pour arrêter le " 
      -    "programme"
           ACCEPT WS-COMMAND

           EVALUATE WS-COMMAND
           WHEN EQUAL "AJOUT"
           DISPLAY "Vous voulez ajouter une tache"
           DISPLAY " "

           WHEN EQUAL "AFFICHER"
           DISPLAY "la tache1 est" WS-TASK1
           DISPLAY "la tache2 est" WS-TASK2
           DISPLAY "la tache3 est" WS-TASK3
           DISPLAY "la tache4 est" WS-TASK4
           DISPLAY "la tache5 est" WS-TASK5
           DISPLAY " "

           WHEN EQUAL "SUP"
           DISPLAY "Vous voulez supprimer une tache"
           DISPLAY " "

           WHEN OTHER
           STOP RUN

           END-EVALUATE

           END-PERFORM.
           
           DISPLAY "le programme se termine".

           STOP RUN.
