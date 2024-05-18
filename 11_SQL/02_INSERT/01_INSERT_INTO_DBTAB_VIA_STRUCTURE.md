# INSERT INTO DBTAB VIA STRUCTURE

Cette requête permet d'ajouter une ou plusieurs lignes à la [TABLE](../../10_DB_TABLES/02_TABLES.md) de la base de données soit via une structure, soit via une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md), et mettre à jour deux variables système :

- [SY-SUBRC](../../00_HELP/02_SY_SYSTEM.md) pour indiquer l'état de l'opération :

  - 0 - la ou les lignes ont été correctement insérées.

  - 4 - une ou plusieurs erreurs se sont produites pendant le traitement.

- [SY-DBCNT](../../00_HELP/02_SY_SYSTEM.md) retourne le nombre de ligne insérées

```abap
INSERT INTO dbtab VALUES struct.
```

Le système va tout d'abord vérifier que la [CLE PRIMAIRE](../../10_DB_TABLES/02_TABLES.md) de l'enregistrement contenu dans la structure `struct` n'existe pas dans la [TABLE](../../10_DB_TABLES/02_TABLES.md) de la base de données `dbtab`, pour ainsi l'insérer et retourner un code retour à 0. Si la [CLE PRIMAIRE](../../10_DB_TABLES/02_TABLES.md) existe, l'enregistrement ne sera pas ajouté et le code retour sera égal à 4.

_Exemple_

_Insérer un nouveau passager dans la table `ZPASSENGER`._

```abap
DATA: ls_passager TYPE zpassenger.

ls_passager-id_passenger = 'P0005'.
ls_passager-surname      = 'THIERRY'.
ls_passager-name         = 'ROMAIN'.
ls_passager-date_birth   = '19930324'.
ls_passager-city         = 'MONTPELLIER'.
ls_passager-country      = 'FR'.
ls_passager-lang         = 'F'.

INSERT INTO zpassenger VALUES ls_passager.

IF sy-subrc = 0.
  WRITE 'Nouvel enregistrement créé avec succès'.
ELSE.
  WRITE 'Echec lors de la création d''un nouvel enregistrement'.
ENDIF.
```

_Enregistrement inséré_

| **ID_PASS** | **SURNAME** | **NAME** | **DATE_BIRTH** | **CITY**    | **COUNTRY** | **LANG** |
| ----------- | ----------- | -------- | -------------- | ----------- | ----------- | -------- |
| P0005       | THIERRY     | ROMAIN   | 19930324       | MONTPELLIER | FR          | F        |
