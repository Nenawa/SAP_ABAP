# CONTAINS STRING

```abap
IF oper1 CS oper2.
  ...
ENDIF.
```

`CS` signifie en anglais `Contains String` et recherchera dans la chaîne de caractères `oper1`, celle de `oper2`.

Exemple

```abap
DATA: lc_oper1 TYPE CHAR11 VALUE 'Hello World',
      lc_oper2 TYPE CHAR5  VALUE 'World'.

IF lc_oper1 CS lc_oper2.
  WRITE:/ 'lc_oper1 contient la chaîne de caractères ', lc_oper2.
ELSE.
  WRITE:/ 'lc_oper1 ne contient pas la chaîne de caractères ', lc_oper2.
ENDIF.
```

Ici, la [CONSTANTE](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/02_CONSTANTES.md) `lc_oper1` contient la chaîne de caractères `Hello World` et `lc_oper2`, `World`. La condition vérifiera que `lc_oper1` contient la chaîne de caractères contenue dans `lc_oper2` et en retournera le message correspondant.

Il est possible et plus facile d’utiliser la commande [FIND](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/11_INSTRUCTION_FIND.md) vue précédemment, au lieu de la condition ``CS``.
