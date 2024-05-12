# **UPDATE DBTAB FROM ITAB**

Cette syntaxe permet de mettre à jour la [TABLE](../../09_Tables_DB/01_Tables.md) de la [BASE DE DONNEES]() `dbtab` à partir de la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) `itab`. Comme pour le `FROM` avec [STRUCTURE](../../10_Tables_Internes/01_Tables_Internes.md), le système va chercher dans la [TABLE](../../09_Tables_DB/01_Tables.md) les enregistrements avec les mêmes [CLES PRIMAIRES](../../10_Tables_Internes/06_Primary_Key.md) définies dans la [TABLE](../../09_Tables_DB/01_Tables.md), et s’il ne trouve rien, il retournera un code retour égal à `4`.

_Exemple_

_Sélection de tous les enregistrements de la table `ZTRAVEL` avec le conducteur utilisant l’identifiant `C0003`, puis retrait de 5 euros pour le péage et 10 pour l’essence._

```JS
DATA: t_travel TYPE TABLE OF ztravel.

FIELD-SYMBOLS: <fs_travel> TYPE ztravel.

CONSTANTS: c_id_driver TYPE zdriver_id VALUE 'C0003'.

SELECT *
  FROM ztravel
  INTO TABLE @t_travel
  WHERE id_driver = @c_id_driver.

IF sy-subrc = 0.

  LOOP AT t_travel ASSIGNING <fs_travel>.

    <fs_travel>-toll  = <fs_travel>-toll  - 5.
    <fs_travel>-gasol = <fs_travel>-gasol - 10.

  ENDLOOP.

  UPDATE ztravel FROM TABLE t_travel.

  IF sy-subrc = 0.
    WRITE 'Mise à jour réussie de la table ZTRAVEL'.
  ELSE.
    WRITE 'Echec de la mise à jour'.
  ENDIF.

ENDIF.
```

Les éléments suivants sont déclarés en début de programme :

- la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) `T_TRAVEL`

- le field symbol `<FS_TRAVEL>`

tous les deux de `référence ZTRAVEL`, puis

- la [CONSTANTE](../../04_Variables/02_Constants.md) `C_ID_DRIVER` de type `ZDRIVER_ID` avec pour valeur `C0003`

Les enregistrements de la [TABLE](../../09_Tables_DB/01_Tables.md) `ZTRAVEL` sont ensuite sélectionnés avec le champ `ID_DRIVER` égal à la [CONSTANTE](../../04_Variables/02_Constants.md) `C_ID_DRIVER`, puis stockés dans la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) `T_TRAVEL`. Chaque ligne de cette [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) sera lue dans une boucle de type [LOOP](../../11_Instructions_itab/09_Loop/README.md), et les champs `TOLL` et `GASOL` seront actualisés comme définis dans l’énoncé.

Utilisant un `field symbol`, la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) `T_TRAVEL` sera automatiquement mise à jour avec les nouvelles valeurs, et lorsque le programme sortira du [LOOP](../../11_Instructions_itab/09_Loop/README.md), un `UPDATE FROM TABLE` sera exécuté afin de mettre à jour la [TABLE](../../09_Tables_DB/01_Tables.md) de la [BASE DE DONNEES]() `ZTRAVEL`.

Un contrôle sur le code retour permettra d’afficher à l’écran le statut de cette dernière opération : [SY-SUBRC](../../help/02_SY-SYSTEM.md) égal à 0, le texte `Mise à jour réussie de la table ZTRAVEL` sera affiché, sinon ce sera `Echec de la mise à jour`.

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

_Résultat à l'écran_

![](../../ressources/12_03_03_01.png)
