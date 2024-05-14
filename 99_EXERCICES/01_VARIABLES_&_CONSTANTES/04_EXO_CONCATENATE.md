# EXERCICE 3

## CONSIGNES

```abap
INSTRUCTIONS :

RG 1 : A partir des constantes et varibles déclarées ci-dessous :

  CONSTANTS: lc_c1  TYPE string VALUE 'COUCOU',
             lc_c2  TYPE string VALUE 'le chien',
             lc_c3  TYPE string VALUE 'banane',
             lc_c4  TYPE string VALUE 'maison',
             lc_c5  TYPE string VALUE 'épluchures',
             lc_c6  TYPE string VALUE 'pédiluves',
             lc_c7  TYPE string VALUE 'frédou',
             lc_c8  TYPE string VALUE 'coccinelle',
             lc_c9  TYPE string VALUE 'tartiflette',
             lc_c10 TYPE string VALUE 'manger',
             lc_c11 TYPE string VALUE 'euphoriser',
             lc_c12 TYPE string VALUE 'éclater',
             lc_c13 TYPE string VALUE 'chercher'.

avec l'aide de l'instruction 'CONCATENATE', former une phrase (au possible) et stocker
le résultat dans la variable lv_resultat.

RG 2 : Afficher le résultat à l'exécution du programme avec l'instruction 'WRITE'.
```

## CORRECTION

```abap
  CONSTANTS: lc_c1  TYPE string VALUE 'COUCOU',
             lc_c2  TYPE string VALUE 'le chien',
             lc_c3  TYPE string VALUE 'banane',
             lc_c4  TYPE string VALUE 'maison',
             lc_c5  TYPE string VALUE 'épluchures',
             lc_c6  TYPE string VALUE 'pédiluves',
             lc_c7  TYPE string VALUE 'frédou',
             lc_c8  TYPE string VALUE 'coccinelle',
             lc_c9  TYPE string VALUE 'tartiflette',
             lc_c10 TYPE string VALUE 'manger',
             lc_c11 TYPE string VALUE 'euphoriser',
             lc_c12 TYPE string VALUE 'éclater',
             lc_c13 TYPE string VALUE 'chercher'.

  CONCATENATE lc_c1 ' , ' lc_c2 ' dans la ' lc_c4 ' ' lc_c13 ' à ' lc_c10 ' les ' lc_c5 ' de ' lc_c9 ' mais la ' lc_c8 ' de ' lc_c7 ' a ' lc_c12 ' le ' lc_c6
  INTO lv_resultat
  RESPECTING BLANKS.
```