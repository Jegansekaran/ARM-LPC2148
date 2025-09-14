#include <SPI.h>
int led = 3;
char c = 0;
void setup (void)
{
  Serial.begin(9600);
  pinMode(led, OUTPUT);
  pinMode(MISO, OUTPUT); // have to send on master in so it set as output
  SPCR |= _BV(SPE); // turn on SPI in slave mode
  SPI.attachInterrupt(); // turn on interrupt
}

ISR (SPI_STC_vect) // SPI interrupt routine
{
   c = SPDR; // read byte from SPI Data Register

  Serial.print(c);

}

void loop (void)
{
   

}