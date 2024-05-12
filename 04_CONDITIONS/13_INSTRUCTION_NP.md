# NO PATTERN

```abap
IF oper1 NP oper2.
  ...
ENDIF.
```

`NP` signifie en anglais `No Pattern` et au contraire de `CP`, vérifiera que la chaîne de caractères `oper1` ne respecte pas le modèle contenu dans `oper2`.

_Exemple_

```abap
DATA: lc_oper1 TYPE CHAR9 VALUE 'texte.txt',
      lc_oper2 TYPE CHAR5 VALUE '*.png'.

IF lc_oper1 NP lc_oper2.
  WRITE:/ 'Le fichier lu n''est pas au format PNG'.
ELSE.
  WRITE:/ 'Le fichier lu est au format PNG'.
ENDIF.
```

La constante `lc_oper1` contient la chaîne de caractères `texte.txt` et en utilisant la condition `NP`, le programme va vérifier que celle-ci n’est pas composée du modèle contenu dans `lc_oper2` à savoir `*.png`.