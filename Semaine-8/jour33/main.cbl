       IDENTIFICATION DIVISION.
       PROGRAM-ID. user.
       AUTHOR. lucas.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *le fichier qui contient les utilisateurs à vérifier
           SELECT USERS ASSIGN TO "users.dat"
		         ORGANIZATION IS LINE SEQUENTIAL.

      *le fichier qui contiendra les messages d'erreur
           SELECT ERROR-FILE ASSIGN TO "errors.log"
                 ORGANIZATION IS LINE SEQUENTIAL.

      

       DATA DIVISION.
       FILE SECTION.

      *on a défini le contenu d'une ligne dans le fichier struct.copy
       FD USERS.
	      COPY "struct.copy".

      *une ligne de errors.log est défini comme un gran PIC X
       FD ERROR-FILE.
       01 LIGNE-ERREUR.
           05 LIGNE-ERREUR-CONTENU PIC X(88).

       WORKING-STORAGE SECTION.

      *la condition de lecture du fichier
       01 WS-CONDITION-LIRE PIC X VALUE "C".
      *le résultat pour email correct ou non
       01 WS-RETURN-CODE PIC 9.

      *le numéro de la ligne qui est en train d'être lue
       01 WS-NUM-LIGNE PIC 9(03) VALUE ZEROES.

      *un tableau pour se souvenir des lignes contenant un mail incorrect
       01 WS-TABLEAU-ERREUR.
           05 WS-TABLEAU OCCURS 999 TIMES.
      *pic z et non pic 9 pour pouvoir éliminer les 0 non significatifs
              10 WS-LIGNE-INCORRECT PIC Z(03).
              10 WS-MAIL-INCORRECT  PIC X(50).

      *le nombre d'élément dans le tableau des mail incorrect
       01 WS-TAILLE-TABLEAU PIC 9(03) VALUE ZEROES.


      *un tableau pour se souvenir des id incorrects
       01 WS-TABLEAU-ERREUR2.
           05 WS-TABLEAU2 OCCURS 999 TIMES.
      *pic z et non pic 9 pour pouvoir éliminer les 0 non significatifs
              10 WS-LIGNE-INCORRECT2 PIC Z(03).
              10 WS-ID-INCORRECT  PIC X(10).

      *le nombre d'élément dans le tableau des id clients incorrect
       01 WS-TAILLE-TABLEAU2 PIC 9(03) VALUE ZEROES.

      *un index pour parcourir le tableau
       01 WS-INDEX PIC 9(03).

      ******************************************************************
       PROCEDURE DIVISION.

      *on ouvre le fichier pour pouvoir le lire
           OPEN INPUT USERS.

      *on lit le fichier
           PERFORM UNTIL WS-CONDITION-LIRE EQUAL "F"
           READ USERS
              AT END
                 MOVE "F" TO WS-CONDITION-LIRE
              NOT AT END 
                 ADD 1 TO WS-NUM-LIGNE
      *on vérifie le mail
                 CALL "validate" using EMAIL WS-RETURN-CODE
      *on vérifie le code de retour
                 IF WS-RETURN-CODE NOT EQUAL 0 
      *on incrémente la taille du tableau des mail incorrect
                 ADD 1 TO WS-TAILLE-TABLEAU
      *on met le mail incorrect avec son numéro de ligne dans le tableau
                 MOVE WS-NUM-LIGNE 
                 TO WS-LIGNE-INCORRECT(WS-TAILLE-TABLEAU)
                 MOVE EMAIL TO WS-MAIL-INCORRECT(WS-TAILLE-TABLEAU)
                 END-IF
      *on vérifie l'id du client
                 CALL "validate-id" using ID-USER WS-RETURN-CODE
      *on vérifie le code de retour
                 IF WS-RETURN-CODE NOT EQUAL 0 
      *on incrémente la taille du tableau des id incorrect
                 ADD 1 TO WS-TAILLE-TABLEAU2
      *on met le mail incorrect avec son numéro de ligne dans le tableau
                 MOVE WS-NUM-LIGNE 
                 TO WS-LIGNE-INCORRECT2(WS-TAILLE-TABLEAU2)
                 MOVE ID-USER TO WS-ID-INCORRECT(WS-TAILLE-TABLEAU2)
                 END-IF
           END-PERFORM.

      *on a fini de lire, on ferme le fichier
           CLOSE USERS.




      *il faut maintenant écrire dans le fichier de sortie
           OPEN OUTPUT ERROR-FILE.

      *on commence par écrire les mails incorrect
           PERFORM VARYING WS-INDEX FROM 1 BY 1 
           UNTIL WS-INDEX GREATER THAN WS-TAILLE-TABLEAU
      *on commence par vider la ligne avant de commencer
              MOVE SPACES TO LIGNE-ERREUR-CONTENU
              STRING "[Ligne " 
      *même si les 0 non significatifs ne sont pas affichés,
      *leur espace est réservée par un espace qu'on enlève avec la fonction TRIM
              FUNCTION TRIM(WS-LIGNE-INCORRECT(WS-INDEX)) 
              '] Erreur : Email invalide "' 
      *on enlève les espaces vides à la fin du mail
              FUNCTION TRIM(WS-MAIL-INCORRECT(WS-INDEX)) '"'
              INTO LIGNE-ERREUR-CONTENU
      *on écrit maintenant dans le fichier
              WRITE LIGNE-ERREUR
           END-PERFORM.

      *on écrit maintenant les id incorrects
           PERFORM VARYING WS-INDEX FROM 1 BY 1 
           UNTIL WS-INDEX GREATER THAN WS-TAILLE-TABLEAU2
      *on commence par vider la ligne avant de commencer
              MOVE SPACES TO LIGNE-ERREUR-CONTENU
              STRING "[Ligne " 
      *même si les 0 non significatifs ne sont pas affichés,
      *leur espace est réservée par un espace qu'on enlève avec la fonction TRIM
              FUNCTION TRIM(WS-LIGNE-INCORRECT2(WS-INDEX)) 
              '] Erreur : id invalide "' 
              WS-ID-INCORRECT(WS-INDEX) '"'
              INTO LIGNE-ERREUR-CONTENU
      *on écrit maintenant dans le fichier
              WRITE LIGNE-ERREUR
           END-PERFORM.

      *on a fini d'écrire, on ferme le fichier
           CLOSE ERROR-FILE.

           STOP RUN.
