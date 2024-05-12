# **WHERE**

Les paramètre définis dans la clause `WHERE` de la requête permettent d'affiner la recherche afin de retourner un résultat plus proche du besoin. Là encore, plusieurs options existent et le `WHERE` peut être utilisé avec :

## OPERATEURS DE COMPARAISON

[LISTE OPERATEURS DE COMPARAISON](../../05_Conditions/01_Operateurs_de_Comparaison.md)

![](../../ressources/12_01_21_01.png)

L'objet de la condition `obj` peut être défini comme une [VARIABLE](../../04_Variables/01_Variables.md), [CONSTANTE](../../04_Variables/02_Constants.md), une autre colonne ou même une autre sous-requête.

_Exemple_

_Sélection de toutes les marques et modèles de voitures de marque `PEUGEOT` ou `VOLKSWAGEN` dont l'année de construction est supérieure ou égale à 2015._

```JS
SELECT brand,
       model,
       model_year
  FROM zcar_brand_mod
  INTO TABLE @DATA(t_car_mod)
  WHERE ( brand    =  'PEUGEOT' OR brand = 'VOLKSWAGEN' )
    AND model_year >= '2015'.

DATA s_car_mod LIKE LINE OF t_car_mod.

LOOP AT t_car_mod INTO s_car_mod.
  WRITE:/ s_car_mod-brand, s_car_mod-model, s_car_mod-model_year.
ENDLOOP.
```

_Résultat de la requête_

| **BRAND**  | **MODEL** | **MODEL_YEAR** |
| ---------- | --------- | -------------- |
| VOLKSWAGEN | GOLF      | 2015           |

_Résultat à l'écran_

![](../../ressources/12_01_21_02.png)

    Les paramètres du WHERE sont délimités par la syntaxte AND (et) ou OR (ou) et peuvent être regroupés par des parenthèses (surtout lors de l'utilisation du OR car sans, le résultat de la requête ne serait pas celui espéré).

La notion de sous-requête a été évoqué précédemment. Elle est, comme son nom l'indique, une autre requête retournant un résultat qui doit être vérifié par la condition principale.

_Exemple_

_Retourner tous les trajets dont la distance est strictement inférieure à celle du trajet le plus long._

```JS
SELECT city_from,
       country_from,
       city_to,
       country_to,
       kms
  FROM ztravel
  INTO TABLE @DATA(t_travel)
  WHERE kms < ( SELECT max( kms ) FROM ztravel ).


DATA s_travel LIKE LINE OF t_travel.

LOOP AT t_travel INTO s_travel.
  WRITE:/ s_travel-city_from, s_travel-country_from,
          s_travel-city_to,   s_travel-country_to.
ENDLOOP.
```

_Résultat de la requête_

| **CITY_FROM** | **COUNTRY_FROM** | **CITY_TO** | **COUNTRY_TO** | **KMS** |
| ------------- | ---------------- | ----------- | -------------- | ------- |
| PERPIGNAN     | FR               | BARCELONE   | ES             | 195     |
| BARCELONE     | ES               | PERPIGNAN   | FR             | 194     |
| BARCELONE     | ES               | LERIDA      | ES             | 170     |

![](../../ressources/12_01_21_03.png)
