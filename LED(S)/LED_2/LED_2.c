#include <LPC214X.H>

void delay(){

	int i;
	
	for(i = 0; i<1001; i++);
}


int main(){

	IODIR0 = 0XFFF77F77;
	
	if ((IOPIN0 & (1<<3)) != 0){
	
			IOSET0 = 0X100; 
	}
	
	else if ((IOPIN0 & (1<<3)) == 0){
	
			IOCLR0 = 0X100;
	}
	
	if ((IOPIN0 & (1<<7)) != 0){
	
			IOSET0 = 0X800; 
	}
	
	else if ((IOPIN0 & (1<<7)) == 0){
	
			IOCLR0 = 0X800;
	}
	
/*	else if ((IOPIN0 & (1<<15)) == 0X8000){
	
			IOSET0 = 0X400; 
	}
	
	else if (!(IOPIN0 & (1<<15)) != 0X8000){
	
			IOCLR0 = 0X400;
	}
	
	else if ((IOPIN0 & (1<<19)) == 0X80000){
	
			IOSET0 = 0Xf0000; 
	}
	
	else if (!(IOPIN0 & (1<<19)) != 0X80000){
	
			IOCLR0 = 0Xf0000;
	}*/
			
}