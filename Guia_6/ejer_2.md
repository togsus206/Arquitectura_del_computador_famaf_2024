 - Asuma N = 20 (20 etapas de pipeline), W = 5 (5 instrucciones leídas por fetch)
 - Asuma: bloques de 5 instrucciones donde la última es un salto
 - El procesador se da cuenta que el salto tomado fue incorrecto en la última etapa (penalidad de 20 ciclos)
¿Cuántos ciclos de reloj toma hacer fetch de todas las instrucciones de un código de 500 instrucciones?
Considerando predictores con las siguientes precisiones: 100%, 99%, 90%, 60%.


---------------------------------------------------------------------------------------------------------------

- Precisión del 100%:
100 ciclos. No se hace ningún fetch incorrecto.

- Precisión del 99%:
 100 (camino de ejecución correcto) + 20 (penalidad) = 120 ciclos
 20% instrucciones extras levantadas.

- Precisión del 90%:
 100 (camino de ejecución correcto) + 20 * 10 (penalidad) = 300 ciclos
 200% instrucciones extras levantadas.

- Precisión del 60%:
 100 (camino de ejecución correcto) + 20 * 40 (penalidad) = 900 ciclos
 800% instrucciones extras levantadas.
