# COVERS PATTERN

```abap
IF oper1 CP oper2.
  ...
ENDIF.
```

`CP` signifie en anglais `Covers Pattern` et vérifiera que la chaîne de caractères `oper1` respecte un modèle contenu dans `oper2`.

Exemple

```abap
CONSTANTS: lc_oper1 TYPE CHAR9 VALUE 'image.png',
      lc_oper2 TYPE CHAR5 VALUE '*.png'.

IF lc_oper1 CP lc_oper2.
  WRITE:/ 'Le fichier lu est au format PNG'.
ELSE.
  WRITE:/ 'Le fichier lu n''est pas au format PNG'.
ENDIF.
```

La constante `lc_oper1` contient la chaîne de caractères `image.png` et en utilisant la condition `CP`, le programme va vérifier que celle-ci est composée du modèle contenu dans `lc_oper2` à savoir `*.png`.