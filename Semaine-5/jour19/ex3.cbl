       IDENTIFICATION DIVISION.
       PROGRAM-ID. ex3.
       AUTHOR. lucas.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       	SELECT CLASSES ASSIGN TO "classes-tri.txt"
       		ORGANIZATION IS LINE SEQUENTIAL.


       DATA DIVISION.

       FILE SECTION.
       FD CLASSES.
      *l'organisation des informations du fichier classes-tri.txt
       01 LIGNE.
           05 LIGNE-CLASSE PIC X(5).
      *     05 FILLER PIC X(2) VALUE SPACES.
           05 LIGNE-NOM PIC X(16).
      *     05 FILLER PIC X VALUE SPACES.
           05 LIGNE-PRENOM PIC X(15).
      
       WORKING-STORAGE SECTION. 

      *le tableau de 2 classes qui contiennent au maximum 3 éléves
       01 WS-TAB-ELEVES.
       05 WS-CLASSE OCCURS 2 TIMES.       *> 1 = CM1, 2 = CM2
          10 WS-ELEVE OCCURS 3 TIMES.
             15 WS-NOM-ELEVE     PIC X(15).
             15 WS-PRENOM-ELEVE  PIC X(15).

      *les 2 index pour parcourir le tableau à 2 dimension
       01 WS-INDEX-COLONNE PIC 9.
       01 WS-INDEX-LIGNE PIC 9.

      ****************************************************************
       
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

      

      *on tri le tableau
           SORT WS-ELEVE(1) ON ASCENDING KEY WS-NOM-ELEVE, 
           ASCENDING WS-PRENOM-ELEVE.
           SORT WS-ELEVE(2) ON ASCENDING KEY WS-NOM-ELEVE, 
           ASCENDING WS-PRENOM-ELEVE.

      *on affiche les élément du tableau triée

      *on affiche les éléves de cm1
           DISPLAY "les éléves de cm1".
           PERFORM VARYING WS-INDEX-LIGNE FROM 1 BY 1 
              UNTIL WS-INDEX-LIGNE EQUAL 4
                 DISPLAY WS-ELEVE(1, WS-INDEX-LIGNE)
           END-PERFORM.

      *on affiche les éléves de cm2
           DISPLAY "les éléves de cm2".

           PERFORM VARYING WS-INDEX-LIGNE FROM 1 BY 1 
              UNTIL WS-INDEX-LIGNE EQUAL 4
                 DISPLAY WS-ELEVE(2, WS-INDEX-LIGNE)
           END-PERFORM.

      *on ouvre le fichier de sortie
           OPEN OUTPUT CLASSES.
      *on écrit les éléments du tableau dans le fichier de sortie

      *on commence par les éléves de cm1
           PERFORM VARYING WS-INDEX-LIGNE FROM 1 BY 1 
              UNTIL WS-INDEX-LIGNE EQUAL 4
      *on initialise les valeurs à écrire
              MOVE "CM1" TO LIGNE-CLASSE
              MOVE WS-NOM-ELEVE(1,WS-INDEX-LIGNE) TO LIGNE-NOM
              MOVE WS-PRENOM-ELEVE(1,WS-INDEX-LIGNE) TO LIGNE-PRENOM
      *on écrit dans le fichier
              WRITE LIGNE
           END-PERFORM.

      *on commence par les éléves de cm2
           PERFORM VARYING WS-INDEX-LIGNE FROM 1 BY 1 
              UNTIL WS-INDEX-LIGNE EQUAL 4
      *on initialise les valeurs à écrire
              MOVE "CM2" TO LIGNE-CLASSE
              MOVE WS-NOM-ELEVE(2,WS-INDEX-LIGNE) TO LIGNE-NOM
              MOVE WS-PRENOM-ELEVE(2,WS-INDEX-LIGNE) TO LIGNE-PRENOM
      *on écrit dans le fichier
              WRITE LIGNE
           END-PERFORM.
           


      *on a fini d'écrire, on ferme le fichier 
           CLOSE CLASSES.

          

           STOP RUN.
