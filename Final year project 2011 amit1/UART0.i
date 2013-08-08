#line 1 "L:\Final year project 2011 amit\UART0.c"
#line 1 "C:\SCARM\Inc\/Philips\LPC2148.h"

#line 6 "C:\SCARM\Inc\/Philips\LPC2148.h"



	typedef unsigned long int WORD32;
	typedef unsigned short int WORD16;
	typedef unsigned char BYTE;





































































































































































































































































#line 2 "L:\Final year project 2011 amit\UART0.c"






void InitUart0(void)
{
(*((volatile WORD32 *) 0xE002C000)) = 0x00000005 ;

#line 14 "L:\Final year project 2011 amit\UART0.c"
(*((volatile WORD32 *) 0xE000C00C))=0x83;

#line 17 "L:\Final year project 2011 amit\UART0.c"
(*((volatile WORD32 *) 0xE01FC100))=0x01;

(*((volatile WORD32 *) 0xE000C000))=(12000000 /(16* 19200))&0xFF;

(*((volatile WORD32 *) 0xE000C004))=(12000000 /(16* 19200))>>8;

#line 24 "L:\Final year project 2011 amit\UART0.c"
(*((volatile WORD32 *) 0xE000C00C))=0x03 ;

#line 27 "L:\Final year project 2011 amit\UART0.c"
(*((volatile WORD32 *) 0xE000C008))=0x05 ;
}
char putchar(char ch)
{
	if (ch=='\n')
	{

		while (!((*((volatile WORD32 *) 0xE000C014))&0x20)) {}


(*((volatile WORD32 *) 0xE000C000))='\r';
	}


	while (!((*((volatile WORD32 *) 0xE000C014))&0x20)) {}

(*((volatile WORD32 *) 0xE000C000))=ch;

	return ch;
}

char getchar(void)
{
	char ch;


	while (!((*((volatile WORD32 *) 0xE000C014))&0x01)) {}


	ch=(*((volatile WORD32 *) 0xE000C000));
	return ch;
}