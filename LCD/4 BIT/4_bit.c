#include <pic.h>

#define _XTAL_FREQ 2000000
#define RS RD0
#define RW RD1
#define EN RD2

void lcd_data(unsigned char data) {
    // Send upper nibble first (shift right to fit RB0-RB3)
    PORTB = (data >> 4) & 0x0F;
    RS = 1;
    RW = 0;
    EN = 1;
    __delay_ms(5);
    EN = 0;

    // Send lower nibble (already fits RB0-RB3)
    PORTB = data & 0x0F;
    RS = 1;
    RW = 0;
    EN = 1;
    __delay_ms(5);
    EN = 0;
}

void lcd_command(unsigned char cmd) {
    // Send upper nibble
    PORTB = (cmd >> 4) & 0x0F;
    RS = 0;
    RW = 0;
    EN = 1;
    __delay_ms(5);
    EN = 0;

    // Send lower nibble
    PORTB = cmd & 0x0F;
    RS = 0;
    RW = 0;
    EN = 1;
    __delay_ms(5);
    EN = 0;
}

void lcd_string(unsigned char *str) {
    while (*str != '\0') {
        lcd_data(*str);
        str++;
    }
}

void main() {
    TRISB = 0xF0;  // Set RB0-RB3 as output (for LCD D4-D7), RB4-RB7 as input
    PORTB = 0x00;  // Clear PORTB
    TRISD = 0x00;  // Set PORTD as output (for RS, RW, EN)
    PORTD = 0x00;  // Clear PORTD

    __delay_ms(20);  // Wait for LCD to power up

    lcd_command(0x02);  // Initialize 4-bit mode
    __delay_ms(5);
    lcd_command(40);  // 4-bit mode, 2-line, 5x7 font
    __delay_ms(5);
    lcd_command(0x0C);  // Display ON, Cursor OFF
    __delay_ms(5);
    lcd_command(0x06);  // Entry mode, move cursor right
    __delay_ms(5);

    while (1) {
        lcd_string("HELLO");
        __delay_ms(500);

        lcd_command(0x01);  // Clear display
        __delay_ms(500);

        lcd_string("WORLD");
        __delay_ms(500);

        lcd_command(1);  // Clear display
        __delay_ms(500);
    }
}
