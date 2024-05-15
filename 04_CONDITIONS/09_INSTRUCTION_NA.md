# NOT ANY

```abap
IF oper1 NA oper2.
  ...
ENDIF.
```

`NA` signifie en anglais `contains Not Any` et au contraire de [CA](./08_INSTRUCTION_CA.md), vérifie que `oper1` ne contient aucun caractère contenu dans `oper2`.

Exemple

```abap
CONSTANTS: lc_oper1 TYPE CHAR5 VALUE 'Hello',
      lc_oper2 TYPE CHAR4 VALUE 'abcd'.

IF lc_oper1 NA lc_oper2.
  WRITE:/ 'lc_oper1 ne contient aucun caractère contenu dans ', lc_oper2.
ELSE.
  WRITE:/ 'lc_oper1 contient au moins un caractère contenu dans le texte ', lc_oper2.
ENDIF.
```

L’exemple précédent est repris en modifiant la valeur de la constante `lc_oper2` pour `abcd`. Dans ce cas, avec l’opérateur `NA`, le programme vérifie qu’aucun caractère n’est contenu dans la constante `lc_oper2` et retourne le message correspondant.