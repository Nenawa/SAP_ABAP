# EXERCICE 10

## CONSIGNES

```abap
INSTRUCTIONS

RG 1 : Créer une variable qui stockera la valeur suivante :

'La vie est belle'

Puis afficher le résultat.

RG 2 : Utiliser l'instruction 'CLEAR' pour vider la valeur de la variable précédente et réafficher 
sa valeur avec l'instruction 'WRITE'.
```

## CORRECTION

```abap
DATA: lv_string TYPE string.

lv_string = 'La vie est belle'.

WRITE:/ lv_string.

CLEAR: lv_string

WRITE:/'lv_string', lv_string.
```