Un computador tiene una memoria principal de 64K bytes y una memoria caché de 1K bits para
datos. La memoria caché utiliza correspondencia (mapeo) directa, con un tamaño de línea de 4
palabras de 16 bits c/u. Obtener:

a. ¿Cuántos bits hay en los diferentes campos del formato de dirección de memoria principal?
b. ¿Cuántas líneas contiene la memoria caché?
c. ¿Cuántos bits hay en cada línea de la memoria caché y cómo se dividen según su función?



--------------------------------------------------------------------------------------------------------

** A) 

**Solución:**

**a. Determinación del número de bits para los diferentes campos de la dirección**

Para determinar el número de bits para los diferentes campos de la dirección, se procede de la siguiente manera:

* **Tamaño de la memoria principal:** 64K bytes = 64K * 8 bits/byte = 512K bits
* **Tamaño de la caché:** 1K bits
* **Tamaño de la línea de caché:** 4 palabras * 16 bits/palabra = 64 bits

**Cálculo del número de bits para la etiqueta:**

```
Número de bits para la etiqueta = Tamaño de la memoria principal / Tamaño de la caché
```

```
Número de bits para la etiqueta = 512K bits / 1K bits = 512
```

**Cálculo del número de bits para el índice:**

```
Número de bits para el índice = Número de líneas de caché / Tamaño de la línea de caché
```

```
Número de bits para el índice = 1K / 64 bits
```

```
Número de bits para el índice = 16
```

**Cálculo del número de bits para el desplazamiento:**

```
Número de bits para el desplazamiento = Tamaño de la palabra / Tamaño del bloque de memoria
```

```
Número de bits para el desplazamiento = 16 bits / 64 bits/bloque
```

```
Número de bits para el desplazamiento = 2
```

**Formato de la dirección:**

```
| Etiqueta (512 bits) | Índice (16 bits) | Desplazamiento (2 bits) |
```

**Explicación:**

* **La etiqueta:** identifica la línea de caché que contiene el bloque de memoria principal correspondiente.
* **El índice:** identifica la línea de caché específica dentro de la caché.
* **El desplazamiento:** identifica la palabra dentro del bloque de memoria principal.

**Respuesta:**

El número de bits para los diferentes campos de la dirección es el siguiente:

* **Etiqueta:** 512 bits
* **Índice:** 16 bits
* **Desplazamiento:** 2 bits



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


