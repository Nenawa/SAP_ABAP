# DELETE MULTIPLE LINES

```abap
DELETE itab [FROM idx1] [TO idx2]
            [WHERE log_exp].
```

Dans ce cas, l'instruction `DELETE` possède deux options ; suppression de plusieurs lignes à partir d'un index de ligne (`FROM idx1`) et/ou jusqu'a un index de ligne (`TO idx2`) ; mais peut aussi contenir une clause `WHERE` pour affiner la suppression.

Exemple

Suppression des lignes 2 et 3 de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lt_citizen` où le champ ` country` est égal à `BR`.

```abap
TYPES: BEGIN OF ty_citizen,
         country TYPE char3,
         name    TYPE char20,
         age     TYPE numc2,
       END OF ty_citizen.

DATA: lt_citizen TYPE TABLE OF ty_citizen WITH NON-UNIQUE KEY country,
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

DELETE lt_citizen FROM 2 TO 3 WHERE country = 'BR'.
```

``lt_citizen`` avant DELETE

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| FR          | Thierry  | 24      |
| ES          | Luis     | 32      |
| BR          | Renata   | 27      |
| FR          | Floriane | 32      |

``lt_citizen`` après DELETE

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| FR          | Thierry  | 24      |
| ES          | Luis     | 32      |
| FR          | Floriane | 32      |

    Il est important de filtrer le DELETE par un INDEX ou un WHERE. Un DELETE itab seul retrounera un dump.
