# CLE PRIMAIRE

```abap
... WITH [UNIQUE|NON-UNIQUE] KEY ...
```

Deux types de `clé primaires` peuvent être déclarées :

- `Unique`
- `Non unique`

et comme leur nom l'indique, elles autorisent ou non les doublons de données de même clé.

Exemple :

```abap
TYPES: BEGIN OF ty_citizen,
         country TYPE CHAR3,
         name    TYPE CHAR20,
         age     TYPE NUMC2,
       END OF ty_citizen.

DATA: lt_citizen TYPE HASHED TABLE OF ty_citizen
                 WITH UNIQUE KEY country.
```

La référence `TY_CITIZEN` est créée contenant trois champs :

- `COUNTRY` de type `CHAR3`
- `NAME` de type `CHAR20`
- `AGE` de type `NUMC2`

La [TABLE INTERNE](./01_Tables_Internes.md) `lt_citizen` est ensuite déclarée de type `HASHED` ayant une `UNIQUE KEY` définie par le champ `country`. 

Ainsi, losque les données seront renseignées, il sera impossible d'[INSERT](../08_INSTRUCTIONS_ITAB/01_Insert/01_Insert_into_itab.md) deux lignes avec la même valeur pour le champ `country` (code retour [SY-SUBRC](../00_HELP/02_SY_SYSTEM.md) égal à 4 et la [TABLE INTERNE](./01_Tables_Internes.md) n'est pas mise à jour avec le deuxième enregistrement), alors que le type `NON-UNIQUE` laisse le cas se produire.

Cependant, chaque type de [TABLE INTERNE](./01_Tables_Internes.md) a sa règle concernant la `clé primaire` :

- [STANDARD](./02_Type_Standard.md) : `clé primaire facultative` et uniquement de type `NON-UNIQUE`
- [HASHED](./04_Type_Hashed.md) : `clé primaire obligatoire` et uniquement de type `UNIQUE`
- [SORTED](./03_Type_Sorted.md) : `clé primaire obligatoire` et peut être de type `UNIQUE` ou `NON-UNIQUE`
