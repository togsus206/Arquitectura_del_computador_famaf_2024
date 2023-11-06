

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




------------------------------------------------------------------------------------------------------------------------------------

**A)**

El formato de memoria principal es el siguiente:

```
| Dirección de memoria principal (32 bits) |
```

La dirección de memoria principal tiene 32 bits, ya que es necesario para identificar de forma única una palabra en la memoria principal.

**Explicación:**

La dirección de memoria principal se compone de dos partes:

* **Offset:** identifica la palabra dentro de un bloque de memoria principal.

En este caso, la memoria principal tiene 4G palabras, que equivalen a 2^32 bits. Los bloques de memoria principal tienen 4K palabras, que equivalen a 2^12 bits.

Por lo tanto, el tamaño del offset es de 20 bits, ya que es necesario para identificar de forma única una palabra dentro de un bloque de memoria principal.


**Comentarios:**

En este caso, la dirección de memoria principal es de 32 bits. Esto es suficiente para identificar de forma única una palabra en la memoria principal.

Sin embargo, si la memoria principal fuera más grande, la dirección de memoria principal tendría que ser más grande para poder identificar de forma única una palabra en la memoria principal.

**Aclaración:**

En el enunciado del problema se especifica que la memoria caché tiene 2 vías, pero esto no afecta al formato de memoria principal. El formato de memoria principal es el mismo independientemente del número de vías de la caché.

**Respuesta:**

```
| Dirección de memoria principal (32 bits) |
```



--------------------------------------------------------------------------------------------------------------------------------------


B)



En el segmento #1, la primera instrucción LDURH x10, [x6, #0] produce un MISS de caché, ya que la dirección de memoria principal es 0x00001008, que no está en la caché.

La segunda instrucción LDURH x11, [x6, #8] también produce un MISS de caché, ya que la dirección de memoria principal es 0x00001010, que no está en la caché.

Las siguientes instrucciones del lazo no producen MISS de caché, ya que las direcciones de memoria principal están en la caché.

Por lo tanto, en 5 iteraciones del lazo, se producen **2 MISS de caché**.

**Explicación:**

En la primera iteración del lazo, las direcciones de memoria principal son las siguientes:

* LDURH x10, [x6, #0]: 0x00001008
* LDURH x11, [x6, #8]: 0x00001010

En la segunda iteración del lazo, las direcciones de memoria principal son las siguientes:

* LDURH x10, [x6, #0]: 0x00001014
* LDURH x11, [x6, #8]: 0x0000101c

En la tercera iteración del lazo, las direcciones de memoria principal son las siguientes:

* LDURH x10, [x6, #0]: 0x00001020
* LDURH x11, [x6, #8]: 0x00001028

En la cuarta iteración del lazo, las direcciones de memoria principal son las siguientes:

* LDURH x10, [x6, #0]: 0x0000102c
* LDURH x11, [x6, #8]: 0x00001034

En la quinta iteración del lazo, las direcciones de memoria principal son las siguientes:

* LDURH x10, [x6, #0]: 0x00001038
* LDURH x11, [x6, #8]: 0x00001040


Como se puede ver, solo hay 2 líneas de caché disponibles. La primera línea de caché contiene la dirección 0x00001008 en la primera iteración del lazo. La segunda línea de caché contiene la dirección 0x00001010 en la segunda iteración del lazo.

En las siguientes iteraciones del lazo, las direcciones de memoria principal de las instrucciones LDURH x10, [x6, #0] se pueden almacenar en las líneas de caché que ya contienen las direcciones de memoria principal de las instrucciones LDURH x10, [x6, #0] de las iteraciones anteriores. Por lo tanto, no se producen MISS de caché.
