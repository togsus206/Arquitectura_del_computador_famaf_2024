/*
2-A) Con la menor cantidad de registros e instrucciones, inicializar con el valor de su
índice las primeras N posiciones de memoria (comenzando en la dirección “0”). 

// Inicializar las primeras N posiciones de memoria con el valor de su índice
// Comenzando desde la dirección 0.


// Comienza el bucle de inicialización
loop_start:
    stur x1, [x0, #0]   // Almacena el valor de X1 en la memoria en la dirección X0
    add x1, x1, x2      // Incrementa X1 por el tamaño de elemento
    add x0, x0, x2      // Incrementa X0 por el tamaño de elemento en bytes
    cbz x1, loop_end    // Si X1 es cero, salta al final del bucle

    // Continúa el bucle
    b loop_start

// Fin del bucle
loop_end:





//2-B) Realizar la sumatoria de las primeras N posiciones de memoria y guardar el
//resultado en la posición N+1.



 Comienza el bucle de sumatoria
LOOP_START:
    LDUR X5, [X0, #0]   // Carga el valor de memoria en X5
    ADD X4, X4, X5      // Suma el valor al acumulador
    ADD X1, X1, X2      // Incrementa X1 por el tamaño de elemento
    ADDI X0, X0, #8     // Incrementa X0 por el tamaño de elemento en bytes
    CBZ X5, LOOP_END    // Si el valor cargado es cero, salta al final del bucle

    // Continúa el bucle
    B LOOP_START

// Fin del bucle
LOOP_END:
    STUR X4, [X3, #0]   // Almacena el resultado en la dirección X3





// 2-C) Realizar la multiplicación de dos registros: X16 y X17 y guardar el resultado en la
// posición “0” de la memoria.


ADD X5,X30, X30
ADD X5, X5, X4
SUB X2, X2, X2
loop:
    STUR X2, [X0, #0]
    ADD X0,X0,X8
    SUB X5,X5, X1
    ADD X2, X2, X1
    CBZ X5, exitloop
    CBZ XZR, loop
exitloop: