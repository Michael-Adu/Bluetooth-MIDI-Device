#include <mbed.h>

#define UserPin PA_0
#define thread_sleep_for_TIME_MS 500
DigitalOut led1(LED4);
DigitalOut led2(LED5);
DigitalOut led3(LED6);
DigitalOut led4(LED3);
InterruptIn userPin(USER_BUTTON);

void showAllLED();
void flash_sequence();

int main() {

  userPin.rise(&showAllLED);


  while(1) {
    while(1){
      flash_sequence();
    }
    // put your main code here, to run repeatedly:
  }
}

void showAllLED(){
  led1.write(1);
  led2.write(1);
  led3.write(1);
  led4.write(1);
}

void flash_sequence(){
  while (true)
  {
    led1.write(1);
    led2.write(1);
    led3.write(1);
    led4.write(1);
    thread_sleep_for(thread_sleep_for_TIME_MS);
    led1.write(1);
    led2.write(0);
    led3.write(0);
    led4.write(0);
    thread_sleep_for(thread_sleep_for_TIME_MS);
    led1.write(0);
    led2.write(1);
    led3.write(0);
    led4.write(0);
    thread_sleep_for(thread_sleep_for_TIME_MS);
    led1.write(0);
    led2.write(0);
    led3.write(1);
    led4.write(0);
    thread_sleep_for(thread_sleep_for_TIME_MS);
    led1.write(0);
    led2.write(0);
    led3.write(0);
    led4.write(1);
    thread_sleep_for(thread_sleep_for_TIME_MS);
  }
}