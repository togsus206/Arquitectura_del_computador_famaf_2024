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


### Parámetros clave:

- **Caché de mapeo directo** con **16 líneas**.
- **Tamaño de bloque**: 1 palabra de 32 bits.
- El **índice** utiliza 4 bits.
- El **tag** utiliza 12 bits.
- Las direcciones son de 64 bits, pero solo nos preocupan los últimos 16 bits (para simplificar el análisis).

---

### Revisión de los accesos:

1. **0x000C**
   - **Binario**: `0000 0000 0000 1100`
   - **Índice**: `1100` (línea 12)
   - **Tag**: `0000 0000 0000`
   - **Resultado**: **Miss** (primera vez que se accede)

2. **0x02D0**
   - **Binario**: `0000 0010 1101 0000`
   - **Índice**: `0000` (línea 0)
   - **Tag**: `0000 0010 11`
   - **Resultado**: **Miss** (primera vez que se accede)

3. **0x00AC**
   - **Binario**: `0000 0000 1010 1100`
   - **Índice**: `1010` (línea 10)
   - **Tag**: `0000 0000 00`
   - **Resultado**: **Miss** (primera vez que se accede)

4. **0x0008**
   - **Binario**: `0000 0000 0000 1000`
   - **Índice**: `1000` (línea 8)
   - **Tag**: `0000 0000 0000`
   - **Resultado**: **Miss** (primera vez que se accede)

5. **0x02FC**
   - **Binario**: `0000 0010 1111 1100`
   - **Índice**: `1100` (línea 12)
   - **Tag**: `0000 0010 11`
   - **Resultado**: **Miss** (primera vez que se accede en la línea 12, reemplaza a 0x000C)

6. **0x0160**
   - **Binario**: `0000 0001 0110 0000`
   - **Índice**: `0000` (línea 0)
   - **Tag**: `0000 0001 01`
   - **Resultado**: **Miss** (reemplaza a 0x02D0 en la línea 0)

7. **0x02F8**
   - **Binario**: `0000 0010 1111 1000`
   - **Índice**: `1000` (línea 8)
   - **Tag**: `0000 0010 11`
   - **Resultado**: **Miss** (reemplaza a 0x0008 en la línea 8)

8. **0x0038**
   - **Binario**: `0000 0000 0011 1000`
   - **Índice**: `1000` (línea 8)
   - **Tag**: `0000 0000 00`
   - **Resultado**: **Miss** (reemplaza a 0x02F8 en la línea 8)

9. **0x02D4**
   - **Binario**: `0000 0010 1101 0100`
   - **Índice**: `0100` (línea 4)
   - **Tag**: `0000 0010 11`
   - **Resultado**: **Miss** (primera vez que se accede a esta línea)

10. **0x00AC**
    - **Binario**: `0000 0000 1010 1100`
    - **Índice**: `1010` (línea 10)
    - **Tag**: `0000 0000 00`
    - **Resultado**: **Hit** (ya se accedió en el acceso 3)

11. **0x00B0**
    - **Binario**: `0000 0000 1011 0000`
    - **Índice**: `0000` (línea 0)
    - **Tag**: `0000 0000 10`
    - **Resultado**: **Miss** (reemplaza a 0x0160 en la línea 0)

12. **0x0160**
    - **Binario**: `0000 0001 0110 0000`
    - **Índice**: `0000` (línea 0)
    - **Tag**: `0000 0001 01`
    - **Resultado**: **Miss** (se accedió en el acceso 6 pero fue reemplazado por 0x00B0)

---

### Resumen de **Hits** y **Misses**:

- **Hits**: Solo en el **acceso 10** (0x00AC), porque ya se accedió a esa dirección en el acceso 3.
- **Misses**: En todos los otros accesos.

---

### Conclusión:
- Solo encontramos un **hit** en el acceso **10** cuando se accede a la dirección **0x00AC** nuevamente.

   
 
 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------


B)




   
   
   
   

