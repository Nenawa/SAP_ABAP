# TABLES INTERNES

Une table interne est un objet dans un programme permettant de stocker des données le temps de l’exécution dudit programme.

Elle se déclare de la façon suivante :

```abap
TYPES: BEGIN OF ty_tab,
         obj1 TYPE typ1,
         obj2 TYPE typ2,
         obj3 TYPE typ3,
         . . .
      END OF ty_tab.

DATA: lt_tab_types TYPE TABLE OF ty_tab.
```

Un `type de structure` est tout d’abord créé, c’est une sorte de squelette qui sera utilisé comme une référence par la table interne `lt_tab_types` avec l’instruction `TYPE TABLE OF`, et la `structure ls_tab_types` avec `TYPE`.

La déclaration du `type de structure` commence par l’instruction `TYPES:` puis `BEGIN OF` indiquant qu’un type de structure va être créé. Les champs qui la composent sont ensuite listés et référencés. Cette référence à une spécificité technique, peut se faire de plusieurs manières.

Il n'y a pas vraiment de grandes différences aussi bien techniques que pour l’optimisation du programme.

## REFERENCE DIRECT A UN TYPE DE CHAMP ET UNE LONGUEUR LONGUEUR

```abap
. . .
  obj1(5) TYPE c,
  obj2(4) TYPE n,
. . .
```

```abap
. . .
  obj1 TYPE char5,
  Obj2 TYPE numc4,
. . .
```

## REFERENCE DIRECT A UN ELEMENT DE DONNEES

```abap
. . .
  obj1 TYPE matnr,
  Obj2 TYPE mtart,
. . .
```

## REFERENCE INDIRECT A UN ELEMENT DE DONNEES VIA LA TABLE-CHAMP

```abap
. . .
  obj1 TYPE mara-matnr,
  Obj2 TYPE mara-mtart,
. . .
```

## REFERENCE INDIRECT AVEC LIKE

```abap
. . .
  obj1 LIKE char5,
  Obj2 LIKE numc4,
. . .
```

```abap
. . .
  obj1 LIKE mara-matnr,
  Obj2 LIKE mara-mtart,
. . .
```

## DECLARATION DE VARIABLE

Pour faire une petite parenthèse, une [VARIABLE](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) et une [CONSTANTE](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/02_CONSTANTES.md) peuvent se déclarer exactement de la même façon. Ainsi, les [VARIABLE](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) peuvent se déclarer de cette manière :

```abap
DATA: lv_name TYPE CHAR20,
      lv_date TYPE DATUM,
      lv_hour TYPE UZEIT.
```

ou...

```abap
DATA: lv_name TYPE mara-ernam,
      lv_date TYPE sy-datum,
      lv_hour TYPE sy-uzeit.
```

etc...

Le problème avec cette déclaration est que la `table interne` ne possède pas d’en-tête. Un en-tête stocke temporairement une ligne de la `table interne` lorsque celle-ci est lue ligne par ligne dans une boucle. Cependant, la notion d’`en-tête` est aujourd’hui obsolète sur SAP et il faudra toujours stocker ces informations temporaires dans un objet de résultat.

À noter, dans les anciennes versions de SAP, il est possible de trouver les déclarations suivantes (obsolètes aujourd’hui dans les nouvelles versions) :

```abap
DATA: BEGIN OF ty_tab OCCURS 0,
        obj1 TYPE typ1,
        obj2 TYPE typ2,
        obj3 TYPE typ3,
        . . .
      END OF ty_tab.
```

```abap
TYPES: BEGIN OF ty_tab,
         obj1 TYPE typ1,
         obj2 TYPE typ2,
         obj3 TYPE typ3,
         . . .
       END OF ty_tab.

DATA: it_tab_types TYPE TABLE OF ty_tab WITH HEADER LINE.
```

Ces `tables internes` possèdent dès leur déclaration une ligne d’`en-tête`, il est donc inutile de créer une structure associée car lors de la lecture de la `table` ou durant une `boucle`, le programme utilisera cet `en-tête` pour stocker et manier les données.
