# CASE

Comme celui utilisé pour les instructions conditionnelles ([CASE... ENDCASE](../../04_CONDITIONS/02_INSTRUCTION_CASE_ENDCASE.md)), il est possible de l'utiliser dans une requête [SQL](./01_SQL.md). Il en existe deux types :

## Simple Case

```abap
CASE col
    WHEN val1  THEN result1
    [WHEN val2 THEN result2]
    ...
     [ELSE result]
END
```

Pour chaque valeur définie après le `WHEN`, un résultat y est associé que ce soit l'affichage d'une valeur (via une [VARIABLE](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md), une [CONSTANTE](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/02_CONSTANTES.md)...) ou une autre expression [SQL](./01_SQL.md).

_Exemple_

_Afficher le nom du pays de chaque conducteur en toutes lettres_

```abap
SELECT name,
       surname,
       city,
       country,
       CASE country
         WHEN 'FR' THEN 'FRANCE'
         WHEN 'ES' THEN 'ESPAGNE'
       END AS pays
  FROM zdriver_car
  INTO TABLE @DATA(t_drivers).

DATA s_drivers LIKE LINE OF t_drivers.

LOOP AT t_drivers INTO s_drivers.
  WRITE:/ s_drivers-name,    s_drivers-surname, s_drivers-city,
          s_drivers-country, s_drivers-pays.
ENDLOOP.
```

_Résultat de la requête_

| **NAME** | **SURNAME** | **CITY**  | **COUNTRY** | **PAYS** |
| -------- | ----------- | --------- | ----------- | -------- |
| AMINH    | DEBBACHE    | TOULOUSE  | FR          | FRANCE   |
| PAULA    | ALDAIR      | BARCELONE | ES          | ESPAGNE  |
| BEATRIZ  | PILON       | PERPIGNAN | FR          | FRANCE   |
| JOSE     | OLIVEIRA    | BARCELONE | ES          | ESPAGNE  |

## COMPLEX CASE

```abap
CASE WHEN sql_cond1 THEN result1
    [WHEN sql_cond2 THEN result2]
    [WHEN sql_cond3 THEN result3]
    ...
    [ELSE result]
END
```

Même logique que pour le `CASE simple` sauf que cette fois-ci les `WHEN` vérifient une `condition SQL` qui peut s’exprimer via les [OPERATEURS DE COMPARAISON](../../04_CONDITIONS/01_OPERATEURS_DE_COMPARAISON.md), ou le `BETWEEN` pour vérifier si une valeur est entre deux autres (`col BETWEEN var1 AND var2`), et enfin vérifier si la valeur du champ est `nulle ou non` (`col IS [NOT] NULL`).

_Exemple_

_Définir si un trajet est court (inférieur ou égal à 200 kms), moyen (entre 200 et 300 kms) et long (supérieur à 300 kms)._

```abap
SELECT city_from && ' - ' && city_to AS traject,
       kms,
       CASE WHEN kms <= 200              THEN 'Trajet court'
            WHEN kms BETWEEN 200 AND 300 THEN 'Trajet moyen'
            WHEN kms > 300               THEN 'Trajet long'
            ELSE 'Non défini'
       END AS type_traj
  FROM ztravel
  INTO TABLE @DATA(t_traject).

DATA s_traject LIKE LINE OF t_traject.

LOOP AT t_traject INTO s_traject.
  WRITE:/ s_traject-traject, s_traject-kms, s_traject-type_traj.
ENDLOOP.
```

_Résultat de la requête_

| **TRAJET**            | **KMS** | **TYPE_TRAJ** |
| --------------------- | ------- | ------------- |
| PERPIGNAN - BARCELONE | 195     | Trajet court  |
| BARCELONE - PERPIGNAN | 194     | Trajet court  |
| TOULOUSE - PERPIGNAN  | 205     | Trajet moyen  |
| BARCELONE - LERIDA    | 170     | Trajet court  |

