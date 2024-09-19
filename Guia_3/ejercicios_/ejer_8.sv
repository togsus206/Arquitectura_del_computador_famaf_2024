/*

Considere que la siguiente sección de código está presente en el vector de excepciones de
un microprocesador LEGv8 (ISA completa), con el mismo tratamiento de excepciones
utilizado hasta el momento.
- En el caso de una excepción por Interrupción externa (IRQ), este código deberá
ejecutar la ISR alojada en la dirección con etiqueta “isr_proc”. Una vez que se
retorne de la ISR, se debe retomar el flujo original del programa previo a la
ocurrencia de la interrupción.
- En caso de un OpCode invalido se debe reemplazar el contenido de la memoria
que contiene la instrucción corrompida con el valor 0x8B1F03FF. Luego se debe
forzar la ejecución de este nuevo OpCode.
- Cualquier otra fuente de excepción el procesador debe quedar atrapado en un lazo
infinito dentro del vector de excepciones.



exc_vector: 	mrs x9, ____________
				subis xzr, x9, ____
				b.ne jmp1
question1: 		____ isr_proc
				eret
jmp1: 			subis xzr, ____, 0x02
				b.ne exc_trap
				movz x9, _______, lsl #16
				movk x9, #0x03FF, lsl #0
				mrs ___, s2_0_c1_c0_0
				sturw ___,[x10, #0]
				____ x10
exc_trap: 		b exc_trap





/***********************Punto 1*********************************




exc_vector: 	mrs x9, S2_0_C2_C0_0
				subis xzr, x9, #0x01
                b.ne jmp1
question1:  	b isr_proc
                eret
jmp1: 			subis xzr, x9, 0x02
                b.ne exc_trap
	        	movz x9, #0x8B1F03FF, lsl #16
				movk x9, #0x03FF, lsl #0
	        	mrs x10, s2_0_c1_c0_0
				sturw w9,[x10, #0]
				br x10
exc_trap: 		b exc_trap




1 - mrs x9, s3_0_c12_c12_5:

 El registro ESR_EL1 (Syndrome Register) guarda la razón de la excepción. En este caso, leemos ese valor en x9 para determinar qué causó la excepción.


2 - subis xzr, x9, #0x01:

Comparamos si el valor en x9 es igual a 0x01, que corresponde a una interrupción externa (IRQ). Si no es igual, se salta a jmp1.

3 - b isr_proc:

Si es una IRQ, saltamos a la rutina isr_proc.

4 - subis xzr, x9, 0x02:

Si no fue una IRQ, ahora comprobamos si es un OpCode inválido (valor 0x02 en x9).

5 - Reemplazar el OpCode inválido:

Si es un OpCode inválido, movemos el nuevo OpCode 0x8B1F03FF a x9 y luego lo almacenamos en la dirección original de la instrucción que causó la excepción.

6 - br x10:

Forzamos la ejecución del nuevo OpCode escribiendo su dirección en x10.

7 - exc_trap:

Para cualquier otro caso de excepción, el código se queda atrapado en un bucle infinito.


/***********************Punto 2*********************************



/***********************Punto A*********************************

2. Seleccionar todas las respuestas correctas de las siguientes afirmaciones:
a. Si suponemos que la posición de la etiqueta “question1” está corrompida en
memoria de forma permanente (generando un OpCode invalido),
considerando la implementación particular de nuestro procesador:


i. Ante una excepción por IRQ queda atrapado en un bucle infinito. Falso. El enunciado indica que ante una excepción por IRQ debe ejecutar la ISR alojada en la dirección con etiqueta "isr_proc".

ii. Ante una excepción por OpCode Inválido queda atrapado en un bucle infinito. Falso. El enunciado indica que en caso de un OpCode inválido se reemplaza y se fuerza la ejecución de un nuevo OpCode.

iii. Se genera un comportamiento impredecible ante cualquier excepción, porque este caso no está contemplado en la lógica de excepciones. Falso. El comportamiento ante cada tipo de excepción está definido en el enunciado.

iv. No se realiza ninguna acción porque ya está en el vector de excepciones y retorna normalmente. Falso. Para excepciones por IRQ, se debe ejecutar la ISR "isr_proc".

v. En cualquier caso se reemplaza el OpCode Inválido y se retorna al flujo original del programa, previo a la ocurrencia de la primera interrupción. Falso. En caso de un OpCode inválido, se reemplaza pero no se especifica que se debe retornar al flujo original.

vi. Ninguna es correcta, ya que la lógica dependerá del tipo de excepción. Verdadero. El enunciado especifica claramente el comportamiento para cada tipo de excepción.



RESPUESTA: 

vi. Ninguna es correcta, ya que la lógica dependerá del tipo de excepción. Verdadero.
El enunciado especifica claramente el comportamiento para cada tipo de excepción. La lógica depende del tipo de excepción, ya sea por IRQ, OpCode inválido u otro tipo, y el comportamiento para cada uno está claramente definido en el enunciado.

Las demás afirmaciones son incorrectas porque no reflejan adecuadamente el comportamiento descrito para los distintos tipos de excepciones.



/***********************Punto B*********************************

b. Ante la ocurrencia de una excepción por OpCode invalido, este código...



i. No es posible para el procesador determinar la dirección de retorno para este contexto. 

ii. Siempre queda atrapado en el lazo "exc_trap". 

iii. Siempre retorna a la dirección de memoria de la instrucción que generó la excepción 

iv. Siempre retorna a la dirección de memoria de la instrucción que generó la excepción.

v. Ninguna es correcta


En este caso, la respuesta más adecuada sería **v. Ninguna es correcta**. Vamos a analizar las otras opciones:

1. **i. No es posible para el procesador determinar la dirección de retorno para este contexto.**  
   Esto es incorrecto. El procesador puede determinar la dirección de la instrucción que generó la excepción mediante el registro **ELR_EL1**, que almacena la dirección de retorno en caso de excepción.

2. **ii. Siempre queda atrapado en el lazo "exc_trap".**  
   Esto tampoco es correcto. El código especifica que, en caso de un **OpCode inválido**, se reemplaza el OpCode corrompido y se fuerza la ejecución del nuevo OpCode, no se queda atrapado en el lazo **exc_trap** a menos que no se trate de un **OpCode inválido**.

3. **iii. Siempre retorna a la dirección de memoria de la instrucción que generó la excepción + 4.**  
   Incorrecto. No se especifica que siempre se retorne a la dirección de la instrucción +4. En este caso, se reescribe el OpCode y se ejecuta el nuevo código en lugar de continuar con la siguiente instrucción.

4. **iv. Siempre retorna a la dirección de memoria de la instrucción que generó la excepción.**  
   Esto no es correcto tampoco. El código no retorna a la misma dirección en todos los casos, ya que en caso de **OpCode inválido**, se reemplaza el código y se fuerza su ejecución en lugar de volver a la instrucción original.

Por lo tanto, la opción **v. Ninguna es correcta** es la más precisa.

*/






