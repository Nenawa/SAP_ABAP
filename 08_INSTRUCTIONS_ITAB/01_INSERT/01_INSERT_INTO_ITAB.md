# INSERT INTO ITAB

```abap
INSERT  { ls | {INITIAL LINE} | {LINES OF jtab [FROM idx1] [TO idx2]} }
        INTO  { {TABLE itab} | {itab INDEX idx } }
```

L’instruction `INSERT` va insérer les données contenues 

- dans une [STRUCTURE](../../07_TABLE_INTERNE/08_STRUCTURES.md) `ls` :

- une ligne vide (INITIAL LINE)

- dans les lignes d’une autre [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) (`jtab`) avec comme option la possibilité de spécifier les numéros de ligne à copier (`FROM idx1` / `TO idx2`). Elle va insérer ces enregistrements dans une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) (`TABLE itab`), avec la possibilité d’indiquer leur `ligne de destination`.

Exemple : Insertion de lignes dans la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) `T_CITIZEN1`.

```abap
TYPES: BEGIN OF ty_citizen,
         country TYPE char3,
         name    TYPE char20,
         age     TYPE numc2,
       END OF ty_citizen.

DATA: lt_citizen1 TYPE TABLE OF ty_citizen,
      lt_citizen2 TYPE TABLE OF ty_citizen,
      ls_citizen  TYPE ty_citizen.

ls_citizen-country = 'FR'.
ls_citizen-name    = 'Thierry'.
ls_citizen-age     = '24'.

INSERT ls_citizen INTO TABLE lt_citizen1.

ls_citizen-country = 'ES'.
ls_citizen-name    = 'Luis'.
ls_citizen-age     = '32'.

INSERT ls_citizen INTO TABLE lt_citizen2.

ls_citizen-country = 'BR'.
ls_citizen-name    = 'Renata'.
ls_citizen-age     = '27'.

INSERT ls_citizen INTO TABLE lt_citizen2.

ls_citizen-country = 'FR'.
ls_citizen-name    = 'Floriane'.
ls_citizen-age     = '32'.

INSERT ls_citizen INTO TABLE lt_citizen2.

INSERT INITIAL LINE INTO lt_citizen1 INDEX 1.

INSERT LINES OF lt_citizen2 FROM 2 TO 3 INTO lt_citizen1 INDEX 1.
```

Un type de [STRUCTURE](../../07_TABLE_INTERNE/08_STRUCTURES.md) est tout d’abord créé, contenant les champs :

- `country` avec comme spécificité technique l’élément de données `char3`
- `name` avec `char20`
- `age` avec `numc2`.

Deux [TABLES INTERNES](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) vont être ensuite créées, utilisant ce type de [TABLES INTERNES](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) : `lt_citizen1` et `lt_citizen2`, ainsi que la [STRUCTURE](../../07_TABLE_INTERNE/08_STRUCTURES.md) `ls_citizen`.

Un premier enregistrement est tout d’abord inséré dans `lt_citizen1`, puis trois autres dans `lt_citizen2`. 

Une ligne vide sera ajoutée à l’`index 1` de `lt_citizen1`.

Enfin les enregistrements contenus aux lignes 2 et 3 de `lt_citizen2` seront aussi ajoutés à l’`index 1` de `lt_citizen1`. Au final, la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lt_citizen1` aura les enregistrements suivants :

| **COUNTRY** | **NAME**  | **AGE** |
|:-----------:|-----------|:-------:|
| BR          | Renata    | 27      |
| FR          | Florianne | 32      |
|             |           |         |
| FR          | Thierry   | 24      |
