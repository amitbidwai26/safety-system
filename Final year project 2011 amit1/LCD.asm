.file "D:\Final year project 2011 amit\LCD.c"

	.global SmallDelay

	.text

	.p2align 2

	.text
SmallDelay:

@line 3,0	{


@line 4,0	}

L.1:
	mov pc, lr

	.p2align 2


	.global LcdCmd1
	@------------- parameters -----------------
	@cmd -- R11 - (4)
	@------------- locals ---------------------
	@temp -- R11 - (8)

	.p2align 2

	.text
LcdCmd1:
	mov	R12, sp
	stmfd	sp!, {R0, R4, R5, R6, R11, R12, lr}
	add R11,R13,#4
	sub	sp, sp, #1 * 4
	ldr	R4,[R11, #-4]
	strb	R4, [R11, #-4]

@line 6,0	{


@line 8,0		IO0SET = temp = 0x0F0000 & (cmd << 16) ;

	ldrb	R4,[R11, #-4]
	mov	R5, #16

	mov R4, R4, lsl R5
	ldr	R5, LIT.LcdCmd10+0
	and R4, R4, R5
	str	R4, [R11, #-8]
	ldr	R5, LIT.LcdCmd10+4
	str	R4, [R5]

@line 9,0		IO0CLR = (temp ^ 0x0F0000) | 0x500000 ;

	ldr	R4, LIT.LcdCmd10+8
	ldr	R5,[R11, #-8]
	ldr	R6, LIT.LcdCmd10+12
	eor R5, R5, R6
	ldr	R6, LIT.LcdCmd10+16
	orr R5, R5, R6
	str	R5, [R4]

@line 10,1		SmallDelay() ;

	bl	SmallDelay

@line 12,0		IO0SET = 0x400000 ;

	ldr	R4, LIT.LcdCmd10+4
	ldr	R5, LIT.LcdCmd10+20
	str	R5, [R4]

@line 13,1		SmallDelay() ;

	bl	SmallDelay

@line 15,0		IO0CLR = 0x400000 ;

	ldr	R4, LIT.LcdCmd10+8
	ldr	R5, LIT.LcdCmd10+20
	str	R5, [R4]

@line 16,1		SmallDelay() ;

	bl	SmallDelay

@line 17,0	}

L.2:
	ldmfd	R11, {R4, R5, R6, R11, sp, pc}

	.p2align 2
LIT.LcdCmd10:
	.word 0xF0000
	.word 0xE0028004
	.word 0xE002800C
	.word 0xF0000
	.word 0x500000
	.word 0x400000



	.global LcdDat1
	@------------- parameters -----------------
	@dat -- R11 - (4)
	@------------- locals ---------------------
	@temp -- R11 - (8)

	.p2align 2

	.text
LcdDat1:
	mov	R12, sp
	stmfd	sp!, {R0, R4, R5, R6, R11, R12, lr}
	add R11,R13,#4
	sub	sp, sp, #1 * 4
	ldr	R4,[R11, #-4]
	strb	R4, [R11, #-4]

@line 19,0	{


@line 21,0		IO0SET = temp = (0x0F0000 & (dat << 16)) | 0x100000 ;

	ldrb	R4,[R11, #-4]
	mov	R5, #16

	mov R4, R4, lsl R5
	ldr	R5, LIT.LcdDat10+0
	and R4, R4, R5
	ldr	R5, LIT.LcdDat10+4
	orr R4, R4, R5
	str	R4, [R11, #-8]
	ldr	R5, LIT.LcdDat10+8
	str	R4, [R5]

@line 22,0		IO0CLR = (temp ^ 0x1F0000) | 0x400000 ;

	ldr	R4, LIT.LcdDat10+12
	ldr	R5,[R11, #-8]
	ldr	R6, LIT.LcdDat10+16
	eor R5, R5, R6
	ldr	R6, LIT.LcdDat10+20
	orr R5, R5, R6
	str	R5, [R4]

@line 23,1		SmallDelay() ;

	bl	SmallDelay

@line 25,0		IO0SET = 0x400000 ;

	ldr	R4, LIT.LcdDat10+8
	ldr	R5, LIT.LcdDat10+20
	str	R5, [R4]

@line 26,1		SmallDelay() ;

	bl	SmallDelay

@line 28,0		IO0CLR = 0x400000 ;

	ldr	R4, LIT.LcdDat10+12
	ldr	R5, LIT.LcdDat10+20
	str	R5, [R4]

@line 29,1		SmallDelay() ;

	bl	SmallDelay

@line 30,0	}

L.3:
	ldmfd	R11, {R4, R5, R6, R11, sp, pc}

	.p2align 2
LIT.LcdDat10:
	.word 0xF0000
	.word 0x100000
	.word 0xE0028004
	.word 0xE002800C
	.word 0x1F0000
	.word 0x400000



	.global Delay250
	@------------- locals ---------------------
	@k -- R11 - (4)

	.p2align 2

	.text
Delay250:
	mov	R12, sp
	stmfd	sp!, {R4, R5, R11, R12, lr}
	mov R11,R13
	sub	sp, sp, #1 * 4

@line 32,0	{


@line 34,5		for(k = 0 ; k < 100 ; k ++)

	mov	R4, #0

	str	R4, [R11, #-4]
L.5:

@line 35,1		{


@line 36,1		}

L.6:

@line 34,23	
	ldr	R4,[R11, #-4]
	add	R4, R4, #1
	str	R4, [R11, #-4]

@line 34,13	
	ldr	R4,[R11, #-4]
	mov	R5, #100

	cmp	R4,R5
	blt	L.5

@line 37,0	}

L.4:
	ldmfd	R11, {R4, R5, R11, sp, pc}

	.p2align 2


	.global DelayMs
	@------------- parameters -----------------
	@n -- R11 - (4)
	@------------- locals ---------------------
	@k -- R11 - (8)

	.p2align 2

	.text
DelayMs:
	mov	R12, sp
	stmfd	sp!, {R0, R4, R5, R11, R12, lr}
	add R11,R13,#4
	sub	sp, sp, #1 * 4

@line 39,0	{


@line 41,5		for(k = 0 ; k < n ; k ++)

	mov	R4, #0

	str	R4, [R11, #-8]
	b	L.13
L.10:

@line 42,1		{


@line 43,2			Delay250() ;

	bl	Delay250

@line 44,2			Delay250() ;

	bl	Delay250

@line 45,2			Delay250() ;

	bl	Delay250

@line 46,2			Delay250() ;

	bl	Delay250

@line 47,1		}

L.11:

@line 41,21	
	ldr	R4,[R11, #-8]
	add	R4, R4, #1
	str	R4, [R11, #-8]
L.13:

@line 41,13	
	ldr	R4,[R11, #-8]
	ldr	R5,[R11, #-4]
	cmp	R4,R5
	blt	L.10

@line 48,0	}

L.9:
	ldmfd	R11, {R4, R5, R11, sp, pc}

	.p2align 2


	.global LcdCmd
	@------------- parameters -----------------
	@cmd -- R11 - (4)

	.p2align 2

	.text
LcdCmd:
	mov	R12, sp
	stmfd	sp!, {R0, R4, R5, R11, R12, lr}
	add R11,R13,#4
	sub	sp, sp, #1 * 4
	ldr	R4,[R11, #-4]
	strb	R4, [R11, #-4]

@line 50,0	{


@line 51,1		LcdCmd1(cmd >> 4) ;

	ldrb	R4,[R11, #-4]
	mov	R5, #4

	mov R4, R4, asr R5
	and	R0,R4,#255
	bl	LcdCmd1

@line 52,1		LcdCmd1(cmd) ;

	ldrb	R0,[R11, #-4]
	bl	LcdCmd1

@line 53,1		Delay250() ;

	bl	Delay250

@line 54,0	}

L.14:
	ldmfd	R11, {R4, R5, R11, sp, pc}

	.p2align 2


	.global LcdDat
	@------------- parameters -----------------
	@dat -- R11 - (4)

	.p2align 2

	.text
LcdDat:
	mov	R12, sp
	stmfd	sp!, {R0, R4, R5, R11, R12, lr}
	add R11,R13,#4
	sub	sp, sp, #1 * 4
	ldr	R4,[R11, #-4]
	strb	R4, [R11, #-4]

@line 56,0	{


@line 57,1		LcdDat1(dat >> 4) ;

	ldrb	R4,[R11, #-4]
	mov	R5, #4

	mov R4, R4, asr R5
	and	R0,R4,#255
	bl	LcdDat1

@line 58,1		LcdDat1(dat) ;

	ldrb	R0,[R11, #-4]
	bl	LcdDat1

@line 59,1		Delay250() ;

	bl	Delay250

@line 60,0	}

L.15:
	ldmfd	R11, {R4, R5, R11, sp, pc}

	.p2align 2


	.global LcdInit

	.p2align 2

	.text
LcdInit:
	mov	R12, sp
	stmfd	sp!, {R4, R5, R11, R12, lr}
	mov R11,R13
	sub	sp, sp, #1 * 4

@line 62,0	{


@line 63,0		IO0DIR = 0x5F0000 ;

	ldr	R4, LIT.LcdInit0+0
	ldr	R5, LIT.LcdInit0+4
	str	R5, [R4]

@line 64,0		IO0CLR = 0x5F0000 ;

	ldr	R4, LIT.LcdInit0+8
	ldr	R5, LIT.LcdInit0+4
	str	R5, [R4]

@line 65,1		DelayMs(15) ;

	mov	R0, #15

	bl	DelayMs

@line 66,1		LcdCmd1(0x03) ;

	mov	R0, #3

	bl	LcdCmd1

@line 67,1		DelayMs(6) ;

	mov	R0, #6

	bl	DelayMs

@line 68,1		LcdCmd1(0x03) ;

	mov	R0, #3

	bl	LcdCmd1

@line 69,1		Delay250() ;

	bl	Delay250

@line 70,1		LcdCmd1(0x03) ;

	mov	R0, #3

	bl	LcdCmd1

@line 71,1		Delay250() ;

	bl	Delay250

@line 72,1		LcdCmd1(0x02) ;

	mov	R0, #2

	bl	LcdCmd1

@line 73,1		Delay250() ;

	bl	Delay250

@line 75,1		LcdCmd(0x28) ;

	mov	R0, #40

	bl	LcdCmd

@line 76,1		LcdCmd(0x08) ;

	mov	R0, #8

	bl	LcdCmd

@line 77,1		LcdCmd(0x0c) ;

	mov	R0, #12

	bl	LcdCmd

@line 78,1		LcdCmd(0x06) ;

	mov	R0, #6

	bl	LcdCmd

@line 79,0	}

L.16:
	ldmfd	R11, {R4, R5, R11, sp, pc}

	.p2align 2
LIT.LcdInit0:
	.word 0xE0028008
	.word 0x5F0000
	.word 0xE002800C



	.global DisplayRow
	@------------- parameters -----------------
	@str -- R11 - (4)
	@row -- R11 - (8)
	@------------- locals ---------------------
	@k -- R11 - (12)

	.p2align 2

	.text
DisplayRow:
	mov	R12, sp
	stmfd	sp!, {R0, R1, R4, R5, R11, R12, lr}
	add R11,R13,#8
	sub	sp, sp, #2 * 4

@line 81,0	{


@line 88,5		if (row == 1)

	ldr	R4,[R11, #-8]
	mov	R5, #1

	cmp	R4,R5
	bne	L.18

@line 89,2			LcdCmd(0x80) ;

	mov	R0, #128

	bl	LcdCmd
	b	L.19
L.18:

@line 91,2			LcdCmd(0xc0) ;

	mov	R0, #192

	bl	LcdCmd
L.19:

@line 92,5		for(k = 0 ; k < 16 ; k ++)

	mov	R4, #0

	str	R4, [R11, #-12]
L.20:

@line 93,1		{


@line 94,6			if (str[k])

	ldr	R4,[R11, #-12]
	ldr	R5,[R11, #-4]
	add	R4, R4, R5
	ldrsb	R4,[R4]
	mov	R5, #0

	cmp	R4,R5
	beq	L.27

@line 95,3				LcdDat(str[k]) ;

	ldr	R4,[R11, #-12]
	ldr	R5,[R11, #-4]
	add	R4, R4, R5
	ldrsb	R4,[R4]
	and	R0,R4,#255
	bl	LcdDat

@line 97,3				break ;

L.25:

@line 98,1		}

L.21:

@line 92,22	
	ldr	R4,[R11, #-12]
	add	R4, R4, #1
	str	R4, [R11, #-12]

@line 92,13	
	ldr	R4,[R11, #-12]
	mov	R5, #16

	cmp	R4,R5
	blt	L.20
	b	L.27
L.26:

@line 100,1		{


@line 101,2			LcdDat(' ') ;

	mov	R0, #32

	bl	LcdDat

@line 102,2			k ++ ;

	ldr	R4,[R11, #-12]
	add	R4, R4, #1
	str	R4, [R11, #-12]

@line 103,1		}

L.27:

@line 99,7	
	ldr	R4,[R11, #-12]
	mov	R5, #16

	cmp	R4,R5
	blt	L.26

@line 104,0	}

L.17:
	ldmfd	R11, {R4, R5, R11, sp, pc}

	.p2align 2

