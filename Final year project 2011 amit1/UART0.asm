.file "L:\Final year project 2011 amit\UART0.c"

	.global InitUart0

	.text

	.p2align 2

	.text
InitUart0:
	mov	R12, sp
	stmfd	sp!, {R4, R5, R11, R12, lr}
	mov R11,R13

@line 9,0	{


@line 10,0		PINSEL0 = 0x00000005 ;

	ldr	R4, LIT.InitUart00+0
	mov	R5, #5

	str	R5, [R4]

@line 14,0		U0LCR=0x83;	

	ldr	R4, LIT.InitUart00+4
	mov	R5, #131

	str	R5, [R4]

@line 17,0		VPBDIV=0x01;	

	ldr	R4, LIT.InitUart00+8
	mov	R5, #1

	str	R5, [R4]

@line 19,0		U0DLL=DIVISOR&0xFF;	

	ldr	R4, LIT.InitUart00+12
	mov	R5, #39

	str	R5, [R4]

@line 21,0		U0DLM=DIVISOR>>8;	

	ldr	R4, LIT.InitUart00+16
	mov	R5, #0

	str	R5, [R4]

@line 24,0		U0LCR=0x03 ;	

	ldr	R4, LIT.InitUart00+4
	mov	R5, #3

	str	R5, [R4]

@line 27,0		U0FCR=0x05 ;

	ldr	R4, LIT.InitUart00+20
	mov	R5, #5

	str	R5, [R4]

@line 28,0	}

L.1:
	ldmfd	R11, {R4, R5, R11, sp, pc}

	.p2align 2
LIT.InitUart00:
	.word 0xE002C000
	.word 0xE000C00C
	.word 0xE01FC100
	.word 0xE000C000
	.word 0xE000C004
	.word 0xE000C008



	.global putchar
	@------------- parameters -----------------
	@ch -- R0

	.p2align 2

	.text
putchar:
	mov	R12, sp
	stmfd	sp!, {R4, R5, R11, R12, lr}
	mov R11,R13

@line 30,0	{


@line 31,5		if (ch=='\n')

	mov	R4,R0,lsl #8*(4-1)
	mov	R4,R4,asr #8*(4-1)
	mov	R5, #10

	cmp	R4,R5
	bne	L.9

@line 32,1		{

L.5:

@line 34,54			while (!(U0LSR&0x20)) {}


@line 34,55	
L.6:

@line 34,9	
	ldr	R4, LIT.putchar0+0
	ldr	R4,[R4]
	mov	R5, #32

	and R4, R4, R5
	mov	R5, #0

	cmp	R4,R5
	beq	L.5

@line 37,0			U0THR='\r';

	ldr	R4, LIT.putchar0+4
	mov	R5, #13

	str	R5, [R4]

@line 38,1		}

L.8:

@line 41,53		while (!(U0LSR&0x20)) {}


@line 41,54	
L.9:

@line 41,8	
	ldr	R4, LIT.putchar0+0
	ldr	R4,[R4]
	mov	R5, #32

	and R4, R4, R5
	mov	R5, #0

	cmp	R4,R5
	beq	L.8

@line 43,0		U0THR=ch;

	ldr	R4, LIT.putchar0+4
	mov	R5,R0,lsl #8*(4-1)
	mov	R5,R5,asr #8*(4-1)
	str	R5, [R4]

@line 45,8		return ch;

	mov	R0,R0,lsl #8*(4-1)
	mov	R0,R0,asr #8*(4-1)
L.2:
	ldmfd	R11, {R4, R5, R11, sp, pc}

	.p2align 2
LIT.putchar0:
	.word 0xE000C014
	.word 0xE000C000



	.global getchar
	@------------- locals ---------------------
	@ch -- R11 - (1)

	.p2align 2

	.text
getchar:
	mov	R12, sp
	stmfd	sp!, {R4, R5, R11, R12, lr}
	mov R11,R13
	sub	sp, sp, #1 * 4

@line 49,0	{

L.12:

@line 53,53		while (!(U0LSR&0x01)) {}


@line 53,54	
L.13:

@line 53,8	
	ldr	R4, LIT.getchar0+0
	ldr	R4,[R4]
	mov	R5, #1

	and R4, R4, R5
	mov	R5, #0

	cmp	R4,R5
	beq	L.12

@line 56,1		ch=U0RBR;

	ldr	R4, LIT.getchar0+4
	ldr	R4,[R4]
	strb	R4, [R11, #-1]

@line 57,8		return ch;

	ldrsb	R0,[R11, #-1]
L.11:
	ldmfd	R11, {R4, R5, R11, sp, pc}

	.p2align 2
LIT.getchar0:
	.word 0xE000C014
	.word 0xE000C000


