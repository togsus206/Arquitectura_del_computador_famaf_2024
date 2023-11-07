El siguiente código en C puede escribirse en ARMv8 de la siguiente forma:


for (i = 0; i < 100; i++) {
	for (j = 0; j < 3; j++) {
		…
	}
}


0x00: add x0, xzr, xzr
0x04: L2: add x1, xzr, xzr
0x08: L1: …
0x0C: addi x1, x1, 1
0x10: cmpi x1, 3
0x14: b.lt L1
0x18: addi x0, x0, 1
0x1C: cmpi x0, 99
0x20: b.lt L2



a) Mostrar como queda la tabla de historial de patrones (PHT) considerando que el procesador que
ejecuta este código, cuenta con un predictor de saltos local de dos niveles con n=4 y m=4.


b) Comparar la precisión de este predictor con uno de 2-bits (despreciando los primeros ciclos de
iniciación).


--------------------------------------------------------------------------------------------------------------------


A)

**Respuesta:**

La tabla de historial de patrones (PHT) para un predictor de saltos local de dos niveles con n=4 y m=4 es una matriz de 16x16. Cada entrada de la matriz representa un patrón de 4 bits de la dirección del salto y un valor de predicción.

El código en ARMv8 dado tiene dos instrucciones de salto:

* `L2: add x1, xzr, xzr`
* `L1: …`

La dirección de la primera instrucción de salto es 0x04. La dirección de la segunda instrucción de salto es 0x08.

El patrón de 4 bits para la primera instrucción de salto es 0001. El patrón de 4 bits para la segunda instrucción de salto es 0010.

El valor de predicción para la primera instrucción de salto es "Taken". El valor de predicción para la segunda instrucción de salto es "Not Taken".

Por lo tanto, la tabla de historial de patrones (PHT) quedaría de la siguiente forma:

```
0001: Taken
0010: Not Taken
```

**Explicación:**

El predictor de saltos local de dos niveles funciona de la siguiente manera:

* En la etapa de fetch, el procesador busca el patrón de 4 bits de la dirección del salto en la tabla de historial de patrones (PHT).
* Si el patrón se encuentra en la PHT, el procesador utiliza el valor de predicción almacenado en la entrada correspondiente.
* Si el patrón no se encuentra en la PHT, el procesador utiliza el valor de predicción predeterminado.

En este caso, el patrón de 4 bits de la primera instrucción de salto es 0001. Este patrón no se encuentra en la PHT, por lo que el procesador utiliza el valor de predicción predeterminado, que es "Taken".

El patrón de 4 bits de la segunda instrucción de salto es 0010. Este patrón tampoco se encuentra en la PHT, por lo que el procesador utiliza el valor de predicción predeterminado, que es "Not Taken".

**Conclusión:**

La tabla de historial de patrones (PHT) quedaría de la siguiente forma:

```
0001: Taken
0010: Not Taken
```

Esta tabla de historial de patrones es solo un ejemplo. La tabla real de historial de patrones variará en función del código que se ejecute.


----------------------------------------------------------------------------------------------------------------------


B)


Para la comparación de la precisión, primero necesitamos entender cómo funciona un predictor de 2-bits. En un predictor de 2-bits, cada entrada en la tabla tendría dos bits para mantener el historial de predicciones (00, 01, 10, 11). Vamos a analizar cómo se comportaría este predictor en base a las evaluaciones proporcionadas en el primer punto.

Evaluación 	Valor 	Predictor 				Resultado
j < 3 		j = 1 	11 (Taken) 				Taken
j < 3 		j = 2 	10 (Weakly Taken) 		Taken
j < 3 		j = 3 	01 (Weakly Not Taken) 	Not Taken
i < 100 	i = 10 	11 (Taken) 				Taken

Ahora, comparemos las predicciones entre el predictor de 2-bits y el predictor de saltos local de dos niveles con n=4 y m=4:

Predictor de 2-bits:
- Correctas: 3 (de 4 predicciones)
- Precisión: 75%

Predictor de saltos local de dos niveles con n=4 y m=4:
- Correctas: 3 (de 4 predicciones)
- Precisión: 75%

Ambos predictores tienen la misma precisión en este caso particular, por lo que en términos de precisión, no hay diferencia entre ellos para este código específico y las evaluaciones proporcionadas.



