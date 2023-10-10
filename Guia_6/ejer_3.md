Este ejercicio analiza la precisión de varios predictores de saltos para el siguiente patrón repetitivo (ej, en
un loop) donde los saltos resultaron: Taken - Not Taken - Taken - Taken - Not Taken.

a) ¿Cuál es la precisión de los predictores always-taken y always-not taken para el patrón dado?

b) ¿Cuál es la precisión del predictor de 2-bits para los primeros 4 saltos de este patrón? Asumir que
el predictor arranca en Strongly not taken.

c) ¿Cuál es la precisión de este predictor de 2-bits si el patrón completo se repite infinitamente?

--------------------------------------------------------------------------------------------------------------------


A)

Patrón de saltos: Taken - Not Taken - Taken - Taken - Not Taken

Precisión del predictor always-taken = ⅗ = 60%

Precisión del predictor always-not taken = ⅖ = 40%


-------------------------------------------------------------------------------------------------------------------

B)

Patrón de salto: T   NT T  T  NT

Predicción:	 NT  NT NT NT T

Falla o Acierta: F   A  F  F  F


Precision del predictor: 1/5 = 20%



-------------------------------------------------------------------------------------------------------------------

C)


Patrón de salto: T   NT T  T  NT

LOOP_1		 F   A  F  F  F	

LOOP_2		 F   F  F  A  F	

LOOP_3		 A   F  A  A  F



Precision del predictor: 3/5 = 60%











