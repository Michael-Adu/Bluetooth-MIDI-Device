
#include <mbed.h>

#define WAIT_TIME_MS 500
DigitalOut led1(LED4);
DigitalOut led2(LED5);
DigitalOut led3(LED6);
DigitalOut led4(LED3);

int main()
{
  while (true)
  {
    led1.write(1);
    led2.write(1);
    led3.write(1);
    led4.write(1);
    thread_sleep_for(WAIT_TIME_MS);
    led1.write(1);
    led2.write(0);
    led3.write(0);
    led4.write(0);
    thread_sleep_for(WAIT_TIME_MS);
    led1.write(0);
    led2.write(1);
    led3.write(0);
    led4.write(0);
    thread_sleep_for(WAIT_TIME_MS);
    led1.write(0);
    led2.write(0);
    led3.write(1);
    led4.write(0);
    thread_sleep_for(WAIT_TIME_MS);
    led1.write(0);
    led2.write(0);
    led3.write(0);
    led4.write(1);
    thread_sleep_for(WAIT_TIME_MS);
  }
}
