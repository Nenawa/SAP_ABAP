# IS INITIAL

Vérifier qu’une [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) n’est pas vide.

```abap
IF NOT itab[] IS INITIAL.
...
ENDIF.
```

ou

```abap
IF itab[] IS NOT INITIAL.
...
ENDIF.
```

    Les crochets [ ] après le nom d’une table interne font référence à son contenu et aux nombres de lignes enregistrées.
