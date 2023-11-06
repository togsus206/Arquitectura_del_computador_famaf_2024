Considerando un procesador que trabaja a 1.7GHz y los siguientes tiempos de acceso a memoria:

Memory technology		    typoical access time 	$ per Gib 
SRAM semiconductor memory	0.5-2.5 ns		        $500-$1000
DRAM semiconductor memory	50-70 ns		        $10-$20
Flash semiconductor memory	5000- 50000 ns 		    $0.75-$1
Magnetic disk 			    5000000- 20000000ns	    $0.05-$0.10

¿Cuántos ciclos de clock implica leer un dato de caché (SRAM) y de memoria principal (DRAM)?

---------------------------------------------------------------------------------------------------------------------------------------------------------------


La frecuencia de reloj en ciclos por segundo (Hz) es igual a 1.7 gigahertz (GHz), que es 1.7 × 10^9 ciclos por segundo. Para calcular el número de ciclos de reloj para cada tipo de memoria, simplemente multiplicaremos la frecuencia de reloj (ciclos por segundo) por el tiempo de acceso (en segundos) para obtener el número de ciclos.

Para SRAM (Semiconductor Memory):

Tiempo de acceso típico: 0.5-2.5 ns (usaremos el valor mínimo para calcular el número mínimo de ciclos)
Ciclos de reloj para SRAM = Tiempo de acceso (en segundos) * Frecuencia de reloj (en ciclos por segundo)
Ciclos de reloj para SRAM = 0.5 ns * 1.7 × 10^9 ciclos por segundo


Ciclos de reloj para SRAM = 0.5 ns * 1.7 × 10^9 ciclos por segundo ≈ 850 ciclos de reloj

Para DRAM (Semiconductor Memory):

Tiempo de acceso típico: 50-70 ns (usaremos el valor mínimo para calcular el número mínimo de ciclos)
Ciclos de reloj para DRAM = Tiempo de acceso (en segundos) * Frecuencia de reloj (en ciclos por segundo)
Ciclos de reloj para DRAM = 50 ns * 1.7 × 10^9 ciclos por segundo
Ahora, vamos a calcular estos valores.

Ciclos de reloj para DRAM = 50 ns * 1.7 × 10^9 ciclos por segundo ≈ 85,000 ciclos de reloj

Por lo tanto, leer un dato de la caché (SRAM) implica aproximadamente 850 ciclos de reloj, mientras que leer un dato de la memoria principal (DRAM) implica aproximadamente 85,000 ciclos de reloj en un procesador que trabaja a 1.7 GHz.
