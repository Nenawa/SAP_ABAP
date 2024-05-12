# **UPDATE DBTAB FROM STRUCTURE**

```JS
UPDATE dbtab FROM struct.
```

Cette instruction va mettre à jour la [TABLE](../../09_Tables_DB/01_Tables.md) de la [BASE DE DONNEES]() `dbtab` à partir de la [STRUCTURE](../../10_Tables_Internes/01_Tables_Internes.md) `wa`. Pour cela, le système va chercher dans la [TABLE](../../09_Tables_DB/01_Tables.md), l'enregistrement avec la même [CLE PRIMAIRE](../../10_Tables_Internes/06_Primary_Key.md) définie dans la [STRUCTURE](../../10_Tables_Internes/01_Tables_Internes.md), et s'il ne trouve pas l'enregistrement, il retournera un code retour égal à `4`.

_Exemple_

_Sélection d'un seul enregistrement de la table `ZTRAVEL` avec le conducteur utilisant l'identifiant `C0001`, puis ajout de 5 euros pour le péage et 10 pour l'essence._

```JS
CONSTANTS: c_id_driver TYPE zdriver_id VALUE 'C0001'.

SELECT SINGLE *
  FROM ztravel
  INTO @DATA(s_travel)
  WHERE id_driver = @c_id_driver.

IF sy-subrc = 0.

  s_travel-toll  = s_travel-toll  + 5.
  s_travel-gasol = s_travel-gasol + 10.

  UPDATE ztravel FROM s_travel.

  IF sy-subrc = 0.
    WRITE 'Mide à jour réussie'.
  ELSE.
    WRITE 'Echec de la mise à jour'.
  ENDIF.

ENDIF.
```

La [CONSTANTE](../../04_Variables/02_Constants.md) `C_ID_DRIVER` est créée avec le type `ZDRIVER_ID` et contient la valeur `C0001`. Le programme va commencer par sélectionner tout d’abord l’enregistrement souhaité avec un `SELECT SINGLE` dont le résultat sera stocké dans la [STRUCTURE](../../10_Tables_Internes/01_Tables_Internes.md) `S_TRAVEL`. Il va ensuite vérifier qu’il n’y a pas eu de problème et que le code retour de la variable système [SY-SUBRC](../../help/02_SY-SYSTEM.md) est bien égal à `0` (pour rappel, 0 tout va bien, 4 aucune donnée n’a été trouvée). Les champs `TOLL` et `GASOL` vont ensuite être calculés, et enfin la [TABLE](../../09_Tables_DB/01_Tables.md) `ZTRAVEL` sera mise à jour avec la [STRUCTURE](../../10_Tables_Internes/01_Tables_Internes.md) `S_TRAVEL`. Le code retour est une fois de plus testé pour vérifier si la mise à jour s’est bien terminée : `0` le programme affichera le texte `Mise à jour réussie`, sinon le texte `Echec de la mise à jour`.

_Enregistrement avant `UPDATE`_

| **ID_DRIVER** | **TOLL** | **GAZOL** |
| ------------- | -------- | --------- |
| C0001         | 16.00    | 40.21     |

_Enregistrement après `UPDATE`_

| **ID_DRIVER** | **TOLL** | **GAZOL** |
| ------------- | -------- | --------- |
| C0001         | 21.00    | 50.21     |

_Résultat à l'écran_

![](../../ressources/12_03_02_01.png)
