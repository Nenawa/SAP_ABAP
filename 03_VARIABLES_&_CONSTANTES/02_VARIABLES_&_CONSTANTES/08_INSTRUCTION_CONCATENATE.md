# CONCATENATE

```JS
CONCATENATE [ {dobj1 dobj2 ...} | {LINES OF itab} ]
    INTO result
    [IN {BYTE|CHARACTER} MODE]
    [SEPARATED BY sep]
    [RESPECTING BLANKS].
```

Le ``CONCATENATE`` permet de concaténer plusieurs chaînes de caractères définies par `dobj1`, `dobj2…` ou les lignes d’une [table interne](../06_TABLES_INTERNES/01_TABLES_INTERNES.md) `LINES OF` [itab](../06_TABLES_INTERNES/01_TABLES_INTERNES.md), et de stocker le résultat dans une [VARIABLE](./01_Variables.md) cible définie après le `INTO`.

Paramètre(s) supplémentaire(s) optionnel(s) :

- `IN BYTE MODE` ou `IN CHARACTER MODE`, est un paramètre qui revient assez souvent en `ABAP`. La valeur par défaut sera toujours `IN CHARACTER MODE`. `IN BYTE MODE` est le plus souvent utilisé lors d’un travail avec des [VARIABLES](./01_Variables.md) de type hexadécimal, autant dire assez rarement.

- `SEPARATED BY` renseigne le caractère de séparation entre les chaînes de caractères dans la [VARIABLE](./01_Variables.md) résultat.

- `RESPECTING BLANKS` affiche la chaîne complète y compris les espaces. Par exemple, si la [VARIABLE](./01_Variables.md) de sortie est définie comme une chaîne de caractères de vingt positions, mais que le résultat du `CONCATENATE` est seulement un texte de cinq, le `RESPECTING BLANKS` affichera le texte de cinq caractères puis quinze espaces. Ce procédé est utilisé pour l’envoi de fichiers plats à des banques par exemple et dont le nombre de colonnes de chaque cellule est nécessaire pour être compris et pris en compte par leur système.

L’exemple suivant démontre les différentes possibilités du `CONCATENATE` :_

```abap
CONSTANTS: lc_text1(20) TYPE C VALUE 'Hello',
           lc_text2(20) TYPE C VALUE 'World',
           lc_text3(20) TYPE C VALUE 'Bienvenue',
           lc_text4(20) TYPE C VALUE 'sur',
           lc_text5(20) TYPE C VALUE 'SAP'.

DATA: lv_result1(50) TYPE C,
      lv_resul2(50)  TYPE C,
      lv_resul3(100) TYPE C.

CONCATENATE lc_text1 lc_text2 lc_text3 lc_text4 lc_text5
  INTO lv_resul1.

CONCATENATE lc_text1 lc_text2 lc_text3 lc_text4 lc_text5
  INTO lv_resul2
  SEPARATED BY '-'.

CONCATENATE lc_text1 lc_text2 lc_text3 lc_text4 lc_text5
  INTO lv_resul3
  RESPECTING BLANKS.

WRITE:/ 'Sans option :     ', lv_resul1,
      / 'SEPARATED BY:     ', lv_resul2,
      / 'RESPECTING BLANKS:', lv_resul3.
```

Cinq [CONSTANTES](./02_CONSTANTES.md) de type chaîne de caractères sont créées avec une longueur de vingt positions à chaque fois. Les textes suivants leur sont attribués : `Hello`, `World`, `Bienvenue`, `sur`, et `SAP`. Puis trois [VARIABLES](./01_Variables.md) sont à leur tour déclarées, de type chaîne de caractères également avec une longueur de cinquante positions pour `lv_resul1` et `lv_resul2` et de cent pour `lv_resul3`.

Le premier `CONCATENATE` n’utilisera aucune option afin de se rendre compte de ce que cette instruction effectue seule sans paramètre de mise en forme.

Le deuxième fera la même chose sauf qu’un indicateur de séparation `-` sera défini avec l’option `SEPARATED BY`. Le résultat devra donc donner une chaîne de caractères avec des tirets entre chaque mot.

Enfin le troisième `CONCATENATE` utilisera l’option `RESPECTING BLANKS` affichant ainsi un résultat avec tous les mots séparés par de nombreux espaces.
