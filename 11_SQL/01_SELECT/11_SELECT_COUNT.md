# COUNT

Plusieurs fonctions d'agrégats existent sur SAP pour les requêtes [SQL](./01_SQL.md).

- `SUM ( DISTINCT col )`
- `COUNT (*)`
- `COUNT ( * )`

Il s’agit ici d’un compteur retournant le nombre d’occurrences d’une colonne donnée. Si pour les autres agrégats, `DISTINCT` était une option, ici c’est un paramètre obligatoire dans le cas où le nom de la colonne a été spécifié. Ainsi, pour savoir combien il existe de villes de destination différentes, la requête suivante peut être utilisée :

```abap
DATA lv_count TYPE i.

SELECT COUNT( DISTINCT city_to )
  FROM ztravel
  INTO @lv_count.
```

Selon les valeurs enregistrées dans le chapitre [DDIC - SE11](../../09_DDIC/01_DICTIONNAIRE_DE_DONNEES.md), `lv_count` aura la valeur de 3.

`COUNT(*)` ou `COUNT( * )` permet de compter tout simplement les lignes d'une [TABLE](../../10_DB_TABLES/02_TABLES.md).

Exemple

Nombre de lignes de la table `ZCAR_BRAND_MOD`

```abap
DATA lv_count TYPE i.

SELECT COUNT( * )
  FROM zcar_brand_mod
  INTO @lv_count.
```

Le résultat obtenu sera de sept occurrences dans la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZCAR_BRAND_MOD`.

Il est possible aussi d'utiliser plusieurs de ces fonctions d'agrégats dans une requête unique.

Exemple

Pour chaque identification de conducteur, afficher le total des péages payés, leur moyenne, le voyage le plus long, et enfin le plus court :

```abap
TYPES: BEGIN OF ty_driver_infos,
         id    TYPE zdriver_id,
         total TYPE ztravel_toll,
         moy   TYPE ztravel_toll,
         max   TYPE n1dauer,
         min   TYPE n1dauer,
       END OF ty_driver_infos.

DATA: lt_driver_infos TYPE TABLE OF ty_driver_infos,
      ls_driver_infos TYPE ty_driver_infos.


SELECT id_driver       AS id,
       SUM( toll )     AS total,
       AVG( toll )     AS moy,
       MAX( duration ) AS max,
       MIN( duration ) AS min
  FROM ztravel
  INTO TABLE @lt_driver_infos
  GROUP BY id_driver.

LOOP AT lt_driver_infos INTO ls_driver_infos.
  WRITE:/ ls_driver_infos-id,  ls_driver_infos-total,
          ls_driver_infos-moy, ls_driver_infos-max,
          ls_driver_infos-min.
ENDLOOP.
```

La [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lt_driver_infos` aura les informations suivantes :

| **ID** | **TOTAL** | **MOY** | **MAX** | **MIN** |
| ------ | --------- | ------- | ------- | ------- |
| C0002  | 6.00      | 6.00    | 100     | 100     |
| C0003  | 33.00     | 16.50   | 150     | 130     |
| C0001  | 16.00     | 16.00   | 140     | 140     |
