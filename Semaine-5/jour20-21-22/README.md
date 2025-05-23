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
est considéré comme un nombre et non comme un séparateur entre la partie entière et décimale.

Concernant le calcul de la moyenne d'un éléve, on commence par additioner les notes multiplés par leur 
coefficient, puis une fois que cette somme est réalisé, on divise par la somme des coefficient des 
différentes matière. 

Les étudiants sont triés par ordre alphabétique.

Pour la détection de doublon(éléves qui ont le même nom de famille), on compare le nom de famille
avec le suivant(ce qui est possible car les étudiants sont triés par ordre alphabétique), si ils sont
identiques, on remplace le dernier caractère par un nombre(l'indice de parcours de tableau).

reste à faire:

- aucun test sur fichier vide ou mal formée 
- calcul des moyennes des matière
- écriture des moyennes par matière dans le fichier de sortie 
