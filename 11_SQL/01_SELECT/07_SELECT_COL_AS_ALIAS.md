# COL AS ALIAS

Cette option permet de renommer des colonnes pour un titre un peu plus significaif.

Exemple

Reprendre l'exemple précédent du `DISTINCT` en donnant un alias aux colonnes.

```abap
TYPES: BEGIN OF ty_driver_car,
         marque TYPE wrf_brand_descr,
         model  TYPE vlc_maktx,
       END OF ty_driver_car.

DATA: lt_driver_car TYPE TABLE OF ty_driver_car,
      ls_driver_car TYPE ty_driver_car.

SELECT DISTINCT car_brand AS marque,
                car_model AS model
    FROM zdriver_car
    INTO TABLE @lt_driver_car.

LOOP AT lt_driver_car INTO ls_driver_car.
  WRITE:/ ls_driver_car-marque, ls_driver_car-model.
ENDLOOP.
```

Le résultat sera le même que celui de l'exemple du `DISTINCT`.
