# OFFSET (REORGANISATION)

```abap
Variable[+pos](nbre)
```

Afin de pouvoir extraire ou réorganiser une chaîne de caractères, cette instruction permet de faire une sélection à partir d’une position `pos` sur un nombre de caractères définis `nbre`

La date [SY-DATUM](../../00_HELP/02_SY_SYSTEM.md) sur SAP adopte le format `AAAAMMJJ`. Comment faire afin qu’elle réponde au schéma `JJ-MM-AAAA`. Pour ceci, l’instruction [CONCATENATE](./08_INSTRUCTION_CONCATENATE.md) sera également utilisée.

Exemple

```abap
DATA: lv_date(10) TYPE C.

CONCATENATE SY-DATUM+6(2)
            SY-DATUM+4(2)
            SY-DATUM(4) 
  INTO lv_date 
  SEPARATED BY '-'.

CONDENSE V_DATE NO-GAPS.

WRITE:/ SY-DATUM,
      / V_DATE.
```

Une variable `lv_date` est déclarée de type chaîne de caractères de dix positions afin de pouvoir stocker la date finale, puis la date système [SY-DATUM](../../00_HELP/02_SY_SYSTEM.md) sera travaillée de la façon suivante :

- `SY-DATUM+6(2)` : à la sixième position, prendre deux caractères afin d’obtenir le jour.

- `SY-DATUM+4(2)` : à la quatrième position, prendre deux caractères afin d’extraire le mois.

- `SY-DATUM(4)` : prendre les quatre premiers caractères pour l’année.

Pour rappel, la première position d’une chaîne de caractères commence toujours par 0 !

Tout ceci sera concaténé [CONCATENATE](./08_INSTRUCTION_CONCATENATE.md) `INTO lv_date` avec `SEPARATED BY -`, puis par précaution, tous les espaces seront retirés (`CONDENSE... NO-GAPS`).

Le résultat final ressemblera au format espéré : JJMMAAAA
