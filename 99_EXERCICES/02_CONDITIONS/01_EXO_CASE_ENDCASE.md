# EXERCICE 1

## CONSIGNES

```abap
INSTRUCTIONS

RG 1 : Déclarer une variable de type string avec comme valeur :

'frEdErIc'

Optionnel : Déclarer une variable de 'TYPE' 'XFELD' qui servira de flag.

RG 2 : Avec l'instruction 'CASE' et 'ENDCASE', vérifier si votre prénom écrit tout en minuscule est considéré comme un faux positif.

Optionnel : Si c'est le cas, "lever le flag" (cad : attribuer la valeur 'X' à la variable optionnelle)

RG 3 : vérifier si votre prénom écrit tout en majuscule est considéré comme un faux positif.

Optionnel : Si c'est le cas, "lever le flag" (cad : attribuer la valeur 'X' à la variable optionnelle)

RG 4 : Si le 'CASE' n'entre dans aucune des situations précédentes, et si la variable flag a été déclarée, "lever le flag" (cad : attribuer la valeur 'X' à la variable optionnelle) dans l'instruction 'WHEN OTHERS'.

RG 4 : Ne pas utiliser ni l'instruction 'WRITE' ni 'MESSAGE'. Vérifier le résultat en débug.
```

## CORRECTION

```abap
  DATA: lv_fred TYPE string,
        lv_flag TYPE xflag.

  lv_fred = 'frEdErIc'.

  CASE lv_fred.
    WHEN 'FREDERIC'.
      lv_flag = 'X'.
    WHEN 'frederic'.
      lv_flag = 'X'.
    WHEN OTHERS.
      lv_flag = 'X'.
  ENDCASE.
```