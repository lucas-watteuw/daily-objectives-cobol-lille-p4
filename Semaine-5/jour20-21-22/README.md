Dans les fichier ".dat", une ligne commence par 01 ou 02.
S'il commence par 01, on a le nom, prénom et âge d'un éléve 
S'il commence par 02, il s'agit du libéllé, du coefficient et de la note que l'éléve a obtenu.

Il sera supposé(pour l'instant?) que le fichier est correctement formé sans aucun problème, 
pas même de doublon.

Les informations sur les éléves seront stockés dans un tableau à 2 dimensions.
Le première dimension contiendra le nom, prénom et âge de l'éléve.
La seconde dimension contiendra les notes avec leur libellé et coefficient.

Cette solution permet de lié les éléves avec leur note, choses qui n'aurait pas été possible
si 2 tableaux avaient été utiliser.

Quand on lit une note, on ne lit que des PIC X car avec des PIC 9V9 par exemple, la ","
est considéré comme un nombre et non comme un séparateur entre le partie entière et décimale.