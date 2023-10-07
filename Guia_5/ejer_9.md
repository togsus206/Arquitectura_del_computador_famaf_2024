Considere que un sistema tiene una CACHE para DATOS de correspondencia ASOCIATIVA POR
CONJUNTOS de 2 VÍAS de 256Kbyte y 4 palabras por línea, sobre un procesador de 32bits, CPI = 1,
que resuelve todos los data y control hazard sin necesidad de stalls, tiene una memoria principal de
4G palabras de 1 byte cada una.

a. Muestre el formato de memoria principal.

b. Considere ahora la ejecución en este sistema de los siguientes segmentos de código LEGv8
equivalentes para N > 0, donde N→ X3, start = 0x000203C y X6 contiene la dirección base
del arreglo A[] del tipo uint32_t. Considerar que el resto de los registros están inicializados en
0 y la CACHÉ vacía al inicio de la ejecución de cada segmento.


Segmento 1: 
	start: ADD x9,x3, xzr
	loop: CBZ x9, end
	      LDURH x10, [x6, #0]
	      LDURH x11, [x6, #8]
	      ADD x12, x10, x11 
	      LSR x12, x12, #1
	      ADDI x6,x6, #4
	      SUBI x9,x9, #1
	      B loop
	end: ...
	
	
Segmento 2: 
	start: LDURH x10, [x6, #0]
	       LDURH x11, [x6, #8]
	       ADD x12, x10, x11
	       LSR x12, x12, #1
	       ADDI x6, x6, #4
	       ADDI x9, x9, #1
	       SUBS XZR, x9, x3
	       B.NE start
	end: ...
	
	
¿Cuantos MISS de CACHE se produjeron en 5 iteraciones del lazo para el segmento #1 si la
dirección base del arreglo A es 0x00001008?




---------------------------------------------------------------------------------------------------------------------------

A)


**Detalles sobre la caché:**
- Caché de datos de correspondencia asociativa por conjuntos de 2 vías.
- Tamaño de la caché: 256 Kbytes.
- 4 palabras por línea de caché.

**Detalles sobre la memoria:**
- Procesador de 32 bits.
- Memoria principal con 4G palabras (cada palabra es de 1 byte).

Primero, vamos a calcular el tamaño de una línea de caché y la cantidad de conjuntos en la caché.

**Tamaño de una línea de caché:**
- Cada palabra es de 32 bits (4 bytes), y hay 4 palabras por línea.
- Tamaño de una línea de caché: 4 palabras x 32 bits = 128 bits

**Cantidad de conjuntos en la caché:**
- Tamaño total de la caché: 256 Kbytes
- Tamaño de una línea de caché: 128 bits
- Cantidad de conjuntos en la caché: (Tamaño total de la cache)/ (Tamaño de una linea de la cache) = 256 Kbytes/128 bits = 2048 conjuntos


Ahora, vamos a calcular la cantidad de bits necesarios para indexar un conjunto y para el desplazamiento dentro de una línea de caché.

- Bits para indexar un conjunto: log_2(cantidad de conjuntos) = log_2(2048) = 11 bits
- Bits para el desplazamiento dentro de una línea de caché: log_2(N de palabras por linea) = log_2(4) = 2 bits


Finalmente, los bits restantes en la dirección de 32 bits se usarán para la etiqueta.

**Formato de la dirección en la memoria principal:**
- Bits para el índice (index): 11 bits (para indexar el conjunto)
- Bits para el desplazamiento (offset): 2 bits (para seleccionar la palabra dentro de la línea)
- Bits para la etiqueta: 32 - 11 - 2 = 19 bits.

Entonces, el formato de dirección en la memoria principal sería:

Formato de dirección:
	[Índice (11 bits) | Desplazamiento (2 bits) | Etiqueta (19 bits) ]


--------------------------------------------------------------------------------------------------------------------------------------


B)


## Segmento 1: ##

Para determinar la cantidad de misses de caché en 5 iteraciones del lazo para el segmento #1, necesitamos analizar cómo se acceden a la memoria en cada iteración y cómo interactúa con la caché.

Primero, analicemos la instrucción de carga desde la memoria (LDURH) en el segmento #1: `LDURH x10, [x6, #0]`. Esta instrucción carga un valor de 16 bits (halfword) desde la dirección en `x6` con un offset de 0. 

Sabemos que cada palabra es de 32 bits (4 bytes), y hay 4 palabras por línea de caché en la caché de datos. Por lo tanto, para determinar si hay un miss de caché, debemos verificar si la palabra que intentamos cargar está en la caché.

Dado que `x6` contiene la dirección base del arreglo `A` y el offset es 0, estamos cargando la primera palabra del arreglo `A`.

**Dirección de la primera palabra de `A` para la primera iteración:**
- Dirección base `x6` = 0x00001008 (suponiendo dirección base inicial de `A`)
- Offset = 0 (primer elemento del arreglo)
- Dirección = 0x00001008 + 0 = 0x00001008

Ahora, calculamos el índice del conjunto en la caché y la etiqueta para esta dirección:

- Tamaño de una línea de caché: 128 bits (según el formato calculado anteriormente)
- Tamaño de una palabra: 32 bits (4 bytes)

**Índice del conjunto en la caché:**
- Offset de palabra = log_2(Tamaño de una palabra) = log_2 (32) = 5 bits
- Bits para el desplazamiento = log_2(Tamaño de una línea de caché) =log_2(128) = 7 bits
- Bits para el índice del conjunto = 32 - 5 - 7 = 20 bits

Para calcular el índice del conjunto en la caché, tomamos los 20 bits intermedios de la dirección.

**Etiqueta:**
- Bits para la etiqueta = (32 - Bits para el índice - Bits para el desplazamiento) 
- Bits para la etiqueta = 32 - 20 - 7 = 5 bits

Ahora, veamos cómo se accede a la memoria en cada iteración y cuántos misses de caché ocurren:

1. **Primera iteración:**
   - La dirección de la primera palabra es 0x00001008 (ya calculado).
   - Verificamos si la palabra está en la caché. Al ser la primera carga, no estará en la caché y habrá un miss.

2. **Iteraciones posteriores:**
   - En cada iteración, `x6` se incrementa en 4, lo que significa que accedemos a la siguiente palabra en el arreglo `A`.
   - Dado que las palabras están separadas por 4 bytes, cada acceso en iteraciones posteriores será a una nueva línea de caché, lo que resultará en misses de caché.

En resumen, en cada iteración del lazo para el segmento #1 habrá un miss de caché, incluyendo la primera iteración. En 5 iteraciones, habrá 5 misses de caché.



## Segmento 2: ##


En el segundo segmento, también estamos accediendo a la memoria con la instrucción `LDURH`, que carga una halfword (16 bits) desde la memoria. El offset es 0, lo que significa que estamos cargando la primera halfword del arreglo `A`.

**Dirección de la primera halfword de `A` para el segundo segmento:**
- Dirección base `x6` = 0x00001008 (suponiendo dirección base inicial de `A`)
- Offset = 0 (primer elemento del arreglo)
- Dirección = 0x00001008 + 0 = 0x00001008

Vamos a calcular el índice del conjunto en la caché y la etiqueta para esta dirección, siguiendo el mismo proceso que hicimos en el cálculo anterior.

**Índice del conjunto en la caché:**
- Offset de palabra = log_2(Tamaño de una palabra) = log_2(32) = 5 bits
- Bits para el desplazamiento = log_2(Tamaño de una línea de caché) = log_2(128) = 7 bits
- Bits para el índice del conjunto = 32 - 5 - 7 = 20 bits

Para calcular el índice del conjunto en la caché, tomamos los 20 bits intermedios de la dirección.

**Etiqueta:**
- Bits para la etiqueta = 32 - Bits para el índice - Bits para el desplazamiento 
- Bits para la etiqueta = 32 - 20 - 7 = 5 bits

Dado que estamos accediendo a la primera halfword en cada iteración, habrá un miss de caché en cada iteración del lazo para el segmento #2.

En resumen, en cada iteración del lazo para el segmento #2 habrá un miss de caché. Si realizamos 5 iteraciones, habrá 5 misses de caché.




