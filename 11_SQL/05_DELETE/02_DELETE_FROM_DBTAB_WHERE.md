# DELETE FROM DBTAB WHERE

Il existe également une autre manière de procéder à un `DELETE` avec la clause `WHERE`.

```abap
DELETE FROM dbtab WHERE
```

_Exemple_

_Supprimer le passager avec l'identifiant `P0005` dans la table `ZPASSENGER`._

```abap
CONSTANTS: lc_user_id TYPE zpassenger_id VALUE 'P0005'.

DELETE FROM zpassenger WHERE id_passenger = @lc_user_id.

IF sy-subrc = 0.
  WRITE 'L''enregistrement a été supprimé avec succès'.
ELSE.
  WRITE 'Erreur lors de la suppression d''un enregistrement'.
ENDIF.
```

La [CONSTANTE](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/02_CONSTANTES.md) `lc_user_id` de type `ZUSER_ID` et avec comme valeur `P0005` est créée.

La requête `DELETE` supprimera la ou les lignes de la [TABLE](../../10_DB_TABLES/02_TABLES.md) `ZPASSENGER` ayant pour champ `ID_PASS` égal à la [CONSTANTE](../../04_Variables/02_Constants.md). La variable [SY-SUBRC](../../00_HELP/02_SY_SYSTEM.md) étant égale à `0`, le texte `L’enregistrement a été supprimé avec succès` sera affiché et [SY-DBCNT](../../00_HELP/02_SY_SYSTEM.md) sera égal à `1`.
