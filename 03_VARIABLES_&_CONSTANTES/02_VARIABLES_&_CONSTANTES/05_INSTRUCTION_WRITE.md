# INSTRUCTION WRITE

```abap
DATA: lv_message1 TYPE string,
      lv_message2 TYPE string,
      lv_message3 TYPE string.

START-OF-SELECTION.

  " Définition du message
  lv_message1 = 'Bienvenue dans mon rapport SAP !'.
  lv_message2 = 'Tout va bien !'.
  lv_message3 = 'Merci pour votre attention'.

  " Affichage des messages
  WRITE:/ lv_message1.

  WRITE:/ lv_message2,
        / lv_message3.

  " Affichage en dur avec des variables system
  WRITE:/ 'Variable système ABAP',
        / 'Mandant :     ', sy-mandt, 
        / 'Utilisateur : ', sy-uname, 
        / 'Date :        ', sy-datum, 
        / 'Heure :       ', sy-uzeit, 
        / lv_message3.
```

La commande ``WRITE`` dans SAP est utilisée pour afficher des informations dans la fenêtre de sortie ou dans les rapports. Elle permet d'écrire du texte, des valeurs de variables, des messages ou des lignes de données dans divers formats comme du texte brut, des tableaux ou des listes.

Par exemple, dans un programme ABAP SAP, vous pouvez utiliser la commande ``WRITE`` pour afficher le contenu des variables ou des résultats de calcul dans la fenêtre de sortie lors de l'exécution du programme. Cela permet aux utilisateurs de visualiser les données pertinentes et de comprendre les résultats plus facilement.