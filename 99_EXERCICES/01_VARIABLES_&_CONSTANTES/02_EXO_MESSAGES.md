# EXERCICE 2

## CONSIGNES

```abap
INSTRUCTIONS

RG 1 : A partir des constantes déclarées ci-dessous :

  CONSTANTS: lc_success TYPE string VALUE 'C''est un succés !',
             lc_warning TYPE string VALUE 'C''est un avertissement !',
             lc_info    TYPE string VALUE 'Ceci est un message à titre informatif !',
             lc_error   TYPE string VALUE 'ERROR !!!!'.

Afficher respectivement et successivement pour chacune d'entres elles le message (et son type associé)
avec l'instruction 'MESSAGE'.

Afficher le message 'lc_success' avec un 'MESSAGE' de 'TYPE' 'S', exécuter pour vérifier le récultat puis commenter ce dernier.
Afficher le message 'lc_warning' avec un 'MESSAGE' de 'TYPE' 'W', exécuter pour vérifier le récultat puis commenter ce dernier.
Afficher le message 'lc_info' avec un 'MESSAGE' de 'TYPE' 'I', exécuter pour vérifier le récultat puis commenter ce dernier.
Afficher le message 'lc_error' avec un 'MESSAGE' de 'TYPE' 'E', exécuter pour vérifier le récultat puis commenter ce dernier.

RG 2 : Afficher ensuite les mêmes messages (toujours de manière successive)
en ajoutant le paramètre 'DISPLAY LIKE' avec un 'TYPE' de votre choix.

RG 3 : Cliquer sur le bouton [SAUT], puis sur [Elément de texte] dans la barre de Menu.
Créer un 'TEXT' et lui donner un idée (3 chiffres obligatoires exemple : 001).

Afficher ensuite ce 'TEXT' à l'aide de l'instruction 'MESSAGE' avec le 'TYPE' de votre choix.
Exécuter ensuite pour vérifier le récultat puis commenter ce dernier.
```

## CORRECTION

```abap
  CONSTANTS: lc_success TYPE string VALUE 'C''est un succés !',
             lc_warning TYPE string VALUE 'C''est un avertissement !',
             lc_info    TYPE string VALUE 'Ceci est un message à titre informatif !',
             lc_error   TYPE string VALUE 'ERROR !!!!'.

  "RG 1
  MESSAGE lc_success TYPE 'S'.
  MESSAGE lc_warning TYPE 'W'.
  MESSAGE lc_info TYPE 'I'.
  MESSAGE lc_error TYPE 'E'.

  "RG 2
  MESSAGE lc_success TYPE 'S' DISPLAY LIKE 'I'.
  MESSAGE lc_warning TYPE 'W' DISPLAY LIKE 'E'.
  MESSAGE lc_info TYPE 'I' DISPLAY LIKE 'S'.
  MESSAGE lc_error TYPE 'E' DISPLAY LIKE 'W'.

  "RG 3
  MESSAGE TEXT-001 TYPE 'I'.
```