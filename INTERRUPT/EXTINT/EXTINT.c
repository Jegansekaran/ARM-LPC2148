#include <LPC214X.H>

#include "delaynew.h"

//#include "lcd8bit.h"

//#include ""

#include "lcd4bit.h"

void interrupt_0()__irq{

	EXTINT = 0X1;
	IOSET0 =(0XF<<20);
	delay_fv(500,1000);
	IOCLR0 =(0XF<<20);
	delay_fv(500,1000);

} 

void interrupt_1()__irq{

	EXTINT = 0X02;
	lcd_ini();

}

void interrupt_init(){

	PINSEL0 |= 0X0C;
	
	
	
	VICVectAddr0 =(unsigned)interrupt_0;
	VICVectCntl0 =  0X20|14;
	VICIntEnable = (1<<14);
	
	PINSEL0 |= 0XC0;
	
	
	
	VICVectAddr1 =(unsigned)interrupt_1;
	VICVectCntl1 =  0X20|15;
	VICIntEnable = (1<<15);
	
	
	
}


int main(){
	
		PINSEL0=0X00000000;       // port0.0 to port0.15 used as gpio mode
		PINSEL1=0X00000000;       // port0.16 to port0.31 used as gpio mode
		PINSEL2=0X00000000;       // port1.16 to port1.32 used as gpio mode
		IO0DIR=0X0fFFFFFF;       // direction of port0.0 to port0.31 worked as output mode
		IO1DIR=0XFFFFFFFF;       // direction of port1.0 to port1.31 worked as output mode
		
		//pll();
		//tmr();
		interrupt_init();
	
	
		
		
		while(1){
		
			IOSET1 = (0X3F<<16);
			delay_ms(100000);
			IOCLR1 = (0X3F<<16);
			delay_ms(100000);
			
			IOSET1 = (0X06<<16);
			delay_ms(100000);
			IOCLR1 = (0X06<<16);
			delay_ms(100000);
			
			IOSET1 = (0X5B<<16);
			delay_ms(100000);
			IOCLR1 = (0X5B<<16);
			delay_ms(100000);
			
			IOSET1 = (0X4F<<16);
			delay_ms(100000);
			IOCLR1 = (0X4F<<16);
			delay_ms(100000);
			
			IOSET1 = (0X66<<16);
			delay_ms(100000);
			IOCLR1 = (0X66<<16);
			delay_ms(100000);
			
			IOSET1 = (0X6D<<16);
			delay_ms(100000);
			IOCLR1 = (0X6D<<16);
			delay_ms(100000);
			
			IOSET1 = (0X7D<<16);
			delay_ms(100000);
			IOCLR1 = (0X7D<<16);
			delay_ms(100000);
			
			IOSET1 = (0X07<<16);
			delay_ms(100000);
			IOCLR1 = (0X07<<16);
			delay_ms(100000);
			
			IOSET1 = (0X7F<<16);
			delay_ms(100000);
			IOCLR1 = (0X7F<<16);
			delay_ms(1000);
			
			IOSET1 = (0X6F<<16);
			delay_ms(100000);
			IOCLR1 = (0X6F<<16);
			delay_ms(100000);
	}	
}