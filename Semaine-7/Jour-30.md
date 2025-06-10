# Objectifs journaliers MS COBOL P4

### Jeudi 5 Juin 

## Jour 3 – Jeudi 5 Juin 2025

### Définitions clés
- Rapport formaté : fichier texte structuré et lisible
- SQLCODE : code de retour SQL (0 = succès, 100 = aucun résultat, etc.)
- Analyse réflexive : retour sur les choix techniques et les difficultés

**Finalisation et préparation à la présentation**

### Objectifs
[ ] Finaliser toutes les fonctionnalités du programme  
[ ] Ajouter une recherche par nom d’auteur ou catégorie (curseur SQL)  
[ ] Générer un rapport final clair : titres, colonnes alignées, statistiques  
[ ] Rédiger la documentation complète (*.md ou *.pdf)  
[ ] Préparer la présentation orale (10 minutes)  
[ ] Tester toutes les fonctionnalités dans `psql` et via le programme COBOL

### Exercices pratiques
[ ] Ajouter une option de recherche dans le menu  
[ ] Générer un rapport formaté aligné, incluant une statistique (ex. nombre de livres par catégorie)  
[ ] Tester la robustesse du programme : ISBN inexistant, doublons, insertions multiples  
[ ] Rédiger la documentation :  
- [ ] Schéma relationnel  
- [ ] Justification des colonnes  
- [ ] Logique de programme  
- [ ] Analyse réflexive  
[ ] Préparer un support de présentation : schéma, extraits de code, démo, défis rencontrés  
[ ] Pousser tout le projet (code, SQL, doc, rapport) sur GitHub

### Conseils
- Utiliser un curseur pour la recherche ou le rapport (si plusieurs lignes retournées)  
- Soigner l’alignement du rapport texte  
- Préparer une démo courte : lecture fichier, ajout manuel, génération rapport

### Bonus
[ ] Ajouter la gestion complète des `EMPRUNTS` dans le menu  
[ ] Valider les saisies (année correcte, format ISBN, etc.)   
[ ] Préparer une démo interactive pour l’oral (ajout d’un livre en direct)
