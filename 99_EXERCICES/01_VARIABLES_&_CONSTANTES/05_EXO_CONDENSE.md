# EXERCICE 5

## CONSIGNES

```abap
*INSTRUCTIONS :
*
*RG 1 : utiliser l'instruction 'CONDENSE'
*pour condenser la string '         A400M - TLS -  Finale  '.
*
*RG 2 : Faire afficher le résultat
```

## CORRECTION

```abap
DATA: lv_condense TYPE string VALUE '         A400M - TLS -  Finale  '.
CONDENSE lv_condense.

WRITE:/ lv_condense.
```