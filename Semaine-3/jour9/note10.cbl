       IDENTIFICATION DIVISION.
       PROGRAM-ID. note10.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *on définit un tableau qui contiendra 10 notes
       01 WS-TABLEAU-NOTE.
           05 WS-NOTE PIC 9(2) OCCURS 10 TIMES.
      
      *cette variable correspond a la commande voulue par l'utilisateur
       01 WS-COMMANDE PIC 9.

      *l'index qui nous permettra de parcourir le tableau
       01 WS-INDEX PIC 9(2).
      *variable qui enregistrera la valeur maximale du tableau
       01 WS-MAX PIC 9(2).

       PROCEDURE DIVISION.

      *on commence par afficher un menu
      *l'utilisateur peux soit entrer 10 notes à la suite
      *soit demander la note maximale
      *soit demander la note minimale
      *soit demander la moyenne
      *soit quitter le programme

           PERFORM UNTIL EXIT

           DISPLAY "Que voulez-vous faire?"
           DISPLAY "entrer 1 pour changer les 10 notes"
           DISPLAY "entrer 2 pour afficher la note maximum"
           DISPLAY "entrer 3 pour afficher la note minimum"
           DISPLAY "entrer 4 pour afficher la moyenne des notes"
           DISPLAY "entrer n'importe quoi d'autre pour arrêter"
      *maintenant que le menu est afficher, récupèrons le choix de l'utilisateur

           DISPLAY "Que voulez-vous faire?"
           ACCEPT WS-COMMANDE

      *on vient de récupérer la commande de l'utilisateur, traitons son choix
           EVALUATE WS-COMMANDE
      *l'utilisateur veut remplacer les anciennes valeur par de nouvelle valeur
           WHEN EQUAL 1
           DISPLAY "Vous voulez mettre 10 notes"
           PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX EQUAL 11
           DISPlAY "entrer une note"
           ACCEPT WS-NOTE(WS-INDEX) 
           END-PERFORM

      *l'utilisateur veut la note maximale 
           WHEN EQUAL 2
           DISPLAY "Vous voulez la note maximum"
      *on récupère la première valeur du tableau
           MOVE WS-NOTE(1) TO WS-MAX
           PERFORM VARYING WS-INDEX FROM 2 BY 1 UNTIL WS-INDEX EQUAL 10
      *on compare notre maximum actuelle avec la valeur suivante
           WS-MAX = FUNCTION MAX(WS-MAX, WS-NOTE(WS-INDEX))
           END-PERFORM
      
      *l'utilisateur veut la note minimale
           WHEN EQUAL 3 
           DISPLAY "Vous voulez la note minimum"

      *l'utilisateur veut la moyenne
           WHEN EQUAL 4 
           DISPLAY "Vous voulez la moyenne"

      *l'utilisateur veut arrêter le programme
           WHEN OTHER 
           DISPLAY "Vous voulez arrêtez le programme"
           STOP RUN

           END-EVALUATE


           END-PERFORM.           

           STOP RUN.
