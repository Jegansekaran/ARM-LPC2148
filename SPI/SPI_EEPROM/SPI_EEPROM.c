#include <LPC214X.H>

void pll_init(){

	PLL0CON = 0X01;
	PLL0CFG = 0X024;
	
	PLL0FEED = 0XAA;
	PLL0FEED = 0X55;
	
	while(!(PLL0STAT & 0X400));
	
	PLL0CON = 0X03;        // Corrected from 0x01 to 0x03 to connect PLL
	PLL0FEED = 0XAA;
	PLL0FEED = 0X55;
}

void spi_init(){

	PINSEL0 = 0X1500;       // P0.4 = SCK, P0.5 = MISO, P0.6 = MOSI
	IODIR0 = (1 << 7);      // P0.7 as output for CS
	IOSET0 = (1 << 7);      // Set CS high (inactive)
	
	S0SPCCR = 8;            // SPI Clock Rate
	S0SPCR = 0X30;          // SPI Control Register: Master mode, CPOL=0, CPHA=0
}

void spi_write(unsigned int data){

	S0SPDR = data;                // Load data to be sent
	while(!(S0SPSR & 0X80));      // Wait for transfer complete
}

void eeprom_init(){

	// Write Enable
	IOCLR0 = (1 << 7);            // CS low
	spi_write(0x06);              // Write Enable command
	IOSET0 = (1 << 7);            // CS high

	// EEPROM Write Command + Address + Data
	IOCLR0 = (1 << 7);            // CS low again for write command
	spi_write(0x02);              // Write command
	spi_write(0x20);              // Address MSB
	spi_write(0x00);              // Address LSB
	spi_write('A');               // Data to write
	spi_write('B');
	spi_write('C');               
	IOSET0 = (1 << 7);            // CS high
}

int main(){

	pll_init();
	spi_init();
	eeprom_init();
	
	while(1){
		
	}
}
