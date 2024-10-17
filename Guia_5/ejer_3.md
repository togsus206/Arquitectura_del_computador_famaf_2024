

Calcular el tamaño total (en bits) de una caché de mapeo directo de 16KiB (16K x 8 bits) de datos y
tamaño de bloque de 4 palabras de 32 bits c/u. Asuma direcciones de 64 bits

-----------------------------------------------------------------------------------------------------------------


### Datos del ejercicio:
- **Tamaño de la caché (datos):** 16 KiB = 16 x 1024 = 16,384 bytes.
- **Tamaño del bloque:** 4 palabras de 32 bits cada una:

  	4x32 bit cada palabra = 128 bits = 16bytes
  	
- **Número de bloques en la caché:** El número total de bloques es el tamaño total de la caché dividido por el tamaño del bloque:
  16384 bytes/ 16 byes por bloque = 1024 lineas 

### Cálculo de los campos de la dirección de 64 bits:

- **Offset dentro del bloque:** Como el tamaño de cada palabra dentro del bloque es de 32 bits = 4 bytes, necesitamos 2 bits para direccionar el offset

- **Palabras dentro del bloque:** Sabemos que hay 4 palabras dentro de cada bloque, por lo que necesitamos 2 bits para direccionar que palabra buscamos

- **Índice:** Hay 1024 bloques en la caché, por lo que necesitamos log_2(1024) = 10 bits para seleccionar el índice de la caché.

- **Etiqueta:** La etiqueta utiliza los bits restantes de la dirección de 64 bits. Entonces, el tamaño de la etiqueta será:
  
  Etiqueta = 64 - bits de offset + bits de índice = 64 - (2 + 2 + 10) = 50
  

### Cálculo del tamaño total de la caché:

- **Tamaño de los datos:** La caché tiene 16,384 bytes (16 KiB) de datos, lo que equivale a 16,384 X 8 = 131,072 bits

- **Tamaño de las etiquetas:** Cada entrada de la caché tiene una etiqueta de 50 bits. Como hay 1024 bloques, el tamaño total de las etiquetas será:
  
  50bits x 1024 bloques = 51,200 bits
  
- **Bits de control:** Normalmente hay un bit de "validación" (y en algunos casos, bits adicionales como para coherencia). Asumamos que hay solo 1 bit de control por bloque, entonces:
  
  1 bit de control x 1024 bloques = 1,024 bits

### Tamaño total de la caché:

El tamaño total será la suma de los bits de datos, etiquetas y control:

tamaño total = 131.072 bits + 51200 bits + 1024 bits = 183,296 bits
 
### Respuesta final:
El tamaño total de la caché es de **183,296 bits**, equivalente a 2**10 x (50(tag)+ 1(bit de validez)+128(palabras por linea(cada una de 32 bit)))

