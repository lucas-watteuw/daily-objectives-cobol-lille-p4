       IDENTIFICATION DIVISION.
       PROGRAM-ID. liregens.
       AUTHOR. lucas.

      *l'enviroment division est nécessaire pour lire des fichiers 
       ENVIRONMENT DIVISION.
      *la section qui gère les entrés et sorties de fichier du programme
       INPUT-OUTPUT SECTION.
      *section pour donnée un FD(file descriptor) à un fichier 
      *pour qu'on puisse le lire un peu plus tard
       FILE-CONTROL.
      *mot-clé SELECT pour assigner FD à un fichier
           SELECT FICHIER-GENS ASSIGN TO "gens.txt"
      *on précise comment est organisé le fichier, sequentiel ou non
              ORGANIZATION IS LINE SEQUENTIAL.


       DATA DIVISION.
      *file section obligatoire pour travailler avec des fichiers
      *on déclare ce qu'on va chercher dans fichier
       FILE SECTION.
      *FD pour file descriptor
       FD FICHIER-GENS.
       01 LIGNE.
           05 F-NOM    PIC X(12).
           05 F-PRENOM PIC X(12).




       WORKING-STORAGE SECTION.

      *index qui servira à parcourir les tableaux
       01 WS-INDEX PIC 99 VALUE 1.

      *tableau pour contenir nom et prénom des gens
       01 WS-TABLEAU-GENS.
           05 WS-GENS OCCURS 10 TIMES.
              10 WS-NOM    PIC X(12).
              10 WS-PRENOM PIC X(12).
      *condition pour arrêter lecture
       77 WS-FIN-FICHIER   PIC X VALUE "C".

       PROCEDURE DIVISION.

      *au début, il faut ouvrir le fichier
           OPEN INPUT FICHIER-GENS.

      *on a ouvert le fichier, on va le lire maintenant
           
           PERFORM UNTIL WS-FIN-FICHIER EQUAL "F"
              READ FICHIER-GENS
                 AT END 
                    MOVE "F" TO WS-FIN-FICHIER 
                 NOT AT END 
                    MOVE F-NOM TO WS-NOM(WS-INDEX)
                    MOVE F-PRENOM TO WS-PRENOM(WS-INDEX)
                    ADD 1 TO WS-INDEX
              END-READ
           END-PERFORM.

      *après avoir lu le fichier, il faut fermer les fichier
           CLOSE FICHIER-GENS.

      *on parcourt la tableau pour afficher son contenu

           PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX EQUAL 11 
           DISPLAY "NOM : " WS-NOM(WS-INDEX) SPACE WITH NO ADVANCING
           DISPLAY "PRENOM : " WS-PRENOM(WS-INDEX)
           END-PERFORM.

           STOP RUN.
