# FONCTIONS ARITHMETIQUES

Là encore, il en existe plusieurs :

- Valeur absolue du nombre ou de l'expression définis par `arg`.

```abap
abs( arg )
```

- Arrondi d'un nombre à virgule ou expression `arg` à l'entier inférieur.

```abap
ceil( arg )
```

- Arrondi d'un nombre à virgule ou expression `arg` à l'entier supérieur.

```abap
floor( arg )
```

- Partie entière de la division entre `arg1` et `arg2`.

```abap
div( arg1,arg2 )
```

- Reste de la division entre `arg&` et `arg2`.

```abap
mod( arg1,arg2 )
```

Exemple reprenant les différents éléments cités ci-dessus :

```abap
SELECT toll,
       duration,
       gasol,
       ABS( toll - gasol ) AS abs,    "Valeur absolue
       CEIL( gasol )       AS ceil,   "Arrondi inférieur
       FLOOR( gasol )      AS floor,  "Arrondi supérieur
       DIV( duration,60 )  AS div,    "Division
       MOD( duration,60 )  AS mod     "Reste division
  FROM ztravel
  INTO TABLE @DATA(lLt_arith).

DATA: ls_arith LIKE LINE OF lLt_arith.

LOOP AT lLt_arith INTO ls_arith.
  WRITE:/ ls_arith-toll, ls_arith-duration, ls_arith-gasol,
          ls_arith-abs,  ls_arith-ceil,     ls_arith-floor,
          ls_arith-div,  ls_arith-mod.
ENDLOOP.
```

Cette requête va d’abord

- afficher les champs `TOLL`, `DURATION` et `GASOL`

- puis va retourner la `valeur absolue` de la `soustraction` entre `TOLL` et `GASOL`

- `arrondir` la valeur de `GASOL` à l’`entier inférieur`

- puis `supérieur`

- et enfin `compter` le `nombre de minutes` du champ `DURATION (DIV)` et le `reste` de cette `division (MOD)`.

Il est possible de déclarer une [VARIABLE](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md), une structure ou [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) directement avec l’instruction `DATA`. Ainsi avec cette fonction unique, la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `LT_ARITH` sera créée automatiquement avec les types et longueurs de champs nécessaires.

De plus, afin que le résultat soit affiché à l’écran avec un [LOOP](../../08_INSTRUCTIONS_ITAB/09_LOOP/01_LOOP_AT_ITAB.md), la structure `LS_ARITH` va être déclarée comme la ligne de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `LT_ARITH` (`LIKE LINE OF`).

La [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `LT_ARITH` étant déclarée dans la requête [SQL](./01_SQL.md), la déclaration de la structure `LS_ARITH` ne pourrait se faire qu’après la requête, car la référence utilisée (`LIKE LINE OF LT_ARITH`) est inexistante avant.

Au final, la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `LT_ARITH` contiendra les valeurs suivantes :

| **TOLL** | **DURATION** | **GASOL** | **ABS** | **CEIL** | **FLOOR** | **DIV** | **MOD** |
| -------- | ------------ | --------- | ------- | -------- | --------- | ------- | ------- |
| 16.00    | 130          | 35.40     | 19.40   | 36       | 35        | 2       | 10      |
| 17.00    | 150          | 40.98     | 23.98   | 41       | 40        | 2       | 30      |
| 16.00    | 140          | 30.21     | 24.21   | 41       | 40        | 2       | 20      |
| 6.00     | 100          | 50.50     | 44.50   | 51       | 50        | 1       | 40      |

