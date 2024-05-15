#EXERCICE 2

## CONSIGNES

```abap
INSTRUCTION

RG 0 : Déclarer une variable de type d.

RG 1 : Alimenter la variable avec SY-DATUM.

RG 2 : Modifier la valeur de la variable en retirant 14 au nombre de jour.

RG 3 : Créer une boucle avec 'DO'.

  Ajouter + 1 à la variable de date

RG 4 : Utiliser le check pour verifier la condition (variable type d >= SY-DATUM).

  Si c'est le cas : afficher "Wesh on CHECK ABAP !".

RG 5 : Si variable type d = SY-DATUM

   Ajouter + 1 à la variable de date
   Utiliser continue

 RG 6 : SI variable type d > SY-DATUM
  Afficher "C'est l'EXIT"
  Puis utiliser l'instruction EXIT.
```

## CORRECTION

```abap
DATA: lv_date TYPE d.

lv_date = sy-datum - 14.

DO.

  lv_date = lv_date + 1.
  CHECK lv_date >= sy-datum.

  WRITE:/ 'Wesh on CHECK ABAP !'.

  IF lv_date = sy-datum.
    lv_date = lv_date + 1.
    CONTINUE.
  ENDIF.

  IF lv_date > sy-datum.
    WRITE:/ 'C''est l''EXIT'.
    EXIT.
  ENDIF.

ENDDO.
```