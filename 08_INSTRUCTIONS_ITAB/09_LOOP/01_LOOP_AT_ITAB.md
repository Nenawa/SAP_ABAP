# LOOP

```abap
LOOP AT itab 
  { INTO ls | ASSIGNING <lfs_> | TRANSPORTING NO FIELDS }
  [FROM idx1] [TO idx2]
  [WHERE log_exp]
  ...
  AT ...
    ...
  ENDAT.
  ...
ENDLOOP.
```

## CARACTERISTIQUES

Deux types de boucles ont été vues : le [DO/ENDDO](../../05_BOUCLES/01_DO_ENDDO.md) et le [WHILE/ENDWHILE](../../05_BOUCLES/05_WHILE_ENDWHILE.md). Cependant il existe une troisième plus adaptée aux [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) : le `LOOP`.

Un `LOOP` va lire ligne par ligne la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `itab` et comme pour le [READ TABLE](../07_Read/01_Read_itab.mdd), le résultat peut :

- être stocké dans une [STRUCTURE](../../07_TABLE_INTERNE/08_STRUCTURES.md) (`INTO ls`)

- être stocké dans un [FIELD-SYMBOL](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/03_FIELD-SYMBOLS.md) (`ASSIGNING <lfs_>`)

- ne pas être stocké afin de vérifier seulement si la ligne existe (`TRANSPORTING NO FIELDS`)

en mettant à jour les variables système [SY-SUBRC](../../00_HELP/02_SY_SYSTEM.md) (code retour) et [SY-TABIX](../../00_HELP/02_SY_SYSTEM.md) ([INDEX](../../11_SQL/06_INDEX/01_Index.md) de la table lue dans la boucle).

Aussi, deux paramètres optionnels sont disponibles comme pour le [DELETE](../05_Delete/02_Delete_itab_lines.md) (suppression de plusieurs lignes) : 

- `FROM idx1` et/ou `TO idx2` permettant de restreindre la boucle à une sélection de lignes

- `WHERE` permettant d'effectuer une sélection d'un ou plusieurs champs.

Exemple

Boucle sur la table `lt_citizen` dont le champ `country` est égal à `FR`, et affichage de la ligne.

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

LOOP AT lt_citizen ASSIGNING <lfs_citizen> WHERE country = 'FR'.
  WRITE: / <lfs_citizen>-country, <lfs_citizen>-name, <lfs_citizen>-age.
ENDLOOP.
```

Petit complément concernant le [FIELD-SYMBOL](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/03_FIELD-SYMBOLS.md). Il a été vu qu’il était possible de modifier directement la valeur de la zone mémoire référant à une variable, et que dans le cas d’une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md), il n’était donc pas nécessaire d’utiliser la commande [MODIFY](../04_Modify/02_Modify_itab.md) pour appliquer ces modifications. Pour bien comprendre ce point, l’exemple précédent va être repris, sauf qu’avant la boucle utilisée pour lire les valeurs, une autre va affecter la valeur `IT` au champ `country`.

```abap
. . .

LOOP AT lt_citizen ASSIGNING <lfs_citizen>.
  <lfs_citizen>-country = 'IT'.
ENDLOOP.

LOOP AT lt_citizen ASSIGNING <lfs_citizen>.
  WRITE: / <lfs_citizen>-country, <lfs_citizen>-name, <lfs_citizen>-age.
ENDLOOP.
```

``lt_citizen`` avant la première boucle

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| FR          | Thierry  | 24      |
| ES          | Luis     | 32      |
| BR          | Renata   | 27      |
| FR          | Floriane | 32      |

``lt_citizen`` après la première boucle

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| IT          | Thierry  | 24      |
| IT          | Luis     | 32      |
| IT          | Renata   | 27      |
| IT          | Floriane | 32      |

Avec le [FIELD-SYMBOL](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/03_FIELD-SYMBOLS.md), une simple affectation a suffi pour mettre à jour les champs de la table interne.

## NOUVELLE VERSION

Le [FIELD-SYMBOL](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/03_FIELD-SYMBOLS.md) peut directement être délcaré dans le `LOOP` :

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

LOOP AT lt_citizen ASSIGNING FIELD-SYMBOLS(<lfs_upd_citizen>).
  <lfs_upd_citizen>-country = 'IT'.
ENDLOOP.

LOOP AT lt_citizen ASSIGNING FIELD-SYMBOLS(<lfs_read_citizen>).
  WRITE: / <lfs_read_citizen>-country, <lfs_read_citizen>-name, <lfs_read_citizen>-age.
ENDLOOP.
```

Pour autant, le [FIELD-SYMBOL](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/03_FIELD-SYMBOLS.md) `<lfs_upd_citizen>` aura déjà été déclaré ici. Il ne pourra pas être déclaré avec le même nom dans la même scope d'où le `<lfs_read_citizen>`.

