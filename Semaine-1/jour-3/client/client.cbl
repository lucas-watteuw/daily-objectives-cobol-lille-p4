       IDENTIFICATION DIVISION.
       PROGRAM-ID. client.
       AUTHOR. lucas.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-CLIENTTYPE PIC X(8).
       01 WS-SOLDE PIC 9(12).

       PROCEDURE DIVISION.
           
      *on récupère le type de client qu'est l'utilisateur    
           DISPLAY "Quelle type de client êtes-vous?".
           ACCEPT WS-CLIENTTYPE.

      *on demande à l'utilisateur son solde
           DISPLAY "De combien est votre solde?".
           ACCEPT WS-SOLDE.

      *on commence par un IF,le EVALUATE vient après
      
      *on vérifie si le client est VIP 
           IF WS-CLIENTTYPE EQUAL "VIP"
      * on vérifie le solde de notre client VIP
           IF WS-SOLDE GREATER THAN 10000
           DISPLAY "premium"
           ELSE 
           DISPLAY "privilégié"
           END-IF
           END-IF.

      *on vérifie si le client est Standard
           IF WS-CLIENTTYPE EQUAL "Standard"
      * on vérifie le solde de notre client Standard
           IF WS-SOLDE GREATER THAN 5000
           DISPLAY "fidèle"
           ELSE 
           DISPLAY "standard"
           END-IF
           END-IF. 

      *même chose avec EVALUATE

           EVALUATE WS-CLIENTTYPE
      * si l'utilisateur est VIP     
           WHEN EQUAL "VIP" or EQUAL "Vip" or EQUAL "vip"
           IF WS-SOLDE GREATER THAN 10000
           DISPLAY "premium"
           ELSE
           DISPLAY "privilégié"
           END-IF

      * si l'utilisateur est Standard
           WHEN EQUAL "Standard" OR EQUAL "standard" or EQUAL "STANDARD"
           IF WS-SOLDE GREATER THAN 5000
           DISPLAY "fidèle"
           ELSE 
           DISPLAY "standard"
           END-IF
      * si l'utilisateur à mal entrer son status
           
           WHEN OTHER  
           DISPLAY "vous avez mal entré Standard ou VIP"

           END-EVALUATE.

           STOP RUN.
