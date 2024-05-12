# ALGORITHME

L'algorithme est la dernière étape avant le [DEVELOPPEMENT](./04_DEVELOPPEMENT.md). Il s'agit ici de décrire le programme final en étape simple LDA en respectant les problématiques du document fonctionnel sans tenir compte du langage de programmation.

EXEMPLE

Lister tous les documents de vente de la société selon le pays du client et/ou le produit vendu. Il faudra créer un écran de sélection contenant deux paramètres : le pays d'origine du client ainsi que le produit. Le code pays est obligatoire.

L'algorithme sera alors :

```
ECRAN DE SELECTION

Sélection multiple CODE_PAYS (obligatoire)        
                   PRODUITS

DEBUT
  SI CODE_PAYS n'est pas renseigné
      ALORS Message erreur
  SINON
      Sélection des clients avec CODE_PAYS

  SI sélection retourne un résultat
      ALORS sélection des documents de vente avec PRODUIT écran de sélection

      SI sélection retourne un résultat
          BOUCLE sur la table des documents de vente
              SI la ligne est informée
                  SI le client du document de vente appartient à la table des clients
                      ALORS Afficher Ligne
                      ALORS Passer à la ligne suivante
                  SINON passer à la ligne suivante
              SINON passer à la ligne suivante
          FIN de la boucle
      SINON Message Erreur
  SINON Message Erreur
FIN
```

Il est possible également de faire un algorithme graphique, beaucoup plus clair et lisible que le littéral.

![](../ressources/01_03_01.png)
