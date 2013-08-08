/*
	Timer.h
	Copyright: www.spjsystems.com
	Created by Prashant on 3 Nov. 2006
	This file is part of the project "SecurityLock".
*/


#ifndef TIMER_H
#define TIMER_H


/* Prescaler */
#define PERIFERAL_OPERATING_FREQUENCY_IN_HZ	12000000
#define DESIRED_COUNT_FREQ0					1000000	//1MHz

#define PRESCALER0				((PERIFERAL_OPERATING_FREQUENCY_IN_HZ/DESIRED_COUNT_FREQ0)-1)
//#define PRESCALER1				((PERIFERAL_OPERATING_FREQUENCY_IN_HZ/DESIRED_COUNT_FREQ1)-1)

#define	TIMER0_RESET()				T0TCR=2
#define	TIMER0_ENABLE()				T0TCR=1
#define	TIMER0_DISABLE()			T0TCR=0


/* Function declrations */

extern void InitTimer (void);
extern void WaitForNextTick (void);


#endif /* TIMER_H */
