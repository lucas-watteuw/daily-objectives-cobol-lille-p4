       IDENTIFICATION DIVISION.
       PROGRAM-ID. vente.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *un créer un tableau de produit
      *un produit est défini par un nom, un prix, le nombre vendu cette semaine
      *ainsi que le stock restant
       01 WS-TAB-PRODUITS OCCURS 4 TIMES.
               05 WS-NOM PIC X(20).
               05 WS-PRIX PIC 9(4).
               05 WS-VENTE-HEBDO PIC 9(4).
               05 WS-STOCK PIC 9(4).
      *l'index qui nous sera utile pour parcourir le tableau
       01 WS-INDEX PIC 9.

       PROCEDURE DIVISION.
       
      *on commence par définir nos produits
           DISPLAY "entrer les noms, prix et ventes hebdomadaires des "
           "produits, ainsi que leur stocks".

           PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX GREATER 
           THAN 4
           DISPLAY "quelle est le nom du produit?"
           ACCEPT WS-NOM(WS-INDEX)
           DISPLAY "quelle est le prix du produit?"
           ACCEPT WS-PRIX(WS-INDEX)
           DISPLAY "combien de fois ce produit fut vendu cette semaine?"
           ACCEPT WS-VENTE-HEBDO(WS-INDEX)
           DISPLAY "quelle quantité il reste de ce produit?"
           ACCEPT WS-STOCK(WS-INDEX)
           END-PERFORM.

           DISPLAY "il est temps d'afficher les produits du magasin".
           DISPLAY " ".
      *on affiche désormais les caractéristiques des produits du magasin
           PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX GREATER 
           THAN 4
           DISPLAY "le nom du produit est " WS-NOM(WS-INDEX)
           DISPLAY "le prix du produit est " WS-PRIX(WS-INDEX)
           DISPLAY "ce produit fut vendu cette semaine "
           WS-VENTE-HEBDO(WS-INDEX) "fois"
           DISPLAY "il en reste " WS-STOCK(WS-INDEX) " à vendre."
           DISPLAY " "
           END-PERFORM.

           STOP RUN.
           