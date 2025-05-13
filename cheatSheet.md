#COBOL niveau hiérarchique

01-49: variable de type groupe
66: zone référencée par plusieurs mémoire(RENAME)
77: variable autonome
88: valeurs conditionelle(flag)

#COBOL arithmétique

-addition

ADD variable TO variable2  ajoute la variable à variable2 et enregistre le résultat dans variable2

ADD var1 var2 var3 TO var4 additionne var1 var2 et var3 et enregistre le résultat dans var4 
ATTENTION, cela n'est vrai que si var4= 0 car si var4 = 7, var4 = var1 + var2 + var3 + 7

-soustraction 

SUBTRACT var1 FROM var2   enlève var1 de var2 et enregistre le résultat dans var2
SUBTRACT var1 FROM var2 GIVING var3  enlève var1 de var2 et enregistre le résultat dans var3

-multiplication

MULTIPLY var1 BY var2 GIVING var3   multiplie var1 par var2 et enregistre le résultat dans var3

-division

DIVIDE A BY B GIVING C REMAINDER D    divise A par B, enregistre le quotient dans C et le reste dans D

-numérique signé entier ou flottant

PIC S9(5)   entier signé de 5 caractère
PIC 9(5)v99  nombre flottant
PIC S9(5)v99  nombre flottant signé


#COBOL CONDITIONS

-Faire un IF

IF condition
instruction(s)
ELSE
instruction(s)
END-IF.

Il est à noter qu'il n'y a qu'un "." après le END-IF et non après chaque instruction

-Faire des IF imbriqués
IF condition
IF condition2
instruction(s)
ELSE
END-IF
END-IF.

Il est à noter qu'il n'y a qu'un "." après le dernier END-IF et qu'il faut un END-IF par IF

-Faire un EVALUATE

EVALUATE var

WHEN EQUAL quelquechose
instruction
WHEN LESS THAN
instruction
WHEN GREATER THAN
instruction
WHEN OTHER
instruction
END-EVALUATE.

Il est à noter qu'il n'y a qu'un "." après le END-EVALUATE et non après chaque instruction
WHEN OTHER est utile si aucune autre condition n'est validée
ON peut mettre autant de WHEN que l'on veux

#COBOL boucle

-boucle FOR

PERFORM 5 times
instructions
END-PERFORM.

Cela réalisera 5 fois l'instructions. Il n'y a qu'un "." après le END-PERFORM et non après chaque instructions

PERFORM VARYING i FROM x BY y UNTIL condition
  instructions
END-PERFORM.

Ceci est une boucle for avec un compteur, i est un numérique, x est la valeur initiale de i, y est le nombre par lequel est incrémentée i à chaque tour de boucle, 
la condition correspond au moment où la boucle FOR doit s'arrêter(i EQUAL 54 par exemple)
Il n'y a qu'un "." après le END-PERFORM et non après chaque instructions


-boucle WHILE

PERFORM UNTIL condition
instruction
END-PERFORM.

Cela fera les instruction tant que la condition est fausse(i LESS THAN 54)
Il n'y a qu'un "." après le END-PERFORM et non après chaque instructions

#COBOL tableau

UN tableau de taille 10(avec OCCURS 10). 
POur définir un tableau, utilisez 01, 77 ou 88

01 tableau.
	02 indice PIC 9.
	02 case   PIC 9(2) OCCURS 10.

#COBOL paragraphe

Pour utiliser un paragraphe, il faut faire PERFORM NOM-PARAGRAPHE. (le "." est présent après le nom du paragraphe)


#COBOL lire fichier

Il faut commencer par définit un ENVIRONMENT DIVISION de la manière suivante

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE CONTROL.
	SELECT FILEDESCRIPTOR ASSIGN TO NOMFICHIER
		ORGANIZATION IS LINE SEQUENTIAL.

FILEDESCRIPTOR est le descriptor qui nous permettra de lire le fichier, il sera à remettre dans la FILE SECTION de la DATA DIVISION
NOMFICHIER est le nom du fichier(si le nom est "personne.txt" par exemple, il faudra mettre ASSIGN TO "personne.txt")
ORGANIZATION IS LINE SEQUENTIAL signifie qu'on lit le fichier de gauche à droite puis de haut en bas.

Maintenant, déclarons la DATA DIVISION 

DATA DIVISION.
FILE SECTION
FS FILEDESCRIPTOR
01 LIGNE.
	05 F-NOM    PIC X(15).
        05 F-PRENOM PIC X(15).
        05 F-DATE   PIC X(8).
        
le FILEDESCRIPTOR de la DATA DIVISION est le même que celle de l'EnVIRONMENT DIVISION
01 LIGNE avec ses 3 champs nous intéressent. 
Le premier champ F-NOM signifie que les 15 premiers caractères de la ligne sont des noms
Le second champ F-PRENOM signifie que les 15 caractères suivant sont le prénoms
le dernier champ F-DATE signifie que les 8 caractère encores après correspondent à un date
s'il y a des caractère après les 38 premiers caractères, ils ne seront pas traités par ce programme cobol

Il y a des choses spécifique à faire dans la PROCEDURE DIVISION pour les fichiers.
OPEN INPUT FILEDESCRIPTOR.
cette commande ouvre le fichier en mode input ce qui signifie qu'on va lire et non écrire dans ce fichier.

à la fin, il faut fermer le fichier.
CLOSE FILEDESCRIPTOR.

Mais avant de fermer le fichier, on aimerai le lire

PERFORM UNTIL condition qui n'est pas vérifié(une variable qui n'est pas égale à "F" par exemple)
	READ FILEDESCRIPTOR
		AT END
			changer la variable à "F"
		NOT AT END
			instruction
	END-READ
END-PERFORM.

les champs F- sont déjà remplis lors du READ FILEDESCRIPTOR
on peut les mettres dans un tableau par exemple avec un MOVE(si c'est ce que vous voulez faire, vous aurez besoin d'un index à incrémentez par vous-mêmes)

#Git

git init -> créer un repositories (pas forcément vide)

git add -> choisir les fichiers(modifié ou créer) à mettre sur le repositories

git status -> voir quelles fichiers sont modifiés et présent dans le repositories, 
les fichiers modifiés qui ne sont pas pris en compte dans le repositories ainsi que
les fichier qui ne sont pas dans le repo

git commit -> écrit un message décrivant les changements réalisés

git pull -> mets à jour le repositories avec les changements du repositories distant

git push -> envoie sur le repositories distant les fichiers choisis par un git add sur le repositories local

git clone -> créer une copie d'un repositories distant

git remote -> créer, afficher et supprimer des connexions avec d'autre dépôt

#Terminal

-commande cd: permet de se déplacer dans les dossiers

-commande ls: permet de voir les fichiers du dossier dans lequel on se trouve

-commande rm: permet de supprimer un fichier

-commande rmdir: permet de supprimer un dossier

-commande mv: déplace un fichier ailleurs
mv fichier destination

-commande cp: créer une copie d'un fichier dans la destination 
cp fichierCopier Destination

créer une copie de 2 fichiers dans la destination
cp fichierCopier1 fichierCopier2 Destination

copier 2 fichier dans le dossier courant(avec des noms différent)
cp fichierCopier1 fichierCopier2

-commande mkdir: permet de créer un dossier
mkdir nomDuDossierCreer



#Recruteur IT

etape pour le recruteur

Interne: 60% des emplois

Analyse besoin/marché/compétences/prévisions -> cooptations(demande au salarié de recommender quelqu'un à l'extérieur) et formation des équipes pour éviter de recruter en externe
vivier(bibliothèque de cv, candidature spontané) 

Externe: 40% des emplois

publier 1 emploi
ATS-IA-> 10% des cv seront ensuite lus par un humain(pendant 20 secondes)
pré-entretin RH 10-15 minutes
entretien RH 1 heure
entretien technique(souvent avec futur manager)
entretien DRH



