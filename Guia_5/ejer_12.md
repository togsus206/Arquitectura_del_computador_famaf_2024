La siguiente tabla muestra los datos de la caché de un solo nivel (L1) para dos procesadores distintos
(P1 y P2). En ambos procesadores el tiempo de acceso a memoria principal es de 70ns y el 36% de
las instrucciones acceden a la memoria de datos.

			L1 size 	L1 miss rate	L1 Hit Time

Procesador 1	    	2Kib			8%		0.66ns

Procesador 2 		4Kib			6%		0.9 ns



a. Asumiendo que el hit time de la caché L1 determina el tiempo de ciclo de ambos
procesadores, calcule sus respectivas frecuencias de CLK.

b. ¿Cual es el AMAT para ambos procesadores?


c. Asumiendo un CPI de 1 (sin memory stalls) y considerando las penalidades derivadas de
instrucciones y datos (mismo Miss Rate), ¿cuál es el CPI total para ambos procesadores?
¿Cuál de los dos procesadores es más rápido?


--------------------------------------------------------------------------------------------------------

A)

Para calcular la frecuencia de reloj (CLK) para cada procesador, utilizaremos la fórmula que relaciona el tiempo de ciclo (TC) con el tiempo de acceso a la caché (Hit Time) y el tiempo de acceso a la memoria principal (Main Memory Access Time):

 TC = Max(Hit Time, Main Memory Access Time) 

Dado que se nos dice que el Hit Time determina el tiempo de ciclo, podemos usar esta fórmula para cada procesador y luego calcular la frecuencia de reloj (f) usando la relación f = 1/TC

Para el Procesador 1:
 TC_{P1} = Max(0.66 ns, 70 ns) = 70 ns

	f_p1 = 1/70ns 

Para el Procesador 2:
 TC_{P2} = Max(0.9 ns, 70 ns) = 70 ns

	f_p2 = 1/70ns

Dado que ambos procesadores tienen el mismo tiempo de ciclo, su frecuencia de reloj es la misma:

	f_{P1} = f_{P2} = 1/70 ns

Ahora, calculamos el valor numérico:
	f_{P1} = f_{P2} = 1/(70x10-9)s


 f_{P1} = f_{P2} = 14.29 MHz

Por lo tanto, la frecuencia de reloj para ambos procesadores es aproximadamente 14.29 MHz




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



El CPI total (CPI_{total}) para ambos procesadores puede calcularse considerando el CPI base (CPI_{base}) de 1 (sin memory stalls) y sumando las penalidades derivadas de los fallos en la caché (memory stalls).

 CPI_{total} = CPI_{base} + Memory Stall Cycles xMiss Rate 

Donde:
- CPI_{base}  es el CPI base sin memory stalls, dado como 1.
- Memory Stall Cycles es el número de ciclos de stall debidos a fallos de caché, igual al Miss Penalty.
- Miss Rate es la tasa de fallos en la caché, proporcionada en la tabla.

Para el Procesador 1:

	 CPI_{total, P1} = 1 + Miss Penalty_{P1} x Miss Rate_{P1} 

	 CPI_{total, P1} = 1 + 69.34 x 0.08 = 6.5472 


Para el Procesador 2:

	 CPI_{total, P2} = 1 + Miss Penalty_{P2} x Miss Rate}_{P2}

	 CPI_{total, P2} = 1 + 69.1 x 0.06 = 5.146 

Comparando los CPI totales, el Procesador 2 (CPI_{total, P2} ≈ 5.146) tiene un CPI total menor, lo que significa que es más rápido en términos de rendimiento en comparación con el Procesador 1 (CPI_{total, P1} ≈ 6.5472).







