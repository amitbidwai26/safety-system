/*
	Type.h
	Copyright www.spjsystems.com
	Created by Prashant on 3 Nov. 2006
*/


#ifndef TYPE_H
#define TYPE_H

#ifndef NULL
#define NULL    (0)	
#endif

#ifndef FALSE
#define FALSE   (0)
#endif

#ifndef TRUE
#define TRUE    (1)
#endif

/* Arm data types */
typedef unsigned long int 	uint32_t; 	//ul
typedef long int		 	int32_t;	//l
typedef unsigned short int 	uint16_t;	//ui
typedef short int 			int16_t;	//n
typedef unsigned char 		uint8_t;	//by
typedef char		 		int8_t;		//ch
typedef unsigned short int	bool_t;		//b
// float 	// f
// double 	//lf
// pointer // p
// null terminated string // sz


typedef unsigned short int	BOOL;


#ifndef	ARM_WORD_SIZES
	#define ARM_WORD_SIZES
	//typedef unsigned long int 	WORD32;
	//typedef unsigned short int 	WORD16;
	//typedef unsigned char 		BYTE;
#endif


#endif  // TYPE_H 
