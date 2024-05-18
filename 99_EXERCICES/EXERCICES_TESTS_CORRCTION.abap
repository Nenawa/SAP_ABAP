*&---------------------------------------------------------------------*
*& Report ZFGI_TEST_CORRECTION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfgi_test_correction.

*&---------------------------------------------------------------------*
*& DECLARATIONS
*&---------------------------------------------------------------------*

*&--------------------------------------------------------------- RG 2 *

* CONSIGNES : VERSION SIMPLIFIEE
*
*> A. Déclarez les variables suivantes en local :
*>
*> | VARIABLE         | TYPE    | VALEUR |
*> |------------------|---------|--------|
*> | numero_doc_achat | CHAR 10 |        |
*> | societe          | CHAR 4  |        |
*> | date_creation    | DATE    |        |
*> | dernier_poste    | NUMC 5  |        |
*> | numero_poste_1   | CHAR 40 |        |
*> | numero_poste_2   | CHAR 40 |        |
*> | numero_poste_3   | CHAR 40 |        |
*> | numero_poste_4   | CHAR 40 |        |
*> | split_pattern    | CHAR 40 |        |
*> | item_1           | CHAR 40 |        |
*> | item_2           | CHAR 40 |        |
*> | item_3           | CHAR 40 |        |
*> | item_4           | CHAR 40 |        |
*>
*> B. Déclarez la(les) constante(s) suivante(s) :
*>
*> | CONSTANTE   | TYPE   | VALEUR                   |
*> |-------------|--------|--------------------------|
*> | doc_achat   | STRING | En-tête document d'achat |
*> | post_achat  | STRING | Poste document d'achat   |
*> | designation | STRING | AAA_BKR_300              |
*
* VERSION UN PEU PLUS REALISTE
*
*> A. Rechercher la table SAP "En-tête document d'achat" (SE11) et déclarer en local dans le Report les variables dont les descriptions respectives sont listées dans la table ci-dessous en respectant les critères suivants :
*>
*> - Nom des variables correspondant au champ/zone de la table
*>
*> - Le TYPE doit être l''Elément de donnée' du champ ou typé 'table-zone' (exemple MARA-MATNR) - au choix
*>
*> | VARIABLE | TYPE | VALEUR | DESCRIPTION DU CHAMP DANS LA TABLE   |
*> |----------|------|--------|--------------------------------------|
*> |          |      |        | Numéro du document d'achat           |
*> |          |      |        | Société                              |
*> |          |      |        | Date de création du document d'achat |
*> |          |      |        | Dernier numéro de poste              |
*>
*> B. Déclarez la(les) constante(s) suivante(s) :
*>
*> | CONSTANTE   | TYPE   | VALEUR                   |
*> |-------------|--------|--------------------------|
*> | doc_achat   | STRING | En-tête document d'achat |
*> | post_achat  | STRING | Poste document d'achat   |
*> | designation | STRING | AAA_BKR_300              |

* VERSIONS SIMPLIFEES

CONSTANTS: lc_doc_achat   TYPE string VALUE 'En-tête document d''achat',
           lc_post_achat  TYPE string VALUE 'Poste document d''achat',
           lc_designation TYPE string VALUE 'AAA_BKR_300',
           lc_tiret       TYPE string VALUE '-'.

CONSTANTS: lc_c  TYPE string VALUE '0000',
           lc_c1 TYPE string VALUE '1',
           lc_c2 TYPE string VALUE '2',
           lc_c3 TYPE string VALUE '3',
           lc_c4 TYPE string VALUE '4'.

DATA: lv_numero_doc_achat(10) TYPE c,
      lv_societe(4)           TYPE c,
      lv_date_creation        TYPE d,
      lv_dernier_poste        TYPE numc5,

      lv_numero_poste_1(40)   TYPE c,
      lv_numero_poste_2(40)   TYPE c,
      lv_numero_poste_3(40)   TYPE c,
      lv_numero_poste_4(40)   TYPE c,

      lv_split_pattern(40)    TYPE c,

      lv_item_1(40)           TYPE c,
      lv_item_2(40)           TYPE c,
      lv_item_3(40)           TYPE c,
      lv_item_4(40)           TYPE c,

      lv_split_1(40)          TYPE c,
      lv_split_2(40)          TYPE c,
      lv_split_3(40)          TYPE c,

      lv_pattern              TYPE string.

