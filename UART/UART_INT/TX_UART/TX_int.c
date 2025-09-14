#include <LPC214X.H>

void delay(long int a){

	while(a > 0){
		a--;
}
}
void pll_init(){

	PLL0CON = 0X01; 
	PLL0CFG = 0X23; // M = 4, P = 2
	PLL0FEED = 0XAA;
	PLL0FEED = 0X55;
	
	while(!(PLL0STAT & 0X400));
	
	PLL0CON = 0X03;
	PLL0FEED = 0XAA;
	PLL0FEED = 0X55;
	VPBDIV = 0X02; //20MHz

}

void serial_control(){

	PINSEL0 = 0X05;
	U0LCR = 0X83;
	U0FDR = 0X52;
	
	U0DLM = 0;
	U0DLL = 93;
	
	U0LCR = 0X03;
	
}

void sendUART(unsigned char data){

		U0THR = data;
		while(!(U0LSR & 0X40));

}

void sendstring(const char *str){

	while(*str){
		sendUART(*str++);
	}
}

int main(){

	serial_control();
	
	while(1){
	
			sendUART('1');
			delay(1000000);
		
			sendUART('0');
			delay(1000000);
		}
	}