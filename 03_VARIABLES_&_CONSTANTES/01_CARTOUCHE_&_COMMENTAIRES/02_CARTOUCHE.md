# CARTOUCHE

Les cartouches, également appelées "program attributes" en anglais, sont des en-têtes spéciaux placés au début des programmes ABAP dans SAP. Elles servent à fournir des informations sur le programme, telles que son nom, sa description, son auteur, sa version, etc. Ces informations peuvent être utiles pour les développeurs et les administrateurs de système pour comprendre rapidement ce que fait le programme et qui en est responsable.

## INFORMATIONS COURANTES

- ``Nom du programme`` : Le nom du programme ABAP.
- ``Type de programme`` : Le type de programme ABAP, tel que "Report" pour un rapport ou "Function Module" pour un module de fonction.
- ``Auteur`` : Le nom de l'auteur ou du développeur qui a créé le programme.
- ``Date de création/modification`` : La date à laquelle le programme a été créé ou modifié pour la dernière fois.
- ``Description du programme`` : Une brève description du but ou de la fonction du programme.
- ``Version`` : La version du programme, utile pour suivre les modifications et les mises à jour du code.
- ``Organisation`` : Le nom de l'organisation ou du département responsable du programme.`

## EXEMPLE

```abap
*&**********************************************************************
*&                           ENTREPRISE                                *
*& ------------------------------------------------------------------- *
*& Objet  : Nom de l'objet                                             *
*& Ticket : Numéro du ticket                                           *
*& Titre  : intitulé du ticket                                         *
*&                                                                     *
*& ------------------------------------------------------------------- *
*& Commentaire :                                                       *
*&                                                                     *
*& ------------------------------------------------------------------- *
*& Historique des modifications                                        *
*& Date      | Nom (Trigramme)   | Ticket - Objet                      *
*& 00.00.2024| P.NOM  (PNO)      |                                     *
*&           |                   |                                     *
*&**********************************************************************
```

Avec les commentaires (afin de structurer notre programme), le code ressemblera à ceci :

```abap
*&---------------------------------------------------------------------*
*& Report ZFGI_HELLO_WORLD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
*&**********************************************************************
*&                           ENTREPRISE                                *
*& ------------------------------------------------------------------- *
*& Objet  : Nom de l'objet                                             *
*& Ticket : Numéro du ticket                                           *
*& Titre  : intitulé du ticket                                         *
*&                                                                     *
*& ------------------------------------------------------------------- *
*& Commentaire :                                                       *
*&                                                                     *
*& ------------------------------------------------------------------- *
*& Historique des modifications                                        *
*& Date      | Nom (Trigramme)   | Ticket - Objet                      *
*& 00.00.2024| P.NOM  (PNO)      |                                     *
*&           |                   |                                     *
*&**********************************************************************
REPORT ZFGI_HELLO_WORLD.

*&---------------------------------------------------------------------*
*& SELECTION-SCREEN
*&---------------------------------------------------------------------*



*&---------------------------------------------------------------------*
*& START-OF-SELECTION
*&---------------------------------------------------------------------*
START-OF-SELECTION.

* --------------------------------------------------------- DECLARATIONS



* ----------------------------------------------------------- PROCESSING
```