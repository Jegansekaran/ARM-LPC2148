#include <lpc214x.h>

// Function to implement a delay
void delay(long int a) {
    while (a > 0) {
        a--;
    }
}

void setupPLL() {
    PLL0CON = 0x01;            // Enable PLL
    PLL0CFG = 0x24;            // Multiplier and divider setup (M = 5, P = 2 for 60 MHz)
    PLL0FEED = 0xAA;           // Feed sequence
    PLL0FEED = 0x55;
    while (!(PLL0STAT & 0x00000400)); // Wait for PLL to lock
    PLL0CON = 0x03;            // Connect PLL
    PLL0FEED = 0xAA;           // Feed sequence
    PLL0FEED = 0x55;
    VPBDIV = 0x01;             // PCLK = CCLK = 60 MHz
}

// Function to configure UART
void serial_control() {
    PINSEL0 = 0x05;  // Configure TXD0 and RXD0
    U0LCR = 0x83;    // 8 data bits, 1 stop bit, no parity, and enable DLAB (Divisor Latch Access Bit)
    U0FDR =0X85;
    // Set baud rate to 9600 (PCLK = 60 MHz)
    U0DLM = 1;       // Divisor Latch High Byte
    U0DLL = 135;     // Divisor Latch Low Byte
    
    U0LCR = 0x03;    // Disable DLAB (Divisor Latch Access Bit)
}

// Function to send UART data
void sendUART(unsigned char data) {
    U0THR = data;    // Load data into the Transmit Holding Register
    while (!(U0LSR & 0x40));  // Wait for the Transmit Holding Register to be empty
}

// Function to send a string
void sendString(const char *str) {
    while (*str) {
        sendUART(*str++);  // Send each character in the string
    }
}

int main() {
    char message[] = "Hello!";  // The string to send (move this declaration here)

    setupPLL();
    serial_control();  // Initialize UART communication

    
        sendString(message);  // Send the string
        delay(1000000);       // Wait for a while before sending again
    }

