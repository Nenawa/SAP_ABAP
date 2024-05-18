# MIN MAX

Plusieurs fonctions d'agrégats existent sur SAP pour les requêtes [SQL](./01_SQL.md).

`MAX ( [DISTINCT] col )` et `min ( [DISTINCT] col )` Renvoient la valeur maximum ou minimum de la [TABLE](../../10_DB_TABLES/02_TABLES.md) selon la colonne sélectionnée.

Exemple

Retourner la valeur maximum ou minimum de la table selon la colonne sélectionnée.

```abap
DATA: lv_min TYPE ztravel-duration,
      lv_max TYPE ztravel-duration.

SELECT MAX( duration ), MIN( duration )
    FROM ztravel
    INTO (@lv_max, @lv_min).
```

Les [VARIABLES](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) `lv_max` et `lv_min` `100` auront respectivement les valeurs `150` et `100`.

La fonctionnalité `DISTINCT` peut être utilisée également mais n’est pas d’une très grande utilité avec le `MIN` et le `MAX`.
