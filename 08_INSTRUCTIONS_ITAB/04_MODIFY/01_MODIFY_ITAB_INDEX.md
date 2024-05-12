# MODIDFY WITH INDEX

    Pour l’instruction MODIFY, il existe trois formes de syntaxe possibles.

```abap
MODIFY itab [INDEX idx] FROM ls
            [TRANSPORTING comp1 comp2 ...].
```

L’instruction `MODIFY` va modifier la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `itab` à partir de la [STRUCTURE](../../07_TABLE_INTERNE/08_STRUCTURES.md) `ls`. Il est possible d’indiquer l’[INDEX](../../11_SQL/06_INDEX/01_Index.md) de la ligne à modifier (`INDEX idx`) ainsi que la liste des champs à modifier (`TRANSPORTING comp1 comp2`...).

Exemple

Reprendre l’exemple du [COLLECT](../03_Collect/01_Collect_into_itab.md) et initialiser le champ `AGE` à `10` pour la ligne 2.

```abap
TYPES: BEGIN OF ty_country,
         land   TYPE char3,
         age(3) TYPE i,
       END OF ty_country.

DATA: lt_country TYPE STANDARD TABLE OF ty_country WITH NON-UNIQUE KEY land,
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
MODIFY lt_country INDEX 1 FROM ls_country TRANSPORTING age.
```

Avant le `MODIFY`, la structure `ls_country` est initialisée avec les valeurs souhaitées. Ensuite, le programme va modifier la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lt_country` à l’`index 1`, à partir de la structure `ls_country`, afin de modifier uniquement le champ `AGE`.

`lt_country` avant le MODIFY

| **LAND** | **AGE** |
| -------- | ------- |
| FR       | 28      |
| IT       | 75      |

`lt_country` après le MODIFY

| **LAND** | **AGE** |
| -------- | ------- |
| FR       | 10      |
| IT       | 75      |

    Pour cet exemple, le type de table a été modifié de HASHED à STANDARD, car celui-ci n’ayant pas d’index, l’option utilisée dans le MODIFY générerait un dump.

![](../../ressources/11_04_01_01.png)
