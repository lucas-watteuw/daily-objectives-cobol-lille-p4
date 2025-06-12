       IDENTIFICATION DIVISION.
       PROGRAM-ID. main_sql.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
      *pour se connecter à la database
      
      * le nom de l'utilisateur pour postgres
       01  USERNAME       PIC X(30) VALUE "postgres".
      * le mot de passe de l'utilisateur 
       01  PASSWD         PIC X(30) VALUE "mdp". 
      * le nom de la base de donnée
       01  DBNAME         PIC X(10) VALUE "exobibli". 
       
       EXEC SQL END DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE SQLCA END-EXEC.

       PROCEDURE DIVISION.

      *on se connecte à la base de donnée
           DISPLAY "Connexion à la base de données...".
           
           EXEC SQL
                CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME
           END-EXEC.
           
      *si on n'arrive pas à se connecter
           IF SQLCODE NOT = 0
               DISPLAY "on n'arrive pas à se connecter à la database"
               DISPLAY "Erreur de connexion SQLCODE: " SQLCODE
               STOP RUN
           END-IF.

      *on est connecté à la base de donnée, appelons le sous-programme
      *pour ajouter des utilisateurs

           CALL "insert".

           STOP RUN.
