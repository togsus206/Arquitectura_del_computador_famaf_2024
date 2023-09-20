/*

Considere que la siguiente sección de código está presente en el vector de excepciones de
un microprocesador LEGv8 (ISA completa), con el mismo tratamiento de excepciones
utilizado hasta el momento.
- En el caso de una excepción por Interrupción externa (IRQ), este código deberá
ejecutar la ISR alojada en la dirección con etiqueta “isr_proc”. Una vez que se
retorne de la ISR, se debe retomar el flujo original del programa previo a la
ocurrencia de la interrupción.
- En caso de un OpCode invalido se debe reemplazar el contenido de la memoria
que contiene la instrucción corrompida con el valor 0x8B1F03FF. Luego se debe
forzar la ejecución de este nuevo OpCode.
- Cualquier otra fuente de excepción el procesador debe quedar atrapado en un lazo
infinito dentro del vector de excepciones.

/*

exc_vector: 	mrs x9, ____________
		subis xzr, x9, ____
		b.ne jmp1
question1: 	____ isr_proc
		eret
jmp1: 		subis xzr, ____, 0x02
		b.ne exc_trap
		movz x9, _______, lsl #16
		movk x9, #0x03FF, lsl #0
		mrs ___, s2_0_c1_c0_0
		sturw ___,[x10, #0]
		____ x10
exc_trap: 	b exc_trap

*/



/***********************Punto 1*********************************
*/

/*

exc_vector: 	mrs x9, S2_0_C2_C0_0
		subis xzr, x9, #0x01
                b.ne jmp1
question1:  	b isr_proc
                eret
jmp1: 		subis xzr, x9, 0x02
                b.ne exc_trap
	        movz x9, #0x8B1F, lsl #16
		movk x9, #0x03FF, lsl #0
	        mrs x10, s2_0_c1_c0_0
		sturw x9,[x10, #0]
		br x10
exc_trap: 	b exc_trap



*/



/***********************Punto 2*********************************
*/


/***********************Punto A*********************************
*/

/*

i. Ante una excepción por IRQ queda atrapado en un bucle infinito. Falso. El enunciado indica que ante una excepción por IRQ debe ejecutar la ISR alojada en la dirección con etiqueta "isr_proc".

ii. Ante una excepción por OpCode Inválido queda atrapado en un bucle infinito. Falso. El enunciado indica que en caso de un OpCode inválido se reemplaza y se fuerza la ejecución de un nuevo OpCode.

iii. Se genera un comportamiento impredecible ante cualquier excepción, porque este caso no está contemplado en la lógica de excepciones. Falso. El comportamiento ante cada tipo de excepción está definido en el enunciado.

iv. No se realiza ninguna acción porque ya está en el vector de excepciones y retorna normalmente. Falso. Para excepciones por IRQ, se debe ejecutar la ISR "isr_proc".

v. En cualquier caso se reemplaza el OpCode Inválido y se retorna al flujo original del programa, previo a la ocurrencia de la primera interrupción. Falso. En caso de un OpCode inválido, se reemplaza pero no se especifica que se debe retornar al flujo original.

vi. Ninguna es correcta, ya que la lógica dependerá del tipo de excepción. Verdadero. El enunciado especifica claramente el comportamiento para cada tipo de excepción.



RESPUESTA: 
ii. Ante una excepción por OpCode Inválido, queda atrapado en un bucle infinito.

El código no está diseñado para manejar una excepción generada por un OpCode inválido en esta posición y, por lo tanto, el procesador quedaría atrapado en un bucle infinito.
*/


/***********************Punto B*********************************
*/


/*

i. No es posible para el procesador determinar la dirección de retorno para este contexto. Verdadero

ii. Siempre queda atrapado en el lazo "exc_trap". Solo si x9 != 0x02

iii. Siempre retorna a la dirección de memoria de la instrucción que generó la excepción + 4. Falso. No se especifica que siempre debe retornar a la dirección de memoria de la instrucción + 4.

iv. Siempre retorna a la dirección de memoria de la instrucción que generó la excepción. Falso. No necesariamente retorna a la dirección de la instrucción que generó la excepción, ya que esta puede haber sido reemplazada.


*/






