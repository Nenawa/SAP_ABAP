# INCLUDE

Deux notions très importantes du [DDIC](../07_DDIC/01_DICTIONNAIRE_DE_DONNEES.md) sont : l’`INCLUDE` (pouvant être traduit par `inclusion` en français) et l’[APPEND](./04_APPEND.md) (`ajout`) de [STRUCTURE](../07_DDIC/06_STRUCTURES.md). Ces deux notions ont le même but, qui est de rajouter des champs supplémentaires.

L’`INCLUDE` et l’[APPEND](./04_APPEND.md) sont aussi bien utilisés pour une [TABLE](./02_TABLES.md) que pour une [STRUCTURE](../07_DDIC/06_STRUCTURES.md). Ce qui sera traité maintenant vaut donc également pour les [STRUCTURE](../07_DDIC/06_STRUCTURES.md) du [DDIC](../07_DDIC/01_DICTIONNAIRE_DE_DONNEES.md).

- `INCLUDE de structure` : additionne les champs venus d’une [STRUCTURE](../07_DDIC/06_STRUCTURES.md) existante. Par exemple, la [TABLE](./02_TABLES.md) `MARA`, utilise l’`INCLUDE EMARA` pour insérer tous les champs existants de cette [STRUCTURE](../07_DDIC/06_STRUCTURES.md). Ainsi si cette dernière est mise à jour (suppression, ajout ou modification de champs), la [TABLE](./02_TABLES.md) `MARA` sera impactée et subira automatiquement cette même actualisation.

  ![](../assets/images/INCLUDE_001.jpg)

Lors de l’utilisation d’un `INCLUDE` ou d’un [APPEND](./04_APPEND.md), les champs listés sont de couleur bleue, signifiant qu’ils ne sont pas directement liés à la [TABLE](./02_Tables.md) mais qu’ils font partie d’un ensemble extérieur.

Même si cette modification reste propre à la [TABLE](./02_Tables.md) ou [STRUCTURE](../07_DDIC/06_STRUCTURES.md), il est possible d’imaginer, pour reprendre l’exemple de la [TABLE](./02_Tables.md) `MARA` et de son `INCLUDE EMARA`, le degré d’impact qu’aurait l’ajout d’un [APPEND](./04_APPEND.md) de [STRUCTURE](../07_DDIC/06_STRUCTURES.md) à cette dernière. Il resterait local mais aurait automatiquement des répercussions sur la [TABLE](./02_TABLES.md) `MARA`.

    L’include et l’append sur des structures ou tables standards sont des cas très sensibles du DDIC qui doivent être manipulés avec beaucoup de précaution.
