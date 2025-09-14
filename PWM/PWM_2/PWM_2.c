#include <LPC214x.H>

void delay_ms(unsigned int ms) {
    unsigned int i, j;
    for (i = 0; i < ms; i++)
        for (j = 0; j < 6000; j++); // Approx 1 ms delay
}

void pll_init() {
    PLL0CON = 0x01;
    PLL0CFG = 0x24;
    PLL0FEED = 0xAA;
    PLL0FEED = 0x55;
    while (!(PLL0STAT & (1 << 10)));
    PLL0CON = 0x03;
    PLL0FEED = 0xAA;
    PLL0FEED = 0x55;
    VPBDIV = 0x01;
}

void pwm_init() {
    PWMPR = 5999;       
    PWMMR0 = 1000;         
    PWMMCR = (1 << 1);     // Reset on MR0
    PWMPCR = (1 << 10);    // Enable PWM2 output
    PWMTCR = (1 << 1);     // Reset counter
    PWMLER = (1 << 0);     // Latch MR0
    PWMTCR = (1 << 0);  // Enable counter + PWM mode
		PWMTCR |= (1 << 3);  
}

void pwm_led() {
    
		unsigned int i = 0;
	
    for(i = 0; i < 999; i++) {
				PWMMR2 = i;
				PWMLER = (1 << 2); // Latch MR2 update
				delay_ms(10);      // Delay for visible sweep
    }
}

int main() {
    PINSEL0 = 0x00008000;  // P0.7 ? PWM2
    pll_init();
    pwm_init();

    while (1) {
        pwm_led();
    }
}
