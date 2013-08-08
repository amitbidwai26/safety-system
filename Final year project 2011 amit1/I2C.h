/*
	I2C.h
	Copyright: www.spjsystems.com
	Created by Prashant on 3 Nov. 2006
	This file is part of the project "SecurityLock".
*/


#ifndef I2C_H
#define I2C_H

/* Settings */
#define	PERIFERAL_OPERATING_FREQUENCY_IN_HZ	12000000
#define	EEPROM_OPERATING_FREQUENCY_IN_HZ	50000 
#define EEPROM_DEVADDR 						0xA0
#define	EEPROM_24C512						1		 // EEPROM IC used 
#define	EEPROM_SIZE							0xFFFF	 // Size
#define	EEPROM_WAIT_TIME_OUT				5000	 // 1msec

//EEPROM_24C02 	size 0x0000FF
//EEPROM_24C04 	size 0x0001FF
//EEPROM_24C08 	size 0x0003FF
//EEPROM_24C16 	size 0x0007FF
//EEPROM_24C32 	size 0x000FFF
//EEPROM_24C64 	size 0x001FFF
//EEPROM_24C128 size 0x003FFF
//EEPROM_24C256 size 0x007FFF
//EEPROM_24C512 size 0x00FFFF


/* Function Definations */
extern	void 	InitI2C (void);
extern	bool_t	WaitStatus (uint8_t status);
extern	bool_t 	WriteToEEPROM (uint32_t startAddr, uint8_t *ptr2arr, uint32_t len);
extern	bool_t 	ReadFromEEPROM (uint32_t startAddr, uint8_t *ptr2arr, uint32_t len);



#endif //I2C_H


