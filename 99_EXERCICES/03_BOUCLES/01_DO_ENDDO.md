#EXERCICE 1

## CONSIGNES

```abap
INSTRUCTION

RG 0 : D&claré une variable type integer avec comme valeur 0.

RG 1 : Avec l'instruction 'DO' et 'ENDDO'. Boucler 10 fois.

RG 2 : Avec la variable system 'SY-INDEX', effectuer le traitement suivant tant que sy-index est inférieur
à 7 :

Ajouter + 1 à la valeur de la variable déclaré en RG 0.
```

```abap
INSTRUCTION

RG 0 : Déclaré une variable type entier vide ainsi qu'une variable de type c vide également.

RG 1 : Déclaré une variable avec comme valeur 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.

RG 2 : Avec l'instruction 'DO' et 'ENDDO', effectuer le traitement suivant pour un nombre de fois
égale à 26 :

  - ajouter + 1 à la valeur de la variable type entier

  - Avec la valeur de la variable de type entier, récupérer dans la variable type c le ou les premiers caractères de la string 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.

  - Afficher le(s) caractères récupérer avec l'aide de WRITE
```

## CORRECTION

```abap
DATA: lv_result TYPE i.

DO 10 TIMES.
  IF SY-INDEX < 7.
    lv_result = lv_result + 1.
  ENDIF.
ENDDO.
```

```abap
DATA: lv_integer TYPE i,
      lv_c(26) TYPE c.

CONSTANTS: lc_string TYPE string VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.

DO 26 TIMES.
  lv_integer = lv_integer + 1.
  lv_c = lc_string(lv_integer).
  WRITE:/ lv_c.
ENDDO.
```