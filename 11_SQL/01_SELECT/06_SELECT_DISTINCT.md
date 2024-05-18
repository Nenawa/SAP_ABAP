# DISTINCT

Avec la fonctionnalité `DISTINCT`, la sélection va supprimer tous les `doublons`.

Exemple

Sélectionner toutes les marques et les modèes des voitures enregistrés dans la table des conducteurs :

```abap
TYPES: BEGIN OF ty_driver_car,
         car_brand TYPE wrf_brand_descr,
         car_model TYPE vlc_maktx,
       END OF ty_driver_car.

DATA: lt_driver_car TYPE TABLE OF ty_driver_car,
      ls_driver_car TYPE ty_driver_car.

SELECT DISTINCT car_brand, car_model
    FROM zdriver_car
    INTO TABLE @lt_driver_car.

LOOP AT lt_driver_car INTO ls_driver_car.
  WRITE:/ ls_driver_car-car_brand, ls_driver_car-car_model.
ENDLOOP.
```

Grâce au `DISTINICT`, la sélection va importer les champs `CAR_BRAND` et `CAR_MODEL` de la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZDRIVER_CAR` sans aucun doublon, obtenant ainsi une liste clare des véhicules disponibles pour le coivoiturage. Le résultat de cette requête sera stocké dans la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `LT_DRIVER_CAR` définie par le type `TY_DRIVER_CAR`, contenant les deux champs de la sélection. Une boucle `LOOP` permettra d'afficher le résultat à l'écran.
