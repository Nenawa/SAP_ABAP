# CONTAINS NOT ONLY

```abap
IF oper1 CN oper2.
  ...
ENDIF.
```

`CN` signifie en anglais `Contains Not only` et au contraire de [CO](./06_INSTRUCTION_CO.md), vérifie que la chaîne de caractères `oper1` n’est pas uniquement composée de celle contenue dans `oper2`.

Exemple

```abap
DATA: lc_oper1 TYPE CHAR5 VALUE 'Hello',
      lc_oper2 TYPE CHAR5 VALUE 'Hell'.

IF lc_oper1 CN lc_oper2.
  WRITE:/ 'lc_oper1 contient la chaîne de caractères ', lc_oper2, 'à la position ', SY-FDPOS.
ELSE.
  WRITE:/ 'lc_oper1 ne contient pas la chaîne de caractères ', lc_oper2.
ENDIF.
```

L’exemple précédent est repris en modifiant la valeur de la constante `lc_oper2` pour `Hell`. Dans ce cas, avec l’opérateur `CN`, le programme trouve la chaîne de caractères recherchée et renvoie sa position dans [SY-FDPOS](../00_HELP/02_SY_SYSTEM.md) de la même manière que pour le [CO](./06_INSTRUCTION_CO.md), à savoir la dernière position trouvée dans la constante `lc_oper1`, ici égale à `4`.