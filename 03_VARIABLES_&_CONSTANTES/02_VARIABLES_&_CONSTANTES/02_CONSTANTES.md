# CONSTANTES

Une constante est un symbole informatique associant un nom à une valeur qui peut varier durant l’exécution du programme. Cette définition s’applique également à une [VARIABLE](./01_VARIABLES.md), à la différence près que sa valeur n'est pas fixée dès le début et peut changer au cours de l’exécution du programme.

## CONSTANTS: ...

L’instruction commencera par `CONSTANTS` et devra comporter obligatoirement une valeur fixe avec `VALUE`.

```abap
CONSTANTS: lc_valeur_constante TYPE i VALUE 10.
```
Attention : L'utilisation des deux-points ``:`` est nécessaire pour indiquer la déclaration d'une constante. Sans les deux-points, l'interpréteur ABAP ne reconnaîtra pas correctement la déclaration comme une constante.

## ... NOM ...

En général, il est recommandé de suivre certaines conventions de nommage pour les constante en ABAP. Bien que ces conventions puissent varier d'une entreprise ou d'un client à l'autre, voici quelques pratiques courantes :

- Utiliser des noms de constantes descriptifs : Choisir des noms de constantes qui décrivent clairement leur but ou leur contenu. Éviter les noms abrégés ou cryptiques qui pourraient rendre le code difficile à comprendre pour les autres développeurs.
- Utiliser le préfixe ``lc_`` pour les constantes locales : Le préfixe ``lc_`` (pour "local constant") est souvent utilisé pour indiquer que la constante est locale à une certaine portée (Scope), comme une méthode ou une fonction.
- Utiliser le préfixe ``gc_`` pour les constantes globales : De manière similaire, le préfixe ``gc_`` (pour "global constant") peut être utilisé pour indiquer que la constante est globale et peut être accessible depuis plusieurs parties du programme.
- Éviter les noms de constantes réservés : Éviter d'utiliser des noms de constantes qui sont des mots-clés réservés en ABAP, tels que CONST, TYPE, IF, etc.
- Déclarer toutes les constantes en début de programme : afin de facilité la lecture et la recherche tout en évitant des oublis lors de review ou d'analyse, il est préférable de déclarer toutes les constantes (si possible) en début de programme ou d'intervention.

## ... TYPE OU LIKE ...

En ABAP, les déclarations de constantes peuvent se faire de deux manières différentes : en spécifiant un type de données avec ``TYPE`` ou en référençant une autre variable avec ``LIKE``. Voici la différence entre les deux :

### TYPE :

```abap
CONSTANTS: lc_valeur_constante TYPE i VALUE 10.
```

Dans cet exemple, ``lc_valeur_constante`` est déclarée comme une constante de type integer et a pour valeur 10.

### LIKE :

Lorsqu'une constante est déclarée avec ``LIKE``, elle fais référence à une autre variable déjà existante pour spécifier son type de données. Par exemple :

```abap
DATA: lv_variable TYPE i VALUE 5.

CONSTANTS: lc_autre_constante LIKE lv_variable VALUE 20.
```

Dans cet exemple, la constante c_autre_constante prend le même type que la variable lv_variable, qui est un type entier (i), et est définie avec une valeur de 20.

## DATATYPE I (INTEGER) / DATATYPE N (NUMERIC) / DATATYPE NUMC

```abap
CONSTANTS: lc_integer        TYPE I VALUE 10,
           lc_max_value      TYPE I VALUE '9999',
           lc_account_number TYPE NUMC10 VALUE '1234567890'.
```

## DATATYPE F / DATATYPE FLOAT

```abap
CONSTANTS: lc_fixed_value TYPE F VALUE '1234.56',
           lc_float_value TYPE FLOAT VALUE '1234.567890123456789012345678901234567890123456789'.
```

## DATATYPE DECFLOAT

```abap
CONSTANTS: lc_decimal TYPE DECFLOAT34 VALUE '12345.67890123456789012345678901234'.
```

## DATATYPE STRING

```abap
CONSTANTS: lc_string TYPE STRING VALUE 'Hello, World!'.
```

## DATATYPE C

```abap
CONSTANTS: lc_char TYPE C LENGTH 1 VALUE 'F'.
```

## DATATYPE BOOLEAN / ABAP_BOOL

```abap
CONSTANTS: lc_bool TYPE BOOLEAN VALUE ABAP_TRUE,
           lc_boolean TYPE ABAP_BOOL VALUE ABAP_FALSE.
```

## DATATYPE D ET SY-DATUM (AAAAMMJJ)

```abap
CONSTANTS: lc_date1 TYPE D VALUE SY-DATUM.
CONSTANTS: lc_date2 TYPE D VALUE 1986110.
```

## DATATYPE T ET SY-UZEIT (HHMMSS)

```abap
CONSTANTS: lc_time1 TYPE T VALUE SY-UZEIT,
           lc_time2 TYPE T VALUE 183045.
```

## DATATYPE P DECIMALS

Il est à noter qu’en ABAP, le point (.) est utilisé pour les décimales.

Le type P doit être accompagné par l’instruction DECIMALS qui va définir le nombre de chiffres après la virgule, sinon la variable associée sera considérée comme un nombre entier.

```abap
CONSTANTS: C_PI TYPE P DECIMALS 2 VALUE '3.14'.
```

## DATATYPE XFELD

```abap
CONSTANTS: lc_xfeld TYPE xfeld VALUE 'X'.
```