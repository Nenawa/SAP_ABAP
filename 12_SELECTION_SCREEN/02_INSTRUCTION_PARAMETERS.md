# PARAMETERS

![](../assets/images/PARAMETERS_001.jpg)

Les `PARAMETERS` permettent de créer des champs ressemblant à des "inputs", des champs permettant à l'utilisateur final d'entrer des données comme dans un formulaire (ie. formulaire d'inscription, formumlaire de connexion, ...). Un parameter ne peut stocker qu'une valeur.

## INSTRUCTION PARAMETERS

_Exemple de déclaration_

```abap
PARAMETERS: p_vbeln TYPE vbak-vbeln,
            p_posnr TYPE vbap-posnr.
```

- `PARAMETERS:` est l'instruction qui sert déclarer le(s) `PARAMETERS` et est une instruction obligatoire. les ':' permettent des déclarations successives de paramètres d'écran.

- `p_vbeln` est le nom qui est donnée au paramétre créé afin d'avoir accès à sa valeur plus tard dans le programme.

    Par convention, un `PARAMETER` aura toujours `p_` en début de nom afin de facilement l'identifier (le 'p' signifiant `PARAMETER`), suivi du champ à récupérer `vbeln`. 
    
    Dans l'exemple ci-dessus, nous avons déclarer un `PARAMETERS` qui, comme son nom l'indique, servira pour récupérer et stocker un numéro de "Document commercial".

- `TYPE` est un `PARAMETERS` de l'instruction `PARAMETERS:` obligatoire afin de typer la valeur de ce que va entrer l'utilisateur final dans le champ.

- `vbak-vbeln` défini à la fois le type de valeur attendu dans le champ (valeur que l'utilisateur final entrera) et sert également à créer automatiquement un [MATCH-CODE](./04_INSTRUCTION_MATCHCODE.md) car, en déclarant la table-zone (`vbak-vbeln`), SAP détectera et alimentera (lorsque c'est possible) les valeurs du [MATCH-CODE](./04_INSTRUCTION_MATCHCODE.md).

Le même schéma sera appliqué pour la seconde ligne à la différence que le `PARAMETERS` sera différent :

- `p_posnr` est le nom qui est donnée au paramétre créé en seconde position afin d'avoir accès à sa valeur plus tard dans le programme.

    Par convention, ce `PARAMETER` commencera également par `p_` et sera suivi du champ à récupérer `posnr`. 
    
    Dans l'exemple ci-dessus, nous avons déclarer un `PARAMETERS` qui, comme son nom l'indique, servira pour récupérer et stocker un numéro de "poste".

## TEXTES D'INPUTS

Lorsque des `PARAMETERS` sont déclarés correctement et lors de l'exécution du programme, il apparaîtront et présenteront le nom exact identique à celui renseigné dans leur déclaration. Dans notre exemple, ils apparaitront comme ceci :

![](../assets/images/PARAMETERS_002.jpg)

Afin de modifier la description affichée à l'exécution pour faciliter la navigation de l'utilisateur final, il est possible de renseigner de manière automatique (et manuelle) la description pour cet interface.

1. Dans le programme, cliquer sur "Saut", puis sélectionner "Eléménts de textes".

    ![](../assets/images/PARAMETERS_003.jpg)

2. Une fois la nouvelle fenêtre apparue, aller dans l'onglet 'Textes de sélection'

    ![](../assets/images/PARAMETERS_004.jpg)

3. Vous pouvez alors choisir :

    - d'inscrire un texte manuellement dans les zones situées à droite des `PARAMETERS` mais il faudra éventuellement créer des traductions spécifiques pour ces descriptions (méthode à utiliser si spécifiée dans la spécification) :

        ![](../assets/images/PARAMETERS_005.jpg)

    - Choisir l'affiliation de description de manière automatique en prenant celles en référence au [DDIC](../09_DDIC/01_DICTIONNAIRE_DE_DONNEES.md). Cette possibilité ne fonctionne que si le type des `PARAMETERS` sont défini via table-zone (ie vbak-vbeln) cependant, l'avantage est que SAP se chargera alors de modifier automatique les traductions qu'importe la langue de connexion de l'utilisateur. Cette version est donc privilégiée par défaut :

        ![](../assets/images/PARAMETERS_006.jpg)

4. Activer

    ![](../assets/images/PARAMETERS_007.jpg)

    ![](../assets/images/PARAMETERS_008.jpg)

    ![](../assets/images/PARAMETERS_009.jpg)

    Les descriptions automatiques apparaitront dans les champs.

5. Retour arrière

    ![](../assets/images/PARAMETERS_010.jpg)

6. Activer/exécuter

    ![](../assets/images/PARAMETERS_011.jpg)

7. Résultat :

    ![](../assets/images/PARAMETERS_012.jpg)