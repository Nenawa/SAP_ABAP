# **MODIFY**

Cette requête permet de modifier une ou plusieurs lignes de la [TABLE](../../09_Tables_DB/01_Tables.md) de la [BASE DE DONNEES]() soit via une [STRUCTURE](../../10_Tables_Internes/01_Tables_Internes.md), soit via une [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md), et de mettre à jour deux variables système :

- [SY-SUBRC](../../help/02_SY-SYSTEM.md) indique l'état de l'opération

- [SY-DBCNT](../../help/02_SY-SYSTEM.md) retourne le nombre de lignes modifiées

```JS
MODIFY dbtab FROM struct.
MODIFY dbtab FROM TABLE itab.
```

Elle se comporte de la même manière qu'un [INSERT](../../12_Instructions_dbtab/02_Insert/README.md) et un [UPDATE](../../12_Instructions_dbtab/03_Update/README.md) : le système va vérifier si la ou les clé(s) primaire(s) définie(s) dans la [STRUCTURE](../../10_Tables_Internes/01_Tables_Internes.md) `struct` ou la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) `itab` existe(nt) dans la [TABLE](../../09_Tables_DB/01_Tables.md) de la [BASE DE DONNEES]() `sbtab`. Si celle-ci existe, alors la ligne sera modifiée ([UPDATE](../../12_Instructions_dbtab/03_Update/README.md)), sinon, elle sera créée ([INSERT](../../12_Instructions_dbtab/02_Insert/README.md)). Dans la majorité des cas, la variable système [SY-SUBRC](../../help/02_SY-SYSTEM.md) sera égale à `0`.
