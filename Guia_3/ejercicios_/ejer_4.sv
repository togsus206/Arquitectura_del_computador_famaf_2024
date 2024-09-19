/*
Analizar el comportamiento del procesador con manejo de excepciones implementado y
responder con V (verdadero) o F (falso) a las siguientes afirmaciones. En caso de ser falsa,
elaborar la respuesta correcta:



a) La ocurrencia de una excepción en un procesador causa que la ejecución secuencial
del código se vea interrumpida necesariamente.

Verdadero

Explicación: Una excepción interrumpe la ejecución secuencial de las instrucciones porque es un evento imprevisto que debe ser manejado inmediatamente. El procesador suspende el flujo normal y salta a una rutina de servicio de excepciones para resolver el problema antes de continuar.

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
 
b) La diferencia entre un evento de interrupción y de excepción es que la primera es
causada por un recurso del procesador, mientras que la segunda se trata de un
evento proveniente de un controlador de E/S externo.

Falso.

Explicacion: Es lo contrario: una interrupción normalmente es causada por un evento externo, como un controlador de E/S (teclado, mouse, etc.), mientras que una excepción ocurre debido a un error o condición dentro del procesador, como una instrucción no válida o un error de división por cero.

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

c) Los registros de excepción son utilizados típicamente en la ISR o ESR (Interrupt
/Exception Service Routine) para poder procesar debidamente el evento ocurrido.


V (Verdadero). 

Los registros de excepción, como el ESR_EL1 (Exception Syndrome Register) y el ELR_EL1 (Exception Link Register), son utilizados durante la ejecución de las rutinas de servicio de interrupción (ISR) o de excepción (ESR) para proporcionar información sobre la excepción o interrupción que ocurrió.

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


d) La dirección donde se aloja la ISR (vector de interrupciones) es fija sólo si el sistema
posee solo un módulo de E/S que genera interrupción.


Falso


Explicacion: En la mayoría de los sistemas modernos, la dirección del vector de interrupción no es fija y puede estar en un conjunto de direcciones predefinidas para múltiples fuentes de interrupción. Incluso con múltiples dispositivos de E/S, el vector de interrupciones es una tabla que permite manejar múltiples eventos desde diferentes direcciones.


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

e) El registro ESR (Exception Syndrome Register) contiene una referencia a la
dirección de memoria de la instrucción en ejecución al momento de la ocurrencia de
la excepción.



F (Falso). 

El registro ESR (Exception Syndrome Register) suele 
contener información sobre la causa y el tipo de excepción que 
ocurrió, pero no necesariamente la dirección de memoria de la 
instrucción en ejecución en el momento de la excepción

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////7

f) Si un procesador no reconoce una instrucción se genera un evento de excepción.

V (Verdadero). 

Cuando un procesador encuentra una instrucción que no 
puede reconocer o interpretar  puede generar un evento de excepción,
 específicamente una excepción de tipo "Instrucción ilegal" o similar. 



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

g) Que una fuente de interrupción externa sea “enmascarable” significa que el
procesador puede retrasar su ejecución si tiene eventos de mayor prioridad
pendientes.



V (verdadero)

Una interrupción enmascarable es aquella que puede ser desactivada o ignorada temporalmente por el procesador, permitiendo que el procesador maneje otras tareas más importantes o interrupciones de mayor prioridad antes de atender la interrupción enmascarable.



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

h) La instrucción ERET (Exception Return) retorna a la posición del PC (Program
Counter) al momento de la excepción más cuatro (PC excepción + 4).

F (Falso). 

Explicacion: 
La instrucción ERET (Exception Return) devuelve la ejecución a la dirección almacenada en un registro específico, que generalmente es el ELR (Exception Link Register). Este registro almacena la dirección exacta donde ocurrió la excepción, no necesariamente PC + 4. Retorna exactamente a la instrucción interrumpida, salvo que se haya modificado explícitamente.


*/