* VERSION UN PEU PLUS REALISTE

DATA: lv_ebeln TYPE ekko-ebeln, " Table EKKO (SE11) - Description : Numéro du document d'achat
      lv_bukrs TYPE ekko-bukrs, " Table EKKO (SE11) - Description : Société
      lv_aedat TYPE ekko-aedat, " Table EKKO (SE11) - Description : Date de création du document d'achat
      lv_lponr TYPE ekko-lponr. " Table EKKO (SE11) - Description : Dernier numéro de poste

"Pas de déclaration de constantes pour la version plus réaliste car
"ce sont les mêmes constantes déclarées dans la version simplifiée

*&---------------------------------------------------------------------*
*& PROCESSING
*&---------------------------------------------------------------------*

START-OF-SELECTION.

*&------------------------------------ ATTRIBUTIONS DES VALEURS - RG 3 *

* CONSIGNES : VERSION SIMPLIFIEE
*
*> A. Sous la balise commentée 'PROCESSING', attribuer en dessous de la
*> balise commentée 'PROCESSING' les valeurs suivantes aux différentes
*> variables déclarées précédemment :
*>
*> | VARIABLE         | TYPE    | VALEUR      |
*> |------------------|---------|-------------|
*> | numero_doc_achat | CHAR 10 | 4500000001  |
*> | societe          | CHAR 4  | 1710        |
*> | date_creation    | DATE    | SY-DATUM    |
*> | dernier_poste    | NUMC 5  | 4           |
*> | item_1           | CHAR 40 | Frame       |
*> | item_2           | CHAR 40 | Handle bars |
*> | item_3           | CHAR 40 | Seat        |
*> | item_4           | CHAR 40 | Wheels      |
*
* CONSIGNES : VERSION PLUS REALISTE
*
*> A. Dans la partie 'PROCESSING', attribuer les valeurs suivantes aux
*> différentes variables :
*>
*> | VARIABLE | TYPE | VALEUR     | DESCRIPTION DU CHAMP DANS LA TABLE   |
*> |----------|------|------------|--------------------------------------|
*> | ?        | ?    | 4500000001 | Numéro du document d'achat           |
*> | ?        | ?    | 1710       | Société                              |
*> | ?        | ?    | SY-DATUM   | Date de création du document d'achat |
*> | ?        | ?    | 4          | Dernier numéro de poste              |

* VERSIONS SIMPLIFEES

  lv_numero_doc_achat   = '4500000001'.
  lv_societe            = '1710'.
  lv_date_creation      = sy-datum.
  lv_dernier_poste      = 4.

  lv_item_1             = 'Frame'.
  lv_item_2             = 'Handle bars'.
  lv_item_3             = 'Seat'.
  lv_item_4             = 'Wheels'.

* VERSION UN PEU PLUS REALISTE

  lv_ebeln  = '4500000001'.
  lv_bukrs  = '1710'.
  lv_aedat  = sy-datum.
  lv_lponr  = 4.

*&------------------------------------- TRAITEMENTS DES VALEURS - RG 4 *

* CONSIGNES : VERSION SIMPLIFIEE
*
*> A. A l'aide de l'instruction 'CONCATENATE', concatener la variable
*> 'numero_doc_achat', '0000' et '1' dans la variable 'numero_poste_1'.
*>
*> - répéter l'opération pour les variables 'numero_poste_2',
*> 'numero_poste_3' et 'numero_poste_4' en changeant le dernier caractère
*> par '2', '3' et '4'.
*>
*> B. A l'aide de l'instruction 'CONDENSE', condenser les variables
*> 'numero_poste_1', 'numero_poste_2', 'numero_poste_3' et
*> 'numero_poste_4' pour qu'il n'y ait pas d'espace. (exemple :
*> numero_post_1 aura pour identifiant 450000000100001)
*
* CONSIGNES : VERSION PLUS REALISTE
*
*> A. Créer les identifiants des Postes de ce document pour un nombre
*> de fois égal au nombre de poste du document d'achat 4500000001.
*>
*> - L'identifiant devra correspondre à la valeur de 'numero_doc_achat'
*> immédiatement suivi de '0000*' où Le '*' correspond au numéro du poste
*> (exemple : numero_post_1 aura pour identifiant 450000000100001).
*>
*> - Stocker ces identifiants dans des variables locales nommée
*> 'numero_poste_*'.

