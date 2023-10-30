Un procesador 2-issue de arquitectura LEGv8 posee las siguientes propiedades:
1. En cada issue packet una instrucción debe ser una operación de acceso a memoria y la otra de
tipo aritmética/lógica o un salto.

2. El procesador tiene todos los caminos de forwarding posibles entre las etapas (incluyendo caminos
a la etapa ID para la resolución de saltos).

3. El procesador predice los saltos perfectamente.

4. Dos instrucciones no pueden procesarse juntas en un paquete si una requiere el resultado de la
otra.

5. El compilador asume toda la responsabilidad de eliminar los hazard, organizar el código e insertar
instrucciones “nop” para que el código se ejecute sin necesidad de generación de stalls.

Para el siguiente fragmento de código LEGv8 (donde X2 = 0):

	1> ADDI X0, XZR, #0x100
	2> ADDI X10, XZR, #50
loop: 	3> LDUR X1, [X0,#0]
	4> ADD X2, X2, X1
	5> LDUR X1, [X0,#8]
	6> SUBI X10, X10, #1
	7> ADD X2, X2, X1
	8> STUR X2, [X0,#8]
	9> ADDI X0, X0, #16
	10> CBNZ X10, loop
	
	
a. Dibuje un diagrama de pipeline que muestre cómo se ejecuta el código LEGv8 dado en el
procesador de 2-issue (sólo hasta completar una iteración del bucle). Sin modificar el orden
de ejecución, organice el código para evitar la mayor cantidad posible de stalls. Deje
indicados los caminos de forwarding utilizados. (Completar en la tabla dada al final del
ejercicio).

b. Suponiendo que no es económicamente viable integrar los multiplexores de tres entradas
que son necesarios para implementar todos los caminos de forwarding, analice el código
dado y determine si es mejor reenviar solo desde el registro de pipeline EX / MEM ( EX →
EX) o solo desde el registro MEM / WB (MEM → EX).

c. Indique el aumento de velocidad en la ejecución del código dado al pasar de un procesador
de 1-issue a un procesador de 2-issue, ambos con pipeline y forwarding-stall. Considere la
totalidad de las iteraciones realizadas por el código.

d. Cuántas instrucciones LDUR se ejecutarán por lazo si se aplica la técnica del loop-unrolling
al código dado, con el fin de minimizar la cantidad de iteraciones del lazo? Asuma que X10
se inicializa en la instrucción <2> con un valor múltiplo de 4.



-------------------------------------------------------------------------------------------------------------------------------


A)

**Diagrama de pipeline**

El diagrama de pipeline para la ejecución del código LEGv8 dado en un procesador de 2-issue se muestra a continuación:

```
Iteración 1:

Fase IF:
	1> ADDI X0, XZR, #0x100
3> LDUR X1, [X0,#0]

Fase ID:
	2> ADDI X10, XZR, #50

Fase EX:
	4> ADD X2, X2, X1

Fase MEM:
	5> LDUR X1, [X0,#8]
6> SUBI X10, X10, #1

Fase WB:
	7> ADD X2, X2, X1

Fase ID:
	8> STUR X2, [X0,#8]
9> ADDI X0, X0, #16

Fase IF:
	10> CBNZ X10, loop
```

**Organización del código para evitar stalls**

Para evitar la mayor cantidad posible de stalls, el compilador ha organizado el código de la siguiente manera:

* Las instrucciones 1 y 3 se han colocado en el mismo paquete, ya que no hay dependencias entre ellas.
* Las instrucciones 2 y 4 se han colocado en el mismo paquete, ya que no hay dependencias entre ellas.
* La instrucción 5 se ha colocado en un paquete por sí misma, ya que requiere el resultado de la instrucción 3.
* La instrucción 6 se ha colocado en un paquete por sí misma, ya que requiere el resultado de la instrucción 4.
* La instrucción 7 se ha colocado en un paquete por sí misma, ya que requiere el resultado de la instrucción 5.

**Cambios realizados en el código**

Para cumplir con las restricciones del procesador, el compilador ha realizado los siguientes cambios en el código:

* Se ha insertado una instrucción "nop" al final de la iteración del bucle, para que la instrucción "CBNZ" tenga un operando para la siguiente iteración.

**Caminos de forwarding utilizados**

Los caminos de forwarding utilizados para el código dado son los siguientes:

* La instrucción 4 utiliza el resultado de la instrucción 3, que se ha obtenido en la fase MEM.
* La instrucción 7 utiliza el resultado de la instrucción 5, que se ha obtenido en la fase WB.

**Explicación de la ejecución**

La ejecución del código en el procesador de 2-issue se explica a continuación:

* **Iteración 1:**
    * Fase IF: Las instrucciones 1 y 3 se cargan en los paquetes de issue.
    * Fase ID: Las instrucciones 1 y 3 se ejecutan y se colocan en los registros de resultado.
    * Fase EX: La instrucción 4 se ejecuta y se coloca en el registro de resultado.
    * Fase MEM: La instrucción 5 se ejecuta y se coloca en el registro de resultado.
    * Fase WB: La instrucción 4 se escribe en el registro X2.
    * Fase ID: La instrucción 7 se carga en el paquete de issue.
    * Fase EX: La instrucción 6 se ejecuta y se coloca en el registro de resultado.
    * Fase MEM: La instrucción 7 se ejecuta y se coloca en el registro de resultado.
    * Fase WB: La instrucción 6 se escribe en el registro X10.
    * Fase IF: La instrucción 10 se carga en el paquete de issue.




--------------------------------------------------------------------------------------------------------------------------------


B)


El código dado es el siguiente:

```
1> ADDI X0, XZR, #0x100
2> ADDI X10, XZR, #50
loop: 
3> LDUR X1, [X0,#0]
4> ADD X2, X2, X1
5> LDUR X1, [X0,#8]
6> SUBI X10, X10, #1
7> ADD X2, X2, X1
8> STUR X2, [X0,#8]
9> ADDI X0, X0, #16
10> CBNZ X10, loop
```

Podemos observar las siguientes dependencias de datos:

- Instrucción 4 depende de la instrucción 3.
- Instrucción 5 depende de la instrucción 4.
- Instrucción 7 depende de la instrucción 6.
- Instrucción 8 depende de la instrucción 7.
- Instrucción 10 depende de la instrucción 6.

Dado que el procesador es de 2-issue y en cada issue packet debe haber una instrucción de acceso a memoria y otra de tipo aritmética/lógica o un salto, podemos identificar las siguientes dependencias importantes:

- Para la instrucción 4 (ADD X2, X2, X1), necesitamos reenviar el resultado de la instrucción 3 (LDUR X1, [X0,#0]) desde la etapa MEM.
- Para la instrucción 7 (ADD X2, X2, X1), necesitamos reenviar el resultado de la instrucción 5 (LDUR X1, [X0,#8]) desde la etapa MEM.

Basándonos en estas dependencias, es más efectivo reenviar desde el registro MEM/WB (MEM → EX) para resolver las dependencias de datos. Esto garantiza que las instrucciones 4 y 7 puedan recibir los datos que necesitan para ejecutarse correctamente, ya que estos datos estarán disponibles en la etapa MEM y se reenviarán a la etapa EX.

Reenviar desde la etapa EX no resolvería las dependencias necesarias para las instrucciones 4 y 7, ya que en la etapa EX solo tendríamos disponibles los resultados de las instrucciones de la iteración anterior, y necesitamos datos de la misma iteración.

Por lo tanto, en este escenario, reenviar desde el registro MEM/WB (MEM → EX) sería más efectivo para resolver las dependencias de datos y garantizar un correcto funcionamiento del procesador 2-issue.



---------------------------------------------------------------------------------------------------------------------------------


C)




**Explicación:**

En un procesador de 2-issue, las instrucciones 1 y 2 se ejecutarán de la siguiente manera:

```
Iteración 1:

Fase IF:
	1> ADDI X0, XZR, #0x100

Fase ID:
	2> ADDI X10, XZR, #50

Fase EX:
	3> LDUR X1, [X0,#0]

Fase MEM:
	4> ADD X2, X2, X1

Fase WB:
	5> LDUR X1, [X0,#8]

Fase IF:
	6> SUBI X10, X10, #1

Iteración 2:

Fase ID:
	7> ADD X2, X2, X1

Fase EX:
	8> STUR X2, [X0,#8]
	9> ADDI X0, X0, #16

Fase MEM:
	10> CBNZ X10, loop
```

Como se puede ver, las instrucciones 1 y 2 se ejecutan en dos fases consecutivas del pipeline. Esto significa que el aumento de velocidad real será menor que el 30%.

Para calcular el aumento de velocidad real, podemos usar la siguiente fórmula:


Aumento de velocidad real = (1 - (Número de instrucciones de tipo aritmética/lógica / Número total de instrucciones)) * 50%


En este caso, el número de instrucciones de tipo aritmética/lógica es de dos instrucciones por iteración del bucle. El número total de instrucciones es de diez instrucciones por iteración del bucle.

Por lo tanto, el aumento de velocidad real es:

```
Aumento de velocidad real = (1 - (2 / 10)) * 50% = 30%
```

**Conclusión:**

El aumento de velocidad real en la ejecución del código dado al pasar de un procesador de 1-issue a un procesador de 2-issue es de aproximadamente el **30%**. Este aumento de velocidad se debe a que, en un procesador de 2-issue, se pueden ejecutar dos instrucciones en paralelo en las fases IF y ID.

La respuesta es **30%**, siempre y cuando no se pueda reordenar las instrucciones.




Caso se puedan reordenar: 


Iteración 1:

1. Fase IF:
   - ADDI X0, XZR, #0x100
   - LDUR X1, [X0,#0]
  
2. Fase ID:
   - ADD X2, X2, X1

3. Fase EX:
   - ADDI X10, XZR, #50
   - LDUR X1, [X0,#8]

4. Fase MEM:
   - SUBI X10, X10, #1

5. Fase WB:
   - ADD X2, X2, X1

6. Fase IF:
   - ADDI X0, X0, #16

7. Fase ID:
   - CBNZ X10, loop
   - STUR X2, [X0,#8]

---------------------------------------------------------------------------------------------------------------------------


D)

Tienes razón, cometí un error en mi respuesta anterior. Las instrucciones 7, 9 y 10 no son instrucciones LDUR. Las instrucciones LDUR son las que cargan datos desde memoria. Permíteme corregir mi respuesta y proporcionar la información precisa.

En el código original, las instrucciones LDUR son las siguientes:

```
3> LDUR X1, [X0,#0]   (primera carga desde memoria)
5> LDUR X1, [X0,#8]   (segunda carga desde memoria)
```

Entonces, en una iteración del bucle original, se ejecutan dos instrucciones LDUR.

En el caso del loop unrolling, si cada iteración del nuevo bucle abarca dos iteraciones del bucle original, tendríamos cuatro instrucciones LDUR ejecutadas en cada iteración del nuevo bucle.

