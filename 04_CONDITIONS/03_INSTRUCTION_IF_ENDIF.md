# IF ... ENDIF

```abap
IF log_exp1.
  [statement_block1]
[ELSEIF log_exp2.
  [statement_block2]]
...
[ELSE.
  [statement_blockn]]
ENDIF.
```

## IF

L’instruction `IF` est une condition permettant de contrôler et de comparer une [VARIABLE](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) selon une valeur ou une autre [VARIABLE](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md), et d’exécuter un traitement si la condition est vraie.

Exemple

```abap
DATA: lv_a TYPE I,
      lv_b TYPE I,
      lv_c TYPE I.

lv_b = 3.
lv_c = 2.

lv_a = lv_b + lv_c.

IF lv_a = 5.
  WRITE:/ 'Condition confirmée, lv_a = 5'.
ENDIF.
```

Trois [VARIABLES](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) ont été créées, `lv_a`, `lv_b` et `lv_c` de type entier. `lv_b` prend la valeur `3`, `lv_c` la valeur `2` quant à `lv_a`, elle est la somme de `lv_b` et `lv_c`. Vient ensuite une condition, comparant la variable `lv_a` avec la valeur `5`. Si cette condition est valide, le texte `Condition confirmée, lv_a = 5` sera affiché.

L’[OPERATEUR DE COMPARAISON](./01_OPERATEURS_DE_COMPARAISON.md) de cette condition est le signe égal (`=`) mais d’autres existent également sur SAP.

## ELSEIF

La condition `IF` peut intégrer une variante avec le `ELSEIF` pouvant par exemple tester les différentes valeurs de la [VARIABLE](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) `lv_month` contenant le mois de la date système [SY-DATUM](../00_HELP/02_SY_SYSTEM.md), et afficher un texte adéquat :

```abap
DATA lv_month TYPE I.

lv_month = SY-DATUM+4(2).

IF lv_month = 1.
  WRITE:/'C''est le mois de janvier'.
ELSEIF lv_month = 2.
  WRITE:/'C''est le mois de février'.
ELSEIF lv_month = 3.
  WRITE:/'C''est le mois de mars'.
ELSEIF lv_month = 4.
  WRITE:/'C''est le mois d''avril'.
ELSEIF lv_month = 5.
  WRITE:/'C''est le mois de mai'.
ELSE.
  WRITE:/'Autre mois de l''année'.
ENDIF.
```

## AND OR

Plusieurs conditions peuvent également être testées en même temps grâce au `AND` et `OR`.

Test sur le mois et le jour pour afficher un texte correspondant :

```abap
DATA: lv_month TYPE i,
      lv_day   TYPE i.

lv_month = SY-DATUM+4(2).
lv_day   = SY-DATUM+6(2).

IF lv_month = 12 OR lv_month = 1 OR lv_month = 2.
  WRITE:/'C''est l''hiver'.
ELSEIF lv_month = 3 OR lv_month = 4 OR lv_month = 5.
  WRITE:/'C''est le printemps'.
ELSEIF lv_month = 6 OR lv_month = 7 OR lv_month = 8.
  WRITE:/'C''est l''été'.
ELSEIF lv_month = 9 OR lv_month = 10 OR lv_month = 11.
  WRITE:/'C''est l''automne'.
ENDIF.

IF lv_month = 1 AND lv_day = 1.
  WRITE:/'Bonne année'.
ElSEIF lv_month = 12 AND lv_day = 25.
  WRITE:/'Joyeux Noël'.
ELSEIF lv_month = 5 AND lv_day = 1.
  WRITE:/'Bonne fête du travail'.
ELSE.
  WRITE:/'Bonne journée'.
ENDIF.
```

Deux [VARIABLES](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) `lv_month` et `lv_day` sont créées prenant en compte le mois et le jour de la date système [SY-DATUM](../00_HELP/02_SY_SYSTEM.md). Un premier groupe de conditions va d’abord tester le mois en cours :

- Si le mois est égal à `12`, ou `1` ou `2`, afficher le texte `C’est l’hiver`.

- Sinon s’il s’agit des mois `3`, ou `4` ou `5`, afficher `C’est le printemps`

- Pour `6`, ou `7` ou `8`, afficher `C’est l’été`.

- Et enfin pour les mois `9`, ou `10` ou `11`, afficher le message `C’est l’automne`.

Un deuxième groupe de conditions va tester le mois de l’année et le jour :

- Si le mois est égal à `1` et que le jour est égal à `1` également, afficher `Bonne année`.

- Si le mois de l’année est égal à `12` et le jour à `25`, afficher `Joyeux Noël`.

- Enfin pour le mois `5` et le jour `1`, afficher `Bonne fête du travail`.

- Sinon le programme affichera le texte `Bonne journée`.

## DUMP

Il a été vu que l’exécution d’un programme pouvait s’arrêter brutalement et retourner un [DUMP](../06_DUMP/01_DUMP.md) dû à une division par zéro par exemple.

Exemple d’un code retournant un [DUMP](../06_DUMP/01_DUMP.md) lors de l’exécution :

```abap
DATA: lv_a      TYPE I,
      lv_b      TYPE I,
      lv_result TYPE I.

lv_a = 5.
lv_b = 0.

lv_result = lv_a / lv_b.
WRITE lv_result.
```

Trois [VARIABLES](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) de type entier ont été créées : `lv_a`, `lv_b` et `lv_result`. La  [VARIABLE](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) `lv_a` va contenir la valeur `5` alors que `lv_b` sera égale à `0`. La division `lv_a` par `lv_b` sera ensuite exécutée et stockée dans la [VARIABLE](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) `lv_result`, qui sera par la suite affichée.

Pour éviter que le programme s’arrête brutalement en [DUMP](../06_DUMP/01_DUMP.md), il suffira de tester la valeur de `lv_b` et de s’assurer qu’elle soit strictement supérieure à `0`. Un `ELSE` sera également ajouté afin d’afficher un message d’erreur si la condition n’est pas respectée.

```abap
DATA: lv_a      TYPE I,
      lv_b      TYPE I,
      lv_result TYPE I.

lv_a = 5.
lv_b = 0.

IF lv_b 0.
  lv_result = lv_a / lv_b.
  WRITE V_RElv_resultSULT.
ELSE.
  WRITE 'La valeur de lv_b est égale à 0, opération impossible'.
ENDIF.
```