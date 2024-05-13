# EXERCICE 1

## CONSIGNES

```
Instructions :

RG 1 : Créer un programme ABAP SAP (à partir de la transaction SE38) avec comme convention de nommage "ZTRI_EXERCICE_CHAP_3". ce programme devra être affilié à l'OT précédemment créé et devra appartenir au package "ZAELION" (pas d'enregistrement en local !).

RG 2 : L'ensemble des dénominations des variables, constantes et 
autres éléments devront être intitulés en anglais (les valeurs 
seront en français s'il s'agit de chaîne de caractères).

Exemple : Prénom deviendrai "??_firstname ???? datatype".

RG 3 : Dans ce programme, déclarez les éléments suivants qui devront 
être déclarés en tant que variables ou constantes (à vous de choisir la bonne déclaration) avec un DATATYPE logique :

- Prénom(s)
- Nom(s) (Déclaration en LIKE)
- Age (en années)
- Ville
- Taille (en mètres, avec décimale(s))
- Lieu de naissance
- Pays de naissance
- Etat civil
- Permis
- Véhicule principal

RG 4 : Même consigne que pour la RG 3 avec, cette fois-ci, les 
éléments suivants :

- Numéro de document de vente
- Catégorie de document commercial
- Référence client
- Devise du document commercial

Astuce(s) pour la RG 4 : 
1. Rechercher la table sur internet qui pourrait contenir les 
informations concernant les "Commandes de vente".

2. Un fois la table identifié, aller dans la transaction "SE11" et 
afficher la structure de la table.

3. Rechercher les champs à l'aide de [ Ctrl ] + [ F ], puis 
[ Ctrl ] + [ G ]

RG 5 : alimenter toutes les variables/constantes avec des données 
(fictives pour la RG 4).

Astuce(s) pour la RG 4 :
Attention aux restrictions des domaines de éléments à déclarées, il faut que les valeurs correspondent aux restrictions de ces domaines.

RG 6 : Utiliser l'instruction WRITE pour qu'à l'exécution du 
programme, les valeurs s'affichent.

RG 7 : Commenter les étapes majeures de votre programme.
```

## CORRECTION

```abap
*&---------------------------------------------------------------------*
*& START-OF-SELECTION
*&---------------------------------------------------------------------*
START-OF-SELECTION.

*&---------------------------------------------------------------------*
*& EXERCICE 1
*&---------------------------------------------------------------------*

* --------------------------------------------------------- DECLARATIONS

*Déclaration des conctantes (éléments qui restent fixes dans le temps) avec leur valeur
  CONSTANTS: lc_birth_place   TYPE string VALUE 'Washington ?',
             lc_birth_country TYPE string VALUE 'USA'.

*Déclaration des variables
  DATA: lv_firstname      TYPE string,
        lv_lastname       LIKE lv_firstname,
        lv_age            TYPE i,
        lv_city           TYPE string,
        lv_heigth         TYPE p DECIMALS 2,
        lv_marital_status TYPE string,
        lv_licence        TYPE xfeld,
        lv_main_vehicle   TYPE string.

*Déclaration des variables typées
  DATA: lv_vbeln TYPE vbak-vbeln, "Document de vente (table VBAK)
        lv_vbtyp TYPE vbak-vbtyp, "Catégorie de document commercial (table VBAK)
        lv_bstnk TYPE vbak-bstnk, "Référence client (table VBAK)
        lv_waerk TYPE vbak-waerk. "Devise du document commercial (table VBAK)

* ----------------------------------------------------------- PROCESSING

*Attribution des valeurs en "dur" des variables (les valeurs des constantes sont déjà déclarées)
  lv_firstname      = 'John'.
  lv_lastname       = 'WICK'.
  lv_age            = 36.
  lv_city           = 'Inconnue'.
  lv_heigth         = '1.86'.
  lv_marital_status = 'Veuf'.
  lv_licence        = 'X'.
  lv_main_vehicle   = 'Tout apparemment...'.

  lv_vbeln = '5840'.
  lv_vbtyp = '4444'.
  lv_bstnk = 'Son chien'.
  lv_waerk = 'Euro'.

*Instruction WRITE pour afficher les valeurs des variables à l'exécution du programme
  WRITE:/ 'lv_firstname : ', lv_firstname,
        / 'lv_lastname : ', lv_lastname,
        / 'lv_age : ', lv_age,
        / 'lv_city : ', lv_city,
        / 'lv_heigth : ', lv_heigth,
        / 'lv_marital_status : ', lv_marital_status,
        / 'lv_licence : ', lv_licence,
        / 'lv_main_vehicle : ', lv_main_vehicle,
        / 'lc_birth_place : ', lc_birth_place,
        / 'lc_birth_country : ', lc_birth_country.

  WRITE:/ 'lv_vbeln : ', lv_vbeln,
        / 'lv_vbtyp : ', lv_vbtyp,
        / 'lv_bstnk : ', lv_bstnk,
        / 'lv_waerk : ', lv_waerk.
```