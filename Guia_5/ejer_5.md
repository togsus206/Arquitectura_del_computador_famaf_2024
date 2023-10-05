Un computador tiene una memoria principal de 64K bytes y una memoria caché de 1K bits para
datos. La memoria caché utiliza correspondencia (mapeo) directa, con un tamaño de línea de 4
palabras de 16 bits c/u. Obtener:

a. ¿Cuántos bits hay en los diferentes campos del formato de dirección de memoria principal?
b. ¿Cuántas líneas contiene la memoria caché?
c. ¿Cuántos bits hay en cada línea de la memoria caché y cómo se dividen según su función?



--------------------------------------------------------------------------------------------------------

** A) 

Total de bits en la direccion = bits para la etiqueta + bits para el indice + bits para el desplazamiento

La memoria caché tiene líneas de 4 palabras de 16 bits cada una, lo que significa que cada línea tiene 
4x16 bits


Tamaño de cada linea de la cache = palabras por linea x tamaño de palabra (en bits)
				= 4x16 = 64 bits
				
Numero de lineas en la cache = capacidad total de la cache/ tamaño de cada linea
				= 1024/64 = 16 lineas
				
Por lo que sabemos que hay 16 lineas en la cache y cada linea contiene 64bits


Como tenemos 16 lineas (2**4 = 16) tenemos 4 bits para indexar cada linea.
Como cada linea tiene un contiene 64 bits(2**6 = 64) entonces tenemos 6 bits para el desplazamiento 

Luego: 

bits para la etiqueta = Total de bits en la direccion - (Bits para el indice + bits para el desplazamiento)
			= 64 -(4 + 6) = 54 


----------------------------------------------------------------------------------------------------------------------------


b. **Cantidad de líneas en la memoria caché:**

Tamaño de cada linea de la cache = palabras por linea x tamaño de palabra (en bits)
				= 4x16 = 64 bits

Numero de lineas en la cache = capacidad total de la cache/ tamaño de cada linea
				= 1024/64 = 16 lineas
				
Por lo tanto tenemos 16 lineas.

----------------------------------------------------------------------------------------------------------------------------

c. **Cantidad de bits en cada línea de la memoria caché y cómo se dividen según su función:**

Bits para datos: 64 bits
Bits para el índice: 4 bits
Bits para el desplazamiento: 6 bits


