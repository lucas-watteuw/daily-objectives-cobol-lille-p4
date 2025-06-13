 # Daily – Vendredi 13 Juin (Jour-35)

## COBOL & SCREEN SECTION

---

## Définitions clés

### Concepts fondamentaux de la SCREEN SECTION

* [ ] **SCREEN SECTION** : Partie de la `DATA DIVISION` en COBOL, utilisée pour créer des interfaces utilisateurs en mode texte.
* [ ] Clauses principales :

  * `LINE` : Ligne à laquelle s'affiche le champ.
  * `COLUMN` ou `COL` : Colonne à laquelle s'affiche le champ.
  * `VALUE` : Texte statique ou valeur initiale.
  * `FROM` : Affiche une variable en lecture seule.
  * `TO` : Permet la saisie dans une variable.
  * `USING` : Affiche et permet la modification d’une variable.
  * `FOREGROUND-COLOR` / `BACKGROUND-COLOR` : Couleurs du texte et de fond (valeurs 0 à 7).
  * `AUTO` : Passe automatiquement au champ suivant après saisie.
* [ ] **Couleurs disponibles** (0 à 7) :

  * `0` : Noir
  * `1` : Bleu
  * `2` : Vert
  * `3` : Cyan
  * `4` : Rouge
  * `5` : Magenta
  * `6` : Jaune
  * `7` : Blanc
* [ ] **Variables pour les couleurs** : On peut utiliser des variables (e.g. `PIC 9`) pour contrôler dynamiquement l’apparence des écrans.

---

## Objectifs

* [ ] Comprendre la structure de la `SCREEN SECTION`.
* [ ] Utiliser les clauses `VALUE`, `FROM`, `TO`, `USING`.
* [ ] Gérer les couleurs dynamiquement avec des variables.
* [ ] Créer un écran de saisie simple.
* [ ] Tester un écran avec gestion interactive des couleurs.

---


## Exercice pratique : Écran de saisie d’un client

### Objectif

Créer un écran simple en COBOL qui permet de saisir les informations d’un client : **prénom**, **nom**, **âge**, avec **gestion de la couleur du texte**.
L'exercice permet de manipuler les clauses `VALUE`, `TO`, `FOREGROUND-COLOR`, et `AUTO`.

---

### Étapes 

* [ ] Déclarer les variables nécessaires dans la `WORKING-STORAGE SECTION`.
* [ ] Créer un écran dans la `SCREEN SECTION` :

  * `VALUE` pour afficher les libellés.
  * `TO` pour permettre la saisie utilisateur.
  * `FOREGROUND-COLOR` avec une **variable de couleur**.
* [ ] Afficher l’écran avec `DISPLAY`.
* [ ] Capturer la saisie avec `ACCEPT`.
* [ ] Afficher les résultats saisis avec `DISPLAY`.

* [ ] (Bonus) Ajouter une **demande préalable à l’utilisateur** pour choisir la couleur d’affichage (`1=bleu`, `2=vert`, `4=rouge`, etc.).
* [ ] (Bonus) Modifier dynamiquement la variable `WS-COLOR` selon le choix.

---

## Micro-tuto : Utilisation de la SCREEN SECTION

### 1. Structure de base

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-NOM            PIC X(20).
01  WS-AGE            PIC 9(3).
01  WS-COULEUR-TEXTE  PIC 9 VALUE 7.  *> Blanc
01  WS-COULEUR-FOND   PIC 9 VALUE 1.  *> Bleu

SCREEN SECTION.
01  ECRAN-SAISIE.
    05  LINE 5 COL 10 VALUE "Nom : ".
    05  LINE 5 COL 16 PIC X(20) TO WS-NOM AUTO.
    05  LINE 6 COL 10 VALUE "Age : ".
    05  LINE 6 COL 16 PIC 9(3) TO WS-AGE
        FOREGROUND-COLOR WS-COULEUR-TEXTE
        BACKGROUND-COLOR WS-COULEUR-FOND AUTO.
```

### 2. Affichage et saisie

```cobol
PROCEDURE DIVISION.
    DISPLAY ECRAN-SAISIE.
    ACCEPT ECRAN-SAISIE.
    DISPLAY "Nom saisi : " WS-NOM.
    DISPLAY "Age saisi : " WS-AGE.
    STOP RUN.
```

---

## Exercice : Création d’un écran interactif avec couleurs dynamiques

### Étapes à suivre :

* [ ] Définir les variables de saisie et de couleurs.
* [ ] Créer un écran avec libellés statiques, zones de saisie, affichage et modification.
* [ ] Utiliser `FROM`, `TO`, `USING` selon le besoin.
* [ ] Contrôler l’apparence avec des couleurs dynamiques.
* [ ] Afficher les résultats après la saisie.

---

## Concepts complémentaires COBOL SCREEN SECTION

### Bonnes pratiques

* [ ] **Validation des couleurs** : S'assurer que les valeurs sont bien entre 0 et 7.
* [ ] **Compatibilité** : Les comportements peuvent varier selon les compilateurs (IBM, Micro Focus…).
* [ ] **Lisibilité** : Attention aux contrastes (ex : pas de texte noir sur fond noir).
* [ ] **Clause PICTURE** : Requise avec `FROM`, `TO`, `USING`.


## Nomenclature COBOL

* **Variables** : Préfixées par `WS-`, avec des noms explicites en MAJUSCULES et tirets (`-`).
* **Hiérarchie SCREEN SECTION** :

  * `01` pour l’écran
  * `05` pour les champs
* **Conventions** : Lisibilité priorisée, noms descriptifs (ex : `WS-NOM-MODIF`, `WS-COULEUR-FOND`).

---