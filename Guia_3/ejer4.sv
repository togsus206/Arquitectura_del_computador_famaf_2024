/*
Analizar el comportamiento del procesador con manejo de excepciones implementado y
responder con V (verdadero) o F (falso) a las siguientes afirmaciones. En caso de ser falsa,
elaborar la respuesta correcta:



a) La ocurrencia de una excepción en un procesador causa que la ejecución secuencial
del código se vea interrumpida necesariamente.

V (verdadero) - La ocurrencia de una excepción en un procesador 
interrumpe la ejecución secuencial del código en curso para manejar
 la excepción correspondiente. El procesador realiza un salto a una
 rutina de manejo de excepciones, que se encarga de manejar 
 la situación excepcional. Una vez que se maneja la excepción, 
 la ejecución puede reanudarse desde el punto en el que se interrumpió 
 o seguir una lógica específica de manejo de excepciones.

///////////////////////// 
 
b) La diferencia entre un evento de interrupción y de excepción es que la primera es
causada por un recurso del procesador, mientras que la segunda se trata de un
evento proveniente de un controlador de E/S externo.

Falso. Tanto interrupciones como excepciones pueden ser internas o externas.

//////////////////////////////////////////////

c) Los registros de excepción son utilizados típicamente en la ISR o ESR (Interrupt
/Exception Service Routine) para poder procesar debidamente el evento ocurrido.


V (Verdadero). Los registros de excepción contienen información vital 
sobre la excepción para que la ISR pueda manejarla adecuadamente.

///////////////////////////////////////////////////////


d) La dirección donde se aloja la ISR (vector de interrupciones) es fija sólo si el sistema
posee solo un módulo de E/S que genera interrupción.


V (Verdadero). En sistemas con un único módulo de E/S generando 
interrupciones, la dirección de la ISR puede ser fija. 
Sin embargo, en sistemas más complejos con múltiples fuentes 
de interrupción, suele haber una tabla de vectores de interrupción 
para determinar las direcciones correctas de las ISRs.

////////////////////////////////////////////

e) El registro ESR (Exception Syndrome Register) contiene una referencia a la
dirección de memoria de la instrucción en ejecución al momento de la ocurrencia de
la excepción.



F (Falso). El registro ESR (Exception Syndrome Register) suele 
contener información sobre la causa y el tipo de excepción que 
ocurrió, pero no necesariamente la dirección de memoria de la 
instrucción en ejecución en el momento de la excepción

///////////////////////////////////////

f) Si un procesador no reconoce una instrucción se genera un evento de excepción.

V (Verdadero). Cuando un procesador encuentra una instrucción que no 
puede reconocer o interpretar  puede generar un evento de excepción,
 específicamente una excepción de tipo "Instrucción ilegal" o similar. 



////////////////////////////////////////////////

g) Que una fuente de interrupción externa sea “enmascarable” significa que el
procesador puede retrasar su ejecución si tiene eventos de mayor prioridad
pendientes.


F (Falso). Que una fuente de interrupción externa sea "enmascarable"
 significa que el procesador puede decidir si atender o no 
 la interrupción, posiblemente basándose en su prioridad. 
 Sin embargo, no implica que el procesador pueda retrasar 
 la ejecución de la interrupción si tiene eventos de mayor prioridad 
 pendientes. Al contrario, una interrupción enmascarable puede ser
 postergada o ignorada si hay eventos de mayor prioridad ocurriendo.



//////////////////////////////////////////////////////////////////////

h) La instrucción ERET (Exception Return) retorna a la posición del PC (Program
Counter) al momento de la excepción más cuatro (PC excepción + 4).

V (Verdadero). La instrucción ERET (Exception Return) retorna 
el Program Counter (PC) al valor que tenía al momento de 
la excepción más cuatro, permitiendo regresar a la secuencia 
de instrucciones interrumpida.


*/