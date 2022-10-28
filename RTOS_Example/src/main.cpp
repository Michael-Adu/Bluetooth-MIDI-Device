#include <mbed.h>
#include "rtos.h"


DigitalOut led1(D7);
DigitalOut led2(D6);
Thread myThread;

void threadTask()
{
  while (1)
  {
    led2 = !led2;
    wait_us(1000000);
  }
}

int main()
{

  myThread.start(threadTask);

  while (1)
  {
    led1 = !led1;
    wait_us(500000);
  }

  return 0;
}