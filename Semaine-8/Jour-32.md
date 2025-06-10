# Objectifs journaliers MS COBOL P4


## Mardi 10 Juin


### Définitions clés

* **Sous-programme** : Programme appelé pour exécuter une tâche spécifique (ex. `CALL "SUBPROG"`).
* **CALL** : Instruction pour invoquer un sous-programme, avec ou sans paramètres.
* **LINKAGE SECTION** : Section pour définir les données échangées entre programme principal et sous-programme.
* **PROCEDURE DIVISION USING** : Clause pour recevoir les paramètres dans un sous-programme.
* **WORKING-STORAGE SECTION** : Section pour les variables temporaires.

### Objectifs

* Découverte des sous-programmes avec un exemple minimal

  * [ ] Comprendre le rôle d’un sous-programme et le mécanisme du `CALL`.
  * [ ] Créer un programme principal qui passe des variables à un sous-programme.
  * [ ] Implémenter un sous-programme simple pour modifier une variable.
  * [ ] Tester la communication entre programme principal et sous-programme.

### Exercice pratique 

* [ ] Écrire un programme principal (`main.cbl`) qui :

  * Définit deux variables : `WS-NOM` (PIC X(20)) et `WS-RESULT` (PIC X(30)).
  * Passe `WS-NOM` à un sous-programme via `CALL`.
* [ ] Créer un sous-programme `GREET-USER` (`greet.cbl`) qui :

  * Reçoit `WS-NOM` via `LINKAGE SECTION`.
  * Construit un message (ex. "Bonjour, NOM") dans `WS-RESULT`.
  * Retourne `WS-RESULT` au programme principal.
* [ ] Afficher `WS-RESULT` dans le programme principal.


### Conseils

* Vérifier que les tailles des variables (PIC) correspondent entre `WORKING-STORAGE` et `LINKAGE SECTION`.
* Tester avec différentes valeurs pour `WS-NOM` (ex. "Bob", "Charlie").
* Compiler chaque fichier séparément pour isoler les erreurs.

### Compilation COBOL

```bash
cobc -x -o run main.cbl greet-user.cbl 
./run
```

### Bonus (simple)

* [ ] Créer un sous-programme `COUNT-CHARS` qui compte les caractères non vides de `WS-NOM` (ex. utiliser `FUNCTION LENGTH(FUNCTION TRIM(LK-NOM))`) et retourne le résultat dans une variable `WS-COUNT` (PIC 9(2)).

---
