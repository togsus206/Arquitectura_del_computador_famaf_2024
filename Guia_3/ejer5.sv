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
infinito…Solo si se trata de una interrupcion externa

*/

/*


“Si suponemos que la instrucción de la línea 2> está corrompida en memoria de
forma permanente (generando un OpCode invalido), considerando la
implementación particular de nuestro procesador, el mismo...”: 

a. No realiza ninguna acción porque ya está en el vector de excepciones y retorna normalmente.

/*


/*

 “Este código retorna a la dirección de memoria donde se encuentra …”:
 
 
b. … la siguiente instrucción que debía ejecutarse de no haberse producido la excepción por OpCode invalido.s

*/

