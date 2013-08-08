
#ifndef RTC_H
#define RTC_H


/* Time var. decoding */
#define	RTC_YEAR()			((CTIME1 & 0x0FFF0000)>>16)
#define	RTC_MONTH()			((CTIME1 & 0x0000FF00)>>8)
#define	RTC_DOM()			((CTIME1 & 0x0000001F)>>0)
#define	RTC_DOW()			((CTIME0 & 0x07000000)>>24)
#define	RTC_HOUR()			((CTIME0 & 0x001F0000)>>16)
#define	RTC_MIN()			((CTIME0 & 0x00003F00)>>8)
#define	RTC_SEC()			((CTIME0 & 0x0000003F)>>0)


/* Date time struct, used to store date and time */
typedef struct _DATE_TIME
{
	WORD32		year;
	WORD32		month;
	WORD32		dayOfWeek;
	WORD32		dayOfMonth;
	WORD32		hour;
	WORD32		minute;
	WORD32		second;	 

} DATE_TIME;

#define	DATE_TIME_SIZE	sizeof(DATE_TIME)

/* Const declarations */
extern char MonthNames[13][4];


/* Function declarations */
extern void InitRTC (void);
extern DATE_TIME GetDateTime (void);
extern WORD16 SetDateTime (DATE_TIME	newDdateTime);
extern void ShowDateTime (void);

#endif // RTC_H 


