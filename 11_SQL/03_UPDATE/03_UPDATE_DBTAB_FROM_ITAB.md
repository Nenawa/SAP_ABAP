# UPDATE DBTAB FROM ITAB

Cette syntaxe permet de mettre à jour la [TABLE](../../10_DB_TABLES/02_TABLES.md) de la base de données `dbtab` à partir de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `itab`. Comme pour le `FROM` avec structure, le système va chercher dans la [TABLE](../../10_DB_TABLES/02_TABLES.md) les enregistrements avec les mêmes [CLES PRIMAIRES](../../10_DB_TABLES/02_TABLES.md) définies dans la [TABLE](../../10_DB_TABLES/02_TABLES.md), et s’il ne trouve rien, il retournera un code retour égal à `4`.

_Exemple_

_Sélection de tous les enregistrements de la table `ZTRAVEL` avec le conducteur utilisant l’identifiant `C0003`, puis retrait de 5 euros pour le péage et 10 pour l’essence._

```abap
DATA: lt_travel TYPE TABLE OF ztravel.

FIELD-SYMBOLS: <lfs_travel> TYPE ztravel.

CONSTANTS: lc_id_driver TYPE zdriver_id VALUE 'C0003'.

SELECT *
  FROM ztravel
  INTO TABLE @lt_travel
  WHERE id_driver = @lc_id_driver.

IF sy-subrc = 0.

  LOOP AT lt_travel ASSIGNING <lfs_travel>.

    <lfs_travel>-toll  = <lfs_travel>-toll  - 5.
    <lfs_travel>-gasol = <lfs_travel>-gasol - 10.

  ENDLOOP.

  UPDATE ztravel FROM TABLE lt_travel.

  IF sy-subrc = 0.
    WRITE 'Mise à jour réussie de la table ZTRAVEL'.
  ELSE.
    WRITE 'Echec de la mise à jour'.
  ENDIF.

ENDIF.
```

Les éléments suivants sont déclarés en début de programme :

- la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lt_travel`

- le field symbol `<lfs_travel>`

tous les deux de `référence ZTRAVEL`, puis

- la [CONSTANTE](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/02_CONSTANTES.md) `lc_id_driver` de type `ZDRIVER_ID` avec pour valeur `C0003`

Les enregistrements de la [TABLE](../../09_Tables_DB/01_Tables.md) `ZTRAVEL` sont ensuite sélectionnés avec le champ `ID_DRIVER` égal à la [CONSTANTE](../../04_Variables/02_Constants.md) `lc_id_driver`, puis stockés dans la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lt_travel`. Chaque ligne de cette [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) sera lue dans une boucle de type [LOOP](../../08_INSTRUCTIONS_ITAB/09_LOOP/01_LOOP_AT_ITAB.md), et les champs `TOLL` et `GASOL` seront actualisés comme définis dans l’énoncé.

Utilisant un `field symbol`, la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `lt_travel` sera automatiquement mise à jour avec les nouvelles valeurs, et lorsque le programme sortira du [LOOP](../../08_INSTRUCTIONS_ITAB/09_LOOP/01_LOOP_AT_ITAB.md), un `UPDATE FROM TABLE` sera exécuté afin de mettre à jour la [TABLE](../../10_DB_TABLES/02_TABLES.md) de la [BASE DE DONNEES]() `ZTRAVEL`.

Un contrôle sur le code retour permettra d’afficher à l’écran le statut de cette dernière opération : [SY-SUBRC](../../00_HELP/02_SY_SYSTEM.md) égal à 0, le texte `Mise à jour réussie de la table ZTRAVEL` sera affiché, sinon ce sera `Echec de la mise à jour`.

_Enregistrement avant `UPDATE`_

| **ID_DRIVER** | **TOLL** | **GAZOL** |
| ------------- | -------- | --------- |
| C0003         | 21.00    | 45.40     |
| C0003         | 22.00    | 50.40     |

_Enregistrement après `UPDATE`_

| **ID_DRIVER** | **TOLL** | **GAZOL** |
| ------------- | -------- | --------- |
| C0003         | 16.00    | 35.40     |
| C0003         | 17.00    | 40.98     |
