*&---------------------------------------------------------------------*
*& CONSIGNES
*&---------------------------------------------------------------------*

*REGLE GENERALE 0:
*
* - Suivre les conventions de nommage (déclarations en locale)
*
* - Prioriser la performance

*REGLE GENERALE 1 : CREATION DES TABLES LOCALES

* A. Créer une table locale standard nommée vbak (correspondant au Document commercial: données d'en-tête)
* qui comprendra les champs suivants avec comme clé non unique "vbeln" :
*
*   - vbeln de type vbeln_va (correspondant au numéro du "Document de vente")
*   - erdat de type erdat (correspondant à la "Date de création de l'enregistrement")
*   - erzet de type erzet (correspondant à l'"heure de saisie")
*   - ernam de type ernam (correspondant au "nom de l'utilisateur qui a créé l'objet")
*   - vbtyp de type vbtypl (correspondant à la "catégorie de document commercial")

* B. Créer une table locale standard nommée vbap (correspondant au données du poste du Document commercial)
* qui comprendra les champs suivants avec comme clé non unique "vbeln" et "posnr" :
*
*   - vbeln de type vbeln_va (correspondant au numéro du "Document de vente")
*   - posnr de type posnr_va (correspondant au numéro du "Poste de document de vente")
*   - matnr de type matnr (correspondant au "Numéro d'article")
*   - fkrel de type fkrel (correspondant à la description "Concerne la facture")

*ASTUCES :
*
* Etape 1: Créer une "Structure de Table" avec l'aide de l'instruction "TYPES:".
*          Si besoin, retourner dans la Tool Box et regarder comment créer une
*          structure.
*
* Etape 2: Déclarer les tables à l'aide de l'instruction "DATA:"
*          Si besoin, retourner dans la Tool Box et regarder comment créer une
*          structure.

*REGLE GENERALE 2 : ALIMENTATION DES TABLES LOCALES

*A. Dans la table locale standard vbak, entrer les données suivantes :

* - Ligne 1 :
*   - vbeln = 1000000001
*   - erdat = sy-datum
*   - erzet = sy-uzeit
*   - ernam = votre prénom
*   - vbtyp = A

* - Ligne 2 :
*   - vbeln = 1000000002
*   - erdat = sy-datum
*   - erzet = sy-uzeit
*   - ernam = votre prénom
*   - vbtyp = B

* - Ligne 3 :
*   - vbeln = 1000000003
*   - erdat = sy-datum
*   - erzet = sy-uzeit
*   - ernam = votre prénom
*   - vbtyp = C

*B. Dans la table locale standard vbap, entrer les données suivantes :

* - Ligne 1 :
*   - vbeln = 1000000001
*   - posnr = 10
*   - matnr = MZ-FG-C990
*   - fkrel = C

* - Ligne 2 :
*   - vbeln = 1000000001
*   - posnr = 20
*   - matnr = MZ-FG-M500
*   - fkrel = A

* - Ligne 3 :
*   - vbeln = 1000000001
*   - posnr = 30
*   - matnr = MZ-FG-R100
*   - fkrel = A

* - Ligne 4 :
*   - vbeln = 1000000002
*   - posnr = 10
*   - matnr = MZ-AA-TG01
*   - fkrel = B

* - Ligne 5 :
*   - vbeln = 1000000002
*   - posnr = 20
*   - matnr = MZ-AA-RT01
*   - fkrel = A

* - Ligne 6 :
*   - vbeln = 1000000002
*   - posnr = 30
*   - matnr = MZ-FG-RP01
*   - fkrel = C

* - Ligne 7 :
*   - vbeln = 1000000003
*   - posnr = 10
*   - matnr = AA-300-M
*   - fkrel = A

* - Ligne 8 :
*   - vbeln = 1000000003
*   - posnr = 20
*   - matnr = AA-400-M
*   - fkrel = B

* - Ligne 9 :
*   - vbeln = 1000000003
*   - posnr = 30
*   - matnr = AA-400-M
*   - fkrel = C

* - Ligne 10 :
*   - vbeln = 1000000003
*   - posnr = 40
*   - matnr = AA-400-M
*   - fkrel = D

*REGLE GENERALE 3 : TRAITEMENT DES DONNEES D'EN-TETE

*A. Pour le numéro du Document de vente 1000000003, afficher toutes ses données.

*&---------------------------------------------------------------------*
*& DECLARATIONS
*&---------------------------------------------------------------------*

*REGLE GENERALE 1 : CREATION DES TABLES LOCALES

* A. Créer une table locale standard nommée vbak (correspondant au Document commercial: données d'en-tête)
* avec comme clé non unique "vbeln" :

"Pour créer une table, il sera souvent nécessaire de créer
"un modèle (TYPES) qui indiquera à SAP comment structurer les champs/zones/colonnes ... de la table et/ou structure

**** DECLARATION DE LA STRUCTURE DE TABLE (MODELE)

"1ere version : avec les éléments de données en tant que TYPE
"'TYPES:' est l'instruction obligatoire pour déclarer une STRUCTURE DE TABLE.
"'TYPES:' est suivi de 'BEGIN OF' pour indiquer à SAP le début de la création de la STRUCTURE DE TABLE
"'BEGIN OF' est suivie du nom de la STRUCTURE DE TABLE.
"
"Il faudra ensuite déclarer les champs et de les typer (comme pour les variables) en suivant les indication de la consigne

"1e version : avec la table-zone en tant que type
*TYPES: BEGIN OF ty_vbak,
*         vbeln TYPE vbak-vbeln,
*         erdat TYPE vbak-erdat,
*         erzet TYPE vbak-erzet,
*         ernam TYPE vbak-ernam,
*         vbtyp TYPE vbak-vbtyp,
*       END OF ty_vbak.

"2e version : avec les éléments de données directement
TYPES: BEGIN OF ty_vbak,
         vbeln TYPE vbeln_va,
         erdat TYPE erdat,
         erzet TYPE erzet,
         ernam TYPE ernam,
         vbtyp TYPE vbtypl,
       END OF ty_vbak.
       
**** DECLARATION DE LA TABLE (A PARTIR DE LA STRUCTURE DE TABLE)

"On déclare la table lt_vbap de type standard en prenant comme modèle la structure de table ty_vbak
"On créé ensuite une structure (ligne) de la table nouvellement créée
DATA: lt_vbak TYPE STANDARD TABLE OF ty_vbak WITH NON-UNIQUE KEY vbeln,
      ls_vbak LIKE LINE OF lt_vbak.

"Il est aussi possible de déclarer la structure comme suivant:
"DATA: ls_vbak TYPE ty_vbak.

* B. Créer une table locale standard nommée vbap (correspondant au données du poste du Document commercial)
* avec comme clé non unique "vbeln" et "posnr" :

"1ere version : avec les éléments de données en tant que TYPE
"1ere version
*TYPES: BEGIN OF ty_vbap,
*         vbeln TYPE vbap-vbeln,
*         posnr TYPE vbap-erdat,
*         matnr TYPE vbap-matnr,
*         fkrel TYPE vbap-fkrel,
*       END OF ty_vbap.

"2e version : avec la table-zone en tant que type
TYPES: BEGIN OF ty_vbap,
         vbeln TYPE vbeln_va,
         posnr TYPE posnr_va,
         matnr TYPE matnr,
         fkrel TYPE fkrel,
       END OF ty_vbap.

"On déclare la table lt_vbap de type standard en prenant comme modèle la structure de table ty_vbap
"On créé ensuite une structure (ligne) de la table nouvellement créée
DATA: lt_vbap TYPE STANDARD TABLE OF ty_vbap WITH NON-UNIQUE KEY vbeln posnr,
      ls_vbap LIKE LINE OF lt_vbap.

*&---------------------------------------------------------------------*
*& PROCESSING
*&---------------------------------------------------------------------*

START-OF-SELECTION.

*REGLE GENERALE 2 : ALIMENTATION DES TABLES LOCALES

*A. Dans la table locale standard vbak, entrer les données suivantes :

  "On assigne les valeurs aux champs de la STRUCTURE (ligne)
  "avant d'ajouter la STRUCTURE dans la table
  ls_vbak-vbeln = 1000000001.
  ls_vbak-erdat = sy-datum.
  ls_vbak-erzet = sy-uzeit.
  ls_vbak-ernam = 'Fred'.
  ls_vbak-vbtyp = 'A'.

  APPEND ls_vbak TO lt_vbak.  "On ajoute la ligne dans la table concernée
  CLEAR: ls_vbak.             "On réinitialise la STRUCTURE (ligne)

  "On assigne à nouveau de nouvelles valeurs aux champs de la STRUCTURE (ligne)
  "avant d'ajouter la STRUCTURE dans la table
  ls_vbak-vbeln = 1000000002.
  ls_vbak-erdat = sy-datum.
  ls_vbak-erzet = sy-uzeit.
  ls_vbak-ernam = 'Fred'.
  ls_vbak-vbtyp = 'B'.

  APPEND ls_vbak TO lt_vbak.  "On ajoute la ligne dans la table concernée
  CLEAR: ls_vbak.             "On réinitialise la structure (ligne)

  "On assigne à nouveau de nouvelles valeurs aux champs de la STRUCTURE (ligne)
  "avant d'ajouter la STRUCTURE dans la table
  ls_vbak-vbeln = 1000000003.
  ls_vbak-erdat = sy-datum.
  ls_vbak-erzet = sy-uzeit.
  ls_vbak-ernam = 'Fred'.
  ls_vbak-vbtyp = 'C'.

  APPEND ls_vbak TO lt_vbak.  "On ajoute la ligne dans la table concernée
  CLEAR: ls_vbak.             "On réinitialise la structure (ligne)

*B. Dans la table locale standard vbap, entrer les données suivantes :

  "On assigne les valeurs aux champs de la STRUCTURE (ligne)
  "avant d'ajouter la STRUCTURE dans la table
  ls_vbap-vbeln = 1000000001.
  ls_vbap-posnr = 10.
  ls_vbap-matnr = 'MZ-FG-C990'.
  ls_vbap-fkrel = 'C'.

  APPEND ls_vbap TO lt_vbap.  "On ajoute la ligne dans la table concernée
  CLEAR: ls_vbap.             "On réinitialise la structure (ligne)

  "On assigne à nouveau de nouvelles valeurs aux champs de la STRUCTURE (ligne)
  "avant d'ajouter la STRUCTURE dans la table
  ls_vbap-vbeln = 1000000001.
  ls_vbap-posnr = 20.
  ls_vbap-matnr = 'MZ-FG-M500'.
  ls_vbap-fkrel = 'A'.

  APPEND ls_vbap TO lt_vbap.  "On ajoute la ligne dans la table concernée
  CLEAR: ls_vbap.             "On réinitialise la structure (ligne)

  "On assigne à nouveau de nouvelles valeurs aux champs de la STRUCTURE (ligne)
  "avant d'ajouter la STRUCTURE dans la table
  ls_vbap-vbeln = 1000000001.
  ls_vbap-posnr = 30.
  ls_vbap-matnr = 'MZ-FG-R100'.
  ls_vbap-fkrel = 'A'.

  APPEND ls_vbap TO lt_vbap.  "On ajoute la ligne dans la table concernée
  CLEAR: ls_vbap.             "On réinitialise la structure (ligne)

  "On assigne à nouveau de nouvelles valeurs aux champs de la STRUCTURE (ligne)
  "avant d'ajouter la STRUCTURE dans la table
  ls_vbap-vbeln = 1000000002.
  ls_vbap-posnr = 10.
  ls_vbap-matnr = 'MZ-AA-TG01'.
  ls_vbap-fkrel = 'B'.

  APPEND ls_vbap TO lt_vbap.  "On ajoute la ligne dans la table concernée
  CLEAR: ls_vbap.             "On réinitialise la structure (ligne)

  "On assigne à nouveau de nouvelles valeurs aux champs de la STRUCTURE (ligne)
  "avant d'ajouter la STRUCTURE dans la table
  ls_vbap-vbeln = 1000000002.
  ls_vbap-posnr = 20.
  ls_vbap-matnr = 'MZ-AA-RT01'.
  ls_vbap-fkrel = 'A'.

  APPEND ls_vbap TO lt_vbap.  "On ajoute la ligne dans la table concernée
  CLEAR: ls_vbap.             "On réinitialise la structure (ligne)

  "On assigne à nouveau de nouvelles valeurs aux champs de la STRUCTURE (ligne)
  "avant d'ajouter la STRUCTURE dans la table
  ls_vbap-vbeln = 1000000002.
  ls_vbap-posnr = 30.
  ls_vbap-matnr = 'MZ-FG-RP01'.
  ls_vbap-fkrel = 'C'.

  APPEND ls_vbap TO lt_vbap.  "On ajoute la ligne dans la table concernée
  CLEAR: ls_vbap.             "On réinitialise la structure (ligne)

  "On assigne à nouveau de nouvelles valeurs aux champs de la STRUCTURE (ligne)
  "avant d'ajouter la STRUCTURE dans la table
  ls_vbap-vbeln = 1000000003.
  ls_vbap-posnr = 10.
  ls_vbap-matnr = 'AA-300-M'.
  ls_vbap-fkrel = 'A'.

  APPEND ls_vbap TO lt_vbap.  "On ajoute la ligne dans la table concernée
  CLEAR: ls_vbap.             "On réinitialise la structure (ligne)

  "On assigne à nouveau de nouvelles valeurs aux champs de la STRUCTURE (ligne)
  "avant d'ajouter la STRUCTURE dans la table
  ls_vbap-vbeln = 1000000003.
  ls_vbap-posnr = 20.
  ls_vbap-matnr = 'AA-400-M'.
  ls_vbap-fkrel = 'B'.

  APPEND ls_vbap TO lt_vbap.  "On ajoute la ligne dans la table concernée
  CLEAR: ls_vbap.             "On réinitialise la structure (ligne)

  "On assigne à nouveau de nouvelles valeurs aux champs de la STRUCTURE (ligne)
  "avant d'ajouter la STRUCTURE dans la table
  ls_vbap-vbeln = 1000000003.
  ls_vbap-posnr = 30.
  ls_vbap-matnr = 'AA-400-M'.
  ls_vbap-fkrel = 'C'.

  APPEND ls_vbap TO lt_vbap.  "On ajoute la ligne dans la table concernée
  CLEAR: ls_vbap.             "On réinitialise la structure (ligne)

  "On assigne à nouveau de nouvelles valeurs aux champs de la STRUCTURE (ligne)
  "avant d'ajouter la STRUCTURE dans la table
  ls_vbap-vbeln = 1000000003.
  ls_vbap-posnr = 40.
  ls_vbap-matnr = 'AA-400-M'.
  ls_vbap-fkrel = 'D'.

  APPEND ls_vbap TO lt_vbap.  "On ajoute la ligne dans la table concernée
  CLEAR: ls_vbap.             "On réinitialise la structure (ligne)

*REGLE GENERALE 3 : TRAITEMENT DES DONNEES D'EN-TETE (TABLE lt_vbak)

*A. Pour le numéro du Document de vente 1000000003 sur la table locale vbak, afficher toutes ses données.

  "Si je dois aller chercher une ou plusieurs données précises d'une seule ligne, le READ est à privilégier.
  READ TABLE lt_vbak INTO ls_vbak WITH KEY vbeln = 1000000003.
  
  "Un READ va récupérer une ligne de la table (TABLE lt_vbak) correspondant à ces filtres (WITH KEY vbeln = 1000000003).
  "Le READ devra cependant stocker ces données dans quelque chose : une structure similaire (INTO ls_vbak).
  "Il sera ensuite possible de manipuler les données de cette STRUCTURE (ls_vbak) au niveau de ces différents champs (vbeln, erdat, ...)
  WRITE:/ ls_vbak-vbeln, 
        / ls_vbak-erdat,
        / ls_vbak-erzet,
        / ls_vbak-ernam,
        / ls_vbak-vbtyp.
  CLEAR: ls_vbak.
  ULINE.

  "READ de la table ou le VBTYP = 'B'.
  READ TABLE lt_vbak INTO ls_vbak WITH KEY vbtyp = 'B'.
  WRITE:/ ls_vbak-vbeln,
        / ls_vbak-erdat,
        / ls_vbak-erzet,
        / ls_vbak-ernam,
        / ls_vbak-vbtyp.
  CLEAR: ls_vbak.
  ULINE.

  "EXEMPLE avec le FIELD-SYMBOL et la condition vbtyp = 'C' et ernam = 'Fred'
  "Le FIELD-SYMBOL aura quasiement le même comportement qu'une STRUCTURE (ie. ls_vbak) à la différence qu'il "pointe" sur les données
  "Les FIELD-SYMBOLS sont a privilégier en terme de performance de traitement
  "Ici, le "ASSIGNING FIELD-SYMBOLS(<lfs_vbak>)" déclare un FIELD-SYMBOL automatiquement typé comme la table lue
  "Il possèdera donc la même structuration que la table lue
  READ TABLE lt_vbak ASSIGNING FIELD-SYMBOL(<lfs_vbak>) WITH KEY vbtyp = 'C' ernam = 'Fred'.
  WRITE:/ <lfs_vbak>-vbeln,
        / <lfs_vbak>-erdat,
        / <lfs_vbak>-erzet,
        / <lfs_vbak>-ernam,
        / <lfs_vbak>-vbtyp.
  ULINE.

  "EXEMPLE avec l'instruction BINARY SEARCH qui optimise davantage les performances SAP.
  "OBLIGATION DE TRIER LA TABLE EN AMONT !!!
  "Le BINARY SEARCH optimise encore les performances de traitement, notamment dans les tables populeuses
  "Il est cependant INDISPENSABLE que la table soit triée en amont (sinon DUMP possible).
  SORT lt_vbak.
  READ TABLE lt_vbak ASSIGNING FIELD-SYMBOL(<lfs_vbak_binary>) BINARY SEARCH WITH KEY vbeln = 1000000002.
  WRITE:/ <lfs_vbak_binary>-vbeln,
        / <lfs_vbak_binary>-erdat,
        / <lfs_vbak_binary>-erzet,
        / <lfs_vbak_binary>-ernam,
        / <lfs_vbak_binary>-vbtyp.
  ULINE.

  "EXEMPLE optimisée avec protection contre le DUMP !!! (VERSION QUASI SYSTEMATIQUE)
  SORT lt_vbak.
  READ TABLE lt_vbak ASSIGNING FIELD-SYMBOL(<lfs_vbak_final>) BINARY SEARCH WITH KEY vbeln = 1000000001.
  IF sy-subrc <> 0. "SY-SUBRC est une variable system qui va vérifier l'état de la derniere instruction située avant elle.
    "SY-SUBRC peut donc avoir plusieurs valeurs qui sont :
    " 0 : SUCCESS
    " 1 à 4 : ERROR

    "Si sy-subrc <> 0, cela signifie que mon READ a FOIRE !!!
    "Grâce au sy-subrc, le programme ne va pas DUMP mais va rentrer dans ma condition ("IF sy-subrc <> 0" ... "ENDIF") pour afficher le message d'erreur BLOQUANT (TYPE 'E') !
    MESSAGE 'Error READ VBAK 378' TYPE 'E'.
    
    "L'utilisation du sy-subrc est indispensable lors de traitement sur les tables (READ, INSERT, ...) et prévient les DUMPs si bien conditionné.
  ENDIF.

*B. Pour le numéro du Document commercial 1000000002 sur la table locale vbak, modifier la valeur de "ernam" par 'David' en
*   vous aidant de l'instruction READ.

  SORT lt_vbak.
  READ TABLE lt_vbak ASSIGNING FIELD-SYMBOL(<lfs_vbak_exo>) BINARY SEARCH WITH KEY vbeln = 1000000002.
  IF sy-subrc <> 0.
    MESSAGE 'ERROR EXO LINE 398' TYPE 'E'.
  ENDIF.

  <lfs_vbak_exo>-ernam = 'David'.
  MODIFY lt_vbak FROM <lfs_vbak_exo> TRANSPORTING ernam WHERE vbeln = <lfs_vbak_exo>-vbeln.
  IF sy-subrc <> 0.
    MESSAGE 'ERROR EXO LINE 435' TYPE 'E'.
  ENDIF.

*REGLE GENERALE 4 : TRAITEMENT DES DONNEES DE POSTE

*La LOOP est utile lorsqu'il y a plusieurs modifications à faire dans plusieurs lignes d'une table
*Par exemple : modification générale de la valeur d'un champ d'une table (ie. toutes les valeurs de la colonne "fkrel")
*Par exemple : modifications ciblées génériques sous condition (SI condition est remplie, alors je fais le traitement, sinon non)

*A. Déclaration de LOOP avec une structure pour stocker les données ou un field-symbol pour pointer sur les données

  "Version avec une STRUCTURE (ligne de la table)
  LOOP AT lt_vbap INTO ls_vbap.
    "1. La 1ere chose que la LOOP va faire, c'est de récupérer la 1ere ligne.
    "   La LOOP va ensuite stocker les données de la ligne en cours de lecture dans la STRUCTURE ls_vbap (organisée comme notre table)

    "Avec l'instruction WRITE, la boucle va ecrire, pour chaque ligne lue de la table, la valeur du champ fkrel
    WRITE:/ ls_vbap-fkrel.
  ENDLOOP.

  ULINE.

  "Version avec le FIELD-SYMBOL.
  LOOP AT lt_vbap ASSIGNING FIELD-SYMBOL(<lfs_loop_vbap>).
    "1. La 1ere chose que la LOOP va faire, c'est de récupérer la 1ere ligne.
    "   La LOOP va ensuite stocker les données en cours de lecture dans le FIELD-SYMBOL <lfs_loop_vbap> (organisée comme notre table)

    "Avec l'instruction WRITE, la boucle va ecrire, pour chaque ligne lue de la table, la valeur du champ fkrel
    WRITE:/ <lfs_loop_vbap>-fkrel.
  ENDLOOP.

*B. Le fonctionnel a décidé que toutes les valeurs du champs fkrel de la table lt_vbap devront avoir la même valeur 'A'.

  "Version avec une STRUCTURE (ligne)
  LOOP AT lt_vbap INTO ls_vbap.
    "Pour chaque ligne lue (à chaque itération de la LOOP),
    "Nous modifions la valeur de la STRUCTURE ls_vbap au niveau du champ "fkrel" en lui attribuant la nouvelle valeur 'A'
    ls_vbap-fkrel = 'A'.

    "MODIFIE moi maintenant la table lt_vbap en PRENANT comme exemple ma structure nouvellement changé et change moi uniquement fkrel
    "sur la ligne qui a la même clé vbeln de table que la ligne lue actuellement
    MODIFY lt_vbap FROM ls_vbap TRANSPORTING fkrel WHERE vbeln = ls_vbap-vbeln.
  ENDLOOP.

  "Version avec le FIELD-SYMBOL.
  LOOP AT lt_vbap ASSIGNING FIELD-SYMBOL(<lfs_loop_vbap_2>).
    "Pour chaque ligne lue (à chaque itération de la LOOP),
    "Nous modifions la valeur du FIELD-SYMBOL <lfs_loop_vbap_2> au niveau du champ "fkrel" en lui attribuant la nouvelle valeur 'A'
    <lfs_loop_vbap_2>-fkrel = 'A'.

    "Modifie moi maintenant la table lt_vbap en prenant comme exemple mon field-symbol en tenant compte que de fkrel
    "sur la ligne qui a la même clé de table que la ligne lue actuellement
    MODIFY lt_vbap FROM <lfs_loop_vbap_2> TRANSPORTING fkrel WHERE vbeln = <lfs_loop_vbap_2>-vbeln.
  ENDLOOP.

*C. Le fonctionnel veux maintenant que tous les postes (posnr) = 10, sa valeur en fkrel sera égale à 'Z'.

  "Version avec une STRUCTURE (ligne)
  LOOP AT lt_vbap INTO ls_vbap.

    "SI la valeur de posnr de la ligne lue est égale à 10, alors ...
    IF ls_vbap-posnr = 10.

      "... modifie la valeur de fkrel avec 'Z' comme valeur dans la STRUCTURE qui a stockée les données de la ligne lue
      ls_vbap-fkrel = 'Z'.

      "Modifie moi maintenant la table lt_vbap en prenant comme modèle ma STRUCTURE en tenant compte que de fkrel
      "sur la ligne qui a la même clé de table que la ligne lue actuellement
      MODIFY lt_vbap FROM ls_vbap TRANSPORTING fkrel WHERE vbeln = ls_vbap-vbeln.
    ENDIF.
  ENDLOOP.

  "Version avec le FIELD-SYMBOL.
  LOOP AT lt_vbap ASSIGNING FIELD-SYMBOL(<lfs_loop_vbap_3>).

    "SI la valeur de posnr de la ligne lue est égale à 10, alors ...
    IF <lfs_loop_vbap_3>-posnr = 10.

      "... modifie la valeur de fkrel avec 'Z' comme valeur dans le FIELD-SYMBOL qui a stockée les données de la ligne lue
      <lfs_loop_vbap_3>-fkrel = 'Z'.

      "Modifie moi maintenant la table lt_vbap en prenant comme modèle le FIELD-SYMBOL en tenant compte que de fkrel
      "sur la ligne qui a la même clé de table que la ligne lue actuellement
      MODIFY lt_vbap FROM <lfs_loop_vbap_3> TRANSPORTING fkrel WHERE vbeln = <lfs_loop_vbap_3>-vbeln.
    ENDIF.
  ENDLOOP.

*D. Le fonctionnel veux maintenant que tous les postes (posnr) = 20, sa valeur en fkrel sera égale à 'R'.

  "Version avec STRUCTURE
  LOOP AT lt_vbap INTO ls_vbap.

    "SI, pour la ligne lue (ls_vbap) au niveau du champ posnr, ce dernier a pour valeur 20...
    IF ls_vbap-posnr = 20.

      "... alors on va modifier la ligne lue (ls_vbap), au niveau du champ fkrel, sa valeur pour correspondre à la demande, soit 'R'.
      <lfs_vbap_4>-fkrel = 'R'.

      "On modifie ensuite la table lt_vbap en prenant comme modèle la ligne nouvellement modifiée (ls_vbap), en indiquant quel champ
      "a été changé (TRANSPORTING fkrel) en lui précisant les critères/filtres pour pas qu'il ne se trompe de ligne dans la table
      "(WHERE vbeln = <lfs_vbap_4>-vbeln AND posnr = <lfs_vbap_4>-posnr)
      MODIFY lt_vbap FROM <lfs_vbap_4> TRANSPORTING fkrel WHERE vbeln = <lfs_vbap_4>-vbeln AND posnr = <lfs_vbap_4>-posnr.

    ENDIF.

  ENDLOOP.
  
  "Version avec FIELD-SYMBOL
  LOOP AT lt_vbap ASSIGNING FIELD-SYMBOL(<lfs_vbap_4>).

    "SI, pour la ligne lue (<lfs_vbap_4>) au niveau du champ posnr, ce dernier a pour valeur 20...
    IF <lfs_vbap_4>-posnr = 20.

      "... alors on va modifier la ligne lue (<lfs_vbap_4>), au niveau du champ fkrel, sa valeur pour correspondre à la demande, soit 'R'.
      <lfs_vbap_4>-fkrel = 'R'.

      "On modifie ensuite la table lt_vbap en prenant comme modèle la ligne nouvellement modifiée (<lfs_vbap_4>), en indiquant quel champ
      "a été changé (TRANSPORTING fkrel) en lui précisant les critères/filtres pour pas qu'il ne se trompe de ligne dans la table
      "(WHERE vbeln = <lfs_vbap_4>-vbeln AND posnr = <lfs_vbap_4>-posnr)
      MODIFY lt_vbap FROM <lfs_vbap_4> TRANSPORTING fkrel WHERE vbeln = <lfs_vbap_4>-vbeln AND posnr = <lfs_vbap_4>-posnr.

    ENDIF.

  ENDLOOP.

  BREAK-POINT.
