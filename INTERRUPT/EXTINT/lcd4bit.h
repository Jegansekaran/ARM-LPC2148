#define LCD (0xf<<11)
#define RS (1<<8)
#define RW (1<<9)
#define EN (1<<10)


void lcd_display(unsigned char x)
  {
unsigned int temp;
delay_ms(1000);
IO0CLR|=(RS|RW|EN|LCD);
temp=(x>>4)&0x0f;
//delay_ms(10);
 IO0SET|=RS;
 IO0CLR|=RW;
 IO0SET|=EN;
IO0CLR|=LCD;
 IO0SET|=(temp<<11);
delay_ms(100);
IO0CLR|=EN;

delay_fv(10,10);
IO0CLR|=(RS|RW|EN|LCD);
temp=x&0x0f;
//delay_ms(1000);
 IO0SET|=RS;
 IO0CLR|=RW;
 IO0SET|=EN;
IO0CLR|=LCD;
 IO0SET|=(temp<<11);
delay_ms(100);
 IO0CLR|=EN;
delay_ms(100);
  }

void cmd(unsigned char x)
  {
unsigned int temp;
delay_ms(100);
temp=(x>>4)&0x0f;
IO0CLR|=(RS|RW|EN);
 IO0CLR|=RS;
 IO0CLR|=RW;
 IO0SET|=EN;
 IO0CLR|=LCD;
 IO0SET|=(temp<<11);
 delay_ms(100);
 IO0CLR|=EN;

delay_fv(100,10);
IO0CLR|=(RS|RW|EN);
temp=x&0x0f;
 IO0SET|=(temp<<11);
 IO0CLR|=RS;
 IO0CLR|=RW;
 IO0SET|=EN;
IO0CLR|=LCD;
 IO0SET|=(temp<<11);
 delay_ms(100);
 IO0CLR|=EN;
 delay_fv(100,100);
  }

void lcd_ini()
  {
PINSEL0|=(0XFF<<8);
IO0DIR|=(0XF<<8);
cmd(0X02);
 cmd(0X28);
 // cmd(0X02);
 cmd(0x0e);
cmd(0X06);
cmd(0X01);
cmd(0X80);
  }


void lcd_str(unsigned char *str)
 {
while(*str!='\0')
  {
    lcd_display(*str);
    str++;
   }

 }