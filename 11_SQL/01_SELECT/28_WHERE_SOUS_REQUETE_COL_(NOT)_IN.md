# WHERE COL (NOT) IN

> A distinguer de [WHERE SOUS-REQUETE (NOT) IN SOUS-REQUETE](./31_WHERE_SOUS_REQUETE_COL_(NOT)_IN_SOUS_REQUETE.md)

```abap
col [NOT] IN (obj1, obj2,. . . )
```

Vérifie si la valeur de la colonne fait partie ou non (option `NOT`) des valeurs entre parenthèses.

_Exemple_

_Recherche du nom et du prénom des passagers n'habitant pas les villes de "Toulouse" et "Barcelone"._

```abap
SELECT surname,
       name
  FROM zpassenger
  INTO TABLE @DATA(lt_passenger)
  WHERE city NOT IN ('TOULOUSE', 'BARCELONE').

DATA ls_passenger LIKE LINE OF lt_passenger.

LOOP AT lt_passenger INTO ls_passenger.
  WRITE:/ ls_passenger-surname, ls_passenger-name.
ENDLOOP.
```

_Résultat de la requête_

| **SURNAME** | **NAME** |
| ----------- | -------- |
| PEREZ       | MICHEL   |
