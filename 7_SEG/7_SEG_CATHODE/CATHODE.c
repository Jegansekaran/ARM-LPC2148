#include <LPC214X.H>

void delay(unsigned int i){
 
		int k = 0; 
	
		for(k; k<i; k++);
}

int main(){

		IODIR0 = 0XFFFF;
		
		while(1){
		
			IOSET0 = 0X3F;
			delay(100000);
			IOCLR0 = 0X3F;
			delay(10000);
			
			IOSET0 = 0X06;
			delay(100000);
			IOCLR0 = 0X06;
			delay(10000);
			
			IOSET0 = 0X5B;
			delay(100000);
			IOCLR0 = 0X5B;
			delay(10000);
			
			IOSET0 = 0X4F;
			delay(100000);
			IOCLR0 = 0X4F;
			delay(10000);
			
			IOSET0 = 0X66;
			delay(100000);
			IOCLR0 = 0X66;
			delay(10000);
			
			IOSET0 = 0X6D;
			delay(100000);
			IOCLR0 = 0X6D;
			delay(10000);
			
			IOSET0 = 0X7D;
			delay(100000);
			IOCLR0 = 0X7D;
			delay(10000);
			
			IOSET0 = 0X07;
			delay(100000);
			IOCLR0 = 0X07;
			delay(10000);
			
			IOSET0 = 0X7F;
			delay(100000);
			IOCLR0 = 0X7F;
			delay(10000);
			
			IOSET0 = 0X6F;
			delay(100000);
			IOCLR0 = 0X6F;
			delay(10000);
	}	
}