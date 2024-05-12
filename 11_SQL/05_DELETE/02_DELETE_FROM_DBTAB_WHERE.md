# **DELETE FROM DBTAB WHERE**

Il existe également une autre manière de procéder à un `DELETE` avec la clause `WHERE`.

```JS
DELETE FROM dbtab WHERE
```

_Exemple_

_Supprimer le passager avec l'identifiant `P0005` dans la table `ZPASSENGER`._

```JS
CONSTANTS: c_user_id TYPE zpassenger_id VALUE 'P0005'.

DELETE FROM zpassenger WHERE id_passenger = @c_user_id.

IF sy-subrc = 0.
  WRITE 'L''enregistrement a été supprimé avec succès'.
ELSE.
  WRITE 'Erreur lors de la suppression d''un enregistrement'.
ENDIF.
```

La [CONSTANTE](../../04_Variables/02_Constants.md) `C_USER_ID` de type `ZUSER_ID` et avec comme valeur `P0005` est créée.

La requête `DELETE` supprimera la ou les lignes de la [TABLE](../../09_Tables_DB/01_Tables.md) `ZPASSENGER` ayant pour champ `ID_PASS` égal à la [CONSTANTE](../../04_Variables/02_Constants.md). La variable [SY-SUBRC](../../help/02_SY-SYSTEM.md) étant égale à `0`, le texte `L’enregistrement a été supprimé avec succès` sera affiché et [SY-DBCNT](../../help/02_SY-SYSTEM.md) sera égal à `1`.

_Résultat à l’écran_

![](../../ressources/12_05_02_01.png)
