# MESSAGES

## MESSAGE ...

```abap
"Message type informatif (popup)
MESSAGE 'Ceci est un message informatif.' TYPE 'I'.
```

```abap
"Message type Warning (message rouge en bas à gauche)
MESSAGE 'Attention : Opération risquée !' TYPE 'W'.
```

```abap
"Message type Error (message rouge en bas à gauche type BLOQUANT)
MESSAGE 'Erreur : Opération impossible.' TYPE 'E'.
```

```abap
"Message type Success (message vert en bas à gauche)
MESSAGE 'Succés.' TYPE 'S'.
```

## ... DISPLAY LIKE ...

```abap
MESSAGE 'Ceci est un message informatif.' TYPE 'I' DISPLAY LIKE 'S'.
```

```abap
MESSAGE 'Attention : Opération risquée !' TYPE 'W' DISPLAY LIKE 'E'.
```

```abap
MESSAGE 'Erreur : Opération impossible.' TYPE 'E' DISPLAY LIKE 'W'.
```

```abap
MESSAGE 'Succés.' TYPE 'S' DISPLAY LIKE 'I'.
```

## MESSAGE ELEMENTS DE TEXTE

1. Dans un programme modifiable

      ![](../../assets/images/INSTRUCTION_MESSAGE_000.jpg)

2. Aller dans [ Saut ], puis [ Eléments de texte ]

      ![](../../assets/images/INSTRUCTION_MESSAGE_001.jpg)

3. Aller dans l'onglet [ Symboles de texte ], puis renseigner le numéro du message ainsi que son contenu.

      ![](../../ASSETS/images/INSTRUCTION_MESSAGE_002.jpg)

4. Appuyer sur Entrée.

      ![](../../ASSETS/images/INSTRUCTION_MESSAGE_003.jpg)

5. Enregistrer et activer.

      ![](../../ASSETS/images/INSTRUCTION_MESSAGE_004.jpg)

      ![](../../ASSETS/images/INSTRUCTION_MESSAGE_005.jpg)

7. [ Retour arrière ]

      ![](../../ASSETS/images/INSTRUCTION_MESSAGE_006.jpg)

8. Dans le programme, après l'instruction ``START-OF-SELECTION``, entrer l'instruction suivante :

      ![](../../ASSETS/images/INSTRUCTION_MESSAGE_007.jpg)

      ```abap
      START-OF-SELECTION.

          MESSAGE TEXT-001 TYPE 'I'.
      ```

9. [ Activer ] et [ Exécuter ]

      ![](../../ASSETS/images/INSTRUCTION_MESSAGE_008.jpg)
