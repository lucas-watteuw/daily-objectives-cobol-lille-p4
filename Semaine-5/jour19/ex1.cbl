       IDENTIFICATION DIVISION.
       PROGRAM-ID. ex1.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *le tableau de 2 classes qui contiennent 3 éléves chacune
       01 WS-TAB-ELEVES.
       05 WS-CLASSE OCCURS 2 TIMES.       *> 1 = CM1, 2 = CM2
          10 WS-ELEVE OCCURS 3 TIMES.
             15 WS-NOM-ELEVE     PIC X(15).
             15 WS-PRENOM-ELEVE  PIC X(15).

      *les 2 index pour parcourir le tableau à 2 dimension
       01 WS-INDEX-COLONNE PIC 9.
       01 WS-INDEX-LIGNE PIC 9.

      ****************************************************************** 

       PROCEDURE DIVISION.

      *on commence à remplir le tableau des 2 classes
           PERFORM VARYING WS-INDEX-COLONNE FROM 1 BY 1 UNTIL 
           WS-INDEX-COLONNE EQUAL 3
              PERFORM VARYING WS-INDEX-LIGNE FROM 1 BY 1 UNTIL  
              WS-INDEX-LIGNE EQUAL 4
                 DISPLAY "entrer le nom de l'éléve" 
                 ACCEPT WS-NOM-ELEVE(WS-INDEX-COLONNE, WS-INDEX-LIGNE)
                 DISPLAY "entrer le prenom de l'éléve"
                 ACCEPT WS-PRENOM-ELEVE(WS-INDEX-COLONNE, 
                 WS-INDEX-LIGNE)
              END-PERFORM 
           END-PERFORM.

      *on affiche les noms et prénoms des éléves de cm1
           DISPLAY "les éléves de cm1 sont:"

           PERFORM VARYING WS-INDEX-LIGNE FROM 1 BY 1 UNTIL  
           WS-INDEX-LIGNE EQUAL 4
              DISPLAY "NOM: " WS-NOM-ELEVE(1, WS-INDEX-LIGNE) "PRENOM: "
              WS-PRENOM-ELEVE(1, WS-INDEX-LIGNE)
           END-PERFORM.

      *on affiche les noms et prénoms des éléves de cm2
           DISPLAY "les éléves de cm2 sont:"

           PERFORM VARYING WS-INDEX-LIGNE FROM 1 BY 1 UNTIL  
           WS-INDEX-LIGNE EQUAL 4 
              DISPLAY "NOM: " WS-NOM-ELEVE(2, WS-INDEX-LIGNE) "PRENOM: "
              WS-PRENOM-ELEVE(2, WS-INDEX-LIGNE)
           END-PERFORM.


           STOP RUN.
