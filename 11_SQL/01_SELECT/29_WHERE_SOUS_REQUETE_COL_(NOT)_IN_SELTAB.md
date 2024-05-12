# **WHERE COL (NOT) IN SELTAB**

```JS
col [NOT] IN seltab
```

Pour cette fonction, le paramètre `SELTAB` signifie `selection table` (table de sélection), et est le plus souvent associé à un `champ` d'un écran de sélection de type [SELECT-OPTIONS](../../15_Screen/02_Champs/01_Select-Options.md) (pour `Options de sélection` ).

La particularité de ce type de `champ` est qu'il est en fait, une [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) de type [RANGE](../../10_Tables_Internes/05_Type_Range.md).

L'exemple suivant va reprendre celui créé avec l'option [BETWEEN](<./25_Where_(not)_Between.md>) : sélectionner toutes les marques et modèles de voitures dont l'année est comprise entre 2013 et 2016, plus ceux de 2011. Pour cela, une [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) de type [RANGE](../../10_Tables_Internes/05_Type_Range.md) avec comme référence l'[ELEMENT DE DONNEES](../../08_SE11/07_Elements_de_Donnees.md) `VLC_YEAR_OF_CONSTRUCTION`, sera créée et renseignée avec toutes les options de date, afin d'être utilisée dans la clause `WHERE`.

```JS
DATA: r_year TYPE RANGE OF vlc_year_of_construction.
DATA: s_year LIKE LINE OF r_year.

s_year-sign   = 'I'.
s_year-option = 'BT'.
s_year-low    = '2013'.
s_year-high   = '2016'.
APPEND s_year TO r_year.

CLEAR s_year.
s_year-sign   = 'I'.
s_year-option = 'EQ'.
s_year-low    = '2011'.
APPEND s_year TO r_year.

SELECT brand,
       model
  FROM zcar_brand_mod
  INTO TABLE @DATA(t_car)
  WHERE model_year IN @r_year.

DATA s_car LIKE LINE OF t_car.

LOOP AT t_car INTO s_car.
  WRITE:/ s_car-brand, s_car-model.
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

_Résultat à l'écran_

![](../../ressources/12_01_29_01.png)
