Una caché asociativa por conjuntos consta de 64 líneas, dividida en 4 vías. La memoria principal
contiene 4K bloques de 128 palabras cada uno. Muestre el formato de dirección de memoria principal
suponiendo que cada palabra es direccionable directamente en memoria.


----------------------------------------------------------------------------------------



- Caché asociativa por conjuntos con 64 líneas y 4 vías.
- La memoria principal contiene 4K bloques de 128 palabras cada uno.

Vamos a calcular el número de bits necesarios para representar diferentes partes de la dirección de memoria principal.

1. **Número de bits para representar cada bloque en la memoria principal:**
   - La memoria principal contiene 4K bloques, por lo que necesitamos log_2(4K)  bits para representar cada bloque.
   
   Numero de bloques en memoria principal = 4k bloques = 2**12 bloques
   						
   Bits para bloque en memorai principal = log_2 (2**12) = 12 bits

2. **Número de bits para representar cada palabra en un bloque:**
   - Cada bloque tiene 128 palabras, por lo que necesitamos log_2(128) bits para representar cada palabra en un bloque.
   ----> 128 = 2**7
   	
   	log_2 (2**7) = 7 bits

3. **Número de bits para representar la vía (asociatividad):**
   - La caché tiene 4 vías, por lo que necesitamos log_2(4) bits para representar la vía.
   
   -------> log_2 (4) = 2 bits

4. **Número de bits para representar el conjunto:**
   - La caché tiene 64 líneas, por lo que necesitamos log_2(64) bits para representar el conjunto.
   
   -----------> log_2(64) = log_2(2**6) = 6 bits

5. **Número de bits para el desplazamiento de palabra:**
   - Cada palabra es direccionable directamente, así que necesitamos log_2(1) = 0 bits para el desplazamiento.



Formato de direccion = 12 bits(bloque) + 7 bits (palabra) + 2 bits (via) + 6 bits (conjunto) + 0 bits (desplazamiento) = 27 bits






