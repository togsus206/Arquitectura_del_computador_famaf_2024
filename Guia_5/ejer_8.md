

Sea un sistema con una memoria principal de 1M palabras divididas en 4K bloques, donde cada
palabra es direccionable directamente en memoria. Definir el formato de la dirección de memoria
principal en los siguientes casos, sabiendo que la memoria caché posee 64 líneas:

a. Memoria caché con función de correspondencia directa.

b. Memoria caché con función de correspondencia full-asociativa.

c. Memoria caché con función de correspondencia asociativa de 8 vías.


----------------------------------------------------------------------------------------

A)


En una memoria caché con función de correspondencia directa, cada línea de la caché está asociada con un único bloque de memoria principal. Por lo tanto, el formato de la dirección de memoria principal se compone de dos partes:

Etiqueta: identifica de forma única el bloque de memoria principal en la caché.
Offset: identifica la palabra dentro del bloque de memoria principal.
En este caso, la memoria principal tiene 1M palabras, que equivalen a 2^20 bits. Los bloques de memoria principal tienen 4K palabras, que equivalen a 2^12 bits.

Por lo tanto, el tamaño de la etiqueta es de 20 bits, ya que es necesario para identificar de forma única un bloque de memoria principal en la caché. El tamaño del offset es de 12 bits, ya que es necesario para identificar la palabra dentro del bloque de memoria principal.

Por lo tanto, el formato de la dirección de memoria principal es el siguiente:

| Etiqueta (20 bits) | Offset (12 bits) |


-------------------------------------------------------------------------------------------------------------

B)


En una memoria caché con función de correspondencia full-asociativa, cualquier bloque de memoria principal puede almacenarse en cualquier línea de la caché. Por lo tanto, el formato de la dirección de memoria principal se compone de una sola parte:

Etiqueta: identifica de forma única el bloque de memoria principal en la caché.
En este caso, la memoria principal tiene 1M palabras, que equivalen a 2^20 bits. Los bloques de memoria principal tienen 4K palabras, que equivalen a 2^12 bits.

Por lo tanto, el tamaño de la etiqueta es de 20 bits, ya que es necesario para identificar de forma única un bloque de memoria principal en la caché.

Por lo tanto, el formato de la dirección de memoria principal es el siguiente:

| Etiqueta (20 bits) |

- **Índice:** No se aplica en una caché full-asociativa
- **Desplazamiento:** No se aplica en una caché full-asociativa

--------------------------------------------------------------------------------------------------------------------------------

C)


En una memoria caché con función de correspondencia asociativa de 8 vías, cualquier bloque de memoria principal puede almacenarse en cualquiera de las 8 líneas de la caché. Por lo tanto, el formato de la dirección de memoria principal se compone de tres partes:

Conjunto: identifica el conjunto de la caché que contiene el bloque de memoria principal correspondiente.
Vía: identifica la línea de caché específica dentro del conjunto.
Etiqueta: identifica el bloque de memoria principal dentro del conjunto.
En este caso, la memoria principal tiene 1M palabras, que equivalen a 2^20 bits. Los bloques de memoria principal tienen 4K palabras, que equivalen a 2^12 bits.

Por lo tanto, el tamaño del conjunto es de 20 bits, ya que es necesario para identificar de forma única un conjunto de la caché. El tamaño de la vía es de 3 bits(ya que son 8 vias 2**3), ya que es necesario para identificar de forma única una línea de caché dentro de un conjunto. El tamaño de la etiqueta es de 20 bits, ya que es necesario para identificar de forma única un bloque de memoria principal dentro de un conjunto.

Por lo tanto, el formato de la dirección de memoria principal es el siguiente:

| Conjunto (20 bits) | Vía (3 bits) | Etiqueta (20 bits) |










