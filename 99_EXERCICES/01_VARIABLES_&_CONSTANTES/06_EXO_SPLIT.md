# EXERCICE 6

## CONSIGNES

```abap
INSTRUCTIONS :

RG 1 : utiliser l'instruction 'SPLIT' et ses paramètres 'AT' et 'INTO'
pour récupérer séparemment chaque élément sans les '-' de la string 'A400M-TLS-Finale'.
Pour cela, déclarer autant de variable que nécessaire (la string doit être déclarée
en tant que constante.

RG 2 : Faire afficher le résultat
```

## CORRECTION

```abap
CONSTANTS: lc_split TYPE string VALUE 'A400M-TLS-Finale'.

DATA: lv_var1 TYPE string,
      lv_var2 TYPE string,
      lv_var3 TYPE string.

SPLIT lc_split
  AT '-'
  INTO lv_var1 lv_var2 lv_var3.

WRITE:/ lv_var1,
      / lv_var2,
      / lv_var3.
```