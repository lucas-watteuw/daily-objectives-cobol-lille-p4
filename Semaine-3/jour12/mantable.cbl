       IDENTIFICATION DIVISION.
       PROGRAM-ID. mantable.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      * le tableau qui va contenir les noms des personnes
       01 WS-TABLEAU-NOM OCCURS 5 TIMES.
           05 WS-NOM PIC X(10).
      *un index pour parcourir le tableau
       01 WS-INDEX PIC 9.    

      *les numéros choisit par l'utilisateur
       01 wS-NUM1 PIC 9.
       01 wS-NUM2 PIC 9.
       01 wS-NUM3 PIC 9.

       PROCEDURE DIVISION.

      *on enregistre le nom de 5 personne dans le tableau
           PERFORM VARYING WS-INDEX FROM 1 BY 1 
           UNTIL WS-INDEX GREATER THAN 5
           DISPLAY "entrer le nom d'une personne"
           ACCEPT WS-NOM(WS-INDEX)
           END-PERFORM. 

      *on récupère 3 nombre de l'utilisateur
           DISPLAY "entrer le premier nombre".
           ACCEPT WS-NUM1.

           DISPLAY "entrer le second nombre".
           ACCEPT WS-NUM2.

           DISPLAY "entrer le dernier nombre".
           ACCEPT WS-NUM3.

      *on affiche les noms liée au nombre entré par l'utilisateur
           DISPLAY "le premier nom est " WS-NOM(WS-NUM1).
           DISPLAY "le second nom est " WS-NOM(WS-NUM2).
           DISPLAY "le dernier nom est " WS-NOM(WS-NUM3).           

           STOP RUN.