* VERSIONS SIMPLIFEES

  "1ere version possible

*CONCATENATE lv_numero_doc_achat '0000' '1' INTO lv_numero_poste_1.
*CONCATENATE lv_numero_doc_achat '0000' '2' INTO lv_numero_poste_2.
*CONCATENATE lv_numero_doc_achat '0000' '3' INTO lv_numero_poste_3.
*CONCATENATE lv_numero_doc_achat '0000' '4' INTO lv_numero_poste_4.
*
*CONDENSE lv_numero_poste_1.
*CONDENSE lv_numero_poste_2.
*CONDENSE lv_numero_poste_3.
*CONDENSE lv_numero_poste_4.

  "2e version possible

*CONCATENATE lv_numero_doc_achat '00001' INTO lv_numero_poste_1 RESPECTING BLANKS.
*CONCATENATE lv_numero_doc_achat '00002' INTO lv_numero_poste_2 RESPECTING BLANKS.
*CONCATENATE lv_numero_doc_achat '00003' INTO lv_numero_poste_3 RESPECTING BLANKS.
*CONCATENATE lv_numero_doc_achat '00004' INTO lv_numero_poste_4 RESPECTING BLANKS.

  "3e version

  CONCATENATE lv_numero_doc_achat lc_c lc_c1 INTO lv_numero_poste_1 RESPECTING BLANKS.
  CONCATENATE lv_numero_doc_achat lc_c lc_c2 INTO lv_numero_poste_2 RESPECTING BLANKS.
  CONCATENATE lv_numero_doc_achat lc_c lc_c3 INTO lv_numero_poste_3 RESPECTING BLANKS.
  CONCATENATE lv_numero_doc_achat lc_c lc_c4 INTO lv_numero_poste_4 RESPECTING BLANKS.

* VERSION UN PEU PLUS REALISTE

*CONCATENATE lv_ebeln lc_c lc_c1 INTO lv_numero_poste_1 RESPECTING BLANKS.
*CONCATENATE lv_ebeln lc_c lc_c2 INTO lv_numero_poste_2 RESPECTING BLANKS.
*CONCATENATE lv_ebeln lc_c lc_c3 INTO lv_numero_poste_3 RESPECTING BLANKS.
*CONCATENATE lv_ebeln lc_c lc_c4 INTO lv_numero_poste_4 RESPECTING BLANKS.

*&------------------------------------- TRAITEMENTS DES VALEURS - RG 5 *

* CONSIGNES : VERSION SIMPLIFIEE
*
*> A. A l'aide de l'instruction 'SPLIT', séparer la constante
*> 'designation' au séparateur '_' dans 3 variables qui seront à créer
*> pour l'occasion ('split_1', 'split_2' et 'split_3').
*>
*> B. A l'aide de l'instruction 'CONCATENATE', concatener les variables
*> 'split_2' et 'split_3' avec le séparateur '-'. Le résultat devra être
*> stocké dans la variable 'split_pattern'.
*
* CONSIGNES : VERSION PLUS REALISTE
*
*> Séparer la constante 'designation' au séparateur '_' et concaténer
*> les variables pour former le pattern 'BKR-300' dans une variable
*> nommée 'split_pattern'.

* VERSIONS SIMPLIFEES

*  SPLIT lc_designation AT '_' INTO lv_split_1 lv_split_2 lv_split_3.

  "1ere version

*  CONCATENATE lv_split_2 lv_split_3 INTO lv_split_pattern SEPARATED BY '-'.

  "2e version

*  CONCATENATE lv_split_2 '-' lv_split_3 INTO lv_split_pattern.

  "3e version VIDYA

*  CONCATENATE lv_split_2 lc_tiret lv_split_3 INTO lv_split_pattern.

* VERSION UN PEU PLUS REALISTE

  SPLIT lc_designation AT '_' INTO lv_split_1 lv_split_2 lv_split_3.
  CONCATENATE lv_split_2 lc_tiret lv_split_3 INTO lv_split_pattern.

*&-------------------------------------------------- CONDITIONS - RG 6 *

