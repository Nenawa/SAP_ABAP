# DELETE SINGLE LINE

```abap
DELETE { TABLE itab { FROM ls } 
         | { WITH TABLE KEY [keyname COMPONENTS]
                 {comp_name1|(name1)} = operand1
                 {comp_name2|(name2)} = operand2 ...}
         | itab INDEX idx }
```

Pour la suppression d’une seule ligne d’une table interne, il existe trois possibilités :

## 1. SUPPRESSION D'UNE LIGNE DE ITAB A PARTIR DE LA STRUCTURE LS

Le système ira rechercher la [CLE PRIMAIRE](../../07_TABLE_INTERNE/06_PRIMARY_KEY.md) renseignée dans la structure afin de supprimer les enregistrements souhaités.

Exemple

```abap
TYPES: BEGIN OF ty_citizen,
         country TYPE char3,
         name    TYPE char20,
         age     TYPE numc2,
       END OF ty_citizen.

DATA: Lt_citizen TYPE TABLE OF ty_citizen WITH NON-UNIQUE KEY country,
      Ls_citizen TYPE ty_citizen.

Ls_citizen-country = 'FR'.
Ls_citizen-name    = 'Thierry'.
Ls_citizen-age     = '24'.
APPEND Ls_citizen TO Lt_citizen.

Ls_citizen-country = 'ES'.
Ls_citizen-name    = 'Luis'.
Ls_citizen-age     = '32'.
APPEND Ls_citizen TO Lt_citizen.

Ls_citizen-country = 'BR'.
Ls_citizen-name    = 'Renata'.
Ls_citizen-age     = '27'.
APPEND Ls_citizen TO Lt_citizen.

Ls_citizen-country = 'FR'.
Ls_citizen-name    = 'Floriane'.
Ls_citizen-age     = '32'.
APPEND Ls_citizen TO Lt_citizen.

CLEAR Ls_citizen.
Ls_citizen-country = 'FR'.

DELETE TABLE Lt_citizen FROM Ls_citizen.
```

L’instruction supprimera le premier enregistrement rencontré ayant pour clé `country` égale à `FR`. Un [CLEAR](../14_Clear/01_Clear_itab.md) est effectué avant de renseigner de nouveau le champ afin de bien nettoyer la [STRUCTURE](../../07_TABLE_INTERNE/08_STRUCTURES.md) des valeurs renseignées.

## 2. SUPPRESSION D'UNE LIGNE DE ITAB EN RENSEIGNANT UN OU PLUSIEURS COMPOSANTS

Exemple

Reprendre l’exemple précédent en modifiant uniquement le `DELETE` :

```abap
. . .

DELETE TABLE Lt_citizen WITH TABLE KEY country = 'FR'.
```

Ici encore, l’instruction supprimera le premier enregistrement rencontré ayant pour clé `country` égale à `FR`. Il est nécessaire de renseigner la clé entière définie pour la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md). Ici, il s’agit du champ `country` uniquement et il n’est pas possible de renseigner plus ou d’autres champs à part ceux définis dans la clé de la [TABLE INTERNE](../../07_TABLE_INTERNE/). Ainsi, l’instruction `DELETE` ne peut s’écrire :

```abap
DELETE TABLE lt_citizen WITH TABLE KEY country = 'FR' age = '32'.
```

ou

```abap
DELETE TABLE t_citizen WITH TABLE KEY age = '32'.
```

De plus, si lors de la déclaration de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md), aucune clé n’est définie avec l’instruction `WITH NON-UNIQUE KEY` ou `WITH UNIQUE KEY`, lors du `DELETE` tous les champs doivent être renseignés après `WITH TABLE KEY`.

```abap
. . .

DATA: lt_citizen TYPE TABLE OF ty_citizen,
      ls_citizen TYPE ty_citizen.

. . .

DELETE TABLE lt_citizen WITH TABLE KEY country = 'FR'
                                       name    = 'Thierry'
                                       age     = 24.
```

## 3. SUPPRESSION D'UNE LIGNE DEFINIE PAR UN INDEX DE ITAB

Exemple

Reprendre l'exemple précédent en modifiant uniquement le `DELETE`.

```abap
. . .

DELETE lt_citizen INDEX 1.
```

Pour tous les exemples exécutés ci-dessous, le résultat sera à chaque fois le même.

``lt_citizen`` avant DELETE

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| FR          | Thierry  | 24      |
| ES          | Luis     | 32      |
| BR          | Renata   | 27      |
| FR          | Floriane | 32      |

``lt_citizen`` après DELETE

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| FR          | Thierry  | 24      |
| ES          | Luis     | 32      |
| FR          | Floriane | 32      |
