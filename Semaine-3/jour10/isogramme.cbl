       IDENTIFICATION DIVISION.
       PROGRAM-ID. isogramme.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *mot entrer par l'utilisateur
       01 WS-MOTS.
           05 WS-LETTRE PIC X OCCURS 10 TIMES.
      *index pour parcourir tableau
       01 WS-INDEX  PIC 9(2).
       01 WS-INDEX2 PIC 9(2).
      *la lettre dont on cherche à vérifier multiple présence ou non dans le mots
       01 WS-LETTRE-ETUDIER PIC X.
      *le nombre de fois qu'une lettre fut recherchée dans le mot
       01 WS-NOMBRE-BOUCLE PIC 9(2) VALUE 1.
      *la taille du mot entrée par l'utilisateur
       01 WS-TAILLE-MOT PIC 9(2).
       01 WS-TAILLE-MOT2 PIC 9(2).

       PROCEDURE DIVISION.

      *l'utilisateur entre son mot
           DISPLAY "entrer un mot".
           ACCEPT WS-MOTS.

      * on enregistre la taille du mot
           COMPUTE WS-TAILLE-MOT = FUNCTION LENGTH(
            FUNCTION TRIM(WS-MOTS)).
           ADD WS-TAILLE-MOT 1 TO WS-TAILLE-MOT2.

           PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX 
           EQUAL WS-TAILLE-MOT
      *on ajoute 1 au nombre de boucle afin d'éviter que la lettre à une position soit comparée à elle-même
               ADD 1 TO WS-NOMBRE-BOUCLE
      *on enregistre la première lettre du mot
               MOVE WS-LETTRE(WS-INDEX) TO WS-LETTRE-ETUDIER
      *on cherche à partir de la position juste après la lettre si elle aparait plusieurs fois dans le mots
               PERFORM VARYING WS-INDEX2 FROM WS-NOMBRE-BOUCLE BY 1 
               UNTIL WS-INDEX2 EQUAL WS-TAILLE-MOT2
      *si on trouve un isogramme, on affiche que le mot n'est pas un isogramme et on arrête le programme
                   IF WS-LETTRE-ETUDIER EQUAL WS-LETTRE(WS-INDEX2)
                       DISPLAY "ce n'est pas un isogramme"
                       STOP RUN 
                   END-IF
               END-PERFORM
           END-PERFORM.

           DISPLAY "c'est un isogramme".
           STOP RUN.
