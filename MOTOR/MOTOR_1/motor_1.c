#include <LPC214X.H>

int main(){


	IODIR0 = 0XFFFF;
	IODIR1 = 0X0000;
	
	while(1){
	
			if ((IOPIN1 & (1<<16)) != 0){
						
						IOSET0 = 0X10;
				}
			else{
			
				IOCLR0 = 0X10;
			}
	}
	
}