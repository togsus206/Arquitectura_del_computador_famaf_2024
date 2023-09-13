/*
1> always_ff @ (posedge clk)
2> begin
3> 	z0 = y0; y0 = x0;
4> 	y1= x1; z1 = y1;
5> 	z2<= y2; y2 <= x2;
6> 	y3<= x3; z3 <= y3;
7> end
*/

//a) La línea 3 implementa un registro paralelo.

/*
 Verdadera. 
En esta línea, z0 se actualiza con el valor actual de y0, 
y y0 se actualiza con el valor actual de x0. Ambas asignaciones 
se realizan al mismo tiempo en el flanco de subida del reloj 
(posedge clk) en un bloque always_ff con el operador =, 
lo que representa un registro paralelo.
*/

//b) La línea 5 implementa un registro paralelo.

/*
 Falsa. En esta línea, z2 se actualiza con el valor actual de y2, 
 y y2 se actualiza con el valor actual de x2. 
 Ambas asignaciones se realizan al mismo tiempo en el flanco de 
 subida del reloj (posedge clk) en un bloque always_ff 
 con el operador =, lo que representa un registro paralelo, 
 no un registro de desplazamiento.
*/

//c) La línea 6 implementa un registro de desplazamiento (shift register).

/*
 Verdadera. En esta línea, y3 se carga con el valor actual de x3,
 y z3 se actualiza con el valor actual de y3.
 La asignación z3 <= y3 se realiza después de que y3 se actualiza 
 con x3, lo que representa un registro de desplazamiento en serie 
 donde los datos se mueven de un registro a otro en el flanco 
 de subida del reloj.
*/

//d) La línea 4 implementa un registro de desplazamiento (shift register).

/*
**falsa**. 
La línea 4 implementa un registro paralelo, 
no un registro de desplazamiento. En esta línea, `y1` se actualiza 
con el valor actual de `x1`, y `z1` se actualiza con el valor 
actual de `y1`. Ambas asignaciones se realizan al mismo tiempo 
en el flanco de subida del reloj (posedge clk) en un bloque 
`always_ff` con el operador `=`, lo que representa un registro 
paralelo. Un registro de desplazamiento implica que los datos 
se muevan de forma secuencial de un registro a otro, 
lo cual no ocurre en esta línea.
*/