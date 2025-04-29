#COBOL arithmétique

-addition

ADD variable TO variable2  ajoute la variable à variable2 et enregistre le résultat dans variable2
ADD var1 var2 var3 TO var4 additionne var1 var2 et var3 et enregistre le résultat dans var4 

-soustraction 

SUBSTRACT var1 FROM var2   enlève var2 de var1 et enregistre le résultat dans var2
SUBSTRACT var1 FROM var2 GIVING var3  enlève var2 de var1 et enregistre le résultat dans var3

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

Cela fera les instruction tant que la condition est vrai(i LESS THAN 54)
Il n'y a qu'un "." après le END-PERFORM et non après chaque instructions


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



