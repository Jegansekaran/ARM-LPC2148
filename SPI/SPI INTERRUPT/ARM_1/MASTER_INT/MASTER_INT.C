#include <LPC214X.H>

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
	IOSET0 |= (1 << 7);
	
	S0SPCCR = 8;
	S0SPCR = (1 << 5);
}

void spi_write(unsigned char data){

	IOCLR0 = (1 << 7);
	delay(100);
	S0SPDR = data;
	while(!(S0SPSR & 0X80));

	IOSET0 = (1 << 7);
}

int main(){

	pll_init();
	spi_init();
	
	while(1){
	
		spi_write(1);
		delay(5000000);
		
		spi_write(0);
		delay(5000000);
	
	}

}

