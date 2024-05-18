# INTO

Plusieurs types de `INTO` ont déjà été détaillés dans les parties précédentes comme :

## Into Variable

Données stockées dans une structure déclarée auparavant dans un `DATA`

```abap
INTO ls
```

## Into Table

Données stockées dans une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) déclarée auparavant dans un `DATA`.

```abap
INTO TABLE table
```

## Into (Variables...)

Donnée stockées dans les [VARIABLES](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) `obj1`, `obj2`, `obj3`... déclarés auparavant dans un `DATA`.

```abap
INTO (obj1, obj2, obj3, ...)
```

## Into @DATA(structure)

Données stockées dans une structure déclarée directement dans la requête.

```abap
INTO @DATA(ls)
```

## Into @DATA(Table)

Données stockées dans une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) déclarée directement dans la requête.

```abap
INTO @DATA(table)
```

## Into (@DATA(Variables)...)

```abap
INTO (@DATA(obj1), @DATA(obj2), @DATA(obj3), ...)
```

## Into Corresponding Fields Of

Lorsque les champs du [SELECT](./02_Select.md) ne respectent pas forcément l'ordre des colonnes de la table, le `INTO CORRESPONDING FIELDS OF` va chercher et associer les bonnes valeurs avec les bons champs.

```abap
INTO CORRESPONDING FIELDS OF ls
INTO CORRESPONDING FIELDS OF TABLE table
```

_Exemple_

```abap
DATA: lt_brand_mod TYPE TABLE OF zcar_brand_mod.
FIELD-SYMBOLS: <lfls_brand_mod> TYPE zcar_brand_mod.

SELECT model_year,
       brand,
       model
  FROM zcar_brand_mod
  INTO TABLE @lt_brand_mod.

LOOP AT lt_brand_mod ASSIGNING <lfls_brand_mod>.
  WRITE:/ <lfls_brand_mod>-model_year, <lfls_brand_mod>-brand,
          <lfls_brand_mod>-model.
ENDLOOP.
```

La [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lT_BRAND_MOD` est une table ayant pour référence la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZCAR_BRAND_MOD`. La requête va ensuite sélectionner les champs `MODEL_YEAR`, `BRAND`, et `MODEL` et les stocker dans celle-ci.

_Résultat de la requête_

| **MANDT** | **BRAND**  | **MODEL** | **MODEL_YEAR** |
| --------- | ---------- | --------- | -------------- |
| 201       | AUDI       | 13        | 0000           |
| 201       | CITROEN    | C5        | 0000           |
| 201       | FORD       | ESCORT    | 0000           |
| 201       | PEUGEOT    | 208       | 0000           |
| 201       | PEUGEOT    | 307       | 0000           |
| 201       | RENAULT    | MEGANE    | 0000           |
| 201       | VOLKSlsGEN | GOLD      | 0000           |

La requête va donc remplir la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) des colonnes de la gauche vers la droite alors qu'avec l'option `INTO CORRESPONDING FIELDS OF`, il va la remplir correctement.

```abap
DATA: lt_brand_mod TYPE TABLE OF zcar_brand_mod.
FIELD-SYMBOLS: <lfls_brand_mod> TYPE zcar_brand_mod.

SELECT model_year,
       brand,
       model
  FROM zcar_brand_mod
  INTO CORRESPONDING FIELDS OF TABLE @lt_brand_mod.

LOOP AT lt_brand_mod ASSIGNING <lfls_brand_mod>.
  WRITE:/ <lfls_brand_mod>-model_year, <lfls_brand_mod>-brand,
          <lfls_brand_mod>-model.
ENDLOOP.
```

_Résultat de la requête_

| **MANDT** | **BRAND**  | **MODEL** | **MODEL_YEAR** |
| --------- | ---------- | --------- | -------------- |
|           | AUDI       | 13        | 2016           |
|           | CITROEN    | C5        | 2012           |
|           | FORD       | ESCORT    | 2013           |
|           | PEUGEOT    | 208       | 2012           |
|           | PEUGEOT    | 307       | 2011           |
|           | RENAULT    | MEGANE    | 2013           |
|           | VOLKSlsGEN | GOLD      | 2015           |

Il en est de même lorsqu'il s'agir d'une structure de destination.

```abap
DATA: ls_brand_mod TYPE zcar_brand_mod.

SELECT SINGLE model_year,
       brand,
       model
  FROM zcar_brand_mod
  INTO CORRESPONDING FIELDS OF @ls_brand_mod.
```

## APPENDING

```abap
APPENDING [CORRESPONDING FIELDS OF] TABLE table
```

