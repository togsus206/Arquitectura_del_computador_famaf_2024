	.text
	.org 0x0000
	
//	add x1,x0,x1
//infLoop:  
//	cbz XZR, infLoop

ADD X5,X30, X30
ADD X5, X5, X4
SUB X2, X2, X2
loop:
    STUR X2, [X0, #0]
    ADD X0,X0,X8
    SUB X5,X5, X1
    ADD X2, X2, X1
    CBZ X5, exitloop
    CBZ XZR, loop
exitloop:

