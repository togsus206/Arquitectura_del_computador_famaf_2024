Las memorias caché son fundamentales para elevar el rendimiento de un sistema de memoria
jerárquico respecto del procesador. A continuación se da una lista de referencias de acceso a
memoria (direcciones de 64 bits) las cuales deben ser consideradas como accesos secuenciales en
ese mismo orden. El formato que se utiliza para cada dirección está reducido a sólo 16 bits, solo con
fines prácticos:
0x000C, 0x02D0, 0x00AC, 0x0008, 0x02FC, 0x0160,
0x02F8, 0x0038, 0x02D4, 0x00AC, 0x00B0, 0x0160
Se debe:

a. Para cada una de estas referencias a memoria, determinar el binario de la dirección de cada
palabra (cada palabra de 32 bits), la etiqueta (tag), el numero de linea (index) asignado en
una cache de mapeo directo, con un tamaño de 16 bloques de 1 palabra c/u. Además liste
qué referencias produjeron un acierto (hit) o un fallo (miss) de caché, suponiendo que la
cache se inicializa vacía.

b. Para cada una de estas referencias a memoria, determinar el binario de la dirección de cada
palabra (cada palabra de 32 bits), la etiqueta (tag), el numero de linea (index) asignado en
una cache de mapeo directo, con un tamaño de 8 bloques de 2 palabra c/u. Además liste qué
referencias produjeron un acierto (hit) o un fallo (miss) de caché, suponiendo que la cache se
inicializa vacía.

------------------------------------------------------------------------------------------------------


A)


Para determinar el formato binario de la dirección, la etiqueta (tag) y el número de línea (índice) en una caché de mapeo directo, con un tamaño de 16 bloques de 1 palabra cada uno, para cada referencia a memoria proporcionada, vamos a seguir los siguientes pasos:

1. Convertir las direcciones a formato binario de 16 bits.
2. Determinar el número de bits necesarios para el índice y el desplazamiento.
3. Calcular la etiqueta (tag).
4. Determinar el número de línea (índice).
5. Identificar si la referencia a memoria resulta en un acierto (hit) o un fallo (miss) en la caché.

**Pasos para cada dirección:**

a. **Determinar el número de bits para el índice y el desplazamiento:**
   - Bloques en la caché: 16 bloques (4 bits para el índice, ya que 2^4 = 16)
   - Tamaño de bloque: 1 palabra de 32 bits (5 bits para el desplazamiento, ya que 2^5 = 32)

b. **Calcular la etiqueta (tag):**
   - Longitud total de la dirección: 16 bits
   - Etiqueta = Longitud total de la dirección - Bits para el índice - Bits para el desplazamiento
   - Etiqueta = 16 - 4 - 5 = 7 bits

c. **Determinar el número de línea (índice):**
   - El resto de los bits después de la etiqueta son para el índice.
   - Índice = Bits para el índice = 4 bits

d. **Identificar si es un acierto (hit) o un fallo (miss) en la caché:**
   - Inicialmente, la caché está vacía.


**Formato de la dirección:**
- Longitud total de la dirección: 16 bits
- Etiqueta (tag): 7 bits
- Índice: 4 bits (16 bloques en total)
- Desplazamiento: 5 bits (32 bits por palabra)

A continuación, realizaremos este proceso para cada dirección:

1. **Dirección: 0x000C (binario: 0000 0000 0000 1100)**
   - Etiqueta: 0000000
   - Índice: 0000
   - Desplazamiento: 01100
   - Acierto/Fallo: Fallo (caché vacía)

2. **Dirección: 0x02D0 (binario: 0000 0010 1101 0000)**
   - Etiqueta: 0000001
   - Índice: 0110
   - Desplazamiento: 10000
   - Acierto/Fallo: Fallo (no hay entrada en la caché para este índice)

3. **Dirección: 0x00AC (binario: 0000 0000 1010 1100)**
   - Etiqueta: 0000000
   - Índice: 0101
   - Desplazamiento: 01100
   - Acierto/Fallo: Fallo (no hay entrada en la caché para este índice)

4. **Dirección: 0x0008 (binario: 0000 0000 0000 1000)**
   - Etiqueta: 0000000
   - Índice: 0000
   - Desplazamiento: 01000
   - Acierto/Fallo: Acierto (la etiqueta y el índice coinciden con una entrada en la caché)

5. **Dirección: 0x02FC (binario: 0000 0010 1111 1100)**
   - Etiqueta: 0000001
   - Índice: 0111
   - Desplazamiento: 11100
   - Acierto/Fallo: Fallo (no hay entrada en la caché para este índice)

6. **Dirección: 0x0160 (binario: 0000 0001 0110 0000)**
   - Etiqueta: 0000000
   - Índice: 1011
   - Desplazamiento: 00000
   - Acierto/Fallo: Fallo (no hay entrada en la caché para este índice)

