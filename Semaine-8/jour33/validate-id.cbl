       IDENTIFICATION DIVISION.
       PROGRAM-ID. validate-id.
       AUTHOR. lucas.
       
       DATA DIVISION.
       LINKAGE SECTION.

      *l'id du client
       01 LK-ID-CLIENT PIC X(10).

      *le code de retour du programme
       01 LK-RETURN-CODE PIC 9.

       PROCEDURE DIVISION USING LK-ID-CLIENT LK-RETURN-CODE.

      *on met le code de retour à 0
           MOVE 0 TO LK-RETURN-CODE.
      *on vérifie que l'id du client ne contient que des chiffres
           IF LK-ID-CLIENT IS NOT NUMERIC 
              MOVE 1 TO LK-RETURN-CODE
           END-IF.


           END PROGRAM "validate-id".
