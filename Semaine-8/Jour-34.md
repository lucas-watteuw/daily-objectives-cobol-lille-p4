# Objectifs journaliers MS COBOL P4


### Jeudi 12 Juin


### Définitions clés

* **EXEC SQL** : Instruction pour intégrer des requêtes SQL dans COBOL.
* **HOST VARIABLES** : Variables COBOL utilisées dans les requêtes SQL (ex. `:HOST-VAR`).
* **SQLCODE** : Code retour pour vérifier le succès/échec d’une requête.
* **COMMIT / ROLLBACK** : Validation ou annulation d’une transaction SQL.

### Objectifs

* Connexion à PostgreSQL et gestion des utilisateurs

  * [ ] Configurer PostgreSQL et créer une table `USERS`.
  * [ ] Écrire un programme COBOL pour se connecter à PostgreSQL.
  * [ ] Implémenter un sous-programme pour insérer un utilisateur.
  * [ ] Gérer les erreurs SQL avec `SQLCODE`.

### Exercices pratiques

* [ ] Créer une table `USERS` avec `init-users.sql` :

  ```sql
  CREATE TABLE USERS (
      ID_USER VARCHAR(10) PRIMARY KEY,
      NOM VARCHAR(50),
      PASSWORD VARCHAR(50)
  );
  ```
* [ ] Insérer 3 utilisateurs via `psql`.
* [ ] Écrire un programme COBOL (`main_sql.cbl`) avec `EXEC SQL CONNECT`.
* [ ] Créer un sous-programme `INSERT-USER` (`insert.cbl`) pour insérer un utilisateur avec `EXEC SQL INSERT`.
* [ ] Vérifier `SQLCODE` après chaque opération.

### Conseils

* Configurer `ocesql` pour PostgreSQL.
* Tester la connexion avec `psql` avant COBOL.
* Documenter les paramètres du sous-programme.

### Compilation COBOL

```bash
export COB_LDFLAGS=-Wl,--no-as-needed
ocesql main_sql.cbl main_sql.cob
cobc -locesql -x -o run main_sql.cob
./compile_run.sh
```

### Bonus

* [ ] Ajouter une contrainte `CHECK` sur `PASSWORD` (longueur ≥ 8 caractères).
* [ ] A partir de votre programme `etudiant.cbl`, afin de soulager le programme, le découper en 3 sous-programmes.
   - [ ] Les calculs devront être fait en SQL.
---

