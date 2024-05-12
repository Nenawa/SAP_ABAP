# **DELETE DBTAB FROM**

Cette requête permet de supprimer une ou plusieurs lignes de la [TABLE](../../09_Tables_DB/01_Tables.md) de la [BASE DE DONNEES]() soit via une [STRUCTURE](../../10_Tables_Internes/01_Tables_Internes.md), soit via une [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md), et de mettre à jour deux variables système :

- [SY-SUBRC](../../help/02_SY-SYSTEM.md) pour indiquer l'état de l'opération :

  - 0 - la ou les lignes ont été correctement insérées.

  - 4 - une ou plusieurs erreurs se sont produites pendant le traitement.

- [SY-DBCNT](../../help/02_SY-SYSTEM.md) retourne le nombre de ligne insérées

```JS
DELETE dbtab FROM struct.
DELETE dbtab FROM TABLE itab
```

Elle se comporte de la même manière qu'un [INSERT](../../12_Instructions_dbtab/02_Insert/README.md) et un [UPDATE](../../12_Instructions_dbtab/03_Update/README.md) : le système va vérifier si la ou les clé(s) primaire(s) définie(s) dans la [STRUCTURE](../../10_Tables_Internes/01_Tables_Internes.md) `struct` ou la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) `itab` existe(nt) dans la [TABLE](../../09_Tables_DB/01_Tables.md) de la [BASE DE DONNEES]() `dbtab`. Si celle-ci existe, alors la ligne sera supprimée, sinon elle sera mise de côté et retournera la variable système [SY-SUBRC](../../help/02_SY-SYSTEM.md) sera égale à `4`.
