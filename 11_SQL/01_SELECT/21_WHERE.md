# WHERE

Les paramètre définis dans la clause `WHERE` de la requête permettent d'affiner la recherche afin de retourner un résultat plus proche du besoin. Là encore, plusieurs options existent et le `WHERE` peut être utilisé avec :

## OPERATEURS DE COMPARAISON

[LISTE OPERATEURS DE COMPARAISON](../../04_CONDITIONS/01_OPERATEURS_DE_COMPARAISON.md)

L'objet de la condition `obj` peut être défini comme une [VARIABLE](../../04_Variables/01_Variables.md), [CONSTANTE](../../04_Variables/02_Constants.md), une autre colonne ou même une autre sous-requête.

_Exemple_

_Sélection de toutes les marques et modèles de voitures de marque `PEUGEOT` ou `VOLKSWAGEN` dont l'année de construction est supérieure ou égale à 2015._

```abap
SELECT brand,
       model,
       model_year
  FROM zcar_brand_mod
  INTO TABLE @DATA(lt_car_mod)
  WHERE ( brand    =  'PEUGEOT' OR brand = 'VOLKSWAGEN' )
    AND model_year >= '2015'.

DATA ls_car_mod LIKE LINE OF lt_car_mod.

LOOP AT lt_car_mod INTO ls_car_mod.
  WRITE:/ ls_car_mod-brand, ls_car_mod-model, ls_car_mod-model_year.
ENDLOOP.
```

_Résultat de la requête_

| **BRAND**  | **MODEL** | **MODEL_YEAR** |
| ---------- | --------- | -------------- |
| VOLKSWAGEN | GOLF      | 2015           |

    Les paramètres du WHERE sont délimités par la syntaxte AND (et) ou OR (ou) et peuvent être regroupés par des parenthèses (surtout lors de l'utilisation du OR car sans, le résultat de la requête ne serait pas celui espéré).

La notion de sous-requête a été évoqué précédemment. Elle est, comme son nom l'indique, une autre requête retournant un résultat qui doit être vérifié par la condition principale.

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
| PERPIGNAN     | FR               | BARCELONE   | ES             | 195     |
| BARCELONE     | ES               | PERPIGNAN   | FR             | 194     |
| BARCELONE     | ES               | LERIDA      | ES             | 170     |
