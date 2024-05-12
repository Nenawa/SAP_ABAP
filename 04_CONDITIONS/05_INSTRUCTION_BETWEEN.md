# BETWEEN

```abap
DATA: lv_variable TYPE i.

IF lv_variable BETWEEN 1 AND 100.
  WRITE: 'La variable lv_variable est comprise entre 1 et 100.'.
ELSE.
  WRITE: 'La variable lv_variable n'est pas comprise entre 1 et 100.'.
ENDIF.
```

```abap
DATA: lv_variable TYPE i.

CASE lv_variable.
  WHEN BETWEEN 1 AND 100.
    WRITE: 'La variable lv_variable est comprise entre 1 et 100.'.
  WHEN OTHERS.
    WRITE: 'La variable lv_variable n''est pas comprise entre 1 et 100.'.
ENDCASE.
```

L'instruction ``BETWEEN`` en SAP ABAP est utilisée pour vérifier si une valeur se situe dans une plage donnée. Voici un exemple d'utilisation de l'instruction ``BETWEEN`` avec [IS INITIAL](./04_INSTRUCTION_INITIAL.md).

Dans l'exemple, si ``lv_variable`` est initialisée et que sa valeur est comprise entre 1 et 100 (inclusivement), alors la première instruction [WRITE](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/05_INSTRUCTION_WRITE.md) sera exécutée. Sinon, la deuxième instruction [WRITE](../03_VARIABLES_&_CONSTANTES/02_VARIABLES_&_CONSTANTES/05_INSTRUCTION_WRITE.md) sera exécutée.