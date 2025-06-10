       IDENTIFICATION DIVISION.
       PROGRAM-ID. count.
       AUTHOR. lucas.

       DATA DIVISION.
       LINKAGE SECTION.
      *un nom qui peut contenir beaucoup d'espaces à la fin 
       01 LK-NOM    PIC X(20).
      *la taille du nom de la personne sans les espaces à la fin
       01 LK-TAILLE PIC 9(02).


       PROCEDURE DIVISION using LK-NOM LK-TAILLE.

           COMPUTE LK-TAILLE = FUNCTION LENGTH(FUNCTION TRIM(LK-NOM)).

           END PROGRAM "count".
