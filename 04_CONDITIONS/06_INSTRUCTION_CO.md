# CONTAINS ONLY

```abap
IF oper1 CO oper2.
  ...
ENDIF.
```

`CO` signifie en anglais `Contains Only` et vérifie que la chaîne de caractères `oper1` contient seulement celle contenue dans `oper2`.

Exemple

```abap
DATA: lc_oper1 TYPE CHAR5 VALUE 'Hello',
      lc_oper2 TYPE CHAR5 VALUE 'Hello'.
>
IF lc_oper1 CO lc_oper2.
  WRITE:/ 'lc_oper1 contient la chaîne de caractères ', lc_oper2, ' à la position ', SY-FDPOS.
ELSE.
  WRITE:/ 'lc_oper1 ne contient pas la chaîne de caractères ', lc_oper2.
ENDIF.
```

Deux [CONSTANTES](../02_VARIABLES_&_CONSTANTES/02_CONSTANTES.md) `lc_oper1` et `lc_oper2` ont été créées contenant la valeur `Hello`. Une condition va ensuite vérifier que `lc_oper1` contient seulement la chaîne de caractères contenue dans `lc_oper2`. Dans ce cas, un message sera retourné indiquant la position du dernier caractère de `lc_oper2` trouvée dans `lc_oper1`, à savoir `5`, et stocké dans la variable système [SY-FDPOS](../00_HELP/02_SY_SYSTEM.md). Si la chaîne de caractères de `lc_oper2` est légèrement différente (égale à `Hell` par exemple) alors la condition n’est pas remplie et le programme retournera le message contenu dans le `ELSE`.