* CONSIGNES : VERSION SIMPLIFIEE
*
*> A. A l'aide de l'instruction 'IF', vérifier que toutes les variables
*> 'numero_poste_*' ne sont pas vide ('IS NOT INITIAL'). Si ce n'est pas
*> le cas, utiliser l'instruction 'MESSAGE' de 'TYPE' 'E' 'DISPLAY LIKE'
*> 'I' pour faire apparaître le message suivant : "Numéro(s) de poste
*> inexistant ou vide".
*>
*> B. Si la première condition est valide, alors, toujours à l'aide de
*> l'instruction 'IF', vérifier pour chaque variable 'numero_poste_*'
*> correspond au pattern suivant '45000000010000'.
*>
*> - Si l'une des variables ne respecte pas le pattern, utiliser
*> l'instruction 'MESSAGE' de 'TYPE' 'E' 'DISPLAY LIKE' 'W' avec comme
*> message sa valeur.
*
* CONSIGNES : VERSION PLUS REALISTE
*
*> Vérifier la validité des variables 'numero_poste_*'. Si invalide,
*> faire afficher le message d'erreur "Numéro(s) de poste inexistant
*> ou vide" dans une fenêtre popup.
*>
*> - Le texte "Numéro(s) de poste inexistant ou vide" devra être écrit
*> dans les éléments de texte à l'identifiant '001'.

* VERSIONS SIMPLIFEES

IF lv_numero_poste_1 IS INITIAL
  AND lv_numero_poste_2 IS INITIAL
  AND lv_numero_poste_3 IS INITIAL
  AND lv_numero_poste_4 IS INITIAL.

  MESSAGE 'Error' TYPE 'E' DISPLAY LIKE 'I'.
  RETURN.

ENDIF.

IF NOT lv_numero_poste_1 CP lv_pattern.
  MESSAGE lv_numero_poste_1 TYPE 'E' DISPLAY LIKE 'W'.
  RETURN.
ENDIF.

IF NOT lv_numero_poste_2 CP lv_pattern.
  MESSAGE lv_numero_poste_2 TYPE 'E' DISPLAY LIKE 'W'.
  RETURN.
ENDIF.

IF NOT lv_numero_poste_3 CP lv_pattern.
  MESSAGE lv_numero_poste_3 TYPE 'E' DISPLAY LIKE 'W'.
  RETURN.
ENDIF.

IF NOT lv_numero_poste_4 CP lv_pattern.
  MESSAGE lv_numero_poste_4 TYPE 'E' DISPLAY LIKE 'W'.
  RETURN.
ENDIF.

*&--------------------------------------------------- REPORTING - RG 7 *

* CONSIGNES : VERSION SIMPLIFIEE
*
*> A l'aide de l'instruction 'WRITE', faire afficher les
*> variables/constantes suivantes lors de l'exécution du programme :
*>
*> - doc_achat
*>
*> - ULINE
*>
*> - numero_doc_achat
*> - societe
*> - date_creation
*> - dernier_poste
*>
*> - ULINE
*>
*> - numero_poste_1
*> - numero_poste_2
*> - numero_poste_3
*> - numero_poste_4
*>
*> Aider de l'instruction 'ULINE' pour séparer les trois blocs de contenu.
*
* CONSIGNES : VERSION PLUS REALISTE
*
*> A l'exécution, le Report devra afficher les éléments suivants :
*>
*> - doc_achat
*>
*> - '???' (variable 'Numéro du document d'achat') et son nom de zone dans sa table d'origine
*> - '???' (variable 'Société') et son nom de zone dans sa table d'origine
*> - '???' (variable 'Date de création du document d'achat') et son nom de zone dans sa table d'origine
*> - '???' (variable 'Dernier numéro de poste') et son nom de zone dans sa table d'origine
*>
*> - numero_poste_1
*> - numero_poste_2
*> - numero_poste_3
*> - numero_poste_4
*>
*> Séparer les trois blocs avec une ligne horizontale.

WRITE:/ lc_doc_achat.

ULINE.

WRITE:/ lv_numero_doc_achat,
        lv_societe,
        lv_date_creation,
        lv_dernier_poste.

ULINE.

WRITE:/ lv_numero_poste_1,
        lv_numero_poste_2,
        lv_numero_poste_3,
        lv_numero_poste_4.