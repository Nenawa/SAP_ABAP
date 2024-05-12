# CONDENSE

```abap
CONDENSE text [NO-GAPS].
```

Cette instruction est très souvent utilisée avec le `CONCATENATE` car elle sépare chaque chaîne de caractères par un `SPACE`, en supprimant tous ceux en trop.

Paramètre(s) supplémentaire(s) optionnel(s) :

- `NO-GAPS` qui supprime absolument tous les espaces et va donc regrouper tous les mots de la chaîne de caractères.

L’exemple suivant permet d’éclaircir le rôle du `CONDENSE`.

```abap
CONSTANTS: lc_text1(20) TYPE C VALUE 'Hello    ',
           lc_text2(20) TYPE C VALUE '    World    ',
           lc_text3(20) TYPE C VALUE '    Bienvenue    ',
           lc_text4(20) TYPE C VALUE '    sur    ',
           lc_text5(20) TYPE C VALUE '    SAP    '.

DATA: lv_result(50) TYPE C .

CONCATENATE lc_text1 lc_text2 lc_text3 lc_text4 lc_text5
  INTO lv_result.

WRITE:/ 'Sans CONDENSE :         ', lv_result.

CONDENSE lv_result.
WRITE:/ 'Avec CONDENSE :         ', lv_result.

CONDENSE lv_result NO-GAPS.
WRITE:/ 'Avec CONDENSE NO GAPS : ', lv_result.
```

Les cinq [variables](./01_Variables.md) du programme précédent sont reprises sauf que pour l’exercice, des espaces ont été rajoutés. Dans un premier temps, l’instruction [CONCATENATE](./08_INSTRUCTION_CONCATENATE.md) va être utilisée, stockée dans la [variable](./01_Variables.md) `lv_result` et affichée. Ensuite, un `CONDENSE` seul sera effectué sur `lv_result` puis affiché et enfin un `CONDENSE ... NO-GAPS` sera utilisé pour modifier et afficher la [variable](./01_Variables.md).

Le [CONCATENATE](./08_INSTRUCTION_CONCATENATE.md) va grouper les [variables](./01_Variables.md) `C_TXT*` en laissant des espaces, puis le `CONDENSE` va supprimer tous ceux qui sont en trop en gardant juste celui de séparation, et enfin le `NO-GAPS` va tous les supprimer.
