       IDENTIFICATION DIVISION.
       PROGRAM-ID. filler.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *tableau contenant les notes et date d'obtention des notes
       01 WS-TABLEAU OCCURS 100 TIMES.
           05 FILLER PIC 9(2) VALUE ZEROES.
           05 WS-NOTE  PIC 9(2).
           05 FILLER PIC 9(2) VALUE ZEROES.
           05 WS-JOUR  PIC 9(2).
           05 FILLER PIC 9(2) VALUE ZEROES.
           05 WS-MOIS  PIC 9(2).
           05 FILLER PIC 9(4) VALUE ZEROES.
           05 WS-ANNEE PIC 9(4).
      *index pour parcourir tableau
       01 WS-INDEX     PIC 9(3).

       PROCEDURE DIVISION.
           
      *on demande à l'utilisateur d'entrer les notes et dates d'obtention des notes
           PERFORM VARYING WS-INDEX FROM 1 BY 1 
           UNTIl WS-INDEX EQUAL 100 OR WS-NOTE(WS-INDEX - 1) EQUAL 99

           DISPLAY "Entrer une note"
           ACCEPT WS-NOTE(WS-INDEX)
           DISPLAY "entrer l'année d'obtention de la note puis le mois"
           ACCEPT WS-ANNEE(WS-INDEX)
           ACCEPT WS-MOIS(WS-INDEX)
           DISPLAY "entrer le jour de la note, un nombre est requis"
           ACCEPT WS-JOUR(WS-INDEX)

           END-PERFORM.
      *maintenant que toutes les notes et dates sont présentes dans le tableau
      *on va afficher le contenu

           PERFORM VARYING WS-INDEX FROM 1 BY 1 
           UNTIl WS-INDEX EQUAL 100 OR WS-NOTE(WS-INDEX - 1) EQUAL 99
           
           DISPLAY "NOTE : " WS-NOTE(WS-INDEX) " le "
      -    WS-JOUR(WS-INDEX) "/" WS-MOIS(WS-INDEX) "/" 
      -    WS-ANNEE(WS-INDEX)
           
           END-PERFORM.

           STOP RUN.
