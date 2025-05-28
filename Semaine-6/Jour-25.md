# Objectifs journaliers MS COBOL P4

### Date : Mercredi 28 Mai

---

## Définitions clés

* **CRUD** : Opérations de base en base de données — Create, Read, Update, Delete.
* **COMMIT / ROLLBACK** : Gestion des transactions SQL.
* **SELECT INTO** : Instruction SQL pour récupérer une seule ligne sans curseur.

---

## Objectifs

* [ ] Créer une table `individus` : `(id INT PRIMARY KEY, nom VARCHAR, prenom VARCHAR, num VARCHAR)`.
* [ ] Écrire un programme COBOL CRUD simple sans curseur.
* [ ] Demander l’ID en entrée pour identifier la ligne à lire, modifier ou supprimer.
* [ ] Implémenter les opérations :

  * Ajouter un individu.
  * Lire un individu (afficher).
  * Modifier un individu.
  * Supprimer un individu.
* [ ] Gérer les transactions avec `COMMIT` / `ROLLBACK`.
* [ ] Construire un menu interactif texte avec une boucle.
* [ ] Utiliser un `EVALUATE` pour gérer les choix du menu.
* [ ] Tester les opérations en COBOL et avec `psql`.

---

## Exercices pratiques

* [ ] Créer la table SQL `individus` avec les colonnes suivantes :
  `id` (INT, clé primaire), `nom` (VARCHAR), `prenom` (VARCHAR), `num` (VARCHAR).

* [ ] Écrire un programme COBOL qui propose un menu avec les options CRUD suivantes :

  1. Ajouter un individu
  2. Lire un individu (sur saisie de l’ID)
  3. Modifier un individu (sur saisie de l’ID)
  4. Supprimer un individu (sur saisie de l’ID)
  5. Quitter le programme

* [ ] Pour chaque opération, demander les informations nécessaires à l’utilisateur via `DISPLAY` / `ACCEPT`.

* [ ] Utiliser l’instruction SQL `INSERT` pour ajouter un individu.

* [ ] Utiliser l’instruction SQL `SELECT INTO` pour lire un individu en fonction de l’ID.

* [ ] Utiliser l’instruction SQL `UPDATE` pour modifier un individu identifié par son ID.

* [ ] Utiliser l’instruction SQL `DELETE` pour supprimer un individu identifié par son ID.

* [ ] Gérer correctement les transactions avec `COMMIT` après chaque succès et `ROLLBACK` en cas d’erreur.

* [ ] Implémenter un menu en boucle avec la commande COBOL `PERFORM UNTIL`.

* [ ] Utiliser un `EVALUATE` pour diriger le programme vers la section correspondante à l’option choisie.

* [ ] Prévoir la gestion des erreurs SQL (avec `SQLCODE`) et afficher des messages clairs à l’utilisateur.

---

## Tips

* Le programme doit rester simple, sans curseurs.
* Toutes les interactions doivent passer par l’ID pour identifier la ligne à manipuler.
* Bien tester chaque fonctionnalité indépendamment dans PostgreSQL avec `psql`.
* Le menu doit rester lisible et fonctionnel, avec une boucle qui tourne jusqu’à ce que l’utilisateur quitte.
* Le numéro de téléphone doit être un int, le programme doit verifié la saisie de l'entier.
* Gérer les erreurs, notamment si un ID saisi n’existe pas lors de la lecture, modification ou suppression.

---

## 

```bash
export COB_LDFLAGS=-Wl,--no-as-needed
ocesql 'program'.cbl 'program'.cob
cobc -locesql -x -v -o  'run'  'program'.cob
```
L'`export` sert à définir une variable d’environnement qui influence l’édition de liens (linking) lors de la compilation d’un programme COBOL, afin de s'assurer l'appel des bonnes bibliothèques.
---

## Bonus

* Ajouter une option pour afficher la liste complète des individus (nécessite l’utilisation d’un curseur).

* Ajouter une validation simple sur les saisies.

* Documenter brièvement les instructions SQL utilisées (`INSERT`, `SELECT INTO`, `UPDATE`, `DELETE`, `COMMIT`, `ROLLBACK`).

---
