# INDEX

Comme vu dans le chapitre [DDIC - SE11](../../09_DDIC/01_DICTIONNAIRE_DE_DONNEES.md), un `index` est une `clé secondaire` à une [TABLE](../../10_DB_TABLES/02_TABLES.md) de la base de données, permettant d’améliorer considérablement les performances d’une sélection.

Après avoir défini cette notion, il serait intéressant de voir comment l’utiliser dans une `requête SQL`.

_Exemple_

_Sélection des enregistrements de la table `ZTRAVEL` mais avec un filtre sur les champs `CITY_FROM` et `COUNTRY_FROM`._

```abap
CONSTANTS: lc_city_from TYPE ztravel-city_from VALUE 'TOULOUSE',
           lc_ctry_from TYPE ztravel-country_from VALUE 'FR'.

SELECT city_from,
       country_from,
       city_to,
       country_to,
       date_travel,
       hour_travel
  FROM ztravel
  INTO TABLE @DATA(lt_travel)
  WHERE city_from    = @lc_city_from
    AND country_from = @lc_ctry_from.
```

Comme la sélection s'effectue sur des champs non clés de la [TABLE](../../10_DB_TABLES/02_TABLES.md), il est possible, avec l'augmentation du nombre des données, que cette requête prenne du temps. Un `Index` va donc être créé.

Pour ceci, il faut :

- Exécuter la [TRANSACTION SE11](../../09_DDIC/01_DICTIONNAIRE_DE_DONNEES.md)

- Choisir l'option `Table base données`, renseigner le champ avec `ZTRAVEL` puis cliquer sur `Afficher` ou `Modifier` (pas d'importance).

- Dans la barre d'outils, cliquer sur le bouton `Index`...

  Une nouvelle fenêtre s'ouvre. Elle est composée d'une barre d'outils dont les trois dernières options sont les plus importantes :

  - Créer un index (icône de la feuille blanche)

  - Supprimer (corbeille)

  - Rafraichir la liste (doubles flèches)

  En cliquant sur l'icône de la feuille blanche, deux options sont possibles : `Créer index d'extension`.

Techniquement, il n'y a aucune différence entre ces deux options, et il est possible de choisir aussi bien l'une que l'autre. Cependant, avec la première option, l'index créé sur une [TABLE](../../10_DB_TABLES/02_TABLES.md) standard, est considéré comme une modification et sera éliminé durant une mise à jour de la version SAP (upgrade) alors qu'un index d'extension sera préservé.

- Cliquer sur `Créer index`

- Définir un `code d'indexation` (champ alphanumérique de trois positions), par exemple `Z01`.

- Insérer une description, par exemple ` Index secondaire CITY_FROM`.

  Viennent ensuite quelques options :

  - `Index non unique` (par défaut) / `Index unique` : comme pour les [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md), définit si les valeurs des données contenant cet index pauvent être dupliquées ou non.

  - Pour les `index` non-uniques, il est possible de définir si l'`index` doit être créé dans tous les systèmes de base de données, ou bien s'il doit être spécifique à certains (`pour les systèmes de BD sélectionnées`), ou s'il ne doit apparaître dans aucun. En réalité, un `index` non unique est une forme détournée pour supprimer des `index secondaires standards`, créés par SAP.

- Laisser ces options par défaut (`Index non unique` / `Index dans tous les systèmes de BD`).

- Cliquer ensuite sur le bouton `Zones de table`. La liste des champs de la table apparaît ; choisir alors les deux nécessaires ; `CITY_FROM` et `COUNTRY_FROM`.

Au final, l'index devra contenir les informations suivantes :

- Sauvegarder (définir la classe de développement puis un ordre de transport si nécessaire ou bien le laisser comme objet local).

- Activer.

Ainsi, sans modifier la requête initiale, la sélection se fera beaucoup plus rapidement.
