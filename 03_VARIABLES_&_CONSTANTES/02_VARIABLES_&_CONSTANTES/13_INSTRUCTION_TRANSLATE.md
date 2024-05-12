# TRANSLATE

```abap
TRANSLATE text {TO {UPPER | LOWER} CASE} | {USING mask}.
```

``TRANSLATE`` permet de convertir la casse d’une chaîne de caractères (tout en majuscules `UPPER CASE` ou tout en minuscules `LOWER CASE`) ou bien de convertir la chaîne selon un schéma défini dans un masque.

Exemple

```abap
DATA: lv_text1 TYPE string,
      lv_text2 TYPE string,
      lv_text3 TYPE string.

lv_text1 = lv_text2 = 'Hello World'.
lv_text3 = 'Barbcbdbarb'.

TRANSLATE lv_text1 TO UPPER CASE.
TRANSLATE lv_text2 TO LOWER CASE.

TRANSLATE lv_text3 USING 'ABBAabba'.

WRITE: /'lv_text1 = ', lv_text1,
       /'lv_text2 = ', lv_text2,
       /'lv_text3 = ', lv_text3.
```

Trois [VARIABLE](./01_Variables.md) ont été définies, toutes de type `STRING` : les deux premières contiennent le texte `Hello World` alors que la troisième est égale à `Barbcbdbarb`.

- Le premier `TRANSLATE` va modifier `V_TEXT1` et aura comme valeur `HELLO WORLD`.

- Le deuxième `TRANSLATE` va modifier `V_TEXT2` qui aura comme valeur `hello world`.

- Le troisième `TRANSLATE` va utiliser le masque `ABBAabba` sur la [VARIABLE](./01_Variables.md) `lv_text3`. Le masque a la logique suivante (il est nécessaire pour comprendre de prendre par paquet de deux lettres) :

- Lorsque la lettre `A` est rencontrée, la changer pour `B`.

- Lorsque la lettre `B` est rencontrée, la changer pour `A`.

- Lorsque la lettre `a` est rencontrée, la changer pour `b`.

- Lorsque la lettre `b` est rencontrée, la changer pour `a`.

Ainsi, suivant cette logique, le texte `V_TEXT3` aura comme valeur finale `Abracadabra`.
