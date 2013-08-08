/* ADC.h */

/*=====================================================================*/

//#define		DEBUG				1
#define 	MAX_ROW_NUM			7
#define 	MAX_COL_NUM			15

#define 	ADC_READ_TIMOUT		500		/*45*/


#define 	AD0C_SEL				0x08		/* channel 3 */
#define 	AD1C_SEL				0x20		/* channel 5*/

/*
Selects pin/s to be sampled for conversion

For LPC2138 value can be 1 to 8

Zero is equivalent to 0x01
*/

#define 	ADC_CLKDIV		4  /* (14745600 / 4) = 3686400 < 4500000 */
/*

The clock for AD should be less than or equal to 4.5MHz
ADC_CLKDIV = VPB CLOCK(PCLK) / 4500000
Range = 1 to 

*/

#define		ADC_BURTST		0
/*
	0: Conversion s/w controlled(requires 11 clocks)
	
	1: Repeated conversions at the rate selected by the CLKS fields
	
*/

#define 	ADC_CLKS		0 /*10 bit */		
/*
	Applicable for BURST mode
	0 = 11clocks/10bits
	1 = 10clocks/09bits
	7 = 04clocks/03bits
	
*/
	
#define 	ADC_PDN			1
/*
	1 = AD Convertor operational
	0 = AD Convertor in powerdown mode
*/

//#define 	ADC_TEST		0 // NA IN 2138
/*	
	0 = normal operation
	1 = digital test mode
	2 = DAC test mode
	3 = simple conversion test mode
	
*/
#define 	ADC_START		0
/*	
	0 = no start
	
	1 = start conversion now
	
	2 = Start conversion when the edge selectd by bit 27
	    occurs on P0.16/EINT0/MAT0.2/CAP0.2
	
	3 = Start conversion when the edge selectd by bit 27
	    occurs on P0.22/MAT0.0/CAP0.0
	
	4 = Start conversion when he edge selectd by bit 27
	    occurs on MAT0.1
	    
	5 = Start conversion when he edge selectd by bit 27
	    occurs on MAT0.3
	    
	
	6 = Start conversion when he edge selectd by bit 27
	    occurs on MAT1.0
	    
	
	7 = Start conversion when he edge selectd by bit 27
	    occurs on MAT1.1
	
*/

#define 	ADC_EDGE		0
/*
	Effective only when ADC_START is between 2 - 7
	0 = start conversion on a falling edge on the selected CAP/MAT signal
	1 = start conversion on a rising edge on the selected CAP/MAT signal
*/

#define 	AD0CR_VAL 	((AD0C_SEL-1)+((ADC_CLKDIV-1)*256)+(ADC_BURTST*65536)+(ADC_CLKS*131072)+(ADC_PDN*2097152)/*+(ADC_TEST*4194304)*/+(ADC_START*16777216)+(ADC_EDGE*134217728))

#define 	AD1CR_VAL 	((AD1C_SEL-1)+((ADC_CLKDIV-1)*256)+(ADC_BURTST*65536)+(ADC_CLKS*131072)+(ADC_PDN*2097152)/*+(ADC_TEST*4194304)*/+(ADC_START*16777216)+(ADC_EDGE*134217728))


#define  	AD0C_START_CONV() 		  (AD0CR = AD0CR & ~0x07000000| 0x01000000)
#define 	AD0C_SELECT_CHANNEL(val)  (AD0CR = AD0CR & ~0xFF | val)
#define		AD0C_DISABLE_CONV() 	  (AD0CR = AD0CR & ~0x07000000)

#define  	AD1C_START_CONV() 		  (AD1CR = AD1CR & ~0x07000000| 0x01000000)
#define 	AD1C_SELECT_CHANNEL(val)  (AD1CR = AD1CR & ~0xFF | val)
#define		AD1C_DISABLE_CONV() 	  (AD1CR = AD1CR & ~0x07000000)
/*
	P0.15/AD15 - ADC Channel 0
	P0.28/AD01 - ADC Channel 1
*/
#define 	ADC_EN_CHN_1()			(PINSEL0 = PINSEL0 & ~0xC0000000|0xC0000000) //P0.15/AD15 
#define 	ADC_EN_CHN_0()			(PINSEL1 = PINSEL1 & ~0x03000000|0x01000000) //P0.28/AD01 
#define 	ADC_DISABLE_CHN_1()		(PINSEL0 = PINSEL0 & ~0xC0000000)//P0.15/AD15 
#define 	ADC_DISABLE_CHN_0()		(PINSEL1 = PINSEL1 & ~0x03000000)//P0.28/AD01 


void InitADC(void) ;

void delay(void) ;
WORD16 ReadADC0Data(void);
void delay(void);
void GetTemprature(void);
//extern dateTime ;
// extern DATE_TIME	dateTime;
//extern unsigned int g_uiTempRead;
extern float g_uiTempRead;


/*=====================================================================
const unsigned char Tempr[50] =    {0,
									5,
									10,
									15,
									20,
									25,
									28,
									30,
									32,
									35,
									40,
									45,
									50,
									55,
									60,
									65,
									70,
									75,
									80,
									85,
									90,
									95,
									100,
									105,
									110,
									115,
									120,
									125,
									130,
									135,
									140,
									145,
									150,
									152,
									155,
									157,
									160,
									163,
									165,
									168,
									170,
									173,
									175,
									180,
									185,
									190,
									195,
									200} ;	*/						   	
