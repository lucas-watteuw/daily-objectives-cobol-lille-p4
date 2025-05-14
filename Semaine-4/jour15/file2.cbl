       IDENTIFICATION DIVISION.
       PROGRAM-ID. file2.
       AUTHOR. lucas.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENT ASSIGN TO "clients.txt"
              ORGANIZATION IS LINE SEQUENTIAL.

           SELECT COMMANDE ASSIGN TO "num-commandes.txt"
              ORGANIZATION IS LINE SEQUENTIAL.


       DATA DIVISION.
       FILE SECTION.
       FD CLIENT.
       01 LIGNE-CLIENT.
           05 NUM-CLIENT PIC 9(2).
           05 NOM-CLIENT PIC X(14).
           05 PRENOM-CLIENT PIC X(11).

       FD COMMANDE.
       01 LIGNE-COMMANDE.
           05 NUM-CLIENT-COMMANDE PIC 9(2).
           05 NUM-COMMANDE1 PIC 9(4).
           05 NUM-COMMANDE2 PIC 9(5).

       WORKING-STORAGE SECTION.

      *la table qui stockera les infos des clients
       01 WS-TABLE.
           05 WS-INFO-CLIENT OCCURS 15 TIMES.
              10 WS-NUM-CLIENT PIC 9(2).
              10 WS-NOM-CLIENT PIC X(14).
              10 WS-PRENOM-CLIENT PIC X(11).

      *condition pour arrêter la lecture d'un fichier
       01 WS-CONDITION PIC X VALUE "C".

      *le nombre de client
       01 WS-NOMBRE-CLIENT PIC 99 VALUE 1.

       PROCEDURE DIVISION.
      *on commence par ouvrir le fichier clients.txt
           OPEN INPUT CLIENT.

      *on enregistre tous le fichier clients.txt dans une table
           PERFORM UNTIL WS-CONDITION EQUAL "F"
              READ CLIENT 
                 AT END
                    MOVE "F" TO WS-CONDITION
                 NOT AT END  
                    MOVE NUM-CLIENT TO WS-NUM-CLIENT(WS-NOMBRE-CLIENT)
                    MOVE NOM-CLIENT TO WS-NOM-CLIENT(WS-NOMBRE-CLIENT)
                    MOVE PRENOM-CLIENT TO 
                       WS-PRENOM-CLIENT(WS-NOMBRE-CLIENT)
                    ADD 1 TO WS-NOMBRE-CLIENT
           END-PERFORM.


      *on ferme le fichier clients.txt
           CLOSE CLIENT.


      *on réinitialise la condition de lecture
           MOVE "C" TO WS-CONDITION.

      *on ouvre le fichier num-commandes.txt
           OPEN INPUT COMMANDE.

      *on lit le fichier
      *si le numéro client de la commande correspond à un client dans la table 
      *on affiche le numéro client, numéro commande, nom client, prénom client
      *sinon il n'y a rien à faire  
           PERFORM UNTIL WS-CONDITION EQUAL "F"
              READ COMMANDE 
                 AT END 
                    MOVE "F" TO WS-CONDITION 
                 NOT AT END 
           END-PERFORM.


      *on ferme le fichier
           CLOSE COMMANDE.

           STOP RUN.
