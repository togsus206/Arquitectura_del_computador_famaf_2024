Considerando un procesador que trabaja a 1.7GHz y los siguientes tiempos de acceso a memoria:

Memory technology		    typoical access time 	$ per Gib 
SRAM semiconductor memory	0.5-2.5 ns		        $500-$1000
DRAM semiconductor memory	50-70 ns		        $10-$20
Flash semiconductor memory	5000- 50000 ns 		    $0.75-$1
Magnetic disk 			    5000000- 20000000ns	    $0.05-$0.10

¿Cuántos ciclos de clock implica leer un dato de caché (SRAM) y de memoria principal (DRAM)?

---------------------------------------------------------------------------------------------------------------------------------------------------------------


Necesitamos calcular cuántos ciclos de clock se requieren para acceder a las memorias SRAM (caché) y DRAM (memoria principal).

Primero, calculamos el tiempo de cada ciclo de clock del procesador:

### Procesador a 1.7 GHz:
1. La frecuencia es de 1.7 GHz, es decir, 1.7 x 10⁹ ciclos por segundo.
2. El periodo (o tiempo de un ciclo de clock) es el inverso de la frecuencia:

tiempo de ciclo = 1 /(1.7 x 10⁹) = 0.588 ns

### Para la memoria SRAM (caché):
- El tiempo de acceso está entre 0.5 ns y 2.5 ns.
- Para obtener los ciclos de clock, dividimos el tiempo de acceso por el tiempo de un ciclo de clock:

  - Para 0.5 ns:

		0.5 ns/ 0.588ns = 0.85 ciclos de reloj

  - Para 2.5 ns:
  
		2.5 ns/ 0.588ns = 4.25 ciclos de reloj
  
  Entonces, el acceso a la SRAM tarda entre **1 y 5 ciclos de clock** aproximadamente.

### Para la memoria DRAM (memoria principal):
- El tiempo de acceso está entre 50 ns y 70 ns.
- Calculamos los ciclos de clock:
  - Para 50 ns:
    
    50ns/ 0.588ns = 85 ciclos de reloj
    
  - Para 70 ns:
    
    70ns/ 0.588ns = 119 ciclos de reloj
  
  Entonces, el acceso a la DRAM tarda entre **85 y 119 ciclos de clock**.

### Resumen:
- **Caché (SRAM):** entre **1 y 4 ciclos de clock**.
- **Memoria principal (DRAM):** entre **85 y 119 ciclos de clock**.

