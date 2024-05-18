# (NOT) BETWEEN

## Between

```abap
col [NOT] BETWEEN obj1 AND obj2
```

Vérifie que la colonne `est ou non` (`NOT`) `comprise entre deux objets`, ceux-ci pouvant être une [CONSTANTE](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/02_CONSTANTES.md), une [VARIABLE](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) ou un autre champ de [TABLE](../../10_DB_TABLES/02_TABLES.mdd).

_Exemple_

_Sélectionner toutes les marques et modèles de voiture compris entre 2013 et 2016._

```abap
CONSTANTS: lc_year1 TYPE zcar_brand_mod-model_year VALUE '2013',
           lc_year2 TYPE zcar_brand_mod-model_year VALUE '2016'.

SELECT brand,
       model
  FROM zcar_brand_mod
  INTO TABLE @DATA(lt_car)
  WHERE model_year BETWEEN @lc_year1 AND @lc_year2.

DATA ls_car LIKE LINE OF lt_car.

LOOP AT lt_car INTO ls_car.
  WRITE:/ ls_car-brand, ls_car-model.
ENDLOOP.
```

_Résultat de la requête_

| **BRAND**  | **MODEL** | **MODEL_YEAR** |
| ---------- | --------- | -------------- |
| VOLKSWAGEN | GOLF      | 2015           |

    Les paramètres du WHERE sont délimités par la syntaxe AND ou OR et peuvent être rergoupés par des parenthèses (surtout lors de l'utilisation du OR car sans, le résultat de la requête ne serait pas celui espéré).

## NOT BETWEEN

```abap
col [NOT] BETWEEN obj1 AND obj2
```

Vérifie que la colonne est ou non (`NOT`) comprise entre deux objets, ceux-ci pouvant être une [CONSTANTE](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/02_CONSTANTES.md), une [VARIABLE](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) ou un autre champ de [TABLE](../../10_DB_TABLES/02_TABLES.md).

_Exemple_

_Sélectionner toutes les marques et modèles de voiture compris entre 2013 etr 2016._

```abap
CONSTANTS: lc_year1 TYPE zcar_brand_mod-model_year VALUE '2013',
           lc_year2 TYPE zcar_brand_mod-model_year VALUE '2016'.

SELECT brand,
       model
  FROM zcar_brand_mod
  INTO TABLE @DATA(lt_car)
  WHERE model_year BETWEEN @lc_year1 AND @lc_year2.

DATA ls_car LIKE LINE OF lt_car.

LOOP AT lt_car INTO ls_car.
  WRITE:/ ls_car-brand, ls_car-model.
ENDLOOP.
```

_Résultat de la requête_

| **BRAND**  | **MODEL** |
| ---------- | --------- |
| AUDI       | A3        |
| FORD       | ESCORT    |
| RENAULT    | MEGANE    |
| VOLKSWAGEN | GOLF      |
