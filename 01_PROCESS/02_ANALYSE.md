# ANALYSE

L'étape suivante consiste à analyser ce document fonctionnel et à se poser les questions suivantes :

- La demande est-elle techniquement réalisable ?

- Toutes les informations (sélections de [DBTAB](../08_DB_TABLES/02_TABLES.md), entrées et sorties des données...) sont-elles présentes ?

- Si indiqués, les liens entre les différentes sélections de tables ([JOIN](../09_SQL/01_SELECT/19_Join.md)) sont-ils cohérents ?

Si une réponse est négative, le document doit alors être retourné au fonctionnel qui devra mettre à jour les informations manquantes. Si cependant tout est exploitable, il est alors temps de se pencher sur la solution technique à adopter :

- Est-il nécessaire d'utiliser une Programmation Orientée Objet ?

- Y a-t-il un objet technique spécifique à créer (Smartforms, [DBTAB](../08_DB_TABLES/02_TABLES.md)...) ?

- Combien de traitements spécifiques existe-t-il (exemple : sélection des [DBTAB](../08_DB_TABLES/02_TABLES.md), calcul...) ?

Une fois cette étape terminée, il est temps de passer à l'élaboration de l'[ALGORITHME](./03_ALGORITHME.md).
