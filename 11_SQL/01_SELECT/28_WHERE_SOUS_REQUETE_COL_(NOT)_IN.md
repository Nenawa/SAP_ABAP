# **WHERE COL (NOT) IN**

> A distinguer de [WHERE SOUS-REQUETE (NOT) IN SOUS-REQUETE](<./31_Where_Sous_Requete_(not)_in_Sous_Requete.md>)

```JS
col [NOT] IN (obj1, obj2,. . . )
```

Vérifie si la valeur de la colonne fait partie ou non (option `NOT`) des valeurs entre parenthèses.

_Exemple_

_Recherche du nom et du prénom des passagers n'habitant pas les villes de "Toulouse" et "Barcelone"._

```JS
SELECT surname,
       name
  FROM zpassenger
  INTO TABLE @DATA(t_passenger)
  WHERE city NOT IN ('TOULOUSE', 'BARCELONE').

DATA s_passenger LIKE LINE OF t_passenger.

LOOP AT t_passenger INTO s_passenger.
  WRITE:/ s_passenger-surname, s_passenger-name.
ENDLOOP.
```

_Résultat de la requête_

| **SURNAME** | **NAME** |
| ----------- | -------- |
| PEREZ       | MICHEL   |

_Résultat à l'écran_

![](../../ressources/12_01_28_01.png)
