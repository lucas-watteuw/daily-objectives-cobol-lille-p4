# Objectifs journaliers MS COBOL P4


### Définitions clés
- CRUD : Create, Read, Update, Delete
- SELECT INTO : récupération d’une ligne sans curseur
- EVALUATE : structure de contrôle pour choix multiples (menu)
- STRING : concaténation de chaînes en COBOL


**Développement des opérations CRUD et génération de rapport**

### Objectifs
[ ] Développer un menu interactif en COBOL avec les options CRUD + quitter  
[ ] Implémenter les opérations CRUD pour `LIVRES` via `ISBN`  
[ ] Ajouter un livre manuellement via `DISPLAY/ACCEPT`  
[ ] Générer un fichier rapport structuré (*.dat)  
[ ] Afficher une statistique (ex. nombre de livres par catégorie)  
[ ] Gérer les erreurs SQL via `SQLCODE`

### Exercices pratiques
[ ] Écrire un programme COBOL avec un menu en boucle (`PERFORM UNTIL`)  
[ ] Implémenter :  
- [ ] Ajout manuel d’un livre  
- [ ] Lecture d’un livre  
- [ ] Modification   
- [ ] Suppression   
- [ ] Génération du rapport  
[ ] Utiliser `EXEC SQL SELECT INTO`, `INSERT`, `UPDATE`, `DELETE` selon les cas  


### Conseils
- Utiliser `EVALUATE` pour structurer les choix du menu  
- Vérifier l’existence d’un livre (`SELECT INTO`) avant toute modification/suppression  
- Tester chaque opération individuellement

### Bonus
[ ] Ajouter une option d’ajout d’emprunt  
[ ] Valider la saisie utilisateur   
[ ] Utiliser un curseur pour le rapport (si plusieurs lignes)
