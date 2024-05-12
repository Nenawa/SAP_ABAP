# SELECT SINGLE

Cette option permet de sélectionner une seule ligne de la [TABLE](../../09_Tables_DB/01_Tables.md) déclarée dans le `FROM`. Bien entendu, le stockage défini dans le `INTO` ne peut être une [TABLE](../../09_Tables_DB/01_Tables.md) et sera nécessairement une [STRUCTURE](../../09_Tables_DB/11_Structures.md) ou une `liste de variables`.

Exemple

```abap
DATA s_driver_car TYPE zdriver_car.

SELECT SINGLE *
    FROM zdriver_car
    INTO ls_driver_car.
```

## * (ALL)

L’option `*` signifie `tous les champs` et donc cette requête indique : sélectionner tous les champs du premier enregistrement de la [TABLE](../../09_Tables_DB/01_Tables.md) `zdriver_car` et stocker dans la [STRUCTURE](../../09_Tables_DB/11_Structures.md) `ls_driver_car`.
