       IDENTIFICATION DIVISION.
       PROGRAM-ID. validate.
       AUTHOR. lucas.

       DATA DIVISION.
       LINKAGE SECTION.

      *l'email dont on doit véfier s'il est correct ou non
       01 LK-EMAIL       PIC X(50).
      *0 si tous est bon et 1 si erreur
       01 LK-RETURN-CODE PIC 9 VALUE 0.

       PROCEDURE DIVISION USING LK-EMAIL LK-RETURN-CODE.

      *on doit réinitialiser la valeur de LK-RETURN-CODE car si un
      *mail est incorrect, le suivant sera considéré incorrect s'il est correct
           MOVE 0 TO LK-RETURN-CODE.

           INSPECT LK-EMAIL TALLYING LK-RETURN-CODE FOR ALL "@".

      *     DISPLAY "le code est " LK-RETURN-CODE.

      *il est supposé que dans un addresse mail, il n'y a qu'un seul "@"
           IF LK-RETURN-CODE EQUAL 1
      *si l'adresse mail est correct, on renvoie un 0 
              MOVE ZERO TO LK-RETURN-CODE
      *sinon l'adresse mail est incorrect, on renvoie un 1
           ELSE
              MOVE 1 TO LK-RETURN-CODE
           END-IF. 

           END PROGRAM "validate".
