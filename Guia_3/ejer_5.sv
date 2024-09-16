/*
exc_vector: MRS x9, S2_0_C2_C0_0
	    CMP X9, 0x01
	    B.EQ trap
	    MRS X9, S2_0_C0_C0_0
	    BR X9
trap:	    B trap

*/

/*
Ante la ocurrencia de una excepción, el código queda atrapado en un lazo
infinito…

D: Ninguna de las anteriores.

el lazo infinito ocurre solo cuando se cumple una condición específica (es decir, cuando se compara el valor de X9 con 0x01 y esta comparación es verdadera). En este caso, el procesador salta a la etiqueta trap, donde se encuentra el bucle infinito.
Esto no significa que todas las excepciones, o que solo excepciones específicas (como un OpCode inválido o una interrupción externa), causen un bucle infinito de manera predeterminada. Dependerá del manejo que se haya implementado en la rutina de servicio de la excepción (ISR). 
*/

/*


“Si suponemos que la instrucción de la línea 2> está corrompida en memoria de
forma permanente (generando un OpCode invalido), considerando la
implementación particular de nuestro procesador, el mismo...”: 

**b. … queda atrapado en el bucle infinito del label “trap”**.

Explicación:
- Si la instrucción `CMP X9, 0x01` está corrupta en memoria y genera un **OpCode inválido**, es muy probable que el procesador detecte esta excepción (asumiendo que está implementado el manejo de excepciones para OpCode inválido) y salte al vector de excepciones.
  
  En ese caso, el código en el vector de excepciones incluye la instrucción `CMP X9, 0x01`. Si se cumple la condición de que **X9** es igual a `0x01`, se ejecutará un salto al label `trap`, que contiene un bucle infinito con la instrucción `B trap`.

- Entonces, debido a la corrupción de la instrucción y la detección de la excepción, el procesador terminaría atrapado en el bucle infinito del label `trap`.

/*


/*

 “Este código retorna a la dirección de memoria donde se encuentra …”:
 
**d. … la siguiente instrucción que debía ejecutarse de no haberse producido una excepción por interrupción externa.**

Explicación:
- En el código que has mostrado, la instrucción **`MRS X9, S2_0_C0_C0_0`** parece estar relacionada con la recuperación de la dirección de retorno del procesador, donde se almacena la dirección a la que debe regresar después de que se maneje la excepción. Si se tratara de una **interrupción externa**, el procesador típicamente guarda la dirección de la siguiente instrucción (es decir, la instrucción que debía ejecutarse si no hubiese ocurrido la interrupción).

- En el caso de excepciones e interrupciones, el procesador guarda la dirección de la siguiente instrucción en el **program counter (PC)** antes de saltar al vector de interrupciones o excepciones. Al ejecutar una instrucción de retorno de la excepción, como **`ERET`** o similar, el procesador vuelve a la instrucción siguiente, asegurando que el flujo de control continúe donde quedó antes de que la excepción interrumpiera la ejecución.

Por lo tanto, el código retornaría a la **siguiente instrucción** que habría sido ejecutada si no hubiera ocurrido la interrupción, lo que hace correcta la opción **d**. 
 

*/

