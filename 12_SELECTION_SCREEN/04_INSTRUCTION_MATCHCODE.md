# MATCH-CODE

## COMPORTEMENT STANDARD

Les `MATCH-CODES` sont des [AIDES A LA RECHERCHE](../10_DB_TABLES/07_AIDE_A_LA_RECHERCHE.md). Autrement dit, ils permettent à un utilisateur d'afficher une liste de choix afin de faciliter sa sélection de données.

Par défaut, lorsque c'est possible et dans le cadre des [SELECTION-SCREEN](./01_ECRAN_DE_SELECTION.md), ils apparaitront à droite des "inputs" d'un écran de sélection si le typage (`TYPE` pour les `PARAMETERS` et `FOR` pour les `SELECT-OPTIONS`) a été fait avec la table-champ.

_Exemple_

Si les `PARAMETERS` suivant sont déclarés ainsi : 

```abap
PARAMETERS: p_vbeln TYPE vbak-vbeln,
            p_posnr TYPE vbap-posnr.
```

L'interface utilisateur proposera par défaut les `MATCH-CODES` affilié à la zone de la table ciblée par le typage :

![](../assets/images/PARAMETERS_012.jpg)

![](../assets/images/PARAMETERS_013.jpg)

Si, au contraire, le typage fait référence à un élément de donnée :

```abap
PARAMETERS: p_vbeln TYPE vbeln,
            p_posnr TYPE posnr.
```

SAP ne saura pas définir la table de référence et ne proposera pas de `MATCH-CODES` affilié.

![](../assets/images/PARAMETERS_014.jpg)

## MATCH-CODES SPECIFIQUE

Il est possible de créer des `MATCH-CODES` spécifiques pour un [PARAMETERS](./02_INSTRUCTION_PARAMETERS.md) et/ou un [SELECT-OPTIONS](./03_INSTRUCTION_SELECT-OPTIONS.md).

En suivante la procédure de création des [AIDES A LA RECHERCHE](../10_DB_TABLES/07_AIDE_A_LA_RECHERCHE.md), il sera possible d'ajouter des colonnes à l'affichage des `MATCH-CODES`. Il faudra néanmoins créer les `MATCH-CODES` spcifiques avant de les "appeler" dans le programme à l'aide du paramètre `MATCHCODE OBJECT z_nom_du_match_code_cree` à insérer dans l'instruction.

_Exemple_

```abap
PARAMETERS: p_matnr TYPE mara-matnr MATCHCODE OBJECT zar_mara.
```

Dans cet exemple, le `PARAMETERS` `p_matnr` a été déclaré et est typé `mara-matnr`. 

Par défaut, SAP afficherai l'aide à la recherche standard :

![](../assets/images/PARAMETERS_016.jpg)

Toutefois, en ajoutant le paramètre d'instruction `MATCHCODE OBJECT` suivi du nom du `MATCH-CODES` créé en SE11 avec l'[AIDE A LA RECHERCHE](../10_DB_TABLES/07_AIDE_A_LA_RECHERCHE.md) soit `zar_mara` (`zar_` étant la convention de nommage) :

```abap
PARAMETERS: p_matnr TYPE mara-matnr MATCHCODE OBJECT zar_mara.
```

SAP affichera l'aide à la recherche spécifiquement créée :

![](../assets/images/PARAMETERS_015.jpg)