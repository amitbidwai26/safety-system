//Programme is designed by AMIT BIDWAI
//B.N.C.O.E.PUSAD
//GUIDED BY PROF S.T.KHANDARE.


#include <Philips\LPC2138.h>
#include <stdio.h>
#include "ADC.h"
#include "UART0.h"
#include "lcd.h"
#include "Inc.h"
#include "TYPE.h"
				/*	#define	PCLK_FREQUENCY	12000000
					#define	PREINT_COUNT	((PCLK_FREQUENCY / 32768) - 1)
					#define	PREFRAC_COUNT	(PCLK_FREQUENCY - ((PREINT_COUNT + 1) * 32768))
					#define AD0CHANNELNUM 1
					#define IGNORE_WRONG_TEMP 1
				*/
unsigned char g_byRecords[];
unsigned int g_uiNum = 0 ;
char line1[16];
char line2[16];
unsigned int g_uiReading = 0,g_uiRefRead = 0,PrevTempRead = 0;//,g_uiTempRead= 0 ;
float g_uiTempRead= 0;
unsigned int g_uiRawReading ;
void LcdInit () ;
void DislpayRow (int row, char *str) ;
WORD16 g_usADCData = 0 ;

void ADC_Init (void)
{   
        //PINSEL1 = 0x01000000 ;	//P0.28,AD0.1
	PINSEL1 = 0x03000000 ;	//P0.28,AD0.1 & P0.29
	PINSEL0 = 0x00000000 ;  // PINSEL(0,1,2) = 0 configures pins as GPIO
}
unsigned int ADC_GetAdcReading ()
{
	unsigned int adcdata;
	AD0CR = 0x01200302 ;
	while(!((adcdata = AD0DR) & 0x80000000))
	{
	}
	return((adcdata >> 6) & 0x3ff) ;
}

void delay(void)
{
	int i,j;
	for (i=0;i<30000;i++) ;
	
}

/*
void GetTemprature(void)
{
unsigned int uiTempRead,RawRead1 ;
unsigned char i ;
char szTemp[20] ;

		ADC_EN_CHN_0() ;			
		AD0C_SELECT_CHANNEL(1 << AD0CHANNELNUM) ; //select channel 3
		
		AD0C_START_CONV() ;
		g_usADCData  = ReadADC0Data() ;
	
		
		g_uiRawReading =g_usADCData;
		
		printf("ADCData = 0x%03lX  %u\n",g_uiRawReading,g_uiRawReading) ;
		
		for(i=0;i<600;i++)
		{
			uiTempRead = Reading[i+1] ;
			RawRead1 = Reading[i] ;
			
			if(g_uiRawReading == RawRead1)
			{
				g_uiTempRead= Tempr[i] ;
				printf(" %u\n",g_uiTempRead) ;
		
				break ;
			}	
		 }
		if (PrevTempRead != g_uiTempRead)
		{
			PrevTempRead = g_uiTempRead;
			
			printf("\nTemp Reading:\t%6.3f\n",g_uiTempRead) ;	
		}
		AD0C_DISABLE_CONV() ;
		ADC_DISABLE_CHN_0() ;		
		delay();
}
*/

void main (void)
{
	char szTemp[20] ;
	unsigned int delay, adc;
	unsigned int uiTempRead,RawRead1 ;
	unsigned char i ;
	char adcreading[16] ;
	InitUart0() ;
	LcdInit ();
	DisplayRow(1,"B.N.C.O.E.Pusad") ;
	ADC_Init() ;
	while(1)
	{
		
		g_usADCData  = ADC_GetAdcReading() ;
		
		g_uiRawReading =g_usADCData;
		
		printf("ADCData = 0x%03X  %u\n",g_uiRawReading,g_uiRawReading) ;
		
		for(i=0;i<600;i++)
		{
			uiTempRead = Reading[i+1] ;
			RawRead1 = Reading[i] ;
			
			if(g_uiRawReading == RawRead1)
			{
				g_uiTempRead= Tempr[i] ;
				
				printf("\nTemp Reading:%3.3f\n",g_uiTempRead) ;	
				
				if(g_uiTempRead>=33)
				{
								// IOxDIR: setting a bit to one designates the pin as output
					IO0DIR=0x20000000;	// P0.29is output
					IO1DIR=0x00000000;	//for F place P1.0-P1.31 are output
				
				
				//IOxSET: Writing ones produces high at the corresponding port pins. Writing zeroes has no effect.
				
				IO0CLR = 0x20000000;//P0.29 is set to low i.e 0
				
				
				}
				else
				{
				IO0DIR=0x20000000;	// P0.29is output
				IO0SET = 0x20000000; //P0.29 is set to high i.e 1
				}
				
				sprintf(adcreading,"Tempr =%3.3f",g_uiTempRead) ;
				DisplayRow(2,adcreading) ;
				
		
				break ;
			}	
		 }
		for(delay=0;delay<60000;delay++);
	}	
	
}


