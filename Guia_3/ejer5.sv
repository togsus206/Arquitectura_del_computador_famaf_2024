/*
exc_vector: MRS x9, S2_0_C2_C0_0
	    CMP X9, 0x01
	    B.EQ trap
	    MRS X9, S2_0_C0_C0_0
	    BR X9
trap:	    B trap

*/

/*
Ante la ocurrencia de una excepción, el código queda atrapado en un lazo
infinito…d. Ninguna de las anteriores es correcta.

*/

/*


“Si suponemos que la instrucción de la línea 2> está corrompida en memoria de
forma permanente (generando un OpCode invalido), considerando la
implementación particular de nuestro procesador, el mismo...”: 

a. No realiza ninguna acción porque ya está en el vector de excepciones y retorna normalmente.

/*


/*

 “Este código retorna a la dirección de memoria donde se encuentra …”:
 
 
c. La instrucción que estaba en ejecución al generarse una excepción por interrupción externa.

*/

