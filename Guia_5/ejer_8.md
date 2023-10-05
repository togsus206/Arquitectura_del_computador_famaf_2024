Sea un sistema con una memoria principal de 1M palabras divididas en 4K bloques, donde cada
palabra es direccionable directamente en memoria. Definir el formato de la dirección de memoria
principal en los siguientes casos, sabiendo que la memoria caché posee 64 líneas:
a. Memoria caché con función de correspondencia directa.

b. Memoria caché con función de correspondencia full-asociativa.

c. Memoria caché con función de correspondencia asociativa de 8 vías.


----------------------------------------------------------------------------------------

A)


1. **Tamaño del bloque en la caché (datos):**
   - Cada bloque tiene una palabra, y cada palabra tiene un tamaño 32 bits (según la información proporcionada), por lo que el tamaño de bloque es de 32 bits.

2. **Número de líneas en la caché:**
   - La caché tiene 64 líneas (según la información proporcionada).

3. **Tamaño del índice:**
   - Como hay 64 líneas en la caché, necesitaremos 6 bits para indexar cada línea 64 = 2^6.

4. **Tamaño de la etiqueta (Tag):**
   - El tamaño de la dirección total es 32 bits (según la información proporcionada).
   - Se resta el tamaño del índice y el tamaño del bloque para obtener el tamaño de la etiqueta:
   - 32 - 6 - 32 = -6 bits. Sin embargo, no tiene sentido tener un tamaño negativo para la etiqueta, por lo que asumimos que la etiqueta es de 0 bits.

Por lo tanto, el formato de la dirección de memoria principal para una memoria caché con correspondencia directa es:

- **Etiqueta (Tag):** 0 bits
- **Índice:** 6 bits
- **Desplazamiento:** 32 bits (tamaño del bloque)


-------------------------------------------------------------------------------------------------------------

B)


En una memoria caché con función de correspondencia full-asociativa, cada bloque de la memoria principal se puede ubicar en cualquier línea de la caché. Por lo tanto, la dirección de la memoria principal se divide en tres partes principales: la etiqueta (Tag), el índice y el desplazamiento.


Vamos a calcular el tamaño de cada parte:

1. **Tamaño del bloque en la caché (datos):**
   - Cada bloque tiene una palabra, y cada palabra tiene un tamaño que no se proporciona. Llamémoslo N bits.

2. **Número de líneas en la caché:**
   - La caché tiene 64 líneas (según la información proporcionada).

3. **Tamaño de la etiqueta (Tag):**
   - El tamaño de la dirección total es 32 bits (según la información proporcionada).
   - Restamos el tamaño del índice y el tamaño del bloque para obtener el tamaño de la etiqueta:
   - 32 - log_2(64) - N, donde N es el tamaño de la palabra en bits.

Por lo tanto, el formato de la dirección de memoria principal para una memoria caché con correspondencia full-asociativa es:

- **Etiqueta (Tag):** 32 - log_2(64) - N bits
- **Índice:** No se aplica en una caché full-asociativa
- **Desplazamiento:** N bits (tamaño del bloque)

--------------------------------------------------------------------------------------------------------------------------------

C)


En una memoria caché con función de correspondencia asociativa de 8 vías, cada bloque de la memoria principal puede ubicarse en cualquiera de las 8 líneas de una vía específica de la caché. Por lo tanto, la dirección de la memoria principal se divide en tres partes principales: la etiqueta (Tag), el índice y el desplazamiento.


Vamos a calcular el tamaño de cada parte:

1. **Tamaño del bloque en la caché (datos):**
   - Cada bloque tiene una palabra, y cada palabra tiene un tamaño que no se proporciona. Llamémoslo N bits.

2. **Número de líneas en una vía de la caché:**
   - Cada vía tiene 64 líneas, por lo tanto, habrá 64 líneas en cada una de las 8 vías de la caché. 

3. **Tamaño del índice:**
   - Como hay 64 líneas en cada vía, necesitaremos log_2(64) = 6 bits para indexar cada línea en cada vía.

4. **Tamaño de la etiqueta (Tag):**
   - El tamaño de la dirección total es 32 bits (según la información proporcionada).
   - Restamos el tamaño del índice y el tamaño del bloque para obtener el tamaño de la etiqueta:
   - 32 - 6 - N, donde N es el tamaño de la palabra en bits.

Por lo tanto, el formato de la dirección de memoria principal para una memoria caché con correspondencia asociativa de 8 vías es:

- **Etiqueta (Tag):** 32 - 6 - N bits
- **Índice:** 6 bits
- **Desplazamiento:** N bits (tamaño del bloque)










