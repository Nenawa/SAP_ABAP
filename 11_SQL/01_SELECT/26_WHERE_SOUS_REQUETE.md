# WHERE... SOUS-REQUETE

La notion de sous-requête a été évoquée précédemment. Elle est, comme son nom l'indique, une autre requête retournant un résultat qui doit être vérifié par la condition principale.

_Exemple_

_Retourner tous les trajets dont la distance est strictement inférieure à celle du trajet le plus long._

```abap
SELECT city_from,
       country_from,
       city_to,
       country_to,
       kms
  FROM ztravel
  INTO TABLE @DATA(lt_travel)
  WHERE kms < ( SELECT max( kms ) FROM ztravel ).

DATA ls_travel LIKE LINE OF lt_travel.

LOOP AT lt_travel INTO ls_travel.
  WRITE:/ ls_travel-city_from, ls_travel-country_from,
          ls_travel-city_to,   ls_travel-country_to.
ENDLOOP.
```

_Résultat de la requête_

| **CITY_FROM** | **COUNTRY_FROM** | **CITY_TO** | **COUNTRY_TO** | **KMS** |
| ------------- | ---------------- | ----------- | -------------- | ------- |
| BARCELONE     | ES               | LERIDA      | ES             | 170     |

Cette même requête avec les options [SOME](./23_Where_Some.md) ou [ANY](./24_Where_Any.md), retournerait tous les enregistrements de la [TABLE](../../09_Tables_DB/01_Tables.md) `ZTRAVEL`.
