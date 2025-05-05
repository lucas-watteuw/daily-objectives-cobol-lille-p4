       IDENTIFICATION DIVISION.
       PROGRAM-ID. multi.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *on définit un tableau d'étudiant
      *un étudiant est définie par un nom et 4 notes
       01 WS-TAB-STUDENTS OCCURS 3 TIMES.
               05 WS-NAME PIC X(20).
               05 WS-NOTES PIC 9(2) OCCURS 4 TIMES.

      *2 index sont nécessaire pour parcourir un tableau à 2 dimension
       01 WS-INDEX1 PIC 9.
       01 WS-INDEX2 PIC 9.

       PROCEDURE DIVISION.
           
      *on doit entrer les nom et notes des différents étudiant
           DISPLAY "on commence par entrer les noms et notes".
           PERFORM VARYING WS-INDEX1 FROM 1 BY 1 UNTIL WS-INDEX1 GREATER 
           THAN 3
      *one commence par entrer les noms des étudiants
           DISPLAY "entrer un nom pour l'éléve"
           ACCEPT WS-NAME(WS-INDEX1)
      *on entre maintenant les notes de l'éléves
               PERFORM VARYING WS-INDEX2 FROM 1 BY 1 UNTIL WS-INDEX2
               GREATER THAN 4
               DISPLAY "entrer une note pour l'éléve"
               ACCEPT WS-NOTES(WS-INDEX1, WS-INDEX2)
               END-PERFORM
           END-PERFORM.

      *on procède désormais à l'affichage des nom et notes des étudiants
           DISPLAY "on affiche les noms et notes des éléves".
      *on affiche le nom de l'éléve
           PERFORM VARYING WS-INDEX1 FROM 1 BY 1 UNTIL WS-INDEX1 GREATER 
           THAN 3
           DISPLAY "on affiche le nom de l'éléve " WS-NAME(WS-INDEX1)
      *on affiche les notes de l'éléve
               PERFORM VARYING WS-INDEX2 FROM 1 BY 1 UNTIL WS-INDEX2
               GREATER THAN 4
               DISPLAY "une note de l'éléve est "
               WS-NOTES(WS-INDEX1, WS-INDEX2)
               END-PERFORM
               
           END-PERFORM.

           STOP RUN.
