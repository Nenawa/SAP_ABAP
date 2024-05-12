# TYPE STANDARD TABLE OF

Il existe plusieurs types de [TABLES INTERNES](./01_Tables_Internes.md) et leur déclaration peut varier. La commande complète est donc la suivante :

```abap
DATA itab { TYPE [STANDARD]|SORTED|HASHED TABLE OF type }
          [ WITH primary_key ]
          [ WITH secondary_key1 ] 
          [ WITH secondary_key2 ].
```

`TYPE REF TO` ou `STANDARD TABLE OF` est le type plus utilisé car il est le plus malléable :

- la table n’est pas ordonnée mais peut l’être de différentes façons au cours du programme

- elle peut comporter plusieurs clés

- elle est plus facile pour gérer les données

- c’est cependant celle qui consomme le plus de mémoire système.

```abap
TYPES: BEGIN OF ty_tab,
         obj1 TYPE typ1,
         obj2 TYPE typ2,
         obj3 TYPE typ3,
         . . .
       END OF ty_tab.

DATA: it_tab_types TYPE STANDARD TABLE OF ty_tab.
```
