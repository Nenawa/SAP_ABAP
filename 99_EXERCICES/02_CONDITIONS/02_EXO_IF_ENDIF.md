# EXERCICE 2

## CONSIGNES

```abap
INSTRUCTIONS

RG 1 : Déclaré une constante avec comme valeur votre age mental (selon vous) !

RG 2 : Avec l'aide de l'instruction 'IF' 'ENDIF',  lorsqu'il y a correspondance dans les cas suivant :

RG 2A - Si votre age mental est inférieur à 12 : utiliser l'instruction 'WRITE' pour écrire 'Je pourrai bientôt faire mes lassets tout seul'
RG 2B - Si votre age mental est inférieur ou egal à 18 : écriver 'Jusqu'ici tout va bien'
RG 2C - Si votre age mental est compris entre 15 et 25 : 'le plus dur c'est pas la chute'
RG 2D - Si votre age mental est différent de 35 ou 42 ou 52 : 'same player shoot again'.
```

## CORRECTION

```abap
*RG 2A
CONSTANTS: lc_age_dave TYPE I VALUE 17.

IF lc_age_dave < 12.
  WRITE:/ 'Je pourrai bientôt faire mes lA cES tout seul'.
ENDIF.

*RG 2B
CONSTANTS: lc_age_maureen TYPE I VALUE 10.

IF lc_age_maureen <= 18.
  WRITE:/ 'Jusqu''ici tout va bien'.
ENDIF.

*RG 2C
CONSTANTS: lc_age_benoit TYPE I VALUE 18.

IF lc_age_benoit BETWEEN 15 AND 25.
  WRITE:/ 'le plus dur c''est pas la chute'.
ENDIF.

* Autre réponse possible pour la RG 2C

IF lc_age_maureen >= 15 AND lc_age_maureen <= 25.
  WRITE:/ 'le plus dur c''est pas la chute'.
ENDIF.

*RG 2D
CONSTANTS: lc_age_laurene TYPE I VALUE 42.

IF lc_age_laurene <> 35 OR lc_age_laurene <> 42 OR lc_age_laurene <> 52.
  WRITE:/ 'same player shoot again'.
ENDIF.
```