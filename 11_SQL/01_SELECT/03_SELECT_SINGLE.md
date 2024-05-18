# SELECT SINGLE

Cette option permet de sélectionner une seule ligne de la [TABLE](../../10_DB_TABLES/02_TABLES.md) déclarée dans le `FROM`. Bien entendu, le stockage défini dans le `INTO` ne peut être une [TABLE](../../10_DB_TABLES/02_TABLES.md) et sera nécessairement une structure (de ligne) ou une `liste de variables`.

Exemple

```abap
DATA s_driver_car TYPE zdriver_car.

SELECT SINGLE *
    FROM zdriver_car
    INTO ls_driver_car.
```

## * (ALL)

L’option `*` signifie `tous les champs` et donc cette requête indique : sélectionner tous les champs du premier enregistrement de la [TABLE](../../10_DB_TABLES/02_TABLES.md) `zdriver_car` et stocker dans une structure (de ligne) `ls_driver_car`.
