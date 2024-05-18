# FROM (AS ALIAS)

```abap
. . . FROM table. . .
```

Cette notion a déjà été et il s'agit de la version la plus simple. Il n'existe pas de nombreuses variantes du `FROM` mais une doit particulièrement être étudiée : le [JOIN](./19_JOIN.md).

## AS ALIAS

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
