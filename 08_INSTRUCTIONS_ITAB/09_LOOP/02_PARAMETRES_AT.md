# PARAMETRE AT

Concernant les paramètres `AT`, ce sont des "ruptures". il en existe plusieurs :

```abap
LOOP AT itab.
  [AT FIRST.
    ...
  ENDAT.]

  [AT NEW comp1.
    ...
  ENDAT.]

  [AT NEW comp2.
    ...
  ENDAT.]

  [...]

  [AT NEW compn.
    ...
  ENDAT.]

  [...]

  [AT END OF compn.
    ...
  ENDAT.]

  [...]

  [AT END OF comp2.
    ...
  ENDAT.]

  [AT END OF comp1.
    ...
  ENDAT.]

  [AT LAST.
    ...
  ENDAT.]

ENDLOOP.
```

- `AT FIRST`

  Pour la première ligne lue de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `itab`, un traitement spécifique peut être exécuté.

- `AT NEW comp1` (AT NEW comp2... AT NEW compN)

  Pour un nouvel élément (`comp1`, `comp2`,... `compn`) de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `itab`, un traitement spécifique peut être exécuté.

- `AT END OF compN` (... AT END OF comp2, AT END OF comp1)

  Pour un dernier élément (`comp1`, `comp2`,... `compn`) de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `itab`, un traitement spécifique peut être exécuté.

- `AT LAST`

  Pour la dernière ligne lue de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `itab`, un traitement spécifique peut être exécuté.

Exemple

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

SORT lt_citizen BY country.

LOOP AT lt_citizen ASSIGNING <lfs_citizen>.
  AT FIRST.
    WRITE: 'Début de la liste'.
    ULINE.
  ENDAT.

  AT NEW country.
    WRITE: / 'Début pays : ', <lfs_citizen>-country.
  ENDAT.

  WRITE:/ 'Nom : ', <lfs_citizen>-name, 'Age : ', <lfs_citizen>-age.

  AT END OF country.
    WRITE: / 'Fin pays : ', <lfs_citizen>-country.
    ULINE.
  ENDAT.

  AT LAST.
    WRITE: 'Fin de la liste'.
  ENDAT.

ENDLOOP.
```

Résultat

Pour l'utilisation du `AT NEW` / `AT END OF`, il est recommandé de trier la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) sauf s'il s'agit d'un type [SORTED](../../07_TABLE_INTERNE/03_TYPE_SORTED.md).
