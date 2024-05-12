# MOVE CORRESPONDING TABLE TO

Copier toutes les valeurs des champs correspondants de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `itab2` vers `itab1` et des champs correspondants de la [TABLE INTERNE](../../07_TABLE_INTERNE/01_TABLES_INTERNES.md) `itab3` vers `itab1` :

```abap
MOVE-CORRESPONDING itab2 TO itab1.
MOVE-CORRESPONDING itab3 TO itab1.
```
