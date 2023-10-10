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

Dado que el número obtenido es aleatorio, es imposible predecir localmente los saltos B2, B3 y B4
Sin embargo, el salto B1 si puede ser predecido localmente.


-----------------------------------------------------------------------------------------------------------


B) 

B4 está correlacionado con B2 y B3.
Si B2 y B3 son taken, B4 tambien lo va a ser.
