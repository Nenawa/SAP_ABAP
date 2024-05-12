# FIELD-SYMBOLS

Un ``FIELD-SYMBOLS`` est une variable spéciale qui agit comme un pointeur ou une référence vers une zone de mémoire. Cela signifie que lorsque vous affectez une valeur à un ``FIELD-SYMBOLS``, vous affectez réellement la valeur à la zone de mémoire qu'il pointe, et non à la variable elle-même.

## FIELD-SYMBOLS ...

L’instruction commencera par `FIELD-SYMBOLS` et devra comporter obligatoirement un nom entre crochets ``<NOM>``.

```abap
FIELD-SYMBOLS <lfs_integerTYPE i.

FIELD-SYMBOLS: <lfs_field1TYPE any,
               <lfs_field2TYPE any,
               <lfs_field3TYPE any.  
```

## ... NOM ...

Il existe plusieurs conventions de nommage pour les ``FIELD-SYMBOLS``. Voici quelques-unes des conventions couramment utilisées :

- ``Préfixe <lfs_>`` : Certains développeurs préfixent leurs field-symbols avec ``<lfs_>`` pour indiquer qu'il s'agit d'un pointeur de champ. Par exemple : ``<lfs_field>``.
- ``Utiliser le préfixe <lfs_pour les field-symbols locales`` : Le préfixe ``<lfs_>`` (pour "local field-symbols") est souvent utilisé pour indiquer que le field-symbol est local à une certaine portée (Scope).
- ``Utiliser le préfixe <gfs_pour les field-symbols globaux`` : De manière similaire, le préfixe ``<gfs_>`` (pour "global field-symbols") peut être utilisé pour indiquer que le field-symbols est globale et peut être accessible depuis plusieurs parties du programme.
- ``Utilisation du nom de la structure ou de la table`` : Si le pointeur de champ est destiné à pointer vers une structure ou une table spécifique, vous pouvez utiliser le nom de cette structure ou table comme base du nom du pointeur de champ. Par exemple : ``<lfs_customer>`` si le pointeur pointe vers des données de client.
- ``Nom des champs`` : Si le pointeur de champ est destiné à pointer vers un champ spécifique dans une structure ou une table, vous pouvez inclure le nom du champ dans le nom du pointeur de champ. Par exemple : ``<lfs_customer_name>``.
- ``Noms des types de données`` : Parfois, les noms des types de données sont inclus dans les noms des pointeurs de champ pour clarifier le type de données pointé. Par exemple : ``<lfs_string>`` pour un pointeur de champ pointant vers une chaîne de caractères.
- ``Noms des domaines`` : Si le pointeur de champ est basé sur un domaine spécifique, vous pouvez inclure le nom de ce domaine dans le nom du pointeur de champ. Par exemple : ``<lfs_amount>`` pour un pointeur de champ basé sur un domaine de montant.
- ``Noms génériques`` : Dans certains cas, des noms génériques peuvent également être utilisés si la destination du pointeur de champ est générale ou non spécifiée. Par exemple : ``<lfs_generic>``.