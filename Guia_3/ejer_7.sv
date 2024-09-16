/*

Considere que la siguiente sección de código está presente en el vector de excepciones
del procesador implementado. En el caso de una excepción por OpCode invalido, este
código deberá ejecutar un procedimiento alojado en la dirección 0x0400, usando X0
como argumento que contenga la dirección del OpCode invalido.
Completar el código con los argumentos faltantes:


esr_address:
			mrs x9,________
			subis xzr, x9, #____
			b.ne esr_end
			mrs ____, s2_0_c1_c0_0
			add x10, x0, xzr
			movz x9, #0x______, lsl #0
			br _________
esr_end:	eret



esr_address:
    mrs x9, S2_0_C2_C0_0       // Obtiene el valor del registro ESR_EL1
    subis xzr, x9, #0x020000      // Compara con 1 (indicando excepción por OpCode inválido)
    b.ne esr_end            // Salta si no es igual (no es una excepción por OpCode inválido)
    mrs x0, S2_0_C1_C0_0   // Obtiene el valor de S2_0_C1_C0_0
    add x10, x0, xzr        // Calcula x10 como x0 + xzr (argumento: dirección del OpCode inválido)
    movz x9, #0x0400, lsl #0  // Carga la dirección 0x0400 en x9
    br x9                  // Salta a la dirección 0x0400
esr_end: eret              // Fin de excepción, retorna





1 - mrs x9,________: Se debe cargar el registro de estado de excepción. Este registro contiene información sobre el tipo de excepción (como un OpCode inválido). El registro específico para almacenar el Exception Syndrome Register (ESR) en AArch64 es ESR_ELx (donde x es el nivel de excepción, normalmente 1 o 2). En este caso, lo más común es usar ESR_EL1 para excepciones en nivel de privilegio EL1.

Respuesta: mrs x9, ESR_EL1(S2_0_C2_C0_0)

2- subis xzr, x9, #____: Esta línea compara el valor del ESR con un código de excepción específico para OpCode inválido. Cada excepción tiene un código específico, y el código para OpCode inválido suele ser 0x020000 en muchos procesadores. El subis realiza la comparación y actualiza los flags.

Respuesta: subis xzr, x9, #0x020000

3 - b.ne esr_end:  Si el código de excepción no corresponde a un OpCode inválido, saltará a la etiqueta esr_end.

4 - mrs ____, s2_0_c1_c0_0: Esta instrucción carga la dirección del Program Counter (PC) donde ocurrió la excepción. El registro de uso común para acceder a la dirección de la instrucción donde ocurrió la excepción es ELR_EL1 (Exception Link Register).

5 - Respuesta: mrs x0, ELR_EL1(S2_0_C1_C0_0)

6 - movz x9, #0x______, lsl #0: Se carga una dirección con la instrucción MOVZ. Nos indican que la dirección a cargar es 0x0400, por lo que se debe mover ese valor en x9.

Respuesta: movz x9, #0x0400, lsl #0

7 - br _________: Esta instrucción realiza un salto incondicional a la dirección que contiene el registro. Se debe saltar a la dirección contenida en x9.

Respuesta: br x9



*/
