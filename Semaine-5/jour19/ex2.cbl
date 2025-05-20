       IDENTIFICATION DIVISION.
       PROGRAM-ID. ex2.
       AUTHOR. lucas.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       	SELECT CLASSES ASSIGN TO "input-classes.txt"
       		ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       
       FILE SECTION.
       FD CLASSES.
      *l'organisation des informations du fichier input-classes.txt
       01 LIGNE.
           05 LIGNE-CLASSE PIC X(3).
           05 FILLER PIC X(2).
           05 LIGNE-NOM PIC X(8).
           05 FILLER PIC X.
           05 LIGNE-PRENOM PIC X(8).

       WORKING-STORAGE SECTION. 

      *le tableau de 2 classes qui contiennent au maximum 8 éléves
       01 WS-TAB-ELEVES.
       05 WS-CLASSE OCCURS 2 TIMES.       *> 1 = CM1, 2 = CM2
          10 WS-ELEVE OCCURS 8 TIMES.
             15 WS-NOM-ELEVE     PIC X(15).
             15 WS-PRENOM-ELEVE  PIC X(15).

      *les 2 index pour parcourir le tableau à 2 dimension
       01 WS-INDEX-COLONNE PIC 9.
       01 WS-INDEX-LIGNE PIC 9.

      *le nombre d'éléves de cm1 et de cm2
       01 WS-TOTAL-CM1 PIC 9(2) VALUE ZERO.
       01 WS-TOTAL-CM2 PIC 9(2) VALUE ZERO.

      *condition pour arrêter la lecture du fichier
       01 WS-LIRE PIC X VALUE "C".

      *le nom de famille entrer par l'utilisateur
       01 WS-NOM-DE-FAMILLE PIC X(15).

      ****************************************************************
       
       PROCEDURE DIVISION.

      *on commence par ouvrir le fichier
           OPEN INPUT CLASSES.

      *on lit le fichier
           PERFORM UNTIL WS-LIRE EQUAL "F" 
              READ CLASSES 
                 AT END 
                    MOVE "F" TO WS-LIRE
                 NOT AT END
      *si l'éléve est au cm1
                    IF LIGNE-CLASSE EQUAL "CM1"
      *on incrémente le nombre d'éléve au cm1
                       ADD 1 TO WS-TOTAL-CM1
      *on enregistre le nom et prénom de l'éléve dans le tableau
                       MOVE LIGNE-NOM TO WS-NOM-ELEVE(1, WS-TOTAL-CM1)
                       MOVE LIGNE-PRENOM TO WS-PRENOM-ELEVE(1, 
                       WS-TOTAL-CM1) 
      *sinon il est forcément au cm2              
                    ELSE
                       ADD 1 TO WS-TOTAL-CM2
                       MOVE LIGNE-NOM TO WS-NOM-ELEVE(2, WS-TOTAL-CM2) 
                       MOVE LIGNE-PRENOM TO WS-PRENOM-ELEVE(2, 
                       WS-TOTAL-CM2) 
                    END-IF
           END-PERFORM.
           
      *on ferme le fichier puiqu'on a fini de le lire
           CLOSE CLASSES.

           DISPLAY "entrer un nom de famille".
           ACCEPT WS-NOM-DE-FAMILLE.

      *on commence par regarder les éléves de cm1 

           PERFORM VARYING WS-INDEX-LIGNE FROM 1 BY 1 
           UNTIL WS-INDEX-LIGNE GREATER THAN WS-TOTAL-CM1 

              IF WS-NOM-DE-FAMILLE EQUAL WS-NOM-ELEVE(1, WS-INDEX-LIGNE)
                 DISPLAY "un éléve de cm1: " WS-PRENOM-ELEVE(1, 
                 WS-INDEX-LIGNE)
              END-IF
           END-PERFORM.

      *on commence par regarder les éléves de cm2

           PERFORM VARYING WS-INDEX-LIGNE FROM 1 BY 1 
           UNTIL WS-INDEX-LIGNE GREATER THAN WS-TOTAL-CM2 

              IF WS-NOM-DE-FAMILLE EQUAL WS-NOM-ELEVE(2, WS-INDEX-LIGNE)
                 DISPLAY "un éléve de cm2: " WS-PRENOM-ELEVE(2, 
                 WS-INDEX-LIGNE)
              END-IF
           END-PERFORM.


              
           STOP RUN.
