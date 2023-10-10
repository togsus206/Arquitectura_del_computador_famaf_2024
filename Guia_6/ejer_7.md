Considere un procesador LEGv8 two-issue, donde en cada “issue packet” una de las instrucciones
puede ser una operación de la ALU o un salto y la otra puede ser un load o store, tal como se
muestra en la figura. El compilador asume toda la responsabilidad de eliminar los hazard, organizar el
código e insertar operaciones tipo “nop” para que el código se ejecute sin necesidad de detección de
hazard o generación de stalls.

Considere el siguiente bucle:

Loop: 	LDUR X0, [X20,#0] // X0=array element
	ADD X0,X0,X21 // add scalar in X21
	STUR X0, [X20,#0] // store result
	SUBI X20,X20,#8 // decrement pointer
	CMP X20,X22 // compare to loop limit
	B.GT Loop // branch if X20 > X22


a) Analice en el código las dependencias de datos y determine cuales generan data hazards en
nuestro procesador one-issue, sin forwarding-stall. En cada caso indique: el tipo de hazard,
el operando en conflicto y los números de las instrucciones involucradas. Suponga que los
saltos están perfectamente predichos, de modo que los control hazard son manejados por
hardware.

b) ¿Cómo se organizaría el siguiente código en un procesador two-issue con pipeline y
forwarding-stall para evitar la mayor cantidad posible de stalls?.

c) Suponga que el compilador es capaz de determinar que la cantidad de iteraciones del bucle
se da en múltiplos de 2. Utilice la técnica estática “loop unrolling” para re-ordenar la ejecución
del código. Determine mejora en el tiempo de ejecución respecto al punto (b). Se calcula
como: Tiempo de ejecución sin mejora/ Tiempo de ejecución con mejora


-----------------------------------------------------------------------------------------------------------

A)


Dependencias de datos:

● X0 - 1y2 - RAW
● X0 - 1y2 - WAW (nunca genera hazard en 1-issue)
● X0 - 2y3 - RAW
● X20 - 4y5 - RAW
● X20 - 4y1 - RAW (condicional)
● X20 - 4y3 - RAW (condicional)
● X20 - 4 y 4 en 2 iteraciones distintas - RAW (condicional)


-----------------------------------------------------------------------------------------------------------


B)

.....		ALU or branch instruction	Data transfer instruction 	clock cycle
Loop:							LDUR x0,[x20,#0]	1
		SUBI x20, x20, #8						2
		ADD x0, x0, x21							3
		CMP x20, x22							4
		BGT Loop				STUR x0, [x20, #8]	5
		
		
		
----------------------------------------------------------------------------------------------------------


C)

Loop unrolling:

1> Loop: LDUR X0, [X20,#0] // X0=array element
2> ADD X0,X0,X21 // add scalar in X21
3> STUR X0, [X20,#0] // store result
4> SUBI X20,X20,#8 // decrement pointer

1b> LDUR X0, [X20,#0] // X0=array element
2b> ADD X0,X0,X21 // add scalar in X21
3b> STUR X0, [X20,#0] // store result
4b> SUBI X20,X20,#8 // decrement pointer

5> CMP X20,X22 // compare to loop limit
6> B.GT Loop // branch if X20 > X22


Register renaming:

1> Loop: LDUR X1, [X20,#0] // X0=array element
2> ADD X1,X1,X21 // add scalar in X21
3> STUR X1, [X20,#0] // store result
4> SUBI X20,X20,#8 // decrement pointer

1b> LDUR X0, [X20,#0] // X0=array element
2b> ADD X0,X0,X21 // add scalar in X21
3b> STUR X0, [X20,#0] // store result
4b> SUBI X20,X20,#8 // decrement pointer

5> CMP X20,X22 // compare to loop limit
6> B.GT Loop // branch if X20 > X22



Eliminar instrucciones innecesarias:

1> Loop: LDUR X1, [X20,#0] // X0=array element
2> ADD X1,X1,X21 // add scalar in X21
3> STUR X1, [X20,#0] // store result
4> SUBI X20,X20,#8 // decrement pointer -------> ESTA SE ELIMINA!!!

1b> LDUR X0, [X20,#-8] // X0=array element
2b> ADD X0,X0,X21 // add scalar in X21
3b> STUR X0, [X20,#-8] // store result
4b> SUBI X20,X20,#16 // decrement pointer

5> CMP X20,X22 // compare to loop limit
6> B.GT Loop // branch if X20 > X22




Quedando Asi:

1> Loop: LDUR X1, [X20,#0] // X0=array element
2> 	 ADD X1,X1,X21 // add scalar in X21
3> 	 STUR X1, [X20,#0] // store result
4> 	 LDUR X0, [X20,#-8] // X0=array element
5> 	 ADD X0,X0,X21 // add scalar in X21
6> 	 STUR X0, [X20,#-8] // store result
7> 	 SUBI X20,X20,#16 // decrement pointer
8> 	 CMP X20,X22 // compare to loop limit
9> 	 B.GT Loop // branch if X20 > X22



....		ALU or branch instruction	Data transfer instruction
Loop:		NOP				LDUR x1, [x20, #8]
		NOP				LDUR x0, [x20, #-8]
		ADD x1, x1, x21			nop
		ADD X0, X0, X21			STUR X1, [X20, #0]
		SUBI X20, X20, #16		STUR X0, [X20, #-8]
		CMP X20, X22			NOP
		B.GT Loop			nop



.....		ALU or branch instruction	Data transfer instruction 	clock cycle
Loop:		SUBI x20, x20, #16			LDUR x1,[x20,#0]	1
		CMP x20, x22				LDUR x0,[x20,#8]	2
		ADD x1, x1, x21				NOP			3
		ADD x0, x0, x21				STUR x1, [x20, #16]	4
		BGT Loop				STUR x0, [x20, #8]	5




