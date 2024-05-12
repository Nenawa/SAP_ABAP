# APPEND TO ITAB

```abap
APPEND { ls | {INITIAL LINE} | {LINES OF jtab [FROM idx1] [TO idx2]} }
       TO itab.
```

L’instruction `APPEND` possède les mêmes options que l’instruction [INSERT](../01_Insert/01_Insert_into_itab.md) à part pour le paramètre de destination, qui sera toujours une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) avec `TO itab`.

Exemple

L’exemple précédent peut être complété par les lignes suivantes :

```abap
. . .
ls_citizen-country = 'ES'.
ls_citizen-name    = 'Luiza'.
ls_citizen-age     = '31'.
APPEND ls_citizen TO lt_citizen1.

ls_citizen-country = 'BR'.
ls_citizen-name    = 'Felipe'.
ls_citizen-age     = '25'.
APPEND ls_citizen TO lt_citizen1.
```

lt_citizen1 :

| **COUNTRY** | **NAME**  | **AGE** |
| :---------: | --------- | :-----: |
|     BR      | Renata    |   27    |
|     FR      | Florianne |   32    |
|             |           |         |
|     FR      | Thierry   |   24    |
|     ES      | Luiza     |   31    |
|     BR      | Felipe    |   25    |

L’instruction `APPEND` fonctionne pour les tables de type [STANDARD](../../07_TABLE_INTERNE/02_TYPE_STANDARD.mdd) et [RANGE](../../07_TABLE_INTERNE/05_TYPE_RANGE.md). Pour les [TABLES INTERNES](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) de type [HASHED](../../07_TABLE_INTERNE/04_TYPE_HASHED.md) et [SORTED](../../07_TABLE_INTERNE/03_TYPE_SORTED.md), il est obligatoire d’utiliser l’instruction [INSERT INTO TABLE](../01_Insert/01_Insert_into_itab.md).

    Petite parenthèse, il est possible d’utiliser l’instruction APPEND avec les types de tables internes SORTED mais comme l’APPEND insère toujours une ligne en fin de table, si l’enregistrement inséré modifie l’ordre défini par la clé primaire, alors le programme retournera un DUMP.

Exemple

Ajouter les pays `ES` puis `BR` à une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) de type [SORTED](../../07_TABLE_INTERNE/03_TYPE_SORTED.md) avec comme [CLE PRIMAIRE](../../07_TABLE_INTERNE/06_PRIMARY_KEY.md) le champ `LAND`.

```abap
TYPES: BEGIN OF ty_country,
         land TYPE char3,
       END OF ty_country.

DATA: lt_country TYPE SORTED TABLE OF ty_country WITH NON-UNIQUE KEY land,
      ls_country TYPE ty_country.

ls_country-land = 'ES'.
APPEND ls_country TO lt_country.

ls_country-land = 'BR'.
APPEND ls_country TO lt_country.
```

Selon la [CLE PRIMAIRE](../../07_TABLE_INTERNE/06_PRIMARY_KEY.md) de la table, la valeur `BR` doit être avant `ES`. Dans ce cas, l’exécution du programme retournera un [DUMP](../../06_DUMP/01_DUMP.md).

Exemple

Ajouter les pays `ES` puis `BR` à une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) de type [SORTED](../../07_TABLE_INTERNE/03_TYPE_SORTED.md) avec comme [CLE PRIMAIRE](../../07_TABLE_INTERNE/06_PRIMARY_KEY.md) le champ `LAND`.

```abap
TYPES: BEGIN OF ty_country,
         land TYPE char3,
       END OF ty_country.

DATA: lt_country TYPE SORTED TABLE OF ty_country WITH NON-UNIQUE KEY land,
      ls_country TYPE ty_country.

ls_country-land = 'BR'.
APPEND ls_country TO lt_country.

ls_country-land = 'ES'.
APPEND ls_country TO lt_country.
```

Cette fois-ci l’ordre de la [CLE PRIMAIRE](../../07_TABLE_INTERNE/06_PRIMARY_KEY.md) est respecté, pas de [DUMP](../../06_DUMP/01_DUMP.md) et le programme se termine correctement.
