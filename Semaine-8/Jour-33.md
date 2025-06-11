# Objectifs journaliers MS COBOL P4

### Mercredi 11 Juin

---

### Définitions clés

* **RETURN-CODE** : Variable pour indiquer le succès/échec d’un sous-programme.
* **FILE SECTION** : Section du DATA DIVISION pour définir les structures de fichiers.
* **PARAMETER PASSING** : Passage par valeur (BY CONTENT) ou par référence (BY REFERENCE).
* **FILE-CONTROL** : Clause dans INPUT-OUTPUT SECTION pour lier un fichier.
* **Bash Script** : Script shell pour automatiser des tâches (ex. compilation/exécution).

---

### Objectifs

* Sous-programmes avec fichiers, validation et automatisation Bash

  * [ ] Comprendre le passage de paramètres (BY CONTENT, BY REFERENCE).
  * [ ] Lire un fichier `users.dat` dans un programme principal.
  * [ ] Créer un sous-programme pour valider un enregistrement.
  * [ ] Gérer les erreurs via `RETURN-CODE`.
  * [ ] Écrire un script Bash pour compiler et exécuter tous les programmes COBOL.

---

### Exercices pratiques

* [ ] Définir un enregistrement pour `users.dat`, en utilisant un `.copy` :

```cobol
01 USER-RECORD.
   05 ID-USER     PIC X(10).
   05 NOM         PIC X(50).
   05 EMAIL       PIC X(50).
```

* [ ] Exemple de contenu de `users.dat` :

```
0000000001John Doe                                      john.doe@example.com
0000000002Jane Smith                                    janesmithexample.com
0000000003Alice Martin                                  alice@martin.org
```

* [ ] Écrire un programme principal `main.cbl` qui :

  * Lit ligne par ligne le fichier `users.dat`
  * Appelle `VALIDATE-USER` pour chaque enregistrement

* [ ] Créer un sous-programme `validate.cbl` :

  * Vérifie que l’adresse e-mail contient un `@` via l’instruction `INSPECT`
  * Retourne `RETURN-CODE = 0` si valide, `RETURN-CODE = 1` sinon

* [ ] Messages d’erreur à écrire dans `errors.log` :

```text
[Ligne 2] Erreur : Email invalide "janesmithexample.com"
```

---


### Conseils

* Tester `VALIDATE-USER` avec des emails invalides (ex. `"test.com"`, `"user@domain"`, `"@email"`).
* Utiliser `INSPECT FUNCTION` pour rechercher le caractère `@` :

```cobol
INSPECT EMAIL TALLYING AT-COUNT FOR ALL "@"
```

* Rendre le script Bash exécutable :

```bash
chmod +x compile_run.sh
./compile_run.sh
```

---

### Bonus

* [ ] Modifier le script Bash pour supprimer les fichiers objets `.o` après exécution (déjà intégré ci-dessus avec `rm -f *.o`).
* [ ] Ajouter un contrôle dans `VALIDATE-USER` pour vérifier que le champ `ID-USER` est composé uniquement de chiffres.

---

### Script Bash (`compile_run.sh`)

```bash
#!/bin/bash
# Déclaration de l'interpréteur Bash utilisé pour exécuter ce script.

echo "Compilation des fichiers COBOL..."
# Affiche un message indiquant que la compilation des fichiers COBOL commence.

for file in *.cbl; do
    # Boucle sur tous les fichiers avec l'extension .cbl dans le répertoire courant.
    # La variable 'file' prend successivement le nom de chaque fichier .cbl.

    if [[ -f "$file" ]]; then
        # Vérifie si le fichier existe et est un fichier régulier (non un dossier).
        # Cette condition évite des erreurs si aucun fichier .cbl n'est trouvé.

        if [[ "$file" == "main.cbl" ]]; then
            # Vérifie si le fichier courant est main.cbl.
            # Le fichier main.cbl est traité différemment car il contient probablement le point d'entrée du programme.

            cobc -x -o main "$file"
            # Compile le fichier main.cbl avec le compilateur COBOL (cobc).
            # -x : Indique que le fichier doit être compilé en un exécutable.
            # -o main : Spécifie que l'exécutable généré s'appellera 'main'.
            # "$file" : Le fichier COBOL à compiler (ici main.cbl).

        else
            # Si le fichier n'est pas main.cbl, il est traité comme un module.

            cobc -c "$file"
            # Compile le fichier COBOL en un fichier objet (.o).
            # -c : Indique une compilation partielle, générant un fichier objet sans lier.
        fi
        # Fin de la condition vérifiant si le fichier est main.cbl.

    fi
    # Fin de la condition vérifiant si le fichier existe.
done
# Fin de la boucle sur les fichiers .cbl.

if [[ -f "main" ]]; then
    # Vérifie si l'exécutable 'main' a été créé avec succès.
    # Cela indique que la compilation de main.cbl a réussi.

    echo "Liaison des fichiers objets..."
    # Affiche un message indiquant que la phase de liaison commence.

    cobc -x -o run main.o *.o
    # Lie tous les fichiers objets (.o) pour créer un exécutable final nommé 'run'.
    # -x : Indique la création d'un exécutable.
    # -o run : Spécifie que l'exécutable final s'appellera 'run'.
    # main.o *.o : Inclut main.o et tous les autres fichiers objets (.o) dans le répertoire.

    echo "Exécution du programme..."
    # Affiche un message indiquant que l'exécutable va être lancé.

    ./run
    # Exécute le programme généré (run).
    # Le './' indique que l'exécutable se trouve dans le répertoire courant.

    echo "Nettoyage des fichiers objets..."
    # Affiche un message indiquant que les fichiers objets temporaires vont être supprimés.

    rm -f *.o
    # Supprime tous les fichiers objets (.o) pour nettoyer le répertoire.
    # -f : Force la suppression sans demander de confirmation.

else
    # Si l'exécutable 'main' n'existe pas, cela signifie que main.cbl n'a pas été trouvé ou que sa compilation a échoué.

    echo "Erreur : main.cbl non trouvé ou compilation échouée."
    # Affiche un message d'erreur pour informer l'utilisateur.

    exit 1
    # Termine le script avec un code de retour 1, indiquant une erreur.
fi
# Fin de la condition vérifiant l'existence de l'exécutable 'main'.
```