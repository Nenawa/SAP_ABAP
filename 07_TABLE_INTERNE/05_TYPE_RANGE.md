# TYPE RANGE OF

`TYPE RANGE OF` est une table interne un peu particuluier car elle a déjà une structure définie dont les zones sont les suivantes :

- `SIGN` de type `C` (alphanumérique) et de longueur d’une seule position, accepte les valeurs I (Inclure) ou E (Exclure).

- `OPTION` de type `C` (alphanumérique) et de longueur deux positions, contient les valeurs définies dans le chapitre [OPERATEURS DE COMPARAISON](../04_CONDITIONS/01_OPERATEURS_DE_COMPARAISON.md).

- `LOW` qui est l'intervalle inférieur dont le type et la longueur de champ varient selon la référence attribuée.

- `HIGH` qui est l'intervalle supérieur dont le type et la longueur de champ varient selon la référence attribuée.

Cette structure est utilisée comme table interne d’intervalles de données, utilisée dans les requêtes SQL. Aussi les champs d’un écran de sélection sont définis de la même manière ([SELECT-OPTIONS](../12_SELECTION_SCREEN/03_INSTRUCTION_SELECT-OPTIONS.md)).

Exemple

_Création d’une table interne de type RANGE, pouvant contenir un intervalle de données de numéros de produits (éléments de données MATNR)._

```abap
DATA: r_matnr TYPE RANGE OF matnr.
```
