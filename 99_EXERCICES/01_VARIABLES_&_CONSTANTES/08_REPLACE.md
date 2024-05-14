# EXERCICE 8

## CONSIGNES

```abap
INSTRUCTIONS :

RG 1 : A partir de la string suivante :

'si ton tonton tond ton tonton, ton tonton sera tondu',

Utiliser l'instruction 'REPLACE' pour remplacer le pattern 'ton' par le pattern 'ta'.

RG 2 : Même chose avec la string :

'si ma tata tâte ta tata, ta tata est tâtée par ma tata'

et les patterns 'ta' et 'ton'.

RG 3 : Afficher le résultat de chaque traitement.
```

## CORRECTION

```abap
*RG 1
  CONSTANTS: lc_patten_ton TYPE string VALUE 'ton',
             lc_pattern_ta TYPE string VALUE 'ta'.

  DATA: lv_replace TYPE string VALUE 'si ton tonton tond ton tonton, ton tonton sera tondu'.

  REPLACE ALL OCCURRENCES OF lc_patten_ton
    IN lv_replace
    WITH lc_pattern_ta.

  WRITE:/ lv_replace.

RG 2
  DATA: lv_replace2 TYPE string VALUE 'si ma tata tâte ta tata, ta tata est tâtée par ma tata'.

  CONSTANTS: lc_pattern_ta TYPE string VALUE 'ta',
             lc_pattern_ton TYPE string VALUE 'ton'.

  REPLACE ALL OCCURRENCES OF lc_pattern_ta
    IN lv_replace2
    WITH lc_pattern_ton.

  WRITE:/ lv_replace2.
```