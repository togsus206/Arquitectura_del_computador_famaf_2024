Considere una CACHE con los siguientes parámetros:
● Criterio de correspondencia: Asociativa por conjuntos
● Asociatividad (N-vias): 2
● Tamaño de bloque: 2 words
● Tamaño de palabra (word): 32 bits
● Tamaño de la cache: 32K words
● Tamaño de dirección: 32 bits
● Cada palabra es directamente direccionable en memoria
Responder:
a. Muestre el formato de dirección de memoria principal.

b. ¿Cuál es el tamaño de toda el área de Tag de la cache, expresada en bits?

c. Suponga que cada LINEA de la cache contiene además un bit de validación (V) y un tiempo
de vida de 8 bits. Cual es el tamaño completo (expresado en bits) de un CONJUNTO de la
cache, considerando datos, tags y los bits de status antes mencionados?



-------------------------------------------------------------------------

A)


1. **Número de bits para representar cada bloque en la memoria principal:**

Bits para bloque en memoria principal = log_2(Tamaño de bloque)

Tamaño de bloque = 2 palabras por bloque = 2 x 32 bits por bloque

Bits para bloque en memoria principal = log_2(64) = 6 bits

2. **Número de bits para representar cada palabra en un bloque:**

Bits para palabra en un bloque = log_2(Tamaño de palabra)

Tamaño de palabra = 32 bits

Bits para palabra en un bloque = log_2(32) = 5 bits

3. **Número de bits para representar la vía (asociatividad):**

Bits para representar la vía = log_2(Número de vías)

Número de vías = 2 vías

Bits para representar la vía = log_2(2) = 1 bit

4. **Número de bits para representar el conjunto:**

Para una asociatividad de 2 (2 vías), necesitamos 1 bit para seleccionar la vía (ya que log_2(2) = 1)).

5. **Número de bits para el desplazamiento de palabra:**

Dado que cada palabra es direccionable directamente, no se necesita ningún bit para el desplazamiento de palabra 
(log_2(1) = 0 bits).

Por lo tanto, el formato de la dirección de memoria principal es:

Formato de dirección = Bits para bloque + Bits para palabra + Bits para vía + Bits para conjunto + Bits para desplazamiento


Formato de dirección = 6  bits (bloque) + 5 bits (palabra) + 1 bit (vía) + 1 bit (conjunto) + bits (desplazamiento) = 13 bits


------------------------------------------------------------------------------------------------------------

B) 


Área de etiquetas (Tag) = Tamaño de dirección total - (Tamaño de conjunto + Tamaño de bloque + Tamaño para la vía)

Tamaño de dirección total = 32 bits (según el enunciado)

Tamaño de conjunto = 1 bit (para seleccionar la vía)

Tamaño de bloque = 6 bits (según el cálculo anterior)

Tamaño para la vía = 1 bit (para seleccionar la vía)

Área de etiquetas (Tag) = 32 bits - (1 bit + 6 bits + 1 bit) = 24 bits



----------------------------------------------------------------------------------------------------------------

C)


Una línea de la caché consta de los siguientes componentes:

1. Datos: Tamaño de bloque en la caché (2 words de 32 bits cada uno).
2. Etiqueta (Tag): Determinada por el tamaño de la dirección y el formato de la caché.
3. Bits de validación (V): 1 bit por línea.
4. Tiempo de vida: 8 bits por línea.

Vamos a calcular el tamaño total para un conjunto de la caché considerando estos componentes.

1. **Tamaño de bloque en la caché (datos):**
   - Cada bloque tiene 2 palabras, y cada palabra tiene un tamaño de 32 bits, por lo que el tamaño de bloque es de (2 x 32 = 64) bits.

2. **Tamaño de la etiqueta (Tag):**
   - Ya calculamos el tamaño de la etiqueta en la pregunta anterior como 24 bits.

3. **Bits de validación (V):**
   - 1 bit por línea.

4. **Tiempo de vida:**
   - 8 bits por línea.

Por lo tanto, el tamaño total para un conjunto de la caché es la suma de estos componentes:

Tamaño total de un conjunto = Tamaño de bloque (datos) + Tamaño de etiqueta (Tag) + Bits de validación (V) + Tiempo de vida

Tamaño total de un conjunto = 64 bits + 24 bits + 1 bit + 8 bits = 97 bits

Por lo tanto, el tamaño completo de un conjunto de la caché, considerando datos, etiquetas y los bits de estado mencionados, es de 97 bits.

Luego como el conjunto tiene 2 lineas ------> tamaño total por conjunto es 2x97 = 194 bits










