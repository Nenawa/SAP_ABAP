# VARIABLES

Une variable est un symbole informatique associant un nom à une valeur qui peut varier durant l’exécution du programme. Cette définition s’applique également à une [constante](./02_CONSTANTES.md), à la différence près que sa valeur est fixée dès le début et ne changera jamais au cours de l’exécution du programme.

## DATA ...

En ABAP, les variables sont déclarées à l'aide du mot-clé ``DATA``. 

### DECLARATION SIMPLE :

```abap
DATA lv_variable TYPE string.
```

Dans cet exemple, ``lv_variable`` est le nom de la variable et string est son type de données. ``TYPE`` est un mot-clé utilisé pour spécifier le type de données de la variable. string est un type de données standard qui peut contenir des chaînes de caractères.

### DECLARATIONS SUCCESSIVES :

Il est courant de déclarer plusieurs variables dans une seule instruction ``DATA``. Voici comment cela se fait :

```abap
DATA: lv_variable1 TYPE string,
      lv_variable2 TYPE i,
      lv_variable3 TYPE c LENGTH 10.
```

Dans cet exemple, nous déclarons trois variables : ``lv_variable1`` de type chaîne de caractères (string), ``lv_variable2`` de type entier (i), et ``lv_variable3`` de type caractère (c) avec une longueur de 10 caractères.

## ... NOM ...

En général, il est recommandé de suivre certaines conventions de nommage pour les variables en ABAP. Bien que ces conventions puissent varier d'une entreprise ou d'un client à l'autre, voici quelques pratiques courantes :

- ``Utiliser des noms de variables descriptifs`` : Choisir des noms de variables qui décrivent clairement leur but ou leur contenu. Éviter les noms abrégés ou cryptiques qui pourraient rendre le code difficile à comprendre pour les autres développeurs.
- ``Utiliser le préfixe lv_ pour les variables locales`` : Le préfixe ``lv_`` (pour "local variable") est souvent utilisé pour indiquer que la variable est locale à une certaine portée (Scope), comme une méthode ou une fonction.
- ``Utiliser le préfixe gv_ pour les variables globales`` : De manière similaire, le préfixe ``gv_`` (pour "global variable") peut être utilisé pour indiquer que la variable est globale et peut être accessible depuis plusieurs parties du programme.
- ``Éviter les noms de variables réservés`` : Éviter d'utiliser des noms de variables qui sont des mots-clés réservés en ABAP, tels que DATA, TYPE, IF, etc.
- ``Déclarer toutes les variables en début de programme`` : afin de facilité la lecture et la recherche tout en évitant des oublis lors de review ou d'analyse, il est préférable de déclarer toutes les variables (si possible) en début de programme ou d'intervention.

## ... TYPE OU LIKE ...

En ABAP, les déclarations de variables peuvent se faire de deux manières différentes : en spécifiant un type de données avec ``TYPE`` ou en référençant une autre variable avec ``LIKE``. Voici la différence entre les deux :

### TYPE :

```abap
DATA lv_variable TYPE string.
```

Dans cet exemple, ``lv_variable`` est déclarée comme une variable de ``TYPE`` chaîne de caractères (string).

### LIKE :

Lorsqu'une variable est déclarée avec ``LIKE``, elle fait référence à une autre variable déjà existante pour spécifier son type de données. Par exemple :

```abap
DATA lv_variable LIKE lv_another_variable.
```

Dans cet exemple, ``lv_variable`` est déclarée avec le même type de données que ``lv_another_variable``. Cela signifie que ``lv_variable`` aura le même type de données et la même longueur que ``lv_another_variable``.

## DATATYPES C (Char)

```abap
DATA: lv_firstname   TYPE char255,
      lv_lastname(9) TYPE c.

* lv_firstname = 'John'.
* lv_lastname  = 'Wick'.
```

## DATATYPE I (INTEGER) / DATATYPE N (NUMERIC) / DATATYPE NUMC

Si le type entier `I`, le type numérique `N` et le type numérique `NUMC` sont comparés, il apparaît qu’ils sont sensiblement les mêmes. Ils possèdente toutefois des différences notables :

- ``Type entier I`` : Le type ``I`` est une chaîne numérique de nombres entiers.
- ``Type numérique N`` : Le type ``N`` est aussi une chaîne numérique mais stockée sous forme de texte de caractères, ce qui est pratique lors d’un travail avec des instructions sur des variables texte comme le [concatenate](./08_INSTRUCTION_CONCATENATE.md). Le type de données N représente un nombre entier sans signe.
- ``Type numérique NUMC`` : Le type de données ``NUMC``, quant à lui, représente un champ de caractères numériques. Il est utilisé pour stocker des chaînes de caractères contenant uniquement des chiffres. Ce type est généralement utilisé pour stocker des numéros de compte, des codes postaux ou d'autres données similaires.

```abap
DATA: lv_integer        TYPE I,
      lv_year           TYPE N,
      lv_numeric_string TYPE NUMC2.

* lv_integer = 10.
```

## DATATYPE D ET SY-DATUM (AAAAMMJJ)

