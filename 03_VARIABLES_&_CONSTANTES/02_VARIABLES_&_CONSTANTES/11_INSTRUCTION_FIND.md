# FIND

```abap
FIND [ {FIRST OCCURRENCE} | {ALL OCCURRENCES} OF ] pattern
    IN [SECTION OFFSET i1 LENGTH i2 OF] dobj
    [IN {BYTE|CHARACTER} MODE]
    [ {RESPECTING | IGNORING} CASE]
    [MATCH COUNT mcnt]
    { { [MATCH OFFSET moff] [MATCH LENGTH mlen] } | [RESULTS lt_tab|ls_structure] }.
```

L’instruction `FIND` recherche une chaîne de caractères modèle `pattern` dans `IN` une chaîne de caractères source `dobj`.

Deux options sont possibles :

- soit chercher uniquement la `FIRST OCCURRENCE` et stocker le résultat dans une [structure](../06_TABLES_INTERNES/01_TABLES_INTERNES.md) `ls_structure`.

- soit chercher toutes les occurrences `ALL OCCURRENCES` et stocker le résultat dans une [table interne](../06_TABLES_INTERNES/01_TABLES_INTERNES.md) `lt_tab`

Si l’option du résultat n’est pas indiquée (dans le cas du `FIRST OCCURRENCE`), la [SY-FDPOS](../../00_HELP/02_SY_SYSTEM.md) est renseignée, contenant la position dans la chaîne source où a été trouvé le modèle.

Paramètre(s) supplémentaire(s) optionnel(s) :

- `IN section... of...` permet de restreindre la chaîne de caractères cible `dobj` à une partie définie par l’option `OFFSET` (position de départ) et/ou `LENGTH` (longueur de la chaîne cible à partir de la gauche).

  Exemple

  ```abap
  DATA lv_text TYPE STRING.

  lv_text = 'ABADAFAX'.
  FIND FIRST OCCURRENCE OF 'A'
      IN SECTION OFFSET 2 LENGTH 4 OF lv_text
      RESULTS DATA(ls_result).

  WRITE: /'OFFSET = ', ls_result-OFFSET,
         /'LENGTH = ', ls_result-LENGTH.
  ```

  Le ``FIND`` va chercher la première occurrence de la lettre `A` dans la chaîne de caractères cible `ABADAFAX` restreinte à partir de la deuxième position et d’une longueur de quatre positions, soit `ADAF`.

- `IN BYTE MODE` ou `IN CHARACTER MODE`, est un paramètre qui revient assez souvent en ABAP. La valeur par défaut sera toujours `IN CHARACTER MODE`. `IN BYTE MODE` est le plus souvent utilisé lors d’un travail avec des [VARIABLES](./01_Variables.md) de type hexadécimal, autant dire assez rarement.

- `RESPECTING`/`IGNORING CASE` indique si la casse de la chaîne de caractères doit être respectée. Par défaut, si cette option n’est pas renseignée, `RESPECTING CASE` est automatiquement choisie. 

- `MATCH COUNT mcnt` compte le nombre d’occurrences trouvées et sera toujours égal à 1 si l’option `FIRST OCCURRENCE` est choisie.

  Exemple

  ```abap
  DATA: lv_count TYPE I,
        lv_text  TYPE string.

  lv_text = 'ABADAFAX'.
  FIND ALL OCCURRENCES OF 'A' IN lv_text MATCH COUNT lv_count.
  
  WRITE: 'lv_count = ', lv_count.
  ```

  La [VARIABLES](./01_Variables.md) `lv_count` contiendra la valeur `4`.

- `MATCH OFFSET moff` indique la dernière position du caractère modèle trouvée dans la chaîne source dans le cas du `ALL OCCURRENCES`, sinon ce sera la première position. La position des caractères commence à `0` et devra être stocké dans une variable également (ici ``moff``)

  ```abap
  DATA: lv_offset1 TYPE i, 
        lv_offset2 TYPE i,  
        lv_text    TYPE string. 
   
  lv_text = 'ABADAFAX'. 
    
  FIND ALL OCCURRENCES OF 'A'  IN lv_text MATCH OFFSET lv_offset1. 
  FIND FIRST OCCURRENCE OF 'A' IN lv_text MATCH OFFSET lv_offset2. 
   
  WRITE:  'lv_offset1 = ', lv_offset1, 
        / 'lv_offset2 = ', lv_offset2.
  ```

  Les variables V_OFFSET1 et V_OFFSET2 contiendront respectivement les valeurs 6 et 0.

- `MATCH LENGTH mlen` retourne la longueur de la chaîne de caractères modèle. Utiliser l'exemple dessous n’est pas très significatif car la longueur de `A` est de 1 mais s’il s’agit d’un cas complexe avec des [VARIABLES](./01_Variables.md) dont les valeurs ne sont pas connues et attribuées dynamiquement, cette option serait utile.

- `RESULTS` est soit une [structure](../06_TABLES_INTERNES/01_TABLES_INTERNES.md) contenant le résultat du `FIND` `FIRST OCCURRENCE` soit une table `ALL OCCURRENCES`.

  ```abap
  DATA: lv_text TYPE string.

  lv_text = 'ABADAFAX'.

  FIND ALL OCCURRENCES  OF 'A' IN lv_text
      MATCH COUNT DATA(lv_count).

  FIND ALL OCCURRENCES  OF 'A' IN lv_text
      MATCH OFFSET DATA(lv_offset1).

  FIND FIRST OCCURRENCE OF 'A' IN lv_text
      MATCH OFFSET DATA(lv_offset2).

  WRITE: /'lv_count   = ', lv_count,
         /'lv_offset1 = ', lv_offset1,
         /'lv_offset2 = ', lv_offset2.
  ```

  Les [VARIABLES](./01_Variables.md) `lv_count`, `lv_offset1`, et `lv_offset2` seront créées comme un nombre de type `I`.