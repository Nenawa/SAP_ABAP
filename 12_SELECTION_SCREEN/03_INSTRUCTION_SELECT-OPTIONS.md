# SELECT-OPTIONS

![](../assets/images/SELECT-OPTIONS_001.jpg)

Les `SELECT-OPTIONS` permettent de créer des champs ressemblant à des "inputs" de manière doublée afin de récupérer une range de valeur (plage de valeur). 

Ils permettent à l'utilisateur final d'entrer des plages de données afin de préciser une range sur laquelle le programme pourra utiliser.

## DECLARATION

### INSTRUCTION TABLES

A la différence des [PARAMETERS](./02_INSTRUCTION_PARAMETERS.md), les `SELECT-OPTIONS` nécessite une étape obligatoire en amont : définir les tables affectées par les `SELECT-OPTIONS` dans notre programme. cette étape est obligatoire, ce sans quoi SAP affichera une erreur.

En règle générale, cette déclaration se fera au même endroit que les [VARIABLES](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md), les [CONSTANTES](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/02_CONSTANTES.md), ...

_Exemple de déclaration des Tables affectées par les SELECT-OPTIONS_

```abap
TABLES: vbak, vbap.
```

Dans cet exemple, nous anticipons le fait que nos `SELECT-OPTIONS` affecteront les tables `vbak` et `vbap`. Il sera toujours nécessaire de lister toutes les tables affectées par les `SELECT-OPTIONS`.

### INSTRUCTION SELECT-OPTIONS

```abap
SELECT-OPTIONS: s_vbeln FOR vbak-vbeln,
                s_posnr FOR vbap-posnr.
```

- `SELECT-OPTIONS:` est l'instruction qui sert déclarer le(s) `SELECT-OPTIONS` et est une instruction obligatoire. les ':' permettent des déclarations successives.

- `s_vbeln` est le nom qui est donnée au `SELECT-OPTIONS` créé afin d'avoir accès à ses valeurs plus tard dans le programme.

    Par convention, un `SELECT-OPTIONS` aura toujours `s_` en début de nom afin de facilement l'identifier (le 's' signifiant `SELECT-OPTIONS`), suivi du champ à récupérer `vbeln`. 
    
    Dans l'exemple ci-dessus, nous avons déclarer un `SELECT-OPTIONS` qui, comme son nom l'indique, servira pour récupérer et stocker une à plusieurs lignes de la table concernée via leur numéro de "Document commercial".

- `FOR` est un paramètre de l'instruction `SELECT-OPTIONS` obligatoire afin de typer les valeurs de ce que va entrer l'utilisateur final dans le champ. Le `FOR` (au contraire du [PARAMETERS](./02_INSTRUCTION_PARAMETERS.md) avec son `TYPE`) définira pour SAP qu'il s'agit potentiellement d'une range.

- `vbak-vbeln` défini à la fois le type de valeur attendu dans le(s) champ(s) (valeur(s) que l'utilisateur final entrera) et sert également à créer automatiquement un [MATCH-CODE](./04_INSTRUCTION_MATCHCODE.md) car, en déclarant la table-zone (`vbak-vbeln`), SAP détectera et alimentera (lorsque c'est possible) les valeurs du [MATCH-CODE](./04_INSTRUCTION_MATCHCODE.md).

Le même schéma sera appliqué pour la seconde ligne à la différence que le paramètre sera différent :

- `s_posnr` est le nom qui est donnée au paramétre créé en seconde position afin d'avoir accès à sa valeur plus tard dans le programme.

    Par convention, ce `SELECT-OPTIONS` commencera également par `s_` et sera suivi du champ à récupérer `posnr`. 
    
    Dans l'exemple ci-dessus, nous avons déclarer un `SELECT-OPTIONS` qui, comme son nom l'indique, servira pour récupérer et stocker un à plusieurs numéros de "poste".

## COMPORTEMENT(S) SPECIFIQUE(S)

### UNE SEULE ENTREE

Il est possible de ne renseigner qu'un seul des deux "inputs" des `SELECT-OPTIONS` auquel cas le comportement procédera comme un [PARAMETERS](./02_INSTRUCTION_PARAMETERS.md). 

### ABSENCE D'ENTREE

Si aucun des deux "inputs" n'est renseigné avec des valeurs précises, les `SELECT-OPTIONS` prendront par défaut toutes les valeurs du champ de la table indiqué derrière le paramètre `FOR`.

## TEXTES D'INPUTS

Les textes d'inputs suivent la même procédure que celle présentée dans le chapitre [PARAMETERS](./02_INSTRUCTION_PARAMETERS.md).