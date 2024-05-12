# CLEAR

```abap
CLEAR dobj.
```

Instruction commune à tous les types de [VARIABLES](./01_Variables.md) (chaîne de caractères, numérique...) qui permet tout simplement de supprimer leur contenu.

Cet exemple permet de faire un `CLEAR` sur des [VARIABLES](./01_Variables.md) de différents types et de les afficher. Il permet de voir également les valeurs par défaut de chaque type.

```abap
DATA: lv_result(50) TYPE C,
      lv_int(5)     TYPE I,
      lv_date       TYPE D,
      lv_hour       TYPE T.

lv_result = 'Hello World'.
lv_int    = 5.
lv_date   = SY-DATUM.
lv_hour   = SY-UZEIT.

WRITE:/ 'Avant le Clear'.
WRITE:/ 'Résultat  : ', lv_result.
WRITE:/ 'Entier    : ', lv_int.
WRITE:/ 'Date      : ', lv_date.
WRITE:/ 'Heure     : ', lv_hour.

CLEAR: lv_result,
       lv_int,
       lv_date,
       lv_hour.

WRITE:/.
WRITE:/ 'Après le Clear'.
WRITE:/ 'Résultat  : ', lv_result.
WRITE:/ 'Entier    : ', lv_int.
WRITE:/ 'Date      : ', lv_date.
WRITE:/ 'Heure     : ', lv_hour.
```