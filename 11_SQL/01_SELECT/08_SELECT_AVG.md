# AVG

Plusieurs fonctions d'agrégats existent sur SAP pour les requêtes [SQL](./01_SQL.md).

`AVG ( [DISTINCT] col )` détermine la moyenne de la colonne sélectionnée (`AVG` pour `Average` en anglais).

Exemple

Connaître la moyenne des coûts de péage payés de tous les voyages de covoiturage effectués :

```abap
DATA lv_toll TYPE ztravel_toll.

SELECT AVG( toll )
    FROM ztravel
    INTO @lv_toll.
```

Selon les valeurs enregistrées dans le chapitre [DICTIONNAIRE DE DONNEES](../../09_DDIC/01_DICTIONNAIRE_DE_DONNEES.md), `lv_toll` aura la valeur de 13.75 : (16 + 17 + 16 + 6) / 4.

- L’option `DISTINCT` comme déjà vu sur les tables va supprimer les doublons. Ainsi le code suivant :

```abap
DATA lv_toll TYPE ztravel_toll.

SELECT AVG( DISTINCT toll )
    FROM ztravel
    INTO @lv_toll.
```

Retournera la [VARIABLE](../../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) `lv_toll` avec la valeur `13` : (16 + 17 + 6) / 3. La valeur `16` apparaissant deux fois, une des deux valeurs ne sera pas prise en compte.
