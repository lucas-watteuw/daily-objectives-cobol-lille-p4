       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *Un nom initialisé
       01 WS-NOM    PIC X(20).
      *le résultat de l'appel de greet 
       01 WS-RESULT PIC X(30).

      *la taille du nom sans les espaces à la fin
       01 WS-TAILLE PIC 9(02).
       
       PROCEDURE DIVISION.

      *on demande à l'utilisateur quelle est son nom
           DISPLAY "quelle est votre nom?"
           ACCEPT WS-NOM.


      *on appelle greet avec les 2 paramètres PIC X de la working storage section
           CALL "greet" using WS-NOM WS-RESULT.
      *on affiche ce que greet a mis dans WS-RESULT
           DISPLAY WS-RESULT.

      *on appelle le sous-programme qui compte le nombre de caractère du nom
           CALL "count" using WS-NOM WS-TAILLE.
           DISPLAY "la taille du nom est " WS-TAILLE.

           STOP RUN.
