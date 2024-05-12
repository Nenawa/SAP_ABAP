# MODIDFY WITH TABLE

    Pour l’instruction MODIFY, il existe trois formes de syntaxe possibles.

```abap
MODIFY TABLE itab FROM ls
            [TRANSPORTING comp1 comp2 ...].
```

Pour ce `MODIFY`, le système va rechercher dans la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `itab`, la clé égale à celle définie par la [STRUCTURE](../../07_TABLE_INTERNE/08_STRUCTURES.md) `ls` et va actualiser tous les champs ou tous ceux indiqués par le `TRANSPORTING`.

Exemple

Reprendre l’exemple du [COLLECT](../03_Collect/01_Collect_into_itab.md) et initialiser le champ `AGE` à `10` pour la clé `LAND` égale à `FR`.

```abap
TYPES: BEGIN OF ty_country,
         land   TYPE char3,
         age(3) TYPE i,
       END OF ty_country.

DATA: lt_country TYPE HASHED TABLE OF ty_country
                WITH UNIQUE KEY land,
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

ls_country-land = 'FR'.
ls_country-age  = 10.
MODIFY TABLE lt_country FROM ls_country TRANSPORTING age.
```

``lt_country`` avant le MODIFY

| **LAND** | **AGE** |
| -------- | ------- |
| FR       | 28      |
| IT       | 75      |

``lt_country`` après le MODIFY

| **LAND** | **AGE** |
| -------- | ------- |
| FR       | 10      |
| IT       | 75      |
