

Una caché asociativa por conjuntos consta de 64 líneas, dividida en 4 vías. La memoria principal
contiene 4K bloques de 128 palabras cada uno. Muestre el formato de dirección de memoria principal
suponiendo que cada palabra es direccionable directamente en memoria.


----------------------------------------------------------------------------------------



#### 1.1. **Cantidad de palabras por bloque**
Sabemos que cada bloque de la memoria principal tiene **128 palabras**. Por lo tanto, necesitamos suficientes bits para direccionar cada palabra dentro del bloque:

log_2(128) = 7 bits para el offset de palabra dentro del bloque

#### 1.2. **Cantidad de bloques en la memoria**
La memoria principal tiene **4K bloques**, es decir, 4 x 1024 = 4096 bloques. Para seleccionar un bloque en la memoria principal, necesitamos:

log_2(4096) = 12 bits para identificar el bloque

### Paso 2: Formato de la caché

#### 2.1. **División de la caché**
La caché tiene **64 líneas** en total y está dividida en **4 vías**. Esto significa que hay:

64 lineas/ 4 vías = 16 conjuntos

Por lo tanto, necesitamos log_2(16) = 4 bits para identificar el conjunto en la caché.

#### 2.2. **Formato de la dirección en la caché**
La dirección de memoria que llega a la caché se divide en tres partes:

1. **Etiqueta (Tag):** Se usa para identificar el bloque de la memoria principal asociado a un conjunto de la caché.
2. **Índice del conjunto (Set Index):** Se usa para seleccionar uno de los 16 conjuntos en la caché.
3. **Offset de palabra (Word Offset):** Se usa para seleccionar una palabra específica dentro del bloque.

#### 2.3. **Asignación de bits**
- **Offset de palabra (Word Offset):** Sabemos que cada bloque tiene 128 palabras, por lo que se necesitan **7 bits** para seleccionar la palabra dentro del bloque.
- **Índice del conjunto:** Hay 16 conjuntos en la caché, lo que requiere **4 bits**.
- **Etiqueta (Tag):** El resto de los bits se usan para la etiqueta. Como las direcciones en memoria principal son de 19 bits (12 bits para los bloques y 7 bits para las palabras), y ya usamos 11 bits (7 para el offset y 4 para el índice), los **8 bits restantes** son para la etiqueta.

### Paso 3: Formato final de la dirección de memoria

- **Etiqueta (Tag):** 8 bits.
- **Índice del conjunto (Set Index):** 4 bits.
- **Offset de palabra (Word Offset):** 7 bits.

Por lo tanto, el formato de la dirección de memoria principal sería:

| **Etiqueta (Tag)** | **Índice (Set Index)** | **Offset de palabra (Word Offset)** |
|--------------------|------------------------|-------------------------------------|
| 8 bits             | 4 bits                 | 7 bits                              |



El formato de la dirección de memoria principal está compuesto por:
- **8 bits** para la etiqueta.
- **4 bits** para el índice del conjunto.
- **7 bits** para el offset de palabra dentro del bloque.







