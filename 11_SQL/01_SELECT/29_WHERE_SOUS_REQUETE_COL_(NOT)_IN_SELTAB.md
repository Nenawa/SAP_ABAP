# WHERE COL (NOT) IN SELTAB

```abap
col [NOT] IN seltab
```

Pour cette fonction, le paramètre `SELTAB` signifie `selection table` (table de sélection), et est le plus souvent associé à un `champ` d'un écran de sélection de type [SELECT-OPTIONS](../../12_SELECTION_SCREEN/03_INSTRUCTION_SELECT-OPTIONS.md) (pour `Options de sélection` ).

La particularité de ce type de `champ` est qu'il est en fait, une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) de type [RANGE](../../07_TABLE_INTERNE/05_TYPE_RANGE.md).

L'exemple suivant va reprendre celui créé avec l'option [BETWEEN](./25_WHERE_(NOT)_BETWEEN.md) : sélectionner toutes les marques et modèles de voitures dont l'année est comprise entre 2013 et 2016, plus ceux de 2011. Pour cela, une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) de type [RANGE](../../07_TABLE_INTERNE/05_TYPE_RANGE.md) avec comme référence l'[ELEMENT DE DONNEES](../../09_DDIC/05_ELEMENTS_DE_DONNEES.md) `VLC_YEAR_OF_CONSTRUCTION`, sera créée et renseignée avec toutes les options de date, afin d'être utilisée dans la clause `WHERE`.

```abap
DATA: lr_year TYPE RANGE OF vlc_year_of_construction.
DATA: ls_year LIKE LINE OF lr_year.

ls_year-sign   = 'I'.
ls_year-option = 'BT'.
ls_year-low    = '2013'.
ls_year-high   = '2016'.
APPEND ls_year TO lr_year.

CLEAR ls_year.
ls_year-sign   = 'I'.
ls_year-option = 'EQ'.
ls_year-low    = '2011'.
APPEND ls_year TO lr_year.

SELECT brand,
       model
  FROM zcar_brand_mod
  INTO TABLE @DATA(lt_car)
  WHERE model_year IN @lr_year.

DATA ls_car LIKE LINE OF lt_car.

LOOP AT lt_car INTO ls_car.
  WRITE:/ ls_car-brand, ls_car-model.
ENDLOOP.
```

_Résultat de la requête_

| **BRAND**  | **MODEL** |
| ---------- | --------- |
| AUDI       | A3        |
| FORD       | ESCORT    |
| PEUGEOT    | 307       |
| RENAULT    | MEGANE    |
| VOLKSWAGEN | GOLF      |
