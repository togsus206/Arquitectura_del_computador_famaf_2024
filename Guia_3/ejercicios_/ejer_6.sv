/*

exc_vector: MRS X9, S2_0_C2_C0_0
	    CMP x9, 0x01
	    B.NE end
	    MRS x10, S2_0_C2_C0_0
	    MOVZ x9, #0x8B1F, LSL #16
	    MOVK x9, #0x03FFF, LSL #0
	    STURW W9, [X10, #0]
end: ERET

*/

/*

Ante la ocurrencia de una excepción por OpCode invalido, este código...


a. ... iempre retorna a la dirección de memoria de la instrucción que generó la
excepción + 4.

ya que si no es una interrupcion externa, siempre saltara a ERET
*/

/*

“Si suponemos que la instrucción de la línea 3> está corrompida en memoria de
forma permanente (generando un OpCode invalido), considerando la
implementación particular de nuestro procesador, el mismo...”

    a. … genera un comportamiento impredecible: Esta opción es la más probable y correcta. Si se produce una nueva excepción mientras el procesador ya está manejando una excepción (en este caso, la excepción inicial que llevó a la ejecución de este código), el comportamiento del sistema será impredecible. Esto se debe a que el procesador no está diseñado para manejar múltiples excepciones anidadas de esta manera, y puede entrar en un estado indefinido.
    
    b. … queda atrapado en el bucle infinito: Esta opción no es correcta, ya que el código no contiene un bucle infinito definido.
    
    c. … no realiza ninguna acción porque ya está en el vector de excepciones y retorna normalmente: Esta opción tampoco es correcta, ya que la ocurrencia de una nueva excepción mientras se está manejando otra interrumpirá el flujo normal de ejecución y puede llevar a un comportamiento indefinido.
    
    d. Ninguna de los anteriores es correcta: Ya hemos determinado que la opción a) es la más correcta.

Conclusión:

La respuesta correcta a la pregunta es la opción a). Si la instrucción CMP x9, 0x01 está corrompida, se generará un comportamiento impredecible debido a la ocurrencia de una nueva excepción mientras se está manejando la excepción inicial.

Razones por las que el comportamiento es impredecible:

    Anidamiento de excepciones: El procesador no está diseñado para manejar múltiples excepciones anidadas de esta manera.
    Estado indefinido: La ocurrencia de una nueva excepción puede llevar al procesador a un estado indefinido, donde el comportamiento es impredecible y puede variar según la implementación específica del procesador.
    Pérdida de contexto: La nueva excepción puede causar la pérdida de información importante sobre el estado del procesador, lo que dificulta la recuperación del sistema.

*/

/*
“Ante la ocurrencia de una excepción por interrupción externa, este código... ”

d. Ninguna es correcta

Si hay una interrupcion externa cambia la direccion del ELR que contenia la instruccion que habia provocado la excepcion



*/


/*





*/

