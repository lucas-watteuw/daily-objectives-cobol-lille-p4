       IDENTIFICATION DIVISION.
       PROGRAM-ID. queen.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *position reine blanche
       01 WS-COLUMN-BLANKQUEEN-NUMBER PIC 9.
       01 WS-COLUMN-BLANKQUEEN PIC X.
       01 WS-LINE-BLANKQUEEN PIC 9.
      *position reine noir
       01 WS-COLUMN-BLACKQUEEN-NUMBER PIC 9.
       01 WS-COLUMN-BLACKQUEEN PIC X.
       01 WS-LINE-BLACKQUEEN PIC 9.

       PROCEDURE DIVISION.
      *on commence par récupèrer les informatios à propos des position des 2 reines

           DISPLAY "Sur quelle ligne est la reine blanche?".
           ACCEPT WS-LINE-BLANKQUEEN.

           DISPLAY "Sur quelle colonne est la reine blanche?".
           ACCEPT WS-COLUMN-BLANKQUEEN.

           DISPLAY "Sur quelle ligne est la reine noire?".
           ACCEPT WS-LINE-BLACKQUEEN.

           DISPLAY "Sur quelle colonne est la reine noire?".
           ACCEPT WS-COLUMN-BLACKQUEEN.
      
      *on vérifie si les reines sont sur la même ligne ou colonne

           IF WS-COLUMN-BLACKQUEEN EQUAL WS-COLUMN-BLANKQUEEN 
           OR WS-LINE-BLACKQUEEN EQUAL WS-LINE-BLANKQUEEN
              DISPLAY "les reines peuvent se toucher."
           END-IF.

      *vérifions maintenant les diagonales

      *la fonction ord convertit une lettre en nombre
           COMPUTE WS-COLUMN-BLACKQUEEN-NUMBER = 
           FUNCTION ORD(WS-COLUMN-BLACKQUEEN).

           COMPUTE WS-COLUMN-BLANKQUEEN-NUMBER = 
           FUNCTION ORD(WS-COLUMN-BLANKQUEEN).

      *on fait un perform 8 times car il y a 8 cases sur un échiquier(normalement)
           PERFORM 8 TIMES 
      *on commence par incrémenter les nombres les plus faibles en priorité
              IF WS-COLUMN-BLACKQUEEN-NUMBER 
              GREATER THAN WS-COLUMN-BLANKQUEEN-NUMBER
                 ADD 1 TO WS-COLUMN-BLACKQUEEN-NUMBER 
                 ADD 1 TO WS-LINE-BLACKQUEEN
              ELSE
                 ADD 1 TO WS-COLUMN-BLANKQUEEN-NUMBER 
                 ADD 1 TO WS-LINE-BLANKQUEEN
              END-IF
      *on compare maintenant les position si les dames peuvent se toucher
              IF WS-COLUMN-BLACKQUEEN-NUMBER EQUAL 
              WS-COLUMN-BLANKQUEEN-NUMBER AND 
              WS-LINE-BLACKQUEEN EQUAL WS-LINE-BLANKQUEEN 
              DISPLAY "les reines peuvent se toucher"
              STOP RUN 
              END-IF
           END-PERFORM.

           DISPLAY "les reines ne peuvent pas se toucher".

           STOP RUN.
