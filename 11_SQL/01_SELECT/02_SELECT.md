# SELECT

```abap
SELECT result
       FROM source
       [FOR ALL ENTRIES IN itab] 
       WHERE sql_cond
       [GROUP BY group] 
       [HAVING group_cond]
       [ORDER BY sort_key]
       INTO|APPENDING target
       [UP TO n ROWS]
       [BYPASSING BUFFER]
       [CONNECTION con|(con_syntax)].
```

    Pour rappel, les instructions entre crochets sont optionnelles.

Tout d'abord, le `SELECT` est l'instruction pour la lecture d'une [TABLE](../../10_DB_TABLES/02_TABLES.md). Depuis la nouvelle version de SAP (pour rappel, de la version `Ehp6` à `Ehp7`), prête pour l'interaction avec les Base de données HANA, beaucoup de fonctions sont apparues et il serait intéressant de s'y attarder.

Pour résumer, un `SELECT` a quatre paramètres et cette instruction pourrait se résumer à ceci :

```abap
SELECT col
  FROM table
  INTO dest
  WHERE cond.
```

SELECTION des colonnes `col` 
  DEPUIS la table `table`
  STOCKER dans `dest`
  OU conditions `cond`
