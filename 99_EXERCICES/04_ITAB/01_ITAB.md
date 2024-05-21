REGLE GENERALE 0:

 - Suivre les conventions de nommage (déclarations en locale)

 - Prioriser la performance

REGLE GENERALE 1 : CREATION DES TABLES LOCALES

 A. Créer une table locale standard nommée vbak (correspondant au Document commercial: données d'en-tête)
 qui comprendra les champs suivants avec comme clé non unique "vbeln" :

   - vbeln de type vbeln_va (correspondant au numéro du "Document de vente")
   - erdat de type erdat (correspondant à la "Date de création de l'enregistrement")
   - erzet de type erzet (correspondant à l'"heure de saisie")
   - ernam de type ernam (correspondant au "nom de l'utilisateur qui a créé l'objet")
   - vbtyp de type vbtypl (correspondant à la "catégorie de document commercial")

 B. Créer une table locale standard nommée vbap (correspondant au données du poste du Document commercial)
 qui comprendra les champs suivants avec comme clé non unique "vbeln" et "posnr" :

   - vbeln de type vbeln_va (correspondant au numéro du "Document de vente")
   - posnr de type posnr_va (correspondant au numéro du "Poste de document de vente")
   - matnr de type matnr (correspondant au "Numéro d'article")
   - fkrel de type fkrel (correspondant à la description "Concerne la facture")

ASTUCES :

 Etape 1: Créer une "Structure de Table" avec l'aide de l'instruction "TYPES:".
          Si besoin, retourner dans la Tool Box et regarder comment créer une
          structure.

 Etape 2: Déclarer les tables à l'aide de l'instruction "DATA:"
          Si besoin, retourner dans la Tool Box et regarder comment créer une
          structure.

REGLE GENERALE 2 : ALIMENTATION DES TABLES LOCALES

A. Dans la table locale standard vbak, entrer les données suivantes :

 - Ligne 1 :
   - vbeln = 1000000001
   - erdat = sy-datum
   - erzet = sy-uzeit
   - ernam = votre prénom
   - vbtyp = A

 - Ligne 2 :
   - vbeln = 1000000002
   - erdat = sy-datum
   - erzet = sy-uzeit
   - ernam = votre prénom
   - vbtyp = B

 - Ligne 3 :
   - vbeln = 1000000003
   - erdat = sy-datum
   - erzet = sy-uzeit
   - ernam = votre prénom
   - vbtyp = C

B. Dans la table locale standard vbap, entrer les données suivantes :

 - Ligne 1 :
   - vbeln = 1000000001
   - posnr = 10
   - matnr = MZ-FG-C990
   - fkrel = C

 - Ligne 2 :
   - vbeln = 1000000001
   - posnr = 20
   - matnr = MZ-FG-M500
   - fkrel = A

 - Ligne 3 :
   - vbeln = 1000000001
   - posnr = 30
   - matnr = MZ-FG-R100
   - fkrel = A

 - Ligne 4 :
   - vbeln = 1000000002
   - posnr = 10
   - matnr = MZ-AA-TG01
   - fkrel = B

 - Ligne 5 :
   - vbeln = 1000000002
   - posnr = 20
   - matnr = MZ-AA-RT01
   - fkrel = A

 - Ligne 6 :
   - vbeln = 1000000002
   - posnr = 30
   - matnr = MZ-FG-RP01
   - fkrel = C

 - Ligne 7 :
   - vbeln = 1000000003
   - posnr = 10
   - matnr = AA-300-M
   - fkrel = A

 - Ligne 8 :
   - vbeln = 1000000003
   - posnr = 20
   - matnr = AA-400-M
   - fkrel = B

 - Ligne 9 :
   - vbeln = 1000000003
   - posnr = 30
   - matnr = AA-400-M
   - fkrel = C

 - Ligne 10 :
   - vbeln = 1000000003
   - posnr = 40
   - matnr = AA-400-M
   - fkrel = D

REGLE GENERALE 3 : TRAITEMENT DES DONNEES D'EN-TETE

A. Pour le numéro du Document de vente 1000000003, afficher toutes ses données.

B. Pour chaque en-tête, modifier la valeur du champ "ernam" en ajoutant "AIR-" devant le nom.

REGLE GENERALE 3 : TRAITEMENT DES DONNEES DES POSTES

A. Créer une nouvelle table interne nommé vbap_split. Cette table devra ressembler à la table locale vbap (sans le champ matnr) 
   mais devra stocker en plus (dans autant de colonnes que nécessaire) les valeurs "matnr" séparé au niveau du "-".
   Chacune des nouvelles colonnes créées pour cette demande portera le nom de matnr_ (ou '' correspondra au nombre de colonne créer pour la séparation).

B. Alimenter automatiquement la nouvelle table (vbap_split) en vous aidant de la table locale vbap.
   Il sera nécessaire de conserver uniquement les lignes dont les factures concernées sont de type "A", "B" et "D".
