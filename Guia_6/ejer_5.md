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


Evaluación 	Valor 		GR 			Resultado
j < 3 		j = 1 		1101 (TTNT) 		Taken
j < 3 		j = 2 		1011 (TNTT) 		Taken
j < 3 		j = 3 		0111 (NTTT) 		Not Taken
i < 100 	i = 10 		1110 (TTTN) 		Taken



GHR 	PC 	Resultado
1101 	0100 	11
1011 	0100 	11
0111 	0100 	00
1110 	0000 	11


----------------------------------------------------------------------------------------------------------------------


B)


Para la comparación de la precisión, primero necesitamos entender cómo funciona un predictor de 2-bits. En un predictor de 2-bits, cada entrada en la tabla tendría dos bits para mantener el historial de predicciones (00, 01, 10, 11). Vamos a analizar cómo se comportaría este predictor en base a las evaluaciones proporcionadas en el primer punto.

Evaluación 	Valor 	Predictor 		Resultado
j < 3 		j = 1 	11 (Taken) 		Taken
j < 3 		j = 2 	10 (Weakly Taken) 	Taken
j < 3 		j = 3 	01 (Weakly Not Taken) 	Not Taken
i < 100 	i = 10 	11 (Taken) 		Taken

Ahora, comparemos las predicciones entre el predictor de 2-bits y el predictor de saltos local de dos niveles con n=4 y m=4:

Predictor de 2-bits:
- Correctas: 3 (de 4 predicciones)
- Precisión: 75%

Predictor de saltos local de dos niveles con n=4 y m=4:
- Correctas: 3 (de 4 predicciones)
- Precisión: 75%

Ambos predictores tienen la misma precisión en este caso particular, por lo que en términos de precisión, no hay diferencia entre ellos para este código específico y las evaluaciones proporcionadas.



