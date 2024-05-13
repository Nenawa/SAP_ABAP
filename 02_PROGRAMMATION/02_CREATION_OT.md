# CREATION D'UN ORDRE DE TRANSPORT

Sur SAP, un ``OT`` est une abréviation couramment utilisée pour désigner un ``Ordre de Transport``. Les ``ordres de transport`` sont des enregistrements dans le système SAP qui contiennent des objets à transporter d'un système SAP à un autre. Ces objets peuvent inclure des programmes, des rapports, des formulaires, des tables, des configurations et d'autres éléments développés ou modifiés dans un système SAP.
>
Les ``ordres de transport`` sont utilisés pour organiser et contrôler le transfert d'objets entre différents systèmes SAP, généralement entre des systèmes de développement, de test et de production. Ils permettent de garantir l'intégrité et la cohérence des objets SAP lorsqu'ils sont déployés dans différents environnements.

## CONVENTIONS

Lors de la création, renseigner le nom/description de l’OT en respectant les conventions de nommage du client concerné. Dans notre cas, on utilisera cette norme :

- FGI = Trigramme du développeur
- W = OT de Workbench
- Description du sujet à l’origine de cet OT

![](../assets/images/OT_016.jpg)

## CREATION

Aller dans la Transaction ``SE10``

![](../ASSETS/images/OT_001.jpg)

1. Créer...

    ![](../ASSETS/images/OT_002.jpg)

2. Sélectionner l'ordre (Workbench pour Tech) et valider.

    ![](../ASSETS/images/OT_003.jpg)

3. Renseigner la Description synthétique obligatoire

    ![](../ASSETS/images/OT_004.jpg)

4. (Optionnel) Si l'OT est affecté à un projet, vous pouvez le lier à ce dernier à cette étape.

5. Enregistrer

## VISUALISATION OT

Aller dans la Transaction ``SE10``

1. Entrer le créateur de l'OT désiré (ou * pour tout afficher)

    ![](../ASSETS/images/OT_005.jpg)

2. Afficher

    ![](../ASSETS/images/OT_006.jpg)

3. Visualiser

    ![](../ASSETS/images/OT_007.jpg)

## COMPARAISON LES VERSIONS D'OBJETS D'UN OT

1. Double clic sur l'OT pour visualiser les objets.

    ![](../ASSETS/images/OT_009.jpg)

2. Double clic sur l'objet à comparer.

    ![](../ASSETS/images/OT_010.jpg)

3. Utilitaires Versions Gestion des versions

    ![](../ASSETS/images/OT_008.jpg)

4. Sélectionner (avec ``CTRL``) les versions à comparer (mauvais exemple ici car il n'y a qu'une seule version)

    ![](../ASSETS/images/OT_011.jpg)

5. Comparer

    ![](../ASSETS/images/OT_012.jpg)

## MODIFICATION SUR UN OT

1. Créer un nouvel ``OT`` ou utiliser un ``OT`` spécifié préalablement.

2. Ouvrir l'objet à modifier dans la transaction adaptée (SE80, SE24, ...)

3. Enregsitrer et activer l'objet sous le nouvel OT.

## LIBERER UN OT

1. Pour chaque sous-objets de l'OT à libérer, sélectionner le (clique simple).

    ![](../ASSETS/images/OT_013.jpg)

2. Libérer le sous-objet en cliquant sur l'icône.

    ![](../ASSETS/images/OT_014.jpg)

3. Répéter pour chaque sous-objet de l'OT.

4. Enfin, sélectionner l'OT.

    ![](../ASSETS/images/OT_015.jpg)

5. Libérer l'OT

    ![](../ASSETS/images/OT_016.jpg)

6. La fenètre change et fera état de la progression du transport de l'OT.
    Il sera nécessaire parfois d'actualiser pour vérifier que le transport progresse et se termine correctement.

Après avoir été libéré, l’OT va suivre un certainement "cheminement" (passage sur le système de qualification, validation par les fonctionnels etc…). Ce cheminement sera défini par un package (classe de développement) qui doit être renseigné car il spécifie une route de transport et permet d’organiser et de regrouper les différents développements.

Exemples :

- ZFR pour tous les programmes d’un pays en particulier.

- ZX pour tous les objets relatifs à un projet X

- ZSD pour tous les objets relatifs au module SD
