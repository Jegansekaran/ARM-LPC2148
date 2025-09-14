#include <LPC214X.H>

void delay(int r){

		while( r > 0 ){
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

	VPBDIV = 0X01;
	
}

void spi_init(){

	PINSEL0 |= 0X1500;//[9:8]:SCK0; [11:10]:MISO0; [13:12]:MOSI0; [15:14]:SSEL0
	
	IODIR0 |= (1 << 7); //SSEL0 -> OUTPUT
	IOSET0 |= (1 << 7); //SSRL0 -> DISABLED 
	
	S0SPCCR = 8; // 7.5MHz SCK FREQ
	S0SPCR = 0X0A24; //[2]8 BIT DATA AND [5]MASTER ACTIVATED

	
}

void SPI_Write(unsigned int data)
{
    IOCLR0 = (1 << 7);    /* Select SPI slave */
    S0SPDR = data;        /* Load data into SPI data register */
    while (!(S0SPSR & 0x80)); /* Wait until SPI transfer is complete */
    IOSET0 = (1 << 7);    /* Deselect SPI slave */
}

int main(){

	pll_init();
	spi_init();
	//delay(100);
	
	while(1){
		
		SPI_Write('9');
		delay(500000);
	
		SPI_Write('9');
		delay(500000);
	}
	
}
