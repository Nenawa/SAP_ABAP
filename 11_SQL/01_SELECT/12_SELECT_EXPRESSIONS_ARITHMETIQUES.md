# EXPRESSIONS ARITHMETIQUES

Il est possible d'inclure dans la sélection, les opérations arithmétiques entre les champs.

Exemple

Dépense totale pour chaque trajet (péage + essence) :

```abap
TYPES: BEGIN OF ty_cost,
         city_from  TYPE s_from_cit,
         city_to    TYPE s_to_city,
         total_traj TYPE p DECIMALS 2,
       END OF ty_cost.

DATA: lt_cost TYPE TABLE OF ty_cost,
      ls_cost TYPE ty_cost.

SELECT city_from,
       city_to,
       ( toll + gasol ) AS total_traj
  FROM ztravel
  INTO TABLE @lt_cost.

LOOP AT lt_cost INTO ls_cost.
  WRITE:/ ls_cost-city_from, ls_cost-city_to, ls_cost-total_traj.
ENDLOOP.
```

La [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lt_cost` aura le résultat suivant :

| **CITY_FROM** | **CITY_TO** | **TOTAL_TRAJ** |
| ------------- | ----------- | -------------- |
| PERPIGNAN     | BARCELONE   | 51.40          |
| BARCELONE     | PERPIGNAN   | 57.98          |
| TOULOUSE      | PERPIGNAN   | 56.21          |
| BARCELONE     | LERIDA      | 56.50          |

