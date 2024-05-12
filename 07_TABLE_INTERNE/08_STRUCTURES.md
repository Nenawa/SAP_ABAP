# STRUCTURE

Une structure est un moyen de regrouper plusieurs [VARIABLES](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/01_VARIABLES.md) de types différents sous un même nom. Cela permet d'organiser les données de manière logique et de les manipuler plus facilement.

Une structure est une ligne d'une table et possédera autant de champ que la table dont elle provient. Elle pourra donc contenir des données de cette table si elle est alimentée.

## DECLARATION

A partir de cette structure de table :

```abap
TYPES: BEGIN OF ty_tab,
         obj1 TYPE typ1,
         obj2 TYPE typ2,
         obj3 TYPE typ3,
         . . .
      END OF ty_tab.
```

- Déclaration de structure `TYPE` la structure de table `ty_tab` :

    ```abap
    DATA: lt_tab_types TYPE TABLE OF ty_tab,
          ls_tab_types TYPE ty_tab.
    ```

- Déclaration de structure `LIKE LINE OF` table :

    ```abap
    DATA: lt_tab_types TYPE TABLE OF ty_tab,
          ls_tab_types LIKE LINE OF lt_tab_types.
    ```

## CONVENTION

Comme pour les variables, une structure locale sera déclarée en `ls_` pour "local structure" et `gs_` si elle a une étendue globale dans le programme.

## ALIMENTATION

Bien qu'il existe d'autres moyens de l'alimenter rapidement, la méthode la plus basique est la suivante :

```abap
TYPES: BEGIN OF ty_tab,
         obj1 TYPE typ1,
         obj2 TYPE typ2,
         obj3 TYPE typ3,
         . . .
      END OF ty_tab.

DATA: ls_tab TYPE ty_tab.

ls_tab-obj1 = val1.
ls_tab-obj2 = val2.
ls_tab-obj3 = val3.
```