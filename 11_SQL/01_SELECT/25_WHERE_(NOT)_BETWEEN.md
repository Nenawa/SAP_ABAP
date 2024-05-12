# **(NOT) BETWEEN**

## Between

```JS
col [NOT] BETWEEN obj1 AND obj2
```

Vérifie que la colonne `est ou non` (`NOT`) `comprise entre deux objets`, ceux-ci pouvant être une [CONSTANTE](../../04_Variables/02_Constants.md), une [VARIABLE](../../04_Variables/01_Variables.md) ou un autre champ de [TABLE](../../09_Tables_DB/01_Tables.md).

_Exemple_

_Sélectionner toutes les marques et modèles de voiture compris entre 2013 et 2016._

```JS
CONSTANTS: c_year1 TYPE zcar_brand_mod-model_year VALUE '2013',
           c_year2 TYPE zcar_brand_mod-model_year VALUE '2016'.

SELECT brand,
       model
  FROM zcar_brand_mod
  INTO TABLE @DATA(t_car)
  WHERE model_year BETWEEN @c_year1 AND @c_year2.

DATA s_car LIKE LINE OF t_car.

LOOP AT t_car INTO s_car.
  WRITE:/ s_car-brand, s_car-model.
ENDLOOP.
```

_Résultat de la requête_

| **BRAND**  | **MODEL** | **MODEL_YEAR** |
| ---------- | --------- | -------------- |
| VOLKSWAGEN | GOLF      | 2015           |

_Résultat à l'écran_

![](../../ressources/12_01_25_01.png)

    Les paramètres du WHERE sont délimités par la syntaxe AND ou OR et peuvent être rergoupés par des parenthèses (surtout lors de l'utilisation du OR car sans, le résultat de la requête ne serait pas celui espéré).

## **NOT BETWEEN**

```JS
col [NOT] BETWEEN obj1 AND obj2
```

Vérifie que la colonne est ou non (`NOT`) comprise entre deux objets, ceux-ci pouvant être une [CONSTANTE](../../04_Variables/02_Constants.md), une [VARIABLE](../../04_Variables/01_Variables.md) ou un autre champ de [TABLE](../../09_Tables_DB/01_Tables.md).

_Exemple_

_Sélectionner toutes les marques et modèles de voiture compris entre 2013 etr 2016._

```JS
CONSTANTS: c_year1 TYPE zcar_brand_mod-model_year VALUE '2013',
           c_year2 TYPE zcar_brand_mod-model_year VALUE '2016'.

SELECT brand,
       model
  FROM zcar_brand_mod
  INTO TABLE @DATA(t_car)
  WHERE model_year BETWEEN @c_year1 AND @c_year2.


DATA s_car LIKE LINE OF t_car.

LOOP AT t_car INTO s_car.
  WRITE:/ s_car-brand, s_car-model.
ENDLOOP.
```

_Résultat de la requête_

| **BRAND**  | **MODEL** |
| ---------- | --------- |
| AUDI       | A3        |
| FORD       | ESCORT    |
| RENAULT    | MEGANE    |
| VOLKSWAGEN | GOLF      |

_Résultat à l'écran_

![](../../ressources/12_01_25_02.png)
