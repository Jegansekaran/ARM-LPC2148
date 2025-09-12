#include <LPC214X.H>


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

void i2c_init(){
	
	PINSEL0 |= 0X50; // EN -> SCL0 & SDA0
	
	I2C0CONCLR = (1 << 2) | (1 << 3) | (1 << 4) | (1 << 5);  //clear all bits from i2c control register
	
	I2C0SCLH = 0X12C; // data rate to 100KHz from 60MHz PCLK
	I2C0SCLL = 0X12C;
	
	I2C0CONSET = (1 << 6); //ENABLE I2EN
	
}

void i2c_start(){

I2C0CONCLR = ((1 << 5) | (1 << 4)| (1 << 3)| (1 << 2));  // clear all the bits in CONCLR register
I2C0CONSET = (1 << 6 );            //Enable the I2C interface
I2C0CONSET = (1 << 5);             //set the STA bit
while ( (I2C0CONSET & 0x08) == 0 ); /* Wait till SI = 1 */
}
void i2c_write( )
{

    I2C0DAT = 0XA0;     // Write mode (last bit = 0)
    I2C0CONCLR = (1 << 3);            // Clear SI
    while (!(I2C0CONSET & (1 << 3))); // Wait for SI
    if (I2C0STAT != 0x18) return;     // SLA+W transmitted, ACK received

    // Step 2: Send High byte of memory address
    I2C0DAT = 0X00;
    I2C0CONCLR = (1 << 3);
    while (!(I2C0CONSET & (1 << 3)));
    if (I2C0STAT != 0x28) return;

    // Step 3: Send Low byte of memory address
    I2C0DAT = 0X04;
    I2C0CONCLR = (1 << 3);
    while (!(I2C0CONSET & (1 << 3)));
    if (I2C0STAT != 0x28) return;

    // Step 4: Send Data byte
    I2C0DAT = 'C';
    I2C0CONCLR = (1 << 3);
    while (!(I2C0CONSET & (1 << 3)));
    if (I2C0STAT != 0x28) return;
}

/*void i2c_read(){

	I2C0CONCLR = 
}*/

void i2c_stop(){
	
    I2C0CONSET = (1 << 4);  // STO = 1
    I2C0CONCLR = (1 << 3);  // Clear SI to allow STOP
}
	
int main(){
	
	pll_init();
	i2c_init();
	i2c_start();
	i2c_write();
	i2c_stop();
	
	while(1){
	
	}
}
