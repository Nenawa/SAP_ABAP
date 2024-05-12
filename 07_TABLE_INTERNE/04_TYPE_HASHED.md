# TYPE HASHED TABLE

`TYPE HASHED TABLE` est une table organisée par une clé de la table (instruction `WITH UNIQUE KEY` obligatoire) mais ne contient pas [INDEX](../11_SQL/06_INDEX/01_Index.md).

```abap
TYPES: BEGIN OF ty_tab,
         obj1 TYPE typ1,
         obj2 TYPE typ2,
         obj3 TYPE typ3,
         . . .
       END OF ty_tab.

DATA: lt_tab_types TYPE HASHED TABLE OF ty_tab
                   WITH UNIQUE KEY obj1.
```

Attention, la déclaration des tables de type `HASHED` et [SORTED](./03_Type_Sorted.md) est erronée et incomplète car il est nécessaire d’inclure la notion de [CLE PRIMAIRE](./06_Primary_Key.md) !
