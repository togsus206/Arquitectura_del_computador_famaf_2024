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
 Falsa. se hace un asignamiento bloqueante al usar "="

*/

//b) La línea 5 implementa un registro paralelo.

/*
verdadera. Descripción:Las asignaciones son simples y no hay desplazamiento. El valor de y1 es actualizado con x1, y z1 toma el valor de y1.
Registro en paralelo ya que se usa "<=" que no es bloqueante

*/

//c) La línea 6 implementa un registro de desplazamiento (shift register).

/*
Falso. 
*/

//d) La línea 4 implementa un registro de desplazamiento (shift register).

/*
**falsa**. 
*/
