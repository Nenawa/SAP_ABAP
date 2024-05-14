# EXERCICE 9

## CONSIGNES

```abap
INSTRUCTIONS :

RG 1 : avec la string suivante :

'si ma tata tâte ta tata, ta tata est tâtée par ma tata'

Utiliser l'instruction 'TRANSLATE' pour passer la string en majuscule puis afficher le résultat.

RG 2 : Même chose mais en minuscule.

RG 3 : avec la string suivante :

'Ok'

Utilser l'instruction 'TRANSLATE' avec le paramètre 'USING' pour obtenir 'Up' en tant que résultat (à afficher).
```

## CORRECTION

```abap
DATA: lv_to_translate TYPE string VALUE 'si ma tata tâte ta tata, ta tata est tâtée par ma tata'.

*RG 1
TRANSLATE lv_to_translate TO UPPER CASE.
WRITE:/ lv_to_translate.

*RG 2
TRANSLATE lv_to_translate TO LOWER CASE.
WRITE:/ lv_to_translate.

*RG 3
DATA lv_to_translate2 TYPE string VALUE 'Ok'.

TRANSLATE lv_to_translate2 USING 'OUkp'.
WRITE:/ lv_to_translate2.
```