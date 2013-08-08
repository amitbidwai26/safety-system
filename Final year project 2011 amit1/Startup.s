	.equ	Top_Stack,	0x40008000

# Standard definitions of Mode bits and Interrupt (I & F) flags in PSRs

	.equ	Mode_USR,	0x10
	.equ	Mode_FIQ,	0x11
	.equ	Mode_IRQ,	0x12
	.equ	Mode_SVC,	0x13
	.equ	Mode_ABT,	0x17
	.equ	Mode_UND,	0x1B
	.equ	Mode_SYS,	0x1F

	.equ	I_Bit,	0x80	/* when I bit is set, IRQ is disabled */
	.equ	F_Bit,	0x40	/* when F bit is set, FIQ is disabled */

	.equ	UND_Stack_Size,	0x00000004
	.equ	SVC_Stack_Size,	0x00000004
	.equ	ABT_Stack_Size,	0x00000004
	.equ	FIQ_Stack_Size,	0x00000004
	.equ	IRQ_Stack_Size,	0x00000080
	.equ	USR_Stack_Size,	0x00000400

# Starupt Code must be linked first at Address at which it expects to run.

	.text
	.arm

	.global Vectors

Vectors:
	LDR	PC, CallMain_Addr	/* do NOT change this */
	LDR	PC, Loop_Addr		/* undefined interrupt handler */
	LDR	PC, Loop_Addr		/* software interrupt handler */
	LDR	PC, Loop_Addr		/* pre-fetch interrupt handler */
	LDR	PC, Loop_Addr		/* data abort interrupt handler */
	NOP				/* Reserved Vector */
	LDR	PC, [PC, #-0x0FF0]	/* IRQ handler */
/*
	the above IRQ handler is suitable LPC2000 micro-controllers.
	You may change it suitably for other micros.
*/
	LDR	PC, Loop_Addr		/* FIQ handler */

Loop_Addr:	.word	Loop
CallMain_Addr:	.word	CallMain

CallMain:
# Setup Stack for each mode

	LDR	R0, =Top_Stack

# Enter Undefined Instruction Mode and set its Stack Pointer
	MSR	CPSR_c, #Mode_UND|I_Bit|F_Bit
	MOV	SP, R0
	SUB	R0, R0, #UND_Stack_Size

# Enter Abort Mode and set its Stack Pointer
	MSR	CPSR_c, #Mode_ABT|I_Bit|F_Bit
	MOV	SP, R0
	SUB	R0, R0, #ABT_Stack_Size

# Enter FIQ Mode and set its Stack Pointer
	MSR	CPSR_c, #Mode_FIQ|I_Bit|F_Bit
	MOV	SP, R0
	SUB	R0, R0, #FIQ_Stack_Size

# Enter IRQ Mode and set its Stack Pointer
	MSR	CPSR_c, #Mode_IRQ|I_Bit|F_Bit
	MOV	SP, R0
	SUB	R0, R0, #IRQ_Stack_Size

# Enter Supervisor Mode and set its Stack Pointer
	MSR	CPSR_c, #Mode_SVC|I_Bit|F_Bit
	MOV	SP, R0
	SUB	R0, R0, #SVC_Stack_Size

# Enter User Mode and set its Stack Pointer
	MSR	CPSR_c, #Mode_USR
	MOV	SP, R0

# Setup a default Stack Limit (when compiled with "-mapcs-stack-check")
	SUB	SL, SP, #USR_Stack_Size
/*
	Finally, the C program will run in USER mode.
*/

# Relocate .data section (Copy from ROM to RAM)
	LDR	R1, =_etext
	LDR	R2, =_data
	LDR	R3, =_edata
LoopRel:CMP	R2, R3
	LDRLO	R0, [R1], #4
	STRLO	R0, [R2], #4
	BLO	LoopRel

# Clear .bss section (Zero init)
	MOV	R0, #0
	LDR	R1, =__bss_start__
	LDR	R2, =__bss_end__
LoopZI:	CMP	R1, R2
	STRLO	R0, [R1], #4
	BLO	LoopZI

	BL	main

Loop:	B	Loop

	.end
