void delay_ff()
{
    unsigned int b,v;
    for(b=0;b<600;b++)
    for(v=0;v<100;v++);
}

void delay_pf(unsigned int x)
   {
      unsigned int i,j;
      for(i=0;i<x;i++)
        for(j=0;j<153;j++);
   }

void delay_fv(unsigned int x,int y)
  {
      unsigned int i,j;
      for(i=0;i<x;i++)
          for(j=0;j<y;j++);
  }

void delay_ms(int count)
  {
      int j=0,i=0;
      for(j=0;j<count;j++)
          {
    /* At 60Mhz, the below loop introduces
        delay of 10 us*/
             for(i=0;i<35;i++);
           }
   }
