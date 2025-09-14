#include <LPC214X.H>

unsigned char data = 0; 

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
	
	while(!(PLL0STAT & 0x400));
	
	PLL0CON = 0X03;
	PLL0FEED = 0XAA;
	PLL0FEED = 0X55;
}

void spi_init(){
	
	PINSEL0 |= 0x1500;
	
	S0SPCR = 0X0000;
	S0SPCCR = 8;

}

int main(){

	IODIR0 |= (1 << 16);
	IODIR0 |= (1 << 2);   // P0.2 output

	pll_init();
	spi_init();
	
	while(1){
		
		   if(S0SPSR & (1 << 7)) {   // Check if SPIF (SPI data received)
            data = S0SPDR;        // Read received byte

            if(data == 1){
                IOSET0 = (1 << 16);   // Turn ON LED
            } else if(data == 0){
                IOCLR0 = (1 << 16);   // Turn OFF LED
            }
		
		
		}

	}
}
