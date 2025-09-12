//#include <LPC214X.H>

void pll(){

	PLL0CON = 0X01;
	
	PLL0CFG = 0X01;
	
	PLL0FEED = 0XAA;
	
	PLL0FEED = 0X55;
	
	while(!(PLL0STAT & (1 << 10)));
	
	PLL0CON = 0X03;
	
	PLL0FEED = 0XAA;
	
	PLL0FEED = 0X55;
	
	VPBDIV = 0X01;
}

void tmr(){

	T0CTCR = 0X00;
	
	T0TCR = 0X02;
	
	T0PR = 39999;
	
	T0TCR =0X01;
}

void delay(int i){

	T0TCR = 0X02;
	
	T0TCR = 0X01;
	
	T0TC = 0;
	
	while(T0TC<i);

}
