       IDENTIFICATION DIVISION.
       PROGRAM-ID. insert.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
      *les éléments qui vont être mis dans la table USERS
       01 WS-ID-UTILISATEUR           PIC X(10).
       01 WS-NOM-UTILISATEUR          PIC X(50).
       01 WS-MOT-DE-PASSE-UTILISATEUR PIC X(50).


       EXEC SQL INCLUDE SQLCA END-EXEC.

       PROCEDURE DIVISION.

      *on demande 3 informations qui seront mis dans la table
           DISPLAY "quelle est l'id du client?(10 chiffres)".
           ACCEPT WS-ID-UTILISATEUR.
           DISPLAY "quelle est le nom du client? (50 lettres maximum)".
           ACCEPT WS-NOM-UTILISATEUR. 
           DISPLAY "Quelle est le mot de passe du client?(50caractère)".
           ACCEPT WS-MOT-DE-PASSE-UTILISATEUR.

           DISPLAY " ".
           DISPLAY "avec espace: "WS-MOT-DE-PASSE-UTILISATEUR.
           DISPLAY " ".
           DISPLAY "sans espace: "
           FUNCTION TRIM(WS-MOT-DE-PASSE-UTILISATEUR).

           EXEC SQL
               INSERT INTO USERS (ID_USER, NOM, PASSWORD_USER
               )
               VALUES (:WS-ID-UTILISATEUR, 
               :WS-NOM-UTILISATEUR, 
               :WS-MOT-DE-PASSE-UTILISATEUR
               )
           END-EXEC.
      *on vérifie si les données ont été insérées dans la table
           IF SQLCODE = 0
               DISPLAY "Insertion réussie."
           ELSE
               DISPLAY "Erreur d'insertion SQLCODE: " SQLCODE
           END-IF.
               
           EXEC SQL COMMIT END-EXEC.
      

           END PROGRAM "insert".