Cette instruction fonctionne uniquement avec une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) et donne la possibilité d'ajouter de nouveaux résultats sans supprimer les anciens.

Par exemple, avec la requête suivante, la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lt_passenger`, n'aura qu'une fois les enregistrement de la [TABLE](../../09_Tables_DB/01_Tables.md) `ZPASSENGER`.

```abap
SELECT surname,
       name,
       date_birth
  FROM zpassenger
  INTO TABLE @DATA(lt_passenger).

SELECT surname,
       name,
       date_birth
  FROM zpassenger
  INTO TABLE @lt_passenger.

DATA ls_passenger LIKE LINE OF lt_passenger.

LOOP AT lt_passenger INTO ls_passenger.
  WRITE:/ ls_passenger-surname, ls_passenger-name,
          ls_passenger-date_birth.
ENDLOOP.
```

_Résultat de la requête_

| **SURNAME** | **NAME** | **DATE_BIRTH** |
| ----------- | -------- | -------------- |
| PEREZ       | MICHEL   | 29799724       |
| VALE        | SONIA    | 19830220       |
| OLIVIERA    | JOSE     | 19781106       |
| HERNANDEZ   | PATRICIA | 19841002       |

    A noter que la table interne lt_passenger ayant déjà été déclarée avec le DATA dans la première requête, il n'est pas nécessaire de la délcarer de nouveau dans la deuxième.

    Il est possible de voir que le WRITE va automatiquement convertir la date en format visible, défini dans les paramètre de l'utilisateur. Pour y accéder, de n'importe quelle transaction, il suffit d'aller dans le menu Système - Valeurs utilisateur - Données utilisateur.

Et de renseigner le format de la date désiré dans l'onglet `Constantes`, champ `Représ. de date`. Il est possible de paramétrer d'autres options comme les décimales, le format de l'heure...

Cependant, si l'option `APPENDING TABLE` est utilisée dans la deuxième requête, les enregistrements de la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZPASSENGER` apparaîtront deux fois dans la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lt_passenger`.

```abap
SELECT surname,
       name,
       date_birth
  FROM zpassenger
  INTO TABLE @DATA(lt_passenger).

SELECT surname,
       name,
       date_birth
  FROM zpassenger
  APPENDING TABLE @lt_passenger.

DATA ls_passenger LIKE LINE OF lt_passenger.

LOOP AT lt_passenger INTO ls_passenger.
  WRITE:/ ls_passenger-surname, ls_passenger-name,
          ls_passenger-date_birth.
ENDLOOP.
```

_Résultat de la requête_

| **SURNAME** | **NAME** | **DATE_BIRTH** |
| ----------- | -------- | -------------- |
| PEREZ       | MICHEL   | 29799724       |
| VALE        | SONIA    | 19830220       |
| OLIVIERA    | JOSE     | 19781106       |
| HERNANDEZ   | PATRICIA | 19841002       |
| PEREZ       | MICHEL   | 29799724       |
| VALE        | SONIA    | 19830220       |
| OLIVIERA    | JOSE     | 19781106       |
| HERNANDEZ   | PATRICIA | 19841002       |

De plus, l'option facultative `CORRESPONDING FIELDS OF` est utiliser de la même manière que dans la section précédente.

```abap
DATA: lt_passenger TYPE TABLE OF zpassenger,
      ls_passenger TYPE zpassenger.

SELECT surname,
       name,
       date_birth
  FROM zpassenger
  INTO CORRESPONDING FIELDS OF TABLE @lt_passenger.

SELECT surname,
       name,
       date_birth
  FROM zpassenger
  APPENDING CORRESPONDING FIELDS OF TABLE @lt_passenger.
```

_Résultat de la requête_

| **MANDT** | **ID_PASS** | **SURNAME** | **NAME** | **DATE_BIRTH** | **CITY** | **COUNTRY** | **LANG** |
| --------- | ----------- | ----------- | -------- | -------------- | -------- | ----------- | -------- |
|           |             | PEREZ       | MICHEL   | 19790724       |          |             |          |
|           |             | VALE        | SONIA    | 19830220       |          |             |          |
|           |             | OLIVEIRA    | JOSE     | 19781106       |          |             |          |
|           |             | HERNANDEZ   | PATRICIA | 19841002       |          |             |          |
|           |             | PEREZ       | MICHEL   | 19700724       |          |             |          |
|           |             | VALE        | SONIA    | 19830220       |          |             |          |
|           |             | OLIVEIRA    | JOSE     | 10781106       |          |             |          |
|           |             | HERNANDEZ   | PATRICIA | 19841002       |          |             |          |
