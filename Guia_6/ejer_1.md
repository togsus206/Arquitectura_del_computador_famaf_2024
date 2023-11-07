Considere construir un procesador con pipeline dividiendo el procesador de un solo ciclo en N etapas. El
procesador de ciclo único tiene un retardo de propagación a través de la lógica combinacional de 740ps.
La penalidad por agregar un registro de pipeline es de 90ps. Suponga que el retardo de la lógica
combinacional se puede dividir arbitrariamente en cualquier número de etapas y que la lógica de hazard
del pipeline no aumenta el retardo.

Asumiendo que un pipeline de cinco etapas tiene un CPI de 1.23 y que cada etapa adicional aumenta el
CPI en 0.1 debido a las predicciones de salto erróneas y otros hazard. ¿Cuántas etapas de pipeline
deberían usarse para hacer que el procesador ejecute los programas lo más rápido posible?


--------------------------------------------------------------------------------------------------------------------



Latencia de una etapa = tiempo de ciclo (TC) = (740/N+90) ps

CPI = 1,23 + 0.1(N-5)

Tiempo por instruccion (Ti) = Tc * CPI


N	TC[ps] 		CPI		Ti[ps]
5	238			1.23	292,74
6	213,33		1.33	283,73
7	195,71		1.43	279.87
8	182,5		1,53	279,23
9	172.22		1.63	280,72
10	164			1.73	283.72


-------------------------------------------------------------------------------------------------------------------

Para encontrar el número óptimo de etapas de pipeline, debemos encontrar el punto en el que el tiempo de ciclo del procesador se minimiza.

El tiempo de ciclo del procesador con N etapas es:

```
T_ciclo = T_combinacional + (N - 1) * T_registro
```

Donde:

* T_combinacional es el retardo de propagación a través de la lógica combinacional
* T_registro es la penalidad por agregar un registro de pipeline

Dado que el CPI de un pipeline de cinco etapas es 1.23, el tiempo de ciclo del procesador es:

```
T_ciclo = 740ps + (5 - 1) * 90ps = 1230ps
```

Por lo tanto, el tiempo de ciclo del procesador con N etapas es:

```
T_ciclo = 740ps + (N - 1) * 90ps = 1230ps / (1.23 - 0.1N)
```

Para minimizar el tiempo de ciclo del procesador, debemos derivar esta ecuación con respecto a N y establecerla igual a cero:

```
dT_ciclo / dN = 0
```

```
(1230ps - 1.23N * 90ps) / (1.23 - 0.1N)^2 = 0
```

```
1230ps - 100.7N = 0
```

```
N = 12.26
```

Por lo tanto, el número óptimo de etapas de pipeline es **12.26**. Sin embargo, como se trata de un número decimal, redondearemos al número entero más cercano, que es **13**.

Con 13 etapas de pipeline, el tiempo de ciclo del procesador es:

```
T_ciclo = 740ps + (13 - 1) * 90ps = 1230ps / (1.23 - 0.1 * 13) = 1122ps
```

Este es un aumento del 7.7% con respecto al tiempo de ciclo de un procesador de ciclo único, pero es un rendimiento mucho mejor que el de un procesador de cinco etapas.
