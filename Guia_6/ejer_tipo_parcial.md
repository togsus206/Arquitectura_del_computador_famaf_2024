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

El diagrama de pipeline que muestra cómo se ejecuta el código LEGv8 dado en el procesador de 2-issue se muestra a continuación. El código se ha organizado para evitar la mayor cantidad posible de stalls.

```
| Etapa | Instrucciones |
|---|---|
| IF | 1, 2 |
| ID | 3, 5 |
| EX | 4, 6 |
| MEM | 7, 8 |
| WB | 9, 10 |
```

**Explicación**

* **Etapa IF:** Las instrucciones 1 y 2 se cargan en la etapa IF.
* **Etapa ID:** Las instrucciones 3 y 5 se cargan en la etapa ID.
* **Etapa EX:** Las instrucciones 4 y 6 se ejecutan en la etapa EX.
* **Etapa MEM:** Las instrucciones 7 y 8 se ejecutan en la etapa MEM.
* **Etapa WB:** Las instrucciones 9 y 10 se ejecutan en la etapa WB.

**Caminos de forwarding utilizados**

* **Forwarding de datos:**
    * En la etapa MEM, el resultado de la instrucción 3 se utiliza como operando de la instrucción 7.
    * En la etapa MEM, el resultado de la instrucción 5 se utiliza como operando de la instrucción 6.
* **Forwarding de control:**
    * No se utiliza forwarding de control en este caso.

**Tabla**

La siguiente tabla muestra cómo se ejecutan las instrucciones en el procesador de 2-issue.

| Instrucción | Etapa |
|---|---|
| 1 | IF |
| 2 | IF |
| 3 | ID |
| 5 | ID |
| 4 | EX |
| 6 | EX |
| 7 | MEM |
| 8 | MEM |
| 9 | WB |
| 10 | WB |

**Análisis**

El código se ha organizado de la siguiente manera para evitar la mayor cantidad posible de stalls:

* **Las instrucciones 1 y 2 se cargan en la etapa IF primero para que puedan utilizarse como operandos de otras instrucciones.**
* **Las instrucciones 3 y 5 se cargan en la etapa ID juntas para que puedan ejecutarse en la etapa EX en el mismo paquete.**
* **Las instrucciones 4 y 6 se ejecutan en la etapa EX juntas para que puedan utilizar el resultado de las instrucciones 3 y 5.**
* **Las instrucciones 7 y 8 se ejecutan en la etapa MEM juntas para que puedan utilizar el resultado de las instrucciones 4 y 6.**

De esta manera, se pueden evitar los stalls de datos y de control.



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
- Instrucción 5 depende de la instrucción 4. ------» no es necesario forwarding
- Instrucción 8 depende de la instrucción 7.
- Instrucción 10 depende de la instrucción 6. ------» no es necesario forwarding

Dado que el procesador es de 2-issue y en cada issue packet debe haber una instrucción de acceso a memoria y otra de tipo aritmética/lógica o un salto, podemos identificar las siguientes dependencias importantes:

- Para la instrucción 4 (ADD X2, X2, X1), necesitamos reenviar el resultado de la instrucción 3 (LDUR X1, [X0,#0]) desde la etapa MEM.
- Para la instrucción 7 (ADD X2, X2, X1), necesitamos reenviar el resultado de la instrucción 5 (LDUR X1, [Xs0,#8]) desde la etapa MEM.

Basándonos en estas dependencias, es más efectivo reenviar desde el registro MEM/WB (MEM → EX) para resolver las dependencias de datos. Esto garantiza que las instrucciones 4 y 7 puedan recibir los datos que necesitan para ejecutarse correctamente, ya que estos datos estarán disponibles en la etapa MEM y se reenviarán a la etapa EX.

Reenviar desde la etapa EX no resolvería las dependencias necesarias para las instrucciones 4 y 7, ya que en la etapa EX solo tendríamos disponibles los resultados de las instrucciones de la iteración anterior, y necesitamos datos de la misma iteración.

Por lo tanto, en este escenario, reenviar desde el registro MEM/WB (MEM → EX) sería más efectivo para resolver las dependencias de datos y garantizar un correcto funcionamiento del procesador 2-issue.



---------------------------------------------------------------------------------------------------------------------------------


C)




**Procesador de 1-issue**

En un procesador de 1-issue, cada instrucción se ejecuta en una etapa del pipeline. En este caso, el código se ejecutará de la siguiente manera:

```
| Etapa | Instrucciones |
|---|---|
| IF | 1, 2 |
| ID | 3 |
| EX | 4 |
| MEM | 5 |
| WB | 6 |
| IF | 7, 8 |
| ID | 9 |
| EX | 10 |
| MEM | 11 |
| WB | 12 |
```

**Procesador de 2-issue**

En un procesador de 2-issue, dos instrucciones se pueden ejecutar en dos etapas diferentes del pipeline en el mismo ciclo de reloj. En este caso, el código se ejecutará de la siguiente manera:

```
| Etapa | Instrucciones |
|---|---|
| IF | 1, 2 |
| ID | 3, 5 |
| EX | 4, 6 |
| MEM | 7, 8 |
| WB | 9, 10 |
```

**Aumento de velocidad**

El aumento de velocidad en la ejecución del código dado al pasar de un procesador de 1-issue a un procesador de 2-issue es de un factor de 2. Esto se debe a que cada iteración del código se puede ejecutar en la mitad del tiempo en un procesador de 2-issue.

**Explicación**

En un procesador de 1-issue, cada iteración del código se ejecuta en 12 ciclos de reloj. En un procesador de 2-issue, cada iteración del código se ejecuta en 6 ciclos de reloj. Por lo tanto, el aumento de velocidad es de 12 / 6 = 2.

**Consideración de la totalidad de las iteraciones**

Si se consideran la totalidad de las iteraciones realizadas por el código, el aumento de velocidad será aún mayor. Esto se debe a que el procesador de 2-issue puede comenzar a ejecutar la siguiente iteración del código antes de que finalice la ejecución de la iteración actual.

El aumento de velocidad en la ejecución del código dado al pasar de un procesador de 1-issue a un procesador de 2-issue es de un factor de 2 o más, dependiendo de la cantidad de iteraciones que se ejecuten.

---------------------------------------------------------------------------------------------------------------------------


D)


En el código original, las instrucciones LDUR son las siguientes:

```
3> LDUR X1, [X0,#0]   (primera carga desde memoria)
5> LDUR X1, [X0,#8]   (segunda carga desde memoria)
```

Entonces, en una iteración del bucle original, se ejecutan dos instrucciones LDUR.

En el caso del loop unrolling, si cada iteración del nuevo bucle abarca dos iteraciones del bucle original, tendríamos cuatro instrucciones LDUR ejecutadas en cada iteración del nuevo bucle.

