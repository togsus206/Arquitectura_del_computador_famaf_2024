Sin afectar el funcionamiento de las instrucciones ya implementadas en la versión reducida
del microprocesador con pipeline, agregar la instrucción MOVZ. Introducir en el procesador
todas las modificaciones necesarias, tanto en el datapath como en las señales de control.
Las especificaciones para la implementación de esta instrucción pueden obtenerse de la
Reference Data LEGv8 (GreenCard LEGv8) del libro “Computer Organization and Design -
ARM Edition”, y se resumen a continuación:
● MOVZ: “Move wide with zero”. Instrucción de carga de valores inmediatos en un
registro. 16 bits del registro destino (Rd) toman el valor dado por MOV_immediate y
el resto de los bits toma valor ‘0’. La posición del valor inmediato se determina con
los 2 bits de LSL, según el siguiente criterio:


LSL | Bits que toman el valor inmediato

00  | 0 a 15

01  | 16 a 31

10  | 32 a 47

11  | 48 a 64


Sintaxis: MOVZ <Rd>, <MOV_immediate>, <LSL> Tipo: IW


31....23 	|22 21	| 20....5	   | 4...0
opcode 		|LSL	| MOV_immediate    | Rd
110100101	|LL	| xxxxxxxxxxxxxx   | RRRRR

