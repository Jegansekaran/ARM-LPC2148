#include <LPC214X.H>

void delay(unsigned int i){
 
		int k = 0; 
	
		for(k; k<i; k++);
}

int main(){

		IODIR0 = 0XFF;
		
		while(1){
		
			IOSET0 = 0XC0;
			delay(100000);
			IOCLR0 = 0XC0;
			//delay(100000);
			
			IOSET0 = 0XF9;
			delay(100000);
			IOCLR0 = 0XF9;
			//delay(100000);
			
			IOSET0 = 0XA4;
			delay(100000);
			IOCLR0 = 0XA4;
			//delay(100000);
			
			IOSET0 = 0XB0;
			delay(100000);
			IOCLR0 = 0XB0;
			//delay(10000);
			
			IOSET0 = 0X99;
			delay(100000);
			IOCLR0 = 0X99;
			//delay(100000);
			
			IOSET0 = 0X92;
			delay(100000);
			IOCLR0 = 0X92;
			//delay(10000);
			
			IOSET0 = 0X82;
			delay(100000);
			IOCLR0 = 0X82;
			//delay(100000);
			
			IOSET0 = 0XF8;
			delay(100000);
			IOCLR0 = 0XF8;
			//delay(100000);
			
			IOSET0 = 0X80;
			delay(100000);
			IOCLR0 = 0X80;
			//delay(100000);
			
			IOSET0 = 0X90;
			delay(100000);
			IOCLR0 = 0X90;
			//delay(100000);
	}	
}