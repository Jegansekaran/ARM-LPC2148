#include <pic.h>

#define _XTAL_FREQ 2000000   // 2 MHz clock frequency

#define RS RB0
#define RW RB1
#define E  RB2

// Function prototypes
//int lcd_command(unsigned char cmd);
//int lcd_data(unsigned char data);
//int lcd_string(char* str);
int lcd_command(unsigned char cmd) {
    PORTC = cmd;           
    RS = 0;                // RS = 0 for command
    RW = 0;                // RW = 0 for write
    E = 1;                 
    __delay_us(1);         
    E = 0;                 
    __delay_ms(2);         // Sufficient delay for LCD commands
	
	return 0;
}

// ---------------------
// Send Data to LCD
int lcd_data(unsigned char data) {
    PORTC = data;          
    RS = 1;                // RS = 1 for data
    RW = 0;                // RW = 0 for write
    E = 1;                 
    __delay_us(1);         
    E = 0;                 
    __delay_ms(2);         // Sufficient delay for LCD data
	
	return 0;
}

// ---------------------
// Display String on LCD
int lcd_string(char* str) {
    while (*str != '\0') {
        lcd_data(*str);
        str++;
    }

	return 0;
}


int main() {
    TRISB = 0x00;           // PORTB as output (LCD control)
    TRISC = 0x00;           // PORTC as output (LCD data)
    PORTB = 0x00;
    PORTC = 0x00;

    // --- LCD Initialization commands ---
    lcd_command(0x38);      // 8-bit mode, 2-line display, 5x7 font
    __delay_ms(5);
    
    lcd_command(0x0C);      // Display ON, Cursor OFF
    __delay_ms(5);
    
    lcd_command(0x01);      // Clear display
    __delay_ms(5);
    
    lcd_command(0x06);      // Entry mode, auto-increment cursor
    __delay_ms(5);

	lcd_command(0x80);
	__delay_ms(5); 

    while (1) {
        //lcd_command(0x80);         // Move to first line
        lcd_string("HELLO");
        __delay_ms(500);

        lcd_command(0x01);         // Clear display
        __delay_ms(500);

        //lcd_command(0xC0);         // Move to second line
        lcd_string("WORLD");
        __delay_ms(500);

        lcd_command(0x01);         // Clear display
        __delay_ms(500);
    }
	return 0;
}

// ---------------------
// Send Command to LCD
