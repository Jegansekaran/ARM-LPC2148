#include <LPC214x.h>

void delay(int r){
	while(r--);
}

unsigned char data = 0;

void pll_init(){
	PLL0CON = 0x01;
	PLL0CFG = 0x22;
	PLL0FEED = 0xAA;
	PLL0FEED = 0x55;
	
	while(!(PLL0STAT & 0x00000400)); // Wait for PLL lock
	
	PLL0CON = 0x03;
	PLL0FEED = 0xAA;
	PLL0FEED = 0x55;
	
	VPBDIV = 0x01; // PCLK = CCLK / 2
}

void serial_control(){
	PINSEL0 = 0x05;         // Enable TxD0 and RxD0
	U0LCR = 0x83;           // Enable DLAB, 8-bit data
	U0DLM = 0;
	U0DLL = 234;             // For 9600 baud @36MHz PCLK
	//U0FDR = 0x1F;           // Fractional divider (optional)
	U0LCR = 0x03;           // Disable DLAB
	U0IER = 0x01;           // Enable RDA interrupt
}

__irq void uart_intr(){
	if (U0IIR & 0x04){      // RDA interrupt
		data = U0RBR;       // Read received byte
		
		if (data == '1') {
			IOSET0 = (1 << 7);
		} else if (data == '0') {
			IOCLR0 = (1 << 7);
		}
	}
	VICVectAddr = 0x00;     // Acknowledge interrupt
}

void setupUART_intr(){
	VICIntEnable = (1 << 6);         // Enable UART0 interrupt
	VICVectCntl0 = 0x20 | 6;         // Enable Slot 0, UART0 interrupt
	VICVectAddr0 = (unsigned long)uart_intr;
}

int main(){
	pll_init();
	serial_control();
	setupUART_intr();

	IODIR0 = (1 << 7); // Set P0.7 as output

	while(1){
		delay(100000);
	}
}
