       IDENTIFICATION DIVISION.
       PROGRAM-ID. bissextile.
       AUTHOR. lucas & william.


       DATA DIVISION. 
       working-storage section.
      *variable contenant l'année
       01  ws-annee  pic 9(4). 
       
      *variables contenant les restes des divisions.
       01  ws-reste-par-4    pic 9(4). 
       01  ws-reste-par-100  pic 9(4).
       01  ws-reste-par-400  pic 9(4).

      *variable poubelle
       01  ws-quotient       pic 9(4).
       
       
       
       procedure division.
       
       display "quelle est l'année ?".
       accept ws-annee.
       

           DIVIDE ws-annee BY 4 GIVING ws-quotient 
           REMAINDER ws-reste-par-4.

           DIVIDE ws-annee BY 100 GIVING ws-quotient 
           REMAINDER ws-reste-par-100.

           DIVIDE ws-annee BY 400 GIVING ws-quotient 
           REMAINDER ws-reste-par-400.

           IF ws-reste-par-4 EQUAL 0 
           AND ws-reste-par-100 NOT EQUAL 0
           OR ws-reste-par-400 EQUAL 0
               DISPLAY ws-annee "est une année bissextile"
               
           ELSE
           DISPLAY ws-annee " n'est pas une année bissextile"
           END-IF. 


       stop run.
