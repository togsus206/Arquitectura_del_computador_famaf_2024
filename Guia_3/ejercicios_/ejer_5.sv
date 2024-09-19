/*
exc_vector: MRS x9, S2_0_C2_C0_0
	    CMP X9, 0x01
	    B.EQ trap
	    MRS X9, S2_0_C0_C0_0
	    BR X9
trap:	    B trap

*/

/* 01
Ante la ocurrencia de una excepción, el código queda atrapado en un lazo
infinito…

b. … solo si se trata de una excepción de interrupcion externa

Por que compra el ESR con 0x01 que es el codigo de interrupcion externa, y si son iguales salta al bucle infinito



*/

/* 02


“Si suponemos que la instrucción de la línea 2> está corrompida en memoria de
forma permanente (generando un OpCode invalido), considerando la
implementación particular de nuestro procesador, el mismo...”: 



d. Ninguno de los anteriores es correcta.

Al ser un opcode invalido, no entrara en el bucle y saldra con el branch hecho a x9
.
/*


/* 03

 “Este código retorna a la dirección de memoria donde se encuentra …”:
 
 ***********************FALTA COMPLETAR**************************************************

*/

