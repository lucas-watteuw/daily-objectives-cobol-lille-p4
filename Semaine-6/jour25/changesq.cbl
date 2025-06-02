       IDENTIFICATION DIVISION.
       PROGRAM-ID. changesq.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
      *champ de la table
       01  CLIENT-NOM     PIC X(50).
       01  CLIENT-PRENOM  PIC X(50).
       01  CLIENT-TELEPHONE     PIC X(10).
       01  CLIENT-ID        PIC 9(4).
      *pour se connecter à la database
       01  USERNAME       PIC X(30) VALUE "postgres".
       01  PASSWD         PIC X(30) VALUE "mdp".
       01  DBNAME         PIC X(10) VALUE "testdb".
       EXEC SQL END DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE SQLCA END-EXEC.
      
      *le numéro de la commande entré par l'utilisateur
       01 WS-COMMANDE PIC 9.
      *l'id entré par l'utilisateur
       01 WS-UTILISATEUR-ID PIC 9(4).

       PROCEDURE DIVISION.

      *on commence par se connecter à la base de donnée
           DISPLAY "Connexion à la base de données...".
           
           EXEC SQL
                CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME
           END-EXEC.
           
      *si on n'arrive pas à se connecter
           IF SQLCODE NOT = 0
               DISPLAY "Erreur de connexion SQLCODE: " SQLCODE
               STOP RUN
           END-IF.


      *maintenant que l'on est connecté à la database, on demande à
      *l'utilisateur ce qu'il veut faire

           DISPLAY "que voulez-vous faire?".
           DISPLAY "1 pour ajouter un individu".
           DISPLAY "2 pour lire un individu".
           DISPLAY "3 pour modifier un individu".
           DISPLAY "4 pour supprimer un individu".
           DISPLAY "5 pour afficher toute la table".
           DISPLAY "pour quitter le programme, entrer autre chose".
           ACCEPT WS-COMMANDE.

           EVALUATE WS-COMMANDE
           
           WHEN EQUAL 1 

              PERFORM ECRIT-INDIVIDU THRU END-ECRIT-INDIVIDU 
               

           WHEN EQUAL 2
              
              DISPLAY "vous voulez lire quelqu'un"
              DISPLAY "entrer un id"
              ACCEPT WS-UTILISATEUR-ID

      *on essaie de lire une donné dans la table
              EXEC SQL
                  SELECT nom, prenom, telephone
                  INTO :CLIENT-NOM, :CLIENT-PRENOM, :CLIENT-TELEPHONE
                  FROM individus
                  WHERE id = :WS-UTILISATEUR-ID
              END-EXEC
      *on vérifie si la lecture est réussi
              IF SQLCODE = 0
                  DISPLAY "lecture réussie."
                  DISPLAY "le nom est " CLIENT-NOM
                  DISPLAY "le prénom est " CLIENT-PRENOM
                  DISPLAY "le téléphone est " CLIENT-TELEPHONE
              ELSE
                  DISPLAY "Erreur de lecture SQLCODE: " SQLCODE
              END-IF
                  
              EXEC SQL COMMIT END-EXEC
           


           WHEN EQUAL 3 
              DISPLAY "vous voulez modifier quelqu'un"
              DISPLAY "entrer un id"
              ACCEPT WS-UTILISATEUR-ID
              DISPLAY "entrer le nouveau nom"
              ACCEPT CLIENT-NOM
              DISPLAY "entrer le nouveau prénom"
              ACCEPT CLIENT-PRENOM
              DISPLAY "entrer le nouveau téléphone"
              ACCEPT CLIENT-TELEPHONE

      *on essaie de modifier une donné dans la table
              EXEC SQL
              UPDATE individus 
              SET prenom = :CLIENT-PRENOM, nom = :CLIENT-NOM, 
              telephone = :CLIENT-TELEPHONE
              WHERE id = :WS-UTILISATEUR-ID
              END-EXEC
      *on vérifie si la modification est réussi
              IF SQLCODE = 0
                  DISPLAY "modification réussie."
              ELSE
                  DISPLAY "Erreur de modification SQLCODE: " SQLCODE
              END-IF
                  
              EXEC SQL COMMIT END-EXEC
           
           WHEN EQUAL 4 
              DISPLAY "vous voulez supprimer quelqu'un"
              DISPLAY "entrer un id"
              ACCEPT WS-UTILISATEUR-ID

              EXEC SQL
              DELETE FROM individus
              WHERE id = :WS-UTILISATEUR-ID
              END-EXEC
      *on vérifie si la suppression est réussi
              IF SQLCODE = 0
                  DISPLAY "suppression réussie."
              ELSE
                  DISPLAY "Erreur de suppression SQLCODE: " SQLCODE
              END-IF
                  
              EXEC SQL COMMIT END-EXEC

           WHEN EQUAL 5 
              DISPLAY "vous voulez afficher toute la table"
      *on déclare un cursor
              EXEC SQL
              DECLARE curseur CURSOR FOR
              SELECT *
              FROM individus
                 FOR READ ONLY
              END-EXEC
      *on ouvre le curseur
              EXEC SQL
                 OPEN curseur
              END-EXEC
      *on lit le curseur tant que le sqlcode n'est pas à 100
              PERFORM UNTIL SQLCODE = 100
                 EXEC SQL
                    FETCH curseur into :CLIENT-ID, :CLIENT-NOM, 
                    :CLIENT-PRENOM, :CLIENT-TELEPHONE
                 END-EXEC
      *on affiche le résultat ligne par ligne
                 DISPLAY CLIENT-ID " " CLIENT-NOM " " CLIENT-PRENOM " " 
                 CLIENT-TELEPHONE
              END-PERFORM
      *on ferme le curseur
              EXEC SQL
                 CLOSE curseur
              END-EXEC


           WHEN OTHER 
              DISPLAY "vous voulez quitter le programme"

           END-EVALUATE.


           STOP RUN.


       ECRIT-INDIVIDU.

           DISPLAY "vous voulez ajouter quelqu'un".
      *on récupère les donnés à insérer
           DISPLAY "Entrez le nom du client : ".
           ACCEPT CLIENT-NOM.
           DISPLAY "Entrez le prénom du client : ".
           ACCEPT CLIENT-PRENOM.
           DISPLAY "Entrez le numéro de téléphone : ".
           ACCEPT CLIENT-TELEPHONE.
      *on essaie d'insérer les données dans la table
           EXEC SQL
               INSERT INTO individus (nom, prenom, telephone)
               VALUES (:CLIENT-NOM, 
               :CLIENT-PRENOM,
               :CLIENT-TELEPHONE)
           END-EXEC.
      *on vérifie si les données ont été insérées dans la table
           IF SQLCODE = 0
               DISPLAY "Insertion réussie."
           ELSE
               DISPLAY "Erreur d'insertion SQLCODE: " SQLCODE
           END-IF.
               
           EXEC SQL COMMIT END-EXEC.
       END-ECRIT-INDIVIDU.
