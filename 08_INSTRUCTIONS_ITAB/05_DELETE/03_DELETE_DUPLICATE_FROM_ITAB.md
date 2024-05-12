# DELETE ADJACENT DUPLICATES

```abap
DELETE ADJACENT DUPLICATES FROM itab
                           [COMPARING {comp1 comp2 ...}].
```

L'instruction `DELETE ADJACENT DUPLICATES` va repérer toutes les lignes en doublon, et les supprimer. 

Si aucun champ n'est défini par le paramètre `COMPARING`, elle va utiliser la [CLE PRIMAIRE](../..//07_TABLE_INTERNE/06_PRIMARY_KEY.md) définie lors de la déclaration de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md).

Exemple

Supprimer tous les doublons d'une [CLE PRIMAIRE](../..//07_TABLE_INTERNE/06_PRIMARY_KEY.md) de type [SORTED](../../07_TABLE_INTERNE/03_TYPE_SORTED.md) ayant pour clé primaire le champ `country`.

```abap
TYPES: BEGIN OF ty_citizen,
         country TYPE char3,
         name    TYPE char20,
         age     TYPE numc2,
       END OF ty_citizen.

DATA: lt_citizen TYPE SORTED TABLE OF ty_citizen WITH NON-UNIQUE KEY country,
      ls_citizen TYPE ty_citizen.

ls_citizen-country = 'FR'.
ls_citizen-name    = 'Thierry'.
ls_citizen-age     = '24'.
INSERT ls_citizen INTO TABLE lt_citizen.

ls_citizen-country = 'ES'.
ls_citizen-name    = 'Luis'.
ls_citizen-age     = '32'.
INSERT ls_citizen INTO TABLE lt_citizen.

ls_citizen-country = 'BR'.
ls_citizen-name    = 'Renata'.
ls_citizen-age     = '27'.
INSERT ls_citizen INTO TABLE lt_citizen.

ls_citizen-country = 'FR'.
ls_citizen-name    = 'Floriane'.
ls_citizen-age     = '32'.
INSERT ls_citizen INTO TABLE lt_citizen.

DELETE ADJACENT DUPLICATES FROM lt_citizen.
```

``lt_citizen`` avant DELETE

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| BR          | Renata   | 27      |
| ES          | Luis     | 32      |
| FR          | Floriane | 32      |
| FR          | Thierry  | 24      |

``lt_citizen`` après DELETE

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| BR          | Renata   | 27      |
| ES          | Luis     | 32      |
| FR          | Floriane | 32      |

    Pour que le DELETE ADJACENT DUPLICATES fonctionne, il est impératif que la table soit ordonnée selon une clé primaire ou une liste de champs spécifiés.

Même exemple que précédemment, mais avec une table interne de type [STANDARD](../../07_TABLE_INTERNE/02_TYPE_STANDARD.md)._

```abap
TYPES: BEGIN OF ty_citizen,
         country TYPE char3,
         name    TYPE char20,
         age     TYPE numc2,
       END OF ty_citizen.

DATA: lt_citizen TYPE TABLE OF ty_citizen,
      ls_citizen TYPE ty_citizen.

ls_citizen-country = 'FR'.
ls_citizen-name    = 'Thierry'.
ls_citizen-age     = '24'.
APPEND ls_citizen TO lt_citizen.

ls_citizen-country = 'ES'.
ls_citizen-name    = 'Luis'.
ls_citizen-age     = '32'.
APPEND ls_citizen TO lt_citizen.

ls_citizen-country = 'BR'.
ls_citizen-name    = 'Renata'.
ls_citizen-age     = '27'.
APPEND ls_citizen TO lt_citizen.

ls_citizen-country = 'FR'.
ls_citizen-name    = 'Floriane'.
ls_citizen-age     = '32'.
APPEND ls_citizen TO lt_citizen.

SORT lt_citizen BY country.
DELETE ADJACENT DUPLICATES FROM lt_citizen COMPARING country.
```

Lors de l'exemple avec une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) de type [SORTED](../../07_TABLE_INTERNE/03_TYPE_SORTED.md), le tri se faisait automatiquement via l'instruction [INSERT](../01_Insert/01_Insert_into_itab.md) respecatant la [CLE PRIMAIRE](../../07_TABLE_INTERNE/06_PRIMARY_KEY.md). 

Pour une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) de type [STANDARD](../../07_TABLE_INTERNE/02_TYPE_STANDARD.md), le tri doit s'effectuer avec l'instruction [SORT](../06_Sort/01_Sort_itab.md) et le `DELETE ADJACENT DUPLICATES` doit suivre exactement les mêmes nombre et séquence que le [SORT](../06_Sort/01_Sort_itab.md).

``lt_citizen`` avant DELETE après le SORT

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| BR          | Renata   | 27      |
| ES          | Luis     | 32      |
| FR          | Floriane | 32      |
| FR          | Thierry  | 24      |

``lt_citizen`` après DELETE

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| BR          | Renata   | 27      |
| ES          | Luis     | 32      |
| FR          | Floriane | 32      |
