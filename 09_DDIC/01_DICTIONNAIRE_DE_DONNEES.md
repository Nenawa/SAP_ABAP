# DICTIONNAIRE DE DONNEES

Le `DDIC` (Dictionnaire de Données), ou `Data Dictionary` en anglais, est une composante fondamentale de SAP. Il s'agit d'un ensemble d'outils et de fonctionnalités intégrés dans le système SAP qui permettent la gestion centralisée des données et de la structure des données utilisées dans l'environnement SAP.

Voici quelques points importants à retenir concernant le `DDIC` dans SAP :

- `Gestion des objets de données` : Le DDIC est utilisé pour gérer les objets de données dans SAP, tels que les [TABLES DE LA BASE DE DONNEES](../08_DB_TABLES/02_TABLES.md), les [VUES](../08_DB_TABLES/05_VUES.md), les [TYPES DE DONNEES](../07_DDIC/05_ELEMENTS_DE_DONNEES.md), les [DOMAINES DE DONNEES](../07_DDIC/04_DOMAINES.md), etc. Il permet la création, la modification et la suppression de ces objets de manière centralisée.

- `Définition des structures de données` : Le DDIC permet de définir la structure des données utilisées dans SAP, y compris les [CHAMPS](./03_CHAMPS.md), les [CLES PRIMAIRES](../08_DB_TABLES/02_TABLES.md), les contraintes, les relations entre les tables, etc. Il assure la cohérence et l'intégrité des données dans tout le système.

- `Réutilisation des données` : Le DDIC favorise la réutilisation des données en permettant la création de structures de données standardisées et partagées à travers différentes applications et modules SAP. Cela contribue à la cohérence et à l'intégrité des données dans l'ensemble de l'entreprise.

- `Documentation des objets de données` : Le DDIC permet de documenter les objets de données dans SAP en fournissant des descriptions détaillées, des commentaires et d'autres métadonnées associées aux objets. Cela facilite la compréhension et la maintenance des données par les développeurs, les administrateurs et les utilisateurs SAP.

- `Intégration avec ABAP` : Le DDIC est étroitement intégré avec le langage de programmation ABA (Advanced Business Application Programming) utilisé dans SAP. Les développeurs peuvent accéder aux objets de données définis dans le DDIC à partir de leurs programmes ABAP et les manipuler selon les besoins de l'application.

Concrètement, l’essentiel du travail d’un développeur SAP va consister à traiter les données du client :

- Récupérer les données.
- Les afficher.
- Les créer.
- Les modifier.

Il est donc nécessaire de comprendre comment sont gérées ces données et sous quelle(s) forme(s).

## STOCKAGE DES DONNEES

Toutes les données manipulées dans SAP (applicatives, programmes, écrans, formulaires…) sont stockées dans des [DB TABLES](../08_DB_TABLES/02_TABLES.md).

## PROCESSEUR ABAP

Un `programme ABAP` est simplement une collection d’instructions déclenchées sur des événements depuis le processeur ABAP/4. C’est un langage interprété avec pour particularité une phase d’activation avant l’exécution.

## ACCES AU DICTIONNAIRE DE DONNEES (DDIC)

L'accès au DDIC se fait via la [TRANSACTION SE11](./02_SE11.md) ou via le menu standard SAP.

Le dictionnaire contient des éléments et des outils permettant d’organiser, stocker, visualiser et gérer les données contenues dans les tables de la base de données .

## DONNEES

La visualisation des données se fait via la [TRANSACTION SE16N](../08_DB_TABLES/01_SE16N.md).

## GESTION DES TABLES DU DDIC

La gestion des tables se fait via :

- `Transaction SM31` : pour les tables standards
- `Transaction SM30` : pour les tables spécifiques
