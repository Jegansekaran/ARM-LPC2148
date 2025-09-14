#include <LPC214X.H>

unsigned char i = 0;

void delay(int r){

		while(r > 0){
			r--;
		}
}

void pll_init(){

	PLL0CON = 0X01;
	PLL0CFG = 0X24;
	PLL0FEED = 0XAA;
	PLL0FEED = 0X55;
	
	while(!(PLL0STAT & 0X400));
	
	PLL0CON = 0X03;
	PLL0FEED = 0XAA;
	PLL0FEED = 0X55;

}

void spi_init(){

	PINSEL0 |= 0X1500;
	
	IODIR0 |= (1 << 7);
	IOSET0|= (1 << 7);
	
	S0SPCCR = 8;
	S0SPCR = 0X20;

}

void spi_data(char* data){

	
	while(data[i] != '\0'){
	
		IOCLR0 |= (1 << 7);
		S0SPDR = data[i];
		while(!(S0SPSR & 0X80));
		IOSET0 |= (1 << 7);
		i++;
		delay(10000);
	}
	
	i = 0;
}


int main(){
	
	char message[] = "HELLO ";
	
	pll_init();
	spi_init();
	
	while(1){
	
		spi_data(message);
		//delay(500000);
	}
	
}
