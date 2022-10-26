#include <mbed.h>
#include <string.h>

UnbufferedSerial bluetooth(D8, D2, 9600);
BufferedSerial pc(USBTX, USBRX, 9600);
DigitalOut led(LED_RED);

void on_rx_interrupt();
int ledValue = 0;

int main()
{
  bluetooth.attach(&on_rx_interrupt, SerialBase::RxIrq);
  char buff[2] = "1";
  bluetooth.write(buff, 16);
  while (1)
  {
  }
}

void on_rx_interrupt()
{
  char c;
  if (bluetooth.readable())
  {
    bluetooth.read(&c, 1);
    char *token;
    token = strtok(&c, "@^");
    if (token != NULL)
    {
      pc.write(token, 4);
      int value = atoi(&c);
      if (value == 1)
      {
        led.write(1);
      }
      else if (value==0)
      {
        led.write(0);
      }
    }

    // led.write(1);
    // wait_us(500000);
    // led.write(0);
    // returned[0] = c;
    // pc.write(returned,16);

    bluetooth.write(&c, 2);
  }
}
