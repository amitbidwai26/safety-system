/*
	startup.asm
	Revison 1.1, dated 9 August 2005.
*/

.section .text
.code 32
@.globl vectors

vectors:
	b reset			@ Reset
	b .			@ Undefined instruction
	b .			@ SWI
	b .			@ Prefetch abort
	b .			@ Data abort
	b .			@ reserved vector
@ The following instruction should transfer control to
@ the vector corresponding to ISR of IRQ
@ Most ARM micro-controllers include a built-in
@ Interrupt Controller. One example is the LPC2138.
@ It includes the VIC interrupt controller.
@ It will automatically put appropriate jump address
@ into the register "VICVectAddr" - provided the VIC
@ is configured appropriately by the user.
@ So the following instruction simply copies the contents
@ of "VICVectAddr" into PC.
@ This instruction is appropriate, if you are using
@ LPC2138 micro-controller (or it's cousins)
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ NOTE: You may need to change the following instruction
@ to make it work correctly for other ARM micro-controllers.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	ldr	pc,[pc,#-0xFF0]	@ irqs (to VICVectAddr)
	b .			@ fast irqs


reset:
@ clear .bss section
	ldr r1, bss_start
	ldr r2, bss_end
	ldr r3, =0

clear_bss:
	cmp r1,r2
	strne r3,[r1],#+4
	bne clear_bss

do_init:
	ldr	r1,initdata_start	@ start address of init table
	ldr	r2,initdata_end		@ end address of init table
do1init:cmp	r1,r2
	bhs	init_done
	ldr	r0,[r1],#4	@ destination address
	ldr	r3,[r1],#4	@ number of bytes to copy
copy_loop:
	ldrb	r4,[r1],#1	@ read 1 byte from source
	strb	r4,[r0],#1	@ write 1 byte to destination
	subs	r3,r3,#1
	bne	copy_loop
@ now align the address in R1 to 4 bytes boundry
	add	r1,r1,#3
	and	r1,r1,#~3
	b	do1init
init_done:
@ init sp for supervisor (default) mode
	ldr	r13,stack_pointer

@ init sp for IRQ mode
	mrs	r0,cpsr
	bic	r1,r0,#0x1F
	orr	r1,r1,#0x012	@ IRQ mode= 0x12
	msr	cpsr_c,r1
	ldr	r13,irq_stack

@  enable IRQs & return to supervisor mode
	bic	r0,r0,#0x80	@ cpsr[7]=IRQ disable flag
	msr	cpsr_c,r0

@ run C program

	bl main

here:	b here

stack_pointer:	.word	_stack_top
irq_stack:	.word	_irq_stack_top
bss_start:	.word	__bss_start__
bss_end:	.word	__bss_end__
initdata_start:	.word	__initdata_start__
initdata_end:	.word	__initdata_end__
	.end
