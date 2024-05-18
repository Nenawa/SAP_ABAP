# JOIN

```abap
. . .FROM table1 INNER JOIN table2. . . ON. . .
. . .FROM table1 LEFT [OUTER] JOIN table2. . . ON. . .
. . .FROM table1 RIGHT [OUTER] JOIN table2. . . ON. . .
```

L’option facultative `OUTER` a été mentionnée pour information mais elle n’apporte absolument rien de plus, donc en résumé :

- `LEFT OUTER JOIN` est exactement la même chose que `LEFT JOIN`

- `RIGHT OUTER JOIN` est exactement la même chose que `RIGHT JOIN`.

Il s'agit de sélectionner des données contenues dans deux [TABLES](../../10_DB_TABLES/02_TABLES.md) différentes (`JOIN`) associées par un ou plusieurs champs en commun (définis par le `ON`). Ainsi :

- `INNER JOIN` : ne seront sélectionnées que les données communes aux deux [TABLES](../../10_DB_TABLES/02_TABLES.md).

- `LEFT JOIN` : sélectionnera toutes les données de `table1` (située à gauche de la syntaxe) et affichera les données de `table2` ou les affichera `vides` si elles n'existent pas.

- `RIGHT JOIN` : fonctionne exactement de la même façon sauf qu'il s'agira de la table située à droite de l'instruction (ici table2).

  ![](../../ressources/12_01_19_01.png)

## INNER JOIN

_Exemple_

_Pour chaque enregistrement contenu dans la table `ZCAR_RAND_MODEL`, une requête affichera le conducteur._

```abap
SELECT zcar_brand_mod~brand,
       zcar_brand_mod~model,
       zcar_brand_mod~model_year,
       zdriver_car~surname,
       zdriver_car~name
  FROM zcar_brand_mod INNER JOIN zdriver_car
    ON zcar_brand_mod~brand       = zdriver_car~car_brand
    AND zcar_brand_mod~model      = zdriver_car~car_model
    AND zcar_brand_mod~model_year = zdriver_car~car_year
  INTO TABLE @DATA(lt_car).

DATA ls_car LIKE LINE OF lt_car.

LOOP AT lt_car INTO ls_car.
  WRITE:/ ls_car-brand,   ls_car-model, ls_car-model_year,
          ls_car-surname, ls_car-name.
ENDLOOP.
```

Les champs suivants sont sélectionnés : `BRAND`, `MODEL` et `YEAR` de la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZCAR_BRAND_MOD`, et `SURNAME` et `NAME` de la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZDRIVER_CAR`. Avec le `FROM`, les noms des [TABLE](../../10_DB_TABLES/02_TABLES.md) source sont ensuite définis ainsi que leur modèle de jonction (`INNER JOIN`), et leur jointure basée sur trois champs communs : la marque (`BRAND` / `CAR_BRAND`), le modèle (`MODEL` / `CAR_MODEL`) et l'année (`MODEL_YEAR` / `CAR_YEAR`). La requête stockera le résultat dans la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lT_CAR`.

Comme `OpenSQL` ne peut pas identifier quel champ appartient à quelle [TABLE](../../10_DB_TABLES/02_TABLES.md), il est nécessaire dans un `JOIN` de lui indiquer la provenance avec le nom de la [TABLE](../../10_DB_TABLES/02_TABLES.md), un `tilde` (`~`) et le nom de la colonne.

Cependant, il n'est pas très facile de lire cette requête et comme pour le nom des colonnes, il est possible d'utiliser un alias pour les tables. Ainsi la requête peut se réécrire :

```abap
SELECT b~brand,
       b~model,
       b~model_year,
       d~surname,
       d~name
  FROM zcar_brand_mod AS b INNER JOIN zdriver_car AS d
    ON  b~brand      = d~car_brand
    AND b~model      = d~car_model
    AND b~model_year = d~car_year
  INTO TABLE @DATA(lt_car).

DATA ls_car LIKE LINE OF lt_car.

LOOP AT lt_car INTO ls_car.
  WRITE:/ ls_car-brand,   ls_car-model, ls_car-model_year,
          ls_car-surname, ls_car-name.
ENDLOOP.
```

Maintenant la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZCAR_BRAND_MOD` utilise l'alias `b` et `ZDRIVER_CAR` utilise `d`, et toutes les références à ces deux [TABLES](../../10_DB_TABLES/02_TABLES.md) utiliseront désormais ces alias, rendant donc la requête beaucoup plus lisible.

_Résultat de la requête_

| **BRAND** | **MODEL** | **MODEL_YEAR** | **SURNAME** | **NAME** |
| --------- | --------- | -------------- | ----------- | -------- |
| PEUGEOT   | 307       | 2011           | DEBBACHE    | AMINH    |
| AUDI      | A3        | 2016           | ALDAIR      | PAULA    |
| FORD      | ESCORT    | 2013           | PILON       | BEATRIZ  |
| CITROEN   | C5        | 2012           | OLIVEIRA    | JOSE     |

## LEFT JOIN

_Exemple_

_Pour chaque enregistrement contenu dans la table `ZCAR_RAND_MODEL`, une requête affichera le conducteur._

```abap
SELECT b~brand,
       b~model,
       b~model_year,
       d~surname,
       d~name
  FROM zcar_brand_mod AS b LEFT JOIN zdriver_car AS d
    ON  b~brand      = d~car_brand
    AND b~model      = d~car_model
    AND b~model_year = d~car_year
  INTO TABLE @DATA(lt_car_left).

