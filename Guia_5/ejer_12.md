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

A)

El tiempo de ciclo de un procesador es el tiempo que tarda en ejecutar una instrucción. En este caso, el tiempo de ciclo se determina por el tiempo de acceso a la caché L1.

Procesador 1:

El tiempo de ciclo del procesador 1 es de 0,66 ns.

f = 1 / t_ciclo
f = 1 / 0,66 ns
f = 1,51 ns

Procesador 2:

El tiempo de ciclo del procesador 2 es de 0,9 ns.

f = 1 / t_ciclo
f = 1 / 0,9 ns
f = 1,11 ns




-----------------------------------------------------------------------------------------------------------



B)


El Average Memory Access Time (AMAT) se puede calcular utilizando la siguiente fórmula:

 AMAT = Hit Time + Miss_Rate x Miss_Penalty

Donde:
- Hit Time es el tiempo que lleva acceder a la caché en caso de acierto (proporcionado en la tabla).
- Miss Rate es la tasa de fallos en la caché (proporcionada en la tabla).
- Miss Penalty es el tiempo adicional que se tarda cuando hay un fallo de caché, y se puede calcular utilizando el tiempo de acceso a la memoria principal (Main Memory Access Time).

Para el Procesador 1:
	Miss_Penalty_P1 = 70 ns - 0.66 ns = 69.34 ns

	AMAT_{P1} = 0.66 ns + 0.08 x 69.34 ns = 5.6232 ns



Para el Procesador 2:
	Miss_Penalty_P2 = 70 ns - 0.9 ns = 69.1 ns

	AMAT_{P2} = 0.9 ns + 0.06 x 69.1 ns = 4.544 ns

-----------------------------------------------------------------------------------------------------------------------


C)


**Solución:**

El CPI total de un procesador es la suma del CPI de las instrucciones y el CPI de los datos.

En este caso, el CPI de las instrucciones es de 1.

El CPI de los datos es igual al AMAT.

**Procesador 1:**

El CPI total del procesador 1 es de 6,18 ns.

```
CPI_total = CPI_instrucciones + CPI_datos
CPI_total = 1 + 6,18 ns
CPI_total = 7,18 ns
```

**Procesador 2:**

El CPI total del procesador 2 es de 5,05 ns.

```
CPI_total = CPI_instrucciones + CPI_datos
CPI_total = 1 + 5,05 ns
CPI_total = 6,05 ns
```

**Respuesta:**

El CPI total del procesador 2 es de 6,05 ns, que es menor que el CPI total del procesador 1, que es de 7,18 ns. Por lo tanto, el procesador 2 es más rápido que el procesador 1.

**Explicación:**

El procesador 2 tiene un CPI total menor que el procesador 1 porque tiene un AMAT menor. Esto se debe a que tiene una tasa de fallos de caché más baja.

En resumen, el procesador 2 es más rápido que el procesador 1 porque tiene un CPI total menor.







