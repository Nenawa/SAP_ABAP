# FOR UPDATE

Quand renseignée, l’option `FOR UPDATE` va `bloquer la ligne de la table dans la base de données`. Au final, elle indique que cette ligne sera modifiée par le programme et pour éviter le risque qu’elle soit actualisée en parallèle par un autre traitement, **SAP** va la bloquer le temps de l’exécution du programme.

Exemple

```abap
DATA ls_driver_car TYPE zdriver_car.

SELECT SINGLE FOR UPDATE *
    FROM zdriver_car
    INTO @ls_driver_car.
```

Sélection d'une ligne de la table `ZDRIVER_CAR` bloquée pour modification :

```abap
DATA: lv_surname TYPE zdriver_car-surname,
      lv_name    TYPE zdriver_car-name.

SELECT SINGLE FOR UPDATE surname, name
    FROM zdriver_car
    INTO (@lv_surname, @lv_name).
```

Même si seulement deux champs sont sélectionnés, la ligne entière de la [TABLE](../../09_Tables_DB/01_Tables.md) `ZDRIVER_CAR` sera `bloquée pour modification`.

Pour sécuriser les données, le `FOR UPDATE` fonctionne uniquement si une condition est définie avec la clause `WHERE` afin que la ligne bloquée ne soit pas définie arbitrairement. Dans le cas des exemples ci-dessus, la sélection ne se fera pas (la [STRUCTURE](../../09_Tables_DB/11_Structures.md) et les deux [VARIABLES](../../04_Variables/01_Variables.md) resteront vides) et un `code retour 8` sera retourné dans la variable système [SY-SUBRC](../../help/02_SY-SYSTEM.md).
