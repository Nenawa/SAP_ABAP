# CONTAINS ANY

```abap
IF oper1 CA oper2.
  ...
ENDIF.
```

`CA` signifie en anglais ` Contains Any` et vérifie que la chaîne de caractères `oper1` contient un quelconque caractère de `oper2`.

Exemple

```abap
DATA: lc_oper1 TYPE CHAR5 VALUE 'Hello',
      lc_oper2 TYPE CHAR3 VALUE 'llo'.

IF lc_oper1 CA lc_oper2.
  WRITE:/ 'lc_oper1 contient au moins un caractère contenu dans ', lc_oper2, ' à la position ', SY-FDPOS.
ELSE.
  WRITE:/ 'lc_oper1 ne contient aucun caractère contenu dans ', lc_oper2.
ENDIF.
```

L’exemple précédent est repris en modifiant la valeur de la [CONSTANTE](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/02_CONSTANTES.md) `lc_oper2` pour `’llo’`. Dans ce cas, la condition va vérifier qu’au moins un caractère de la chaîne de `lc_oper1` soit contenu dans `lc_oper2` puis en retournera sa première position dans [SY-FDPOS](../00_HELP/02_SY_SYSTEM.md), ici égale à 2.