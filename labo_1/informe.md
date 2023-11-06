

### LABORATORIO 1: ARQUITECTURA DEL COMPUTADOR 


## INTEGRANTE: Matias Valle 


# Desarrollo


**Cambios realizados en el módulo `decode.sv`:**

* Se agregó una nueva condición al `if` para verificar si la instrucción es MOVZ y solo tiene un operando.
* Si la condición se cumple, se establece el valor inmediato en la señal `signImm_D`.

**Explicación de los cambios en el módulo `decode.sv`:**

* La condición adicional verifica si la instrucción es MOVZ y solo tiene un operando. Esto es necesario para determinar si la instrucción está moviendo un valor inmediato al registro o el valor de un registro.
* Si la condición se cumple, se establece el valor inmediato en la señal `signImm_D`. Este valor se utilizará en el módulo `execute` para calcular el resultado de la operación ALU.

**Cambios realizados en el módulo `aludec.sv`:**

* Se agregó una nueva condición al `if` para verificar si la señal `zero_E` es 1.
* Si la condición se cumple, se establece la señal `writeData_E` en el valor del registro 3.

**Explicación de los cambios en el módulo `aludec.sv`:**

* La condición adicional verifica si la señal `zero_E` es 1. Esto es necesario para determinar si el valor que se va a mover al registro es cero.
* Si la condición se cumple, se establece la señal `writeData_E` en el valor del registro 3. Este valor es el valor que se moverá al registro de destino.

**Conclusión:**

Con estos cambios, el procesador ahora puede ejecutar la instrucción MOVZ de la siguiente manera:

1. La instrucción se decodifica en la etapa ID.
2. Si la instrucción es MOVZ y solo tiene un operando, se establece el valor inmediato en la señal `signImm_D`.
3. El resultado de la operación ALU se calcula en la etapa EX.
4. Si la señal `zero_E` es 1, se establece la señal `writeData_E` en el valor del registro 3.
5. El valor del registro 3 se escribe en el registro de destino en la etapa MEM.

Este comportamiento es consistente con la definición de la instrucción MOVZ.

Espero que este informe sea de tu ayuda.

¿Hay algo más que pueda ayudarte?