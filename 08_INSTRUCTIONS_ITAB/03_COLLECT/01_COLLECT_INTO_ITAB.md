# COLLECT

```abap
COLLECT ls INTO itab.
```

Avec l’instruction `COLLECT`, le système vérifiera si la [PRIMARY KEY](../../07_TABLE_INTERNE/06_PRIMARY_KEY.md) contenue dans la structure `ls` existe dans la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md). Si elle n’existe pas, une `nouvelle ligne est insérée`, sinon les `valeurs numériques sont additionnées`.

Exemple

Exécuter un `COLLECT`

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
```

Un type de [STRUCTURE](../../07_TABLE_INTERNE/08_STRUCTURES.md) est tout d’abord créé contenant deux champs :

- `land` utilisant l’élément de données `char3` (alphanumérique de trois positions)

- `AGE` de type `I` de trois positions également.

La [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lt_country` est ensuite déclarée de type [HASHED](../../07_TABLE_INTERNE/04_TYPE_HASHED.md) avec une [CLE PRIMAIRE](../../07_TABLE_INTERNE/06_PRIMARY_KEY.md) définie par le champ `land`. Puis pour chacun des pays `FR` et `IT`, une valeur va être attribuée avec un `COLLECT`. Au final, la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lt_country` aura les enregistrements ci-après.

| **LAND** | **AGE** |
| -------- | ------- |
| FR       | 28      |
| IT       | 75      |

    Pour une table interne composée uniquement de chaînes de caractères ou de numériques NUMC, le COLLECT s’avère inutile et il sera préférable d’utiliser un APPEND ou un INSERT.
