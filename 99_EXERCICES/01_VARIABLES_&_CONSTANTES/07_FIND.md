# EXERCICE 7

## CONSIGNES

```abap
INSTRUCTIONS :

RG 1 : A partir de la string suivante :

'si ton tonton tond ton tonton, ton tonton sera tondu',

Utiliser l'instruction 'FIND' avec le paramètre 'ALL OCCURRENCES' pour trouver le nombre d'occurrence
totale du pattern 'ton' dans la string précédente.

RG 2 : A partir de la string suivante :

'Un chasseur sachant chasser sait chasser sans son chien. Un chasseur sachant chasser sans son chien, ça se chasse aussi, sachez-le',

Utiliser l'instruction 'FIND' avec le paramètre 'FIRST OCCURRENCE' pour trouver le nombre d'occurrence
totale du pattern 'ch' dans la string précédente.

Utiliser l'instruction 'FIND' avec le paramètre 'ALL OCCURRENCES' pour trouver le nombre d'occurrence
totale du pattern 'ton' dans la string précédente. Trouver également la position de la dernière occurrence.

RG 3 : Faire afficher les résultats avec l'instruction 'WRITE'.
```

## CORRECTION

```abap
*RG 1

  CONSTANTS: lc_find       TYPE string VALUE 'si ton tonton tond ton tonton, ton tonton sera tondu',
             lc_patten_ton TYPE string VALUE 'ton'.

  DATA: lv_count_ton     TYPE string VALUE 'ton'.

  FIND ALL OCCURRENCES OF lc_patten_ton
    IN lc_find
    MATCH COUNT lv_count_ton.

  WRITE:/ lv_count_ton.

*RG 2
  CONSTANTS: lc_find2      TYPE string VALUE 'Un chasseur sachant chasser sait chasser sans son chien. Un chasseur sachant chasser sans son chien, ça se chasse aussi, sachez-le',
             lc_pattern_ch TYPE string VALUE 'ch',
             lc_pattern_sa TYPE string VALUE 'sa'.

  DATA: lv_result1 TYPE i,
        lv_result2 TYPE i,
        lv_offset  TYPE i.

  FIND FIRST OCCURRENCE OF lc_pattern_ch
    IN lc_find2
    MATCH COUNT lv_result1.

  FIND ALL OCCURRENCES OF lc_pattern_sa
    IN lc_find2
    MATCH COUNT lv_result2
    MATCH OFFSET lv_offset.

  WRITE:/ lv_result1,
        / lv_result2,
        / lv_offset.
```