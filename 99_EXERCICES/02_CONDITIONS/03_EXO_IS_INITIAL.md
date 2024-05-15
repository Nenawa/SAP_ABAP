# EXERCICE 3

## EXEMPLE D'UTILISATION

### AVEC UNE TABLE

#### IS INITAL

```abap
DATA: lt_mara TYPE STANDARD TABLE OF mara.

IF lt_mara IS INITIAL.
  "Traitement
ENDIF.
```

Littéralement : 

```abap
SI lt_mara (table) EST VIDE.
  "On effectue le traitement
FIN DU SI.
```

Ici, l'instruction 'IF' est utilisé avec l'instruction 'IS INITIAL' pour vérifier si la table interne (ou local) est vide. Si elle est vide, alors on procède au traitement (traitement à l'intérieur des instructions 'IF' et 'ENDIF').

#### IS NOT INITIAL

```abap
DATA: lt_mara TYPE STANDARD TABLE OF mara.

IF lt_mara IS NOT INITIAL.
  "Traitement
ENDIF.
```

Littéralement : 

```abap
SI lt_mara (table) N'EST PAS VIDE.
  "On effectue le traitement
FIN DU SI.
```

Ici, l'instruction 'IF' est utilisé avec l'instruction 'IS INITIAL' pour vérifier si la table interne (ou local) n'est pas vide. Si elle n'est pas vide, alors on procède au traitement (traitement à l'intérieur des instructions 'IF' et 'ENDIF').

### AVEC UNE STRUCTURE

#### IS INITAL

```abap
DATA: lt_mara TYPE STANDARD TABLE OF mara,
      ls_mara LIKE LINE OF lt_mara.

IF ls_mara IS INITIAL.
  "Traitement
ENDIF.
```

Littéralement : 

```abap
SI ls_mara (structure) EST VIDE.
  "On effectue le traitement
FIN DU SI.
```

Ici, l'instruction 'IF' est utilisé avec l'instruction 'IS INITIAL' pour vérifier si la structure locale (ligne de la table interne lt_mara) est vide. Si elle est vide, alors on procède au traitement (traitement à l'intérieur des instructions 'IF' et 'ENDIF').

#### IS NOT INITIAL

```abap
DATA: lt_mara TYPE STANDARD TABLE OF mara,
      ls_mara LIKE LINE OF lt_mara.

IF ls_mara IS NOT INITIAL.
  "Traitement
ENDIF.
```

Littéralement : 

```abap
SI ls_mara (structure) N'EST PAS VIDE.
  "On effectue le traitement
FIN DU SI.
```

Ici, l'instruction 'IF' est utilisé avec l'instruction 'IS INITIAL' pour vérifier si la structure locale (ligne de la table interne lt_mara) n'est pas vide. Si elle n'est pas vide, alors on procède au traitement (traitement à l'intérieur des instructions 'IF' et 'ENDIF').

### AVEC UNE VARIABLE

#### IS INITAL

```abap
DATA: lv_matnr TYPE mara-matnr.

IF lv_matnr IS INITIAL.
  "Traitement
ENDIF.
```

Littéralement : 

```abap
SI lv_matnr EST VIDE.
  "On effectue le traitement
FIN DU SI.
```

Ici, l'instruction 'IF' est utilisé avec l'instruction 'IS INITIAL' pour vérifier si la variable locale est vide. Si elle est vide, alors on procède au traitement (traitement à l'intérieur des instructions 'IF' et 'ENDIF').

#### IS NOT INITIAL

```abap
DATA: lv_matnr TYPE mara-matnr.

IF lv_matnr IS NOT INITIAL.
  "Traitement
ENDIF.
```

Littéralement : 

```abap
SI lv_matnr (structure) N'EST PAS VIDE.
  "On effectue le traitement
FIN DU SI.
```

Ici, l'instruction 'IF' est utilisé avec l'instruction 'IS INITIAL' pour vérifier si la variable locale n'est pas vide. Si elle n'est pas vide, alors on procède au traitement (traitement à l'intérieur des instructions 'IF' et 'ENDIF').