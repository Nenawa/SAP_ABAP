# EXERCICE 3

## CONSIGNES

```abap
INSTRUCTIONS

RG 1 : A partir des constantes et varibles déclarées ci-dessous :

CONSTANTS: lc_constant1 TYPE i VALUE 7,
           lc_constant2 TYPE i VALUE 79.

DATA: lv_result1 TYPE i,
      lv_result2 TYPE i,
      lv_result3 TYPE i,
      lv_result4 TYPE i.

Effectuer les opérations suivantes et stocker chacun des résultats dans les variables lv_result*

lv_result1 = lc_constant1 + lc_constant2
lv_result2 = lc_constant1 - lc_constant2
lv_result3 = lc_constant1 x lc_constant2
lv_result4 = lc_constant1 : lc_constant2

RG 2 : faire afficher chaque résultat (lv_result*) avec l'instruction 'WRITE'.
```

## CORRECTION

```abap
CONSTANTS: lc_constant1 TYPE i VALUE 7,
           lc_constant2 TYPE i VALUE 79.

DATA: lv_result1 TYPE i,
      lv_result2 TYPE i,
      lv_result3 TYPE i,
      lv_result4 TYPE i.

*ADDITION
lv_result1 = lc_constant1 + lc_constant2.

lv_result1 = lc_constant1.
ADD lc_constant2 TO lv_result1.

*SOUSTRACTION
lv_result2 = lc_constant1 - lc_constant2.

lv_result2 = lc_constant1.
SUBTRACT lc_constant2 FROM lv_result2.

*MULTIPLICATION
lv_result3 = lc_constant1 * lc_constant2.

lv_result3 = lc_constant1.
MULTIPLY lv_result3 BY lc_constant2.

*DIVISION
lv_result4 = lc_constant1 / lc_constant2.

lv_result4 = lc_constant1.
DIVIDE lv_result4 BY lc_constant2.

*AFFICHAGE RESULTATS
WRITE: / lv_result1,
       / lv_result2,
       / lv_result3,
       / lv_result4.
```