#include <LPC214x.H>

void delay(unsigned int count) {
    unsigned int i, j;
    for (i = 0; i < count; i++)
        for (j = 0; j < 6000; j++); // Adjust for visible delay
}

int main() {
    /* Set pin functions */
    PINSEL0 = 0x00008000;         // P0.0 - P0.15 as GPIO
    PINSEL1 = 0x00000400;         // P0.21 as PWM5 (bits 10-11 = 01)
    PINSEL2 = 0x00000000;         // Port1 as GPIO

    /* Set GPIO directions: all input buttons */
    IODIR0 &= ~((1 << 15) | (1 << 16));  // P0.15, P0.16 as input
    IODIR1 &= ~((1 << 17) | (1 << 18));  // P1.17, P1.18 as input

    /* PLL Setup: Set CPU Clock to 60 MHz */
    PLL0CON = 0x01;                // Enable PLL
    PLL0CFG = 0x24;                // M=5, P=2 (12MHz * 5 = 60MHz)
    PLL0FEED = 0xAA;
    PLL0FEED = 0x55;
    while (!(PLL0STAT & (1 << 10))); // Wait for PLL lock

    PLL0CON = 0x03;                // Connect PLL as clock source
    PLL0FEED = 0xAA;
    PLL0FEED = 0x55;
    VPBDIV = 0x01;                 // PCLK = CCLK = 60 MHz

    /* PWM Initialization */
    PWMPR = 60000 - 1;             // Prescale = 1ms (Tick @1kHz)
    PWMMR0 = 10;                   // Period = 10ms => 100Hz
		//PWMMR5 = 8;
	
    PWMMCR |= (1 << 1);             // Reset TC on MR0
    PWMPCR = (1 << 13);            // Enable PWM5 output
    PWMLER |= (1 << 0);  // Latch enable for MR0 and MR5
		//PWMLER |= (1 << 5);

    PWMTCR = 0x00000009;             // Reset counter and prescaler

    while (1) {
					if (IO0PIN & (1 << 15)) {     // Button on P0.15
            PWMMR5 = 6;               // 20% duty
            PWMLER |= (1 << 5);
        } else if (IO0PIN & (1 << 16)) { // Button on P0.16
            PWMMR5 = 4;               // 40% duty
            PWMLER |= (1 << 5);
        } else if (IO1PIN & (1 << 17)) { // Button on P1.17
            PWMMR5 = 6;               // 60% duty
            PWMLER |= (1 << 5);
        } else if (IO1PIN & (1 << 18)) { // Button on P1.18
            PWMMR5 = 8;               // 80% duty
            PWMLER |= (1 << 5);
        }

        delay(10); // Simple debounce
    }
}
