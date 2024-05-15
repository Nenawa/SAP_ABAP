#EXERCICE 3

## CONSIGNES

```abap
INSTRUCTION

RG 0 : Utiliser la boucle 'WHILE' avec comme condition :

sy-index <= 5

RG 1 : Afficher le résultat avec un WRITE
```

## CORRECTION

```abap
  WHILE sy-index <= 5.
    WRITE:/ sy-index.
  ENDWHILE.
```