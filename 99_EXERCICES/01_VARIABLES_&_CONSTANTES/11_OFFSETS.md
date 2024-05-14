# EXERCICE 11

## CONSIGNES

```abap
INSTRUCTIONS

RG 1 : A partir d'une constante contenant votre prénom, utiliser les 'OFFSETS' pour récupérer dans deux variables le début et la fin de votre prénom.

RG 2 : Utiliser ensuite l'instruction 'CONCATENATION' pour recréer votre prénom à l'envers.
```

## EXEMPLE D'UTILISATION SPECIFIQUE AVEC SY-DATUM (PAR DEFAUT AAAAMMJJ)

```abap
DATA: lv_datum TYPE d,
      lv_year(4) TYPE c,
      lv_month(2) TYPE c,
      lv_day(2) TYPE c.

lv_datum = sy-datum.

lv_year = SY-DATUM(4).
lv_month = SY-DATUM+4(2).
lv_day = SY-DATUM+6(2).

WRITE:/ 'datum :', lv_datum.

WRITE:/ lv_year,
      / lv_month,
      / lv_day.

*Valeur du SY-DATUM en DEBUG est différente que la valeur affichée finale
```

## CORRECTION

```abap
CONSTANTS: lc_firstname TYPE string VALUE 'Frederic'.

DATA: lv_first TYPE string,
      lv_last TYPE string,
      lv_concate TYPE string.

lv_first = lc_firstname(4).
lv_last = lc_firstname+4(4).

CONCATENATE lv_last lv_first
  INTO lv_concate.

WRITE:/ lv_concate.
```