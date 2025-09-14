#include <lpc214x.h>

void delay(){

	int k,j;
	
	for (k=0;k<j;k++){
	
			for(j=0;j<1275;j++){
			
		}
	}
}

int main(){
		PINSEL0 = 0X00000000;
		IODIR0 = 0X00000001;
		while(1){
				
				IOSET0 = 0X00000001;
				delay();
				IOCLR0 = 0X00000001;
				delay();
		}
}

