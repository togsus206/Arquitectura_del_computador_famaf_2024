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


N	TC[ps] 		CPI	Ti[ps]
5	238		1.23	292,74
6	213,33		1.33	283,73
7	195,71		1.43	279.87
8	182,5		1,53	279,23
9	172.22		1.63	280,72
10	164		1.73	283.72

