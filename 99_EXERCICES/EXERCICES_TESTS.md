# EXERCICES

## PARTIE I - DECLARATIONS & ATTRIBUTIONS

### REGLE GLOBALE & CONVENTIONS

> Dans le programme: 
>
> - Séparer chaque règle générale par une balise commentée.
>
> - Les déclarations devront respecter les conventions de nommage (locale) et devront être déclaré uniquement entre les balises commentées 'DECLARATIONS' et 'PROCESSING'.
>
> - Utiliser régulièrement la fonctionnalités du 'Pretty Printer'.

### REGLE GENERALE 1 : CREATION DU PROGRAMME

Version simplifiée :

> A. Créer un programme en respectant la convention de nommage "ZXXX_TEST_001" et les critères suivants
>
> - Le XXX sera a remplacer par le trigramme du développeur
>
> - Le programme devra être lié au package 'ZAELION' et enregistrer dans votre OT
>
> - Le programme devra avoir la description suivante : 'Programme d'exercices récapitulatif'
>
> B. Une fois le programme créé, ne pas oublier l'instruction 'START-OF-SELECTION' à positionner en dessous de l'instruction 'REPORT'.
>
> - Créer des balises commentées pour séparer les 'DECLARATIONS' du 'PROCESSING' et respecter ces emplacements dans les traitements futurs.

Version un peu plus réaliste :

> A. Créer un Report en respectant la convention de nommage "ZXXX_TEST_001" et les critères suivants :
>
> - Classe de développement/package : ZAELION
>
> - OT : votre OT
>
> - Créer des balises commentées pour séparer les 'DECLARATIONS' du 'PROCESSING'.

### REGLE GENERALE 2 : DECLARATIONS

Version simplifiée :

> A. Déclarez les variables suivantes en local :
> 
> | VARIABLE         | TYPE    | VALEUR |
> |------------------|---------|--------|
> | numero_doc_achat | CHAR 10 |        |
> | societe          | CHAR 4  |        |
> | date_creation    | DATE    |        |
> | dernier_poste    | NUMC 5  |        |
> | numero_poste_1   | CHAR 40 |        |
> | numero_poste_2   | CHAR 40 |        |
> | numero_poste_3   | CHAR 40 |        |
> | numero_poste_4   | CHAR 40 |        |
> | split_pattern    | CHAR 40 |        |
> | item_1           | CHAR 40 |        |
> | item_2           | CHAR 40 |        |
> | item_3           | CHAR 40 |        |
> | item_4           | CHAR 40 |        |
>
> B. Déclarez la(les) constante(s) suivante(s) :
> 
> | CONSTANTE   | TYPE   | VALEUR                   |
> |-------------|--------|--------------------------|
> | doc_achat   | STRING | En-tête document d'achat |
> | post_achat  | STRING | Poste document d'achat   |
> | designation | STRING | AAA_BKR_300              |

Version un peu plus réaliste :

> A. Rechercher la table SAP "En-tête document d'achat" (SE11) et déclarer en local dans le Report les variables dont les descriptions respectives sont listées dans la table ci-dessous en respectant les critères suivants :
>
> - Nom des variables correspondant au champ/zone de la table
>
> - Le TYPE doit être l''Elément de donnée' du champ ou typé 'table-zone' (exemple MARA-MATNR) - au choix
>
> | VARIABLE | TYPE | VALEUR | DESCRIPTION DU CHAMP DANS LA TABLE   |
> |----------|------|--------|--------------------------------------|
> |          |      |        | Numéro du document d'achat           |
> |          |      |        | Société                              |
> |          |      |        | Date de création du document d'achat |
> |          |      |        | Dernier numéro de poste              |
>
> B. Déclarez la(les) constante(s) suivante(s) :
> 
> | CONSTANTE   | TYPE   | VALEUR                   |
> |-------------|--------|--------------------------|
> | doc_achat   | STRING | En-tête document d'achat |
> | post_achat  | STRING | Poste document d'achat   |
> | designation | STRING | AAA_BKR_300              |

### REGLE GENERALE 3 : ATTRIBUTIONS DES VALEURS

Version simplifiée :

