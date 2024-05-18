# FOR ALL ENTRIES IN

Le `FOR ALL ENTRIES IN` utilise les données d'une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) pour effectuer une nouvelle sélection.

_Exemple_

_Pour chaque voiture contenue dans la table ZCAR_BRAND_MODEL, une requête affichera le nom et le prénom du conducteur :_

```abap
SELECT brand,
       model,
       model_year
  FROM zcar_brand_mod
  INTO TABLE @DATA(lt_car).

IF NOT lt_car[] IS INITIAL.

  SELECT car_brand AS brand,
         car_model AS model,
         car_year  AS year,
         surname,
         name
    FROM zdriver_car
    INTO TABLE @DATA(lt_driver)
    FOR ALL ENTRIES IN @lt_car
    WHERE car_brand = @lt_car-brand
      AND car_model = @lt_car-model
      AND car_year  = @lt_car-model_year.

ENDIF.

DATA ls_driver LIKE LINE OF lt_driver.

LOOP AT lt_driver INTO ls_driver.
  WRITE:/ ls_driver-brand,   ls_driver-model, ls_driver-year,
          lS_driver-surname, ls_driver-name.
ENDLOOP.
```

Une première requête va d'abord sélectionner toutes les marques et modèles des voitures existantes dans la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZCAR_BRAND_MOD`. Dans une deuxième requête, cette [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) sera utilisée avec un `FOR ALL ENTRIES IN` afin de faire la jonction avec la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZDRIVER_CAR` et de sélectionner toutes les données nécessaires.

_Résultat de la requête_

| **BRAND** | **MODEL** | **YEAR** | **SURNAME** | **NAME** |
| --------- | --------- | -------- | ----------- | -------- |
| PEUGEOT   | 307       | 2011     | DEBBACHE    | AMINH    |
| AUDI      | A3        | 2016     | ALDAIR      | PAULA    |
| FORD      | ESCORT    | 2013     | PILON       | BEATRIZ  |
| CITROEN   | C5        | 2012     | OLIVEIRA    | JOSE     |

L'instruction suivante vérifie si la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) est vide ou non (l'utilisation des crochets ira vérifier le contenu de la [TABLE](../../10_DB_TABLES/02_TABLES.md)).

```abap
IF [NOT] itab IS INITIAL.
  . . .
ENDIF.
```

Ainsi, dans l'exemple précédent, la ligne en question signifie : si le contenu de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lT_CAR` n'est pas vide, alors...

    Lors de l'utilisation du FOR ALL ENTRIES IN, il est nécessaire de toujours vérifier que la table interne servant à cette fonction ne soit jamais vide avec un IF NOT... IS INITIAL au risque de sélectionner touts les registres d'une table de base de données, problématique pour les performances du programme.

L'exemple du `FOR ALL ENTRIES IN` est une adaptation de celui cu dans la partie sur le [JOIN](./19_Join.md), et reste bien moins performant que ce dernier (surtout lors de l'utilisation des bases de données Hana). Il est donc nécessaire de prioriser l'utilisation du [INNER JOIN](./19_JOIN.md) autant que possible.
