       IDENTIFICATION DIVISION.
       PROGRAM-ID. elevesRE.
       AUTHOR. lucas.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ELEVES ASSIGN TO "eleves.txt"
              ORGANIZATION IS LINE SEQUENTIAL.

           SELECT REUSSI ASSIGN TO "reussite.txt"
              ORGANIZATION IS LINE SEQUENTIAL.



       DATA DIVISION.
       FILE SECTION. 
       FD ELEVES.
       01 LIGNE.
           05 NOM PIC X(10).
           05 NOTES PIC 9(2).

       FD REUSSI.   
       01 LIGNE-REUSSI.
           05 NOM-REUSSI PIC X(10).
           05 NOTES-REUSSI PIC 9(2).

       WORKING-STORAGE SECTION. 

      *index pour savoir combien d'éléves ont réussi
       01 WS-INDEX-READ PIC 9(3) VALUE 1.

      *tableau contenant les éléves qui ont plus que 10
       01 WS-TABLEAU-REU.
           05 WS-ETUDIANT OCCURS 15 TIMES.
              10 WS-NOM PIC X(10).
              10 WS-NOTES PIC 9(2). 

      *conditions pou arrêter lecture de fichier
       01 WS-FIN-LIRE PIC X VALUE "C".

      *index pour écrire dans réussite.txt 
       01 WS-INDEX-ECRIT PIC 9(3).



       PROCEDURE DIVISION.

      *on commence par ouvrir le fichier pour le lire
           OPEN INPUT ELEVES.
           
      *on va lire le fichier et enregistrer les résultats dans un tableau
           PERFORM UNTIL WS-FIN-LIRE EQUAL "F"
              READ ELEVES
              AT END 
                 MOVE "F" TO WS-FIN-LIRE
              NOT AT END 
                 IF NOTES GREATER THAN 10
                    MOVE NOM TO WS-NOM(WS-INDEX-READ)
                    MOVE NOTES TO WS-NOTES(WS-INDEX-READ)
                    ADD 1 TO WS-INDEX-READ
      *on affiche les éléves qui ont 10 ou moins
                  ELSE  
                    DISPLAY "echoué " NOM NOTES
                  END-IF

           END-PERFORM.

      *on n'oublie pas de fermer le fichier
           CLOSE ELEVES.

      *maintenant que les éléves qui ont réussi sont dans le tableau, on peux les écrires dans le fichier reussite.txt 

           OPEN OUTPUT REUSSI.
           
      *on sait combien d'éléves ont réussi 
           PERFORM VARYING WS-INDEX-ECRIT FROM 1 BY 1 
           UNTIL WS-INDEX-ECRIT EQUAL WS-INDEX-READ
           
              MOVE WS-NOM(WS-INDEX-ECRIT) TO NOM-REUSSI
              MOVE WS-NOTES(WS-INDEX-ECRIT) TO NOTES-REUSSI
              WRITE LIGNE-REUSSI

           END-PERFORM. 


           CLOSE REUSSI
           
           
           STOP RUN.
