La siguiente tabla muestra los datos de la caché de un solo nivel (L1) para dos procesadores distintos
(P1 y P2). En ambos procesadores el tiempo de acceso a memoria principal es de 70ns y el 36% de
las instrucciones acceden a la memoria de datos.

				L1 size 	L1 miss rate	L1 Hit Time

Procesador 1	    2Kib			8%		0.66ns

Procesador 2 		4Kib			6%		0.9 ns



a. Asumiendo que el hit time de la caché L1 determina el tiempo de ciclo de ambos
procesadores, calcule sus respectivas frecuencias de CLK.

b. ¿Cual es el AMAT para ambos procesadores?


c. Asumiendo un CPI de 1 (sin memory stalls) y considerando las penalidades derivadas de
instrucciones y datos (mismo Miss Rate), ¿cuál es el CPI total para ambos procesadores?
¿Cuál de los dos procesadores es más rápido?


--------------------------------------------------------------------------------------------------------


### a. Calcular la frecuencia de reloj (CLK)

El hit time de la caché L1 determina el tiempo de ciclo de ambos procesadores. La frecuencia de reloj es el inverso del tiempo de ciclo.

Para el Procesador 1 (P1), el hit time es de 0.66 ns, por lo que la frecuencia es 1 / 0.66 ns, que da aproximadamente 1.515 GHz.

Para el Procesador 2 (P2), el hit time es de 0.9 ns, así que la frecuencia es 1 / 0.9 ns, que da aproximadamente 1.111 GHz.

---

### b. Calcular el AMAT (Tiempo de acceso promedio)

El AMAT se calcula sumando el hit time más el producto del miss rate y la miss penalty (tiempo de acceso a la memoria principal). La miss penalty es 70 ns para ambos procesadores.

Para el Procesador 1 (P1), el hit time es 0.66 ns, el miss rate es 8% (o 0.08), y la miss penalty es 70 ns. Entonces, AMAT = 0.66 ns + (0.08 * 70 ns) = 6.26 ns.

Para el Procesador 2 (P2), el hit time es 0.9 ns, el miss rate es 6% (o 0.06), y la miss penalty es 70 ns. Entonces, AMAT = 0.9 ns + (0.06 * 70 ns) = 5.1 ns.

---

### c. Calcular el CPI total

El CPI total se calcula sumando el CPI base (que es 1) más el producto del miss rate, la penalidad por miss y la frecuencia de acceso a memoria. La frecuencia de acceso a memoria es 36% (o 0.36).

Para el Procesador 1 (P1), el miss rate es 8% (o 0.08), la penalidad por miss es 70 ns, y la frecuencia de acceso a memoria es 36%. Entonces, el CPI total es 1 + (0.08 * 70 ns * 0.36) = 3.016.

Para el Procesador 2 (P2), el miss rate es 6% (o 0.06), la penalidad por miss es 70 ns, y la frecuencia de acceso a memoria es 36%. Entonces, el CPI total es 1 + (0.06 * 70 ns * 0.36) = 2.512.

---

### ¿Cuál procesador es más rápido?

Para determinar cuál procesador es más rápido, comparamos la relación entre la frecuencia de reloj y el CPI total.

Para el Procesador 1 (P1), su rendimiento es 1.515 GHz / 3.016, que da aproximadamente 0.502 GHz.

Para el Procesador 2 (P2), su rendimiento es 1.111 GHz / 2.512, que da aproximadamente 0.442 GHz.

Por lo tanto, a pesar de tener un CPI total mayor, el P1 es un poco más rápido que el P2 debido a su mayor frecuencia de reloj.






