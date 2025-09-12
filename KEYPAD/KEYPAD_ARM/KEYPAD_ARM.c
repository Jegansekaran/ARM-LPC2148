#include <LPC214X.H>

#define RS (1<<8)
#define RW (1<<9)
#define EN (1<<10)

#define R1 (1<<20)
#define R2 (1<<21)
#define R3 (1<<22)
#define R4 (1<<23)
#define C1 (1<<24)
#define C2 (1<<25)
#define C3 (1<<26)
#define C4 (1<<27)

void delay(unsigned int i){

	int k = 0;
	for(k ; k<i; k++);
}

void command(unsigned char cmd){

		//IODIR1 = 0XF0FFFFF;
			
		IODIR0 = 0XFFF;
	
		IOCLR0 = 0XFFF;
		IOSET0 = cmd;
		
		IOCLR0 = RS;
		IOCLR0 = RW;
		IOSET0 = EN;
		delay(10000);
		IOCLR0 = EN;
		delay(10000);
	
}

void data(unsigned char data){

		//IODIR1 = 0XF0FFFFF;
		
		IODIR0 = 0XFFF;
	
		IOCLR0 = 0XFFF;
		IOSET0 = data;
		
		IOSET0 = RS;
		IOCLR0 = RW;
		IOSET0 = EN;
		delay(10000);
		IOCLR0 = EN;
		delay(10000);
	
}

void string(char* str){

		while(*str != '\0'){
				
				data(*str);
				str++;
		}
}

void keypad(){

	IODIR1 = 0XF0FFFFF;
	
	  IOSET1 = C1;
		IOCLR1 = C2;
		IOCLR1 = C3;
		IOCLR1 = C4;
		/*IOCLR1 = R1;
		IOCLR1 = R2;
		IOCLR1 = R3;
		IOCLR1 = R4;*/
	
		if((IOPIN1 & R1) == R1){
		
				data('7');
				delay(100000);
		}
		
		else if((IOPIN1 & R2) == R2){
			
				data('8');
				delay(100000);
		}
		
		else if((IOPIN1 & R3) == R3){
			
				data('9');
				delay(100000);
		}
		
		else if((IOPIN1 & R4) == R4){
			
				data('/');
				delay(100000);
		}
	
	
	  IOSET1 = C2;
		IOCLR1 = C1;
		IOCLR1 = C3;
		IOCLR1 = C4;
		/*IOCLR1 = R1;
		IOCLR1 = R2;
		IOCLR1 = R3;
		IOCLR1 = R4;*/
		
		if((IOPIN1 & R1) == R1){
		
				data('4');
				delay(100000);
		}
		
		else if((IOPIN1 & R2) == R2){
			
				data('5');
				delay(100000);
		}
		
		else if((IOPIN1 & R3) == R3){
			
				data('6');
				delay(100000);
		}
		
		else if((IOPIN1 & R4) == R4){
			
				data('*');
				delay(100000);
		}
	
	  IOSET1 = C3;
		IOCLR1 = C1;
		IOCLR1 = C2;
		IOCLR1 = C4;
		/*IOCLR1 = R1;
		IOCLR1 = R2;
		IOCLR1 = R3;
		IOCLR1 = R4;*/
		
		if((IOPIN1 & R1) == R1){
		
				data('1');
				delay(100000);
		}
		
		else if((IOPIN1 & R2) == R2){
			
				data('2');
				delay(100000);
		}
		
		else if((IOPIN1 & R3) == R3){
			
				data('3');
				delay(100000);
		}
		
		else if((IOPIN1 & R4) == R4){
			
				data('-');
				delay(100000);
		}
	
	  IOSET1 = C4;
		IOCLR1 = C1;
		IOCLR1 = C2;
		IOCLR1 = C3;
		/*IOCLR1 = R1;
		IOCLR1 = R2;
		IOCLR1 = R3;
		IOCLR1 = R4;*/
		
		if((IOPIN1 & R1) == R1){
		
				command(0x01);
				delay(100000);
		}
		
		else if((IOPIN1 & R2) == R2){
			
				data('0');
				delay(100000);
		}
		
		else if((IOPIN1 & R3) == R3){
			
				data('=');
				delay(100000);
		}
		
		else if((IOPIN1 & R4) == R4){
			
				data('+');
				delay(100000);
		}
}

void main(){


		command(0X38);
		command(0X0C);
		command(0X06);
		command(0X80);
	
		while(1){
			keypad();
		}
}
