#include <Philips\LPC2148.h>
#define	VPBDIV			(*((volatile WORD32 *) 0xE01FC100))
#define	U0RBR			(*((volatile WORD32 *) 0xE000C000))
#define DESIRED_BAUDRATE 19200
#define CRYSTAL_FREQUENCY_IN_HZ 12000000
#define PCLK CRYSTAL_FREQUENCY_IN_HZ	/* since VPBDIV=0x01	*/
#define DIVISOR (PCLK/(16*DESIRED_BAUDRATE))
void InitUart0(void)
{
	PINSEL0 = 0x00000005 ;
/*	U0LCR: UART0 Line Control Register
	0x83: enable Divisor Latch access, set 8-bit word length,
	1 stop bit, no parity, disable break transmission		*/
	U0LCR=0x83;	
/*	VPBDIV: VPB bus clock divider
	0x01: PCLK = processor clock		*/
	VPBDIV=0x01;	
/*	U0DLL: UART0 Divisor Latch (LSB)	*/
	U0DLL=DIVISOR&0xFF;	
/*	U0DLM: UART0 Divisor Latch (MSB)	*/
	U0DLM=DIVISOR>>8;	
/*	U0LCR: UART0 Line Control Register
	0x03: same as above, but disable Divisor Latch access	*/
	U0LCR=0x03 ;	
/*	U0FCR: UART0 FIFO Control Register
	0x05: Clear Tx FIFO and enable Rx and Tx FIFOs		*/
	U0FCR=0x05 ;
}
char putchar(char ch)
{
	if (ch=='\n')
	{
		//wait until Transmit Holding Register is empty
		while (!(U0LSR&0x20)) {}
		
				//then store to Transmit Holding Register
		U0THR='\r';
	}

	//wait until Transmit Holding Register is empty
	while (!(U0LSR&0x20)) {}
	//then store to Transmit Holding Register
	U0THR=ch;
	
	return ch;
}

char getchar(void)
{
	char ch;
	
	//wait until there's a character to be read
	while (!(U0LSR&0x01)) {}

	//then read from the Receiver Buffer Register
	ch=U0RBR;
	return ch;
}