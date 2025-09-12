#include <lpc21xx.h>  // Header file for LPC2148

void PLL_Init(void);
void Timer0_Init(void);
void Timer1_Init(void);

int main() {
    PINSEL0 = 0x00000000;  // Set P0.0 to P0.15 as GPIO
    IO0DIR |= (1 << 16);   // Set P0.16 as output (for LED1)
    IO0DIR |= (1 << 17);   // Set P0.17 as output (for LED2)

    PLL_Init();            // Initialize PLL for 60 MHz clock
    Timer0_Init();         // Initialize Timer0 for LED1 (0.5s delay)
    Timer1_Init();         // Initialize Timer1 for LED2 (1s delay)

    while (1) {
        // Main loop does nothing; all actions handled by interrupts
    }

    return 0;
}

void PLL_Init(void) {
    PLLCFG = 0x24;          // Configure PLL multiplier (M = 5) and divider (P = 2)
    PLLCON = 0x01;          // Enable PLL
    PLLFEED = 0xAA;         // Feed sequence
    PLLFEED = 0x55;
    while (!(PLLSTAT & (1 << 10)));  // Wait for PLL lock
    PLLCON = 0x03;          // Connect PLL
    PLLFEED = 0xAA;         // Feed sequence
    PLLFEED = 0x55;
    VPBDIV = 0x01;          // Set PCLK = CCLK (60 MHz)
}

void Timer0_ISR(void) __irq {
    IO0PIN ^= (1 << 16);    // Toggle LED1 (P0.16)
    T0IR = 0x01;            // Clear interrupt flag for Timer0
    VICVectAddr = 0;        // Signal end of interrupt
}

void Timer1_ISR(void) __irq {
    IO0PIN ^= (1 << 17);    // Toggle LED2 (P0.17)
    T1IR = 0x01;            // Clear interrupt flag for Timer1
    VICVectAddr = 0;        // Signal end of interrupt
}

void Timer0_Init(void) {
    T0TCR = 0x02;           // Reset Timer0
    T0PR = 59999;           // Set prescaler to 59,999 for 1 ms ticks (60 MHz / (PR+1))
    T0MR0 = 500;            // Match register for 0.5 seconds (1 ms * 500)
    T0MCR = 0x03;           // Interrupt and reset on match
    VICVectAddr4 = (unsigned)Timer0_ISR;  // Set Timer0 ISR address
    VICVectCntl4 = 0x20 | 4;              // Enable Timer0 interrupt
    VICIntEnable = (1 << 4);              // Enable Timer0 interrupt
    T0TCR = 0x01;           // Start Timer0
}

void Timer1_Init(void) {
    T1TCR = 0x02;           // Reset Timer1
    T1PR = 59999;           // Set prescaler to 59,999 for 1 ms ticks (60 MHz / (PR+1))
    T1MR0 = 1000;           // Match register for 1 second (1 ms * 1000)
    T1MCR = 0x03;           // Interrupt and reset on match
    VICVectAddr5 = (unsigned)Timer1_ISR;  // Set Timer1 ISR address
    VICVectCntl5 = 0x20 | 5;              // Enable Timer1 interrupt
    VICIntEnable = (1 << 5);              // Enable Timer1 interrupt
    T1TCR = 0x01;           // Start Timer1
}