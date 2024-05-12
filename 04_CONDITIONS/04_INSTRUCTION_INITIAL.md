# IS INITIAL

```abap
IF operand IS [NOT] INITIAL.
  [statement_block]
ENDIF.
```

```abap
CASE operand.
  [WHEN IS [NOT] INITIAL].
    [statement_block1]
  ...
  [WHEN OTHERS].
    [statement_blockn]
ENDCASE.
```

l'instruction ``IS INITIAL`` est utilisée pour vérifier si une variable a été initialisée ou non. Cette instruction retourne vrai (true) si la variable est initialisée et faux (false) si elle ne l'est pas.