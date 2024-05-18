# WHERE ANY

Aussi, les trois options [ALL](./22_Where_All.md), `ANY` et [SOME](./23_Where_Some.md) vont peaufiner ce critère de recherche, en vérifiant que toute la condition est respectée pour tous les registres de la sous-requête ([ALL](./22_Where_All.md)) ou bien en partie respectée ([SOME](./23_Where_Some.md) et `ANY`)

_Exemple_

_Importer, dans la table interne `lT_TRAVEL`, els trajets de la table `ZTRAVEK` dont le champs `KMS` (kilomètrage) est strictement inférieur ou égal à tous les kilométrages de `ZTRAVEL` définis dans une sous-requête._

```abap
SELECT city_from,
       country_from,
       city_to,
       country_to,
       kms
  FROM ztravel
  INTO TABLE @DATA(lt_travel)
  WHERE kms <= ANY ( SELECT kms FROM ztravel ).

DATA ls_travel LIKE LINE OF lt_travel.

LOOP AT lt_travel INTO ls_travel.
  WRITE:/ ls_travel-city_from, ls_travel-country_from,
          ls_travel-city_to,   ls_travel-country_to,
          ls_travel-kms.
ENDLOOP.
```

Cette même requête avec les options [SOME](./23_Where_Some.md) ou `ANY`, retournerait tous les enregistrements de la [TABLE](../../09_Tables_DB/01_Tables.md) `ZTRAVEL`.
