# COMMENTAIRES

Les commentaires dans un code ABAP, tout comme dans de nombreux autres langages de programmation, servent à fournir des explications et des informations supplémentaires sur le code pour les développeurs qui le lisent. Ils ne sont pas interprétés par le système et n'affectent pas l'exécution du programme. Les commentaires sont extrêmement utiles pour rendre le code plus compréhensible, pour documenter son fonctionnement et pour faciliter la maintenance à long terme.

## CONVENTIONS

Il est de coutume que les commentaires ne dépassent pas les 76 caractères car sous certaines consditions obscures, les caractères au delà du 76e pourraient ne pas être pris en compte et apparaître. De plus, il est plus aisé de les visualiser s'ils sont en bloc.

## COMMENTAIRE SUR LIGNE UNIQUE

Utiliser le symbole ``*`` pour commencer un commentaire sur une ligne. Tout texte après ``*`` sur la même ligne sera considéré comme un commentaire. Le ``*`` doit cependant être positionné en premier (tout à gauche de la ligne).

```abap
* DECLARATIONS

DATA: lv_age TYPE i.
```

## COMMENTAIRES SUR PLUSIEURS LIGNES

l'utilisation du ``*&`` pour ouvrir un commentaire sur plusieurs lignes est une convention de codage souvent recommandée dans les entreprises et les communautés de développement ABAP. 

```abap
*&---------------------------------------------------------------------*
*& Déclaration de la structure
*&---------------------------------------------------------------------*

* - Variables:
DATA: lv_age TYPE i.

* - Constants:
CONSTANTS: lc_firstname TYPE string.
```

## COMMENTAIRES DE FIN DE LIGNE

Il est également possible de placer des commentaires sur la même ligne que le code lui-même grâce au symbole ``"``.

```abap
*&---------------------------------------------------------------------*
*& Déclaration de la structure
*&---------------------------------------------------------------------*

* - Variables:
DATA: lv_variable TYPE string. "Variable to store SAP consultant age

* - Constants:
CONSTANTS: lc_firstname TYPE string. "Variable to store SAP consultant name
```