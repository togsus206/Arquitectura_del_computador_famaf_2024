Una computadora posee un sistema de memoria jerárquica que consiste en dos cachés separadas
(una de instrucciones y una de datos), seguidas por la memoria principal y un procesador ARM que
trabaja a 1 GHz, con hit time = 1 ciclo de clock y CPI = 1.

a. La caché de instrucciones es perfecta (siempre acierta), pero la caché de datos tiene un 15%
de miss rate. En una falla de caché, el procesador se detiene durante 200 ns para acceder a
la memoria principal y luego reanuda el funcionamiento normal. Teniendo en cuenta los
errores de caché, ¿cuál es el tiempo promedio de acceso a la memoria?


b. ¿Cuántos ciclos de reloj por instrucción (CPI) se requieren en promedio para instrucciones
load y store, considerando las condiciones del punto a)?


c. Asumiendo que la distribución de instrucciones se divide en las siguientes categorías: 25%
loads, 10% stores, 13% branches y 52% instrucciones tipo R, ¿cuál es el CPI promedio?.


d. Suponiendo ahora que la caché de instrucciones tampoco es ideal y tiene un miss rate del
10%, ¿cuál es el CPI promedio considerando los fallos de ambas cachés?. Asuma la misma
distribución de instrucciones de programa del punto c).


-------------------------------------------------------------------------------------------------------

A) 

 AMAT = Hit_time + (Miss_rate x Miss_penalty)

Donde:
- **Hit time** es el tiempo de acceso a la caché cuando hay acierto (1 ciclo de clock, dado en nanosegundos ya que la frecuencia del procesador es 1 GHz).
- **Miss rate** es la tasa de fallos en la caché (15% o 0.15 en forma decimal).
- **Miss penalty** es el tiempo adicional que se tarda en caso de un fallo en la caché (200 ns para acceder a la memoria principal).

Ahora, sustituimos estos valores en la fórmula del AMAT:

1. **Hit time (tiempo de acceso con acierto):**
   El tiempo de acceso a la caché (hit time) es de 1 ciclo de clock, que es equivalente a 1/(1 GHz) = 1 ns
   
   La frecuencia se mide en ciclos por segundo, es decir, Hercios (Hz). Si tienes una frecuencia de 1 GHz
   1 GHz (mil millones de ciclos por segundo), entonces el período (el tiempo de un ciclo) es el inverso de la frecuencia:
   
   	Periodo = 1/frecuencia = 1 / 1 GHz = 1 ns
 
2. **Miss rate (tasa de fallos):**
   La tasa de fallos es del 15%, lo que equivale a 0.15

3. **Miss penalty (penalización por fallo):**
   Se nos dice que la penalización por fallo es de 200 ns.

Ahora, sustituimos estos valores en la fórmula del AMAT:

 AMAT = 1 ns + (0.15 x 200 ns)
 AMAT = 1 ns + 30 ns
 AMAT = 31 ns

Por lo tanto, el tiempo promedio de acceso a la memoria (AMAT) es de 31 ns.

---------------------------------------------------------------------------------------------------------


B)


**Solución:**

El CPI (ciclos de reloj por instrucción) es el número de ciclos de reloj que tarda en ejecutarse una instrucción en promedio.

En este caso, el CPI para instrucciones load y store es de **31 ciclos de reloj**.

**Explicación:**

El CPI para instrucciones load y store es igual al AMAT, ya que estas instrucciones requieren un acceso a la memoria.

Por lo tanto, el CPI es de **31 ciclos de reloj**.

**Respuesta:**

El CPI para instrucciones load y store es de **31 ciclos de reloj**.



--------------------------------------------------------------------------------------------------------------------------------

C)


Para calcular el CPI (Ciclos por Instrucción) promedio teniendo en cuenta la distribución de instrucciones proporcionada, debemos considerar el CPI para cada tipo de instrucción y ponderarlo según su frecuencia de aparición.

Dada la distribución de instrucciones proporcionada:

- 25% son instrucciones de carga (load).
- 10% son instrucciones de almacenamiento (store).
- 13% son instrucciones de salto condicional (branch).
- 52% son instrucciones tipo R.

Además, ya calculamos que el CPI para instrucciones de carga (load) y almacenamiento (store) es de 31 ciclos de reloj en el punto b).

Para las instrucciones de salto condicional (branch) y las instrucciones tipo R, no se proporciona un CPI específico, por lo que asumiremos que tienen un CPI de 1, ya que no se menciona lo contrario.

Ahora podemos calcular el CPI promedio CPI_avg):

CPI_avg = CPI para loads x Frecuencia de loads + CPI para stores x Frecuencia de stores + CPI para branches xFrecuencia de branches + CPI para tipo x Frecuencia de tipo R

Sustituimos los valores:

CPI_avg = 31 x 0.25 + 31 x 0.10 + 1 x 0.13 + 1 x 0.52 
CPI_avg = 7.75 + 3.1 + 0.13 + 0.52 = 11.5 

Por lo tanto, el CPI promedio es aproximadamente 11.5 ciclos de reloj por instrucción.

--------------------------------------------------------------------------------------------------------------------------

D)



Para calcular el CPI promedio considerando los fallos en ambas cachés, necesitamos tener en cuenta el tiempo adicional que se requiere en caso de fallo en alguna de las cachés.

Dado que ahora se menciona que la caché de instrucciones tampoco es ideal y tiene un miss rate del 10%, debemos incorporar este dato en el cálculo del CPI.

Dado que tenemos la misma distribución de instrucciones del punto c):

- 25% son instrucciones de carga (load).
- 10% son instrucciones de almacenamiento (store).
- 13% son instrucciones de salto condicional (branch).
- 52% son instrucciones tipo R.

Para calcular el CPI promedio:

CPI_avg = CPI para loads x Frecuencia de loads + CPI para stores x Frecuencia de stores + CPI para branches xFrecuencia de branches + CPI para tipo x Frecuencia de tipo R

Además, debemos tener en cuenta el tiempo adicional debido a los fallos en la caché. Dado que el miss rate es del 10%, asumiremos que un fallo en la caché resulta en un tiempo adicional de 10 ciclos de reloj.

Sustituimos los valores:

CPI_avg = (CPI para loads + Miss_rate x Miss penalty) x Frecuencia de loads + (CPI para stores + Miss_rate x Miss_penalty) x Frecuencia de stores + (CPI para branches  + Miss_rate x Miss_penalty ) x Frecuencia de branches + (CPI para tipo R +Miss_rate x Miss_penalty) x Frecuencia de tipo R

Para las instrucciones de carga (load) y almacenamiento (store), ya se proporcionó que el CPI con fallo es de 31 ciclos de reloj.

 CPI_avg = (31 + 0.10 x 10) x 0.25 + (31 + 0.10 x 10) x 0.10 + 2 x 0.13 + 2 x 0.52 
 CPI_avg = 8 + 3.2 + 0.26 + 1.04
 CPI_avg = 12.5

Por lo tanto, el CPI promedio considerando los fallos en ambas cachés es aproximadamente 12.5 ciclos de reloj por instrucción.










