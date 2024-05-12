# EXIT

```abap
DO 5 TIMES.
  WRITE:/ SY-INDEX.
ENDDO.
```

Il est très important de toujours définir une sortie à une boucle au risque de créer une [BOUCLE INFINIE](./09_Boucle_Infinie.md). Dans cet exemple l’option `n TIMES` a été utilisée, mais il est également possible d’utiliser des instructions comme `EXIT`.

Ainsi en reprenant l’exemple ci-dessus, mais sans l’utilisation de `n TIMES` :

```abap
DO.
  IF SY-INDEX > 5.
    EXIT.
  ENDIF.
  WRITE:/ SY-INDEX.
ENDDO.
```

La boucle est appelée mais sans paramètre de sortie défini au préalable, une première condition va vérifier si la variable système [SY-INDEX](../00_HELP/02_SY_SYSTEM.md) est strictement supérieure à `5` : si oui alors le programme sortira de la boucle (`EXIT`), sinon, il n’entrera pas dans cette condition et affichera la valeur de [SY-INDEX](../00_HELP/02_SY_SYSTEM.mdd) à l’écran.

À noter qu’il aurait été possible également d’utiliser un `ELSE` sans qu’il n’y ait de changement dans le résultat :

```abap
DO.
  IF SY-INDEX > 5.
    EXIT.
  ELSE.
    WRITE:/ SY-INDEX.
  ENDIF.
ENDDO.
```
