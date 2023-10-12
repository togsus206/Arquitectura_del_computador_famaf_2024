Para los siguientes fragmentos de código LEGv8:

1) 

LDUR X8, [X0, #40]
ADD X9, X1, X2
SUB X10, X1, X3
AND X11, X3, X4
ORR X12, X1, X5
STUR X5, [X0, #80]




2)

loop: 	LDUR X0, [X20,#0]
	LDUR X1, [X21,#0]
	ADD X0,X0,X1
	STUR X0,[X20,#0]
	ADDI X20, X20, #8
	ADDI X21, X21, #8
	SUBI X2, X2, #1
	CBZ X2, loop


a) Analizar las dependencias de datos y determinar cuales generan data hazards en nuestro
procesador one-issue, sin forwarding-stall. En cada caso indicar: el tipo de hazard, el
operando en conflicto y los números de las instrucciones involucradas. (Los saltos están
perfectamente predichos, de modo que los control hazard son manejados por hardware).

b) Mostrar el orden de ejecución para un microprocesador con pipeline, de una vía, con
forwarding-stall y que predice los saltos perfectamente.

c) Mostrar el orden de ejecución para un microprocesador multiple-issue de dos vías, con todos
los caminos de forwarding posibles entre las etapas y que predice los saltos perfectamente.
En cada issue packet la primera instrucción puede ser cualquier tipo y la segunda debe ser
una instrucción aritmética o lógica.

d) En el fragmento (B): aplicar la técnica de loop unrolling para que cada iteración del nuevo
bucle se corresponda con dos iteraciones del bucle original (X2 es múltiplo de 2). Luego
reorganizar/reescribir el código para lograr un mejor rendimiento en el procesador de 2-issue
del inciso (c). Está permitido utilizar otros registros si se considera necesario.

e) Calcular la mejora en eficiencia para cada técnica.


--------------------------------------------------------------------------------------------------------------------------

1-A)



