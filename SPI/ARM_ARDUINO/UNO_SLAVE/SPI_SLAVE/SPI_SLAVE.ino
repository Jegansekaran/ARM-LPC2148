#include <SPI.h>
int led = 3;
byte c;
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
  if (c == '8')
  {
    digitalWrite(led, HIGH);
    Serial.println(c);
  }
  else if (c == '9')
  {
    digitalWrite(led, LOW);
    Serial.println(c);
  }
  //Serial.println(c);
 
}

void loop (void)
{
   

}