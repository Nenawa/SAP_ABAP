# SPLIT

```abap
SPLIT dobj
  AT sep
  INTO { {result1 result2 ...} | {TABLE itab} }
  [IN {BYTE|CHARACTER} MODE].
```

Un `SPLIT` permet de faire l’inverse du [CONCATENATE](./08_INSTRUCTION_CONCATENATE.md) : il va séparer une chaîne de caractères `dobj` selon le code séparateur défini après le `AT` et stocker le résultat dans des [VARIABLES](./01_Variables.md) de sortie (`result1`, `result2...`) ou dans une [table interne](../10_Tables_Internes/README.md) `itab`.

Paramètre(s) supplémentaire(s) optionnel(s) :

- `IN BYTE MODE` ou `IN CHARACTER MODE`, est un paramètre qui revient assez souvent en `ABAP`. La valeur par défaut sera toujours `IN CHARACTER MODE`. `IN BYTE MODE` est le plus souvent utilisé lors d’un travail avec des [VARIABLES](./01_Variables.md) de type hexadécimal, autant dire assez rarement.

```abap
DATA: lv_text1(20) TYPE C,
      lv_text2(20) TYPE C,
      lv_text3(20) TYPE C,
      lv_text4(20) TYPE C,
      lv_text5(20) TYPE C.

CONSTANTS: lc_string(50) TYPE C VALUE 'Hello World Bienvenue sur SAP'.

SPLIT lc_string
  AT space
  INTO lv_text1 lv_text2 lv_text3 lv_text4 lv_text5.

WRITE:/ 'lv_text1 : ', lv_text1,
      / 'lv_text2 : ', lv_text2,
      / 'lv_text3 : ', lv_text3,
      / 'lv_text4 : ', lv_text4,
      / 'lv_text5 : ', lv_text5.
```

Cette fois-ci, la [CONSTANTE](./02_Constants.md) `lc_string` contenant une chaîne de caractères de plusieurs mots séparée par un espace, va être divisée et stockée dans les [VARIABLES](./01_Variables.md) `lv_text*`.

## DECLARATION DYNAMIQUE

Dans la nouvelle version de SAP, il est possible de déclarer les variables directement dans l’instruction. Ainsi l’exemple précédent peut être réécrit de la manière suivante :

```abap
CONSTANTS: lc_string(50) TYPE C VALUE 'Hello World Bienvenue sur SAP'.

SPLIT lc_string AT space
      INTO DATA(lv_text1)
           DATA(lv_text2)
           DATA(lv_text3)
           DATA(lv_text4)
           DATA(lv_text5).
```

SAP va automatiquement créer les [VARIABLES](./01_Variables.md) `lv_text1`, `lv_text2`, `lv_text3`, `lv_text4`, et `lv_text5` de type `STRING`. De même pour le résultat dans une [table interne](../06_TABLES_INTERNES/01_TABLES_INTERNES.md), SAP va en créer une de type `STRING` également.

```abap
CONSTANTS: lc_string(50) TYPE C VALUE 'Hello World Bienvenue sur SAP'.

SPLIT lc_string AT space INTO TABLE DATA(tab_result).
```

Cette [table interne](../06_TABLES_INTERNES/01_TABLES_INTERNES.md) aura une liste de champs de type `STRING`.
