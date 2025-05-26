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

COMPUTE var1 = FUNCTION MOD(var2 var3)   enregistre le reste de la division de var2 par var3 dans var1

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

Un tableau de taille 10(avec OCCURS 10). 
Pour définir un tableau, utilisez 01, 77 ou 88

01 tableau.
	02 indice PIC 9.
	02 case   PIC 9(2) OCCURS 10.
	
-tableau multimensionelle

01    TABLEAU-LOTS.
      05    TAB-HOR  OCCURS 36.
            10    TAB-H  PIC XX.
            10    TAB-VER  OCCURS 36.
                  15    TAB-V  PIC XX.

#COBOL paragraphe

Pour utiliser un paragraphe, il faut faire PERFORM NOM-PARAGRAPHE. (le "." est présent après le nom du paragraphe)

Pour utiliser un pararaphe, en précisant le début et la fin du paragraphe

PERFORM 0100-MOVE-TO-OUTPUT-BEGIN
THRU 0100-MOVE-TO-OUTPUT-END

#COBOL lire fichier

Il faut commencer par définit un ENVIRONMENT DIVISION de la manière suivante

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
	SELECT FILEDESCRIPTOR ASSIGN TO NOMFICHIER
		ORGANIZATION IS LINE SEQUENTIAL.

FILEDESCRIPTOR est le descriptor qui nous permettra de lire le fichier, il sera à remettre dans la FILE SECTION de la DATA DIVISION
NOMFICHIER est le nom du fichier(si le nom est "personne.txt" par exemple, il faudra mettre ASSIGN TO "personne.txt")
ORGANIZATION IS LINE SEQUENTIAL signifie qu'on lit le fichier de gauche à droite puis de haut en bas.

Maintenant, déclarons la DATA DIVISION 

DATA DIVISION.
FILE SECTION
FD FILEDESCRIPTOR.
01 LIGNE.
	05 F-NOM    PIC X(15).
        05 F-PRENOM PIC X(15).
        05 F-DATE   PIC X(8).
        
le FILEDESCRIPTOR de la DATA DIVISION est le même que celle de l'ENVIRONMENT DIVISION
01 LIGNE avec ses 3 champs nous intéressent. 
Le premier champ F-NOM signifie que les 15 premiers caractères de la ligne sont des noms
Le second champ F-PRENOM signifie que les 15 caractères suivant sont le prénoms
le dernier champ F-DATE signifie que les 8 caractère encores après correspondent à un date
s'il y a des caractère après les 38 premiers caractères, ils ne seront pas traités par ce programme cobol

!!!Un cas particulier est à traiter, si la structure de la ligne est définie dans un autre fichier que vous souahitez utiliser.

FD FILEDESCRIPTOR.
	COPY "fileCPY.cpy".
	 
FD FILEDESCRIPTOR.
	COPY fileCPY.



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


#SQL

SGBD: système de gestion de base de données est un logiciel système permettant aux utilisateurs et programmeurs de créer et de gérer des bases de données.
exemple de SGDB: IBM Db2, Oracle DATABASE et Microsoft SQL Server
Plus simplement, un sgdb est un logiciel pour créer, supprimer des base de données ou les modifier(ajout ou modification 
ou suppresion de données). 

base de données: Une base de données est un outil qui permet de collecter et d'organiser des informations. 
Plus simplement, une base de données est un ensemble de donnée. permet de stocker les informations et données


base de données NOSQL: Les bases de données NoSQL sont désignées indifféremment comme « non relationnelles » ou « non SQL » pour souligner le fait qu'elles peuvent gérer d'importants volumes de données non structurées et évoluant rapidement, et de manière différente par rapport à une base de données relationnelle (SQL) avec lignes et tables.

Les exemples de bases de données non relationnelles incluent MongoDB, Azure Cosmos DB, DocumentDB, Cassandra, Couchbase, HBase, Redis et Neo4j. Certaines bases de données non relationnelles sont appelées bases de données NoSQL.

NOSQL: not only SQL

Plus simplement, une base de données NOSQL contient des données hétérogène n'ayant aucun lien 
entre eux.

une base de donnée relationnelle: Une base de données relationnelle organise les données en tables constituées de lignes et de colonnes, facilitant ainsi leur manipulation et leur interrogation à l’aide du langage SQL.
Relationnelle pour éviter redondance des donnée
Plus simplement, une base de donnée relationnelle est une base de donnée ayant des données homogène et organisé afin de 
faciliter les différentes opération que l'on pourrait vouloir faire dans cette table.

une clé primaire: Une clé primaire est un champ ou un ensemble de champs de table qui contient des valeurs uniques.
Plus simplement, une clé primaire est une information qui est unique dans la base de données.
identifiant unique qui permet de distinguer les données entre eux.

clé secondaire: clé qui n'est pas primaire

SQL: Le langage SQL (Structured Query Language) est un langage de requête populaire fréquemment utilisé dans tous les types d'applications. 
Plus simplement, SQL est un langage de programmation fait pour récupérer des informations dans une base de données.
langage qui  permet d'intéragir avec des bases de données

CRUD: CREATE READ UPDATE DELETE parfois SCRUD avec S pour SEARCH 
Plus simplement, CRUD représente ce que l'on peux faire avec une base de données.

-commande:

démarrer postgresql:

sudo service postgresql start
sudo -u postgres psql


LA BASE DE DONNEE S'APPELLE coboldatabase


créer et se connecter à la database(base de donnée):

CREATE DATABASE NOMdatabase;
\c NOMdatabase  -- Se connecter à la base

créer table:

CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    telephone VARCHAR(20)
);


insérer donné:

INSERT INTO clients (nom, prenom, telephone)
VALUES 
    ('Durand', 'Sophie', '0612345678'),
    ('Lemoine', 'Alex', '0623456789'),
    ('Martin', 'Lucie', '0634567890');
	

supprimer une table:

DROP TABLE nomdelatable;

supprimer une base de donnée:

DROP DATABASE nomdelabasededonnée;


modifier la base de donnée:

UPDATE table
SET nom_colonne_1 = 'nouvelle valeur'
WHERE condition --sélection de ligne

Cette syntaxe permet d’attribuer une nouvelle valeur à la colonne nom_colonne_1 pour les lignes qui respectent la condition stipulé avec WHERE. Il est aussi possible d’attribuer la même valeur à la colonne nom_colonne_1 pour toutes les lignes d’une table si la condition WHERE n’était pas utilisée.

A noter, pour spécifier en une seule fois plusieurs modification, il faut séparer les attributions de valeur par des virgules. Ainsi la syntaxe deviendrait la suivante :

UPDATE table
SET colonne_1 = 'valeur 1', colonne_2 = 'valeur 2', colonne_3 = 'valeur 3'
WHERE condition --sélection de ligne


exemple

UPDATE client
SET rue = '49 Rue Ameline',
  ville = 'Saint-Eustache-la-Forêt',
  code_postal = '76210'
WHERE id = 2


UPDATE client
SET pays = 'FRANCE'



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



