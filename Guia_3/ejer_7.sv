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
esr_end: eret



esr_address:
    mrs x9, S2_0_C2_C0_0       // Obtiene el valor del registro ESR_EL1
    subis xzr, x9, 0X01      // Compara con 1 (indicando excepción por OpCode inválido)
    b.ne esr_end            // Salta si no es igual (no es una excepción por OpCode inválido)
    mrs x10, S2_0_C1_C0_0   // Obtiene el valor de S2_0_C1_C0_0
    add x10, x0, xzr        // Calcula x10 como x0 + xzr (argumento: dirección del OpCode inválido)
    movz x9, #0x0400, lsl #0  // Carga la dirección 0x0400 en x9
    br x9                  // Salta a la dirección 0x0400
esr_end: eret              // Fin de excepción, retorna









*/
