       IDENTIFICATION DIVISION.
       PROGRAM-ID. roman.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *le nombre romain entrer par l'utilisateur
       01 WS-ROMANNUMBER PIC 9(4).
      *les restes par 1000, 100 et 10 du nombre entré par l'utilisateur
       01 WS-REMAINDERBY1000 PIC 9.
       01 WS-REMAINDERBY100 PIC 9.
       01 WS-REMAINDERBY10 PIC 9.

      *les différents nombre romains
       01 WS-NUM1 PIC X VALUE "I".
       01 WS-NUM2 PIC X(2) VALUE "II".
       01 WS-NUM3 PIC X(3) VALUE "III".
       01 WS-NUM4 PIC X(2) VALUE "IV".
       01 WS-NUM5 PIC X VALUE "V".
       01 WS-NUM6 PIC X(2) VALUE "VI".
       01 WS-NUM7 PIC X(3) VALUE "VII".
       01 WS-NUM8 PIC X(4) VALUE "VIII".
       01 WS-NUM9 PIC X(2) VALUE "IX".
           
    
       PROCEDURE DIVISION.
           
           DISPLAY "entrer un nombre plus grand que 0 et plus petit "
      -    "que 4000".
           ACCEPT WS-ROMANNUMBER.

      *on commence par vérifier que le nombre peut être convertit en nombre romain
           IF WS-ROMANNUMBER EQUAL ZERO 
           DISPLAY "vous avez entré 0, ce n'est pas un nombre romain"
           ELSE  
              IF WS-ROMANNUMBER GREATER THAN 3999
              DISPLAY "vous avez entré un nombre supérieur à 3999"
              END-IF 
           END-IF.

      *on sait maintenant que le nombre peut être convertit en romain
      *on commence par isoler les différents chiffres de notre nombre
           DIVIDE WS-ROMANNUMBER BY 1000 GIVING WS-REMAINDERBY1000 
           REMAINDER WS-ROMANNUMBER.

           DIVIDE WS-ROMANNUMBER BY 100 GIVING WS-REMAINDERBY100 
           REMAINDER WS-ROMANNUMBER.

           DIVIDE WS-ROMANNUMBER BY 10 GIVING WS-REMAINDERBY10
           REMAINDER WS-ROMANNUMBER.

      *on s'occupe des milliers
           IF WS-REMAINDERBY1000 EQUAL 1 
           DISPLAY "M"
           END-IF.

           IF WS-REMAINDERBY1000 EQUAL 2 
           DISPLAY "MM"
           END-IF.

           IF WS-REMAINDERBY1000 EQUAL 3 
           DISPLAY WS-NUM3 "MMM"
           END-IF.
      *on s'occupe des centaines
           IF WS-REMAINDERBY100 EQUAL 1 
           DISPLAY "C"
           END-IF.

           IF WS-REMAINDERBY100 EQUAL 2 
           DISPLAY "CC"
           END-IF.

           IF WS-REMAINDERBY100 EQUAL 3 
           DISPLAY "CCC"
           END-IF.

           IF WS-REMAINDERBY100 EQUAL 4 
           DISPLAY "CD"
           END-IF.

           IF WS-REMAINDERBY100 EQUAL 5 
           DISPLAY "D"
           END-IF.

           IF WS-REMAINDERBY100 EQUAL 6 
           DISPLAY "DC"
           END-IF.

           IF WS-REMAINDERBY100 EQUAL 7 
           DISPLAY "DCC"
           END-IF.

           IF WS-REMAINDERBY100 EQUAL 8 
           DISPLAY "DCCC"
           END-IF.

           IF WS-REMAINDERBY100 EQUAL 9 
           DISPLAY "CM"
           END-IF.
      *on s'occupe des dizaines
           IF WS-REMAINDERBY10 EQUAL 1 
           DISPLAY "X"
           END-IF.

           IF WS-REMAINDERBY10 EQUAL 2 
           DISPLAY "XX"
           END-IF.

           IF WS-REMAINDERBY10 EQUAL 3 
           DISPLAY "XXX"
           END-IF.

           IF WS-REMAINDERBY10 EQUAL 4 
           DISPLAY "XL"
           END-IF.

           IF WS-REMAINDERBY10 EQUAL 5 
           DISPLAY "L"
           END-IF.

           IF WS-REMAINDERBY10 EQUAL 6 
           DISPLAY "LX"
           END-IF.

           IF WS-REMAINDERBY10 EQUAL 7 
           DISPLAY "LXX"
           END-IF.

           IF WS-REMAINDERBY10 EQUAL 8 
           DISPLAY "LXXX"
           END-IF.

           IF WS-REMAINDERBY10 EQUAL 9 
           DISPLAY "XC"
           END-IF.

      *on s'occupe du nombre des unités
           IF WS-ROMANNUMBER EQUAL 1 
           DISPLAY WS-NUM1
           END-IF.

           IF WS-ROMANNUMBER EQUAL 2 
           DISPLAY WS-NUM2
           END-IF.

           IF WS-ROMANNUMBER EQUAL 3 
           DISPLAY WS-NUM3
           END-IF.

           IF WS-ROMANNUMBER EQUAL 4
           DISPLAY WS-NUM4
           END-IF.

           IF WS-ROMANNUMBER EQUAL 5 
           DISPLAY WS-NUM5
           END-IF.

           IF WS-ROMANNUMBER EQUAL 6 
           DISPLAY WS-NUM6
           END-IF.

           IF WS-ROMANNUMBER EQUAL 7 
           DISPLAY WS-NUM7
           END-IF.

           IF WS-ROMANNUMBER EQUAL 8 
           DISPLAY WS-NUM8
           END-IF.

           IF WS-ROMANNUMBER EQUAL 9 
           DISPLAY WS-NUM9
           END-IF.
           
           
           STOP RUN.
