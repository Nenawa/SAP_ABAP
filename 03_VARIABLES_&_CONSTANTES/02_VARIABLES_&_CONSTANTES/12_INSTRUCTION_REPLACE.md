# REPLACE

```abap
REPLACE [ {FIRST OCCURRENCE} | {ALL OCCURRENCES} OF] pattern
        IN [section_of] dobj
        WITH new
        [IN {BYTE | CHARACTER} MODE]
        [ {RESPECTING | IGNORING} CASE ]
        [REPLACEMENT COUNT rcnt]
        { { [REPLACEMENT OFFSET roff] [REPLACEMENT LENGTH rlen] } | [RESULTS result_tab|result_wa] }.
```

L’instruction `REPLACE` est identique au [FIND](./11_INSTRUCTION_FIND.md) sauf qu’au lieu de chercher uniquement une chaîne de caractères, elle va aussi la remplacer par une autre `WITH new`. Elle possède aussi les options `FIRST OCCURRENCE` (chercher et remplacer la première occurrence trouvée), et `ALL OCCURRENCES` (chercher et remplacer toutes les occurrences trouvées).

Exemple

```abap
DATA: lv_text1 TYPE STRING,
      lv_text2 TYPE STRING.

lv_text1 = lv_text2 = 'ABADAFAX'.

REPLACE FIRST OCCURRENCE OF 'A' IN lv_text1 WITH 'I'.
REPLACE ALL OCCURRENCES  OF 'A' IN lv_text2 WITH 'I'.

WRITE: /'lv_text1 = ', lv_text1,
       /'lv_text2 = ', lv_text2.
```

La [VARIABLE](./01_Variables.md) `lv_text1` aura comme valeur `IBADAFAX` alors que `lv_text2` sera égal à `IBIDIFIX`.

Paramètre(s) supplémentaire(s) optionnel(s) :

- `IN section... of...` comme pour le `FIND` permet de restreindre la chaîne de caractères cible `dobj` à une partie définie par l’option `OFFSET` (position de départ) et/ou `LENGTH` (longueur de la chaîne cible à partir de la gauche).

- `IN BYTE MODE` ou `IN CHARACTER MODE`, est un paramètre qui revient assez souvent en `ABAP`. La valeur par défaut sera toujours `IN CHARACTER MODE`. `IN BYTE MODE` est le plus souvent utilisé lors d’un travail avec des [VARIABLES](./01_Variables.md) de type hexadécimal, autant dire assez rarement.

- `RESPECTING`/`IGNORING CASE` indique si la casse de la chaîne de caractères doit être respectée. Par défaut, si cette option n’est pas renseignée, `RESPECTING CASE` est automatiquement choisie.

- `REPLACEMENT COUNT` compteur du nombre de remplacements effectués.

  Exemple

  ```abap
  DATA: lv_text TYPE string.

  lv_text = 'ABADAFAX'.

  REPLACE ALL OCCURRENCES OF 'A' IN lv_text WITH 'I'
          REPLACEMENT COUNT DATA(lv_count).

  WRITE: 'lv_count = ', lv_count.
  ```

  La valeur contenue dans la [VARIABLE](./01_Variables.md) `lv_count` (créée comme nombre entier) sera égale à `4` et `lv_text` aura la nouvelle valeur `IBIDIFIX`.

- `REPLACEMENT OFFSET` renvoie la dernière position modifiée par le `REPLACE` dans la chaîne de caractères source.

  Exemple

  ```abap
  DATA: lv_text1 TYPE string,
        lv_text2 TYPE string.

  lv_text1 = lv_text2 = 'ABADAFAX'.

  REPLACE FIRST OCCURRENCE OF 'A' IN lv_text1 WITH 'I' REPLACEMENT OFFSET
  DATA(lv_offset1).

  REPLACE ALL OCCURRENCES  OF 'A' IN lv_text2 WITH 'I' REPLACEMENT OFFSET
  DATA(lv_offset2).

  WRITE: /'lv_offset1 = ', lv_offset1,
         /'lv_offset2 = ', lv_offset2.
  ```

  La [VARIABLE](./01_Variables.md) `lv_offset1` aura la valeur `0` étant donné que la première occurrence se situe en tout début de chaîne et donc à la position `0`, alors que `lv_offset2` aura comme valeur `6`.

- `REPLACEMENT LENGTH` : comme pour le `MATCH LENGTH` de l’instruction `FIND` cette option retourne la longueur de la chaîne de caractères modèle.

- `RESULTS` est soit une [structure](../06_TABLES_INTERNES/01_TABLES_INTERNES.md) contenant le résultat du `REPLACE FIRST OCCURRENCE`, soit une [table interne](../06_TABLES_INTERNES/01_TABLES_INTERNES.md) `ALL OCCURRENCES`.
