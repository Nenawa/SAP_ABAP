# **INSERT INTO DBTAB VIA STRUCTURE**

Cette requête permet d'ajouter une ou plusieurs lignes à la [TABLE](../../09_Tables_DB/01_Tables.md) de la [BASE DE DONNEES]() soit via une [STRUCTURE](../../10_Tables_Internes/01_Tables_Internes.md), soit via une [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md), et mettre à jour deux variables système :

- [SY-SUBRC](../../help/02_SY-SYSTEM.md) pour indiquer l'état de l'opération :

  - 0 - la ou les lignes ont été correctement insérées.

  - 4 - une ou plusieurs erreurs se sont produites pendant le traitement.

- [SY-DBCNT](../../help/02_SY-SYSTEM.md) retourne le nombre de ligne insérées

```JS
INSERT INTO dbtab VALUES struct.
```

Le système va tout d'abord vérifier que la [CLE PRIMAIRE](../../10_Tables_Internes/06_Primary_Key.md) de l'enregistrement contenu dans la structure `struct` n'existe pas dans la [TABLE](../../09_Tables_DB/01_Tables.md) de la [BASE DE DONNEES]() `dbtab`, pour ainsi l'insérer et retourner un code retour à 0. Si la [CLE PRIMAIRE](../../10_Tables_Internes/06_Primary_Key.md) existe, l'enregistrement ne sera pas ajouté et le code retour sera égal à 4.

_Exemple_

_Insérer un nouveau passager dans la table `ZPASSENGER`._

```JS
DATA: s_passager TYPE zpassenger.

s_passager-id_passenger = 'P0005'.
s_passager-surname      = 'THIERRY'.
s_passager-name         = 'ROMAIN'.
s_passager-date_birth   = '19930324'.
s_passager-city         = 'MONTPELLIER'.
s_passager-country      = 'FR'.
s_passager-lang         = 'F'.

INSERT INTO zpassenger VALUES s_passager.

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

_Résultat à l'écran_

![](../../ressources/12_02_01_01.png)
