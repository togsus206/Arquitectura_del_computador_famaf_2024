Asuma que el siguiente código itera en un array largo y lleno de números enteros positivos aleatorios.
El código cuenta con 4 saltos, etiquetados B1, B2, B3 y B4. Cuando decimos que un salto es Taken,
nos referimos a que el código dentro de las llaves es ejecutado.


for (int i=0; i<N; i++) { 	/* B1 */
	val = array[i]; 	/* TAKEN PATH for B1 */
	if (val % 2 == 0) { 	/* B2 */
		sum += val; 	/* TAKEN PATH for B2 */
	}
	if (val % 3 == 0) { 	/* B3 */
		sum += val; 	/* TAKEN PATH for B3 */
	}
	if (val % 6 == 0) { 	/* B4 */
		sum += val; 	/* TAKEN PATH for B4 */
	}
}


a) Determinar cuál de los cuatro saltos muestra una correlación local.


b) ¿Existe correlación global entre algunos de los saltos? Explicar



----------------------------------------------------------------------------------------------------------


A) 

El salto B2 muestra una correlación local.

La correlación local se refiere a la tendencia de un salto a ser ejecutado o no ejecutado en función de la dirección del salto anterior.

En el código dado, el salto B2 solo se toma si el valor de la variable val es divisible por 2. Por lo tanto, la dirección del salto anterior (val % 2 == 0) tiene una influencia directa en la toma o no del salto B2.

Los otros tres saltos no muestran una correlación local.

El salto B1 se toma siempre, independientemente de la dirección del salto anterior.

El salto B3 se toma si el valor de la variable val es divisible por 3. Sin embargo, la dirección del salto anterior no tiene ninguna influencia en la divisibilidad de val por 3.

El salto B4 se toma si el valor de la variable val es divisible por 6. Sin embargo, la dirección del salto anterior no tiene ninguna influencia en la divisibilidad de val por 6.


Podemos demostrar la correlación local del salto B2 de la siguiente manera:

Supongamos que el valor de la variable val en la instrucción B1 es divisible por 2. En este caso, el salto B2 se tomará con certeza.

Por otro lado, supongamos que el valor de la variable val en la instrucción B1 no es divisible por 2. En este caso, el salto B2 no se tomará con certeza.

Por lo tanto, la dirección del salto anterior (val % 2 == 0) tiene una influencia directa en la toma o no del salto B2.

En conclusión, el salto B2 muestra una correlación local.


-----------------------------------------------------------------------------------------------------------


B) 

B4 está correlacionado con B2 y B3.
Si B2 y B3 son taken, B4 tambien lo va a ser.


**Respuesta:**

No existe correlación global entre ninguno de los cuatro saltos.

La correlación global se refiere a la tendencia de dos saltos a ser ejecutados o no ejecutados en conjunto.

En el código dado, los cuatro saltos son independientes entre sí.

El salto **B1** se toma siempre, independientemente de si los otros saltos se toman o no.

El salto **B2** se toma si el valor de la variable `val` es divisible por 2. El valor de la variable `val` no tiene ninguna influencia en la toma o no de los otros saltos.

Los saltos **B3** y **B4** se toman si el valor de la variable `val` es divisible por 3 o 6, respectivamente. Sin embargo, el valor de la variable `val` no tiene ninguna influencia en la toma o no de los otros saltos.

**Explicación:**

Podemos demostrar la ausencia de correlación global de los cuatro saltos de la siguiente manera:

Supongamos que el salto **B1** se toma. En este caso, los otros tres saltos pueden tomarse o no tomarse, independientemente de si el salto **B1** se tomó o no.

Por otro lado, supongamos que el salto **B1** no se toma. En este caso, los otros tres saltos también pueden tomarse o no tomarse, independientemente de si el salto **B1** se tomó o no.

Por lo tanto, los cuatro saltos son independientes entre sí y no existe correlación global entre ellos.

En conclusión, no existe correlación global entre ninguno de los cuatro saltos.
