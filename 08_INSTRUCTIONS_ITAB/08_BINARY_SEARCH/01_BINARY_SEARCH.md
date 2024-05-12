# BINARY SEARCH

Lors de l'utilisation du [READ](../07_Read/01_Read_itab.md), il est fortement recommandé d'utiliser l'option `BINARY SEARCH`, car cela favorisa une recherche binaire de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) améliorant ainsi les performances du programme.

Une recherche binaire répond à l'algorithme suivant :

- Si elle est égale à la valeur recherchée, alors l'[INDEX](../../11_SQL/06_INDEX/01_Index.md) de la ligne est retourné et la recherche est terminée.

- Sinon, si elle est supérieure à la valeur recherchée, la moitié inférieure sera isolée, puis de nouveau le programme regardera la valeur du milieu de cette moitié, si elle est égale à la valeur recherchée....

Exemple

Sur une liste de nombres de 1 à 10, on souhaite trouver la position de 4. Suivant l'algorithme précédent, on va donc procéder comme suit :

1. On vise la moitié de la plage balayée, soit 5.

    Est-ce que 5 = 4 ?
      NON
    Est-ce que 5 > 4 ?
      OUI
    REDUCTION DE LA PLAGE BALAYE A LA MOITIE INFERIEURE {1 -> 4}
    Est-ce que 2 = 4 ?
      NON
    Est-ce que 2 > 4 ?
      NON
    REDUCTION DE LA PLAGE BALAYE A LA MOITIE SUPERIEURE {3 -> 4}
    Est-ce que 3 = 4 ?
      NON
    Est-ce que 3 > 4 ?
      NON
    REDUCTION DE LA PLAGE BALAYE A LA MOITIE SUPERIEURE {4}
    Est-ce que 4 = 4 ?
      OUI

Pour utiliser le `BINARY SEARCH`, il est obligatoire d'organiser/trier les données avec un [SORT](../06_Sort/01_Sort_itab.md) (sauf dans le cas d'une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) de type [SORTED](../../07_TABLE_INTERNE/03_TYPE_SORTED.md)).

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

SORT lt_citizen.

READ TABLE lt_citizen WITH KEY country = 'FR' name = 'Florianne' BINARY SEARCH.
IF sy-subrc = 0.
  WRITE:/ 'READ WITH KEY :'.
  WRITE:/ 'Il existe un enregistrement avec le champ country égal à ''FR'' et name égal à ''Florianne'' à la ligne :', sy-tabix.
ENDIF.
```