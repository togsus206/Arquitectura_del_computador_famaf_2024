/*
Analizar el comportamiento del procesador con manejo de excepciones implementado y
responder con V (verdadero) o F (falso) a las siguientes afirmaciones. En caso de ser falsa,
elaborar la respuesta correcta:



a) La ocurrencia de una excepción en un procesador causa que la ejecución secuencial
del código se vea interrumpida necesariamente.

F (falso)

Explicación: La ocurrencia de una excepción en un procesador no necesariamente interrumpe la ejecución secuencial del código de forma inmediata. La forma en que se maneja la excepción depende de la arquitectura y el diseño específico del procesador, pudiendo involucrar saltos a rutinas de manejo de excepciones (ISR) o incluso continuar con la ejecución en ciertos casos según la lógica de manejo de excepciones implementada. Por lo tanto, no siempre se interrumpe necesariamente la ejecución secuencial del código en curso al ocurrir una excepción.

///////////////////////// 
 
b) La diferencia entre un evento de interrupción y de excepción es que la primera es
causada por un recurso del procesador, mientras que la segunda se trata de un
evento proveniente de un controlador de E/S externo.

Falso.Es al reves, ademas Tanto interrupciones como excepciones pueden ser internas o externas.

//////////////////////////////////////////////

c) Los registros de excepción son utilizados típicamente en la ISR o ESR (Interrupt
/Exception Service Routine) para poder procesar debidamente el evento ocurrido.


V (Verdadero). Los registros de excepción contienen información vital 
sobre la excepción para que la ISR pueda manejarla adecuadamente.

///////////////////////////////////////////////////////


d) La dirección donde se aloja la ISR (vector de interrupciones) es fija sólo si el sistema
posee solo un módulo de E/S que genera interrupción.


falsa porque depende del manejo de excepciones que tenga el micro

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



V (verdadero)

Cuando una fuente de interrupción externa es "enmascarable", significa que el procesador tiene la capacidad de deshabilitar temporalmente la interrupción proveniente de esa fuente. Si hay otras interrupciones con mayor prioridad pendientes, el procesador puede retrasar la ejecución de la interrupción enmascarable hasta que maneje las interrupciones de mayor prioridad. Esto permite al procesador priorizar y gestionar de manera adecuada las interrupciones según su importancia y relevancia en un sistema.



//////////////////////////////////////////////////////////////////////

h) La instrucción ERET (Exception Return) retorna a la posición del PC (Program
Counter) al momento de la excepción más cuatro (PC excepción + 4).

V (Verdadero). La instrucción ERET (Exception Return) retorna 
el Program Counter (PC) al valor que tenía al momento de 
la excepción más cuatro, permitiendo regresar a la secuencia 
de instrucciones interrumpida. Excepto que sea una salto, si es asi, debe volver al
lugar del salto


*/
