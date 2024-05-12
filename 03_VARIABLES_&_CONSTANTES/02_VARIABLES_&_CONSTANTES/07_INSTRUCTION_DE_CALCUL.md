# INSTRUCTION DE CALCUL

Comme dans tout langage de programmation, les [VARIABLES](./01_Variables.md) numériques (`N`, `I`, `P`...) peuvent être utilisées dans des opérations arithmétiques.

## OPERATEURS ARITHMETIQUES

| **OPERATIONS** | **SIGNE** | **MOTS-CLES**          |
| -------------- | --------- | ---------------------- |
| EGAL           | `=`       | `MOVE`                 |
| ADDITION       | `+`       | `ADD... TO...`         |
| SOUSTRACTION   | `-`       | `SUBSTRACT... FROM...` |
| MULTIPLICATION | `*`       | `MULTIPLY... BY...`    |
| DIVISION       | `/`       | `DIVIDE... BY...`      |

Ainsi

- L'attribution de valeur se fera avec le signe ``=`` ou l'instruction ``MOVE ... TO``

- l’addition se fera avec le signe `+` ou l’instruction `ADD... TO...`

- la soustraction avec le signe `-` ou `SUBSTRACT... FROM...`

- la multiplication avec `*` ou `MULTIPLY... BY...`

- la division avec `/` ou `DIVIDE... BY...`

Les expressions mathématiques sont beaucoup plus utilisées car plus lisibles et beaucoup moins contraignantes que les instructions.

## = (EGAL) OU MOVE ... TO

Tout d’abord, pour assigner une valeur à une [VARIABLE](./01_Variables.md), les instructions `MOVE` ou égal `=` sont utilisées.

```abap
DATA: lv_a TYPE I,
      lv_b TYPE I,
      lv_c TYPE I,
      lv_d TYPE I.

lv_a = 3.
lv_b = lv_a.

MOVE 5    TO lv_c.
MOVE lv_c TO lv_d.

WRITE:/ 'Valeur de lv_a : ', lv_a,
      / 'Valeur de lv_b : ', lv_b,
      / 'Valeur de lv_c : ', lv_c,
      / 'Valeur de lv_d : ', lv_d.
```

Quatre variables ont été créées :

- `lv_a`
- `lv_b`
- `lv_c`
- `lv_d`

... toutes de type entier `I` avec une longueur d’une seule position. Tout d’abord, la valeur `3` sera assignée par un égal `=` à la [VARIABLE](./01_Variables.md) `lv_a`, puis la [VARIABLE](./01_Variables.md) `lv_b` prendra la valeur de `lv_a`.

Dans un deuxième temps, l’instruction `MOVE` va commencer par attribuer la valeur `5` à `lv_c`, puis la valeur de `lv_c` à `lv_d`. Elles sont enfin toutes affichées démontrant ainsi le rôle de chacune de ces instructions.

Il est aussi possible de déclarer successivement des attributions de valeurs avec Le MOVE :

```abap
MOVE: 5   TO v_c,
      v_c TO v_d.
```

## + (PLUS) OU ADD... TO...

```abap
DATA: lv_a(2) TYPE I.

lv_a = 5 + 2.
ADD 7 TO lv_a.
```

## - (MOINS) OU SUBSTRACT... FROM...

```abap
DATA: lv_a(2) TYPE I,
      lv_b(2) TYPE I.

lv_a = 5 + 2.
lv_b = lv_a - 3.
SUBTRACT 3 FROM lv_b.
```

## * (MULTIPLIER) OU MULTIPLY... BY...

```abap
DATA: lv_a(2) TYPE I,
      lv_b(2) TYPE I,
      lv_c(2) TYPE I.

lv_a = 5 + 2.
lv_b = lv_a - 3.
lv_c = lv_a * lv_b.
MULTIPLY lv_c BY 2.
```

## / (DIVISER) OU DIVIDE... BY...

```abap
DATA: lv_a(2) TYPE I,
      lv_b(2) TYPE I,
      lv_c(2) TYPE I,
      lv_d(2) TYPE I.

lv_a = 5 + 2.
lv_b = lv_a - 3.
lv_c = lv_a * lv_b.
lv_d = lv_c / 2.
DIVIDE lv_d BY 7.
```
