Calcular el tamaño total (en bits) de una caché de mapeo directo de 16KiB (16K x 8 bits) de datos y
tamaño de bloque de 4 palabras de 32 bits c/u. Asuma direcciones de 64 bits

-----------------------------------------------------------------------------------------------------------------

Dado que estamos considerando una caché de mapeo directo, separamos cada dirección en tres partes: etiqueta, índice y desplazamiento.

1. **Tamaño de la caché (en bytes)**:
   - Tamaño de la caché = 16 KiB
   - Tamaño de bloque = 4 palabras de 32 bits cada una = 4 * 32 bits = 128 bits = 16 bytes
   - Entonces, el número de bloques en la caché = Tamaño de la caché / Tamaño de bloque = 16 KiB / 16 bytes = 1 Ki bloques.

2. **Número de bits para el índice**:
   - Como hay 1 Ki bloques, necesitamos log₂(1 Ki) bits para el índice.
   - log₂(1 Ki) = log₂(2^10) = 10 bits para el índice.

3. **Número de bits para el desplazamiento**:
   - Cada bloque tiene 16 bytes, lo que requiere log₂(16) = 4 bits para el desplazamiento.

4. **Número de bits para la etiqueta**:
   - La longitud total de la dirección es de 64 bits.
   - Bits para el índice y el desplazamiento: 10 (índice) + 4 (desplazamiento) = 14 bits.
   - Por lo tanto, bits para la etiqueta = Longitud total de la dirección - Bits para el índice y el desplazamiento = 64 - 14 = 50 bits.

Ahora, calculamos el tamaño total de la caché en bits considerando la cantidad de bloques y los bits necesarios para el índice, desplazamiento y etiqueta:

- Tamaño total de la caché (en bits) = Número de bloques * (Bits para índice + Bits para desplazamiento + Bits para etiqueta)
- Tamaño total de la caché (en bits) = 1 Ki bloques * (10 bits + 4 bits + 50 bits)
- Tamaño total de la caché (en bits) = 1 Ki bloques * 64 bits
- Tamaño total de la caché (en bits) = 1 Ki * 64 bits
- Tamaño total de la caché (en bits) = 64 Ki bits

Entonces, el tamaño total de la caché de mapeo directo es de 64 Ki bits.
