//#include <LPC214X.H>

#define RS (1 << 16)
#define RW (1 << 17)
#define EN (1 << 18)

void delay1(unsigned int i){
	
	int k = 0;
	for(k; k<i; k++);
	
}

void command(unsigned char cmd){
	
	IOCLR0 = (0xFF<<4);
	IOSET0 = (cmd<<4);
	
	IOCLR0 = RS;
	IOCLR0 = RW;
	IOSET0 = EN;
	delay_ms(100);
	IOCLR0 = EN;
  delay_ms(100);
	
}

void data(unsigned char data){

	IOCLR0 = (0XFF<<4);
	IOSET0 = (data<<4);
	
	IOSET0 = RS;
	IOCLR0 = RW;
	IOSET0 = EN;
	delay_ms(100);
	IOCLR0 = EN;
  delay_ms(100);
	
}

void string(char* str){

		while(*str != '\0'){
		
				data(*str);
				str++;
		}
}

void command_init(){
	
    command(0x38);      // 8-bit mode, 2-line display, 5x7 font
    //delay1(100000);
    
    command(0x0C);      // Display ON, Cursor OFF
    //delay1(100000);
    
    command(0x01);      // Clear display
    //delay1(100000);
    
    command(0x06);      // Entry mode, auto-increment cursor
    //delay1(100000);

	  command(0x80);
    //delay1(100000);

    while (1) {
			
				command(0x01); 
			
        command(0x80);         // Move to first line
        string("HELLO");
				//delay1(100000);

        //command(0x01);         // Clear display
        //delay1(100000);

        command(0xC0);         // Move to second line
        string("WORLD");
				delay_fv(1000,1000);

                // Clear display
				//delay1(100000);
    }
		
}