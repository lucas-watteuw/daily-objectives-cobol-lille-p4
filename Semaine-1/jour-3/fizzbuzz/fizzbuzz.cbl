       IDENTIFICATION DIVISION.
       PROGRAM-ID. fizzbuzz.
       AUTHOR. Lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-NOMBRE PIC 9(3).
       01 WS-QUOTIENT1 PIC 9(3). 
       01 WS-RESTE1 PIC 9(3). 
       01 WS-QUOTIENT2 PIC 9(3). 
       01 WS-RESTE2 PIC 9(3). 

       PROCEDURE DIVISION.

      *on récupère le nombre entrer par l'utilisateur   
           DISPLAY "entrez un nombre".  
           ACCEPT WS-NOMBRE.

      *il faut vérifier si ce nombre est divible par 3, par 5 ou par ces 2 nombres

      *on commence par diviser ce nombre par 3
           DIVIDE WS-NOMBRE BY 3 GIVING WS-QUOTIENT1 
           REMAINDER WS-RESTE1.

      *on divise ce nombre par 5 ensuite
           DIVIDE WS-NOMBRE BY 5 GIVING WS-QUOTIENT2 
           REMAINDER WS-RESTE2.

      *on commence par le cas ou le nombre est divisible par 3 et 5
           IF WS-RESTE1 EQUAL WS-RESTE2 and WS-RESTE1 EQUAL ZERO
           DISPLAY "fizz buzz"
           
      * on vérifie si le nombre est divisible par 3 mais par par 5
           ELSE
           IF WS-RESTE1 EQUAL ZERO 
           DISPLAY "fizz"
      *on vérifie si le nombre est divisible par 5 mais pas par 3
           ELSE 
           IF WS-RESTE2 EQUAL ZERO 
           DISPLAY "buzz"
      * cas ou le nombre n'est ni divisible par 5 ni par 3
           ELSE 
           DISPLAY WS-NOMBRE
           
           END-IF
           END-IF
           END-IF.

           STOP RUN.
