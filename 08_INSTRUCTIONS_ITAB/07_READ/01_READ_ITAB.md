# READ TABLE

```abap
READ TABLE itab
  { FROM ls | WITH KEY { comp1 = obj1 comp2 = obj2 ... } [BINARY SEARCH] | INDEX idx }
  { INTO ls | ASSIGNING <lfs_> | TRANSPORTING NO FIELDS }.
```

Le `READ TABLE` permet de lire une ligne de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `itab`. 

Cette opération s'effectue :

- soit en définissant une [STRUCTURE](../../07_TABLE_INTERNE/08_STRUCTURES.md) source contenant les valeurs des champs à lire (`FROM ls`)

- soit en définissant directement des valeurs pour des composants (`WITH KEY comp1 = obj1...`), 

- soit en lisant directement une ligne via son [INDEX](../../11_SQL/06_INDEX/01_Index.md) (`INDEX idx`).

De plus, le résultat peut :

- être stocké dans une [STRUCTURE](../../07_TABLE_INTERNE/08_STRUCTURES.md) (`INTO ls`)

- être stocké dans un [FIELD-SYMBOL](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/03_FIELD-SYMBOLS.md) (`ASSIGNING <fs>`)

- ne pas être stocké afin de vérifier seulement si la ligne existe (`TRANSPORTING NO FIELD`). 

En mettant à jour les variables système [SY-SUBRC](../../00_HELP/02_SY_SYSTEM.md) (code retour) et [SY-TABIX](../../00_HELP/02_SY_SYSTEM.md) ([INDEX]([INDEX](../../11_SQL/06_INDEX/01_Index.md)) de la table retourné par la recherche). Ces paramètres sont `obligatoires` pour des `tables n'ayant pas d'en-tête`.

D'une vision très générale, un [FIELD-SYMBOL](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/03_FIELD-SYMBOLS.md) (appelé `pointeur`) est un type de variable faisant référence à la zone mémoire d'une [STRUCTURE](../../07_TABLE_INTERNE/08_STRUCTURES.md), [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md)... et qui est déclaré par la commande [FIELD-SYMBOL](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/03_FIELD-SYMBOLS.md).

Non seulement l'utilisation d'un [FIELD-SYMBOL](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/03_FIELD-SYMBOLS.md) diminue considérablement le temps de traitement mais en plus, faisant référence directement à une zone mémoire, elle peut modifier directement la valeur de celle-ci (sans utiliser des instructions comme [MODIFY](../04_Modify/02_Modify_itab.md) dans le cas d'une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md)...). L'allocation à une zone mémoire se fait par la commande `ASSIGN` ou `ASSIGNING`.

Exemple

Après avoir rempli la table interne `lt_citizen`, trois `READ TABLE` vont être effectués.

```abap
TYPES: BEGIN OF ty_citizen,
         country TYPE char3,
         name    TYPE char20,
         age     TYPE numc2,
       END OF ty_citizen.

DATA: lt_citizen TYPE STANDARD TABLE OF ty_citizen,
      ls_citizen TYPE ty_citizen.

FIELD-SYMBOLS: <lfs_citizen> TYPE ty_citizen.

ls_citizen-country = 'FR'.
ls_citizen-name    = 'Thierry'.
ls_citizen-age     = '24'.
APPEND ls_citizen TO lt_citizen.

ls_citizen-country = 'ES'.
ls_citizen-name    = 'Luis'.
ls_citizen-age     = '32'.
APPEND ls_citizen TO lt_citizen.

ls_citizen-country = 'BR'.
ls_citizen-name    = 'Renata'.
ls_citizen-age     = '27'.
APPEND ls_citizen TO lt_citizen.

ls_citizen-country = 'FR'.
ls_citizen-name    = 'Floriane'.
ls_citizen-age     = '32'.
APPEND ls_citizen TO lt_citizen.

ls_citizen-country = 'BR'.
ls_citizen-name    = 'Renata'.
ls_citizen-age     = '27'.

READ TABLE lt_citizen ASSIGNING <lfs_citizen> FROM ls_citizen.
IF sy-subrc = 0.
  WRITE: 'READ FROM structure :'.
  WRITE:/ <lfs_citizen>-country, <lfs_citizen>-name, <lfs_citizen>-age.
ENDIF.
ULINE.

READ TABLE lt_citizen INTO ls_citizen INDEX 4.
IF sy-subrc = 0.
  WRITE:/ 'READ INDEX :'.
  WRITE:/ ls_citizen-country, ls_citizen-name, ls_citizen-age.
ENDIF.
ULINE.

SORT lt_citizen BY country.
READ TABLE lt_citizen WITH KEY country = 'ES' BINARY SEARCH
                      TRANSPORTING NO FIELDS.
IF sy-subrc = 0.
  WRITE:/ 'READ WITH KEY :'.
  WRITE:/ 'Il existe un enregistrement avec le champ COUNTRY égal à ''ES'' à la ligne :', sy-tabix.
ENDIF.
```

L'instruction `ULINE` permet d'afficher une ligne horizontale (`UnderLine`). Dans le même genre, `VLINE` trace quant à elle une ligne verticale.

## NOUVELLE VERSION

Le [FIELD-SYMBOL](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/03_FIELD-SYMBOLS.md) peut directement être délcaré dans le `READ` :

```abap
TYPES: BEGIN OF ty_citizen,
         country TYPE char3,
         name    TYPE char20,
         age     TYPE numc2,
       END OF ty_citizen.

DATA: lt_citizen TYPE STANDARD TABLE OF ty_citizen,
      ls_citizen TYPE ty_citizen.

ls_citizen-country = 'FR'.
ls_citizen-name    = 'Thierry'.
ls_citizen-age     = '24'.
APPEND ls_citizen TO lt_citizen.

ls_citizen-country = 'ES'.
ls_citizen-name    = 'Luis'.
ls_citizen-age     = '32'.
APPEND ls_citizen TO lt_citizen.

ls_citizen-country = 'BR'.
ls_citizen-name    = 'Renata'.
ls_citizen-age     = '27'.
APPEND ls_citizen TO lt_citizen.

ls_citizen-country = 'FR'.
ls_citizen-name    = 'Floriane'.
ls_citizen-age     = '32'.
APPEND ls_citizen TO lt_citizen.

ls_citizen-country = 'BR'.
ls_citizen-name    = 'Renata'.
ls_citizen-age     = '27'.

READ TABLE lt_citizen ASSIGNING FIELD-SYMBOLS(<lfs_citizen>) FROM ls_citizen.
IF sy-subrc = 0.
  WRITE: 'READ FROM structure :'.
  WRITE:/ <lfs_citizen>-country, <lfs_citizen>-name, <lfs_citizen>-age.
ENDIF.
```

Pour autant, le [FIELD-SYMBOL](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/03_FIELD-SYMBOLS.md) `<lfs_citizen>` aura déjà été déclaré ici. Il ne pourra pas être déclaré avec le même nom dans la même scope.