#ifndef VIC_H
#define VIC_H	1
#include <Philips\LPC2214.h>

#define ISR_DONE()		(VICVECTADDR=0xFF)
#define IRQ_STATUS(i)	(VICIRQSTATUS & (1<<(i)))
#define FIQ_STATUS(i)	(VICFIQSTATUS & (1<<(i)))
#define RAW_STATUS(i)	(VICRAWINTR & (1<<(i)))

#define IRQ_SEL	0	// to go into VICIntSelect bits
#define FIQ_SEL	1

#define WDT_INT		0
#define RSVD_INT	1
#define CORE0_INT	2
#define CORE1_INT	3
#define TIMER0_INT	4
#define TIMER1_INT	5
#define UART0_INT	6
#define UART1_INT	7
#define PWM0_INT	8
#define I2C0_INT	9
#define SPI0_INT	10
#define SPI1_INT	11
#define SSP_INT	11
#define PLL_INT	12
#define RTC_INT	13
#define EINT0_INT	14
#define EINT1_INT	15
#define EINT2_INT	16
#define EINT3_INT	17
#define ADC0_INT	18
#define I2C1_INT	19
#define BOD_INT	20
#define ADC1_INT	21

void setupISR(int, int, void *, int);
void setupDefaultISR(void *func);

#endif /* VIC_H */
