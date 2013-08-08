#include <Philips\LPC2148.h>
void SmallDelay (void)
{
}
void LcdCmd1 (unsigned char cmd)
{
	unsigned int temp ;
	IO0SET = temp = 0x0F0000 & (cmd << 16) ;
	IO0CLR = (temp ^ 0x0F0000) | 0x500000 ;
	SmallDelay() ;
	//IO0SET = 0x800000 ;
	IO0SET = 0x400000 ;
	SmallDelay() ;
	//IO0CLR = 0x800000 ;
	IO0CLR = 0x400000 ;
	SmallDelay() ;
}
void LcdDat1 (unsigned char dat)
{
	unsigned int temp ;
	IO0SET = temp = (0x0F0000 & (dat << 16)) | 0x100000 ;
	IO0CLR = (temp ^ 0x1F0000) | 0x400000 ;
	SmallDelay() ;
	//IO0SET = 0x800000 ;
	IO0SET = 0x400000 ;
	SmallDelay() ;
	//IO0CLR = 0x800000 ;
	IO0CLR = 0x400000 ;
	SmallDelay() ;
}
void Delay250 (void)
{
	int k ;
	for(k = 0 ; k < 100 ; k ++)
	{
	}
}
void DelayMs (int n)
{
	int k ;
	for(k = 0 ; k < n ; k ++)
	{
		Delay250() ;
		Delay250() ;
		Delay250() ;
		Delay250() ;
	}
}
void LcdCmd (unsigned char cmd)
{
	LcdCmd1(cmd >> 4) ;
	LcdCmd1(cmd) ;
	Delay250() ;
}
void LcdDat (unsigned char dat)
{
	LcdDat1(dat >> 4) ;
	LcdDat1(dat) ;
	Delay250() ;
}
void LcdInit (void)
{
	IO0DIR = 0x5F0000 ;
	IO0CLR = 0x5F0000 ;
	DelayMs(15) ;
	LcdCmd1(0x03) ;
	DelayMs(6) ;
	LcdCmd1(0x03) ;
	Delay250() ;
	LcdCmd1(0x03) ;
	Delay250() ;
	LcdCmd1(0x02) ;
	Delay250() ;

	LcdCmd(0x28) ;
	LcdCmd(0x08) ;
	LcdCmd(0x0c) ;
	LcdCmd(0x06) ;
}
void DisplayRow (int row, char *str)
{
/*
	pass pointer to 16 character string
	displayes the message on line1 or line2 of LCD, depending on whether row is 1 or 2.
*/
	int k ;

	if (row == 1)
		LcdCmd(0x80) ;
	else
		LcdCmd(0xc0) ;
	for(k = 0 ; k < 16 ; k ++)
	{
		if (str[k])
			LcdDat(str[k]) ;
		else
			break ;
	}
	while(k < 16)
	{
		LcdDat(' ') ;
		k ++ ;
	}
}
