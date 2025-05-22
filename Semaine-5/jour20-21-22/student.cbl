      ****************************************************************** 
      *    
      ****************************************************************** 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. student.
       AUTHOR. AlexEnCode & Lucas.

      ****************************************************************** 
      *    
      ****************************************************************** 
       ENVIRONMENT DIVISION.
      ****************************************************************** 
      *    
      ******************************************************************        
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

      ****************************************************************** 
      *    
      ****************************************************************** 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *le fichier à lire, il contient les informations sur les éléves
      *leur nom et notes dans chaque matière
           SELECT F-INPUT
               ASSIGN TO 'input.dat'
               ACCESS MODE IS SEQUENTIAL
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS F-INPUT-STATUS. 

      *le fichier de sortie
           SELECT F-OUTPUT
               ASSIGN TO 'output.dat'
               ACCESS MODE IS SEQUENTIAL
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS F-OUTPUT-STATUS.           

      ****************************************************************** 
      *    
      ****************************************************************** 
       DATA DIVISION.

      ****************************************************************** 
      *    
      ****************************************************************** 
       FILE SECTION.
      *les lignes du fichier d'entrer contiennent un nombre différent 
      *de caractères 
      *certaines ligne contiennent juste le nom de l'éléve et son âge
      *les autre ligne sont les matières avec leur nom, coefficient et
      * note
       FD  F-INPUT
           RECORD CONTAINS 2 TO 1000 CHARACTERS 
           RECORDING MODE IS V.
      *recording mode is v signifie juste que les lignes ne feront pas 
      *tous la même taille

      
       01  REC-F-INPUT-2       PIC 9(02).
       01  REC-F-INPUT-10      PIC X(10).
       01  REC-F-INPUT-100     PIC X(100).
       01  REC-F-INPUT-1000    PIC X(1000).

      *si la ligne concerne un étudiant
       01  REC-STUDENT.
      *son r-s-key devrait être 01
           03 R-S-KEY          PIC 9(02).       
           03 R-LASTNAME       PIC X(07).       
           03 R-FIRSTNAME      PIC X(06).       
           03 R-AGE            PIC 9(02).       

      *si la ligne concerne une matière
       01  REC-COURSE. 
      *son r-c-key devrait être 02
           03 R-C-KEY          PIC 9(02).       
           03 R-LABEL          PIC X(21).             
           03 R-COEF           PIC X(3).  
           03 R-GRADE          PIC X(5).       

      *la sortie ne contient qu'un PIC X de 250 caractères
       FD  F-OUTPUT
           RECORD CONTAINS 250 CHARACTERS
           RECORDING MODE IS F.

       01  REC-F-OUTPUT        PIC X(250).

      ****************************************************************** 
      *    
      *******-********************************************************** 
       WORKING-STORAGE SECTION.
      *condition pour lire le fichier 
       01  F-INPUT-STATUS      PIC X(02) VALUE SPACE.
           88 F-INPUT-STATUS-OK    VALUE '00'.        
           88 F-INPUT-STATUS-EOF   VALUE '10'.
      *condition pour écrire dans le fichier 
       01  F-OUTPUT-STATUS     PIC X(02) VALUE SPACE.
           88 F-OUTPUT-STATUS-OK    VALUE '00'.        
           88 F-OUTPUT-STATUS-EOF   VALUE '10'.

      *le tableau qui contient les informations sur les étudiants
       01  DATA-STUDENT.
           05 STUDENT-LGHT PIC 9(03) VALUE 0. *>le nombre d'étudiant
           05 STUDENT OCCURS 1 TO 999 TIMES DEPENDING ON STUDENT-LGHT.
               10 S-FIRSTNAME  PIC X(06).      
               10 S-LASTNAME   PIC X(07).
               10 S-AGE        PIC 9(02). 
               10 S-AVERAGE    PIC 999V99 VALUE 0. *>la moyenne de l'éléve        
      *le nombre de note de l'étudiant
               10 COURSE-LGHT  PIC 9(03) VALUE 0. 
      *on rajoute les notes de l'éléve, 999 TIMES car on ne peux pas 
      *faire de DEPENDING ON imbriqués 
               10 TAB-NOTE OCCURS 999 TIMES.
                    15 LIBELLE          PIC X(21).       
                    15 COEFFICIENT      PIC 9V9.       
                    15 GRADE-NOTE       PIC 99V99.  

      *index pour parcourir tableau
       01 WS-INDEX1 PIC 9(3).
       01 WS-INDEX2 PIC 9(3).

      *somme des coefficient pour calcul de moyenne
       01 WS-SUM-COEF PIC 99V99.

      *variable pour contenir la multiplication du coef et de la note
       01 WS-COEF-NOTE PIC 99V99.
      

      ****************************************************************** 
      *    
      ****************************************************************** 
       PROCEDURE DIVISION.

      *on ouvre le fichier d'entrée 
           OPEN INPUT F-INPUT.
      *on initialise la condition de lecture
           SET F-INPUT-STATUS-OK TO TRUE.
      *on lit le fichier
           PERFORM UNTIL F-INPUT-STATUS-EOF  
              READ F-INPUT 
      *si on a lu tous le fichier, on arrête de lire
              AT END 
                 SET F-INPUT-STATUS-EOF TO TRUE
              NOT AT END
      *so la ligne contient le nom d'un étudiant
                 IF REC-F-INPUT-2 EQUAL "01"
                    ADD 1 TO STUDENT-LGHT *>on incrémente le nombre d'étudiants
                    MOVE R-FIRSTNAME TO S-FIRSTNAME(STUDENT-LGHT)
                    MOVE R-LASTNAME TO S-LASTNAME(STUDENT-LGHT)
                    MOVE R-AGE TO S-AGE(STUDENT-LGHT)
      *si la ligne contient une matière
                 ELSE
      *on incrémente le nombre de matière
                    ADD 1 TO COURSE-LGHT(STUDENT-LGHT) 
                    MOVE R-LABEL TO LIBELLE(STUDENT-LGHT,
                    COURSE-LGHT(STUDENT-LGHT))
                    MOVE R-COEF TO COEFFICIENT(STUDENT-LGHT,
                    COURSE-LGHT(STUDENT-LGHT))
                    MOVE R-GRADE TO GRADE-NOTE(STUDENT-LGHT,
                    COURSE-LGHT(STUDENT-LGHT))
                 END-IF
           END-PERFORM.

      *on ferme le fichier d'entrée 
           CLOSE F-INPUT.


      *on calcule la moyenne de chaque éléve
           PERFORM VARYING WS-INDEX1 FROM 1 BY 1 
           UNTIL WS-INDEX1 GREATER THAN STUDENT-LGHT
      *on réinitialise la somme des coef
              MOVE 0 TO WS-SUM-COEF
      *on commence par additionner les notes en n'oubliant de les multiplier par leur coef
              PERFORM VARYING WS-INDEX2 FROM 1 BY 1 
              UNTIL WS-INDEX2 GREATER THAN COURSE-LGHT(WS-INDEX1)
      *on incrémente la somme des coefficient        
              ADD COEFFICIENT(WS-INDEX1, WS-INDEX2) TO WS-SUM-COEF
              MULTIPLY COEFFICIENT(WS-INDEX1, WS-INDEX2) BY 
              GRADE-NOTE(WS-INDEX1, WS-INDEX2) 
              GIVING WS-COEF-NOTE
              ADD WS-COEF-NOTE TO S-AVERAGE (WS-INDEX1)
              END-PERFORM    
              DIVIDE S-AVERAGE(WS-INDEX1) BY WS-SUM-COEF 
              GIVING S-AVERAGE(WS-INDEX1)
           END-PERFORM.

        
      *on tri les éléves par ordre alphabétique
           SORT STUDENT ON ASCENDING S-LASTNAME,
           ASCENDING S-FIRSTNAME.

      *on affiche les éléves 
           PERFORM VARYING WS-INDEX1 FROM 1 BY 1 
           UNTIL WS-INDEX1 GREATER THAN STUDENT-LGHT 
              DISPLAY S-LASTNAME(WS-INDEX1) " " S-FIRSTNAME(WS-INDEX1)    
              DISPLAY S-AGE(WS-INDEX1)  
           END-PERFORM.

      *on ouvre le fichier de sortie
           OPEN OUTPUT F-OUTPUT.
          
      *on écrit dans le tableau le nom, prénom et moyenne de l'éléve
           PERFORM VARYING WS-INDEX1 FROM 1 BY 1 
           UNTIL WS-INDEX1 GREATER THAN STUDENT-LGHT
      *on initialise la ligne à écrire comme une chaine ne contenant que des espaces
              MOVE SPACES TO REC-F-OUTPUT
      *on écrit le nom, prénom, age et moyenne
              STRING S-LASTNAME(WS-INDEX1) " " S-FIRSTNAME(WS-INDEX1) 
              " " S-AVERAGE(WS-INDEX1)(1:3) ","S-AVERAGE(WS-INDEX1)(4:2)
              SPACES 
              INTO REC-F-OUTPUT
              END-STRING
              WRITE REC-F-OUTPUT
           END-PERFORM.


      *on ferme le fichier de sortie
           CLOSE F-OUTPUT.

           STOP RUN.
