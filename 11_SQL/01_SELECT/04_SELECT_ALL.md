# SELECT ALL

L’option `*` signifie `tous les champs` et donc cette requête indique : sélectionner tous les champs du premier enregistrement de la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZDRIVER_CAR` et stocker dans la structure `S_DRIVER_CAR`.

Le symbole `@` défini comme `escape character` en anglais (se traduisant par `caractère d’évasion`) indique simplement que la `variable`, [TABLE](../../10_DB_TABLES/02_TABLES.md) ou structure fait partie des objets du programme et est donc externe à la base de données.

Résultat - structure S_DRIVER_CAR

| **CHAMPS**     | **VALEURS** |
| -------------- | ----------- |
| **MANDT**      | 900         |
| **ID_DRIVER**  | C0001       |
| **SURNAME**    | DEBBACHE    |
| **NAME**       | AMINH       |
| **DATE_BIRTH** | 19781216    |
| **CITY**       | TOULOUSE    |
| **COUNTRY**    | FR          |
| **CAR_BRAND**  | PEUGEOT     |
| **CAR_MODEL**  | 307         |
| **CAR_YEAR**   | 2011        |
| **CAR_COLOR**  | NOIR        |
| **CAR_ID**     | FB243TR     |
| **LANG**       | F           |

## Stockage

Il est possible également de stocker cette information dans une ou plusieurs [VARIABLES](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) en informant directement le ou les noms de colonnes :

### Sélection du nom du conducteur.

Exemple

```abap
DATA lv_surname TYPE zdriver_car-surname.

SELECT SINGLE surname
    FROM zdriver_car
    INTO @lv_surname.
```

Sélectionner le champ `SURNAME` de la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZDRIVER_NAME` et le stocker dans la [VARIABLE](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) `lv_surname`. Comme la condition de sélection n'est pas définie, le nom du conducteur de la première ligne de la [TABLE](../../10_DB_TABLES/02_TABLES.md) sera retourné dans la [VARIABLE](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md), à savoir la valeur `DEBBACHE`.

### Sélection du nom et du prénom du conducteur

Exemple

```abap
DATA: lv_surname TYPE zdriver_car-surname,
      lv_name    TYPE zdriver_car-name.

SELECT SINGLE surname, name
    FROM zdriver_car
    INTO (@lv_surname, @lv_name).
```

Sélectionner les champs `SURNAME` et `NAME` de la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZDRIVER_CAR` et les stocker respectivement dans les [VARIABLES](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) `lv_surname` et `lv_name`. Comme la condition de sélection n’est pas définie, le nom et le prénom du conducteur de la première ligne de la [TABLE](../../10_DB_TABLES/02_TABLES.md) seront retournés dans les [VARIABLES](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md).

Résultat - Valeurs des variables

| **CHAMPS**    | **VALEURS** |
| ------------- | ----------- |
| **lv_surname** | DEBBACHE    |
| **lv_name**    | AMINH       |

Dans l'ancien code [SQL](./01_SQL.md), les colonnes étaient séparées par un espace, mais avec le nouveau, elles doivent être séparées par des virgules.