1. **LDUR X8, [X0, #40]**
   - No hay dependencias con instrucciones anteriores ya que es una operación de carga.

2. **ADD X9, X1, X2**
   - No hay dependencias con instrucciones anteriores ya que es una operación de suma.

3. **SUB X10, X1, X3**
   - Dependencia RAW con la instrucción ADD anterior. X1 se está leyendo en la ADD y se intenta leer en la SUB antes de que se haya completado la ADD.

4. **AND X11, X3, X4**
   - No hay dependencias con instrucciones anteriores ya que es una operación AND.

5. **ORR X12, X1, X5**
   - Dependencia RAW con la instrucción SUB anterior. X1 se está leyendo en la SUB y se intenta leer en la ORR antes de que se haya completado la SUB.

6. **STUR X5, [X0, #80]**
   - No hay dependencias con instrucciones anteriores ya que es una operación de almacenamiento.

**Resumen de dependencias de datos y data hazards:**

- **RAW Hazard:**
  - Instrucción SUB (X10) depende de la instrucción ADD (X9).
  - Instrucción ORR (X12) depende de la instrucción SUB (X10).

- **WAR Hazard:**
  - No hay dependencias de escritura-después-de-lectura.

- **WAW Hazard:**
  - No hay dependencias de escritura-después-de-escritura.

Esencialmente, las dependencias RAW son las que generarían data hazards en un procesador one-issue sin forwarding-stall. Estas dependencias indican que una instrucción depende del resultado de una instrucción anterior antes de que se haya completado. En este caso, las instrucciones SUB y ORR dependen de los resultados de las instrucciones ADD y SUB, respectivamente.


-------------------------------------------------------------------------------------------------------------------------------

1-B)


Supondremos un pipeline con las siguientes etapas: IF (Fetch), ID (Decodificación), EX (Ejecución), MEM (Memoria), y WB (Escritura de resultados).

Dadas las siguientes instrucciones:
1. LDUR X8, [X0, #40]
2. ADD X9, X1, X2
3. SUB X10, X1, X3
4. AND X11, X3, X4
5. ORR X12, X1, X5
6. STUR X5, [X0, #80]

**Orden de ejecución y forwarding-stalls:**

1. **Ciclo 1:**
   - IF: LDUR X8, [X0, #40]

2. **Ciclo 2:**
   - ID: LDUR X8, [X0, #40]
   - IF: ADD X9, X1, X2 (Forwarding-Stall desde ciclo 2 hasta ciclo 4 debido a dependencia RAW con LDUR)

3. **Ciclo 3:**
   - EX: LDUR X8, [X0, #40]
   - ID: ADD X9, X1, X2

4. **Ciclo 4:**
   - MEM: LDUR X8, [X0, #40]
   - EX: ADD X9, X1, X2
   - ID: SUB X10, X1, X3 (Forwarding-Stall desde ciclo 4 hasta ciclo 6 debido a dependencia RAW con ADD)

5. **Ciclo 5:**
   - WB: LDUR X8, [X0, #40]
   - MEM: ADD X9, X1, X2
   - EX: SUB X10, X1, X3

6. **Ciclo 6:**
   - WB: ADD X9, X1, X2
   - WB: SUB X10, X1, X3
   - ID: AND X11, X3, X4 (No hay dependencia con instrucciones anteriores)

7. **Ciclo 7:**
   - EX: AND X11, X3, X4
   - ID: ORR X12, X1, X5 (Forwarding-Stall desde ciclo 7 hasta ciclo 9 debido a dependencia RAW con SUB)

8. **Ciclo 8:**
   - MEM: AND X11, X3, X4
   - EX: ORR X12, X1, X5

9. **Ciclo 9:**
   - WB: AND X11, X3, X4
   - WB: ORR X12, X1, X5
   - ID: STUR X5, [X0, #80] (No hay dependencia con instrucciones anteriores)

10. **Ciclo 10:**
   - MEM: ORR X12, X1, X5
   - EX: STUR X5, [X0, #80]

11. **Ciclo 11:**
   - WB: ORR X12, X1, X5
   - WB: STUR X5, [X0, #80]

Finalmente, todas las instrucciones han pasado a través del pipeline y se han ejecutado sin problemas de dependencias. Los forwarding-stalls han permitido resolver las dependencias de datos entre las instrucciones y maximizar la eficiencia del pipeline. La predicción de saltos perfecta garantiza que no haya penalización por fallos en la predicción de saltos.


--------------------------------------------------------------------------------------------------------------------------------

1-C)



Dadas las siguientes instrucciones:
1. LDUR X8, [X0, #40]
2. ADD X9, X1, X2
3. SUB X10, X1, X3
4. AND X11, X3, X4
5. ORR X12, X1, X5
6. STUR X5, [X0, #80]

**Orden de ejecución:**

1. **Ciclo 1:**
   - IF1: LDUR X8, [X0, #40]
   - IF2: ADD X9, X1, X2

2. **Ciclo 2:**
   - ID1: LDUR X8, [X0, #40]
   - EX1: LDUR X8, [X0, #40]
   - ID2: ADD X9, X1, X2
   - EX2: ADD X9, X1, X2

3. **Ciclo 3:**
   - MEM1: LDUR X8, [X0, #40]
   - WB1: LDUR X8, [X0, #40]
   - MEM2: ADD X9, X1, X2
   - WB2: ADD X9, X1, X2
   - IF1: SUB X10, X1, X3 (Puede ejecutarse junto con las de ciclo 2 porque es aritmética)

4. **Ciclo 4:**
   - ID1: SUB X10, X1, X3
   - EX1: SUB X10, X1, X3
   - ID2: AND X11, X3, X4 (Puede ejecutarse junto con las de ciclo 2 porque es aritmética)
   - EX2: AND X11, X3, X4
   - IF2: ORR X12, X1, X5 (Puede ejecutarse junto con las de ciclo 2 porque es aritmética)

5. **Ciclo 5:**
   - MEM1: SUB X10, X1, X3
   - WB1: SUB X10, X1, X3
   - MEM2: AND X11, X3, X4
   - WB2: AND X11, X3, X4

6. **Ciclo 6:**
   - ID1: ORR X12, X1, X5
   - EX1: ORR X12, X1, X5
   - IF1: STUR X5, [X0, #80] (Puede ejecutarse junto con las de ciclo 4 porque es aritmética)
   - ID2: STUR X5, [X0, #80] (Puede ejecutarse junto con las de ciclo 4 porque es aritmética)

7. **Ciclo 7:**
   - MEM1: ORR X12, X1, X5
   - WB1: ORR X12, X1, X5
   - MEM2: STUR X5, [X0, #80]
   - WB2: STUR X5, [X0, #80]

En este esquema de ejecución, aprovechamos al máximo la capacidad de ejecución de dos instrucciones en paralelo en cada ciclo, siempre cumpliendo con la restricción de que la segunda instrucción en cada paquete debe ser una operación aritmética o lógica. Todos los caminos de forwarding posibles se utilizan para resolver los riesgos de datos entre instrucciones. La predicción de saltos perfecta garantiza que no haya penalización por fallos en la predicción de saltos.


-----------------------------------------------------------------------------------------------------------------------------


1-D)


Aplicaremos loop unrolling con un factor de 2, obteniendo:


; Iteración 1
LDUR X8, [X0, #40]
ADD X9, X1, X2
SUB X10, X1, X3
STUR X5, [X0, #80]

; Iteración 2
LDUR X13, [X0, #48]
ADD X14, X1, X2
SUB X15, X1, X3
STUR X5, [X0, #88]

; Iteración 3
LDUR X16, [X0, #56]
ADD X17, X1, X2
SUB X18, X1, X3
STUR X5, [X0, #96]


Ahora, reorganizando el codigo para aprovechar un procesador de 2-issue:

; Primer paquete de instrucciones
LDUR X8, [X0, #40]     ; Iteración 1, carga
ADD X9, X1, X2         ; Iteración 1, operación
LDUR X13, [X0, #48]    ; Iteración 2, carga
ADD X14, X1, X2        ; Iteración 2, operación

; Segundo paquete de instrucciones
SUB X10, X1, X3        ; Iteración 1, operación
STUR X5, [X0, #80]     ; Iteración 1, almacenamiento
SUB X15, X1, X3        ; Iteración 2, operación
STUR X5, [X0, #88]     ; Iteración 2, almacenamiento

; Tercer paquete de instrucciones
AND X11, X3, X4        ; Iteración 1, operación
STUR X5, [X0, #96]     ; Iteración 3, almacenamiento
ORR X12, X1, X5        ; Iteración 1, operación

--------------------------------------------------------------------------------------------------------------------------

1-E)


Para calcular la mejora en eficiencia para cada técnica, compararemos el CPI (Ciclos por Instrucción) de la ejecución original del bucle con el CPI después de aplicar cada técnica.

1. **Procesador de 2-issue (sin optimizaciones)**
   - CPI_original = 6 (ya que son 6 instrucciones y se ejecutan en 6 ciclos en un procesador de 2-issue)
   - CPI_optimizado = 3 (al ejecutar 2 instrucciones por ciclo)
   - Mejora_eficiencia = CPI_original / CPI_optimizado = 6 / 3 = 2

2. **Procesador de 2-issue (con loop unrolling)**
   - CPI_original = 6 (ya que son 6 instrucciones y se ejecutan en 6 ciclos en un procesador de 2-issue)
   - CPI_optimizado = 4 (al ejecutar 2 instrucciones por ciclo, desplegadas con un factor de 2)
   - Mejora_eficiencia = CPI_original / CPI_optimizado = 6 / 4 = 1.5

3. **Procesador de 2-issue (con loop unrolling y operaciones aritméticas/lógicas en paralelo)**
   - CPI_original = 6 (ya que son 6 instrucciones y se ejecutan en 6 ciclos en un procesador de 2-issue)
   - CPI_optimizado = 3 (al ejecutar 2 instrucciones por ciclo, con operaciones aritméticas/lógicas en paralelo)
   - Mejora_eficiencia = CPI_original / CPI_optimizado = 6 / 3 = 2

Por lo tanto, la mejora en eficiencia para cada técnica sería:
1. **Optimización básica de 2-issue**: Mejora en eficiencia de 2 veces.
2. **Optimización con loop unrolling**: Mejora en eficiencia de 1.5 veces.
3. **Optimización con loop unrolling y operaciones aritméticas/lógicas en paralelo**: Mejora en eficiencia de 2 veces.


----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------


2-A)


Analicemos las dependencias de datos en el fragmento de código dado para identificar los data hazards en un procesador one-issue sin forwarding-stall:

1. **Entre instrucciones LDUR y ADD:**
   - Tipo de hazard: RAW (Read After Write)
   - Operandos en conflicto: X0 (se lee en LDUR y se escribe en ADD)
   - Números de instrucciones involucradas: LDUR X0, [X20,#0] (Instrucción 1), ADD X0,X0,X1 (Instrucción 3)

2. **Entre instrucciones LDUR y STUR:**
   - Tipo de hazard: WAR (Write After Read)
   - Operandos en conflicto: X0 (se lee en LDUR y se escribe en STUR)
   - Números de instrucciones involucradas: LDUR X0, [X20,#0] (Instrucción 1), STUR X0,[X20,#0] (Instrucción 4)

3. **Entre instrucciones ADDI y SUBI:**
   - Tipo de hazard: RAW (Read After Write)
   - Operandos en conflicto: X2 (se lee en ADDI y se escribe en SUBI)
   - Números de instrucciones involucradas: ADDI X20, X20, #8 (Instrucción 5), SUBI X2, X2, #1 (Instrucción 6)

No hay dependencias de datos entre CBZ y ninguna otra instrucción en términos de operandos.

--------------------------------------------------------------------------------------------------------------------------------

2-B)


En un microprocesador con pipeline, de una vía, con forwarding-stall y predicción de saltos perfecta, el orden de ejecución de las instrucciones puede representarse como sigue. Supongamos que el procesador tiene las siguientes etapas de pipeline: IF (Fetch), ID (Decode), EX (Execute), MEM (Memory Access), y WB (Write Back). Además, consideraremos que hay una etapa adicional para manejar los forwarding-stalls.

Supongamos el siguiente código:

```assembly
loop: 
  LDUR X0, [X20,#0]
  LDUR X1, [X21,#0]
  ADD X0, X0, X1
  STUR X0, [X20,#0]
  ADDI X20, X20, #8
  ADDI X21, X21, #8
  SUBI X2, X2, #1
  CBZ X2, loop
```

Ahora, mostraremos el orden de ejecución de las instrucciones en cada etapa del pipeline para una única iteración del bucle:

**Ciclo 1:**

| Etapa  | Instrucción |
|--------|-------------|
| IF     | LDUR X0, [X20,#0] |
| ID     | - (Forwarding-stall) |
| EX     | - |
| MEM    | - |
| WB     | - |

**Ciclo 2:**

| Etapa  | Instrucción |
|--------|-------------|
| IF     | LDUR X1, [X21,#0] |
| ID     | LDUR X0, [X20,#0] (Forwarded) |
| EX     | - |
| MEM    | - |
| WB     | - |

**Ciclo 3:**

| Etapa  | Instrucción |
|--------|-------------|
| IF     | ADD X0, X0, X1 |
| ID     | LDUR X1, [X21,#0] (Forwarded) |
| EX     | LDUR X0, [X20,#0] (Forwarded) |
| MEM    | - |
| WB     | - |

**Ciclo 4:**

| Etapa  | Instrucción |
|--------|-------------|
| IF     | STUR X0, [X20,#0] |
| ID     | ADD X0, X0, X1 (Forwarded) |
| EX     | LDUR X1, [X21,#0] (Forwarded) |
| MEM    | LDUR X0, [X20,#0] (Forwarded) |
| WB     | - |

**Ciclo 5:**

| Etapa  | Instrucción |
|--------|-------------|
| IF     | ADDI X20, X20, #8 |
| ID     | STUR X0, [X20,#0] (Forwarded) |
| EX     | ADD X0, X0, X1 (Forwarded) |
| MEM    | LDUR X1, [X21,#0] (Forwarded) |
| WB     | LDUR X0, [X20,#0] (Forwarded) |

**Ciclo 6:**

| Etapa  | Instrucción |
|--------|-------------|
| IF     | ADDI X21, X21, #8 |
| ID     | ADDI X20, X20, #8 (Forwarded) |
| EX     | STUR X0, [X20,#0] (Forwarded) |
| MEM    | ADD X0, X0, X1 (Forwarded) |
| WB     | LDUR X1, [X21,#0] (Forwarded) |

**Ciclo 7:**

| Etapa  | Instrucción |
|--------|-------------|
| IF     | SUBI X2, X2, #1 |
| ID     | ADDI X21, X21, #8 (Forwarded) |
| EX     | ADDI X20, X20, #8 (Forwarded) |
| MEM    | STUR X0, [X20,#0] (Forwarded) |
| WB     | ADD X0, X0, X1 (Forwarded) |

**Ciclo 8:**

| Etapa  | Instrucción |
|--------|-------------|
| IF     | CBZ X2, loop |
| ID     | SUBI X2, X2, #1 (Forwarded) |
| EX     | ADDI X21, X21, #8 (Forwarded) |
| MEM    | ADDI X20, X20, #8 (Forwarded) |
| WB     | STUR X0, [X20,#0] (Forwarded) |


---------------------------------------------------------------------------------------------------------------------------

2-C)



```assembly
loop: 
  LDUR X0, [X20,#0]
  LDUR X1, [X21,#0]
  ADD X0, X0, X1
  STUR X0, [X20,#0]
  ADDI X20, X20, #8
  ADDI X21, X21, #8
  SUBI X2, X2, #1
  CBZ X2, loop
```


**Ciclo 1:**

| Unidad Funcional 1 | Unidad Funcional 2 |
|--------------------|--------------------|
| LDUR X0, [X20,#0]  | NOP (o instrucción aritmética/lógica adicional) |

**Ciclo 2:**

| Unidad Funcional 1 | Unidad Funcional 2 |
|--------------------|--------------------|
| LDUR X1, [X21,#0]  | ADD X0, X0, X1     |

**Ciclo 3:**

| Unidad Funcional 1 | Unidad Funcional 2 |
|--------------------|--------------------|
| NOP (o instrucción aritmética/lógica adicional) | STUR X0, [X20,#0] |

**Ciclo 4:**

| Unidad Funcional 1 | Unidad Funcional 2 |
|--------------------|--------------------|
| ADDI X20, X20, #8  | ADDI X21, X21, #8  |

**Ciclo 5:**

| Unidad Funcional 1 | Unidad Funcional 2 |
|--------------------|--------------------|
| SUBI X2, X2, #1    | CBZ X2, loop       |

En este caso, hemos introducido instrucciones `NOP` (No Operation) o podrían ser instrucciones aritméticas/lógicas adicionales según la disponibilidad y las necesidades del procesador para cumplir con la restricción de que la primera instrucción en cada paquete sea aritmética o lógica.


-------------------------------------------------------------------------------------------------------------------------------

2-D)

La técnica de loop unrolling implica replicar el cuerpo del bucle para que cada iteración del nuevo bucle represente más de una iteración del bucle original. Dado que se desea que cada iteración del nuevo bucle corresponda a dos iteraciones del bucle original (X2 es múltiplo de 2), desenrollaremos el bucle en bloques de 2 iteraciones.

Vamos a aplicar el loop unrolling y luego reorganizar el código para lograr un mejor rendimiento en un procesador de 2-issue:

```assembly
loop:
  LDUR X0, [X20,#0]
  LDUR X1, [X21,#0]
  ADD X0, X0, X1
  STUR X0, [X20,#0]
  
  LDUR X1, [X20,#8]
  LDUR X2, [X21,#8]
  ADD X1, X1, X2
  STUR X1, [X20,#8]

  ADDI X20, X20, #16
  ADDI X21, X21, #16
  
  SUBI X2, X2, #2
  CBZ X2, end_loop

  B loop

end_loop:
  // Resto del código si lo hay
```

En este código, desenrollamos el bucle en bloques de 2 iteraciones, lo que significa que ejecutamos dos iteraciones del bucle original en cada iteración del nuevo bucle. Esto nos permite ejecutar más instrucciones en paralelo en un procesador de 2-issue.

Espero que esto cumpla con tu solicitud. Si tienes alguna otra pregunta o necesitas más aclaraciones, no dudes en preguntar.


--------------------------------------------------------------------------------------------------------------------------------


2-E)


Para calcular la mejora en eficiencia para cada técnica de optimización (loop unrolling) en comparación con el caso original (bucle sin optimizar), se utiliza la métrica del Ciclo por Instrucción (CPI). CPI representa la cantidad promedio de ciclos necesarios para ejecutar una instrucción en un programa. Cuanto menor sea el CPI, más eficiente es la ejecución del programa.

Definimos la eficiencia relativa (ER) como la inversa del CPI. Es decir,

ER = 1/CPI

Calculemos la eficiencia relativa para cada técnica y luego comparémoslas con el caso original.

1. **Caso Original (bucle sin optimizar):**
   - CPI en este caso es 5 (porque hay 5 instrucciones en el bucle original y se ejecutan en 5 ciclos).

   Por lo tanto, la eficiencia relativa ER = 1/5

2. **Loop Unrolling (d):**
   - Con loop unrolling, ejecutamos dos iteraciones originales en cada iteración desenrollada. Entonces, CPI se reduce a 2.5.

   La eficiencia relativa (ER) para loop unrolling es ER = 1/2.5

3. **Loop Unrolling con Aritmética/Lógica (e):**
   - En este caso, ejecutamos dos iteraciones originales y realizamos operaciones aritméticas/lógicas adicionales en cada iteración desenrollada. CPI es aún menor que en el caso de loop unrolling, supongamos que es 2.0.

   La eficiencia relativa (ER) para loop unrolling con aritmética/lógica es ER = 1/2

Cuanto mayor sea el valor de ER, más eficiente es la ejecución del programa.

Comparación de Eficiencia Relativa:
- La eficiencia relativa es mayor en el caso de loop unrolling que en el caso original (dado que CPI es menor).
- La eficiencia relativa es aún mayor en el caso de loop unrolling con aritmética/lógica, ya que CPI es menor en comparación con loop unrolling.

En resumen, la mejora en eficiencia se logra a medida que reducimos CPI (incrementando ER) utilizando técnicas de optimización como el loop unrolling y el loop unrolling con aritmética/lógica en comparación con el bucle original sin optimizar.

Si tienes más preguntas o necesitas más aclaraciones, no dudes en preguntar. Estoy aquí para ayudar.


