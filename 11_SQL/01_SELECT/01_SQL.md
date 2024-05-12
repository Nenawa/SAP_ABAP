# SQL

La définition d’une [TABLE](../../08_DB_TABLES/02_TABLES.md), faisant référence à un objet du `dictionnaire de données` ([DDIC - SE11](../../07_DDIC/02_SE11.md)), a été développée, il reste maintenant à voir comment importer les données de la Base de données et pour cela, SAP utilise le langage SQL

Le SQL (`signifiant Structured Query Language` - requête de langage structurée en français) est tout simplement le langage de programmation permettant d’accéder et de gérer les données des Base de données (ajout, modification ou suppression). Pour SAP, il a été adapté en un ensemble d’opérations ABAP appelé OpenSQL. Pour schématiser, le traitement des données ressemblerait à ceci :

Une application ABAP exécute une requête SQL. Il s’agit d’une opération permettant de traiter directement avec la Base de données, comme par exemple la lecture d’une [TABLE](../../08_DB_TABLES/02_TABLES.md), qui sera alors envoyée en OpenSQL à une interface. Celle-ci la traduira ensuite en Native SQL (langage SQL adapté pour les bases de données) afin de consulter la Base de données(), et d’importer les informations nécessaires. Elles seront enfin retournées via l’interface à l’application `ABAP` qui pourra poursuivre son traitement.

Comme vu dans le chapitre `Dictionnaire de données` ([DDIC](../../07_DDIC/01_DICTIONNAIRE_DE_DONNEES.md)), certaines [TABLES](../../08_DB_TABLES/02_TABLES.md) peuvent être configurées pour l’utilisation d’une mémoire tampom. Ainsi les données retournées par la Base de données seront stockées dans cette mémoire et consultées quand nécessaire par l’application ABAP.
