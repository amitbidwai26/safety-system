#ifndef CALIBRATION_H
#define CALIBRATION_H

void ReadFlash(void) ;
void UpdateFlash(void);
void GenerateArray(void) ;
void GenerateParameters(void) ;
void TestWrittenParameters(void) ;

extern int g_iStatus;	
extern WORD32 g_uiIndex1;
extern BOOL g_bEraseSec ;

extern WORD32 g_uiIndex;
extern WORD32 g_uiIndex1;
extern unsigned char g_byRecordsIntoFlash[MAX_PAGE_SIZE];
extern unsigned char g_byRecordsFromFlash[MAX_PAGE_SIZE];

#endif


