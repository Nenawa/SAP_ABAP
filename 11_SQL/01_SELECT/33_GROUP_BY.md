# GROUP BY

```abap
. . .GROUP BY col1, col2,. . .
. . .GROUP BY sql_exp1, sql_exp2,. . .
```

_Exemple_

_Pour chaque conducteur (nom et prénom), afficher le nombre de voyages effectués, plus le total des kilomètres effectués et des dépenses effectuées (péage plus essence)._

```abap
SELECT d~surname               AS surname,
       d~name                  AS name,
       COUNT(*)                AS nb_travel,
       SUM( t~kms )            AS kms,
       SUM( t~gasol + t~toll ) AS costs
  FROM ztravel AS t INNER JOIN zdriver_car AS d
  ON t~id_driver = d~id_driver
  INTO TABLE @DATA(lt_travel)
  GROUP BY d~surname, d~name.


DATA ls_travel LIKE LINE OF lt_travel.

LOOP AT lt_travel INTO ls_travel.
  WRITE:/ ls_travel-surname, ls_travel-name, ls_travel-nb_travel,
          ls_travel-kms,     ls_travel-costs.
ENDLOOP.
```

_Résultat de la requête_

| **SURNAME** | **NAME** | **NB_TRAVEL** | **KMS** | **COSTS** |
| ----------- | -------- | ------------- | ------- | --------- |
| DEBBACHE    | AMINH    | 1             | 205     | 56.21     |
| PILON       | BEATRIZ  | 2             | 389     | 109.38    |
| ALDAIR      | PAULA    | 1             | 170     | 56.50     |

## EXPRESSIONS SQL DANS GROUP BY

Il est également possible d'utiliser des expressions [SQL](./01_SQL.md) dans le `GROUP BY`.

_Exemple_

_En modifiant légèrement la requête par une concaténation des colonnes `NAME` et `SURNAME` :_

```abap
SELECT d~surname && @space && d~name     AS name,
       COUNT(*)                AS nb_travel,
       SUM( t~kms )            AS kms,
       SUM( t~gasol + t~toll ) AS costs
  FROM ztravel AS t INNER JOIN zdriver_car AS d
  ON t~id_driver = d~id_driver
  INTO TABLE @DATA(lt_travel)
  GROUP BY d~surname && @space && d~name.

DATA ls_travel LIKE LINE OF lt_travel.

LOOP AT lt_travel INTO ls_travel.
  WRITE:/ ls_travel-name, ls_travel-nb_travel,
          ls_travel-kms,  ls_travel-costs.
ENDLOOP.
```

_Résultat de la requête_

| **NAME**       | **NB_TRAVEL** | **KMS** | **COSTS** |
| -------------- | ------------- | ------- | --------- |
| ALDAIR PAULA   | 1             | 205     | 56.21     |
| DEBBACHE AMINH | 2             | 389     | 109.38    |
| PILON BEATRIZ  | 1             | 170     | 56.50     |
