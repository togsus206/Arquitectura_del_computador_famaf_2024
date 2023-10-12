Asumiendo que la distribución de instrucciones dinámicas se divide en las siguientes categorías:

R-type 		CBZ/CBZN	B	LDUR	STUR
40%		25%		5%	25%	5%

y las siguientes precisiones en los métodos de predicción de salto:

Always-Taken		Always-Not-Taken	2-Bit
45%			55%			85%


Considerando que el resultado y la dirección del salto se determinan en la etapa de decodificación
(ID) y se aplican en la etapa de ejecución (EX) y que no hay hazards de datos.

a) ¿Cuántos CPI (Ciclos por instrucción) extras se producen debido a los fallos de predicción del
método Always-Taken?

b) ¿Cuántos CPI (Ciclos por instrucción) extras se producen debido a los fallos de predicción del
método Always-Not-Taken?

c) ¿Cuántos CPI (Ciclos por instrucción) extras se producen debido a los fallos de predicción del
método 2-Bit?



--------------------------------------------------------------------------------------------------------


A) 


Para calcular los Ciclos por Instrucción (CPI) extras debidos a los fallos de predicción del método Always-Taken, primero necesitamos entender cómo afectan los fallos de predicción a la ejecución del programa y luego calcular la cantidad de ciclos adicionales por cada tipo de instrucción.

El método Always-Taken predice que todas los saltos serán tomados. Por lo tanto, si una instrucción de salto resulta no ser tomada, habrá un fallo de predicción y se producirán ciclos extras.

Dada la distribución de instrucciones, se nos dice que el 25% de las instrucciones son de tipo CBZ/CBZN (instrucciones de salto condicional). Si suponemos que todas estas instrucciones son Always-Taken y resultan en fallos de predicción (ya que el método Always-Taken predice que todas los saltos son tomados), calcularemos los CPI extras para este caso.

La fórmula para calcular los CPI extras debido a los fallos de predicción es:


CPI extras = Frecuencia de fallos de predicción * (Ciclos extra por fallo/precicion del metodo del predictor de salto)

En este caso, la frecuencia de fallos de predicción es igual a la frecuencia de las instrucciones CBZ/CBZN, que es el 25% y Always-Taken tiene una presicion del 45%

El número de ciclos extra por fallo para el método Always-Taken es 1, ya que si la predicción Always-Taken es incorrecta, se producirá un fallo de predicción y se perderá un ciclo.

Por lo tanto, los CPI extras debido a los fallos de predicción del método Always-Taken son:

CPI extras = 25% (frecuencia de instrucciones CBZ/CBZN) * 1 (ciclo extra por fallo)/45%
            = 0.5556 ciclos extras por instrucción

Esto significa que, en promedio, se producen 0.5556 ciclos extras por instrucción debido a los fallos de predicción del método Always-Taken.


-----------------------------------------------------------------------------------------------------------------------


B)


CPI extras = 25% (frecuencia de instrucciones CBZ/CBZN) * 1 (ciclo extra por fallo)/55%
            = 0.4545 ciclos extras por instrucción


----------------------------------------------------------------------------------------------------------------


C)


CPI extras = 25% (frecuencia de instrucciones CBZ/CBZN) * 1 (ciclo extra por fallo)/85%
            = 0.2941 ciclos extras por instrucción




