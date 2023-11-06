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


---------------------------------------------------------------------------------


MOVZ X15, #0, #16 // Colocar el valor 0 en el registro X15.
MOVZ X16, #10, #8 // Colocar el valor 10 en el registro X16.
MOVZ X17, #0x12345678, #0 // Colocar el valor hexadecimal 0x12345678 en el registro X17.
MOVZ X18, #-100, #32 // Colocar el valor -100 en el registro X18
STUR X1, [X0, #0] // MEM 0:0x1
STUR X2, [X0, #8] // MEM 1:0x2
STUR X3, [X16, #0] // MEM 2:0x3
ADD X3, X4, X5
STUR X3, [X0, #24] // MEM 3:0x9
SUB X3, X4, X5
STUR X3, [X0, #32] // MEM 4:0xFFFFFFFFFFFFFFFF
SUB X4, XZR, X10
STUR X4, [X0, #40] // MEM 5:0xFFFFFFFFFFFFFFF6
ADD X4, X3, X4
STUR X4, [X0, #48] // MEM 6:0xFFFFFFFFFFFFFFF5
SUB X5, X1, X3
STUR X5, [X0, #56] // MEM 7:0x2
AND X5, X10, XZR
STUR X5, [X0, #64] // MEM 8:0x0
AND X5, X10, X3
STUR X5, [X0, #72] // MEM 9:0xA
AND X20, X20, X20
STUR X20, [X0, #80] // MEM 10:0x14
ORR X6, X11, XZR
STUR X6, [X0, #88] // MEM 11:0xB
ORR X6, X11, X3
STUR X6, [X0, #96] // MEM 12:0xFFFFFFFFFFFFFFFF
LDUR X12, [X0, #0]
ADD X7, X12, XZR
STUR X7, [X0, #104] // MEM 13:0x1
STUR X12, [X0, #112] // MEM 14:0x1
ADD XZR, X13, X14
STUR XZR, [X0, #120] // MEM 15:0x0
CBZ X0, L1
STUR X21, [X0, #128] // MEM 16:0x0(si falla CBZ =21)
L1: STUR X21, [X0, #136] // MEM 17:0x15
ADD X2, XZR, X1
L2: SUB X2, X2, X1
ADD X24, XZR, X1
STUR X24, [X0, #144] // MEM 18:0x1 y MEM 19=0x1
ADD X0, X0, X8
CBZ X2, L2
STUR X30, [X0, #144] // MEM 20:0x1E
ADD X30, X30, X30
SUB X21, XZR, X21
ADD X30, X30, X20
LDUR X25, [X30, #-8]
ADD X30, X30, X30
ADD X30, X30, X16
STUR X25, [X30, #-8] // MEM 21:0xA (= MEM 9)
finloop: CBZ XZR, finloop
