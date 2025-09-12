#include <LPC214X.H>

#define RS (8<<1);
#define RW (9<<1);
#define EN (10<<1);

#define R1 (20<<1);
#define R2 (21<<1);
#define R3 (22<<1);
#define R4 (23<<1);
#define C1 (24<<1);
#define C2 (25<<1);
#define C3 (26<<1);
#define C4 (27<<1);


void delay(unsigned int i){

int k = 0 ;
for(k; k<i; k++);

}

void command(unsigned char cmd){
  
	IODIR0 = 0XFFFFFFFF;
	
	IOCLR0 = 0XFF;
	IOSET0 = cmd;
	
	IOCLR0 = RS;
	IOCLR0 = RW;
	IOSET0 = EN;
	delay(100000);
	IOCLR0 = RS;
	delay(10000);
}

void data(unsigned char data){

	IODIR0 = 0XFFFFFFFF;
	
	IOCLR0 = 0XFF;
	IOSET0 = data;
	
	IOSET0 = RS;
	IOCLR0 = RW;
	IOSET0 = EN;
	delay(100000);
	IOCLR0 = EN;
	delay(10000);
}

void string(int* str){

	while(*str != '\0'){
			data(*str);
			str++;
			
	}
}

