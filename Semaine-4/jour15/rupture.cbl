       IDENTIFICATION DIVISION.
       PROGRAM-ID. rupture.
       AUTHOR. lucas.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT INVENTAIRE ASSIGN TO "inventaire.txt"
              ORGANIZATION IS LINE SEQUENTIAL. 

           SELECT ARTICLEVIDE ASSIGN TO "rupture.txt"
              ORGANIZATION IS LINE SEQUENTIAL. 

       DATA DIVISION.
       FILE SECTION. 
       FD INVENTAIRE.
       01 LIGNE-INVENTAIRE.
           05 NOM-ARTICLE PIC X(10).
           05 RESTE-ARTICLE PIC 9(2).

       FD ARTICLEVIDE.
       01 LIGNE-ARTICLE.
           05 NOM-ARTICLE-VIDE PIC X(10).

       WORKING-STORAGE SECTION.

      *la condition pour arrêter de lire
       01 WS-CONDITION-LECTURE PIC X VALUE "C".

      *la tableau qui contiendra tous les noms des articles dont le stock est vide
       
       01 WS-TABLEAU-ARTICLE-VIDE OCCURS 15 TIMES.
           05 WS-NOM-ARTICLE-VIDE PIC X(10).

      *indice pour mettre les nom d'article dans le tableau, 
      *servira également pour connaitre le nombre d'article en rupture de stock
       01 WS-INDEX PIC 99 VALUE 1.

      *index pour écrire dans rupture.txt *
       01 WS-INDEX-ECRIT PIC 99.

       PROCEDURE DIVISION.

      *on ouvre le fichier inventaire.txt
           OPEN INPUT INVENTAIRE.

      *on lit le fichier en enregistrant tout les articles dont le stock est vide 
           PERFORM UNTIL WS-CONDITION-LECTURE EQUAL "F"
              READ INVENTAIRE 
              AT END
                 MOVE "F" TO WS-CONDITION-LECTURE
              NOT AT END 
                 IF FUNCTION NUMVAL(RESTE-ARTICLE) EQUAL 0
                    MOVE NOM-ARTICLE TO WS-NOM-ARTICLE-VIDE(WS-INDEX)
                    ADD 1 TO WS-INDEX
                  ELSE
                    DISPLAY NOM-ARTICLE " non vide"
                  END-IF
           END-PERFORM.

      *on ferme le fichier
           CLOSE INVENTAIRE.

      *on écrit maintenant les article en rupture de stocke dans rupture.txt 
           OPEN OUTPUT ARTICLEVIDE.

           PERFORM VARYING WS-INDEX-ECRIT FROM 1 BY 1 
           UNTIL WS-INDEX-ECRIT EQUAL WS-INDEX 
              MOVE WS-NOM-ARTICLE-VIDE(WS-INDEX-ECRIT) 
              TO NOM-ARTICLE-VIDE
              WRITE LIGNE-ARTICLE
           
           END-PERFORM.


           CLOSE ARTICLEVIDE. 

           STOP RUN.