> A. Sous la balise commentée 'PROCESSING', attribuer en dessous de la balise commentée 'PROCESSING' les valeurs suivantes aux différentes variables déclarées précédemment :
> 
> | VARIABLE         | TYPE    | VALEUR      |
> |------------------|---------|-------------|
> | numero_doc_achat | CHAR 10 | 4500000001  |
> | societe          | CHAR 4  | 1710        |
> | date_creation    | DATE    | SY-DATUM    |
> | dernier_poste    | NUMC 5  | 4           |
> | item_1           | CHAR 40 | Frame       |
> | item_2           | CHAR 40 | Handle bars |
> | item_3           | CHAR 40 | Seat        |
> | item_4           | CHAR 40 | Wheels      |

Version un peu plus réaliste :

> A. Dans la partie 'PROCESSING', attribuer les valeurs suivantes aux différentes variables : 
> 
> | VARIABLE | TYPE | VALEUR     | DESCRIPTION DU CHAMP DANS LA TABLE   |
> |----------|------|------------|--------------------------------------|
> | ?        | ?    | 4500000001 | Numéro du document d'achat           |
> | ?        | ?    | 1710       | Société                              |
> | ?        | ?    | SY-DATUM   | Date de création du document d'achat |
> | ?        | ?    | 4          | Dernier numéro de poste              |

### REGLE GENERALE 4 : TRAITEMENT DES VALEURS

Version simplifiée :

> A. A l'aide de l'instruction 'CONCATENATE', concatener la variable 'numero_doc_achat', '0000' et '1' dans la variable 'numero_poste_1'.
>
> - répéter l'opération pour les variables 'numero_poste_2', 'numero_poste_3' et 'numero_poste_4' en changeant le dernier caractère par '2', '3' et '4'.
>
> B. A l'aide de l'instruction 'CONDENSE', condenser les variables 'numero_poste_1', 'numero_poste_2', 'numero_poste_3' et 'numero_poste_4' pour qu'il n'y ait pas d'espace. (exemple : numero_post_1 aura pour identifiant 450000000100001)

Version un peu plus réaliste :

> A. Créer les identifiants des Postes de ce document pour un nombre de fois égal au nombre de poste du document d'achat 4500000001.
> 
> - L'identifiant devra correspondre à la valeur de 'numero_doc_achat' immédiatement suivi de '0000*' où Le '*' correspond au numéro du poste (exemple : numero_post_1 aura pour identifiant 450000000100001).
>
> - Stocker ces identifiants dans des variables locales nommée 'numero_poste_*'.

### REGLE GENERALE 5 : TRAITEMENT DES VALEURS

Version simplifiée :

> A. A l'aide de l'instruction 'SPLIT', séparer la constante 'designation' au séparateur '_' dans 3 variables qui seront à créer pour l'occasion ('split_1', 'split_2' et 'split_3').
>
> B. A l'aide de l'instruction 'CONCATENATE', concatener les variables 'split_2' et 'split_3' avec le séparateur '-'. Le résultat devra être stocké dans la variable 'split_pattern'.

Version un peu plus réaliste :

> Séparer la constante 'designation' au séparateur '_' et concaténer les variables pour former le pattern 'BKR-300' dans une variable nommée 'split_pattern'.

### REGLE GENERALE 6 : CONDITIONS

Version simplifiée :

> A. A l'aide de l'instruction 'IF', vérifier que toutes les variables 'numero_poste_*' ne sont pas vide. Si ce n'est pas le cas, utiliser l'instruction 'MESSAGE' de 'TYPE' 'E' 'DISPLAY LIKE' 'I' pour faire apparaître le message suivant : "Numéro(s) de poste inexistant ou vide".
>
> B. Si la première condition est valide, alors, toujours à l'aide de l'instruction 'IF', vérifier pour chaque variable 'numero_poste_*' correspond au pattern suivant '45000000010000'. 
>
> - Si l'une des variables ne respecte pas le pattern, utiliser l'instruction 'MESSAGE' de 'TYPE' 'E' 'DISPLAY LIKE' 'W' avec comme message sa valeur.

Version un peu plus réaliste :

> Vérifier la validité des variables 'numero_poste_*'. Si invalide, faire afficher le message d'erreur "Numéro(s) de poste inexistant ou vide" dans une fenêtre popup.
>
> - Le texte "Numéro(s) de poste inexistant ou vide" devra être écrit dans les éléments de texte à l'identifiant '001'.