# WHERE COL (NOT) LIKE

```abap
col [NOT] LIKE obj
```

Cette option permet de rechercher une `châine de caractères`. La différence ici est que la chaîne de caractères peut être incomplète et donc les inconnus seront définis par un `%`.

_Exemple_

_Recherche du nom et prénom de tous les passagers dont le nom se termine par "ez"._

```abap
SELECT surname,
       name
  FROM zpassenger
  INTO TABLE @DATA(lt_passenger)
  WHERE ( surname LIKE '%EZ' OR surname LIKE '%ez' ).

DATA ls_passenger LIKE LINE OF lt_passenger.

LOOP AT lt_passenger INTO ls_passenger.
  WRITE:/ ls_passenger-surname, ls_passenger-name.
ENDLOOP.
```

_Résultat de la requête_

| **SURNAME** | **NAME** |
| ----------- | -------- |
| PEREZ       | MICHEL   |
| HERNANDEZ   | PATRICIA |

    Attention à la casse du texte recherché ! Dans l'exemple, pour être bien sûr du résultat, la recherche s'est effectuée sur les caractères en minuscule et majuscules.
