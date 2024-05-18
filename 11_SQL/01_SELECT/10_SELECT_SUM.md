# SUM

Plusieurs fonctions d'agrégats existent sur SAP pour les requêtes [SQL](./01_SQL.md).

`SUM ( [DISTINCT] col )` Cet agrégat fait la somme de toutes les valeurs d’une colonne.

Exemple

Faire le total de tous les péages payés.

```abap
DATA: lv_sum TYPE ztravel-toll.

SELECT SUM( toll )
  FROM ztravel
  INTO @lv_sum.
```

Selon les valeurs enregistrées dans la [TABLE](../../10_DB_TABLES/02_TABLES.md), `lv_sum` aura la valeur `55` (16 + 17 + 16 + 6).

L’option `DISTINCT` peut être utilisée aussi avec cet agrégat et éliminera de nouveau les lignes en double. Ainsi la requête précédente avec le `DISTINCT` donnera :

```abap
DATA: lv_sum TYPE ztravel-toll.

SELECT SUM( DISTINCT toll )
  FROM ztravel
  INTO @lv_sum.
```

La valeur stockée dans la [VARIABLE](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) `lv_sum` sera égale à ’39’ (16 + 17 + 6).
