# WHERE SOUS-REQUETE (NOT) IN SOUS-REQUETE

```abap
col [NOT] IN ss_requête
```

> A distinguer de [WHERE SOUS-REQUETE (NOT) IN](./28_WHERE_SOUS_REQUETE_COL_(NOT)_IN.md)

Cette option permet de contrôler si la valeur d'une colonne fait partie ou non (`NOT`) d'une `sous-requête`.

_Exemple_

_Afficher la ville et le pays de destination qui n'existent pas dans la table des conducteurs et des passagers._

```abap
SELECT city_to && ', ' && country_to AS city_ctry
  FROM ztravel AS t
  INTO TABLE @DATA(lt_city)
  WHERE city_to NOT IN ( SELECT city
                           FROM zdriver_car
                           WHERE city = t~city_to )
    AND city_to NOT IN ( SELECT city
                           FROM zpassenger
                           WHERE city = t~city_to ).

DATA ls_city LIKE LINE OF lt_city.

LOOP AT lt_city INTO ls_city.
  WRITE:/ ls_city-city_ctry.
ENDLOOP.
```

_Résultat de la requête_

| **CITY_CTRY** |
| ------------- |
| LERIDA,ES     |
