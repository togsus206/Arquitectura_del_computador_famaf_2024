	.text
	.org 0x0000
	

//	add x1,x0,x1
//infLoop:  
//	cbz XZR, infLoop

// 2-A
/*

	ADD x2,xzr,xzr
	STUR x30, [x0, #240]	
startloop:
	STUR x2,[x0,#0]
	ADD x0,x0,x8
	ADD x2,x2,x1
	sUB x3,x2,x30
	CBZ x3, end
	CBZ XZR,startloop
end:	
	CBZ XZR, end

*/

//2-B

/*
	ADD x2,xzr,xzr
	STUR x30, [x0, #240]	
startloop:
	STUR x2,[x0,#0]
	ADD x0,x0,x8
	ADD x2,x2,x1
	sUB x3,x2,x30
	CBZ x3, loop2
	CBZ XZR,startloop
loop2:
	ADD x2,xzr,xzr
	ADD x3,xzr,xzr
	ADD x0,xzr,xzr
	ADD x29,xzr,x30
loopsuma:
        LDUR x2,[x0, #0]
        ADD x3,x3,x2
        ADD x0,x0,x8
        SUB x29,x29,x1
        CBZ x29,loopend
        CBZ xzr,loopsuma
loopend:
	STUR x3,[x0, #0]
loopend2:
	CBZ xzr,loopend2
*/


// 2-C


	ADD x2,xzr,xzr
	ADD x0,xzr,xzr
	ADD x29,xzr,x16
multloop:
        ADD x2,x2,x17
        SUB x29,x29,x1
        CBZ x29,endloop
        CBZ xzr,multloop
endloop:
	STUR x2,[x0,#0]
infloop:
	CBZ xzr,infloop
