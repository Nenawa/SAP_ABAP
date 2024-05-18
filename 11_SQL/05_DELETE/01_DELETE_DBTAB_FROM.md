# DELETE DBTAB FROM

Cette requête permet de supprimer une ou plusieurs lignes de la [TABLE](../../10_DB_TABLES/02_TABLES.md) de la base de données soit via une structure, soit via une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md), et de mettre à jour deux variables système :

- [SY-SUBRC](../../00_HELP/02_SY_SYSTEM.md) pour indiquer l'état de l'opération :

  - 0 - la ou les lignes ont été correctement insérées.

  - 4 - une ou plusieurs erreurs se sont produites pendant le traitement.

- [SY-DBCNT](../../00_HELP/02_SY_SYSTEM.md) retourne le nombre de ligne insérées

```JS
DELETE dbtab FROM struct.
DELETE dbtab FROM TABLE itab
```

Elle se comporte de la même manière qu'un [INSERT](../02_INSERT/01_INSERT_INTO_DBTAB_VIA_STRUCTURE.md) et un [UPDATE](../03_UPDATE/01_UPDATE_DBTAB_SET.md) : le système va vérifier si la ou les clé(s) primaire(s) définie(s) dans la structure `struct` ou la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `itab` existe(nt) dans la [TABLE](../../10_DB_TABLES/02_TABLES.md) de la base de données `dbtab`. Si celle-ci existe, alors la ligne sera supprimée, sinon elle sera mise de côté et retournera la variable système [SY-SUBRC](../../00_HELP/02_SY_SYSTEM.md) sera égale à `4`.
