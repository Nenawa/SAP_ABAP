# WHERE EXISTS

```abap
EXISTS ss_requête
```

Ici, la sélection va vérifier la validité d'un résultat s'il appartient à une `sous-requête`.

_Exemple_

_Afficher le nom et le prénom de tous les conducteurs utilisant également le coivoiturage en tant que passager._

```abap
SELECT surname,
       name,
       date_birth,
       city,
       country
  FROM zdriver_car AS d
  INTO TABLE @DATA(lt_driver)
  WHERE EXISTS ( SELECT * FROM zpassenger
                   WHERE surname = d~surname
                     AND name    = d~name ).

DATA ls_driver LIKE LINE OF lt_driver.

LOOP AT lt_driver INTO ls_driver.
  WRITE:/ ls_driver-surname, ls_driver-name, ls_driver-date_birth,
          ls_driver-city,    ls_driver-country.
ENDLOOP.
```

A noter qu'un [ALIAS](./18_FROM_ALIAS.md) pour la table `ZDRIVER_CAR` a été créé afin qu'il n'y ait pas d'ambiguïté dans la sous-requête.
