       IDENTIFICATION DIVISION.
       PROGRAM-ID. assurance.
       AUTHOR. lucas & yassine.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *on associe au fichier assurance.csv le FD ASSURANCE 
           SELECT ASSURANCE ASSIGN TO "assurance.csv"
              ORGANIZATION IS LINE SEQUENTIAL.

           SELECT ASSURANCE-SORTIE ASSIGN TO "rapport-assurance.dat"
              ORGANIZATION IS LINE SEQUENTIAL.


       DATA DIVISION.
       FILE SECTION.
      *chaque ligne du fichire contient 9 colonnes différentes avec des 
      *séparateurs entre chaque colonne
       FD ASSURANCE.
       01 LIGNE-ASSURANCE.
           05 CODE-CONTRAT PIC 9(8).
           05 FILLER       PIC X.
           05 NOM-CONTRAT  PIC X(13).
           05 FILLER       PIC X(2).
           05 NOM-PRODUIT  PIC X(14).
           05 FILLER       PIC X.
           05 NOM-CLIENT   PIC X(41).
           05 FILLER       PIC X.
           05 STATUT       PIC X(8). 
           05 FILLER       PIC X.
           05 DATE-DEBUT   PIC X(8).
           05 FILLER       PIC X.
           05 DATE-FIN     PIC X(8).
           05 FILLER       PIC X(2).
           05 MONTANT      PIC X(8).
           05 FILLER       PIC X.
           05 DEVISE       PIC X.

       FD ASSURANCE-SORTIE.
       01 LIGNE-ASSURANCE-SORTIE.
           05 CODE-CONTRAT-SORTIE PIC 9(8).
           05 NOM-CONTRAT-SORTIE  PIC X(13).
           05 NOM-PRODUIT-SORTIE  PIC X(14).
           05 NOM-CLIENT-SORTIE   PIC X(41).
           05 STATUT-SORTIE       PIC X(8). 
           05 DATE-DEBUT-SORTIE   PIC X(10).
           05 DATE-FIN-SORTIE     PIC X(10).
           05 MONTANT-SORTIE      PIC X(8).
           05 DEVISE-SORTIE       PIC X.
       

       WORKING-STORAGE SECTION.

      *le tableau qui contient toutes les informations que contenait le fichier assurance.csv 
       01 WS-TABLEAU.
      *OCCURS 36 TIMES car il y a 36 lignes dans le fichier assurance.csv
           05 WS-ASSURANCE-LIGNE OCCURS 36 TIMES.
              10 WS-CODE-CONTRAT PIC 9(8).
              10 WS-NOM-CONTRAT  PIC X(13).
              10 WS-NOM-PRODUIT  PIC X(14).
              10 WS-NOM-CLIENT   PIC X(42).
              10 WS-STATUT       PIC X(8). 
              10 WS-DATE-DEBUT   PIC X(8).
              10 WS-DATE-FIN     PIC X(8).
              10 WS-MONTANT      PIC X(8).
              10 WS-DEVISE       PIC X.
              
      *index pour parcourir le tableau
       01 WS-INDEX-TABLEAU       PIC 9(2) VALUE 1.

      *condition pour arrêter de lire le fichier 
       01 WS-CONDITION           PIC X VALUE "C".

       PROCEDURE DIVISION.

      *on ouvre le fichier en mode input 
           OPEN INPUT ASSURANCE.

      *on enregistre le contenu du fichier dans le tableau
           PERFORM UNTIL WS-CONDITION EQUAL "F" 
              READ ASSURANCE
      *on a lu tout le fichier, on arrête donc de lire
                 AT END 
                    MOVE "F" TO WS-CONDITION
                 NOT AT END 
                    MOVE CODE-CONTRAT TO 
                       WS-CODE-CONTRAT(WS-INDEX-TABLEAU)
                     MOVE NOM-CONTRAT TO 
                       WS-NOM-CONTRAT(WS-INDEX-TABLEAU)
                     MOVE NOM-PRODUIT TO 
                       WS-NOM-PRODUIT(WS-INDEX-TABLEAU)
                     MOVE NOM-CLIENT TO 
                       WS-NOM-CLIENT(WS-INDEX-TABLEAU)
                     MOVE STATUT TO 
                       WS-STATUT(WS-INDEX-TABLEAU)
                     MOVE DATE-DEBUT TO 
                       WS-DATE-DEBUT(WS-INDEX-TABLEAU)
                     MOVE DATE-FIN TO 
                       WS-DATE-FIN(WS-INDEX-TABLEAU)
                     MOVE MONTANT TO 
                       WS-MONTANT(WS-INDEX-TABLEAU)
                     MOVE DEVISE TO 
                       WS-DEVISE(WS-INDEX-TABLEAU)
                    ADD 1 To WS-INDEX-TABLEAU
           END-PERFORM.

      *on ferme le fichier 
           CLOSE ASSURANCE.


      
    

      *partie2
      *on vérifie s'il y a au moins 7 lignes dans le tableau
      *si au moins 7, on affiche uniquement la ligne 3 et 7 du tableau
      *sinon on affiche rien
           IF WS-INDEX-TABLEAU GREATER THAN 6 
           DISPLAY "on affiche les infos de la ligne 3 et 7"
              DISPLAY WS-CODE-CONTRAT(3) " "
      -          WS-NOM-CONTRAT(3) " "
      -          WS-NOM-PRODUIT(3) " "
      -          WS-NOM-CLIENT(3) " "
      -          WS-STATUT(3) " "
      -          WS-DATE-DEBUT(3) " "
      -          WS-DATE-FIN(3) " "
      -          WS-MONTANT(3) " "
      -          WS-DEVISE(3) " "

           DISPLAY WS-CODE-CONTRAT(7) " "
      -          WS-NOM-CONTRAT(7) " "
      -          WS-NOM-PRODUIT(7) " "
      -          WS-NOM-CLIENT(7) " "
      -          WS-STATUT(7) " "
      -          WS-DATE-DEBUT(7) " "
      -          WS-DATE-FIN(7) " "
      -          WS-MONTANT(7) " "
      -          WS-DEVISE(7) " "

           END-IF.

      *partie3

      *on ouvre le fichier en mode output 
           OPEN OUTPUT ASSURANCE-SORTIE.


      *on créer une en-tête pour le ficher de sortie
           
           MOVE "CODE    " TO CODE-CONTRAT-SORTIE.
           MOVE "NOM    " TO NOM-CONTRAT-SORTIE.
           MOVE "STATUT  " TO STATUT-SORTIE.   
           MOVE "DEBUT  " TO DATE-DEBUT-SORTIE.
           MOVE "FIN  " TO DATE-FIN-SORTIE.       
           MOVE "MONTANT  " TO MONTANT-SORTIE.
           MOVE  "%" TO DEVISE-SORTIE. 
           WRITE LIGNE-ASSURANCE-SORTIE.

      *on écrit dans le fichier la sections 3 
       
           MOVE WS-CODE-CONTRAT(3) TO CODE-CONTRAT-SORTIE. 
           MOVE WS-NOM-CONTRAT(3) TO NOM-CONTRAT-SORTIE.
           MOVE WS-NOM-PRODUIT(3) TO NOM-PRODUIT-SORTIE.
           MOVE WS-NOM-CLIENT(3) TO NOM-CLIENT-SORTIE.
           MOVE WS-STATUT(3) TO STATUT-SORTIE.
           MOVE WS-DATE-DEBUT(3) TO DATE-DEBUT-SORTIE. 
           MOVE WS-DATE-FIN(3) TO DATE-FIN-SORTIE.
           MOVE WS-MONTANT(3) TO MONTANT-SORTIE.
           MOVE WS-DEVISE(3) TO DEVISE-SORTIE.
           WRITE LIGNE-ASSURANCE-SORTIE.

      *on écrit dans le fichier la sections 7
           MOVE WS-CODE-CONTRAT(7) TO CODE-CONTRAT-SORTIE. 
           MOVE WS-NOM-CONTRAT(7) TO NOM-CONTRAT-SORTIE.
           MOVE WS-NOM-PRODUIT(7) TO NOM-PRODUIT-SORTIE.
           MOVE WS-NOM-CLIENT(7) TO NOM-CLIENT-SORTIE.
           MOVE WS-STATUT(7) TO STATUT-SORTIE.
           MOVE WS-DATE-DEBUT(7) TO DATE-DEBUT-SORTIE. 
           MOVE WS-DATE-FIN(7) TO DATE-FIN-SORTIE.
           MOVE WS-MONTANT(7) TO MONTANT-SORTIE.
           MOVE WS-DEVISE(7) TO DEVISE-SORTIE.
           WRITE LIGNE-ASSURANCE-SORTIE.

      *on ferme le fichier
           CLOSE ASSURANCE-SORTIE.

           DISPLAY "Fin du traitement – 2 enregistrements exportés"

           STOP RUN.
