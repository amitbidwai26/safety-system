#ifndef UART0_H
#define UART0_H
#include "Type.h"

#define INTERRUPT_UART0 1
#define MAX_BUF_LEN 256
//#define	MASK2KILL_BUFF_INDEX	0x3F

void InitUart0(void);
char getchar(void);
char putchar(char ch);
unsigned char COM1Ready(void);
void uart0ISR(void) __attribute__ ((interrupt ("IRQ")));
uint8_t Uart0Ready(void);

#endif /* UART0_H */
