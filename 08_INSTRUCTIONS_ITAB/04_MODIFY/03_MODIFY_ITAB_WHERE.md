# MODIDFY WHERE

    Pour l’instruction MODIFY, il existe trois formes de syntaxe possibles.

```abap
MODIFY itab FROM ls
            TRANSPORTING comp1 comp2 ...
            WHERE cond.
```

Pour cette instruction, le `MODIFY` va utiliser une clause `WHERE` pour spécifier la ligne de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `itab` à modifier à partir de la structure `ls`.

Exemple

Reprendre l’exemple du [COLLECT](../03_Collect/01_Collect_into_itab.md) et initialiser le champ `AGE` à `10` pour le pays égal à `IT`.

```abap
TYPES: BEGIN OF ty_country,
         land   TYPE char3,
         age(3) TYPE i,
       END OF ty_country.

DATA: lt_country TYPE HASHED TABLE OF ty_country WITH UNIQUE KEY land,
      ls_country TYPE ty_country.

ls_country-land = 'FR'.
ls_country-age  = 23.
COLLECT ls_country INTO lt_country.

ls_country-land = 'IT'.
ls_country-age  = 20.
COLLECT ls_country INTO lt_country.

ls_country-land = 'IT'.
ls_country-age  = 55.
COLLECT ls_country INTO lt_country.

ls_country-land = 'FR'.
ls_country-age  = 5.
COLLECT ls_country INTO lt_country.

CLEAR ls_country-land.
ls_country-age  = 10.
MODIFY lt_country FROM ls_country TRANSPORTING age
                  WHERE land = 'IT'.
```

Avant le `MODIFY`, un [CLEAR](../14_Clear/01_Clear_itab.md) est effectué sur le champ `land`, montrant ainsi que le système va privilégier la clause `WHERE` plutôt que la recherche de la [CLE PRIMAIRE](../../07_TABLE_INTERNE/06_PRIMARY_KEY.md) de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md).

``lt_country`` avant le MODIFY

| **LAND** | **AGE** |
| -------- | ------- |
| FR       | 28      |
| IT       | 75      |

``lt_country`` après le MODIFY

| **LAND** | **AGE** |
| -------- | ------- |
| FR       | 28      |
| IT       | 10      |

    Cette clause WHERE est très utile pour sélectionner un type de champ nécessaire et sera beaucoup plus détaillée dans le chapitre sur les requêtes SQL (SELECT - WHERE).
