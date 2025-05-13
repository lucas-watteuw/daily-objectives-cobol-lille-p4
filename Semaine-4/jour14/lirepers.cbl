       IDENTIFICATION DIVISION.
       PROGRAM-ID. lirepers.
       AUTHOR. lucas.

      *l'enviroment division est nécessaire pour lire des fichiers 
       ENVIRONMENT DIVISION.
      *la section qui gère les entrés et sorties de fichier du programme
       INPUT-OUTPUT SECTION.
      *section pour donnée un FD(file descriptor) à un fichier 
      *pour qu'on puisse le lire un peu plus tard
       FILE-CONTROL.
      *mot-clé SELECT pour assigner FD à un fichier
           SELECT FICHIER-PERS ASSIGN TO "personnes.txt"
      *on précise comment est organisé le fichier, sequentiel ou non
              ORGANIZATION IS LINE SEQUENTIAL.


       DATA DIVISION.
      *file section obligatoire pour travailler avec des fichiers
      *on déclare ce qu'on va chercher dans fichier
       FILE SECTION.
      *FD pour file descriptor
       FD FICHIER-PERS.
       01 LIGNE.
           05 F-NOM    PIC X(15).
           05 F-PRENOM PIC X(15).
           05 F-DATE   PIC X(8).


       WORKING-STORAGE SECTION.

      *index qui servira à parcourir les tableaux
       01 WS-INDEX PIC 99 VALUE 1.

      *tableau pour contenir nom et prénom des gens
       01 WS-TABLEAU-GENS.
           05 WS-GENS OCCURS 10 TIMES.
              10 WS-NOM    PIC X(15).
              10 WS-PRENOM PIC X(15).
              10 WS-DATE PIC X(8).
      *condition pour arrêter lecture
       77 WS-FIN-FICHIER   PIC X VALUE "C".

      *variable pour afficher la date à la fin
       01 WS-JOUR PIC 99.
       01 WS-MOIS PIC 99.
       01 WS-ANNEE PIC 9(4).

      *le nom chercher par l'utilisateur
       01 WS-NOM-CHERCHER PIC X(15).

       PROCEDURE DIVISION.

      *au début, il faut ouvrir le fichier
           OPEN INPUT FICHIER-PERS.

      *on a ouvert le fichier, on va le lire maintenant
           
           PERFORM UNTIL WS-FIN-FICHIER EQUAL "F"
              READ FICHIER-PERS
                 AT END 
                    MOVE "F" TO WS-FIN-FICHIER 
                 NOT AT END 
                    MOVE F-NOM TO WS-NOM(WS-INDEX)
                    MOVE F-PRENOM TO WS-PRENOM(WS-INDEX)
                    MOVE F-DATE TO WS-DATE(WS-INDEX)
                    ADD 1 TO WS-INDEX
              END-READ
           END-PERFORM.

      *après avoir lu le fichier, il faut fermer les fichier
           CLOSE FICHIER-PERS.

      *on parcourt la tableau pour afficher son contenu

           PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX EQUAL 11 
           DISPLAY "NOM : " WS-NOM(WS-INDEX) SPACE WITH NO ADVANCING
           DISPLAY "PRENOM : " WS-PRENOM(WS-INDEX)
           SPACE WITH NO ADVANCING
      *on met les jours, mois et année dans une variable spécifique 
      *pour afficher la date
           MOVE WS-DATE(WS-INDEX)(3:2) TO WS-JOUR
      *MOVE WS-DATE(WS-INDEX)(3:2) lit à partir du 3ème caractères les 2 qui suivent 
      *cela signifie que le caractère 3 et 4 seront placés dans WS-JOUR
           MOVE WS-DATE(WS-INDEX)(1:2) TO WS-MOIS
           MOVE WS-DATE(WS-INDEX)(5:4) TO WS-ANNEE
           DISPLAY "DATE : " WS-JOUR "/" WS-MOIS "/" WS-ANNEE
           END-PERFORM.

      *PARTIE 3

           DISPLAY "quelle est le nom de la personne recherché?".
           ACCEPT WS-NOM-CHERCHER.

      *on cherche le nom de la personne dans le tableau
           PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX EQUAL 11 
              IF WS-NOM-CHERCHER EQUAL WS-NOM(WS-INDEX)
                 DISPLAY "on a trouvé une personne"
                 DISPLAY "Son prénom est " WS-PRENOM(WS-INDEX)
      *on calcule l'age de la personne, on récupère son année de naissance
                 MOVE WS-DATE(WS-INDEX)(5:4) TO WS-ANNEE
                 SUBTRACT WS-ANNEE FROM 2025 GIVING WS-ANNEE
                 DISPLAY "Cette personne a " WS-ANNEE " ans."
              END-IF
           END-PERFORM.

           STOP RUN.