Le format ``D`` et [sy-datum](../../00_HELP/02_SY_SYSTEM.md) sont de type AnnéeMoisJour (AAAAMMJJ), pour un affichage plus adéquat, il faudra peut-être modifier la variable date.

```abap
DATA: lv_date TYPE D.

* lv_date = sy-datum.
* lv_date = 19861102.
```

## DATATYPE T ET SY-UZEIT (HHMMSS)

Le format ``T`` et [sy-uzeit](../../00_HELP/02_SY_SYSTEM.md) sont de type HeuresMinutesSecondes (HHMMSS), pour un affichage plus adéquat, il faudra peut-être modifier la variable date.

```abap
DATA: lv_time TYPE T.

* lv_time = sy-uzeit.
* lv_time = 183045.
```

## DATATYPE F / DATATYPE FLOAT

En ABAP, le type de données ``F`` et le type de données ``FLOAT`` sont utilisés pour représenter des valeurs numériques à virgule flottante. Voici les différences entre les deux :

### TYPE DE DONNEES F

Le type de données ``F`` est un type de données décimal à virgule flottante. Il peut être utilisé pour stocker des valeurs numériques avec une précision fixe. Lorsque vous déclarez une variable de type ``F``, vous devez spécifier la précision et l'échelle de la variable.

Exemple de déclaration d'une variable de type ``F`` :

```abap
DATA: lv_decimal TYPE F LENGTH 10 DECIMALS 2.
```

Dans cet exemple, ``lv_decimal`` est une variable de type ``F`` avec une longueur totale de 10 chiffres et 2 chiffres après la virgule.

### TYPE DE DONNEES FLOAT

Le type de données ``FLOAT`` est utilisé pour stocker des valeurs numériques à virgule flottante avec une précision variable. Contrairement au type ``F``, vous n'avez pas besoin de spécifier la précision et l'échelle lors de la déclaration d'une variable de type ``FLOAT``. La précision dépend du contexte d'utilisation et peut varier selon les besoins.

Exemple de déclaration d'une variable de type ``FLOAT`` :

```abap
DATA: lv_float TYPE FLOAT.
```

Dans cet exemple, ``lv_float`` est une variable de type ``FLOAT`` sans spécification de précision ou d'échelle.

## DATATYPE DECFLOAT

Le type ``DECFLOAT`` en ABAP est un type de données numérique qui peut stocker des nombres décimaux avec une précision étendue. Contrairement aux types de données numériques traditionnels tels que ``FLOAT``, ``I``, ou ``NUMC``, qui ont une précision limitée, le type ``DECFLOAT`` offre une précision plus élevée pour la représentation des nombres décimaux.

Le type DECFLOAT peut être utilisé pour stocker des valeurs numériques avec une précision allant jusqu'à 34 chiffres significatifs. Cela le rend particulièrement adapté pour les calculs financiers ou d'autres situations où une précision élevée est requise.

```abap
DATA: lv_decimal TYPE DECFLOAT34.

* lv_decimal = '12345.67890123456789012345678901234'
```

## DATATYPE P DECIMALS

```abap
DATA: lv_decimal TYPE P DECIMALS 2.

* lv_decimal = '1234.56'.
```

## DATATYPE STRING

```abap
DATA: lv_string TYPE string.

* lv_string = 'Hello World'.
```

## DATATYPE BOOLEAN / ABAP_BOOL

```abap
DATA: lv_bool    TYPE boolean,
      lv_boolean TYPE abap_bool.

* lv_bool    = abap_true.
* lv_boolean = abap_false.
```

Si une variable de type ``boolean`` est initialisée sans valeur explicite, sa valeur par défaut dépend du contexte dans lequel elle est utilisée :

- Dans certains contextes, la valeur par défaut peut être ``abap_false``. Cela signifie que si tu déclares une variable ``boolean`` sans l'initialiser explicitement, elle sera par défaut ``abap_false``.
- Cependant, dans d'autres contextes, la valeur par défaut peut être ``abap_true``. Par exemple, lorsque tu déclares des variables ``boolean`` dans des structures de données, celles-ci peuvent être initialisées à ``abap_true`` par défaut.

Pour éviter toute ambiguïté, il est toujours recommandé d'initialiser explicitement les variables ``boolean`` avec la valeur souhaitée dès leur déclaration. Par exemple :

```abap
DATA lv_flag TYPE boolean VALUE abap_true.
```

## DATATYPE XFELD

Le type de données ``xfeld`` est utilisé pour principalement représenter des cases à cocher dans les interfaces utilisateur SAP. Il est également connu sous le nom de "X-Selection Field".

La valeur par défaut d'une variable de type ``xfeld`` dépend également du contexte dans lequel elle est utilisée. En général, si une variable de type ``xfeld`` est initialisée sans valeur explicite, sa valeur par défaut est SPACE ou vide, ce qui signifie que la case à cocher est décochée.

Cependant, comme pour les variables de type ``boolean``, il est préférable d'initialiser explicitement les variables ``xfeld`` avec la valeur souhaitée dès leur déclaration pour éviter toute ambiguïté. Par exemple :

```abap
DATA: lv_xfeld TYPE xfeld VALUE 'X'.

* lv_xfeld = 'X'.
* lv_xfeld = ' '.
```