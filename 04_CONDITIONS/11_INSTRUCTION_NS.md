# NO STRING

```abap
IF oper1 NS oper2.
  ...
ENDIF.
```

`NS` signifie en anglais contains `No String` et vérifiera que la chaîne de caractères ``oper1`` ne soit pas contenue dans celle de ``oper2``.

Exemple

```abap
CONSTANTS: lc_oper1 TYPE CHAR11 VALUE 'Hello World',
      lc_oper2 TYPE CHAR3  VALUE 'SAP'.

IF lc_oper1 NS lc_oper2.
  WRITE:/ 'lc_oper1 ne contient pas la chaîne de caractères ', lc_oper2.
ELSE.
  WRITE:/ 'lc_oper1 contient la chaîne de caractères ', lc_oper2.
ENDIF.
```

Ici, la constante `lc_oper1` contient la chaîne de caractères `Hello World` et `lc_oper2`, SAP. La condition vérifiera que `lc_oper1` ne contient pas la chaîne de caractères contenue dans `lc_oper2` et en retournera le message correspondant.