7. **Dirección: 0x02F8 (binario: 0000 0010 1111 1000)**
   - Etiqueta: 0000001
   - Índice: 0111
   - Desplazamiento: 11000
   - Acierto/Fallo: Acierto (la etiqueta y el índice coinciden con una entrada en la caché)

8. **Dirección: 0x0038 (binario: 0000 0000 0011 1000)**
   - Etiqueta: 0000000
   - Índice: 0011
   - Desplazamiento: 1000
   - Acierto/Fallo: Fallo (no hay entrada en la caché para este índice)

9. **Dirección: 0x02D4 (binario: 0000 0010 1101 0100)**
   - Etiqueta: 0000001
   - Índice: 0110
   - Desplazamiento: 10100
   - Acierto/Fallo: Acierto (la etiqueta y el índice coinciden con una entrada en la caché)

10. **Dirección: 0x00AC (binario: 0000 0000 1010 1100)**
   - Etiqueta: 0000000
   - Índice: 0101
   - Desplazamiento: 01100
   - Acierto/Fallo: Acierto (la etiqueta y el índice coinciden con una entrada en la caché)

11. **Dirección: 0x00B0 (binario: 0000 0000 1011 0000)**
   - Etiqueta: 0000000
   - Índice: 0101
   - Desplazamiento: 10000
   - Acierto/Fallo: Acierto (la etiqueta y el índice coinciden con una entrada en la caché)

12. **Dirección: 0x0160 (binario: 0000 0001 0110 0000)**
   - Etiqueta: 0000000
   - Índice: 1011
   - Desplazamiento: 00000
   - Acierto/Fallo: Acierto (la etiqueta y el índice coinciden con una entrada en la caché)
   
   
   ---------------------------------------------------------------------------------------------
   
   B)
   
   
   


**Especificaciones para la caché:**
- Tamaño de la caché: 8 bloques, es decir 2**3 = 8, 3 bits para el indice
- Palabras por bloque: 2 palabras (requiere 1 bit para el desplazamiento)
- Tamaño total de la caché (en palabras): 8 bloques * 2 palabras/bloque = 16 palabras, por lo que 2**4 = 16, es decir 4 bots de desplazamiento
- Etiqueta 16 - 4 - 3 = 9



**Direcciones en binario y desglose:**

1. **Dirección: 0x000C**
   - Binario: 0000 0000 0000 1100
   - Etiqueta: 000000000
   - Índice: 000
   - Desplazamiento: 1100
   - Acierto/Fallo: Fallo (caché vacía)

2. **Dirección: 0x02D0**
   - Binario: 0000 0010 1101 0000
   - Etiqueta: 000000101
   - Índice: 101
   - Desplazamiento: 0000
   - Acierto/Fallo: Fallo (caché vacía)

3. **Dirección: 0x00AC**
   - Binario: 0000 0000 1010 1100
   - Etiqueta: 000000001
   - Índice: 010
   - Desplazamiento: 1100
   - Acierto/Fallo: Fallo (caché vacía)

4. **Dirección: 0x0008**
   - Binario: 0000 0000 0000 1000
   - Etiqueta: 000000000
   - Índice: 000
   - Desplazamiento: 1000
   - Acierto/Fallo: Acierto (la etiqueta y el índice coinciden con una entrada en la caché)

5. **Dirección: 0x02FC**
   - Binario: 0000 0010 1111 1100
   - Etiqueta: 000000101
   - Índice: 111
   - Desplazamiento: 1100
   - Acierto/Fallo: Fallo (caché vacía)

6. **Dirección: 0x0160**
   - Binario: 0000 0001 0110 0000
   - Etiqueta: 000000010
   - Índice: 110
   - Desplazamiento: 0000
   - Acierto/Fallo: Fallo (caché vacía)

7. **Dirección: 0x02F8**
   - Binario: 0000 0010 1111 1000
   - Etiqueta: 000000101
   - Índice: 111
   - Desplazamiento: 1000
   - Acierto/Fallo: Acierto (la etiqueta y el índice coinciden con una entrada en la caché)

8. **Dirección: 0x0038**
   - Binario: 0000 0000 0011 1000
   - Etiqueta: 000000000
   - Índice: 011
   - Desplazamiento: 1000
   - Acierto/Fallo: Fallo (caché vacía)

9. **Dirección: 0x02D4**
   - Binario: 0000 0010 1101 0100
   - Etiqueta: 000000101
   - Índice: 101
   - Desplazamiento: 0100
   - Acierto/Fallo: Acierto (la etiqueta y el índice coinciden con una entrada en la caché)

10. **Dirección: 0x00AC**
   - Binario: 0000 0000 1010 1100
   - Etiqueta: 000000001
   - Índice: 010
   - Desplazamiento: 1100
   - Acierto/Fallo: Acierto (la etiqueta y el índice coinciden con una entrada en la caché)

11. **Dirección: 0x00B0**
   - Binario: 0000 0000 1011 0000
   - Etiqueta: 000000001
   - Índice: 011
   - Desplazamiento: 0000
   - Acierto/Fallo: Fallo (caché vacía)


   
   
   
   
   
   
   

