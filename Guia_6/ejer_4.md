Asumiendo que la distribución de instrucciones dinámicas se divide en las siguientes categorías:

R-type 		CBZ/CBZN	B		LDUR	STUR
40%			25%			5%		25%		5%

y las siguientes precisiones en los métodos de predicción de salto:

Always-Taken		Always-Not-Taken		2-Bit
45%						55%					85%


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


Para resolver este ejercicio, sigamos un proceso paso a paso y usemos la información que se nos da sobre las instrucciones y las predicciones de salto.

### Paso 1: Identificar la cantidad de instrucciones que involucran saltos

La tabla de distribución de instrucciones dinámicas indica lo siguiente:

- R-type: 40%
- **CBZ/CBZN (instrucciones de salto condicional)**: 25%
- B (instrucciones de salto incondicional): 5%
- LDUR: 25%
- STUR: 5%

De estas instrucciones, las instrucciones **CBZ/CBZN** son las relevantes para el predictor de salto, ya que son condicionales. En total, representan el 25% del total de instrucciones.

### Paso 2: Analizar el método Always-Taken

Se nos dice que el predictor "Always-Taken" tiene una precisión del **45%**. Esto significa que el **55%** de las veces, este predictor falla en predecir correctamente el resultado del salto.

Cuando falla, se produce una penalización en términos de ciclos adicionales, ya que el salto no se predice correctamente. Según el enunciado, la predicción se hace en la etapa de decodificación (ID), pero el salto se aplica en la etapa de ejecución (EX). Esto implica un retraso de **1 ciclo** debido al fallo de predicción.

### Paso 3: Calcular los CPI adicionales debidos a los fallos de predicción

Dado que las instrucciones de salto **CBZ/CBZN** representan el 25% del total de instrucciones, el impacto de los fallos de predicción debe basarse en este porcentaje.

#### Fórmula para calcular los CPI adicionales:

CPI extras} = Frecuencia de saltos x Tasa de fallo xPenalización por fallo


Donde:
- Frecuencia de saltos = 25% (0.25) (instrucciones **CBZ/CBZN**)
- Tasa de fallo del predictor Always-Taken = 55% (0.55)
- Penalización por fallo = 1 ciclo (por cada fallo)

Sustituyendo los valores:


CPI extras = 0.25 x 0.55 x 3 = 0.4125


### Resultado:

Los **CPI extras** debidos a los fallos de predicción del método "Always-Taken" son **0.1375**.

Este es el número de ciclos adicionales por instrucción en promedio, debido a los fallos de predicción de salto en las instrucciones **CBZ/CBZN** cuando se usa el método Always-Taken.

Si tienes más preguntas o necesitas algún ajuste, házmelo saber.
	

-----------------------------------------------------------------------------------------------------------------------


B)

CPI extras = 0.25 x 0.45 x 3 = 0.4125


----------------------------------------------------------------------------------------------------------------


C)


CPI extras = 0.25 x 0.15 x 3 = 0.1125



