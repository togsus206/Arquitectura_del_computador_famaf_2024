/*

exc_vector: MRS X9, S2_0_C2_C0_0
	    CMP x9, 0x01
	    B.NE end
	    MRS x10, S2_0_C2_C0_0
	    MOVZ x9, #0x8B1F, LSL #16
	    MOVZ x9, #0x03FFF, LSL #0
	    STURW W9, [X10, #0]
end: ERET

*/

/*

Ante la ocurrencia de una excepción por OpCode invalido, este código...

a. … siempre retorna a la dirección de memoria de la instrucción que generó la excepción + 4.

En el caso de una excepción por OpCode inválido, la instrucción "ERET" (Exception Return) se utiliza para volver a la dirección de memoria de la instrucción que generó la excepción, más un desplazamiento de 4 para continuar la ejecución normalmente después de la excepción. Este es un comportamiento típico en muchos procesadores cuando ocurre una excepción.
*/

/*

“Si suponemos que la instrucción de la línea 3> está corrompida en memoria de
forma permanente (generando un OpCode invalido), considerando la
implementación particular de nuestro procesador, el mismo...”

b. … queda atrapado en el bucle infinito.

Si la instrucción en la línea 3 genera un OpCode inválido debido a una corrupción en memoria, no podrá ejecutarse correctamente y el flujo de control quedará atrapado en el bucle infinito definido por el label "end" y la instrucción "B end". Por lo tanto, el procesador quedará en un bucle infinito y no podrá continuar la ejecución normal.

*/

/*
“Ante la ocurrencia de una excepción por interrupción externa, este código... ”

a. … no realiza ninguna acción.

Si se produce una excepción por interrupción externa, el código en este ejemplo no tiene una rutina específica para manejarla. En ausencia de una rutina de excepción para manejar la interrupción externa, el procesador simplemente no realiza ninguna acción adicional y continúa la ejecución normal si es posible. Por lo tanto, no se produce un retorno específico a la dirección de memoria de la instrucción que generó la excepción, ni se ejecuta una acción especial.



*/


/*





*/