DATA ls_car_left LIKE LINE OF lt_car_left.

LOOP AT lt_car_left INTO ls_car_left.
  WRITE:/ ls_car_left-brand,      ls_car_left-model,
          ls_car_left-model_year, ls_car_left-surname,
          ls_car_left-name.
ENDLOOP.
```

_Résultat de la requête_

| **BRAND**  | **MODEL** | **MODEL_YEAR** | **SURNAME** | **NAME** |
| ---------- | --------- | -------------- | ----------- | -------- |
| PEUGEOT    | 307       | 2011           | DEBBACHE    | AMINH    |
| AUDI       | A3        | 2016           | ALDAIR      | PAULA    |
| FORD       | ESCORT    | 2013           | PILON       | BEATRIZ  |
| CITROEN    | C5        | 2012           | OLIVEIRA    | JOSE     |
| PEUGEOT    | 208       | 2012           |             |          |
| VOLKSWAGEN | GOLD      | 2015           |             |          |
| RENAULT    | MEGANE    | 2013           |             |          |

Toutes les données de la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZCAR_BRAND_MOD` sont affichées et dans les cas où aucune données n'est trouvée dans la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZDRIVER_CAR`, la requête affichera des valeurs nulles.

## RIGHT JOIN

_Exemple_

_Pour chaque enregistrement contenu dans la table `ZCAR_RAND_MODEL`, une requête affichera le conducteur._

```abap
SELECT d~surname,
       d~name,
       b~brand,
       b~model,
       b~model_year
  FROM zdriver_car AS d RIGHT JOIN zcar_brand_mod AS b
    ON  d~car_brand = b~brand
    AND d~car_model = b~model
    AND d~car_year  = b~model_year
  INTO TABLE @DATA(lt_car_right).

DATA ls_car_right LIKE LINE OF lt_car_right.

LOOP AT lt_car_right INTO ls_car_right.
  WRITE:/ ls_car_right-brand,      ls_car_right-model,
          ls_car_right-model_year, ls_car_right-surname,
          ls_car_right-name.
ENDLOOP.
```

_Résultat de la requête_

| **BRAND** | **MODEL** | **MODEL_YEAR** | **SURNAME** | **NAME** |
| --------- | --------- | -------------- | ----------- | -------- |
| DEBBACHE  | AMINH     | PEUGEOT        | 307         | 2011     |
| ALDAIR    | PAULA     | AUDI           | 13          | 2016     |
| PILON     | BEATRIZ   | FORD           | ESCORT      | 2013     |
| OLIVEIRA  | JOSE      | CITROEN        | C5          | 2012     |
|           |           | PEUGEOT        | 208         | 2012     |
|           |           | VOLKSWAGEN     | GOLF        | 2015     |
|           |           | RENAULT        | MEGANE      | 2013     |

L'ordre d'affichage des méthodes a été remanié pour que ce soit un peu plus clair ainsi que la jonction des [TABLES](../../10_DB_TABLES/02_TABLES.md) (sinon le `RIGHT JOIN` n'aurait pas fonctionné et agirait comme un `INNER JOIN`).

Maintenant que les jonctions de [TABLE](../../10_DB_TABLES/02_TABLES.md) avec le `JOIN` ont été vues, il serait intéressant de revenir sur la fonction dite "de remplissage" ([COALESCE](./16_SELECT_COALESCE.md)) mentionnée dans la partie des expressions [SQL](./01_SQL.md) du [SELECT](./02_SELECT.md).

_Pour rappel, l'instruction est définir ainsi :_

```abap
coalesce( obj1, obj2 )
```

Et permet d'afficher l'objet `obj1` (que ce soit la valeur d'un champ, d'une expression arithmétique...) mais si cette valeur est nulle, elle affichera ce qui est défini dans `obj2`.

En reprenant cette fonction pour qu'au lieu d'afficher un champ vide, la valeur `X` apparaisse :

```abap
SELECT b~brand,
       b~model,
       b~model_year,
       COALESCE( d~surname, 'X' ) AS surname,
       COALESCE( d~name, 'X' )    AS name
  FROM zcar_brand_mod AS b LEFT JOIN zdriver_car AS d
    ON  b~brand      = d~car_brand
    AND b~model      = d~car_model
    AND b~model_year = d~car_year
  INTO TABLE @DATA(lt_car_left).

DATA ls_car_left LIKE LINE OF lt_car_left.

LOOP AT lt_car_left INTO ls_car_left.
  WRITE:/ ls_car_left-brand,      ls_car_left-model,
          ls_car_left-model_year, ls_car_left-surname,
          ls_car_left-name.
ENDLOOP.
```

_Résultat de la requête_

| **BRAND**  | **MODEL** | **MODEL_YEAR** | **SURNAME** | **NAME** |
| ---------- | --------- | -------------- | ----------- | -------- |
| PEUGEOT    | 307       | 2011           | DEBBACHE    | AMINH    |
| AUDI       | A3        | 2016           | ALDAIR      | PAULA    |
| FORD       | ESCORT    | 2013           | PILON       | BEATRIZ  |
| CITROEN    | C5        | 2012           | OLIVEIRA    | JOSE     |
| PEUGEOT    | 208       | 2012           | X           | X        |
| VOLKSWAGEN | GOLD      | 2015           | X           | X        |
| RENAULT    | MEGANE    | 2013           | X           | X        |
